Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF4348B1CCF
	for <lists+xen-devel@lfdr.de>; Thu, 25 Apr 2024 10:27:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711909.1112246 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzuRX-0006ZK-JC; Thu, 25 Apr 2024 08:26:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711909.1112246; Thu, 25 Apr 2024 08:26:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzuRX-0006Wh-FU; Thu, 25 Apr 2024 08:26:59 +0000
Received: by outflank-mailman (input) for mailman id 711909;
 Thu, 25 Apr 2024 08:26:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zg9J=L6=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1rzuRV-0006Wb-P6
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2024 08:26:58 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2048.outbound.protection.outlook.com [40.107.7.48])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 91ae13f5-02dd-11ef-b4bb-af5377834399;
 Thu, 25 Apr 2024 10:26:55 +0200 (CEST)
Received: from AS9PR05CA0102.eurprd05.prod.outlook.com (2603:10a6:20b:498::27)
 by AS2PR08MB10375.eurprd08.prod.outlook.com (2603:10a6:20b:544::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.23; Thu, 25 Apr
 2024 08:26:22 +0000
Received: from AMS0EPF00000193.eurprd05.prod.outlook.com
 (2603:10a6:20b:498:cafe::d8) by AS9PR05CA0102.outlook.office365.com
 (2603:10a6:20b:498::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.25 via Frontend
 Transport; Thu, 25 Apr 2024 08:26:22 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF00000193.mail.protection.outlook.com (10.167.16.212) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7519.19
 via Frontend Transport; Thu, 25 Apr 2024 08:26:21 +0000
Received: ("Tessian outbound e46bb127ed3d:v315");
 Thu, 25 Apr 2024 08:26:21 +0000
Received: from ae118e6474a9.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8831D7D5-168B-4F1E-8C51-E388206D8745.1; 
 Thu, 25 Apr 2024 08:26:11 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ae118e6474a9.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 25 Apr 2024 08:26:11 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com (2603:10a6:20b:404::24)
 by DU0PR08MB7416.eurprd08.prod.outlook.com (2603:10a6:10:354::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Thu, 25 Apr
 2024 08:26:08 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::3a3a:3b79:47ad:2313]) by AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::3a3a:3b79:47ad:2313%4]) with mapi id 15.20.7519.021; Thu, 25 Apr 2024
 08:26:07 +0000
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
X-Inumbo-ID: 91ae13f5-02dd-11ef-b4bb-af5377834399
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=KQQMv44Ch+GsRgp7OYOPk4o0A4Ln8C06ImYxovBHWn0XX+QhaEJieZv+Wg+agN8BBDTe0ZRku4OTon6KSZgRHzME/eyek8Y00tyyrJqFMf4+GcWsd2+5nRfU6JS3PBKKAjZQkGgqbZCsDyYwmWgwTzmD3rJSbLM7LOc34VQd0gIRa+gfgMoWJFeHsu+B3oF4TJEbc1V4uVLRmr5CLv3UQMYtoQMQW3TRJIHLufg2I1uJmknZEIQVIXRWTNRAjnU4ussZo8ZjDGKqbLEf4WZXihAZCpOClXAF0EkgiilM8Ijzq/uCvF85Dz7wpQj4HFyttQ7UytkI24C1iXKJfK94lw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Q/8m07bBWSyCGo3SHZf2m1zvDUFpr83uVcqxheHfvw=;
 b=F2D14uZB23/8PKVdecei12hyYM08Oj0ocmsaiRmAxnIwAeFechwSofk4Qe9LSNGhuZNBU0plp5Pof3VpkzumYRuZANrCfIFeejDTcEQi3x9vvxAsRYrwlJ7F9M94qjyUqRDqkAW+t7D4XCf6ddmEY0IFOiUTmYsx4CYsfBXrODprF/kOY0u7e0LWrPYLGKfil+5KganzeStojhjK4r7wB6an8hVlAYTHQRBtNsE3hNc6yC/n5s33ACJIt/W+N6xvuAdVGI3BTvJxAgHBgpaXJOdvpJBdHnCnYqSd5xXVjiAXrxobN+f3I4D96A2y/WhE6bQ+qQx+vAS2/mNRvTroqQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Q/8m07bBWSyCGo3SHZf2m1zvDUFpr83uVcqxheHfvw=;
 b=l3cHYgnJMbWY3sNoeuwDr5Zy4IjXVjOGTFvCxWkqwOWCGo035LbginpMyKWyOrIhfowPAWMuyViMqjEqKaLL0wZ1yKPOnguwqw5tKhl6y2QIFqZMJ5nUGEd74Jwh7XCjRJb5pVmHThGmD5jzepyoHuDcKy9niydaw4DdRbXrSNk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 886f9f1e8a86609f
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xc77eIEpvXUpKoLArhxD37sedZ9n6QOwuan5+k0FnR2ZVMPDyaeM0CZg2euGA/WuzXKGFOqRBM1bqWmYXdk9qXPY4CTsiwmqT4bVMWq4Jnp1go3lQuHgWmMPvfraEx7Dc4IKtwOOCikfkh2bqPcKVadF7PR+xZFOcE0fXO0ULX+rwRSl9fgEnN0LtlqgVY1MMTQj7QNfm/DN5Z74H6sEnPKIIKzWVvm30Y1ZFIvRIGLEmTZYaezbSHn4YS4NAHKl0XXxJ+oSB/XWsyiX/6e2mPIzuqjAOxni7s2VH+T59ImH5qVT9ADYQeKuOLUTidBB+7lzXhYOdnb8qgVZgVXg6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Q/8m07bBWSyCGo3SHZf2m1zvDUFpr83uVcqxheHfvw=;
 b=HI9cxLy2jCfqxcFvUXkpufsCM0+6OO8zcQttc/2u1UdfPLxLt50w2umdDnDMCjvB/viZR0G/U/tiBDgBfOsMxLDjwjgSb5M3Poxu+P59+YUmBuJu82yk3K3hco087HDKZDORhkzf/kifUFS1vrE15sGkHgRHwsZUbC4J1s0K/TmdD6uReiIlEz1uqz9c7C5eo5uFeGKoVCJLkjXcDirc8qgf5bgRZ2eSLDYfCW+rediMr8cT95n1feqa+2rpOjKIILEVCIbVLuUmA7ItuCockhS8EJ1q6aXF/OneOG9NxlYn9nrlPdlD+HvF8Pdb7ygd+sjndFbtr5cW9OE4k4kNFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Q/8m07bBWSyCGo3SHZf2m1zvDUFpr83uVcqxheHfvw=;
 b=l3cHYgnJMbWY3sNoeuwDr5Zy4IjXVjOGTFvCxWkqwOWCGo035LbginpMyKWyOrIhfowPAWMuyViMqjEqKaLL0wZ1yKPOnguwqw5tKhl6y2QIFqZMJ5nUGEd74Jwh7XCjRJb5pVmHThGmD5jzepyoHuDcKy9niydaw4DdRbXrSNk=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Stewart Hildebrand <Stewart.Hildebrand@amd.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>
