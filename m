Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C217BBF3D
	for <lists+xen-devel@lfdr.de>; Fri,  6 Oct 2023 20:55:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.613802.954572 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qopxt-0000ZD-N5; Fri, 06 Oct 2023 18:54:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 613802.954572; Fri, 06 Oct 2023 18:54:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qopxt-0000XG-Jo; Fri, 06 Oct 2023 18:54:21 +0000
Received: by outflank-mailman (input) for mailman id 613802;
 Fri, 06 Oct 2023 18:54:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LN/y=FU=citrix.com=prvs=63610b956=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qopxr-0000VZ-K6
 for xen-devel@lists.xenproject.org; Fri, 06 Oct 2023 18:54:19 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bd9498bb-6479-11ee-9b0d-b553b5be7939;
 Fri, 06 Oct 2023 20:54:15 +0200 (CEST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: bd9498bb-6479-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1696618455;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Om+X/N6E2jDFei7jy3ZFPxBuupW7Zfo7NoJMoWmL0Ik=;
  b=BspI1zR0fx1RPXc1JVuMChqHEwBY729Oaw0kSXKiAViRer1LRMzBOwA4
   HGQ/eqOFEXayQahvM/WHvi6aclKlw3bAuyimOwUv4UVzjMHwDdjhqGOWi
   n0fsisAuSnm4AHlo1/4vjIRp2bLR5zVcp/q6BOZ3RnAbBMP4VTMRD9rlO
   U=;
X-CSE-ConnectionGUID: FvEREW8TSwKmhlQAgEn1mw==
X-CSE-MsgGUID: hjgEgPX5RSq2XyppzJs/xQ==
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 125288251
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.159.70
X-Policy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:ocEy7asMSPjCdeYdj2BLibeXN+fnVIFeMUV32f8akzHdYApBsoF/q
 tZmKW+PPvePZDPzL4wgb4q+9hgAup7Uz9NnSQBoqXpnQi0R+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVaicfHg3HFc4IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4rKq41v0gnRkPaoQ5QeGySFMZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwBi4gVD28196N35G+Su1Vr8sOKpDuI9ZK0p1g5Wmx4fcORJnCR+PB5MNC3Sd2jcdLdRrcT
 5NHM3w1Nk2GOkAefAhPYH49tL7Aan3XWjtUsl+K44Ew5HDe1ldZ27nxKtvFPNeNQK25m27B/
 D+crzSjX0hy2Nq3yTiK332UtrL1pjqhaJMKDK+a7bl6uQjGroAUIEJPDgbqyRWjsWauVtQaJ
 0EK9y4Gqakp6FftXtT7Rwe/onOPolgbQdU4O88Q5RyJy6HUyx2EHWVCRTlEAPQ9r9M/TzEu0
 l6PnvvqCCZpvbnTTmiSnp+LqRuiNC5TKnUNDQcGUA8E7t/LsIw1yBXVQb5LFa++jtTxXzbq0
 T2OhCE7i/MYistj/4W2+0rWxQ2loJfhRxQwoA7QWwqYAhhRPdD/IdbysB6CsKcGc97xokS9U
 GYstdaz1s0xXa22iw+IQOE0Nb6E4a+AL2iJ6bJwJKXN5whB6lb6I9EOvWAuehwwWioXUWW3O
 hKP52u98LcWbCPzMvEtC26kI5lypZUMA+gJQRw9gjBmWp90bAaB+2lEaEeb3wgBe2B3yvlhZ
 /93nSu2ZEv26JiLLxLsHY/xKZdxmkgDKZr7HPgXNSiP37uEf2KyQrwYKlaIZe1RxPra8VuIq
 I4ObpPUl0Q3vAjCjs7/qNF7ELz3BSJjWcCeRzJ/KYZv3TaK6El+UqSMkNvNiqRunrhPl/egw
 51OchYw9bYLvlWecV/iQik6NNvSsWNX8SpT0doEYQz5hBDOoO+HsM8iSnfAVeN3qrQzkK8lE
 KFtlgfpKq0ndwkrMg81NfHVxLGOvjzy7e5SF0JJuAQCQqM=
IronPort-HdrOrdr: A9a23:lmKNDqCu3k+qvWvlHeme55DYdb4zR+YMi2TDtnofdfUxSKelfq
 +V7ZAmPHPP6Qr5IUtQ+uxoW5PvfZq/z+8W3WB5B97LNmSLhILPFvAG0WKI+V3d8kPFh5dg/J
 YlX69iCMDhSXhW5PyKmDVQyuxQp+VvJprY49vj8w==
X-Talos-CUID: 9a23:ImPhjWM4pFTqYu5DdjdKzmMrSvwebV7YzHPpCkCVDz9sV+jA
X-Talos-MUID: 9a23:avAD0wY+x9vBbeBTtz3jqT5aBJpS2L30OFEViYckoI6UDHkl
X-IronPort-AV: E=Sophos;i="6.03,204,1694750400"; 
   d="scan'208";a="125288251"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Jan Beulich <JBeulich@suse.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
	<julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, Henry Wang
	<Henry.Wang@arm.com>
Subject: [PATCH for-4.18 v2 0/2] docs:Clarify that only 5 hypercall parameters are supported
Date: Fri, 6 Oct 2023 19:54:00 +0100
Message-ID: <20231006185402.1098400-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

An extention to the original patch Michal did, providing the historical
context.

Arguably for backport to 4.17.

Andrew Cooper (1):
  docs/spnix: Switch hypercall-abi.rst to named footnotes

Michal Orzel (1):
  x86: Clarify that only 5 hypercall parameters are supported

 docs/guest-guide/x86/hypercall-abi.rst   | 39 ++++++++++++++----------
 xen/include/public/arch-x86/xen-x86_32.h |  2 +-
 xen/include/public/arch-x86/xen-x86_64.h |  2 +-
 3 files changed, 25 insertions(+), 18 deletions(-)


base-commit: 01343f99de858c7e24bcfcb4ad4fc584559bcc08
-- 
2.30.2


