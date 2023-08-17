Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1804977FD59
	for <lists+xen-devel@lfdr.de>; Thu, 17 Aug 2023 19:56:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.585552.916727 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWhEE-0006Ly-Ox; Thu, 17 Aug 2023 17:56:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 585552.916727; Thu, 17 Aug 2023 17:56:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWhEE-0006JT-M5; Thu, 17 Aug 2023 17:56:14 +0000
Received: by outflank-mailman (input) for mailman id 585552;
 Thu, 17 Aug 2023 17:56:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C1L6=EC=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qWhED-0006JI-0w
 for xen-devel@lists.xenproject.org; Thu, 17 Aug 2023 17:56:13 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 57397f5c-3d27-11ee-877d-cb3800f73035;
 Thu, 17 Aug 2023 19:56:08 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D04C36261C;
 Thu, 17 Aug 2023 17:56:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04915C433C8;
 Thu, 17 Aug 2023 17:56:04 +0000 (UTC)
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
X-Inumbo-ID: 57397f5c-3d27-11ee-877d-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692294966;
	bh=8pPsKjWrw2M5j2gWS8jQb1zqcGnZPgQHzlyvyCWIDLQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=B5uqvWwD1is7B0s8lmisHxUwgjmeEcPB9e1KDgjkXu92shrUjO+QbAPb7QpjVd36V
	 3StAoy79B5gEIIU1GKFx13pUPhUOmF7bWsG7yHRk45jB6vWaxylcKD/kClLc+aNAbE
	 0nI8qWrc62C8WRLQ/gvNrh2pVqQWypW9IVIsZqdVoMvPjkGsZZyOdexF6+NkBl2nwc
	 orPscdcsA74NkNdi5i+lDkAGqjn74Dy6Rki3Ksil6nmUWSfe+LwDRADGJlZMfWaxfO
	 ZYg+clTPPTeoRJ23ZPltjKFRdABHcaWwvW30pKeOQsy8xW777I+pjCgs6HTT+vHgTO
	 CUfqaYT/CfGYA==
Date: Thu, 17 Aug 2023 10:56:03 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH v2] misra: add more entires to exclude-list.json
In-Reply-To: <186af44774dc4670cb1ca0d8238e0620c3d0fc2f.1692266054.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2308171055570.6458@ubuntu-linux-20-04-desktop>
References: <186af44774dc4670cb1ca0d8238e0620c3d0fc2f.1692266054.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 17 Aug 2023, Federico Serafini wrote:
> Add entries to the exclude-list.json for those files that need to be
> excluded from the analysis scan.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Changes in v2:
> - fixed indentation.
> ---
>  docs/misra/exclude-list.json | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/docs/misra/exclude-list.json b/docs/misra/exclude-list.json
> index ca1e2dd678..575ed22a7f 100644
> --- a/docs/misra/exclude-list.json
> +++ b/docs/misra/exclude-list.json
> @@ -181,6 +181,18 @@
>              "rel_path": "drivers/video/font_*",
>              "comment": "Imported from Linux, ignore for now"
>          },
> +        {
> +            "rel_path": "include/acpi/acpiosxf.h",
> +            "comment": "Imported from Linux, ignore for now"
> +        },
> +        {
> +            "rel_path": "include/acpi/acpixf.h",
> +            "comment": "Imported from Linux, ignore for now"
> +        },
> +        {
> +            "rel_path": "include/xen/acpi.h",
> +            "comment": "Imported from Linux, ignore for now"
> +        },
>          {
>              "rel_path": "lib/list-sort.c",
>              "comment": "Imported from Linux, ignore for now"
> -- 
> 2.34.1
> 

