Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB2F4C8CB
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jun 2019 09:59:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdrvq-0001d8-Jb; Thu, 20 Jun 2019 07:56:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jelc=UT=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hdrvp-0001d2-DH
 for xen-devel@lists.xenproject.org; Thu, 20 Jun 2019 07:56:29 +0000
X-Inumbo-ID: e4eb7e2a-9330-11e9-aae2-538708393b38
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e4eb7e2a-9330-11e9-aae2-538708393b38;
 Thu, 20 Jun 2019 07:56:22 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: efijoiWDbLjaBASh7W3b5+FjLci/3j7nux5fLfQBBNbpxuh3bl566KohA/EB1iML30rp6noWGl
 QysypWv3K1UHgaFex4NpfI9u7C2mZ7thmzUplLuySolRN+yVB+fGoLTT+NW2mzhhbgF+elYmRt
 s3xyyDKQGoiNAD7MdwZUzZ8SL1vcGYE+yyhxvHaRZM559JrOM4Nw1lRd0Phs4CF79c0HnjwFil
 hkQx2itl0qFlapdosH9i76B+XhcQxGB1Pp0aFQY0sq/FYO20ERA6eKX5j1s5znd+97T0E5TNx1
 qBQ=
X-SBRS: 2.7
X-MesageID: 1979855
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,396,1557201600"; 
   d="scan'208";a="1979855"
Date: Thu, 20 Jun 2019 09:56:00 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Petre Pircalabu <ppircalabu@bitdefender.com>
Message-ID: <20190620075600.a7bxoumkgcsu2foo@MacBook-Air-de-Roger.local>
References: <1caa159ffc8abebbc92c56a41db631706212d409.1561014865.git.ppircalabu@bitdefender.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1caa159ffc8abebbc92c56a41db631706212d409.1561014865.git.ppircalabu@bitdefender.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH] MAINTAINERS: Add myself as reviewer for
 vm_event
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
Cc: tamas@tklengyel.com, Wei Liu <wl@xen.org>, rcojocaru@bitdefender.com,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBKdW4gMjAsIDIwMTkgYXQgMTA6MTc6NDZBTSArMDMwMCwgUGV0cmUgUGlyY2FsYWJ1
IHdyb3RlOgo+IFNpZ25lZC1vZmYtYnk6IFBldHJlIFBpcmNhbGFidSA8cHBpcmNhbGFidUBiaXRk
ZWZlbmRlci5jb20+Cj4gLS0tCj4gIE1BSU5UQUlORVJTIHwgMSArCj4gIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKQo+IAo+IGRpZmYgLS1naXQgYS9NQUlOVEFJTkVSUyBiL01BSU5UQUlO
RVJTCj4gaW5kZXggYWIzMmU3Zi4uMDE1MTYyNSAxMDA2NDQKPiAtLS0gYS9NQUlOVEFJTkVSUwo+
ICsrKyBiL01BSU5UQUlORVJTCj4gQEAgLTQxMiw2ICs0MTIsNyBAQCBGOgl1bm1vZGlmaWVkX2Ry
aXZlcnMvbGludXgtMi42Lwo+ICAKPiAgVk0gRVZFTlQsIE1FTSBBQ0NFU1MgYW5kIE1PTklUT1IK
PiAgTToJUmF6dmFuIENvam9jYXJ1IDxyY29qb2NhcnVAYml0ZGVmZW5kZXIuY29tPgo+ICtSOglQ
ZXRyZSBQaXJjYWxhYnUgPHBwaXJjYWxhYnVAYml0ZGVmZW5kZXIuY29tPgo+ICBNOglUYW1hcyBL
IExlbmd5ZWwgPHRhbWFzQHRrbGVuZ3llbC5jb20+CgpJIHdvdWxkIHBsYWNlIHRoZSBhZGRpdGlv
biBhZnRlciB0aGUgbGlzdCBvZiBNKGFpbnRhaW5lcnMpLgoKUm9nZXIuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
