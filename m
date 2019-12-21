Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05ACE1289BA
	for <lists+xen-devel@lfdr.de>; Sat, 21 Dec 2019 15:58:51 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iig9z-0003eH-GK; Sat, 21 Dec 2019 14:55:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wxY0=2L=kernel.org=pr-tracker-bot@srs-us1.protection.inumbo.net>)
 id 1iig9x-0003eB-AK
 for xen-devel@lists.xenproject.org; Sat, 21 Dec 2019 14:55:13 +0000
X-Inumbo-ID: e3cfed52-2401-11ea-94ce-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e3cfed52-2401-11ea-94ce-12813bfff9fa;
 Sat, 21 Dec 2019 14:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576940112;
 bh=MLnfA3nzYAB00Nh83uzmFUMSz2Zg9w+B/yubzgqQZCQ=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=cMfqv8y+0rJA7SBwUZsCsoCZ8kty8vCVDI0MvNHZ6I1V8DOHchPV8leuP4bJdkIug
 e0BuqTed4EknPHbtUV99AHiP+/7x9p6y2AwU3UIZTPmY1XjtKVFXKU3B8f8iWwLksG
 YwlcvbgjEwDXIbRm2Z1NtLml9HoFevt7NcNpZOwY=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20191221131946.27017-1-jgross@suse.com>
References: <20191221131946.27017-1-jgross@suse.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20191221131946.27017-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git
 for-linus-5.5b-rc3-tag
X-PR-Tracked-Commit-Id: d6bd6cf9feb81737f9f64d2c1acf98fdaacebad1
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 62af608b4b075871f7214c345c42a2e7a456f35d
Message-Id: <157694011209.20544.506027854286834225.pr-tracker-bot@kernel.org>
Date: Sat, 21 Dec 2019 14:55:12 +0000
To: Juergen Gross <jgross@suse.com>
Subject: Re: [Xen-devel] [GIT PULL] xen: branch for v5.5-rc3
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

VGhlIHB1bGwgcmVxdWVzdCB5b3Ugc2VudCBvbiBTYXQsIDIxIERlYyAyMDE5IDE0OjE5OjQ2ICsw
MTAwOgoKPiBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQveGVu
L3RpcC5naXQgZm9yLWxpbnVzLTUuNWItcmMzLXRhZwoKaGFzIGJlZW4gbWVyZ2VkIGludG8gdG9y
dmFsZHMvbGludXguZ2l0OgpodHRwczovL2dpdC5rZXJuZWwub3JnL3RvcnZhbGRzL2MvNjJhZjYw
OGI0YjA3NTg3MWY3MjE0YzM0NWM0MmEyZTdhNDU2ZjM1ZAoKVGhhbmsgeW91IQoKLS0gCkRlZXQt
ZG9vdC1kb3QsIEkgYW0gYSBib3QuCmh0dHBzOi8va29yZy53aWtpLmtlcm5lbC5vcmcvdXNlcmRv
Yy9wcnRyYWNrZXIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
