Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5059C8C2115
	for <lists+xen-devel@lfdr.de>; Fri, 10 May 2024 11:37:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.719640.1122482 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5MhF-00059J-1v; Fri, 10 May 2024 09:37:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 719640.1122482; Fri, 10 May 2024 09:37:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5MhE-00056f-UR; Fri, 10 May 2024 09:37:44 +0000
Received: by outflank-mailman (input) for mailman id 719640;
 Fri, 10 May 2024 09:37:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jEWd=MN=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1s5MhD-00056Z-Ed
 for xen-devel@lists.xenproject.org; Fri, 10 May 2024 09:37:43 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20600.outbound.protection.outlook.com
 [2a01:111:f403:2607::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f214db81-0eb0-11ef-b4bb-af5377834399;
 Fri, 10 May 2024 11:37:41 +0200 (CEST)
Received: from AS9PR05CA0323.eurprd05.prod.outlook.com (2603:10a6:20b:491::13)
 by AS8PR08MB10362.eurprd08.prod.outlook.com (2603:10a6:20b:56c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.47; Fri, 10 May
 2024 09:37:36 +0000
Received: from AM1PEPF000252DF.eurprd07.prod.outlook.com
 (2603:10a6:20b:491:cafe::7d) by AS9PR05CA0323.outlook.office365.com
 (2603:10a6:20b:491::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.47 via Frontend
 Transport; Fri, 10 May 2024 09:37:36 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM1PEPF000252DF.mail.protection.outlook.com (10.167.16.57) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7544.18
 via Frontend Transport; Fri, 10 May 2024 09:37:35 +0000
Received: ("Tessian outbound e46bb127ed3d:v315");
 Fri, 10 May 2024 09:37:35 +0000
Received: from bf7312ff9561.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 71FCD132-B67C-4DF5-B031-02AF3BCFCDAC.1; 
 Fri, 10 May 2024 09:37:25 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id bf7312ff9561.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 10 May 2024 09:37:25 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by AS2PR08MB8805.eurprd08.prod.outlook.com (2603:10a6:20b:5f5::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.47; Fri, 10 May
 2024 09:37:22 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6204:b901:9cc6:bf2b]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6204:b901:9cc6:bf2b%6]) with mapi id 15.20.7544.048; Fri, 10 May 2024
 09:37:22 +0000
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
X-Inumbo-ID: f214db81-0eb0-11ef-b4bb-af5377834399
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Kit/bHzcEwllSfMx0RgNvhrQhguidy3OgLBVNJLKTlZzQV1S46lEBlIPMQ6UlePciX8tQ7XHRaWuFziVJfTOgw832GRRPNR/sWpz4jjRF1MBiWY4Ph5ZsIPWMNSQKEqW0WU5qMIUqk/95E5ekzdSRGza1c8hgdkOx2/CadO4L8ve0p6AkUX2Kt5/lEYGbTolInqCvi4EFmvDXAC9TaMoKqX8ZzdX813Kce7V+1zjhOOHiwxSxXOZniLmQQzQbNVCqFGSxYZFzZJTa/YnKfiDEtdU1upxpkNoHoSzN8VpmtPyULBD5q31g44nTlFZqwdGhVKzXMXYZsByuUz/lYi49Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lge1AzD5rhGXz01NwK80rM038779ps/C04JAL6lzDtc=;
 b=dj/Ltiesp5JN6UneCGYMlqFE5er2V+WMTdJzglncUua+Wg2JidPveLchop+gKbPqxnoaHl4/39+AoCqQWyHxe0YuXVXkVuYAxHg9bZeH4RbW37sMLXrQ9OdD9uL10dT7oCA9dT45IpxW670Q156QkM8Q6Nt2T8vFJXFB5It0Lkxy2vRu2l8EKbADi5DmasPiAjXYmxlSBEGf5D3rnU/MLmVX6TbLwBMFTm3ykqceFH4BPjSxjso0WJ14NuvmeVhA8CzZn5DIUVtGfHFDmYJKbqDRtetLlDwg2bAi4ReXeJ0EwHYNU0d6QA4q1pUetGQdzcP6fEl3xgPef95sF2OJ2w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lge1AzD5rhGXz01NwK80rM038779ps/C04JAL6lzDtc=;
 b=CTjkJ+tQMjCV8DcozNTMdljDybZYkujn0UrZzN/RNgxCLWnLsSnMebURwAZDu2rhnvL+FoCJ6VDCPMYxeLVwuY29FrSDpw5S5VlHc/yZsw8FS4lgyoB8xQUEEbl3yjAyIdDUUGhlRu2elPhrGj8FERhwnyxU003erbq7h9eUY+E=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2c6a67df5bb7d963
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gh5KAypQsCbuxvqKESV45TZmNuvvvSux8bZfNFr1Y3v+4jk/eDFGQ5FKEbwPsY1PJwL2IXcYdMuL3TapAUy7mKNq2BTFvtSVr60wIhOiUR3HcT2pOiRHiZfdKnsyW09Q/jsq4TAC7vhafGCr+qND7qRkKHR8ai9JAOHX4OMOHBJprYL+UfmcjCg4e3RvnUBQN80hDmmdeBqGW1YiJsI5Oqm1qj+W0JyZS0RIhJJhy5BI5o5weNCAwmyjHlBwyuPLnKeWzVwew7p35/BlgT2H9PtaKFLXsNaNY+kF4v9jlq8Nf+ztpbFOQNPC7zQfj3GlzVDP+iwtXvTajdGHmIXJtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lge1AzD5rhGXz01NwK80rM038779ps/C04JAL6lzDtc=;
 b=koSIgZjFWGDV6hQ74V+jyQ+wqOPJkW7shC27fHj+o8R/RA1onSYqGJgG5KYWMYZgo4aqbbteeJ1jVzIiBcC+ZB+udzVMCgKGe6IDo4fL6+qvxddlMZR5VXvvcrYYa6PgHWPK13Pt4srb3eNzqrpiXwIwgQ/yhoSZeZimb7h6NDbiRS3Bdc4Gl71RDZpNm4ssQONav9EiydWkqs8qh8gjQpC75W5gmO+EGCUlldohndnI40bCKJAtCxqEdNvfVRcjPQnW1LP1v+cb8+SLq7xErQP75OtQkuhLDeGyLxzcWHmEqXphOY8EAl/nh9YtVI92VoByz6R72dOQ3oOV6bT/1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lge1AzD5rhGXz01NwK80rM038779ps/C04JAL6lzDtc=;
 b=CTjkJ+tQMjCV8DcozNTMdljDybZYkujn0UrZzN/RNgxCLWnLsSnMebURwAZDu2rhnvL+FoCJ6VDCPMYxeLVwuY29FrSDpw5S5VlHc/yZsw8FS4lgyoB8xQUEEbl3yjAyIdDUUGhlRu2elPhrGj8FERhwnyxU003erbq7h9eUY+E=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 6/7] xen/arm: Implement the logic for static shared memory
 from Xen heap
