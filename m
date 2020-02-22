Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E5E168AE4
	for <lists+xen-devel@lfdr.de>; Sat, 22 Feb 2020 01:18:39 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j5IRx-00060K-N6; Sat, 22 Feb 2020 00:15:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tkJt=4K=kernel.org=pr-tracker-bot@srs-us1.protection.inumbo.net>)
 id 1j5IRw-00060F-2E
 for xen-devel@lists.xenproject.org; Sat, 22 Feb 2020 00:15:16 +0000
X-Inumbo-ID: 661584de-5508-11ea-bc8e-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 661584de-5508-11ea-bc8e-bc764e2007e4;
 Sat, 22 Feb 2020 00:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1582330514;
 bh=w0AXXX5Jnq2K8zg6+WlX1jXoupG0xTojsceuNIVWrxk=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=EcOCVlt9VEUDCBTzS1POuptZJSZwJrbT1nzO7Knrys+Hy7H77RRL9FMdWYbT9d8Xm
 zUudFUjxZPfxyY6ClKViQwi/8RmBBdmzTQ3/5doqIldtuB2ajKA8rOOeyQm8s4o9Dw
 YajPwQkDgShXAlXtzE56yGtURuEPauK3L/MLT20s=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20200221193331.6580-1-jgross@suse.com>
References: <20200221193331.6580-1-jgross@suse.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200221193331.6580-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git
 for-linus-5.6-rc3-tag
X-PR-Tracked-Commit-Id: 8645e56a4ad6dcbf504872db7f14a2f67db88ef2
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 54dedb5b571d2fb0d65c3957ecfa9b32ce28d7f0
Message-Id: <158233051462.15315.1311300506464261075.pr-tracker-bot@kernel.org>
Date: Sat, 22 Feb 2020 00:15:14 +0000
To: Juergen Gross <jgross@suse.com>
Subject: Re: [Xen-devel] [GIT PULL] xen: branch for v5.6-rc3
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

VGhlIHB1bGwgcmVxdWVzdCB5b3Ugc2VudCBvbiBGcmksIDIxIEZlYiAyMDIwIDIwOjMzOjMxICsw
MTAwOgoKPiBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQveGVu
L3RpcC5naXQgZm9yLWxpbnVzLTUuNi1yYzMtdGFnCgpoYXMgYmVlbiBtZXJnZWQgaW50byB0b3J2
YWxkcy9saW51eC5naXQ6Cmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvdG9ydmFsZHMvYy81NGRlZGI1
YjU3MWQyZmIwZDY1YzM5NTdlY2ZhOWIzMmNlMjhkN2YwCgpUaGFuayB5b3UhCgotLSAKRGVldC1k
b290LWRvdCwgSSBhbSBhIGJvdC4KaHR0cHM6Ly9rb3JnLndpa2kua2VybmVsLm9yZy91c2VyZG9j
L3BydHJhY2tlcgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
