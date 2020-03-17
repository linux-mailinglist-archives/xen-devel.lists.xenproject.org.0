Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68BFB187991
	for <lists+xen-devel@lfdr.de>; Tue, 17 Mar 2020 07:23:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jE5bP-0005Hl-JW; Tue, 17 Mar 2020 06:21:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=T/Et=5C=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1jE5bO-0005Hf-4Y
 for xen-devel@lists.xenproject.org; Tue, 17 Mar 2020 06:21:22 +0000
X-Inumbo-ID: 84767326-6817-11ea-b8cf-12813bfff9fa
Received: from mga11.intel.com (unknown [192.55.52.93])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 84767326-6817-11ea-b8cf-12813bfff9fa;
 Tue, 17 Mar 2020 06:21:21 +0000 (UTC)
IronPort-SDR: peubvnw+CHfN6WhQ1SgvCJIfzi0Qdf0VdVVznV2g/8+tkbK2yhoMz1yIu3aiFLNq39mHQABIE8
 2/U7RpUFr++w==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2020 23:21:20 -0700
IronPort-SDR: y1BsOTN2SX7QOanIwGeE3YrNWEtWbwlTEv3kmMkrODvIN82UT5FaJdmANsTSdTKR6n8YNEj1nY
 0DikphrqvpCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,563,1574150400"; d="scan'208";a="390957627"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
 by orsmga004.jf.intel.com with ESMTP; 16 Mar 2020 23:21:19 -0700
Received: from fmsmsx115.amr.corp.intel.com (10.18.116.19) by
 FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 16 Mar 2020 23:20:38 -0700
Received: from shsmsx102.ccr.corp.intel.com (10.239.4.154) by
 fmsmsx115.amr.corp.intel.com (10.18.116.19) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 16 Mar 2020 23:20:38 -0700
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.206]) by
 shsmsx102.ccr.corp.intel.com ([169.254.2.50]) with mapi id 14.03.0439.000;
 Tue, 17 Mar 2020 14:20:36 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: "paul@xen.org" <paul@xen.org>, 'Jan Beulich' <jbeulich@suse.com>
Thread-Topic: [PATCH v3] IOMMU: make DMA containment of quarantined devices
 optional
Thread-Index: AQHV9gMvA8DkILGx5UOf5iWNvNKXRqhBS9AQ///QHgCABLZlcP//2TwAgAAVKoCABpircA==
Date: Tue, 17 Mar 2020 06:20:35 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19D7D5E43@SHSMSX104.ccr.corp.intel.com>
References: <83253657-b3b4-a045-b829-f8f4c4aeae28@suse.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D7C5DEC@SHSMSX104.ccr.corp.intel.com>
 <12464780-0ce3-0331-9f78-b026025607fb@suse.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D7CDA43@SHSMSX104.ccr.corp.intel.com>
 <56483550-a9a0-a214-14d6-9a43a4eece6c@suse.com>
 <009e01d5f919$6e389c00$4aa9d400$@xen.org>
