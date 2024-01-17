Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D484C830A10
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jan 2024 16:53:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.668529.1040786 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQ8EG-0004E5-If; Wed, 17 Jan 2024 15:53:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 668529.1040786; Wed, 17 Jan 2024 15:53:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQ8EG-0004Bh-Fe; Wed, 17 Jan 2024 15:53:24 +0000
Received: by outflank-mailman (input) for mailman id 668529;
 Wed, 17 Jan 2024 15:53:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X6bF=I3=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 1rQ8EF-0004BD-0S
 for xen-devel@lists.xenproject.org; Wed, 17 Jan 2024 15:53:23 +0000
Received: from sonata.ens-lyon.org (domu-toccata.ens-lyon.fr [140.77.166.138])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 89900669-b550-11ee-98f2-6d05b1d4d9a1;
 Wed, 17 Jan 2024 16:53:21 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id 446ECA0117;
 Wed, 17 Jan 2024 16:53:20 +0100 (CET)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2V8Nr7vA-AnU; Wed, 17 Jan 2024 16:53:20 +0100 (CET)
Received: from begin (nat-inria-interne-52-gw-01-bso.bordeaux.inria.fr
 [194.199.1.52])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id E72D0A0314;
 Wed, 17 Jan 2024 16:53:19 +0100 (CET)
Received: from samy by begin with local (Exim 4.97)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1rQ8EB-0000000A9hV-10on; Wed, 17 Jan 2024 16:53:19 +0100
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
X-Inumbo-ID: 89900669-b550-11ee-98f2-6d05b1d4d9a1
Date: Wed, 17 Jan 2024 16:53:19 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	Juergen Gross <jgross@suse.com>
Subject: Re: [MINIOS PATCH] x86/mm: add EXPORT_SYMBOL() for `pt_base`
Message-ID: <20240117155319.kyn4fm6jd3neo7d2@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	Juergen Gross <jgross@suse.com>
References: <20240117153745.29515-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240117153745.29515-1-anthony.perard@citrix.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)

Anthony PERARD, le mer. 17 janv. 2024 15:37:45 +0000, a ecrit:
> Without this, building "ioemu-stubdom" fails on Debian Buster or
> Bookworm, with:
> 
> /home/osstest/build.184372.build-amd64/xen/stubdom/mini-os-x86_64-ioemu/mini-os.o: in function `xenfb_pv_display_init':
> ungetc.c:(.text+0x43533): undefined reference to `pt_base'
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
>  arch/x86/mm.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/x86/mm.c b/arch/x86/mm.c
> index 767a5f0..be1cf0c 100644
> --- a/arch/x86/mm.c
> +++ b/arch/x86/mm.c
> @@ -57,6 +57,7 @@
>  unsigned long *phys_to_machine_mapping;
>  unsigned long mfn_zero;
>  pgentry_t *pt_base;
> +EXPORT_SYMBOL(pt_base);
>  static unsigned long first_free_pfn;
>  static unsigned long last_free_pfn;
>  static unsigned long virt_kernel_area_end = VIRT_KERNEL_AREA;
> -- 
> Anthony PERARD

