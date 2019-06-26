Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FFC656700
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2019 12:39:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hg5It-0008Hr-4P; Wed, 26 Jun 2019 10:37:27 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cvzu=UZ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hg5Ir-0008Hk-Bn
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2019 10:37:25 +0000
X-Inumbo-ID: 62665f79-97fe-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 62665f79-97fe-11e9-8980-bc764e045a96;
 Wed, 26 Jun 2019 10:37:24 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7AE50360;
 Wed, 26 Jun 2019 03:37:23 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AB7A23F718;
 Wed, 26 Jun 2019 03:37:22 -0700 (PDT)
To: xen-devel@lists.xenproject.org
References: <20190606171024.11152-1-julien.grall@arm.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <fd71600d-f266-0db1-7ef1-0226be95eeb7@arm.com>
Date: Wed, 26 Jun 2019 11:37:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190606171024.11152-1-julien.grall@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3] xen/public: arch-arm: Restrict the
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
Cc: andrew.cooper3@citrix.com, Stefano Stabellini <sstabellini@kernel.org>,
 ian.jackson@eu.citrix.com, wl@xen.org, jbeulich@suse.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpJdCBsb29rcyBsaWtlIEkgZm9yZ290IHRvIENDIFN0ZWZhbm8gb24gdGhpcyBvbmUuCgpD
