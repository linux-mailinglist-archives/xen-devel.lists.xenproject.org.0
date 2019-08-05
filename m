Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC4D7812D3
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2019 09:13:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1huX8H-0008IW-9f; Mon, 05 Aug 2019 07:10:13 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5ABr=WB=intel.com=chao.gao@srs-us1.protection.inumbo.net>)
 id 1huX8F-0008IR-Ks
 for xen-devel@lists.xenproject.org; Mon, 05 Aug 2019 07:10:11 +0000
X-Inumbo-ID: 0f8f1ef2-b750-11e9-8980-bc764e045a96
Received: from mga06.intel.com (unknown [134.134.136.31])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 0f8f1ef2-b750-11e9-8980-bc764e045a96;
 Mon, 05 Aug 2019 07:10:10 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Aug 2019 23:58:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,349,1559545200"; d="scan'208";a="325230834"
Received: from gao-cwp.sh.intel.com (HELO gao-cwp) ([10.239.159.26])
 by orsmga004.jf.intel.com with ESMTP; 04 Aug 2019 23:58:49 -0700
Date: Mon, 5 Aug 2019 15:02:58 +0800
From: Chao Gao <chao.gao@intel.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20190805070258.GB19492@gao-cwp>
References: <1564654971-31328-1-git-send-email-chao.gao@intel.com>
 <1564654971-31328-7-git-send-email-chao.gao@intel.com>
 <87a8ebf4-75f7-2397-204a-794d04404d1f@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87a8ebf4-75f7-2397-204a-794d04404d1f@suse.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [Xen-devel] [PATCH v8 06/16] microcode: introduce a global
 cache of ucode patch
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
 Ashok Raj <ashok.raj@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBBdWcgMDIsIDIwMTkgYXQgMDI6NDY6NThQTSArMDAwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj5PbiAwMS4wOC4yMDE5IDEyOjIyLCBDaGFvIEdhbyB3cm90ZToKPj4gK2Jvb2wgbWljcm9j
