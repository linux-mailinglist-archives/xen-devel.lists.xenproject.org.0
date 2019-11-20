Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0AD0104668
	for <lists+xen-devel@lfdr.de>; Wed, 20 Nov 2019 23:24:13 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iXYKq-0005m5-PZ; Wed, 20 Nov 2019 22:20:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5CMf=ZM=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iXYKo-0005lL-T8
 for xen-devel@lists.xenproject.org; Wed, 20 Nov 2019 22:20:26 +0000
X-Inumbo-ID: f02b9eec-0be3-11ea-9631-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f02b9eec-0be3-11ea-9631-bc764e2007e4;
 Wed, 20 Nov 2019 22:20:20 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9806020855;
 Wed, 20 Nov 2019 22:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1574288420;
 bh=s7/Vq5uvlJInzL/uZHQVyfdUY4OW7niaxd8EBGmY99k=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=nXndSPNzcIs+azdASmqtNryn2q0SFc6Le6+yvRLO7UpGzEqZ3ERVrd29IzTgOVlVB
 KJ60ecpQ10GJ9+pGxgusYKwGQcA8vyTLdCOiOv7vrTvPP0DqCGBmDTh7oG+jF0CuSD
 PqJsc8w42rm5VVSEMo29kUD+SnGABPUs9xT2skCI=
Date: Wed, 20 Nov 2019 14:20:19 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Artem Mygaiev <Artem_Mygaiev@epam.com>
In-Reply-To: <c2332971dece50cfdc75b0c71a8a20b9f29716bb.camel@epam.com>
Message-ID: <alpine.DEB.2.21.1911201417220.25834@sstabellini-ThinkPad-T480s>
References: <1573031953-12894-1-git-send-email-andrii.anisov@gmail.com>
 <1573031953-12894-7-git-send-email-andrii.anisov@gmail.com>
 <alpine.DEB.2.21.1911111254510.2677@sstabellini-ThinkPad-T480s>
 <CAJ=z9a2ORW7NbPKTny=oNux0jSAY+vGkAWK1XQ+QS=gTQryPYQ@mail.gmail.com>
 <c2332971dece50cfdc75b0c71a8a20b9f29716bb.camel@epam.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [RFC 6/7] arm: Introduce dummy empty functions for
 data only C files
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
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Andrii Anisov <Andrii_Anisov@epam.com>, lars.kurth.xen@gmail.com,
 "andrii.anisov@gmail.com" <andrii.anisov@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "dgdegra@tycho.nsa.gov" <dgdegra@tycho.nsa.gov>, fusa-sig@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "julien.grall.oss@gmail.com" <julien.grall.oss@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

