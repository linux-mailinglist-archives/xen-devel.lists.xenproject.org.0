Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC23AB13B06
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jul 2025 15:09:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1061477.1427067 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugNbL-0001JM-ES; Mon, 28 Jul 2025 13:09:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1061477.1427067; Mon, 28 Jul 2025 13:09:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugNbL-0001Gb-Bs; Mon, 28 Jul 2025 13:09:11 +0000
Received: by outflank-mailman (input) for mailman id 1061477;
 Mon, 28 Jul 2025 13:09:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1ugNbK-0001GV-CI
 for xen-devel@lists.xenproject.org; Mon, 28 Jul 2025 13:09:10 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1ugNbJ-005oBR-37;
 Mon, 28 Jul 2025 13:09:09 +0000
Received: from [2a01:cb15:80df:da00:7360:a082:15b4:b94d] (helo=l14)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1ugNbJ-00EkCH-24;
 Mon, 28 Jul 2025 13:09:09 +0000
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
	bh=TX6TDbyC+cgck+UOKNEGIQSszsivvsi5MwzkDj3nmwY=; b=VTW53fWPAB9C2jWBpSnbS2DNpk
	oxQ9e84EV6nNkgZl5xznENXpPjG/s+NQwk5wXSQbBok4WSN0y42bECdlPi4dQ1GtWfN5Pn9Hl+mY3
	qzHI2HP2UDHq6N603NoWeTJpZ7UZJaNj8DHMciKJnXpza8zA2WNMnAC6ugWuuMhOikN0=;
Date: Mon, 28 Jul 2025 15:09:07 +0200
From: Anthony PERARD <anthony@xenproject.org>
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: xen-devel@lists.xenproject.org, ray.huang@amd.com,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v6 07/19] cpufreq: rename "xen_cppc_para" to
 "xen_get_cppc_para"
Message-ID: <aId2c3hKGkdTgcfX@l14>
References: <20250711035106.2540522-1-Penny.Zheng@amd.com>
 <20250711035106.2540522-8-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250711035106.2540522-8-Penny.Zheng@amd.com>

On Fri, Jul 11, 2025 at 11:50:54AM +0800, Penny Zheng wrote:
> As we are going to add "struct xen_cppc_para" in "struct xen_sysctl_pm_op" as
> a new xenpm sub-op later to specifically dealing with CPPC-info, we need to
> follow the naming pattern, to change the struct name to "xen_get_cppc_para",
> which is more suitable than "xen_cppc_para".
> 
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>

Acked-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 
Anthony PERARD

