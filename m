Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D4449E2F
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jun 2019 12:24:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdBEL-0003QR-L3; Tue, 18 Jun 2019 10:20:45 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=/6v3=UR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hdBEK-0003QM-Ep
 for xen-devel@lists.xenproject.org; Tue, 18 Jun 2019 10:20:44 +0000
X-Inumbo-ID: ba1ddeb5-91b2-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id ba1ddeb5-91b2-11e9-8980-bc764e045a96;
 Tue, 18 Jun 2019 10:20:42 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 18 Jun 2019 04:20:42 -0600
Message-Id: <5D08BAF702000078002392F7@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Tue, 18 Jun 2019 04:20:39 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Julien Grall" <julien.grall@arm.com>,
 "Stefano Stabellini" <sstabellini@kernel.org>
References: <osstest-137854-mainreport@xen.org>
In-Reply-To: <osstest-137854-mainreport@xen.org>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [xen-4.10-testing test] 137854: regressions - FAIL
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 osstest service owner <osstest-admin@xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDE4LjA2LjE5IGF0IDA3OjU2LCA8b3NzdGVzdC1hZG1pbkB4ZW5wcm9qZWN0Lm9yZz4g
d3JvdGU6Cj4gZmxpZ2h0IDEzNzg1NCB4ZW4tNC4xMC10ZXN0aW5nIHJlYWwgW3JlYWxdCj4gaHR0
cDovL2xvZ3MudGVzdC1sYWIueGVucHJvamVjdC5vcmcvb3NzdGVzdC9sb2dzLzEzNzg1NC8gCj4g
Cj4gUmVncmVzc2lvbnMgOi0oCj4gCj4gVGVzdHMgd2hpY2ggZGlkIG5vdCBzdWNjZWVkIGFuZCBh
cmUgYmxvY2tpbmcsCj4gaW5jbHVkaW5nIHRlc3RzIHdoaWNoIGNvdWxkIG5vdCBiZSBydW46Cj4g
IHRlc3QtYW1kNjQtYW1kNjQteGwtcWVtdXQtc3R1YmRvbS1kZWJpYW5odm0tYW1kNjQteHNtIDEw
IGRlYmlhbi1odm0taW5zdGFsbCBmYWlsIFJFR1IuIHZzLiAxMzczODEKPiAgdGVzdC1hbWQ2NC1p
Mzg2LXhsLXFlbXV0LXN0dWJkb20tZGViaWFuaHZtLWFtZDY0LXhzbSAxMCBkZWJpYW4taHZtLWlu
c3RhbGwgZmFpbCBSRUdSLiB2cy4gMTM3MzgxCgpUaGlzIChhbHNvIHNlZW4gb24gNC4xMSwgYnV0
IG5vdCBvbiA0LjEyKSBsb29rcyB0byByZWN1ci4gRm9yIGEgLXhzbQp0ZXN0IEkgY2VydGFpbmx5
IGZpbmQgaXQgb2RkIHRvIHNlZQoKKFhFTikgSW5pdGlhbGlzaW5nIFhTTSBTSUxPIG1vZGUKCmlu
IHRoZSBib290IGxvZyAtIEknZCBleHBlY3QgRmxhc2sgdG8gYmUgdXNlZCBieSB0aGVzZSB0ZXN0
cy4gQW5kCmluZGVlZCB0aGUgU0lMTyBiYWNrcG9ydHMgbG9vayB0byBiZSBmbGF3ZWQgLyBpbmNv
bXBsZXRlOiBXaGlsZQp0aGUgS2NvbmZpZyBjaGFuZ2Ugc2hvdWxkIGhhdmUgYXBwbGllZCB3aXRo
IGZ1enogb25seSAodGh1cwptYWtpbmcgdGhlIGlzc3VlIGFwcGFyZW50KSwgdGhlIHJlbWFpbmlu
ZyBjaGFuZ2VzIGFyZW4ndCB0YWtpbmcKaW50byBhY2NvdW50IHRoYXQgdGhlIEtjb25maWcgb3B0
aW9uIGlzIEZMQVNLIHRoZXJlLCBub3QgWFNNX0ZMQVNLLgpJJ2xsIHNlZSBhYm91dCBwcm9kdWNp
bmcgYSBmaXh1cCBwYXRjaDsgSSBkb24ndCB0aGluayBJIHdhbnQgdG8KcHVsbCBpbiB0aGUgbWFz
dGVyLzQuMTIgcGF0Y2ggZG9pbmcgdGhlIHJlbmFtZS4KCkphbgoKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
