Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF5486458
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2019 16:29:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvjOQ-000606-N1; Thu, 08 Aug 2019 14:27:50 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nHR3=WE=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hvjOO-0005zm-Rq
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2019 14:27:48 +0000
X-Inumbo-ID: b1768688-b9e8-11e9-8980-bc764e045a96
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id b1768688-b9e8-11e9-8980-bc764e045a96;
 Thu, 08 Aug 2019 14:27:47 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: o7Hyn1uQJw+4YzxQGj+Hr9iVVX+AHTV8qzanfYpS5c56Q4CLbG21V7USZSG/xwSZ7TdTPaZrVF
 jY8HMqJuHEJAheem4t1Wl2CsaZ3MTuG87QyzPtP/kaFnRokpMEUTUak1SZ+yvHSrtDcKovmlfU
 Q5dbxGcEtmMa0rewe2xKXLSPd2/82B3BYyQgtNRzgP971MyjlCgZ6Y0c9kZjJjdW1ZMm5psj6P
 oQfpdVBSaQhUcJ706/sCOUrdeq7Xes0m+ebC7UKsZY6v+HYEZyzi77l0HsmmSINF5/nudvnZO3
 qes=
X-SBRS: 2.7
X-MesageID: 4074016
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,361,1559534400"; 
   d="scan'208";a="4074016"
Date: Thu, 8 Aug 2019 15:03:48 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Message-ID: <20190808140348.GW1242@perard.uk.xensource.com>
References: <20190729153944.24239-1-anthony.perard@citrix.com>
 <20190729153944.24239-36-anthony.perard@citrix.com>
 <20190807160957.csgyplb6cqfen5ix@Air-de-Roger>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190807160957.csgyplb6cqfen5ix@Air-de-Roger>
User-Agent: Mutt/1.12.1 (2019-06-15)
Subject: Re: [Xen-devel] [edk2-devel] [PATCH v4 35/35] OvmfPkg/OvmfXen: use
 RealTimeClockRuntimeDxe from EmbeddedPkg
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

T24gV2VkLCBBdWcgMDcsIDIwMTkgYXQgMDY6MDk6NTdQTSArMDIwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiBPbiBNb24sIEp1bCAyOSwgMjAxOSBhdCAwNDozOTo0NFBNICswMTAwLCBBbnRo
b255IFBFUkFSRCB3cm90ZToKPiA+IEEgWGVuIFBWSCBndWVzdCBkb2Vzbid0IGhhdmUgYSBSVEMg
dGhhdCBPVk1GIHdvdWxkIGV4cGVjdCwgc28KPiA+IFBjYXRSZWFsVGltZUNsb2NrUnVudGltZUR4
ZSBmYWlscyB0byBpbml0aWFsaXplIGFuZCBwcmV2ZW50IHRoZQo+ID4gZmlybXdhcmUgZnJvbSBm
aW5pc2ggdG8gYm9vdC4gVG8gcHJldmVudCB0aGF0LCB3ZSB3aWxsIHVzZQo+ID4gWGVuUmVhbFRp
bWVDbG9ja0xpYiB3aGljaCBzaW1wbHkgYWx3YXlzIHJldHVybiB0aGUgc2FtZSB0aW1lLgo+ID4g
VGhpcyB3aWxsIHdvcmsgb24gYm90aCBYZW4gUFZIIGFuZCBIVk0gZ3Vlc3RzLgo+IAo+IE5vdCB0
aGF0IHRoaXMgaXMgbm90IGNvcnJlY3QsIGJ1dCB3aGF0J3MgdGhlIHBvaW50IGluIHJlcXVpcmlu
ZyBhCj4gY2xvY2sgaWYgaXQgY2FuIGJlIGZha2VkIGJ5IGFsd2F5cyByZXR1cm5pbmcgdGhlIHNh
bWUgdmFsdWU/CgpJdCdzIG5vdCBhIGNsb2NrIHRoYXQgaXMgcmVxdWlyZWQsIGl0IGlzIGEgbGli
cmFyeSB0aGF0IGltcGxlbWVudHMKUmVhbFRpbWVDbG9ja0xpYi4gU29tZXRoaW5nIG5lZWRzIGl0
LCBzbyBpdCBpcyBwcm92aWRlZCwgZXZlbiBpZiBpdCBpcwpvbmx5IHRvIGRpc3BsYXkgdGhlICJj
dXJyZW50IHRpbWUiLgoKPiBJdCBzZWVtcyBsaWtlIGl0J3MgdXNhZ2UgaXMgbm90IHJlYWxseSBy
ZXF1aXJlZCwgYW5kIGNvdWxkIGluZGVlZCBiZQo+IGRyb3BwZWQgYWx0b2dldGhlcj8KCldheSB0
byBtdWNoIHdvcmsgdG8gZHJvcCBpdC4gQWxzbywgSSBkb24ndCB3b3JrIHRvIGZvcmsgT1ZNRi4K
ClRoZSBBUk0gaW1wbGVtZW50YXRpb24gb2YgT1ZNRiBmb3IgWGVuIGRvZXMgdGhlIHNhbWUgdGhp
bmcgYW5kIHNpbXBseQphbHdheXMgcmV0dXJuIHRoZSBzYW1lIHZhbHVlLgoKPiBBbHRlcm5hdGl2
ZWx5LCB0aGVyZSdzIHRoZSBQViBjbG9jayB3aGljaCBpcyBhdmFpbGFibGUgdG8gUFZIIGd1ZXN0
cwo+IGFuZCB3aWxsIHJldHVybiBhIHByb3BlciB0aW1lLgoKV2UgbWlnaHQgbmVlZCB0byBkbyB0
aGF0IG9uZSBkYXkgSSBndWVzcywgYnV0IHJpZ2h0IG5vdyBpdCBpcyBqdXN0IGEKbmljZSB0byBo
YXZlLgoKVGhhbmtzLAoKLS0gCkFudGhvbnkgUEVSQVJECgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
