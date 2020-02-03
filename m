Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C8A150638
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2020 13:34:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iyasY-0001bG-4V; Mon, 03 Feb 2020 12:31:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2xfu=3X=eikelenboom.it=linux@srs-us1.protection.inumbo.net>)
 id 1iyasW-0001bB-Ig
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2020 12:31:00 +0000
X-Inumbo-ID: 076f6516-4681-11ea-8e55-12813bfff9fa
Received: from server.eikelenboom.it (unknown [91.121.65.215])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 076f6516-4681-11ea-8e55-12813bfff9fa;
 Mon, 03 Feb 2020 12:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=eikelenboom.it; s=20180706; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OmJdC4wJIg50Rv85f9J9JLZE4onN/pQAiOBnLL1HHgQ=; b=EnEdpDMCL+hRxJhg8eU5vaKdSr
 L6bcrubqaVqmcwMqQ9Ahx/4olB8PvUgbsBFkKZyLJLbrvIl96ZnP16ArhrTCRH5GEogYa1Yn2J3i4
 0bqvnHv4h1ZUGsbfSI+33t50pmtQRODXMy8EIJfSj0tUmaVuhihsk6TLhnWExjHOz11w=;
Received: from ip4da85049.direct-adsl.nl ([77.168.80.73]:55990
 helo=[10.97.34.6]) by server.eikelenboom.it with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <linux@eikelenboom.it>)
 id 1iyau4-0000tt-87; Mon, 03 Feb 2020 13:32:36 +0100
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <ebd9cf75-36cd-c064-661d-88a49445ecce@eikelenboom.it>
 <20200203122319.GU4679@Air-de-Roger>
From: Sander Eikelenboom <linux@eikelenboom.it>
Message-ID: <3bcb67a6-3156-f4b0-5ac6-58ca61038cec@eikelenboom.it>
Date: Mon, 3 Feb 2020 13:30:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200203122319.GU4679@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] Xen-unstable: pci-passthrough regression bisected
 to: x86/smp: use APIC ALLBUT destination shorthand when possible
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

T24gMDMvMDIvMjAyMCAxMzoyMywgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBNb24sIEZl
YiAwMywgMjAyMCBhdCAwOTozMzo1MUFNICswMTAwLCBTYW5kZXIgRWlrZWxlbmJvb20gd3JvdGU6
Cj4+IEhpIFJvZ2VyLAo+Pgo+PiBMYXN0IHdlZWsgSSBlbmNvdW50ZXJlZCBhbiBpc3N1ZSB3aXRo
IHRoZSBQQ0ktcGFzc3Rocm91Z2ggb2YgYSBVU0IgY29udHJvbGxlci4gCj4+IEluIHRoZSBndWVz
dCBJIGdldDoKPj4gICAgIFsgMTE0My4zMTM3NTZdIHhoY2lfaGNkIDAwMDA6MDA6MDUuMDogeEhD
SSBob3N0IG5vdCByZXNwb25kaW5nIHRvIHN0b3AgZW5kcG9pbnQgY29tbWFuZC4KPj4gICAgIFsg
MTE0My4zMzQ4MjVdIHhoY2lfaGNkIDAwMDA6MDA6MDUuMDogeEhDSSBob3N0IGNvbnRyb2xsZXIg
bm90IHJlc3BvbmRpbmcsIGFzc3VtZSBkZWFkCj4+ICAgICBbIDExNDMuMzQ3MzY0XSB4aGNpX2hj
ZCAwMDAwOjAwOjA1LjA6IEhDIGRpZWQ7IGNsZWFuaW5nIHVwCj4+ICAgICBbIDExNDMuMzU2NDA3
XSB1c2IgMS0yOiBVU0IgZGlzY29ubmVjdCwgZGV2aWNlIG51bWJlciAyCj4+Cj4+IEJpc2VjdGlv
biB0dXJuZWQgdXAgYXMgdGhlIGN1bHByaXQ6IAo+PiAgICBjb21taXQgNTUwMGQyNjVhMmE4ZmE2
M2Q2MGMwOGJlYjU0OWRlOGVjODJmZjdhNQo+PiAgICB4ODYvc21wOiB1c2UgQVBJQyBBTExCVVQg
ZGVzdGluYXRpb24gc2hvcnRoYW5kIHdoZW4gcG9zc2libGUKPiAKPiBTb3JyeSB0byBoZWFyIHRo
YXQsIGxldCBzZWUgaWYgd2UgY2FuIGZpZ3VyZSBvdXQgd2hhdCdzIHdyb25nLgoKTm8gcHJvYmxl
bSwgdGhhdCBpcyB3aHkgSSB0ZXN0IHN0dWZmIDopCgo+PiBJIHZlcmlmaWVkIGJ5IHJldmVydGlu
ZyB0aGF0IGNvbW1pdCBhbmQgbm93IGl0IHdvcmtzIGZpbmUgYWdhaW4uCj4gCj4gRG9lcyB0aGUg
c2FtZSBjb250cm9sbGVyIHdvcmsgZmluZSB3aGVuIHVzZWQgaW4gZG9tMD8KCldpbGwgdGVzdCB0
aGF0LCBidXQgYXMgYWxsIG90aGVyIHBjaSBkZXZpY2VzIGluIGRvbTAgd29yayBmaW5lLApJIGFz
c3VtZSB0aGlzIGNvbnRyb2xsZXIgd291bGQgYWxzbyB3b3JrIGZpbmUgaW4gZG9tMCAoYXMgaXQg
aGFzIGFsc28Kd29ya2VkIGZpbmUgZm9yIGFnZXMgd2l0aCBQQ0ktcGFzc3Rocm91Z2ggdG8gdGhh
dCBndWVzdCBhbmQgc3RpbGwgd29ya3MKZmluZSB3aGVuIHJldmVydGluZyB0aGUgcmVmZXJlbmNl
ZCBjb21taXQpLgoKSSBkb24ndCBrbm93IGlmIHlvdXIgY2hhbmdlIGNhbiBzb21laG93IGhhdmUg
YSBzaWRlIGVmZmVjdApvbiBsYXRlbmN5IGFyb3VuZCB0aGUgcHJvY2Vzc2luZyBvZiBwY2ktcGFz
c3Rocm91Z2ggPwooc2luY2UgdGhlIGRyaXZlciBjb25jbHVkaW5nIHRoYXQgYSBkZXZpY2UgaXMg
bm9uLXJlc3BvbnNpdmUsIHdpbGwKcHJvYmFibHkgYmUgYXQgbGVhc3Qgc29tZXdoYXQgbGF0ZW5j
eSBzZW5zaXRpdmUpLgoKLS0KU2FuZGVyCgo+IFRoYW5rcywgUm9nZXIuCj4gCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
