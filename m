Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D248B4273F7
	for <lists+xen-devel@lfdr.de>; Sat,  9 Oct 2021 00:55:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.204918.360115 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYylQ-0001BL-50; Fri, 08 Oct 2021 22:54:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 204918.360115; Fri, 08 Oct 2021 22:54:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYylQ-00018F-1Q; Fri, 08 Oct 2021 22:54:52 +0000
Received: by outflank-mailman (input) for mailman id 204918;
 Fri, 08 Oct 2021 22:54:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=79mX=O4=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mYylO-000189-Jd
 for xen-devel@lists.xenproject.org; Fri, 08 Oct 2021 22:54:50 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bd392fca-288a-11ec-8071-12813bfff9fa;
 Fri, 08 Oct 2021 22:54:49 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B172860E9C;
 Fri,  8 Oct 2021 22:54:47 +0000 (UTC)
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
X-Inumbo-ID: bd392fca-288a-11ec-8071-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1633733688;
	bh=m4RYABVMi6DigLkgfT42Ult+XqB/etQQpxM9McuUbP4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ThPUyYjFNepqPOlaJIshHOl43cg8RvqcgmYl29UeTlXo6QHdJd37x0gwgK0oReg0j
	 G53eCJz4xPBBV6Ln/wh20zZcm1SHaQZP0UNK816yyWSjHO0YXRuWgxXWQJ1TYTzKWM
	 3XK+DB7AEXETYwO7u13Mz6ozdoSM+H9HxSKhyu4m5pqMljfyhCLj581pyy55rp9lUE
	 YligXv9EhJYUZzjEYV3j6s73ZvoOeMUZDXxRYjQ9Dbi/qWxdKG1A/CljVEf+x2GCF/
	 V4OiMAquyXdhtlfq8rRGr34PfO27VS7hAntIH0bW7lDJIFZbQfBAskwIOOODXS83Yo
	 kGSttjBxnFOFQ==
Date: Fri, 8 Oct 2021 15:54:46 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Oleksandr Andrushchenko <andr2000@gmail.com>
cc: xen-devel@lists.xenproject.org, julien@xen.org, sstabellini@kernel.org, 
    oleksandr_tyshchenko@epam.com, volodymyr_babchuk@epam.com, 
    Artem_Mygaiev@epam.com, roger.pau@citrix.com, jbeulich@suse.com, 
    andrew.cooper3@citrix.com, george.dunlap@citrix.com, paul@xen.org, 
    bertrand.marquis@arm.com, rahul.singh@arm.com, 
    Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: Re: [PATCH v5 00/10] PCI devices passthrough on Arm, part 2
In-Reply-To: <20211008055535.337436-1-andr2000@gmail.com>
Message-ID: <alpine.DEB.2.21.2110081554210.25528@sstabellini-ThinkPad-T480s>
References: <20211008055535.337436-1-andr2000@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi Oleksandr,

I committed patches #1-#5


On Fri, 8 Oct 2021, Oleksandr Andrushchenko wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> Hi, all!
> 
> This is an assorted series of patches which aim is to make some further
> basis for PCI passthrough on Arm support. The series continues the work
> published earlier by Arm [1] and adds new helpers and clears the way for
> vPCI changes which will follow.
> 
> RFC is at [2], [3]. Design presentation can be found at [4].
> 
> Thank you,
> Oleksandr
> 
> [1] https://patchwork.kernel.org/project/xen-devel/list/?series=558681
> [2] https://lists.xenproject.org/archives/html/xen-devel/2020-07/msg01184.html
> [3] https://lists.xenproject.org/archives/html/xen-devel/2020-07/threads.html#01184
> [4] https://static.sched.com/hosted_files/xen2021/e4/PCI_Device_Passthrough_On_Arm.pdf
> 
> Oleksandr Andrushchenko (9):
>   xen/arm: Add new device type for PCI
>   xen/arm: Introduce pci_find_host_bridge_node helper
>   xen/device-tree: Make dt_find_node_by_phandle global
>   xen/arm: Mark device as PCI while creating one
>   libxl: Allow removing PCI devices for all types of domains
>   libxl: Only map legacy PCI IRQs if they are supported
>   xen/arm: Setup MMIO range trap handlers for hardware domain
>   xen/arm: Do not map PCI ECAM and MMIO space to Domain-0's p2m
>   xen/arm: Process pending vPCI map/unmap operations
> 
> Oleksandr Tyshchenko (1):
>   xen/domain: Call pci_release_devices() when releasing domain resources
> 
>  tools/libs/light/Makefile          |  4 ++
>  tools/libs/light/libxl_pci.c       | 15 ++++-
>  xen/arch/arm/domain.c              | 11 +++-
>  xen/arch/arm/domain_build.c        | 57 ++++++++++--------
>  xen/arch/arm/pci/ecam.c            | 14 +++++
>  xen/arch/arm/pci/pci-host-common.c | 93 ++++++++++++++++++++++++++++++
>  xen/arch/arm/pci/pci-host-zynqmp.c |  1 +
>  xen/arch/arm/pci/pci.c             | 12 ++++
>  xen/arch/arm/traps.c               | 13 +++++
>  xen/arch/arm/vpci.c                | 34 +++++++++++
>  xen/arch/arm/vpci.h                |  6 ++
>  xen/arch/x86/hvm/hvm.c             |  6 ++
>  xen/common/device_tree.c           |  2 +-
>  xen/common/ioreq.c                 |  9 ---
>  xen/drivers/passthrough/pci.c      |  2 +
>  xen/include/asm-arm/device.h       |  4 +-
>  xen/include/asm-arm/pci.h          | 30 ++++++++++
>  xen/include/asm-arm/setup.h        | 13 +++++
>  xen/include/asm-x86/pci.h          |  2 +
>  xen/include/xen/device_tree.h      |  2 +
>  20 files changed, 292 insertions(+), 38 deletions(-)
> 
> -- 
> 2.25.1
> 

