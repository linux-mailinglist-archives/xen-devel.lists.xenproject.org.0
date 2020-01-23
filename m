Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27DC5146575
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jan 2020 11:15:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuZU9-0003FH-DO; Thu, 23 Jan 2020 10:13:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=UGQU=3M=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iuZU7-0003FC-LY
 for xen-devel@lists.xenproject.org; Thu, 23 Jan 2020 10:13:11 +0000
X-Inumbo-ID: f0503fb0-3dc8-11ea-9fd7-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f0503fb0-3dc8-11ea-9fd7-bc764e2007e4;
 Thu, 23 Jan 2020 10:13:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C33D8AB92;
 Thu, 23 Jan 2020 10:13:01 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <20200122202343.5703-1-liuwe@microsoft.com>
 <20200122202343.5703-4-liuwe@microsoft.com>
 <cb0e82dc-a154-f918-e725-f77913f835f9@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2c683c55-d82d-1f3c-67f0-6df06224b7bf@suse.com>
Date: Thu, 23 Jan 2020 11:13:10 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <cb0e82dc-a154-f918-e725-f77913f835f9@citrix.com>
Content-Language: en-US
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
Cc: Xen Development List <xen-devel@lists.xenproject.org>,
 Michael Kelley <mikelley@microsoft.com>, Wei Liu <liuwe@microsoft.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Paul Durrant <paul@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjIuMDEuMjAyMCAyMjo1NywgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAyMi8wMS8yMDIw
