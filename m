Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E657B78140D
	for <lists+xen-devel@lfdr.de>; Fri, 18 Aug 2023 22:06:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.586548.917831 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qX5jM-0001JF-N3; Fri, 18 Aug 2023 20:06:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 586548.917831; Fri, 18 Aug 2023 20:06:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qX5jM-0001Gv-KN; Fri, 18 Aug 2023 20:06:00 +0000
Received: by outflank-mailman (input) for mailman id 586548;
 Fri, 18 Aug 2023 20:05:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ghuf=ED=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qX5jL-0000rT-GN
 for xen-devel@lists.xenproject.org; Fri, 18 Aug 2023 20:05:59 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a2eccc17-3e02-11ee-877e-cb3800f73035;
 Fri, 18 Aug 2023 22:05:56 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 598806111E;
 Fri, 18 Aug 2023 20:05:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC739C433C8;
 Fri, 18 Aug 2023 20:05:51 +0000 (UTC)
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
X-Inumbo-ID: a2eccc17-3e02-11ee-877e-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692389152;
	bh=KFMQls2qQbP04nnIi7Z6Ix85k3XFJi5m/V1Rh5t4aKM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=rbB+Tlktugf4uQ6Q7ElXTyGTzyzsl/uMPdgTObJbUUBrVTZ3whnPsSsg830xZlX1i
	 GBanKDkY5CmgFag+Z7Y4nPnKO2aXyi+AGCfDSsrfg1wYZ9+ITFPyoGeqKp+wCb2U1L
	 Fpm7TYh83SaSfXrsgkn70XS+jrfNKdSdHNvPmqjB4gGaslP0vcTrCBJNP7FM1xEFBD
	 kynErSaGbHbe0lZHmwmixjgJQiYU1FDzqoHi5CoUXQFzxCAw6MkFMGBbhnge7HSJiF
	 LDgDYYbr+64tebpqGkSDS8mVArRV9Lp5llBFz7NbKTf1GWha+/JrCEJoELc9kg8HAO
	 MhQsdCzc820Hw==
Date: Fri, 18 Aug 2023 13:05:50 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
cc: Kelly Choi <kelly.choi@cloud.com>, 
    Xen-devel <xen-devel@lists.xenproject.org>, 
    "xen-announce@lists.xenproject.org" <xen-announce@lists.xenproject.org>, 
    "xen-users@lists.xenproject.org" <xen-users@lists.xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: Community Manager update - August 2023
In-Reply-To: <E21FCD8C-DD32-43DA-885E-EA0782EA9FAA@arm.com>
Message-ID: <alpine.DEB.2.22.394.2308181305310.6458@ubuntu-linux-20-04-desktop>
References: <CAO-mL=zqZjGhPB7wDxcGM=FxU0-JCcc9AY7YSrPKV5Kpv3pDDw@mail.gmail.com> <E21FCD8C-DD32-43DA-885E-EA0782EA9FAA@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-582677185-1692389152=:6458"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-582677185-1692389152=:6458
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 18 Aug 2023, Bertrand Marquis wrote:
> Hi Kelly,
> 
> > On 18 Aug 2023, at 12:55, Kelly Choi <kelly.choi@cloud.com> wrote:
> >
> > Hi everyone! :)
> >
> > I hope you're all well.
> >
> > If we haven't met before, I'd like to introduce myself. I'm Kelly, the Community Manager for The Xen Project. My role is to support
> everyone and make sure the project is healthy and thriving.
> >
> > The latest update below requires your attention:
> >
> >     • We will be moving IRC channels fully to Matrix in September 2023. Once the channels have been created, further information will be
> shared.
> >     • New Mission Statement, goals, and purpose is attached to this email and will be shared publicly.
> > Should anyone have any concerns or feedback, please let me know
> 
> In embedded and automotive in particular one keyword that would be interesting to have is "Safety".
> 
> We could add it in the mission statement and in the embedded technology goals:
> - The project aims to enable innovation, scalability, safety and security in virtualization solutions.
> - Transform embedded and automotive sectors with mature, safe and secure solutions.
> 
> What do other think ?

I agree, good idea.


> >
> > Many thanks,
> > Kelly Choi
> >
> > Open Source Community Manager, XenServer
> > Cloud Software Group
> 
> 
> 
--8323329-582677185-1692389152=:6458--

