Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6238AB03D
	for <lists+xen-devel@lfdr.de>; Fri,  6 Sep 2019 03:41:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i63DS-0008Oc-4s; Fri, 06 Sep 2019 01:39:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hqBu=XB=kernel.org=mhiramat@srs-us1.protection.inumbo.net>)
 id 1i63DR-0008OX-50
 for xen-devel@lists.xenproject.org; Fri, 06 Sep 2019 01:39:09 +0000
X-Inumbo-ID: 1e62e4f6-d047-11e9-abe5-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1e62e4f6-d047-11e9-abe5-12813bfff9fa;
 Fri, 06 Sep 2019 01:39:08 +0000 (UTC)
Received: from devnote2 (NE2965lan1.rev.em-net.ne.jp [210.141.244.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5EC3E207E0;
 Fri,  6 Sep 2019 01:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1567733948;
 bh=aHg0E3mt7AI+DRDT0bvLOsakhhkONV9V1aoQPlFMNE4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=h1/LB253vTL/bFRu7AR63XO0H8mRHG6hnMyzEjSZqjzMKbRQ0kmWWrDnElyIqhyPG
 n+6jMf2x9aq15ZMF5LEowxUqh0dJkOpAVi0GRxp6x6xK5fVMdxRzjTMI6QJEOFuSyF
 dEPeTPyOgb9E8xo94UpkzEbGkpFurmqxwT16X7GI=
Date: Fri, 6 Sep 2019 10:39:03 +0900
From: Masami Hiramatsu <mhiramat@kernel.org>
To: Josh Poimboeuf <jpoimboe@redhat.com>
Message-Id: <20190906103903.36868b9074b3111ada3d85da@kernel.org>
In-Reply-To: <20190906011350.y65zwuychhryt7eg@treble>
References: <156773100816.29031.12557431294039450779.stgit@devnote2>
 <156773101914.29031.4027232648773934988.stgit@devnote2>
 <20190906011350.y65zwuychhryt7eg@treble>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Subject: Re: [Xen-devel] [PATCH -tip v2 1/2] x86: xen: insn: Decode Xen and
 KVM emulate-prefix signature
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Randy Dunlap <rdunlap@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org, Borislav Petkov <bp@alien8.de>,
 xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Ingo Molnar <mingo@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCA1IFNlcCAyMDE5IDIwOjEzOjUwIC0wNTAwCkpvc2ggUG9pbWJvZXVmIDxqcG9pbWJv
ZUByZWRoYXQuY29tPiB3cm90ZToKCj4gT24gRnJpLCBTZXAgMDYsIDIwMTkgYXQgMDk6NTA6MTlB
TSArMDkwMCwgTWFzYW1pIEhpcmFtYXRzdSB3cm90ZToKPiA+IC0tLSBhL3Rvb2xzL29ianRvb2wv
c3luYy1jaGVjay5zaAo+ID4gKysrIGIvdG9vbHMvb2JqdG9vbC9zeW5jLWNoZWNrLnNoCj4gPiBA
QCAtNCw2ICs0LDcgQEAKPiA+ICBGSUxFUz0nCj4gPiAgYXJjaC94ODYvaW5jbHVkZS9hc20vaW5h
dF90eXBlcy5oCj4gPiAgYXJjaC94ODYvaW5jbHVkZS9hc20vb3JjX3R5cGVzLmgKPiA+ICthcmNo
L3g4Ni9pbmNsdWRlL2FzbS94ZW4vcHJlZml4LmgKPiA+ICBhcmNoL3g4Ni9saWIveDg2LW9wY29k
ZS1tYXAudHh0Cj4gPiAgYXJjaC94ODYvdG9vbHMvZ2VuLWluc24tYXR0ci14ODYuYXdrCj4gPiAg
Jwo+ID4gQEAgLTQ2LDYgKzQ3LDYgQEAgZG9uZQo+ID4gIGNoZWNrIGFyY2gveDg2L2luY2x1ZGUv
YXNtL2luYXQuaCAgICAgJy1JICJeI2luY2x1ZGUgW1wiPF1cKGFzbS9cKSppbmF0X3R5cGVzLmhb
XCI+XSInCj4gPiAgY2hlY2sgYXJjaC94ODYvaW5jbHVkZS9hc20vaW5zbi5oICAgICAnLUkgIl4j
aW5jbHVkZSBbXCI8XVwoYXNtL1wpKmluYXQuaFtcIj5dIicKPiA+ICBjaGVjayBhcmNoL3g4Ni9s
aWIvaW5hdC5jICAgICAgICAgICAgICctSSAiXiNpbmNsdWRlIFtcIjxdXCguLi9pbmNsdWRlL1wp
KmFzbS9pbnNuLmhbXCI+XSInCj4gPiAtY2hlY2sgYXJjaC94ODYvbGliL2luc24uYyAgICAgICAg
ICAgICAnLUkgIl4jaW5jbHVkZSBbXCI8XVwoLi4vaW5jbHVkZS9cKSphc20vaW5cKGF0XHxzblwp
LmhbXCI+XSInCj4gPiArY2hlY2sgYXJjaC94ODYvbGliL2luc24uYyAgICAgICAgICAgICAnLUkg
Il4jaW5jbHVkZSBbXCI8XVwoLi4vaW5jbHVkZS9cKSphc20vaW5cKGF0XHxzblwpLmhbXCI+XSIg
LUkgIl4jaW5jbHVkZSBbXCI8XVwoLi4vaW5jbHVkZS9cKSphc20veGVuL3ByZWZpeC5oW1wiPl0i
Jwo+IAo+IFVuZm9ydHVuYXRlbHkgcGVyZiBhbHNvIGhhcyBhIHNpbWlsYXIgc3luYyBjaGVjayBz
Y3JpcHQ6Cj4gdG9vbHMvcGVyZi9jaGVjay1oZWFkZXJzLnNoLiAgU28geW91J2xsIGFsc28gbmVl
ZCB0byBhZGQgdGhlIGFib3ZlCj4gY2hhbmdlcyB0aGVyZS4KCk9vcHMsIEkgdGhvdWdodCBpdCB3
YXMgaW50ZWdyYXRlZC4uLiBPSywgSSdsbCB1cGRhdGUgdGhpcyBwYXRjaC4KCj4gCj4gT3RoZXJ3
aXNlCj4gCj4gQWNrZWQtYnk6IEpvc2ggUG9pbWJvZXVmIDxqcG9pbWJvZUByZWRoYXQuY29tPgoK
VGhhbmtzIQoKPiAKPiAtLSAKPiBKb3NoCgoKLS0gCk1hc2FtaSBIaXJhbWF0c3UgPG1oaXJhbWF0
QGtlcm5lbC5vcmc+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
