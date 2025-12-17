Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A90B4CC5BDB
	for <lists+xen-devel@lfdr.de>; Wed, 17 Dec 2025 03:00:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1188522.1509671 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVgpE-0000SN-Gy; Wed, 17 Dec 2025 01:59:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1188522.1509671; Wed, 17 Dec 2025 01:59:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVgpE-0000PO-CB; Wed, 17 Dec 2025 01:59:36 +0000
Received: by outflank-mailman (input) for mailman id 1188522;
 Wed, 17 Dec 2025 01:59:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7o+2=6X=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1vVgpD-0000PI-0p
 for xen-devel@lists.xenproject.org; Wed, 17 Dec 2025 01:59:35 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org
 [2600:3c04:e001:324:0:1991:8:25])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0750e7a5-daec-11f0-b15b-2bf370ae4941;
 Wed, 17 Dec 2025 02:59:32 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 1844760097;
 Wed, 17 Dec 2025 01:59:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70F85C16AAE;
 Wed, 17 Dec 2025 01:59:29 +0000 (UTC)
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
X-Inumbo-ID: 0750e7a5-daec-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765936770;
	bh=bDXuXBDMOQ99pDM1pvwTAGWZnUyvW4D/wclX+XUxNrg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=VV0RNYPbXpRscm8O3aOn1dyq/Dt1V+WcLynNW/p08MXUH1LCnkDWQSvUSt5XS3Wv+
	 dSMvOlmEcJBBOAvQIh1eunBFfRUFasiJc121l6MbVuZFBDSfhiJSHs8k8Lqrj6lJkb
	 tS7JVZlXPtt8VqQw7wLqqxq+UMdB0O1nTe/ZP0yBlt3ypYyt8Te9Yq98zpRB/1O6Cv
	 CtOELZFzbQqFK7b1rkVqs5IZPl/+5lunCPZNR6WZHVATiUsRaOM4RqOhLlqAA+tLKA
	 IaaPujSbnoclEvXxCVR5xm/Td3nAtracag2ugsJ2pgqambyvEZJIUVF9ag9QXa1RgE
	 6i7Rv6ofcQi6g==
Date: Tue, 16 Dec 2025 17:59:24 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    consulting@bugseng.com, Doug Goldstein <cardoe@cardoe.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [XEN PATCH] misra: extend toolchain assumption about source
 character set
In-Reply-To: <5351e65c12a4fcc0a27b5e18102030ccf20bd28a.1765844467.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2512161759180.1716453@ubuntu-linux-20-04-desktop>
References: <5351e65c12a4fcc0a27b5e18102030ccf20bd28a.1765844467.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 16 Dec 2025, Nicola Vetrini wrote:
> Similar to the ARM64 compiler, the same assumptions can be made about
> the X86_64 toolchain.
> 
> No functional change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  automation/eclair_analysis/ECLAIR/toolchain.ecl | 1 +
>  docs/misra/C-language-toolchain.rst             | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/automation/eclair_analysis/ECLAIR/toolchain.ecl b/automation/eclair_analysis/ECLAIR/toolchain.ecl
> index 842f8377e561..4bc88aa02942 100644
> --- a/automation/eclair_analysis/ECLAIR/toolchain.ecl
> +++ b/automation/eclair_analysis/ECLAIR/toolchain.ecl
> @@ -210,6 +210,7 @@ ext_sizeof_alignof_void_type"
>  
>  -doc_begin="See Section \"1.1 Character sets\" of "CPP_MANUAL".  We assume the locale is not restricting any UTF-8 characters being part of the source character set."
>  -config=STD.charset,behavior={c99, GCC_ARM64, "utf8"}
> +-config=STD.charset,behavior={c99, GCC_X86_64, "utf8"}
>  -doc_end
>  
>  -doc_begin="See Section \"4.3 Identifiers\" of "GCC_MANUAL"."
> diff --git a/docs/misra/C-language-toolchain.rst b/docs/misra/C-language-toolchain.rst
> index cb81f5c09872..ec0c9953be1c 100644
> --- a/docs/misra/C-language-toolchain.rst
> +++ b/docs/misra/C-language-toolchain.rst
> @@ -400,7 +400,7 @@ The table columns are as follows:
>       - See Section "4.15 Architecture" of GCC_MANUAL and Section "3.1.2 Data Representation" of X86_64_ABI_MANUAL.
>  
>     * - Character not in the basic source character set is encountered in a source file, except in an identifier, a character constant, a string literal, a header name, a comment, or a preprocessing token that is never converted to a token
> -     - ARM64
> +     - ARM64, X86_64
>       - UTF-8
>       - See Section "1.1 Character sets" of CPP_MANUAL.
>         We assume the locale is not restricting any UTF-8 characters being part of the source character set.
> -- 
> 2.43.0
> 

