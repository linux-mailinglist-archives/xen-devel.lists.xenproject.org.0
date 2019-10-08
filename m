Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0158CCF531
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2019 10:42:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iHl1g-0003fQ-W9; Tue, 08 Oct 2019 08:39:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pQDQ=YB=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iHl1f-0003fK-Rl
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2019 08:39:23 +0000
X-Inumbo-ID: 2090a28a-e9a7-11e9-80e3-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2090a28a-e9a7-11e9-80e3-bc764e2007e4;
 Tue, 08 Oct 2019 08:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1570523962;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=PDsqgQ8Jcf7ELhiR/3WiLTmzWrVKLOE/l+3zfBz4U/4=;
 b=J/Qfl5auDUd3C2xK4ZM0u2P9M64Qb1p4iAVyt8l+MHEyIb6DckrtzRmN
 TnyPkOCsFGZYtGlgEimYpYPB6du+/aLBJa1QhdTRZQxNhfV8QKrMF1CC6
 fdHDSJcp0aMlIYOaPKOewDffnT8LZC91tQrZxzd1XABhw5izQ1DcZz1mE E=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Mopoco42fgHQ1N3WYH45Qy54zVpbMdgpkC/eB1HeDggV7kMgd7hfEIj3Kxv6ntXfYt+moi2zlM
 5CvAbe/sZZs3x08klYgc2+N1BqMqXhcqu0A47qjUVWZZSa0Wx53XDeLCYi3wv4ggze6P2qjBiw
 35xsbkSX44O6j7s01NHhXkX4wA1V62kN5B04cLpfiPPCS8u0h6RhqHAi99Hnl16fFkVyi8qJX4
 RHM672/Ywao9MoNKgNU64Dy6FYqQz5TAK9j/u8NMli4IZgTsczalkaOfOyVvgDpC7YfuSMdymM
 bF8=
X-SBRS: 2.7
X-MesageID: 6851687
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,270,1566878400"; 
   d="scan'208";a="6851687"
Date: Tue, 8 Oct 2019 10:39:11 +0200
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: tosher 1 <akm2tosher@yahoo.com>
Message-ID: <20191008083911.GA66437@Air-de-Roger>
References: <1285554440.4009671.1570271711943.ref@mail.yahoo.com>
 <1285554440.4009671.1570271711943@mail.yahoo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1285554440.4009671.1570271711943@mail.yahoo.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] How PV frontend and backend initializes?
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

T24gU2F0LCBPY3QgMDUsIDIwMTkgYXQgMTA6MzU6MTFBTSArMDAwMCwgdG9zaGVyIDEgd3JvdGU6
Cj4gSSB3YXMgdHJ5aW5nIHRvIHVuZGVyc3RhbmQgdGhlIGZvbGxvd2luZyB0aGluZ3MgcmVnYXJk
aW5nIHRoZSBQViBkcml2ZXIuCj4gCj4gMS4gV2hvIGNyZWF0ZSBmcm9udGVuZCBhbmQgYmFja2Vu
ZCBpbnN0YW5jZXM/CgpUaGF0IGRlcGVuZHMgb24gd2hlcmUgdGhlIGZyb250ZW5kIGFuZCBiYWNr
ZW5kcyBydW4uIEZvciBleGFtcGxlCkxpbnV4IGJsa2JhY2sgaXMgaW1wbGVtZW50ZWQgYXMgYSBt
b2R1bGUgb2YgdGhlIExpbnV4IGtlcm5lbC4gTGludXgKYmxrZnJvbnQgaXMgYWxzbyBhIExpbnV4
IGtlcm5lbCBtb2R1bGUuIE9UT0ggdGhlcmUncyBhbHNvIGEgYmxvY2sKYmFja2VuZCBpbiBRRU1V
IGNhbGxlZCBxZGlzaywgd2hpY2ggaXMgb2J2aW91c2x5IGltcGxlbWVudGVkIGluIFFFTVUuCgpJ
J20gaG93ZXZlciB1bnN1cmUgYnkgd2hhdCB5b3UgbWVhbiB3aXRoIGluc3RhbmNlLCBzbyB5b3Ug
bWlnaHQgaGF2ZQp0byBjbGFyaWZ5IGV4YWN0bHkgd2hhdCB5b3UgbWVhbiBpbiBvcmRlciB0byBn
ZXQgYSBtb3JlIGNvbmNpc2UKcmVwbHkuCgo+IDIuIFdoZW4gYXJlIHRoZXNlIGluc3RhbmNlcyBj
cmVhdGVkPwoKVGhlIHhlbnN0b3JlIGVudHJpZXMgYXJlIGNyZWF0ZWQgYXQgZG9tYWluIGNyZWF0
aW9uIGJ5IHRoZSB0b29sc3RhY2sKKHhsL2xpYnhsKS4gVGhlIGNvbm5lY3Rpb24gYmV0d2VlbiB0
aGUgZnJvbnRlbmQgYW5kIHRoZSBiYWNrZW5kCmhhcHBlbnMgd2hlbiB0aGUgZnJvbnRlbmQgZHJp
dmVyIGxvYWRzIGFuZCBpbml0aWFsaXplcyB0aGUgY29ubmVjdGlvbi4KCj4gMy4gSG93IHhlbmJ1
cyBkaXJlY3RvcmllcyBhcmUgY3JlYXRlZD8gV2hhdCBpcyB0aGUgaGllcmFyY2h5IG9mIHRoZSBk
aXJlY3Rvcmllcz8gCgpUaGV5IGFyZSBjcmVhdGVkIGJ5IHRoZSB0b29sc3RhY2sgZHVyaW5nIGRv
bWFpbiBjcmVhdGlvbjogeGwvbGlieGwuClRoZXJlIGFyZSBkb2N1bWVudHMgaW4gdGhlIHB1Ymxp
YyBoZWFkZXJzIHRoYXQgZGVzY3JpYmUgdGhlIGV4cGVjdGVkCmFuZCBvcHRpb25hbCB4ZW5zdG9y
ZSBub2RlcyBmb3IgZWFjaCBkZXZpY2UsIHNlZToKCmh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0
d2ViLz9wPXhlbi5naXQ7YT10cmVlO2Y9eGVuL2luY2x1ZGUvcHVibGljL2lvCgo+IDQuIFdoYXQg
aXMgdGhlIHJvbGUgb2YgInZpZm5hbWUiIGFuZCB3aG8gc2V0cyBpdD8KClRoYXQncyBzZXQgaW4g
dGhlIGd1ZXN0IGNvbmZpZyBmaWxlIFswXSBhbmQgdGhlbiBpdCdzIHRoZSBob3RwbHVnCnNjcmlw
dCB0aGUgb25lIGluIGNoYXJnZSBvZiByZW5hbWluZyB0aGUgaW50ZXJmYWNlIGZyb20gaXQncyBv
cmlnaW5hbApuYW1lIGludG8gdGhlIGRlc2lyZWQgb25lIFsxXS4KClJvZ2VyLgoKWzBdIGh0dHBz
Oi8veGVuYml0cy54ZW4ub3JnL2RvY3MvdW5zdGFibGUvbWFuL3hsLW5ldHdvcmstY29uZmlndXJh
dGlvbi41Lmh0bWwjdmlmbmFtZQpbMV0gaHR0cDovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWIvP3A9
eGVuLmdpdDthPWJsb2I7Zj10b29scy9ob3RwbHVnL0xpbnV4L3ZpZi1jb21tb24uc2gjbDY3Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
