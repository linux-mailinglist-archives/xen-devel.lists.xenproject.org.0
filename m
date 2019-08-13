Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5DE48B790
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2019 13:50:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxVHO-0008Kf-56; Tue, 13 Aug 2019 11:47:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=e9Ym=WJ=eikelenboom.it=linux@srs-us1.protection.inumbo.net>)
 id 1hxVHN-0008Ka-2y
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2019 11:47:53 +0000
X-Inumbo-ID: 2d470676-bdc0-11e9-acc0-df7037db024f
Received: from server.eikelenboom.it (unknown [91.121.65.215])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2d470676-bdc0-11e9-acc0-df7037db024f;
 Tue, 13 Aug 2019 11:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=eikelenboom.it; s=20180706; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6B4r+kACVqlBJ5XXzfOczpeyhzyAWV5hruoPFquxhdE=; b=DcLXLcBLh9vijs4ALu6RaHWD/C
 Y2cD35QwYS/bAAdCQuS9C0RD7y1IYnZVVl3alSMF+B86VWKVPBBblq0MWRriL1hRmJOr/QkCpqOW6
 KTbHtyhc0HY0egP4dEZT5c/TUjnJdFGTVGfqbtH1GwdPRb/g8kcf9+6exS9554O2ZRCA=;
Received: from ip4da85049.direct-adsl.nl ([77.168.80.73]:55733
 helo=[10.97.34.6]) by server.eikelenboom.it with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <linux@eikelenboom.it>)
 id 1hxVHQ-0002ob-KU; Tue, 13 Aug 2019 13:47:56 +0200
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <b2d51bfa-17e0-c843-de2f-9fcba9ebc9f6@eikelenboom.it>
 <dbb536d7-7bfb-27fb-902e-0851434bda96@citrix.com>
 <a6f00518-f761-9362-6040-ee28c22cf334@eikelenboom.it>
 <070124d4-93b6-e0f5-ea69-bcac2b5da7e3@citrix.com>
 <d4fab4d9-f2d1-1c18-2582-1bd1283aa1cd@eikelenboom.it>
 <d0f9713d-0768-dca6-87b3-3d3d3d02207b@citrix.com>
 <90620f39-97bc-9528-0047-4b4584ca97b1@eikelenboom.it>
 <d8fc6365-525a-6495-e625-ecff2cf2e20e@citrix.com>
From: Sander Eikelenboom <linux@eikelenboom.it>
Message-ID: <7a93257f-4199-8cae-57d4-a14555795275@eikelenboom.it>
Date: Tue, 13 Aug 2019 13:51:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <d8fc6365-525a-6495-e625-ecff2cf2e20e@citrix.com>
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

