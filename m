Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ABE921C5BF
	for <lists+xen-devel@lfdr.de>; Sat, 11 Jul 2020 20:26:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1juKBP-0006B7-Oo; Sat, 11 Jul 2020 18:25:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XzhJ=AW=kernel.org=pr-tracker-bot@srs-us1.protection.inumbo.net>)
 id 1juKBO-0006B2-C2
 for xen-devel@lists.xenproject.org; Sat, 11 Jul 2020 18:25:06 +0000
X-Inumbo-ID: d779f4e8-c3a3-11ea-90e6-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d779f4e8-c3a3-11ea-90e6-12813bfff9fa;
 Sat, 11 Jul 2020 18:25:05 +0000 (UTC)
Subject: Re: [GIT PULL] xen: branch for v5.8-rc5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594491904;
 bh=aRDoA7AMBzG3Y1+sI4J7hKyfzMcAetRpZkvTH+3d4yo=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=uMms6/j75GgQiY8o2tjDogC6jOYWJ/FYmW0coQHJcc1ZAqeGqt0CCuSO23Xx8oXg5
 aH+NVMDVwv0f/Mgc9HPllsQl7L43Ul0p5MmPbOiIVUWrILTc6wZgWOVm+j3+X78Jbv
 eC2h//O3sFO+MB6X6WmB26Us4X9WPFDNtejcA0/I=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20200711125224.14225-1-jgross@suse.com>
References: <20200711125224.14225-1-jgross@suse.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200711125224.14225-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git
 for-linus-5.8b-rc5-tag
X-PR-Tracked-Commit-Id: ba8c423488974f02b538e9dc1730f0334f9b85aa
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 0aea6d5c5be33ce94c16f9ab2f64de1f481f424b
Message-Id: <159449190473.25373.7244067193903548460.pr-tracker-bot@kernel.org>
Date: Sat, 11 Jul 2020 18:25:04 +0000
To: Juergen Gross <jgross@suse.com>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com,
 torvalds@linux-foundation.org, linux-kernel@vger.kernel.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

The pull request you sent on Sat, 11 Jul 2020 14:52:24 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.8b-rc5-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/0aea6d5c5be33ce94c16f9ab2f64de1f481f424b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker

