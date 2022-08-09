Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2FAD58D5EB
	for <lists+xen-devel@lfdr.de>; Tue,  9 Aug 2022 10:59:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.382851.617894 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLL4C-0002PG-25; Tue, 09 Aug 2022 08:58:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 382851.617894; Tue, 09 Aug 2022 08:58:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLL4B-0002NG-VX; Tue, 09 Aug 2022 08:58:23 +0000
Received: by outflank-mailman (input) for mailman id 382851;
 Tue, 09 Aug 2022 08:58:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VsBn=YN=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1oLL4A-0002NA-6d
 for xen-devel@lists.xenproject.org; Tue, 09 Aug 2022 08:58:22 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10058.outbound.protection.outlook.com [40.107.1.58])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 69a73971-17c1-11ed-924f-1f966e50362f;
 Tue, 09 Aug 2022 10:58:19 +0200 (CEST)
Received: from AS9PR04CA0110.eurprd04.prod.outlook.com (2603:10a6:20b:531::12)
 by DBBPR08MB4806.eurprd08.prod.outlook.com (2603:10a6:10:db::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.19; Tue, 9 Aug
 2022 08:58:15 +0000
Received: from AM5EUR03FT033.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:531:cafe::a2) by AS9PR04CA0110.outlook.office365.com
 (2603:10a6:20b:531::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.21 via Frontend
 Transport; Tue, 9 Aug 2022 08:58:14 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT033.mail.protection.outlook.com (10.152.16.99) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5504.16 via Frontend Transport; Tue, 9 Aug 2022 08:58:14 +0000
Received: ("Tessian outbound cc6a8ab50b6b:v123");
 Tue, 09 Aug 2022 08:58:14 +0000
Received: from d39d4bd9d902.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9848F4BA-E12C-400A-A3E8-423E0BA8BB14.1; 
 Tue, 09 Aug 2022 08:58:03 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d39d4bd9d902.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 09 Aug 2022 08:58:03 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com (2603:10a6:10:2e4::7)
 by AM5PR0801MB1746.eurprd08.prod.outlook.com (2603:10a6:203:3b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.17; Tue, 9 Aug
 2022 08:58:01 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::80f6:a08f:6f28:6518]) by DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::80f6:a08f:6f28:6518%8]) with mapi id 15.20.5504.021; Tue, 9 Aug 2022
 08:58:01 +0000
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
X-Inumbo-ID: 69a73971-17c1-11ed-924f-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=klJvBe3zNawfiBdj4JGhD4DO3oVo7wHSEeXoCQZV/OIOVsh8EZJ1cRh9feodjZ2dBlLQM5KcacCQ7+KyjH9ssPiqIIdo7zCvu3iwzf7QpNq7WYc8T2HaVwpMbZbkotg+R/U42YgrD0it7OEU6rZUUhh0UUYXq4NBja94IU5+A2prIwKylbMeFWkXcEdZkogRYzL3HMFU4XGFy/xSWCaAKkS/qrVbMkVkqqhdo9M32prM/FnhW84ShjmkKjsEgf62Aj562L4j+bIrmfI2Sh+VzPMqE5B109H6QmcOftA4hehuyiRGwQ7Pa4DkVPmPjXZFOIb4OmxKh7egBHAvqIg5Qg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qc/J9r3AaJPnUqwMqXYwWHPL/cC6vYuHrNbRr6+mLwk=;
 b=R6rwlQbBt6Wef26epROddVVyBmJDKvmGAb1zNMaGjY/6TAPv8r0wY1RqVx8BWOno6dqHvIiIJPNfCvNTNzxkIWJgKKbWk1wF+7UhFDl9PmVDtw48xJhitMh2lZICjbN5g3+mZRB4prT/vLU9ghVqheaE7RIRZ7PPighIUa3RU4vLuzMqRH9r84O4q6lxvZHydd5FpVGTd/3u2b09FPmmEklsa/WlL6bOWovBV6fuAzAisDsdmMOw3C6YiqDjjwwF//7A/gv2zb4S7QHrgB2g5IbnGgVQP9bWTsy2w5tG9hYQ8IK3Yx5gIGcYBz253aDwbcJqlSOIzjLh/JXKs6KW9g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qc/J9r3AaJPnUqwMqXYwWHPL/cC6vYuHrNbRr6+mLwk=;
 b=GxuYm07SPHD2wKz/LZrUMtWdoFjXoJeGM0ln/MsmgY4N3KKORj8ljrS+eeHsCIz1NIKWts/ioXXIZEA/GNzId56OgqfEY6mPJjmeQezSceXbXdid0+T9J+DPa1ap5FhQp19hCoRv3xgPwT2pac9Rr9h86Lz/P+97Ul2W1AzEI8s=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aEL9CJrEVZ59hUOXP34OGOhmQHBXz6sMrw6q8jOl54CbdieH8trT9NOKEf6OU8dOJxk4f28i4SrJx2hGAVey+CdJhJsEm0pDaqJpaEEJC1NwZqyX6LYkMgPmnFSaD/bjok9iJxUt81zTm1/+WbCFQHoOs6NpHVZsPPzG7OuFjpIWlDEtn88uxm66rNCMXCJMgUMQ4o+LFhsp5bWQ9aGZ27DxASItknNUzvGlwaQMUmtBdxJnbtHFB6Djk8mzjt9Zb32lwkAJq0n9ZCeLnmA8w7woti1pEeZG6jQrMZBZF9YSxyS+K5tviYQZ67cBg2cIPks+8yRTMeW+JZ3RWULvSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qc/J9r3AaJPnUqwMqXYwWHPL/cC6vYuHrNbRr6+mLwk=;
 b=Q55+rtkFZtUAnvZNw8P/heCHwJnjKiKTkX5GGqvCQ+GPljoyLdeQdDHMtTzbEco5+bdGyJymhjVsZUr0ifPIRq4POmkMxppEZn057sHlLjbSBgVJqQVqjWeh7vM62P296uUJMnDKUWKDF5ycyuOQnwIde/n+y+RxqwTuKDHdGs4iyZxj/3KQKyXVVmrzHLaFaZiGJ/ehtCu6wy12BJM0yD1tXLDgvIR12jE1ttf3O/7do/k5h9HQ7dlrhIQT2AFSsyulNCWZqRsMFnhIDAxETGdFI7wJ9TJq2XLkNn2EKxbtVqbIF9msV4j+jn2GVDao+tN/Xw/KP/a7MLekwMQLFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qc/J9r3AaJPnUqwMqXYwWHPL/cC6vYuHrNbRr6+mLwk=;
 b=GxuYm07SPHD2wKz/LZrUMtWdoFjXoJeGM0ln/MsmgY4N3KKORj8ljrS+eeHsCIz1NIKWts/ioXXIZEA/GNzId56OgqfEY6mPJjmeQezSceXbXdid0+T9J+DPa1ap5FhQp19hCoRv3xgPwT2pac9Rr9h86Lz/P+97Ul2W1AzEI8s=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Chen <Wei.Chen@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v9 8/8] xen: retrieve reserved pages on populate_physmap
