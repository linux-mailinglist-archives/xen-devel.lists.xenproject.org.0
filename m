Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0CDF89F08B
	for <lists+xen-devel@lfdr.de>; Wed, 10 Apr 2024 13:20:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.703034.1098831 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruVzd-00069d-7Q; Wed, 10 Apr 2024 11:19:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 703034.1098831; Wed, 10 Apr 2024 11:19:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruVzd-000685-4f; Wed, 10 Apr 2024 11:19:53 +0000
Received: by outflank-mailman (input) for mailman id 703034;
 Wed, 10 Apr 2024 11:19:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YNPZ=LP=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1ruVzb-00067z-Od
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2024 11:19:51 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20601.outbound.protection.outlook.com
 [2a01:111:f403:2612::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3f2f4f3a-f72c-11ee-b907-491648fe20b8;
 Wed, 10 Apr 2024 13:19:50 +0200 (CEST)
Received: from AS9PR05CA0306.eurprd05.prod.outlook.com (2603:10a6:20b:491::20)
 by VI1PR08MB9958.eurprd08.prod.outlook.com (2603:10a6:800:1c0::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Wed, 10 Apr
 2024 11:19:44 +0000
Received: from AMS1EPF0000004B.eurprd04.prod.outlook.com
 (2603:10a6:20b:491:cafe::4a) by AS9PR05CA0306.outlook.office365.com
 (2603:10a6:20b:491::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46 via Frontend
 Transport; Wed, 10 Apr 2024 11:19:44 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS1EPF0000004B.mail.protection.outlook.com (10.167.16.136) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7452.22
 via Frontend Transport; Wed, 10 Apr 2024 11:19:42 +0000
Received: ("Tessian outbound f0b355493f75:v300");
 Wed, 10 Apr 2024 11:19:42 +0000
Received: from e052a3e45c48.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E22F79C6-85C0-40D1-9DB5-E6F3066073AF.1; 
 Wed, 10 Apr 2024 11:19:36 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e052a3e45c48.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 10 Apr 2024 11:19:36 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by AS4PR08MB7782.eurprd08.prod.outlook.com (2603:10a6:20b:516::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.26; Wed, 10 Apr
 2024 11:19:32 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6204:b901:9cc6:bf2b]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6204:b901:9cc6:bf2b%6]) with mapi id 15.20.7409.053; Wed, 10 Apr 2024
 11:19:32 +0000
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
X-Inumbo-ID: 3f2f4f3a-f72c-11ee-b907-491648fe20b8
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=il8aPoEMIc9faAOAiVDZWjScbhJoogapYk1EhoKEkvQm3b7wKapAI2Jg7YlIxeyyFd4e+RGg619ASwpbZ9o4dWr9+rQBjGcuhM0lVrctrYWl9DtqLHQeTAlzXrHgxs8Mp6qmjiIDrKEqtpnNV5OpBC3lH9gR/MQO7e9lmhSCe7Ka0JjjpjqcUKXSB/VmzcQ7emLRASqJe+lcF5WppwDtQmifXt4VQSbKRKrZQHmmgzZ/JYI8v4VXEk55HnwtCbi00ti50GkFgVgzuFqsY3ooPOegVKBa0/50NKMVIrIx8qJ9buyNR2267tsLlrwoxMusbZux70G0+SGKxP/hG2bJ2Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6A/1qkUxhlab+P/th8YJkLqmToP6x19+FT/yJN+nPJM=;
 b=dgT2YBJI9nL0gBlWDjZp6Kw/ZvMKr5RikMBTk32CuBZokI4TI4YtaXK+ZpExt+sHftbFdPNPKuhLk+uKv+dr5MgVntaciMIiOE+1ZqWQWP8GN8Ik9826nYSfdiMYd7EYJuR3mp4rpcpyUMKU1eK5X5zf3lWjyrIlKlA1et0ot5N6zBff4G5P60XFa6ONrsxQhwBDEeYlI9M8KLzGyxcv2Vu8jryRc6Z1JTrBrNbyiNRGDNcb4SY0RwFBtzrpG5xWmjeeZwjPRRn4lr8gv+rIAeb8mUznRICGgzWBM33zxbj1UHkzb50URIh9nX+m15nXzU1PtBfN4ey5EN+xssVjiw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6A/1qkUxhlab+P/th8YJkLqmToP6x19+FT/yJN+nPJM=;
 b=G/5NmMe4/MK6GKCzC/mWNuVm5gwQj8F9ISrewUbaYxOjzLwOma/BdwpaNl5Ozg2F/O3h8vMsLBD+6JfJlTLuwKFXMhSJp6Jx0y4kwY6emtP4tf0Ns5ftcf6u1X65oTradY8R9QR/AykJcSsMihhm17sKVeFrVec3HwopVLXc9G0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: ad3d0339da3f48ea
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Si7YP/iyiacaILDc9cdMOiPBezhcCRk/IOGclLNFH4gmXEVf3egnHzu8JbKm3UfaLoXwP5iOVbv0oY91ppfQ8ZKJLi5qrI6DOLgWEqgsVXr+opQuwLRSeTLs3C+OQHwILzFbQAQA8UQWIyxDJxPuObetR8EWIgYteIw5/jdMUNl9FWh91AVglat188DRknK4dLm96bu9XT5UzMLb5tCnljt1EHPpxIqKl+G9s/htHWoLt8Z3OsbgTG5EwZWxzByFuO0cEwvbBaMXDFECBcJ597SMP87R7NEzG+jr0+pA1gs3N893k563PPkjmo4jLI6VNQ0IaD0ny/JHiSsGE/BHYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6A/1qkUxhlab+P/th8YJkLqmToP6x19+FT/yJN+nPJM=;
 b=aRhlSxgPvRPP69K6k5u+xrLeLTvoMd+Y+Kr5PhKBGDjsBQSUwMvcpP299F1dbJCBuoXKtAs5MK8jQuqI056phl+EsGp3gZ12rHE1fwon6LTbbouzBFjqeL6pw443XUiIKDCC+LPODhwnFMZslNTBoZcH3drx2PUP9MJbHNFubpIR4BRddPHrB2cp1H3MVF1pLp2b+qro4sC67buFqRSrL+QKik2S3zT21OQKoeDsvC04twRfP2dWkN7WRBf3HaWxQMIvqT9J08CB6bqP9WSqyPfZMg/9L6PZBymBkEbP8GsQvhl55gT0VA5jqcuZ6d53AKR0h19rk+XnldvPqTLC0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6A/1qkUxhlab+P/th8YJkLqmToP6x19+FT/yJN+nPJM=;
 b=G/5NmMe4/MK6GKCzC/mWNuVm5gwQj8F9ISrewUbaYxOjzLwOma/BdwpaNl5Ozg2F/O3h8vMsLBD+6JfJlTLuwKFXMhSJp6Jx0y4kwY6emtP4tf0Ns5ftcf6u1X65oTradY8R9QR/AykJcSsMihhm17sKVeFrVec3HwopVLXc9G0=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 09/13] xen/arm: Reduce struct membank size on static
 shared memory
