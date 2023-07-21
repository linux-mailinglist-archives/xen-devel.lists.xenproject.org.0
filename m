Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFCB975D7B2
	for <lists+xen-devel@lfdr.de>; Sat, 22 Jul 2023 00:53:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.567729.887168 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMz07-0003xH-GP; Fri, 21 Jul 2023 22:53:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 567729.887168; Fri, 21 Jul 2023 22:53:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMz07-0003ui-D9; Fri, 21 Jul 2023 22:53:31 +0000
Received: by outflank-mailman (input) for mailman id 567729;
 Fri, 21 Jul 2023 22:53:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BzSz=DH=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qMz05-0003uc-VC
 for xen-devel@lists.xenproject.org; Fri, 21 Jul 2023 22:53:29 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6787b137-2819-11ee-b23a-6b7b168915f2;
 Sat, 22 Jul 2023 00:53:28 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3847060DFD;
 Fri, 21 Jul 2023 22:53:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8973DC433C8;
 Fri, 21 Jul 2023 22:53:25 +0000 (UTC)
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
X-Inumbo-ID: 6787b137-2819-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689980006;
	bh=B7Zv4Q9nNIv9n7yJ5I6Nu/22QsZDMnbWe6WwC2ptEWE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=RDGd9OZBPknrv7H0hKErPqH3kIAiWdrzm2iUAqbMJ6FlSqSCS7N7Q7uqWhDFw4avA
	 NbBcoBlPoaLnjpvUMqooOwyLzonE+7axrda6GU9vJkA3EbtQAJR1d6Dt0eaaWM19WG
	 bGFyawJb87P1RUj44o665bjlofmBBaBgP2krjq1H2NaHWiH2pNMJlJSlAmzjOa5gJH
	 zcThy/94Tng/4SsDKWJo0VPHOHIUx2jobsOZLqoc1zMBg3izvoM8yZS4yMLCgkfiIX
	 JwXv/zIbjaRHVks0yhtjICnJd+2zAAzRvPM79Tm+xFJYDnEZWt/V9WjaAK4W++cw5i
	 4qAByC9A3+6GQ==
Date: Fri, 21 Jul 2023 15:53:23 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, Jan Beulich <jbeulich@suse.com>
Subject: Re: [XEN PATCH] efi: mechanical renaming to address MISRA C:2012
 Rule 5.3
In-Reply-To: <4da442b03ba783b4db0e56614bed43ce882a32ae.1689953085.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2307211552340.3118466@ubuntu-linux-20-04-desktop>
References: <4da442b03ba783b4db0e56614bed43ce882a32ae.1689953085.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 21 Jul 2023, Nicola Vetrini wrote:
> Rule 5.3 has the following headline:
> "An identifier declared in an inner scope shall not hide an
> identifier declared in an outer scope"
> 
> The function parameters renamed in this patch are hiding a variable defined
> in an enclosing scope or a function identifier.
> 
> The following rename is made:
> - s/cfg/config/
> to distinguish from the variable 'cfg', which is hidden by the parameter inside
> the modified functions.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/common/efi/boot.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
> index 24169b7b50..233639f3bc 100644
> --- a/xen/common/efi/boot.c
> +++ b/xen/common/efi/boot.c
> @@ -528,10 +528,10 @@ static char * __init split_string(char *s)
>      return NULL;
>  }
>  
> -static char *__init get_value(const struct file *cfg, const char *section,
> +static char *__init get_value(const struct file *config, const char *section,
>                                const char *item)
>  {
> -    char *ptr = cfg->str, *end = ptr + cfg->size;
> +    char *ptr = config->str, *end = ptr + config->size;
>      size_t slen = section ? strlen(section) : 0, ilen = strlen(item);
>      bool match = !slen;
>  
> @@ -821,9 +821,9 @@ static bool __init read_section(const EFI_LOADED_IMAGE *image,
>      return true;
>  }
>  
> -static void __init pre_parse(const struct file *cfg)
> +static void __init pre_parse(const struct file *config)
>  {
> -    char *ptr = cfg->str, *end = ptr + cfg->size;
> +    char *ptr = config->str, *end = ptr + config->size;
>      bool start = true, comment = false;
>  
>      for ( ; ptr < end; ++ptr )
> @@ -844,7 +844,7 @@ static void __init pre_parse(const struct file *cfg)
>          else
>              start = 0;
>      }
> -    if ( cfg->size && end[-1] )
> +    if ( config->size && end[-1] )
>           PrintStr(L"No newline at end of config file,"
>                     " last line will be ignored.\r\n");
>  }
> -- 
> 2.34.1
> 

