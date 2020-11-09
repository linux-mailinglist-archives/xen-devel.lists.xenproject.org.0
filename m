Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C672AB8A1
	for <lists+xen-devel@lfdr.de>; Mon,  9 Nov 2020 13:51:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.22489.48882 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kc6dn-0004dV-81; Mon, 09 Nov 2020 12:51:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 22489.48882; Mon, 09 Nov 2020 12:51:23 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kc6dn-0004cp-4F; Mon, 09 Nov 2020 12:51:23 +0000
Received: by outflank-mailman (input) for mailman id 22489;
 Mon, 09 Nov 2020 12:51:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zl3J=EP=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1kc6dl-0003tf-HP
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2020 12:51:21 +0000
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id aabbabcf-60b4-4731-b85c-19f807f3690c;
 Mon, 09 Nov 2020 12:50:45 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id o24so3432507ljj.6
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2020 04:50:45 -0800 (PST)
Received: from a2klaptop.localdomain ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id i1sm1736447lfr.176.2020.11.09.04.50.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2020 04:50:43 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=zl3J=EP=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
	id 1kc6dl-0003tf-HP
	for xen-devel@lists.xenproject.org; Mon, 09 Nov 2020 12:51:21 +0000
X-Inumbo-ID: aabbabcf-60b4-4731-b85c-19f807f3690c
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id aabbabcf-60b4-4731-b85c-19f807f3690c;
	Mon, 09 Nov 2020 12:50:45 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id o24so3432507ljj.6
        for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2020 04:50:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=eL99YnEMb+Fyva1t76PgaT1/+PMUISpx/gf+bW+r/cI=;
        b=HIz0YaOhkTYT9bi7q3vjfOFzs5nAscZaPl/ok3a0KcURNAkpcnAiB3ZSQlhsq94anU
         8pcS45urcHNlE+SWTJ0ceIR/qq5Ap5XZjYN2mGXHgu8WxpgtxzKUygvzDM/rX7vg5fJ3
         B8gahy9qZ0YZYpztX6gD1R1fHu4UKOXdBQE3VFJEU81+YCH2Di3atrwl0TMwAPJ/dhQl
         oNqcHsI2aiS/wtwHpxkWtq0Y7V9OoE6Wx8fktrP9tuvfzgmMlF1LgklQy2Z/EyDdb+D6
         +ly2E/EHTcQmmmUjMwzhSzyMj9hdv2saHe6ey0FFT9txiM63byBTE/ydvFb9NVMYmVTT
         gTGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=eL99YnEMb+Fyva1t76PgaT1/+PMUISpx/gf+bW+r/cI=;
        b=cXzlTRHJBu0qvY5ZK9A83FGA23XaMQptoUeCV2rUQk89dwkmvE593A3/2z2WNGh3bk
         W8d7ZbOrwikR0ck+P2tHhEoG4Fw2kGt6TbgBqXN+Ie39QGh/0lcUHNWR0l53DL+PRiJq
         sHkhtCbK7pivfZPA8qQvVAp6kM4eItKU5ACg2B3lY5qoyW/y9bu7W3Ya4Mz0EMo57dwQ
         FhUC6K6O8DIkR4Xs7O+SX8YTwMdJCFVrWOqd4iPMdq3ctPtW/D3FJpRFo0nCnwUaTBVA
         JZEIxxOl1YCaUdr9aF8/LsnkSGQP9oC1EL7YL91JN8UHvx8QYWILQySL7ymtae/3IL9S
         ZMMA==
X-Gm-Message-State: AOAM532eP1DoZq3dCQQjlMAg5yYpphmETjbP3VbNeDHHj598LMWNRYrL
	DG9A76mt76B4hQs7MJ6pADk=
X-Google-Smtp-Source: ABdhPJxgeKI9dEyPqiYGy3kiXhmC5roPNZKfR08jh66HPMOL1bYYFLCoIBl0CtpPpcDIcSW8vJH91w==
X-Received: by 2002:a2e:9207:: with SMTP id k7mr1622007ljg.71.1604926244200;
        Mon, 09 Nov 2020 04:50:44 -0800 (PST)
