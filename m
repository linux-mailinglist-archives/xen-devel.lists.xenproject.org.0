Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A0C6CC0E0
	for <lists+xen-devel@lfdr.de>; Tue, 28 Mar 2023 15:30:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515835.799073 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ph9P7-0003yC-5j; Tue, 28 Mar 2023 13:30:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515835.799073; Tue, 28 Mar 2023 13:30:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ph9P7-0003uu-1m; Tue, 28 Mar 2023 13:30:25 +0000
Received: by outflank-mailman (input) for mailman id 515835;
 Tue, 28 Mar 2023 13:30:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z0Zt=7U=kernel.org=patchwork-bot+netdevbpf@srs-se1.protection.inumbo.net>)
 id 1ph9P4-0003uh-T7
 for xen-devel@lists.xenproject.org; Tue, 28 Mar 2023 13:30:22 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id af813c56-cd6c-11ed-85db-49a42c6b2330;
 Tue, 28 Mar 2023 15:30:21 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 956BE617C3;
 Tue, 28 Mar 2023 13:30:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DF534C433A7;
 Tue, 28 Mar 2023 13:30:18 +0000 (UTC)
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 BE71DE50D77; Tue, 28 Mar 2023 13:30:18 +0000 (UTC)
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
X-Inumbo-ID: af813c56-cd6c-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680010218;
	bh=wAOqKXa5k+PpvaTqojjqTGvRwfUjAI5kHX4cGuCo+zg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=uYFmZ+KCxb84fhWh6BTAOpT75G1dlq265BRyJH9EwV+5fNqyj3t1NNe3aEKjwz49z
	 /7k2Zjq5O+zK7A0piXnv5r2oPRwUpKWezf/XSaRx4x/92BArDGtSAcOI/iicezlmjB
	 0947QOThA8fpXzkBlpXJdFni1ygDCQIOeY7LmyqK5u1kTBjBvMfy649GCcYY9Yg0za
	 1x2jFsD6J+wRbxLqZmxrUs8F1qIwQ5iou6lt4p+XAU6m7ejMvlW3BOtimwKJ5vnihi
	 adc6QkoW9kYQnYXxxPHqmcjU+cWtGdwQGsoLrfOcR0tpc1xzGtb+xuNkh4r9p5npHt
	 P7oWeNeAswnYA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 0/3] xen/netback: fix issue introduced recently
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <168001021877.12098.5546775808625533153.git-patchwork-notify@kernel.org>
Date: Tue, 28 Mar 2023 13:30:18 +0000
References: <20230328131047.2440-1-jgross@suse.com>
In-Reply-To: <20230328131047.2440-1-jgross@suse.com>
To: Juergen Gross <jgross@suse.com>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org, wei.liu@kernel.org,
 paul@xen.org, davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, xen-devel@lists.xenproject.org, stable@vger.kernel.org

Hello:

This series was applied to netdev/net.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Tue, 28 Mar 2023 15:10:44 +0200 you wrote:
> The fix for XSA-423 introduced a bug which resulted in loss of network
> connection in some configurations.
> 
> The first patch is fixing the issue, while the second one is removing
> a test which isn't needed. The third patch is making error messages
> more uniform.
> 
> [...]

Here is the summary with links:
  - [v2,1/3] xen/netback: don't do grant copy across page boundary
    (no matching commit)
  - [v2,2/3] xen/netback: remove not needed test in xenvif_tx_build_gops()
    https://git.kernel.org/netdev/net/c/8fb8ebf94877
  - [v2,3/3] xen/netback: use same error messages for same errors
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



