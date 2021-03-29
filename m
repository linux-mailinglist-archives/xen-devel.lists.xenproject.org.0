Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A7434DC8B
	for <lists+xen-devel@lfdr.de>; Tue, 30 Mar 2021 01:40:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.103294.197114 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lR1T2-0004ZH-7o; Mon, 29 Mar 2021 23:38:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 103294.197114; Mon, 29 Mar 2021 23:38:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lR1T2-0004Yv-4Y; Mon, 29 Mar 2021 23:38:44 +0000
Received: by outflank-mailman (input) for mailman id 103294;
 Mon, 29 Mar 2021 23:38:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MaHR=I3=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lR1Sz-0004Yq-PC
 for xen-devel@lists.xenproject.org; Mon, 29 Mar 2021 23:38:41 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7c7fc1f9-7cc0-4528-86db-531da5b3f4d6;
 Mon, 29 Mar 2021 23:38:40 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D07ED61996;
 Mon, 29 Mar 2021 23:38:39 +0000 (UTC)
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
X-Inumbo-ID: 7c7fc1f9-7cc0-4528-86db-531da5b3f4d6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617061120;
	bh=GUJL3LcaAUI/LVc1NF3tsYKfXtlSCAFsCnKpHMQuLF8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=mUVeeqoe2c6fWc5BqecyDhn8iIFBZ2CrVnzYG+mlozI3xOW5fKbRM33NpxEazFIB6
	 cOiTzenGMy6gt8VwF9HW+Ir43ipdGKA0M8SXB7wyF2AX9GFgU5cNTsuNncfox86wls
	 PEG3BG++7eeiHDoOiXrNOf/E6n1FxUlu4FhlC8GG0Sl90HSCp25syhkUTkKEe+2Icz
	 mtNaC8TOC5SDaQExIHlIAMwtFrh0vjBYMvNZOVEKN4CPOwvB0vyPVQAGYnKLQb5xLr
	 91DSsNjj5gieWVe0jXgHC1XLxMp6mKcVjfyz0l3U4pEOoxpNMvg257FFY2VVPbfK8F
	 SdEfqFeTkdhKg==
Date: Mon, 29 Mar 2021 16:38:39 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: George Dunlap <george.dunlap@citrix.com>
cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH v2 for-4.15 6/7] CHANGELOG.md: Add entries for CI loop
In-Reply-To: <20210329161457.345360-6-george.dunlap@citrix.com>
Message-ID: <alpine.DEB.2.21.2103291638300.31460@sstabellini-ThinkPad-T480s>
References: <20210329161457.345360-1-george.dunlap@citrix.com> <20210329161457.345360-6-george.dunlap@citrix.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 29 Mar 2021, George Dunlap wrote:
> Signed-off-by: George Dunlap <george.dunlap@citrix.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>

> ---
> v2:
>  - Add dom0 / domU testing for ARM on alpine Linux as well
> 
> CC: Wei Liu <wl@xen.org>
> CC: Andrew Cooper <andrew.cooper3@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Doug Goldstein <cardoe@cardoe.com>
> ---
>  CHANGELOG.md | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index 62174c8c74..c4696e41a1 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -16,6 +16,9 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>   - Library improvements from NetBSD ports upstreamed
>   - x86_emulate: Support AVX-VNNI instructions
>   - x86_emulate: Expanded testing for several instruction classes
> + - CI loop: Add Alpine Linux, Ubuntu Focal targets; drop CentOS 6
> + - CI loop: Add qemu-based dom0 / domU test for ARM
> + - CI loop: Add dom0less aarch64 smoke test
>  
>  ## Removed / support downgraded
>  
> -- 
> 2.30.2
> 

