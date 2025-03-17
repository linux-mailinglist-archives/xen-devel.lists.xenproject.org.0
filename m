Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98038A64753
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 10:30:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.916396.1321492 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tu6n1-0002N4-7c; Mon, 17 Mar 2025 09:29:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 916396.1321492; Mon, 17 Mar 2025 09:29:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tu6n1-0002LZ-3n; Mon, 17 Mar 2025 09:29:43 +0000
Received: by outflank-mailman (input) for mailman id 916396;
 Mon, 17 Mar 2025 09:29:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q9Sv=WE=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1tu6my-0002LT-Ms
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 09:29:41 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170130004.outbound.protection.outlook.com
 [2a01:111:f403:c200::4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5885ff4d-0312-11f0-9899-31a8f345e629;
 Mon, 17 Mar 2025 10:29:38 +0100 (CET)
Received: from DU7P191CA0014.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:54e::27)
 by AM0PR08MB5506.eurprd08.prod.outlook.com (2603:10a6:208:17e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Mon, 17 Mar
 2025 09:29:35 +0000
Received: from DU6PEPF00009526.eurprd02.prod.outlook.com
 (2603:10a6:10:54e:cafe::89) by DU7P191CA0014.outlook.office365.com
 (2603:10a6:10:54e::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.33 via Frontend Transport; Mon,
 17 Mar 2025 09:29:35 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU6PEPF00009526.mail.protection.outlook.com (10.167.8.7) with
 Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.20 via
 Frontend Transport; Mon, 17 Mar 2025 09:29:35 +0000
Received: ("Tessian outbound 9ad6b0132486:v594");
 Mon, 17 Mar 2025 09:29:34 +0000
Received: from L74999bcf0674.3
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6D24B1FF-FD36-4411-8A76-EAE672587F23.1; 
 Mon, 17 Mar 2025 09:29:22 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L74999bcf0674.3 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 17 Mar 2025 09:29:22 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com (2603:10a6:5:1c::25) by
 PAWPR08MB9032.eurprd08.prod.outlook.com (2603:10a6:102:335::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.33; Mon, 17 Mar 2025 09:29:20 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668]) by DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668%4]) with mapi id 15.20.8534.031; Mon, 17 Mar 2025
 09:29:19 +0000
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
X-Inumbo-ID: 5885ff4d-0312-11f0-9899-31a8f345e629
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=qpOdUqte7x1U5dEfzNR7kru+hZBpbRHgsWsI8hebga6piqKKp21MTE9wBRa3Srv60CZ7086eOW5iiycjEfKbVdrXdy3ZVBWnLVAhZGXqmP+6mkpti5hQSrlspnZeppPeAiDLFXZnwjxJdunU8tOQyyLg66ZQKdnKe/YsdCtwRUBMkfOxd5tq3QlxYDt+ZA248AbWWlUz3XqCOQ309zJu49AtU34HlhJHamy9HXDw7jzWFbS6r/l6W0BOHp1PTOwbcpz4oAj24kV7zk4VRWi/+ce0JSJlAoI2Qb1LRp4YTVPkB/3iSY07T7UnV3Mw1Z7/vFqZZk9tgzPMbBGmuLCr/w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CLjayvwV+l3sJBls3Ax1BA2yCDD4U1EwskKnJNUiato=;
 b=TCaF5gxr6bBn5zXotZ1VwI5Zls1AmEm5wCigMcCISzBFgXt9SK/DKbc1GFXHPntC3Mcxj75l+ZSk9J7qovYqE9MXQiREaFZfOYxHb441UZIhCb9VG9qsvSy8rqnwzGxh6hXSdCYLNRitvUbRZYyKkdkytz4r3AfW/CyI1M4rz7LACiCyQigKKlDP8j4n5dotqh0wQS4lfmYOJBzvhEDl9qdd8wmwfLi9JAoWrU02XAd3hsYshNcDMSPB2qDoZvHNUHZtrn7OWQydCtxGntNAEpkCzvzk8RrDw8ki9/VfCtpkdqKfRN24IholfvWp3A2aQVUkqqiTb8Q33GbrGWIMiw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CLjayvwV+l3sJBls3Ax1BA2yCDD4U1EwskKnJNUiato=;
 b=AnersV0IU/Sg9B6D+xIPo5Z3coJD4AFnVqiTh5VjOBNeiOko/9oC//zygAafBOfTmBHAd32DN+F467AbBJZkH8AjYZq5nEbHJKgr7xuhb8PrA5dCVvtrLvUkUlBLbeU5D4W/yuE4zBPRDmI5siqE4+9pTlx1gXfsl7NvECvqoGE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 173c9a57dabd8fa8
