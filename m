Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27BEFFCAC2
	for <lists+xen-devel@lfdr.de>; Thu, 14 Nov 2019 17:31:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVHz8-0003M2-E8; Thu, 14 Nov 2019 16:28:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=H8L6=ZG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iVHz7-0003Lv-Cz
 for xen-devel@lists.xenproject.org; Thu, 14 Nov 2019 16:28:41 +0000
X-Inumbo-ID: d118b504-06fb-11ea-9631-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d118b504-06fb-11ea-9631-bc764e2007e4;
 Thu, 14 Nov 2019 16:28:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 052FEB327;
 Thu, 14 Nov 2019 16:28:39 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <osstest-144091-mainreport@xen.org>
 <29c593c2-0621-4f93-5074-d2d568ead829@suse.com>
Message-ID: <7f980c32-a3a8-8bf0-54a9-750580f89f76@suse.com>
Date: Thu, 14 Nov 2019 17:28:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <29c593c2-0621-4f93-5074-d2d568ead829@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [xen-unstable test] 144091: regressions - FAIL
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
Cc: xen-devel@lists.xenproject.org,
 osstest service owner <osstest-admin@xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTQuMTEuMjAxOSAxNzoyMSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMTQuMTEuMjAxOSAx
Njo1Miwgb3NzdGVzdCBzZXJ2aWNlIG93bmVyIHdyb3RlOgo+PiBmbGlnaHQgMTQ0MDkxIHhlbi11
bnN0YWJsZSByZWFsIFtyZWFsXQo+PiBodHRwOi8vbG9ncy50ZXN0LWxhYi54ZW5wcm9qZWN0Lm9y
Zy9vc3N0ZXN0L2xvZ3MvMTQ0MDkxLwo+Pgo+PiBSZWdyZXNzaW9ucyA6LSgKPj4KPj4gVGVzdHMg
d2hpY2ggZGlkIG5vdCBzdWNjZWVkIGFuZCBhcmUgYmxvY2tpbmcsCj4+IGluY2x1ZGluZyB0ZXN0
cyB3aGljaCBjb3VsZCBub3QgYmUgcnVuOgo+PiAgdGVzdC1hbWQ2NC1pMzg2LXhsLXFlbXV1LWRt
cmVzdHJpY3QtYW1kNjQtZG1yZXN0cmljdCAxMiBndWVzdC1zdGFydC9kZWJpYW5odm0ucmVwZWF0
IGZhaWwgUkVHUi4gdnMuIDE0NDA0Mgo+PiAgdGVzdC1hbWQ2NC1hbWQ2NC1xZW11dS1uZXN0ZWQt
aW50ZWwgMTcgZGViaWFuLWh2bS1pbnN0YWxsL2wxL2wyIGZhaWwgUkVHUi4gdnMuIDE0NDA0Mgo+
IAo+IEkndmUgdGFrZW4gYW5vdGhlciBsb29rLCBhbmQgSSBub3cgdGhpbmsgdGhlIEwyIGd1ZXN0
IGRvZXNuJ3QgZXZlbgo+IG1ha2UgaXQgdG8gdGhlIGJvb3Rsb2FkZXIuIFRha2luZyB0b2dldGhl
cgo+IAo+IChkMSkgU2VhQklPUyAodmVyc2lvbiByZWwtMS4xMi4xLTAtZ2E1Y2FiNTgtWGVuKQo+
IChkMSkgQlVJTEQ6IGdjYzogKERlYmlhbiA2LjMuMC0xOCtkZWI5dTEpIDYuMy4wIDIwMTcwNTE2
IGJpbnV0aWxzOiAoR05VIEJpbnV0aWxzIGZvciBEZWJpYW4pIDIuMjgKPiAoZDEpIAo+IChkMSkg
Rm91bmQgWGVuIGh5cGVydmlzb3Igc2lnbmF0dXJlIGF0IDQwMDAwMDAwCj4gKGQxKSBSdW5uaW5n
IG9uIFFFTVUgKGk0NDBmeCkKPiAoZDEpIHhlbjogY29weSBlODIwLi4uCj4gKGQxKSBSZWxvY2F0
aW5nIGluaXQgZnJvbSAweDAwMGQ3YzIwIHRvIDB4MmY3YWJkODAgKHNpemUgODI0MDApCj4gCj4g
YW5kCj4gCj4gKFhFTikgKioqKioqKioqKiogVk1DUyBBcmVhcyAqKioqKioqKioqKioqKgo+IChY
RU4pIAo+IChYRU4pID4+PiBEb21haW4gMSA8PDwKPiAoWEVOKSAJVkNQVSAwCj4gKFhFTikgKioq
IEd1ZXN0IFN0YXRlICoqKgo+IChYRU4pIENSMDogYWN0dWFsPTB4MDAwMDAwMDAwMDAwMDAzMSwg
c2hhZG93PTB4MDAwMDAwMDAwMDAwMDAxMSwgZ2hfbWFzaz1mZmZmZmZmZmZmZmZmZmZmCj4gKFhF
TikgQ1I0OiBhY3R1YWw9MHgwMDAwMDAwMDAwMDAyMDUwLCBzaGFkb3c9MHgwMDAwMDAwMDAwMDAw
MDAwLCBnaF9tYXNrPWZmZmZmZmZmZmZmOGY4NzAKPiAoWEVOKSBDUjMgPSAweDAwMDAwMDAwMDA0
MDAwMDAKPiAoWEVOKSBSU1AgPSAweDAwMDAwMDAwMDAwMDZmYTQgKDB4MDAwMDAwMDAwMDAwNmZh
NCkgIFJJUCA9IDB4MDAwMDAwMDAyZjdiYTlmNCAoMHgwMDAwMDAwMDJmN2JhOWY0KQo+IAo+IGFu
ZCBzaW1pbGFybHkgaW4gdGhlIEwwIGxvZwo+IAo+IChYRU4pIFJTUCA9IDB4MDAwMDAwMDAwMDAw
NmZhNCAoMHgwMDAwMDAwMDAwMDA2ZmE0KSAgUklQID0gMHgwMDAwMDAwMDJmN2JhOWY0ICgweDAw
MDAwMDAwMmY3YmE5ZjQpCj4gCj4gSSBpbnN0ZWFkIHRoaW5rIGl0J3Mgc3RpbGwgaW4gU2VhQklP
UyBjb2RlLiBJJ2xsIHNlZSBpZiBJIGNhbgo+IGRlcml2ZSB3aGVyZSBleGFjdGx5IGl0J3Mgc2l0
dGluZy4gSW4gYW55IGV2ZW50IHRoZSBtb3N0IHJlY2VudAo+IGV4aXQgcmVhc29uIHRvIEwwIHdh
cyBFUFRfVklPTEFUSU9OIHdpdGggYSBxdWFsaWZpY2F0aW9uIG9mIDB4MTljCj4gKGZldGNoLCBl
ZmZfcmVhZCwgZWZmX3dyaXRlLCBnbGFfdmFsaWQsIGdsYV9mYXVsdCksIHdoaWNoIEkgZG9uJ3QK
PiB0aGluayB3b3VsZCBhbGxvdyB0aGUgZ3Vlc3QgdG8gY29udGludWUgd2l0aG91dCBhbiBhZGp1
c3RtZW50IHRvCj4gaXRzIEVQVCBwZXJtaXNzaW9ucy4KCklzbid0IHRoZSBwcm9ibGVtIGhlcmUg
dGhhdCB0aGUgWFNBLTMwNCBmaXggb25seSB1cGRhdGVzIHRoZSBob3N0CnAybSwgYnV0IG5vdCBh
bnkgZW50cmllcyBhbHJlYWR5IHByb3BhZ2F0ZSB0byBuZXN0ZWQgb3IgYWx0IHAybXM/CgpKYW4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