Thread-Topic: [PATCH 6/7] xen/arm: Implement the logic for static shared
 memory from Xen heap
Thread-Index: AQHalVfty94kOt4AK0ecWyByn7T1+rGQSwuAgAACP4CAAAIGAIAAAUOA
Date: Fri, 10 May 2024 09:37:22 +0000
Message-ID: <210C1AE6-013C-47FE-9543-689A89A4FF8C@arm.com>
References: <20240423082532.776623-1-luca.fancellu@arm.com>
 <20240423082532.776623-7-luca.fancellu@arm.com>
 <cb496741-dd76-4536-818a-cbfdbd496b0d@amd.com>
 <10212FF3-3CCD-4634-9890-4CDCA11A5F88@arm.com>
 <e025553b-4b3f-4591-b996-2e31eb081bba@amd.com>
In-Reply-To: <e025553b-4b3f-4591-b996-2e31eb081bba@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.400.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|AS2PR08MB8805:EE_|AM1PEPF000252DF:EE_|AS8PR08MB10362:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b8548b2-8402-4deb-aea7-08dc70d4d349
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230031|366007|1800799015|376005|38070700009;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?TzI5OXF0ZFd3K0RMT0MvWTNjSHVjc1NFZ1VxU09yN3VKancrUWV4dlBsbzRp?=
 =?utf-8?B?a1dZYmhjK0tweEo4UGtUNU94QjZ5ZG1pcFZvRXNDTWY4UlJreFFRUmMwN0Zj?=
 =?utf-8?B?aVFXdlJpaEQ5YStadXlLNXd2NnBUTENkUTZ4S2QxdWtHKzhvNW5vQUxveWdp?=
 =?utf-8?B?NzZhZHRZZUZJK3JzR2ZTbkhIZ2FWN1F4ZzQ5M0gzS3d4Skk5em9CY2g2YVFt?=
 =?utf-8?B?N21Ic2tNZGwzV1RMYk5WK1NxRndRRHlYdG9ldDgzYm9IOE5CYnlUWlllaWhh?=
 =?utf-8?B?SUhQTUR5dW1xcldtaGs4eWlLYTZPTVY2ajFvK0JtRk92MUQ0T1dsd282NUtC?=
 =?utf-8?B?Qkh4Q1R4VGs0VHVWVU1lamZxZ0p6NzNheHV3bzMvKzhkR1JVZnFJdGFHQzc1?=
 =?utf-8?B?eEVSalFYOXNSaGthZS9TMFlQTnFaQ2NOYUV6NGxnVGt4b1Z1Y1hQTEM5UXZV?=
 =?utf-8?B?U2NxalpHQWk1ekZrTkJCTHZPbUVWL21DSWtOaVNWckRSOVFwSTk5OCtYaTB5?=
 =?utf-8?B?MmVSZStFZ25GeFpTNTF3WUJiTndubHZTcUZtOG1mcWhkR1hlQWpxTWhrNDc5?=
 =?utf-8?B?QlE3ejZqdzVRWU1jdzVNaG5ESUFNV3JxTGp4OCtRSEEyMnR3b1lsZElrM2xu?=
 =?utf-8?B?SlFDYUVFSVZjSmszcDdCYTRONkZVTkZMaTlFQjBmSWNzV09FVTFHV0NBTloy?=
 =?utf-8?B?aXd3NXFYMUFCdEhyRDFtTE01MW4rTWFQOTk1R2t5cXlCcjgrbXQ0MXNkbCsv?=
 =?utf-8?B?cFBIdmVKOHQyVHJ2VmRhQVEwM0dvSEZWVm1PVTdpNmdNTnU3emxhbWZseERm?=
 =?utf-8?B?NXhyL0hKQVdmRzZ4NXhINXEwSHpyRDNSZ3c0eW5PbFdpQVFUNnNndHVla29a?=
 =?utf-8?B?Y1JvVUk5Mk96eDV1YVMranVEcjlEN3ZEN215aktGTlN1VzJiUjVpRmthUElQ?=
 =?utf-8?B?bTNSY0lyTGZleVJrUGtOUU1xVndHUnp3MklpclhmNFdUMXlxa3V3NzB1Wmgr?=
 =?utf-8?B?UGREZlhXZWZMbnVnV1BiMUIzbUhySC9Sdm41b0NUanhFSEt6Ujh3K1lINTFk?=
 =?utf-8?B?eDdOcmdKN0dmSEtJSEZOM0ZmNTdvc01nckRvOERZbkg0MFB2NmRpU0ZMOXoy?=
 =?utf-8?B?MFg4eVFUeEk2Y09GR3I5cWIrZnRwa0NqTEQ2YWVpcUk3SHYzN01VUEc5YzZr?=
 =?utf-8?B?NUh5Sk1qdk1tTFdkeEMvMHJNYnlmd1NVR1NYZ2VzazdzRHZuY3JNT3NMV012?=
 =?utf-8?B?Qm5SdmtGYmVibUN3b0xTVWdQWDM5eVlDOVU5UWxVSlZBOG9MemZSN2xYdEov?=
 =?utf-8?B?MnJ0TENGLzBRenhTbkhpaHdUMitRUHh0RUFvN21pcU4rcUhiK050Vzd4bEZC?=
 =?utf-8?B?WHhVYkFPdVQ0RTlzdDNNQWduQ1VwRlJveExKQTNxRnNRdzJ0Q01OQml1UTd3?=
 =?utf-8?B?aGN4czl4aWZ3VThsZ3hCN0pYZmIrbmt5ZUpic2lnMC9NYms1blhwR3JyMmZp?=
 =?utf-8?B?UlJlckcyMklNZGczaU84d1E5VXdIaHREVlcrMUxoMkdlLzh6NHYyNlh2UjFV?=
 =?utf-8?B?RFJwZkpoTE5Ja1NBZDdBWGNCMWZ3TWo4ckNNQjNqVWRZWUdUc3NVTm5JNlUv?=
 =?utf-8?B?bVI2dTBMQzNtMk81YWVheDJQVDN3a2h0VzZ0U3ltMGRTajR0WEtGL2FsK2I5?=
 =?utf-8?B?YU9PUncyT0dhK0ZjUlZscTkzSEgzSGFRWjA1NDA2WDZrK3JYKzJPT21hNmx5?=
 =?utf-8?B?OWhBdjUvNHI1TVZtYVRsUWVsbm5ibHlFQnVkRzJ4RmJtenVGamRjMVBiZ0NZ?=
 =?utf-8?B?clBiK01ucWIxSkhCSGRXUT09?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <8A3361E72D9C4D49AB361A833CBE5FAD@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8805
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM1PEPF000252DF.eurprd07.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	eb315c8b-d956-436b-d04c-08dc70d4cb25
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|35042699013|1800799015|82310400017|36860700004|376005;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZUkydUh4ZVFuRGExNkljb1UrWEduZFNpYTJ4Q0plQlpQZ29RMHhRSGpIaGdC?=
 =?utf-8?B?L2YyWjdUdjc4NkUrNkl4SWtNTTFRRUU2TGtWNURLcjNUWmc1VzJ0M0FzZHU1?=
 =?utf-8?B?ekZseGhCZXZvRkxvUUhiTGl1UnNPa3ZGOGk4eUcxQjJTUXRvS0MxazRnZ2VI?=
 =?utf-8?B?VUxkeGEra3ZTcjN1YTdYUUplb3g2bUZCWFA2aEJJT3lreXpKcm5tcU9VYkJ5?=
 =?utf-8?B?YnNidGttSHVCQ1kzckRZRS9JMjZWNGsxSmtpMTVOZ1Z1WlFUTncybkozci9D?=
 =?utf-8?B?YkZSSXhBWG83M1RoelBPeXhySHI3L2xzQ29ZaDlJVmlTcFIzRm5LZmJpWjZt?=
 =?utf-8?B?aFg3SHN6a3NPZ0R6Q0E3dTBJTkNjeE5VOUlVUU9UdkhvYjRzdW44aWJvY0ow?=
 =?utf-8?B?ODZOTlNZUTl5T28zZHUyS0VGazRRWElaOStXVHJGYUxiS3hyTW9heFJ4eFlX?=
 =?utf-8?B?UUs3SGJsVnRkQWc1Nk5xV1dPN25LSW1qdCtZc0tmclRXdDB2eEdNbloxUytP?=
 =?utf-8?B?TU9vRTBVR0dnNEZrR2J3RkVpZDdTQWY2Ujh1UGJhL3UybU01K2NDcGJQZXda?=
 =?utf-8?B?TzRlek5EVDFvWnB0aFovMWg3OFRjaFFjYzBROHM4U09nRjlEcTh6ZDRmWkh2?=
 =?utf-8?B?RVlOV3ZzUFJvYnpBQms5Vk53SUwrRXUwTXVQSllyenQzVFRGRW04VlBlcC9t?=
 =?utf-8?B?THdUT1RVQTlCSXZUR1FsVEU4NUVHKzVnUjVaNzhQSThlaDlCQms2eXduVDVH?=
 =?utf-8?B?RXVDTGlRQTRaaTBwMWpuWmRMOEpodE43R3pDZTQwS0Q5YTZXVlBSbTJiT3Za?=
 =?utf-8?B?ZHRBcmZLUVB6K1hOUmRCSHdMWVEvVlhrSU93UHdJbjBZbGk5NXZSV2F0YW9W?=
 =?utf-8?B?MWQ2TUJydGZoeG51QTBaNDVaOFhqbFkzKzJvTHBCWVhhcVE0UXBkaWM5dVly?=
 =?utf-8?B?VmpKWVYvM01kV0JQQWhMbmVGQ3RscDZVa1RjeVJHVW5wYktlTVlEdGZ4LytP?=
 =?utf-8?B?RmNTSVNCM1VIRDZzZi9NSVpBQjNQbjdzZGdUUmtjR0xWTzJseWc0eHR1YXZm?=
 =?utf-8?B?YWVYcExqWHp3Z0xEZGh4OGU0RXdGcDRCSzhGVmxPazhUbTVwekg4cjVHT0lv?=
 =?utf-8?B?dkxCUmJKNWdMWG00dU4xd095Z0d1VEh0MXZ2MENyL2oyaTMvV3NNR2tvY3V5?=
 =?utf-8?B?N0xPVlkvZGUzZWxpZGdRT2FIc0d2Mk00bzJuWVRkUWtuT3RZYVhlMGNteXRD?=
 =?utf-8?B?dUlkS0ZJTWI5K0JtZW5tZEhIQm9sazVhTitzWlRON3QvSCtubUpzNmhZUUdO?=
 =?utf-8?B?MS9wdm9uMENsTjNxOVd4K1hRenJSdlZQN0Vxd1BlTG9xUFBOM09ka29OZWdN?=
 =?utf-8?B?Y1F6eXRKeU0wM21NVGNva0Jjd2NZRTlFQWNqR3loT1R6cGVBQ004WkxOczE4?=
 =?utf-8?B?VWVOOHcwQkVCai9odHJrMWJORHFmeGd4bWVhcW0rYmh4d1BnV016b3ZiSUFO?=
 =?utf-8?B?Yk9LWlkybWYzTmp1ajQwWXJYZk1ON093ckk1eTlURmo4Mk5VVmZ4Ui9GcWsr?=
 =?utf-8?B?czdBK1JQb2dWekFXbnJ1Vno2ZVNtQTFNVnF1a0c3M2tldlhGckQ0SGJORkds?=
 =?utf-8?B?ZVhCK1dSU0JpcGllUjROQXpwa2ptdmlvYVljSi9odDlFS3FHNXlMbWxZelIw?=
 =?utf-8?B?d0VWSDZWOFppbzRPU1FkTWhKUE9lS1BXemhhR0N3bTFrODlPMUx0ck8zaDlw?=
 =?utf-8?B?a3NjK3NzNm53Q2lhWkdmaUtpcGRnL0RkL0NOU1RZOWxlNzFYRUNkUVJpQ2hG?=
 =?utf-8?B?VlM5ZG5HMlp0UFVaRUdoVlNLMVRQc2szcUE3RUc2NDVBL3ZxbmNESzdJVnZ4?=
 =?utf-8?Q?kNcgGk3nz5ALj?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(35042699013)(1800799015)(82310400017)(36860700004)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2024 09:37:35.9341
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b8548b2-8402-4deb-aea7-08dc70d4d349
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM1PEPF000252DF.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB10362

