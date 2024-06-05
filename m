Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B92E8FC865
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jun 2024 11:56:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.735629.1141748 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sEnMU-0002ZJ-LX; Wed, 05 Jun 2024 09:55:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 735629.1141748; Wed, 05 Jun 2024 09:55:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sEnMU-0002Xo-H6; Wed, 05 Jun 2024 09:55:18 +0000
Received: by outflank-mailman (input) for mailman id 735629;
 Wed, 05 Jun 2024 09:55:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=617u=NH=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1sEnMS-0002Xi-Ok
 for xen-devel@lists.xenproject.org; Wed, 05 Jun 2024 09:55:17 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20615.outbound.protection.outlook.com
 [2a01:111:f403:2612::615])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b44199c6-2321-11ef-b4bb-af5377834399;
 Wed, 05 Jun 2024 11:55:14 +0200 (CEST)
Received: from AS9PR01CA0041.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:542::15) by DBBPR08MB6139.eurprd08.prod.outlook.com
 (2603:10a6:10:200::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.31; Wed, 5 Jun
 2024 09:55:10 +0000
Received: from AMS0EPF000001A0.eurprd05.prod.outlook.com
 (2603:10a6:20b:542:cafe::7) by AS9PR01CA0041.outlook.office365.com
 (2603:10a6:20b:542::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.30 via Frontend
 Transport; Wed, 5 Jun 2024 09:55:10 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF000001A0.mail.protection.outlook.com (10.167.16.230) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7633.15
 via Frontend Transport; Wed, 5 Jun 2024 09:55:09 +0000
Received: ("Tessian outbound 9d4318e1cabb:v327");
 Wed, 05 Jun 2024 09:55:09 +0000
Received: from 03e1b6e6744c.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4518FE04-ED1E-4BB4-AEC2-6FBE330D3764.1; 
 Wed, 05 Jun 2024 09:54:58 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 03e1b6e6744c.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 05 Jun 2024 09:54:58 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com (2603:10a6:20b:404::24)
 by GV1PR08MB10502.eurprd08.prod.outlook.com (2603:10a6:150:16b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.31; Wed, 5 Jun
 2024 09:54:55 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::a62b:3664:9e7e:6fb2]) by AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::a62b:3664:9e7e:6fb2%4]) with mapi id 15.20.7611.016; Wed, 5 Jun 2024
 09:54:55 +0000
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
X-Inumbo-ID: b44199c6-2321-11ef-b4bb-af5377834399
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=XXW3xvB/pdDKyk0LYT43ROnA4N6fZQ32WMKGqicm6D8o4VabrtaQgDyjydWYZcLNOvoRCAhL3toT9nWaebWJeljYicnMr+yzDZfpqQMauKhSwy7NjkA4mT0gbSn4YnnouPJS9W5l/MpyP/91DuLdJoXcdZgNG7FisHhlEXvZ/g8Y++WIZxtmIcv3fqcbpywvxNqugYpnPh4kudzg3y42InLOPfq2PkkxKkiiK1G097ZzIntWPyxmrsdmC+li+YygITLTKe6I6dEQZWEmznXwhtgsYYoQ847MWMtvvM4Lsr8jkMvuSwukVNWkQx6UIKj+kwy3/zTKEgrl7JzmfdFTKg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sC0Qj0SZW9VKJMcfM7iGLToXbq92PwYe14S/eMEI/8k=;
 b=L8Nwu6QUMuEt7ZOlE0KZygQmYxavJJ8J5+A7l7LoBsRur9c2C992fvJN5Ae+tTDitdYzpmEtIq6bvHZOOCWfCp99LYhJcT40XxZqChQN5PlzQE22g8YpMqGfiUEJub1cH4iPzUt40nFzQxvhK+KGkAA3/6ld/RBs8BmuUtt9PZaCpfY+pi6iluYoxdqq+fBv7yUaxE8oxiBqpN5HP55WdEOS8eDWY6gNSVOSqIcrxA/nRLq6XNwDVLWcgBvsNYp//Iyp74wzChUIFEHqlMXyyf5qGVZhbj5P1ZTg+MUXBJrUgSkbfhl/i5f+r5OQ6RXnOSzClcXp7gnqFESKbENprA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sC0Qj0SZW9VKJMcfM7iGLToXbq92PwYe14S/eMEI/8k=;
 b=rtkol1hNPDucgBK0iLmEsUKYzmr8LOxZslvFycGQHhULNmYhUCIzMQDF67aCP0Mdp79f/MEsPcCTwgz8SlSnEk7vqZKcietPBO9jXy+tVD1pgkPL1sdG6qdyOQ7kaCQrW3YnoKx779RyRQckubf+lnp12LVpt/vdY9e/RwO1vT4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 434fb910ece51337
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H1gLjwOI7AD35o3CEe+2aRUGXeTy00OH1jtBwE83b9xnLUqNj6m2Eg6huEY+GHVd7xf2g21B4b60RATl1On6Hpzn5aIgGBbmiuh+P4i8zpLtWSFn/b7lGU7qSTYD5+CoR1Pawh4klDrv/G11OmnrH8lxVlLdQzEv2U9HpbdpzgcMMrA0aYBCb3za0P4cCpLiicyCG5SHMjw3SjrUPJ28hbstQONWHWdh4w9bpojncV7t9cIcZwESvEuAPt+mdc69kjBMbwaDkpLnBAgmIwKtbccp3uKxC/umWi14B2T+9nAwX43poK5sTR7bYd6kKonAaCoDwgK01Wru8dtf2cmgYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sC0Qj0SZW9VKJMcfM7iGLToXbq92PwYe14S/eMEI/8k=;
 b=B/bDI6rRtn+yBjmwAN5jeaS6IpEgFI2cO2KPVTBMZJE7otZmXJ1+UMGSNrO3pgbaG3lhSMXs1Q5yQOSk5qykwvRPRzCDNjwA7VYPMXyhQEWBnaMQUIqWk961g8/bnUJVt2bMxxmTmVe+1ZdUMDzgehuihHxnWEp4vtXMChMZr1+H7nB5wyJiy8R2qcfYOhxp70479Vy4Ryb/CDu9dzZNiLdH6qkh3+iv5qZd5G6kOKWqQUV38raQJPWfqzXM8MQFR5MdJXrQ8OaCRCrtcqvQo/6AhdvpWfAyCOB2+ENIisfs4FtMpmV3rDcBgUxCfO52j5VUHT52kqcgjMUTSRFqkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sC0Qj0SZW9VKJMcfM7iGLToXbq92PwYe14S/eMEI/8k=;
 b=rtkol1hNPDucgBK0iLmEsUKYzmr8LOxZslvFycGQHhULNmYhUCIzMQDF67aCP0Mdp79f/MEsPcCTwgz8SlSnEk7vqZKcietPBO9jXy+tVD1pgkPL1sdG6qdyOQ7kaCQrW3YnoKx779RyRQckubf+lnp12LVpt/vdY9e/RwO1vT4=
