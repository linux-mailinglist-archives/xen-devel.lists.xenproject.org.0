Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FFD51D724D
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2020 09:53:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jaaaC-0002qh-BC; Mon, 18 May 2020 07:53:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a79S=7A=ens-lyon.org=samuel.thibault@srs-us1.protection.inumbo.net>)
 id 1jaaaA-0002qY-Jb
 for xen-devel@lists.xenproject.org; Mon, 18 May 2020 07:53:06 +0000
X-Inumbo-ID: 9af47f9e-98dc-11ea-ae69-bc764e2007e4
Received: from hera.aquilenet.fr (unknown [2a0c:e300::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9af47f9e-98dc-11ea-ae69-bc764e2007e4;
 Mon, 18 May 2020 07:53:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id 853FD76B;
 Mon, 18 May 2020 09:53:03 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KDUjvMKp-PnR; Mon, 18 May 2020 09:53:02 +0200 (CEST)
Received: from function (lfbn-bor-1-797-11.w86-234.abo.wanadoo.fr
 [86.234.239.11])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id E466D70A;
 Mon, 18 May 2020 09:53:01 +0200 (CEST)
Received: from samy by function with local (Exim 4.93)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1jaaa4-0054WS-Lo; Mon, 18 May 2020 09:53:00 +0200
Date: Mon, 18 May 2020 09:53:00 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH mini-os] console: add newline at EOF
Message-ID: <20200518075300.t3tvfo7ucbwujmif@function>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
References: <9d2e445b-0b0f-4e4d-08a8-0f22013f111b@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9d2e445b-0b0f-4e4d-08a8-0f22013f111b@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Jan Beulich, le lun. 18 mai 2020 09:09:14 +0200, a ecrit:
> Some gcc versions get pretty unhappy without.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

That was an easy one :)

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> 
> --- a/console/console.c
> +++ b/console/console.c
> @@ -174,4 +174,4 @@ void resume_console(void)
>  {
>      xencons_ring_resume(xen_console);
>      console_initialised = 1;
> -}
> \ No newline at end of file
> +}
> 

