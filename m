Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD63D4F2A
	for <lists+xen-devel@lfdr.de>; Sat, 12 Oct 2019 12:55:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iJEzp-0004va-Dj; Sat, 12 Oct 2019 10:51:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=+DYs=YF=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iJEzn-0004vV-UO
 for xen-devel@lists.xenproject.org; Sat, 12 Oct 2019 10:51:35 +0000
X-Inumbo-ID: 41b2ca80-ecde-11e9-beca-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 41b2ca80-ecde-11e9-beca-bc764e2007e4;
 Sat, 12 Oct 2019 10:51:34 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 7FBF8AD26;
 Sat, 12 Oct 2019 10:51:33 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: torvalds@linux-foundation.org
Date: Sat, 12 Oct 2019 12:51:31 +0200
Message-Id: <20191012105131.10908-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
Subject: [Xen-devel] [GIT PULL] xen: fixes for 5.4-rc3
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
Cc: xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com,
 linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

TGludXMsCgpQbGVhc2UgZ2l0IHB1bGwgdGhlIGZvbGxvd2luZyB0YWc6CgogZ2l0Oi8vZ2l0Lmtl
cm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3hlbi90aXAuZ2l0IGZvci1saW51cy01
LjQtcmMzLXRhZwoKeGVuOiBmaXhlcyBmb3IgNS40LXJjMwoKSXQgY29udGFpbnMgdGhlIGZvbGxv
d2luZyBwYXRjaGVzOgoKLSBhIHBhdGNoIHRvIGNvcnJlY3QgcGFuaWMgaGFuZGxpbmcgd2hlbiBy
dW5uaW5nIGFzIGEgWGVuIGd1ZXN0CgotIGEgY2xlYW51cCBpbiB0aGUgWGVuIGdyYW50IGRyaXZl
ciB0byByZW1vdmUgcHJpbnRpbmcgYSBwb2ludGVyIGJlaW5nCiAgYWx3YXlzIE5VTEwKCi0gYSBw
YXRjaCB0byByZW1vdmUgYSBzb29uIHRvIGJlIHdyb25nIGNhbGwgb2Ygb2ZfZG1hX2NvbmZpZ3Vy
ZSgpCgoKVGhhbmtzLgoKSnVlcmdlbgoKIERvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUva2VybmVs
LXBhcmFtZXRlcnMudHh0IHwgIDQgKysrKwogYXJjaC94ODYveGVuL2VubGlnaHRlbi5jICAgICAg
ICAgICAgICAgICAgICAgICAgfCAyOCArKysrKysrKysrKysrKysrKysrKysrLS0tCiBkcml2ZXJz
L2dwdS9kcm0veGVuL3hlbl9kcm1fZnJvbnQuYyAgICAgICAgICAgICB8IDEyICsrLS0tLS0tLS0t
CiBkcml2ZXJzL3hlbi9nbnRkZXYuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDEzICsr
LS0tLS0tLS0tLQogZHJpdmVycy94ZW4vZ3JhbnQtdGFibGUuYyAgICAgICAgICAgICAgICAgICAg
ICAgfCAgMyArLS0KIDUgZmlsZXMgY2hhbmdlZCwgMzQgaW5zZXJ0aW9ucygrKSwgMjYgZGVsZXRp
b25zKC0pCgpCb3JpcyBPc3Ryb3Zza3kgKDEpOgogICAgICB4ODYveGVuOiBSZXR1cm4gZnJvbSBw
YW5pYyBub3RpZmllcgoKRnVxaWFuIEh1YW5nICgxKToKICAgICAgeGVuL2dyYW50LXRhYmxlOiBy
ZW1vdmUgdW5uZWNlc3NhcnkgcHJpbnRpbmcKClJvYiBIZXJyaW5nICgxKToKICAgICAgeGVuOiBT
dG9wIGFidXNpbmcgRFQgb2ZfZG1hX2NvbmZpZ3VyZSBBUEkKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
