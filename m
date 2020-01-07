Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B971213269F
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jan 2020 13:41:58 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ioo92-0000CJ-25; Tue, 07 Jan 2020 12:39:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8bLS=24=citrix.com=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1ioo90-0000CC-HF
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2020 12:39:34 +0000
X-Inumbo-ID: c11525f6-314a-11ea-abf4-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c11525f6-314a-11ea-abf4-12813bfff9fa;
 Tue, 07 Jan 2020 12:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578400772;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=YWtLsJUw06w8NJilCqo/1aaZAiZ16ojf4H2z+gj5gsU=;
 b=GV+uVkj2dy7AeZrq+6CpyXacrIW0n02+qR1JaD3EHYGQkVocBEXr3YtU
 EmVcYbSmOY7jhJQONxm3Ox4QGqean2mJ17hy2B0qmBKfCc3JlqYzDeSCb
 bAHcrqzqDqrKumDynJ8ZGVcFMlKXON+1a+sbFWlWlY9FbolU2ArCUPrcz 8=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: tqcyK+1GT31X8MWSc+pG64HEeMGJLlcEfEEAtOBmJ4N1fKxmJIoblhLcXWVYgLFEVR/qmbG7Ua
 5hCBBCPC/1TQz6qqzEvUbB174ggFAjZW6ElkG05+yEVyXbkWXaX2i393aCqWaDgbNmTpi96+Z9
 TNJxx2lyuw/Q4rBlhZ2hM6Imun4qEWEuwwawJIP3ZFbpMccRV0yZqTxn/+XwYULMuHfx7MkbuG
 gjAwNSmHlMnVHzTX+T/bjq8pYHc6DV1sJK3Wq17MXKbPfoNUSPtNo6thQ2RDVeQh9CEKmVPGNl
 76I=
X-SBRS: 2.7
X-MesageID: 10970939
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,406,1571716800"; d="scan'208";a="10970939"
From: Lars Kurth <lars.kurth@citrix.com>
To: "Durrant, Paul" <pdurrant@amazon.co.uk>, Andrew Cooper
 <Andrew.Cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] Community Call: Call for Agenda Items and call
 details for Jan 9, 16:00 - 17:00 UTC
Thread-Index: AQHVxMtZ1OgMwMP+3E6j25NQq/tXUKfeR7SAgACFcYCAAEd+AA==
Date: Tue, 7 Jan 2020 12:39:27 +0000
Message-ID: <6D5427AF-D465-43E4-88D8-351F10E513A6@citrix.com>
References: <4545D260-7F67-42DC-A33E-2F466011ED20@citrix.com>
 <89173194-efd5-61fb-d3f5-dd1011579c91@citrix.com>
 <3403b9d5b51845aea20aba2ca76fde6e@EX13D32EUC003.ant.amazon.com>
In-Reply-To: <3403b9d5b51845aea20aba2ca76fde6e@EX13D32EUC003.ant.amazon.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.10.11.191208
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <C8621348CCDE1D4B9FEAD372AE19B86D@citrix.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] Community Call: Call for Agenda Items and call
 details for Jan 9, 16:00 - 17:00 UTC
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
Cc: Amit Shah <amit@infradead.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Doug Goldstein <cardoe@cardoe.com>, Brian
 Woods <brian.woods@xilinx.com>, Rich Persaud <persaur@gmail.com>,
 "anastassios.nanos@onapp.com" <anastassios.nanos@onapp.com>,
 Matt Spencer <Matt.Spencer@arm.com>,
 Kevin Pearson <kevin.pearson@ortmanconsulting.com>,
 "edgar.iglesias@xilinx.com" <edgar.iglesias@xilinx.com>, "Natarajan,
 Janakarajan" <jnataraj@amd.com>,
 "robin.randhawa@arm.com" <robin.randhawa@arm.com>,
 "daniel.kiper@oracle.com" <daniel.kiper@oracle.com>,
 "mirela.simonovic@aggios.com" <mirela.simonovic@aggios.com>,
 Robert Townley <rob.townley@gmail.com>, Rian Quinn <rianquinn@gmail.com>,
 Varad Gautam <varadgautam@gmail.com>, Juergen
 Gross <jgross@suse.com>, Tamas K Lengyel <tamas.k.lengyel@gmail.com>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 George Dunlap <George.Dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Ian Jackson <Ian.Jackson@citrix.com>,
 "vfachin@de.adit-jv.com" <vfachin@de.adit-jv.com>,
 "lambert.olivier@gmail.com" <lambert.olivier@gmail.com>,
 "intel-xen@intel.com" <intel-xen@intel.com>,
 Jarvis Roach <Jarvis.Roach@dornerworks.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 Sergey Dyasli <sergey.dyasli@citrix.com>, Julien
 Grall <julien.grall@arm.com>, Jeff Kubascik <Jeff.Kubascik@dornerworks.com>,
 "Ji, John" <john.ji@intel.com>,
 Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>, "Woodhouse,
 David" <dwmw@amazon.co.uk>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCu+7v09uIDA3LzAxLzIwMjAsIDA4OjIzLCAiRHVycmFudCwgUGF1bCIgPHBkdXJyYW50QGFt
