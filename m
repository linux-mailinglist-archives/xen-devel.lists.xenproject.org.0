Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D5AEA419EE
	for <lists+xen-devel@lfdr.de>; Mon, 24 Feb 2025 11:01:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.895070.1303671 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmVHB-0007Hw-AN; Mon, 24 Feb 2025 10:01:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 895070.1303671; Mon, 24 Feb 2025 10:01:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmVHB-0007FH-7f; Mon, 24 Feb 2025 10:01:25 +0000
Received: by outflank-mailman (input) for mailman id 895070;
 Mon, 24 Feb 2025 10:01:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vqga=VP=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1tmVH9-0007F9-GZ
 for xen-devel@lists.xenproject.org; Mon, 24 Feb 2025 10:01:23 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170110001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4c91cc81-f296-11ef-9aae-95dc52dad729;
 Mon, 24 Feb 2025 11:01:21 +0100 (CET)
Received: from DUZPR01CA0074.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c2::20) by PAXPR08MB6512.eurprd08.prod.outlook.com
 (2603:10a6:102:15a::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Mon, 24 Feb
 2025 10:01:18 +0000
Received: from DB5PEPF00014B8C.eurprd02.prod.outlook.com
 (2603:10a6:10:3c2:cafe::f7) by DUZPR01CA0074.outlook.office365.com
 (2603:10a6:10:3c2::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8466.20 via Frontend Transport; Mon,
 24 Feb 2025 10:01:18 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5PEPF00014B8C.mail.protection.outlook.com (10.167.8.200) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8466.11
 via Frontend Transport; Mon, 24 Feb 2025 10:01:17 +0000
Received: ("Tessian outbound a81432d5988b:v585");
 Mon, 24 Feb 2025 10:01:16 +0000
Received: from La0bcc562e915.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7377C3CC-B591-46A3-A523-F610EFB3CE13.1; 
 Mon, 24 Feb 2025 10:01:08 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 La0bcc562e915.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 24 Feb 2025 10:01:08 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by GV2PR08MB7931.eurprd08.prod.outlook.com (2603:10a6:150:a8::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.18; Mon, 24 Feb
 2025 10:01:02 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%6]) with mapi id 15.20.8466.016; Mon, 24 Feb 2025
 10:01:02 +0000
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
X-Inumbo-ID: 4c91cc81-f296-11ef-9aae-95dc52dad729
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=ZbZ7rx1tcJfJ9s9qm/CPc4AKo8PiIWbjzERhZDokYyiMdw8MuyorV/bP499aG0wy62aLKTXfFwCi9eF8ZJMm3Ds6zQXuMjetckVZTN1yrluYcd0U243uj3sCT5SkYGV7pWXlCXJ58r0qhd67MlEDl6GmwLzbv5absNLRNN5Z+mzxTPwld2GJAin/J/U01mUzWfV0kuhg5mU0LPSKBONvbDbR62O2EWAn82+NEMeTN+QXbySZkDjvrVwu8U1QW8zkJ3jRzCN1My803I8u3IbL4dZ2MIpn1MqyqJtQg6W3U1vuMfUed0oO6jc3MhGOEdHBfwJtxx8gJokU4YR/ReWgJA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JCxOE4yFWjJcXFR/CRox40nk54yNmRP5df1j3SfOMPY=;
 b=KjsT1V539lOyJJfm/BPlFov/wGqxeORDBoP1cz+ff5ZT8FJg+bzgoqM5jgagsegn20JFEus75TCzWO/CHs+GOOI3L3hi4/fcgkmLjS48JRgcYIujsfTXwGed7j4TVhoGL+Pv1JqR5iPwQnV4TbuTxfytIPskyXoxfgyHxfVtojwYTxl4bBSJfepD4ivyhfv2/fNvXJdT83OMXJuHU1yXbxoTr+Umj84kEnb78AFAVUMYZMZi4QjqH7z8sth7JgJ+53KDPsw2B6kjsny4VUomMK+ymEffFUHndSCEBCqDUHIaB4NoTAnNmejbSbEB47h2l4/xUXNWz8auCXdXjUcaXw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JCxOE4yFWjJcXFR/CRox40nk54yNmRP5df1j3SfOMPY=;
 b=P7VGJaQ0Giv3/MV5A8FosMJbDLgEU1ePue6zSti0QCsFg8JjsnAF/h59lN9HZAApgX8V9QcmcEFj40xfavt72PXNPg1SqxnTlQWO1AspTU/3tj/u01dqoej6fqdscThsLaDGblmIwAnokG9/w6mRVCyvaCH6NDQ58J7gGVncYRA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: d04e3121f887988e
X-TessianGatewayMetadata: LBqdYq/wYe4Wecg89mxt6DZfvtEFnM5CbpbjG/nkVLXiRdynBTvrOCXylrpp9AzvHg3nj3bSDUj+ci+QJUinPAnajw+Kpw7GtyP+ndnI9/i2nRZlHNsZgRq1GO0yyDnB02HKtlmskkHX441ssFPnRcB3pVYHGJnejfG9puQMnFw=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uYQnA+Xj5jmEBd9wwXHv+phZ1TZSsh9lMOzHmuvU+gaY48LoUU+4Hau8totiRaRUumP7f0P8Vyh3i793Y35ZwULf5Rq/n8pMSEovMKe6Kxk6ZLnJrPLrzIz6vyQmNqYVMqaKmxg+djJ2M5/6iwQiVn6+BydmsDx1RCdSdEryR1J6EuSBPtu8IzsQu3IaTlK194ch+k2eCFdtfKjVbwMe6vNtlzOUXregrNmCO9qkdLH3buDIVDOPyBLlW7CsKp0vI3mtH6uRt9VrLgycOrh5faMkk7QpNrg2w7HeNZOfaAYdNGid08W4RglVuffujWqMxRYfQU7OfI8miP0+NLwQ3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JCxOE4yFWjJcXFR/CRox40nk54yNmRP5df1j3SfOMPY=;
 b=xtijNiP/LlQc3wSLWj03FvgsXp+Of0P3QTfKI9A9r5eYA5tARc7Pl/Zvx5XFaVpGaBz+kOpaZAIUCo2QRetuD1dHNxOKqRexCRwFBYrd72PqhwPZ7Qrl+MBA7E1bouXxuKBKEiok4kD+SFsEw93nJ2iywkfCO5DOkjpXp2mpmlx7qtHWcNARs2j6Qp2JsMwz8zrCkc58tgyhQegywxBFLncnag2Gy1vtHe4H/EYQeP3ioNczH8Swcl1NOiZf4IHEM/6iiTaZM8ePcGFZS7t3XOJ6c7vKqI6CZu5IJ4DCREfgelUtFI2+wREIyQlD+PNgH3vjdyyFgfe+FeBMxxWtAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JCxOE4yFWjJcXFR/CRox40nk54yNmRP5df1j3SfOMPY=;
 b=P7VGJaQ0Giv3/MV5A8FosMJbDLgEU1ePue6zSti0QCsFg8JjsnAF/h59lN9HZAApgX8V9QcmcEFj40xfavt72PXNPg1SqxnTlQWO1AspTU/3tj/u01dqoej6fqdscThsLaDGblmIwAnokG9/w6mRVCyvaCH6NDQ58J7gGVncYRA=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Ayan Kumar Halder <ayankuma@amd.com>
CC: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>,
	Artem Mygaiev <artem_mygaiev@epam.com>
Subject: Re: [PATCH v1 2/2] docs: fusa: Add the requirements for some of the
 commands of XEN_VERSION
Thread-Topic: [PATCH v1 2/2] docs: fusa: Add the requirements for some of the
 commands of XEN_VERSION
Thread-Index: AQHbZr2QpA/avZzDqk6Vb2qnMvbcCbMtg1KAgB5ZsACACpt7gA==
Date: Mon, 24 Feb 2025 10:01:02 +0000
Message-ID: <92E0A38D-3BC2-4FC8-8166-275762523964@arm.com>
References: <20250114195010.3409094-1-ayan.kumar.halder@amd.com>
 <20250114195010.3409094-2-ayan.kumar.halder@amd.com>
 <ACD22224-C61D-40F1-8235-67F18E633019@arm.com>
 <228e6784-f7c5-4b39-8f10-fde3e83976de@amd.com>
In-Reply-To: <228e6784-f7c5-4b39-8f10-fde3e83976de@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.400.131.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|GV2PR08MB7931:EE_|DB5PEPF00014B8C:EE_|PAXPR08MB6512:EE_
X-MS-Office365-Filtering-Correlation-Id: 52cf69e7-2d38-4c37-3b1f-08dd54ba2e16
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?PSnp/v1lzhi4UdmDnqTOJVecXlHWKYLlr4U7ByLNQicrdNvGhYvQrxjG331X?=
 =?us-ascii?Q?PDz05Y3ShYsuIKyKnW25lNaL6G+1NYQWF7nI/SmZ4x6DOVddz7X1SpMeYm0k?=
 =?us-ascii?Q?sEwYcFMTSdBliWGVh/Lh39TMC0lEc49BfR/XLmLtJneDvtZKr6Mke8MQTGEo?=
 =?us-ascii?Q?lRI4nZjpsHoSv6oPsqhw/AFjXYOyflSXfN4Y3ir2e+eHm9BsEaUgtR6cavRY?=
 =?us-ascii?Q?RIxwmSKFv1pHOeqbsb4sSCjscy8iWaXnKN5Odd2A0QW1RicBiNGixe1zNpOi?=
 =?us-ascii?Q?foE3eR/oa+Bl9+x+o4SqaypGwsMIu7rBzTfcdKI4Ic1KpTd1yzQ+BaNxdrsZ?=
 =?us-ascii?Q?O0Gm9/se/w9zDaPjd4oKgIIfdjXInh1MXsI3SZNwoRlr3vc1kJHsp3V7A3z1?=
 =?us-ascii?Q?uMQzDgx7i4RxP5wmgRk7VRohJgJBAw4eyJ9BULoKznp4esyHTG3+Z3y8fZ3O?=
 =?us-ascii?Q?MbHgwtVwJgLHOWmZ/X4SHv60DnsIbNklayqA2saAUc596buTKLOa7O2DxS4K?=
 =?us-ascii?Q?YtRirbNTAUmUhzLRNWpLUvT6P1St1aiOm8b5RhBAumZWcwSmuJE02Awk4JfP?=
 =?us-ascii?Q?k6KAjWlaqAHYYsEAP2pFiEvHKzJ2kt4O2n/Evh3XBXaSCFN39zCXbX365Tc7?=
 =?us-ascii?Q?1tjZalfvjWTwCxlkTtS0fyiPyHUH4PrDa8G9cpC2DlbmYSbEI6U9HJFTCS7v?=
 =?us-ascii?Q?4NDlOe4i0IlnW7zzftvQmJE9OAlHvEkVp3PtyzXKbLTTxuhvaSjL+jXKL73m?=
 =?us-ascii?Q?+4CaJzS9r2lCYsgrePE4notFPOQTrYPCpODD4mmlg66UJedUYYqv1x5MZWkM?=
 =?us-ascii?Q?4Lvtda2ai4takjYgsygAM6WZGuv9EQRvn78dscOhB6AxCybC6gAGDd87ukrT?=
 =?us-ascii?Q?5SjUgZpnqmun8+KmvHhPFQXmnSb5pRJtphhwGd8ToxtY9O9pYIiLUA0Y0fcY?=
 =?us-ascii?Q?is+ENeBsWXioVY21dMPZZjrPggYF9fziKZ3kPznlH9ynfJH8FylfNt9SvuUS?=
 =?us-ascii?Q?hCd37qYx+QmbUvoHJtznASOHLdjGGhKObOXBQY/krIevYxowMizpA0U/l4NP?=
 =?us-ascii?Q?5OSXgUIATsC4jyNj8DrZult5pmK7ORoz1IeTVqg8ViCZmLlmRwHe7e2OObTn?=
 =?us-ascii?Q?/tmkZyFU2cSjWHtNFNG4bNzUmUW2eySb1XSwnv8OfvBT2atjthBHIs4FJmK2?=
 =?us-ascii?Q?uXMwaFTdAmutwwo7fwke+e3zw4NJGTg46WwnEPEVFSa76VeA0tkZf10rtIvJ?=
 =?us-ascii?Q?Ftm+rhXw6AUhdW+g75jRlJ9tVgCexnKxSyH5Ntn48BPRG2+v1wXZcxRISD7n?=
 =?us-ascii?Q?enjnhrkhXDFO5gCfzfXwwpU1M9kpWbURroLA/ODJVQorsbF66unD+UV/Fq4b?=
 =?us-ascii?Q?G3+r4C0wVOx8OjWql69C8G0IdWseCqWO2qTNbZ9SaOOuNlO6AIHkU5X/hCQL?=
 =?us-ascii?Q?sBI/Xhmv00/zrQxriJWQE1qGtCraKjrT?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <549514D629F9DE4CBAB23EC2AA1DB2D7@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB7931
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:25a::24];domain=DB9PR08MB6588.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B8C.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d4c84db2-ad33-4c02-d115-08dd54ba2526
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|14060799003|36860700013|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bTRk+z1gijPEhpC4dw2krBP9qFHz5vb+mu6RrIP6ck38eI2qDFzHoD5O5+Nd?=
 =?us-ascii?Q?9jWwadgRDTdoD4DodvsDiKV557o6NPVTknt0OzFqhUavRjWIKWJVHFN2UbeD?=
 =?us-ascii?Q?PC+TzHEMeHrf8UOtexKb7+zW7xJSun/WBB24KV78NiuSD30WTMTmRsDByQF5?=
 =?us-ascii?Q?ByI3nerfdsOdVbeslKEmMIdmVjchnisPXS4LUetb9pvyUjrE8C8g0YG9cpQ/?=
 =?us-ascii?Q?cFYUN2OKUFYRE5aJQJ3u8PkrzAXJWUrCxxz5KJDTOEIiHIdAqWevJj2RGcep?=
 =?us-ascii?Q?kHGEXg+XNUL1fqHo+7Qg1aJEHlFhnkNWR2PqKsWGXiCKopn0HalBonjUhfcC?=
 =?us-ascii?Q?zWU85UwmohFo+ffQ/hHVjJQJj1pe16Cqh2mEgKNLdHsqE8IslAvYoNjG1+/e?=
 =?us-ascii?Q?2mpGYK5pSQqnDDN4sim1+J9xrA5VkPvQFsewnP5/JBBoK/wdx7tfUAqljP+G?=
 =?us-ascii?Q?cjeqRz2lAnHGBA1X8u0D+J5uyC0IwUdmIkpwtV3D1Q691M/1dy4Y46S5nT4u?=
 =?us-ascii?Q?saTBh4teoWcrcBwR/9IQfcUfwDfY9r2kSmCMIdkdzPheqqVX1OuENxLZ/Kam?=
 =?us-ascii?Q?Xm/vMs1JVU9Yj75WQBHNyvhhG5kPcFGwzEDkfgfwY0V3/5keR0UzYC8c1OZW?=
 =?us-ascii?Q?WuJFKTJSw9EJxeH9BLwXTTWssiv+lrFBaxfXrVMGVoOLHjtbwO59/XWnAGZk?=
 =?us-ascii?Q?Fo14gFDvHoLOm6XeN9uciy5rX9oHf0k+tPQDD3lG4S7Bn7B8NF7HSpP2A0IS?=
 =?us-ascii?Q?pFMvTrGYPhgbgW0B9lPg+LIQMfU8d+Olu7L1iZAIZSQmGqABNCK3Y/nM29Ls?=
 =?us-ascii?Q?o2uD6CGwmZAjWvaLf7T4R2BBR0pBiWsBdo/xWB918QLt33NoOMrGngTxmKpw?=
 =?us-ascii?Q?ZXYrtqs7hHeVx37OpbiYliMv+PzL3QRdG0FqIcz1KqnQ0D2kV3ki4IR2WfWM?=
 =?us-ascii?Q?bt3Z+rynmmWZi4YXAuhIgiMxZg9hQF0exrw/aZQJ8jYEB5Vwm/XzvwfpKeBi?=
 =?us-ascii?Q?iLBU9dpJtRMW387+Fz1xEck1ww89/vmQwUG+SP8OjUwW04ElbAg5CjmXqgpq?=
 =?us-ascii?Q?cj970f+d5MwzBjRp8aB7FaTX0yexB7jyEfPYKy0f6r+8qACrX2Qk+l2akU2k?=
 =?us-ascii?Q?0cZ9mjvjGhOjrsBDT7VvzciLHXLa3+nttgqlhm6Reab4wiLFSTqDLZPdIP/M?=
 =?us-ascii?Q?eIc2oDYLpKN+5vCKNUeBxiLHU6dHiRGd9ToCLH1DTVMIkPYJAdv0VB8BqKYX?=
 =?us-ascii?Q?PrLSDpHSn7mGgkSvp4ruSF1wBNKnskfU80YNbGxiv/AuncTUsGfnIyVxBaw5?=
 =?us-ascii?Q?f7Fe1xId36NPzUZj9VPYbX3Mi1ZYRGOO4xIeBFSjLWNid/prR1PyIVZa+GLX?=
 =?us-ascii?Q?hhi2uZlx0FUXIuAYRY6cKLeVzog6HTn0dRtVUGwzewSDIMmLnTeXiuah/3Qj?=
 =?us-ascii?Q?uqh85TkRXu8F0J3J00Q6yFjSdX0S0njo2DB8X2wI3oaWZsJOg7jIsWn6nO9w?=
 =?us-ascii?Q?iCL/ISXIRr2Pows=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(14060799003)(36860700013)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2025 10:01:17.0181
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 52cf69e7-2d38-4c37-3b1f-08dd54ba2e16
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B8C.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6512

Hi Ayan,

> On 17 Feb 2025, at 17:01, Ayan Kumar Halder <ayankuma@amd.com> wrote:
>=20
>=20
> On 29/01/2025 08:33, Bertrand Marquis wrote:
>> Hi Ayan,
>=20
> Hi Bertrand,
>=20
> Apologies for the delay in response. I am working on v2 , but need some c=
larifications.
>=20
>>=20
>>> On 14 Jan 2025, at 20:50, Ayan Kumar Halder <ayan.kumar.halder@amd.com>=
 wrote:
>>>=20
>>> We have written the requirements for some of the commands of the XEN_VE=
RSION
>>> hypercall.
>>>=20
>>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>>> ---
>>> .../design-reqs/arm64/version_hypercall.rst   | 33 ++++++++
>>> .../reqs/design-reqs/version_hypercall.rst    | 65 +++++++++++++++
>>> docs/fusa/reqs/index.rst                      |  2 +
>>> .../reqs/product-reqs/version_hypercall.rst   | 82 +++++++++++++++++++
>>> 4 files changed, 182 insertions(+)
>>> create mode 100644 docs/fusa/reqs/design-reqs/arm64/version_hypercall.r=
st
>>> create mode 100644 docs/fusa/reqs/design-reqs/version_hypercall.rst
>>>=20
>>> diff --git a/docs/fusa/reqs/design-reqs/arm64/version_hypercall.rst b/d=
ocs/fusa/reqs/design-reqs/arm64/version_hypercall.rst
>>> new file mode 100644
>>> index 0000000000..1dad2b84c2
>>> --- /dev/null
>>> +++ b/docs/fusa/reqs/design-reqs/arm64/version_hypercall.rst
>>> @@ -0,0 +1,33 @@
>>> +.. SPDX-License-Identifier: CC-BY-4.0
>>> +
>>> +Capabilities
>>> +------------
>>> +
>>> +`XenSwdgn~arm64_capabilities~1`
>>> +
>>> +Description:
>>> +Xen shall have a internal constant string storing "xen-3.0-aarch64".
>> I would rather not have a requirement that will need changing every time=
.
>> Could we turn this into a description and link this to where we store th=
e version ?
>=20
> I tried the follow the discussion between Julien and you. We do not get t=
he version from the Makefile ie 3.0 is hardcoded.
>=20
> So, does the following look ok
>=20
> Xen shall have an internal constant string to denote that the cpu is runn=
ing
> in arm64 mode.

