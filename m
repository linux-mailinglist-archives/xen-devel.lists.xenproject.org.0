Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66EA3A6A3D1
	for <lists+xen-devel@lfdr.de>; Thu, 20 Mar 2025 11:36:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.921700.1325477 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvDGV-00031U-1G; Thu, 20 Mar 2025 10:36:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 921700.1325477; Thu, 20 Mar 2025 10:36:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvDGU-000301-Ue; Thu, 20 Mar 2025 10:36:42 +0000
Received: by outflank-mailman (input) for mailman id 921700;
 Thu, 20 Mar 2025 10:36:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5Eqg=WH=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1tvDGT-0002zv-SB
 for xen-devel@lists.xenproject.org; Thu, 20 Mar 2025 10:36:41 +0000
Received: from fforwardh-b4-smtp.messagingengine.com
 (fforwardh-b4-smtp.messagingengine.com [202.12.124.199])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 34be7fd3-0577-11f0-9ffa-bf95429c2676;
 Thu, 20 Mar 2025 11:36:40 +0100 (CET)
Received: from phl-compute-07.internal (phl-compute-07.phl.internal
 [10.202.2.47])
 by mailfforwardh.stl.internal (Postfix) with ESMTP id D4FC517400BF;
 Thu, 20 Mar 2025 06:36:38 -0400 (EDT)
Received: from phl-frontend-02 ([10.202.2.161])
 by phl-compute-07.internal (MEProxy); Thu, 20 Mar 2025 06:36:39 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 20 Mar 2025 06:36:37 -0400 (EDT)
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
X-Inumbo-ID: 34be7fd3-0577-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1742466998; x=1742553398; bh=+
	GvjfQhGqFlLWakh3kcAuKsyU0zqa7rKivVVChzonKU=; b=Y9ER6ptXRsa5ewX2t
	FK5+JE9IJtL4omOpX/zlGxwoYEWLEJuLwoeU8140Hiy/K9WULCPWcGFyCsW92Gd3
	3SjNSmkFDFdvfPwMqmr4U/wCCe/9+54wogMYrd+2i621ZokaHDDpLO5H0gy5somB
	yYw/RkQ3Tbu/JBpYVex/4w/qAymwX5mxknkn+XpSMNq0LUcIvV4ZwIifSwq5QPQU
	V9wQdrJFhl2Y16D1o8Ljd+wxkDzFWYIYe6/N6GdNn40xD1OxBKPi2rCMB56EqfXt
	2LMom++72aWKzMGDeQFra1h5ozZl+VetI5gOrvFlzbPShc66fMjN5ABpo1QWYvHJ
	VRNKA==
X-ME-Sender: <xms:tu_bZzpY1FHPxjpzJmYGEQTlehS0efYT_zFScOefxyT5436Ni4HlBA>
    <xme:tu_bZ9rIG4gfkhjcFmzxqT6h1KLAmUOMOkJ3TcyNZBrB1u0vDm5YUvAm5IdnlpCL3
    HTczn92UlPN180IUJs>
X-ME-Received: <xmr:tu_bZwO5oBYln7sBqtBhB0Oa56f6d36M1EM9tKa0zyfRBj85ZFXfpAis7L5ZKBpv9QpsPvOobujZgCJyDAkOZs1ffNZjJoa5uSokGVRE5oSFrA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddugeejleekucetufdoteggodetrf
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
X-ME-Proxy: <xmx:tu_bZ27kTnaT4n3EYbyNCvVb_dvoFViJfTV5H7QMmEigq1vvcWn_0Q>
    <xmx:tu_bZy7bfXan9q7QsngFZI3Ym75xS6L4BPB-PIitnPHU8ZfjyQeCaQ>
    <xmx:tu_bZ-hC0PlvzkDj1ij63qDv-BwTvBZW6hjjUwU7EJfqSDF08AtYvg>
    <xmx:tu_bZ05-Rsq9lQ3BPkzEpy8QyCDP37qV-X8yPuN7xBsGqZxAKO0Lug>
    <xmx:tu_bZxKoFpIrDPCphyovSFKweXGWdIL58JEgg9pxoGAWto2agBb_Fg>
    <xmx:tu_bZ0SKWsDry17DBG-ZKArB_Z5zEKIvlSfThCZd84CDp_YdOqWQZOG0H8It>
Feedback-ID: i77698ef3:Fastmail
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH v1 2/4] x86:svm: rename svm/nestedhvm.h -> svm/nestedsvm.h
Date: Thu, 20 Mar 2025 12:36:35 +0200
Message-Id: <ad1cc03c3544235426b73e3779edb36653f25287.1742465624.git.Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1742465624.git.Sergiy_Kibrik@epam.com>
References: <cover.1742465624.git.Sergiy_Kibrik@epam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is private header for SVM code, comment in header and file's changelog
suggest that intended name was svm/nestedsvm.h, so perhaps a small mistake here.

Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
---
 xen/arch/x86/hvm/svm/intr.c                       | 2 +-
 xen/arch/x86/hvm/svm/{nestedhvm.h => nestedsvm.h} | 0
 xen/arch/x86/hvm/svm/svm.c                        | 2 +-
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename xen/arch/x86/hvm/svm/{nestedhvm.h => nestedsvm.h} (100%)

diff --git a/xen/arch/x86/hvm/svm/intr.c b/xen/arch/x86/hvm/svm/intr.c
index 46186a1102..feaf42d81b 100644
--- a/xen/arch/x86/hvm/svm/intr.c
+++ b/xen/arch/x86/hvm/svm/intr.c
@@ -25,7 +25,7 @@
 #include <public/hvm/ioreq.h>
 #include <xen/domain_page.h>
 
-#include "nestedhvm.h"
+#include "nestedsvm.h"
 
 static void svm_inject_nmi(struct vcpu *v)
 {
diff --git a/xen/arch/x86/hvm/svm/nestedhvm.h b/xen/arch/x86/hvm/svm/nestedsvm.h
similarity index 100%
rename from xen/arch/x86/hvm/svm/nestedhvm.h
rename to xen/arch/x86/hvm/svm/nestedsvm.h
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index e33a38c1e4..09ac138691 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -41,7 +41,7 @@
 
 #include <public/sched.h>
 
-#include "nestedhvm.h"
+#include "nestedsvm.h"
 #include "svm.h"
 
 void noreturn svm_asm_do_resume(void);
-- 
2.25.1


