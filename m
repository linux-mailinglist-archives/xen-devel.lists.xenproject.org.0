Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF9DB26273
	for <lists+xen-devel@lfdr.de>; Thu, 14 Aug 2025 12:23:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1081346.1441466 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umV6h-0003c1-PL; Thu, 14 Aug 2025 10:22:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1081346.1441466; Thu, 14 Aug 2025 10:22:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umV6h-0003aq-Lq; Thu, 14 Aug 2025 10:22:51 +0000
Received: by outflank-mailman (input) for mailman id 1081346;
 Thu, 14 Aug 2025 10:22:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XPh+=22=arm.com=hari.limaye@srs-se1.protection.inumbo.net>)
 id 1umV6g-0003ai-6O
 for xen-devel@lists.xenproject.org; Thu, 14 Aug 2025 10:22:50 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id a0a21fa4-78f8-11f0-a328-13f23c93f187;
 Thu, 14 Aug 2025 12:22:49 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 76D291691;
 Thu, 14 Aug 2025 03:22:40 -0700 (PDT)
Received: from PWQ0QT7DJ1 (unknown [10.1.25.63])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7DC843F738;
 Thu, 14 Aug 2025 03:22:47 -0700 (PDT)
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
X-Inumbo-ID: a0a21fa4-78f8-11f0-a328-13f23c93f187
Date: Thu, 14 Aug 2025 11:22:45 +0100
From: Hari Limaye <hari.limaye@arm.com>
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: xen-devel@lists.xenproject.org, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 2/2] arm/mpu: Disable map_domain_page for MPU
Message-ID: <sh2gz445h5xjwa6hwcan6brj7sxytupauuzkftx5lb6wexemcd@27tefgoernfh>
References: <20250814081959.3504145-1-ayan.kumar.halder@amd.com>
 <20250814081959.3504145-3-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250814081959.3504145-3-ayan.kumar.halder@amd.com>

Hi Ayan,

> On Thu, Aug 14, 2025 at 09:19:59AM +0000, Ayan Kumar Halder wrote:
> There is no domheap for ARM_32. All of the RAM is mapped and VA == PA.
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
> Changes from :-
> 
> v1 - 1. No changes.
> 
Slightly surprised by this, as it looks like the suggested change from
https://patchwork.kernel.org/comment/26507841/ has been incorporated in
this v2 version of the patch...

But anyway, LGTM now!

Reviewed-by: Hari Limaye <hari.limaye@arm.com>
Tested-by: Hari Limaye <hari.limaye@arm.com>

Cheers,
Hari

