Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5411493021B
	for <lists+xen-devel@lfdr.de>; Sat, 13 Jul 2024 00:22:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.758340.1167791 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sSOen-0008Bt-E0; Fri, 12 Jul 2024 22:22:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 758340.1167791; Fri, 12 Jul 2024 22:22:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sSOen-0008AO-BA; Fri, 12 Jul 2024 22:22:25 +0000
Received: by outflank-mailman (input) for mailman id 758340;
 Fri, 12 Jul 2024 22:22:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ilSY=OM=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sSOem-0008AI-06
 for xen-devel@lists.xenproject.org; Fri, 12 Jul 2024 22:22:24 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3526ac15-409d-11ef-bbfb-fd08da9f4363;
 Sat, 13 Jul 2024 00:22:22 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6D991619B0;
 Fri, 12 Jul 2024 22:22:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB84FC32782;
 Fri, 12 Jul 2024 22:22:19 +0000 (UTC)
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
X-Inumbo-ID: 3526ac15-409d-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720822941;
	bh=dTYJoCY4JoR9CK44LuVPwoQOVDjetlh1BRw5erscm6o=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=koqVEKYANOEnlPbIDQ4WXPc8CGSB+vVM15qwM0W14Bn3Kko5nHihVzEaKV8aonMLu
	 5MK1DlBOORZjUYD6YXlaD6qzv1BwmbSwHCWXU4LmMLxoxiHy7N0HpoZq8iN4m95/Vo
	 pfC8FoBqU9TxQJkHkdmwViuyFk8E4CcgghUOoKNUIhfBZhuHyQbZjbb+7wYXP5ho7C
	 WQd2pDxoh+5SBp3ewP+HbAjOf61BsuFUQmogAWXPno+SXSMGBqNfJsCaGYtx5Ra8/N
	 POS9HSrNUh0LA1EnphelD2XSuGn9jnGdB1kjOG9viSV6YQG5cT3Bo4WkMJSrhIw5Z9
	 1YHnDfoBlXeMA==
Date: Fri, 12 Jul 2024 15:22:18 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Nicola Vetrini <nicola.vetrini@bugseng.com>, 
    Simone Ballarin <simone.ballarin@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>
Subject: Re: [PATCH 13/17] xen: add deviations for MISRA C 2012 Dir D4.10
In-Reply-To: <f26c90dc93a3862e472afbe630dabfec30e51ffe.1719829101.git.alessandro.zucchelli@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2407121522080.3635@ubuntu-linux-20-04-desktop>
References: <cover.1719829101.git.alessandro.zucchelli@bugseng.com> <f26c90dc93a3862e472afbe630dabfec30e51ffe.1719829101.git.alessandro.zucchelli@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 1 Jul 2024, Alessandro Zucchelli wrote:
> From: Nicola Vetrini <nicola.vetrini@bugseng.com>
> 
> Add safe deviation for *.c files, as estabilished in past discussion.
> 
> Signed-off-by: Maria Celeste Cesario  <maria.celeste.cesario@bugseng.com>
> Signed-off-by: Simone Ballarin  <simone.ballarin@bugseng.com>
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> Signed-off-by: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
> 

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

