Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39CAF11FE6E
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2019 07:21:38 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1igjgy-0002zY-H8; Mon, 16 Dec 2019 06:17:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CtFZ=2G=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1igjgx-0002zT-Ja
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2019 06:17:15 +0000
X-Inumbo-ID: b2a6a278-1fcb-11ea-b6f1-bc764e2007e4
Received: from mga09.intel.com (unknown [134.134.136.24])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b2a6a278-1fcb-11ea-b6f1-bc764e2007e4;
 Mon, 16 Dec 2019 06:17:13 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 Dec 2019 22:17:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,320,1571727600"; d="scan'208";a="364932199"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
 by orsmga004.jf.intel.com with ESMTP; 15 Dec 2019 22:17:11 -0800
Received: from fmsmsx111.amr.corp.intel.com (10.18.116.5) by
 FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Sun, 15 Dec 2019 22:17:10 -0800
Received: from shsmsx154.ccr.corp.intel.com (10.239.6.54) by
 fmsmsx111.amr.corp.intel.com (10.18.116.5) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Sun, 15 Dec 2019 22:17:10 -0800
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.90]) by
 SHSMSX154.ccr.corp.intel.com ([169.254.7.71]) with mapi id 14.03.0439.000;
 Mon, 16 Dec 2019 14:17:09 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jin Nan Wang <jnwang@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH] Xen missing prompt log when exec-sp=off
Thread-Index: AQHVs9RYvDJGD9d8eEizxnHO4Wu686e8RwQQ
Date: Mon, 16 Dec 2019 06:17:08 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19D642FF9@SHSMSX104.ccr.corp.intel.com>
References: <20191216054728.12845-1-jnwang@suse.com>
In-Reply-To: <20191216054728.12845-1-jnwang@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiYzA0ODdlNjktMWRkMC00M2I1LWFlMDEtMzU1YjY1YmZjODZjIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiVDMzVWFXYjNOUTFaODBNZzBLRU55cWo2a0RHZEpuUVhxMWNITENVU1p2WnVkRUhqOUZFYU1VdGtrZEp2OU9NYSJ9
dlp-product: dlpe-windows
dlp-version: 11.0.400.15
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] Xen missing prompt log when exec-sp=off
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>, "Nakajima, Jun" <jun.nakajima@intel.com>,
 =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBGcm9tOiBKaW4gTmFuIFdhbmcgPGpud2FuZ0BzdXNlLmNvbT4KPiBTZW50OiBNb25kYXksIERl
Y2VtYmVyIDE2LCAyMDE5IDE6NDggUE0KPiAKPiBGaXggYSBpc3N1ZSB3aGVuIHVzZXIgZGlzYWJs
ZSBFVFAgZXhlYy1zcCwgeGVuIG1pc3NlZCBhIHByb21wdAo+IGxvZyBpbiBkbWVzZy4KPiAKPiBT
aWduZWQtb2ZmLWJ5OiBKYW1lcyBXYW5nIDxqbndhbmdAc3VzZS5jb20+Cj4gLS0tCj4gIHhlbi9h
cmNoL3g4Ni9odm0vdm14L3ZteC5jIHwgNCArKystCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2Vy
dGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2h2
bS92bXgvdm14LmMgYi94ZW4vYXJjaC94ODYvaHZtL3ZteC92bXguYwo+IGluZGV4IDc5NzBiYTkz
ZTEuLjljMWYwZjY0NWQgMTAwNjQ0Cj4gLS0tIGEveGVuL2FyY2gveDg2L2h2bS92bXgvdm14LmMK
PiArKysgYi94ZW4vYXJjaC94ODYvaHZtL3ZteC92bXguYwo+IEBAIC0yNDk5LDcgKzI0OTksOSBA
QCBjb25zdCBzdHJ1Y3QgaHZtX2Z1bmN0aW9uX3RhYmxlICogX19pbml0Cj4gc3RhcnRfdm14KHZv
aWQpCj4gICAgICAgICAgewo+ICAgICAgICAgICAgICAvKiBEZWZhdWx0IHRvIG5vbi1leGVjdXRh
YmxlIHN1cGVycGFnZXMgb24gdnVsbmVyYWJsZSBoYXJkd2FyZS4gKi8KPiAgICAgICAgICAgICAg
b3B0X2VwdF9leGVjX3NwID0gIWNwdV9oYXNfYnVnX3BzY2hhbmdlX21jOwo+IC0KPiArICAgICAg
ICB9CgpubyBwYXJlbnRoZXNpcyB0aGVuLiBKdXN0IG1vdmUgdGhlIGNvbW1lbnQgYmVmb3JlIHRo
ZSBlYXJsaWVyIGNvbmRpdGlvbgpjaGVjawoKPiArICAgICAgICBpZiAob3B0X2VwdF9leGVjX3Nw
ID09IGZhbHNlKQo+ICsgICAgICAgIHsKPiAgICAgICAgICAgICAgaWYgKCBjcHVfaGFzX2J1Z19w
c2NoYW5nZV9tYyApCj4gICAgICAgICAgICAgICAgICBwcmludGsoIlZNWDogRGlzYWJsaW5nIGV4
ZWN1dGFibGUgRVBUIHN1cGVycGFnZXMgZHVlIHRvIENWRS0KPiAyMDE4LTEyMjA3XG4iKTsKPiAg
ICAgICAgICB9CgpDYW4gd2UgZG8gaXQgYW5vdGhlciB3YXk/IEFsd2F5cyB0aHJvdyBvdXQgYSB3
YXJuaW5nIGlmIHRoZSBoYXJkd2FyZQppcyB2dWxuZXJhYmxlLCBwbHVzIGl0cyBlbmFibGluZyBz
dGF0dXM/CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
