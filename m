Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E126AB08202
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jul 2025 03:04:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1046000.1416248 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucD2i-0000Nt-I7; Thu, 17 Jul 2025 01:04:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1046000.1416248; Thu, 17 Jul 2025 01:04:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucD2i-0000LU-Ed; Thu, 17 Jul 2025 01:04:12 +0000
Received: by outflank-mailman (input) for mailman id 1046000;
 Thu, 17 Jul 2025 01:04:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R98P=Z6=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1ucD2h-0000L8-2L
 for xen-devel@lists.xenproject.org; Thu, 17 Jul 2025 01:04:11 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f06f139e-62a9-11f0-b894-0df219b8e170;
 Thu, 17 Jul 2025 03:04:08 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 969925C66BA;
 Thu, 17 Jul 2025 01:04:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B117AC4CEE7;
 Thu, 17 Jul 2025 01:04:05 +0000 (UTC)
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
X-Inumbo-ID: f06f139e-62a9-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752714246;
	bh=lgfTaOp8gjYdL+ZKNAPLZCf6A3eQscniJ4OIln9cgvY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=sGyxBX3gi7JbTsr4vz87Y1RvgfkGE3OkpWing+R/f72KRpEML0Uguvv7hW47i2rBE
	 B2z5qoeq5eKx1rA1PVmqzXYgZAmtwDYJk7RUQLPKXzgKKELlDxEw4LziYQd68Rgylv
	 cCM6WzY30rSOyxaqaXyXRTi9WCZHTBst+HiABQ9+sO8hYkO2pbhRS8ELT199wXrPTF
	 6T9wnAI5T4Ib4hZ5HYoFljUCwyIeEd8k+BY4XO7GtS13n2v3RfEl+2yWl/CMnXlsFk
	 cxCrUiJ7OyDQvUcHctj5XE6F9LUmRA+ERjk4GOeyDKktVmvJJ1BiZhYwT83lgswoMW
	 1NLxv6/ezaPwA==
Date: Wed, 16 Jul 2025 18:04:04 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] automation/eclair: upload code quality report artifact
In-Reply-To: <d805538bb4f0f03286969cc5f04fcc2252c10d0e.1752670553.git.dmytro_prokopchuk1@epam.com>
Message-ID: <alpine.DEB.2.22.394.2507161803570.15546@ubuntu-linux-20-04-desktop>
References: <d805538bb4f0f03286969cc5f04fcc2252c10d0e.1752670553.git.dmytro_prokopchuk1@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 16 Jul 2025, Dmytro Prokopchuk1 wrote:
> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  automation/gitlab-ci/analyze.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/automation/gitlab-ci/analyze.yaml b/automation/gitlab-ci/analyze.yaml
> index 9102362601..d507210067 100644
> --- a/automation/gitlab-ci/analyze.yaml
> +++ b/automation/gitlab-ci/analyze.yaml
> @@ -17,6 +17,7 @@
>        - "${ECLAIR_OUTPUT_DIR}/*.log"
>        - "${ECLAIR_OUTPUT_DIR}/*.txt"
>        - '*.log'
> +      - '*.json'
>      reports:
>        codequality: gl-code-quality-report.json
>    rules:
> -- 
> 2.43.0
> 

