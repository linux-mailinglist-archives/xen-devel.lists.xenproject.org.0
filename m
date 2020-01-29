Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B50A714CC7F
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2020 15:32:03 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwoMI-0005Zb-4r; Wed, 29 Jan 2020 14:30:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=LL5N=3S=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iwoMG-0005ZW-Tl
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2020 14:30:20 +0000
X-Inumbo-ID: dfe37810-42a3-11ea-88e4-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dfe37810-42a3-11ea-88e4-12813bfff9fa;
 Wed, 29 Jan 2020 14:30:19 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 9B27EAE61;
 Wed, 29 Jan 2020 14:30:18 +0000 (UTC)
To: Anthony PERARD <anthony.perard@citrix.com>
References: <20200117105358.607910-1-anthony.perard@citrix.com>
 <20200117105358.607910-5-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <db579f9f-d816-47f9-e75c-4b20d60bda3b@suse.com>
Date: Wed, 29 Jan 2020 15:30:19 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200117105358.607910-5-anthony.perard@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [XEN PATCH v2 04/12] xen/build: extract clean
 target from Rules.mk
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
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Anthony PERARD <anthony.perard@gmail.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTcuMDEuMjAyMCAxMTo1MywgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4gRnJvbTogQW50aG9u
eSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGdtYWlsLmNvbT4KPiAKPiBNb3N0IG9mIHRoZSBjb2Rl
IGV4ZWN1dGVkIGJ5IFJ1bGVzLm1rIGlzbid0IG5lY2Vzc2FyeSBmb3IgdGhlIGNsZWFuCj4gdGFy
Z2V0LCBlc3BlY2lhbGx5IG5vdCB0aGUgQ0ZMQUdTLiBUaGlzIG1ha2UgcnVubmluZyBtYWtlIGNs
ZWFuIG11Y2gKPiBmYXN0ZXIuCj4gCj4gVGhpcyBleHRyYWN0IHRoZSBjb2RlIGludG8gYSBkaWZm
ZXJlbnQgTWFrZWZpbGUuIEl0IGRvZXNuJ3Qgd2FudCB0bwo+IGluY2x1ZGUgQ29uZmlnLm1rIGVp
dGhlciBzbyB2YXJpYWJsZXMgREVQU19STSBhbmQgREVQU19JTkNMVURFIGFyZQo+IGV4dHJhY3Rl
ZCBmcm9tIENvbmZpZy5tayBhcyB3ZWxsLiBERVBTX0lOQ0xVREUgaXMgcHV0IGludG8KPiBLYnVp
bGQuaW5jbHVkZSBzbyBpdCBjb3VsZCBiZSB1c2UgYnkgb3RoZXIgTWFrZWZpbGVzLgoKImV4dHJh
Y3RlZCIgbWFrZXMgaXQgc291bmQgYXMgaWYgdGhlIGludGVudGlvbiB3YXMgdG8gbW92ZSB0aGlu
Z3MsCnlldCAuLi4KCj4gLS0tCj4gIHhlbi9SdWxlcy5tayAgICAgICAgICAgICAgIHwgMTMgLS0t
LS0tLS0tLS0tLQo+ICB4ZW4vc2NyaXB0cy9LYnVpbGQuaW5jbHVkZSB8ICA3ICsrKysrKy0KPiAg
eGVuL3NjcmlwdHMvTWFrZWZpbGUuY2xlYW4gfCAzMyArKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysKPiAgMyBmaWxlcyBjaGFuZ2VkLCAzOSBpbnNlcnRpb25zKCspLCAxNCBkZWxldGlv
bnMoLSkKCi4uLiAuL0NvbmZpZy5tayBkb2Vzbid0IGdldCB0b3VjaGVkIGF0IGFsbC4gSSBndWVz
cyB0aGVyZSBhcmUgcmVhc29ucwpmb3IgdGhpcywgYnV0IEkgY29uc2lkZXIgaXQgZGFuZ2Vyb3Vz
IHRvIGxlYXZlIGluZGVwZW5kZW50IGRlZmluaXRpb25zCm9mIHRoZSBzYW1lIHZhcmlhYmxlcyBp
biBkaXNjb25uZWN0ZWQgcGxhY2VzLiBXaGF0IGlmIG9uZSBzaWRlIGdldHMKdXBkYXRlZCB3aXRo
b3V0IG5vdGljaW5nIHRoZSBvdGhlcj8KCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL3hlbi9zY3Jp
cHRzL01ha2VmaWxlLmNsZWFuCj4gQEAgLTAsMCArMSwzMyBAQAo+ICsjIFNQRFgtTGljZW5zZS1J
ZGVudGlmaWVyOiBHUEwtMi4wCj4gKyMgPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KPiArIyBDbGVhbmluZyB1
cAo+ICsjID09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09Cj4gKwo+ICtjbGVhbjo6Cj4gKwo+ICtpbmNsdWRlICQo
QkFTRURJUikvc2NyaXB0cy9LYnVpbGQuaW5jbHVkZQo+ICsKPiAraW5jbHVkZSBNYWtlZmlsZQo+
ICsKPiArIyBGaWd1cmUgb3V0IHdoYXQgd2UgbmVlZCB0byBidWlsZCBmcm9tIHRoZSB2YXJpb3Vz
IHZhcmlhYmxlcwoKcy9idWlsZC9jbGVhbi8gPwoKPiArIyA9PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQo+ICtf
X3N1YmRpci15CTo9ICQoZmlsdGVyICUvLCAkKG9iai15KSkKPiArc3ViZGlyLXkJKz0gJChfX3N1
YmRpci15KQo+ICtzdWJkaXItbiA6PSAkKHN1YmRpci1uKSAkKHN1YmRpci0pIFwKPiArCQkkKGZp
bHRlciAlLywgJChvYmotbikgJChvYmotKSkKPiArc3ViZGlyLWFsbCA6PSAkKHN1YmRpci15KSAk
KHN1YmRpci1uKQoKU2FtZSByZW1hcmsgYXMgZm9yIHRoZSBlYXJsaWVyIHBhdGNoIHJlZ2FyZGlu
ZyBfX3N1YmRpci15IGFuZCB0aGUKdXNlIG9mIHRhYnMuIEFkZGl0aW9uYWxseSBwbGVhc2UgdXNl
IGNvbnNpc3RlbnQgaW5kZW50YXRpb24gb2YKOj0gLyArPSB3aXRoaW4gdGhpcyBibG9jay4KCkph
bgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
