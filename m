Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF3912F71
	for <lists+xen-devel@lfdr.de>; Fri,  3 May 2019 15:44:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hMYRW-0001UN-WB; Fri, 03 May 2019 13:41:38 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hPPK=TD=citrix.com=prvs=019e908d5=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hMYRW-0001UI-9L
 for xen-devel@lists.xenproject.org; Fri, 03 May 2019 13:41:38 +0000
X-Inumbo-ID: 2b96cf9b-6da9-11e9-843c-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2b96cf9b-6da9-11e9-843c-bc764e045a96;
 Fri, 03 May 2019 13:41:36 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,425,1549929600"; d="scan'208";a="85062463"
Date: Fri, 3 May 2019 14:41:33 +0100
From: Wei Liu <wei.liu2@citrix.com>
To: Julien Grall <julien.grall@arm.com>
Message-ID: <20190503134133.GC5900@zion.uk.xensource.com>
References: <CAOcoXZZtsXQMp0EzFAa2WEBL1sEUcFsNozaQshsnNEs3=NQK3g@mail.gmail.com>
 <CAOcoXZY6jpPKcWTXPqz0sr=Amw7J0KSaBRWiRnQRgTC2XR=hjQ@mail.gmail.com>
 <f95ad35b-42f6-4df2-cade-7a8115f9e49a@arm.com>
 <CAOcoXZaMLfHSyLSE04xRFZZY0hLkFcJ5cBqHTdmwDoqwcreD1w@mail.gmail.com>
 <ff543e3c-0619-5aa6-b36a-e1a8b8cce886@arm.com>
 <20190503110819.GA5900@zion.uk.xensource.com>
 <63ea8905-87ca-a419-95bf-ae497bf1ff85@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <63ea8905-87ca-a419-95bf-ae497bf1ff85@arm.com>
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