aGVlcnMsCgpPbiAwNi8wNi8yMDE5IDE4OjEwLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gQ3VycmVu
dGx5LCB0aGUgc3RydWN0dXJlIHZjcHVfZ3Vlc3RfY29yZV9yZWdzIGlzIHBhcnQgb2YgdGhlIHB1
YmxpYyBBUEkuCj4gVGhpcyBpbXBsaWVzIHRoYXQgYW55IGNoYW5nZSBpbiB0aGUgc3RydWN0dXJl
IHNob3VsZCBiZSBiYWNrd2FyZAo+IGNvbXBhdGlibGUuCj4gCj4gSG93ZXZlciwgdGhlIHN0cnVj
dHVyZSBpcyBvbmx5IG5lZWRlZCBieSB0aGUgdG9vbHMgYW5kIFhlbi4gSXQgaXMgYWxzbwo+IG5v
dCBleHBlY3RlZCB0byBiZSBldmVyIHVzZWQgb3V0c2lkZSBvZiB0aGF0IGNvbnRleHQuIFNvIHdl
IGNvdWxkIHNhdmUgdXMKPiBzb21lIGhlYWRhY2hlIGJ5IG9ubHkgZGVjbGFyaW5nIHRoZSBzdHJ1
Y3R1cmUgZm9yIFhlbiBhbmQgdG9vbHMuCj4gCj4gU3VnZ2VzdGVkLWJ5OiBBbmRyZXcgQ29vcGVy
IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFs
bCA8anVsaWVuLmdyYWxsQGFybS5jb20+Cj4gCj4gLS0tCj4gICAgICBUaGlzIGlzIGEgZm9sbG93
LXVwIG9mIHRoZSBkaXNjdXNzaW9uIFsxXS4KPiAKPiAgICAgIFsxXSA8M2MyNDVjNWItNTFjNi0x
ZDBlLWFkNmMtNDI0MTQ1NzMxNjZmQGFybS5jb20+Cj4gCj4gICAgICBDaGFuZ2VzIGluIHYzOgo+
ICAgICAgICAgIC0gQXZvaWQgaW50cm9kdWNlIGEgbmV3ICNpZmRlZiBpbiB0aGUgaGVhZGVyIGJ5
IG1vdmluZyB0aGUKPiAgICAgICAgICBkZWZpbml0aW9ucyBsYXRlciBvbi4KPiAtLS0KPiAgIHhl
bi9pbmNsdWRlL3B1YmxpYy9hcmNoLWFybS5oIHwgMjQgKysrKysrKysrKysrLS0tLS0tLS0tLS0t
Cj4gICAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pCj4g
Cj4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3B1YmxpYy9hcmNoLWFybS5oIGIveGVuL2luY2x1
ZGUvcHVibGljL2FyY2gtYXJtLmgKPiBpbmRleCBlYjQyNGU4Mjg2Li4xNGU0Y2JhZDA2IDEwMDY0
NAo+IC0tLSBhL3hlbi9pbmNsdWRlL3B1YmxpYy9hcmNoLWFybS5oCj4gKysrIGIveGVuL2luY2x1
ZGUvcHVibGljL2FyY2gtYXJtLmgKPiBAQCAtMTk3LDYgKzE5NywxOCBAQAo+ICAgICAgIH0gd2hp
bGUgKCAwICkKPiAgICNkZWZpbmUgc2V0X3hlbl9ndWVzdF9oYW5kbGUoaG5kLCB2YWwpIHNldF94
ZW5fZ3Vlc3RfaGFuZGxlX3JhdyhobmQsIHZhbCkKPiAgIAo+ICt0eXBlZGVmIHVpbnQ2NF90IHhl
bl9wZm5fdDsKPiArI2RlZmluZSBQUklfeGVuX3BmbiBQUkl4NjQKPiArI2RlZmluZSBQUkl1X3hl
bl9wZm4gUFJJdTY0Cj4gKwo+ICsvKiBNYXhpbXVtIG51bWJlciBvZiB2aXJ0dWFsIENQVXMgaW4g
bGVnYWN5IG11bHRpLXByb2Nlc3NvciBndWVzdHMuICovCj4gKy8qIE9ubHkgb25lLiBBbGwgb3Ro
ZXIgVkNQVVMgbXVzdCB1c2UgVkNQVU9QX3JlZ2lzdGVyX3ZjcHVfaW5mbyAqLwo+ICsjZGVmaW5l
IFhFTl9MRUdBQ1lfTUFYX1ZDUFVTIDEKPiArCj4gK3R5cGVkZWYgdWludDY0X3QgeGVuX3Vsb25n
X3Q7Cj4gKyNkZWZpbmUgUFJJX3hlbl91bG9uZyBQUkl4NjQKPiArCj4gKyNpZiBkZWZpbmVkKF9f
WEVOX18pIHx8IGRlZmluZWQoX19YRU5fVE9PTFNfXykKPiAgICNpZiBkZWZpbmVkKF9fR05VQ19f
KSAmJiAhZGVmaW5lZChfX1NUUklDVF9BTlNJX18pCj4gICAvKiBBbm9ueW1vdXMgdW5pb24gaW5j
bHVkZXMgYm90aCAzMi0gYW5kIDY0LWJpdCBuYW1lcyAoZS5nLiwgcjAveDApLiAqLwo+ICAgIyBk
ZWZpbmUgX19ERUNMX1JFRyhuNjQsIG4zMikgdW5pb24geyAgICAgICAgICBcCj4gQEAgLTI3Miwx
OCArMjg0LDYgQEAgREVGSU5FX1hFTl9HVUVTVF9IQU5ETEUodmNwdV9ndWVzdF9jb3JlX3JlZ3Nf
dCk7Cj4gICAKPiAgICN1bmRlZiBfX0RFQ0xfUkVHCj4gICAKPiAtdHlwZWRlZiB1aW50NjRfdCB4
ZW5fcGZuX3Q7Cj4gLSNkZWZpbmUgUFJJX3hlbl9wZm4gUFJJeDY0Cj4gLSNkZWZpbmUgUFJJdV94
ZW5fcGZuIFBSSXU2NAo+IC0KPiAtLyogTWF4aW11bSBudW1iZXIgb2YgdmlydHVhbCBDUFVzIGlu
IGxlZ2FjeSBtdWx0aS1wcm9jZXNzb3IgZ3Vlc3RzLiAqLwo+IC0vKiBPbmx5IG9uZS4gQWxsIG90
aGVyIFZDUFVTIG11c3QgdXNlIFZDUFVPUF9yZWdpc3Rlcl92Y3B1X2luZm8gKi8KPiAtI2RlZmlu
ZSBYRU5fTEVHQUNZX01BWF9WQ1BVUyAxCj4gLQo+IC10eXBlZGVmIHVpbnQ2NF90IHhlbl91bG9u
Z190Owo+IC0jZGVmaW5lIFBSSV94ZW5fdWxvbmcgUFJJeDY0Cj4gLQo+IC0jaWYgZGVmaW5lZChf
X1hFTl9fKSB8fCBkZWZpbmVkKF9fWEVOX1RPT0xTX18pCj4gICBzdHJ1Y3QgdmNwdV9ndWVzdF9j
b250ZXh0IHsKPiAgICNkZWZpbmUgX1ZHQ0Zfb25saW5lICAgICAgICAgICAgICAgICAgIDAKPiAg
ICNkZWZpbmUgVkdDRl9vbmxpbmUgICAgICAgICAgICAgICAgICAgICgxPDxfVkdDRl9vbmxpbmUp
Cj4gCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