ok for me.

>>=20
>>> +
>>> +Rationale:
>>> +
>>> +Comments:
>>> +
>>> +Covers:
>>> + - `XenProd~version_hyp_capabilities_cmd~1`
>>> +
>>> +Capabilities AArch32
>>> +--------------------
>>> +
>>> +`XenSwdgn~arm64_capabilities_aarch32~1`
>>> +
>>> +Description:
>>> +Xen shall have a internal constant string storing "xen-3.0-armv7l" whe=
n it
>>> +detects that the cpu is running in AArch32 mode.
>>> +
>> Same here and also you have a "when" here and not in previous one.
> Xen shall have a internal constant string to denote that the cpu is runni=
ng in
> arm32 mode.

ok

>>=20
>>> +Rationale:
>>> +
>>> +Comments:
>>> +
>>> +Covers:
>>> + - `XenProd~version_hyp_capabilities_cmd~1`
>>> +
>>> diff --git a/docs/fusa/reqs/design-reqs/version_hypercall.rst b/docs/fu=
sa/reqs/design-reqs/version_hypercall.rst
>>> new file mode 100644
>>> index 0000000000..8bb7a66576
>>> --- /dev/null
>>> +++ b/docs/fusa/reqs/design-reqs/version_hypercall.rst
>>> @@ -0,0 +1,65 @@
>>> +.. SPDX-License-Identifier: CC-BY-4.0
>>> +
>>> +Version
>>> +-------
>>> +
>>> +`XenSwdgn~version~1`
>>> +
>>> +Description:
>>> +Xen shall have a internal constant storing the version number coming f=
rom the
>>> +Makefile.
>> If you go this far i think you should give the name of the constant.
> Xen shall have a internal constant (XEN_VERSION) the version number comin=
g from
> the Makefile.

