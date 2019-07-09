Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9462639EB
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jul 2019 19:08:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hktZ5-00032g-Sw; Tue, 09 Jul 2019 17:06:03 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=AxFz=VG=gmail.com=viktor.mitin.19@srs-us1.protection.inumbo.net>)
 id 1hktZ4-00032a-GC
 for xen-devel@lists.xenproject.org; Tue, 09 Jul 2019 17:06:02 +0000
X-Inumbo-ID: d3f638eb-a26b-11e9-8980-bc764e045a96
Received: from mail-io1-xd43.google.com (unknown [2607:f8b0:4864:20::d43])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id d3f638eb-a26b-11e9-8980-bc764e045a96;
 Tue, 09 Jul 2019 17:06:01 +0000 (UTC)
Received: by mail-io1-xd43.google.com with SMTP id m24so35261267ioo.2
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jul 2019 10:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vL8dZygepm7fDRAQR5sp/6iMw+lkD/i/NrvdkBDhhCY=;
 b=LudFTiuUkS18OYNT9XysdoqtLN2ILdX4notu+cXLC/wc6h7fEpvJS8a2hD5Z+xipSa
 G++33iBI23zGzBJivA3onNPrcMbsL6Ae+OmvV4Sj5K7w2+St73b7JkIWa5X8JCi/dYF5
 sGg7YZUFcNQAWGddD8I5SwY9CL5+VEoysHnHdiTvwYJDm5s61spB0tnJ+/FX3FybqyFn
 xRQHE8VtIzx7mWwXCnRUJOpLturF2TNxGKoAcDyOSrBKjAmvYQdDH6RmfR1BPzhPWeqN
 i+Xy548R8caOjxPD1z+K4waIKkj2Po0bc14N4r3IX7kmugd8gTyTHFfDX2lHMalfJrei
 yClA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vL8dZygepm7fDRAQR5sp/6iMw+lkD/i/NrvdkBDhhCY=;
 b=H2uxFEcO/Zh9mXmmD1A2K8WBvYRmmxPYXw04wOPtUyi1w+xt5I8xDGUwzt+I6faGER
 6Lac4UpBWo95z1SVStKQWLZKu89AXTZ+woA1lyVgUKRV3DpDNniAHo+2ndoco2VO5R41
 JR3243faqPnlmj07WaStG4Mue5fl13gsu/YkidZT29qTo7YYLjJys2Wjr3E1weHqKPPb
 8MMsdheivMMPp+DWxBZjIjiRhVZPrpSGFf3XVpkEMjykFx0oHufbi168Ql5rEHzTC9Zu
 s9ngtRzW6Uq2xBnKFK/9CxmcxGFAtrzH9Y4deVyR4mTN2F7t4/Hj9k3ccSOeaTNcVPNv
 XYTg==
X-Gm-Message-State: APjAAAVnVylCBRu8ZkgyE77XaB7Rdq6GozT8Wm+sfmAB2X+AR3jehWmF
 W0o6gOa+n7zsYQxxI0QxoqBrDf3RxBfpK7W6/rA=
X-Google-Smtp-Source: APXvYqwfaGit7kZjB7B5pq+T1/v18svq9d+SO3qjBFeffBJ/FS5htFEjpuA2c8E5/iC4SgHV5Jq6MXsnjKZRMiQWBuI=
X-Received: by 2002:a02:c6a9:: with SMTP id o9mr29936841jan.90.1562691960915; 
 Tue, 09 Jul 2019 10:06:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190709105617.16088-1-viktor.mitin.19@gmail.com>
 <a569e616-431e-474c-0e3f-4c309555dc7f@arm.com>
In-Reply-To: <a569e616-431e-474c-0e3f-4c309555dc7f@arm.com>
From: Viktor Mitin <viktor.mitin.19@gmail.com>
Date: Tue, 9 Jul 2019 20:05:49 +0300
Message-ID: <CAOcoXZaKKEf9S9U56UPz5vgc6pw+LWWFADjJeyBHtqaeQ+OgXA@mail.gmail.com>
To: Julien Grall <julien.grall@arm.com>
Subject: Re: [Xen-devel] [PATCH] xen/doc: remove obsolete warning about
 testing gcov on arm
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
 Viktor Mitin <viktor_mitin@epam.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Jan Beulich <jbeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBKdWwgOSwgMjAxOSBhdCAzOjExIFBNIEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxs
