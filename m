Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A5F85DD9
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2019 11:07:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hveM7-0002XK-Jm; Thu, 08 Aug 2019 09:05:07 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=islG=WE=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hveM6-0002XF-9l
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2019 09:05:06 +0000
X-Inumbo-ID: 9c6e67ef-b9bb-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 9c6e67ef-b9bb-11e9-8980-bc764e045a96;
 Thu, 08 Aug 2019 09:05:04 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6EBC81570;
 Thu,  8 Aug 2019 02:05:04 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9A5EF3F706;
 Thu,  8 Aug 2019 02:05:03 -0700 (PDT)
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
References: <1564763985-20312-1-git-send-email-olekstysh@gmail.com>
 <1564763985-20312-7-git-send-email-olekstysh@gmail.com>
 <OSBPR01MB453664F7A6D6AA717761BC07D8D40@OSBPR01MB4536.jpnprd01.prod.outlook.com>
 <a49eccf6-935c-c87a-1fcc-fdc12a67d58e@gmail.com>
 <42cc28a7-5ab3-e24f-16d3-7a287f7f14e8@arm.com>
 <CAPD2p-kJe6=YZ_rPrdDpay-u+r3GDPp58LpxqLpBg0oN_3W1-g@mail.gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <7cecce50-31e9-0e3f-d41c-a051ea6f9971@arm.com>
