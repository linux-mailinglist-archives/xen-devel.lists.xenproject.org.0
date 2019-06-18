Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E0D4AEAA
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2019 01:22:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdNOw-0004tt-CR; Tue, 18 Jun 2019 23:20:30 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PyOf=UR=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hdNOt-0004sM-VW
 for xen-devel@lists.xenproject.org; Tue, 18 Jun 2019 23:20:28 +0000
X-Inumbo-ID: a76e26e1-921f-11e9-8980-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id a76e26e1-921f-11e9-8980-bc764e045a96;
 Tue, 18 Jun 2019 23:20:26 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.hsd1.ca.comcast.net
 (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A91C621530;
 Tue, 18 Jun 2019 23:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1560900026;
 bh=GwEyAjT+Br4GmpstYguJ2DQHzeu78DBIV+5LF7N2vbU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=sSevXbgbMVp2mTcYMW61MlU2kdFMQc1sR18u44u3cWrwkX9Esyfd8I/AyBwqADcEB
 l4krxPv9Q/Q2e8wVw74ZM8CVUf+c6CyRBnWeJ4Q83YL4bX85QI4X13WuLEKX5Rv2Ed
 0d7/G6mGgl+CVyDLGmWkcvfJ3rWqc3lvF/TrDn5I=
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Date: Tue, 18 Jun 2019 16:20:19 -0700
Message-Id: <20190618232019.26425-5-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <alpine.DEB.2.21.1906181618130.2072@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.1906181618130.2072@sstabellini-ThinkPad-T480s>
Subject: [Xen-devel] [PATCH v3 5/5] xen/arm: clarify the support status of
 iomem configurations
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
Cc: Stefano Stabellini <stefanos@xilinx.com>, sstabellini@kernel.org,
 wei.liu2@citrix.com, konrad.wilk@oracle.com, andrew.cooper3@citrix.com,
 tim@xen.org, julien.grall@arm.com, JBeulich@suse.com,
 ian.jackson@eu.citrix.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

aW9tZW0gc2V0dGluZ3MgZmFsbCB1bmRlciB0aGUgYnJvYWRlciBjYXRlZ29yeSBvZiAiTm9uLVBD
SSBkZXZpY2UKcGFzc3Rocm91Z2giOiB0aGV5IGFyZSBub3Qgc2VjdXJpdHkgc3VwcG9ydGVkLiBN
YWtlIGl0IGNsZWFyZXIuCgpTaWduZWQtb2ZmLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHN0ZWZh
bm9zQHhpbGlueC5jb20+CkNDOiB0aW1AeGVuLm9yZwpDQzoga29ucmFkLndpbGtAb3JhY2xlLmNv
bQpDQzogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KQ0M6IEpCZXVsaWNoQHN1
c2UuY29tCkNDOiBhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tCkNDOiBpYW4uamFja3NvbkBldS5j
aXRyaXguY29tCkNDOiB3ZWkubGl1MkBjaXRyaXguY29tCi0tLQogU1VQUE9SVC5tZCB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdp
dCBhL1NVUFBPUlQubWQgYi9TVVBQT1JULm1kCmluZGV4IDM3NTQ3M2E0NTYuLmJjNmZiNThlMDQg
MTAwNjQ0Ci0tLSBhL1NVUFBPUlQubWQKKysrIGIvU1VQUE9SVC5tZApAQCAtNjM5LDcgKzYzOSw3
IEBAIHRvIGJlIHVzZWQgaW4gYWRkaXRpb24gdG8gUUVNVS4KIAogCVN0YXR1czogRXhwZXJpbWVu
dGFsCiAKLSMjIyBBUk0vTm9uLVBDSSBkZXZpY2UgcGFzc3Rocm91Z2gKKyMjIyBBUk0vTm9uLVBD
SSBkZXZpY2UgcGFzc3Rocm91Z2ggYW5kIG90aGVyIGlvbWVtIGNvbmZpZ3VyYXRpb25zCiAKICAg
ICBTdGF0dXM6IFN1cHBvcnRlZCwgbm90IHNlY3VyaXR5IHN1cHBvcnRlZAogCi0tIAoyLjE3LjEK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