KyBmdXNhLXNpZwoKT24gVGh1LCAxNCBOb3YgMjAxOSwgQXJ0ZW0gTXlnYWlldiB3cm90ZToKPiBI
ZWxsbyBKdWxpZW4KPiAKPiBPbiBUaHUsIDIwMTktMTEtMTQgYXQgMDg6MDMgKzA5MDAsIEp1bGll
biBHcmFsbCB3cm90ZToKPiA+IAo+ID4gCj4gPiBPbiBUdWUsIDEyIE5vdiAyMDE5LCAwNTo1NyBT
dGVmYW5vIFN0YWJlbGxpbmksIDwKPiA+IHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+IHdyb3RlOgo+
ID4gPiBPbiBXZWQsIDYgTm92IDIwMTksIEFuZHJpaSBBbmlzb3Ygd3JvdGU6Cj4gPiA+ID4gRnJv
bTogQW5kcmlpIEFuaXNvdiA8YW5kcmlpX2FuaXNvdkBlcGFtLmNvbT4KPiA+ID4gPiAKPiA+ID4g
PiBBUk0gQ29tcGlsZXIgNiBoYXMgYSBwcm92ZW4gYnVnOiBpdCBjb21waWxlcyBkYXRhIG9ubHkg
QyBmaWxlcwo+ID4gPiB3aXRoCj4gPiA+ID4gU29mdFZGUCBhdHRyaWJ1dGVzLiBUaGlzIGxlYWRz
IHRvIGEgZmFpbGVkIGxpbmthZ2UgYWZ0ZXJ3YXJkcwo+ID4gPiB3aXRoCj4gPiA+ID4gYW4gZXJy
b3I6Cj4gPiA+ID4gCj4gPiA+ID4gRXJyb3I6IEw2MjQyRTogQ2Fubm90IGxpbmsgb2JqZWN0IGJ1
aWx0X2luLm8gYXMgaXRzIGF0dHJpYnV0ZXMKPiA+ID4gYXJlIGluY29tcGF0aWJsZSB3aXRoIHRo
ZSBpbWFnZSBhdHRyaWJ1dGVzLgo+ID4gPiA+IC4uLiBBNjQgY2xhc2hlcyB3aXRoIFNvZnRWRlAu
Cj4gPiA+ID4gCj4gPiA+ID4gVGhlIGtub3duIHdvcmthcm91bmQgaXMgaW50cm9kdWNpbmcgc29t
ZSBjb2RlIGludG8gdGhlIGFmZmVjdGVkCj4gPiA+IGZpbGUsCj4gPiA+ID4gZS5nLiBhbiBlbXB0
eSAobm9uLXN0YXRpYykgZnVuY3Rpb24gaXMgZW5vdWdoLgo+ID4gPiAKPiA+ID4gT2ggbWFuLCB0
aGlzIGlzIHRydWx5IGhvcnJpYmxlLgo+ID4gPiAKPiA+ID4gSWYgd2UgcmVhbGx5IGhhdmUgdG8g
ZG8gdGhpcyBwbGVhc2U6Cj4gPiA+IAo+ID4gPiAtIHVzZSB0aGUgc2FtZSBkdW1teSBmdW5jdGlv
biBuYW1lIGluIGFsbCBmaWxlcwo+ID4gPiAtIHRoZSBmdW5jdGlvbiBzaG91bGQgYmUgc3RhdGlj
Cj4gPiA+IC0gaGlkaW5nIHRoZSBmdW5jdGlvbiB3aXRoaW4gYSAjaWZkZWYgQVJNQ0MgYmxvY2sK
PiA+ID4gLSBwb3RlbnRpYWxseSBoaWRlIHRoZSB3aG9sZSBob3JyaWJsZSBoYWNrIGJlaGluZCBh
ICNkZWZpbmUgc28gdGhhdAo+ID4gPiBpdAo+ID4gPiAgIHdvdWxkIGJlY29tZSBhdCB0aGUgY2Fs
bCBzaXRlOgo+ID4gPiAKPiA+ID4gICtBUk1DQ19EVU1NWV9GVU5DX0hBQ0soKQo+ID4gCj4gPiAK
PiA+IFRoZSByaXNrIGhlcmUgaXMgd2UgbWF5IGludHJvZHVjZSBuZXcgZmlsZSBpbiB0aGUgZnV0
dXJlIHBvc3NpYmx5IGluCj4gPiBjb21tb24gY29kZSB3aXRoIHNpbWlsYXIgaXNzdWVzLiBTbyBJ
IHdvdWxkIHByZWZlciBpZiB3ZSBjYW4gZmluZCBhbgo+ID4gYXV0b21hdGljIHdheSB0byBkbyB0
aGlzLiBTb21lIGlkZWFzOgo+ID4gICAgIC0gQWRkIHRoZSBmdW5jdGlvbiBhdCBjb21waWxlIHRp
bWUgKHZpYSBtYWtlZmlsZSkuIFRoaXMgd291bGQgYmUKPiA+IGRvbmUgZm9yIGFsbCB0aGUgZmls
ZXMgYnV0IHRoYXQncyBzaG91bGQgbm90IGJlIGEgbWFqb3IgaXNzdWVzLgo+ID4gICAgIC0gRm9y
Y2UgZGlzYWJsZSBzb2Z0ZnZwIGVpdGhlciB2aWEgY29tbWFuZCBsaW5lLCBuZXcgbGluZSBpbiB0
aGUKPiA+IGNvZGUgb3IgcmV3cml0aW5nIHRoZSBhdHRyaWJ1dGUgb2YgdGhlIG9iamVjdC4KPiA+
IAo+ID4gQnV0IGJlZm9yZSBzcGVuZGluZyB0aW1lIHRyeWluZyB0byB3b3JrYXJvdW5kIGEgYnVn
Z3kgY29tcGlsZXIuCj4gPiBXaGF0J3MgdGhlIHBsYW4gd2l0aCBpdD8gSXMgaXQgZ29pbmcgdG8g
YmUgdXNlZCBpbiBwcm9kdWN0aW9uIG9yIGp1c3QKPiA+IGEgZGVtbz8KPiAKPiBUaGlzIGlzIG5v
dCBpbnRlbmRlZCBmb3IgYSBwcm9kdWN0aW9uIHByb2dyYW0gYXQgdGhlIG1vbWVudCwgYW5kIGl0
Cj4gb2J2aW91c2x5IHJlcXVpcmUgbG90IG9mIGZ1cnRoZXIgd29yay4gSSB3b3VsZCBub3QgdHJ5
IHRvIHVwc3RyZWFtIHVnbHkKPiB3b3JrYXJvdW5kcyBmb3IgaXNzdWVzIGxpa2UgdGhlIG9uZSBh
Ym92ZSwgaXQgd291bGQgYmUgbXVjaCBiZXR0ZXIgdG8KPiBzb21laG93IHBlcnN1YWRlIEFybSB0
b29scyB0ZWFtIHRvIHByb3Blcmx5IGZpeCB0aGVtLgo+IAo+IFRoaXMgUkZDIHNlcmllcyBoYXMg
Zm9sbG93aW5nIGdvYWxzOgo+IDEpIHByb3ZlIHRoYXQgd2UgY2FuIHVzZSBzYWZldHktY2VydGlm
aWVkIHRvb2xzIGZvciBYZW4gYW5kIGF2b2lkCj4gcG9zc2libGUgYXJndW1lbnRzIG9uIGNvbXBp
bGVyL2xpbmtlciBjZXJ0aWZpY2F0aW9uIHBhdGgKPiAyKSByZXNlYXJjaCBwb3NzaWJsZSBpc3N1
ZXMgd2hlbiB1c2luZyBub24tc3RhbmRhcmQgY29tcGlsZXIvbGlua2VyIGFuZAo+IHRyeSB0byBz
ZWUgaWYgaXQgaXMgZWFzeSB0byBhZGp1c3QgWGVuIHRvIHVzZSB0aGVtCj4gCj4gSW4gdGhlIGVu
ZCwgaXQgd291bGQgYmUgZ3JlYXQgdG8gbWFrZSBYZW4gYnVpbGQgc3lzdGVtIGZsZXhpYmxlIGVu
b3VnaAo+IHRvIHVzZSB3aXRoIG5vbi1zdGFuZGFyZCBjb21waWxlcnMgd2l0aG91dCBvdmVyY29t
cGxpY2F0aW5nIGl0IG9yIGNoYW5naW5nIGl0IHNpZ25pZmljYW50bHksIGNhdXNpbmcgdG9vIG11
Y2ggZGlzcnVwdGlvbiB0byBjb21tdW5pdHkuCgpJIGFtIGFsaWduZWQgd2l0aCB5b3Ugb24gdGhl
IGdvYWxzLgoKT24gdGhpcyBzcGVjaWZpYyBpc3N1ZSwgaXQgd291bGQgYmUgZ3JlYXQgaWYgQXJt
IGZpeGVkIHRoZWlyIGNvbXBpbGVyLgpNYXliZSB3ZSBjb3VsZCBkaXNjdXNzZWQgdGhpcyBwcm9i
bGVtIHdpdGggdGhlIEFybSBmb2xrcyBkdXJpbmcgb25lIG9mCnRoZSBuZXh0IEZ1U2EgY2FsbHMg
KGxpc3QgaW4gQ0MpLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
