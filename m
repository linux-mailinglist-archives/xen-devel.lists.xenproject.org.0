Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B50EC17BBA6
	for <lists+xen-devel@lfdr.de>; Fri,  6 Mar 2020 12:28:37 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jAB5h-0006gf-Df; Fri, 06 Mar 2020 11:24:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=h18c=4X=xen.org=prvs=327f7e818=paul@srs-us1.protection.inumbo.net>)
 id 1jAB5f-0006ga-Vc
 for xen-devel@lists.xenproject.org; Fri, 06 Mar 2020 11:24:28 +0000
X-Inumbo-ID: 08bb7a6a-5f9d-11ea-a7ad-12813bfff9fa
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 08bb7a6a-5f9d-11ea-a7ad-12813bfff9fa;
 Fri, 06 Mar 2020 11:24:25 +0000 (UTC)
IronPort-SDR: fPXlfAcm4SOa5I3jr1jc4Jen9P+m7mjVC6BGtDxfKKjDXl2v0fW65oogXg821cWOo7Nrzqp8WN
 lvcTn7wGbx6g==
X-IronPort-AV: E=Sophos;i="5.70,521,1574121600"; d="scan'208";a="29650169"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1e-27fb8269.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 06 Mar 2020 11:24:24 +0000
Received: from EX13MTAUWA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-27fb8269.us-east-1.amazon.com (Postfix) with ESMTPS
 id 1695AA231B; Fri,  6 Mar 2020 11:24:21 +0000 (UTC)
Received: from EX13P01UWA002.ant.amazon.com (10.43.160.46) by
 EX13MTAUWA001.ant.amazon.com (10.43.160.118) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 6 Mar 2020 11:24:20 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX13P01UWA002.ant.amazon.com (10.43.160.46) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 6 Mar 2020 11:24:20 +0000
Received: from u2f063a87eabd5f.cbg10.amazon.com (10.125.106.135) by
 mail-relay.amazon.com (10.43.160.118) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Fri, 6 Mar 2020 11:24:18 +0000
From: <paul@xen.org>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 6 Mar 2020 11:24:17 +0000
Message-ID: <20200306112417.6458-1-paul@xen.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH] MAINTAINERS: Update my entries (again again)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Paul Durrant <pdurrant@amzn.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogUGF1bCBEdXJyYW50IDxwZHVycmFudEBhbXpuLmNvbT4KClVuZm9ydHVuYXRlbHkgSSBu
ZWVkIHRvIHN0b3AgdXNpbmcgYWxsIG15IEFtYXpvbiBlbWFpbCBhZGRyZXNzZXMgZm9yIGFsbApv
cGVuIHNvdXJjZSB3b3JrLgoKU2lnbmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxwYXVsQHhlbi5v
cmc+Ci0tLQpDYzogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KQ2M6
IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT4KQ2M6IElhbiBKYWNrc29u
IDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgpDYzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1
c2UuY29tPgpDYzogSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4KQ2M6IFN0ZWZhbm8gU3Rh
YmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KQ2M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+
Ci0tLQogTUFJTlRBSU5FUlMgfCA4ICsrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRp
b25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL01BSU5UQUlORVJTIGIvTUFJTlRB
SU5FUlMKaW5kZXggNzVmMTFiMjRiNS4uOGE0Yzg2OTcwNCAxMDA2NDQKLS0tIGEvTUFJTlRBSU5F
UlMKKysrIGIvTUFJTlRBSU5FUlMKQEAgLTI1MCw3ICsyNTAsNyBAQCBGOgl4ZW4vaW5jbHVkZS9w
dWJsaWMvYXJjaC1hcm0vCiBGOgl4ZW4vaW5jbHVkZS9wdWJsaWMvYXJjaC1hcm0uaAogCiBDaGFu
Z2UgTG9nCi1NOglQYXVsIER1cnJhbnQgPHBkdXJyYW50QGFtem4uY29tPgorTToJUGF1bCBEdXJy
YW50IDxwYXVsQHhlbi5vcmc+CiBSOglDb21tdW5pdHkgTWFuYWdlciA8Y29tbXVuaXR5Lm1hbmFn
ZXJAeGVucHJvamVjdC5vcmc+CiBTOglNYWludGFpbmVkCiBGOglDSEFOR0VMT0cubWQKQEAgLTMy
Myw3ICszMjMsNyBAQCBGOgl4ZW4vYXJjaC94ODYvY3B1L3ZwbXVfaW50ZWwuYwogCiBJT01NVSBW
RU5ET1IgSU5ERVBFTkRFTlQgQ09ERQogTToJSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29t
PgotTToJUGF1bCBEdXJyYW50IDxwZHVycmFudEBhbXpuLmNvbT4KK006CVBhdWwgRHVycmFudCA8
cGF1bEB4ZW4ub3JnPgogUzoJU3VwcG9ydGVkCiBGOgl4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC8K
IFg6CXhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC8KQEAgLTUzOCw3ICs1MzgsNyBAQCBGOgl0
b29scy90ZXN0cy9jcHUtcG9saWN5LwogRjoJdG9vbHMvdGVzdHMveDg2X2VtdWxhdG9yLwogCiBY
ODYgSS9PIEVNVUxBVElPTgotTToJUGF1bCBEdXJyYW50IDxwZHVycmFudEBhbXpuLmNvbT4KK006
CVBhdWwgRHVycmFudCA8cGF1bEB4ZW4ub3JnPgogUzoJU3VwcG9ydGVkCiBGOgl4ZW4vYXJjaC94
ODYvaHZtL2VtdWxhdGUuYwogRjoJeGVuL2FyY2gveDg2L2h2bS9pbnRlcmNlcHQuYwpAQCAtNTcy
LDcgKzU3Miw3IEBAIFM6CU1haW50YWluZWQKIEY6CXhlbi9hcmNoL3g4Ni9tbS9zaGFkb3cvCiAK
IFg4NiBWSVJJRElBTiBFTkxJR0hURU5NRU5UUwotTToJUGF1bCBEdXJyYW50IDxwZHVycmFudEBh
bXpuLmNvbT4KK006CVBhdWwgRHVycmFudCA8cGF1bEB4ZW4ub3JnPgogTToJV2VpIExpdSA8d2xA
eGVuLm9yZz4KIFM6CVN1cHBvcnRlZAogRjoJeGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi8KLS0g
CjIuMjAuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
