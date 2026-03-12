Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MDxYJ+yJsml4NQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 10:39:56 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB2626FB9D
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 10:39:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1251873.1548746 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0cW4-0003aY-6v; Thu, 12 Mar 2026 09:39:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1251873.1548746; Thu, 12 Mar 2026 09:39:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0cW3-0003Wl-Vx; Thu, 12 Mar 2026 09:39:39 +0000
Received: by outflank-mailman (input) for mailman id 1251873;
 Thu, 12 Mar 2026 09:39:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gOdu=BM=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1w0cW2-0002bV-Mr
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2026 09:39:38 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 61c3fa2c-1df7-11f1-b164-2bf370ae4941;
 Thu, 12 Mar 2026 10:39:36 +0100 (CET)
Received: from AS2PR03MB10110.eurprd03.prod.outlook.com
 (2603:10a6:20b:57a::22) by VI0PR03MB11417.eurprd03.prod.outlook.com
 (2603:10a6:800:33f::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.22; Thu, 12 Mar
 2026 09:39:31 +0000
Received: from AS2PR03MB10110.eurprd03.prod.outlook.com
 ([fe80::4d2f:ff40:d0ba:e581]) by AS2PR03MB10110.eurprd03.prod.outlook.com
 ([fe80::4d2f:ff40:d0ba:e581%5]) with mapi id 15.20.9700.013; Thu, 12 Mar 2026
 09:39:31 +0000
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
X-Inumbo-ID: 61c3fa2c-1df7-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lUh8+l8fAijN2tjwRMz8Ls5WZgIH0FYnN5h8Amy8zU0kaiawgXqNeD6hVrHCn+BnEqv/k8TTPu0qUJkLdZBKZyfGFW+kBZd5lh1G9punrVBk3CuAbQme7o40keiKBC5SfL17/S5z+PQc6T3mZu54garp/BGzzqLlukLNNNz2mYTPKSvqJS0mLrIPHIc25twrvxAWv02f14y8WsPTQofekBs0VUuGYK8ELV3kNlcHN0wpJiK4Mqe00PSDtTGGQ5NEdZAYYWkxZj70r4B71MoTNkP1zpHX0u8KfVuLBBattLHow1E8ZSLgM+JJMxDxGxJK+2OuYVax/Ep1LRqefAEDDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nZy/cC7uH53ZqgH6AZbNe+UaJ7u0hXrJKUMyqSL4zZk=;
 b=i5DOcIAh42Em1RkW9sVfZt+GOfRSvQrPU0s/tzLVRG7wlPT5vjkS6oQcFNq8UN++WRIO5LayIAf+xJSCvbmuUcSOUWTENxOe+HveUiqiryowCwVA8zN8d9++01hrImIJOB7iWL1vHmoSkwzffZIYkTowcY2GoeEsSx3v36GXwMrVm3HLGarlij8VRdZJ5BTediOc9U5zYK2A31ZPUKsAkr3bwKd8dksvuNRbRL9O5VKgrm1tXgJh8RavDxMXpwRHGm2QVkCtV8e9OMvXZKbBU+ycJeDRU16mMveBNDLVb3M8r4hydUvskxOea0t54Ce782+rxxn4e6ra337JdG7iGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nZy/cC7uH53ZqgH6AZbNe+UaJ7u0hXrJKUMyqSL4zZk=;
 b=ooagV3cAaTaM6hBwkWIKXXpbyL7w6IzQvDFHw+taULEGJbX3T5hdqnR2tCOJAND9Z/5ttaiNaqwUrhIBc1qBj3fmb9VYDiluHe5kr/OzPMK5oJz2uAvfM2WVNFCvwPjFVscQVPFUpGAtbr+GQbePkqwFLZLHL9C4V+JsMDhS4jEo+QDwo4oidmUiRNlgGkgvj4u4eAQehc2E1eyU/otugMMZeOvLJNL45jNDSLR4xd3t3Xez5huDbASi+Frv6OFb4KIduAtCgIC+11UaHkQVaSLTL+v4pcSwby+ONyYpX01elR4BNn/8Fp8l96mgUWRtKA19oEy6cz0Q72agcNCYfw==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v6 5/5] docs: Document CPU hotplug
