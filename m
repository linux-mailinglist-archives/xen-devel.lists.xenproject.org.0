Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA24A6A3C6
	for <lists+xen-devel@lfdr.de>; Thu, 20 Mar 2025 11:34:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.921685.1325467 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvDEV-0002Oo-Mk; Thu, 20 Mar 2025 10:34:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 921685.1325467; Thu, 20 Mar 2025 10:34:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvDEV-0002NY-KB; Thu, 20 Mar 2025 10:34:39 +0000
Received: by outflank-mailman (input) for mailman id 921685;
 Thu, 20 Mar 2025 10:34:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5Eqg=WH=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1tvDEU-00028p-8f
 for xen-devel@lists.xenproject.org; Thu, 20 Mar 2025 10:34:38 +0000
Received: from fforwardh-b4-smtp.messagingengine.com
 (fforwardh-b4-smtp.messagingengine.com [202.12.124.199])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eae78487-0576-11f0-9ffa-bf95429c2676;
 Thu, 20 Mar 2025 11:34:36 +0100 (CET)
Received: from phl-compute-09.internal (phl-compute-09.phl.internal
 [10.202.2.49])
 by mailfforwardh.stl.internal (Postfix) with ESMTP id 05A6A174026D;
 Thu, 20 Mar 2025 06:34:34 -0400 (EDT)
Received: from phl-frontend-02 ([10.202.2.161])
 by phl-compute-09.internal (MEProxy); Thu, 20 Mar 2025 06:34:35 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 20 Mar 2025 06:34:33 -0400 (EDT)
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
X-Inumbo-ID: eae78487-0576-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1742466874; x=1742553274; bh=Z
	vqoqk1j+rIu5ILPWCa0JGJxnaepdFoSJRqpq0naegA=; b=Gn2Eo1Tzdlh03yvJ/
	SxWJkL1Oir9Q5RatAmHmOnlAAweksRBuHlzLaOXvzyluip72eP8T+jvxcvRVzDYY
	xThJRjGS47hrDS9xFYef7JQ9cTDEoBvjjcppDZiYZP/RLZVdOd44zQ1B43s0lFSB
	2+NIbJ+qdq9IN0zmyo134o0WvilP804aljvUjNmNLkj24yrLDf0gkFvZqV/LWJok
	BWJrQTkEGk95+f9LGIgKkFIGHu0tpY2RbfdV3/A6QcMuDBlUhYN6Wti7d/nu77nA
	/BPQ/SwUXt1K+FNGOlzyxwQ4/NhjLkiS+sWH2z+Y+D9h4uGzxLi/owuy9KDfFQ+Z
	c//nQ==
X-ME-Sender: <xms:Ou_bZ-7J_nCqCeiR1Q9frV4Y81tQOYZ9KOSYtYnXfZ2JXZzaNEki0Q>
    <xme:Ou_bZ37qRdm4WwSlokBdv76P6-T4UWsJZDWiMLi1peeO66hK_raUzvtKj3NHFtCyi
    H4VMOEhKp8J7SP23UA>
X-ME-Received: <xmr:Ou_bZ9dj-rrqCFPHgy5YBh74ZVfl-OyInHUTxVjmnku0woxx8ozb_Taw1vfzpJNGZyjSKWF7IhEwZSBlQrpn2otFQR_5w2DZixzW39TF_2fslg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddugeejleelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredt
    tdenucfhrhhomhepufgvrhhgihihucfmihgsrhhikhcuoefuvghrghhihigpmfhisghrih
    hksegvphgrmhdrtghomheqnecuggftrfgrthhtvghrnheptdejgeegvdffkeekleefueev
    gfduheevkedvhfdvkeeludehleegheeivedugfejnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomhepshgrkhhisgesuggrrhhkshhtrghrrdhsihht
    vgdpnhgspghrtghpthhtohepiedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepgi
    gvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdhrtghpthht
    ohepshgvrhhgihihpghkihgsrhhikhesvghprghmrdgtohhmpdhrtghpthhtohepjhgsvg
    hulhhitghhsehsuhhsvgdrtghomhdprhgtphhtthhopegrnhgurhgvfidrtghoohhpvghr
    feestghithhrihigrdgtohhmpdhrtghpthhtoheprhhoghgvrhdrphgruhestghithhrih
    igrdgtohhmpdhrtghpthhtohepshhsthgrsggvlhhlihhniheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:Ou_bZ7IYZ1MNU8IMSeU6rZ9VN0JieUY_uDAjGSsT5hAtxRf-8fKT9g>
    <xmx:Ou_bZyI0cX_OmIK679Z8kKXbK3BbtVseBco6PGpXWqgUca5FH_mkPQ>
    <xmx:Ou_bZ8xaSASljbVK4fd6nohtargUD7yfbdTf9uX-dMDhJ73jXt2Jvg>
    <xmx:Ou_bZ2KCD-Mb8d4SR0Bcy2LBihYTdUia0tWQTVuk8yjak8R0FUUSUw>
    <xmx:Ou_bZ5Zcx9PZTCOqg97mNCtDJuZ6pRMRv_UF27ejDfhmb82O5cojpw>
    <xmx:Ou_bZ0jLUwup_BODSojfNXY8JEMj3VFcNOD0B2MBu-D9tRzVajEijEwZ1jbO>
Feedback-ID: idf2f5561:Fastmail
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH v1 1/4] x86:svm: use nsvm_efer_svm_enabled() to check guest's EFER.SVME
Date: Thu, 20 Mar 2025 12:34:31 +0200
Message-Id: <67e52e38695be12aca828025077a378e92174952.1742465624.git.Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1742465624.git.Sergiy_Kibrik@epam.com>
References: <cover.1742465624.git.Sergiy_Kibrik@epam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There's a macro for this, might improve readability a bit & save a bit of space.

Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
---
 xen/arch/x86/hvm/svm/nestedsvm.c | 2 +-
 xen/arch/x86/hvm/svm/svm.c       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
index 35a2cbfd7d..dc2b6a4253 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -1616,7 +1616,7 @@ void svm_nested_features_on_efer_update(struct vcpu *v)
      * Need state for transfering the nested gif status so only write on
      * the hvm_vcpu EFER.SVME changing.
      */
-    if ( v->arch.hvm.guest_efer & EFER_SVME )
+    if ( nsvm_efer_svm_enabled(v) )
     {
         if ( !vmcb->virt_ext.fields.vloadsave_enable &&
              paging_mode_hap(v->domain) &&
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 4b24891096..e33a38c1e4 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -253,7 +253,7 @@ static void cf_check svm_update_guest_efer(struct vcpu *v)
     vmcb_set_efer(vmcb, guest_efer);
 
     ASSERT(nestedhvm_enabled(v->domain) ||
-           !(v->arch.hvm.guest_efer & EFER_SVME));
+           !nsvm_efer_svm_enabled(v));
 
     if ( nestedhvm_enabled(v->domain) )
         svm_nested_features_on_efer_update(v);
-- 
2.25.1


