Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD4278CB759
	for <lists+xen-devel@lfdr.de>; Wed, 22 May 2024 03:07:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.727137.1131535 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9aRJ-0008FG-1U; Wed, 22 May 2024 01:06:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 727137.1131535; Wed, 22 May 2024 01:06:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9aRI-0008CZ-TI; Wed, 22 May 2024 01:06:44 +0000
Received: by outflank-mailman (input) for mailman id 727137;
 Wed, 22 May 2024 01:06:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ujjH=MZ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1s9aRG-0008CD-EF
 for xen-devel@lists.xenproject.org; Wed, 22 May 2024 01:06:42 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 893cf9c1-17d7-11ef-b4bb-af5377834399;
 Wed, 22 May 2024 03:06:38 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 6AF87CE118D;
 Wed, 22 May 2024 01:06:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58010C2BD11;
 Wed, 22 May 2024 01:06:29 +0000 (UTC)
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
X-Inumbo-ID: 893cf9c1-17d7-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716339990;
	bh=TTOoVNOjd3mf81omwkGQsgjBkQ/aPgXm6jABF/oZqKI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=mlojxMnydV5m/ffmRtXV9PAzTtjpGA9kwwf90vjZgCcNs7JBMIQKXHfTR101oTlPF
	 QCCKgXWN2k4kBupIhjZxFyxSIFXvb0mf8u6muveg8VNsdZlwctuEI8RUAo81st8HrM
	 WGXPHFHcVHYgqdxJuo/7h+uEVdFxwWrbYKlUG+XkYSfCmel9wC1i/4Zu3OOjfvaLVE
	 f86bEfiw5OBASJDr4M+Wez8r7AUk6OjCKPVu1zlcjOc62IxRyVTp5hH0081oDypIge
	 /F8QGU2tXPOmJj6uO9Ok9Bd5FNLuxfQhkmMOlFagp0VOiz6KvlWD/cTvRDT2JqDTJM
	 ez+dH4SUF3WOA==
Date: Tue, 21 May 2024 18:06:26 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [XEN PATCH] automation/eclair_analysis: add already clean rules
 to the analysis
