Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73EB584FA2
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 17:17:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvNeI-00050x-V0; Wed, 07 Aug 2019 15:14:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=K7BD=WD=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hvNeH-00050o-NR
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 15:14:45 +0000
X-Inumbo-ID: 1599eeb0-b926-11e9-b42e-bfd99413b89f
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1599eeb0-b926-11e9-b42e-bfd99413b89f;
 Wed, 07 Aug 2019 15:14:43 +0000 (UTC)
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
IronPort-SDR: eslvFncdQNiTz1iALEXporG2OrqvEAMo1usxPx27zB5ObgskD/uMhGNKmkhwy7NLYvu2ve2uCZ
 FGl5J4iZNUna988UU0K/IV1899ih73ASxuRuanmI9yr8EV0NUroSV3aWehJLqG8Fo5Z6vT5R25
 A/l5l3V4/LgDKcvkOFSOn5fxlckTfVbzPiNAqwhtGmT3WmLdF40BRyfAlzpvGMJ7W+SWfayQZ5
 L2i2lc5i/zSkpf6ZuPR3Ru9zCnbB7As1nQQrD0QKqC5iSjoYAgBCDXgX4EJt/WEWgl2Os/9wvG
 NL4=
X-SBRS: 2.7
X-MesageID: 4116605
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,357,1559534400"; 
   d="scan'208";a="4116605"
Date: Wed, 7 Aug 2019 17:14:33 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: <devel@edk2.groups.io>, <anthony.perard@citrix.com>
Message-ID: <20190807150849.b6alhjw2lgcjpmxx@Air-de-Roger>
References: <20190729153944.24239-1-anthony.perard@citrix.com>
 <20190729153944.24239-23-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190729153944.24239-23-anthony.perard@citrix.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien.grall@arm.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>, Laszlo Ersek <lersek@redhat.com>,
 Jordan Justen <jordan.l.justen@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBKdWwgMjksIDIwMTkgYXQgMDQ6Mzk6MzFQTSArMDEwMCwgQW50aG9ueSBQRVJBUkQg
d3JvdGU6Cj4gV2hlbiB0aGUgWGVuIFBWSCBlbnRyeSBwb2ludCBoYXMgYmVlbiB1c2VkLCBodm1s
b2FkZXIgaGFzbid0IHJ1biBhbmQKPiBoYXNuJ3QgcHJlcGFyZWQgYW4gRTgyMCB0YWJsZS4gVGhl
IG9ubHkgd2F5IGxlZnQgdG8gZ2V0IGFuIEU4MjAgdGFibGUKPiBpcyB0byBhc2sgWGVuIHZpYSBh
biBoeXBlcmNhbGwsIHRoZSBjYWxsIGNhbiBvbmx5IGJlIG1hZGUgb25jZSBzbyBrZWVwCj4gdGhl
IHJlc3VsdCBjYWNoZWQgZm9yIGxhdGVyLgoKSSB0aGluayB3ZSBhZ3JlZWQgdGhhdCB0aGUgYWJv
dmUgaXMgbm90IHRydWUsIGFuZCB0aGF0IHRoZSBtZW1vcnkKbWFwIGNhbiBiZSBmZXRjaGVkIGFz
IG1hbnkgdGltZXMgYXMgZGVzaXJlZCB1c2luZyB0aGUgaHlwZXJjYWxsCmludGVyZmFjZS4KClRo
YW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
