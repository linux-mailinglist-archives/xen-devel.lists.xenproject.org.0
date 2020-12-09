Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC8D2D380E
	for <lists+xen-devel@lfdr.de>; Wed,  9 Dec 2020 02:03:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.47928.84788 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmnsf-0001i7-C9; Wed, 09 Dec 2020 01:02:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 47928.84788; Wed, 09 Dec 2020 01:02:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmnsf-0001hi-8k; Wed, 09 Dec 2020 01:02:57 +0000
Received: by outflank-mailman (input) for mailman id 47928;
 Wed, 09 Dec 2020 01:02:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/xMB=FN=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kmnse-0001hd-6P
 for xen-devel@lists.xenproject.org; Wed, 09 Dec 2020 01:02:56 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e6b084aa-293d-41db-82bc-074eafd94f2e;
 Wed, 09 Dec 2020 01:02:55 +0000 (UTC)
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
X-Inumbo-ID: e6b084aa-293d-41db-82bc-074eafd94f2e
Date: Tue, 8 Dec 2020 17:02:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1607475774;
	bh=9APXSBnwBZtieHDgiJUZOHBuoT5Tf8+YqVIQ/YNNfR8=;
	h=From:To:cc:Subject:In-Reply-To:References:From;
	b=ZrzRqDbmSA0n9qPk66IQ7v+ZKbVyNU6Mn+n5gD2Xf5Ktsf7/eXLUDGPKRbBRg++Zx
	 KQKWm9/sc+MKIesVl6nIs/y7adHx4idJ5I7fnqYaLDuv+BwiQrDkLRRsiKxB/hVbB/
	 AQgeXsXm535yFRSHFX2AzvXjzWWlgj+GmCjYlKC7vT7z8W709jXIx4vtKzx8HsXcJo
	 y2+o5vk/BlYuYqNaLBQuBLqePnWHudpa4HAJaEGSChyQpmbIEFRZHdLLQc5xKmka8M
	 0Mrg2Fzn8d3S5WeUS+lv3BLbdq6vzBy/s2rp50wwZQUXG7hjLRYzntMhNGDNePqEd/
	 pPKr5Au3qy5+w==
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: xen-devel@lists.xenproject.org
cc: famzheng@amazon.com, sstabellini@kernel.org, cardoe@cardoe.com, wl@xen.org, 
    Bertrand.Marquis@arm.com, julien@xen.org, andrew.cooper3@citrix.com
Subject: Re: [PATCH v6 00/25] xl / libxl: named PCI pass-through devices
In-Reply-To: <160746448732.12203.10647684023172140005@600e7e483b3a>
Message-ID: <alpine.DEB.2.21.2012081702420.20986@sstabellini-ThinkPad-T480s>
References: <160746448732.12203.10647684023172140005@600e7e483b3a>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

The pipeline failed because the "fedora-gcc-debug" build failed with a
timeout: 

ERROR: Job failed: execution took longer than 1h0m0s seconds

given that all the other jobs passed (including the other Fedora job), I
take this failed because the gitlab-ci x86 runners were overloaded?


