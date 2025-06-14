Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7518AD9911
	for <lists+xen-devel@lfdr.de>; Sat, 14 Jun 2025 02:32:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1015116.1393047 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQEp2-0002zX-9F; Sat, 14 Jun 2025 00:32:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1015116.1393047; Sat, 14 Jun 2025 00:32:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQEp2-0002xo-6e; Sat, 14 Jun 2025 00:32:36 +0000
Received: by outflank-mailman (input) for mailman id 1015116;
 Sat, 14 Jun 2025 00:32:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SRxw=Y5=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uQEp1-0002xg-09
 for xen-devel@lists.xenproject.org; Sat, 14 Jun 2025 00:32:35 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [2604:1380:45d1:ec00::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0f582dc8-48b7-11f0-b894-0df219b8e170;
 Sat, 14 Jun 2025 02:32:33 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id D1C56A50033;
 Sat, 14 Jun 2025 00:32:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C0E6C4CEE3;
 Sat, 14 Jun 2025 00:32:30 +0000 (UTC)
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
X-Inumbo-ID: 0f582dc8-48b7-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749861151;
	bh=MkV8CeD2OfJIzE/EorxmkMN1DHR3eKYBFqseHr2L5NA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=TrgFHxT3ibVI+AmCY+Va99lESHzhe1fhHnFszCuzBFYoqAESQaHjhKLkHQtZ/6Hq+
	 MwYbxmRXKg4ETpW17sbdYw8fkRT21YQZfk3HBovelN4voXfCJfmIIgwYoZjox2JVde
	 KpBxtE9eehyu9TvjJ6d1oXw34IJl9qHroK/WlsBvPiKwdMLsSg/WIpGfyO/EXQlaTY
	 8OfxG1zmuYf8g+SarIvQ9tcMRalXMnokVNzRcj1x2mpx7+M4mKto2jKYU2ZAcV4QJs
	 4QYGM4xXI5GLQdFm+DG7knOOycFqqH5OyaVoV30ERi7dkAxIiW/ePobf1JZbHUzJa5
	 406qaZUg4pPhQ==
Date: Fri, 13 Jun 2025 17:32:29 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Alejandro Vallejo <agarciav@amd.com>
cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v3 03/14] CODING_STYLE: Custom type names must be
 snake-cased by word.
In-Reply-To: <20250613151612.754222-4-agarciav@amd.com>
Message-ID: <alpine.DEB.2.22.394.2506131731200.8480@ubuntu-linux-20-04-desktop>
References: <20250613151612.754222-1-agarciav@amd.com> <20250613151612.754222-4-agarciav@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 13 Jun 2025, Alejandro Vallejo wrote:
> There's the unwritten convention in x86 of splitting type names using
> underscores. Add such convention to the CODINNG_STYLE to make it
                                          ^ CODING_STYLE

> common and less unwritten.
> 
> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
> ---
>  CODING_STYLE | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/CODING_STYLE b/CODING_STYLE
> index 5644f1697f..e91ef7b3ca 100644
> --- a/CODING_STYLE
> +++ b/CODING_STYLE
> @@ -126,6 +126,9 @@ register).
>  Especially with pointer types, whenever the pointed to object is not
>  (supposed to be) modified, qualify the pointed to type with "const".
>  
> +When defining types, split its words using underscores (e.g: prefer my_foo to
> +myfoo).

Minor NIT:
When defining types, separate words using underscores (for example, use
"my_foo" instead of "myfoo").


Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


>  Comments
>  --------
>  
> -- 
> 2.43.0
> 

