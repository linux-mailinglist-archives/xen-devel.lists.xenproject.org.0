Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7OWRMoycLWq1hwQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sat, 13 Jun 2026 20:08:12 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25CFF67F430
	for <lists+xen-devel@lfdr.de>; Sat, 13 Jun 2026 20:08:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=YhSNFuuI;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=GdieRbw7;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=qualcomm.com
Received: from list by lists.xenproject.org with outflank-mailman.1337475.1598798 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wYSlQ-0008O3-HV; Sat, 13 Jun 2026 18:07:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1337475.1598798; Sat, 13 Jun 2026 18:07:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wYSlQ-0008Ko-Dc; Sat, 13 Jun 2026 18:07:24 +0000
Received: by outflank-mailman (input) for mailman id 1337475;
 Sat, 13 Jun 2026 17:52:04 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <philmd@oss.qualcomm.com>) id 1wYSWa-0006zS-Q4
 for xen-devel@lists.xenproject.org; Sat, 13 Jun 2026 17:52:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wYSWa-00D7c7-63
 for xen-devel@lists.xenproject.org; Sat, 13 Jun 2026 19:52:04 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <philmd@oss.qualcomm.com>)
 id 6a2d9865-bab6-0a2a0a5309dd-0a2a45089978-44
 for <xen-devel@lists.xenproject.org>; Sat, 13 Jun 2026 19:52:04 +0200
Received: from [205.220.180.131] (helo=mx0b-0031df01.pphosted.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <philmd@oss.qualcomm.com>)
 id 6a2d98c2-63b5-0a2a45080019-cddcb4839fd6-3
 for <xen-devel@lists.xenproject.org>; Sat, 13 Jun 2026 19:52:03 +0200
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65DFBGOd3258734
 for <xen-devel@lists.xenproject.org>; Sat, 13 Jun 2026 17:52:02 GMT
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ery7gsq5m-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Sat, 13 Jun 2026 17:52:01 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-9158e75cbc0so312379585a.2
 for <xen-devel@lists.xenproject.org>; Sat, 13 Jun 2026 10:52:01 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606f2ce361sm16615053f8f.31.2026.06.13.10.51.59
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 13 Jun 2026 10:52:00 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gZNeOce+dK0KUkcgQ5PeixCUOSWnH6ycUAlOAzLUVQ4=; b=YhSNFuuIe4WGHWUa
	6NcMP8PeVgTiTdrcWlk2frHViUn59WsDvcbFBLFbCP0BoiqcsXTibD6QoJd/rybr
	lmybUl2eceYoXK1doSe1UvVKZU0xPyf++UKSRuTrvPZ8kslcretujWkDgiIH7Gn+
	PnGfHmFzdK79brT/p+7vMtK0RQI9fm4eegJyTJDiKrMuVYWrw7LTA98oaIbxxGVX
	cp/zmNbVWv3t7G+e5oM6cvIjtFzvBzXjwRW8ekwY9CLryCa7PEeTsGAyPuQSYb9I
	Ptt8szG08p/M0sXzLjFlwwZfTgEJ6y+MvhW8dLW7aLc4f+GyllYVCdGOuMG4EdW+
	b8mmVA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781373121; x=1781977921; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gZNeOce+dK0KUkcgQ5PeixCUOSWnH6ycUAlOAzLUVQ4=;
        b=GdieRbw7f4q78a9rKZH8pfaEUIlGyrhnCBJD22zswxi/LkJ0BaYRH57Bg9/shIslOr
         C9KUiFYFMGIf6B6+Ik5aKyVDO3YrlCkzllCG0JcNr/j28NqrF7BF8MSHlph7PzXGWYl6
         bMOryEUZK22fHqe3opA1RgZQ+cBCbm1jvD7O+pL17+et+31nPQZAIk0GcOVuAoaktx0D
         LAZhEStLk7TrZmLWfu8tFyxDyvOQH1OTPmqtN/WVaPxvjoJkRyF813Q0yxQxtm7dO84A
         FvPO8cCrzI7Ylh8b3CS9keiYRUz+5kohVHr9khbeK86kOna+jN4YsuJ20g0RhC+80qqC
         NYzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781373121; x=1781977921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gZNeOce+dK0KUkcgQ5PeixCUOSWnH6ycUAlOAzLUVQ4=;
        b=dNh6QSTf8ZwoaQHiotmJRD34XJzivlboGBgj0P+U7SAZX6/QFcWzE5N+XXmX8M1LDt
         9jjyx/DFTjoBAM94j12aWisngmizgaC1RSatB3tquEJB6YGQaJF34LG/sHrcQbUTZuwC
         pVyCAGg8e3/+isd38TbqMA8+jlvvPoUCn+T9wwzQMtr53kdwa0WTJQMdfHYAcAmo4u/m
         84O8gLWiMr6yEAW8AGBjEm+ODxScqLPSmjC3wQg+uE5v6d0OVICHnmLX+CixKtlJrHII
         yxxLiUp2pWnOAEaZoybfx1jDu8DLtw9vX/u+d+NMMZ4bUruvUzJ0MuA/dgiECs0AgaSt
         k+rA==
