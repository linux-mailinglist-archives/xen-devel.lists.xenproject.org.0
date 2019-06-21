Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C114EB92
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jun 2019 17:11:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1heL9Z-0004Db-9E; Fri, 21 Jun 2019 15:08:37 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=jygh=UU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1heL9X-0004DW-Vd
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2019 15:08:36 +0000
X-Inumbo-ID: 702a3b6a-9436-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 702a3b6a-9436-11e9-8980-bc764e045a96;
 Fri, 21 Jun 2019 15:08:34 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 21 Jun 2019 09:08:33 -0600
Message-Id: <5D0CF2ED020000780023A323@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Fri, 21 Jun 2019 09:08:29 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Paul Durrant" <paul.durrant@citrix.com>
References: <20190617082358.2734-1-paul.durrant@citrix.com>
In-Reply-To: <20190617082358.2734-1-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v2] viridian: unify time sources
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>, WeiLiu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDE3LjA2LjE5IGF0IDEwOjIzLCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+IEN1cnJlbnRseSwgdGhlIHRpbWVfcmVmX2NvdW50IGVubGlnaHRlbmVkIHRpbWUgc291cmNl
IG1haW50YWlucyBhbiBvZmZzZXQKPiBzdWNoIHRoYXQgdGltZSBpcyBmcm96ZW4gd2hlbiB0aGUg
ZG9tYWluIHBhdXNlZCwgYnV0IHRoZSByZWZlcmVuY2VfdHNjCj4gZW5saWdodGVuZWQgdGltZSBz
b3VyY2UgZG9lcyBub3QuIEFmdGVyIG1pZ3JhdGUsIHRoZSByZWZlcmVuY2VfdHNjIHNvdXJjZQo+
IG1heSBiZWNvbWUgaW52YWxpZGF0ZWQgKGUuZy4gYmVjYXVzZSBvZiBob3N0IGNwdSBmcmVxdWVu
Y3kgbWlzbWF0Y2gpIHdoaWNoCj4gd2lsbCBjYXVzZSBXaW5kb3dzIHRvIGZhbGwgYmFjayB0byB0
aW1lX3JlZl9jb3VudC4gVGh1cywgdGhlIGd1ZXN0IHdpbGwKPiBvYnNlcnZlIGEganVtcCBpbiB0
aW1lIGVxdWl2YWxlbnQgdG8gdGhlIG9mZnNldC4KPiAKPiBUaGlzIHBhdGNoIHVuaWZpZXMgdGhl
IHR3byBlbmxpZ2h0ZW5lZCB0aW1lIHNvdXJjZXMgc3VjaCB0aGF0IHRoZSBzYW1lCj4gb2Zmc2V0
IGFwcGxpZXMgdG8gYm90aCBvZiB0aGVtLiBBbHNvLCBpdCdzIG5vdCByZWFsbHkgbmVjZXNzYXJ5
IHRvIGhhdmUKPiB0d28gZGlmZmVyZW50IGZ1bmN0aW9ucyB0byBjYWxjdWxhdGluZyBhIDEwTUh6
IGNvdW50ZXIgdmFsdWUsIHRpbWVfbm93KCkgYW5kCj4gcmF3X3RyY192YWwoKSwgc28gdGhpcyBw
YXRjaCByZW1vdmVzIHRoZSBsYXR0ZXIgaW1wbGVtZW50YXRpb24uIFRoZQo+IHVuaWZpY2F0aW9u
IGFsc28gYWxsb3dzIHJlbW92YWwgb2YgdGhlIHJlZmVyZW5jZV90c2NfdmFsaWQgZmxhZy4KPiAK
PiBXaGlsc3QgaW4gdGhlIGFyZWEsIHRoaXMgcGF0Y2ggYWxzbyB0YWtlcyB0aGUgb3Bwb3J0dW5p
dHkgdG8gY29uc3RpZnkgYSBmZXcKPiBwb2ludGVycyB3aGljaCB3ZXJlIG1pc3NlZCBpbiBlYXJs
aWVyIHBhdGNoZXMuCj4gCj4gU2lnbmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJh
bnRAY2l0cml4LmNvbT4KClRoaXMgbG9va3Mgb2theSB0byBtZSBub3csIGJ1dCBJIGRvbid0IGZl
ZWwgcXVhbGlmaWVkIHRvIGdpdmUgYW4gUi1iLgpXaGlsZSBub3Qgc3RyaWN0bHkgYXBwbGljYWJs
ZSBmb3IgYSBmaWxlIG1haW50YWluZWQgYnkgeW91LApBY2tlZC1ieTogSmFuIEJldWxpY2ggPGpi
ZXVsaWNoQHN1c2UuY29tPgp3aWxsIGhhdmUgdG8gZG8gaGVyZS4KCkphbgoKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
