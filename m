Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B6FC1D77
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 10:54:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iErO4-0005Rf-Hq; Mon, 30 Sep 2019 08:50:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=H1QO=XZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iErO3-0005Ra-4Z
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 08:50:31 +0000
X-Inumbo-ID: 5a7aa9bc-e35f-11e9-97fb-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 5a7aa9bc-e35f-11e9-97fb-bc764e2007e4;
 Mon, 30 Sep 2019 08:50:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 83B53B03C;
 Mon, 30 Sep 2019 08:50:28 +0000 (UTC)
To: Pawel Wieczorkiewicz <wipawel@amazon.de>
References: <20190928151305.127380-1-wipawel@amazon.de>
 <20190928151305.127380-11-wipawel@amazon.de>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <90b08bae-c883-2809-84aa-8bc85a368c0f@suse.com>
Date: Mon, 30 Sep 2019 10:50:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190928151305.127380-11-wipawel@amazon.de>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 10/12] livepatch: Handle arbitrary size
 names with the list operation
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
Cc: wipawel@amazon.com, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, mpohlack@amazon.com,
 Tim Deegan <tim@xen.org>, Ross Lagerwall <ross.lagerwall@citrix.com>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjguMDkuMjAxOSAxNzoxMywgUGF3ZWwgV2llY3pvcmtpZXdpY3ogd3JvdGU6Cj4gLS0tIGEv
