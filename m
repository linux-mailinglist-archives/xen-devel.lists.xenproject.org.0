Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A615778BAC6
	for <lists+xen-devel@lfdr.de>; Tue, 29 Aug 2023 00:00:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.591795.924304 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qakHt-00059h-QH; Mon, 28 Aug 2023 22:00:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 591795.924304; Mon, 28 Aug 2023 22:00:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qakHt-00057x-NW; Mon, 28 Aug 2023 22:00:45 +0000
Received: by outflank-mailman (input) for mailman id 591795;
 Mon, 28 Aug 2023 22:00:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yBR3=EN=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qakHs-00057r-F5
 for xen-devel@lists.xenproject.org; Mon, 28 Aug 2023 22:00:44 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 54596b6b-45ee-11ee-9b0c-b553b5be7939;
 Tue, 29 Aug 2023 00:00:42 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2650762FBE;
 Mon, 28 Aug 2023 22:00:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF2B7C433C7;
 Mon, 28 Aug 2023 22:00:39 +0000 (UTC)
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
X-Inumbo-ID: 54596b6b-45ee-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693260040;
	bh=FxfEbqDdzuN/hcY43/ZS8FTY0fyMuGPJg5rhQwpcgE4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Mwd8rYvLM+kyZxukxtk7fg3/mNgIJplEMHD8YrZnTQicL9D9aWRTFoDWtnBvHMU1t
	 FFuXWAE/UNBRC3ExP7wdAE4/rgRy+Wo/QRFWw2PCw3kugdK63lqg/kGphMAiJE8ujK
	 i8rAll8fcg36LW0fCRj8j3qNV+57V37w+82g23MwpBCmJDD3ESuCbJ/hGItRflPa+M
	 6Qr3++tp65DGAihw5dkkm/JQ3z3nEOfT6WWKmApdfKBGoj5F8eq4veil8PsKU8P/6Q
	 YNe7fhdHN3knKfg28XNjNYgggHg0vxg9BfRiTkrhnDqEC82j1VzDPv27fbcLL14gJn
	 +8WmsWp6X414Q==
Date: Mon, 28 Aug 2023 15:00:37 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Simone Ballarin <simone.ballarin@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    sstabellini@kernel.org, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [XEN PATCH 02/13] automation/eclair: add text-based deviation
 for empty headers
In-Reply-To: <96e9ca524ed8191bfd5ee1230e8d581c50e299f5.1693228255.git.simone.ballarin@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2308281500020.6458@ubuntu-linux-20-04-desktop>
References: <cover.1693228255.git.simone.ballarin@bugseng.com> <96e9ca524ed8191bfd5ee1230e8d581c50e299f5.1693228255.git.simone.ballarin@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 28 Aug 2023, Simone Ballarin wrote:
> This patch adds a text-based deviation for Directive 4.10:
> "Precautions shall be taken in order to prevent the contents of
> a header file being included more than once"
> 
> Headers starting with the following comment are not supposed to
> comply with the directive:
> "/* empty */"
> 
> These headers should be empty, therefore they pose no risk if included
> more than once.
> 
> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>

However I think we should also update rules.rst and/or update
docs/misra/safe.json


> ---
>  automation/eclair_analysis/ECLAIR/deviations.ecl | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
> index 5f068377fa..2681a4cff5 100644
> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> @@ -80,6 +80,7 @@ inline functions."
>  
>  -doc_begin="This header file is autogenerated or empty, therefore it poses no
>  risk if included more than once."
> +-config=MC3R1.D4.10,reports+={safe, "first_area(text(^/\\* empty \\*/$, begin-1))"}
>  -file_tag+={empty_header, "^xen/arch/arm/efi/runtime\\.h$"}
>  -file_tag+={autogen_headers, "^xen/include/xen/compile\\.h$||^xen/include/generated/autoconf.h$||^xen/include/xen/hypercall-defs.h$"}
>  -config=MC3R1.D4.10,reports+={safe, "all_area(all_loc(file(empty_header||autogen_headers)))"}
> -- 
> 2.34.1
> 