Thread-Topic: [PATCH v2 09/13] xen/arm: Reduce struct membank size on static
 shared memory
Thread-Index: AQHainOQqOQ8ACmqS0SD80lqrmS1tLFhR1gAgAAPMQCAAAF2AIAABPiA
Date: Wed, 10 Apr 2024 11:19:32 +0000
Message-ID: <F5F625A1-094E-4AA8-AF8F-1CE61098EDFF@arm.com>
References: <20240409114543.3332150-1-luca.fancellu@arm.com>
 <20240409114543.3332150-10-luca.fancellu@arm.com>
 <36108be2-d950-4839-a2a6-06462de7e952@amd.com>
 <045818A6-3E13-465B-8DB6-067877B8A035@arm.com>
 <698db158-fd87-401c-9c13-5b94f973436d@amd.com>
In-Reply-To: <698db158-fd87-401c-9c13-5b94f973436d@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.400.31)
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|AS4PR08MB7782:EE_|AMS1EPF0000004B:EE_|VI1PR08MB9958:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 zCSFk7XGsgPXF+iOIcYYp5AGvyfyEqGLOEp3Dy5aZJGMrAjr8J8kyHnwGOuA1EnXeL3z8kq1rE5500Ky/0iyapEjAE3q9JvPUFKbJN1WGvHfvzU3pHDSJapxgaimre5TcuT/nJ2vBreVfsMGSsr+ug33Vp1TAKLQuWaOJfOt87OtlqwuhLGKP9FY0OW3xmR2Sb54A/B7qdKB7OSxoK520q99FTDvD5Zdg8+SiZDfbX3ConmyFD4Ony099KJAU16LI2mo46GBmnXvRBY2RCB4j+IsRQE5fqBhilIsrl+vMxy8ODOJ7k21JVo+1X1xooRQ++X1ujIyZTrK7LEYG08MqLD0ry/vGgZZL0djod57GJPBZxwj/Dt7anpS7aZUfakcwIay/+1bBC2fhE+KitcayEvvwz6MBO9kJ9w+6DyMbQDvM5NOeqQhi+/3vONAUfo2EHZXBGOi/FOzGrjpey1Q3M676y9GSBglYzpaGY0hixzCgLBZlOeb5+E8s9kWKrK3fhWBulwwoCxVL430EeucRLgx9w2HyhJJIAPIoDmKzlyA2rgl8G5qoPKOiI6Gwb8rChzvRwhEkKXzSX9IXOqH81xrO40gM4K4u4qRI6jyORoYIHouK78xqQF3MpUAcgBgJPe/tZWO6VyQIWd+BsP3R13P3yPB7rmnLBC/UwBto6k=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005);DIR:OUT;SFP:1102;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <FA187B8DF37B1F448406F1D488AD86BF@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7782
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF0000004B.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 48181f43-d649-424f-573d-08dc59501ed7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XWBtEm+I/J/PjRsIEi6y5aWzl091gHXqasXNbg87F7IRBL1tksPpaYauvXAx5uuAgWhm6FRbbvnILI8QBum5T07S18yLVRECerFvsN9pASGJJ9SHZmxlEUsrIHJwpbAiVK5e8PqgtiirqtRL+jsLz02rpYSX99/AVOtGcnH5Tmc8B0BmdKb86JOBaFbB87FcC9bqIRQ198+PSZroLbFzk8bpuzJX1b1KH0pDysEll1C6AFSL0sVi1WLBPVPHdQrKQ9OW1sAoP5/yUESgYPo+kxdMMGN6Gk4q1c6xP2TMfUMAFbfyy4sHT7AhowD25GuJ6wmXw5vRV2IexR5vHbajjRIdj9zM8s+/i5E6XAtPz1Nljhiz3bMRLMmvQ1YBcBhxdQ1eg7CwjtJxoXprn6unh1Wu383zSenomzdqV+fv83Rot/eNYtqKkcFqS9pUxmdFpeJiz6WyJHotUcEiKEIURT8Zc14cIgCBebbgMUJK29ySTtdo+gfeULuMiaoZrgdisdkbKkgCSrRvAXCTcqoZxQxPvDiZBpkWfY5gAUNn40m4BJxNIe9xtQh/DGUVOAli/c6hj0P+TxAK6aiH0zLqayWni4Lk4DF67D3ekyut5rQFCKJg7cEmA/md7sKT2OQiLrgIfoZI+0/iUh5ZGf4t8Vu6E/AHaoSwvNT90qi5WLzPn5510DyW5ypq+fdYTmCu8SWHrvzBjbSz3keaJJT3qj/gOg4YjO43bfIqGs/PW4Dy0b4pb6odnoxeB++S0mnX
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(1800799015)(82310400014)(376005)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2024 11:19:42.8983
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 48181f43-d649-424f-573d-08dc59501ed7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF0000004B.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB9958


>>>>=20
>>>> Afterwards, create a new structure 'struct shared_meminfo' which
>>>> has the same interface of 'struct meminfo', but requires less
>>> I would expect some justification for selecting 32 as the max number of=
 shmem banks
>>=20
>> So I have to say I picked up a value I thought was ok for the amount of =
shared memory
>> Banks, do you think it is too low? The real intention here was to decoup=
le the number
>> of shared memory banks from the number of generic memory banks, and I fe=
lt 32 was enough,
>> but if you think it might be an issue I could bump it, or we could have =
a Kconfig...
> No need for Kconfig. 32 is enough for now but I expect a paragraph in com=
mit msg that you select
> 32 which should be enough for current use cases and can be bumped in the =
future in case there is a need.

What do you think of this proposal:

[...]
hence the 'struct membank' won't grow in size.

Afterwards, create a new structure 'struct shared_meminfo' which
has the same interface of 'struct meminfo', but requires less
banks, defined by the number in NR_SHMEM_BANKS, which is 32 at the=20
moment and should be enough for the current use cases, the value =20
might be increased in te future if needed.=20
Finally, this structure hosts also the extra information for the
static shared memory banks.
The fields 'bank' and 'extra' of this structure are meant to be
[...]

Cheers,
Luca


