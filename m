Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04DBC14A94A
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2020 18:54:54 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iw8Y6-00063X-Sr; Mon, 27 Jan 2020 17:51:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=v1KH=3Q=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1iw8Y5-00063S-9w
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2020 17:51:45 +0000
X-Inumbo-ID: ae25afa4-412d-11ea-858a-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ae25afa4-412d-11ea-858a-12813bfff9fa;
 Mon, 27 Jan 2020 17:51:44 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1iw8Y1-0008AV-1F; Mon, 27 Jan 2020 17:51:41 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1iw8Y0-0004ls-Nv; Mon, 27 Jan 2020 17:51:40 +0000
Date: Mon, 27 Jan 2020 17:51:37 +0000
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200127175137.vtsd5d3qoik2qwjo@debian>
References: <cover.1578397252.git.hongyxia@amazon.com>
 <5f64321c4cceccd057e3b3e7fadea696793a7966.1578397252.git.hongyxia@amazon.com>
 <baa1a699-179f-b0ae-d857-699f7f63b214@suse.com>
 <dd3836c12457a92af545651b09acf910c2071bcf.camel@amazon.com>
 <1d38a17c-9b6b-a423-1326-33e24c583393@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1d38a17c-9b6b-a423-1326-33e24c583393@suse.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH v5 2/7] x86: introduce a new set of APIs to
 manage Xen page tables
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
Cc: "wl@xen.org" <wl@xen.org>, George Dunlap <George.Dunlap@eu.citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, "Grall,
 Julien" <jgrall@amazon.com>, "Xia, Hongyan" <hongyxia@amazon.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBKYW4gMjcsIDIwMjAgYXQgMDM6NDM6MTJQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMjcuMDEuMjAyMCAxNTozMywgWGlhLCBIb25neWFuIHdyb3RlOgo+ID4gT24gVGh1
