import React from 'react';
import './App.css';
import {createTheme, ThemeProvider} from '@material-ui/core/styles';
import {Button, Typography} from "@material-ui/core";
import {
    BrowserRouter as Router,
    Switch,
    Route,
    Link
} from "react-router-dom";
import Login from './components/pages/Login';

const theme = createTheme({
    overrides: {
        MuiTextField: {
            root: {
            }
        },
    },
    palette: {
        primary: {
            light: "#F36664",
            main: "#D90429",
            dark: "#9C0239",
            contrastText: "#FFFFFF"
        },
        success: {
            light: "#B0E16E",
            main: "#569E17",
            dark: "#30710B",
            contrastText: "#FFFFFF"
        },
    },
    typography: {
        fontFamily: [
            'Cambay',
            'Montserrat',
            'NTR',
        ].join(','),
        h1: {
            fontFamily: 'NTR'
        },
        h2: {
            fontFamily: 'NTR'
        },
        h3: {
            fontFamily: 'NTR'
        },
        h4: {
            fontFamily: 'NTR'
        },
        button: {
            fontFamily: 'Montserrat',
            fontWeight: 'bold',
            fontSize: '13px',
        }
    }
});

function App() {
    return (
        <ThemeProvider theme={theme}>
            <Router>
                <Switch>
                    <Route path="/login">
                        <Login />
                    </Route>
                    <Route path="*">
                        <Typography>Not Found</Typography>
                    </Route>
                </Switch>
            </Router>
        </ThemeProvider>
    );
}

export default App;
