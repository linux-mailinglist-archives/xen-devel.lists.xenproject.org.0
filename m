Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A58630A69
	for <lists+xen-devel@lfdr.de>; Fri, 31 May 2019 10:37:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hWcyp-0006GB-OK; Fri, 31 May 2019 08:33:39 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TvYf=T7=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hWcyo-0006G6-8a
 for xen-devel@lists.xenproject.org; Fri, 31 May 2019 08:33:38 +0000
X-Inumbo-ID: c8b7c3e7-837e-11e9-8980-bc764e045a96
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id c8b7c3e7-837e-11e9-8980-bc764e045a96;
 Fri, 31 May 2019 08:33:37 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL02.citrite.net
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 23.29.105.83 as permitted
 sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.50 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL02.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL02.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: oHJr4O1LMh1j2Hxdag75S6G4JgZK/ZQS3g2/mdd2OtvQKhoJnJPYB1Cp9Vszx5MNiwAo9ToNy5
 5xA0L+MDEtsT/iUbE2qf+tw6d3Xf7yCtKUyucsb/RDbpU/M4sK7POFttnlYvdhqOdZRNAZoqpN
 W4z0cDMCogAZ9fKHQ34znUm67YH7HXmjsmfKn5jWMhx4WOeYDHRngNnyAwRIZPfBgBbTNheXCQ
 r7VYd02IsVKIDS7iK986AwqheYLpTMjAlL0gB6x4yYsB+3Et3btivSveF+AlzBY17ZGhjbmOKn
 A4I=
X-SBRS: 2.7
X-MesageID: 1147372
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,534,1549947600"; 
   d="scan'208";a="1147372"
Date: Fri, 31 May 2019 10:33:25 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20190531083325.vtn2yd3yviljrp5n@Air-de-Roger>
References: <20190531081713.55596-1-roger.pau@citrix.com>
 <610891a5-c7a1-9a36-33f2-d3d07a513ddd@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <610891a5-c7a1-9a36-33f2-d3d07a513ddd@citrix.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v2] automation: add clang and lld 8 tests to
 gitlab
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
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, Wei
 Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBNYXkgMzEsIDIwMTkgYXQgMDE6MjE6MTVBTSAtMDcwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAzMS8wNS8yMDE5IDAxOjE3LCBSb2dlciBQYXUgTW9ubmUgd3JvdGU6Cj4gPiAr
ZGViIGh0dHA6Ly9hcHQubGx2bS5vcmcvc3RyZXRjaC8gbGx2bS10b29sY2hhaW4tc3RyZXRjaC04
IG1haW4KPiA+ICtkZWItc3JjIGh0dHA6Ly9hcHQubGx2bS5vcmcvc3RyZXRjaC8gbGx2bS10b29s
Y2hhaW4tc3RyZXRjaC04IG1haW4KPiA+IGRpZmYgLS1naXQgYS9hdXRvbWF0aW9uL2J1aWxkL2Rl
Ymlhbi9zdHJldGNoLmRvY2tlcmZpbGUgYi9hdXRvbWF0aW9uL2J1aWxkL2RlYmlhbi9zdHJldGNo
LmRvY2tlcmZpbGUKPiA+IGluZGV4IGRhZjhjOWQzODQuLjE4OWRmZjMyNzUgMTAwNjQ0Cj4gPiAt
LS0gYS9hdXRvbWF0aW9uL2J1aWxkL2RlYmlhbi9zdHJldGNoLmRvY2tlcmZpbGUKPiA+ICsrKyBi
L2F1dG9tYXRpb24vYnVpbGQvZGViaWFuL3N0cmV0Y2guZG9ja2VyZmlsZQo+ID4gQEAgLTUsNiAr
NSwxNCBAQCBMQUJFTCBtYWludGFpbmVyLm5hbWU9IlRoZSBYZW4gUHJvamVjdCIgXAo+ID4gIEVO
ViBERUJJQU5fRlJPTlRFTkQ9bm9uaW50ZXJhY3RpdmUKPiA+ICBFTlYgVVNFUiByb290Cj4gPiAg
Cj4gPiArUlVOIGFwdC1nZXQgdXBkYXRlICYmIFwKPiA+ICsgICAgYXB0LWdldCAtLXF1aWV0IC0t
eWVzIGluc3RhbGwgXAo+ID4gKyAgICB3Z2V0IFwKPiA+ICsgICAgZ251cGcKPiA+ICsKPiA+ICtS
VU4gd2dldCAtTyAtIGh0dHBzOi8vYXB0Lmxsdm0ub3JnL2xsdm0tc25hcHNob3QuZ3BnLmtleXxh
cHQta2V5IGFkZCAtCj4gPiArQ09QWSBzdHJldGNoLWxsdm0ubGlzdCAvZXRjL2FwdC9zb3VyY2Vz
Lmxpc3QuZC8KPiA+ICsKPiA+ICBSVU4gbWtkaXIgL2J1aWxkCj4gPiAgV09SS0RJUiAvYnVpbGQK
PiA+ICAKPiA+IEBAIC0zOSw5ICs0NywxMCBAQCBSVU4gYXB0LWdldCB1cGRhdGUgJiYgXAo+ID4g
ICAgICAgICAgdHJhbnNmaWcgXAo+ID4gICAgICAgICAgcGFuZG9jIFwKPiA+ICAgICAgICAgIGNo
ZWNrcG9saWN5IFwKPiA+IC0gICAgICAgIHdnZXQgXAo+IAo+IFlvdSBjYW4ndCBkcm9wIHdnZXQg
KHNhZGx5KSwgYmVjYXVzZSB0aGlzIHdpbGwgYnJlYWsgQ0kgb24gc3RhZ2luZy00LjExCj4gb3Ig
c3RhZ2luZy00LjEyICh3aGljaGV2ZXIgaGFkIGdpdGxhYiBDSSBhbmQgdGhlIGxhY2sgb2YgYSBG
RVRDSEVSPSB3YXMKPiBzdGlsbCBmYXRhbCB0byAuL2NvbmZpZ3VyZSkKCk9oIG5vLCBJIGhhdmVu
J3QgZHJvcHBlZCB3Z2V0LCBqdXN0IGluc3RhbGxlZCBpdCBzb29uZXIgc28gaXQgY2FuIGJlCnVz
ZWQgdG8gZmV0Y2ggdGhlIGxsdm0gYXB0IHJlcG9zaXRvcnkga2V5IChzZWUgdGhlIGFwdC1nZXQg
YWJvdmUgdGhpcwpvbmUpLgoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
