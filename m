Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B063716D
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jun 2019 12:15:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYpOl-0007Qp-Fd; Thu, 06 Jun 2019 10:13:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/1VA=UF=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hYpOk-0007Qh-6D
 for xen-devel@lists.xenproject.org; Thu, 06 Jun 2019 10:13:30 +0000
X-Inumbo-ID: b8cd9a96-8843-11e9-be05-570e09319204
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b8cd9a96-8843-11e9-be05-570e09319204;
 Thu, 06 Jun 2019 10:13:26 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=SoftFail smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: SoftFail (esa6.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com is inclined to not designate
 162.221.158.21 as permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 include:spf.citrix.com
 include:spf2.citrix.com include:ironport.citrix.com
 exists:%{i}._spf.mta.salesforce.com ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: fP8rLK5oyE3oPCUT1IwbKDNh1ZyERRzRN+jNQMdqK5ZgCaFKZInbe24V6bQWvjSlULi+IcLIoR
 8pd0G7ilG1Rld37sjLDEaAPoMAapOMGHqbdTIAUcqNrhDnpOIh8ns9a9wNQq4x8E6JF43cgLL3
 3+rdSzOX7FGbaZjDSwVpe2jOCoU4jdVnHbM32XRSO2UC0PRlzDfaNspCUaeNIvZBiU0mKCte3R
 zEs8bOodcSbKXXn9Kvdkc05WX/sroopqSCg3ZJopRX++a1UW46cwnjbyBe8ky/HjbJI4fB0wHA
 T80=
X-SBRS: -0.9
X-MesageID: 1367453
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,559,1557201600"; 
   d="scan'208";a="1367453"
Date: Thu, 6 Jun 2019 12:13:15 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20190606101315.ul56zhm64wvbbucn@Air-de-Roger>
References: <20190606090146.77381-1-roger.pau@citrix.com>
 <20190606090146.77381-2-roger.pau@citrix.com>
 <c5fc063ca2094937ac4ce0f2a345e5c9@AMSPEX02CL03.citrite.net>
 <5CF8E65B0200007800235DB8@prv1-mh.provo.novell.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5CF8E65B0200007800235DB8@prv1-mh.provo.novell.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v2 01/12] pci: introduce a devfn field to
 pci_sbdf_t
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 george.dunlap@citrix.com, Julien Grall <julien.grall@arm.com>,
 Paul Durrant <paul.durrant@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 IanJackson <Ian.Jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBKdW4gMDYsIDIwMTkgYXQgMDQ6MDk6MzFBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDA2LjA2LjE5IGF0IDExOjUwLCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+
