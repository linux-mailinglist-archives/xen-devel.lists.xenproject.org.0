Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D88AF6BA07
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jul 2019 12:24:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hnh4c-0008Np-Hy; Wed, 17 Jul 2019 10:22:10 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Q+i/=VO=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hnh4b-0008Ni-BY
 for xen-devel@lists.xenproject.org; Wed, 17 Jul 2019 10:22:09 +0000
X-Inumbo-ID: bae274dc-a87c-11e9-8980-bc764e045a96
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id bae274dc-a87c-11e9-8980-bc764e045a96;
 Wed, 17 Jul 2019 10:22:08 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: WTchaHk3itBnn88pPSJJYiNUmjhW4tqi2hsgIc+svtoFJacZ7Y5XbSFBanpNw19JiUK7jEd4AA
 NiPkhp6tc7XMxKvaBw82C8LmkDhVNsdAT7fLrMzBakxycF5Wq6SAiGtQOouMrUmX0eF3WFQUMH
 n5vyyQa6RcZumE0kfvieI9uku6dDdT3KUdEMctqgtDUCxBn+dhx0t9AMeL0MzIuKzFSxjaTe87
 7aDJxN/3XIoOETDyfITSzxy8ye8GQKZJSgMTUEU1sai7EFXxo/E0xg37wmtLiyknxKedgXhKNN
 lbQ=
X-SBRS: 2.7
X-MesageID: 3101113
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,274,1559534400"; 
   d="scan'208";a="3101113"
Date: Wed, 17 Jul 2019 12:21:58 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Message-ID: <20190717102158.y3cp34q7blfslntt@Air-de-Roger.citrite.net>
References: <cover.537da3804adbe71352bed871578f3e893e2210c5.1563325215.git-series.marmarek@invisiblethingslab.com>
 <5c8fb8141c0f92ccaa78cdc169b8544f7634ce65.1563325215.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5c8fb8141c0f92ccaa78cdc169b8544f7634ce65.1563325215.git-series.marmarek@invisiblethingslab.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v5 6/6] tools/libxc: add wrapper for
 PHYSDEVOP_msi_control
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
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBKdWwgMTcsIDIwMTkgYXQgMDM6MDA6NDRBTSArMDIwMCwgTWFyZWsgTWFyY3p5a293
c2tpLUfDs3JlY2tpIHdyb3RlOgo+IEFkZCBsaWJ4YyB3cmFwcGVyIGZvciBQSFlTREVWT1BfbXNp
X2NvbnRyb2wgaW50cm9kdWNlZCBpbiBwcmV2aW91cwo+IGNvbW1pdC4KPiAKPiBTaWduZWQtb2Zm
LWJ5OiBNYXJlayBNYXJjenlrb3dza2ktR8OzcmVja2kgPG1hcm1hcmVrQGludmlzaWJsZXRoaW5n
c2xhYi5jb20+CgpMR1RNLCBhbGJlaXQgSSBmaW5kIHRoZSB1c2FnZSBvZiBpbnQgaW5zdGVhZCBv
ZiB1bnNpZ25lZCBpbnQgZm9yIHRoZQpTQkRGIGtpbmQgb2Ygd2VpcmQsIGJ1dCBpdCdzIGlubGlu
ZSB3aXRoIHRoZSBvdGhlciBmdW5jdGlvbnMsIHNvIEkKZ3Vlc3MgdGhlcmUncyBhIHJlYXNvbiBm
b3IgaXQ/CgpJIGFzc3VtZSB0aGlzIHdpbGwgYmUgdXNlZCBieSBhbiB1cGNvbWluZyBRRU1VIHBh
dGNoPwoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
