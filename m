Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E3A141B35
	for <lists+xen-devel@lfdr.de>; Sun, 19 Jan 2020 03:39:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1it0S9-000453-2D; Sun, 19 Jan 2020 02:36:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nxl7=3I=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1it0S7-00044y-Ah
 for xen-devel@lists.xenproject.org; Sun, 19 Jan 2020 02:36:39 +0000
X-Inumbo-ID: 8346c824-3a64-11ea-b833-bc764e2007e4
Received: from mga14.intel.com (unknown [192.55.52.115])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8346c824-3a64-11ea-b833-bc764e2007e4;
 Sun, 19 Jan 2020 02:36:36 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Jan 2020 18:36:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,336,1574150400"; d="scan'208";a="274726514"
Received: from fmsmsx104.amr.corp.intel.com ([10.18.124.202])
 by FMSMGA003.fm.intel.com with ESMTP; 18 Jan 2020 18:36:35 -0800
Received: from fmsmsx113.amr.corp.intel.com (10.18.116.7) by
 fmsmsx104.amr.corp.intel.com (10.18.124.202) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Sat, 18 Jan 2020 18:36:35 -0800
Received: from shsmsx101.ccr.corp.intel.com (10.239.4.153) by
 FMSMSX113.amr.corp.intel.com (10.18.116.7) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Sat, 18 Jan 2020 18:36:34 -0800
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.197]) by
 SHSMSX101.ccr.corp.intel.com ([169.254.1.30]) with mapi id 14.03.0439.000;
 Sun, 19 Jan 2020 10:36:32 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, "osstest
 service owner" <osstest-admin@xenproject.org>
Thread-Topic: [Xen-devel] [xen-unstable test] 145393: regressions - FAIL
Thread-Index: AQHVv07Lv5KRKAb2lEy8onddLf3el6fT2amAgB2G2ZA=
Date: Sun, 19 Jan 2020 02:36:32 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19D739A5A@SHSMSX104.ccr.corp.intel.com>
References: <osstest-145393-mainreport@xen.org>
 <20191231152925.GK11756@Air-de-Roger>
In-Reply-To: <20191231152925.GK11756@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiMjlmODkwMjAtZDIwZS00ODAxLTljNzctYzZjZGRkMjhhZmFhIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiUmxUS3BGc2xcLzhlT1wvQVwvR1FXSzF3MmJwZk9oOUFIemU2TTNxZUdxV1NiZjlTWURkdk8xYjMwY1c4V3dWRGtyZyJ9
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: Re: [Xen-devel] [xen-unstable test] 145393: regressions - FAIL
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "Nakajima, Jun" <jun.nakajima@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBGcm9tOiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPiBTZW50OiBU
dWVzZGF5LCBEZWNlbWJlciAzMSwgMjAxOSAxMTozMCBQTQo+IAo+IE9uIE1vbiwgRGVjIDMwLCAy
MDE5IGF0IDA4OjE5OjIzUE0gKzAwMDAsIG9zc3Rlc3Qgc2VydmljZSBvd25lciB3cm90ZToKPiA+
IGZsaWdodCAxNDUzOTMgeGVuLXVuc3RhYmxlIHJlYWwgW3JlYWxdCj4gPiBodHRwOi8vbG9ncy50
ZXN0LWxhYi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MvMTQ1MzkzLwo+ID4KPiA+IFJlZ3Jl
c3Npb25zIDotKAo+ID4KPiA+IFRlc3RzIHdoaWNoIGRpZCBub3Qgc3VjY2VlZCBhbmQgYXJlIGJs
b2NraW5nLAo+ID4gaW5jbHVkaW5nIHRlc3RzIHdoaWNoIGNvdWxkIG5vdCBiZSBydW46Cj4gPiAg
dGVzdC1hbWQ2NC1hbWQ2NC1xZW11dS1uZXN0ZWQtaW50ZWwgMTcgZGViaWFuLWh2bS1pbnN0YWxs
L2wxL2wyIGZhaWwKPiBSRUdSLiB2cy4gMTQ1MDI1Cj4gCj4gV2hpbGUgZGE5MjkwNjM5ZWI1ZDZh
YyBkaWQgZml4IHRoZSB2bWxhdW5jaCBlcnJvciwgbm93IHRoZSBMMSBndWVzdAo+IHNlZW1zIHRv
IGxvb3NlIGludGVycnVwdHM6Cj4gCj4gWyAgNDEyLjEyNzA3OF0gTkVUREVWIFdBVENIRE9HOiBl
dGgwIChlMTAwMCk6IHRyYW5zbWl0IHF1ZXVlIDAgdGltZWQKPiBvdXQKPiBbICA0MTIuMTUxODM3
XSAtLS0tLS0tLS0tLS1bIGN1dCBoZXJlIF0tLS0tLS0tLS0tLS0KPiBbICA0MTIuMTY0MjgxXSBX
QVJOSU5HOiBDUFU6IDAgUElEOiAwIGF0IG5ldC9zY2hlZC9zY2hfZ2VuZXJpYy5jOjMyMAo+IGRl
dl93YXRjaGRvZysweDI1Mi8weDI2MAo+IFsgIDQxMi4xODU4MjFdIE1vZHVsZXMgbGlua2VkIGlu
OiB4ZW5fZ250YWxsb2MgZXh0NCBtYmNhY2hlIGpiZDIgZTEwMDAKPiBzeW01M2M4eHgKPiBbICA0
MTIuMjA0Mzk5XSBDUFU6IDAgUElEOiAwIENvbW06IHN3YXBwZXIvMCBOb3QgdGFpbnRlZCA0LjE0
LjE1MCsgIzEKPiBbICA0MTIuMjIzOTg4XSBIYXJkd2FyZSBuYW1lOiBYZW4gSFZNIGRvbVUsIEJJ
T1MgNC4xNC11bnN0YWJsZQo+IDEyLzMwLzIwMTkKPiBbICA0MTIuMjQxNjU3XSB0YXNrOiBmZmZm
ZmZmZjgyMjEzNDgwIHRhc2suc3RhY2s6IGZmZmZmZmZmODIyMDAwMDAKPiBbICA0MTIuMjU2OTc5
XSBSSVA6IGUwMzA6ZGV2X3dhdGNoZG9nKzB4MjUyLzB4MjYwCj4gWyAgNDEyLjI2ODQ0NF0gUlNQ
OiBlMDJiOmZmZmY4ODgwMWZjMDNlOTAgRUZMQUdTOiAwMDAxMDI4Ngo+IFsgIDQxMi4yODE3Mjdd
IFJBWDogMDAwMDAwMDAwMDAwMDAzOSBSQlg6IDAwMDAwMDAwMDAwMDAwMDAgUkNYOgo+IDAwMDAw
MDAwMDAwMDAwMDAKPiBbICA0MTIuMzAwMDk3XSBSRFg6IGZmZmY4ODgwMWZjMWRlNzAgUlNJOiBm
ZmZmODg4MDFmYzE2Mjk4IFJESToKPiBmZmZmODg4MDFmYzE2Mjk4Cj4gWyAgNDEyLjMxODI4M10g
UkJQOiBmZmZmODg4MDA2YzZlNDFjIFIwODogMDAwMDAwMDAwMDAxZjA2NiBSMDk6Cj4gMDAwMDAw
MDAwMDAwMDIzYgo+IFsgIDQxMi4zMzY1NDBdIFIxMDogZmZmZjg4ODAxZmMxYTNmMCBSMTE6IGZm
ZmZmZmZmODI4N2Q5NmQgUjEyOgo+IGZmZmY4ODgwMDZjNmUwMDAKPiBbICA0MTIuMzU0NjQzXSBS
MTM6IDAwMDAwMDAwMDAwMDAwMDAgUjE0OiBmZmZmODg4MDA2ZTNhYzgwIFIxNToKPiAwMDAwMDAw
MDAwMDAwMDAxCj4gWyAgNDEyLjM3MzAzNF0gRlM6ICAwMDAwN2ZhMDUyOTNlY2MwKDAwMDApIEdT
OmZmZmY4ODgwMWZjMDAwMDAoMDAwMCkKPiBrbmxHUzowMDAwMDAwMDAwMDAwMDAwCj4gWyAgNDEy
LjM5MzM2N10gQ1M6ICBlMDMzIERTOiAwMDAwIEVTOiAwMDAwIENSMDogMDAwMDAwMDA4MDA1MDAz
Mwo+IFsgIDQxMi40MDgxMTJdIENSMjogMDAwMDdmZDgwZmYxNjAwMCBDUjM6IDAwMDAwMDAwMGNl
NzgwMDAgQ1I0Ogo+IDAwMDAwMDAwMDAwNDA2NjAKPiBbICA0MTIuNDI2MzM4XSBDYWxsIFRyYWNl
Ogo+IFsgIDQxMi40MzI3NDddICA8SVJRPgo+IFsgIDQxMi40MzgxMDJdICA/IGRldl9kZWFjdGl2
YXRlX3F1ZXVlLmNvbnN0cHJvcC4zMysweDUwLzB4NTAKPiBbICA0MTIuNDUxODk2XSAgY2FsbF90
aW1lcl9mbisweDJiLzB4MTMwCj4gWyAgNDEyLjQ2NDIwOF0gIHJ1bl90aW1lcl9zb2Z0aXJxKzB4
M2Q4LzB4NGIwCj4gWyAgNDEyLjQ3NDU5OF0gID8gaGFuZGxlX2lycV9ldmVudF9wZXJjcHUrMHgz
Yy8weDUwCj4gWyAgNDEyLjQ4NjQyNl0gIF9fZG9fc29mdGlycSsweDExNi8weDJjZQo+IFsgIDQx
Mi40OTU4ODNdICBpcnFfZXhpdCsweGNkLzB4ZTAKPiBbICA0MTIuNTAzOTk5XSAgeGVuX2V2dGNo
bl9kb191cGNhbGwrMHgyNy8weDQwCj4gWyAgNDEyLjUxNDYyNl0gIHhlbl9kb19oeXBlcnZpc29y
X2NhbGxiYWNrKzB4MjkvMHg0MAo+IFsgIDQxMi41MjY2ODRdICA8L0lSUT4KPiBbICA0MTIuNTMy
MjUyXSBSSVA6IGUwMzA6eGVuX2h5cGVyY2FsbF9zY2hlZF9vcCsweGEvMHgyMAo+IFsgIDQxMi41
NDUwMzRdIFJTUDogZTAyYjpmZmZmZmZmZjgyMjAzZWEwIEVGTEFHUzogMDAwMDAyNDYKPiBbICA0
MTIuNTU4MzQ3XSBSQVg6IDAwMDAwMDAwMDAwMDAwMDAgUkJYOiBmZmZmZmZmZjgyMjEzNDgwIFJD
WDoKPiBmZmZmZmZmZjgxMDAxM2FhCj4gWyAgNDEyLjU3NjM5MF0gUkRYOiBmZmZmZmZmZjgyMjQ4
M2U4IFJTSTogZGVhZGJlZWZkZWFkZjAwZCBSREk6Cj4gZGVhZGJlZWZkZWFkZjAwZAo+IFsgIDQx
Mi41OTQ1ODBdIFJCUDogMDAwMDAwMDAwMDAwMDAwMCBSMDg6IGZmZmZmZmZmZmZmZmZmZmYgUjA5
Ogo+IDAwMDAwMDAwMDAwMDAwMDAKPiBbICA0MTIuNjEyODMxXSBSMTA6IGZmZmZmZmZmODIyMDNl
MzAgUjExOiAwMDAwMDAwMDAwMDAwMjQ2IFIxMjoKPiBmZmZmZmZmZjgyMjEzNDgwCj4gWyAgNDEy
LjYzMDk4MF0gUjEzOiAwMDAwMDAwMDAwMDAwMDAwIFIxNDogZmZmZmZmZmY4MjIxMzQ4MCBSMTU6
Cj4gZmZmZmZmZmY4MjIzOGU4MAo+IFsgIDQxMi42NDkxMzhdICA/IHhlbl9oeXBlcmNhbGxfc2No
ZWRfb3ArMHhhLzB4MjAKPiBbICA0MTIuNjYwNjcxXSAgPyB4ZW5fc2FmZV9oYWx0KzB4Yy8weDIw
Cj4gWyAgNDEyLjY3MDE3N10gID8gZGVmYXVsdF9pZGxlKzB4MjMvMHgxMTAKPiBbICA0MTIuNjc5
ODYyXSAgPyBkb19pZGxlKzB4MTY4LzB4MWYwCj4gWyAgNDEyLjY4ODY2Nl0gID8gY3B1X3N0YXJ0
dXBfZW50cnkrMHgxNC8weDIwCj4gWyAgNDEyLjY5OTA1OV0gID8gc3RhcnRfa2VybmVsKzB4NGMz
LzB4NGNiCj4gWyAgNDEyLjcwODgwN10gID8geGVuX3N0YXJ0X2tlcm5lbCsweDUyNy8weDUzMAo+
IFsgIDQxMi43MjA3NzZdIENvZGU6IGNiIGU5IGEwIGZlIGZmIGZmIDBmIDBiIDRjIDg5IGU3IGM2
IDA1IDAwIGQ2IGM2IDAwIDAxIGU4IDgyCj4gODkgZmQgZmYgODkgZDkgNDggODkgYzIgNGMgODkg
ZTYgNDggYzcgYzcgMzAgZmIgMDEgODIgZTggNDQgZTkgYTYgZmYgPDBmPiAwYiBlOQo+IDU4IGZl
IGZmIGZmIDBmIDFmIDgwIDAwIDAwIDAwIDAwIDQxIDU3IDQxIDU2IDQxIDU1IDQxCj4gWyAgNDEy
Ljc2NzkwMF0gLS0tWyBlbmQgdHJhY2UgZDllMzVjM2Y3MjVmNGI1NyBdLS0tCj4gWyAgNDEyLjc4
MDE5M10gZTEwMDAgMDAwMDowMDowNS4wIGV0aDA6IFJlc2V0IGFkYXB0ZXIKPiAKPiBUaGlzIG9u
bHkgaGFwcGVucyB3aGVuIEwxIGlzIHVzaW5nIHgyQVBJQyBhbmQgYSBndWVzdCBoYXMgYmVlbgo+
IGxhdW5jaGVkIChieSBMMSkuIFByaW9yIHRvIGxhdW5jaGluZyBhbnkgZ3Vlc3QgTDEgc2VlbXMg
dG8gYmUgZnVsbHkKPiBmdW5jdGlvbmFsLiBJJ20gY3VycmVudGx5IHRyeWluZyB0byBmaWd1cmUg
b3V0IGhvdy93aGVuIHRoYXQgaW50ZXJydXB0Cj4gaXMgbG9zdCwgd2hpY2ggSSBiZXQgaXQncyBy
ZWxhdGVkIHRvIHRoZSBtZXJnaW5nIG9mIHZtY3MgYmV0d2VlbiBMMQo+IGFuZCBMMiBkb25lIGlu
IEwwLgo+IAo+IEFzIGEgd29ya2Fyb3VuZCBJIGNvdWxkIGRpc2FibGUgZXhwb3NpbmcgeDJBUElD
IGluIENQVUlEIHdoZW4gbmVzdGVkCj4gdmlydHVhbGl6YXRpb24gaXMgZW5hYmxlZCBvbiBJbnRl
bC4KPiAKCmFueSBwcm9ncmVzcyBvbiB0aGlzIHByb2JsZW0/IFBsZWFzZSBsZXQgbWUga25vdyBp
ZiBJIG92ZXJsb29rZWQgYSBtb3JlCnJlY2VudCBtYWlsLiBwb3NzaWJseSBpdCdzIHVzZWZ1bCB0
byBmdWxseSBjb21wYXJlIHRoZSBBUElDdiByZWxhdGVkIHNldHRpbmcKaW4gdm1jczAyIGFuZCB2
bWNzMTIuIEFsdGVybmF0aXZlbHksIHlvdSBtYXkgZGlzYWJsZSBhbGwgQVBJQ3YgZmVhdHVyZXMK
dG8gc2VlIHdoZXRoZXIgQVBJQ3YgaXMgdGhlIG1haW4gcmVhc29uLgoKVGhhbmtzCktldmluCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
