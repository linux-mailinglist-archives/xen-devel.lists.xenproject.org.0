Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2948EAD4A6
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2019 10:18:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7EpI-0001rL-5W; Mon, 09 Sep 2019 08:15:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=m/oR=XE=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1i7EpG-0001rG-Ah
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2019 08:15:06 +0000
X-Inumbo-ID: eda65402-d2d9-11e9-978d-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id eda65402-d2d9-11e9-978d-bc764e2007e4;
 Mon, 09 Sep 2019 08:15:05 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 7D1F4B6AC;
 Mon,  9 Sep 2019 08:15:04 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20190909073557.16168-1-jgross@suse.com>
 <20190909073557.16168-5-jgross@suse.com>
 <8872a67c-0927-7a3a-3029-21e666cae858@suse.com>
 <1ba88fc4-dc73-7fc1-d390-c7373a6db250@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <394d9dbd-c2b5-7219-7b78-ddfbd65a9780@suse.com>
Date: Mon, 9 Sep 2019 10:15:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1ba88fc4-dc73-7fc1-d390-c7373a6db250@suse.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH v6 4/5] xen: add per-cpu buffer option to
 debugtrace
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMDkuMTkgMTA6MDQsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDA5LjA5LjIwMTkgMDk6
NTksIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBPbiAwOS4wOS4yMDE5IDA5OjM1LCBKdWVyZ2VuIEdy
b3NzIHdyb3RlOgo+Pj4gZGVidWd0cmFjZSBpcyBub3JtYWxseSB3cml0aW5nIHRyYWNlIGVudHJp
ZXMgaW50byBhIHNpbmdsZSB0cmFjZQo+Pj4gYnVmZmVyLiBUaGVyZSBhcmUgY2FzZXMgd2hlcmUg
dGhpcyBpcyBub3Qgb3B0aW1hbCwgZS5nLiB3aGVuIGh1bnRpbmcKPj4+IGEgYnVnIHdoaWNoIHJl
cXVpcmVzIHdyaXRpbmcgbG90cyBvZiB0cmFjZSBlbnRyaWVzIGFuZCBvbmUgY3B1IGlzCj4+PiBz
dHVjay4gVGhpcyB3aWxsIHJlc3VsdCBpbiBvdGhlciBjcHVzIGZpbGxpbmcgdGhlIHRyYWNlIGJ1
ZmZlciBhbmQKPj4+IGZpbmFsbHkgb3ZlcndyaXRpbmcgdGhlIGludGVyZXN0aW5nIHRyYWNlIGVu
dHJpZXMgb2YgdGhlIGhhbmdpbmcgY3B1Lgo+Pj4KPj4+IEluIG9yZGVyIHRvIGJlIGFibGUgdG8g
ZGVidWcgc3VjaCBzaXR1YXRpb25zIGFkZCB0aGUgY2FwYWJpbGl0eSB0byB1c2UKPj4+IHBlci1j
cHUgdHJhY2UgYnVmZmVycy4gVGhpcyBjYW4gYmUgc2VsZWN0ZWQgYnkgc3BlY2lmeWluZyB0aGUK
Pj4+IGRlYnVndHJhY2UgYm9vdCBwYXJhbWV0ZXIgd2l0aCB0aGUgbW9kaWZpZXIgImNwdToiLCBs
aWtlOgo+Pj4KPj4+ICAgIGRlYnVndHJhY2U9Y3B1OjE2Cj4+Pgo+Pj4gQXQgdGhlIHNhbWUgdGlt
ZSBzd2l0Y2ggdGhlIHBhcnNpbmcgZnVuY3Rpb24gdG8gYWNjZXB0IHNpemUgbW9kaWZpZXJzCj4+
PiAoZS5nLiA0TSBvciAxRykuCj4+Pgo+Pj4gUHJpbnRpbmcgb3V0IHRoZSB0cmFjZSBlbnRyaWVz
IGlzIGRvbmUgZm9yIGVhY2ggYnVmZmVyIGluIG9yZGVyIHRvCj4+PiBtaW5pbWl6ZSB0aGUgZWZm
b3J0IG5lZWRlZCBkdXJpbmcgcHJpbnRpbmcuIEFzIGVhY2ggZW50cnkgaXMgcHJlZml4ZWQKPj4+
IHdpdGggaXRzIHNlcXVlbmNlIG51bWJlciBzb3J0aW5nIHRoZSBlbnRyaWVzIGNhbiBlYXNpbHkg
YmUgZG9uZSB3aGVuCj4+PiBhbmFseXppbmcgdGhlbS4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBK
dWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Cj4+Cj4+IFJldmlld2VkLWJ5OiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gCj4gT2gsIG5vIC0gSSBoYXZlIHRvIHRha2UgdGhp
cyBiYWNrLiBMb29raW5nIGF0IHBhdGNoIDUgSSBub3RpY2UKPiB0aGF0IHlvdSBub3cgb25seSBl
dmVyIHdyaXRlIGxhc3RfY3B1OyB5b3UgbXVzdCBoYXZlIGxvc3QgaXRzCj4gY29uc3VtZXIuCgpP
aCwgaW5kZWVkLiBUaGFua3MgZm9yIHNwb3R0aW5nIHRoYXQuIFdpbGwgc2VuZCBvdXQgYSBjb3Jy
ZWN0ZWQgcGF0Y2gKc29vbi4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
