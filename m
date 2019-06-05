Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B8935ACA
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jun 2019 13:00:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYTc1-0008Dm-Fw; Wed, 05 Jun 2019 10:57:45 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ONy6=UE=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hYTbz-0008Dh-7S
 for xen-devel@lists.xenproject.org; Wed, 05 Jun 2019 10:57:43 +0000
X-Inumbo-ID: bdc3d6c3-8780-11e9-8980-bc764e045a96
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id bdc3d6c3-8780-11e9-8980-bc764e045a96;
 Wed, 05 Jun 2019 10:57:42 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=23.29.105.83; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 23.29.105.83 as
 permitted sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.50 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=23.29.105.83; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: XdgrBC3bQ/QwGEziuL8cbsduFvDcfi63PsNnzweh0hJ0xOOO8Bpd1kUr0bWaXf+z3CFZ1F8cvP
 kbKh5KlNYhZZRIjKt9ivHVB7/L4jeiF2cT+HTMlYZS3jJ0e/mCl5cR2cFgxNJ11UUNLkAZ1t4t
 oxxXI5U+q/LgaxdNHqyZup8jyitBh6HaR0tRZjriliZ3AnOnpDt2QNjtGvAe97gN/6QovrfzGS
 6NuFEJ8Sq0E7MjLVnxY9jlaDEMVyPfysL3ckQLowxy2ej1Z07pKxxJPQL923+o+C74KwbnIGjL
 Y1U=
X-SBRS: 2.7
X-MesageID: 1348391
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,550,1549947600"; 
   d="scan'208";a="1348391"
Date: Wed, 5 Jun 2019 11:57:27 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20190605105727.GI2126@perard.uk.xensource.com>
References: <5CF67A2A0200007800235235@prv1-mh.provo.novell.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5CF67A2A0200007800235235@prv1-mh.provo.novell.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Subject: Re: [Xen-devel] 4.10.4 preparations
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 Lars Kurth <lars.kurth@xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBKdW4gMDQsIDIwMTkgYXQgMDg6MDM6MjJBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gd2hpbGUgNC4xMS4yIHN0aWxsIHN1ZmZlcnMgZGVsYXlzLCA0LjEwLjQgaXMgYWJvdXQg
ZHVlIG5vdyBhcyB3ZWxsLgo+IFBsZWFzZSBwb2ludCBvdXQgYmFja3BvcnRzIHlvdSBmaW5kIG1p
c3NpbmcgZnJvbSBpdHMgc3RhZ2luZyB0cmVlLgo+IEkgaGF2ZSB0aGVzZSB0d28gYWxyZWFkeSBx
dWV1ZWQKCkphbiwganVzdCB0byBsZXQgeW91IGtub3csIEknbSBwcm9iYWJseSBnb2luZyB0byBh
cHBseSBhIHBhdGNoIHRvIHRoZQpxZW11LXhlbiB0cmVlOgpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMTktMDUvbXNnMDE4NDAuaHRtbAoKLS0g
CkFudGhvbnkgUEVSQVJECgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
