Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 249039D20F2
	for <lists+xen-devel@lfdr.de>; Tue, 19 Nov 2024 08:48:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.839694.1255480 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDIyE-0006YG-2u; Tue, 19 Nov 2024 07:48:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 839694.1255480; Tue, 19 Nov 2024 07:48:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDIyD-0006W3-Vq; Tue, 19 Nov 2024 07:48:21 +0000
Received: by outflank-mailman (input) for mailman id 839694;
 Tue, 19 Nov 2024 07:48:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7fzo=SO=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1tDIyB-0006Vx-Vg
 for xen-devel@lists.xenproject.org; Tue, 19 Nov 2024 07:48:20 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a2c5c434-a64a-11ef-a0ca-8be0dac302b0;
 Tue, 19 Nov 2024 08:48:16 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 6086E4EE0767;
 Tue, 19 Nov 2024 08:48:15 +0100 (CET)
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
X-Inumbo-ID: a2c5c434-a64a-11ef-a0ca-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjE2Mi41NS4xMzEuNDciLCJoZWxvIjoic3VwcG9ydC5idWdzZW5nLmNvbSJ9
X-Custom-Transaction: eyJpZCI6ImEyYzVjNDM0LWE2NGEtMTFlZi1hMGNhLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyMDAyNDk2LjQ3MDE3NSwic2VuZGVyIjoibmljb2xhLnZldHJpbmlAYnVnc2VuZy5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1732002495; bh=NdjPNS8D8kuzjV6xaom5t7PBbzwpAR3Obq6NtTaq7fI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=BjEcRaSsm6v4qXX12xC7A6U/qDBQ8LV/kYHwLHzT+jQZ2VyiLGxjmMwvcXhS5wfXX
	 CfeUF4zqIFk+A5e34jKbBdL/6xKFiZrEl1MxSJOVsGDQad61p0wNllW+Mv/nNanPTY
	 +bXXwrCRsfteZ5HwLJiUHpCWqe1mb9N8oRBAzeipndAlEtZsJ/bYzZrSSmws2GhVH0
	 scQMIxVMvDOMtRIAmt/GYAw16V0DQ4WXgYBR3yj7smNatblg5ero5Oiiz+QnOcwtZg
	 /zj+xXnkLn9GFFV1Fh71PjJDGT6vdV3Y6BFOBIMym7+iOTOJ375GnxsUGYAxybtiJ+
	 /v/zZGdm55MlA==
MIME-Version: 1.0
Date: Tue, 19 Nov 2024 08:48:15 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, alessandro.zucchelli@bugseng.com,
 simone.ballarin@bugseng.com, consulting@bugseng.com, jbeulich@suse.com,
 andrew.cooper3@citrix.com, julien@xen.org, roger.pau@citrix.com,
 bertrand.marquis@arm.com, michal.orzel@amd.com
Subject: Re: [PATCH v2] misra: increase identifiers length to 63
In-Reply-To: <alpine.DEB.2.22.394.2411181552510.1160299@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2411181552510.1160299@ubuntu-linux-20-04-desktop>
Message-ID: <328beeb94e88b8736d0a062f9771a9ca@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2024-11-19 00:54, Stefano Stabellini wrote:
> Currently the identifiers characters limit is arbitrarily set to 40. It
> causes a few violations as we have some identifiers longer than 40.
> 
> Increase the limit to another rather arbitrary limit of 63. Thanks to
> this change, we remove a few violations, getting us one step closer to
> marking Rules 5.2 and 5.4 as clean.
> 
> The ECLAIR configuration is already using 63, so this change matches
> the rules.rst documentation with the ECLAIR behavior.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
Reviewed-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
> Changes in v2:
> - use 63 instead of 64
> - drop unneeded change to ECLAIR config
> 
>  docs/misra/rules.rst | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
> index 4a144da8d6..3ed5801bff 100644
> --- a/docs/misra/rules.rst
> +++ b/docs/misra/rules.rst
> @@ -154,7 +154,7 @@ maintainers if you want to suggest a change.
>     * - `Rule 5.1 
> <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_05_01_2.c>`_
>       - Required
>       - External identifiers shall be distinct
> -     - The Xen characters limit for identifiers is 40. Public headers
> +     - The Xen characters limit for identifiers is 63. Public headers
>         (xen/include/public/) are allowed to retain longer identifiers
>         for backward compatibility.
> 
> @@ -162,7 +162,7 @@ maintainers if you want to suggest a change.
>       - Required
>       - Identifiers declared in the same scope and name space shall be
>         distinct
> -     - The Xen characters limit for identifiers is 40. Public headers
> +     - The Xen characters limit for identifiers is 63. Public headers
>         (xen/include/public/) are allowed to retain longer identifiers
>         for backward compatibility.
> 
> @@ -177,7 +177,7 @@ maintainers if you want to suggest a change.
>     * - `Rule 5.4 
> <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_05_04.c>`_
>       - Required
>       - Macro identifiers shall be distinct
> -     - The Xen characters limit for macro identifiers is 40. Public
> +     - The Xen characters limit for macro identifiers is 63. Public
>         headers (xen/include/public/) are allowed to retain longer
>         identifiers for backward compatibility.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

