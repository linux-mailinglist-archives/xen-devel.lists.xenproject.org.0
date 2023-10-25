Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4C97D63E8
	for <lists+xen-devel@lfdr.de>; Wed, 25 Oct 2023 09:48:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.622655.969671 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvYcX-0001tu-9T; Wed, 25 Oct 2023 07:48:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 622655.969671; Wed, 25 Oct 2023 07:48:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvYcX-0001rw-6f; Wed, 25 Oct 2023 07:48:05 +0000
Received: by outflank-mailman (input) for mailman id 622655;
 Wed, 25 Oct 2023 07:48:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p229=GH=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qvYcV-0001rq-3r
 for xen-devel@lists.xenproject.org; Wed, 25 Oct 2023 07:48:03 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2060d.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::60d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d0d263f0-730a-11ee-9b0e-b553b5be7939;
 Wed, 25 Oct 2023 09:47:58 +0200 (CEST)
Received: from DB3PR06CA0005.eurprd06.prod.outlook.com (2603:10a6:8:1::18) by
 DU2PR08MB10279.eurprd08.prod.outlook.com (2603:10a6:10:46e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.26; Wed, 25 Oct
 2023 07:47:55 +0000
Received: from DB5PEPF00014B8B.eurprd02.prod.outlook.com
 (2603:10a6:8:1:cafe::7a) by DB3PR06CA0005.outlook.office365.com
 (2603:10a6:8:1::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.35 via Frontend
 Transport; Wed, 25 Oct 2023 07:47:55 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5PEPF00014B8B.mail.protection.outlook.com (10.167.8.199) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6933.18 via Frontend Transport; Wed, 25 Oct 2023 07:47:54 +0000
Received: ("Tessian outbound 028b72acc2da:v215");
 Wed, 25 Oct 2023 07:47:54 +0000
Received: from f2f64da1f1f2.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7521FBF0-7395-4CEB-8BF7-28E05ECC28C5.1; 
 Wed, 25 Oct 2023 07:47:48 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f2f64da1f1f2.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 25 Oct 2023 07:47:48 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by GV2PR08MB9230.eurprd08.prod.outlook.com (2603:10a6:150:d9::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.33; Wed, 25 Oct
 2023 07:47:45 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::ae6e:f96c:f2f3:efc9]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::ae6e:f96c:f2f3:efc9%4]) with mapi id 15.20.6907.030; Wed, 25 Oct 2023
 07:47:45 +0000
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
X-Inumbo-ID: d0d263f0-730a-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j+By4rxb37l8SsPxXXZDLUWv/XPZA5EZLNcX2oWFq2s=;
 b=mfF6sSp+Lxg5PjCMm3Av3mjAvlAYb/nDwgq+feBTdCRTq8j/h9JeROiP1bvhkQwx6Cl2/vYq/7qfaHjJcLYjX5KOApun4WTJmkJnW7gL+Qg9GXT4XrHSq7Obz4e6XQaEn/xIpIUsASQc43BgyGmeUAqVqsvlaVPmNbUuW8BKvTM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: b53feaeef37f3553
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=En7Bzgyn2qKeKyDHw7dQ0upHG/WayvKY79j5ZvZONdKHvdIoh8VHH6xgyUDurisuOU7FcvKh0VdA6flf6DIMJod0q99K0NRuT4UsBluw+GZ7o1xUouN7gqaZS/GK32/SKucHOsV9FomI9p7Cr2xfqqkLmOQDAiOQrTnJZDs2kcdenPlgAq7ZdD6XeaTlW+jz8j3DWczwQO0cCpt8u8lQSd3HzHylkOjMR6LvboCAnNVpo/3tTx2HEmKLLeUiktnML8A9ZZvOVbq0OPDu/cFC6C1merVSuKzLQE8ewEuaAwspLjWWEsVEiLIqZ6QKWX0nONowfuC2q2TddPMEZOFwbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j+By4rxb37l8SsPxXXZDLUWv/XPZA5EZLNcX2oWFq2s=;
 b=OytDYWm1IvpuvsKtSoxJudHR7KSZH/7Ixbim4iiTaXMKiOU8iwAmlolH0J6g+Es1gvJajHAHYyWoxDDTeZ/IVdofCsa/eqL59LbKGza0kHx6/J7tuZbpO1ztbgYzn/dTy3LER8l2iEZlkF5YSVIoWNDyJ6AG6nJZp72x6285fjjasyEWOirrpWjgsyFRsezoe54iOIyerVne0sQHj2ye2oSk40p6QvR3grHUh4rf7o9FEq+8KQ3Akro+vcSuHFYcKwaGgSTyQEYQnFk48GEWNpgyDr88ob2hvrr5zHiRz3PJz2TTE2aGOUhcDxzFhFXBe6T4m0YKbCUnXrmXoq07Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j+By4rxb37l8SsPxXXZDLUWv/XPZA5EZLNcX2oWFq2s=;
 b=mfF6sSp+Lxg5PjCMm3Av3mjAvlAYb/nDwgq+feBTdCRTq8j/h9JeROiP1bvhkQwx6Cl2/vYq/7qfaHjJcLYjX5KOApun4WTJmkJnW7gL+Qg9GXT4XrHSq7Obz4e6XQaEn/xIpIUsASQc43BgyGmeUAqVqsvlaVPmNbUuW8BKvTM=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Michal Orzel
	<michal.orzel@amd.com>, Julien Grall <jgrall@amazon.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH for-4.19 v2] docs/arm: Document where Xen should be loaded
 in memory
