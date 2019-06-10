Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E813B428
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2019 13:47:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1haIj0-0003DT-UV; Mon, 10 Jun 2019 11:44:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=j7+2=UJ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1haIiz-0003DO-Kl
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2019 11:44:29 +0000
X-Inumbo-ID: 18821e24-8b75-11e9-b77d-5f1954c58e29
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 18821e24-8b75-11e9-b77d-5f1954c58e29;
 Mon, 10 Jun 2019 11:44:25 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D0B2D337;
 Mon, 10 Jun 2019 04:44:24 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3E7D73F557;
 Mon, 10 Jun 2019 04:46:05 -0700 (PDT)
To: Jan Beulich <JBeulich@suse.com>, andrii.anisov@gmail.com
References: <1558721577-13958-1-git-send-email-andrii.anisov@gmail.com>
 <1558721577-13958-3-git-send-email-andrii.anisov@gmail.com>
 <5CFA734902000078002364C0@prv1-mh.provo.novell.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <7a225ac4-f1e0-7cf8-b697-ea1f985f2dc8@arm.com>
Date: Mon, 10 Jun 2019 12:44:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5CFA734902000078002364C0@prv1-mh.provo.novell.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3] xen: introduce
 VCPUOP_register_runstate_phys_memory_area hypercall
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 xen-devel <xen-devel@lists.xenproject.org>,
 "andrii_anisov@epam.com" <andrii_anisov@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSmFuLAoKT24gMDcvMDYvMjAxOSAxNToyMywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24g
