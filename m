Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kJBCGuyJsml4NQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 10:39:56 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B7726FB9B
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 10:39:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1251871.1548732 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0cW2-0003He-DZ; Thu, 12 Mar 2026 09:39:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1251871.1548732; Thu, 12 Mar 2026 09:39:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0cW2-0003FM-9d; Thu, 12 Mar 2026 09:39:38 +0000
Received: by outflank-mailman (input) for mailman id 1251871;
 Thu, 12 Mar 2026 09:39:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gOdu=BM=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1w0cW0-0002bV-ME
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2026 09:39:36 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6108d8fb-1df7-11f1-b164-2bf370ae4941;
 Thu, 12 Mar 2026 10:39:34 +0100 (CET)
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
X-Inumbo-ID: 6108d8fb-1df7-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UbO9QMvNEXNJbjC5zad+7U4SMLE9fXhIhaxFLr6BlLhT6/wp8YoSIc3H0I8J8HWukrrwGFgg4ehllq8kjBkBg+NdGO7S+h3G/vaboiuVlyB+6HRaRQJaH85044ZHsLHQW5lzW+KtOwgqPTEhbsbJIa7W890VT0PpJW2tYXsQsUvoNAmfmOGWhj9v11g+OAb5wnuz52bTlPCcCl6SA5+IvKXpT8PipCSgCt97DVhILG7/ZlInA7jmkChR/HgI/gVkENxauUDiDYbuXQYf4EutkpKHjQyGxiJGYtRtRy6n7d/OLOmInI6cwkOyb8/FGS7whsHBXHtTlklVetDPVCkBEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yuWtjPWNU9VyXa2UEJJGgI+NAzHMcQ+u6cR6OJhOvo4=;
 b=sVTmUMAVBwnKvuqyCMsed4Z+WMQKa1Qw7Ln/ew4NxhG+Ny1Zdx38Ms8AAptQI04FAcTZBHrhfK6skHIcig7lNW5UlQUpjxnokIwP/WPaiV2vcw+C/OuYbxn2oUKGk0Yumy2l9b2IzmwtzDGLOo3zxpNpIIwgk8V22lfmmSDAyrQqhjRyBi1XIzbr89adM3YR9PVfrwKvuXud5LWizeMwVV/2TFlMEdudavB50VIUOHbdA8w441/bEvx9uTj7gNrVRguNqVqW4ufrg4iEY1hmhF0ENkeCxCEAHvklcM4DHUgnSVPJ2pWPV+ueC8+s8Bg6htkfA+58TkCs9o2ISI/2MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yuWtjPWNU9VyXa2UEJJGgI+NAzHMcQ+u6cR6OJhOvo4=;
 b=N3p1Ci6SYsi+Wq1YIzaR1PbjbJKNNL8uSBFkmvgKslpLtHtub6D1kqCEydb5L6ooyi+UhnJKri7LkTUWDlFaJCoHnj6O+8R1C2OP+e5omeV5MgFAzHADdkqR4PIY43R1/apyHtTSLVJEccMUGe/CFocgX7zLUXdcA/673DpUYxr6MBxjiZ/WoMaNQcpvJyuOr+6zdCTzsxiBMZYLNuRkwOoXyReCK/e9+z96eZBlXwv/D7GGVGge71k39UyTypKLbmrjLDSK4VoOE+qUB577VYjcF+7Ce4rtJfcyWpFXxbzcoBbi5KD/b4RZCC2t0S1mAVgU/UHrvtTZIP5leaz4gA==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>
Subject: [PATCH v6 4/5] tools: Allow building xen-hptool without
 CONFIG_MIGRATE
Thread-Topic: [PATCH v6 4/5] tools: Allow building xen-hptool without
 CONFIG_MIGRATE
