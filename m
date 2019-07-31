Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 209137CFFC
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2019 23:25:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsw3e-0007lv-Cl; Wed, 31 Jul 2019 21:22:50 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jStG=V4=ainfosec.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1hsw3d-0007lq-08
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2019 21:22:49 +0000
X-Inumbo-ID: 5720a94f-b3d9-11e9-8980-bc764e045a96
Received: from mail.ainfosec.com (unknown [209.217.208.252])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 5720a94f-b3d9-11e9-8980-bc764e045a96;
 Wed, 31 Jul 2019 21:22:46 +0000 (UTC)
X-ASG-Debug-ID: 1564608164-0dce566a4a33b6a0001-RNp3Ad
Received: from AISEX01.ainfosec.com ([10.201.1.88]) by mail.ainfosec.com with
 ESMTP id b5gcAU32Abs8jnCU (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384
 bits=256 verify=NO); Wed, 31 Jul 2019 17:22:44 -0400 (EDT)
X-Barracuda-Envelope-From: rosbrookn@ainfosec.com
Received: from AIS-Mustang.ainfosec.com (10.201.1.188) by AISEX01.ainfosec.com
 (10.201.1.88) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1779.2; Wed, 31
 Jul 2019 17:22:44 -0400
Received: from AIS-Mustang.ainfosec.com (10.201.1.188) by
 AIS-Mustang.ainfosec.com (10.201.1.188) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1779.2; Wed, 31 Jul 2019 17:22:44 -0400
Received: from AIS-Mustang.ainfosec.com ([fe80::dd05:4fde:e2b2:58fb]) by
 AIS-Mustang.ainfosec.com ([fe80::dd05:4fde:e2b2:58fb%3]) with mapi id
 15.01.1779.002; Wed, 31 Jul 2019 17:22:44 -0400
From: Nicholas Rosbrook <rosbrookn@ainfosec.com>
To: George Dunlap <george.dunlap@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [RFC] Generating Go bindings for libxl
X-ASG-Orig-Subj: Re: [RFC] Generating Go bindings for libxl
Thread-Index: AQHVR+YXn0M6Oya6KkWtfmVrm1e58w==
Date: Wed, 31 Jul 2019 21:22:44 +0000
Message-ID: <bb81297d6d7441399425fd6079ac8bb7@ainfosec.com>
References: <5c6f3ed7b2f444918feea4f4b7cec107@ainfosec.com>
 <c1c1663b-81ea-4704-e21e-c27a6d5999ba@citrix.com>
 <3da1f8bd6ee94d03b76d9f54e16de8a5@ainfosec.com>,
 <da37ddde-0148-7e91-5dba-276df823d895@citrix.com>
In-Reply-To: <da37ddde-0148-7e91-5dba-276df823d895@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.101.172]
MIME-Version: 1.0
X-Barracuda-Connect: UNKNOWN[10.201.1.88]
X-Barracuda-Start-Time: 1564608164
X-Barracuda-Encrypted: ECDHE-RSA-AES256-SHA384
X-Barracuda-URL: https://10.69.69.46:443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at ainfosec.com
X-Barracuda-Scan-Msg-Size: 4153
X-Barracuda-BRTS-Status: 1
X-Barracuda-Bayes: INNOCENT GLOBAL 0.5009 1.0000 0.7500
X-Barracuda-Spam-Score: 0.75
X-Barracuda-Spam-Status: No, SCORE=0.75 using global scores of TAG_LEVEL=1000.0
 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=9.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.74709
 Rule breakdown below
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
Subject: Re: [Xen-devel] [RFC] Generating Go bindings for libxl
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
Cc: "anthony.perard@citrix.com" <anthony.perard@citrix.com>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 Brendan Kerrigan <kerriganb@ainfosec.com>,
 Nicolas Belouin <nicolas.belouin@gandi.net>, "wl@xen.org" <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBJIHJldHVybiB0byB0aGUgcXVlc3Rpb24gSSBzdGF0ZWQgYmVmb3JlLsKgIEF0IHRoZSBtb21l
