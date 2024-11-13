Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 059009C6C5D
	for <lists+xen-devel@lfdr.de>; Wed, 13 Nov 2024 11:06:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.835250.1251101 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBAGW-0002G3-NR; Wed, 13 Nov 2024 10:06:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 835250.1251101; Wed, 13 Nov 2024 10:06:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBAGW-0002EV-K9; Wed, 13 Nov 2024 10:06:24 +0000
Received: by outflank-mailman (input) for mailman id 835250;
 Wed, 13 Nov 2024 10:06:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J1S2=SI=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1tBAGV-0002EK-DE
 for xen-devel@lists.xenproject.org; Wed, 13 Nov 2024 10:06:23 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ede9b2e1-a1a6-11ef-99a3-01e77a169b0f;
 Wed, 13 Nov 2024 11:06:20 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 179A04EE073E;
 Wed, 13 Nov 2024 11:06:19 +0100 (CET)
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
X-Inumbo-ID: ede9b2e1-a1a6-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjE2Mi41NS4xMzEuNDciLCJoZWxvIjoic3VwcG9ydC5idWdzZW5nLmNvbSJ9
X-Custom-Transaction: eyJpZCI6ImVkZTliMmUxLWExYTYtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNDkyMzgwLjIxNTEzNywic2VuZGVyIjoic2ltb25lLmJhbGxhcmluQGJ1Z3NlbmcuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1731492379; bh=4w3bymbj2uzWTW8o86tZ2iAyUxs6jDF0t7Vn7aPn+z8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=IwUzvQf2C7LDkd/5JPcRDchhyTngj9NS6ZFM3RsBl51yibqemBQ3vIM4ChUWr+1Oi
	 sOhyw2YvhawLKLgOXVBUmvB0590PiOr4P6D+VfvZpU3FJyiNAtO4lDjOlAFTqIqR5I
	 NclDmf2W4B28UUpe7i115UnUnz+Doai/6aNJvRp2cr2M27CdH1Nz70o58dXyVvGKa+
	 GeSNHCYL1XyVSOsVibAYW0sebGBk+AwVabsCMmECPuO1JNuAHxddEoc7u1vL5YsZP6
	 wJf/cMPdOajChc3hC5O+ccY6YDmpLoz+IGCEWhkpjf81wrNSv3wgOXvQwF5pKCDoED
	 RMU7/v+ta898Q==
MIME-Version: 1.0
Date: Wed, 13 Nov 2024 11:06:19 +0100
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, Doug Goldstein
 <cardoe@cardoe.com>, Stefano Stabellini <sstabellini@kernel.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>
Subject: Re: [PATCH] xen: add deviations for MISRA C 2012 Rule R5.4
In-Reply-To: <255ae80cc8b95f33daa7534c9552c571391cf689.1731490650.git.alessandro.zucchelli@bugseng.com>
References: <255ae80cc8b95f33daa7534c9552c571391cf689.1731490650.git.alessandro.zucchelli@bugseng.com>
Message-ID: <7d71921015db07f690f3e6fd76c4d2c8@bugseng.com>
X-Sender: simone.ballarin@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2024-11-13 10:38, Alessandro Zucchelli wrote:
> This addresses violations of MISRA C:2012 Rule 5.4 which states as
> following: Macro identifiers shall be distinct.
> 
> This deviation aims to address violations of Rule 5.4 regarding
> identifiers XLAT_hvm_altp2m_set_mem_access_multi_HNDL_pfn_list and
> XLAT_hvm_altp2m_set_mem_access_multi_HNDL_access_list, and identifiers
> declared in header file include/asm/guest/hyperv-tlfs.h.
> 
> No functional change.
> 
> Signed-off-by: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
> ---
>  automation/eclair_analysis/ECLAIR/deviations.ecl | 9 +++++++++
>  docs/misra/deviations.rst                        | 8 ++++++++
>  2 files changed, 17 insertions(+)
> 
> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl 
> b/automation/eclair_analysis/ECLAIR/deviations.ecl
> index 2f58f29203..9e780e4465 100644
> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> @@ -98,6 +98,15 @@ it defines would (in the common case) be already 
> defined. Peer reviewed by the c
>  -config=MC3R1.R5.3,reports+={safe, 
> "any_area(any_loc(any_exp(macro(^read_debugreg$))&&any_exp(macro(^write_debugreg$))))"}
>  -doc_end
> 
> +-doc_begin="Identifiers declared in the following header file should 
> not be changed, therefore they are excluded from compliance with this 
> rule."
> +-config=MC3R1.R5.4,reports+={safe, 
> "any_area(any_loc(file(^xen/arch/x86/include/asm/guest/hyperv-tlfs\\.h$)))"}
> +-doc_end
> +
> +-doc_begin="The following macro identifiers should not be changed, 
> therefore they are excluded from compliance with this rule."
> +-config=MC3R1.R5.4,ignored_macros+=^XLAT_hvm_altp2m_set_mem_access_multi_HNDL_pfn_list$
> +-config=MC3R1.R5.4,ignored_macros+=^XLAT_hvm_altp2m_set_mem_access_multi_HNDL_access_list$
> +-doc_end
> +
>  -doc_begin="Macros expanding to their own identifier (e.g., \"#define 
> x x\") are deliberate."
>  -config=MC3R1.R5.5,reports+={deliberate, 
> "all_area(macro(same_id_body())||!macro(!same_id_body()))"}
>  -doc_end
> diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
> index 15a993d050..2ce1c8e58a 100644
> --- a/docs/misra/deviations.rst
> +++ b/docs/misra/deviations.rst
> @@ -109,6 +109,14 @@ Deviations related to MISRA C:2012 Rules:
>           - __emulate_2op and __emulate_2op_nobyte
>           - read_debugreg and write_debugreg
> 
> +   * - R5.4
> +     - Macros XLAT_hvm_altp2m_set_mem_access_multi_HNDL_pfn_list and
> +       XLAT_hvm_altp2m_set_mem_access_multi_HNDL_access_list should 
> not be
> +       changed, and are therefore ignored by the ECLAIR.
> +       Identifiers in header file 
> xen/arch/x86/include/asm/guest/hyperv-tlfs.halder
                                                                          
        ^ typo here
I think it is preferable to cite the actual source of those constants, 
but on the other hand, there is a link at the top of the cited header.

> +       shall not be changed.
> +     - Tagged as `safe` for ECLAIR.
> +
>     * - R5.5
>       - Macros expanding to their own name are allowed.
>       - Tagged as `deliberate` for ECLAIR.

