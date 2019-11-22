Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 074A51060EF
	for <lists+xen-devel@lfdr.de>; Fri, 22 Nov 2019 06:53:30 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iY1q6-0001kE-Ke; Fri, 22 Nov 2019 05:50:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=m0bm=ZO=kernel.org=sashal@srs-us1.protection.inumbo.net>)
 id 1iY1q5-0001k9-5K
 for xen-devel@lists.xenproject.org; Fri, 22 Nov 2019 05:50:41 +0000
X-Inumbo-ID: 03aea0fa-0cec-11ea-a344-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 03aea0fa-0cec-11ea-a344-12813bfff9fa;
 Fri, 22 Nov 2019 05:50:40 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0950C2071C;
 Fri, 22 Nov 2019 05:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1574401839;
 bh=Ql9x8nBLRruSTrj/axpdo25m6wC+H80WPeR0h+hYPu4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Fa8IE+auH7bNqpDrTWeyFOq3CyzulDLsTcGjS/A5nsP8Wkg1yzHNeMEljkb/Zfwu3
 FY7J0KsmR5RsiqNhE9kGjK+spJFxUJw7fK/pNbDjWJU/xijMji3wQv98IyaE08io5M
 fiS2sL3klxqWZ1U82IMX8nPhnN6hdQll835Kg84I=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Fri, 22 Nov 2019 00:46:52 -0500
Message-Id: <20191122054911.1750-73-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191122054911.1750-1-sashal@kernel.org>
References: <20191122054911.1750-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Subject: [Xen-devel] [PATCH AUTOSEL 4.19 080/219] kprobes/x86/xen: blacklist
 non-attachable xen interrupt functions
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
Cc: Sasha Levin <sashal@kernel.org>, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, Andrea Righi <righi.andrea@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogQW5kcmVhIFJpZ2hpIDxyaWdoaS5hbmRyZWFAZ21haWwuY29tPgoKWyBVcHN0cmVhbSBj
b21taXQgYmY5NDQ1YTMzYWU2YWMyZjA4MjJkMmYxY2UxMzY1NDA4Mzg3ZDU2OCBdCgpCbGFja2xp
c3Qgc3ltYm9scyBpbiBYZW4gcHJvYmUtcHJvaGliaXRlZCBhcmVhcywgc28gdGhhdCB1c2VyIGNh
biBzZWUKdGhlc2UgcHJvaGliaXRlZCBzeW1ib2xzIGluIGRlYnVnZnMuCgpTZWUgYWxzbzogYTUw
NDgwY2I2ZDYxLgoKU2lnbmVkLW9mZi1ieTogQW5kcmVhIFJpZ2hpIDxyaWdoaS5hbmRyZWFAZ21h
aWwuY29tPgpBY2tlZC1ieTogTWFzYW1pIEhpcmFtYXRzdSA8bWhpcmFtYXRAa2VybmVsLm9yZz4K
U2lnbmVkLW9mZi1ieTogQm9yaXMgT3N0cm92c2t5IDxib3Jpcy5vc3Ryb3Zza3lAb3JhY2xlLmNv
bT4KU2lnbmVkLW9mZi1ieTogU2FzaGEgTGV2aW4gPHNhc2hhbEBrZXJuZWwub3JnPgotLS0KIGFy
Y2gveDg2L3hlbi94ZW4tYXNtXzY0LlMgfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRp
b25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC94ODYveGVuL3hlbi1hc21fNjQuUyBiL2FyY2gveDg2
L3hlbi94ZW4tYXNtXzY0LlMKaW5kZXggM2E2ZmVlZDc2ZGZjMS4uYTkzZDhhN2NlZjI2YyAxMDA2
NDQKLS0tIGEvYXJjaC94ODYveGVuL3hlbi1hc21fNjQuUworKysgYi9hcmNoL3g4Ni94ZW4veGVu
LWFzbV82NC5TCkBAIC0xMiw2ICsxMiw3IEBACiAjaW5jbHVkZSA8YXNtL3NlZ21lbnQuaD4KICNp
bmNsdWRlIDxhc20vYXNtLW9mZnNldHMuaD4KICNpbmNsdWRlIDxhc20vdGhyZWFkX2luZm8uaD4K
KyNpbmNsdWRlIDxhc20vYXNtLmg+CiAKICNpbmNsdWRlIDx4ZW4vaW50ZXJmYWNlL3hlbi5oPgog
CkBAIC0yNCw2ICsyNSw3IEBAIEVOVFJZKHhlbl9cbmFtZSkKIAlwb3AgJXIxMQogCWptcCAgXG5h
bWUKIEVORCh4ZW5fXG5hbWUpCitfQVNNX05PS1BST0JFKHhlbl9cbmFtZSkKIC5lbmRtCiAKIHhl
bl9wdl90cmFwIGRpdmlkZV9lcnJvcgotLSAKMi4yMC4xCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
