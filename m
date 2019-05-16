Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C59A1FDA9
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2019 04:09:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hR5lo-0004In-4U; Thu, 16 May 2019 02:05:20 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=txn5=TQ=kernel.org=pr-tracker-bot@srs-us1.protection.inumbo.net>)
 id 1hR5lm-0004Ii-K9
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 02:05:18 +0000
X-Inumbo-ID: 0c7efc8f-777f-11e9-8980-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 0c7efc8f-777f-11e9-8980-bc764e045a96;
 Thu, 16 May 2019 02:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1557972316;
 bh=yocQkfCukBWdRxj6GDjIJdKz/yKT0Z6vYKodjve73FA=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=KlnVbxW2grb7GChG9RydzLdUvej+MOuPcve4vjxd8w7okIS6lQ/Cs77ozzR1KsVzM
 M0myICrAl3EJkC5wzD+vMGHaQSDAAViqKlG9mTcX6Vv8VXSwvTYEwazZ4Y/fMx9MJi
 kL/vyymM2z9tLGjMNzfHlsxoT9dWEY2AA+7b/JM0=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20190515183850.26413-1-jgross@suse.com>
References: <20190515183850.26413-1-jgross@suse.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20190515183850.26413-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git
 for-linus-5.2b-rc1-tag
X-PR-Tracked-Commit-Id: fe846979d30576107aa9910e1820fec3c20e62d7
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 5fd09ba68297c967f5ba6bea9c3b444d34f80ee5
Message-Id: <155797231626.20425.6027760486599927607.pr-tracker-bot@kernel.org>
Date: Thu, 16 May 2019 02:05:16 +0000
To: Juergen Gross <jgross@suse.com>
Subject: Re: [Xen-devel] [GIT PULL] xen: fixes and features for 5.2-rc1
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

VGhlIHB1bGwgcmVxdWVzdCB5b3Ugc2VudCBvbiBXZWQsIDE1IE1heSAyMDE5IDIwOjM4OjUwICsw
MjAwOgoKPiBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQveGVu
L3RpcC5naXQgZm9yLWxpbnVzLTUuMmItcmMxLXRhZwoKaGFzIGJlZW4gbWVyZ2VkIGludG8gdG9y
dmFsZHMvbGludXguZ2l0OgpodHRwczovL2dpdC5rZXJuZWwub3JnL3RvcnZhbGRzL2MvNWZkMDli
YTY4Mjk3Yzk2N2Y1YmE2YmVhOWMzYjQ0NGQzNGY4MGVlNQoKVGhhbmsgeW91IQoKLS0gCkRlZXQt
ZG9vdC1kb3QsIEkgYW0gYSBib3QuCmh0dHBzOi8va29yZy53aWtpLmtlcm5lbC5vcmcvdXNlcmRv
Yy9wcnRyYWNrZXIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
