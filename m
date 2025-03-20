Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A05A6A3BA
	for <lists+xen-devel@lfdr.de>; Thu, 20 Mar 2025 11:32:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.921651.1325438 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvDCW-0000p8-U5; Thu, 20 Mar 2025 10:32:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 921651.1325438; Thu, 20 Mar 2025 10:32:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvDCW-0000nT-Qf; Thu, 20 Mar 2025 10:32:36 +0000
Received: by outflank-mailman (input) for mailman id 921651;
 Thu, 20 Mar 2025 10:32:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5Eqg=WH=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1tvDCV-0000nL-6H
 for xen-devel@lists.xenproject.org; Thu, 20 Mar 2025 10:32:35 +0000
Received: from fforwardh-b4-smtp.messagingengine.com
 (fforwardh-b4-smtp.messagingengine.com [202.12.124.199])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a120daaf-0576-11f0-9ffa-bf95429c2676;
 Thu, 20 Mar 2025 11:32:32 +0100 (CET)
Received: from phl-compute-12.internal (phl-compute-12.phl.internal
 [10.202.2.52])
 by mailfforwardh.stl.internal (Postfix) with ESMTP id 128551740241;
 Thu, 20 Mar 2025 06:32:31 -0400 (EDT)
Received: from phl-frontend-01 ([10.202.2.160])
 by phl-compute-12.internal (MEProxy); Thu, 20 Mar 2025 06:32:31 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 20 Mar 2025 06:32:29 -0400 (EDT)
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
X-Inumbo-ID: a120daaf-0576-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1742466750; x=1742553150; bh=QIBJiemfl/U8NEJw8eqqbLerNyu5yd8wdV/
	F9ndrYNc=; b=zieYtrEB+Z6LPeTEWWmrv1PkPvwHadYV6ylzJ3ulhk0MtXTrKHj
	rBI2QPmnmzzGV2RykD/Hjut3/HBaw69p8+4NxpOQhXdFBtYhP9lOFc+kxNky39Ow
	yoCpmTrAqiyWZ4CarOKYKtDeEMuHkjlZrPj/50rEZN6tHtcIXxSO6eHH8ulUxue+
	GNItHTzLNmWXrpmJBOg6zc3L1kd+7IW16vsAjg7PbUdqd+l9XwbYibcjC6Z+0kI9
	nCeoMRmgFtDcf6vtyGrAPKU2DMc79NTq0lCafRh4S3DXq+9tvmhUPANBrZMvEuQM
	036OdRwV6uf/YDwxBhs5ViFJ0PAGh4vhy0Q==
X-ME-Sender: <xms:vu7bZw83Qu4GlCM92TYq6plq1lkDmjQ4Lgw53De4jqexcUCdYhWbcQ>
    <xme:vu7bZ4sHc_vi72UHQsc2WYXd8CkwaN2boRbqhr3kJKwsu00kYAOwkJ2TSIsxAD8yK
    ztVbTM95RpP8wJoBqI>
X-ME-Received: <xmr:vu7bZ2BwRd6dZBH15kk6YJCBLuZf1lWsuCFVpu5EYs4dpPwzD5b3Ldpi-3WTpmLI1n2fU0_CInbGw5_ZF7ah8ENqwNo7PzFYY2h27NWFIfi7LA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddugeejleekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgggfestdekredtredttden
    ucfhrhhomhepufgvrhhgihihucfmihgsrhhikhcuoefuvghrghhihigpmfhisghrihhkse
    gvphgrmhdrtghomheqnecuggftrfgrthhtvghrnhepffffvdeifeeijefhheefuedvvedt
    heffjeeiveehgfettedvgedujefgudejgedvnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepshgrkhhisgesuggrrhhkshhtrghrrdhsihhtvgdp
    nhgspghrtghpthhtohepiedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepgigvnh
    dquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdhrtghpthhtohep
    shgvrhhgihihpghkihgsrhhikhesvghprghmrdgtohhmpdhrtghpthhtohepjhgsvghulh
    hitghhsehsuhhsvgdrtghomhdprhgtphhtthhopegrnhgurhgvfidrtghoohhpvghrfees
    tghithhrihigrdgtohhmpdhrtghpthhtoheprhhoghgvrhdrphgruhestghithhrihigrd
    gtohhmpdhrtghpthhtohepshhsthgrsggvlhhlihhniheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:vu7bZweF6iOpFgeTrZQvCuc5w08_kQJF59WwRLpGlMHohOcagxawSQ>
    <xmx:vu7bZ1OyFu9851HjFHfBKzs8ICIVCyRYK3KSMHHghXReNzW5PzYF-A>
    <xmx:vu7bZ6kbSxATNYeZAb2IFQwDg1viHg1291kgWSmN15aOlFxJbtbtRA>
    <xmx:vu7bZ3suPus7dSSblJhbxn0KUnS3hm7sjTlq_s2EjA7d7nNg-NxXpQ>
    <xmx:vu7bZzsZUZOhTXJEM_AO7D1cnT6dpeo2A5ZccltkwYjaLFN9cI8R6A>
    <xmx:vu7bZ42XGAe-kHOwLtfYHFkB3XiJtOvKJ16IWUse16R-FwgUNRJm2AdEmepo>
Feedback-ID: ifdffe1b6:Fastmail
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH v1 0/4] make nested virtualization support optional
Date: Thu, 20 Mar 2025 12:32:26 +0200
Message-Id: <cover.1742465624.git.Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Here're a couple of patches that introduce a Kconfig control for user to be
able to remove nested HVM code from the build and hence to tune their system
in case nested VMs aren't required.

The first two patches are minor fixes and not directly related to nested HVM,
but since they also modify the same code I've decided to include them too.

 -Sergiy

Sergiy Kibrik (4):
  x86:svm: use nsvm_efer_svm_enabled() to check guest's EFER.SVME
  x86:svm: rename svm/nestedhvm.h -> svm/nestedsvm.h
  x86:hvm: guard calls to nestedhvm routines
  x86:hvm: make nestedhvm support optional

 xen/arch/x86/Kconfig                              |  5 +++++
 xen/arch/x86/hvm/Makefile                         |  2 +-
 xen/arch/x86/hvm/hvm.c                            |  6 ++++--
 xen/arch/x86/hvm/svm/Makefile                     |  2 +-
 xen/arch/x86/hvm/svm/asid.c                       |  2 +-
 xen/arch/x86/hvm/svm/entry.S                      |  2 ++
 xen/arch/x86/hvm/svm/intr.c                       |  2 +-
 xen/arch/x86/hvm/svm/nestedsvm.c                  |  2 +-
 xen/arch/x86/hvm/svm/{nestedhvm.h => nestedsvm.h} |  0
 xen/arch/x86/hvm/svm/svm.c                        | 14 +++++++++-----
 xen/arch/x86/hvm/vmx/Makefile                     |  2 +-
 xen/arch/x86/hvm/vmx/entry.S                      |  2 ++
 xen/arch/x86/hvm/vmx/vmcs.c                       |  8 +++++---
 xen/arch/x86/hvm/vmx/vmx.c                        | 10 +++++++++-
 xen/arch/x86/include/asm/hvm/nestedhvm.h          | 10 +++++++++-
 15 files changed, 51 insertions(+), 18 deletions(-)
 rename xen/arch/x86/hvm/svm/{nestedhvm.h => nestedsvm.h} (100%)

-- 
2.25.1


