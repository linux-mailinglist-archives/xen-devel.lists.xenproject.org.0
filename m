Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F323173AB5
	for <lists+xen-devel@lfdr.de>; Fri, 28 Feb 2020 16:06:48 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j7hBh-0007MU-N0; Fri, 28 Feb 2020 15:04:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=F9pE=4Q=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j7hBg-0007MO-BE
 for xen-devel@lists.xenproject.org; Fri, 28 Feb 2020 15:04:24 +0000
X-Inumbo-ID: 99b1074b-5a3b-11ea-996d-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 99b1074b-5a3b-11ea-996d-12813bfff9fa;
 Fri, 28 Feb 2020 15:04:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 44A9AACF2;
 Fri, 28 Feb 2020 15:04:22 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <2d3ced57-7d53-bb90-ccf6-e521e6eeb556@suse.com>
 <d2833654-fc51-555e-1c38-bda283baf27f@suse.com>
 <c3e6e985-f75e-182b-275a-f9182a082de7@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4fc484b1-679b-ef4b-8a94-cad6d892b23a@suse.com>
Date: Fri, 28 Feb 2020 16:04:31 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <c3e6e985-f75e-182b-275a-f9182a082de7@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 2/2] AMD/IOMMU: without XT,
 x2APIC needs to be forced into physical mode
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Kevin Tian <kevin.tian@intel.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjguMDIuMjAyMCAxNTo0OCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAyOC8wMi8yMDIw
IDEyOjEyLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gVGhlIHdpZGVyIGNsdXN0ZXIgbW9kZSBBUElD
IElEcyBhcmVuJ3QgZ2VuZXJhbGx5IHJlcHJlc2VudGFibGUuIENvbnZlcnQKPj4gdGhlIGlvbW11
X2ludHJlbWFwIHZhcmlhYmxlIGludG8gYSB0cmlzdGF0ZSwgYWxsb3dpbmcgdGhlIEFNRCBJT01N
VQo+PiBkcml2ZXIgdG8gc2lnbmFsIHRoaXMgc3BlY2lhbCByZXN0cmljdGlvbiB0byB0aGUgYXBp
Y194MmFwaWNfcHJvYmUoKS4KPj4gKE5vdGU6IGFzc2lnbm1lbnRzIHRvIHRoZSB2YXJpYWJsZSBn
ZXQgYWRqdXN0ZWQsIHdoaWxlIGV4aXN0aW5nCj4+IGNvbnN1bWVycyAtIGFsbCBhc3N1bWluZyBh
IGJvb2xlYW4gcHJvcGVydHkgLSBhcmUgbGVmdCBhbG9uZS4pCj4gCj4gSSB0aGluayBpdCB3b3Vs
ZCBiZSBoZWxwZnVsIHRvIHN0YXRlIHRoYXQgd2hpbGUgd2UgYXJlIG5vdCBhd2FyZSBvZiBhbnkK
PiBoYXJkd2FyZSB3aXRoIHRoaXMgYXMgYSByZXN0cmljdGlvbiwgaXQgaXMgYSBzaXR1YXRpb24g
d2hpY2ggY2FuIGJlCj4gY3JlYXRlZCBvbiBmdWxseSB4MmFwaWMtY2FwYWJsZSBzeXN0ZW1zIHZp
YSBmaXJtd2FyZSBzZXR0aW5ncy4KCkFkZGVkLgoKPj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+PiAtLS0KPj4gdjI6IE5ldy4KPj4KPj4gLS0tIGEveGVu
L2FyY2gveDg2L2dlbmFwaWMveDJhcGljLmMKPj4gKysrIGIveGVuL2FyY2gveDg2L2dlbmFwaWMv
eDJhcGljLmMKPj4gQEAgLTIzNiwxMiArMjM2LDIxIEBAIGNvbnN0IHN0cnVjdCBnZW5hcGljICpf
X2luaXQgYXBpY194MmFwaWMKPj4gICAgICAgICAgeDJhcGljX3BoeXMgPSAhaW9tbXVfaW50cmVt
YXAgfHwKPj4gICAgICAgICAgICAgICAgICAgICAgICAoYWNwaV9nYmxfRkFEVC5mbGFncyAmIEFD
UElfRkFEVF9BUElDX1BIWVNJQ0FMKTsKPj4gICAgICB9Cj4+IC0gICAgZWxzZSBpZiAoICF4MmFw
aWNfcGh5cyAmJiAhaW9tbXVfaW50cmVtYXAgKQo+PiAtICAgIHsKPj4gLSAgICAgICAgcHJpbnRr
KCJXQVJOSU5HOiB4MkFQSUMgY2x1c3RlciBtb2RlIGlzIG5vdCBzdXBwb3J0ZWQgd2l0aG91dCBp
bnRlcnJ1cHQgcmVtYXBwaW5nXG4iCj4+IC0gICAgICAgICAgICAgICAieDJBUElDOiBmb3JjaW5n
IHBoeXMgbW9kZVxuIik7Cj4+IC0gICAgICAgIHgyYXBpY19waHlzID0gdHJ1ZTsKPj4gLSAgICB9
Cj4+ICsgICAgZWxzZSBpZiAoICF4MmFwaWNfcGh5cyApCj4+ICsgICAgICAgIHN3aXRjaCAoIGlv
bW11X2ludHJlbWFwICkKPj4gKyAgICAgICAgewo+PiArICAgICAgICBjYXNlIGlvbW11X2ludHJl
bWFwX29mZjoKPj4gKyAgICAgICAgY2FzZSBpb21tdV9pbnRyZW1hcF9yZXN0cmljdGVkOgo+PiAr
ICAgICAgICAgICAgcHJpbnRrKCJXQVJOSU5HOiB4MkFQSUMgY2x1c3RlciBtb2RlIGlzIG5vdCBz
dXBwb3J0ZWQgJXMgaW50ZXJydXB0IHJlbWFwcGluZ1xuIgo+PiArICAgICAgICAgICAgICAgICAg
ICJ4MkFQSUM6IGZvcmNpbmcgcGh5cyBtb2RlXG4iLAo+IAo+IEFueSBjaGFuY2UgdG8gZm9sZCB0
aGlzIGludG8gYSBzaW5nbGUgbGluZSB3aXRoICItIGZvcmNpbmcgcGh5cyBtb2RlXG4iCj4gYXMg
YSBzdWZmaXg/CgpJIGRpZCBjb25zaWRlciBkb2luZyBzbyBteXNlbGYsIGJ1dCBkaWRuJ3QgZG8g
aXQgdGhlbiBmb3IgYmVpbmcKYW4gdW5yZWxhdGVkIGNoYW5nZS4gTm93IHRoYXQgeW91IGFzayBm
b3IgaXQgLSBkb25lLgoKPj4gKyAgICAgICAgICAgICAgICAgICBpb21tdV9pbnRyZW1hcCA9PSBp
b21tdV9pbnRyZW1hcF9vZmYgPyAid2l0aG91dCIKPj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgOiAid2l0aCByZXN0cmljdGVkIik7Cj4+
ICsgICAgICAgICAgICB4MmFwaWNfcGh5cyA9IHRydWU7Cj4+ICsgICAgICAgICAgICBicmVhazsK
Pj4gKwo+PiArICAgICAgICBjYXNlIGlvbW11X2ludHJlbWFwX2Z1bGw6Cj4+ICsgICAgICAgICAg
ICBicmVhazsKPj4gKyAgICAgICAgfQo+PiAgCj4+ICAgICAgaWYgKCB4MmFwaWNfcGh5cyApCj4+
ICAgICAgICAgIHJldHVybiAmYXBpY194MmFwaWNfcGh5czsKPj4gLS0tIGEveGVuL2luY2x1ZGUv
eGVuL2lvbW11LmgKPj4gKysrIGIveGVuL2luY2x1ZGUveGVuL2lvbW11LmgKPj4gQEAgLTU0LDcg
KzU0LDE4IEBAIHN0YXRpYyBpbmxpbmUgYm9vbF90IGRmbl9lcShkZm5fdCB4LCBkZm4KPj4gIAo+
PiAgZXh0ZXJuIGJvb2xfdCBpb21tdV9lbmFibGUsIGlvbW11X2VuYWJsZWQ7Cj4+ICBleHRlcm4g
Ym9vbCBmb3JjZV9pb21tdSwgaW9tbXVfcXVhcmFudGluZSwgaW9tbXVfdmVyYm9zZSwgaW9tbXVf
aWdmeDsKPj4gLWV4dGVybiBib29sX3QgaW9tbXVfc25vb3AsIGlvbW11X3FpbnZhbCwgaW9tbXVf
aW50cmVtYXAsIGlvbW11X2ludHBvc3Q7Cj4+ICtleHRlcm4gYm9vbF90IGlvbW11X3Nub29wLCBp
b21tdV9xaW52YWwsIGlvbW11X2ludHBvc3Q7Cj4+ICtleHRlcm4gZW51bSBfX3BhY2tlZCBpb21t
dV9pbnRyZW1hcCB7Cj4+ICsgICAvKgo+PiArICAgICogSW4gb3JkZXIgdG8gYWxsb3cgdHJhZGl0
aW9uYWwgYm9vbGVhbiB1c2VzIG9mIHRoZSBpb21tdV9pbnRyZW1hcAo+PiArICAgICogdmFyaWFi
bGUsIHRoZSAib2ZmIiB2YWx1ZSBoYXMgdG8gY29tZSBmaXJzdCAoeWllbGRpbmcgYSB2YWx1ZSBv
ZiB6ZXJvKS4KPj4gKyAgICAqLwo+PiArICAgaW9tbXVfaW50cmVtYXBfb2ZmLAo+PiArI2lmZGVm
IENPTkZJR19YODYKPj4gKyAgIGlvbW11X2ludHJlbWFwX3Jlc3RyaWN0ZWQsCj4gCj4gVGhpcyBu
ZWVkcyBhIG5vdGUgYWJvdXQgaXRzIG1lYW5pbmcuwqAgSG93IGFib3V0IHRoaXM/Cj4gCj4gLyog
SW50ZXJydXB0IHJlbWFwcGluZyBlbmFibGVkLCBidXQgb25seSBhYmxlIHRvIGdlbmVyYXRlIGlu
dGVycnVwdHMKPiB3aXRoIGFuIDgtYml0IEFQSUMgSUQuICovCgpBZGRlZC4KCj4gT3RoZXJ3aXNl
LCBSZXZpZXdlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4K
ClRoYW5rcy4KCj4gTm90IGFuIGlzc3VlIGZvciBub3csIGJ1dCAicmVzdHJpY3RlZCIgbWlnaHQg
YmVjb21lIGFtYmlndW91cyB3aXRoCj4gZnV0dXJlIGV4dGVuc2lvbnMuCgpZZXMsIGZhaXIgcG9p
bnQuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