eGVuL2luY2x1ZGUvcHVibGljL3N5c2N0bC5oCj4gKysrIGIveGVuL2luY2x1ZGUvcHVibGljL3N5
c2N0bC5oCj4gQEAgLTkyNSwxMCArOTI1LDExIEBAIHN0cnVjdCB4ZW5fc3lzY3RsX2xpdmVwYXRj
aF9nZXQgewo+ICAgKgo+ICAgKiBJZiB0aGUgaHlwZXJjYWxsIHJldHVybnMgYW4gcG9zaXRpdmUg
bnVtYmVyLCBpdCBpcyB0aGUgbnVtYmVyICh1cCB0byBgbnJgKQo+ICAgKiBvZiB0aGUgcGF5bG9h
ZHMgcmV0dXJuZWQsIGFsb25nIHdpdGggYG5yYCB1cGRhdGVkIHdpdGggdGhlIG51bWJlciBvZiBy
ZW1haW5pbmcKPiAtICogcGF5bG9hZHMsIGB2ZXJzaW9uYCB1cGRhdGVkIChpdCBtYXkgYmUgdGhl
IHNhbWUgYWNyb3NzIGh5cGVyY2FsbHMuIElmIGl0Cj4gLSAqIHZhcmllcyB0aGUgZGF0YSBpcyBz
dGFsZSBhbmQgZnVydGhlciBjYWxscyBjb3VsZCBmYWlsKS4gVGhlIGBzdGF0dXNgLAo+IC0gKiBg
bmFtZWAsIGFuZCBgbGVuYCcgYXJlIHVwZGF0ZWQgYXQgdGhlaXIgZGVzaWduZWQgaW5kZXggdmFs
dWUgKGBpZHhgKSB3aXRoCj4gLSAqIHRoZSByZXR1cm5lZCB2YWx1ZSBvZiBkYXRhLgo+ICsgKiBw
YXlsb2FkcywgYHZlcnNpb25gIHVwZGF0ZWQgKGl0IG1heSBiZSB0aGUgc2FtZSBhY3Jvc3MgaHlw
ZXJjYWxscy4gSWYgaXQgdmFyaWVzCj4gKyAqIHRoZSBkYXRhIGlzIHN0YWxlIGFuZCBmdXJ0aGVy
IGNhbGxzIGNvdWxkIGZhaWwpIGFuZCB0aGUgbmFtZV90b3RhbF9zaXplCj4gKyAqIGNvbnRhaW5p
bmcgdG90YWwgc2l6ZSBvZiB0cmFuc2ZlcnJlZCBkYXRhIGZvciB0aGUgYXJyYXkuCj4gKyAqIFRo
ZSBgc3RhdHVzYCwgYG5hbWVgLCBgbGVuYCBhcmUgdXBkYXRlZCBhdCB0aGVpciBkZXNpZ25lZCBp
bmRleCB2YWx1ZSAoYGlkeGApCj4gKyAqIHdpdGggdGhlIHJldHVybmVkIHZhbHVlIG9mIGRhdGEu
Cj4gICAqCj4gICAqIElmIHRoZSBoeXBlcmNhbGwgcmV0dXJucyBFMkJJRyB0aGUgYG5yYCBpcyB0
b28gYmlnIGFuZCBzaG91bGQgYmUKPiAgICogbG93ZXJlZC4gVGhlIHVwcGVyIGxpbWl0IG9mIGBu
cmAgaXMgbGVmdCB0byB0aGUgaW1wbGVtZW50aW9uLgo+IEBAIC05NTEsMTEgKzk1MiwxMyBAQCBz
dHJ1Y3QgeGVuX3N5c2N0bF9saXZlcGF0Y2hfbGlzdCB7Cj4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgYW1vdW50IG9mIHBheWxvYWRzIGFuZCB2ZXJzaW9u
Lgo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIE9VVDog
SG93IG1hbnkgcGF5bG9hZHMgbGVmdC4gKi8KPiAgICAgIHVpbnQzMl90IHBhZDsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAvKiBJTjogTXVzdCBiZSB6ZXJvLiAqLwo+ICsgICAgdWludDMyX3Qg
bmFtZV90b3RhbF9zaXplOyAgICAgICAgICAgICAgIC8qIE9VVDogVG90YWwgc2l6ZSBvZiBhbGwg
dHJhbnNmZXIgbmFtZXMgKi8KPiAgICAgIFhFTl9HVUVTVF9IQU5ETEVfNjQoeGVuX2xpdmVwYXRj
aF9zdGF0dXNfdCkgc3RhdHVzOyAgLyogT1VULiBNdXN0IGhhdmUgZW5vdWdoCj4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3BhY2UgYWxsb2NhdGUgZm9y
IG5yIG9mIHRoZW0uICovCj4gICAgICBYRU5fR1VFU1RfSEFORExFXzY0KGNoYXIpIG5hbWU7ICAg
ICAgICAgLyogT1VUOiBBcnJheSBvZiBuYW1lcy4gRWFjaCBtZW1iZXIKPiAtICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBNVVNUIFhFTl9MSVZFUEFUQ0hfTkFN
RV9TSVpFIGluIHNpemUuCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgTXVzdCBoYXZlIG5yIG9mIHRoZW0uICovCj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgbWF5IGhhdmUgYW4gYXJiaXRyYXJ5IGxlbmd0aCB1
cCB0bwo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFhF
Tl9MSVZFUEFUQ0hfTkFNRV9TSVpFIGJ5dGVzLiBNdXN0IGhhdmUKPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBuciBvZiB0aGVtLiAqLwo+ICAgICAgWEVO
X0dVRVNUX0hBTkRMRV82NCh1aW50MzIpIGxlbjsgICAgICAgIC8qIE9VVDogQXJyYXkgb2YgbGVu
Z3RocyBvZiBuYW1lJ3MuCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgTXVzdCBoYXZlIG5yIG9mIHRoZW0uICovCj4gIH07CgpOb24tYmluYXJ5LWNvbXBh
dGlibGUgY2hhbmdlcyByZXF1aXJlIGFuIGludGVyZmFjZSB2ZXJzaW9uIGJ1bXAuCkkgd29uZGVy
IHRob3VnaCB3aHkgeW91IGRvbid0IHVzZSB0aGUgInBhZCIgZmllbGQ7IGluIGZhY3QgdGhlCndh
eSB5b3UgbWFrZSB0aGUgY2hhbmdlIHlvdSdkIGhhdmUgdG8gaW50cm9kdWNlIGEgMm5kIHBhZGRp
bmcKZmllbGQsIHRvIG1ha2UgcGFkZGluZyBleHBsaWNpdCBfYW5kXyBjaGVjayBpdCdzIHplcm8g
b24gaW5wdXQKKGZvciBmdXR1cmUgZXh0ZW5zaWJpbGl0eSBfd2l0aG91dF8gaGF2aW5nIHRvIGJ1
bXAgdGhlIGludGVyZmFjZQp2ZXJzaW9uKS4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
