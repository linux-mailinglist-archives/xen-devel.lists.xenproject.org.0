Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E63FA1B449
	for <lists+xen-devel@lfdr.de>; Mon, 13 May 2019 12:46:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQ8Qt-0005Vu-4i; Mon, 13 May 2019 10:43:47 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rpFc=TN=citrix.com=prvs=0298122e9=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hQ8Qr-0005Vn-NK
 for xen-devel@lists.xenproject.org; Mon, 13 May 2019 10:43:45 +0000
X-Inumbo-ID: fab6318e-756b-11e9-8980-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id fab6318e-756b-11e9-8980-bc764e045a96;
 Mon, 13 May 2019 10:43:44 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,465,1549929600"; d="scan'208";a="85379968"
Date: Mon, 13 May 2019 11:43:36 +0100
From: Wei Liu <wei.liu2@citrix.com>
To: Viktor Mitin <viktor.mitin.19@gmail.com>
Message-ID: <20190513104336.GA2798@zion.uk.xensource.com>
References: <CAOcoXZaMLfHSyLSE04xRFZZY0hLkFcJ5cBqHTdmwDoqwcreD1w@mail.gmail.com>
 <ff543e3c-0619-5aa6-b36a-e1a8b8cce886@arm.com>
 <20190503110819.GA5900@zion.uk.xensource.com>
 <63ea8905-87ca-a419-95bf-ae497bf1ff85@arm.com>
 <20190503134133.GC5900@zion.uk.xensource.com>
 <b0947b60-d89a-54a5-a11b-708b64ff8053@arm.com>
 <20190503141952.GD5900@zion.uk.xensource.com>
 <CAOcoXZZau01-5Tmab9eCcYKJavzrT_9KdNa_dR+QN5zKmmXMoA@mail.gmail.com>
 <4fb5058d-9810-7a1b-91f4-db31bad82a85@arm.com>
 <CAOcoXZbDdX3rXL+nzEwUCT47UUbCDqJPZ7SP-dYn9SYdkm=isg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOcoXZbDdX3rXL+nzEwUCT47UUbCDqJPZ7SP-dYn9SYdkm=isg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Xen-devel] Xen GCC coverage ARM64 testing - Unexpected Trap:
 Data Abort
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Julien Grall <julien.grall@arm.com>, Andrii_Anisov@epam.com,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBNYXkgMTMsIDIwMTkgYXQgMDE6Mjk6MTJQTSArMDMwMCwgVmlrdG9yIE1pdGluIHdy
b3RlOgo+ID4gPiBhYXJjaDY0LXBva3ktbGludXgtZ2NjICAgLURCVUlMRF9JRCAtZm5vLXN0cmlj
dC1hbGlhc2luZyAtc3RkPWdudTk5Cj4gPiA+IC1XYWxsIC1Xc3RyaWN0LXByb3RvdHlwZXMgLVdk
ZWNsYXJhdGlvbi1hZnRlci1zdGF0ZW1lbnQKPiA+ID4gLVduby11bnVzZWQtYnV0LXNldC12YXJp
YWJsZSAtV25vLXVudXNlZC1sb2NhbC10eXBlZGVmcyAgIC1PMgo+ID4gPiAtZm9taXQtZnJhbWUt
cG9pbnRlcgo+ID4gPiAtRF9fWEVOX0lOVEVSRkFDRV9WRVJTSU9OX189X19YRU5fTEFURVNUX0lO
VEVSRkFDRV9WRVJTSU9OX18gLU1NRCAtTUYKPiA+ID4gLmhhbmRsZXJlZy5vLmQgLURfTEFSR0VG
SUxFX1NPVVJDRSAtRF9MQVJHRUZJTEU2NF9TT1VSQ0UgICAtV2Vycm9yCj4gPiA+IC1XbWlzc2lu
Zy1wcm90b3R5cGVzIC1JLi9pbmNsdWRlCj4gPiA+IC1JL2hvbWUvYy93L3JjYXJfaDNfdWJ1bnR1
MTYwNF95b2N0by9idWlsZC90bXAvd29yay9hYXJjaDY0LXBva3ktbGludXgveGVuLzQuMTIuMC4w
K2dpdEFVVE9JTkMrZmQyYTM0Yzk2NS1yMC9naXQvdG9vbHMvbGlicy90b29sY29yZS8uLi8uLi8u
Li90b29scy9pbmNsdWRlCj4gPiA+ICAgLWMgLW8gaGFuZGxlcmVnLm8gaGFuZGxlcmVnLmMKPiA+
Cj4gPiAuLi4gdGhpcyBsb29rcyBsaWtlIGEgdG9vbCBidWlsZGluZyBlcnJvciB3aGVuIEkgb25s
eSB0b3VjaCB0aGUKPiA+IGh5cGVydmlzb3IgcGFydC4gQXJlIHlvdSBjZXJ0YWluIHRoaXMgaXMg
bXkgcGF0Y2ggYW5kIG5vdCBhbm90aGVyIGVycm9yCj4gPiBpbiBYZW4gNC4xMiAob3IgYW55IHBh
dGNoIHlvdSBoYXZlIG9uIHRvcCk/Cj4gCj4gSnVsaWVuLCB5b3UgYXJlIHJpZ2h0LCBpdCB3YXMg
bG9jYWwgZW52aXJvbm1lbnQgYnVpbGQgaXNzdWUgKHNvcnJ5IGZvciB0aGF0KS4KPiBYZW4gR0ND
IGNvdmVyYWdlIGZlYXR1cmUgd29ya3Mgd2VsbCB3aXRoIEFhcmNoNjQgd2l0aCB0aGlzIHBhdGNo
Lgo+IENoZWNrZWQgYm90aCBjb21tYW5kcywgeGVuY292IHJlYWQgYW5kIHhlbmNvdiByZXNldCAt
IGJvdGggd29yayB3ZWxsCj4gKG5vIGNyYXNoZXMgYW55bW9yZSkuCj4gCj4gUGxlYXNlIGFsc28g
bm90ZSB0aGF0IHVzZSBjYXNlIG1lbnRpb25lZCBpbiBYZW4gZG9jdW1lbnRhdGlvbgo+ICh4ZW5j
b3Zfc3BsaXQpIGlzIGFsc28gb2sgd2l0aCBnZW5lcmF0ZWQgY292ZXJhZ2UuZGF0IGlucHV0Ogo+
IHhlbi5naXQveGVuJCBzc2ggcm9vdEBob3N0IHhlbmNvdiByZWFkID4gY292ZXJhZ2UuZGF0Cj4g
eGVuLmdpdC94ZW4kIC4uL3Rvb2xzL3hlbmNvdl9zcGxpdCBjb3ZlcmFnZS5kYXQgLS1vdXRwdXQt
ZGlyPS8KPiB4ZW4uZ2l0L3hlbiQgZ2VuaW5mbyAuIC1vIGNvdi5pbmZvCj4geGVuLmdpdC94ZW4k
IGdlbmh0bWwgY292LmluZm8gLW8gY292Lwo+IHhlbi5naXQveGVuJCAkQlJPV1NFUiBjb3YvaW5k
ZXguaHRtbAo+IAo+IC0tLS0tLS0tCj4gTWlub3Igb2JzZXJ2YXRpb24gYWJvdXQgY292ZXJhZ2Ug
YnVpbGQgcHJvY2VkdXJlLiBEb2N1bWVudGF0aW9uIHN0YXRlczoKPiAiVG8gYnVpbGQgd2l0aCBj
b3ZlcmFnZSBzdXBwb3J0LCBlbmFibGUgQ09ORklHX0NPVkVSQUdFIGluIEtjb25maWcuIgo+IEhv
d2V2ZXIsIHRvIGJ1aWxkIGl0IHByb3Blcmx5LCBpdCBuZWVkcyB0byBlbmFibGUgY292ZXJhZ2Ug
ZmVhdHVyZSBpbgo+IHR3byBwbGFjZXMgLSBtYWluIHhlbiBtYWtlIGNvbW1hbmQgbGluZSBhbmQg
aHlwZXJ2aXNvciAuY29uZmlnIGZpbGUuCj4gSXMgaXQgZXhwZWN0ZWQgd2F5IHRvIGJ1aWxkIHhl
biB3aXRoIGNvdmVyYWdlIGZlYXR1cmU/IElmIHllcywKPiBwcm9iYWJseSB3ZSBzaG91bGQgaW1w
cm92ZSAob3IgYXQgbGVhc3QgZG9jdW1lbnQpIGl0IHNvbWUgZGF5Li4uCgpXaGF0IGRvZXMgeW91
ciBtYWtlIGNvbW1hbmQgbGluZSBsb29rIGxpa2U/CgpXZWkuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
