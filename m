Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 467D3EAD7
	for <lists+xen-devel@lfdr.de>; Mon, 29 Apr 2019 21:27:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hLBsn-0002wd-Ln; Mon, 29 Apr 2019 19:24:09 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=kVn5=S7=amazon.de=prvs=015f510af=wipawel@srs-us1.protection.inumbo.net>)
 id 1hLBsm-0002wY-EJ
 for xen-devel@lists.xen.org; Mon, 29 Apr 2019 19:24:08 +0000
X-Inumbo-ID: 5ae23b26-6ab4-11e9-843c-bc764e045a96
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 5ae23b26-6ab4-11e9-843c-bc764e045a96;
 Mon, 29 Apr 2019 19:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1556565846; x=1588101846;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:mime-version: content-transfer-encoding;
 bh=lw0xiwNlI8+J09zm7FAQbuAilQvCn0lW2p+NIm1iduk=;
 b=oZK8VK+kB02ATNEFug/k88O83ZQN88E6YEOALexy7rJ1vuYtaVgkgcz2
 BBa4l4D8OaHtJ52E82IPNB1PDRi9eEyA8sxVXbwrzoNXF+1nnEc9od8Kg
 POl7lvi2gEIH7jatrGuo6apyseuSOcJ7VgCOSBTOCFXO9WRTeZD0vSspf 0=;
X-IronPort-AV: E=Sophos;i="5.60,410,1549929600"; d="scan'208";a="400103519"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2b-4ff6265a.us-west-2.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 29 Apr 2019 15:24:20 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
 by email-inbound-relay-2b-4ff6265a.us-west-2.amazon.com (8.14.7/8.14.7) with
 ESMTP id x3TFOHWw026665
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
 Mon, 29 Apr 2019 15:24:20 GMT
Received: from EX13D05EUB004.ant.amazon.com (10.43.166.115) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 29 Apr 2019 15:24:19 +0000
Received: from EX13D05EUB004.ant.amazon.com (10.43.166.115) by
 EX13D05EUB004.ant.amazon.com (10.43.166.115) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 29 Apr 2019 15:24:18 +0000
Received: from EX13D05EUB004.ant.amazon.com ([10.43.166.115]) by
 EX13D05EUB004.ant.amazon.com ([10.43.166.115]) with mapi id 15.00.1367.000;
 Mon, 29 Apr 2019 15:24:18 +0000
From: "Wieczorkiewicz, Pawel" <wipawel@amazon.de>
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Thread-Topic: [Xen-devel] [livepatch-build-tools 3/4] livepatch-build: Do not
 follow every symlink for patch file
Thread-Index: AQHU7eWkW5icsh/RhEyY2qLzGAI0eqZTNYyAgAAt4QA=
Date: Mon, 29 Apr 2019 15:24:18 +0000
Message-ID: <E6C94D0D-68EF-402C-833E-B0F4251BAA95@amazon.com>
References: <20190408083224.104802-1-wipawel@amazon.de>
 <20190408083224.104802-3-wipawel@amazon.de>
 <1b9dd799-5148-35f8-804b-64a9e71da9b4@citrix.com>
In-Reply-To: <1b9dd799-5148-35f8-804b-64a9e71da9b4@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.166.17]
Content-ID: <0BCECBCCBEA37B4F90F295A3E21ADC55@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [livepatch-build-tools 3/4] livepatch-build: Do not
 follow every symlink for patch file
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "Pohlack, Martin" <mpohlack@amazon.de>, "Wieczorkiewicz,
 Pawel" <wipawel@amazon.de>, "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Cj4gT24gMjkuIEFwciAyMDE5LCBhdCAxNDo0MCwgUm9zcyBMYWdlcndhbGwgPHJvc3MubGFnZXJ3
