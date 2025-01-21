Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF60A17B42
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jan 2025 11:18:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.875258.1285704 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taBKN-0002GZ-PM; Tue, 21 Jan 2025 10:17:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 875258.1285704; Tue, 21 Jan 2025 10:17:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taBKN-0002Ev-LI; Tue, 21 Jan 2025 10:17:47 +0000
Received: by outflank-mailman (input) for mailman id 875258;
 Tue, 21 Jan 2025 10:17:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fb3U=UN=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1taBKM-0002Ep-C9
 for xen-devel@lists.xenproject.org; Tue, 21 Jan 2025 10:17:46 +0000
Received: from fforwardh-b2-smtp.messagingengine.com
 (fforwardh-b2-smtp.messagingengine.com [202.12.124.197])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f3799fb8-d7e0-11ef-99a4-01e77a169b0f;
 Tue, 21 Jan 2025 11:17:43 +0100 (CET)
Received: from phl-compute-06.internal (phl-compute-06.phl.internal
 [10.202.2.46])
 by mailfforwardh.stl.internal (Postfix) with ESMTP id E1FE21740127;
 Tue, 21 Jan 2025 05:17:41 -0500 (EST)
Received: from phl-frontend-02 ([10.202.2.161])
 by phl-compute-06.internal (MEProxy); Tue, 21 Jan 2025 05:17:42 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 21 Jan 2025 05:17:39 -0500 (EST)
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
X-Inumbo-ID: f3799fb8-d7e0-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1737454661; x=1737541061; bh=OBw60GEEhVQWibPY0f38eIS0+A3cujIKzzL
	MMlGQtkI=; b=U0M5Y1WW1639D8DhQqTaOGPUFzQizqxKkqpp18ak0sfXgsWImAx
	UoHNZgny8E5SAUr+v+FSs1IoMWAF4SrJvLkJX1ugvWMLD0SmAM7Y0DvCOIqtW5Po
	pwIM3QcJFT67rLJTR/QvRnytGJ4xwlWEpl20EnpKWiyigXc2UJ1Vn4fQax/knrJe
	o8sxOGgFN4efRHZ7XfoY+TwIX6cO9YRdQS+6e465ydXUmEXw5A+VZS2agaOe6BJQ
	Q7Pa9j82mt/vaLx6dX+2A6vBBXDAy75NfKNu987zXWh5a0fuOw78ZnLKgZR92JTj
	GtjeCs63vN9YJdcKuJm/zPTitIJZLfU1tyw==
X-ME-Sender: <xms:RHSPZ2hmbNtoj0wKMHCvGzXogxRZqHGmatrdKzJJnIz6jqk6Uk9dQw>
    <xme:RHSPZ3Am_7AbC_2afDjJShvj0CeQmoR-EEZIyC8DzaqCw36k647t-xPsMIANsyMMj
    TjpW-l7cdGNA18la3I>
X-ME-Received: <xmr:RHSPZ-FVzB9Bh2PtHEZ-SMSilufk_8tBGE9v-FKoRGvPw6HOcusykx-c6TraKywgnfIiVwdQwhk37r2KfrF6jCUI4FY-tQacfs8XUnmEzuyzMOJg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudejuddgudefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephffvvefufffkofgggfestdekredtredttdenucfh
    rhhomhepufgvrhhgihihucfmihgsrhhikhcuoefuvghrghhihigpmfhisghrihhksegvph
    grmhdrtghomheqnecuggftrfgrthhtvghrnhepgedvfeefhfduvdetkeegleeggfelheek
    veeiuddufeehtdehleelhfekiedvvedvnecuffhomhgrihhnpehkvghrnhgvlhdrohhrgh
    enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsrghk
    ihgssegurghrkhhsthgrrhdrshhithgvpdhnsggprhgtphhtthhopedvvddpmhhouggvpe
    hsmhhtphhouhhtpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhp
    rhhojhgvtghtrdhorhhgpdhrtghpthhtohepshgvrhhgihihpghkihgsrhhikhesvghprg
    hmrdgtohhmpdhrtghpthhtohepjhhulhhivghnseigvghnrdhorhhgpdhrtghpthhtohep
    sggvrhhtrhgrnhgurdhmrghrqhhuihhssegrrhhmrdgtohhmpdhrtghpthhtohepmhhitg
    hhrghlrdhorhiivghlsegrmhgurdgtohhmpdhrtghpthhtohepvhholhhougihmhihrhgp
    sggrsggthhhukhesvghprghmrdgtohhmpdhrtghpthhtoheprghnughrvgifrdgtohhoph
    gvrhefsegtihhtrhhigidrtghomhdprhgtphhtthhopegrnhhthhhonhihrdhpvghrrghr
    ugesvhgrthgvshdrthgvtghhpdhrtghpthhtohepjhgsvghulhhitghhsehsuhhsvgdrtg
    homh
