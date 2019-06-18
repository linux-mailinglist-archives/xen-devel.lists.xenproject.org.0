Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E5149EEE
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jun 2019 13:08:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdBvw-0007dn-1e; Tue, 18 Jun 2019 11:05:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=OpMR=UR=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hdBvt-0007dd-Vi
 for xen-devel@lists.xenproject.org; Tue, 18 Jun 2019 11:05:46 +0000
X-Inumbo-ID: 03a06c96-91b9-11e9-9499-fb65ae1ae088
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 03a06c96-91b9-11e9-9499-fb65ae1ae088;
 Tue, 18 Jun 2019 11:05:43 +0000 (UTC)
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
IronPort-SDR: yOf2JCTLJ89OKHJ43HTpsi8I9Po4T9qYhdCQoF2YrJdA9v6wcM/LZEe/DfG6tGBzyg6T2iyARg
 YunR3U258yyKwJO92ah2GpPIhWFc7zw6jiMl4hfHrv5333r88P63SY3T/VxtYQBQwWiMWTyxuk
 oPRltrRnRoML+xTJWh0C5YvokJ5xoqdd099ga9191uWYYYYuH5woFDve4Sp490gUWTMBTcadIz
 ZbkqYckg5sNAuP2pnb+aLyI3GdbfmDu+xHYVKTFpYgv8hKn06Mq2MdFaFd/hOYTJXwOXn3ednG
 KV4=
X-SBRS: 2.7
X-MesageID: 1864440
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,389,1557201600"; 
   d="scan'208";a="1864440"
Date: Tue, 18 Jun 2019 12:05:40 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Paul Durrant <Paul.Durrant@citrix.com>
Message-ID: <20190618110540.GC13449@perard.uk.xensource.com>
References: <20190617154105.32323-1-anthony.perard@citrix.com>
 <20190617154105.32323-4-anthony.perard@citrix.com>
 <21258fd1788f418bb1a0007a43bf0250@AMSPEX02CL03.citrite.net>
 <20190617164544.GA13449@perard.uk.xensource.com>
 <20190617171913.GA15926@perard.uk.xensource.com>
 <17fc272d31cc4e95baa3ec68a90557d1@AMSPEX02CL03.citrite.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <17fc272d31cc4e95baa3ec68a90557d1@AMSPEX02CL03.citrite.net>
User-Agent: Mutt/1.12.1 (2019-06-15)
Subject: Re: [Xen-devel] [PATCH 3/4] xen: Import Xen public headers used by
 xen-hvm.c
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
 Stefano Stabellini <sstabellini@kernel.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBKdW4gMTgsIDIwMTkgYXQgMDg6NTU6NTNBTSArMDEwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPiA+IEZyb206IEFudGhvbnkgUEVS