QGFybS5jb20+IHdyb3RlOgo+Cj4gSGksCj4KSGkgSnVsaWVuLAoKPiBPbiA3LzkvMTkgMTE6NTYg
QU0sIFZpa3RvciBNaXRpbiB3cm90ZToKPiA+IFJlbW92ZSBvYnNvbGV0ZSB3YXJuaW5nIGFib3V0
IHRlc3RpbmcgZ2NvdiBvbiBhcm0uCj4gPiBnY292IGhhcyBiZWVuIGZpeGVkIGFuZCB0ZXN0ZWQg
d2l0aCBhcm0gaHcgcHJldmlvdXNseQo+ID4KPiA+IFNlZSBjb21taXQgNmFjNjZjOQo+Cj4gVGhp
cyBjb21taXQuLi4KPgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IFZpa3RvciBNaXRpbiA8dmlrdG9y
X21pdGluQGVwYW0uY29tPgo+ID4gLS0tCj4gPiAgIGRvY3MvaHlwZXJ2aXNvci1ndWlkZS9jb2Rl
LWNvdmVyYWdlLnJzdCB8IDcgLS0tLS0tLQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgNyBkZWxldGlv
bnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZG9jcy9oeXBlcnZpc29yLWd1aWRlL2NvZGUtY292
ZXJhZ2UucnN0IGIvZG9jcy9oeXBlcnZpc29yLWd1aWRlL2NvZGUtY292ZXJhZ2UucnN0Cj4gPiBp
bmRleCAzY2ViZjJkOTZlLi45NDdlZTQ4NzAxIDEwMDY0NAo+ID4gLS0tIGEvZG9jcy9oeXBlcnZp
c29yLWd1aWRlL2NvZGUtY292ZXJhZ2UucnN0Cj4gPiArKysgYi9kb2NzL2h5cGVydmlzb3ItZ3Vp
ZGUvY29kZS1jb3ZlcmFnZS5yc3QKPiA+IEBAIC02LDEzICs2LDYgQEAgdGhlIGNvdmVyYWdlIG9m
IGl0cyBvd24gYmFzaWMgYmxvY2tzLiAgQmVpbmcgYSBwaWVjZSBvZiBzeXN0ZW0gc29mdHdhcmUg
cmF0aGVyCj4gPiAgIHRoYW4gYSB1c2Vyc3BhY2UsIGl0IGNhbid0IGF1dG9tYXRpY2FsbHkgd3Jp
dGUgY292ZXJhZ2Ugb3V0IHRvIHRoZSBmaWxlc3lzdGVtLAo+ID4gICBzbyBzb21lIGV4dHJhIHN0
ZXBzIGFyZSByZXF1aXJlZCB0byBjb2xsZWN0IGFuZCBwcm9jZXNzIHRoZSBkYXRhLgo+ID4KPiA+
IC0uLiB3YXJuaW5nOjoKPiA+IC0KPiA+IC0gIENvdmVyYWdlIGhhcyBvbmx5IGJlZW4gdGVzdGVk
IG9uIHg4NiBhdCB0aGUgbW9tZW50LiAgQVJNIGRvZXNuJ3QgY3VycmVudGx5Cj4gPiAtICBib290
IHdoZW4gdGhlIGZpbmFsIGJpbmFyeSBleGNlZWRzIDJNQiBpbiBzaXplLCBhbmQgdGhlIGNvdmVy
YWdlIGJ1aWxkIHRlbmRzCj4gPiAtICB0byBleGNlZWRzIHRoaXMgbGltaXQuCj4KPiAuLi4gZG9l
cyBub3QgYWRkcmVzcyB0aGUgMk1CIHBhcnQuIFNvIHBhcnQgb2YgdGhlIHdhcm5pbmcgaXMgc3Rp
bGwgdmFsaWQKPiBoZXJlLgo+CklzIGl0IGtub3duIHdoeSBkbyB3ZSBoYXZlIHRoaXMgMk1CIGxp
bWl0PwpTaG91bGQgd2UgZml4IGl0PwoKVGhhbmtzCgo+IENoZWVycywKPgo+IC0tCj4gSnVsaWVu
IEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
