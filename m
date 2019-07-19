Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9DA16E615
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jul 2019 15:08:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hoSa8-0007it-Oz; Fri, 19 Jul 2019 13:05:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=EVsN=VQ=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hoSa7-0007ij-K5
 for xen-devel@lists.xenproject.org; Fri, 19 Jul 2019 13:05:51 +0000
X-Inumbo-ID: eb02fc32-aa25-11e9-b369-6baff09c08ef
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id eb02fc32-aa25-11e9-b369-6baff09c08ef;
 Fri, 19 Jul 2019 13:05:44 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1563541545; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=NwYRSnNAjqd/aioEOv1GR/idDwwg9iMpJhHJ7DDYD64=;
 b=hpRL8sOB4qcpX5fKxSmPVkch/wgFDtzMmJDa/h2pDpyIm1w0SSAaBXiRzmmSiqUE2wbhsMY/
 5/RUpWVHWDcOK1nXqewvYheZiyGacuVz6T4Zvxl60X6/nH7Txy7xtB6qIb4Y5yupRCLoNO1J
 gccbfklwNS9K8fL3k2Yxp8EcyMo=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by mxa.mailgun.org with ESMTP id 5d31c025.7efcc615b8b0-smtp-out-n01;
 Fri, 19 Jul 2019 13:05:41 -0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id h19so23698076wme.0
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jul 2019 06:05:40 -0700 (PDT)
X-Gm-Message-State: APjAAAUED7ykkEe4vISlkeZv6sMqhYHtK99bgYYom2fZJrImcAn6ewzM
 Q7fdvf5xGoRXb7ENHizYdmykwlEPcx00EQDDhGg=
X-Google-Smtp-Source: APXvYqxBnCPSuxFzTNWz3AU1VaPa2g7Zphf9ULBzHLxQ48BD6vdUzYwfcqs1/XDz6efvKX9NyRHAQ4yhHI6rZiS4MSU=
X-Received: by 2002:a1c:4d05:: with SMTP id o5mr46526964wmh.129.1563541539903; 
 Fri, 19 Jul 2019 06:05:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190718144317.23307-1-tamas@tklengyel.com>
 <766b2e92-9d0d-e4d8-2a11-37b7e974f6d0@citrix.com>
 <CABfawhk-qCQeo+feqk=a2P_cXBrNsDtRuDYAQ9Vf56AQH0H_dg@mail.gmail.com>
 <4dd1504b-3559-c9ae-6176-65baac771302@arm.com>
In-Reply-To: <4dd1504b-3559-c9ae-6176-65baac771302@arm.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Fri, 19 Jul 2019 07:05:03 -0600
X-Gmail-Original-Message-ID: <CABfawhnj=EeNPeJ+DewiO4xuAuryhhr6E7pxeDVoDRqDW-93ug@mail.gmail.com>
Message-ID: <CABfawhnj=EeNPeJ+DewiO4xuAuryhhr6E7pxeDVoDRqDW-93ug@mail.gmail.com>
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

