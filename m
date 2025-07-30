Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 785B1B1633C
	for <lists+xen-devel@lfdr.de>; Wed, 30 Jul 2025 16:55:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1064096.1429841 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh8Dg-0003De-SI; Wed, 30 Jul 2025 14:55:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1064096.1429841; Wed, 30 Jul 2025 14:55:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh8Dg-0003Bq-PA; Wed, 30 Jul 2025 14:55:52 +0000
Received: by outflank-mailman (input) for mailman id 1064096;
 Wed, 30 Jul 2025 14:55:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1uh8Df-0003Bk-Qe
 for xen-devel@lists.xenproject.org; Wed, 30 Jul 2025 14:55:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uh8De-009Bos-2K;
 Wed, 30 Jul 2025 14:55:50 +0000
Received: from [2a01:cb15:80df:da00:4c1a:a750:6210:2b8] (helo=l14)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uh8De-00H1F5-1M;
 Wed, 30 Jul 2025 14:55:50 +0000
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
	bh=gfo8j/73issxj80jelMaclMEkTeqah1YHUmTJHKFOWk=; b=4Wm/NVY253LvciMe8F/TvpobhV
	q6y8hqNX6BcahDPML1HjsXN6KVWPdt59s95WbsTlx/tS9xgEDLksQE88BJJGwpBwBUZMIo8nRYz9/
	4yhPw6p1N8+U6k5eOR58PumcQ2gYjEesro/Yj1MKaFVbs8uGknBOLjBnvbeLYb0DavdE=;
Date: Wed, 30 Jul 2025 16:55:48 +0200
From: Anthony PERARD <anthony@xenproject.org>
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>, Julien Grall <julien@xen.org>
Subject: Re: [PATCH v5 02/11] tools/manage: Expose domain capabilities
Message-ID: <aIoydKTLe4pbC3Xr@l14>
References: <20250725235858.666813-1-jason.andryuk@amd.com>
 <20250725235858.666813-3-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250725235858.666813-3-jason.andryuk@amd.com>

On Fri, Jul 25, 2025 at 07:58:49PM -0400, Jason Andryuk wrote:
> Add an additional "caps" argument to the libxenmanage functions to
> obtain a domains capabilities - control, hardware, and xenstore.
> 
> Update the xenstored callers at the same time.
> 
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> Reviewed-by: Juergen Gross <jgross@suse.com>

Acked-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 
Anthony PERARD

