Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B1D25E96
	for <lists+xen-devel@lfdr.de>; Wed, 22 May 2019 09:14:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hTLPs-0002cX-NN; Wed, 22 May 2019 07:12:00 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=3DNt=TW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hTLPq-0002cS-OA
 for xen-devel@lists.xenproject.org; Wed, 22 May 2019 07:11:58 +0000
X-Inumbo-ID: e20f7008-7c60-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id e20f7008-7c60-11e9-8980-bc764e045a96;
 Wed, 22 May 2019 07:11:56 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Wed, 22 May 2019 01:11:55 -0600
Message-Id: <5CE4F63A0200007800231313@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Wed, 22 May 2019 01:11:54 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "xen-devel" <xen-devel@lists.xenproject.org>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [Xen-devel] libxl assertion failure when creating any kind of guest
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
Cc: Ian Jackson <Ian.Jackson@eu.citrix.com>, Olaf Hering <olaf@aepfle.de>,
 Wei Liu <wei.liu2@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QWxsLAoKYW0gSSB0aGUgb25seSBvbmUgdG8gc2VlCgp4bDogbGlieGwuYzozMzk6IGxpYnhsX2Rl
ZmJvb2xfdmFsOiBBc3NlcnRpb24gYCFsaWJ4bF9kZWZib29sX2lzX2RlZmF1bHQoZGIpJyBmYWls
ZWQuCgpmb3IgYW55IGtpbmQgb2YgKHg4NikgZ3Vlc3QgYmVpbmcgY3JlYXRlZCwgaW5jbHVkaW5n
IHNpbXBsZSBYVEYgb25lcz8KSSBoYXZlbid0IHRha2VuIGEgY2xvc2VyIGxvb2sgYXQgdGhlIGNv
ZGUgeWV0LCBidXQgd2l0aCB0aGlzIEkgd29uZGVyCmhvdyBldmVuIGEgc21va2UgcHVzaCBjb3Vs
ZCBoYXZlIG9jY3VycmVkLiBJJ3ZlIHJlLWJhc2VkIG15IHRyZWUKeWVzdGVyZGF5ICh0byA3NmJh
OGIxNCwgd2hpY2ggbWVhbnMgaW4gcGFydGljdWxhciB0aGF0IDI3OGM2NDUxOWMKWyJsaWJ4bDog
Zml4IGxpYnhsX2RvbWFpbl9uZWVkX21lbW9yeSBhZnRlciA4OTk0MzNmMTQ5ZCJdIGlzIGluIHBs
YWNlKQphZnRlciBhIGNvdXBsZSBvZiB3ZWVrcyBvZiBub3QgaGF2aW5nIGZvdW5kIHRoZSB0aW1l
IHRvIGRvIHNvLCBzbyB0aGUKcmFuZ2Ugb2YgcG9zc2libGUgY2FuZGlkYXRlIGNvbW1pdHMgaXMg
cmF0aGVyIGxvbmcuIEluIGEgbWFpbCBvbiB0aGUKMTZ0aCBKw7xyZ2VuIGhhZCBwb2ludGVkIG91
dCB0aGF0IDM4MDJlY2JhYTkgY2F1c2VzIHRoaXMKYXNzZXJ0aW9uIHRvIHRyaWdnZXIgX2lmXyBh
bm90aGVyIGFzc2VydGlvbiB0aGlzIGNvbW1pdCBhZGRlZCBnZXRzCnJlbW92ZWQgYWdhaW4sIGJ1
dCB0aGF0IGFzc2VydCgpIGlzIHN0aWxsIGluIHBsYWNlIGFuZCBkaWQgbm90IHRyaWdnZXIsCnNv
IEkgYXNzdW1lIHRoZSB0d28gaXNzdWVzIGFyZSBtYXliZSByZWxhdGVkLCBidXQgbm90IGlkZW50
aWNhbC4KV2hpY2ggYWdhaW4gbGVhdmVzIDg5OTQzM2YxNDkgYXMgdGhlIHByaW1hcnkgc3VzcGVj
dC4KCkkndmUgbm90IGJlZW4gYWJsZSB0byBmaW5kIGFueSBvdGhlciByZWNlbnQgbWVudGlvbiBv
ZiBzYWlkIGFzc2VydCgpCnRvIHRyaWdnZXIuIFRoaXMgaXMgdGhlIGNhbGwgc3RhY2ssIGluIGNh
c2UgaXQgaGVscHM6CgojMCAgMHgwMDAwN2ZmZmY2ZjY3NmQ1IGluIHJhaXNlICgpIGZyb20gL2xp
YjY0L2xpYmMuc28uNgojMSAgMHgwMDAwN2ZmZmY2ZjY4Y2IxIGluIGFib3J0ICgpIGZyb20gL2xp
YjY0L2xpYmMuc28uNgojMiAgMHgwMDAwN2ZmZmY2ZjYwNWEwIGluIF9fYXNzZXJ0X2ZhaWwgKCkg
ZnJvbSAvbGliNjQvbGliYy5zby42CiMzICAweDAwMDA3ZmZmZjc4ZWMxMzIgaW4gbGlieGxfZGVm
Ym9vbF92YWwgKGRiPS4uLikgYXQgbGlieGwuYzozMzkKIzQgIDB4MDAwMDdmZmZmNzhlZGQ0YSBp
biBsaWJ4bF9fZG9tYWluX2J1aWxkX2luZm9fc2V0ZGVmYXVsdCAoZ2M9MHg3ZmZmZmZmZmRlZTAs
IGJfaW5mbz0weDdmZmZmZmZmZGI4MCkKICAgIGF0IGxpYnhsX2NyZWF0ZS5jOjE0MwojNSAgMHgw
MDAwN2ZmZmY3OTQzZTVmIGluIGxpYnhsX2RvbWFpbl9uZWVkX21lbW9yeSAoY3R4PTB4NjQxMDUw
LCBiX2luZm9faW49MHg3ZmZmZmZmZmUwYjgsIG5lZWRfbWVta2I9MHg3ZmZmZmZmZmRmNDApCiAg
ICBhdCBsaWJ4bF9tZW0uYzo0NzgKIzYgIDB4MDAwMDAwMDAwMDQyNWUzYyBpbiBmcmVlbWVtIChk
b21pZD00Mjk0OTY3Mjk1LCBiX2luZm89MHg3ZmZmZmZmZmUwYjgpIGF0IHhsX3ZtY29udHJvbC5j
OjMyNQojNyAgMHgwMDAwMDAwMDAwNDI3NGU3IGluIGNyZWF0ZV9kb21haW4gKGRvbV9pbmZvPTB4
N2ZmZmZmZmZlNjMwKSBhdCB4bF92bWNvbnRyb2wuYzo4ODEKIzggIDB4MDAwMDAwMDAwMDQyODM2
NyBpbiBtYWluX2NyZWF0ZSAoYXJnYz0zLCBhcmd2PTB4N2ZmZmZmZmZlODEwKSBhdCB4bF92bWNv
bnRyb2wuYzoxMjQyCiM5ICAweDAwMDAwMDAwMDA0MGIzNDQgaW4gbWFpbiAoYXJnYz0zLCBhcmd2
PTB4N2ZmZmZmZmZlODEwKSBhdCB4bC5jOjQxMwoKSmFuCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
