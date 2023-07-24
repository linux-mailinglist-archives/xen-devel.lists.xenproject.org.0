Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D16760266
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jul 2023 00:35:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569257.889639 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qO48f-0002dr-5K; Mon, 24 Jul 2023 22:34:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569257.889639; Mon, 24 Jul 2023 22:34:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qO48f-0002an-2Z; Mon, 24 Jul 2023 22:34:49 +0000
Received: by outflank-mailman (input) for mailman id 569257;
 Mon, 24 Jul 2023 22:34:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AJiQ=DK=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qO48e-0002ah-1s
 for xen-devel@lists.xenproject.org; Mon, 24 Jul 2023 22:34:48 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4a5521ec-2a72-11ee-b23c-6b7b168915f2;
 Tue, 25 Jul 2023 00:34:46 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4CDC961448;
 Mon, 24 Jul 2023 22:34:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90B39C433C7;
 Mon, 24 Jul 2023 22:34:43 +0000 (UTC)
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
X-Inumbo-ID: 4a5521ec-2a72-11ee-b23c-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690238084;
	bh=7hit+tpHXPWv3dF1PQui/U29Bek1sYAJeFvTFP3tAjE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ZGcVIGI/IE5Vn1Y3bXpUn7KcR8VzsGTq8+52I+7WM8cU2d1ACf/zJT6fh5ysdlIZU
	 7HjcUpSyjpt87o0j9NX534Y1AiJ6ksp5ZVkqKv2Mklsdxesu2cRcOyhR0wX+5AUTYV
	 9ocQPkbW1AMI44P/VV5Df3ADh6kY5ulSSvojJnxAfV7cxwfK0c8OLFnXta83puyZ7g
	 gGtYPNq+p3QJ/Zrh2FO6TywnqbE/zmWLndlFmekEl2jInssBNX8xGe4QW7mbXRByyB
	 T1ekoIsHWssecIl3gh9XjzPFN8c2/8XBNHYIbjZGxrN48Rcu+k0dTQ1AGZFIpINuyH
	 Eq2R+kpMblGgQ==
Date: Mon, 24 Jul 2023 15:34:42 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, Jan Beulich <jbeulich@suse.com>
Subject: Re: [XEN PATCH v2] efi: mechanical renaming to address MISRA C:2012
 Rule 5.3
In-Reply-To: <60e2908f5a6c8aec082b59b44a688c260805c7b2.1690208527.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2307241534350.3118466@ubuntu-linux-20-04-desktop>
References: <60e2908f5a6c8aec082b59b44a688c260805c7b2.1690208527.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 24 Jul 2023, Nicola Vetrini wrote:
> Rule 5.3 has the following headline:
> "An identifier declared in an inner scope shall not hide an
> identifier declared in an outer scope"
> 
> The function parameters renamed in this patch are hiding a variable defined
> in an enclosing scope.
> 
> The following rename is made:
> - s/cfg/file/
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
> index 24169b7b50..79a654af69 100644
> --- a/xen/common/efi/boot.c
> +++ b/xen/common/efi/boot.c
> @@ -528,10 +528,10 @@ static char * __init split_string(char *s)
>      return NULL;
>  }
>  
> -static char *__init get_value(const struct file *cfg, const char *section,
> +static char *__init get_value(const struct file *file, const char *section,
>                                const char *item)
>  {
> -    char *ptr = cfg->str, *end = ptr + cfg->size;
> +    char *ptr = file->str, *end = ptr + file->size;
>      size_t slen = section ? strlen(section) : 0, ilen = strlen(item);
>      bool match = !slen;
>  
> @@ -821,9 +821,9 @@ static bool __init read_section(const EFI_LOADED_IMAGE *image,
>      return true;
>  }
>  
> -static void __init pre_parse(const struct file *cfg)
> +static void __init pre_parse(const struct file *file)
>  {
> -    char *ptr = cfg->str, *end = ptr + cfg->size;
> +    char *ptr = file->str, *end = ptr + file->size;
>      bool start = true, comment = false;
>  
>      for ( ; ptr < end; ++ptr )
> @@ -844,7 +844,7 @@ static void __init pre_parse(const struct file *cfg)
>          else
>              start = 0;
>      }
> -    if ( cfg->size && end[-1] )
> +    if ( file->size && end[-1] )
>           PrintStr(L"No newline at end of config file,"
>                     " last line will be ignored.\r\n");
>  }
> -- 
> 2.34.1
> 

