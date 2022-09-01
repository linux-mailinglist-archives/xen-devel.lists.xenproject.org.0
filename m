Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9AB95A98DA
	for <lists+xen-devel@lfdr.de>; Thu,  1 Sep 2022 15:31:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.396620.636825 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTkHv-00051G-DV; Thu, 01 Sep 2022 13:31:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 396620.636825; Thu, 01 Sep 2022 13:31:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTkHv-0004z8-AQ; Thu, 01 Sep 2022 13:31:19 +0000
Received: by outflank-mailman (input) for mailman id 396620;
 Thu, 01 Sep 2022 13:31:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WzPc=ZE=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1oTkHt-0004z2-Dm
 for xen-devel@lists.xenproject.org; Thu, 01 Sep 2022 13:31:17 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2063.outbound.protection.outlook.com [40.107.22.63])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5aa24c8d-29fa-11ed-82f2-63bd783d45fa;
 Thu, 01 Sep 2022 15:31:16 +0200 (CEST)
Received: from DB6P192CA0022.EURP192.PROD.OUTLOOK.COM (2603:10a6:4:b8::32) by
 DU0PR08MB7924.eurprd08.prod.outlook.com (2603:10a6:10:3cb::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.10; Thu, 1 Sep 2022 13:31:14 +0000
Received: from DBAEUR03FT038.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:b8:cafe::be) by DB6P192CA0022.outlook.office365.com
 (2603:10a6:4:b8::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10 via Frontend
 Transport; Thu, 1 Sep 2022 13:31:14 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT038.mail.protection.outlook.com (100.127.143.23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.10 via Frontend Transport; Thu, 1 Sep 2022 13:31:13 +0000
Received: ("Tessian outbound cc6a8ab50b6b:v123");
 Thu, 01 Sep 2022 13:31:13 +0000
Received: from 0f2a2c4a323b.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 78AC8784-0C6E-4949-812D-98E3458839C3.1; 
 Thu, 01 Sep 2022 13:31:02 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0f2a2c4a323b.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 01 Sep 2022 13:31:02 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by PA4PR08MB6078.eurprd08.prod.outlook.com (2603:10a6:102:e0::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Thu, 1 Sep
 2022 13:31:01 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a%4]) with mapi id 15.20.5566.021; Thu, 1 Sep 2022
 13:31:00 +0000
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
X-Inumbo-ID: 5aa24c8d-29fa-11ed-82f2-63bd783d45fa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=XxW+SG3yDMIqOsUNRLYT9wq2ni/Z/afG6ZDHoPhLXw52urixfCmM+y81iYR7EBtT8wxjUZXb6nuUL4gTZikqwaVaJLFRBvIAkRQNhomOStetdso7XewGO5Ves3MDWcjqea7aN7XYPSluoR4TFvR5jUHfB3xHoPcZMXYnsUPqFpyjL/XokYK6Rc6bzQJdfwrg5EG2c/sJYS1l0weBKR2RNXoymDPOt112tfmnZY2QNF/tP+m8K8UtEOQJbi71uNcJZVc+9xbPWd4tsCMnZt71EzBhtT4d98YVXmCqS8/LvW90QUiN9c0hZpNYnwmv3ynwGWdnuyZuac51xHbX3ukRrQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+7aZtzP+3fVzOx9U/mTHQ45+BhoOndlAfsLGSne//qs=;
 b=XXnXOmNiRQzcJZ0CAQCtJLKelLWxNKt722Ch7rVNcHxEaUGVIVtamHnWEJ2TC2v8NKRxh3euB9SGOScVyqzRF3PXC3bdN/0euc7eGlw4j9WCnbKgJe+65LCgq5EUi7MsaIMMZioUoSStKofk7IyoCYzUQaHcqWJKIZIFcQ4GTcyEwgLJbxs4nehzMr7ZLT6DjZsIk/aYb+DwCpWpETX80MvPAmsWLPueJ58rLJMxADQqVR+X+BgMsKuwfTIlr8YbwiELtG9YEfiIW/eaDBWJ3nbAoqhUqzhMZzb8VeYAfghGv1yw8gIfYw/ybEfEVOkfeZcwoVctz59+vY9mjqkc4g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+7aZtzP+3fVzOx9U/mTHQ45+BhoOndlAfsLGSne//qs=;
 b=mS8EQP2r8lir1h0kGPnRD2agNn1uygb5w1Kwl0pbt2AHq2s0GzDuqgM/hX31y0U9idMcKVtnu029GZ15n1ooAXp13/M+zRfRonDSAF5lFJl0efyongRrNy58bmemaQ0KQ4jY2QWNpq9tnU9Ni1fyiRszipm0EJ3dsa4MQ9XQKsQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5f7059b396cb72ea
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QfVKmqd0DvpwgEdq6NmWsRveHgPknJ0bWrt5B7Zhh77nspr8oHZLg7Ane9GFwxIEq8DVxV08nRU1/iBK5UmCtrd8lcRLi4wz4EoDq+L4/4YDfncVrm6EYAwcH6nfewzAK70kHPy+xxvG2S9wfS1Bxa0byrXkWo1qEfuI7jkdjSixsX3k8wcKGCzOERuuRDpkkjTIyeA9QLGDuYZwO2RWl+cenwGQ1Pt+ePFarFoj6W/3EiI2LDL1gp1emNcFhls5uOpGG0wETfey8x8rfTBmLN/fSScwwd9BWTfTDkBRrdk8YyhnxwVtRHD8MZCU3FGYkKocG48leBxRXl4pFUFp8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+7aZtzP+3fVzOx9U/mTHQ45+BhoOndlAfsLGSne//qs=;
 b=QfANCKfkVwf/M5u3qcHTOt4sagFqdD050S2E2OX5joMKUu+6f1zqHGmET9U+k+lcnFtYsLVS4hc39zxEyWbivr8aJaO4U04mSqveBGMmB0Eh/NbIl/0dD/eto5GAYJcFdMwCagH4rpRWBa1Xq1Hu8vai9hzPKnEpf+2j6RAcgWVYoBOh/mj1HPlxXE9Hzfm1XX9wc4e5/Mra96l5u1Ark3AV9Qg8XW7ogfWsH4v4Dke/33NzGYADxhSB1wqq/7ygVEQ14J9wsoL69RveBQq56XKZcu8m2J/I34IfDX+q7zvSSegT2KVvr30rhi0837P2pxHj8ToYBAe0uIb6vVWQFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+7aZtzP+3fVzOx9U/mTHQ45+BhoOndlAfsLGSne//qs=;
 b=mS8EQP2r8lir1h0kGPnRD2agNn1uygb5w1Kwl0pbt2AHq2s0GzDuqgM/hX31y0U9idMcKVtnu029GZ15n1ooAXp13/M+zRfRonDSAF5lFJl0efyongRrNy58bmemaQ0KQ4jY2QWNpq9tnU9Ni1fyiRszipm0EJ3dsa4MQ9XQKsQ=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Henry Wang <Henry.Wang@arm.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Wei Chen
	<Wei.Chen@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Michal
 Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH 2/2] xen/arm: Handle reserved heap pages in boot and heap
 allocator
