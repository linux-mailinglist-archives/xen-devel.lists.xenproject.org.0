Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B0C897E2
	for <lists+xen-devel@lfdr.de>; Mon, 12 Aug 2019 09:31:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hx4ko-0001Nw-Kr; Mon, 12 Aug 2019 07:28:30 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Z6G0=WI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hx4km-0001Nn-OP
 for xen-devel@lists.xenproject.org; Mon, 12 Aug 2019 07:28:28 +0000
X-Inumbo-ID: c603fa45-bcd2-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id c603fa45-bcd2-11e9-8980-bc764e045a96;
 Mon, 12 Aug 2019 07:28:27 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B95C6AED6;
 Mon, 12 Aug 2019 07:28:25 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <b1008379-a9cf-f7ab-b34b-da463ec5f074@suse.com>
 <20190812071735.qg3sldfx3j3xqzo7@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <44ce689c-11d1-b197-c7bd-69a4b4f48418@suse.com>
Date: Mon, 12 Aug 2019 09:28:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190812071735.qg3sldfx3j3xqzo7@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] preparations for 4.12.1
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
Cc: Lars Kurth <lars.kurth@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIuMDguMjAxOSAwOToxNywgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6Cj4gT24gRnJpLCBK
dWwgMTksIDIwMTkgYXQgMDI6MjM6NDRQTSArMDAwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IHRo
ZSByZWxlYXNlIGlzIGR1ZSBpbiBlYXJseSBBdWd1c3QuIFBsZWFzZSBwb2ludCBvdXQgYmFja3Bv
cnRzIHlvdQo+PiBmaW5kIG1pc3NpbmcgZnJvbSB0aGUgcmVzcGVjdGl2ZSBzdGFnaW5nIGJyYW5j
aCwgYnV0IHdoaWNoIHlvdQo+PiBjb25zaWRlciByZWxldmFudC4gVGhlIG9uZSBjb21taXQgSSd2
ZSBxdWV1ZWQgYWxyZWFkeSBvbiB0b3Agb2YKPj4gd2hhdCB3YXMganVzdCBwdXNoZWQgaXMKPj4K
Pj4gZWMyYWI0OTFiNQl4ODYvZXB0OiBwYXNzIGNvcnJlY3QgbGV2ZWwgdG8gcDJtX2VudHJ5X21v
ZGlmeQo+IAo+IE1heWJlIEknbSBtaXNzaW5nIHNvbWV0aGluZywgYnV0IGZyb20gdGhlIHRleHQg
YWJvdmUgSSBhc3N1bWVkCj4gZWMyYWI0OTFiNSB3YXMgYWxyZWFkeSBjb21taXR0ZWQgdG8gdGhl
IDQuMTIgYnJhbmNoLCB5ZXQgSSBkb24ndCBzZWVtCj4gdG8gYmUgYWJsZSB0byBzcG90IGl0IGFu
eXdoZXJlIGV4Y2VwdCBzdGFnaW5nL21hc3Rlci4KCkhtbSAtIGNsZWFybHkgYSBtaXN0YWtlIG9m
IG1pbmU6IEl0J3Mgc2l0dGluZyByaWdodCBiZXR3ZWVuIHRoZQpBcmdvIGFuZCBBTUQgSU9NTVUg
YmFja3BvcnRzIGNvbW1pdHRlZCBvbiBKdWwgMjYsIHlldCBJIHNvbWVob3cKbWlzc2VkIGFwcGx5
aW5nIHRoaXMgb25lIGFzIHdlbGwuIFNob3VsZCBub3cgYmUgb25lIG9mIHRoZSBmaXJzdApvbmVz
IHRvIGNvbW1pdCBmb3IgNC4xMi4yLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
