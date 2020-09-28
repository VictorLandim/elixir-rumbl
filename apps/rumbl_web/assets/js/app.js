
import "../css/app.scss"

import { Socket } from "phoenix"
import socket from "./socket"

import "phoenix_html"

import Player from './player'
import Video from './video'

const video = document.getElementById("video")
Video.init(socket, video)