T24gRnJpLCBNYXkgMDMsIDIwMTkgYXQgMDI6MzU6MDhQTSArMDEwMCwgSnVsaWVuIEdyYWxsIHdy
b3RlOgo+IEhpIFdlaSwKPiAKPiBPbiA1LzMvMTkgMTI6MDggUE0sIFdlaSBMaXUgd3JvdGU6Cj4g
PiBPbiBUaHUsIE1heSAwMiwgMjAxOSBhdCAwOTo0MzoxN1BNICswMTAwLCBKdWxpZW4gR3JhbGwg
d3JvdGU6Cj4gPiA+ICgrIFdlaSkKPiA+ID4gCj4gPiA+IE9uIDUvMi8xOSA1OjU1IFBNLCBWaWt0
b3IgTWl0aW4gd3JvdGU6Cj4gPiA+ID4gSGkgSnVsaWVuLAo+ID4gPiAKPiA+ID4gSGksCj4gPiA+
IAo+ID4gPiA+IFBsZWFzZSBmaW5kIHRyYWNlIGxvZyBiZWxvdzoKPiA+ID4gPiAKPiA+ID4gPiBy
b290QGgzdWxjYjp+IyB4ZW5jb3YgcmVzZXQKPiA+ID4gPiAoWEVOKSBEYXRhIEFib3J0IFRyYXAu
IFN5bmRyb21lPTB4Nwo+ID4gPiA+IChYRU4pIFdhbGtpbmcgSHlwZXJ2aXNvciBWQSAweDM2MTcw
MCBvbiBDUFUzIHZpYSBUVEJSIDB4MDAwMDAwMDA3ODI2NjAwMAo+ID4gPiBTbyB0aGlzIGlzIGEg
ZGF0YSBhYm9ydCB3aGVuIHRyeWluZyB0byBhY2Nlc3MgVkEgMHgzNjE3MDAgKGl0IGlzIHBhcnQg
b2YgWGVuCj4gPiA+IGl0c2VsZikuIEkgbWlzcmVhZCB0aGUgQXJtIEFybSBiZWZvcmUsIHdoaWxl
IElTViBpcyAwIERGU0Mgd2lsbCBzdGlsbAo+ID4gPiBwcm92aWRlIGEgY29ycmVjdCB2YWx1ZS4g
U28gaGVyZSB3ZSBoYXZlIGEgIlRyYW5zbGF0aW9uIGZhdWx0LCBsZXZlbCAzIi4KPiA+ID4gCj4g
PiA+IFdoaWNoIG1ha2VzIHNlbnNlIGJlY2F1c2UgLi4uCj4gPiA+IAo+ID4gPiAKPiA+ID4gPiAo
WEVOKSAwVEhbMHgwXSA9IDB4MDAwMDAwMDA3ODI2NWY3Zgo+ID4gPiA+IChYRU4pIDFTVFsweDBd
ID0gMHgwMDAwMDAwMDc4MjYyZjdmCj4gPiA+ID4gKFhFTikgMk5EWzB4MV0gPSAweDAwNDAwMDAw
NzgyNWZmN2YKPiA+ID4gPiAoWEVOKSAzUkRbMHgxNjFdID0gMHgwMDYwMDAwMDc4MWUxZjdlCj4g
PiA+IAo+ID4gPiB0aGUgM3JkIGVudHJ5IGlzIG5vdCB2YWxpZC4gSSBtYW5hZ2VkIHRvIHJlZHVj
ZSB0aGUgZXJyb3IgYW5kIGl0IGxvb2tzIGxpa2UKPiA+ID4gZ2NvdiBpcyB0cnlpbmcgdG8gYWNj
ZXNzIGEgY291bnRlciBpbiB0aGUgc2VjdGlvbiBpbml0LmRhdGEuCj4gPiA+IAo+ID4gPiBBcyBh
bGwgdGhlIC5pbml0Liogc2VjdGlvbnMgYXJlIHN0cmlwcGVkIGFmdGVyIGJvb3QsIGl0IG1lYW5z
IHRoYXQgYW55dGhpbmcKPiA+ID4gaW4gLmluaXQuZGF0YSBjYW5ub3QgYmUgYWNjZXNzZWQgYW55
bW9yZS4KPiA+ID4gCj4gPiA+IFdlaSwgaG93IGRvIHlvdSBkZWFsIHdpdGggY291bnRlcnMgaW4g
aW5pdC5kYXRhIG9uIHg4Nj8KPiA+IAo+ID4gVGhlIGJ1aWxkIHN5c3RlbSBleHBsaWNpdGx5IGNv
bXBpbGUgYW55IC5pbml0IGJpbmFyeSB3aXRob3V0IGdjb3YKPiA+IG9wdGlvbi4gU28gbWF5YmUg
c29tZSBmaWxlIHdhcyBub3QgY29ycmVjdGx5IGFkZGVkPwo+IAo+IFRoYW5rIHlvdSBmb3IgdGhl
IHBvaW50ZXIuIFRoZSBwcm9ibGVtIGlzIGNvbWluZyBmcm9tIGxpYmZkdC4gVGhlIGVudGlyZQo+
IGxpYnJhcnkgaXMgbW92ZWQgdG8gLmluaXQgdXNpbmc6Cj4gCj4gICQoT0JKQ09QWSkgJChmb3Jl
YWNoIHMsJChTRUNUSU9OUyksLS1yZW5hbWUtc2VjdGlvbiAuJChzKT0uaW5pdC4kKHMpKSAkPCAk
QAo+IAo+IFNvIHdlIG5lZWQgdG8gdGVsbCB0aGUgdG9wIE1ha2VmaWxlIHRvIGZpbHRlciBvdXQg
bGliZmR0LiBUaGUgcGF0Y2ggYmVsb3cKPiBzaG91bGQgZG8gdGhlIGpvYjoKPiAKPiBkaWZmIC0t
Z2l0IGEveGVuL2NvbW1vbi9saWJmZHQvTWFrZWZpbGUgYi94ZW4vY29tbW9uL2xpYmZkdC9NYWtl
ZmlsZQo+IGluZGV4IGQ4MWY1NGI2YjguLmMwNzViYmY1NDYgMTAwNjQ0Cj4gLS0tIGEveGVuL2Nv
bW1vbi9saWJmZHQvTWFrZWZpbGUKPiArKysgYi94ZW4vY29tbW9uL2xpYmZkdC9NYWtlZmlsZQo+
IEBAIC0zLDYgKzMsNyBAQCBpbmNsdWRlIE1ha2VmaWxlLmxpYmZkdAo+ICBTRUNUSU9OUyA6PSB0
ZXh0IGRhdGEgJChTUEVDSUFMX0RBVEFfU0VDVElPTlMpCj4gCj4gIG9iai15ICs9IGxpYmZkdC5v
Cj4gK25vY292LXkgKz0gbGliZmR0Lm8KPiAKPiAgQ0ZMQUdTICs9IC1JJChCQVNFRElSKS9pbmNs
dWRlL3hlbi9saWJmZHQvCj4gCj4gV2hpbGUgbG9va2luZyBhdCB0aGUgY29kZSwgSSBub3RpY2Vk
IGxpYmVsZiBpcyBhbHNvIGJ1aWx0IHdpdGggY292ZXJhZ2UgYnV0Cj4gaW4gLmluaXQgc2VjdGlv
bi4gU28gSSB3b3VsZCBleHBlY3QgdGhlIHNhbWUgZXJyb3Igb24geDg2LCBkaWQgeW91IHRyeQo+
ICJ4ZW5jb3YgcmVzZXQiIG9uIHg4Nj8KCkkgZGlkLiBJdCB3b3JrZWQuIFRob3VnaCBhdCB0aGlz
IHBvaW50IEknbSBub3Qgc3VyZSB3aHkgaXQgd29ya2VkLiA6LS8KCldlaS4KCj4gCj4gQ2hlZXJz
LAo+IAo+IC0tIAo+IEp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
