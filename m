Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 360256E314
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jul 2019 11:05:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hoOmU-00053A-VA; Fri, 19 Jul 2019 09:02:22 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RcFV=VQ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hoOmT-000533-LO
 for xen-devel@lists.xenproject.org; Fri, 19 Jul 2019 09:02:21 +0000
X-Inumbo-ID: e9e5e030-aa03-11e9-8980-bc764e045a96
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id e9e5e030-aa03-11e9-8980-bc764e045a96;
 Fri, 19 Jul 2019 09:02:20 +0000 (UTC)
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
IronPort-SDR: vVC5dzcCQ8eUYZCM3sFivYnt5LA+itGPYOWkeBeMF7I2eTt3xZZvB8+59NFFZ1+EaNBB7R3SRn
 ZMQuueqEzwdJCrzr8SY2Tf0A6xTeK6hR+FCUUB0SX8EIczlNq131bD/JXztdDkMUG6wDttWcv6
 ZcxfGugnF9R5qsLeLM5wyjsuj7it/T1FkY0vI9AuCcDuFs6PLCTP1+cIv+at/vD/OVc/W2fGU4
 Hcd2P+c8PhQLXSZA042U5gea8ouQSd+2fBEL79qljkNKphVknF+q/4kiHyRdJ5InzzuYL8YZ27
 46c=
X-SBRS: 2.7
X-MesageID: 3207072
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,281,1559534400"; 
   d="scan'208";a="3207072"
Date: Fri, 19 Jul 2019 11:02:02 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20190719090202.vzeernrydawwnzan@Air-de-Roger.citrite.net>
References: <cover.537da3804adbe71352bed871578f3e893e2210c5.1563325215.git-series.marmarek@invisiblethingslab.com>
 <7280f16277aa9d7bdc9c2373277ef1b40459090b.1563325215.git-series.marmarek@invisiblethingslab.com>
 <20190717101843.2nmigl4dt4kekuax@Air-de-Roger.citrite.net>
 <20190717235426.GX1250@mail-itl>
 <20190718134604.owj6l4hk7rjq72es@Air-de-Roger.citrite.net>
 <9d0c36b7-97d3-5da8-c35b-7073c2066841@suse.com>
 <20190718165212.rj23yh5bphtc2cq5@Air-de-Roger.citrite.net>
 <f5ff77af-d2d5-1a89-06d4-6049f607ec80@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f5ff77af-d2d5-1a89-06d4-6049f607ec80@suse.com>
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

