Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E1E20B5C
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2019 17:36:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRINl-0003ch-Nx; Thu, 16 May 2019 15:33:21 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=62Tc=TQ=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hRINk-0003cS-86
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 15:33:20 +0000
X-Inumbo-ID: ee6312cd-77ef-11e9-8980-bc764e045a96
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id ee6312cd-77ef-11e9-8980-bc764e045a96;
 Thu, 16 May 2019 15:33:19 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=SoftFail smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL02.citrite.net
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: SoftFail (esa6.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com is inclined to not designate
 23.29.105.83 as permitted sender) identity=mailfrom;
 client-ip=23.29.105.83; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 include:spf.citrix.com
 include:spf2.citrix.com include:ironport.citrix.com
 exists:%{i}._spf.mta.salesforce.com ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL02.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL02.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: RL6upYrUbJ4DtMnR9GJxBcLEa76TAtwi3b2Uf91A13NHs6lfF1coZ7gpnDNex+7QQ3DdBsl2+3
 qahfGv/FTCeWhDcf5B7Hb9MDfFz/hAEJcIqFdy4Muyu+phrRGliIyMZ33H7NgD9ycYboftoxHe
 NRu9pW41U5yMslvFZYb0kj7+T4mV9EoYSW6GUHtBefunlhiv7yvdwdTbW48vKP4GTagNuO8sVx
 HWVFBwGLPy3Cz9chYdrhutXIH1b0doeB1hKQPQu6zZrhCdRk2aFGVX53BgZbqjmAFwWKy9xUdY
 ku0=
X-SBRS: 2.7
X-MesageID: 513418
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,477,1549947600"; 
   d="scan'208";a="513418"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23773.33438.793653.418377@mariner.uk.xensource.com>
Date: Thu, 16 May 2019 16:32:46 +0100
To: Anthony PERARD <anthony.perard@citrix.com>
In-Reply-To: <20190516092917.GA5438@perard.uk.xensource.com>
References: <osstest-136177-mainreport@xen.org>
 <20190516092917.GA5438@perard.uk.xensource.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [qemu-upstream-4.12-testing test] 136177:
 regressions - FAIL
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW50aG9ueSBQRVJBUkQgd3JpdGVzICgiUmU6IFtYZW4tZGV2ZWxdIFtxZW11LXVwc3RyZWFtLTQu
MTItdGVzdGluZyB0ZXN0XSAxMzYxNzc6IHJlZ3Jlc3Npb25zIC0gRkFJTCIpOgo+IE9uIFdlZCwg
TWF5IDE1LCAyMDE5IGF0IDA0OjI4OjM1UE0gKzAwMDAsIG9zc3Rlc3Qgc2VydmljZSBvd25lciB3
cm90ZToKPiA+IGZsaWdodCAxMzYxNzcgcWVtdS11cHN0cmVhbS00LjEyLXRlc3RpbmcgcmVhbCBb
cmVhbF0KPiA+IGh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnByb2plY3Qub3JnL29zc3Rlc3QvbG9n
cy8xMzYxNzcvCj4gPiAKPiA+IFJlZ3Jlc3Npb25zIDotKAo+ID4gCj4gPiBUZXN0cyB3aGljaCBk
aWQgbm90IHN1Y2NlZWQgYW5kIGFyZSBibG9ja2luZywKPiA+IGluY2x1ZGluZyB0ZXN0cyB3aGlj
aCBjb3VsZCBub3QgYmUgcnVuOgo+ID4gIHRlc3QtYW1kNjQtYW1kNjQteGwtcWNvdzIgICAgMTcg
Z3Vlc3QtbG9jYWxtaWdyYXRlL3gxMCAgIGZhaWwgUkVHUi4gdnMuIDEzMzczNAo+ID4gCj4gPiBU
ZXN0cyB3aGljaCBhcmUgZmFpbGluZyBpbnRlcm1pdHRlbnRseSAobm90IGJsb2NraW5nKToKPiA+
ICB0ZXN0LWFtZDY0LWFtZDY0LXhsLXFjb3cyIDE2IGd1ZXN0LXNhdmVyZXN0b3JlLjIgZmFpbCBp
biAxMzYwNDcgcGFzcyBpbiAxMzYxNzcKPiA+ICB0ZXN0LWFybTY0LWFybTY0LXhsLWNyZWRpdDEg
IDE3IGd1ZXN0LXN0YXJ0LjIgICAgICAgICAgICAgIGZhaWwgcGFzcyBpbiAxMzYwNDcKPiAKPiBJ
YW4sIGNhbiB5b3UgZm9yY2UgcHVzaCB0aGlzPwoKVGhhbmtzIGZvciB0aGUgYW5hbHlzaXMuICBE
b25lLgoKSWFuLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
