Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04AB6B4984
	for <lists+xen-devel@lfdr.de>; Tue, 17 Sep 2019 10:30:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iA8p9-0001n5-5w; Tue, 17 Sep 2019 08:26:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=+VJ/=XM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iA8p7-0001n0-Va
 for xen-devel@lists.xenproject.org; Tue, 17 Sep 2019 08:26:57 +0000
X-Inumbo-ID: e8d31fea-d924-11e9-b299-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e8d31fea-d924-11e9-b299-bc764e2007e4;
 Tue, 17 Sep 2019 08:26:56 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 60B71B048;
 Tue, 17 Sep 2019 08:26:55 +0000 (UTC)
To: Pawel Wieczorkiewicz <wipawel@amazon.de>
References: <20190916105945.93632-1-wipawel@amazon.de>
 <20190916105945.93632-11-wipawel@amazon.de>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <fb181faf-76e2-57c9-ac1e-7f56a195f9ef@suse.com>
Date: Tue, 17 Sep 2019 10:27:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190916105945.93632-11-wipawel@amazon.de>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 10/12] livepatch: Handle arbitrary size
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
 Wei Liu <wl@xen.org>, KonradRzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, mpohlack@amazon.com,
 Tim Deegan <tim@xen.org>, Ross Lagerwall <ross.lagerwall@citrix.com>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTYuMDkuMjAxOSAxMjo1OSwgUGF3ZWwgV2llY3pvcmtpZXdpY3ogd3JvdGU6Cj4gQEAgLTk1
MSwxMSArOTUyLDEzIEBAIHN0cnVjdCB4ZW5fc3lzY3RsX2xpdmVwYXRjaF9saXN0IHsKPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBhbW91bnQgb2YgcGF5
bG9hZHMgYW5kIHZlcnNpb24uCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgT1VUOiBIb3cgbWFueSBwYXlsb2FkcyBsZWZ0LiAqLwo+ICAgICAgdWludDMy
X3QgcGFkOyAgICAgICAgICAgICAgICAgICAgICAgICAgIC8qIElOOiBNdXN0IGJlIHplcm8uICov
Cj4gKyAgICB1aW50NjRfdCBuYW1lX3RvdGFsX3NpemU7ICAgICAgICAgICAgICAgLyogT1VUOiBU
b3RhbCBzaXplIG9mIGFsbCB0cmFuc2ZlciBuYW1lcyAqLwoKV2h5IHVpbnQ2NF90IGFuZCBub3Qg
dWludDMyX3Q/IFlvdSBkb24ndCBleHBlY3QgdGhpcyB0byBncm93CmJleW9uZCA0R2lCLCBkbyB5
b3U/CgpBbmQgd2h5IE9VVCByYXRoZXIgdGhhbiBJTi9PVVQ/IE9uY2UgeW91IG1ha2UgdGhpcyAi
YXJiaXRyYXJ5CnNpemUiLCBJIGRvbid0IHNlZSBhIG5lZWQgZm9yIGxpbWl0aW5nIHRoaXMgdG8g
Li4uCgo+ICAgICAgWEVOX0dVRVNUX0hBTkRMRV82NCh4ZW5fbGl2ZXBhdGNoX3N0YXR1c190KSBz
dGF0dXM7ICAvKiBPVVQuIE11c3QgaGF2ZSBlbm91Z2gKPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBzcGFjZSBhbGxvY2F0ZSBmb3IgbnIgb2YgdGhlbS4g
Ki8KPiAgICAgIFhFTl9HVUVTVF9IQU5ETEVfNjQoY2hhcikgbmFtZTsgICAgICAgICAvKiBPVVQ6
IEFycmF5IG9mIG5hbWVzLiBFYWNoIG1lbWJlcgo+IC0gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIE1VU1QgWEVOX0xJVkVQQVRDSF9OQU1FX1NJWkUgaW4gc2l6
ZS4KPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBNdXN0
IGhhdmUgbnIgb2YgdGhlbS4gKi8KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBtYXkgaGF2ZSBhbiBhcmJpdHJhcnkgbGVuZ3RoIHVwIHRvCj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgWEVOX0xJVkVQQVRDSF9O
QU1FX1NJWkUgYnl0ZXMuIE11c3QgaGF2ZQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIG5yIG9mIHRoZW0uICovCgouLi4gWEVOX0xJVkVQQVRDSF9OQU1F
X1NJWkUgYnl0ZXMgcGVyIGVudHJ5LgoKQW5kIGZpbmFsbHkgLSBwbGVhc2Ugc2VuZCB0byB0aGUg
bGlzdCBqdXN0IG9uY2UsIGkuZS4gcGxlYXNlCmRvbid0IGhhdmUgdHdvIHhlbi1kZXZlbEAgaW4g
dGhlIHJlY2lwaWVudHMgbGlzdC4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
