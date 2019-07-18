Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A5586CE80
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2019 15:03:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ho616-0006fD-K4; Thu, 18 Jul 2019 13:00:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=B+y+=VP=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1ho615-0006f4-Ee
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2019 13:00:11 +0000
X-Inumbo-ID: f7e79676-a95b-11e9-b624-bbe3d9469f7d
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f7e79676-a95b-11e9-b624-bbe3d9469f7d;
 Thu, 18 Jul 2019 13:00:08 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1563454808; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=AxeHC+v2dsR+7QaZHbjIHxQrVa+9hm1YfNolS5p0nnI=;
 b=Ibzk9d53ieOncseqYwdDAteQCx0/qat1+AHE7bwGn9UvBA+SeC464RRyk6hs/yRpV4ZZ8V4Y
 g26cLchgbzygY/fGX2s7yAOW7kNcIPbEH6D32UEHZA/X6oYX4ma+LDbGkIzpQbfMKbSy6aNh
 vHLNs7Exvlxflw74DpD+iKT/6wE=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by mxa.mailgun.org with ESMTP id 5d306d56.7ff4d8f9fe30-smtp-out-n03;
 Thu, 18 Jul 2019 13:00:06 -0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id s15so4234787wmj.3
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jul 2019 06:00:06 -0700 (PDT)
X-Gm-Message-State: APjAAAXgHbuMDXRHHKZHL5Kfp24iwx/NW3A61nPc4Hintf33tNvXT5Kn
 Ioj/QGyKTaly9E3UOdanNI5E0OhecYvcbUjy1Sc=
X-Google-Smtp-Source: APXvYqyspoFBLIiPLUXFRh5je7lMlAcokBCJd1VSGaCFQnNPy5Fvw2wm7lZC1SOUGMojmKKIpUFedpKcD7yGrA8AkX8=
X-Received: by 2002:a7b:c1da:: with SMTP id a26mr42673146wmj.128.1563454805216; 
 Thu, 18 Jul 2019 06:00:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190717193335.11991-1-tamas@tklengyel.com>
 <20190717193335.11991-6-tamas@tklengyel.com>
 <7d6e93e9-8037-e0ed-5c2b-e00a810bc7e4@suse.com>