T24gMTMvMDgvMjAxOSAxMzoyMSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAwOS8wOC8yMDE5
IDAwOjI4LCBTYW5kZXIgRWlrZWxlbmJvb20gd3JvdGU6Cj4+IE9uIDA5LzA4LzIwMTkgMDA6NDQs
IEFuZHJldyBDb29wZXIgd3JvdGU6Cj4+PiBPbiAwOC8wOC8yMDE5IDIzOjM0LCBTYW5kZXIgRWlr
ZWxlbmJvb20gd3JvdGU6Cj4+Pj4gT24gMDgvMDgvMjAxOSAyMzoxNCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPj4+Pj4gT24gMDgvMDgvMjAxOSAyMjoxNiwgU2FuZGVyIEVpa2VsZW5ib29tIHdyb3Rl
Ogo+Pj4+Pj4gT24gMDgvMDgvMjAxOSAyMzowNSwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4+Pj4+
PiBPbiAwOC8wOC8yMDE5IDIxOjU5LCBTYW5kZXIgRWlrZWxlbmJvb20gd3JvdGU6Cj4+Pj4+Pj4+
IEhpIEFuZHJldywKPj4+Pj4+Pj4KPj4+Pj4+Pj4gSXQgc2VlbXMgdGhlIHB2c2hpbSBwYXRjaGVz
IGluIHhlbi11bnN0YWJsZSBzdGFnaW5nIGJyZWFrIHRoZSBidWlsZCBvbiBteSBtYWNoaW5lLgo+
Pj4+Pj4+PiBJIGNsb25lZCBhIGZyZXNoIHRyZWUgdG8gYmUgc3VyZSwgaGF2ZW4ndCBjaGVja2Vk
IHdoaWNoIG9mIHRoZSB0d28gY29tbWl0cyBjYXVzZXMgaXQ6Cj4+Pj4+Pj4+IDA2MGY0ZWVlMGZi
NDA4YjMxNjU0ODc3NWFiOTIxZTE2YjdhY2QwZTAgb3IgMzJiMWQ2Mjg4N2QwMWY4NWYwYzFkMmUw
MTAzZjY5Zjc0ZTFmNmZhMwo+Pj4+Pj4+Pgo+Pj4+Pj4+PiAtLQo+Pj4+Pj4+PiBTYW5kZXIKPj4+
Pj4+Pj4KPj4+Pj4+Pj4KPj4+Pj4+Pj4KPj4+Pj4+Pj4gWyAtZCAvL3Vzci9sb2NhbC9saWIveGVu
L2Jvb3QgXSB8fCAvdXNyL3NyYy9uZXcveGVuLXVuc3RhYmxlL3Rvb2xzL2Zpcm13YXJlLy4uLy4u
L3Rvb2xzL2Nyb3NzLWluc3RhbGwgLWQgLW0wNzU1IC1wIC8vdXNyL2xvY2FsL2xpYi94ZW4vYm9v
dAo+Pj4+Pj4+PiBbIC1kIC8vdXNyL2xvY2FsL2xpYi9kZWJ1Zy91c3IvbG9jYWwvbGliL3hlbi9i
b290IF0gfHwgL3Vzci9zcmMvbmV3L3hlbi11bnN0YWJsZS90b29scy9maXJtd2FyZS8uLi8uLi90
b29scy9jcm9zcy1pbnN0YWxsIC1kIC1tMDc1NSAtcCAvL3Vzci9sb2NhbC9saWIvZGVidWcvdXNy
L2xvY2FsL2xpYi94ZW4vYm9vdAo+Pj4+Pj4+PiBbICEgLWUgaHZtbG9hZGVyL2h2bWxvYWRlciBd
IHx8IC91c3Ivc3JjL25ldy94ZW4tdW5zdGFibGUvdG9vbHMvZmlybXdhcmUvLi4vLi4vdG9vbHMv
Y3Jvc3MtaW5zdGFsbCAtbTA2NDQgLXAgaHZtbG9hZGVyL2h2bWxvYWRlciAvL3Vzci9sb2NhbC9s
aWIveGVuL2Jvb3QKPj4+Pj4+Pj4gL3Vzci9zcmMvbmV3L3hlbi11bnN0YWJsZS90b29scy9maXJt
d2FyZS8uLi8uLi90b29scy9jcm9zcy1pbnN0YWxsIC1tMDY0NCAtcCBzZWFiaW9zLWRpci9vdXQv
Ymlvcy5iaW4gLy91c3IvbG9jYWwvbGliL3hlbi9ib290L3NlYWJpb3MuYmluCj4+Pj4+Pj4+IC91
c3Ivc3JjL25ldy94ZW4tdW5zdGFibGUvdG9vbHMvZmlybXdhcmUvLi4vLi4vdG9vbHMvY3Jvc3Mt
aW5zdGFsbCAtbTA2NDQgLXAgeGVuLWRpci94ZW4tc2hpbSAvL3Vzci9sb2NhbC9saWIveGVuL2Jv
b3QveGVuLXNoaW0KPj4+Pj4+Pj4gaW5zdGFsbDogY2Fubm90IHN0YXQgJ3hlbi1kaXIveGVuLXNo
aW0nOiBObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5Cj4+Pj4+Pj4+IG1ha2VbNF06ICoqKiBbTWFr
ZWZpbGU6NTI6IGluc3RhbGxdIEVycm9yIDEKPj4+Pj4+Pj4gbWFrZVs0XTogTGVhdmluZyBkaXJl
Y3RvcnkgJy91c3Ivc3JjL25ldy94ZW4tdW5zdGFibGUvdG9vbHMvZmlybXdhcmUnCj4+Pj4+Pj4+
IG1ha2VbM106ICoqKiBbL3Vzci9zcmMvbmV3L3hlbi11bnN0YWJsZS90b29scy8uLi90b29scy9S
dWxlcy5tazoyMzc6IHN1YmRpci1pbnN0YWxsLWZpcm13YXJlXSBFcnJvciAyCj4+Pj4+Pj4+IG1h
a2VbM106IExlYXZpbmcgZGlyZWN0b3J5ICcvdXNyL3NyYy9uZXcveGVuLXVuc3RhYmxlL3Rvb2xz
Jwo+Pj4+Pj4+PiBtYWtlWzJdOiAqKiogWy91c3Ivc3JjL25ldy94ZW4tdW5zdGFibGUvdG9vbHMv
Li4vdG9vbHMvUnVsZXMubWs6MjMyOiBzdWJkaXJzLWluc3RhbGxdIEVycm9yIDIKPj4+Pj4+Pj4g
bWFrZVsyXTogTGVhdmluZyBkaXJlY3RvcnkgJy91c3Ivc3JjL25ldy94ZW4tdW5zdGFibGUvdG9v
bHMnCj4+Pj4+Pj4+IG1ha2VbMV06ICoqKiBbTWFrZWZpbGU6NzM6IGluc3RhbGxdIEVycm9yIDIK
Pj4+Pj4+Pj4gbWFrZVsxXTogTGVhdmluZyBkaXJlY3RvcnkgJy91c3Ivc3JjL25ldy94ZW4tdW5z
dGFibGUvdG9vbHMnCj4+Pj4+Pj4+IG1ha2U6ICoqKiBbTWFrZWZpbGU6MTMxOiBpbnN0YWxsLXRv
b2xzXSBFcnJvciAyCj4+Pj4+Pj4gVGhhdCdzIHdlaXJkLgo+Pj4+Pj4+Cj4+Pj4+Pj4gRG8geW91
IGhhdmUgdGhlIGZ1bGwgbG9nP8KgIFRoZSByZWFsIGZhaWx1cmUgd2FzIHNvbWV3aGVyZSBlYXJs
aWVyIHdoZXJlCj4+Pj4+Pj4geGVuLXNoaW0gZGlkbid0IGdldCBzdGFydGVkLgo+Pj4+Pj4+Cj4+
Pj4+Pj4gfkFuZHJldwo+Pj4+Pj4+Cj4+Pj4+PiBIbW0gaWYgZm9yZ290IGFuZCB0aHVzIGZvcmdv
dCB0byBtZW50aW9uIG15IGJ1aWxkIHNjcmlwdCBkaXNhYmxlcyBzb21lIHN0dWZmOgo+Pj4+Pj4g
Li9jb25maWd1cmUgLS1kaXNhYmxlLXFlbXUtdHJhZGl0aW9uYWwgLS1kaXNhYmxlLXN0dWJkb20g
LS1kaXNhYmxlLWRvY3MgLS1kaXNhYmxlLXJvbWJpb3MKPj4+Pj4+Cj4+Pj4+PiBDb3VsZCBiZSB0
aGF0IG9uZSBvZiB0aG9zZSBkb2Vzbid0IHdvcmsgYW55bW9yZS4KPj4+Pj4gVGhlIG9ubHkgaW50
ZXJlc3Rpbmcgb25lIHdvdWxkIGJlIC0tZGlzYWJsZS1yb21iaW9zLCB3aGljaCBkb2VzIG1ha2UK
Pj4+Pj4gY2hhbmdlcyBpbiB0aGlzIGFyZWEgb2YgdGhlIGJ1aWxkLCBidXQgZXZlcnl0aGluZyBJ
IGNoYW5nZWQgd2FzIGluc2lkZQo+Pj4+PiB0aGUgeGVuLWRpci8gZGlyZWN0b3J5IHNvIHNob3Vs
ZG4ndCBpbnRlcmFjdC4+Cj4+Pj4+IH5BbmRyZXcKPj4+Pj4KPj4+PiBJdCBpbmRlZWQgc2VlbXMg
dG8gYmUgc29tZSBpbnRlcmFjdGlvbiB3aXRoIC0tZGlzYWJsZS1yb21iaW9zLCB3aXRoIGp1c3QK
Pj4+PiBhIHBsYWluIC4vY29uZmlndXJlIGl0IGJ1aWxkcyBmaW5lLgo+Pj4+IExvZ3Mgd2hlbiBi
dWlsZGluZyB3aXRoIC0tZGlzYWJsZS1yb21iaW9zIGFyZSBhdHRhY2hlZC4KPj4+IFJpZ2h0LsKg
IFNvIHRoZSBidWlsZCBpdHNlbGYgd29ya3MsIGJ1dCB0aGUgc3Vic2VxdWVudCBgbWFrZSBpbnN0
YWxsYCBmYWlscy4KPj4+Cj4+PiBBbmQgdG8gY29uZmlybSwgYSBidWlsZCBvZiA4ZDU0YTZhZGYg
KHRoZSBwYXJlbnQgb2YgbXkgZmlyc3Qgc2hpbQo+Pj4gY29tbWl0KSB3b3JrcyBlbnRpcmVseSBm
aW5lPwo+Pj4KPj4+IH5BbmRyZXcKPj4+Cj4+IEp1c3QgcmVjaGVja2VkLCBhbmQgeWVzIHRoYXQg
YnVpbGRzIGFuZCBpbnN0YWxscyBmaW5lICh3aXRoIC0tZGlzYWJsZS1yb21iaW9zKS4KPiAKPiBX
aGljaCBiYXNlIGRpc3RybyBhcmUgeW91IHVzaW5nP8KgIEknbSB1bmFibGUgdG8gcmVwcm9kdWNl
IGFueSBidWlsZAo+IGZhaWx1cmVzIGxvY2FsbHkuCj4gCj4gfkFuZHJldwo+IAoKRGViaWFuIDEw
IC8gQnVzdGVyLgoKLS0KU2FuZGVyCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
