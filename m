Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2492C7E876E
	for <lists+xen-devel@lfdr.de>; Sat, 11 Nov 2023 02:22:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.630851.984010 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1ch6-0008Ls-OJ; Sat, 11 Nov 2023 01:21:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 630851.984010; Sat, 11 Nov 2023 01:21:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1ch6-0008Jz-LY; Sat, 11 Nov 2023 01:21:52 +0000
Received: by outflank-mailman (input) for mailman id 630851;
 Sat, 11 Nov 2023 01:21:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2YtC=GY=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1r1ch5-0008Jt-FD
 for xen-devel@lists.xenproject.org; Sat, 11 Nov 2023 01:21:51 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20631.outbound.protection.outlook.com
 [2a01:111:f400:7d00::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id afb1fc89-8030-11ee-98da-6d05b1d4d9a1;
 Sat, 11 Nov 2023 02:21:49 +0100 (CET)
Received: from AS8PR07CA0040.eurprd07.prod.outlook.com (2603:10a6:20b:459::11)
 by AS2PR08MB10035.eurprd08.prod.outlook.com (2603:10a6:20b:64a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.22; Sat, 11 Nov
 2023 01:21:44 +0000
Received: from AMS1EPF00000040.eurprd04.prod.outlook.com
 (2603:10a6:20b:459:cafe::43) by AS8PR07CA0040.outlook.office365.com
 (2603:10a6:20b:459::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.12 via Frontend
 Transport; Sat, 11 Nov 2023 01:21:44 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS1EPF00000040.mail.protection.outlook.com (10.167.16.37) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6977.16 via Frontend Transport; Sat, 11 Nov 2023 01:21:42 +0000
Received: ("Tessian outbound 7c4ecdadb9e7:v228");
 Sat, 11 Nov 2023 01:21:42 +0000
Received: from b22a1ebe07d2.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4E54C2D9-2ADF-4DA1-9578-0C418B5E630A.1; 
 Sat, 11 Nov 2023 01:21:36 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b22a1ebe07d2.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Sat, 11 Nov 2023 01:21:36 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DBBPR08MB10553.eurprd08.prod.outlook.com (2603:10a6:10:52e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29; Sat, 11 Nov
 2023 01:21:32 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::c64b:7a3:ac99:25db]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::c64b:7a3:ac99:25db%2]) with mapi id 15.20.6977.019; Sat, 11 Nov 2023
 01:21:31 +0000
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
X-Inumbo-ID: afb1fc89-8030-11ee-98da-6d05b1d4d9a1
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=lCshI0Mkr9LonEB6JxkW2XnE3zpuaZUUHduOLyjaot/qe2sYlKIahasP4rmmDumWPVtI9l3kESxkJ5jy7IYg9LfMmA+ypAvcfhFIl7JagU2uV0AEOmhxxEEjxj9vCl0gZVQ1geir9v+uXWas4ffcFHKAfIvCpslzSdGOlQlC+j4xYF2gmpQJqg1g89rmiBf+KOpP+D/n733KjA73lI17po5xFO/1GErqhIHC7n1XGrnx+7Q48hLxARvGAz0T2uVkaPhyu/GzACMs3IEDUMIUAFXyxqiPIv0nwOfMlIEdJBmRO/F6Jyojmww8h6KguNA+lKZEwvIHHyY64CttPCeUPA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p2sXg86LCr1N2uB6pq8vzT/TSqAl0SEi1JT9W4fYWOs=;
 b=BmB7Ug3jPhZVm9LU+/qqVsJ7lT9INqN0PBoSpGOZDKZNUU6OzCdEckv6lzwuurSaE3pxiOVR/zyd0L8lI0mtc28UzuPhxvcjWBCfQTRV8WZc8bCLmFEl7PfG30RMZJusoAQWsEfLK8oiAiK1p/oOpc6+uLRFqkxqcOBKKwxbgG4LgeeLrFlLFtUzV4LkbRPHvlxA05wpQMeZ+a7iEFeaZHThhxA1cYDLgWi0RD11xKcgqYu0SsTAGFHiypsyeN9ZJ8AQTy2EqnykNA7T8EM/S8oAEqupd8E3wfwCBFzqj4ePHxWE+Rq/KY1wZqqHAP8qKvSczAdpKKqETo4VkYvtHA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p2sXg86LCr1N2uB6pq8vzT/TSqAl0SEi1JT9W4fYWOs=;
 b=rxPGp6ncGiTFos0SQsiJdFpQHr6JAhmBfx5uUWOOJ/cEWMFu5ssK+ZukMS0e7pfFGozj9wAgYgFqd4yBbddpI2ruM+jmFDN1Nik6jsdXcZIoFEWSwSqSKOTor8Dp0NH3Fa8Cm/L+bP37BMsBrJRBafGoWKXt9pI1Xgd1qVS7pG4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: e08b4e82f44586fc
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jj9Ht1IHnsgoHYXbSM+l/6GQLBChCGHlk4Cvcx8WGlMzNyfn98tv2XMUlxrbigx/1R4TMwhKYCxU7qCJhuxpOOFmEWXGTIARPC4v53+Vs4b+cAGQggdlUFq9t6zj54KJ1DsRami8CspRUCcnkTkhLd48ot2zsmGK7fHbDR+yPp1+7HA464vaom6wUFEXPSuNkc1q0SeZGLdJSuQE/EMY+84CQrc1fVNe4VBx/BNjwJSiHzN5pcDFsCmcGIbXZGk16OCKBFswqCTDlkd3P2tsZdW/fGEbKTSFeQVpiyqMYlIBu+bPS+nuIc/VUzrf12ERIQPybdX1rZF/WzbQ1zMlFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p2sXg86LCr1N2uB6pq8vzT/TSqAl0SEi1JT9W4fYWOs=;
 b=TzzpFy+OhQC6OUZuznKaYwKHu5Wzitm7fBUeJmlyrKAGC9CnB7HlahKzeEFexCLzJLevSrXvxNyBdrPjm+1myRpp8glJm+KVC1z8gjD3ixa9JBh3JRzfETkwPXV7exWKE4OelnfFM1FJtKH8qZ5UbL+7jSf/z5eGqxzT3+MnDmqjlvFFUw40IP0lP2EoDFak3+NNtt9XJYofjP2V+h7KzLo27vNNjtASLyyOAMdzi+kfSwxdpoNpoB2E4JmRpy9PwGJQtXidhutkonU8uF23mEEbQgnK46Ki5WrFAUUSzP1+tTdT/OFeYobCoRKtXp1J9xxkiHit/e9i679t1CY+Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p2sXg86LCr1N2uB6pq8vzT/TSqAl0SEi1JT9W4fYWOs=;
 b=rxPGp6ncGiTFos0SQsiJdFpQHr6JAhmBfx5uUWOOJ/cEWMFu5ssK+ZukMS0e7pfFGozj9wAgYgFqd4yBbddpI2ruM+jmFDN1Nik6jsdXcZIoFEWSwSqSKOTor8Dp0NH3Fa8Cm/L+bP37BMsBrJRBafGoWKXt9pI1Xgd1qVS7pG4=
From: Henry Wang <Henry.Wang@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>, George Dunlap <George.Dunlap@citrix.com>,
	Wei Liu <wl@xen.org>, Julien Grall <julien@xen.org>, Xen-devel
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH for-4.18] docs: Delete kconfig docs to fix licensing
 violation
