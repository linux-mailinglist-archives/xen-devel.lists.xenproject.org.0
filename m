Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8634E9A9EC7
	for <lists+xen-devel@lfdr.de>; Tue, 22 Oct 2024 11:42:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.824061.1238146 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3BOK-0007rz-Sb; Tue, 22 Oct 2024 09:41:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 824061.1238146; Tue, 22 Oct 2024 09:41:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3BOK-0007p3-PT; Tue, 22 Oct 2024 09:41:28 +0000
Received: by outflank-mailman (input) for mailman id 824061;
 Tue, 22 Oct 2024 09:41:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tTvi=RS=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1t3BOJ-0007ox-5W
 for xen-devel@lists.xenproject.org; Tue, 22 Oct 2024 09:41:27 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2061d.outbound.protection.outlook.com
 [2a01:111:f403:2614::61d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cdc070ec-9059-11ef-a0be-8be0dac302b0;
 Tue, 22 Oct 2024 11:41:25 +0200 (CEST)
Received: from AS4P190CA0004.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:5de::10)
 by VI1PR08MB10244.eurprd08.prod.outlook.com (2603:10a6:800:1bd::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.20; Tue, 22 Oct
 2024 09:41:17 +0000
Received: from AM4PEPF00027A66.eurprd04.prod.outlook.com
 (2603:10a6:20b:5de:cafe::ec) by AS4P190CA0004.outlook.office365.com
 (2603:10a6:20b:5de::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.16 via Frontend
 Transport; Tue, 22 Oct 2024 09:41:17 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM4PEPF00027A66.mail.protection.outlook.com (10.167.16.91) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8093.14
 via Frontend Transport; Tue, 22 Oct 2024 09:41:16 +0000
Received: ("Tessian outbound 60a4253641a2:v473");
 Tue, 22 Oct 2024 09:41:15 +0000
Received: from Lee0e0fd7ce08.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 EB519613-64FD-4640-AD92-179E2E2AA889.1; 
 Tue, 22 Oct 2024 09:41:06 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Lee0e0fd7ce08.2 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 22 Oct 2024 09:41:06 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com (2603:10a6:10:1a6::21)
 by AS4PR08MB7711.eurprd08.prod.outlook.com (2603:10a6:20b:512::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Tue, 22 Oct
 2024 09:41:02 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632]) by DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632%6]) with mapi id 15.20.8069.027; Tue, 22 Oct 2024
 09:41:02 +0000
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
X-Inumbo-ID: cdc070ec-9059-11ef-a0be-8be0dac302b0
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=fezVyDcUNc41b7XeNJn1q5yb5g3OBmBXSwMyKNAy1lHMSuusvL0VGrAnCD4KTH4dVprTUri1QB7x53rDOJKdF87g1pqMIbHU68kUHnzwrNpi+UpICIONlvg/QRAlVaPvBp2FGfXp9WsTKH+gzNMYG8w87EUUsyD5EeyRx5sNdp9jgzJbQJAV8mFPlGrskrfeQvHx01z0wiOpbaf79n0GX/O/lHb3RfTBrx5eidF3K/debgJepUDE+r1V3rgex1vYyx91MFvC+1dlFWXKz9Zk3N3BAvFTJR6+JmXHkhOQ1mH6bziPVk+uFXql0NYamby/njD+X7O+0mLy60BEAQwbdQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HarXrckkJaLj21h4AuSMkcradpaBEuoWuIiL4YAfb5c=;
 b=tlpXabY8br49meZP+usLzHc3vBDP77BsZGFMu0dzQPlreyd9y7+dc6gsBobZCRVsCB3LTf1XE+1slNxUhqvcOyaKtrNviFJykerOL9zJdCLtIZ1H08jwr6ez3XZv9ePBj/iJfHzfjKPHs1KhB5BPMuwkoVPNT1JsbheEkaE/5nFvBCl/XIpO52n/4V3RbxnRjjD7FeMW6LgpL95NcbKLb2W6UEBCLiBy4YIrBB7F54Z1NNNJCAAivzzXRYbeuhmvuwOu0fKSjlW9lmfwfHKcaM0H1H9/OaLGKFwwD1VghOljmkMevPkldG1nH6TlkFzbMeEDOaKe/7FwPN/KZgsTSQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HarXrckkJaLj21h4AuSMkcradpaBEuoWuIiL4YAfb5c=;
 b=ojY/w8EEWxgWw/lYJqbDyOPeZJGgg9Z/DpqR8mEviISgBvvJ1MiFdV5tteRvWdsUgO5/EVJiFYzITYujiAfI3Eiyx3cbrnfr+HNw1ypEh/QDMDePi3xAX6sUSAwej3vLM9u21WWsUEeZR/wioojiXl5WjqB8jSh6RZa4bIK5JZ4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: f310c73c1b09954e
