Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D61E798E7CC
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2024 02:37:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.809131.1221318 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sw9q7-0004Y3-VR; Thu, 03 Oct 2024 00:37:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 809131.1221318; Thu, 03 Oct 2024 00:37:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sw9q7-0004Wa-S8; Thu, 03 Oct 2024 00:37:07 +0000
Received: by outflank-mailman (input) for mailman id 809131;
 Thu, 03 Oct 2024 00:37:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g6hD=Q7=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sw9q6-00049l-Fq
 for xen-devel@lists.xenproject.org; Thu, 03 Oct 2024 00:37:06 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9d11683b-811f-11ef-a0ba-8be0dac302b0;
 Thu, 03 Oct 2024 02:37:05 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id AB9885C0F95;
 Thu,  3 Oct 2024 00:37:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA4B6C4CEC2;
 Thu,  3 Oct 2024 00:37:03 +0000 (UTC)
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
X-Inumbo-ID: 9d11683b-811f-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727915824;
	bh=QhO2f1ABbBC2phl3CEcuzs338jR63ywTVm0XNJp2VmE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=OjPAWUUduAmk8YyF7TJitI03zahsvzK4sCx1oMJbVVSLUWR8VDLfJJUFuhxq+4hh7
	 QdVAraB6msiwEsQrEqALBb9sSLaqK/nzqKqd+3eoKlstP7pb3CjjhtAuSAZWhyEWcn
	 +EX/cJy3JFR4Qqf0Lm2TJ6V0m9viijaQqlgwZIJhpQKywS2Zv4llhHGSXJ8uDWGGnh
	 uETJDolNDjs5uIw6rMfCKcXGqZFB7tYQQYbZF2Om3dUup20uMASwIs7dgJbNiXO1Mj
	 TA2GyttCLd2Q6LyEqjNpdt+q2V9wMz2OX20Aor6WcQD4GZlAmXjSKp1qNUCW361Ala
	 /oeL50I8OBf+g==
Date: Wed, 2 Oct 2024 17:37:02 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Simone Ballarin <simone.ballarin@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH v2 3/3] automation/eclair: tag Rule 13.6 as clean
In-Reply-To: <8fc4fe3f0ef744ef0c379bf76b8425deac40088c.1727690180.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2410021736560.1138574@ubuntu-linux-20-04-desktop>
References: <cover.1727690180.git.federico.serafini@bugseng.com> <8fc4fe3f0ef744ef0c379bf76b8425deac40088c.1727690180.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 30 Sep 2024, Federico Serafini wrote:
> Update ECLAIR configuration to consider Rule 13.6 as clean:
> new violations of this rule will cause a failure of the CI pipeline.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  automation/eclair_analysis/ECLAIR/tagging.ecl | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/automation/eclair_analysis/ECLAIR/tagging.ecl b/automation/eclair_analysis/ECLAIR/tagging.ecl
> index b8448938e6..76032b1fe1 100644
> --- a/automation/eclair_analysis/ECLAIR/tagging.ecl
> +++ b/automation/eclair_analysis/ECLAIR/tagging.ecl
> @@ -60,6 +60,7 @@ MC3R1.R11.6||
>  MC3R1.R11.7||
>  MC3R1.R11.9||
>  MC3R1.R12.5||
> +MC3R1.R13.6||
>  MC3R1.R14.1||
>  MC3R1.R14.3||
>  MC3R1.R14.4||
> -- 
> 2.43.0
> 

