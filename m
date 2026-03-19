Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CDvJL+FZvGlxxQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 21:17:37 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 231952D2002
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 21:17:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1257540.1551910 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3Jni-0003f8-W2; Thu, 19 Mar 2026 20:17:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1257540.1551910; Thu, 19 Mar 2026 20:17:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3Jni-0003cv-TT; Thu, 19 Mar 2026 20:17:02 +0000
Received: by outflank-mailman (input) for mailman id 1257540;
 Thu, 19 Mar 2026 20:17:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S4vP=BT=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1w3Jni-0003cp-3t
 for xen-devel@lists.xenproject.org; Thu, 19 Mar 2026 20:17:02 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c201::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9382efdb-23d0-11f1-9ccf-f158ae23cfc8;
 Thu, 19 Mar 2026 21:16:56 +0100 (CET)
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com (2603:10a6:20b:3de::17)
 by DB3PR0302MB9181.eurprd03.prod.outlook.com (2603:10a6:10:43c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Thu, 19 Mar
 2026 20:16:51 +0000
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba]) by AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba%3]) with mapi id 15.20.9723.018; Thu, 19 Mar 2026
 20:16:51 +0000
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
X-Inumbo-ID: 9382efdb-23d0-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZEjXOhJGtBETFSVX0pTwVwSD6VWhNgpCFnYBDB4Ucqw8v98NXLsQImaxwBwGYxTvqwNFTRo38k44N+jPkCUnamYNAPDzYRw7FGhGFxeh5bAiurb2eAms0ckV4PyhN8UvTk/l4lbqE66UYSErvyS3Uq3QAnby7uVnOgA7eF78stmUVJQ5wjTU4HbU/VrNWh9kctMPjryQIRTf+1oOsT4wKD6zLF0lsFl0pknBqPYTnNcXfm/Mv2oohl/3zdvUKpW95w4w9u46ZPHj2xFgMh5sJ0pF8um9ZIb0Nc0W8U2rvGoCvv5g+jzXvUngFJlmzjwuzDP8Ud+DZKqlD0VBJ3Vuuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/k9tEF6C75E8SkaNxV+B7vlz3q9AhZ/oiyzliJ9t7c4=;
 b=dSUmLKLyAUnF0FfOt5GrrsgdzpV1xnW9a5TUN35HWJwu9BeModeeR3d7VT94lrQRiivIIup2yOiD24OBEvzsCSlwDUtR+w5m/zGJG5+N+lL6SY5LpJDJYm0TjpEHvM2J/ScZhTs6+uVAnDN5xxlV4FJvOvXFrKVN245BX2i3roxil7nUugylFLAzsPAlh1fQFtz1oX38ijV0YkkOj0wpiZq/nglzlGIFzZ8QcerJzyjzihLVD4N6FEj5XrRdQoKGI3JcWf9lMHfGsBq5WD+vaWnE/vf2jqsQdwr3MK8DVOpxyAqUOfbfMHWt0JYJcyAcXPsW3jr3bIQ5LT2+hu0VEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/k9tEF6C75E8SkaNxV+B7vlz3q9AhZ/oiyzliJ9t7c4=;
 b=j8IbL/SV/PYSApngFw27tcqkKvv5Oer5l7jjeCf+eLWeoPYv3ktAiq/YkLiKVccMkFsvh8vl0zbluPPewADOoNiAe1gvv/CjNTTwvorx/0vwBN5mTSTU9on+TpB672z0g0egcjD2pCWgLoxM42xw2P9nvN/ljcl6gI6UtrfAsjZZvmG14gcP8aHiAWV+hPC7707/umXSRw0UVzrqjrdDhL7oC9k2Wa7hAgZQ9btzQk3kEaUaAreoEBGH7j0KrR3/xoeyVgJskLqsCxKYTfAGz0cAwSMuOc9Wiv+shvC8JwfLnnltJAwSJ+Redm0597LHVx/t1MKEvH41m+K4cialyQ==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Jens Wiklander <jens.wiklander@linaro.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal Orzel
	<michal.orzel@amd.com>
