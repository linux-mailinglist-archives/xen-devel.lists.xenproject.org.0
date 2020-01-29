Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 937A014C78A
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2020 09:31:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwijR-0002FE-VV; Wed, 29 Jan 2020 08:29:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=i8To=3S=gdata.de=peter.kurfer@srs-us1.protection.inumbo.net>)
 id 1iwijQ-0002F5-Fs
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2020 08:29:52 +0000
X-Inumbo-ID: 842a0dfe-4271-11ea-b211-bc764e2007e4
Received: from mx2.gdata.de (unknown [212.23.151.204])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 842a0dfe-4271-11ea-b211-bc764e2007e4;
 Wed, 29 Jan 2020 08:29:51 +0000 (UTC)
Received: from ex4.gdata.de (ex4.gdata.de [10.210.7.11])
 by mx2.gdata.de (Postfix) with ESMTPS id 2E19D80833;
 Wed, 29 Jan 2020 09:29:50 +0100 (CET)
Received: from ex2.gdata.de (10.10.12.94) by ex4.gdata.de (10.210.7.11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.1034.26; Wed, 29 Jan
 2020 09:29:49 +0100
Received: from ex1.gdata.de (10.10.12.93) by ex2.gdata.de (10.10.12.94) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.1034.26; Wed, 29 Jan
 2020 09:29:49 +0100
Received: from ex1.gdata.de ([fe80::1d8:f0b4:e0a3:1e6d]) by ex1.gdata.de
 ([fe80::1d8:f0b4:e0a3:1e6d%2]) with mapi id 15.01.1034.033; Wed, 29 Jan 2020
 09:29:49 +0100
From: <Peter.Kurfer@gdata.de>
To: <jbeulich@suse.com>
Thread-Topic: Host freezing after "fixing" recursive fault starting in
 multicalls.c
Thread-Index: AQHVz4sLNgmZNGFJEEmdW8QDt3MmIqgBW+yF
Date: Wed, 29 Jan 2020 08:29:49 +0000
Message-ID: <b11cccbee7504efb8ea9d3fa14a85afc@gdata.de>
References: <8e3c6908ce4b48689817b32c538fecf9@gdata.de>
 <4d99fec9-013a-ff99-8813-2c464be8e970@suse.com>
 <5d912751441542ce841c5c4c2f9b7758@gdata.de>,
 <adc62139-1330-ea1c-92fa-33939ceb14ac@suse.com>
In-Reply-To: <adc62139-1330-ea1c-92fa-33939ceb14ac@suse.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [212.23.151.194]
x-g-data-mailsecurity-for-exchange-spamlevel: 0
x-g-data-mailsecurity-for-exchange-state: 0
x-g-data-mailsecurity-for-exchange-error: 0
x-g-data-mailsecurity-for-exchange-sender: 32
x-g-data-mailsecurity-for-exchange-server: b518cbf5-84a3-453a-a79a-947cf417bc69
x-g-data-mailsecurity-for-exchange-guid: 14BFB0D3-FD56-4206-9D5F-5A1B274CB817
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

QXMgcmVxdWVzdGVkIEkgY29uZmlndXJlZCBvbmUgaG9zdCB3aXRoOgoKPiBsb2dsdmw9YWxsIGd1
ZXN0X2xvZ2x2bD1hbGwKCmFuZMKgY29sbGVjdGVkIG9uZSBkYXkgb2YgbG9ncyB2aWEgc2VyaWFs
IGludGVyZmFjZToKCmh0dHBzOi8vZHJpdmUuZ29vZ2xlLmNvbS9kcml2ZS9mb2xkZXJzLzFzUXZ5
TkgwU3oyOHRVZVZSWmw5bW93aEIwSHRkOFpwTz91c3A9c2hhcmluZwoKc2VhcmNoaW5nIGZvciAi
ZXJyb3IiIG9yICJtdWx0aWNhbGxzLmMiIGxlYWRzIHRvIHNvbWUgc3RhY2t0cmFjZXMgdGhhdCBt
aWdodCBiZSBpbnRlcmVzdGluZy4KCkFzIGZhciBhcyBJIGtub3cgdGhlIEFDUEkgZXJyb3JzIGlu
IHRoZSBjb250ZXh0IG9mIElQTUkgY2FuIGJlIGlnbm9yZWQuCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