T24gRnJpLCBKdWwgMTksIDIwMTkgYXQgMzowMyBBTSBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFs
bEBhcm0uY29tPiB3cm90ZToKPgo+IEhpLAo+Cj4gT24gMTgvMDcvMjAxOSAxOTozNCwgVGFtYXMg
SyBMZW5neWVsIHdyb3RlOgo+ID4gT24gVGh1LCBKdWwgMTgsIDIwMTkgYXQgMTE6NTkgQU0gQW5k
cmV3IENvb3Blcgo+ID4gPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+IHdyb3RlOgo+ID4+Cj4g
Pj4gT24gMTgvMDcvMjAxOSAxNTo0MywgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+ID4+PiBkaWZm
IC0tZ2l0IGEvQ09ESU5HX1NUWUxFIGIvQ09ESU5HX1NUWUxFCj4gPj4+IGluZGV4IDZjYzViNzc0
Y2YuLjBiMzdmN2FlNGQgMTAwNjQ0Cj4gPj4+IC0tLSBhL0NPRElOR19TVFlMRQo+ID4+PiArKysg
Yi9DT0RJTkdfU1RZTEUKPiA+Pj4gQEAgLTYwLDggKzYwLDggQEAgQnJhY2luZwo+ID4+PiAgIC0t
LS0tLS0KPiA+Pj4KPiA+Pj4gICBCcmFjZXMgKCd7JyBhbmQgJ30nKSBhcmUgdXN1YWxseSBwbGFj
ZWQgb24gYSBsaW5lIG9mIHRoZWlyIG93biwgZXhjZXB0Cj4gPj4+IC1mb3IgdGhlIGRvL3doaWxl
IGxvb3AuICBUaGlzIGlzIHVubGlrZSB0aGUgTGludXggY29kaW5nIHN0eWxlIGFuZAo+ID4+PiAt
dW5saWtlIEsmUi4gIGRvL3doaWxlIGxvb3BzIGFyZSBhbiBleGNlcHRpb24uIGUuZy46Cj4gPj4+
ICtmb3IgdGhlIHdoaWxlLXBhcnQgb2YgZG8vd2hpbGUgbG9vcHMuICBUaGlzIGlzIHVubGlrZSB0
aGUgTGludXggY29kaW5nIHN0eWxlCj4gPj4+ICthbmQgdW5saWtlIEsmUi4gIGRvL3doaWxlIGxv
b3BzIGFyZSBhbiBleGNlcHRpb24uIGUuZy46Cj4gPj4+Cj4gPj4+ICAgaWYgKCBjb25kaXRpb24g
KQo+ID4+PiAgIHsKPiA+Pj4gQEAgLTc3LDcgKzc3LDggQEAgd2hpbGUgKCBjb25kaXRpb24gKQo+
ID4+PiAgICAgICAvKiBEbyBzdHVmZi4gKi8KPiA+Pj4gICB9Cj4gPj4+Cj4gPj4+IC1kbyB7Cj4g
Pj4+ICtkbwo+ID4+PiArewo+ID4+Cj4gPj4gSSdkIGhhcHBpbHkgdGFrZSB0aGlzIGFkanVzdG1l
bnQgdG8gWGVuJ3Mgc3R5bGUgaWYgaXQgaGVscHMgdXMgZW5kIHVwCj4gPj4gd2l0aCBhdXRvLWZv
cm1hdHRlci4KPiA+Cj4gPiBZYXkhCj4gPgo+ID4+Cj4gPj4gQWxzbywgdGhlcmUgYXJlIGEgbnVt
YmVyIG9mIGZpbGVzIHdoaWNoIGFyZSB0ZWNobmljYWxseSBMaW51eCBzdHlsZSwgYnV0Cj4gPj4g
aGF2ZSB0b3RhbGx5IGRpdmVyZ2VkIGZyb20gTGludXgsIGFuZCB3b3VsZCBiZSBlYXNpZXIgdG8g
bW92ZSB0byBYZW4gc3R5bGUuCj4gPj4KPiA+PiBEbyB5b3UgaGF2ZSBhbiB1cGRhdGVkIC5hc3R5
bGVyYyBiYXNlZCBvbiBKdWxpZW4ncyBvYnNlcnZhdGlvbnM/Cj4gPgo+ID4gWWVzLCB0aGlzIGlz
IGl0Ogo+ID4KPiA+IHN0eWxlPWJzZAo+ID4gc3VmZml4PW5vbmUKPiA+IGFsaWduLXBvaW50ZXI9
bmFtZQo+ID4gYWxpZ24tcmVmZXJlbmNlPW5hbWUKPiA+IGluZGVudD1zcGFjZXM9NAo+ID4gbWF4
LWNvZGUtbGVuZ3RoPTgwCj4gPiBtaW4tY29uZGl0aW9uYWwtaW5kZW50PTAKPiA+IG1heC1jb250
aW51YXRpb24taW5kZW50PTc4Cj4gPiBhdHRhY2gtY2xvc2luZy13aGlsZQo+ID4gcmVtb3ZlLWJy
YWNlcwo+ID4gYnJlYWstb25lLWxpbmUtaGVhZGVycwo+ID4gcGFkLWNvbW1hCj4gPiBwYWQtaGVh
ZGVyCj4KPiBVbmZvcnR1bmF0ZWx5IHRoaXMgc3R5bGUgZG9lcyBub3Qgd29yayB3aXRoIHRoZSBh
c3R5bGUgcHJvdmlkZWQgYnkgRGViaWFuIFN0cmV0Y2g6Cj4KPiA0MnNoPiBhc3R5bGUgeGVuL2Fy
Y2gvYXJtL3NldHVwLmMKPiBJbnZhbGlkIG9wdGlvbiBmaWxlIG9wdGlvbnM6Cj4gbWF4LWNvbnRp
bnVhdGlvbi1pbmRlbnQ9NzgKPiBhdHRhY2gtY2xvc2luZy13aGlsZQo+IHJlbW92ZS1icmFjZXMK
PiBGb3IgaGVscCBvbiBvcHRpb25zIHR5cGUgJ2FzdHlsZSAtaCcKPgo+IEFydGlzdGljIFN0eWxl
IGhhcyB0ZXJtaW5hdGVkCgpJJ20gYWxyZWFkeSBvbiBidXN0ZXIgYW5kIGl0IHdvcmtzIGZpbmUu
IFBlcmhhcHMgd2UnbGwgbmVlZCB0byBzcGVjaWZ5CmEgbWluaW11bSB2ZXJzaW9uIG9mIGFzdHls
ZS4KCj4KPiBBbHNvLCBJIG5lZWRlZCB0byBjb3B5IHRoZSAuYXN0eWxlcmMgaW4gJChIT01FKSBp
biBvcmRlciB0byB1c2UgdGhlIHN0eWxlLiBJdCBpcwo+IHByb2JhYmx5IHdvcnRoIGNvbnNpZGVy
aW5nIGltcGxlbWVudGluZyBhIHdyYXBwZXIgdGhhdCBzZXQKPiBBUlRJU1RJQ19TVFlMRV9PUFRJ
T05TIGFuZCBjYWxsIGFzdHlsZSB0byBrZWVwIGV2ZXJ0aGluZyBpbiBYZW4gaW50ZXJuYWxzLgoK
WW91IGRvbid0IGhhdmUgdG8gY29weSB0byB0byAkKEhPTUUpLCBhcyBJIHBvaW50IG91dCBieSB0
aGUgYWRkaXRpb24KdG8gdGhlIENPRElOR19TVFlMRSB0aGlzIHdvcmtzIGZyb20gdGhlIFhlbiBy
b290IGZvbGRlcjoKCmV4cG9ydCBBUlRJU1RJQ19TVFlMRV9PUFRJT05TPSIuYXN0eWxlcmMiCmFz
dHlsZSA8c291cmNlIG9yIGhlYWRlciBmaWxlPgoKPgo+ID4KPiA+IFdpdGggdGhpcyBpdCdzIGRv
d24gdG8gODYwIGZpbGVzIHRoYXQgYXJlIGZvcm1hdHRlZC4KPgo+IERvIHlvdSBtaW5kIHByb3Zp
ZGluZyB0aGUgbmV3IGRpZmY/CgpJJ3ZlIHVwZGF0ZWQgdGhlIHNhbWUgZ2lzdCB3aXRoIHRoZSBu
ZXcgZGlmZiwgdGhlIHVybCBpcyB0aGUgc2FtZToKaHR0cHM6Ly9naXN0LmdpdGh1Yi5jb20vdGts
ZW5neWVsL2M1Y2FjMTRhMGQ1N2YxMTlkZDc3NDdhMWJlNmZiMjYwCgpUYW1hcwoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
