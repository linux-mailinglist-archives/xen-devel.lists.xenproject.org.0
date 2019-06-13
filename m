Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB4054371C
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jun 2019 16:11:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hbQPR-0005fC-JQ; Thu, 13 Jun 2019 14:08:57 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=BOU1=UM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hbQPQ-0005f7-3W
 for xen-devel@lists.xenproject.org; Thu, 13 Jun 2019 14:08:56 +0000
X-Inumbo-ID: c6ee4b41-8de4-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id c6ee4b41-8de4-11e9-8980-bc764e045a96;
 Thu, 13 Jun 2019 14:08:54 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 13 Jun 2019 08:08:53 -0600
Message-Id: <5D0258EE0200007800237EEB@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Thu, 13 Jun 2019 08:08:46 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Chao Gao" <chao.gao@intel.com>
References: <1558945891-3015-1-git-send-email-chao.gao@intel.com>
 <1558945891-3015-10-git-send-email-chao.gao@intel.com>
 <5CF7D77A020000780023598C@prv1-mh.provo.novell.com>
 <20190611124604.GB22930@gao-cwp> <20190611160416.GB44426@otc-nc-03>
 <5D00ABF70200007800237502@prv1-mh.provo.novell.com>
 <20190613140524.GA2355@gao-cwp>
In-Reply-To: <20190613140524.GA2355@gao-cwp>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v7 09/10] microcode: remove
 microcode_update_lock
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
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Ashok Raj <ashok.raj@intel.com>,
 WeiLiu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDEzLjA2LjE5IGF0IDE2OjA1LCA8Y2hhby5nYW9AaW50ZWwuY29tPiB3cm90ZToKPiBP
