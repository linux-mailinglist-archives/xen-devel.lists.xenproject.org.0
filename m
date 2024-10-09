Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 115EE99717E
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2024 18:30:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.814948.1228665 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syZZw-0002N0-2d; Wed, 09 Oct 2024 16:30:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 814948.1228665; Wed, 09 Oct 2024 16:30:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syZZv-0002KC-Vf; Wed, 09 Oct 2024 16:30:23 +0000
Received: by outflank-mailman (input) for mailman id 814948;
 Wed, 09 Oct 2024 16:30:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=y4i3=RF=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 1syZZu-0001AZ-AU
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2024 16:30:22 +0000
Received: from sonata.ens-lyon.org (sonata.ens-lyon.org [140.77.166.138])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c4f46fa5-865b-11ef-99a2-01e77a169b0f;
 Wed, 09 Oct 2024 18:30:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id 70FD7A0595;
 Wed,  9 Oct 2024 18:30:17 +0200 (CEST)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uUqGEs3WcOxP; Wed,  9 Oct 2024 18:30:17 +0200 (CEST)
Received: from begin (nat-inria-interne-52-gw-01-bso.bordeaux.inria.fr
 [194.199.1.52])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id 54DA3A0541;
 Wed,  9 Oct 2024 18:30:17 +0200 (CEST)
Received: from samy by begin with local (Exim 4.98)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1syZZo-00000005i7e-3ylk; Wed, 09 Oct 2024 18:30:16 +0200
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
X-Inumbo-ID: c4f46fa5-865b-11ef-99a2-01e77a169b0f
Date: Wed, 9 Oct 2024 18:30:16 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org
Subject: Re: [MINI-OS PATCH v2] add config support for each Xen library
Message-ID: <ZwavmE6v_49SLGaq@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
References: <20241009140554.1084-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241009140554.1084-1-jgross@suse.com>
Organization: I am not organized

Juergen Gross, le mer. 09 oct. 2024 16:05:54 +0200, a ecrit:
> Instead of adding all or no Xen library (controlled by CONFIG_XC),
> support a dedicated config option for each library instead,
> defaulting to disabled.
> 
> As it is no longer needed now, drop the CONFIG_XC support.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
> V2:
> - merge patches of the V1 series (Samuel Thibault)
> 
> Note: do not apply to the tree until the related Xen series
> "stubdom: prepare more fine grained Xen library usage" has been
> applied.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>  Config.mk | 11 +++++++++--
>  Makefile  | 18 +++++++++++++++++-
>  2 files changed, 26 insertions(+), 3 deletions(-)
> 
> diff --git a/Config.mk b/Config.mk
> index f2d1f0ae..f59a0cf4 100644
> --- a/Config.mk
> +++ b/Config.mk
> @@ -193,6 +193,15 @@ CONFIG-n += CONFIG_9PFRONT
>  CONFIG-n += CONFIG_TPM_TIS
>  CONFIG-n += CONFIG_TPMBACK
>  CONFIG-n += CONFIG_BALLOON
> +CONFIG-n += CONFIG_LIBXENCALL
> +CONFIG-n += CONFIG_LIBXENCTRL
> +CONFIG-n += CONFIG_LIBXENDEVICEMODEL
> +CONFIG-n += CONFIG_LIBXENEVTCHN
> +CONFIG-n += CONFIG_LIBXENFOREIGNMEMORY
> +CONFIG-n += CONFIG_LIBXENGNTTAB
> +CONFIG-n += CONFIG_LIBXENGUEST
> +CONFIG-n += CONFIG_LIBXENTOOLCORE
> +CONFIG-n += CONFIG_LIBXENTOOLLOG
>  # Setting CONFIG_USE_XEN_CONSOLE copies all print output to the Xen emergency
>  # console apart of standard dom0 handled console.
>  CONFIG-n += CONFIG_USE_XEN_CONSOLE
> @@ -201,8 +210,6 @@ CONFIG-y += CONFIG_PARAVIRT
>  else
>  CONFIG-n += CONFIG_PARAVIRT
>  endif
> -# Support legacy CONFIG_XC value
> -CONFIG_XC ?= $(libc)
>  
>  CONFIG-$(lwip) += CONFIG_LWIP
>  
> diff --git a/Makefile b/Makefile
> index 6c8df8b5..ffa8d1a8 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -123,23 +123,39 @@ endif
>  OBJS := $(filter-out $(OBJ_DIR)/lwip%.o $(LWO), $(OBJS))
>  
>  ifeq ($(libc),y)
> -ifeq ($(CONFIG_XC),y)
> +ifeq ($(CONFIG_LIBXENTOOLCORE),y)
>  APP_LDLIBS += -L$(TOOLCORE_PATH) -whole-archive -lxentoolcore -no-whole-archive
>  LIBS += $(TOOLCORE_PATH)/libxentoolcore.a
> +endif
> +ifeq ($(CONFIG_LIBXENTOOLLOG),y)
>  APP_LDLIBS += -L$(TOOLLOG_PATH) -whole-archive -lxentoollog -no-whole-archive
>  LIBS += $(TOOLLOG_PATH)/libxentoollog.a
> +endif
> +ifeq ($(CONFIG_LIBXENEVTCHN),y)
>  APP_LDLIBS += -L$(EVTCHN_PATH) -whole-archive -lxenevtchn -no-whole-archive
>  LIBS += $(EVTCHN_PATH)/libxenevtchn.a
> +endif
> +ifeq ($(CONFIG_LIBXENGNTTAB),y)
>  APP_LDLIBS += -L$(GNTTAB_PATH) -whole-archive -lxengnttab -no-whole-archive
>  LIBS += $(GNTTAB_PATH)/libxengnttab.a
> +endif
> +ifeq ($(CONFIG_LIBXENCALL),y)
>  APP_LDLIBS += -L$(CALL_PATH) -whole-archive -lxencall -no-whole-archive
>  LIBS += $(CALL_PATH)/libxencall.a
> +endif
> +ifeq ($(CONFIG_LIBXENFOREIGNMEMORY),y)
>  APP_LDLIBS += -L$(FOREIGNMEMORY_PATH) -whole-archive -lxenforeignmemory -no-whole-archive
>  LIBS += $(FOREIGNMEMORY_PATH)/libxenforeignmemory.a
> +endif
> +ifeq ($(CONFIG_LIBXENDEVICEMODEL),y)
>  APP_LDLIBS += -L$(DEVICEMODEL_PATH) -whole-archive -lxendevicemodel -no-whole-archive
>  LIBS += $(DEVICEMODEL_PATH)/libxendevicemodel.a
> +endif
> +ifeq ($(CONFIG_LIBXENGUEST),y)
>  APP_LDLIBS += -L$(GUEST_PATH) -whole-archive -lxenguest -no-whole-archive
>  LIBS += $(GUEST_PATH)/libxenguest.a
> +endif
> +ifeq ($(CONFIG_LIBXENCTRL),y)
>  APP_LDLIBS += -L$(CTRL_PATH) -whole-archive -lxenctrl -no-whole-archive
>  LIBS += $(CTRL_PATH)/libxenctrl.a
>  endif
> -- 
> 2.43.0
> 

-- 
Samuel
<N> un driver qui fait quoi, alors ?
<y> ben pour les bips
<s> pour passer les oops en morse
 -+- #ens-mim - vive les rapports de bug -+-
<s> je la connaissais pas celle la : "make: Entering an unknown directory"
 -+- #ens-mim -+-

