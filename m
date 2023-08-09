Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D464776A5A
	for <lists+xen-devel@lfdr.de>; Wed,  9 Aug 2023 22:38:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.581340.910004 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTpx9-0007rP-6E; Wed, 09 Aug 2023 20:38:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 581340.910004; Wed, 09 Aug 2023 20:38:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTpx9-0007pi-2x; Wed, 09 Aug 2023 20:38:47 +0000
Received: by outflank-mailman (input) for mailman id 581340;
 Wed, 09 Aug 2023 20:38:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JRC9=D2=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qTpx8-0007pW-7T
 for xen-devel@lists.xenproject.org; Wed, 09 Aug 2023 20:38:46 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bb7726e5-36f4-11ee-b281-6b7b168915f2;
 Wed, 09 Aug 2023 22:38:44 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B9EB364935;
 Wed,  9 Aug 2023 20:38:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6428BC433C7;
 Wed,  9 Aug 2023 20:38:42 +0000 (UTC)
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
X-Inumbo-ID: bb7726e5-36f4-11ee-b281-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691613523;
	bh=UTenjmu6K4fpcMAKpBRCNNjzOwB2Mfar1dpF5re/vTk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=fEMtWfpHVGYnExTwrOddUxtPoZ5tIN/baS6kRKU8txc+Wa0TZedkeNZOg9/D/SxXY
	 rIyPIKdhi44iaMhKr77zXifNkvlf9+QQ/+vn922FDdm/7QEz/18eq6hGz4Ge9/n3vw
	 EVgdm+OMFhgNtBXcOAkTO4UjNAv+Ctk9HM0/ZUHLKcschLSG/IEcDdIOM2wRzcLFdE
	 6iFhud1fL/GARNY0tPZVECF9hxPnZKOuC9HV1kNDqL/+oXImje1HLmdwX8oF2KOTAQ
	 4BDRqAD8qJXH0EFG2Tgk16DGahAH1AlhJt2FYUWG5HfPmdmzXCLVW96ve57qjHh1I6
	 mQxVyahvSUI8A==
Date: Wed, 9 Aug 2023 13:38:41 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Simone Ballarin <simone.ballarin@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH 1/3] automation/eclair: update clean guidelines
In-Reply-To: <89e4ad4c56c083391b24b9da55212e888c5f3beb.1691568344.git.simone.ballarin@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2308091338290.2127516@ubuntu-linux-20-04-desktop>
References: <cover.1691568344.git.simone.ballarin@bugseng.com> <89e4ad4c56c083391b24b9da55212e888c5f3beb.1691568344.git.simone.ballarin@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 9 Aug 2023, Simone Ballarin wrote:
> This patch splits the former list in two separate selectors
> clean_guidelines_common and additional_clean_guidelines.
> 
> clean_guidelines_common contains the guidelines that are clean
> in both the analyzed builds, instead additional_clean_guidelines
> is popolated depending on the current one.
> 
> The following clean guidelines have been added:
> - MC3R1.R1.1;
> - MC3R1.R1.3;
> - MC3R1.R3.1;
> - MC3R1.R4.1;
> - MC3R1.R17.4;
> - MC3R1.R22.6;
> - MC3R1.D4.3 (just x86_64);
> - MC3R1.R5.3 (just arm64);
> - MC3R1.R7.2 (just arm64);
> - MC3R1.R8.6 (just arm64);
> - MC3R1.R9.3 (just arm64).
> 
> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  automation/eclair_analysis/ECLAIR/tagging.ecl | 17 +++++++++++++++--
>  1 file changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/automation/eclair_analysis/ECLAIR/tagging.ecl b/automation/eclair_analysis/ECLAIR/tagging.ecl
> index ef2e56e186..3f589fd716 100644
> --- a/automation/eclair_analysis/ECLAIR/tagging.ecl
> +++ b/automation/eclair_analysis/ECLAIR/tagging.ecl
> @@ -28,7 +28,20 @@
>  ####################
>  
>  -doc_begin="Clean guidelines: new violations for these guidelines are not accepted."
> --service_selector={clean_guidelines,"^(MC3R1\\.D1\\.1|MC3R1\\.D2\\.1|MC3R1\\.D4\\.11|MC3R1\\.D4\\.14|MC3R1\\.R1\\.4|MC3R1\\.R2\\.2|MC3R1\\.R3\\.2|MC3R1\\.R5\\.1|MC3R1\\.R5\\.2|MC3R1\\.R5\\.4|MC3R1\\.R6\\.1|MC3R1\\.R6\\.2|MC3R1\\.R7\\.1|MC3R1\\.R8\\.1|MC3R1\\.R8\\.5|MC3R1\\.R8\\.8|MC3R1\\.R8\\.10|MC3R1\\.R8\\.12|MC3R1\\.R8\\.14|MC3R1\\.R9\\.2|MC3R1\\.R9\\.4|MC3R1\\.R9\\.5|MC3R1\\.R12\\.5|MC3R1\\.R17\\.3|MC3R1\\.R17\\.6|MC3R1\\.R21\\.13|MC3R1\\.R21\\.19|MC3R1\\.R21\\.21|MC3R1\\.R22\\.2|MC3R1\\.R22\\.4|MC3R1\\.R22\\.5)$"
> +
> +-service_selector={clean_guidelines_common,"^(MC3R1\\.D1\\.1|MC3R1\\.D2\\.1|MC3R1\\.D4\\.11|MC3R1\\.D4\\.14|MC3R1\\.R1\\.1|MC3R1\\.R1\\.3|MC3R1\\.R1\\.4|MC3R1\\.R2\\.2|MC3R1\\.R3\\.1|MC3R1\\.R3\\.2|MC3R1\\.R4\\.1|MC3R1\\.R5\\.1|MC3R1\\.R5\\.2|MC3R1\\.R5\\.4|MC3R1\\.R6\\.1|MC3R1\\.R6\\.2|MC3R1\\.R7\\.1|MC3R1\\.R8\\.1|MC3R1\\.R8\\.5|MC3R1\\.R8\\.8|MC3R1\\.R8\\.10|MC3R1\\.R8\\.12|MC3R1\\.R8\\.14|MC3R1\\.R9\\.2|MC3R1\\.R9\\.4|MC3R1\\.R9\\.5|MC3R1\\.R12\\.5|MC3R1\\.R17\\.3|MC3R1\\.R17\\.4|MC3R1\\.R17\\.6|MC3R1\\.R21\\.13|MC3R1\\.R21\\.19|MC3R1\\.R21\\.21|MC3R1\\.R22\\.2|MC3R1\\.R22\\.4|MC3R1\\.R22\\.5|MC3R1\\.R22\\.6)$"
>  }
> --reports+={clean:added,"service(clean_guidelines)"}
> +
> +-setq=target,getenv("XEN_TARGET_ARCH")
> +
> +if(string_equal(target,"x86_64"),
> +    service_selector({"additional_clean_guidelines","^(MC3R1\\.D4\\.3)$"})
> +)
> +
> +if(string_equal(target,"arm64"),
> +    service_selector({"additional_clean_guidelines","^(MC3R1\\.R5\\.3|MC3R1\\.R7\\.2|MC3R1\\.R8\\.6|MC3R1\\.R9\\.3)$"})
> +)
> +
> +-reports+={clean:added,"service(clean_guidelines_common||additional_clean_guidelines)"}
> +
>  -doc_end
> -- 
> 2.34.1
> 

