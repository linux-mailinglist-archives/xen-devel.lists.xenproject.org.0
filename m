Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B935963E5F5
	for <lists+xen-devel@lfdr.de>; Thu,  1 Dec 2022 00:59:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.450159.707378 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0Wyx-0004UX-Oo; Wed, 30 Nov 2022 23:59:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 450159.707378; Wed, 30 Nov 2022 23:59:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0Wyx-0004Rl-M1; Wed, 30 Nov 2022 23:59:15 +0000
Received: by outflank-mailman (input) for mailman id 450159;
 Wed, 30 Nov 2022 23:59:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LEZL=36=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1p0Wyw-0004Rf-GI
 for xen-devel@lists.xenproject.org; Wed, 30 Nov 2022 23:59:14 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fd2a8f93-710a-11ed-91b6-6bf2151ebd3b;
 Thu, 01 Dec 2022 00:59:13 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A5557B81AD6;
 Wed, 30 Nov 2022 23:59:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBFDBC433C1;
 Wed, 30 Nov 2022 23:59:09 +0000 (UTC)
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
X-Inumbo-ID: fd2a8f93-710a-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669852750;
	bh=+jdLgipg+i8X1zSuiLJPQdlQIKwcTqe9BIBIVU0hRZM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=iOOvY6FpXTo4Gfp2g+C0xCA1v9jzVcR655gqWsnEVrPElJcikD7Xq2sfHleEd5ec9
	 wt/F0mp+SUm9jf67UwXPcCUKGCTb+npNkqSUldNfvCC7Pge1aG3Cy3gcKoI4xNEruv
	 FQSnzvhzpAXFH5w4bAhssBWPWbS4nKekE2JOIEDS+NXpQelXcllvBN8FXkbnSysfqa
	 0ByTpwWaUEAGZ0c0UhGfVvp6d7LJwLmb2OC810DTR/ELskZdPKc/OM+vNZpepkeD/4
	 bScSWRZPI6+WBRvubvOAlmH0quoFlSnpmceNHtija6JUGMwjIaWt3GD5jt03l42wS0
	 W+ulzli19uqJg==
Date: Wed, 30 Nov 2022 15:59:08 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: dega kiran <degakiran05@gmail.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand.Marquis@arm.com, vsuneja63@gmail.com
Subject: Re: Guest Display issue on Xen
In-Reply-To: <CADY+DPKBcMMHP9ZKCjviwagEf2KTRKV9NwOhZkk=AqKGqKXSdw@mail.gmail.com>
Message-ID: <alpine.DEB.2.22.394.2211301555040.4039@ubuntu-linux-20-04-desktop>
References: <CADY+DPKBcMMHP9ZKCjviwagEf2KTRKV9NwOhZkk=AqKGqKXSdw@mail.gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-806537791-1669852520=:4039"
Content-ID: <alpine.DEB.2.22.394.2211301555250.4039@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-806537791-1669852520=:4039
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2211301555251.4039@ubuntu-linux-20-04-desktop>

+Vipul


Hi Dega,

Vipul recently found a similar issue. He is using "vfb" in the xl config
file, the guest is created but he is getting a black screen.

We checked the xenstore output and frontend and backend seem to be
properly initialized and connected. I am not sure how to proceed if not
by adding printf and printk in the relevant frontend and backend code in
Linux and QEMU to figure out where things go wrong:

drivers/video/fbdev/xen-fbfront.c in Linux
hw/display/xenfb.c in QEMU

I also suggested a workaround to Vipul [1]: do not use "vfb" at all and
instead setup a normal network connection with the domU using "vif".
Then run a vncserver in the domU and connect to it over the network
using vnclient in dom0.

Cheers,

Stefano

[1] https://marc.info/?l=xen-devel&m=166916188230575


On Wed, 30 Nov 2022, dega kiran wrote:
> Hi,
> 
> I am porting Xen Hypervisor on raspberry pi4. I could port xen minimal image as host & wayland based GUI image as guest. Now I am trying to
> bring up guest Display (using vncviewer) which is not coming up, even I could see xen-fbfront driver on guest and Debugged
> 
> xen-fbfront.c
> 
> Xenbusprobe_backend.c
> 
> Xenbusprobe_frontend.c
> 
> But not sure where is the actual issue.
> 
> Let me know which part of code will help us more  for better understanding the issue.
> 
> 
> 
--8323329-806537791-1669852520=:4039--

