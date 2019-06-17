Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F39487E8
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2019 17:52:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hctsq-0000jc-Cr; Mon, 17 Jun 2019 15:49:24 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=LqB1=UQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hctso-0000jW-U1
 for xen-devel@lists.xenproject.org; Mon, 17 Jun 2019 15:49:22 +0000
X-Inumbo-ID: 7925d04d-9117-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 7925d04d-9117-11e9-8980-bc764e045a96;
 Mon, 17 Jun 2019 15:49:21 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Mon, 17 Jun 2019 09:49:20 -0600
Message-Id: <5D07B67D0200007800238E1B@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Mon, 17 Jun 2019 09:49:17 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>
References: <20190607092232.83179-1-roger.pau@citrix.com>
 <20190607092232.83179-14-roger.pau@citrix.com>
 <5D07AD770200007800238D9E@prv1-mh.provo.novell.com>
 <fc9bc37b-dc55-ba70-24ab-64e1f168e5c3@citrix.com>
In-Reply-To: <fc9bc37b-dc55-ba70-24ab-64e1f168e5c3@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v3 13/13] print: introduce a format
 specifier for pci_sbdf_t
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Brian Woods <brian.woods@amd.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDE3LjA2LjE5IGF0IDE3OjEyLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMTcvMDYvMjAxOSAxNjoxMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDA3
LjA2LjE5IGF0IDExOjIyLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+Pj4gVGhlIG5l
dyBmb3JtYXQgc3BlY2lmaWVyIGlzICclcHAnLCBhbmQgcHJpbnRzIGEgcGNpX3NiZGZfdCB1c2lu
ZyB0aGUKPj4+IHNlZzpidXM6ZGV2LmZ1bmMgZm9ybWF0LiBSZXBsYWNlIGFsbCBTQkRGcyBwcmlu
dGVkIHVzaW5nCj4+PiAnJTA0eDolMDJ4OiUwMnguJXUnIHRvIHVzZSB0aGUgbmV3IGZvcm1hdCBz
cGVjaWZpZXIuCj4+IFdlbGwsIEkgY29udGludWUgdG8gbm90IGJlIGhhcHB5IGFib3V0IHRoZSB1
c2Ugb2YgJXAgKHJhdGhlciB0aGFuIHRoZQo+PiBwcm9wb3NlZCAlbykgaGVyZS4gSSBkb24ndCBz
dXBwb3NlIHlvdSd2ZSBhY3R1YWxseSB0cmllZCwgYW5kIGl0IGRpZG4ndAo+PiB3b3JrIG91dD8K
PiAKPiBZb3UgY2FuJ3QgdXNlICVvIGZvciByZWFzb25zIEkndmUgYWxyZWFkeSBkZW1vbnN0cmF0
ZWQgbXVsdGlwbGUgdGltZXMKPiBhbHJlYWR5IGZvciB5b3VyIHByZXZpb3VzIHJlcXVlc3RzLgo+
IAo+IE5laXRoZXIgR0NDIG5vciBDbGFuZyB0b2xlcmF0ZSBpdCB3aXRoIC1XZm9ybWF0LgoKWW91
J3ZlIHNhaWQgc28gYmVmb3JlIHdpdGhvdXQgcHJvb2YsIHNpbXBseSBieSBleHRlbmRpbmcgZnJv
bSBwcm9wb3NhbHMKSSBoYWQgbWFkZSBmb3IgJXAgd2hpY2ggaW5kZWVkIHlvdSB3ZXJlIHJpZ2h0
IHdvdWxkIG5vdCBiZSB0b2xlcmF0ZWQKd2l0aCAtV2Zvcm1hdC4gSSBjYW4gb25seSBzdGF0ZSBh
Z2FpbjogSSBjYW5ub3Qgc2VlIHdoeSBjb21waWxlcnMgd291bGQKYmUgdW5oYXBweSBhYm91dCBh
IDMyLWJpdCBpbnQgZ2V0dGluZyBwYXNzZWQgZm9yIGEgJW8gZm9ybWF0IHNwZWNpZmllci4KCkFu
ZCBieSBnb2luZyB0aGlzIHJvdXRlIHdlJ2QgYXZvaWQgYSBmdXR1cmUgY2xhc2ggd2l0aCB3aGF0
ZXZlciBtZWFuaW5nCkxpbnV4IG1heSBhc3NpZ24gdG8gJXBwLiBHcmFudGVkIHRoaXMgYSBtaW5v
ciBhc3BlY3QsIGFzIEkgZG9uJ3QgdGhpbmsKd2Ugc2hvdWxkIHNsYXZpc2hseSBmb2xsb3cgTGlu
dXgnZXMgZXh0ZW5zaW9ucywgYnV0IGFueXdheS4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
