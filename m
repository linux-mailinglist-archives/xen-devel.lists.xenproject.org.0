Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E11B13AD0
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jul 2025 14:53:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1061463.1427048 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugNMF-0007Sk-0s; Mon, 28 Jul 2025 12:53:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1061463.1427048; Mon, 28 Jul 2025 12:53:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugNME-0007QH-TZ; Mon, 28 Jul 2025 12:53:34 +0000
Received: by outflank-mailman (input) for mailman id 1061463;
 Mon, 28 Jul 2025 12:53:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1ugNMD-0007QB-K3
 for xen-devel@lists.xenproject.org; Mon, 28 Jul 2025 12:53:33 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1ugNMD-005nrH-0R;
 Mon, 28 Jul 2025 12:53:33 +0000
Received: from [2a01:cb15:80df:da00:7360:a082:15b4:b94d] (helo=l14)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1ugNMC-00EjhK-2n;
 Mon, 28 Jul 2025 12:53:33 +0000
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
	bh=JdDgA3ExoG96PBBxt2uUWEl/kCoWggIdO+v0R0xEW8o=; b=X3Ed0hiVXZbVjh4j/Vy2DZ3PJL
	S52tIpAANf8DeG+AzanSXzL0hQK1j/O/2YSHWXk8FuK5RmUjKorY0JpkyuC3x8AogC5I3vAeU3VDY
	pROYNa76ITZYsOq0jTTHR4b89MWn8wL3mKcIMwDBYOLv91XZXzNM6p89q72ySjY/WmJc=;
Date: Mon, 28 Jul 2025 14:53:31 +0200
From: Anthony PERARD <anthony@xenproject.org>
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: xen-devel@lists.xenproject.org, ray.huang@amd.com,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v6 02/19] tools: drop "has_num" condition check for cppc
 mode
Message-ID: <aIdyy_8SLxwqgbmT@l14>
References: <20250711035106.2540522-1-Penny.Zheng@amd.com>
 <20250711035106.2540522-3-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250711035106.2540522-3-Penny.Zheng@amd.com>

On Fri, Jul 11, 2025 at 11:50:49AM +0800, Penny Zheng wrote:
> In `xenpm get-cpufreq-para <cpuid>`, ->freq_num and ->cpu_num checking are
> tied together via variable "has_num", while ->freq_num only has non-zero value
> when cpufreq driver in legacy P-states mode.
> 
> So we drop the "has_num" condition check, and mirror the ->gov_num check for
> both ->freq_num and ->cpu_num in xc_get_cpufreq_para().
> 
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>

Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 
Anthony PERARD

