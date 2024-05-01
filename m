Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C8D28B90A8
	for <lists+xen-devel@lfdr.de>; Wed,  1 May 2024 22:35:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.715427.1117039 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2Gem-0005OF-2h; Wed, 01 May 2024 20:34:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 715427.1117039; Wed, 01 May 2024 20:34:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2Gem-0005Lq-04; Wed, 01 May 2024 20:34:24 +0000
Received: by outflank-mailman (input) for mailman id 715427;
 Wed, 01 May 2024 20:34:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Aa2W=ME=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1s2Gek-0005Lg-Ax
 for xen-devel@lists.xenproject.org; Wed, 01 May 2024 20:34:22 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2f315341-07fa-11ef-b4bb-af5377834399;
 Wed, 01 May 2024 22:34:20 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2328D619EE;
 Wed,  1 May 2024 20:34:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2916C072AA;
 Wed,  1 May 2024 20:34:15 +0000 (UTC)
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
X-Inumbo-ID: 2f315341-07fa-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714595657;
	bh=IKatUJRv6K3vHjk7WFy6qYHSbp/IxGkXxamIiozg9nU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=lBLj1Ch5JkfWCi5j57NPnShmnPP8Dfc4gUKVPnEaQSFCzyWudv0fHh9PN83+9OWwf
	 QbJVJSiI9mk53BDPVoYQv+/dKm9nawnn8I6XdrrVDujYfGqc4Ew/FPdgYZur3yW9JW
	 19fKAgsIhVGlQsrIk8EvatI5OJhVCl+auFkdhWhYVxiR/1XCTZ+AaRPDDPXpF2052L
	 OtqX3VipLWHQxgu9g2zWhOHuTu/hx+9WgkPVjfcN6iShLi/h1DGuQWtpXM7tXunJb8
	 h6SIhbINJCspjUax6KD6BKlhe0mw+S5bOrxanpLmUqBcHK8sfnhZvC0p6lbQLyXlqZ
	 UpsPIC8eUmmsQ==
Date: Wed, 1 May 2024 13:34:14 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Simone Ballarin <simone.ballarin@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH] automation/eclair_enalysis: amend configuration for
 some MISRA rules
In-Reply-To: <7e8f6f4e0e007656d8809c4d521e73e642747d7f.1714394212.git.alessandro.zucchelli@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2405011333530.497719@ubuntu-linux-20-04-desktop>
References: <7e8f6f4e0e007656d8809c4d521e73e642747d7f.1714394212.git.alessandro.zucchelli@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 29 Apr 2024, Alessandro Zucchelli wrote:
> Adjust ECLAIR configuration for rules: R21.14, R21.15, R21.16 by taking
> into account mem* macros defined in the Xen sources as if they were
> equivalent to the ones in Standard Library.
> 
> Signed-off-by: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  automation/eclair_analysis/ECLAIR/analysis.ecl | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/automation/eclair_analysis/ECLAIR/analysis.ecl b/automation/eclair_analysis/ECLAIR/analysis.ecl
> index a604582da3..f3b634baba 100644
> --- a/automation/eclair_analysis/ECLAIR/analysis.ecl
> +++ b/automation/eclair_analysis/ECLAIR/analysis.ecl
> @@ -19,6 +19,23 @@ map_strings("scheduled-analysis",analysis_kind)
>  
>  -enable=B.EXPLAIN
>  
> +-doc_begin="These configurations serve the purpose of recognizing the 'mem*' macros as
> +their Standard Library equivalents."
> +
> +-config=MC3R1.R21.14,call_select+=
> +{"macro(^memcmp$)&&any_arg(1..2, skip(__non_syntactic_paren_cast_stmts, node(string_literal)))",
> + "any()", violation, "%{__callslct_any_base_fmt()}", {{arg, "%{__callslct_arg_fmt()}"}}}
> +
> +-config=MC3R1.R21.15,call_args+=
> +{"macro(^mem(cmp|move|cpy)$)", {1, 2}, "unqual_pointee_compatible",
> + "%{__argscmpr_culprit_fmt()}", "%{__argscmpr_evidence_fmt()}"}
> +
> +-config=MC3R1.R21.16,call_select+=
> +{"macro(^memcmp$)&&any_arg(1..2, skip(__non_syntactic_paren_stmts, type(canonical(__memcmp_pte_types))))",
> + "any()", violation, "%{__callslct_any_base_fmt()}", {{arg,"%{__callslct_arg_type_fmt()}"}}}
> +
> +-doc_end
> +
>  -eval_file=toolchain.ecl
>  -eval_file=public_APIs.ecl
>  if(not(scheduled_analysis),
> -- 
> 2.25.1
> 

