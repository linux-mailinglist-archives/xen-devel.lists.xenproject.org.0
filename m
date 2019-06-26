Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B823F56723
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2019 12:48:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hg5Qx-0000gb-3r; Wed, 26 Jun 2019 10:45:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=LltW=UZ=citrix.com=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1hg5Qv-0000gW-Pl
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2019 10:45:45 +0000
X-Inumbo-ID: 8a9c015a-97ff-11e9-857a-c3478f850b9f
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8a9c015a-97ff-11e9-857a-c3478f850b9f;
 Wed, 26 Jun 2019 10:45:41 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=lars.kurth@citrix.com;
 spf=Pass smtp.mailfrom=lars.kurth@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 lars.kurth@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 lars.kurth@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: I5ZWxBC01MGf87Sv0SBbQjaQ6UQZU7FAQDublfCm+rEGZtT/yZtTI8q5qSnxLtKgBKzPSdyX4o
 OC+6lr/JteFRbw1P9disDkEbo+LWNoAIqTpW4AZAbJEtKmiLOtY5M9r3SgoZQsi70qIbcoCh1L
 Vfg/O04IKVaET3luzcjY0XvoTiCcb7cU6JFY+uxHIGmir4AGRtJy0+EneZHV9PjbpZjqV/Ka5W
 RMAOUS8DJp+nL3P1SporGwjY4vVMCkX+swK2KddTt66FUFlAsaAP3aBPWFlSZDqRs0k+7mf8DO
 iKI=
X-SBRS: 2.7
X-MesageID: 2253458
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,419,1557201600"; 
   d="scan'208";a="2253458"
From: Lars Kurth <lars.kurth@citrix.com>
To: Rich Persaud <persaur@gmail.com>, Julien Grall <julien.grall@arm.com>
Thread-Topic: Xen Project Community Call June 27th (instead of July 4th):
 @15:00 UTC Call for agenda items
Thread-Index: AQHVKEhcH0vW8I5ySEO7jj3plK9Veaashu6AgAAiEYCAAAr+AIAAAsIAgAEAfoA=
Date: Wed, 26 Jun 2019 10:45:36 +0000
Message-ID: <D35E81B7-B96D-40A6-A112-B36D70CFEB4F@citrix.com>
References: <FEED378E-4D79-454E-8053-1B34DC0B1D9C@citrix.com>
 <EDC3EB96-942F-484F-9EDB-F30E01151816@citrix.com>
 <FDD05784-1F9E-4654-8E79-3D432C571D4C@gmail.com>
 <8eff1449-3e65-ed1c-6359-342a3df34d62@arm.com>
 <23191F9A-BDE0-4D9B-8F50-A87E9AA783FC@gmail.com>
In-Reply-To: <23191F9A-BDE0-4D9B-8F50-A87E9AA783FC@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.10.b.190609
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <6CF1A7DF4BB0F24780F0E54339334AE0@citrix.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] Xen Project Community Call June 27th (instead of
 July 4th): @15:00 UTC Call for agenda items
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
Cc: "davorin.mista@aggios.com" <davorin.mista@aggios.com>,
 "anastassios.nanos@onapp.com" <anastassios.nanos@onapp.com>,
 "mirela.simonovic@aggios.com" <mirela.simonovic@aggios.com>,
 "edgar.iglesias@xilinx.com" <edgar.iglesias@xilinx.com>, "Ji,
 John" <john.ji@intel.com>, "robin.randhawa@arm.com" <robin.randhawa@arm.com>,
 "daniel.kiper@oracle.com" <daniel.kiper@oracle.com>, Matt
 Spencer <Matt.Spencer@arm.com>, xen-devel <xen-devel@lists.xenproject.org>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 Tamas K Lengyel <tamas.k.lengyel@gmail.com>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 Paul Durrant <Paul.Durrant@citrix.com>,
 "committers@xenproject.org" <committers@xenproject.org>,
 "vfachin@de.adit-jv.com" <vfachin@de.adit-jv.com>,
 "intel-xen@intel.com" <intel-xen@intel.com>,
 Jarvis Roach <Jarvis.Roach@dornerworks.com>, Juergen Gross <jgross@suse.com>,
 Brian Woods <brian.woods@amd.com>, "Natarajan, 
 Janakarajan" <jnataraj@amd.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCu+7v09uIDI1LzA2LzIwMTksIDIxOjI3LCAiUmljaCBQZXJzYXVkIiA8cGVyc2F1ckBnbWFp
