Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E75DEB48DEF
	for <lists+xen-devel@lfdr.de>; Mon,  8 Sep 2025 14:46:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1115216.1461924 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvbGO-0007A7-Dd; Mon, 08 Sep 2025 12:46:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1115216.1461924; Mon, 08 Sep 2025 12:46:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvbGO-00078i-At; Mon, 08 Sep 2025 12:46:28 +0000
Received: by outflank-mailman (input) for mailman id 1115216;
 Mon, 08 Sep 2025 12:46:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1uvbGN-00078V-Pj
 for xen-devel@lists.xenproject.org; Mon, 08 Sep 2025 12:46:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uvbGM-0004Vk-27;
 Mon, 08 Sep 2025 12:46:26 +0000
Received: from [2a01:cb15:80df:da00:e2a9:ff82:7bde:38cd] (helo=l14)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uvbGM-000BSV-26;
 Mon, 08 Sep 2025 12:46:26 +0000
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
	bh=g8Wde7otiGDvQnOxBP+3ihDVLWXYjQowItN+OPEMf+M=; b=7FcG5par7DyTtjWgGOk3qRIKxR
	T9iJ3cTO3V0/A5ioBZwVsEvihvJoe1v+upQTT9Em+9bF0WYacYyqV6BsReTL4Uva/ElaqWVuA/GyX
	xF/U3cbDKktwUWvSoHFCr73hjnC4xnk7QGJ86KoAoFvGm9IrI0OqlaZU5bdWdyM9/ODQ=;
Date: Mon, 8 Sep 2025 14:46:24 +0200
From: Anthony PERARD <anthony@xenproject.org>
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: [PATCH] libxl: except Dom0 from setting PoD target
Message-ID: <aL7QIGgYFDCAPeFE@l14>
References: <c98069b7-ee38-4f06-bebd-25396f2a210a@suse.com>
 <c170f613-c42a-47f7-aae2-3e5bf1238a1c@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c170f613-c42a-47f7-aae2-3e5bf1238a1c@amd.com>

On Wed, Aug 27, 2025 at 09:08:10PM -0400, Jason Andryuk wrote:
> On 2025-08-27 01:53, Jan Beulich wrote:
> > Dom0 is never started in PoD mode, and hence it can at "best" do harm if
> > we try to set a PoD target for it.
> > 
> > Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Acked-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 
Anthony PERARD

