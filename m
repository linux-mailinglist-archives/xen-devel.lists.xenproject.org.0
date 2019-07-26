Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C2575F9F
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2019 09:21:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hquUc-00075X-Qd; Fri, 26 Jul 2019 07:18:18 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+y56=VX=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hquUb-00075S-Cb
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2019 07:18:17 +0000
X-Inumbo-ID: 88c82c45-af75-11e9-8980-bc764e045a96
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 88c82c45-af75-11e9-8980-bc764e045a96;
 Fri, 26 Jul 2019 07:18:15 +0000 (UTC)
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
IronPort-SDR: M2O28YACQdc7T2KaYp8kh9e3nENZ4ja/+RReStguVJpQ9IYDlZahKCAfOH24MFPpkUzpTdQZyV
 sDPEMgeVnDV04unvPX6v2RdI+uFSemEcVgwRk3n0Xq/2bMoGd12+yiMgcRPdrlbRpKknOI/wL2
 NCFP1dNbPeqGrZUJ51O44UEQDvaMl7uatdyGz9PVlGHzo0ceSCSuQWqSp6OvudyP9AJ5CRWJAB
 At/IkKoPn3mXehYu4ZDurh3H61lZZko7sJMQjMbxoCkCoPGr4bU6bvSw5HJvj66pZp4K8x9f52
 KsY=
X-SBRS: 2.7
X-MesageID: 3560604
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,309,1559534400"; 
   d="scan'208";a="3560604"
Date: Fri, 26 Jul 2019 09:17:58 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Rich Persaud <persaur@gmail.com>
Message-ID: <20190726071758.geuxwscfhs2zftfr@Air-de-Roger>
References: <20190725135112.83569-1-roger.pau@citrix.com>
 <AC845283-0555-4296-97B4-EDFB6A4C5882@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <AC845283-0555-4296-97B4-EDFB6A4C5882@gmail.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH] tboot: remove maintainers and declare
 orphaned
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
Cc: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Daniel Smith <dpsmith@apertussolutions.com>,
 Stefano Stabellini <sstabellini@kernel.org>, jun.nakajima@intel.com,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Lukasz Hawrylko <lukasz.hawrylko@intel.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, tboot-devel@lists.sourceforge.net,
 Tim Deegan <tim@xen.org>, Lars Kurth <lars.kurth.xen@gmail.com>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Shane Wang <shane.wang@intel.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBKdWwgMjUsIDIwMTkgYXQgMDM6MDg6MDdQTSAtMDQwMCwgUmljaCBQZXJzYXVkIHdy
