Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0536A34F20
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2025 21:15:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.888009.1297424 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tifbV-0002fx-DY; Thu, 13 Feb 2025 20:14:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 888009.1297424; Thu, 13 Feb 2025 20:14:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tifbV-0002eA-At; Thu, 13 Feb 2025 20:14:33 +0000
Received: by outflank-mailman (input) for mailman id 888009;
 Thu, 13 Feb 2025 20:14:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IJm2=VE=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tifbT-0002e2-Uc
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2025 20:14:31 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2088c754-ea47-11ef-88c1-8ba37f82fa57;
 Thu, 13 Feb 2025 21:14:29 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 18D5A5C5729;
 Thu, 13 Feb 2025 20:13:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 380F8C4CED1;
 Thu, 13 Feb 2025 20:14:26 +0000 (UTC)
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
X-Inumbo-ID: 2088c754-ea47-11ef-88c1-8ba37f82fa57
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739477667;
	bh=3OB9zPoHgW2IN0FCIkf3eNa5k1HP97V9GsaALTLILmQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=pmXaZDA+93EL65feZCcuXkGEl1qIS/y45BWFV6m7f7NcZJpcBq8BnutpiZqwWYaIr
	 9M/5CqMFFgBZPZ2HevgWjAQCKHgI52axbAUgagClhIChGTIju3kLsc9kAMwL30ByCO
	 pF4vLXtqP/SucyyabMNSrp4SlvMaqy33EnQFvuYxD6Rc1p5SifU6jYlZ+ULLwMD9up
	 AKHBfuA7ay5osHgmX0x4fYTwDoepx+4FpDLOhRyd4fIYxWnKUiCyaKAFhCl20ywMbN
	 dWL/KGi3fU1qFNqIajou4Di5BSow3lk3AYyMqO3eRQaIE0Swxsr+3iStomau+bwBVX
	 1nuXsR3dLg1pA==
Date: Thu, 13 Feb 2025 12:14:24 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: shenghui qu <adam.qushenghui@gmail.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    xen-devel@lists.xenproject.org, Stewart.Hildebrand@amd.com, 
    Mykyta_Poturai@epam.com
Subject: Re: Inquiry About PCI Passthrough Development and Testing Patches
 on ARM
In-Reply-To: <CAHfJC1=gH7tm3V922+5Nqz76mB_iSeiTjU1rwKAVOzaj6B9LJw@mail.gmail.com>
Message-ID: <alpine.DEB.2.22.394.2502131211100.619090@ubuntu-linux-20-04-desktop>
References: <CAHfJC1=gH7tm3V922+5Nqz76mB_iSeiTjU1rwKAVOzaj6B9LJw@mail.gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-222707256-1739477481=:619090"
Content-ID: <alpine.DEB.2.22.394.2502131211300.619090@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-222707256-1739477481=:619090
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2502131211301.619090@ubuntu-linux-20-04-desktop>

Hi Shenghui,

Thank you for your interest in Xen! Let me add Stewart, who can provide
you with an overview of the latest status of PCI Passthrough on ARM. 

Among the various items in progress, I would like to highlight this
series from Mykyta, which is currently under review:

https://marc.info/?l=xen-devel&m=173918318831281

Cheers,

Stefano

On Thu, 13 Feb 2025, shenghui qu wrote:
> Dear Maintainers,
> 
> I hope this email finds you well.
> 
> I recently came across the Xen Project 4.19 Feature List, which mentions that PCI passthrough work on ARM is ongoing, including some
> refactoring and improvements of the existing code. It also states that this work will be included in the next few releases.
> I am very interested in the current development plan and progress of PCI passthrough on ARM. Could you kindly provide an update on this? 
> 
> Additionally, I would like to know how I can access any available testing patches related to this work.
> 
> I appreciate your time and effort in maintaining and improving the Xen Project. Looking forward to your response.
> 
> Best regards,Shenghui Qu
> 
> 
--8323329-222707256-1739477481=:619090--

