Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6655AD1E0
	for <lists+xen-devel@lfdr.de>; Mon,  5 Sep 2022 13:55:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.398767.639710 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVAgk-00026e-I7; Mon, 05 Sep 2022 11:54:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 398767.639710; Mon, 05 Sep 2022 11:54:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVAgk-00023b-Dg; Mon, 05 Sep 2022 11:54:50 +0000
Received: by outflank-mailman (input) for mailman id 398767;
 Mon, 05 Sep 2022 11:54:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PPTu=ZI=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1oVAgi-00023T-TY
 for xen-devel@lists.xenproject.org; Mon, 05 Sep 2022 11:54:49 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2085.outbound.protection.outlook.com [40.107.105.85])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 89e7a6a0-2d11-11ed-af93-0125da4c0113;
 Mon, 05 Sep 2022 13:54:47 +0200 (CEST)
Received: from DB9PR05CA0005.eurprd05.prod.outlook.com (2603:10a6:10:1da::10)
 by DBAPR08MB5701.eurprd08.prod.outlook.com (2603:10a6:10:1a6::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Mon, 5 Sep
 2022 11:54:41 +0000
Received: from DBAEUR03FT039.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1da:cafe::88) by DB9PR05CA0005.outlook.office365.com
 (2603:10a6:10:1da::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.18 via Frontend
 Transport; Mon, 5 Sep 2022 11:54:41 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT039.mail.protection.outlook.com (100.127.142.225) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.10 via Frontend Transport; Mon, 5 Sep 2022 11:54:41 +0000
Received: ("Tessian outbound 2af316122c7a:v123");
 Mon, 05 Sep 2022 11:54:41 +0000
Received: from d1b8e7878359.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B7E1B622-B00A-4C94-A5E6-A6604F9FE171.1; 
 Mon, 05 Sep 2022 11:54:34 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d1b8e7878359.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 05 Sep 2022 11:54:34 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by PAXPR08MB7622.eurprd08.prod.outlook.com (2603:10a6:102:240::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Mon, 5 Sep
 2022 11:54:33 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a%4]) with mapi id 15.20.5588.018; Mon, 5 Sep 2022
 11:54:32 +0000
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
X-Inumbo-ID: 89e7a6a0-2d11-11ed-af93-0125da4c0113
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=b1klfK46kUbtDP246cEsnGm4dU6EHHmpy94pRy1AKZFq+WRKBne3pG1GM4aOsPjHtq0PSNpGI5gqx5KFhQQ/iE6SUQdG74BMH8UNdVK0I0XpHwrCNYg4Zq61xTEgrlroaHh7iw9Uvh6+v5mYvfNd+v8yKe2ZH9PVi/d8Lv9E96pd/DOv1fT/b99Tj6oFcmzfXa2AxXdKM117rLi2Oe0+/GVk8wMDaiGoQHo997CI2CHpbbgCB2LAZdrgyu3Ral0Exy/+sfV6P3abCK9SPjKc2p5MnuRa4o3AM9NShQg5vRcPyNPdXMcDXP++YGES25q6meAV3awYdbjbX8omUKOdWg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gWAtu2dRfS5JQG8mucNPIuH9nckkItnfdNbwzyKRpZA=;
 b=Mldw94TdYe4fEeI6L2fplEJkmveYSNs9LkiHESl3fMGIKn8ACRWKZgxyo4traE4T64np1U7dchyDftPyM0bFJEKail6b35hXL0Z8oaZs2Qydw9Dq4C39XE5/wSCUHtEc1UHguX8GB+zwx4boox5lSdX1OpQ8VFSLKycTtnS2yDiOv6P/cPfg+ipRhi3mXhrhOugQLM0NxqvsUPLOqa27wUIHVNEZa+8zE3PwNolBHK6KLzlVk8f5NL+jFlPbMn6+bsANwAneWQjryeH4dulzE+syO/Q9bQhjQfXAWgufpELv8t+XbhaLC+Y2GWHCCchjNMk//SQF5QEmcOHzbAngvQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gWAtu2dRfS5JQG8mucNPIuH9nckkItnfdNbwzyKRpZA=;
 b=4/DGfCpkE7V8qnWuWa8VufCJPZwJeYG4Ydbs8UQiBuyydbx0qHmbQwVyDC8F2HAfzHkw3uFikNe1iD5Zej914h6wp/vmzi+5pDCFs+XLJsgvg8PlFKfbdUmfEmhXhNXpAFJhQEEw3OQV8sItRczN02V1mSdD8vhmQKuGrVeI3tg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5778ae41984c9e32
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gOwdmx5bFLwlPFE7D11NQJztYowm+6xurfXI8znbuK2zmyVyfBOE64oUl4jIjKOaWQZUqmXUqbLhtvye6ApvJSTiBZdoEyRrdKC25CDG8NNZXq87AKGCphKK0+j1f7KJKDV+8T5tfvGovgDDisCOdQHkUEP3W5e/65d0/aGPS92igOTEjF+JXuN8+7E8Ytr1NZvndRziP6GiRAUgzJVkbl3MBXu1yFz5ABNvm4XIlgZYXnuySargWA8md/pf2uxGG3Mt0bGasRlAmdVNEkcPD+jwHjd+c5Ud8OBf19Mb67Rulv3ehxXww+MI0BfZO79X1Pzq9xo/hyr99DLCdo4YFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gWAtu2dRfS5JQG8mucNPIuH9nckkItnfdNbwzyKRpZA=;
 b=C157JP1Ctv8CSs5HUdVWO2H0smWypnIQ30kV1slJ0F5Ml7yoOXGodsaB1i8YCeE58vGM8V+ZKhCyCeHQ1dHwxvBSJJvqHS4uaBhOTKlAlvNYXwXrN0cbj84NM6CihxaLCV3xBeIJzWzqXt4sLsjoruZmSA8yawAAjpCqIGeRGbKCnnyueMSOuajDtGt4eONQIWNH3kBaylnqkw9Wsx3J9j3AXjtDxnB5UvuXqBzuxXlL9yL4rjvrHgHb2XxCS/a1EPFBiFO6fyN6/Moctw/pDQRV0aj4ezWPhdd3VUt2WnuYnFbneatbu/cdR6A546MLnp87G/jtMN0iJpaKc3SYnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gWAtu2dRfS5JQG8mucNPIuH9nckkItnfdNbwzyKRpZA=;
 b=4/DGfCpkE7V8qnWuWa8VufCJPZwJeYG4Ydbs8UQiBuyydbx0qHmbQwVyDC8F2HAfzHkw3uFikNe1iD5Zej914h6wp/vmzi+5pDCFs+XLJsgvg8PlFKfbdUmfEmhXhNXpAFJhQEEw3OQV8sItRczN02V1mSdD8vhmQKuGrVeI3tg=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Rahul Singh <Rahul.Singh@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 7/7] xen/arm: introduce new xen,enhanced property value
