Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F14289CB3F
	for <lists+xen-devel@lfdr.de>; Mon, 26 Aug 2019 10:06:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i29yr-000354-EU; Mon, 26 Aug 2019 08:04:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aSgy=WW=intel.com=chao.gao@srs-us1.protection.inumbo.net>)
 id 1i29yp-00034z-M8
 for xen-devel@lists.xenproject.org; Mon, 26 Aug 2019 08:03:59 +0000
X-Inumbo-ID: 0dc66432-c7d8-11e9-8980-bc764e2007e4
Received: from mga09.intel.com (unknown [134.134.136.24])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0dc66432-c7d8-11e9-8980-bc764e2007e4;
 Mon, 26 Aug 2019 08:03:57 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Aug 2019 01:03:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,431,1559545200"; d="scan'208";a="182367598"
Received: from gao-cwp.sh.intel.com (HELO gao-cwp) ([10.239.159.26])
 by orsmga003.jf.intel.com with ESMTP; 26 Aug 2019 01:03:54 -0700
Date: Mon, 26 Aug 2019 16:07:59 +0800
From: Chao Gao <chao.gao@intel.com>
To: Sergey Dyasli <sergey.dyasli@citrix.com>
Message-ID: <20190826080759.GB11910@gao-cwp>
References: <1566177928-19114-1-git-send-email-chao.gao@intel.com>
 <1566177928-19114-16-git-send-email-chao.gao@intel.com>
 <3b455c41-b5a3-2533-99a8-2200def4b19f@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3b455c41-b5a3-2533-99a8-2200def4b19f@citrix.com>
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
Cc: Ashok Raj <ashok.raj@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org,
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBBdWcgMjMsIDIwMTkgYXQgMDk6NDY6MzdBTSArMDEwMCwgU2VyZ2V5IER5YXNsaSB3
cm90ZToKPk9uIDE5LzA4LzIwMTkgMDI6MjUsIENoYW8gR2FvIHdyb3RlOgo+PiByZWdpc3RlciBh
biBubWkgY2FsbGJhY2suIEFuZCB0aGlzIGNhbGxiYWNrIGRvZXMgYnVzeS1sb29wIG9uIHRocmVh
ZHMKPj4gd2hpY2ggYXJlIHdhaXRpbmcgZm9yIGxvYWRpbmcgY29tcGxldGlvbi4gQ29udHJvbCB0
aHJlYWRzIHNlbmQgTk1JIHRvCj4+IHNsYXZlIHRocmVhZHMgdG8gcHJldmVudCBOTUkgYWNjZXB0
YW5jZSBkdXJpbmcgdWNvZGUgbG9hZGluZy4KPj4gCj4+IFNpZ25lZC1vZmYtYnk6IENoYW8gR2Fv
IDxjaGFvLmdhb0BpbnRlbC5jb20+Cj4+IC0tLQo+PiBDaGFuZ2VzIGluIHY5Ogo+PiAgLSBjb250
cm9sIHRocmVhZHMgc2VuZCBOTUkgdG8gYWxsIG90aGVyIHRocmVhZHMuIFNsYXZlIHRocmVhZHMg
d2lsbAo+PiAgc3RheSBpbiB0aGUgTk1JIGhhbmRsaW5nIHRvIHByZXZlbnQgTk1JIGFjY2VwdGFu
Y2UgZHVyaW5nIHVjb2RlCj4+ICBsb2FkaW5nLiBOb3RlIHRoYXQgc2VsZi1ubWkgaXMgaW52YWxp
ZCBhY2NvcmRpbmcgdG8gU0RNLgo+Cj5UbyBtZSB0aGlzIGxvb2tzIGxpa2UgYSBoYWxmLW1lYXN1
cmU6IHdoeSBrZWVwIG9ubHkgc2xhdmUgdGhyZWFkcyBpbgo+dGhlIE5NSSBoYW5kbGVyLCB3aGVu
IG1hc3RlciB0aHJlYWRzIGNhbiB1cGRhdGUgdGhlIG1pY3JvY29kZSBmcm9tCj5pbnNpZGUgdGhl
IE5NSSBoYW5kbGVyIGFzIHdlbGw/CgpObyBzcGVjaWFsIHJlYXNvbi4gQmVjYXVzZSB0aGUgaXNz
dWUgd2Ugd2FudCB0byBhZGRyZXNzIGlzIHRoYXQgc2xhdmUKdGhyZWFkcyBtaWdodCBnbyB0byBo
YW5kbGUgTk1JIGFuZCBhY2Nlc3MgTVNScyB3aGVuIG1hc3RlciB0aHJlYWQgaXMKbG9hZGluZyB1
Y29kZS4gU28gd2Ugb25seSBrZWVwIHNsYXZlIHRocmVhZHMgaW4gdGhlIE5NSSBoYW5kbGVyLgoK
Pgo+WW91IG1lbnRpb24gdGhhdCBzZWxmLW5taSBpcyBpbnZhbGlkLCBidXQgWGVuIGhhcyBzZWxm
X25taSgpIHdoaWNoIGlzCj51c2VkIGZvciBhcHBseV9hbHRlcm5hdGl2ZXMoKSBkdXJpbmcgYm9v
dCwgc28gY2FuIGJlIHRydXN0ZWQgdG8gd29yay4KClNvcnJ5LCBJIG1lYW50IHVzaW5nIHNlbGYg
c2hvcnRoYW5kIHRvIHNlbmQgc2VsZi1ubWkuIEkgdHJpZWQgdG8gdXNlCnNlbGYgc2hvcnRoYW5k
IGJ1dCBnb3QgQVBJQyBlcnJvci4gQW5kIEkgYWdyZWUgdGhhdCBpdCBpcyBiZXR0ZXIgdG8KbWFr
ZSBzbGF2ZSB0aHJlYWQgY2FsbCBzZWxmX25taSgpIGl0c2VsZi4KCj4KPkkgZXhwZXJpbWVudGVk
IGEgYml0IHdpdGggdGhlIGZvbGxvd2luZyBhcHByb2FjaDogYWZ0ZXIgbG9hZGluZ19zdGF0ZQo+
YmVjb21lcyBMT0FESU5HX0NBTExJTiwgZWFjaCBjcHUgaXNzdWVzIGEgc2VsZl9ubWkoKSBhbmQg
cmVuZGV6dm91cwo+dmlhIGNwdV9jYWxsaW5fbWFwIGludG8gTE9BRElOR19FTlRFUiB0byBkbyBh
IHVjb2RlIHVwZGF0ZSBkaXJlY3RseSBpbgo+dGhlIE5NSSBoYW5kbGVyLiBBbmQgaXQgc2VlbXMg
dG8gd29yay4KPgo+U2VwYXJhdGUgcXVlc3Rpb24gaXMgYWJvdXQgdGhlIHNhZmV0eSBvZiB0aGlz
IGFwcHJvYWNoOiBjYW4gd2UgYmUgc3VyZQo+dGhhdCBhIHVjb2RlIHVwZGF0ZSB3b3VsZCBub3Qg
cmVzZXQgdGhlIHN0YXR1cyBvZiB0aGUgTk1JIGxhdGNoPyBJLmUuCj5jYW4gaXQgY2F1c2UgYW5v
dGhlciBOTUkgdG8gYmUgZGVsaXZlcmVkIHdoaWxlIFhlbiBhbHJlYWR5IGhhbmRsZXMgb25lPwoK
QXNob2ssIHdoYXQncyB5b3VyIG9waW5pb24gb24gU2VyZ2V5J3MgYXBwcm9hY2ggYW5kIGhpcyBj
b25jZXJuPwoKVGhhbmtzCkNoYW8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
