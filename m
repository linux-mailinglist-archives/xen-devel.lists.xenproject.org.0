Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 605DE7FAAF2
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 21:06:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642518.1002064 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7hre-0006J8-Sw; Mon, 27 Nov 2023 20:05:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642518.1002064; Mon, 27 Nov 2023 20:05:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7hre-0006H8-Q0; Mon, 27 Nov 2023 20:05:54 +0000
Received: by outflank-mailman (input) for mailman id 642518;
 Mon, 27 Nov 2023 20:05:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j0zc=HI=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 1r7hnW-0000uA-TF
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 20:01:38 +0000
Received: from sonata.ens-lyon.org (sonata.ens-lyon.org [140.77.166.138])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c45d686c-8d5f-11ee-9b0e-b553b5be7939;
 Mon, 27 Nov 2023 21:01:35 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id 01FC720103;
 Mon, 27 Nov 2023 21:01:35 +0100 (CET)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id itFpVaeRajsE; Mon, 27 Nov 2023 21:01:34 +0100 (CET)
Received: from begin (aamiens-653-1-111-57.w83-192.abo.wanadoo.fr
 [83.192.234.57])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id DFB3F20101;
 Mon, 27 Nov 2023 21:01:34 +0100 (CET)
Received: from samy by begin with local (Exim 4.97)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1r7hnS-00000005cmZ-2ovf; Mon, 27 Nov 2023 21:01:34 +0100
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
X-Inumbo-ID: c45d686c-8d5f-11ee-9b0e-b553b5be7939
Date: Mon, 27 Nov 2023 21:01:34 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [PATCH v3 15/32] Mini-OS: add EXPORT_SYMBOL() instances to
 console.c
Message-ID: <20231127200134.sbga2c2ovi7wlcus@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20231127102523.28003-1-jgross@suse.com>
 <20231127102523.28003-16-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231127102523.28003-16-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)

Juergen Gross, le lun. 27 nov. 2023 11:25:06 +0100, a ecrit:
> Add the needed instances of EXPORT_SYMBOL() to console.c.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
> V3:
> - new patch
> ---
>  console.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/console.c b/console.c
> index 5d205c7d..0107b685 100644
> --- a/console.c
> +++ b/console.c
> @@ -125,6 +125,7 @@ void console_print(struct consfront_dev *dev, const char *data, int length)
>  
>      ring_send_fn(dev, copied_ptr, length);
>  }
> +EXPORT_SYMBOL(console_print);
>  
>  void print(int direct, const char *fmt, va_list args)
>  {
> @@ -155,6 +156,7 @@ void printk(const char *fmt, ...)
>      print(0, fmt, args);
>      va_end(args);
>  }
> +EXPORT_SYMBOL(printk);
>  
>  void xprintk(const char *fmt, ...)
>  {
> @@ -164,6 +166,8 @@ void xprintk(const char *fmt, ...)
>      print(1, fmt, args);
>      va_end(args);
>  }
> +EXPORT_SYMBOL(xprintk);
> +
>  void init_console(void)
>  {
>      printk("Initialising console ... ");
> @@ -320,6 +324,7 @@ int xencons_ring_avail(struct consfront_dev *dev)
>  
>      return prod - cons;
>  }
> +EXPORT_SYMBOL(xencons_ring_avail);
>  
>  int xencons_ring_recv(struct consfront_dev *dev, char *data, unsigned int len)
>  {
> -- 
> 2.35.3
> 

-- 
Samuel
---
Pour une évaluation indépendante, transparente et rigoureuse !
Je soutiens la Commission d'Évaluation de l'Inria.

