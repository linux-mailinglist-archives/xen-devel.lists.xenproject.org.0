Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E39FBB26242
	for <lists+xen-devel@lfdr.de>; Thu, 14 Aug 2025 12:18:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1081275.1441412 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umV2j-00082F-Ec; Thu, 14 Aug 2025 10:18:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1081275.1441412; Thu, 14 Aug 2025 10:18:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umV2j-000807-BQ; Thu, 14 Aug 2025 10:18:45 +0000
Received: by outflank-mailman (input) for mailman id 1081275;
 Thu, 14 Aug 2025 10:18:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XPh+=22=arm.com=hari.limaye@srs-se1.protection.inumbo.net>)
 id 1umV2h-0007T4-Kf
 for xen-devel@lists.xenproject.org; Thu, 14 Aug 2025 10:18:43 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 0d803d3a-78f8-11f0-a328-13f23c93f187;
 Thu, 14 Aug 2025 12:18:42 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B082D1691;
 Thu, 14 Aug 2025 03:18:33 -0700 (PDT)
Received: from PWQ0QT7DJ1 (unknown [10.1.25.63])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D73E93F738;
 Thu, 14 Aug 2025 03:18:40 -0700 (PDT)
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
X-Inumbo-ID: 0d803d3a-78f8-11f0-a328-13f23c93f187
Date: Thu, 14 Aug 2025 11:18:38 +0100
From: Hari Limaye <hari.limaye@arm.com>
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: xen-devel@lists.xenproject.org, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 1/2] arm/mpu: Enable is_xen_heap_page and
 is_xen_heap_mfn for ARM_32
Message-ID: <c7bks6njcnclgkeluhu53pghivf7rwsm7fqbo7zultkrtn2wcj@xyzsxrg4sjzx>
References: <20250814081959.3504145-1-ayan.kumar.halder@amd.com>
 <20250814081959.3504145-2-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250814081959.3504145-2-ayan.kumar.halder@amd.com>

Hi Ayan,

On Thu, Aug 14, 2025 at 09:19:58AM +0000, Ayan Kumar Halder wrote:
> In case of ARM_32, all of the RAM will be covered by a permanent contiguous
> mapping (where VA == PA) and there will be a single heap. Thus, the memory
> allocated from Xen heap uses PGC_xen_heap.
> This is similar to the scenario described for
> "CONFIG_SEPARATE_XENHEAP=n W/ DIRECT MAP OF ALL RAM" in common/page_alloc.c.
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Reviewed-by: Hari Limaye <hari.limaye@arm.com>
Tested-by: Hari Limaye <hari.limaye@arm.com>

LGTM now, thanks for updating. Tested (build-only) on AArch32 and
AArch64 MMU and MPU systems.

Cheers,
Hari

