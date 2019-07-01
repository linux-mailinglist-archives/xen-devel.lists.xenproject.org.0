Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A2A5C57C
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jul 2019 00:07:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hi4Px-0006nj-0w; Mon, 01 Jul 2019 22:04:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xQDN=U6=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1hi4Pv-0006ne-Mn
 for xen-devel@lists.xenproject.org; Mon, 01 Jul 2019 22:04:55 +0000
X-Inumbo-ID: 40987484-9c4c-11e9-bbce-ef233ce6d329
Received: from mail-lj1-f193.google.com (unknown [209.85.208.193])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 40987484-9c4c-11e9-bbce-ef233ce6d329;
 Mon, 01 Jul 2019 22:04:53 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id 16so14755217ljv.10
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jul 2019 15:04:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QazgiR6a6aL14NgyBvPYjIozT1AXxSezo73OKoNOAsA=;
 b=ouIm4f2bxPU+wPFhjynEj1+9U93TrerutDsZuS/kUH4d/bDcFWrrZTKYKE8FGoM60f
 o0aJlpzbmA/gfoXgLR9Zbk4t/G3FdG2jtGnTaXvMpZgG/xoLoFXmzU4a0zQyt6r/eehY
 3PTAvMWwi95Adw974u6fmqqwusKGaWNsEfHb5Re6GaCx9RGBHVEt43HQXrf7LtsIRXjo
 2CtXKji5K4Giutv9UJX0SUOGeQ/DS0NUqMLyFvVmfXoaIO2FjrXMIqi0sSMzODgxbj0P
 MD0sTxVqGzFMfsej7xrMhwJoLrHmvWUhybsSnbWQlUUQI80rzDJ6sm+OUap4E3hnlu0y
 VP6Q==
X-Gm-Message-State: APjAAAXib/1X4fdO7LQi0FQpNs8jOJPM6/fuYXbuy134CApDAmH+26zx
 APFHJEt2RdE61RpQVtv6QkVKHRHM8uk=
X-Google-Smtp-Source: APXvYqy0QnpDg1a4K1lk9SU0/O/MS/LbquJTHFcAYXZLoplCFOJ0kIW6CR15YX7xUJYREttGdZyQzQ==
X-Received: by 2002:a2e:93c8:: with SMTP id p8mr11415102ljh.6.1562018691973;
 Mon, 01 Jul 2019 15:04:51 -0700 (PDT)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com.
 [209.85.167.46])
 by smtp.gmail.com with ESMTPSA id k4sm3506014ljj.41.2019.07.01.15.04.50
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Mon, 01 Jul 2019 15:04:50 -0700 (PDT)
Received: by mail-lf1-f46.google.com with SMTP id d11so9862923lfb.4
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jul 2019 15:04:50 -0700 (PDT)
X-Received: by 2002:a19:488e:: with SMTP id
 v136mr12572934lfa.192.1562018690193; 
 Mon, 01 Jul 2019 15:04:50 -0700 (PDT)
MIME-Version: 1.0
References: <20190617161050.4684-1-anthony.perard@citrix.com>
 <20190701150443.GJ13449@perard.uk.xensource.com>
 <e65a329b-03e3-1beb-d91a-2724b9098fe9@suse.com>
In-Reply-To: <e65a329b-03e3-1beb-d91a-2724b9098fe9@suse.com>
From: Wei Liu <wl@xen.org>
Date: Mon, 1 Jul 2019 23:04:34 +0100
X-Gmail-Original-Message-ID: <CAK9nU=rhyKdFBm96MGAVZhJuBXeVSDxU5w_4tvQh-G7wNKr7rQ@mail.gmail.com>
Message-ID: <CAK9nU=rhyKdFBm96MGAVZhJuBXeVSDxU5w_4tvQh-G7wNKr7rQ@mail.gmail.com>
To: Jan Beulich <JBeulich@suse.com>
Subject: Re: [Xen-devel] Ping: [PATCH] Config.mk: update OVMF to
 edk2-stable201905
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 KonradRzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCAxIEp1bCAyMDE5IGF0IDE2OjIyLCBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3VzZS5j
b20+IHdyb3RlOgo+Cj4gT24gMDEuMDcuMjAxOSAxNzowNCwgQW50aG9ueSBQRVJBUkQgd3JvdGU6
Cj4gPiBPbiBNb24sIEp1biAxNywgMjAxOSBhdCAwNToxMDo1MFBNICswMTAwLCBBbnRob255IFBF
UkFSRCB3cm90ZToKPiA+PiBVcGRhdGUgdG8gdGhlIGxhdGVzdCBzdGFibGUgdGFnLgo+ID4+Cj4g
Pj4gU2lnbmVkLW9mZi1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5j
b20+Cj4gPgo+ID4gQ291bGQgb25lIG9mIHlvdSBjb21taXQgdGhpcyBwYXRjaD8KPgo+IEkgd2Fz
IHdvbmRlcmluZyB3aGF0IHRoZSBwb2xpY3kgaGVyZSBpcyAtIGRvIHN1Y2ggdXBkYXRlcyBnbyBp
bgo+IHdpdGhvdXQgYW55IGFja3M/Cj4KCkFudGhvbnkgaXMgdGhlIG1haW50YWluZXIuIEkgdGhp
bmsgaGlzIGp1ZGdlbWVudCBpcyBzdWZmaWNpZW50LgpQcmV2aW91c2x5IEkganVzdCBjb21taXR0
ZWQgaGlzIHBhdGNoIHdpdGhvdXQgZ2l2aW5nIG15IGFjay4KCklmIHlvdSByZWFsbHkgd2FudCBv
bmU6CgpBY2tlZC1ieTogV2VpIExpdSA8d2xAeGVuLm9yZz4KCldlaS4KCj4gSmFuCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
