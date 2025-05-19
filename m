Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B7ABABB868
	for <lists+xen-devel@lfdr.de>; Mon, 19 May 2025 11:13:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.989672.1373663 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uGwY9-0004MD-RL; Mon, 19 May 2025 09:12:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 989672.1373663; Mon, 19 May 2025 09:12:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uGwY9-0004Kp-O1; Mon, 19 May 2025 09:12:45 +0000
Received: by outflank-mailman (input) for mailman id 989672;
 Mon, 19 May 2025 09:12:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1uGwY8-0004Kj-MR
 for xen-devel@lists.xenproject.org; Mon, 19 May 2025 09:12:44 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uGwY8-001ImW-13;
 Mon, 19 May 2025 09:12:44 +0000
Received: from lfbn-gre-1-199-136.w90-112.abo.wanadoo.fr ([90.112.161.136]
 helo=l14) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uGwY7-00BHSP-1y;
 Mon, 19 May 2025 09:12:43 +0000
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
	bh=0RpSwdwlttZAZtwRSP93EAUeOBCCE7rT6WBzeAwkMFw=; b=SkjbSJlv+ZdJbP0Y1YIFbzgs+U
	1cdkcNNw6hIYRjm81QWbuzSJK1Hc9hOy+7BH8S6KRVGrDoRewNLsX0R1liEjRc1e2+1XwzU1d9Rcx
	V56XuIlcaL6INug1LlgK+KD803ZD08sCs+GEc2O68RkbfC1H1zLA/gf14dUNLGSWPcw8=;
Date: Mon, 19 May 2025 11:12:41 +0200
From: Anthony PERARD <anthony@xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v3 1/4] docs: remove qemu-traditional support from
 documentation
Message-ID: <aCr2CVK8rs7i9xzy@l14>
References: <20250429110636.30518-1-jgross@suse.com>
 <20250429110636.30518-2-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250429110636.30518-2-jgross@suse.com>

On Tue, Apr 29, 2025 at 01:06:31PM +0200, Juergen Gross wrote:
> In preparation to no longer support qemu-traditional (including
> qemu-stubdom), remove it from documentation.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 
Anthony PERARD

