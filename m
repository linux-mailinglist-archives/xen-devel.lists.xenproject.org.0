Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F817BC0A
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2019 10:44:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsk9s-0005QH-E1; Wed, 31 Jul 2019 08:40:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8Zog=V4=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hsk9q-0005QA-80
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2019 08:40:26 +0000
X-Inumbo-ID: d5919f00-b36e-11e9-b82f-8bfc9f3a1358
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id d5919f00-b36e-11e9-b82f-8bfc9f3a1358;
 Wed, 31 Jul 2019 08:40:22 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D14F3337;
 Wed, 31 Jul 2019 01:40:21 -0700 (PDT)
Received: from [10.37.8.36] (unknown [10.37.8.36])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D897A3F575;
 Wed, 31 Jul 2019 01:40:19 -0700 (PDT)
To: Viktor Mitin <viktor.mitin.19@gmail.com>, xen-devel@lists.xenproject.org
References: <20190731081041.25256-1-viktor.mitin.19@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <934d90a9-0b01-1b5a-0d41-c7692c9a29ec@arm.com>
Date: Wed, 31 Jul 2019 09:40:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190731081041.25256-1-viktor.mitin.19@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4] xen/doc: Improve Dom0-less documentation
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

SGksCgpPbiA3LzMxLzE5IDk6MTAgQU0sIFZpa3RvciBNaXRpbiB3cm90ZToKPiAtIENoYW5nZWQg
dW5wcmludGFibGUgY2hhcmFjdGVycyB3aXRoICVzL1wleEEwLyAvZwo+ICAgIFNvIGFsbCB0aGUg
c3BhY2VzIGFyZSAweDIwIG5vdy4KPiAKPiAtIEFkZGVkIGFkZHJlc3MtY2VsbHMgYW5kIHNpemUt
Y2VsbHMgdG8gY29uZmlndXJhdGlvbiBleGFtcGxlLgo+ICAgIFRoaXMgcmVzb2x2ZXMgdGhlIGRv
bTBsZXNzIGJvb3QgaXNzdWUgaW4gY2FzZSBvZiBhcm02NC4KPiAKPiAtIEFkZGVkIHNvbWUgbm90
ZXMgYWJvdXQgeGwgdG9vbHMgdXNhZ2UgaW4gY2FzZSBvZiBkb20wbGVzcy4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBWaWt0b3IgTWl0aW4gPHZpa3Rvcl9taXRpbkBlcGFtLmNvbT4KPiAtLS0KPiB2NCB1
cGRhdGVzOgo+ICAgICAtIGZpeGVkIGNwdXMgPDE+Owo+ICAgICAtIGFkZGVkIG1lbW9yeSBzaXpl
IG5vdGU7Cj4gICAgIC0gY2hhbmdlZCBzb21lIG51bWJlcnMgdG8gZGVjaW1hbDsKPiAKPiAtLS0K
PiAgIGRvY3MvZmVhdHVyZXMvZG9tMGxlc3MucGFuZG9jIHwgNjEgKysrKysrKysrKysrKysrKysr
KysrKysrLS0tLS0tLS0tLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA0MiBpbnNlcnRpb25zKCspLCAx
OSBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZG9jcy9mZWF0dXJlcy9kb20wbGVzcy5w
YW5kb2MgYi9kb2NzL2ZlYXR1cmVzL2RvbTBsZXNzLnBhbmRvYwo+IGluZGV4IGUwNzZlMzczOWUu
LmEyYzk1ZDFmZDQgMTAwNjQ0Cj4gLS0tIGEvZG9jcy9mZWF0dXJlcy9kb20wbGVzcy5wYW5kb2MK
PiArKysgYi9kb2NzL2ZlYXR1cmVzL2RvbTBsZXNzLnBhbmRvYwo+IEBAIC00MCw4ICs0MCw4IEBA
IHRvIGJvb3QuIEZvciBleGFtcGxlIGlmIHRoaXMgaXMgdGhlIGJvb3RjbWQgZm9yIFhlbiBhbmQg
RG9tMDoKPiAKPiAgICAgICBib290bSAweDE0MDAwMDAgMHg5MDAwMDAwIDB4MTI4MDAwMAo+IAo+
IC1JZiB3ZSB3YW50IHRvIGFkZCBvbmUgRG9tVSB3aXRoIEltYWdlLURvbVXCoGFzIHRoZSBEb21V
IGtlcm5lbAo+IC1hbmTCoHJhbWRpc2stRG9tVcKgYXMgRG9tVSByYW1kaXNrOgo+ICtJZiB3ZSB3
YW50IHRvIGFkZCBvbmUgRG9tVSB3aXRoIEltYWdlLURvbVUgYXMgdGhlIERvbVUga2VybmVsCj4g
K2FuZCByYW1kaXNrLURvbVUgYXMgRG9tVSByYW1kaXNrOgo+IAo+ICAgICAgIHRmdHBiIDB4MTI4
MDAwMCB4ZW4uZHRiCj4gICAgICAgdGZ0cGIgMHg4MDAwMCB4ZW4tSW1hZ2UKPiBAQCAtNjEsMjcg
KzYxLDMyIEBAIHRoZSBwcmVzZW5jZSBvZiB0aGUgYWRkaXRpb25hbCBWTSBhbmQgaXRzIGNvbmZp
Z3VyYXRpb24uIEl0IGlzIGRvbmUgdmlhCj4gICBkZXZpY2UgdHJlZSBhZGRpbmcgYSBub2RlIHVu
ZGVyIC9jaG9zZW4gYXMgZm9sbG93czoKPiAKPiAgICAgICBkb21VMSB7Cj4gLSAgICDCoCDCoCBj
b21wYXRpYmxlID0gInhlbixkb21haW4iOwo+IC0gICAgwqAgwqAgbWVtb3J5ID0gPDB4MjAwMDA+
Owo+IC0gICAgIMKgIMKgY3B1cyA9IDE7Cj4gLSAgICDCoMKgIMKgdnBsMDExOwo+IC0KPiAtICAg
IMKgIMKgIG1vZHVsZUAyMDAwMDAwIHsKPiAtICAgIMKgIMKgIMKgIMKgIGNvbXBhdGlibGUgPSAi
bXVsdGlib290LGtlcm5lbCIsICJtdWx0aWJvb3QsbW9kdWxlIjsKPiAtICAgIMKgIMKgIMKgIMKg
IHJlZyA9IDwweDIwMDAwMDAgMHhmZmZmZmY+Owo+IC0gICAgwqAgwqAgwqAgwqAgYm9vdGFyZ3Mg
PSAiY29uc29sZT10dHlBTUEwIjsKPiAtICAgIMKgIMKgIH07Cj4gLQo+IC0gICAgwqAgwqAgbW9k
dWxlQDMwMDAwMDAwIHsKPiAtICAgIMKgIMKgIMKgIMKgIGNvbXBhdGlibGUgPSAibXVsdGlib290
LHJhbWRpc2siLCAibXVsdGlib290LG1vZHVsZSI7Cj4gLSAgICDCoCDCoCDCoCDCoCByZWcgPSA8
MHgzMDAwMDAwIDB4ZmZmZmZmPjsKPiAtICAgIMKgIMKgIH07Cj4gKyAgICAgICAgI2FkZHJlc3Mt
Y2VsbHMgPSA8MT47Cj4gKyAgICAgICAgI3NpemUtY2VsbHMgPSA8MT47Cj4gKyAgICAgICAgY29t
cGF0aWJsZSA9ICJ4ZW4sZG9tYWluIjsKPiArICAgICAgICBtZW1vcnkgPSA8MCA1MjQyODg+OwoK
Rm9yIGEgZmlyc3QsIHRoZSBuZXcgdmFsdWUgZG9lcyBub3QgbWF0Y2ggdGhlIG9sZCBvbmUgKDB4
MjAwMDAgPSAxMzEwNzIgCmluIGRlY2ltYWwpLgoKSG93ZXZlciwgdGhpcyBkb2VzIG5vdCBtYWtl
cyBtdWNoIHNlbnNlIHRvIGRlc2NyaWJlIHRoZSBtZW1vcnkgc2l6ZSBpbiAKZGVjaW1hbCBoZXJl
IGFuZCAuLi4KCj4gKyAgICAgICAgY3B1cyA9IDwxPjsKPiArICAgICAgICB2cGwwMTE7Cj4gKwo+
ICsgICAgICAgIG1vZHVsZUAyMDAwMDAwIHsKPiArICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJt
dWx0aWJvb3Qsa2VybmVsIiwgIm11bHRpYm9vdCxtb2R1bGUiOwo+ICsgICAgICAgICAgICByZWcg
PSA8MHgyMDAwMDAwIDB4ZmZmZmZmPjsKCi4uLiBoZXJlIGluIGhleGFkZWNpbWFsLiBGb3IgbWVt
b3J5LCBpdCBpcyBmYWlybHkgY29tbW9uIHRvIHVzZSBoZXhhZGVjaW1hbC4KCkkgY2FuIHN3aXRj
aCB0aGUgbWVtb3J5IHByb3BlcnR5IGJhY2sgdG8gaGV4YWRlY2ltYWwgb24gY29tbWl0LiBCdXQg
SSAKd291bGQgbGlrZSB0byB1bmRlcnN0YW5kIHdoeSB0aGUgdmFsdWUgaGFzIGNoYW5nZWQgYmVm
b3JlIGRvaW5nIHRoYXQuCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
