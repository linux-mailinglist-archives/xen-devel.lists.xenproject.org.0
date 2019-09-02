Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23357A5542
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2019 13:48:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i4kmb-0004gJ-7j; Mon, 02 Sep 2019 11:46:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=kzGk=W5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i4kma-0004gE-CX
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2019 11:46:04 +0000
X-Inumbo-ID: 3d52568a-cd77-11e9-8980-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3d52568a-cd77-11e9-8980-bc764e2007e4;
 Mon, 02 Sep 2019 11:46:03 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 04D31AEA5;
 Mon,  2 Sep 2019 11:46:01 +0000 (UTC)
To: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
References: <20190822140210.24749-1-aisaila@bitdefender.com>
 <93e0dae4-7e6a-2f04-2886-203685b6ad28@suse.com>
 <0b745940-d71b-7ce3-37d2-7ae4ff9e5819@bitdefender.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <215e5edf-2105-c591-0615-457c798e3029@suse.com>
Date: Mon, 2 Sep 2019 13:46:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <0b745940-d71b-7ce3-37d2-7ae4ff9e5819@bitdefender.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] x86/mm: Add mem access rights to NPT
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
Cc: PetreOvidiu PIRCALABU <ppircalabu@bitdefender.com>,
 "kevin.tian@intel.com" <kevin.tian@intel.com>,
 "tamas@tklengyel.com" <tamas@tklengyel.com>, "wl@xen.org" <wl@xen.org>,
 "rcojocaru@bitdefender.com" <rcojocaru@bitdefender.com>,
 "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 "jun.nakajima@intel.com" <jun.nakajima@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDIuMDkuMjAxOSAxMzoyMywgQWxleGFuZHJ1IFN0ZWZhbiBJU0FJTEEgd3JvdGU6Cj4gT24g
MjkuMDguMjAxOSAxODowNCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDIyLjA4LjIwMTkgMTY6
MDIsIEFsZXhhbmRydSBTdGVmYW4gSVNBSUxBIHdyb3RlOgo+Pj4gVGhpcyBwYXRjaCBhZGRzIGFj
Y2VzcyBjb250cm9sIGZvciBOUFQgbW9kZS4KPj4+Cj4+PiBUaGUgYWNjZXNzIHJpZ2h0cyBhcmUg
c3RvcmVkIGluIHRoZSBOUFQgcDJtIHRhYmxlIDU2OjUzLgo+Pgo+PiBXaHkgc3RhcnRpbmcgZnJv
bSBiaXQgNTM/IEkgY2FuJ3Qgc2VlbSB0byBmaW5kIGFueSB1c2Ugb2YgYml0IDUyLgo+IAo+IFRo
ZXJlIGlzIGEgY29tbWVudCBpbiBwYWdlLmggdGhhdCB3YXJucyB0aGF0IGJpdCAxMig1MikgaXMg
dGFrZW4uCj4gIi8qCj4gICAqIEJpdCAxMiBvZiBhIDI0LWJpdCBmbGFnIG1hc2suIFRoaXMgY29y
cmVzcG9uZHMgdG8gYml0IDUyIG9mIGEgcHRlLgo+ICAgKiBUaGlzIGlzIG5lZWRlZCB0byBkaXN0
aW5ndWlzaCBiZXR3ZWVuIHVzZXIgYW5kIGtlcm5lbCBQVEVzIHNpbmNlIAo+IF9QQUdFX1VTRVIK
PiAgICogaXMgYXNzZXJ0ZWQgZm9yIGJvdGguCj4gICAqLwo+ICNkZWZpbmUgX1BBR0VfR1VFU1Rf
S0VSTkVMICgxVTw8MTIpCj4gIgoKQnV0IHRoYXQncyBhIFBWLW9ubHkgdGhpbmcuIFdpdGggc3Vm
ZmljaWVudCBjYXJlIGl0IHNob3VsZCBiZQpwb3NzaWJsZSB0byBoYXZlIG92ZXJsYXBwaW5nIHVz
ZXMuIEFuZCBnaXZlbiB0aGF0IHRoZSBhdmFpbGFibGUKYml0IGFyZSBhIHByZXR0eSBsaW1pdGVk
IHJlc291cmNlLCBJJ2QgdmVyeSBtdWNoIGFwcHJlY2lhdGUgaWYKeW91IGF0IGxlYXN0IHRyaWVk
IHRvIG1ha2UgdGhpcyB3b3JrLgoKPj4+IEBAIC0xMDQsOCArMTEyLDMyIEBAIHN0YXRpYyB1bnNp
Z25lZCBsb25nIHAybV90eXBlX3RvX2ZsYWdzKGNvbnN0IHN0cnVjdCBwMm1fZG9tYWluICpwMm0s
Cj4+PiAgICAgICAgICAgICAgIGZsYWdzIHw9IF9QQUdFX1BXVDsKPj4+ICAgICAgICAgICAgICAg
QVNTRVJUKCFsZXZlbCk7Cj4+PiAgICAgICAgICAgfQo+Pj4gLSAgICAgICAgcmV0dXJuIGZsYWdz
IHwgUDJNX0JBU0VfRkxBR1MgfCBfUEFHRV9QQ0Q7Cj4+PiArICAgICAgICBmbGFncyB8PSBQMk1f
QkFTRV9GTEFHUyB8IF9QQUdFX1BDRDsKPj4+ICsgICAgICAgIGJyZWFrOwo+Pj4gICAgICAgfQo+
Pj4gKwo+Pj4gKyAgICBzd2l0Y2ggKCBhY2Nlc3MgKQo+Pj4gKyAgICB7Cj4+PiArICAgIGNhc2Ug
cDJtX2FjY2Vzc19yOgo+Pj4gKyAgICAgICAgZmxhZ3MgfD0gX1BBR0VfTlhfQklUOwo+Pj4gKyAg
ICAgICAgZmxhZ3MgJj0gfl9QQUdFX1JXOwo+Pj4gKyAgICAgICAgYnJlYWs7Cj4+PiArICAgIGNh
c2UgcDJtX2FjY2Vzc19ydzoKPj4+ICsgICAgICAgIGZsYWdzIHw9IF9QQUdFX05YX0JJVDsKPj4+
ICsgICAgICAgIGJyZWFrOwo+Pj4gKyAgICBjYXNlIHAybV9hY2Nlc3Nfcng6Cj4+PiArICAgIGNh
c2UgcDJtX2FjY2Vzc19yeDJydzoKPj4+ICsgICAgICAgIGZsYWdzICY9IH4oX1BBR0VfTlhfQklU
IHwgX1BBR0VfUlcpOwo+Pj4gKyAgICAgICAgYnJlYWs7Cj4+PiArICAgIGNhc2UgcDJtX2FjY2Vz
c194Ogo+Pj4gKyAgICAgICAgZmxhZ3MgJj0gfl9QQUdFX1JXOwo+Pj4gKyAgICAgICAgYnJlYWs7
Cj4+Cj4+IEkgY2FuJ3Qgc2VlbSB0byBiZSBhYmxlIHRvIGZvbGxvdyB5b3UgaGVyZS4gSW4gZmFj
dCBJIGRvbid0IHNlZQo+PiBob3cgeW91IHdvdWxkIGJlIGFibGUgdG8gZXhwcmVzcyBleGVjdXRl
LW9ubHkgd2l0aCBOUFQuIElmIHRoaXMKPj4gaXMgcmVhbGx5IG5lZWRlZCBmb3Igc29tZSByZWFz
b24sIHRoZW4gYSBqdXN0aWZ5aW5nIGNvbW1lbnQKPj4gc2hvdWxkIGJlIGFkZGVkLgo+IAo+IEV4
ZWN1dGUtb25seSBzaG91bGQgYmUgZXhwcmVzc2VkIGFzIG5vdCBQQUdFX1JXIGFuZCBQQUdFX05Y
X0JJVCBub3Qgc2V0LgoKQnV0IHRoYXQgc3RpbGwgZG9lc24ndCB5aWVsZCBleGVjLW9ubHkuIFdo
ZXJlIGlzIHRoaXMgInNob3VsZCBiZQpleHByZXNzZWQiIHN0YXRlZD8gSS5lLiBvbiB3aGF0IGJh
c2lzIGlzIGl0IHRvbGVyYWJsZSB0byBhbHNvIGFsbG93CnJlYWQgYWNjZXNzIGRlc3BpdGUgYSBy
ZXF1ZXN0IHRvIHRoZSBjb250cmFyeT8KCj4+PiBAQCAtNDc0LDYgKzUyMCwzMiBAQCBpbnQgcDJt
X3B0X2hhbmRsZV9kZWZlcnJlZF9jaGFuZ2VzKHVpbnQ2NF90IGdwYSkKPj4+ICAgICAgIHJldHVy
biByYzsKPj4+ICAgfQo+Pj4gICAKPj4+ICtzdGF0aWMgaW50IHAybV9wdF9jaGVja19hY2Nlc3Mo
cDJtX2FjY2Vzc190IHAybWEpCj4+PiArewo+Pj4gKyAgICBzd2l0Y2ggKCBwMm1hICkKPj4+ICsg
ICAgewo+Pj4gKyAgICBjYXNlIHAybV9hY2Nlc3NfbjoKPj4+ICsgICAgY2FzZSBwMm1fYWNjZXNz
X3c6Cj4+PiArICAgIGNhc2UgcDJtX2FjY2Vzc193eDoKPj4+ICsgICAgY2FzZSBwMm1fYWNjZXNz
X24ycnd4Ogo+Pj4gKyAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4+Cj4+IEknbSBub3QgY29udmlu
Y2VkIEVJTlZBTCBpcyBhcHByb3ByaWF0ZSBoZXJlIC0gdGhlIGFyZ3VtZW50IGlzbid0Cj4+IGlu
dmFsaWQsIGl0J3MganVzdCB0aGF0IHRoZXJlJ3Mgbm8gd2F5IHRvIHJlcHJlc2VudCBpdC4KPiAK
PiBXb3VsZCBFUEVSTSBiZSBhIGJldHRlciByZXR1cm4gaGVyZT8KClF1aXRlIGEgYml0IGJldHRl
ciwgeWVzLiBCdXQgc3RpbGwgbm90IG9wdGltYWwsIGJ1dCBJIGNvbmZlc3MgdGhhdApJIGFsc28g
Y2FuJ3QgZmluZCBhbiBvcHRpbWFsIG9uZS4gRURPTSB3b3VsZCBsb29rIHRvIGJlIHN1aXRhYmxl
IHRvbywKaWYgb25lIHdhcyB0byBpZ25vcmUgdGhlICJtYXRoIiBhc3BlY3Qgb2YgaXQuCgpKYW4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
