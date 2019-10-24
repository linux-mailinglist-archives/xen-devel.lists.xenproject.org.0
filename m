Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F2CE2B44
	for <lists+xen-devel@lfdr.de>; Thu, 24 Oct 2019 09:43:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNXj2-0005ip-EA; Thu, 24 Oct 2019 07:40:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=QAfa=YR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iNXj0-0005dk-Tv
 for xen-devel@lists.xenproject.org; Thu, 24 Oct 2019 07:40:02 +0000
X-Inumbo-ID: 7c309e9c-f631-11e9-bbab-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7c309e9c-f631-11e9-bbab-bc764e2007e4;
 Thu, 24 Oct 2019 07:40:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 44E04AF6A;
 Thu, 24 Oct 2019 07:40:00 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: Andy Lutomirski <luto@kernel.org>
References: <ef1c9381-dfc7-7150-feca-581f4d798513@suse.com>
Message-ID: <279e6368-7446-9419-fef9-c4069b6aee5a@suse.com>
Date: Thu, 24 Oct 2019 09:40:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <ef1c9381-dfc7-7150-feca-581f4d798513@suse.com>
Content-Language: en-US
Subject: [Xen-devel] Ping: [PATCH] x86/stackframe/32: repair 32-bit Xen PV
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDcuMTAuMjAxOSAxMjo0MSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT25jZSBhZ2FpbiBSUEwg
Y2hlY2tzIGhhdmUgYmVlbiBpbnRyb2R1Y2VkIHdoaWNoIGRvbid0IGFjY291bnQgZm9yIGEKPiAz
Mi1iaXQga2VybmVsIGxpdmluZyBpbiByaW5nIDEgd2hlbiBydW5uaW5nIGluIGEgUFYgWGVuIGRv
bWFpbi4gVGhlCj4gY2FzZSBpbiBGSVhVUF9GUkFNRSBoYXMgYmVlbiBwcmV2ZW50aW5nIGJvb3Q7
IGFkanVzdCBCVUdfSUZfV1JPTkdfQ1IzCj4gYXMgd2VsbCBqdXN0IGluIGNhc2UuCj4gCj4gRml4
ZXM6IDNjODhjNjkyYzI4NyAoIng4Ni9zdGFja2ZyYW1lLzMyOiBQcm92aWRlIGNvbnNpc3RlbnQg
cHRfcmVncyIpCj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29t
PgoKUGluZz8KCkknZCBsaWtlIHRvIGZ1cnRoZXIgbm90ZSB0aGF0IHRoZXJlIGFwcGVhcnMgdG8g
YSBsaWtlbHkgcmVsYXRlZAoybmQgcHJvYmxlbSAtIEknbSBzZWVpbmcgc2VlbWluZ2x5IHJhbmRv
bSBhdHRlbXB0cyB0byBlbnRlciBWTTg2Cm1vZGUgd2hlbiBydW5uaW5nIFBWIHVuZGVyIFhlbi4g
SSBzdXNwZWN0IGEgbmV2ZXIgd3JpdHRlbiBlZmxhZ3MKdmFsdWUgdG8gZ2V0IGluc3BlY3RlZC4g
V2hpbGUgdGhlIGlzc3VlIGhlcmUga2lsbHMgdGhlIGtlcm5lbApyZWxpYWJseSBkdXJpbmcgYm9v
dCwgdGhhdCBvdGhlciBpc3N1ZSBzb21ldGltZXMgYWxsb3dzIHRoZQpzeXN0ZW0gdG8gYXQgbGVh
c3QgY29tZSB1cCBpbiBhIHBhcnRseSBmdW5jdGlvbmFsIHdheSAoZGVwZW5kaW5nCm9uIHdoaWNo
IHVzZXIgcHJvY2Vzc2VzIGdldCBraWxsZWQgYmVjYXVzZSBvZiB0aGVyZSBub3QgYmVpbmcKYW55
IFZNODYgbW9kZSBhdmFpbGFibGUgd2hlbiBydW5uaW5nIFBWIHVuZGVyIFs2NC1iaXRdIFhlbiku
CgpKYW4KCj4gLS0tIGEvYXJjaC94ODYvZW50cnkvZW50cnlfMzIuUwo+ICsrKyBiL2FyY2gveDg2
L2VudHJ5L2VudHJ5XzMyLlMKPiBAQCAtNDgsNiArNDgsMTcgQEAKPiAgCj4gICNpbmNsdWRlICJj
YWxsaW5nLmgiCj4gIAo+ICsjaWZuZGVmIENPTkZJR19YRU5fUFYKPiArIyBkZWZpbmUgVVNFUl9T
RUdNRU5UX1JQTF9NQVNLIFNFR01FTlRfUlBMX01BU0sKPiArI2Vsc2UKPiArLyoKPiArICogV2hl
biBydW5uaW5nIHBhcmF2aXJ0dWFsaXplZCBvbiBYZW4gdGhlIGtlcm5lbCBydW5zIGluIHJpbmcg
MSwgYW5kIGhlbmNlCj4gKyAqIHNpbXBsZSBtYXNrIGJhc2VkIHRlc3RzIChpLmUuIG9uZXMgbm90
IGNvbXBhcmluZyBhZ2FpbnN0IFVTRVJfUlBMKSBoYXZlIHRvCj4gKyAqIGlnbm9yZSBiaXQgMC4g
U2VlIGFsc28gdGhlIEMtbGV2ZWwgZ2V0X2tlcm5lbF9ycGwoKS4KPiArICovCj4gKyMgZGVmaW5l
IFVTRVJfU0VHTUVOVF9SUExfTUFTSyAoU0VHTUVOVF9SUExfTUFTSyAmIH4xKQo+ICsjZW5kaWYK
PiArCj4gIAkuc2VjdGlvbiAuZW50cnkudGV4dCwgImF4Igo+ICAKPiAgLyoKPiBAQCAtMTcyLDcg
KzE4Myw3IEBACj4gIAlBTFRFUk5BVElWRSAiam1wIC5MZW5kX1xAIiwgIiIsIFg4Nl9GRUFUVVJF
X1BUSQo+ICAJLmlmIFxub191c2VyX2NoZWNrID09IDAKPiAgCS8qIGNvbWluZyBmcm9tIHVzZXJt
b2RlPyAqLwo+IC0JdGVzdGwJJFNFR01FTlRfUlBMX01BU0ssIFBUX0NTKCVlc3ApCj4gKwl0ZXN0
bAkkVVNFUl9TRUdNRU5UX1JQTF9NQVNLLCBQVF9DUyglZXNwKQo+ICAJanoJLkxlbmRfXEAKPiAg
CS5lbmRpZgo+ICAJLyogT24gdXNlci1jcjM/ICovCj4gQEAgLTIxNyw3ICsyMjgsNyBAQAo+ICAJ
dGVzdGwJJFg4Nl9FRkxBR1NfVk0sIDQqNCglZXNwKQo+ICAJam56CS5MZnJvbV91c2VybW9kZV9u
b19maXh1cF9cQAo+ICAjZW5kaWYKPiAtCXRlc3RsCSRTRUdNRU5UX1JQTF9NQVNLLCAzKjQoJWVz
cCkKPiArCXRlc3RsCSRVU0VSX1NFR01FTlRfUlBMX01BU0ssIDMqNCglZXNwKQo+ICAJam56CS5M
ZnJvbV91c2VybW9kZV9ub19maXh1cF9cQAo+ICAKPiAgCW9ybAkkQ1NfRlJPTV9LRVJORUwsIDMq
NCglZXNwKQo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
