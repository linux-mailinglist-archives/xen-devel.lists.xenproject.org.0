Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9671412F6A4
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jan 2020 11:14:23 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1inJun-0004uz-Ix; Fri, 03 Jan 2020 10:10:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=0Fet=2Y=iki.fi=pasik@srs-us1.protection.inumbo.net>)
 id 1inJum-0004uu-E1
 for xen-devel@lists.xenproject.org; Fri, 03 Jan 2020 10:10:44 +0000
X-Inumbo-ID: 4793de66-2e11-11ea-88e7-bc764e2007e4
Received: from fgw20-4.mail.saunalahti.fi (unknown [62.142.5.107])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4793de66-2e11-11ea-88e7-bc764e2007e4;
 Fri, 03 Jan 2020 10:10:34 +0000 (UTC)
Received: from ydin.reaktio.net (reaktio.net [85.76.255.15])
 by fgw20.mail.saunalahti.fi (Halon) with ESMTP
 id 46a450d2-2e11-11ea-826b-005056bd6ce9;
 Fri, 03 Jan 2020 12:10:32 +0200 (EET)
Received: by ydin.reaktio.net (Postfix, from userid 1001)
 id 3335D36C0F6; Fri,  3 Jan 2020 12:10:32 +0200 (EET)
Date: Fri, 3 Jan 2020 12:10:32 +0200
From: Pasi =?iso-8859-1?Q?K=E4rkk=E4inen?= <pasik@iki.fi>
To: Ian Jackson <ian.jackson@eu.citrix.com>
Message-ID: <20200103101031.GB21578@reaktio.net>
References: <20200102180433.25688-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200102180433.25688-1-ian.jackson@eu.citrix.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [Xen-devel] [OSSTEST PATCH] Switch to linux-4.19 by default
 (from 4.14)
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
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <royger@FreeBSD.org>,
 Paul Durrant <paul.durrant@citrix.com>, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBKYW4gMDIsIDIwMjAgYXQgMDY6MDQ6MzNQTSArMDAwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gVGhpcyBhZmZlY3RzIG9ubHkgeDg2IGFuZCBvbmx5IHRoZSBicmFuY2hlcyB0aGF0IGFy
ZW4ndCBsaW51eC0qLCBzaW5jZQo+IG9idmlvdXNseSB0aGUgbGF0dGVyIHVzZSB3aGF0ZXZlciB2
ZXJzaW9uIHRoZXkgYXJlIHVzaW5nLgo+IAo+IEkgY29tcGFyZWQgdGhlIG1vc3QgcmVjZW50IGxp
bnV4LTQuMTkgcmVzdWx0cyB3aXRoIHRoZSBtb3N0IHJlY2VudAo+IGxpbnV4LTQuMTQgb25lcywg
YW5kIHRoZXJlIHdhcyBvbmx5IG9uZSBuZXcgZmFpbHVyZSAoaW4gMTQzODQxKToKPiAgIHRlc3Qt
YW1kNjQtaTM4Ni1xZW11dS1yaGVsNmh2bS1pbnRlbCAxMiBndWVzdC1zdGFydC9yZWRoYXQucmVw
ZWF0IGZhaWwgUkVHUi4gdnMuIDE0MzkxMQo+IAo+IFRoaXMgc3RlcCBoYXMgZmFpbGVkIHR3aWNl
IGluIHRoZSB3ZWItdmlzaWJsZSBoaXN0b3J5IG9mIHRoaXMgam9iIG9uCj4gNC4xOTsgYW5kIG9u
Y2UgcmVjZW50bHkgaW4gNC4xNC4gIEJlY2F1c2Ugb2YgdGhlIGxvdyB1cGRhdGUgcmF0ZSBvZgo+
IHRoZXNlIHRyZWVzIG5vd2FkYXlzLCB0aGVzZSB0ZXN0cyBhcmUgYSB3aGlsZSBhZ28gYW5kIHdl
IGRvbid0IGhhdmUKPiB0aGUgbG9ncyBhbnkgbW9yZS4KPiAKPiBJIHRoaW5rIGdpdmVuIHRoYXQg
aXQncyBhbHJlYWR5IG5vdCBwZXJmZWN0IHRoaXMgaXMgbm90IGEgYmxvY2tlciBhbmQKPiB3ZSBz
aG91bGQgdXBkYXRlIG9zc3Rlc3QgdG8gNC4xNC4KPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgXl5eXgoKSnVzdCBhIHNtYWxsIG5vdGU6IHR5cG8/IFNob3VsZG4ndCB0aGF0IGJlIDQuMTkg
PwoKCi0tIFBhc2kKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