X-TessianGatewayMetadata: twgCD9/r73dLx9Ren9HSZn3OQk+lEMW8ZhEdgOsehd4bgNM8+UBbuPnoZPG8hI/qdDei5lbTu5GgvzVO9t+HlQwenVtZV97R6l8rqF22wTQoI7xaIo8O2ds6fKcrgr7XVAJIc21IuachVOCO/4/W2rR2Sh9aZNA7RQrOsxVjdtE=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H/lDVxSvCOfezrox6QXfDP4RAHPwREps8Pe9bjWP/2k4+YI1faC6nSc4rumO3p9mBeZTQtwrboR/Wf2zI6BPflzZ8t8tGplnd+rJV+hvkvp6C18O7RjsUbWgpZmJtElq7C1Kch88+g7E5vkrCAk5B2c3NO3J1woebzecuJ+4lIWJpykQQwmX2iAmRvOLKJN1oNBPJFyKR6XkILl1/eVWbPvxUK5LFkkpb0VG9o9rTPPl7DNrqEVghcSxFRJ3yrgCp272OE6ztSZFt7sK7/z838BllgxdXeMKo2rsqkcsfp+S2NnZkDEaYIKw+rLrKJeqVnhkuBz8jD/jRHPJShwYHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HarXrckkJaLj21h4AuSMkcradpaBEuoWuIiL4YAfb5c=;
 b=uzyLw6NFKll0kdZuxO3wWyNP0CjqpP2htHhIDwu0k9M77S7Dou375EM6CI5LeDZyngWKUgSqK2FkaNslvQJERXOk9dOTjbL8Qz2T2lqUAIbDChjc8vtwPq/vbuJ47WceFU5fapTOT5W8P7IIitaGigLZXQOwLASl4TrOreJf2V9SpegOsh1e9DnM6rsn+Ac+r4C3r+tnoRYI96SYtzRLnqyP7jlwqfGHYw21U8OJUcNdYizjmcBDZVdmoildLiIEoCKZCaSfYz9qENP0YQhhZQ5VN0cdUEY5Xwrlf6WvjlrIs7EbSU/3DN48EAhG8ZlUsUWUjIV21+MgDqPkUNrmIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HarXrckkJaLj21h4AuSMkcradpaBEuoWuIiL4YAfb5c=;
 b=ojY/w8EEWxgWw/lYJqbDyOPeZJGgg9Z/DpqR8mEviISgBvvJ1MiFdV5tteRvWdsUgO5/EVJiFYzITYujiAfI3Eiyx3cbrnfr+HNw1ypEh/QDMDePi3xAX6sUSAwej3vLM9u21WWsUEeZR/wioojiXl5WjqB8jSh6RZa4bIK5JZ4=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Julien Grall <julien@xen.org>
