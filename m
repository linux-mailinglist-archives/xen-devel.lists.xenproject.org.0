Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A90ACCFEA19
	for <lists+xen-devel@lfdr.de>; Wed, 07 Jan 2026 16:41:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1196825.1514550 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdVer-0000W8-Cb; Wed, 07 Jan 2026 15:41:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1196825.1514550; Wed, 07 Jan 2026 15:41:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdVer-0000Ud-9p; Wed, 07 Jan 2026 15:41:13 +0000
Received: by outflank-mailman (input) for mailman id 1196825;
 Wed, 07 Jan 2026 15:41:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1vdVep-0000UX-O5
 for xen-devel@lists.xenproject.org; Wed, 07 Jan 2026 15:41:11 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1vdVep-00DSjb-00;
 Wed, 07 Jan 2026 15:41:11 +0000
Received: from [2a01:cb15:80df:da00:baa:5f20:ede5:a76a] (helo=l14)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1vdVep-00Cbm3-02;
 Wed, 07 Jan 2026 15:41:11 +0000
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
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date;
	bh=qKn+f/Ywoz78J1Yj6mzSk6SdcGfXSbSTQwwUxD2nwfc=; b=z8NVVJbrERW8RRAC2bzvMupjYD
	7esH4jKbpr8I+Ja8/q1IUAEvafNRZKr1x+MlbyXM9TIHYa2aCGd1cKJUUgee192mTtAmEadfxpiUd
	0UFwULjR+3M3UAu85y0LGNsEm9mITvqF02msORkG72XJo583ZHLNQpnrsvfawRoIUr9g=;
Date: Wed, 7 Jan 2026 16:41:09 +0100
From: Anthony PERARD <anthony@xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2] libs/xg: allow caller to provide extra memflags for
 populate physmap
Message-ID: <aV5-lbZM4Njl9KYr@l14>
References: <20251219082532.43673-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251219082532.43673-1-roger.pau@citrix.com>

On Fri, Dec 19, 2025 at 09:25:32AM +0100, Roger Pau Monne wrote:
> Introduce an additional memflags field to the xc_dom_image and
> xc_sr_context structures and use it to pass additional memflags to use when
> populating the domain physmap.
> 
> No meaningful usages of this new field are added as part of the patch.  The
> only know usage will be from the XAPI domain builder, which lives in a
> different repository.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Acked-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 
Anthony PERARD

