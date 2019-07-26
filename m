Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A332376AFE
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2019 16:04:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hr0np-0001Zr-22; Fri, 26 Jul 2019 14:02:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ymAH=VX=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hr0nn-0001Zi-Al
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2019 14:02:31 +0000
X-Inumbo-ID: 014c2f8a-afae-11e9-8d2d-6744a98985d7
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 014c2f8a-afae-11e9-8d2d-6744a98985d7;
 Fri, 26 Jul 2019 14:02:29 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0E794337;
 Fri, 26 Jul 2019 07:02:29 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5CC8F3F694;
 Fri, 26 Jul 2019 07:02:28 -0700 (PDT)
To: Andrii Anisov <andrii.anisov@gmail.com>
References: <1563456140-12180-1-git-send-email-andrii.anisov@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <18337bfe-c11e-899e-0ac9-90bb90491f21@arm.com>
Date: Fri, 26 Jul 2019 15:02:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1563456140-12180-1-git-send-email-andrii.anisov@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] arm:cpuerrata: Align a virtual address
 before unmap
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
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <andrii_anisov@epam.com>, xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpJdCBsb29rcyBsaWtlIHRoZSB2bWFwIHNvbHV0aW9uIHN1Z2dlc3RlZCBieSBBbmRyZXcg
JiBJIGlzIGEgZGVhZCBlbmQuIEkgc3RpbGwgCnRoaW5rIHdlIG5lZWQgdG8gZG8gc29tZXRoaW5n
IGluIHRoZSB2bWFwIHJlZ2FyZGxlc3MgdGhlIGFsaWdubWVudCBkZWNpc2lvbiB0byAKYXZvaWQg
dW53YW50ZWQgc3VycHJpc2VkIChpLmUgdGhlIFBhZ2UtdGFibGUgbm90IGluIHN5bmMgd2l0aCB0
aGUgdm1hcCBzdGF0ZSkuCgpXZSBwb3RlbnRpYWxseSB3YW50IHRvIGFkZCBzb21lIEFTU0VSVF9V
TlJFQUNIQUJMRSgpIGluIHRoZSBwYWdlLXRhYmxlIGNvZGUgZm9yIAp0aGUgc2FuaXR5IGNoZWNr
LiBTbyB3ZSBkb24ndCBjb250aW51ZSB3aXRob3V0IGZ1cnRoZXIgb24gZGVidWcgYnVpbGQuIEkg
d2lsbCAKaGF2ZSBhIGxvb2sgYXQgYm90aC4KCkEgY291cGxlIG9mIGNvbW1lbnRzIGZvciB0aGUg
cGF0Y2guCgpUaXRsZTogTklUOiBNaXNzaW5nIHNwYWNlIGFmdGVyIHRoZSBmaXJzdCA6LgoKT24g
MTgvMDcvMjAxOSAxNDoyMiwgQW5kcmlpIEFuaXNvdiB3cm90ZToKPiBGcm9tOiBBbmRyaWkgQW5p
c292IDxhbmRyaWlfYW5pc292QGVwYW0uY29tPgo+IAo+IEFmdGVyIGNoYW5nZXMgaW50cm9kdWNl
ZCBieSA5Y2MwNjE4IHdlIGFyZSBhYmxlIHRvIHZtYXAvdnVubWFwCgo3LWRpZ2l0IGlzIG5vdCBz
dWZmaWNpZW50IHRvIGd1YXJhbnRlZSBpdCB3aWxsIGJlIHVuaXEgaW4gdGhlIGZ1dHVyZS4gWW91
IGFsc28gCndhbnQgdG8gc3BlY2lmeSB0aGUgY29tbWl0IHRpdGxlLgoKPiBwYWdlIGFsaWduZWQg
YWRkcmVzc2VzIG9ubHkuCj4gU28gaWYgd2UgYWRkIGEgcGFnZSBhZGRyZXNzIHJlbWFpbmRlciB0
byB0aGUgbWFwcGVkIHZpcnR1YWwgYWRkcmVzcywKPiB3ZSBoYXZlIHRvIG1hc2sgaXQgb3V0IGJl
Zm9yZSB1bm1hcHBpbmcuCj4gCj4gU2lnbmVkLW9mZi1ieTogQW5kcmlpIEFuaXNvdiA8YW5kcmlp
X2FuaXNvdkBlcGFtLmNvbT4KCkFja2VkLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsTEBh
cm0uY29tPgoKCklmIHlvdSBhcmUgaGFwcHkgd2l0aCB0aGUgY2hhbmdlcywgSSBjYW4gZG8gdGhl
bSBvbiBjb21taXQuCgo+IC0tLQo+ICAgeGVuL2FyY2gvYXJtL2NwdWVycmF0YS5jIHwgMiArLQo+
ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlm
ZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9jcHVlcnJhdGEuYyBiL3hlbi9hcmNoL2FybS9jcHVlcnJh
dGEuYwo+IGluZGV4IDg5MDQ5MzkuLjZmNDgzYjIgMTAwNjQ0Cj4gLS0tIGEveGVuL2FyY2gvYXJt
L2NwdWVycmF0YS5jCj4gKysrIGIveGVuL2FyY2gvYXJtL2NwdWVycmF0YS5jCj4gQEAgLTc1LDcg
Kzc1LDcgQEAgc3RhdGljIGJvb2wgY29weV9oeXBfdmVjdF9icGkodW5zaWduZWQgaW50IHNsb3Qs
IGNvbnN0IGNoYXIgKmh5cF92ZWNfc3RhcnQsCj4gICAgICAgY2xlYW5fZGNhY2hlX3ZhX3Jhbmdl
KGRzdF9yZW1hcHBlZCwgVkVDVE9SX1RBQkxFX1NJWkUpOwo+ICAgICAgIGludmFsaWRhdGVfaWNh
Y2hlKCk7Cj4gICAKPiAtICAgIHZ1bm1hcChkc3RfcmVtYXBwZWQpOwo+ICsgICAgdnVubWFwKCh2
b2lkICopKCh2YWRkcl90KWRzdF9yZW1hcHBlZCAmIFBBR0VfTUFTSykpOwo+ICAgCj4gICAgICAg
cmV0dXJuIHRydWU7Cj4gICB9Cj4gCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
