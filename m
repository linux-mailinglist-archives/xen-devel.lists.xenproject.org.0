Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 710408032F
	for <lists+xen-devel@lfdr.de>; Sat,  3 Aug 2019 01:24:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htgqM-00075A-C1; Fri, 02 Aug 2019 23:20:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=d+UD=V6=kernel.org=pr-tracker-bot@srs-us1.protection.inumbo.net>)
 id 1htgqL-000755-6r
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2019 23:20:13 +0000
X-Inumbo-ID: 1329e2aa-b57c-11e9-8a5a-3b85a4ac12c4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1329e2aa-b57c-11e9-8a5a-3b85a4ac12c4;
 Fri, 02 Aug 2019 23:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1564788011;
 bh=3lPqaAxly1FD9PM4K5DpOANPnWOJvGrh2mV6GDIZ+wc=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=MtMFjuTrBaMA/B28MsUqFszAeQEc8Fm4TCfcb2J6Sw/6+vOpjFLFK/kECSPiJFKF9
 zb9sIJb22aFtSqACU+AdW9y9JIFFOhWqQ/uHnvjN5buMmbZEKcze1P91E77lhPlk4q
 3WP47gLVD1n7XRPdTF+wwM9wV9INWjcZpoG5bxMU=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20190802144746.18653-1-jgross@suse.com>
References: <20190802144746.18653-1-jgross@suse.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20190802144746.18653-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git
 for-linus-5.3a-rc3-tag
X-PR-Tracked-Commit-Id: b877ac9815a8fe7e5f6d7fdde3dc34652408840a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: dcb8cfbd8fe9e62c7d64e82288d3ffe2502b7371
Message-Id: <156478801106.22769.3689998217625205699.pr-tracker-bot@kernel.org>
Date: Fri, 02 Aug 2019 23:20:11 +0000
To: Juergen Gross <jgross@suse.com>
Subject: Re: [Xen-devel] [GIT PULL] xen: fixes for 5.3-rc3
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

VGhlIHB1bGwgcmVxdWVzdCB5b3Ugc2VudCBvbiBGcmksICAyIEF1ZyAyMDE5IDE2OjQ3OjQ2ICsw
MjAwOgoKPiBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQveGVu
L3RpcC5naXQgZm9yLWxpbnVzLTUuM2EtcmMzLXRhZwoKaGFzIGJlZW4gbWVyZ2VkIGludG8gdG9y
dmFsZHMvbGludXguZ2l0OgpodHRwczovL2dpdC5rZXJuZWwub3JnL3RvcnZhbGRzL2MvZGNiOGNm
YmQ4ZmU5ZTYyYzdkNjRlODIyODhkM2ZmZTI1MDJiNzM3MQoKVGhhbmsgeW91IQoKLS0gCkRlZXQt
ZG9vdC1kb3QsIEkgYW0gYSBib3QuCmh0dHBzOi8va29yZy53aWtpLmtlcm5lbC5vcmcvdXNlcmRv
Yy9wcnRyYWNrZXIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
