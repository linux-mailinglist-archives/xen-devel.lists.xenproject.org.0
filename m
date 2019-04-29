Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5964FE2EB
	for <lists+xen-devel@lfdr.de>; Mon, 29 Apr 2019 14:42:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hL5Zr-0007Z7-Be; Mon, 29 Apr 2019 12:40:11 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=C3NY=S7=citrix.com=prvs=015693d2f=ross.lagerwall@srs-us1.protection.inumbo.net>)
 id 1hL5Zp-0007Z2-UD
 for xen-devel@lists.xen.org; Mon, 29 Apr 2019 12:40:09 +0000
X-Inumbo-ID: ebe15bd8-6a7b-11e9-843c-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id ebe15bd8-6a7b-11e9-843c-bc764e045a96;
 Mon, 29 Apr 2019 12:40:08 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,409,1549929600"; d="scan'208";a="84633937"
To: Pawel Wieczorkiewicz <wipawel@amazon.de>, <xen-devel@lists.xen.org>
References: <20190408083224.104802-1-wipawel@amazon.de>
 <20190408083224.104802-3-wipawel@amazon.de>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Message-ID: <1b9dd799-5148-35f8-804b-64a9e71da9b4@citrix.com>
Date: Mon, 29 Apr 2019 13:40:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190408083224.104802-3-wipawel@amazon.de>
Content-Language: en-US
Subject: Re: [Xen-devel] [livepatch-build-tools 3/4] livepatch-build: Do not
 follow every symlink for patch file
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
Cc: mpohlack@amazon.de, konrad.wilk@oracle.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gNC84LzE5IDk6MzIgQU0sIFBhd2VsIFdpZWN6b3JraWV3aWN6IHdyb3RlOgo+IEluIHNvbWUg
YnVpbGQgc3lzdGVtcyBzeW1saW5rcyBtaWdodCBiZSB1c2VkIGZvciBwYXRjaCBmaWxlIG5hbWVz
Cj4gdG8gcG9pbnQgZnJvbSB0YXJnZXQgZGlyZWN0b3JpZXMgdG8gYWN0dWFsIHBhdGNoZXMuIEZv
bGxvd2luZyB0aG9zZQo+IHN5bWxpbmtzIGJyZWFrcyBuYW1pbmcgY29udmVudGlvbiBhcyB0aGUg
cmVzdWx0aW5nIGJ1aWx0IG1vZHVsZXMKPiB3b3VsZCBiZSBuYW1lZCBhZnRlciB0aGUgYWN0dWFs
IGhhcmRsaW5rIGluc3RlYWRzIG9mIHRoZSBzeW1saW5rLgo+IAo+IExpdmVwYXRjaC1idWlsZCBv
YnRhaW5zIGhvdHBhdGNoIG5hbWUgZnJvbSB0aGUgcGF0Y2ggZmlsZSwgc28gaXQKPiBzaG91bGQg
bm90IGNhbm9uaWNhbGl6ZSB0aGUgZmlsZSBwYXRoIHJlc29sdmluZyBhbGwgdGhlIHN5bWxpbmtz
IHRvCj4gbm90IGxvc2UgdGhlIG9yaWdpbmFsIHN5bWxpbmsgbmFtZS4KPiAKPiBTaWduZWQtb2Zm
LWJ5OiBQYXdlbCBXaWVjem9ya2lld2ljeiA8d2lwYXdlbEBhbWF6b24uZGU+Cj4gUmV2aWV3ZWQt
Ynk6IE1hcnRpbiBQb2hsYWNrIDxtcG9obGFja0BhbWF6b24uZGU+Cj4gUmV2aWV3ZWQtYnk6IEJq
b2VybiBEb2ViZWwgPGRvZWJlbEBhbWF6b24uZGU+Cj4gUmV2aWV3ZWQtYnk6IE5vcmJlcnQgTWFu
dGhleSA8bm1hbnRoZXlAYW1hem9uLmRlPgo+IC0tLQo+ICAgbGl2ZXBhdGNoLWJ1aWxkIHwgNCAr
KystCj4gICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4g
Cj4gZGlmZiAtLWdpdCBhL2xpdmVwYXRjaC1idWlsZCBiL2xpdmVwYXRjaC1idWlsZAo+IGluZGV4
IGMwNTdmYTEuLjc5NjgzOGMgMTAwNzU1Cj4gLS0tIGEvbGl2ZXBhdGNoLWJ1aWxkCj4gKysrIGIv
bGl2ZXBhdGNoLWJ1aWxkCj4gQEAgLTI2NSw3ICsyNjUsOSBAQCBkb25lCj4gICBbIC16ICIkREVQ
RU5EUyIgXSAmJiBkaWUgIkJ1aWxkLWlkIGRlcGVuZGVuY3kgbm90IGdpdmVuIgo+ICAgCj4gICBT
UkNESVI9IiQocmVhZGxpbmsgLW0gLS0gIiRzcmNhcmciKSIKPiAtUEFUQ0hGSUxFPSIkKHJlYWRs
aW5rIC1tIC0tICIkcGF0Y2hhcmciKSIKPiArIyBXZSBuZWVkIGFuIGFic29sdXRlIHBhdGggYmVj
YXVzZSB3ZSBtb3ZlIGFyb3VuZCwgYnV0IHdlIG5lZWQgdG8KPiArIyByZXRhaW4gdGhlIG5hbWUg
b2YgdGhlIHN5bWxpbmsgKD0gcmVhbHBhdGggLXMpCj4gK1BBVENIRklMRT0iJChyZWFkbGluayAt
ZiAiJChkaXJuYW1lICIkcGF0Y2hhcmciKSIpLyQoYmFzZW5hbWUgIiRwYXRjaGFyZyIpIgo+ICAg
Q09ORklHRklMRT0iJChyZWFkbGluayAtbSAtLSAiJGNvbmZpZ2FyZyIpIgo+ICAgT1VUUFVUPSIk
KHJlYWRsaW5rIC1tIC0tICIkb3V0cHV0YXJnIikiCj4gICAKPiAKClRoaXMgd29ya3MsIGJ1dCB3
b3VsZCBpdCBub3QgYmUgc2ltcGxlciB0byBqdXN0IHBhc3MgJHBhdGNoYXJnIGludG8gCm1ha2Vf
cGF0Y2hfbmFtZSgpPwoKLS0gClJvc3MgTGFnZXJ3YWxsCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
