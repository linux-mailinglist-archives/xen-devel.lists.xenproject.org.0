Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 072FC15A258
	for <lists+xen-devel@lfdr.de>; Wed, 12 Feb 2020 08:45:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j1mex-00011n-5S; Wed, 12 Feb 2020 07:42:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=TtlS=4A=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1j1mev-00011g-Ay
 for xen-devel@lists.xenproject.org; Wed, 12 Feb 2020 07:42:09 +0000
X-Inumbo-ID: 25b49bea-4d6b-11ea-b0fd-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 25b49bea-4d6b-11ea-b0fd-bc764e2007e4;
 Wed, 12 Feb 2020 07:41:58 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 26D66AEF6;
 Wed, 12 Feb 2020 07:41:57 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Wed, 12 Feb 2020 08:41:51 +0100
Message-Id: <20200212074154.23755-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
Subject: [Xen-devel] [PATCH v2 0/3] tools/xenstore
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
Cc: Juergen Gross <jgross@suse.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U29tZSBwYXRjaGVzIGZvciBYZW5zdG9yZS1zdHViZG9tIHdoaWNoIGhhdmUgYmVlbiBseWluZyBh
cm91bmQgaW4gbXkKbG9jYWwgdHJlZSBmb3Igc29tZSB0aW1lIG5vdy4KCkp1ZXJnZW4gR3Jvc3Mg
KDMpOgogIHhlbnN0b3JlOiBzZXR1cCB4ZW5zdG9yZSBzdHViZG9tIGNvbnNvbGUgaW50ZXJmYWNl
IHByb3Blcmx5CiAgeGVuc3RvcmU6IGFkZCBjb25zb2xlIHhlbnN0b3JlIGVudHJpZXMgZm9yIHhl
bnN0b3JlIHN0dWJkb20KICB4ZW5zdG9yZTogcmVtb3ZlIG5vdCBhcHBsaWNhYmxlIGNvbnRyb2wg
Y29tbWFuZHMgaW4gc3R1YmRvbQoKIHRvb2xzL2hlbHBlcnMvaW5pdC14ZW5zdG9yZS1kb21haW4u
YyB8IDU1ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLQogdG9vbHMveGVuc3Rv
cmUveGVuc3RvcmVkX2NvbnRyb2wuYyAgIHwgMTggKysrKysrKysrKysrCiAyIGZpbGVzIGNoYW5n
ZWQsIDcyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCi0tIAoyLjE2LjQKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
