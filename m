Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E9151EF7A
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2019 13:38:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQsBr-0003W3-4L; Wed, 15 May 2019 11:35:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=E9wX=TP=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hQsBp-0003Vy-7r
 for xen-devel@lists.xenproject.org; Wed, 15 May 2019 11:35:17 +0000
X-Inumbo-ID: 8259c86c-7705-11e9-b382-e363ef6447cf
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 8259c86c-7705-11e9-b382-e363ef6447cf;
 Wed, 15 May 2019 11:35:16 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 76A7180D;
 Wed, 15 May 2019 04:35:15 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AB6143F71E;
 Wed, 15 May 2019 04:35:14 -0700 (PDT)
To: =?UTF-8?Q?Lukas_J=c3=bcnger?= <lukas.juenger@ice.rwth-aachen.de>,
 xen-devel@lists.xenproject.org
References: <7f55fb96-0105-4e32-9cbd-1b842ed99509@rwthex-w1-a.rwth-ad.de>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <85c16ffa-690f-19a4-348b-55c97e5f0c25@arm.com>
Date: Wed, 15 May 2019 12:35:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <7f55fb96-0105-4e32-9cbd-1b842ed99509@rwthex-w1-a.rwth-ad.de>
Content-Language: en-US
Subject: Re: [Xen-devel] xen/arm: potential bug in advance_pc
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Lukas Juenger <juenger@ice.rwth-aachen.de>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTQvMDUvMjAxOSAxNzowMywgTHVrYXMgSsO8bmdlciB3cm90ZToKPiBIZWxsbyBhbGwsCgpI
ZWxsbywKClRoYW5rIHlvdSBmb3IgdGhlIHJlcG9ydC4KClBsZWFzZSB0cnkgdG8gQ0MgdGhlIG1h
aW50YWluZXJzIG9mIHRoZSBjb2RlIChpbiB0aGlzIGNhc2UgU3RlZmFubyBhbmQgSSkgd2hlbiAK
YXNraW5nIGEgcXVlc3Rpb24uIFNvIHlvdXIgZS1tYWlsIGRvbid0IGdldCBsb3N0IGluIHRoZSBu
b2lzZSBvZiB4ZW4tZGV2ZWwuCgo+IGluIHRoZSBmdW5jdGlvbiBhZHZhbmNlX3BjIGluIHhlbi9h
cmNoL2FybS90cmFwcy5jIGluIGxpbmUgMTY1NSwxNjU2IHlvdSBjYW4gCj4gZmluZCB0aGUgZm9s
bG93aW5nIGNvZGU6Cj4gCj4gMTY1NcKgwqDCoMKgIEJVR19PTiggKCFwc3JfbW9kZV9pc18zMmJp
dChjcHNyKXx8IShjcHNyJlBTUl9USFVNQikpCj4gMTY1NsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCAmJiAoY3BzciZQU1JfSVRfTUFTSykgKTsKPiAKPiBUaGlzIGNvZGUgc2VlbXMgdG8gY2hlY2sg
dGhhdCB3ZSBhcmUgbm90IHJ1bm5pbmcgaW4gdGh1bWIgbW9kZSBhbmQgdGhhdCB0aGUgCj4gUFNS
X0lUX01BU0sgaXMgbm90IHNldC4KPiBPbiBBUk12OC41LUJUSSBzeXN0ZW1zIGJpdHMgWzExOjEw
XSBvZiBzcHNyX2VsMiBpbmRpY2F0ZSB0aGUgQlRZUEUgKHNlZSAKPiBodHRwczovL2RldmVsb3Bl
ci5hcm0uY29tL2RvY3MvZGRpMDU5NS9iL2FhcmNoNjQtc3lzdGVtLXJlZ2lzdGVycy9zcHNyX2Vs
MikuCj4gSWYgYW4gZXhjZXB0aW9uIGlzIHRha2VuIGluIHRoZSBndWVzdCAoZS5nLiB3cml0ZSB0
byBzeXN0ZW0gcmVnaXN0ZXIpIGZyb20gCj4gQUFyY2g2NCBzdGF0ZSB0aGVzZSBiaXRzIG1pZ2h0
IGJlIHNldC4KPiBUaGUgUFNSX0lUX01BU0sgZm9yIHRodW1iIG1vZGUgb3ZlcmxhcHMgd2l0aCB0
aGVzZSBiaXRzIGFuZCBCVUdfT04gaXMgZXhlY3V0ZWQuCj4gVGhpcyBzZWVtcyB0byBiZSBhIGJ1
Zy4KClhlbiBjb2RlIGJsaW5kbHkgYXNzdW1lZCB0aGF0IFJFUzAgbWVhbnMgdGhlIGJpdHMgY2Fu
bm90IGJlIHVzZWQgZm9yIG90aGVyIApwdXJwb3NlIGluIGxhdGVyIHJldmlzaW9uIG9mIHRoZSBh
cmNoaXRlY3R1cmUuIFNvIHRoaXMgaXMgY2xlYXJseSBhIGJ1Zy4KCj4gSXMgaXQgcmVhbGx5IG5l
Y2Vzc2FyeSB0byBjaGVjayB0aGUgUFNSX0lUX01BU0sgZm9yIEJVR19PTiBoZXJlPwpObywgYW5k
IGl0IGlzIGEgcHJldHR5IGJhZCBpZGVhIHRvIGNoZWNrIGd1ZXN0IGFyY2hpdGVjdHVyYWwgYmVo
YXZpb3Igd2l0aCAKQlVHX09OKCkuIFRoZSBCVUdfT04oKSBuZWVkcyB0byBiZSByZXBsYWNlZCB3
aXRoIHByb3BlciBjaGVjayBvbiB0aGUgQ1BTUiAoc2VlIApiZWxvdykuCgo+IFdoeSBpcyB0aGUg
ZXhlY3V0aW9uIG1vZGUgY2hlY2tlZCB0d2ljZSB3aXRoIHBzcl9tb2RlX2lzXzMyYml0IGFuZCAK
PiBjcHNyJlBTUl9USFVNQiwgYXMgdGhleSBzZWVtIHRvIGRvIHRoZSBzYW1lIHRoaW5nPwoKMzIt
Yml0IG1vZGUgc3VwcG9ydCB0d28gaW5zdHJ1Y3Rpb24gc2V0OiBBUk0gYW5kIFRodW1iLiBGcm9t
IG15IHVuZGVyc3RhbmRpbmcgCnRoZSB2YWx1ZSBvZiBJVCBpcyB1bmtub3duIHdoZW4gdXNpbmcg
dGhlIEFSTSBpbnN0cnVjdGlvbiBzZXQuIEZ1cnRoZXJtb3JlLCB0aGUgCmJpdCA1IG9ubHkgbWVh
bnMgVGh1bWIgb24gMzItYml0IG1vZGUuIEZvciA2NC1iaXQgbW9kZSwgdGhlIGJpdCBpcyBSRVMw
LgoKU28gd2Ugd291bGQgbmVlZCB0byBjaGVjayB0aGUgMiBiaXRzLgoKPiBJZiBQU1JfSVRfTUFT
SyBkb2VzIG5vdCBuZWVkIHRvIGJlIGNoZWNrZWQgZm9yIEJVR19PTiwgdGhlIGlmIHN0YXRlbWVu
dCBpbiB0aGUgCj4gZm9sbG93aW5nIGxpbmUgc2hvdWxkIGNoZWNrIGZvciB0aHVtYiBtb2RlIGFn
YWluLCByaWdodD8KClRoZSBjaGVjayBzaG91bGQgYmUgc29tZXRoaW5nIGxpa2U6CgppZiAoIHBz
cl9tb2RlX2lzXzMyYml0KGNwc3IpICYmIChjcHNyICYgUFNSX1RIVU1CKSAmJiAoY3BzciAmIFBT
Ul9JVF9NQVNLKSApCnsKfQoKSSBoYXZlIG5vdGljZWQgZmV3IG1vcmUgaXNzdWVzIGluIHRoZSB0
cmFwcy5jIGNvZGUgcmVnYXJkaW5nIFJFUzAgLiBJIHdpbGwgc2VuZCAKYSBzZXJpZXMgd2l0aCB0
aGF0IGZpeGVkIGxhdGVyIHRvZGF5LgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
