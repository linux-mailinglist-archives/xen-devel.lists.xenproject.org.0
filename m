Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A01927C79
	for <lists+xen-devel@lfdr.de>; Thu, 23 May 2019 14:11:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hTmWD-0004fh-56; Thu, 23 May 2019 12:08:21 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=oIoO=TX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hTmWA-0004fY-Qd
 for xen-devel@lists.xenproject.org; Thu, 23 May 2019 12:08:18 +0000
X-Inumbo-ID: 7276f30a-7d53-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 7276f30a-7d53-11e9-8980-bc764e045a96;
 Thu, 23 May 2019 12:08:17 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 23 May 2019 06:08:16 -0600
Message-Id: <5CE68D2E0200007800231B13@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Thu, 23 May 2019 06:08:14 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>
References: <1558540230-26612-1-git-send-email-andrew.cooper3@citrix.com>
 <1558607223-19630-1-git-send-email-andrew.cooper3@citrix.com>
 <5CE689970200007800231AD9@prv1-mh.provo.novell.com>
 <2c57c495-3149-f883-ac6c-3db50334d21b@citrix.com>
In-Reply-To: <2c57c495-3149-f883-ac6c-3db50334d21b@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH] libx86: Introduce wrappers for extracting
 XCR0/XSS from a cpuid policy
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDIzLjA1LjE5IGF0IDEzOjU5LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMjMvMDUvMjAxOSAxMjo1MiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDIz
LjA1LjE5IGF0IDEyOjI3LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4+PiAt
LS0gYS94ZW4vaW5jbHVkZS94ZW4vbGliL3g4Ni9jcHVpZC5oCj4+PiArKysgYi94ZW4vaW5jbHVk
ZS94ZW4vbGliL3g4Ni9jcHVpZC5oCj4+PiBAQCAtMzA4LDYgKzMwOCwxOCBAQCBzdGF0aWMgaW5s
aW5lIHZvaWQgY3B1aWRfZmVhdHVyZXNldF90b19wb2xpY3koCj4+PiAgICAgIHAtPmZlYXQuXzdh
MSAgPSBmc1tGRUFUVVJFU0VUXzdhMV07Cj4+PiAgfQo+Pj4gIAo+Pj4gK3N0YXRpYyBpbmxpbmUg
dWludDY0X3QgY3B1aWRfcG9saWN5X3hjcjAoY29uc3Qgc3RydWN0IGNwdWlkX3BvbGljeSAqcCkK
Pj4+ICt7Cj4+PiArICAgIHJldHVybiAoKHVpbnQ2NF90KXAtPnhzdGF0ZS54Y3IwX2hpZ2ggPDwg
MzIpIHwgcC0+eHN0YXRlLnhjcjBfbG93Owo+Pj4gK30KPj4+ICsKPj4+ICtzdGF0aWMgaW5saW5l
IHVpbnQ2NF90IGNwdWlkX3BvbGljeV94c3RhdGVzKGNvbnN0IHN0cnVjdCBjcHVpZF9wb2xpY3kg
KnApCj4+PiArewo+Pj4gKyAgICB1aW50NjRfdCB2YWwgPSBwLT54c3RhdGUueGNyMF9oaWdoIHwg
cC0+eHN0YXRlLnhzc19oaWdoOwo+Pj4gKwo+Pj4gKyAgICByZXR1cm4gKHZhbCA8PCAzMikgfCBw
LT54c3RhdGUueGNyMF9sb3cgfCBwLT54c3RhdGUueHNzX2xvdzsKPj4+ICt9Cj4+IEhvdyBhYm91
dCBhbHNvIGhhdmluZyBjcHVpZF9wb2xpY3lfeHNzKCkgKG9yIGNwdWlkX3BvbGljeV94c3NfbWF4
KCkpCj4+IGFuZCB0aGVuIHNpbXBseSBtYWtpbmcgY3B1aWRfcG9saWN5X3hzdGF0ZXMoKSBjb21i
aW5lIHRoZSB0d28KPj4gcmVzdWx0cz8KPiAKPiBJIHN0YXJ0ZWQgd2l0aCB0aGF0LCBidXQgdGhl
IHJlc3VsdGluZyBjb2RlIHdhcyBhIGxpdHRsZSBhd2t3YXJkIHRvCj4gcmVhZCwgYW5kIHRoZSBh
c20gZ2VuZXJhdGlvbiB3YXMgYSBsaXR0bGUgd29yc2UgZHVlIHRvIHByb21vdGluZwo+IGV2ZXJ5
dGhpbmcgZmlyc3QuCj4gCj4gSSBkb24ndCB0aGluayB3ZSBuZWVkIGNwdWlkX3BvbGljeV94c3N7
LF9tYXh9KCkgdW50aWwgd2UgYWN0dWFsbHkKPiBpbXBsZW1lbnQgc29tZXRoaW5nIGZvciBndWVz
dHMgKG1vc3QgbGlrZWx5IENFVCBhdCB0aGlzIHJhdGUpLgoKV2VsbCwgbGV0J3Mgc3RpY2sgdG8g
d2hhdCB5b3UgaGF2ZSB0aGVuLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
