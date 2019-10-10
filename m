Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E66D2DD4
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2019 17:35:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iIaR5-0000wJ-Gw; Thu, 10 Oct 2019 15:33:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=njQE=YD=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iIaR3-0000w6-Ir
 for xen-devel@lists.xenproject.org; Thu, 10 Oct 2019 15:33:01 +0000
X-Inumbo-ID: 3c39f8ba-eb73-11e9-bbab-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 3c39f8ba-eb73-11e9-bbab-bc764e2007e4;
 Thu, 10 Oct 2019 15:32:57 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 697DE337;
 Thu, 10 Oct 2019 08:32:57 -0700 (PDT)
Received: from [10.1.39.39] (e110479-lin.cambridge.arm.com [10.1.39.39])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8818F3F6C4;
 Thu, 10 Oct 2019 08:32:56 -0700 (PDT)
To: Oleksandr <olekstysh@gmail.com>, xen-devel@lists.xenproject.org
References: <1570548304-12020-1-git-send-email-olekstysh@gmail.com>
 <948ee2a4-8a6a-57d5-3358-e0d6217624cb@arm.com>
 <94356055-721d-91bf-ac16-462da510007f@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <71e64847-2ce7-0954-4ab9-72f678d5dc93@arm.com>
Date: Thu, 10 Oct 2019 16:32:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <94356055-721d-91bf-ac16-462da510007f@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13 v2] xen/arm: domain_build: Don't
 expose IOMMU specific properties to hwdom
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
Cc: Juergen Gross <jgross@suse.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, sstabellini@kernel.org,
 volodymyr_babchuk@epam.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAxMC8xMC8xOSA0OjI3IFBNLCBPbGVrc2FuZHIgd3JvdGU6Cj4gCj4gT24gMTAuMTAu
