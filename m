Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C95921537FF
	for <lists+xen-devel@lfdr.de>; Wed,  5 Feb 2020 19:24:06 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izPHf-0008Sy-34; Wed, 05 Feb 2020 18:20:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=b7x6=3Z=kernel.org=pr-tracker-bot@srs-us1.protection.inumbo.net>)
 id 1izPHd-0008St-86
 for xen-devel@lists.xenproject.org; Wed, 05 Feb 2020 18:20:17 +0000
X-Inumbo-ID: 2837d567-4844-11ea-9183-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2837d567-4844-11ea-9183-12813bfff9fa;
 Wed, 05 Feb 2020 18:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1580926816;
 bh=yuBrlgCSyNpGr7f0LkdGSKgVKnHVeUJjNZG0igVS9No=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=nzH9OKtg7Wr17/acZ5zPdO4nd6vpEVmHl1rP1B4nTRnmGk+3bHyRZHpfwPTDKvdiK
 C0eETZgCkjnldURs8faFa2ds7o8EUogzUfLFo3eJD2nK8GvXgm9GMbhXM2fW8AU3q/
 NzjDLSUr4RhhXOOFV4Qe/APvd10GeR8x0xZvRoq0=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20200205141135.31595-1-jgross@suse.com>
References: <20200205141135.31595-1-jgross@suse.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200205141135.31595-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git
 for-linus-5.6-rc1-tag
X-PR-Tracked-Commit-Id: 8557bbe5156e5fba022d5a5220004b1e016227ee
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d271ab29230b1d0ceb426f374c221c4eb2c91c64
Message-Id: <158092681621.14135.14219430235179173763.pr-tracker-bot@kernel.org>
Date: Wed, 05 Feb 2020 18:20:16 +0000
To: Juergen Gross <jgross@suse.com>
Subject: Re: [Xen-devel] [GIT PULL] xen: branch for v5.6-rc1
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

VGhlIHB1bGwgcmVxdWVzdCB5b3Ugc2VudCBvbiBXZWQsICA1IEZlYiAyMDIwIDE1OjExOjM1ICsw
MTAwOgoKPiBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQveGVu
L3RpcC5naXQgZm9yLWxpbnVzLTUuNi1yYzEtdGFnCgpoYXMgYmVlbiBtZXJnZWQgaW50byB0b3J2
YWxkcy9saW51eC5naXQ6Cmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvdG9ydmFsZHMvYy9kMjcxYWIy
OTIzMGIxZDBjZWI0MjZmMzc0YzIyMWM0ZWIyYzkxYzY0CgpUaGFuayB5b3UhCgotLSAKRGVldC1k
b290LWRvdCwgSSBhbSBhIGJvdC4KaHR0cHM6Ly9rb3JnLndpa2kua2VybmVsLm9yZy91c2VyZG9j
L3BydHJhY2tlcgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
