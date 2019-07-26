Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD96376CC8
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2019 17:27:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hr25E-0001da-G4; Fri, 26 Jul 2019 15:24:36 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XdPt=VX=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hr25C-0001dV-4O
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2019 15:24:34 +0000
X-Inumbo-ID: 77981e8d-afb9-11e9-8980-bc764e045a96
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 77981e8d-afb9-11e9-8980-bc764e045a96;
 Fri, 26 Jul 2019 15:24:32 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1564154672; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=grqGuCLwX7p6RqhmFwG/MzA9HebMuVXRjTA2TkkOcmM=;
 b=Iau9fRh3bRiFc1AYmtR8gDKD9+EbpIME4rBPBP6CRyHkX4mpw4R9T+m9f6R2mV8RKqauM4Lj
 QEkP1ILCyOSt30TEmaBrWnqNe5Ad6CHOm6Lk3jUh53PbC+I/l0MAZGJEtAVAzzx+iWRKkoY3
 RVG1b4CiyWSANlLb3wtEKR4igaI=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by mxa.mailgun.org with ESMTP id 5d3b1b2f.7fd1a5905b70-smtp-out-n01;
 Fri, 26 Jul 2019 15:24:31 -0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id 207so48357548wma.1
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jul 2019 08:24:31 -0700 (PDT)
X-Gm-Message-State: APjAAAWDJAgIvSGX3eAAhGXMAddWpSmMjatZgvKED/Cd+qbXIc9GdvVR
 tht+4+fnun6waigun2sPPHm3KWb0P2ZMzwpRgyw=
X-Google-Smtp-Source: APXvYqyRBgYuHZGGcVpQ1jYbfbUpWrTvZ55Oijhj/NFsT+IkxA/p1N6/hdGoZ0me8iJZ3iDEVW9dLkzxqOPHbCB2z8U=
X-Received: by 2002:a7b:c1da:: with SMTP id a26mr86105778wmj.128.1564154670771; 
 Fri, 26 Jul 2019 08:24:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190718144317.23307-1-tamas@tklengyel.com>
 <119d0edb-cb12-fbad-9e3e-8c0a469983df@arm.com>
 <CABfawh=DwOP5eQYmMVNF+n-khkbEDFia0eo=JbE0yhCKjV_+8Q@mail.gmail.com>
 <fcbf4968-7b82-6e5d-75ae-e4c2ff059b4d@arm.com>
 <CABfawhnk+_ssU1xEzN6O+_JkH4jT2NguP30VRpkNKzc7xoKeXw@mail.gmail.com>
 <d60c933e-7f30-191c-2d75-4558223ef3e4@arm.com>
 <CAOcoXZYA4oC+ZXkfS4CQVs6JhkR+pAONgyg1ZfWzo+Q=GcAWQA@mail.gmail.com>
 <9e9d6fbf-ecdb-4e3f-89ae-beb13243d9e1@arm.com>
In-Reply-To: <9e9d6fbf-ecdb-4e3f-89ae-beb13243d9e1@arm.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Fri, 26 Jul 2019 09:23:54 -0600
X-Gmail-Original-Message-ID: <CABfawhkiWjatt+on9Tce6uTJw2_kLpozYGq=wHmdoVnovB78xw@mail.gmail.com>
Message-ID: <CABfawhkiWjatt+on9Tce6uTJw2_kLpozYGq=wHmdoVnovB78xw@mail.gmail.com>
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
 Xen-devel <xen-devel@lists.xenproject.org>,
 Viktor Mitin <viktor.mitin.19@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBKdWwgMjYsIDIwMTkgYXQgOToxMiBBTSBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFs
bEBhcm0uY29tPiB3cm90ZToKPgo+IEhpIFZpa3RvciwKPgo+IE9uIDI2LzA3LzIwMTkgMTU6NTgs
IFZpa3RvciBNaXRpbiB3cm90ZToKPiA+IE9uIEZyaSwgSnVsIDE5LCAyMDE5IGF0IDExOjM3IEFN
IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+ID4+Cj4gPj4gSGkg
VGFtYXMsCj4gPj4KPiA+PiBPbiAxOC8wNy8yMDE5IDE4OjIyLCBUYW1hcyBLIExlbmd5ZWwgd3Jv
dGU6Cj4gPj4+PiAgICAgIC0gTGluZSAxMzk6IFRoZSB7IGFyZSBjb21tb25seSBvbiB0aGUgc2Ft
ZSBsaW5lIGFzIHN0cnVjdCBvciBkZWZpbml0aW9uLgo+ID4+Pgo+ID4+PiBBY2NvcmRpbmcgdG8g
Q09ESU5HX1NUWUxFIHRoYXQncyBub3QgaG93IGl0IHNob3VsZCBiZS4KPiA+Pgo+ID4+IEkgZ3Vl
c3MgeW91IHJlZmVyIHRvIHRoZSBzZWN0aW9uICJCcmFjaW5nIi4gSWYgc28sIEkgdGhpbmsgd2Ug
ZG9uJ3QgZm9sbG93IHRoZQo+ID4+IENPRElOR19TVFlMRSBmb3Igc3RydWN0IG9yIGRlZmluaXRp
b24uCj4gPj4KPiA+PiBJIGhhdmUgdG8gYWRtaXQgdGhhdCBmb3IgdGhpcyBjYXNlLCBJIGFsd2F5
cyBoYXZlIHRvIGxvb2sgYXQgb3RoZXIgdXNhZ2UgaW4gdGhlCj4gPj4gY29kZSBiZWNhdXNlIEkg
dGVuZCB0byBwdXQgdGhlIHsgb24gYSBuZXdsaW5lLgo+ID4+Cj4gPj4gSSB3YXMgZ29pbmcgdG8g
c2F5IHRoYXQgdGhlcmUgbWF5IGJlIHNvbWUgY2FzZXMgd2hlcmUgaXQgbWFrZXMgc2Vuc2UgdG8g
a2VlcCB7Cj4gPj4gb24gdGhlIHNhbWUgbGluZS4gRm9yIGluc3RhbmNlOgo+ID4+Cj4gPj4gICAg
ICB7IGEsIGIsIGMsIGQgfSwKPiA+PiAgICAgIHsgZSwgZiwgZywgaCB9LAo+ID4+Cj4gPgo+ID4g
QWxsIHRoZSBydWxlcyBzaG91bGQgYmUgc3RhdGVkIGluIENPRElOR19TVFlMRSBleHBsaWNpdGx5
Lgo+ID4gSW4gb3RoZXIgY2FzZXMsIGl0IGNhbm5vdCBiZSBhdXRvbWF0ZWQgd2l0aCBmdXR1cmUg
cHJvdmVzIHdoeSBpdCB3b3Jrcwo+ID4gdGhpcyBvciB0aGF0IHdheS4KPgo+IFRoaXMgaXMgbm90
IHZlcnkgY29uc3RydWN0aXZlIHRvIHNlbmQgb24gbXVsdGlwbGUgZGlmZmVyZW50IHRocmVhZHMg
InRoaXMgc2hvdWxkCj4gYmUgZXhwbGljaXRseSBiZSBpbiB0aGUgQ09ESU5HX1NUWUxFIi4gTW9z
dCBvZiB0aGUgcGVvcGxlIGluIENDIGFyZSBhd2FyZSB0aGlzCj4gaXMgYW4gaXNzdWUuCj4KPiBC
dXQgdGhlIHByb2JsZW0gaGVyZSBpcyBjb2RpZnlpbmcgdGhvc2Ugc3R5bGVzLiBUaGlzIG9mdGVu
IHJlc3VsdHMgaW4gYSBsb3Qgb2YKPiBkaXNjdXNzaW9ucyBiZWNhdXNlIGEgbG90IGlzIGEgbWF0
dGVyIG9mIHRhc3RlLiBJbiBvdGhlciB0aGVyZSBhcmUgbm8gYW5zd2VycyB0bwo+IHRoZSBwYXRj
aGVzLgo+Cj4gV2hhdCB3ZSBuZWVkIGlzIHNvbWVvbmUgdG8gZHJpdmUgdGhpcyBlZmZvcnQgYW5k
IG1ha2Ugc3VyZSB3ZSBtYWtlIHNvbWUgcHJvZ3Jlc3MuCj4KPiBBbHNvLCB0cnlpbmcgdG8gY29k
aWZ5IGFsbCB0aGUgdW53cml0dGVuIHN0eWxlcyBpcyBwcm9iYWJseSBnb2luZyB0byBiZQo+IGRp
ZmZpY3VsdC4gSW5zdGVhZCwgSSB3b3VsZCBzdWdnZXN0IHRvIHN0YXJ0IGZyb20gYW4gZXhpc3Rp
bmcgY29kaW5nIHN0eWxlIHRoYXQKPiBpcyB2ZXJ5IGNsb3NlIHRvIFhlbiAobWF5YmUgQlNEPyku
CgorMSwgZ29pbmcgZnJvbSBhbiBleGlzdGluZyBzdHlsZSBhbmQgdGhlbiBhZGRpbmcgZXhjZXB0
aW9ucyBhcyBuZWVkZWQKSSB0aGluayBpcyBhIGdvb2Qgd2F5IHRvIGRvIHRoaXMuIEF0IGxlYXN0
IHRoYXQncyB3aGF0IEkgdHJpZWQgd2l0aAphc3R5bGUgYW5kIHRoZSBCU0Qgc3R5bGUgd2FzIHBy
ZXR0eSBjbG9zZS4KClRhbWFzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
