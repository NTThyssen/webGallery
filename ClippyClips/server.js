require('dotenv').config();
const express = require('express');
const axios = require('axios');
const path = require('path');

const app = express();
const port = 3003;

// Serve static files in the "public" folder
app.use(express.static(path.join(__dirname, 'public')));

app.listen(port, () => {
  console.log(`Server running at https://clips.justjoew.com:${port}`);
});

// Cached data for optimization
let cachedClips = [];
let lastFetched = 0;

// Function to get the OAuth token (cached to avoid redundant requests)
let cachedAccessToken = null;
let tokenExpiry = 0;

// Call this function with the broadcaster ID to verify
verifyUserById('763795097'); // Replace with the ID you want to verify

// Initial refresh
refreshClipsCache();

// Set an interval to refresh cache periodically
setInterval(refreshClipsCache, 24 * 60 * 60 * 1000); // Refresh once a day //

// Endpoint to serve clips data to the frontend
app.get('/clips', async (req, res) => {
  try {
    // Shuffle the cached clips to maintain randomness
    const shuffledClips = shuffleArray([...cachedClips]);
    res.json(shuffledClips);
  } catch (error) {
    console.error('Error fetching clips:', error);
    res.status(500).json({ error: 'Failed to fetch clips' });
  }
});

// Function to refresh clips cache
async function refreshClipsCache() {
  try {
    cachedClips = await getAllClips();
    lastFetched = Date.now();
    console.log(`Clips cache refreshed at ${new Date(lastFetched)}`);
  } catch (error) {
    console.error('Failed to refresh clips cache:', error);
  }
}

async function getOAuthToken() {
  if (cachedAccessToken && Date.now() < tokenExpiry) {
    return cachedAccessToken;
  }

  const { TWITCH_CLIENT_ID, TWITCH_CLIENT_SECRET } = process.env;
  const tokenResponse = await axios.post('https://id.twitch.tv/oauth2/token', null, {
    params: {
      client_id: TWITCH_CLIENT_ID,
      client_secret: TWITCH_CLIENT_SECRET,
      grant_type: 'client_credentials',
    },
  });

  cachedAccessToken = tokenResponse.data.access_token;
  tokenExpiry = Date.now() + tokenResponse.data.expires_in * 1000;

  return cachedAccessToken;
}

// Function to fetch all clips from the Twitch API
async function getAllClips() {
  const { TWITCH_CLIENT_ID, TWITCH_CHANNEL_NAME } = process.env;
  let clips = [];
  let cursor = null;

  try {
    const accessToken = await getOAuthToken();

    // Fetch clips across multiple pages
    do {
      const response = await axios.get('https://api.twitch.tv/helix/clips', {
        headers: {
          'Client-ID': TWITCH_CLIENT_ID,
          Authorization: `Bearer ${accessToken}`,
        },
        params: {
          broadcaster_id: TWITCH_CHANNEL_NAME,
          first: 100, // Max clips per page
          after: cursor,
        },
      });

      // Append fetched clips to the main clips array
      clips = clips.concat(response.data.data);

      // Get the cursor for the next page, if it exists
      cursor = response.data.pagination.cursor;
    } while (cursor && clips.length < 1000); // Limit to 1000 clips to avoid excessive data

    console.log(`Total number of clips fetched: ${clips.length}`);

    // Get unique game IDs
    const gameIds = [...new Set(clips.map((clip) => clip.game_id).filter(Boolean))];

    // Fetch game names
    const gameNames = await fetchGameNames(gameIds);

    clips = clips.map((clip) => ({
      ...clip,
      game_name: gameNames[clip.game_id] || 'Unknown Game',
    }));


    return clips;
  } catch (error) {
    console.error('Error fetching clips:', error.response ? error.response.data : error.message);
    return [];
  }
}

// Fetch game names using game IDs
async function fetchGameNames(gameIds) {
  const { TWITCH_CLIENT_ID, TWITCH_CLIENT_SECRET } = process.env;
  const accessTokenResponse = await axios.post('https://id.twitch.tv/oauth2/token', null, {
    params: {
      client_id: TWITCH_CLIENT_ID,
      client_secret: TWITCH_CLIENT_SECRET,
      grant_type: 'client_credentials',
    },
  });
  const accessToken = accessTokenResponse.data.access_token;

  try {
    const response = await axios.get('https://api.twitch.tv/helix/games', {
      headers: {
        'Client-ID': TWITCH_CLIENT_ID,
        Authorization: `Bearer ${accessToken}`,
      },
      params: {
        id: gameIds,
      },
    });

    const gameData = {};
    response.data.data.forEach((game) => {
      gameData[game.id] = game.name;
    });

    return gameData;
  } catch (error) {
    console.error('Error fetching game names:', error.response ? error.response.data : error.message);
    return {};
  }
}

// Function to verify user by ID 
async function verifyUserById(userId) {
  try {
    const accessToken = await getOAuthToken();
    const { TWITCH_CLIENT_ID } = process.env;

    const userResponse = await axios.get('https://api.twitch.tv/helix/users', {
      headers: {
        'Client-ID': TWITCH_CLIENT_ID,
        Authorization: `Bearer ${accessToken}`,
      },
      params: {
        id: userId,
      },
    });

    const userData = userResponse.data.data[0];
    if (userData) {
      console.log(`Verified User: ${userData.display_name} (ID: ${userData.id})`);
    } else {
      console.log('No user found with that ID.');
    }
  } catch (error) {
    console.error('Error verifying user by ID:', error.response ? error.response.data : error.message);
  }
}

// Function to shuffle an array (Fisher-Yates Shuffle)
function shuffleArray(array) {
  for (let i = array.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1));
    [array[i], array[j]] = [array[j], array[i]];
  }
  return array;
}
