Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E9B664AD4D
	for <lists+xen-devel@lfdr.de>; Tue, 13 Dec 2022 02:42:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.460099.717913 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4uJJ-0002hF-Pv; Tue, 13 Dec 2022 01:42:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 460099.717913; Tue, 13 Dec 2022 01:42:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4uJJ-0002ew-Mo; Tue, 13 Dec 2022 01:42:21 +0000
Received: by outflank-mailman (input) for mailman id 460099;
 Tue, 13 Dec 2022 01:42:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TuKI=4L=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1p4uJH-0002eK-Hz
 for xen-devel@lists.xenproject.org; Tue, 13 Dec 2022 01:42:19 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 60d86486-7a87-11ed-91b6-6bf2151ebd3b;
 Tue, 13 Dec 2022 02:42:18 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 100F5B80E06;
 Tue, 13 Dec 2022 01:42:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9368AC433F1;
 Tue, 13 Dec 2022 01:42:15 +0000 (UTC)
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
X-Inumbo-ID: 60d86486-7a87-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670895736;
	bh=Rl5UGEsBGDwv2kiq4bcZnmfhw0oD2pNGmeZA/pu11aw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ONJ1ANz9t3Wrp0/06IuE4nb5J7wITG/sWDWOtj8z5e2ufKn0Y+csNIAx4T6aQlRsk
	 b3zqYKDU+du3co8cktHNVDnFup3+jU5G8hPZwu4uGruUlnC22+Ru9antnDHfF19SFq
	 ua81iLtGmhCtxx2ZS7f7oMZQGBFDL/WPqOo3j+KHo3Y3OFCsASK7rA2JYR3oINcwX+
	 JSztqEY1axUSffn87uQeHHKP+BqSMDFv6OOySHQ1jYq4wSZC5/n6OEhp/2ja4HCPdb
	 dY4zb0NPNz9Nv/Unb7SZuR8s+QZ4sOp7+swjocRgyscWLBZ9HnAkvUa9LBTWQp104x
	 fRyZWIV1s+kkg==
Date: Mon, 12 Dec 2022 17:42:14 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: xen-devel@lists.xenproject.org, michal.orzel@amd.com, 
    Luca.Fancellu@arm.com, Julien Grall <jgrall@amazon.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 16/18] xen/arm: linker: Indent correctly _stext
In-Reply-To: <20221212095523.52683-17-julien@xen.org>
Message-ID: <alpine.DEB.2.22.394.2212121742070.3075842@ubuntu-linux-20-04-desktop>
References: <20221212095523.52683-1-julien@xen.org> <20221212095523.52683-17-julien@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 12 Dec 2022, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> _stext is indented by one space more compare to the lines. This doesn't
> seem warrant, so delete the extra space.
> 
> Signed-off: Julien Grall <jgrall@amazon.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>     Changes in v3:
>         - Patch added
> ---
>  xen/arch/arm/xen.lds.S | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
> index 92c298405259..ae8c3b4c6c5f 100644
> --- a/xen/arch/arm/xen.lds.S
> +++ b/xen/arch/arm/xen.lds.S
> @@ -31,7 +31,7 @@ SECTIONS
>    . = XEN_VIRT_START;
>    _start = .;
>    .text : {
> -        _stext = .;            /* Text section */
> +       _stext = .;             /* Text section */
>         *(.text.header)
>  
>         *(.text.cold)
> -- 
> 2.38.1
> 

