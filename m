Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3550714B903
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2020 15:30:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwRqq-0002WN-Gk; Tue, 28 Jan 2020 14:28:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=VmX/=3R=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iwRqp-0002WA-3i
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2020 14:28:23 +0000
X-Inumbo-ID: 6f7911a8-41da-11ea-86e1-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6f7911a8-41da-11ea-86e1-12813bfff9fa;
 Tue, 28 Jan 2020 14:28:22 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 3678DAAA6;
 Tue, 28 Jan 2020 14:28:21 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 28 Jan 2020 15:28:15 +0100
Message-Id: <20200128142818.27200-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
Subject: [Xen-devel] [PATCH 0/3] tools/xenstore
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
YyB8IDQ0ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLQogdG9vbHMveGVuc3Rv
cmUveGVuc3RvcmVkX2NvbnRyb2wuYyAgIHwgMTggKysrKysrKysrKysrKysrCiAyIGZpbGVzIGNo
YW5nZWQsIDYxIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCi0tIAoyLjE2LjQKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
