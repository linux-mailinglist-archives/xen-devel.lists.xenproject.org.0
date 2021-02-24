Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A05633241A8
	for <lists+xen-devel@lfdr.de>; Wed, 24 Feb 2021 17:11:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.89416.168409 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEwkR-00038Z-Td; Wed, 24 Feb 2021 16:10:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89416.168409; Wed, 24 Feb 2021 16:10:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEwkR-00038A-QC; Wed, 24 Feb 2021 16:10:47 +0000
Received: by outflank-mailman (input) for mailman id 89416;
 Wed, 24 Feb 2021 16:10:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Stqq=H2=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lEwkQ-00037z-8b
 for xen-devel@lists.xenproject.org; Wed, 24 Feb 2021 16:10:46 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 80206928-ca3c-4b9d-9c0e-0ad097b89912;
 Wed, 24 Feb 2021 16:10:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 99A4464E85;
 Wed, 24 Feb 2021 16:10:43 +0000 (UTC)
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
X-Inumbo-ID: 80206928-ca3c-4b9d-9c0e-0ad097b89912
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1614183044;
	bh=RydWjR9rmx1rTgF2ZPUiw0PUBYV8+Yvncu4LGjo6n5Q=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=EucmxhATepma7+AGRkbW5eATbt8F5hMJjCSUVAwW67d9z5TRF2lSBguOuCn6d1GPq
	 0wJkrNC3tVWoSY+67v7mgf9hWiXMQRthEcx2OmRFilM+u+cDl8DJU3d729/MPAJnBD
	 de/xFjF5Hha5S2fx98b5tf+vzfmtvs2ATTLVgF4exKqugYH64xqCh/fjn9OVk8Kt7e
	 iqFadb6LLzEzfBQpItBOJw0X76XFA/nNUyzCc1WNdvUT9X3P0VN+Bq7OkfpZi/IlQ/
	 CklWyOPNA9C5SkwWTCbD52W7aTxLKv3CMgqU/HJUhCRiEuFS4+SfbFSMrCDtmS8xxx
	 BxP5EVES4YUPg==
Date: Wed, 24 Feb 2021 08:10:42 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: xen-devel@lists.xenproject.org
cc: famzheng@amazon.com, sstabellini@kernel.org, cardoe@cardoe.com, wl@xen.org, 
    Bertrand.Marquis@arm.com, julien@xen.org, andrew.cooper3@citrix.com
Subject: Re: [PATCH 0/2] hvmloader: drop usage of system headers
In-Reply-To: <161416925933.13232.13004550022767558137@c667a6b167f6>
Message-ID: <alpine.DEB.2.21.2102240809270.3234@sstabellini-ThinkPad-T480s>
References: <161416925933.13232.13004550022767558137@c667a6b167f6>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi Roger,

These seems to be genuine breakages:

https://gitlab.com/xen-project/patchew/xen/-/pipelines/260986219

FYI keep an eye on the patchew gitlab-ci as you should be able to see
the alpine linux tests pass once your series is fixed.

Cheers,

Stefano


On Wed, 24 Feb 2021, no-reply@patchew.org wrote:
> Hi,
> 
> Patchew automatically ran gitlab-ci pipeline with this patch (series) applied, but the job failed. Maybe there's a bug in the patches?
> 
> You can find the link to the pipeline near the end of the report below:
> 
> Type: series
> Message-id: 20210224102641.89455-1-roger.pau@citrix.com
> Subject: [PATCH 0/2] hvmloader: drop usage of system headers
> 
> === TEST SCRIPT BEGIN ===
> #!/bin/bash
> sleep 10
> patchew gitlab-pipeline-check -p xen-project/patchew/xen
> === TEST SCRIPT END ===
> 
> warning: redirecting to https://gitlab.com/xen-project/patchew/xen.git/
> warning: redirecting to https://gitlab.com/xen-project/patchew/xen.git/
> From https://gitlab.com/xen-project/patchew/xen
>  * [new tag]               patchew/20210224102641.89455-1-roger.pau@citrix.com -> patchew/20210224102641.89455-1-roger.pau@citrix.com
> Switched to a new branch 'test'
> 471a8f9278 hvmloader: do not include system headers for type declarations
> f826f3a198 hvmloader: use Xen private header for elf structs
> 
> === OUTPUT BEGIN ===
> [2021-02-24 11:27:25] Looking up pipeline...
> [2021-02-24 11:27:27] Found pipeline 260986219:
> 
> https://gitlab.com/xen-project/patchew/xen/-/pipelines/260986219
> 
> [2021-02-24 11:27:27] Waiting for pipeline to finish...
> [2021-02-24 11:42:41] Still waiting...
> [2021-02-24 11:57:46] Still waiting...
> [2021-02-24 12:12:51] Still waiting...
> [2021-02-24 12:20:56] Pipeline failed
> [2021-02-24 12:20:58] Job 'qemu-smoke-x86-64-clang-pvh' in stage 'test' is skipped
> [2021-02-24 12:20:58] Job 'qemu-smoke-x86-64-gcc-pvh' in stage 'test' is skipped
> [2021-02-24 12:20:58] Job 'qemu-smoke-x86-64-clang' in stage 'test' is skipped
> [2021-02-24 12:20:58] Job 'qemu-smoke-x86-64-gcc' in stage 'test' is skipped
> [2021-02-24 12:20:58] Job 'qemu-smoke-arm64-gcc' in stage 'test' is skipped
> [2021-02-24 12:20:58] Job 'qemu-alpine-arm64-gcc' in stage 'test' is skipped
> [2021-02-24 12:20:58] Job 'build-each-commit-gcc' in stage 'test' is skipped
> [2021-02-24 12:20:58] Job 'alpine-3.12-clang-debug' in stage 'build' is failed
> [2021-02-24 12:20:58] Job 'alpine-3.12-clang' in stage 'build' is failed
> [2021-02-24 12:20:58] Job 'alpine-3.12-gcc-debug' in stage 'build' is failed
> [2021-02-24 12:20:58] Job 'alpine-3.12-gcc' in stage 'build' is failed
> === OUTPUT END ===
> 
> Test command exited with code: 1

