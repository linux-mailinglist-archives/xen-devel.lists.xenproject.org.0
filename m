Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41644162490
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2020 11:30:19 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j405m-0003E5-7r; Tue, 18 Feb 2020 10:27:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=cz2h=4G=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1j405k-0003DG-DD
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2020 10:27:00 +0000
X-Inumbo-ID: 31dc3dd8-5239-11ea-8146-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 31dc3dd8-5239-11ea-8146-12813bfff9fa;
 Tue, 18 Feb 2020 10:26:59 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1j405i-000162-6x; Tue, 18 Feb 2020 10:26:58 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1j405h-0003Kg-U9; Tue, 18 Feb 2020 10:26:58 +0000
Date: Mon, 17 Feb 2020 23:05:04 +0000
From: Wei Liu <wl@xen.org>
To: Michael Kelley <mikelley@microsoft.com>
Message-ID: <20200217230504.j7amyhu34m66i5y4@debian>
References: <20200217135517.5826-1-liuwe@microsoft.com>
 <20200217135517.5826-4-liuwe@microsoft.com>
 <MW2PR2101MB10521C77BCE006C4345D1D51D7160@MW2PR2101MB1052.namprd21.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <MW2PR2101MB10521C77BCE006C4345D1D51D7160@MW2PR2101MB1052.namprd21.prod.outlook.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH v3 3/3] x86/hyperv: L0 assisted TLB flush
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
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Jan Beulich <jbeulich@suse.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBGZWIgMTcsIDIwMjAgYXQgMDc6NTE6NDJQTSArMDAwMCwgTWljaGFlbCBLZWxsZXkg
d3JvdGU6Cj4gRnJvbTogV2VpIExpdSA8d2VpLmxpdS54ZW5AZ21haWwuY29tPiBPbiBCZWhhbGYg
T2YgV2VpIExpdQo+IAo+IFtzbmlwXQo+IAo+ID4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9n
dWVzdC9oeXBlcnYvdXRpbC5jIGIveGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi91dGlsLmMKPiA+
IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gPiBpbmRleCAwMDAwMDAwMDAwLi4wYWJiMzdiMDVmCj4g
PiAtLS0gL2Rldi9udWxsCj4gPiArKysgYi94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L3V0aWwu
Ywo+ID4gQEAgLTAsMCArMSw3NCBAQAo+ID4gKy8qKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKgo+ID4gKioqKgo+
ID4gKyAqIGFyY2gveDg2L2d1ZXN0L2h5cGVydi91dGlsLmMKPiA+ICsgKgo+ID4gKyAqIEh5cGVy
LVYgdXRpbGl0eSBmdW5jdGlvbnMKPiA+ICsgKgo+ID4gKyAqIFRoaXMgcHJvZ3JhbSBpcyBmcmVl
IHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQvb3IgbW9kaWZ5Cj4gPiArICog
aXQgdW5kZXIgdGhlIHRlcm1zIG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBhcyBw
dWJsaXNoZWQgYnkKPiA+ICsgKiB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uOyBlaXRoZXIg
dmVyc2lvbiAyIG9mIHRoZSBMaWNlbnNlLCBvcgo+ID4gKyAqIChhdCB5b3VyIG9wdGlvbikgYW55
IGxhdGVyIHZlcnNpb24uCj4gPiArICoKPiA+ICsgKiBUaGlzIHByb2dyYW0gaXMgZGlzdHJpYnV0
ZWQgaW4gdGhlIGhvcGUgdGhhdCBpdCB3aWxsIGJlIHVzZWZ1bCwKPiA+ICsgKiBidXQgV0lUSE9V
VCBBTlkgV0FSUkFOVFk7IHdpdGhvdXQgZXZlbiB0aGUgaW1wbGllZCB3YXJyYW50eSBvZgo+ID4g
KyAqIE1FUkNIQU5UQUJJTElUWSBvciBGSVRORVNTIEZPUiBBIFBBUlRJQ1VMQVIgUFVSUE9TRS4g
IFNlZSB0aGUKPiA+ICsgKiBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBmb3IgbW9yZSBkZXRh
aWxzLgo+ID4gKyAqCj4gPiArICogWW91IHNob3VsZCBoYXZlIHJlY2VpdmVkIGEgY29weSBvZiB0
aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UKPiA+ICsgKiBhbG9uZyB3aXRoIHRoaXMgcHJv
Z3JhbTsgSWYgbm90LCBzZWUgaHR0cHM6Ly93d3cuZ251Lm9yZy9saWNlbnNlcy8uCj4gPiArICoK
PiA+ICsgKiBDb3B5cmlnaHQgKGMpIDIwMjAgTWljcm9zb2Z0Lgo+ID4gKyAqLwo+ID4gKwo+ID4g
KyNpbmNsdWRlIDx4ZW4vY3B1Lmg+Cj4gPiArI2luY2x1ZGUgPHhlbi9jcHVtYXNrLmg+Cj4gPiAr
I2luY2x1ZGUgPHhlbi9lcnJuby5oPgo+ID4gKwo+ID4gKyNpbmNsdWRlIDxhc20vZ3Vlc3QvaHlw
ZXJ2Lmg+Cj4gPiArI2luY2x1ZGUgPGFzbS9ndWVzdC9oeXBlcnYtdGxmcy5oPgo+ID4gKwo+ID4g
KyNpbmNsdWRlICJwcml2YXRlLmgiCj4gPiArCj4gPiAraW50IGNwdW1hc2tfdG9fdnBzZXQoc3Ry
dWN0IGh2X3Zwc2V0ICp2cHNldCwKPiA+ICsgICAgICAgICAgICAgICAgICAgICBjb25zdCBjcHVt
YXNrX3QgKm1hc2spCj4gPiArewo+ID4gKyAgICBpbnQgbnIgPSAxOwo+ID4gKyAgICB1bnNpZ25l
ZCBpbnQgY3B1LCB2Y3B1X2JhbmssIHZjcHVfb2Zmc2V0Owo+ID4gKyAgICB1bnNpZ25lZCBpbnQg
bWF4X2JhbmtzID0gbXNfaHlwZXJ2Lm1heF92cF9pbmRleCAvIDY0Owo+ID4gKwo+ID4gKyAgICAv
KiBVcCB0byA2NCBiYW5rcyBjYW4gYmUgcmVwcmVzZW50ZWQgYnkgdmFsaWRfYmFua19tYXNrICov
Cj4gPiArICAgIGlmICggbWF4X2JhbmtzID4gNjQgKQo+ID4gKyAgICAgICAgcmV0dXJuIC1FMkJJ
RzsKPiA+ICsKPiA+ICsgICAgLyogQ2xlYXIgYWxsIGJhbmtzIHRvIGF2b2lkIGZsdXNoaW5nIHVu
d2FudGVkIENQVXMgKi8KPiA+ICsgICAgZm9yICggdmNwdV9iYW5rID0gMDsgdmNwdV9iYW5rIDwg
bWF4X2JhbmtzOyB2Y3B1X2JhbmsrKyApCj4gPiArICAgICAgICB2cHNldC0+YmFua19jb250ZW50
c1t2Y3B1X2JhbmtdID0gMDsKPiA+ICsKPiA+ICsgICAgdnBzZXQtPnZhbGlkX2JhbmtfbWFzayA9
IDA7Cj4gPiArICAgIHZwc2V0LT5mb3JtYXQgPSBIVl9HRU5FUklDX1NFVF9TUEFSU0VfNEs7Cj4g
PiArCj4gPiArICAgIGZvcl9lYWNoX2NwdSAoIGNwdSwgbWFzayApCj4gPiArICAgIHsKPiA+ICsg
ICAgICAgIHVuc2lnbmVkIGludCB2Y3B1ID0gaHZfdnBfaW5kZXgoY3B1KTsKPiA+ICsKPiA+ICsg
ICAgICAgIHZjcHVfYmFuayA9IHZjcHUgLyA2NDsKPiA+ICsgICAgICAgIHZjcHVfb2Zmc2V0ID0g
dmNwdSAlIDY0Owo+ID4gKwo+ID4gKyAgICAgICAgX19zZXRfYml0KHZjcHVfb2Zmc2V0LCAmdnBz
ZXQtPmJhbmtfY29udGVudHNbdmNwdV9iYW5rXSk7Cj4gPiArICAgICAgICBfX3NldF9iaXQodmNw
dV9iYW5rLCAmdnBzZXQtPnZhbGlkX2JhbmtfbWFzayk7Cj4gCj4gVGhpcyBhcHByb2FjaCB0byBz
ZXR0aW5nIHRoZSBiaXRzIGluIHRoZSB2YWxpZF9iYW5rX21hc2sgY2F1c2VzIGEgYnVnLgo+IElm
IGFuIGVudGlyZSA2NC1iaXQgd29yZCBpbiB0aGUgYmFua19jb250ZW50cyBhcnJheSBpcyB6ZXJv
IGJlY2F1c2UgdGhlcmUKPiBhcmUgbm8gQ1BVcyBpbiB0aGF0IHJhbmdlLCB0aGUgY29ycmVzcG9u
ZGluZyBiaXQgaW4gdmFsaWRfYmFua19tYXNrIHN0aWxsCj4gbXVzdCBiZSBzZXQgdG8gdGVsbCBI
eXBlci1WIHRoYXQgdGhlIDY0LWJpdCB3b3JkIGlzIHByZXNlbnQgaW4gdGhlIGFycmF5Cj4gYW5k
IHNob3VsZCBiZSBwcm9jZXNzZWQsIGV2ZW4gdGhvdWdoIHRoZSBjb250ZW50IGlzIHplcm8uICBB
IHplcm8gYml0Cj4gaW4gdmFsaWRfYmFua19tYXNrIGluZGljYXRlcyB0aGF0IHRoZSBjb3JyZXNw
b25kaW5nIDY0LWJpdCB3b3JkIGluIHRoZQo+IGFycmF5IGlzIG5vdCBwcmVzZW50LCBhbmQgZXZl
cnkgNjQtYml0IHdvcmQgYWJvdmUgaXQgaGFzIGJlZW4gc2hpZnRlZCBkb3duLgo+IFRoYXQncyB3
aHkgdGhlIHNpbWlsYXIgTGludXggZnVuY3Rpb24gc2V0cyB2YWxpZF9iYW5rX21hc2sgdGhlIHdh
eSB0aGF0Cj4gaXQgZG9lcy4KCk9oLCBpbnRlcmVzdGluZy4gVExGUyBpc24ndCBleHBsaWNpdCBh
Ym91dCB0aGlzICJzaGlmdC1kb3duIiBwcm9wZXJ0eS4gSQp0aG91Z2h0IGl0IHByZXNlbnRlZCB0
aGUgZXhhbXBsZSBhcyBhIGNvbXBhY3QgYXJyYXkgYmVjYXVzZSB0aGV5IHdhbnRlZAp0byBub3Qg
aW5zZXJ0IGRvemVucyBvZiB6ZXJvcy4KCkkgd2lsbCBmaXggdGhpcyBpbiB0aGUgbmV4dCB2ZXJz
aW9uLgoKV2VpLgoKPiAKPiBNaWNoYWVsCj4gCj4gPiArCj4gPiArICAgICAgICBpZiAoIHZjcHVf
YmFuayA+PSBuciApCj4gPiArICAgICAgICAgICAgbnIgPSB2Y3B1X2JhbmsgKyAxOwo+ID4gKyAg
ICB9Cj4gPiArCj4gPiArICAgIHJldHVybiBucjsKPiA+ICt9Cj4gPiArCj4gPiArLyoKPiA+ICsg
KiBMb2NhbCB2YXJpYWJsZXM6Cj4gPiArICogbW9kZTogQwo+ID4gKyAqIGMtZmlsZS1zdHlsZTog
IkJTRCIKPiA+ICsgKiBjLWJhc2ljLW9mZnNldDogNAo+ID4gKyAqIHRhYi13aWR0aDogNAo+ID4g
KyAqIGluZGVudC10YWJzLW1vZGU6IG5pbAo+ID4gKyAqIEVuZDoKPiA+ICsgKi8KPiA+IC0tCj4g
PiAyLjIwLjEKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
