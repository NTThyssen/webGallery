require('dotenv').config();
const express = require('express');
const axios = require('axios');
const path = require('path');

const app = express();
const port = 3003;

// Serve static files in the "public" folder
app.use(express.static(path.join(__dirname, 'public')));

// Function to get clips from the Twitch API
async function getClips() {
    const { TWITCH_CLIENT_ID, TWITCH_CLIENT_SECRET, TWITCH_CHANNEL_NAME } = process.env;
  
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
        console.log('Access Token:', accessToken); // Log the token to confirm it's being generated

        // Step 2: Use the token to get clips starting from August 1, 2024
        const clipsResponse = await axios.get(`https://api.twitch.tv/helix/clips`, {
            headers: {
                'Client-ID': TWITCH_CLIENT_ID,
                Authorization: `Bearer ${accessToken}`,
            },
            params: {
                broadcaster_id: TWITCH_CHANNEL_NAME,
                first: 10, // Number of clips to fetch
                started_at: '2024-09-01T00:00:00Z' // Starting date in ISO format (August 1, 2024)
            },
        });

        console.log('Clips Response:', clipsResponse.data); // Log the response to check the data
        return clipsResponse.data.data;
    } catch (error) {
        console.error('Error fetching clips:', error.response ? error.response.data : error.message);
        return [];
    }
}


// Endpoint to serve clips data to the frontend
app.get('/clips', async (req, res) => {
  try {
    const clips = await getClips();
    res.json(clips);
  } catch (error) {
    console.error('Error fetching clips:', error);
    res.status(500).json({ error: 'Failed to fetch clips' });
  }
});
/*
async function getBroadcasterId(username) {
    const { TWITCH_CLIENT_ID, TWITCH_CLIENT_SECRET } = process.env;
    
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
  
      // Step 2: Get the user information to find the broadcaster ID
      const userResponse = await axios.get('https://api.twitch.tv/helix/users', {
        headers: {
          'Client-ID': TWITCH_CLIENT_ID,
          Authorization: `Bearer ${accessToken}`,
        },
        params: {
          login: username, // Twitch username
        },
      });
  
      const userId = userResponse.data.data[0]?.id;
      console.log(`Broadcaster ID for ${username} is: ${userId}`);
      return userId;
    } catch (error) {
      console.error('Error fetching broadcaster ID:', error.response ? error.response.data : error.message);
    }
  }
  
  // Call this function with the username to get the ID
  getBroadcasterId('scatratt');

app.listen(port, () => {
  console.log(`Server running at http://localhost:${port}`);
});

async function verifyUserById(userId) {
    const { TWITCH_CLIENT_ID, TWITCH_CLIENT_SECRET } = process.env;
  
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
  
      // Step 2: Use the token to get user information by ID
      const userResponse = await axios.get('https://api.twitch.tv/helix/users', {
        headers: {
          'Client-ID': TWITCH_CLIENT_ID,
          Authorization: `Bearer ${accessToken}`,
        },
        params: {
          id: userId, // Use the broadcaster ID here
        },
      });
  
      const userData = userResponse.data.data[0];
      if (userData) {
        console.log(`Verified User: ${userData.display_name} (ID: ${userData.id})`);
        console.log(`User Bio: ${userData.description}`);
        console.log(`Profile Image: ${userData.profile_image_url}`);
      } else {
        console.log('No user found with that ID.');
      }
    } catch (error) {
      console.error('Error verifying user by ID:', error.response ? error.response.data : error.message);
    }
  }
  
  // Call this function with the broadcaster ID to verify
  verifyUserById('763795097'); // Replace with the ID you want to verify


*/
