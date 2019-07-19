Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61AA76EB57
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jul 2019 21:47:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hoYon-0002oZ-K7; Fri, 19 Jul 2019 19:45:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Lf9h=VQ=kernel.org=pr-tracker-bot@srs-us1.protection.inumbo.net>)
 id 1hoYol-0002oU-OA
 for xen-devel@lists.xenproject.org; Fri, 19 Jul 2019 19:45:23 +0000
X-Inumbo-ID: bf13aa12-aa5d-11e9-9104-4b35565bed14
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bf13aa12-aa5d-11e9-9104-4b35565bed14;
 Fri, 19 Jul 2019 19:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1563565522;
 bh=CGRxQv/GFiGKqoQDynBkDgPXgDmPnH0of257ZhcDg6M=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=Zaa7VI4e+tqf6Vs7ccZlFNARjjLID9DNrF+5pz2WWaa1cF2qeX8UMyJokmdkT5DN3
 PPwu5q8/Qs+NdbzdNUsxlXE5iTvcph97AuKoMSWSkGX70FFmYdIsb2rF2DJvWnnzuW
 ol1pigZ95X62fQx0xMYqwue4WZFZTBVvwJGTH6mA=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20190719060925.10614-1-jgross@suse.com>
References: <20190719060925.10614-1-jgross@suse.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20190719060925.10614-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git
 for-linus-5.3a-rc1-tag
X-PR-Tracked-Commit-Id: a1078e821b605813b63bf6bca414a85f804d5c66
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b5d72dda8976e878be47415b94bca8465d1fa22d
Message-Id: <156356552226.25668.12773277434931748832.pr-tracker-bot@kernel.org>
Date: Fri, 19 Jul 2019 19:45:22 +0000
To: Juergen Gross <jgross@suse.com>
Subject: Re: [Xen-devel] [GIT PULL] xen: fixes and features for 5.3-rc1
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

VGhlIHB1bGwgcmVxdWVzdCB5b3Ugc2VudCBvbiBGcmksIDE5IEp1bCAyMDE5IDA4OjA5OjI1ICsw
MjAwOgoKPiBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQveGVu
L3RpcC5naXQgZm9yLWxpbnVzLTUuM2EtcmMxLXRhZwoKaGFzIGJlZW4gbWVyZ2VkIGludG8gdG9y
dmFsZHMvbGludXguZ2l0OgpodHRwczovL2dpdC5rZXJuZWwub3JnL3RvcnZhbGRzL2MvYjVkNzJk
ZGE4OTc2ZTg3OGJlNDc0MTViOTRiY2E4NDY1ZDFmYTIyZAoKVGhhbmsgeW91IQoKLS0gCkRlZXQt
ZG9vdC1kb3QsIEkgYW0gYSBib3QuCmh0dHBzOi8va29yZy53aWtpLmtlcm5lbC5vcmcvdXNlcmRv
Yy9wcnRyYWNrZXIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
