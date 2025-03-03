Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F019AA4BA68
	for <lists+xen-devel@lfdr.de>; Mon,  3 Mar 2025 10:11:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.900006.1307948 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tp1pA-0000z5-DV; Mon, 03 Mar 2025 09:10:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 900006.1307948; Mon, 03 Mar 2025 09:10:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tp1pA-0000vz-Aa; Mon, 03 Mar 2025 09:10:56 +0000
Received: by outflank-mailman (input) for mailman id 900006;
 Mon, 03 Mar 2025 09:10:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W32C=VW=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1tp1p9-0000kj-3t
 for xen-devel@lists.xenproject.org; Mon, 03 Mar 2025 09:10:55 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c201::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 69509d45-f80f-11ef-9ab2-95dc52dad729;
 Mon, 03 Mar 2025 10:10:54 +0100 (CET)
Received: from DB6PR0301CA0077.eurprd03.prod.outlook.com (2603:10a6:6:30::24)
 by AS8PR08MB8777.eurprd08.prod.outlook.com (2603:10a6:20b:5c2::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.25; Mon, 3 Mar
 2025 09:10:50 +0000
Received: from DB1PEPF000509EC.eurprd03.prod.outlook.com
 (2603:10a6:6:30:cafe::61) by DB6PR0301CA0077.outlook.office365.com
 (2603:10a6:6:30::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.27 via Frontend Transport; Mon,
 3 Mar 2025 09:10:50 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF000509EC.mail.protection.outlook.com (10.167.242.70) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.15
 via Frontend Transport; Mon, 3 Mar 2025 09:10:49 +0000
Received: ("Tessian outbound 7c48d84d1965:v585");
 Mon, 03 Mar 2025 09:10:49 +0000
Received: from L834ee7631871.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8AC6E280-317A-4B66-9056-F705964685F9.1; 
 Mon, 03 Mar 2025 09:10:43 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L834ee7631871.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 03 Mar 2025 09:10:43 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by DU0PR08MB7616.eurprd08.prod.outlook.com (2603:10a6:10:320::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.28; Mon, 3 Mar
 2025 09:10:41 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%6]) with mapi id 15.20.8489.025; Mon, 3 Mar 2025
 09:10:41 +0000
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
X-Inumbo-ID: 69509d45-f80f-11ef-9ab2-95dc52dad729
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=n4RIsEOW9gtIF9maeHjmfYjYrAMjkCB+y2QbFiqJt8EUgP4T0b041Gb/wXEGTn7JNPpJmoqXl6Z1ByHT/D2Nk8bo4MtYACx+53dooXdiGJXO8DLVVTx11/ZG6aKXoruM45aRhyV9R4YQQxz3XroRJA16OdfMccSWdKg4MSMrh5T3BkrWB+ZGyeMZjQPr5eih9rXERH+f+TqvPVep+TjZ/dWb+eyz3GyhWX5ufR/GUzMXxSGPJdujiBb9Jw6hqQ3uGT/BQ1bvtdGxHRCfcAY2T4xI2ojBK7JvzOx3x9qlTPyRDgzvzgNKd14OCmyXIS9CW42CuqnnC80msK54XaEesw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fBmWDJFmfIyfZcTv14kRHtT+JnzsA3gF2Ynvbi6vSVQ=;
 b=CW4/ZZzFV9CuVprWOGHRJhIdGEbrpS1YqJ5Q6YyuscDVZaXWWaWTv5+UT9n4N2P3wAfRjiZx1bZ02TzSsWoOkakTAO88PNfHN+vJJm9lS4cwTGIt/dKAtRSzZwPItTJjkcjZOWmuIEdDYrCdIAj/Nw7htblH5GJrYhzCebnRWsW+JT3as9eTAP4zp4U1tUNvGO1lxM8zmcmHCdjj0YO9DKyy5Ld3OBWBtuJEqunqx1PYkiVeKMJVn3yPQVRn9pW0BVqH06GFxkEn0NtSb5R9lI9LoHDaoqUalgcG9Qxd/9X/eI9Ftogvv2P/oNABxkfNIX19dkd6DhKc7cfR03aiGA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fBmWDJFmfIyfZcTv14kRHtT+JnzsA3gF2Ynvbi6vSVQ=;
 b=mZxZUxbWYclB0e0BuxR3Mylum8ju9sQnXWI31kV21UO7cs4/8vrkUyhi3d3pjFoP0nC5X0lxdhA8qmATYbC+P9Run5fkgXYrIhe+0US4LCgxJtoruCDvvRFdD2JuhKGhSiXG+QedixezyPLude8OkPH4ajtuNbL8zBAKRGeLGBE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: bd2baf5c42f90223
X-TessianGatewayMetadata: 7Feww7TW9ti8hH9KzttH5KUk6H2WbVquiFC9sVuTDuyb+1qjP0XNkwo/5NIbPbPC5+QhrP/dr+j7wnpkfhl6ndbH7R7kYQVMmM44+8zuPRTF4Hn8xpEPPF/TcMHcCBVxXICs1n1KI7yu1aUmD+mxBm23mH93W8ah5mrpWib6Le0=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l0pUSH6nXLKMQaUHxMRHUVrTEqGdLYaMP5U8ArbMK+BJ44ADN4dy6BtgF2ZOFss1OT8Y7VcyjN381xrarlTvTLrIElUS4t+KhfsJaCEgoaB1sBGMajL4RqmRBMu+GhZiXoApUPOhi/UCHUZ7HqrOHEu1Iro7gYnSz4GIsahZzDE8esKGG8VfLu/pLhrxtZnCCCRMlp2IOBQkAuC2qQ7RM0QC5kazmc+ZGOTdGklLm21Ke7XxqYCXoUnRWvGoWJLA6cj1bU6/WtLdoTWYdTVwCoQSFZDMiIJYwdZ4i0ca7If7WArgjOP9zYzwfCqUOTLO1dY3IQ1j0GJnFcRoMJOeoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fBmWDJFmfIyfZcTv14kRHtT+JnzsA3gF2Ynvbi6vSVQ=;
 b=VOyIm6AnmutQ5+kBMXn6Ns7jzo4S8Tyo8LldsVdapO1xTlYos7O3eMsRCN+YQwBx3ls/x5kRGL59UT3oLBslx2AdFQ72lzFtcdWMFCFOkz3C4Ugy9HAlFyiu45zR8g7PEDW5F1vD5ZUK3Tb7T2yS4DWV4WCSNaTxFjd8Lpz7bqlXGiQ+zth5NmnRyhk8KTVDLLr+KsTqNmFHHRR8BsTj2J39RWjgvoEZAtgUm6bCy7qGdDZue+82VBtvL4cuIPN5/09rxNaKewWzffqc5iFk5V3eNKVtD8whXQef086LQnNcg9NXR4ml2JpHBbctsOwMz1RcaO75kNOR159Cav3/4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fBmWDJFmfIyfZcTv14kRHtT+JnzsA3gF2Ynvbi6vSVQ=;
 b=mZxZUxbWYclB0e0BuxR3Mylum8ju9sQnXWI31kV21UO7cs4/8vrkUyhi3d3pjFoP0nC5X0lxdhA8qmATYbC+P9Run5fkgXYrIhe+0US4LCgxJtoruCDvvRFdD2JuhKGhSiXG+QedixezyPLude8OkPH4ajtuNbL8zBAKRGeLGBE=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 3/4] xen/arm: static-shmem: Drop unused size_cells
