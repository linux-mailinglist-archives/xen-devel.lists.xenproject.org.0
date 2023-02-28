Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E0756A5042
	for <lists+xen-devel@lfdr.de>; Tue, 28 Feb 2023 01:47:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.502986.775074 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWo8g-00043b-Tm; Tue, 28 Feb 2023 00:46:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 502986.775074; Tue, 28 Feb 2023 00:46:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWo8g-00041Y-R5; Tue, 28 Feb 2023 00:46:42 +0000
Received: by outflank-mailman (input) for mailman id 502986;
 Tue, 28 Feb 2023 00:46:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gVHU=6Y=kernel.org=patchwork-bot+netdevbpf@srs-se1.protection.inumbo.net>)
 id 1pWo8e-00041N-Vl
 for xen-devel@lists.xenproject.org; Tue, 28 Feb 2023 00:46:41 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5bcd4d06-b701-11ed-9689-2f268f93b82a;
 Tue, 28 Feb 2023 01:46:38 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8EDD4B80DD6;
 Tue, 28 Feb 2023 00:46:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4A1A5C433D2;
 Tue, 28 Feb 2023 00:46:36 +0000 (UTC)
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 29902E1CF31; Tue, 28 Feb 2023 00:46:36 +0000 (UTC)
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
X-Inumbo-ID: 5bcd4d06-b701-11ed-9689-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677545196;
	bh=bwOp4yx50VaNVXym63VvR5fZ9BdHxXUqyY+m544YWks=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=YxPm8N3ab3cZpy5YrbfoDNAjYJQuo4IGt6Gy1eCb8mGB3+xd78v9Fg+z6M51hlF/X
	 2bQkOiCVqR+FS/3g2jF78ht/6YMNWjO1Fxip6D0fKTv/BPRUp+/an8tlj6AVMLI+gR
	 IDFk8+emzDuiO/R5Cyf2JDAw1Ig2r/XLWXisPn9ooTqvpLlechPB58Vg+xfZ3DqX7L
	 601gFyyCclePHqR5sNpSJ8V7olJPmb5aJq0WQLTQa79lJl0hUfSTAQHQkcg4xtuvD2
	 GvC3rDtSj/jIjcW8qiiKHcJnJlXDbGLC5Uc5vLw/dAhtu1SgjD3cR/LRmbHBdXXVi+
	 x05PP8BFuYX1A==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] xen-netback: remove unused variables pending_idx and index
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <167754519616.16363.18059153345889882200.git-patchwork-notify@kernel.org>
Date: Tue, 28 Feb 2023 00:46:36 +0000
References: <20230226163429.2351600-1-trix@redhat.com>
In-Reply-To: <20230226163429.2351600-1-trix@redhat.com>
To: Tom Rix <trix@redhat.com>
Cc: wei.liu@kernel.org, paul@xen.org, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 xen-devel@lists.xenproject.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Sun, 26 Feb 2023 11:34:29 -0500 you wrote:
> building with gcc and W=1 reports
> drivers/net/xen-netback/netback.c:886:21: error: variable
>   ‘pending_idx’ set but not used [-Werror=unused-but-set-variable]
>   886 |                 u16 pending_idx;
>       |                     ^~~~~~~~~~~
> 
> pending_idx is not used so remove it.  Since index was only
> used to set pending_idx, remove index as well.
> 
> [...]

Here is the summary with links:
  - xen-netback: remove unused variables pending_idx and index
    https://git.kernel.org/netdev/net-next/c/ccf8f7d71424

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