Thread-Topic: [PATCH v6 5/5] docs: Document CPU hotplug
Thread-Index: AQHcsgQgNCk5TPCZikiOg71JPbDw/A==
Date: Thu, 12 Mar 2026 09:39:31 +0000
Message-ID:
 <4857e0c10c59f283e4a3686bf9188a1809a9fd55.1773307749.git.mykyta_poturai@epam.com>
References: <cover.1773307749.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1773307749.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB10110:EE_|VI0PR03MB11417:EE_
x-ms-office365-filtering-correlation-id: 2ce65a7d-1d19-4600-544e-08de801b436e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info:
 /pw5MgR+Vim76jdh13fsrhqE4JYx4GqKkEgsIzRv4sQ2xVgHNzREX8/wRgFsouWAlG1pC4+vF9UcPHedthDbFj4g7EYcGQbzb3iEbOI3gxnm/EUof+FFEvpj5Y2HBJQyzPLJcqlXGiaLBc0OHSrUEMXf4uupSILYKyCouxXRTa7QT+FOUT+mKf56+79sLLQlL8Nqm1Ul30k0/jfJh7iGWhydoIDb/OSwyOboTr4vKl/kVeXayWmvYhsjHTNy50t3qOCYw26PASHSGGR4zlNRyBGQdsnYga0Xg30XhVe7u9mFi0asIsfS3cCpC7bZGKCIgqEjVmSe+bCA+sY4gsPemvKfhzSUP8sDOaFb3R761eFm4enbY94lHPY2V5XTR6m6o+6J3RYLKDfKRbjLq42owZFMXuL0b0p3JD3vWLwgTZ3JZ4OiuYFteR10CsChzENa6KA/BG6VY30mXHG4eH0oRNt+zv1lja3RdMs6A+cvVsqopTngi+P07R0VeeoW9S23q2HN1uMKWQGFeuAKT4zuOHDS5zh8wVjUA0Cm814jVIUCX+Ooz0RL8o7OiXYcmcav3GVxiMr7soLGHb7sHHaWZYkTERbEhnhafEnJdfMeLwl5/jCgv5K7hE2X91c6J1gxaghzu8MpHuWMztxaoigRzopelsTqGinnJMJ/Y45X4CGEGWPirde8lPq+291zMDH7c1Ql9XU9TG+EtQaDSTBSkUUQvuFWy9McOjeyQ+OfjKB6MqA3A5huHm/h5ALbgVP+g4ptmjgxyvVk77xPssd/4pw5MB/cSJO9On6+5uNmBTM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB10110.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?Hz2A4oz6cnaHyT+0bWCfwgKISZKX/wZciT3GmEhzXYyiy1IVyWG4DmYUX0?=
 =?iso-8859-1?Q?MjFTyBK+e3GsYUU2NFrSuV9oOkr//WL/+gw29Isj+WJVVeCbSuAl1LwrXF?=
 =?iso-8859-1?Q?manyZuak5Fnx/X4LBeVCtB7cP+WoIdQCo6lnFgIvOhD8EIrcPytQrB0NOH?=
 =?iso-8859-1?Q?nA+fq02DdWs9MHK5Z1BYXsxx0LqJkhhuyI2xLunYgLgJBnKEqptBvLfieU?=
 =?iso-8859-1?Q?gOjf999+zPCbgrJbiPoFMUISJkMZN0QIAvJ2jWY8PoqKkEPm/XduAl2OoB?=
 =?iso-8859-1?Q?FAx25TvHeiqkPC5WTjVcASTXlM+NJEnI2ZcZ2v2YcR9+mIPs0rk9PqdFq6?=
 =?iso-8859-1?Q?OAQ2XwKUBGE3v1/JqpN9QWhVC060HrmRL2P6GTETTPNTqk+uiUqxc7Eu70?=
 =?iso-8859-1?Q?6JGVdLBrBf9Zu5iwL+LDwWCzk1NR4xk6qb9HzXL1uMNmf/2TmZFJIeulVt?=
 =?iso-8859-1?Q?LhHnPIvs6fkAZ2oVXqcGpDikm3SGTicLX/8tGJW4dMblVJF9t8ojeQaWWO?=
 =?iso-8859-1?Q?jKSyWzgVdsDrjOHsvbIxHXgekU/iw7HXilaVE+DE/yt1zkleC9G5qaI+EP?=
 =?iso-8859-1?Q?Wxxfn3nk+OZEWUZFN6GFm0wC2vYXm2mcyTfJWbb5kkhzDKRzG9cJU/f6Iw?=
 =?iso-8859-1?Q?931XfgpnxV74+KcZT9+8YmmLEqHeMKhvhTt1jiCQxmq8TXpaE2WgP84TpT?=
 =?iso-8859-1?Q?JPdS+205/IL8Sznw2ninJ3Bq/DKya540L4ykf30z33gzuSRry9TBIhl1sV?=
 =?iso-8859-1?Q?AHOGHyZtl65AyWO1gwp1unpuIg4vt/HhXNPAjRTxJZ0pvp9zHUwwJ0ESfq?=
 =?iso-8859-1?Q?82Xmj1xxfjs1QZ7j1vj0VOvNHS8s8m850SxzENkKqq6cld4Ruw9pbTlye1?=
 =?iso-8859-1?Q?mgluidoXea9IAIWeh9kaaosCquowr5TJFQAiCDxeFrFzLeb/m4ugMUSxor?=
 =?iso-8859-1?Q?6qUVl4X4ah6xzdnkuOD/n5LRGNQ/JhpX+bTNfnS1hXFegIqCjn0c2cXggc?=
 =?iso-8859-1?Q?YIURmNRl+5WFGZTvYakC46jGURF11KuvXyhJfO7za2HvKd0wVL58TMXTOI?=
 =?iso-8859-1?Q?3qxZtfUAGycovB3a3xVMflcpGlbqc6rDksXy6tvQCVQNcSY0uxDcSDWRFV?=
 =?iso-8859-1?Q?O1/hz4XZqph2tQnNXfyC4ScmBilqgJxf7Vmh78eNDqbIxL5QiwHZTTsNyn?=
 =?iso-8859-1?Q?yyz+TPd+dB+htpxZkLan99z85WT7mFZXR8jAZruO0KoP6LUvzOZziA1eB/?=
 =?iso-8859-1?Q?Hb5ond9Yz9NjUmT3TOg/X5O7shq5mn3g7DNKr024ZXgPfrc2avkJICp0MB?=
 =?iso-8859-1?Q?J9w6dvQGWss392iyPyZ6e31Tq5oyqmdPF5HzsWpaSaR+XA8uFpPnMEy/u0?=
 =?iso-8859-1?Q?OMGX/UNMBurh1DINkEA9ordPxFMzjRnrkTF/k2HEzGZutrz0bruQLzMLr9?=
 =?iso-8859-1?Q?fnTJjaffeRNXNwdUkqSf3gQbnbk+zbO9zZJTFlxUAByCPUVcKr8MRBWtpH?=
 =?iso-8859-1?Q?pZI4uhv+IhEbNz8MHTvETUmTXa+QGI67rIf7ddE68xeujFJ493oJ9hvjfd?=
 =?iso-8859-1?Q?3scQXElL3h1iL4Vpm4IDwh4CsAIPpkfm+hdp43Ata1YsINQ4WJSw3OGW5C?=
 =?iso-8859-1?Q?Lo2YuohBwl6mE31IzikdkAEXCxSGzTd9YfUvAC5rBHNDYk4Ox/PBILx/2L?=
 =?iso-8859-1?Q?sSCS3uHA6lcGR9MVDZxDAwtRFZ6joeZ2cUxhb0D0836Hz7SZI/uKctCc+W?=
 =?iso-8859-1?Q?IajxcTF6OOsD/rGcnw5YErVSN1OZxYqK5/LGkB9fJr0JFitk52S/QfyR7C?=
 =?iso-8859-1?Q?3NeX19VyCvz0uKs+XuJHAPQQAHlGYH0=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB10110.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ce65a7d-1d19-4600-544e-08de801b436e
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2026 09:39:31.6558
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u0I7QAJZ4S8sn/DVT3ofeYVTULjWtutwsHZtI7/p1aJzGVlS+L916ZLAXRj9S3Az8vEK4NpxjK4J+ZZJ+97gvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR03MB11417
X-Spamd-Result: default: False [-1.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Mykyta_Poturai@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 1CB2626FB9D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---

v5->v6:
* no changes

v4->v5:
* s/supported/implemented/
* update SUPPORT.md

v3->v4:
* update configuration section

v2->v3:
* patch introduced
---
 SUPPORT.md                |  1 +
 docs/misc/cpu-hotplug.txt | 50 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 51 insertions(+)
 create mode 100644 docs/misc/cpu-hotplug.txt

diff --git a/SUPPORT.md b/SUPPORT.md
index d441bccf37..7b93ae69e7 100644
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -52,6 +52,7 @@ For the Cortex A77 r0p0 - r1p0, see Errata 1508412.
 ### ACPI CPU Hotplug
=20
     Status, x86: Experimental
+    Status, Arm64: Experimental
=20
 ### Physical Memory
=20
diff --git a/docs/misc/cpu-hotplug.txt b/docs/misc/cpu-hotplug.txt
new file mode 100644
index 0000000000..45f20c2002
--- /dev/null
+++ b/docs/misc/cpu-hotplug.txt
@@ -0,0 +1,50 @@
+CPU Hotplug
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+CPU hotplug is a feature that allows pCPU cores to be added to or removed =
from a
+running system without requiring a reboot. It is implemented on x86 and Ar=
m64
+architectures.
+
+Implementation Details
+----------------------
+
+CPU hotplug is implemented through the `XEN_SYSCTL_CPU_HOTPLUG_*` sysctl c=
alls.
+The specific calls are:
+
+- `XEN_SYSCTL_CPU_HOTPLUG_ONLINE`: Brings a pCPU online
+- `XEN_SYSCTL_CPU_HOTPLUG_OFFLINE`: Takes a pCPU offline
+- `XEN_SYSCTL_CPU_HOTPLUG_SMT_ENABLE`: Enables SMT threads (x86 only)
+- `XEN_SYSCTL_CPU_HOTPLUG_SMT_DISABLE`: Disables SMT threads (x86 only)
+
+All cores can be disabled, assuming hardware support, except for the boot =
core.
+Sysctl calls are routed to the boot core before doing any actual up/down
+operations on other cores.
+
+Configuration
+-------------
+
+The presence of the feature is controlled by CONFIG_CPU_HOTPLUG option. It=
 is
+enabled by default on x86 architecture. On Arm64, the option is enabled by
+default when ITS, FFA, and TEE configs are disabled.
+xen-hptool userspace tool is built unconditionally.
+
+Usage
+-----
+
+Disable core:
+
+$ xen-hptool cpu-offline 2
+Prepare to offline CPU 2
+(XEN) Removing cpu 2 from runqueue 0
+CPU 2 offlined successfully
+
+Enable core:
+
+$ xen-hptool cpu-online 2
+Prepare to online CPU 2
+(XEN) Bringing up CPU2
+(XEN) GICv3: CPU2: Found redistributor in region 0 @00000a004005c000
+(XEN) CPU2: Guest atomics will try 1 times before pausing the domain
+(XEN) CPU 2 booted.
+(XEN) Adding cpu 2 to runqueue 0
+CPU 2 onlined successfully
--=20
2.51.2