Thread-Topic: [PATCH 2/2] xen/arm: Handle reserved heap pages in boot and heap
 allocator
Thread-Index: AQHYt4ugdSSmJYfbb0KQ5sTlqjIZuK2/e0SAgAeENACAABMngIACu6WAgADQygA=
Date: Thu, 1 Sep 2022 13:31:00 +0000
Message-ID: <FC0864E7-C6A7-48EC-99F1-FD2881377534@arm.com>
References: <20220824073127.16762-1-Henry.Wang@arm.com>
 <20220824073127.16762-3-Henry.Wang@arm.com>
 <59f69736-a18c-9d08-94dd-791bd264d671@amd.com>
 <AS8PR08MB7991CD1C466399A96B7F45C392799@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <bc5eb855-0137-130b-e30b-7f4417798a93@amd.com>
 <GV2PR08MB800143A62FFD20D318D66947927B9@GV2PR08MB8001.eurprd08.prod.outlook.com>
In-Reply-To:
 <GV2PR08MB800143A62FFD20D318D66947927B9@GV2PR08MB8001.eurprd08.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 094ac9fc-1337-4e7e-7970-08da8c1e3db6
x-ms-traffictypediagnostic:
	PA4PR08MB6078:EE_|DBAEUR03FT038:EE_|DU0PR08MB7924:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 mCLgH/Pk1cgLV+PrIuAabAbgtzRxD1nRMibWifPJlNh2bw/pbajX7uCXy577gVtkA9GqHcSFSglyT25Hb9H3olkfQY5lEjLv8modn6HJxzwbjfIZu0Rqr6gz8EkifMvI8fQC5bmWi6UvdTq5R8595tFpclMAdfEqwkMj047zOYM/+ZiA1PCxlxy7J4VPyc5EN6mEmizX9Nqz7lEpylc72QIOos9+8lSbQRBL1szciEgc8uR+tT8LaLENcMDnGc+Wl9Y40rc6IjcTXU2QhViyAsg2vxnQVquOikSpFJ6zQN7A6w9O2Vln0cZCrrDZ81ESquoazfr/JiYAnAlkbqeur5C1+LeNOXGKE8d4AnXfehmLBSTmcFDdEFLFdZhF/fQeukazOC02JOFM8nTBKjwSodJZ9uXsh18M+WbYlQMWAxSgvkYkWbtBf9p29dSXh4uKxtjjrmbM5EUdxZz5VkQUnJDy+kFlscIbSKAq7llPzYfQALJNGOEJKl3vPcwYmLOtJqIVxyOIGMWSKqXCuLi+WWn3HMcuojq54aiZj2mPtmHYfwngjOcUdrxh37CFDhcw8mfXC7pxCd8CmE0rw2J7NDTK7gG1xdml3bg7cX/uJhccsiTve8ZuOtV4nzHLo4fIIdw2EB+i4kiv7332wFy3skxzd+b5aLkSjP6aLgAxmDyD0+pkBVOhfdZQ+GL6VwpeUvUMyURoAVRmfNUnnWiL82nVWiq1GDg/dxnZ43aeBgr4Td/E60ZwCe/wNNYfcFLiken9N3y0nFm1CM4n+IQZ6GuV8CVkYimLx5gXCCvxtEU=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(136003)(39860400002)(346002)(396003)(366004)(86362001)(2616005)(38070700005)(186003)(6506007)(83380400001)(41300700001)(53546011)(26005)(6512007)(38100700002)(122000001)(54906003)(316002)(33656002)(91956017)(6636002)(5660300002)(8936002)(6862004)(8676002)(2906002)(36756003)(4326008)(66476007)(37006003)(64756008)(66446008)(66556008)(76116006)(66946007)(6486002)(71200400001)(478600001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <14BC774AAB1A8146B2397CFDD699CB56@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6078
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT038.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e6831f79-3324-4bad-e887-08da8c1e35ea
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cwaHtnjTLjVFVOWdBFB+0aTXC/9VSnVReS9rQF/q6mdS0ZCEULhpNDYpheiAylJNoV0GAlfOb/Tfs9+EKzDjMPM61CDqjsxraWIR2DLnM736WjABDYktFR5hH/WtUkuCvBJSW3OzjBUwMnPt37S7FVVwLRwMAJPbYKwA45dKHsUpc6E2h8Gj+VwkkkRcixvHJmfnCPNT4jYGTFodKyXQb83l98GrK4G8QC85ReUU1oFHQ0DZBXRKvYQMGPSv3pekowKFziSjJY/r0ZXSKzkOhurdltDibiu1ceqysCCxFgnrmq9SqGyj1vS//EbTjnT+rHXmst19oCDYepz+HtiygdI1RBKWSlLlQb+G/Noo7538NVTaCHNVWSHHK3H/vqSAAIyA95fpQCcqyP+rGC3/F8cqGxRAtjLI13p5bMU1o/Zvy/JrG0GkK8EaTzeLrto2oAPdcQMlao4NYAYCT+fGxc6Iosu1WCsZvLZq9bOsqHaLBY9y9tSaPgqJk6GpoqEbMtQLrlavesYbecHF1DT/XkUwFLAwwEvrqZs3ddXldV+jh2A9VHieiyQBOVsP6TAFff/H7RmouTakHvVA/C6dlA8nANYMDQMll95WpMJ5r+dWKukPivlJGRlZA6Woa5BbKuZsJs6gOK/xtp5P5TqTpEjiBdGODwdVr2hYlj4Vk131lRFOkrJzNa3/dZPfgt+7Ie+rn1FhkFPIBeZiRedBfcsBocr6MeTnRdHx8pgn6Ez0Dsaym3ROFc9x1zKEEWOtwr06RMzltG4gMhTooMF1WA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(396003)(376002)(136003)(346002)(39860400002)(46966006)(40470700004)(36840700001)(82310400005)(6506007)(53546011)(47076005)(5660300002)(36756003)(41300700001)(83380400001)(6862004)(40480700001)(8936002)(36860700001)(6486002)(478600001)(8676002)(4326008)(70206006)(86362001)(82740400003)(2906002)(33656002)(37006003)(70586007)(54906003)(336012)(40460700003)(26005)(81166007)(186003)(6636002)(6512007)(2616005)(356005)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2022 13:31:13.8622
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 094ac9fc-1337-4e7e-7970-08da8c1e3db6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT038.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7924

Hi,

> On 1 Sep 2022, at 02:03, Henry Wang <Henry.Wang@arm.com> wrote:
>=20
> Hi Arm maintainers,
>=20
>> -----Original Message-----
>> Hi Henry,
>>=20
>> On 30/08/2022 08:11, Henry Wang wrote:
>>>=20
>>> Hi Michal,
>>>=20
>>> Sorry about the late reply - I had a couple of days off. Thank you very
>>> much for the review! I will add my reply and answer some of your
>>> questions below.
>>>=20
>>>> -----Original Message-----
>>>> From: Michal Orzel <michal.orzel@amd.com>
>>>> Subject: Re: [PATCH 2/2] xen/arm: Handle reserved heap pages in boot
>> and
>>>> heap allocator
>>>>=20
>>>>> This commit firstly adds a global variable `reserved_heap`.
>>>>> This newly introduced global variable is set at the device tree
>>>>> parsing time if the reserved heap ranges are defined in the device
>>>>> tree chosen node.
>>>>>=20
>>>> Did you consider putting reserved_heap into bootinfo structure?
>>>=20
>>> Actually I did, but I saw current bootinfo only contains some structs s=
o
>>> I was not sure if this is the preferred way, but since you are raising =
this
>>> question, I will follow this method in v2.
>>=20
>> This is what I think would be better but maintainers will have a decisiv=
e vote.
>=20
> I think this is the only uncertain comment that I received during the lat=
est
> review of this series. I agree that Michal is making a good point (Thanks=
!) but we
> are curious about what maintainers think. Could you please kindly share y=
our
> opinion on the more preferred approach? I will do that in v2. Thanks very=
 much!

I think it does make sense to put this in bootinfo.=20

Cheers
Bertrand