X-TessianGatewayMetadata: xrn3B0k7ee23dix+SOKKWa/i3nJIK6PiIOgqG0BFOYtYmwXULq/m3nlyaKSKzzXtXwAvJFFc5klJqpuAPuYg3dQRHmSdQgYrfNsgm4ICb9jNB8lUBAbPQVBWZiSftRlji5pSCqtLtA1ggJkS1am679HbnRKD1cb9IxyJoH75vsY=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uBoMZHCGSN3VrZV26LTJ8jkuFBmSk/ITkUyZv1ZBc3waVpxLpERsAAwTAZaw7TDsqciUHIMAOfy+y45zQ0Vku0Bmtu9vshoBDqVIiIitdQY/fLq5tDiXmsHWpB8mREWgGrWyw+ZuYlwQ8ZLK+gyc2X6wKlmdEQUFJJjAe15hBuDmeKsXqaIE7p96AQao+mJEoPyrQuG2YagfXpi8VFzW8n8BahywDSrJVygVE/B34at30iJ84ctrYtc8YaDUDBcZzb5N/wa/zXYrkrMVPuZX3ovjAGJCEG6fNeQL1gza/GxaUWEy0SyXemlfqdXFpdGt0fl+w5Qnl0ztnLGH5MaVfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CLjayvwV+l3sJBls3Ax1BA2yCDD4U1EwskKnJNUiato=;
 b=SVb/GaekJzEwFZXfc2wGo4kZm5JgE1mS2RH9/Ty/1BhBiegctXwKJLKXSCKyh8xslpWk0J6kiQoaNljqsP4beTMoxF2wRPuxxbZn73lMYtRKTzNY8wDb6lHXcN865+Ytf3qnbEcCXHY1HXI/SRZv87+7iqMx55dDv9CeDHkQVDU8i+oY92G+i17Indf7wpYYQU0gbYkgAyMOZnxkqfHwwLv6blcvAWz2+RhUsa55l6rFt/sktISgsUaDEmspAvqnoOdNFoeG8oaN53mfn+/WTsG3ISoaChdFB1wjc6W9jxQxHOaakDuGAS3HQEnrZSDWHlVcHnA7pa437SJBGhHdIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CLjayvwV+l3sJBls3Ax1BA2yCDD4U1EwskKnJNUiato=;
 b=AnersV0IU/Sg9B6D+xIPo5Z3coJD4AFnVqiTh5VjOBNeiOko/9oC//zygAafBOfTmBHAd32DN+F467AbBJZkH8AjYZq5nEbHJKgr7xuhb8PrA5dCVvtrLvUkUlBLbeU5D4W/yuE4zBPRDmI5siqE4+9pTlx1gXfsl7NvECvqoGE=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Penny Zheng <Penny.Zheng@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Wei Chen
	<Wei.Chen@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 6/7] xen: introduce Kconfig HAS_PAGING_MEMPOOL
Thread-Topic: [PATCH v2 6/7] xen: introduce Kconfig HAS_PAGING_MEMPOOL
Thread-Index: AQHblqk6YtpfolyfmEyO326feCx3mrN3A2MAgAANRIA=
Date: Mon, 17 Mar 2025 09:29:19 +0000
Message-ID: <B33096DB-1CFC-41CE-8906-FA4AC7708FF9@arm.com>
References: <20250316192445.2376484-1-luca.fancellu@arm.com>
 <20250316192445.2376484-7-luca.fancellu@arm.com>
 <763a55dc-79ff-4176-9286-17a144bd8da7@suse.com>
