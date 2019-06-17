Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F0B47C2B
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2019 10:24:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hcmuA-0004X7-H3; Mon, 17 Jun 2019 08:22:18 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=LqB1=UQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hcmu9-0004Wx-6Z
 for xen-devel@lists.xenproject.org; Mon, 17 Jun 2019 08:22:17 +0000
X-Inumbo-ID: 03ed083f-90d9-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 03ed083f-90d9-11e9-8980-bc764e045a96;
 Mon, 17 Jun 2019 08:22:16 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Mon, 17 Jun 2019 02:22:15 -0600
Message-Id: <5D074DB30200007800238B87@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Mon, 17 Jun 2019 02:22:11 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>
References: <5CA35DE90200007800223E5A@prv1-mh.provo.novell.com>
 <5CA35DE902000000001041B1@prv1-mh.provo.novell.com>
 <5CA35DE90200007800232A87@prv1-mh.provo.novell.com>
 <5CEBADA20200007800232B72@prv1-mh.provo.novell.com>
In-Reply-To: <5CEBADA20200007800232B72@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [Xen-devel] =?utf-8?q?Ping=C2=B2=3A_=5BPATCH=5D_x86/IO-APIC=3A_du?=
 =?utf-8?q?mp_full_destination_ID_in_x2APIC_mode?=
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, WeiLiu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDI3LjA1LjE5IGF0IDExOjI4LCAgd3JvdGU6Cj4+Pj4gT24gMDIuMDQuMTkgYXQgMTU6
MDQsICB3cm90ZToKPiA+IEluIHgyQVBJQyBtb2RlIGl0IGlzIDMyIGJpdHMgd2lkZS4KPiA+IAo+
ID4gSW4gX19wcmludF9JT19BUElDKCkgZHJvcCBsb2dnaW5nIG9mIGJvdGggcGh5c2ljYWwgYW5k
IGxvZ2ljYWwgSURzOgo+ID4gVGhlIGxhdHRlciBjb3ZlcnMgYSBzdXBlcnNldCBvZiB0aGUgYml0
cyBvZiB0aGUgZm9ybWVyIGluIHRoZSBSVEUsIGFuZAo+ID4gd2Ugd3JpdGUgZnVsbCA4LWJpdCB2
YWx1ZXMgYW55d2F5IGV2ZW4gaW4gcGh5c2ljYWwgbW9kZSBmb3IgYWxsIG9yZGluYXJ5Cj4gPiBp
bnRlcnJ1cHRzLCByZWdhcmRsZXNzIG9mIElOVF9ERVNUX01PREUgKHNlZSB0aGUgdXNlcnMgb2Yg
U0VUX0RFU1QoKSkuCj4gPiAKPiA+IEFkanVzdCBvdGhlciBjb2x1bW4gYXJyYW5nZW1lbnQgKGFu
ZCBoZWFkaW5nKSBhIGxpdHRsZSBhcyB3ZWxsLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBKYW4g
QmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gPiAtLS0KPiA+IEknbSBzdXJlIEkgaGFkIGZv
dW5kIHNvbWUgcGxhY2Ugd2hlcmUgdGhlIHdpZGVyIGRlc3RpbmF0aW9uIElEIGlzCj4gPiBkb2N1
bWVudGVkIGZvciBwaHlzaWNhbCBtb2RlLCBidXQgSSB3YXNuJ3QgYWJsZSB0byBmaW5kIGl0IGFn
YWluIHdoZW4gSQo+ID4gc2VhcmNoZWQgbm93LiBBbGwgSW50ZWwgY2hpcHNldCBkb2NzIEkndmUg
bG9va2VkIGF0IGNsYWltIGl0J3Mgb25seSA0Cj4gPiBiaXRzIHRoYXQgYXJlIHVzZWQgLyBzdXBw
b3NlZCB0byBiZSBzdG9yZWQuCj4gPiAKPiA+IC0tLSBhL3hlbi9hcmNoL3g4Ni9pb19hcGljLmMK
PiA+ICsrKyBiL3hlbi9hcmNoL3g4Ni9pb19hcGljLmMKPiA+IEBAIC0xMTkxLDIxICsxMTkxLDIx
IEBAIHN0YXRpYyB2b2lkIC8qX19pbml0Ki8gX19wcmludF9JT19BUElDKGIKPiA+ICAKPiA+ICAJ
cHJpbnRrKEtFUk5fREVCVUcgIi4uLi4gSVJRIHJlZGlyZWN0aW9uIHRhYmxlOlxuIik7Cj4gPiAg
Cj4gPiAtCXByaW50ayhLRVJOX0RFQlVHICIgTlIgTG9nIFBoeSBNYXNrIFRyaWcgSVJSIFBvbCIK
PiA+IC0gICAgICAgICAgICAgICAiIFN0YXQgRGVzdCBEZWxpIFZlY3Q6ICAgXG4iKTsKPiA+ICsJ
cHJpbnRrKEtFUk5fREVCVUcgIiBOUiAlcyBNc2sgVHJnIElSUiBQb2wgU3RhdCBEc3RNIERlbE0g
VmVjXG4iLAo+ID4gKyAgICAgICAgICAgICAgIHgyYXBpY19lbmFibGVkID8gIiBEZXN0SUQiIDog
IkRzdCIpOwo+ID4gIAo+ID4gIAlmb3IgKGkgPSAwOyBpIDw9IHJlZ18wMS5iaXRzLmVudHJpZXM7
IGkrKykgewo+ID4gICAgICAgICAgICAgIHN0cnVjdCBJT19BUElDX3JvdXRlX2VudHJ5IGVudHJ5
Owo+ID4gIAo+ID4gICAgICAgICAgICAgIGVudHJ5ID0gaW9hcGljX3JlYWRfZW50cnkoYXBpYywg
aSwgMCk7Cj4gPiAgCj4gPiAtICAgICAgICAgICAgcHJpbnRrKEtFUk5fREVCVUcgIiAlMDJ4ICUw
M1ggJTAyWCAgIiwKPiA+IC0gICAgICAgICAgICAgICAgICAgaSwKPiA+IC0gICAgICAgICAgICAg
ICAgICAgZW50cnkuZGVzdC5sb2dpY2FsLmxvZ2ljYWxfZGVzdCwKPiA+IC0gICAgICAgICAgICAg
ICAgICAgZW50cnkuZGVzdC5waHlzaWNhbC5waHlzaWNhbF9kZXN0Cj4gPiAtCQkpOwo+ID4gKyAg
ICAgICAgICAgIGlmICggeDJhcGljX2VuYWJsZWQgKQo+ID4gKyAgICAgICAgICAgICAgICBwcmlu
dGsoS0VSTl9ERUJVRyAiICUwMnggJTA4eCIsIGksIGVudHJ5LmRlc3QuZGVzdDMyKTsKPiA+ICsg
ICAgICAgICAgICBlbHNlCj4gPiArICAgICAgICAgICAgICAgIHByaW50ayhLRVJOX0RFQlVHICIg
JTAyeCAgJTAyeCAiLCBpLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgZW50cnkuZGVzdC5s
b2dpY2FsLmxvZ2ljYWxfZGVzdCk7Cj4gPiAgCj4gPiAtICAgICAgICAgICAgcHJpbnRrKCIlMWQg
ICAgJTFkICAgICUxZCAgICUxZCAgICUxZCAgICAlMWQgICAgJTFkICAgICUwMlhcbiIsCj4gPiAr
ICAgICAgICAgICAgcHJpbnRrKCIgJWQgICAlZCAgICVkICAgJWQgICAlZCAgICAlZCAgICAlZCAg
ICAlMDJYXG4iLAo+ID4gICAgICAgICAgICAgICAgICAgICBlbnRyeS5tYXNrLAo+ID4gICAgICAg
ICAgICAgICAgICAgICBlbnRyeS50cmlnZ2VyLAo+ID4gICAgICAgICAgICAgICAgICAgICBlbnRy
eS5pcnIsCj4gPiBAQCAtMjQ4MSwxMiArMjQ4MSwxNCBAQCB2b2lkIGR1bXBfaW9hcGljX2lycV9p
bmZvKHZvaWQpCj4gPiAgICAgICAgICAgICAgcnRlID0gaW9hcGljX3JlYWRfZW50cnkoZW50cnkt
PmFwaWMsIHBpbiwgMCk7Cj4gPiAgCj4gPiAgICAgICAgICAgICAgcHJpbnRrKCJ2ZWM9JTAyeCBk
ZWxpdmVyeT0lLTVzIGRlc3Q9JWMgc3RhdHVzPSVkICIKPiA+IC0gICAgICAgICAgICAgICAgICAg
InBvbGFyaXR5PSVkIGlycj0lZCB0cmlnPSVjIG1hc2s9JWQgZGVzdF9pZDolZFxuIiwKPiA+ICsg
ICAgICAgICAgICAgICAgICAgInBvbGFyaXR5PSVkIGlycj0lZCB0cmlnPSVjIG1hc2s9JWQgZGVz
dF9pZDolMCp4XG4iLAo+ID4gICAgICAgICAgICAgICAgICAgICBydGUudmVjdG9yLCBkZWxpdmVy
eV9tb2RlXzJfc3RyKHJ0ZS5kZWxpdmVyeV9tb2RlKSwKPiA+ICAgICAgICAgICAgICAgICAgICAg
cnRlLmRlc3RfbW9kZSA/ICdMJyA6ICdQJywKPiA+ICAgICAgICAgICAgICAgICAgICAgcnRlLmRl
bGl2ZXJ5X3N0YXR1cywgcnRlLnBvbGFyaXR5LCBydGUuaXJyLAo+ID4gICAgICAgICAgICAgICAg
ICAgICBydGUudHJpZ2dlciA/ICdMJyA6ICdFJywgcnRlLm1hc2ssCj4gPiAtICAgICAgICAgICAg
ICAgICAgIHJ0ZS5kZXN0LmxvZ2ljYWwubG9naWNhbF9kZXN0KTsKPiA+ICsgICAgICAgICAgICAg
ICAgICAgeDJhcGljX2VuYWJsZWQgPyA4IDogMiwKPiA+ICsgICAgICAgICAgICAgICAgICAgeDJh
cGljX2VuYWJsZWQgPyBydGUuZGVzdC5kZXN0MzIKPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgOiBydGUuZGVzdC5sb2dpY2FsLmxvZ2ljYWxfZGVzdCk7Cj4gPiAgCj4gPiAg
ICAgICAgICAgICAgaWYgKCBlbnRyeS0+bmV4dCA9PSAwICkKPiA+ICAgICAgICAgICAgICAgICAg
YnJlYWs7Cj4gPiAKPiA+IAo+ID4gCj4gPiAKPiAKPiAKPiAKPiAKCgoKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
