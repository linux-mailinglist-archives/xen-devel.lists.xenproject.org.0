Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9041417CD4C
	for <lists+xen-devel@lfdr.de>; Sat,  7 Mar 2020 10:38:48 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jAVsc-0003QX-1Z; Sat, 07 Mar 2020 09:36:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=f2lU=4Y=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jAVsa-0003QS-RG
 for xen-devel@lists.xenproject.org; Sat, 07 Mar 2020 09:36:20 +0000
X-Inumbo-ID: 1957a276-6057-11ea-a94a-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1957a276-6057-11ea-a94a-12813bfff9fa;
 Sat, 07 Mar 2020 09:36:19 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id BDDF4AC67;
 Sat,  7 Mar 2020 09:36:18 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: torvalds@linux-foundation.org
Date: Sat,  7 Mar 2020 10:36:17 +0100
Message-Id: <20200307093617.11819-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
Subject: [Xen-devel] [GIT PULL] xen: branch for v5.6-rc5
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
LjZiLXJjNS10YWcKCnhlbjogYnJhbmNoIGZvciB2NS42LXJjNQoKSXQgY29udGFpbnMgNCBmaXhl
cyBhbmQgYSBzbWFsbCBjbGVhbnVwIHBhdGNoOgoKLSAyIGZpeGVzIGJ5IERvbmdsaSBaaGFuZyBm
aXhpbmcgcmFjZXMgaW4gdGhlIHhlbmJ1cyBkcml2ZXIKLSAyIGZpeGVzIGJ5IG1lIGZpeGluZyBp
c3N1ZXMgaW50cm9kdWNlZCBpbiA1LjYKLSBhIHNtYWxsIGNsZWFudXAgYnkgR3VzdGF2byBTaWx2
YSByZXBsYWNpbmcgYSB6ZXJvLWxlbmd0aCBhcnJheSB3aXRoCiAgYSBmbGV4aWJsZS1hcnJheQoK
VGhhbmtzLgoKSnVlcmdlbgoKIGRyaXZlcnMvYmxvY2sveGVuLWJsa2Zyb250LmMgICAgICAgICAg
ICAgIHwgODAgKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLQogZHJpdmVycy94ZW4veGVu
LXBjaWJhY2svcGNpYmFjay5oICAgICAgICAgfCAgMiArLQogZHJpdmVycy94ZW4veGVuYnVzL3hl
bmJ1c19jb21tcy5jICAgICAgICAgfCAgNCArKwogZHJpdmVycy94ZW4veGVuYnVzL3hlbmJ1c19w
cm9iZS5jICAgICAgICAgfCAxMCArKy0tCiBkcml2ZXJzL3hlbi94ZW5idXMveGVuYnVzX3Byb2Jl
X2JhY2tlbmQuYyB8ICA1ICstCiBkcml2ZXJzL3hlbi94ZW5idXMveGVuYnVzX3hzLmMgICAgICAg
ICAgICB8ICA5ICsrLS0KIGluY2x1ZGUveGVuL2ludGVyZmFjZS9pby90cG1pZi5oICAgICAgICAg
IHwgIDIgKy0KIGluY2x1ZGUveGVuL3hlbmJ1cy5oICAgICAgICAgICAgICAgICAgICAgIHwgIDMg
Ky0KIDggZmlsZXMgY2hhbmdlZCwgNjQgaW5zZXJ0aW9ucygrKSwgNTEgZGVsZXRpb25zKC0pCgpE
b25nbGkgWmhhbmcgKDIpOgogICAgICB4ZW5idXM6IHJlcS0+Ym9keSBzaG91bGQgYmUgdXBkYXRl
ZCBiZWZvcmUgcmVxLT5zdGF0ZQogICAgICB4ZW5idXM6IHJlcS0+ZXJyIHNob3VsZCBiZSB1cGRh
dGVkIGJlZm9yZSByZXEtPnN0YXRlCgpHdXN0YXZvIEEuIFIuIFNpbHZhICgxKToKICAgICAgeGVu
OiBSZXBsYWNlIHplcm8tbGVuZ3RoIGFycmF5IHdpdGggZmxleGlibGUtYXJyYXkgbWVtYmVyCgpK
dWVyZ2VuIEdyb3NzICgyKToKICAgICAgeGVuL3hlbmJ1czogZml4IGxvY2tpbmcKICAgICAgeGVu
L2Jsa2Zyb250OiBmaXggcmluZyBpbmZvIGFkZHJlc3NpbmcKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
