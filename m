Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F6C0B172C8
	for <lists+xen-devel@lfdr.de>; Thu, 31 Jul 2025 16:05:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1065686.1431039 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhTu9-00076P-2V; Thu, 31 Jul 2025 14:05:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1065686.1431039; Thu, 31 Jul 2025 14:05:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhTu8-00073q-VN; Thu, 31 Jul 2025 14:05:08 +0000
Received: by outflank-mailman (input) for mailman id 1065686;
 Thu, 31 Jul 2025 14:05:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1uhTu7-00073i-JP
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 14:05:07 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uhTu5-00AsI7-2a;
 Thu, 31 Jul 2025 14:05:05 +0000
Received: from [2a01:cb15:80df:da00:94d0:641e:16e6:ca4b] (helo=l14)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uhTu5-000VbO-1Y;
 Thu, 31 Jul 2025 14:05:05 +0000
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
	bh=8APP0nRwSF2sVqt+dGygrw04u6NNHMybKe9vOI9l00o=; b=pRxMxAraGVi5/PPsCUGcvqO1Xz
	d93rnQC/pBdFJjpT68pR1xUKktNUAhp0j71iHKuBQYBjMZjTO4yktzAZQBO5IJ5mlzsB6901UPrma
	qlugY+dS7VT/ux9ooWWkCkW4azFnOMF1CbI6c6iwEYJoylem13I0c4hxd4iZ3gVGuEek=;
Date: Thu, 31 Jul 2025 16:05:03 +0200
From: Anthony PERARD <anthony@xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@vates.tech>,
	Nick Rosbrook <enr0n@ubuntu.com>,
	George Dunlap <gwd@xenproject.org>,
	Jason Andryuk <jason.andryuk@amd.com>
Subject: Re: [PATCH v3 2/2] tools: allow to limit xenstore features via guest
 config
Message-ID: <aIt4DzK_M3K8H3ak@l14>
References: <20250731084254.25591-1-jgross@suse.com>
 <20250731084254.25591-3-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250731084254.25591-3-jgross@suse.com>

On Thu, Jul 31, 2025 at 10:42:54AM +0200, Juergen Gross wrote:
> Add a guest config parameter "xenstore_feature_mask" allowing to limit
> the Xenstore features the guest can see and use. This can be needed in
> order to allow migrating a guest to a host running a Xenstore version
> providing less features than the source host.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
> Acked-by: Nick Rosbrook <enr0n@ubuntu.com> # tools/golang
> ---
> V2:
> - fix typo (Jason Andryuk)
> V3:
> - use LOGED for error logging (Anthony Perard)
> - don't leak vm_path in case of error (Anthony Perard)

Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 
Anthony PERARD

