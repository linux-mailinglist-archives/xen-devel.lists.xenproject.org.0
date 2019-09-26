Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 575CBBF2E1
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 14:25:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDSmp-0007zg-6E; Thu, 26 Sep 2019 12:22:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=breC=XV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iDSmn-0007zb-BO
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 12:22:17 +0000
X-Inumbo-ID: 46d6cb84-e058-11e9-97fb-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 46d6cb84-e058-11e9-97fb-bc764e2007e4;
 Thu, 26 Sep 2019 12:22:16 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 9E812B0C6;
 Thu, 26 Sep 2019 12:22:14 +0000 (UTC)
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
References: <1569496834-7796-1-git-send-email-olekstysh@gmail.com>
 <1569496834-7796-9-git-send-email-olekstysh@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ae55d9e3-2dd8-abf7-c31c-603f5fd230ed@suse.com>
Date: Thu, 26 Sep 2019 14:22:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1569496834-7796-9-git-send-email-olekstysh@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V6 8/8] iommu/arm: Add Renesas IPMMU-VMSA
 support
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
Cc: sstabellini@kernel.org,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, julien.grall@arm.com,
 xen-devel@lists.xenproject.org, volodymyr_babchuk@epam.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjYuMDkuMjAxOSAxMzoyMCwgT2xla3NhbmRyIFR5c2hjaGVua28gd3JvdGU6Cj4gLS0tIGEv
eGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvS2NvbmZpZwo+ICsrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0
aHJvdWdoL0tjb25maWcKPiBAQCAtMTIsNiArMTIsMTkgQEAgY29uZmlnIEFSTV9TTU1VCj4gIAo+
ICAJICBTYXkgWSBoZXJlIGlmIHlvdXIgU29DIGluY2x1ZGVzIGFuIElPTU1VIGRldmljZSBpbXBs
ZW1lbnRpbmcgdGhlCj4gIAkgIEFSTSBTTU1VIGFyY2hpdGVjdHVyZS4KPiArCj4gK2NvbmZpZyBJ
UE1NVV9WTVNBCj4gKwlib29sICJSZW5lc2FzIElQTU1VLVZNU0EgZm91bmQgaW4gUi1DYXIgR2Vu
MyBTb0NzIiBpZiBFWFBFUlQgPSAieSIKPiArCWRlZmF1bHQgbgoKSSB3b3VsZCBmaW5kIGl0IG5p
Y2UsIGJ0dywgaWYgc3VjaCB1bm5lY2Vzc2FyeSBsaW5lcyB3ZXJlIG9taXR0ZWQKKGNhbiBsaWtl
bHkgYWdhaW4gYmUgZG9uZSB3aGlsZSBjb21taXR0aW5nKS4gRm9yIHNvbWUgcmVhc29uIEkKd2Fz
bid0IENjLWVkIG9uIHRoaXMgcGF0Y2gsIHNvIEkgZGlkbid0IG5vdGljZSBzbyBmYXIuCgpKYW4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
