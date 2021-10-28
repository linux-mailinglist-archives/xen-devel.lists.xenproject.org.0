Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4249643DE15
	for <lists+xen-devel@lfdr.de>; Thu, 28 Oct 2021 11:49:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.217758.377918 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mg21N-0006r7-1s; Thu, 28 Oct 2021 09:48:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 217758.377918; Thu, 28 Oct 2021 09:48:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mg21M-0006oD-VD; Thu, 28 Oct 2021 09:48:28 +0000
Received: by outflank-mailman (input) for mailman id 217758;
 Thu, 28 Oct 2021 09:48:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WzT0=PQ=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1mg21K-0006o3-Q6
 for xen-devel@lists.xenproject.org; Thu, 28 Oct 2021 09:48:26 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6be20bab-61d9-48c7-9ebc-9b29a977d1ae;
 Thu, 28 Oct 2021 09:48:24 +0000 (UTC)
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
X-Inumbo-ID: 6be20bab-61d9-48c7-9ebc-9b29a977d1ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1635414504;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CnFZ75dQ6xsXYjMS/S7fCNUFlHqMD2os8BP2OWgW/8E=;
  b=Q846xqrWk8XD9DQs1Wxa27ahnUIxkc0I7xqlMGbqVb7ZTZWksnYgf3NE
   mguLupj9S58C3HDhTySKvyrlnhrGny3GknNvpQUflANUBjQ0IEUI129Ha
   34XW2c3WvazbwMwxkRpZQsBR9IHF5tGk1sBQd95KxIUQ46Zj9uJVKwraa
   8=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 8tFzC1kL3YfRIxKhIZoaS0VkzHMCMocbjjwMPSJSSBBv06NwH/OOQN+qPu03dTqlAiulAvvr/w
 z60GILbu56ZpNqLaM46b3+2Xw3LcNB8BjIfsNQEJ9kTImvki9RhQo0YYauqYbf7QdCHqNEr4yR
 yJ/Qu7UpzLTCCq4oa05Fh8+s5Fp5t3OJSjkLsPfPyc/Cbmxwq3SlaQuKk721fevrH4+iN8uOwC
 TN+aG5U4gNh7hE7QmmD247kCscoThL7LWhGB7R0O/YVLlCgvDQM0OebwFkS7m3UjGzVZrqAPYV
 WunIZRSaJ2eDjG79PEdaPtk4
X-SBRS: 5.1
X-MesageID: 58467448
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:fT3Ffqybw3MvIIp6Y0h6t+eqwSrEfRIJ4+MujC+fZmUNrF6WrkUPn
 WUeUDrTMvqIajfzKtwibd609h8FvZLWy9NhQAVvqyAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnvopW1TYhSEUOZugH9IQM8aZfHAuLeNYYH1500s6w7Rp2tcAbeWRWGthh
 /uj+6UzB3f9s9JEGjp8B3Wr8U4HUFza4Vv0j3RmDRx5lAa2e0o9VfrzEZqZPXrgKrS4K8bhL
 wr1IBNVyUuCl/slIovNfr8W6STmSJaKVeSFoiI+t6RPHnGuD8H9u0o2HKN0VKtZt9mGt8JBm
 OUKpYXhcEQSJ6nTlb4NcxJkDBgraMWq+JefSZS+mcmazkmAeHrw2fR+SkoxOOX0+M4uXzsIr
 6ZBbmlQMFbT3Ipaw5riIgVors0lMMnsOpJZonx6xCvVJf0nXYrCU+PB4towMDIY25ASQ6mCO
 5pxhTxHcgbpQi9qPgouUMgXo8ChqCDtfj1apwfAzUYwyzeKl1EguFT3C/LUZd6iVchThlyfp
 G/N4yL+GB5yHMOb4SqI9DSrnOCntTjnVYwbErr+7eJjilCXwm0VCTUGVF+6p+n/gUm7M/pEM
 FAd8Ccqqak09WSoQ8P7Uhn+p2SL1jYXUsBcFOAS4wiXxq3ZpQ2eAwAsXjNHLdArqsIybTgrz
 UOS2cPkAyR1t7+YQm7b8a2bxQ5eIgBMczVEP3VdC1JYvZ+z++nfky4jUP5xIP6Fyc3sSAiz+
 CmOsyVkl5UYsdEygvDTEU/8vxqgoZ3ATwgQ7wrRX3644g4RWLNJd7BE+nCAsq4edNfxok2p+
 SFewZDHvb9m4YSlzXTVGI0w8KeVC+Fp2dE2qWVkGIU97HyT8nqncJE4DNpWdRoxbJhsldMEZ
 ibuVeJtCH17YCTCgUxfOdvZ5yEWIU7ITo2Nuhf8NYMmX3SJXFXblByCnGbJt4wXrGAikLskJ
 bCQetu2AHARBMxPlWTtGrxDieVwmHFumQs/oKwXKTz8iNJyg1bOEN843KamNLhlvMtoXi2Mq
 76zyPdmOz0ACbajM0E7AKYYLEwQLGhTOHwFg5c/SwJ3GSI/QDtJI6aImdsJItU594wIxrag1
 izsASdwlQug7UAr3C3XMxiPnpu0Bs0hxZ/6VARxVWuVN48LOtfysv1HLcJrLdHKNoVLlJZJc
 hXMQO3Yatwnd9gN0211gUDVoNMweRK1qxiJOib5MjEzc4Q5H17C+8P+fxup/y4LV3Llucw7q
 rym9wXaXZtcGFgyUJeIMKqinwGroHwQuONuRE+UcNNdT1rhrdpxICvrg/5pf8xVcUffxiGX3
 hq9CAsDobWfuJc89dTE3PjWr4qgH+ZkMFBdGm3XseS/OSXApzLxyo5cSueYOzvaUTqsqqmlY
 OxUydD6MeEGwwkW49YtTe4zwPtntdX1prJcwgB1J1nxbgymWuF6P32L/chTrakRlLVXjhS7B
 xCU8d5ANLTXZM68SAwNJBAoZ/io3O0PnmWA9uw8JUj36XMl/LeDVkkObRCAhDYEcelwOYIhh
 +wgpNQX+0q0jR9zaoSKiSVd9mKtKH0cUvp46sFGUdGz0gd7mEtfZZH8CzPt5MDdYtpBBUAmP
 zuIifeQnL9b3EfDLyI+GHWlMTCxXnjSVMSmFGM/Gmk=
