Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FDF9335D5
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jun 2019 18:59:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hXqFM-0008Gz-Ns; Mon, 03 Jun 2019 16:55:44 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mem4=UC=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hXqFL-0008GF-7p
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 16:55:43 +0000
X-Inumbo-ID: 6c1636e0-8620-11e9-8980-bc764e045a96
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 6c1636e0-8620-11e9-8980-bc764e045a96;
 Mon, 03 Jun 2019 16:55:42 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1559580942; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=A6MbPB0BLbEmP2EWXm3E/9bEKsxJ3f+4xAy5X71J/pI=;
 b=t/nY/uwBcYh4FA4Oe0izMSueQ8e8QY5CX6LU4eMifJoDL3hdr6MqcP83KKBaW+8q+F+NBCSA
 1F+jF4oHDKZnoa2UdpHTDcqpNHGnDhRS/xRa3bn1uqKAsgMdWkSGdqS4kFzBmgnxg6cK6d7w
 zwyktyVNg6t1Bh/oKXPyVhg+CA8=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by mxa.mailgun.org with ESMTP id 5cf5510b.7effddea3970-smtp-out-n01;
 Mon, 03 Jun 2019 16:55:39 -0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id z23so11840973wma.4
 for <xen-devel@lists.xenproject.org>; Mon, 03 Jun 2019 09:55:38 -0700 (PDT)
X-Gm-Message-State: APjAAAXIGhZH7tL2VpYvp5LXrpJWjLiajABoQQvLvZgJ0MbJA6X1bUND
 AHAIAIjAbR6RDAhMiCXSGlWuMN+dDLot3xPVaD4=
X-Google-Smtp-Source: APXvYqzTrMOl2RzWMf6r7dvSq2RFTYe6Efv5pp2q2ua4pw0DsX315CLTe8pHiqodM7zNBhDmfu8orNErqmmWaAVMpzM=
X-Received: by 2002:a1c:7d4e:: with SMTP id y75mr3094777wmc.169.1559580937744; 
 Mon, 03 Jun 2019 09:55:37 -0700 (PDT)
MIME-Version: 1.0
References: <20190516213752.1701-1-tamas@tklengyel.com>
 <20190516213752.1701-4-tamas@tklengyel.com>
 <5CF4D9CC02000078002346DC@prv1-mh.provo.novell.com>
 <CABfawh=LbZ6dTQhYS+pxkPLA_=8OrGpeYYnPeZ60bhZ6kzT2Ew@mail.gmail.com>
 <e83a925b-9914-b648-4c6d-3bf6ae9f0769@arm.com>
In-Reply-To: <e83a925b-9914-b648-4c6d-3bf6ae9f0769@arm.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Mon, 3 Jun 2019 10:55:01 -0600
X-Gmail-Original-Message-ID: <CABfawhkgLojGX9Bs=+ygGUzhdnToKt-mR5sgEDDmFqisWxKCtQ@mail.gmail.com>
Message-ID: <CABfawhkgLojGX9Bs=+ygGUzhdnToKt-mR5sgEDDmFqisWxKCtQ@mail.gmail.com>
To: Julien Grall <julien.grall@arm.com>
Subject: Re: [Xen-devel] [PATCH v5 4/4] x86/mem_sharing: compile mem_sharing
 subsystem only when kconfig is enabled
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Razvan Cojocaru <rcojocaru@bitdefender.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>,
 Daniel de Graaf <dgdegra@tycho.nsa.gov>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBKdW4gMywgMjAxOSBhdCAxMDo0MCBBTSBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFs
bEBhcm0uY29tPiB3cm90ZToKPgo+IEhpLAo+Cj4gT24gMDMvMDYvMjAxOSAxNzozOCwgVGFtYXMg
SyBMZW5neWVsIHdyb3RlOgo+ID4gT24gTW9uLCBKdW4gMywgMjAxOSBhdCAyOjI2IEFNIEphbiBC
ZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4gd3JvdGU6Cj4gPj4KPiA+Pj4+PiBPbiAxNi4wNS4x
OSBhdCAyMzozNywgPHRhbWFzQHRrbGVuZ3llbC5jb20+IHdyb3RlOgo+ID4+PiBEaXNhYmxlIGl0
IGJ5IGRlZmF1bHQgYXMgaXQgaXMgb25seSBhbiBleHBlcmltZW50YWwgc3Vic3lzdGVtLgo+ID4+
Pgo+ID4+PiBTaWduZWQtb2ZmLWJ5OiBUYW1hcyBLIExlbmd5ZWwgPHRhbWFzQHRrbGVuZ3llbC5j
b20+Cj4gPj4+IENjOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gPj4+IENjOiBB
bmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+ID4+PiBDYzogV2VpIExp
dSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KPiA+Pj4gQ2M6IFJvZ2VyIFBhdSBNb25uZSA8cm9nZXIu
cGF1QGNpdHJpeC5jb20+Cj4gPj4+IENjOiBHZW9yZ2UgRHVubGFwIDxHZW9yZ2UuRHVubGFwQGV1
LmNpdHJpeC5jb20+Cj4gPj4+IENjOiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4
LmNvbT4KPiA+Pj4gQ2M6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Cj4gPj4+
IENjOiBLb25yYWQgUnplc3p1dGVrIFdpbGsgPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+Cj4gPj4+
IENjOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+Cj4gPj4+IENj
OiBUaW0gRGVlZ2FuIDx0aW1AeGVuLm9yZz4KPiA+Pj4gQ2M6IEdlb3JnZSBEdW5sYXAgPGdlb3Jn
ZS5kdW5sYXBAZXUuY2l0cml4LmNvbT4KPiA+Pj4gLS0tLQo+ID4+PiB2NDogYWRkIEFTU0VSVF9V
TlJFQUNIQUJMRSB0byBpbmxpbmVkIGZ1bmN0aW9ucyB3aGVyZSBhcHBsaWNhYmxlICYgb3RoZXIK
PiA+Pj4gZml4dXBzCj4gPj4+IC0tLQo+ID4+PiAgIHhlbi9hcmNoL3g4Ni9LY29uZmlnICAgICAg
ICAgICAgICB8ICA2ICsrKysrLQo+ID4+PiAgIHhlbi9hcmNoL3g4Ni9kb21haW4uYyAgICAgICAg
ICAgICB8ICAyICsrCj4gPj4+ICAgeGVuL2FyY2gveDg2L2RvbWN0bC5jICAgICAgICAgICAgIHwg
IDIgKysKPiA+Pj4gICB4ZW4vYXJjaC94ODYvbW0vTWFrZWZpbGUgICAgICAgICAgfCAgMiArLQo+
ID4+PiAgIHhlbi9hcmNoL3g4Ni94ODZfNjQvY29tcGF0L21tLmMgICB8ICAyICsrCj4gPj4+ICAg
eGVuL2FyY2gveDg2L3g4Nl82NC9tbS5jICAgICAgICAgIHwgIDIgKysKPiA+Pj4gICB4ZW4vY29t
bW9uL0tjb25maWcgICAgICAgICAgICAgICAgfCAgMyAtLS0KPiA+Pj4gICB4ZW4vY29tbW9uL2Rv
bWFpbi5jICAgICAgICAgICAgICAgfCAgMiArLQo+ID4+PiAgIHhlbi9jb21tb24vZ3JhbnRfdGFi
bGUuYyAgICAgICAgICB8ICAyICstCj4gPj4+ICAgeGVuL2NvbW1vbi9tZW1vcnkuYyAgICAgICAg
ICAgICAgIHwgIDIgKy0KPiA+Pj4gICB4ZW4vY29tbW9uL3ZtX2V2ZW50LmMgICAgICAgICAgICAg
fCAgNiArKystLS0KPiA+Pj4gICB4ZW4vaW5jbHVkZS9hc20teDg2L21lbV9zaGFyaW5nLmggfCAy
OCArKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gPj4+ICAgeGVuL2luY2x1ZGUvYXNtLXg4
Ni9tbS5oICAgICAgICAgIHwgIDMgKysrCj4gPj4+ICAgeGVuL2luY2x1ZGUveGVuL3NjaGVkLmgg
ICAgICAgICAgIHwgIDIgKy0KPiA+Pj4gICB4ZW4vaW5jbHVkZS94c20vZHVtbXkuaCAgICAgICAg
ICAgfCAgMiArLQo+ID4+PiAgIHhlbi9pbmNsdWRlL3hzbS94c20uaCAgICAgICAgICAgICB8ICA0
ICsrLS0KPiA+Pj4gICB4ZW4veHNtL2R1bW15LmMgICAgICAgICAgICAgICAgICAgfCAgMiArLQo+
ID4+PiAgIHhlbi94c20vZmxhc2svaG9va3MuYyAgICAgICAgICAgICB8ICA0ICsrLS0KPiA+Pj4g
ICAxOCBmaWxlcyBjaGFuZ2VkLCA1OCBpbnNlcnRpb25zKCspLCAxOCBkZWxldGlvbnMoLSkKPiA+
Pgo+ID4+IERhbmllbCwgaXQgbG9va3MgbGlrZSB5b3Ugd2VyZW4ndCBDYy1lZCBoZXJlLCBidXQg
eW91ciBhY2sgaXMgbmVlZGVkLgo+ID4KPiA+IEluZGVlZCwgSSd2ZSBhbHNvIHNlZW0gdG8gaGF2
ZSBtaXNzZWQgQ0MtaW5nIFJhenZhbiAoZml4ZWQgbm93KS4KPgo+IE5vd2FkYXlzLCBhZGRfbWFp
bnRhaW5lcnMucGwgc2hvdWxkIGRvIHRoZSByaWdodCBmb3IgeW91IHdpdGhvdXQgaGF2aW5nIHRv
Cj4gbW9kaWZ5aW5nIGJ5IGhhbmQgZWFjaCBwYXRjaDoKPgo+IDQyc2g+IHNjcmlwdHMvYWRkX21h
aW50YWluZXJzLnBsIC1kIC4KCkhpIEp1bGllbiwKYWggZ29vZCBjYWxsISBJJ3ZlIGJlZW4gdXNp
bmcgc2NyaXB0cy9nZXRfbWFpbnRhaW5lcnMucGwgd2hpY2gKZXZpZGVudGx5IGlzIG1vcmUgZXJy
b3ItcHJvbmUgaW4gY2FzZSB0aGUgcGF0Y2ggZ29lcyB0aHJvdWdoIHJldmlzaW9ucwphbmQgSSBm
b3JnZXQgdG8gcmUtY2hlY2sgaWYgbW9yZSBwZW9wbGUgbmVlZCBDQy1pbmcgbm93LgoKVGhhbmtz
LApUYW1hcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