bnQsIHlvdXIgYmluZGluZ3MKPiBoYXZlIHRoZSBmb2xsb3dpbmcgY2FsbCBjaGFpbjoKPiAKPiAq
IERvbWFpbkluZm8oKSwgaGFuZC1jcmFmdGVkLsKgIENhbGxzIGRvbWFpbkluZm8oKS4KPiAqIGRv
bWFpbkluZm8oKSwgYXV0b21hdGljYWxsIGdlbmVyYXRlZC7CoCBDYWxscyBDLmxpYnhsX2RvbWFp
bl9pbmZvKCkuCj4gCj4gVGhlIGluLXRyZWUgYmluZGluZ3MgaGF2ZSB0aGUgZm9sbG93aW5nIGNh
bGwgY2hhaW46Cj4gCj4gKiBEb21haW5JbmZvKCksIGhhbmQtY3JhZnRlZC7CoCBDYWxscyBDLmxp
YnhsX2RvbWFpbl9pbmZvKCkuCj4gCj4gU2luY2UgRG9tYWluSW5mbygpIGlzIGhhbmQtY3JhZnRl
ZCBpbiBib3RoIGNhc2VzLCB3aGF0J3MgdGhlIGFkdmFudGFnZQo+IG9mIGhhdmluZyBkb21haW5J
bmZvKCkgYXQgYWxsPwoKUG9pbnQgd2VsbCB0YWtlbi4KCj4gU28ganVzdCB0byBjbGFyaWZ5IHRl
cm1pbm9sb2d5OiBUaGUgSURMIGlzIHRoZSBkZXNjcmlwdGlvbiBsYW5ndWFnZQo+IGl0c2VsZiwg
d2hpY2ggYXQgdGhlIG1vbWVudCBvbmx5IGNvbnRhaW5zIGluZm9ybWF0aW9uIGFib3V0IHRoZSBs
aWJ4bAo+IHN0cnVjdHVyZXMuwqAgV2UgaGF2ZSBnZW5lcmF0b3JzIGZvciB2YXJpb3VzIEMgYml0
cyBvZiBsaWJ4bCB3aGljaCByZWFkCj4gdGhlIElETCBhbmQgc3BpdCBvdXQgYm9pbGVycGxhdGUg
Qy7CoCBUaGUgaWRlYSB3b3VsZCBiZSB0aGF0IHdlIHdyaXRlIGEKPiBuZXcgZ2VuZXJhdG9yIGZv
ciBHbyB3aGljaCByZWFkcyB0aGUgSURMIGFuZCBzcGl0cyBvdXQgYm9pbGVycGxhdGUgR28uCgpZ
ZXMsIEkga25vdy4gU29ycnkgZm9yIHRoZSBzdHJhbmdlIHBocmFzaW5nLiBJJ2xsIHRyeSBhZ2Fp
bjoKCkZyb20gd2hhdCBJIHVuZGVyc3RhbmQsIHRoZSBJREwgaXMgb25seSB1c2VkIHRvIGdlbmVy
YXRlIGxpYnhsIHR5cGVzLCBhbmQKdGhlIGJvaWxlci1wbGF0ZSBpbml0LCBkaXNwb3NlLCBldGMu
IGZ1bmN0aW9ucy4gSG93ZXZlciwgaWYgd2Ugd2FudCB0byBoYXZlIGEKZ2VuZXJhdG9yIHRoYXQg
cHJvZHVjZXMgR28gY29kZSB0aGF0IGNhbGxzIGxpYnhsIGZ1bmN0aW9ucywgdGhvc2UgZnVuY3Rp
b24Kc2lnbmF0dXJlcyBtdXN0IGJlIGtub3duIGR1cmluZyBjb2RlIGdlbmVyYXRpb24uIEhvd2V2
ZXIsIHRoZSBkZXNjcmlwdGlvbgpvZiB0aG9zZSBmdW5jdGlvbnMgaXMgb3V0c2lkZSB0aGUgc2Nv
cGUgb2YgdGhlIElETC4KClNvLCBpbiBvcmRlciB0byB3cml0ZSBzdWNoIGEgZ2VuZXJhdG9yIHdl
IHdvdWxkIG5lZWQgdG8gZWl0aGVyOgoKMS4gRXhwYW5kIHRoZSBJREwgKHNpZ25pZmljYW50bHkp
IHNvIHRoYXQgZnVuY3Rpb24gc2lnbmF0dXJlcyBjb3VsZCBiZSBkZXNjcmliZWQKaW4gdGhlIGdl
bmVyYWwgY2FzZS4KCjIuIFBhcnNlIHRoZSBDIGNvZGUuCgpXaXRoIHRoYXQgc2FpZCwgd2hhdCBh
cmUgeW91ciBleHBlY3RhdGlvbnMgZm9yIHRoZSBnZW5lcmF0ZWQgR28gY29kZSBhdCB0aGlzIHBv
aW50PwpEbyB5b3UgdGhpbmsgd2Ugc2hvdWxkIHRyeSB0byBnZW5lcmF0ZSB0aGUgcGllY2VzIHRo
YXQgY2FsbCBpbnRvIGxpYnhsPyBPciwgZG8geW91IHRoaW5rCnRoZSBjb2RlIGdlbmVyYXRpb24g
c2hvdWxkIGJlIGxpbWl0ZWQgdG8gdGhlIHN0cnVjdHMgYW5kIGJvaWxlci1wbGF0ZSBDIDwtPiBH
byAidHlwZQptYXJzaGFsaW5nPyIgCgo+IEkgbG9va2VkIGF0IHRoZSB0aGluZyBhYm91dCBuYWtl
ZCByZXR1cm5zLCBhbmQgZGlkbid0IHJlYWxseSB1bmRlcnN0YW5kCj4gaXQ7IGJ1dCBhbnl3YXkg
SSdtIGhhcHB5IHRvIGhhdmUgdGhpbmdzIG1vZGlmaWVkIHRvIGJlIG1vcmUgR28tbGlrZS7CoCBJ
Cj4gZGVmaW5pdGVseSAic3BlYWsiIEdvIHdpdGggYSBmdW5ueSBhY2NlbnQuCgpUTDtEUjogTmFr
ZWQgcmV0dXJucyBleGlzdDsgZG9uJ3QgdXNlIHRoZW0gKHdpdGggdGhlIGV4Y2VwdGlvbiBvZiBk
ZWZlcidkIGNsb3N1cmVzIGlmIG5lY2Vzc2FyeSkuCgo+IENhbiBJIHNheSAtLSBJJ3ZlIGJlZW4g
Z29pbmcgb3Blbi1zb3VyY2UgZm9yIHNvIGxvbmcsIHRoYXQgSSBmZWVsIGFsbW9zdAo+IHVuc2Fm
ZSB3aGVuIG5vYm9keSByZXZpZXdzIG15IHN0dWZmLsKgIE1vc3Qgb2YgdGhpcyBjb2RlIHdhcyB3
cml0dGVuIGJ5Cj4gbWUgYW5kIHJldmlld2VkIGJ5IG5vYm9keSAoc2luY2UgSSB3YXMgdGhlIG9u
bHkgcGVyc29uIGludGVyZXN0ZWQpOyBpdCdzCj4gZ29vZCB0byBoYXZlIHNvbWVvbmUgZWxzZSB0
YWtlIGEgY3JpdGljYWwgbG9vayBhdCBpdC4KCk1ha2VzIHNlbnNlIHRvIG1lLiBHbGFkIHRvIGJl
IGludm9sdmVkIDopCgo+IEFuZCBpZiB3ZSBoYWQgYSBhbiBJREwgZm9yIHRoZSBsaWJ4bCBmdW5j
dGlvbnMsIHdlIGNvdWxkIGhhdmUgaXQKPiBnZW5lcmF0ZSB0aGUgY29kZSBhYm92ZSBmb3IgdGhl
IHZhc3QgbWFqb3JpdHkgb2YgY2FzZXMuCgpJIGd1ZXNzIHRoYXQgYW5zd2VycyBteSBxdWVzdGlv
biBhYm92ZS4KCj4gSWYgd2Ugd3JvdGUgYSBnZW5lcmF0b3IgZnJvbSB0aGUgSURMLCB3ZSBjb3Vs
ZCBtYWtlIGl0IHNtYXJ0IGVub3VnaCB0bwo+IHVzZSBbXURpc2tzIGFzIHRoZSB0eXBlIHRoZXJl
LCBhbmQgbWFrZSB0aGUgbWFyc2hhbGxlcnMga25vdyBob3cgdG8gdXNlCj4gbnVtX2Rpc2tzIHRv
IGFwcHJvcHJpYXRlbHkgc2l6ZSB0aGUgcmVzdWx0aW5nIHNsaWNlIGFuZCBjb3B5IHRoZSByaWdo
dAo+IG51bWJlciBvZiB2YWx1ZXMgYWNyb3NzLsKgIFRvIGRvIHRoYXQgd2l0aCBjLWZvci1nbywg
d2UnZCBoYXZlIHRvIGRvIGEKPiBsb3Qgb2Ygd29yayB0ZWFjaGluZyBpdCB3aGF0IHRvIGRvLCBp
ZiB0aGF0J3MgZXZlbiBwb3NzaWJsZS4KCkdvb2QgcG9pbnQuIEFGQUlDVCB0aGVyZSBpc24ndCBh
IHdheSB0byBwcm92aWRlIHN1Y2ggaW5mb3JtYXRpb24gdG8gYy1mb3ItZ28uCgo+IFNvIHlvdSBt
ZWFuLCBmb3IgZXhhbXBsZSwgYWZ0ZXIgRG9tYWluSW5mbygpIGNhbGxzIERvbUluZm8uRGVyZWYo
KSwgaXQKPiB3aWxsIHRoZW4gY2FsbCBsaWJ4bF9kb21pbmZvX2Rpc3Bvc2UoKSBvbiB0aGUgQyBz
dHJ1Y3Q/CgpZZXMuCgo+IFJpZ2h0LCBhbmQgcGVyc29uYWxseSBJJ20gbm90IGluIHByaW5jaXBs
ZSBvcHBvc2VkIHRvIHVzaW5nIGMtZm9yLWdvLCBpZgo+IGl0IGNhbiBiZSBtYWRlIHRvIGdlbmVy
YXRlIGNvZGUgdGhlIHdheSB3ZSBsaWtlIGl0LsKgIE15IG1haW4gZmVhciBpcwo+IHRoYXQgd2Un
bGwgc3BlbmQgYSBidW5jaCBvZiB0aW1lIHR3ZWFraW5nIGMtZm9yLWdvLCBhbmQgYWZ0ZXIgZ29p
bmcgYmFjawo+IGFuZCBmb3J0aCBhbmQgaW52ZXN0aW5nIGEgbG90IG9mIHRpbWUgaW4gaXQsIHdl
J2xsIGVuZCB1cCBlaXRoZXIgMSkKPiBnaXZpbmcgdXAgYW5kIHdyaXRpbmcgb3VyIG93biBnZW5l
cmF0b3IgYW55d2F5LCBvciAyKSBhY2NlcHRpbmcKPiBzb21ldGhpbmcgc3ViLW9wdGltYWwgYmVj
YXVzZSBpdCdzIHRoZSBiZXN0IHRoaW5nIHdlIGNvdWxkIG1ha2UgYy1mb3ItZ28gZG8uCgpJIGFn
cmVlLCB0aG9zZSBhcmUgbGVnaXRpbWF0ZSBjb25jZXJucyBmb3IgdXNpbmcgYy1mb3ItZ28uIE9U
T0gsIG9uZSBjb25jZXJuCkkgaGF2ZSBmb3IgYSBjdXN0b20gZ2VuZXJhdG9yIGlzIHRoYXQgaXQg
aXMgaW5kZWVkIGN1c3RvbSwgYW5kIG1heWJlIHdvdWxkbid0CmJlIG9mIG11Y2ggdXNlIG91dHNp
ZGUgb2YgbGlieGwuIEl0IHdvdWxkIGJlIGdyZWF0IGlmIHRoZSBleHRyYSB3b3JrIGluIHdyaXRp
bmcgYSBuZXcKZ2VuZXJhdG9yIG1lYW50IHRoYXQgaXQgY291bGQgYmUgdXNlZCBieSBvdGhlciBw
cm9qZWN0cyB3aXRoIHNpbWlsYXIgbmVlZHMuIEhvd2V2ZXIsCkkgdW5kZXJzdGFuZCB0aGF0IGNv
bmNlcm4gbWF5IG5vdCBiZSBzaGFyZWQgYnkgb3RoZXJzLgoKSSB0aGluayB3ZSBoYXZlIGEgZGVj
ZW50IGVub3VnaCBpZGVhIGZvciB3aGF0IGEgYy1mb3ItZ28gdmVyc2lvbiBvZiB0aGlzIG1pZ2h0
IGxvb2sgbGlrZS4gU28sCndoYXQgYXJlIHRoZSBuZXh0IHN0ZXBzIGluIGV4cGxvcmluZyB0aGUg
Y3VzdG9tIGdlbmVyYXRvciByb3V0ZT8KCi1OUgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
