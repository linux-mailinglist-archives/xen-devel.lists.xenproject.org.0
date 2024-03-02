Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F8686ED94
	for <lists+xen-devel@lfdr.de>; Sat,  2 Mar 2024 01:47:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687822.1071627 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rgDWw-0005NH-75; Sat, 02 Mar 2024 00:47:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687822.1071627; Sat, 02 Mar 2024 00:47:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rgDWw-0005Kq-3o; Sat, 02 Mar 2024 00:47:10 +0000
Received: by outflank-mailman (input) for mailman id 687822;
 Sat, 02 Mar 2024 00:47:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J2h5=KI=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rgDWu-0005Ki-0d
 for xen-devel@lists.xenproject.org; Sat, 02 Mar 2024 00:47:08 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 63c28f2f-d82e-11ee-a1ee-f123f15fe8a2;
 Sat, 02 Mar 2024 01:47:05 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 79FB161356;
 Sat,  2 Mar 2024 00:47:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFFD7C433F1;
 Sat,  2 Mar 2024 00:47:02 +0000 (UTC)
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
X-Inumbo-ID: 63c28f2f-d82e-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709340424;
	bh=rzZ/TZ2+muN0dErzsGl4tGXmgSd+omvFE56oIy2cGI0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=pYPlezXl5tvnAIjQLeewYIGxAcu5BjL3ERac1zMPrTE3XN9DpWT46e7P1ZAIUi98i
	 NxrIPXArn9rlJkthtVkfHPr0pl/KVFmzzd7LGIAFPC3KBWj6XZXiU++/ESvXFo9SVm
	 9fCa9VZUM5Bs64MffZE6aWZ4Z+NO2f6CfEiStiPqUV8GCmEZrkElK1zbXC806lvuaD
	 b5VFYrLA2ZaYwuN56yVWYpMKhOmt5oo3Jc8nDZouJFlTjywzxxwduiHW8MxF7/JID/
	 dVTq4z0JuaF8DMj2+0CXL6jR7qp/PaOL/Obbg8aMv2PZQ2vqJLnuG/ouaEoJxq5R3Q
	 XxxSRmcjWBTnQ==
Date: Fri, 1 Mar 2024 16:47:01 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Simone Ballarin <simone.ballarin@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH] automation/eclair: add deviation for MISRA C:2012
 Rule 16.6
In-Reply-To: <a9027b582d7866a31d7438d083499c53a3245989.1709305397.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2403011646540.853156@ubuntu-linux-20-04-desktop>
References: <a9027b582d7866a31d7438d083499c53a3245989.1709305397.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 1 Mar 2024, Federico Serafini wrote:
> Update ECLAIR configuration to take into account the deviations
> agreed during MISRA meetings.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  automation/eclair_analysis/ECLAIR/deviations.ecl | 4 ++++
>  docs/misra/deviations.rst                        | 6 ++++++
>  2 files changed, 10 insertions(+)
> 
> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
> index 02eae39786..0e62a7029f 100644
> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> @@ -378,6 +378,10 @@ explicit comment indicating the fallthrough intention is present."
>  -config=MC3R1.R16.3,reports+={safe, "any_area(end_loc(any_exp(text(^(?s).*/\\* [fF]all ?through.? \\*/.*$,0..1))))"}
>  -doc_end
>  
> +-doc_begin="A switch statement with a single switch clause and no default label is deliberate and improves readability with respect to an equivalent if statement."
> +-config=MC3R1.R16.6,switch_clauses+={deliberate, "default(0)"}
> +-doc_end
> +
>  #
>  # Series 18.
>  #
> diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
> index 123c78e20a..041f8db4ee 100644
> --- a/docs/misra/deviations.rst
> +++ b/docs/misra/deviations.rst
> @@ -322,6 +322,12 @@ Deviations related to MISRA C:2012 Rules:
>           - /\* Fallthrough \*/
>           - /\* Fallthrough. \*/
>  
> +   * - R16.6
> +     - A switch statement with a single switch clause and no default label is
> +       deliberate and improves readability with respect to an equivalent if
> +       statement.
> +     - Tagged as `deliberate` for ECLAIR.
> +
>     * - R20.7
>       - Code violating Rule 20.7 is safe when macro parameters are used:
>         (1) as function arguments;
> -- 
> 2.34.1
> 