In-Reply-To: <763a55dc-79ff-4176-9286-17a144bd8da7@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.300.87.4.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB7PR08MB2987:EE_|PAWPR08MB9032:EE_|DU6PEPF00009526:EE_|AM0PR08MB5506:EE_
X-MS-Office365-Filtering-Correlation-Id: 07c25ea7-6f3d-4464-eed7-08dd65363b2b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?NFkxcmZ1K0lJR1JYMEpHNndVZ1RwR3MwcnNwQVJrQzAxRTl6ckJ6WjUrQTYw?=
 =?utf-8?B?dmVzbnRrTDJScklwY3Y1cUFUMkFHaXhtamM3ODRUcHIrT0lXdHFLU21md1Mx?=
 =?utf-8?B?eUdqSUJsR0RtMGc0emppaVRQQXo1SDl4SFZ5bE93aSt1Qit4aHJTaWxQNkc1?=
 =?utf-8?B?OFJQL3FsWVkrQTF4MndOMktWdFRhUXhHdkhTc0QwMXFmT2dlRnpieEV6Z0RW?=
 =?utf-8?B?WDluTVh0YU8yNXhXdGt0VVE4M0w3UDFRLzNjd3NTYzNSYkxVd25VWHZrSmNy?=
 =?utf-8?B?SHpqTGZPUnRLaDdTanZ1cExGRTM5L1BWZjdLZXNVdEtuUjBQWU9yTnBBLzVT?=
 =?utf-8?B?d3dXcXlyY2F4N0NtYTVNNWNJaXFnVTlEUHd1Z0xydEZ3TDBwT3hvckJpdVV1?=
 =?utf-8?B?UU1Xa2ZUdStzNXNIbDRCY2NtQjBKc09lRXY2Z29Fa1o3MGx1T0E4UTRQbGg1?=
 =?utf-8?B?OVhOSHRKanRpYVM0L0xIb0NFSFRBTkczcXBGNTVEVnV3MkNSbWh5SHFyV0Vs?=
 =?utf-8?B?OU1lTUVtdHphU29CRHlmOS9zRS9HRzNrTjQ3NzlaMEU2bWhiSHdvOGFKRmhX?=
 =?utf-8?B?RlJweUE5Q2NPWC9VTFFyLzNSMklNVlVkVklwZTkyMmE5VEJqWWx3aTFLOEZR?=
 =?utf-8?B?d2g3eENnciswbVJ3Y2JmUDg2a0JQdjY1RHNiKzM5ZmkvVStQbDUwMzNmZndX?=
 =?utf-8?B?TmdycGJtNXBiTHM1c3VZQkhYY3kzOHFsM01sQ21CdmxRN0dZcTR4ZlNKKytM?=
 =?utf-8?B?RVh0NWpqZ1F0a3ZrOUQ0Y01HdmdrRUJwK2FWTUw0NjA0TzB1dlFyZUkzbWFJ?=
 =?utf-8?B?QUw5amtmVGlXTG9RTUdCenlIQjY5RURaK3hsUVltUHFHVXVxODdLcGVQVlB0?=
 =?utf-8?B?YWFvVHBTaUZZckZXcFg0SGg4U3NSa095NTlhTVowNGtndDZPNFFxYlV5d0po?=
 =?utf-8?B?MS9KNmo1RXpXRGVnc1hPdHNwMnV2c0V1aG9jbmZmZmJZVXR6cVFBalJnK0Ru?=
 =?utf-8?B?b1orenJlMHE2MStWdUx2NVQ3a3FYQ0dUbUdDOUhEZU5BaS9jTlNBMjBsYWFi?=
 =?utf-8?B?aXN2NHlkS1ZqY2hFNDU4b25sWHBnaEhEODd6QzJJOVlNVlI4R1B2WGVRTFlD?=
 =?utf-8?B?Zm1EbnNLS3lUYTl2bHRrTHpnQTFOMG1VdnUybDRlLzN1TlRPZXpvVXJhL20y?=
 =?utf-8?B?eEgrOFM1ZDNxRVFLMm1oRFZCZ0Z5SEdrclpITTQrTmhQVG9vQkVBY1JUeThN?=
 =?utf-8?B?NzRuYTBlN3BPK3NiNWZvSkxTRWpsWW9hNU5yeVQ5Z0VCaTBRT2NsZmwwTnRR?=
 =?utf-8?B?ZmlDWHBwbEFXZGQxQWM4Wk5DRmlaWm4yd0JlOFkyRDVKUEhwMUpzMzlraWhO?=
 =?utf-8?B?blNjUE9zOUFienNyWWxSanVhUTI4WUM0SG5Zam5iZVQvU0J1UVQyLzJZdFRL?=
 =?utf-8?B?em5zQU5LdzdTdytjc3lHeDl0aFZUTkFiZFQ0bGxjdVUyZkxIZGtJU3JOYmh5?=
 =?utf-8?B?M0ZCYXB3M1pIY0ttL3UwMTJWOWd0U0ZaYVpPNm8rdnd4RlJvb3YzK2lWRUpw?=
 =?utf-8?B?K1JSY3g1TVJBYVJlNmdCUlcvMml3Q045elJlL1VjcVhFTmhrdFVlSUt1bXdm?=
 =?utf-8?B?SGFrQzNCWDd2dFFXL0ZVa1crQ1kwUDl5L1czU0JIanFacExsQlNvOUM3bklh?=
 =?utf-8?B?ei9wdC81Nlk1bE1aUU0yZit4aWtQeGI5SXJhbHVDcllDZk1TZTU3TWJoUHQ2?=
 =?utf-8?B?YXNCdGY0VDBuTjl3NWdrUzN1Zlp6RFlmaVlTOVlxOEdxRkZJcWVxMWdHQkh1?=
 =?utf-8?B?MWIyU3UrdHVxemRMenF6MExsUEJ2ZGhzbktMREZwekZIbkVhTTUzTUZ3VjNi?=
 =?utf-8?B?TllFVGZCOU5mQTVIRFRrVkJ0SVhobzNLa3BER2VnOUlBZWN3eE5uRCtGN1lK?=
 =?utf-8?Q?Ix/hARPzMvs9ipAc/pjGQ0gRuAAdXyuY?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB2987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <65489C36FAE9FE49921180E1AB79BDAF@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9032
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:5:1c::25];domain=DB7PR08MB2987.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF00009526.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	14b10a9e-a8e2-440a-8b9e-08dd653631fe
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|1800799024|376014|14060799003|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MmxJYVNKaFJRTlYvOGJNUUtZZ29jOXNDZFVKa3JzZ2tXbGZkenlkMDhYV3pa?=
 =?utf-8?B?akJLdHBEOWVRQ092N1VHUmVZSC9FVEV2ajlwc3Z4QTVsOXYxcFFMNmlHb1p3?=
 =?utf-8?B?UmF6VHlDTDZsRkRFWlBod3cxYlFBc2tFMUFnU3dZMGhiY0QvWkdNV2UvRVhr?=
 =?utf-8?B?c0EwaGI0eE56bmtsMzZyN3J6T1l4STBaZ01KQVdVYXFnWDFCc0JrOUJab0hh?=
 =?utf-8?B?dWdCM29BeW5mdGpUZHRPYm5OUmJNK3BMaEI0aFFZZTFTU0Q1SEQyODBjbzU2?=
 =?utf-8?B?THVpOFdXemVDR0JoKzVvK1VDWnFyejlnUi9qQ2p2TS8yb21MYjJ3V1dDRnRP?=
 =?utf-8?B?b0NiOCtpNjA4VnRqamRqZlBxM2NXQlc3cUg2Qkp4QXZiRFR2Zks5WFNtOG85?=
 =?utf-8?B?eG9JQ0VKYTI1aXdqdlVUTjZtbnNWZEJZQUVGNmk2VFFzb0lVNWpLN3BTUUlh?=
 =?utf-8?B?S1ovMldRL2pwSTE1aFBPRWxFK2Y4QmZyL2FyVzFORzRGR3RmdzdWZEZ0bWJy?=
 =?utf-8?B?ZlNIY1NmRmxxSmxtejFWL0lMV3I5NE5zRmxORTh5ZlNjcHhmbUh3MkhtL0xr?=
 =?utf-8?B?RUVuTWJxNWZCL1J6aUFZd1ZEVjlWeWhSKzFtRFlGRXlVcFlNSVlrWmRLK1ln?=
 =?utf-8?B?UFg4UGZHRFpYdktHTEZNQVllY3pvQVhVc25OR2orUlovNlA5UjQvWUlWSVhY?=
 =?utf-8?B?d1FGLzZWT2VCSVJ0TDNhMUQzbFJKR0NIcy9jU0NpNE5hd215NFNQdElOMmdF?=
 =?utf-8?B?cUFoVnQrQUIvODJ4bFJSVHVyQ09aUHd6OFVjZUs5V1hqaWg2Z1RDRXNZdWQ2?=
 =?utf-8?B?am54Y0RHa20vWE53d3lIVGlJZVRkQXVxQ2JRRVRucmRqTUpBNGl1b0pYa2Z3?=
 =?utf-8?B?bU1pbERvU3BVNVNOWjhIa3ozTzgrQ1NLWGkvS0V1NVNwODR3N1lJd0l4djd1?=
 =?utf-8?B?NE9FOWlub1NBeklUS0ZGWENKR2E4SnZhTnJXYnBhU2NKa2VhNEJUb2k1Qlht?=
 =?utf-8?B?Qm5uRFZQVHJPYlExWUxDNDk2UUo2a2NMcjEyU2lyT3FsSW1MRytuZXM0RmNm?=
 =?utf-8?B?NkdnT2lTV2tkQ2VpR0FVVzNLY00zdXVBMk9GYzBlMHlXRWlUMVlpTkZYR2Ux?=
 =?utf-8?B?b2RDUWtXR0hDTXdMbnoxc21OUENzMk1WdmltS1V1MGs4Qk1WMUF6OTUwY3d6?=
 =?utf-8?B?elgwOGFmaElXRE5ka3NsWXRxZno5Nk1ScWlFT21nRnlhK1UyZ0FXODNlR2c0?=
 =?utf-8?B?OHFHdk10VXR0bFZZRTlKTHhzN0xidlI1eXZGYTNSUnpkZ3BBdVNHbEFmUGRH?=
 =?utf-8?B?OEhVR3U2aS91bU5MeHl1anVpM3ovZXRNZ3BtS1Q1VUdVSEZyYmpjZlRWUUdr?=
 =?utf-8?B?bnRMczJYZ2t6STFiekRZQjhLeHJuQ2YyLy9naWYwVkw3YmlQNWFVcG5tMmVZ?=
 =?utf-8?B?ajkydTIxdWJTRzRyN3dYSitqU3ZEOEQxQUs1bW94MGFuTEpLVEFNVUNVYUY0?=
 =?utf-8?B?SWE2clhWRWJjYW9XK1RJZUZ6YVpLbXluRW5TcWpvUjdneTdJNERlMktDaUU2?=
 =?utf-8?B?ekl2WnlMblh6N1RTYXlkWGFrdDNyWU9LVERXOGhDaUV6Nm5jV2ZhTWoyL2VQ?=
 =?utf-8?B?K0xteUZ2SnV4VDFOdkxQTm0rcWRpbS81NzV0aE5KdGtoc2VWVERnbjVlL1JT?=
 =?utf-8?B?T0pSU0RlUkQwTDc5ZzFseitLelBGT0dXQit2aUdRMXR5ZkU4c2hDMjlMb1Ny?=
 =?utf-8?B?dTNZcjh3V2M3ZnRaa3IrUTAxUUNuRzl4UUVxR2FqMGNtb3Y0Y3ZrNG5OSlFZ?=
 =?utf-8?B?ekkzUWV3UHd4dk1veFc0VFhEYlBzU2loamlYR3U1UTdMN2RhOVlJVUdML3Js?=
 =?utf-8?B?ZmQ1eDJqWG9vLzhzSHBmcGkxeVlQaVNMZFR5L3I3THA2dkxzcHpia3Q5K2l6?=
 =?utf-8?B?bDdIWkdzbWpEMWhrRndyT2pDdlQ5UWo0YTI1TzNYUnZoWDY2NGttekNZMWdl?=
 =?utf-8?Q?bkU5YrUJcNbpgGoBcphR4ZDE5qFca4=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(35042699022)(1800799024)(376014)(14060799003)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2025 09:29:35.1696
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 07c25ea7-6f3d-4464-eed7-08dd65363b2b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF00009526.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5506

