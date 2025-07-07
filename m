Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D12AFB2E1
	for <lists+xen-devel@lfdr.de>; Mon,  7 Jul 2025 14:06:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1035548.1407863 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYkcC-0003Tf-SJ; Mon, 07 Jul 2025 12:06:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1035548.1407863; Mon, 07 Jul 2025 12:06:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYkcC-0003SH-Pj; Mon, 07 Jul 2025 12:06:32 +0000
Received: by outflank-mailman (input) for mailman id 1035548;
 Mon, 07 Jul 2025 12:06:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=paoO=ZU=arm.com=hari.limaye@srs-se1.protection.inumbo.net>)
 id 1uYkcB-0003SB-97
 for xen-devel@lists.xenproject.org; Mon, 07 Jul 2025 12:06:31 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id d0a188ad-5b2a-11f0-a316-13f23c93f187;
 Mon, 07 Jul 2025 14:06:29 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A9805168F;
 Mon,  7 Jul 2025 05:06:16 -0700 (PDT)
Received: from PWQ0QT7DJ1 (unknown [10.57.86.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3E37C3F694;
 Mon,  7 Jul 2025 05:06:28 -0700 (PDT)
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
X-Inumbo-ID: d0a188ad-5b2a-11f0-a316-13f23c93f187
Date: Mon, 7 Jul 2025 13:06:26 +0100
From: Hari Limaye <hari.limaye@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
Cc: xen-devel@lists.xenproject.org, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 2/2] xen/arm: Skip loops in init_pdx() when no PDX
 compression is used
Message-ID: <s7s5lxrywlfaczbwa5tr2i34mne2o5klzzavhfl4swhumcm4kq@pzn5pgbl7em4>
References: <20250704075428.33485-1-michal.orzel@amd.com>
 <20250704075428.33485-3-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704075428.33485-3-michal.orzel@amd.com>

Apologies for noise, my previous message was missing the intended tags:

On Fri, Jul 04, 2025 at 09:54:28AM +0000, Michal Orzel wrote:
> When CONFIG_PDX_COMPRESSION=n, pdx_init_mask(), pdx_region_mask() and
> pfn_pdx_hole_setup() are just stubs doing nothing. It does not make
> sense to keep the two loops iterating over all the memory banks.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> ---
Reviewed-by: Hari Limaye <hari.limaye@arm.com>
Tested-by: Hari Limaye <hari.limaye@arm.com>

Cheers,
Hari

