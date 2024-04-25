Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A568B180A
	for <lists+xen-devel@lfdr.de>; Thu, 25 Apr 2024 02:29:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711728.1111928 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzmyo-0004ir-9x; Thu, 25 Apr 2024 00:28:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711728.1111928; Thu, 25 Apr 2024 00:28:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzmyo-0004hK-5l; Thu, 25 Apr 2024 00:28:50 +0000
Received: by outflank-mailman (input) for mailman id 711728;
 Thu, 25 Apr 2024 00:28:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N29f=L6=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rzmym-0004gX-NS
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2024 00:28:48 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c6bcd483-029a-11ef-b4bb-af5377834399;
 Thu, 25 Apr 2024 02:28:46 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E8E9561CFB;
 Thu, 25 Apr 2024 00:28:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7E7BC113CD;
 Thu, 25 Apr 2024 00:28:42 +0000 (UTC)
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
X-Inumbo-ID: c6bcd483-029a-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714004924;
	bh=9p3cULF0i9B8R8G1TiYdFSZHFYlw0K+oiDbLPonmtZE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=OQiqDDKtD2p2Lwb/wXpQs6PVRaByn34aFW7K8Ndo2ZlySte5f8ZbeeHc/Gre5piLz
	 QHWuY4MXSjEXxWDIoAUeFX/5NM/d1XPra9tu56ulTspMxUZz3PuPh66/MoAuA8ycXe
	 FcXhSrH2Nv9PS6BOYeuh20kRlfJgsW7IKXndoBIOQ4sWdabxx0Nb/C2nZzvl+wCm0z
	 puICd7cKHmEo0YkauQ4agGzkSDGFMGY5vgr5/YHqHoadSfeGsot4herfuknyUtjBIK
	 YeyV4lhGpU5pT8rPSqRgUfQOx+iRrwWNaXgA3DtoSCVBxYU5I4SAP3DsfHZXYZiSw7
	 EfJlWlHPg0ROg==
Date: Wed, 24 Apr 2024 17:28:40 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, bertrand.marquis@arm.com, julien@xen.org, 
    Simone Ballarin <simone.ballarin@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
Subject: Re: [XEN PATCH 03/10] automation/eclair_analysis: deviate macro
 count_args_ for MISRA Rule 20.7
In-Reply-To: <7de407c218f0911e28b7c3f609a55636165166a8.1713885065.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2404241727520.3940@ubuntu-linux-20-04-desktop>
References: <cover.1713885065.git.nicola.vetrini@bugseng.com> <7de407c218f0911e28b7c3f609a55636165166a8.1713885065.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 23 Apr 2024, Nicola Vetrini wrote:
> The count_args_ macro violates Rule 20.7, but it can't be made
> compliant with Rule 20.7 without breaking its functionality. Since
> it's very unlikely for this macro to be misused, it is deviated.

That is OK but can't we use the SAF- framework to do it, given that it
is just one macro?

If not, this is also OK.


> No functional change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
>  automation/eclair_analysis/ECLAIR/deviations.ecl | 6 ++++++
>  docs/misra/deviations.rst                        | 6 ++++++
>  2 files changed, 12 insertions(+)
> 
> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
> index d21f112a9b94..c17e2f5a0886 100644
> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> @@ -445,6 +445,12 @@ not to parenthesize their arguments."
>  -config=MC3R1.R20.7,reports+={safe, "any_area(any_loc(any_exp(macro(^alternative_(v)?call[0-9]$))))"}
>  -doc_end
>  
> +-doc_begin="The argument 'x' of the count_args_ macro can't be parenthesized as
> +the rule would require, without breaking the functionality of the macro. The uses
> +of this macro do not lead to developer confusion, and can thus be deviated."
> +-config=MC3R1.R20.7,reports+={safe, "any_area(any_loc(any_exp(macro(^count_args_$))))"}
> +-doc_end
> +
>  -doc_begin="Uses of variadic macros that have one of their arguments defined as
>  a macro and used within the body for both ordinary parameter expansion and as an
>  operand to the # or ## operators have a behavior that is well-understood and
> diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
> index ed0c1e8ed0bf..e228ae2e715f 100644
> --- a/docs/misra/deviations.rst
> +++ b/docs/misra/deviations.rst
> @@ -371,6 +371,12 @@ Deviations related to MISRA C:2012 Rules:
>         sanity checks in place.
>       - Tagged as `safe` for ECLAIR.
>  
> +   * - R20.7
> +     - The macro `count_args_` is not compliant with the rule, but is not likely
> +       to incur in the risk of being misused or lead to developer confusion, and
> +       refactoring it to add parentheses breaks its functionality.
> +     - Tagged as `safe` for ECLAIR.
> +
>     * - R20.12
>       - Variadic macros that use token pasting often employ the gcc extension
>         `ext_paste_comma`, as detailed in `C-language-toolchain.rst`, which is
> -- 
> 2.34.1
> 

