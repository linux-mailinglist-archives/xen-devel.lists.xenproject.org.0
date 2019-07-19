Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B1C6E6AD
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jul 2019 15:39:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hoT4u-0003OZ-GO; Fri, 19 Jul 2019 13:37:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=EVsN=VQ=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hoT4s-0003OQ-K1
 for xen-devel@lists.xenproject.org; Fri, 19 Jul 2019 13:37:38 +0000
X-Inumbo-ID: 5dd9ce8a-aa2a-11e9-8d5f-ef9613242d65
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5dd9ce8a-aa2a-11e9-8d5f-ef9613242d65;
 Fri, 19 Jul 2019 13:37:35 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1563543455; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=xc3K0uxzAT5b/bxYDuFUTyRr68tJYgXJjlD6owt+UEY=;
 b=Yinns/6ubnHAO8M69dEU7UHj9Rh5vm+rmOk9w+bSlHRkluf5kg3o1YMlz/94ipa/O1WCWTQE
 YKN83/71QutjOFurjjvE3zYY7HmJaldSYYOOMBSmDVrX1ircQAiNTOnTB50ern3st2fBQpBN
 yWK4Tx1C4heChXRakrjqecREhOo=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by mxa.mailgun.org with ESMTP id 5d31c79e.7f45aff92bf0-smtp-out-n02;
 Fri, 19 Jul 2019 13:37:34 -0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id z1so32276449wru.13
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jul 2019 06:37:34 -0700 (PDT)
X-Gm-Message-State: APjAAAU8AVycD0J0B6IdjOnF7bceZnD7nB+z6mUgZagj0+kCuhP7t2EQ
 6gokNZI402nrTZ88RqBOq4Kj0/obovds5QhzySw=
X-Google-Smtp-Source: APXvYqyV1X/TFzLHriw0WKcLi616+6Pl++ySkgx3co7ecU4SJtWozbcl7wa6yRHoEtOOoX67MLiMJDgTEqHF7SMOaus=
X-Received: by 2002:a5d:5012:: with SMTP id e18mr28175590wrt.166.1563543452846; 
 Fri, 19 Jul 2019 06:37:32 -0700 (PDT)
MIME-Version: 1.0
References: <20190718144317.23307-1-tamas@tklengyel.com>
 <766b2e92-9d0d-e4d8-2a11-37b7e974f6d0@citrix.com>
 <CABfawhk-qCQeo+feqk=a2P_cXBrNsDtRuDYAQ9Vf56AQH0H_dg@mail.gmail.com>
 <4dd1504b-3559-c9ae-6176-65baac771302@arm.com>
 <CABfawhnj=EeNPeJ+DewiO4xuAuryhhr6E7pxeDVoDRqDW-93ug@mail.gmail.com>
 <5ba2dca2-5d69-e3c9-a14a-cd5ee18f2599@arm.com>
