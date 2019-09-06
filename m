Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C38DAB00D
	for <lists+xen-devel@lfdr.de>; Fri,  6 Sep 2019 03:16:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i62p7-0006YQ-In; Fri, 06 Sep 2019 01:14:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=oWZz=XB=redhat.com=jpoimboe@srs-us1.protection.inumbo.net>)
 id 1i62p5-0006YL-Jn
 for xen-devel@lists.xenproject.org; Fri, 06 Sep 2019 01:13:59 +0000
X-Inumbo-ID: 9858812a-d043-11e9-978d-bc764e2007e4
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9858812a-d043-11e9-978d-bc764e2007e4;
 Fri, 06 Sep 2019 01:13:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 61B9218C4271;
 Fri,  6 Sep 2019 01:13:54 +0000 (UTC)
Received: from treble (ovpn-120-170.rdu2.redhat.com [10.10.120.170])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D2F2C5D9CA;
 Fri,  6 Sep 2019 01:13:52 +0000 (UTC)
Date: Thu, 5 Sep 2019 20:13:50 -0500
From: Josh Poimboeuf <jpoimboe@redhat.com>
To: Masami Hiramatsu <mhiramat@kernel.org>
Message-ID: <20190906011350.y65zwuychhryt7eg@treble>
References: <156773100816.29031.12557431294039450779.stgit@devnote2>
 <156773101914.29031.4027232648773934988.stgit@devnote2>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <156773101914.29031.4027232648773934988.stgit@devnote2>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.62]); Fri, 06 Sep 2019 01:13:54 +0000 (UTC)
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

T24gRnJpLCBTZXAgMDYsIDIwMTkgYXQgMDk6NTA6MTlBTSArMDkwMCwgTWFzYW1pIEhpcmFtYXRz
dSB3cm90ZToKPiAtLS0gYS90b29scy9vYmp0b29sL3N5bmMtY2hlY2suc2gKPiArKysgYi90b29s
cy9vYmp0b29sL3N5bmMtY2hlY2suc2gKPiBAQCAtNCw2ICs0LDcgQEAKPiAgRklMRVM9Jwo+ICBh
cmNoL3g4Ni9pbmNsdWRlL2FzbS9pbmF0X3R5cGVzLmgKPiAgYXJjaC94ODYvaW5jbHVkZS9hc20v
b3JjX3R5cGVzLmgKPiArYXJjaC94ODYvaW5jbHVkZS9hc20veGVuL3ByZWZpeC5oCj4gIGFyY2gv
eDg2L2xpYi94ODYtb3Bjb2RlLW1hcC50eHQKPiAgYXJjaC94ODYvdG9vbHMvZ2VuLWluc24tYXR0
ci14ODYuYXdrCj4gICcKPiBAQCAtNDYsNiArNDcsNiBAQCBkb25lCj4gIGNoZWNrIGFyY2gveDg2
L2luY2x1ZGUvYXNtL2luYXQuaCAgICAgJy1JICJeI2luY2x1ZGUgW1wiPF1cKGFzbS9cKSppbmF0
X3R5cGVzLmhbXCI+XSInCj4gIGNoZWNrIGFyY2gveDg2L2luY2x1ZGUvYXNtL2luc24uaCAgICAg
Jy1JICJeI2luY2x1ZGUgW1wiPF1cKGFzbS9cKSppbmF0LmhbXCI+XSInCj4gIGNoZWNrIGFyY2gv
eDg2L2xpYi9pbmF0LmMgICAgICAgICAgICAgJy1JICJeI2luY2x1ZGUgW1wiPF1cKC4uL2luY2x1
ZGUvXCkqYXNtL2luc24uaFtcIj5dIicKPiAtY2hlY2sgYXJjaC94ODYvbGliL2luc24uYyAgICAg
ICAgICAgICAnLUkgIl4jaW5jbHVkZSBbXCI8XVwoLi4vaW5jbHVkZS9cKSphc20vaW5cKGF0XHxz
blwpLmhbXCI+XSInCj4gK2NoZWNrIGFyY2gveDg2L2xpYi9pbnNuLmMgICAgICAgICAgICAgJy1J
ICJeI2luY2x1ZGUgW1wiPF1cKC4uL2luY2x1ZGUvXCkqYXNtL2luXChhdFx8c25cKS5oW1wiPl0i
IC1JICJeI2luY2x1ZGUgW1wiPF1cKC4uL2luY2x1ZGUvXCkqYXNtL3hlbi9wcmVmaXguaFtcIj5d
IicKClVuZm9ydHVuYXRlbHkgcGVyZiBhbHNvIGhhcyBhIHNpbWlsYXIgc3luYyBjaGVjayBzY3Jp
cHQ6CnRvb2xzL3BlcmYvY2hlY2staGVhZGVycy5zaC4gIFNvIHlvdSdsbCBhbHNvIG5lZWQgdG8g
YWRkIHRoZSBhYm92ZQpjaGFuZ2VzIHRoZXJlLgoKT3RoZXJ3aXNlCgpBY2tlZC1ieTogSm9zaCBQ
b2ltYm9ldWYgPGpwb2ltYm9lQHJlZGhhdC5jb20+CgotLSAKSm9zaAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
