Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9898135D48
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2020 16:59:05 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipa9f-0007Gb-IZ; Thu, 09 Jan 2020 15:55:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fuxF=26=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1ipa9e-0007GW-15
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2020 15:55:26 +0000
X-Inumbo-ID: 724a036a-32f8-11ea-b9fc-12813bfff9fa
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 724a036a-32f8-11ea-b9fc-12813bfff9fa;
 Thu, 09 Jan 2020 15:55:24 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1578585325; h=Content-Transfer-Encoding: Content-Type: Cc: To:
 Subject: Message-ID: Date: From: In-Reply-To: References: MIME-Version:
 Sender; bh=e2Y7qe52S0ynhBLD5/5WCrRo+j2R3YvlO2aaeJPcby0=;
 b=sc6ODkE4L1YFvMiXX1WottiUflV7BT96KkCyFbQOEiAxOrBrJzCi3JtOtL1Kle5Siryu+BQp
 SPdUlrrbg5JthguL0TLG5OAO/3Qzg5MDGb3cXy47z0XdmmgGs4yw7NfBBUDocb+NDjnFIbc2
 OSZBpoqd53sdtZyaGqRlN4aF24g=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by mxa.mailgun.org with ESMTP id 5e174ce5.7f7ef11b0d70-smtp-out-n01;
 Thu, 09 Jan 2020 15:55:17 -0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id d73so3484003wmd.1
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jan 2020 07:55:16 -0800 (PST)
X-Gm-Message-State: APjAAAU2UmIYVdJJ/TObMF1QSBu0Ctp7m0s6dFy26UreGF7AFHk02UdO
 qr5a5uzIwSjzlENqRlg+Wl+xtBTjfw1SkUE6iCg=
X-Google-Smtp-Source: APXvYqy2B2eZyD3LE4H5yE5jDA2fTj0KhwpbPSAhPobI8FvnSkZBO3FO0bPf1BXo4wZPp2hFFu+hnR4y+3EVd4roDhE=
X-Received: by 2002:a1c:7918:: with SMTP id l24mr6050961wme.125.1578585315481; 
 Thu, 09 Jan 2020 07:55:15 -0800 (PST)
MIME-Version: 1.0
References: <cover.1578503483.git.tamas.lengyel@intel.com>
 <b816ff21d1156eeb5d68b35932ad23f4e5891bdb.1578503483.git.tamas.lengyel@intel.com>
 <5084334f-7ed6-6095-e31a-d530454357a4@xen.org>
 <CABfawhnwdYX6W_arEL_SP4eqvrOYQZUB1jqeuMA+WUXo_TaZiQ@mail.gmail.com>
 <20200109151010.GC11756@Air-de-Roger>
