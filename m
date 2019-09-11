Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBFE4B04DB
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2019 22:27:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i89B0-0005Rp-6W; Wed, 11 Sep 2019 20:25:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Wt8X=XG=ainfosec.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1i89Ay-0005Rk-Tj
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2019 20:25:16 +0000
X-Inumbo-ID: 42ff923e-d4d2-11e9-83dd-12813bfff9fa
Received: from mail.ainfosec.com (unknown [209.217.208.252])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 42ff923e-d4d2-11e9-83dd-12813bfff9fa;
 Wed, 11 Sep 2019 20:25:14 +0000 (UTC)
Received: from AIS-Mustang.ainfosec.com (10.201.1.188) by AISEX01.ainfosec.com
 (10.201.1.88) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1779.2; Wed, 11
 Sep 2019 16:25:14 -0400
Received: from AIS-Mustang.ainfosec.com (10.201.1.188) by
 AIS-Mustang.ainfosec.com (10.201.1.188) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1779.2; Wed, 11 Sep 2019 16:25:13 -0400
Received: from AIS-Mustang.ainfosec.com ([fe80::dd05:4fde:e2b2:58fb]) by
 AIS-Mustang.ainfosec.com ([fe80::dd05:4fde:e2b2:58fb%3]) with mapi id
 15.01.1779.002; Wed, 11 Sep 2019 16:25:13 -0400
From: Nicholas Rosbrook <rosbrookn@ainfosec.com>
To: George Dunlap <george.dunlap@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [RFC] Generating Go bindings for libxl
Thread-Index: AQHVR+YXn0M6Oya6KkWtfmVrm1e586bmgHl3gAHDewCAMlSpuYABnNsAgAAB9wCACvO0fg==
Date: Wed, 11 Sep 2019 20:25:13 +0000
Message-ID: <6e12ee2ca2d846e38450bd40bf73dde4@ainfosec.com>
References: <5c6f3ed7b2f444918feea4f4b7cec107@ainfosec.com>
 <c1c1663b-81ea-4704-e21e-c27a6d5999ba@citrix.com>
 <3da1f8bd6ee94d03b76d9f54e16de8a5@ainfosec.com>
 <da37ddde-0148-7e91-5dba-276df823d895@citrix.com>
 <bb81297d6d7441399425fd6079ac8bb7@ainfosec.com>
 <24acd142b70345038dc0dfdd61bb9520@ainfosec.com>
 <76c02038-fcce-2774-c4f5-73ab9e0fdeef@citrix.com>
 <102c4923aacb48b9b80795e65107451a@ainfosec.com>
 <871a9191-f32b-383e-4f78-1a0a79737cd8@citrix.com>,
 <dbeeb071-25ae-9652-4be1-e3067109179f@citrix.com>
In-Reply-To: <dbeeb071-25ae-9652-4be1-e3067109179f@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.101.172]
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