IHdyb3RlOgo+ID4+ICAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+ID4+IEZyb206IFhlbi1k
ZXZlbCBbbWFpbHRvOnhlbi1kZXZlbC1ib3VuY2VzQGxpc3RzLnhlbnByb2plY3Qub3JnXSBPbiBC
ZWhhbGYgT2YgCj4gPiBSb2dlciBQYXUgTW9ubmUKPiA+PiBTZW50OiAwNiBKdW5lIDIwMTkgMTA6
MDIKPiA+PiBUbzogeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIAo+ID4+IENjOiBTdGVm
YW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyBXZWkgTGl1IDx3bEB4ZW4u
b3JnPjsgS29ucmFkIAo+ID4gUnplc3p1dGVrIFdpbGsKPiA+PiA8a29ucmFkLndpbGtAb3JhY2xl
LmNvbT47IEdlb3JnZSBEdW5sYXAgPEdlb3JnZS5EdW5sYXBAY2l0cml4LmNvbT47IEFuZHJldyAK
PiA+IENvb3Blcgo+ID4+IDxBbmRyZXcuQ29vcGVyM0BjaXRyaXguY29tPjsgSWFuIEphY2tzb24g
PElhbi5KYWNrc29uQGNpdHJpeC5jb20+OyBUaW0gKFhlbi5vcmcpIAo+ID4gPHRpbUB4ZW4ub3Jn
PjsgSnVsaWVuCj4gPj4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPjsgSmFuIEJldWxpY2gg
PGpiZXVsaWNoQHN1c2UuY29tPjsgUm9nZXIgUGF1IE1vbm5lIAo+ID4gPHJvZ2VyLnBhdUBjaXRy
aXguY29tPgo+ID4+IFN1YmplY3Q6IFtYZW4tZGV2ZWxdIFtQQVRDSCB2MiAwMS8xMl0gcGNpOiBp
bnRyb2R1Y2UgYSBkZXZmbiBmaWVsZCB0byAKPiA+IHBjaV9zYmRmX3QKPiA+PiAKPiA+PiBUaGlz
IGlzIGVxdWl2YWxlbnQgdG8gdGhlIGN1cnJlbnQgZXh0ZnVuYyBmaWVsZCBpbiB0ZXJtIG9mIGNv
bnRlbnRzLgo+ID4+IAo+ID4+IFN3aXRjaCB0aGUgdHdvIGN1cnJlbnQgdXNlcnMgb2YgZXh0ZnVu
YyB0byB1c2UgZGV2Zm4gaW5zdGVhZCBmb3IKPiA+PiBjb3JyZWN0bmVzcy4KPiA+PiAKPiA+PiBO
byBmdW5jdGlvbmFsIGNoYW5nZS4KPiA+PiAKPiA+PiBSZXF1ZXN0ZWQtYnk6IEphbiBCZXVsaWNo
IDxqYmV1bGljaEBzdXNlLmNvbT4KPiA+PiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOp
IDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPiA+PiAtLS0KPiA+PiBDYzogQW5kcmV3IENvb3BlciA8
YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KPiA+PiBDYzogR2VvcmdlIER1bmxhcCA8R2Vvcmdl
LkR1bmxhcEBldS5jaXRyaXguY29tPgo+ID4+IENjOiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25A
ZXUuY2l0cml4LmNvbT4KPiA+PiBDYzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+
ID4+IENjOiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgo+ID4+IENjOiBLb25y
YWQgUnplc3p1dGVrIFdpbGsgPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+Cj4gPj4gQ2M6IFN0ZWZh
bm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KPiA+PiBDYzogVGltIERlZWdh
biA8dGltQHhlbi5vcmc+Cj4gPj4gQ2M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+Cj4gPj4gLS0tCj4g
Pj4gQ2hhbmdlcyBzaW5jZSB2MToKPiA+PiAgLSBOZXcgaW4gdGhpcyB2ZXJzaW9uLgo+ID4+IC0t
LQo+ID4+IE5COiBQYXVsIHN1Z2dlc3RlZCB0byBuYW1lIHRoZSBmdW5jdGlvbiBmaWVsZCBmbiBp
bnN0ZWFkIG9mIGZ1bmMsIHNvCj4gPj4gdGhhdCBpdCB3b3VsZCBtYXRjaCB0aGUgbmFtaW5nIG9m
IHRoZSBkZXZmbiBmaWVsZC4gU2FkbHkgdGhlIGZ1bmMKPiA+PiBmaWVsZCBjYW5ub3QgYmUgYWxp
YXNlZCB0byBhbm90aGVyIGZpZWxkIHVzaW5nIGEgdW5pb24gYmVjYXVzZSBpdCdzIGEKPiA+PiBi
aXQgZmllbGQsIHNvIHRoZSBvbmx5IG9wdGlvbiBpcyB0byByZW5hbWUgZnVuYyB0byBmbi4KPiA+
IAo+ID4gSXMgdGhhdCB0cnVlPyBDYW4geW91IG5vdCBkbyBzb21ldGhpbmcgbGlrZS4uLgo+ID4g
Cj4gPiB1bmlvbiB7Cj4gPiAgIHN0cnVjdCB7Cj4gPiAgICAgdWludDhfdCBmdW5jIDogMywKPiA+
ICAgICAgICAgICAgIGRldiAgOiA1Owo+ID4gICB9Owo+ID4gICBzdHJ1Y3Qgewo+ID4gICAgIHVp
bnQ4X3QgZm4gICA6IDMsCj4gPiAgICAgICAgICAgICBwYWQgIDogNTsKPiAKPiBBbmQgdGhlICJw
YWQiIGZpZWxkIGhlcmUgd291bGRuJ3QgcmVhbGx5IGJlIG5lY2Vzc2FyeS4KPiAKPiBJcyB0aGVy
ZSBhIHJlYXNvbiAiZnVuYyIgbmVlZHMgdG8gYmUga2VwdD8gSWYgc28sIGlzIHRoZXJlIGEgcGxh
biB0bwo+IHBoYXNlIG91dCBpdHMgdXNlPyBJZiBzbywgcGVyaGFwcyBmbiBhbmQgZGV2IHNob3Vs
ZCBiZSBncm91cGVkCj4gdG9nZXRoZXIsIGFuZCBmdW5jIHNob3VsZCBiZWNvbWUgdGhlICh0ZW1w
b3JhcnkpIGFsaWFzPwoKSSB0aGluayBJIGNhbiBwcmVwYXJlIGEgcHJlLXBhdGNoIHRvIHJlbmFt
ZSBmdW5jIHRvIGZuLCB0aGUgdXNlcnMgb2YKcGNpX3NiZGZfdCBhcmUgdmVyeSBsaW1pdGVkIGF0
IHRoaXMgcG9pbnQuIElmIHlvdSBhZ3JlZSB3aXRoIHRoaXMgSQp3aWxsIGFkZCBzdWNoIGEgcGF0
Y2ggYXQgdGhlIGJlZ2lubmluZyBvZiB0aGUgc2VyaWVzLgoKVGhhbmtzLCBSb2dlci4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
