Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB5F7EB8E8
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 22:47:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.633281.987964 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r31Fk-0002VA-Tq; Tue, 14 Nov 2023 21:47:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 633281.987964; Tue, 14 Nov 2023 21:47:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r31Fk-0002TB-Qq; Tue, 14 Nov 2023 21:47:24 +0000
Received: by outflank-mailman (input) for mailman id 633281;
 Tue, 14 Nov 2023 21:47:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wE9C=G3=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r31Fj-0002Qb-ES
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 21:47:23 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 63d91f55-8337-11ee-98db-6d05b1d4d9a1;
 Tue, 14 Nov 2023 22:47:21 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id D4037B8167D;
 Tue, 14 Nov 2023 21:47:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8984C433C7;
 Tue, 14 Nov 2023 21:47:18 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 63d91f55-8337-11ee-98db-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699998439;
	bh=kvo00L80mlsk16oFNuTlxjuMYpV58scoAI3P8psuiFw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=YuZq2ezywuOyBC7s0BQY5xzOeIDVXbU9pfE8POAZuG1KwtD0ZUgZu5ROItSyw+Fde
	 CslALWqMsnUSSXUIg5C/A0JkNVCel264dGMhuu7ZWg0nAEJBi5KsKzbDhXpBCXXx9m
	 XakMpEQ4x8+KjBbDtxAyDSr/pzF7iRwvzWcpvaxP1Hv9IoKPLCfuJRKC6TRgD0em3W
	 tVNd3O7NszbyPCSYvpCe6u/w3XKaU4J7d+QLzL7pjcWvBbpo5x+52I5p5ZM6PR4Kiz
	 P6VZiT5HtgTOfePKETH8H5ZNxqkWCIIAhcSvLvCivbCVIPVYM+2uj52HqtNd/86xte
	 RKCdGw65jqmPQ==
