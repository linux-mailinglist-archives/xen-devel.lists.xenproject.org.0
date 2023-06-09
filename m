Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A6D872A136
	for <lists+xen-devel@lfdr.de>; Fri,  9 Jun 2023 19:26:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.546240.852955 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7frw-0004cn-3L; Fri, 09 Jun 2023 17:25:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 546240.852955; Fri, 09 Jun 2023 17:25:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7frw-0004aQ-0b; Fri, 09 Jun 2023 17:25:48 +0000
Received: by outflank-mailman (input) for mailman id 546240;
 Fri, 09 Jun 2023 17:25:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=464j=B5=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1q7fru-0004aK-LA
 for xen-devel@lists.xenproject.org; Fri, 09 Jun 2023 17:25:46 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a9e544d1-06ea-11ee-b232-6b7b168915f2;
 Fri, 09 Jun 2023 19:25:44 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 463A065A5B;
 Fri,  9 Jun 2023 17:25:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D490DC433D2;
 Fri,  9 Jun 2023 17:25:41 +0000 (UTC)
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
X-Inumbo-ID: a9e544d1-06ea-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686331542;
	bh=RX69Y0FSjLL53f1wPtReDbHfnjpJclXyqjiIQ++yx7k=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=p4y9W7sezqY67RWQGZVFlozPPH4GPKmmQDM6ZPgF3zHbeX4S6NLfokuoUDesa1f8B
	 D70oYil+gxMLspy83LamO9zukd9yMZRha6lhLvYfvYVWCDBBAiL09caHB4bjxqekWY
	 VMLLZFr5cuFZ0FGJE/T+q/2GfujJg4Xyz9bKuyphmigbnrmh1N6mwHMdDdF57pdjdq
	 yqVQp3TyzeBuSRQNcqACYzq9keWzpKYSspyheAYv86YdfEA/4vg+JV0eJ4WRh34+ox
	 YA1MTF3ZohfwXmmF626N4cu1fLg0pYCw3SOuqxzM9iDx3/m+WhiEpcS4ahsb240cFZ
	 uQJIKJM/7E0MQ==
Date: Fri, 9 Jun 2023 10:25:40 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: Andrew Cooper <andrew.cooper3@citrix.com>, 
    Xen-devel <xen-devel@lists.xenproject.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH] CI: Add Ocaml to the alpine containers
In-Reply-To: <2dcb05a1-d408-e9f3-1108-a155dc3312ff@amd.com>
Message-ID: <alpine.DEB.2.22.394.2306091025330.3803068@ubuntu-linux-20-04-desktop>
References: <20230609160244.2638438-1-andrew.cooper3@citrix.com> <2dcb05a1-d408-e9f3-1108-a155dc3312ff@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1715814792-1686331542=:3803068"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1715814792-1686331542=:3803068
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 9 Jun 2023, Michal Orzel wrote:
> On 09/06/2023 18:02, Andrew Cooper wrote:
> > 
> > 
> > This gets more coverage of optional parts of the build, and makes it easier to
> > trial Ocaml related changes in the smoke tests.
> > 
> > Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> > ---
> > CC: Roger Pau Monné <roger.pau@citrix.com>
> > CC: Stefano Stabellini <sstabellini@kernel.org>
> > CC: Michal Orzel <michal.orzel@amd.com>
> > CC: Anthony PERARD <anthony.perard@citrix.com>
> > 
> > Hacked up manually to fix the Ocaml bindings for arm64:
> > 
> >   https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/895162017
> > 
> > but this aspect should be done irrespective.
> > ---
> >  automation/build/alpine/3.12-arm64v8.dockerfile | 2 ++
> >  automation/build/alpine/3.12.dockerfile         | 2 ++
> >  2 files changed, 4 insertions(+)
> > 
> > diff --git a/automation/build/alpine/3.12-arm64v8.dockerfile b/automation/build/alpine/3.12-arm64v8.dockerfile
> > index 3f1e6a3fc6df..1be3bf780509 100644
> > --- a/automation/build/alpine/3.12-arm64v8.dockerfile
> > +++ b/automation/build/alpine/3.12-arm64v8.dockerfile
> > @@ -28,6 +28,8 @@ RUN apk --no-cache add \
> >    make \
> >    musl-dev  \
> >    ncurses-dev \
> > +  ocaml \
> > +  ocaml-findlib \
> I can see that in your CI pipeline, this package is missing. Is it then necessary to be added?
> Asking just out of curiosity because other containers have it installed too.
> 
> Apart from that, I can confirm that containers can be built without issues, so:
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>
--8323329-1715814792-1686331542=:3803068--

