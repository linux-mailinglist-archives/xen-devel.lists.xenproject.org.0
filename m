Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1341743767
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jun 2019 16:56:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hbR7K-0001cK-Hy; Thu, 13 Jun 2019 14:54:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2com=UM=intel.com=chao.gao@srs-us1.protection.inumbo.net>)
 id 1hbR7J-0001cF-Dz
 for xen-devel@lists.xenproject.org; Thu, 13 Jun 2019 14:54:17 +0000
X-Inumbo-ID: 1c36b43a-8deb-11e9-94ab-0b810ce990ac
Received: from mga11.intel.com (unknown [192.55.52.93])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1c36b43a-8deb-11e9-94ab-0b810ce990ac;
 Thu, 13 Jun 2019 14:54:14 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Jun 2019 07:54:12 -0700
X-ExtLoop1: 1
Received: from gao-cwp.sh.intel.com (HELO gao-cwp) ([10.239.159.26])
 by orsmga005.jf.intel.com with ESMTP; 13 Jun 2019 07:54:10 -0700
Date: Thu, 13 Jun 2019 22:58:23 +0800
From: Chao Gao <chao.gao@intel.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20190613145822.GA5933@gao-cwp>
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
User-Agent: Mutt/1.5.21 (2010-09-15)
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

T24gVGh1LCBKdW4gMTMsIDIwMTkgYXQgMDg6MDg6NDZBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4+Pj4gT24gMTMuMDYuMTkgYXQgMTY6MDUsIDxjaGFvLmdhb0BpbnRlbC5jb20+IHdyb3Rl
Ogo+PiBPbiBXZWQsIEp1biAxMiwgMjAxOSBhdCAwMTozODozMUFNIC0wNjAwLCBKYW4gQmV1bGlj
aCB3cm90ZToKPj4+Pj4+IE9uIDExLjA2LjE5IGF0IDE4OjA0LCA8YXNob2sucmFqQGludGVsLmNv
bT4gd3JvdGU6Cj4+Pj4gT24gVHVlLCBKdW4gMTEsIDIwMTkgYXQgMDg6NDY6MDRQTSArMDgwMCwg
Q2hhbyBHYW8gd3JvdGU6Cj4+Pj4+IE9uIFdlZCwgSnVuIDA1LCAyMDE5IGF0IDA4OjUzOjQ2QU0g
LTA2MDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiA+Cj4+Pj4+ID4+IEBAIC0zMDcsOCArMzAz
LDcgQEAgc3RhdGljIGludCBhcHBseV9taWNyb2NvZGUoY29uc3Qgc3RydWN0IG1pY3JvY29kZV9w
YXRjaCAKPj4+PiAqcGF0Y2gpCj4+Pj4+ID4+ICAKPj4+Pj4gPj4gICAgICBtY19pbnRlbCA9IHBh
dGNoLT5tY19pbnRlbDsKPj4+Pj4gPj4gIAo+Pj4+PiA+PiAtICAgIC8qIHNlcmlhbGl6ZSBhY2Nl
c3MgdG8gdGhlIHBoeXNpY2FsIHdyaXRlIHRvIE1TUiAweDc5ICovCj4+Pj4+ID4+IC0gICAgc3Bp
bl9sb2NrX2lycXNhdmUoJm1pY3JvY29kZV91cGRhdGVfbG9jaywgZmxhZ3MpOwo+Pj4+PiA+PiAr
ICAgIEJVR19PTihsb2NhbF9pcnFfaXNfZW5hYmxlZCgpKTsKPj4+Pj4gPj4gIAo+Pj4+PiA+PiAg
ICAgIC8qCj4+Pj4+ID4+ICAgICAgICogV3JpdGViYWNrIGFuZCBpbnZhbGlkYXRlIGNhY2hlcyBi
ZWZvcmUgdXBkYXRpbmcgbWljcm9jb2RlIHRvIGF2b2lkCj4+Pj4+ID4KPj4+Pj4gPlRoaW5raW5n
IGFib3V0IGl0IC0gd2hhdCBoYXBwZW5zIGlmIHdlIGhpdCBhbiBOTUkgb3IgI01DIGhlcmU/Cj4+
Pj4+ID53YXRjaGRvZ19kaXNhYmxlKCksIGEgY2FsbCB0byB3aGljaCB5b3UgYWRkIGluIGFuIGVh
cmxpZXIgcGF0Y2gsCj4+Pj4+ID5kb2Vzbid0IHJlYWxseSBzdXBwcmVzcyB0aGUgZ2VuZXJhdGlv
biBvZiBOTUlzLCBpdCBvbmx5IHRlbGxzIHRoZQo+Pj4+PiA+aGFuZGxlciBub3QgdG8gbG9vayBh
dCB0aGUgYWNjdW11bGF0ZWQgc3RhdGlzdGljcy4KPj4+Pj4gCj4+Pj4+IEkgdGhpbmsgdGhleSBz
aG91bGQgYmUgc3VwcHJlc3NlZC4gQXNob2ssIGNvdWxkIHlvdSBjb25maXJtIGl0Pwo+Pj4+IAo+
Pj4+IEkgdGhpbmsgdGhlIG9ubHkgc291cmNlcyB3b3VsZCBiZSB0aGUgd2F0Y2hkb2cgYXMgeW91
IHBvaW50ZWQgb3V0Cj4+Pj4gd2hpY2ggd2UgYWxyZWFkeSB0b3VjaCB0byBrZWVwIGl0IGZyb20g
ZXhwaXJpbmcuIFRoZSBwZXJmIGNvdW50ZXJzCj4+Pj4gaSdtIG5vdCBhbiBleHBlcnQgaW4sIGJ1
dCBpJ2xsIGNoZWNrLiBXaGVuIHdlIGFyZSBpbiBzdG9wX21hY2hpbmUoKSB0eXBlCj4+Pj4gZmxv
dywgaXRzIG5vdCBjbGVhciBpZiBhbnkgb2YgdGhvc2Ugd291bGQgZmlyZS4gKEkgbWlnaHQgYmUg
d3JvbmcsIGJ1dCBsZXQKPj4+PiBtZSBjaGVjaykuCj4+Pgo+Pj5XZWxsLCB3aXRob3V0IGRpc2Fy
bWluZyB0aGUgd2F0Y2hkb2cgTk1JIGF0IHRoZSBMQVBJQyAvIElPLUFQSUMsCj4+PmhvdyB3b3Vs
ZCBpdCBfbm90XyBwb3RlbnRpYWxseSBmaXJlPwo+PiAKPj4gV2UgcGxhbiBub3QgdG8gcHJldmVu
dCBOTUkgYmVpbmcgZmlyZWQuIEluc3RlYWQsIGlmIG9uZSB0aHJlYWQgb2YgYSBjb3JlCj4+IGlz
IHVwZGF0aW5nIG1pY3JvY29kZSwgb3RoZXIgdGhyZWFkcyBvZiB0aGlzIGNvcmUgd291bGQgc3Rv
cCBpbiB0aGUKPj4gaGFuZGxlciBvZiBOTUkgdW50aWwgdGhlIHVwZGF0ZSBjb21wbGV0aW9uLiBJ
cyB0aGlzIGFwcHJvYWNoIGFjY2VwdGFibGU/Cj4KPldlbGwsIEkgaGF2ZSB0byByZXR1cm4gdGhl
IHF1ZXN0aW9uOiBJdCBpcyB5b3Ugd2hvIGtub3dzIHdoYXQgaXMgb3IKPmlzIG5vdCBhY2NlcHRh
YmxlIHdoaWxlIGFuIHVjb2RlIHVwZGF0ZSBpcyBpbiBwcm9ncmVzcy4gSW4gcGFydGljdWxhcgo+
aXQgb2J2aW91c2x5IG1hdHRlcnMgaG93IG11Y2ggdWNvZGUgaXMgaW52b2x2ZWQgaW4gdGhlIGRl
bGl2ZXJ5IG9mCj5hbiBOTUkgKGFuZCBpbiBhbGxvd2luZyB0aGUgaGFuZGxlciB0byBnZXQgdG8g
dGhlIHBvaW50IHdoZXJlIHlvdSdkCj4ic3RvcCIgaXQpLgo+Cj5JZiB0aGUgYXBwcm9hY2ggeW91
IHN1Z2dlc3QgaXMgZmluZSBmb3IgdGhlIE5NSSBjYXNlLAoKWWVzLiBJdCBpcyBmaW5lLiBJdCBp
cyBhIHN1Z2dlc3Rpb24gZnJvbSBBc2hvayBhbmQgd2hhdCBoZSBpcyB3b3JraW5nCm9uIGluIGxp
bnV4IGtlcm5lbC4gSSBqdXN0IHdhbnRlZCB0byBtYWtlIHN1cmUgeW91IGRpZG4ndCBvcHBvc2Ug
dGhpcwphcHByb2FjaCBpbiBYZW4gKGNvbnNpZGVyaW5nIGRpc2FybWluZyB3YXRjaGRvZyBOTUkg
bWlnaHQgYmUgYW4KYWx0ZXJuYXRpdmUpLgoKPkknZCB0aGVuIHdvbmRlciBpZiBpdCBjb3VsZG4n
dCBhbHNvIGJlIHVzZWQgZm9yIHRoZSAjTUMgb25lLgoKSSB0aGluayBubyBtdWNoIHByYXRpY2Fs
IHZhbHVlIGZvciAjTUMgYmVjYXVzZSB3ZSBzdGlsbCBuZWVkIHRvIHdhaXQgZm9yCnRoZSBjYWxs
aW4gb2YgYWxsIHRocmVhZHMuIEJ1dCBhcyB5b3UgYW5kIEFzaG9rIHNhaWQsICNNQyBpcyB1c3Vh
bGx5CmZhdGFsIGFuZCBtYWNoaW5lIGdvZXMgZG93biBhbnl3YXkuCgpUaGFua3MKQ2hhbwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
