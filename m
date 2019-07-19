Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B4EE6E625
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jul 2019 15:14:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hoSez-00009q-Nm; Fri, 19 Jul 2019 13:10:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=EVsN=VQ=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hoSey-00009l-L9
 for xen-devel@lists.xenproject.org; Fri, 19 Jul 2019 13:10:52 +0000
X-Inumbo-ID: a0fb9436-aa26-11e9-a5ce-8b74c1401094
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a0fb9436-aa26-11e9-a5ce-8b74c1401094;
 Fri, 19 Jul 2019 13:10:50 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1563541850; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=mO0vMYSubpQ+Znz/xYjXbywK1LpBmcwRGYXdrcAzP3Y=;
 b=KLKyMtgknHS5gvmUs+AxQG+gIdVW7an1WJyB+lNb1o6GSmBQ27HmrsnqPDMmLl/bQwO1jY9B
 b2sDdguP4eZXHVB1J789dZ5XNs4grK3lbU9oHs4NgAgcXfJWTgcegy8YKcyhJ0NraFH/VWJD
 TifX+XIf0v+Q9Zp+26svhovPTKM=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by mxa.mailgun.org with ESMTP id 5d31c159.7f9b4c4fabb0-smtp-out-n03;
 Fri, 19 Jul 2019 13:10:49 -0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id s15so7631108wmj.3
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jul 2019 06:10:48 -0700 (PDT)
X-Gm-Message-State: APjAAAVjCXKnRMHG5iRDSuJxtgawwRA9oSvJ9qx6CG+i209wpLjbWmCo
 9ZL2NBDSaV5Wfy8716OCZBUTJkKf0BVGW3qeByk=
X-Google-Smtp-Source: APXvYqzeQSDSapd3vx+9WQstveIQKSjWvS8Hn0TMzsdYhaOyh6i25T2779euLcxM1G4gqQgoRJ1ytmTD4SymlXiaSLE=
X-Received: by 2002:a7b:cf0b:: with SMTP id l11mr50963990wmg.143.1563541847437; 
 Fri, 19 Jul 2019 06:10:47 -0700 (PDT)
MIME-Version: 1.0
References: <20190718144317.23307-1-tamas@tklengyel.com>
 <119d0edb-cb12-fbad-9e3e-8c0a469983df@arm.com>
 <CABfawh=DwOP5eQYmMVNF+n-khkbEDFia0eo=JbE0yhCKjV_+8Q@mail.gmail.com>
 <fcbf4968-7b82-6e5d-75ae-e4c2ff059b4d@arm.com>
 <CABfawhnk+_ssU1xEzN6O+_JkH4jT2NguP30VRpkNKzc7xoKeXw@mail.gmail.com>
 <1406a6d0-90fb-ad20-443c-4f1bf719263c@suse.com>
In-Reply-To: <1406a6d0-90fb-ad20-443c-4f1bf719263c@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Fri, 19 Jul 2019 07:10:11 -0600
X-Gmail-Original-Message-ID: <CABfawhkwKoQqWCC-uUaY438iWitQWzU=51oeddR_HEggX6k6Qg@mail.gmail.com>
Message-ID: <CABfawhkwKoQqWCC-uUaY438iWitQWzU=51oeddR_HEggX6k6Qg@mail.gmail.com>
To: Jan Beulich <JBeulich@suse.com>
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
 Iurii Artemenko <Iurii_Artemenko@epam.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBKdWwgMTksIDIwMTkgYXQgMzowMSBBTSBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+Cj4gT24gMTguMDcuMjAxOSAxOToyMiwgVGFtYXMgSyBMZW5neWVsIHdy
b3RlOgo+ID4+ICAgICAtIExpbmUgMTM5OiBUaGUgeyBhcmUgY29tbW9ubHkgb24gdGhlIHNhbWUg
bGluZSBhcyBzdHJ1Y3Qgb3IgZGVmaW5pdGlvbi4KPiA+Cj4gPiBBY2NvcmRpbmcgdG8gQ09ESU5H
X1NUWUxFIHRoYXQncyBub3QgaG93IGl0IHNob3VsZCBiZS4KPgo+IEhhdmluZyB0aGUgYnJhY2Ug
b24gdGhlIHNhbWUgbGluZSB0aGVyZSBpcyByYXRoZXIgaGVscGZ1bCB0byBlYXNpbHkKPiB0ZWxs
IHRoZSBkZWZpbml0aW9uIHBvaW50IG9mIGEgc3RydWN0L3VuaW9uL2VudW0gZnJvbSBhbnkgb2Yg
aXRzIHVzZXMuCj4gSGVuY2Ugbm8gbWF0dGVyIHdoZXRoZXIgLi9DT0RJTkdfU1RZTEUgZG9lc24n
dCBleHBsaWNpdGx5IGNvdmVyIHRoaXMKPiBmYWN0LCBJIHRoaW5rIHdlIHdhbnQgdG8gc3RpY2sg
dG8gdGhlIChMaW51eCBpbmhlcml0ZWQgSSB0aGluaykgZm9ybS4KPgoKRmFpciBwb2ludCwgYnV0
IHRoZW4gYWdhaW4gd2UgZG9uJ3QgaGF2ZSB0byBhZGQgZXZlcnkgZmlsZSB0byB0aGUKYXV0b21h
dGVkIHN0eWxlIGNoZWNrcywgZm9yIGV4YW1wbGUgYnkgYWRkaW5nICIvKiAqSU5ERU5ULU9GRiog
Ki8iIGF0CnRoZSB0b3Agb2YgdGhlIGZpbGUuIFRoZSAiLS1leGNsdWRlIiBjb21tYW5kIGxpbmUg
ZmxhZyBjYW4gYWxzbyBiZQp1c2VkIGZvciB0aGF0LiBPciBwb3J0aW9ucyBvZiBmaWxlcyBjYW4g
YWxzbyBiZSBtYXJrZWQKbm90LXRvLWJlLXRvdWNoZWQgd2l0aCB0aGUgSU5ERU5ULU9GRi9JTkRF
TlQtT04gY29tbWVudHMuCgpUYW1hcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