you are missing a "storing"

>>=20
>>> +
>>> +Rationale:
>>> +
>>> +Comments:
>>> +
>>> +Covers:
>>> + - `XenProd~version_hyp_version_cmd~1`
>>> +
>>> +Subversion
>>> +----------
>>> +
>>> +`XenSwdgn~subversion~1`
>>> +
>>> +Description:
>>> +Xen shall have a internal constant storing the sub version number comi=
ng from
>>> +the Makefile.
>> Same here, please name it.
> Xen shall have a internal constant (XEN_SUBVERSION) storing the sub versi=
on
> number coming from the Makefile.

ok

>>=20
>>> +
>>> +Rationale:
>>> +
>>> +Comments:
>>> +
>>> +Covers:
>>> + - `XenProd~version_hyp_version_cmd~1`
>>> +
>>> +Extraversion
>>> +------------
>>> +
>>> +`XenSwdgn~extraversion~1`
>>> +
>>> +Description:
>>> +Xen shall have a internal constant string storing the extraversion com=
ing from
>>> +the build environment.
>> Same here.
> Xen shall have a internal constant (XEN_EXTRAVERSION) storing the extrave=
rsion
> coming from the build environment.

ok

>>=20
>>> +
>>> +Rationale:
>>> +
>>> +Comments:
>>> +
>>> +Covers:
>>> + - `XenProd~version_hyp_extraversion_cmd~1`
>>> +
>>> +Changeset
>>> +---------
>>> +
>>> +`XenSwdgn~changeset~1`
>>> +
>>> +Description:
>>> +Xen shall have a internal constant string storing the date, time and g=
it hash
>>> +of the last change made to Xen's codebase.
>> Same here.
>> Also i would use the comment here and in previous reqs to give an exampl=
e.
> Xen shall have a internal constant string (XEN_CHANGESET) storing the dat=
e,
> time and git hash of the last change made to Xen's codebase.

