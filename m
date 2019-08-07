Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A189184B49
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 14:17:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvKpv-0005Zi-I9; Wed, 07 Aug 2019 12:14:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WZHT=WD=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hvKpt-0005Zc-RB
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 12:14:33 +0000
X-Inumbo-ID: e812ca98-b90c-11e9-8c99-b374af8df9fd
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id e812ca98-b90c-11e9-8c99-b374af8df9fd;
 Wed, 07 Aug 2019 12:14:29 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5ADA528;
 Wed,  7 Aug 2019 05:14:29 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DB0EE3F575;
 Wed,  7 Aug 2019 05:14:28 -0700 (PDT)
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20190614152301.29592-1-volodymyr_babchuk@epam.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <d67442e3-fb27-9d78-fe54-d5a0f37926cc@arm.com>
Date: Wed, 7 Aug 2019 13:14:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190614152301.29592-1-volodymyr_babchuk@epam.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] docs,
 arm: add documentation on available defconfigs
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

SGkgVm9sb2R5bXlyLAoKU29ycnkgZm9yIHRoZSBsYXRlIGFuc3dlci4KCk9uIDE0LzA2LzIwMTkg
MTY6MjMsIFZvbG9keW15ciBCYWJjaHVrIHdyb3RlOgo+IEFzIGJ1aWxkIHN5c3RlbSBub3cgaGF2
ZSAqX2RlZmNvbmZpZyB0YXJnZXRzIGRlZmluZWQsCj4gbGV0cyBkZXNjcmliZSBhdmFpbGFibGUg
ZGVmY29uZmlnIGZpbGVzIGZvciB0aGUgQXJtIGFyY2hpdGVjdHVyZS4KPiAKPiBTaWduZWQtb2Zm
LWJ5OiBWb2xvZHlteXIgQmFiY2h1ayA8dm9sb2R5bXlyX2JhYmNodWtAZXBhbS5jb20+Cj4gLS0t
Cj4gICBkb2NzL21pc2MvYXJtL2RlZmNvbmZpZ3MudHh0IHwgMjMgKysrKysrKysrKysrKysrKysr
KysrKysKPiAgIDEgZmlsZSBjaGFuZ2VkLCAyMyBpbnNlcnRpb25zKCspCj4gICBjcmVhdGUgbW9k
ZSAxMDA2NDQgZG9jcy9taXNjL2FybS9kZWZjb25maWdzLnR4dAo+IAo+IGRpZmYgLS1naXQgYS9k
b2NzL21pc2MvYXJtL2RlZmNvbmZpZ3MudHh0IGIvZG9jcy9taXNjL2FybS9kZWZjb25maWdzLnR4
dAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMC4uNDZjNTAzOWViYQo+
IC0tLSAvZGV2L251bGwKPiArKysgYi9kb2NzL21pc2MvYXJtL2RlZmNvbmZpZ3MudHh0Cj4gQEAg
LTAsMCArMSwyMyBAQAo+ICtYZW4gaHlwZXJ2aXNvciBmb3IgQXJtIGFyY2hpdGVjdHVyZSBoYXZl
IGEgbnVtYmVyIG9mIGRlZmNvbmZpZ3MsIHdoaWNoCgpzL2hhdmUvaGFzLwoKPiArY2FuIGJlIHVz
ZWQgYnkgaXNzdWluZwo+ICsKPiArICAgIG1ha2UgeHh4eHhfZGVmY29uZmlnCj4gKwo+ICtUaG9z
ZSBkZWZjb25maWdzIGFyZSBsb2NhdGVkIGluIHhlbi9hcmNoL2FybS9jb25maWdzLgo+ICsKPiAr
R2VuZXJhbGx5LCB5b3UgZG9uJ3QgbmVlZCB0byB1c2UgYW55IHBhcnRpY3VsYXIgZGVmY29uZmln
IGlmIHlvdSB3YW50Cj4gK3RvIGJ1aWxkIGRlZmF1bHQgdmVyc2lvbiBvZiBYZW4uIFRoaXMgaXMg
YmVjYXVzZSBkZWZhdWx0IFhlbgo+ICtjb25maWd1cmF0aW9uIGlzIGludGVuZGVkIHRvIHJ1biBv
biBhbnkgc3VwcG9ydGVkIHBsYXRmb3JtLgoKVGhpcyBwYXJhZ3JhcGggaXMgYSBiaXQgaGFyZCB0
byByZWFkLiBJIHdvdWxkIHN1Z2dlc3QgdG8gZHJvcCBpdCBhbmQgYWRkIGEgCnBhcmFncmFwaCBh
dCB0aGUgZW5kIG9mIHRoZSBmaWxlIHN0YXRpbmcgdGhhdCBpZiBubyBkZWZjb25maWcgaXMgc3Bl
Y2lmaWVkLCB0aGVuIAphcm02NF9kZWZjb25maWcgYW5kIGFybTMyX2RlZmNvbmZpZyB3aWxsIGJl
IHVzZWQuCgo+ICsKPiArQW55d2F5cywgdGhlcmUgaXMgYSBudW1iZXIgb2YgZGVmY29uZmlnIGZp
bGVzIHdoaWNoIGhhdmUgc3BlY2lhbCB1c2U6CgpOSVQ6IHMvaXMvYXJlLyBJIHRoaW5rLgoKPiAr
Cj4gKyAtIGFybTMyX2RlZmNvbmZpZyBpcyB0aGUgc3BlY2lhbCBkZWZjb25maWcgZmlsZSB1c2Vk
IGJ5IGJ1aWxkIHN5c3RlbSBhcwo+ICsgICB0aGUgZGVmYXVsdCBjb25maWd1cmF0aW9uIGZvciB0
aGUgYXJtMzIgc3ViLWFyY2hpdGVjdHVyZS4KCkhlcmUgeW91IGRlc2NyaWJlIGFybTMyIGFzIGEg
c3ViLWFyY2hpdGVjdHVyZSBidXQgYmVsb3cgeW91IGRlc2NyaWJlIGFybTY0IGFzIGFuIAphcmNo
aXRlY3R1cmUuIFRoZSBhcmNoaXRlY3R1cmUgaXMgY2FsbGVkIEFybSBhbmQgNjQtYml0LzMyLWJp
dCBhcmUgZXhlY3V0aW9ucyAKc3RhdGUuIEhvdyBhYm91dCB0aGUgZm9sbG93aW5nIHdvcmRpbmc6
CgoiYXJtMzJfZGVmY29uZmlnIHdpbGwgY29uZmlndXJlIHRoZSBidWlsZCBzeXN0ZW0gdG8gZ2Vu
ZXJhdGUgYSBiaW5hcnkgYm9vdGluZyBvbiAKYW55IHN1cHBvcnRlZCAzMi1iaXQgcGxhdGZvcm0u
IFRoaXMgY2FuIGJlIHVzZWQgYXMgYSBiYXNlIGZvciBkb3duc3RyZWFtIApkaXN0cmlidXRpb24g
dG8gcGFja2FnZSBYZW4gaHlwZXJ2aXNvciIuCgo+ICsKPiArIC0gYXJtNjRfZGVmY29uZmlnIGlz
IHRoZSBzYW1lIGFzIGFybTMyX2RlZmNvbmZpZywgYnV0IGZvciBhcm02NCBidWlsZHMuCgpJIHdv
dWxkIHByZWZlciBpZiB5b3UgYXZvaWQgdG8gcmVsYXRlIGFybTY0X2RlZmNvbmZpZyB0byBhcm0z
Ml9kZWZjb25maWcuIFRoZXkgCm1heSBoYXZlIGRpZmZlcmVudCBvcHRpb25zIGVuYWJsZWQuCgo+
ICsKPiArIC0gdGlueTY0X2RlZmNvbmZpZyBjb25maWd1cmVzIFhlbiBoeXBlcnZpc29yIGZvciB0
aGUgbWluaW1hbCBwb3NzaWJsZQo+ICsgICBidWlsZCBmb3IgYXJtNjQgYXJjaGl0ZWN0dXJlLiBJ
dCBkaXNhYmxlcyBtb3N0IG9mIHRoZSBjb25maWd1cmF0aW9uCj4gKyAgIG9wdGlvbnMsIGV4Y2Vw
dCB0aGUgY3JlZGl0IHNjaGVkdWxlci4gVXNlICdtYWtlIG1lbnVjb25maWcnIHRvCj4gKyAgIGVu
YWJsZSBmZWF0dXJlcyBuZWVkZWQgZm9yIHlvdXIgcGxhdGZvcm0sIG9yIHByb2R1Y2VkIGltYWdl
IHdpbGwKPiArICAgYmUgbm9uLWZ1bmN0aW9uYWwuCgpJIHdvdWxkIHN1Z2dlc3QgdG8gbWVudGlv
biB0aGUgcGxhdGZvcm0gY29uZmlndXJhdGlvbiAoc2VlIAphcmNoL2FybS9wbGF0Zm9ybXMvS2Nv
bmZpZykgdGhhdCBoZWxwIGEgdXNlciB0byBzZWxlY3QgYWxsIHRoZSBDT05GSUdfKiBmb3IgYSAK
c3BlY2lmaWMgcGxhdGZvcm0uCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
