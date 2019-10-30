Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B51AE9928
	for <lists+xen-devel@lfdr.de>; Wed, 30 Oct 2019 10:29:48 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iPkEG-0000vs-7h; Wed, 30 Oct 2019 09:25:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=iUym=YX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iPkEF-0000vn-CZ
 for xen-devel@lists.xenproject.org; Wed, 30 Oct 2019 09:25:23 +0000
X-Inumbo-ID: 2f89546a-faf7-11e9-951f-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2f89546a-faf7-11e9-951f-12813bfff9fa;
 Wed, 30 Oct 2019 09:25:17 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E525BB636;
 Wed, 30 Oct 2019 09:25:16 +0000 (UTC)
To: osstest service owner <osstest-admin@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <osstest-143302-mainreport@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9dce0bf0-cce9-4af2-f14b-602069adb51f@suse.com>
Date: Wed, 30 Oct 2019 10:25:18 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <osstest-143302-mainreport@xen.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [xen-4.12-testing test] 143302: regressions - FAIL
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
Cc: Juergen Gross <jgross@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkuMTAuMjAxOSAyMzo1Miwgb3NzdGVzdCBzZXJ2aWNlIG93bmVyIHdyb3RlOgo+IGZsaWdo
dCAxNDMzMDIgeGVuLTQuMTItdGVzdGluZyByZWFsIFtyZWFsXQo+IGh0dHA6Ly9sb2dzLnRlc3Qt
bGFiLnhlbnByb2plY3Qub3JnL29zc3Rlc3QvbG9ncy8xNDMzMDIvCj4gCj4gUmVncmVzc2lvbnMg
Oi0oCj4gCj4gVGVzdHMgd2hpY2ggZGlkIG5vdCBzdWNjZWVkIGFuZCBhcmUgYmxvY2tpbmcsCj4g
aW5jbHVkaW5nIHRlc3RzIHdoaWNoIGNvdWxkIG5vdCBiZSBydW46Cj4gIHRlc3QtYW1kNjQtaTM4
Ni14bC1xZW11dC13czE2LWFtZDY0ICA3IHhlbi1ib290ICAgICAgICAgIGZhaWwgUkVHUi4gdnMu
IDE0MzE5MAo+ICB0ZXN0LWFtZDY0LWFtZDY0LWxpdmVwYXRjaCAgICA3IHhlbi1ib290ICAgICAg
ICAgICAgICAgICBmYWlsIFJFR1IuIHZzLiAxNDMxOTAKPiAgdGVzdC1hbWQ2NC1pMzg2LWxpYnZp
cnQtcWVtdXUtZGViaWFuaHZtLWFtZDY0LXhzbSAxNCBndWVzdC1zYXZlcmVzdG9yZS4yIGZhaWwg
UkVHUi4gdnMuIDE0MzE5MAo+ICB0ZXN0LWFtZDY0LWkzODYteGwtcmF3ICAgICAgMTkgZ3Vlc3Qt
c3RhcnQvZGViaWFuLnJlcGVhdCBmYWlsIFJFR1IuIHZzLiAxNDMxOTAKCkxvb2tpbmcgYXQgdGhp
cyBvbmUgSSBzZWUKCjIwMTktMTAtMjkgMTk6NDA6NTkgWiBleGVjdXRpbmcgc3NoIC4uLiByb290
QDE3Mi4xNi4xNDQuMjkgbWtkaXIgLXAgL3Zhci9saWIveGVuL2ltYWdlcy9kZWJpYW4KbW91bnQg
L2Rldi9tYXBwZXIvY2hhcmRvbm5heTEtLXZnLWRlYmlhbi5zdHJldGNoLmd1ZXN0Lm9zc3Rlc3Qt
LWRpc2sgL3Zhci9saWIveGVuL2ltYWdlcy9kZWJpYW47CiAKbW91bnQ6IC9kZXYvbWFwcGVyL2No
YXJkb25uYXkxLS12Zy1kZWJpYW4uc3RyZXRjaC5ndWVzdC5vc3N0ZXN0LS1kaXNrIGlzIGFscmVh
ZHkgbW91bnRlZCBvciAvdmFyL2xpYi94ZW4vaW1hZ2VzL2RlYmlhbiBidXN5CiAgICAgICAvZGV2
L21hcHBlci9jaGFyZG9ubmF5MS0tdmctZGViaWFuLnN0cmV0Y2guZ3Vlc3Qub3NzdGVzdC0tZGlz
ayBpcyBhbHJlYWR5IG1vdW50ZWQgb24gL3Zhci9saWIveGVuL2ltYWdlcy9kZWJpYW4KMjAxOS0x
MC0yOSAxOTo0MTowMCBaIGNvbW1hbmQgbm9uemVybyB3YWl0c3RhdHVzIDgxOTI6IHRpbWVvdXQg
NjAgc3NoIC1vIFN0cmljdEhvc3RLZXlDaGVja2luZz1ubyAtbyBCYXRjaE1vZGU9eWVzIC1vIENv
bm5lY3RUaW1lb3V0PTEwMCAtbyBTZXJ2ZXJBbGl2ZUludGVydmFsPTEwMCAtbyBQYXNzd29yZEF1
dGhlbnRpY2F0aW9uPW5vIC1vIENoYWxsZW5nZVJlc3BvbnNlQXV0aGVudGljYXRpb249bm8gLW8g
VXNlcktub3duSG9zdHNGaWxlPXRtcC90Lmtub3duX2hvc3RzXzE0MzMwMi50ZXN0LWFtZDY0LWkz
ODYteGwtcmF3IHJvb3RAMTcyLjE2LjE0NC4yOSBta2RpciAtcCAvdmFyL2xpYi94ZW4vaW1hZ2Vz
L2RlYmlhbgptb3VudCAvZGV2L21hcHBlci9jaGFyZG9ubmF5MS0tdmctZGViaWFuLnN0cmV0Y2gu
Z3Vlc3Qub3NzdGVzdC0tZGlzayAvdmFyL2xpYi94ZW4vaW1hZ2VzL2RlYmlhbjsKIApzdGF0dXMg
ODE5MiBhdCBPc3N0ZXN0L1Rlc3RTdXBwb3J0LnBtIGxpbmUgNTUwLgoKSXQgc2hvdWxkbid0IGJl
IHRpbWVvdXQsIHNvIEkgYXNzdW1lIGl0J3MgdGhlIG1vdW50IHRoYXQgZmFpbHMuClNvbWUgbmV3
IGdsaXRjaCBpbiBvc3N0ZXN0IChzZWVuIGFsc28gb24gdGhlIG1vc3QgcmVjZW50IDQuMTEKZmxp
Z2h0KT8gT3IgYW0gSSBtaXNyZWFkaW5nIHRoZSBhYm92ZT8gSW4gYW55IGV2ZW50IEkgY2FuJ3Qg
c3BvdAphIHNpbWlsYXIgbWtkaXIgaW52b2NhdGlvbiBpbiBhIHJhbmRvbSBvdGhlciB0ZXN0J3MK
Z3Vlc3Qtc3RhcnQvZGViaWFuLnJlcGVhdCBzdGVwLgoKV2hhdCBJIGZpbmQgZnVydGhlciBwdXp6
bGluZyAoYWxiZWl0IG5vdCBuZWNlc3NhcmlseSByZWxhdGVkIHRvIHRoZQp0ZXN0IGZhaWx1cmUs
IGF0IGxlYXN0IHRoZSBzZXJpYWwgbG9ncyBkb24ndCBpbW1lZGlhdGVseSBzdWdnZXN0IHNvCmV4
Y2VwdCBmb3IgdGhlIGd1ZXN0IG5vIGxvbmdlciBiZWluZyB0aGVyZSB3aGVuIHRoZSBkZWJ1ZyBr
ZXlzIGdldApwcm9jZXNzZWQsIGJ1dCB0aGlzIG1heSB3ZWxsIGhhdmUgYmVlbiBhIGd1ZXN0IG9m
IGEgcHJldmlvdXMgdGVzdApzdGVwKSBhcmUgaW5zdGFuY2VzIG9mCgooWEVOKSBkMjUgTDFURi12
dWxuZXJhYmxlIEwxZSA4MDAwMDAwMjAwMDAwMDAwIC0gU2hhZG93aW5nCgpib3RoIGhlcmUgYW5k
IGFnYWluIGluIHRoZSBjb3JyZXNwb25kaW5nIDQuMTEgYnJhbmNoIGZsaWdodC4gSSBhbHNvCmRv
bid0IHRoaW5rIGl0J3MgcHVyZSBjb2luY2lkZW5jZSB0aGF0IGl0J3MgZDEsIGQyLCBhbmQgZDI1
IGluIGJvdGgKY2FzZXMuIFlldCB0aGlzIG9jY3VycmluZyBwcmV0dHkgc29vbiBhZnRlciB0aGUg
Z3Vlc3Qgc3RhcnRzLCBJJ2QKZmluZCBpdCBtb3JlIGxpa2VseSBpZiBhbGwgZ3Vlc3QgYm9vdCBp
bnN0YW5jZXMgc2hvd2VkIGl0LiBJbiBhbnkKZXZlbnQgSSdkIGxpa2UgdG8gYXNrIGlmIGFueW9u
ZSAoSsO8cmdlbiBpbiBwYXJ0aWN1bGFyKSBoYXMgYW4gaWRlYQp3aGF0IGJvZ3VzIG9wZXJhdGlv
biAzMi1iaXQgTGludXggbWF5IGJlIGRvaW5nIGhlcmUuIElzIHRoZXJlCnBvc3NpYmx5IHN0aWxs
IHNvbWUgMi1wYXJ0IFBURSB1cGRhdGUgbGVmdCwgd2hlcmUgdGhlIGxvdyBoYWxmIGdldHMKY2xl
YXJlZCBvZmYgb2YgYSBwcmV2aW91c2x5IGZpbmUgZW50cnk/CgpKYW4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
