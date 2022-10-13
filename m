Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDFE15FE5FE
	for <lists+xen-devel@lfdr.de>; Fri, 14 Oct 2022 01:56:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.422416.668419 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oj83g-0001rw-AF; Thu, 13 Oct 2022 23:56:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 422416.668419; Thu, 13 Oct 2022 23:56:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oj83g-0001pT-7I; Thu, 13 Oct 2022 23:56:12 +0000
Received: by outflank-mailman (input) for mailman id 422416;
 Thu, 13 Oct 2022 23:56:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r8Z/=2O=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1oj83e-0001pH-NA
 for xen-devel@lists.xenproject.org; Thu, 13 Oct 2022 23:56:10 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 97f0c871-4b52-11ed-8fd0-01056ac49cbb;
 Fri, 14 Oct 2022 01:56:03 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2FF9DB81FBC;
 Thu, 13 Oct 2022 23:56:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77412C433D6;
 Thu, 13 Oct 2022 23:55:59 +0000 (UTC)
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
X-Inumbo-ID: 97f0c871-4b52-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665705361;
	bh=LOLUKF02ecnKr3pk5r6GXQSRCfUivqRkBUE1M1qa5+s=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=aALrG8tZs39ujQH8X4IDKj6FLTP8LM8PF4bn/HJscofeZPMvbNjBHwdqEw2y/FOfX
	 7i/x3DXdYIad7v+CoZNPTulws5sgsq0qmK73NYPNcwfnxSl/M7JVW+JAiXiPF8iEMz
	 eje3GltkOOUiV66YWum5+WGafUUHD28M6zgzJ9VW5dYFqEvtQKOTmgl1SptIGQ87RU
	 Ch2tusoKoNFmuQOZRZgCfZyUEBITFi+wyvxmIRJ+LWlh4HrR54KxECPvcSCGJVz0AC
	 kqpqkybWs86kLOAH9hKtDSu85eW+lXzyu00BIgMfFJpoM3F/YXgd/X0+V4yGe9SHoo
	 Ncbd6dcJ3zvQQ==
Date: Thu, 13 Oct 2022 16:55:58 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Henry Wang <Henry.Wang@arm.com>
cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Wei Liu <wl@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
    Wei Chen <wei.chen@arm.com>
Subject: Re: [PATCH for-4.17 2/2] SUPPORT.md: Mark static heap feature as
 supported
In-Reply-To: <20221013025722.48802-3-Henry.Wang@arm.com>
Message-ID: <alpine.DEB.2.22.394.2210131655530.3690179@ubuntu-linux-20-04-desktop>
References: <20221013025722.48802-1-Henry.Wang@arm.com> <20221013025722.48802-3-Henry.Wang@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 13 Oct 2022, Henry Wang wrote:
> With the P2M pages pool bounding the domain memory runtime allocation
> and the documented minimal size requirement of the static heap, it is
> safe to mark static heap feature as supported.

Usually we wait at least one release cycle before marking a feature as
supported. However, I can see that this case is a bit different because
effectively static heap memory is a safety/security feature.

Julien, Bertrand, I'll let you know decide on this one




> Signed-off-by: Henry Wang <Henry.Wang@arm.com>
> ---
>  SUPPORT.md | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/SUPPORT.md b/SUPPORT.md
> index cf2ddfacaf..ddcf8a13a7 100644
> --- a/SUPPORT.md
> +++ b/SUPPORT.md
> @@ -298,7 +298,7 @@ pre-defined by configuration using physical address ranges.
>  Allow reserving parts of RAM through the device tree using physical
>  address ranges as heap.
>  
> -    Status, ARM: Tech Preview
> +    Status, ARM: Supported
>  
>  ### Memory Sharing
>  
> -- 
> 2.17.1
> 

