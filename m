Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B503ABEF80
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 12:24:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDQtk-0007bG-5P; Thu, 26 Sep 2019 10:21:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fOM6=XV=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iDQti-0007b1-0a
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 10:21:18 +0000
X-Inumbo-ID: 5e4ca4c0-e047-11e9-8628-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by localhost (Halon) with ESMTP
 id 5e4ca4c0-e047-11e9-8628-bc764e2007e4;
 Thu, 26 Sep 2019 10:21:14 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CC9FA1000;
 Thu, 26 Sep 2019 03:21:13 -0700 (PDT)
Received: from [10.37.8.90] (unknown [10.37.8.90])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E9DC23F67D;
 Thu, 26 Sep 2019 03:21:10 -0700 (PDT)
To: hongyax@amazon.com, xen-devel@lists.xenproject.org
References: <cover.1569489002.git.hongyax@amazon.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <913e6e6b-189c-d318-7b73-4258d53c80f1@arm.com>
Date: Thu, 26 Sep 2019 11:21:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <cover.1569489002.git.hongyax@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [RFC PATCH 00/84] Remove direct map from Xen
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Dario Faggioli <dfaggioli@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpUaGFuayB5b3UgZm9yIHBvc3RpbmcgdGhlIHNlcmllcy4KCk9uIDkvMjYvMTkgMTA6NDUg
QU0sIGhvbmd5YXhAYW1hem9uLmNvbSB3cm90ZToKPiBGcm9tOiBIb25neWFuIFhpYSA8aG9uZ3lh
eEBhbWF6b24uY29tPgo+IAo+IFByZXZpb3VzbHksIFdlaSBMaXUgaGFzIGNyZWF0ZWQgdGhlIHBh
dGNoIHNlcmllcyB0byBzd2l0Y2ggdG8KPiBhbGxvYy9tYXAvdW5tYXAvZnJlZSBBUElzIGZvciBY
ZW4gcGFnZSB0YWJsZXMgc28gdGhhdCBYZW4gcGFnZSB0YWJsZXMKPiBhcmUgbWFwcGVkIHdpdGgg
bWFwX2RvbWFpbl9wYWdlKCkuIFRoaXMgaXMgdGhlIGZpcnN0IHN0ZXAgdG93YXJkcwo+IHJlbW92
aW5nIHRoZSBkaXJlY3QgbWFwLiBJIGltcGxlbWVudGVkIHBhdGNoZXMgb24gdG9wIG9mIFdlaSdz
IHRvIHJlbW92ZQo+IHRoZSBkaXJlY3QgbWFwIGNvbXBsZXRlbHkuCj4gCj4gSW4gYWRkaXRpb24g
dG8gV2VpJ3MsIG15IHBhdGNoZXM6Cj4gLSAoV2VpKSBpbXBsZW1lbnQgYSBwcm9wZXIgUE1BUCBp
bmZyYXN0cnVjdHVyZSBmb3IgYm9vdHN0cmFwcGluZwo+IC0gcmVtb3ZlIGRpcmVjdCBtYXAgY29k
ZSBpbiBtYXBfZG9tYWluX3BhZ2UoKSBhbmQgdXNlIG1hcGNhY2hlLCB1c2UgUE1BUAo+ICAgd2hl
biBtYXBjYWNoZSBub3QgcmVhZHkKPiAtIG1hcC91bm1hcCB4ZW5oZWFwIGFsbG9jYXRpb25zIHRv
IHRoZSBkaXJlY3QgbWFwIHJlZ2lvbiBzbyB0aGF0IHZhPC0+cGEKPiAgIG1hY3JvcyBzdGlsbCB3
b3JrCj4gLSBpbnN0YWxsIGR1bW15IG1hcHBpbmdzIChubyBwZXJtaXNzaW9ucywgSU5WQUxJRF9N
Rk4pIGluc3RlYWQgb2YgYWN0dWFsCj4gICAxOjEgbWFwcGluZ3MgZHVyaW5nIGJvb3QsIHNvIHRo
ZSBkaXJlY3QgbWFwIG5vIGxvbmdlciBleGlzdHMKPiAtIGZpeCBtYW55IHBsYWNlcyB3aGVyZSBj
b2RlIGluY29ycmVjdGx5IGFzc3VtZXMgYSBkaXJlY3QgbWFwCgpJIGFtIGEgYml0IGNvbmZ1c2Vk
LiBBcmUgeW91ciBwYXRjaGVzIGZpeGluZyBidWcgZnJvbSBXZWkncyBzZXJpZXM/Cgo+IAo+IEkg
aGF2ZSBtb2RlcmF0ZWx5IHRlc3RlZCB0aGUgcGF0Y2hlcy4gSSBhbSBhYmxlIHRvIGJvb3QgaW50
byBkb20wLAo+IGNyZWF0ZS9kZXN0cm95IFBWL0hWTSBndWVzdHMgYW5kIHJ1biBYVEYgdGVzdHMu
IFBlcnNvbmFsbHksIEkgZmluZCBpdAo+IGRpZmZpY3VsdCB0byBkaXNjb3ZlciBhbGwgcGxhY2Vz
IHdoZXJlIGl0IGluY29ycmVjdGx5IGFzc3VtZXMgYSBkaXJlY3QKPiBtYXAsIHNvIHJldmlld3Mg
YW5kIGZ1cnRoZXIgdGVzdGluZyBhcmUgbW9yZSB0aGFuIHdlbGNvbWUuCgpEbyB5b3UgaGF2ZSBh
IGJyYW5jaCB3aXRoIHRoaXMgc2VyaWVzIGFwcGxpZWQ/CgpDaGVlcnMsCgotLSAKSnVsaWVuIEdy
YWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
