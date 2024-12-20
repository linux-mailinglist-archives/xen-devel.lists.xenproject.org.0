Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 026C99F8F17
	for <lists+xen-devel@lfdr.de>; Fri, 20 Dec 2024 10:36:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.861767.1273837 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOZPo-0004Cw-FK; Fri, 20 Dec 2024 09:35:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 861767.1273837; Fri, 20 Dec 2024 09:35:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOZPo-00049n-Bs; Fri, 20 Dec 2024 09:35:24 +0000
Received: by outflank-mailman (input) for mailman id 861767;
 Fri, 20 Dec 2024 09:35:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0BOr=TN=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1tOZPn-00049h-91
 for xen-devel@lists.xenproject.org; Fri, 20 Dec 2024 09:35:23 +0000
Received: from fforwardh-a4-smtp.messagingengine.com
 (fforwardh-a4-smtp.messagingengine.com [103.168.172.199])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id baffb1b6-beb5-11ef-a0d8-8be0dac302b0;
 Fri, 20 Dec 2024 10:35:21 +0100 (CET)
Received: from phl-compute-06.internal (phl-compute-06.phl.internal
 [10.202.2.46])
 by mailfforwardh.phl.internal (Postfix) with ESMTP id 4730929203AB;
 Fri, 20 Dec 2024 04:35:20 -0500 (EST)
Received: from phl-frontend-01 ([10.202.2.160])
 by phl-compute-06.internal (MEProxy); Fri, 20 Dec 2024 04:35:20 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 20 Dec 2024 04:35:18 -0500 (EST)
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
X-Inumbo-ID: baffb1b6-beb5-11ef-a0d8-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1734687320; x=1734773720; bh=LzTGkTHoecYoA/dqJZrgdRgbPpIb3Oy/ciY
	AfsPJtq0=; b=YaSJ7XaUy6o/0GhnLXJXCTbw1/0VWlcY9ScVzAcZFrqF41as126
	p4Aus+uJD5VcDo/BajFTfbe8lDdTSO/aHX8pKYheXYc0+9NckFZrI6uQuePhoGXs
	PinFZRSrfUmkE5Y6TAW0tkTvG9SYtL+1+X4Wo4NxjF4fS4K8jPAjIpSJ9dwjhQB/
	9Z9qKXwO1IezcYEN5vxQyBvrp+m5rHZQQfnE8atgpUaeHSLahh3yKNykQDcxOVG1
	Ic0f58uI/le5yGxiifW8FbzJZjKP7GEvXsTOyRo/WJ9UanXuTxK6qlFjCpoBe8Hx
	hlH3xdu0vxveRfzQluelsncof4kfnnM8w1w==
X-ME-Sender: <xms:VzplZ82yFElDwvBfe6B_KBwJFsqQsjti4z7R-XZj9sK3i0cCSCjusA>
    <xme:VzplZ3FrZpln46upKameE5_Hj_s_U0VnRfaciEVejCTS1mOGWOlG87OgK4zBqK05y
    wbsRHGUL_02FHCLOV4>
X-ME-Received: <xmr:VzplZ06dr1bQ_gXwKULSS6cC4VwexW_QhLyusGmeiJhw2Gq8keqcOxEW1ZpLpVNWJyLAG68yxtbi13XqnDCW2MQHKyfYeDKYK4d633pP4wjMVy_b>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddruddtvddgtdefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephffvvefufffkofgggfestdekredtredttdenucfh
    rhhomhepufgvrhhgihihucfmihgsrhhikhcuoefuvghrghhihigpmfhisghrihhksegvph
    grmhdrtghomheqnecuggftrfgrthhtvghrnhepgedvfeefhfduvdetkeegleeggfelheek
    veeiuddufeehtdehleelhfekiedvvedvnecuffhomhgrihhnpehkvghrnhgvlhdrohhrgh
    enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsrghk
    ihgssegurghrkhhsthgrrhdrshhithgvpdhnsggprhgtphhtthhopeelpdhmohguvgepsh
    hmthhpohhuthdprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhr
    ohhjvggtthdrohhrghdprhgtphhtthhopehsvghrghhihigpkhhisghrihhksegvphgrmh
    drtghomhdprhgtphhtthhopehjsggvuhhlihgthhesshhushgvrdgtohhmpdhrtghpthht
    oheprghnughrvgifrdgtohhophgvrhefsegtihhtrhhigidrtghomhdprhgtphhtthhope
    hrohhgvghrrdhprghusegtihhtrhhigidrtghomhdprhgtphhtthhopegrnhhthhhonhih
    rdhpvghrrghrugesvhgrthgvshdrthgvtghhpdhrtghpthhtohepmhhitghhrghlrdhorh
    iivghlsegrmhgurdgtohhmpdhrtghpthhtohepjhhulhhivghnseigvghnrdhorhhgpdhr
    tghpthhtohepshhsthgrsggvlhhlihhniheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:VzplZ1165ZxnnVviNqPiEV89BZl-Hv2-qXKA2JslV-aOuNn3CcMv5w>
    <xmx:VzplZ_FrpKlHCYtZW5fg_HEYlPzSmGkRjF1OUCEvYKBJleuYNMpP1A>
    <xmx:VzplZ-8XD_V7eqap_yBqBmwxR5i8339nsQ7rvkrFZ4mMaAoYk3BGtg>
    <xmx:VzplZ0l836tNn0viawDQnLiBkLjNtHYV7puT_LcZk8eAS0TOuxzhMA>
    <xmx:WDplZ-2zdcGvTzexOUSA1VxWEeLKLyeSJmVJiqcKt1paovKWs1SqvxYUvzt7>
Feedback-ID: id72fffdc:Fastmail
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH v1] ioreq: allow arch_vcpu_ioreq_completion() to signal an error
Date: Fri, 20 Dec 2024 11:35:14 +0200
Message-Id: <20241220093514.3094521-1-Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Return false from arch_vcpu_ioreq_completion() when completion is not handled.
According to coding-best-practices.pandoc an error should be propagated to
caller, if caller is expecting to handle it, which seems to the case for
callers of arch_vcpu_ioreq_completion().

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
---
This change has been suggested by Jan some time ago during review of another
series, here's link to discussion:
https://lore.kernel.org/xen-devel/952701cd-83d8-4c1f-9f38-ee63ba582d66@suse.com/
---
 xen/arch/x86/hvm/ioreq.c | 2 +-
 xen/include/xen/ioreq.h  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/hvm/ioreq.c b/xen/arch/x86/hvm/ioreq.c
index 5c3d0c69aa..9b1592d505 100644
--- a/xen/arch/x86/hvm/ioreq.c
+++ b/xen/arch/x86/hvm/ioreq.c
@@ -47,7 +47,7 @@ bool arch_vcpu_ioreq_completion(enum vio_completion completion)
 
     default:
         ASSERT_UNREACHABLE();
-        break;
+        return false;
     }
 
     return true;
diff --git a/xen/include/xen/ioreq.h b/xen/include/xen/ioreq.h
index 29a17e8ff5..2583eca0d5 100644
--- a/xen/include/xen/ioreq.h
+++ b/xen/include/xen/ioreq.h
@@ -118,7 +118,7 @@ bool arch_vcpu_ioreq_completion(enum vio_completion completion);
 static inline bool arch_vcpu_ioreq_completion(enum vio_completion completion)
 {
     ASSERT_UNREACHABLE();
-    return true;
+    return false;
 }
 #endif
 
-- 
2.25.1


