Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 350583CBF6
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2019 14:43:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hag68-0007KO-Ly; Tue, 11 Jun 2019 12:41:56 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Poke=UK=intel.com=chao.gao@srs-us1.protection.inumbo.net>)
 id 1hag66-0007KG-Vo
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2019 12:41:55 +0000
X-Inumbo-ID: 4a6f9139-8c46-11e9-8980-bc764e045a96
Received: from mga17.intel.com (unknown [192.55.52.151])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 4a6f9139-8c46-11e9-8980-bc764e045a96;
 Tue, 11 Jun 2019 12:41:53 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Jun 2019 05:41:53 -0700
X-ExtLoop1: 1
Received: from gao-cwp.sh.intel.com (HELO gao-cwp) ([10.239.159.26])
 by orsmga001.jf.intel.com with ESMTP; 11 Jun 2019 05:41:51 -0700
Date: Tue, 11 Jun 2019 20:46:04 +0800
From: Chao Gao <chao.gao@intel.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20190611124604.GB22930@gao-cwp>
References: <1558945891-3015-1-git-send-email-chao.gao@intel.com>
 <1558945891-3015-10-git-send-email-chao.gao@intel.com>
 <5CF7D77A020000780023598C@prv1-mh.provo.novell.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5CF7D77A020000780023598C@prv1-mh.provo.novell.com>
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