b2RlX3VwZGF0ZV9jYWNoZShzdHJ1Y3QgbWljcm9jb2RlX3BhdGNoICpwYXRjaCkKPj4gK3sKPj4g
Kwo+PiArICAgIEFTU0VSVChzcGluX2lzX2xvY2tlZCgmbWljcm9jb2RlX211dGV4KSk7Cj4+ICsK
Pj4gKyAgICBpZiAoICFtaWNyb2NvZGVfY2FjaGUgKQo+PiArICAgICAgICBtaWNyb2NvZGVfY2Fj
aGUgPSBwYXRjaDsKPj4gKyAgICBlbHNlIGlmICggbWljcm9jb2RlX29wcy0+Y29tcGFyZV9wYXRj
aChwYXRjaCwgbWljcm9jb2RlX2NhY2hlKSA9PQo+PiArICAgICAgICAgICAgICAgICAgTkVXX1VD
T0RFICkKPgo+SW5kZW50YXRpb24gaXMgd3JvbmcgaGVyZS4KPgo+PiArc3RhdGljIHN0cnVjdCBt
aWNyb2NvZGVfcGF0Y2ggKmFsbG9jX21pY3JvY29kZV9wYXRjaCgKPj4gKyAgICBjb25zdCBzdHJ1
Y3QgbWljcm9jb2RlX2FtZCAqbWNfYW1kKQo+PiArewo+PiArICAgIHN0cnVjdCBtaWNyb2NvZGVf
cGF0Y2ggKm1pY3JvY29kZV9wYXRjaCA9IHhtYWxsb2Moc3RydWN0IG1pY3JvY29kZV9wYXRjaCk7
Cj4+ICsgICAgc3RydWN0IG1pY3JvY29kZV9hbWQgKmNhY2hlID0geG1hbGxvYyhzdHJ1Y3QgbWlj
cm9jb2RlX2FtZCk7Cj4+ICsgICAgdm9pZCAqbXBiID0geG1hbGxvY19ieXRlcyhtY19hbWQtPm1w
Yl9zaXplKTsKPj4gKyAgICBzdHJ1Y3QgZXF1aXZfY3B1X2VudHJ5ICplcXVpdl9jcHVfdGFibGUg
PQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB4bWFsbG9jX2J5dGVzKG1jX2Ft
ZC0+ZXF1aXZfY3B1X3RhYmxlX3NpemUpOwo+PiArCj4+ICsgICAgaWYgKCAhbWljcm9jb2RlX3Bh
dGNoIHx8ICFjYWNoZSB8fCAhbXBiIHx8ICFlcXVpdl9jcHVfdGFibGUgKQo+PiArICAgIHsKPj4g
KyAgICAgICAgeGZyZWUobWljcm9jb2RlX3BhdGNoKTsKPj4gKyAgICAgICAgeGZyZWUoY2FjaGUp
Owo+PiArICAgICAgICB4ZnJlZShtcGIpOwo+PiArICAgICAgICB4ZnJlZShlcXVpdl9jcHVfdGFi
bGUpOwo+PiArICAgICAgICByZXR1cm4gRVJSX1BUUigtRU5PTUVNKTsKPj4gKyAgICB9Cj4+ICsK
Pj4gKyAgICBtZW1jcHkobXBiLCBtY19hbWQtPm1wYiwgbWNfYW1kLT5tcGJfc2l6ZSk7Cj4+ICsg
ICAgY2FjaGUtPm1wYiA9IG1wYjsKPj4gKyAgICBjYWNoZS0+bXBiX3NpemUgPSBtY19hbWQtPm1w
Yl9zaXplOwo+PiArICAgIG1lbWNweShlcXVpdl9jcHVfdGFibGUsIG1jX2FtZC0+ZXF1aXZfY3B1
X3RhYmxlLAo+PiArICAgICAgICAgICBtY19hbWQtPmVxdWl2X2NwdV90YWJsZV9zaXplKTsKPj4g
KyAgICBjYWNoZS0+ZXF1aXZfY3B1X3RhYmxlID0gZXF1aXZfY3B1X3RhYmxlOwo+PiArICAgIGNh
Y2hlLT5lcXVpdl9jcHVfdGFibGVfc2l6ZSA9IG1jX2FtZC0+ZXF1aXZfY3B1X3RhYmxlX3NpemU7
Cj4+ICsgICAgbWljcm9jb2RlX3BhdGNoLT5tY19hbWQgPSBjYWNoZTsKPj4gKwo+PiArICAgIHJl
dHVybiBtaWNyb2NvZGVfcGF0Y2g7Cj4+ICt9Cj4KPldoeSBpcyBpdCB0aGF0IGV2ZXJ5dGhpbmcg
bmVlZHMgdG8gYmUgY29waWVkIGhlcmUsIHJhdGhlciB0aGFuCj5zaW1wbHkgc2h1ZmZsaW5nIG9u
ZSAob3IgYSBmZXcpIHBvaW50ZXIocyk/IENhbid0IHRoZSBjYWxsZXIKPnNpbXBseSBpbnN0YWxs
IHRoZSBhcmd1bWVudCBpdCBwYXNzZXMgaGVyZSBhcyB0aGUgbmV3IGNhY2hlIGJsb2I/CgpUaGUg
b2xkIHBlci1jcHUgY2FjaGUgd291bGQgdXNlIHRoZSBwb2ludGVycy4gQW5kIHRoZSBvbGQgY2Fj
aGUgc3RydWN0CmlzIHJlbW92ZWQgaW4gIm1pY3JvY29kZTogcmVtb3ZlIHN0cnVjdCB1Y29kZV9j
cHVfaW5mbyIuIEkgY2FuIGFkZCBhCnBhdGNoIGFmdGVyIHRoYXQgb25lIHRvIHJldXNlIHRoZSBw
b2ludGVycy4gT3RoZXJ3aXNlLCBJIG1heSBoYXZlIHRvCm1lcmdlIGZvbGxvd2luZyB0d28gcGF0
Y2hlcyBpbnRvIHRoaXMgb25lLgoKPgo+PiArc3RhdGljIGVudW0gbWljcm9jb2RlX21hdGNoX3Jl
c3VsdCBjb21wYXJlX3BhdGNoKAo+PiArICAgIGNvbnN0IHN0cnVjdCBtaWNyb2NvZGVfcGF0Y2gg
Km5ldywgY29uc3Qgc3RydWN0IG1pY3JvY29kZV9wYXRjaCAqb2xkKQo+PiArewo+PiArICAgIGNv
bnN0IHN0cnVjdCBtaWNyb2NvZGVfaGVhZGVyX2ludGVsICpvbGRfaGVhZGVyID0gJm9sZC0+bWNf
aW50ZWwtPmhkcjsKPj4gKwo+PiArICAgIHJldHVybiBtaWNyb2NvZGVfdXBkYXRlX21hdGNoKCZu
ZXctPm1jX2ludGVsLT5oZHIsIG9sZF9oZWFkZXItPnNpZywKPj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBvbGRfaGVhZGVyLT5wZiwgb2xkX2hlYWRlci0+cmV2KTsKPgo+U28g
dGhpcyBpcyBleGFjdGx5IHdoYXQgSSBzYWlkIG9uIHRoZSBlYXJsaWVyIHBhdGNoIHRoZSBmdW5j
dGlvbgo+Y2Fubm90IGJlIHVzZWQgZm9yLiBUaGUgd2F5ICJwZiIgd29ya3MgcHJlY2x1ZGVzIHRo
aXMsIGFzIHNhaWQgaW4KPnJlcGx5IHRvIGFuIGVhcmxpZXIgdmVyc2lvbiwgYW5kIG5vLW9uZSBj
b3JyZWN0ZWQgbWUgKGkuZS4gSSdtIGluCj5ubyB3YXkgZXhjbHVkaW5nIEknbSBtaXN1bmRlcnN0
YW5kaW5nIHNvbWV0aGluZyBoZXJlKS4KCkhvdyBhYm91dCBqdXN0IGNoZWNrICdyZXYnIGhlcmUg
YW5kIGxlYXZlIGEgY29tbWVudCBoZXJlIHRvIGV4cGxhaW4Kd2h5PwoKV2UgZHJvcHMgYWxsIG1p
c21hdGNoZWQgcGF0Y2hlcyAoaW5jbHVkaW5nIHRoYXQgb25seSBoYXMgJ3BmJwptaXNtYXRjaGVk
KSBjb21wYXJlZCB3aXRoIGN1cnJlbnQgQ1BVIHNpZ25hdHVyZS4gR2l2ZW4gdGhhdCwgaXQgaXMK
ZmluZSB0byBvbmx5IGNoZWNrIHRoZSByZXZpc2lvbiBudW1iZXIuCgpUaGFua3MKQ2hhbwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
