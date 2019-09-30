Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D5CEC1F97
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 12:54:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEtIf-0006hG-Uf; Mon, 30 Sep 2019 10:53:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=hbFO=XZ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iEtId-0006h8-VT
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 10:53:03 +0000
X-Inumbo-ID: 79a987de-e370-11e9-b588-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 79a987de-e370-11e9-b588-bc764e2007e4;
 Mon, 30 Sep 2019 10:53:03 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 85A83AE6D;
 Mon, 30 Sep 2019 10:53:02 +0000 (UTC)
To: George Dunlap <george.dunlap@citrix.com>, julien.grall@arm.com,
 andrew.cooper3@citrix.com, wei.liu2@citrix.com, George.Dunlap@eu.citrix.com,
 ian.jackson@eu.citrix.com, Oleksandr Andrushchenko <andr2000@gmail.com>,
 sstabellini@kernel.org, xen-devel@lists.xenproject.org,
 konrad.wilk@oracle.com, Jan Beulich <jbeulich@suse.com>
References: <20190930085659.708-1-andr2000@gmail.com>
 <9df7bc3c-8019-ee76-983c-c43befc3662a@citrix.com>
 <4c84b6a3-9cb6-3fc4-8283-f52cc280c16e@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <196f1dc7-f291-d728-1617-dbf46240f966@suse.com>
Date: Mon, 30 Sep 2019 12:53:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <4c84b6a3-9cb6-3fc4-8283-f52cc280c16e@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] SUPPORT.md: Add PV display/sound,
 update keyboard
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
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzAuMDkuMTkgMTI6MzMsIEdlb3JnZSBEdW5sYXAgd3JvdGU6Cj4gT24gOS8zMC8xOSAxMToy
OSBBTSwgR2VvcmdlIER1bmxhcCB3cm90ZToKPj4gT24gOS8zMC8xOSA5OjU2IEFNLCBPbGVrc2Fu
ZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToKPj4+IEZyb206IE9sZWtzYW5kciBBbmRydXNoY2hlbmtv
IDxvbGVrc2FuZHJfYW5kcnVzaGNoZW5rb0BlcGFtLmNvbT4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5
OiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5j
b20+Cj4+PiAtLS0KPj4+ICAgU1VQUE9SVC5tZCB8IDE1ICsrKysrKysrKysrKysrLQo+Pj4gICAx
IGZpbGUgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Pj4KPj4+IGRp
ZmYgLS1naXQgYS9TVVBQT1JULm1kIGIvU1VQUE9SVC5tZAo+Pj4gaW5kZXggMzc1NDczYTQ1NjQw
Li5iNTM2Y2YwODE0ZjMgMTAwNjQ0Cj4+PiAtLS0gYS9TVVBQT1JULm1kCj4+PiArKysgYi9TVVBQ
T1JULm1kCj4+PiBAQCAtMzcyLDYgKzM3MiwxMiBAQCBHdWVzdC1zaWRlIGRyaXZlciBjYXBhYmxl
IG9mIHNwZWFraW5nIHRoZSBYZW4gUFYgRnJhbWVidWZmZXIgcHJvdG9jb2wKPj4+ICAgCj4+PiAg
ICAgICBTdGF0dXMsIExpbnV4ICh4ZW4tZmJmcm9udCk6IFN1cHBvcnRlZAo+Pj4gICAKPj4+ICsj
IyMgUFYgZGlzcGxheSAoZnJvbnRlbmQpCj4+PiArCj4+PiArR3Vlc3Qtc2lkZSBkcml2ZXIgY2Fw
YWJsZSBvZiBzcGVha2luZyB0aGUgWGVuIFBWIGRpc3BsYXkgcHJvdG9jb2wKPj4+ICsKPj4+ICsg
ICAgU3RhdHVzLCBMaW51eDogU3VwcG9ydGVkCj4+Cj4+ICJTdXBwb3J0ZWQiIGhhcyBpbXBsaWNh
dGlvbnMgZm9yIHRoZSBzZWN1cml0eSB0ZWFtOiBuYW1lbHksIGlmIGEKPj4gc2VjdXJpdHkgaXNz
dWUgaXMgZGlzY292ZXJlZCwgd2Ugd2lsbCBpc3N1ZSBhbiBYU0EuICBKdWVyZ2VuLCBhcmUgeW91
Cj4+IHNhdGlzZmllZCB0aGF0IHRoZSBQViBkaXNwbGF5IC8gc291bmQgZHJpdmVycyBhcmUgb2Yg
c3VmZmljaWVudCBxdWFsaXR5Cj4+IHRoYXQgd2UgY2FuIHJlY29tbWVuZCBwZW9wbGUgdXNlIHRo
ZW0/Cj4gCj4gU29ycnksIEkgbWVhbnQgdG8gYWRkOiAiSW4gdGhlIGZhY2Ugb2YgYW4gYWN0aXZl
IGFkdmVyc2FyeSIuCgpZZXMsIEkgdGhpbmsgInN1cHBvcnRlZCIgaXMgZmluZS4KCgpKdWVyZ2Vu
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
