Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D16E24C6A
	for <lists+xen-devel@lfdr.de>; Tue, 21 May 2019 12:12:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hT1ht-0003nv-DN; Tue, 21 May 2019 10:09:17 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=YYEG=TV=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hT1hs-0003nq-9Z
 for xen-devel@lists.xenproject.org; Tue, 21 May 2019 10:09:16 +0000
X-Inumbo-ID: 7ca91754-7bb0-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 7ca91754-7bb0-11e9-8980-bc764e045a96;
 Tue, 21 May 2019 10:09:14 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 901E9374;
 Tue, 21 May 2019 03:09:14 -0700 (PDT)
Received: from [10.37.13.11] (unknown [10.37.13.11])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 302FF3F575;
 Tue, 21 May 2019 03:09:13 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20190514122456.28559-1-julien.grall@arm.com>
 <20190514122456.28559-5-julien.grall@arm.com>
 <alpine.DEB.2.21.1905201451570.16404@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <b5d35a7b-1ada-8e9f-3162-02891b2c5781@arm.com>
Date: Tue, 21 May 2019 11:09:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1905201451570.16404@sstabellini-ThinkPad-T480s>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH MM-PART2 RESEND v2 04/19] xen/arm: Rework
 HSCTLR_BASE
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
Cc: xen-devel@lists.xenproject.org, Andrii_Anisov@epam.com,
 Oleksandr_Tyshchenko@epam.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiA1LzIwLzE5IDExOjU2IFBNLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gT24g
VHVlLCAxNCBNYXkgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBUaGUgY3VycmVudCB2YWx1
ZSBvZiBIU0NUTFJfQkFTRSBmb3IgQXJtNjQgaXMgcHJldHR5IHdyb25nLiBJdCB3b3VsZAo+PiBh
Y3R1YWxseSB0dXJuIG9uIFNDVExSX0VMMi5uQUEgKGJpdCA2KSBvbiBoYXJkd2FyZSBpbXBsZW1l
bnRpbmcKPj4gQVJNdjguNC1MU0UuCj4+Cj4+IEZ1cnRoZXJtb3JlLCB0aGUgZG9jdW1lbnRhdGlv
biBvZiB3aGF0IGlzIGNsZWFyZWQvc2V0IGluIFNDVExSX0VMMiBpcwo+PiBhbHNvIG5vdCBjb3Jy
ZWN0IGFuZCBsb29rcyBsaWtlIHRvIGJlIGEgdmVyYmF0aW0gY29weSBmcm9tIEFybTMyLgo+Pgo+
PiBIU0NUTFJfQkFTRSBpcyByZXBsYWNlZCB3aXRoIGEgYnVuY2ggb2YgcGVyLWFyY2hpdGVjdHVy
ZSBuZXcgZGVmaW5lcwo+PiBoZWxwaW5nIHRvIHVuZGVyc3RhbmQgYmV0dGVyIHdoYXQgaXMgdGhl
IGluaXRpYWxpZSB2YWx1ZSBmb3IKCnMvaW5pdGlhbGllL2luaXRpYWwvCgo+PiBTQ1RMUl9FTDIv
SFNDVExSLgo+Pgo+PiBOb3RlIHRoZSBkZWZpbmVzICpfQ0xFQVIgYXJlIG9ubHkgdXNlZCB0byBj
aGVjayB0aGUgc3RhdGUgb2YgZWFjaCBiaXRzCj4+IGFyZSBrbm93bi4KPiAKPiBTbyBiYXNpY2Fs
bHkgdGhlIG9ubHkgcHVycG9zZSBvZiBIU0NUTFJfQ0xFQVIgaXMgdG8gZXhlY3V0ZToKPiAKPiAg
ICAjaWYgKEhTQ1RMUl9TRVQgXiBIU0NUTFJfQ0xFQVIpICE9IDB4ZmZmZmZmZmZVCj4gCj4gUmln
aHQ/IEl0IGlzIGdvb2QgdG8gaGF2ZSB0aGUgY2hlY2suCj4gCj4gUGxlYXNlIGFkZCBhIG9uZS1s
aW5lIGNvbW1lbnQgb24gdG9wIG9mIEhTQ1RMUl9DTEVBUiAtLSAib25seSB1c2VkIHRvCj4gY2hl
Y2sgdGhhdCB0aGUgc3RhdGUgb2YgZWFjaCBiaXRzIGFyZSBrbm93biIuCgpXZSBkb24ndCBjb21t
b25seSBhZGQgYSBjb21tZW50IGV2ZXJ5IHRpbWUgYSBkZWZpbmUgaXMgdXNlZCBvbmx5IG9uZSAK
dGltZS4gU28gd2hhdCdzIHRoZSBiZW5lZml0cyBoZXJlPwoKSW4gYWxsIGhvbmVzdHksIHN1Y2gg
d29yZGluZyBpbiB0aGUgY29tbWl0IG1lc3NhZ2Ugd2FzIHByb2JhYmx5IG92ZXIgdGhlIAp0b3Au
IEkgYW0gdGhpbmtpbmcgdG8gcmVwbGFjZSB0aGUgc2VudGVuY2Ugd2l0aDoKCiJMYXN0bHksIGFs
bCB0aGUgYml0cyBhcmUgbm93IGRlc2NyaWJlZCBhcyBlaXRoZXIgc2V0IG9yIGNsZWFyZWQuIFRo
aXMgCmFsbG93cyB1cyB0byBjaGVjayBhdCBwcmUtcHJvY2Vzc2luZyB0aW1lIHRoZSBjb25zaXN0
ZW5jeSBvZiB0aGUgaW5pdGlhbCAKdmFsdWUuIgoKPiAKPiAKPj4gTGFzdGx5LCB0aGUgZG9jdW1l
bnRhdGlvbiBpcyBkcm9wcGVkIGZyb20gYXJtezMyLDY0fS9oZWFkLlMgYXMgaXQgd291bGQKPj4g
YmUgcHJldHR5IGVhc3kgdG8gZ2V0IG91dC1vZi1zeW5jIHdpdGggdGhlIGRlZmluaXRpb25zLgo+
Pgo+PiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgo+
Pgo+PiAtLS0KPj4gICAgICBDaGFuZ2VzIGluIHYyOgo+PiAgICAgICAgICAtIFVzZSBCSVQoLi4u
LCBVTCkgaW5zdGVhZCBvZiBfQklUVUwKPj4gLS0tCj4+ICAgeGVuL2FyY2gvYXJtL2FybTMyL2hl
YWQuUyAgICAgICB8IDEyICstLS0tLS0tLQo+PiAgIHhlbi9hcmNoL2FybS9hcm02NC9oZWFkLlMg
ICAgICAgfCAxMCArLS0tLS0tLQo+PiAgIHhlbi9pbmNsdWRlL2FzbS1hcm0vcHJvY2Vzc29yLmgg
fCA1NCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLQo+PiAgIDMgZmls
ZXMgY2hhbmdlZCwgNTUgaW5zZXJ0aW9ucygrKSwgMjEgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYg
LS1naXQgYS94ZW4vYXJjaC9hcm0vYXJtMzIvaGVhZC5TIGIveGVuL2FyY2gvYXJtL2FybTMyL2hl
YWQuUwo+PiBpbmRleCA0NTRkMjQ1MzdjLi44YTk4NjA3NDU5IDEwMDY0NAo+PiAtLS0gYS94ZW4v
YXJjaC9hcm0vYXJtMzIvaGVhZC5TCj4+ICsrKyBiL3hlbi9hcmNoL2FybS9hcm0zMi9oZWFkLlMK
Pj4gQEAgLTIzNCwxNyArMjM0LDcgQEAgY3B1X2luaXRfZG9uZToKPj4gICAgICAgICAgIGxkciAg
IHIwLCA9KFRDUl9SRVMxfFRDUl9TSDBfSVN8VENSX09SR04wX1dCV0F8VENSX0lSR04wX1dCV0F8
VENSX1QwU1ooMCkpCj4+ICAgICAgICAgICBtY3IgICBDUDMyKHIwLCBIVENSKQo+PiAgIAo+PiAt
ICAgICAgICAvKgo+PiAtICAgICAgICAgKiBTZXQgdXAgdGhlIEhTQ1RMUjoKPj4gLSAgICAgICAg
ICogRXhjZXB0aW9ucyBpbiBMRSBBUk0sCj4+IC0gICAgICAgICAqIExvdy1sYXRlbmN5IElSUXMg
ZGlzYWJsZWQsCj4+IC0gICAgICAgICAqIFdyaXRlLWltcGxpZXMtWE4gZGlzYWJsZWQgKGZvciBu
b3cpLAo+PiAtICAgICAgICAgKiBELWNhY2hlIGRpc2FibGVkIChmb3Igbm93KSwKPj4gLSAgICAg
ICAgICogSS1jYWNoZSBlbmFibGVkLAo+PiAtICAgICAgICAgKiBBbGlnbm1lbnQgY2hlY2tpbmcg
ZW5hYmxlZCwKPj4gLSAgICAgICAgICogTU1VIHRyYW5zbGF0aW9uIGRpc2FibGVkIChmb3Igbm93
KS4KPj4gLSAgICAgICAgICovCj4+IC0gICAgICAgIGxkciAgIHIwLCA9KEhTQ1RMUl9CQVNFfFND
VExSX0F4eF9FTHhfQSkKPj4gKyAgICAgICAgbGRyICAgcjAsID1IU0NUTFJfU0VUCj4+ICAgICAg
ICAgICBtY3IgICBDUDMyKHIwLCBIU0NUTFIpCj4+ICAgCj4+ICAgICAgICAgICAvKgo+PiBkaWZm
IC0tZ2l0IGEveGVuL2FyY2gvYXJtL2FybTY0L2hlYWQuUyBiL3hlbi9hcmNoL2FybS9hcm02NC9o
ZWFkLlMKPj4gaW5kZXggOGE2YmUzMzUyZS4uNGZlOTA0YzUxZCAxMDA2NDQKPj4gLS0tIGEveGVu
L2FyY2gvYXJtL2FybTY0L2hlYWQuUwo+PiArKysgYi94ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5T
Cj4+IEBAIC0zNjMsMTUgKzM2Myw3IEBAIHNraXBfYnNzOgo+PiAgIAo+PiAgICAgICAgICAgbXNy
ICAgdGNyX2VsMiwgeDAKPj4gICAKPj4gLSAgICAgICAgLyogU2V0IHVwIHRoZSBTQ1RMUl9FTDI6
Cj4+IC0gICAgICAgICAqIEV4Y2VwdGlvbnMgaW4gTEUgQVJNLAo+PiAtICAgICAgICAgKiBMb3ct
bGF0ZW5jeSBJUlFzIGRpc2FibGVkLAo+PiAtICAgICAgICAgKiBXcml0ZS1pbXBsaWVzLVhOIGRp
c2FibGVkIChmb3Igbm93KSwKPj4gLSAgICAgICAgICogRC1jYWNoZSBkaXNhYmxlZCAoZm9yIG5v
dyksCj4+IC0gICAgICAgICAqIEktY2FjaGUgZW5hYmxlZCwKPj4gLSAgICAgICAgICogQWxpZ25t
ZW50IGNoZWNraW5nIGRpc2FibGVkLAo+PiAtICAgICAgICAgKiBNTVUgdHJhbnNsYXRpb24gZGlz
YWJsZWQgKGZvciBub3cpLiAqLwo+PiAtICAgICAgICBsZHIgICB4MCwgPShIU0NUTFJfQkFTRSkK
Pj4gKyAgICAgICAgbGRyICAgeDAsID1TQ1RMUl9FTDJfU0VUCj4+ICAgICAgICAgICBtc3IgICBT
Q1RMUl9FTDIsIHgwCj4+ICAgCj4+ICAgICAgICAgICAvKiBFbnN1cmUgdGhhdCBhbnkgZXhjZXB0
aW9ucyBlbmNvdW50ZXJlZCBhdCBFTDIKPj4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS1h
cm0vcHJvY2Vzc29yLmggYi94ZW4vaW5jbHVkZS9hc20tYXJtL3Byb2Nlc3Nvci5oCj4+IGluZGV4
IGJiY2JhMDYxY2EuLjlhZmMzNzg2YzUgMTAwNjQ0Cj4+IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS1h
cm0vcHJvY2Vzc29yLmgKPj4gKysrIGIveGVuL2luY2x1ZGUvYXNtLWFybS9wcm9jZXNzb3IuaAo+
PiBAQCAtMTI3LDYgKzEyNyw5IEBACj4+ICAgI2RlZmluZSBTQ1RMUl9BMzJfRUx4X1RFICAgIEJJ
VCgzMCwgVUwpCj4+ICAgI2RlZmluZSBTQ1RMUl9BMzJfRUx4X0ZJICAgIEJJVCgyMSwgVUwpCj4+
ICAgCj4+ICsvKiBDb21tb24gYml0cyBmb3IgU0NUTFJfRUx4IGZvciBBcm02NCAqLwo+PiArI2Rl
ZmluZSBTQ1RMUl9BNjRfRUx4X1NBICAgIEJJVCgzLCBVTCkKPj4gKwo+PiAgIC8qIENvbW1vbiBi
aXRzIGZvciBTQ1RMUl9FTHggb24gYWxsIGFyY2hpdGVjdHVyZXMgKi8KPj4gICAjZGVmaW5lIFND
VExSX0F4eF9FTHhfRUUgICAgQklUKDI1LCBVTCkKPj4gICAjZGVmaW5lIFNDVExSX0F4eF9FTHhf
V1hOICAgQklUKDE5LCBVTCkKPj4gQEAgLTEzNSw3ICsxMzgsNTYgQEAKPj4gICAjZGVmaW5lIFND
VExSX0F4eF9FTHhfQSAgICAgQklUKDEsIFVMKQo+PiAgICNkZWZpbmUgU0NUTFJfQXh4X0VMeF9N
ICAgICBCSVQoMCwgVUwpCj4+ICAgCj4+IC0jZGVmaW5lIEhTQ1RMUl9CQVNFICAgICBfQUMoMHgz
MGM1MTg3OCxVKQo+PiArI2lmZGVmIENPTkZJR19BUk1fMzIKPj4gKwo+PiArI2RlZmluZSBIU0NU
TFJfUkVTMSAgICAgKEJJVCggMywgVUwpIHwgQklUKCA0LCBVTCkgfCBCSVQoIDUsIFVMKSB8XAo+
PiArICAgICAgICAgICAgICAgICAgICAgICAgIEJJVCggNiwgVUwpIHwgQklUKDExLCBVTCkgfCBC
SVQoMTYsIFVMKSB8XAo+PiArICAgICAgICAgICAgICAgICAgICAgICAgIEJJVCgxOCwgVUwpIHwg
QklUKDIyLCBVTCkgfCBCSVQoMjMsIFVMKSB8XAo+PiArICAgICAgICAgICAgICAgICAgICAgICAg
IEJJVCgyOCwgVUwpIHwgQklUKDI5LCBVTCkpCj4+ICsKPj4gKyNkZWZpbmUgSFNDVExSX1JFUzAg
ICAgIChCSVQoNywgVUwpICB8IEJJVCg4LCBVTCkgIHwgQklUKDksIFVMKSAgfCBCSVQoMTAsIFVM
KSB8XAo+PiArICAgICAgICAgICAgICAgICAgICAgICAgIEJJVCgxMywgVUwpIHwgQklUKDE0LCBV
TCkgfCBCSVQoMTUsIFVMKSB8IEJJVCgxNywgVUwpIHxcCj4+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgQklUKDIwLCBVTCkgfCBCSVQoMjQsIFVMKSB8IEJJVCgyNiwgVUwpIHwgQklUKDI3LCBV
TCkgfFwKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICBCSVQoMzEsIFVMKSkKPj4gKwo+PiAr
LyogSW5pdGlhbCB2YWx1ZSBmb3IgSFNDVExSICovCj4+ICsjZGVmaW5lIEhTQ1RMUl9TRVQgICAg
ICAoSFNDVExSX1JFUzEgICAgfCBTQ1RMUl9BeHhfRUx4X0EgICB8IFNDVExSX0F4eF9FTHhfSSkK
PiAKPiBBcyBmYXIgYXMgbXkgY2FsY3VsYXRpb25zIGdvLCBpdCBsb29rcyBsaWtlIHRoZSBvbmx5
IGRpZmZlcmVuY2UgaXMKPiBTQ1RMUl9BeHhfRUx4X0EgY29tcGFyZWQgdG8gMHgzMGM1MTg3OCwg
cmlnaHQ/IFdoaWNoIGlzIHRoZSBhbGlnbm1lbnQKPiBjaGVjay4KClRoYXQncyBjb3JyZWN0IGFu
ZCBtYXRjaCB0aGUgaW5pdGlhbCB2YWx1ZSBvbiBBcm0zMiAoc2VlIEhTQ1RSX1NFVCB8IApTQ1RM
Ul9BeHhfRUx4X0EgaW4gdGhlIGhlYWQuUykuCgo+IAo+IAo+PiArI2RlZmluZSBIU0NUTFJfQ0xF
QVIgICAgKEhTQ1RMUl9SRVMwICAgICAgICB8IFNDVExSX0F4eF9FTHhfTSAgIHxcCj4+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgU0NUTFJfQXh4X0VMeF9DICAgIHwgU0NUTFJfQXh4X0VMeF9X
WE4gfFwKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICBTQ1RMUl9BMzJfRUx4X0ZJICAgfCBT
Q1RMUl9BeHhfRUx4X0VFICB8XAo+PiArICAgICAgICAgICAgICAgICAgICAgICAgIFNDVExSX0Ez
Ml9FTHhfVEUpCj4+ICsKPj4gKyNpZiAoSFNDVExSX1NFVCBeIEhTQ1RMUl9DTEVBUikgIT0gMHhm
ZmZmZmZmZlUKPj4gKyNlcnJvciAiSW5jb25zaXN0ZW50IEhTQ1RMUiBzZXQvY2xlYXIgYml0cyIK
Pj4gKyNlbmRpZgo+PiArCj4+ICsjZWxzZQo+PiArCj4+ICsjZGVmaW5lIFNDVExSX0VMMl9SRVMx
ICAoQklUKCA0LCBVTCkgfCBCSVQoIDUsIFVMKSB8IEJJVCgxMSwgVUwpIHxcCj4+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgQklUKDE2LCBVTCkgfCBCSVQoMTgsIFVMKSB8IEJJVCgyMiwgVUwp
IHxcCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgQklUKDIzLCBVTCkgfCBCSVQoMjgsIFVM
KSB8IEJJVCgyOSwgVUwpKQo+PiArCj4+ICsjZGVmaW5lIFNDVExSX0VMMl9SRVMwICAoQklUKCA2
LCBVTCkgfCBCSVQoIDcsIFVMKSB8IEJJVCggOCwgVUwpIHxcCj4+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgQklUKCA5LCBVTCkgfCBCSVQoMTAsIFVMKSB8IEJJVCgxMywgVUwpIHxcCj4+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgQklUKDE0LCBVTCkgfCBCSVQoMTUsIFVMKSB8IEJJVCgx
NywgVUwpIHxcCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgQklUKDIwLCBVTCkgfCBCSVQo
MjEsIFVMKSB8IEJJVCgyNCwgVUwpIHxcCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgQklU
KDI2LCBVTCkgfCBCSVQoMjcsIFVMKSB8IEJJVCgzMCwgVUwpIHxcCj4+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgQklUKDMxLCBVTCkgfCAoMHhmZmZmZmZmZlVMTCA8PCAzMikpCj4+ICsKPj4g
Ky8qIEluaXRpYWwgdmFsdWUgZm9yIFNDVExSX0VMMiAqLwo+PiArI2RlZmluZSBTQ1RMUl9FTDJf
U0VUICAgKFNDVExSX0VMMl9SRVMxICAgICB8IFNDVExSX0E2NF9FTHhfU0EgIHxcCj4+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgU0NUTFJfQXh4X0VMeF9JKQo+IAo+IFNhbWUgaGVyZSwgeW91
IHJlbW92ZWQgdGhlIHJlc2VydmVkIGJpdHMsIGFuZCBhZGRlZCB0aGUgYWxpZ25tZW50IGNoZWNr
LAo+IHNhbWUgYXMgZm9yIGFhcmNoMzIuIElmIEkgZ290IGl0IHJpZ2h0LCBpdCB3b3VsZCBiZSBu
aWNlIHRvIGFkZCBhCj4gc3RhdGVtZW50IGxpa2UgdGhpcyB0byB0aGUgY29tbWl0IG1lc3NhZ2Uu
CgpJIGRvbid0IHNlZSB3aHkgInJlc2VydmVkIGJpdHMiIEkgZHJvcHBlZCBub3Igd2hpY2ggYWxp
Z25tZW50IGNoZWNrIEkgYWRkZWQuCgpJdCB3b3VsZCBiZSBleHRyZW1lbHkgdXNlZnVsIGlmIHlv
dSBwcm92aWRlIG1vcmUgZGV0YWlscyBpbiB5b3VyIApyZXZpZXcuLi4gIEluIHRoaXMgY2FzZSwg
aXQgd291bGQgYmUgdGhlIGV4YWN0IGJpdHMgSSBkcm9wcGVkL2FkZGVkLgoKPiAKPiAKPj4gKyNk
ZWZpbmUgU0NUTFJfRUwyX0NMRUFSIChTQ1RMUl9FTDJfUkVTMCAgICAgfCBTQ1RMUl9BeHhfRUx4
X00gICB8XAo+PiArICAgICAgICAgICAgICAgICAgICAgICAgIFNDVExSX0F4eF9FTHhfQSAgICB8
IFNDVExSX0F4eF9FTHhfQyAgIHxcCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgU0NUTFJf
QXh4X0VMeF9XWE4gIHwgU0NUTFJfQXh4X0VMeF9FRSkKPj4gKwo+PiArI2lmIChTQ1RMUl9FTDJf
U0VUIF4gU0NUTFJfRUwyX0NMRUFSKSAhPSAweGZmZmZmZmZmZmZmZmZmZmZVTAo+PiArI2Vycm9y
ICJJbmNvbnNpc3RlbnQgU0NUTFJfRUwyIHNldC9jbGVhciBiaXRzIgo+PiArI2VuZGlmCj4+ICsK
Pj4gKyNlbmRpZgo+PiAgIAo+PiAgIC8qIEhDUiBIeXAgQ29uZmlndXJhdGlvbiBSZWdpc3RlciAq
Lwo+PiAgICNkZWZpbmUgSENSX1JXICAgICAgICAgIChfQUMoMSxVTCk8PDMxKSAvKiBSZWdpc3Rl
ciBXaWR0aCwgQVJNNjQgb25seSAqLwoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
