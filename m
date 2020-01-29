Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D5C414D078
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2020 19:29:27 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iws28-0004Yh-AX; Wed, 29 Jan 2020 18:25:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=JZHc=3S=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1iws26-0004Yc-9B
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2020 18:25:46 +0000
X-Inumbo-ID: c3f2d92c-42c4-11ea-a933-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c3f2d92c-42c4-11ea-a933-bc764e2007e4;
 Wed, 29 Jan 2020 18:25:45 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1iws24-0005FI-Df; Wed, 29 Jan 2020 18:25:44 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1iws24-0000hw-4H; Wed, 29 Jan 2020 18:25:44 +0000
Date: Wed, 29 Jan 2020 18:25:41 +0000
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200129182541.72ivzrfmkoxbvodd@debian>
References: <20200122202343.5703-1-liuwe@microsoft.com>
 <20200122202343.5703-4-liuwe@microsoft.com>
 <cb0e82dc-a154-f918-e725-f77913f835f9@citrix.com>
 <2c683c55-d82d-1f3c-67f0-6df06224b7bf@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2c683c55-d82d-1f3c-67f0-6df06224b7bf@suse.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH v4 3/7] x86/hyperv: provide Hyper-V
 hypercall functions
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
 Michael Kelley <mikelley@microsoft.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBKYW4gMjMsIDIwMjAgYXQgMTE6MTM6MTBBTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMjIuMDEuMjAyMCAyMjo1NywgQW5kcmV3IENvb3BlciB3cm90ZToKPiA+IE9uIDIy
