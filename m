Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3370535B2F
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jun 2019 13:22:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYTwq-0002ZS-9p; Wed, 05 Jun 2019 11:19:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=af5Q=UE=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hYTwo-0002ZJ-Tf
 for xen-devel@lists.xenproject.org; Wed, 05 Jun 2019 11:19:14 +0000
X-Inumbo-ID: bfd7306a-8783-11e9-859a-67bd77986194
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id bfd7306a-8783-11e9-859a-67bd77986194;
 Wed, 05 Jun 2019 11:19:14 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CF57F374;
 Wed,  5 Jun 2019 04:19:13 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E0F043F5AF;
 Wed,  5 Jun 2019 04:19:12 -0700 (PDT)
To: Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
References: <E3AA6DAA6DCE974798849C41CE0968F8@citrix.com>
 <20190605111356.10429-2-ian.jackson@eu.citrix.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <aeb9f88b-f260-b125-02a0-5d22c6ff3b1c@arm.com>
Date: Wed, 5 Jun 2019 12:19:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190605111356.10429-2-ian.jackson@eu.citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [OSSTEST PATCH 2/2] RFC: enable CONFIG_LIVEPATCH in
 all relevant arm64 builds
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich <JBeulich@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSWFuLAoKT24gMDUvMDYvMjAxOSAxMjoxMywgSWFuIEphY2tzb24gd3JvdGU6Cj4gUmlnaHQg
bm93IHRoZXJlIGlzIGEgYnVnIGluLCBhdCBsZWFzdCwgWGVuIDQuMTEsIHdoZXJlIGl0IGRvZXMg
bm90Cj4gYm9vdCBvbiBzb21lIG9mIG91ciBBUk02NCBtYWNoaW5lcyBidXQgb25seSBpZiBDT05G
SUdfTElWRVBBVENICj4gaXMgKmRpcyphYmxlZC4KPiAKPiBXZSB0aGluayB0aGlzIGlzIGR1ZSB0
byBYZW4gbm90IHBsYXlpbmcgYnkgdGhlIHByb3BlciBjYWNoZSBtYW5hZ2VtZW50Cj4gcnVsZXMg
aW4gdGhlIEFSTSBBUk0uICBXZSB0aGluayB0aGF0IENPTkZJR19MSVZFUEFUQ0ggaXMgbm90IHJl
YWxseQo+IHJlbGV2YW50OiBpdCBqdXN0IGNhdXNlcyBzbGlnaHQgY2hhbmdlcyBpbiB0aW1pbmcg
b3IgbWVtb3J5IGFjY2Vzc2VzCj4gb3IgY29kZSBsYXlvdXQ6IHNvLCBhbm90aGVyIHJvbGwgb2Yg
dGhlIGRpY2UuICBJZSB3ZSB0aGluayBpdCBpcwo+IHJhbmRvbSBjb2luY2lkZW5jZSB0aGF0IGl0
IHdvcmtzIHdpdGggQ09ORklHX0xJVkVQQVRDSCBhbmQgZmFpbHMKPiB3aXRob3V0IGl0Lgo+IAo+
IFJpZ2h0IG5vdyB0aGUgYnVnIGlzIG1hc2tlZCBpbiB0aGUgb3NzdGVzdCBmbGlnaHRzIHdoaWNo
IHRlc3QgdGhlIFhlbgo+IGJyYW5jaGVzIGJlY2F1c2UgdGhleSBhbGwgYXJlIGFsbCBidWlsdCB3
aXRoIENPTkZJR19MSVZFUEFUQ0ggZW5hYmxlZC4KPiBUaGUgbm9uLVhlbiBicmFuY2hlcyB1bnRp
bCBub3cgaGF2ZSBiZWVuIGJ1aWx0IHdpdGggQ09ORklHX0xJVkVQQVRDSAo+IGRpc2FibGVkLgo+
IAo+IFRoZSBvdmVyYWxsIHJlc3VsdCBpcyBibG9ja2FnZSBvZiB0aGUgQ0kgZm9yLCBjdXJyZW50
bHksCj4gcWVtdS14ZW4tNC4xMS10ZXN0aW5nLiAgVGhpcyBibG9ja2FnZSBpcyBub3QgYSB0cnVl
IHJlZ3Jlc3Npb247IHRoZQo+IGNvZGUgd2FzIGFsd2F5cyBidWdneS4gIEl0J3MganVzdCB0aGF0
IHNvbWV0aGluZyBoYXMgY2hhbmdlZCBhbmQgbm93Cj4gdGhlIGJ1ZyBiaXRlcy4KPiAKPiBTd2l0
Y2hpbmcgb24gQ09ORklHX0xJVkVQQVRDSCBmb3IgdGhlIGFmZmVjdGVkIHRlc3RzIHdpbGwsIGhv
cGVmdWxseSwKPiBtYWtlIHRoaXMgcHJvYmxlbSAiZ28gYXdheSIgYWdhaW4uICBUaGlzIGlzIGNs
ZWFybHkgYSBib2RnZS4gIEJ1dCBpdAo+IGlzIGJldHRlciB0aGFuIHNpbXBseSBmb3JjZSBwdXNo
aW5nOiBpZiB3ZSBjYW4gZ2V0IGl0IHRvIGJvb3QsIHdlIHdpbGwKPiBiZSBhYmxlIHRvIHJ1biB0
aGUgb3RoZXIgdGVzdHMuCgpIb3cgYWJvdXQgZGlzYWJsaW5nIHRoZSB0ZXN0IG9uIHJvY2hlc3Rl
cj8KCkNoZWVycywKCj4gCj4gSSBoYXZlIHVzZWQgc3RhbmRhbG9uZS1nZW5lcmF0ZS1kdW1wLWZs
aWdodC1ydW52YXJzIGFuZCB0aGUgZWZmZWN0IGlzCj4gdG8gdHVybiBvbiBlbmFibGVfbGl2ZXBh
dGNoIGluIGJ1aWxkLWFybTY0IGluIHByZWNpc2VseQo+IHFlbXUtdXBzdHJlYW0teGVuLTQuMTEt
dGVzdGluZy4KPiAKPiBBSVVJOgo+IAo+IEFuIGFsdGVybmF0aXZlIHdvdWxkIGJlIHRvIGJhY2tw
b3J0IDAwYzk2ZDc3NDIgInhlbi9hcm06IG1tOiBTZXQtdXAKPiBwYWdlIHBlcm1pc3Npb24gZm9y
IFhlbiBtYXBwaW5ncyBlYXJsaWVyIG9uIiwgdG8gYWZmZWN0ZWQgWGVuIHN0YWJsZQo+IGJyYW5j
aGVzLiAgVGhhdCB3b3VsZCBkaWZmZXJlbnRseSBwZXJtdXRlIHRoZSBjYXNlcyB3aGVyZSB0aGlu
Z3MgZmFpbC4KPiBJbiBwYXJ0aWN1bGFyIG9uIHNvbWUgaGFyZHdhcmUsIGluY2x1ZGluZyAod2Ug
dGhpbmspIGFsbCBoYXJkd2FyZSB3ZQo+IGFjdHVhbGx5IGhhdmUsIHRoZSB2aW9sYXRpb24gb2Yg
dGhlIGFyY2hpdGVjdHVyZSBjYWNoZSBydWxlcyB3b3VsZCBiZQo+IGFic29sdXRlbHkgaXJyZWxl
dmFudCBiZWNhdXNlIG9mIG1pY3JvYXJjaGl0ZWN0dXJhbCBkZXRhaWxzLiAgQnV0IGl0Cj4gbWln
aHQgY2F1c2UgcmVncmVzc2lvbnMgb24gb3RoZXIgaGFyZHdhcmUuCj4gCj4gQ0M6IFN0ZWZhbm8g
U3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KPiBDQzogSmFuIEJldWxpY2ggPEpC
ZXVsaWNoQHN1c2UuY29tPgo+IENDOiBBbnRob255IFBlcmFyZCA8YW50aG9ueS5wZXJhcmRAY2l0
cml4LmNvbQo+IENDOiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgo+IFNpZ25l
ZC1vZmYtYnk6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgo+IC0tLQo+
ICAgbWZpLWNvbW1vbiB8IDMgKystCj4gICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
LCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL21maS1jb21tb24gYi9tZmktY29tbW9u
Cj4gaW5kZXggYjg2ZmViZGEuLjUyYTM4Y2I0IDEwMDY0NAo+IC0tLSBhL21maS1jb21tb24KPiAr
KysgYi9tZmktY29tbW9uCj4gQEAgLTM3Myw3ICszNzMsOCBAQCBjcmVhdGVfYnVpbGRfam9icyAo
KSB7Cj4gICAgICAgICAgIGZpCj4gICAgICAgZmkKPiAgIAo+IC0gICAgaWYgYnJhbmNoX3dhbnRz
X2xpdmVwYXRjaDsgdGhlbgo+ICsgICAgaWYgYnJhbmNoX3dhbnRzX2xpdmVwYXRjaCB8fAo+ICsg
ICAgICAgICAgWyAkYXJjaCA9IGFybTY0IC1hICIkeGVuYnJhbmNoIiA9IHhlbi00LjExLXRlc3Rp
bmcgXTsgdGhlbgo+ICAgICAgICAgIGxpdmVwYXRjaF9ydW52YXJzPSdlbmFibGVfbGl2ZXBhdGNo
PXRydWUnCj4gICAgICAgZmkKPiAgICAgICBldmFsICIKPiAKCi0tIApKdWxpZW4gR3JhbGwKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