SGkgSmFuLA0KDQo+IE9uIDE3IE1hciAyMDI1LCBhdCAwODo0MSwgSmFuIEJldWxpY2ggPGpiZXVs
aWNoQHN1c2UuY29tPiB3cm90ZToNCj4gDQo+IE9uIDE2LjAzLjIwMjUgMjA6MjQsIEx1Y2EgRmFu
Y2VsbHUgd3JvdGU6DQo+PiAtLS0gYS94ZW4vY29tbW9uL0tjb25maWcNCj4+ICsrKyBiL3hlbi9j
b21tb24vS2NvbmZpZw0KPj4gQEAgLTc0LDYgKzc0LDkgQEAgY29uZmlnIEhBU19LRVhFQw0KPj4g
Y29uZmlnIEhBU19MTENfQ09MT1JJTkcNCj4+IGJvb2wNCj4+IA0KPj4gK2NvbmZpZyBIQVNfUEFH
SU5HX01FTVBPT0wNCj4+ICsgYm9vbA0KPiANCj4gSW1vIHRoaXMgaXMgdG9vIGxpdHRsZSBvZiBh
IGNoYW5nZSBvdXRzaWRlIG9mIEFybS1zcGVjaWZpYyBjb2RlIGhlcmUuIEp1c3QNCj4gZ28gZ3Jl
cCBmb3IgInBhZ2luZ19tZW1wb29sIiB0byBzZWUgd2hhdCBwcmV0dHkgb2J2aW91c2x5IHdhbnRz
IHRvIGZhbGwNCj4gdW5kZXIgdGhhdCBuZXcgY29udHJvbC4gVGhlcmUgbWF5IGJlIG1vcmUgc3R1
ZmYuIFRoZSBzdHVicyBmb3INCj4gYXJjaF97Z2V0LHNldH1fcGFnaW5nX21lbXBvb2xfc2l6ZSgp
IGxpa2VseSBhbHNvIHdhbnQgdG8gbGl2ZSBpbiBhIGhlYWRlciwNCj4gcGVyaGFwcyBldmVuIG9u
ZSBpbiBhc20tZ2VuZXJpYy8uDQoNCknigJltIHdvbmRlcmluZywgc2luY2Ugd2UgYWxyZWFkeSBo
YXZlIGFyY2hfe2dldCxzZXR9X3BhZ2luZ19tZW1wb29sX3NpemUNCmFyY2hpdGVjdHVyZSBzcGVj
aWZpYywgSSBiZWxpZXZlIHRoaXMgY29uZmlnIG5lZWRzIHRvIGJlIEFSQ0hfUEFHSU5HX01FTVBP
T0wNCmFuZCBuZWVkcyB0byBwcm92aWRlIHN0dWJzIGluc2lkZSBpbmNsdWRlL3hlbi9kb21haW4u
aCBpbiBhIHNpbWlsYXIgd2F5IG9mIGhvdw0KQVJDSF9NQVBfRE9NQUlOX1BBR0UgaXMgZG9uZS4N
Cg0KV2hhdCBkbyB5b3UgdGhpbms/DQoNCkNoZWVycywNCkx1Y2ENCg0K

