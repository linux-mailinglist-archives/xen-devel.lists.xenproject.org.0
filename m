Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 263D810740
	for <lists+xen-devel@lfdr.de>; Wed,  1 May 2019 12:51:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hLmnD-0005Vm-H7; Wed, 01 May 2019 10:48:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9pMH=TB=citrix.com=prvs=01726d3a8=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hLmnB-0005Ud-Vm
 for xen-devel@lists.xenproject.org; Wed, 01 May 2019 10:48:50 +0000
X-Inumbo-ID: b2e7e4ee-6bfe-11e9-ba85-b72dd93ff4bf
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b2e7e4ee-6bfe-11e9-ba85-b72dd93ff4bf;
 Wed, 01 May 2019 10:48:48 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,417,1549929600"; d="scan'208";a="84837301"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 1 May 2019 11:48:30 +0100
Message-ID: <20190501104839.21621-7-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190501104839.21621-1-ian.jackson@eu.citrix.com>
References: <20190501104839.21621-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH v2 06/15] arch replumbing:
 ts-memdisk-try-append: Remove unidiomatic " "
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

Tm8gZnVuY3Rpb25hbCBjaGFuZ2UuCgpTaWduZWQtb2ZmLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmph
Y2tzb25AZXUuY2l0cml4LmNvbT4KLS0tCiB0cy1tZW1kaXNrLXRyeS1hcHBlbmQgfCAyICstCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQg
YS90cy1tZW1kaXNrLXRyeS1hcHBlbmQgYi90cy1tZW1kaXNrLXRyeS1hcHBlbmQKaW5kZXggNjdj
MjUwYmQuLmY2ZWMyZmQ1IDEwMDc1NQotLS0gYS90cy1tZW1kaXNrLXRyeS1hcHBlbmQKKysrIGIv
dHMtbWVtZGlzay10cnktYXBwZW5kCkBAIC0yMyw3ICsyMyw3IEBAIGFyY2g9YHBlcmwgLWUgJwog
ICAgICAgICAgICAgICAgIHVzZSBPc3N0ZXN0OjpUZXN0U3VwcG9ydDsKIAogICAgICAgICAgICAg
ICAgIHRzcmVhZGNvbmZpZygpOwotICAgICAgICAgICAgICAgIHByaW50ICRyeyJhcmNoIn0gb3Ig
ZGllICQhOworICAgICAgICAgICAgICAgIHByaW50ICRye2FyY2h9IG9yIGRpZSAkITsKICAgICAg
ICAgICAgICAgJ2AKIAogY2FzZSAiJGFyY2giIGluCi0tIAoyLjExLjAKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
