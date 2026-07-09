Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id A2T9EATKT2qYoQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Jul 2026 18:19:16 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E176A73362E
	for <lists+xen-devel@lfdr.de>; Thu, 09 Jul 2026 18:19:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=aol.com header.s=a2048 header.b=dpvvhuMN;
	dmarc=pass (policy=reject) header.from=aol.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1358342.1612520 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whrSX-00020w-2R; Thu, 09 Jul 2026 16:18:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1358342.1612520; Thu, 09 Jul 2026 16:18:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whrSW-0001yn-VY; Thu, 09 Jul 2026 16:18:44 +0000
Received: by outflank-mailman (input) for mailman id 1358342;
 Thu, 09 Jul 2026 16:18:43 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <brchuckz@aol.com>) id 1whrSU-0001yX-Sz
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 16:18:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whrSU-004B28-9l
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 18:18:42 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <brchuckz@aol.com>)
 id 6a4fc9cd-bab6-0a2a0a5309dd-0a2a4505dfbc-24
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 18:18:41 +0200
Received: from [98.137.69.147] (helo=sonic310-21.consmr.mail.gq1.yahoo.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <brchuckz@aol.com>)
 id 6a4fc9e0-4f1d-0a2a45050019-62894593ac1c-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 18:18:41 +0200
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic310.consmr.mail.gq1.yahoo.com with HTTP; Thu, 9 Jul 2026 16:18:39 +0000
Received: by hermes--production-ne1-7568ccb994-pgg8z (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID e91c25460b5bcef5e32390743f7fb9e1; 
 Thu, 09 Jul 2026 16:18:35 +0000 (UTC)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1783613919; bh=aTZYJ19teLtgjMj7F9U4FXEuCw6WFBhpiWLDA9olIKg=; h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To; b=dpvvhuMNQ0AlydLXUGrTyc2kdBT2MgLipEG7hlsxeTCQrfBxEONVQQRVDX2VvTQzRGADOIKcHB48WRk3SCM4U71ERCO+++HInf8Ivq2ZRJN5QdU1ujrko88ILkSOz9DHe7jmdvQSn6srwV1rouCMACYqh9CvCKP28UZqIzPGZUyTVTE6WXam0bjPdotxcyw6UAdnIhxX+00rDjWqUxPwuw7CAG3OqFniJcg69Y9+wxM7JsTdbfn970xNz3dNkCBlqpqdFejoeOMlT8h3+G94JCsTKCUqTNanHiXYdj5JUceG61bKWwBgeLF4txGKazG6+7i49aSO6di5NOb3dpxr4A==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1783613919; bh=zRfeOITMp9hA8Z04Z05ZbIWmM8TioYp3jXpEcHdDQYz=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=P8xxAmzHQVXTlHAJgVAyuY2JyLT/R7cONBOW4YxodFV8Zwg5Sv1hcTT/H8MJsnveR4fpQ/+pgAmdofWr9+gv/a8K8fT6HfrmFeTw68tmC4OIouq6Pgue5h394Xam4O+wpe0vhnR7N2l1gOZYbCaHYrXrbd5w1gOnFAzcSv1nJZiP+vnajbW6abdt4V3wnkbrAQMjvKY0sErlN5z9z7r80IxdTLmMU6seiNnBbqekngFZf5xu3Q4uxK8X7LwU01tGR4SH2ulhpjp8cfNmm0vz2qwZQ9zqHaRJu6pKjbteAVQjYenixL6yoKMmvsN/QQ725GkeBWHKt6lzHDtGJnnmOg==
X-YMail-OSG: tFM3Bf8VM1nasx3ROykWIoYVxsOKzyryTcOtm8ghBROhjE.QPKInFWdJs5vns6D
 Tr4t.fS.xLHiiiqi.DgyfZLE.Pm7DYGsOJmrLcC_9fE.aFfOTlAVElVgyKlz0VYBC_5MR_FbhvKS
 XfG82h2955J6XrtcypskYeya7_pU39Jkg3hHa3VgLvROesvj6j6_IkHBq0vMfP9jCmHmTjt.soHM
 _UBVbnpYAvT5iGZa9rpfhYeIOm2R8SqOOGnYlc606o7hUCnISS4NniqiWTgSxVvhR0_Imliqr0Kg
 8LWIZ1KnSzwanAMoc9VpAcDiXAy4Q3bsTh0AXDkyZuvDroiqabiiMB1.pkbLwZvZzfkfHDL2VPqj
 kNDlKHcy6U0lkd1Gqm28zJsFhLUEmf3nXK92GMdKcf.OyVmdFOfN1vBDtSVcZr7eJo5N4VHQrDpX
 HgnNgGsKN2p0dDzUaGTpXjXukt8QLGxw0Y8BoQ2jmrazbsN7uSpWiyNwlxhnAIT926Vu1nb5Urjy
 XuAEZdUNpuVVvjvSIbb1jdsLOgO18rFJWwqYUN5gZ307CC_tgHxQcaP8VOUCC67nGzm_rXFqC5yc
 rY6C8hlGytMLoa2LKegIHd2KH4CUPt1q_dtetsvPbh9KGUoD3x.leI0HDKRy42uIdRbQhZU_e_gR
 lJ99q2P482fHlR_iH8iMl1NmK8Bax59F02OwrZI7rV8L1z0XKX3Zabkd79kH1ZbRzNr2Lg8pNKYG
 MswP3nqzC644n_IAKpjM8bUigrhNtIDIMbm8r5ROqZ2Z_SxEwSQE2BNExGiki61mHYmD8Y8gBZb8
 q8SIPDAYHM.lkpgHjQKFG769whhGEgt.LnIHsITLf68oAHq0tA1s4Fw_THvLPq2oOG4CwTNF6kLx
 .sij7_ixG3AZggrsC_HHbzWon.Up1atglqdfPh5OezJAMW0oEDQgYvXx3sa8H3ODx6jbNE_Z0RV4
 w_y32b3NAhCsItdO9SiinhkaXIEsHsZR5ao6PJqbz1gonHEY_.VXQiv22yuqK4IKbblxTFseamIG
 7AB6txNq2dbIJJCZetvjcV__X5HTDSkkxmB_uA6S21O0HF.9vkWBYKkWLRDwEb7FULFxLRAV5jUA
 3yimnxS5mVk3LRKn8W03wr_id0M1.CgKyapVZPI2Z00Ar8UVmwDExsxMnwExT0WUYN6bBFYUb_qM
 GnFZ1eSWG32icvFnOSHmBe9.Go2jQHMKKDgS5WyL7dim6Pl68c2SMoWvpNbNgVpQOtIvfkhgzwRZ
 PQJtefZvV2BBSk54Xgwbhe4I5gJQZ.BDu7p.1ew52myx1rZii_uZslsH_BT_UuloLIyc4okPFKxR
 xmhkOfHNpD4lhvp_mVR799XbaXVpWlk1MnATxxEOs6w3TSd8HPm7Gn6h15.N7RZm_7mcn3jTlwTM
 WMof3hLarjhm_2XGDlRTxD5ynfGywEDoKd_06CyNFJMFEpOjv7nJemFetOg1GJ3dNJi3AfKGQI_U
 qxKO4bW9EFlEMpHXxL.8P5H5WvFuTFaCoBAsc51PcdRWDuSi_gVVysbkA2Tr99k7_P.iu1MN3e2r
 gYs2ADwHZZ5.h3IXVJZqjFdqcj9lt12IvZYmCQbxoy_q6GRfCI7RwoZvqmT_tLjzPLsbfiag6aYB
 Y91rdzmKtjfMCngxslGzkuTNVdkEFN5qorxqVXqPR0Hx52ZYrtYzf2vAykCtcexbOCEFWmWE5tnI
 ZWJGAAp1hW5rcwnyswXlUP8b1ve1kwzvt5o5qV_EO5c5sfd_KRU_QvOUxB.VgIre1InKqeflxAAT
 8BdKNQ5iz1nKTNP0WFsNUgiZzXP4_bwsDkCjqSRMgd5mQ8wqyWihX1O8p6ye4FWA2g5Hx4MHHM8L
 F.xtys_8NlFUedcPYXwxzwos4cZsOAVJ3PhDKBldV6P0n.vNLd2uURXENGR4yVU413w1PCmUiyhP
 MSBplNWDCUulbYLWn534zoYpGvZYijgc2dzFQRuiVsUi6q4EMZyqs63cwMpMnb92xIgj2snv.Faw
 uQ_gbZIK522GYa2ydEcv3k2xXu4KH7OB_pSYlk_T0.M_IlF165kuC_ec0l33jfN69vCKHmg2Rvud
 ozqA1aAarGDlnwLcvtFHMD1R3BDzKEdPh9Fq3E7KRKWIJLtpJ0VOCec6ISgUGW4Qze62bVXuozt9
 GI.ehTVVvqKqW11yMzseQ8FMzm1kdy69x8SqAFPwFznMcst1ICMMzJoWxy3VtBZLIpYM5Qk9zxTY
 RwVWzkGjpRJOkJDEslwY0lmEFOVRv3EiNpEM-
X-Sonic-MF: <brchuckz@aol.com>
X-Sonic-ID: a226e517-b485-4777-b889-ed6bf335aba4
From: Chuck Zmudzinski <brchuckz@aol.com>
To: qemu-devel@nongnu.org
Cc: stable@nongnu.org,
	xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony@xenproject.org>,
	"Edgar E . Iglesias" <edgar.iglesias@gmail.com>
Subject: [PATCH v2 1/3] xen/igd: get PCH info from host sysfs
Date: Thu,  9 Jul 2026 12:18:29 -0400
Message-ID: <20260709161831.17753-2-brchuckz@aol.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260709161831.17753-1-brchuckz@aol.com>
References: <20260709161831.17753-1-brchuckz@aol.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1783613921-DA54412E-9A6E46D9/0/0
X-purgate-type: clean
X-purgate-size: 5975
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[aol.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[aol.com:s=a2048];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:qemu-devel@nongnu.org,m:stable@nongnu.org,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:anthony@xenproject.org,m:edgar.iglesias@gmail.com,m:edgariglesias@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[aol.com];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[brchuckz@aol.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[nongnu.org,lists.xenproject.org,kernel.org,xenproject.org,gmail.com];
	FROM_NEQ_ENVFROM(0.00)[brchuckz@aol.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	ALIAS_RESOLVED(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[6];
	DKIM_TRACE(0.00)[aol.com:+];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E176A73362E

The igd_combo_id_infos[] data is more than 10 years
out of date with many Intel IGD devices missing from
igd_combo_id_infos[]. This means that many devices
that could be supported will not work with the
current implementation.

For newer devices not listed in igd_combo_id_infos[],
get infos from the host sysfs to enable support for the
newer devices not listed in igd_combo_id_infos[].

Introduce the helper function xen_pt_get_host_pch_info
to facilitate getting the necessary information from
sysfs.

Also, use errp in xen_igd_passthrough_isa_bridge_create
to set errors from xen_pt_get_host_pch_info.

Signed-off-by: Chuck Zmudzinski <brchuckz@aol.com>
---
Changes in v2:
  - call error_setg* after closing files instead of before closing
    files
  - in last line of commit message change "to propagate errors" to
    "to set errors"
  - add stable to Cc list

 hw/xen/xen_pt.c          |  2 +-
 hw/xen/xen_pt_graphics.c | 82 ++++++++++++++++++++++++++++++++++++++--
 include/hw/xen/xen_igd.h |  3 +-
 3 files changed, 82 insertions(+), 5 deletions(-)

diff --git a/hw/xen/xen_pt.c b/hw/xen/xen_pt.c
index 0fe9c0a..474606e 100644
--- a/hw/xen/xen_pt.c
+++ b/hw/xen/xen_pt.c
@@ -867,7 +867,7 @@ static void xen_pt_realize(PCIDevice *d, Error **errp)
         }
 
         /* Register ISA bridge for passthrough GFX. */
-        xen_igd_passthrough_isa_bridge_create(s, &s->real_device);
+        xen_igd_passthrough_isa_bridge_create(s, &s->real_device, errp);
     }
 
     /* Handle real device's MMIO/PIO BARs */
diff --git a/hw/xen/xen_pt_graphics.c b/hw/xen/xen_pt_graphics.c
index 7df9344..2ef941e 100644
--- a/hw/xen/xen_pt_graphics.c
+++ b/hw/xen/xen_pt_graphics.c
@@ -376,8 +376,75 @@ static void pt_graphics_register_types(void)
 }
 type_init(pt_graphics_register_types)
 
+static void xen_pt_get_host_pch_info(PCIDevice *dev, uint16_t *pch_dev_id,
+                                 uint8_t *pch_rev_id, Error **errp)
+{
+    FILE *fp1, *fp2;
+    char *endptr;
+    char device_id[7], rev[5];
+    size_t len;
+    const char *device = "/sys/bus/pci/devices/0000:00:1f.0/device";
+    const char *revision = "/sys/bus/pci/devices/0000:00:1f.0/revision";
+    unsigned long val;
+
+    fp1 = fopen(device, "r");
+    if (fp1 == NULL) {
+        error_setg_errno(errp, errno, "Cannot open %s", device);
+        return;
+    }
+    fp2 = fopen(revision, "r");
+    if (fp2 == NULL) {
+        fclose(fp1);
+        error_setg_errno(errp, errno, "Cannot open %s", revision);
+        return;
+    }
+
+    len = fread(device_id, 1, 7, fp1);
+    if (!len) {
+        fclose(fp1);
+        fclose(fp2);
+        error_setg(errp, "Cannot read %s", device);
+        return;
+    }
+    len = fread(rev, 1, 5, fp2);
+    if (!len) {
+        fclose(fp1);
+        fclose(fp2);
+        error_setg(errp, "Cannot read %s", revision);
+        return;
+    }
+    fclose(fp1);
+    fclose(fp2);
+
+    val = strtoul(device_id, &endptr, 16);
+    if (val > 0xffff) {
+        error_setg(errp, "PCH device id is out of range: 0x%lx", val);
+        return;
+    }
+    if ((endptr > device_id) && (errno != ERANGE) &&
+        (errno != EINVAL)) {
+        *pch_dev_id = (uint16_t)val;
+    } else {
+        error_setg_errno(errp, errno, "device id strtoul "
+                                      "conversion failed");
+        return;
+    }
+    val = strtoul(rev, &endptr, 16);
+    if (val > 0xff) {
+        error_setg(errp, "PCH revision is out of range: 0x%lx", val);
+        return;
+    }
+    if ((endptr > rev) && (errno != ERANGE) && (errno != EINVAL)) {
+        *pch_rev_id = (uint8_t)val;
+    } else {
+        error_setg_errno(errp, errno, "revision strtoul "
+                                      "conversion failed");
+    }
+}
+
 void xen_igd_passthrough_isa_bridge_create(XenPCIPassthroughState *s,
-                                           XenHostPCIDevice *dev)
+                                           XenHostPCIDevice *dev,
+                                           Error **errp)
 {
     PCIBus *bus = pci_get_bus(&s->dev);
     struct PCIDevice *bridge_dev;
@@ -394,7 +461,16 @@ void xen_igd_passthrough_isa_bridge_create(XenPCIPassthroughState *s,
         }
     }
 
-    if (pch_dev_id == 0xffff) {
+    /* Newer devices get PCH infos from host sysfs */
+    if ((pch_dev_id == 0xffff) || !pch_rev_id) {
+        xen_pt_get_host_pch_info(&s->dev, &pch_dev_id, &pch_rev_id, errp);
+    }
+
+    XEN_PT_LOG(&s->dev, "PCH device id: 0x%x\n", pch_dev_id);
+    XEN_PT_LOG(&s->dev, "PCH revision: 0x%x\n", pch_rev_id);
+
+    if ((pch_dev_id == 0xffff) || !pch_rev_id) {
+        error_setg(errp, "failed to get PCH device id or revision");
         return;
     }
 
@@ -406,7 +482,7 @@ void xen_igd_passthrough_isa_bridge_create(XenPCIPassthroughState *s,
      * Note that vendor id is always PCI_VENDOR_ID_INTEL.
      */
     if (!bridge_dev) {
-        fprintf(stderr, "set igd-passthrough-isa-bridge failed!\n");
+        error_setg(errp, "set igd-passthrough-isa-bridge failed!");
         return;
     }
     pci_config_set_device_id(bridge_dev->config, pch_dev_id);
diff --git a/include/hw/xen/xen_igd.h b/include/hw/xen/xen_igd.h
index 7ffca06..da51f09 100644
--- a/include/hw/xen/xen_igd.h
+++ b/include/hw/xen/xen_igd.h
@@ -22,7 +22,8 @@ uint32_t igd_read_opregion(XenPCIPassthroughState *s);
 void xen_igd_reserve_slot(PCIBus *pci_bus);
 void igd_write_opregion(XenPCIPassthroughState *s, uint32_t val);
 void xen_igd_passthrough_isa_bridge_create(XenPCIPassthroughState *s,
-                                           XenHostPCIDevice *dev);
+                                           XenHostPCIDevice *dev,
+                                           Error **errp);
 
 static inline bool is_igd_vga_passthrough(XenHostPCIDevice *dev)
 {
-- 
2.52.0


