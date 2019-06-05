Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5764935506
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jun 2019 03:32:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYKjH-00034G-LZ; Wed, 05 Jun 2019 01:28:39 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pWaW=UE=mxnavi.com=chenbaodong@srs-us1.protection.inumbo.net>)
 id 1hYKjG-000345-Ke
 for xen-devel@lists.xenproject.org; Wed, 05 Jun 2019 01:28:38 +0000
X-Inumbo-ID: 3cc356af-8731-11e9-8980-bc764e045a96
Received: from mxnavi-mail.mxnavi.com (unknown [116.90.87.199])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 3cc356af-8731-11e9-8980-bc764e045a96;
 Wed, 05 Jun 2019 01:28:37 +0000 (UTC)
Received: from [192.168.51.47] (61.161.186.150) by mxnavi-mail.mxnavi.com
 (116.90.87.199) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Wed, 5 Jun
 2019 09:26:24 +0800
To: Jan Beulich <JBeulich@suse.com>, <george.dunlap@citrix.com>
References: <2465394e7e37b5f147e572271503c892@sslemail.net>
 <5CF6597E0200007800235008@prv1-mh.provo.novell.com>
From: chenbaodong <chenbaodong@mxnavi.com>
Message-ID: <fc859e16-9170-aac0-044e-2f4a41380176@mxnavi.com>
Date: Wed, 5 Jun 2019 09:28:28 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5CF6597E0200007800235008@prv1-mh.provo.novell.com>
Content-Language: en-US
X-Originating-IP: [61.161.186.150]
X-ClientProxiedBy: mxnavi-mail.mxnavi.com (116.90.87.199) To
 mxnavi-mail.mxnavi.com (116.90.87.199)
Subject: Re: [Xen-devel] [PATCH v1] xen: make tracebuffer configurable
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
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, IanJackson <Ian.Jackson@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ck9uIDYvNC8xOSAxOTo0MywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMDQuMDYuMTkgYXQg
MTI6NDksIDxHZW9yZ2UuRHVubGFwQGNpdHJpeC5jb20+IHdyb3RlOgo+Pj4gT24gSnVuIDQsIDIw
MTksIGF0IDE6NDQgQU0sIEJhb2RvbmcgQ2hlbiA8Y2hlbmJhb2RvbmdAbXhuYXZpLmNvbT4gd3Jv
dGU6Cj4+PiAtLS0gYS94ZW4vY29tbW9uL0tjb25maWcKPj4+ICsrKyBiL3hlbi9jb21tb24vS2Nv
bmZpZwo+Pj4gQEAgLTM2OCw0ICszNjgsMTYgQEAgY29uZmlnIERPTTBfTUVNCj4+Pgo+Pj4gCSAg
TGVhdmUgZW1wdHkgaWYgeW91IGFyZSBub3Qgc3VyZSB3aGF0IHRvIHNwZWNpZnkuCj4+Pgo+Pj4g
K2NvbmZpZyBUUkFDRUJVRkZFUgo+Pj4gKwlib29sICJFbmFibGUgdHJhY2UgZXZlbnQgbG9ncyIg
IGlmIEVYUEVSVCA9ICJ5Igo+Pj4gKwktLS1oZWxwLS0tCj4+PiArCSAgWGVuIGludGVybmFsIHJ1
bm5pbmcgc3RhdHVzKHRyYWNlIGV2ZW50KSB3aWxsIGJlIHNhdmVkIHRvIHRyYWNlIG1lbW9yeQo+
Pj4gKwkgIHdoZW4gZW5hYmxlZC4gdHJhY2UgZXZlbnQgZGF0YSBhbmQgY29uZmlnIHBhcmFtcyBj
YW4gYmUgcmVhZC9jaGFuZ2VkCj4+PiArCSAgYnkgc3lzdGVtIGNvbnRyb2wgaHlwZXJjYWxsIGF0
IHJ1biB0aW1lLgo+Pj4gKwo+Pj4gKwkgIFRoaXMgaXMgdXNlZCB0byByZWNvcmQgeGVuIGludGVy
bmFsIHJ1bm5pbmcgc3RhdHVzLgo+Pj4gKwkgIHdpdGggYSBsaXR0ZSBwZXJmb3JtYW5jZSBvdmVy
aGVhZC4KPj4+ICsJICBDYW4gYmUgc2V0IHRvICdOJyBpZiB5b3UgZG9udCB3YW50IHRoaXMgZnVu
Y3Rpb24uCj4+PiArCSAgV2hlbiBub3QgY29uZmlndXJlZCwgJ1hFTl9TVFNDVExfdGJ1Zl9vcCcg
Y29tbWFuZCB3aWxsIHJlc3VsdCAnRU5PU1lT4oCZLgo+PiBJIHRoaW5rIHRoaXMgd291bGQgbG9v
ayBiZXR0ZXIgc29tZXRoaW5nIGxpa2UgdGhpczoKPj4KPj4g4oCcRW5hYmxlIHRyYWNpbmcgaW5m
cmFzdHJ1Y3R1cmXigJ0KPj4KPj4g4oCcRW5hYmxlIGluIHRyYWNpbmcgaW5mcmFzdHJ1Y3R1cmUg
YW5kIHByZS1kZWZpbmVkIHRyYWNlcG9pbnRzIHdpdGhpbiBYZW4uCj4+IFRoaXMgd2lsbCBhbGxv
dyBsaXZlIGluZm9ybWF0aW9uIGFib3V0IFhlbuKAmXMgZXhlY3V0aW9uIGFuZCBwZXJmb3JtYW5j
ZSB0byBiZQo+PiBjb2xsZWN0ZWQgYXQgcnVuIHRpbWUgZm9yIGRlYnVnZ2luZyBvciBwZXJmb3Jt
YW5jZSBhbmFseXNpcy4gIE1lbW9yeSBhbmQKPj4gZXhlY3V0aW9uIG92ZXJoZWFkIHdoZW4gbm90
IGFjdGl2ZSBpcyBtaW5pbWFsLiIKPj4KPj4gQWxzbywgSeKAmW0gbm90IDEwMCUgZmFtaWxpYXIg
d2l0aCB0aGUga2NvbmZpZyBzeW50YXgg4oCUIEkgdGhpbmsgd2Ugd2FudAo+PiB0cmFjaW5nIGVu
YWJsZWQgYnkgZGVmYXVsdCB1bmxlc3MgYWN0aXZlbHkgZGlzYWJsZWQ7IGlzIHRoYXQgd2hhdCB3
aWxsIGhhcHBlbgo+PiBoZXJlPyAgT3Igd2lsbCBpdCBvbmx5IGJlIGVuYWJsZWQgaWYgRVhQRVJU
ID09IOKAmHnigJk/Cj4gT2gsIGluZGVlZCAtIHRoZXJlJ3MgYSAiZGVmYXVsdCB5IiBtaXNzaW5n
LgoKVGhhbmtzIGZvciBzdWdnZXN0aW9uIGZvciB0aGUgaGVscCB0ZXh0LiBhbmQgcG9pbnRpbmcg
b3V0ICJkZWZhdWx0IHkiIAptaXNzaW5nLgoKRml4ZWQgaW4gdjMgYW5kIHBsZWFzZSBkaXNjYXJk
IHYyLgoKPgo+IEphbgo+Cj4gLgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
