Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eI/tDwTEwWkHWQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2026 23:51:48 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 792452FE8C0
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2026 23:51:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1259657.1553095 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4o7X-0002Zu-K4; Mon, 23 Mar 2026 22:51:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1259657.1553095; Mon, 23 Mar 2026 22:51:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4o7X-0002Uw-4O; Mon, 23 Mar 2026 22:51:39 +0000
Received: by outflank-mailman (input) for mailman id 1259657;
 Mon, 23 Mar 2026 22:51:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P8gh=BX=epam.com=milan_djokic@srs-se1.protection.inumbo.net>)
 id 1w4o7U-0007Yi-J6
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2026 22:51:36 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11021085.outbound.protection.outlook.com [52.101.70.85])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d7521934-270a-11f1-b166-2bf370ae4941;
 Mon, 23 Mar 2026 23:51:35 +0100 (CET)
Received: from VI1PR03MB5088.eurprd03.prod.outlook.com (2603:10a6:803:c2::20)
 by AS8PR03MB9699.eurprd03.prod.outlook.com (2603:10a6:20b:61d::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Mon, 23 Mar
 2026 22:51:30 +0000
Received: from VI1PR03MB5088.eurprd03.prod.outlook.com
 ([fe80::8471:b7dd:8a1c:c30]) by VI1PR03MB5088.eurprd03.prod.outlook.com
 ([fe80::8471:b7dd:8a1c:c30%6]) with mapi id 15.20.9723.022; Mon, 23 Mar 2026
 22:51:30 +0000
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
X-Inumbo-ID: d7521934-270a-11f1-b166-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nrEKLUc2OQ4INi0pOfdmk9u8luB2kslqgf06T4zPh9OjtV9fkvUZBltfVuWqwq71WojPJIxI7hJxN1gyk5fUmjSDHYE74xv5gt2wJhJCzoUWqH+LEYWLN2t1nIRlMiDvgNu5ROgWvmUA2ajImBOsIrZq+pwpradg1AWkrydSCiCcgrnlNwFRfXLxB+JZTFZnUeV5CqGQz1mzqiL8RuotSIROxRKgM/7uONm9GwaiNJO3nWjq/p/dMnYCI6BLR9iHqyCBFFKRpAzbdCjtqD2mNpZnJ1O/U3OGygZQ9WR1QsEUfKqmTnD9RdCKYhcaZtCdfpK+abIQ2U+9oZGEqGs4Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7caqtP6kUCQ2bX8Z5xVRfCBcUDpyNyH303mwvuLmP5Q=;
 b=HB1RdBnRJ+9v5dKhK9QKpr2ehOcVMs3q0VItJcn43nlFCZ6lDHNHG3bCjyMbMJU18Um+hPIKhxnViNmUzurh/0M11TfIO7o65+sVdOXOj9NNsex6tkHcbg+At1t0E1227CDjHxX/MTawkPop1IzKMoWEfZdGuNASIQ4+nYYm/WstFUCBy9LEkUFrhoQl7P0lD813K0jH3fypK6nzrH5ej+uB8LBK9NzUdECbcsaiFpRumadB8CGUKc4bgAINNtF5eeNFozA0aCI6UpMbJbu7fKM6l0eLhA42fUoDJkppUvmgbGuQu4nTd02UwYfzVJIFly5VxvbYVSmpFSzmJSDgVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7caqtP6kUCQ2bX8Z5xVRfCBcUDpyNyH303mwvuLmP5Q=;
 b=esr0QuIzBGKtaRXX6JIF+jkgBpFPxuOb+JvmV9uOCSmZ3dDypA/+b8YA+0TnA5MdnXP/ImMnOmKRBaGf8W+T7DrMO2UOsJuGEj+xlM29iBUvZbQbGKncwkFV+qGVjEtVZPLne3T4FgZgsOhGz783fV0iJZ5n8hMfFN3agqW/uD+ChBD+dK/jQD+oxzkdawSn0Y87boCvZWb3UFvp51EU6bx3dClOT8TZQgHLNzXPgBeZCVMdTxUOt/mSSV1azvutln4g/tkfK4EhQ/ZQrAuAl/1wVd5+YTDgJIBFTl1UX4mIfulRuI+fF9UwwcY/d0GvRwVnYFsli/CvQjxlafDclQ==
From: Milan Djokic <milan_djokic@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Rahul Singh <rahul.singh@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Milan Djokic <milan_djokic@epam.com>
Subject: [PATCH v2 13/23] xen/arm: vsmmuv3: Add "iommus" property node for
 dom0 devices
Thread-Topic: [PATCH v2 13/23] xen/arm: vsmmuv3: Add "iommus" property node
 for dom0 devices
Thread-Index: AQHcuxeWua+c91zSH0GQGVxi1fbMlA==
Date: Mon, 23 Mar 2026 22:51:29 +0000
Message-ID:
 <299005b895f1c5fc5b9e8ee009bf9f41346ec523.1774305918.git.milan_djokic@epam.com>
References: <cover.1774305918.git.milan_djokic@epam.com>
In-Reply-To: <cover.1774305918.git.milan_djokic@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB5088:EE_|AS8PR03MB9699:EE_
x-ms-office365-filtering-correlation-id: cedd1287-475b-4b97-96ac-08de892eb913
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021|22082099003|56012099003|18002099003;
x-microsoft-antispam-message-info:
 q15C2oJsQIodrPORmJQ5nguh5datFwRgW1fONHzUUsDDNA2HFmGxMyC9H6sdKqDwZ1VFJS0YwbhXBznqLO4kfJh4j+oFw7UVmTHkXw54Y9ebYk+rbpttGkZ1lAN3SRhB8DWNHDlhzWhjQB2lJVVOdSuTSi5tyEn0SIib0bwnPLeyYz2PP48hHZoTLLHJZp4kPrFU0UjRV2MBjINBiJoSJeRPVpCH/pSPC4pGhG5xfHl0iC6Shk2g/QZydepvjyKLE94hVW+J5EyoAzL7N3PMp9ZiGKVqri8PVH/hECQ5D6Xy3dVvUDEwrRJPZYTmeYuYvIGD9ifbHK7Y5mNLHJBAjECX+jTUw3/6jVx1aFQN9o8/CP5X2aAItlqUoTYNhg8DiR0UFNyxY/9Jh6ydzzX3to4++veJh0KKAKliSM0/gBfC/IVwe8MRhfbXd4hkq6ZJgQ70oItBtMYfK7NZahUwqATEb0MYE0dU0c84+6FuzoLfo3PPEAIIBt09+rV1CIfhBHk7utbkfxwB9vRRRZQeAOQQI2Q/z9f6iM47vgY4o/gz45daljrq0apWLJCFfzhEMah74jtq+taIZuDyY4m1t1RFVCzNBdmjg5Bq+WuhPrEag3+q+MdkBi+4nQg7TkVawIwBujZPyVFi0ckn8y5yZw4yJiWGLDqYbL/yAZcQ/MyKqAqKp5w4MkLcx5h4uo6MMjK3r6IfhBCDH4i0+Pc5nghT8wdArjxXgJ5mMvOsxCR9ijAIxBUEXcvvtiJ2AQXJGS7QaCGfeZuSr2TiFwSWv7QiulHLgQaNSm48j8OokI8=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB5088.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?ToEJeZ0kutJILjgs2/C/H5bRt6/KmPHoMSRlEEW/sK2YTcivp7JtiZXCY5?=
 =?iso-8859-1?Q?9+/zDNC+6ZDymUdIp6gUvrvyECSRbm7XxpCWKqoQkfGLkaPpii+om7TOjV?=
 =?iso-8859-1?Q?LC1RejJSVDnxIUrXZ3ws8zMhY9asvc58mwpfLZ4Yso/rVTnKL1niEhk4tf?=
 =?iso-8859-1?Q?vJXhPbbeypAReWEGpQGTRNOt56rJqbcuK0GEwBNhQYJ+UP3S1JDBDCeZ3D?=
 =?iso-8859-1?Q?QILAP87VF/SN8T4/EvppF7ASmx+Dci2t/uMqUaje/pJlLaNDoj/c/xHBOA?=
 =?iso-8859-1?Q?nvPVO1WAhHOzOYBBAIEbSl4Dig/HSD3ySNFmr4BJ5P5uKWo8iwtCILHtEJ?=
 =?iso-8859-1?Q?JqUELenc0opzDCX0p1ROc1XUOfnEsEbrFRBcWiZdR9xZbE6Dh1oxJDhFY5?=
 =?iso-8859-1?Q?QlR2c33JxBfh8nhBbnD57rbmBoxJAejKrIC+HO11P4k5Ae3tFS+z6Hi7ie?=
 =?iso-8859-1?Q?FbTH3hWWDL9JwHBMbcLoLVkYMSHHqq8YmzvuFlgjONcucqMpqTLVlGNRNg?=
 =?iso-8859-1?Q?TZlZryNKGt2XrSWs7RzLdEoDDy7GcKhYz7sh1oz6tidfpmrJSwG2oR71o9?=
 =?iso-8859-1?Q?bapLMy6I4Qz25aI3ScgNi0Lwn0Yv2LVcvy9vjH6V38zVHfQr7OqMl3h0Mg?=
 =?iso-8859-1?Q?4CAdu05eTsWTRFxaY1s2LnheoEmHx98XWKkSGlhGMV38YUjq5HvexnLtgS?=
 =?iso-8859-1?Q?32UqsDZ3NyMwAMbtIHWrGOIIzCc/KuKyg8KMk/w9TsMUvg9eHLZAwStWs+?=
 =?iso-8859-1?Q?OHDRdHWs3RjEIu9n1bvhTIjDHmSMP1oA7ra7lTD7o6/v6Von9afAktTezB?=
 =?iso-8859-1?Q?a+GrB4g3Cam72wnrm012jTmH8UfnYgd/v/QvnRjIus94PpSCYckzYEQLPc?=
 =?iso-8859-1?Q?cqDaPfvbfgkuF1aQFl76UK/mslBgdn32yiCTnViSEiLqPJ71XkFA1bG4/g?=
 =?iso-8859-1?Q?Vr8Dwg9Q31Mcf6uFQJF5kpxzr4lbPKgFAUXwt1SH5k30Kms6x+dbG/3MEB?=
 =?iso-8859-1?Q?3M6ey8sVjjQ8B9nKrPVO3Ahq7d8ILdoE1B85YQnpztIj9QlGlTgW0MwnK4?=
 =?iso-8859-1?Q?ga18po9xk0G4Gs7HIRKTrHVxOS3B0YaElVtA9HjYfroCrJhZEeCgw0XnFo?=
 =?iso-8859-1?Q?S4F56VsKDIUarPLNsbcUtlePXJl+1EllG5XFzftv3hkwvuGy1Yp7zPkgf2?=
 =?iso-8859-1?Q?+6iVM0WkU8pwMM/kGw9lqGHRLNGZoD9wYNwO/QX2Gk0MRa4/yWGpCq5tTb?=
 =?iso-8859-1?Q?CaFX03/foqDlsu91SHP+6rC5mcM3hLOhwz+tnp3feZHW1DEn8QP+Qam/fn?=
 =?iso-8859-1?Q?4SdSiL/L/xvj4O2VFlgrtP6xtWjc6goAWBcLN3dJzw/rbQeub2rhT6McZm?=
 =?iso-8859-1?Q?t03hyKC8x030Hl+nEe8CdICKobNPIBqkj3k8eAL9Z27TTJ9e5jrMNFnPID?=
 =?iso-8859-1?Q?48hPU19WEJkji3aFzSGDvIXjG5kZk8xAvPKyrc3M0By1NkWFxSgA7tD0oN?=
 =?iso-8859-1?Q?HSuUJEFkmPjuAqk/ERk3R04wYo7o5+93/K4A7CJpEDfGsS/AYApFS6l+OV?=
 =?iso-8859-1?Q?iYcVdjFSrNHToPFOm5pYwofmI5D7Ijn5zy63WmXSlsu4RrbMcuix7bUSkD?=
 =?iso-8859-1?Q?J9eiYTCvpnSRr4nt0gBt3922Resllab1c6QzyYdZtfeNolwS35SS48wmqJ?=
 =?iso-8859-1?Q?oy4auR7zKL2wU9XLVennd2OyjjksZZV7xD2HETawkCrXGMX2ODgTXA3mYm?=
 =?iso-8859-1?Q?bg0rJuLGkYAfvTS9P5E3R0bNMwS+lr4qEBzOF3V9Zp17Tr8o/4ROOMNxj5?=
 =?iso-8859-1?Q?cu6KOacOCzbMwl92dJcoZkHEBeCxXuA=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB5088.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cedd1287-475b-4b97-96ac-08de892eb913
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2026 22:51:29.9433
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: v4RKQVrpvmZj9fxhYnvqjyMhaRijbKvNVSPmkTanwnXoOIPyrd/tmK+dlFGHgyacFNPeKSy7kzvAZvkrTV96Gw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB9699
X-Spamd-Result: default: False [-1.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[milan_djokic@epam.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:rahul.singh@arm.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:milan_djokic@epam.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,epam.com:dkim,epam.com:email,epam.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[milan_djokic@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 792452FE8C0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Rahul Singh <rahul.singh@arm.com>

"iommus" property will be added for dom0 devices to virtual
IOMMU node to enable the dom0 linux kernel to configure the IOMMU

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Signed-off-by: Milan Djokic <milan_djokic@epam.com>
---
 xen/arch/arm/domain_build.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index a51563ee3d..30a4f1fd09 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -538,9 +538,12 @@ static int __init write_properties(struct domain *d, s=
truct kernel_info *kinfo,
             continue;
         }
=20
-        if ( iommu_node )
+        /*
+         * Expose IOMMU specific properties to hwdom when vIOMMU is
+         * enabled.
+         */
+        if ( iommu_node && !is_viommu_enabled() )
         {
-            /* Don't expose IOMMU specific properties to hwdom */
             if ( dt_property_name_is_equal(prop, "iommus") )
                 continue;
=20
--=20
2.43.0

