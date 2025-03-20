Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0647EA6A3DA
	for <lists+xen-devel@lfdr.de>; Thu, 20 Mar 2025 11:38:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.921714.1325488 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvDIU-0003aL-CA; Thu, 20 Mar 2025 10:38:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 921714.1325488; Thu, 20 Mar 2025 10:38:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvDIU-0003Yt-9D; Thu, 20 Mar 2025 10:38:46 +0000
Received: by outflank-mailman (input) for mailman id 921714;
 Thu, 20 Mar 2025 10:38:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5Eqg=WH=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1tvDIT-0003Yn-Ak
 for xen-devel@lists.xenproject.org; Thu, 20 Mar 2025 10:38:45 +0000
Received: from fforwardh-b4-smtp.messagingengine.com
 (fforwardh-b4-smtp.messagingengine.com [202.12.124.199])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7e7bd635-0577-11f0-9ea0-5ba50f476ded;
 Thu, 20 Mar 2025 11:38:43 +0100 (CET)
Received: from phl-compute-08.internal (phl-compute-08.phl.internal
 [10.202.2.48])
 by mailfforwardh.stl.internal (Postfix) with ESMTP id 6DE461740212;
 Thu, 20 Mar 2025 06:38:42 -0400 (EDT)
Received: from phl-frontend-02 ([10.202.2.161])
 by phl-compute-08.internal (MEProxy); Thu, 20 Mar 2025 06:38:42 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 20 Mar 2025 06:38:41 -0400 (EDT)
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
X-Inumbo-ID: 7e7bd635-0577-11f0-9ea0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1742467122; x=1742553522; bh=H
	CSqtTK0OLa/KDGOXFDTBAHtZN66AA0RE3rsvMWIX/c=; b=IHtiK1r2HHhb0jq6C
	iof1p/ftdVi3fr6SO7gVFnCeEkFQxqkpUPmNrx8CHzpZdWOow3oeP1dt7yjjj9rA
	nVJvHoUpKEmteVFGbLMlaO+cBCh1ucQ6kmZDju4KhfNEThkm9g96KCAZHpW4LLmp
	VewvhhA8TKnMZU2xhfWM4yMxlixOnhGgXtOdJ6Wc6dj9/eFmUsDzHb0fF8mGaEl9
	cjsftJ8UKiK5wp7UgTt44hxsTxAi2q9VSsc+2IwKrqC0pQLj/8mSU0cfCJx5Rv7G
	K6qXgaHp+Y8xODEIMsn1AtwxZIt5opu7IYXRqGeuw+uyIsWryoynT+CPfoSzvlfT
	F0aMA==
X-ME-Sender: <xms:MfDbZ1F0csWD2U4AGcigZuu21H0rKd7-7aM2nw8QsRPlM_huLAEbWw>
    <xme:MfDbZ6Vo3qaJRm6uttJey-YwuJ9um9i2_fqpUipAYjdBxJ4K6fABOnDj6vlRKeF2k
    Q_z0GtXYAnXk-LUSIE>
X-ME-Received: <xmr:MfDbZ3IkM2QLSg5ZbkXH7DWdOjov423tWwtfELzOJ6r6dA7rZOaspjeAngaXDsZxm4XBGC7Cu7NJR6Dbdb4artTwpTHqgnSzjL0VIbvY-frCLw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddugeektddtucetufdoteggodetrf
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
X-ME-Proxy: <xmx:MfDbZ7FcgFYdZYDd4AhSGCSl9rzaez9eyk-hFIIz8B3pg3XpMnkyIA>
    <xmx:MfDbZ7VBXlU1bGPtLerKQ8YrRMaxEqMAqDsH2pSNt6P6Lo0hgBDdiQ>
    <xmx:MfDbZ2M07RHmu0lTorck8pZadRHAmE9xOTGhf3Br8YZXl7u10XIY5A>
    <xmx:MfDbZ63R8VZqTYIf4cKDX_2b2DSFkWHkuh72noJolv37tkks2jmTag>
    <xmx:MfDbZ4WBhKEbDdy5SFzq4eM3ODD62JOxe-83C8el2WTpz0wuiNm58g>
    <xmx:MvDbZxf_MNLDHh14KBnrlMhm7GLmmQziVGNxTzpFQ61Cf_2MN3zIQONSKc8C>
