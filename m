Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51EDE14ED0F
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jan 2020 14:15:13 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixW6w-0002v7-G7; Fri, 31 Jan 2020 13:13:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jSpw=3U=qconsultancy.nl=joost.heijne@srs-us1.protection.inumbo.net>)
 id 1ixW6u-0002ur-Oj
 for xen-devel@lists.xenproject.org; Fri, 31 Jan 2020 13:13:24 +0000
X-Inumbo-ID: 75e68c84-442b-11ea-8bc2-12813bfff9fa
Received: from smtp.qconsultancy.nl (unknown [185.43.215.210])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 75e68c84-442b-11ea-8bc2-12813bfff9fa;
 Fri, 31 Jan 2020 13:13:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp.qconsultancy.nl (Postfix) with ESMTP id 14FA6B8061;
 Fri, 31 Jan 2020 14:13:23 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at qconsultancy.nl
Received: from smtp.qconsultancy.nl ([127.0.0.1])
 by localhost (smtp.qconsultancy.nl [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rPNHO3EoTdPl; Fri, 31 Jan 2020 14:13:21 +0100 (CET)
Received: from qserver.QCONSULT.local (qserver.qconsult.local [192.168.134.21])
 by smtp.qconsultancy.nl (Postfix) with ESMTP id 13041B8034;
 Fri, 31 Jan 2020 14:13:21 +0100 (CET)
X-MimeOLE: Produced By Microsoft Exchange V6.5
Content-class: urn:content-classes:message
MIME-Version: 1.0
Date: Fri, 31 Jan 2020 14:13:21 +0100
Message-ID: <D86093E6BC00944ABD85466C2D43B2AB023FD3CA@qserver.QCONSULT.local>
In-Reply-To: <ade6b60c-a7b9-5b04-acdb-2087f4b1de0e@citrix.com>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [Xen-devel] Windows HVM no longer boots with AMD Ryzen 3700X
Thread-Index: AdXYNzDnn/aB0KsGTnahiuFWsOq23AAALClg
References: <51bd31f9-4fb1-84b5-7b9b-983b53133148@posteo.de>
 <a2fecd7b-a035-48b4-ed18-cd3234be8d58@citrix.com>
 <53c70f32-9ae6-a9f8-6472-5e49d01ce2b0@posteo.de>
 <1b95b3f8-b822-1f1c-243f-728e7967d04f@citrix.com>
 <67b07eb0-e9ac-e7b2-cf07-0a1733f7526a@posteo.de>
 <D86093E6BC00944ABD85466C2D43B2AB023FD3C8@qserver.QCONSULT.local>
 <ade6b60c-a7b9-5b04-acdb-2087f4b1de0e@citrix.com>
From: "Joost Heijne" <joost.heijne@qconsultancy.nl>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>,
 "Andreas Kinzler" <hfp@posteo.de>, <xen-devel@lists.xenproject.org>
Subject: Re: [Xen-devel] Windows HVM no longer boots with AMD Ryzen 3700X
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QWgsIEkgZGlkbid0IGNoZWNrIGZvciB0aGF0LiBJIHJ1biBYZW4gZnJvbSB0aGUgcGFja2FnZSBk
aXN0cmlidXRlZCBieSBVYnVudHUsIHdoaWNoIGlzIDQuOS4yIGN1cnJlbnRseS4NCg0KSm9vc3QN
Cg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEFuZHJldyBDb29wZXIgW21haWx0
bzphbmRyZXcuY29vcGVyM0BjaXRyaXguY29tXSANClNlbnQ6IEZyaWRheSwgSmFudWFyeSAzMSwg
MjAyMCAxNDowNg0KVG86IEpvb3N0IEhlaWpuZTsgQW5kcmVhcyBLaW56bGVyOyB4ZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmc7IFBhdWwuRHVycmFudEBjaXRyaXguY29tDQpTdWJqZWN0OiBS
ZTogW1hlbi1kZXZlbF0gV2luZG93cyBIVk0gbm8gbG9uZ2VyIGJvb3RzIHdpdGggQU1EIFJ5emVu
IDM3MDBYDQoNCk9uIDMxLzAxLzIwMjAgMTI6NDMsIEpvb3N0IEhlaWpuZSB3cm90ZToNCj4gSGks
DQo+DQo+IEkgcmFuIGludG8gdGhpcyBsaXN0IGxvb2tpbmcgZm9yIGEgc29sdXRpb24gZm9yIHRo
ZSBleGFjdCBzYW1lIHByb2JsZW0NCj4gYXMgZGVzY3JpYmVkIGhlcmUuIEknbSB0cnlpbmcgdG8g
bWlncmF0ZSBhbiBleGlzdGluZyBXaW5kb3dzDQo+IFNlcnZlciAyMDE2IGltYWdlIHRvIGEgUnl6
ZW4gMzkwMHggYW5kIGVuY291bnRlcmVkIHRoZSBzYW1lDQo+IGRpZmZpY3VsdGllcy4gSSBkaXNh
YmxlZCB0aGUgcHJvY2Vzc29yJ3MgU01UIGZlYXR1cmUgaW4gdGhlIEJJT1MgYW5kDQo+IG5vdyBp
dCB3b3JrcyBwZXJmZWN0bHkuDQoNClRoYXQgd2lsbCB3b3JrLCBidXQgd2UgYWxzbyBnb3QgYSBm
aXggZm9yIHRoaXMgaXNzdWUgaW50byBYZW4gNC4xMy4NCg0KQXJlIHlvdSBzYXlpbmcgdGhhdCwg
ZGVzcGl0ZSB0aGF0IGZpeCwgeW91IHdlcmUgc3RpbGwgc2VlaW5nIGlzc3Vlcz8NCg0KfkFuZHJl
dw0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
