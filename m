Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 954FD6E639
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jul 2019 15:18:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hoSj0-0000Tk-WE; Fri, 19 Jul 2019 13:15:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=EVsN=VQ=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hoSiz-0000TY-G6
 for xen-devel@lists.xenproject.org; Fri, 19 Jul 2019 13:15:01 +0000
X-Inumbo-ID: 3461176e-aa27-11e9-aa72-fb4cc48b3e0d
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3461176e-aa27-11e9-aa72-fb4cc48b3e0d;
 Fri, 19 Jul 2019 13:14:57 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1563542097; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=oKv2pRXiXf7hUOixf9tpaigH8EZTg4T7mQ68ZtO1AuA=;
 b=vUlO5R/JaIjGGrYAiqazKryhXOXTLIv24ZwqNyn4P7R7CvsklFrZs9iuaIB9/1+1gdpTCRje
 5gX1L15L6rJOs+urs+fNQeF5mv+bEW2nJbjizbXM+en4+vzgZQKtKsHwnb6HcriedPm/eQ7D
 Xna3HT4YpbhDq/aCLVH6lGh43P0=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by mxa.mailgun.org with ESMTP id 5d31c24f.7f344ee06130-smtp-out-n03;
 Fri, 19 Jul 2019 13:14:55 -0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id s3so28778171wms.2
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jul 2019 06:14:55 -0700 (PDT)
X-Gm-Message-State: APjAAAWuHfgXTtV7E6ElwhLFXQiNfC/zPzirLw/X8L9H2nU0BmR75UuP
 84HpSvxQ8HSTPwXSQnq8Z7thXJB9203yh1o7cjI=
X-Google-Smtp-Source: APXvYqzm/+9yZkRndz63FFbpgSkGC/pMo9EVZnPkbRVtbZl6w05adpnTbDwAortD6AT2lBWTVNbJEHxsfP9nKxeUlhM=
X-Received: by 2002:a05:600c:c6:: with SMTP id
 u6mr49662550wmm.153.1563542094197; 
 Fri, 19 Jul 2019 06:14:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190718144317.23307-1-tamas@tklengyel.com>
 <119d0edb-cb12-fbad-9e3e-8c0a469983df@arm.com>
 <CABfawh=DwOP5eQYmMVNF+n-khkbEDFia0eo=JbE0yhCKjV_+8Q@mail.gmail.com>
 <fcbf4968-7b82-6e5d-75ae-e4c2ff059b4d@arm.com>
 <CABfawh=R-K3nje0gdsi-26Zj7-y6=KkiW=-s0TLK1o3QgVXLmw@mail.gmail.com>
 <27973ea5-a0d4-0ca4-fd3f-9680f179b283@arm.com>
 <CABfawhk4TzQemnG+3XwtQ4SGmquufOd4nFGajEWJJ++YFuqfZw@mail.gmail.com>
 <a0c71023-2546-d7c4-771c-02a944c93d90@arm.com>