T24gRnJpLCBKdWwgMTksIDIwMTkgYXQgMDg6MDQ6NDVBTSArMDAwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMTguMDcuMjAxOSAxODo1MiwgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6Cj4gPiBP
biBUaHUsIEp1bCAxOCwgMjAxOSBhdCAwMzoxNzoyN1BNICswMDAwLCBKYW4gQmV1bGljaCB3cm90
ZToKPiA+PiBPbiAxOC4wNy4yMDE5IDE1OjQ2LCBSb2dlciBQYXUgTW9ubsOpICB3cm90ZToKPiA+
Pj4gSW4gZmFjdCBJIGRvbid0IHRoaW5rIElOVHggc2hvdWxkIGJlIGVuYWJsZWQgd2hlbiBNU0ko
LVgpIGlzIGRpc2FibGVkLAo+ID4+PiBRRU1VIGFscmVhZHkgdHJhcHMgd3JpdGVzIHRvIHRoZSBj
b21tYW5kIHJlZ2lzdGVyLCBhbmQgaXQgd2lsbCBtYW5hZ2UKPiA+Pj4gSU5UeCBlbmFibGluZy9k
aXNhYmxpbmcgYnkgaXRzZWxmLiBJIHRoaW5rIHRoZSBvbmx5IGNoZWNrIHJlcXVpcmVkIGlzCj4g
Pj4+IHRoYXQgTVNJKC1YKSBjYW5ub3QgYmUgZW5hYmxlZCBpZiBJTlR4IGlzIGFsc28gZW5hYmxl
ZC4gSW4gdGhlIHNhbWUKPiA+Pj4gd2F5IGJvdGggTVNJIGNhc3BhYmlsaXRpZXMgY2Fubm90IGJl
IGVuYWJsZWQgc2ltdWx0YW5lb3VzbHkuIFRoZQo+ID4+PiBmdW5jdGlvbiBzaG91bGQgbm90IGV4
cGxpY2l0bHkgZGlzYWJsZSBhbnkgb2YgdGhlIG90aGVyIGNhcGFiaWxpdGllcywKPiA+Pj4gYW5k
IGp1c3QgcmV0dXJuIC1FQlVTWSBpZiB0aGUgY2FsbGVyIGF0dGVtcHRzIGZvciBleGFtcGxlIHRv
IGVuYWJsZQo+ID4+PiBNU0kgd2hpbGUgSU5UeCBvciBNU0ktWCBpcyBlbmFibGVkLgo+ID4+Cj4g
Pj4gWW91IGRvIHJlYWxpemUgdGhhdCBwY2lfaW50eCgpIG9ubHkgZXZlciBnZXRzIGNhbGxlZCBm
b3IgWGVuCj4gPj4gaW50ZXJuYWxseSB1c2VkIGludGVycnVwdHMsIGkuZS4gbWFpbmx5IHRoZSBz
ZXJpYWwgY29uc29sZSBvbmU/Cj4gPiAKPiA+IFlvdSB3aWxsIGhhdmUgdG8gYmVhciB3aXRoIG1l
IGJlY2F1c2UgSSdtIG5vdCBzdXJlIEkgdW5kZXJzdGFuZCB3aHkKPiA+IGl0IGRvZXMgbWF0dGVy
LiBEbyB5b3UgbWVhbiB0byBwb2ludCBvdXQgdGhhdCBkb20wIGlzIHRoZSBvbmUgaW4gZnVsbAo+
ID4gY29udHJvbCBvZiBJTlR4LCBhbmQgdGh1cyBYZW4gc2hvdWxkbid0IGNhcmUgb2Ygd2hldGhl
ciBJTlR4IGFuZAo+ID4gTVNJKC1YKSBhcmUgZW5hYmxlZCBhdCB0aGUgc2FtZSB0aW1lPwo+ID4g
Cj4gPiBJIHN0aWxsIHRoaW5rIHRoYXQgYXQgbGVhc3QgYSB3YXJuaW5nIHNob3VsZCBiZSBwcmlu
dGVkIGlmIGEgY2FsbGVyCj4gPiB0cmllcyB0byBlbmFibGUgTVNJKC1YKSB3aGlsZSBJTlR4IGlz
IGFsc28gZW5hYmxlZCwgYnV0IHVubGVzcyB0aGVyZSdzCj4gPiBhIHJlYXNvbiB0byBoYXZlIGJv
dGggTVNJKC1YKSBhbmQgSU5UeCBlbmFibGVkIGF0IHRoZSBzYW1lIHRpbWUgKG1heWJlCj4gPiBh
IHF1aXJrIGZvciBzb21lIGhhcmR3YXJlIGlzc3VlPykgaXQgc2hvdWxkbid0IGJlIGFsbG93ZWQg
b24gdGhpcyBuZXcKPiA+IGludGVyZmFjZS4KPiAKPiBJIGRvbid0IG1pbmQgaW1wcm92ZW1lbnRz
IHRvIHRoZSBjdXJyZW50IHNpdHVhdGlvbiAoaS5lLiBzdWNoIGEKPiB3YXJuaW5nIG1heSBpbmRl
ZWQgbWFrZSBzZW5zZSk7IEkgbWVyZWx5IHN0YXRlZCBob3cgdGhpbmdzIGN1cnJlbnRseQo+IGFy
ZS4gSU5UeCB0cmVhdG1lbnQgd2FzIGNvbXBsZXRlbHkgbGVmdCBhc2lkZSB3aGVuIE1TSSBzdXBw
b3J0IHdhcwo+IGludHJvZHVjZWQgaW50byBYZW4uCgpJbiBvcmRlciB0byBnaXZlIE1hcmVrIGEg
bW9yZSBjb25jaXNlIHJlcGx5LCB3b3VsZCB5b3UgYWdyZWUgdG8gcmV0dXJuCi1FQlVTWSAob3Ig
c29tZSBlcnJvciBjb2RlKSBhbmQgcHJpbnQgYSB3YXJuaW5nIG1lc3NhZ2UgaWYgdGhlIGNhbGxl
cgphdHRlbXB0cyB0byBlbmFibGUgTVNJKC1YKSB3aGlsZSBJTlR4IGlzIGFsc28gZW5hYmxlZD8K
ClRoZSBzYW1lIHdvdWxkIGFwcGx5IHRvIGVuYWJsaW5nIGJvdGggTVNJKC1YKSBjYXBhYmlsaXRp
ZXMgYXQgdGhlCnNhbWUgdGltZS4KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
