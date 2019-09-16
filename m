Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF6A9B3799
	for <lists+xen-devel@lfdr.de>; Mon, 16 Sep 2019 11:55:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i9ngs-0005uE-MQ; Mon, 16 Sep 2019 09:53:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ZJ1s=XL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i9ngr-0005tx-Bx
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2019 09:53:01 +0000
X-Inumbo-ID: c4a69ad8-d867-11e9-978d-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c4a69ad8-d867-11e9-978d-bc764e2007e4;
 Mon, 16 Sep 2019 09:53:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D9296AD63;
 Mon, 16 Sep 2019 09:52:59 +0000 (UTC)
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
References: <1568388917-7287-1-git-send-email-olekstysh@gmail.com>
 <1568388917-7287-8-git-send-email-olekstysh@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ad0d8cfc-55fa-f97a-a507-70186e69ae0b@suse.com>
Date: Mon, 16 Sep 2019 11:53:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1568388917-7287-8-git-send-email-olekstysh@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V4 7/8] iommu/arm: Introduce
 iommu_add_dt_device API
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
Cc: xen-devel@lists.xenproject.org, julien.grall@arm.com,
 sstabellini@kernel.org, Volodymyr_Babchuk@epam.com,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMuMDkuMjAxOSAxNzozNSwgT2xla3NhbmRyIFR5c2hjaGVua28gd3JvdGU6Cj4gLS0tIGEv
eGVuL2luY2x1ZGUveGVuL2lvbW11LmgKPiArKysgYi94ZW4vaW5jbHVkZS94ZW4vaW9tbXUuaAo+
IEBAIC0yMzksNiArMjM5LDE2IEBAIHN0cnVjdCBpb21tdV9vcHMgewo+ICAgICAgaW50IF9fbXVz
dF9jaGVjayAoKmlvdGxiX2ZsdXNoX2FsbCkoc3RydWN0IGRvbWFpbiAqZCk7Cj4gICAgICBpbnQg
KCpnZXRfcmVzZXJ2ZWRfZGV2aWNlX21lbW9yeSkoaW9tbXVfZ3JkbV90ICosIHZvaWQgKik7Cj4g
ICAgICB2b2lkICgqZHVtcF9wMm1fdGFibGUpKHN0cnVjdCBkb21haW4gKmQpOwo+ICsKPiArI2lm
ZGVmIENPTkZJR19IQVNfREVWSUNFX1RSRUUKPiArICAgIC8qCj4gKyAgICAgKiBBbGwgSU9NTVUg
ZHJpdmVycyB3aGljaCBzdXBwb3J0IGdlbmVyaWMgSU9NTVUgRFQgYmluZGluZ3Mgc2hvdWxkIHVz
ZQo+ICsgICAgICogdGhpcyBjYWxsYmFjay4gVGhpcyBpcyBhIHdheSBmb3IgdGhlIGZyYW1ld29y
ayB0byBwcm92aWRlIHRoZSBkcml2ZXIKPiArICAgICAqIHdpdGggRFQgSU9NTVUgc3BlY2lmaWVy
IHdoaWNoIGRlc2NyaWJlcyB0aGUgSU9NTVUgbWFzdGVyIGludGVyZmFjZXMgb2YKPiArICAgICAq
IHRoYXQgZGV2aWNlIChkZXZpY2UgSURzLCBldGMpLgo+ICsgICAgICovCj4gKyAgICBpbnQgKCpk
dF94bGF0ZSkoZGV2aWNlX3QgKmRldiwgc3RydWN0IGR0X3BoYW5kbGVfYXJncyAqYXJncyk7Cj4g
KyNlbmRpZgo+ICB9OwoKQmVmb3JlIEkgZ2l2ZSBteSBhY2sgb24gdGhpcywgd291bGQgeW91IHBs
ZWFzZSBjbGFyaWZ5IHdoZXRoZXIKaW5kZWVkIGJvdGggcGFyYW1ldGVycyBhcmUgaW50ZW5kZWQg
dG8gYmUgd3JpdHRlbiB0byBieSB0aGUKaG9vayBmdW5jdGlvbj8gSWYgbm90LCBlaXRoZXIgb3Ig
Ym90aCBzaG91bGQgZ2V0ICJjb25zdCIgYWRkZWQuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
