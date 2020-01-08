Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D0A134894
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2020 17:55:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipEYu-0006Xf-WE; Wed, 08 Jan 2020 16:52:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Mkji=25=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ipEYt-0006XN-Fi
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2020 16:52:03 +0000
X-Inumbo-ID: 3150976e-3237-11ea-b856-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3150976e-3237-11ea-b856-12813bfff9fa;
 Wed, 08 Jan 2020 16:52:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C3265AD37;
 Wed,  8 Jan 2020 16:52:01 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <9e7be868-fe95-1b8f-68ab-e2aa15567028@suse.com>
Date: Wed, 8 Jan 2020 17:52:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] scripts/add_maintainers.pl adding empty Cc: lines
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
Cc: Lars Kurth <lars.kurth@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SnVzdCBoYWQgYSBjaGF0IHdpdGggTGFycyBvbiBJUkMsIHdoaWNoIG1pZ2h0IGJlIG9mIGNvbW1v
bgppbnRlcmVzdCAoYW5kIExhcnMgYXNrZWQgbWUgdG8gcG9zdCBpdCB0byB4ZW4tZGV2ZWwpOgoK
KDE3OjAwOjE2KSBqdWVyZ2VuX2dyb3NzOiBsYXJzX2t1cnRoOiBhbnkgaWRlYSB3aHkgCi4vc2Ny
aXB0cy9hZGRfbWFpbnRhaW5lcnMucGwgd291bGQgYWRkIGEgIkNjOiIgd2l0aG91dCBhIG1haWwg
YWRkcmVzcyB0byAKYSBwYXRjaD8gSGFwcGVuZWQgZS5nLiBpbiBteSBzZXJpZXMgIltQQVRDSCB2
MiAwLzldIHhlbjogc2NoZWR1bGVyIApjbGVhbnVwcyIgKGNvdmVyLWxldHRlciwgcGF0Y2hlcyAx
LCAyLCA3IGFuZCA5KQooMTc6MDE6NTgpIGxhcnNfa3VydGg6IGp1ZXJnZW5fZ3Jvc3M6IG9oLCBh
biBhY3R1YWwgYnVnISBMZXQgbWUgbG9vayBhdCAKdGhlIGNvZGUKKDE3OjAyOjE5KSBsYXJzX2t1
cnRoOiBqdWVyZ2VuX2dyb3NzOiAgaXMgaXQgbWlzc2luZyBzb21lIGUtbWFpbHM/CigxNzowMjoz
NCkganVlcmdlbl9ncm9zczogZ2l0IHNlbmQtZW1haWwgc2VlbXMgdG8gcmVtb3ZlIHRob3NlIGVt
cHR5IENjOiAKbGluZXMKKDE3OjAyOjUzKSBqdWVyZ2VuX2dyb3NzOiBJJ20gbm90IGF3YXJlIG9m
IGEgbWFpbCBhZGRyZXNzIG1pc3NpbmcuIExldCAKbWUgZG91YmxlIGNoZWNrCigxNzowNjo1Nikg
anVlcmdlbl9ncm9zczogbGFyc19rdXJ0aDogaG1tLCBzaG91bGRuJ3QgdGhlIE1BSU5UQUlORVJT
IAplbnRyeSAiTDogICAgICBEb3JuZXJXb3JrcyBYZW4tRGV2ZWwgPHhlbi1kZXZlbEBkb3JuZXJ3
b3Jrcy5jb20+IiByZXN1bHQgCmluIGEgQ2M6PwooMTc6MDg6MTcpIGxhcnNfa3VydGg6IExldCBt
ZSBoYXZlIGEgbG9vawooMTc6MTM6MTYpIGp1ZXJnZW5fZ3Jvc3M6IGxhcnNfa3VydGg6IGF0IGxl
YXN0IHRoZSByZWxhdGVkIGZpbGUgaXMgCnRvdWNoZWQgZXhhY3RseSBieSB0aGUgYWZmZWN0ZWQg
cGF0Y2hlcyAoYW5kIG5vdCBieSBhbnkgbm90IGFmZmVjdGVkIHBhdGNoKQooMTc6MTM6MzYpIGxh
cnNfa3VydGg6IExvb2tpbmcgYXQgdGhlIHNlcmllcyB0aGUgbW9zdCBsaWtlbHkgY2F1c2Ugb2Yg
CnRoaXMgaXMgdGhlIEw6IGVudHJ5IC0gbmVlZCB0byBsb29rIGF0IHRoZSBjb2RlCigxNzoxNToy
MSkgbGFyc19rdXJ0aDoganVlcmdlbl9ncm9zczogaXQncyBhbHNvIGFuIG9kZCBvbmUgYmVjYXVz
ZSBpdCAKY2hhbmdlcyBNQUlOVEFJTkVSUyBhbmQgcmVuYW1lcyBhIGxvdCBvZiBmaWxlcywgd2hp
Y2ggbWF5IGJlIHRoZSBjYXVzZSAKZm9yIHRoZSBlbXB0eSBzcGFjZXMKKDE3OjE1OjUyKSBqdWVy
Z2VuX2dyb3NzOiBsYXJzX2t1cnRoOiBpbiBMaW51eCBNQUlOVEFJTkVSUyBhbGwgIkw6IiAKZW50
cmllcyBqdXN0IGhhdmUgYSBtYWlsIGFkZHJlc3MgYXMgZmlyc3Qgd29yZCBhZnRlciB0aGUgIkw6
IiAobm90ICJibGEgCmJsYSA8YWRkckBkb21haW4+IikKKDE3OjE2OjExKSBsYXJzX2t1cnRoOiBB
aCB5ZXM6IGxldCBtZSBsb29rIGF0IHRoYXQgY29kZQooMTc6MjE6MjkpIGxhcnNfa3VydGg6IGp1
ZXJnZW5fZ3Jvc3M6IEkgdGhpbmsgdGhhdCBpcyBpbiBmYWN0IHRoZSBpc3N1ZQooMTc6Mjc6MTYp
IGxhcnNfa3VydGg6IGp1ZXJnZW5fZ3Jvc3M6IEkgY2FuJ3QgZml4IHRoaXMgd2l0aCBzb21lIApk
ZWJ1Z2dpbmcuIENvdWxkIHlvdSBjb3B5IHRoaXMgY29udmVyc2F0aW9uIGludG8gYSBtYWlsIG9u
IHhlbi1kZXZlbEAgCnN1Y2ggdGhhdCBJIHJlbWVtYmVyCigxNzoyNzo0MykgbGFyc19rdXJ0aDog
dWVyZ2VuX2dyb3NzOiB3aXRoPXdpdGhvdXQKKDE3OjI5OjM2KSBsYXJzX2t1cnRoOiAganVlcmdl
bl9ncm9zczogSSB0aGluayB3aGF0IGhhcHBlbnMgaXMgdGhhdCAKZ2V0X21haW50YWluZXIucGwg
YW5kIGFkZF9tYWludGFpbmVyLnBsIHByb2Nlc3MgdGhlc2UgbGluZXMgZGlmZmVyZW50bHksIApi
dXQgYWRkX21haW50YWluZXIucGwgYWxzbyBjaGVja3MgYWdhaW5zdCBvdXRwdXQgY3JlYXRlZCBm
cm9tIApnZXRfbWFpbnRhaW5lci5wbAooMTc6NDQ6NTgpIGp1ZXJnZW5fZ3Jvc3M6IGxhcnNfa3Vy
dGg6IHdoYXQgYWJvdXQgZG9pbmcgaXQgdGhlIGVhc3kgd2F5PyAKV2l0aCBhIG1vZGlmZWQgTUFJ
TlRBSU5FUlMgZmlsZSAodXNpbmcgIkw6IHhlbi1kZXZlbEBkb3JuZXJ3b3Jrcy5jb20iKSAKZXZl
cnl0aGluZyBpcyBmaW5lLiBJIGNhbiBzZW5kIGEgcGF0Y2ggaW4gY2FzZSB5b3UgYWdyZWUuCigx
Nzo0Njo0MSkgbGFyc19rdXJ0aDoganVlcmdlbl9ncm9zczogbGV0J3MgZG8gdGhhdCBmaXJzdCwg
YnV0IEkgc3RpbGwgCndvdWxkIGxpa2UgdG8gZml4IHRoZSB1bmRlcmx5aW5nIGlzc3VlIGF0IHNv
bWUgcG9pbnQgLSBhc2tpbmcgZm9yIHlvdSB0byAKc2VuZCB0aGUgSVJDIGxvZywgYXMgSSBjbGVh
cmVkIG15IGhpc3RvcnkgYnkgbWlzdGFrZSAod2hlbiBJIHdhcyB0eXBpbmcgCmEgcmVwbHkgSSBz
bGlwcGVkIGZyb20gc2hpZnQgdG8gY3RybCwgd2hpY2ggZGlkIGl0KQoKCkp1ZXJnZW4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