Thread-Topic: [PATCH v3 7/7] xen/arm: introduce new xen,enhanced property
 value
Thread-Index:
 AQHYveOAeMLlOwX5Mka7ZrpAabJW7K3K4ewAgAFZKACAAAQoAIAADY8AgAAHN4CABGESgIAACJcAgAADEoA=
Date: Mon, 5 Sep 2022 11:54:32 +0000
Message-ID: <6B0D4F4B-C7CC-4C04-9BA4-71976CAA82C5@arm.com>
References: <cover.1662023183.git.rahul.singh@arm.com>
 <d8dae49b05e6c59715016e0995b1275f3cb6e7fc.1662023183.git.rahul.singh@arm.com>
 <28b9679c-8223-ae71-d629-4ec31a72dcb2@xen.org>
 <36A408C8-36C5-4A39-80B4-F564445635C7@arm.com>
 <616b36ec-5a42-cb9a-2131-3aea1bec7c67@xen.org>
 <46897765-5063-49CE-8A8A-F4DA50570A08@arm.com>
 <a669182c-dab1-35b7-9bf7-caac1813e3ad@xen.org>
 <C27FD0DE-D8FA-4A67-AE0B-DF4030A65127@arm.com>
 <a14b4d4a-5ae6-4af0-2d00-49bbc688cd4a@xen.org>
