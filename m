Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B2DEB13AF5
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jul 2025 15:03:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1061471.1427057 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugNVd-0000jA-Ra; Mon, 28 Jul 2025 13:03:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1061471.1427057; Mon, 28 Jul 2025 13:03:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugNVd-0000hO-Ov; Mon, 28 Jul 2025 13:03:17 +0000
Received: by outflank-mailman (input) for mailman id 1061471;
 Mon, 28 Jul 2025 13:03:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1ugNVc-0000hI-En
 for xen-devel@lists.xenproject.org; Mon, 28 Jul 2025 13:03:16 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1ugNVa-005o4Z-2k;
 Mon, 28 Jul 2025 13:03:14 +0000
Received: from [2a01:cb15:80df:da00:7360:a082:15b4:b94d] (helo=l14)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1ugNVa-00Ek4U-1r;
 Mon, 28 Jul 2025 13:03:14 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date;
	bh=u+Fjf4MM40khgh+20MZwMimyxt1O9LssdNjA0JtQTFI=; b=Yi7GbuFuzLgkzFPQxwbePKjl+g
	ObnSU/TQW62dUGb/DI54qCMBrgLJ3zILDZaHW1i8+zA6UUmmp4q7c3zOrlto5mazMC3b2IQhbCJz8
	u4Yt08fiX129ai43BCN/z2Hs0Uh45p+AbnuU0EcivsbHM6fncHQJV8hJpjpxyP6AUVlE=;
Date: Mon, 28 Jul 2025 15:03:13 +0200
From: Anthony PERARD <anthony@xenproject.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: Penny Zheng <Penny.Zheng@amd.com>, ray.huang@amd.com,
	Anthony PERARD <anthony.perard@vates.tech>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v6 03/19] tools: optimize cpufreq average freq print
Message-ID: <aId1EekhNMLcmAYL@l14>
References: <20250711035106.2540522-1-Penny.Zheng@amd.com>
 <20250711035106.2540522-4-Penny.Zheng@amd.com>
 <09887347-4b42-46f9-8462-0b76babb2617@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <09887347-4b42-46f9-8462-0b76babb2617@suse.com>

On Wed, Jul 16, 2025 at 04:43:32PM +0200, Jan Beulich wrote:
> On 11.07.2025 05:50, Penny Zheng wrote:
> > Unlike Cx/Px states, for which we need an extra loop to summerize residency (
> > sum_cx[]/sum_px[]), we could call get_avgfreq_by_cpuid() right before printing.
> > Also, with later introduction of CPPC mode, average frequency print shall
> > not depend on the existence of legacy P-states, so we remove "px_cap"
> > dependancy check.
> > 
> > Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 
Anthony PERARD

