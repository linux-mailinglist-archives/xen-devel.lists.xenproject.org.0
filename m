Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C36292EBD
	for <lists+xen-devel@lfdr.de>; Mon, 19 Oct 2020 21:46:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.8819.23698 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUb6l-0006bf-Ev; Mon, 19 Oct 2020 19:46:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 8819.23698; Mon, 19 Oct 2020 19:46:15 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUb6l-0006bK-BB; Mon, 19 Oct 2020 19:46:15 +0000
Received: by outflank-mailman (input) for mailman id 8819;
 Mon, 19 Oct 2020 19:46:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JRC9=D2=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kUb6k-0006bF-IH
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2020 19:46:14 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f1b1cd7b-c992-4251-9e39-63d032ae9a08;
 Mon, 19 Oct 2020 19:46:13 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net
 [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C00BE222EA;
 Mon, 19 Oct 2020 19:46:12 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=JRC9=D2=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
	id 1kUb6k-0006bF-IH
	for xen-devel@lists.xenproject.org; Mon, 19 Oct 2020 19:46:14 +0000
X-Inumbo-ID: f1b1cd7b-c992-4251-9e39-63d032ae9a08
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id f1b1cd7b-c992-4251-9e39-63d032ae9a08;
	Mon, 19 Oct 2020 19:46:13 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id C00BE222EA;
	Mon, 19 Oct 2020 19:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603136773;
	bh=f9jUoDlKj3bp6hvA75GWJ5qRIX5T6tQDnN4TNMvYYm0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=bBlNZpMMjp9zWk4KVHSeJMPq8HozfAW5KWCV4EangbvxtVfIG99Ee0alsARAC0Vjt
	 M1ryLwvqNEqONCRE89uAzXXcwlYpmWrhWfCGBw33uZgIwI5ocLxwq25Bq5Wh5Zy/1M
	 Y77biisCCLy/ctYk3yUyaCaQPUNNROfcNX+eR9is=
Date: Mon, 19 Oct 2020 12:46:11 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    "tee-dev@lists.linaro.org" <tee-dev@lists.linaro.org>
Subject: Re: [PATCH] arm: optee: don't print warning about "wrong" RPC
 buffer
In-Reply-To: <20201005091212.186934-1-volodymyr_babchuk@epam.com>
Message-ID: <alpine.DEB.2.21.2010191245470.12247@sstabellini-ThinkPad-T480s>
References: <20201005091212.186934-1-volodymyr_babchuk@epam.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 5 Oct 2020, Volodymyr Babchuk wrote:
> OP-TEE mediator tracks cookie value for a last buffer which
> was requested by OP-TEE. This tracked value serves one important
> purpose: if OP-TEE wants to request another buffer, we know
> that it finished importing previous one and we can free page list
> associated with it.
> 
> Also, we had false premise that OP_TEE will free requested buffers in
> reversed order. So we checked rpc_data_cookie during handling
> OPTEE_RPC_CMD_SHM_FREE call and printed warning if cookie of buffer
> which is requested to be freed differs from last allocated one.
> 
> During testing RPMB FS services I discovered, that RPMB code frees
> request and response buffers in the same order is it allocated
> them. And this is perfectly fine, actually.
> 
> So, we are removing mentioned warning message in Xen, as it is
> perfectly normal to free buffers in arbitrary order.
> 
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>


Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

I am going to fix the grammar on commit


> ---
>  xen/arch/arm/tee/optee.c | 20 +-------------------
>  1 file changed, 1 insertion(+), 19 deletions(-)
> 
> diff --git a/xen/arch/arm/tee/optee.c b/xen/arch/arm/tee/optee.c
> index 8a39fe33b0..ee85359742 100644
> --- a/xen/arch/arm/tee/optee.c
> +++ b/xen/arch/arm/tee/optee.c
> @@ -1127,25 +1127,7 @@ static int handle_rpc_return(struct optee_domain *ctx,
>           */
>          if ( shm_rpc->xen_arg->cmd == OPTEE_RPC_CMD_SHM_FREE )
>          {
> -            uint64_t cookie = shm_rpc->xen_arg->params[0].u.value.b;
> -
> -            free_optee_shm_buf(ctx, cookie);
> -
> -            /*
> -             * OP-TEE asks to free the buffer, but this is not the same
> -             * buffer we previously allocated for it. While nothing
> -             * prevents OP-TEE from asking this, it is the strange
> -             * situation. This may or may not be caused by a bug in
> -             * OP-TEE or mediator. But is better to print warning.
> -             */
> -            if ( call->rpc_data_cookie && call->rpc_data_cookie != cookie )
> -            {
> -                gprintk(XENLOG_ERR,
> -                        "Saved RPC cookie does not corresponds to OP-TEE's (%"PRIx64" != %"PRIx64")\n",
> -                        call->rpc_data_cookie, cookie);
> -
> -                WARN();
> -            }
> +            free_optee_shm_buf(ctx, shm_rpc->xen_arg->params[0].u.value.b);
>              call->rpc_data_cookie = 0;
>          }
>          unmap_domain_page(shm_rpc->xen_arg);
> -- 
> 2.27.0
> 

