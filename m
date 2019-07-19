Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA49D6E629
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jul 2019 15:15:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hoSft-0000Dc-3M; Fri, 19 Jul 2019 13:11:49 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9X78=VQ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hoSfr-0000DU-7R
 for xen-devel@lists.xenproject.org; Fri, 19 Jul 2019 13:11:47 +0000
X-Inumbo-ID: c26bc68a-aa26-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id c26bc68a-aa26-11e9-8980-bc764e045a96;
 Fri, 19 Jul 2019 13:11:46 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8B325337;
 Fri, 19 Jul 2019 06:11:45 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D4DC13F71A;
 Fri, 19 Jul 2019 06:11:43 -0700 (PDT)
To: Tamas K Lengyel <tamas@tklengyel.com>
References: <20190718144317.23307-1-tamas@tklengyel.com>
 <119d0edb-cb12-fbad-9e3e-8c0a469983df@arm.com>
 <CABfawh=DwOP5eQYmMVNF+n-khkbEDFia0eo=JbE0yhCKjV_+8Q@mail.gmail.com>
 <fcbf4968-7b82-6e5d-75ae-e4c2ff059b4d@arm.com>
 <CABfawh=R-K3nje0gdsi-26Zj7-y6=KkiW=-s0TLK1o3QgVXLmw@mail.gmail.com>
 <27973ea5-a0d4-0ca4-fd3f-9680f179b283@arm.com>
 <CABfawhk4TzQemnG+3XwtQ4SGmquufOd4nFGajEWJJ++YFuqfZw@mail.gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <a0c71023-2546-d7c4-771c-02a944c93d90@arm.com>
Date: Fri, 19 Jul 2019 14:11:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <CABfawhk4TzQemnG+3XwtQ4SGmquufOd4nFGajEWJJ++YFuqfZw@mail.gmail.com>
Content-Language: en-US
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgVGFtYXMsCgpPbiAxOS8wNy8yMDE5IDE0OjAwLCBUYW1hcyBLIExlbmd5ZWwgd3JvdGU6Cj4g
T24gRnJpLCBKdWwgMTksIDIwMTkgYXQgMjo0MyBBTSBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFs
bEBhcm0uY29tPiB3cm90ZToKPj4KPj4gSGkgVGFtYXMsCj4+Cj4+IE9uIDE4LzA3LzIwMTkgMTg6
NDgsIFRhbWFzIEsgTGVuZ3llbCB3cm90ZToKPj4+PiAgICAgIC0gTGluZSAxMDI1OiBUaGUgdG9v
bHMgbmVlZHMgdG8gYmUgYWJsZSB0byBkZWFsIGZvcl9lYWNoX3ZjcHUoLi4uKSAmIGNvLgo+Pj4K
Pj4+IFRoZXNlIGNhbiBiZSBtYWRlIE9LIGJ5IGFkZGluZyBicmFjZXMuIE90aGVyIHRoYW4gdGhh
dCB0aGUgb25seSB3YXkgSQo+Pj4gZm91bmQgdG8gbWFrZSBpdCBub3QgY2hhbmdlIHRoZSBpbmRl
bnRhdGlvbiBpcyB0byBhZGQgdGhlIGNvbW1lbnQgIi8qCj4+PiAqSU5ERU5ULU9GRiogKi8iIGJl
Zm9yZSB0aGUgYmxvY2sgYW5kICIvKiAqSU5ERU5ULU9OKiAqLyIgYWZ0ZXJ3YXJkcy4KPj4KPj4g
Tm9uZSBvZiB0aGVtIGxvb2tzIHJlYWxseSBhcHBlYWxpbmcgYmVjYXVzZSBpdCBtZWFucyBhc3R5
bGUgd2lsbCBub3QgY29ycmVjdGx5Cj4+IGluZGVudCBpZiB0aGUgdXNlciBkb2VzIG5vdCBhZGQg
YnJhY2VzIG9yIGNvbW1lbnRzLgo+Pgo+PiBDb3VsZCBhc3R5bGUgYmUgZWFzaWx5IG1vZGlmaWVk
IHRvIHJlY29nbml6ZSBmb3JlYWNoIG1hY3Jvcz8KPiAKPiBOb3QgdGhhdCBJJ20gYXdhcmUgb2Yu
IElmIHlvdSBkb24ndCB3YW50IHRvIG1hbnVhbGx5IGFubm90YXRlIGZpbGVzCj4gd2l0aCB1bnN1
cHBvcnRlZCBtYWNyb3MgdGhlbiBqdXN0IGV4Y2x1ZGUgdGhvc2UgZmlsZXMgZnJvbSBhc3R5bGUu
IEkKPiB3b3VsZG4ndCByZWNvbW1lbmQgYWRkaW5nIHRoaXMgdG8gdGhlIENJIGZvciBhbGwgZmls
ZXMsIG9ubHkgZm9yIHRob3NlCj4gdGhhdCB0aGVpciByZXNwZWN0aXZlIG1haW50YWluZXJzIGhh
dmUgY29uZmlybWVkIHRvIGNvbmZvcm0gdG8gdGhlCj4gc3R5bGUgYW5kIHdhbnQgdG8gZW5mb3Jj
ZSBpdCBnb2luZyBmb3J3YXJkLgoKU28gYSBjb3VwbGUgdXNlIG9mIGFuIHVuc3VwcG9ydGVkIG1h
Y3JvcyB3b3VsZCBtYWtlIGltcG9zc2libGUgdG8gZW5mb3JjZSB0aGUgCmNvZGluZyBzdHlsZS4g
VGhpcyBpcyBub3QgYSB2ZXJ5IGlkZWFsIHBvc2l0aW9uIHRvIGJlIGluLgoKX2lmXyB3ZSBhcmUg
Z29pbmcgdG8gYWRvcHQgYXN0eWxlIHRoZW4gd2UgbmVlZCB0byBiZSBhYmxlIHRvIGVuZm9yY2Ug
aXQgb24gZXZlcnkgClhlbiBmaWxlcyBsb25nLXRlcm0uIElmIGl0IGlzIG5vdCBwb3NzaWJsZSB0
byBkbyBpdCB3aXRoIGFzdHlsZSwgdGhlbiBtYXliZSB0aGlzIAppcyBub3QgdGhlIHJpZ2h0IHRv
b2wgdG8gdXNlLgoKRm9yIGluc3RhbmNlLCBJIGtub3cgdGhhdCB0b29scyBzdWNoIGFzIGNsYW5n
LWZvcm1hdCBpcyBhYmxlIHRvIGRlYWwgd2l0aCAKZm9yZWFjaCBtYWNyb3MuCgpDaGVlcnMsCgot
LSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
