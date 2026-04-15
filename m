Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WPlvEc0T4GmPcQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2026 00:40:13 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8954408BE7
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2026 00:40:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1282908.1565272 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wD8t0-0005U5-AP; Wed, 15 Apr 2026 22:39:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1282908.1565272; Wed, 15 Apr 2026 22:39:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wD8t0-0005R5-4E; Wed, 15 Apr 2026 22:39:06 +0000
Received: by outflank-mailman (input) for mailman id 1282908;
 Wed, 15 Apr 2026 22:39:04 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <pr-tracker-bot@kernel.org>) id 1wD8sy-0005Qz-4v
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2026 22:39:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wD8sw-00E5Hm-U4
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2026 00:39:02 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <pr-tracker-bot@kernel.org>)
 id 69e012c8-5cb7-0a2a0a5109dd-0a2a4509e116-46
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 00:39:02 +0200
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <pr-tracker-bot@kernel.org>)
 id 69e01385-bf79-0a2a45090019-aceafc1fcc34-3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 00:39:02 +0200
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B2D6443EE4;
 Wed, 15 Apr 2026 22:39:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 913CFC19424;
 Wed, 15 Apr 2026 22:39:00 +0000 (UTC)
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 02E1F380A963; Wed, 15 Apr 2026 22:38:31 +0000 (UTC)
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
	s=k20201202; t=1776292740;
	bh=u4aKVvdutaNNPEDn+NYqz5QpfufNxXnKjBN8Ribs3ZQ=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=IT48Gtjyce80EYKaU8/WL2Tpivb8lzW34m5HhRTrKjRR2+v327S0Kil1B7g/V9a7x
	 vuK1vNkL1Rzxgpg1vJldi5e2aAtfFaplU2pSEup/Z62cbLQcxz6hkkHzpxCiJh9cvT
	 B4BZV0ouNttUSlBHmKiSxa2IUE1Sy/22rxiQDoUeV1fQ9QoFBr/yx06POw8vhWL8qu
	 U8D/MX5fgodYbLjMSWOiMYU9Xp1XrdEL2ik0Bke8OGZ/usse/zBsh1bXsyfJaJ1Xo5
	 IlmcdwzDTc/r0oUmAnv4FihOlHflZJTSnobqO8Ecfh7ERqXWoHAW25SM0OUXoQzcmr
	 MpA4467VzqfoA==
Subject: Re: [GIT PULL] xen: branch for v7.1-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260412062202.627248-1-jgross@suse.com>
References: <20260412062202.627248-1-jgross@suse.com>
X-PR-Tracked-List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
X-PR-Tracked-Message-Id: <20260412062202.627248-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-7.1-rc1-tag
X-PR-Tracked-Commit-Id: 3f100dd61ad4ee7c1fb6a44775a928dcdba7515b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 83964553e8a94217edf961994ea0ca722d297447
Message-Id: <177629270956.2482053.15639149570997116080.pr-tracker-bot@kernel.org>
Date: Wed, 15 Apr 2026 22:38:29 +0000
To: Juergen Gross <jgross@suse.com>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, sstabellini@kernel.org
X-purgate-ID: tlsNG-bad1c0/1776292742-54B58152-9B4BF6EB/0/0
X-purgate-type: clean
X-purgate-size: 362
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
	NEURAL_HAM(-0.00)[-0.968];
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
X-Rspamd-Queue-Id: D8954408BE7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The pull request you sent on Sun, 12 Apr 2026 08:22:02 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-7.1-rc1-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/83964553e8a94217edf961994ea0ca722d297447

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