Date: Tue, 14 Nov 2023 13:47:17 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
cc: Anthony PERARD <anthony.perard@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH] automation: set architecture in docker files
In-Reply-To: <ZVOmt3FI1qzyn6UM@macbook.local>
Message-ID: <alpine.DEB.2.22.394.2311141342040.160649@ubuntu-linux-20-04-desktop>
References: <20231113155701.52052-1-roger.pau@citrix.com> <alpine.DEB.2.22.394.2311131608200.160649@ubuntu-linux-20-04-desktop> <ZVM3Ujf1nsws3Mxr@macbook.local> <886f6adb-5651-4c69-9d0b-ff68b5a1b094@perard> <ZVOmt3FI1qzyn6UM@macbook.local>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1938329662-1699998439=:160649"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1938329662-1699998439=:160649
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 14 Nov 2023, Roger Pau Monné wrote:
> On Tue, Nov 14, 2023 at 03:00:17PM +0000, Anthony PERARD wrote:
> > On Tue, Nov 14, 2023 at 10:01:06AM +0100, Roger Pau Monné wrote:
> > > On Mon, Nov 13, 2023 at 04:10:24PM -0800, Stefano Stabellini wrote:
> > > > On Mon, 13 Nov 2023, Roger Pau Monne wrote:
> > > > > Pass the desired architecture of the image in the FROM instruction if the
> > > > > image is possibly multi-platform.
> > > > > 
> > > > > This allows using the x86 Dockerfiles on OS X on arm64 hardware.
> > > > > 
> > > > > No functional change intended.
> > > > > 
> > > > > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > > > 
> > > > Although I am not opposed to this change, so far we have been using:
> > > > arm64v8/alpine:3.18
> > > > 
> > > > for x86 it is not specified but it would be:
> > > > amd64/alpine:3.18
> > > > 
> > > > Two options:
> > > > 1) we add amd64/ everywhere and leave the arm containers alone
> > > > 2) we change all containers, including the arm containers, to use the
> > > > --platform option
> > > > 
> > > > I don't think is a good idea to have 2 different ways to specify the
> > > > architecture for x86 and arm containers
> > > 
> > > I'm not an expert on this, but attempting to use (2):
> > > 
> > > -FROM arm64v8/alpine:3.18
> > > +FROM --platform=linux/arm64v8 alpine:3.18
> > > 
> > > Does not work for me:
> > > 
> > > % make -C automation/build alpine/3.18-arm64v8
> > > docker build --pull -t registry.gitlab.com/xen-project/xen/alpine:3.18-arm64v8 -f alpine/3.18-arm64v8.dockerfile alpine
> > > [+] Building 1.4s (3/3) FINISHED                                                  docker:desktop-linux
> > >  => [internal] load .dockerignore                                                                 0.0s
> > >  => => transferring context: 2B                                                                   0.0s
> > >  => [internal] load build definition from 3.18-arm64v8.dockerfile                                 0.0s
> > >  => => transferring dockerfile: 818B                                                              0.0s
> > >  => ERROR [internal] load metadata for docker.io/library/alpine:3.18                              1.4s
> > > ------
> > >  > [internal] load metadata for docker.io/library/alpine:3.18:
> > > ------
> > > 3.18-arm64v8.dockerfile:1
> > > --------------------
> > >    1 | >>> FROM --platform=linux/arm64v8 alpine:3.18
> > >    2 |     LABEL maintainer.name="The Xen Project" \
> > >    3 |           maintainer.email="xen-devel@lists.xenproject.org"
> > > --------------------
> > > ERROR: failed to solve: alpine:3.18: no match for platform in manifest sha256:eece025e432126ce23f223450a0326fbebde39cdf496a85d8c016293fc851978: not found
> > > make: *** [alpine/3.18-arm64v8] Error 1
> > > 
> > > That's why I've left the prefixed images alone.
> > > 
> > > I could prefix the x86 images with amd64/ if that's preferred, I
> > > didn't try that option, as the Docker manual suggested using
> > > --platform.
> > 
> > So a few things to know, "--platform=linux/amd64" just select a
> > different build of one container. For example, for the "alpine"
> > containers, you can see all the different builds available on the docker
> > hub, here a few links:
> > - Official Docker, Alpine images, home:
> >   https://hub.docker.com/_/alpine
> > - The different builds: 
> >   https://hub.docker.com/_/alpine/tags
> > 
> > So, for amd64v8, you probably want --platform=linux/arm64/v8
> 
> Interesting, I guess I was looking at an outdated documentation that
> stated the tag as arm64v8 instead of arm64/v8.
> 
> > 
> > Then, they are per-architecture repository that make it easier to deal
> > with foreign architecture, and probably maintained by a different
> > community. e.g. for alpine arm64v8:
> >     https://hub.docker.com/r/arm64v8/alpine/
> > 
> > Those provide a build for a single architecture.
> 
> Right, so those two are not actually the same image.  I wonder whether
> we would want to uniformly switch to using --platform when possible,
> in order to make sure we are using the same (multi arch) image to
> avoid surprises.
> 
> > 
> > 
> > Sometime, you actually need to "--platform=*" to select a particular
> > architecture, like I did for "jessie-i386.dockerfile".
> > 
> > 
> > One thing I've notice when using --platform is that, if for example I
> > use the container "--platform=linux/amd64 alpine:3" then
> > "--platform=linux/arm/v6 alpine:3"; later when I only specify
> > "alpine:3", it's going to be the armv6, and I think docker is going to
> > complain if I try tu use "--platform=linux/amd64 alpine:3" without
> > "docker pull" first (or I guess docker build --pull).
> > 
> > Hope that help.
> > 
> > So I guess using containers "amd64/*" or "arm64v8/*" is fine, but
> > sometime will need to use "--platform=*".
> 
> My take is that it's better to use --platform when possible, as then
> all platforms share the same image, and the contents of the image
> should be more consistent.
> 
> I guess we could see about switching some of the image that currently
> use a prefix (like the Alpine one) in order to instead use --platform
> and share the same image.  I wouldn't want to do it in this patch
> however, as the change presented here should be non-functional, while
> switching to the multi arch image might introduce changes.

I am OK with any way forward as long as we are consistent across
architectures.

If you don't want to change the existing arm64v8 prefixes, I am fine
with that, but then I would ask you to use the amd64 prefix not to break
consistency (do not use --platform).

After that, if you prefer to use --platform, I am totally fine with that
too and it can be a follow-up patch changing the containers of both
architectures.
--8323329-1938329662-1699998439=:160649--

