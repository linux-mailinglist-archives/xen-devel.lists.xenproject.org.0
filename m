Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5A4BB1A9
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2019 11:49:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCKvY-0004T4-In; Mon, 23 Sep 2019 09:46:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XQlp=XS=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iCKvX-0004Sz-4M
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2019 09:46:39 +0000
X-Inumbo-ID: 098e7b3c-dde7-11e9-95fa-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 098e7b3c-dde7-11e9-95fa-12813bfff9fa;
 Mon, 23 Sep 2019 09:46:37 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A9A5B1000;
 Mon, 23 Sep 2019 02:46:37 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0C4383F59C;
 Mon, 23 Sep 2019 02:46:36 -0700 (PDT)
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20190918185041.22738-1-volodymyr_babchuk@epam.com>
 <20190918185041.22738-7-volodymyr_babchuk@epam.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <fc41f8e8-d61e-3c24-0a06-0a1120218ef7@arm.com>
Date: Mon, 23 Sep 2019 10:46:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190918185041.22738-7-volodymyr_babchuk@epam.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 6/6] xen/arm: optee: update description
 in Kconfig
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
Cc: "tee-dev@lists.linaro.org" <tee-dev@lists.linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgVm9sb2R5bXlyLAoKT24gMTgvMDkvMjAxOSAxOTo1MSwgVm9sb2R5bXlyIEJhYmNodWsgd3Jv
dGU6Cj4gT1AtVEVFIG1lZGlhdG9yIG5vdyBpcyAiVGVjaCBQcmV2aWV3IiBzdGF0ZSwgYW5kIHdl
IHdhbnQgdG8gdXBkYXRlCj4gaXQncyBkZXNjcmlwdGlvbiBpbiBLY29uZmlnIGFjY29yZGluZ2x5
Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IFZvbG9keW15ciBCYWJjaHVrIDx2b2xvZHlteXJfYmFiY2h1
a0BlcGFtLmNvbT4KPiAKPiAtLS0KPiAKPiBOb3RlIHRvIGNvbW1pdGVyOiB0aGlzIHBhdGNoIGRl
cGVuZHMgb24gZmlyc3QgNCBwYXRjaGVzIGluIHRoZSBzZXJpZXMuCj4gLS0tCj4gICB4ZW4vYXJj
aC9hcm0vdGVlL0tjb25maWcgfCAxMiArKysrKysrKy0tLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA4
IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNo
L2FybS90ZWUvS2NvbmZpZyBiL3hlbi9hcmNoL2FybS90ZWUvS2NvbmZpZwo+IGluZGV4IGI0YjZh
YTI2MTAuLmE0YTU5ODE5MWUgMTAwNjQ0Cj4gLS0tIGEveGVuL2FyY2gvYXJtL3RlZS9LY29uZmln
Cj4gKysrIGIveGVuL2FyY2gvYXJtL3RlZS9LY29uZmlnCj4gQEAgLTMsNyArMywxMSBAQCBjb25m
aWcgT1BURUUKPiAgIAlkZWZhdWx0IG4KPiAgIAlkZXBlbmRzIG9uIFRFRQo+ICAgCWhlbHAKPiAt
CSAgRW5hYmxlIGV4cGVyaW1lbnRhbCBPUC1URUUgbWVkaWF0b3IuIEl0IGFsbG93cyBndWVzdHMg
dG8gYWNjZXNzCj4gLQkgIE9QLVRFRSBydW5uaW5nIG9uIHlvdXIgcGxhdGZvcm0uIFRoaXMgcmVx
dWlyZXMgdmlydHVhbGl6YXRpb24tZW5hYmxlZAo+IC0JICBPUC1URUUgcHJlc2VudC4gWW91IGNh
biBsZWFybiBtb3JlIGFib3V0IHZpcnR1YWxpemF0aW9uIGZvciBPUC1URUUKPiAtCSAgYXQgaHR0
cHM6Ly9vcHRlZS5yZWFkdGhlZG9jcy5pby9hcmNoaXRlY3R1cmUvdmlydHVhbGl6YXRpb24uaHRt
bAo+ICsJICBFbmFibGUgdGhlIE9QLVRFRSBtZWRpYXRvci4gSXQgYWxsb3dzIGd1ZXN0cyB0byBh
Y2Nlc3MKPiArCSAgT1AtVEVFIHJ1bm5pbmcgb24geW91ciBwbGF0Zm9ybS4gVGhpcyByZXF1aXJl
cwo+ICsJICB2aXJ0dWFsaXphdGlvbi1lbmFibGVkIE9QLVRFRSBwcmVzZW50LiBZb3UgY2FuIGxl
YXJuIG1vcmUKPiArCSAgYWJvdXQgdmlydHVhbGl6YXRpb24gZm9yIE9QLVRFRSBhdAo+ICsJICBo
dHRwczovL29wdGVlLnJlYWR0aGVkb2NzLmlvL2FyY2hpdGVjdHVyZS92aXJ0dWFsaXphdGlvbi5o
dG1sCj4gKwo+ICsJICBSaWdodCBub3cgT1AtVEVFIG1lZGlhdG9yIGlzICJUZWNoIFByZXZpZXci
IHN0YXRlLCBzbyBpdCBpcwo+ICsJICBub3QgZ29vZCBpZGVhIHRvIHVzZSBpdCBpbiBwcm9kdWN0
aW9uLgoKV2VsbCwgdGhlIHdob2xlIFRFRSBzdXBwb3J0IGlzIHVuZGVyICJFWFBFUlQiIHNvIHNv
bWVvbmUgc2VsZWN0aW5nIHRoaXMgb3B0aW9uIAphbHJlYWR5IGtub3cgdGhpcyBzaG91bGQgbm90
IGJlIHVzZWQgaW4gcHJvZHVjdGlvbi4gV2UgYWxzbyBoYXZlIFNVUFBPUlQuTUQgCmRlc2NyaWJp
bmcgdGhlIHN0YXRlIG9mIHRoZSBmZWF0dXJlLgoKU28gSSB3b3VsZCBkcm9wIGNvbXBsZXRlbHkg
dGhlIGxhc3Qgc2VudGVuY2UgYW5kIHBvdGVudGlhbGx5IGdhdGUgT1BURUUgd2l0aCAKIkVYUEVS
VCIgYXMgd2VsbC4gTm90ZSB0aGF0IHRoZSBsYXN0IGJpdHMgaXMgb3B0aW9uYWwuCgpDaGVlcnMs
CgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