DQoNCj4gT24gMTAgTWF5IDIwMjQsIGF0IDEwOjMyLCBNaWNoYWwgT3J6ZWwgPG1pY2hhbC5vcnpl
bEBhbWQuY29tPiB3cm90ZToNCj4gDQo+IEhpIEx1Y2EsDQo+IA0KPiBPbiAxMC8wNS8yMDI0IDEx
OjI1LCBMdWNhIEZhbmNlbGx1IHdyb3RlOg0KPj4gDQo+PiANCj4+PiBPbiAxMCBNYXkgMjAyNCwg
YXQgMTA6MTcsIE1pY2hhbCBPcnplbCA8bWljaGFsLm9yemVsQGFtZC5jb20+IHdyb3RlOg0KPj4+
IA0KPj4+IEhpIEx1Y2EsDQo+Pj4gDQo+Pj4gT24gMjMvMDQvMjAyNCAxMDoyNSwgTHVjYSBGYW5j
ZWxsdSB3cm90ZToNCj4+Pj4gDQo+Pj4+IA0KPj4+PiBUaGlzIGNvbW1pdCBpbXBsZW1lbnRzIHRo
ZSBsb2dpYyB0byBoYXZlIHRoZSBzdGF0aWMgc2hhcmVkIG1lbW9yeSBiYW5rcw0KPj4+PiBmcm9t
IHRoZSBYZW4gaGVhcCBpbnN0ZWFkIG9mIGhhdmluZyB0aGUgaG9zdCBwaHlzaWNhbCBhZGRyZXNz
IHBhc3NlZCBmcm9tDQo+Pj4+IHRoZSB1c2VyLg0KPj4+PiANCj4+Pj4gV2hlbiB0aGUgaG9zdCBw
aHlzaWNhbCBhZGRyZXNzIGlzIG5vdCBzdXBwbGllZCwgdGhlIHBoeXNpY2FsIG1lbW9yeSBpcw0K
Pj4+PiB0YWtlbiBmcm9tIHRoZSBYZW4gaGVhcCB1c2luZyBhbGxvY2F0ZV9kb21oZWFwX21lbW9y
eSwgdGhlIGFsbG9jYXRpb24NCj4+Pj4gbmVlZHMgdG8gb2NjdXIgYXQgdGhlIGZpcnN0IGhhbmRs
ZWQgRFQgbm9kZSBhbmQgdGhlIGFsbG9jYXRlZCBiYW5rcw0KPj4+PiBuZWVkIHRvIGJlIHNhdmVk
IHNvbWV3aGVyZSwgc28gaW50cm9kdWNlIHRoZSAnc2htX2hlYXBfYmFua3MnIHN0YXRpYw0KPj4+
PiBnbG9iYWwgdmFyaWFibGUgb2YgdHlwZSAnc3RydWN0IG1lbWluZm8nIHRoYXQgd2lsbCBob2xk
IHRoZSBiYW5rcw0KPj4+PiBhbGxvY2F0ZWQgZnJvbSB0aGUgaGVhcCwgaXRzIGZpZWxkIC5zaG1l
bV9leHRyYSB3aWxsIGJlIHVzZWQgdG8gcG9pbnQNCj4+Pj4gdG8gdGhlIGJvb3RpbmZvIHNoYXJl
ZCBtZW1vcnkgYmFua3MgLnNobWVtX2V4dHJhIHNwYWNlLCBzbyB0aGF0IHRoZXJlDQo+Pj4+IGlz
IG5vdCBmdXJ0aGVyIGFsbG9jYXRpb24gb2YgbWVtb3J5IGFuZCBldmVyeSBiYW5rIGluIHNobV9o
ZWFwX2JhbmtzDQo+Pj4+IGNhbiBiZSBzYWZlbHkgaWRlbnRpZmllZCBieSB0aGUgc2htX2lkIHRv
IHJlY29uc3RydWN0IGl0cyB0cmFjZWFiaWxpdHkNCj4+Pj4gYW5kIGlmIGl0IHdhcyBhbGxvY2F0
ZWQgb3Igbm90Lg0KPj4+PiANCj4+Pj4gQSBzZWFyY2ggaW50byAnc2htX2hlYXBfYmFua3MnIHdp
bGwgcmV2ZWFsIGlmIHRoZSBiYW5rcyB3ZXJlIGFsbG9jYXRlZA0KPj4+PiBvciBub3QsIGluIGNh
c2UgdGhlIGhvc3QgYWRkcmVzcyBpcyBub3QgcGFzc2VkLCBhbmQgdGhlIGNhbGxiYWNrIGdpdmVu
DQo+Pj4+IHRvIGFsbG9jYXRlX2RvbWhlYXBfbWVtb3J5IHdpbGwgc3RvcmUgdGhlIGJhbmtzIGlu
IHRoZSBzdHJ1Y3R1cmUgYW5kDQo+Pj4+IG1hcCB0aGVtIHRvIHRoZSBjdXJyZW50IGRvbWFpbiwg
dG8gZG8gdGhhdCwgc29tZSBjaGFuZ2VzIHRvDQo+Pj4+IGFjcXVpcmVfc2hhcmVkX21lbW9yeV9i
YW5rIGFyZSBtYWRlIHRvIGxldCBpdCBkaWZmZXJlbnRpYXRlIGlmIHRoZSBiYW5rDQo+Pj4+IGlz
IGZyb20gdGhlIGhlYXAgYW5kIGlmIGl0IGlzLCB0aGVuIGFzc2lnbl9wYWdlcyBpcyBjYWxsZWQg
Zm9yIGV2ZXJ5DQo+Pj4+IGJhbmsuDQo+Pj4+IA0KPj4+PiBXaGVuIHRoZSBiYW5rIGlzIGFscmVh
ZHkgYWxsb2NhdGVkLCBmb3IgZXZlcnkgYmFuayBhbGxvY2F0ZWQgd2l0aCB0aGUNCj4+Pj4gY29y
cmVzcG9uZGluZyBzaG1faWQsIGhhbmRsZV9zaGFyZWRfbWVtX2JhbmsgaXMgY2FsbGVkIGFuZCB0
aGUgbWFwcGluZw0KPj4+PiBhcmUgZG9uZS4NCj4+Pj4gDQo+Pj4+IFNpZ25lZC1vZmYtYnk6IEx1
Y2EgRmFuY2VsbHUgPGx1Y2EuZmFuY2VsbHVAYXJtLmNvbT4NCj4+PiANCj4+PiBJIHRlc3RlZCB0
aGlzIHBhdGNoIGFuZCBpdCByZXN1bHRlZCBpbiBhc3NlcnRpb246DQo+Pj4gQXNzZXJ0aW9uICdz
IDw9IGUnIGZhaWxlZCBhdCBjb21tb24vcmFuZ2VzZXQuYzoxODkNCj4+PiANCj4+PiBJIGNoZWNr
ZWQgYW5kIGluIGZpbmRfdW5hbGxvY2F0ZWRfbWVtb3J5KCksIGdpdmVuIHRoYXQgc3RhcnQgaXMg
fjBVTCAoaG9zdCBhZGRyZXNzIG5vdCBwcm92aWRlZCksDQo+Pj4gc3RhcnQgKyBzaXplIHdvdWxk
IG92ZXJmbG93LiBEaWQgeW91IHRlc3QgdGhpcyBwYXRjaD8NCj4+IA0KPj4gSGkgTWljaGFsLA0K
Pj4gDQo+PiBNbW0gSeKAmW0gdGVzdGluZyB3aXRoIGEgZG9tMGxlc3Mgc2V0dXAsIHdpdGhvdXQg
ZG9tMCwgSSB0aGluayBJIG1pc3NlZCB0aGF0IHBhcnQgYmVjYXVzZSBteSBndWVzdHMgZG9lc27i
gJl0IGhhdmUNCj4+IHRoZSBoeXBlcnZpc29yIG5vZGUgKGVuaGFuY2VkKSwgc29ycnkgYWJvdXQg
dGhhdCwgSeKAmWxsIHRlc3QgdXNpbmcgeW91ciBzZXR1cCwgY2FuIHlvdSBjb25maXJtIHdoYXQg
YXJlIHlvdSB1c2luZz8NCj4gSSBoYXZlIHRoZXNlIFFlbXUgdGVzdHMgKHdpdGggYW5kIHdpdGhv
dXQgU01NVSk6DQo+IC0gc2htZW0gYmV0d2VlbiBkb21VMSBhbmQgZG9tVTIgd2l0aC93aXRob3V0
IGhvc3QgYWRkcmVzcyBwcm92aWRlZCAob3duZXIgZG9tSU8gb3IgZG9tVTEpDQoNCk9rLCBJIHRl
c3RlZCB0aGlzIG9uZSwgYnV0IHdpdGhvdXQgZW5oYW5jZWQgZG9tVXMNCg0KPiAtIHNobWVtIGJl
dHdlZW4gZG9tMCBhbmQgZG9tVTEgd2l0aC93aXRob3V0IGhvc3QgYWRkcmVzcyBwcm92aWRlZCAo
b3duZXIgZG9tSU8gb3IgZG9tMCkNCg0KSeKAmW0gbWlzc2luZyB0aGlzIG9uZSwgSeKAmWxsIGNo
ZWNrIGV2ZXJ5d2hlcmUgd2hlcmUgYm9vdGluZm9fZ2V0X3NobWVtKCkgaXMgdXNlZCwgc29ycnkg
Zm9yIHRoZSBvdmVyc2lnaHQgDQoNCj4gDQo+IEJUVy4gV2hhdCB3YXMgdGhlIGNvbmNsdXNpb24g
YWJvdXQgdGhlIGlzc3VlIGlmIHNobWVtIHJlZ2lvbiBjbGFzaGVzIHdpdGggUkFNIGFsbG9jYXRl
ZCBmb3IgMToxIGRvbVUgZS5nLiBkb20wLg0KPiBBY2NpZGVudGFsbHksIEkgZW5kIHVwIHdpdGgg
YSBjb25maWd1cmF0aW9uIHdoZXJlIFhlbiBhbGxvY2F0ZWQgZm9yIGRvbTAgYSByZWdpb24gb2Yg
UkFNIGNsYXNoaW5nIHdpdGggbXkgc2htZW0gcmVnaW9uLg0KDQpTbyB0aGUgY29uY2x1c2lvbiBp
cyB0aGF0IHdlIHNob3VsZCBub3QgaGF2ZSB0aGlzIGNvbmZpZ3VyYXRpb24sIGJ1dCBhdCB0aGUg
bW9tZW50IHRoZXJlIGlzIGEgdGVjaCBkZWJ0IGJlY2F1c2UgdG8gZW5mb3JjZSB0aGUNCmNoZWNr
IHdlIHNob3VsZCBkbyBzb21lIHdvcmsgYXJvdW5kIHRoZSBwMm0gYXMgSnVsaWVuIHN1Z2dlc3Rl
ZCwgYnV0IGl04oCZcyBub3QgdHJpdmlhbCBiZWNhdXNlIHNlZW1zIHRoYXQgc29tZSBoeXBlciBj
YWxscw0KYXJlIGN1cnJlbnRseSByZWxheWluZyBvbiBvdmVyd3JpdGluZyB0aGUgbWFwcGluZ3Mu
DQoNCg0KPiANCj4gfk1pY2hhbA0KDQo=