In-Reply-To: <a0c71023-2546-d7c4-771c-02a944c93d90@arm.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Fri, 19 Jul 2019 07:14:17 -0600
X-Gmail-Original-Message-ID: <CABfawhm+e4YfnPGT9K-aWqipAFJp1tqfFr9dNDm6g0Twb2gGoA@mail.gmail.com>
Message-ID: <CABfawhm+e4YfnPGT9K-aWqipAFJp1tqfFr9dNDm6g0Twb2gGoA@mail.gmail.com>
To: Julien Grall <julien.grall@arm.com>
Subject: Re: [Xen-devel] [RFC] xen: Add .astylerc for automated
 style-formatting
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
Cc: Artem Mygaiev <Artem_Mygaiev@epam.com>, Lars Kurth <lars.kurth@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Iurii Artemenko <Iurii_Artemenko@epam.com>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBKdWwgMTksIDIwMTkgYXQgNzoxMSBBTSBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFs
bEBhcm0uY29tPiB3cm90ZToKPgo+IEhpIFRhbWFzLAo+Cj4gT24gMTkvMDcvMjAxOSAxNDowMCwg
VGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+ID4gT24gRnJpLCBKdWwgMTksIDIwMTkgYXQgMjo0MyBB
TSBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPiB3cm90ZToKPiA+Pgo+ID4+IEhp
IFRhbWFzLAo+ID4+Cj4gPj4gT24gMTgvMDcvMjAxOSAxODo0OCwgVGFtYXMgSyBMZW5neWVsIHdy
b3RlOgo+ID4+Pj4gICAgICAtIExpbmUgMTAyNTogVGhlIHRvb2xzIG5lZWRzIHRvIGJlIGFibGUg
dG8gZGVhbCBmb3JfZWFjaF92Y3B1KC4uLikgJiBjby4KPiA+Pj4KPiA+Pj4gVGhlc2UgY2FuIGJl
IG1hZGUgT0sgYnkgYWRkaW5nIGJyYWNlcy4gT3RoZXIgdGhhbiB0aGF0IHRoZSBvbmx5IHdheSBJ
Cj4gPj4+IGZvdW5kIHRvIG1ha2UgaXQgbm90IGNoYW5nZSB0aGUgaW5kZW50YXRpb24gaXMgdG8g
YWRkIHRoZSBjb21tZW50ICIvKgo+ID4+PiAqSU5ERU5ULU9GRiogKi8iIGJlZm9yZSB0aGUgYmxv
Y2sgYW5kICIvKiAqSU5ERU5ULU9OKiAqLyIgYWZ0ZXJ3YXJkcy4KPiA+Pgo+ID4+IE5vbmUgb2Yg
dGhlbSBsb29rcyByZWFsbHkgYXBwZWFsaW5nIGJlY2F1c2UgaXQgbWVhbnMgYXN0eWxlIHdpbGwg
bm90IGNvcnJlY3RseQo+ID4+IGluZGVudCBpZiB0aGUgdXNlciBkb2VzIG5vdCBhZGQgYnJhY2Vz
IG9yIGNvbW1lbnRzLgo+ID4+Cj4gPj4gQ291bGQgYXN0eWxlIGJlIGVhc2lseSBtb2RpZmllZCB0
byByZWNvZ25pemUgZm9yZWFjaCBtYWNyb3M/Cj4gPgo+ID4gTm90IHRoYXQgSSdtIGF3YXJlIG9m
LiBJZiB5b3UgZG9uJ3Qgd2FudCB0byBtYW51YWxseSBhbm5vdGF0ZSBmaWxlcwo+ID4gd2l0aCB1
bnN1cHBvcnRlZCBtYWNyb3MgdGhlbiBqdXN0IGV4Y2x1ZGUgdGhvc2UgZmlsZXMgZnJvbSBhc3R5
bGUuIEkKPiA+IHdvdWxkbid0IHJlY29tbWVuZCBhZGRpbmcgdGhpcyB0byB0aGUgQ0kgZm9yIGFs
bCBmaWxlcywgb25seSBmb3IgdGhvc2UKPiA+IHRoYXQgdGhlaXIgcmVzcGVjdGl2ZSBtYWludGFp
bmVycyBoYXZlIGNvbmZpcm1lZCB0byBjb25mb3JtIHRvIHRoZQo+ID4gc3R5bGUgYW5kIHdhbnQg
dG8gZW5mb3JjZSBpdCBnb2luZyBmb3J3YXJkLgo+Cj4gU28gYSBjb3VwbGUgdXNlIG9mIGFuIHVu
c3VwcG9ydGVkIG1hY3JvcyB3b3VsZCBtYWtlIGltcG9zc2libGUgdG8gZW5mb3JjZSB0aGUKPiBj
b2Rpbmcgc3R5bGUuIFRoaXMgaXMgbm90IGEgdmVyeSBpZGVhbCBwb3NpdGlvbiB0byBiZSBpbi4K
Pgo+IF9pZl8gd2UgYXJlIGdvaW5nIHRvIGFkb3B0IGFzdHlsZSB0aGVuIHdlIG5lZWQgdG8gYmUg
YWJsZSB0byBlbmZvcmNlIGl0IG9uIGV2ZXJ5Cj4gWGVuIGZpbGVzIGxvbmctdGVybS4gSWYgaXQg
aXMgbm90IHBvc3NpYmxlIHRvIGRvIGl0IHdpdGggYXN0eWxlLCB0aGVuIG1heWJlIHRoaXMKPiBp
cyBub3QgdGhlIHJpZ2h0IHRvb2wgdG8gdXNlLgo+Cj4gRm9yIGluc3RhbmNlLCBJIGtub3cgdGhh
dCB0b29scyBzdWNoIGFzIGNsYW5nLWZvcm1hdCBpcyBhYmxlIHRvIGRlYWwgd2l0aAo+IGZvcmVh
Y2ggbWFjcm9zLgoKSWYgdGhlcmUgYXJlIGJldHRlciB0b29scyB0aGVuIHN1cmUsIEkgZG9uJ3Qg
cmVhbGx5IG1pbmQgdXNpbmcKc29tZXRoaW5nIGVsc2UuIEkganVzdCBkb24ndCBoYXZlIHRpbWUg
dG8gZG8gdGhlIG1hbnVhbCBzdHlsZSBjaGVjawpiYWNrLWFuZC1mb3J0aCBhbnltb3JlLCBzbyB0
aGUgc29vbmVyIHdlIGhhdmUgc29tZXRoaW5nIGluIHBsYWNlIHRoZQpiZXR0ZXIuCgpUYW1hcwoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
