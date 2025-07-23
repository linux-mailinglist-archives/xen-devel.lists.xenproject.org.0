Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B14F1B0FB62
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jul 2025 22:25:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1054700.1423378 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueg1A-0000AX-6g; Wed, 23 Jul 2025 20:24:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1054700.1423378; Wed, 23 Jul 2025 20:24:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueg1A-00008E-3y; Wed, 23 Jul 2025 20:24:48 +0000
Received: by outflank-mailman (input) for mailman id 1054700;
 Wed, 23 Jul 2025 20:24:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KKGU=2E=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1ueg18-00007t-Nx
 for xen-devel@lists.xenproject.org; Wed, 23 Jul 2025 20:24:46 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [2604:1380:45d1:ec00::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 11710c03-6803-11f0-b895-0df219b8e170;
 Wed, 23 Jul 2025 22:24:44 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id C0ACEA54D2A;
 Wed, 23 Jul 2025 20:24:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E874C4CEE7;
 Wed, 23 Jul 2025 20:24:41 +0000 (UTC)
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
X-Inumbo-ID: 11710c03-6803-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753302282;
	bh=ZmHmTjYvXS8F6m32/U3cv0XZLOXFpp05OvXlkISRU80=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=txpuXk/pYNaGthTlnpFoqgh1znI4AoBBVauctsnST+wBKXU8B4ghK11Aw9Pu7tm7H
	 Pmh90s3pqW8Lwl0aGgPOFS9rNfcpg5oAa4Ql19bapsMdxFofGPlFTJosFQ7i1Zsign
	 JZCbCndCC10rgZDXsi+TFb2HoehSoIAckZSye7fWbNmQT5x1p/xQ84kPc17rD5M4Ky
	 QC37KQjVMGu73hVA2btb9neOEqdXidxJ4aLpK8wgPJmo0mFsD+/XtjTpQUfVmo9asW
	 at51QzwokKn/cwO/FWIT6NTzGgpxTGYF/YFuyHAVCpHky1QB3z74gIK3PBhcgb44Ua
	 G7EsWUMZHGT4g==
Date: Wed, 23 Jul 2025 13:24:40 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Nicola Vetrini <nicola.vetrini@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] automation/eclair: tag guidelines D4.7, R21.18, R21.20
 as clean
In-Reply-To: <9045a2e3cae57995bb279f66de19e9a6beed3a5b.1753277988.git.dmytro_prokopchuk1@epam.com>
Message-ID: <alpine.DEB.2.22.394.2507231324350.7043@ubuntu-linux-20-04-desktop>
References: <9045a2e3cae57995bb279f66de19e9a6beed3a5b.1753277988.git.dmytro_prokopchuk1@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 23 Jul 2025, Dmytro Prokopchuk1 wrote:
> Update ECLAIR configuration to consider guidelines as clean
> so as to avoid regressions.
> 
> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>

Please provide a link to a clean pipeline. Assuming you have it:

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  automation/eclair_analysis/ECLAIR/tagging.ecl | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/automation/eclair_analysis/ECLAIR/tagging.ecl b/automation/eclair_analysis/ECLAIR/tagging.ecl
> index 879485b680..c79358bdae 100644
> --- a/automation/eclair_analysis/ECLAIR/tagging.ecl
> +++ b/automation/eclair_analysis/ECLAIR/tagging.ecl
> @@ -23,6 +23,7 @@
>  "MC3A2.D1.1||
>  MC3A2.D2.1||
>  MC3A2.D4.1||
> +MC3A2.D4.7||
>  MC3A2.D4.10||
>  MC3A2.D4.11||
>  MC3A2.D4.14||
> @@ -103,7 +104,9 @@ MC3A2.R21.10||
>  MC3A2.R21.11||
>  MC3A2.R21.12||
>  MC3A2.R21.13||
> +MC3A2.R21.18||
>  MC3A2.R21.19||
> +MC3A2.R21.20||
>  MC3A2.R21.21||
>  MC3A2.R22.1||
>  MC3A2.R22.2||
> -- 
> 2.43.0
> 

