Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 471FD98685
	for <lists+xen-devel@lfdr.de>; Wed, 21 Aug 2019 23:20:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0Xy1-00074x-RJ; Wed, 21 Aug 2019 21:16:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7y8g=WR=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1i0Xy0-00074o-MM
 for xen-devel@lists.xenproject.org; Wed, 21 Aug 2019 21:16:28 +0000
X-Inumbo-ID: ee75e134-c458-11e9-b95f-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id ee75e134-c458-11e9-b95f-bc764e2007e4;
 Wed, 21 Aug 2019 21:16:25 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8B302337;
 Wed, 21 Aug 2019 14:16:24 -0700 (PDT)
Received: from [10.37.12.68] (unknown [10.37.12.68])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 151CD3F718;
 Wed, 21 Aug 2019 14:16:21 -0700 (PDT)
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Pawel Wieczorkiewicz <wipawel@amazon.de>, xen-devel@lists.xen.org,
 xen-devel@lists.xenproject.org
References: <20190821100430.89909-1-wipawel@amazon.de>
 <c1a8b2e0-e621-82c6-e577-fd19791257d6@citrix.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <1d8fd758-3cdd-ac27-1256-cdca24282ab1@arm.com>
Date: Wed, 21 Aug 2019 22:16:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <c1a8b2e0-e621-82c6-e577-fd19791257d6@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] livepatch: always print XENLOG_ERR
 information (ARM, ELF)
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
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>, wipawel@amazon.com,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiA4LzIxLzE5IDExOjIwIEFNLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+IE9uIDIxLzA4
LzIwMTkgMTE6MDQsIFBhd2VsIFdpZWN6b3JraWV3aWN6IHdyb3RlOgo+PiBkaWZmIC0tZ2l0IGEv
eGVuL2NvbW1vbi9saXZlcGF0Y2hfZWxmLmMgYi94ZW4vY29tbW9uL2xpdmVwYXRjaF9lbGYuYwo+
PiBpbmRleCBkZDhiNDdhMWZhLi4xOGI5Njg0YWViIDEwMDY0NAo+PiAtLS0gYS94ZW4vY29tbW9u
L2xpdmVwYXRjaF9lbGYuYwo+PiArKysgYi94ZW4vY29tbW9uL2xpdmVwYXRjaF9lbGYuYwo+PiBA
QCAtNTUsNyArNTUsNyBAQCBzdGF0aWMgaW50IGVsZl9yZXNvbHZlX3NlY3Rpb25zKHN0cnVjdCBs
aXZlcGF0Y2hfZWxmICplbGYsIGNvbnN0IHZvaWQgKmRhdGEpCj4+ICAgICAgIHNlYyA9IHh6YWxs
b2NfYXJyYXkoc3RydWN0IGxpdmVwYXRjaF9lbGZfc2VjLCBlbGYtPmhkci0+ZV9zaG51bSk7Cj4+
ICAgICAgIGlmICggIXNlYyApCj4+ICAgICAgIHsKPj4gLSAgICAgICAgZHByaW50ayhYRU5MT0df
RVJSLCBMSVZFUEFUQ0giJXM6IENvdWxkIG5vdCBhbGxvY2F0ZSBtZW1vcnkgZm9yIHNlY3Rpb24g
dGFibGUhXG4iLAo+PiArICAgICAgICBwcmludGsoWEVOTE9HX0VSUiBMSVZFUEFUQ0giJXM6IENv
dWxkIG5vdCBhbGxvY2F0ZSBtZW1vcnkgZm9yIHNlY3Rpb24gdGFibGVcbiIsCj4+ICAgICAgICAg
ICAgICAgICAgZWxmLT5uYW1lKTsKPj4gICAgICAgICAgIHJldHVybiAtRU5PTUVNOwo+PiAgICAg
ICB9Cj4+IEBAIC04MSwyMiArODEsMjIgQEAgc3RhdGljIGludCBlbGZfcmVzb2x2ZV9zZWN0aW9u
cyhzdHJ1Y3QgbGl2ZXBhdGNoX2VsZiAqZWxmLCBjb25zdCB2b2lkICpkYXRhKQo+PiAgICAgICAg
ICAgICAgICAoc2VjW2ldLnNlYy0+c2hfdHlwZSAhPSBTSFRfTk9CSVRTICYmIC8qIFNraXAgU0hU
X05PQklUUyAqLwo+PiAgICAgICAgICAgICAgICAgKGRlbHRhID4gZWxmLT5sZW4gfHwgKGRlbHRh
ICsgc2VjW2ldLnNlYy0+c2hfc2l6ZSA+IGVsZi0+bGVuKSkpICkKPj4gICAgICAgICAgIHsKPj4g
LSAgICAgICAgICAgIGRwcmludGsoWEVOTE9HX0VSUiwgTElWRVBBVENIICIlczogU2VjdGlvbiBb
JXVdIGRhdGEgJXMgb2YgcGF5bG9hZCFcbiIsCj4+IC0gICAgICAgICAgICAgICAgICAgIGVsZi0+
bmFtZSwgaSwKPj4gKyAgICAgICAgICAgIHByaW50ayhYRU5MT0dfRVJSIExJVkVQQVRDSCAiJXM6
IFNlY3Rpb24gWyV1XSBkYXRhICVzIG9mIHBheWxvYWRcbiIsCj4+ICsgICAgICAgICAgICAgICAg
ICAgZWxmLT5uYW1lLCBpLAo+PiAgICAgICAgICAgICAgICAgICAgICAgZGVsdGEgPCBzaXplb2Yo
RWxmX0VoZHIpID8gImF0IEVMRiBoZWFkZXIiIDogImlzIHBhc3QgZW5kIik7Cj4+IEBAIC0zMjgs
NyArMzI4LDcgQEAgaW50IGxpdmVwYXRjaF9lbGZfcmVzb2x2ZV9zeW1ib2xzKHN0cnVjdCBsaXZl
cGF0Y2hfZWxmICplbGYpCj4+ICAgCj4+ICAgICAgICAgICAgICAgaWYgKCByYyApCj4+ICAgICAg
ICAgICAgICAgewo+PiAtICAgICAgICAgICAgICAgIGRwcmludGsoWEVOTE9HX0VSUiwgTElWRVBB
VENIICIlczogT3V0IG9mIGJvdW5kcyBzeW1ib2wgc2VjdGlvbiAlI3hcbiIsCj4+ICsgICAgICAg
ICAgICAgICAgcHJpbnRrKFhFTkxPR19FUlIgTElWRVBBVENIICIlczogT3V0IG9mIGJvdW5kcyBz
eW1ib2wgc2VjdGlvbiAlI3hcbiIsCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgZWxmLT5u
YW1lLCBpZHgpOwo+PiAgICAgICAgICAgICAgICAgICBicmVhazsKPj4gICAgICAgICAgICAgICB9
Cj4gCj4gVGhlc2UgdGhyZWUgaHVua3MgaGF2ZSBtaW5vciBpbmRlbnRhdGlvbi9zcGFjaW5nIGlz
c3Vlcy7CoCBBbGwgY2FuIGJlCj4gZml4ZWQgdXAgb24gY29tbWl0LgoKQWNrZWQtYnk6IEp1bGll
biBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+CgpFdmVuIGlmIHRoaXMgc29tZSBvZiB0aGUg
Y29kZSBpcyB1bmRlciBhcmNoL2FybSwgdGhpcyBzdGlsbCBuZWVkIGFuIGFjayAKZnJvbSBLb25y
YWQvUm9zcy4KCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
