Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04304BFA7F
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 22:13:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDa5u-0004Z6-P3; Thu, 26 Sep 2019 20:10:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gZqL=XV=kernel.org=pr-tracker-bot@srs-us1.protection.inumbo.net>)
 id 1iDa5s-0004Z1-R9
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 20:10:28 +0000
X-Inumbo-ID: aeee1eac-e099-11e9-bf31-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by localhost (Halon) with ESMTPS
 id aeee1eac-e099-11e9-bf31-bc764e2007e4;
 Thu, 26 Sep 2019 20:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1569528627;
 bh=rGDoo2MYW+dR1gVcq1CSyeMAXd+itqo1MMRtZrRXBxM=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=UBRrtMvHwgwNhd1qSCDhKeXHcmYDvz26Pe18uZl+WIkMEdg8efJteSoZQT/f1Ripq
 0eel7llD7EUrownzTeNY4+O6cV8Vq4ZuutevJXsdvtih0zU9D07J6RJU11fXUP2pVE
 YUbTh/KEiFyvuPKgcCrnFpdenesCntEFau6nf6M0=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20190926141743.25426-1-jgross@suse.com>
References: <20190926141743.25426-1-jgross@suse.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20190926141743.25426-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git
 for-linus-5.4-rc1-tag
X-PR-Tracked-Commit-Id: a4098bc6eed5e31e0391bcc068e61804c98138df
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ec56103e18c7590303c69329dd4aaadf8a898c19
Message-Id: <156952862779.24871.12479839643612044427.pr-tracker-bot@kernel.org>
Date: Thu, 26 Sep 2019 20:10:27 +0000
To: Juergen Gross <jgross@suse.com>
Subject: Re: [Xen-devel] [GIT PULL] xen: features for 5.4-rc1
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

VGhlIHB1bGwgcmVxdWVzdCB5b3Ugc2VudCBvbiBUaHUsIDI2IFNlcCAyMDE5IDE2OjE3OjQzICsw
MjAwOgoKPiBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQveGVu
L3RpcC5naXQgZm9yLWxpbnVzLTUuNC1yYzEtdGFnCgpoYXMgYmVlbiBtZXJnZWQgaW50byB0b3J2
YWxkcy9saW51eC5naXQ6Cmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvdG9ydmFsZHMvYy9lYzU2MTAz
ZTE4Yzc1OTAzMDNjNjkzMjlkZDRhYWFkZjhhODk4YzE5CgpUaGFuayB5b3UhCgotLSAKRGVldC1k
b290LWRvdCwgSSBhbSBhIGJvdC4KaHR0cHM6Ly9rb3JnLndpa2kua2VybmVsLm9yZy91c2VyZG9j
L3BydHJhY2tlcgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
