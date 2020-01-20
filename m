Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B82B41427A0
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jan 2020 10:49:41 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itTdI-0003Bt-NC; Mon, 20 Jan 2020 09:46:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=xaUo=3J=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1itTdH-0003Bo-Jg
 for xen-devel@lists.xenproject.org; Mon, 20 Jan 2020 09:46:07 +0000
X-Inumbo-ID: ab657c3c-3b69-11ea-b93e-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ab657c3c-3b69-11ea-b93e-12813bfff9fa;
 Mon, 20 Jan 2020 09:46:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 8C5AFB30C;
 Mon, 20 Jan 2020 09:45:55 +0000 (UTC)
To: Peter.Kurfer@gdata.de
References: <8e3c6908ce4b48689817b32c538fecf9@gdata.de>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4d99fec9-013a-ff99-8813-2c464be8e970@suse.com>
Date: Mon, 20 Jan 2020 10:46:01 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <8e3c6908ce4b48689817b32c538fecf9@gdata.de>
Content-Language: en-US
Subject: Re: [Xen-devel] Host freezing after "fixing" recursive fault
 starting in multicalls.c
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
Cc: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTguMDEuMjAyMCAxOTo1OSwgUGV0ZXIuS3VyZmVyQGdkYXRhLmRlIHdyb3RlOgo+IEhpLAo+
IAo+IEkgd2FzIGFkdmlzZWQgdG8gYnVtcCB0aGlzIGFsc28gdG8gdGhlIGRldmVsIG1haWxpbmcg
bGlzdCwgYmVjYXVzZSB0aGUgbWVudGlvbmVkIGVycm9yIG1lc3NhZ2Ugd2FzIGFwcGFyZW50bHkg
YWRkZWQgaW4gS2VybmVsIDQuMjAgKGFuZCB1cHdhcmRzKSBhbmQgdGhpcyBrZXJuZWwgdmVyc2lv
bsKgIGlzIG5vdCBicm9hZGx5IGFkb3B0ZWQgYWxyZWFkeSBhbmQgdGhlcmVmb3JlIGl0IGlzIHVu
bGlrZWx5IHRoYXQgYW5vdGhlciB1c2VyIGVuY291bnRlcmVkIGEgc21pbGlhciBwcm9ibGVtIGFs
cmxlYWR5LiAKPiAKPiBPcmlnaW5hbCBtZXNzYWdlIChzZWUgYWxzbyBoZXJlOiBodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL2FyY2hpdmVzL2h0bWwveGVuLXVzZXJzLzIwMjAtMDEvbXNnMDAw
MTMuaHRtbCApCj4gCj4gSSdtIHJ1bm5pbmcgWGVuIDQuMTEuMiBvbiBGZWRvcmEgMzAgd2l0aCBL
ZXJuZWwgdmVyc2lvbnMgNS40LjcgYW5kIDUuNC4xMCBvbiBtdWx0aXBsZSBIUCBzZXJ2ZXJzLgo+
IAo+IFRoZSB3b3JrZmxvdyBJJ20gdHJ5aW5nIHRvIGFjaGlldmUgbG9va3MgbGlrZSB0aGUgZm9s
bG93aW5nOgo+IAo+IC0gYSBWTSBpcyByZXN1bWVkIGZyb20gYSBzbmFwc2hvdCB3aXRoIGEgUHl0
aG9uIHNjcmlwdCB1c2luZyB0aGUgbGlidmlydCBBUEkKPiAtIGl0IGlzIHJ1bm5pbmcgZm9yIGEg
ZmV3IG1pbnV0ZXMsCj4gLSBpdCBnZXRzIHBhdXNlZCBhbmQgZmluYWxseSBkZXN0cm95ZWQgZm9y
IHRlc3RpbmcgcHVycG9zZXMKPiAKPiBBdCBzb21lIHBvaW50IC0gaXQgZG9lc24ndCBzZWVtIHRv
IGJlIGRldGVybWluaXN0aWMgYmVjYXVzZSBzb21ldGltZXMgaXQgIGhhcHBlbnMgZGlyZWN0bHkg
YWZ0ZXIgdGhlIGJvb3QgYW5kIHNvbWV0aW1lcyBhZnRlciBtdWx0aXBsZSBob3VycyAtIGEgIGh1
Z2Ugc3RhY2t0cmFjZSBzdGFydGluZyB3aXRoIGFuIGVycm9yIGluIGBhcmNoL3g4Ni94ZW4vbXVs
dGljYWxscy5jYCAgY2FuIGJlIGZvdW5kIGluIHRoZSBrZXJuZWwgbG9ncyB3aGljaCBlbmRzIHdp
dGggdGhlIG1lc3NhZ2UgJ0ZpeGluZyByZWN1cnNpdmUgZmF1bHQgYnV0IHJlYm9vdCBpcyBuZWVk
ZWQhJy4KPiAKPiBBZnRlciBzb21lIHRpbWUgdGhlIHN5c3RlbSBjb21wbGV0ZWx5IGZyZWV6ZXMg
YW5kIG5lZWRzIHRvIGJlIGhhcmQgIHJlc2V0dGVkIGJlY2F1c2UgaXQgaXMgbm90IHBvc3NpYmxl
IGFueSBtb3JlIHRvIGxvZ2luIHZpYSBTU0guCj4gVGhlIGZyZWV6ZSBpcyBhbHNvIG5vdCBkZXRl
cm1pbmlzdGljIGJ1dCB0aGVyZSBhcmUgbm8gb3RoZXIgY3JpdGljYWwgZXJyb3JzIGluIHRoZSBs
b2dzLCBzbyBpdCBzZWVtcyBzb21laG93IHRvIGJlIHJlbGF0ZWQuCj4gCj4gQmVjYXVzZSB0aGUg
ZnVsbCBzdGFja3RyYWNlIGhhcyByb3VuZCBhYm91dCAzNzAgbGluZXMgSSBhdHRhY2hlZCBpdCBh
cyBhIEdpdEh1YiBHaXN0Ogo+IAo+IGh0dHBzOi8vZ2lzdC5naXRodWIuY29tL2JhZXo5MC8xMzVj
Mzk4NWNiYjZmZDRiNDIwNDI2OWZiMzg0MjIxYQo+IAo+IEknbSBhIGxpdHRsZSBjb25mdXNlZCBh
cyB0byB3aGF0IGVsc2UgdG8gdHJ5IGFuZCBJIGhhdmUgbm8gaWRlYSB3aGF0IHRoZSBwcm9ibGVt
IG1pZ2h0IGJlLgo+IAo+IEFueSBoaW50cy9pZGVhcy9wcm9wb3NhbHM/CgpBIGRlYnVnIGh5cGVy
dmlzb3Igd291bGQgbW9zdCBsaWtlbHkgc3BpdCBvdXQgYSBsb2cgbWVzc2FnZSBmb3IgZXZlcnkK
aW5kaXZpZHVhbCBmYWlsdXJlLiBTZWVpbmcgdGhlc2UgbWVzc2FnZXMgbWF5IGhlbHAgZGlhZ25v
c2luZyB3aGF0J3MKd3JvbmcuIEtub3dpbmcgbW9yZSBvZiB3aGF0IGV4YWN0bHkgdHJpZ2dlcnMg
dGhpcyBtYXkgYWxzbyBoZWxwLCBidXQKanVkZ2luZyBmcm9tIHlvdXIgcmVwb3J0IG1heSBiZSBk
aWZmaWN1bHQgdG8gaXNvbGF0ZS4gT2YgY291cnNlIGFsbApvZiB0aGlzIGlzIGFwcGxpY2FibGUg
b25seSBpZiBuby1vbmUgaGFzIGFscmVhZHkgZm91bmQgYW4gZXhwbGFuYXRpb24KKGFuZCB0aGVu
IHBlcmhhcHMgYWxzbyBhIGZpeCkgZm9yIHRoaXMuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
