Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 092772B36A
	for <lists+xen-devel@lfdr.de>; Mon, 27 May 2019 13:44:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hVE0l-0005Yx-R8; Mon, 27 May 2019 11:41:51 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=7auh=T3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hVE0l-0005Ys-6c
 for xen-devel@lists.xenproject.org; Mon, 27 May 2019 11:41:51 +0000
X-Inumbo-ID: 6a1275ad-8074-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 6a1275ad-8074-11e9-8980-bc764e045a96;
 Mon, 27 May 2019 11:41:49 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Mon, 27 May 2019 05:41:49 -0600
Message-Id: <5CEBCCF80200007800232C34@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Mon, 27 May 2019 05:41:44 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: <george.dunlap@citrix.com>
References: <5C9E31960200007800222DDF@prv1-mh.provo.novell.com>
 <5CA35D130200007800223E53@prv1-mh.provo.novell.com>
 <6fc3c72b-5111-04d0-7ba9-3c7d545c5dc1@citrix.com>
In-Reply-To: <6fc3c72b-5111-04d0-7ba9-3c7d545c5dc1@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v3] x86emul/fuzz: add a state sanity
 checking function
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDI3LjA1LjE5IGF0IDEyOjUxLCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPiB3cm90
ZToKPiBPbiA0LzIvMTkgMjowMSBQTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IFRoaXMgaXMgdG8g
YWNjb21wYW55IHNhbml0aXplX2lucHV0KCkuIEp1c3QgbGlrZSBmb3IgaW5pdGlhbCBzdGF0ZSB3
ZQo+PiB3YW50IHRvIGhhdmUgc3RhdGUgYmV0d2VlbiB0d28gZW11bGF0ZWQgaW5zbnMgc2FuZSwg
YXQgbGVhc3QgYXMgZmFyIGFzCj4+IGFzc3VtcHRpb25zIGluIHRoZSBtYWluIGVtdWxhdG9yIGdv
LiBEbyBtaW5pbWFsIGNoZWNraW5nIGFmdGVyIHNlZ21lbnQKPj4gcmVnaXN0ZXIsIENSLCBhbmQg
TVNSIHdyaXRlcywgYW5kIHJvbGwgYmFjayB0byB0aGUgb2xkIHZhbHVlIGluIGNhc2Ugb2YKPj4g
ZmFpbHVyZSAocmFpc2luZyAjR1AoMCkgYXQgdGhlIHNhbWUgdGltZSkuCj4+IAo+PiBJbiB0aGUg
cGFydGljdWxhciBjYXNlIG9ic2VydmVkLCBhIENSMCB3cml0ZSBjbGVhcmluZyBDUjAuUEUgd2Fz
Cj4+IGZvbGxvd2VkIGJ5IGEgVkVYLWVuY29kZWQgaW5zbiwgd2hpY2ggdGhlIGRlY29kZXIgYWNj
ZXB0cyBiYXNlZCBvbgo+PiBndWVzdCBhZGRyZXNzIHNpemUsIHJlc3RyaWN0aW5nIHRoaW5ncyBq
dXN0IG91dHNpZGUgb2YgdGhlIDY0LWJpdCBjYXNlCj4+IChyZWFsIGFuZCB2aXJ0dWFsIG1vZGVz
IGRvbid0IGFsbG93IFZFWC1lbmNvZGVkIGluc25zKS4gU3Vic2VxdWVudGx5Cj4+IF9nZXRfZnB1
KCkgd291bGQgdGhlbiBhc3NlcnQgdGhhdCBDUjAuUEUgbXVzdCBiZSBzZXQgKGFuZCBFRkxBR1Mu
Vk0KPj4gY2xlYXIpIHdoZW4gdHJ5aW5nIHRvIGludm9rZSBZTU0sIFpNTSwgb3IgT1BNQVNLIHN0
YXRlLgo+PiAKPj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29t
Pgo+IAo+IFJldmlld2VkLWJ5OiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5j
b20+CgpUaGFua3MuCgo+IFRoYXQgc2FpZCwgSSB3b25kZXIgaWYgdGhlcmUncyBhIHdheSB0byBh
dm9pZCB0aGUgZHVwbGljYXRpb24gYmV0d2Vlbgo+IHNhbml0aXplX2lucHV0KCkgYW5kIGNoZWNr
X3N0YXRlKCkuICBBbm90aGVyIG9wdGlvbiB3b3VsZCBiZSB0byByZXdvcmsKPiBzYW5pdGl6ZV9p
bnB1dCgpIChwZXJoYXBzIGFzIHNhbml6aXRlX3N0YXRlKCkpOgo+ICAqIEFjY2VwdCBhIHBhcmFt
ZXRlciBzYXlpbmcgd2hldGhlciB0byBkbyBvcHRpb25hbCBjaGFuZ2VzIChsaWtlCj4gQ0FOT05J
Q0FMSVpFX01BWUJFKQo+ICAqIFJldHVybiBhIGJvb2xlYW4gc2F5aW5nIHdoZXRoZXIgYW55IHN0
YXRlIHdhcyBpbiBmYWN0IHNhbml0aXplZC4KPiAKPiBUaGVuIHRoZSBjdXJyZW50IGNhbGxlcnMg
b2YgY2hlY2tfc3RhdGUoKSBjb3VsZCBpbnN0ZWFkIGNhbGwKPiBzYW5pdGl6ZV9zdGF0ZSgpLCBh
bmQgdGhyb3cgYW4gZXhjZXB0aW9uIGlmIGl0IHJldHVybnMgMS4gIChPciBzb21lCj4gdmFyaWF0
aW9uIHRoZXJlb2YuKQoKSSBkaWQgY29uc2lkZXIgdGhpcyBhdCB0aGUgdGltZSwgYnV0IHRoZSB0
d28gZnVuY3Rpb25zIGFyZW4ndCBkb2luZwpleGFjdGx5IHRoZSBzYW1lIHZhbGlkYXRpb24uIEZv
ciBleGFtcGxlIHRoaXMKCiAgICAvKiBFRkxBR1MuVk0gbm90IGF2YWlsYWJsZSBpbiBsb25nIG1v
ZGUgKi8KICAgIGlmICggbG9uZ19tb2RlX2FjdGl2ZShjdHh0KSApCiAgICAgICAgcmVncy0+cmZs
YWdzICY9IH5YODZfRUZMQUdTX1ZNOwoKaGFzIG5vIGVxdWl2YWxlbnQgaW4gY2hlY2tfc3RhdGUo
KSwgZm9yIGl0IGJlaW5nIGFuIGVtdWxhdG9yIGJ1Zwp0byBldmVyIHNldCBFRkxBR1MuVk0gaW4g
bG9uZyBtb2RlLiBJIHRoZXJlZm9yZSB0aG91Z2h0IGl0IHdvdWxkCmJlIGJldHRlciB0byBrZWVw
IHRoZW0gc2VwYXJhdGUgZGVzcGl0ZSB0aGVyZSBiZWluZyBwYXJ0aWFsCnJlZHVuZGFuY3kuIElm
IHRoZSBzZXQgb2YgY2hlY2tzIGdyb3dzLCB3ZSBjb3VsZCBjb25zaWRlcgpmYWN0b3Jpbmcgb3V0
IHRoZSBjb21tb24gc3Vic2V0IGludG8gYSBoZWxwZXIgZnVuY3Rpb24uCgpKYW4KCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
