Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB493B49D9
	for <lists+xen-devel@lfdr.de>; Tue, 17 Sep 2019 10:51:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iA99l-0004h3-BA; Tue, 17 Sep 2019 08:48:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=+VJ/=XM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iA99j-0004gw-TF
 for xen-devel@lists.xenproject.org; Tue, 17 Sep 2019 08:48:15 +0000
X-Inumbo-ID: e2c2d0ac-d927-11e9-978d-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e2c2d0ac-d927-11e9-978d-bc764e2007e4;
 Tue, 17 Sep 2019 08:48:14 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 9BDE7ABBE;
 Tue, 17 Sep 2019 08:48:13 +0000 (UTC)
To: "Wieczorkiewicz, Pawel" <wipawel@amazon.de>
References: <20190916105945.93632-1-wipawel@amazon.de>
 <20190916105945.93632-11-wipawel@amazon.de>
 <fb181faf-76e2-57c9-ac1e-7f56a195f9ef@suse.com>
 <26B651C9-2FA3-491A-A383-E4A4FFB3650D@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <031390a8-2dbc-c384-6752-4e5050dc5114@suse.com>
Date: Tue, 17 Sep 2019 10:48:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <26B651C9-2FA3-491A-A383-E4A4FFB3650D@amazon.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>,
 KonradRzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Martin Pohlack <mpohlack@amazon.de>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTcuMDkuMjAxOSAxMDo0MCwgIFdpZWN6b3JraWV3aWN6LCBQYXdlbCAgd3JvdGU6Cj4gCj4g
Cj4gT24gMTcuIFNlcCAyMDE5LCBhdCAxMDoyNywgSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2Uu
Y29tPG1haWx0bzpqYmV1bGljaEBzdXNlLmNvbT4+IHdyb3RlOgo+IAo+IE9uIDE2LjA5LjIwMTkg
MTI6NTksIFBhd2VsIFdpZWN6b3JraWV3aWN6IHdyb3RlOgo+IEBAIC05NTEsMTEgKzk1MiwxMyBA
QCBzdHJ1Y3QgeGVuX3N5c2N0bF9saXZlcGF0Y2hfbGlzdCB7Cj4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBhbW91bnQgb2YgcGF5bG9hZHMgYW5kIHZlcnNp
b24uCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBPVVQ6
IEhvdyBtYW55IHBheWxvYWRzIGxlZnQuICovCj4gICAgIHVpbnQzMl90IHBhZDsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAvKiBJTjogTXVzdCBiZSB6ZXJvLiAqLwo+ICsgICAgdWludDY0X3Qg
bmFtZV90b3RhbF9zaXplOyAgICAgICAgICAgICAgIC8qIE9VVDogVG90YWwgc2l6ZSBvZiBhbGwg
dHJhbnNmZXIgbmFtZXMgKi8KPiAKPiBXaHkgdWludDY0X3QgYW5kIG5vdCB1aW50MzJfdD8gWW91
IGRvbid0IGV4cGVjdCB0aGlzIHRvIGdyb3cKPiBiZXlvbmQgNEdpQiwgZG8geW91Pwo+IAo+IEkg
ZG9u4oCZdCwgYnV0IHVpbnQzMl90IGlzIG5vdCByZWFsbHkgY29tcGF0aWJsZSB3aXRoIHNpemVf
dC4KPiBBbmQgSSB3YXMgdGhvdWdodCB0byBhbHdheXMgdXNlIHNpemVfdCBjb21wYXRpYmxlIHR5
cGVzIGZvciBzaXplcy4KClRoYXQncyBhIGZhaXIgcG9pbnQsIGJ1dCBJIHRoaW5rIHdlIHVzZSAz
Mi1iaXQgc2l6ZXMgZWxzZXdoZXJlCmFzIHdlbGwsIHdoZW4gY3Jvc3NpbmcgdGhlIDRHaUIgYm91
bmRhcnkgd291bGQgc2VlbSBlbnRpcmVseQp1bmV4cGVjdGVkLgoKQnV0IHdoYXQncyB3b3JzZSBo
ZXJlIC0geW91IHNob3VsZG4ndCB1c2UgcGxhaW4gdWludDY0X3QgaW4Kc3lzY3RsLmggKGFuZCBk
b21jdGwuaCkgYW55d2F5LiBJZiBhbnl0aGluZywgeW91IG91Z2h0IHRvIHVzZQp1aW50NjRfYWxp
Z25lZF90LiAoR29pbmcgdGhyb3VnaCB0aGUgZmlsZSBJIG5vdGljZSBhIGZldyBvdGhlcgpiYWQg
aW5zdGFuY2VzIGhhdmUgY3JlcHQgaW4uKQoKPiBBbnl3YXksIEkgZG8gbm90IG1pbmQgY2hhbmdp
bmcgdGhpcyB0byB3aGF0ZXZlciB0eXBlIHlvdSBwcmVmZXIuCgpXZWxsLCBwcmVmZXJlbmNlIC0g
aWYgYW55b25lJ3MgLSB3b3VsZCBiZSB0aGUgbGl2ZXBhdGNoIG1haW50YWluZXJzJwpvbmUgaGVy
ZS4KCkFsc28gLSBjYW4geW91IHBsZWFzZSBzZWUgYWJvdXQgYWRqdXN0aW5nIHlvdXIgcmVwbHkg
c3R5bGU/IEluIHBsYWluCnRleHQgbW9kZSBpdCdzIGltcG9zc2libGUgdG8gdGVsbCBjb250ZXh0
IGZyb20geW91ciByZXNwb25zZXMuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