LzAxLzIwMjAgMjA6MjMsIFdlaSBMaXUgd3JvdGU6Cj4gPj4gVGhlc2UgZnVuY3Rpb25zIHdpbGwg
YmUgdXNlZCBsYXRlciB0byBtYWtlIGh5cGVyY2FsbHMgdG8gSHlwZXItVi4KPiA+Pgo+ID4+IFNp
Z25lZC1vZmYtYnk6IFdlaSBMaXUgPGxpdXdlQG1pY3Jvc29mdC5jb20+Cj4gPiAKPiA+IEFmdGVy
IHNvbWUgZXhwZXJpbWVudGF0aW9uLAo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2
L3hlbi5sZHMuUyBiL3hlbi9hcmNoL3g4Ni94ZW4ubGRzLlMKPiA+IGluZGV4IGNiYzU3MDEyMTQu
LjM3MDhhNjBiNWMgMTAwNjQ0Cj4gPiAtLS0gYS94ZW4vYXJjaC94ODYveGVuLmxkcy5TCj4gPiAr
KysgYi94ZW4vYXJjaC94ODYveGVuLmxkcy5TCj4gPiBAQCAtMzI5LDYgKzMyOSw4IEBAIFNFQ1RJ
T05TCj4gPiDCoMKgIGVmaSA9IC47Cj4gPiDCoCNlbmRpZgo+ID4gwqAKPiA+ICvCoCBodl9oY2Fs
bF9wYWdlID0gQUJTT0xVVEUoMHhmZmZmODJkMGJmZmZlMDAwKTsKPiA+ICsKPiA+IMKgwqAgLyog
U2VjdGlvbnMgdG8gYmUgZGlzY2FyZGVkICovCj4gPiDCoMKgIC9ESVNDQVJELyA6IHsKPiA+IMKg
wqDCoMKgwqDCoMKgICooLmV4aXQudGV4dCkKPiA+IAo+ID4gaW4gdGhlIGxpbmtlciBzY3JpcHQg
bGV0cyBkaXJlY3QgY2FsbHMgd29yayBjb3JyZWN0bHk6Cj4gPiAKPiA+IGZmZmY4MmQwODA2Mzc5
MzU6wqDCoMKgwqDCoMKgIGI5IDAxIDAwIDAwIDQwwqDCoMKgwqDCoMKgwqDCoMKgIG1vdsKgwqDC
oCAkMHg0MDAwMDAwMSwlZWN4Cj4gPiBmZmZmODJkMDgwNjM3OTNhOsKgwqDCoMKgwqDCoCAwZiAz
MMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB3cm1zcsKgCj4gPiBmZmZmODJk
MDgwNjM3OTNjOsKgwqDCoMKgwqDCoCBiYSAyMSAwMyAwMCAwMMKgwqDCoMKgwqDCoMKgwqDCoCBt
b3bCoMKgwqAgJDB4MzIxLCVlZHgKPiA+IGZmZmY4MmQwODA2Mzc5NDE6wqDCoMKgwqDCoMKgIGJm
IDAxIDAwIDAwIDAwwqDCoMKgwqDCoMKgwqDCoMKgIG1vdsKgwqDCoCAkMHgxLCVlZGkKPiA+IGZm
ZmY4MmQwODA2Mzc5NDY6wqDCoMKgwqDCoMKgIGU4IGFjIDRmIGM3IGZmwqDCoMKgwqDCoMKgwqDC
oMKgIGNhbGxxwqAgZmZmZjgyZDA4MDJhYzhmNwo+ID4gPF9fc2V0X2ZpeG1hcF94Pgo+ID4gZmZm
ZjgyZDA4MDYzNzk0YjrCoMKgwqDCoMKgwqAgNDEgYjggMDAgMDAgMDAgMDDCoMKgwqDCoMKgwqAg
bW92wqDCoMKgICQweDAsJXI4ZAo+ID4gZmZmZjgyZDA4MDYzNzk1MTrCoMKgwqDCoMKgwqAgYjkg
ZmYgZmYgMDAgMDDCoMKgwqDCoMKgwqDCoMKgwqAgbW92wqDCoMKgICQweGZmZmYsJWVjeAo+ID4g
ZmZmZjgyZDA4MDYzNzk1NjrCoMKgwqDCoMKgwqAgYmEgMDAgMDAgMDAgMDDCoMKgwqDCoMKgwqDC
oMKgwqAgbW92wqDCoMKgICQweDAsJWVkeAo+ID4gZmZmZjgyZDA4MDYzNzk1YjrCoMKgwqDCoMKg
wqAgZTggYTAgNjYgOWMgM2bCoMKgwqDCoMKgwqDCoMKgwqAgY2FsbHHCoCBmZmZmODJkMGJmZmZl
MDAwCj4gPiA8aHZfaGNhbGxfcGFnZT4KPiA+IGZmZmY4MmQwODA2Mzc5NjA6wqDCoMKgwqDCoMKg
IDY2IDgzIGY4IDAywqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNtcMKgwqDCoCAkMHgyLCVheAo+
ID4gCj4gPiBidXQgaXQgZG9lcyB0aHJvdzoKPiA+IAo+ID4gRGlmZmVyZW5jZSBhdCAuaW5pdDow
MDAzMmVkZiBpcyAweGMwMDAwMDAwIChleHBlY3RlZCAweDQwMDAwMDAwKQo+ID4gRGlmZmVyZW5j
ZSBhdCAuaW5pdDowMDAzMmVkZiBpcyAweGMwMDAwMDAwIChleHBlY3RlZCAweDQwMDAwMDAwKQo+
ID4gCj4gPiBhcyBhIGRpYWdub3N0aWMgcHJlc3VtYWJseSBmcm9tIHRoZSBmaW5hbCBsaW5rwqAg
KGJvdGggd2l0aCBhIHN0YW5kYXJkCj4gPiBEZWJpYW4gMi4yOCBiaW51dGlscywgYW5kIHVwc3Ry
ZWFtIDIuMzMgYnVpbGQpLsKgIEknbSBub3Qgc3VyZSB3aGF0IGl0cwo+ID4gdHJ5aW5nIHRvIGNv
bXBsYWluIGFib3V0LCBhcyBib3RoIHhlbi5neiBhbmQgeGVuLmVmaSBoYXZlIGNvcnJlY3RseQo+
ID4gZ2VuZXJhdGVkIGNvZGUuCj4gPiAKPiA+IERlcGVuZGluZyBvbiB3aGV0aGVyIHRoZXkgYXJl
IGJlbmlnbiBvciBub3QsIGEgbGlua2VyLWZyaWVuZGx5Cj4gPiBmaXhfdG9fdmlydCgpIHNob3Vs
ZCBiZSBhbGwgd2UgbmVlZCB0byBrZWVwIHRoZXNlIHN0cmljdGx5IGFzIGRpcmVjdCBjYWxscy4K
PiAKPiBUaGV5J3JlIGJlbmlnbiBpbiB0aGUgcGFydGljdWxhciBjYXNlIG9mIHRoZW0gYWN0dWFs
bHkgcmVzdWx0aW5nCj4gZnJvbSByZWxhdGl2ZSBDQUxMcywgd2hpY2ggaGVuY2UgcmVxdWlyZSBu
byByZWxvY2F0aW9uIHRvIGJlCj4gcmVjb3JkZWQgaW4geGVuLmVmaSdzIC5yZWxvYyBzZWN0aW9u
LiBCdXQgdGhleSBzaG91bGQgbmV2ZXJ0aGVsZXNzCj4gYmUgc2lsZW5jZWQuIFdlJ3ZlIGJlZW4g
ZGlzY3Vzc2luZyB0aGlzIG9uIGlyYywgaWlyYy4gVGhlIGFic29sdXRlCj4gYWRkcmVzcyB1c2Vk
IHdhbnRzIHRvIG1vdmUgYnkgMUdiIGZvciB0aGUgJChBTFRfQkFTRSkgaW50ZXJtZWRpYXRlCj4g
bGlua2luZyBzdGVwLgoKRldJVyBJIGRvbid0IHNlZSB0aG9zZSBtZXNzYWdlcyB3aXRoIG15IGN1
cnJlbnQgY29kZS4KCldlaS4KCj4gCj4gSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