Feedback-ID: i5fffb4f7:Fastmail
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH v1 3/4] x86:hvm: guard calls to nestedhvm routines
Date: Thu, 20 Mar 2025 12:38:39 +0200
Message-Id: <bd3edffaee9ecdccfbf35f70bf502a1fa00f36de.1742465624.git.Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1742465624.git.Sergiy_Kibrik@epam.com>
References: <cover.1742465624.git.Sergiy_Kibrik@epam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Check whether nested HVM is enabled for domain before calling nestedhvm_vcpu_*()
and other not already guarded nestedhvm functions.

Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
---
 xen/arch/x86/hvm/hvm.c      | 6 ++++--
 xen/arch/x86/hvm/svm/asid.c | 2 +-
 xen/arch/x86/hvm/svm/svm.c  | 6 +++---
 3 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 2f31180b6f..5abbf7029d 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -1658,7 +1658,8 @@ int hvm_vcpu_initialise(struct vcpu *v)
     return 0;
 
  fail6:
-    nestedhvm_vcpu_destroy(v);
+    if ( nestedhvm_enabled(d) )
+        nestedhvm_vcpu_destroy(v);
  fail5:
     free_compat_arg_xlat(v);
  fail4:
@@ -1682,7 +1683,8 @@ void hvm_vcpu_destroy(struct vcpu *v)
     if ( hvm_altp2m_supported() )
         altp2m_vcpu_destroy(v);
 
-    nestedhvm_vcpu_destroy(v);
+    if ( nestedhvm_enabled(v->domain) )
+        nestedhvm_vcpu_destroy(v);
 
     free_compat_arg_xlat(v);
 
diff --git a/xen/arch/x86/hvm/svm/asid.c b/xen/arch/x86/hvm/svm/asid.c
index 7977a8e86b..05c8971714 100644
--- a/xen/arch/x86/hvm/svm/asid.c
+++ b/xen/arch/x86/hvm/svm/asid.c
@@ -30,7 +30,7 @@ void svm_asid_handle_vmrun(void)
     struct vcpu *curr = current;
     struct vmcb_struct *vmcb = curr->arch.hvm.svm.vmcb;
     struct hvm_vcpu_asid *p_asid =
-        nestedhvm_vcpu_in_guestmode(curr)
+        ( nestedhvm_enabled(curr->domain) && nestedhvm_vcpu_in_guestmode(curr) )
         ? &vcpu_nestedhvm(curr).nv_n2asid : &curr->arch.hvm.n1asid;
     bool need_flush = hvm_asid_handle_vmenter(p_asid);
 
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 09ac138691..d7d91427fd 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -795,7 +795,7 @@ static void cf_check svm_set_tsc_offset(struct vcpu *v, u64 offset, u64 at_tsc)
     n1vmcb = vcpu_nestedhvm(v).nv_n1vmcx;
     n2vmcb = vcpu_nestedhvm(v).nv_n2vmcx;
 
-    if ( nestedhvm_vcpu_in_guestmode(v) )
+    if ( nestedhvm_enabled(d) && nestedhvm_vcpu_in_guestmode(v) )
     {
         n2_tsc_offset = vmcb_get_tsc_offset(n2vmcb) -
                         vmcb_get_tsc_offset(n1vmcb);
@@ -2172,7 +2172,7 @@ svm_vmexit_do_vmrun(struct cpu_user_regs *regs,
         return;
     }
 
-    if ( !nestedsvm_vmcb_map(v, vmcbaddr) )
+    if ( nestedhvm_enabled(v->domain) && !nestedsvm_vmcb_map(v, vmcbaddr) )
     {
         gdprintk(XENLOG_ERR, "VMRUN: mapping vmcb failed, injecting #GP\n");
         hvm_inject_hw_exception(X86_EXC_GP, 0);
@@ -2190,7 +2190,7 @@ nsvm_get_nvmcb_page(struct vcpu *v, uint64_t vmcbaddr)
     struct page_info *page;
     struct nestedvcpu *nv = &vcpu_nestedhvm(v);
 
-    if ( !nestedsvm_vmcb_map(v, vmcbaddr) )
+    if ( nestedhvm_enabled(v->domain) && !nestedsvm_vmcb_map(v, vmcbaddr) )
         return NULL;
 
     /* Need to translate L1-GPA to MPA */
-- 
2.25.1


