Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE25B8374
	for <lists+xen-devel@lfdr.de>; Thu, 19 Sep 2019 23:33:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iB40X-0002tm-JY; Thu, 19 Sep 2019 21:30:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tKQl=XO=kernel.org=pr-tracker-bot@srs-us1.protection.inumbo.net>)
 id 1iB40V-0002th-Bv
 for xen-devel@lists.xenproject.org; Thu, 19 Sep 2019 21:30:31 +0000
X-Inumbo-ID: b45edc20-db24-11e9-9677-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b45edc20-db24-11e9-9677-12813bfff9fa;
 Thu, 19 Sep 2019 21:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1568928629;
 bh=PxIMPCzSmLksihdPHjm4QGV5FFdSb/+jzcpKL6SE0QU=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=N/k9/zG0H5690gQsIVAD/7SuzY3PEW6cTpTLrwp3rkS316pDfWlnEBUlBH19Yagaz
 qVYe9lAsrjiiMow0EZO6pPIXPPEf0nD7V3qA7HLSgdvmGPxiTG0pwfEcUaTMtYJ8fW
 wNUFKGT3tipMpm+5G7gsgo+8sYF/B5zmohe/mduw=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20190918152748.GA21241@infradead.org>
References: <20190918152748.GA21241@infradead.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20190918152748.GA21241@infradead.org>
X-PR-Tracked-Remote: git://git.infradead.org/users/hch/dma-mapping.git
 tags/dma-mapping-5.4
X-PR-Tracked-Commit-Id: c7d9eccb3c1e802c5cbb2a764eb0eb9807d9f12e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 671df189537883f36cf9c7d4f9495bfac0f86627
Message-Id: <156892862992.30913.10484528229946005623.pr-tracker-bot@kernel.org>
Date: Thu, 19 Sep 2019 21:30:29 +0000
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [Xen-devel] [GIT PULL] dma-mapping updates for 5.4
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
Cc: linux-mmc@vger.kernel.org, iommu@lists.linux-foundation.org,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIHB1bGwgcmVxdWVzdCB5b3Ugc2VudCBvbiBXZWQsIDE4IFNlcCAyMDE5IDA4OjI3OjQ4IC0w
NzAwOgoKPiBnaXQ6Ly9naXQuaW5mcmFkZWFkLm9yZy91c2Vycy9oY2gvZG1hLW1hcHBpbmcuZ2l0
IHRhZ3MvZG1hLW1hcHBpbmctNS40CgpoYXMgYmVlbiBtZXJnZWQgaW50byB0b3J2YWxkcy9saW51
eC5naXQ6Cmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvdG9ydmFsZHMvYy82NzFkZjE4OTUzNzg4M2Yz
NmNmOWM3ZDRmOTQ5NWJmYWMwZjg2NjI3CgpUaGFuayB5b3UhCgotLSAKRGVldC1kb290LWRvdCwg
SSBhbSBhIGJvdC4KaHR0cHM6Ly9rb3JnLndpa2kua2VybmVsLm9yZy91c2VyZG9jL3BydHJhY2tl
cgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
