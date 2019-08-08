Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0547886DE5
	for <lists+xen-devel@lfdr.de>; Fri,  9 Aug 2019 01:27:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvrmM-0004Lt-Cd; Thu, 08 Aug 2019 23:25:06 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=oW8A=WE=eikelenboom.it=linux@srs-us1.protection.inumbo.net>)
 id 1hvrmK-0004Lo-G8
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2019 23:25:04 +0000
X-Inumbo-ID: be064d17-ba33-11e9-8980-bc764e045a96
Received: from server.eikelenboom.it (unknown [91.121.65.215])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id be064d17-ba33-11e9-8980-bc764e045a96;
 Thu, 08 Aug 2019 23:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=eikelenboom.it; s=20180706; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QiLhTY+QDPo7gwMv8bm3ln29SihXhG4Offu9nEIBW7s=; b=G35hTPU5yXZ+b1D7TGF302rClq
 NcjK1qMBPT+4SVBJwRX1uiEGKSELVFE9MGavdou3UF/2LLeYJ430pgJPzP+8Hm4wC8k1bT07802//
 +TcdBImDITM8/nK81M9m41XyRe3tQWpu4ZrcqX5w4BoVZeTncYUfIIsDhlATZOzBg6gE=;
Received: from ip4da85049.direct-adsl.nl ([77.168.80.73]:54282
 helo=[172.16.1.50]) by server.eikelenboom.it with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <linux@eikelenboom.it>)
 id 1hvrmK-0002fT-Bc; Fri, 09 Aug 2019 01:25:04 +0200
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <b2d51bfa-17e0-c843-de2f-9fcba9ebc9f6@eikelenboom.it>
 <dbb536d7-7bfb-27fb-902e-0851434bda96@citrix.com>
 <a6f00518-f761-9362-6040-ee28c22cf334@eikelenboom.it>
 <070124d4-93b6-e0f5-ea69-bcac2b5da7e3@citrix.com>
 <d4fab4d9-f2d1-1c18-2582-1bd1283aa1cd@eikelenboom.it>
 <d0f9713d-0768-dca6-87b3-3d3d3d02207b@citrix.com>
From: Sander Eikelenboom <linux@eikelenboom.it>
Message-ID: <90620f39-97bc-9528-0047-4b4584ca97b1@eikelenboom.it>
Date: Fri, 9 Aug 2019 01:28:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <d0f9713d-0768-dca6-87b3-3d3d3d02207b@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [SUSPECTED SPAM]Xen-unstable staging build broken
 by pvshim patches.
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

