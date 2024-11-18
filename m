Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10FAA9D0BAA
	for <lists+xen-devel@lfdr.de>; Mon, 18 Nov 2024 10:28:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.839194.1255009 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tCy3G-000193-8m; Mon, 18 Nov 2024 09:28:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 839194.1255009; Mon, 18 Nov 2024 09:28:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tCy3G-00016a-5y; Mon, 18 Nov 2024 09:28:10 +0000
Received: by outflank-mailman (input) for mailman id 839194;
 Mon, 18 Nov 2024 09:28:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=91/F=SN=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1tCy3E-00016Q-Pz
 for xen-devel@lists.xenproject.org; Mon, 18 Nov 2024 09:28:08 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on2060d.outbound.protection.outlook.com
 [2a01:111:f403:260c::60d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 69781fd0-a58f-11ef-a0c8-8be0dac302b0;
 Mon, 18 Nov 2024 10:28:04 +0100 (CET)
Received: from DB7PR05CA0063.eurprd05.prod.outlook.com (2603:10a6:10:2e::40)
 by DB9PR08MB9443.eurprd08.prod.outlook.com (2603:10a6:10:45b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23; Mon, 18 Nov
 2024 09:27:59 +0000
Received: from DU6PEPF0000B61E.eurprd02.prod.outlook.com
 (2603:10a6:10:2e:cafe::78) by DB7PR05CA0063.outlook.office365.com
 (2603:10a6:10:2e::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.22 via Frontend
 Transport; Mon, 18 Nov 2024 09:27:59 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU6PEPF0000B61E.mail.protection.outlook.com (10.167.8.133) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8158.14
 via Frontend Transport; Mon, 18 Nov 2024 09:27:58 +0000
Received: ("Tessian outbound 70f2252b2aaa:v490");
 Mon, 18 Nov 2024 09:27:57 +0000
Received: from L685e0a3d5116.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4A8E8D8B-1546-45FD-A67F-02BCDECD5BDE.1; 
 Mon, 18 Nov 2024 09:27:47 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L685e0a3d5116.2 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 18 Nov 2024 09:27:46 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com (2603:10a6:10:1a6::21)
 by DU0PR08MB9321.eurprd08.prod.outlook.com (2603:10a6:10:41c::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.21; Mon, 18 Nov
 2024 09:27:43 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632]) by DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632%5]) with mapi id 15.20.8158.023; Mon, 18 Nov 2024
 09:27:43 +0000
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
X-Inumbo-ID: 69781fd0-a58f-11ef-a0c8-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjYwYzo6NjBkIiwiaGVsbyI6IkVVUjAzLVZJMS1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjY5NzgxZmQwLWE1OGYtMTFlZi1hMGM4LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxOTIyMDg0LjU4Mjk4OCwic2VuZGVyIjoibHVjYS5mYW5jZWxsdUBhcm0uY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=w9wyMP99Juit6KvdP+DNJ/Nm9qaTLYzmADjRm+JOeaTnN2TLE1nEGtABonziBcOWEWv2kFljdl7mJUc1JQ6Y6xAGKuyj2ofm4e0V9mhlkY/bIqi0MfBdXeJ+2fOF27acHf0O49VcU6AJGmCXQXk58u+JsPckDody8JF8WkZaQBwB/erH6tS+Zkd2REvlDI52NihOBQAjQ6CEICMDAEOwNou7GO29WydEpdZg+YpdM9kqAgte2uSEsaboRgUyeOYL7ZKFOyvOGXmZKec3bLsusIT8hVP3v5esX1KhCMNGGyCPpTjnATAXy5D+TMDR3MaxJPTaZ2CqgAq1zChlcYF+zQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l0oLy9dmSiRMZjrhCGjCbaX76T82uwBQA0SOrJp3Uxw=;
 b=iWhpvorJ5z4wR3RGRrWD/UA9FPv/zD3h5waRiKjhHEkedquVjpr4sg1BYoRYcAT0Gra1TRqTCZdpYRK+y7ap2sztnDzM/x4YppVW/6T67lLOgw25C9ZyzaepWJomjIBxcRv7rV4YQjY5/ROjp+m0SUgwGJNj8VR5CNRITiTduU4W0+Pn7KjwtPCEYTkz/ox08PfRdIV9Bhfl40IT43Cb8Toi3r6GZ54pAYbv9InW0pKMdkkSW+ZueV2yq/6L1WLmXdVOroqgPfJKy0KNiH413txsQr/6wJjD2kAQ7UjdAtGNiquGNP3qCgv8XHGdota0RhU7W5+LRMR9Gjwq6T+nzw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l0oLy9dmSiRMZjrhCGjCbaX76T82uwBQA0SOrJp3Uxw=;
 b=cqu97zmRj1g+BWvhATCIJJEA5MtOM9LLBkFvM0AvcgBTq/puAJ3GQgCyEURTFFaoXZnkMwpfcdLe6CtHG7yaQ7wWr42vZKWmPVTDVCXjy3bZC9WjnUxUFmmuLiFWfpnmpeeNrlV03G4J37e7VSF5jfmM6E+ceJtd/Qv45I/lx8E=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 204694def4ebc5b9
