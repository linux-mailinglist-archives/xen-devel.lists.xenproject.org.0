Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A55BB11FE57
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2019 07:03:58 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1igjRx-00023b-5g; Mon, 16 Dec 2019 06:01:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CtFZ=2G=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1igjRv-00023W-MF
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2019 06:01:43 +0000
X-Inumbo-ID: 882c817c-1fc9-11ea-9356-12813bfff9fa
Received: from mga09.intel.com (unknown [134.134.136.24])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 882c817c-1fc9-11ea-9356-12813bfff9fa;
 Mon, 16 Dec 2019 06:01:42 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 Dec 2019 22:01:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,320,1571727600"; d="scan'208";a="246908128"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
 by fmsmga002.fm.intel.com with ESMTP; 15 Dec 2019 22:01:41 -0800
Received: from fmsmsx101.amr.corp.intel.com (10.18.124.199) by
 FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Sun, 15 Dec 2019 22:01:41 -0800
Received: from shsmsx103.ccr.corp.intel.com (10.239.4.69) by
 fmsmsx101.amr.corp.intel.com (10.18.124.199) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Sun, 15 Dec 2019 22:01:41 -0800
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.90]) by
 SHSMSX103.ccr.corp.intel.com ([169.254.4.29]) with mapi id 14.03.0439.000;
 Mon, 16 Dec 2019 14:01:39 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Jan Beulich
 <jbeulich@suse.com>
Thread-Topic: [PATCH v2] IOMMU: make DMA containment of quarantined devices
 optional
Thread-Index: AQHVsbRLjoLF7aH0ZUm8KKdzBiHCg6e3lTwAgASzhQA=
Date: Mon, 16 Dec 2019 06:01:39 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19D642F82@SHSMSX104.ccr.corp.intel.com>
References: <be16ddaa-ae99-f696-53c0-6a680ffa8504@suse.com>
 <20191213141240.GH11756@Air-de-Roger>