T24gMDkvMDgvMjAxOSAwMDo0NCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAwOC8wOC8yMDE5
IDIzOjM0LCBTYW5kZXIgRWlrZWxlbmJvb20gd3JvdGU6Cj4+IE9uIDA4LzA4LzIwMTkgMjM6MTQs
IEFuZHJldyBDb29wZXIgd3JvdGU6Cj4+PiBPbiAwOC8wOC8yMDE5IDIyOjE2LCBTYW5kZXIgRWlr
ZWxlbmJvb20gd3JvdGU6Cj4+Pj4gT24gMDgvMDgvMjAxOSAyMzowNSwgQW5kcmV3IENvb3BlciB3
cm90ZToKPj4+Pj4gT24gMDgvMDgvMjAxOSAyMTo1OSwgU2FuZGVyIEVpa2VsZW5ib29tIHdyb3Rl
Ogo+Pj4+Pj4gSGkgQW5kcmV3LAo+Pj4+Pj4KPj4+Pj4+IEl0IHNlZW1zIHRoZSBwdnNoaW0gcGF0
Y2hlcyBpbiB4ZW4tdW5zdGFibGUgc3RhZ2luZyBicmVhayB0aGUgYnVpbGQgb24gbXkgbWFjaGlu
ZS4KPj4+Pj4+IEkgY2xvbmVkIGEgZnJlc2ggdHJlZSB0byBiZSBzdXJlLCBoYXZlbid0IGNoZWNr
ZWQgd2hpY2ggb2YgdGhlIHR3byBjb21taXRzIGNhdXNlcyBpdDoKPj4+Pj4+IDA2MGY0ZWVlMGZi
NDA4YjMxNjU0ODc3NWFiOTIxZTE2YjdhY2QwZTAgb3IgMzJiMWQ2Mjg4N2QwMWY4NWYwYzFkMmUw
MTAzZjY5Zjc0ZTFmNmZhMwo+Pj4+Pj4KPj4+Pj4+IC0tCj4+Pj4+PiBTYW5kZXIKPj4+Pj4+Cj4+
Pj4+Pgo+Pj4+Pj4KPj4+Pj4+IFsgLWQgLy91c3IvbG9jYWwvbGliL3hlbi9ib290IF0gfHwgL3Vz
ci9zcmMvbmV3L3hlbi11bnN0YWJsZS90b29scy9maXJtd2FyZS8uLi8uLi90b29scy9jcm9zcy1p
bnN0YWxsIC1kIC1tMDc1NSAtcCAvL3Vzci9sb2NhbC9saWIveGVuL2Jvb3QKPj4+Pj4+IFsgLWQg
Ly91c3IvbG9jYWwvbGliL2RlYnVnL3Vzci9sb2NhbC9saWIveGVuL2Jvb3QgXSB8fCAvdXNyL3Ny
Yy9uZXcveGVuLXVuc3RhYmxlL3Rvb2xzL2Zpcm13YXJlLy4uLy4uL3Rvb2xzL2Nyb3NzLWluc3Rh
bGwgLWQgLW0wNzU1IC1wIC8vdXNyL2xvY2FsL2xpYi9kZWJ1Zy91c3IvbG9jYWwvbGliL3hlbi9i
b290Cj4+Pj4+PiBbICEgLWUgaHZtbG9hZGVyL2h2bWxvYWRlciBdIHx8IC91c3Ivc3JjL25ldy94
ZW4tdW5zdGFibGUvdG9vbHMvZmlybXdhcmUvLi4vLi4vdG9vbHMvY3Jvc3MtaW5zdGFsbCAtbTA2
NDQgLXAgaHZtbG9hZGVyL2h2bWxvYWRlciAvL3Vzci9sb2NhbC9saWIveGVuL2Jvb3QKPj4+Pj4+
IC91c3Ivc3JjL25ldy94ZW4tdW5zdGFibGUvdG9vbHMvZmlybXdhcmUvLi4vLi4vdG9vbHMvY3Jv
c3MtaW5zdGFsbCAtbTA2NDQgLXAgc2VhYmlvcy1kaXIvb3V0L2Jpb3MuYmluIC8vdXNyL2xvY2Fs
L2xpYi94ZW4vYm9vdC9zZWFiaW9zLmJpbgo+Pj4+Pj4gL3Vzci9zcmMvbmV3L3hlbi11bnN0YWJs
ZS90b29scy9maXJtd2FyZS8uLi8uLi90b29scy9jcm9zcy1pbnN0YWxsIC1tMDY0NCAtcCB4ZW4t
ZGlyL3hlbi1zaGltIC8vdXNyL2xvY2FsL2xpYi94ZW4vYm9vdC94ZW4tc2hpbQo+Pj4+Pj4gaW5z
dGFsbDogY2Fubm90IHN0YXQgJ3hlbi1kaXIveGVuLXNoaW0nOiBObyBzdWNoIGZpbGUgb3IgZGly
ZWN0b3J5Cj4+Pj4+PiBtYWtlWzRdOiAqKiogW01ha2VmaWxlOjUyOiBpbnN0YWxsXSBFcnJvciAx
Cj4+Pj4+PiBtYWtlWzRdOiBMZWF2aW5nIGRpcmVjdG9yeSAnL3Vzci9zcmMvbmV3L3hlbi11bnN0
YWJsZS90b29scy9maXJtd2FyZScKPj4+Pj4+IG1ha2VbM106ICoqKiBbL3Vzci9zcmMvbmV3L3hl
bi11bnN0YWJsZS90b29scy8uLi90b29scy9SdWxlcy5tazoyMzc6IHN1YmRpci1pbnN0YWxsLWZp
cm13YXJlXSBFcnJvciAyCj4+Pj4+PiBtYWtlWzNdOiBMZWF2aW5nIGRpcmVjdG9yeSAnL3Vzci9z
cmMvbmV3L3hlbi11bnN0YWJsZS90b29scycKPj4+Pj4+IG1ha2VbMl06ICoqKiBbL3Vzci9zcmMv
bmV3L3hlbi11bnN0YWJsZS90b29scy8uLi90b29scy9SdWxlcy5tazoyMzI6IHN1YmRpcnMtaW5z
dGFsbF0gRXJyb3IgMgo+Pj4+Pj4gbWFrZVsyXTogTGVhdmluZyBkaXJlY3RvcnkgJy91c3Ivc3Jj
L25ldy94ZW4tdW5zdGFibGUvdG9vbHMnCj4+Pj4+PiBtYWtlWzFdOiAqKiogW01ha2VmaWxlOjcz
OiBpbnN0YWxsXSBFcnJvciAyCj4+Pj4+PiBtYWtlWzFdOiBMZWF2aW5nIGRpcmVjdG9yeSAnL3Vz
ci9zcmMvbmV3L3hlbi11bnN0YWJsZS90b29scycKPj4+Pj4+IG1ha2U6ICoqKiBbTWFrZWZpbGU6
MTMxOiBpbnN0YWxsLXRvb2xzXSBFcnJvciAyCj4+Pj4+IFRoYXQncyB3ZWlyZC4KPj4+Pj4KPj4+
Pj4gRG8geW91IGhhdmUgdGhlIGZ1bGwgbG9nP8KgIFRoZSByZWFsIGZhaWx1cmUgd2FzIHNvbWV3
aGVyZSBlYXJsaWVyIHdoZXJlCj4+Pj4+IHhlbi1zaGltIGRpZG4ndCBnZXQgc3RhcnRlZC4KPj4+
Pj4KPj4+Pj4gfkFuZHJldwo+Pj4+Pgo+Pj4+IEhtbSBpZiBmb3Jnb3QgYW5kIHRodXMgZm9yZ290
IHRvIG1lbnRpb24gbXkgYnVpbGQgc2NyaXB0IGRpc2FibGVzIHNvbWUgc3R1ZmY6Cj4+Pj4gLi9j
b25maWd1cmUgLS1kaXNhYmxlLXFlbXUtdHJhZGl0aW9uYWwgLS1kaXNhYmxlLXN0dWJkb20gLS1k
aXNhYmxlLWRvY3MgLS1kaXNhYmxlLXJvbWJpb3MKPj4+Pgo+Pj4+IENvdWxkIGJlIHRoYXQgb25l
IG9mIHRob3NlIGRvZXNuJ3Qgd29yayBhbnltb3JlLgo+Pj4gVGhlIG9ubHkgaW50ZXJlc3Rpbmcg
b25lIHdvdWxkIGJlIC0tZGlzYWJsZS1yb21iaW9zLCB3aGljaCBkb2VzIG1ha2UKPj4+IGNoYW5n
ZXMgaW4gdGhpcyBhcmVhIG9mIHRoZSBidWlsZCwgYnV0IGV2ZXJ5dGhpbmcgSSBjaGFuZ2VkIHdh
cyBpbnNpZGUKPj4+IHRoZSB4ZW4tZGlyLyBkaXJlY3Rvcnkgc28gc2hvdWxkbid0IGludGVyYWN0
Lj4KPj4+IH5BbmRyZXcKPj4+Cj4+IEl0IGluZGVlZCBzZWVtcyB0byBiZSBzb21lIGludGVyYWN0
aW9uIHdpdGggLS1kaXNhYmxlLXJvbWJpb3MsIHdpdGgganVzdAo+PiBhIHBsYWluIC4vY29uZmln
dXJlIGl0IGJ1aWxkcyBmaW5lLgo+PiBMb2dzIHdoZW4gYnVpbGRpbmcgd2l0aCAtLWRpc2FibGUt
cm9tYmlvcyBhcmUgYXR0YWNoZWQuCj4gCj4gUmlnaHQuwqAgU28gdGhlIGJ1aWxkIGl0c2VsZiB3
b3JrcywgYnV0IHRoZSBzdWJzZXF1ZW50IGBtYWtlIGluc3RhbGxgIGZhaWxzLgo+IAo+IEFuZCB0
byBjb25maXJtLCBhIGJ1aWxkIG9mIDhkNTRhNmFkZiAodGhlIHBhcmVudCBvZiBteSBmaXJzdCBz
aGltCj4gY29tbWl0KSB3b3JrcyBlbnRpcmVseSBmaW5lPwo+IAo+IH5BbmRyZXcKPiAKSnVzdCBy
ZWNoZWNrZWQsIGFuZCB5ZXMgdGhhdCBidWlsZHMgYW5kIGluc3RhbGxzIGZpbmUgKHdpdGggLS1k
aXNhYmxlLXJvbWJpb3MpLgoKLS0KU2FuZGVyCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
