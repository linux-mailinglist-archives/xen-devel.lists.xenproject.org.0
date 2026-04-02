Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +UDeKl9JzmlRmgYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 12:47:59 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D6F6387DCD
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 12:47:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1271527.1559692 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8FaJ-0005U0-To; Thu, 02 Apr 2026 10:47:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1271527.1559692; Thu, 02 Apr 2026 10:47:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8FaJ-0005R1-Lf; Thu, 02 Apr 2026 10:47:35 +0000
Received: by outflank-mailman (input) for mailman id 1271527;
 Thu, 02 Apr 2026 10:47:34 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1w8FaI-0005CF-8o
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 10:47:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w8FaH-009qA7-Lh
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 12:47:33 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69ce4932-e002-0a2a0a5209dd-0a2a450cd128-40
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 12:47:33 +0200
Received: from [209.85.218.49] (helo=mail-ej1-f49.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69ce4945-f40c-0a2a450c0019-d155da31ad3b-3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 12:47:33 +0200
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-b932fe2e1a7so84945766b.1
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 03:47:33 -0700 (PDT)
Received: from EPUAKYIW02F7.. ([45.12.26.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b9c3d028955sm76392366b.61.2026.04.02.03.47.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Apr 2026 03:47:32 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775126853; x=1775731653; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E2TvwCSkEBb4iQcEjFfj1UiUN2JVsCuECcxIJOnRftY=;
        b=jRdeBmAlBkJ9d7HKYA1KQjZt6GAJcV3zxI57FF1bfypMIDOk29Q5LUJt+GfHevhl/6
         nmYuLiLgDgR8X8ULKWPvEfzvmF6DKwe2ZT4nIdBDkFZIoieRkoR9ucEPset5ELOvn1J8
         PG7OHn8JPTd/jpwwnTLek4JuFDGWcSDEtI8/6DbM/5vFckkImvfT8snl07grHHz0IdgQ
         EyYUCz8b4MAJXIAH34lcwhi9mgzouWpabG9gf504rCzJAKAmVaQODJqZztl1XTQsw5eY
         Wvu9WotApk4fkEXZQkrdtjQb+4kuDf7zj6LKQti6G/+Oe2mWQKdP1WDOEx/u2kwCK+X7
         28uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775126853; x=1775731653;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E2TvwCSkEBb4iQcEjFfj1UiUN2JVsCuECcxIJOnRftY=;
        b=pk/Sn5S8f6f5Jd+huJEvjmV3RQOfPwM8QPuWz/TjmcxY7vudxAIg3omq8jqiPQTzd4
         VgMn8VnTBQVOAmspVxwgvZVcfpkaGFVKwp88tAn0rj8DnnbEZxdLOSaWvfaVjduk0yHn
         KEDJ6HCHbZpB34hNVQYM910V65Y3tP9Yl0CSyoucGlQlWfI00EmiVZlDFvRDIMSa1pi6
         zM232UvmnSBCqQEcDiTy6urGUqug2GvSowLDruMXXRaBTFDie+a4LIcZ1SbEtjGK2vDk
         p6k2DRAOBDvbrIx1oVM/OfiAE5Klo8BpX22tm/SZJlhjZBF+ImjyNZzl5AiPnVeioR4L
         cFkg==
X-Gm-Message-State: AOJu0YympHjsWZAXTF0MdK44dh71T/9up9yYNAMPEDQmQxYoJFu890aP
	qXcAI3r0Vij825KpUHSILdSvesOCwfAOaIe3LvKrFueQ9UItrzcADuVNX+crkz6G
X-Gm-Gg: ATEYQzzH20BgsMnl/jrvpnZDX9bb31UjHPdYvZk4bTq2i7uhIDxQlRyotzUwPlhDfXY
	Hpur2q8uikY71dLmP1ENLv1YKoqxmlVUISHpNYq1yTRQ9yTkqUp4NCEmLMOLrStGeZFbeWRR3GI
	hblxwoVGL4N0EA0bVpQtfDI5I0j4PE3xsTEUM6YQc/tS33Zpbq+4BMh2/Saww2CvBRIBztmzyFs
	fJKl7JZ1p08CUm6AeTJlRMKNKAXG+c9Kj3TUVbfF0cGl9LZqkG49t53KNd//rwAcupUn+cp28un
	mDH3CNZEBZS4UP123Ste+aX8DZsv58abKiJkTEd9kr6KC0xmfhlcKYXFgXfKOjZCoAO/b0MK9hk
	dU6Q26bjiQrbPAzb0Nlx9XM7BZHhVlAcIizkTHYNTK13qX7dvL2kmQQi4ZMAM+okwdcB/TYxHYz
	BfGe0Dp9K1M0w5VTEg2c9/MxSWIQ==
X-Received: by 2002:a17:906:ba84:b0:b94:2648:4672 with SMTP id a640c23a62f3a-b9c13b7bdbemr484677266b.41.1775126852622;
        Thu, 02 Apr 2026 03:47:32 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH v8 07/13] xen/arm: ffa: fix notification SRI across CPU hotplug/suspend
Date: Thu,  2 Apr 2026 13:45:08 +0300
Message-ID: <a977e246d1d0a32a6618efd1385ad178779c2a61.1775125380.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1775125380.git.mykola_kvach@epam.com>
References: <cover.1775125380.git.mykola_kvach@epam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1775126853-81557A3D-86A1C0B4/0/0
X-purgate-type: clean
X-purgate-size: 3590
X-Spamd-Result: default: False [-0.69 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:volodymyr_babchuk@epam.com,m:bertrand.marquis@arm.com,m:jens.wiklander@linaro.org,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,epam.com:email,epam.com:mid];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 5D6F6387DCD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Mykola Kvach <mykola_kvach@epam.com>

The FF-A notification SRI interrupt handler was not correctly tied to
CPU hotplug and suspend/resume. As a result, CPUs going offline and
back online could end up with stale or missing handlers, breaking
delivery of FF-A notifications.

Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
 xen/arch/arm/tee/ffa_notif.c | 63 ++++++++++++++++++++++++++++--------
 1 file changed, 50 insertions(+), 13 deletions(-)

diff --git a/xen/arch/arm/tee/ffa_notif.c b/xen/arch/arm/tee/ffa_notif.c
index 186e726412..513c399594 100644
--- a/xen/arch/arm/tee/ffa_notif.c
+++ b/xen/arch/arm/tee/ffa_notif.c
@@ -360,10 +360,28 @@ static int32_t ffa_notification_bitmap_destroy(uint16_t vm_id)
     return ffa_simple_call(FFA_NOTIFICATION_BITMAP_DESTROY, vm_id, 0, 0, 0);
 }
 
-void ffa_notif_init_interrupt(void)
+static DEFINE_PER_CPU_READ_MOSTLY(struct irqaction, sri_irq);
+
+static int request_sri_irq(void)
 {
     int ret;
+    struct irqaction *sri_action = &this_cpu(sri_irq);
+
+    sri_action->name = "FF-A notif";
+    sri_action->handler = notif_irq_handler;
+    sri_action->dev_id = NULL;
+    sri_action->free_on_release = 0;
+
+    ret = setup_irq(notif_sri_irq, 0, sri_action);
+    if ( ret )
+        printk(XENLOG_ERR "ffa: setup_irq irq %u failed: error %d\n",
+               notif_sri_irq, ret);
 
+    return ret;
+}
+
+void ffa_notif_init_interrupt(void)
+{
     if ( fw_notif_enabled && notif_sri_irq < NR_GIC_SGI )
     {
         /*
@@ -376,14 +394,36 @@ void ffa_notif_init_interrupt(void)
          * pending, while the SPMC in the secure world will not notice that
          * the interrupt was lost.
          */
-        ret = request_irq(notif_sri_irq, 0, notif_irq_handler, "FF-A notif",
-                          NULL);
-        if ( ret )
-            printk(XENLOG_ERR "ffa: request_irq irq %u failed: error %d\n",
-                   notif_sri_irq, ret);
+        request_sri_irq();
     }
 }
 
+static void deinit_ffa_notif_interrupt(void)
+{
+    if ( fw_notif_enabled && notif_sri_irq < NR_GIC_SGI )
+        release_irq(notif_sri_irq, NULL);
+}
+
+static int cpu_ffa_notif_callback(struct notifier_block *nfb,
+                                  unsigned long action,
+                                  void *hcpu)
+{
+    switch ( action )
+    {
+    case CPU_DYING:
+        deinit_ffa_notif_interrupt();
+        break;
+    default:
+        break;
+    }
+
+    return NOTIFY_DONE;
+}
+
+static struct notifier_block cpu_ffa_notif_nfb = {
+    .notifier_call = cpu_ffa_notif_callback,
+};
+
 void ffa_notif_init(void)
 {
     const struct arm_smccc_1_2_regs arg = {
@@ -392,7 +432,6 @@ void ffa_notif_init(void)
     };
     struct arm_smccc_1_2_regs resp;
     unsigned int irq;
-    int ret;
 
     /* Only enable fw notification if all ABIs we need are supported */
     if ( ffa_fw_supports_fid(FFA_NOTIFICATION_BITMAP_CREATE) &&
@@ -408,13 +447,11 @@ void ffa_notif_init(void)
         notif_sri_irq = irq;
         if ( irq >= NR_GIC_SGI )
             irq_set_type(irq, IRQ_TYPE_EDGE_RISING);
-        ret = request_irq(irq, 0, notif_irq_handler, "FF-A notif", NULL);
-        if ( ret )
-        {
-            printk(XENLOG_ERR "ffa: request_irq irq %u failed: error %d\n",
-                   irq, ret);
+
+        if ( request_sri_irq() )
             return;
-        }
+
+        register_cpu_notifier(&cpu_ffa_notif_nfb);
         fw_notif_enabled = true;
     }
 }
-- 
2.43.0


