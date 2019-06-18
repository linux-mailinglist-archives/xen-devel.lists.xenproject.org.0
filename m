Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 073164A6B5
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jun 2019 18:23:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdGpf-0004yG-6m; Tue, 18 Jun 2019 16:19:39 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NhYq=UR=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hdGpe-0004yB-1Z
 for xen-devel@lists.xenproject.org; Tue, 18 Jun 2019 16:19:38 +0000
X-Inumbo-ID: ddb83e3b-91e4-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id ddb83e3b-91e4-11e9-8980-bc764e045a96;
 Tue, 18 Jun 2019 16:19:37 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CD3D7344;
 Tue, 18 Jun 2019 09:19:36 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AA76A3F246;
 Tue, 18 Jun 2019 09:19:35 -0700 (PDT)
To: Andrii Anisov <andrii.anisov@gmail.com>
References: <287117b9-952c-1a92-26e0-9597df936c27@gmail.com>
 <cd936ab7-df65-1615-a03a-bea30b5814f9@arm.com>
 <f3596bd5-ede3-7299-e28f-033ad32e6c99@gmail.com>
 <62194faf-0bf8-61b8-a69f-e41934fb5a43@arm.com>
 <0c900a15-14ab-9947-bffe-2fbeed176486@gmail.com>
 <CALC81-vaVKgZoi27MauGTxjda8mchy5GRLipu5z=v1vh9fyvAg@mail.gmail.com>
 <747dd124-3511-f010-dac7-b9b23d7b44ad@gmail.com>
 <CALC81-tewzAtaaH94U1nVc-UiacR_YvqhaYcPXtXcviTFHAG8A@mail.gmail.com>
 <ecb2cf41-51e5-2ff2-5e61-72be64399e40@arm.com>
 <AM6PR0302MB32215CD7FAED139C682D92A386EA0@AM6PR0302MB3221.eurprd03.prod.outlook.com>
 <ef82a028-9e4e-9976-d205-42cbc4bfc8ac@arm.com>
 <AM6PR0302MB3221D649900B54C2FFA7003A86EA0@AM6PR0302MB3221.eurprd03.prod.outlook.com>
 <AM6PR03MB49190A0828A49569B64611B4E6EA0@AM6PR03MB4919.eurprd03.prod.outlook.com>
 <07a7084a-b798-0cc7-cca4-3fe58ea95835@arm.com>
 <666fc807-af6a-231c-9d7e-48ecabb07371@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <2c0cced8-27ec-a3bb-b2bf-c037176a162a@arm.com>
Date: Tue, 18 Jun 2019 17:19:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <666fc807-af6a-231c-9d7e-48ecabb07371@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] Starting to port xen on beagleboard-x15 (GSoC 2019
 project)
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
Cc: Hunyue Yau <hy-gsoc@hy-research.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <Andrii_Anisov@epam.com>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Andre Przywara <andre.przywara@arm.com>,
 Denis Obrezkov <denisobrezkov@gmail.com>, Iain Hunter <drhunter95@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAxOC8wNi8yMDE5IDE0OjI3LCBBbmRyaWkgQW5pc292IHdyb3RlOgo+IAo+IAo+IE9uIDE4
LjA2LjE5IDE1OjU0LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IFN3aXRjaCB0byBoeXAtbW9kZSBp
cyBmYWlybHkgY29tcGxleCBhbmQgZGVwZW5kcyBvbiB5b3VyIHByb2Nlc3Nvci4gSGVuY2Ugd2h5
IAo+PiBpdCB3YXMgZHJvcHBlZCBpbiBib3RoIExpbnV4IGFuZCBYZW4uCj4gCj4gSnVsaWVuLCBJ
IGtub3cgaXQuIFdlIGFscmVhZHkgZGlzY3Vzc2VkIHRoYXQgZmV3IHllYXJzIGFnby4KPiAKPj4g
SG93ZXZlciwgY2FsbGluZyBhbiBTTUMgd291bGQgYmUgYWNjZXB0YWJsZSB0byBtZS4gU3RlZmFu
bywgYW55IG9waW5pb24/Cj4gCj4gVGhhdCBwYXRjaCAoZm9yIHUtYm9vdCkgaXMgNSsgeWVhcnMg
b2xkLiBJIGRvIG5vdCB3b3JrIHdpdGggVEkncyBzdHVmZiBmb3IgCj4gYWxtb3N0IDMgeWVhcnMu
IFNvIEknZCBub3QgYm90aGVyIG15c2VsZiB0byBwbGF5IHdpdGggdGhlIHN0dWZmIGFnYWluLgo+
IElmIHRoZSB0b3BpYyBhdXRob3IocykgaGF2ZSBlbm91Z2ggdGltZSBhbmQgaW5zcGlyYXRpb24s
IHRoZXkgYXJlIHdlbGNvbWUgdG8gCj4gaW1wcm92ZSBPTUFQNS1saWtlIFNvQ3Mgc3VwcG9ydC4K
RGVuaXMgKHRoZSBhdXRob3Igb2YgdGhlIHRocmVhZCkgaXMgZG9pbmcgYSBHU09DIHRvIHBvcnQg
WGVuIG9uIHRoZSBCZWFnbGVCb2FyZCAKWDE1LiBZb3UgZW5kZWQgdXAgQ0NlZCBiZWNhdXNlIHlv
dSBjYW4gcHJvdmlkZSBmZWVkYmFjayBob3cgdG8gcHJvY2VlZC4gTm90IApiZWNhdXNlIHdlIHdh
bnRlZCB5b3UgdG8gaW1wbGVtZW50IGl0Li4uCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