Subject: Re: [PATCH] arm/vpci: make prefetchable mem 64 bit
Thread-Topic: [PATCH] arm/vpci: make prefetchable mem 64 bit
Thread-Index: AQHalmRfJ+JLQJbdjkSQeVCdK+Xi9bF4p4OA
Date: Thu, 25 Apr 2024 08:26:07 +0000
Message-ID: <EDBAE4CE-8421-4AC5-A239-10F446D1C37D@arm.com>
References: <20240424162726.204791-1-stewart.hildebrand@amd.com>
In-Reply-To: <20240424162726.204791-1-stewart.hildebrand@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7158:EE_|DU0PR08MB7416:EE_|AMS0EPF00000193:EE_|AS2PR08MB10375:EE_
X-MS-Office365-Filtering-Correlation-Id: e776c439-b539-4599-09f9-08dc650163a4
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?ekEvYmJjem9OWGdJa2N1eWY0aVY4Zkd3Rm13eFBDd1g2VmRlTUVqVUtQdUVl?=
 =?utf-8?B?aGNud2ZRenMwSDlxbEhyRExRVTUvQ1ZqSVBDMldtT1pPaEhGeTdpaTdhcHVF?=
 =?utf-8?B?SUlScmFxdUJtSHR4OEdJd3NZc1gxTGQ2WlkzNGtURVpDWUtLMVNlZkNuWEpq?=
 =?utf-8?B?ZDMwMHB6dWd4aWVwZ0FNZy81MmpmdlpEc2FRM0NoVUtaY2JVdkFkeWtYTCs5?=
 =?utf-8?B?MVlhRnlRRUtmZjJqQTdMZ2ErNEVZdE95SHBvV2g4Mk5paEgxVENJaE03cWxq?=
 =?utf-8?B?WU55WCtsRFl1TFREV2JTVnpoZEgzSUlpTVU1OVg3ZzNHV1JZWDdyRndKdzJp?=
 =?utf-8?B?cjRKMU5BS2c3NE9vOTRxSTBSSGZmdXdvV0FVNU40RkdETkNiSGg5eCt2VDRy?=
 =?utf-8?B?cExjd1ZVbkVxdVMzMlpiQzV4bkRZcFVMYzljaGtXYU9xNVNlWXNiVVFVdW1y?=
 =?utf-8?B?d093M2FhZnl1MzRrNTB1SkJuemlGaCtucGdORHlmVDZiS2tKOEZkdWxhbnJP?=
 =?utf-8?B?cGVnWHpKRWVtaE9xcEZmenNLQUlHdGEvTTI4SnFmdnJ0UXV6bVhJL3ZyZ1Vy?=
 =?utf-8?B?NHorMGxBL1J2QjNRMVJzaGZPcG9tTWgwSCs1eE44c01zOE5tYXBPUnI3cGcv?=
 =?utf-8?B?UzMvZUV1U1dJNHZVTTNYaHZSYXZaanlMbmRDaHJFaGNla2VkQzNBL1oram04?=
 =?utf-8?B?TXhucHFwcHRLWHNYaFBTUnJmYVlsNE5iZmxYNDRVcjY5UUs2Z3dlMXdQS3dw?=
 =?utf-8?B?b0V1S0Y1YVlZWXZZcnBiOXo2QldWTDBacVFHQlN5Yy96c2pxMThCOUFXWURN?=
 =?utf-8?B?WFNwV2gyRDFyckl3ZmpWTytheFRtRElWbURpWUMzbFVrMWNCaXJqeFY0MU0y?=
 =?utf-8?B?cmx6a1BkQlRaVkQ3OTNHL0lqTFd2M1dnaExYRUllMG5qaTlQS2hpQjNwaFpl?=
 =?utf-8?B?WkR3cVBYRHNLQ21zaTBaTTV5em5RUTJZSUZaMFRHM3MzR0ZCUE9jUHNrRmY0?=
 =?utf-8?B?ait6T2VBamM4bXRpYitlY1JNaFpHNGIySTlKVHZHQVZtMHlLRUYweWJUVVBO?=
 =?utf-8?B?aVpZZUlpVmFxd0U4d3MvcmFGTHpla2hucU04VHNVL2Y2K1FMUlZ4Z3VkTWlS?=
 =?utf-8?B?SjVWbDVnZW5DWXJoa3Nya3hjekxSSW9SSXI3ckM5QjhZeTRQNkErenFiZWJj?=
 =?utf-8?B?bFczOXNKWTRXQkpoOHcyMUs3aUc5cXRxS3Z4MGtHaGhNeW8vVSt0Ym5rTzF0?=
 =?utf-8?B?QUIyKzdtcEJlbUNKNHJwVGd0NUtSSzdSZG9XdmhFSXA3bGZLWGw1eXNlNEhL?=
 =?utf-8?B?Mno1SG15R01ZWFJJUGo5YWdpSlZxWUhMRmNRL1V4cjZVN0Vqb1V6aTFHRElG?=
 =?utf-8?B?Ym1iN3hYVnhuMXVjd1orS3BMaEJKMDJ2WXhaYk16OTRqRjg1MkltbE1zWDgr?=
 =?utf-8?B?cmtnbFRQai9kdlJVS2lmZUdzL2ZJRnJFWnhnLzdZMHFycC9Jd0VBeUtWd0Mz?=
 =?utf-8?B?eXFuVWZvNmtETFh4aGM2UTM2YTVIaWFVbDNtdzFSdGxsL2hOU1B5N090RG12?=
 =?utf-8?B?MlFIbWg3eWEycUhQRUZ0R09RTDNpZEFHb1d2aENTZmZ2dVdOSnd4YXVVNm03?=
 =?utf-8?B?L1ZnUmVsUTFnUmlFQzd0c3BMZ2UyYi9iZ0laYmZnMzZUdDBxTXlERHVDQnB1?=
 =?utf-8?B?UitZNE0zQW9VZlRTTitKWUdQNHBSYmxlNEdOaFpzSHhxbmdMWGRWRjE0VUNi?=
 =?utf-8?B?eWpGM0FJa2JMRjJ0OGluY2I4MGR5cFZFKzMrcHZWV2dUZGZ1ayszMG9lcmRt?=
 =?utf-8?B?ZktJdm1md0ZkRzFkY0lMUT09?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7158.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <9C06BCFD9810A5418872763AF525EEA5@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7416
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF00000193.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	95e1b878-1246-4fb9-de50-08dc65015b2a
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|376005|1800799015|36860700004|82310400014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SVM5NzlyZGRVc2ZrbEZvTzRoTnl5WmV1T1hyUlcrZndSeCtqSHNOMDNGSGNL?=
 =?utf-8?B?WWQxRVFVRXJ6MVg2TjRjNlR4ZEpPcUdNK0I2MFhJVWMxcnhneVFkN2ZyYjFo?=
 =?utf-8?B?cDliUDA5bG41QXN1ZFlSU1BWLzZTZ2ZvOFZxNEpPREdhcjBRMjF4MktucE5h?=
 =?utf-8?B?L2t0bXpHSGRHTVM3SVczNmR5djJUYlVEZE11SG9NZmdEaVRlYU5OMFA4djJQ?=
 =?utf-8?B?RVRUOVQ1K3RpMjJqZkFFUE9JY0wzZTEzdXNBdUpIQzJ6RzFaRnRydkpkOTd2?=
 =?utf-8?B?aFpDaGhMWU16aklxOUxnTmF2U3pGak9zREl4THllVVFLSG1MZ0FkUGhpQzlv?=
 =?utf-8?B?dVZPOGdDaDBrTStFTk1yQVUzY0MzaWhRT1puVGRwMkE1QS95R1RyV29zUHBh?=
 =?utf-8?B?WWtHdnFDRjhwL1h5eFkxUnNJaFhLOUdlNUlxNkdpbE1HRWlVeFdlR2pUZFdT?=
 =?utf-8?B?ZHJMSktTQ0tLRTNWUzAxRnlHNXNtVGxodzdIMDNQbzNQUUtmTDVUeUVMUUNM?=
 =?utf-8?B?akJFbi9PdUVpSU9pc0N4MU5LeS9yUnpHNFBobmFqSjhvakJ6cVdZeFJPUk5B?=
 =?utf-8?B?WWYvUVcvR1lmR3pLWG55THJtNE0vaDIwZXdCZDQ3U2VBd0tWNnlDbm9CMVZJ?=
 =?utf-8?B?QjBkbWIwN2VmeHlJTlFPQ1BETUk5T3FKZ1FjRWVQaTkwNy94Q20reWU2WnNh?=
 =?utf-8?B?aXFyT2ExaDlvUVdNdGdhTVlHaS9tbDJ0S1BqMWdick1pRFlpUnlMTlVIMUZR?=
 =?utf-8?B?RE9PU2k4azdmNjBncC9lcVZxemFCdFhXbHNORjYyVEV2N1VFd2lITzFpcHMx?=
 =?utf-8?B?bXM2TStvQ21OT21ZUVZjUzN2eVJhZDFHd0lPVU1oYU9NSWJTVGErY1pQKzY3?=
 =?utf-8?B?U1pHeXNiN2JDSHRNenpCcHFjTFhqNFFhdEs4ZW8yakdDQzF5S21ERlBSaFIz?=
 =?utf-8?B?MVFDaHRzcWkvQWhwNDdVaWNhMDJYc1Z0T21zVnNLNndnczVXYTlPbE8zZ2wr?=
 =?utf-8?B?S1MyajUxaHZtL0E5NnFwWFQ0T2JZb0FZYUgzcjJhNDRJTkJqUk1zeVZEMzJL?=
 =?utf-8?B?ZDlPUDZTZmg2aTBKVmZ6T2ZPMXFFL25jTDJmQ05FYXc3VHZ2V2g2djUxeVE1?=
 =?utf-8?B?Rnk4YTJiQUtNM2tCZ0EyL0NHRTBGOWpLNXFhbE1DMllnVTJsNExodWRFTTNy?=
 =?utf-8?B?d3pyWEZaNnJmT1FjcWI4T1hlTHBlL2N4Z3BucUJNV1UydUVERGdkOXdJc21N?=
 =?utf-8?B?c1BxL3hnNFQyTTdNWGJXQkI1THNtUDZqNzdidFhsVWo1eDhpUG5FQ0w1VTM5?=
 =?utf-8?B?QlFWQ053aHR0ZHpGNVNqVkg3TDEzSi9PQ3IyUHVSZWNhUElsN2h4bXJhWWtQ?=
 =?utf-8?B?TmpWempWZVNaVTc0ZEZhYWxqK3pVcm0yZmUrS1E5ZnZYd2RIcTJHencwQjQv?=
 =?utf-8?B?NGdiSjNvYllUMXN6MEc3T3RadEUrZFU5TG5xQ2UySnBweGxRYmpDV09PK1ZC?=
 =?utf-8?B?SHg5L2ZacklnQi9vZ095MFVOWXo4eHJtUmVLclJoSUJNbmErc1MvOXFFeFJW?=
 =?utf-8?B?d2VxSGlDSFZFL0JsUkNoU2wxQWpsRzZJS0VmVEk1VC9sMThxaGJCcWdQUkhY?=
 =?utf-8?B?KzA4bGVReTlxaDdxUWtCeHNXVU84Z0x3Mi9DdDRpcXlvQ1d4RXozQlYyRHFu?=
 =?utf-8?B?K05reEMwdjRkVVJLMWdkQnZmcjdncEcrNkFsaXNIMStuNlZDYW10dzdEK3h6?=
 =?utf-8?B?MkMvOVBJVkk1b0JxaHJjMlluREwzenR3blY0RlJnZldKcUQ4b21GRytzcVNm?=
 =?utf-8?Q?lStjx/WuCBJnOW8HrQWGiDn4WFkmrqXlcICU4=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(376005)(1800799015)(36860700004)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2024 08:26:21.9897
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e776c439-b539-4599-09f9-08dc650163a4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF00000193.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB10375

