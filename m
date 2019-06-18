Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6184A36F
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jun 2019 16:08:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdEjG-0001FX-Ok; Tue, 18 Jun 2019 14:04:54 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=/6v3=UR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hdEjF-0001FO-LC
 for xen-devel@lists.xenproject.org; Tue, 18 Jun 2019 14:04:53 +0000
X-Inumbo-ID: 0adc013c-91d2-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 0adc013c-91d2-11e9-8980-bc764e045a96;
 Tue, 18 Jun 2019 14:04:52 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 18 Jun 2019 08:04:52 -0600
Message-Id: <5D08EF7E02000078002394E9@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Tue, 18 Jun 2019 08:04:46 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "xen-devel" <xen-devel@lists.xenproject.org>
References: <5D08ECBF02000078002394C6@prv1-mh.provo.novell.com>
In-Reply-To: <5D08ECBF02000078002394C6@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [Xen-devel] [PATCH for-4.11 2/2] x86: drop arch_evtchn_inject()
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
Cc: Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Rm9yIHdoYXRldmVyIHJlYXNvbiB0aGlzIHdhcyBvbWl0dGVkIGZyb20gdGhlIGJhY2twb3J0IG9m
IGQ5MTk1OTYyYTYKKCJldmVudHM6IGRyb3AgYXJjaF9ldnRjaG5faW5qZWN0KCkiKS4KClNpZ25l
ZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCi0tLSBhL3hlbi9hcmNo
L3g4Ni9odm0vaXJxLmMKKysrIGIveGVuL2FyY2gveDg2L2h2bS9pcnEuYwpAQCAtNTYyLDEyICs1
NjIsNiBAQCBpbnQgaHZtX2xvY2FsX2V2ZW50c19uZWVkX2RlbGl2ZXJ5KHN0cnVjCiAgICAgcmV0
dXJuICFodm1faW50ZXJydXB0X2Jsb2NrZWQodiwgaW50YWNrKTsKIH0KIAotdm9pZCBhcmNoX2V2
dGNobl9pbmplY3Qoc3RydWN0IHZjcHUgKnYpCi17Ci0gICAgaWYgKCBpc19odm1fdmNwdSh2KSAp
Ci0gICAgICAgIGh2bV9hc3NlcnRfZXZ0Y2huX2lycSh2KTsKLX0KLQogc3RhdGljIHZvaWQgaXJx
X2R1bXAoc3RydWN0IGRvbWFpbiAqZCkKIHsKICAgICBzdHJ1Y3QgaHZtX2lycSAqaHZtX2lycSA9
IGh2bV9kb21haW5faXJxKGQpOwoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
