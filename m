Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B626D26C
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2019 18:56:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ho9dt-0002Rp-DS; Thu, 18 Jul 2019 16:52:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=MdgZ=VP=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ho9dr-0002Rk-QC
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2019 16:52:27 +0000
X-Inumbo-ID: 696c404c-a97c-11e9-afdc-cf7a2c4d3146
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 696c404c-a97c-11e9-afdc-cf7a2c4d3146;
 Thu, 18 Jul 2019 16:52:22 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: l4zDkdXlURT9ZH71v+7yLq5lS6guIorkq9uNphKAQjOZ6overy0zNFvnoa6XUtdCvlMNt65tvy
 jI170jmTcyYZ45wtWmHXhY4lX1U8Jjt3hxAwvSrZ9L9pfbIOLoMEB6kpJyffEWK4ixNjD1CaSa
 6X2HX4qzmYEwCO3hEGfV3QHHbZgSEoh1/YoHbm/DGc9AJyG9HjeyUp61ft2SlIMQJLVjpslyow
 b4ozNgKEO9ekz4Lva6qDFAJdGPv31LAwehuk/pzmDIkS6GovXuTzxhMAOCdelKc76rgm7Ruqpj
 9wY=
X-SBRS: 2.7
X-MesageID: 3245897
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,278,1559534400"; 
   d="scan'208";a="3245897"
Date: Thu, 18 Jul 2019 18:52:12 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20190718165212.rj23yh5bphtc2cq5@Air-de-Roger.citrite.net>
References: <cover.537da3804adbe71352bed871578f3e893e2210c5.1563325215.git-series.marmarek@invisiblethingslab.com>
 <7280f16277aa9d7bdc9c2373277ef1b40459090b.1563325215.git-series.marmarek@invisiblethingslab.com>
 <20190717101843.2nmigl4dt4kekuax@Air-de-Roger.citrite.net>
 <20190717235426.GX1250@mail-itl>
 <20190718134604.owj6l4hk7rjq72es@Air-de-Roger.citrite.net>
 <9d0c36b7-97d3-5da8-c35b-7073c2066841@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9d0c36b7-97d3-5da8-c35b-7073c2066841@suse.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v5 5/6] xen/x86: add PHYSDEVOP_msi_control
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 AndrewCooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
 TimDeegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBKdWwgMTgsIDIwMTkgYXQgMDM6MTc6MjdQTSArMDAwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMTguMDcuMjAxOSAxNTo0NiwgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6Cj4gPiBJ
biBmYWN0IEkgZG9uJ3QgdGhpbmsgSU5UeCBzaG91bGQgYmUgZW5hYmxlZCB3aGVuIE1TSSgtWCkg
aXMgZGlzYWJsZWQsCj4gPiBRRU1VIGFscmVhZHkgdHJhcHMgd3JpdGVzIHRvIHRoZSBjb21tYW5k
IHJlZ2lzdGVyLCBhbmQgaXQgd2lsbCBtYW5hZ2UKPiA+IElOVHggZW5hYmxpbmcvZGlzYWJsaW5n
IGJ5IGl0c2VsZi4gSSB0aGluayB0aGUgb25seSBjaGVjayByZXF1aXJlZCBpcwo+ID4gdGhhdCBN
U0koLVgpIGNhbm5vdCBiZSBlbmFibGVkIGlmIElOVHggaXMgYWxzbyBlbmFibGVkLiBJbiB0aGUg
c2FtZQo+ID4gd2F5IGJvdGggTVNJIGNhc3BhYmlsaXRpZXMgY2Fubm90IGJlIGVuYWJsZWQgc2lt
dWx0YW5lb3VzbHkuIFRoZQo+ID4gZnVuY3Rpb24gc2hvdWxkIG5vdCBleHBsaWNpdGx5IGRpc2Fi
bGUgYW55IG9mIHRoZSBvdGhlciBjYXBhYmlsaXRpZXMsCj4gPiBhbmQganVzdCByZXR1cm4gLUVC
VVNZIGlmIHRoZSBjYWxsZXIgYXR0ZW1wdHMgZm9yIGV4YW1wbGUgdG8gZW5hYmxlCj4gPiBNU0kg
d2hpbGUgSU5UeCBvciBNU0ktWCBpcyBlbmFibGVkLgo+IAo+IFlvdSBkbyByZWFsaXplIHRoYXQg
cGNpX2ludHgoKSBvbmx5IGV2ZXIgZ2V0cyBjYWxsZWQgZm9yIFhlbgo+IGludGVybmFsbHkgdXNl
ZCBpbnRlcnJ1cHRzLCBpLmUuIG1haW5seSB0aGUgc2VyaWFsIGNvbnNvbGUgb25lPwoKWW91IHdp
bGwgaGF2ZSB0byBiZWFyIHdpdGggbWUgYmVjYXVzZSBJJ20gbm90IHN1cmUgSSB1bmRlcnN0YW5k
IHdoeQppdCBkb2VzIG1hdHRlci4gRG8geW91IG1lYW4gdG8gcG9pbnQgb3V0IHRoYXQgZG9tMCBp
cyB0aGUgb25lIGluIGZ1bGwKY29udHJvbCBvZiBJTlR4LCBhbmQgdGh1cyBYZW4gc2hvdWxkbid0
IGNhcmUgb2Ygd2hldGhlciBJTlR4IGFuZApNU0koLVgpIGFyZSBlbmFibGVkIGF0IHRoZSBzYW1l
IHRpbWU/CgpJIHN0aWxsIHRoaW5rIHRoYXQgYXQgbGVhc3QgYSB3YXJuaW5nIHNob3VsZCBiZSBw
cmludGVkIGlmIGEgY2FsbGVyCnRyaWVzIHRvIGVuYWJsZSBNU0koLVgpIHdoaWxlIElOVHggaXMg
YWxzbyBlbmFibGVkLCBidXQgdW5sZXNzIHRoZXJlJ3MKYSByZWFzb24gdG8gaGF2ZSBib3RoIE1T
SSgtWCkgYW5kIElOVHggZW5hYmxlZCBhdCB0aGUgc2FtZSB0aW1lIChtYXliZQphIHF1aXJrIGZv
ciBzb21lIGhhcmR3YXJlIGlzc3VlPykgaXQgc2hvdWxkbid0IGJlIGFsbG93ZWQgb24gdGhpcyBu
ZXcKaW50ZXJmYWNlLgoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