SGkgR2VvcmdlLAoKSSBtYWRlIHNvbWUgbW9yZSBwcm9ncmVzcyBvbiBnZW5nb3R5cGVzLnB5IFsx
XS4KCkZpcnN0LCBJIGltcGxlbWVudGVkIHRoZSBLZXllZFVuaW9uIHRyYW5zbGF0aW9uIHRoYXQg
d2UgdGFsa2VkIGFib3V0LiAKWW91IGNhbiBzZWUgYW4gZXhhbXBsZSBvZiB0aGUgZ2VuZXJhdGVk
IGNvZGUgaW4gWzJdLgoKU2Vjb25kLCBJIHRvb2sgYSBmaXJzdCBwYXNzIGF0IHRoZSBDLXRvLUdv
IHR5cGUgbWFyc2hhbGluZy4gSSBkZWZpbmVkIGEKIm1hcnNoYWxlciIgaW50ZXJmYWNlIGluIFsz
XSwgd2hpY2ggYWxsb3dzIHRoZSBjb252ZW5pZW5jZSBmdW5jdGlvbgpgZnVuYyBmcm9tQyhtIG1h
cnNoYWxlciwgY3R5cGUgaW50ZXJmYWNle30pIChlcnIgZXJyb3IpYC4gTXkgcHJpbWFyeSAKbW90
aXZhdGlvbiBmb3IgdGhpcyBpbnRlcmZhY2UgaXMgdG8gYWxsb3cgdGhlIGdlbmVyYXRlZCBjb2Rl
IHRvIGNhbGwgcGFuaWMKcmF0aGVyIHRoYW4gY2hlY2tpbmcgZm9yIGFuZCBoYW5kbGluZyBlcnJv
cnMuIEhvd2V2ZXIsIHRoZSBwcmV2aW91c2x5Cm1lbnRpb25lZCBjb252ZW5pZW5jZSBmdW5jdGlv
biB3aWxsIHJlY292ZXIgZnJvbSB0aG9zZSBwYW5pY3MgYW5kIHJldHVybgp0aGUgYXBwcm9wcmlh
dGUgZXJyb3IuIFNvLCBlYWNoIGdlbmVyYXRlZCBzdHJ1Y3QgaW1wbGVtZW50cyB0aGlzIGludGVy
ZmFjZS4KU2VlIHRoZSBnZW5lcmF0ZWQgY29kZSBpbiBbNF0uCgpZb3UnbGwgYWxzbyBub3RpY2Ug
aW4gWzRdIHRoYXQgSSBkZWZpbmVkIEMgc3RydWN0cyBpbiB0aGUgY2dvIHByZWFtYmxlIHdoaWNo
CmNvcnJlc3BvbmQgdG8gdGhlIEdvIEtleWVkVW5pb24gc3RydWN0cywgZS5nLiBEb21haW5CdWls
ZEluZm9UeXBlVW5pb25Qdi4KU2luY2UgY2dvIHRyZWF0cyBDIHVuaW9ucyBhIGJ5dGUgc2xpY2Us
IHdlIG5lZWQgdG8gZG8gYW4gdW5zYWZlLlBvaW50ZXIgY29udmVyc2lvbgp0byBzb21lIHN0cnVj
dCB0byBiZSBhYmxlIHRvIGFjY2VzcyB0aGUgZmllbGRzIG9mIGEgdW5pb24uIFNvLCBJIHRob3Vn
aHQgaXQgd291bGQKbWFrZSB0aGUgbW9zdCBzZW5zZSB0byBkbyB0aGUgY2FzdCB0byBhIEMgdHlw
ZSwgYW5kIHRoZW4gY29udmVydCB0aG9zZSBmaWVsZHMKdG8gR28gdHlwZXMgYWNjb3JkaW5nbHku
IFNlZSBbNV0gZm9yIGV4YW1wbGUuCgpXaGF0IGFyZSB5b3VyIHRob3VnaHRzIG9uIHRoZXNlIGlt
cGxlbWVudGF0aW9ucyBzbyBmYXI/CgpJIHdhcyBhYmxlIHRvIHdyaXRlIGEgY291cGxlIGV4YW1w
bGVzIHRvIGRlbW9uc3RyYXRlIHRoZSBnZW5lcmF0ZWQgY29kZSBpcyAKd29ya2luZywgYnV0IEkg
aGFkIHRvIG1ha2Ugc29tZSBzbWFsbCBjaGFuZ2VzIHRvIHRoZSBleGlzdGluZyBjb2RlIFdSVAps
aWJ4bCBidWlsdGluIHR5cGVzIChub3QgY29tbWl0dGVkIHRvIG15IGJyYW5jaCkuIFNvLCBJIHRo
b3VnaHQgd2Ugc2hvdWxkIGRlY2lkZQpob3cgdGhlc2UgYnVpbHRpbiB0eXBlcyB3aWxsIGJlIGRl
ZmluZWQgaW4gR28uIFRoaXMgaXMgd2hhdCBJIHdhcyB0aGlua2luZyBzbyBmYXI6CgpEZWZib29s
ICg/KQpEb21pZCAoYWxyZWFkeSBleGlzdHMpCkRldmlkID0+IGludApVdWlkID0+IFsxNl1ieXRl
Ck1hYyA9PiBbNl1ieXRlCkJpdG1hcCAoYWxyZWFkeSBleGlzdHMpCkNwdWlkUG9saWN5TGlzdCAo
PykKU3RyaW5nTGlzdCA9PiBbIF1zdHJpbmcKS2V5VmFsdWVMaXN0ID0+IG1hcFtzdHJpbmddc3Ry
aW5nCkh3Y2FwIChhbHJlYWR5IGV4aXN0cywgYnV0IHNob3VsZCBiZSByZS1mYWN0b3JlZCB0byBi
ZSBsaWtlIEJpdG1hcCB0byBoaWRlIHRoZSBDIHR5cGUpCk1zVm1HZW5pZCA9PiBbMTZdYnl0ZQpF
dkxpbmsgKD8pCgpUaG91Z2h0cz8KCi1OUgoKWzFdIGh0dHBzOi8vZ2l0aHViLmNvbS9lbnIwbi94
ZW4vYmxvYi9nZW4tZ28tdHlwZXMvdG9vbHMvZ29sYW5nL2dlbmdvdHlwZXMucHkKWzJdIGh0dHBz
Oi8vZ2l0aHViLmNvbS9lbnIwbi94ZW4vYmxvYi9nZW4tZ28tdHlwZXMvdG9vbHMvZ29sYW5nL3hl
bmxpZ2h0L3hlbmxpZ2h0X3R5cGVzLmdvI0w1MTEKWzNdIGh0dHBzOi8vZ2l0aHViLmNvbS9lbnIw
bi94ZW4vYmxvYi9nZW4tZ28tdHlwZXMvdG9vbHMvZ29sYW5nL3hlbmxpZ2h0L3hlbmxpZ2h0X21h
cnNoYWxlci5nbwpbNF0gaHR0cHM6Ly9naXRodWIuY29tL2VucjBuL3hlbi9ibG9iL2dlbi1nby10
eXBlcy90b29scy9nb2xhbmcveGVubGlnaHQveGVubGlnaHRfaGVscGVycy5nbwpbNV0gaHR0cHM6
Ly9naXRodWIuY29tL2VucjBuL3hlbi9ibG9iL2dlbi1nby10eXBlcy90b29scy9nb2xhbmcveGVu
bGlnaHQveGVubGlnaHRfaGVscGVycy5nbyNMNjg3Cl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
