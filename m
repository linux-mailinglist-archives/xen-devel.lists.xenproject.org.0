Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B6B377181
	for <lists+xen-devel@lfdr.de>; Sat,  8 May 2021 13:50:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.124261.234520 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lfLS6-0001TD-UD; Sat, 08 May 2021 11:48:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 124261.234520; Sat, 08 May 2021 11:48:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lfLS6-0001QU-R8; Sat, 08 May 2021 11:48:58 +0000
Received: by outflank-mailman (input) for mailman id 124261;
 Sat, 08 May 2021 11:48:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0wEz=KD=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 1lfLS5-0001QO-Bo
 for xen-devel@lists.xenproject.org; Sat, 08 May 2021 11:48:57 +0000
Received: from sonata.ens-lyon.org (unknown [140.77.166.138])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6478de38-f967-4034-b392-90cd9e22357a;
 Sat, 08 May 2021 11:48:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id C5513201C3;
 Sat,  8 May 2021 13:43:04 +0200 (CEST)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dpMAKn6puGgo; Sat,  8 May 2021 13:43:04 +0200 (CEST)
Received: from begin (lfbn-bor-1-56-204.w90-50.abo.wanadoo.fr [90.50.148.204])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id A5586201AD;
 Sat,  8 May 2021 13:43:04 +0200 (CEST)
Received: from samy by begin with local (Exim 4.94)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1lfLMN-00BMTv-V3; Sat, 08 May 2021 13:43:03 +0200
Resent-From: Samuel Thibault <samuel.thibault@ens-lyon.org>
Resent-Date: Sat, 8 May 2021 13:43:03 +0200
Resent-Message-ID: <20210508114303.kg3ljchsoia67iot@begin>
Resent-To: jandryuk@gmail.com, xen-devel@lists.xenproject.org,
 dgdegra@tycho.nsa.gov, quan.xu0@gmail.com
Received: from samy by begin with local (Exim 4.94.2)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1lelk9-006BGX-U9; Thu, 06 May 2021 23:41:13 +0200
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
X-Inumbo-ID: 6478de38-f967-4034-b392-90cd9e22357a
Date: Thu, 6 May 2021 23:41:13 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Jason Andryuk <jandryuk@gmail.com>
Cc: xen-devel@lists.xenproject.org, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
	Quan Xu <quan.xu0@gmail.com>
Subject: Re: [PATCH v2 10/13] vtpmmgr: Remove bogus cast from TPM2_GetRandom
Message-ID: <20210506214113.bhkhiif4utufxxwp@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Jason Andryuk <jandryuk@gmail.com>, xen-devel@lists.xenproject.org,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>,
	Quan Xu <quan.xu0@gmail.com>
References: <20210506135923.161427-1-jandryuk@gmail.com>
 <20210506135923.161427-11-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210506135923.161427-11-jandryuk@gmail.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)

Jason Andryuk, le jeu. 06 mai 2021 09:59:20 -0400, a ecrit:
> The UINT32 <-> UINT16 casting in TPM2_GetRandom is incorrect.  Use a
> local UINT16 as needed for the TPM hardware command and assign the
> result.
> 
> Suggested-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
>  stubdom/vtpmmgr/tpm2.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/stubdom/vtpmmgr/tpm2.c b/stubdom/vtpmmgr/tpm2.c
> index 655e6d164c..ebd06eac74 100644
> --- a/stubdom/vtpmmgr/tpm2.c
> +++ b/stubdom/vtpmmgr/tpm2.c
> @@ -427,15 +427,22 @@ abort_egress:
>  
>  TPM_RC TPM2_GetRandom(UINT32 * bytesRequested, BYTE * randomBytes)
>  {
> +    UINT16 bytesReq;
>      TPM_BEGIN(TPM_ST_NO_SESSIONS, TPM_CC_GetRandom);
>  
> -    ptr = pack_UINT16(ptr, (UINT16)*bytesRequested);
> +    if (*bytesRequested > UINT16_MAX)
> +        bytesReq = UINT16_MAX;
> +    else
> +        bytesReq = *bytesRequested;
> +
> +    ptr = pack_UINT16(ptr, bytesReq);
>  
>      TPM_TRANSMIT();
>      TPM_UNPACK_VERIFY();
>  
> -    ptr = unpack_UINT16(ptr, (UINT16 *)bytesRequested);
> -    ptr = unpack_TPM_BUFFER(ptr, randomBytes, *bytesRequested);
> +    ptr = unpack_UINT16(ptr, &bytesReq);
> +    *bytesRequested = bytesReq;
> +    ptr = unpack_TPM_BUFFER(ptr, randomBytes, bytesReq);
>  
>  abort_egress:
>      return status;
> -- 
> 2.30.2
> 

-- 
Samuel
<N> (* If you have a precise idea of the intended use of the following code, please
<N>    write to Eduardo.Gimenez@inria.fr and ask for the prize :-)
<N>    -- Eduardo (11/8/97) *)
 -+- N sur #ens-mim - et c'était un des développeurs -+-

