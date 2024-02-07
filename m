Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B561584CC10
	for <lists+xen-devel@lfdr.de>; Wed,  7 Feb 2024 14:54:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.677637.1054365 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXiNe-0002F9-LG; Wed, 07 Feb 2024 13:54:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 677637.1054365; Wed, 07 Feb 2024 13:54:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXiNe-0002CE-IE; Wed, 07 Feb 2024 13:54:26 +0000
Received: by outflank-mailman (input) for mailman id 677637;
 Wed, 07 Feb 2024 13:54:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CAtM=JQ=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 1rXiNc-0002AL-DC
 for xen-devel@lists.xenproject.org; Wed, 07 Feb 2024 13:54:24 +0000
Received: from sonata.ens-lyon.org (domu-toccata.ens-lyon.fr [140.77.166.138])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 64365d83-c5c0-11ee-98f5-efadbce2ee36;
 Wed, 07 Feb 2024 14:54:20 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id E1C85A02F3;
 Wed,  7 Feb 2024 14:54:19 +0100 (CET)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c8xwyZB29BqE; Wed,  7 Feb 2024 14:54:19 +0100 (CET)
Received: from begin (nat-inria-interne-52-gw-01-bso.bordeaux.inria.fr
 [194.199.1.52])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id 9447DA02E8;
 Wed,  7 Feb 2024 14:54:19 +0100 (CET)
Received: from samy by begin with local (Exim 4.97)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1rXiNX-00000008oCE-0Z2A; Wed, 07 Feb 2024 14:54:19 +0100
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
X-Inumbo-ID: 64365d83-c5c0-11ee-98f5-efadbce2ee36
Date: Wed, 7 Feb 2024 14:54:19 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org, julien@xen.org
Subject: Re: [PATCH] Mini-OS: fix 9pfront fix
Message-ID: <20240207135419.4upw334gz6trevwq@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org, julien@xen.org
References: <20240207134920.7341-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240207134920.7341-1-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)

Juergen Gross, le mer. 07 févr. 2024 14:49:20 +0100, a ecrit:
> There was a typo in the recent 9pfront fix.
> 
> Fixes: b119f0178fd8 ("Mini-OS: fix 9pfs frontend error path")
> Reported-by: Julien Grall <julien@xen.org>
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
>  9pfront.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/9pfront.c b/9pfront.c
> index 042879a7..1741d600 100644
> --- a/9pfront.c
> +++ b/9pfront.c
> @@ -729,7 +729,7 @@ static int p9_stat(struct dev_9pfs *dev, uint32_t fid, struct p9_stat *stat)
>  
>      ret = req->result;
>      if ( ret )
> -        free_stat(&stat);
> +        free_stat(stat);
>  
>      put_free_req(dev, req);
>  
> -- 
> 2.35.3
> 