In-Reply-To: <5ba2dca2-5d69-e3c9-a14a-cd5ee18f2599@arm.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Fri, 19 Jul 2019 07:36:56 -0600
X-Gmail-Original-Message-ID: <CABfawhkNMYz5p31G-X6j1Rsv0CvdS-JfAq-n-DCBsiMNqxNauw@mail.gmail.com>
Message-ID: <CABfawhkNMYz5p31G-X6j1Rsv0CvdS-JfAq-n-DCBsiMNqxNauw@mail.gmail.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBKdWwgMTksIDIwMTkgYXQgNzozNCBBTSBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFs
bEBhcm0uY29tPiB3cm90ZToKPgo+IEhpIFRhbWFzLAo+Cj4gT24gMTkvMDcvMjAxOSAxNDowNSwg
VGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+ID4gT24gRnJpLCBKdWwgMTksIDIwMTkgYXQgMzowMyBB
TSBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPiB3cm90ZToKPiA+Pgo+ID4+IEhp
LAo+ID4+Cj4gPj4gT24gMTgvMDcvMjAxOSAxOTozNCwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+
ID4+PiBPbiBUaHUsIEp1bCAxOCwgMjAxOSBhdCAxMTo1OSBBTSBBbmRyZXcgQ29vcGVyCj4gPj4+
IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToKPiA+Pj4+Cj4gPj4+PiBPbiAxOC8w
Ny8yMDE5IDE1OjQzLCBUYW1hcyBLIExlbmd5ZWwgd3JvdGU6Cj4gPj4+Pj4gZGlmZiAtLWdpdCBh
L0NPRElOR19TVFlMRSBiL0NPRElOR19TVFlMRQo+ID4+Pj4+IGluZGV4IDZjYzViNzc0Y2YuLjBi
MzdmN2FlNGQgMTAwNjQ0Cj4gPj4+Pj4gLS0tIGEvQ09ESU5HX1NUWUxFCj4gPj4+Pj4gKysrIGIv
Q09ESU5HX1NUWUxFCj4gPj4+Pj4gQEAgLTYwLDggKzYwLDggQEAgQnJhY2luZwo+ID4+Pj4+ICAg
IC0tLS0tLS0KPiA+Pj4+Pgo+ID4+Pj4+ICAgIEJyYWNlcyAoJ3snIGFuZCAnfScpIGFyZSB1c3Vh
bGx5IHBsYWNlZCBvbiBhIGxpbmUgb2YgdGhlaXIgb3duLCBleGNlcHQKPiA+Pj4+PiAtZm9yIHRo
ZSBkby93aGlsZSBsb29wLiAgVGhpcyBpcyB1bmxpa2UgdGhlIExpbnV4IGNvZGluZyBzdHlsZSBh
bmQKPiA+Pj4+PiAtdW5saWtlIEsmUi4gIGRvL3doaWxlIGxvb3BzIGFyZSBhbiBleGNlcHRpb24u
IGUuZy46Cj4gPj4+Pj4gK2ZvciB0aGUgd2hpbGUtcGFydCBvZiBkby93aGlsZSBsb29wcy4gIFRo
aXMgaXMgdW5saWtlIHRoZSBMaW51eCBjb2Rpbmcgc3R5bGUKPiA+Pj4+PiArYW5kIHVubGlrZSBL
JlIuICBkby93aGlsZSBsb29wcyBhcmUgYW4gZXhjZXB0aW9uLiBlLmcuOgo+ID4+Pj4+Cj4gPj4+
Pj4gICAgaWYgKCBjb25kaXRpb24gKQo+ID4+Pj4+ICAgIHsKPiA+Pj4+PiBAQCAtNzcsNyArNzcs
OCBAQCB3aGlsZSAoIGNvbmRpdGlvbiApCj4gPj4+Pj4gICAgICAgIC8qIERvIHN0dWZmLiAqLwo+
ID4+Pj4+ICAgIH0KPiA+Pj4+Pgo+ID4+Pj4+IC1kbyB7Cj4gPj4+Pj4gK2RvCj4gPj4+Pj4gK3sK
PiA+Pj4+Cj4gPj4+PiBJJ2QgaGFwcGlseSB0YWtlIHRoaXMgYWRqdXN0bWVudCB0byBYZW4ncyBz
dHlsZSBpZiBpdCBoZWxwcyB1cyBlbmQgdXAKPiA+Pj4+IHdpdGggYXV0by1mb3JtYXR0ZXIuCj4g
Pj4+Cj4gPj4+IFlheSEKPiA+Pj4KPiA+Pj4+Cj4gPj4+PiBBbHNvLCB0aGVyZSBhcmUgYSBudW1i
ZXIgb2YgZmlsZXMgd2hpY2ggYXJlIHRlY2huaWNhbGx5IExpbnV4IHN0eWxlLCBidXQKPiA+Pj4+
IGhhdmUgdG90YWxseSBkaXZlcmdlZCBmcm9tIExpbnV4LCBhbmQgd291bGQgYmUgZWFzaWVyIHRv
IG1vdmUgdG8gWGVuIHN0eWxlLgo+ID4+Pj4KPiA+Pj4+IERvIHlvdSBoYXZlIGFuIHVwZGF0ZWQg
LmFzdHlsZXJjIGJhc2VkIG9uIEp1bGllbidzIG9ic2VydmF0aW9ucz8KPiA+Pj4KPiA+Pj4gWWVz
LCB0aGlzIGlzIGl0Ogo+ID4+Pgo+ID4+PiBzdHlsZT1ic2QKPiA+Pj4gc3VmZml4PW5vbmUKPiA+
Pj4gYWxpZ24tcG9pbnRlcj1uYW1lCj4gPj4+IGFsaWduLXJlZmVyZW5jZT1uYW1lCj4gPj4+IGlu
ZGVudD1zcGFjZXM9NAo+ID4+PiBtYXgtY29kZS1sZW5ndGg9ODAKPiA+Pj4gbWluLWNvbmRpdGlv
bmFsLWluZGVudD0wCj4gPj4+IG1heC1jb250aW51YXRpb24taW5kZW50PTc4Cj4gPj4+IGF0dGFj
aC1jbG9zaW5nLXdoaWxlCj4gPj4+IHJlbW92ZS1icmFjZXMKPiA+Pj4gYnJlYWstb25lLWxpbmUt
aGVhZGVycwo+ID4+PiBwYWQtY29tbWEKPiA+Pj4gcGFkLWhlYWRlcgo+ID4+Cj4gPj4gVW5mb3J0
dW5hdGVseSB0aGlzIHN0eWxlIGRvZXMgbm90IHdvcmsgd2l0aCB0aGUgYXN0eWxlIHByb3ZpZGVk
IGJ5IERlYmlhbiBTdHJldGNoOgo+ID4+Cj4gPj4gNDJzaD4gYXN0eWxlIHhlbi9hcmNoL2FybS9z
ZXR1cC5jCj4gPj4gSW52YWxpZCBvcHRpb24gZmlsZSBvcHRpb25zOgo+ID4+IG1heC1jb250aW51
YXRpb24taW5kZW50PTc4Cj4gPj4gYXR0YWNoLWNsb3Npbmctd2hpbGUKPiA+PiByZW1vdmUtYnJh
Y2VzCj4gPj4gRm9yIGhlbHAgb24gb3B0aW9ucyB0eXBlICdhc3R5bGUgLWgnCj4gPj4KPiA+PiBB
cnRpc3RpYyBTdHlsZSBoYXMgdGVybWluYXRlZAo+ID4KPiA+IEknbSBhbHJlYWR5IG9uIGJ1c3Rl
ciBhbmQgaXQgd29ya3MgZmluZS4gUGVyaGFwcyB3ZSdsbCBuZWVkIHRvIHNwZWNpZnkKPiA+IGEg
bWluaW11bSB2ZXJzaW9uIG9mIGFzdHlsZS4KPgo+IFRoYXQgd291bGQgYmUgZ29vZC4KPgo+ID4K
PiA+Pgo+ID4+IEFsc28sIEkgbmVlZGVkIHRvIGNvcHkgdGhlIC5hc3R5bGVyYyBpbiAkKEhPTUUp
IGluIG9yZGVyIHRvIHVzZSB0aGUgc3R5bGUuIEl0IGlzCj4gPj4gcHJvYmFibHkgd29ydGggY29u
c2lkZXJpbmcgaW1wbGVtZW50aW5nIGEgd3JhcHBlciB0aGF0IHNldAo+ID4+IEFSVElTVElDX1NU
WUxFX09QVElPTlMgYW5kIGNhbGwgYXN0eWxlIHRvIGtlZXAgZXZlcnRoaW5nIGluIFhlbiBpbnRl
cm5hbHMuCj4gPgo+ID4gWW91IGRvbid0IGhhdmUgdG8gY29weSB0byB0byAkKEhPTUUpLCBhcyBJ
IHBvaW50IG91dCBieSB0aGUgYWRkaXRpb24KPiA+IHRvIHRoZSBDT0RJTkdfU1RZTEUgdGhpcyB3
b3JrcyBmcm9tIHRoZSBYZW4gcm9vdCBmb2xkZXI6Cj4gPgo+ID4gZXhwb3J0IEFSVElTVElDX1NU
WUxFX09QVElPTlM9Ii5hc3R5bGVyYyIKPiA+IGFzdHlsZSA8c291cmNlIG9yIGhlYWRlciBmaWxl
Pgo+Cj4gSSBtaXNyZWFkIHlvdXIgZmlyc3QgZS1tYWlsLiBTb3JyeSBmb3IgdGhlIG5vaXNlLgo+
Cj4gPgo+ID4+Cj4gPj4+Cj4gPj4+IFdpdGggdGhpcyBpdCdzIGRvd24gdG8gODYwIGZpbGVzIHRo
YXQgYXJlIGZvcm1hdHRlZC4KPiA+Pgo+ID4+IERvIHlvdSBtaW5kIHByb3ZpZGluZyB0aGUgbmV3
IGRpZmY/Cj4gPgo+ID4gSSd2ZSB1cGRhdGVkIHRoZSBzYW1lIGdpc3Qgd2l0aCB0aGUgbmV3IGRp
ZmYsIHRoZSB1cmwgaXMgdGhlIHNhbWU6Cj4gPiBodHRwczovL2dpc3QuZ2l0aHViLmNvbS90a2xl
bmd5ZWwvYzVjYWMxNGEwZDU3ZjExOWRkNzc0N2ExYmU2ZmIyNjAKPgo+IERvIHlvdSBtaW5kIHRv
IGNyZWF0ZSBhIG5ldyBnaXN0IGV2ZXJ5dGltZT8gVGhpcyB3b3VsZCBoZWxwIHRvIHNlZSB0aGUK
PiBkaWZmZXJlbmNlIGJlZm9yZSBhbmQgYWZ0ZXIgYXQgbGVhc3QgdW50aWwgSSBidWlsZCBhIG5l
dyB2ZXJzaW9uIG9mIGFzdHlsZSA6KS4KClN1cmUsIG5vIHByb2JsZW0uIEFsc28gYSB0aXA6IGp1
c3QgZW5hYmxlIHRoZSBidXN0ZXIgcmVwbyBhbmQgZG8KImFwdC1nZXQgLXQgYnVzdGVyIGluc3Rh
bGwgYXN0eWxlIiA7KQoKQ2hlZXJzLApUYW1hcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
