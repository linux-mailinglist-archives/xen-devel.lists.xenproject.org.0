Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FBAA15BB1D
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2020 10:04:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j2AOL-0000hS-Gg; Thu, 13 Feb 2020 09:02:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=QmQS=4B=xen.org=tim@srs-us1.protection.inumbo.net>)
 id 1j2AOJ-0000h8-LZ
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2020 09:02:35 +0000
X-Inumbo-ID: 9318c0c4-4e3f-11ea-ade5-bc764e2007e4
Received: from deinos.phlegethon.org (unknown [2001:41d0:8:b1d7::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9318c0c4-4e3f-11ea-ade5-bc764e2007e4;
 Thu, 13 Feb 2020 09:02:35 +0000 (UTC)
Received: from tjd by deinos.phlegethon.org with local (Exim 4.92.3 (FreeBSD))
 (envelope-from <tim@xen.org>)
 id 1j2AOI-0002fY-CK; Thu, 13 Feb 2020 09:02:34 +0000
Date: Thu, 13 Feb 2020 09:02:34 +0000
From: Tim Deegan <tim@xen.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Message-ID: <20200213090234.GB10200@deinos.phlegethon.org>
References: <20200210172829.43604-1-roger.pau@citrix.com>
 <20200210172829.43604-5-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200210172829.43604-5-roger.pau@citrix.com>
User-Agent: Mutt/1.11.1 (2018-12-01)
X-SA-Known-Good: Yes
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: tim@xen.org
X-SA-Exim-Scanned: No (on deinos.phlegethon.org);
 SAEximRunCond expanded to false
Subject: Re: [Xen-devel] [PATCH v4 4/7] x86/tlb: introduce a flush guests
 TLB flag
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>, xen-devel@lists.xenproject.org,
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QXQgMTg6MjggKzAxMDAgb24gMTAgRmViICgxNTgxMzU5MzA2KSwgUm9nZXIgUGF1IE1vbm5lIHdy
b3RlOgo+IEludHJvZHVjZSBhIHNwZWNpZmljIGZsYWcgdG8gcmVxdWVzdCBhIEhWTSBndWVzdCBU
TEIgZmx1c2gsIHdoaWNoIGlzCj4gYW4gQVNJRC9WUElEIHRpY2tsZSB0aGF0IGZvcmNlcyBhIGxp
bmVhciBUTEIgZmx1c2ggZm9yIGFsbCBIVk0gZ3Vlc3RzLgo+IAo+IFRoaXMgd2FzIHByZXZpb3Vz
bHkgdW5jb25kaXRpb25hbGx5IGRvbmUgaW4gZWFjaCBwcmVfZmx1c2ggY2FsbCwgYnV0Cj4gdGhh
dCdzIG5vdCByZXF1aXJlZDogSFZNIGd1ZXN0cyBub3QgdXNpbmcgc2hhZG93IGRvbid0IHJlcXVp
cmUgbGluZWFyCj4gVExCIGZsdXNoZXMgYXMgWGVuIGRvZXNuJ3QgbW9kaWZ5IHRoZSBndWVzdCBw
YWdlIHRhYmxlcyBpbiB0aGF0IGNhc2UKPiAoaWU6IHdoZW4gdXNpbmcgSEFQKS4KPiAKPiBNb2Rp
ZnkgYWxsIHNoYWRvdyBjb2RlIFRMQiBmbHVzaGVzIHRvIGFsc28gZmx1c2ggdGhlIGd1ZXN0IFRM
QiwgaW4KPiBvcmRlciB0byBrZWVwIHRoZSBwcmV2aW91cyBiZWhhdmlvci4gSSBoYXZlbid0IGxv
b2tlZCBhdCBlYWNoIHNwZWNpZmljCj4gc2hhZG93IGNvZGUgVExCIGZsdXNoIGluIG9yZGVyIHRv
IGZpZ3VyZSBvdXQgd2hldGhlciBpdCBhY3R1YWxseQo+IHJlcXVpcmVzIGEgZ3Vlc3QgVExCIGZs
dXNoIG9yIG5vdCwgc28gdGhlcmUgbWlnaHQgYmUgcm9vbSBmb3IKPiBpbXByb3ZlbWVudCBpbiB0
aGF0IHJlZ2FyZC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5w
YXVAY2l0cml4LmNvbT4KPiBSZXZpZXdlZC1ieTogV2VpIExpdSA8d2xAeGVuLm9yZz4KCkFja2Vk
LWJ5OiAgVGltIERlZWdhbiA8dGltQHhlbi5vcmc+CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
