Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6978C8B339D
	for <lists+xen-devel@lfdr.de>; Fri, 26 Apr 2024 11:10:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.712530.1113361 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0Hai-00073h-9M; Fri, 26 Apr 2024 09:10:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 712530.1113361; Fri, 26 Apr 2024 09:10:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0Hai-00070n-6Y; Fri, 26 Apr 2024 09:10:00 +0000
Received: by outflank-mailman (input) for mailman id 712530;
 Fri, 26 Apr 2024 08:29:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1s0GxJ-00036G-IH
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2024 08:29:17 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>)
 id 1s0GxJ-0001or-AD; Fri, 26 Apr 2024 08:29:17 +0000
Received: from cpc92320-cmbg19-2-0-cust35.5-4.cable.virginm.net ([82.13.64.36]
 helo=l14) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <anthony@xenproject.org>)
 id 1s0GxJ-0003rl-0u; Fri, 26 Apr 2024 08:29:17 +0000
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
	bh=xZirAFfeQS/iVjRBhbYItZSsKaICxcnYgZnUOXqu4aA=; b=v02EO8k+lMrrA/NX1INLRSF4id
	V8UTdYhuXXa1/s8jJWFOw138Vq7mrOhontZJfme7ee7+mwmTHIAplgiDPNCRiBLDvDdyks/kbsO0s
	jdrNm5cSHfPjv59kSj4P/Pule+IqQkXj46YuFeNI+d2+g7UAvBcQbDJLReXEtpirS3lA=;
Date: Fri, 26 Apr 2024 09:29:14 +0100
From: Anthony PERARD <anthony@xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH] xen-livepatch: fix --force option comparison
Message-ID: <Zitl2q8jPXdQuZlr@l14>
References: <20240426072144.48828-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240426072144.48828-1-roger.pau@citrix.com>

On Fri, Apr 26, 2024 at 09:21:44AM +0200, Roger Pau Monne wrote:
> The check for --force option shouldn't be against 0.
> 
> Reported-by: Jan Beulich <jbeulich@suse.com>
> Fixes: 62a72092a517 ('livepatch: introduce --force option')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

