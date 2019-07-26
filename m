Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C07C9765D8
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2019 14:32:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqzM8-00082g-9y; Fri, 26 Jul 2019 12:29:52 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PDV5=VX=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hqzM6-00082b-MH
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2019 12:29:50 +0000
X-Inumbo-ID: 0f19a362-afa1-11e9-8980-bc764e045a96
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 0f19a362-afa1-11e9-8980-bc764e045a96;
 Fri, 26 Jul 2019 12:29:49 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: aH4k34kM083iWSGvjm2q50+KHpEcfcMdsMy/X37I/l9D1CC82AE21I8t0wU2t/CxoPb3SUsZP/
 olXsF5A1FzwQWEMRZXpEcXlAwLCIKiWE504KdPREyrfvAaIkl/Do2Wrljc4JE/qyHjroULZRR4
 d9vFP64oS9yyI9ZKcJiJTbjwTOGV1c64pos2gJezRH1hrkeyn8D3bPfxG+K5HyNeXBceiRDSlH
 C+1ACUu6e+aoZTUPg+3sLJflDpS2hIMpfhX7K0tXj5OLQHQrKKi6I59i6BxYRm48KixqSOihxi
 Hno=
X-SBRS: 2.7
X-MesageID: 3570631
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,310,1559534400"; 
   d="scan'208";a="3570631"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: "xen-devel (xen-devel@lists.xenproject.org)"
 <xen-devel@lists.xenproject.org>
Thread-Topic: per-domain passthrough/iommu options
Thread-Index: AdVDqy2gdS3slVvQRuCN/iB10JmJ2g==
Date: Fri, 26 Jul 2019 12:29:46 +0000
Message-ID: <a65d176f8912458c8576367597613de9@AMSPEX02CL03.citrite.net>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: [Xen-devel] per-domain passthrough/iommu options
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgogIEkgc2VudCBhIHByZXZpb3VzIGVtYWlsIFsxXSBhYm91dCBlbmFibGluZyB1c2Ugb2Yg
dGhlIElPTU1VIG9uIGEgcGVyLWRvbWFpbiBiYXNpcyBhbmQgYW0gbm93IGEgcmVhc29uYWJsZSB3
YXkgaW50byBteSBwYXRjaCBzZXJpZXMsIHdoaWNoIGFsc28gYWxsb3dzIGZvciBJT01NVSBvcHRp
b24tc2V0dGluZyAoc3BlY2lmaWNhbGx5IHNoYXJlZCBFUFQgdXNlKSBvbiBhIHBlci1kb21haW4g
YmFzaXMgdG9vLiBCZWZvcmUgSSBwb3N0IHYxIEknZCBsaWtlIHRvIGdldCBzb21lIG9waW5pb24g
b24gdGhlIHdoYXQgdGhlIHhsLmNmZyBvcHRpb25zIHNob3VsZCBsb29rIGxpa2UuCiAgVGhlIHNp
bXBsZXN0IHdheSBmb3IgbWUgdG8gZG8gdGhpbmdzIHdvdWxkIGJlIHRvIGhhdmUgdHdvIG5ldyBi
b29sZWFuIG9wdGlvbnM7IHNvbWV0aGluZyBsaWtlOgoKJ3Bhc3N0aHJvdWdoJyAtIGVuYWJsZS9k
aXNhYmxlIHBhc3MtdGhyb3VnaCBzdXBwb3J0IChpLmUuIHVzZSBvZiB0aGUgSU9NTVUpLi4uIGNh
biBiZSBpbXBsaWNpdGx5IGVuYWJsZWQgaWYgdGhlcmUgYXJlIHBjaSBvciBkdCBkZXZpY2VzIHNw
ZWNpZmllZCBpbiB0aGUgeGwuY2ZnLgonbm8tc2hhcmVwdCcgLSBuYW1lZCB0byBtYXRjaCB0aGUg
eGVuLWNtZGxpbmUgb3B0aW9uIGZvciB0dXJuaW5nIG9mZiBzaGFyZWQgRVBULiAoRVBUIHNoYXJp
bmcgY3VycmVudGx5IGRlZmF1bHRzIG9uIGdsb2JhbGx5KS4KCiAgSSB0aGluayB0aGUgZm9ybWVy
IGlzIHByb2JhYmx5IG9rLCBidXQgdGhpbmtpbmcgZm9yd2FyZCB0byBhIHRpbWUgd2hlcmUgd2Ug
bWlnaHQgaGF2ZSB2SU9NTVUgKFBWIG9yIGVtdWxhdGVkKSB0aGUgbGF0dGVyIGlzIHByb2JhYmx5
IG5vdCB0aGUgcmlnaHQgdGhpbmcgdG8gdXNlLiBTbywgYW5vdGhlciB3YXkgbWlnaHQgYmUgdG8g
aGF2ZSBhbiBJT01NVSBwYWdlLXRhYmxlIG9wdGlvbi4uLiBzb21ldGhpbmcgbGlrZToKCidpb21t
dS1wdCA9IHNoYXJlZHxzeW5jJwoKICB3aGVyZSAnc2hhcmVkJyBtZWFucyB1c2UgRVBUIG1hcHBp
bmdzLCBhbmQgJ3N5bmMnIG1lYW5zIGtlZXAgdGhlIFAyTSBpbiBzeW5jLiBUaGlzIGNvdWxkIHRo
ZW4gYmUgZXh0ZW5kZWQgd2l0aCAndmlvbW11JyBsYXRlciwgbWVhbmluZyB0aGF0IHRoZXJlIHdv
dWxkIGJlIHNvbWUgZm9ybSBvZiB2SU9NTVUgZXhwb3NlZCB0byB0aGUgZ3Vlc3QsIGJlIGl0IGVt
dWxhdGVkLCBQViBvciBib3RoLiBPbmUgZHJhd2JhY2sgd2l0aCB0aGlzIG1lY2hhbmlzbSBpcyB0
aGF0ICdzaGFyZWQnIGlzIG5vdCBhbHdheXMgcG9zc2libGUgKGUuZy4gb24gQU1EIGgvdykgc28g
d2hhdCBzaG91bGQgYmUgZG9uZSBpbiB0aGF0IGNhc2U/IFNob3VsZCBzZWxlY3RpbmcgdGhhdCBv
cHRpb24gYmUgY29uc2lkZXJlZCBhbiBlcnJvciwgb3Igc2hvdWxkIHRoZXJlIGJlIGEgZmFsbC1i
YWNrIHRvICdzeW5jJz8gVGhlIGZhbGwtYmFjayB3b3VsZCBiZSBlYXNpZXIgdG8gZGVhbCB3aXRo
IGFzIHRoZW4gdGhlIG9wdGlvbiBjb3VsZCBqdXN0IGRlZmF1bHQgdG8gJ3N5bmMnIGlmIGl0IHdh
cyBub3Qgc3BlY2lmaWVkLgoKICBUaG91Z2h0cz8gT3RoZXIgaWRlYXM/CgogIENoZWVycywKCiAg
ICBQYXVsCgpbMV0gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9odG1sL3hl
bi1kZXZlbC8yMDE5LTA3L21zZzAxMDkwLmh0bWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
