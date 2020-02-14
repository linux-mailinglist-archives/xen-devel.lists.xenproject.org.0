Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 558EF15CF36
	for <lists+xen-devel@lfdr.de>; Fri, 14 Feb 2020 01:48:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j2P5o-0000Xe-4l; Fri, 14 Feb 2020 00:44:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rZhY=4C=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1j2P5m-0000XY-2p
 for xen-devel@lists.xenproject.org; Fri, 14 Feb 2020 00:44:26 +0000
X-Inumbo-ID: 261d7666-4ec3-11ea-aa99-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 261d7666-4ec3-11ea-aa99-bc764e2007e4;
 Fri, 14 Feb 2020 00:44:25 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BA6462187F;
 Fri, 14 Feb 2020 00:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581641065;
 bh=hn6XqIZx8QBolXDtXrEwHHghwHCs9olTo4mXB/Mgpbw=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=iYD60phBUrh17U98qPDjVutSPIOFglPasj6+b8Imu1Pq+rzmjjyq8Rcy8Rs/Yu0ZW
 1ivTpG0uCgulBpnH+pO1cJMivgB6rfl/ciqtfbH+0wlsAFiz6bWRF01DuJd8gYst7G
 k1lzsv4Scuc0H6SS/mi5B2oCWE60o3u/l9Gi6XTc=
Date: Thu, 13 Feb 2020 16:44:23 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
In-Reply-To: <20200213123906.10376-1-julien@xen.org>
Message-ID: <alpine.DEB.2.21.2002131644120.1018@sstabellini-ThinkPad-T480s>
References: <20200213123906.10376-1-julien@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] xen/arm: Use asm/ rather than asm-arm/ when
 including header
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
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCAxMyBGZWIgMjAyMCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEFsbCB0aGUgYXJjaCBo
ZWFkZXJzIChpLmUgdW5kZXIgYXNtLWFybSkgYXJlIGluY2x1ZGVkIHVzaW5nICJhc20vKi5oIi4K
PiAKPiBUbyBzdGF5IGNvbnNpc3RlbnQsIHJlbW92ZSB0aGUgb25seSBpbnN0YW5jZSB3aGVyZSAi
YXNtLWFybS8qLmgiIGlzCj4gdXNlZC4KPiAKPiBUYWtlIHRoZSBvcHBvcnR1bml0eSB0byBtb3Zl
IHRoZSBpbmNsdXNpb24gd2l0aCB0aGUgcmVzdCBvZiB0aGUgYXNtLwo+IGluY2x1ZGUuCj4gCj4g
U2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4KClJldmlld2VkLWJ5
OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+CgoKPiAtLS0KPiAg
eGVuL2luY2x1ZGUvYXNtLWFybS9kb21haW4uaCB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRl
L2FzbS1hcm0vZG9tYWluLmggYi94ZW4vaW5jbHVkZS9hc20tYXJtL2RvbWFpbi5oCj4gaW5kZXgg
ODVhNmYxN2Q0ZC4uZDIxNDJjNjcwNyAxMDA2NDQKPiAtLS0gYS94ZW4vaW5jbHVkZS9hc20tYXJt
L2RvbWFpbi5oCj4gKysrIGIveGVuL2luY2x1ZGUvYXNtLWFybS9kb21haW4uaAo+IEBAIC05LDEw
ICs5LDEwIEBACj4gICNpbmNsdWRlIDxhc20vbW1pby5oPgo+ICAjaW5jbHVkZSA8YXNtL2dpYy5o
Pgo+ICAjaW5jbHVkZSA8YXNtL3ZnaWMuaD4KPiArI2luY2x1ZGUgPGFzbS92cGwwMTEuaD4KPiAg
I2luY2x1ZGUgPHB1YmxpYy9odm0vcGFyYW1zLmg+Cj4gICNpbmNsdWRlIDx4ZW4vc2VyaWFsLmg+
Cj4gICNpbmNsdWRlIDx4ZW4vcmJ0cmVlLmg+Cj4gLSNpbmNsdWRlIDxhc20tYXJtL3ZwbDAxMS5o
Pgo+ICAKPiAgc3RydWN0IGh2bV9kb21haW4KPiAgewo+IC0tIAo+IDIuMTcuMQo+IAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
