Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB5464476
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jul 2019 11:35:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hl8wi-0005KM-QT; Wed, 10 Jul 2019 09:31:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=iApL=VH=redhat.com=lersek@srs-us1.protection.inumbo.net>)
 id 1hl8wh-0005KH-Id
 for xen-devel@lists.xenproject.org; Wed, 10 Jul 2019 09:31:27 +0000
X-Inumbo-ID: 7cefd01c-a2f5-11e9-8b98-330d625909f9
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7cefd01c-a2f5-11e9-8b98-330d625909f9;
 Wed, 10 Jul 2019 09:31:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 6CED9C057E65;
 Wed, 10 Jul 2019 09:31:25 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-117-153.ams2.redhat.com
 [10.36.117.153])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E8D6B1001B19;
 Wed, 10 Jul 2019 09:31:23 +0000 (UTC)
To: Anthony PERARD <anthony.perard@citrix.com>, devel@edk2.groups.io
References: <20190704144233.27968-1-anthony.perard@citrix.com>
 <20190704144233.27968-28-anthony.perard@citrix.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <f2c7ed3d-c453-1324-6d2d-d004154b6c9e@redhat.com>
Date: Wed, 10 Jul 2019 11:31:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190704144233.27968-28-anthony.perard@citrix.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.32]); Wed, 10 Jul 2019 09:31:25 +0000 (UTC)
Subject: Re: [Xen-devel] [PATCH v3 27/35] OvmfPkg/XenPlatformLib: Cache
 result for XenDetected
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
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien.grall@arm.com>,
 Jordan Justen <jordan.l.justen@intel.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDcvMDQvMTkgMTY6NDIsIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+IFdlIGFyZSBnb2luZyB0
