Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C40813002
	for <lists+xen-devel@lfdr.de>; Fri,  3 May 2019 16:22:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hMZ2i-0005rm-8X; Fri, 03 May 2019 14:20:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hPPK=TD=citrix.com=prvs=019e908d5=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hMZ2h-0005ku-FM
 for xen-devel@lists.xenproject.org; Fri, 03 May 2019 14:20:03 +0000
X-Inumbo-ID: 86e2470c-6dae-11e9-9bcf-172748fe204d
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 86e2470c-6dae-11e9-9bcf-172748fe204d;
 Fri, 03 May 2019 14:19:57 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,426,1549929600"; d="scan'208";a="85066800"
Date: Fri, 3 May 2019 15:19:52 +0100
From: Wei Liu <wei.liu2@citrix.com>
To: Julien Grall <julien.grall@arm.com>
Message-ID: <20190503141952.GD5900@zion.uk.xensource.com>
References: <CAOcoXZZtsXQMp0EzFAa2WEBL1sEUcFsNozaQshsnNEs3=NQK3g@mail.gmail.com>
 <CAOcoXZY6jpPKcWTXPqz0sr=Amw7J0KSaBRWiRnQRgTC2XR=hjQ@mail.gmail.com>
 <f95ad35b-42f6-4df2-cade-7a8115f9e49a@arm.com>
 <CAOcoXZaMLfHSyLSE04xRFZZY0hLkFcJ5cBqHTdmwDoqwcreD1w@mail.gmail.com>
 <ff543e3c-0619-5aa6-b36a-e1a8b8cce886@arm.com>
 <20190503110819.GA5900@zion.uk.xensource.com>
 <63ea8905-87ca-a419-95bf-ae497bf1ff85@arm.com>
 <20190503134133.GC5900@zion.uk.xensource.com>
 <b0947b60-d89a-54a5-a11b-708b64ff8053@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b0947b60-d89a-54a5-a11b-708b64ff8053@arm.com>
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
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Andrii_Anisov@epam.com,
 xen-devel@lists.xenproject.org, Viktor Mitin <viktor.mitin.19@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBNYXkgMDMsIDIwMTkgYXQgMDM6MTY6NTJQTSArMDEwMCwgSnVsaWVuIEdyYWxsIHdy
b3RlOgo+ID4gPiBkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9saWJmZHQvTWFrZWZpbGUgYi94ZW4v
Y29tbW9uL2xpYmZkdC9NYWtlZmlsZQo+ID4gPiBpbmRleCBkODFmNTRiNmI4Li5jMDc1YmJmNTQ2
IDEwMDY0NAo+ID4gPiAtLS0gYS94ZW4vY29tbW9uL2xpYmZkdC9NYWtlZmlsZQo+ID4gPiArKysg
Yi94ZW4vY29tbW9uL2xpYmZkdC9NYWtlZmlsZQo+ID4gPiBAQCAtMyw2ICszLDcgQEAgaW5jbHVk
ZSBNYWtlZmlsZS5saWJmZHQKPiA+ID4gICBTRUNUSU9OUyA6PSB0ZXh0IGRhdGEgJChTUEVDSUFM
X0RBVEFfU0VDVElPTlMpCj4gPiA+IAo+ID4gPiAgIG9iai15ICs9IGxpYmZkdC5vCj4gPiA+ICtu
b2Nvdi15ICs9IGxpYmZkdC5vCj4gPiA+IAo+ID4gPiAgIENGTEFHUyArPSAtSSQoQkFTRURJUikv
aW5jbHVkZS94ZW4vbGliZmR0Lwo+ID4gPiAKPiA+ID4gV2hpbGUgbG9va2luZyBhdCB0aGUgY29k
ZSwgSSBub3RpY2VkIGxpYmVsZiBpcyBhbHNvIGJ1aWx0IHdpdGggY292ZXJhZ2UgYnV0Cj4gPiA+
IGluIC5pbml0IHNlY3Rpb24uIFNvIEkgd291bGQgZXhwZWN0IHRoZSBzYW1lIGVycm9yIG9uIHg4
NiwgZGlkIHlvdSB0cnkKPiA+ID4gInhlbmNvdiByZXNldCIgb24geDg2Pwo+ID4gCj4gPiBJIGRp
ZC4gSXQgd29ya2VkLiBUaG91Z2ggYXQgdGhpcyBwb2ludCBJJ20gbm90IHN1cmUgd2h5IGl0IHdv
cmtlZC4gOi0vCj4gCj4gSSB0aGluayBJIGtub3cgd2h5LCBvbmx5IHRoZSBzZWN0aW9ucyAudGV4
dCBhbmQgLmRhdGEgYXJlIHByZWZpeGVkIHdpdGgKPiAuaW5pdC4gSW4gdGhlIGNhc2Ugb2YgbGli
ZWxmLCBub25lIG9mIHRoZSBHQ09WIHN5bWJvbHMgc2VlbXMgdG8gYmUgbG9jYXRlZAo+IGluIC5k
YXRhLgo+IAo+IEZvciBsaWJmZHQsIHNvbWUgb2YgdGhlbSBhcmUgbG9jYXRlZCBpbiAuZGF0YSAo
cmVuYW1lZCB0byAuaW5pdC5kYXRhKS4gSGVuY2UKPiB0aGUgZGlmZmVyZW5jZSBpbiBiZWhhdmlv
ci4KPiAKClRoYW5rcyBmb3IgdGhlIGFuYWx5c2lzLgoKPiBXZSBzaG91bGQgcHJvYmFibHkgZml4
ZWQgdGhlIHR3byBsaWJyYXJpZXMgYXMgdGhpcyBpcyBxdWl0ZSBmcmFnaWxlIGZvcgo+IGxpYmVs
ZiBhcyB3ZWxsLgoKU291bmRzIGdvb2QgdG8gbWUuCgpXZWkuCgo+IAo+IENoZWVycywKPiAKPiAt
LSAKPiBKdWxpZW4gR3JhbGwKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwo+IFhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKPiBYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKPiBodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
