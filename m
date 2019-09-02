Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1188FA5390
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2019 12:05:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i4jA0-0004Im-5y; Mon, 02 Sep 2019 10:02:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=3NRn=W5=crc.id.au=netwiz@srs-us1.protection.inumbo.net>)
 id 1i4j9y-0004Ih-OX
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2019 10:02:06 +0000
X-Inumbo-ID: b48f0b08-cd68-11e9-8980-bc764e2007e4
Received: from mail.crc.id.au (unknown [2407:e400:b000:200::25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b48f0b08-cd68-11e9-8980-bc764e2007e4;
 Mon, 02 Sep 2019 10:02:02 +0000 (UTC)
Received: from wopr.lan.crc.id.au (unknown
 [IPv6:2407:e400:b000:200:3531:a6bb:df13:221])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (Client did not present a certificate)
 by mail.crc.id.au (Postfix) with ESMTPSA id 68BF620008F;
 Mon,  2 Sep 2019 20:01:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=crc.id.au; s=default;
 t=1567418518; bh=Uk62V0FrviwyNxg2lcyDK7qwdwCw+rJf+xlLY2Gwl8M=;
 h=Date:From:Subject:To:Cc:In-Reply-To:References;
 b=azLC9ACFqM4Vh2ZPzPWvEY/zHzljrT+SrTOoSK9A1OgGR3gbWYik0wkjoSJGOjbbE
 CoXdDb5y1/KASs7so8Ek3Y1GQkhFuXfZ50M4WtQaYTq5PAqN/et4QWWFB0Gxd0qd1c
 sB8JoOtHLxTRDHasCyF8qGIs8AHo+JJFJfUi/XBM=
Date: Mon, 02 Sep 2019 20:01:54 +1000
From: Steven Haigh <netwiz@crc.id.au>
To: Paul Durrant <Paul.Durrant@citrix.com>
Message-Id: <1567418514.3313.0@crc.id.au>
In-Reply-To: <dbac9421b8994c31b160c0e3a95db277@AMSPEX02CL03.citrite.net>
References: <51bd31f9-4fb1-84b5-7b9b-983b53133148@posteo.de>
 <a2fecd7b-a035-48b4-ed18-cd3234be8d58@citrix.com>
 <53c70f32-9ae6-a9f8-6472-5e49d01ce2b0@posteo.de>
 <1b95b3f8-b822-1f1c-243f-728e7967d04f@citrix.com>
 <1dfc79fa-acde-40af-704d-be3289fdd133@posteo.de>
 <71fad1413643be2df5f2291270b60448@crc.id.au>
 <cbbfaf3c5d4e12358c635054198bce17@crc.id.au>
 <869a473b1f7342c48f2198e46b6c8427@AMSPEX02CL03.citrite.net>
 <2d859d487c294b8d98749dccaf735c96@crc.id.au>
 <b3b0c2de1e364adea566eb961ba3d727@AMSPEX02CL03.citrite.net>
 <655d59e7e876a1f08637ffd52c26a6aa@crc.id.au>
 <e1d0c2c4a2f88777f82eed559cc68554@crc.id.au>
 <dbac9421b8994c31b160c0e3a95db277@AMSPEX02CL03.citrite.net>
X-Mailer: geary/3.32.2
MIME-Version: 1.0
Subject: Re: [Xen-devel] Windows HVM no longer boots with AMD Ryzen 3700X
 (and 3900X)
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
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>, Andreas Kinzler <hfp@posteo.de>,
 xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ck9uIE1vbiwgU2VwIDIsIDIwMTkgYXQgNjozNCBQTSwgUGF1bCBEdXJyYW50IDxQYXVsLkR1cnJh
bnRAY2l0cml4LmNvbT4gCndyb3RlOgo+PiAgLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPj4g
IEZyb206IFN0ZXZlbiBIYWlnaCA8bmV0d2l6QGNyYy5pZC5hdT4KPj4gIFNlbnQ6IDAyIFNlcHRl
bWJlciAyMDE5IDA5OjMyCj4+ICBUbzogUGF1bCBEdXJyYW50IDxQYXVsLkR1cnJhbnRAY2l0cml4
LmNvbT4KPj4gIENjOiBBbmRyZXcgQ29vcGVyIDxBbmRyZXcuQ29vcGVyM0BjaXRyaXguY29tPjsg
QW5kcmVhcyBLaW56bGVyIAo+PiA8aGZwQHBvc3Rlby5kZT47IHhlbi0KPj4gIGRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCj4+ICBTdWJqZWN0OiBSZTogV2luZG93cyBIVk0gbm8gbG9uZ2VyIGJv
b3RzIHdpdGggQU1EIFJ5emVuIDM3MDBYIChhbmQgCj4+IDM5MDBYKQo+PiAKPj4gIE9uIDIwMTkt
MDktMDIgMTg6MjUsIFN0ZXZlbiBIYWlnaCB3cm90ZToKPj4gID4gT24gMjAxOS0wOS0wMiAxODoy
MCwgUGF1bCBEdXJyYW50IHdyb3RlOgo+PiAgPj4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0t
Cj4+ICA+Pj4gRnJvbTogU3RldmVuIEhhaWdoIDxuZXR3aXpAY3JjLmlkLmF1Pgo+PiAgPj4+IFNl
bnQ6IDAyIFNlcHRlbWJlciAyMDE5IDA5OjA5Cj4+ICA+Pj4gVG86IFBhdWwgRHVycmFudCA8UGF1
bC5EdXJyYW50QGNpdHJpeC5jb20+Cj4+ICA+Pj4gQ2M6IEFuZHJlYXMgS2luemxlciA8aGZwQHBv
c3Rlby5kZT47IEFuZHJldyBDb29wZXIKPj4gID4+PiA8QW5kcmV3LkNvb3BlcjNAY2l0cml4LmNv
bT47IHhlbi0KPj4gID4+PiBkZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwo+PiAgPj4+IFN1Ympl
Y3Q6IFJlOiBXaW5kb3dzIEhWTSBubyBsb25nZXIgYm9vdHMgd2l0aCBBTUQgUnl6ZW4gMzcwMFgg
Cj4+IChhbmQKPj4gID4+PiAzOTAwWCkKPj4gID4+Pgo+PiAgPj4+IE9uIDIwMTktMDktMDIgMTg6
MDQsIFBhdWwgRHVycmFudCB3cm90ZToKPj4gID4+PiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2Ut
LS0tLQo+PiAgPj4+ID4+IEZ1cnRoZXIgdG8gdGhlIGFib3ZlLCBJIGRpZCBzb21lIGV4cGVyaW1l
bnRhdGlvbi4gVGhlIAo+PiBmb2xsb3dpbmcgaXMgYQo+PiAgPj4+ID4+IGxpc3Qgb2YgYXR0ZW1w
dGVkIGJvb3QgY29uZmlndXJhdGlvbnMgYW5kIHRoZWlyIG91dGNvbWVzOgo+PiAgPj4+ID4+Cj4+
ICA+Pj4gPj4gdmlyaWRpYW49MQo+PiAgPj4+ID4+IHZjcHVzPTQKPj4gID4+PiA+PiBTVE9QQ09E
RTogSEFMIE1FTU9SWSBBTExPQ0FUSU9OCj4+ICA+Pj4gPj4KPj4gID4+PiA+PiB2aXJpZGlhbj0w
Cj4+ICA+Pj4gPj4gdmNwdXM9NAo+PiAgPj4+ID4+IFNUT1BDT0RFOiBNVUxUSVBST0NFU1NPUl9D
T05GSUdVUkFUSU9OX05PVF9TVVBQT1JURUQKPj4gID4+PiA+Pgo+PiAgPj4+ID4+IHZpcmlkaWFu
PTAKPj4gID4+PiA+PiB2Y3B1cz0xCj4+ICA+Pj4gPj4gQm9vdCBPSyAtIGdldCB0byBXaW5kb3dz
IFNlcnZlciAyMDE2IGxvZ2luIGV0Ywo+PiAgPj4+ID4+Cj4+ICA+Pj4gPgo+PiAgPj4+ID4gQW5k
IHRvIGNvbXBsZXRlIHRoZSBzZXQsIGhvdyBhYm91dCB2aXJpZGlhbj0xIHZjcHVzPTE/Cj4+ICA+
Pj4KPj4gID4+PiBBbnkgdmNwdXMgdmFsdWUgd2hlcmUgdmlyaWRpYW49MSBpcyB1c2VkIGNyZWF0
ZXMgYSBIQUwgTUVNT1JZCj4+ICA+Pj4gQUxMT0NBVElPTgo+PiAgPj4+IHN0b3Bjb2RlIHdoZW4g
dHJ5aW5nIHRvIGJvb3QgV2luZG93cy4KPj4gID4+Cj4+ICA+PiBPaywgc28gSSBndWVzcyB0aGF0
IGlzc3VlIGhpdHMgZmlyc3QgYW5kLCBvbmx5IGlmIHlvdSBnZXQgYmV5b25kIAo+PiB0aGF0Cj4+
ICA+PiBkbyB5b3UgaGl0IHRoZSBtdWx0aXByb2Nlc3NvciBwcm9ibGVtLgo+PiAgPj4KPj4gID4+
IFRoZSB2aXJpZGlhbiBvcHRpb24gaXMgbm90IGFjdHVhbGx5IGEgYm9vbGVhbiBhbnkgbW9yZSAo
dGhhdAo+PiAgPj4gaW50ZXJwcmV0YXRpb24gaXMganVzdCBmb3IgY29tcGF0KSBzbyBpdCB3b3Vs
ZCBiZSBhIGdvb2QgCj4+IGRhdGFwb2ludCB0bwo+PiAgPj4ga25vdyB3aGljaCBvZiB0aGUgZW5s
aWdodGVubWVudHMgY2F1c2VzIHRoZSBjaGFuZ2UgaW4gYmVoYXZpb3VyLiAKPj4gQ291bGQKPj4g
ID4+IHlvdSB0cnkgdmlyaWRpYW49WydiYXNlJ10gdG8gc2VlIGlmIHRoYXQncyBzdWZmaWNpZW50
IHRvIGNhdXNlIAo+PiB0aGUKPj4gID4+IHByb2JsZW0/IChJJ20gZ3Vlc3NpbmcgaXQgcHJvYmFi
bHkgaXMgYnV0IGl0IHdvdWxkIGJlIGdvb2QgdG8gCj4+IGtub3cpLgo+PiAgPgo+PiAgPgo+PiAg
PiBIaSBQYXVsLAo+PiAgPgo+PiAgPiBJIGNhbiBjb25maXJtIHRoYXQgdmlyaWRpYW49WydiYXNl
J10gY3Jhc2hlcyB3aXRoIHRoZSBzYW1lIEhBTCAKPj4gTUVNT1JZCj4+ICA+IEFMTE9DQVRJT04g
c3RvcGNvZGUgLSBldmVuIG9uIDEgdmNwdS4KPj4gCj4+ICBBbHNvLCBqdXN0IHdvbmRlcmluZywg
d2UncmUgdXNpbmcgOC4yLjAgb2YgdGhlIFdpbmRvd3MgUFYgZHJpdmVycyBvbgo+PiAgdGhpcyBW
TS4KPj4gCj4+ICBEb2VzIHRoaXMgbWF0dGVyPyBIYXMgdGhlcmUgYmVlbiBhbnkgY2hhbmdlcyB0
aGF0IHdvdWxkIGFmZmVjdCB0aGlzIAo+PiBpbgo+PiAgOC4yLjEgb3IgOC4yLjI/Cj4+IAo+IAo+
IEZyb20gd2hhdCB5b3UgZGVzY3JpYmUsIEkgdGhpbmsgdGhpcyBpcyBoYXBwZW5pbmcgd2F5IGJl
Zm9yZSBhbnkgUFYgCj4gZHJpdmVyIGNvZGUgaXMgZW50ZXJlZC4gSSBndWVzcyBpdCB3b3VsZCBi
ZSBwcnVkZW50IHRvIG1ha2Ugc3VyZSBieSAKPiB0cnlpbmcgaXQgb24gYSBmcmVzaCBWTSAoYnV0
IGRpZG4ndCB5b3Ugc2F5IGJlZm9yZSB0aGF0IHRoaXMgaGFwcGVucyAKPiB3aGVuIGJvb3Rpbmcg
ZnJvbSB0aGUgaW5zdGFsbGF0aW9uIG1lZGlhPykKCgpUaGUgb3JpZ2luYWwgcG9zdGVyIG1lbnRp
b25lZCB0aGUgcHJvYmxlbSB3aXRoIHRoZSBpbnN0YWxsIG1lZGlhLiBUbyBiZSAKaG9uZXN0LCBJ
IGhhdmVuJ3QgdHJpZWQgdGhhdCBhcyB5ZXQuCgpNeSBjYXNlIC8gdGVzdHMgYXJlIGZyb20gYSB3
b3JraW5nIFdpbmRvd3MgU2VydmVyIDIwMTYgaW5zdGFsbCBpbWFnZWQgCm9uIGEgZGlmZmVyZW50
IG1hY2hpbmUgKHRoYXQgd29ya3MgYW5kIGJvb3RzIGZpbmUgdGhlcmUpLgoKCgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