LCAyMDIwLTAxLTE2IGF0IDEzOjA0ICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPiA+PiAuLi4K
PiA+Pgo+ID4+PiArdm9pZCBmcmVlX3hlbl9wYWdldGFibGUodm9pZCAqdikKPiA+Pj4gK3sKPiA+
Pj4gKyAgICBtZm5fdCBtZm4gPSB2ID8gdmlydF90b19tZm4odikgOiBJTlZBTElEX01GTjsKPiA+
Pj4gKwo+ID4+PiArICAgIGlmICggc3lzdGVtX3N0YXRlICE9IFNZU19TVEFURV9lYXJseV9ib290
ICkKPiA+Pj4gKyAgICAgICAgZnJlZV94ZW5fcGFnZXRhYmxlX25ldyhtZm4pOwo+ID4+Cj4gPj4g
VGhlIGNvbmRpdGlvbiBpcyAocGFydGx5KSByZWR1bmRhbnQgd2l0aCB3aGF0Cj4gPj4gZnJlZV94
ZW5fcGFnZXRhYmxlX25ldygpIGRvZXMuIFRoZXJlZm9yZSBJJ2QgbGlrZSB0byBhc2sgdGhhdAo+
ID4+IGVpdGhlciB0aGUgaWYoKSBiZSBkcm9wcGVkIGhlcmUsIG9yIGJlIGNvbXBsZXRlZCBieSBh
bHNvCj4gPj4gY2hlY2tpbmcgdiB0byBiZSBub24tTlVMTCwgYXQgd2hpY2ggcG9pbnQgdGhpcyB3
b3VsZCBsaWtlbHkKPiA+PiBiZWNvbWUganVzdAo+ID4+Cj4gPj4gdm9pZCBmcmVlX3hlbl9wYWdl
dGFibGUodm9pZCAqdikKPiA+PiB7Cj4gPj4gICAgIGlmICggdiAmJiBzeXN0ZW1fc3RhdGUgIT0g
U1lTX1NUQVRFX2Vhcmx5X2Jvb3QgKQo+ID4+ICAgICAgICAgZnJlZV94ZW5fcGFnZXRhYmxlX25l
dyh2aXJ0X3RvX21mbih2KSk7Cj4gPj4gfQo+ID4gCj4gPiBZb3UgYXJlIHJpZ2h0LiBXaWxsIGNo
YW5nZSBpbiB0aGUgbmV4dCByZXZpc2lvbi4KPiA+IAo+ID4+PiArLyogdiBjYW4gcG9pbnQgdG8g
YW4gZW50cnkgd2l0aGluIGEgdGFibGUgb3IgYmUgTlVMTCAqLwo+ID4+PiArdm9pZCB1bm1hcF94
ZW5fcGFnZXRhYmxlKGNvbnN0IHZvaWQgKnYpCj4gPj4KPiA+PiBXaHkgImVudHJ5IiBpbiB0aGUg
Y29tbWVudD8KPiA+IAo+ID4gSSB0aGluayB0aGUgY29tbWVudCBvcmlnaW5hbGx5IG1lYW50IHBv
aW50aW5nIHRvIHRoZSBlbnRyeSBpbiBpdHMKPiA+IHBhcmVudCB0YWJsZSwgd2hpY2ggdGhlbiBt
ZWFudCBwb2ludGluZyB0byB0aGlzIHRhYmxlLiBJdCdzIGEgYml0Cj4gPiBjb25mdXNpbmcuIFdp
bGwgcmV3b3JkLgo+ID4gCj4gPiBSZWZsZWN0aW5nIGJhY2sgdG8geW91ciBjb21tZW50IGluIHYz
IGFib3V0IHdoZXRoZXIgdGhlIG5ldyBYZW4gcGFnZQo+ID4gdGFibGUgbWFwcGluZyBBUElzICht
YXAvdW5tYXBfeGVuX3BhZ2V0YWJsZSkgYXJlIHJlYWxseSBuZWNlc3NhcnksIEkKPiA+IGFncmVl
IGluIHRoZSBlbmQgdGhleSB3aWxsIGp1c3QgZG8gdGhlIHNhbWUgdGhpbmcgYXMKPiA+IG1hcC91
bm1hcF9kb21haW5fcGFnZSwgYWx0aG91Z2ggb25lIHRoaW5nIGlzIHRoYXQgdGhlIGxhdHRlciBz
dWdnZXN0cwo+ID4gaXQgaXMgdHJ5aW5nIHRvIG1hcCBhIGBkb21haW4nIHBhZ2UsIHdob3NlIGRl
ZmluaXRpb24gcHJvYmFibHkgZG9lcyBub3QKPiA+IGluY2x1ZGUgWGVuIHBhZ2UgdGFibGVzLCBz
byB0aGUgbmFtZSBjb3VsZCBiZSBhIGJpdCBjb25mdXNpbmcgKHdlbGwsIHdlCj4gPiBjb3VsZCBh
cmd1ZSB0aGF0IFhlbiBwYWdlIHRhYmxlcyBhcmUganVzdCBpZGxlIGBkb21haW4nIHBhZ2VzIHNv
IHRoZQo+ID4gbmFtZSBzdGlsbCBob2xkcykuIElmIHdlIGFyZSBoYXBweSB3aXRoIHVzaW5nIG1h
cF9kb21haW5fcGFnZSBvbiBYZW4KPiA+IFBURSB0YWJsZXMgdGhlbiBJIGFtIG9rYXkgd2l0aCBk
cm9wcGluZyB0aGUgbmV3IG1hcHBpbmcgQVBJcyBhbmQgb25seQo+ID4gaW5jbHVkZSB0aGUgbmV3
IGFsbG9jIEFQSXMuCj4gCj4gQW55b25lIG9uIHRoZSBUbzogbGlzdCAtIG9waW5pb25zPwoKSSdt
IG5vdCB0b28gZnVzc2VkIGFib3V0IHRoaXMuCgpJIHRoaW5rIGV2ZW50dWFsbHkgd2Ugd2lsbCBq
dXN0IGNoYW5nZSBtYXBfZG9tYWluX3BhZ2UgdG8gbWFwX3BhZ2UgYW5kCnVzZSB0aGF0IGRpcmVj
dGx5LiBUaGUgaW50ZXJtZWRpYXRlIHN0ZXBzIGFyZW4ndCB0ZXJyaWJseSBpbnRlcmVzdGluZyB0
bwptZS4KCldlaS4KCj4gCj4gVGhhbmtzLCBKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
