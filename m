Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC488868477
	for <lists+xen-devel@lfdr.de>; Tue, 27 Feb 2024 00:08:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685828.1067182 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rek4D-0005wY-5z; Mon, 26 Feb 2024 23:07:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685828.1067182; Mon, 26 Feb 2024 23:07:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rek4D-0005uo-3I; Mon, 26 Feb 2024 23:07:25 +0000
Received: by outflank-mailman (input) for mailman id 685828;
 Mon, 26 Feb 2024 23:07:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gV/7=KD=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rek4B-0005ui-BK
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2024 23:07:23 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cb00a9a7-d4fb-11ee-8a58-1f161083a0e0;
 Tue, 27 Feb 2024 00:07:22 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id DF163CE0E03;
 Mon, 26 Feb 2024 23:07:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FFC9C433C7;
 Mon, 26 Feb 2024 23:07:14 +0000 (UTC)
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
X-Inumbo-ID: cb00a9a7-d4fb-11ee-8a58-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708988835;
	bh=MfBfvvSQBzN8cnVm0q01rEP9iQuXcny525SJfVlZ1SU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=WvTWzoocnBvyNuHdXdQ4al4hofFIqvtMoqMKVO3iBj7yMuNObvOkKEcFPQysRKLWv
	 3FgrA5rjSR6E9U8SKDvlQJzQFoZWY7irZLhNKeH/UaIdsCAv7bjHCQFhwdu2KAZ272
	 LFEacbAlTQIz8cjMOVr9NDdIIJhI6ZBQbry00pEkXSfprvUHUFNfu7Vxx6CQmmaet7
	 9vwG8QbKeTR9QCdLxSIkTM1UG82GjtMRWoyo0uwCBWghsM9+mxBzRCaoSfnLAMBisc
	 vkR8INXWgT9NbCnqgK9ZSpRkld8IOjNDRMjGt9EQ+RsmQRGNfaio4Shg4ZzLizPeg+
	 4kENyH6lYkJYQ==
Date: Mon, 26 Feb 2024 15:07:13 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Olaf Hering <olaf@aepfle.de>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH v1] automation: remove bin86/dev86 from tumbleweed
 image
In-Reply-To: <20240224064055.69dc7fb8.olaf@aepfle.de>
Message-ID: <alpine.DEB.2.22.394.2402261507040.247676@ubuntu-linux-20-04-desktop>
References: <20231213202515.30587-1-olaf@aepfle.de> <alpine.DEB.2.22.394.2402231522020.754277@ubuntu-linux-20-04-desktop> <20240224064055.69dc7fb8.olaf@aepfle.de>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 24 Feb 2024, Olaf Hering wrote:
> Fri, 23 Feb 2024 15:22:38 -0800 (PST) Stefano Stabellini <sstabellini@kernel.org>:
> 
> > Do you have a successful gitlab pipeline with this patch applied that
> > you can give me as proof of testing and success?
> 
> Yes, all of them since the patch went out.

Great thanks!

Acked-by: Stefano Stabellini <sstabellini@kernel.org>

