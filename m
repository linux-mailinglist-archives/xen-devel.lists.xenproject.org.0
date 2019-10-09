Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C8AD090D
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2019 10:04:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iI6uF-00058p-2i; Wed, 09 Oct 2019 08:01:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=QBY0=YC=durham.ac.uk=m.a.young@srs-us1.protection.inumbo.net>)
 id 1iI6uD-00058k-Ok
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2019 08:01:09 +0000
X-Inumbo-ID: f2e8ea4e-ea6a-11e9-8c93-bc764e2007e4
Received: from hermes2.dur.ac.uk (unknown [129.234.7.139])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f2e8ea4e-ea6a-11e9-8c93-bc764e2007e4;
 Wed, 09 Oct 2019 08:01:08 +0000 (UTC)
Received: from smtphost4.dur.ac.uk (smtphost4.dur.ac.uk [129.234.7.146])
 by hermes2.dur.ac.uk (8.14.4/8.14.4) with ESMTP id x9980VlB030052;
 Wed, 9 Oct 2019 09:00:35 +0100
Received: from algedi.dur.ac.uk (algedi.dur.ac.uk [129.234.2.28])
 by smtphost4.dur.ac.uk (8.14.4/8.14.4) with ESMTP id x9980LXA031818
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Wed, 9 Oct 2019 09:00:22 +0100
Received: by algedi.dur.ac.uk (Postfix, from userid 2742)
 id AC76F284027; Wed,  9 Oct 2019 09:00:16 +0100 (BST)
Received: from localhost (localhost [127.0.0.1])
 by algedi.dur.ac.uk (Postfix) with ESMTP id 9E2FE282C68;
 Wed,  9 Oct 2019 09:00:16 +0100 (BST)
Date: Wed, 9 Oct 2019 09:00:16 +0100 (BST)
From: M A Young <m.a.young@durham.ac.uk>
To: Steven Haigh <netwiz@crc.id.au>
In-Reply-To: <1570594496.2508.0@crc.id.au>
Message-ID: <alpine.LFD.2.21.1910090855001.4406@algedi.dur.ac.uk>
References: <1570594496.2508.0@crc.id.au>
User-Agent: Alpine 2.21 (LFD 202 2017-01-01)
MIME-Version: 1.0
X-DurhamAcUk-MailScanner: Found to be clean, Found to be clean
X-DurhamAcUk-MailScanner-ID: x9980VlB030052
Subject: Re: [Xen-devel] /sys/hypervisor entries for Xen (Domain-0, PV,
 PVH and HVM)
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
Cc: xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCA5IE9jdCAyMDE5LCBTdGV2ZW4gSGFpZ2ggd3JvdGU6Cgo+IEhpIGFsbCwKPiAKPiBJ
J20gd29ya2luZyBvbiBmaXhpbmcgdXAgdGhlIGdydWIgcGFja2FnZXMgZm9yIEZlZG9yYSBpbiBk
ZWR1Y2luZyB0aGUgbmV3IEJMUwo+IGxvZ2ljIGluIEZlZG9yYSBhbmQgZGlzYWJsaW5nIGl0IGlu
IG5vbi1jb21wYXRpYmxlIGVudmlyb25tZW50cy4KPiAKPiBCWiBSZXBvcnQ6Cj4gaHR0cHM6Ly9i
dWd6aWxsYS5yZWRoYXQuY29tL3Nob3dfYnVnLmNnaT9pZD0xNzAzNzAwCj4gCj4gQ3VycmVudGx5
LCBpdCBzZWVtcyB0aGF0IHdlIGNhbiBkZWR1Y2UgdGhlIGZvbGxvd2luZyB0d28gc2NlbmFyaW9z
Ogo+IAo+IGluIC9zeXMvaHlwZXJ2aXNvcjoKPiAKPiAxKSB0eXBlID09IHhlbiAmJiB1dWlkID09
IGFsbCB6ZXJvcywgdGhlbiB0aGlzIGlzIEJMUyBzYWZlICh0aGUgRG9tYWluLTApLgo+IDIpIHR5
cGUgPT0geGVuICYmIHV1aWQgIT0gYWxsIHplcm9zLCB0aGVuIHRoaXMgaXMgQkxTICp1bnNhZmUq
IChjb3ZlcnMgUFYsIEhWTQo+IGFuZCBQVkggZ3Vlc3RzKS4KPiAKPiBJcyB0aGVyZSBhbnkgb3Ro
ZXIgdmFyaWFibGVzIHRoYXQgY29tZSBpbnRvIGVmZmVjdCB0aGF0IGNvdWxkIGNhdXNlIGEKPiB2
YXJpYXRpb24gaW4gdGhlIGFib3ZlIGNoZWNrcyBhcyB0byBlbmFibGUgb3IgZGlzYWJsZSBCTFM/
Cj4gCj4gUmlnaHQgbm93LCBJJ20gcHJvcG9zaW5nIHRoYXQgd2UgdHJ5IHRvIGRpc2FibGUgdGhl
IG5ldyBCTFMgYmVoYXZpb3VyIGluCj4gRmVkb3JhIGZvciBQViwgSFZNIGFuZCBQVkggZ3Vlc3Rz
IC0gYXMgcHlncnViIGlzIG5vdCB1cCB0byB0aGUgdGFzayBvZiBib290aW5nCj4gdGhlbS4gV2Ug
aW5jbHVkZWQgSFZNIGFzIGl0IG1heSBiZSBjb21tb24gZm9yIHVzZXJzIHRvIHN3aXRjaCBiZXR3
ZWVuIEhWTSBhbmQKPiBQVkggY29uZmlndXJhdGlvbnMgZm9yIHRoZSBzYW1lIGluc3RhbGxlZCBW
TS4KCkkgZG8gaGF2ZSBhIGxvbmcgdGVybSBwbGFuIHRvIHRyeSB0byBnZXQgcHlncnViIHRvIGhh
bmRsZSBCTFMsIHRob3VnaCBJIApkb24ndCBleHBlY3QgdG8gaGF2ZSBpdCB3b3JraW5nIHNvb24u
CgoJTWljaGFlbCBZb3VuZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
