Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5CAFD14B
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2019 00:03:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVO5E-0006F2-6I; Thu, 14 Nov 2019 22:59:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=9s7n=ZG=xen.org=tim@srs-us1.protection.inumbo.net>)
 id 1iVO5C-0006Ex-IQ
 for xen-devel@lists.xenproject.org; Thu, 14 Nov 2019 22:59:22 +0000
X-Inumbo-ID: 64d8aab6-0732-11ea-b678-bc764e2007e4
Received: from deinos.phlegethon.org (unknown [2001:41d0:8:b1d7::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 64d8aab6-0732-11ea-b678-bc764e2007e4;
 Thu, 14 Nov 2019 22:59:21 +0000 (UTC)
Received: from tjd by deinos.phlegethon.org with local (Exim 4.92.3 (FreeBSD))
 (envelope-from <tim@xen.org>)
 id 1iVO57-0004jS-De; Thu, 14 Nov 2019 22:59:17 +0000
Date: Thu, 14 Nov 2019 22:59:17 +0000
From: Tim Deegan <tim@xen.org>
To: Julian Tuminaro <julian.tuminaro@gmail.com>
Message-ID: <20191114225917.GA18031@deinos.phlegethon.org>
References: <20191114045543.6759-1-julian.tuminaro@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191114045543.6759-1-julian.tuminaro@gmail.com>
User-Agent: Mutt/1.11.1 (2018-12-01)
X-SA-Known-Good: Yes
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: tim@xen.org
X-SA-Exim-Scanned: No (on deinos.phlegethon.org);
 SAEximRunCond expanded to false
Subject: Re: [Xen-devel] [PATCH V2] kdd.c: Add support for initial handshake
 in KD protocol for Win 7, 8 and 10 (64 bit)
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
Cc: Wei Liu <wei.liu2@citrix.com>, Paul Durrant <paul@xen.org>,
 Jenish Rakholiya <rjenish@cmu.edu>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Julian Tuminaro <jtuminar@andrew.cmu.edu>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpBdCAyMzo1NSAtMDUwMCBvbiAxMyBOb3YgKDE1NzM2ODkzNDEpLCBKdWxpYW4gVHVtaW5h
cm8gd3JvdGU6Cj4gRnJvbTogSnVsaWFuIFR1bWluYXJvIGFuZCBKZW5pc2ggUmFraG9saXlhIDxq
dWxpYW4udHVtaW5hcm9AZ21haWwuY29tIGFuZCByYWtob2xpeWFqZW5pc2guMDdAZ21haWwuY29t
Pgo+IAo+IEN1cnJlbnQgaW1wbGVtZW50YXRpb24gb2YgZmluZF9vcyBpcyBiYXNlZCBvbiB0aGUg
aGFyZC1jb2RlZCB2YWx1ZXMgZm9yCj4gZGlmZmVyZW50IFdpbmRvd3MgdmVyc2lvbi4gSXQgdXNl
cyB0aGUgdmFsdWUgZm9yIGdldCB0aGUgYWRkcmVzcyB0bwo+IHN0YXJ0IGxvb2tpbmcgZm9yIERP
UyBoZWFkZXIgaW4gdGhlIGdpdmVuIHNwZWNpZmllZCByYW5nZS4gSG93ZXZlciwgdGhpcwo+IGlz
IG5vdCBzY2FsYWJsZSB0byBhbGwgdmVyc2lvbiBvZiBXaW5kb3dzIGFzIGl0IHdpbGwgcmVxdWly
ZSB1cyB0byBrZWVwCj4gYWRkaW5nIG5ldyBlbnRyaWVzIGFuZCBhbHNvIGR1ZSB0byBLQVNMUiwg
Y2hhbmNlcyBvZiBub3QgaGl0dGluZyB0aGUgUEUKPiBoZWFkZXIgaXMgc2lnbmlmaWNhbnQuIFdl
IGltcGxlbWVudCBhIHdheSBmb3IgNjQtYml0IHN5c3RlbXMgdG8gdXNlIElEVAo+IGVudHJ5IHRv
IGdldCBhIHZhbGlkIGV4Y2VwdGlvbi9pbnRlcnJ1cHQgaGFuZGxlciBhbmQgdGhlbiBtb3ZlIGJh
Y2sgaW50bwo+IHRoZSBtZW1vcnkgdG8gZmluZCB0aGUgdmFsaWQgRE9TIGhlYWRlci4gU2luY2Ug
SURUIGVudHJpZXMgYXJlIHByb3RlY3RlZAo+IGJ5IFBhdGNoR3VhcmQsIHdlIHRoaW5rIG91ciBh
c3N1bXB0aW9uIHRoYXQgSURUIGVudHJpZXMgd2lsbCBub3QgYmUKPiBjb3JydXB0ZWQgaXMgdmFs
aWQgZm9yIG91ciBwdXJwb3NlLiBPbmNlIHdlIGhhdmUgdGhlIGltYWdlIGJhc2UsIHdlCj4gc2Vh
cmNoIGZvciB0aGUgREJHS0RfR0VUX1ZFUlNJT042NCBzdHJ1Y3R1cmUgdHlwZSBpbiAuZGF0YSBz
ZWN0aW9uIHRvCj4gZ2V0IGluZm9ybWF0aW9uIHJlcXVpcmVkIGZvciBoYW5kc2hha2UuCgpUaGFu
a3MgZm9yIHRoZSB1cGRhdGVzLCB0aGlzIGxvb2tzIGdvb2QhCgpSZXZpZXdlZC1ieTogVGltIERl
ZWdhbiA8dGltQHhlbi5vcmc+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
