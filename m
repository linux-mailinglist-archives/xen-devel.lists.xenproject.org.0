Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A09B4EA8F
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jun 2019 16:27:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1heKTv-0000HB-0K; Fri, 21 Jun 2019 14:25:35 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7rzm=UU=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1heKTs-0000GU-Sc
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2019 14:25:32 +0000
X-Inumbo-ID: 6c8c39ef-9430-11e9-8980-bc764e045a96
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 6c8c39ef-9430-11e9-8980-bc764e045a96;
 Fri, 21 Jun 2019 14:25:31 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@eu.citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@eu.citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@eu.citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: KtkkrOuWUyDs/qU86cFHmQy/jbeO3R9bj13ZPFGMpuZcYlPeeFrNMdw6itf/5YigqE7WF91xvs
 F0vcCp+d2m9DZNZhp8XJhN52XzCvvTDPa8tjWvgJ0bGG+fa7GsDSUwOtGvWDzjCo1l9CtS6aly
 2qVDsXfsoNHa2e4OEclwsQXDZybcpBMdhfOgRsZQt2wKTW1YoenJogiRpFyJVRrfs/scDep2cz
 x2Cu3l3tJfVZ6Dftp5KLLkEJpO4YrLteWZteeJ6a/PxaTPWDkHX3bQdAw4USsI8b6ii09TpyMM
 g44=
X-SBRS: 2.7
X-MesageID: 2062303
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,400,1557201600"; 
   d="scan'208";a="2062303"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 21 Jun 2019 15:22:57 +0100
Message-ID: <20190621142258.1543-8-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190621142258.1543-1-ian.jackson@eu.citrix.com>
References: <20190621142258.1543-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH v2 7/8] mg-repro-setup: actually accept
 --rebuild -rVAR=VALUE
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIGdsb2Igc3ludGF4IGhlcmUgd2FzIHdyb25nLCBhbmQgdGhlIGNvZGUgY3MtYWRqdXN0LWZs
aWdodCBkaWQgbm90CmhhbmRsZSBpdCBwcm9wZXJseSBlaXRoZXIuICBTbyAtLXJlYnVpbGQgLXIg
aGFzIG5vdCB3b3JrZWQgc2luY2UgaXQKZmlyc3QgYXBwZWFyZWQgaW46CiAgIGExZTBlNTg0NmY3
YmI3ZDgyYTVkYjFkN2NkNjQzYjlmNWNhMWI5YTkKICAgbWctcmVwcm8tZmxpZ2h0OiBQcm92aWRl
IC0tcmVidWlsZCB0byBtYWtlIHZhcmlhbnQgYnVpbGQgam9icwoKU2lnbmVkLW9mZi1ieTogSWFu
IEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Ci0tLQp2MjogTmV3IHBhdGNoCi0t
LQogY3MtYWRqdXN0LWZsaWdodCB8IDIgKy0KIG1nLXJlcHJvLXNldHVwICAgfCAyICstCiAyIGZp
bGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9jcy1hZGp1c3QtZmxpZ2h0IGIvY3MtYWRqdXN0LWZsaWdodAppbmRleCA1YmU1YWYzOC4uYWUz
NDI1MDYgMTAwNzU1Ci0tLSBhL2NzLWFkanVzdC1mbGlnaHQKKysrIGIvY3MtYWRqdXN0LWZsaWdo
dApAQCAtNDg1LDcgKzQ4NSw3IEBAIHN1YiBjaGFuZ2VfX3JlcHJvX2J1aWxkam9icyB7CiAgICAg
bXkgQHJlZnNwZWNzOwogICAgIG15IEB2YXJzcGVjczsKICAgICBteSAldHJlZXNwZWNzOwotICAg
IHdoaWxlIChAY2hhbmdlcyAmJiAkY2hhbmdlc1swXSA9fiBtL15bLj0rXS8pIHsKKyAgICB3aGls
ZSAoQGNoYW5nZXMgJiYgJGNoYW5nZXNbMF0gPX4gbS9eWy49K118Xi1yLykgewogCWxvY2FsICRf
ID0gc2hpZnQgQGNoYW5nZXM7CiAJaWYgKG0vXlsuPV0vKSB7CiAJICAgIHB1c2ggQHJlZnNwZWNz
LCAkXzsKZGlmZiAtLWdpdCBhL21nLXJlcHJvLXNldHVwIGIvbWctcmVwcm8tc2V0dXAKaW5kZXgg
YjU1ZjAyMWUuLjNjZWI3MDMyIDEwMDc1NQotLS0gYS9tZy1yZXByby1zZXR1cAorKysgYi9tZy1y
ZXByby1zZXR1cApAQCAtMTg3LDcgKzE4Nyw3IEBAIHdoaWxlIFsgJCMgLW5lIDAgXTsgZG8KIAkJ
cmVidWlsZF9zcGVjcz0oKQogCQl3aGlsZSB0cnVlOyBkbwogCQkJY2FzZSAiJDEiIGluCi0JCQlb
Lj0rXSp8LXIpIHJlYnVpbGRfc3BlY3MrPSgiJDEiKTsgICAgICAgc2hpZnQgOzsKKwkJCVsuPStd
KnwtciopIHJlYnVpbGRfc3BlY3MrPSgiJDEiKTsgICAgICBzaGlmdCA7OwogCQkgICAgICAgIC1C
PyopCXJlYnVpbGRzX2JsZXNzaW5nPSR7MSMtQn07ICAgICAgc2hpZnQgOzsKIAkJCS0qKQliYWR1
c2FnZSAnOiBiYWQgLS1yZWJ1aWxkIG9wdGlvbicgICAgIDs7CiAgICAgICAgICAgICAgICAgICAg
ICAgICAqKSAgICAgIGJyZWFrICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgOzsKLS0g
CjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
