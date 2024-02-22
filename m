Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A54860710
	for <lists+xen-devel@lfdr.de>; Fri, 23 Feb 2024 00:36:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.684555.1064456 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdIb8-0007Lz-Rl; Thu, 22 Feb 2024 23:35:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 684555.1064456; Thu, 22 Feb 2024 23:35:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdIb8-0007JX-Om; Thu, 22 Feb 2024 23:35:26 +0000
Received: by outflank-mailman (input) for mailman id 684555;
 Thu, 22 Feb 2024 23:35:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jbig=J7=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rdIb8-0007JQ-3Q
 for xen-devel@lists.xenproject.org; Thu, 22 Feb 2024 23:35:26 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0c6f088d-d1db-11ee-8a55-1f161083a0e0;
 Fri, 23 Feb 2024 00:35:24 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 39B9F6335F;
 Thu, 22 Feb 2024 23:35:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66E43C433C7;
 Thu, 22 Feb 2024 23:35:21 +0000 (UTC)
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
X-Inumbo-ID: 0c6f088d-d1db-11ee-8a55-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708644921;
	bh=jB0OHEs3+SXJygcUqLzKgnLozk5rRzzVc+fKeeXWZcI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=an7VVQUUcsoPElTUDxhyXz6N4UpjrfEpZZ+ImI/5qT9oqswRpK5Da0L6pFbnSo6CN
	 7aVX5i0++hes/DHqlJRKN5NcDP2lxtwQPRJaIskkQWiaXbhLJn+xsRTWOERCEVgRAp
	 3EcraJun6Z0JuMJx+ELygmgIMghcFt+4z+Xf80f/EOyhd7WnyvAbfOwiLBmWOH2TbM
	 +TCfyZPWQ4ITwvzRc6mrFlr4xU/3azPvD2GW0T+JARfTEhm7k0/Dm8apusJ98sDOsJ
	 R7tTDNxj/JJsGok1SgZF2WTiysiFZdOPf93dVigNe6ht/maJhbGQHvPrsr0QLdKjz0
	 y0lTCL2o8bWQg==
Date: Thu, 22 Feb 2024 15:35:19 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: ZHANG Zewei <zewei.zhang@forvia.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    "ray.huang@amd.com" <ray.huang@amd.com>
Subject: Re: AMD Working On VirtIO GPU Support For Xen Virtualization
 issues
In-Reply-To: <PR0P264MB2423CA7C396A70D21D08274C80B4A@PR0P264MB2423.FRAP264.PROD.OUTLOOK.COM>
Message-ID: <alpine.DEB.2.22.394.2402221534240.754277@ubuntu-linux-20-04-desktop>
References: <PR0P264MB2423CA7C396A70D21D08274C80B4A@PR0P264MB2423.FRAP264.PROD.OUTLOOK.COM>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1917931811-1708644921=:754277"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1917931811-1708644921=:754277
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

Hi Zewei,

Did you manage to make progress on this issue?

I apologize for answering so late, but this email fell through the
cracks,

Cheers,

Stefano


On Mon, 20 Nov 2023, ZHANG Zewei wrote:
> INTERNAL & PARTNERS
> 
> 
> Hi，Xen-devel：
> 
>        We are trying to implement the igpu sharing function for domU on the AMD (v2000 series) development board environment, and the
> software architecture is xen + ubuntu 22.04 (dom0) + Ubuntu 22.04 (Dom U). We found that AMD engineers like Mr. Huang @ray.huang@amd.com
> have posted information about virtio-gpu  for Xen virtualization to the open source community and uploaded the relevant code.
> 
>  
> 
>        And We refer to the relevant information linked below to deploy on my AMD hardware platform:
> 
> [RFC PATCH 0/5] Add Xen PVH dom0 support for GPU - Huang Rui (kernel.org)
> 
>  
> 
>        However, when we deploy virtio-GPU related software, we encounter the following issues:
> 
> 1.    My code of xen /qemu /Virglrenderer checkout to the upstream-for-xen or upstream-for-xen-v2 branch, the xl configuration file is set
> as follows, see< ubuntuhvm_virtIO-gpu.cfg>:
> 
>               device_model_args_hvm= ["-display", "sdl,gl=on", "-device", "virtio-vga-gl,context_init=true,blob=true,hostmem=4G"]
> 
>  
> 
> 2.    After the domU is started with the xl command, qemu and xen hypervisor will report the following errors:
> 
>          xen hypervisor report < xl_dmesg_upstream-for-xen-v2.txt>:
> 
>               (XEN) d0v8 Over-allocation for d1: 1048833 > 1048832
> 
> (XEN) common/memory.c:277:d0v8 Could not allocate order=0 extent: id=1 memflags=0xc0 (192 of 2048)
> 
>               qemu report  in log file < qemu-dm-ubuntuU_b.hvm.log>:
> 
>               qemu-system-i386: -device virtio-vga-gl,context_init=true,blob=true,hostmem=4G: xen: failed to populate ram at 110080000
> 
>  
> 
> 3.    I tried to start pvh dom0 but it didn't work, it looks the same regardless of whether I'm using upstream-for-xen-v2 or
> upstream-for-xen branch linux ：
> 
> Logs in attachment:< serial_xen_hypervisor-linux-upstream-for-xen-v2.txt>
> 
>  
> 
>  
> 
>        So I have some questions for you :
> 
> 1.     Does Dom 0 need to be configured with PVH for VirtIO-GPU?
> 
> 2.     What may cause the above issues?
> 
>  
> 
> We look forward to hearing from you!
> 
>  
> 
> Thanks & Best regards!
> 
>  
> 
>  
> 
>  
> 
>  
> 
>  
> 
> 
> 5acXjzUk
> 
> 
> 
--8323329-1917931811-1708644921=:754277--

