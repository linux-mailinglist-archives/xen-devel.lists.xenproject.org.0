Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D96059854
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jun 2019 12:26:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hgo3G-0000Ju-Si; Fri, 28 Jun 2019 10:24:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ea7O=U3=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hgo3F-0000Jp-Dr
 for xen-devel@lists.xenproject.org; Fri, 28 Jun 2019 10:24:17 +0000
X-Inumbo-ID: e00813aa-998e-11e9-a44c-678d4a6da0f8
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e00813aa-998e-11e9-a44c-678d4a6da0f8;
 Fri, 28 Jun 2019 10:24:13 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: BbbKBUCPW/sRzyEBCmkU5q0we+3L02rLXAWWIL55Vczoq4uZhG5tYQCV/Q8+MiPTgqmSwEGNuA
 WSNndWkLKBRzaT65r+AQrPKrA7dXZiD8UVbrkqooxMFSb7k13WG2uVBq6DSpCt2ijr83Mibg61
 tqTzbBCKMebnyJaaq5nllN1NGiPiyQrUdf5GDfBPJuZuq8MlZUfELMDsBCUXKmuoMTbYgaAAOK
 zZAAfhl5hVEoaArUD9GbhtXo+hWofSKL3XsL2NuWk5k/qcyxY0V1uy3wNZrqAxgVTQWC9swyzy
 Ahg=
X-SBRS: 2.7
X-MesageID: 2367077
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,427,1557201600"; 
   d="scan'208";a="2367077"
Date: Fri, 28 Jun 2019 12:24:05 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20190628102405.4vscfkdad7jkkoow@MacBook-Air-de-Roger.local>
References: <8ad6ec1d-cfb5-bc9a-7d4c-716952fbf73f@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8ad6ec1d-cfb5-bc9a-7d4c-716952fbf73f@suse.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 2/5] kconfig: don't pass ARCH and SRCARCH on
 the sub-make call
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
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "wl@xen.org" <wl@xen.org>, "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "George.Dunlap@eu.citrix.com" <George.Dunlap@eu.citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "Ian.Jackson@eu.citrix.com" <Ian.Jackson@eu.citrix.com>,
 "tim@xen.org" <tim@xen.org>, "julien.grall@arm.com" <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBKdW4gMjgsIDIwMTkgYXQgMDk6NDA6NTlBTSArMDAwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gID4+PiBPbiAyNi4wNi4xOSBhdCAxNTo1NSwgPHJvZ2VyLnBhdUBjaXRyaXguY29tPiB3
cm90ZToKPiAgPiBhbmQgaW5zdGVhZCBleHBvcnQgdGhlbSBmcm9tIHRoZSB0b3AtbGV2ZWwgWGVu
IG1ha2VmaWxlLgo+IAo+IFdvdWxkIGJlIGhlbHBmdWwgdG8ga25vdyB3aGF0IHByb2JsZW0gdGhp
cyBzb2x2ZXMuIEFkZGluZwo+ICJyYW5kb20iIGV4cG9ydHMgX2Nhbl8gaGF2ZSB1bmRlc2lyYWJs
ZSBzaWRlIGVmZmVjdHMsIHNvIHdlCj4gc2hvdWxkbid0IG1ha2Ugc3VjaCBhIGNoYW5nZSB3aXRo
b3V0IHJlYXNvbi4KCkl0IHNvbHZlcyBoYXZpbmcgdG8gcGFzcyBBUkNIIGFuZCBTUkNBUkNIIGV4
cGxpY2l0bHkgdG8gdGhlIGtjb25maWcKY2FsbHMuIEkgY2FuIGxlYXZlIHRoaXMgb3V0IGluIHRo
ZSBuZXh0IHJvdW5kLCBzaW5jZSBpdCdzIG5vdCByZWxhdGVkCnRvIHRoZSB0b29sY2hhaW4gbWVz
cyB0aGF0IEknbSB0cnlpbmcgdG8gdW50YW5nbGUuCgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
