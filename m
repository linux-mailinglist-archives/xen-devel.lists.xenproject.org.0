Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 836898645A
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2019 16:30:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvjOO-0005zf-B4; Thu, 08 Aug 2019 14:27:48 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nHR3=WE=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hvjOM-0005zX-KL
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2019 14:27:46 +0000
X-Inumbo-ID: aff03f9b-b9e8-11e9-8980-bc764e045a96
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id aff03f9b-b9e8-11e9-8980-bc764e045a96;
 Thu, 08 Aug 2019 14:27:44 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: CNY1BW7vuP7e8rOPo5IrH3OxO6ZA04BTF4d6Ru05dIkVOcRyXCagAa/BOeUn6lzi8ZIdCEQEgy
 1/ex3SxfKO2sEcVJwMDh4p/vWhiFljqxNG/h/QrF1VPmKlUUDG0jZfztBebfVGe6P9GERFmWt9
 VEmO0sEvpfXkgPTNmApuL4weKntPmnR1GLXIqy8IACNaxik4vrbn18YWtlJXsi/cevhkNmCo1X
 /q89Lv+oRZqI9coT5afP4aEE72d07WnLc0O7qgAj2wMfNr0/ly9SO0XccFsyMUs9cXLvI3Disf
 3fg=
X-SBRS: 2.7
X-MesageID: 4169468
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,361,1559534400"; 
   d="scan'208";a="4169468"
Date: Thu, 8 Aug 2019 14:53:31 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Message-ID: <20190808135331.GV1242@perard.uk.xensource.com>
References: <20190729153944.24239-1-anthony.perard@citrix.com>
 <20190729153944.24239-34-anthony.perard@citrix.com>
 <20190807160703.2hkbpyvodevuwuhz@Air-de-Roger>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190807160703.2hkbpyvodevuwuhz@Air-de-Roger>
User-Agent: Mutt/1.12.1 (2019-06-15)
Subject: Re: [Xen-devel] [edk2-devel] [PATCH v4 33/35] OvmfPkg: Introduce
 XenIoPvhDxe to initialize Grant Tables
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

T24gV2VkLCBBdWcgMDcsIDIwMTkgYXQgMDY6MDc6MDNQTSArMDIwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiBPbiBNb24sIEp1bCAyOSwgMjAxOSBhdCAwNDozOTo0MlBNICswMTAwLCBBbnRo
b255IFBFUkFSRCB3cm90ZToKPiA+IFhlbklvUHZoRHhlIHVzZSBYZW5Jb01taW9MaWIgdG8gcmVz
ZXJ2ZSBzb21lIHNwYWNlIHRvIGJlIHVzZSBieSB0aGUKPiA+IEdyYW50IFRhYmxlcy4KPiA+IAo+
ID4gVGhlIGNhbGwgaXMgb25seSBkb25lIGlmIGl0IGlzIG5lY2Vzc2FyeSwgd2Ugc2ltcGx5IGRl
dGVjdCBpZiB0aGUKPiA+IGd1ZXN0IGlzIFBWSCwgYXMgaW4gdGhpcyBjYXNlIHRoZXJlIGlzIGN1
cnJlbnRseSBubyBQQ0kgYnVzLCBhbmQgbm8KPiA+IFBDSSBYZW4gcGxhdGZvcm0gZGV2aWNlIHdo
aWNoIHdvdWxkIHN0YXJ0IHRoZSBYZW5Jb1BjaUR4ZSBhbmQgYWxsb2NhdGUKPiA+IHRoZSBzcGFj
ZSBmb3IgdGhlIEdyYW50IFRhYmxlcy4KPiAKPiBTaW5jZSBJJ20gbm90IGZhbWlsaWFyIHdpdGgg
T1ZNRiBjb2RlLCB3aGVyZSBpcyB0aGUgZ3JhbnQgdGFibGUKPiBwaHlzaWNhbCBtZW1vcnkgY29t
aW5nIGZyb20gdGhlbiwgaXMgaXQgYWxsb2NhdGVkIGZyb20gYSBob2xlIGluIHRoZQo+IG1lbW9y
eSBtYXA/CgpPbiBIVk0sIHdlIHVzZSB0aGUgZmlyc3QgQkFSIG9mIHRoZSBYZW4gcGxhdGZvcm0g
UENJIGRldmljZS4gU2luY2UgdGhlcmUKaXMgbm8gc3VjaCB0aGluZyBvbiBQVkgsIEkgc2ltcGx5
IGFsbG9jYXRlIHNvbWUgbWVtb3J5IGZvciBpdCwgd2l0aApBbGxvY2F0ZVJlc2VydmVkUGFnZXMo
KSB3aGljaCBtZWFuIGFsbG9jYXRlIHNvbWUgcGFnZXMgYW5kIHRlbGwgdGhlIE9TCnRvIG5vdCB0
b3VjaCB0aGVtLgoKV2UgY291bGQgZGVhbGxvY2F0ZSB0aGVzZSBwYWdlcyBhbmQgZ2l2ZSB0aGVt
IGJhY2sgdG8gdGhlIE9TIGJ1dCB0aGF0CndvdWxkIG5lZWQgc29tZSByZWZhY3RvcmluZy4KCi0t
IApBbnRob255IFBFUkFSRAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
