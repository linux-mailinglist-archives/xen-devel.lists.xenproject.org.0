Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 027FDBBF65
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2019 02:38:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCYll-0008DT-Rv; Tue, 24 Sep 2019 00:33:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bjpb=XT=ainfosec.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1iCYlj-0008DO-IY
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 00:33:27 +0000
X-Inumbo-ID: ebe70caa-de62-11e9-9609-12813bfff9fa
Received: from mail.ainfosec.com (unknown [209.217.208.252])
 by localhost (Halon) with ESMTPS
 id ebe70caa-de62-11e9-9609-12813bfff9fa;
 Tue, 24 Sep 2019 00:33:26 +0000 (UTC)
Received: from AIS-Mustang.ainfosec.com (10.201.1.188) by AISEX01.ainfosec.com
 (10.201.1.88) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1779.2; Mon, 23
 Sep 2019 20:33:26 -0400
Received: from AIS-Mustang.ainfosec.com (10.201.1.188) by
 AIS-Mustang.ainfosec.com (10.201.1.188) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1779.2; Mon, 23 Sep 2019 20:33:25 -0400
Received: from AIS-Mustang.ainfosec.com ([fe80::dd05:4fde:e2b2:58fb]) by
 AIS-Mustang.ainfosec.com ([fe80::dd05:4fde:e2b2:58fb%3]) with mapi id
 15.01.1779.002; Mon, 23 Sep 2019 20:33:25 -0400
From: Nicholas Rosbrook <rosbrookn@ainfosec.com>
To: George Dunlap <george.dunlap@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [RFC] Generating Go bindings for libxl
Thread-Index: AQHVcm+t88w4QsduYkKZ+RxDaG9uGQ==
Date: Tue, 24 Sep 2019 00:33:25 +0000
Message-ID: <6cc0d4210b2e42dabed4e7b8717cfa9e@ainfosec.com>
References: <5c6f3ed7b2f444918feea4f4b7cec107@ainfosec.com>
 <c1c1663b-81ea-4704-e21e-c27a6d5999ba@citrix.com>
 <3da1f8bd6ee94d03b76d9f54e16de8a5@ainfosec.com>
 <da37ddde-0148-7e91-5dba-276df823d895@citrix.com>
 <bb81297d6d7441399425fd6079ac8bb7@ainfosec.com>
 <24acd142b70345038dc0dfdd61bb9520@ainfosec.com>
 <76c02038-fcce-2774-c4f5-73ab9e0fdeef@citrix.com>
 <102c4923aacb48b9b80795e65107451a@ainfosec.com>
 <871a9191-f32b-383e-4f78-1a0a79737cd8@citrix.com>
 <dbeeb071-25ae-9652-4be1-e3067109179f@citrix.com>
 <6e12ee2ca2d846e38450bd40bf73dde4@ainfosec.com>
 <75c37260-3ff9-0731-ec0c-a1cb6a6acfea@citrix.com>
 <1be9800ff98f4cff82a72e747286f5f5@ainfosec.com>,
 <4ebed087-27b6-c473-6bca-487e2bf85381@citrix.com>
In-Reply-To: <4ebed087-27b6-c473-6bca-487e2bf85381@citrix.com>
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

SGkgR2VvcmdlLAoKSSBtYWRlIHRoZSBjaGFuZ2VzIHRoYXQgd2UgZGlzY3Vzc2VkIFdSVCBDIHRv
IEdvIHR5cGUgbWFyc2hhbGluZy4gU2VlIFsxXSBmb3IgZ2VuZXJhdGVkIGNvZGUuCgpJbiBhZGRp
dGlvbiwgSSB0b29rIGEgcGFzcyBhdCBpbXBsZW1lbnRpbmcgR28gdG8gQyB0eXBlIG1hcnNoYWxp
bmcuIFRoZSBnZW5lcmF0ZWQgdG9DIGZ1bmN0aW9ucyBhcmUgYWxzbyBpbiBbMV0uCgpGaW5hbGx5
LCBJIG1hZGUgdGhlIG5lY2Vzc2FyeSBjaGFuZ2VzWzJdIHRvIHRoZSBleGlzdGluZyB4ZW5saWdo
dC5nbyBzbyB0aGF0IGl0IHVzZXMgdGhlIG5ldyBnZW5lcmF0ZWQgY29kZS4gVG8gc3VtbWFyaXpl
LCBmcm9tIG15IGNvbW1pdCBtZXNzYWdlOgoKICAgICogRGVmaW5lIG1pc3NpbmcgbGlieGwgYnVp
bHRpbiB0eXBlcwogICAgKiBSZW1vdmUgdHlwZXMgdGhhdCBhcmUgbm93IGRlZmluZWQgZnJvbSBn
ZW5nb3R5cGVzLnB5CiAgICAqIERlZmluZSBmcm9tQy90b0MgZm9yIGFsbCBidWlsdGluIHR5cGVz
CiAgICAqIEFkZCBDcmVhdGVEb21haW4gdG8gZGVtb25zdHJhdGUgZnVuY3Rpb25pbmcgZ2VuZXJh
dGVkIGNvZGUKICAgICogVXBkYXRlIGFueSBleGlzdGluZyBjb2RlIHNvIHRoYXQgY29tcGlsYXRp
b24gc3VjY2VlZHMKCkkndmUgc28gZmFyIGtlcHQgdGhlIGNoYW5nZXMgdG8geGVubGlnaHQuZ28g
d2l0aGluIHRoZSBzY29wZSBvZiB0aGUgY29kZSBnZW5lcmF0aW9uIGVmZm9ydC4gSSBmaWd1cmVk
IHRoZSByZXN0IG9mIHRoZSBBUEkgZGV2ZWxvcG1lbnQgd291bGQgYmUgb3VyIG5leHQgc3RlcC4K
CkJlc2lkZXMgdGhhdCwgdGhlIGxhc3QgdGhpbmcgSSBuZWVkIGlzIHRvIGtub3cgaG93IEkgc2hv
dWxkIGludGVncmF0ZSB0aGlzIGludG8gdGhlIGJ1aWxkLiBPZiBub3RlLCBnZW5nb3R5cGVzLnB5
IG5lZWRzIHRvIGltcG9ydCB0b29scy9saWJ4bC9pZGwucHkuIE1heWJlIHRoYXQgcGFydCBpcyBl
YXNpZXIgdG8gZGlzY3VzcyBvbiBJUkMuCgpCZXN0LAotTlIKClsxXSBodHRwczovL2dpdGh1Yi5j
b20vZW5yMG4veGVuL2Jsb2IvZ2VuLWdvLXR5cGVzL3Rvb2xzL2dvbGFuZy94ZW5saWdodC94ZW5s
aWdodF9oZWxwZXJzLmdvClsyXSBodHRwczovL2dpdGh1Yi5jb20vZW5yMG4veGVuL2NvbW1pdC83
MGVjODFhY2FmNjlkZjFjOTQ0NmY5NGFlYjRjZWJiZTg5ODNlNmM1Cl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
