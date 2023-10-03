Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B137B72A4
	for <lists+xen-devel@lfdr.de>; Tue,  3 Oct 2023 22:44:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.612357.952270 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnmF1-0000hS-Gq; Tue, 03 Oct 2023 20:43:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 612357.952270; Tue, 03 Oct 2023 20:43:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnmF1-0000eh-Dj; Tue, 03 Oct 2023 20:43:39 +0000
Received: by outflank-mailman (input) for mailman id 612357;
 Tue, 03 Oct 2023 20:43:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BPao=FR=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qnmEz-0000eY-Jo
 for xen-devel@lists.xenproject.org; Tue, 03 Oct 2023 20:43:37 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 863a43d7-622d-11ee-98d2-6d05b1d4d9a1;
 Tue, 03 Oct 2023 22:43:36 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id BD08CB81C0C;
 Tue,  3 Oct 2023 20:43:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37921C433C8;
 Tue,  3 Oct 2023 20:43:34 +0000 (UTC)
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
X-Inumbo-ID: 863a43d7-622d-11ee-98d2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696365815;
	bh=OOJ8HydREvvAOPW5YurzwyTzOt6pMdWz4Zxnt+LUhlY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=fRWmjs+7WFdMRYVa9NA4xmVTF3WLC7xHl1RCtLWAcP2udtcsFYfb7QhtQzwWHIQ7j
	 cstvMI+5+/OdSpt9K8bwaDdXZG9StQZGtZ1geGLV3v4XPtw4+zFmfioC/sK87GqRHl
	 Ap2PYx5rI4gx5XrFE78bhxVaaE4G5a2O58RxVTpKjoagqS1XpS4LuzPjksPpVfqi5p
	 kp59uGN+7z+L6YSkcYztY/hc9qJzxYQ7JgPoI+bwBMfERfRmMDiIeSZdvESIYBEsmP
	 ED23LuSk0ael3ESdLa3w3bxs/EGyijLmVwjR/ks51kOPgfVPzfXP6OsMcCYHED8TOR
	 pH2PvZdQc0wTQ==
Date: Tue, 3 Oct 2023 13:43:32 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Simone Ballarin <simone.ballarin@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Henry Wang <henry.wang@arm.com>
Subject: Re: [XEN PATCH] automation/eclair: add deviations for MISRA C:2012
 Rule 10.1
In-Reply-To: <83f4f9df2459f22690e6df98a43b3602c22bf27b.1696319475.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2310031343170.2348112@ubuntu-linux-20-04-desktop>
References: <83f4f9df2459f22690e6df98a43b3602c22bf27b.1696319475.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 3 Oct 2023, Federico Serafini wrote:
> Update the configuration of ECLAIR to deviate some violations of Rule
> 10.1 in accordance with docs/misra/rules.rst.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  automation/eclair_analysis/ECLAIR/deviations.ecl | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
> index d8170106b4..241aad6393 100644
> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> @@ -274,6 +274,18 @@ still non-negative."
>  -config=MC3R1.R10.1,etypes+={safe, "stmt(operator(logical)||node(conditional_operator||binary_conditional_operator))", "dst_type(ebool||boolean)"}
>  -doc_end
>  
> +-doc_begin="XEN only supports architectures where signed integers are representend using two's complement and all the XEN developers are aware of this."
> +-config=MC3R1.R10.1,etypes+={safe,
> +  "stmt(operator(and||or||xor||not||and_assign||or_assign||xor_assign))",
> +  "any()"}
> +-doc_end
> +
> +-doc_begin="See Section \"4.5 Integers\" of \"GCC_MANUAL\", where it says that \"Signed `>>' acts on negative numbers by sign extension. As an extension to the C language, GCC does not use the latitude given in C99 and C11 only to treat certain aspects of signed `<<' as undefined. However, -fsanitize=shift (and -fsanitize=undefined) will diagnose such cases. They are also diagnosed where constant expressions are required.\""
> +-config=MC3R1.R10.1,etypes+={safe,
> +  "stmt(operator(shl||shr||shl_assign||shr_assign))",
> +  "any()"}
> +-doc_end
> +
>  ### Set 3 ###
>  
>  #
> -- 
> 2.34.1
> 

