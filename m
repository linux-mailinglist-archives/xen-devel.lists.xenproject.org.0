Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15402ADAD88
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jun 2025 12:38:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1017131.1394101 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR7ER-0008Dm-7F; Mon, 16 Jun 2025 10:38:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1017131.1394101; Mon, 16 Jun 2025 10:38:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR7ER-0008Ac-48; Mon, 16 Jun 2025 10:38:27 +0000
Received: by outflank-mailman (input) for mailman id 1017131;
 Mon, 16 Jun 2025 10:38:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KlDv=Y7=arm.com=hari.limaye@srs-se1.protection.inumbo.net>)
 id 1uR7EQ-0007tf-3o
 for xen-devel@lists.xenproject.org; Mon, 16 Jun 2025 10:38:26 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 06e16277-4a9e-11f0-a309-13f23c93f187;
 Mon, 16 Jun 2025 12:38:23 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 20AF6150C;
 Mon, 16 Jun 2025 03:38:01 -0700 (PDT)
Received: from PWQ0QT7DJ1 (unknown [10.57.64.69])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5303E3F58B;
 Mon, 16 Jun 2025 03:38:21 -0700 (PDT)
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
X-Inumbo-ID: 06e16277-4a9e-11f0-a309-13f23c93f187
Date: Mon, 16 Jun 2025 11:38:19 +0100
From: Hari Limaye <hari.limaye@arm.com>
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: xen-devel@lists.xenproject.org, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 5/6] arm/mpu: Define arm32 system registers
Message-ID: <n2sff6r653loabxjo3n5bkqkpfo2sfz33ugnhpzme6dxv5qko4@nsz7m43u7t2w>
References: <20250611143544.3453532-1-ayan.kumar.halder@amd.com>
 <20250611143544.3453532-6-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250611143544.3453532-6-ayan.kumar.halder@amd.com>

Hi Ayan,

I checked the register definitions for HPR{B,L}AR<n> against the Arm
Architecture Reference Manual Supplement for the Armv8-R AArch32
architecture profile (ARM DDI 0568A.c), specifically sections E2.2.3 and
E2.2.6, and everything looks correct to me.

On Wed, Jun 11, 2025 at 03:35:43PM +0000, Ayan Kumar Halder wrote:
> Fix the definition for HPRLAR.
> Define the base/limit address registers to access the first 32 protection
> regions.
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---

Reviewed-by: Hari Limaye <hari.limaye@arm.com>

Many thanks,
Hari

