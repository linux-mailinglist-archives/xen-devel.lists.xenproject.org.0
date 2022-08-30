Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3CAC5A5886
	for <lists+xen-devel@lfdr.de>; Tue, 30 Aug 2022 02:47:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.394739.634253 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oSpOB-0004Lc-VW; Tue, 30 Aug 2022 00:45:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 394739.634253; Tue, 30 Aug 2022 00:45:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oSpOB-0004J5-Sn; Tue, 30 Aug 2022 00:45:59 +0000
Received: by outflank-mailman (input) for mailman id 394739;
 Tue, 30 Aug 2022 00:45:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c5Pn=ZC=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1oSpO9-0004Iz-Hb
 for xen-devel@lists.xenproject.org; Tue, 30 Aug 2022 00:45:57 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1a1af1a5-27fd-11ed-9250-1f966e50362f;
 Tue, 30 Aug 2022 02:45:56 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 05F2561457;
 Tue, 30 Aug 2022 00:45:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 065E0C433C1;
 Tue, 30 Aug 2022 00:45:51 +0000 (UTC)
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
X-Inumbo-ID: 1a1af1a5-27fd-11ed-9250-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661820352;
	bh=O6ENxYw6HmlPPLCZQRTG/AAqCpdna1oIa+pqoVYb+EA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=MhdyTyon9rUoElJptoR+zaAZSkOTLQBhys9Ee5x20d8/vuypkx++GrfuWdhrNQ0cE
	 EpflnaJ5B5fchAJosOhnaZfDTTw0ebv7zMjTdHb8F1sHGrJPI30uory7L8wHCXv3O2
	 9571y19vBhPoBvmkKby7Rt95yS/kdRcsP9u2kAuNxxjW06gwYXz0RVfoRS3U2Qhoge
	 JiFeD6ADYTmlb1f2Tck3DUG3D2k99g4fEjNX/vS7c4Hw/qNcNlhJAMqWo3/mfxXw3F
	 JHxu66HHnu9jvtQxg95q0G+YzFq9xrs+lcHKLFElBh6asaNfDlcMpfsgr0Xc1kc7yo
	 smoQdUc8k1CcQ==
Date: Mon, 29 Aug 2022 17:45:50 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Henry Wang <Henry.Wang@arm.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Penny Zheng <penny.zheng@arm.com>
Subject: Re: [PATCH 1/2] docs, xen/arm: Introduce reserved heap memory
In-Reply-To: <20220824073127.16762-2-Henry.Wang@arm.com>
Message-ID: <alpine.DEB.2.22.394.2208291726300.1134492@ubuntu-linux-20-04-desktop>
References: <20220824073127.16762-1-Henry.Wang@arm.com> <20220824073127.16762-2-Henry.Wang@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 24 Aug 2022, Henry Wang wrote:
> This commit introduces the reserved heap memory, which is parts of RAM
> reserved in the beginning of the boot time for heap.
> 
> A new boolean field `xen_heap` in `struct membank` is added to store the
> configuration telling if the memory bank is reserved as heap through
> `xen,static-mem` property in device tree `chosen` node.
> 
> Also, this commit introduces the logic to parse the reserved heap
> configuation in device tree by reusing the device tree entry definition
> of the static memory allocation feature:
> 
> - Add a boolean parameter `xen_heap` to `device_tree_get_meminfo` to
> reflect whether the memory bank is reserved as heap.
> 
> - Use `device_tree_get_meminfo` to parse the reserved heap configuation
> in `chosen` node of the device tree.
> 
> - In order to reuse the function `device_tree_get_meminfo`, the
> return type of `process_chosen_node` is changed from void to int.
> 
> A documentation section is added, describing the definition of reserved
> heap memory and the method of enabling the reserved heap memory through
> device tree at boot time.
> 
> Signed-off-by: Henry Wang <Henry.Wang@arm.com>
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> ---
> The name of the device tree property was chosen because we want to
> reuse as much as the device tree parsing helpers from the static
> memory allocation feature, but we would like to hear the upstream
> reviewers' opinion about if using "xen,static-heap" is better.
> ---
> Changes from RFC to v1:
> - Rename the terminology to reserved heap.
> ---
>  docs/misc/arm/device-tree/booting.txt | 46 +++++++++++++++++++++++++
>  xen/arch/arm/bootfdt.c                | 49 +++++++++++++++++++++------
>  xen/arch/arm/domain_build.c           |  5 +--
>  xen/arch/arm/include/asm/setup.h      |  1 +
>  4 files changed, 89 insertions(+), 12 deletions(-)
> 
> diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
> index 98253414b8..e064f64d9a 100644
> --- a/docs/misc/arm/device-tree/booting.txt
> +++ b/docs/misc/arm/device-tree/booting.txt
> @@ -378,3 +378,49 @@ device-tree:
>  
>  This will reserve a 512MB region starting at the host physical address
>  0x30000000 to be exclusively used by DomU1.
> +
> +
> +Reserved Heap Memory
> +====================
> +
> +The reserved heap memory (also known as the statically-configured heap) refers
> +to parts of RAM reserved in the beginning for heap. The memory is reserved by
> +configuration in the device tree using physical address ranges.
> +
> +The reserved heap memory declared in the device tree defines the memory areas
> +that will be reserved to be used exclusively as heap.
> +
> +- For Arm32, since there can be seperated heaps, the reserved heap will be used
> +for both domheap and xenheap.
> +- For Arm64, since domheap and xenheap are the same, the defined reserved heap
> +areas shall always go to the heap allocator.
> +
> +The reserved heap memory is an optional feature and can be enabled by adding a
> +device tree property in the `chosen` node. Currently, this feature reuses the
> +static memory allocation device tree configuration.
> +
> +The dtb property should look like as follows:
> +
> +- property name
> +
> +    "xen,static-mem" (Should be used in the `chosen` node)
> +
> +- cells
> +
> +    Specify the start address and the length of the reserved heap memory.
> +    The number of cells for the address and the size should be defined
> +    using the properties `#xen,static-mem-address-cells` and
> +    `#xen,static-mem-size-cells` respectively.

I would choose a different name for the property not to be confused with
a domain's xen,static-mem property which is for a different purpose: the
memory of the domain.

---

- xen,static-heap

    Property under the top-level "chosen" node. It specifies the address
    and size of Xen reserved heap memory.


- #xen,static-heap-address-cells and #xen,static-heap-size-cells

    Specify the number of cells used for the address and size of the
    xen,static-heap property under "chosen".

---


