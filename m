Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 070E12E247
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2019 18:30:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hW1QT-0002Vr-Et; Wed, 29 May 2019 16:27:41 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=MUVL=T5=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hW1QS-0002Vj-BG
 for xen-devel@lists.xenproject.org; Wed, 29 May 2019 16:27:40 +0000
X-Inumbo-ID: acb27f8c-822e-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id acb27f8c-822e-11e9-8980-bc764e045a96;
 Wed, 29 May 2019 16:27:38 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ADA95341;
 Wed, 29 May 2019 09:27:38 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B959D3F5AF;
 Wed, 29 May 2019 09:27:36 -0700 (PDT)
To: George Dunlap <george.dunlap@citrix.com>, Jan Beulich
 <JBeulich@suse.com>, George Dunlap <George.Dunlap@eu.citrix.com>
References: <20190507151458.29350-1-julien.grall@arm.com>
 <20190507151458.29350-14-julien.grall@arm.com>
 <5CD57AEC020000780022D885@prv1-mh.provo.novell.com>
 <3c51d11a-7a3c-02b5-be74-9b8684b17c30@citrix.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <f211fe9b-38b4-22d2-fd47-6ba3b4950cbc@arm.com>
Date: Wed, 29 May 2019 17:27:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <3c51d11a-7a3c-02b5-be74-9b8684b17c30@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 13/14] xen/mm: Convert {s,
 g}et_gpfn_from_mfn() to use typesafe MFN
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
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgR2VvcmdlLAoKT24gMjQvMDUvMjAxOSAxNzoyNCwgR2VvcmdlIER1bmxhcCB3cm90ZToKPiBP
biA1LzEwLzE5IDI6MjEgUE0sIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4gQEAgLTEwOTksMTkgKzEx
MDAsMTkgQEAgbG9uZyBwMm1fcHRfYXVkaXRfcDJtKHN0cnVjdCBwMm1fZG9tYWluICpwMm0pCj4+
PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZW50cnlfY291bnQrKzsKPj4+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnRpbnVlOwo+Pj4gICAgICAgICAgICAgICAg
ICAgICAgICAgICB9Cj4+PiAtICAgICAgICAgICAgICAgICAgICAgICAgbWZuID0gbDFlX2dldF9w
Zm4obDFlW2kxXSk7Cj4+PiAtICAgICAgICAgICAgICAgICAgICAgICAgQVNTRVJUKG1mbl92YWxp
ZChfbWZuKG1mbikpKTsKPj4+IC0gICAgICAgICAgICAgICAgICAgICAgICBtMnBmbiA9IGdldF9n
cGZuX2Zyb21fbWZuKG1mbik7Cj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgbWZuID0gbDFl
X2dldF9tZm4obDFlW2kxXSk7Cj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgQVNTRVJUKG1m
bl92YWxpZChtZm4pKTsKPj4+ICsgICAgICAgICAgICAgICAgICAgICAgICBtMnBmbiA9IGdldF9w
Zm5fZnJvbV9tZm4obWZuKTsKPj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgaWYgKCBtMnBm
biAhPSBnZm4gJiYKPj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB0eXBlICE9IHAy
bV9tbWlvX2RpcmVjdCAmJgo+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICFwMm1f
aXNfZ3JhbnQodHlwZSkgJiYKPj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAhcDJt
X2lzX3NoYXJlZCh0eXBlKSApCj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgIHsKPj4+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBtYmFkKys7Cj4+PiAtICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHByaW50aygibWlzbWF0Y2g6IGdmbiAlI2x4IC0+IG1mbiAlI2x4Igo+Pj4g
LSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIiAtPiBnZm4gJSNseFxuIiwgZ2Zu
LCBtZm4sIG0ycGZuKTsKPj4+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgUDJNX1BSSU5U
SygibWlzbWF0Y2g6IGdmbiAlI2x4IC0+IG1mbiAlI2x4Igo+Pj4gLSAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICIgLT4gZ2ZuICUjbHhcbiIsIGdmbiwgbWZuLCBtMnBmbik7
Cj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgIHByaW50aygibWlzbWF0Y2g6IGdmbiAl
I2x4IC0+IG1mbiAlIlBSSV9tZm4iIC0+IGdmbiAlI2x4XG4iLAo+Pj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgZ2ZuLCBtZm5feChtZm4pLCBtMnBmbik7Cj4+PiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIFAyTV9QUklOVEsoIm1pc21hdGNoOiBnZm4gJSNseCAtPiBt
Zm4gJSJQUklfbWZuIiAtPiBnZm4gJSNseFxuIiwKPj4+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBnZm4sIG1mbl94KG1mbiksIG0ycGZuKTsKPj4KPj4gR2VvcmdlLCBk
byB3ZSByZWFsbHkgbWVhbiB0byBoYXZlIHByaW50aygpIGFuZCBQMk1fUFJJTlRLKCkgaGVyZT8K
PiAKPiBMb29rcyBsaWtlIHRoaXMgd2FzIGludHJvZHVjZWQgKGJ5IG1lISkgaW4gYTU4OWZmNmMx
Nzk7IG15IGJlc3QgZ3Vlc3MgaXMKPiB0aGF0IGl0IHdhcyBkdWUgdG8gYSBiYWQgcmViYXNlIG1l
cmdlLgoKT25seSB0aGUgUDJNX1BSSU5USyB2ZXJzaW9uIHNob3VsZCBiZSBrZXB0LCBhbSBJIHJp
Z2h0PwoKPiAKPiBJJ2xsIGxlYXZlIGl0IHRvIEp1bGllbiB0byBkZWNpZGUgaWYgaGUgd2FudHMg
dG8gY2xlYW4gdGhpcyB1cCBvciBsZWF2ZQo+IGl0IGJlLgoKSSBhbSBoYXBweSB0byB3cml0ZSBh
IHBhdGNoIHRvIHJlbW92ZSB0aGUgZHVwbGljYXRlZCBtZXNzYWdlLgoKQ2hlZXJzLAoKLS0gCkp1
bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
