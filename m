Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C663B16407
	for <lists+xen-devel@lfdr.de>; Wed, 30 Jul 2025 18:03:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1064195.1429936 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh9G8-00006b-GR; Wed, 30 Jul 2025 16:02:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1064195.1429936; Wed, 30 Jul 2025 16:02:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh9G8-0008V4-DG; Wed, 30 Jul 2025 16:02:28 +0000
Received: by outflank-mailman (input) for mailman id 1064195;
 Wed, 30 Jul 2025 16:02:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1uh9G7-0008Uy-6T
 for xen-devel@lists.xenproject.org; Wed, 30 Jul 2025 16:02:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uh9G6-009Df1-2G;
 Wed, 30 Jul 2025 16:02:26 +0000
Received: from [2a01:cb15:80df:da00:4c1a:a750:6210:2b8] (helo=l14)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uh9G6-00H42r-1J;
 Wed, 30 Jul 2025 16:02:26 +0000
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
	bh=w+fPbulDs/ADuFosdMYVyq+7SMAW5XjUTkdBgX/5in4=; b=4Mo1q/5YqQovrDYWzq3N/PNEuf
	vHGJqW3/wfdl8UC2l1s6S89a4nWhTQyYDnl4F8swc/Ud2EFxEsdIljwWDvusMq1GX3+2f8GKvGPq1
	q5ae10W68sfigBL8iKHGmi+Gr9ZtkUfBZ7ZM69ZTGfF9wKEFFC2LkMXvN/aRgfNkYcok=;
Date: Wed, 30 Jul 2025 18:02:24 +0200
From: Anthony PERARD <anthony@xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jason Andryuk <jason.andryuk@amd.com>
Subject: Re: [PATCH v2 6/7] tools/xl: add available Xenstore features to xl
 info output
Message-ID: <aIpCECTUe1YRq_Wp@l14>
References: <20250725131928.19286-1-jgross@suse.com>
 <20250725131928.19286-7-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250725131928.19286-7-jgross@suse.com>

On Fri, Jul 25, 2025 at 03:19:27PM +0200, Juergen Gross wrote:
> Add the Xenstore feature value to the output of "xl info" in order to
> prepare for a future capability to limit Xenstore features visible by
> a guest.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Acked-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 
Anthony PERARD

