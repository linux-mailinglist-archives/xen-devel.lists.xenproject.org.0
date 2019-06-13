Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8579449F0
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jun 2019 19:51:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hbToh-0007E3-BS; Thu, 13 Jun 2019 17:47:15 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hZFu=UM=intel.com=ashok.raj@srs-us1.protection.inumbo.net>)
 id 1hbTog-0007Dy-45
 for xen-devel@lists.xenproject.org; Thu, 13 Jun 2019 17:47:14 +0000
X-Inumbo-ID: 45adf3c8-8e03-11e9-8980-bc764e045a96
Received: from mga09.intel.com (unknown [134.134.136.24])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 45adf3c8-8e03-11e9-8980-bc764e045a96;
 Thu, 13 Jun 2019 17:47:12 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Jun 2019 10:47:10 -0700
X-ExtLoop1: 1
Received: from cajacob2-mobl.amr.corp.intel.com (HELO araj-mobl1.jf.intel.com)
 ([10.254.186.83])
 by FMSMGA003.fm.intel.com with ESMTP; 13 Jun 2019 10:47:09 -0700
Date: Thu, 13 Jun 2019 10:47:09 -0700
From: "Raj, Ashok" <ashok.raj@intel.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20190613174708.GA30122@araj-mobl1.jf.intel.com>
References: <1558945891-3015-1-git-send-email-chao.gao@intel.com>
 <1558945891-3015-10-git-send-email-chao.gao@intel.com>
 <5CF7D77A020000780023598C@prv1-mh.provo.novell.com>
 <20190611124604.GB22930@gao-cwp> <20190611160416.GB44426@otc-nc-03>
 <5D00ABF70200007800237502@prv1-mh.provo.novell.com>
 <20190613140524.GA2355@gao-cwp>
 <5D0258EE0200007800237EEB@prv1-mh.provo.novell.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5D0258EE0200007800237EEB@prv1-mh.provo.novell.com>
User-Agent: Mutt/1.9.1 (2017-09-22)
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
 xen-devel <xen-devel@lists.xenproject.org>, Chao Gao <chao.gao@intel.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBKdW4gMTMsIDIwMTkgYXQgMDg6MDg6NDZBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDEzLjA2LjE5IGF0IDE2OjA1LCA8Y2hhby5nYW9AaW50ZWwuY29tPiB3cm90
