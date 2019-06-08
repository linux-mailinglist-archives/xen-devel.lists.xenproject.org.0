Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B390B3A1F0
	for <lists+xen-devel@lfdr.de>; Sat,  8 Jun 2019 22:23:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hZhp6-0008WP-5Z; Sat, 08 Jun 2019 20:20:20 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1gpf=UH=kernel.org=pr-tracker-bot@srs-us1.protection.inumbo.net>)
 id 1hZhp5-0008WJ-CP
 for xen-devel@lists.xenproject.org; Sat, 08 Jun 2019 20:20:19 +0000
X-Inumbo-ID: d50637dd-8a2a-11e9-8980-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id d50637dd-8a2a-11e9-8980-bc764e045a96;
 Sat, 08 Jun 2019 20:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1560025217;
 bh=SawyKQrvpZkjmG+jgFjsO9xisT+l2LhWU+JmZk8zYaM=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=EXxsEqSnzkeOh4U/jj8Di135srtDbeK2o7SXUUw+1jTL9InJWW3VkJV7ihm7sc6c/
 9Mf6GaOjBcQ1AOOVom9xF6pH1FcbKOSxr5ATXWqepZqhd0gpz+5Ank6fO+2qJ5nE/8
 4+WRsRWkJWvLERNcUpA5WXaP21jnQ1meRwP66Ir8=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20190608114326.4804-1-jgross@suse.com>
References: <20190608114326.4804-1-jgross@suse.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20190608114326.4804-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git
 for-linus-5.2b-rc4-tag
X-PR-Tracked-Commit-Id: 1d5c76e66433382a1e170d1d5845bb0fed7467aa
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 8e61f6f7c308a828f8402db6651f6e38ba66c009
Message-Id: <156002521752.8142.408797817200882108.pr-tracker-bot@kernel.org>
Date: Sat, 08 Jun 2019 20:20:17 +0000
To: Juergen Gross <jgross@suse.com>
Subject: Re: [Xen-devel] [GIT PULL] xen: fix for 5.2-rc4
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

VGhlIHB1bGwgcmVxdWVzdCB5b3Ugc2VudCBvbiBTYXQsICA4IEp1biAyMDE5IDEzOjQzOjI2ICsw
MjAwOgoKPiBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQveGVu
L3RpcC5naXQgZm9yLWxpbnVzLTUuMmItcmM0LXRhZwoKaGFzIGJlZW4gbWVyZ2VkIGludG8gdG9y
dmFsZHMvbGludXguZ2l0OgpodHRwczovL2dpdC5rZXJuZWwub3JnL3RvcnZhbGRzL2MvOGU2MWY2
ZjdjMzA4YTgyOGY4NDAyZGI2NjUxZjZlMzhiYTY2YzAwOQoKVGhhbmsgeW91IQoKLS0gCkRlZXQt
ZG9vdC1kb3QsIEkgYW0gYSBib3QuCmh0dHBzOi8va29yZy53aWtpLmtlcm5lbC5vcmcvdXNlcmRv
Yy9wcnRyYWNrZXIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