ok

>>=20
>>> +
>>> +Rationale:
>>> +
>>> +Comments:
>>> +
>>> +Covers:
>>> + - `XenProd~version_hyp_changeset_cmd~1`
>>> diff --git a/docs/fusa/reqs/index.rst b/docs/fusa/reqs/index.rst
>>> index d8683edce7..b85af19d19 100644
>>> --- a/docs/fusa/reqs/index.rst
>>> +++ b/docs/fusa/reqs/index.rst
>>> @@ -14,3 +14,5 @@ Requirements documentation
>>>    design-reqs/arm64/generic-timer
>>>    design-reqs/arm64/sbsa-uart
>>>    design-reqs/arm64/hypercall
>>> +   design-reqs/arm64/version_hypercall
>>> +   design-reqs/version_hypercall
>>> diff --git a/docs/fusa/reqs/product-reqs/version_hypercall.rst b/docs/f=
usa/reqs/product-reqs/version_hypercall.rst
>>> index fdb8da04e1..10bc7b6e87 100644
>>> --- a/docs/fusa/reqs/product-reqs/version_hypercall.rst
>>> +++ b/docs/fusa/reqs/product-reqs/version_hypercall.rst
>>> @@ -59,3 +59,85 @@ Covers:
>>> Needs:
>>>  - XenSwdgn
>>>=20
>>> +Version command
>>> +---------------
>>> +
>>> +`XenProd~version_hyp_version_cmd~1`
>>> +
>>> +Description:
>>> +Xen shall provide a command (num 0) for  hypercall (num 17) to retriev=
e Xen's
>>> +version in the domain's x0 register.
>> Somehow you will need a req saying that how and hypercall is specified i=
n general
>> and then one req per hypercall:
>=20
> We have a market requirement, if this looks fine
>=20
> Xen shall provide an interface for the domains to retrieve Xen's version,=
 type
