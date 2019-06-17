Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 644B248A76
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2019 19:40:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hcvYt-00033E-35; Mon, 17 Jun 2019 17:36:55 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JT4l=UQ=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hcvYr-000339-Bn
 for xen-devel@lists.xenproject.org; Mon, 17 Jun 2019 17:36:53 +0000
X-Inumbo-ID: 7dbb6918-9126-11e9-8980-bc764e045a96
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 7dbb6918-9126-11e9-8980-bc764e045a96;
 Mon, 17 Jun 2019 17:36:51 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 5tL94c6aGd8x50dWBXxprOukuWnfbE0PesQHSgxxAAxJkmThEPK/uDHtYGLbBi8I4CeZzFcIEz
 tZAUWzQR9VKbAdJgrkGO/+Hs0d+ao04Xu6WdIM96UvJrz3Kw6HYkZdRNoYArAC2OYE8gMm5W0d
 i/+noR/GoG+Vi+ltqv4FIeyiIlsERYlpnn90zwzkZx73Izg7S9OqYakkXvwzdRBk0SNb3Xgc1z
 QVeCIe+NDUMIRXFMNiRirFydIOnGM2BEtMWcGTabwFqIIcdxt5ATO0uqeqPeQty/7dOo9V+LLT
 aTY=
X-SBRS: 2.7
X-MesageID: 1829370
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,386,1557201600"; 
   d="scan'208";a="1829370"
Date: Mon, 17 Jun 2019 18:36:49 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Paul Durrant <Paul.Durrant@citrix.com>
Message-ID: <20190617173649.GB13449@perard.uk.xensource.com>
References: <20190617154105.32323-1-anthony.perard@citrix.com>
 <20190617154105.32323-5-anthony.perard@citrix.com>
 <a3843cb971bc4fa8886170d0b2461a44@AMSPEX02CL03.citrite.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a3843cb971bc4fa8886170d0b2461a44@AMSPEX02CL03.citrite.net>
User-Agent: Mutt/1.12.1 (2019-06-15)
Subject: Re: [Xen-devel] [PATCH 4/4] xen: Avoid VLA
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBKdW4gMTcsIDIwMTkgYXQgMDU6Mzk6MDlQTSArMDEwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+ID4gQEAgLTYzMiw2ICs2MzMsOCBAQCBzdGF0aWMgdm9pZCB4ZW5fc3luY19kaXJ0eV9i
aXRtYXAoWGVuSU9TdGF0ZSAqc3RhdGUsCj4gPiAgICAgICAgICByZXR1cm47Cj4gPiAgICAgIH0K
PiA+IAo+ID4gKyAgICBiaXRtYXAgPSBnX25ldzAodW5zaWduZWQgbG9uZywgYml0bWFwX3NpemUp
Owo+ID4gKwo+IAo+IEhvdyBob3QgaXMgdGhpcyBmdW5jdGlvbj8gSXQgbG9va3MgKHVuc3VycHJp
c2luZ2x5KSBsaWtlIHRoZSBzZWN0aW9uCj4gc2l6ZSBkZXRlcm1pbmVzIHRoZSBtYXAgc2l6ZSBz
byBJIHdvbmRlciB3aGV0aGVyIGl0IGNhbiBpbnN0ZWFkIGJlCj4gYWxsb2NhdGVkIG9uY2Ugd2hl
biB0aGUgc2VjdGlvbiBpcyBhZGRlZD8KCkkgdGhpbmsgd2UgY2FuIHN0b3JlIHRoZSBiaXRtYXAg
YnVmZmVyIGludG8gdGhlIGBzdGF0ZScgd2hlcmUKYGxvZ19mb3JfZGlydHliaXQnIGlzIGFscmVh
ZHkgcHJlc2VudCwgYW5kIGZyZWUgdGhlIGJpdG1hcCB3aGVuCmBsb2dfZm9yX2RpcnR5Yml0JyBp
cyBjbGVhcmVkLgoKVGhhbmtzLAoKLS0gCkFudGhvbnkgUEVSQVJECgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