MjQuMDUuMTkgYXQgMjA6MTIsIDxhbmRyaWkuYW5pc292QGdtYWlsLmNvbT4gd3JvdGU6Cj4+IEZy
b206IEFuZHJpaSBBbmlzb3YgPGFuZHJpaV9hbmlzb3ZAZXBhbS5jb20+Cj4+Cj4+IEV4aXN0aW5n
IGludGVyZmFjZSB0byByZWdpc3RlciBydW5zdGF0ZSBhcmUgd2l0aCBpdHMgdmlydHVhbCBhZGRy
ZXNzCj4+IGlzIHByb25lIHRvIGlzc3VlcyB3aGljaCBiZWNhbWUgbW9yZSBvYnZpb3VzIHdpdGgg
S1BUSSBlbmFibGVtZW50IGluCj4+IGd1ZXN0cy4gVGhlIG5hdHVyZSBvZiB0aG9zZSBpc3N1ZXMg
aXMgdGhlIGZhY3QgdGhhdCB0aGUgZ3Vlc3QgY291bGQKPj4gYmUgaW50ZXJydXB0ZWQgYnkgdGhl
IGh5cGVydmlzb3IgYXQgYW55IHRpbWUsIGFuZCB0aGVyZSBpcyBubyBndWFyYW50ZWUKPj4gdG8g
aGF2ZSB0aGUgcmVnaXN0ZXJlZCB2aXJ0dWFsIGFkZHJlc3MgdHJhbnNsYXRlZCB3aXRoIHRoZSBj
dXJyZW50bHkKPj4gYXZhaWxhYmxlIGd1ZXN0J3MgcGFnZSB0YWJsZXMuIEJlZm9yZSB0aGUgS1BU
SSBzdWNoIGEgc2l0dWF0aW9uIHdhcwo+PiBwb3NzaWJsZSBpbiBjYXNlIHRoZSBndWVzdCBpcyBj
YXVnaHQgaW4gdGhlIG1pZGRsZSBvZiBQVCBwcm9jZXNzaW5nCj4+IChlLmcuIHN1cGVycGFnZSBz
aGF0dGVyaW5nKS4gV2l0aCB0aGUgS1BUSSB0aGlzIGhhcHBlbnMgYWxzbyB3aGVuIHRoZQo+PiBn
dWVzdCBydW5zIHVzZXJzcGFjZSwgc28gaGFzIGEgcHJldHR5IGhpZ2ggcHJvYmFiaWxpdHkuCj4g
Cj4gRXhjZXB0IHdoZW4gdGhlcmUncyBubyBuZWVkIGZvciBLUFRJIGluIHRoZSBndWVzdCBpbiB0
aGUgZmlyc3QgcGxhY2UsCj4gYXMgaXMgdGhlIGNhc2UgZm9yIHg4Ni02NCBQViBndWVzdHMuIEkg
dGhpbmsgdGhpcyBpcyB3b3J0aHdoaWxlIGNsYXJpZnlpbmcuCgpJIGFtIG5vdCBzdXJlIHdoYXQg
aXMgeW91ciBwb2ludCBoZXJlLiBBdCBsZWFzdCBvbiBBcm0sIHVzaW5nIHZpcnR1YWwgYWRkcmVz
cyBpcyAKbm90IHNhZmUgYXQgYWxsICh3aGV0aGVyIEtQVEkgaXMgdXNlZCBvciBub3QpLiBBIGd1
ZXN0IGNhbiBnZW51aW5lbHkgZGVjaWRlcyB0byAKc2hhdHRlciB0aGUgbWFwcGluZyB3aGVyZSB0
aGUgdmlydHVhbCBhZGRyZXNzIGlzLiBPbiBBcm0sIHRoaXMgcmVxdWlyZSB0byB1c2UgCnRoZSBi
cmVhay1iZWZvcmUtbWFrZSBzZXF1ZW5jZS4gSXQgbWVhbnMgdGhlIHRyYW5zbGF0aW9uIFZBIC0+
IFBBIG1heSBmYWlsIGlzIAp5b3UgaGFwcGVuIHRvIGRvIGl0IHdoaWxlIHRoZSBndWVzdCBpcyB1
c2luZyB0aGUgc2VxdWVuY2UuCgpTb21lIG9mIHRoZSBpbnRlcm1pdHRlbnQgaXNzdWVzIEkgaGF2
ZSBzZWVuIG9uIHRoZSBBcm5kYWxlIGluIHRoZSBwYXN0IFsxXSBtaWdodCAKYmUgcmVsYXRlZCB0
byB1c2luZyB2aXJ0dWFsIGFkZHJlc3MuIEkgYW0gbm90IDEwMCUgc3VyZSBiZWNhdXNlIGV2ZW4g
aWYgdGhlIApkZWJ1ZywgdGhlIGVycm9yIGRvZXMgbm90IG1ha2Ugc2Vuc2UuIEJ1dCB0aGlzIGlz
IHRoZSBtb3N0IHBsYXVzaWJsZSByZWFzb24gZm9yIAp0aGUgZmFpbHVyZS4KCkkgd2FudCB0byBk
aXNjdXNzIHRoaXMgaW4gcGFydCBvZiB0aGUgYmlnZ2VyIGF0dGVtcHQgdG8gcmV3b3JrIHRoZSBo
eXBlcmNhbGwgQUJJIApkdXJpbmcgWGVuIFN1bW1pdCBpbiBKdWx5LgoKWy4uLl0KCj4+IEBAIC0z
NSw4ICszNywxNiBAQCBhcmNoX2NvbXBhdF92Y3B1X29wKAo+PiAgICAgICAgICAgICAgICAhY29t
cGF0X2hhbmRsZV9va2F5KGFyZWEuYWRkci5oLCAxKSApCj4+ICAgICAgICAgICAgICAgYnJlYWs7
Cj4+ICAgCj4+ICsgICAgICAgIHdoaWxlKCB4Y2hnKCZ2LT5ydW5zdGF0ZV9pbl91c2UsIDEpID09
IDApOwo+IAo+IEF0IHRoZSB2ZXJ5IGxlYXN0IHN1Y2ggbG9vcHMgd2FudCBhIGNwdV9yZWxheCgp
IGluIHRoZWlyIGJvZGllcy4KPiBCdXQgdGhpcyBiZWluZyBvbiBhIGh5cGVyY2FsbCBwYXRoIC0g
YXJlIHRoZXJlIHRoZW9yZXRpY2FsIGd1YXJhbnRlZXMKPiB0aGF0IGEgZ3Vlc3QgY2FuJ3QgYWJ1
c2UgdGhpcyB0byBsb2NrIHVwIGEgQ1BVPwpIbW1tLCBJIHN1Z2dlc3RlZCB0aGlzIGJ1dCBpdCBs
b29rcyBsaWtlIGEgZ3Vlc3QgbWF5IGNhbGwgdGhlIGh5cGVyY2FsbCBtdWx0aXBsZSAKdGltZSBm
cm9tIGRpZmZlcmVudCB2Q1BVLiBTbyB0aGlzIGNvdWxkIGJlIGEgd2F5IHRvIGRlbGF5IHdvcmsg
b24gdGhlIENQVS4KCkkgd2FudGVkIHRvIG1ha2UgdGhlIGNvbnRleHQgc3dpdGNoIG1vc3RseSBs
b2NrbGVzcyBhbmQgdGhlcmVmb3JlIGF2b2lkaW5nIHRvIAppbnRyb2R1Y2UgYSBzcGlubG9jay4K
ClsxXSBodHRwczovL2xpc3RzLnhlbi5vcmcvYXJjaGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAxNy0x
MS9tc2cwMDk0Mi5odG1sCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
