Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DAB83422E
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jun 2019 10:51:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hY57N-0004FU-Qs; Tue, 04 Jun 2019 08:48:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ql4p=UD=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hY57M-0004FN-4y
 for xen-devel@lists.xenproject.org; Tue, 04 Jun 2019 08:48:28 +0000
X-Inumbo-ID: 839c4b96-86a5-11e9-85b4-83e5f7dbd9f9
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 839c4b96-86a5-11e9-85b4-83e5f7dbd9f9;
 Tue, 04 Jun 2019 08:48:25 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL02.citrite.net
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 23.29.105.83 as permitted
 sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.50 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL02.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL02.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: BCDMtLFYMuOgmPfZi2rDaf6C/d8VfVpBWlGVFxrivbVwEpSZViiH5MZlRzvQ1px+dj0KkzSlJT
 J2+O5c2gI/pxg2vEL/nqlH/nIO8Ik5Wa7iaGjfV5/MMdSV+mROcg4TMtPIxOy9WnGve3EigM4l
 fsFQ+vQp+ZyPA13bB+YLv2C2tt8cXJdH+ZiDA/pmlF5nzp34xsL4iz5i8ht9Qz60yvN9xisO/w
 PcXIJBQ8bzYkEV7DnVbyAT67RFsKbtFxD/RGgnnEEtEIMndNAKJTc/DApTg5SMI53tVZzgV0LA
 G8Y=
X-SBRS: 2.7
X-MesageID: 1286334
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,550,1549947600"; 
   d="scan'208";a="1286334"
Date: Tue, 4 Jun 2019 10:48:07 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20190604084807.3hevw5rh6qu5w3ul@Air-de-Roger>
References: <5CF519E902000078002349FF@prv1-mh.provo.novell.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5CF519E902000078002349FF@prv1-mh.provo.novell.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH] AMD/IOMMU: revert "amd/iommu: assign iommu
 devices to Xen"
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
 Brian Woods <brian.woods@amd.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBKdW4gMDMsIDIwMTkgYXQgMDc6MDA6MjVBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gVGhpcyByZXZlcnRzIGNvbW1pdCBiNmJkMDJiN2E4NzdmOWZhYzJkZTY5ZTY0ZDgyNDVk
NTZmOTJhYjI1LiBUaGUgY2hhbmdlCj4gd2FzIHJlZHVuZGFudCB3aXRoIGFtZF9pb21tdV9kZXRl
Y3Rfb25lX2FjcGkoKSBhbHJlYWR5IGNhbGxpbmcKPiBwY2lfcm9fZGV2aWNlKCkuCj4gCj4gU2ln
bmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKSSB0aGluayB0aGlz
IG5lZWRzIHRvIGJlIHNxdWFzaGVkIHRvZ2V0aGVyIHdpdGggeW91ciBgQU1EL0lPTU1VOiBkb24n
dAoiYWRkIiBJT01NVXNgIHBhdGNoLCBvciBlbHNlIFBWSCBkb20wIHdpbGwgYnJlYWsgYmVjYXVz
ZQp1cGRhdGVfcGFnaW5nX21vZGUgd2lsbCBmaW5kIGRldmljZXMgbm90IGJlaGluZCBhbiBJT01N
VSBhc3NpZ25lZCB0bwpkb20wLCB0aHVzIHJldHVybmluZyBhbiBlcnJvciBhbmQgY3Jhc2hpbmcg
ZG9tMC4KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