byByZXBsYWNlIFhlbkRldGVjdGVkKCkgaW1wbGVtZW50YXRpb24gaW4KPiBQbGF0Zm9ybUJvb3RN
YW5hZ2VyTGliIGJ5IHRoZSBvbmUgaW4gWGVuUGxhdGZvcm1MaWIuCj4gUGxhdGZvcm1Cb290TWFu
YWdlckxpYidzIGltcGxlbWVudGF0aW9uIGRvZXMgY2FjaGUgdGhlIHJlc3VsdCBvZgo+IEdldEZp
cnN0R3VpZEhvYigpLCBzbyB3ZSBkbyBzb21ldGhpbmcgc2ltaWxhciBpbiBYZW5QbGF0Zm9ybUxp
Yi4KPiAKPiBSZWY6IGh0dHBzOi8vYnVnemlsbGEudGlhbm9jb3JlLm9yZy9zaG93X2J1Zy5jZ2k/
aWQ9MTY4OQo+IFNpZ25lZC1vZmYtYnk6IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBj
aXRyaXguY29tPgo+IC0tLQo+IAo+IE5vdGVzOgo+ICAgICB2MzoKPiAgICAgLSBuZXcgcGF0Y2gK
PiAKPiAgLi4uL0xpYnJhcnkvWGVuUGxhdGZvcm1MaWIvWGVuUGxhdGZvcm1MaWIuYyAgICB8IDE4
ICsrKysrKysrKysrKysrKy0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwg
MyBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvT3ZtZlBrZy9MaWJyYXJ5L1hlblBsYXRm
b3JtTGliL1hlblBsYXRmb3JtTGliLmMgYi9Pdm1mUGtnL0xpYnJhcnkvWGVuUGxhdGZvcm1MaWIv
WGVuUGxhdGZvcm1MaWIuYwo+IGluZGV4IDZmMjdjYmZmYTguLmI1MjU3YjBjOTcgMTAwNjQ0Cj4g
LS0tIGEvT3ZtZlBrZy9MaWJyYXJ5L1hlblBsYXRmb3JtTGliL1hlblBsYXRmb3JtTGliLmMKPiAr
KysgYi9Pdm1mUGtnL0xpYnJhcnkvWGVuUGxhdGZvcm1MaWIvWGVuUGxhdGZvcm1MaWIuYwo+IEBA
IC0yNiwxMyArMjYsMjUgQEAgWGVuR2V0SW5mb0hPQiAoCj4gICAgKQo+ICB7Cj4gICAgRUZJX0hP
Ql9HVUlEX1RZUEUgICpHdWlkSG9iOwo+ICsgIFNUQVRJQyBCT09MRUFOICAgICBDYWNoZWQgPSBG
QUxTRTsKPiArICBTVEFUSUMgRUZJX1hFTl9JTkZPICpYZW5JbmZvOwoKKDEpIFRoZSBhbGlnbm1l
bnQgb2YgdGhlIHZhcmlhYmxlIG5hbWVzIGlzIHdlaXJkLiBUaGUgYWJvdmUgaXMgbmVpdGhlcgpj
b25kZW5zZWQgbm9yIHByZWNpc2VseSBhbGlnbmVkLiBQbGVhc2UgcGljayBvbmU6CgogIEVGSV9I
T0JfR1VJRF9UWVBFICpHdWlkSG9iOwogIFNUQVRJQyBCT09MRUFOIENhY2hlZCA9IEZBTFNFOwog
IFNUQVRJQyBFRklfWEVOX0lORk8gKlhlbkluZm87CgpvcgoKICBFRklfSE9CX0dVSURfVFlQRSAg
ICpHdWlkSG9iOwogIFNUQVRJQyBCT09MRUFOICAgICAgQ2FjaGVkID0gRkFMU0U7CiAgU1RBVElD
IEVGSV9YRU5fSU5GTyAqWGVuSW5mbzsKCihUaGUgMm5kIGZvcm0gaXMgcHJlZmVycmVkIGluIGVk
azIuKQoKPiArCj4gKyAgLy8KPiArICAvLyBSZXR1cm4gdGhlIGNhY2hlZCByZXN1bHQgZm9yIHRo
ZSBiZW5lZml0IG9mIFhlbkRldGVjdGVkIHRoYXQgY2FuIGJlCj4gKyAgLy8gY2FsbGVkIG1hbnkg
dGltZXMuCj4gKyAgLy8KPiArICBpZiAoQ2FjaGVkKSB7Cj4gKyAgICByZXR1cm4gWGVuSW5mbzsK
PiArICB9Cj4gIAo+ICAgIEd1aWRIb2IgPSBHZXRGaXJzdEd1aWRIb2IgKCZnRWZpWGVuSW5mb0d1
aWQpOwo+ICAgIGlmIChHdWlkSG9iID09IE5VTEwpIHsKPiAtICAgIHJldHVybiBOVUxMOwo+ICsg
ICAgWGVuSW5mbyA9IE5VTEw7Cj4gKyAgfSBlbHNlIHsKPiArICAgIFhlbkluZm8gPSAoRUZJX1hF
Tl9JTkZPICopIEdFVF9HVUlEX0hPQl9EQVRBIChHdWlkSG9iKTsKPiAgICB9Cj4gLQo+IC0gIHJl
dHVybiAoRUZJX1hFTl9JTkZPICopIEdFVF9HVUlEX0hPQl9EQVRBIChHdWlkSG9iKTsKPiArICBD
YWNoZWQgPSBUUlVFOwo+ICsgIHJldHVybiBYZW5JbmZvOwo+ICB9Cj4gIAo+ICAvKioKPiAKClRo
aXMgd2lsbCB3b3JrIGZpbmUgaW4gRFhFIG1vZHVsZXMgKGFuZCBieSB0aGUgZW5kIG9mIHRoZSBz
ZXJpZXMsIG9ubHkKRFhFIG1vZHVsZXMgdXNlIFhlblBsYXRmb3JtTGliIC0tIEFjcGlQbGF0Zm9y
bUR4ZSwgWGVuSW9QdmhEeGUsIGFuZApQbGF0Zm9ybUJvb3RNYW5hZ2VyTGliLCB3aGljaCBpcyBv
bmx5IGxpbmtlZCBpbnRvIERYRSBtb2R1bGVzKS4KCldpdGggKDEpIGZpeGVkOgoKUmV2aWV3ZWQt
Ynk6IExhc3psbyBFcnNlayA8bGVyc2VrQHJlZGhhdC5jb20+CgpUaGFua3MKTGFzemxvCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
