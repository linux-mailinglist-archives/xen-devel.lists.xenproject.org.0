Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F5CF115FC9
	for <lists+xen-devel@lfdr.de>; Sat,  7 Dec 2019 23:59:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1idiz0-0005hL-GF; Sat, 07 Dec 2019 22:55:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=G3Tf=Z5=kernel.org=pr-tracker-bot@srs-us1.protection.inumbo.net>)
 id 1idiyz-0005hG-E2
 for xen-devel@lists.xenproject.org; Sat, 07 Dec 2019 22:55:25 +0000
X-Inumbo-ID: a7161368-1944-11ea-8641-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a7161368-1944-11ea-8641-12813bfff9fa;
 Sat, 07 Dec 2019 22:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1575759323;
 bh=5XzSFmIU7PVbmSshNy7EZ1NML47wHN86RFr0A/PoRQM=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=gDOVCVvIOUuw09yzMbNCCi1CGdykKlhtNlv/Ja1urANyNJYBEY7JnX11jB9ehPIAW
 csvMWylu0t+YdRDURZq8AFMGJIuqOEe9q8gkXk0xHYOcVVKFhoJraJ/P/mWyHZiRkn
 Tzfcz2Dh6FPX8dXJHq8m9fKkEehsiMumQofEYENs=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20191206165511.14749-1-jgross@suse.com>
References: <20191206165511.14749-1-jgross@suse.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20191206165511.14749-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git
 for-linus-5.5b-rc1-tag
X-PR-Tracked-Commit-Id: 14855954f63608c5622d5eaa964d3872ce5c5514
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f74fd13f4585e418a3e630a82468be58bf1d98c1
Message-Id: <157575932368.19906.7832606302436981258.pr-tracker-bot@kernel.org>
Date: Sat, 07 Dec 2019 22:55:23 +0000
To: Juergen Gross <jgross@suse.com>
Subject: Re: [Xen-devel] [GIT PULL] xen: branch for v5.5-rc1
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

VGhlIHB1bGwgcmVxdWVzdCB5b3Ugc2VudCBvbiBGcmksICA2IERlYyAyMDE5IDE3OjU1OjExICsw
MTAwOgoKPiBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQveGVu
L3RpcC5naXQgZm9yLWxpbnVzLTUuNWItcmMxLXRhZwoKaGFzIGJlZW4gbWVyZ2VkIGludG8gdG9y
dmFsZHMvbGludXguZ2l0OgpodHRwczovL2dpdC5rZXJuZWwub3JnL3RvcnZhbGRzL2MvZjc0ZmQx
M2Y0NTg1ZTQxOGEzZTYzMGE4MjQ2OGJlNThiZjFkOThjMQoKVGhhbmsgeW91IQoKLS0gCkRlZXQt
ZG9vdC1kb3QsIEkgYW0gYSBib3QuCmh0dHBzOi8va29yZy53aWtpLmtlcm5lbC5vcmcvdXNlcmRv
Yy9wcnRyYWNrZXIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