T24gV2VkLCBKdW4gMDUsIDIwMTkgYXQgMDg6NTM6NDZBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4+Pj4gT24gMjcuMDUuMTkgYXQgMTA6MzEsIDxjaGFvLmdhb0BpbnRlbC5jb20+IHdyb3Rl
Ogo+PiBtaWNyb2NvZGVfdXBkYXRlX2xvY2sgaXMgdG8gcHJldmVudCBsb2dpYyB0aHJlYWRzIG9m
IGEgc2FtZSBjb3JlIGZyb20KPj4gdXBkYXRpbmcgbWljcm9jb2RlIGF0IHRoZSBzYW1lIHRpbWUu
IEJ1dCBkdWUgdG8gdXNpbmcgYSBnbG9iYWwgbG9jaywgaXQKPj4gYWxzbyBwcmV2ZW50ZWQgcGFy
YWxsZWwgbWljcm9jb2RlIHVwZGF0aW5nIG9uIGRpZmZlcmVudCBjb3Jlcy4KPj4gCj4+IFJlbW92
ZSB0aGlzIGxvY2sgaW4gb3JkZXIgdG8gdXBkYXRlIG1pY3JvY29kZSBpbiBwYXJhbGxlbC4gSXQg
aXMgc2FmZQo+PiBiZWNhdXNlIHdlIGhhdmUgYWxyZWFkeSBlbnN1cmVkIHNlcmlhbGl6YXRpb24g
b2Ygc2libGluZyB0aHJlYWRzIGF0IHRoZQo+PiBjYWxsZXIgc2lkZS4KPj4gMS5Gb3IgbGF0ZSBt
aWNyb2NvZGUgdXBkYXRlLCBkb19taWNyb2NvZGVfdXBkYXRlKCkgZW5zdXJlcyB0aGF0IG9ubHkg
b25lCj4+ICAgc2liaWxpbmcgdGhyZWFkIG9mIGEgY29yZSBjYW4gdXBkYXRlIG1pY3JvY29kZS4K
Pj4gMi5Gb3IgbWljcm9jb2RlIHVwZGF0ZSBkdXJpbmcgc3lzdGVtIHN0YXJ0dXAgb3IgQ1BVLWhv
dHBsdWcsCj4+ICAgbWljcm9jb2RlX211dGV4KCkgZ3VhcmFudGVlcyB1cGRhdGUgc2VyaWFsaXph
dGlvbiBvZiBsb2dpY2FsIHRocmVhZHMuCj4+IDMuZ2V0L3B1dF9jcHVfYml0bWFwcygpIHByZXZl
bnRzIHRoZSBjb25jdXJyZW5jeSBvZiBDUFUtaG90cGx1ZyBhbmQKPj4gICBsYXRlIG1pY3JvY29k
ZSB1cGRhdGUuCj4+IAo+PiBOb3RlIHRoYXQgcHJpbnRrIGluIGFwcGx5X21pY3JvY29kZSgpIGFu
ZCBzdm1faG9zdF9vc3ZtX2luaXQoKSAoZm9yIEFNRAo+PiBvbmx5KSBhcmUgc3RpbGwgcHJvY2Vz
c2VkIHNlcXVlbnRpYWxseS4KPj4gCj4+IFNpZ25lZC1vZmYtYnk6IENoYW8gR2FvIDxjaGFvLmdh
b0BpbnRlbC5jb20+Cj4KPlJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5j
b20+CgpUaGFua3MuCgo+Cj4+IC0tLQo+PiBDaGFuZ2VzIGluIHY3Ogo+PiAgLSByZXdvcmtlZC4g
UmVtb3ZlIGNvbXBsZXggbG9jayBsb2dpY3MgaW50cm9kdWNlZCBpbiB2NSBhbmQgdjYuIFRoZSBt
aWNyb2NvZGUKPj4gIHBhdGNoIHRvIGJlIGFwcGxpZWQgaXMgcGFzc2VkIGFzIGFuIGFyZ3VtZW50
IHdpdGhvdXQgYW55IGdsb2JhbCB2YXJpYWJsZS4gVGh1cwo+PiAgbm8gbG9jayBpcyBhZGRlZCB0
byBzZXJpYWxpemUgcG90ZW50aWFsIHJlYWRlcnMvd3JpdGVycy4gQ2FsbGVycyBvZgo+PiAgYXBw
bHlfbWljcm9jb2RlKCkgd2lsbCBndWFyYW50ZWUgdGhlIGNvcnJlY3RuZXNzOiB0aGUgcGF0Y2gg
cG9uaW50ZWQgYnkgdGhlCj4+ICBhcmd1bWVudHMgd29uJ3QgYmUgY2hhbmdlZCBieSBvdGhlcnMu
Cj4KPk11Y2ggYmV0dGVyIHRoaXMgd2F5IGluZGVlZC4KPgo+PiBAQCAtMzA3LDggKzMwMyw3IEBA
IHN0YXRpYyBpbnQgYXBwbHlfbWljcm9jb2RlKGNvbnN0IHN0cnVjdCBtaWNyb2NvZGVfcGF0Y2gg
KnBhdGNoKQo+PiAgCj4+ICAgICAgbWNfaW50ZWwgPSBwYXRjaC0+bWNfaW50ZWw7Cj4+ICAKPj4g
LSAgICAvKiBzZXJpYWxpemUgYWNjZXNzIHRvIHRoZSBwaHlzaWNhbCB3cml0ZSB0byBNU1IgMHg3
OSAqLwo+PiAtICAgIHNwaW5fbG9ja19pcnFzYXZlKCZtaWNyb2NvZGVfdXBkYXRlX2xvY2ssIGZs
YWdzKTsKPj4gKyAgICBCVUdfT04obG9jYWxfaXJxX2lzX2VuYWJsZWQoKSk7Cj4+ICAKPj4gICAg
ICAvKgo+PiAgICAgICAqIFdyaXRlYmFjayBhbmQgaW52YWxpZGF0ZSBjYWNoZXMgYmVmb3JlIHVw
ZGF0aW5nIG1pY3JvY29kZSB0byBhdm9pZAo+Cj5UaGlua2luZyBhYm91dCBpdCAtIHdoYXQgaGFw
cGVucyBpZiB3ZSBoaXQgYW4gTk1JIG9yICNNQyBoZXJlPwo+d2F0Y2hkb2dfZGlzYWJsZSgpLCBh
IGNhbGwgdG8gd2hpY2ggeW91IGFkZCBpbiBhbiBlYXJsaWVyIHBhdGNoLAo+ZG9lc24ndCByZWFs
bHkgc3VwcHJlc3MgdGhlIGdlbmVyYXRpb24gb2YgTk1JcywgaXQgb25seSB0ZWxscyB0aGUKPmhh
bmRsZXIgbm90IHRvIGxvb2sgYXQgdGhlIGFjY3VtdWxhdGVkIHN0YXRpc3RpY3MuCgpJIHRoaW5r
IHRoZXkgc2hvdWxkIGJlIHN1cHByZXNzZWQuIEFzaG9rLCBjb3VsZCB5b3UgY29uZmlybSBpdD8K
Ckkgd2lsbCBmaWd1cmUgb3V0IGhvdyB0byBzdXBwcmVzcyB0aGVtIGluIFhlbi4KClRoYW5rcwpD
aGFvCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
