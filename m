Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8528BA8744
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2019 20:26:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5Zwh-00077v-3h; Wed, 04 Sep 2019 18:23:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DEGF=W7=ainfosec.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1i5Zwf-00077j-EA
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2019 18:23:53 +0000
X-Inumbo-ID: 255570dc-cf41-11e9-abbd-12813bfff9fa
Received: from mail.ainfosec.com (unknown [209.217.208.252])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 255570dc-cf41-11e9-abbd-12813bfff9fa;
 Wed, 04 Sep 2019 18:23:51 +0000 (UTC)
Received: from AIS-Mustang.ainfosec.com (10.201.1.188) by AISEX01.ainfosec.com
 (10.201.1.88) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1779.2; Wed, 4 Sep
 2019 14:23:51 -0400
Received: from AIS-Mustang.ainfosec.com (10.201.1.188) by
 AIS-Mustang.ainfosec.com (10.201.1.188) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1779.2; Wed, 4 Sep 2019 14:23:51 -0400
Received: from AIS-Mustang.ainfosec.com ([fe80::dd05:4fde:e2b2:58fb]) by
 AIS-Mustang.ainfosec.com ([fe80::dd05:4fde:e2b2:58fb%3]) with mapi id
 15.01.1779.002; Wed, 4 Sep 2019 14:23:51 -0400
From: Nicholas Rosbrook <rosbrookn@ainfosec.com>
To: George Dunlap <george.dunlap@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [RFC] Generating Go bindings for libxl
Thread-Index: AQHVR+YXn0M6Oya6KkWtfmVrm1e586bmgHl3gAHDewCAMlSpuYABnNsAgAAB9wD//9LHuQ==
Date: Wed, 4 Sep 2019 18:23:51 +0000
Message-ID: <229bd9fef40d42689c3ca60def2d435b@ainfosec.com>
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

PiBVbmZvcnR1bmF0ZWx5IHRoaXMgd291bGQgbWVhbiB0aGUgdHlwZSBhc3NlcnRpb24gd291bGQg
YmUgcHJldHR5IGxvbmcgYXMKPiB3ZWxsOgo+IMKgIGh2bSA6PSBkaS5UeXBlVW5pb24uKHhlbmxp
Z2h0LkRvbWFpbkJ1aWxkSW5mb1R5cGVVbmlvbkh2bSkKPiDCoCBodm0uW2VsZW1lbnRdCgpNYWRl
IHdvcnNlIGJ5IHRoZSBmYWN0IHRoYXQgeW91IHJlYWxseSBzaG91bGQgY2hlY2sgdGhlIHR5cGUg
YXNzZXJ0aW9uIGZpcnN0OgoKaHZtLCBvayA6PSBkaS5UeXBlVW5pb24uKHhlbmxpZ2h0LkRvbWFp
bkJ1aWxkSW5mb1R5cGVVbmlvbkh2bSkKaWYgIW9rIHsKICAgICAgICAvL2Vycm9yCn0KCj4gQnV0
IHVuZm9ydHVuYXRlbHkgSSBkb24ndCB0aGluayB0aGVyZSdzIGEgd2F5IGFyb3VuZCB0aGF0OyB0
aGF0J3MganVzdCBhCj4gbGltaXRhdGlvbiBvZiBHby4KClJpZ2h0LiBJZiB3ZSB3YW50ZWQgdG8g
bWFrZSBpdCBlYXNpZXIgb24gdGhlIHVzZXJzIG9mIHRoZSBwYWNrYWdlLCB3ZSAqY291bGQqCmFk
ZCBnZXR0ZXJzIHRoYXQgaGlkZXMgdGhlIHR5cGUgYXNzZXJ0aW9uLiBCdXQsIHRoYXQncyBzdGls
bCBhbiBleHRyYSBzdGVwIHZlcnN1cyBDLgoKLU5SCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
