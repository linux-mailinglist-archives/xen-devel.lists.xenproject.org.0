Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB1192DCF5
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jul 2024 01:46:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.757093.1165842 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRgzb-00078A-MT; Wed, 10 Jul 2024 23:44:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 757093.1165842; Wed, 10 Jul 2024 23:44:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRgzb-00075l-Jr; Wed, 10 Jul 2024 23:44:59 +0000
Received: by outflank-mailman (input) for mailman id 757093;
 Wed, 10 Jul 2024 23:44:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I4IA=OK=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sRgzZ-00075f-V0
 for xen-devel@lists.xenproject.org; Wed, 10 Jul 2024 23:44:58 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 682a72d6-3f16-11ef-8776-851b0ebba9a2;
 Thu, 11 Jul 2024 01:44:55 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D8974619F9;
 Wed, 10 Jul 2024 23:44:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5EDBC4AF07;
 Wed, 10 Jul 2024 23:44:52 +0000 (UTC)
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
X-Inumbo-ID: 682a72d6-3f16-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720655093;
	bh=RlU5qdZXTV2dF3NT+nL4H3tIUBMv0nZjJ1Ispw7bS6U=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=G6YbKyWzszMGepScRgEHNrHj4Nrv0oyNXTCGShHa77bwVmwpJI7vjRSUFrrPacN12
	 8CZOzXmkvQNk3AJCb99Rwak5fWrbTMtoMdjtTCjg8IVKFOngrpPxlMXQo2LEboZgVv
	 +nFLyCB2zkce60ihkxKy3pOCR//2FO/VFJTrWf+BIdAfu5I3bF/WeZslOJrI1wbhIS
	 5QDk+pqq3oUifuX0LVFxj8tuKBg/jqFa9H/MYwYelktbmVvl233cR5EPPlzYIZkJCV
	 puJDz86RvqGrxlxYzefoYOt+PGWevFjooB5q/hFUjMyu0sJj/hGoHpxw3PYDXUGO1x
	 K6E92DY0MNMRg==
Date: Wed, 10 Jul 2024 16:44:51 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Chen Ni <nichen@iscas.ac.cn>
cc: sstabellini@kernel.org, linux@armlinux.org.uk, 
    xen-devel@lists.xenproject.org, linux-arm-kernel@lists.infradead.org, 
    linux-kernel@vger.kernel.org, Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] xen/arm: Convert comma to semicolon
In-Reply-To: <20240710014208.1719662-1-nichen@iscas.ac.cn>
Message-ID: <alpine.DEB.2.22.394.2407101643290.3635@ubuntu-linux-20-04-desktop>
References: <20240710014208.1719662-1-nichen@iscas.ac.cn>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 10 Jul 2024, Chen Ni wrote:
> Replace a comma between expression statements by a semicolon.
> 
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

> ---
>  arch/arm/xen/p2m.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/xen/p2m.c b/arch/arm/xen/p2m.c
> index 309648c17f48..9da57a5b81c7 100644
> --- a/arch/arm/xen/p2m.c
> +++ b/arch/arm/xen/p2m.c
> @@ -109,7 +109,7 @@ int set_foreign_p2m_mapping(struct gnttab_map_grant_ref *map_ops,
>  		 * immediate unmapping.
>  		 */
>  		map_ops[i].status = GNTST_general_error;
> -		unmap.host_addr = map_ops[i].host_addr,
> +		unmap.host_addr = map_ops[i].host_addr;
>  		unmap.handle = map_ops[i].handle;
>  		map_ops[i].handle = INVALID_GRANT_HANDLE;
>  		if (map_ops[i].flags & GNTMAP_device_map)
> -- 
> 2.25.1
> 