IDIwOjIzLCBXZWkgTGl1IHdyb3RlOgo+PiBUaGVzZSBmdW5jdGlvbnMgd2lsbCBiZSB1c2VkIGxh
dGVyIHRvIG1ha2UgaHlwZXJjYWxscyB0byBIeXBlci1WLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBX
ZWkgTGl1IDxsaXV3ZUBtaWNyb3NvZnQuY29tPgo+IAo+IEFmdGVyIHNvbWUgZXhwZXJpbWVudGF0
aW9uLAo+IAo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYveGVuLmxkcy5TIGIveGVuL2FyY2gv
eDg2L3hlbi5sZHMuUwo+IGluZGV4IGNiYzU3MDEyMTQuLjM3MDhhNjBiNWMgMTAwNjQ0Cj4gLS0t
IGEveGVuL2FyY2gveDg2L3hlbi5sZHMuUwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni94ZW4ubGRzLlMK
PiBAQCAtMzI5LDYgKzMyOSw4IEBAIFNFQ1RJT05TCj4gwqDCoCBlZmkgPSAuOwo+IMKgI2VuZGlm
Cj4gwqAKPiArwqAgaHZfaGNhbGxfcGFnZSA9IEFCU09MVVRFKDB4ZmZmZjgyZDBiZmZmZTAwMCk7
Cj4gKwo+IMKgwqAgLyogU2VjdGlvbnMgdG8gYmUgZGlzY2FyZGVkICovCj4gwqDCoCAvRElTQ0FS
RC8gOiB7Cj4gwqDCoMKgwqDCoMKgwqAgKiguZXhpdC50ZXh0KQo+IAo+IGluIHRoZSBsaW5rZXIg
c2NyaXB0IGxldHMgZGlyZWN0IGNhbGxzIHdvcmsgY29ycmVjdGx5Ogo+IAo+IGZmZmY4MmQwODA2
Mzc5MzU6wqDCoMKgwqDCoMKgIGI5IDAxIDAwIDAwIDQwwqDCoMKgwqDCoMKgwqDCoMKgIG1vdsKg
wqDCoCAkMHg0MDAwMDAwMSwlZWN4Cj4gZmZmZjgyZDA4MDYzNzkzYTrCoMKgwqDCoMKgwqAgMGYg
MzDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgd3Jtc3LCoAo+IGZmZmY4MmQw
ODA2Mzc5M2M6wqDCoMKgwqDCoMKgIGJhIDIxIDAzIDAwIDAwwqDCoMKgwqDCoMKgwqDCoMKgIG1v
dsKgwqDCoCAkMHgzMjEsJWVkeAo+IGZmZmY4MmQwODA2Mzc5NDE6wqDCoMKgwqDCoMKgIGJmIDAx
IDAwIDAwIDAwwqDCoMKgwqDCoMKgwqDCoMKgIG1vdsKgwqDCoCAkMHgxLCVlZGkKPiBmZmZmODJk
MDgwNjM3OTQ2OsKgwqDCoMKgwqDCoCBlOCBhYyA0ZiBjNyBmZsKgwqDCoMKgwqDCoMKgwqDCoCBj
YWxsccKgIGZmZmY4MmQwODAyYWM4ZjcKPiA8X19zZXRfZml4bWFwX3g+Cj4gZmZmZjgyZDA4MDYz
Nzk0YjrCoMKgwqDCoMKgwqAgNDEgYjggMDAgMDAgMDAgMDDCoMKgwqDCoMKgwqAgbW92wqDCoMKg
ICQweDAsJXI4ZAo+IGZmZmY4MmQwODA2Mzc5NTE6wqDCoMKgwqDCoMKgIGI5IGZmIGZmIDAwIDAw
wqDCoMKgwqDCoMKgwqDCoMKgIG1vdsKgwqDCoCAkMHhmZmZmLCVlY3gKPiBmZmZmODJkMDgwNjM3
OTU2OsKgwqDCoMKgwqDCoCBiYSAwMCAwMCAwMCAwMMKgwqDCoMKgwqDCoMKgwqDCoCBtb3bCoMKg
wqAgJDB4MCwlZWR4Cj4gZmZmZjgyZDA4MDYzNzk1YjrCoMKgwqDCoMKgwqAgZTggYTAgNjYgOWMg
M2bCoMKgwqDCoMKgwqDCoMKgwqAgY2FsbHHCoCBmZmZmODJkMGJmZmZlMDAwCj4gPGh2X2hjYWxs
X3BhZ2U+Cj4gZmZmZjgyZDA4MDYzNzk2MDrCoMKgwqDCoMKgwqAgNjYgODMgZjggMDLCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgY21wwqDCoMKgICQweDIsJWF4Cj4gCj4gYnV0IGl0IGRvZXMgdGhy
b3c6Cj4gCj4gRGlmZmVyZW5jZSBhdCAuaW5pdDowMDAzMmVkZiBpcyAweGMwMDAwMDAwIChleHBl
Y3RlZCAweDQwMDAwMDAwKQo+IERpZmZlcmVuY2UgYXQgLmluaXQ6MDAwMzJlZGYgaXMgMHhjMDAw
MDAwMCAoZXhwZWN0ZWQgMHg0MDAwMDAwMCkKPiAKPiBhcyBhIGRpYWdub3N0aWMgcHJlc3VtYWJs
eSBmcm9tIHRoZSBmaW5hbCBsaW5rwqAgKGJvdGggd2l0aCBhIHN0YW5kYXJkCj4gRGViaWFuIDIu
MjggYmludXRpbHMsIGFuZCB1cHN0cmVhbSAyLjMzIGJ1aWxkKS7CoCBJJ20gbm90IHN1cmUgd2hh
dCBpdHMKPiB0cnlpbmcgdG8gY29tcGxhaW4gYWJvdXQsIGFzIGJvdGggeGVuLmd6IGFuZCB4ZW4u
ZWZpIGhhdmUgY29ycmVjdGx5Cj4gZ2VuZXJhdGVkIGNvZGUuCj4gCj4gRGVwZW5kaW5nIG9uIHdo
ZXRoZXIgdGhleSBhcmUgYmVuaWduIG9yIG5vdCwgYSBsaW5rZXItZnJpZW5kbHkKPiBmaXhfdG9f
dmlydCgpIHNob3VsZCBiZSBhbGwgd2UgbmVlZCB0byBrZWVwIHRoZXNlIHN0cmljdGx5IGFzIGRp
cmVjdCBjYWxscy4KClRoZXkncmUgYmVuaWduIGluIHRoZSBwYXJ0aWN1bGFyIGNhc2Ugb2YgdGhl
bSBhY3R1YWxseSByZXN1bHRpbmcKZnJvbSByZWxhdGl2ZSBDQUxMcywgd2hpY2ggaGVuY2UgcmVx
dWlyZSBubyByZWxvY2F0aW9uIHRvIGJlCnJlY29yZGVkIGluIHhlbi5lZmkncyAucmVsb2Mgc2Vj
dGlvbi4gQnV0IHRoZXkgc2hvdWxkIG5ldmVydGhlbGVzcwpiZSBzaWxlbmNlZC4gV2UndmUgYmVl
biBkaXNjdXNzaW5nIHRoaXMgb24gaXJjLCBpaXJjLiBUaGUgYWJzb2x1dGUKYWRkcmVzcyB1c2Vk
IHdhbnRzIHRvIG1vdmUgYnkgMUdiIGZvciB0aGUgJChBTFRfQkFTRSkgaW50ZXJtZWRpYXRlCmxp
bmtpbmcgc3RlcC4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
