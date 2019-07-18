Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF9AA6CF3A
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2019 15:54:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ho6qE-0003HE-2o; Thu, 18 Jul 2019 13:53:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=B+y+=VP=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1ho6qC-0003H8-MT
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2019 13:53:00 +0000
X-Inumbo-ID: 5908bbb8-a963-11e9-98a7-f3b88b5f194d
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5908bbb8-a963-11e9-98a7-f3b88b5f194d;
 Thu, 18 Jul 2019 13:52:57 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1563457977; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=UVDUBS+0cmBns+Fb4TEOG+VGv66g/bGYP2q/eOScblw=;
 b=r48I+3EZwN/51WeXDbjAOuU5bBVED7B8y81Lz3a90Rc3PLhqS35767z9knb3EvKVkfVUX28d
 FAgHxAWYfcjS/RLch03m/ywKqOgz132G2p7Ibq+sTRffCGfrLGpC+Y8/d5zgUnqC0LHpm9Ws
 72Kghs+8RUlLAL5bz7fNTJ3MzZU=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by mxa.mailgun.org with ESMTP id 5d3079b8.7fd1a25b6ab0-smtp-out-n01;
 Thu, 18 Jul 2019 13:52:56 -0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id s15so4427064wmj.3
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jul 2019 06:52:56 -0700 (PDT)
X-Gm-Message-State: APjAAAU8rwEX4PDBqB0nC39t3hu8ibLMx/7DCwnCE3h6ni5fucHikkvr
 jwgKNWQGGq9SqwqG8baG/dO6MSpEH6Ro3Hoz31I=
X-Google-Smtp-Source: APXvYqyKSILHfBHavFP3ONdB5NLYkEl6wlbR6z3DvbPZGZ/ekH04KkA9PqnUj2ENNYWhHpEEEpHJDTe27K3A0bVee9k=
X-Received: by 2002:a05:600c:c6:: with SMTP id
 u6mr43930873wmm.153.1563457975609; 
 Thu, 18 Jul 2019 06:52:55 -0700 (PDT)
MIME-Version: 1.0
References: <20190717193335.11991-1-tamas@tklengyel.com>
 <20190717193335.11991-6-tamas@tklengyel.com>
 <7d6e93e9-8037-e0ed-5c2b-e00a810bc7e4@suse.com>
 <CABfawhm35+gf=3J-OYo84nwymDAx2vCrgtyqSe2it4LAgpxYTw@mail.gmail.com>
 <95234c89-846c-1f65-7418-0c2187aa0067@suse.com>
 <CABfawhmDTQ6d+FDhY3PLydE1rshew-EnRBH-SjgV2DLCdbAgiw@mail.gmail.com>
 <9d59429f-c54e-9e3c-1b85-3b49ed98a6b7@suse.com>
In-Reply-To: <9d59429f-c54e-9e3c-1b85-3b49ed98a6b7@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Thu, 18 Jul 2019 07:52:19 -0600
X-Gmail-Original-Message-ID: <CABfawh=+4qXQs-Ch2+cKHoE0KzUmGgYBsb2rAS4sdSQQrmZXng@mail.gmail.com>
Message-ID: <CABfawh=+4qXQs-Ch2+cKHoE0KzUmGgYBsb2rAS4sdSQQrmZXng@mail.gmail.com>
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

