Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED3A490C11E
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jun 2024 03:11:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.742633.1149471 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJNNd-0004VO-6s; Tue, 18 Jun 2024 01:11:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 742633.1149471; Tue, 18 Jun 2024 01:11:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJNNd-0004TH-4J; Tue, 18 Jun 2024 01:11:25 +0000
Received: by outflank-mailman (input) for mailman id 742633;
 Tue, 18 Jun 2024 01:11:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gCZ4=NU=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sJNNb-0004TB-OZ
 for xen-devel@lists.xenproject.org; Tue, 18 Jun 2024 01:11:23 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a7a743e4-2d0f-11ef-90a3-e314d9c70b13;
 Tue, 18 Jun 2024 03:11:19 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id BBD2FCE1258;
 Tue, 18 Jun 2024 01:11:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCE68C2BD10;
 Tue, 18 Jun 2024 01:11:06 +0000 (UTC)
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
X-Inumbo-ID: a7a743e4-2d0f-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718673068;
	bh=OQ22/uCThoNFdDtdfZSE4e8hGRjjMHUTDSLgy3euapY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ZRpIQ7M2hk3uim0382qQiJ/gJ6QL468G0IRq0Ugv7WvJY+Yya4rTO97SgwXPOuaxZ
	 WmX51j/8KLDwyxmqDkNtVMOiUdOPd5xuy4BbPVWjeNFuq8PkIX8l6asNgeW4v1dSU9
	 LMqQUQNe4K0Jb5Lzf789ypdM7aJHF46tc3Nsa20qM7XK6D1CgRFXprcfjVPoOOsGqf
	 gXlIKlScbnez8iKqrjSm/j5Jlohv9fUAOklSyRu++g0NoaoIz9fe8oSwSXps3X2czZ
	 ots62YI54RNJmhaJyj3xs4vEZVlIIDbWS7WN605TcoFZKtRU3XgmOqQj4fKPKBUaoT
	 C++EuS3APBjCA==
Date: Mon, 17 Jun 2024 18:11:05 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [XEN PATCH for-4.19 v2 2/3] automation/eclair_analysis: address
 remaining violations of MISRA C Rule 20.12
In-Reply-To: <4ea119f84e075ebcdfe2669527826c269a454d0e.1717790683.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2406171810590.2572888@ubuntu-linux-20-04-desktop>
References: <cover.1717790683.git.nicola.vetrini@bugseng.com> <4ea119f84e075ebcdfe2669527826c269a454d0e.1717790683.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 7 Jun 2024, Nicola Vetrini wrote:
> The DEFINE macro in asm-offsets.c (for all architectures) still generates
> violations despite the file(s) being excluded from compliance, due to the
> fact that in its expansion it sometimes refers entities in non-excluded files.
> These corner cases are deviated by the configuration.
> 
> No functional change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>

> ---
>  automation/eclair_analysis/ECLAIR/deviations.ecl | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
> index 447c1e6661d1..e2653f77eb2c 100644
> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> @@ -483,6 +483,12 @@ leads to a violation of the Rule are deviated."
>  -config=MC3R1.R20.12,macros+={deliberate, "name(GENERATE_CASE)&&loc(file(deliberate_generate_case))"}
>  -doc_end
> 
> +-doc_begin="The macro DEFINE is defined and used in excluded files asm-offsets.c.
> +This may still cause violations if entities outside these files are referred to
> +in the expansion."
> +-config=MC3R1.R20.12,macros+={deliberate, "name(DEFINE)&&loc(file(asm_offsets))"}
> +-doc_end
> +
>  #
>  # Series 21.
>  #
> --
> 2.34.1
> 

