Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB54C1FC2
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 13:07:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEtUk-0008BQ-61; Mon, 30 Sep 2019 11:05:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=I/AJ=XZ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iEtUj-0008B2-5a
 for xen-devel@lists.xen.org; Mon, 30 Sep 2019 11:05:33 +0000
X-Inumbo-ID: 37bdfbaa-e372-11e9-bf31-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by localhost (Halon) with ESMTP
 id 37bdfbaa-e372-11e9-bf31-bc764e2007e4;
 Mon, 30 Sep 2019 11:05:31 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D152C1000;
 Mon, 30 Sep 2019 04:05:30 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CCC123F534;
 Mon, 30 Sep 2019 04:05:29 -0700 (PDT)
To: Oleksandr <olekstysh@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <alpine.DEB.2.21.1909251146261.24909@sstabellini-ThinkPad-T480s>
 <20190925184924.21691-5-sstabellini@kernel.org>
 <0eef5f6f-a8f2-4a6c-745f-56a16314d3ac@arm.com>
 <e1ccdeff-58f7-11ff-f07f-1e9457ca578d@gmail.com>
 <d24ff53d-b153-b00f-4374-5fe9fbd80e47@arm.com>
 <alpine.DEB.2.21.1909271627160.2594@sstabellini-ThinkPad-T480s>
 <697f53cd-2e3b-8890-45e8-4897a29b4133@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <f2f155dd-4387-61ca-9a16-496c958352a7@arm.com>
Date: Mon, 30 Sep 2019 12:05:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <697f53cd-2e3b-8890-45e8-4897a29b4133@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 5/8] xen/arm: assign devices to boot
 domains
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
Cc: Stefano Stabellini <stefanos@xilinx.com>,
 "andrii_anisov@epam.com" <andrii_anisov@epam.com>,
 Achin Gupta <Achin.Gupta@arm.com>,
 "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>, nd <nd@arm.com>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgT2xla3NhbmRyLAoKT24gMzAvMDkvMjAxOSAxMDozNCwgT2xla3NhbmRyIHdyb3RlOgo+IE9u
