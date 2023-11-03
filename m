Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ABB07DFDC7
	for <lists+xen-devel@lfdr.de>; Fri,  3 Nov 2023 02:40:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.627033.977879 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyj91-0004uX-5K; Fri, 03 Nov 2023 01:38:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 627033.977879; Fri, 03 Nov 2023 01:38:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyj91-0004sZ-1o; Fri, 03 Nov 2023 01:38:43 +0000
Received: by outflank-mailman (input) for mailman id 627033;
 Fri, 03 Nov 2023 01:38:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ed2V=GQ=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 1qyj8z-0004s4-QY
 for xen-devel@lists.xenproject.org; Fri, 03 Nov 2023 01:38:41 +0000
Received: from sonata.ens-lyon.org (domu-toccata.ens-lyon.fr [140.77.166.138])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b49ca1c4-79e9-11ee-9b0e-b553b5be7939;
 Fri, 03 Nov 2023 02:38:38 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id AB19D2014F;
 Fri,  3 Nov 2023 02:38:35 +0100 (CET)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IkvMV_u2jOa6; Fri,  3 Nov 2023 02:38:35 +0100 (CET)
Received: from begin.home (aamiens-653-1-111-57.w83-192.abo.wanadoo.fr
 [83.192.234.57])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id EC0DC20147;
 Fri,  3 Nov 2023 02:38:34 +0100 (CET)
Received: from samy by begin.home with local (Exim 4.97-RC3)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1qyj8s-00000000WKd-2IkE; Fri, 03 Nov 2023 02:38:34 +0100
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
X-Inumbo-ID: b49ca1c4-79e9-11ee-9b0e-b553b5be7939
Date: Fri, 3 Nov 2023 02:38:34 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [PATCH 1/2] Mini-OS: link kernel separately
Message-ID: <20231103013834.rtx3f4udl65hc5zd@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20231101153551.11733-1-jgross@suse.com>
 <20231101153551.11733-2-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231101153551.11733-2-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)

Juergen Gross, le mer. 01 nov. 2023 16:35:50 +0100, a ecrit:
> Add an additional link step with linking all Mini-OS kernel binaries
> into a single object file.
> 
> This is done in preparation of hiding Mini-OS internal symbols before
> linking the kernel with libraries and an application.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

thanks!

> ---
>  Makefile | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 7ee181a2..85c6db75 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -164,8 +164,11 @@ endif
>  $(OBJ_DIR)/arch/x86/minios-x86%.lds:  arch/x86/minios-x86.lds.S
>  	$(CPP) $(ASFLAGS) -P $< -o $@
>  
> -$(OBJ_DIR)/$(TARGET): $(OBJS) $(APP_O) arch_lib $(OBJ_DIR)/$(TARGET_ARCH_DIR)/minios-$(MINIOS_TARGET_ARCH).lds
> -	$(LD) -r $(LDFLAGS) $(HEAD_OBJ) $(APP_O) $(OBJS) $(LDARCHLIB) $(LDLIBS) -o $@.o
> +$(OBJ_DIR)/$(TARGET)-kern.o: $(OBJS) arch_lib $(OBJ_DIR)/$(TARGET_ARCH_DIR)/minios-$(MINIOS_TARGET_ARCH).lds
> +	$(LD) -r $(LDFLAGS) $(HEAD_OBJ) $(OBJS) $(LDARCHLIB) -o $@
> +
> +$(OBJ_DIR)/$(TARGET): $(OBJ_DIR)/$(TARGET)-kern.o $(APP_O)
> +	$(LD) -r $(LDFLAGS) $(OBJ_DIR)/$(TARGET)-kern.o $(APP_O) $(LDLIBS) -o $@.o
>  	$(OBJCOPY) -w -G $(GLOBAL_PREFIX)* -G _start $@.o $@.o
>  	$(LD) $(LDFLAGS) $(LDFLAGS_FINAL) $@.o $(EXTRA_OBJS) -o $@-debug
>  	strip -s $@-debug -o $@
> -- 
> 2.35.3
> 