In-Reply-To: <20200109151010.GC11756@Air-de-Roger>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Thu, 9 Jan 2020 08:54:39 -0700
X-Gmail-Original-Message-ID: <CABfawhkHEk2tx2XVb3hPuFGWMQJi1EaZCdeZ9eOEWfUOE_dkew@mail.gmail.com>
Message-ID: <CABfawhkHEk2tx2XVb3hPuFGWMQJi1EaZCdeZ9eOEWfUOE_dkew@mail.gmail.com>
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [Xen-devel] [PATCH v4 15/18] xen/mem_sharing: VM forking
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Julien Grall <julien@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBKYW4gOSwgMjAyMCBhdCA4OjEwIEFNIFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBh
dUBjaXRyaXguY29tPiB3cm90ZToKPgo+IE9uIFRodSwgSmFuIDA5LCAyMDIwIGF0IDA2OjQxOjEy
QU0gLTA3MDAsIFRhbWFzIEsgTGVuZ3llbCB3cm90ZToKPiA+IE9uIFRodSwgSmFuIDksIDIwMjAg
YXQgMzoyOSBBTSBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPiB3cm90ZToKPiA+ID4KPiA+
ID4gSGkgVGFtYXMsCj4gPiA+Cj4gPiA+IE9uIDA4LzAxLzIwMjAgMTc6MTQsIFRhbWFzIEsgTGVu
Z3llbCB3cm90ZToKPiA+ID4gPiArc3RhdGljIGludCBtZW1fc2hhcmluZ19mb3JrKHN0cnVjdCBk
b21haW4gKmQsIHN0cnVjdCBkb21haW4gKmNkKQo+ID4gPiA+ICt7Cj4gPiA+ID4gKyAgICBpbnQg
cmM7Cj4gPiA+ID4gKwo+ID4gPiA+ICsgICAgaWYgKCAhZC0+Y29udHJvbGxlcl9wYXVzZV9jb3Vu
dCAmJgo+ID4gPiA+ICsgICAgICAgICAocmMgPSBkb21haW5fcGF1c2VfYnlfc3lzdGVtY29udHJv
bGxlcihkKSkgKQo+ID4gPgo+ID4gPiBBRkFJVSwgdGhlIHBhcmVudCBkb21haW4gd2lsbCBiZSBw
YXVzZWQgaWYgaXQgd2Fzbid0IHBhdXNlZCBiZWZvcmUgYW5kCj4gPiA+IHRoaXMgd2lsbCBub3Qg
YmUgdW5wYXVzZWQgYnkgdGhlIHNhbWUgaHlwZXJjYWxsLiBSaWdodD8KPiA+Cj4gPiBZZXMsIGl0
IG5lZWRzIHRvIHJlbWFpbiBwYXVzZWQgYXMgbG9uZyBhcyB0aGVyZSBhcmUgZm9ya3MgYWN0aXZl
IGZyb20KPiA+IGl0LiBBZnRlcndhcmRzIGl0IGNhbiBiZSB1bnBhdXNlZC4KPgo+IElmIHlvdSB3
YW50IHRoZSBwYXJlbnQgZG9tYWluIHRvIHJlbWFpbiBwYXVzZWQgZm9yIGFzIGxvbmcgYXMgdGhl
Cj4gZm9ya3MgYXJlIGFjdGl2ZSwgc2hvdWxkbid0IGVhY2ggZm9yayBpbmNyZW1lbnQgdGhlIHBh
dXNlIGNvdW50IG9uCj4gY3JlYXRpb24gYW5kIGRlY3JlbWVudCBpdCB3aGVuIHRoZSBmb3JrIGlz
IGRlc3Ryb3llZD8KClRoYXQgd291bGQgd29yay4KCj4KPiBIb3cgY2FuIHlvdSBhc3N1cmUgbm8g
b3RoZXIgb3BlcmF0aW9uIG9yIGVudGl0eSBoYXMgaW5jcmVtZW50ZWQKPiBjb250cm9sbGVyX3Bh
dXNlX2NvdW50IHRlbXBvcmFyeSBhbmQgaXMgbGlrZWx5IHRvIGRlY3JlbWVudCBpdCBhdCBzb21l
Cj4gcG9pbnQgd2hpbGUgZm9ya3MgYXJlIHN0aWxsIGFjdGl2ZT8KClJpZ2h0IG5vdyB3ZSBkb24n
dCBkbyBzYW5pdHkgY2hlY2tzLiBJdCBpcyBqdXN0IGV4cGVjdGVkIHRoYXQgdGhlIHVzZXIKaXMg
bm90IGRvaW5nIGFueXRoaW5nIGluc2FuZSBsaWtlIHRoYXQgLSBJIHdvdWxkIGFyZ3VlIHRoYXQg
Zm9yIGFuCmV4cGVyaW1lbnRhbCBzeXN0ZW0gKG9uZSB0aGF0IGlzIGV2ZW4gaGlkZGVuIGJlaGlu
ZCBDT05GSUdfRVhQRVJUKSBhbgphc3N1bXB0aW9uIGxpa2UgdGhhdCBpcyBzYWZlIHRvIG1ha2Uu
IEJ1dCBkb2luZyB0aGUgcGF1c2UvdW5wYXVzZQpjb21ibyB5b3UgZGVzY3JpYmUgYWJvdmUgaXMg
cHJldHR5IHNpbXBsZSBhbmQgc2hvdWxkIGdldCB0aGUgam9iIGRvbmUuCgpUYW1hcwoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