SGkgU3Rld2FydCwNCg0KPiBPbiAyNCBBcHIgMjAyNCwgYXQgNToyN+KAr1BNLCBTdGV3YXJ0IEhp
bGRlYnJhbmQgPFN0ZXdhcnQuSGlsZGVicmFuZEBhbWQuY29tPiB3cm90ZToNCj4gDQo+IFRoZSB2
UENJIHByZWZldGNoYWJsZSBtZW1vcnkgcmFuZ2UgaXMgPj0gNEdCLCBzbyB0aGUgbWVtb3J5IHNw
YWNlIGZsYWdzDQo+IHNob3VsZCBiZSBzZXQgdG8gNjQtYml0LiBTZWUgSUVFRSBTdGQgMTI3NS0x
OTk0IFsxXSBmb3IgYSBkZWZpbml0aW9uIG9mDQo+IHRoZSBmaWVsZC4NCj4gDQo+IFsxXSBodHRw
czovL3d3dy5kZXZpY2V0cmVlLm9yZy9vcGVuLWZpcm13YXJlL2JpbmRpbmdzL3BjaS9wY2kyXzEu
cGRmDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBTdGV3YXJ0IEhpbGRlYnJhbmQgPHN0ZXdhcnQuaGls
ZGVicmFuZEBhbWQuY29tPg0KDQpSZXZpZXdlZC1ieTogUmFodWwgU2luZ2ggPHJhaHVsLnNpbmdo
QGFybS5jb20+DQoNClJlZ2FyZHMsDQpSYWh1bCANCiA=

