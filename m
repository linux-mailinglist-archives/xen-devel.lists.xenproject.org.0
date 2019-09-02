Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77331A518E
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2019 10:28:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i4heq-0004QV-8a; Mon, 02 Sep 2019 08:25:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=3NRn=W5=crc.id.au=netwiz@srs-us1.protection.inumbo.net>)
 id 1i4hep-0004QQ-34
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2019 08:25:51 +0000
X-Inumbo-ID: 435f194e-cd5b-11e9-b95f-bc764e2007e4
Received: from mail.crc.id.au (unknown [2407:e400:b000:200::25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 435f194e-cd5b-11e9-b95f-bc764e2007e4;
 Mon, 02 Sep 2019 08:25:49 +0000 (UTC)
Received: from lamp.crc.id.au (lamp.crc.id.au [IPv6:2407:e400:b000:200::8e8e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (Client did not present a certificate)
 by mail.crc.id.au (Postfix) with ESMTPSA id 45C582000E6;
 Mon,  2 Sep 2019 18:25:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=crc.id.au; s=default;
 t=1567412743; bh=r8rAcBOQfInXyexG1yTJqXTRcXNewcOLaXg8lFi9Hjo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=LwH0zJHf28a0NDDGIdj74QcmCx6J0tezTI1ndAZd8lIghX4Wo5Codw7XQJ8601msx
 iZEArAARmUObk3cvUwrNsptZSBdds/EXiIwRBpqA3ESkKl0SHyUTmA4bqu+pE+U/P2
 ROsoY7mD88sti3vAUOh4EsTkthOycGLf8NSa2pd0=
MIME-Version: 1.0
Date: Mon, 02 Sep 2019 18:25:43 +1000
From: Steven Haigh <netwiz@crc.id.au>
To: Paul Durrant <Paul.Durrant@citrix.com>
In-Reply-To: <b3b0c2de1e364adea566eb961ba3d727@AMSPEX02CL03.citrite.net>
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
User-Agent: Roundcube Webmail/1.4-rc1
Message-ID: <655d59e7e876a1f08637ffd52c26a6aa@crc.id.au>
X-Sender: netwiz@crc.id.au
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

T24gMjAxOS0wOS0wMiAxODoyMCwgUGF1bCBEdXJyYW50IHdyb3RlOgo+PiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQo+PiBGcm9tOiBTdGV2ZW4gSGFpZ2ggPG5ldHdpekBjcmMuaWQuYXU+Cj4+
IFNlbnQ6IDAyIFNlcHRlbWJlciAyMDE5IDA5OjA5Cj4+IFRvOiBQYXVsIER1cnJhbnQgPFBhdWwu
RHVycmFudEBjaXRyaXguY29tPgo+PiBDYzogQW5kcmVhcyBLaW56bGVyIDxoZnBAcG9zdGVvLmRl
PjsgQW5kcmV3IENvb3BlciAKPj4gPEFuZHJldy5Db29wZXIzQGNpdHJpeC5jb20+OyB4ZW4tCj4+
IGRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCj4+IFN1YmplY3Q6IFJlOiBXaW5kb3dzIEhWTSBu
byBsb25nZXIgYm9vdHMgd2l0aCBBTUQgUnl6ZW4gMzcwMFggKGFuZCAKPj4gMzkwMFgpCj4+IAo+
PiBPbiAyMDE5LTA5LTAyIDE4OjA0LCBQYXVsIER1cnJhbnQgd3JvdGU6Cj4+ID4+IC0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tCj4+ID4+IEZ1cnRoZXIgdG8gdGhlIGFib3ZlLCBJIGRpZCBzb21l
IGV4cGVyaW1lbnRhdGlvbi4gVGhlIGZvbGxvd2luZyBpcyBhCj4+ID4+IGxpc3Qgb2YgYXR0ZW1w
dGVkIGJvb3QgY29uZmlndXJhdGlvbnMgYW5kIHRoZWlyIG91dGNvbWVzOgo+PiA+Pgo+PiA+PiB2
aXJpZGlhbj0xCj4+ID4+IHZjcHVzPTQKPj4gPj4gU1RPUENPREU6IEhBTCBNRU1PUlkgQUxMT0NB
VElPTgo+PiA+Pgo+PiA+PiB2aXJpZGlhbj0wCj4+ID4+IHZjcHVzPTQKPj4gPj4gU1RPUENPREU6
IE1VTFRJUFJPQ0VTU09SX0NPTkZJR1VSQVRJT05fTk9UX1NVUFBPUlRFRAo+PiA+Pgo+PiA+PiB2
aXJpZGlhbj0wCj4+ID4+IHZjcHVzPTEKPj4gPj4gQm9vdCBPSyAtIGdldCB0byBXaW5kb3dzIFNl
cnZlciAyMDE2IGxvZ2luIGV0Ywo+PiA+Pgo+PiA+Cj4+ID4gQW5kIHRvIGNvbXBsZXRlIHRoZSBz
ZXQsIGhvdyBhYm91dCB2aXJpZGlhbj0xIHZjcHVzPTE/Cj4+IAo+PiBBbnkgdmNwdXMgdmFsdWUg
d2hlcmUgdmlyaWRpYW49MSBpcyB1c2VkIGNyZWF0ZXMgYSBIQUwgTUVNT1JZIAo+PiBBTExPQ0FU
SU9OCj4+IHN0b3Bjb2RlIHdoZW4gdHJ5aW5nIHRvIGJvb3QgV2luZG93cy4KPiAKPiBPaywgc28g
SSBndWVzcyB0aGF0IGlzc3VlIGhpdHMgZmlyc3QgYW5kLCBvbmx5IGlmIHlvdSBnZXQgYmV5b25k
IHRoYXQKPiBkbyB5b3UgaGl0IHRoZSBtdWx0aXByb2Nlc3NvciBwcm9ibGVtLgo+IAo+IFRoZSB2
aXJpZGlhbiBvcHRpb24gaXMgbm90IGFjdHVhbGx5IGEgYm9vbGVhbiBhbnkgbW9yZSAodGhhdAo+
IGludGVycHJldGF0aW9uIGlzIGp1c3QgZm9yIGNvbXBhdCkgc28gaXQgd291bGQgYmUgYSBnb29k
IGRhdGFwb2ludCB0bwo+IGtub3cgd2hpY2ggb2YgdGhlIGVubGlnaHRlbm1lbnRzIGNhdXNlcyB0
aGUgY2hhbmdlIGluIGJlaGF2aW91ci4gQ291bGQKPiB5b3UgdHJ5IHZpcmlkaWFuPVsnYmFzZSdd
IHRvIHNlZSBpZiB0aGF0J3Mgc3VmZmljaWVudCB0byBjYXVzZSB0aGUKPiBwcm9ibGVtPyAoSSdt
IGd1ZXNzaW5nIGl0IHByb2JhYmx5IGlzIGJ1dCBpdCB3b3VsZCBiZSBnb29kIHRvIGtub3cpLgoK
CkhpIFBhdWwsCgpJIGNhbiBjb25maXJtIHRoYXQgdmlyaWRpYW49WydiYXNlJ10gY3Jhc2hlcyB3
aXRoIHRoZSBzYW1lIEhBTCBNRU1PUlkgCkFMTE9DQVRJT04gc3RvcGNvZGUgLSBldmVuIG9uIDEg
dmNwdS4KCi0tIApTdGV2ZW4gSGFpZ2gKCj8gbmV0d2l6QGNyYy5pZC5hdSAgICAgPyBodHRwOi8v
d3d3LmNyYy5pZC5hdQo/ICs2MSAoMykgOTAwMSA2MDkwICAgID8gMDQxMiA5MzUgODk3CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
