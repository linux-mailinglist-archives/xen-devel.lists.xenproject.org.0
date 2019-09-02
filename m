Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16457A5C26
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2019 20:16:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i4qmn-0008LU-By; Mon, 02 Sep 2019 18:10:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=v281=W5=citrix.com=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1i4qmm-0008LP-0A
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2019 18:10:40 +0000
X-Inumbo-ID: f3eeba48-cdac-11e9-aea6-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f3eeba48-cdac-11e9-aea6-12813bfff9fa;
 Mon, 02 Sep 2019 18:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567447832;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=fCPmwnGO501cQ5qDK9EKjch24aan0A9x1cDBI/2N3ZU=;
 b=IHfVXIN0Gn3H1NPiHewyz4Vq/e7j3URGlwtZ6Kflpag9SM8MVKf7ajak
 gw4FEiIDIXBDRECOdNmiRJWuQD2cVcZgrHabUPsdMQkjoEqCC88PL3Zoc
 sN++hHqqPimA41jng9VCaj/PePAJe9waPK79aDNV2i9krhDMVBBkMGocz A=;
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
IronPort-SDR: 2KFP1eCS+zzgX08ZthY8/Mf/atVGtpg3MWk/Teq7VIiDqUPBSjAjjDoFxtEvHDH3hkQcIdIcjt
 4yHFc2P3eVaAuyK7hFtgcgov50MF5a4vEuyJ5S225pqKArqUv/hhYjta7XtfgpgUbWGfiPm0mq
 RWKhhYVK2HO0QdsznNWOkRnj4Ltm/FQ8OMlhrSpCG/vjvg61xXZQbDZOmMXRnuxPq2sv+JOkrf
 V/ScZb1VMluA9oicIbGj29PLE2pl7RrSg/NtbvaBwkSNtOI79Vra1zmXhcXw0TZhZohBsq3htC
 dpk=
X-SBRS: 2.7
X-MesageID: 5211855
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,460,1559534400"; 
   d="scan'208";a="5211855"
From: Lars Kurth <lars.kurth@citrix.com>
To: Ian Jackson <Ian.Jackson@citrix.com>
Thread-Topic: [Xen-devel] [RFC] Code of Conduct
Thread-Index: AQHVYaX4OlNK7ty/1ECq/iU5x7WQe6cYn1YA
Date: Mon, 2 Sep 2019 18:10:28 +0000
Message-ID: <E5235465-C2CC-4D9E-ABD4-39D1056B5352@citrix.com>
References: <AB34D39A-A120-440E-9309-3950E7A465A5@citrix.com>
 <6785899F-48FE-4977-81D1-3AA700241857@gmail.com>
 <38ac71b4-53c0-9402-2c6f-118f29818f85@citrix.com>
 <FCA290D6-2ECA-4B95-B327-7D263E0E4687@gmail.com>
 <818DA1AE-CE46-4806-B806-0943B79DF725@citrix.com>
 <F76AAD6E-198A-4455-A1DE-EED974DEACA3@citrix.com>
 <23909.26956.404750.684802@mariner.uk.xensource.com>
 <D8EFC0B6-0FFC-4288-86EC-FD0A0BB8C3BF@citrix.com-0>
 <23917.14808.737779.119459@mariner.uk.xensource.com>
In-Reply-To: <23917.14808.737779.119459@mariner.uk.xensource.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.10.d.190811
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <66238FBAE03F0A44B87DBC632A219CD8@citrix.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] [RFC] Code of Conduct
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
Cc: George Dunlap <George.Dunlap@citrix.com>,
 "minios-devel@lists.xenproject.org" <minios-devel@lists.xenproject.org>,
 Rich Persaud <persaur@gmail.com>,
 "committers@xenproject.org" <committers@xenproject.org>,
 "mirageos-devel@lists.xenproject.org" <mirageos-devel@lists.xenproject.org>,
 xen-devel <xen-devel@lists.xenproject.org>,
 "win-pv-devel@lists.xenproject.org" <win-pv-devel@lists.xenproject.org>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCu+7v09uIDAyLzA5LzIwMTksIDE2OjQ5LCAiSWFuIEphY2tzb24iIDxpYW4uamFja3NvbkBj
