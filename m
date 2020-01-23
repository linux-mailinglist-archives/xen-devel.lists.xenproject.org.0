Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11CC2146F8D
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jan 2020 18:23:44 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iug9w-0004Us-R6; Thu, 23 Jan 2020 17:20:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=l7XC=3M=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1iug9v-0004Un-9t
 for xen-devel@lists.xenproject.org; Thu, 23 Jan 2020 17:20:47 +0000
X-Inumbo-ID: ab823262-3e04-11ea-9fd7-bc764e2007e4
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ab823262-3e04-11ea-9fd7-bc764e2007e4;
 Thu, 23 Jan 2020 17:20:36 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1579800038; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=Wsqr2MihcoNSGQQT/OnhCunto6EuGbXQ8+hJighv2Wc=;
 b=BNHyu9/PDpNuK2QGO3vNEjnjoqyZK3q1KAU841cj7Terfiph2OO13r9UmVg4BPzeYIeNUAfL
 N7/IpZXfnzRg6tatKZSQxbBcecGKvi5ZmfKmyOqjjdulpOFMm9NwkvVcdeRmmK4muL3DkwBr
 2WjXnVp8/NUsL5JhoHJikZCXCTo=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by mxa.mailgun.org with ESMTP id 5e29d5df.7f19539b32f0-smtp-out-n02;
 Thu, 23 Jan 2020 17:20:31 -0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id z7so3946433wrl.13
 for <xen-devel@lists.xenproject.org>; Thu, 23 Jan 2020 09:20:30 -0800 (PST)
X-Gm-Message-State: APjAAAW12OjNz6p8pZYuCEvO+zhfJ/BbDquPKQYLBUnLkLZlM5hhm/Ij
 YSLyi5BvaxxKCs59BneGfG8DM2S3nZb3HL6l9bg=
X-Google-Smtp-Source: APXvYqxK0EV5uALdf0GPFrlHAVpCng3yUmJf19dUNR1qk/AYnG9+KTxGfMwOFnue1FNWdio6ZedG7XHUIky/S9VAHMI=
X-Received: by 2002:adf:e74a:: with SMTP id c10mr18966198wrn.386.1579800030103; 
 Thu, 23 Jan 2020 09:20:30 -0800 (PST)
MIME-Version: 1.0
References: <cover.1579628566.git.tamas.lengyel@intel.com>
 <1ccb1524a08c3db2f59b7dae4d8377e1c98903c9.1579628566.git.tamas.lengyel@intel.com>
 <52f14300-8ebe-d7c3-5f54-4084c631034b@suse.com>
 <CABfawhmVqWEkj9RRgiDD8W_C-u+p84H69_HVK-anLaimS+=uPQ@mail.gmail.com>
 <a78e04a8-b7b9-e78c-504b-0a08f4ffc9c4@citrix.com>
