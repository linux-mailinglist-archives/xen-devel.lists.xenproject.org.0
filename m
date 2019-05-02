Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53E1D11A50
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2019 15:35:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hMBp0-00059J-Ld; Thu, 02 May 2019 13:32:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=oUxd=TC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hMBoz-00059C-BD
 for xen-devel@lists.xenproject.org; Thu, 02 May 2019 13:32:21 +0000
X-Inumbo-ID: aec1ed3e-6cde-11e9-9946-1b7c0d99e16a
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id aec1ed3e-6cde-11e9-9946-1b7c0d99e16a;
 Thu, 02 May 2019 13:32:10 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 02 May 2019 07:32:07 -0600
Message-Id: <5CCAF156020000780022B438@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Thu, 02 May 2019 07:32:06 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Razvan Cojocaru" <rcojocaru@bitdefender.com>,
 "Tamas K Lengyel" <tamas@tklengyel.com>
References: <20190501235731.1486-1-tamas@tklengyel.com>
 <59f57a48-b1da-7362-4024-c890cf357bf0@bitdefender.com>
 <5CCAB0FC020000780022B12F@prv1-mh.provo.novell.com>
 <CABfawh=Kmsj=y1XcV8fiqbCZ6_bDp2-E+OoQHr_+_NCAy4OeSw@mail.gmail.com>
 <e526694c-2ab0-e740-0ef6-fa643f6c890f@bitdefender.com>
In-Reply-To: <e526694c-2ab0-e740-0ef6-fa643f6c890f@bitdefender.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH] x86/vm_event: add gdtr_base to the vm_event
 structure
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDAyLjA1LjE5IGF0IDE1OjIzLCA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4gd3Jv
dGU6Cj4gTXkgcG9pbnQgaXMsIGF0IHRoZSBtb21lbnQgaXQncyBmaW5lIHRvIHNraXAgaWR0ciBp
ZiBpdCdzIG5vdCByZXF1aXJlZCAKPiBieSBKYW4sIGJ1dCBpZiB3ZSBkbyBhZGQgZWl0aGVyIHRo
ZW4gbGV0J3MgcGxlYXNlIGFkZCBib3RoIF9iYXNlIGFuZCBfbGltaXQuCgpObywgaXQncyBub3Qg
YSByZXF1aXJlbWVudCBJIG1lYW4gdG8gcHV0IHVwIChhbmQgSSdtIG5vdCBpbiB0aGUKcG9zaXRp
b24gdG8gZWl0aGVyLCBhcyBJJ20gbm90IHRoZSBtYWludGFpbmVyIG9mIHRoZSBpbnRlcmZhY2Up
LgpJdCBqdXN0IHNlZW1zIGluY29uc2lzdGVudCB0byBtZSB0byBoYXZlIG9uZSBidXQgbm90IHRo
ZSBvdGhlci4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
