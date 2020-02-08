Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A0F4156434
	for <lists+xen-devel@lfdr.de>; Sat,  8 Feb 2020 13:31:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j0PEf-0006ng-MI; Sat, 08 Feb 2020 12:29:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Fd1X=34=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1j0PEe-0006nb-Je
 for xen-devel@lists.xen.org; Sat, 08 Feb 2020 12:29:20 +0000
X-Inumbo-ID: a0ce32a0-4a6e-11ea-b2e7-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a0ce32a0-4a6e-11ea-b2e7-12813bfff9fa;
 Sat, 08 Feb 2020 12:29:19 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7AB21AF8A;
 Sat,  8 Feb 2020 12:29:18 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
References: <6722f058-61eb-30c9-f97d-def690ccd7b8@citrix.com>
 <6a3aa771-927b-b3bd-dd05-1eea90b0a97f@suse.com>
 <6f3a1061-fd05-91e8-54ad-666ec3984ffb@citrix.com>
 <c5831cef-ff27-93e5-7536-2d6092ca1ad8@citrix.com>
 <38a28a9d-cc99-0776-1f8b-4103df3d3e9c@suse.com>
 <030eac1d-85b1-fa91-135e-00462eefeb92@suse.com>
 <f7814499-920b-6d7f-1a39-bb4bfb4d69c6@suse.com>
 <81ce9fab-e19e-9a36-b855-3a591f3653cb@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <3a388d4d-7e4a-fb08-5c00-39b838dc992f@suse.com>
Date: Sat, 8 Feb 2020 13:29:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <81ce9fab-e19e-9a36-b855-3a591f3653cb@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] Live-Patch application failure in core-scheduling
 mode
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
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDguMDIuMjAgMTM6MTksIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gT24gMDcvMDIvMjAyMCAw
ODo0MiwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPj4KPj4+IFdpdGhvdXQgaXQgYmVpbmcgZW50aXJl
bHkgY2xlYXIgdGhhdCB0aGVyZSdzIG5vIGFsdGVybmF0aXZlIHRvCj4+PiBpdCwgSSBkb24ndCB0
aGluayBJJ2QgYmUgZmluZSB3aXRoIHJlLWludHJvZHVjdGlvbiBvZgo+Pj4gY29udGludWVfaHlw
ZXJjYWxsX29uX2NwdSgwLCAuLi4pIGludG8gdWNvZGUgbG9hZGluZy4KPj4KPj4gSSBkb24ndCBz
ZWUgYSB2aWFibGUgYWx0ZXJuYXRpdmUuCj4gCj4gU29ycnkgdG8gaW50ZXJqZWN0IGluIHRoZSBt
aWRkbGUgb2YgYSBjb252ZXJzYXRpb24sIGJ1dCBJJ2QgbGlrZSB0byBtYWtlCj4gc29tZXRoaW5n
IHZlcnkgY2xlYXIuCj4gCj4gY29udGludWVfaHlwZXJjYWxsX29uX2NwdSgwLCAuLi4pIGlzLCBh
bmQgaGFzIGFsd2F5cyBiZWVuIGZ1bmRhbWVudGFsbHkKPiBicm9rZW4gZm9yIG1pY3JvY29kZSB1
cGRhdGVzLsKgIEl0IGNhdXNlcyByZWFsIGNyYXNoZXMgb24gcmVhbCBzeXN0ZW1zLAo+IGFuZCB0
aGF0IGlzIHdoeSB0aGUgbWVjaGFuaXNtIHdhcyByZXBsYWNlZC4KPiAKPiBDaGFuZ2luZyBiYWNr
IHRvIGl0IGlzIGdvaW5nIHRvIGJyZWFrIGN1c3RvbWVyIHN5c3RlbXMuCj4gCj4gSXQgaXMgbmVj
ZXNzYXJ5IHRvIGhhdmUgdGhlIGZ1bGwgc3lzdGVtIHF1aWVzY2VkIGluIHByYWN0aWNlLCBiZWNh
dXNlCj4gZm9yIGEgZ2l2ZW4gcGllY2Ugb2YgbWljcm9jb2RlLCB3ZSBkb24ndCBrbm93IHdoZXRo
ZXIgaXRzIGEgY3Jvc3MtdGhyZWFkCj4gbG9hZCAodGhlIGNvbW1vbiBjYXNlIHdoaWNoIG1vc3Qg
cGVvcGxlIGFyZSBmYW1pbGlhciB3aXRoKSwgd2hldGhlciBpdAo+IGlzIGEgY3Jvc3MtY29yZSBs
b2FkICh5ZXMgLSBpdCB0dXJucyBvdXQgdGhpcyBkb2VzIGV4aXN0IC0gaXQKPiBoaWdobGlnaHRl
ZCBhIGJ1ZyBpbiB0ZXN0aW5nKSwgYW5kIHdoZXRoZXIgdGhlcmUgYW4gdW5jb3JlL3Bjb2RlL2V0
Ywo+IHVwZGF0ZSBpbmNsdWRlZCBhcyB3ZWxsLgo+IAo+IEkgaGF2ZW4ndCBjb21lIGFjcm9zcyBh
IGNyb3NzLXNvY2tldCBsb2FkIHlldCAoYW5kIGl0IGxpa2VseSBkb2Vzbid0Cj4gZXhpc3RzLCBn
aXZlbiBzb21lIGFzcGVjdHMgb2YgbG9hZGluZyB3aGljaCBJIHRoaW5rIHdvdWxkIGJlIHByb2hp
Yml0aXZlCj4gaW4gdGhpcyBjYXNlKSwgYnV0IHRoZXJlIHJlYWxseSBhcmUgc3lzdGVtcyB3aGVy
ZSBsb2FkaW5nIG1pY3JvY29kZSBvbgo+IGNvcmUgMCB3aWxsIGZsdXNoIGFuZCByZWxvYWQgdGhl
IE1TUk9NcyBvbiBhbGwgb3RoZXIgY29yZXMgaW4gdGhlCj4gcGFja2FnZSwgdW5kZXIgdGhlIGZl
ZXQgb2Ygd2hhdGV2ZXIgZWxzZSBpcyBnb2luZyBvbiB0aGVyZS7CoCBUaGlzCj4gaW5jbHVkZXMg
bWFraW5nIHRoaW5ncyBsaWtlIE1TUl9TUEVDX0NUUkwgZGlzYXBwZWFyIHRyYW5zaWVudGx5Lgo+
IAo+IFdlIGRvbid0IG5lY2Vzc2FyaWx5IG5lZWQgdG8gdXNlIHN0b3BfbWFjaGluZSgpLCBvciB1
c2UgaXQgZXhhY3RseSBsaWtlCj4gd2UgY3VycmVudGx5IGRvLCBidXQgd2UgZG8gbmVlZCBhIGds
b2JhbCByZW5kZXp2b3VzLgoKRGlkIHlvdSBsb29rIGF0IHRoZSBwYXRjaD8KCkl0IHVzZXMgY29u
dGludWVfaHlwZXJjYWxsX29uX2NwdSgwLCAuLi4pIHRvIGNhbGwgc3RvcF9tYWNoaW5lX3J1bigp
CmZyb20gYSB0YXNrbGV0LiBTbyB0aGVyZSBpcyBhIGdsb2JhbCByZW5kZXp2b3VzLiBJdHMganVz
dCB0aGUgc3RhcnQKb2YgdGhlIHJlbmRlenZvdXMgd2hpY2ggaXMgbW92ZWQgaW50byBhIHRhc2ts
ZXQuIFRoYXQncyBhbGwuCgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