CC: Ayan Kumar Halder <ayankuma@amd.com>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 5/6] xen/arm: mpu: Enable MPU
Thread-Topic: [PATCH v3 5/6] xen/arm: mpu: Enable MPU
Thread-Index: AQHbGx2Ge9N55hTx/U2iD9lYiTVQprKNIysAgARC6gCAAA8agIAAAOKAgAEgqoA=
Date: Tue, 22 Oct 2024 09:41:02 +0000
Message-ID: <A302D615-E25E-46DE-A4CA-4FF911293D83@arm.com>
References: <20241010140351.309922-1-ayan.kumar.halder@amd.com>
 <20241010140351.309922-6-ayan.kumar.halder@amd.com>
 <a6a66bd1-45dc-46d2-9e45-8fef8b45e003@xen.org>
 <23b86010-d467-42fd-bba0-65b58e05beaf@amd.com>
 <DEE00B97-ADA5-4229-9B41-571C38F7A6C5@arm.com>
 <f444f549-6f4e-494b-af85-aeec127722c4@xen.org>
In-Reply-To: <f444f549-6f4e-494b-af85-aeec127722c4@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3818.100.11.1.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DBAPR08MB5798:EE_|AS4PR08MB7711:EE_|AM4PEPF00027A66:EE_|VI1PR08MB10244:EE_
X-MS-Office365-Filtering-Correlation-Id: 95c79676-1a07-4a35-72d8-08dcf27daccc
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?Q2trYVF5dUc3bGo5QzJLclBlaGhUVXBQc1dBRTcxRjJPVm03UVJteVVMbUYw?=
 =?utf-8?B?NkhLcnVsemI4VFFYb3JJempvWGRUNFlscVVBelJ4UTRMWDRMd0Y3Zmo0cFAx?=
 =?utf-8?B?cWxEdEs0VHRpRTdPc3U0SHRiQWx2d3RpMFBFdzRGTHhHOENiOXYrRGkvbFNq?=
 =?utf-8?B?MjRrY3Jyenk4RHFJclBnYlB1RjVxdDZzL29TOXp0QjlXT2xBeUl1WFNqTWx2?=
 =?utf-8?B?QXVaRXp6RWk5dEJUTExDM3J6OEw4S2tvcFBteDA3ZTM1ZGpaekNhQzBlaWhq?=
 =?utf-8?B?M1ZBYXBDaFdibWxZejZzbEp5MWdUZ1ZxRWhVblQ4Zk5QZkQ0NjlGU1lORzRv?=
 =?utf-8?B?L3NaWmlyeW0yQ0hTbkhpOGdhdGhBTk4rb0crM3BPUWZLUlBqNERqQTJGWCto?=
 =?utf-8?B?QUk4cHFTZ0Jxb0wyUUtoQ0JYNWlRMUphbmFOcE9KTW5HNUlHODVueGdmVnFZ?=
 =?utf-8?B?NC92V2hvc0FEQkN0cmE4YjlaeU5LejMyckxPVnNEYXVLNE9GdGtoVVIrN2Y0?=
 =?utf-8?B?aHArZWc0OVloZjV3VFFkMnFwREVqd0hIVzJCdWpMYkZ1YkM5cUpnMzYwZ1dN?=
 =?utf-8?B?ZjY5R2NmTWV5RVdQNkR1QWx2NzBtRCtQQ0Q3SDc3UE1ZTHRlcWYzdnZsSGxv?=
 =?utf-8?B?WlNlRnhBcFBBTndlbFNOdWxCQ0xUM2F6UFYyQ0RCblRiT2hYQnlERHIwK2I5?=
 =?utf-8?B?aTYyem51UEVwRlN0clQ5OGh2bHByQUpvbklkSXNPSTFVYVIwcXN4SUFVU0J2?=
 =?utf-8?B?bmFkcUU1OXY1V21BbmQyRmFUUVdsYm9kVTIra3ZiVlpVNGxSZ0dvMDlsWEFa?=
 =?utf-8?B?R2xLWlpyV012bHRUQjVxWFdBVzJwQ2krOEZvRWlaSWVKTjVDb1JBV053Q2ds?=
 =?utf-8?B?ckh3L3YxTVpoR090cDRHaEY2Qk5OYlFob0FCZ01SR2Q0S3JiQ1RPUlFZdllj?=
 =?utf-8?B?aFNDM2tYekxyc3c2WXcvRDlPTnlIZzBZVlUxaVUzMUIvbUpSWThuRlA0amxr?=
 =?utf-8?B?djdpZE1BYzArem1ubmU5M3ZzU1lxcXRxRmlrSjM0ZGpQbVRVdGpKQkxaQU16?=
 =?utf-8?B?MGEwMjNUcmZtaVJqM2tvQW95ZmE0VU9EcmZ5cUF1NC9abDk4N1pkM0dOUmI3?=
 =?utf-8?B?T3AyOGpjWXBqL1R6aWNnd2JJTzNtekhwUVRDNTV2ZE43dkRoZElJdUdpMTRu?=
 =?utf-8?B?cHUzR2lNa2dhV25rQ1c0bEcraTIraUlUVXVWZ2FlYVV3dkZaN2dqVWpqWXZL?=
 =?utf-8?B?b1o0NE5qYVBOUHFVWEhienIvV0VDYUFJYzBBdmp1THNMUEs0TTM4aFZTeVY2?=
 =?utf-8?B?RmRURGIzd3hQamVMS2ZySVY4ck9EZkZKYjhld1RxU3F0T0lPdTVDR1dIVksx?=
 =?utf-8?B?dndGamZJR0lCenZPY28rQ3N2aTh0TTRNMXBLZjhaTldRekRqeWkrZ1VlM1pW?=
 =?utf-8?B?QllOMGpEckltMkFOdS9oZzRBWkpiTy90YXZzN3pRT2QyOTNlOXhJczl5ZXNJ?=
 =?utf-8?B?VkdCeU51Yy9xUmVLOFp5MUxNN0dib1hTbmxxT3IrVnAwd1ZwZlROSncrUXo2?=
 =?utf-8?B?U2x2QWtiY1BrMnMyK29oTjdUNFg5R092Ly9jSWNtalMrcjYzQXBVeTBwcGZP?=
 =?utf-8?B?eVBqZWQ2eFZ5UWJNMWhXdElRZmdnajIxK0lBQ1dTZVdQUzhiQSs1OFdydVZj?=
 =?utf-8?B?VDlTbCtsdnlUVmt4TjdCTUkySUdGcjh5bENSbVlsdW5GL1IrZGtwdUkwZHFm?=
 =?utf-8?Q?3vRSYGvTWKCkp99E1ndFfkIik4pPO04Z/Hs9FqV?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5798.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <A024AD7529A25A47A6DAF3EF06C1EFF1@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7711
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:1a6::21];domain=DBAPR08MB5798.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00027A66.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	93d41fa7-9baa-4136-1204-08dcf27da48f
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|35042699022|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dE5pN0VqclV4NzUzR3ZxTDFxTWFPNGh3U3Q3SERiNnp3Zjc0bHRIVmVBcEF4?=
 =?utf-8?B?MDZUSmtUcTRBSVpyRFZiM2xmTHpJNUszOS9pSUNYNnJBWjBjMmVhcEllZFFp?=
 =?utf-8?B?TS9YelRyQTh2Vk1FTDBzYkZZKzYyc3A0ak1mREZWbEdyVDJKd3dNS2hwendQ?=
 =?utf-8?B?eWxkNkJYZHA2bmNzSSt2VU9ZeDdVK2NrRFlCbVpadFoya3ZsWE0vVDc5N1Vl?=
 =?utf-8?B?LzVkTTJUVlhWZG8rL0FmME8wNlkrbFNIbC81Tit5WXVSekdna2diVW5vZXdR?=
 =?utf-8?B?TS82Um5iZVNWeUdMRm8yNzVMYXRhc1NzVmdBUUhBUnZkSmdTbkVhRCtnQmow?=
 =?utf-8?B?bzR4OWRvbTFyT2M4aG50L1l5UzZ5MmJXandITHFiK1ZDaTNUT2d2ODd2QzNL?=
 =?utf-8?B?RXlZQXYwSmVlRUxRTXF1SkNRZ0lhMUJHZjBseXl5elVUaUJtbWo3VjRJcDF6?=
 =?utf-8?B?eHRVNjdkSjlqOGJwTnNYeUdmYjh6RHpiUHFvclBQVkRjZmZZWE5reUtKNjZq?=
 =?utf-8?B?WGtZdm5BNkYvYUpBcldraEljK0t6eDQrbFNzOFRvUDQ2dWJ4Z2xZUUNvdlV1?=
 =?utf-8?B?dENxdnp1ZXdIVmhsRFhBTUVNL0I3Zm94ZFhMVStLVDVZT25hdWNaTmozZ2wy?=
 =?utf-8?B?czVZSnVsODJLMjNpcmZNNlpjQ2NDQ2lvaEIwbG80dkEzRFQ3cGpHRXhYaWha?=
 =?utf-8?B?eEdpcEc3dXprdURzQWovVWtmbUlUbXBDWFg4dDhpQktITzlmaEpSQ3VIamxO?=
 =?utf-8?B?NnVSYnBOMjF3Q3owNjhYd2xPa0RqUENENnE4bnBtdzZaSUNJYU1tSy9YRzc1?=
 =?utf-8?B?S0hwRTVoalY3cXZYVXE0MDZBWS9tVk9pVnlORERaM1A0WTU5eHYrZGtNVm1U?=
 =?utf-8?B?NzRoYmEzMGdFU2ppcUZFbk1mdlh1QjJCRUNLQlI4d3VpOFBOYkk4OWlkT0d3?=
 =?utf-8?B?NEJZcUZvTERFU1Z0L2huZFhSK0diMkhxN1lCcFMyM0tZZmhZWEpTaXlmM3U1?=
 =?utf-8?B?U1VJYWtYcXhqVlVUUnU4RTQrQ2Z5cWxCcm9jZGlJcDZWd3hmei9ZSzFzWXJh?=
 =?utf-8?B?eUFoc09odURhRkpzWUkrUDZIOUV4WVRjYXNMZkRRcUx5bkk1NUpMUWRCMTNJ?=
 =?utf-8?B?Zjk1dG90SXlMT0ZPTDJBc2dTdDZlTVQrYkpUdzZiNEdNN1ZuQ1pBOTY0VHhk?=
 =?utf-8?B?WTFxbzJhWFZOQWJLVjk1MEZqWlUrRVFuRlhhZVdkUWU2TUx3dkg0blhvaVNk?=
 =?utf-8?B?UVAwemhqMUttam0vVHBvWmtBQnZuUTd5clVXSjhRVVJLa2l5Ky9MTitoY2hD?=
 =?utf-8?B?RXgwNkhybzJnc3J0VHB2WHRGS0ExaFdrdWlwRTN3L213bko4Y1YzSnVXV0tQ?=
 =?utf-8?B?QlRWeElmV2NXa0FIVUU4akNUbGl6SWhvM2JnUHFrVVFQd3F6MjJBTGplbGwr?=
 =?utf-8?B?QjROUVVSL2RTUnBVbWJCbit0a1NsblpuSGgyT0dPK0lHSnV2RnphcjVremUv?=
 =?utf-8?B?b2gxU0ZzaVdWbFAvenVTdk9IeFgwajl0aHJnekdqZkFnUzBzaTVjOFRCb0tC?=
 =?utf-8?B?dGJRRUl1SXhBN0RwSlNXQzN6RFBFRlI3a2s0MXJScWxZZTVHVkRFU2tqWWtI?=
 =?utf-8?B?cVhrMUtJYXdkZ0JZVVhGcDdweVZ5QlhTNG8wSThSbU9Ob3NhakRPTmNtY0Vr?=
 =?utf-8?B?RkVKd0JzRlBiYUFsTml2bkVNRVBRRWFIZVFvajV5K3NJSkc1RHdKT2tIQ29m?=
 =?utf-8?B?QlRjdDRJV2s0NzZJSkFrVHVPVFVhTlBDNkRVR2VSekh3M1hwS0R1Y2dBNGlz?=
 =?utf-8?Q?Al1VaVPSHzwORBW0zRVW5iuB+UgVwpdWumnww=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(1800799024)(35042699022)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2024 09:41:16.3057
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 95c79676-1a07-4a35-72d8-08dcf27daccc
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00027A66.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB10244

