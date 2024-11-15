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

// Function to shuffle an array (Fisher-Yates Shuffle)
function shuffleArray(array) {
  for (let i = array.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1));
    [array[i], array[j]] = [array[j], array[i]];
  }
  return array;
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

// Function to get all clips from the Twitch API
async function getAllClips() {
  const { TWITCH_CLIENT_ID, TWITCH_CLIENT_SECRET, TWITCH_CHANNEL_NAME } = process.env;
  let clips = [];
  let cursor = null; // For pagination

  try {
    // Step 1: Get an OAuth token
    const tokenResponse = await axios.post('https://id.twitch.tv/oauth2/token', null, {
      params: {
        client_id: TWITCH_CLIENT_ID,
        client_secret: TWITCH_CLIENT_SECRET,
        grant_type: 'client_credentials',
      },
    });
    const accessToken = tokenResponse.data.access_token;

    // Step 2: Use the token to fetch clips across multiple pages
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

    // Get unique game IDs
    const gameIds = [...new Set(clips.map((clip) => clip.game_id).filter(Boolean))];

    // Fetch game names
    const gameNames = await fetchGameNames(gameIds);

    // Add game names to clips
    clips = clips.map((clip) => ({
      ...clip,
      game_name: gameNames[clip.game_id] || 'Unknown Game',
    }));

    // Shuffle the collected clips to add randomness
    clips = shuffleArray(clips);

    // Optionally, limit to a smaller number for the response (e.g., 50 random clips)
    return clips.slice(0, 100);
  } catch (error) {
    console.error('Error fetching clips:', error.response ? error.response.data : error.message);
    return [];
  }
}

// Endpoint to serve clips data to the frontend
app.get('/clips', async (req, res) => {
  try {
    const clips = await getAllClips();
    res.json(clips);
  } catch (error) {
    console.error('Error fetching clips:', error);
    res.status(500).json({ error: 'Failed to fetch clips' });
  }
});


async function verifyUserById(userId) {
  const { TWITCH_CLIENT_ID, TWITCH_CLIENT_SECRET } = process.env;

  try {
    const tokenResponse = await axios.post('https://id.twitch.tv/oauth2/token', null, {
      params: {
        client_id: TWITCH_CLIENT_ID,
        client_secret: TWITCH_CLIENT_SECRET,
        grant_type: 'client_credentials',
      },
    });
    const accessToken = tokenResponse.data.access_token;

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

// Call this function with the broadcaster ID to verify
verifyUserById('763795097'); // Replace with the ID you want to verify
