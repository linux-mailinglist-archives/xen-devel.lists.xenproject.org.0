Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E8F158424
	for <lists+xen-devel@lfdr.de>; Mon, 10 Feb 2020 21:11:42 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j1FNV-0004w8-GI; Mon, 10 Feb 2020 20:09:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=OCy1=36=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1j1FNU-0004vx-O5
 for xen-devel@lists.xenproject.org; Mon, 10 Feb 2020 20:09:56 +0000
X-Inumbo-ID: 4e7f26ba-4c41-11ea-852a-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4e7f26ba-4c41-11ea-852a-bc764e2007e4;
 Mon, 10 Feb 2020 20:09:56 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1j1FNT-0005KK-Q6; Mon, 10 Feb 2020 20:09:55 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1j1FNT-0007b0-HS; Mon, 10 Feb 2020 20:09:55 +0000
Date: Mon, 10 Feb 2020 20:09:52 +0000
From: Wei Liu <wl@xen.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Message-ID: <20200210200952.cnrwkkzdt4guse7l@debian>
References: <20200210172829.43604-1-roger.pau@citrix.com>
 <20200210172829.43604-6-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200210172829.43604-6-roger.pau@citrix.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH v4 5/7] x86/tlb: allow disabling the TLB
 clock
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBGZWIgMTAsIDIwMjAgYXQgMDY6Mjg6MjdQTSArMDEwMCwgUm9nZXIgUGF1IE1vbm5l
IHdyb3RlOgo+IFRoZSBUTEIgY2xvY2sgaXMgaGVscGZ1bCB3aGVuIHJ1bm5pbmcgWGVuIG9uIGJh
cmUgbWV0YWwgYmVjYXVzZSB3aGVuCj4gZG9pbmcgYSBUTEIgZmx1c2ggZWFjaCBDUFUgaXMgSVBJ
J2VkIGFuZCBjYW4ga2VlcCBhIHRpbWVzdGFtcCBvZiB0aGUKPiBsYXN0IGZsdXNoLgo+IAo+IFRo
aXMgaXMgbm90IHRoZSBjYXNlIGhvd2V2ZXIgd2hlbiBYZW4gaXMgcnVubmluZyB2aXJ0dWFsaXpl
ZCwgYW5kIHRoZQo+IHVuZGVybHlpbmcgaHlwZXJ2aXNvciBwcm92aWRlcyBtZWNoYW5pc20gdG8g
YXNzaXN0IGluIHBlcmZvcm1pbmcgVExCCj4gZmx1c2hlczogWGVuIGl0c2VsZiBmb3IgZXhhbXBs
ZSBvZmZlcnMgYSBIVk1PUF9mbHVzaF90bGJzIGh5cGVyY2FsbCBpbgo+IG9yZGVyIHRvIHBlcmZv
cm0gYSBUTEIgZmx1c2ggd2l0aG91dCBoYXZpbmcgdG8gSVBJIGVhY2ggQ1BVLiBXaGVuCj4gdXNp
bmcgc3VjaCBtZWNoYW5pc21zIGl0J3Mgbm8gbG9uZ2VyIHBvc3NpYmxlIHRvIGtlZXAgYSB0aW1l
c3RhbXAgb2YKPiB0aGUgZmx1c2hlcyBvbiBlYWNoIENQVSwgYXMgdGhleSBhcmUgcGVyZm9ybWVk
IGJ5IHRoZSB1bmRlcmx5aW5nCj4gaHlwZXJ2aXNvci4KPiAKPiBPZmZlciBhIGJvb2xlYW4gaW4g
b3JkZXIgdG8gc2lnbmFsIFhlbiB0aGF0IHRoZSB0aW1lc3RhbXBlZCBUTEIKPiBzaG91bGRuJ3Qg
YmUgdXNlZC4gVGhpcyBhdm9pZHMga2VlcGluZyB0aGUgdGltZXN0YW1wcyBvZiB0aGUgZmx1c2hl
cywKPiBhbmQgYWxzbyBmb3JjZXMgTkVFRF9GTFVTSCB0byBhbHdheXMgcmV0dXJuIHRydWUuCj4g
Cj4gTm8gZnVuY3Rpb25hbCBjaGFuZ2UgaW50ZW5kZWQsIGFzIHRoaXMgY2hhbmdlIGRvZXNuJ3Qg
aW50cm9kdWNlIGFueQo+IHVzZXIgdGhhdCBkaXNhYmxlcyB0aGUgdGltZXN0YW1wZWQgVExCLgo+
IAo+IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29t
PgoKUmV2aWV3ZWQtYnk6IFdlaSBMaXUgPHdsQHhlbi5vcmc+CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