T24gVGh1LCBKdWwgMTgsIDIwMTkgYXQgNzozNyBBTSBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+Cj4gT24gMTguMDcuMjAxOSAxNToxNiwgVGFtYXMgSyBMZW5neWVsIHdy
b3RlOgo+ID4gT24gVGh1LCBKdWwgMTgsIDIwMTkgYXQgNzoxNCBBTSBKYW4gQmV1bGljaCA8SkJl
dWxpY2hAc3VzZS5jb20+IHdyb3RlOgo+ID4+Cj4gPj4gT24gMTguMDcuMjAxOSAxNDo1OSwgVGFt
YXMgSyBMZW5neWVsIHdyb3RlOgo+ID4+PiBPbiBUaHUsIEp1bCAxOCwgMjAxOSBhdCA0OjU2IEFN
IEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4gd3JvdGU6Cj4gPj4+Pgo+ID4+Pj4gT24g
MTcuMDcuMjAxOSAyMTozMywgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+ID4+Pj4+IEBAIC0xMzYs
OCArMTM3LDggQEAgc3RhdGljIGlubGluZSBib29sIF9wYWdlX2xvY2soc3RydWN0IHBhZ2VfaW5m
byAqcGFnZSkKPiA+Pj4+PiAgICAgICAgICAgICAgICAgY3B1X3JlbGF4KCk7Cj4gPj4+Pj4gICAg
ICAgICAgICAgbnggPSB4ICsgKDEgfCBQR1RfbG9ja2VkKTsKPiA+Pj4+PiAgICAgICAgICAgICBp
ZiAoICEoeCAmIFBHVF92YWxpZGF0ZWQpIHx8Cj4gPj4+Pj4gLSAgICAgICAgICAgICAhKHggJiBQ
R1RfY291bnRfbWFzaykgfHwKPiA+Pj4+PiAtICAgICAgICAgICAgICEobnggJiBQR1RfY291bnRf
bWFzaykgKQo+ID4+Pj4+ICsgICAgICAgICAgICAgICAgISh4ICYgUEdUX2NvdW50X21hc2spIHx8
Cj4gPj4+Pj4gKyAgICAgICAgICAgICAgICAhKG54ICYgUEdUX2NvdW50X21hc2spICkKPiA+Pj4+
PiAgICAgICAgICAgICAgICAgcmV0dXJuIGZhbHNlOwo+ID4+Pj4+ICAgICAgICAgfSB3aGlsZSAo
IGNtcHhjaGcoJnBhZ2UtPnUuaW51c2UudHlwZV9pbmZvLCB4LCBueCkgIT0geCApOwo+ID4+Pj4K
PiA+Pj4+IEFyZW4ndCB5b3Ugc2NyZXdpbmcgdXAgaW5kZW50YXRpb24gaGVyZT8gSXQgbG9va3Mg
d3JvbmcgYm90aCBpbiBteQo+ID4+Pj4gbWFpbCBjbGllbnQncyB2aWV3IGFuZCBvbiB0aGUgbGlz
dCBhcmNoaXZlcywgd2hlcmVhcy4gRnVydGhlcm1vcmUKPiA+Pj4+IHRoaXMgaXMgY29kZSB5b3Un
dmUgaW50cm9kdWNlZCBlYXJsaWVyIGluIHRoZSBzZXJpZXMsIHNvIGl0IHNob3VsZAo+ID4+Pj4g
YmUgZ290IHJpZ2h0IHRoZXJlLCBub3QgaGVyZS4KPiA+Pj4KPiA+Pj4gVGhlIHN0eWxlIHdhcyBh
dXRvLWFwcGxpZWQgd2l0aCBhc3R5bGUgdXNpbmcgdGhlIGJzZCBmb3JtYXQuIEluIHRoZQo+ID4+
PiBwcmV2aW91cyBwYXRjaCB0aGVyZSB3ZXJlIG5vIHN0eWxlLWNoYW5nZXMgYXBwbGllZCBiZWNh
dXNlIGl0IHdhcyBhCj4gPj4+IGNvcHktcGFzdGUgam9iIGZyb20gdGhlIG90aGVyIGNvZGUgbG9j
YXRpb24uIEkgcmF0aGVyIGtlZXAKPiA+Pj4gY29kZS1jb3B5aW5nIGFuZCBzdHlsZSBmaXhlcyBz
ZXBhcmF0ZS4KPiA+Pgo+ID4+IEJ1dCB5b3UncmUgYWN0aXZlbHkgYnJlYWtpbmcgWGVuIHN0eWxl
IGhlcmUgKGFuZCBiZWxvdykuCj4gPgo+ID4gSSBkb24ndCBzZWUgYW55IG1lbnRpb24gb2Ygc3R5
bGUgcmVzdHJpY3Rpb25zIHJlZ2FyZGluZyB0aGlzIGluCj4gPiBDT0RJTkdfU1RZTEUuIElmIHRo
ZXJlIGlzLCBJIHdvdWxkIHByZWZlciBjaGFuZ2luZyB0aGF0IHNvIHdlIGNhbgo+ID4gYXV0b21h
dGUgc3R5bGUgY2hlY2tzIHdoaWNoIElNSE8gYXJlIHRoZSBiaWdnZXN0IHdhc3RlIG9mIGV2ZXJ5
b25lJ3MKPiA+IHRpbWUgdG8gZG8gbWFudWFsbHkuCj4KPiAuL0NPRElOR19TVFlMRSBmYWlscyB0
byBtZW50aW9uIG1hbnkgYXNwZWN0cyBvZiB3aGF0IHdlIGRvIGV2ZXJ5d2hlcmUuCj4gQWxtb3N0
IGFueSBhdHRlbXB0IG9mIHVwZGF0aW5nIGl0IGhhcyBmYWlsZWQgZm9yIG1lIGluIHRoZSBwYXN0
LCBvZnRlbgo+IGR1ZSB0byBlbnRpcmUgbGFjayBvZiByZXNwb25zZXMgb24gcGF0Y2hlcyAoaW4g
b3RoZXIgY2FzZXMgYWxzbyBiZWNhdXNlCj4gb2YgcGVvcGxlIGRpc2FncmVlaW5nKS4gRGVzcGl0
ZSB5b3UgYmVpbmcgdGhlIG1haW50YWluZXIgb2YgdGhlIGZpbGUgSQo+IHN0cm9uZ2x5IHRoaW5r
IHlvdSBzaG91bGRuJ3QgYWN0aXZlbHkgYnJlYWsgc3R5bGUgdGhhdCdzIGluIGxpbmUgd2l0aAo+
IGxhcmdlIHN3YXRoZXMgb2YgY29kZSBlbHNld2hlcmUuCj4KCkkgd2hvbGx5IGRpc2FncmVlLiBJ
IGRvbid0IGhhdmUgaGF2ZSB0aW1lIHRvIGNoZWNrIGZvciBzdHlsZSBpc3N1ZXMKbWFudWFsbHku
IFBhdGNoZXMgbG9vayBsaWtlIGNyYXAgdG8gYmVnaW4gd2l0aCB2aWEgZW1haWwgYW5kIEkgbW9z
dApjZXJ0YWlubHkgd29uJ3QgYm90aGVyIGNhcnZpbmcgcGF0Y2hlcyBvdXQgb2YgZW1haWxzIHdo
ZW4gcGVvcGxlIGZhaWwKdG8gYm90aGVyIHRvIHB1c2ggdGhpbmdzIGFzIGdpdCBicmFuY2hlcy4g
VGhpcyBzaG91bGQgYmUgc29tZXRoaW5nCnRoYXQncyBkb25lIGF1dG9tYXRpY2FsbHkuIEkgZG9u
J3QgZXZlbiB0aGluayB3ZSBzaG91bGQgYmUgaGF2aW5nIGEKZGlzY3Vzc2lvbnMgYWJvdXQgc3R5
bGUgaXNzdWVzIG9uIHRoZSBtYWlsaW5nbGlzdC4gU3R5bGUgZml4ZXMgY291bGQKYmUgbWFkZSBh
dXRvbWF0aWNhbGx5IHdoZW4gdGhlIHBhdGNoZXMgYXJlIGFwcGxpZWQgYnkgdGhlIGNvbW1pdHRl
cnMuCkFueXRoaW5nIGVsc2UgaXMganVzdCBhIHdhc3RlIG9mIHRpbWUuCgpUYW1hcwoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
