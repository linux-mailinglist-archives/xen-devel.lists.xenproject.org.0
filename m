Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8NjZL6+9immmNQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 10 Feb 2026 06:10:07 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66758116FA1
	for <lists+xen-devel@lfdr.de>; Tue, 10 Feb 2026 06:10:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1226065.1532609 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpfza-0006AN-RP; Tue, 10 Feb 2026 05:08:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1226065.1532609; Tue, 10 Feb 2026 05:08:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpfza-00067J-KH; Tue, 10 Feb 2026 05:08:54 +0000
Received: by outflank-mailman (input) for mailman id 1226065;
 Tue, 10 Feb 2026 05:08:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wVxR=AO=kernel.org=pr-tracker-bot@srs-se1.protection.inumbo.net>)
 id 1vpfzZ-00066u-6k
 for xen-devel@lists.xenproject.org; Tue, 10 Feb 2026 05:08:53 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 92d6c0b9-063e-11f1-9ccf-f158ae23cfc8;
 Tue, 10 Feb 2026 06:08:45 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D4FA06013E;
 Tue, 10 Feb 2026 05:08:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B8DCC116C6;
 Tue, 10 Feb 2026 05:08:43 +0000 (UTC)
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 48168380AA5E; Tue, 10 Feb 2026 05:08:40 +0000 (UTC)
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
X-Inumbo-ID: 92d6c0b9-063e-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770700123;
	bh=EM6WIzd3Ikv4AEJNmBcx+mzXy3WzpK9Zspqs4PlJe9Q=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=V7nRWMEQ2FU1r3peQawqWqhbwzsWekeTV9PSjrF55AYkP04cwWDt97ENMZcp6+NTO
	 iSyoJEsbHY8UDdy6Ge0Yu7xM8JE4mWHgew7EV6cApfcni61buSxn9ELEXODQx9LHyV
	 DmRGyzg8rtKhaKNnhOMeZf6hvygYIxFpKnoxNKTX8FQiWn2Zckf+v4Yy8OSDHSoPkS
	 SB9WOMmlfWJ481o2SnzdEOX9a75voqtzqI+PPO/gSxzjSQbT+SQ1xVhDPKYHlQ9+RS
	 CgxWPdQdf+mMBIvIdslvRJQ9NktxV8d6iUx2fDTtwn6c7DQTTd1EaTv6bnCcMEjduc
	 hVDS1cvBa/+rQ==
Subject: Re: [GIT PULL] xen: branch for v7.0-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260209065018.74473-1-jgross@suse.com>
References: <20260209065018.74473-1-jgross@suse.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260209065018.74473-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-7.0-rc1-tag
X-PR-Tracked-Commit-Id: c307b6dc9c4f68d00524ec10899cdf21466b5c1e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 33120a2f8fc47f388506b7df1209bd5ac85dd584
Message-Id: <177070011886.3352335.14505383591657484674.pr-tracker-bot@kernel.org>
Date: Tue, 10 Feb 2026 05:08:38 +0000
To: Juergen Gross <jgross@suse.com>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, sstabellini@kernel.org
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
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[pr-tracker-bot@kernel.org,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FROM_NEQ_ENVFROM(0.00)[pr-tracker-bot@kernel.org,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[xen-devel];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 66758116FA1
X-Rspamd-Action: no action

The pull request you sent on Mon,  9 Feb 2026 07:50:18 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-7.0-rc1-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/33120a2f8fc47f388506b7df1209bd5ac85dd584

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