In-Reply-To: <7d6e93e9-8037-e0ed-5c2b-e00a810bc7e4@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Thu, 18 Jul 2019 06:59:28 -0600
X-Gmail-Original-Message-ID: <CABfawhm35+gf=3J-OYo84nwymDAx2vCrgtyqSe2it4LAgpxYTw@mail.gmail.com>
Message-ID: <CABfawhm35+gf=3J-OYo84nwymDAx2vCrgtyqSe2it4LAgpxYTw@mail.gmail.com>
To: Jan Beulich <JBeulich@suse.com>
Subject: Re: [Xen-devel] [PATCH v6 5/5] x86/mem_sharing: style cleanup
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBKdWwgMTgsIDIwMTkgYXQgNDo1NiBBTSBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+Cj4gT24gMTcuMDcuMjAxOSAyMTozMywgVGFtYXMgSyBMZW5neWVsIHdy
b3RlOgo+ID4gQEAgLTEzNiw4ICsxMzcsOCBAQCBzdGF0aWMgaW5saW5lIGJvb2wgX3BhZ2VfbG9j
ayhzdHJ1Y3QgcGFnZV9pbmZvICpwYWdlKQo+ID4gICAgICAgICAgICAgICBjcHVfcmVsYXgoKTsK
PiA+ICAgICAgICAgICBueCA9IHggKyAoMSB8IFBHVF9sb2NrZWQpOwo+ID4gICAgICAgICAgIGlm
ICggISh4ICYgUEdUX3ZhbGlkYXRlZCkgfHwKPiA+IC0gICAgICAgICAgICAgISh4ICYgUEdUX2Nv
dW50X21hc2spIHx8Cj4gPiAtICAgICAgICAgICAgICEobnggJiBQR1RfY291bnRfbWFzaykgKQo+
ID4gKyAgICAgICAgICAgICAgICAhKHggJiBQR1RfY291bnRfbWFzaykgfHwKPiA+ICsgICAgICAg
ICAgICAgICAgIShueCAmIFBHVF9jb3VudF9tYXNrKSApCj4gPiAgICAgICAgICAgICAgIHJldHVy
biBmYWxzZTsKPiA+ICAgICAgIH0gd2hpbGUgKCBjbXB4Y2hnKCZwYWdlLT51LmludXNlLnR5cGVf
aW5mbywgeCwgbngpICE9IHggKTsKPgo+IEFyZW4ndCB5b3Ugc2NyZXdpbmcgdXAgaW5kZW50YXRp
b24gaGVyZT8gSXQgbG9va3Mgd3JvbmcgYm90aCBpbiBteQo+IG1haWwgY2xpZW50J3MgdmlldyBh
bmQgb24gdGhlIGxpc3QgYXJjaGl2ZXMsIHdoZXJlYXMuIEZ1cnRoZXJtb3JlCj4gdGhpcyBpcyBj
b2RlIHlvdSd2ZSBpbnRyb2R1Y2VkIGVhcmxpZXIgaW4gdGhlIHNlcmllcywgc28gaXQgc2hvdWxk
Cj4gYmUgZ290IHJpZ2h0IHRoZXJlLCBub3QgaGVyZS4KClRoZSBzdHlsZSB3YXMgYXV0by1hcHBs
aWVkIHdpdGggYXN0eWxlIHVzaW5nIHRoZSBic2QgZm9ybWF0LiBJbiB0aGUKcHJldmlvdXMgcGF0
Y2ggdGhlcmUgd2VyZSBubyBzdHlsZS1jaGFuZ2VzIGFwcGxpZWQgYmVjYXVzZSBpdCB3YXMgYQpj
b3B5LXBhc3RlIGpvYiBmcm9tIHRoZSBvdGhlciBjb2RlIGxvY2F0aW9uLiBJIHJhdGhlciBrZWVw
CmNvZGUtY29weWluZyBhbmQgc3R5bGUgZml4ZXMgc2VwYXJhdGUuCgo+Cj4gPiBAQCAtMjI1LDcg
KzIyNSw3IEBAIHJtYXBfaW5pdChzdHJ1Y3QgcGFnZV9pbmZvICpwYWdlKQo+ID4gICAjZGVmaW5l
IEhBU0goZG9tYWluLCBnZm4pICAgICAgIFwKPiA+ICAgICAgICgoKGdmbikgKyAoZG9tYWluKSkg
JSBSTUFQX0hBU0hUQUJfU0laRSkKPiA+Cj4gPiAtLyogQ29udmVyc2lvbnMuIFR1bmVkIGJ5IHRo
ZSB0aHJlc2hvbGRzLiBTaG91bGQgb25seSBoYXBwZW4gdHdpY2UKPiA+ICsvKiBDb252ZXJzaW9u
cy4gVHVuZWQgYnkgdGhlIHRocmVzaG9sZHMuIFNob3VsZCBvbmx5IGhhcHBlbiB0d2ljZQo+ID4g
ICAgKiAob25jZSBlYWNoKSBkdXJpbmcgdGhlIGxpZmV0aW1lIG9mIGEgc2hhcmVkIHBhZ2UgKi8K
Pgo+IFBsZWFzZSBmaXggdGhlIGNvbW1lbnQgc3R5bGUgYXMgYSB3aG9sZSwgbm90IGp1c3QgdGhl
IHN0cmF5IHRyYWlsaW5nCj4gYmxhbmsuCj4KPiA+IEBAIC0yODgsMTMgKzI4OCwxMyBAQCBybWFw
X2NvdW50KHN0cnVjdCBwYWdlX2luZm8gKnBnKQo+ID4gICB9Cj4gPgo+ID4gICAvKiBUaGUgcGFn
ZSB0eXBlIGNvdW50IGlzIGFsd2F5cyBkZWNyZWFzZWQgYWZ0ZXIgcmVtb3ZpbmcgZnJvbSB0aGUg
cm1hcC4KPiA+IC0gKiBVc2UgYSBjb252ZXJ0IGZsYWcgdG8gYXZvaWQgbXV0YXRpbmcgdGhlIHJt
YXAgaWYgaW4gdGhlIG1pZGRsZSBvZiBhbgo+ID4gKyAqIFVzZSBhIGNvbnZlcnQgZmxhZyB0byBh
dm9pZCBtdXRhdGluZyB0aGUgcm1hcCBpZiBpbiB0aGUgbWlkZGxlIG9mIGFuCj4gPiAgICAqIGl0
ZXJhdG9yLCBvciBpZiB0aGUgcGFnZSB3aWxsIGJlIHNvb24gZGVzdHJveWVkIGFueXdheXMuICov
Cj4KPiBTYW1lIGhlcmUuCj4KPiA+ICAgc3RhdGljIGlubGluZSB2b2lkCj4gPiAgIHJtYXBfZGVs
KGdmbl9pbmZvX3QgKmdmbl9pbmZvLCBzdHJ1Y3QgcGFnZV9pbmZvICpwYWdlLCBpbnQgY29udmVy
dCkKPiA+ICAgewo+ID4gICAgICAgaWYgKCBSTUFQX1VTRVNfSEFTSFRBQihwYWdlKSAmJiBjb252
ZXJ0ICYmCj4gPiAtICAgICAgICAgKHJtYXBfY291bnQocGFnZSkgPD0gUk1BUF9MSUdIVF9TSEFS
RURfUEFHRSkgKQo+ID4gKyAgICAgICAgICAgIChybWFwX2NvdW50KHBhZ2UpIDw9IFJNQVBfTElH
SFRfU0hBUkVEX1BBR0UpICkKPgo+IEhlcmUgeW91IGFnYWluIHNlZW0gdG8gYmUgc2NyZXdpbmcg
dXAgY29ycmVjdCBpbmRlbnRhdGlvbi4gVGhlcmUgYXJlCj4gbW9yZSBzdWNoIGluc3RhbmNlcywg
c28gSSBndWVzcyBJJ2xsIGxlYXZlIGl0IHRvIHlvdSB0byBnbyBvdmVyIHRoZQo+IHdob2xlIHBh
dGNoIG9uY2UgbW9yZS4KCkFnYWluLCB0aGlzIGlzIHRoZSBhc3R5bGUgYnNkIGZvcm1hdCBhdXRv
LWFwcGxpZWQuIEkgcmF0aGVyIGhhdmUgdGhpcwpzdHlsZSBpZiBpdCBtZWFucyBJIGRvbid0IGV2
ZXIgaGF2ZSB0byBjaGVjayBmb3IgdGhpcyBraW5kIG9mIHN0dWZmCm1hbnVhbGx5IGluIHRoZSBm
dXR1cmUuCgpUYW1hcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
