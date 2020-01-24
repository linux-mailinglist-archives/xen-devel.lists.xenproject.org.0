Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C83147EC6
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jan 2020 11:33:06 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuwDg-00050r-EX; Fri, 24 Jan 2020 10:29:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9Huw=3N=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iuwDe-00050m-NH
 for xen-devel@lists.xenproject.org; Fri, 24 Jan 2020 10:29:42 +0000
X-Inumbo-ID: 6dffb244-3e94-11ea-bfa2-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6dffb244-3e94-11ea-bfa2-12813bfff9fa;
 Fri, 24 Jan 2020 10:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579861781;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=WEjUebwyDWReFX8Ko8fD2TSN/xd/USWTRYrRvMdpJsk=;
 b=FYEtRQENpSvRv9nF5NQAqGVr1Ha0oywRQyEPClCOphd5duf+fnw+C5fg
 1T29pbmyhEZ/qciNaDNYRejmYFzov6M+0aY3UXXpYqIwRmHdEDcvv2BCC
 snScH5Ba2kZkW8WcgE3UsHcwfVxzb3AQ1fi0QN8BuHvqTAjj9wZUPzP4o E=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: hO1gNiqOtfUxGB89Rib161dySb1vJ5BGGlKuuqqxltsunpkLk+Qhu8X65KKdQW4CTyDfCEIYHM
 Nyze1OpJZ3bLNgpyAvhfdYR6EP4SZprTMPRpgwdfiDG0D6z5QxIAmiDt555Li+WH0FB4pc+dOx
 53CCYosyUCyOxiJ22QBXZVVYPx4J+9K+JIH0FNdLEk24Hk9UQBH+eHN/AzedE4opnT50aulT1P
 PS8pMMAn+RSL9yqCS2/U427fTR42VE8jnsffStUWz+fexa+76v9jrhp8Fi0rgfMCXtTHAPJhF+
 N84=
X-SBRS: 2.7
X-MesageID: 11815153
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,357,1574139600"; d="scan'208";a="11815153"
Date: Fri, 24 Jan 2020 11:29:32 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: tosher 1 <akm2tosher@yahoo.com>
Message-ID: <20200124102932.GF57924@desktop-tdan49n.eng.citrite.net>
References: <1284035258.1445298.1579543677315.ref@mail.yahoo.com>
 <1284035258.1445298.1579543677315@mail.yahoo.com>
 <20200122012713.GB2995@mail-itl>
 <1699773700.2581218.1579712175340@mail.yahoo.com>
 <20200122190133.GS2507@mail-itl>
 <409698033.2707956.1579722613556@mail.yahoo.com>
 <20200122195831.GB1314@mail-itl>
 <972998214.522226.1579818994322@mail.yahoo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <972998214.522226.1579818994322@mail.yahoo.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] HVM Driver Domain
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?=
 <marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBKYW4gMjMsIDIwMjAgYXQgMTA6MzY6MzRQTSArMDAwMCwgdG9zaGVyIDEgd3JvdGU6
Cj4gCj4gCj4gSSB3YXNuJ3QgYWJsZSB0byBtYWtlIHRoZSBIVk0gZHJpdmVyIGRvbWFpbiB3b3Jr
IGV2ZW4gd2l0aCB0aGUgbGF0ZXN0IFhlbiB2ZXJzaW9uIHdoaWNoIGlzIDQuMTQuIEkgc2VlIHRo
ZSAneGVuZHJpdmVyZG9tYWluJyBleGVjdXRhYmxlIGluIHRoZSAvZXRjL2luaXQuZC8gZGlyZWN0
b3J5LCBidXQgaXQgZG9lc24ndCBzZWVtIHRvIGJlIHJ1bm5pbmcgaW4gdGhlIGJhY2tncm91bmQu
IAoKVGhlIGJhY2tncm91bmQgcHJvY2VzcyB3aWxsIGJlICd4bCBkZXZkJywgbm90IHhlbmRyaXZl
cmRvbWFpbiwgdGhhdCdzCmp1c3QgdGhlIGluaXQgc2NyaXB0IG5hbWUuCgpZb3UgY2FuIGFsc28g
c3RhcnQgeGwgZGV2ZCBtYW51YWxseSwgYXMgdGhhdCB3aWxsIGdpdmUgeW91IHZlcmJvc2UKb3V0
cHV0IG9mIHdoYXRzIGdvaW5nIG9uLiBJbiB0aGUgZHJpdmVyIGRvbWFpbjoKCiMga2lsbGFsbCB4
bAojwqB4bCAtdnZ2IGRldmQgLUYKClRoYXQgc2hvdWxkIGdpdmUgeW91IGRldGFpbGVkIG91dHB1
dCBvZiB3aGF0J3MgZ29pbmcgb24gaW4gdGhlIGRyaXZlcgpkb21haW4sIGNhbiB5b3UgcGFzdGUg
dGhlIG91dHB1dCB5b3UgZ2V0IGZyb20gdGhlIGRyaXZlciBkb21haW4gd2hlbgp5b3UgdHJ5IHRv
IHN0YXJ0IHRoZSBmYWlsZWQgZ3Vlc3Q/CgpSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
