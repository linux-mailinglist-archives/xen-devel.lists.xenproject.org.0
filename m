Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 809ED6250B
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jul 2019 17:48:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hkVpg-0000Of-LK; Mon, 08 Jul 2019 15:45:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=arZn=VF=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hkVpf-0000OZ-1M
 for xen-devel@lists.xenproject.org; Mon, 08 Jul 2019 15:45:35 +0000
X-Inumbo-ID: 69dc8628-a197-11e9-8b21-af5e52ad672c
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 69dc8628-a197-11e9-8b21-af5e52ad672c;
 Mon, 08 Jul 2019 15:45:30 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B05C8360;
 Mon,  8 Jul 2019 08:45:29 -0700 (PDT)
Received: from [10.119.48.199] (unknown [10.119.48.199])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 08DEE3F59C;
 Mon,  8 Jul 2019 08:45:28 -0700 (PDT)
To: Viktor Mitin <viktor.mitin.19@gmail.com>, xen-devel@lists.xenproject.org
References: <20190708123545.19406-1-viktor.mitin.19@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <a621f734-56c6-b5d9-4926-b7e04c75a4b7@arm.com>
Date: Mon, 8 Jul 2019 16:45:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190708123545.19406-1-viktor.mitin.19@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] Improve Dom0-less documentation
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Viktor Mitin <viktor_mitin@epam.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Jan Beulich <jbeulich@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVsbG8sCgpPbiA3LzgvMTkgMTozNSBQTSwgVmlrdG9yIE1pdGluIHdyb3RlOgo+IFVwZGF0ZWQg
Y29uZmlndXJhdGlvbiBleGFtcGxlIGFjY29yZGluZyB0byBhcm02NAo+IGFuZCBhZGRlZCBtb3Jl
IGNhc2VzIGFib3V0IGtub3duIHhsIGxpbWl0YXRpb25zLgoKZG9tMGxlc3MgaXMgbm90IGFuIGFy
bTY0IHNwZWNpZmljIGZlYXR1cmUuIEl0IGFsc28gd29ya3Mgb24gYXJtMzIsIGFuZCAKdGhlcmVm
b3JlIHRoZSBkb2NzIHNob3VsZCB3b3JrIGZvciBib3RoIGNhc2VzLiBIb3dldmVyLi4uCgo+IAo+
IFNpZ25lZC1vZmYtYnk6IFZpa3RvciBNaXRpbiA8dmlrdG9yX21pdGluQGVwYW0uY29tPgo+IC0t
LQo+ICAgZG9jcy9mZWF0dXJlcy9kb20wbGVzcy5wYW5kb2MgfCAyOSArKysrKysrKysrKysrKysr
KysrKystLS0tLS0tLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDIxIGluc2VydGlvbnMoKyksIDggZGVs
ZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RvY3MvZmVhdHVyZXMvZG9tMGxlc3MucGFuZG9j
IGIvZG9jcy9mZWF0dXJlcy9kb20wbGVzcy5wYW5kb2MKPiBpbmRleCBlMDc2ZTM3MzllLi45NjE4
MTM2OTZmIDEwMDY0NAo+IC0tLSBhL2RvY3MvZmVhdHVyZXMvZG9tMGxlc3MucGFuZG9jCj4gKysr
IGIvZG9jcy9mZWF0dXJlcy9kb20wbGVzcy5wYW5kb2MKPiBAQCAtNjIsMTkgKzYyLDE5IEBAIGRl
dmljZSB0cmVlIGFkZGluZyBhIG5vZGUgdW5kZXIgL2Nob3NlbiBhcyBmb2xsb3dzOgo+ICAgCj4g
ICAgICAgZG9tVTEgewo+ICAgICAgIMKgIMKgIGNvbXBhdGlibGUgPSAieGVuLGRvbWFpbiI7Cj4g
LSAgICDCoCDCoCBtZW1vcnkgPSA8MHgyMDAwMD47Cj4gKyAgICDCoCDCoCBtZW1vcnkgPSA8MHgw
IDB4MjAwMDA+OyA+ICAgICAgICDCoCDCoGNwdXMgPSAxOwo+ICAgICAgIMKgwqAgwqB2cGwwMTE7
Cj4gICAKPiAgICAgICDCoCDCoCBtb2R1bGVAMjAwMDAwMCB7Cj4gICAgICAgwqAgwqAgwqAgwqAg
Y29tcGF0aWJsZSA9ICJtdWx0aWJvb3Qsa2VybmVsIiwgIm11bHRpYm9vdCxtb2R1bGUiOwo+IC0g
ICAgwqAgwqAgwqAgwqAgcmVnID0gPDB4MjAwMDAwMCAweGZmZmZmZj47Cj4gKyAgICDCoCDCoCDC
oCDCoCByZWcgPSA8MHgwIDB4MjAwMDAwMCAweDAgMHhmZmZmZmY+OwoKLi4uIG5vdGhpbmcgb24g
YXJtNjQgaW1wb3NlICNhZGRyZXNzLWNlbGxzID0gMiBhbmQgI3NpemUtY2VsbHMgPSAyLiBUaGUg
CnByb2JsZW0gaGVyZSBpcyB0aGUgdHdvIHByb3BlcnRpZXMgYXJlIG1pc3NpbmcgaW4gdGhlIG5v
ZGUgZG9tVTEuCgo+ICAgICAgIMKgIMKgIMKgIMKgIGJvb3RhcmdzID0gImNvbnNvbGU9dHR5QU1B
MCI7Cj4gICAgICAgwqAgwqAgfTsKPiAgIAo+ICAgICAgIMKgIMKgIG1vZHVsZUAzMDAwMDAwMCB7
Cj4gICAgICAgwqAgwqAgwqAgwqAgY29tcGF0aWJsZSA9ICJtdWx0aWJvb3QscmFtZGlzayIsICJt
dWx0aWJvb3QsbW9kdWxlIjsKPiAtICAgIMKgIMKgIMKgIMKgIHJlZyA9IDwweDMwMDAwMDAgMHhm
ZmZmZmY+Owo+ICsgICAgwqAgwqAgwqAgwqAgcmVnID0gPDB4MCAweDMwMDAwMDAgMHgwIDB4ZmZm
ZmZmPjsKPiAgICAgICDCoCDCoCB9Owo+ICAgICAgIH07Cj4gICAKPiBAQCAtOTAsMTIgKzkwLDI1
IEBAIExpbWl0YXRpb25zCj4gICBEb21haW5zIHN0YXJ0ZWQgYnkgWGVuIGF0IGJvb3QgdGltZSBj
dXJyZW50bHkgaGF2ZSB0aGUgZm9sbG93aW5nCj4gICBsaW1pdGF0aW9uczoKPiAgIAo+IC0tIFRo
ZXkgY2Fubm90IGJlIHByb3Blcmx5IHNodXRkb3duIG9yIHJlYm9vdGVkIHVzaW5nIHhsLiBJZiBv
bmUgb2YgdGhlbQo+IC0gIGNyYXNoZXMsIHRoZSB3aG9sZSBwbGF0Zm9ybSBzaG91bGQgYmUgcmVi
b290ZWQuCj4gLQo+ICAgLSBTb21lIHhsIG9wZXJhdGlvbnMgbWlnaHQgbm90IHdvcmsgYXMgZXhw
ZWN0ZWQuIHhsIGlzIG1lYW50IHRvIGJlIHVzZWQKPiAtICB3aXRoIGRvbWFpbnMgdGhhdCBoYXZl
IGJlZW4gY3JlYXRlZCBieSBpdC4gVXNpbmcgeGwgd2l0aCBkb21haW5zCj4gLSAgc3RhcnRlZCBi
eSBYZW4gYXQgYm9vdCBtaWdodCBub3Qgd29yayBhcyBleHBlY3RlZC4KPiArICB3aXRoIGRvbWFp
bnMgdGhhdCBoYXZlIGJlZW4gY3JlYXRlZCBieSBpdDoKPiArCj4gKyAgICAtPiBVc2luZyB4bCB3
aXRoIGRvbWFpbnMgc3RhcnRlZCBieSBYZW4gYXQgYm9vdCBtaWdodCBub3Qgd29yawo+ICsgICAg
ICAgYXMgZXhwZWN0ZWQuCj4gKwo+ICsgICAgLT4gVGhleSBjYW5ub3QgYmUgcHJvcGVybHkgc2h1
dGRvd24gb3IgcmVib290ZWQgdXNpbmcgeGwuCj4gKyAgICAgICBJZiBvbmUgb2YgdGhlbSBjcmFz
aGVzLCB0aGUgd2hvbGUgcGxhdGZvcm0gc2hvdWxkIGJlIHJlYm9vdGVkLgo+ICsKPiArICAgIC0+
ICd4bCBjb25zb2xlJyBjb21tYW5kIHdpbGwgbm90IHN3aXRjaCBjb25zb2xlIGlucHV0LgoKJ3hs
IGNvbnNvbGUnIGRvZXMgbm90IHN3aXRjaCBpbnB1dC4gVGhlIGNvbW1hbmQgd2lsbCBhdHRhY2gg
dG8gdGhlIApkb21haW4ncyBjb25zb2xlLgoKQnV0IEkgd291bGQgbm90IHZpZXcgdGhpcyBhcyBh
IHJlc3RyaWN0aW9uLCB0aGV5IGFyZSBkb21haW5zIGNyZWF0ZWQgYnkgClhlbiAoc2ltaWxhciB0
byBEb20wKSBhbmQgdGhlcmVmb3JlIHRoZXkgYXJlIGFsbCBtYW5hZ2VkIGJ5IFhlbiBhbmQgc29t
ZSAKb2YgdGhlIGNvbW1hbmRzIG1heSBub3Qgd29yay4KCj4gKyAgICAgICBUeXBlICdDVFJMLWEn
IHRocmVlIHRpbWVzIHRvIHN3aXRjaCBpbnB1dCBpbiBjYXNlIG9mIGRvbTBsZXNzIG1vZAoKVGhp
cyBpcyBjb25mdXNpbmcgdG8gcmVhZC4gWW91IHdpbGwgc3dpdGNoIGlucHV0IHRvIHRoZSBuZXh0
ICJkb21haW4iLiAKVGhpcyBjb3VsZCBiZSBYZW4gb3Igb25lIG9mIHRoZSBkb21haW4uCgpBbHNv
LCBhIHVzZXIgaXMgYWxsb3dlZCB0byBjb25maWd1cmUgdGhlIGtleSBzZXF1ZW5jZSB0byBzd2l0
Y2ggaW5wdXQuClNvIGl0IHdvdWxkIGJlIGJldHRlciB0byB3cml0ZSBzb21ldGhpbmcgbGlrZTog
InByZXNzaW5nIHRoZSBYZW4KImNvbnN3aXRjaCIgKEN0cmwtQSBieSBkZWZhdWx0KSB0aHJlZSB0
aW1lcyIKCj4gKwo+ICsgICAgLT4gJ3hsIGxpc3QnIHByaW50cyB0aGUgbGlzdCBvZiBkb21haW5z
Lgo+ICsgICAgICAgSG93ZXZlciBEb21VIG5hbWVzIGFyZSBzaG93biBhcyAnKG51bGwpJyBpbiB0
aGUgbGlzdC4gRm9yIGV4YW1wbGU6CgpUaGlzIGlzIG5vdCBzcGVjaWZpYyB0byAneGwgbGlzdCcu
IERvbWFpbnMgY3JlYXRlZCBieSBYZW4gd2lsbCBoYXZlIG5vIApuYW1lIGF0IGJvb3QuIERvbWFp
bi0wIGhhcyBhIG5hbWUgdGhhbmtzIHRvIHRoZSBoZWxwZXIgeGVuLWluaXQtZG9tMCAKY2FsbGVk
IGF0IGJvb3QgYnkgdGhlIGluaXRzY3JpcHQuCgpJZiB5b3Ugd2FudCB0byBoYXZlIG5hbWUgaGVy
ZSwgdGhlbiB5b3Ugd2lsbCBoYXZlIHRvIGNyZWF0ZSB0aGUgeGVuc3RvcmUgCm5vZGUgYXNzb2Np
YXRlZC4KCj4gKwo+ICsgICAgICAgIHJvb3RAZG9tMDp+IyB4bCBsaXN0Cj4gKyAgICAgICAgTmFt
ZSAgICAgICAgICAgICAgICAgICAgICAgICBJRCAgIE1lbSBWQ1BVcyAgICAgIFN0YXRlICAgVGlt
ZShzKQo+ICsgICAgICAgIERvbWFpbi0wICAgICAgICAgICAgICAgICAgICAgIDAgICAyNTYgICAg
IDQgICAgIHItLS0tLSAgICAgICA2LjIKPiArICAgICAgICAobnVsbCkgICAgICAgICAgICAgICAg
ICAgICAgICAxICAgMjU2ICAgICAxICAgICAtYi0tLS0gICAgICAgMS43Cj4gICAKPiAgIC0gVGhl
IEdJQyB2ZXJzaW9uIGlzIHRoZSBuYXRpdmUgdmVyc2lvbi4gSW4gYWJzZW5jZSBvZiBvdGhlcgo+
ICAgICBpbmZvcm1hdGlvbiwgdGhlIEdJQyB2ZXJzaW9uIGV4cG9zZWQgdG8gdGhlIGRvbWFpbnMg
c3RhcnRlZCBieSBYZW4gYXQKPiAKCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
