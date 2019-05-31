Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 313F731484
	for <lists+xen-devel@lfdr.de>; Fri, 31 May 2019 20:18:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hWm3i-0001gt-BN; Fri, 31 May 2019 18:15:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UkaS=T7=kernel.org=pr-tracker-bot@srs-us1.protection.inumbo.net>)
 id 1hWm3g-0001go-G9
 for xen-devel@lists.xenproject.org; Fri, 31 May 2019 18:15:16 +0000
X-Inumbo-ID: 0a13224a-83d0-11e9-ae96-979641b2db8c
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0a13224a-83d0-11e9-ae96-979641b2db8c;
 Fri, 31 May 2019 18:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1559326515;
 bh=DeSV129wW+0DXW6DOrtnDLIS3PoYB2Q3q6d6pGuoqng=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=f4CUia6q6CXJ2Rx+FquCyWdAzhSvwxN96hJl3J62I/XTdPlNpsz3p/21zMOzFJii9
 RIMuBXr8kovT1SyoenyL+zjznTnq3VeqAwITyoUMVWt6Tf4dsdlusvoUV0rIP8j2Tn
 F1aaXUcn5ALh0+eHPQYs0S7TbuVNMYoLZkw3h/nc=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20190531135603.3403-1-jgross@suse.com>
References: <20190531135603.3403-1-jgross@suse.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20190531135603.3403-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git
 for-linus-5.2b-rc3-tag
X-PR-Tracked-Commit-Id: d10e0cc113c9e1b64b5c6e3db37b5c839794f3df
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 8164c5719b864da3bcfee97ad8af8cfd7ee5ad8c
Message-Id: <155932651541.23368.10945746314777442643.pr-tracker-bot@kernel.org>
Date: Fri, 31 May 2019 18:15:15 +0000
To: Juergen Gross <jgross@suse.com>
Subject: Re: [Xen-devel] [GIT PULL] xen: fixes for 5.2-rc3
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

VGhlIHB1bGwgcmVxdWVzdCB5b3Ugc2VudCBvbiBGcmksIDMxIE1heSAyMDE5IDE1OjU2OjAzICsw
MjAwOgoKPiBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQveGVu
L3RpcC5naXQgZm9yLWxpbnVzLTUuMmItcmMzLXRhZwoKaGFzIGJlZW4gbWVyZ2VkIGludG8gdG9y
dmFsZHMvbGludXguZ2l0OgpodHRwczovL2dpdC5rZXJuZWwub3JnL3RvcnZhbGRzL2MvODE2NGM1
NzE5Yjg2NGRhM2JjZmVlOTdhZDhhZjhjZmQ3ZWU1YWQ4YwoKVGhhbmsgeW91IQoKLS0gCkRlZXQt
ZG9vdC1kb3QsIEkgYW0gYSBib3QuCmh0dHBzOi8va29yZy53aWtpLmtlcm5lbC5vcmcvdXNlcmRv
Yy9wcnRyYWNrZXIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
