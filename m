Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C958604D
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2019 12:44:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvfrM-0003ZR-II; Thu, 08 Aug 2019 10:41:28 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nHR3=WE=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hvfrL-0003ZA-93
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2019 10:41:27 +0000
X-Inumbo-ID: 12902c41-b9c9-11e9-8980-bc764e045a96
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 12902c41-b9c9-11e9-8980-bc764e045a96;
 Thu, 08 Aug 2019 10:41:26 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 3l9HoUspUGZwJU9PnCnk8hbj2tlkWF58Ri51v3FgiXc55dNJBBK6IRTVkzYMKpnZqT2OTj4LMi
 gSvChZo1Z+LCOqAYberi+tdU04CsPNewVyV/py3aKxq84Z/uF2bVmYsEATBetmhlnfiOuLkeiI
 1p+skxKjU3tdTGoJVmoO0JLyAccgU5thDqASXuhTBtv4zz0eIlWoOWyc3DZjiyxlg2JWjmF+/J
 QfSHG5n2bghCZjgNfbA3s7kmbaIsngi2OZHb3pSdZ9ABW6ZfBxJxf9yz01JpOO+dc+66IRY1GC
 HnE=
X-SBRS: 2.7
X-MesageID: 4202638
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,360,1559534400"; 
   d="scan'208";a="4202638"
Date: Thu, 8 Aug 2019 11:41:18 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Message-ID: <20190808104118.GS1242@perard.uk.xensource.com>
References: <20190729153944.24239-1-anthony.perard@citrix.com>
 <20190729153944.24239-23-anthony.perard@citrix.com>
 <20190807150849.b6alhjw2lgcjpmxx@Air-de-Roger>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190807150849.b6alhjw2lgcjpmxx@Air-de-Roger>
User-Agent: Mutt/1.12.1 (2019-06-15)
Subject: Re: [Xen-devel] [edk2-devel] [PATCH v4 22/35]
 OvmfPkg/XenPlatformPei: no hvmloader: get the E820 table via hypercall
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
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Jordan Justen <jordan.l.justen@intel.com>, devel@edk2.groups.io,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org,
 Laszlo Ersek <lersek@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBBdWcgMDcsIDIwMTkgYXQgMDU6MTQ6MzNQTSArMDIwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiBPbiBNb24sIEp1bCAyOSwgMjAxOSBhdCAwNDozOTozMVBNICswMTAwLCBBbnRo
b255IFBFUkFSRCB3cm90ZToKPiA+IFdoZW4gdGhlIFhlbiBQVkggZW50cnkgcG9pbnQgaGFzIGJl
ZW4gdXNlZCwgaHZtbG9hZGVyIGhhc24ndCBydW4gYW5kCj4gPiBoYXNuJ3QgcHJlcGFyZWQgYW4g
RTgyMCB0YWJsZS4gVGhlIG9ubHkgd2F5IGxlZnQgdG8gZ2V0IGFuIEU4MjAgdGFibGUKPiA+IGlz
IHRvIGFzayBYZW4gdmlhIGFuIGh5cGVyY2FsbCwgdGhlIGNhbGwgY2FuIG9ubHkgYmUgbWFkZSBv
bmNlIHNvIGtlZXAKPiA+IHRoZSByZXN1bHQgY2FjaGVkIGZvciBsYXRlci4KPiAKPiBJIHRoaW5r
IHdlIGFncmVlZCB0aGF0IHRoZSBhYm92ZSBpcyBub3QgdHJ1ZSwgYW5kIHRoYXQgdGhlIG1lbW9y
eQo+IG1hcCBjYW4gYmUgZmV0Y2hlZCBhcyBtYW55IHRpbWVzIGFzIGRlc2lyZWQgdXNpbmcgdGhl
IGh5cGVyY2FsbAo+IGludGVyZmFjZS4KClllcywgSSdsbCBjaGFuZ2UgdGhlIGNvbW1pdCBtZXNz
YWdlLiBIb3cgYWJvdXQ6CgogIFdoZW4gdGhlIFhlbiBQVkggZW50cnkgcG9pbnQgaGFzIGJlZW4g
dXNlZCwgaHZtbG9hZGVyIGhhc24ndCBydW4gYW5kCiAgaGFzbid0IHByZXBhcmVkIGFuIEU4MjAg
dGFibGUuIFRoZSBvbmx5IHdheSBsZWZ0IHRvIGdldCBhbiBFODIwIHRhYmxlCiAgaXMgdG8gYXNr
IFhlbiB2aWEgYW4gaHlwZXJjYWxsLiAgV2Uga2VlcCB0aGUgcmVzdWx0IGNhY2hlZCB0byBhdm9p
ZAogIG1ha2luZyBhIHNlY29uZCBoeXBlcmNhbGwgd2hpY2ggd291bGQgZ2l2ZSB0aGUgc2FtZSBy
ZXN1bHQuCgpUaGFua3MsCgotLSAKQW50aG9ueSBQRVJBUkQKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