MTkgMTg6MTgsIEp1bGllbiBHcmFsbCB3cm90ZToKPj4gSGksCj4gCj4gSGkgSnVsaWVuCj4gCj4g
Cj4+Cj4+IE9uIDEwLzgvMTkgNDoyNSBQTSwgT2xla3NhbmRyIFR5c2hjaGVua28gd3JvdGU6Cj4+
PiBGcm9tOiBPbGVrc2FuZHIgVHlzaGNoZW5rbyA8b2xla3NhbmRyX3R5c2hjaGVua29AZXBhbS5j
b20+Cj4+Pgo+Pj4gV2UgZG9uJ3QgcGFzc3Rocm91Z2ggSU9NTVUgZGV2aWNlIHRvIGh3ZG9tIGV2
ZW4gaWYgaXQgaXMgbm90IHVzZWQgYnkgCj4+PiBYZW4uCj4+PiBUaGVyZWZvcmUgZXhwb3Npbmcg
dGhlIHByb3BlcnRpZXMgdGhhdCBkZXNjcmliZSByZWxhdGlvbnNoaXAgYmV0d2Vlbgo+Pj4gbWFz
dGVyIGRldmljZXMgYW5kIElPTU1VcyBkb2VzIG5vdCBtYWtlIGFueSBzZW5zZS4KPj4+Cj4+PiBB
Y2NvcmRpbmcgdG8gdGhlOgo+Pj4gMS4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2lvbW11L2lvbW11LnR4dAo+Pj4gMi4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L3BjaS9wY2ktaW9tbXUudHh0Cj4+Cj4+IEl0IGlzIG5vdCBlbnRpcmVseSBjbGVhciB0aGF0IGRv
Y3VtZW50YXRpb24gaXMgZnJvbSBMaW51eC4KPiAKPiBXaWxsIGNsYXJpZnkuCj4gCj4gCj4+Cj4+
Pgo+Pj4gU2lnbmVkLW9mZi1ieTogT2xla3NhbmRyIFR5c2hjaGVua28gPG9sZWtzYW5kcl90eXNo
Y2hlbmtvQGVwYW0uY29tPgo+Pj4KPj4+IC0tLQo+Pj4gQ2hhbmdlcyBWMSBbMV0gLT4gVjI6Cj4+
PiDCoMKgwqAgLSBPbmx5IHNraXAgSU9NTVUgc3BlY2lmaWMgcHJvcGVydGllcyBvZiB0aGUgbWFz
dGVyIGRldmljZSBpZiB3ZQo+Pj4gwqDCoMKgwqDCoCBza2lwIHRoZSBjb3JyZXNwb25kaW5nIElP
TU1VIGRldmljZQo+Pj4gwqDCoMKgIC0gVXNlICJod2RvbSIgb3ZlciAiRG9tMCIKPj4+Cj4+PiBb
MV0gCj4+PiBodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL2FyY2hpdmVzL2h0bWwveGVuLWRl
dmVsLzIwMTktMTAvbXNnMDAxMDQuaHRtbCAKPj4+Cj4+PiAtLS0KPj4+IMKgIHhlbi9hcmNoL2Fy
bS9kb21haW5fYnVpbGQuYyB8IDI5ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4+PiDC
oCAxIGZpbGUgY2hhbmdlZCwgMjkgaW5zZXJ0aW9ucygrKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS94
ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMgYi94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMK
Pj4+IGluZGV4IDZkNmRkNTIuLmE3MzIxYjggMTAwNjQ0Cj4+PiAtLS0gYS94ZW4vYXJjaC9hcm0v
ZG9tYWluX2J1aWxkLmMKPj4+ICsrKyBiL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYwo+Pj4g
QEAgLTQ4MCwxMCArNDgwLDI2IEBAIHN0YXRpYyBpbnQgX19pbml0IHdyaXRlX3Byb3BlcnRpZXMo
c3RydWN0IAo+Pj4gZG9tYWluICpkLCBzdHJ1Y3Qga2VybmVsX2luZm8gKmtpbmZvLAo+Pj4gwqDC
oMKgwqDCoCBjb25zdCBzdHJ1Y3QgZHRfcHJvcGVydHkgKnByb3AsICpzdGF0dXMgPSBOVUxMOwo+
Pj4gwqDCoMKgwqDCoCBpbnQgcmVzID0gMDsKPj4+IMKgwqDCoMKgwqAgaW50IGhhZF9kb20wX2Jv
b3RhcmdzID0gMDsKPj4+ICvCoMKgwqAgc3RydWN0IGR0X2RldmljZV9ub2RlICppb21tdV9ub2Rl
Owo+Pj4gwqAgwqDCoMKgwqDCoCBpZiAoIGtpbmZvLT5jbWRsaW5lICYmIGtpbmZvLT5jbWRsaW5l
WzBdICkKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBib290YXJncyA9ICZraW5mby0+Y21kbGluZVsw
XTsKPj4+IMKgICvCoMKgwqAgLyoKPj4+ICvCoMKgwqDCoCAqIElmIHdlIHNraXAgdGhlIElPTU1V
IGRldmljZSB3aGVuIGNyZWF0aW5nIERUIGZvciBod2RvbSAoZXZlbiBpZgo+Pj4gK8KgwqDCoMKg
ICogdGhlIElPTU1VIGRldmljZSBpcyBub3QgdXNlZCBieSBYZW4pLCB3ZSBzaG91bGQgYWxzbyBz
a2lwIHRoZSAKPj4+IElPTU1VCj4+PiArwqDCoMKgwqAgKiBzcGVjaWZpYyBwcm9wZXJ0aWVzIG9m
IHRoZSBtYXN0ZXIgZGV2aWNlIGJlaGluZCBpdCBpbiBvcmRlciAKPj4+IHRvIGF2b2lkCj4+PiAr
wqDCoMKgwqAgKiBleHBvc2luZyBhbiBoYWxmIGNvbXBsZXRlIElPTU1VIGJpbmRpbmdzIHRvIGh3
ZG9tLgo+Pj4gK8KgwqDCoMKgICogVXNlICJpb21tdV9ub2RlIiBhcyBhbiBpbmRpY2F0b3Igb2Yg
dGhlIG1hc3RlciBkZXZpY2Ugd2hpY2ggCj4+PiBwcm9wZXJ0aWVzCj4+PiArwqDCoMKgwqAgKiBz
aG91bGQgYmUgc2tpcHBlZC4KPj4+ICvCoMKgwqDCoCAqLwo+Pj4gK8KgwqDCoCBpb21tdV9ub2Rl
ID0gZHRfcGFyc2VfcGhhbmRsZShub2RlLCAiaW9tbXVzIiwgMCk7Cj4+Cj4+IFRoZSBjb2RlIGlz
IHNsaWdodGx5IGNvbmZ1c2luZyB0byByZWFkLiBJIGRvbid0IHRoaW5rIHdlIHNob3VsZCBjYXJl
IAo+PiBvZiBpbnZhbGlkIERUIGhlcmUsIHNvIGxldCdzIG9ubHkgY29uc2lkZXIgdmFsaWQgb25l
Lgo+IAo+IERvIHlvdSBtZWFuICJ0aGUgY29tbWVudCIgaXMgY29uZnVzaW5nIHRvIHJlYWQ/CgpU
aGUgY29kZSBpcyBjb25mdXNpbmcgYmVjYXVzZSAiaW9tbXVzIiBzaG91bGQgYWx3YXlzIHBvaW50
IHRvIGEgSU9NTVUgCm5vZGUsIGJ1dCB0aGVuIHlvdSBjaGVjayB3aGV0aGVyIHRoaXMgaXMgYW4g
SU9NTVUuIFNvIGl0IGlzIG5vdCBjbGVhciBpZiAKdGhpcyBpcyBkb25lIGZvciBzYW5pdHkgY2hl
Y2sgKG9yIGZvciBhIGRpZmZlcmVudCByZWFzb24pLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFs
bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
