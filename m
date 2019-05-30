Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C773006C
	for <lists+xen-devel@lfdr.de>; Thu, 30 May 2019 18:55:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hWOHn-0000ZS-FA; Thu, 30 May 2019 16:52:15 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=uW51=T6=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hWOHm-0000ZN-IT
 for xen-devel@lists.xenproject.org; Thu, 30 May 2019 16:52:14 +0000
X-Inumbo-ID: 450fd9f6-82fb-11e9-8980-bc764e045a96
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 450fd9f6-82fb-11e9-8980-bc764e045a96;
 Thu, 30 May 2019 16:52:12 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@eu.citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL01.citrite.net
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@eu.citrix.com) identity=pra;
 client-ip=23.29.105.83; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@eu.citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 23.29.105.83 as permitted
 sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.50 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL01.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL01.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: j6Jla5bEjOysbWY33LQgBsckjzCSiUp/Xf80ERNKwuOaABxlNxI+FRTakiLW97oJOwguOEb3FY
 Jsl8qgbIv/ozrbZ7fOVFrNTUaJtHliMomnFkbKdCSbhSWR33Rag3S1RIA1rhLVw6B2pzJiEy0r
 ZHaXA2byisdFFypizTBrmsu0SmkRPjzGiCXiYUOrT+z2urjMQX5MHCsyMHVaf5PKkGA79LJZ9U
 KdQyqKksZgusjCHkBMn622oo8tSbmeRngv04mVrJaCXwgrfnm/rZIMviUVqIMbiR5uzigWR6mD
 XWg=
X-SBRS: 2.7
X-MesageID: 1092333
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,531,1549947600"; 
   d="scan'208";a="1092333"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 30 May 2019 17:51:23 +0100
Message-ID: <20190530165123.22593-1-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <c78c372a-4cf4-9721-38f2-d173eecee27e@arm.com>
References: <c78c372a-4cf4-9721-38f2-d173eecee27e@arm.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH] ts-kernel-build: Disable
 CONFIG_ARCH_QCOM in Xen Project CI
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, linux-arm-msm@vger.kernel.org,
 Ian Jackson <ian.jackson@eu.citrix.com>, linux-kernel@vger.kernel.org,
 Stephen Boyd <swboyd@chromium.org>, Julien Grall <julien.grall@arm.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

ICBkcml2ZXJzL2Zpcm13YXJlL3Fjb21fc2NtLmM6NDY5OjQ3OiBlcnJvcjogcGFzc2luZyBhcmd1
bWVudCAzIG9mIGBkbWFfYWxsb2NfY29oZXJlbnQnIGZyb20gaW5jb21wYXRpYmxlIHBvaW50ZXIg
dHlwZSBbLVdlcnJvcj1pbmNvbXBhdGlibGUtcG9pbnRlci10eXBlc10KClRoaXMgaXMgZml4ZWQg
YnkKCiAgZmlybXdhcmU6IHFjb21fc2NtOiBVc2UgcHJvcGVyIHR5cGVzIGZvciBkbWEgbWFwcGlu
Z3MKCmJ1dCB0aGlzIGlzIG5vdCBwcmVzZW50IGluIGFsbCByZWxldmFudCBzdGFibGUgYnJhbmNo
ZXMuCgpXZSBjdXJyZW50bHkgaGF2ZSBubyBRdWFsY29tbSBoYXJkd2FyZSBpbiB0aGUgWGVuIFBy
b2plY3QgdGVzdCBsYWIgc28Kd2UgZG8gbm90IG5lZWQgdGhpcyBlbmFibGVkLgoKQ0M6IEp1bGll
biBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20KQ0M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0
YWJlbGxpbmlAa2VybmVsLm9yZz4KQ0M6IGxpbnV4LWFybS1tc21Admdlci5rZXJuZWwub3JnCkND
OiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnCkNDOiBTdGVwaGVuIEJveWQgPHN3Ym95ZEBj
aHJvbWl1bS5vcmc+CkNDOiBBbmR5IEdyb3NzIDxhZ3Jvc3NAa2VybmVsLm9yZz4KQ0M6IEJqb3Ju
IEFuZGVyc3NvbiA8Ympvcm4uYW5kZXJzc29uQGxpbmFyby5vcmc+CkNDOiBBdmFuZWVzaCBLdW1h
ciBEd2l2ZWRpIDxha2R3aXZlZEBjb2RlYXVyb3JhLm9yZz4KU2lnbmVkLW9mZi1ieTogSWFuIEph
Y2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Ci0tLQogdHMta2VybmVsLWJ1aWxkIHwg
NCArKysrCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvdHMt
a2VybmVsLWJ1aWxkIGIvdHMta2VybmVsLWJ1aWxkCmluZGV4IGY3ZDA1OWIwLi41NTM2NTg2ZiAx
MDA3NTUKLS0tIGEvdHMta2VybmVsLWJ1aWxkCisrKyBiL3RzLWtlcm5lbC1idWlsZApAQCAtMjc0
LDYgKzI3NCwxMCBAQCBzZXRvcHQgQ09ORklHX01ESU9fVEhVTkRFUj1tCiBzZXRvcHQgQ09ORklH
X0kyQ19USFVOREVSWD1tCiBzZXRvcHQgQ09ORklHX1NQSV9USFVOREVSWD1tCiAKKyMgU29tZSBM
aW51eCBicmFuY2hlcyB3ZSBjYXJlIGFib3V0LCBpbmNsdWRpbmcgNC4xOSwgc3RpbGwgbGFjawor
IyBmaXJtd2FyZTogcWNvbV9zY206IFVzZSBwcm9wZXIgdHlwZXMgZm9yIGRtYSBtYXBwaW5ncwor
Q09ORklHX0FSQ0hfUUNPTT1uCisKICMjIyMKIAogRU5ECi0tIAoyLjExLjAKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
