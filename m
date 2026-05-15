Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iCJwIa99B2qQ5gIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 22:10:23 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9835574E7
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 22:10:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1310529.1581392 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNyr6-0006Su-Ic; Fri, 15 May 2026 20:09:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1310529.1581392; Fri, 15 May 2026 20:09:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNyr6-0006Qu-FU; Fri, 15 May 2026 20:09:56 +0000
Received: by outflank-mailman (input) for mailman id 1310529;
 Fri, 15 May 2026 20:09:55 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <pr-tracker-bot@kernel.org>) id 1wNyr5-0006Qm-G7
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 20:09:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNyr4-002IP9-SZ
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 22:09:54 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <pr-tracker-bot@kernel.org>)
 id 6a077ce3-bab6-0a2a0a5309dd-0a2a4501e286-48
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 22:09:54 +0200
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <pr-tracker-bot@kernel.org>)
 id 6a077d91-c1f2-0a2a45010019-aceafc1f982a-3
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 22:09:54 +0200
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A964A41A82;
 Fri, 15 May 2026 20:09:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D942C2BCC7;
 Fri, 15 May 2026 20:09:52 +0000 (UTC)
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 198953930A08; Fri, 15 May 2026 20:10:07 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=k20201202 header.d=kernel.org header.i="@kernel.org" header.h="Subject:From:In-Reply-To:References:Date:To:Cc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778875792;
	bh=Jpo5cAcPIqiEuvJJmcqYaYUh19IoUNTWvZHKdkp974U=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=ETFxj9DfueE9AXQ3v0RpmbNNfi0V/7HmOc8V3BRwgvnU4sHdxcIcRQtvONSvufx96
	 +LVoQ83ONgdFIQ7/9fJJrdk/A3HdtFM7KzDDAKPlyVtkLPIKc1aLTsWKbYFqNx3vBa
	 r3AvxSL1QHVXgDBXw0e++Y0pGLCXR0FxIGo/wvnvkLBreo1GY7qdcU25Y+EvPnoYUC
	 PB09Wf8TKRsNWLT+TR6MaOFXY/a8sqKy6AyfINQxNNe12I+7+9YP5KNwHz0l66ctdq
	 3gS67VPduUnbdCFWiaKUgmaYFUsGoy5rLscTgoPJci7bc+jUmYmwcKef9wzbbiHD0b
	 Zoqf8BYcpXnwA==
Subject: Re: [GIT PULL] xen: branch for v7.1-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260515130004.1571139-1-jgross@suse.com>
References: <20260515130004.1571139-1-jgross@suse.com>
X-PR-Tracked-List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
X-PR-Tracked-Message-Id: <20260515130004.1571139-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-7.1b-rc4-tag
X-PR-Tracked-Commit-Id: 4594437880ce347ac8438758fd91543f70da1aa9
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4844e7c4c2697afe63f2b925e2384e0c724cb2be
Message-Id: <177887580600.138467.1546973588089628432.pr-tracker-bot@kernel.org>
Date: Fri, 15 May 2026 20:10:06 +0000
To: Juergen Gross <jgross@suse.com>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, sstabellini@kernel.org
X-purgate-ID: tlsNG-d62444/1778875794-AFB56FF4-0289A142/0/0
X-purgate-type: clean
X-purgate-size: 363
X-Rspamd-Queue-Id: 2D9835574E7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jgross@suse.com,m:torvalds@linux-foundation.org,m:linux-kernel@vger.kernel.org,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[pr-tracker-bot@kernel.org,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pr-tracker-bot@kernel.org,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Action: no action

The pull request you sent on Fri, 15 May 2026 15:00:04 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-7.1b-rc4-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4844e7c4c2697afe63f2b925e2384e0c724cb2be

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

