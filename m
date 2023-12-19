Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0315817F63
	for <lists+xen-devel@lfdr.de>; Tue, 19 Dec 2023 02:43:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.656467.1024646 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFP8n-0000Xo-OF; Tue, 19 Dec 2023 01:43:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 656467.1024646; Tue, 19 Dec 2023 01:43:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFP8n-0000Vu-LT; Tue, 19 Dec 2023 01:43:25 +0000
Received: by outflank-mailman (input) for mailman id 656467;
 Tue, 19 Dec 2023 01:43:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ry3N=H6=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rFP8m-0000Vo-AU
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2023 01:43:24 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fcf59113-9e0f-11ee-9b0f-b553b5be7939;
 Tue, 19 Dec 2023 02:43:21 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id C4425CE13BB;
 Tue, 19 Dec 2023 01:43:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6CBBC433C8;
 Tue, 19 Dec 2023 01:43:15 +0000 (UTC)
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
X-Inumbo-ID: fcf59113-9e0f-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702950197;
	bh=43gdyIJ4tENk0Ke/rpTkH5mqD3mQiS82ccvL663kAos=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=uuApYyjN926e9gBeDq+0OLxEMAPOpiVp2PZv44SDizqy3nzAqg2VZgUwM1XGU+hrv
	 sw5iey2ZPJERRPJ2I0uwp0d6QJGWQdbvdWmjPHCWcYtXNlK0M83uYXlqUBwOqXwIGi
	 02lXYikcishNisOY5xDF/oEAh5DF4XI2oBmqyxMO6d1/fLkwpbF4mxQFjx5UT2EF4d
	 iez2RXzZB6NIyZmLpuyugtBttfsI86oV6juK8Dzc7MSO1g7JrG1lEF7aNeytgGWWIO
	 kCfIHxUn/5je6ofBA1iWCJ53RiLpxRi8IjfKRLroSAS5kUx5zd7+P6GVfLazAqPlOl
	 jRCR8MLOABxlA==
Date: Mon, 18 Dec 2023 17:43:13 -0800 (PST)
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
Subject: Re: [XEN PATCH] docs/misra: add entries to exclude-list
In-Reply-To: <5df2a8c3c6daa0bec1b38f440fcd8fa3a380a1f6.1702900114.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2312181743050.3175268@ubuntu-linux-20-04-desktop>
References: <5df2a8c3c6daa0bec1b38f440fcd8fa3a380a1f6.1702900114.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 18 Dec 2023, Federico Serafini wrote:
> Exclude efibind.h for all the architectures: it is used to build the
> efi stub, which is a separate entry point for Xen when booted from EFI
> firmware.
> Remove redundant entries from out_of_scope.ecl.
> 
> Exclude common/coverage: it is code to support gcov, hence it is part
> of the testing machinery.
> 
> Exclude decompress.h: file ported from Linux that defines a unique and
> documented interface towards all the (adopted) decompress functions.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  .../eclair_analysis/ECLAIR/out_of_scope.ecl      |  5 -----
>  docs/misra/exclude-list.json                     | 16 ++++++++++++++++
>  2 files changed, 16 insertions(+), 5 deletions(-)
> 
> diff --git a/automation/eclair_analysis/ECLAIR/out_of_scope.ecl b/automation/eclair_analysis/ECLAIR/out_of_scope.ecl
> index fd870716cf..9bcec4c69d 100644
> --- a/automation/eclair_analysis/ECLAIR/out_of_scope.ecl
> +++ b/automation/eclair_analysis/ECLAIR/out_of_scope.ecl
> @@ -17,11 +17,6 @@
>  -file_tag+={out_of_scope,"^xen/arch/x86/include/asm/intel-family\\.h$"}
>  -doc_end
>  
> --doc_begin="Files imported from the gnu-efi package"
> --file_tag+={adopted,"^xen/include/efi/.*$"}
> --file_tag+={adopted,"^xen/arch/x86/include/asm/x86_64/efibind\\.h$"}
> --doc_end
> -
>  -doc_begin="Build tools are out of scope."
>  -file_tag+={out_of_scope_tools,"^xen/tools/.*$"}
>  -file_tag+={out_of_scope_tools,"^xen/arch/x86/efi/mkreloc\\.c$"}
> diff --git a/docs/misra/exclude-list.json b/docs/misra/exclude-list.json
> index 48f671c548..83fae0b4a4 100644
> --- a/docs/misra/exclude-list.json
> +++ b/docs/misra/exclude-list.json
> @@ -1,6 +1,10 @@
>  {
>      "version": "1.0",
>      "content": [
> +        {
> +            "rel_path": "arch/*/include/asm/*/efibind.h",
> +            "comment": "Imported from gnu-efi package, ignore for now"
> +        },
>          {
>              "rel_path": "arch/arm/arm64/cpufeature.c",
>              "comment": "Imported from Linux, ignore for now"
> @@ -97,6 +101,10 @@
>              "rel_path": "arch/x86/efi/check.c",
>              "comment": "The resulting code is not included in the final Xen binary, ignore for now"
>          },
> +        {
> +            "rel_path": "common/coverage/*",
> +            "comment": "Files to support gcov, ignore for now"
> +        },
>          {
>              "rel_path": "common/bitmap.c",
>              "comment": "Imported from Linux, ignore for now"
> @@ -213,6 +221,14 @@
>              "rel_path": "include/xen/acpi.h",
>              "comment": "Imported from Linux, ignore for now"
>          },
> +        {
> +            "rel_path": "include/efi/*",
> +            "comment": "Imported from gnu-efi package, ignore for now"
> +        },
> +        {
> +            "rel_path": "include/xen/decompress.h",
> +            "comment": "Imported from Linux, ignore for now"
> +        },
>          {
>              "rel_path": "lib/list-sort.c",
>              "comment": "Imported from Linux, ignore for now"
> -- 
> 2.34.1
> 

