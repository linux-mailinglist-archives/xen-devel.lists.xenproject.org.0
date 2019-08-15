Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0AA58EA4A
	for <lists+xen-devel@lfdr.de>; Thu, 15 Aug 2019 13:31:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hyDwh-0006Id-M2; Thu, 15 Aug 2019 11:29:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=y4W9=WL=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hyDwf-0006IL-Nk
 for xen-devel@lists.xenproject.org; Thu, 15 Aug 2019 11:29:29 +0000
X-Inumbo-ID: f117f4f8-bf4f-11e9-8b9a-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id f117f4f8-bf4f-11e9-8b9a-12813bfff9fa;
 Thu, 15 Aug 2019 11:29:28 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A66D8360;
 Thu, 15 Aug 2019 04:29:27 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 254993F694;
 Thu, 15 Aug 2019 04:29:27 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <alpine.DEB.2.21.1908121227360.7788@sstabellini-ThinkPad-T480s>
 <20190812222844.9636-2-sstabellini@kernel.org> <87ftm5gnkc.fsf@epam.com>
 <alpine.DEB.2.21.1908141528250.8737@sstabellini-ThinkPad-T480s>
 <875zmyhdzi.fsf@epam.com> <9452f4b5-7e36-0514-f207-a6b7c4410ea6@arm.com>