aXRyaXguY29tPiB3cm90ZToNCg0KICAgIExhcnMgS3VydGggd3JpdGVzICgiUmU6IFtYZW4tZGV2
ZWxdIFtSRkNdIENvZGUgb2YgQ29uZHVjdCIpOg0KICAgID4gSSBhdHRhY2hlZCBhIHJlZGxpbmUg
dmVyc2lvbiBvZiBib3RoIHRoZSBvcmlnaW5hbCAoYmFzZWQgb24gdGhlIExGIGV2ZW50cyBDb0Mp
IGFuZCBhIHJlZGxpbmUgdmVyc2lvbiBiYXNlZCBvbiB0aGUgY292ZW5hbnQgZ2l2ZW4gdGhlIGNv
bnN0cmFpbnRzIHdlIGFncmVlZC4gQWthDQogICAgPiBbMV0gWGVuIENvQyBDb250cmlidXRvciBD
b3ZlbmFudCBiYXNlbGluZSAocmVkbGluZSkucGRmIA0KICAgID4gWzJdIFhlbiBDb0MgTEYgZXZl
bnRzIGJhc2VsaW5lIChyZWRsaW5lKS5wZGYNCiAgICA+IA0KICAgID4gSSBtaW5pbWl6ZWQgY2hh
bmdlcyB0byBbMl0uIA0KICAgIA0KICAgIEkgbGlrZSBib3RoIG9mIHRoZXNlLiAgSSB3b3VsZCBi
ZSBoYXBweSB0byBhZG9wdCBlaXRoZXIuICBJIHByZWZlciB0aGUNCiAgICBDb250cmlidXRvciBD
b3ZlbmFudCBiYXNlZCB2ZXJzaW9uLg0KICAgIA0KICAgIA0KICAgIEkgaGF2ZSB0d28gY29tbWVu
dHMuICBUaGUgZmlyc3QgaXMgdmVyeSBtaW5vcjoNCiAgICANCiAgICBUaGUgTEYgRXZlbnRzIG9u
ZSBoYXMgb25lIGRpZmZlcmVudCBzZWN0aW9uIHRpdGxlLiAgSW5zdGVhZCBvZg0KICAgICAgICAg
ICAgRW5mb3JjZW1lbnQNCiAgICBpdCBoYXMNCiAgICAgICAgICAgIFdoYXQgVG8gRG8gSWYgWW91
IFdpdG5lc3MgT3IgQXJlIFN1YmplY3QgVG8gVW5hY2NlcHRhYmxlDQogICAgICAgICAgICBCZWhh
dmlvciANCiAgICB3aGljaCBpcyB1bndpZWxkeSBidXQgYmV0dGVyIGluIG90aGVyIHdheXMgLSBt
b3JlIHBvc2l0aXZlIGFuZA0KICAgIGNvbnN0cnVjdGl2ZS4gIEknbSBub3Qgc3VyZSBpZiB0aGVy
ZSBpcyBhIGhhcHB5IG1pZGRsZSBncm91bmQuDQogICAgSSBhbSBoYXBweSB0byBhZG9wdCBlaXRo
ZXIgdmVyc2lvbiB3aXRoIGVpdGhlciB0aXRsZS4gIEkgbWVudGlvbiBpdCBpbg0KICAgIGNhc2Ug
YW55b25lIGhhcyBiZXR0ZXIgaWRlYXMgZXRjLg0KDQpJIGFtIGFsc28gYWx0b2dldGhlciBoYXBw
aWVyIHdpdGggdGhlIENvbnRyaWJ1dG9yIENvdmVuYW50LCBidXQgbWF5YmUgDQp3aXRoIGEgZmV3
IGFkZGl0aW9uYWwgY2hhbmdlcyBzdWNoIGFzIGNoYW5naW5nIHNvbWUgdGl0bGVzIGFuZCBzb21l
DQpvZiB0aGUgbW9kaWZpY2F0aW9ucyBvdXRsaW5lZCBlYXJsaWVyLg0KICAgIA0KICAgIE15IHNl
Y29uZCBjb21tZW50IGlzIG1vcmUgc3Vic3RhbnRpYWwuICBJdCBzaG91bGQgbm90IGJlIHJlZ2Fy
ZGVkIGFzIGENCiAgICBibG9ja2VyLCBidXQgSSB3b3VsZCBsaWtlIHRvIHNlZSBpdCBhZGRyZXNz
ZWQgZWl0aGVyIG5vdyBvciBhZnRlciBDb0MNCiAgICBhZG9wdGlvbi4NCiAgICANCiAgICBUaGUg
cm9vdCBpc3N1ZSBpcyB0aGUgZGlmZmljdWx0IG9uZSBvZiB3aGF0IHRvIGRvIGFib3V0IHBvc3Np
YmxlDQogICAgaW52b2x2ZW1lbnQgaW4gYWJ1c2UgYnkgbWVtYmVycyBvZiB0aGUgY29uZHVjdEAg
YWRkcmVzcy4NCiAgICANCiAgICBJIHdvdWxkIGxpa2UgdG8gc2VlIHR3byBjaGFuZ2VzOiBmaXJz
dGx5LCB3ZSBzaG91bGQgcHVibGlzaCB0aGUgbGlzdA0KICAgIG9mIHBlb3BsZSB0aGF0IHRoZSBj
b25kdWN0IGFsaWFzIGdvZXMgdG8uICBUaGUgQ29DIHNob3VsZCBjb250YWluIGENCiAgICByZWZl
cmVuY2UgdG8gdGhlIHBsYWNlIHdoZXJlIHRoaXMgY2FuIGJlIGZvdW5kLiAgIlRoZSBtZW1iZXJz
aGlwIG9mDQogICAgdGhlIGNvbmR1Y3RAIGFsaWFzIGlzIHB1YmxpY2x5IGRvY3VtZW50ZWQgaW4g
W2xvY2F0aW9uXSIuDQoNClRoYXQgaXMgZW50aXJlbHkgc2Vuc2libGUuIEkgdGhpbmsgdGhlIGJl
c3QgcGxhY2Ugd291bGQgYmUgdG8gcmVjb3JkIHRoaXMNCmluIHRoZSBkb2N1bWVudC4gV2Ugc2hv
dWxkIHByb2JhYmx5IHN0YXJ0IHdpdGggYSBzaG9ydGxpc3Qgb2YgcGVvcGxlIA0KYW5kIGluY2x1
ZGUgaXQgaW4gdGhlIG5leHQgdmVyc2lvbiBhbmQgZ2V0IGl0IGFsbCBhcHByb3ZlZCBpbiBvbmUg
Z28NCiAgICANCiAgICBTZWNvbmRseSwgd2Ugc2hvdWxkIGV4cGxpY2l0bHkgcHJvdmlkZSBhIHJv
dXRlIGZvciBzb21lb25lIHdobw0KICAgIGRpc3RydXN0cyBtZW1iZXIocykgb2YgY29uZHVjdEAu
ICBIb3cgYWJvdXQ6DQogICAgDQogICAgICBJZiB5b3UgaGF2ZSBjb25jZXJucyBhYm91dCBhbnkg
b2YgdGhlIG1lbWJlcnMgb2YgdGhlIGNvbmR1Y3RAIGFsaWFzLA0KICAgICAgeW91IGFyZSB3ZWxj
b21lIHRvIGNvbnRhY3QgcHJlY2lzZWx5IHRoZSBDb25kdWN0IFRlYW0gbWVtYmVyKHMpIG9mDQog
ICAgICB5b3VyIGNob2ljZS4NCg0KVGhhdCBpcyBlbnRpcmVseSBmaW5lIHdpdGggbWUuDQogICAg
DQogICAgVGhlIHRlYW0gc2hvdWxkIGJlIGxhcmdlIGFuZCBkaXZlcnNlIGVub3VnaCB0aGF0IHRo
aXMgaXMgYSBwcmFjdGljYWxseQ0KICAgIHVzZWZ1bCByZWNvbW1lbmRhdGlvbiwgYnV0IGl0IHNo
b3VsZCBub3QgYmUgdW53aWVsZHkuDQogICAgDQpJIHdhcyB0aGlua2luZyBvZiAyLTMgbWF5YmUg
NCBwZW9wbGUuIENhbiB0aG9zZSBsZWFkZXJzaGlwIHRlYW0gbWVtYmVycw0Kd2hvIGFyZSB3aWxs
aW5nIHRvIHN0ZXAgdXAgcmVwbHkgdG8gbWUgcHJpdmF0ZWx5IG9yIGluIHRoaXMgdGhyZWFkLiBJ
IGFtIGFzc3VtaW5nIA0KdGhhdCBJIHdpbGwgYmUgYSBtZW1iZXIgb2YgY29uZHVjdEAsIGJ1dCBJ
IGFtIGFsc28gd2lsbGluZyB0byBzdGVwIGFzaWRlDQppZiBpdCBoZWxwcy4NCg0KUmVnYXJkbGVz
cyBvZiB0aGlzLCBJIHRoaW5rIEkgaGF2ZSBlbm91Z2ggdG8gc2VuZCBvdXQgYSBjb25jcmV0ZSBw
cm9wb3NhbA0KZm9yIGZ1cnRoZXIgcmV2aWV3DQoNCkJlc3QgUmVnYXJkcw0KTGFycw0KDQoNCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