X-Forwarded-Encrypted: i=1; AFNElJ/LnEWRwpcnl44gk8tqHtZyLgyZSIAG6o8ON/7s2ucgcJ0oziEGWbkinv7+Ejj9+Skxrj0DlTw9ArM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YySfU1UtBjDHcpQXA8ctZjsMEiV/3IhfguteR5QHW83otYcmFEO
	QvN26xk5yJL7qo5wfFyNEYpGncvMrmXZ1EW36zP5OJD6jUkQMYhTPUJcwOtfLe/V7rVWt0+Oel8
	abRfEIbNojWgXxoVYAJUorgaSx1TyMKsqB0004EPRaiPB0F2iRbtf07tMO2GWQI42xrqtQA==
X-Gm-Gg: Acq92OFmWWMXwbF0A73GQHaqFkJt6wBdYgPVIHp+1BnUycHgdvwniHblFnWiD38tCow
	OliZVA2wBPFu7UmBy6jmRC+eTAees3hHKCKDKsCsowE+Y4CAz8b18TStI8uCY3vnXAdpRdl/PJ3
	l8FCoIK+Mt38Vcili64OHtzWffH4jBw4adHAvHposKQBKBfVIZwyyK+YS4SznKJNYbf3kjV+bM1
	o8MincrH520KTK6pKn3PLZRrBEzDYLwnidef3vYI7axSTl4nYq4aVyzoHUhG/kgesYwszRS7YIY
	kBGd5r+92dmcQOlSYjzFMkVwa8Jqe7xcqHHwxYWtOmreyQ/2XcphMQ+ZuvTxM5EowSlcwrrm6aE
	Y2NNT3BKc6j4sp1mbw/RfmopHWDAS4/0a0kZVhizcx+9gL/vduxFY7rJiHvbtWWhwysnk7LP/aO
	J0AwePtWhO
X-Received: by 2002:a05:620a:46a4:b0:915:5ce5:d3ce with SMTP id af79cd13be357-9161b94df24mr1173534885a.0.1781373121190;
        Sat, 13 Jun 2026 10:52:01 -0700 (PDT)
X-Received: by 2002:a05:620a:46a4:b0:915:5ce5:d3ce with SMTP id af79cd13be357-9161b94df24mr1173532085a.0.1781373120808;
        Sat, 13 Jun 2026 10:52:00 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
        xen-devel@lists.xenproject.org,
        =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
        Anthony PERARD <anthony@xenproject.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH 1/2] hw/xen/interface: Remove pre-C99 checks
Date: Sat, 13 Jun 2026 19:51:50 +0200
Message-ID: <20260613175151.1357-2-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260613175151.1357-1-philmd@oss.qualcomm.com>
References: <20260613175151.1357-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEzMDE4NiBTYWx0ZWRfXx8ItPjJZnabI
 mKQ3+ymhQDKtGvtNgg++3l6wzR2Ykyy/gRNlI0h4YbbTtC7eoSdEf6Vscdlmq99GhpypDKgMoxE
 6C6FgDxzciEUUiQiEa5sp1IfCfvb0Jw=
X-Authority-Analysis: v=2.4 cv=fLYJG5ae c=1 sm=1 tr=0 ts=6a2d98c1 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=vkG9KRslzty0At4LJNIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEzMDE4NiBTYWx0ZWRfXypt5mFJmjhlO
 spOfFP3LO9W3Whq40ed//TAjR73R6qbv3OdEYojTfUzVuAZTOlGQz5spC7wMc6Pwlq0p0UV7wfT
 QAC43STWSVJQ/lL8d/nDcDdR1p5Oix3FpUW/QhihKeyvpNVDmsRclzjOTx3fWwP8bdKqz0Dt5AK
 TIMv2WdViyfCmPQx7bV0uDcRJHzmFW3/GLAm+JFRb3lIO+O5i4lGmejGRiH3cdTM7m1lYblVZ+C
 ceNiIKGJr+C1/RlhN3JAcdUie+scAZMhkGZhmW1DY6rHYOE175Dc8+I80v5cB5wG14M+YUbCEDl
 PCkB7Cy/sfnNdN9ahzgIPkIjFUlSo7BsUUquXsUX/wUeDpyiez4fG98sw6/XLhnHUWLmqeALOCE
 xunnsfcx3OCijRCuovH8bBicUtGN8stoPmKixFSv2jc/yDJJhlwowYlt0ti9uQeP9Nrt2XCRpQ9
 82NqluvsZ5m1CuunShA==