YXpvbi5jby51az4gd3JvdGU6DQoNCiAgICA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQog
ICAgPiBGcm9tOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0KICAg
ID4gU2VudDogMDcgSmFudWFyeSAyMDIwIDAwOjI2DQogICAgPiBUbzogTGFycyBLdXJ0aCA8bGFy
cy5rdXJ0aEBjaXRyaXguY29tPjsgeGVuLWRldmVsIDx4ZW4tDQogICAgPiBkZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZz4NCiAgICA+IENjOiBSaWFuIFF1aW5uIDxyaWFucXVpbm5AZ21haWwuY29t
PjsgRGFuaWVsIFAuIFNtaXRoDQogICAgPiA8ZHBzbWl0aEBhcGVydHVzc29sdXRpb25zLmNvbT47
IERvdWcgR29sZHN0ZWluIDxjYXJkb2VAY2FyZG9lLmNvbT47IEJyaWFuDQogICAgPiBXb29kcyA8
YnJpYW4ud29vZHNAeGlsaW54LmNvbT47IFJpY2ggUGVyc2F1ZCA8cGVyc2F1ckBnbWFpbC5jb20+
Ow0KICAgID4gYW5hc3Rhc3Npb3MubmFub3NAb25hcHAuY29tOyBtaXJlbGEuc2ltb25vdmljQGFn
Z2lvcy5jb207DQogICAgPiBlZGdhci5pZ2xlc2lhc0B4aWxpbnguY29tOyBKaSwgSm9obiA8am9o
bi5qaUBpbnRlbC5jb20+Ow0KICAgID4gcm9iaW4ucmFuZGhhd2FAYXJtLmNvbTsgZGFuaWVsLmtp
cGVyQG9yYWNsZS5jb207IEFtaXQgU2hhaA0KICAgID4gPGFtaXRAaW5mcmFkZWFkLm9yZz47IE1h
dHQgU3BlbmNlciA8TWF0dC5TcGVuY2VyQGFybS5jb20+OyBSb2JlcnQgVG93bmxleQ0KICAgID4g
PHJvYi50b3dubGV5QGdtYWlsLmNvbT47IEFydGVtIE15Z2FpZXYgPEFydGVtX015Z2FpZXZAZXBh
bS5jb20+OyBWYXJhZA0KICAgID4gR2F1dGFtIDx2YXJhZGdhdXRhbUBnbWFpbC5jb20+OyBUYW1h
cyBLIExlbmd5ZWwNCiAgICA+IDx0YW1hcy5rLmxlbmd5ZWxAZ21haWwuY29tPjsgQ2hyaXN0b3Bo
ZXIgQ2xhcmsNCiAgICA+IDxjaHJpc3RvcGhlci53LmNsYXJrQGdtYWlsLmNvbT47IEdlb3JnZSBE
dW5sYXAgPEdlb3JnZS5EdW5sYXBAY2l0cml4LmNvbT47DQogICAgPiBTdGVmYW5vIFN0YWJlbGxp
bmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyBsYW1iZXJ0Lm9saXZpZXJAZ21haWwuY29tOw0K
ICAgID4gSWFuIEphY2tzb24gPElhbi5KYWNrc29uQGNpdHJpeC5jb20+OyB2ZmFjaGluQGRlLmFk
aXQtanYuY29tOyBLZXZpbg0KICAgID4gUGVhcnNvbiA8a2V2aW4ucGVhcnNvbkBvcnRtYW5jb25z
dWx0aW5nLmNvbT47IGludGVsLXhlbkBpbnRlbC5jb207IEphcnZpcw0KICAgID4gUm9hY2ggPEph
cnZpcy5Sb2FjaEBkb3JuZXJ3b3Jrcy5jb20+OyBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5j
b20+Ow0KICAgID4gU2VyZ2V5IER5YXNsaSA8c2VyZ2V5LmR5YXNsaUBjaXRyaXguY29tPjsgRHVy
cmFudCwgUGF1bA0KICAgID4gPHBkdXJyYW50QGFtYXpvbi5jby51az47IEp1bGllbiBHcmFsbCA8
anVsaWVuLmdyYWxsQGFybS5jb20+OyBKZWZmDQogICAgPiBLdWJhc2NpayA8SmVmZi5LdWJhc2Np
a0Bkb3JuZXJ3b3Jrcy5jb20+OyBOYXRhcmFqYW4sIEphbmFrYXJhamFuDQogICAgPiA8am5hdGFy
YWpAYW1kLmNvbT47IFN0ZXdhcnQgSGlsZGVicmFuZA0KICAgID4gPFN0ZXdhcnQuSGlsZGVicmFu
ZEBkb3JuZXJ3b3Jrcy5jb20+OyBWb2xvZHlteXIgQmFiY2h1aw0KICAgID4gPHZvbG9keW15cl9i
YWJjaHVrQGVwYW0uY29tPjsgV29vZGhvdXNlLCBEYXZpZCA8ZHdtd0BhbWF6b24uY28udWs+OyBS
b2dlcg0KICAgID4gUGF1IE1vbm5lIDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCiAgICA+IFN1Ympl
Y3Q6IFJlOiBbWGVuLWRldmVsXSBDb21tdW5pdHkgQ2FsbDogQ2FsbCBmb3IgQWdlbmRhIEl0ZW1z
IGFuZCBjYWxsDQogICAgPiBkZXRhaWxzIGZvciBKYW4gOSwgMTY6MDAgLSAxNzowMCBVVEMNCiAg
ICA+IA0KICAgID4gT24gMDYvMDEvMjAyMCAxOTo1NiwgTGFycyBLdXJ0aCB3cm90ZToNCiAgICA+
ID4gRGVhciBjb21tdW5pdHkgbWVtYmVycywNCiAgICA+ID4NCiAgICA+ID4gSSBob3BlIHlvdSBh
bGwgaGFkIGEgcmVzdGZ1bCBob2xpZGF5IHBlcmlvZCBhbmQgYSBIYXBweSBOZXcgWWVhciENCiAg
ICA+ID4NCiAgICA+ID4gUGxlYXNlIHNlbmQgbWUgYWdlbmRhIGl0ZW1zIGZvciB0aGlzIFRodXJz
ZGF5J3MgY29tbXVuaXR5IGNhbGwgKHdlDQogICAgPiBhZ3JlZWQgdG8gbW92ZSBpdCBieSAxIHdl
ZWspIHByZWZlcmFibHkgYnkgV2VkbmVzZGF5IQ0KICAgID4gPg0KICAgID4gPiBBIGRyYWZ0IGFn
ZW5kYSBpcw0KICAgID4gYXQgaHR0cHM6Ly9jcnlwdHBhZC5mci9wYWQvIy8yL3BhZC9lZGl0L0VS
WnRNWUQ1ajZrMHN2LU5HNkh0bC1BSi8NCiAgICA+ID4gUGxlYXNlIGFkZCBhZ2VuZGEgaXRlbXMg
dG8gdGhlIGRvY3VtZW50IG9yIHJlcGx5IHRvIHRoaXMgZS1tYWlsDQogICAgPiANCiAgICA+IEkg
dGhpbmsgaXQgd291bGQgYmUgdmVyeSBoZWxwZnVsIGZvciB0aGUgY29tbXVuaXR5IGluIGdlbmVy
YWwgdG8ga25vdw0KICAgID4gYW55IHNwZWNpZmljIHBsYW5zIGVhY2ggb2YgdXMgaGF2ZSBmb3Ig
dGhlIDQuMTQgdGltZWZyYW1lLg0KICAgID4gDQogICAgPiBJIHBlcnNvbmFsbHkgYW0gYXdhcmUg
b2YgYSBmYWlyIHF1YW50aXR5IG9mIHdvcmsgZnJvbSB2YXJpb3VzIHBlb3BsZSwNCiAgICA+IGJ1
dCBpdCBpcyBjbGVhciB0aGF0IHRoZSBjb21tdW5pdHkgYXMgYSB3aG9sZSBkb2Vzbid0IHJlYWxs
eSBoYXZlIGFuDQogICAgPiBpZGVhIG9mIHdobyBpcyB3b3JraW5nIG9uIHdoYXQuDQogICAgPiAN
CiAgICA+IE15IGNvbnRyaWJ1dGlvbiB0byB0aGUgZGlzY3Vzc2lvbiBzdGFydHMgd2l0aA0KICAg
ID4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcveGVuLWRldmVsLzk0MWNmMjNjLTEzZWQtMTRhMS1m
ZDI1LQ0KICAgID4gNDViMDAxZDk1NjRhQGNpdHJpeC5jb20vVC8jdQ0KICAgID4gYnV0IEkgdGhp
bmsgaXQgd291bGQgYmUgaGVscGZ1bCBpZiBvdGhlcnMgZ2F2ZSBhdCBsZWFzdCBhIGJyaWVmIG92
ZXJ2aWV3DQogICAgPiBvZiBhbnkgcGxhbnMgYW5kIHdoZXRoZXIgdGhleSBhcmUgaW50ZW5kaW5n
IHRoZSB3b3JrIHRvIGhpdCB0aGUgbmV4dA0KICAgID4gcmVsZWFzZSwgb3Igd2hldGhlciBpdCBp
cyBtb3JlIGxpa2VseSB0byBiZSBhIGZ1dHVyZSByZWxlYXNlLg0KICAgIA0KICAgIEFncmVlZC4g
SSBuZWVkIGEgYmFzZWxpbmUgbGlzdCBvZiBpdGVtcyB0byB0cmFjayBmb3IgNC4xNC4gDQogICAg
DQpJIGFkZGVkIA0KDQogICBDLjIpIDQuMTMgUmVsZWFzZSByZXRyb3NwZWN0aXZlIGFuZCA0LjE0
IHBsYW5uaW5nIGJhc2VsaW5lIChMYXJzLCBQYXVsKQ0KICAgNC4xMzogU2VlbXMgdG8gYmUgdGhh
dCB0aGlzIHRpbWUgc29tZSBzdHVmZiBoYWQgZ29uZSB3cm9uZywgaW4gcGFydGljdWxhciBhcm91
bmQgdGhlIHJlbGVhc2UgY29tbXMuIFRoaXMgaXMgYSBwbGFjZWhvbGRlciB0byBkaXNjdXNzLg0K
DQogICA0LjE0OiBOZWVkIGEgYmFzZWxpbmUgZm9yIDQuMTQgcGxhbm5pbmcNCiAgIEl0IHdvdWxk
IGJlIGhlbHBmdWwgaWYgRVZFUllPTkUgZ2F2ZcKgYSBicmllZiBvdmVydmlldyBvZiBhbnkgcGxh
bnMgZm9yIDQuMTQgYW5kIHdoZXRoZXIgdGhleSBhcmUgaW50ZW5kaW5nIHRoZSB3b3JrIHRvIGhp
dCB0aGUgbmV4dCANCiAgIHJlbGVhc2UsIG9yIHdoZXRoZXIgaXQgaXMgbW9yZSBsaWtlbHkgdG8g
YmUgYSBmdXR1cmUgcmVsZWFzZS4NCg0KICAgQW5kcmV3J3MgY29udHJpYnV0aW9uIGFuZCBsYXJn
ZXIgNC4xNCBiYWNrbG9nIGF0OsKgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcveGVuLWRldmVsLzk0
MWNmMjNjLTEzZWQtMTRhMS1mZDI1LTQ1YjAwMWQ5NTY0YUBjaXRyaXguY29tL1QvI3UNCg0KVG8g
dGhlIGFnZW5kYQ0KTGFycw0KICAgIA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
