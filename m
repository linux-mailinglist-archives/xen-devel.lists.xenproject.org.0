Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C38F437742
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jun 2019 16:56:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYtml-0000Pa-6q; Thu, 06 Jun 2019 14:54:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/1VA=UF=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hYtmj-0000PR-3l
 for xen-devel@lists.xenproject.org; Thu, 06 Jun 2019 14:54:33 +0000
X-Inumbo-ID: fc744e4e-886a-11e9-8e8a-8338e98a3ec3
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fc744e4e-886a-11e9-8e8a-8338e98a3ec3;
 Thu, 06 Jun 2019 14:54:30 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=SoftFail smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: SoftFail (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com is inclined to not designate
 162.221.158.21 as permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 include:spf.citrix.com
 include:spf2.citrix.com include:ironport.citrix.com
 exists:%{i}._spf.mta.salesforce.com ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: WpyY/dtKZcG/i1ysrG4T/xeDTHdzKPyNepGV9rgFETsTtE+/pk9+7pkcxI1XisyjNrkUfsapEE
 4j7+9/Jq0i5LMTMoGTY4bGayDcBgQIZHBd0gA0cli/7lUYxlIFwbuB91AE0FOUX7GOhCVEFJoP
 w5zMn/0XKAi9vHSMHlzyFll+zeoI1EICqdP9BcCu5ksLfxKmhKUUHeVclGqrJuVDwV8YN2wqEO
 wTf3BMPYd/GKZjzxGgPqH17aEswS6wk69yBzaUOcBaKVIu6lRBOCpzAGQSa102cnPD7hV1u6JI
 vSM=
X-SBRS: -0.9
X-MesageID: 1381340
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,559,1557201600"; 
   d="scan'208";a="1381340"
Date: Thu, 6 Jun 2019 16:54:18 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20190606145418.vfr6rnre2o7rmcfv@Air-de-Roger>
References: <20190606090146.77381-1-roger.pau@citrix.com>
 <20190606090146.77381-3-roger.pau@citrix.com>
 <5CF908F00200007800235F1D@prv1-mh.provo.novell.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5CF908F00200007800235F1D@prv1-mh.provo.novell.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v2 02/12] pci: introduce a pci_sbdf_t field
 to pci_dev
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>, Konrad
 Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBKdW4gMDYsIDIwMTkgYXQgMDY6Mzc6MDRBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDA2LjA2LjE5IGF0IDExOjAxLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gQW5kIHVzZSBhbiB1bmlvbiB3aXRoIHRoZSBjdXJyZW50IHNlZywgYnVzIGFuZCBk
ZXZmbiBmaWVsZHMgdG8gbWFrZQo+ID4gZmllbGRzIHBvaW50IHRvIHRoZSBzYW1lIHVuZGVybHlp
bmcgZGF0YS4KPiA+IAo+ID4gTm8gZnVuY3Rpb25hbCBjaGFuZ2UuCj4gPiAKPiA+IFN1Z2dlc3Rl
ZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+ID4gU2lnbmVkLW9mZi1ieTog
Um9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gCj4gQWNrZWQtYnk6IEph
biBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiB3aXRoIG9uZSBxdWVzdGlvbjoKPiAKPiA+
IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9wY2kuaAo+ID4gKysrIGIveGVuL2luY2x1ZGUveGVuL3Bj
aS5oCj4gPiBAQCAtODMsOSArODMsMTUgQEAgc3RydWN0IHBjaV9kZXYgewo+ID4gICAgICBzdHJ1
Y3QgYXJjaF9tc2l4ICptc2l4Owo+ID4gIAo+ID4gICAgICBzdHJ1Y3QgZG9tYWluICpkb21haW47
Cj4gPiAtICAgIGNvbnN0IHUxNiBzZWc7Cj4gPiAtICAgIGNvbnN0IHU4IGJ1czsKPiA+IC0gICAg
Y29uc3QgdTggZGV2Zm47Cj4gPiArCj4gPiArICAgIHVuaW9uIHsKPiA+ICsgICAgICAgIHN0cnVj
dCB7Cj4gPiArICAgICAgICAgICAgY29uc3QgdWludDhfdCBkZXZmbjsKPiA+ICsgICAgICAgICAg
ICBjb25zdCB1aW50OF90IGJ1czsKPiA+ICsgICAgICAgICAgICBjb25zdCB1aW50MTZfdCBzZWc7
Cj4gPiArICAgICAgICB9Owo+ID4gKyAgICAgICAgY29uc3QgcGNpX3NiZGZfdCBzYmRmOwo+ID4g
KyAgICB9Owo+IAo+IERvZXNuJ3Qgc3RpY2tpbmcgYSBzaW5nbGUgImNvbnN0IiBhdCB0aGUgdW5p
b24gaGF2ZSB0aGUgc2FtZSBlZmZlY3Q/CgpJbmRlZWQsIGFuZCBJJ3ZlIGFscmVhZHkgZG9uZSBz
bywgSSBhc3N1bWUgaXQncyBmaW5lIHRvIGtlZXAgeW91ciBBY2suCgpUaGFua3MsIFJvZ2VyLgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
