Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8433C2EE6FE
	for <lists+xen-devel@lfdr.de>; Thu,  7 Jan 2021 21:35:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.63098.112015 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxc02-0002OP-P1; Thu, 07 Jan 2021 20:35:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 63098.112015; Thu, 07 Jan 2021 20:35:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxc02-0002O0-LK; Thu, 07 Jan 2021 20:35:14 +0000
Received: by outflank-mailman (input) for mailman id 63098;
 Thu, 07 Jan 2021 20:35:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2pyT=GK=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1kxc00-0002Nv-QZ
 for xen-devel@lists.xenproject.org; Thu, 07 Jan 2021 20:35:12 +0000
Received: from aserp2130.oracle.com (unknown [141.146.126.79])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 019ee519-bf30-4fa5-bc3d-8f3e75502bcf;
 Thu, 07 Jan 2021 20:35:10 +0000 (UTC)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 107KZ4ia043536;
 Thu, 7 Jan 2021 20:35:08 GMT
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2130.oracle.com with ESMTP id 35wcuxxk0y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 07 Jan 2021 20:35:08 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 107KYsLA125134;
 Thu, 7 Jan 2021 20:35:07 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3020.oracle.com with ESMTP id 35v1fbpd7y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 07 Jan 2021 20:35:07 +0000
Received: from abhmp0016.oracle.com (abhmp0016.oracle.com [141.146.116.22])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 107KZ7u5010978;
 Thu, 7 Jan 2021 20:35:07 GMT
Received: from ovs104.us.oracle.com (/10.149.224.204)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 07 Jan 2021 20:35:06 +0000
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
X-Inumbo-ID: 019ee519-bf30-4fa5-bc3d-8f3e75502bcf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2020-01-29;
 bh=/KFniBUDgE1CDZR+wKbl9DuVufi1j0rCzyWZxtuLZVc=;
 b=BkQmxWkEdLXm+ZicbxPVP4fXpOVV9Ek305Jt2RERYKhRu3oj2qbJj8NpTreCKcyNC5nb
 7MVA2BzzSjsPHxr1eOJ9j/+2kBhNvLWd5VGBLpwIjNx0/MyhR1+9aZwL4Dlu9mZ03XFj
 0yuX4pcsW8o+BC5Xe1c9vaEBq3evtWInvVf4Cn7HGbxq3kpU3eoL+jITfrntKdGF4pWC
 Nc4xaLhEPg7VS8cOr7LTE/ILswqiA5rbrcHJUjpqKCwgCvQPEpXH5PdnmBmF+c/32eSA
 zDZq5Rr/9A6ylcIb93GOrvZdRnJVnLsjziIj6cthW7MaJoQI6zd+kJ1V9paCiYFi0w1t uw== 
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
To: xen-devel@lists.xenproject.org
Cc: iwj@xenproject.org, wl@xen.org, anthony.perard@citrix.com,
        jbeulich@suse.com, andrew.cooper3@citrix.com, roger.pau@citrix.com,
        jun.nakajima@intel.com, kevin.tian@intel.com,
        boris.ostrvsky@oracle.com
Subject: [PATCH 1/4] xl: Add support for ignore_msrs option
Date: Thu,  7 Jan 2021 15:34:55 -0500
Message-Id: <1610051698-23675-2-git-send-email-boris.ostrovsky@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1610051698-23675-1-git-send-email-boris.ostrovsky@oracle.com>
References: <1610051698-23675-1-git-send-email-boris.ostrovsky@oracle.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9857 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 phishscore=0
 suspectscore=0 spamscore=0 bulkscore=0 adultscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101070120
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9857 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 bulkscore=0
 clxscore=1011 spamscore=0 impostorscore=0 priorityscore=1501 mlxscore=0
 adultscore=0 mlxlogscore=999 lowpriorityscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101070120

This option allows guest administrator specify what should happen when
guest accesses an MSR which is not explicitly emulated by the hypervisor.

Signed-off-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
---
 docs/man/xl.cfg.5.pod.in         | 20 +++++++++++++++++++-
 tools/libs/light/libxl_types.idl |  7 +++++++
 tools/xl/xl_parse.c              |  7 +++++++
 3 files changed, 33 insertions(+), 1 deletion(-)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index c8e017f950de..96ce97c42cab 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -2044,7 +2044,25 @@ Do not provide a VM generation ID.
 See also "Virtual Machine Generation ID" by Microsoft:
 L<https://docs.microsoft.com/en-us/windows/win32/hyperv_v2/virtual-machine-generation-identifier>
 
-=back 
+=over
+
+=item B<ignore_msrs="STRING">
+
+Determine hypervisor behavior on accesses to MSRs that are not emulated by the hypervisor.
+
+=over 4
+
+=item B<never>
+
+Issue a warning to the log and #GP to the guest. This is default.
+
+=item B<silent>
+
+MSR reads return 0, MSR writes are ignored. No warnings to the log.
+
+=item B<verbose>
+
+Similar to B<silent> but a warning is written.
 
 =head3 Guest Virtual Time Controls
 
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
index 05324736b744..7b5fef771ee8 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -477,6 +477,12 @@ libxl_tee_type = Enumeration("tee_type", [
     (1, "optee")
     ], init_val = "LIBXL_TEE_TYPE_NONE")
 
+libxl_ignore_msrs = Enumeration("ignore_msrs", [
+    (0, "never"),
+    (1, "silent"),
+    (2, "verbose"),
+    ], init_val = "LIBXL_IGNORE_MSRS_NEVER")
+
 libxl_rdm_reserve = Struct("rdm_reserve", [
     ("strategy",    libxl_rdm_reserve_strategy),
     ("policy",      libxl_rdm_reserve_policy),
@@ -559,6 +565,7 @@ libxl_domain_build_info = Struct("domain_build_info",[
     ("apic",             libxl_defbool),
     ("dm_restrict",      libxl_defbool),
     ("tee",              libxl_tee_type),
+    ("ignore_msrs",      libxl_ignore_msrs),
     ("u", KeyedUnion(None, libxl_domain_type, "type",
                 [("hvm", Struct(None, [("firmware",         string),
                                        ("bios",             libxl_bios_type),
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index 4ebf39620ae7..942086c3f41d 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -2732,6 +2732,13 @@ skip_usbdev:
         }
     }
 
+    if (!xlu_cfg_get_string(config, "ignore_msrs", &buf, 0)) {
+        if (libxl_ignore_msrs_from_string(buf, &b_info->ignore_msrs)) {
+           fprintf(stderr, "ERROR: invalid value \"%s\" for \"ignore_msrs\"\n", buf);
+           exit(1);
+        }
+    }
+
     parse_vkb_list(config, d_config);
 
     xlu_cfg_get_defbool(config, "xend_suspend_evtchn_compat",
-- 
1.8.3.1