bC5jb20+IHdyb3RlOg0KDQogICAgPiBPbiBKdW4gMjUsIDIwMTksIGF0IDE2OjE3LCBKdWxpZW4g
R3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPiB3cm90ZToNCiAgICA+IA0KICAgID4gSGkgUmlj
aCwNCiAgICA+IA0KICAgID4gT24gNi8yNS8xOSA4OjM4IFBNLCBSaWNoIFBlcnNhdWQgd3JvdGU6
DQogICAgPj4+IE9uIEp1biAyNSwgMjAxOSwgYXQgMTI6MzYsIExhcnMgS3VydGggPGxhcnMua3Vy
dGhAY2l0cml4LmNvbT4gd3JvdGU6DQogICAgPj4+IA0KICAgID4+PiBIaSBhbGw6DQogICAgPj4+
IHBsZWFzZSBhZGQgeW91ciBhZ2VuZGEgaXRlbXMuIEkgaGFkIG9ubHkgT05FIHNlcmllcyB3aGlj
aCB3YXMgaGlnaGxpZ2h0ZWQgYXMgbmVlZGluZyBhdHRlbnRpb24gZnJvbSBvdGhlcnMuIElzIHRo
aXMgc2VyaW91c2x5IHRoZSBvbmx5IG9uZT8NCg0KV2UgaGFkIHF1aXRlIGEgZmV3IGFkZGl0aW9u
cyB0byB0aGUgYWdlbmRhLiBPbmUgcHJvYmxlbSBJIGhhdmUgaXMgdGhhdCBjcnlwdHBhZCBoaXN0
b3J5IGRvZXMgbm90IHRlbGwgbWUgd2hvIGFkZGVkIGFuIGFnZW5kYSBpdGVtLiBXZSB3aWxsIGhh
dmUgdG8gbWFuYWdlIHRoaXMgYXBwcm9wcmlhdGVseSBpbiB0aGUgbWVldGluZy4NCg0KICAgID4+
IFByb3Bvc2VkIGFnZW5kYSBpdGVtOiBpbiB0aGUgYWJzZW5jZSBvZiBKaXJhIHRpY2tldHMsIHdv
dWxkIGl0IGJlIHVzZWZ1bCB0byBoYXZlIGEgbGlzdCAoZS5nLiBnZW5lcmF0ZWQgYnkgYSBzY3Jp
cHQpIHdpdGggdGhlIGxpZmVjeWNsZSBzdGF0dXMgb2YgYWxsIG91dHN0YW5kaW5nIHBhdGNoIHNl
cmllcywgZS5nLg0KICAgID4+IE1FVEFEQVRBDQogICAgPj4gLSBidWcgZml4IC8gaW1wcm92ZW1l
bnQgLyByZWZhY3RvciAvIGNsZWFudXAgLyBuZXcgZmVhdHVyZQ0KICAgID4+IC0gaW1wYWN0ZWQg
WGVuIHN1YnN5c3RlbXMvY29tcG9uZW50cy9mZWF0dXJlcw0KICAgID4+IC0gdGFyZ2V0ZWQgdmVy
c2lvbiBvZiBYZW4NCiAgICA+PiAtIGNvbnRyaWJ1dGluZyBwZXJzb24vb3JnDQogICAgPj4gLSBy
ZWxldmFuY2Ugb2YgcGF0Y2ggc2VyaWVzIHRvIHRoZSBnb2FscyBzZXQgYnkgUk0gZm9yIHRoZSBu
ZXh0IFhlbiByZWxlYXNlDQogICAgPj4gLSByZWxhdGVkIHBhdGNoIHNlcmllcyAod2l0aCBiZWxv
dyBzdGF0dXMgaW5mbykNCiAgICA+PiBTVEFUVVM6DQogICAgPj4gLSBwYXRjaCBzZXJpZXMgdmVy
c2lvbg0KICAgID4+IC0gZGF0ZSBvZiBwYXRjaCBzZXJpZXMgdjENCiAgICA+PiAtIG5vIHJlc3Bv
bnNlcyByZWNlaXZlZCArIHBpbmcgY291bnQgKyBkYXlzIHNpbmNlIHN1Ym1pc3Npb24gKyBkYXlz
IHNpbmNlIHBpbmcNCiAgICA+PiAtIHJldmlld2VkIHdpdGggb2JqZWN0aW9ucw0KICAgID4+IC0g
cmV2aWV3ZWQgd2l0aG91dCBvYmplY3Rpb25zLCBhd2FpdGluZyBhY2sNCiAgICA+PiAtIGFja2Vk
LCBhd2FpdGluZyBtZXJnZQ0KICAgID4+IEZyb20gc3VjaCBhIHN1bW1hcnksIHBhdGNoIHNlcmll
cyBjb3VsZCBiZSBwcmlvcml0aXplZCBmb3IgcmV2aWV3L3RyaWFnZSBpbiB0aGUgY29tbXVuaXR5
IGNhbGwsIGJhc2VkIG9uIHVuaWZvcm0gY3JpdGVyaWEgYW5kIHByb2plY3Qtd2lkZSBjb250ZXh0
Lg0KICAgID4gDQogICAgPiBXaGlsZSBJIHRoaW5rIHJhaXNpbmcgYXdhcmVuZXNzIG9mIHRoZSBz
dHVjayBzZXJpZXMgaXMgYSBnb29kIGlkZWEuIEkgc3RpbGwgaGF2ZSBzb21lIGNvbmNlcm4gcmVn
YXJkaW5nIHRoZSBwcmlvcml0aXphdGlvbi4gV2hvIGlzIGdvaW5nIHRvIGNvbnN1bWUgdGhlIHJl
c3VsdCBvZiB0aGUgZGlzY3Vzc2lvbj8gSXMgaXQgdGhlIG1haW50YWluZXJzPw0KICAgIA0KICAg
IEFueW9uZSB3aG8gdHlwaWNhbGx5IGFuc3dlcnMgdGhlIHF1ZXN0aW9uIHJhaXNlZCBieSBMYXJz
IGluIHRoaXMgdGhyZWFkLCBwcmVzdW1hYmx5IGEgc3Vic2V0IG9mIGNhbGwgYXR0ZW5kZWVzLg0K
ICAgIA0KVGhpcyB3b3VsZCBvbmx5IHdvcmsgaWYgdGhlcmUgd2FzIGNvbnNlbnN1cyBvbiB0aGUg
cHJpb3JpdHkgYW1vbmdzdCB0aGUga2V5IHN0YWtlLWhvbGRlcnMuIEkgYmVsaWV2ZSB0aGF0IHNv
bWUgbGltaXRlZCBwcmlvcml0aXphdGlvbiBoYXMgaGFwcGVuZWQgaW4gdGhlIHBhc3QsIGUuZy4g
Zm9yIHNvbWUgQXJtIHJlbGF0ZWQgZmVhdHVyZXMgZm9yIFhlbiA0LjEyIHdoZXJlLCBpZiBJIHJl
Y2FsbCBjb3JyZWN0bHkgeW91LCBTdGVmYW5vIGFuZCBFUEFNIGRpZCB0aGlzLiANCg0KTWF5YmUg
d2UgY2FuIHRyaWFsIHRoaXMgdHlwZSBvZiBhcHByb2FjaCBmb3IgYSBzbWFsbCBudW1iZXIgb2Yg
c2VyaWVzIGZpcnN0LiBBdCB0aGUgZW5kIG9mIHRoZSBkYXkgdGhpcyBpcyBhYm91dCBxdWV1ZSBt
YW5hZ2VtZW50LiBSaWdodCBub3csIHdoZW4gYSBuZXcgc2VyaWVzIGNvbWVzIGluIGl0IGVuZHMg
dXAgaW4gb25lIGJpZyBxdWV1ZSAoeGVuLWRldmVsQCkuIE1vc3QgY29tcGxleCBzZXJpZXMgaGF2
ZSB0byBnbyB0aHJvdWdoIGEgc2VyaWVzIG9mIGdhdGVzIChha2EgY29kZSByZXZpZXdzIGZyb20g
ZGlmZmVyZW50IHBlb3BsZSkgYmVmb3JlIHRoZXkgZ2V0IGFwcGxpZWQgYW5kIHdoZW4gYSBuZXcg
dmVyc2lvbiBjb21lcyBvdXQgdGhlIHNlcmllcyBlbmRzIHVwIGluIHRoZSBxdWV1ZSBhZ2Fpbjog
ZWFjaCByZXZpZXdlciB0b2RheSBwcmlvcml0aXplcyB0aGVpciBvd24gcmV2aWV3IHF1ZXVlcywg
d2hlcmUgbm8tb25lIGVsc2Ugc2VlcyB0aGUgcHJpb3JpdGlzYXRpb24gb2Ygb3RoZXIgcmV2aWV3
ZXJzLiBVbmxlc3MgdGhlcmUgaXMgbG90IG9mIHNwYXJlIHJldmlldyBjYXBhY2l0eSAod2hpY2gg
dGhlcmUgaXNuJ3QpIHdlIGVzc2VudGlhbGx5IGVuZCB1cCBpbiBncmlkLWxvY2ssIHdpdGggYW4g
ZXZlci1ncm93aW5nIHF1ZXVlLiBXZSBzZWVtIHRvIGhhdmUgc3BlY2lmaWMgYWRkaXRpb25hbCBj
b21wbGV4aXR5IGluIFhlbiBiZWNhdXNlIG1vc3QgcmVjZW50IHNlcmllcywgdHlwaWNhbGx5IGlu
dm9sdmUgYSBsYXJnZSBudW1iZXIgb2YgcmV2aWV3ZXJzLg0KDQpJbiB0aGVvcnksIHRoZXJlIGFy
ZSBzZXZlcmFsIHdheXMgdG8gYWRkcmVzcyB0aGlzOg0KKiBRdWV1ZSBtYW5hZ2VtZW50IGVpdGhl
ciBieSBhIHNldCBvZiBhZ3JlZWQgY3JpdGVyaWEgd2hpY2ggYWxsIHJldmlld2VycyBmb2xsb3cg
b3IgdGhyb3VnaCBzb21lIGFncmVlbWVudCBhYm91dCB3aGljaCBzZXJpZXMgd2UgYWN0aXZlbHkg
dHJ5IGFuZCBzaGVwaGVyZCB0aHJvdWdoIHRoZSBnYXRlcw0KKiBXZSBoYXZlIGFuIGFkZGl0aW9u
YWwgaXNzdWUgdGhhdCBpbiBtYW55IGFyZWFzIHdlIGhhdmUgbXVsdGlwbGUgcmV2aWV3ZXJzL2Nv
bW1pdHRlcnMgcmV2aWV3aW5nIHRoZSBzYW1lIGFyZWEgb2YgY29kZSwgd2hpY2ggYWxzbyBmcmVx
dWVudGx5IGxlYWRzIHRvIHNsb3ctZG93bnMsIGJlY2F1c2UgdGhlIG11bHRpcGxlIHJldmlld2Vy
cy9jb21taXR0ZXJzIGNhbiBkaXNhZ3JlZS4gV2UgY291bGQgbG9vayBhdCBhIG1vZGVsIHdoZXJl
IHRoZSByZXZpZXdlcnMvY29tbWl0dGVycyBhZ3JlZSB0aGF0IG9uZSB0YWtlcyB0aGUgbGVhZCBv
biByZXZpZXdpbmcgYSBzcGVjaWZpYyBzZXJpZXMuIFdlIGNvdWxkIHRyeSBhbmQgc3RyZWFtbGlu
ZSB0aGUgb3duZXJzaGlwIHN0cnVjdHVyZSB0byBjcmVhdGUgYSBjbGVhcmVyIG1hcHBpbmcuDQoq
IFRoZSBxdWV1ZXMgb2YgZWFjaCByZXZpZXdlciBhcmUgc29tZWhvdyBtYWRlIHB1YmxpYyAoYXNz
dW1pbmcgdGhpcyBpcyBwb3NzaWJsZSkgYW5kIHdlIGhvcGUgdGhhdCB0aGUgc3lzdGVtIHNlbGYt
cmVndWxhdGVzLiBOb3Qgc3VyZSB0aGlzIHdpbGwgYWN0dWFsbHkgd29yaw0KDQpUaGUgYmlnIHBy
b2JsZW0gSSBoYXZlIGlzIHRoYXQgbWFpbGluZyBsaXN0cyByZWFsbHkgZG9uJ3QgbGVuZCB0aGVt
c2VsdmVzIHdlbGwgdG8gaGlnaGxpZ2h0IHdoYXQgaXMgZ29pbmcgb24uIFdlIGhhdmUgYmVlbiBn
cmFwcGxpbmcgd2l0aCB0aGlzIGZvciB5ZWFycyBhbmQgdGhpbmdzIGFyZSBnZXR0aW5nIHdvcnNl
LCBub3QgYmV0dGVyLg0KDQpJbiBwYXN0IGNvbW11bml0eSBjYWxscyB3aGVuIHdlIHRyaWVkIHRv
IGRvIHRoaXMgd2l0aCBzcGVjaWZpYyBzZXJpZXMsIGluIHByYWN0aWNlIHdlIGVuZGVkIHVwIGRp
c2NvdmVyaW5nIG9ic3RhY2xlcyB0aGF0IHdlcmUgY29uY2VybmluZyBhIHNwZWNpZmljIHNlcmll
cywgc3VjaCBhcyB1bmV4cG9zZWQgZGVwZW5kZW5jaWVzLCBsYWNrIG9mIEhXLCBzcGVjcyBhZ2Fp
bnN0IHdoaWNoIHRvIHJldmlldyBiZWluZyB0b28gY29tcGxleCwgLi4uDQoNCkluIGFueSBjYXNl
LCBnaXZlbiB0aGF0IHF1aXRlIGEgZmV3IHNlcmllcyB3ZXJlIGFkZGVkIHRvIHRoZSBhZ2VuZGEs
IG1heWJlIHdlIHNob3VsZG4ndCB0YWxrIGFib3V0IHByb2Nlc3MgaW4gdGhlIG1lZXRpbmcsIGJ1
dCBzZWUgd2hldGhlciB3ZSBjYW4gdW5ibG9jayB0aG9zZSBzZXJpZXMuIEkgYW0gZ29pbmcgdG8g
YW5ub3RhdGUgc29tZSBvZiB0aGUgYWdlbmRhIGl0ZW1zIHRvIGhpZ2hsaWdodCBXSE8gbmVlZHMg
dG8gdGFrZSBhY3Rpb24gb24gaXRlbXMgYWRkZWQNCg0KV2UgY291bGQgaGF2ZSBhIHdpZGVyIGRp
c2N1c3Npb24gYWJvdXQgdGhlIHByb2Nlc3MgYXQgdGhlIHN1bW1pdCwgYXMgZXZlcnlvbmUgd2hv
IHdvdWxkIG5lZWQgdG8gYmUgaW52b2x2ZWQgaXMgYXQgdGhlIHN1bW1pdC4gDQoNClJlZ2FyZHMN
CkxhcnMNCg0KDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
