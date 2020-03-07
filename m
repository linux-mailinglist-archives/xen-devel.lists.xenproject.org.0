Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB89D17CEBB
	for <lists+xen-devel@lfdr.de>; Sat,  7 Mar 2020 15:32:48 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jAaSu-0002yf-FV; Sat, 07 Mar 2020 14:30:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6W5b=4Y=kernel.org=pr-tracker-bot@srs-us1.protection.inumbo.net>)
 id 1jAaSt-0002yW-5Y
 for xen-devel@lists.xenproject.org; Sat, 07 Mar 2020 14:30:07 +0000
X-Inumbo-ID: 240d48dc-6080-11ea-b52f-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 240d48dc-6080-11ea-b52f-bc764e2007e4;
 Sat, 07 Mar 2020 14:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1583591406;
 bh=aqx9wdW6cgs6DwzR9YqYO7lOArZ+awEW6YBOBGrp3MI=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=bDZ2G/PIeycTqk3YVEa2+GD4/ceIG/5gSwYbDresg1n+8o1Uoyp8qUYRc5l/3KxG3
 xSbzjoys00uXWKTq8sOE3S9KDjaE74rfkKWOIVIJ8Ui4VXTEI7+dLtt00yBAH0BZ+k
 dWaN7N2aoUV69HXw1AYPvjlvbRdF1ujIPQbZfZm4=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20200307093617.11819-1-jgross@suse.com>
References: <20200307093617.11819-1-jgross@suse.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200307093617.11819-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git
 for-linus-5.6b-rc5-tag
X-PR-Tracked-Commit-Id: 4ab50af63d2eb5da5c1571f8518948514f535782
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: cbee7c8b4485fb876895b82ddba19ae4e2e2d102
Message-Id: <158359140623.13770.12361787339122894366.pr-tracker-bot@kernel.org>
Date: Sat, 07 Mar 2020 14:30:06 +0000
To: Juergen Gross <jgross@suse.com>
Subject: Re: [Xen-devel] [GIT PULL] xen: branch for v5.6-rc5
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

VGhlIHB1bGwgcmVxdWVzdCB5b3Ugc2VudCBvbiBTYXQsICA3IE1hciAyMDIwIDEwOjM2OjE3ICsw
MTAwOgoKPiBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQveGVu
L3RpcC5naXQgZm9yLWxpbnVzLTUuNmItcmM1LXRhZwoKaGFzIGJlZW4gbWVyZ2VkIGludG8gdG9y
dmFsZHMvbGludXguZ2l0OgpodHRwczovL2dpdC5rZXJuZWwub3JnL3RvcnZhbGRzL2MvY2JlZTdj
OGI0NDg1ZmI4NzY4OTViODJkZGJhMTlhZTRlMmUyZDEwMgoKVGhhbmsgeW91IQoKLS0gCkRlZXQt
ZG9vdC1kb3QsIEkgYW0gYSBib3QuCmh0dHBzOi8va29yZy53aWtpLmtlcm5lbC5vcmcvdXNlcmRv
Yy9wcnRyYWNrZXIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