X-ME-Proxy: <xmx:RHSPZ_QieK1_Xks3ahqP2RuG3y-uIOyQImNZ7cjeBmi5WF54U8VncQ>
    <xmx:RHSPZzzewdg1B7SVA5FzYF9ZasFPPAACQ_7HrBmOCG15KiaRgviY5g>
    <xmx:RHSPZ94jbOA-cMHLhipmmsT-8MBv4GmQrmt_y1XtG_E_6Q3nT6t0rA>
    <xmx:RHSPZwxLir330FpAOuRQtZU8OuwpKad6wUSVLwXT8s0InGr_HYg2uQ>
    <xmx:RHSPZ_iID5Or8hlS37cBQ79ppiF5Tp42VB9RFiWg9s6SYqbyx4H7Dg>
    <xmx:RXSPZxpDWjrCQsiaEa9gB3bqD8nN-XVf_U3BVzfDa1fWELBuqlwSdHBKbNtW>
Feedback-ID: if7fb09ee:Fastmail
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 0/4] make build of vm_event/mem_access/monitor optional
Date: Tue, 21 Jan 2025 12:17:36 +0200
Message-Id: <cover.1737452864.git.Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series aims to provide a possibility to build Xen without mem_access and
related features. It is already largely covered by corresponding
CONFIG_MEM_ACCESS option, yet there're still some parts remaining.
Hopefully this would help to reduce dead code a bit.

As coverage of MEM_ACCESS config option begins to extend beyond actual
mem_access code it has been suggested to rename it into VM_EVENT, as a more
general option controlling mem_access, vm_event and monitor code.

v1 patch here:
https://lore.kernel.org/xen-devel/20241230063051.3332332-1-Sergiy_Kibrik@epam.com/

  -Sergiy

Sergiy Kibrik (3):
  xen: kconfig: rename MEM_ACCESS -> VM_EVENT
  x86:monitor: control monitor.c build with CONFIG_VM_EVENT option
  automation: rename CONFIG_MEM_ACCESS -> CONFIG_VM_EVENT

Stefano Stabellini (1):
  xen: mem_access: conditionally compile vm_event.c & monitor.c

 automation/eclair_analysis/xen_arm_config |  2 +-
 automation/eclair_analysis/xen_x86_config |  2 +-
 automation/gitlab-ci/build.yaml           |  2 +-
 xen/arch/arm/Makefile                     |  6 +++---
 xen/arch/arm/configs/tiny64_defconfig     |  2 +-
 xen/arch/arm/include/asm/mem_access.h     |  4 ++--
 xen/arch/arm/vsmc.c                       |  3 ++-
 xen/arch/ppc/configs/ppc64_defconfig      |  2 +-
 xen/arch/riscv/configs/tiny64_defconfig   |  2 +-
 xen/arch/x86/Makefile                     |  2 +-
 xen/arch/x86/mm/Makefile                  |  2 +-
 xen/common/Kconfig                        |  2 +-
 xen/common/Makefile                       |  6 +++---
 xen/common/domctl.c                       |  2 +-
 xen/include/xen/mem_access.h              |  6 +++---
 xen/include/xen/monitor.h                 |  9 +++++++++
 xen/include/xen/vm_event.h                | 14 +++++++++++---
 xen/include/xsm/dummy.h                   |  2 +-
 xen/include/xsm/xsm.h                     |  4 ++--
 xen/xsm/dummy.c                           |  2 +-
 xen/xsm/flask/hooks.c                     |  4 ++--
 21 files changed, 49 insertions(+), 31 deletions(-)

-- 
2.25.1