In-Reply-To: <009e01d5f919$6e389c00$4aa9d400$@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v3] IOMMU: make DMA containment of
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBGcm9tOiBQYXVsIER1cnJhbnQgPHhhZGltZ25pa0BnbWFpbC5jb20+DQo+IFNlbnQ6IEZyaWRh
eSwgTWFyY2ggMTMsIDIwMjAgNToyNiBQTQ0KPiANCj4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2Ut
LS0tLQ0KPiA+IEZyb206IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gPiBTZW50
OiAxMyBNYXJjaCAyMDIwIDA4OjEwDQo+ID4gVG86IFRpYW4sIEtldmluIDxrZXZpbi50aWFuQGlu
dGVsLmNvbT4NCj4gPiBDYzogeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOyBBbmRyZXcg
Q29vcGVyDQo+IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPjsgUGF1bCBEdXJyYW50DQo+ID4g
PHBhdWxAeGVuLm9yZz4NCj4gPiBTdWJqZWN0OiBSZTogW1BBVENIIHYzXSBJT01NVTogbWFrZSBE
TUEgY29udGFpbm1lbnQgb2YgcXVhcmFudGluZWQNCj4gZGV2aWNlcyBvcHRpb25hbA0KPiA+DQo+
ID4gT24gMTMuMDMuMjAyMCAwNDowNSwgVGlhbiwgS2V2aW4gd3JvdGU6DQo+ID4gPj4gRnJvbTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiA+ID4+IFNlbnQ6IFR1ZXNkYXksIE1h
cmNoIDEwLCAyMDIwIDY6MzEgUE0NCj4gPiA+Pg0KPiA+ID4+IE9uIDEwLjAzLjIwMjAgMDY6MzAs
IFRpYW4sIEtldmluIHdyb3RlOg0KPiA+ID4+Pj4gRnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNo
QHN1c2UuY29tPg0KPiA+ID4+Pj4gU2VudDogTW9uZGF5LCBNYXJjaCA5LCAyMDIwIDc6MDkgUE0N
Cj4gPiA+Pj4+DQo+ID4gPj4+PiBDb250YWluaW5nIHN0aWxsIGluIGZsaWdodCBETUEgd2FzIGlu
dHJvZHVjZWQgdG8gd29yayBhcm91bmQgY2VydGFpbg0KPiA+ID4+Pj4gZGV2aWNlcyAvIHN5c3Rl
bXMgaGFuZ2luZyBoYXJkIHVwb24gaGl0dGluZyBhICJub3QtcHJlc2VudCIgSU9NTVUNCj4gZmF1
bHQuDQo+ID4gPj4+PiBQYXNzaW5nIHRocm91Z2ggKHN1Y2gpIGRldmljZXMgKG9uIHN1Y2ggc3lz
dGVtcykgaXMgaW5oZXJlbnRseQ0KPiBpbnNlY3VyZQ0KPiA+ID4+Pj4gKGFzIGd1ZXN0cyBjb3Vs
ZCBlYXNpbHkgYXJyYW5nZSBmb3IgSU9NTVUgZmF1bHRzIG9mIGFueSBraW5kIHRvIG9jY3VyKS4N
Cj4gPiA+Pj4+IERlZmF1bHRpbmcgdG8gYSBtb2RlIHdoZXJlIGFkbWlucyBtYXkgbm90IGV2ZW4g
YmVjb21lIGF3YXJlIG9mDQo+ID4gPj4gaXNzdWVzDQo+ID4gPj4+PiB3aXRoIGRldmljZXMgY2Fu
IGJlIGNvbnNpZGVyZWQgdW5kZXNpcmFibGUuIFRoZXJlZm9yZSBjb252ZXJ0IHRoaXMNCj4gbW9k
ZQ0KPiA+ID4+Pj4gb2Ygb3BlcmF0aW9uIHRvIGFuIG9wdGlvbmFsIG9uZSwgbm90IG9uZSBlbmFi
bGVkIGJ5IGRlZmF1bHQuDQo+ID4gPj4+DQo+ID4gPj4+IEhlcmUgaXMgYW5vdGhlciB0aG91Z2h0
LiBUaGUgd2hvbGUgcG9pbnQgb2YgcXVhcmFudGluZSBpcyB0byBjb250YWluDQo+ID4gPj4+IHRo
ZSBkZXZpY2UgYWZ0ZXIgaXQgaXMgZGVhc3NpZ25lZCBmcm9tIHVudHJ1c3RlZCBndWVzdC4NCj4g
PiA+Pg0KPiA+ID4+IEknZCBxdWVzdGlvbiB0aGUgInVudHJ1c3RlZCIgaGVyZS4gQXNzaWduaW5n
IGRldmljZXMgdG8gdW50cnVzdGVkDQo+ID4gPj4gZ3Vlc3RzIGlzIHByb2JsZW1hdGljIGFueXdh
eSwgdW5sZXNzIHlvdSdyZSB0aGUgZGV2aWNlIG1hbnVmYWN0dXJlcg0KPiA+ID4+IGFuZCBkZXZp
Y2UgZmlybXdhcmUgd3JpdGVyLCBhbmQgaGVuY2UgeW91IGNhbiBndWFyYW50ZWUgdGhlIGRldmlj
ZQ0KPiA+ID4+IHRvIG5vdCBvZmZlciBhbnkgYmFja2Rvb3JzIG9yIGFsaWtlLiBUaGVyZWZvcmUg
SSB2aWV3IHF1YXJhbnRpbmluZw0KPiA+ID4NCj4gPiA+IEFyZW4ndCBhbGwgZ3Vlc3RzIHVudHJ1
c3RlZCBmcm9tIGh5cGVydmlzb3IgcC5vLnYsIHdoaWNoIGlzIHRoZSByZWFzb24NCj4gPiA+IHdo
eSBJT01NVSB3YXMgaW50cm9kdWNlZCBpbiB0aGUgZmlyc3QgcGxhY2U/DQo+ID4NCj4gPiAiVW50
cnVzdGVkIiBpcyBhbHdheXMgbWVhbnQgZnJvbSB0aGUgcGVyc3BlY3RpdmUgb2YgdGhlIGhvc3Qg
YWRtaW4uDQo+ID4NCj4gPiA+IEkgbWF5IG92ZXJsb29rIHRoZSBoaXN0b3J5IG9mIHF1YXJhbnRp
bmUgZmVhdHVyZS4gQmFzZWQgb24gbXkgc3R1ZHkNCj4gPiA+IG9mIHF1YXJhbnRpbmUgcmVsYXRl
ZCBjaGFuZ2VzLCBsb29rcyBpbml0aWFsbHkgUGF1bCBwb2ludGVkIG91dCBzdWNoDQo+ID4gPiBw
cm9ibGVtIHRoYXQgYSBkZXZpY2UgbWF5IGhhdmUgaW4tZmx5IERNQXMgdG8gdG91Y2ggZG9tMCBt
ZW1vcnkNCj4gPiA+IGFmdGVyIGl0IGlzIGRlYXNzaWduZWQuIFRoZW4gaGUgaW50cm9kdWNlZCB0
aGUgcXVhcmFudGluZSBjb25jZXB0IGJ5DQo+ID4gPiBwdXR0aW5nIGEgcXVhcmFudGluZWQgZGV2
aWNlIGludG8gZG9tX2lvIHcvbyBhbnkgdmFsaWQgbWFwcGluZywNCj4gPiA+IHdpdGggYSB3aGl0
ZWxpc3QgYXBwcm9hY2guIFlvdSBsYXRlciBleHRlbmRlZCBhcyBhIGRlZmF1bHQgYmVoYXZpb3IN
Cj4gPiA+IGZvciBhbGwgUENJIGRldmljZXMuIE5vdyBQYXVsIGZvdW5kIHNvbWUgZGV2aWNlIHdo
aWNoIGNhbm5vdCB0b2xlcmF0ZQ0KPiA+ID4gcmVhZC1mYXVsdCBhbmQgdGhlbiBjYW1lIHVwIHRo
aXMgc2NyYXRjaC1wYWdlIGlkZWEuDQo+ID4gPg0KPiA+ID4gTm93IEkgd29uZGVyIHdoeSB3ZSBh
cmUgZG9pbmcgc3VjaCBleHBsaWNpdCBxdWFyYW50aW5lIGluIHRoZSBmaXJzdA0KPiA+ID4gcGxh
Y2UuIFNob3VsZG4ndCB3ZSBhbHdheXMgc2VlayByZXNldHRpbmcgdGhlIGRldmljZSB3aGVuIGl0
IGlzIGRlYXNzaWduZWQNCj4gPiA+IGZyb20gYSBndWVzdD8gJ3Jlc2V0JyBzaG91bGQgY2FuY2Vs
L3F1aWVzY2VudCBhbGwgaW4tZmx5IERNQXMgZm9yIG1vc3QNCj4gPiA+IGRldmljZXMgaWYgdGhl
eSBpbXBsZW1lbnQgJ3Jlc2V0JyBjb3JyZWN0bHkuDQo+ID4NCj4gPiBBbmQgdGhlIGltcG9ydGFu
dCB3b3JkIGhlcmUgaXMgInNob3VsZCIuIFBhdWwgYW5kIGNvbGxlYWd1ZXMgZm91bmQNCj4gPiBp
dCBtYXkgbm90IGRvIHNvIGluIHJlYWxpdHkuDQo+IA0KPiBZZWFoLi4uIHdlIGhhdmUgdG8gbGl2
ZSB3aXRoIHdoYXQgd2UndmUgZ290LiBZZXMsIGl0J3MgYnVnZ3kgYXMgaGVsbCBidXQgd2UNCj4g
aGF2ZSB0byBkbyBvdXIgYmVzdCB0byBzdG9wIGl0IHdlZGdpbmcgaG9zdHMgd2hpbHN0IHRyeWlu
ZyB0byBwcmV2ZW50DQo+IHNjcmliYmxpbmcgb3ZlciBjcml0aWNhbCBwYXJ0cyBvZiBtZW1vcnku
DQoNCidzaG91bGQnIGlzIGFwcGxpZWQgdG8gbW9zdCBkZXZpY2VzIHdobyBjYW4gZ3JhY2VmdWxs
eSBoYW5kbGUgdGhlIHJlc2V0DQpyZXF1ZXN0LCBhbmQgdGhlbiBmb3IgZXhjZXB0aW9uIHdlIGNv
bWUgd2l0aCBhZC1ob2MgYmFuZC1haWQuDQoNCj4gDQo+ID4NCj4gPiA+IElmIGRvaW5nIHRoYXQg
d2F5LCB3ZSBkb24ndA0KPiA+ID4gbmVlZCBhIHF1YXJhbnRpbmUgb3B0aW9uIGF0IGFsbCwgYW5k
IHRoZW4gdGhlIGJvZ3VzIGRldmljZSBpbiBQYXVsJ3MNCj4gPiA+IGxhdGVzdCBmaW5kaW5nIGNv
dWxkIGJlIGhhbmRsZWQgYnkgYSBzdGFuZGFsb25lIG9wdGlvbiB3L28gc3RydWdnbGluZw0KPiA+
ID4gd2hldGhlciAnZnVsbCcgaXMgYSByaWdodCBuYW1lIHZzLiAnYmFzaWMnLiBvciB3ZSBtYXkg
aW50cm9kdWNlIGEgcmVzZXQNCj4gPiA+IGZsYWcgd2hlbiBhc3NpZ25pbmcgc3VjaCBkZXZpY2Ug
dG8gaW5kaWNhdGUgc3VjaCBzcGVjaWFsIHJlcXVpcmVtZW50LA0KPiA+ID4gc28gYSBzY3JhdGNo
IHBhZ2UvZG9tX2lvIGNhbiBiZSBsaW5rZWQgc3BlY2lmaWNhbGx5IGZvciBzdWNoIGRldmljZQ0K
PiA+ID4gcG9zdCByZXNldCwgYXNzdW1pbmcgaXQgaXMgbm90IGEgcGxhdGZvcm0tbGV2ZWwgYnVn
IGZyb20gUGF1bCdzIHJlc3BvbnNlPw0KPiA+DQo+ID4gV2hpY2ggd291bGQgaW1wbHkgaG9zdCBh
ZG1pbnMgdG8ga25vdyBzdWNoIHByb3BlcnRpZXMgb2YgdGhlaXINCj4gPiBkZXZpY2VzLCBhbmQg
YmV0dGVyIF93aXRob3V0XyBmaXJzdCBoYXZpbmcgcnVuIGludG8gcHJvYmxlbXMuDQo+ID4NCj4g
DQo+IEl0IGlzIGEgZGV2aWNlLWxldmVsIGJ1Zy4gV2UgY291bGQsIEkgZ3Vlc3MsIGhhdmUgYSBw
ZXItZGV2aWNlIHF1aXJrIHRvIHNheQ0KPiB3aGV0aGVyIGl0IHNob3VsZCBnZXQgYSBjb250ZXh0
IGVudHJ5IHBvaW50aW5nIGF0IGEgc2NyYXRjaCBwYWdlIG9yIG5vdC4NCj4gDQoNCklmIGFsbCBl
eGNlcHQgbWUgdGhpbmsgc3VwcG9ydGluZyBzdWNoIGRldmljZSBpbiB1cHN0cmVhbSBpcyBuZWNl
c3NhcnksIA0KcGVyLWRldmljZSBxdWlyayBhdCBsZWFzdCBzb3VuZHMgYmV0dGVyIHRvIG1lIHRo
YW4gZW5mb3JjaW5nIGEgZ2xvYmFsIA0KcXVhcmFudGluZSBwb2xpY3kgZm9yIGFsbCBkZXZpY2Vz
Lg0KDQpUaGFua3MNCktldmluDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
