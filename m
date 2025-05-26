Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA4EAC417F
	for <lists+xen-devel@lfdr.de>; Mon, 26 May 2025 16:34:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.997566.1378390 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJYu5-0004eH-5G; Mon, 26 May 2025 14:34:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 997566.1378390; Mon, 26 May 2025 14:34:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJYu5-0004bF-2N; Mon, 26 May 2025 14:34:13 +0000
Received: by outflank-mailman (input) for mailman id 997566;
 Mon, 26 May 2025 14:34:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1uJYu3-0004b9-8f
 for xen-devel@lists.xenproject.org; Mon, 26 May 2025 14:34:11 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uJYu2-003OP6-2v;
 Mon, 26 May 2025 14:34:10 +0000
Received: from [2a01:e0a:1da:8420:b77:bd5:6e45:7633] (helo=l14)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uJYu3-00Bmtu-0J;
 Mon, 26 May 2025 14:34:10 +0000
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
	bh=1ENZNcDzO+xScv+fTFRC0CFrTj/9FwGl3dHz7I3b7Og=; b=UCMY+tXhXjlhS2R3VjSZL2LoCK
	9OYd0tjKWne37PRTfLakndjWbbUgu+jKTGvcSlZMTwOY6738x+GRbyy08wPfcq8W7Me72zkVhWpXi
	LZm8YkC1iTl9gTjvXWSagURgxWN+LLoggV+NUf5GjxwfzxPSk5BQOvLzs6NcLELCrA+Y=;
Date: Mon, 26 May 2025 16:34:09 +0200
From: Anthony PERARD <anthony@xenproject.org>
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: [PATCH v2 5/5] libxc/PM: Retry get_pxstat if data is incomplete
Message-ID: <aDR74T0QiCxs0Mw7@l14>
References: <20250512144656.314925-1-ross.lagerwall@citrix.com>
 <20250512144656.314925-6-ross.lagerwall@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250512144656.314925-6-ross.lagerwall@citrix.com>

On Mon, May 12, 2025 at 03:46:56PM +0100, Ross Lagerwall wrote:
> If the total returned by Xen is more than the number of elements
> allocated, it means that the buffer was too small and so the data is
> incomplete. Retry to get all the data.
> 
> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>

Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 
Anthony PERARD

