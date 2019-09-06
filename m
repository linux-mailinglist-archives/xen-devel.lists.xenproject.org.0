Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8264AB905
	for <lists+xen-devel@lfdr.de>; Fri,  6 Sep 2019 15:14:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i6E24-0000he-14; Fri, 06 Sep 2019 13:12:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ai1O=XB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i6E23-0000hZ-9o
 for xen-devel@lists.xenproject.org; Fri, 06 Sep 2019 13:12:07 +0000
X-Inumbo-ID: ec691ffe-d0a7-11e9-abf5-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ec691ffe-d0a7-11e9-abf5-12813bfff9fa;
 Fri, 06 Sep 2019 13:12:06 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 20B34AFBB;
 Fri,  6 Sep 2019 13:12:05 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <osstest-141063-mainreport@xen.org>
 <5023ad5a-5af9-f399-08f3-fe2716972c2a@suse.com>
 <28cfb44c-8a3a-2eb6-6cef-50e2f926f548@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <028c55a5-dbf3-9611-7b4c-81ca72628e40@suse.com>
Date: Fri, 6 Sep 2019 15:12:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <28cfb44c-8a3a-2eb6-6cef-50e2f926f548@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [xen-unstable-smoke test] 141063: regressions - FAIL
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
 osstest service owner <osstest-admin@xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDYuMDkuMjAxOSAxNDoyOCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAwNi8wOS8yMDE5
IDA4OjI5LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMDYuMDkuMjAxOSAwMDowNCwgb3NzdGVz
dCBzZXJ2aWNlIG93bmVyIHdyb3RlOgo+Pj4gZmxpZ2h0IDE0MTA2MyB4ZW4tdW5zdGFibGUtc21v
a2UgcmVhbCBbcmVhbF0KPj4+IGh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnByb2plY3Qub3JnL29z
c3Rlc3QvbG9ncy8xNDEwNjMvCj4+Pgo+Pj4gUmVncmVzc2lvbnMgOi0oCj4+Pgo+Pj4gVGVzdHMg
d2hpY2ggZGlkIG5vdCBzdWNjZWVkIGFuZCBhcmUgYmxvY2tpbmcsCj4+PiBpbmNsdWRpbmcgdGVz
dHMgd2hpY2ggY291bGQgbm90IGJlIHJ1bjoKPj4+ICBidWlsZC1hbWQ2NCAgICAgICAgICAgICAg
ICAgICA2IHhlbi1idWlsZCAgICAgICAgICAgICAgICBmYWlsIFJFR1IuIHZzLiAxNDEwNDkKPj4g
TG9va3MgbGlrZSB0aGlzIGN1cnJlbnRseSBmYWlscyBhYm91dCBldmVyeSBvdGhlciB0aW1lLCBh
bmQKPj4KPj4gL2hvbWUvb3NzdGVzdC9idWlsZC4xNDEwNjMuYnVpbGQtYW1kNjQveGVuL3Rvb2xz
L2Zpcm13YXJlLy4uLy4uL3Rvb2xzL2Nyb3NzLWluc3RhbGwgLW0wNjQ0IC1wIHhlbi1kaXIveGVu
LXNoaW0gL2hvbWUvb3NzdGVzdC9idWlsZC4xNDEwNjMuYnVpbGQtYW1kNjQveGVuL2Rpc3QvaW5z
dGFsbC91c3IvbG9jYWwvbGliL3hlbi9ib290L3hlbi1zaGltCj4+IGluc3RhbGw6IGNhbm5vdCBz
dGF0ICd4ZW4tZGlyL3hlbi1zaGltJzogTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeQo+PiBNYWtl
ZmlsZTo0ODogcmVjaXBlIGZvciB0YXJnZXQgJ2luc3RhbGwnIGZhaWxlZAo+PiBtYWtlWzRdOiBM
ZWF2aW5nIGRpcmVjdG9yeSAnL2hvbWUvb3NzdGVzdC9idWlsZC4xNDEwNjMuYnVpbGQtYW1kNjQv
eGVuL3Rvb2xzL2Zpcm13YXJlJwo+PiBtYWtlWzRdOiAqKiogW2luc3RhbGxdIEVycm9yIDEKPj4K
Pj4gc3VnZ2VzdHMgdG8gbWUgdGhhdCB0aGUgZnVydGhlciBhbW91bnQgb2YgZHVjdCB0YXBlIHB1
dCBpbgo+PiBwbGFjZSBieSBhMzQyOTAwZDQ4IHN0aWxsIHdhc24ndCBlbm91Z2guCj4gCj4gUmln
aHQuwqAgSSBkb24ndCBoYXZlIHRpbWUgdG8gaW52ZXN0aWdhdGUgZnVydGhlci7CoCBJJ2xsIHJl
dmVydCB0aGUKPiBvcmlnaW5hbCBwYXRjaGVzIHdoaWNoIGNhdXNlZCB0aGlzLCBhcyBkb2luZyBz
byB3aWxsIG1vc3QgbGlrZWx5IHJlc29sdmUKPiB0aGUgaW50ZXJtaXR0ZW50IHB2LXNoaW0gdGVz
dCBpc3N1ZXMuCgpIbW0sIHdoeSBkaWQgeW91IGFsc28gcmV2ZXJ0IHRoZSBmb2xsb3ctb24gTWFr
ZWZpbGUgYWRqdXN0bWVudD8KVGhhdCB3YXMgcmlnaHQsIHdhc24ndCBpdD8KCkphbgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
