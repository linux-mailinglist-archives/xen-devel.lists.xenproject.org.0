Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D12AA9D36
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2019 10:39:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5nFy-0000kd-Ag; Thu, 05 Sep 2019 08:36:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=L9s7=XA=citrix.com=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1i5nFx-0000kX-Au
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2019 08:36:41 +0000
X-Inumbo-ID: 4811c3a6-cfb8-11e9-b299-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4811c3a6-cfb8-11e9-b299-bc764e2007e4;
 Thu, 05 Sep 2019 08:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567672600;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=k1l9lJ2mNrocg/ZLzZKoUd+h52fQHPC3YcQgRy9zlBg=;
 b=ZB79x2zGqz/eHUu+JMKr32n0MhliL8BpmaJYsdjMpjyEBnKuWxUNvY6G
 2RUCTvVnQ8MklRO9ZfaXDqeax9woqG3/z2+PQ6DFQ9lModsPruXbIcIBC
 9+UDvT5Ty8l0J3XZ1Esa3UhynHzqUDxkcoboEHkBQ5l+J1wmMEicov5uJ 4=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=lars.kurth@citrix.com;
 spf=Pass smtp.mailfrom=lars.kurth@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 lars.kurth@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 lars.kurth@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 1ZmNujqbeOYz3hjj/Yi1cUFqadYOgLG3MFiH4tLig5RDiUW3ugP0iN3IL/qkXZZYskY32pSwZ5
 nxOfU4XIO+AnYnfJ4ABl1bei+jvH16XsgsRZAl3FwgCDcR5FvHL0U9DDoR0CRIjogkiib2IXe8
 tTmc4MnlPx58nUABlp8xX+AXjvOeIzm3CzbGKBrfHqZwsGAp6VXNYEAEMvuGgnWLlDe+h3D4D7
 oBPDbF/euO568GEoSc6G53qgY8fDU8qkAUtJqVl2EO4XWB8GoGamb6Gicqz2pmNcN8Sxle2npv
 U3k=
X-SBRS: 2.7
X-MesageID: 5351524
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,470,1559534400"; 
   d="scan'208";a="5351524"
From: Lars Kurth <lars.kurth@citrix.com>
To: Juergen Gross <jgross@suse.com>, Andrew Cooper
 <Andrew.Cooper3@citrix.com>, Rich Persaud <persaur@gmail.com>, Jan Beulich
 <jbeulich@suse.com>
Thread-Topic: [Xen-devel] [ANNOUNCE] Call for agenda items for September 5th
 Community Call @ 15:00 UTC
Thread-Index: AQHVYynAq4l5UVCYY0OMdHHMFzgkkqccPIMAgABQNwCAAAYLAIAAExSA///2PACAAAU8AIAAEaWA
Date: Thu, 5 Sep 2019 08:36:35 +0000
Message-ID: <0E76424D-57EB-4792-BA82-121E69506314@citrix.com>
References: <6DA859DE-62FD-48C1-BBEE-C7A63D751B3E@citrix.com>
 <E8BC34C9-934A-4383-833B-B9AE6C9540A9@gmail.com>
 <b434d04f-d4e8-3b00-4efb-bf71c02e5075@suse.com>
 <11D8BF8A-BF9E-4610-8A80-8698B705AFAB@gmail.com>
 <FA118783-4079-460A-95F8-B628F3320637@citrix.com>
 <95800deb-8c7f-aaef-8ff2-8a4f87e6b5e6@citrix.com>
 <9ee33b16-9ae7-1f17-1755-c7d03c352a21@suse.com>
