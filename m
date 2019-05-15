Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6331F11F
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2019 13:54:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQsQo-0005NH-Se; Wed, 15 May 2019 11:50:46 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=LpR9=TP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hQsQn-0005NC-Rc
 for xen-devel@lists.xenproject.org; Wed, 15 May 2019 11:50:45 +0000
X-Inumbo-ID: ab6d3456-7707-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id ab6d3456-7707-11e9-8980-bc764e045a96;
 Wed, 15 May 2019 11:50:44 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Wed, 15 May 2019 05:50:43 -0600
Message-Id: <5CDBFD12020000780022F37C@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Wed, 15 May 2019 05:50:42 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>,
 "xen-devel" <xen-devel@lists.xenproject.org>
References: <5CDBCC89020000780022F1DE@prv1-mh.provo.novell.com>
 <ecde9471-17e5-61b8-1c61-67cac1d54fc4@citrix.com>
In-Reply-To: <ecde9471-17e5-61b8-1c61-67cac1d54fc4@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH] x86emul: add support for missing {,
 V}PMADDWD insns
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
Cc: Wei Liu <wei.liu2@citrix.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDE1LjA1LjE5IGF0IDEyOjE3LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMTUvMDUvMjAxOSAwOToyMywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IC0tLSBhL3hl
bi9hcmNoL3g4Ni94ODZfZW11bGF0ZS94ODZfZW11bGF0ZS5jCj4+ICsrKyBiL3hlbi9hcmNoL3g4
Ni94ODZfZW11bGF0ZS94ODZfZW11bGF0ZS5jCj4+IEBAIC02NjI0LDYgKzY2MjQsOCBAQCB4ODZf
ZW11bGF0ZSgKPj4gICAgICBjYXNlIFg4NkVNVUxfT1BDX1ZFWF82NigweDBmLCAweGYzKTogLyog
dnBzbGxxIHhtbS9tMTI4LHt4LHl9bW0se3gseX1tbSAqLwo+PiAgICAgIGNhc2UgWDg2RU1VTF9P
UENfNjYoMHgwZiwgMHhmNCk6ICAgICAvKiBwbXVsdWRxIHhtbS9tMTI4LHhtbSAqLwo+PiAgICAg
IGNhc2UgWDg2RU1VTF9PUENfVkVYXzY2KDB4MGYsIDB4ZjQpOiAvKiB2cG11bHVkcSB7eCx5fW1t
L21lbSx7eCx5fW1tLHt4LHl9bW0gKi8KPj4gKyAgICBDQVNFX1NJTURfUEFDS0VEX0lOVCgweDBm
LCAweGY1KTogICAgLyogcG1hZGR3ZCB7LHh9bW0vbWVtLHsseH1tbSAqLwo+PiArICAgIGNhc2Ug
WDg2RU1VTF9PUENfVkVYXzY2KDB4MGYsIDB4ZjUpOiAvKiB2cG1hZGR3ZCB7eCx5fW1tL21lbSx7
eCx5fW1tLHt4LHl9bW0gKi8KPiAKPiBOb3RoaW5nIG9uIHRoaXMgcGF0aCBjaGVja3MgZm9yIFNT
U0UzLCBBRkFJQ1QuCgpPZiBjb3Vyc2Ugbm90IC0gdGhlIGluc24gZmlyc3QgZ290IGludHJvZHVj
ZWQgd2l0aCBNTVgsIHRoZW4KcHJvbW90ZWQgd2l0aCBTU0UyIGFuZCBhZ2FpbiB3aXRoIEFWWCBh
bmQgQVZYMi4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
