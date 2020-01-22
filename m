Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB59145A69
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2020 17:58:08 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuJI3-0005P2-PA; Wed, 22 Jan 2020 16:55:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=q9GK=3L=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iuJI1-0005Ox-Vm
 for xen-devel@lists.xenproject.org; Wed, 22 Jan 2020 16:55:38 +0000
X-Inumbo-ID: 02b09470-3d38-11ea-bccb-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 02b09470-3d38-11ea-bccb-12813bfff9fa;
 Wed, 22 Jan 2020 16:55:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 6259DAD73;
 Wed, 22 Jan 2020 16:55:35 +0000 (UTC)
To: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
References: <cover.1579628566.git.tamas.lengyel@intel.com>
 <17ea032201adfecdb5dedc3a0b9667eccdf7f118.1579628566.git.tamas.lengyel@intel.com>
 <6cb72a36-d9af-5b96-76df-2c6746dfa245@suse.com>
 <CABfawhkzPyFas7kasNjBoCyCMi+kkfC6DrvYv4PCuPtK7A5MNA@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ea1ec47f-e321-7235-56f1-0d4b2fb01b46@suse.com>
Date: Wed, 22 Jan 2020 17:55:43 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <CABfawhkzPyFas7kasNjBoCyCMi+kkfC6DrvYv4PCuPtK7A5MNA@mail.gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 03/18] x86/p2m: Allow
 p2m_get_page_from_gfn to return shared entries
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
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjIuMDEuMjAyMCAxNzo1MSwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+IE9uIFdlZCwgSmFu
IDIyLCAyMDIwIGF0IDg6MjMgQU0gSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPiB3cm90
ZToKPj4KPj4gT24gMjEuMDEuMjAyMCAxODo0OSwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+Pj4g
VGhlIG93bmVyIGRvbWFpbiBvZiBzaGFyZWQgcGFnZXMgaXMgZG9tX2NvdywgdXNlIHRoYXQgZm9y
IGdldF9wYWdlCj4+PiBvdGhlcndpc2UgdGhlIGZ1bmN0aW9uIGZhaWxzIHRvIHJldHVybiB0aGUg
Y29ycmVjdCBwYWdlLgo+Pgo+PiBJIHRoaW5rIHRoaXMgZGVzY3JpcHRpb24gbmVlZHMgaW1wcm92
ZW1lbnQ6IFRoZSBmdW5jdGlvbiBkb2VzIHRoZQo+PiBzcGVjaWFsIHNoYXJlZCBwYWdlIGRhbmNl
IGluIG9uZSBwbGFjZSAob24gdGhlICJmYXN0IHBhdGgiKQo+PiBhbHJlYWR5LiBUaGlzIHdhbnRz
IG1lbnRpb25pbmcsIGVpdGhlciBiZWNhdXNlIGl0IHdhcyBhIG1pc3Rha2UKPj4gdG8gaGF2ZSBp
dCBqdXN0IHRoZXJlLCBvciBiZWNhdXNlIGEgbmV3IG5lZWQgaGFzIGFwcGVhcmVkIHRvIGFsc28K
Pj4gaGF2ZSBpdCBvbiB0aGUgInNsb3cgcGF0aCIuCj4gCj4gSXQgd2FzIGEgcHJlLWV4aXN0aW5n
IGVycm9yIG5vdCB0byBnZXQgdGhlIHBhZ2UgZnJvbSBkb21fY293IGZvciBhCj4gc2hhcmVkIGVu
dHJ5IGluIHRoZSBzbG93IHBhdGguIEkgb25seSByYW4gaW50byBpdCBub3cgYmVjYXVzZSB0aGUK
PiBlcnJvbmVvdXMgdHlwZV9jb3VudCBjaGVjayBtb3ZlIGluIHRoZSBwcmV2aW91cyB2ZXJzaW9u
IG9mIHRoZSBzZXJpZXMKPiB3YXMgcmVzdWx0aW5nIGluIGFsbCBwYWdlcyBiZWluZyBmdWxseSBk
ZWR1cGxpY2F0ZWQgaW5zdGVhZCBvZiBtb3N0bHkKPiBiZWluZyBzaGFyZWQuIE5vdyB0aGF0IHRo
ZSBwYWdlcyBhcmUgcHJvcGVybHkgc2hhcmVkIHJ1bm5pbmcgTGliVk1JIG9uCj4gdGhlIGZvcmsg
cmVzdWx0ZWQgaW4gZmFpbHVyZXMgZG8gdG8gdGhpcyBidWcuCj4gCj4+PiAtLS0gYS94ZW4vYXJj
aC94ODYvbW0vcDJtLmMKPj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9tbS9wMm0uYwo+Pj4gQEAgLTU5
NCw3ICs1OTQsMTAgQEAgc3RydWN0IHBhZ2VfaW5mbyAqcDJtX2dldF9wYWdlX2Zyb21fZ2ZuKAo+
Pj4gICAgICBpZiAoIHAybV9pc19yYW0oKnQpICYmIG1mbl92YWxpZChtZm4pICkKPj4+ICAgICAg
ewo+Pj4gICAgICAgICAgcGFnZSA9IG1mbl90b19wYWdlKG1mbik7Cj4+PiAtICAgICAgICBpZiAo
ICFnZXRfcGFnZShwYWdlLCBwMm0tPmRvbWFpbikgKQo+Pj4gKyAgICAgICAgaWYgKCAhZ2V0X3Bh
Z2UocGFnZSwgcDJtLT5kb21haW4pICYmCj4+PiArICAgICAgICAgICAgIC8qIFBhZ2UgY291bGQg
YmUgc2hhcmVkICovCj4+PiArICAgICAgICAgICAgICghZG9tX2NvdyB8fCAhcDJtX2lzX3NoYXJl
ZCgqdCkgfHwKPj4+ICsgICAgICAgICAgICAgICFnZXRfcGFnZShwYWdlLCBkb21fY293KSkgKQo+
Pgo+PiBXaGlsZSB0aGVyZSBtYXkgYmUgYSByZWFzb24gd2h5IG9uIHRoZSBmYXN0IHBhdGggdHdv
IGdldF9wYWdlKCkKPj4gaW52b2NhdGlvbnMgYXJlIGJlIG5lY2Vzc2FyeSwgY291bGRuJ3QgeW91
IGdldCBhd2F5IHdpdGgganVzdAo+PiBvbmUKPj4KPj4gICAgICAgICBpZiAoICFnZXRfcGFnZShw
YWdlLCAhZG9tX2NvdyB8fCAhcDJtX2lzX3NoYXJlZCgqdCkgPyBwMm0tPmRvbWFpbgo+PiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA6
IGRvbV9jb3cpICkKPj4KPj4gYXQgbGVhc3QgaGVyZT8gSXQncyBhbHNvIG5vdCByZWFsbHkgY2xl
YXIgdG8gbWUgd2h5IGhlcmUgYW5kCj4+IHRoZXJlIHdlIG5lZWQgIiFkb21fY293IHx8ICFwMm1f
aXNfc2hhcmVkKCp0KSIgLSB3b3VsZG4ndAo+PiBwMm1faXNfc2hhcmVkKCkgcmV0dXJuIGNvbnNp
c3RlbnRseSAiZmFsc2UiIHdoZW4gIWRvbV9jb3cgPwo+IAo+IEkgc2ltcGx5IGNvcGllZCB0aGUg
ZXhpc3RpbmcgY29kZSBmcm9tIHRoZSBzbG93X3BhdGggYXMtaXMuIElNSE8gaXQKPiB3b3VsZCBz
dWZmaWNlIHRvIGRvIGEgc2luZ2xlIGdldF9wYWdlKHBhZ2UsICFwMm1faXNfc2hhcmVkKCp0KSA/
Cj4gcDJtLT5kb21haW4gOiBkb21fY293KTsgIHNpbmNlIHdlIGNhbid0IGhhdmUgYW55IGVudHJp
ZXMgdGhhdCBhcmUKPiBzaGFyZWQgd2hlbiBkb21fY293IGlzIE5VTEwgc28gdGhpcyBpcyBzYWZl
LCBubyBuZWVkIGZvciB0aGUgZXh0cmEKPiAhZG9tX2NvdyBjaGVjay4gSWYgeW91IHByZWZlciBJ
IGNhbiBtYWtlIHRoZSBjaGFuZ2UgZm9yIGJvdGgKPiBsb2NhdGlvbnMuCgpJZiB0aGUgY2hhbmdl
IGlzIGNvcnJlY3QgdG8gbWFrZSBhbHNvIGluIHRoZSBvdGhlciBwbGFjZSwgSSdkCmRlZmluaXRl
bHkgcHJlZmVyIHlvdSBkb2luZyBzby4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