In-Reply-To: <a14b4d4a-5ae6-4af0-2d00-49bbc688cd4a@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: d7ae3801-ea31-45e8-8dfc-08da8f356ab2
x-ms-traffictypediagnostic:
	PAXPR08MB7622:EE_|DBAEUR03FT039:EE_|DBAPR08MB5701:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 IWXIcc+XADgeXaLp+3rpIa/vnCGQxun8On4OKCcVcjoRKmjbBvDzB6cGyrH243yHscfMFNS3k4pe+dO2YcmMaKha0ZDCoanxLYibF69ltUYGWgN90bQHNYKOzLJA5+sShsmy2aB0pLwV++1hP3NvAJKmgrsi0VS6c1udQH3g75ae3WfHzYIsSbigYXXs/X0ehbDCbjDKWXI/nTrwshZ6lxg0xCwlZM+XCe/rkKls3pKvrPqxqSI7TQLitDXl0D1eqcPH8Gze7B8NiZUoc0jZikFGKcYDoSXf2q2LiBEx/gP5hQdHnz9J17x4mTfrV7oMpQ7FDQECoY+Ptz1ZeW+ESHg63CzvATVbgXlus8DETbLMyFbvpaVhoAuj/ZfaWtgCdskI/hvPav5elxKnw/GBR+NWXQh/h/Eas5ms2rGeoiCYt9bInG4vdesr/0qV9fRPn9e5VQppgnpYm8aCqb2M0zObQQyhLjTaEGE4h5J+btIMVFv9ukPd8HsoCDDjM15HKjS6spvRVVVZoRfyJZS2ax9a8w+DktHgLqoSmi6+UKoe8+gqlGjNyQpi0LFxfxit650vAahtfPvSijZg46xW5kPFOB+8abJwcGD4fV4DP4adRdB0EKJ9FPyVyRB858I3uuMo5qaokeKWvBv3234nQJ/Z0ZQMs/VPZQjAU+DHZs3VkaznIcvLdzYLFaHXvivgHR2r02jYQ2kUkLVJ3yd8wBcjtvMTpveBKHibiJKYbTIv4qJviJGlAkdDhDYGZBduBy+qkTbu/rlybw7JwnEDyeEjUjqNERVY8AAEOuRV81c=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(366004)(136003)(376002)(39850400004)(346002)(316002)(91956017)(4326008)(8676002)(76116006)(66556008)(66476007)(66446008)(5660300002)(64756008)(66946007)(122000001)(38070700005)(6512007)(478600001)(26005)(6506007)(38100700002)(71200400001)(41300700001)(6486002)(53546011)(36756003)(54906003)(6916009)(186003)(86362001)(33656002)(2616005)(83380400001)(2906002)(8936002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <9337BC55D06EA2489DD253D92D4051B9@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7622
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	1a88275a-98a9-4e5a-1286-08da8f35653b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LSVGYPYAloLZsXhH5PKcAFpR5dFUpPKzc4HHth/5N1gG7H8HGBclLr89jkZ2uz/Zsef34zAyC15wtHoAymAANX71vQJV3tkopk2c1VwGHZLpPlcLANiRf2pvrWOfLexydfBZ1UHl1agDHSwq5RFWLf2eqqKG209p5FwqP+Ygx9EKl8AXVerBsR0Knc5Sa+rG8n52rOelhOjxCRgPGSxBYJcUrhXLOUzXtKse9wMhM9AY4U2HyYZfy5/n4lIYSXqs7qhn5PBlpgx8aYuBwLO3mzII/klJkATG5CCribk/blYjpdJ7COaZTvGP2GFfbbqAtoQfMpoucR7WDHJVYSp6u1FWBJz0oLKZ3OT/WgCR4r2uHvzZ08ZYtvLKnibjP8do4RfrnlNMWQXELiuqIrYF1D15Dq3fe7TEVXcWgyi7XViwxQA4vKqiFC+oUXewAcmr52ACB9t1kYiKltdXXSkuXtn8sluxQxXouZbhwsQ0vo3UHLjEyKEAB/xFDQKmHfhPgfdok0voFtqsWfdZlpil7i+MsvITJ4O86349wdnFWMKcO7+O5Wj0wls6SZbBe5k66KglMlFa/ap25lkm04HUJUopxzbbnwashHAjUisrAjQw+caJ1scFTFxWhflpAyD6kIBOkQ/WCSMANdn4/pBQdPsHMFtDOhnRqvwlq2PbxsC+Vcmevy55vAaNwyso5G6eI1jP6pkVCGRJlbB+G9MW3ZJTy04/D26UIRe0sE1nLFoxT90xLnWXcrXpV4IL7zq0
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(346002)(376002)(136003)(396003)(36840700001)(46966006)(86362001)(82310400005)(40480700001)(53546011)(36860700001)(82740400003)(36756003)(54906003)(316002)(2906002)(70586007)(70206006)(4326008)(478600001)(8676002)(81166007)(356005)(33656002)(5660300002)(83380400001)(336012)(6862004)(186003)(41300700001)(107886003)(6512007)(6486002)(6506007)(8936002)(26005)(2616005)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2022 11:54:41.2315
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d7ae3801-ea31-45e8-8dfc-08da8f356ab2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5701

Hi Julien,

> On 5 Sep 2022, at 12:43, Julien Grall <julien@xen.org> wrote:
>=20
>=20
>=20
> On 05/09/2022 12:12, Rahul Singh wrote:
>> Hi Julien,
>=20
> Hi Rahul,
>=20
>>> On 2 Sep 2022, at 5:20 pm, Julien Grall <julien@xen.org> wrote:
>>>=20
>>>=20
>>>=20
>>> On 02/09/2022 16:54, Rahul Singh wrote:
>>>> Hi Julien,
>>>=20
>>> Hi Rahul,
>>>=20
>>>>> On 2 Sep 2022, at 4:05 pm, Julien Grall <julien@xen.org> wrote:
>>>>>=20
>>>>> Hi Bertrand,
>>>>>=20
>>>>> On 02/09/2022 15:51, Bertrand Marquis wrote:
>>>>>>> On 1 Sep 2022, at 19:15, Julien Grall <julien@xen.org> wrote:
>>>>>>> AFAIU, it is not possible to have *_xenstore =3D true and *_enhance=
d =3D false. I think it would be clearer if ``dom0less_enhanced`` is turned=
 to an enum with 3 values:
>>>>>>> - None
>>>>>>> - NOXENSTORE/BASIC
>>>>>>> - FULLY_ENHANCED
>>>>>>>=20
>>>>>>> If we want to be future proof, I would use a field 'flags' where no=
n-zero means enhanced. Each bit would indicate which features of Xen is exp=
osed.
>>>>>> I think that could be a good solution if we do it this way:
>>>>>> - define a dom0less feature field and have defines like the followin=
g:
>>>>>> #define DOM0LESS_GNTTAB
>>>>>> #define DOM0LESS_EVENTCHN
>>>>>> #define DOM0LESS_XENSTORE >
>>>>>> - define dom0less enhanced as the right combination:
>>>>>> #define DOM0LESS_ENHANCED =3D (DOM0LESS_GNTTAB| DOM0LESS_EVENTCHN| D=
OM0LESS_XENSTORE)
>>>>>=20
>>>>> I would rather introduce DOM0LESS_ENHANCED_BASIC (or similar) instead=
 of defining a bit for gnttab and evtchn. This will avoid the question of w=