Thread-Topic: [PATCH v9 8/8] xen: retrieve reserved pages on populate_physmap
Thread-Index:
 AQHYm/wqv1nrEHMOJUyQDyAePQJHla2PQtqAgBcOCRCAAALrAIAAAXbwgAAGY4CAAAYCAA==
Date: Tue, 9 Aug 2022 08:58:01 +0000
Message-ID:
 <DU2PR08MB732531F03BB6F436FCC79673F7629@DU2PR08MB7325.eurprd08.prod.outlook.com>
References: <20220720054611.2695787-1-Penny.Zheng@arm.com>
 <20220720054611.2695787-9-Penny.Zheng@arm.com>
 <d050bcf4-f71d-423d-a157-4243548f47a6@suse.com>
 <DU2PR08MB7325EB83FDD208467A493557F7629@DU2PR08MB7325.eurprd08.prod.outlook.com>
 <99e65678-c394-01f1-9f49-827388f2fff6@suse.com>
 <DU2PR08MB7325A733C5B374ED899A2007F7629@DU2PR08MB7325.eurprd08.prod.outlook.com>
 <14ce6b41-c422-abac-4b59-541511d75cae@suse.com>
In-Reply-To: <14ce6b41-c422-abac-4b59-541511d75cae@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 8AFB0E0819CB1246833FB1A888D94D5A.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 3cd5baed-6772-4d3d-9326-08da79e54b65
x-ms-traffictypediagnostic:
	AM5PR0801MB1746:EE_|AM5EUR03FT033:EE_|DBBPR08MB4806:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 P7jj8x4unBY3MTjJhDW40iNCBZiGphkNDUekURb6gAbvyispnrzOaORk1vdxvu6Li27WDdqw13RGf6VV/e9bTZiRywosjwbqHbCSHnKFPCNWRBAmQGT4mCBS5Vt3dJUlrPOnIoc6NmJHKDeU1dIFxxK+Bf6rBs6j97zX8cWEJyhO9gDEHZhS2rYLeTw56BmRYkx3l5JV4HqAlarXEmePWDrijjh6gMlWrRdplV7lgBO4FMlU8XcOULA85OgWwioS/42eWcCDxZDre1S/qoF5EXs7z6EmeagaZAZHZez8X+YCpP2LBG1DOKDd/rhvMzVEn8qn6K+slBsI021Gn/5jcXM/D7N7OFEwzvzUKDZctZc8pcQVps3brG38SFtswjAIKj7tieXwYXjkh6hHPuIc6N2pHRgOWaHKe8bDNDUBq4pjmso/xMAnPFTD6yfDCARc9oLyygu3h/ANYPj8NFjUlWhxzD0M5gOd3iih19kMpGNDHCNd+/2XwWvAqlmfpki9oKZZqPfeOjZk+RKlgVya2lIT2mlLOePCf0kz+2x4nl+/m8R+XW4R+i0W8VyANsk7sv+mf9pDRD5bkcKAouXgc6vd2zXGghcFxf9sc/DcKAkvB+1lokptUg0kNc6Js1JbrrrcQ50WjnfULlvCpCCGpZaqhlQ9njhcmF86NqhB1dUbbebIXlG8l8VVLg7/fYwPae6rIoZ6tAebu80uNFROgDr8bzM1kxZjI3hOsoXE3NSHky7nFi7a6+FY6Aj0RACdG07E+O2qgxLp5hgZYzmfQeKSDyz/7HL/oLCEz+cunnPgQCgc10mBkhh0UZI18925
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7325.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(396003)(39860400002)(376002)(346002)(366004)(66446008)(71200400001)(38070700005)(64756008)(4326008)(83380400001)(8676002)(66556008)(66476007)(76116006)(66946007)(26005)(86362001)(9686003)(41300700001)(53546011)(2906002)(6506007)(7696005)(186003)(33656002)(478600001)(5660300002)(8936002)(52536014)(6916009)(54906003)(316002)(55016003)(122000001)(38100700002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1746
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	fd36c39f-25b8-436b-6ca0-08da79e54371
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NXrx5O6OlSC4Z02cP8HbjsvhLSuylkqikdXz4v3ucX07vFuWue1MoE1Tn6JC2A6L+4D9dQNEDlUHMG1FLRxAWK9h5bjV3e/k3Nzv8r6odxPvIhMqd59XrGgxRnfSFnoVbQeR0VytkOwT41MEdpV0/eLuKtRIg7lgBlqQk9nSST6KtXr4WfV6FepJnq7kqA5dBSQajBZh8AbR8MI9ulcI7aZ3V5kqZmkfugXsPjnfhzyd2SmKpkmuwp1qOfXuaxze/OZMLeijOeIGAIRMeBQhxfqGbcS6oDExvKNyg+EXB7PgcRYLY07lGOjTPv7JXATJ4tDbmlRb5AmuwFcWg+VNfyG/jy5ARMh+PUaWEiy8LpKiiNHPsArMn+ihctBa4wBQRRwsfe3SlnkkWq8PPa6qAYRFIekYmvlYfyJFoST07UB+CEfsTBPe6nFHItgk9wwX27kYUErY2o3th4CsxhY/m7Ki1jFurT0FHemOfpXu1DXNQhUT+2ZfrukYpyRzMBAVAe3mrR+umAldL5fUvCoM5FRF/rgrxJUfZxar24nXiS+nRpFtAiKJqR1c3OAzxAyjLxfs557GdzYZy53n/fLnqYv+Y/+2tq6nMMpdzqpduVa+oYHNlSM8OAZcFP8Fr+O/2XjXfo+FWVyP1Vmf6u5rtApHwg7jOEM7QxmXBEgwIsEPnnCeTIIoJkEEoefjFAFL2qZ0J+5R58UW1SLvF/RH3Wt8q8yAJ/1Ccq7uIh0WbgioB85XfkYw6F8/TXuVI0FePPUNnxXe+UqQwH8pplS7kfy2cMtbnPFOnr6LQCt1Sqb1MlVANu5Bvq12RfYvxAaaUWVzVwjyGBiWAsXZqG/ET9ovG//2qOM+dql5YHXVIpA=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(346002)(396003)(136003)(376002)(40470700004)(36840700001)(46966006)(7696005)(9686003)(186003)(53546011)(6506007)(336012)(47076005)(83380400001)(86362001)(356005)(82740400003)(40460700003)(36860700001)(5660300002)(8676002)(70586007)(81166007)(4326008)(54906003)(40480700001)(33656002)(82310400005)(70206006)(55016003)(52536014)(8936002)(26005)(6862004)(478600001)(2906002)(316002)(41300700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2022 08:58:14.5141
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cd5baed-6772-4d3d-9326-08da79e54b65
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4806

SGkgamFuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiBTZW50OiBUdWVzZGF5LCBBdWd1c3QgOSwgMjAyMiA0
OjI3IFBNDQo+IFRvOiBQZW5ueSBaaGVuZyA8UGVubnkuWmhlbmdAYXJtLmNvbT4NCj4gQ2M6IFdl
aSBDaGVuIDxXZWkuQ2hlbkBhcm0uY29tPjsgQW5kcmV3IENvb3Blcg0KPiA8YW5kcmV3LmNvb3Bl
cjNAY2l0cml4LmNvbT47IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT47
DQo+IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+OyBTdGVmYW5vIFN0YWJlbGxpbmkgPHNz
dGFiZWxsaW5pQGtlcm5lbC5vcmc+Ow0KPiBXZWkgTGl1IDx3bEB4ZW4ub3JnPjsgeGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjkgOC84XSB4ZW46
IHJldHJpZXZlIHJlc2VydmVkIHBhZ2VzIG9uDQo+IHBvcHVsYXRlX3BoeXNtYXANCj4gDQo+IE9u
IDA5LjA4LjIwMjIgMTA6MDcsIFBlbm55IFpoZW5nIHdyb3RlOg0KPiA+PiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQ0KPiA+PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+
DQo+ID4+IFNlbnQ6IFR1ZXNkYXksIEF1Z3VzdCA5LCAyMDIyIDM6NTkgUE0NCj4gPj4NCj4gPj4g
T24gMDkuMDguMjAyMiAwOTo1MywgUGVubnkgWmhlbmcgd3JvdGU6DQo+ID4+Pj4gLS0tLS1Pcmln
aW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4+PiBGcm9tOiBYZW4tZGV2ZWwgPHhlbi1kZXZlbC1ib3Vu
Y2VzQGxpc3RzLnhlbnByb2plY3Qub3JnPiBPbiBCZWhhbGYNCj4gPj4+PiBPZiBKYW4gQmV1bGlj
aA0KPiA+Pj4+IFNlbnQ6IE1vbmRheSwgSnVseSAyNSwgMjAyMiAxMTo0NCBQTQ0KPiA+Pj4+DQo+
ID4+Pj4gT24gMjAuMDcuMjAyMiAwNzo0NiwgUGVubnkgWmhlbmcgd3JvdGU6DQo+ID4+Pj4+IFdo
ZW4gYSBzdGF0aWMgZG9tYWluIHBvcHVsYXRlcyBtZW1vcnkgdGhyb3VnaCBwb3B1bGF0ZV9waHlz
bWFwDQo+IGF0DQo+ID4+Pj4+IHJ1bnRpbWUsIGl0IHNoYWxsIHJldHJpZXZlIHJlc2VydmVkIHBh
Z2VzIGZyb20gcmVzdl9wYWdlX2xpc3QgdG8NCj4gPj4+Pj4gbWFrZSBzdXJlIHRoYXQgZ3Vlc3Qg
UkFNIGlzIHN0aWxsIHJlc3RyaWN0ZWQgaW4gc3RhdGljYWxseQ0KPiA+Pj4+PiBjb25maWd1cmVk
IG1lbW9yeQ0KPiA+Pj4+IHJlZ2lvbnMuDQo+ID4+Pj4+IFRoaXMgY29tbWl0IGFsc28gaW50cm9k
dWNlcyBhIG5ldyBoZWxwZXIgYWNxdWlyZV9yZXNlcnZlZF9wYWdlIHRvDQo+ID4+Pj4+IG1ha2UN
Cj4gPj4+PiBpdCB3b3JrLg0KPiA+Pj4+Pg0KPiA+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBQZW5ueSBa
aGVuZyA8cGVubnkuemhlbmdAYXJtLmNvbT4NCj4gPj4+Pj4gLS0tDQo+ID4+Pj4+IHY5IGNoYW5n
ZXM6DQo+ID4+Pj4+IC0gVXNlIEFTU0VSVF9BTExPQ19DT05URVhUKCkgaW4gYWNxdWlyZV9yZXNl
cnZlZF9wYWdlDQo+ID4+Pj4+IC0gQWRkIGZyZWVfc3RhdGljbWVtX3BhZ2VzIHRvIHVuZG8gcHJl
cGFyZV9zdGF0aWNtZW1fcGFnZXMgd2hlbg0KPiA+Pj4+PiBhc3NpZ25fZG9tc3RhdGljX3BhZ2Vz
IGZhaWxzDQo+ID4+Pj4NCj4gPj4+PiBNYXkgSSBzdWdnZXN0IHRvIHJlLWNvbnNpZGVyIG5hbWlu
ZyBvZiB0aGUgdmFyaW91cyBmdW5jdGlvbnM/DQo+ID4+Pj4gVW5kb2luZyB3aGF0ICJwcmVwYXJl
IiBkaWQgYnkgImZyZWUiIGlzLCB3ZWxsLCBjb3VudGVyaW50dWl0aXZlLg0KPiA+Pj4+DQo+ID4+
Pg0KPiA+Pj4gSG93IGFib3V0IGNoYW5nZSB0aGUgbmFtZSAicHJlcGFyZV9zdGF0aWNtZW1fcGFn
ZXMiIHRvDQo+ID4+ICJhbGxvY2F0ZV9zdGF0aWNtZW1fcGFnZXMiPw0KPiA+Pg0KPiA+PiBQZXJo
YXBzIC0gaWYgd2hhdCB0aGUgZnVuY3Rpb24gZG9lcyByZWFsbHkgcmVzZW1ibGVzIGFsbG9jYXRp
b24gaW4gc29tZQ0KPiB3YXkuDQo+ID4+IFNvIGZhciBJIHdhc24ndCByZWFsbHkgY2VydGFpbiBp
biB0aGF0IHJlZ2FyZCwgYW5kIGhlbmNlIEkgd2FzDQo+ID4+IHdvbmRlcmluZyB3aGV0aGVyICJw
cmVwYXJlIiBkb2Vzbid0IGJldHRlciBkZXNjcmliZSB3aGF0IGl0IGRvZXMsIGJ1dA0KPiA+PiB0
aGVuIGl0cyBpbnZlcnNlIGFsc28gZG9lc24ndCByZWFsbHkgImZyZWUiIGFueXRoaW5nLg0KPiA+
Pg0KPiA+DQo+ID4gSG1tbW0sIOKAnHByZXBhcmXigJ0gd2l0aCDigJxkZXN0cm954oCdIGluIGl0
cyBpbnZlcnNlPyBEbyB5b3UgaGF2ZSBhbnkNCj4gc3VnZ2VzdGlvbiBpbiBtaW5kPw0KPiANCj4g
VG8gYmUgaG9uZXN0IEkgd2FzIGhvcGluZyB5b3Ugd291bGQgbWFrZSBhbiBhdHRlbXB0IGF0IGZp
bmRpbmcgYSBzdWl0YWJsZQ0KPiBwYWlyIG9mIHZlcmJzLiBUbyBtZSAiZGVzdHJveSIgaXMgbW9y
ZSB0aGUgb3Bwb3NpdGUgb2YgImNyZWF0ZSIsIGFuZCBJJ20NCj4gdW5hYmxlIHRvIHRoaW5rIG9m
IGEgZ29vZCBvcHBvc2l0ZSBvZiAicHJlcGFyZSIgKHNob3J0IG9mIHJlc29ydGluZyB0bw0KPiAi
dW5wcmVwYXJlIik7IGlmIEkgcmVhbGx5IG5lZWRlZCB0byBjb21lIHVwIHdpdGggc29tZXRoaW5n
IHRoZW4gaXQgd291bGQNCj4gbGlrZWx5IGJlICJjbGVhbnVwIiwgYWxiZWl0IEknZCBub3QgYmUg
b3Zlcmx5IGhhcHB5IHdpdGggdGhhdCBlaXRoZXIuDQo+IA0KDQpNYXliZSB1bnByZXBhcmUgaXMg
YmV0dGVyIGhlcmUsIEkgd2FzIHNlYXJjaGluZyBsaW51eCBjb2RlIGZvciB0aGUgaGVscCwgYW5k
DQp0aGV5IGFyZSB1c2luZyBwcmVwYXJlL3VucHJlcGFyZSBhcyBhIHBhaXIgb2YgdmVyYnMgYSBs
b3QgaW4gZHJpdmVycyBjb2Rlcy4NCg0KRm9yIHRoZSByZW5hbWluZyBoZXJlLCBJIHN1Z2dlc3Qg
dG8gZml4IGl0IHdpdGggYSBuZXcgY29tbWl0LCBzaW5jZSBmcmVlX3N0YXRpY21lbV9wYWdlcw0K
aGFzIGFscmVhZHkgYmVlbiBtZXJnZWQuDQogDQo+IEphbg0K

