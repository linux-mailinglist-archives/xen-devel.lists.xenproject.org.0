Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC9DA6CD5B
	for <lists+xen-devel@lfdr.de>; Sun, 23 Mar 2025 01:03:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.924854.1327837 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tw8nn-0000mj-26; Sun, 23 Mar 2025 00:02:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 924854.1327837; Sun, 23 Mar 2025 00:02:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tw8nm-0000lH-VR; Sun, 23 Mar 2025 00:02:54 +0000
Received: by outflank-mailman (input) for mailman id 924854;
 Sun, 23 Mar 2025 00:02:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CaZ1=WK=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 1tw8nl-0000jC-N5
 for xen-devel@lists.xenproject.org; Sun, 23 Mar 2025 00:02:53 +0000
Received: from sonata.ens-lyon.org (domu-toccata.ens-lyon.fr [140.77.166.138])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 29e13cc7-077a-11f0-9ea2-5ba50f476ded;
 Sun, 23 Mar 2025 01:02:52 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id C9280A1D52;
 Sun, 23 Mar 2025 01:02:51 +0100 (CET)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lcE_MNkmn2Us; Sun, 23 Mar 2025 01:02:51 +0100 (CET)
Received: from begin (aamiens-653-1-40-48.w83-192.abo.wanadoo.fr
 [83.192.199.48])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id A7169A1C52;
 Sun, 23 Mar 2025 01:02:51 +0100 (CET)
Received: from samy by begin with local (Exim 4.98)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1tw8nj-0000000FFus-0wdp; Sun, 23 Mar 2025 01:02:51 +0100
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
X-Inumbo-ID: 29e13cc7-077a-11f0-9ea2-5ba50f476ded
Date: Sun, 23 Mar 2025 01:02:51 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	Jason Andryuk <jason.andryuk@amd.com>
Subject: Re: [MINI-OS PATCH v2 2/2] 9pfs: add lseek file operation hook
Message-ID: <Z99PqxXpRnYCupoD@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org,
	Jason Andryuk <jason.andryuk@amd.com>
References: <20250321093145.17882-1-jgross@suse.com>
 <20250321093145.17882-3-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250321093145.17882-3-jgross@suse.com>
Organization: I am not organized

Juergen Gross, le ven. 21 mars 2025 10:31:45 +0100, a ecrit:
> Add a file operations lseek hook to the 9pfs frontend. Just use the
> lseek_default() implementation.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
>  9pfront.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/9pfront.c b/9pfront.c
> index 7257a07e..8bf3a91e 100644
> --- a/9pfront.c
> +++ b/9pfront.c
> @@ -1325,6 +1325,7 @@ static const struct file_ops ops_9pfs = {
>      .write = write_9pfs,
>      .close = close_9pfs,
>      .fstat = fstat_9pfs,
> +    .lseek = lseek_default,
>  };
>  
>  __attribute__((constructor))
> -- 
> 2.43.0
> 

