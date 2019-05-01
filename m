Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38B2D10735
	for <lists+xen-devel@lfdr.de>; Wed,  1 May 2019 12:50:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hLmnB-0005UN-KT; Wed, 01 May 2019 10:48:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9pMH=TB=citrix.com=prvs=01726d3a8=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hLmnA-0005U6-Nf
 for xen-devel@lists.xenproject.org; Wed, 01 May 2019 10:48:48 +0000
X-Inumbo-ID: b11b630c-6bfe-11e9-b2d5-2709518794a0
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b11b630c-6bfe-11e9-b2d5-2709518794a0;
 Wed, 01 May 2019 10:48:45 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,417,1549929600"; d="scan'208";a="84837292"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 1 May 2019 11:48:26 +0100
Message-ID: <20190501104839.21621-3-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190501104839.21621-1-ian.jackson@eu.citrix.com>
References: <20190501104839.21621-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH v2 02/15] TestSupport: target_var: Use
 host_V for host variables
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Q2hhbmdlIGB0YXJnZXRfdmFyJyB0byBzZXQgYElERU5UX1YnIHJhdGhlciB0aGFuIGp1c3QgVi4g
IEZvcgpjb21wYXRpYmlsaXR5IHdpdGggb2xkZXIgZmxpZ2h0cyBhbmQgb2xkZXIgZmxpZ2h0IGNv
bnN0cnVjdGlvbiwKbG9vayBmb3IgcGxhaW4gViB0b28gd2hlbiBsb29raW5nIHVwIHRoZSB2YXJp
YWJsZS4KCkFuZCwgd2Ugbm93IGxvb2sgYXQgYWxsX2hvc3RfViBiZWZvcmUgVi4gIFRoaXMgaGFz
IG5vIGZ1bmN0aW9uYWwKY2hhbmdlIHdpdGggZXhpc3RpbmcgZmxpZ2h0cywgYmVjYXVzZSBleGlz
dGluZyBmbGlnaHRzIG9ubHkgaGF2ZQogIGFsbF9ob3N0X3N1aXRlCiAgYWxsX2hvc3RfZGlfdmVy
c2lvbgogIGFsbF9ob3N0X29zCmFuZCB3ZSBuZXZlciBzZXQgdGhlIGNvcnJlc3BvbmRpbmcgViBm
b3JtIG9mIHRob3NlIHZhcmlhYmxlcy4KClNvIHdpdGggZXhpc3RpbmcgZmxpZ2h0cyB0aGUgb25s
eSBmdW5jdGlvbmFsIGNoYW5nZSBpcyBhIGNoYW5nZSB0bwpzeW50aCBydW52YXJzLCB0byBhZGQg
SE9TVF8gdG8gdGhlIG5hbWUuCgpTaWduZWQtb2ZmLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tz
b25AZXUuY2l0cml4LmNvbT4KLS0tCiBPc3N0ZXN0L1Rlc3RTdXBwb3J0LnBtIHwgNCArKy0tCiAx
IGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL09zc3Rlc3QvVGVzdFN1cHBvcnQucG0gYi9Pc3N0ZXN0L1Rlc3RTdXBwb3J0LnBtCmluZGV4
IGYzNTc0MzRmLi5iYjUwMzU1OSAxMDA2NDQKLS0tIGEvT3NzdGVzdC9UZXN0U3VwcG9ydC5wbQor
KysgYi9Pc3N0ZXN0L1Rlc3RTdXBwb3J0LnBtCkBAIC0yNDc5LDggKzI0NzksNyBAQCBzdWIgZ3Vl
c3RfYXdhaXQgKCQkKSB7CiAKIHN1YiB0YXJnZXRfdmFyX3ByZWZpeCAoJCkgewogICAgIG15ICgk
aG8pID0gQF87Ci0gICAgaWYgKGV4aXN0cyAkaG8tPntHdWVzdH0pIHsgcmV0dXJuICRoby0+e0d1
ZXN0fS4nXyc7IH0KLSAgICByZXR1cm4gJyc7CisgICAgcmV0dXJuIChleGlzdHMgJGhvLT57R3Vl
c3R9ID8gJGhvLT57R3Vlc3R9IDogJGhvLT57SWRlbnR9KS4nXyc7CiB9CiAKIHN1YiB0YXJnZXRf
dmFyICgkJCkgewpAQCAtMjQ5MSw2ICsyNDkwLDcgQEAgc3ViIHRhcmdldF92YXIgKCQkKSB7CiAJ
cHVzaCBAcHJlZml4ZXMsICdhbGxfZ3Vlc3RfJzsKICAgICB9IGVsc2UgewogCXB1c2ggQHByZWZp
eGVzLCAnYWxsX2hvc3RfJzsKKwlwdXNoIEBwcmVmaXhlcywgJyc7CiAgICAgfQogICAgIGZvcmVh
Y2ggbXkgJHByZWZpeCAoQHByZWZpeGVzKSB7CiAJbXkgJHYgPSAkcnsgJHByZWZpeC4kdm4gfTsK
LS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