ZToKPiA+IE9uIFdlZCwgSnVuIDEyLCAyMDE5IGF0IDAxOjM4OjMxQU0gLTA2MDAsIEphbiBCZXVs
aWNoIHdyb3RlOgo+ID4+Pj4+IE9uIDExLjA2LjE5IGF0IDE4OjA0LCA8YXNob2sucmFqQGludGVs
LmNvbT4gd3JvdGU6Cj4gPj4+IE9uIFR1ZSwgSnVuIDExLCAyMDE5IGF0IDA4OjQ2OjA0UE0gKzA4
MDAsIENoYW8gR2FvIHdyb3RlOgo+ID4+Pj4gT24gV2VkLCBKdW4gMDUsIDIwMTkgYXQgMDg6NTM6
NDZBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gPj4+PiA+Cj4gPj4+PiA+PiBAQCAtMzA3
LDggKzMwMyw3IEBAIHN0YXRpYyBpbnQgYXBwbHlfbWljcm9jb2RlKGNvbnN0IHN0cnVjdCBtaWNy
b2NvZGVfcGF0Y2ggCj4gPj4+ICpwYXRjaCkKPiA+Pj4+ID4+ICAKPiA+Pj4+ID4+ICAgICAgbWNf
aW50ZWwgPSBwYXRjaC0+bWNfaW50ZWw7Cj4gPj4+PiA+PiAgCj4gPj4+PiA+PiAtICAgIC8qIHNl
cmlhbGl6ZSBhY2Nlc3MgdG8gdGhlIHBoeXNpY2FsIHdyaXRlIHRvIE1TUiAweDc5ICovCj4gPj4+
PiA+PiAtICAgIHNwaW5fbG9ja19pcnFzYXZlKCZtaWNyb2NvZGVfdXBkYXRlX2xvY2ssIGZsYWdz
KTsKPiA+Pj4+ID4+ICsgICAgQlVHX09OKGxvY2FsX2lycV9pc19lbmFibGVkKCkpOwo+ID4+Pj4g
Pj4gIAo+ID4+Pj4gPj4gICAgICAvKgo+ID4+Pj4gPj4gICAgICAgKiBXcml0ZWJhY2sgYW5kIGlu
dmFsaWRhdGUgY2FjaGVzIGJlZm9yZSB1cGRhdGluZyBtaWNyb2NvZGUgdG8gYXZvaWQKPiA+Pj4+
ID4KPiA+Pj4+ID5UaGlua2luZyBhYm91dCBpdCAtIHdoYXQgaGFwcGVucyBpZiB3ZSBoaXQgYW4g
Tk1JIG9yICNNQyBoZXJlPwo+ID4+Pj4gPndhdGNoZG9nX2Rpc2FibGUoKSwgYSBjYWxsIHRvIHdo
aWNoIHlvdSBhZGQgaW4gYW4gZWFybGllciBwYXRjaCwKPiA+Pj4+ID5kb2Vzbid0IHJlYWxseSBz
dXBwcmVzcyB0aGUgZ2VuZXJhdGlvbiBvZiBOTUlzLCBpdCBvbmx5IHRlbGxzIHRoZQo+ID4+Pj4g
PmhhbmRsZXIgbm90IHRvIGxvb2sgYXQgdGhlIGFjY3VtdWxhdGVkIHN0YXRpc3RpY3MuCj4gPj4+
PiAKPiA+Pj4+IEkgdGhpbmsgdGhleSBzaG91bGQgYmUgc3VwcHJlc3NlZC4gQXNob2ssIGNvdWxk
IHlvdSBjb25maXJtIGl0Pwo+ID4+PiAKPiA+Pj4gSSB0aGluayB0aGUgb25seSBzb3VyY2VzIHdv
dWxkIGJlIHRoZSB3YXRjaGRvZyBhcyB5b3UgcG9pbnRlZCBvdXQKPiA+Pj4gd2hpY2ggd2UgYWxy
ZWFkeSB0b3VjaCB0byBrZWVwIGl0IGZyb20gZXhwaXJpbmcuIFRoZSBwZXJmIGNvdW50ZXJzCj4g
Pj4+IGknbSBub3QgYW4gZXhwZXJ0IGluLCBidXQgaSdsbCBjaGVjay4gV2hlbiB3ZSBhcmUgaW4g
c3RvcF9tYWNoaW5lKCkgdHlwZQo+ID4+PiBmbG93LCBpdHMgbm90IGNsZWFyIGlmIGFueSBvZiB0
aG9zZSB3b3VsZCBmaXJlLiAoSSBtaWdodCBiZSB3cm9uZywgYnV0IGxldAo+ID4+PiBtZSBjaGVj
aykuCj4gPj4KPiA+PldlbGwsIHdpdGhvdXQgZGlzYXJtaW5nIHRoZSB3YXRjaGRvZyBOTUkgYXQg
dGhlIExBUElDIC8gSU8tQVBJQywKPiA+PmhvdyB3b3VsZCBpdCBfbm90XyBwb3RlbnRpYWxseSBm
aXJlPwo+ID4gCj4gPiBXZSBwbGFuIG5vdCB0byBwcmV2ZW50IE5NSSBiZWluZyBmaXJlZC4gSW5z
dGVhZCwgaWYgb25lIHRocmVhZCBvZiBhIGNvcmUKPiA+IGlzIHVwZGF0aW5nIG1pY3JvY29kZSwg
b3RoZXIgdGhyZWFkcyBvZiB0aGlzIGNvcmUgd291bGQgc3RvcCBpbiB0aGUKPiA+IGhhbmRsZXIg
b2YgTk1JIHVudGlsIHRoZSB1cGRhdGUgY29tcGxldGlvbi4gSXMgdGhpcyBhcHByb2FjaCBhY2Nl
cHRhYmxlPwo+IAo+IFdlbGwsIEkgaGF2ZSB0byByZXR1cm4gdGhlIHF1ZXN0aW9uOiBJdCBpcyB5
b3Ugd2hvIGtub3dzIHdoYXQgaXMgb3IKPiBpcyBub3QgYWNjZXB0YWJsZSB3aGlsZSBhbiB1Y29k
ZSB1cGRhdGUgaXMgaW4gcHJvZ3Jlc3MuIEluIHBhcnRpY3VsYXIKPiBpdCBvYnZpb3VzbHkgbWF0
dGVycyBob3cgbXVjaCB1Y29kZSBpcyBpbnZvbHZlZCBpbiB0aGUgZGVsaXZlcnkgb2YKPiBhbiBO
TUkgKGFuZCBpbiBhbGxvd2luZyB0aGUgaGFuZGxlciB0byBnZXQgdG8gdGhlIHBvaW50IHdoZXJl
IHlvdSdkCj4gInN0b3AiIGl0KS4KPiAKPiBJZiB0aGUgYXBwcm9hY2ggeW91IHN1Z2dlc3QgaXMg
ZmluZSBmb3IgdGhlIE5NSSBjYXNlLCBJJ2QgdGhlbiB3b25kZXIKPiBpZiBpdCBjb3VsZG4ndCBh
bHNvIGJlIHVzZWQgZm9yIHRoZSAjTUMgb25lLgoKQXJjaGl0ZWN0dXJhbGx5IG9ubHkgb25lICNN
QyBjYW4gYmUgYWN0aXZlIGluIHRoZSBzeXN0ZW0uIElmIGEgbmV3ICNNQyAKY29uZGl0aW9uIGhh
cHBlbnMgd2hlbiBNQ0dfU1RBVFVTLk1DSVAgaXMgYWxyZWFkeSBzZXQsIHRoYXQgd291bGQgY2F1
c2Ugc3BvbnRhbmVvdXMgCnNodXRkb3duLgoKSWYgYW5vdGhlciBOTUkgYXJyaXZlcyBvbiB0aGUg
Q1BVIGRvaW5nIHRoZSB3cm1zciwgaXQgd2lsbCBiZSBwZW5kZWQKaW4gdGhlIGxhcGljIGFuZCBk
ZWxpdmVyZWQgYWZ0ZXIgdGhlIHdybXNyIHJldHVybnMuIHdybXNyIGZsb3cKY2FuJ3QgYmUgaW50
ZXJydXB0ZWQuIAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
