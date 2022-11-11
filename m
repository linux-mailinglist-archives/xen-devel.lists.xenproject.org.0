Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E4C6262FF
	for <lists+xen-devel@lfdr.de>; Fri, 11 Nov 2022 21:36:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.442702.697131 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otakP-0005J2-OR; Fri, 11 Nov 2022 20:35:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 442702.697131; Fri, 11 Nov 2022 20:35:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otakP-0005GF-Ld; Fri, 11 Nov 2022 20:35:33 +0000
Received: by outflank-mailman (input) for mailman id 442702;
 Fri, 11 Nov 2022 20:35:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JraP=3L=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1otakN-0005G9-V5
 for xen-devel@lists.xenproject.org; Fri, 11 Nov 2022 20:35:32 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 61d2cf84-6200-11ed-8fd2-01056ac49cbb;
 Fri, 11 Nov 2022 21:35:30 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 83F51620DB;
 Fri, 11 Nov 2022 20:35:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23800C433D7;
 Fri, 11 Nov 2022 20:35:28 +0000 (UTC)
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
X-Inumbo-ID: 61d2cf84-6200-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668198928;
	bh=3Q7a4gdSE+f41T4qAzT3X+d57B6huLNydDq+POH/mKs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=USbYA8toQY0iC4WtmhML/VAAMBxnbFTOHZNjjy727nHHwvqE+d9j4TAIykf8+fXuv
	 NqrGpn4Ghd9O7OC+DvKSBxjsig0x7lTxiOWrqV0py+7R/HTAKyUBmkKkTIdSMJQebK
	 wrnw742ALJm1vRNwZzjIIpf6lcQ5LnqjQcCF/0ecU+1mfSjcB57e8P60CT8LA6G/64
	 TAMEYb9Rn5amPynMQp61HGpxs7Ip3s+HztDafrk7ldw1qHZHvx9bcumDIa4yqnQ8My
	 HXitv+cgx52WKEDq3FPiguU/swzsvwITPLenNGLh2iPWoWZww3mYDTUukeFzADmBA4
	 a5nbulbdKr46Q==
Date: Fri, 11 Nov 2022 12:35:26 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Henry Wang <Henry.Wang@arm.com>
cc: Oleksandr Tyshchenko <olekstysh@gmail.com>, 
    xen-devel <xen-devel@lists.xenproject.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, Julien Grall <julien@xen.org>, 
    "sstabellini@kernel.org" <sstabellini@kernel.org>
Subject: RE: [PATCH 2/3] CHANGELOG: Add missing entries for work during the
 4.17 release
In-Reply-To: <AS8PR08MB7991BAC837FD2D31D99BB1C392009@AS8PR08MB7991.eurprd08.prod.outlook.com>
Message-ID: <alpine.DEB.2.22.394.2211111234360.50442@ubuntu-linux-20-04-desktop>
References: <20221111112208.451449-1-Henry.Wang@arm.com> <20221111112208.451449-3-Henry.Wang@arm.com> <CAPD2p-=Y-1SwcWc5p-_nrWZAjTZPiyF7KZbeM62q9hafybD9Gw@mail.gmail.com> <AS8PR08MB7991BAC837FD2D31D99BB1C392009@AS8PR08MB7991.eurprd08.prod.outlook.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-71014710-1668198928=:50442"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-71014710-1668198928=:50442
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 11 Nov 2022, Henry Wang wrote:
> - Add Renesas R-Car Gen4 IPMMU-VMSA support (Arm)
> 
>  
> 
> (Henry): If something from a specific vendor needs to be included, I wonder if “add i.MX lpuart and i.MX8QM initial support” also qualify.
> I will let Arm maintainers to do the final call here. Hope you would be fine with that.
 
Yes I think that's fine to add things from a specific vendor, including
i.MX related stuff
--8323329-71014710-1668198928=:50442--

