Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D30DF9F7A1C
	for <lists+xen-devel@lfdr.de>; Thu, 19 Dec 2024 12:14:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.861089.1273077 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOETJ-0005hu-Ae; Thu, 19 Dec 2024 11:13:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 861089.1273077; Thu, 19 Dec 2024 11:13:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOETJ-0005f6-7Z; Thu, 19 Dec 2024 11:13:37 +0000
Received: by outflank-mailman (input) for mailman id 861089;
 Thu, 19 Dec 2024 11:13:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=niuL=TM=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1tOETH-0005f0-Nw
 for xen-devel@lists.xenproject.org; Thu, 19 Dec 2024 11:13:35 +0000
Received: from fforwardh-b1-smtp.messagingengine.com
 (fforwardh-b1-smtp.messagingengine.com [202.12.124.196])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 484d0bf8-bdfa-11ef-99a3-01e77a169b0f;
 Thu, 19 Dec 2024 12:13:33 +0100 (CET)
Received: from phl-compute-04.internal (phl-compute-04.phl.internal
 [10.202.2.44])
 by mailfforwardh.stl.internal (Postfix) with ESMTP id AD85F174015E;
 Thu, 19 Dec 2024 06:13:31 -0500 (EST)
Received: from phl-frontend-02 ([10.202.2.161])
 by phl-compute-04.internal (MEProxy); Thu, 19 Dec 2024 06:13:31 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 Dec 2024 06:13:29 -0500 (EST)
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
X-Inumbo-ID: 484d0bf8-bdfa-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1734606811; x=1734693211; bh=EscSh3aArqHkcMCznEYltHV1sY9EFHqbKJX
	WGqeYTLE=; b=v8w0q5PBDhAbHZdIuL+KVlfajAoXlEqWmo/tOZsj1QSN/C0itCE
	8ufdqFu3S5OTQJDrwFD7GGo2K5PHgRiXOZb0wMkL+6yVGWz313etEqwMr6im+Rcc
	F0S2dTVAlY/QxArSM0vkFmdxcTgroJJ2knbUYNB+MZ1+aLYlRFVA03zZN4YqRgbL
	8WgLq+xMpC5wOCVojH5GFmtTzTEmky6WUOlDcuG2KODnrC8bI3HuI4kwCq3y2/q2
	xLKnKE8ID9UEV24AblyxAYgAvClylBooThP+cTn1Z29h8lXdEwMsaR3yvbD5KU0j
	AQQ155iV/MRKi0jmYyYJYThIa+zz6iQv14A==
X-ME-Sender: <xms:2v9jZ992YyeDB8T8_JCu3ctR7zt0-GBU_Qt5TkBWP72UXKQtJAfrTw>
    <xme:2v9jZxsTsGGIX6jfwt589KcDA9dTbAeTanSzuIyDG0C0QXtpHDYWQG8pD0q0FhM_U
    y516Pxumu-kDrzj3hk>
X-ME-Received: <xmr:2v9jZ7C8ZsdK3iTHkEzyVCglUh2akDiVeJ4upg4mx-E5GO-un5-WO1yDhiF3XYGC727JHoZKJGdDYJ3P0UHbFro-ocQor5rjtYODWkDPuUgYOKTs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddruddttddgvdegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephffvvefufffkofgggfestdekredtredttdenucfh
    rhhomhepufgvrhhgihihucfmihgsrhhikhcuoefuvghrghhihigpmfhisghrihhksegvph
    grmhdrtghomheqnecuggftrfgrthhtvghrnhepffffvdeifeeijefhheefuedvvedtheff
    jeeiveehgfettedvgedujefgudejgedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomhepshgrkhhisgesuggrrhhkshhtrghrrdhsihhtvgdpnhgs
    pghrtghpthhtohepledpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepgigvnhdqug
    gvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdhrtghpthhtohepshgv
    rhhgihihpghkihgsrhhikhesvghprghmrdgtohhmpdhrtghpthhtohepjhgsvghulhhitg
    hhsehsuhhsvgdrtghomhdprhgtphhtthhopegrnhgurhgvfidrtghoohhpvghrfeestghi
    thhrihigrdgtohhmpdhrtghpthhtoheprhhoghgvrhdrphgruhestghithhrihigrdgtoh
    hmpdhrtghpthhtoheprghnthhhohhnhidrphgvrhgrrhgusehvrghtvghsrdhtvggthhdp
    rhgtphhtthhopehmihgthhgrlhdrohhriigvlhesrghmugdrtghomhdprhgtphhtthhope
    hjuhhlihgvnhesgigvnhdrohhrghdprhgtphhtthhopehsshhtrggsvghllhhinhhisehk
    vghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:2v9jZxfjZwuSD_xOUJS0OrjeAXWW6PJytnh2WeUdGM6ec7mWnn7aWw>
    <xmx:2v9jZyMfurhKT1DIB6IlndNQsqiQfGu5Ej6WGevO32xJ9WHizgQ3Xw>
    <xmx:2v9jZzlQY25wF3ZSmh84uwGoOQgIndHMYKDdrBUmFlLl01_6hnEXZA>
    <xmx:2v9jZ8vvhQ_J4z1lftM4aNWTrsLlUfPwih3p3Xl0cpRfgwooVbxK6Q>
    <xmx:2_9jZxeagOgAKCsaJzWG1g_mc_aKc7728J4-dmAP3LuoryfNVRQVughQdZXH>
Feedback-ID: i5d798b77:Fastmail
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
Subject: [XEN PATCH] ioreq: fix check for CONFIG_ARCH_VCPU_IOREQ_COMPLETION
Date: Thu, 19 Dec 2024 13:13:26 +0200
Message-Id: <20241219111326.3031000-1-Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It should be CONFIG_ARCH_VCPU_IOREQ_COMPLETION (as in Kconfig) and not
misspelled CONFIG_VCPU_ARCH_IOREQ_COMPLETION.
Bug introduced by:

979cfdd3e5 ioreq: do not build arch_vcpu_ioreq_completion() for non-VMX configurations

Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
---
 xen/arch/x86/hvm/ioreq.c | 2 +-
 xen/include/xen/ioreq.h  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/hvm/ioreq.c b/xen/arch/x86/hvm/ioreq.c
index 5c3d0c69aa..d6491df8e7 100644
--- a/xen/arch/x86/hvm/ioreq.c
+++ b/xen/arch/x86/hvm/ioreq.c
@@ -29,7 +29,7 @@ bool arch_ioreq_complete_mmio(void)
     return handle_mmio();
 }
 
-#ifdef CONFIG_VCPU_ARCH_IOREQ_COMPLETION
+#ifdef CONFIG_ARCH_VCPU_IOREQ_COMPLETION
 bool arch_vcpu_ioreq_completion(enum vio_completion completion)
 {
     switch ( completion )
diff --git a/xen/include/xen/ioreq.h b/xen/include/xen/ioreq.h
index 29a17e8ff5..4f3c6b598d 100644
--- a/xen/include/xen/ioreq.h
+++ b/xen/include/xen/ioreq.h
@@ -112,7 +112,7 @@ int ioreq_server_dm_op(struct xen_dm_op *op, struct domain *d, bool *const_op);
 
 bool arch_ioreq_complete_mmio(void);
 
-#ifdef CONFIG_VCPU_ARCH_IOREQ_COMPLETION
+#ifdef CONFIG_ARCH_VCPU_IOREQ_COMPLETION
 bool arch_vcpu_ioreq_completion(enum vio_completion completion);
 #else
 static inline bool arch_vcpu_ioreq_completion(enum vio_completion completion)
-- 
2.25.1


