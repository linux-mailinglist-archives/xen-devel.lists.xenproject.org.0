Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aDO3FlnJmGl7MQMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 20 Feb 2026 21:51:37 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C2416AC8C
	for <lists+xen-devel@lfdr.de>; Fri, 20 Feb 2026 21:51:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1237584.1539831 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtXSO-00028p-Jf; Fri, 20 Feb 2026 20:50:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1237584.1539831; Fri, 20 Feb 2026 20:50:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtXSO-00027j-Eh; Fri, 20 Feb 2026 20:50:36 +0000
Received: by outflank-mailman (input) for mailman id 1237584;
 Fri, 20 Feb 2026 20:50:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b+hA=AY=kernel.org=pr-tracker-bot@srs-se1.protection.inumbo.net>)
 id 1vtXSM-00027b-KY
 for xen-devel@lists.xenproject.org; Fri, 20 Feb 2026 20:50:34 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org
 [2600:3c0a:e001:78e:0:1991:8:25])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cbd45f8c-0e9d-11f1-b164-2bf370ae4941;
 Fri, 20 Feb 2026 21:50:33 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 1F57B441FC;
 Fri, 20 Feb 2026 20:50:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2C14C116C6;
 Fri, 20 Feb 2026 20:50:30 +0000 (UTC)
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 056E43808200; Fri, 20 Feb 2026 20:50:40 +0000 (UTC)
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
X-Inumbo-ID: cbd45f8c-0e9d-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771620631;
	bh=3dRYbSGOYHNdFaNWK6wZcdevTB2Eb6ruwxO03ukN0z8=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=db9IO140/sAYMpwqAFdXRVLITwcmjIUSz1s35plpFkKbFgjfAM7L3GNWleJiJtZE9
	 6IwfBm8jqy+AXiyI25P5tJPZZE8Kst+HasVKdJucTbjRxag64bDy8ct/3pH9VjAXtL
	 DJcFTe6keEJcsLOl8hBxYt79t+JphnOskiQjwaSXb7bf8DxowHffUwm59k5YKfCOq4
	 /N79Avczmh8Xg10iemB/UQNI9MW/KFXcYlWjkXTQXrLp1EZ3/g9E744+fwd8CLVapv
	 I4zKy+BF/EW5/vthrPIkyTZtS1Z+7fFSujUxkNOggoK8eVA8W8lYETIaAUkj8RErnI
	 WipmMWLaWTQJg==
Subject: Re: [GIT PULL] xen: branch for v7.0-rc1a
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260220123715.834848-1-jgross@suse.com>
References: <20260220123715.834848-1-jgross@suse.com>
X-PR-Tracked-List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
X-PR-Tracked-Message-Id: <20260220123715.834848-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-7.0-rc1a-tag
X-PR-Tracked-Commit-Id: 5043d7ed39dfdce3107d6642aa31bb7736547104
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c8cb804a8add8d6f41b3805441b2ad16e30fbcc0
Message-Id: <177162063897.902486.12071756067544962355.pr-tracker-bot@kernel.org>
Date: Fri, 20 Feb 2026 20:50:38 +0000
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
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[pr-tracker-bot@kernel.org,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:jgross@suse.com,m:torvalds@linux-foundation.org,m:linux-kernel@vger.kernel.org,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pr-tracker-bot@kernel.org,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[xen-devel];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: F1C2416AC8C
X-Rspamd-Action: no action

The pull request you sent on Fri, 20 Feb 2026 13:37:15 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-7.0-rc1a-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c8cb804a8add8d6f41b3805441b2ad16e30fbcc0

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

