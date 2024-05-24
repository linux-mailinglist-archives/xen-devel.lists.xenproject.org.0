Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD5C8CDF06
	for <lists+xen-devel@lfdr.de>; Fri, 24 May 2024 02:56:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.728966.1134052 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAJDS-0003Ly-IR; Fri, 24 May 2024 00:55:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 728966.1134052; Fri, 24 May 2024 00:55:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAJDS-0003KI-Fh; Fri, 24 May 2024 00:55:26 +0000
Received: by outflank-mailman (input) for mailman id 728966;
 Fri, 24 May 2024 00:55:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K6bJ=M3=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sAJDR-0003KC-4r
 for xen-devel@lists.xenproject.org; Fri, 24 May 2024 00:55:25 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4cf91056-1968-11ef-90a1-e314d9c70b13;
 Fri, 24 May 2024 02:55:23 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4CFAD62F8E;
 Fri, 24 May 2024 00:55:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FC41C32782;
 Fri, 24 May 2024 00:55:21 +0000 (UTC)
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
X-Inumbo-ID: 4cf91056-1968-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716512122;
	bh=6RxAEnmgcpovAf+YRLeuGIhS6hRBpuv9Njh3jcdd17E=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=c7tjwfIcB2+K2mwOUXy08JWFlEijIEXfi5phWckLpgZvpuG8n/58SzD5b0vIsUFHx
	 2ZMyot2EUK6YytgcY/FlpKd4PFFLj1X3tCEVsWPdCbeq55iAhuFpHVMLv/+p1s/t5o
	 CO1sFT0hsw/LTn5xPQu9aUPuPHlG5s7vr2xgAjCGDYSArGvTNNET8jLInFVbaXn+Is
	 XbQkf2j3Q+Hlgozzb84ao7WLmcgFWeKWI2JyfC1peHFxid+agFSpqrFcU7ratH1WpV
	 1STzY/vcNJSIdqtlm5lp294Cm9wFWMiHpP6ooJP9UOk4tUBQpxXRjzv8euoToezDMa
	 m5l9brE0qgnFw==
Date: Thu, 23 May 2024 17:55:19 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Henry Wang <xin.wang2@amd.com>
cc: xen-devel@lists.xenproject.org, Anthony PERARD <anthony@xenproject.org>, 
    Jason Andryuk <jason.andryuk@amd.com>
Subject: Re: [PATCH v4 1/9] tools/xl: Correct the help information and exit
 code of the dt-overlay command
In-Reply-To: <20240523074040.1611264-2-xin.wang2@amd.com>
Message-ID: <alpine.DEB.2.22.394.2405231755120.2557291@ubuntu-linux-20-04-desktop>
References: <20240523074040.1611264-1-xin.wang2@amd.com> <20240523074040.1611264-2-xin.wang2@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 23 May 2024, Henry Wang wrote:
> Fix the name mismatch in the xl dt-overlay command, the
> command name should be "dt-overlay" instead of "dt_overlay".
> Add the missing "," in the cmdtable.
> 
> Fix the exit code of the dt-overlay command, use EXIT_FAILURE
> instead of ERROR_FAIL.
> 
> Fixes: 61765a07e3d8 ("tools/xl: Add new xl command overlay for device tree overlay support")
> Suggested-by: Anthony PERARD <anthony@xenproject.org>
> Signed-off-by: Henry Wang <xin.wang2@amd.com>
> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> v4:
> - No change.
> v3:
> - Add Jason's Reviewed-by tag.
> v2:
> - New patch
> ---
>  tools/xl/xl_cmdtable.c  | 2 +-
>  tools/xl/xl_vmcontrol.c | 6 +++---
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/tools/xl/xl_cmdtable.c b/tools/xl/xl_cmdtable.c
> index 62bdb2aeaa..1f3c6b5897 100644
> --- a/tools/xl/xl_cmdtable.c
> +++ b/tools/xl/xl_cmdtable.c
> @@ -635,7 +635,7 @@ const struct cmd_spec cmd_table[] = {
>      { "dt-overlay",
>        &main_dt_overlay, 0, 1,
>        "Add/Remove a device tree overlay",
> -      "add/remove <.dtbo>"
> +      "add/remove <.dtbo>",
>        "-h print this help\n"
>      },
>  #endif
> diff --git a/tools/xl/xl_vmcontrol.c b/tools/xl/xl_vmcontrol.c
> index 98f6bd2e76..02575d5d36 100644
> --- a/tools/xl/xl_vmcontrol.c
> +++ b/tools/xl/xl_vmcontrol.c
> @@ -1278,7 +1278,7 @@ int main_dt_overlay(int argc, char **argv)
>      const int overlay_remove_op = 2;
>  
>      if (argc < 2) {
> -        help("dt_overlay");
> +        help("dt-overlay");
>          return EXIT_FAILURE;
>      }
>  
> @@ -1302,11 +1302,11 @@ int main_dt_overlay(int argc, char **argv)
>              fprintf(stderr, "failed to read the overlay device tree file %s\n",
>                      overlay_config_file);
>              free(overlay_dtb);
> -            return ERROR_FAIL;
> +            return EXIT_FAILURE;
>          }
>      } else {
>          fprintf(stderr, "overlay dtbo file not provided\n");
> -        return ERROR_FAIL;
> +        return EXIT_FAILURE;
>      }
>  
>      rc = libxl_dt_overlay(ctx, overlay_dtb, overlay_dtb_size, op);
> -- 
> 2.34.1
> 
> 

