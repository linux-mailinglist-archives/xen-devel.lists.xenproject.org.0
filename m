Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63391A2FFD
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2019 08:32:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i3aR9-0004i9-QB; Fri, 30 Aug 2019 06:31:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=D47i=W2=intel.com=chao.gao@srs-us1.protection.inumbo.net>)
 id 1i3aR7-0004i1-Tz
 for xen-devel@lists.xenproject.org; Fri, 30 Aug 2019 06:31:05 +0000
X-Inumbo-ID: bdb72466-caef-11e9-8980-bc764e2007e4
Received: from mga03.intel.com (unknown [134.134.136.65])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bdb72466-caef-11e9-8980-bc764e2007e4;
 Fri, 30 Aug 2019 06:31:04 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Aug 2019 23:31:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,446,1559545200"; d="scan'208";a="265226297"
Received: from gao-cwp.sh.intel.com (HELO gao-cwp) ([10.239.159.26])
 by orsmga001.jf.intel.com with ESMTP; 29 Aug 2019 23:31:01 -0700
Date: Fri, 30 Aug 2019 14:35:06 +0800
From: Chao Gao <chao.gao@intel.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20190830063506.GD31905@gao-cwp>
References: <1566177928-19114-1-git-send-email-chao.gao@intel.com>
 <1566177928-19114-16-git-send-email-chao.gao@intel.com>
 <3b455c41-b5a3-2533-99a8-2200def4b19f@citrix.com>
 <20190826080759.GB11910@gao-cwp> <20190827045159.GA28509@gao-cwp>
 <d95a5b28-04c6-dcc6-8b16-fc4ade330c15@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d95a5b28-04c6-dcc6-8b16-fc4ade330c15@suse.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [Xen-devel] [PATCH v9 15/15] microcode: block #NMI handling
 when loading an ucode
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
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org,
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBBdWcgMjksIDIwMTkgYXQgMDI6MTE6MTBQTSArMDIwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj5PbiAyNy4wOC4yMDE5IDA2OjUyLCBDaGFvIEdhbyB3cm90ZToKPj4gT24gTW9uLCBBdWcg
MjYsIDIwMTkgYXQgMDQ6MDc6NTlQTSArMDgwMCwgQ2hhbyBHYW8gd3JvdGU6Cj4+PiBPbiBGcmks
IEF1ZyAyMywgMjAxOSBhdCAwOTo0NjozN0FNICswMTAwLCBTZXJnZXkgRHlhc2xpIHdyb3RlOgo+
Pj4+IE9uIDE5LzA4LzIwMTkgMDI6MjUsIENoYW8gR2FvIHdyb3RlOgo+Pj4+PiByZWdpc3RlciBh
biBubWkgY2FsbGJhY2suIEFuZCB0aGlzIGNhbGxiYWNrIGRvZXMgYnVzeS1sb29wIG9uIHRocmVh
ZHMKPj4+Pj4gd2hpY2ggYXJlIHdhaXRpbmcgZm9yIGxvYWRpbmcgY29tcGxldGlvbi4gQ29udHJv
bCB0aHJlYWRzIHNlbmQgTk1JIHRvCj4+Pj4+IHNsYXZlIHRocmVhZHMgdG8gcHJldmVudCBOTUkg
YWNjZXB0YW5jZSBkdXJpbmcgdWNvZGUgbG9hZGluZy4KPj4+Pj4KPj4+Pj4gU2lnbmVkLW9mZi1i
eTogQ2hhbyBHYW8gPGNoYW8uZ2FvQGludGVsLmNvbT4KPj4+Pj4gLS0tCj4+Pj4+IENoYW5nZXMg
aW4gdjk6Cj4+Pj4+ICAtIGNvbnRyb2wgdGhyZWFkcyBzZW5kIE5NSSB0byBhbGwgb3RoZXIgdGhy
ZWFkcy4gU2xhdmUgdGhyZWFkcyB3aWxsCj4+Pj4+ICBzdGF5IGluIHRoZSBOTUkgaGFuZGxpbmcg
dG8gcHJldmVudCBOTUkgYWNjZXB0YW5jZSBkdXJpbmcgdWNvZGUKPj4+Pj4gIGxvYWRpbmcuIE5v
dGUgdGhhdCBzZWxmLW5taSBpcyBpbnZhbGlkIGFjY29yZGluZyB0byBTRE0uCj4+Pj4KPj4+PiBU
byBtZSB0aGlzIGxvb2tzIGxpa2UgYSBoYWxmLW1lYXN1cmU6IHdoeSBrZWVwIG9ubHkgc2xhdmUg
dGhyZWFkcyBpbgo+Pj4+IHRoZSBOTUkgaGFuZGxlciwgd2hlbiBtYXN0ZXIgdGhyZWFkcyBjYW4g
dXBkYXRlIHRoZSBtaWNyb2NvZGUgZnJvbQo+Pj4+IGluc2lkZSB0aGUgTk1JIGhhbmRsZXIgYXMg
d2VsbD8KPj4+Cj4+PiBObyBzcGVjaWFsIHJlYXNvbi4gQmVjYXVzZSB0aGUgaXNzdWUgd2Ugd2Fu
dCB0byBhZGRyZXNzIGlzIHRoYXQgc2xhdmUKPj4+IHRocmVhZHMgbWlnaHQgZ28gdG8gaGFuZGxl
IE5NSSBhbmQgYWNjZXNzIE1TUnMgd2hlbiBtYXN0ZXIgdGhyZWFkIGlzCj4+PiBsb2FkaW5nIHVj
b2RlLiBTbyB3ZSBvbmx5IGtlZXAgc2xhdmUgdGhyZWFkcyBpbiB0aGUgTk1JIGhhbmRsZXIuCj4+
Pgo+Pj4+Cj4+Pj4gWW91IG1lbnRpb24gdGhhdCBzZWxmLW5taSBpcyBpbnZhbGlkLCBidXQgWGVu
IGhhcyBzZWxmX25taSgpIHdoaWNoIGlzCj4+Pj4gdXNlZCBmb3IgYXBwbHlfYWx0ZXJuYXRpdmVz
KCkgZHVyaW5nIGJvb3QsIHNvIGNhbiBiZSB0cnVzdGVkIHRvIHdvcmsuCj4+Pgo+Pj4gU29ycnks
IEkgbWVhbnQgdXNpbmcgc2VsZiBzaG9ydGhhbmQgdG8gc2VuZCBzZWxmLW5taS4gSSB0cmllZCB0
byB1c2UKPj4+IHNlbGYgc2hvcnRoYW5kIGJ1dCBnb3QgQVBJQyBlcnJvci4gQW5kIEkgYWdyZWUg
dGhhdCBpdCBpcyBiZXR0ZXIgdG8KPj4+IG1ha2Ugc2xhdmUgdGhyZWFkIGNhbGwgc2VsZl9ubWko
KSBpdHNlbGYuCj4+Pgo+Pj4+Cj4+Pj4gSSBleHBlcmltZW50ZWQgYSBiaXQgd2l0aCB0aGUgZm9s
bG93aW5nIGFwcHJvYWNoOiBhZnRlciBsb2FkaW5nX3N0YXRlCj4+Pj4gYmVjb21lcyBMT0FESU5H
X0NBTExJTiwgZWFjaCBjcHUgaXNzdWVzIGEgc2VsZl9ubWkoKSBhbmQgcmVuZGV6dm91cwo+Pj4+
IHZpYSBjcHVfY2FsbGluX21hcCBpbnRvIExPQURJTkdfRU5URVIgdG8gZG8gYSB1Y29kZSB1cGRh
dGUgZGlyZWN0bHkgaW4KPj4+PiB0aGUgTk1JIGhhbmRsZXIuIEFuZCBpdCBzZWVtcyB0byB3b3Jr
Lgo+Pj4+Cj4+Pj4gU2VwYXJhdGUgcXVlc3Rpb24gaXMgYWJvdXQgdGhlIHNhZmV0eSBvZiB0aGlz
IGFwcHJvYWNoOiBjYW4gd2UgYmUgc3VyZQo+Pj4+IHRoYXQgYSB1Y29kZSB1cGRhdGUgd291bGQg
bm90IHJlc2V0IHRoZSBzdGF0dXMgb2YgdGhlIE5NSSBsYXRjaD8gSS5lLgo+Pj4+IGNhbiBpdCBj
YXVzZSBhbm90aGVyIE5NSSB0byBiZSBkZWxpdmVyZWQgd2hpbGUgWGVuIGFscmVhZHkgaGFuZGxl
cyBvbmU/Cj4+Pgo+Pj4gQXNob2ssIHdoYXQncyB5b3VyIG9waW5pb24gb24gU2VyZ2V5J3MgYXBw
cm9hY2ggYW5kIGhpcyBjb25jZXJuPwo+PiAKPj4gSSB0YWxrZWQgd2l0aCBBc2hvay4gV2UgdGhp
bmsgeW91ciBhcHByb2FjaCBpcyBiZXR0ZXIuIEkgd2lsbCBmb2xsb3cKPj4geW91ciBhcHByb2Fj
aCBpbiB2MTAuIEl0IHdvdWxkIGJlIG11Y2ggaGVscGZ1bCBpZiB5b3UgcG9zdCB5b3VyIHBhdGNo
Cj4+IHNvIHRoYXQgSSBjYW4ganVzdCByZWJhc2UgaXQgb250byBvdGhlciBwYXRjaGVzLgo+Cj5E
b2luZyB0aGUgYWN0dWFsIHVjb2RlIHVwZGF0ZSBpbnNpZGUgYW4gTk1JIGhhbmRsZXIgc2VlbXMg
cmF0aGVyIHJpc2t5Cj50byBtZS4gRXZlbiBpZiBBc2hvayBjb25maXJtZWQgaXQgd291bGQgbm90
IGJlIGFuIGlzc3VlIG9uIHBhc3QgYW5kCj5jdXJyZW50IEludGVsIENQVXMgLSB3aGF0IGFib3V0
IGZ1dHVyZSBvbmVzLCBvciBvbmVzIGZyb20gb3RoZXIgdmVuZG9ycz8KCldpbGwgY29uZmlybSB0
aGVzZSB3aXRoIEFzaG9rLgoKVGhhbmtzCkNoYW8KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
