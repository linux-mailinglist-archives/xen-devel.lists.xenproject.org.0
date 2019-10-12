Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E2ED52E9
	for <lists+xen-devel@lfdr.de>; Sat, 12 Oct 2019 23:46:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iJP7Q-0002Ak-FC; Sat, 12 Oct 2019 21:40:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=MKyS=YF=kernel.org=pr-tracker-bot@srs-us1.protection.inumbo.net>)
 id 1iJP7P-00027H-8r
 for xen-devel@lists.xenproject.org; Sat, 12 Oct 2019 21:40:07 +0000
X-Inumbo-ID: db4899e0-ed38-11e9-beca-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id db4899e0-ed38-11e9-beca-bc764e2007e4;
 Sat, 12 Oct 2019 21:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1570916406;
 bh=znUtNYlMCDy5GBQ4k9C9rKMZwsaQWIJYVlzdC2I/K2k=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=j/Nbg1vjrmcUnNpEcr3SW0/HYGuasjREk3l98kg7dU0rjQfdDYRtGGLQqmpmRfN0A
 s2FNiefLwYY38RgjpIvzc/Z1emWx8mGwzqGaAO627/lFO15ouFho9wPKPltiBGxX1u
 sw1/PaZvOxdMJPH5kzgaI32Tb02CTMt51nzIUPC8=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20191012105131.10908-1-jgross@suse.com>
References: <20191012105131.10908-1-jgross@suse.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20191012105131.10908-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git
 for-linus-5.4-rc3-tag
X-PR-Tracked-Commit-Id: ee7f5225dc3cc7c19df1603597532ff34571f895
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 680b5b3c5d34b22695357e17b6bdd0abd83e6b1c
Message-Id: <157091640613.3377.9655167394267054654.pr-tracker-bot@kernel.org>
Date: Sat, 12 Oct 2019 21:40:06 +0000
To: Juergen Gross <jgross@suse.com>
Subject: Re: [Xen-devel] [GIT PULL] xen: fixes for 5.4-rc3
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

VGhlIHB1bGwgcmVxdWVzdCB5b3Ugc2VudCBvbiBTYXQsIDEyIE9jdCAyMDE5IDEyOjUxOjMxICsw
MjAwOgoKPiBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQveGVu
L3RpcC5naXQgZm9yLWxpbnVzLTUuNC1yYzMtdGFnCgpoYXMgYmVlbiBtZXJnZWQgaW50byB0b3J2
YWxkcy9saW51eC5naXQ6Cmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvdG9ydmFsZHMvYy82ODBiNWIz
YzVkMzRiMjI2OTUzNTdlMTdiNmJkZDBhYmQ4M2U2YjFjCgpUaGFuayB5b3UhCgotLSAKRGVldC1k
b290LWRvdCwgSSBhbSBhIGJvdC4KaHR0cHM6Ly9rb3JnLndpa2kua2VybmVsLm9yZy91c2VyZG9j
L3BydHJhY2tlcgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
