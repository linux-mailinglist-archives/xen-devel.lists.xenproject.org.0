Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA1E9AD81B
	for <lists+xen-devel@lfdr.de>; Thu, 24 Oct 2024 00:55:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.824933.1239138 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3kEg-0006rS-J9; Wed, 23 Oct 2024 22:53:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 824933.1239138; Wed, 23 Oct 2024 22:53:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3kEg-0006py-GD; Wed, 23 Oct 2024 22:53:50 +0000
Received: by outflank-mailman (input) for mailman id 824933;
 Wed, 23 Oct 2024 22:53:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ECK7=RT=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 1t3kEf-0006o8-EW
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2024 22:53:49 +0000
Received: from sonata.ens-lyon.org (sonata.ens-lyon.org [140.77.166.138])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a83890bd-9191-11ef-99a3-01e77a169b0f;
 Thu, 24 Oct 2024 00:53:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id BD36FA1A52;
 Thu, 24 Oct 2024 00:53:44 +0200 (CEST)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B_3LSfr9Atij; Thu, 24 Oct 2024 00:53:44 +0200 (CEST)
Received: from begin (aamiens-653-1-40-48.w83-192.abo.wanadoo.fr
 [83.192.199.48])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id 859B2A1A51;
 Thu, 24 Oct 2024 00:53:44 +0200 (CEST)
Received: from samy by begin with local (Exim 4.98)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1t3kEa-00000006Phr-0E4H; Thu, 24 Oct 2024 00:53:44 +0200
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
X-Inumbo-ID: a83890bd-9191-11ef-99a3-01e77a169b0f
Date: Thu, 24 Oct 2024 00:53:44 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org
Subject: Re: [MINI-OS PATCH] config: add support for libxenmanage
Message-ID: <Zxl-eAecD0tMvqCn@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
References: <20241023131048.32240-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241023131048.32240-1-jgross@suse.com>
Organization: I am not organized

Juergen Gross, le mer. 23 oct. 2024 15:10:48 +0200, a ecrit:
> Add CONFIG_LIBXENMANAGE support.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> Please note that this patch should be committed only after the related
> Xen patch "tools/libs: add a new libxenmanage library" has been Acked,
> as otherwise it should either be dropped (in case the approach of
> adding a new library is being rejected) or changed (in case the name
> of the new library needs to be modified)!

For the positive case,

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> 
>  Config.mk | 2 ++
>  Makefile  | 4 ++++
>  2 files changed, 6 insertions(+)
> 
> diff --git a/Config.mk b/Config.mk
> index f59a0cf4..e493533a 100644
> --- a/Config.mk
> +++ b/Config.mk
> @@ -46,6 +46,7 @@ GNTTAB_PATH ?= $(XEN_ROOT)/stubdom/libs-$(MINIOS_TARGET_ARCH)/gnttab
>  CALL_PATH ?= $(XEN_ROOT)/stubdom/libs-$(MINIOS_TARGET_ARCH)/call
>  FOREIGNMEMORY_PATH ?= $(XEN_ROOT)/stubdom/libs-$(MINIOS_TARGET_ARCH)/foreignmemory
>  DEVICEMODEL_PATH ?= $(XEN_ROOT)/stubdom/libs-$(MINIOS_TARGET_ARCH)/devicemodel
> +MANAGE_PATH ?= $(XEN_ROOT)/stubdom/libs-$(MINIOS_TARGET_ARCH)/manage
>  CTRL_PATH ?= $(XEN_ROOT)/stubdom/libxc-$(MINIOS_TARGET_ARCH)
>  GUEST_PATH ?= $(XEN_ROOT)/stubdom/libxc-$(MINIOS_TARGET_ARCH)
>  else
> @@ -202,6 +203,7 @@ CONFIG-n += CONFIG_LIBXENGNTTAB
>  CONFIG-n += CONFIG_LIBXENGUEST
>  CONFIG-n += CONFIG_LIBXENTOOLCORE
>  CONFIG-n += CONFIG_LIBXENTOOLLOG
> +CONFIG-n += CONFIG_LIBXENMANAGE
>  # Setting CONFIG_USE_XEN_CONSOLE copies all print output to the Xen emergency
>  # console apart of standard dom0 handled console.
>  CONFIG-n += CONFIG_USE_XEN_CONSOLE
> diff --git a/Makefile b/Makefile
> index ffa8d1a8..d094858a 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -159,6 +159,10 @@ ifeq ($(CONFIG_LIBXENCTRL),y)
>  APP_LDLIBS += -L$(CTRL_PATH) -whole-archive -lxenctrl -no-whole-archive
>  LIBS += $(CTRL_PATH)/libxenctrl.a
>  endif
> +ifeq ($(CONFIG_LIBXENMANAGE),y)
> +APP_LDLIBS += -L$(MANAGE_PATH) -whole-archive -lxenmanage -no-whole-archive
> +LIBS += $(MANAGE_PATH)/libxenmanage.a
> +endif
>  APP_LDLIBS += -lpci
>  APP_LDLIBS += -lz
>  APP_LDLIBS += -lm
> -- 
> 2.43.0
> 

-- 
Samuel
 tohi.cybercable.fr (212.198.0.3) si une personne se reconnait derriere
 cette adresse que ce soit un pirate ou une victime qu'il se manifeste,
 cette personne pourrait bien etre un petit malin
 -+- Fred in NPC : Mamaaaaan, y a le routeur qui veut me hacker -+-

