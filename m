Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F2C9A19BD9
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jan 2025 01:36:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.876056.1286432 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1talBw-00025V-DL; Thu, 23 Jan 2025 00:35:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 876056.1286432; Thu, 23 Jan 2025 00:35:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1talBw-00023H-Ao; Thu, 23 Jan 2025 00:35:28 +0000
Received: by outflank-mailman (input) for mailman id 876056;
 Thu, 23 Jan 2025 00:35:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MzGd=UP=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1talBu-00023B-Ui
 for xen-devel@lists.xenproject.org; Thu, 23 Jan 2025 00:35:26 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eec8d08f-d921-11ef-99a4-01e77a169b0f;
 Thu, 23 Jan 2025 01:35:24 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 17B285C5644;
 Thu, 23 Jan 2025 00:34:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A86BC4CED2;
 Thu, 23 Jan 2025 00:35:21 +0000 (UTC)
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
X-Inumbo-ID: eec8d08f-d921-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737592522;
	bh=J6KuCRfbMk94xpsEV0S1mHtmAQmCSAimuwcRn1vbn1s=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=U0mik1W3Mbt7ppDDxbUrofdQoFjFLXEusj0UCtsGSJyG+WmE3wOWT+tJN4l1J30LG
	 Rh3igHps7ZkUXzr1XwvP4Yy0idmU73MpYkrDMh+5FjuAIzmTcmWSlUbkAkirSYfFNR
	 WYGVKqN9lwaf0miL5V5z/Js/mUg3/1Zb1LgiMpQ1scjQEDDS9E1oz7SqkAy6Y6t6F4
	 VOyDxWlJQDrGf1jVGjlcmGF/qfQL8SB/Ek1TwgkUjr1U33fJvjFN933SQllqgISfSj
	 MwxWITkVv0vo2A7rWjM6STwxKzVBTw3UoDDG7dD15vwS1WACkaQUwebipxNZIICCBu
	 sSC+R1rnaI4/w==
Date: Wed, 22 Jan 2025 16:35:20 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "L, John Preetham (893)" <john_preetham.l@daimlertruck.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Artem_Mygaiev@epam.com, Volodymyr_Babchuk@epam.com, sstabellini@kernel.org
Subject: Re: Request for Documentation on Bringing Up Xen on R-Car H3e
 (H3ULCB)
In-Reply-To: <FR2PPF86245AF1B81D71CF27EE705ED09B7B8E12@FR2PPF86245AF1B.DEUP281.PROD.OUTLOOK.COM>
Message-ID: <alpine.DEB.2.22.394.2501221625100.11086@ubuntu-linux-20-04-desktop>
References: <FR2PPF86245AF1B81D71CF27EE705ED09B7B8E12@FR2PPF86245AF1B.DEUP281.PROD.OUTLOOK.COM>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-329154796-1737591945=:11086"
Content-ID: <alpine.DEB.2.22.394.2501221625520.11086@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-329154796-1737591945=:11086
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2501221625521.11086@ubuntu-linux-20-04-desktop>

Hi John,

Let me add a few people that might have more information for you on this
topic.

Typically, the minimal set of operations to get started is the
following. Build Xen from sources (hypervisor only):

export CROSS_COMPILE=/path/to/cross-compiler
export XEN_TARGET_ARCH=arm64
cd xen.git/xen; make

Use ImageBuilder to generate a U-boot boot script to start
Xen and one ore more virtual machines:
https://gitlab.com/xen-project/imagebuilder/

Here are a few links:
https://wiki.xenproject.org/wiki/Xen_ARM_with_Virtualization_Extensions#Building_Xen_on_ARM
https://wiki.xenproject.org/wiki/ImageBuilder
https://wiki.xenproject.org/wiki/Xen_ARM_with_Virtualization_Extensions/Salvator-XS

I know this is for a different board (Xilinx), but it might help you
get concrete examples on how Xen is typically used:
https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/2451243106/Building+Xen+Hypervisor+with+PetaLinux+2022.1

People in CC might be able to give you additional material specific to
R-Car H3e.

Cheers,

Stefano


On Wed, 22 Jan 2025, L, John Preetham (893) wrote:
> Dear Xen Community,
> 
> I hope this message finds you well.
> 
> I am currently working on a project that involves bringing up Xen on the Renesas R-Car H3e (H3ULCB) platform. I am seeking guidance on
> where I can find the proper documentation for this process. Specifically, I am looking for comprehensive documentation that covers
> everything from scratch to the end, including the required versions and any specific configurations.
> 
> Could anyone point me to the relevant resources or share any documentation that might be helpful?
> 
> Thank you in advance for your assistance.
> 
> Best regards,
> John Preetham L
> 
>  
> 
> 
> If you are not the addressee, please inform us immediately that you have received this e-mail by mistake, and delete it. We thank you for
> your support.
> 
> 
> 
--8323329-329154796-1737591945=:11086--