IDI4LjA5LjE5IDAyOjI4LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4+Pj4gSSBoYXZlIHRv
IGFkbWl0IHRoYXQgSSBkb24ndCBrbm93IGFib3V0IGRvbTBsZXNzIGZlYXR1cmUgZW5vdWdoIC4u
Lgo+Pj4+Cj4+Pj4KPj4+PiBCdXQsIHNob3VsZG4ndCB3ZSBjaGVjayBpZiB0aGUgZGV2aWNlIGlz
IGJlaGluZCB0aGUgSU9NTVUgYW5kIHRyeSB0byBhZGQKPj4+PiBpdCAoaW9tbXVfYWRkX2R0X2Rl
dmljZSkgYmVmb3JlIGFzc2lnbmluZyBpdCAodGhpcyBpcyBuZWVkZWQgZm9yIGRyaXZlcnMKPj4+
PiB3aGljaCBzdXBwb3J0IGdlbmVyaWMgSU9NTVUgRFQgYmluZGluZ3MgaW4gdGhlIGZpcnN0IHBs
YWNlKS4KPj4+Pgo+Pj4+IFtwbGVhc2UgdGFrZSBhIGxvb2sgYXQKPj4+PiBodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMTktMDkvbXNnMDI3MTQu
aHRtbAo+Pj4+IGlmIHNvXQo+Pj4+Cj4+Pj4gSnVsaWVuLCB3aGF0IGRvIHlvdSB0aGluaz8KPj4+
IFllcyB5b3UgYXJlIHJpZ2h0Lgo+Pj4KPj4+IEBTdGVmYW5vLCB0aGlzIGlzIGEgcmVjZW50bHkg
bWVyZ2VkIGZlYXR1cmUuIFdpdGhvdXQgaXQsIHlvdSB3aWxsIG5vdCBiZQo+Pj4gYWJsZSB0byB1
c2UgcGFzc3Rocm91Z2ggd2l0aCBkb20wbGVzcyBndWVzdCB3aGVuIHRoZSBJT01NVSAoc3VjaCBh
cwo+Pj4gSVBNTVUpIGlzIHVzaW5nIHRoZSBnZW5lcmljIERUIGJpbmRpbmdzLgo+PiBKdXN0IGRv
dWJsZS1jaGVja2luZyBidXQgaXQgc2hvdWxkIGJlIG9ubHkgYSBtYXR0ZXIgb2YgdGhlIGZvbGxv
d2luZywKPj4gcmlnaHQ/Cj4+Cj4+ICvCoMKgwqDCoMKgwqDCoCByZXMgPSBpb21tdV9hZGRfZHRf
ZGV2aWNlKG5vZGUpOwo+PiArwqDCoMKgwqDCoMKgwqAgaWYgKCByZXMgPCAwICkKPj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIHJlczsKPiAKPiBJIHRoaW5rLCB0aGUgY2hhbmdlIGFi
b3ZlIGlzIGNvcnJlY3QuCj4gCj4gCj4+ICsKPj4gK8KgwqDCoMKgwqDCoMKgIGlmICggZHRfZGV2
aWNlX2lzX3Byb3RlY3RlZChub2RlKSApCj4+ICvCoMKgwqDCoMKgwqDCoCB7Cj4+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHJlcyA9IGlvbW11X2Fzc2lnbl9kdF9kZXZpY2Uoa2luZm8tPmQsIG5v
ZGUpOwo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoIHJlcyA8IDAgKQo+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiByZXM7Cj4+ICvCoMKgwqDCoMKgwqDCoCB9
Cj4+ICsKPj4KPj4gKEkgYW0gYXNraW5nIGJlY2F1c2UgSSBjb3VsZG4ndCBxdWl0ZSB0ZXN0IGl0
IGR1ZSB0byB0aGUgZXJyb3Igd2l0aAo+PiBtbXUtbWFzdGVycyBJIG1lbnRpb25lZCBpbiB0aGUg
b3RoZXIgZW1haWwuKQo+IFJlZ2FyZGluZyB0aGUgY2hlY2sgImlmIChkdF9kZXZpY2VfaXNfcHJv
dGVjdGVkKG5vZGUpKSIgaGVyZS4gSSB0aGluaywgaXQgCj4gZGVwZW5kcyBvbiB0aGUgInhlbixw
YXRoIiBwdXJwb3NlLgo+IAo+IDEuIElmICJ4ZW4scGF0aCIgcHJvcGVydHkgaXMsIGxldCBzYXks
IGNsb3NlIHRvICJkdGRldiIgcHJvcGVydHkgaW4gZG9tYWluIAo+IGNvbmZpZyBmaWxlLCB3aGVy
ZSB3ZSBkZXNjcmliZSBtYXN0ZXIgZGV2aWNlcyB3aGljaCBhcmUgYmVoaW5kIHRoZSBJT01NVSwg
c28gCj4gKm11c3QqIGJlIHByb3RlY3RlZCwgdGhlbiB0aGF0IGNoZWNrIHNob3VsZCBiZSByZW1v
dmVkLiBQbGVhc2Ugc2VlIAo+IGlvbW11X2RvX2R0X2RvbWN0bCgpLgo+IAo+IDIuIElmICJ4ZW4s
cGF0aCIgcHJvcGVydHkgY2FuIGFsc28gYmUgdXNlZCB0byBkZXNjcmliZSBkZXZpY2VzIHdoaWNo
IGFyZSBub3QgCj4gYmVoaW5kIHRoZSBJT01NVSAoc28gZG9uJ3QgbmVlZCB0byBiZSBwcm90ZWN0
ZWQpLCBidXQganVzdCBmb3IgdGhlICJpbnRlcnJ1cHQgCj4gbWFwcGluZ3MiIHB1cnBvc2VzLCB0
aGVuIHRoYXQgY2hlY2sgaXMgY29ycmVjdCBhbmQgc2hvdWxkIHJlbWFpbi4KClNvbWUgZGV2aWNl
IG1heSBub3QgYmUgYmVoaW5kIGFuIElPTU1VIGJ1dCBzdGlsbCBkbyBETUEuIFdlIGFyZSBub3Qg
ZG9pbmcgYSAKZmF2b3IgdG8gdGhlIHVzZXIgdG8gY29udGludWUgdGhlIGFzc2lnbm1lbnQgYXMg
dGhpcyBjb3VsZCBsZWFkIHRvIGF0IGJlc3QgdG8gYSAKbm9uLXdvcmtpbmcgZGV2aWNlIChhdCB3
b3JzdCBhIHNlY3VyaXR5IGlzc3VlKS4KClRoZXJlZm9yZSBJIGFtIGFnYWluc3QgdGhlIHNvbHV0
aW9uIDIpLgoKSG93ZXZlciwgdGhpcyByYWlzZXMgc29tZSBxdWVzdGlvbnMgd2h5IE1NSU9zIGFy
ZSB0cmVhdGVkIGRpZmZlcmVudGx5IChpLmUgdGhleSAKZG9uJ3QgbmVlZCBhbiBJT01NVSkuCgpJ
biB0aGUgY3VycmVudCBzZXR1cCwgeW91IHdvdWxkIG5vdCBiZSBhYmxlIHRvIHBhc3N0aHJvdWdo
IGEgbm9uIERNQS1jYXBhYmxlIHRvIAphIGd1ZXN0IGlmIHRoZXkgbmVlZHMgaW50ZXJydXB0cyAo
ZS5nLiBhbiBVQVJUKSBidXQgeW91IHdvdWxkIGJlIGlmIHRoZXkgZG9uJ3QgCnVzZSBpbnRlcnJ1
cHRzLgoKU28gSSB0aGluayB3ZSBuZWVkIGEgY291cGxlIG9mIG1vcmUgY2hhbmdlczoKICAgIDEp
IEludHJvZHVjZSBhbiBvcHRpb24gdG8gYWxsb3cgdGhlIHVzZXIgdG8gaWdub3JlIElPTU1VIGlz
c3VlcyAoc29tZXRoaW5nIApsaWtlICJ4ZW4sZm9yY2UtYXNzaWduLXdpdGhvdXQtaW9tbXUiKS4K
ICAgIDIpICJ4ZW4scmVnIiBjYW5ub3QgYmUgc3BlY2lmaWVkIHdpdGhvdXQgInhlbixwYXRoIi4g
VGhpcyBhbGxvd3MgdXMgdG8gCnBvbGljZSB0aGUgdXNlciBEVC4KCkFueSBvcGluaW9ucz8KCkNo
ZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
