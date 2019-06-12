Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C15BB41DEE
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jun 2019 09:40:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1haxqB-0002B6-5a; Wed, 12 Jun 2019 07:38:39 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=q2gY=UL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1haxq9-0002Ax-5g
 for xen-devel@lists.xenproject.org; Wed, 12 Jun 2019 07:38:37 +0000
X-Inumbo-ID: 159fdd8b-8ce5-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 159fdd8b-8ce5-11e9-8980-bc764e045a96;
 Wed, 12 Jun 2019 07:38:35 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Wed, 12 Jun 2019 01:38:34 -0600
Message-Id: <5D00ABF70200007800237502@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Wed, 12 Jun 2019 01:38:31 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Ashok Raj" <ashok.raj@intel.com>
References: <1558945891-3015-1-git-send-email-chao.gao@intel.com>
 <1558945891-3015-10-git-send-email-chao.gao@intel.com>
 <5CF7D77A020000780023598C@prv1-mh.provo.novell.com>
 <20190611124604.GB22930@gao-cwp> <20190611160416.GB44426@otc-nc-03>
In-Reply-To: <20190611160416.GB44426@otc-nc-03>
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
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, WeiLiu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>, Chao Gao <chao.gao@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDExLjA2LjE5IGF0IDE4OjA0LCA8YXNob2sucmFqQGludGVsLmNvbT4gd3JvdGU6Cj4g
T24gVHVlLCBKdW4gMTEsIDIwMTkgYXQgMDg6NDY6MDRQTSArMDgwMCwgQ2hhbyBHYW8gd3JvdGU6
Cj4+IE9uIFdlZCwgSnVuIDA1LCAyMDE5IGF0IDA4OjUzOjQ2QU0gLTA2MDAsIEphbiBCZXVsaWNo
IHdyb3RlOgo+PiA+Cj4+ID4+IEBAIC0zMDcsOCArMzAzLDcgQEAgc3RhdGljIGludCBhcHBseV9t
aWNyb2NvZGUoY29uc3Qgc3RydWN0IG1pY3JvY29kZV9wYXRjaCAKPiAqcGF0Y2gpCj4+ID4+ICAK
Pj4gPj4gICAgICBtY19pbnRlbCA9IHBhdGNoLT5tY19pbnRlbDsKPj4gPj4gIAo+PiA+PiAtICAg
IC8qIHNlcmlhbGl6ZSBhY2Nlc3MgdG8gdGhlIHBoeXNpY2FsIHdyaXRlIHRvIE1TUiAweDc5ICov
Cj4+ID4+IC0gICAgc3Bpbl9sb2NrX2lycXNhdmUoJm1pY3JvY29kZV91cGRhdGVfbG9jaywgZmxh
Z3MpOwo+PiA+PiArICAgIEJVR19PTihsb2NhbF9pcnFfaXNfZW5hYmxlZCgpKTsKPj4gPj4gIAo+
PiA+PiAgICAgIC8qCj4+ID4+ICAgICAgICogV3JpdGViYWNrIGFuZCBpbnZhbGlkYXRlIGNhY2hl
cyBiZWZvcmUgdXBkYXRpbmcgbWljcm9jb2RlIHRvIGF2b2lkCj4+ID4KPj4gPlRoaW5raW5nIGFi
b3V0IGl0IC0gd2hhdCBoYXBwZW5zIGlmIHdlIGhpdCBhbiBOTUkgb3IgI01DIGhlcmU/Cj4+ID53
YXRjaGRvZ19kaXNhYmxlKCksIGEgY2FsbCB0byB3aGljaCB5b3UgYWRkIGluIGFuIGVhcmxpZXIg
cGF0Y2gsCj4+ID5kb2Vzbid0IHJlYWxseSBzdXBwcmVzcyB0aGUgZ2VuZXJhdGlvbiBvZiBOTUlz
LCBpdCBvbmx5IHRlbGxzIHRoZQo+PiA+aGFuZGxlciBub3QgdG8gbG9vayBhdCB0aGUgYWNjdW11
bGF0ZWQgc3RhdGlzdGljcy4KPj4gCj4+IEkgdGhpbmsgdGhleSBzaG91bGQgYmUgc3VwcHJlc3Nl
ZC4gQXNob2ssIGNvdWxkIHlvdSBjb25maXJtIGl0Pwo+IAo+IEkgdGhpbmsgdGhlIG9ubHkgc291
cmNlcyB3b3VsZCBiZSB0aGUgd2F0Y2hkb2cgYXMgeW91IHBvaW50ZWQgb3V0Cj4gd2hpY2ggd2Ug
YWxyZWFkeSB0b3VjaCB0byBrZWVwIGl0IGZyb20gZXhwaXJpbmcuIFRoZSBwZXJmIGNvdW50ZXJz
Cj4gaSdtIG5vdCBhbiBleHBlcnQgaW4sIGJ1dCBpJ2xsIGNoZWNrLiBXaGVuIHdlIGFyZSBpbiBz
dG9wX21hY2hpbmUoKSB0eXBlCj4gZmxvdywgaXRzIG5vdCBjbGVhciBpZiBhbnkgb2YgdGhvc2Ug
d291bGQgZmlyZS4gKEkgbWlnaHQgYmUgd3JvbmcsIGJ1dCBsZXQKPiBtZSBjaGVjaykuCgpXZWxs
LCB3aXRob3V0IGRpc2FybWluZyB0aGUgd2F0Y2hkb2cgTk1JIGF0IHRoZSBMQVBJQyAvIElPLUFQ
SUMsCmhvdyB3b3VsZCBpdCBfbm90XyBwb3RlbnRpYWxseSBmaXJlPwoKPiAjTUMgc2hvdWxkbid0
IGZpcmUgb25jZSB5b3UgZW50ZXJlZCB0aGUgcmVuZGV6dm91cywgaWYgaXQgZG9lcyBpdHMgdXN1
YWxseQo+IGZhdGFsIGxpa2UgYSAzc3RyaWtlIG9yIHNvbWV0aGluZy4gTWFjaGluZSBpcyBnb2lu
ZyBkb3duIGF0IHRoYXQgdGltZQo+IHNvIG5vdGhpbmcgd2UgY291bGQgZG8gdG8gaGFuZGxlLgoK
UmlnaHQgLSBhcyBsb25nIGFzIHdlIGFzc3VtZSB0aGF0ICNNQyB3b3VsZCBiZSBmYXRhbCBhbnl3
YXksCnRoZXJlJ3Mgbm8gcG9pbnQgaW4gdGhpbmtpbmcgYWJvdXQgd2F5cyB0byBzdXBwcmVzcyBp
dC4gSSBndWVzcwppdCBpcyBmYXRhbCAoYWxtb3N0KSBhbHdheXMgcmlnaHQgbm93LCBidXQgSSBk
b24ndCB0aGluayBpdCBvdWdodCB0bwpiZS4gSXQncyBqdXN0IHRoYXQgbm8tb25lIGhhcyB0aGUg
dGltZSBhbmQgZW52aXJvbm1lbnQgdG8gbWFrZQppdCBhY3R1YWxseSBiZWhhdmUgYmV0dGVyLgoK
SmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