Date: Thu, 8 Aug 2019 10:05:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAPD2p-kJe6=YZ_rPrdDpay-u+r3GDPp58LpxqLpBg0oN_3W1-g@mail.gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V2 6/6] iommu/arm: Add Renesas IPMMU-VMSA
 support
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
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Lars Kurth <lars.kurth@citrix.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDcvMDgvMjAxOSAyMToyOCwgT2xla3NhbmRyIFR5c2hjaGVua28gd3JvdGU6Cj4gSGksIEp1
bGllbi4KCkhpLAoKPiBTb3JyeSBmb3IgdGhlIHBvc3NpYmxlIGZvcm1hdCBpc3N1ZXMuCj4gCj4g
Cj4gICAgICA+IE5vLCBpdCBpcyBub3QgZGlzYWJsZWQuIEJ1dCwgaXBtbXVfaXJxKCkgdXNlcyBh
bm90aGVyIG1tdS0+bG9jay4gU28sIEkKPiAgICAgID4gdGhpbmssIHRoZXJlIHdvbid0IGJlIGEg
ZGVhZGxvY2suCj4gICAgICA+Cj4gICAgICA+IE9yIEkgcmVhbGx5IG1pc3NlZCBzb21ldGhpbmc/
Cj4gICAgICA+Cj4gICAgICA+IElmIHdlIHdvcnJ5IGFib3V0IGlwbW11X3RsYl9pbnZhbGlkYXRl
KCkgd2hpY2ggaXMgY2FsbGVkIGhlcmUgKHRvCj4gICAgICA+IHBlcmZvcm0gYSBmbHVzaCBieSBy
ZXF1ZXN0IGZyb20gUDJNIGNvZGUsIHdoaWNoIG1hbmFnZXMgYSBwYWdlIHRhYmxlKQo+ICAgICAg
PiBhbmQgZnJvbSB0aGUgaXJxIGhhbmRsZXIgKHRvIHBlcmZvcm0gYSBmbHVzaCB0byByZXN1bWUg
YWRkcmVzcwo+ICAgICAgPiB0cmFuc2xhdGlvbiksIEkgY291bGQgdXNlIGEgdGFza2xldCB0byBz
Y2hlZHVsZSBpcG1tdV90bGJfaW52YWxpZGF0ZSgpCj4gICAgICA+IGZyb20gdGhlIGlycSBoYW5k
bGVyIHRoZW4uIFRoaXMgd2F5IHdlIHdvdWxkIGdldCB0aGlzIHNlcmlhbGl6ZWQuIFdoYXQKPiAg
ICAgID4gZG8geW91IHRoaW5rPwo+IAo+ICAgICBJIGFtIGFmcmFpZCBhIHRhc2tsZXQgaXMgbm90
IGFuIG9wdGlvbi4gWW91IG5lZWQgdG8gcGVyZm9ybSB0aGUgVExCCj4gICAgIGZsdXNoIHdoZW4g
cmVxdWVzdGVkIG90aGVyd2lzZSB5b3UgYXJlIGludHJvZHVjaW5nIGEgc2VjdXJpdHkgaXNzdWUu
Cj4gCj4gICAgIFRoaXMgaXMgYmVjYXVzZSBhcyBzb29uIGFzIGEgcmVnaW9uIGlzIHVubWFwcGVk
IGluIHRoZSBwYWdlIHRhYmxlLCB3ZQo+ICAgICByZW1vdmUgdGhlIGRyb3AgdGhlIHJlZmVyZW5j
ZSBvbiBhbnkgcGFnZSBiYWNraW5nIHRoYXQgcmVnaW9uLiBXaGVuIHRoZQo+ICAgICByZWZlcmVu
Y2UgaXMgZHJvcHBlZCB0byB6ZXJvLCB0aGUgcGFnZSBjYW4gYmUgcmVhbGxvY2F0ZWQgdG8gYW5v
dGhlcgo+ICAgICBkb21haW4gb3IgZXZlbiBYZW4uIElmIHRoZSBUTEIgZmx1c2ggaGFwcGVuIGFm
dGVyLCB0aGVuIHRoZSBndWVzdCBtYXkKPiAgICAgc3RpbGwgYmUgYWJsZSB0byBhY2Nlc3MgdGhl
IHBhZ2UgZm9yIGEgc2hvcnQgdGltZSBpZiB0aGUgdHJhbnNsYXRpb24gaGFzCj4gICAgIGJlZW4g
Y2FjaGVkIGJ5IHRoZSBhbnkgVExCIChJT01NVSwgUHJvY2Vzc29yKS4KPiAKPiAKPiAKPiBJIHVu
ZGVyc3RhbmQgdGhpcy4gScKgYW0gbm90IHByb3Bvc2luZyB0byBkZWxheSBhIHJlcXVlc3RlZCBi
eSBQMk0gY29kZSBUTEIgZmx1c2ggCj4gaW4gYW55IGNhc2UuIEkganVzdCBwcm9wb3NlIHRvIGlz
c3VlIFRMQiBmbHVzaCAod2hpY2ggd2UgaGF2ZSB0byBwZXJmb3JtIGluIGNhc2UgCj4gb2YgcGFn
ZSBmYXVsdHMsIHRvIHJlc29sdmUgZXJyb3IgY29uZGl0aW9uIGFuZCByZXN1bWUgdHJhbnNsYXRp
b25zKSBmcm9tIGEgCj4gdGFza2xldCByYXRoZXIgdGhhbiBmcm9tIGludGVycnVwdCBoYW5kbGVy
IGRpcmVjdGx5LiBUaGlzIGlzIHRoZSBUTEIgZmx1c2ggSSBhbSAKPiBzcGVha2luZyBhYm91dDoK
PiAKPiBodHRwczovL2dpdGh1Yi5jb20vb3R5c2hjaGVua28xL3hlbi9ibG9iL2lwbW11X3Vwc3Ry
ZWFtMi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vaXBtbXUtdm1zYS5jI0w1OTgKPiAKPiBT
b3JyeSBpZiBJIHdhcyB1bmNsZWFyLgoKTXkgbWlzdGFrZSwgSSBtaXNyZWFkIHdoYXQgeW91IHdy
b3RlLgoKSSBmb3VuZCB0aGUgZmx1c2ggaW4gdGhlIHJlbmVzYXMtYnNwIGFuZCBub3QgTGludXgg
dXBzdHJlYW0gYnV0IGl0IGlzIG5vdCBjbGVhciAKd2h5IHRoaXMgaXMgYWN0dWFsbHkgcmVxdWly
ZWQuIFlvdSBhcmUgbm90IGZpeGluZyBhbnkgdHJhbnNsYXRpb24gZXJyb3IuIFNvIHdoYXQgCnRo
aXMgZmx1c2ggd2lsbCBkbz8KClJlZ2FyZGluZyB0aGUgcGxhY2VtZW50IG9mIHRoZSBmbHVzaCwg
dGhlbiBpZiB5b3UgZXhlY3V0ZSBpbiBhIHRhc2tsZXQgaXQgd2lsbCAKbGlrZWx5IGJlIGRvbmUg
bGF0ZXIgb24gd2hlbiB0aGUgSVJRIGhhcyBiZWVuIGFja25vd2xlZGdlLiBXaGF0J3MgdGhlIApp
bXBsaWNhdGlvbiB0byBkZWxheSBpdD8KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