QVJEIFttYWlsdG86YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbV0KPiA+IAo+ID4gT24gTW9uLCBK
dW4gMTcsIDIwMTkgYXQgMDU6NDU6NDRQTSArMDEwMCwgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4g
PiA+IE9uIE1vbiwgSnVuIDE3LCAyMDE5IGF0IDA1OjE1OjUxUE0gKzAxMDAsIFBhdWwgRHVycmFu
dCB3cm90ZToKPiA+ID4gPiBBRkFJQ1QgdGhlIG9ubHkgcGxhY2UgKGFwYXJ0IGZyb20gbGVnYWN5
IGNvZGUgaW4geGVuX2NvbW1vbi5oKSB0aGF0Cj4gPiA+ID4gcGFyYW1zLmggaXMgbmVjZXNzYXJ5
IGlzIGluIHhlbl9zdXNwZW5kX25vdGlmaWVyKCkuIEkgd29uZGVyIHdoZXRoZXIKPiA+ID4gPiB0
aGF0IHdvdWxkIGJlIGJldHRlciBtb3ZlZCBpbnRvIHhlbl9jb21tb24uaCB0b28gKHNpbmNlIGl0
J3MganVzdCBhCj4gPiA+ID4gd3JhcHBlciByb3VuZCB4Y19zZXRfaHZtX3BhcmFtKCkgYW5kIHRo
ZW4gdGhlIGluY2x1c2lvbiBvZiBwYXJhbXMuaAo+ID4gPiA+IGNhbiBiZSBtb3ZlZCB0aGVyZSBh
cyB3ZWxsLgo+ID4gPgo+ID4gPiA6KCwgSSBkaWRuJ3QgcmVhbGlzZWQgdGhhdCB4ZW5fY29tbW9u
LmggbmVlZGVkIHBhcmFtcy5oIHRvby4gVGhhdCBwYXRjaAo+ID4gPiBzZXJpZXMgbWlnaHQgbm90
IGJ1aWxkIG9uIG9sZGVyIHZlcnNpb24gb2YgWGVuLiBJJ2xsIG1vdmUgdGhlIGluY2x1c2lvbgo+
ID4gPiBvZiBwYXJhbXMuaCB0byB4ZW5fY29tbW9uLmgsIGFuZCBmaXggcGFyYW1zLmggdG8gaGF2
ZSBhbGwgdGhlIG5lZWRlZAo+ID4gPiAjZGVmaW5lcy4KPiA+IAo+ID4gQWN0dWFsbHksIGl0IHdv
cmtzIGZpbmUgd2l0aG91dCBpbmNsdWRpbmcgaHZtL3BhcmFtcy5oIGluIHhlbl9jb21tb24uaAo+
ID4gYmVjYXVzZSB4ZW5fY29tbW9uLmggaW5jbHVkZXMgeGVuY3RybC5oIHdoaWNoIGluY2x1ZGVz
IGh2bS9wYXJhbXMuaC4KPiA+IAo+ID4gU28gSSB0aGluayBpbnN0ZWFkIEknbGwgcmVtb3ZlIGFs
bCBpbmNsdWRlcyBvZiBwYXJhbXMuaCwgYmVjYXVzZQo+ID4gSFZNX1BBUkFNXyogYXJlIHBhcmFt
ZXRlcnMgZm9yIHhjX2h2bV9wYXJhbV97Z2V0LHNldH0sIHdoaWNoIGlzIGluIGEKPiA+IGxpYnJh
cnkgYW5kIG5vdCBhbiBpbnRlcmZhY2Ugd2l0aCBhIGd1ZXN0LiBJbmNsdWRpbmcgeGVuY3RybC5o
IHNob3VsZCBiZQo+ID4gZW5vdWdoLgo+IAo+IFRoZSBndWVzdC90b29scyBzZXBhcmF0aW9uIGlz
IG1lc3N5LiBpb3JlcS5oIGlzIGFsc28gYW4gaW50ZXJmYWNlIHdpdGgKPiBYZW4gYW5kIG5vdCB3
aXRoIGEgZ3Vlc3QsIHNvIHJlYWxseSBJIHRoaW5rIGl0IHNob3VsZCBiZSB0cmVhdGVkIHRoZQo+
IHNhbWUgd2F5IGFzIHBhcmFtcy5oLgoKWWVzLCBJJ2xsIGRyb3AgdGhpcyBwYXRjaCwgYW5kIHJl
cGxhY2UgaXQgd2l0aCBhIHBhdGNoIHRoYXQganVzdCByZW1vdmVzCmluY2x1ZGVzIG9mIHBhcmFt
cy5oLgoKPiBlODIwLmggaXMgcmVmZXJyaW5nIHRvIGd1ZXN0IG1lbW9yeSBsYXlvdXQsCj4gd2hp
Y2ggSU1PIHNob3VsZG4ndCByZWFsbHkgYmUgaGFyZGNvZGVkIGF0IGFsbC4KCkknbGwgbGVhdmUg
ZTgyMC5oIGluY2x1ZGUgYWxvbmUuCgotLSAKQW50aG9ueSBQRVJBUkQKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
