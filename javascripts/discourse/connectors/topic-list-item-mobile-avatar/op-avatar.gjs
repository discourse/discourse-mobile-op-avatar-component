import avatar from "discourse/helpers/avatar";

<template>
  <a
    href={{@outletArgs.topic.lastPostUrl}}
    data-user-card={{@outletArgs.topic.creator.username}}
  >{{avatar @outletArgs.topic.creator imageSize="large"}}</a>
</template>