b3RlOgo+IChjYyBJbnRlbCBhbmQgdGJvb3QtZGV2ZWwpCj4gCj4gSGkgUm9nZXIsCj4gCj4gVGhh
bmtzIGZvciB5b3VyIGludGVyZXN0IGluIGRvY3VtZW50aW5nIHRoZSBzdGF0dXMgb2YgbWFpbnRl
bmFuY2UgZm9yIEludGVsIFRYVCBzdXBwb3J0IGluIFhlbi4gIEludGVsIFRYVCBhbmQgWGVuIGFy
ZSBkZXBsb3llZCBpbiBwcm9kdWN0aW9uIHRvZGF5IGJ5IE9wZW5YVCBhbmQgUXViZXNPUyBmb3Ig
Ym9vdCBpbnRlZ3JpdHkuICBYZW4gd2FzIGEgcGlvbmVlcmluZyBhZG9wdGVyIG9mIERSVE0sIGFs
bW9zdCBhIGRlY2FkZSBhZ28sIGJ1dCBtYWluc3RyZWFtIGVudGVycHJpc2UgY29tcHV0aW5nIGlz
IG5vdyBjYXRjaGluZyB1cCB3aXRoIHRoZSBNYXkgMjAxOSByZWxlYXNlIG9mIFdpbmRvd3MgMTAg
U3lzdGVtR3VhcmQuICBJdCB3b3VsZCBiZSBuaWNlIHRvIGF2b2lkICJvcnBoYW5pbmciIG9uZSBv
ZiBYZW4ncyBjb21wZXRpdGl2ZSBhZHZhbnRhZ2VzIGluIDIwMTkuCgpUaGFua3MgZm9yIHRoZSBm
ZWVkYmFjayEgSnVzdCB0byBiZSBjbGVhciwgdGhpcyBpcyBub3QgYSBwbGFuIHRvCnJlbW92ZSB0
aGUgdGJvb3QgY29kZSBmcm9tIFhlbiBpbiBhbnkgd2F5LCBpdCdzIGp1c3QgYSBJTU8gbmVlZGVk
IHN0ZXAKaW4gb3JkZXIgdG8gcmVmbGVjdCB0aGUgY3VycmVudCBtYWludGFpbmVyc2hpcCBzdGF0
dXMgb2YgdGhlIGNvZGUsIGFuZApsaWtlbHkgYSB3YXkgdG8gbW92ZSBmb3J3YXJkLCBwbGVhc2Ug
c2VlIGJlbG93LgoKPiA+IE9uIEp1bCAyNSwgMjAxOSwgYXQgMDk6NTEsIFJvZ2VyIFBhdSBNb25u
ZSA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+ID4gCj4gPiBHYW5nIFdlaSBJbnRlbCBl
bWFpbCBhZGRyZXNzIGhhcyBiZWVuIGJvdW5jaW5nIGZvciBzb21lIHRpbWUgbm93LAo+IAo+IEdh
bmcgV2VpJ3MgcmVwbGFjZW1lbnQgaXMgTHVrYXN6IEhhd3J5bGtvLCB3aG8gcG9zdGVkIG9uIE1h
cmNoIDYsIDIwMTk6Cj4gaHR0cHM6Ly9saXN0cy5ndC5uZXQveGVuL2RldmVsLzU0NjQwMQo+IAo+
IENvdWxkIHlvdSBpbmNsdWRlIEx1a2FzeiBwYXRjaCwgYWxvbmcgd2l0aCBKdWxpZW4ncyByZXF1
ZXN0ZWQgZm9ybWF0dGluZyBjaGFuZ2VzLCBpbiB5b3VyIHVwZGF0ZSB0byB0aGUgTUFJTlRBSU5F
UlMgZmlsZT8KCkkgdGhpbmsgaXQgd291bGQgYmUgYmV0dGVyIGlmIEx1a2FzeiBjb3VsZCByZXNl
bmQgaGlzIHBhdGNoLCBub3cgdGhhdAp0aGUgc2VjdGlvbiBlbnRyeSBpcyBvcnBoYW5lZCB3ZSBj
YW4gYWRkL3JlbW92ZSByZXZpZXdlcnMgYW5kCm1haW50YWluZXJzIHdpdGhvdXQgYmVpbmcgYmxv
Y2tlZC4KCj4gQXMgYSBuZXcgWGVuIG1haW50YWluZXIgYW5kIGNvbnRyaWJ1dG9yLCBMdWthc3og
bWF5IG5vdCB5ZXQgYmUgZmFtaWxpYXIgd2l0aCB0aGUgcHJvY2VkdXJlcyBhbmQgcHJhY3RpY2Vz
IG9mIHRoZSBYZW4gY29tbXVuaXR5LiAgV2UgY2FuIHdlbGNvbWUgaGlzIG5ldyBtYWludGFpbmVy
c2hpcCByb2xlIHdpdGhvdXQgZHJvcHBpbmcgc3VwcG9ydCBmb3IgYSBmZWF0dXJlLCB0aGF0IChh
KSBoZSBpcyBtYWludGFpbmluZywgKGIpIGlzIHVzZWQgYnkgWGVuLgoKU3VyZSwgbXkgcGxhbiBp
cyB0byBkZWNsYXJlIHRoZSBzdXBwb3J0IG9ycGhhbmVkLCBzbyB0aGF0IEx1a2FzeiAob3IKYW55
b25lIHdobyBoYXMgaW50ZXJlc3QgaW4gdGhpcyBjb2RlKSBjYW4gYmUgYWRkZWQgYXMgYSByZXZp
ZXdlcgphZnRlcndhcmRzIHdpdGhvdXQgdXMgYmVpbmcgYmxvY2tlZCBvbiBhbiBBY2sgZnJvbSBT
aGFuZSBXYW5nLCB3aG8gaXMKdW5yZXNwb25zaXZlIChhcyBwZXIgdGhlIHRocmVhZCBwb2ludGVk
IHRvIGluIHRoZSBjb21taXQgbWVzc2FnZSkuCgo+ID4gYW5kCj4gPiB0aGUgb3RoZXIgbWFpbnRh
aW5lciBpcyBub24tcmVzcG9uc2l2ZSB0byBwYXRjaGVzIFswXSwgc28gcmVtb3ZlCj4gPiBtYWlu
dGFpbmVycyBhbmQgZGVjbGFyZSBJTlRFTChSKSBUUlVTVEVEIEVYRUNVVElPTiBURUNITk9MT0dZ
IChUWFQpCj4gPiBvcnBoYW5lZC4KPiA+IAo+ID4gWzBdIGh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvYXJjaGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAxOS0wNS9tc2cwMDU2My5odG1sCj4gCj4g
U2luY2Ugd2UgaGF2ZSBhdCBsZWFzdCBvbmUgSW50ZWwgbWFpbnRhaW5lciwgTHVrYXN6LCB0aGUg
ZmVhdHVyZSBuZWVkIG5vdCBiZSBvcnBoYW5lZC4gIElmIFNoYXduIGlzIG5vdCByZXNwb25kaW5n
IHRvIHRoZSByZXF1ZXN0IHRvIGNvbmZpcm0gTHVrYXN6IGFzIG1haW50YWluZXIsIHRoZSBYZW4g
Y29tbXVuaXR5IGhhcyBtdWx0aXBsZSBjb21tdW5pY2F0aW9uIGNoYW5uZWxzIHdpdGggSW50ZWwu
ICBQcmFnbWF0aWNhbGx5LCBhIHJldmlldyBvZiB0aGUgdGJvb3QtZGV2ZWwgYXJjaGl2ZXMgc2hv
d3MgdGhhdCBMdWthc3ogaXMgd29ya2luZyBvbiB0Ym9vdCBkZXZlbG9wbWVudC4gIAoKVGhlIG9y
cGhhbmVkIHN0ZXAgaXMgSU1PIG5lZWRlZCBpbiBvcmRlciB0byBtb3ZlIGZvcndhcmQgYW5kIGFk
ZCBhIG5ldwpyZXZpZXdlci9tYWludGFpbmVyLiBXaXRob3V0IHJlbW92aW5nIHRoZSBjdXJyZW50
IG1haW50YWluZXJzIGFuZApkZWNsYXJpbmcgaXQgb3JwaGFuZWQgd2Ugd291bGQgYmUgYmxvY2tl
ZCBvbiBhbiBBY2sgZnJvbSBTaGFuZSBXYW5nIGluCm9yZGVyIHRvIGFkZCBvciByZW1vdmUgbWFp
bnRhaW5lcnMuIFJlbW92aW5nIGN1cnJlbnQgbWFpbnRhaW5lcnMgYW5kCmFkZGluZyBMdWthc3og
aW4gdGhlIHNhbWUgcGF0Y2ggd291bGQgc3RpbGwgcmVxdWlyZSBhbiBBY2sgZnJvbSB0aGUKY3Vy
cmVudCBvd25lcnMuCgpIb3BlIHRoaXMgbWFrZXMgc2Vuc2UsIFJvZ2VyLgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