Subject: [PATCH] arm/tee: rename variable to address MISRA C Rule 5.3
Thread-Topic: [PATCH] arm/tee: rename variable to address MISRA C Rule 5.3
Thread-Index: AQHct91SP+heAl5ESUaIOkxQ7Vfzeg==
Date: Thu, 19 Mar 2026 20:16:51 +0000
Message-ID:
 <e7fd1f75146e7faa520414c4ffc1bd9572914039.1773951370.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR03MB7526:EE_|DB3PR0302MB9181:EE_
x-ms-office365-filtering-correlation-id: fa0526a1-f27e-405e-a46d-08de85f47526
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|42112799006|376014|366016|1800799024|38070700021|56012099003|18002099003;
x-microsoft-antispam-message-info:
 6243pW5zlkZ9Xs5skCWIt7heLV4N9IDgVLIDRAjjoWFnkeNuRx54mmOLmcCz0JPaazrq3ulzVgHiNAbK8indbjH2Or4qf7Fr5grcZql/APJY1WP38qa/rTxL4tDqXlYE1/BcElMJSJbztP/N9c8I8HZOade++HqlqevTZHoja3RFLGaSFi6yl+nb+tnQuawt+HG9Jccn97Jmt6RalqZUBWMh3s8Jczv1xvr8ZnNT2oIoK72mDxs6tnGWGTfs1G01Of1IHR97+BykYFJJTUhqufzZjAQaROvqVCV/zU/pRsJ8dHMTSSvu7RPhugWrQxAo04iBot9/dwxW0sG3GwevDGUFtQzZe6jmQOMlo2IO+r/UfwGnWIn5shDYACOfm4V0YM/Vn40PeCdjC6fu67lVXlY1efjfna5C7wnMPwGcjt6nvOWPOEL+Y+9/gH+XAitIAp1XYJPx9t5X7Wc4rWo6L7Ag4IC5F/cI7RDrI2jnHZ1JJcvwuJ/czMkXF3CWKh35VKncdReVZDme7mZsF30P3blFeE/E6+JkoMd40Cz3vcLpbPQm/rrZ5u1CUy5WSWPWgbmYqeGsyuX/cX92qw0UK7OztZEKJqcvNT35DPlr8lmBm8O/01HzRzMNL3GcaLmu6Pe8hWia1o8QqwZGEPSYuObHNGe4hWNSIGmSHRo/dAzyt/tzPKcMS1y4U9z3x4fPIm6nv8gUc/GYaA1KdkKdTh0wpCp9kwugP+dWqpba8axh8B0yD8IiSh+Q5ViKf2b2lVi3grg7yf+h52iq6PlSjHITCkUVZmauAYHq6NQGILE=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB7526.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(42112799006)(376014)(366016)(1800799024)(38070700021)(56012099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?JQnTm8G6AwdOkervvl9GOK5KkyCA9/QFf4M5P9Oi+cUOtlOBUN4TTU9aba?=
 =?iso-8859-1?Q?Z3MJGLvlqVT4Xz+c9rJgKMpYS6166Lo4LecjmrEXoMsAauLqkF40pS/st+?=
 =?iso-8859-1?Q?4o76SBZ/EmCg7ZCpT/C/qoD9TlDsWysy+0lv+NK4rUbedfUT1IsSJUE97a?=
 =?iso-8859-1?Q?soDQSgbS/ApgXRttSFFTK/nyGt7LbmRMJDNWkm/uzA34HzZNt3EjqiNfGa?=
 =?iso-8859-1?Q?UT8jqdMG9LImVRD+B0PHA6SC5/TA6z5aHU+HcGCh0gf1XxpDwvlAIRqrh1?=
 =?iso-8859-1?Q?ai+RpIG9rq6cJb7XPpAxpNvspC45yUa+MfB1ybtK+Npw4BpWO9HdaH+uh8?=
 =?iso-8859-1?Q?OyLlLdqZkp8hbiDw1IIx+edAPU+p5VGe81bwbCW/jvddltcf05gtYAcZ86?=
 =?iso-8859-1?Q?TUzk0t343itnmLmzGx5hYPMPcIDRtTfiJ9bRAclEeC9K6CCXis+eUu3MEN?=
 =?iso-8859-1?Q?Wk38XcMyXOc9JMTINwse6XOOGdZV/XtpT2xJc+WLOS0DeM0A0McuXSp2iu?=
 =?iso-8859-1?Q?6aL1HlK5DzIryZuXigfiL1Y//J9UI7IBnkaWoSfjhn3DQe+8TyfnTE6Ld6?=
 =?iso-8859-1?Q?94OxbQEmnhfYATKFBRcAZCfqXB2pptibQv6qVcZRbhgrW4t1f0kUMADjoB?=
 =?iso-8859-1?Q?5E+03s4tD0obp9Kkdalcq2CDtrq+UVM9AYDW3/9RR0IME31FtRtvL3+DqG?=
 =?iso-8859-1?Q?8hVx03fXauOyWVOE+VPyLXmGR3n8r61Zw5cOtiazENRNozNzk0CsZHBku9?=
 =?iso-8859-1?Q?wsGOWG5nYFw52AchAfAocHIK5SbU4RVYwiACKDQr1YTgs92Fm8h08GUdXF?=
 =?iso-8859-1?Q?PdI3R7qX6VvbMi29BwAe6DnAjXWW5baJMbqsMdhQbk0+mGkGwJJVf0kaLF?=
 =?iso-8859-1?Q?IGpnSVUGiONY/ffzJH6V2YrHPBn6XotzJcfJTh11O9o4XtRUv5CHtdQOMU?=
 =?iso-8859-1?Q?cq3tCgAX3h41rxccT8FqAjOb3sy7o1nJyhUQtw6wuU7BZeXCt8MMGpt3R9?=
 =?iso-8859-1?Q?cqUmxyRcoyG/Qx2o0R/bHISFuQBdtva7x6pFMU5XX7Ty21bCUvGXHfm4sC?=
 =?iso-8859-1?Q?qNDpDLed/A22sA0ZbVNzamc0u9tbxXV+BfHQIwIjN+9QXrsMAdYBgOyOSj?=
 =?iso-8859-1?Q?kNeNLViArWUjz8MVRWc/qqXVGCA88eIvkrLIOcEAHiq1NvjCbfJdba7xbq?=
 =?iso-8859-1?Q?k7Bji4Ucpaa/kpjOcHSe3DcYbqwCzjN0Upz0knhWoZ8d91Y0QEyL0f0HTM?=
 =?iso-8859-1?Q?kvHDdb0JSSIYvz2dmxNGpE0SL7NpIfDfLxP/q+UpW33HvIKMNH0xP/E2xE?=
 =?iso-8859-1?Q?YM7zbv9a1EHYxdprYwdCIKtH9EsAzk4lrYyfw++hiDw/yNGJEYGpcgoOD4?=
 =?iso-8859-1?Q?nVtoyomZIvvUVF8GlXemgdqZGwTU05MH2/A1BS6uWBTXuk3XycVTe1hkfC?=
 =?iso-8859-1?Q?3zm82ciiCkk+xWuU6cOXr4Nt1XEAt/1xdMVPqk8PsA3adwDvXIIIoBWCFk?=
 =?iso-8859-1?Q?1b9smiED+jHutpSHlJLUjzJXPuAezWIDprKwlgu+9XjA6NdKryRauz/k/3?=
 =?iso-8859-1?Q?8WQA+3mzw3TfO45tq+5g78s1Za4zNA4NZASYFSsAeq7p0dMfmCwepMIRHk?=
 =?iso-8859-1?Q?N5eCTIBknGWIeVRjJUDwEoNgxG6cUS2C3xgWzd79iOdAlbYehQtD+x4i7L?=
 =?iso-8859-1?Q?qy4FaeymWutOQJ0QgD2ghG/X3HLRYXHVYrSO5X7U7B24eXAaiW7Dq2PYy0?=
 =?iso-8859-1?Q?HEmGxCtXvKttBblexTfDvx+T8Nnn+Yri1Co8ln5Nce8tL/sysFcGMqi/zX?=
 =?iso-8859-1?Q?JjGIgXY2iaE1nEGt5RdTkehbuoHXag0=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB7526.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa0526a1-f27e-405e-a46d-08de85f47526
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2026 20:16:51.7114
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f0UQxaSwpjkC/kskMu2DJepl4TGqUOSiyvQX9HHbNzaDnHRWdPYuJDvcEm3nQ5H8cJNDpVp3WTQc5VPxCfqfjDRxm/uX1vFDSrW/9v+LTbU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0302MB9181
X-Spamd-Result: default: False [-1.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[dmytro_prokopchuk1@epam.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:dmytro_prokopchuk1@epam.com,m:Volodymyr_Babchuk@epam.com,m:bertrand.marquis@arm.com,m:jens.wiklander@linaro.org,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmytro_prokopchuk1@epam.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[epam.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 231952D2002
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The local variable 'ffa_vm_count' shadows the global variable, declared
in 'xen/arch/arm/tee/ffa_private.h', therefore it is renamed
'ffa_vm2vm_count'.

No functional change.

Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
---
 xen/arch/arm/tee/ffa_partinfo.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/xen/arch/arm/tee/ffa_partinfo.c b/xen/arch/arm/tee/ffa_partinf=
o.c
index fdb03dae9a..473507ca3a 100644
--- a/xen/arch/arm/tee/ffa_partinfo.c
+++ b/xen/arch/arm/tee/ffa_partinfo.c
@@ -265,7 +265,7 @@ void ffa_handle_partition_info_get(struct cpu_user_regs=
 *regs)
     uint32_t dst_size =3D 0;
     size_t buf_size;
     void *dst_buf, *end_buf;
-    uint32_t ffa_vm_count =3D 0, ffa_sp_count =3D 0;
+    uint32_t ffa_vm2vm_count =3D 0, ffa_sp_count =3D 0;
=20
     ffa_uuid_set(&uuid,
              get_user_reg(regs, 1),
@@ -310,7 +310,7 @@ void ffa_handle_partition_info_get(struct cpu_user_regs=
 *regs)
          */
         if ( ffa_uuid_is_nil(uuid) )
         {
-            ffa_vm_count =3D get_ffa_vm_count();
+            ffa_vm2vm_count =3D get_ffa_vm_count();
=20
             /*
              * Workaround for Linux FF-A Driver not accepting to have its =
own
@@ -320,7 +320,7 @@ void ffa_handle_partition_info_get(struct cpu_user_regs=
 *regs)
              * the requester endpoint information should be included or no=
t
              */
             if ( ACCESS_ONCE(ctx->guest_vers) < FFA_VERSION_1_2 )
-                ffa_vm_count -=3D 1;
+                ffa_vm2vm_count -=3D 1;
         }
=20
         goto out;
@@ -355,7 +355,7 @@ void ffa_handle_partition_info_get(struct cpu_user_regs=
 *regs)
             goto out_rx_release;
     }
=20
-    ret =3D ffa_get_vm_partinfo(uuid, &ffa_vm_count, &dst_buf, end_buf,
+    ret =3D ffa_get_vm_partinfo(uuid, &ffa_vm2vm_count, &dst_buf, end_buf,
                               dst_size);
=20
 out_rx_release:
@@ -370,7 +370,7 @@ out:
         if ( flags || ACCESS_ONCE(ctx->guest_vers) =3D=3D FFA_VERSION_1_0 =
)
             dst_size =3D 0;
=20
-        ffa_set_regs_success(regs, ffa_sp_count + ffa_vm_count, dst_size);
+        ffa_set_regs_success(regs, ffa_sp_count + ffa_vm2vm_count, dst_siz=
e);
     }
 }
=20
--=20
2.43.0

