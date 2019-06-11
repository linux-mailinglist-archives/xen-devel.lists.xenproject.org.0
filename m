Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA573CC57
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2019 14:58:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hagId-0000Fa-HF; Tue, 11 Jun 2019 12:54:51 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Poke=UK=intel.com=chao.gao@srs-us1.protection.inumbo.net>)
 id 1hagIb-0000FV-G1
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2019 12:54:49 +0000
X-Inumbo-ID: 17cacfb2-8c48-11e9-8980-bc764e045a96
Received: from mga18.intel.com (unknown [134.134.136.126])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 17cacfb2-8c48-11e9-8980-bc764e045a96;
 Tue, 11 Jun 2019 12:54:48 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Jun 2019 05:54:47 -0700
X-ExtLoop1: 1
Received: from gao-cwp.sh.intel.com (HELO gao-cwp) ([10.239.159.26])
 by orsmga007.jf.intel.com with ESMTP; 11 Jun 2019 05:54:45 -0700
Date: Tue, 11 Jun 2019 20:58:59 +0800
From: Chao Gao <chao.gao@intel.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20190611125859.GC22930@gao-cwp>
References: <1558945891-3015-1-git-send-email-chao.gao@intel.com>
 <1558945891-3015-11-git-send-email-chao.gao@intel.com>
 <5CF7DA4D02000078002359AC@prv1-mh.provo.novell.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5CF7DA4D02000078002359AC@prv1-mh.provo.novell.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [Xen-devel] [PATCH v7 10/10] x86/microcode: always
 collect_cpu_info() during boot
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

T24gV2VkLCBKdW4gMDUsIDIwMTkgYXQgMDk6MDU6NDlBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4+Pj4gT24gMjcuMDUuMTkgYXQgMTA6MzEsIDxjaGFvLmdhb0BpbnRlbC5jb20+IHdyb3Rl
Ogo+PiBGcm9tOiBTZXJnZXkgRHlhc2xpIDxzZXJnZXkuZHlhc2xpQGNpdHJpeC5jb20+Cj4+IAo+
PiBDdXJyZW50bHkgY3B1X3NpZyBzdHJ1Y3QgaXMgbm90IHVwZGF0ZWQgZHVyaW5nIGJvb3Qgd2hl
biBlaXRoZXI6Cj4+IAo+PiAgICAgMS4gdWNvZGVfc2NhbiBpcyBzZXQgdG8gZmFsc2UgKGUuZy4g
bm8gInVjb2RlPXNjYW4iIGluIGNtZGxpbmUpCj4+ICAgICAyLiBpbml0cmQgZG9lcyBub3QgY29u
dGFpbiBhIG1pY3JvY29kZSBibG9iCj4KPkkgdGhvdWdodCB3ZSdkIGFscmVhZHkgZGlzY3Vzc2Vk
IHRoaXMgLSAidWNvZGU9PG51bWJlcj4iIGlzIG5vdAo+Y292ZXJlZCBieSB0aGlzLgo+Cj4+IFRo
ZXNlIHdpbGwgcmVzdWx0IGluIGNwdV9zaWcucmV2IGJlaW5nIDAgd2hpY2ggYWZmZWN0cyBBUElD
J3MKPj4gY2hlY2tfZGVhZGxpbmVfZXJyYXRhKCkgYW5kIHJldHBvbGluZV9zYWZlKCkgZnVuY3Rp
b25zLgo+PiAKPj4gRml4IHRoaXMgYnkgZ2V0dGluZyB1Y29kZSByZXZpc2lvbiBlYXJseSBkdXJp
bmcgYm9vdCBhbmQgU01QIGJyaW5nIHVwLgo+PiBXaGlsZSBhdCBpdC4KPgo+V2hpbGUgYXQgaXQ/
Cj4KPj4gU2lnbmVkLW9mZi1ieTogU2VyZ2V5IER5YXNsaSA8c2VyZ2V5LmR5YXNsaUBjaXRyaXgu
Y29tPgo+PiBTaWduZWQtb2ZmLWJ5OiBDaGFvIEdhbyA8Y2hhby5nYW9AaW50ZWwuY29tPgo+PiAt
LS0KPj4gY2hhbmdlcyBpbiB2NzoKPj4gLSByZWJhc2Ugb24gcGF0Y2ggMX45Cj4KPkZyb20gdGhl
IGxvb2tzIG9mIGl0IHRoaXMgZG9lc24ndCBkZXBlbmQgb24gYW55IG9mIHRoZSBlYXJsaWVyIGNo
YW5nZXMKPihleGNlcHQgdGhlIHVjb2RlX2NwdV9pbmZvIC0+IGNwdV9zaWcgY2hhbmdlKSwgYW5k
IGhlbmNlIGNvdWxkIGdvCj5pbiByaWdodCBhd2F5LiBBbSBJIG92ZXJsb29raW5nIHNvbWV0aGlu
Zz8gSWYgbm90LCBhbGwgdGhhdCdzIG5lZWRlZAo+d291bGQgYmUgY2xhcmlmaWNhdGlvbnMgb2Yg
dGhlIGRlc2NyaXB0aW9uIGFzIHBlciBhYm92ZS4KCkkgdGhpbmsgbm8uIFdpbGwgc2VuZCB0aGlz
IHBhdGNoIHNlcGFyYXRlbHkuCgpUaGFua3MKQ2hhbwoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