Message-ID: <79e7a0a2-7c1e-cfe9-b5b1-d503075f60bd@arm.com>
Date: Thu, 15 Aug 2019 12:29:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <9452f4b5-7e36-0514-f207-a6b7c4410ea6@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 2/7] xen/arm: make process_memory_node a
 device_tree_node_func
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAxNS8wOC8yMDE5IDEyOjI0LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gSGkgVm9sb2R5bXly
LAo+IAo+IE9uIDE1LzA4LzIwMTkgMTI6MjAsIFZvbG9keW15ciBCYWJjaHVrIHdyb3RlOgo+Pgo+
PiBIaSBTdGVmYW5vLAo+Pgo+PiBTdGVmYW5vIFN0YWJlbGxpbmkgd3JpdGVzOgo+Pgo+Pj4gT24g
VHVlLCAxMyBBdWcgMjAxOSwgVm9sb2R5bXlyIEJhYmNodWsgd3JvdGU6Cj4+Pj4+IEBAIC0xNjIs
NiArMTU2LDEwIEBAIHN0YXRpYyB2b2lkIF9faW5pdCBwcm9jZXNzX21lbW9yeV9ub2RlKGNvbnN0
IHZvaWQgCj4+Pj4+ICpmZHQsIGludCBub2RlLAo+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgYm9v
dGluZm8ubWVtLmJhbmtbYm9vdGluZm8ubWVtLm5yX2JhbmtzXS5zaXplID0gc2l6ZTsKPj4+Pj4g
wqDCoMKgwqDCoMKgwqDCoMKgIGJvb3RpbmZvLm1lbS5ucl9iYW5rcysrOwo+Pj4+PiDCoMKgwqDC
oMKgIH0KPj4+Pj4gKwo+Pj4+PiArwqDCoMKgIGlmICggYm9vdGluZm8ubWVtLm5yX2JhbmtzID09
IE5SX01FTV9CQU5LUyApCj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVOT1NQQzsKPj4+
PiBBcmUgeW91IHN1cmUgdGhhdCB0aGlzIGxvZ2ljIGlzIGNvcnJlY3Q/Cj4+Pj4KPj4+PiBGb3Ig
ZXhhbXBsZSwgaWYgTlJfTUVNX0JBTktTIGlzIDEsIGFuZCB3ZSBoYXZlIGV4YWN0bHkgb25lIG1l
bW9yeSBub2RlCj4+Pj4gaW4gZGV2aWNlIHRyZWUsIHRoaXMgZnVuY3Rpb24gd2lsbCBmYWlsLiBC
dXQgaXQgc2hvdWxkIG5vdC4gSSB0aGluayB5b3UKPj4+PiB3YW50IHRoaXMgY29uZGl0aW9uOiBi
b290aW5mby5tZW0ubnJfYmFua3MgPiBOUl9NRU1fQkFOS1MKPj4+Cj4+PiBZb3UgYXJlIHJpZ2h0
LCBpZiBOUl9NRU1fQkFOS1MgaXMgMSBhbmQgd2UgaGF2ZSAxIG1lbW9yeSBub2RlIGluIGRldmlj
ZQo+Pj4gdHJlZSB0aGUgY29kZSB3b3VsZCByZXR1cm4gYW4gZXJyb3Igd2hpbGUgYWN0dWFsbHkg
aXQgaXMgbm9ybWFsLgo+Pj4KPj4+IEkgdGhpbmsgdGhlIHJpZ2h0IGNoZWNrIHdvdWxkIGJlOgo+
Pj4KPj4+IMKgwqAgaWYgKCBpIDwgYmFua3MgJiYgYm9vdGluZm8ubWVtLm5yX2JhbmtzID09IE5S
X01FTV9CQU5LUyApCj4+PiDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FTk9TUEM7Cj4+Cj4+IEFjdHVh
bGx5LCB0aGlzIGRvZXMgbm90IGNvdmVyIGFsbCBjb3JuZXIgY2FzZXMuIEhlcmUgaXMgdGhlIHJl
c3VsdGluZwo+PiBjb2RlOgo+Pgo+PiDCoCAxNTDCoMKgwqDCoCBmb3IgKCBpID0gMDsgaSA8IGJh
bmtzICYmIGJvb3RpbmZvLm1lbS5ucl9iYW5rcyA8IE5SX01FTV9CQU5LUzsgaSsrICkKPj4gwqAg
MTUxwqDCoMKgwqAgewo+PiDCoCAxNTLCoMKgwqDCoMKgwqDCoMKgIGRldmljZV90cmVlX2dldF9y
ZWcoJmNlbGwsIGFkZHJlc3NfY2VsbHMsIHNpemVfY2VsbHMsICZzdGFydCwgCj4+ICZzaXplKTsK
Pj4gwqAgMTUzwqDCoMKgwqDCoMKgwqDCoCBpZiAoICFzaXplICkKPj4gwqAgMTU0wqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGNvbnRpbnVlOwo+PiDCoCAxNTXCoMKgwqDCoMKgwqDCoMKgIGJvb3Rp
bmZvLm1lbS5iYW5rW2Jvb3RpbmZvLm1lbS5ucl9iYW5rc10uc3RhcnQgPSBzdGFydDsKPj4gwqAg
MTU2wqDCoMKgwqDCoMKgwqDCoCBib290aW5mby5tZW0uYmFua1tib290aW5mby5tZW0ubnJfYmFu
a3NdLnNpemUgPSBzaXplOwo+PiDCoCAxNTfCoMKgwqDCoMKgwqDCoMKgIGJvb3RpbmZvLm1lbS5u
cl9iYW5rcysrOwo+PiDCoCAxNTjCoMKgwqDCoCB9Cj4+IMKgIDE1OQo+PiDCoCAxNjDCoMKgwqDC
oCBpZiAoIGkgPCBiYW5rcyAmJiBib290aW5mby5tZW0ubnJfYmFua3MgPT0gTlJfTUVNX0JBTktT
ICkKPj4gwqAgMTYxwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVOT1NQQzsKPj4KPj4gTGluZXMg
MTUzLTE1NCBjYXVzZSB0aGUgaXNzdWUuCj4+Cj4+IEltYWdpbmUgdGhhdCBOUl9NRU1fQkFOS1Mg
PSAxIGFuZCB3ZSBoYXZlIHR3byBtZW1vcnkgbm9kZXMgaW4gZGV2aWNlCj4+IHRyZWUgd2l0aC4g
Tm9kZXMgaGF2ZSBzaXplcyAwIGFuZCAxMDI0LiBZb3VyIGNvZGUgd2lsbCB3b3JrIGFzCj4+IGlu
dGVuZGVkLiBBdCB0aGUgZW5kIG9mIGxvb3Agd2Ugd2lsbCBoYXZlIGJhbmtzID0gMiwgaSA9IDIg
YW5kCj4+IGJvb3RpbmZvLm1lbS5ucl9iYW5rcyA9IDEuCj4+Cj4+IEJ1dCBpZiB3ZSBzd2l0Y2gg
b3JkZXIgb2YgbWVtb3J5IG5vZGVzLCBzbyBmaXJzdCBvbmUgd2lsbCBiZSB3aXRoIHNpemUKPj4g
MTAyNCBhbmQgc2Vjb25kIG9uZSB3aXRoIHNpemUgMCwgeW91ciBjb2RlIHdpbGwgcmV0dXJuIC1F
Tk9TUEMsIGJlY2F1c2UKPj4gd2UnbGwgaGF2ZSBiYW5rcyA9IDIsIGkgPSAxLCBib290aW5mby5t
ZW0ubnJfYmFua3MgPSAxLgo+Pgo+PiBJIHRoaW5rLCByaWdodCBzb2x1dGlvbiB3aWxsIGJlIHRv
IHNjYW4gYWxsIG5vZGVzIHRvIGNvdW50IG5vZGVzCj4+IHdpdGggc2l6ZSA+IDAuIEFuZCB0aGVu
IC0gZWl0aGVyIHJldHVybiBhbiBlcnJvciBvciBkbyBzZWNvbmQgbG9vcCB0bwo+PiBmaWxsIGJv
b3RpbmZvLm1lbS5iYW5rW10uCj4gCj4gVG8gYmUgaG9uZXN0LCBhIG1lbW9yeSB3aXRoIHNpemUg
MCBpcyBhbiBlcnJvciBpbiB0aGUgRFQgcHJvdmlkZWQuIFNvIEkgd291bGQgCj4gbm90IGNhcmUg
dG9vIG11Y2ggaWYgWGVuIGlzIG5vdCB3b3JraW5nIGFzIGludGVuZGVkLgo+IAo+IElmIHdlIHdh
bnQgdG8gZml4IHRoaXMsIHRoZW4gd2Ugc2hvdWxkIGJhaWwgb3V0IGFzIHdlIGRvIGZvciBtaXNz
aW5nICdyZWdzJyBhbmQgCj4gaW52YWxpZCAnYWRkcmVzcy1jZWxscycvJ3NpemUtY2VsbHMnLgoK
SSBzZW5kIHRoaXMgdG9vIGVhcmx5LiBJIGZvcmdvdCB0byBtZW50aW9uIHRoYXQgSSB3b3VsZCBu
b3QgYmUgaGFwcHkgd2l0aCAKcGFyc2luZyB0aGUgRGV2aWNlLVRyZWUgdHdpY2UganVzdCBmb3Ig
YmVuZWZpdHMgb2Ygd3JvbmcgRFQuIElmIGEgRFQgaXMgd3JvbmcgCnRoZW4gd2Ugc2hvdWxkIHRy
ZWF0IGFzIHN1Y2ggYW5kIHNob3V0IGF0IHRoZSB1c2VyLgoKUmVwYWlyaW5nIGFueSB3cm9uZyBp
bnB1dHMgc2hvdWxkIGJlIGRvbmUgb24gYmVzdCBlZmZvcnRzLgoKQ2hlZXJzLAoKLS0gCkp1bGll
biBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
