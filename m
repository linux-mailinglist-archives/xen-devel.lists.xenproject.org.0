Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5203F3B6E
	for <lists+xen-devel@lfdr.de>; Thu,  7 Nov 2019 23:32:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iSqHY-00029Q-NG; Thu, 07 Nov 2019 22:29:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Y2MP=Y7=citrix.com=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1iSqHW-00029L-OO
 for xen-devel@lists.xenproject.org; Thu, 07 Nov 2019 22:29:34 +0000
X-Inumbo-ID: 12999078-01ae-11ea-9631-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 12999078-01ae-11ea-9631-bc764e2007e4;
 Thu, 07 Nov 2019 22:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1573165775;
 h=from:to:cc:subject:date:message-id:content-id:
 content-transfer-encoding:mime-version;
 bh=buIN1qHGV97uMnJi27tcPtNm77+it+nfDSs5QtYALUg=;
 b=P0N8YqufBKIxUbGpzR7HUh3RpDbl8ziJaeTsZNzCvXu29VRkD8A6LmCk
 Ff3CymL2Keg8f2TQX8AGWDHYueOrxYWI6ec4j0H5KeTkHvnAl0VCc5Juh
 5DfR8xzTiUrs1F0sGCrgz5xjB3Ds51qGqqqvWCGDKt5sGtQjy34skXK0a A=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=lars.kurth@citrix.com;
 spf=Pass smtp.mailfrom=lars.kurth@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 lars.kurth@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 lars.kurth@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 0NpYeOYCISIZvPVaMcCRRX7Rm2MXOfYVtsKoEGtYcVPRjYwJaoT3TQkmycYdFIGbO80zsAExdI
 gNZXoxjOosXrlLtdAmLeTpwcFxwHZ/jSY12dCRu1Jum45eJ1O42O9Pw+nc1WbGVfhHLE8RbzSJ
 q/ZRRr+ybPA9vPkIh23WsRWdwj6zj4lOD59qqvvz2C8JC62kk77yOUaRdN4C5A579C40gMMXam
 b8HHadEsGqamt46fkfGHSzVYNU0TKylBVvSyvkYX5KaztuJ2AsE1Cd5jLkgSbL6ZA5F+1ns0jC
 ccs=
X-SBRS: 2.7
X-MesageID: 8033042
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,279,1569297600"; 
   d="scan'208";a="8033042"
From: Lars Kurth <lars.kurth@citrix.com>
To: xen-devel <xen-devel@lists.xenproject.org>, Juergen Gross <jgross@suse.com>
Thread-Topic: Call for new Release Manager for Xen 4.14+
Thread-Index: AQHVlbrSnQbXeRjO7U2yvrM4AIHL4A==
Date: Thu, 7 Nov 2019 22:29:30 +0000
Message-ID: <921F6581-B12A-4EC0-B0E2-91FE61C3D48D@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.10.f.191014
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <646BF1EAA8301741A4CFF07BBAD48E20@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] Call for new Release Manager for Xen 4.14+
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
Cc: Brian Woods <brian.woods@xilinx.com>,
 =?utf-8?B?UGF1bCBEdXJyYW50wqA=?= <pdurrant@amazon.com>,
 "committers@xenproject.org" <committers@xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RGVhciBDb21tdW5pdHkgTWVtYmVycywgDQoNCkp1ZXJnZW4gd2lsbCBiZSBzdGVwcGluZyBkb3du
IGFzIFJlbGVhc2UgTWFuYWdlciBhZnRlciBYZW4gNC4xMyBoYXMgYmVlbiBkZWxpdmVyZWQsIGZv
bGxvd2luZyB0aGUgNC4xMSBhbmQgNC4xMiByZWxlYXNlLiBSZWxlYXNlIG1hbmFnZXJzIHByaW9y
IHRvIEp1ZXJnZW4gd2VyZSBKdWxpZW4gR3JhbGwsIEtvbnJhZCBXaWxrLCBXZWkgTGl1IGFuZCBH
ZW9yZ2UgRHVubGFwLiBXZSBhcmUgbG9va2luZyBmb3IgYWN0aXZlIGNvbW11bml0eSBtZW1iZXJz
IHRvIGZvbGxvdyBpbiBwcmV2aW91cyByZWxlYXNlIG1hbmFnZXJzIGZvb3RzdGVwcy4gSSBhbHNv
IHdhbnRlZCB0byB0aGFuayBKdWVyZ2VuIGZvciBwZXJmb3JtaW5nIHRoZSByb2xlLiANCg0KV2Ug
aGF2ZSBkaXNjdXNzZWQgd2l0aCBhIG51bWJlciBvZiBwZW9wbGUsIGhvd2V2ZXIgV2VpIG1hZGUg
dGhlIHZlcnkgdmFsaWQgcG9pbnQgdGhhdCB3ZSBzaG91bGQgbWFrZSBhbiBhbm5vdW5jZW1lbnQg
YWJvdXQgdGhlIHJvbGUgb24gdGhlIGxpc3QuICBJbiB0ZXJtcyBvZiBlZmZvcnQsIHRoZSBlZmZv
cnQgcmVxdWlyZWQgcHJpb3IgdG8gdGhlIHJlbGVhc2UgaXMgcmVsYXRpdmVseSBsb3cgKDEtMiBk
YXlzIGEgbW9udGgpLCBob3dldmVyIGluIHRoZSBsYXN0IHR3byBtb250aHMgb2YgdGhlIHJlbGVh
c2UgZ29lcyB1cCB0byAxLTIgZGF5cyBwZXIgd2Vlay4gVHlwaWNhbGx5IHJlbGVhc2UgbWFuYWdl
cnMgbWFuYWdlIDItMyByZWxlYXNlcy4NCg0KV2hhdCBpcyBpbnZvbHZlZCBpbiB0aGUgcm9sZSBp
cyBkZXNjcmliZWQgaGVyZTogaHR0cDovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWIvP3A9eGVuLmdp
dDthPWJsb2I7Zj1kb2NzL3Byb2Nlc3MveGVuLXJlbGVhc2UtbWFuYWdlbWVudC5wYW5kb2M7aD1k
NmFiYzkwYTAyNDhiNzY5MTYxYmNlNzllOGRjNjkwNGM2NTQ5MDRhO2hiPUhFQUQNCg0KSWYgeW91
IGFyZSBhIGNvbW11bml0eSBtZW1iZXIgdGhhdCBmZWVscyB0aGUgcmVsZWFzZSBtYW5hZ2VyIHJv
bGUgd291bGQgYmUgYSBnb29kIG1hdGNoIGZvciB5b3UsIHBsZWFzZSBjb250YWN0IG1lOiBhbHNv
IGZlZWwgZnJlZSB0byBhc2sgbWUgb3IgcHJldmlvdXMgcmVsZWFzZSBtYW5hZ2VycyBhbnkgcXVl
c3Rpb25zDQoNCkJlc3QgUmVnYXJkcw0KTGFycw0KDQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
