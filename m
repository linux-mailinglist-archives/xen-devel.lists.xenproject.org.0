Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3E4AF93E
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2019 11:42:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7z6I-00034J-W1; Wed, 11 Sep 2019 09:39:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VrDL=XG=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1i7z6H-00034E-CC
 for xen-devel@lists.xen.org; Wed, 11 Sep 2019 09:39:45 +0000
X-Inumbo-ID: 14964122-d478-11e9-b299-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 14964122-d478-11e9-b299-bc764e2007e4;
 Wed, 11 Sep 2019 09:39:42 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8DD11337;
 Wed, 11 Sep 2019 02:39:41 -0700 (PDT)
Received: from [10.37.12.223] (unknown [10.37.12.223])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C4BE93F71F;
 Wed, 11 Sep 2019 02:39:38 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
References: <alpine.DEB.2.21.1908201838370.20094@sstabellini-ThinkPad-T480s>
 <20190821035315.12812-3-sstabellini@kernel.org>
 <bbb460de-983f-9ad8-a563-b8c9696612af@arm.com>
Message-ID: <58eb40ea-3906-31cb-4ba2-0c3a3a4caa7d@arm.com>
Date: Wed, 11 Sep 2019 10:39:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <bbb460de-983f-9ad8-a563-b8c9696612af@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 3/8] xen/arm: introduce
 kinfo->guest_phandle_gic
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
Cc: Volodymyr_Babchuk@epam.com, Achin.Gupta@arm.com, andrii_anisov@epam.com,
 Stefano Stabellini <stefanos@xilinx.com>, xen-devel@lists.xen.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiA5LzEwLzE5IDEwOjE0IFBNLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IGRpZmYgLS1n
aXQgYS94ZW4vaW5jbHVkZS9hc20tYXJtL2tlcm5lbC5oIGIveGVuL2luY2x1ZGUvYXNtLWFybS9r
ZXJuZWwuaAo+PiBpbmRleCAzM2YzZTcyYjExLi43NjA0MzQzNjliIDEwMDY0NAo+PiAtLS0gYS94
ZW4vaW5jbHVkZS9hc20tYXJtL2tlcm5lbC5oCj4+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS1hcm0v
a2VybmVsLmgKPj4gQEAgLTM2LDYgKzM2LDkgQEAgc3RydWN0IGtlcm5lbF9pbmZvIHsKPj4gwqDC
oMKgwqDCoCAvKiBFbmFibGUgcGwwMTEgZW11bGF0aW9uICovCj4+IMKgwqDCoMKgwqAgYm9vbCB2
cGwwMTE7Cj4+ICvCoMKgwqAgLyogR0lDIHBoYW5kbGUgKi8KPj4gK8KgwqDCoCB1aW50MzJfdCBn
dWVzdF9waGFuZGxlX2dpYzsKPiAKPiBMb29raW5nIGF0IHRoZSB1c2FnZSwgSSB0aGluayB0aGlz
IHNob3VsZCBiZSBmZHQzMl90IGJlY2F1c2UgeW91IGFyZSAKPiBkaXJlY3RseSBwYXNzaW5nIHRo
ZSB2YWx1ZSB0byB0aGUgRkRUIGNhbGxzLgo+IAo+IFRoaXMgbWFrZXMgbWUgcmVhbGl6ZSB0aGF0
IHdlIGNvbnNpc3RlbnRseSB1c2Ugd3JvbmdseSBHVUVTVF9QSEFORExFX0dJQyAKPiBpbiBib3Ro
IFhlbiBhbmQgbGlieGwuIEluZGVlZCwgYXMgd2UgcGFzcyB0aGUgdmFsdWUgZGlyZWN0bHkgdGhl
IGd1ZXN0IAo+IHdpbGwgbm90IHNlZSA2NTAwMCBidXQgMzkwODg5NDcyMCBhcyBpdCB3aWxsIGRv
IHRoZSBjb252ZXJzaW9uIGZyb20gCj4gYmlnLWVuZGlhbiB0byBsaXR0bGUtZW5kaWFuLgo+IAo+
IEkgY2FuIHNlZSB0d28gc29sdXRpb24gdG8gZml4IHRoaXM6Cj4gIMKgwqAgMSkgZGVmaW5lIEdV
RVNUX1BIQU5ETEVfR0lDIGFzIGNwdV90b19iZTMyKDY1MDAwKQo+ICDCoMKgIDIpIFVzZSBjcHVf
dG9fYmUzMihHVUVTVF9QSEFORExFX0dJQykKPiAKPiBJdCB3b3VsZCBiZSBnb29kIHRvIGFncmVl
IGhvdyBHVUVTVF9QSEFORExFX0dJQyBpcyB1c2VkIHNvIHdlIGhhdmUgdGhlIAo+IHNhbWUgYmVo
YXZpb3Igd2hlbiB0aGUgRFQgaXMgY3JlYXRlZCBieSBYZW4gYW5kIGxpYnhsLgoKSG1tbSwgSSBh
Y3R1YWxseSBtaXNyZWFkIHRoZSBBUEksIHRoZSBmdW5jdGlvbiBhY3R1YWxseSB0YWtlIGEgCkNQ
VS1lbmRpYW4gdmFsdWUuIFNvIHVpbjMyX3QgaXMgY29ycmVjdCBoZXJlIGFuZCB0aGVyZSBhcmUg
bm90aGluZyBoYXMgCnRvIGJlIGRvbmUuCgpTb3JyeSBmb3IgdGhlIG5vaXNlLgoKQ2hlZXJzLAoK
LS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