From: Rahul Singh <Rahul.Singh@arm.com>
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, "michal.orzel@amd.com" <michal.orzel@amd.com>,
	"Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>,
	"edgar.iglesias@amd.com" <edgar.iglesias@amd.com>
Subject: Re: [PATCH v1 1/1] xen/arm: smmuv3: Mark more init-only functions
 with __init
Thread-Topic: [PATCH v1 1/1] xen/arm: smmuv3: Mark more init-only functions
 with __init
Thread-Index: AQHarTfONOUU2GkpA0uG/NCVMyHc+7G5AkKA
Date: Wed, 5 Jun 2024 09:54:55 +0000
Message-ID: <7AA016AF-03B0-4321-B0B9-FBDD60B24557@arm.com>
References: <20240522132829.1278625-1-edgar.iglesias@gmail.com>
 <20240522132829.1278625-2-edgar.iglesias@gmail.com>
In-Reply-To: <20240522132829.1278625-2-edgar.iglesias@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7158:EE_|GV1PR08MB10502:EE_|AMS0EPF000001A0:EE_|DBBPR08MB6139:EE_
X-MS-Office365-Filtering-Correlation-Id: a0b4f80f-47eb-44b8-1710-08dc85459610
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230031|1800799015|366007|376005|38070700009;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?QWg3ODJkcldFZXpnOHB5S0lwbnNEbVVPQXhLVkVESU9lc1VYK2J1T3c0cktR?=
 =?utf-8?B?dTZkL1RUTWo1eDdZc2RmeFFRdUdVNWNiMlBHSHFGNSthMTlIMTJjTllnYTgw?=
 =?utf-8?B?MHA0KzZDYndNM1V3WGpiRTlJcFZScHJENldCaERaajdYT1NLaVFDblk3ZC9w?=
 =?utf-8?B?M1BOeU5VRnNHVmpOdU5yc2x6QWdTR3RHaU96dmVSdjRBc0pkNzBZSkc2cFk1?=
 =?utf-8?B?Y1BhcmxLTGxka2wzcGs0TyticDdOZXdGblNMR1JHQlQyM0tsTE9hRVVDclFL?=
 =?utf-8?B?OGFmTUtsYU9reW50ekpKaFVnQyswbWlkOTVGZmdIamdjeGJQMHdUWWhJYmow?=
 =?utf-8?B?VEhzRXF0amVEamJvVy9PbVUwSnJyVTFYNGQ1N1VwQktuWk0wVHFOeTBhTlBp?=
 =?utf-8?B?andxRTBqOTN1UStJRnRvNmRhNk9sSDcxZWtXVVpDTERqc1JwWEoyY0ZPRHFh?=
 =?utf-8?B?d0RCcktyVDZwYnNOeUhLTVhrSDNwZm5vU09YYW5FRGU1ZnZ0WlAzdWdJNU5R?=
 =?utf-8?B?UXBDeldLMXVyWVlyYU5UU1FYVmZwaTF3Ynd1WFJ5ZGh6dUhMK29IdzdIK2cv?=
 =?utf-8?B?alVDRnlQUkJJblJtY3libXo1NVZFT0hpWTFmMnp2bzBPMERTbUN4WWhhSzIy?=
 =?utf-8?B?OXQ2ekJvek5JN21jNkdERTlNWE5ocDZBd29VWmdXUnYwSkZQOENId3ZCOTRy?=
 =?utf-8?B?cmI0bGkzMmRFVERQUFcvbER0UE44N2swMEFOK2R2V2FCU2haeW0yU3c5RlU1?=
 =?utf-8?B?dGhWM2xQTkJ1Ui9FQXVteHpsVXRqZjduZG5Hd0tSY2pNUTZmSitBSlBqVjgv?=
 =?utf-8?B?NmZYVCs5SDFoc2NLdTdJNEQwY2NCbGN5N2xVY1lEQVpEUU1OQmpzZUhLS0VG?=
 =?utf-8?B?TG5DRFQ1RHE5Z0o5ZkhjckwyU2lqOGFabHE2b0g0MWZTaFVZcEVRVVZLTGg3?=
 =?utf-8?B?UmZpZjcraWNSb25PSkNGd1RpbGY0RmZrSXpRMlhRUkNQYStKLzd1RENFUzNw?=
 =?utf-8?B?aG9qV0V1TXppb0k3ekt5YVNKamNFVnpIcnBaUHFDN0Z1UTl3WWIvRS9OVHRJ?=
 =?utf-8?B?MmIyenRKZHBIQWNaZDNkbS8yMUxITHRTcmlWRkgza0dxeUl0MEsybGNzS3NS?=
 =?utf-8?B?KytEbUN3WWdBbFloK1pPMWtGclpSMGIyK0tsRENXVCsydHFjK2tmM0dsMFBZ?=
 =?utf-8?B?UnpwQXkvaFhPemgxc09uamRJSzYxZWxzMnU5WHFDT3dpQm5TSkZkMTdhOEpO?=
 =?utf-8?B?Rm40eEhWM0xLRFUwTEhNMnhRL0RQRWZlV3g3Q1JoT2V2SU9nR0JEUHZnY2ps?=
 =?utf-8?B?Mmx0MHA5Z3h2cEpuSkh3aml1cHlRQUZ0Y1BBb0d5YU9EWTJRbnVsalBtaTRP?=
 =?utf-8?B?N1RLbTlPYnUyNG83YjMvM2FONWF0SEp4aFNUaHF4Y3RSR3BKc2VUWHRidU0w?=
 =?utf-8?B?ODFkV0lId0lteVd6V2RzWWJGRUo1ZU9CN3NkUU12RjlzY1pEZ3E4WFhDTTlO?=
 =?utf-8?B?TXpJTjJuWUwwUSs2bDh4VG1yeENJTE5HRHdEOVhWc1JhWmVIdVlyVDJZM3FV?=
 =?utf-8?B?a2QzYVd4NU1NZGFDSGV6YjExT2FxckRScFdVUUwvbStGdWFXLzM2K0Jva1Ri?=
 =?utf-8?B?U3pGdUlsN0UzRmZnaVg0ZlpYRTVVbkpwQ1lrZGpLNXZwcmVPSUhTQjVBU1l2?=
 =?utf-8?B?UmJkSDBURytraEZ5Ni9FeFM1ZE50ald1LzlLOWpmZmpzK2trOXlmWUpTa0xl?=
 =?utf-8?B?SGd0Zm8wODBOWnFNajVsZVlDaXlpNkYva0d4ak5WWFVGN0p3Sm5teVNKMlk5?=
 =?utf-8?B?ejVhcm5EekNhSms5dUw3Zz09?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7158.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <D4F2A46F17717744AC29B68CB5F19183@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB10502
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001A0.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5a41e625-0a99-4c30-cfd5-08dc85458dd6
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|376005|36860700004|1800799015|82310400017|35042699013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MDVYRE8vNEZYeDNGTnlKQmtmV2hGZmVQSGg5T0U2WlN5d3l1V3dXMUpaUTdL?=
 =?utf-8?B?Nmp5YzlUK09WazNmT2w2bFZpejBjbzJ6dUI2WjU5TDdqdmdpR2hLRytnUzQx?=
 =?utf-8?B?VnF3c281L0llOWw3NjNUdEpRUlk4cThYT3EyWW1uSjZ3bUZVNUIzUVdMdmlV?=
 =?utf-8?B?SFczVnVQanU2eHhrRi9FcTU3c3RranUxa3hFTm80anp0NEgzN1UwL2ttZUtP?=
 =?utf-8?B?Z2JMaFhZUUZaZExQOG1ZRkk0SGxnRDBJSUxTT0dlNEs1NTRsQzJiRkRQK2xw?=
 =?utf-8?B?Ymx0OFNBR1ZTa3BodWZkdURCM0huYVg2RHRCdGRCd29Eeks4bXZXcTJhSUsz?=
 =?utf-8?B?Q2pYZFhrVnZwYytrRkRlelhYWTF5eWJrSnNKTVZvZGFRUlRVWk5WSzJQL1Bs?=
 =?utf-8?B?SGRjT1NxUXJ1VnpiaUkwRTNBa094OFQwekxRSTVoLzJxMTh1R2JYZEVzeS9X?=
 =?utf-8?B?WTQ5Q3QzWm1WMGs0ZVlMQmpUem11bldFbFZaUkcvZTNFdE55OFdpNmREcXRC?=
 =?utf-8?B?VzRWdVZTWGN3WVZ5dUxDQmpCK2Y3R2ZFMldhbmZrejNUdEhlODZ3K2lpOEM4?=
 =?utf-8?B?ZENVVjBiSUpCbHNpREJOS2xSRkhSU29VdmdsNHhKeTFNR0NXNkU4SEd2MndM?=
 =?utf-8?B?NndXRys3SWpkcE9qR1FRMnlNeFArM2ZEbXNNVnB5ZlloeWlKa3I5eFhQdUht?=
 =?utf-8?B?anZDeXR0bkU2UjFYdjNYZWt0cDBYWUQ0Qi9vREVUdlVDZ2pqR01GMHZTRUdY?=
 =?utf-8?B?RG83REtPTnEyZS9yVitHei9zZnp1ejRjZURHZHcwWGwvZ3NpVnBTcWtNTWZv?=
 =?utf-8?B?QWtQTFp3dDF1SEpsTzBTQ0lpbE1hS3psOFJWZHEyR05EU1RnMW90SGpXWHRV?=
 =?utf-8?B?ZWVET0lCRHZHdFlsbWQxUkdGM2xXSnNQV2cxam5xdTRDbUtoMjErVkZwU1Bm?=
 =?utf-8?B?UkJ0VzJwbHJmNWpKZEZBMDVEZXp6dVlDR3ZvTUhrSWpNOThCRmVXY3RaUlJ0?=
 =?utf-8?B?MFUxOUh5STZZQVpJc0Y3dmFJYUU1VHYvVFRvazQrUVVwTEVuWVJBQXhKVUJy?=
 =?utf-8?B?Y1VXNEFaYzd1Rk5SVTlxV0Q5MDJ2THlnMVl4WUxVQldJQ3JkLzNoTFNERFdC?=
 =?utf-8?B?YzMxeThrampLYlR3d2pDaXgwUk1CcTgzYlFpSURSQmI5M0lxM1JEWG1jL1hH?=
 =?utf-8?B?dnlaUURnTitnSTMzeGcxZ3lkN1YzSHJHcUhMWU1xZ2lDT2lQdFhmWHhZRi9H?=
 =?utf-8?B?ZmVuUkQxTDFycGR1bEIrenRUcklkeHROM3VTa1I3THJSelA5YnE3NzZtMFNW?=
 =?utf-8?B?UDI0dlNQSEExamxsM2syYXBOUGkvOFRFamtRQUtRVzZvTThQbTlUMnVpMzU1?=
 =?utf-8?B?RlZFZVJkWHRrQ1dGZXRLTjRNUDNlV0hIYk1tQzZTSGs1ZnRzOEdRVkRpS2lS?=
 =?utf-8?B?UWNVL2E4RktlMHlwbDdrU2lqVHhkZW90YWVCc3ZRQU04UWw0TVJTMFhrd3Nh?=
 =?utf-8?B?VVUvS3NpbjNuTWp2bFlmWWFjUzFTM3NLdlptRUx6ZWNLdkpQVytQUFNrQXl3?=
 =?utf-8?B?cWZnczc4Q2Y3cGQ2dzJvdXRneGJMd3hPTVoxNU53cit6YzNlTEVRZzZuNmV6?=
 =?utf-8?B?WDUrWjE4RTBrV3lDZXJwM1J3QUQwQzYzbEpicTNuTnJvWnlSbVdpU3g2Y1dM?=
 =?utf-8?B?UGIxODEyeXRyS3hWb0FNUDJGa203QTRQcmx2cVNDNlk4cjhVd1lWN3pwMEdr?=
 =?utf-8?B?U1g4bGZodWdFTjErdDNRc3pLdlpLcEtQVTZXWFF2RkpvRENWTXhIZGdDSnVi?=
 =?utf-8?B?ZTRYTWkvMWErbXZLcUFDOVRmWWpWZTRmVGFxTlk1cVh1aytxSWMxbTNTNW5z?=
 =?utf-8?Q?nZt5b6cfPcXaE?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(376005)(36860700004)(1800799015)(82310400017)(35042699013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2024 09:55:09.6173
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a0b4f80f-47eb-44b8-1710-08dc85459610
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001A0.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6139

SGkgRWRnYXIsDQoNCj4gT24gMjIgTWF5IDIwMjQsIGF0IDI6MjjigK9QTSwgRWRnYXIgRS4gSWds
ZXNpYXMgPGVkZ2FyLmlnbGVzaWFzQGdtYWlsLmNvbT4gd3JvdGU6DQo+IA0KPiBGcm9tOiAiRWRn
YXIgRS4gSWdsZXNpYXMiIDxlZGdhci5pZ2xlc2lhc0BhbWQuY29tPg0KPiANCj4gTW92ZSBtb3Jl
IGZ1bmN0aW9ucyB0aGF0IGFyZSBvbmx5IGNhbGxlZCBhdCBpbml0IHRvDQo+IHRoZSAuaW5pdC50
ZXh0IHNlY3Rpb24uDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBFZGdhciBFLiBJZ2xlc2lhcyA8ZWRn
YXIuaWdsZXNpYXNAYW1kLmNvbT4NCg0KQWNrZWQtYnk6IFJhaHVsIFNpbmdoIDxyYWh1bC5zaW5n
aEBhcm0uY29tPg0KVGVzdGVkLWJ5OiBSYWh1bCBTaW5naCA8cmFodWwuc2luZ2hAYXJtLmNvbT4N
Cg0KUmVnYXJkcywNClJhaHVsDQoNCiA=

