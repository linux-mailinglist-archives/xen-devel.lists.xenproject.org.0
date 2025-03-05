Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F37A4F244
	for <lists+xen-devel@lfdr.de>; Wed,  5 Mar 2025 01:17:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.901639.1309620 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpcRk-0005FL-7n; Wed, 05 Mar 2025 00:17:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 901639.1309620; Wed, 05 Mar 2025 00:17:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpcRk-0005Ds-52; Wed, 05 Mar 2025 00:17:12 +0000
Received: by outflank-mailman (input) for mailman id 901639;
 Wed, 05 Mar 2025 00:17:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gbs/=VY=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tpcRi-0005Dm-G1
 for xen-devel@lists.xenproject.org; Wed, 05 Mar 2025 00:17:10 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2cd9b5fb-f957-11ef-9ab4-95dc52dad729;
 Wed, 05 Mar 2025 01:17:08 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id DFBE5A46134;
 Wed,  5 Mar 2025 00:11:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29019C4CEE9;
 Wed,  5 Mar 2025 00:17:06 +0000 (UTC)
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
X-Inumbo-ID: 2cd9b5fb-f957-11ef-9ab4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741133827;
	bh=epKUhep462GMxKnqe0Nwl3QcWlNcWklWzK2ZVLTnrpU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=gYa8tHvlObVJPMpq+BrmyWPCCecdzOP43Elmb7+h3godyN/vQOf3RzjpDJUQbhCqa
	 /pi54fTsydPB+mIEkplYPK8Tda/EF2tfVyZ6bbogDWiARYJZ/y9WEi8t5qOF/mDLQ2
	 bkJQ3juu162GBqi9V0NXsuZkA9w7X+PEf1LGrjQ/v3+EXh42owrc35gu0+/xadycg4
	 5QvTk+ZuWvIZhq1lRAm6tlTFLZToO+7P5B0i5YwOx5EosrpxIUkp/lZge1+O2jRf8/
	 99Eb5vloSGvR3ZeF1M46ejXVqrxsyQGyDpdKgXTd4gd/O1txrwAP+Hbl5xJjlajUlM
	 UVBGG7N9Ib4LQ==
Date: Tue, 4 Mar 2025 16:17:04 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: Re: [PATCH] MISRA: Rephrase the deviation for Directive 4.10
In-Reply-To: <20250304235701.2770842-1-andrew.cooper3@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2503041616560.1303386@ubuntu-linux-20-04-desktop>
References: <20250304235701.2770842-1-andrew.cooper3@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-757340337-1741133827=:1303386"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-757340337-1741133827=:1303386
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 4 Mar 2025, Andrew Cooper wrote:
> The use of "legitimately" mixes the concepts of "it was designed to do this"
> and "it was correct to do this".
> 
> The latter in particular can go stale.  "intended" is a better way of phrasing
> this.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> CC: Anthony PERARD <anthony.perard@vates.tech>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Julien Grall <julien@xen.org>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
>  automation/eclair_analysis/ECLAIR/deviations.ecl | 2 +-
>  xen/arch/arm/include/asm/perfc_defn.h            | 2 +-
>  xen/arch/x86/include/asm/perfc_defn.h            | 2 +-
>  xen/include/asm-generic/perfc_defn.h             | 2 +-
>  xen/include/xen/perfc_defn.h                     | 2 +-
>  5 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
> index dfa5f34b3952..2c8fb9271391 100644
> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> @@ -74,7 +74,7 @@ they are not instances of commented-out code."
>  
>  -doc_begin="Files that are intended to be included more than once do not need to
>  conform to the directive."
> --config=MC3A2.D4.10,reports+={safe, "first_area(text(^/\\* This file is legitimately included multiple times\\. \\*/$, begin-4))"}
> +-config=MC3A2.D4.10,reports+={safe, "first_area(text(^/\\* This file is intended to be included multiple times\\. \\*/$, begin-4))"}
>  -config=MC3A2.D4.10,reports+={safe, "first_area(text(^/\\* Generated file, do not edit! \\*/$, begin-3))"}
>  -config=MC3A2.D4.10,reports+={safe, "all_area(all_loc(file(^xen/include/generated/autoconf.h$)))"}
>  -doc_end
> diff --git a/xen/arch/arm/include/asm/perfc_defn.h b/xen/arch/arm/include/asm/perfc_defn.h
> index 3ab0391175d7..effd25b69ecc 100644
> --- a/xen/arch/arm/include/asm/perfc_defn.h
> +++ b/xen/arch/arm/include/asm/perfc_defn.h
> @@ -1,4 +1,4 @@
> -/* This file is legitimately included multiple times. */
> +/* This file is intended to be included multiple times. */
>  /*#ifndef __XEN_PERFC_DEFN_H__*/
>  /*#define __XEN_PERFC_DEFN_H__*/
>  
> diff --git a/xen/arch/x86/include/asm/perfc_defn.h b/xen/arch/x86/include/asm/perfc_defn.h
> index 487e20dc9734..d6127cb91ea5 100644
> --- a/xen/arch/x86/include/asm/perfc_defn.h
> +++ b/xen/arch/x86/include/asm/perfc_defn.h
> @@ -1,4 +1,4 @@
> -/* This file is legitimately included multiple times. */
> +/* This file is intended to be included multiple times. */
>  /*#ifndef __XEN_PERFC_DEFN_H__*/
>  /*#define __XEN_PERFC_DEFN_H__*/
>  
> diff --git a/xen/include/asm-generic/perfc_defn.h b/xen/include/asm-generic/perfc_defn.h
> index 8237636d83fb..726cddc1b3e8 100644
> --- a/xen/include/asm-generic/perfc_defn.h
> +++ b/xen/include/asm-generic/perfc_defn.h
> @@ -1,4 +1,4 @@
> -/* This file is legitimately included multiple times. */
> +/* This file is intended to be included multiple times. */
>  /* #ifndef ASM_GENERIC_PERFC_DEFN_H */
>  /* #define ASM_GENERIC_PERFC_DEFN_H */
>  
> diff --git a/xen/include/xen/perfc_defn.h b/xen/include/xen/perfc_defn.h
> index a987d80dd6f1..afbabad0b3be 100644
> --- a/xen/include/xen/perfc_defn.h
> +++ b/xen/include/xen/perfc_defn.h
> @@ -1,4 +1,4 @@
> -/* This file is legitimately included multiple times. */
> +/* This file is intended to be included multiple times. */
>  /*#ifndef __XEN_PERFC_DEFN_H__*/
>  /*#define __XEN_PERFC_DEFN_H__*/
>  
> 
> base-commit: 83e043ee72b8c2fe1d620d137c20a2ffb040da01
> -- 
> 2.39.5
> 
--8323329-757340337-1741133827=:1303386--

