Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C1F0165DDE
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2020 13:50:54 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4lF6-00077g-6f; Thu, 20 Feb 2020 12:47:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=eEsh=4I=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1j4lF5-00077O-2C
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2020 12:47:47 +0000
X-Inumbo-ID: 317b3a54-53df-11ea-ade5-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 317b3a54-53df-11ea-ade5-bc764e2007e4;
 Thu, 20 Feb 2020 12:47:46 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1j4lF2-00006M-TW; Thu, 20 Feb 2020 12:47:44 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1j4lF2-0003kB-K4; Thu, 20 Feb 2020 12:47:44 +0000
Date: Thu, 20 Feb 2020 12:47:42 +0000
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200220124742.44x46evpf67cznmn@debian>
References: <ad98947f577560d47ea7825deb624149788645d0.1580219401.git.hongyxia@amazon.com>
 <20200128142133.eqvyj52xdu5lzbdw@debian>
 <f2560c00-dc49-f709-d59a-dc057288ab67@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f2560c00-dc49-f709-d59a-dc057288ab67@suse.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH v6] x86: introduce a new set of APIs to
 manage Xen page tables
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
Cc: Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 jgrall@amazon.com, Hongyan Xia <hongyxia@amazon.com>,
 xen-devel@lists.xenproject.org,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBGZWIgMjAsIDIwMjAgYXQgMDE6MTA6NTZQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMjguMDEuMjAyMCAxNToyMSwgV2VpIExpdSB3cm90ZToKPiA+IE9uIFR1ZSwgSmFu
IDI4LCAyMDIwIGF0IDAxOjUwOjA1UE0gKzAwMDAsIEhvbmd5YW4gWGlhIHdyb3RlOgo+ID4+IEZy
b206IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Cj4gPj4KPiA+PiBXZSBhcmUgZ29pbmcg
dG8gc3dpdGNoIHRvIHVzaW5nIGRvbWhlYXAgcGFnZSBmb3IgcGFnZSB0YWJsZXMuCj4gPj4gQSBu
ZXcgc2V0IG9mIEFQSXMgaXMgaW50cm9kdWNlZCB0byBhbGxvY2F0ZSBhbmQgZnJlZSBwYWdlcyBv
ZiBwYWdlCj4gPj4gdGFibGVzIGJhc2VkIG9uIG1mbiBpbnN0ZWFkIG9mIHRoZSB4ZW5oZWFwIGRp
cmVjdCBtYXAgYWRkcmVzcy4gVGhlCj4gPj4gYWxsb2NhdGlvbiBhbmQgZGVhbGxvY2F0aW9uIHdv
cmsgb24gbWZuX3QgYnV0IG5vdCBwYWdlX2luZm8sIGJlY2F1c2UKPiA+PiB0aGV5IGFyZSByZXF1
aXJlZCB0byB3b3JrIGV2ZW4gYmVmb3JlIGZyYW1lIHRhYmxlIGlzIHNldCB1cC4KPiA+Pgo+ID4+
IEltcGxlbWVudCB0aGUgb2xkIGZ1bmN0aW9ucyB3aXRoIHRoZSBuZXcgb25lcy4gV2Ugd2lsbCBy
ZXdyaXRlLCBzaXRlCj4gPj4gYnkgc2l0ZSwgb3RoZXIgbW0gZnVuY3Rpb25zIHRoYXQgbWFuaXB1
bGF0ZSBwYWdlIHRhYmxlcyB0byB1c2UgdGhlIG5ldwo+ID4+IEFQSXMuCj4gPj4KPiA+PiBBZnRl
ciB0aGUgYWxsb2NhdGlvbiwgb25lIG5lZWRzIHRvIG1hcCBhbmQgdW5tYXAgdmlhIG1hcF9kb21h
aW5fcGFnZSB0bwo+ID4+IGFjY2VzcyB0aGUgUFRFcy4gVGhpcyBkb2VzIG5vdCBicmVhayB4ZW4g
aGFsZiB3YXksIHNpbmNlIHRoZSBuZXcgQVBJcwo+ID4+IHN0aWxsIHVzZSB4ZW5oZWFwIHBhZ2Vz
IHVuZGVybmVhdGgsIGFuZCBtYXBfZG9tYWluX3BhZ2Ugd2lsbCBqdXN0IHVzZQo+ID4+IHRoZSBk
aXJlY3RtYXAgZm9yIG1hcHBpbmdzLiBUaGV5IHdpbGwgYmUgc3dpdGNoZWQgdG8gdXNlIGRvbWhl
YXAgYW5kCj4gPj4gZHluYW1pYyBtYXBwaW5ncyB3aGVuIHVzYWdlIG9mIG9sZCBBUElzIGlzIGVs
aW1pbmF0ZWQuCj4gPj4KPiA+PiBObyBmdW5jdGlvbmFsIGNoYW5nZSBpbnRlbmRlZCBpbiB0aGlz
IHBhdGNoLgo+ID4+Cj4gPj4gU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4
LmNvbT4KPiA+PiBTaWduZWQtb2ZmLWJ5OiBIb25neWFuIFhpYSA8aG9uZ3l4aWFAYW1hem9uLmNv
bT4KPiA+PiBSZXZpZXdlZC1ieTogSnVsaWVuIEdyYWxsIDxqZ3JhbGxAYW1hem9uLmNvbT4KPiA+
IAo+ID4gUmV2aWV3ZWQtYnk6IFdlaSBMaXUgPHdsQHhlbi5vcmc+Cj4gCj4gQWNrZWQtYnk6IEph
biBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KClRoYW5rcy4gSSBoYXZlIHB1c2hlZCB0aGlz
IHBhdGNoIHRvIHVuYmxvY2sgSG9uZ3lhbi4KCldlaS4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