On Tue, 8 Dec 2020, no-reply@patchew.org wrote:
> Hi,
> 
> Patchew automatically ran gitlab-ci pipeline with this patch (series) applied, but the job failed. Maybe there's a bug in the patches?
> 
> You can find the link to the pipeline in the beginning of the report below:
> 
> Type: series
> Message-id: 20201208193033.11306-1-paul@xen.org
> Subject: [PATCH v6 00/25] xl / libxl: named PCI pass-through devices
> 
> === TEST SCRIPT BEGIN ===
> #!/bin/bash
> sleep 10
> patchew gitlab-pipeline-check -p xen-project/patchew/xen
> === TEST SCRIPT END ===
> 
> warning: redirecting to https://gitlab.com/xen-project/patchew/xen.git/
> From https://gitlab.com/xen-project/patchew/xen
>    5e666356a9..4b0e0db861  master     -> master
> warning: redirecting to https://gitlab.com/xen-project/patchew/xen.git/
> From https://gitlab.com/xen-project/patchew/xen
>  * [new tag]               patchew/20201208193033.11306-1-paul@xen.org -> patchew/20201208193033.11306-1-paul@xen.org
> Switched to a new branch 'test'
> 6c78dcb6d3 libxl / libxlu: support 'xl pci-attach/detach' by name
> 117f736c8b docs/man: modify xl-pci-configuration(5) to add 'name' field to PCI_SPEC_STRING
> 38e63698d6 xl: support naming of assignable devices
> 32b064a4a2 libxl: introduce libxl_pci_bdf_assignable_add/remove/list/list_free(), ...
> 830b6fa734 libxl: convert internal functions in libxl_pci.c...
> d5d5d08e3b docs/man: modify xl(1) in preparation for naming of assignable devices
> bb4cbf5856 libxlu: introduce xlu_pci_parse_spec_string()
> 62f09b89d2 libxl: introduce 'libxl_pci_bdf' in the idl...
> eb3c3ecef6 docs/man: fix xl(1) documentation for 'pci' operations
> cab74a871d docs/man: improve documentation of PCI_SPEC_STRING...
> da45af2de8 docs/man: extract documentation of PCI_SPEC_STRING from the xl.cfg manpage...
> 797b0fd3d4 libxl: use COMPARE_PCI() macro is_pci_in_array()...
> 2c0d9b579f libxl: add libxl_device_pci_assignable_list_free()...
> 1d4d73044e libxl: make sure callers of libxl_device_pci_list() free the list after use
> 24150e4156 libxl: remove get_all_assigned_devices() from libxl_pci.c
> a3d908d5a2 libxl: remove unnecessary check from libxl__device_pci_add()
> ada8e55b23 libxl: generalise 'driver_path' xenstore access functions in libxl_pci.c
> a38482aa96 libxl: stop using aodev->device_config in libxl__device_pci_add()...
> d115527623 libxl: remove extraneous arguments to do_pci_remove() in libxl_pci.c
> b1369310e6 libxl: s/detatched/detached in libxl_pci.c
> 4ccef90ca8 libxl: add/recover 'rdm_policy' to/from PCI backend in xenstore
> 09d3adddb4 libxl: Make sure devices added by pci-attach are reflected in the config
> e2feb1c29b libxl: make libxl__device_list() work correctly for LIBXL__DEVICE_KIND_PCI...
> 8599a6a85e xl: s/pcidev/pci where possible
> 4648bbbb01 libxl: s/pcidev/pci and remove DEFINE_DEVICE_TYPE_STRUCT_X
> 
> === OUTPUT BEGIN ===
> [2020-12-08 20:09:14] Looking up pipeline...
> [2020-12-08 20:09:14] Found pipeline 226993561:
> 
> https://gitlab.com/xen-project/patchew/xen/-/pipelines/226993561
> 
> [2020-12-08 20:09:14] Waiting for pipeline to finish...
> [2020-12-08 20:24:18] Still waiting...
> [2020-12-08 20:39:23] Still waiting...
> [2020-12-08 20:54:28] Still waiting...
> [2020-12-08 21:09:32] Still waiting...
> [2020-12-08 21:24:36] Still waiting...
> [2020-12-08 21:39:41] Still waiting...
> [2020-12-08 21:54:45] Still waiting...
> [2020-12-08 21:54:46] Pipeline failed
> [2020-12-08 21:54:46] Job 'qemu-smoke-x86-64-clang-pvh' in stage 'test' is skipped
> [2020-12-08 21:54:46] Job 'qemu-smoke-x86-64-gcc-pvh' in stage 'test' is skipped
> [2020-12-08 21:54:46] Job 'qemu-smoke-x86-64-clang' in stage 'test' is skipped
> [2020-12-08 21:54:46] Job 'qemu-smoke-x86-64-gcc' in stage 'test' is skipped
> [2020-12-08 21:54:46] Job 'build-each-commit-gcc' in stage 'test' is skipped
> === OUTPUT END ===
> 
> Test command exited with code: 1

