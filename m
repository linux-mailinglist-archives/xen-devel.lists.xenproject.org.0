Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1368B699D90
	for <lists+xen-devel@lfdr.de>; Thu, 16 Feb 2023 21:20:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.496762.767631 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSkj8-00049F-Mj; Thu, 16 Feb 2023 20:19:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 496762.767631; Thu, 16 Feb 2023 20:19:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSkj8-00047L-J6; Thu, 16 Feb 2023 20:19:34 +0000
Received: by outflank-mailman (input) for mailman id 496762;
 Thu, 16 Feb 2023 20:19:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vXCi=6M=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pSkj7-00047F-9w
 for xen-devel@lists.xenproject.org; Thu, 16 Feb 2023 20:19:33 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 37ceebbb-ae37-11ed-933c-83870f6b2ba8;
 Thu, 16 Feb 2023 21:19:31 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A824860A65;
 Thu, 16 Feb 2023 20:19:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59B0AC433EF;
 Thu, 16 Feb 2023 20:19:28 +0000 (UTC)
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
X-Inumbo-ID: 37ceebbb-ae37-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676578769;
	bh=/HZzX5hr2UbDlWa/3ukIpeC1yF9wshB6pHDI/yCYZM4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=jyfTG9mv9DjtTvPTgAx2U0N3ghb8vX/hRQCke4cG/ZtWCzsiogCJ/mmpT9KcZagy/
	 3faQdebwYHhN89Y1uYDEmKBzkUAWaS0WMA3e1SychkVnpFyIrEdzV6yxZIAUDw9/nq
	 HCULGeCMDlplgxeVboOz2JeKAh4LEsi11GX6HfyYiFZFJwFCF+FNVxf0Le2G1Dj/gV
	 GrGiU8VHa+Gfuam06dJ2t887ducc3kp24acz/+0bh4Wboxh/SL84teY+RHQmfdv7vU
	 LzLDntLi9dO0VZzAwk5oDka95LyZ39mK+c7zLE73MRHMpqzwciIltqJ0xo6FZWKSbR
	 Z93Pv0fTBUbgQ==
Date: Thu, 16 Feb 2023 12:19:26 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Anthony PERARD <anthony.perard@citrix.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org, 
    Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [XEN PATCH 3/4] automation: Remove expired root certificates
 used to be used by let's encrypt
In-Reply-To: <Y+4UyiTCp4Q8Yttx@l14>
Message-ID: <alpine.DEB.2.22.394.2302161219130.2127160@ubuntu-linux-20-04-desktop>
References: <20230215120208.35807-1-anthony.perard@citrix.com> <20230215120208.35807-4-anthony.perard@citrix.com> <3caee35d-3c0d-7e28-dc66-6f422568edad@citrix.com> <alpine.DEB.2.22.394.2302151608320.2127160@ubuntu-linux-20-04-desktop>
 <Y+4UyiTCp4Q8Yttx@l14>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 16 Feb 2023, Anthony PERARD wrote:
> On Wed, Feb 15, 2023 at 04:14:53PM -0800, Stefano Stabellini wrote:
> > On Wed, 15 Feb 2023, Andrew Cooper wrote:
> > > Honestly, I think I'd prefer to drop all of these legacy versions...
> > 
> > Good timing! It just so happens that we need to shave some of the old
> > container tests as we have too many build tests on x86 :-)
> > 
> > I would remove Jessie as it reached EOL years ago. Do we really need
> > both Centos 7 and 7.2? If not, we could remove 7.
> 
> Actually, 7.2 is older than 7, so I would remove 7.2. (7 would be 7.x so
> latest 7 which is 7.9.)

Sounds good


> > That leaves us with Trusty and Centos 7.2 among these. I would be
> > tempted to keep Trusty and add the sed hack of this patch to make it
> > work. For Centos 7.2, the hack looks even worse. Would it solve the
> > problem to upgrade to the latest Centos 7.x subrelease? Is there really
> > no other way to solve the problem?
> 
> So for centos7, the blacklist of the expired root certificate isn't
> needed if we simply run `yum update` which for some reason is missing
> from the dockerfile...

That's much better!