Received: from a2klaptop.localdomain ([185.199.97.5])
        by smtp.gmail.com with ESMTPSA id i1sm1736447lfr.176.2020.11.09.04.50.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 04:50:43 -0800 (PST)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: Rahul.Singh@arm.com,
	Bertrand.Marquis@arm.com,
	julien.grall@arm.com,
	jbeulich@suse.com,
	roger.pau@citrix.com,
	sstabellini@kernel.org,
	xen-devel@lists.xenproject.org
Cc: iwj@xenproject.org,
	wl@xen.org,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: [PATCH 09/10] vpci/rcar: Implement vPCI.update_bar_header callback
Date: Mon,  9 Nov 2020 14:50:30 +0200
Message-Id: <20201109125031.26409-10-andr2000@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201109125031.26409-1-andr2000@gmail.com>
References: <20201109125031.26409-1-andr2000@gmail.com>

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Update hardware domain's BAR header as R-Car Gen3 is a non-ECAM host
controller, so vPCI MMIO handlers do not work for it in hwdom.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
---
 xen/arch/arm/pci/pci-host-rcar-gen3.c | 69 +++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/xen/arch/arm/pci/pci-host-rcar-gen3.c b/xen/arch/arm/pci/pci-host-rcar-gen3.c
index ec14bb29a38b..353ac2bfd6e6 100644
--- a/xen/arch/arm/pci/pci-host-rcar-gen3.c
+++ b/xen/arch/arm/pci/pci-host-rcar-gen3.c
@@ -23,6 +23,7 @@
 #include <xen/pci.h>
 #include <asm/pci.h>
 #include <xen/vmap.h>
+#include <xen/vpci.h>
 
 /* Error values that may be returned by PCI functions */
 #define PCIBIOS_SUCCESSFUL		0x00
@@ -307,12 +308,80 @@ int pci_rcar_gen3_config_write(struct pci_host_bridge *bridge, uint32_t _sbdf,
     return ret;
 }
 
+static void pci_rcar_gen3_hwbar_init(const struct pci_dev *pdev,
+                                     struct vpci_header *header)
+
+{
+    static bool once = true;
+    struct vpci_bar *bars = header->bars;
+    unsigned int num_bars;
+    int i;
+
+    /* Run only once. */
+    if (!once)
+        return;
+    once = false;
+
+    printk("\n\n ------------------------ %s -------------------\n", __func__);
+    switch ( pci_conf_read8(pdev->sbdf, PCI_HEADER_TYPE) & 0x7f )
+    {
+    case PCI_HEADER_TYPE_NORMAL:
+        num_bars = PCI_HEADER_NORMAL_NR_BARS;
+        break;
+
+    case PCI_HEADER_TYPE_BRIDGE:
+        num_bars = PCI_HEADER_BRIDGE_NR_BARS;
+        break;
+
+    default:
+        return;
+    }
+
+    for ( i = 0; i < num_bars; i++ )
+    {
+        uint8_t reg = PCI_BASE_ADDRESS_0 + i * 4;
+
+        if ( bars[i].type == VPCI_BAR_MEM64_HI )
+        {
+            /*
+             * Skip hi part of the 64-bit register: it is read
+             * together with the lower part.
+             */
+            continue;
+        }
+
+        if ( bars[i].type == VPCI_BAR_IO )
+        {
+            /* Skip IO. */
+            continue;
+        }
+
+        if ( bars[i].type == VPCI_BAR_MEM64_LO )
+        {
+            /* Read both hi and lo parts of the 64-bit BAR. */
+            bars[i].addr =
+                (uint64_t)pci_conf_read32(pdev->sbdf, reg + 4) << 32 |
+                pci_conf_read32(pdev->sbdf, reg);
+        }
+        else if ( bars[i].type == VPCI_BAR_MEM32 )
+        {
+            bars[i].addr = pci_conf_read32(pdev->sbdf, reg);
+        }
+        else
+        {
+            /* Expansion ROM? */
+            continue;
+        }
+    }
+}
+
 /* R-Car Gen3 ops */
 static struct pci_ecam_ops pci_rcar_gen3_ops = {
     .bus_shift  = 20, /* FIXME: this is not used by RCar */
     .pci_ops    = {
         .read       = pci_rcar_gen3_config_read,
         .write      = pci_rcar_gen3_config_write,
+        .update_bar_header = pci_rcar_gen3_hwbar_init,
     }
 };
 
-- 
2.17.1