In-Reply-To: <a78e04a8-b7b9-e78c-504b-0a08f4ffc9c4@citrix.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Thu, 23 Jan 2020 10:19:51 -0700
X-Gmail-Original-Message-ID: <CABfawhmFoorg_AN5UL3yW-2ErDpaDd8zcCTAfZSOMns7KG=upg@mail.gmail.com>
Message-ID: <CABfawhmFoorg_AN5UL3yW-2ErDpaDd8zcCTAfZSOMns7KG=upg@mail.gmail.com>
To: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [Xen-devel] [PATCH v5 14/18] x86/mem_sharing: use
 default_access in add_to_physmap
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
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBKYW4gMjMsIDIwMjAgYXQgOTo0NCBBTSBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVu
bGFwQGNpdHJpeC5jb20+IHdyb3RlOgo+Cj4gT24gMS8yMi8yMCA1OjA4IFBNLCBUYW1hcyBLIExl
bmd5ZWwgd3JvdGU6Cj4gPiBPbiBXZWQsIEphbiAyMiwgMjAyMCBhdCA4OjM1IEFNIEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4gd3JvdGU6Cj4gPj4KPiA+PiBPbiAyMS4wMS4yMDIwIDE4
OjQ5LCBUYW1hcyBLIExlbmd5ZWwgd3JvdGU6Cj4gPj4+IFdoZW4gcGx1Z2dpbmcgYSBob2xlIGlu
IHRoZSB0YXJnZXQgcGh5c21hcCBkb24ndCB1c2UgdGhlIGFjY2VzcyBwZXJtaXNzaW9uCj4gPj4+
IHJldHVybmVkIGJ5IF9fZ2V0X2dmbl90eXBlX2FjY2VzcyBhcyBpdCBjYW4gYmUgbm9uLXNlbnNp
Y2FsLAo+ID4+Cj4gPj4gImNhbiBiZSIgaXMgdG9vIHZhZ3VlIGZvciBteSB0YXN0ZSAtIGl0IHN1
Z2dlc3RzIHRoZXJlIG1heSBhbHNvIGJlIGNhc2VzCj4gPj4gd2hlcmUgYSBzZW5zaWJsZSB2YWx1
ZSBpcyByZXR1cm5lZCwgYW5kIGhlbmNlIGl0IHNob3VsZCBiZSB1c2VkLiBDb3VsZAo+ID4+IHlv
dSBjbGFyaWZ5IHRoaXMgcGxlYXNlPyAoVGhlIGNvZGUgY2hhbmdlIGl0c2VsZiBvZiBjb3Vyc2Ug
aXMgc2ltcGxlIGFuZAo+ID4+IG1lY2hhbmljYWwgZW5vdWdoIHRvIGxvb2sgb2theS4pCj4gPgo+
ID4gV2VsbCwgSSBjYW4gb25seSBzcGVhayBvZiB3aGF0IEkgb2JzZXJ2ZWQuIFRoZSBjYXNlIHNl
ZW1zIHRvIGJlIHRoYXQKPiA+IG1vc3Qgb2YgdGhlIHRpbWUgdGhlIGZ1bmN0aW9uIGFjdHVhbGx5
IHJldHVybnMgcDJtX2FjY2Vzc19yd3ggKHdoaWNoCj4gPiBpcyBzZW5zaWJsZSksIGJ1dCBvY2Nh
c2lvbmFsbHkgc29tZXRoaW5nIGVsc2UuIEkgZGlkbid0IGludmVzdGlnYXRlCj4gPiB3aGVyZSB0
aGF0IHZhbHVlIGFjdHVhbGx5IGNvbWVzIGZyb20sIGJ1dCB3aGVuIHBvcHVsYXRpbmcgYSBwaHlz
bWFwCj4gPiBsaWtlIHRoaXMgb25seSB0aGUgZGVmYXVsdF9hY2Nlc3MgaXMgc2FuZS4KPgo+IEl0
IHdvdWxkIGJlIGdvb2QgdG8gZ2V0IHRvIHRoZSBib3R0b20gb2YgdGhpcy4gIElzIGl0IHBvc3Np
YmxlIHRoYXQgeW91cgo+IGRvbTAgYWdlbnQgKG9yIHdoYXRldmVyIGl0J3MgY2FsbGVkKSBpcyBj
YWxsaW5nIGFkZF90b19waHlzbWFwKCkgb24gZ2Zucwo+IHRoYXQgaGF2ZSBhbHJlYWR5IGJlZW4g
cG9wdWxhdGVkPyAgSXMgdGhhdCBzb21ldGhpbmcgeW91IHdhbnQgdG8gY2F0Y2g/Cj4KCk9LLCBJ
IHdlbnQgYmFjayBhbmQgZGVjaXBoZXJlZCB3aHkgc29tZXRpbWVzIEkgc2F3IGRpZmZlcmVudCBw
ZXJtaXNzaW9ucyBoZXJlLgoKSW4gdGhlIGNvbnRleHQgSSByYW4gaW50byB0aGlzIGlzc3VlIHRo
ZXJlIGlzIG5vIGRvbTAgYWdlbnQgY2FsbGluZwphZGRfdG9fcGh5c21hcC4gV2Ugd2luZCB1cCBp
biB0aGlzIHBhdGggd2l0aCBhIFZNIGZvcmsgd2hlcmUgdGhlIE1NVQpmYXVsdGVkLiBUaGUgZmF1
bHQgaGFuZGxlciBpcyB0cnlpbmcgdG8gZGV0ZXJtaW5lIHdoZXRoZXIgdGhlIHBhZ2UKbmVlZHMg
dG8gYmUgZm9ya2VkIGZyb20gaXRzIHBhcmVudDogcG9wdWxhdGVkIHdpdGggYSBzaGFyZWQgZW50
cnkgaWYKaXQncyBSL1ggYWNjZXNzLCBvciBkZWR1cGxpY2F0ZWQgaWYgaXQncyBhIFcuIFRoaXMg
Zm9ya2luZyBvbmx5CmFjdHVhbGx5IGhhcHBlbnMgaWYgdGhlIHBhZ2UgdHlwZSB0aGF0IGlzIHJl
dHVybmVkIGJ5IGVwdF9nZXRfZW50cnkgaXMKb2YgYSBob2xlIHR5cGUuIFdoZW4gaXQncyBhIGhv
bGUgdHlwZSwgZXB0X2dldF9lbnRyeSBhbHdheXMgcmV0dXJucwpwMm1fYWNjZXNzX24gYXMgdGhl
IGFjY2VzcyBwZXJtaXNzaW9uLiBDb3B5aW5nIHRoYXQgYWNjZXNzIHBlcm1pc3Npb24KdG8gdGhl
IG5ld2x5IHBvcHVsYXRlZCBlbnRyeSBpcyBiYWQgLSB0aGF0J3Mgd2hhdCB0aGlzIHBhdGNoIGZp
eGVzLgoKQnV0IHRoaXMgcGF0aCBhbHNvIGdldHMgaGl0IHdoZW4gdGhlIE1NVSBmYXVsdHMgZm9y
IG90aGVyIHJlYXNvbnMuIEluCnRob3NlIGNhc2VzIHdpbGwgZ2V0IHBlcm1pc3Npb25zIG90aGVy
IHRoZW4gcDJtX2FjY2Vzc19uIHNpbmNlIHRoZQp0eXBlIGlzIG5vdCBhIGhvbGUuIEJ1dCB3aGVu
IGl0J3Mgbm90IGEgaG9sZSwgdGhpcyBmdW5jdGlvbiBiYWlscyBhcwp0aGF0J3MgYSBjbGVhciBz
aWduYWwgdGhhdCB0aGUgcGFnZSBkb2Vzbid0IG5lZWQgZm9ya2luZy4gU28gSSB3YXMKc2VlaW5n
IHAybV9hY2Nlc3Nfcnd4IHBlcm1pc3Npb24gZm9yIHBhZ2UgYWNjZXNzZXMgdGhhdCB0cmlnZ2Vy
ZWQgdGhlCk1NVSBmYXVsdCBmb3IgcmVhc29ucyBvdGhlciB0aGVuIG1lbV9hY2Nlc3MuIEZvciBl
eGFtcGxlLCB3aGVuIGEKcHJldmlvdXNseSBzaGFyZWQgZW50cnkgbmVlZHMgdW5zaGFyaW5nLgoK
U28gdGhlcmUgaXMgbm8gbXlzdGVyeSBhZnRlciBhbGwsIEkgd2FzIGp1c3QgcHJpbnRpbmcgbXkg
ZGVidWcgbGluZXMKd2l0aCB0aGUgbWVtX2FjY2VzcyBwZXJtaXNzaW9ucyBpcnJlc3BlY3RpdmUg
b2YgdGhlIHBhZ2UgdHlwZSBiZWZvcmUKdGhlIHBhdGggYmFpbHMgZHVlIHRvIHRoZSB0eXBlIGNo
ZWNrLgoKVGFtYXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
