Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8C6B1515A
	for <lists+xen-devel@lfdr.de>; Tue, 29 Jul 2025 18:32:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1062899.1428627 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugnFO-0005pM-UF; Tue, 29 Jul 2025 16:32:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1062899.1428627; Tue, 29 Jul 2025 16:32:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugnFO-0005ml-Rd; Tue, 29 Jul 2025 16:32:14 +0000
Received: by outflank-mailman (input) for mailman id 1062899;
 Tue, 29 Jul 2025 16:32:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1ugnFN-0005mf-BB
 for xen-devel@lists.xenproject.org; Tue, 29 Jul 2025 16:32:13 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1ugnFM-007YPH-2C;
 Tue, 29 Jul 2025 16:32:12 +0000
Received: from [2a01:e0a:1da:8420:b77:bd5:6e45:7633] (helo=l14)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1ugnFM-00FwxE-1K;
 Tue, 29 Jul 2025 16:32:12 +0000
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
	bh=vq/RUHEr83nZwRsYtReCbvPTa5Ni8jjJazhUEPja44E=; b=R/pUPNHZC3o8B9nDF2V3TVP9k1
	0KJAiYfmN7TNA9hYicZRnemS6Nijl9iNG+SwTcm1HHKWoZTRJE+fZOVupk6cT1LQezN/bL6UGMYBW
	v2rnLayoYRHpYtS9zw4jIwfa9s+aqxWODYBjFKnQ81+qiqw6OfoS5Hj1poEPZzwpngSQ=;
Date: Tue, 29 Jul 2025 18:32:10 +0200
From: Anthony PERARD <anthony@xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jason Andryuk <jason.andryuk@amd.com>
Subject: Re: [PATCH v2 2/9] libevtchn: add O_CLOEXEC support for Mini-OS
Message-ID: <aIj3ikQ0zk0Vi-x3@l14>
References: <20250729110146.10580-1-jgross@suse.com>
 <20250729110146.10580-3-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250729110146.10580-3-jgross@suse.com>

On Tue, Jul 29, 2025 at 01:01:38PM +0200, Juergen Gross wrote:
> With Mini-OS now supporting O_CLOEXEC for the kexec case, no longer
> ignore the XENEVTCHN_NO_CLOEXEC flag in minios.c.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Acked-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 
Anthony PERARD

