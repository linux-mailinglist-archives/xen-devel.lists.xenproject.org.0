Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B989B3E84
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2024 00:35:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.827009.1241481 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5ZFN-0007oR-Qk; Mon, 28 Oct 2024 23:34:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 827009.1241481; Mon, 28 Oct 2024 23:34:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5ZFN-0007m4-Nt; Mon, 28 Oct 2024 23:34:05 +0000
Received: by outflank-mailman (input) for mailman id 827009;
 Mon, 28 Oct 2024 23:34:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CE0l=RY=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1t5ZFM-0007ly-HH
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2024 23:34:04 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1d10178f-9585-11ef-a0c2-8be0dac302b0;
 Tue, 29 Oct 2024 00:34:03 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id B3DA6A4038A;
 Mon, 28 Oct 2024 23:32:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7B0FC4CEC3;
 Mon, 28 Oct 2024 23:34:00 +0000 (UTC)
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
X-Inumbo-ID: 1d10178f-9585-11ef-a0c2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730158441;
	bh=uL4AuCHbWlMfq+I9KOrlwIo7FYzlQ3f2/Kr46ozgiQg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Iw+K9gl/IyZ5qzaHxxWIZhplW2xd4XxvQyiKCBbfORvFRKkHGhHmvinRQMNeTEXva
	 I9hOM6lZZAn4sgw8gKTMs+ttFW7lJghZi550ysl99NPt4m7SxhsNPpvWzMzgKzJzNN
	 RPvJ4knaS8yodM/6yKhTmEqSRm/avgK3b6XV6H6uwV2JYzetrR880wOjJ13Eq8Pr+Q
	 BUOnP2tGXnk0IffQ95Mg6xN2piN1PhtvvdXum42Z7HelDdMuQw6qMLbKyEtp87KnN9
	 +X1mLPAVDsenvOmcNaE/9TSbYx8gRVxpgC1IrFbmT/3qqAIm3psteVX5APnVq/xC4x
	 99Vy1CTTRFvYg==
Date: Mon, 28 Oct 2024 16:34:00 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jason Andryuk <jason.andryuk@amd.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <stefano.stabellini@amd.com>, 
    Michal Orzel <michal.orzel@amd.com>
Subject: Re: [ImageBuilder] uboot-script-gen: Use split_value for memory
In-Reply-To: <20241028180644.2501-1-jason.andryuk@amd.com>
Message-ID: <alpine.DEB.2.22.394.2410281633530.2525410@ubuntu-linux-20-04-desktop>
References: <20241028180644.2501-1-jason.andryuk@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 28 Oct 2024, Jason Andryuk wrote:
> Don't hardcode the first cell to 0 - use split_value to handle larger
> values properly.
> 
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  scripts/uboot-script-gen | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
> index f10e5f4..dcf5bdb 100755
> --- a/scripts/uboot-script-gen
> +++ b/scripts/uboot-script-gen
> @@ -174,7 +174,7 @@ function add_device_tree_mem()
>          memory=$((512 * 1024))
>      fi
>  
> -    dt_set "$path" "memory" "int" "0 $memory"
> +    dt_set "$path" "memory" "int" "$( split_value $memory )"
>  }
>  
>  function add_device_tree_static_mem()
> -- 
> 2.34.1
> 