X-TessianGatewayMetadata: Is22aFVKgsfH7KnFVjJc7jLf1NFzUEMIx42lgB5JdgQdPM48sqwp6w9rW/JSmTnJPbXzZlUzWNchR2XhUACdCH4XzZger/ww0X1O1VYbT3kEte83aERyZNSnwT/9BLOfbZrM5M4dpd1tQJop2m7gpyYo4vf9Lnb1I3MskvWnzgE=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yxCv2TuyERX5nO3Mv4sHhNrfEM0PEvWNfeXDFSm+eHCAwBHi3xU6Q+VIeE5PXkvpAN6L+Yowv8G9d9LXuHs36sAiSzhuRKlJE2mQaBjnKro/w59KlrRkxuJ24AJGE/Vzb9X+y8JxuPKetQlluXc1CUNLxMF36fFkhYZ4xHT8+uECnVRysfp3QJP2Vf8UbJcHBOg/V3wPtR/exCpfAWDqx1phmNM8X6ryRATJpR19v5ddgiLWxpWvhSeRl2aMGY3LWWuCeD9AqjuLHxAHfrPIclaa+pyU1Q+ZJ6IFTPf/skxRjRWbACWT2GuNkgowLsZg8mMhdro/hgrPjMtynxLyTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l0oLy9dmSiRMZjrhCGjCbaX76T82uwBQA0SOrJp3Uxw=;
 b=RUnGxbT+Hpnd5b0kgB1SZ9gOZTYGpcV1zyS+bzByzFeZ1n5Z9IBrg9eo+IpwqIQe0WCRFcDcH795AEYhQQnwSs88+ut6hDb3Zc999SMpFvQuHkqwZDQk8gdrv0T6xTCbq/kQD/kVCoonFWyzYhjmG0EI3l7x44+k9ziyKwmanPK85tV3Lg/WzZQbInMymskOIUMEwFhQgOnuv6UQ7yRwluu56wBY8BiQyqIgKej6ZiOYGFQcNMRcdA+ETLO+V92ktaqhoVh/8tZkNqVaZvbF+wWxdamtBiG1M33w57RfoN3rv+jr9S1Xaft50jt8i494oGZQOOC7U2c5ryVMjHM21Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l0oLy9dmSiRMZjrhCGjCbaX76T82uwBQA0SOrJp3Uxw=;
 b=cqu97zmRj1g+BWvhATCIJJEA5MtOM9LLBkFvM0AvcgBTq/puAJ3GQgCyEURTFFaoXZnkMwpfcdLe6CtHG7yaQ7wWr42vZKWmPVTDVCXjy3bZC9WjnUxUFmmuLiFWfpnmpeeNrlV03G4J37e7VSF5jfmM6E+ceJtd/Qv45I/lx8E=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Penny
 Zheng <Penny.Zheng@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 3/5] xen/arm: only map the init text section RW in
 free_init_memory
