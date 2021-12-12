Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4D30471763
	for <lists+xen-devel@lfdr.de>; Sun, 12 Dec 2021 01:27:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.245515.423628 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mwCiK-0005Yc-1h; Sun, 12 Dec 2021 00:27:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 245515.423628; Sun, 12 Dec 2021 00:27:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mwCiJ-0005VW-Ua; Sun, 12 Dec 2021 00:27:39 +0000
Received: by outflank-mailman (input) for mailman id 245515;
 Sun, 12 Dec 2021 00:27:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=afVz=Q5=ens-lyon.org=samuel.thibault@srs-se1.protection.inumbo.net>)
 id 1mwCiI-0005T8-KS
 for xen-devel@lists.xenproject.org; Sun, 12 Dec 2021 00:27:38 +0000
Received: from hera.aquilenet.fr (hera.aquilenet.fr [185.233.100.1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4e6d91c2-5ae2-11ec-a74f-db008197e53d;
 Sun, 12 Dec 2021 01:27:36 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id 79F633C1;
 Sun, 12 Dec 2021 01:27:36 +0100 (CET)
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wf_uaIP3FA89; Sun, 12 Dec 2021 01:27:36 +0100 (CET)
Received: from begin (unknown [IPv6:2a01:cb19:956:1b00:de41:a9ff:fe47:ec49])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id A8A9828B;
 Sun, 12 Dec 2021 01:27:35 +0100 (CET)
Received: from samy by begin with local (Exim 4.95)
 (envelope-from <samuel.thibault@ens-lyon.org>) id 1mwCiF-0024v2-1q;
 Sun, 12 Dec 2021 01:27:35 +0100
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
X-Inumbo-ID: 4e6d91c2-5ae2-11ec-a74f-db008197e53d
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Date: Sun, 12 Dec 2021 01:27:35 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [PATCH 05/10] mini-os: don't repeat definition available via
 header file
Message-ID: <20211212002735.um4q6patid5sdhvs@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20211206072337.9517-1-jgross@suse.com>
 <20211206072337.9517-6-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211206072337.9517-6-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-Spamd-Bar: /
Authentication-Results: hera.aquilenet.fr;
	none
X-Rspamd-Server: hera
X-Rspamd-Queue-Id: 79F633C1
X-Spamd-Result: default: False [0.40 / 15.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[4];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 HAS_ORG_HEADER(0.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_LAST(0.00)[];
	 MID_RHS_NOT_FQDN(0.50)[]

Juergen Gross, le lun. 06 déc. 2021 08:23:32 +0100, a ecrit:
> arch/x86/setup.c is repeating the definition of __pte() instead using
> the appropriate header. Fix that.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
>  arch/x86/setup.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/arch/x86/setup.c b/arch/x86/setup.c
> index 1ec68d3..b27bbed 100644
> --- a/arch/x86/setup.c
> +++ b/arch/x86/setup.c
> @@ -29,6 +29,7 @@
>  #include <mini-os/os.h>
>  #include <mini-os/lib.h> /* for printk, memcpy */
>  #include <mini-os/kernel.h>
> +#include <mini-os/hypervisor.h>
>  #include <xen/xen.h>
>  #include <xen/arch-x86/cpuid.h>
>  #include <xen/arch-x86/hvm/start_info.h>
> @@ -61,13 +62,6 @@ char stack[2*STACK_SIZE];
>  
>  extern char shared_info[PAGE_SIZE];
>  
> -#if defined(__x86_64__)
> -#define __pte(x) ((pte_t) { (x) } )
> -#else
> -#define __pte(x) ({ unsigned long long _x = (x);        \
> -    ((pte_t) {(unsigned long)(_x), (unsigned long)(_x>>32)}); })
> -#endif
> -
>  static inline void fpu_init(void) {
>  	asm volatile("fninit");
>  }
> -- 
> 2.26.2
> 

-- 
Samuel
 jr> J'ai fait.
 Ne bougez pas, l'aide soignante va venir nettoyer.
 -+- FF in GNU - Le vieil homme et la merde -+-