IronPort-HdrOrdr: A9a23:+Yl2zKGA62x5gytGpLqE6MeALOsnbusQ8zAXP0AYc3Jom+ij5q
 STdZUgpHrJYVkqNU3I9ertBEDEewK6yXcX2/hyAV7BZmnbUQKTRekIh7cKgQeQeBEWntQts5
 uIGJIeNDSfNzdHsfo=
X-IronPort-AV: E=Sophos;i="5.87,189,1631592000"; 
   d="scan'208";a="58467448"
Date: Thu, 28 Oct 2021 10:48:20 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: <cardoe@cardoe.com>, <xen-devel@lists.xenproject.org>,
	<iwj@xenproject.org>, <wl@xen.org>, <andrew.cooper3@citrix.com>, "Stefano
 Stabellini" <stefano.stabellini@xilinx.com>
Subject: Re: Solving the gitlab-ci git fetch issue, was: [PATCH 3/3]
 automation: add a QEMU based x86_64 Dom0/DomU test
Message-ID: <YXpx5PJwZoJQ6YIy@perard>
References: <alpine.DEB.2.21.2110210831470.2311@sstabellini-ThinkPad-T480s>
 <20211021230839.10794-3-sstabellini@kernel.org>
 <YXK2lTWZHiTXIBtJ@perard>
 <alpine.DEB.2.21.2110221219520.2311@sstabellini-ThinkPad-T480s>
 <YXbXwjxHPNjSAKrG@perard>
 <alpine.DEB.2.21.2110251754210.4586@sstabellini-ThinkPad-T480s>
 <YXlbOjiphjN/XqMz@perard>
 <alpine.DEB.2.21.2110271437120.20134@sstabellini-ThinkPad-T480s>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2110271437120.20134@sstabellini-ThinkPad-T480s>

On Wed, Oct 27, 2021 at 02:43:46PM -0700, Stefano Stabellini wrote:
> On Wed, 27 Oct 2021, Anthony PERARD wrote:
> > > But we do have a severe problem at the moment with external sources: our
> > > "git clones" keep failing during the build on x86. That is definitely
> > > something worth improving (see my other email thread on the subject) and
> > > it is the main problem affecting gitlab-ci at the moment, I keep having
> > > to restart jobs almost daily to get the overall pipeline to "pass".
> > > 
> > > If you have any ideas on how to stop fetching things using "git" from
> > > external repositories in gitlab-ci that would be fantastic :-)
> > > The only thing I could think of to "fix it" is moving all external repos
> > > to gitlab repositories mirrors.
> > 
> > I don't think that would work, I've seen the initial clone/fetch of a
> > job fail as well, so from gitlab. If we could have a cache of those
> > external resources closer to the runners, that would be better.
> 
> You mean like a git repository mirror inside the Rackspace network (the
> provider of the x86 runner), right? Then we would force the git client
> to go to the Rackspace mirror instead of directly to the target using
> "insteadOf".

That would seems the best to me. If we could install Ian's
git-cache-proxy that is used in osstest, that would be good I think.
Having a mirror instead might work too but that would mean figure out
which repo we would need a mirror of.

I did try a different alternative a while back, I tried to use gitlab's
caching capability:
    automation: Cache sub-project git tree in build jobs
    https://lore.kernel.org/xen-devel/20191219144217.305851-3-anthony.perard@citrix.com/
It mostly works but I'm not sure how useful it is as it seems there is
10 computers that would maintain 10 different caches, and most of them
for a short while.

> Is that what you meant? Doug, do you think it would work?

-- 
Anthony PERARD

