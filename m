Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA0C85EF98D
	for <lists+xen-devel@lfdr.de>; Thu, 29 Sep 2022 17:54:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.413848.657781 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odvqz-0007Qn-G5; Thu, 29 Sep 2022 15:53:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 413848.657781; Thu, 29 Sep 2022 15:53:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odvqz-0007OG-Cu; Thu, 29 Sep 2022 15:53:37 +0000
Received: by outflank-mailman (input) for mailman id 413848;
 Thu, 29 Sep 2022 15:53:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=04na=2A=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1odvqy-00072p-2o
 for xen-devel@lists.xenproject.org; Thu, 29 Sep 2022 15:53:36 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id df94dc87-400e-11ed-964a-05401a9f4f97;
 Thu, 29 Sep 2022 17:53:35 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E0A36618CF;
 Thu, 29 Sep 2022 15:53:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71B49C433D6;
 Thu, 29 Sep 2022 15:53:32 +0000 (UTC)
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
X-Inumbo-ID: df94dc87-400e-11ed-964a-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664466813;
	bh=whn/UAHZJvwOFIN2kO0KyEB44LZVp5inAO5r8KE1yZI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=GUX+Cks27vleV4d6ZEEIYhuMZ/YpE4HQWM9FIXhJNqY1gauHb3MkevSq1dL54HrHf
	 rBcTlY3+MikCjYU7YvXHeSwriR4L/uV/Y6XazOnHLbDLz4gkXpS5SYtiZtgxgGsf5j
	 lTYrhLXjtHrspX378vwTTyeULYk8iqI85wb4IUtFO15OKWUFs/0sgfypZF22Qst8nh
	 iAfuDP3QO5w+jtZg62+44+GFFw269VZpeNknhSfN067kPJeCGzED1JzMP4yFRV9Z/D
	 f9jHTUFkANt839CSG/FCbhtsnnQ7liq4ME0/GdwzgAn1LOoc34MF+wVM8WNfLa+WGE
	 Gx4Rj1vEUX2Sg==
Date: Thu, 29 Sep 2022 08:53:30 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Henry Wang <Henry.Wang@arm.com>, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [XEN PATCH v2] automation: Information about running containers
 for a different arch
In-Reply-To: <d832ebc2-239c-9c84-e8d9-f7a87efe2dba@amd.com>
Message-ID: <alpine.DEB.2.22.394.2209290853220.922084@ubuntu-linux-20-04-desktop>
References: <20220926135838.47330-1-anthony.perard@citrix.com> <20220929095131.61034-1-anthony.perard@citrix.com> <d832ebc2-239c-9c84-e8d9-f7a87efe2dba@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 29 Sep 2022, Michal Orzel wrote:
> Hi Anthony,
> 
> On 29/09/2022 11:51, Anthony PERARD wrote:
> > 
> > 
> > Adding pointer to 'qemu-user-static'.
> > 
> > Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> 
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>

