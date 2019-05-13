Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A35F11B73C
	for <lists+xen-devel@lfdr.de>; Mon, 13 May 2019 15:43:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQBBj-0003lH-Un; Mon, 13 May 2019 13:40:19 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rpFc=TN=citrix.com=prvs=0298122e9=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hQBBj-0003lC-1h
 for xen-devel@lists.xenproject.org; Mon, 13 May 2019 13:40:19 +0000
X-Inumbo-ID: a5175eb6-7584-11e9-8980-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id a5175eb6-7584-11e9-8980-bc764e045a96;
 Mon, 13 May 2019 13:40:18 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,465,1549929600"; d="scan'208";a="85387165"
Date: Mon, 13 May 2019 14:40:15 +0100
From: Wei Liu <wei.liu2@citrix.com>
To: Kevin Buckley <kevin.buckley.ecs.vuw.ac.nz@gmail.com>
Message-ID: <20190513134015.GE2798@zion.uk.xensource.com>
References: <CABwOO=dhCrnZpRNpLr7rDrNdSh9GCH=fqq_50+YScWT4BE-xjQ@mail.gmail.com>
 <20190411102843.GE30543@zion.uk.xensource.com>
 <CABwOO=cOxxk7sbscGRzZ1LuiH8JJnCoBJ2d19ZmaSeu5DBi6iw@mail.gmail.com>
 <20190415092358.GM30543@zion.uk.xensource.com>
 <20190415093632.GN30543@zion.uk.xensource.com>
 <CABwOO=cyX0PcuvbfYu1ZyN384604sT2HPAoJR+cknFqWH-e7PQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CABwOO=cyX0PcuvbfYu1ZyN384604sT2HPAoJR+cknFqWH-e7PQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Xen-devel] Xen commit 9b0bc91b3 possibly removed too much info
 from README
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBBcHIgMTYsIDIwMTkgYXQgMDk6MzE6NDFQTSArMDgwMCwgS2V2aW4gQnVja2xleSB3
cm90ZToKPiA+IE9oIHdhaXQsIEkgZG9uJ3QgdGhpbmsgdGhlcmUgaXMgYW55dGhpbmcgdG8gZml4
IHRoZXJlLiBUaG9zZSBzZW50ZW5jZXMKPiA+IGxvb2sgcmVwZXRpdGl2ZSBidXQgdGhleSBkbyBz
YXkgZGlmZmVyZW50IHRoaW5nczogaW4gdG9vbHMgY2FzZSwgaXQgc2F5cwo+ID4gInJlcG9zIHdp
bGwgYmUgY2xvbmVkIjsgaW4gc3R1YmRvbSBjYXNlLCBpdCBzYXlzICJleHRlcm5hbCBwYWNrYWdl
cwo+ID4gd2lsbCBiZSBkb3dubG9hZGVkLiBTbyB0aGV5IGRvIHJlZmxlY3QgY29ycmVjdGx5IHdo
YXQgd2lsbCBoYXBwZW4uCj4gPgo+IAo+IExldCBtZSBuYXJyb3cgdGhpbmdzIGRvd24gYSBiaXQg
ZnVydGhlciB0byBoaWdobGlnaHQgdGhlIGR1cGxpY2F0aW9uCj4gCj4gLS0tLTg8LS0tLS0tLS04
PC0tLS0tLS0tODwtLS0tLS0tLTg8LS0tLS0tLS04PC0tLS0tLS0tODwtLS0tLS0tLTg8LS0tLS0t
LS04PC0tLS0KPiBEdXJpbmcgdG9vbHMgYnVpbGQgZXh0ZXJuYWwgcmVwb3Mgd2lsbCBiZSBjbG9u
ZWQgaW50byB0aGUgc291cmNlIHRyZWUuICAgIDw9PT0gMQo+IFRoaXMgdmFyaWFibGUgY2FuIGJl
IHVzZWQgdG8gcG9pbnQgdG8gYSBkaWZmZXJlbnQgZ2l0IGJpbmFyeSB0byBiZSB1c2VkLgo+IEdJ
VD0KPiAKPiBEdXJpbmcgdG9vbHMgYnVpbGQgZXh0ZXJuYWwgcmVwb3Mgd2lsbCBiZSBjbG9uZWQg
aW50byB0aGUgc291cmNlIHRyZWUuICAgIDw9PT0gMgo+IER1cmluZyBzdHViZG9tIGJ1aWxkIGV4
dGVybmFsIHBhY2thZ2VzIHdpbGwgYmUgZG93bmxvYWRlZCBpbnRvIHRoZQo+IHNvdXJjZSB0cmVl
LiBUaGVzZSB2YXJpYWJsZXMgY2FuIGJlIHVzZWQgdG8gcG9pbnQgdG8gYSBkaWZmZXJlbnQKPiBs
b2NhdGlvbnMuCj4gIFhFTl9FWFRGSUxFU19VUkw9Cj4gT1ZNRl9VUFNUUkVBTV9VUkw9Cj4gLS0t
LTg8LS0tLS0tLS04PC0tLS0tLS0tODwtLS0tLS0tLTg8LS0tLS0tLS04PC0tLS0tLS0tODwtLS0t
LS0tLTg8LS0tLS0tLS04PC0tLS0KPiAKPiBIb3BlIHRoYXQncyBjbGVhcmVyID8KClllcyBpdCBp
cyBjbGVhcmVyLiBUaGFua3MuCgpXZWkuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
