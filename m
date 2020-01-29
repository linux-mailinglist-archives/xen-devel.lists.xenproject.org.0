Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7BFA14CBE8
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2020 14:55:47 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwnm8-0001It-DX; Wed, 29 Jan 2020 13:53:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=i8To=3S=gdata.de=peter.kurfer@srs-us1.protection.inumbo.net>)
 id 1iwnm6-0001Ij-6Y
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2020 13:52:58 +0000
X-Inumbo-ID: a6cee6c2-429e-11ea-ad98-bc764e2007e4
Received: from mx1.gdata.de (unknown [212.23.151.203])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a6cee6c2-429e-11ea-ad98-bc764e2007e4;
 Wed, 29 Jan 2020 13:52:56 +0000 (UTC)
Received: from ex4.gdata.de (unknown [10.210.7.11])
 by mx1.gdata.de (Postfix) with ESMTPS id 8443F80146;
 Wed, 29 Jan 2020 14:52:55 +0100 (CET)
Received: from ex1.gdata.de (10.10.12.93) by ex4.gdata.de (10.210.7.11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.1034.26; Wed, 29 Jan
 2020 14:52:55 +0100
Received: from ex1.gdata.de (10.10.12.93) by ex1.gdata.de (10.10.12.93) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.1034.26; Wed, 29 Jan
 2020 14:52:55 +0100
Received: from ex1.gdata.de ([fe80::1d8:f0b4:e0a3:1e6d]) by ex1.gdata.de
 ([fe80::1d8:f0b4:e0a3:1e6d%2]) with mapi id 15.01.1034.033; Wed, 29 Jan 2020
 14:52:55 +0100
From: <Peter.Kurfer@gdata.de>
To: <jbeulich@suse.com>
Thread-Topic: Host freezing after "fixing" recursive fault starting in
 multicalls.c
Thread-Index: AQHVz4sLNgmZNGFJEEmdW8QDt3MmIqgBW+yF///49wCAAB82fQ==
Date: Wed, 29 Jan 2020 13:52:54 +0000
Message-ID: <7bb4c86ad97445269aee940c1ce07d4f@gdata.de>
References: <8e3c6908ce4b48689817b32c538fecf9@gdata.de>
 <4d99fec9-013a-ff99-8813-2c464be8e970@suse.com>
 <5d912751441542ce841c5c4c2f9b7758@gdata.de>
 <adc62139-1330-ea1c-92fa-33939ceb14ac@suse.com>
 <b11cccbee7504efb8ea9d3fa14a85afc@gdata.de>,
 <fc3bef3c-a10d-2cba-0277-d4a6b32bebf8@suse.com>
In-Reply-To: <fc3bef3c-a10d-2cba-0277-d4a6b32bebf8@suse.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [212.23.151.194]
x-g-data-mailsecurity-for-exchange-spamlevel: 0
x-g-data-mailsecurity-for-exchange-state: 0
x-g-data-mailsecurity-for-exchange-error: 0
x-g-data-mailsecurity-for-exchange-sender: 32
x-g-data-mailsecurity-for-exchange-server: 780d7915-977a-4bff-b5c9-200aa2c9dff1
x-g-data-mailsecurity-for-exchange-guid: 85CEB1C8-64F3-431E-9B15-D531C3EB2617
x-g-data-mailsecurity-for-exchange-processedonrouted: True
MIME-Version: 1.0
X-G-Data-MailSecurity-for-Exchange-SpamLevel: 0
X-G-Data-MailSecurity-for-Exchange-State: 0
X-G-Data-MailSecurity-for-Exchange-Error: 0
X-G-Data-MailSecurity-for-Exchange-Sender: 32
X-G-Data-MailSecurity-for-Exchange-Server: 45d2c731-935c-4aa2-a130-8d5a93adc5ab
Subject: Re: [Xen-devel] Host freezing after "fixing" recursive fault
 starting in multicalls.c
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
Cc: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBSaWdodCwgYnV0IHRoZSBiYWQgbmV3cyBpcyB0aGF0IHRoZXJlIGFyZSBubyBoZWxwZnVsIGh5
cGVydmlzb3IKPiBtZXNzYWdlcyBhdCBhbGwuIFNhZGx5IHRoaXMgaXMgcGFydGx5IG15IGZhdWx0
LCBiZWNhdXNlIEkgc2hvdWxkCj4gaGF2ZSBhc2tlZCB5b3UgdG8gZG8gdGhpcyBsb2cgY29sbGVj
dGlvbiB3aXRoIGEgZGVidWcgaHlwZXJ2aXNvci4KPiBNb3N0IG9mIHRoZSBwb3NzaWJseSBpbnRl
cmVzdGluZyBtZXNzYWdlcyB3b3VsZCBhcHBlYXIgb25seSB0aGVyZS4KCj4gSW4gYW55IGV2ZW50
LCBwcm9ibGVtcyBzdGFydCBxdWl0ZSBhIGJpdCBlYXJsaWVyLCBhbmQgdHlwaWNhbGx5Cj4gaXQn
cyB0aGUgZmlyc3QgaW5zdGFuY2Ugb2YgYSBwcm9ibGVtIHRoYXQgaXMgdGhlIG1vc3QgaGVscGZ1
bCB0bwo+IGFuYWx5emUsIGFzIGxhdGVyIG9uZXMgbWF5IGJlIGNhc2NhZGUgaXNzdWVzLiBUaGUg
Zmlyc3Qgc2lnbiBvZgo+IHByb2JsZW1zIGlzIGFuIG92ZXJsYXBwaW5nCgpUbyBiZSBob25lc3Qs
IEkgd2FzIGFscmVhZHkgd29uZGVyaW5nIHdoeSB0aGVyZSB3ZXJlIG9ubHkgc28gZmV3IGxvZ3Mg
YnV0IHdoaWxlIEkgYWxyZWFkeSBmb3VuZCB0aGUgQ01ETElORV9YRU4gb3B0aW9ucyBmb3IgZGVi
dWcgbG9ncyBJIGRpZG4ndCBmaW5kIGFueSBkb2N1bWVudGF0aW9uIGhvdyB0byBidWlsZCBhIGRl
YnVnIGh5cGVydmlzb3Igc28gZmFyIGFuZCBpdCB0b29rIG1lIHNvbWUgdGltZSB0byB3b3JrIGFy
b3VuZCB0aGUgZmFjdCB0aGF0IEkgZG9uJ3QgaGF2ZSBwaHlzaWNhbCBhY2Nlc3MgdG8gdGhlIHNl
cnZlciB0byBhdHRhY2ggYW4gYWN0dWFsIHNlcmlhbCBjYWJsZSBhbmQgc28gb24uCgpJIHdpbGwg
dHJ5IHRvIGNvbXBpbGUgWGVuIHdpdGggZGVidWcgZW5hYmxlZCBhbmQgY29sbGVjdCBtb3JlIGxv
Z3MgYWZ0ZXJ3YXJkcy4KQW55dGhpbmcgdG8gYmUgYXdhcmUgb2Y/CgoKVm9uOiBKYW4gQmV1bGlj
aCA8amJldWxpY2hAc3VzZS5jb20+Ckdlc2VuZGV0OiBNaXR0d29jaCwgMjkuIEphbnVhciAyMDIw
IDA5OjU5CkFuOiBLdXJmZXIsIFBldGVyCkNjOiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKQmV0cmVmZjogUmU6IEhvc3QgZnJlZXppbmcgYWZ0ZXIgImZpeGluZyIgcmVjdXJzaXZlIGZh
dWx0IHN0YXJ0aW5nIGluIG11bHRpY2FsbHMuYwrCoCAgIApPbiAyOS4wMS4yMDIwIDA5OjI5LCBQ
ZXRlci5LdXJmZXJAZ2RhdGEuZGUgd3JvdGU6Cj4gQXMgcmVxdWVzdGVkIEkgY29uZmlndXJlZCBv
bmUgaG9zdCB3aXRoOgo+IAo+PiBsb2dsdmw9YWxsIGd1ZXN0X2xvZ2x2bD1hbGwKPiAKPiBhbmTC
oGNvbGxlY3RlZCBvbmUgZGF5IG9mIGxvZ3MgdmlhIHNlcmlhbCBpbnRlcmZhY2U6Cj4gCj4gIGh0
dHBzOi8vZHJpdmUuZ29vZ2xlLmNvbS9kcml2ZS9mb2xkZXJzLzFzUXZ5TkgwU3oyOHRVZVZSWmw5
bW93aEIwSHRkOFpwTz91c3A9c2hhcmluZwo+IAo+IHNlYXJjaGluZyBmb3IgImVycm9yIiBvciAi
bXVsdGljYWxscy5jIiBsZWFkcyB0byBzb21lIHN0YWNrdHJhY2VzIHRoYXQgbWlnaHQgYmUgaW50
ZXJlc3RpbmcuCgpSaWdodCwgYnV0IHRoZSBiYWQgbmV3cyBpcyB0aGF0IHRoZXJlIGFyZSBubyBo
ZWxwZnVsIGh5cGVydmlzb3IKbWVzc2FnZXMgYXQgYWxsLiBTYWRseSB0aGlzIGlzIHBhcnRseSBt
eSBmYXVsdCwgYmVjYXVzZSBJIHNob3VsZApoYXZlIGFza2VkIHlvdSB0byBkbyB0aGlzIGxvZyBj
b2xsZWN0aW9uIHdpdGggYSBkZWJ1ZyBoeXBlcnZpc29yLgpNb3N0IG9mIHRoZSBwb3NzaWJseSBp
bnRlcmVzdGluZyBtZXNzYWdlcyB3b3VsZCBhcHBlYXIgb25seSB0aGVyZS4KCkluIGFueSBldmVu
dCwgcHJvYmxlbXMgc3RhcnQgcXVpdGUgYSBiaXQgZWFybGllciwgYW5kIHR5cGljYWxseQppdCdz
IHRoZSBmaXJzdCBpbnN0YW5jZSBvZiBhIHByb2JsZW0gdGhhdCBpcyB0aGUgbW9zdCBoZWxwZnVs
IHRvCmFuYWx5emUsIGFzIGxhdGVyIG9uZXMgbWF5IGJlIGNhc2NhZGUgaXNzdWVzLiBUaGUgZmly
c3Qgc2lnbiBvZgpwcm9ibGVtcyBpcyBhbiBvdmVybGFwcGluZwoKWzE0OTkxLjgyNzc2Ml0gQlVH
OiB1bmFibGUgdG8gaGFuZGxlIHBhZ2UgZmF1bHQgZm9yIGFkZHJlc3M6IGZmZmY4ODhhZTJlYjZi
ZDgKCmFuZAoKWzE0OTkxLjgyODE3Ml0gV0FSTklORzogQ1BVOiA1IFBJRDogMjU4NSBhdCBhcmNo
L3g4Ni94ZW4vbXVsdGljYWxscy5jOjEwMiB4ZW5fbWNfZmx1c2grMHgxOTQvMHgxYzAKCm9uIENQ
VXMgOCBhbmQgNS4KCj4gQXMgZmFyIGFzIEkga25vdyB0aGUgQUNQSSBlcnJvcnMgaW4gdGhlIGNv
bnRleHQgb2YgSVBNSSBjYW4gYmUgaWdub3JlZC4KCkxvb2tzIGxpa2Ugc28sIHllcywgYXQgbGVh
c3QgZm9yIHRoZSBwdXJwb3NlcyBoZXJlLiBXaGF0IEkgd291bGRuJ3QKcHV0IG9mZiBhcyBhIHBv
c3NpYmxlIHJlYXNvbiBmb3IgcHJvYmxlbXMgaXMgdGhlIHNpZ25pZmljYW50IGFtb3VudApvZiB0
ZW1wZXJhdHVyZSByZWxhdGVkIG1lc3NhZ2VzLiBXaGF0IEkgYWxzbyBmaW5kIGF0IGxlYXN0IGN1
cmlvdXMKKGJ1dCBwb3NzaWJseSBqdXN0IGJlY2F1c2UgSSBrbm93IHRvbyBsaXR0bGUgb2YgdGhl
IHJlc3BlY3RpdmUKYXNwZWN0cyBvZiBtb2Rlcm4ga2VybmVscykgYXJlIHRoZSByZWN1cnJpbmcg
X190ZXh0X3Bva2UoKSBpbnN0YW5jZXMKb24gdGhlIHN0YWNrIHRyYWNlcy4gQXNzdW1pbmcgdGhl
c2UgYXJlIHRvIGJlIGV4cGVjdGVkIGluIHRoZSBmaXJzdApwbGFjZSwgdGhlcmUgbWlnaHQgYmUg
YSByYWNlIGhlcmUgd2hpY2ggaXMgZWl0aGVyIFhlbi1zcGVjaWZpYyBvcgpzaW1wbHkgaGFzIGEg
bXVjaCBiZXR0ZXIgY2hhbmNlIG9mIGhpdHRpbmcgKGxhcmdlciB3aW5kb3c/KSB3aGVuCnJ1bm5p
bmcgb24gWGVuLiBCdXQgSSdtIGFmcmFpZCB0aGlzIHdpbGwgbmVlZCBsb29raW5nIGludG8gKG9y
IGF0CmxlYXN0IGNvbW1lbnRpbmcgb24pIGJ5IGEga2VybmVsIHBlcnNvbi4KCkphbgogICAgCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
