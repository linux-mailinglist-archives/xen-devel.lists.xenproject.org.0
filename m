Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BBA07E2F1
	for <lists+xen-devel@lfdr.de>; Thu,  1 Aug 2019 21:03:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htGIr-0000X3-NV; Thu, 01 Aug 2019 18:59:53 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Rg8y=V5=ainfosec.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1htGIp-0000Wy-Uj
 for xen-devel@lists.xenproject.org; Thu, 01 Aug 2019 18:59:51 +0000
X-Inumbo-ID: 893c1e11-b48e-11e9-8980-bc764e045a96
Received: from mail.ainfosec.com (unknown [209.217.208.252])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 893c1e11-b48e-11e9-8980-bc764e045a96;
 Thu, 01 Aug 2019 18:59:49 +0000 (UTC)
X-ASG-Debug-ID: 1564685987-0dce566a4a39b210001-RNp3Ad
Received: from AISEX01.ainfosec.com ([10.201.1.88]) by mail.ainfosec.com with
 ESMTP id piT35wk4worLJ5xF (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384
 bits=256 verify=NO); Thu, 01 Aug 2019 14:59:47 -0400 (EDT)
X-Barracuda-Envelope-From: rosbrookn@ainfosec.com
Received: from AIS-Mustang.ainfosec.com (10.201.1.188) by AISEX01.ainfosec.com
 (10.201.1.88) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1779.2; Thu, 1 Aug
 2019 14:59:47 -0400
Received: from AIS-Mustang.ainfosec.com (10.201.1.188) by
 AIS-Mustang.ainfosec.com (10.201.1.188) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1779.2; Thu, 1 Aug 2019 14:59:47 -0400
Received: from AIS-Mustang.ainfosec.com ([fe80::dd05:4fde:e2b2:58fb]) by
 AIS-Mustang.ainfosec.com ([fe80::dd05:4fde:e2b2:58fb%3]) with mapi id
 15.01.1779.002; Thu, 1 Aug 2019 14:59:47 -0400
From: Nicholas Rosbrook <rosbrookn@ainfosec.com>
To: George Dunlap <george.dunlap@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [RFC] Generating Go bindings for libxl
X-ASG-Orig-Subj: Re: [RFC] Generating Go bindings for libxl
Thread-Index: AQHVR+YXn0M6Oya6KkWtfmVrm1e586bmgHl3
Date: Thu, 1 Aug 2019 18:59:47 +0000
Message-ID: <24acd142b70345038dc0dfdd61bb9520@ainfosec.com>
References: <5c6f3ed7b2f444918feea4f4b7cec107@ainfosec.com>
 <c1c1663b-81ea-4704-e21e-c27a6d5999ba@citrix.com>
 <3da1f8bd6ee94d03b76d9f54e16de8a5@ainfosec.com>,
 <da37ddde-0148-7e91-5dba-276df823d895@citrix.com>,
 <bb81297d6d7441399425fd6079ac8bb7@ainfosec.com>
In-Reply-To: <bb81297d6d7441399425fd6079ac8bb7@ainfosec.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.101.172]
MIME-Version: 1.0
X-Barracuda-Connect: UNKNOWN[10.201.1.88]
X-Barracuda-Start-Time: 1564685987
X-Barracuda-Encrypted: ECDHE-RSA-AES256-SHA384
X-Barracuda-URL: https://10.69.69.46:443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at ainfosec.com
X-Barracuda-Scan-Msg-Size: 1617
X-Barracuda-BRTS-Status: 0
X-Barracuda-Bayes: INNOCENT GLOBAL 0.5053 1.0000 0.7500
X-Barracuda-Spam-Score: 0.75
X-Barracuda-Spam-Status: No, SCORE=0.75 using global scores of TAG_LEVEL=1000.0
 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=9.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.74730
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
 Brendan Kerrigan <kerriganb@ainfosec.com>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 Nicolas Belouin <nicolas.belouin@gandi.net>, "wl@xen.org" <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBXaXRoIHRoYXQgc2FpZCwgd2hhdCBhcmUgeW91ciBleHBlY3RhdGlvbnMgZm9yIHRoZSBnZW5l
