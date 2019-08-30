Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A729A2FFC
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2019 08:32:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i3aPY-00042D-E2; Fri, 30 Aug 2019 06:29:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=D47i=W2=intel.com=chao.gao@srs-us1.protection.inumbo.net>)
 id 1i3aPX-000428-3V
 for xen-devel@lists.xenproject.org; Fri, 30 Aug 2019 06:29:27 +0000
X-Inumbo-ID: 824521a8-caef-11e9-951b-bc764e2007e4
Received: from mga02.intel.com (unknown [134.134.136.20])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 824521a8-caef-11e9-951b-bc764e2007e4;
 Fri, 30 Aug 2019 06:29:24 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Aug 2019 23:29:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,446,1559545200"; d="scan'208";a="205994649"
Received: from gao-cwp.sh.intel.com (HELO gao-cwp) ([10.239.159.26])
 by fmsmga004.fm.intel.com with ESMTP; 29 Aug 2019 23:29:22 -0700
Date: Fri, 30 Aug 2019 14:33:27 +0800
From: Chao Gao <chao.gao@intel.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20190830063326.GC31905@gao-cwp>
References: <1566177928-19114-1-git-send-email-chao.gao@intel.com>
 <1566177928-19114-16-git-send-email-chao.gao@intel.com>
 <e5eae8a9-1348-45a3-6f2b-b3bf75077312@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e5eae8a9-1348-45a3-6f2b-b3bf75077312@suse.com>
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
Cc: xen-devel@lists.xenproject.org,
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
 Ashok Raj <ashok.raj@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBBdWcgMjksIDIwMTkgYXQgMDI6MjI6NDdQTSArMDIwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj5PbiAxOS4wOC4yMDE5IDAzOjI1LCBDaGFvIEdhbyB3cm90ZToKPj4gQEAgLTQ4MSwxMiAr
NDc4LDI4IEBAIHN0YXRpYyBpbnQgZG9fbWljcm9jb2RlX3VwZGF0ZSh2b2lkICpwYXRjaCkKPj4g
ICAgICByZXR1cm4gcmV0Owo+PiAgfQo+PiAgCj4+ICtzdGF0aWMgaW50IG1pY3JvY29kZV9ubWlf
Y2FsbGJhY2soY29uc3Qgc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3MsIGludCBjcHUpCj4+ICt7
Cj4+ICsgICAgLyogVGhlIGZpcnN0IHRocmVhZCBvZiBhIGNvcmUgaXMgdG8gbG9hZCBhbiB1cGRh
dGUuIERvbid0IGJsb2NrIGl0LiAqLwo+PiArICAgIGlmICggY3B1ID09IGNwdW1hc2tfZmlyc3Qo
cGVyX2NwdShjcHVfc2libGluZ19tYXNrLCBjcHUpKSB8fAo+PiArICAgICAgICAgbG9hZGluZ19z
dGF0ZSAhPSBMT0FESU5HX0NBTExJTiApCj4+ICsgICAgICAgIHJldHVybiAwOwo+PiArCj4+ICsg
ICAgY3B1bWFza19zZXRfY3B1KGNwdSwgJmNwdV9jYWxsaW5fbWFwKTsKPj4gKwo+PiArICAgIHdo
aWxlICggbG9hZGluZ19zdGF0ZSAhPSBMT0FESU5HX0VYSVQgKQo+PiArICAgICAgICBjcHVfcmVs
YXgoKTsKPj4gKwo+PiArICAgIHJldHVybiAwOwo+PiArfQo+Cj5CeSByZXR1cm5pbmcgMCB5b3Ug
dGVsbCBkb19ubWkoKSB0byBjb250aW51ZSBwcm9jZXNzaW5nIHRoZSBOTUkuCj5TaW5jZSB5b3Ug
Y2FuJ3QgdGVsbCB3aGV0aGVyIGEgbm9uLUlQSSBOTUkgaGFzIHN1cmZhY2VkIGF0IGFib3V0Cj50
aGUgc2FtZSB0aW1lIHRoaXMgaXMgZ2VuZXJhbGx5IHRoZSByaWdodCB0aGluZyBpbW8sIGJ1dCBo
b3cgZG8KPnlvdSBwcmV2ZW50IHVua25vd25fbm1pX2Vycm9yKCkgZnJvbSBnZXR0aW5nIGVudGVy
ZWQgd2hlbiBkb19ubWkoKQo+ZW5kcyB1cCBzZXR0aW5nIGhhbmRsZV91bmtub3duIHRvIHRydWU/
IChUaGUgcXVlc3Rpb24gaXMgbW9zdGx5Cj5yaGV0b3JpY2FsLCBidXQgdGhlcmUncyBhIGRpc2Nv
bm5lY3QgYmV0d2VlbiBkb19ubWkoKSBjaGVja2luZwo+ImNwdSA9PSAwIiBhbmQgdGhlIGNvbnRy
b2wgdGhyZWFkIHJ1bm5pbmcgb24KPmNwdW1hc2tfZmlyc3QoJmNwdV9vbmxpbmVfbWFwKSwgaS5l
LiB5b3UgaW50cm9kdWNlIGEgd2VsbCBoaWRkZW4KPmRlcGVuZGVuY3kgb24gQ1BVIDAgbmV2ZXIg
Z29pbmcgb2ZmbGluZS4gSU9XIG15IHJlcXVlc3QgaXMgdG8gYXQKPmxlYXN0IG1ha2UgdGhpcyBs
ZXNzIHdlbGwgaGlkZGVuLCBzdWNoIHRoYXQgaXQgY2FuIGJlIG5vdGljZWQgaWYKPmFuZCB3aGVu
IHNvbWVvbmUgZW5kZWF2b3JzIHRvIHJlbW92ZSBzYWlkIGxpbWl0YXRpb24uKQoKU2VlbXMgdGhl
IGlzc3VlIGlzIHRoYXQgd2UgY291bGRuJ3Qgc2VuZCBJUEkgTk1JIHRvIEJTUCwgb3RoZXJ3aXNl
CnVua25vd25fbm1pX2Vycm9yKCkgd291bGQgYmUgdHJpZ2dlci4gQW5kIGxvYWRpbmcgdWNvZGUg
YWZ0ZXIKcmVuZGV6dm91c2luZyBhbGwgQ1BVcyBpbiBOTUkgaGFuZGxlciBleHBlY3RzIGFsbCBD
UFVzIHRvIHJlY2VpdmUgSVBJCk5NSS4gU28gdGhpcyBhcHByb2FjaCBhbHdheXMgaGFzIHN1Y2gg
aXNzdWUuCgpDb25zaWRlcmluZyBzZWxmX25taSBpcyBjYWxsZWQgYXQgYW5vdGhlciBwbGFjZSwg
Y291bGQgd2UgcHJvdmlkZSBhCndheSB0byB0ZW1wb3JhcmlseSBzdXBwcmVzcyBvciAoZm9yY2Up
IGlnbm9yZSB1bmtub3duIG5taSBlcnJvcj8KClRoYW5rcwpDaGFvCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
