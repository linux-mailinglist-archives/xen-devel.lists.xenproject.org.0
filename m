Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A43BF772E9D
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 21:25:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.578916.906669 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT5qX-0002NQ-R2; Mon, 07 Aug 2023 19:24:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 578916.906669; Mon, 07 Aug 2023 19:24:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT5qX-0002Ll-OD; Mon, 07 Aug 2023 19:24:53 +0000
Received: by outflank-mailman (input) for mailman id 578916;
 Mon, 07 Aug 2023 19:24:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aC6Z=DY=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qT5qW-0002Lf-EE
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 19:24:52 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 139c6502-3558-11ee-b280-6b7b168915f2;
 Mon, 07 Aug 2023 21:24:50 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1D1D96216A;
 Mon,  7 Aug 2023 19:24:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43F89C433C7;
 Mon,  7 Aug 2023 19:24:47 +0000 (UTC)
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
X-Inumbo-ID: 139c6502-3558-11ee-b280-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691436288;
	bh=ShzSncWkK1q8EFrv8kW0nziCl3BTWaxfOq7SLvNC8Ig=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=SSjYMqoCsffrsoGxAQYfHlrN1G9QhvnVUJenCxVfrwgwbwq+5b7sOPvmFdDchGxFh
	 Z28YrElnMcU6Kqbw73o9ViZYSnRW8QCi1L6dwyNAAqnSvQG4P+bOYo+R3viF8vFOli
	 HajyptAYgcWKT4lk3i8b7LI+X1LzkRp1C12D4jw8haZA8OVvF7A4TNdYMEhjRsoJiS
	 r3wXbZ7fV2hvqMud11n0KX/ISy8sMK533iQu9GRgrD1ymu3RN6YTlUwfbTMHf+nNpt
	 NdugpIUheEv5ME4cw9KoO8V/mT1MkIIAuloQ+/EqKOh1XFlQGd0V0MyfGVXjxIT1Ba
	 wqLLOvFK4tJRg==
Date: Mon, 7 Aug 2023 12:24:45 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Henry Wang <Henry.Wang@arm.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    "community.manager@xenproject.org" <community.manager@xenproject.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Julien Grall <julien@xen.org>, 
    "sstabellini@kernel.org" <sstabellini@kernel.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: Re: Xen 4.18 release: Reminder about last posting date
In-Reply-To: <AS8PR08MB79911746BC3D82A6341EDA6F920CA@AS8PR08MB7991.eurprd08.prod.outlook.com>
Message-ID: <alpine.DEB.2.22.394.2308071209470.2127516@ubuntu-linux-20-04-desktop>
References: <AS8PR08MB79911746BC3D82A6341EDA6F920CA@AS8PR08MB7991.eurprd08.prod.outlook.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 7 Aug 2023, Henry Wang wrote:
> Hi everyone,
> 
> Following the release schedule discussion in in April, I am sending this email
> to remind that according to the release schedule [1], August 11 (this Friday)
> will be the last posting date, when patches adding new features are expected
> to be posted to the mailing list by this date.
> 
> Also, note that we currently have 1 release blocker [2] which might need
> some attention.
> 
> [1] https://lore.kernel.org/xen-devel/AS8PR08MB79919F9CE0B2BF80E7103FB592609@AS8PR08MB7991.eurprd08.prod.outlook.com/
> [2] https://gitlab.com/xen-project/xen/-/issues/114

We have another release blocker in my option:
https://marc.info/?l=xen-devel&m=168312468808977
https://marc.info/?l=xen-devel&m=168312687610283

Andrew, would you OK with making it a release blocker? We already have a
tentative fix from Julien.

