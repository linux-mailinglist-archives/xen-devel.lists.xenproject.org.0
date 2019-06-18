Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 139514A7A9
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jun 2019 18:52:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdHIa-0007Y0-Qx; Tue, 18 Jun 2019 16:49:32 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PyOf=UR=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hdHIZ-0007Xv-2N
 for xen-devel@lists.xenproject.org; Tue, 18 Jun 2019 16:49:31 +0000
X-Inumbo-ID: 0a10f476-91e9-11e9-8980-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 0a10f476-91e9-11e9-8980-bc764e045a96;
 Tue, 18 Jun 2019 16:49:29 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C54912084B;
 Tue, 18 Jun 2019 16:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1560876569;
 bh=5l/Sn4F8Z1D585d902w8Uo11ALEnXOHHZxLrLvbYVSA=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=P1egKnplfDU7tmT5YrHJGIEa5P8iKfdy3OWYvIeSa360grGfZm4VeaV9IunRw/bWp
 NvV45EK1Lr0EzKSf7abj+YicLUJfRNedSvLn5lmp7D5p24XnMw/3vTG+IFjqcLrqYs
 SYkjBtUmoLl1mCWRxu60U3MyElLyzp3PF1X8GnN4=
Date: Tue, 18 Jun 2019 09:49:28 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <07a7084a-b798-0cc7-cca4-3fe58ea95835@arm.com>
Message-ID: <alpine.DEB.2.21.1906180949060.2072@sstabellini-ThinkPad-T480s>
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
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCAxOCBKdW4gMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IE9uIDE4LzA2LzIwMTkg
MTM6MjgsIEFuZHJpaSBBbmlzb3Ygd3JvdGU6Cj4gPiAreGVuLWRldmVsCj4gCj4gUGxlYXNlIGRv
bid0IGNyb3NzLXBvc3QgZS1tYWlsLiBJZiB5b3UgbW92ZSB0aGUgdGhyZWFkIHRvIHhlbi1kZXZl
bCwgdGhlbgo+IHhlbi11c2VycyBzaG91bGQgYmUgZHJvcHBwZWQuCj4gCj4gPiAKPiA+IEhlbGxv
IEp1bGllbiwKPiA+IAo+ID4gPiBJIGFtIGEgYml0IGNvbmZ1c2VkLiBMaW51eCBpcyBhYmxlIHRv
IGJyaW5nLXVwIENQVSBpbiBoeXAgbW9kZSB3aXRoIHRoZQo+ID4gPiBjdXJyZW50Cj4gPiA+IFUt
Ym9vdC4gV2h5IHdvdWxkIHdlIG5lZWQgbW9yZSBjaGFuZ2VzIGZvciBYZW4/Cj4gPiAKPiA+IFRJ
J3MgUk9NIGNvZGUgc3RhcnRzIGFsbCBDUFVzIGluIE5TIFBMMSwgZG9lc24ndCBtYXR0ZXIgaWYg
aXQgaXMgYm9vdCBvcgo+ID4gc2Vjb25kYXJ5IGNvcmUuCj4gPiBJZiB5b3UgbG9vayBhdCBMaW51
eCBjb2RlIFsxXSwgeW91J2xsIHNlZSwgdGhhdCBhZnRlciB0aGUgc2Vjb25kYXJ5IGNvcmUKPiA+
IGJyaW5ndXAgTGludXggZG9lcyBzd2l0Y2ggdGhhdCBjb3JlIGZyb20gTlMgUEwxIHRvIFBMMiAo
aHlwIG1vZGUpIHVzaW5nIFJPTQo+ID4gY29kZSBpbnRlcmZhY2UgKHNtYyAwKS4KPiA+IEF0IHNv
bWUgbW9tZW50IFhFTiBkcm9wcGVkIGFsbCB0by1oeXAtbW9kZSBzd2l0Y2hpbmcgY29kZS4gU28g
SSBkaWQgc3dpdGNoCj4gPiBzZWNvbmRhcmllcyB0byBoeXAgbW9kZSBpbiB1LWJvb3Qgd2l0aCB0
aGUgbG9vcCB3aGljaCByZXBsaWNhdGVzIHRoZSBST00KPiA+IENvZGUgbG9naWMgaW4gdGVybXMg
b2Ygd2FpdGluZyBmb3IgYW4gZXZlbnQgYW5kIGNoZWNraW5nIGF1eCByZWdpc3RlcnMuCj4gCj4g
U3dpdGNoIHRvIGh5cC1tb2RlIGlzIGZhaXJseSBjb21wbGV4IGFuZCBkZXBlbmRzIG9uIHlvdXIg
cHJvY2Vzc29yLiBIZW5jZSB3aHkKPiBpdCB3YXMgZHJvcHBlZCBpbiBib3RoIExpbnV4IGFuZCBY
ZW4uCj4gCj4gSG93ZXZlciwgY2FsbGluZyBhbiBTTUMgd291bGQgYmUgYWNjZXB0YWJsZSB0byBt
ZS4gU3RlZmFubywgYW55IG9waW5pb24/CgpZZXMsIGl0IHdvdWxkIGJlIHRyaXZpYWwgdG8gbWFp
bnRhaW4gc29tZXRoaW5nIGxpa2UgdGhhdC4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
