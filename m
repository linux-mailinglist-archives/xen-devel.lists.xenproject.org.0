Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABEE376332
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2019 12:10:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqx7c-0003kE-3P; Fri, 26 Jul 2019 10:06:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tvJk=VX=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hqx7a-0003k4-Ac
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2019 10:06:42 +0000
X-Inumbo-ID: 0e1bc214-af8d-11e9-9e21-ff4b17eeec48
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0e1bc214-af8d-11e9-9e21-ff4b17eeec48;
 Fri, 26 Jul 2019 10:06:37 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: LMY+5EBJnWusfbbYVZaJ4Gb7s6UHXhXl6LwJ5LbtPq42wNOqBA0chsyp0wP6tAArjscaLj7ZeC
 Q3XPLkbwqgnNH81GxF8+ULDYyMlb8onNofZ0S+FJhmlf5tBE6J9aXMTBsMVsuxe45ZYzqJUlqW
 /djCE4aLcrBPkN64Of9B7Bdl7XMAyBhEZixe5ZbvjUazhxhfsE1ZohAFU5mUZtxgGuPgWc4nbo
 VY6V/0D1Zt5wJhUoWdPxkIK9PPs8baknq+9f8RYYVye80lc1LharHKk3YCOVvS5tuAO6AIFfr2
 W6U=
X-SBRS: 2.7
X-MesageID: 3483105
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,310,1559534400"; 
   d="scan'208";a="3483105"
Date: Fri, 26 Jul 2019 11:06:34 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Dario Faggioli <dfaggioli@suse.com>
Message-ID: <20190726100634.GD1242@perard.uk.xensource.com>
References: <d206a5664c849747d4086f3fef9131f5bbf09ff8.camel@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d206a5664c849747d4086f3fef9131f5bbf09ff8.camel@suse.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Subject: Re: [Xen-devel] Failing to build qemu-xen (in dev-mtp.c) with GCC9
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
Cc: xen-devel@lists.xenproject.org, "Ian.Jackson" <Ian.Jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBKdWwgMjYsIDIwMTkgYXQgMDI6MjQ6MjNBTSArMDIwMCwgRGFyaW8gRmFnZ2lvbGkg
d3JvdGU6Cj4gSGV5LAoKSGksCgo+IG9wZW5TVVNFIFR1bWJsZXdlZWQgaGFzOiBnY2MgdmVyc2lv
biA5LjEuMSAyMDE5MDcwMwo+IAo+IEFuZCB0aGlzIGZhaWxzIHRvIGJ1aWxkIFFFTVUsIGxpa2Ug
dGhpczoKCkknbSBzb3JyeSBJIGhhdmUgdG8gYXNrLCB3aGljaCB2ZXJzaW9uIG9mIFFFTVUgb3Ig
cWVtdS14ZW4gYXJlIHNwZWFraW5nCmFib3V0PyBJJ20gcHJldHR5IHN1cmUgaXQncyB1bnN0YWJs
ZSwgYnV0IGl0J3MgYmV0dGVyIHRvIGFzayA6LSkuCgo+ICAgQ0MgICAgICBody93YXRjaGRvZy93
ZHRfaWI3MDAubwo+IC9idWlsZC90b29scy9xZW11LXhlbi1kaXIvaHcvdXNiL2Rldi1tdHAuYzog
SW4gZnVuY3Rpb24g4oCYdXNiX210cF93cml0ZV9tZXRhZGF0YeKAmToKPiAvYnVpbGQvdG9vbHMv
cWVtdS14ZW4tZGlyL2h3L3VzYi9kZXYtbXRwLmM6MTcxNTozNjogZXJyb3I6IHRha2luZyBhZGRy
ZXNzIG9mIHBhY2tlZCBtZW1iZXIgb2Yg4oCYc3RydWN0IDxhbm9ueW1vdXM+4oCZIG1heSByZXN1
bHQgaW4gYW4gdW5hbGlnbmVkIHBvaW50ZXIgdmFsdWUgWy1XZXJyb3I9YWRkcmVzcy1vZi1wYWNr
ZWQtbWVtYmVyXQo+ICAxNzE1IHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRhdGFzZXQt
PmZpbGVuYW1lKTsKPiAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB+fn5+fn5+
Xn5+fn5+fn5+fgo+IAo+IFRoaXMgc2VlbXMgdG8gYmUgZml4ZWQsIGZvciBtZSwgaWYgSSBhcHBs
eSB1cHN0cmVhbSBwYXRjaCAxMjU5ZjI3ZWMyCj4gKCJ1c2ItbXRwOiBmaXggYWxpZ25tZW50IG9m
IGFjY2VzcyBvZiBPYmplY3RJbmZvIGZpbGVuYW1lIGZpZWxkIikuCgpUaGFua3MsIEknbGwgcHJv
YmFibHkgYXBwbHkgdGhhdCB0byBxZW11LXhlbiB1bnN0YWJsZS4KCi0tIApBbnRob255IFBFUkFS
RAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