cmF0ZWQgR28gY29kZSBhdCB0aGlzIHBvaW50Pwo+IERvIHlvdSB0aGluayB3ZSBzaG91bGQgdHJ5
IHRvIGdlbmVyYXRlIHRoZSBwaWVjZXMgdGhhdCBjYWxsIGludG8gbGlieGw/IE9yLCBkbyB5b3Ug
dGhpbmsKPiB0aGUgY29kZSBnZW5lcmF0aW9uIHNob3VsZCBiZSBsaW1pdGVkIHRvIHRoZSBzdHJ1
Y3RzIGFuZCBib2lsZXItcGxhdGUgQyA8LT4gR28gInR5cGUKPiBtYXJzaGFsaW5nPyIKClsuLi5d
Cgo+IEkgdGhpbmsgd2UgaGF2ZSBhIGRlY2VudCBlbm91Z2ggaWRlYSBmb3Igd2hhdCBhIGMtZm9y
LWdvIHZlcnNpb24gb2YgdGhpcyBtaWdodCBsb29rIGxpa2UuIFNvLAo+IHdoYXQgYXJlIHRoZSBu
ZXh0IHN0ZXBzIGluIGV4cGxvcmluZyB0aGUgY3VzdG9tIGdlbmVyYXRvciByb3V0ZT8KClNvcnJ5
IHRvIGFuc3dlciBteSBvd24gcXVlc3Rpb24sIGJ1dCBJIHdhbnRlZCB0byBmb2xsb3cgdXAgd2l0
aCBzb21lIHRob3VnaHRzIEkgY2FtZSB1cAp3aXRoIGFmdGVyIEkgc2VudCBteSBsYXN0IGVtYWls
LgoKSSB0aGluayBtYXliZSB3ZSBzaG91bGQgdGFrZSB0aGUgc2ltcGxlciBhcHByb2FjaC4gTWVh
bmluZywgdGhlIEdvIHBhY2thZ2Ugd291bGQgYmUKY29uc3RydWN0ZWQgYXMgZm9sbG93czoKCjEu
IEdlbmVyYXRlZCBjb2RlIGZvciBHbyB0eXBlcyB0aGF0IGFyZSBhbmFsb2dvdXMgdG8gdGhlIEMg
bGlieGwgdHlwZXMuIFRoZSBJREwgc2hvdWxkCmFscmVhZHkgYmUgYWJsZSB0byBwcm92aWRlIGVu
b3VnaCBpbmZvcm1hdGlvbiBmb3IgYSBzaW1wbGUgR28gY29kZSBnZW5lcmF0b3IgKGxpa2UgZ2Vu
dHlwZXMucHkpLgoKMi4gR2VuZXJhdGVkIGNvZGUgdG8gaGFuZGxlIHRoZSBtYXJzaGFsaW5nIGJl
dHdlZW4gdGhlIHB1cmUtR28gdHlwZXMgYW5kIHRoZSBDIHR5cGVzLiBXZQpjb3VsZCB0YWlsb3Ig
dGhpcyBwaWVjZSB0byBhZGRyZXNzIHRoZSBzaG9ydC1jb21pbmdzIG9mIGMtZm9yLWdvLCBlLmcu
IHRoZSBudW1fZGlza3MgaXNzdWUsIHByZXZlbnRpbmcKdXNlLWFmdGVyLWZyZWUsIGV0Yy4KCjMu
IEhhbmQtd3JpdHRlbiB3cmFwcGVycy4gQXMgeW91IHN0YXRlZCBiZWZvcmUsIHRoZXJlIGlzIG5v
dCBtdWNoIGRpZmZlcmVuY2UgYmV0d2VlbiB0aGUgaW4tdHJlZQpiaW5kaW5ncyBjYWxsaW5nIEMu
bGlieGxfZG9tYWluX2luZm8sIGFuZCBteSB3cmFwcGVycyBjYWxsaW5nIGRvbWFpbkluZm8oKSAo
YmVzaWRlcyB0aGUgYWRkaXRpb25hbApsYXllciBpbiBtaW5lKS4gQW5kLCB3ZSBhZ3JlZSB0aGF0
IHdyaXRpbmcgdGhvc2Ugc2ltcGxlIHdyYXBwZXJzIGlzIHByZXR0eSBwYWlubGVzcy4KCkkgdGhp
bmsgdGhpcyBpcyBtb3JlIG9yIGxlc3Mgd2hhdCB5b3UgaGF2ZSBiZWVuIHN1Z2dlc3RpbmcsIGJ1
dCBJIHdhbnRlZCB0byBhcnRpY3VsYXRlIHRoZSBwb2ludCB0aGF0CkkgdGhpbmsgaWYgd2UgZ28g
d2l0aCBhIGN1c3RvbSBnZW5lcmF0b3IsIHdlIHNob3VsZCBub3QgdHJ5IGRvIGFzIG11Y2ggYXMg
Yy1mb3ItZ28gaXMgdHJ5aW5nIGRvLgoKVGhvdWdodHMgb24gdGhhdD8KCi1OUgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
