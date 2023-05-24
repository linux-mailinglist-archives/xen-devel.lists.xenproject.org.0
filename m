Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC487100A7
	for <lists+xen-devel@lfdr.de>; Thu, 25 May 2023 00:17:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539225.839889 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1wmF-0005cM-P6; Wed, 24 May 2023 22:16:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539225.839889; Wed, 24 May 2023 22:16:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1wmF-0005ZL-Lg; Wed, 24 May 2023 22:16:15 +0000
Received: by outflank-mailman (input) for mailman id 539225;
 Wed, 24 May 2023 22:16:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hEuA=BN=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1q1wmD-0005ZF-Hx
 for xen-devel@lists.xenproject.org; Wed, 24 May 2023 22:16:13 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 92e5017b-fa80-11ed-8611-37d641c3527e;
 Thu, 25 May 2023 00:16:05 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 272D16160D;
 Wed, 24 May 2023 22:16:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79F05C433EF;
 Wed, 24 May 2023 22:16:02 +0000 (UTC)
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
X-Inumbo-ID: 92e5017b-fa80-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684966563;
	bh=eeFLFGZMVCEPE2HtejpmbcNN7wAgLIPWb5dnlfIaXaw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=nGeFOg2t9r+NdRLZlcfTcSJKZSQLR87Re7VTo2y+6Y9OWe74yeYHhhNp5+a30ZJnk
	 Urxw5nunjRL11DWDZtsWMbodGja+n8fByepPt8bUsicL18hAjIiz+Ef+BvdilruEPU
	 Bi9NRxs5PzGSuXaz66rJvnhzEYWRTx2prOnvo1VqItlw7ss/5j4k2nKxbRE+WJiNeB
	 UQS4fUkHXFQ+ceNtK2IYMzTLf+g+pDYs5aDAGbIdLppbjKcBZk3N/MnlEffE1Xty33
	 w8lzXwVqfbHO5m+LGSToVFUTkB6qAI0mAzSuZ67jFkQIRzEmVTBMpUvqECPztmsBdX
	 czYcN+7GYgliQ==
Date: Wed, 24 May 2023 15:16:00 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Olaf Hering <olaf@aepfle.de>
cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH v1] xen: fix comment typo regarding IOREQ Server
In-Reply-To: <20230524204032.3193-1-olaf@aepfle.de>
Message-ID: <alpine.DEB.2.22.394.2305241515390.44000@ubuntu-linux-20-04-desktop>
References: <20230524204032.3193-1-olaf@aepfle.de>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 24 May 2023, Olaf Hering wrote:
> Signed-off-by: Olaf Hering <olaf@aepfle.de>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/include/public/hvm/dm_op.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/include/public/hvm/dm_op.h b/xen/include/public/hvm/dm_op.h
> index acdf91693d..fa98551914 100644
> --- a/xen/include/public/hvm/dm_op.h
> +++ b/xen/include/public/hvm/dm_op.h
> @@ -17,7 +17,7 @@
>  /*
>   * IOREQ Servers
>   *
> - * The interface between an I/O emulator an Xen is called an IOREQ Server.
> + * The interface between an I/O emulator and Xen is called an IOREQ Server.
>   * A domain supports a single 'legacy' IOREQ Server which is instantiated if
>   * parameter...
>   *
> 

