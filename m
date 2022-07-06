Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F98569686
	for <lists+xen-devel@lfdr.de>; Thu,  7 Jul 2022 01:46:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.362653.592786 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9EjD-0002vy-NO; Wed, 06 Jul 2022 23:46:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 362653.592786; Wed, 06 Jul 2022 23:46:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9EjD-0002tN-KJ; Wed, 06 Jul 2022 23:46:43 +0000
Received: by outflank-mailman (input) for mailman id 362653;
 Wed, 06 Jul 2022 23:46:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kyFG=XL=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1o9EjC-0002tF-3d
 for xen-devel@lists.xenproject.org; Wed, 06 Jul 2022 23:46:42 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e143af2f-fd85-11ec-924f-1f966e50362f;
 Thu, 07 Jul 2022 01:46:39 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CA334B81E4F;
 Wed,  6 Jul 2022 23:46:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18ACDC3411C;
 Wed,  6 Jul 2022 23:46:37 +0000 (UTC)
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
X-Inumbo-ID: e143af2f-fd85-11ec-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657151197;
	bh=p52+6OYzpxBGgKhvFm+b8RBqSX/ki0bnnKZ7/BWyj9Y=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=pgWZCvfCESEK81RquZPje2PIoSOF4kN50m5f21fa1hticnVpig3im/aempDCbvm94
	 JA2eouh6gQAR8zvwNlMcbbEDyvPIbD++3SocGC1lZW8fO/8vnaoNB3Diral5YpMfZv
	 dqr4i3BeN+rgEjvTUFsEiPvmkRuAqEp+Zj0AKlsOfl5HkNH/ujz5iX5KV5f13i2g4M
	 eIcQeerTxnowlzNS4GxkAYGmVU5rkP0QD67qkgSQTgd3KFe5aoTFWiuebftrwm6A+e
	 aw5oQLrrXZ1mUkKpNeXbC7V1WxZaum+4uu1CZ8RSIvSJ3Y1G/0F6Zutjaxu+9jG36K
	 GsjTph/gmSXpA==
Date: Wed, 6 Jul 2022 16:46:35 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Xenia Ragiadakou <burzalodowa@gmail.com>
cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH] xen/char: pv_console: Fix MISRA C 2012 Rule 2.1
 violation
In-Reply-To: <20220706175013.675258-1-burzalodowa@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2207061646290.2354836@ubuntu-linux-20-04-desktop>
References: <20220706175013.675258-1-burzalodowa@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 6 Jul 2022, Xenia Ragiadakou wrote:
> Remove the definition of the function pv_console_evtchn(),
> when CONFIG_XEN_GUEST is not set, because the function is not used.
> 
> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/include/xen/pv_console.h | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/xen/include/xen/pv_console.h b/xen/include/xen/pv_console.h
> index 4745f46f2d..55b20323fb 100644
> --- a/xen/include/xen/pv_console.h
> +++ b/xen/include/xen/pv_console.h
> @@ -19,11 +19,6 @@ static inline void pv_console_set_rx_handler(serial_rx_fn fn) { }
>  static inline void pv_console_init_postirq(void) { }
>  static inline void pv_console_puts(const char *buf, size_t nr) { }
>  static inline size_t pv_console_rx(struct cpu_user_regs *regs) { return 0; }
> -evtchn_port_t pv_console_evtchn(void)
> -{
> -    ASSERT_UNREACHABLE();
> -    return 0;
> -}
>  
>  #endif /* !CONFIG_XEN_GUEST */
>  #endif /* __XEN_PV_CONSOLE_H__ */
> -- 
> 2.34.1
> 

