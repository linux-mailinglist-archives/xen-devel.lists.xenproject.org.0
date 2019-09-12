Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB05CB14AB
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2019 21:03:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8UKE-0003yH-9G; Thu, 12 Sep 2019 19:00:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tudw=XH=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1i8UKC-0003yC-FN
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2019 19:00:12 +0000
X-Inumbo-ID: 8b5ed9dc-d58f-11e9-95a4-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 8b5ed9dc-d58f-11e9-95a4-12813bfff9fa;
 Thu, 12 Sep 2019 19:00:10 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 74AD9337;
 Thu, 12 Sep 2019 12:00:10 -0700 (PDT)
Received: from [10.37.12.51] (unknown [10.37.12.51])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A13943F67D;
 Thu, 12 Sep 2019 12:00:09 -0700 (PDT)
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20190823184826.14525-1-volodymyr_babchuk@epam.com>
 <20190823184826.14525-6-volodymyr_babchuk@epam.com>
 <d54ec451-7aa5-d289-8080-708e91d9e39d@arm.com> <87v9ung02w.fsf@epam.com>
 <a094fc62-5bcd-edb1-e970-3ec023860ec6@arm.com> <87lfuufzfk.fsf@epam.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <85d27ba4-ae9b-f704-a074-913d5bc87059@arm.com>
Date: Thu, 12 Sep 2019 20:00:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <87lfuufzfk.fsf@epam.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 5/5] xen/arm: optee: remove experimental
 status
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
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgVm9sb2R5bXlyLAoKT24gOS8xMS8xOSA3OjQxIFBNLCBWb2xvZHlteXIgQmFiY2h1ayB3cm90
ZToKPiAKPiBKdWxpZW4gR3JhbGwgd3JpdGVzOgo+IAo+PiBPbiA4LzIzLzE5IDg6MjAgUE0sIFZv
bG9keW15ciBCYWJjaHVrIHdyb3RlOgo+Pj4KPj4+IEhpIEp1bGllbiwKPj4KPj4gSGksCj4+Cj4+
IEFwb2xvZ2llcyBmb3IgdGhlIGRlbGF5Lgo+IEl0IGlzIG9rYXkuIEkgbXlzZWxmIHdhcyBidXN5
IGEgYml0Lgo+IAo+Pgo+Pj4KPj4+IEp1bGllbiBHcmFsbCB3cml0ZXM6Cj4+Pgo+Pj4+IEhpLAo+
Pj4+Cj4+Pj4gT24gOC8yMy8xOSA3OjQ4IFBNLCBWb2xvZHlteXIgQmFiY2h1ayB3cm90ZToKPj4+
Pj4gQXMgYWxsIFRPRE9zIGFuZCBwb3RlbnRpYWwgc2VjdXJpdHkgaXNzdWVzIGFyZSByZXNvbHZl
ZCBub3csCj4+Pj4+IHJlbW92ZSBleHBlcmltZW50YWwgc3RhdHVzIGZyb20gT1AtVEVFIG1lZGlh
dG9yLgo+Pj4+Cj4+Pj4gTG9va2luZyBhdCBTVVBQT1JULk1ELCBJIHRoaW5rIE9QLVRFRSB3aXRo
b3V0IHRoaXMgc2VyaWVzIHdvdWxkIGJlCj4+Pj4gY29uc2lkZXJlZCBhcyAiRXhwZXJpbWVudGFs
Ii4KPj4+IFJpZ2h0Lgo+Pj4KPj4+Pgo+Pj4+IFdpdGggdGhpcyBzZXJpZXMgYXBwbGllZCwgSSBz
dGlsbCB0aGluayB3ZSBzaG91bGQga2VlcCB0aGUgS2NvbmZpZwo+Pj4+IGJlaGluZCBFWFBFUlQg
YnV0IG1hcmsgaXQgYXMgIlRlY2huaWNhbCBQcmV2aWV3IiBmb3IgYXQgbGVhc3QgYQo+Pj4+IHJl
bGVhc2UuIFRoaXMgd291bGQgZW5jb3VyYWdlIHBlb3BsZSB0byB0ZXN0IGFuZCByZXBvcnQgYW55
IHBvdGVudGlhbAo+Pj4+IGlzc3VlcyB3aXRoIE9QLVRFRS4KPj4+Pgo+Pj4+IFdlIGNhbiByZS1k
aXNjdXNzIGFib3V0IHRoZSBzdGF0ZSBpbiBhIGZldyBtb250aHMgZm9yIGZ1dHVyZSByZWxlYXNl
Lgo+Pj4+Cj4+Pj4gQlRXLCBTVVBQT1JULk1EIHNob3VsZCBiZSB1cGRhdGVkIHRvIHJlZmxlY3Qg
dGhlIHN0YXRlIG9mIE9QLVRFRSBpbiBYZW4uCj4+PiBGYWlyIGVub3VnaC4gSW4gdGhlIG5leHQg
dmVyc2lvbiBJJ2xsIHJlcGxhY2UgdGhpcyBwYXRjaCB3aXRoIHBhdGNoIHRvCj4+PiBTVVBQT1JU
Lm1kLiBPciBpdCBpcyBiZXR0ZXIgdG8gcHVzaCBzZXBhcmF0ZSBwYXRjaCBmb3IgdGhlIGRvY3Vt
ZW50YXRpb24/Cj4+Cj4+IEkgdGhpbmsgdGhlIHBhdGNoIGluIFNVUFBPUlQuTUQgc2hvdWxkIGdv
IHJlZ2FyZGxlc3Mgb2YgdGhlIHN0YXRlIG9mCj4+IHRoZSByZXN0LiBJdCBpcyBmaW5lIHRvIGtl
ZXAgaXQgaW4gdGhpcyBzZXJpZXMuCj4gT2theS4gQnkgdGhlIHdheSwgSSBza2ltbWVkIHRocnUg
U1VQUE9SVC5NRCBhbmQgSSdtIG5vdCBzdXJlIHdoYXQgaXMgdGhlCj4gYmVzdCBwbGFjZSB0byBk
ZXNjcmliZSBtZWRpYXRvci4gU28gSSBjb3VsZCB1c2Ugc29tZSBhZHZpY2UgdGhlcmUuCgpHb29k
IHF1ZXN0aW9uLiBJIHdvdWxkIHB1dCBpdCB1bmRlciAiIyMgVmlydHVhbCBIYXJkd2FyZSwgSHlw
ZXJ2aXNvciIuIApNYXliZSBhZnRlciB0aGUgc3Vic2VjdGlvbiAiIyMjIEFSTTogR3Vlc3QgQUNQ
SSBzdXBwb3J0Ij8KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
