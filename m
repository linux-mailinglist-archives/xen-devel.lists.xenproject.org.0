Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D872EA9D10
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2019 10:32:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5n8h-00089r-Vv; Thu, 05 Sep 2019 08:29:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=dP/b=XA=crc.id.au=netwiz@srs-us1.protection.inumbo.net>)
 id 1i5n8g-00089i-Bv
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2019 08:29:10 +0000
X-Inumbo-ID: 39660728-cfb7-11e9-b76c-bc764e2007e4
Received: from mail.crc.id.au (unknown [203.56.246.92])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 39660728-cfb7-11e9-b76c-bc764e2007e4;
 Thu, 05 Sep 2019 08:29:07 +0000 (UTC)
Received: from lamp.crc.id.au (unknown
 [IPv6:2407:e400:b000:200:754a:3bb7:e9a1:a94a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by mail.crc.id.au (Postfix) with ESMTPSA id 1E5832000EB;
 Thu,  5 Sep 2019 18:29:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=crc.id.au; s=default;
 t=1567672143; bh=q30oU9Dn7vrAh9iRa05+jPyP9sP837PK/8xUWn3hxkQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=OiOoDjxqHtfkR6ru6bVi2Czj16KsQmpS3YyX1RWoDSPZm6VFUL5ypJmctGubjevjX
 DiNtXUkQaD8MShHABqhPcQkBOsyHAtVPy9jWNGuOFkzQv3JwdmWX4hy/XviNJoX/ts
 cd8HOBD9my5BqsnkSvOQvGcPU9mVukHkpKfLRb4o=
MIME-Version: 1.0
Date: Thu, 05 Sep 2019 18:29:01 +1000
From: Steven Haigh <netwiz@crc.id.au>
To: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <67224ecc-cc1f-90cd-0877-d952c543a9da@citrix.com>
References: <6DA859DE-62FD-48C1-BBEE-C7A63D751B3E@citrix.com>
 <E8BC34C9-934A-4383-833B-B9AE6C9540A9@gmail.com>
 <b434d04f-d4e8-3b00-4efb-bf71c02e5075@suse.com>
 <11D8BF8A-BF9E-4610-8A80-8698B705AFAB@gmail.com>
 <fbee4b0d-6ca7-d2d8-4933-7602e4840d9c@suse.com>
 <EC6DDB1D-BAFF-4079-BBD9-837383A5E3A5@citrix.com>
 <67224ecc-cc1f-90cd-0877-d952c543a9da@citrix.com>
User-Agent: Roundcube Webmail/1.4-rc1
Message-ID: <2b0f12428cabf977d2a4e5dcff258c7f@crc.id.au>
X-Sender: netwiz@crc.id.au
Subject: Re: [Xen-devel] [ANNOUNCE] Call for agenda items for September 5th
 Community Call @ 15:00 UTC
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
Cc: Lars Kurth <lars.kurth@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAxOS0wOS0wNSAxODoxOSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAwNS8wOS8yMDE5
IDA5OjAwLCBMYXJzIEt1cnRoIHdyb3RlOgo+PiBJTVBPUlRBTlQ6IEkgaGFkIGEgZmV3IGFkZGl0
aW9ucyB0byB0aGUgYWdlbmRhLCBidXQgZG8gbm90IGtub3cgV0hPIAo+PiBhZGRlZCB0aGVzZS4g
SSBiZWxpZXZlIG9uZSB3YXMgSnVlcmdlbi4gV2hvIGFkZGVkIHRoZSBpdGVtcyByZWxhdGVkIHRv
IAo+PiBNQSBZb3VuZ3MgcGF0Y2hlcz8KPiAKPiBTdGV2ZW4gSGFpZ2ggSSBiZWxpZXZlLgo+IAo+
IEJvb3RpbmcgZmVkb3JhIGd1ZXN0cyBpcyBjdXJyZW50bHkgaW4gYSB2ZXJ5IGJyb2tlbiBzdGF0
ZS4KClllcCAtIEkgYWRkZWQgcG9pbnRzIDEgJiAyIHRvIHRoZSBBT0Igc2VjdGlvbi4KCkkndmUg
YWxzbyBhZGRlZCBwb2ludCAzIHRvIGluZm9ybSB0aGF0IEkgd291bGRuJ3QgYmUgYWJsZSB0byBk
cml2ZSB0aG9zZSAKbXlzZWxmIGR1ZSB0byB0aW1lem9uZXMuCgpJIGhhdmUgYWRkZWQgc29tZSBy
ZWZlcmVuY2VzIHRvIHhlbi1kZXZlbCBsaXN0IHBvc3RzIHRoYXQgbWF5IGJlIGFibGUgdG8gCmFz
c2lzdC4gSSdtIGhhcHB5IHRvIGFuc3dlciBhbnkgcXVlc3Rpb25zIHZpYSBmcmVlbm9kZSBpZiBz
b21lb25lIHdhbnRzIAp0byBjbG9iYmVyIG1lIGEgZmV3IGhvdXJzIGJlZm9yZSB0aGUgbWVldGlu
ZyAtIHBlbmRpbmcgYXZhaWxhYmlsaXR5LgoKLS0gClN0ZXZlbiBIYWlnaAoKPyBuZXR3aXpAY3Jj
LmlkLmF1ICAgICA/IGh0dHA6Ly93d3cuY3JjLmlkLmF1Cj8gKzYxICgzKSA5MDAxIDYwOTAgICAg
PyAwNDEyIDkzNSA4OTcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
