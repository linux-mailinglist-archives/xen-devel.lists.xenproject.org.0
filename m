Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E177FAAF6
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 21:06:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642524.1002079 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7hrv-0006yX-GC; Mon, 27 Nov 2023 20:06:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642524.1002079; Mon, 27 Nov 2023 20:06:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7hrv-0006uv-7D; Mon, 27 Nov 2023 20:06:11 +0000
Received: by outflank-mailman (input) for mailman id 642524;
 Mon, 27 Nov 2023 20:06:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j0zc=HI=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 1r7hnN-0000uA-M6
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 20:01:29 +0000
Received: from sonata.ens-lyon.org (sonata.ens-lyon.org [140.77.166.138])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bf2c84bb-8d5f-11ee-9b0e-b553b5be7939;
 Mon, 27 Nov 2023 21:01:26 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id 4944520103;
 Mon, 27 Nov 2023 21:01:26 +0100 (CET)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WJKEbp4yhnCX; Mon, 27 Nov 2023 21:01:26 +0100 (CET)
Received: from begin (aamiens-653-1-111-57.w83-192.abo.wanadoo.fr
 [83.192.234.57])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id 3008C20101;
 Mon, 27 Nov 2023 21:01:26 +0100 (CET)
Received: from samy by begin with local (Exim 4.97)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1r7hnJ-00000005cmG-3xbj; Mon, 27 Nov 2023 21:01:25 +0100
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
X-Inumbo-ID: bf2c84bb-8d5f-11ee-9b0e-b553b5be7939
Date: Mon, 27 Nov 2023 21:01:25 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [PATCH v3 14/32] Mini-OS: add EXPORT_SYMBOL() instances to main.c
Message-ID: <20231127200125.bnwst2mvxqg6642h@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20231127102523.28003-1-jgross@suse.com>
 <20231127102523.28003-15-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231127102523.28003-15-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)

Juergen Gross, le lun. 27 nov. 2023 11:25:05 +0100, a ecrit:
> Add the needed instances of EXPORT_SYMBOL() to main.c.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
> V3:
> - new patch
> ---
>  main.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/main.c b/main.c
> index a93bc9d6..c5c1c420 100644
> --- a/main.c
> +++ b/main.c
> @@ -38,10 +38,12 @@ int main(int argc, char *argv[], char *envp[])
>  void _init(void)
>  {
>  }
> +EXPORT_SYMBOL(_init);
>  
>  void _fini(void)
>  {
>  }
> +EXPORT_SYMBOL(_fini);
>  
>  extern char __app_bss_start, __app_bss_end;
>  static void call_main(void *p)
> @@ -189,6 +191,7 @@ void _exit(int ret)
>      }
>      do_exit();
>  }
> +EXPORT_SYMBOL(_exit);
>  
>  int app_main(void *p)
>  {
> -- 
> 2.35.3
> 

-- 
Samuel
---
Pour une évaluation indépendante, transparente et rigoureuse !
Je soutiens la Commission d'Évaluation de l'Inria.