Thread-Topic: [PATCH 3/5] xen/arm: only map the init text section RW in
 free_init_memory
Thread-Index: AQHbN0xG58VLgb/dzkerHg/RLPURhLK7xh0AgAEDYgA=
Date: Mon, 18 Nov 2024 09:27:42 +0000
Message-ID: <92C19900-8AA7-460A-A7B6-5FAF533029D3@arm.com>
References: <20241115105036.218418-1-luca.fancellu@arm.com>
 <20241115105036.218418-4-luca.fancellu@arm.com>
 <6fd84b4e-be73-4d02-8214-32c7ebb09b3d@xen.org>
In-Reply-To: <6fd84b4e-be73-4d02-8214-32c7ebb09b3d@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.200.121)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DBAPR08MB5798:EE_|DU0PR08MB9321:EE_|DU6PEPF0000B61E:EE_|DB9PR08MB9443:EE_
X-MS-Office365-Filtering-Correlation-Id: 4047bfd7-3501-4d49-3526-08dd07b34a3d
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?QUxjSEVqUXpYVHVtcFR0cDVsOVNDclBOakFOQzBYRGVvQi9qTXlkSGRLT3F0?=
 =?utf-8?B?OXUzOFloNkRuWE82dVUzSmtqMkE2NWVjdktYUm9kOHprTXVJeGcvdjAvbHp5?=
 =?utf-8?B?WWJ5WHhWTGowOGsvSU5yQXAvc1Y4aXdtM0xmcFlCZDRvYlRZNk9jLzhuSzNC?=
 =?utf-8?B?QmtrOTAxcDA3S3FaU0dUa1B3aENyM2krWkVxemNrckZmTloyUVNQWEd0Qjdi?=
 =?utf-8?B?YWtnSS9aODlJTmxtWnFvUHRkR0E3WXJjbDZ3S3hFdEVFL3psS0trSHhNK3Ev?=
 =?utf-8?B?UUdwMFhXR1U0U1lSK2hObWVJTUZWY3NwKzIwTHJ2aUp2UzZZVU9USVg1MWxM?=
 =?utf-8?B?Y1UxMC8xWVZZa0doYkwxQ3FYWEJ5NWVabEJVSXdWM05Ud1dGSEp1djNDRzNm?=
 =?utf-8?B?bWhmVDV0YVNmTStodkhBbWZMQ09yYlYyYWJsUE1rVXMyMXFGUWxNb2Vkak1I?=
 =?utf-8?B?VXA2dlhxV1l3cjc0WmYrSDlZY3hQcklqakhsUWZ6Wm1ndnFIWE9VVFo4SFNS?=
 =?utf-8?B?S1Q5VTJ4MWVrRnp3VkE0czRWenc4b0EzaTJkcjNncTYrTVloeWtlMTJaTTMx?=
 =?utf-8?B?MHc0NnVmNWEwMkNoTTM4YlhmNjJvMHJwb2I0YmwweGR1T21GZGFWQXdTTW1X?=
 =?utf-8?B?eGt5Qms2elp2L3E4cmxSU21GakJ3QUdwOENVY1Y4YWZRcW9rOGEvWXE3QnEv?=
 =?utf-8?B?S2VxUnM2TktXUVBvay80bmlPbm9nL3ZrNUVtQ0c4cDhPNzYyWDN0WFVQODc2?=
 =?utf-8?B?TVNXSlJhTlp2RDlFQWl1T3Z2WUIrY2ZLVnFWVng0bEhDbDhxTFI0emtCMTRi?=
 =?utf-8?B?U0t6N0N3UW9LT3AxYTNua0FGYjArdkJMQUJmVWMyVXhCUXQ0Vi82cjFHNGRm?=
 =?utf-8?B?RFVTYkhQWTN5N3dNblZZcXREaXdveGdFYkVxdGszZGh2ajZrRkNzdWJOWUVk?=
 =?utf-8?B?eDRxS1pYbFA0bDdLM1lBRXRkSk55QTlvKzVaSFNCdHd0KzJpTVlQMXpycVVB?=
 =?utf-8?B?RjBIZWEvWEsrWHlOaWpoc1gyQnM1b00wempob0dIeWFWNGZyc3lUb0FOamxp?=
 =?utf-8?B?VE9vcVg0ZlhZWXIzUWhnM3NoTlYrRHl6ejdoQmVjUTZqQ1hMN0Z0cVVlWnFE?=
 =?utf-8?B?ZDZoLzd2VTNtQ1c3SzhSMm1nbXBrTnBKbWNEYkw2TndyNktMTnZKR0VYdUVO?=
 =?utf-8?B?SXpVcmJ0Rk5yUk9MT0s3a2VEU0pYemQ4dlVvcDFyeGFKREt6REt0Wmg5RHpM?=
 =?utf-8?B?aWl6czNQakF0TjJCeE9xeDMvRHcxZ1loYitmU1RvQmc4NkZ2MWxvZTZHaEtJ?=
 =?utf-8?B?OHBwVkdRRDdkQVRCeWgwYmpuc3ZTU1RqNFpUcnZrMXBkNTM2ZU1CV0xMWjNS?=
 =?utf-8?B?eVR6aGd3OThXWTAwUDZET040dUdCVEhmZTZVRUlnei9SR09vNEwzNnBKWmxD?=
 =?utf-8?B?QzlvcVNiWUNLMjFtZzdFRDJLa2FZaVNVY1hzeE51TUFHRklXL3c0K21XOXBQ?=
 =?utf-8?B?bm41dzB4SERuUzRWZFNoZDhsNzdweTNKY253QlpEVUVFNWdOeGpwalQwZHpE?=
 =?utf-8?B?cU5GMVRwUDFBTENvTmk0bDh1RmhJOEN3MGpEdkVGVURJaklsRDFwSWQ5YTFH?=
 =?utf-8?B?a2VGTDQvY0ZHVTFGU1NaL0hYekkxM1JQUXB4SE1zdTJkRHJvYmJTcUd3N05x?=
 =?utf-8?B?b2xYcjFieXBxQnVRNjhwdVpVcjZPSTV5bzFrQ1B1WjNVam01ZXI0S2NabWh3?=
 =?utf-8?B?NzBzWVQxS1g5V0hSbFFLcGJzRnlKMmVGelRKL1hiTFlteGd6cUFXc2VISjc2?=
 =?utf-8?Q?3RknzOXNh/KUjIMOJUoWJ9G3/uAgL8LFxxsCU=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5798.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <BE52124B82A70F4784BC277E5A96ECB4@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9321
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:1a6::21];domain=DBAPR08MB5798.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF0000B61E.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	1ca9ca92-d5db-495e-9a6d-08dd07b34120
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026|35042699022|14060799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bWU3cnhKaEdXMjFQRURNMFFOY29vcXVINkNoVWh3ek1SRk82bTJ6YlJHWkVx?=
 =?utf-8?B?RWozNE9jYmkvOWFkZFNkSVp2ekx1MHBFS3U0eWsxQ3dSZEhWMldjRTF1L01F?=
 =?utf-8?B?enhpTTVIQkM1Ynl3bVVVeWVJMFB2TWhsTTF2ZTI4TkJaM3QwbGU2dGptM0xk?=
 =?utf-8?B?TUJjOTlHNFY1NmRuY2RqVklRcDR3VWQ0KzJRZytvNHp2RFp4WnBuZGdSbzd5?=
 =?utf-8?B?WXg4eTQ5TkZLREd2R1YyK2EwKytwYnRndDJyVU9IWUE4RytHa2haeEFrb0xY?=
 =?utf-8?B?aVRRWmdjY25GUmR0TW1GUWdhSmdwNXk1SllIS0Y1NVN0Q2NyY0FXNGNnSlB0?=
 =?utf-8?B?Qm5kOFkyc2xsdmo1b1NEQmtaM1UzVHlPcHRSTUUxMzBwZnJURTZ5OWZXYmVG?=
 =?utf-8?B?RlVqWHdHZ3hNVWVuUTFjSGR3VmwwOXZwT2NkcEp2dEFPUFkva3A2OXhUMGRF?=
 =?utf-8?B?NmUzYTBpTFlBRW1LVDJaanJyVjVTTmdaT2ZHSFJOVnpKVzhyWEJrMEx3TXRi?=
 =?utf-8?B?SEs4YXZabGpPc2Q0VmQ3TUIyeDVHY0ZHZFY5aGpJdUpzL2lZU2pXVnI1QkNJ?=
 =?utf-8?B?Z1o3WHplU1RHR1J4dmVDdytsWGRxMEdxamFjenI4bGJBbXhCTDh2SG8ydG9H?=
 =?utf-8?B?c2hLMm1qcTJhaFZnSGd6NG5pckV0VDR1ZlBaM0swUHlZdHpqeUJDczQ4ZUY0?=
 =?utf-8?B?ZGRqRCthTnBQU0c2N3lRbElsY3E0UCtFRVRzdUlDWE1MYnNQY0M2WG5ISGtk?=
 =?utf-8?B?TnBPM1R5ZUIyWU1leWJCUE4yVlptcGoyTzYrdTlZMm40MmlEZ3Z2RjdpYnp2?=
 =?utf-8?B?NHhqd1M0eDJRQ0xPVVViZnA3STVtSkRxay82OWtJT2hwYXVMUGpJZWcvRFRJ?=
 =?utf-8?B?WkY3ajRMS1lJMEZSRlJRR0VmRDVBTS8vSC94Yy83RnlvMXpWSVNZQVByVk9p?=
 =?utf-8?B?MmNSb21PYlcxS1E4WGJmN2wxdDRZa0RVTXB2WUZ3U1NmYmx2LzB6aE1SWmIw?=
 =?utf-8?B?TVlpaTFFVEhXc2RIRjExVW10UUpxeU0xUkRSUDhvU0VBcXhCWTd1OW9Qd0JL?=
 =?utf-8?B?R3JvbVY3YlZXVVpjZFJYd0F6dWV1VTJNR3hvZ3dhY3VjNW1mdU5HM0NKNWwy?=
 =?utf-8?B?LzlzZWJxK2RKWnVXZmpOU25ZbU9DUjR0Q1M4SnZVaGRzSldVaW1jZ1l3VXFi?=
 =?utf-8?B?NGdibWkwUWR3YnpmcHhZOFdEQnowT0tYa0hFbmFxL1JHSzBDRmJHdHR0ejRP?=
 =?utf-8?B?M2Z4UWxrUzMwMDJaL3FuL3E5MTZzV3EzWWdSSGFwRXRpOGFvekJ6dGJwYk5V?=
 =?utf-8?B?dnoxTmxrS0xtM3l0YUxlYVRQWlNERHZiY1VVemx6MmVUby9hOWp3dENzV3FJ?=
 =?utf-8?B?R2hsdmhGRHpKdEVuanUza2t2N1hoM2piTjN3YVlISjNFVHZVNHJHRjBxTXY2?=
 =?utf-8?B?L0dvbXd2TDVsOU5tWTBrdk4yOTBWOW9iOHZ4NHRPMlVGdExtYm5lQUxEbmRH?=
 =?utf-8?B?N0c1azZSQzYrNXdnMDdwa1c5SmRyRzVycUV2YnJ0ZEFxbWNOeUtMOFFianFi?=
 =?utf-8?B?YzlxY0RjQjN3UUJGUjJqWHdwVlo2SFprQnc3TFdyUXlhYmxtQUlnMWovTlRl?=
 =?utf-8?B?cXdlQTdZMFBGU1dWeUd2dEdVeGJwUUs1MWxzckxBeTk2NDY2dDF0WjhKZU9V?=
 =?utf-8?B?dTQydVovK002bk5keTlXQW5xNFEzWDFGV043NVA2VWxLajBFTzJCc0xWMjZK?=
 =?utf-8?B?MS9qcmxDTVhaZUphU0hPeVFBUW1PYjZaSnVnTkxPeGR3WWZmc0FQdWc5Rkow?=
 =?utf-8?B?ZkVEQlVDSGhGb0hmUE9PeE9Sc1piS05SUzFuY29NM1hEaVMwNFcvUVJOUVRX?=
 =?utf-8?B?blAya3lEUEVOS0Z5aGtsOE9NdnB1b1FiVHUzbVdJRkgvSXc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026)(35042699022)(14060799003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2024 09:27:58.2544
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4047bfd7-3501-4d49-3526-08dd07b34a3d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000B61E.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9443

SGkgSnVsaWVuLA0KDQo+IE9uIDE3IE5vdiAyMDI0LCBhdCAxNzo1OCwgSnVsaWVuIEdyYWxsIDxq
dWxpZW5AeGVuLm9yZz4gd3JvdGU6DQo+IA0KPiBIaSBMdWNhLA0KPiANCj4gT24gMTUvMTEvMjAy
NCAxMDo1MCwgTHVjYSBGYW5jZWxsdSB3cm90ZToNCj4+IEZyb206IFBlbm55IFpoZW5nIDxQZW5u
eS5aaGVuZ0Bhcm0uY29tPg0KPj4gSW4gZnJlZV9pbml0X21lbW9yeSwgd2UgZG8gbm90IG5lZWQg
dG8gbWFwIHRoZSB3aG9sZSBpbml0IHNlY3Rpb24gUlcsDQo+PiBhcyBvbmx5IGluaXQgdGV4dCBz
ZWN0aW9uIGlzIG1hcHBlZCBSTyBpbiBib290IHRpbWUuDQo+IA0KPiBTbyBvcmlnaW5hbGx5LCB0
aGlzIHdhcyBkb25lIGJlY2F1c2UgdGhlIGZ1bmN0aW9uIHdhcyBnZW5lcmljLiBCdXQgbm93IHRo
aXMgaXMgTU1VIHNwZWNpZmljLCB3ZSBkb24ndCByZWFsbHkgZ2FpbiB0aGF0IG11Y2ggZHVyaW5n
IGJvb3QgYnV0IHdpbGwgaW1wYWlyIGFueSB3b3JrIHRoYXQgd291bGQgcmVzdHJpY3Qgc29tZSBp
bml0IGZ1cnRoZXIgKGZvciBpbnN0YW5jZSAuaW5pdC5yb2RhdGEgY291bGQgYmUgUk8pLiBTbyBp
cyBpdCBhY3R1YWxseSB3b3J0aCBpdD8NCg0KUHJvYmFibHkgbm90LCBJ4oCZbGwgZHJvcCB0aGlz
IG9uZS4NCg0KPiANCj4+IFNpZ25lZC1vZmYtYnk6IEx1Y2EgRmFuY2VsbHUgPGx1Y2EuZmFuY2Vs
bHVAYXJtLmNvbT4NCj4gDQo+IEdpdmVuIHRoZSBsaW5rIGJlbG93LCB3aHkgYXJlIFBlbm55IGFu
ZCBXZWkncyBzaWduZWQtb2ZmLWJ5IGFyZSBtaXNzaW5nPw0KDQpJbnRlcm5hbCBwb2xpY3ksIGF1
dGhvcnNoaXAgaXMgcHJlc2VydmVkIHRob3VnaC4NCg0KQ2hlZXJzLA0KTHVjYQ0KDQo=

