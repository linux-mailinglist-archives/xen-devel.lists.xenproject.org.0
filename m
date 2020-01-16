Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 468D613E00E
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jan 2020 17:27:50 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1is7x4-0002gJ-F8; Thu, 16 Jan 2020 16:24:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rOjP=3F=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1is7x2-0002g9-Tb
 for xen-devel@lists.xenproject.org; Thu, 16 Jan 2020 16:24:56 +0000
X-Inumbo-ID: b6d37a64-387c-11ea-a2eb-bc764e2007e4
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b6d37a64-387c-11ea-a2eb-bc764e2007e4;
 Thu, 16 Jan 2020 16:24:48 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1579191888; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=xQSngghPfhGlMIufWZRnkMsUOa7wHi6Yh7vB+ZJ3HRc=;
 b=R9XSuuhFUy9sw3D0jcOuLuuKdGlGdQYpO0AuDM11onH2qLOwnxbblZa6ZxZgrL6X2NPukW2Z
 oWozhrgkr2g7LssPvwTuSt8De57v2evcjnRTbIe3U0tzuRezo+zrHVP0fKUlWl2jTchGxwG0
 EpLW69ldEVO9Cn4b/e2l3AwOaEY=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by mxa.mailgun.org with ESMTP id 5e208e4f.7f7cedd4d1f0-smtp-out-n01;
 Thu, 16 Jan 2020 16:24:47 -0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id f129so4470963wmf.2
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jan 2020 08:24:47 -0800 (PST)
X-Gm-Message-State: APjAAAVVHoLNJBxNKhYlnKjuYP1Qb4/1HTIw6ylFI/sIK8eDlfX/Doxj
 o2jNDg6QZub3cDGDem6Tfd3OZ4Wzc7egSrJZH+4=
X-Google-Smtp-Source: APXvYqy56JTcOH0oX/1/ClxgN7kfayAIuGmm8tRAyohcOkosi2YB3gOTMJ6oNccZzTxPXciq9e+4me7XYSj9twjTM00=
X-Received: by 2002:a05:600c:2503:: with SMTP id
 d3mr177551wma.84.1579191885784; 
 Thu, 16 Jan 2020 08:24:45 -0800 (PST)
MIME-Version: 1.0
References: <cover.1578503483.git.tamas.lengyel@intel.com>
 <2284645a-0496-7811-5def-2cb053ffcf51@suse.com>
In-Reply-To: <2284645a-0496-7811-5def-2cb053ffcf51@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Thu, 16 Jan 2020 09:24:09 -0700
X-Gmail-Original-Message-ID: <CABfawh=pBDQTxeJ-XHbi61nQNukGzGsD-iEtSWeNXnrS-H7b1Q@mail.gmail.com>
Message-ID: <CABfawh=pBDQTxeJ-XHbi61nQNukGzGsD-iEtSWeNXnrS-H7b1Q@mail.gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [Xen-devel] [PATCH v4 00/18] VM forking
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Anthony PERARD <anthony.perard@citrix.com>, Julien Grall <julien@xen.org>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBKYW4gMTYsIDIwMjAgYXQgODo0NyBBTSBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+Cj4gT24gMDguMDEuMjAyMCAxODoxMywgVGFtYXMgSyBMZW5neWVsIHdy
b3RlOgo+ID4gVGFtYXMgSyBMZW5neWVsICgxOCk6Cj4gPiAgIHg4Ni9odm06IGludHJvZHVjZSBo
dm1fY29weV9jb250ZXh0X2FuZF9wYXJhbXMKPiA+ICAgeGVuL3g4NjogTWFrZSBoYXBfZ2V0X2Fs
bG9jYXRpb24gYWNjZXNzaWJsZQo+ID4gICB4ODYvbWVtX3NoYXJpbmc6IG1ha2UgZ2V0X3R3b19n
Zm5zIHRha2UgbG9ja3MgY29uZGl0aW9uYWxseQo+ID4gICB4ODYvbWVtX3NoYXJpbmc6IGRyb3Ag
ZmxhZ3MgZnJvbSBtZW1fc2hhcmluZ191bnNoYXJlX3BhZ2UKPiA+ICAgeDg2L21lbV9zaGFyaW5n
OiBkb24ndCB0cnkgdG8gdW5zaGFyZSB0d2ljZSBkdXJpbmcgcGFnZSBmYXVsdAo+ID4gICB4ODYv
bWVtX3NoYXJpbmc6IGRlZmluZSBtZW1fc2hhcmluZ19kb21haW4gdG8gaG9sZCBzb21lIHNjYXR0
ZXJlZAo+ID4gICAgIHZhcmlhYmxlcwo+ID4gICB4ODYvbWVtX3NoYXJpbmc6IFVzZSBJTlZBTElE
X01GTiBhbmQgcDJtX2lzX3NoYXJlZCBpbgo+ID4gICAgIHJlbGlucXVpc2hfc2hhcmVkX3BhZ2Vz
Cj4gPiAgIHg4Ni9tZW1fc2hhcmluZzogTWFrZSBhZGRfdG9fcGh5c21hcCBzdGF0aWMgYW5kIHNo
b3J0ZW4gbmFtZQo+ID4gICB4ODYvbWVtX3NoYXJpbmc6IENvbnZlcnQgTUVNX1NIQVJJTkdfREVT
VFJPWV9HRk4gdG8gYSBib29sCj4KPiBJJ3ZlIGxvb2tlZCBhdCB0aGVzZSBwYXRjaGVzLCBhbmQg
SSB0aGluayAyLTQgYW5kIDctOSBjb3VsZCBnbwo+IGluIHJpZ2h0IGF3YXkgKDYgaGFzIGEgc21h
bGwgcXVlc3Rpb24gcGVuZGluZywgYnV0IG1heSBvdGhlcndpc2UKPiBhbHNvIGJlIHJlYWR5KSwg
aWYgeW91IHdlcmUgdG8gZ2l2ZSAob3IgZGVsZWdhdGUpIHlvdXIgYWNrIHRoYXQKPiB0aGV5IHdv
dWxkIG5lZWQgYWZhaWN0LiBUaG91Z2h0cz8KPgoKTm90IHN1cmUgSSB1bmRlcnN0YW5kIHlvdXIg
cXVlc3Rpb24uIE15IHVuZGVyc3RhbmRpbmcgaXMgdGhhdCBzaW5jZQpJJ20gdGhlIG1haW50YWlu
ZXIgb2YgdGhlIGNvZGUgYmVpbmcgY2hhbmdlZCBieSB0aGVzZSBwYXRjaGVzIEkganVzdApuZWVk
IGEgInJldmlld2VkLWJ5IiBmcm9tIHNvbWVvbmUgaW4gdGhlIGNvbW11bml0eSBhbmQgbm8gb3V0
c3RhbmRpbmcKaXNzdWUgb24gdGhlbS4gUHJvdmlkZWQgdGhpcyBpcyB2NCBub3cgb2YgdGhlIHNl
cmllcyBhbmQgbm8gaXNzdWVzCndlcmUgcmFpc2VkIHNvIGZhciBmb3IgdGhlc2UgcGFydGljdWxh
ciBwYXRjaGVzIHRoZXkgY2FuIGJlIG1lcmdlZAp3aXRoIHlvdXIgUmV2aWV3ZWQtYnkuCgpUaGFu
a3MsClRhbWFzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
