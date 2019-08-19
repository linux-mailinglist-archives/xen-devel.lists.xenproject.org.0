Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2576994D29
	for <lists+xen-devel@lfdr.de>; Mon, 19 Aug 2019 20:40:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hzmWy-0005MJ-Lp; Mon, 19 Aug 2019 18:37:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UkZp=WP=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hzmWx-0005ME-32
 for xen-devel@lists.xenproject.org; Mon, 19 Aug 2019 18:37:23 +0000
X-Inumbo-ID: 5fb5fece-c2b0-11e9-aee9-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 5fb5fece-c2b0-11e9-aee9-bc764e2007e4;
 Mon, 19 Aug 2019 18:37:18 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 91320360;
 Mon, 19 Aug 2019 11:37:18 -0700 (PDT)
Received: from [10.37.12.162] (unknown [10.37.12.162])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 01C743F246;
 Mon, 19 Aug 2019 11:37:16 -0700 (PDT)
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20190819180125.17504-1-julien.grall@arm.com>
 <ddf69b87-e6f3-689a-17c6-84b00af7d475@citrix.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <cf285756-588b-0682-ef35-73b3d183e9ed@arm.com>
Date: Mon, 19 Aug 2019 19:37:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <ddf69b87-e6f3-689a-17c6-84b00af7d475@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/console: Fix build when
 CONFIG_DEBUG_TRACE=y
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
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Jan Beulich <jbeulich@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgQW5kcmV3LAoKT24gOC8xOS8xOSA3OjA0IFBNLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+IE9u
IDE5LzA4LzIwMTkgMTk6MDEsIEp1bGllbiBHcmFsbCB3cm90ZToKPj4gQ29tbWl0IGI1ZTZlMWVl
OGRhICJ4ZW4vY29uc29sZTogRG9uJ3QgdHJlYXQgTlVMIGNoYXJhY3RlciBhcyB0aGUgZW5kCj4+
IG9mIHRoZSBidWZmZXIiIGV4dGVuZGVkIHNlcmNvbl9wdXRzIHRvIHRha2UgdGhlIG51bWJlciBv
ZiBjaGFyYWN0ZXIKPj4gdG8gcHJpbnQgaW4gYXJndW1lbnQuCj4+Cj4+IFNhZGx5LCBhIGNvdXBs
ZSBvZiBjb3VwbGUgb2YgdGhlIGNhbGxlcnMgaW4gZGVidWd0cmFjZV9kdW1wX3dvcmtlcigpCj4+
IHdlcmUgbm90IGNvbnZlcnRlZC4gVGhpcyByZXN1bHQgdG8gYSBidWlsZCBmYWlsdXJlIHdoZW4g
ZW5hYmxpbmcKPj4gQ09ORklHX0RFQlVHX1RSQUNFLgo+Pgo+PiBTcG90dGVkIGJ5IFRyYXZpcyB1
c2luZyByYW5kY29uZmlnCj4+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdy
YWxsQGFybS5jb20+Cj4+IC0tLQo+PiAgIHhlbi9kcml2ZXJzL2NoYXIvY29uc29sZS5jIHwgNSAr
KystLQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
Cj4+Cj4+IGRpZmYgLS1naXQgYS94ZW4vZHJpdmVycy9jaGFyL2NvbnNvbGUuYyBiL3hlbi9kcml2
ZXJzL2NoYXIvY29uc29sZS5jCj4+IGluZGV4IDJjMTRjMmNhNzMuLjkyNGQ0OTcxY2EgMTAwNjQ0
Cj4+IC0tLSBhL3hlbi9kcml2ZXJzL2NoYXIvY29uc29sZS5jCj4+ICsrKyBiL3hlbi9kcml2ZXJz
L2NoYXIvY29uc29sZS5jCj4+IEBAIC0xMTg1LDExICsxMTg1LDEyIEBAIHN0YXRpYyB2b2lkIGRl
YnVndHJhY2VfZHVtcF93b3JrZXIodm9pZCkKPj4gICAKPj4gICAgICAgLyogUHJpbnQgb2xkZXN0
IHBvcnRpb24gb2YgdGhlIHJpbmcuICovCj4+ICAgICAgIEFTU0VSVChkZWJ1Z3RyYWNlX2J1Zltk
ZWJ1Z3RyYWNlX2J5dGVzIC0gMV0gPT0gMCk7Cj4+IC0gICAgc2VyY29uX3B1dHMoJmRlYnVndHJh
Y2VfYnVmW2RlYnVndHJhY2VfcHJkXSk7Cj4+ICsgICAgc2VyY29uX3B1dHMoJmRlYnVndHJhY2Vf
YnVmW2RlYnVndHJhY2VfcHJkXSwKPj4gKyAgICAgICAgICAgICAgICBzdHJsZW4oJmRlYnVndHJh
Y2VfYnVmW2RlYnVndHJhY2VfcHJkXSkpOwo+IAo+IElzbid0IHRoaXMganVzdCBkZWJ1Z3RyYWNl
X2J5dGVzIC0gZGVidWd0cmFjZV9wcmQgLSAxID8KCkkgdHJpZWQgYW5kIGl0IHJlc3VsdGVkIHRv
IHByaW50IGEgbG90IG9mIEBeIG9uIHRoZSBjb25zb2xlLiBUaGlzIGlzIApiZWNhdXNlIHRoZSBy
aW5nIG1heSBub3QgYmUgZnVsbC4KClNvIHRoZSBwb3J0aW9uIGJldHdlZW4gZGVidWd0cmFjZV9w
cmQgYW5kIGRlYnVndHJhY2VfYnl0ZXMgd2lsbCBiZSBmdWxsIApvZiB6ZXJvLgoKTG9va2luZyBh
dCB0aGUgY29kZSBhZ2FpbiwgSSB0aGluayB0aGlzIHBvcnRpb24gYW5kIGVpdGhlciBiZSBmdWxs
IG9mIAp6ZXJvIGNoYXJhY3RlciBvciBmdWxsIG9mIG5vbi16ZXJvIGNoYXJhY3Rlci4gSW4gb3Ro
ZXIgd29yZCwgYSBtaXggd291bGQgCm5vdCBiZSBwb3NzaWJsZS4gU28gaG93IGFib3V0OgoKaWYg
KCBkZWJ1Z3RyYWNlX2J1ZltkZWJ1Z3RyYWNlX3ByZF0gIT0gJ1wwJyApCiAgIHNlcmNvbl9wdXRz
KCZkZWJ1Z3RyYWNlX2J1ZltkZWJ1Z3RyYWNlX3ByZF0sCiAgICAgICAgICAgICAgIGRlYnVndHJh
Y2VfYnl0ZXMgLSBkZWJ1Z3RyYWNlX3ByZCAtIDEpOwoKCkNoZWVycywKCi0tIApKdWxpZW4gR3Jh
bGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
