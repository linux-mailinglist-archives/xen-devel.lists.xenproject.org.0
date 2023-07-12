Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D927751199
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jul 2023 22:00:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.562745.879535 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJfzN-0002d9-Di; Wed, 12 Jul 2023 19:59:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 562745.879535; Wed, 12 Jul 2023 19:59:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJfzN-0002aM-Ay; Wed, 12 Jul 2023 19:59:05 +0000
Received: by outflank-mailman (input) for mailman id 562745;
 Wed, 12 Jul 2023 19:59:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eU4r=C6=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qJfzM-0002aG-4l
 for xen-devel@lists.xenproject.org; Wed, 12 Jul 2023 19:59:04 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8b4108d0-20ee-11ee-b239-6b7b168915f2;
 Wed, 12 Jul 2023 21:59:01 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3CDE9618FB;
 Wed, 12 Jul 2023 19:59:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 919C8C433C7;
 Wed, 12 Jul 2023 19:58:58 +0000 (UTC)
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
X-Inumbo-ID: 8b4108d0-20ee-11ee-b239-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689191939;
	bh=HecMTw6AhXkRHgwa2M98sKbaO4JTtNmnVVEn3kz+KZk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=HpePBpfGDenhjv9iRNYL+I00ty0VDFPkf7OJvJcZZavDqTo/vw5w2Stp1J3E7Zmai
	 7YNJ+ZwYtPFjwgbUp9zXTLdtagkVNi4xdXdTl9PCW1U12JuyLw3Y4vRY1kmtZ6sB1a
	 Ezo4eH3u+GtA4hYVEwvKZ5fPf5d3a86D6xWzINpCCcK8E+ZrS4tBGquWexb9YTsdfr
	 wSOSw5kU26rIiHKN5Kxz4EwMzgeVK3Bl+7vmK5Su7A3DEkRmq47aW6HVz/Ye6gqwWS
	 NF21jr4Dt9jtkx3kSh0HiSyNVUC+vUesiz8CFelzad3UNiU1XgEUqpdJGIT1/z8mOt
	 ed86x9DKrnD7g==
Date: Wed, 12 Jul 2023 12:58:56 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Luca Fancellu <Luca.Fancellu@arm.com>
cc: Michal Orzel <michal.orzel@amd.com>, 
    Xen-devel <xen-devel@lists.xenproject.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] docs: Fix style in misc/arm/silicon-errata.txt table
In-Reply-To: <AFE6AA84-4ADE-4496-896A-8843575C962E@arm.com>
Message-ID: <alpine.DEB.2.22.394.2307121258510.761183@ubuntu-linux-20-04-desktop>
References: <20230712120440.1815240-1-luca.fancellu@arm.com> <c139abd7-bd27-f8cf-b561-5c795bb663a7@amd.com> <AFE6AA84-4ADE-4496-896A-8843575C962E@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1231765994-1689191939=:761183"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1231765994-1689191939=:761183
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 12 Jul 2023, Luca Fancellu wrote:
> > On 12 Jul 2023, at 14:04, Michal Orzel <michal.orzel@amd.com> wrote:
> > 
> > Hi Luca,
> > 
> > On 12/07/2023 14:04, Luca Fancellu wrote:
> >> 
> >> 
> >> Fix the right border of the silicon-errata.txt table
> >> 
> >> Fixes: 1814a626fb58 ("xen/arm: Update silicon-errata.txt with the Neovers AT erratum")
> > Fixes tag is for bugs and this one is clearly not.
> > With that removed:
> > Reviewed-by: Michal Orzel <michal.orzel@amd.com>
> 
> Thank you, yeah well I discovered it can be used also on back-ports, so I’ve added it, anyway
> If maintainer are ok, it can be addressed on commit

Acked-by: Stefano Stabellini <sstabellini@kernel.org>
--8323329-1231765994-1689191939=:761183--