> and compilation information.

ok

>=20
>> Xen hypercall number 0  shall return the Xen version in register 0.
>> I would also prevent saying x0 which would make this aarch64 specific.
> Xen shall provide a command (num 0) for hypercall (num 17) to retrieve Xe=
n's
> version in the domain's register 0.


ok

>>=20
>>> +
>>> +Rationale:
>>> +
>>> +Comments:
>>> +Xen version is composed of major and minor number.
>> Can't we link to the requirement defining where the version is stored ?
>=20
> Yes, this is linked to the design requirement
>=20
> `XenSwdgn~version~1` and `XenSwdgn~subversion~1`

Good

Bertrand

> - Ayan
>=20
>>=20
>>> +
>>> +Covers:
>>> + - `XenMkt~version_hypercall~1`
>>> +
>>> +Needs:
>>> + - XenSwdgn
>>> +
>>> +Extraversion command
>>> +--------------------
>>> +
>>> +`XenProd~version_hyp_extraversion_cmd~1`
>>> +
>>> +Description:
>>> +Xen shall provide a command (num 1) for hypercall (num 17) to copy its
>>> +extraversion in the domain's buffer.
>>> +
>>> +Rationale:
>>> +
>>> +Comments:
>>> +Xen's extra version consists of a string passed with 'XEN_VENDORVERSIO=
N' command
>>> +line parameter while building Xen.
>>> +
>>> +Covers:
>>> + - `XenMkt~version_hypercall~1`
>>> +
>>> +Needs:
>>> + - XenSwdgn
>>> +
>>> +Capabilities command
>>> +--------------------
>>> +
>>> +`XenProd~version_hyp_capabilities_cmd~1`
>>> +
>>> +Description:
>>> +Xen shall provide a command (num 3) for hypercall (num 17) to copy its
>>> +capabilities to the domain's buffer.
>>> +
>>> +Rationale:
>>> +
>>> +Comments:
>>> +Capabilities related information is represented by char[1024].
>>> +For Arm64, the capabilities should contain "xen-3.0-aarch64" string.
>>> +
>>> +Covers:
>>> + - `XenMkt~version_hypercall~1`
>>> +
>>> +Needs:
>>> + - XenSwdgn
>>> +
>>> +Changeset command
>>> +-----------------
>>> +
>>> +`XenProd~version_hyp_changeset_cmd~1`
>>> +
>>> +Description:
>>> +Xen shall provide a command (num 4) for hypercall (num 17) to copy cha=
ngeset
>>> +to the domain's buffer.
>>> +
>>> +Rationale:
>>> +
>>> +Comments:
>>> +Changeset is string denoting the date, time and git hash of the last c=
hange
>>> +made to Xen's codebase.
>>> +
>>> +Covers:
>>> + - `XenMkt~version_hypercall~1`
>>> +
>>> +Needs:
>>> + - XenSwdgn
>>> --=20
>>> 2.25.1
>>>=20
>> Cheers
>> Bertrand