Thread-Topic: [PATCH for-4.19 v2] docs/arm: Document where Xen should be
 loaded in memory
Thread-Index: AQHaBmTvYbIQchT5B0KT4u7zbVvjnbBaIjyA
Date: Wed, 25 Oct 2023 07:47:45 +0000
Message-ID: <6FB5D848-EFDF-44DA-96BA-4039E86434D0@arm.com>
References: <20231024102858.29067-1-julien@xen.org>
In-Reply-To: <20231024102858.29067-1-julien@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|GV2PR08MB9230:EE_|DB5PEPF00014B8B:EE_|DU2PR08MB10279:EE_
X-MS-Office365-Filtering-Correlation-Id: 992cf8e3-7684-4fc1-e948-08dbd52eb2cb
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 lEQUeQIMykOFdDun+bS4hh9XFn2459jsTau/eTbkq87r1V+pn+Lkri2bJtgvKz3YtiPKYuPe0zv03kxZcPjrrgVgGj0fURsGpxUAzKdXKz3Mv+WE8FTe75F5PsN+UlnaGD6a+e7UnC1xrobA428wzXM46Z4LHDjyWlXy/Q2DVRSI5fh+3hKJS0ahY4hz4ojj7TtUmFDb3K5kUxHcqGT59RD4iyQGx67Wt7ULnqHGrJdPQJwBWSEs4cqQPhk8Vu3EDPOdKNO5mZnbAyJ1RszdprvER0Mp/5mmancldbxZ4qPbCDEp1f4soxRgCyRkcH9677GLh780MKw9svu2uFQ47/ztEuT8E6/+UOdp0DKpIdLayUmAvbqV72SGoHHp2+zrGdyPfXkvsb7G3wyKI6XqKCUF0GUgjLT5fFGLzoUcvP8qLNm12rWrQdST4yN6AQ/TtmHt+4qqhgKRVQ5FoKGkYWmNZYgPdJBph/6JLt5YqPc9S6uWJ7PjbiEHP1XYB4rOswTBf8jnYcm4L27OqtG7UlVP+BvBJMCNC5hrghFx6MEVCC7qqEx6yQn8F93zU5jUh6LrFveTV/0i21u2mIVqjiUhF/Mo4cEr+8UMs15zrrsWhlU7XLBuDITmlLrQHDoRj+szi9sAkmcJivbFQISWnw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(366004)(39860400002)(396003)(346002)(230922051799003)(186009)(451199024)(64100799003)(1800799009)(26005)(38070700009)(36756003)(38100700002)(2906002)(4744005)(41300700001)(5660300002)(86362001)(8936002)(8676002)(33656002)(4326008)(54906003)(71200400001)(66446008)(478600001)(6916009)(91956017)(6506007)(53546011)(122000001)(76116006)(64756008)(66556008)(66476007)(66946007)(316002)(6486002)(83380400001)(2616005)(966005)(6512007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <7B56C15AE9764B43B76410695808ED3D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB9230
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B8B.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ac1d4e2c-1c77-4e89-9c09-08dbd52ead39
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	veLq8jQwXES6JrGr/iwM9JFdrh6cqdxrEo/EKjcbyBsYuhHimRT1yKKzZq+sXhwx5pQniYOZurAzPS5oG1MsBxDK/kb3P975R/lYCJ1P01ecMy09VgmRCqGGUKMIQD+5NV0IvjXks+XrAk8I0YbFDIc3PbgvMyrOYE3Z7tMDz0tLfe1SS7HoATyoPniS9BEKURh2f7/bAHWPbsFcgrA3C9sHyxYxQ19P7o6ZgkdCnLEe2+T+StxuOZ+8F16QXF0tLuvxCK9/4nXkgaGMYOj/CkNOTLiN6vopvHORzA8WwzBbM8nVM/1wYxrMFqCMneTDC+Zj9Y2qMpqEqm2CsWL4UX83HJgHc3iMNYMCXP3FRIcle5zNoE7bwoti4F8dAPikmvoTmwfVNTjkCftyWj1EUd9BReFV9cvgLbhBubC56oD2Tv4X/bfPiG9u2gwUJYoGbLgLnxGeLlcnWdlmUM2FhzODTPM9/Be9t97tUOrq0PKuoPbawgIdpiGfy9GrPH2g9uKk+0d33w7IeYRCbp9MJWDD8P7ylJqL9jvYkDQB4IpCzEbf89AOkRNYbgnwi3ZbNRQxU66OvQYxjrfErX80HkqjtyIcU2xeiXjLNEg7wbnVtcH37YDFDobAW7RY7yoen1LR7J1cz2doJSqt2uKqbxpHiHiZvJECAb17tuZkbqCE2m0jWqn5/xITIXNKXfUq7wQhF8P8A2AWjKqc35A3t+dYR1opF/zWryoIyUxDjdg=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(39850400004)(136003)(396003)(346002)(376002)(230922051799003)(186009)(82310400011)(451199024)(64100799003)(1800799009)(46966006)(36840700001)(40470700004)(33656002)(40460700003)(6512007)(4744005)(47076005)(36860700001)(6506007)(83380400001)(336012)(107886003)(8676002)(5660300002)(6862004)(4326008)(41300700001)(8936002)(2906002)(966005)(478600001)(53546011)(6486002)(70586007)(54906003)(316002)(70206006)(356005)(82740400003)(81166007)(2616005)(86362001)(26005)(36756003)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2023 07:47:54.7977
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 992cf8e3-7684-4fc1-e948-08dbd52eb2cb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B8B.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB10279

Hi Julien,

> On Oct 24, 2023, at 18:28, Julien Grall <julien@xen.org> wrote:
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> In commit 9d267c049d92 ("xen/arm64: Rework the memory layout"),
> we decided to require Xen to be loaded below 2 TiB to simplify
> the logic to enable the MMU. The limit was decided based on
> how known platform boot plus some slack.
>=20
> We had a recent report that this is not sufficient on the AVA
> platform with a old firmware [1]. But the restriction is not
> going to change in Xen 4.18. So document the limit clearly
> in docs/misc/arm/booting.txt.
>=20
> [1] https://lore.kernel.org/20231013122658.1270506-3-leo.yan@linaro.org
>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>

Release-acked-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry

