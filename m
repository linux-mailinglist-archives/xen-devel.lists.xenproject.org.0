Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30ABD1097C6
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2019 03:18:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZQNj-0002TI-2D; Tue, 26 Nov 2019 02:15:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=K3fo=ZS=kernel.org=pr-tracker-bot@srs-us1.protection.inumbo.net>)
 id 1iZQNh-0002TD-5l
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2019 02:15:09 +0000
X-Inumbo-ID: 91681904-0ff2-11ea-a55d-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 91681904-0ff2-11ea-a55d-bc764e2007e4;
 Tue, 26 Nov 2019 02:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1574734508;
 bh=hwVbSffnhRKL0Pmn2pbkb2Wk7GBDOC6kltJG7nfW+is=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=bUe8+Ro4qvLQyooTbf9KnIM6Vhxy4axSY92SBHk5VRDQuSRQnjB8StjU7XjzOoxBw
 paBGm5iaWcNde3WqeVI3DMsiCTs7L5plNV1bamRqhJx6nooVQAxgg2+wRgZDCsq+k9
 XcH/9enGWfl7iGY2WBWeeAZcG0njCA9eGUuybz8U=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20191125053454.19556-1-jgross@suse.com>
References: <20191125053454.19556-1-jgross@suse.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20191125053454.19556-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git
 for-linus-5.5a-rc1-tag
X-PR-Tracked-Commit-Id: 23c1cce9f3174db9cdc91346cb4320fa6b97e35d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 3f3c8be973af10875cfa1e7b85a535b6ba76b44f
Message-Id: <157473450810.11733.16137638938272108320.pr-tracker-bot@kernel.org>
Date: Tue, 26 Nov 2019 02:15:08 +0000
To: Juergen Gross <jgross@suse.com>
Subject: Re: [Xen-devel] [GIT PULL] xen: fixes for xen
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

VGhlIHB1bGwgcmVxdWVzdCB5b3Ugc2VudCBvbiBNb24sIDI1IE5vdiAyMDE5IDA2OjM0OjU0ICsw
MTAwOgoKPiBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQveGVu
L3RpcC5naXQgZm9yLWxpbnVzLTUuNWEtcmMxLXRhZwoKaGFzIGJlZW4gbWVyZ2VkIGludG8gdG9y
dmFsZHMvbGludXguZ2l0OgpodHRwczovL2dpdC5rZXJuZWwub3JnL3RvcnZhbGRzL2MvM2YzYzhi
ZTk3M2FmMTA4NzVjZmExZTdiODVhNTM1YjZiYTc2YjQ0ZgoKVGhhbmsgeW91IQoKLS0gCkRlZXQt
ZG9vdC1kb3QsIEkgYW0gYSBib3QuCmh0dHBzOi8va29yZy53aWtpLmtlcm5lbC5vcmcvdXNlcmRv
Yy9wcnRyYWNrZXIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