hy we are introducing bits for both features but not the hypercall...
>>>>>=20
>>>>> As this is an internal interface, it would be easier to modify afterw=
ards.
>>>> How about this?
>>>> /*
>>>>  * List of possible features for dom0less domUs
>>>>  *
>>>>  * DOM0LESS_ENHANCED_BASIC: Xen PV interfaces, including grant-table a=
nd
>>>>  *                                                          evtchn, wi=
ll be enabled for the VM.
>>>=20
>>> Technically, the guest can already use the grant-table and evtchn inter=
faces. This also reads quite odd to me because "including" doesn't tell wha=
t's not enabled. So one could assume Xenstored is also enabled. In fact the=
 wording for ``DOM0LESS_ENHANCED`` is what makes it a lot more confusing.
>>>=20
>>> So I would suggest the following wording:
>>>=20
>>> "Notify the OS it is running on top of Xen. All the default features bu=
t Xenstore will be available. Note that an OS *must* not rely on the availa=
bility of Xen features if this is not set.
>>> "
>>>=20
>>> The wording can be updated once we properly disable event channel/grant=
 table when the flag is not set.
>>>=20
>>>>  * DOM0LESS_XENSTORE:              Xenstore will be enabled for the VM=
.
>>>=20
>>> I would make clear this can't be used without the first one.
>>>=20
>>>>  * DOM0LESS_ENHANCED:              Xen PV interfaces, including grant-=
table xenstore >   *                                                       =
   and
>>> evtchn, will be enabled for the VM.
>>>=20
>>> See above about "PV interfaces". So I would suggest to reword to:
>>>=20
>>> "Notify the OS it is running on top of Xen. All the default features (i=
ncluding Xenstore) will be available".
>>>=20
>>>>  */
>>>> #define DOM0LESS_ENHANCED_BASIC BIT(0, UL)
>>>> #define DOM0LESS_XENSTORE       BIT(1, UL)
>>>=20
>>> Based on the comment above, I would consider to define DOM0LESS_XENSTOR=
E as bit 0 and 1 set.
>>>=20
>>>> #define DOM0LESS_ENHANCED       (DOM0LESS_ENHANCED_BASIC | DOM0LESS_XE=
NSTORE)
>>  Bertrand and I discussed this again we came to the conclusion that DOM0=
LESS_ENHANCED_BASIC is not
>> the suitable name as this makes the code unclear and does not correspond=
 to DT settings. We propose this
>> please let me know your thoughts.
>=20
> To me the default of "enhanced" should be all Xen features. Anything else=
 should be consider as reduced/basic/minimum. Hence why I still think we ne=
ed to add it in the name even if this is not what we expose in the DT. In f=
act...
>>  /*
>>  * List of possible features for dom0less domUs
>>  *
>>  * DOM0LESS_XENSTORE:		Xenstore will be enabled for the VM. This feature
>>  *                                              	can't be enabled withou=
t the DOM0LESS_ENHANCED.
>>  * DOM0LESS_ENHANCED:       	Notify the OS it is running on top of Xen. =
All the
>>  *                          				default features (including Xenstore) wi=
ll be
>>  *                          				available. Note that an OS *must* not re=
ly on the
>>  *                          				availability of Xen features if this is =
not set.
>=20
> ... what you wrote here match what I wrote above. So it is not clear to m=
e what's the point of having a flag DOM0LESS_XENSTORE.

When we looked at the code with the solution using BASIC, it was really not=
 easy to understand.
By the way the comment is wrong and correspond to what should be ENHANCED_F=
ULL here
ENHANCED would be the base without Xenstore.

Bertrand

>=20
> Cheers,
>=20
> --=20
> Julien Grall