In-Reply-To: <20191213141240.GH11756@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiNDQyZjU2ZDItNTc1YS00NjE1LTk5MDktODdjZmI1YzZiZWJjIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoidmd6ZjRxd1wvcElMTlh4VzF3Wkk0aURSRStjU3hIc0l0Y2RqYit0TGJhM3VSQ2hJSkZic2tvc2tNZlhGVHdLODIifQ==
dlp-product: dlpe-windows
dlp-version: 11.0.400.15
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2] IOMMU: make DMA containment of
 quarantined devices optional
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
Cc: Juergen Gross <jgross@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Ian Jackson <ian.jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBGcm9tOiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCj4gU2VudDog
RnJpZGF5LCBEZWNlbWJlciAxMywgMjAxOSAxMDoxMyBQTQ0KPiANCj4gT24gRnJpLCBEZWMgMTMs
IDIwMTkgYXQgMDE6NTM6MjlQTSArMDEwMCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+ID4gQ29udGFp
bmluZyBzdGlsbCBpbiBmbGlnaHQgRE1BIHdhcyBpbnRyb2R1Y2VkIHRvIHdvcmsgYXJvdW5kIGNl
cnRhaW4NCj4gPiBkZXZpY2VzIC8gc3lzdGVtcyBoYW5naW5nIGhhcmQgdXBvbiBoaXR0aW5nIGFu
IElPTU1VIGZhdWx0LiBQYXNzaW5nDQo+ID4gdGhyb3VnaCAoc3VjaCkgZGV2aWNlcyAob24gc3Vj
aCBzeXN0ZW1zKSBpcyBpbmhlcmVudGx5IGluc2VjdXJlIChhcw0KPiA+IGd1ZXN0cyBjb3VsZCBl
YXNpbHkgYXJyYW5nZSBmb3IgSU9NTVUgZmF1bHRzIHRvIG9jY3VyKS4gRGVmYXVsdGluZyB0bw0K
PiA+IGEgbW9kZSB3aGVyZSBhZG1pbnMgbWF5IG5vdCBldmVuIGJlY29tZSBhd2FyZSBvZiBpc3N1
ZXMgd2l0aCBkZXZpY2VzDQo+IGNhbg0KPiA+IGJlIGNvbnNpZGVyZWQgdW5kZXNpcmFibGUuIFRo
ZXJlZm9yZSBjb252ZXJ0IHRoaXMgbW9kZSBvZiBvcGVyYXRpb24gdG8NCj4gPiBhbiBvcHRpb25h
bCBvbmUsIG5vdCBvbmUgZW5hYmxlZCBieSBkZWZhdWx0Lg0KPiA+DQo+ID4gVGhpcyBpbnZvbHZl
cyByZXN1cnJlY3RpbmcgY29kZSBjb21taXQgZWEzODg2NzgzMWRhICgieDg2IC8gaW9tbXU6IHNl
dA0KPiA+IHVwIGEgc2NyYXRjaCBwYWdlIGluIHRoZSBxdWFyYW50aW5lIGRvbWFpbiIpIGRpZCBy
ZW1vdmUsIGluIGEgc2xpZ2h0bHkNCj4gPiBleHRlbmRlZCBhbmQgYWJzdHJhY3RlZCBmYXNoaW9u
LiBIZXJlLCBpbnN0ZWFkIG9mIHJlaW50cm9kdWNpbmcgYSBwcmV0dHkNCj4gPiBwb2ludGxlc3Mg
dXNlIG9mICJnb3RvIiBpbiBkb21haW5fY29udGV4dF91bm1hcCgpLCBhbmQgaW5zdGVhZCBvZiBt
YWtpbmcNCj4gPiB0aGUgZnVuY3Rpb24gKGF0IGxlYXN0IHRlbXBvcmFyaWx5KSBpbmNvbnNpc3Rl
bnQsIHRha2UgdGhlIG9wcG9ydHVuaXR5DQo+ID4gYW5kIHJlcGxhY2UgdGhlIG90aGVyIHNpbWls
YXJseSBwb2ludGxlc3MgImdvdG8iIGFzIHdlbGwuDQo+ID4NCj4gPiBJbiBvcmRlciB0byBrZXkg
dGhlIHJlLWluc3RhdGVkIGJ5cGFzc2VzIG9mZiBvZiB0aGVyZSAobm90KSBiZWluZyBhIHJvb3QN
Cj4gPiBwYWdlIHRhYmxlIHRoaXMgZnVydGhlciByZXF1aXJlcyBtb3ZpbmcgdGhlIGFsbG9jYXRl
X2RvbWFpbl9yZXNvdXJjZXMoKQ0KPiA+IGludm9jYXRpb24gZnJvbSByZWFzc2lnbl9kZXZpY2Uo
KSB0byBhbWRfaW9tbXVfc2V0dXBfZG9tYWluX2RldmljZSgpDQo+IChvcg0KPiA+IGVsc2UgcmVh
c3NpZ25fZGV2aWNlKCkgd291bGQgYWxsb2NhdGUgYSByb290IHBhZ2UgdGFibGUgYW55d2F5KTsg
dGhpcyBpcw0KPiA+IGJlbmlnbiB0byB0aGUgc2Vjb25kIGNhbGxlciBvZiB0aGUgbGF0dGVyIGZ1
bmN0aW9uLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1
c2UuY29tPg0KPiANCj4gUmV2aWV3ZWQtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBj
aXRyaXguY29tPg0KPiANCj4gSSdtIGhvd2V2ZXIgbm90IHN1cmUgaWYgdGhlIGRlZmF1bHQgcXVh
cmFudGluZSBtb2RlIHNob3VsZCBiZSB0aGUNCj4gYmFzaWMgb3IgdGhlIGZ1bGwgb25lLg0KPiAN
Cj4gQXQgdGhlIGVuZCBvZiBkYXkgdGhlIGZ1bGwgb25lIGRvZXMgcHJldmVudCBoYXJkIGhhbmdz
IG9uIHNwZWNpZmljDQo+IHN5c3RlbXMsIGJ1dCBhIGd1ZXN0IHdpdGggYSBkZXZpY2UgYmVoaW5k
IHN1Y2ggYm9ndXMgSU9NTVUgY2FuDQo+IHRyaXZpYWxseSB0cmlnZ2VyIHRob3NlIGFueXdheS4N
Cg0KSXQncyBhIGJvZ3VzIGRldmljZSBiZWhpbmQgYSBnb29kIElPTU1VLiBJZiBJT01NVSBpcyBi
b2d1cywgd2UNCnNob3VsZCBub3QgcGFzcyB0aHJvdWdoIGRldmljZXMgYmVoaW5kIGl0LiDwn5iK
DQoNCj4gDQo+ID4gLS0tDQo+ID4gQXMgZmFyIGFzIDQuMTMgaXMgY29uY2VybmVkLCBJIGd1ZXNz
IGlmIHdlIGNhbid0IGNvbWUgdG8gYW4gYWdyZWVtZW50DQo+ID4gaGVyZSwgdGhlIG9ubHkgb3Ro
ZXIgb3B0aW9uIGlzIHRvIHJldmVydCBlYTM4ODY3ODMxZGEgZnJvbSB0aGUgYnJhbmNoLA0KPiA+
IGZvciBoYXZpbmcgYmVlbiBjb21taXR0ZWQgcHJlbWF0dXJlbHkgKEknbSBub3Qgc28gbXVjaCB3
b3JyaWVkIGFib3V0DQo+IHRoZQ0KPiA+IG1hc3RlciBicmFuY2gsIHdoZXJlIHdlIGhhdmUgYW1w
bGUgdGltZSB1bnRpbCA0LjE0KS4gV2hhdCBJIHN1cmVseSB3YW50DQo+ID4gdG8gc2VlIHVzIGF2
b2lkIGlzIGEgYmFjayBhbmQgZm9ydGggaW4gYmVoYXZpb3Igb2YgcmVsZWFzZWQgdmVyc2lvbnMu
DQo+ID4gKE5vdGUgdGhhdCA0LjEyLjIgaXMgc2ltaWxhcmx5IGJsb2NrZWQgb24gYSBkZWNpc2lv
biBlaXRoZXIgd2F5IGhlcmUuKQ0KPiA+DQo+ID4gSSdtIGhhcHB5IHRvIHRha2UgYmV0dGVyIHN1
Z2dlc3Rpb25zIHRvIHJlcGxhY2UgImZ1bGwiLg0KPiANCj4gSSB3YXMgZ29pbmcgdG8gY29tbWVu
dCBvbiB2MSwgYnV0IEkgcmVhbGx5IGhhdmUgbm8gYmV0dGVyIGFsdGVybmF0aXZlLg0KPiANCj4g
PiAtLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9pb21tdS5jDQo+ID4gKysrIGIveGVuL2Ry
aXZlcnMvcGFzc3Rocm91Z2gvaW9tbXUuYw0KPiA+IEBAIC0zMCwxMyArMzAsMTcgQEAgYm9vbF90
IF9faW5pdGRhdGEgaW9tbXVfZW5hYmxlID0gMTsNCj4gPiAgYm9vbF90IF9fcmVhZF9tb3N0bHkg
aW9tbXVfZW5hYmxlZDsNCj4gPiAgYm9vbF90IF9fcmVhZF9tb3N0bHkgZm9yY2VfaW9tbXU7DQo+
ID4gIGJvb2xfdCBfX3JlYWRfbW9zdGx5IGlvbW11X3ZlcmJvc2U7DQo+ID4gLWJvb2wgX19yZWFk
X21vc3RseSBpb21tdV9xdWFyYW50aW5lID0gdHJ1ZTsNCj4gPiAgYm9vbF90IF9fcmVhZF9tb3N0
bHkgaW9tbXVfaWdmeCA9IDE7DQo+ID4gIGJvb2xfdCBfX3JlYWRfbW9zdGx5IGlvbW11X3Nub29w
ID0gMTsNCj4gPiAgYm9vbF90IF9fcmVhZF9tb3N0bHkgaW9tbXVfcWludmFsID0gMTsNCj4gPiAg
Ym9vbF90IF9fcmVhZF9tb3N0bHkgaW9tbXVfaW50cmVtYXAgPSAxOw0KPiA+ICBib29sX3QgX19y
ZWFkX21vc3RseSBpb21tdV9jcmFzaF9kaXNhYmxlOw0KPiA+DQo+ID4gKyNkZWZpbmUgSU9NTVVf
cXVhcmFudGluZV9ub25lICAwDQo+ID4gKyNkZWZpbmUgSU9NTVVfcXVhcmFudGluZV9iYXNpYyAx
DQo+ID4gKyNkZWZpbmUgSU9NTVVfcXVhcmFudGluZV9mdWxsICAyDQo+ID4gK3VpbnQ4X3QgX19y
ZWFkX21vc3RseSBpb21tdV9xdWFyYW50aW5lID0gSU9NTVVfcXVhcmFudGluZV9iYXNpYzsNCj4g
DQo+IEkgd29uZGVyIHdoZXRoZXIgdGhlIGRlZmF1bHQgc2hvdWxkIGJlIHRvIHVzZSB0aGUgc2lu
ayBwYWdlLiBOb3QgdXNpbmcNCj4gaXQgY2FuIGxlYWQgdG8gYSBoYXJkIGhhbmcgb24gY2VydGFp
biBoYXJkd2FyZSBhY2NvcmRpbmcgdG8gdGhlDQo+IGRlc2NyaXB0aW9uLiBPVE9IIGlmIHN1Y2gg
ZGV2aWNlcyBhcmUgYWN0dWFsbHkgcGFzc2VkIHRocm91Z2gsIHRoZQ0KPiBndWVzdCBpdHNlbGYg
Y2FuIHRyaWdnZXIgc3VjaCBwYWdlIGZhdWx0cyBhbmQgaGVuY2UgZnJlZXplIHRoZSBzeXN0ZW0u
DQo+IA0KPiBUaGFua3MsIFJvZ2VyLg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
