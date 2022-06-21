Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA58553F1F
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jun 2022 01:45:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.353360.580300 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3nY6-0003Di-Vv; Tue, 21 Jun 2022 23:44:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 353360.580300; Tue, 21 Jun 2022 23:44:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3nY6-0003BD-Sw; Tue, 21 Jun 2022 23:44:46 +0000
Received: by outflank-mailman (input) for mailman id 353360;
 Tue, 21 Jun 2022 23:44:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D44s=W4=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1o3nY5-000393-4i
 for xen-devel@lists.xenproject.org; Tue, 21 Jun 2022 23:44:45 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1e424e11-f1bc-11ec-bd2d-47488cf2e6aa;
 Wed, 22 Jun 2022 01:44:43 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F412D61798;
 Tue, 21 Jun 2022 23:44:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16FFDC3411C;
 Tue, 21 Jun 2022 23:44:39 +0000 (UTC)
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
X-Inumbo-ID: 1e424e11-f1bc-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655855079;
	bh=cLNxB1L3NIVS+qsysMNnTABUz7WYMmeObAtsONQsznw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=QZfaT/B1Atjx9NckBJy9dPfaKr05DVUqUv62poi6d9cXgitwCJg5lIL8dkTw4IkNg
	 /Zna3t9DsIwljybjdxp/PDPWBrI7unPVomnE/DA3BUG4KYnBTspRT46ascQrVV0vEX
	 8sRM8j2LY3uCiEWOuPCcdsUWo2m2nKMoQ+nrBKh6zCwOcCHCzTTd30d/fcG3Y660gh
	 ZFd7AFn4JK/Ko41RxYtXHKqfzniuWIfdavi2cNPzwD9L342jZh3MAQ5+42bq5IEU2b
	 AEb0B98H4tyCQynYsb8V1QEvT/hXTjeaHek4lYjBiOgJGdrM3Q+FZ5bC2hnqV8RAwQ
	 TMEly1ceEQHuw==
Date: Tue, 21 Jun 2022 16:44:38 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Xenia Ragiadakou <burzalodowa@gmail.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 2/2] xen/arm: vtimer: Remove duplicate header
In-Reply-To: <20220621154402.482857-2-burzalodowa@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2206211644320.788376@ubuntu-linux-20-04-desktop>
References: <20220621154402.482857-1-burzalodowa@gmail.com> <20220621154402.482857-2-burzalodowa@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 21 Jun 2022, Xenia Ragiadakou wrote:
> The header file <asm/regs.h> is already included above and can be removed here.
> 
> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/arch/arm/vtimer.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/xen/arch/arm/vtimer.c b/xen/arch/arm/vtimer.c
> index 5f26463354..6b78fea77d 100644
> --- a/xen/arch/arm/vtimer.c
> +++ b/xen/arch/arm/vtimer.c
> @@ -30,7 +30,6 @@
>  #include <asm/vgic.h>
>  #include <asm/vreg.h>
>  #include <asm/vtimer.h>
> -#include <asm/regs.h>
>  
>  /*
>   * Check if regs is allowed access, user_gate is tail end of a
> -- 
> 2.34.1
> 

