Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A623CBAFB
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jul 2021 19:15:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.157672.290381 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m4RQe-0004Dw-9l; Fri, 16 Jul 2021 17:15:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 157672.290381; Fri, 16 Jul 2021 17:15:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m4RQe-0004Av-5B; Fri, 16 Jul 2021 17:15:12 +0000
Received: by outflank-mailman (input) for mailman id 157672;
 Fri, 16 Jul 2021 17:15:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cq1l=MI=arm.com=Bertrand.Marquis@srs-us1.protection.inumbo.net>)
 id 1m4RQc-0004Ap-E1
 for xen-devel@lists.xenproject.org; Fri, 16 Jul 2021 17:15:10 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.8.81]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 42de80de-3f70-45ea-a01f-28ef87a54083;
 Fri, 16 Jul 2021 17:15:07 +0000 (UTC)
Received: from AM5P194CA0022.EURP194.PROD.OUTLOOK.COM (2603:10a6:203:8f::32)
 by DB7PR08MB3722.eurprd08.prod.outlook.com (2603:10a6:10:33::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Fri, 16 Jul
 2021 17:15:05 +0000
Received: from AM5EUR03FT047.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:8f:cafe::c1) by AM5P194CA0022.outlook.office365.com
 (2603:10a6:203:8f::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend
 Transport; Fri, 16 Jul 2021 17:15:05 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT047.mail.protection.outlook.com (10.152.16.197) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Fri, 16 Jul 2021 17:15:05 +0000
Received: ("Tessian outbound b81a99a0393d:v99");
 Fri, 16 Jul 2021 17:15:05 +0000
Received: from 9d7612634450.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8349C799-3681-4FD6-B9C4-D3EDDD86E163.1; 
 Fri, 16 Jul 2021 17:14:59 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9d7612634450.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 16 Jul 2021 17:14:59 +0000
Received: from PAXPR08MB6446.eurprd08.prod.outlook.com (2603:10a6:102:12d::10)
 by PR3PR08MB5657.eurprd08.prod.outlook.com (2603:10a6:102:87::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.25; Fri, 16 Jul
 2021 17:14:58 +0000
Received: from PAXPR08MB6446.eurprd08.prod.outlook.com
 ([fe80::3184:5465:27b6:f27d]) by PAXPR08MB6446.eurprd08.prod.outlook.com
 ([fe80::3184:5465:27b6:f27d%8]) with mapi id 15.20.4308.027; Fri, 16 Jul 2021
 17:14:57 +0000
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
X-Inumbo-ID: 42de80de-3f70-45ea-a01f-28ef87a54083
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2RmLbxYMrjGdHwXqqepCVjrYipANuFQ65uYhsQNnKMU=;
 b=T6IGlB1OwRxNwN2T52jWg9rTu0Jgll/li4+6bhqy3qthSxwHnxWVx2y+yOoqk6DA8AhoaIu52XJ8inScS2CQKroEEGUJ344dJT1dz6ljpX+ltCIwWRZt576u74ctQoO6r3xDY233CmXljvj+pdEKrShRjKrcsAgDyngECVu23DQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7782c4012cf1f22a
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KKZOZ3DFta9ieR4ntYAFQVf/zchjyzbef5JKeiET0cPprL7nkUgIftPkH0IBvN6XYrG2nkBvj+SS1pxdZtmjLGES9Pr0KYfEV1+V4Jndp5Nxvci+3bT6AQcAarT2pt5Z+0fUyTc2CmSKlPKny1DvBbPhjDtt3M+3XLRy1argRZvM5N6m74FXCrJCNqqO1IM69JwNejd80y2xz6lHz3dR4o3lshIQ8xNuiYxYspYWrXEHR1zMfpl1HIDcePgmw0jGsdXytYx6IQjFcRK+Fx3m/qJnOlwUUyfKF5mrh+cTepHq5RtPd195iL631Fn0/+/PvyAGQgs5zpM1q3EDnSSE+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2RmLbxYMrjGdHwXqqepCVjrYipANuFQ65uYhsQNnKMU=;
 b=bZbSP01G/XaAjBdhYQ/ZcZPJoeJlPJteM2zt1tQV6Khbt50UDi2qMD3cPswC7Zz/2nagmoyPz3nIfaZ4LhUN/QxM/NuRXS94dyApTVwkyNgZvdZek+4PmwTuuSAxC8NStvsr6JWM71J2C7kLKI6YCguwZJ4TS7x8+zunMRr1G7GEAWekgOFwDLBl8X/Qxxl0CqE2ueuxY72Zuvt3Sxrno+lzJ32DcwdN2djR9ZnjpgCVNBsS3WRqlk9bT3Ntmmorp+CKA0C46ld8bN3nNX18NB1Sbca3AIMA+YYkMt+uolY2z1hSEpVy1yEKdbATP3c0NzFFfCc/Gxx8GLnahYKOfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2RmLbxYMrjGdHwXqqepCVjrYipANuFQ65uYhsQNnKMU=;
 b=T6IGlB1OwRxNwN2T52jWg9rTu0Jgll/li4+6bhqy3qthSxwHnxWVx2y+yOoqk6DA8AhoaIu52XJ8inScS2CQKroEEGUJ344dJT1dz6ljpX+ltCIwWRZt576u74ctQoO6r3xDY233CmXljvj+pdEKrShRjKrcsAgDyngECVu23DQ=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>
Subject: Re: [RFC PATCH 3/4] xen/arm: Sanitize cpuinfo ID registers fields
Thread-Topic: [RFC PATCH 3/4] xen/arm: Sanitize cpuinfo ID registers fields
Thread-Index: AQHXbQmqqZ2dUoMblUy//wgHf+AX8qs/M8QAgAa+XIA=
Date: Fri, 16 Jul 2021 17:14:57 +0000
Message-ID: <A8304A17-E59A-4C40-A9FA-6EF49B58AC54@arm.com>
References: <cover.1624974370.git.bertrand.marquis@arm.com>
 <b9c86a28df2bddca095ae02511ced09585dce164.1624974370.git.bertrand.marquis@arm.com>
 <4014ca20-b3b6-cd39-9b26-d1dd8e9b568c@xen.org>
In-Reply-To: <4014ca20-b3b6-cd39-9b26-d1dd8e9b568c@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.100.0.2.22)
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: c394a7bc-997f-43b0-5cd4-08d9487d415d
x-ms-traffictypediagnostic: PR3PR08MB5657:|DB7PR08MB3722:
X-Microsoft-Antispam-PRVS:
	<DB7PR08MB3722EE16B2D1D88EC6862E689D119@DB7PR08MB3722.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:901;OLM:901;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 qjEn5OsmgM8ZqpOMiLFpNKBU/HvGEdvlbjv3t0hmX+FJHFlc8YH4J9nEVKOJoNBXHMvGVniH9Swg8lxWczArRdawpO/yrXQ9bc0uRFeZtz7HtW5eaXoEcZH+TRDcc4u/Hf9bIyV7lOX/pI9TBQl0U9Dgeuk7+NiCSi1ufaUkUh+OtBLEYeaUmKFPnFnVzZOm9vZD6prHxRsa1p62/s9Etm3Aj7TQvICYr+D6ZITCvyYzE1k2UGN2BYrCcM6If2MZNoYKzsVWsQr3pWUpzvRDFry7Ja2548kwrjl7L3cNgWUr1lsgx4vpzIb5Y2+vCZMlC5LgnImH3CWmADon4waG8Z36NwEolZk9TPSGBPy5ARgnmLG6Nyap2Nhaq33GJLk7uAFgclj0sILx3oRRfIMC39dWbwVvIlZBbLkWHwsbRSSH/MXLrdUl7ZdtjZYWDjgbL0DGna636S9XJ0vYzdEKPz/sXHp49yZWHj34DRkYyTzu4mf/ls4ryumsDyV5UQlDhWsDzUwqevicfSMKKLtF6IbNoXdwSD9/X2pSj2VSQU+gpFxwT7lhTe6InIqDOLFG5En8Me7Eas20zSYWqJxxUeELF6yKx1Cuc+SAfBrd/+TfOf2wgv5uB59FObAieUd7aZDO8ZGVF8qqUwpzekcYnos6rit2NR3NiqnBK/txQXBiJOKBrrPaxZxU3SKvFRbJv8KiavmlQG28gIU9u6yIvPl/QwHOTH9lEah1hVtIv4XoKl0Hyw4ile9HFwOhNsyA
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6446.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(366004)(376002)(136003)(39850400004)(83380400001)(316002)(2616005)(8676002)(5660300002)(6486002)(71200400001)(4326008)(33656002)(54906003)(8936002)(2906002)(26005)(38100700002)(64756008)(36756003)(66556008)(6916009)(6506007)(6512007)(66446008)(66476007)(66946007)(186003)(86362001)(122000001)(91956017)(478600001)(76116006)(38070700004)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?L1pjOE94R3U5Y3VlQ1d5ajRuL1NkdU1ScHdtdkk2U3RiQmpHcDcwVWI1MGt6?=
 =?utf-8?B?aXpZVE9NSThYVWtwSmVJWkhnRmJnQkx2WmRXSy9ueGxtUFVxZWlITnhxZVZv?=
 =?utf-8?B?NFRiZFpGWW85S3E2QW9CUjBmSUhOVXFTaHFxY3JuZEJudWtlSTdwWFpjN0tR?=
 =?utf-8?B?WFpzejBENTEzbHFKV2toTFJGVTArVWE4ejZFMk5HMXJ3VDVSWEJ6NzgrS1ZO?=
 =?utf-8?B?TFhRRktWN0liNG1CN0ZUOExUV3d3WlVhK2hCVnY1QlM2U2ZncVNNcW04VGJR?=
 =?utf-8?B?MkRCUDZCSXFXK1ZHYnpWSmhZbUV3NGNwMmpCVTNydThhMmxlZGNEM09oLzNq?=
 =?utf-8?B?K0QxbFc4VnlUZWc4Z2FRNnlwbW1wczFZNHM2U0ZuTHovakkyTUlOSS8yUlIv?=
 =?utf-8?B?amI3WGhtREFETGFkYVJmcWlrSUVPZFc5eUZzYWRRck9nUy9HNjFYdkE5ZUkv?=
 =?utf-8?B?QzhEUks2dEUrT0R5M2w5TmFyTlhEQWJpV0k3eXhvMlErTVliN2FDTlJSVmQ0?=
 =?utf-8?B?aHV6cFNaK0h6K1pDcVhHUFlSWXE2WlkxVWRuRUtQS2RYSmVqUmdXdDRpVUlj?=
 =?utf-8?B?TGtPVnpyT21zd201RGlIVnp2QkQ1SFhtbUtJUU5hWkdWSnNESzI1cnBtcW9J?=
 =?utf-8?B?TFpMUDFFL0tRODVhK2FPVngyaGJ1ZkgxYmhKQ1ZzQVFjclA3c2pjejRsTThM?=
 =?utf-8?B?L1ZzQU9DTXUrbG5FRyttNGVmUzVCRkxMR0ZvL1d4MThzc2NFUXZEbVBaVml1?=
 =?utf-8?B?LzlyYnpBeURuTDVNNlhHT2d1QXpjNXFLQ1F1L3lOSXp4U1ZYRmdLb1EvaHFa?=
 =?utf-8?B?dCt5TE9NNjV6YVM0ZkU0WmplYlB2cy93c2wrQ2FkaWMyekRPTEJoUnd6L1dD?=
 =?utf-8?B?amdCZFhsQjNLK3AzSG1iMUsrb1FTVmRwZ0NlUzFlUHl5SC9VVElyc3RVQnZO?=
 =?utf-8?B?RjdKVFYxTDd2OENlbE5qbDhkSFgwRmN5TG9veHR0cVZUWHpUQ2F5ZlM0ajND?=
 =?utf-8?B?cHBBbnJKYlhCYmUwRVd1SnNTWnA5T3pVYkVDTEJpeHNXUVR5Qk41dmg2STZx?=
 =?utf-8?B?dTg2Tm00RHlsejNDK2lXVmwzdUUwLzJrWGQyMGplM0IzT0VXZVZocWpCeERj?=
 =?utf-8?B?Q04zYnI4N3JLZjBDa3UzTkVhb2o1UDJ1UkNhT1BaaGZydWgwY0RvZEhLdjF1?=
 =?utf-8?B?Y3I3dW0raFZOcjN6MEhnRldOdFp3alB2bjdtWEFYSkh6MWdlQnlxYk1kc1dT?=
 =?utf-8?B?NzFXbFBQSmk3NWtpVTJtaG9aNzVXYmxXRWtwZGJLMXVzZWYvbXl5aUM5SEYx?=
 =?utf-8?B?bG8xNEtpUFU4N2xPcjA1bVphOXBsdCtzT2hkd0gzR09VMXJBVzNocHlPUTBT?=
 =?utf-8?B?aDlOaFY5VTFXcmcxY1JnTTRjVTZTcFNQb2d0SFB6ZFdkUldqV1V0dWRFcTIx?=
 =?utf-8?B?aTVDekdNMkt1UGVhN0QzaGczb05Pbkp1MnBrbVlqTDBOc3Jqai92ZUxQYTVs?=
 =?utf-8?B?ZTFxQ3JBdzRBWWIydWp1cElVT3BUNUx2MFFGeWh5VFVxK2ZEU1NBbWw1cGdR?=
 =?utf-8?B?QXgrM0ZOTTA2SlViYWJRWXlGRHpMMTFDVkYrU0FjRnMwLytML0o5OTFIRTJV?=
 =?utf-8?B?NG5OamR3OEpBaWdacHJVSGlEMU8wZEZsNHFnRmU3Z3p0WGd5RVQ4QWErb2I2?=
 =?utf-8?B?Y2hrbzhMclNGNzcyMnVmbzdqS2FEK3l6RW1IMjMreEFOejdkSUhZZUN4UnBw?=
 =?utf-8?Q?fR2SEx9/D4N/jz20yOXtER9ClJa/YftYTnbX+QZ?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <18F767D3E742E04EBF26F733FCA1E70F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5657
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT047.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4d273a3e-4a59-4012-e7cd-08d9487d3cdc
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	blzYvdTin5/zLxoW7MGRtYiPkwRqF3av8DF3NnBtwuUNi12ZxrCzkJvGK6+Tq7dtDLXY4y7Bnb7GZL3sBFRxIsTtUaFB4Tz89cjZyJ7KWZH1MpmbfzspVBh40a6skR/+DRBp7rA/tPx2yslM9Jhz5w1UMeS4o4RUjsTgMFMSoduLH0Ec2w6f+8wZr/9Bcr2SqZJSGh+uW4pCxINXwDQkfzN4s18/+4jx3tlmR7mpgTQoTSz+LSRmRddAqtuhcsuGOMYzXpfA0mX8iUMc2eN0HQrkPTjqTa4AqoyrppeUE7bt1raCwzs0nyklulaeI0tJbK+8kiDhZ2Flv0Knh2i09bwI2QzF4QcjMp8/3KpfwPsi+OT2Nue22TLLnkqZ6QBhpTVBouaW1XQRUn3uy6o4wI4QD6NFh8fgzYtk1OJq4E9es5FV9SZu12Njf0A4K6kT21obsP+gJJqHO0OdEApu+uLiRuiWZXzP2kiAXT7K4MoCgoTLeswTxe0VZU9U2sFEN5a50Xhxvza13BXMcNts50jk3jCUhzzwd0f3FoDa0EfLoMzuV41XmJVE04O1SYf0QjKfUtHj3V4QMhQcLgWRG2tOupjq1LC0U/rjkjK8XLTy9KhR3TqAJJdk3i0e+Ikk8pP62LhfVaDY70voSZLxOtiyWd+Ctn/32Kja8DrcRP39TGXHpAKa62rUBzFgyFmtEmZhQ8P5Jktyh4GNSFP55g==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(396003)(376002)(39850400004)(346002)(36840700001)(46966006)(356005)(86362001)(36860700001)(336012)(70586007)(33656002)(70206006)(6862004)(478600001)(47076005)(316002)(81166007)(54906003)(6512007)(4326008)(2906002)(36756003)(107886003)(82310400003)(8676002)(82740400003)(8936002)(6486002)(6506007)(5660300002)(186003)(83380400001)(2616005)(26005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2021 17:15:05.3655
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c394a7bc-997f-43b0-5cd4-08d9487d415d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT047.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3722

SGkgSnVsaWVuDQoNClvigKZdDQo+PiANCj4+ICsNCj4+ICsgICAgaWYgKCBvbGRfcmVnICE9IG5l
d19yZWcgKQ0KPj4gKyAgICAgICAgcHJpbnRrKFhFTkxPR19ERUJVRyAiU0FOSVRZIERJRjogJXMg
MHglIlBSSXg2NCIgLT4gMHglIlBSSXg2NCJcbiIsDQo+PiArICAgICAgICAgICAgICAgcmVnX25h
bWUsIG9sZF9yZWcsIG5ld19yZWcpOw0KPj4gKyAgICBpZiAoIG9sZF9yZWcgIT0gKmN1cl9yZWcg
KQ0KPj4gKyAgICAgICAgcHJpbnRrKFhFTkxPR19ERUJVRyAiU0FOSVRZIEZJWDogJXMgMHglIlBS
SXg2NCIgLT4gMHglIlBSSXg2NCJcbiIsDQo+PiArICAgICAgICAgICAgICAgcmVnX25hbWUsIG9s
ZF9yZWcsICpjdXJfcmVnKTsNCj4+ICsNCj4+ICsgICAgaWYgKCB0YWludCApDQo+PiArICAgIHsN
Cj4+ICsgICAgICAgIHByaW50ayhYRU5MT0dfV0FSTklORyAiU0FOSVRZIENIRUNLOiBVbmV4cGVj
dGVkIHZhcmlhdGlvbiBpbiAlcy5cbiIsDQo+PiArICAgICAgICAgICAgICAgIHJlZ19uYW1lKTsN
Cj4+ICsgICAgICAgIGFkZF90YWludChUQUlOVF9DUFVfT1VUX09GX1NQRUMpOw0KPj4gKyAgICB9
DQo+PiArfQ0KPj4gKw0KPj4gKw0KPj4gKy8qDQo+PiArICogVGhpcyBmdW5jdGlvbiBzaG91bGQg
YmUgY2FsbGVkIG9uIHNlY29uZGFyeSBjb3JlcyB0byBzYW5pdGl6ZSB0aGUgYm9vdCBjcHUNCj4+
ICsgKiBjcHVpbmZvLg0KPiANCj4gQ2FuIHdlIHJlbmFtZWQgYm9vdF9jcHVfZGF0YSB0byBzeXN0
ZW1fY3B1aW5mbyAob3Igc29tZXRoaW5nIHNpbWlsYXIpPyBUaGlzIHdvdWxkIG1ha2UgY2xlYXIg
dGhpcyBpcyBub3Qgb25seSB0aGUgZmVhdHVyZXMgZm9yIHRoZSBib290IENQVT8NCg0KV2hpbGUg
bG9va2luZyBhdCB0aGlzIHJlcXVlc3QsIEkgY2hlY2tlZCBhIGJpdCBob3cgYm9vdF9jcHVfZGF0
YSBhbmQgY3B1X2RhdGEgb3ZlcmFsbCBhcmUgdXNlZDoNCi0gYm9vdF9jcHVfZGF0YSBpcyBvbmx5
IHVzZWQgaW4gc2V0dXAuYywgYnkgYm9vdF9jcHVfZmVhdHVyZXMgbWFjcm9zLCBpbiBzbXBib290
IHRvIHJldHJpZXZlIHRoZSBib290Y3B1IG1pZHIsIGluIHAybSBhbmQgYnkgY3B1ZmVhdHVyZXMN
Ci0gY3B1X2RhdGFbXSBpcyB1c2VkIGluIHNtcGJvb3QsIGluIGVycmF0YSBoYW5kbGluZyB0byB0
ZXN0IGZvciBjc3YyLCBhbmQgaW4gdmNwcmVnIHRvIGFjY2VzcyB0aGUgbWlkcg0KDQpTbyB3ZSBo
YXZlIGEgYnVuY2ggb2YgY3B1aW5mbyBzdHJ1Y3R1cmVzIGFzIGdsb2JhbCB2YXJpYWJsZXMgYnV0
IG1vc3Qgb2YgdGhlbSBhcmUgbm90IHJlYWxseSB1c2VkIG9yIGRpZCBJIG1pc3Mgc29tZXRoaW5n
ID8NCg0KU28gSSBhbSB3b25kZXJpbmcgaWYgd2Ugc2hvdWxkIG5vdCByZWR1Y2UgYSBiaXQgdGhl
IGFtb3VudCBvZiBnbG9iYWwgZGF0YSBhbmQ6DQotIGludHJvZHVjZSBhIGdsb2JhbCBzeXN0ZW1f
Y3B1aW5mbw0KLSByZW1vdmUgY3B1X2RhdGFbXSBhbmQgdXNlIGEgdGVtcCBzdHJ1Y3R1cmUgaW4g
dGhlIHN0YWNrIG9mIHRoZSBjcHUgYm9vdGluZw0KLSByZWFkIG1pZHIgZGlyZWN0bHkgaW4gdmNw
cmVnDQotIHVzZSBib290X2NwdV9kYXRhIGluIGVycmF0YSBmb3IgY3N2Mg0KLSB1c2Ugc3lzdGVt
X2NwdWluZm8gaW4gcDJtDQoNCkl0IGNvdWxkIGV2ZW4gYmUgcG9zc2libGUgdG8gcmVtb3ZlIGJv
b3RfY3B1X2RhdGEgYW5kIHB1dCBpdCBvbiB0aGUgc3RhY2sgb2YgdGhlIGJvb3QgY3B1IGFuZCBv
bmx5IHVzZSBzeXN0ZW1fY3B1aW5mbyBidXQgSSBkaWQgbm90IGludmVzdGlnYXRlIHRoaXMuDQoN
CkNoZWVycw0KQmVydHJhbmQNCg0K

