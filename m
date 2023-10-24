Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FDD77D5BE0
	for <lists+xen-devel@lfdr.de>; Tue, 24 Oct 2023 21:52:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.622596.969590 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvNS5-00079c-6v; Tue, 24 Oct 2023 19:52:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 622596.969590; Tue, 24 Oct 2023 19:52:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvNS5-00077Q-4A; Tue, 24 Oct 2023 19:52:33 +0000
Received: by outflank-mailman (input) for mailman id 622596;
 Tue, 24 Oct 2023 19:52:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gl3Y=GG=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qvNS3-00077I-QA
 for xen-devel@lists.xenproject.org; Tue, 24 Oct 2023 19:52:31 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dcf6a3b0-72a6-11ee-98d5-6d05b1d4d9a1;
 Tue, 24 Oct 2023 21:52:30 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id C47C6CE2302;
 Tue, 24 Oct 2023 19:52:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F362AC433C7;
 Tue, 24 Oct 2023 19:52:24 +0000 (UTC)
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
X-Inumbo-ID: dcf6a3b0-72a6-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698177146;
	bh=AF/a56YM2zgu7bVas5scozwm6y7H3Nt0k7wj1+Tfu/0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=DBXIlolrHUt/YOWQpT5HfsoqoaBhyprlwj8T99AnEy+qrLgCraaDe8+hgs+pdqsLb
	 dYWpWuOZksKwHJ6fR2PT8KZvgoeCEbDQ0TkUFU11897E5qattdi9zmPoAi/Ri6vo1z
	 6Cq4yt49WaWNlIzTGonJMkAPB3lNaYdob9HnlVh3+mZB1WanzVme8HjlPvNswzbwoF
	 pxgGYXSFJqcF2mVaGLlsubPhGqy1KzlCBJQ8sLqp6Yje19BnUlYla886QhZty+jbZq
	 UpRyU5sNsDbLxJCCeODuDlNidhUPYm0KUQw5DS5BbgfbqOwdVK73zSJAv8QJiDZY+o
	 n/ftge0fz256w==
Date: Tue, 24 Oct 2023 12:52:23 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
cc: Julien Grall <julien@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>, 
    Henry Wang <Henry.Wang@arm.com>, 
    "michal.orzel@amd.com" <michal.orzel@amd.com>, 
    Julien Grall <jgrall@amazon.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH for-4.19 v2] docs/arm: Document where Xen should be loaded
 in memory
In-Reply-To: <F5195B0D-C337-4221-9395-56F625497671@arm.com>
Message-ID: <alpine.DEB.2.22.394.2310241252140.271731@ubuntu-linux-20-04-desktop>
References: <20231024102858.29067-1-julien@xen.org> <F5195B0D-C337-4221-9395-56F625497671@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 24 Oct 2023, Bertrand Marquis wrote:
> Hi Julien,
> 
> > On 24 Oct 2023, at 12:28, Julien Grall <julien@xen.org> wrote:
> > 
> > From: Julien Grall <jgrall@amazon.com>
> > 
> > In commit 9d267c049d92 ("xen/arm64: Rework the memory layout"),
> > we decided to require Xen to be loaded below 2 TiB to simplify
> > the logic to enable the MMU. The limit was decided based on
> > how known platform boot plus some slack.
> > 
> > We had a recent report that this is not sufficient on the AVA
> > platform with a old firmware [1]. But the restriction is not
> > going to change in Xen 4.18. So document the limit clearly
> > in docs/misc/arm/booting.txt.
> > 
> > [1] https://lore.kernel.org/20231013122658.1270506-3-leo.yan@linaro.org
> > 
> > Signed-off-by: Julien Grall <jgrall@amazon.com>
> > Reviewed-by: Michal Orzel <michal.orzel@amd.com>
> 
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Added for for-4.19