In-Reply-To: <9ee33b16-9ae7-1f17-1755-c7d03c352a21@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.10.d.190811
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <FCE6D44CF48F4B4C80EC4C079721BC7B@citrix.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] [ANNOUNCE] Call for agenda items for September 5th
 Community Call @ 15:00 UTC
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
Cc: "Daniel P.
 Smith" <dpsmith@apertussolutions.com>, Doug Goldstein <cardoe@cardoe.com>,
 Julien Grall <julien.grall@arm.com>,
 "anastassios.nanos@onapp.com" <anastassios.nanos@onapp.com>,
 Matt Spencer <Matt.Spencer@arm.com>,
 "edgar.iglesias@xilinx.com" <edgar.iglesias@xilinx.com>,
 John Ji <john.ji@intel.com>, "robin.randhawa@arm.com" <robin.randhawa@arm.com>,
 "daniel.kiper@oracle.com" <daniel.kiper@oracle.com>,
 "mirela.simonovic@aggios.com" <mirela.simonovic@aggios.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Rian Quinn <rianquinn@gmail.com>,
 Tamas KLengyel <tamas.k.lengyel@gmail.com>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 Paul Durrant <Paul.Durrant@citrix.com>, Ian Jackson <Ian.Jackson@citrix.com>,
 "vfachin@de.adit-jv.com" <vfachin@de.adit-jv.com>,
 "intel-xen@intel.com" <intel-xen@intel.com>,
 Jarvis Roach <Jarvis.Roach@dornerworks.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 Sergey Dyasli <sergey.dyasli@citrix.com>, BrianWoods <brian.woods@amd.com>,
 Jeff Kubascik <Jeff.Kubascik@dornerworks.com>,
 Janakarajan Natarajan <jnataraj@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Roger Pau
 Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCu+7v09uIDA1LzA5LzIwMTksIDA5OjMzLCAiSnVlcmdlbiBHcm9zcyIgPGpncm9zc0BzdXNl
