Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 309C72E2D9
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2019 19:09:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hW21x-0005yi-AZ; Wed, 29 May 2019 17:06:25 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=MUVL=T5=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hW21v-0005yd-Aw
 for xen-devel@lists.xenproject.org; Wed, 29 May 2019 17:06:23 +0000
X-Inumbo-ID: 14f047f0-8234-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 14f047f0-8234-11e9-8980-bc764e045a96;
 Wed, 29 May 2019 17:06:21 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1411E341;
 Wed, 29 May 2019 10:06:21 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4A3F63F5AF;
 Wed, 29 May 2019 10:06:20 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20190514122456.28559-1-julien.grall@arm.com>
 <20190514122456.28559-7-julien.grall@arm.com>
 <alpine.DEB.2.21.1905201527460.16404@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <d91870a5-e8d5-2f6d-b8f5-839c9f206fab@arm.com>
Date: Wed, 29 May 2019 18:06:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1905201527460.16404@sstabellini-ThinkPad-T480s>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH MM-PART2 RESEND v2 06/19] xen/arm: Rework
 secondary_start prototype
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

SGksCgpPbiAyMC8wNS8yMDE5IDIzOjU2LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gT24g
VHVlLCAxNCBNYXkgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBOb25lIG9mIHRoZSBwYXJh
bWV0ZXJzIG9mIHNlY29uZGFyeV9zdGFydCBhcmUgYWN0dWFsbHkgdXNlZC4gU28gdHVybgo+PiBz
ZWNvbmRhcnlfc3RhcnQgdG8gYSBmdW5jdGlvbiB3aXRoIG5vIHBhcmFtZXRlcnMuCj4+Cj4+IEFs
c28gbW9kaWZ5IHRoZSBhc3NlbWJseSBjb2RlIHRvIGF2b2lkIHNldHRpbmctdXAgdGhlIHJlZ2lz
dGVycyBiZWZvcmUKPj4gY2FsbGluZyBzZWNvbmRhcnlfc3RhcnQuCj4gCj4gSXQgaXMgY2FsbGVk
ICJzdGFydF9zZWNvbmRhcnkiIHJhdGhlciB0aGFuICJzZWNvbmRhcnlfc3RhcnQiLiBQbGVhc2Ug
Zml4Cj4gdGhlIGNvbW1pdCBtZXNzYWdlLiBUaGVuIHlvdSBjYW4gYWRkCgpXaG9vcHMsIEkgd2ls
bCB1cGRhdGUgaXQuCgo+IAo+IFJldmlld2VkLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFi
ZWxsaW5pQGtlcm5lbC5vcmc+Cj4gCj4gCj4+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8
anVsaWVuLmdyYWxsQGFybS5jb20+CgpJIGhhdmUgYWxzbyByZWFsaXplZCBJIGZvcmdvdCB0byBh
ZGQgLS0tIGhlcmUuCgpUaGFuayB5b3UsCgo+Pgo+PiAgICAgIC0gUmUtb3JkZXIgdGhlIHBhdGNo
IHdpdGggInhlbi9hcm06IFJlbW92ZSBwYXJhbWV0ZXIgY3B1aWQgZnJvbQo+PiAgICAgIHN0YXJ0
X3hlbiIuCj4+IC0tLQo+PiAgIHhlbi9hcmNoL2FybS9hcm0zMi9oZWFkLlMgfCA0ICsrLS0KPj4g
ICB4ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5TIHwgMyArKy0KPj4gICB4ZW4vYXJjaC9hcm0vc21w
Ym9vdC5jICAgIHwgNCArLS0tCj4+ICAgMyBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyks
IDYgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vYXJtMzIvaGVh
ZC5TIGIveGVuL2FyY2gvYXJtL2FybTMyL2hlYWQuUwo+PiBpbmRleCBjYjhhM2JmODI5Li45ZjQw
ZmFjZTk4IDEwMDY0NAo+PiAtLS0gYS94ZW4vYXJjaC9hcm0vYXJtMzIvaGVhZC5TCj4+ICsrKyBi
L3hlbi9hcmNoL2FybS9hcm0zMi9oZWFkLlMKPj4gQEAgLTQ0NSw5ICs0NDUsOSBAQCBsYXVuY2g6
Cj4+ICAgICAgICAgICBsZHIgICBzcCwgW3IwXQo+PiAgICAgICAgICAgYWRkICAgc3AsICNTVEFD
S19TSVpFICAgICAgICAvKiAod2hpY2ggZ3Jvd3MgZG93biBmcm9tIHRoZSB0b3ApLiAqLwo+PiAg
ICAgICAgICAgc3ViICAgc3AsICNDUFVJTkZPX3NpemVvZiAgICAvKiBNYWtlIHJvb20gZm9yIENQ
VSBzYXZlIHJlY29yZCAqLwo+PiAtICAgICAgICBtb3YgICByMCwgcjEwICAgICAgICAgICAgICAg
IC8qIE1hcnNoYWwgYXJnczogLSBwaHlzX29mZnNldCAqLwo+PiAtICAgICAgICBtb3YgICByMSwg
cjggICAgICAgICAgICAgICAgIC8qICAgICAgICAgICAgICAgLSBEVEIgYWRkcmVzcyAqLwo+PiAg
ICAgICAgICAgdGVxICAgcjEyLCAjMAo+PiArICAgICAgICBtb3ZlcSByMCwgcjEwICAgICAgICAg
ICAgICAgIC8qIE1hcnNoYWwgYXJnczogLSBwaHlzX29mZnNldCAqLwo+PiArICAgICAgICBtb3Zl
cSByMSwgcjggICAgICAgICAgICAgICAgIC8qICAgICAgICAgICAgICAgLSBEVEIgYWRkcmVzcyAq
Lwo+PiAgICAgICAgICAgYmVxICAgc3RhcnRfeGVuICAgICAgICAgICAgICAvKiBhbmQgZGlzYXBw
ZWFyIGludG8gdGhlIGxhbmQgb2YgQyAqLwo+PiAgICAgICAgICAgYiAgICAgc3RhcnRfc2Vjb25k
YXJ5ICAgICAgICAvKiAodG8gdGhlIGFwcHJvcHJpYXRlIGVudHJ5IHBvaW50KSAqLwo+PiAgIAo+
PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2FybTY0L2hlYWQuUyBiL3hlbi9hcmNoL2FybS9h
cm02NC9oZWFkLlMKPj4gaW5kZXggMDc1MDEzODc4ZS4uY2IzMGQ2ZjIyZSAxMDA2NDQKPj4gLS0t
IGEveGVuL2FyY2gvYXJtL2FybTY0L2hlYWQuUwo+PiArKysgYi94ZW4vYXJjaC9hcm0vYXJtNjQv
aGVhZC5TCj4+IEBAIC01ODIsOSArNTgyLDEwIEBAIGxhdW5jaDoKPj4gICAgICAgICAgIHN1YiAg
IHgwLCB4MCwgI0NQVUlORk9fc2l6ZW9mIC8qIE1ha2Ugcm9vbSBmb3IgQ1BVIHNhdmUgcmVjb3Jk
ICovCj4+ICAgICAgICAgICBtb3YgICBzcCwgeDAKPj4gICAKPj4gKyAgICAgICAgY2JueiAgeDIy
LCAxZgo+PiArCj4+ICAgICAgICAgICBtb3YgICB4MCwgeDIwICAgICAgICAgICAgICAgIC8qIE1h
cnNoYWwgYXJnczogLSBwaHlzX29mZnNldCAqLwo+PiAgICAgICAgICAgbW92ICAgeDEsIHgyMSAg
ICAgICAgICAgICAgICAvKiAgICAgICAgICAgICAgIC0gRkRUICovCj4+IC0gICAgICAgIGNibnog
IHgyMiwgMWYKPj4gICAgICAgICAgIGIgICAgIHN0YXJ0X3hlbiAgICAgICAgICAgICAgLyogYW5k
IGRpc2FwcGVhciBpbnRvIHRoZSBsYW5kIG9mIEMgKi8KPj4gICAxOgo+PiAgICAgICAgICAgYiAg
ICAgc3RhcnRfc2Vjb25kYXJ5ICAgICAgICAvKiAodG8gdGhlIGFwcHJvcHJpYXRlIGVudHJ5IHBv
aW50KSAqLwo+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL3NtcGJvb3QuYyBiL3hlbi9hcmNo
L2FybS9zbXBib290LmMKPj4gaW5kZXggZjc1NjQ0NDM2Mi4uMDBiNjRjMzMyMiAxMDA2NDQKPj4g
LS0tIGEveGVuL2FyY2gvYXJtL3NtcGJvb3QuYwo+PiArKysgYi94ZW4vYXJjaC9hcm0vc21wYm9v
dC5jCj4+IEBAIC0yOTcsOSArMjk3LDcgQEAgc21wX3ByZXBhcmVfY3B1cyh2b2lkKQo+PiAgIH0K
Pj4gICAKPj4gICAvKiBCb290IHRoZSBjdXJyZW50IENQVSAqLwo+PiAtdm9pZCBzdGFydF9zZWNv
bmRhcnkodW5zaWduZWQgbG9uZyBib290X3BoeXNfb2Zmc2V0LAo+PiAtICAgICAgICAgICAgICAg
ICAgICAgdW5zaWduZWQgbG9uZyBmZHRfcGFkZHIsCj4+IC0gICAgICAgICAgICAgICAgICAgICB1
bnNpZ25lZCBsb25nIGh3aWQpCj4+ICt2b2lkIHN0YXJ0X3NlY29uZGFyeSh2b2lkKQo+PiAgIHsK
Pj4gICAgICAgdW5zaWduZWQgaW50IGNwdWlkID0gaW5pdF9kYXRhLmNwdWlkOwo+PiAgIAo+PiAt
LSAKPj4gMi4xMS4wCj4+CgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