biBXZWQsIEp1biAxMiwgMjAxOSBhdCAwMTozODozMUFNIC0wNjAwLCBKYW4gQmV1bGljaCB3cm90
ZToKPj4+Pj4gT24gMTEuMDYuMTkgYXQgMTg6MDQsIDxhc2hvay5yYWpAaW50ZWwuY29tPiB3cm90
ZToKPj4+IE9uIFR1ZSwgSnVuIDExLCAyMDE5IGF0IDA4OjQ2OjA0UE0gKzA4MDAsIENoYW8gR2Fv
IHdyb3RlOgo+Pj4+IE9uIFdlZCwgSnVuIDA1LCAyMDE5IGF0IDA4OjUzOjQ2QU0gLTA2MDAsIEph
biBCZXVsaWNoIHdyb3RlOgo+Pj4+ID4KPj4+PiA+PiBAQCAtMzA3LDggKzMwMyw3IEBAIHN0YXRp
YyBpbnQgYXBwbHlfbWljcm9jb2RlKGNvbnN0IHN0cnVjdCBtaWNyb2NvZGVfcGF0Y2ggCj4+PiAq
cGF0Y2gpCj4+Pj4gPj4gIAo+Pj4+ID4+ICAgICAgbWNfaW50ZWwgPSBwYXRjaC0+bWNfaW50ZWw7
Cj4+Pj4gPj4gIAo+Pj4+ID4+IC0gICAgLyogc2VyaWFsaXplIGFjY2VzcyB0byB0aGUgcGh5c2lj
YWwgd3JpdGUgdG8gTVNSIDB4NzkgKi8KPj4+PiA+PiAtICAgIHNwaW5fbG9ja19pcnFzYXZlKCZt
aWNyb2NvZGVfdXBkYXRlX2xvY2ssIGZsYWdzKTsKPj4+PiA+PiArICAgIEJVR19PTihsb2NhbF9p
cnFfaXNfZW5hYmxlZCgpKTsKPj4+PiA+PiAgCj4+Pj4gPj4gICAgICAvKgo+Pj4+ID4+ICAgICAg
ICogV3JpdGViYWNrIGFuZCBpbnZhbGlkYXRlIGNhY2hlcyBiZWZvcmUgdXBkYXRpbmcgbWljcm9j
b2RlIHRvIGF2b2lkCj4+Pj4gPgo+Pj4+ID5UaGlua2luZyBhYm91dCBpdCAtIHdoYXQgaGFwcGVu
cyBpZiB3ZSBoaXQgYW4gTk1JIG9yICNNQyBoZXJlPwo+Pj4+ID53YXRjaGRvZ19kaXNhYmxlKCks
IGEgY2FsbCB0byB3aGljaCB5b3UgYWRkIGluIGFuIGVhcmxpZXIgcGF0Y2gsCj4+Pj4gPmRvZXNu
J3QgcmVhbGx5IHN1cHByZXNzIHRoZSBnZW5lcmF0aW9uIG9mIE5NSXMsIGl0IG9ubHkgdGVsbHMg
dGhlCj4+Pj4gPmhhbmRsZXIgbm90IHRvIGxvb2sgYXQgdGhlIGFjY3VtdWxhdGVkIHN0YXRpc3Rp
Y3MuCj4+Pj4gCj4+Pj4gSSB0aGluayB0aGV5IHNob3VsZCBiZSBzdXBwcmVzc2VkLiBBc2hvaywg
Y291bGQgeW91IGNvbmZpcm0gaXQ/Cj4+PiAKPj4+IEkgdGhpbmsgdGhlIG9ubHkgc291cmNlcyB3
b3VsZCBiZSB0aGUgd2F0Y2hkb2cgYXMgeW91IHBvaW50ZWQgb3V0Cj4+PiB3aGljaCB3ZSBhbHJl
YWR5IHRvdWNoIHRvIGtlZXAgaXQgZnJvbSBleHBpcmluZy4gVGhlIHBlcmYgY291bnRlcnMKPj4+
IGknbSBub3QgYW4gZXhwZXJ0IGluLCBidXQgaSdsbCBjaGVjay4gV2hlbiB3ZSBhcmUgaW4gc3Rv
cF9tYWNoaW5lKCkgdHlwZQo+Pj4gZmxvdywgaXRzIG5vdCBjbGVhciBpZiBhbnkgb2YgdGhvc2Ug
d291bGQgZmlyZS4gKEkgbWlnaHQgYmUgd3JvbmcsIGJ1dCBsZXQKPj4+IG1lIGNoZWNrKS4KPj4K
Pj5XZWxsLCB3aXRob3V0IGRpc2FybWluZyB0aGUgd2F0Y2hkb2cgTk1JIGF0IHRoZSBMQVBJQyAv
IElPLUFQSUMsCj4+aG93IHdvdWxkIGl0IF9ub3RfIHBvdGVudGlhbGx5IGZpcmU/Cj4gCj4gV2Ug
cGxhbiBub3QgdG8gcHJldmVudCBOTUkgYmVpbmcgZmlyZWQuIEluc3RlYWQsIGlmIG9uZSB0aHJl
YWQgb2YgYSBjb3JlCj4gaXMgdXBkYXRpbmcgbWljcm9jb2RlLCBvdGhlciB0aHJlYWRzIG9mIHRo
aXMgY29yZSB3b3VsZCBzdG9wIGluIHRoZQo+IGhhbmRsZXIgb2YgTk1JIHVudGlsIHRoZSB1cGRh
dGUgY29tcGxldGlvbi4gSXMgdGhpcyBhcHByb2FjaCBhY2NlcHRhYmxlPwoKV2VsbCwgSSBoYXZl
IHRvIHJldHVybiB0aGUgcXVlc3Rpb246IEl0IGlzIHlvdSB3aG8ga25vd3Mgd2hhdCBpcyBvcgpp
cyBub3QgYWNjZXB0YWJsZSB3aGlsZSBhbiB1Y29kZSB1cGRhdGUgaXMgaW4gcHJvZ3Jlc3MuIElu
IHBhcnRpY3VsYXIKaXQgb2J2aW91c2x5IG1hdHRlcnMgaG93IG11Y2ggdWNvZGUgaXMgaW52b2x2
ZWQgaW4gdGhlIGRlbGl2ZXJ5IG9mCmFuIE5NSSAoYW5kIGluIGFsbG93aW5nIHRoZSBoYW5kbGVy
IHRvIGdldCB0byB0aGUgcG9pbnQgd2hlcmUgeW91J2QKInN0b3AiIGl0KS4KCklmIHRoZSBhcHBy
b2FjaCB5b3Ugc3VnZ2VzdCBpcyBmaW5lIGZvciB0aGUgTk1JIGNhc2UsIEknZCB0aGVuIHdvbmRl
cgppZiBpdCBjb3VsZG4ndCBhbHNvIGJlIHVzZWQgZm9yIHRoZSAjTUMgb25lLgoKSmFuCgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
