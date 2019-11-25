Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 525051091C2
	for <lists+xen-devel@lfdr.de>; Mon, 25 Nov 2019 17:25:05 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZH80-0005U8-2N; Mon, 25 Nov 2019 16:22:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=yJnJ=ZR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iZH7y-0005U3-Fc
 for xen-devel@lists.xenproject.org; Mon, 25 Nov 2019 16:22:18 +0000
X-Inumbo-ID: bf19be96-0f9f-11ea-9455-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bf19be96-0f9f-11ea-9455-bc764e2007e4;
 Mon, 25 Nov 2019 16:22:17 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 3A2E4C22B;
 Mon, 25 Nov 2019 16:22:16 +0000 (UTC)
To: Anthony PERARD <anthony.perard@citrix.com>
References: <20191125145915.106589-1-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <166a5c3f-a096-9d35-670f-e7f50da847ef@suse.com>
Date: Mon, 25 Nov 2019 17:22:19 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191125145915.106589-1-anthony.perard@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [XEN PATCH for-4.13 v2] x86/domctl: have
 XEN_DOMCTL_getpageframeinfo3 preemptible
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 AndrewCooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjUuMTEuMjAxOSAxNTo1OSwgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4gVGhpcyBoeXBlcmNh
bGwgY2FuIHRha2UgYSBsb25nIHRpbWUgdG8gZmluaXNoIGJlY2F1c2UgaXQgYXR0ZW1wdHMgdG8K
PiBncmFiIHRoZSBgaG9zdHAybScgbG9jayB1cCB0byAxMDI0IHRpbWVzLiBUaGUgYWNjdW11bGF0
ZWQgd2FpdCBmb3IgdGhlCj4gbG9jayBjYW4gdGFrZSBzZXZlcmFsIHNlY29uZHMuCj4gCj4gVGhp
cyBjYW4gZWFzaWx5IGhhcHBlbiB3aXRoIGEgZ3Vlc3Qgd2l0aCAzMiB2Y3B1cyBhbmQgcGxlbnR5
IG9mIFJBTSwKPiBkdXJpbmcgbG9jYWxob3N0IG1pZ3JhdGlvbi4KPiAKPiBTaWduZWQtb2ZmLWJ5
OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KCkFzIGluZGljYXRl
ZCBvbiB2MSBhbHJlYWR5LCB0aGlzIGJlaW5nIGEgd29ya2Fyb3VuZCByYXRoZXIgdGhhbiBhIGZp
eApzaG91bGQgYmUgc3RhdGVkIGNsZWFybHkgaW4gdGhlIGRlc2NyaXB0aW9uLiBFc3BlY2lhbGx5
IGlmIG1vcmUgc3VjaApvcGVyYXRpb25zIHR1cm4gdXAsIGl0J2xsIGJlY29tZSBpbmNyZWFzaW5n
bHkgb2J2aW91cyB0aGF0IHRoZSByb290Cm9mIHRoZSBwcm9ibGVtIHdpbGwgbmVlZCBkZWFsaW5n
IHdpdGggcmF0aGVyIHRoYW4gcGFwZXJpbmcgb3ZlciBzb21lCm9mIHRoZSBzeW1wdG9tcy4gV2l0
aCB0aGlzIHRha2VuIGNhcmUgb2YgSSdkIGJlIChzdGlsbCBoZXNpdGFudGx5KQp3aWxsaW5nIHRv
IGdpdmUgbXkgYWNrIGZvciB0aGlzIGFzIGEgc2hvcnQgdGVybSAic29sdXRpb24iLgoKPiAtLS0g
YS94ZW4vYXJjaC94ODYvZG9tY3RsLmMKPiArKysgYi94ZW4vYXJjaC94ODYvZG9tY3RsLmMKPiBA
QCAtNDI1LDYgKzQyNSwyNiBAQCBsb25nIGFyY2hfZG9fZG9tY3RsKAo+ICAgICAgICAgICAgICAg
ICAgcmV0ID0gLUVGQVVMVDsKPiAgICAgICAgICAgICAgICAgIGJyZWFrOwo+ICAgICAgICAgICAg
ICB9Cj4gKwo+ICsgICAgICAgICAgICAvKgo+ICsgICAgICAgICAgICAgKiBBdm9pZCBjaGVja2lu
ZyBmb3IgcHJlZW1wdGlvbiB3aGVuIHRoZSBgaG9zdHAybScgbG9jayBpc24ndAo+ICsgICAgICAg
ICAgICAgKiBpbnZvbHZlLCBpLmUuIG5vbi10cmFuc2xhdGVkIGd1ZXN0LCBhbmQgYXZvaWQgcHJl
ZW1wdGlvbiBvbgo+ICsgICAgICAgICAgICAgKiB0aGUgbGFzdCBpdGVyYXRpb24uCj4gKyAgICAg
ICAgICAgICAqLwo+ICsgICAgICAgICAgICBpZiAoIHBhZ2luZ19tb2RlX3RyYW5zbGF0ZShkKSAm
Jgo+ICsgICAgICAgICAgICAgICAgIGxpa2VseSgoaSArIDEpIDwgbnVtKSAmJiBoeXBlcmNhbGxf
cHJlZW1wdF9jaGVjaygpICkKPiArICAgICAgICAgICAgewo+ICsgICAgICAgICAgICAgICAgZG9t
Y3RsLT51LmdldHBhZ2VmcmFtZWluZm8zLm51bSA9IG51bSAtIGkgLSAxOwo+ICsgICAgICAgICAg
ICAgICAgZG9tY3RsLT51LmdldHBhZ2VmcmFtZWluZm8zLmFycmF5LnAgPQo+ICsgICAgICAgICAg
ICAgICAgICAgIGd1ZXN0X2hhbmRsZSArICgoaSArIDEpICogd2lkdGgpOwo+ICsgICAgICAgICAg
ICAgICAgaWYgKCBfX2NvcHlfdG9fZ3Vlc3QodV9kb21jdGwsIGRvbWN0bCwgMSkgKQo+ICsgICAg
ICAgICAgICAgICAgewo+ICsgICAgICAgICAgICAgICAgICAgIHJldCA9IC1FRkFVTFQ7Cj4gKyAg
ICAgICAgICAgICAgICAgICAgYnJlYWs7Cj4gKyAgICAgICAgICAgICAgICB9Cj4gKyAgICAgICAg
ICAgICAgICByZXR1cm4gaHlwZXJjYWxsX2NyZWF0ZV9jb250aW51YXRpb24oX19IWVBFUlZJU09S
X2RvbWN0bCwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAiaCIsIHVfZG9tY3RsKTsKPiArICAgICAgICAgICAgfQo+ICAgICAgICAgIH0KPiAg
Cj4gICAgICAgICAgYnJlYWs7Cj4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3B1YmxpYy9kb21j
dGwuaCBiL3hlbi9pbmNsdWRlL3B1YmxpYy9kb21jdGwuaAo+IGluZGV4IGEwM2U4MGU1OTg0YS4u
MWI2OWViNzVjYjIwIDEwMDY0NAo+IC0tLSBhL3hlbi9pbmNsdWRlL3B1YmxpYy9kb21jdGwuaAo+
ICsrKyBiL3hlbi9pbmNsdWRlL3B1YmxpYy9kb21jdGwuaAo+IEBAIC0xNjMsNiArMTYzLDEwIEBA
IERFRklORV9YRU5fR1VFU1RfSEFORExFKHhlbl9kb21jdGxfZ2V0ZG9tYWluaW5mb190KTsKPiAg
I2RlZmluZSBYRU5fRE9NQ1RMX1BGSU5GT19MVEFCX01BU0sgKDB4ZlU8PDI4KQo+ICAKPiAgLyog
WEVOX0RPTUNUTF9nZXRwYWdlZnJhbWVpbmZvMyAqLwo+ICsvKgo+ICsgKiBCb3RoIHZhbHVlIGBu
dW0nIGFuZCBgYXJyYXknIGFyZSBtb2RpZmllZCBieSB0aGUgaHlwZXJjYWxsIHRvIGFsbG93Cj4g
KyAqIHByZWVtcHRpb24uCgpzL2FyZS9tYXkgYmUvID8KCklmIEp1ZXJnZW4gd2FudHMgdG8gc3Rp
bGwgYWxsb3cgdGhpcyBpbiwgSSdkIGJlIGZpbmUgdGFraW5nIGNhcmUgb2YgYm90aApyZW1hcmtz
IHdoaWxlIGNvbW1pdHRpbmcuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
