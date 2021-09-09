import React from 'react';
import './App.css';
import {createTheme, ThemeProvider} from '@material-ui/core/styles';
import {Typography} from "@material-ui/core";

const theme = createTheme({
    typography: {
        fontFamily: [
            'Cambay',
            'Montserrat',
            'NTR',
        ].join(','),
      h1: {
          fontFamily: 'NTR'
      }
    }
});

function App() {
    return (
        <ThemeProvider theme={theme}>
          <Typography variant={"h1"}>TEST</Typography>
        </ThemeProvider>
    );
}

export default App;
