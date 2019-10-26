Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B898E59AA
	for <lists+xen-devel@lfdr.de>; Sat, 26 Oct 2019 12:48:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iOJZG-0003UH-A0; Sat, 26 Oct 2019 10:45:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Oipd=YT=kernel.org=pr-tracker-bot@srs-us1.protection.inumbo.net>)
 id 1iOJZE-0003UC-GR
 for xen-devel@lists.xenproject.org; Sat, 26 Oct 2019 10:45:08 +0000
X-Inumbo-ID: acfc2bb0-f7dd-11e9-a531-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id acfc2bb0-f7dd-11e9-a531-bc764e2007e4;
 Sat, 26 Oct 2019 10:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1572086707;
 bh=vuX0mLtS2i1js8YqglJXqcFvIBJ66VDQc0smN03qMZI=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=QxreTIiqgZvNZ0chewOHBcnm3hZt3+X+Vj0lBxuWtq57rT3iHlPYMUIpQwZHT50Ie
 2E/011JN6C63RuzuE/tbjw94aNO5GL5+bGZXetF0/pnPXQbIraK1yPLzCzv1pY7B/Z
 uXpMLj+ofmgMdn2wRWEjpeQwq6K7lztRcJXhcZYQ=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20191026090740.9581-1-jgross@suse.com>
References: <20191026090740.9581-1-jgross@suse.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20191026090740.9581-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git
 for-linus-5.4-rc5-tag
X-PR-Tracked-Commit-Id: 6ccae60d014d5d1f89c40e7e4b619f343ca24b03
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4fac2407f809e2ccc846bcce1d62ebbf7b0a1cd2
Message-Id: <157208670702.20302.921862092816517381.pr-tracker-bot@kernel.org>
Date: Sat, 26 Oct 2019 10:45:07 +0000
To: Juergen Gross <jgross@suse.com>
Subject: Re: [Xen-devel] [GIT PULL] xen: patch for 5.4-rc5
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
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
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIHB1bGwgcmVxdWVzdCB5b3Ugc2VudCBvbiBTYXQsIDI2IE9jdCAyMDE5IDExOjA3OjQwICsw
MjAwOgoKPiBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQveGVu
L3RpcC5naXQgZm9yLWxpbnVzLTUuNC1yYzUtdGFnCgpoYXMgYmVlbiBtZXJnZWQgaW50byB0b3J2
YWxkcy9saW51eC5naXQ6Cmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvdG9ydmFsZHMvYy80ZmFjMjQw
N2Y4MDllMmNjYzg0NmJjY2UxZDYyZWJiZjdiMGExY2QyCgpUaGFuayB5b3UhCgotLSAKRGVldC1k
b290LWRvdCwgSSBhbSBhIGJvdC4KaHR0cHM6Ly9rb3JnLndpa2kua2VybmVsLm9yZy91c2VyZG9j
L3BydHJhY2tlcgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
