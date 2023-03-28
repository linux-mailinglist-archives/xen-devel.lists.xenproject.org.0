Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D686CB2CE
	for <lists+xen-devel@lfdr.de>; Tue, 28 Mar 2023 02:27:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515488.798411 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgxAh-00038K-1F; Tue, 28 Mar 2023 00:26:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515488.798411; Tue, 28 Mar 2023 00:26:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgxAg-00035r-UZ; Tue, 28 Mar 2023 00:26:42 +0000
Received: by outflank-mailman (input) for mailman id 515488;
 Tue, 28 Mar 2023 00:26:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=by25=7U=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pgxAf-00035g-IV
 for xen-devel@lists.xenproject.org; Tue, 28 Mar 2023 00:26:41 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3514a917-ccff-11ed-85db-49a42c6b2330;
 Tue, 28 Mar 2023 02:26:39 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4DCCFB8191D;
 Tue, 28 Mar 2023 00:26:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4E31C433D2;
 Tue, 28 Mar 2023 00:26:36 +0000 (UTC)
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
X-Inumbo-ID: 3514a917-ccff-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679963197;
	bh=qkOeqc25HzgkoabAcrW2SovfaG7h0nvPl0oFquzlfHE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=cy+Fa3sC64N0DVuVUEl3K9QD50ZV9Kiwu31NMM999tsldNIbdJKaA964gZdRosnHQ
	 s/GTwKEn52OonrKt1mxi0x1Ao/I5GfHEb+lvkQ7qMSgipOStQizLLGUulBGBiwrRbI
	 91rDqWVBStRMaEJvKsMORsxfZZWhMnmk/vyaEXAPo20NQMz3/ZN0OkdqtNCLSiSnMA
	 ayqfQfSLcdJIN0dnEoSfOaQ18w1fBJWxgsQALtYR/JXCXhUGv9dzZ5jMQkp2X3DHP0
	 +bywWGyLaW5/FxrE04ayqgnKmthNVi1JuXt/H8+O5bo2MIpGLViqrFUsXdZ/7qQ2cs
	 biXPlgyYnFlSg==
Date: Mon, 27 Mar 2023 17:26:35 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 1/7] LICENSES: Clarify that the SPDX tag GPL-2.0 is
 deprecated
In-Reply-To: <20230327184520.81828-2-julien@xen.org>
Message-ID: <alpine.DEB.2.22.394.2303271726280.4066@ubuntu-linux-20-04-desktop>
References: <20230327184520.81828-1-julien@xen.org> <20230327184520.81828-2-julien@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 27 Mar 2023, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> >From https://spdx.org/licenses/GPL-2.0.html, the SPDX tag GPL-2.0
> is deprecated. Instead, GPL-2.0-only should be used.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>     Changes in v2:
>         - Patch added
> ---
>  LICENSES/GPL-2.0 | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/LICENSES/GPL-2.0 b/LICENSES/GPL-2.0
> index ff0812fd89cc..9f09528a8bce 100644
> --- a/LICENSES/GPL-2.0
> +++ b/LICENSES/GPL-2.0
> @@ -8,9 +8,9 @@ Usage-Guide:
>    tag/value pairs into a comment according to the placement
>    guidelines in the licensing rules documentation.
>    For 'GNU General Public License (GPL) version 2 only' use:
> -    SPDX-License-Identifier: GPL-2.0
> -  or
>      SPDX-License-Identifier: GPL-2.0-only
> +  or (now deprecated)
> +    SPDX-License-Identifier: GPL-2.0
>    For 'GNU General Public License (GPL) version 2 or any later version' use:
>      SPDX-License-Identifier: GPL-2.0+
>    or
> -- 
> 2.39.2
> 

