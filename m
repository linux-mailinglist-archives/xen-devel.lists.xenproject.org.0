Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C641AF4627
	for <lists+xen-devel@lfdr.de>; Fri,  8 Nov 2019 12:40:39 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iT2aW-0002LQ-25; Fri, 08 Nov 2019 11:38:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=PKBE=ZA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iT2aT-0002LK-Ub
 for xen-devel@lists.xenproject.org; Fri, 08 Nov 2019 11:37:57 +0000
X-Inumbo-ID: 34ccb7e2-021c-11ea-9631-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 34ccb7e2-021c-11ea-9631-bc764e2007e4;
 Fri, 08 Nov 2019 11:37:56 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 29A46AD3B;
 Fri,  8 Nov 2019 11:37:55 +0000 (UTC)
To: "Durrant, Paul" <pdurrant@amazon.com>
References: <f9e3fb8cadf44352851d865e850c6525@EX13D32EUC003.ant.amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <86d72e83-abf6-bef3-418f-49a69545fcb5@suse.com>
Date: Fri, 8 Nov 2019 12:38:05 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <f9e3fb8cadf44352851d865e850c6525@EX13D32EUC003.ant.amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] max_grant_frames/max_maptrack_frames
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDguMTEuMjAxOSAwOTo0NSwgIER1cnJhbnQsIFBhdWwgIHdyb3RlOgo+IFdoZW4gcGVyLWRv
bWFpbiBvcHRpb25zIGZvciBtYXhpbXVtIGdyYW50IGFuZCBtYXB0cmFjayBmcmFtZXMgY2FtZSBp
biAoaW4gNC4xMD8pIFhlbidzIGJlaGF2aW91ciB3LnIudC4gdG8gdGhlIGdsb2JhbCBjb21tYW5k
IGxpbmUgdmFsdWVzIChnbnR0YWJfbWF4X2ZyYW1lcyBhbmQgZ250dGFiX21heF9tYXB0cmFja19m
cmFtZXMgcmVzcGVjdGl2ZWx5KSByZWdyZXNzZWQKPiAKPiBGb3IgZXhhbXBsZSwgYSBob3N0IHJ1
bm5pbmcgYSBwcmlvciB2ZXJzaW9uIG9mIFhlbiB3aXRoIGEgY29tbWFuZCBsaW5lIHNldHRpbmcg
Z250dGFiX21heF9mcmFtZXM9MTI4IHdvdWxkIGhhdmUgYWxsIG9mIGl0cyBkb21VcyBydW5uaW5n
IHdpdGggMTI4IGZyYW1lcy4gSG93ZXZlciwgYWZ0ZXIgdXBkYXRlIHRvIGEgbmV3ZXIgWGVuLCB0
aGV5IHdpbGwgb25seSBnZXQgMzIgZnJhbWVzICh1bmxlc3MgdGhlIGhvc3QgaXMgcGFydGljdWxh
cmx5IGxhcmdlLCBpbiB3aGljaCBjYXNlIHRoZXkgd2lsbCBnZXQgNjQpLiBXaHkgaXMgdGhpcz8g
SXQncyBiZWNhdXNlIG5laXRoZXIgeGwuY2ZnIGZpbGVzLCBub3IgeGwuY29uZiwgd2lsbCBzcGVj
aWZ5IHZhbHVlcyAoYmVjYXVzZSB0aGUgc2NlbmFyaW8gaXMgYW4gdXBkYXRlIGZyb20gYW4gb2xk
ZXIgaW5zdGFsbGF0aW9uKSBhbmQgc28gdGhlIGhhcmRjb2RlZCAzMi82NCBkZWZhdWx0IGFwcGxp
ZXMuIEhlbmNlIHNvbWUgZG9tVXMgd2l0aCBsYXJnZSBudW1iZXJzIG9mIFBWIGRldmljZXMgc3Rh
cnQgZmFpbGluZyAob3IgYXQgbGVhc3Qgc3Vic3RhbnRpYWxseSBzbG93IGRvd24pIGFuZCBhZG1p
bnMgc3RhcnQgd29uZGVyaW5nIHdoYXQncyBnb2luZyBvbi4KPiAKPiBTbyBob3cgYmVzdCB0byBm
aXggdGhpcz8KPiAKPiBGb3IgdGhlIHNha2Ugb2YgYSBxdWljayBmaXggZm9yIHRoZSByZWdyZXNz
aW9uLCBhbmQgZWFzZSBvZiBiYWNrLXBvcnRpbmcsIEkgdGhpbmsgaXQgd291bGQgYmUgYmVzdCB0
byBhZGQgYSBjaGVjayBpbiBkb21haW5fY3JlYXRlKCkgYW5kIGNyZWF0ZSB0aGUgZ3JhbnQgdGFi
bGUgd2l0aCBwYXJhbWV0ZXJzIHdoaWNoIGFyZSB0aGUgbGFyZ2VyIG9mIHRoZSB0b29sc3RhY2sg
Y29uZmlndXJlZCB2YWx1ZSBhbmQgdGhlIGNvcnJlc3BvbmRpbmcgY29tbWFuZCBsaW5lIHZhbHVl
LgoKSG93IGFib3V0IHBlb3BsZSBzaW1wbHkgc2V0dGluZyB0aGUgdmFsdWUgaW4geGwuY29uZiwg
aWYgaW5kZWVkIGluIGNhbiBiZQpzZXQgdGhlcmU/Cgo+IFRoaXMgZG9lcywgaG93ZXZlciwgZ28g
YWdhaW5zdCB0aGUgcmVjZW50IGRpcmVjdGlvbiBvZiB0aGUgdG9vbHN0YWNrIGdldHRpbmcgZXhh
Y3RseSB3aGF0IGl0IGFza2VkIGZvci4gU28gZm9yIHRoZSBsb25nZXIgdGVybSBJIGFtIHdvbmRl
cmluZyB3aGV0aGVyIHRoZXJlIG91Z2h0IHRvIGJlIGEgd2F5IGZvciB0aGUgdG9vbHN0YWNrIHRv
IHF1ZXJ5IHRoZSBnbG9iYWxseSBjb25maWd1cmVkIGdyYW50IHRhYmxlIGxpbWl0cy4gQSBHTlRU
QUJPUCBzZWVtcyB0aGUgd3JvbmcgY2FuZGlkYXRlIGZvciB0aGlzLCBzaW5jZSBHTlRUQUJPUHMg
YXJlIHBlci1kb21haW4sIHNvIEknbSB3b25kZXJpbmcgYWJvdXQgYSBuZXcgc3lzY3RsIHRvIHJl
dHVybiB0aGUgdmFsdWUgb2YgYSBuYW1lZCBjb21tYW5kIGxpbmUgcGFyYW1ldGVyLgoKU3VjaCBh
IHNlcmllcyB3YXMgYWxyZWFkeSBwb3N0ZWQgKGFuZCBldmVuIGhhZCBzb21lIHJldmlldywgc28g
aXQncwphbHJlYWR5IGF0IHY0LCBidXQgaWlyYyBubyB1cGRhdGUgaGFzIGJlZW4gcHJvdmlkZWQg
c2luY2UgTWF5KToKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9odG1sL3hl
bi1kZXZlbC8yMDE5LTA1L21zZzAyMjA2Lmh0bWwKCkphbgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
