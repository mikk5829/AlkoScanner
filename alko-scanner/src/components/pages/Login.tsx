import React from 'react';
import {Button, Grid, Input, TextField, Typography} from "@material-ui/core";

export default function Login() {
    return (
        <Grid
            container
            spacing={0}
            direction="column"
            alignItems="center"
            justify="center"
            style={{ minHeight: '100vh' }}
        >
            <Grid container item xs={9} spacing={3}>
                <Grid item>
                    <Typography variant={"h4"}>Login</Typography>
                </Grid>
                <Grid item>
                    <TextField variant={"outlined"} fullWidth placeholder={"User name"}/>
                    <TextField variant={"outlined"} fullWidth placeholder={"Password"} type={"password"}/>
                </Grid>
                <Grid item>
                    <Button variant={"contained"} color={"primary"} fullWidth>Login</Button>
                    <Button color={"primary"} fullWidth>Create user</Button>
                    <Button color={"primary"} fullWidth>Continue without user</Button>
                </Grid>
            </Grid>

        </Grid>
    )
}