X-Proofpoint-GUID: cgtWdZ8x-NFDEffJmQR6G6waAgqmeORK
X-Proofpoint-ORIG-GUID: cgtWdZ8x-NFDEffJmQR6G6waAgqmeORK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-13_03,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606130186
X-purgate-ID: tlsNG-c1860d/1781373124-C5784DB1-EB530CE6/0/0
X-purgate-type: clean
X-purgate-size: 3619
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,lists.xenproject.org,redhat.com,xenproject.org,kernel.org,oss.qualcomm.com];
	FORGED_SENDER(0.00)[philmd@oss.qualcomm.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:qemu-devel@nongnu.org,m:edgar.iglesias@gmail.com,m:xen-devel@lists.xenproject.org,m:berrange@redhat.com,m:anthony@xenproject.org,m:pbonzini@redhat.com,m:sstabellini@kernel.org,m:philmd@oss.qualcomm.com,m:edgariglesias@gmail.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[12];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[philmd@oss.qualcomm.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 25CFF67F430

We mandate a compiler supporting C99 since 2019-01-17 in
commit 7be41675f7c ("configure: Force the C standard to gnu99"),
thus supporting flexible array members. Remove what is now dead
code.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 include/hw/xen/interface/physdev.h    |  2 +-
 include/hw/xen/interface/version.h    |  5 ++---
 include/hw/xen/interface/xen-compat.h |  2 --
 include/hw/xen/interface/xen.h        | 14 --------------
 4 files changed, 3 insertions(+), 20 deletions(-)

diff --git a/include/hw/xen/interface/physdev.h b/include/hw/xen/interface/physdev.h
index f0c0d4727c0..8da03b685ad 100644
--- a/include/hw/xen/interface/physdev.h
+++ b/include/hw/xen/interface/physdev.h
@@ -283,7 +283,7 @@ struct physdev_pci_device_add {
      * First element ([0]) is PXM domain associated with the device (if
      * XEN_PCI_DEV_PXM is set)
      */
-    uint32_t optarr[XEN_FLEX_ARRAY_DIM];
+    uint32_t optarr[0];
 };
 typedef struct physdev_pci_device_add physdev_pci_device_add_t;
 DEFINE_XEN_GUEST_HANDLE(physdev_pci_device_add_t);
diff --git a/include/hw/xen/interface/version.h b/include/hw/xen/interface/version.h
index 9c78b4f3b6a..41ff28c7ee5 100644
--- a/include/hw/xen/interface/version.h
+++ b/include/hw/xen/interface/version.h
@@ -77,9 +77,8 @@ typedef char xen_commandline_t[1024];
  */
 #define XENVER_build_id 10
 struct xen_build_id {
-        uint32_t        len; /* IN: size of buf[]. */
-        unsigned char   buf[XEN_FLEX_ARRAY_DIM];
-                             /* OUT: Variable length buffer with build_id. */
+        uint32_t        len;    /* IN: size of buf[]. */
+        unsigned char   buf[0]; /* OUT: Variable length buffer with build_id. */
 };
 typedef struct xen_build_id xen_build_id_t;
 
diff --git a/include/hw/xen/interface/xen-compat.h b/include/hw/xen/interface/xen-compat.h
index 97fe6984989..582c0182367 100644
--- a/include/hw/xen/interface/xen-compat.h
+++ b/include/hw/xen/interface/xen-compat.h
@@ -24,6 +24,4 @@
 #error "These header files do not support the requested interface version."
 #endif
 
-#define COMPAT_FLEX_ARRAY_DIM XEN_FLEX_ARRAY_DIM
-
 #endif /* __XEN_PUBLIC_XEN_COMPAT_H__ */
diff --git a/include/hw/xen/interface/xen.h b/include/hw/xen/interface/xen.h
index 920567e0062..a6f4aa61993 100644
--- a/include/hw/xen/interface/xen.h
+++ b/include/hw/xen/interface/xen.h
@@ -36,15 +36,6 @@ DEFINE_XEN_GUEST_HANDLE(uint64_t);
 DEFINE_XEN_GUEST_HANDLE(xen_pfn_t);
 DEFINE_XEN_GUEST_HANDLE(xen_ulong_t);
 
-/* Define a variable length array (depends on compiler). */
-#if defined(__STDC_VERSION__) && __STDC_VERSION__ >= 199901L
-#define XEN_FLEX_ARRAY_DIM
-#elif defined(__GNUC__)
-#define XEN_FLEX_ARRAY_DIM  0
-#else
-#define XEN_FLEX_ARRAY_DIM  1 /* variable size */
-#endif
-
 /* Turn a plain number into a C unsigned (long (long)) constant. */
 #define __xen_mk_uint(x)  x ## U
 #define __xen_mk_ulong(x) x ## UL
@@ -986,13 +977,8 @@ typedef struct {
       ((d) >>  8) & 0xFF, ((d) >>  0) & 0xFF,                           \
                 e1, e2, e3, e4, e5, e6}}
 
-#if defined(__STDC_VERSION__) ? __STDC_VERSION__ >= 199901L : defined(__GNUC__)
 #define XEN_DEFINE_UUID(a, b, c, d, e1, e2, e3, e4, e5, e6)             \
     ((xen_uuid_t)XEN_DEFINE_UUID_(a, b, c, d, e1, e2, e3, e4, e5, e6))
-#else
-#define XEN_DEFINE_UUID(a, b, c, d, e1, e2, e3, e4, e5, e6)             \
-    XEN_DEFINE_UUID_(a, b, c, d, e1, e2, e3, e4, e5, e6)
-#endif /* __STDC_VERSION__ / __GNUC__ */
 
 #endif /* !__ASSEMBLY__ */
 
-- 
2.53.0


