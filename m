Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 918EAA50F3
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2019 10:11:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i4hOL-0002XP-Nu; Mon, 02 Sep 2019 08:08:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=3NRn=W5=crc.id.au=netwiz@srs-us1.protection.inumbo.net>)
 id 1i4hOK-0002XI-KB
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2019 08:08:48 +0000
X-Inumbo-ID: e0206bfa-cd58-11e9-951b-bc764e2007e4
Received: from mail.crc.id.au (unknown [203.56.246.92])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e0206bfa-cd58-11e9-951b-bc764e2007e4;
 Mon, 02 Sep 2019 08:08:42 +0000 (UTC)
Received: from lamp.crc.id.au (lamp.crc.id.au [IPv6:2407:e400:b000:200::8e8e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (Client did not present a certificate)
 by mail.crc.id.au (Postfix) with ESMTPSA id B516B2000E6;
 Mon,  2 Sep 2019 18:08:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=crc.id.au; s=default;
 t=1567411719; bh=vtVbBsfzkQTzA8dKGv9zw3i8DEPEdfaRBWtZ8BjtaUQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=LA5AhUvnBpeTqLH73wn5ZHOcQ3iwWeWvwg2K3Efe5fP93csvTulSUevdjKT/ljiQN
 GOjbz4YTaudhgHdFHSeIQWyez6uIbQSTKZf6pC3QxyRw55WHy9PX5TZFiECfHP/aV5
 KBz9QtANJe1+jTPwpkmvN2+/mNOOXWCWbmsPQ/i8=
MIME-Version: 1.0
Date: Mon, 02 Sep 2019 18:08:39 +1000
From: Steven Haigh <netwiz@crc.id.au>
To: Paul Durrant <Paul.Durrant@citrix.com>
In-Reply-To: <869a473b1f7342c48f2198e46b6c8427@AMSPEX02CL03.citrite.net>
References: <51bd31f9-4fb1-84b5-7b9b-983b53133148@posteo.de>
 <a2fecd7b-a035-48b4-ed18-cd3234be8d58@citrix.com>
 <53c70f32-9ae6-a9f8-6472-5e49d01ce2b0@posteo.de>
 <1b95b3f8-b822-1f1c-243f-728e7967d04f@citrix.com>
 <1dfc79fa-acde-40af-704d-be3289fdd133@posteo.de>
 <71fad1413643be2df5f2291270b60448@crc.id.au>
 <cbbfaf3c5d4e12358c635054198bce17@crc.id.au>
 <869a473b1f7342c48f2198e46b6c8427@AMSPEX02CL03.citrite.net>
User-Agent: Roundcube Webmail/1.4-rc1
Message-ID: <2d859d487c294b8d98749dccaf735c96@crc.id.au>
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

T24gMjAxOS0wOS0wMiAxODowNCwgUGF1bCBEdXJyYW50IHdyb3RlOgo+PiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQo+PiBGdXJ0aGVyIHRvIHRoZSBhYm92ZSwgSSBkaWQgc29tZSBleHBlcmlt
ZW50YXRpb24uIFRoZSBmb2xsb3dpbmcgaXMgYQo+PiBsaXN0IG9mIGF0dGVtcHRlZCBib290IGNv
bmZpZ3VyYXRpb25zIGFuZCB0aGVpciBvdXRjb21lczoKPj4gCj4+IHZpcmlkaWFuPTEKPj4gdmNw
dXM9NAo+PiBTVE9QQ09ERTogSEFMIE1FTU9SWSBBTExPQ0FUSU9OCj4+IAo+PiB2aXJpZGlhbj0w
Cj4+IHZjcHVzPTQKPj4gU1RPUENPREU6IE1VTFRJUFJPQ0VTU09SX0NPTkZJR1VSQVRJT05fTk9U
X1NVUFBPUlRFRAo+PiAKPj4gdmlyaWRpYW49MAo+PiB2Y3B1cz0xCj4+IEJvb3QgT0sgLSBnZXQg
dG8gV2luZG93cyBTZXJ2ZXIgMjAxNiBsb2dpbiBldGMKPj4gCj4gCj4gQW5kIHRvIGNvbXBsZXRl
IHRoZSBzZXQsIGhvdyBhYm91dCB2aXJpZGlhbj0xIHZjcHVzPTE/CgpBbnkgdmNwdXMgdmFsdWUg
d2hlcmUgdmlyaWRpYW49MSBpcyB1c2VkIGNyZWF0ZXMgYSBIQUwgTUVNT1JZIEFMTE9DQVRJT04g
CnN0b3Bjb2RlIHdoZW4gdHJ5aW5nIHRvIGJvb3QgV2luZG93cy4KCi0tIApTdGV2ZW4gSGFpZ2gK
Cj8gbmV0d2l6QGNyYy5pZC5hdSAgICAgPyBodHRwOi8vd3d3LmNyYy5pZC5hdQo/ICs2MSAoMykg
OTAwMSA2MDkwICAgID8gMDQxMiA5MzUgODk3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
