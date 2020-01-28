Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A42D14BCE5
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2020 16:34:12 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwSpD-0001HF-J7; Tue, 28 Jan 2020 15:30:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=pdAI=3R=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1iwSpB-0001HA-Aj
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2020 15:30:45 +0000
X-Inumbo-ID: 2632b3b0-41e3-11ea-8717-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2632b3b0-41e3-11ea-8717-12813bfff9fa;
 Tue, 28 Jan 2020 15:30:44 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1iwSp8-0002v0-8t; Tue, 28 Jan 2020 15:30:42 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1iwSp7-0003CC-Sp; Tue, 28 Jan 2020 15:30:42 +0000
Date: Tue, 28 Jan 2020 15:30:37 +0000
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200128153037.i4jmifa2rk7y2egm@debian>
References: <20200122202343.5703-1-liuwe@microsoft.com>
 <20200122202343.5703-3-liuwe@microsoft.com>
 <06b7abf9-69c2-9f62-d55a-d8c2e684557a@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <06b7abf9-69c2-9f62-d55a-d8c2e684557a@suse.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH v4 2/7] x86/hyperv: setup hypercall page
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
Cc: Wei Liu <liuwe@microsoft.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <pdurrant@amazon.com>, Michael Kelley <mikelley@microsoft.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBKYW4gMjMsIDIwMjAgYXQgMTI6MTg6NDFQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMjIuMDEuMjAyMCAyMToyMywgV2VpIExpdSB3cm90ZToKPiA+IC0tLSBhL3hlbi9h
cmNoL3g4Ni9lODIwLmMKPiA+ICsrKyBiL3hlbi9hcmNoL3g4Ni9lODIwLmMKPiA+IEBAIC0zNiw2
ICszNiwyMiBAQCBib29sZWFuX3BhcmFtKCJlODIwLXZlcmJvc2UiLCBlODIwX3ZlcmJvc2UpOwo+
ID4gIHN0cnVjdCBlODIwbWFwIGU4MjA7Cj4gPiAgc3RydWN0IGU4MjBtYXAgX19pbml0ZGF0YSBl
ODIwX3JhdzsKPiA+ICAKPiA+ICtzdGF0aWMgdW5zaWduZWQgaW50IGZpbmRfcGh5c19hZGRyX2Jp
dHModm9pZCkKPiA+ICt7Cj4gPiArICAgIHVpbnQzMl90IGVheDsKPiA+ICsgICAgdW5zaWduZWQg
aW50IHBoeXNfYml0cyA9IDM2Owo+ID4gKwo+ID4gKyAgICBlYXggPSBjcHVpZF9lYXgoMHg4MDAw
MDAwMCk7Cj4gPiArICAgIGlmICggKGVheCA+PiAxNikgPT0gMHg4MDAwICYmIGVheCA+PSAweDgw
MDAwMDA4ICkKPiA+ICsgICAgewo+ID4gKyAgICAgICAgcGh5c19iaXRzID0gKHVpbnQ4X3QpY3B1
aWRfZWF4KDB4ODAwMDAwMDgpOwo+ID4gKyAgICAgICAgaWYgKCBwaHlzX2JpdHMgPiBQQUREUl9C
SVRTICkKPiA+ICsgICAgICAgICAgICBwaHlzX2JpdHMgPSBQQUREUl9CSVRTOwo+ID4gKyAgICB9
Cj4gPiArCj4gPiArICAgIHJldHVybiBwaHlzX2JpdHM7Cj4gPiArfQo+IAo+IEluc3RlYWQgb2Yg
dGhpcywgaG93IGFib3V0IHB1bGxpbmcgZnVydGhlciBhaGVhZCB0aGUgY2FsbCB0bwo+IGVhcmx5
X2NwdV9pbml0KCkgaW4gc2V0dXAuYz8gKE90aGVyd2lzZSB0aGUgZnVuY3Rpb24gd2FudHMgdG8K
PiBiZSBfX2luaXQgYXQgbGVhc3QuKQoKSSBjYW4gY2VydGFpbmx5IHRyeSB0aGF0LCBidXQgdGhh
dCB3b3VsZCByZXF1aXJlIG1vZGlmeWluZyBlODIwLmMKbm9uZXRoZWxlc3MgYmVjYXVzZSB3ZSBj
YW4gZHJvcCB0aGUgY3B1aWQgaW52b2NhdGlvbiBoZXJlIGlmIHRoZSBtb3ZlIGlzCnN1Y2Nlc3Nm
dWwuCgo+IAo+ID4gQEAgLTM1Nyw2ICszNzMsMjEgQEAgc3RhdGljIHVuc2lnbmVkIGxvbmcgX19p
bml0IGZpbmRfbWF4X3Bmbih2b2lkKQo+ID4gICAgICAgICAgICAgIG1heF9wZm4gPSBlbmQ7Cj4g
PiAgICAgIH0KPiA+ICAKPiA+ICsjaWZkZWYgQ09ORklHX0hZUEVSVl9HVUVTVAo+ID4gKyAgICB7
Cj4gPiArCS8qCj4gPiArCSAqIFdlIHJlc2VydmUgdGhlIHRvcC1tb3N0IHBhZ2UgZm9yIGh5cGVy
Y2FsbCBwYWdlLiBBZGp1c3QKPiA+ICsJICogbWF4X3BmbiBpZiBuZWNlc3NhcnkuCj4gPiArCSAq
Lwo+ID4gKyAgICAgICAgdW5zaWduZWQgaW50IHBoeXNfYml0cyA9IGZpbmRfcGh5c19hZGRyX2Jp
dHMoKTsKPiA+ICsgICAgICAgIHVuc2lnbmVkIGxvbmcgaGNhbGxfcGZuID0KPiA+ICsgICAgICAg
ICAgKCgxdWxsIDw8IHBoeXNfYml0cykgLSAxKSA+PiBQQUdFX1NISUZUOwo+ID4gKwo+ID4gKyAg
ICAgICAgaWYgKCBtYXhfcGZuID49IGhjYWxsX3BmbiApCj4gPiArICAgICAgICAgIG1heF9wZm4g
PSBoY2FsbF9wZm4gLSAxOwo+ID4gKyAgICB9Cj4gPiArI2VuZGlmCj4gCj4gVGhpcyB3YW50cyBh
YnN0cmFjdGluZyBhd2F5OiBUaGVyZSBzaG91bGRuJ3QgYmUgSHlwZXItViBzcGVjaWZpYwo+IGNv
ZGUgaW4gaGVyZSBpZiBhdCBhbGwgcG9zc2libGUsIGFuZCB0aGUgYWRqdXN0bWVudCBhbHNvIHNo
b3VsZG4ndAo+IGJlIG1hZGUgdW5sZXNzIGFjdHVhbGx5IHJ1bm5pbmcgb24gSHlwZXItVi4KPiAK
Ckkgd2lsbCBpbnRyb2R1Y2UgYSBob29rIGNhbGxlZCBoeXBlcnZpc29yX3Jlc2VydmVfdG9wX3Bh
Z2VzLgoKPiA+IC0tLSBhL3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvaHlwZXJ2LmMKPiA+ICsr
KyBiL3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvaHlwZXJ2LmMKPiA+IEBAIC0xOCwxNyArMTgs
MjcgQEAKWy4uLl0KPiA+IEBAIC03Miw2ICs4Miw0MyBAQCBjb25zdCBzdHJ1Y3QgaHlwZXJ2aXNv
cl9vcHMgKl9faW5pdCBoeXBlcnZfcHJvYmUodm9pZCkKPiA+ICAgICAgcmV0dXJuICZvcHM7Cj4g
PiAgfQo+ID4gIAo+ID4gK3N0YXRpYyB2b2lkIF9faW5pdCBzZXR1cF9oeXBlcmNhbGxfcGFnZSh2
b2lkKQo+ID4gK3sKPiA+ICsgICAgdW5pb24gaHZfeDY0X21zcl9oeXBlcmNhbGxfY29udGVudHMg
aHlwZXJjYWxsX21zcjsKPiA+ICsgICAgdW5pb24gaHZfZ3Vlc3Rfb3NfaWQgZ3Vlc3RfaWQ7Cj4g
PiArICAgIHVuc2lnbmVkIGxvbmcgbWZuOwo+ID4gKwo+ID4gKyAgICByZG1zcmwoSFZfWDY0X01T
Ul9HVUVTVF9PU19JRCwgZ3Vlc3RfaWQucmF3KTsKPiA+ICsgICAgaWYgKCAhZ3Vlc3RfaWQucmF3
ICkKPiA+ICsgICAgewo+ID4gKyAgICAgICAgZ3Vlc3RfaWQucmF3ID0gZ2VuZXJhdGVfZ3Vlc3Rf
aWQoKTsKPiA+ICsgICAgICAgIHdybXNybChIVl9YNjRfTVNSX0dVRVNUX09TX0lELCBndWVzdF9p
ZC5yYXcpOwo+ID4gKyAgICB9Cj4gPiArCj4gPiArICAgIHJkbXNybChIVl9YNjRfTVNSX0hZUEVS
Q0FMTCwgaHlwZXJjYWxsX21zci5hc191aW50NjQpOwo+ID4gKyAgICBpZiAoICFoeXBlcmNhbGxf
bXNyLmVuYWJsZSApCj4gPiArICAgIHsKPiA+ICsgICAgICAgIG1mbiA9ICgoMXVsbCA8PCBwYWRk
cl9iaXRzKSAtIDEpID4+IEhWX0hZUF9QQUdFX1NISUZUOwo+IAo+IEFsb25nIHRoZSBsaW5lcyBv
ZiB0aGUgYWJzdHJhY3RpbmctYXdheSByZXF1ZXN0IGFib3ZlOiBIb3cgaXMKPiBhbnlvbmUgdG8g
bm90aWNlIHdoYXQgZWxzZSBuZWVkcyBjaGFuZ2luZyBpZiBpdCBpcyBkZWNpZGVkCj4gdGhhdCB0
aGlzIHBhZ2UgZ2V0cyBtb3ZlZCBlbHNld2hlcmU/CgpJIGRvbid0IGhhdmUgYSBnb29kIGFuc3dl
ciB0byB0aGlzIG90aGVyIHRoYW4gZG9jdW1lbnRpbmcuIEl0IGlzCnByb2JhYmx5IGFzIGZyYWdp
bGUgYXMgbGl2ZXBhdGNoIG9yIHBjcHUgc3R1Yi4KCj4gCj4gPiArICAgICAgICBoeXBlcmNhbGxf
bXNyLmVuYWJsZSA9IDE7Cj4gPiArICAgICAgICBoeXBlcmNhbGxfbXNyLmd1ZXN0X3BoeXNpY2Fs
X2FkZHJlc3MgPSBtZm47Cj4gPiArICAgICAgICB3cm1zcmwoSFZfWDY0X01TUl9IWVBFUkNBTEws
IGh5cGVyY2FsbF9tc3IuYXNfdWludDY0KTsKPiAKPiBTbyBvbiBIeXBlci1WIHRoZSBoeXBlcnZp
c29yIG1hZ2ljYWxseSBwb3B1bGF0ZXMgdGhpcyBwYWdlIGFzCj4gYSBzaWRlIGVmZmVjdCBvZiB0
aGUgTVNSIHdyaXRlPwoKWWVzLiBTZWUgTWljaGFlbCdzIHJlcGx5LgoKV2VpLgoKPiAKPiBKYW4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
