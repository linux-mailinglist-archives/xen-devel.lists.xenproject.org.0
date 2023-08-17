Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1342277FD56
	for <lists+xen-devel@lfdr.de>; Thu, 17 Aug 2023 19:56:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.585548.916718 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWhDW-0005qU-Gu; Thu, 17 Aug 2023 17:55:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 585548.916718; Thu, 17 Aug 2023 17:55:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWhDW-0005oU-Do; Thu, 17 Aug 2023 17:55:30 +0000
Received: by outflank-mailman (input) for mailman id 585548;
 Thu, 17 Aug 2023 17:55:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C1L6=EC=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qWhDU-0005oO-Qx
 for xen-devel@lists.xenproject.org; Thu, 17 Aug 2023 17:55:29 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3e1fead2-3d27-11ee-9b0c-b553b5be7939;
 Thu, 17 Aug 2023 19:55:25 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 572BC60C52;
 Thu, 17 Aug 2023 17:55:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEC8BC433C8;
 Thu, 17 Aug 2023 17:55:22 +0000 (UTC)
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
X-Inumbo-ID: 3e1fead2-3d27-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692294923;
	bh=zxE7PaU0ZF8DJY1lPzNxRklNqXSPCSGNrnd+soReVVc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ihUQgYZGp84c7lyIL+tSpn/RNrYB6ZHwKcIeZQJn19WQZ+WbcZvpjVw7eu7TeV8Ed
	 Y82BPNqLpocBY81V029VUNo1gokkj+gC3ay3+XtSt8KPjp/U1Uy1fO17PbZiIOn+L1
	 i4ts/aiKHrWuMyqkMHi8wFwIcCna7X9HES03OlmV58AnkzwdoYllqKExDru6s3chyu
	 8sjBzv+9eKmkkzNuUHV9rjd1gTTIjOUsWXDK8a3i55nbnNLLWTev8uxbNuqcPTE8Hk
	 ocDQPAzi4Dg9/1LlOOEHqxrTmLljk4rWAFHeqtxL2tjdFlCA0lrmXBX/QrF20isaIe
	 o1FPecy0lDF4Q==
Date: Thu, 17 Aug 2023 10:55:21 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Simone Ballarin <simone.ballarin@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH 1/2] automation/eclair: update configuration
In-Reply-To: <577236484d748d2941f6fc07b7e4fc3fa7501e95.1692261955.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2308171054420.6458@ubuntu-linux-20-04-desktop>
References: <cover.1692261955.git.federico.serafini@bugseng.com> <577236484d748d2941f6fc07b7e4fc3fa7501e95.1692261955.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 17 Aug 2023, Federico Serafini wrote:
> Mark more files as "adopted" and configure Rule 8.3 in order to:
> - exclude violations involving the type ret_t;
> - exclude violations involving both an internal and an external file,
>   thus avoiding touching adopted code.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>



> ---
>  .../eclair_analysis/ECLAIR/deviations.ecl     | 29 +++++++++++++++++++
>  .../eclair_analysis/ECLAIR/out_of_scope.ecl   |  3 ++
>  2 files changed, 32 insertions(+)
> 
> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
> index 696618b59e..d8170106b4 100644
> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> @@ -175,6 +175,35 @@ const-qualified."
>  -config=MC3R1.R8.2,reports+={deliberate,"any_area(any_loc(file(adopted_r8_2)))"}
>  -doc_end
>  
> +-doc_begin="The type ret_t is deliberately used and defined as int or long depending on the architecture."
> +-config=MC3R1.R8.3,reports+={deliberate,"any_area(any_loc(text(^.*ret_t.*$)))"}
> +-doc_end
> +
> +-doc_begin="The following files are imported from Linux and decompress.h defines a unique and documented interface towards all the (adopted) decompress functions."
> +-file_tag+={adopted_decompress_r8_3,"^xen/common/bunzip2\\.c$"}
> +-file_tag+={adopted_decompress_r8_3,"^xen/common/unlz4\\.c$"}
> +-file_tag+={adopted_decompress_r8_3,"^xen/common/unlzma\\.c$"}
> +-file_tag+={adopted_decompress_r8_3,"^xen/common/unlzo\\.c$"}
> +-file_tag+={adopted_decompress_r8_3,"^xen/common/unxz\\.c$"}
> +-file_tag+={adopted_decompress_r8_3,"^xen/common/unzstd\\.c$"}
> +-config=MC3R1.R8.3,reports+={deliberate,"any_area(any_loc(file(adopted_decompress_r8_3)))&&any_area(any_loc(file(^xen/include/xen/decompress\\.h$)))"}
> +-doc_end
> +
> +-doc_begin="The following file is imported from Linux: ignore for now."
> +-file_tag+={adopted_time_r8_3,"^xen/arch/x86/time\\.c$"}
> +-config=MC3R1.R8.3,reports+={deliberate,"any_area(any_loc(file(adopted_time_r8_3)))&&(any_area(any_loc(file(^xen/include/xen/time\\.h$)))||any_area(any_loc(file(^xen/arch/x86/include/asm/setup\\.h$))))"}
> +-doc_end
> +
> +-doc_begin="The following file is imported from Linux: ignore for now."
> +-file_tag+={adopted_cpu_idle_r8_3,"^xen/arch/x86/acpi/cpu_idle\\.c$"}
> +-config=MC3R1.R8.3,reports+={deliberate,"any_area(any_loc(file(adopted_cpu_idle_r8_3)))&&any_area(any_loc(file(^xen/include/xen/pmstat\\.h$)))"}
> +-doc_end
> +
> +-doc_begin="The following file is imported from Linux: ignore for now."
> +-file_tag+={adopted_mpparse_r8_3,"^xen/arch/x86/mpparse\\.c$"}
> +-config=MC3R1.R8.3,reports+={deliberate,"any_area(any_loc(file(adopted_mpparse_r8_3)))&&any_area(any_loc(file(^xen/arch/x86/include/asm/mpspec\\.h$)))"}
> +-doc_end
> +
>  -doc_begin="The following variables are compiled in multiple translation units
>  belonging to different executables and therefore are safe."
>  -config=MC3R1.R8.6,declarations+={safe, "name(current_stack_pointer||bsearch||sort)"}
> diff --git a/automation/eclair_analysis/ECLAIR/out_of_scope.ecl b/automation/eclair_analysis/ECLAIR/out_of_scope.ecl
> index 44db6997b5..e1ec4a607c 100644
> --- a/automation/eclair_analysis/ECLAIR/out_of_scope.ecl
> +++ b/automation/eclair_analysis/ECLAIR/out_of_scope.ecl
> @@ -22,6 +22,9 @@
>  -file_tag+={adopted,"^xen/drivers/acpi/numa\\.c$"}
>  -file_tag+={adopted,"^xen/drivers/acpi/osl\\.c$"}
>  -file_tag+={adopted,"^xen/drivers/acpi/tables\\.c$"}
> +-file_tag+={adopted,"^xen/include/xen/acpi\\.h$"}
> +-file_tag+={adopted,"^xen/include/acpi/acpiosxf\\.h$"}
> +-file_tag+={adopted,"^xen/include/acpi/acpixf\\.h$"}
>  -file_tag+={adopted,"^xen/lib/list-sort\\.c$"}
>  -file_tag+={adopted,"^xen/lib/rbtree\\.c$"}
>  -file_tag+={adopted,"^xen/lib/xxhash.*\\.c$"}
> -- 
> 2.34.1
> 

