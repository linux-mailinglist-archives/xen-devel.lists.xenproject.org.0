Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A853A5657E
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2019 11:14:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hg3wz-0000b7-UF; Wed, 26 Jun 2019 09:10:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cvzu=UZ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hg3wz-0000b0-3w
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2019 09:10:45 +0000
X-Inumbo-ID: 45d92fd2-97f2-11e9-ae17-5faf8c060ffa
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 45d92fd2-97f2-11e9-ae17-5faf8c060ffa;
 Wed, 26 Jun 2019 09:10:42 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B667B2B;
 Wed, 26 Jun 2019 02:10:41 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0E0933F718;
 Wed, 26 Jun 2019 02:10:40 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20190610193215.23704-1-julien.grall@arm.com>
 <20190610193215.23704-6-julien.grall@arm.com>
 <alpine.DEB.2.21.1906251704400.5851@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <c977698e-3f5d-13b0-9283-69ebfa0b35b8@arm.com>
Date: Wed, 26 Jun 2019 10:10:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1906251704400.5851@sstabellini-ThinkPad-T480s>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 05/17] xen/arm64: head: Introduce print_reg
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
Cc: xen-devel@lists.xenproject.org, Oleksandr_Tyshchenko@epam.com,
 andrii_anisov@epam.com, andre.przywara@arm.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgU3RlZmFubywKCk9uIDI2LzA2LzIwMTkgMDE6MDksIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90
ZToKPiBPbiBNb24sIDEwIEp1biAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IEF0IHRoZSBt
b21lbnQsIHRoZSB1c2VyIHNob3VsZCBzYXZlIHgzMC9sciBpZiBpdCBjYXJlcyBhYm91dCBpdC4K
Pj4KPj4gRm9sbG93LXVwIHBhdGNoZXMgd2lsbCBpbnRyb2R1Y2UgbW9yZSB1c2Ugb2YgcHV0biBp
biBwbGFjZSB3aGVyZSBscgo+PiBzaG91bGQgYmUgcHJlc2VydmVkLgo+Pgo+PiBGdXJ0aGVybW9y
ZSwgYW55IHVzZXIgb2YgcHV0biBzaG91bGQgYWxzbyBtb3ZlIHRoZSB2YWx1ZSB0byByZWdpc3Rl
ciB4MAo+PiBpZiBpdCB3YXMgc3RvcmVkIGluIGEgZGlmZmVyZW50IHJlZ2lzdGVyLgo+Pgo+PiBG
b3IgY29udmVuaWVuY2UsIGEgbmV3IG1hY3JvIGlzIGludHJvZHVjZWQgdG8gcHJpbnQgYSBnaXZl
biByZWdpc3Rlci4KPj4gVGhlIG1hY3JvIHdpbGwgdGFrZSBjYXJlIGZvciB1cyB0byBtb3ZlIHRo
ZSB2YWx1ZSB0byB4MCBhbmQgYWxzbwo+PiBwcmVzZXJ2ZSBsci4KPj4KPj4gTGFzdGx5IHRoZSBu
ZXcgbWFjcm8gaXMgdXNlZCB0byByZXBsYWNlIGFsbCB0aGUgY2FsbHNpdGUgb2YgcHV0bi4gVGhp
cwo+PiB3aWxsIHNpbXBsaWZ5IHJld29yay9yZXZpZXcgbGF0ZXIgb24uCj4+Cj4+IE5vdGUgdGhh
dCBDdXJyZW50RUwgaXMgbm93IHN0b3JlZCBpbiB4NSBpbnN0ZWFkIG9mIHg0IGJlY2F1c2UgdGhl
IGxhdHRlcgo+PiB3aWxsIGJlIGNsb2JiZXJlZCBieSB0aGUgbWFjcm8gcHJpbnRfcmVnLgo+Pgo+
PiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgo+PiAt
LS0KPj4gICB4ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5TIHwgMjkgKysrKysrKysrKysrKysrKysr
KysrKy0tLS0tLS0KPj4gICAxIGZpbGUgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKSwgNyBkZWxl
dGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9hcm02NC9oZWFkLlMgYi94
ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5TCj4+IGluZGV4IDg0ZTI2NTgyYzQuLjkxNDJiNGE3NzQg
MTAwNjQ0Cj4+IC0tLSBhL3hlbi9hcmNoL2FybS9hcm02NC9oZWFkLlMKPj4gKysrIGIveGVuL2Fy
Y2gvYXJtL2FybTY0L2hlYWQuUwo+PiBAQCAtOTAsOCArOTAsMjUgQEAKPj4gICAgICAgICAgIGJs
ICAgIHB1dHMgICAgOyAgICAgXAo+PiAgICAgICAgICAgbW92ICAgbHIsIHgzICA7ICAgICBcCj4+
ICAgICAgICAgICBST0RBVEFfU1RSKDk4LCBfcykKPj4gKwo+PiArLyoKPj4gKyAqIE1hY3JvIHRv
IHByaW50IHRoZSB2YWx1ZSBvZiByZWdpc3RlciBceGIKPj4gKyAqCj4+ICsgKiBDbG9iYmVycyB4
MCAtIHg0Cj4+ICsgKi8KPj4gKy5tYWNybyBwcmludF9yZWcgeGIKPj4gKyAgICAgICAgbW92ICAg
eDQsIGxyCj4+ICsgICAgICAgIG1vdiAgIHgwLCBceGIKPj4gKyAgICAgICAgYmwgICAgcHV0bgo+
PiArICAgICAgICBtb3YgICBsciwgeDQKPiAKPiBJIGhhdmUgdGhlIHNhbWUgd2VpcmQgaXNzdWVz
IHdpdGggbXkgY29tcGlsZXIgYXMgYmVmb3JlLCByZXBsYWNpbmcgJ2xyJwo+IHdpdGggJ3gzMCcg
c29sdmVzIHRoZSBwcm9ibGVtLgoKQ2FuIHlvdSBoYXZlIGEgdHJ5IHdpdGggdGhlIGZvbGxvd2lu
ZyBsaW5lPwoKbHIgICAgICAucmVxICAgIHgzMCAgICAgICAgICAgICAvLyBsaW5rIHJlZ2lzdGVy
CgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
