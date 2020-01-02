Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B980812E9C5
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jan 2020 19:11:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1in4uu-0002dQ-Bu; Thu, 02 Jan 2020 18:09:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DL29=2X=freebsd.org=royger@srs-us1.protection.inumbo.net>)
 id 1in4ut-0002dL-5Q
 for xen-devel@lists.xenproject.org; Thu, 02 Jan 2020 18:09:51 +0000
X-Inumbo-ID: 115ddd78-2d8b-11ea-a3a8-12813bfff9fa
Received: from mx2.freebsd.org (unknown [96.47.72.81])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 115ddd78-2d8b-11ea-a3a8-12813bfff9fa;
 Thu, 02 Jan 2020 18:09:50 +0000 (UTC)
Received: from mx1.freebsd.org (mx1.freebsd.org [96.47.72.80])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mx1.freebsd.org",
 Issuer "Let's Encrypt Authority X3" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id D55847E694;
 Thu,  2 Jan 2020 18:09:49 +0000 (UTC)
 (envelope-from royger@FreeBSD.org)
Received: from smtp.freebsd.org (smtp.freebsd.org
 [IPv6:2610:1c1:1:606c::24b:4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "smtp.freebsd.org",
 Issuer "Let's Encrypt Authority X3" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id 47pbfP4Y41z3FXX;
 Thu,  2 Jan 2020 18:09:49 +0000 (UTC)
 (envelope-from royger@FreeBSD.org)
Received: from localhost (unknown [93.176.176.248])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate) (Authenticated sender: royger)
 by smtp.freebsd.org (Postfix) with ESMTPSA id BFD75B6A4;
 Thu,  2 Jan 2020 18:09:48 +0000 (UTC)
 (envelope-from royger@FreeBSD.org)
Date: Thu, 2 Jan 2020 19:09:36 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <royger@FreeBSD.org>
To: Ian Jackson <ian.jackson@eu.citrix.com>
Message-ID: <20200102180936.GL11756@Air-de-Roger>
References: <20200102180433.25688-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200102180433.25688-1-ian.jackson@eu.citrix.com>
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
aG91bGQgdXBkYXRlIG9zc3Rlc3QgdG8gNC4xNC4KPiAKPiBDQzogUm9nZXIgUGF1IE1vbm7DqSA8
cm95Z2VyQEZyZWVCU0Qub3JnPgo+IENDOiBLb25yYWQgUnplc3p1dGVrIFdpbGsgPGtvbnJhZC53
aWxrQG9yYWNsZS5jb20+Cj4gQ0M6IEJvcmlzIE9zdHJvdnNreSA8Ym9yaXMub3N0cm92c2t5QG9y
YWNsZS5jb20+Cj4gQ0M6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KPiBDQzogV2Vp
IExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KPiBDQzogUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJh
bnRAY2l0cml4LmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25A
ZXUuY2l0cml4LmNvbT4KCkFja2VkLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0
cml4LmNvbT4KCldpdGggdGhpcyB3ZSBjb3VsZCBzdGFydCBhZGRpbmcgcHZoIGRvbTAgam9icyA6
KQoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