Thread-Index: AQHcsgQg0i4vH7ZL6U6laBW0/JcXiQ==
Date: Thu, 12 Mar 2026 09:39:31 +0000
Message-ID:
 <7447a69b84ca9d737b04efca326f2bb884065f17.1773307749.git.mykyta_poturai@epam.com>
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
x-ms-office365-filtering-correlation-id: 51a24de6-53bd-40a2-ae0f-08de801b4325
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info:
 v6h0aMpisgspyyncuiiN8bFUE+hbKmFm0H1QqFs0qnIL0t7xO9VsTu7GwmFlUbN2FNd233SkyrE2doPRvJJtIYn9skk4XGdIZhc3cErWlsZZNmT/MHiE8sF0zO+XwG9S7plE8qVSME93if1Zhlqhzzecu689gEgNF/MHZf7ZE55zmHhJqG4eJpg2rlsdi6buEjyXYW9TUAwtRGRIPUv2uNV1rpKCnXL4tjHALv+Ytj3OIWDVEa6L7/W22XDOP79iijg66a3/uqFzZBJenUWLuQLBxD0gb3f9yCuruoqjuA4qoVuHQpVIG8s0kJyMf6f3JATmYuHPKRruHM1X4ssHiJ4DOIiHV3NnOxkbj6Rm/bvXNHPRqQtkNM4GBGsIuw5NhKOXkI0fNm99WzZ7f3l2VyGHMTYFTry85TXwA61/qmOpaHVxr6cCbvhL1J3IsGspkar1zPc2Jgy/Xr4mdNNuVUi3WO/qV6FU0mWltSnkziyROZvgyvz7aOL0Ta2bVBIowwV7MdPHxDV1YVlaMBdHZgUXsZQF3L+yjw069mPgz7UnFH4OiXnBi/yX0e1V4RawROrgxyQDW1o43JAOkxBqJ8GXVO6PPKrNhKPHCu5UZTZj1KVnU0+BnA1N1MThz99XZWWenUBZQrElteLixDBgOFArPNVAa3n13gBzrMX2ewtXeDsniSIBMCV7NR7iZsM4DaSIH+R/CTgpWSnyMd96lHQY4LBMXALLPisO7ldJbo+AWvoGw0KfxrOCD6EUZUU9g0k+7jlynLxyOjCdnpC6zjIxfdwt2zKJjR37OwUmLvU=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB10110.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?A/Zh90b8syS4YlfjqxfFtYp1gBV9F23r6DnkixHCTILPJp8Ys9hda1zmaY?=
 =?iso-8859-1?Q?SHpjPsVDYsVVbCsrH8MnmpFx5oa4bqd5gmd0NigGXY7OYBJE0mEKG4VQJG?=
 =?iso-8859-1?Q?AYaHTrJbvEMIBsm8QmHnKz9QGxkjIZHtDz/+vALft7USnqsX9eUdrm5syH?=
 =?iso-8859-1?Q?DJiKCPjmlg33OKO10w9rLVqwQ94g3XxPTfAMp88RcpbpE8F1+j+2mIP1aH?=
 =?iso-8859-1?Q?u6QYwK/2Fv+FjkDiwW3axg1z58arhcK3iVmET+si02U8vil9hQf1+ZkiPY?=
 =?iso-8859-1?Q?jkhShIhD0TFy1iQeTFBtUi/UefVg3rKRp/RtbdcB4QCwaqLlrxH5S/aKvF?=
 =?iso-8859-1?Q?nOQ3aDTCzlO3w+mcCKpHnpdWL+be6C7VJxOFq6EIk1U41d6Kz8MFBu/zBm?=
 =?iso-8859-1?Q?5ExPboaY2G5nQqtLpgadii+7Y5ZgsJ8KVFx515Kyfv2jwIFE22cpKs7HSt?=
 =?iso-8859-1?Q?Xk7n7hx7qwn1k7mKe4v9Gfi0F23DiD2PBc8jD5srJSMIJMY7MQ2m/s3TCH?=
 =?iso-8859-1?Q?98u7UB+aFOt/gwJg/eyMuL+LrX4FrguTDeo50QUpCjTp0q4fCkUyyExqbm?=
 =?iso-8859-1?Q?+v4hzMN5dSTCP6bQXY04UOqaJSFAVMasCD/gGKxCRadkffQgvsJRQ21KRm?=
 =?iso-8859-1?Q?hamTNlnkT1dKpO28OQ3jq+JiMRsL4F9wYksDAmChrBS9TYCaKj1tbNoR5U?=
 =?iso-8859-1?Q?ipmMsw7BB4Paejb4gPAiCf11WAikhHM5ooUpviMDUKaQVRghumXVfbSBXr?=
 =?iso-8859-1?Q?lv7Vud3mzSxOSaEtpglEaOd+gbBAKK/uL3/LARXmCq0RstBbu+l4odzG1A?=
 =?iso-8859-1?Q?pNOS+kOBdj+PYSslTG9IkDOhbtCuYd1iKCT/SlPR8WFGQRKucZdX0Prvjt?=
 =?iso-8859-1?Q?yio2QqIv/yDMNn3PNAwma4TQz58rXR3dExwcTemKr8lu+SMJYgjleci1m6?=
 =?iso-8859-1?Q?dVe+WpKGPhL2FxKZywEOcBniFWqTsaMCirRMo0al4Vz6Px8+W1oMgHOdb0?=
 =?iso-8859-1?Q?gdt1aV2oY9VHxKYk4CyS3CCLHOvrXhFnnAp7NIC93dOZKgrR5KymKLzQ0L?=
 =?iso-8859-1?Q?4nUVw7ze7MHv1u05xzV+1UC9JkmPe50rB+Gw07rdzJ0sfjzVD+AzUgrOmQ?=
 =?iso-8859-1?Q?y3LpRsyMWFEtY9+4y10zfzztafkQ+Bp4Q8H7MtuP8aElJV+YbKJmRws4vO?=
 =?iso-8859-1?Q?zDecNkectBD8dzUrwD7aSONBlcMHDl0JtkDLuPmvAv4/REMIiKkBf/SmaA?=
 =?iso-8859-1?Q?1r/XH+I9EpHOIlfhG9uQzTX8GyolEbPlPICcGV+kb+0fcy+hgXRZgG6evv?=
 =?iso-8859-1?Q?NULIugStipSM196hjVn+PsueHB2Aby0/F9GOP6c23/279D/oTJM3Xj1DOJ?=
 =?iso-8859-1?Q?vYL6CGy6RvP7eL02o01s01XyGhS1uZldFT8gIhsQUZq6d1FxlYQX3/brYj?=
 =?iso-8859-1?Q?SVAkDwW4u3eCiNu3nM9IL6HkknIDl9vhsQYYBnOOPSg2rXUUzxL+qyDWOv?=
 =?iso-8859-1?Q?YBkZsL3h+u0zZh4JnvEb6wXCp2SIbsP5NRSDckcTBqqWyvsms3hEyreGcc?=
 =?iso-8859-1?Q?cztCB1vxJcFV/Du9NhZ5T72Gt7A1IoBhljaBA2X9loVCgLt18KJgcwtJsF?=
 =?iso-8859-1?Q?9lrC9GyekPhDKZthP9FwXkk+gKnemVdizBkE+Kexdx2uQ2tJkajUHB2bQ4?=
 =?iso-8859-1?Q?0QmK7pqbznRfz24q6ZQiTivFQQSAaWJC/QLUANxBT8+jmbWTv90oM0HyDN?=
 =?iso-8859-1?Q?pBHzEcBMa0QrzwTynGF3MCnHzBulDbzLWnPSJqEqUUkZ4NLhi/ecKgmonF?=
 =?iso-8859-1?Q?FxJnE18ERjsR1YxJJrtzGVrOYZbj5hw=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB10110.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51a24de6-53bd-40a2-ae0f-08de801b4325
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2026 09:39:31.1478
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kX5h9faaVDjX2+TkxQVP4pcsYBY+ndefZy3PgP/cO6owhuoBv2CGuPDjZmo11+qiLGyKYkK4Iu2wxvNtRNxu7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR03MB11417
X-Spamd-Result: default: False [-1.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Mykyta_Poturai@epam.com,m:anthony.perard@vates.tech,m:jgross@suse.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: C3B7726FB9B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

With CPU hotplug sysctls implemented on Arm it becomes useful to have a
tool for calling them.

According to the commit history it seems that putting hptool under
config MIGRATE was a measure to fix IA64 build. As IA64 is no longer
supported it can now be brought back. So build it unconditionally.

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---

v5->v6:
* don't change order in Makefile

v4->v5:
* make hptool always build

v3->v4:
* no changes

v2->v3:
* no changes

v1->v2:
* switch to configure from legacy config
---
 tools/libs/guest/Makefile.common | 2 +-
 tools/misc/Makefile              | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/libs/guest/Makefile.common b/tools/libs/guest/Makefile.c=
ommon
index b928a4a246..03dfcee7fa 100644
--- a/tools/libs/guest/Makefile.common
+++ b/tools/libs/guest/Makefile.common
@@ -7,6 +7,7 @@ OBJS-y +=3D xg_private.o
 OBJS-y +=3D xg_domain.o
 OBJS-y +=3D xg_suspend.o
 OBJS-y +=3D xg_resume.o
+OBJS-y +=3D xg_offline_page.o
 ifeq ($(CONFIG_MIGRATE),y)
 OBJS-y +=3D xg_sr_common.o
 OBJS-$(CONFIG_X86) +=3D xg_sr_common_x86.o
@@ -17,7 +18,6 @@ OBJS-$(CONFIG_X86) +=3D xg_sr_save_x86_pv.o
 OBJS-$(CONFIG_X86) +=3D xg_sr_save_x86_hvm.o
 OBJS-y +=3D xg_sr_restore.o
 OBJS-y +=3D xg_sr_save.o
-OBJS-y +=3D xg_offline_page.o
 else
 OBJS-y +=3D xg_nomigrate.o
 endif
diff --git a/tools/misc/Makefile b/tools/misc/Makefile
index 6ee783f43e..5a206133f7 100644
--- a/tools/misc/Makefile
+++ b/tools/misc/Makefile
@@ -16,7 +16,7 @@ INSTALL_BIN                    +=3D xencov_split
 INSTALL_BIN +=3D $(INSTALL_BIN-y)
=20
 # Everything to be installed in regular sbin/
-INSTALL_SBIN-$(CONFIG_MIGRATE) +=3D xen-hptool
+INSTALL_SBIN                   +=3D xen-hptool
 INSTALL_SBIN-$(CONFIG_X86)     +=3D xen-hvmcrash
 INSTALL_SBIN-$(CONFIG_X86)     +=3D xen-hvmctx
 INSTALL_SBIN-$(CONFIG_X86)     +=3D xen-lowmemd
--=20
2.51.2