YWxsQGNpdHJpeC5jb20+IHdyb3RlOgo+IAo+IE9uIDQvOC8xOSA5OjMyIEFNLCBQYXdlbCBXaWVj
em9ya2lld2ljeiB3cm90ZToKPj4gSW4gc29tZSBidWlsZCBzeXN0ZW1zIHN5bWxpbmtzIG1pZ2h0
IGJlIHVzZWQgZm9yIHBhdGNoIGZpbGUgbmFtZXMKPj4gdG8gcG9pbnQgZnJvbSB0YXJnZXQgZGly
ZWN0b3JpZXMgdG8gYWN0dWFsIHBhdGNoZXMuIEZvbGxvd2luZyB0aG9zZQo+PiBzeW1saW5rcyBi
cmVha3MgbmFtaW5nIGNvbnZlbnRpb24gYXMgdGhlIHJlc3VsdGluZyBidWlsdCBtb2R1bGVzCj4+
IHdvdWxkIGJlIG5hbWVkIGFmdGVyIHRoZSBhY3R1YWwgaGFyZGxpbmsgaW5zdGVhZHMgb2YgdGhl
IHN5bWxpbmsuCj4+IExpdmVwYXRjaC1idWlsZCBvYnRhaW5zIGhvdHBhdGNoIG5hbWUgZnJvbSB0
aGUgcGF0Y2ggZmlsZSwgc28gaXQKPj4gc2hvdWxkIG5vdCBjYW5vbmljYWxpemUgdGhlIGZpbGUg
cGF0aCByZXNvbHZpbmcgYWxsIHRoZSBzeW1saW5rcyB0bwo+PiBub3QgbG9zZSB0aGUgb3JpZ2lu
YWwgc3ltbGluayBuYW1lLgo+PiBTaWduZWQtb2ZmLWJ5OiBQYXdlbCBXaWVjem9ya2lld2ljeiA8
d2lwYXdlbEBhbWF6b24uZGU+Cj4+IFJldmlld2VkLWJ5OiBNYXJ0aW4gUG9obGFjayA8bXBvaGxh
Y2tAYW1hem9uLmRlPgo+PiBSZXZpZXdlZC1ieTogQmpvZXJuIERvZWJlbCA8ZG9lYmVsQGFtYXpv
bi5kZT4KPj4gUmV2aWV3ZWQtYnk6IE5vcmJlcnQgTWFudGhleSA8bm1hbnRoZXlAYW1hem9uLmRl
Pgo+PiAtLS0KPj4gIGxpdmVwYXRjaC1idWlsZCB8IDQgKysrLQo+PiAgMSBmaWxlIGNoYW5nZWQs
IDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+PiBkaWZmIC0tZ2l0IGEvbGl2ZXBhdGNo
LWJ1aWxkIGIvbGl2ZXBhdGNoLWJ1aWxkCj4+IGluZGV4IGMwNTdmYTEuLjc5NjgzOGMgMTAwNzU1
Cj4+IC0tLSBhL2xpdmVwYXRjaC1idWlsZAo+PiArKysgYi9saXZlcGF0Y2gtYnVpbGQKPj4gQEAg
LTI2NSw3ICsyNjUsOSBAQCBkb25lCj4+ICBbIC16ICIkREVQRU5EUyIgXSAmJiBkaWUgIkJ1aWxk
LWlkIGRlcGVuZGVuY3kgbm90IGdpdmVuIgo+PiAgICBTUkNESVI9IiQocmVhZGxpbmsgLW0gLS0g
IiRzcmNhcmciKSIKPj4gLVBBVENIRklMRT0iJChyZWFkbGluayAtbSAtLSAiJHBhdGNoYXJnIiki
Cj4+ICsjIFdlIG5lZWQgYW4gYWJzb2x1dGUgcGF0aCBiZWNhdXNlIHdlIG1vdmUgYXJvdW5kLCBi
dXQgd2UgbmVlZCB0bwo+PiArIyByZXRhaW4gdGhlIG5hbWUgb2YgdGhlIHN5bWxpbmsgKD0gcmVh
bHBhdGggLXMpCj4+ICtQQVRDSEZJTEU9IiQocmVhZGxpbmsgLWYgIiQoZGlybmFtZSAiJHBhdGNo
YXJnIikiKS8kKGJhc2VuYW1lICIkcGF0Y2hhcmciKSIKPj4gIENPTkZJR0ZJTEU9IiQocmVhZGxp
bmsgLW0gLS0gIiRjb25maWdhcmciKSIKPj4gIE9VVFBVVD0iJChyZWFkbGluayAtbSAtLSAiJG91
dHB1dGFyZyIpIgo+PiAgCj4gCj4gVGhpcyB3b3JrcywgYnV0IHdvdWxkIGl0IG5vdCBiZSBzaW1w
bGVyIHRvIGp1c3QgcGFzcyAkcGF0Y2hhcmcgaW50byBtYWtlX3BhdGNoX25hbWUoKT8KPiAKCk5v
IHN0cm9uZyBvcGluaW9uIGhlcmUsIGJ1dCB0aGUgcmVhZGxpbmsgY2hhbmdlIGZlbHQgbGVzcyBp
bnZhc2l2ZSAobm8gY2hhbmdlcyB0byB0aGUgZXhpc3Rpbmcgc2VtYW50aWNzKS4KClRoYW5rIHlv
dSBmb3IgbG9va2luZyBpbnRvIHRoaXMuCgo+IC0tIAo+IFJvc3MgTGFnZXJ3YWxsCj4gCgoKQmVz
dCBSZWdhcmRzLApQYXdlbCBXaWVjem9ya2lld2ljegoKCgoKCkFtYXpvbiBEZXZlbG9wbWVudCBD
ZW50ZXIgR2VybWFueSBHbWJICktyYXVzZW5zdHIuIDM4CjEwMTE3IEJlcmxpbgpHZXNjaGFlZnRz
ZnVlaHJlcjogQ2hyaXN0aWFuIFNjaGxhZWdlciwgUmFsZiBIZXJicmljaApVc3QtSUQ6IERFIDI4
OSAyMzcgODc5CkVpbmdldHJhZ2VuIGFtIEFtdHNnZXJpY2h0IENoYXJsb3R0ZW5idXJnIEhSQiAx
NDkxNzMgQgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
