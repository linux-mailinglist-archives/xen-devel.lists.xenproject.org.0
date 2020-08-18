Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5D9247F83
	for <lists+xen-devel@lfdr.de>; Tue, 18 Aug 2020 09:30:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k7w2i-000347-0m; Tue, 18 Aug 2020 07:28:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PQEp=B4=citrix.com=edvin.torok@srs-us1.protection.inumbo.net>)
 id 1k7w2h-000342-4n
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2020 07:28:23 +0000
X-Inumbo-ID: fe177771-9ff1-475f-9215-2af75cdc2d9e
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fe177771-9ff1-475f-9215-2af75cdc2d9e;
 Tue, 18 Aug 2020 07:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597735701;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=TRx1dfPB+QSkAXi67BSO4blis1i3SlIqfdZLBHboldc=;
 b=g4loh6RuoOCvNphmAgUNpF45htp4XQAXONeJhYWysQNFtIScEZMtvbAp
 0B6sRRQ7Cm0HP9DPQxCkQG8n8OE0Evu4d8foSChK0A4aenCt4ZfxRi6pz
 XXHr5s6mVeVTTPRZQrLdfa/zndE9xUObm0yGjbrMPWuMtBw7pKxVXTDug Y=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: +Sp4U2FRuovTkPtBuRGFYHD0FnmAiNas+VaJhVSRk5Fjwu/YyScDfhYNZKsLSaOw4QN+j+MzHh
 /c4DY91SzMyoHBc0ef5W1sH8I/bU94xqGkjgb0ZUE1c3yR1gTCEh8prYt5qPUHVwAr1cap8Ejx
 7i00GiIRmgWRfUY+03TFKq59JRZ9LGopKHqA13pRJPet8esN1TSAN/iKM25yDv8EfpGPZj/B6o
 g145SATX9s9RM0q8xJZssAVS4REWv0nC91elOvst0cwr25FAT/qcJpA8cHEN7KHbQI6lbnfMuR
 h9U=
X-SBRS: 2.7
X-MesageID: 25080370
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,326,1592884800"; d="scan'208";a="25080370"
From: Edwin Torok <edvin.torok@citrix.com>
To: Christian Lindig <christian.lindig@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Ian Jackson <Ian.Jackson@citrix.com>, "dave@recoil.org" <dave@recoil.org>, 
 "wl@xen.org" <wl@xen.org>
Subject: Re: [PATCH v1 0/6] tools/ocaml/xenstored: simplify code
Thread-Topic: [PATCH v1 0/6] tools/ocaml/xenstored: simplify code
Thread-Index: AQHWcof9A1jzs+tlWE2C9n9b/FTKaqk8JPMAgAE2tIA=
Date: Tue, 18 Aug 2020 07:28:10 +0000
Message-ID: <cbb2742191e9c1303fdfd95feef4d829ecf33a0d.camel@citrix.com>
References: <cover.1597439193.git.edvin.torok@citrix.com>
 <1597668966374.91968@citrix.com>
In-Reply-To: <1597668966374.91968@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="utf-8"
Content-ID: <BEBCEC6C7A4EC9438CF758789E048E97@citrix.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCAyMDIwLTA4LTE3IGF0IDE0OjU2ICswMjAwLCBDaHJpc3RpYW4gTGluZGlnIHdyb3Rl
Og0KPiBUaGlzIGFsbCBsb29rcyBnb29kIC0gSSBsZWZ0IGEgc21hbGwgY29tbWVudCBvbiBvbmUg
b2YgdGhlIHBhdGNoZXMNCj4gYW5kIEkgYWdyZWUgdGhhdCB0aGlzIG5lZWRzIHRlc3RpbmcuIEkg
YWxzbyB3b25kZXIgYWJvdXQNCj4gY29tcGF0aWJpbGl0eSB3aXRoIGVhcmxpZXIgT0NhbWwgcmVs
ZWFzZXMgdGhhdCB3ZSBzdXBwb3J0IGJ1dCBJIHNlZQ0KPiBubyByZWFsIG9ic3RhY2xlcy4NCj4g
DQoNCkkndmUgZGV2ZWxvcGVkIHRoZSBzZXJpZXMgdXNpbmcgT0NhbWwgNC4wOC4xLiBJIHRoaW5r
IHRoZSBuZXdlc3QNCmZlYXR1cmUgSSB1c2VkIHdhcyBNYXAudXBkYXRlIChPQ2FtbCA0LjA2LCBu
ZWFybHkgMyB5ZWFycyBhZ28pLg0KTG9va2luZyB0aHJvdWdoIGh0dHBzOi8vcmVwb2xvZ3kub3Jn
L3Byb2plY3Qvb2NhbWwvdmVyc2lvbnMgSSdtIG5vdA0Kc3VyZSBpZiB3ZSBjYW4gcmVxdWlyZSBt
b3JlIHRoYW4gNC4wNSB0aG91Z2guDQpUaGUgUkVBRE1FIGluIFhlbiBkb2Vzbid0IHNwZWNpZnkg
YSBtaW5pbXVtIHZlcnNpb24sIGJ1dCBjb25maWd1cmUNCmNoZWNrcyBmb3IgPj00LjAyLg0KDQpJ
IGNhbiB0cnkgdG8gYmFja3BvcnQgbXkgc2VyaWVzIHRvIE9DYW1sIDQuMDUgKHRvIHVzZSBNYXAu
ZmluZF9vcHQNCmluc3RlYWQgb2YgTWFwLnVwZGF0ZSkgYW5kIHVwZGF0ZSB0aGUgY29uZmlndXJl
IGNoZWNrIHRvIHJlcXVpcmUgNC4wNS4NCkl0IHdvdWxkIGJlIHBvc3NpYmxlIHRvIGJhY2twb3J0
IGV2ZW4gZnVydGhlciB0byA0LjAyIGJ5IGludHJvZHVjaW5nDQphZGRpdGlvbmFsIGluZWZmaWNp
ZW5jaWVzIChNYXAubWVtICsgTWFwLmZpbmQgd291bGQgdHJhdmVyc2UgdGhlIG1hcA0KdHdpY2Us
IGFuZCBNYXAuZmluZCBvbiBpdHMgb3duIHdvdWxkIHJhaXNlIGFuIGV4Y2VwdGlvbiBvbiBOb3Qg
Zm91bmQsDQp3aGljaCBpcyBtb3JlIGNvc3RseSB0aGFuIHJldHVybmluZyBOb25lIGluIE1hcC5m
aW5kX29wdCksIEknZCBhdm9pZA0KZG9pbmcgdGhhdC4NCg0KWGVuJ3MgQ0kgZnJvbSBhdXRvbWF0
aW9uIG1pZ2h0IG5lZWQgc29tZSB1cGRhdGVzIHRvIHVzZSBsYXRlc3Qgc3RhYmxlDQp2ZXJzaW9u
czoNCiogRmVkb3JhIDI5IGlzIEVPTCwgc2hvdWxkIHVzZSBhdCBsZWFzdCBGZWRvcmEgMzENCiog
RGViaWFuIEplc3NpZSBpcyBFT0wuIFN0cmV0Y2ggaXMgcHJlc2VudCwgYnV0IEJ1c3RlciBpcyBt
aXNzaW5nDQoNCkJlc3QgcmVnYXJkcywNCi0tRWR3aW4NCg==

