Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E56EE50C0B6
	for <lists+xen-devel@lfdr.de>; Fri, 22 Apr 2022 22:37:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.311237.528377 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ni01N-0000cj-6X; Fri, 22 Apr 2022 20:36:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 311237.528377; Fri, 22 Apr 2022 20:36:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ni01N-0000ao-3Q; Fri, 22 Apr 2022 20:36:53 +0000
Received: by outflank-mailman (input) for mailman id 311237;
 Fri, 22 Apr 2022 20:36:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N0EE=VA=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1ni01L-0000ai-DK
 for xen-devel@lists.xenproject.org; Fri, 22 Apr 2022 20:36:51 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ef701d92-c27b-11ec-a405-831a346695d4;
 Fri, 22 Apr 2022 22:36:50 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 209F161D93;
 Fri, 22 Apr 2022 20:36:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26FDAC385AA;
 Fri, 22 Apr 2022 20:36:48 +0000 (UTC)
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
X-Inumbo-ID: ef701d92-c27b-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1650659808;
	bh=a+XR4UoEGJUvtEOaoDDXPDz++it2F/wJ7l1aRxdt+0A=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=U1C6BKzOQuYL/nfuZoLkjlUF20h2YUwLxJY1jSCzxIVnBUp4EdJZVs73O1Pn6Utof
	 mjCRxX9TNkmFvZRFKUp56ZToSf4XCNw3aT2W7Bb3Wj1WnU12GEiA8K4+pF9M/zJgab
	 Izb9tqF2ccr987MY+dxr3hXiq9qVIVBJ5f2n2B6Jbyvz1tasMZIf9LgX+MYnKR/xjG
	 E7WDSqaSUS+UtgaJCSFEciax2GbqTfgDORciTT4qkV5m2axVo/H+60yclotNZx8AJ0
	 da1zxk6XQKfI87Sn8gDX/QDKt5eLqEfHH35itwJbVBrcOOqKMbhg2APRBh3695gRXT
	 MN2pwmL/0NspQ==
Date: Fri, 22 Apr 2022 13:36:47 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Stephen Rothwell <sfr@canb.auug.org.au>
cc: Juergen Gross <jgross@suse.com>, 
    Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
    Xen Devel <xen-devel@lists.xenproject.org>, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>, 
    Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
    Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the xen-tip
 tree
In-Reply-To: <20220422111438.3946dbae@canb.auug.org.au>
Message-ID: <alpine.DEB.2.22.394.2204221336170.915916@ubuntu-linux-20-04-desktop>
References: <20220422111438.3946dbae@canb.auug.org.au>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Juergen, Boris,

I forced-pushed the linux-next and for-linus-5.18 branches to solve the
issue


On Fri, 22 Apr 2022, Stephen Rothwell wrote:
> Hi all,
> 
> Commit
> 
>   b12d41716e32 ("arm/xen: Fix some refcount leaks")
> 
> is missing a Signed-off-by from its committer.
> 
> -- 
> Cheers,
> Stephen Rothwell
> 

