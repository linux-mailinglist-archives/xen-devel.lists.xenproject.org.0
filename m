Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF2F7A8886D
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 18:19:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.950863.1347050 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4MWo-00049j-JU; Mon, 14 Apr 2025 16:19:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 950863.1347050; Mon, 14 Apr 2025 16:19:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4MWo-000472-Gr; Mon, 14 Apr 2025 16:19:22 +0000
Received: by outflank-mailman (input) for mailman id 950863;
 Mon, 14 Apr 2025 16:19:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1u4MWn-00046w-2Q
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 16:19:21 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1u4MWm-00ExLW-15;
 Mon, 14 Apr 2025 16:19:20 +0000
Received: from [2a01:e0a:1da:8420:b77:bd5:6e45:7633] (helo=l14)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1u4MWm-00G1om-08;
 Mon, 14 Apr 2025 16:19:20 +0000
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
	bh=svbV5NyPXDi1/wdYVbuJQdvd/CAfioHIogm1myljxiM=; b=DMTKakYO7e7NRxgeHOQ4+Aet5m
	B5Zaix8nbPdhDQeGDzi+JRTKRIgmJu6UmZ1fOKKGkHHOegQzHWyjFV7d8le31l/sSAQHoO2rV7rg/
	cCq2u6JNoDtsVePmr9hZV6F8kW3sDE/OC1z8kRNXAII1PMk/QyDNQy2uqIbDNiLwLC9w=;
Date: Mon, 14 Apr 2025 18:19:18 +0200
From: Anthony PERARD <anthony@xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH v3 1/6] CI: Rename intermediate artefacts in qemu-*
 scripts
Message-ID: <Z_01hhSZzgcsrYp8@l14>
References: <20250414110903.2355303-1-andrew.cooper3@citrix.com>
 <20250414110903.2355303-2-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250414110903.2355303-2-andrew.cooper3@citrix.com>

On Mon, Apr 14, 2025 at 12:08:58PM +0100, Andrew Cooper wrote:
> Right now, we have initrd.cpio.gz as domU, and initrd.tar.gz as the base for
> dom0.
> 
> Rename initrd.cpio.gz to domU-rootfs.cpio.gz, and xen-rootfs.cpio.gz to
> dom0-rootfs.cpio.gz to make it clearer which is which.  Rename the VM from
> test to domU.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

This also rename some long option into short options without an
explanation, but the change looks fine. (I usually prefer long options
in scripts because it means you don't need to check `man` to figure out
what a command line does.)

Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 
Anthony PERARD

