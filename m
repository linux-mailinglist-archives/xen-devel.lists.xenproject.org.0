Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF7CC801A32
	for <lists+xen-devel@lfdr.de>; Sat,  2 Dec 2023 04:15:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645927.1008504 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r9GT4-00072L-Vn; Sat, 02 Dec 2023 03:14:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645927.1008504; Sat, 02 Dec 2023 03:14:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r9GT4-0006zg-T7; Sat, 02 Dec 2023 03:14:58 +0000
Received: by outflank-mailman (input) for mailman id 645927;
 Sat, 02 Dec 2023 03:14:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fhqb=HN=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r9GT2-0006za-Jn
 for xen-devel@lists.xenproject.org; Sat, 02 Dec 2023 03:14:56 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f6d8e4a2-90c0-11ee-9b0f-b553b5be7939;
 Sat, 02 Dec 2023 04:14:54 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 2FFA7B83FFF;
 Sat,  2 Dec 2023 03:14:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F631C433C8;
 Sat,  2 Dec 2023 03:14:51 +0000 (UTC)
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
X-Inumbo-ID: f6d8e4a2-90c0-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701486892;
	bh=xepMw6EZKlLkyWV7q6zv+S7ghRvI6VF0mTk+RuUdFr4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=QPJckP19zt/O6NwKSNVlGtdq9PceR1gMlHJZ08u9z8jaZELCLMJATKJLbH4Zwy5Q0
	 iZAibwV8PYqHeZi25OYg62mJwee8GdMnkGUImhV70IEtfuTDxIethh9YJqltwVtJo3
	 p+G4/FRE1zdy7XLh1S/+EpBSIsyvmdeE74oYYOsSLVL+CkskOjfexPzosgRzPffsHD
	 TqguLuQDO/5NEkcId6lv3GhUCh3oqt+AyWat5gIqeukr6dMqXVZNndWVV9HsKN6Nbd
	 hl+jxIVDlsPwigLTJ1/JXwDR2MnMEd38fAmwJqaqsCPKQ0i0gavwe65gG4oxpVwUet
	 Wo3T/3OZMjd4w==
Date: Fri, 1 Dec 2023 19:14:49 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Simone Ballarin <simone.ballarin@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH] automation/eclair: tag files as "adopted" and "out
 of scope"
In-Reply-To: <548e2f7e5794ec35997d615282f0f4dc6f6250a8.1700835046.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2312011914330.110490@ubuntu-linux-20-04-desktop>
References: <548e2f7e5794ec35997d615282f0f4dc6f6250a8.1700835046.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 24 Nov 2023, Federico Serafini wrote:
> Tag arm64/efibind.h as "adopted":
> it is used to build the efi stub, which is a separate entry point
> for Xen when booted from EFI firmware.
> 
> Tag common/coverage/* as "out-of-scope":
> it is code to support gcov, hence it is part of the testing machinery.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

I think they should be in the exclude-list ?


> ---
>  automation/eclair_analysis/ECLAIR/out_of_scope.ecl | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/automation/eclair_analysis/ECLAIR/out_of_scope.ecl b/automation/eclair_analysis/ECLAIR/out_of_scope.ecl
> index e1ec4a607c..3bd385ecf9 100644
> --- a/automation/eclair_analysis/ECLAIR/out_of_scope.ecl
> +++ b/automation/eclair_analysis/ECLAIR/out_of_scope.ecl
> @@ -84,6 +84,7 @@
>  -doc_begin="Files imported from the gnu-efi package"
>  -file_tag+={adopted,"^xen/include/efi/.*$"}
>  -file_tag+={adopted,"^xen/arch/x86/include/asm/x86_64/efibind\\.h$"}
> +-file_tag+={adopted,"^xen/arch/arm/include/asm/arm64/efibind\\.h$"}
>  -doc_end
>  
>  -doc_begin="Build tools are out of scope."
> @@ -104,6 +105,10 @@
>  -file_tag+={out_of_scope,"^xen/include/xen/xxhash\\.h$"}
>  -doc_end
>  
> +-doc_begin="Out of scope code to support gcov."
> +-file_tag+={out_of_scope, "^xen/common/coverage/.*$"}
> +-doc_end
> +
>  -doc_begin="Headers under xen/include/public/ are the description of the public
>  hypercall ABI so the community is extremely conservative in making changes
>  there, because the interface is maintained for backward compatibility: ignore
> -- 
> 2.34.1
> 