In-Reply-To: <b54857c4bd0ac6e29042a55c0692178bb54ac307.1716319970.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2405211806190.1052252@ubuntu-linux-20-04-desktop>
References: <b54857c4bd0ac6e29042a55c0692178bb54ac307.1716319970.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 21 May 2024, Nicola Vetrini wrote:
> Some MISRA C rules already have no violations in Xen, so they can be
> set as clean.
> 
> Reorder the rules in tagging.ecl according to version ordering
> (i.e. sort -V) and split the configuration on multiple lines for
> readability.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  .../eclair_analysis/ECLAIR/monitored.ecl      | 17 ++++
>  automation/eclair_analysis/ECLAIR/tagging.ecl | 78 ++++++++++++++++++-
>  2 files changed, 94 insertions(+), 1 deletion(-)
> 
> diff --git a/automation/eclair_analysis/ECLAIR/monitored.ecl b/automation/eclair_analysis/ECLAIR/monitored.ecl
> index 9da709dc889c..4daecb0c838f 100644
> --- a/automation/eclair_analysis/ECLAIR/monitored.ecl
> +++ b/automation/eclair_analysis/ECLAIR/monitored.ecl
> @@ -79,4 +79,21 @@
>  -enable=MC3R1.R9.3
>  -enable=MC3R1.R9.4
>  -enable=MC3R1.R9.5
> +-enable=MC3R1.R18.8
> +-enable=MC3R1.R20.2
> +-enable=MC3R1.R20.3
> +-enable=MC3R1.R20.6
> +-enable=MC3R1.R20.11
> +-enable=MC3R1.R21.3
> +-enable=MC3R1.R21.4
> +-enable=MC3R1.R21.5
> +-enable=MC3R1.R21.7
> +-enable=MC3R1.R21.8
> +-enable=MC3R1.R21.12
> +-enable=MC3R1.R22.1
> +-enable=MC3R1.R22.3
> +-enable=MC3R1.R22.7
> +-enable=MC3R1.R22.8
> +-enable=MC3R1.R22.9
> +-enable=MC3R1.R22.10
>  -doc_end
> diff --git a/automation/eclair_analysis/ECLAIR/tagging.ecl b/automation/eclair_analysis/ECLAIR/tagging.ecl
> index b7a9f75b275b..a354ff322e03 100644
> --- a/automation/eclair_analysis/ECLAIR/tagging.ecl
> +++ b/automation/eclair_analysis/ECLAIR/tagging.ecl
> @@ -19,7 +19,83 @@
>  
>  -doc_begin="Clean guidelines: new violations for these guidelines are not accepted."
>  
> --service_selector={clean_guidelines_common, "MC3R1.D1.1||MC3R1.D2.1||MC3R1.D4.1||MC3R1.D4.11||MC3R1.D4.14||MC3R1.R10.2||MC3R1.R11.7||MC3R1.R11.9||MC3R1.R12.5||MC3R1.R1.1||MC3R1.R1.3||MC3R1.R1.4||MC3R1.R14.1||MC3R1.R16.7||MC3R1.R17.1||MC3R1.R17.3||MC3R1.R17.4||MC3R1.R17.5||MC3R1.R17.6||MC3R1.R20.13||MC3R1.R20.14||MC3R1.R20.4||MC3R1.R20.9||MC3R1.R21.10||MC3R1.R21.13||MC3R1.R21.19||MC3R1.R21.21||MC3R1.R21.9||MC3R1.R2.2||MC3R1.R22.2||MC3R1.R22.4||MC3R1.R22.5||MC3R1.R22.6||MC3R1.R2.6||MC3R1.R3.1||MC3R1.R3.2||MC3R1.R4.1||MC3R1.R4.2||MC3R1.R5.1||MC3R1.R5.2||MC3R1.R5.4||MC3R1.R5.6||MC3R1.R6.1||MC3R1.R6.2||MC3R1.R7.1||MC3R1.R7.2||MC3R1.R7.4||MC3R1.R8.1||MC3R1.R8.10||MC3R1.R8.12||MC3R1.R8.14||MC3R1.R8.2||MC3R1.R8.5||MC3R1.R8.6||MC3R1.R8.8||MC3R1.R9.2||MC3R1.R9.3||MC3R1.R9.4||MC3R1.R9.5"
> +-service_selector={clean_guidelines_common,
> +"MC3R1.D1.1||
> +MC3R1.D2.1||
> +MC3R1.D4.1||
> +MC3R1.D4.11||
> +MC3R1.D4.14||
> +MC3R1.R1.1||
> +MC3R1.R1.3||
> +MC3R1.R1.4||
> +MC3R1.R2.2||
> +MC3R1.R2.6||
> +MC3R1.R3.1||
> +MC3R1.R3.2||
> +MC3R1.R4.1||
> +MC3R1.R4.2||
> +MC3R1.R5.1||
> +MC3R1.R5.2||
> +MC3R1.R5.4||
> +MC3R1.R5.6||
> +MC3R1.R6.1||
> +MC3R1.R6.2||
> +MC3R1.R7.1||
> +MC3R1.R7.2||
> +MC3R1.R7.4||
> +MC3R1.R8.1||
> +MC3R1.R8.2||
> +MC3R1.R8.5||
> +MC3R1.R8.6||
> +MC3R1.R8.8||
> +MC3R1.R8.10||
> +MC3R1.R8.12||
> +MC3R1.R8.14||
> +MC3R1.R9.2||
> +MC3R1.R9.3||
> +MC3R1.R9.4||
> +MC3R1.R9.5||
> +MC3R1.R10.2||
> +MC3R1.R11.7||
> +MC3R1.R11.9||
> +MC3R1.R12.5||
> +MC3R1.R14.1||
> +MC3R1.R16.7||
> +MC3R1.R17.1||
> +MC3R1.R17.3||
> +MC3R1.R17.4||
> +MC3R1.R17.5||
> +MC3R1.R17.6||
> +MC3R1.R18.8||
> +MC3R1.R20.2||
> +MC3R1.R20.3||
> +MC3R1.R20.4||
> +MC3R1.R20.6||
> +MC3R1.R20.9||
> +MC3R1.R20.11||
> +MC3R1.R20.13||
> +MC3R1.R20.14||
> +MC3R1.R21.3||
> +MC3R1.R21.4||
> +MC3R1.R21.5||
> +MC3R1.R21.7||
> +MC3R1.R21.8||
> +MC3R1.R21.9||
> +MC3R1.R21.10||
> +MC3R1.R21.12||
> +MC3R1.R21.13||
> +MC3R1.R21.19||
> +MC3R1.R21.21||
> +MC3R1.R22.1||
> +MC3R1.R22.2||
> +MC3R1.R22.3||
> +MC3R1.R22.4||
> +MC3R1.R22.5||
> +MC3R1.R22.6||
> +MC3R1.R22.7||
> +MC3R1.R22.8||
> +MC3R1.R22.9||
> +MC3R1.R22.10"
>  }
>  
>  -setq=target,getenv("XEN_TARGET_ARCH")
> -- 
> 2.34.1
> 

