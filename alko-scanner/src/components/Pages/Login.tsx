import React from 'react';
import {Button, Grid, Input, Typography} from "@material-ui/core";

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
            <Grid item xs={9}>
                <Typography variant={"h3"}>Login</Typography>
                <Input fullWidth placeholder={"User name"}></Input>
                <Input fullWidth placeholder={"Password"} type={"password"}></Input>
                <Button variant={"contained"} color={"primary"} fullWidth>Log in</Button>
                <Button color={"primary"} fullWidth>Create user</Button>
                <Button color={"primary"} fullWidth>Continue without user</Button>
            </Grid>

        </Grid>
    )
}