SGkgSnVsaWVuLA0KDQo+IE9uIDIxIE9jdCAyMDI0LCBhdCAxNzoyNywgSnVsaWVuIEdyYWxsIDxq
dWxpZW5AeGVuLm9yZz4gd3JvdGU6DQo+IA0KPiANCj4gDQo+IE9uIDIxLzEwLzIwMjQgMTc6MjQs
IEx1Y2EgRmFuY2VsbHUgd3JvdGU6DQo+PiBIaSBBeWFuLA0KPj4+Pj4gKyAqLw0KPj4+Pj4gK0ZV
TkNfTE9DQUwoZW5hYmxlX21wdSkNCj4+Pj4+ICsgICAgbXJzICAgeDAsIFNDVExSX0VMMg0KPj4+
Pj4gKyAgICBiaWMgICB4MCwgeDAsICNTQ1RMUl9FTHhfQlIgICAgICAgLyogRGlzYWJsZSBCYWNr
Z3JvdW5kIHJlZ2lvbiAqLw0KPj4+Pj4gKyAgICBvcnIgICB4MCwgeDAsICNTQ1RMUl9BeHhfRUx4
X00gICAgLyogRW5hYmxlIE1QVSAqLw0KPj4+Pj4gKyAgICBvcnIgICB4MCwgeDAsICNTQ1RMUl9B
eHhfRUx4X0MgICAgLyogRW5hYmxlIEQtY2FjaGUgKi8NCj4+Pj4+ICsgICAgb3JyICAgeDAsIHgw
LCAjU0NUTFJfQXh4X0VMeF9XWE4gIC8qIEVuYWJsZSBXWE4gKi8NCj4+Pj4gDQo+Pj4+IE5JVDog
Q2FuJ3Qgd2UgaGF2ZSBhIHNpbmdsZSAib3JyIiBpbnN0cnVjdGlvbiB0byBzZXQgYWxsIHRoZSBm
bGFncz8NCj4+PiBZZXMsIEkgd2lsbCBjaGFuZ2UgdGhpcy4NCj4+Pj4gDQo+Pj4+PiArICAgIGRz
YiAgIHN5DQo+Pj4+IA0KPj4+PiBJIHN0aWxsIHF1ZXN0aW9uIHRoaXMgdXNlIG9mICJkc2Igc3ki
Li4uDQo+Pj4gDQo+Pj4gQWN0dWFsbHkgSSBrZXB0IHRoaXMgdG8gZW5zdXJlIHRoYXQgYWxsIG91
dHN0YW5kaW5nIG1lbW9yeSBhY2Nlc3MgYXJlIGNvbXBsZXRlZCBiZWZvcmUgTVBVIGlzIGVuYWJs
ZWQuDQo+Pj4gDQo+Pj4gSG93ZXZlciwgcHJlcGFyZV94ZW5fcmVnaW9uKCkgaXMgaW52b2tlZCBi
ZWZvcmUgdGhpcyBhbmQgaXQgaGFzIGEgJ2RzYiBzeScgYXQgdGhlIGVuZC4NCj4+PiANCj4+PiBT
byB3ZSBjYW4gZHJvcCB0aGlzIGJhcnJpZXIuDQo+PiBJIHN1Z2dlc3QgdG8ga2VlcCB0aGUgYmFy
cmllciBoZXJlIGFuZCBkcm9wIHRoZSBvbmUgaW4gcHJlcGFyZV94ZW5fcmVnaW9uIGluc3RlYWQs
DQo+IA0KPiBJIHRoaW5rIHRoZSBiYXJyaWVycyBpbiBwcmVwYXJlX3hlbl9yZWdpb24oKSBzaG91
bGQgYmUga2VwdCBiZWNhdXNlIHdlIG1heSB3YW50IHRvIHVzZSB0aGUgaGVscGVyICphZnRlciog
dGhlIE1QVSBpcyB0dXJuZWQgb24uDQoNClN1cmUgSSBhZ3JlZSwgZ2l2ZW4gdGhhdCB0aGUgY3Vy
cmVudCBjb2RlIHdhcyBvbmx5IGNhbGxlZCBiZWZvcmUgZW5hYmxpbmcgdGhlIE1QVSBJIHdhcyBv
ayB0byBkcm9wIHRoZSBiYXJyaWVyIGluIHByZXBhcmVfeGVuX3JlZ2lvbiwNCmJ1dCBnaXZlbiB0
aGF0IHRoZSBtYWNybyBjb3VsZCBiZSByZXVzZWQsIGl04oCZcyBzYWZlciB0byBrZWVwIHRoZW0g
Ym90aC4NCg0KPiANCj4+IGhhdmUgYSBsb29rIGluIG15IGJyYW5jaDogaHR0cHM6Ly9naXRsYWIu
Y29tL3hlbi1wcm9qZWN0L3hlbi8tL21lcmdlX3JlcXVlc3RzLzcvZGlmZnM/Y29tbWl0X2lkPWY0
MmEyODE2ZjliZDk1ZjJmNjk1Nzg4N2JlOTEwY2I5YWNkMTQwYjUNCj4+IER1cmluZyBteSB0ZXN0
aW5nIEkgd2FzIGhhdmluZyB0cm91YmxlIHdpdGhvdXQgdGhpcyBiYXJyaWVyLg0KPiANCj4gV2Fz
IGl0IGJlZm9yZSBvciBhZnRlciByZW1vdmluZyB0aGUgYmFycmllcnMgaW4gcHJlcGFyZV94ZW5f
cmVnaW9uKCk/IElmIHRoZSBsYXR0ZXIsIHRoZW4gSSBhbSBhIGJpdCBwdXp6bGVkIHdoeSB5b3Ug
bmVlZCBpdC4gRGlkIHlvdSBpbnZlc3RpZ2F0ZSBhIGJpdCBtb3JlPw0KDQpJIGRvbuKAmXQgcmVj
YWxsIHVuZm9ydHVuYXRlbHksIEkgdHJpZWQgdG8gcmVwcm9kdWNlIHRoZSBpc3N1ZSByZW1vdmlu
ZyB0aGUgYmFycmllciBmcm9tIGVuYWJsZV9tcHUgYW5kIGFkZGluZyBpdCBpbnRvIHByZXBhcmVf
eGVuX3JlZ2lvbiBvbmx5IGJ1dCBpdOKAmXMgd29ya2luZyBmaW5lDQpvciBhdCBsZWFzdCBJ4oCZ
bSBub3QgYWJsZSB0byByZXByb2R1Y2UgdGhlIGlzc3VlIEkgd2FzIGhhdmluZywgb2YgY291cnNl
IEkgd291bGRu4oCZdCByZW1vdmUgaXQgZnJvbSBib3RoIHNpbmNlIGl0IGdvZXMgYWdhaW5zdCB0
aGUgYXJtIGFybSwgc28gSSB0aGluayB0aGUgbG9naWMNCmhlcmUgc2hvdWxkIGJlIGtlZXBpbmcg
Ym90aCB0aGUgYmFycmllcnM6DQoNCjEpIGRzYitpc2IgYmFycmllciBhZnRlciB3cml0aW5nIHBy
YmFyL3BybGFyIGFzIHRoZSBhcm0gYXJtIHJlY29tbWVuZHMgKGluIGNhc2UgdGhlIG1hY3JvIGlz
IHVzZWQgd2l0aCBNUFUgZW5hYmxlZCBpbiB0aGUgZnV0dXJlKQ0KMikgZHNiK2lzYiBiYXJyaWVy
IGFmdGVyIGVuYWJsaW5nIHRoZSBNUFUsIHNpbmNlIHdlIGFyZSBlbmFibGluZyB0aGUgTVBVIGJ1
dCBhbHNvIGJlY2F1c2Ugd2UgYXJlIGRpc2FibGluZyB0aGUgYmFja2dyb3VuZCByZWdpb24NCg0K
Q2hlZXJzLA0KTHVjYQ0KDQo=

