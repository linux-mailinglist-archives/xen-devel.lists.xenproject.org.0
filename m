Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B874AB106AF
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jul 2025 11:43:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1055554.1423936 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uesTg-0001p7-DM; Thu, 24 Jul 2025 09:43:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1055554.1423936; Thu, 24 Jul 2025 09:43:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uesTg-0001me-9l; Thu, 24 Jul 2025 09:43:04 +0000
Received: by outflank-mailman (input) for mailman id 1055554;
 Thu, 24 Jul 2025 09:43:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1uesTe-0001mL-OM
 for xen-devel@lists.xenproject.org; Thu, 24 Jul 2025 09:43:02 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uesTe-00GVhP-1b;
 Thu, 24 Jul 2025 09:43:02 +0000
Received: from [2a01:cb15:80df:da00:e2a9:ff82:7bde:38cd] (helo=l14)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uesTe-00ASwP-0h;
 Thu, 24 Jul 2025 09:43:02 +0000
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
	bh=SJO2HIWHlYuekrnkmqc7PrJ14+H4otz8JSGqD64hiH4=; b=1WIttA/isoAweyA043nPtUSjKf
	0EPZKgJDXM97jHR+3/AGtlfivyXjrV+XKAq4QymTf8BUPsXziO0CBYDH3i0sSHTnugQdrlH9trHyy
	M05yHO6GhwXDyLAIENoGoG0MMteu4WCNpiJPzdYPBvIaTlhmG4xUpGlRNXIIgQOIvcAo=;
Date: Thu, 24 Jul 2025 11:43:00 +0200
From: Anthony PERARD <anthony@xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: [PATCH] libxl: allow to run non-HVM guest without any device
 model being available
Message-ID: <aIIAJDOQ63u9udX_@l14>
References: <20250711091944.26603-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250711091944.26603-1-jgross@suse.com>

On Fri, Jul 11, 2025 at 11:19:44AM +0200, Juergen Gross wrote:
> When removing qemu-trad support, libxl__domain_build_info_setdefault()
> was modified to only allow qemu-xen as a device model. This change
> resulted in an error at domain creation when qemu-xen isn't there.
> 
> As this is a perfectly fine situation for PV and PVH guests without
> any qemu based backends, handle this case gracefully.
> 
> Fixes: 19ab8356abe4 ("tools: remove support for running a guest with qemu-traditional")
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 
Anthony PERARD