Thread-Topic: [PATCH 3/4] xen/arm: static-shmem: Drop unused size_cells
Thread-Index: AQHbjBo8nuO52Rl5EECHrCznAwnruLNhIAWA
Date: Mon, 3 Mar 2025 09:10:41 +0000
Message-ID: <88B8BC5D-61B1-4B85-93D5-DD2163B5B8F1@arm.com>
References: <20250303085650.74098-1-michal.orzel@amd.com>
 <20250303085650.74098-4-michal.orzel@amd.com>
In-Reply-To: <20250303085650.74098-4-michal.orzel@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.400.131.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|DU0PR08MB7616:EE_|DB1PEPF000509EC:EE_|AS8PR08MB8777:EE_
X-MS-Office365-Filtering-Correlation-Id: 47852845-2473-499b-bae5-08dd5a334ab0
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?n3QiOZ6PGAuTSxw9Yw4HymgcEMvnxzDdBjo4VNlueWFvVZjwL4EWEgEWt634?=
 =?us-ascii?Q?vU0uyE9MshNTIcImew0rP/E3EkbJenwaySYfVdYn/2e4VsWpt7XMTiWnzRmM?=
 =?us-ascii?Q?2b42uAm0qO9n7J29eZpuhorUJ3cfB7ENjETeb5Yil49PRzSIHIuAt0PBg5KC?=
 =?us-ascii?Q?EHKNzXsHQYiy10M221jTieR4Xh3yk9+Wkis63n4bpuzOhpNRIkD117kuBnv1?=
 =?us-ascii?Q?KQg+sbEmSU4S+JOtf4y1Fo+O/NZRKoThQk8Si8/58VpFVUykRuckotX86ySF?=
 =?us-ascii?Q?z1meUO5Z+Z6oUVbAqiVn29EWarA3LpPPHbAmvXHDDCjCHUYIpbYBK9BmCgwD?=
 =?us-ascii?Q?gg6sR7J4smVRupzDcLh3MtEGtxJNrMfROWI4KqKvnPXftCE55dVAOOvW1Mlo?=
 =?us-ascii?Q?jH1AsY445Bg1XrhT0oLlw6pKWQfDkjmg2LQpqjSHMy3O4TvGCmEIAZeCgfcX?=
 =?us-ascii?Q?7xBX9YPkUiaQGiaECv+wNZuFEGFV6vcnmpCueFrtgs8a2vJEzJJoQ2giFSR6?=
 =?us-ascii?Q?xlXegyE2IZ05cCP0y3tOGlq5RPLe4aEzx+t3JmIC4GOhSyz8k+P0dcmjWU7K?=
 =?us-ascii?Q?qfLlYHikg7Ycj/ThoAPBSWQcml/q2U5BenxAnu7jKCrgwvPmldLxoMbxP4C0?=
 =?us-ascii?Q?Qff/Cz52ROqdiS/aLciQMgLQp92CMCnQftciSJj5TCxnoXhPXv5zwjkgwcjp?=
 =?us-ascii?Q?3fYCb9ZKJNbVdEM7oM2sASDBSTKpOr//5L3InawkzYqKO9P3yvbpbRPMJGM5?=
 =?us-ascii?Q?84kERup7gspgrkrTpl2NMrurzjYTFJiJAWWNUY3UCKMvk32p6PCoeIVxrnho?=
 =?us-ascii?Q?AkaflKKlN9TKeV1Er5gepM/hw0t5HNJaFUL2AGYcAv6+0PjY+9LeI+QQeq1W?=
 =?us-ascii?Q?njYCwBeNG2r+wmNO0WaNE5W88hbg7dq3gIv7iJtREquN5QdbwgVS0KoClOgu?=
 =?us-ascii?Q?KGYaqFdvh2HmyIHzg4zaJwJgSsecXof5ktPwoU4UXSXAA2KrlcQSCWRanPuf?=
 =?us-ascii?Q?Lje7gjkv8pvdezfITHa+avD3RRZ5wiZz+yAjx+c8X3OA9JgJ43gVmj8OoAvz?=
 =?us-ascii?Q?zCIKl3TJmxYumVvuQAp3snf/PDiF7Bm2I854Up8l2kkFIKs/hUq6ks/oSvox?=
 =?us-ascii?Q?r5U8EHlivKbOtk9GrDmjcgPXrqylL7tW0D7uHi07t7CNJ+Mm+FxGCeTpK5k5?=
 =?us-ascii?Q?/2wURWtwydA2BoSWawxqGGI5/uDl+FSnVMC6SiU6pEbxd/J8cDx4r8fvn/8W?=
 =?us-ascii?Q?aaDzpB8o7vr5Dij2JzjgM7OWGocgOMucYQVga/+pT+6cKmdbF+abJjZpwl1a?=
 =?us-ascii?Q?L/2HT1nMZQb89nAuYY4rIU0o3mqZ6vO2Aik5gGjPVinUxS9hX4nVhOjN4dK8?=
 =?us-ascii?Q?Stzvgliiug7ySYMLEtvfvf5L3Xqui7Aa3zpnOdWqawXrmLNBzNB5M6SpLmn+?=
 =?us-ascii?Q?QZgYtErGlnQkDzPC+aRCk3JNzFZcSgk0?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <9EC729290DD22640B6E1BF8298D2FDD3@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7616
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:25a::24];domain=DB9PR08MB6588.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509EC.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	499d9b4a-778e-4552-17b0-08dd5a3345b6
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|35042699022|376014|36860700013|14060799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7oEBgLct7CxEsblonH1NMxigub+83P3jSjrORAxM0/KDo4Fe/WuuqYiGpbJz?=
 =?us-ascii?Q?mOL6illQYiIifrOts/+7T3mLKo3IEFItnh7AtNxNIcwLYDFhfN/4sSgmz9HI?=
 =?us-ascii?Q?56CYIqrfMfx+VdIHbcEIPOtFHZD8/OXz04cNbR2mCHR4Nq6chqGY2/n9ufFE?=
 =?us-ascii?Q?se9x2V1vqe+WDcsd+pK5flfQRpaAwjPEPVpeTiUCZEpkr3/N8693v+En5EQ2?=
 =?us-ascii?Q?6mqtyTP76CfS7vPxVZCumLGBRvQuBTAYoM1FiWpnImA53m5y1JDYBERg70zz?=
 =?us-ascii?Q?ol+9qcQMiXsQl72LWgkuI3Ocv9xkTSYylgC2RisBCvJWxZUM5w06JeWZ8AbR?=
 =?us-ascii?Q?Um1eWJQ6Hb8iFX3BBNBLpTrrd0R93HlbOQmzrfS1e8cOoCXRtL+5GbC5jyjI?=
 =?us-ascii?Q?oUvQwWMBmiPSchAMB2P4+68JsvwArdtzR/2ynL70CuNhpbMwAhI+T96InczQ?=
 =?us-ascii?Q?WBD1nkjkPCdj2huvwe6qdNXETz6c3j9AnbLe0uQJBQytqrK3/5UG8xXbSk5Y?=
 =?us-ascii?Q?qiB4dgiCapp1ODakYMgO2TjhnwBHxVn1U+tn7rKueApN/ejWkauqyNacNkbc?=
 =?us-ascii?Q?0cTnKFqHxKcvQGpohY9yLXbosRl5i2KWMqZUA/b2NcN89e4FPSu8/gPOfNMW?=
 =?us-ascii?Q?bEXRIHxqW981kqm2FDwfWwDFFgC86+RVw4XPhEgg2OrQ3Bu3NxKPdFfNf1rb?=
 =?us-ascii?Q?03mYvlf2FJUpzJO7S7JyaCYYG8wAHc0Yko+4mGVAmvSemHxvakDZLLbDRKUo?=
 =?us-ascii?Q?ONG4tn/H9fjxp0UJiaGvy+ULpserx7U5UpF4Vn1P+Y3hcigyvl4X+dU/+8Ww?=
 =?us-ascii?Q?Z9ELtk/ZFm+ZXjB19oTzAxCaM8vsPK4qma7x7nLuTAbOsjQnZANdimpUp2VL?=
 =?us-ascii?Q?2A42Qa8du4+QgtxON3gN2JqJXfQTk4+tT8B3iHQIa+AtLDpVupzPrXPdPIjw?=
 =?us-ascii?Q?GrD67O3haHIl5J6iRbK7ApZexO5sjhlvEKWoaOlLM1Oym5TgSIcmJSuOY0ur?=
 =?us-ascii?Q?6iiBOnRZv87e3KPCpvtl37QYdMCAlKNa2zX/eh+s9e1xSaj3Jsql4hP1QX+1?=
 =?us-ascii?Q?lQuC7k/LBgy5XUbQrw/E+j+C2j23RLBPEFBo6Q9b1BJYWYfpddUx6cYc8tcl?=
 =?us-ascii?Q?fjrYzZdgcR4OxKbnt9rgEILLGpnEwj4uDUSymJ4GWayVAHST/MVJwSwMG6GA?=
 =?us-ascii?Q?yCyD7MscPvlMM3tBIryqWLcGP8ex/QBOgnLb6twYDDqt1CkJCo3rkwWvqO72?=
 =?us-ascii?Q?cXbFC0xDRqt+gH2RKGcUL2ZblJWVUFqGEZvGW0/Rq0IHCnbms3RYsnIBWQ2k?=
 =?us-ascii?Q?qefpnFwDclYvPPglfvbJjFbB9GfI3FFP8PfdiCXSe4zOFLGIgp0V975shKrb?=
 =?us-ascii?Q?qdQ4Kzcv9AD0/Qkq6zf5q2P/5LsRv+3Hfyx4vu8gX/Y9R+0+oaip5ZYSFXP8?=
 =?us-ascii?Q?+S8ygbx2KDWH8jy+Zvz2yjt8/dSnnpB7kAvK6ku0DoOAeU4Jif9getNQ98iZ?=
 =?us-ascii?Q?nZjvzS3UrS5QeNY=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(35042699022)(376014)(36860700013)(14060799003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2025 09:10:49.8625
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 47852845-2473-499b-bae5-08dd5a334ab0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509EC.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8777

Hi Michal,

> On 3 Mar 2025, at 09:56, Michal Orzel <michal.orzel@amd.com> wrote:
>=20
> Value stored in size_cells is never read because we're only interested
> in retrieving gbase address of shmem region for which we only need
> address cells.
>=20
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> xen/arch/arm/static-shmem.c | 3 +--
> 1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/xen/arch/arm/static-shmem.c b/xen/arch/arm/static-shmem.c
> index 8f87154c3587..c74fa13d4847 100644
> --- a/xen/arch/arm/static-shmem.c
> +++ b/xen/arch/arm/static-shmem.c
> @@ -302,7 +302,7 @@ int __init process_shm(struct domain *d, struct kerne=
l_info *kinfo,
>         const struct membank *boot_shm_bank;
>         const struct dt_property *prop;
>         const __be32 *cells;
> -        uint32_t addr_cells, size_cells;
> +        uint32_t addr_cells;
>         paddr_t gbase, pbase, psize;
>         int ret =3D 0;
>         unsigned int i;
> @@ -338,7 +338,6 @@ int __init process_shm(struct domain *d, struct kerne=
l_info *kinfo,
>          * pbase is optional.
>          */
>         addr_cells =3D dt_n_addr_cells(shm_node);
> -        size_cells =3D dt_n_size_cells(shm_node);
>         prop =3D dt_find_property(shm_node, "xen,shared-mem", NULL);
>         BUG_ON(!prop);
>         cells =3D (const __be32 *)prop->value;
> --=20
> 2.25.1
>=20


