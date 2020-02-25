Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3398E16E9C5
	for <lists+xen-devel@lfdr.de>; Tue, 25 Feb 2020 16:15:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6btF-00021K-Lj; Tue, 25 Feb 2020 15:12:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=g8Eh=4N=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j6btE-00021F-Q7
 for xen-devel@lists.xenproject.org; Tue, 25 Feb 2020 15:12:52 +0000
X-Inumbo-ID: 4a667460-57e1-11ea-a490-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4a667460-57e1-11ea-a490-bc764e2007e4;
 Tue, 25 Feb 2020 15:12:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E9569AD5C;
 Tue, 25 Feb 2020 15:12:50 +0000 (UTC)
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20200224084400.94482-1-roger.pau@citrix.com>
 <20200224084400.94482-2-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f412712d-6181-6efd-f6be-ed2bdcf243ed@suse.com>
Date: Tue, 25 Feb 2020 16:12:56 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200224084400.94482-2-roger.pau@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 1/2] atomic: add atomic_and operations
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjQuMDIuMjAyMCAwOTo0MywgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOj4gLS0tIGEveGVuL2lu
Y2x1ZGUvYXNtLXg4Ni9hdG9taWMuaAo+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvYXRvbWlj
LmgKPiBAQCAtMjI0LDYgKzIyNCwxNCBAQCBzdGF0aWMgaW5saW5lIGludCBhdG9taWNfYWRkX3Vu
bGVzcyhhdG9taWNfdCAqdiwgaW50IGEsIGludCB1KQo+ICAgICAgcmV0dXJuIGM7Cj4gIH0KPiAg
Cj4gK3N0YXRpYyBpbmxpbmUgdm9pZCBhdG9taWNfYW5kKHVuc2lnbmVkIGludCBtLCBhdG9taWNf
dCAqdikKPiArewo+ICsgICAgYXNtIHZvbGF0aWxlICgKPiArICAgICAgICAibG9jazsgYW5kbCAl
MSwlMCIKCkkgcmVhbGl6ZSB0aGlzIGlzIGluIHN5bmMgd2l0aCBvdGhlciBhdG9taWNfKigpLCBi
dXQgSSdkIHByZWZlciBpZgp0aGUgc3RyYXkgc2VtaWNvbG9uIGFmdGVyICJsb2NrIiB3YXMgZHJv
cHBlZC4gV2l0aG91dCBpdCB0aGUKYXNzZW1ibGVyIGNhbiBhY3R1YWxseSBkaWFnbm9zZSBhIGJh
ZCB1c2UgKHRoZSBkZXN0aW5hdGlvbiBub3QKYmVpbmcgYSBtZW1vcnkgb3BlcmFuZCkuIEknbSB1
bmF3YXJlIG9mIHJlYXNvbnMgd2h5IHRoZSBzZW1pY29sb25zCndvdWxkIGhhdmUgYmVlbiBwdXQg
dGhlcmUuCgo+ICsgICAgICAgIDogIj1tIiAoKih2b2xhdGlsZSBpbnQgKikmdi0+Y291bnRlcikK
PiArICAgICAgICA6ICJpciIgKG0pLCAibSIgKCoodm9sYXRpbGUgaW50ICopJnYtPmNvdW50ZXIp
ICk7CgpTaW1pbGFybHkgZGVzcGl0ZSBpdHMgdXNlIGVsc2V3aGVyZSBJJ20gYWZyYWlkICJpIiBp
cyBub3QgdGhlIGJlc3QKY2hvaWNlIGhlcmUgZm9yIHRoZSBjb25zdHJhaW50LiBUb2dldGhlciB3
aXRoIHN3aXRjaGluZyB0byBwbGFpbgppbnQgYXMgdGhlIGZ1bmN0aW9uJ3MgZmlyc3QgcGFyYW1l
dGVyIHR5cGUsICJlIiB3b3VsZCBzZWVtIGJldHRlcgpldmVuIGlmIHRoZSBkaWZmZXJlbmNlIHdv
dWxkIG9ubHkgbWFuaWZlc3QgZm9yIGF0b21pYzY0X3QuIEFzIHRvCnRoZSBjaG9pY2Ugb2YgcGFy
YW1ldGVyIHR5cGUsIExpbnV4IHRvbyB1c2VzIHBsYWluIGludCwgc28gd2hpbGUKSSBhZ3JlZSB3
aXRoIHlvdXIgcmVhc29uaW5nIEkgdGhpbmsgSSBhbHNvIGFncmVlIHdpdGggSnVsaWVuIHRvCnVz
ZSBwbGFpbiBpbnQgaGVyZSBmb3IgY29uc2lzdGVuY3kuCgpGaW5hbGx5LCB5ZXQgYW5vdGhlciBp
bXByb3ZlbWVudCBvdmVyIGV4aXN0aW5nIGNvZGUgd291bGQgYmUgdG8KdXNlIGp1c3QgYSBzaW5n
bGUgb3V0cHV0ICIrbSIsIHdpdGggbm8gcGFyYWxsZWxpbmcgaW5wdXQgIm0iLgoKV2l0aCB0aGUg
Zmlyc3QgYW5kIGxhc3QsIGJ1dCBub3QgbmVjZXNzYXJpbHkgdGhlIG1pZGRsZSBvbmUgdGFrZW4K
Y2FyZSBvZiAoYW5kIEknZCBiZSBoYXBweSB0byB0YWtlIGNhcmUgb2YgdGhlbSB3aGlsZSBjb21t
aXR0aW5nKQpSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpJZiwg
b3RvaCwgeW91IGRpc2FncmVlIG9uIHNvbWUsIHRoZW4gbGV0J3Mgc2VlIHdoZXJlIHdlIGNhbgpm
aW5kIGNvbW1vbiBncm91bmRzLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
