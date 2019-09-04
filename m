Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE30A77E7
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2019 02:40:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5JHz-0001dT-LT; Wed, 04 Sep 2019 00:36:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DEGF=W7=ainfosec.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1i5JHy-0001dO-Kx
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2019 00:36:46 +0000
X-Inumbo-ID: 128bf830-ceac-11e9-b299-bc764e2007e4
Received: from mail.ainfosec.com (unknown [209.217.208.252])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 128bf830-ceac-11e9-b299-bc764e2007e4;
 Wed, 04 Sep 2019 00:36:45 +0000 (UTC)
Received: from AIS-Mustang.ainfosec.com (10.201.1.188) by AISEX01.ainfosec.com
 (10.201.1.88) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1779.2; Tue, 3 Sep
 2019 20:36:44 -0400
Received: from AIS-Mustang.ainfosec.com (10.201.1.188) by
 AIS-Mustang.ainfosec.com (10.201.1.188) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1779.2; Tue, 3 Sep 2019 20:36:44 -0400
Received: from AIS-Mustang.ainfosec.com ([fe80::dd05:4fde:e2b2:58fb]) by
 AIS-Mustang.ainfosec.com ([fe80::dd05:4fde:e2b2:58fb%3]) with mapi id
 15.01.1779.002; Tue, 3 Sep 2019 20:36:44 -0400
From: Nicholas Rosbrook <rosbrookn@ainfosec.com>
To: George Dunlap <george.dunlap@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [RFC] Generating Go bindings for libxl
Thread-Index: AQHVR+YXn0M6Oya6KkWtfmVrm1e586bmgHl3gAHDewCAMlSpuQ==
Date: Wed, 4 Sep 2019 00:36:44 +0000
Message-ID: <102c4923aacb48b9b80795e65107451a@ainfosec.com>
References: <5c6f3ed7b2f444918feea4f4b7cec107@ainfosec.com>
 <c1c1663b-81ea-4704-e21e-c27a6d5999ba@citrix.com>
 <3da1f8bd6ee94d03b76d9f54e16de8a5@ainfosec.com>
 <da37ddde-0148-7e91-5dba-276df823d895@citrix.com>
 <bb81297d6d7441399425fd6079ac8bb7@ainfosec.com>
 <24acd142b70345038dc0dfdd61bb9520@ainfosec.com>,
 <76c02038-fcce-2774-c4f5-73ab9e0fdeef@citrix.com>
In-Reply-To: <76c02038-fcce-2774-c4f5-73ab9e0fdeef@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.201.1.80]
MIME-Version: 1.0
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

R2VvcmdlLAoKPiBBcmUgeW91IHVwIGZvciB0YWtpbmcgYSBzdGFiIGF0IHNvbWV0aGluZyBsaWtl
IGBnZW5nb3R5cGVzLnB5YD8KCkkgaGF2ZSB3YXMgYWJsZSB0byBtYWtlIGEgYml0IG9mIHByb2dy
ZXNzIG9uIHRoaXMgb3ZlciB0aGUgd2Vla2VuZC4gSSd2ZSBzdGFydGVkCmBnZW5nb3R5cGVzLnB5
YCBpbiBteSBicmFuY2hbMV07IHRoZSBwb3J0aW9uIHdoaWNoIGdlbmVyYXRlcyBgeGVubGlnaHRf
dHlwZXMuZ29gCih0aGUgY291bnRlcnBhcnQgdG8gX2xpYnhsX3R5cGVzLmgpIGlzIG1vc3RseSB3
b3JraW5nLiAKClRoZSBtYWluIGV4Y2VwdGlvbiBpcyB0aGF0IEkgYW0gbm90IGNlcnRhaW4gaG93
IHRoZSBgS2V5ZWRVbmlvbmAgdHlwZSBmcm9tIHRoZSBJREwKc2hvdWxkIGJlIHRyYW5zbGF0ZWQg
Zm9yIEdvLiBPbmUgb3B0aW9uIGlzIHRvIGRvIHNvbWV0aGluZyBzaW1pbGFyIHRvIHRoZSBgb25l
b2ZgIGZpZWxkIAppbiBnUlBDJ3MgcHJvdG9idWYgbWVzc2FnZXNbMl0uIEVzc2VudGlhbGx5LCB3
ZSB3b3VsZCBkZWZpbmUgYSBzZXBhcmF0ZSBzdHJ1Y3QgZm9yIGVhY2gKb2YgdGhlIHN0cnVjdHMg
dGhhdCBiZWxvbmcgdG8gdGhlIHVuaW9uLiBUaGVuLCB3aGVyZSBhIHVuaW9uIHdvdWxkIGJlIHVz
ZWQgaW4gQywgd2UgdXNlCmFuIGludGVyZmFjZSB0eXBlIHdoaWNoIHRoZSBwcmV2aW91c2x5IGRl
ZmluZWQgc3RydWN0cyBpbXBsZW1lbnQuIEUuZy4KCnR5cGUgaXNEb21haW5UeXBlU3RydWN0IGlu
dGVyZmFjZSB7CiAgICAgICAgaXNEb21haW5UeXBlU3RydWN0KCkKfQoKdHlwZSBkb21haW5UeXBl
SFZNU3RydWN0IHN0cnVjdCB7CiAgICAgICAgLi4uCn0KCmZ1bmMgKGQgZG9tYWluVHlwZUhWTVN0
cnVjdCkgaXNEb21haW5UeXBlU3RydWN0KCkge30KCnR5cGUgRG9tYWluQnVpbGRJbmZvIHN0cnVj
dCB7CiAgICAgICAgLi4uCiAgICAgICAgVHlwZSBEb21haW5UeXBlCiAgICAgICAgZHRzICAgIGlz
RG9tYWluVHlwZVN0cnVjdAp9CgpJdCBpcyBhIGJpdCB1Z2x5LCBidXQgSSB0aGluayBpdCdzIHNl
bWFudGljYWxseSB0aGUgY2xvc2VzdCB0byAnS2V5ZWRVbmlvbicuIFdoYXQgYXJlIHlvdXIgdGhv
dWdodHM/CgotTlIKClsxXSBodHRwczovL2dpdGh1Yi5jb20vZW5yMG4veGVuL2Jsb2IvZ2VuLWdv
LXR5cGVzL3Rvb2xzL2dvbGFuZy9nZW5nb3R5cGVzLnB5ClsyXSBodHRwczovL2RldmVsb3BlcnMu
Z29vZ2xlLmNvbS9wcm90b2NvbC1idWZmZXJzL2RvY3MvcHJvdG8zI29uZW9mCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
