Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C5F27C43
	for <lists+xen-devel@lfdr.de>; Thu, 23 May 2019 13:56:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hTmHQ-0003Sz-MA; Thu, 23 May 2019 11:53:04 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=oIoO=TX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hTmHO-0003Su-Jj
 for xen-devel@lists.xenproject.org; Thu, 23 May 2019 11:53:02 +0000
X-Inumbo-ID: 504d578e-7d51-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 504d578e-7d51-11e9-8980-bc764e045a96;
 Thu, 23 May 2019 11:53:01 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 23 May 2019 05:53:00 -0600
Message-Id: <5CE689970200007800231AD9@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Thu, 23 May 2019 05:52:55 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>
References: <1558540230-26612-1-git-send-email-andrew.cooper3@citrix.com>
 <1558607223-19630-1-git-send-email-andrew.cooper3@citrix.com>
In-Reply-To: <1558607223-19630-1-git-send-email-andrew.cooper3@citrix.com>
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

Pj4+IE9uIDIzLjA1LjE5IGF0IDEyOjI3LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gLS0tIGEveGVuL2FyY2gveDg2L3hzdGF0ZS5jCj4gKysrIGIveGVuL2FyY2gveDg2L3hz
dGF0ZS5jCj4gQEAgLTY2MCw5ICs2NjAsNyBAQCBzdGF0aWMgYm9vbCB2YWxpZF94Y3IwKHU2NCB4
Y3IwKQo+ICBpbnQgdmFsaWRhdGVfeHN0YXRlKGNvbnN0IHN0cnVjdCBkb21haW4gKmQsIHVpbnQ2
NF90IHhjcjAsIHVpbnQ2NF90IHhjcjBfYWNjdW0sCj4gICAgICAgICAgICAgICAgICAgICAgY29u
c3Qgc3RydWN0IHhzYXZlX2hkciAqaGRyKQo+ICB7Cj4gLSAgICBjb25zdCBzdHJ1Y3QgY3B1aWRf
cG9saWN5ICpjcCA9IGQtPmFyY2guY3B1aWQ7Cj4gLSAgICB1aW50NjRfdCB4Y3IwX21heCA9Cj4g
LSAgICAgICAgKCh1aW50NjRfdCljcC0+eHN0YXRlLnhjcjBfaGlnaCA8PCAzMikgfCBjcC0+eHN0
YXRlLnhjcjBfbG93Owo+ICsgICAgdWludDY0X3QgeGNyMF9tYXggPSBjcHVpZF9wb2xpY3lfeGNy
MChkLT5hcmNoLmNwdWlkKTsKPiAgICAgIHVuc2lnbmVkIGludCBpOwo+ICAKPiAgICAgIGlmICgg
KGhkci0+eHN0YXRlX2J2ICYgfnhjcjBfYWNjdW0pIHx8Cj4gQEAgLTY4Niw5ICs2ODQsNyBAQCBp
bnQgdmFsaWRhdGVfeHN0YXRlKGNvbnN0IHN0cnVjdCBkb21haW4gKmQsIHVpbnQ2NF90IHhjcjAs
IHVpbnQ2NF90IHhjcjBfYWNjdW0sCj4gIGludCBoYW5kbGVfeHNldGJ2KHUzMiBpbmRleCwgdTY0
IG5ld19idikKPiAgewo+ICAgICAgc3RydWN0IHZjcHUgKmN1cnIgPSBjdXJyZW50Owo+IC0gICAg
Y29uc3Qgc3RydWN0IGNwdWlkX3BvbGljeSAqY3AgPSBjdXJyLT5kb21haW4tPmFyY2guY3B1aWQ7
Cj4gLSAgICB1aW50NjRfdCB4Y3IwX21heCA9Cj4gLSAgICAgICAgKCh1aW50NjRfdCljcC0+eHN0
YXRlLnhjcjBfaGlnaCA8PCAzMikgfCBjcC0+eHN0YXRlLnhjcjBfbG93Owo+ICsgICAgdWludDY0
X3QgeGNyMF9tYXggPSBjcHVpZF9wb2xpY3lfeGNyMChjdXJyLT5kb21haW4tPmFyY2guY3B1aWQp
OwoKSW4gYm90aCBjYXNlcyB0aGUgdmFyaWFibGVzIGFyZSBtb3JlIGFwcHJvcHJpYXRlbHkgbmFt
ZWQgdGhhbgp0aGUgbmV3IGhlbHBlci4gV2hpbGUgSSBhZ3JlZSBpdCdzIHNsaWdodGx5IG1vcmUg
dHlwaW5nLCBkaWQgeW91CmNvbnNpZGVyIGNhbGxpbmcgaXQgY3B1aWRfcG9saWN5X3hjcjBfbWF4
KCk/Cgo+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9saWIveDg2L2NwdWlkLmgKPiArKysgYi94ZW4v
aW5jbHVkZS94ZW4vbGliL3g4Ni9jcHVpZC5oCj4gQEAgLTMwOCw2ICszMDgsMTggQEAgc3RhdGlj
IGlubGluZSB2b2lkIGNwdWlkX2ZlYXR1cmVzZXRfdG9fcG9saWN5KAo+ICAgICAgcC0+ZmVhdC5f
N2ExICA9IGZzW0ZFQVRVUkVTRVRfN2ExXTsKPiAgfQo+ICAKPiArc3RhdGljIGlubGluZSB1aW50
NjRfdCBjcHVpZF9wb2xpY3lfeGNyMChjb25zdCBzdHJ1Y3QgY3B1aWRfcG9saWN5ICpwKQo+ICt7
Cj4gKyAgICByZXR1cm4gKCh1aW50NjRfdClwLT54c3RhdGUueGNyMF9oaWdoIDw8IDMyKSB8IHAt
PnhzdGF0ZS54Y3IwX2xvdzsKPiArfQo+ICsKPiArc3RhdGljIGlubGluZSB1aW50NjRfdCBjcHVp
ZF9wb2xpY3lfeHN0YXRlcyhjb25zdCBzdHJ1Y3QgY3B1aWRfcG9saWN5ICpwKQo+ICt7Cj4gKyAg
ICB1aW50NjRfdCB2YWwgPSBwLT54c3RhdGUueGNyMF9oaWdoIHwgcC0+eHN0YXRlLnhzc19oaWdo
Owo+ICsKPiArICAgIHJldHVybiAodmFsIDw8IDMyKSB8IHAtPnhzdGF0ZS54Y3IwX2xvdyB8IHAt
PnhzdGF0ZS54c3NfbG93Owo+ICt9CgpIb3cgYWJvdXQgYWxzbyBoYXZpbmcgY3B1aWRfcG9saWN5
X3hzcygpIChvciBjcHVpZF9wb2xpY3lfeHNzX21heCgpKQphbmQgdGhlbiBzaW1wbHkgbWFraW5n
IGNwdWlkX3BvbGljeV94c3RhdGVzKCkgY29tYmluZSB0aGUgdHdvCnJlc3VsdHM/CgpBbnl3YXks
IGFzIEkgY2FuIGFsc28gbGl2ZSB3aXRoIHRoaW5ncyBhcyB0aGV5IGFyZSwgd2l0aCBvciB3aXRo
b3V0CmVpdGhlciBvZiB0aGUgc3VnZ2VzdGVkIGNoYW5nZXMKUmV2aWV3ZWQtYnk6IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