LmNvbT4gd3JvdGU6DQoNCiAgICBPbiAwNS4wOS4xOSAxMDoxNCwgQW5kcmV3IENvb3BlciB3cm90
ZToNCiAgICA+IE9uIDA1LzA5LzIwMTkgMDg6NDksIExhcnMgS3VydGggd3JvdGU6DQogICAgPj4g
T24gMDUvMDkvMjAxOSwgMDg6NDEsICJSaWNoIFBlcnNhdWQiIDxwZXJzYXVyQGdtYWlsLmNvbT4g
d3JvdGU6DQogICAgPj4NCiAgICA+PiAgICAgID4gT24gU2VwIDUsIDIwMTksIGF0IDAzOjE5LCBK
YW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+IHdyb3RlOg0KICAgID4+ICAgICAgPg0KICAg
ID4+ICAgICAgPiBGb3JnaXZlIG1lIGFza2luZywgYnV0IHdoeSBpcyB0aGlzIHB1dCB1cCBhcyBh
biBhZ2VuZGEgaXRlbSBoZXJlPw0KICAgID4+ICAgICAgPiBJTU8gdGhpcyBpcyB0aGUga2luZCBv
ZiB0aGluZyB3aGVyZSB5b3Ugd291bGQgc2VuZCBhIHByb3Bvc2FsIGFuZA0KICAgID4+ICAgICAg
PiByZXF1ZXN0IGZlZWRiYWNrIGJ5IGVtYWlsIGZpcnN0LCBhbmQgcHV0IGl0IHVwIGFzIGFuIGFn
ZW5kYSBpdGVtDQogICAgPj4gICAgICA+IGhlcmUgb25seSBpZiBpdCBnb3Qgc3RhbGxlZCB0aGVy
ZS4gKEFwb2xvZ2llcyBpZiBJJ3ZlIG92ZXJsb29rZWQNCiAgICA+PiAgICAgID4gc3VjaCBhIHN0
YWxsZWQgdGhyZWFkLikNCiAgICA+PiAgICAgIA0KICAgID4+ICAgICAgSWYgWGVuIGNvbW11bml0
eSBjYWxsIHRvcGljcyBhcmUgbGltaXRlZCB0byBlc2NhbGF0aW9ucyBvZiB4ZW4tZGV2ZWwgdGhy
ZWFkcywgdGhlbiBhIG5ldyB0aHJlYWQgY2FuIGJlIGNyZWF0ZWQgZm9yIHRoaXMgdG9waWMuIFhl
biBjb21tdW5pdHkgY2FsbHMgaGF2ZSBhbHNvIHByb3ZpZGVkIHJlYWwtdGltZSwgaW50ZXJhY3Rp
dmUgZmVlZGJhY2sgb24gY2FuZGlkYXRlIHByb3Bvc2FscywgYWxvbmcgd2l0aCBndWlkYW5jZSBv
biBhcmVhcyB3aGljaCBuZWVkIGRvY3VtZW50YXRpb24gYmVmb3JlIGEgZm9ybWFsIHByb3Bvc2Fs
IGlzIG1hZGUgdG8geGVuLWRldmVsLiAgIFN1Y2ggYWdlbmRhIGl0ZW1zIGFyZSB0eXBpY2FsbHkg
Y292ZXJlZCBhZnRlciBhbGwgc2VyaWVzIGFuZCBwcmlvcml0eSB0b3BpY3MgaGF2ZSBiZWVuIGFk
ZHJlc3NlZC4NCiAgICA+PiAgICAgIA0KICAgID4+IEkgZG9uJ3QgbWluZCBoYXZpbmcgaXRlbXMg
c3VjaCB0aGVzZSBvbiB0aGUgYWdlbmRhIGFuZCB0byBiZSBmYWlyIGhhdmUgYWRkZWQgc2ltaWxh
ciBpdGVtcyBvbnRvIHRoZSBhZ2VuZGEgaW4gdGhlIHBhc3QuDQogICAgPj4gQ2xlYXJseSwgdGhl
eSBhcmUgZm9yd2FyZCBsb29raW5nIFtsaWtlIGFuIFJGQ10sIGZvciB3aGljaCByZWFzb24gSSB0
ZW5kIHRvIGFkZCB0aGVtIHRvIHRoZSBlbmQgb2YgYW4gYWdlbmRhIGlmIHRoZXJlIGlzIGEgYnVz
eSBzY2hlZHVsZQ0KICAgID4+DQogICAgPj4gUGVyc29uYWxseSwgb24gdGhpcyBzcGVjaWZpYyBp
dGVtLCBpdCBpcyBub3QgcmVhbGx5IGNsZWFyIHdoYXQgdGhlIHF1ZXN0aW9ucyBhcmUuICBJbiBv
dGhlciB3b3JkczogaXMgdGhpcyBhYm91dCBVVUlEUy9kb21haW4gaWRzIG9ubHksIG9yIGlzIHRo
ZXJlIHNvbWV0aGluZyBlbHNlLg0KICAgID4gDQogICAgPiBSZXF1aXJpbmcgc29tZXRoaW5nIHRv
IGJlIGJsb2NrZWQgb24geGVuLWRldmVsIGJlZm9yZSB3ZSBkaXNjdXNzIGl0IG9uDQogICAgPiB0
aGUgY2FsbCBpcyBtb251bWVudGFsbHkgc2hvcnQgc2lnaHRlZCwgYW5kIG9mZi1wdXR0aW5nIGZv
ciBjb250cmlidXRvcnMuDQogICAgPiANCiAgICA+IEluIHRoaXMgY2FzZSwgaXQgaXMgdmVyeSBk
ZWZpbml0ZWx5IG5vdCB0aGUgZmlyc3QgdGltZSB0aGlzIHByb2JsZW0gaGFzDQogICAgPiBiZWVu
IHJhaXNlZCwgYXMgaXQgaXMgYW4gWFNBIHNoYXBlZCBlbGVwaGFudCBpbiB0aGUgcm9vbS4gIEl0
cyBubyBzZWNyZXQNCiAgICA+IHRoYXQgaWQgd3JhcHMgY2F1c2UgcHJvYmxlbXMsIGFuZCB3aGls
ZSBvdXIgc2VjdXJpdHkgcG9saWN5IGRvZXNuJ3QNCiAgICA+IGNvbW1lbnQgb24gdGhlIG1hdHRl
ciwgaXQgYWxzbyBkb2Vzbid0IHNheSAid2FybmluZyAtIHN0dWZmICp3aWxsKiBicmVhaw0KICAg
ID4gaW4gd2VpcmQsIHdvbmRlcmZ1bCwgYW5kIHNlY3VyaXR5LXJlbGV2YW50IHdheXMgd2hlbiBk
b21pZCdzIHdyYXAiLg0KICAgID4gDQogICAgPiBUaGUgb3JkZXIgb2YgdGhlIGFnZW5kYSBpcyBp
bXBvcnRhbnQsIGFuZCBJIGRvbid0IHRoaW5rIHRoaXMgc2hvdWxkIGJlDQogICAgPiBhdCB0aGUg
dG9wLCBidXQgZXZlbiBpZiB3ZSBvbmx5IGVuZCB1cCB3aXRoIDIgbWludXRlcyB0byBkaXNjdXNz
IGl0LA0KICAgID4gdGhlbiBzbyBiZSBpdC4gICgyIG1pbnV0ZXMgb2YgdGFsa2luZyBjYW4gc3Rp
bGwgYmUgZmFyIG1vcmUgdmFsdWFibGUNCiAgICA+IHRoYW4gYSB3ZWVrcyB3b3J0aCBvZiBlbWFp
bGluZy4pDQogICAgPiANCiAgICA+IFdoYXQgaXMgbm90IGFjY2VwdGFibGUgaXMgc3VnZ2VzdGlu
ZyB0aGF0IGl0IHNob3VsZCBiZSB2ZXRvJ2Qgc2ltcGx5DQogICAgPiBiZWNhdXNlIGl0IGlzIHBl
cmNlaXZlZCB0byBiZSBhIHZlcnkgZnJlc2ggaWRlYS9xdWVyeS4NCiAgICANCiAgICBJIHN0aWxs
IHRoaW5rIGl0IHdvdWxkIGhlbHAgaWYgYSBzaG9ydCBoaWdoIGxldmVsIGRlc2lnbiB3b3VsZCBi
ZSBwb3N0ZWQNCiAgICBvbiB4ZW4tZGV2ZWwgZmlyc3QuDQogICAgDQpJIHRoaW5rIHRoYXQgaXMg
YSB2YWxpZCBwb2ludCBhbmQgSSBhZ3JlZS4gSW4gdGhlIHBhc3Qgd2hlbiB3ZSBoYWQgc2ltaWxh
cg0KZGlzY3Vzc2lvbnMgb2Z0ZW4gdGhlIG91dGNvbWUgd2FzIG5vdCB0aGF0IGNsZWFyIGFuZCBk
dWUgdG8gdGhlIG5hdHVyZSBvZg0KdGhlIGNhbGxzIHRoZSBkaXNjdXNzaW9ucyB3ZXJlIGFsc28g
bm90IHdlbGwgcmVmbGVjdGVkIGluIHRoZSBub3Rlcy4NCg0KU28sIHRoZXJlIGlzIGFuIGFyZ3Vt
ZW50LCB0aGF0IGRpc2N1c3Npb25zIHR5cGljYWxseSBhcmUgbW9yZSBwcm9kdWN0aXZlIHdoZW4N
CnRoZXJlIGlzIHRoZSBwb3NzaWJpbGl0eSBmb3Igc29tZSBwcmVwYXJhdGlvbiBvciBhbiBlLW1h
aWwgdGhyZWFkIHRvIHJlZmVyIHRvLg0KDQpMYXJzICAgDQogICAgDQoNCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