Thread-Topic: [PATCH for-4.18] docs: Delete kconfig docs to fix licensing
 violation
Thread-Index: AQHaElHr9CpuYdM9HkyTsf3tvq3kirBx21iAgADRkYCAAXSpgIAAGY8AgAAa+wA=
Date: Sat, 11 Nov 2023 01:21:31 +0000
Message-ID: <8999EE57-3241-43B9-9424-8F23128B922B@arm.com>
References: <20231108143751.49309-1-andrew.cooper3@citrix.com>
 <a6f54856-f0e2-a2ef-5cbc-900ed87c5d31@suse.com>
 <alpine.DEB.2.22.394.2311091558380.3478774@ubuntu-linux-20-04-desktop>
 <a162733f-859f-41ce-8575-89b0e2cf702e@citrix.com>
 <alpine.DEB.2.22.394.2311101544120.3478774@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2311101544120.3478774@ubuntu-linux-20-04-desktop>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DBBPR08MB10553:EE_|AMS1EPF00000040:EE_|AS2PR08MB10035:EE_
X-MS-Office365-Filtering-Correlation-Id: d3932e27-be65-424a-6031-08dbe2549051
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 71bxVc7DyiApnbcRlgQNAtcAAURfhJWdSBWEj3LbpGu8C+gd2w7c9VV9ye2vOkByYQGlzjDCFZcTjvp3RYW2n+YLy0QYA8+o/iDw8EZQWxGBhkLscmCMLxdMGu9eI38lvuRBg11FijXcxM/WIS+Ak9gOoSzf4Fvijku8VREs/0FPF/0afRYSBE3jlZ4bJu8muQFjTF87x14xBFKMP9Syb6T6yFVjxhb9Z5efEPBJfNfVa44rhyyf3fHqyDLn2FOWhwWIidaF8Ep30ReKl+d/n9sbeuEezP8us88jPaz2tDhDNuf2fXrWll/EF2wJMG7xeImb/aBjkFZc3m5GSBCsd6C/jNsb2DfP3vzwQqvJEIyN0OTbR/kO68COr3xDQbl4q1TG2CW52CS+8X8O+Ze4573WTtXFTTLNg5MMZyU6wa3HqOCduxWbVgiSlHjp6a58e6zG0Vu/PH4BKsj5tXsElmGV4kIcP5KONzQQIrmyQMHIykKo/ykQBnrfpALarMXIyIa3K+s1jWX7o/YGsStCJ7aJ2DYkdkZXUEoiIPWsSs0FVXU57nCnhYr7oJKA2NJ7Ct3gCjamUAHUvH7PGCaGljNO825zadnJbNcgt/3idHpAj7QyqgvnrX/LjK1qqUYfcLQ7ZTRqVHKoy8rz8w/3dw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(136003)(346002)(376002)(366004)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(66899024)(478600001)(966005)(6486002)(64756008)(2906002)(122000001)(38070700009)(33656002)(86362001)(83380400001)(38100700002)(316002)(6506007)(66556008)(66476007)(66946007)(91956017)(66446008)(26005)(2616005)(6512007)(53546011)(54906003)(76116006)(8676002)(5660300002)(8936002)(36756003)(4326008)(110136005)(71200400001)(41300700001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1E688BB004C3724BA76D83F89033F642@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB10553
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF00000040.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3c9cd3eb-7083-42e0-bd59-08dbe254896e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dq5H1OHgDArz4d+fnEeHRpipOIU51LE1xhBlSrc9stMSXJhS26d5UVOQfJumjV/nyhdQC1C3bLbSALpBrGvPnRNdLZ1sdV4xOph2SE+OOsPRRSenyMbH6S8l4DMZo9M+Ug5mri7qrmMX/5K5w/W8KCePCrlmZOnFczzOYdxhH8YXrCmapgXg7KOgnhOep56Y1jeAK4mWNnDIRlGjPwV9BTIPnMgAo6DVI/n2+29+iOYxJp7OETCmSID4TX1Zh/8y6duCnlsCsAHRUB7JQkB53ORHIYrw/sET8hGv+KvbgTaKKidbn5my6IT/Nrf+ZN+LwOYtMBkIWTZ0ukVoTbhGxlwQ+2LrKV/MqAGSMPmJBWW8ui03S9peU+PNcKwCJkKTi1cFfNKMkugfwES1em5VJdCyuu5FMR5FQKP5kNXDw0FkssiVpIEwo8Knq4YhkmIufo9iwJBlqmg6h9btZxIP3k6xRwUFljpUckq0CpqFoVo5RVFT72rPqTdQWsqfeYimsHJMHshnNW2zaWtlPjfhXLQWKCpqBrJn5IPN7fRMD64Bg8tBXyX2Wa2PTMpkijqUyQSyq3USl/QwmTgj7AReFzZ7eFK70071AKB1Piet5TcDJ5oqCCch5sDk/KFsLeA7KcmpE2FPhXGksv2jXlBPUewV2qbGjVXYZDVcUUD0BvybWHhdzuE3+UTJLzeh2MzCtZhapTrHkbXbqvM0Gsg5femoQEj08QXJCTHdT672hJ4=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(39860400002)(346002)(136003)(396003)(230922051799003)(82310400011)(451199024)(64100799003)(186009)(1800799009)(36840700001)(46966006)(40470700004)(40460700003)(66899024)(36860700001)(36756003)(2616005)(86362001)(966005)(6486002)(478600001)(6506007)(33656002)(53546011)(6512007)(82740400003)(5660300002)(2906002)(356005)(81166007)(4326008)(8676002)(8936002)(41300700001)(316002)(110136005)(54906003)(70206006)(70586007)(47076005)(336012)(83380400001)(26005)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2023 01:21:42.8970
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d3932e27-be65-424a-6031-08dbe2549051
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000040.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB10035

Hi,

> On Nov 11, 2023, at 07:44, Stefano Stabellini <sstabellini@kernel.org> wr=
ote:
>=20
> On Fri, 10 Nov 2023, Andrew Cooper wrote:
>> On 09/11/2023 11:59 pm, Stefano Stabellini wrote:
>>> On Thu, 9 Nov 2023, Jan Beulich wrote:
>>>> On 08.11.2023 15:37, Andrew Cooper wrote:
>>>>> These 3 Kconfig docs were imported from Linux erroneously.  They are
>>>>> GPL-2.0-only in Linux, but have no SPDX tag and were placed in such a=
 way to
>>>>> be included by the blanket statement saying that all RST files are CC=
-BY-4.0.
>>>>>=20
>>>>> We should not be carrying a shadow copy of these docs.  They aren't e=
ven wired
>>>>> into our Sphinx docs, and anyone wanting to refer to Kconfig docs is =
going to
>>>>> look at the Linux docs anyway.  These, and more docs can be found at:
>>>>>=20
>>>>>  https://www.kernel.org/doc/html/latest/kbuild/
>>>>>=20
>>>>> which also have corrections vs the snapshot we took.
>>>> Imo this reference ...
>>>>=20
>>>>> Fixes: f80fe2b34f08 ("xen: Update Kconfig to Linux v5.4")
>>>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>>>> ---
>>>>> CC: George Dunlap <George.Dunlap@citrix.com>
>>>>> CC: Jan Beulich <JBeulich@suse.com>
>>>>> CC: Stefano Stabellini <sstabellini@kernel.org>
>>>>> CC: Wei Liu <wl@xen.org>
>>>>> CC: Julien Grall <julien@xen.org>
>>>>> CC: Henry Wang <Henry.Wang@arm.com>
>>>>> ---
>>>>> docs/misc/kconfig-language.rst       | 701 --------------------------=
-
>>>>> docs/misc/kconfig-macro-language.rst | 247 ----------
>>>>> docs/misc/kconfig.rst                | 304 ------------
>>>>> 3 files changed, 1252 deletions(-)
>>>>> delete mode 100644 docs/misc/kconfig-language.rst
>>>>> delete mode 100644 docs/misc/kconfig-macro-language.rst
>>>>> delete mode 100644 docs/misc/kconfig.rst
>>>> ... wants putting into, say, the last of these three files you delete,=
 as
>>>> a replacement. I can't spot any other place where we would have such a
>>>> reference.
>>>>=20
>>>> One problem I see with deleting our shadow copy is that by referring t=
o
>>>> Linux'es doc, the wrong impression may arise that whatever new feature=
s
>>>> they invent we also support. Thoughts? (If nothing else, I'd expect th=
is
>>>> aspect to be mentioned / justified in the description.)
>>> I think the ideal solution would be to replace the shadow copies with a
>>> link to the Linux docs of a specific Linux tag (v5.4), instead of
>>> generic Linux master. I am not sure where to place the links though.
>>=20
>> I don't personally think we need to keep any other reference around.=20
>> They're not interesting, because they're not going to be found by anyone
>> except those who already know they're there, and won't need to refer to
>> them for the kind of content they provide.
>>=20
>> Kconfig isn't a fast-moving target, and there's nothing new in Linux vs
>> what we've got here.  The only interesting difference between us and
>> Linux is the fact we don't use modules, and we didn't even strip that
>> out of the shadow copy.
>>=20
>> We do have xen/tools/kconfig/README.source which states where it came fr=
om.
>>=20
>> I could be persuaded to add the following hunk.  What we have isn't
>> precisely v5.4 anyway - we've got some reasonable differences in the
>> makefile side of things.
>=20
> The below is good enough in my opinion. Ack.
>=20
>=20
>> diff --git a/xen/tools/kconfig/README.source
>> b/xen/tools/kconfig/README.source
>> index 44631f68e8..ac394106b9 100644
>> --- a/xen/tools/kconfig/README.source
>> +++ b/xen/tools/kconfig/README.source
>> @@ -5,5 +5,7 @@ in this part of the Xen source tree.
>> =20
>>  xen/tools/kconfig
>>  -----------------
>> -The kconfig directory was originally imported from the linux kernel
>> -git tree at kernel/git/torvalds/linux.git, path: scripts/kconfig
>> +The kconfig directory was originally imported from the Linux kernel
>> +git tree at kernel/git/torvalds/linux.git, path: scripts/kconfig of
>> +roughly v5.4.  Linux's documentation can be found at:
>> +https://www.kernel.org/doc/html/latest/kbuild/

Release-acked-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry


