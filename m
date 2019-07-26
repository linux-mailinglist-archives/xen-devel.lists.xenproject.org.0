Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A40CB766BA
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2019 14:58:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqzke-0002jR-4B; Fri, 26 Jul 2019 12:55:12 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ymAH=VX=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hqzkc-0002jM-BO
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2019 12:55:10 +0000
X-Inumbo-ID: 98f28009-afa4-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 98f28009-afa4-11e9-8980-bc764e045a96;
 Fri, 26 Jul 2019 12:55:08 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 81A53337;
 Fri, 26 Jul 2019 05:55:08 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E9F9C3F694;
 Fri, 26 Jul 2019 05:55:07 -0700 (PDT)
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20190723213553.22300-1-julien.grall@arm.com>
 <20190723213553.22300-2-julien.grall@arm.com> <87r26dhu1z.fsf@epam.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <b93a7a7e-970f-b550-bd0e-b31ac8e62975@arm.com>
Date: Fri, 26 Jul 2019 13:55:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <87r26dhu1z.fsf@epam.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 1/7] xen/public: arch-arm: Restrict the
 visibility of struct vcpu_guest_core_regs
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjYvMDcvMjAxOSAxMzoxNCwgVm9sb2R5bXlyIEJhYmNodWsgd3JvdGU6Cj4gCj4gSGkgSnVs
aWVuLAoKSGkgVm9sb2R5bXlyLAoKPiBKdWxpZW4gR3JhbGwgd3JpdGVzOgo+IAo+PiBDdXJyZW50
bHksIHRoZSBzdHJ1Y3R1cmUgdmNwdV9ndWVzdF9jb3JlX3JlZ3MgaXMgcGFydCBvZiB0aGUgcHVi
bGljIEFQSS4KPj4gVGhpcyBpbXBsaWVzIHRoYXQgYW55IGNoYW5nZSBpbiB0aGUgc3RydWN0dXJl
IHNob3VsZCBiZSBiYWNrd2FyZAo+PiBjb21wYXRpYmxlLgo+Pgo+PiBIb3dldmVyLCB0aGUgc3Ry
dWN0dXJlIGlzIG9ubHkgbmVlZGVkIGJ5IHRoZSB0b29scyBhbmQgWGVuLiBJdCBpcyBhbHNvCj4+
IG5vdCBleHBlY3RlZCB0byBiZSBldmVyIHVzZWQgb3V0c2lkZSBvZiB0aGF0IGNvbnRleHQuIFNv
IHdlIGNvdWxkIHNhdmUgdXMKPj4gc29tZSBoZWFkYWNoZSBieSBvbmx5IGRlY2xhcmluZyB0aGUg
c3RydWN0dXJlIGZvciBYZW4gYW5kIHRvb2xzLgo+Pgo+PiBTdWdnZXN0ZWQtYnk6IEFuZHJldyBD
b29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cj4+IFNpZ25lZC1vZmYtYnk6IEp1bGll
biBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Cj4+IC0tLQo+PiAgICAgIFRoaXMgaXMgYSBm
b2xsb3ctdXAgb2YgdGhlIGRpc2N1c3Npb24gWzFdLgo+Pgo+PiAgICAgIFsxXSA8M2MyNDVjNWIt
NTFjNi0xZDBlLWFkNmMtNDI0MTQ1NzMxNjZmQGFybS5jb20+Cj4+Cj4+ICAgICAgQ2hhbmdlcyBp
biB2MzoKPj4gICAgICAgICAgLSBBdm9pZCBpbnRyb2R1Y2UgYSBuZXcgI2lmZGVmIGluIHRoZSBo
ZWFkZXIgYnkgbW92aW5nIHRoZQo+PiAgICAgICAgICBkZWZpbml0aW9ucyBsYXRlciBvbi4KPj4g
LS0tCj4+ICAgeGVuL2luY2x1ZGUvcHVibGljL2FyY2gtYXJtLmggfCAyNCArKysrKysrKysrKyst
LS0tLS0tLS0tLS0KPj4gICAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgMTIgZGVs
ZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9wdWJsaWMvYXJjaC1hcm0u
aCBiL3hlbi9pbmNsdWRlL3B1YmxpYy9hcmNoLWFybS5oCj4+IGluZGV4IDNlOGNkYzE1MWQuLjdj
ZTEzOWEwZjUgMTAwNjQ0Cj4+IC0tLSBhL3hlbi9pbmNsdWRlL3B1YmxpYy9hcmNoLWFybS5oCj4+
ICsrKyBiL3hlbi9pbmNsdWRlL3B1YmxpYy9hcmNoLWFybS5oCj4+IEBAIC0xOTcsNiArMTk3LDE4
IEBACj4+ICAgICAgIH0gd2hpbGUgKCAwICkKPj4gICAjZGVmaW5lIHNldF94ZW5fZ3Vlc3RfaGFu
ZGxlKGhuZCwgdmFsKSBzZXRfeGVuX2d1ZXN0X2hhbmRsZV9yYXcoaG5kLCB2YWwpCj4+ICAgCj4+
ICt0eXBlZGVmIHVpbnQ2NF90IHhlbl9wZm5fdDsKPj4gKyNkZWZpbmUgUFJJX3hlbl9wZm4gUFJJ
eDY0Cj4+ICsjZGVmaW5lIFBSSXVfeGVuX3BmbiBQUkl1NjQKPj4gKwo+PiArLyogTWF4aW11bSBu
dW1iZXIgb2YgdmlydHVhbCBDUFVzIGluIGxlZ2FjeSBtdWx0aS1wcm9jZXNzb3IgZ3Vlc3RzLiAq
Lwo+PiArLyogT25seSBvbmUuIEFsbCBvdGhlciBWQ1BVUyBtdXN0IHVzZSBWQ1BVT1BfcmVnaXN0
ZXJfdmNwdV9pbmZvICovCj4gSnVzdCBhIHN1Z2dlc3Rpb246IHlvdSBhbHJlYWR5IHRvdWNoaW5n
IHRoaXMgcGFydC4gTWF5YmUgeW91J2xsIGZpeCB0aGlzCj4gY29tbWVudCBhcyB3ZWxsPwoKSSBh
bSBub3Qgc3VyZSB3aGF0J3Mgd3Jvbmcgd2l0aCB0aGUgY3VycmVudCBjb21tZW50LiBDYW4geW91
IGV4cGFuZCB5b3VyIAp0aG91Z2h0cyBwbGVhc2U/CgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxs
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
