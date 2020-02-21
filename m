Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFEFF16877D
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2020 20:36:27 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j5E3M-0003ZK-Cn; Fri, 21 Feb 2020 19:33:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=TYDf=4J=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1j5E3L-0003ZF-3d
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2020 19:33:35 +0000
X-Inumbo-ID: 0be17332-54e1-11ea-aa99-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0be17332-54e1-11ea-aa99-bc764e2007e4;
 Fri, 21 Feb 2020 19:33:33 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C9CD7B2F3;
 Fri, 21 Feb 2020 19:33:32 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: torvalds@linux-foundation.org
Date: Fri, 21 Feb 2020 20:33:31 +0100
Message-Id: <20200221193331.6580-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
Subject: [Xen-devel] [GIT PULL] xen: branch for v5.6-rc3
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
LjYtcmMzLXRhZwoKeGVuOiBicmFuY2ggZm9yIHY1LjYtcmMzCgpJdCBjb250YWlucyAyIHNtYWxs
IGZpeGVzIGZvciBYZW46CgotIGEgZml4IGZvciBhdm9pZGluZyB3YXJuaW5ncyB3aXRoIG5ldyBn
Y2MKLSBhIGZpeCBmb3IgaW5jb3JyZWN0bHkgZGlzYWJsZWQgaW50ZXJydXB0cyB3aGVuIGNhbGxp
bmcgX2NvbmRfcmVzY2hlZCgpCgpUaGFua3MuCgpKdWVyZ2VuCgogYXJjaC94ODYveGVuL2VubGln
aHRlbl9wdi5jIHwgNyArKysrLS0tCiBkcml2ZXJzL3hlbi9wcmVlbXB0LmMgICAgICAgfCA0ICsr
Ky0KIDIgZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKSnVl
cmdlbiBHcm9zcyAoMSk6CiAgICAgIE1lcmdlIHRhZyAnZm9yLWxpbnVzLTUuNi1yYzMtdGFnJyBv
ZiBnaXRvbGl0ZS5rZXJuZWwub3JnOnB1Yi9zY20vbGludXgva2VybmVsL2dpdC94ZW4vdGlwIGlu
dG8gX19mb3ItbGludXMtNS42LXJjMy10YWcKCktlZXMgQ29vayAoMSk6CiAgICAgIHg4Ni94ZW46
IERpc3RyaWJ1dGUgc3dpdGNoIHZhcmlhYmxlcyBmb3IgaW5pdGlhbGl6YXRpb24KClRob21hcyBH
bGVpeG5lciAoMSk6CiAgICAgIHhlbjogRW5hYmxlIGludGVycnVwdHMgd2hlbiBjYWxsaW5nIF9j
b25kX3Jlc2NoZWQoKQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
