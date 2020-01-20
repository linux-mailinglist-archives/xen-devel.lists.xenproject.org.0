Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62FEB142A3D
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jan 2020 13:11:46 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itVrq-0007zs-5U; Mon, 20 Jan 2020 12:09:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=QnMZ=3J=gdata.de=peter.kurfer@srs-us1.protection.inumbo.net>)
 id 1itVrp-0007zn-4L
 for xen-devel@lists.xenproject.org; Mon, 20 Jan 2020 12:09:17 +0000
X-Inumbo-ID: a882e8d8-3b7d-11ea-9fd7-bc764e2007e4
Received: from mx1.gdata.de (unknown [212.23.151.203])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a882e8d8-3b7d-11ea-9fd7-bc764e2007e4;
 Mon, 20 Jan 2020 12:09:07 +0000 (UTC)
Received: from ex4.gdata.de (unknown [10.210.7.11])
 by mx1.gdata.de (Postfix) with ESMTPS id B9FCD802EE;
 Mon, 20 Jan 2020 13:09:06 +0100 (CET)
Received: from ex1.gdata.de (10.10.12.93) by ex4.gdata.de (10.210.7.11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.1034.26; Mon, 20 Jan
 2020 13:09:06 +0100
Received: from ex1.gdata.de (10.10.12.93) by ex1.gdata.de (10.10.12.93) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.1034.26; Mon, 20 Jan
 2020 13:09:06 +0100
Received: from ex1.gdata.de ([fe80::1d8:f0b4:e0a3:1e6d]) by ex1.gdata.de
 ([fe80::1d8:f0b4:e0a3:1e6d%2]) with mapi id 15.01.1034.033; Mon, 20 Jan 2020
 13:09:06 +0100
From: <Peter.Kurfer@gdata.de>
To: <jbeulich@suse.com>
Thread-Topic: [Xen-devel] Host freezing after "fixing" recursive fault
 starting in multicalls.c
Thread-Index: AQHVz3ZqbGDBFHO98UGsBRqPBwbUmqfzc/2j
Date: Mon, 20 Jan 2020 12:09:06 +0000
Message-ID: <5d912751441542ce841c5c4c2f9b7758@gdata.de>
References: <8e3c6908ce4b48689817b32c538fecf9@gdata.de>,
 <4d99fec9-013a-ff99-8813-2c464be8e970@suse.com>
In-Reply-To: <4d99fec9-013a-ff99-8813-2c464be8e970@suse.com>
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
x-g-data-mailsecurity-for-exchange-guid: 17B16A9E-E338-4448-9058-5C8C17FC1A5F
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

SSB3aWxsIGVuYWJsZSBkZWJ1ZyBsb2dzIG9uIHR3byBob3N0cyB0b2RheSB0byBzZWUgaWYgSSBj
YW4gY29ycmVsYXRlIHRoZSBhZm9yZW1lbnRpb25lZCBlcnJvciBtZXNzYWdlIHdpdGggc29tZSBk
ZWJ1ZyBsb2dzLgpBbnl0aGluZyBJIHNob3VsZCBjb25zaWRlciB0byBlbnN1cmUgdGhhdCBldmVy
eXRoaW5nIHJlcXVpcmVkIGlzIGluY2x1ZGVkPwpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
