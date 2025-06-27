Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D5C9AEB168
	for <lists+xen-devel@lfdr.de>; Fri, 27 Jun 2025 10:33:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1027396.1402046 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uV4We-00083e-E3; Fri, 27 Jun 2025 08:33:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1027396.1402046; Fri, 27 Jun 2025 08:33:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uV4We-00080X-B9; Fri, 27 Jun 2025 08:33:36 +0000
Received: by outflank-mailman (input) for mailman id 1027396;
 Fri, 27 Jun 2025 08:33:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1uV4Wc-00080R-LP
 for xen-devel@lists.xenproject.org; Fri, 27 Jun 2025 08:33:34 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uV4Wb-005DVi-1b;
 Fri, 27 Jun 2025 08:33:33 +0000
Received: from amontsouris-682-1-55-1.w90-87.abo.wanadoo.fr ([90.87.218.1]
 helo=l14) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uV4Wb-00BV3E-0j;
 Fri, 27 Jun 2025 08:33:33 +0000
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
	bh=uvB4j7qz4b7wodmHc7TWsWGSTc87d31RWz/TX52sAxk=; b=Xzt9dVcClovgvvH00CC4YTur20
	oadjOd74o+V9UK1dB+P/Vkkeoa5SqkBP9E8eJU3lutL+tWJuwYUilsISwfZvRYSHGN5YA4FRJS32Q
	WQ0Xnfaqu131UMiZlKtsfp+FoeJgb84X2mb8pUZAdU2TVUJ95rj36exAVXcUEUyxuDLY=;
Date: Fri, 27 Jun 2025 10:33:31 +0200
From: Anthony PERARD <anthony@xenproject.org>
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] tools/libxenguest: fix build in stubdom environment
Message-ID: <aF5XW0LhPnyK243x@l14>
References: <20250625103306.4599-1-jgross@suse.com>
 <ceb9d0cd-ab11-4e6e-85a5-0a24607ac8f2@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ceb9d0cd-ab11-4e6e-85a5-0a24607ac8f2@amd.com>

On Wed, Jun 25, 2025 at 09:20:05AM -0400, Jason Andryuk wrote:
> On 2025-06-25 06:33, Juergen Gross wrote:
> > With introduction of the new byteswap infrastructure the build of
> > libxenguest for stubdoms was broken. Fix that again.
> > 
> > Fixes: 60dcff871e34 ("xen/decompressors: Remove use of *_to_cpup() helpers")
> > Signed-off-by: Juergen Gross <jgross@suse.com>
> 
> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Acked-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 
Anthony PERARD

