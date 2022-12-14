Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A611364C822
	for <lists+xen-devel@lfdr.de>; Wed, 14 Dec 2022 12:37:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.462133.720311 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5Q4R-0006Zl-MS; Wed, 14 Dec 2022 11:37:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 462133.720311; Wed, 14 Dec 2022 11:37:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5Q4R-0006XJ-JU; Wed, 14 Dec 2022 11:37:07 +0000
Received: by outflank-mailman (input) for mailman id 462133;
 Wed, 14 Dec 2022 11:37:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=30QF=4M=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1p5Q4Q-0006XD-CN
 for xen-devel@lists.xenproject.org; Wed, 14 Dec 2022 11:37:06 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2069.outbound.protection.outlook.com [40.107.104.69])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a1e0f1ba-7ba3-11ed-8fd2-01056ac49cbb;
 Wed, 14 Dec 2022 12:37:04 +0100 (CET)
Received: from DB6PR07CA0202.eurprd07.prod.outlook.com (2603:10a6:6:42::32) by
 DB9PR08MB9851.eurprd08.prod.outlook.com (2603:10a6:10:460::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5924.9; Wed, 14 Dec 2022 11:37:02 +0000
Received: from DBAEUR03FT057.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:42:cafe::89) by DB6PR07CA0202.outlook.office365.com
 (2603:10a6:6:42::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.11 via Frontend
 Transport; Wed, 14 Dec 2022 11:37:02 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT057.mail.protection.outlook.com (100.127.142.182) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5924.11 via Frontend Transport; Wed, 14 Dec 2022 11:37:02 +0000
Received: ("Tessian outbound 58faf9791229:v130");
 Wed, 14 Dec 2022 11:37:02 +0000
Received: from e14aaa33c6ad.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 FDCFAE6D-6740-4074-90BE-61B9A47F457E.1; 
 Wed, 14 Dec 2022 11:36:55 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e14aaa33c6ad.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 14 Dec 2022 11:36:55 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com (2603:10a6:20b:404::24)
 by AS8PR08MB9454.eurprd08.prod.outlook.com (2603:10a6:20b:5ee::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.10; Wed, 14 Dec
 2022 11:36:47 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::b45:fa8a:caad:25c0]) by AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::b45:fa8a:caad:25c0%4]) with mapi id 15.20.5924.011; Wed, 14 Dec 2022
 11:36:47 +0000
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
X-Inumbo-ID: a1e0f1ba-7ba3-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YhpfXd8LVh0HhvYEWzdU5VwFs1BNznNeFJUckR9KOhY=;
 b=xOyc7xXsL9Y/yz8pjLpO8BwczuDZFIOO6Hxzba8Bu8inGosGMRYm7aimUUZwjg+qGGrA5IGe1p+T4gCtzDRLqcHqzsULRkCdVYCi+Gp/rN9ns3yL5QGs884SqktQPdn/qU/a+OuPv3jY1bIKTvv3wuWAO+duRgwzoyzpr3OYo3k=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 65b4cc51230a9da6
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ixuxKDCt6VKtHIAfeSETJB+deNlvPmqCSlJXkdehBTXF+xcvAv80LGiMyuyYBB/B/PYtI+28qy57OdNLqxua0ZQH2N51mMlz2pbBj/61CBm5TRRv+xeYwAatKiTJrmSZoLnWWycicdP9CiFFxd9zenGC8BGuRoDZvX/iCPBqeVbmBdtX3h3A4Xp6o7ZhyAHIQZqMoWr6DCnLvgVJUDQiLP5dlgxzdtvFHNFfU4lDu31odaB2ZeIHfUgGqsd+ARm3C5HuOilYdGc9TRJRU6G1797pBKWvqO5gZfRPvBX5EaFv7QGf6X6k59RTMT5a0tg9xXBFsi7+8Uv0DvZIehiFHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YhpfXd8LVh0HhvYEWzdU5VwFs1BNznNeFJUckR9KOhY=;
 b=Ns5lRumGWTonyu7/MReAg+hM8Fe6itx8AHyHDfxb4nvDu3xQ1BcyUg3sPIgF8iGp9atmAE0jb6VskF0PTeOYwAieXtofKqNOsz7oDYz7j8HqvkaYIzYt04joL/6Ol3yHenr8IjHFFuGnRqDhFd8Jzxz+iQnLiai2huEWt/+6/J1Og4qX7OIGyogU603pV5Z6l/1Kf+5yFrmBgDsk+NbtFrgZbfAuI5mYw6xIFFpEf3NSWluJqFRxLMg2REJL/LRHtrAPwqK7ZfaofYYH7N56q+MW0Tqkr1f2Ze3DDkiBm7NsmxUSEWGcqJsU3nqfCaNKPPkChSUon4weQPY/GoLcig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YhpfXd8LVh0HhvYEWzdU5VwFs1BNznNeFJUckR9KOhY=;
 b=xOyc7xXsL9Y/yz8pjLpO8BwczuDZFIOO6Hxzba8Bu8inGosGMRYm7aimUUZwjg+qGGrA5IGe1p+T4gCtzDRLqcHqzsULRkCdVYCi+Gp/rN9ns3yL5QGs884SqktQPdn/qU/a+OuPv3jY1bIKTvv3wuWAO+duRgwzoyzpr3OYo3k=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
CC: Xen developer discussion <xen-devel@lists.xenproject.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2] xen/arm: smmuv3: mark arm_smmu_disable_pasid
 __maybe_unused
Thread-Topic: [PATCH v2] xen/arm: smmuv3: mark arm_smmu_disable_pasid
 __maybe_unused
Thread-Index: AQHZDx9yw/wEVo2DeEWwDI7Q4pTE1a5tQmYA
Date: Wed, 14 Dec 2022 11:36:47 +0000
Message-ID: <6CB8AAAA-A653-459C-9493-2586AF057D99@arm.com>
References: <20221213181855.81713-1-stewart.hildebrand@amd.com>
In-Reply-To: <20221213181855.81713-1-stewart.hildebrand@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7158:EE_|AS8PR08MB9454:EE_|DBAEUR03FT057:EE_|DB9PR08MB9851:EE_
X-MS-Office365-Filtering-Correlation-Id: 103fd38c-e3d0-44c1-b915-08daddc784c7
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 KYAJ+bzD3yLSE7AKGp/jC2Z9bcMx9Xt+7I8X87m/5xaqdU0gA/cb07LF8ahPhqs7oAA6m7UPwKxStvzmO6jHUrk8N/PugbvDQdesyEo1qcVBFfEWHl5mJsWJot7KbtMJo8sJSkQMI3fAoIHeKvMwPy+dcnpCpliuCq1oHYgBz3DHE9GlBOfgzlpze4bxB3TxUzzQJKnjfB69k7q7Z+j8rKsWdeewbOGTTI2O0p7B+XmnJqxEa+OcJ98QF30oegTi34D9grP+s+wN6HAR9WD7pVGYShUBSD5xD73fzYFEVifwKwyMZnA/0a9qvyIFE3v9V1suHZeEvWt3X2DLjnSx6bf6D6KKBuMdy5JtgcG+qK2PN4NZGGV8jppoCaAB/IS8w/pJe/MI5vKwNzvlRSo5T556TpmcFs/EFOUm3lWMguoDdLopxI8Y3M1JKGEPndHgO8sWGLTHqnbUf31wkWc4SSbPijmq3JHVZbCK39KIhvBX6FLLqxNuopTUSUAOPtyTxDsoWf5syLO2hLchTcYoloXirugFpqQtSBq9A7M5LOJgdjSEsRxOYB5yPhH3BAtJoRLwBZm8Z/xvtdrJ2qREudTPo9FtnVQbjBkJsCJ/PogqGxr6Re0tw5uG81Iat9wfoJHah8/eUGoU5+K5AzOFWogs9yXuV6HUUgfwFfAvN+kJuppJlwG8fCrk/LAyQ0FTsWlf/6QvYGRfIIwkxBic0e0jbfPpm1DpUtEwjuHKlmc=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7158.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(396003)(136003)(376002)(366004)(451199015)(91956017)(26005)(6486002)(478600001)(53546011)(6512007)(186003)(6506007)(316002)(6916009)(122000001)(36756003)(71200400001)(86362001)(2616005)(54906003)(38070700005)(38100700002)(33656002)(5660300002)(2906002)(41300700001)(8936002)(4744005)(66556008)(66946007)(66476007)(4326008)(66446008)(76116006)(8676002)(64756008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <0E2A4E2218B9E64B8489EDAAD311C2C1@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9454
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f9133223-7e6e-4e2c-4f90-08daddc77bd9
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hQNB6+LhQzCXqoCVw4zCZyaEOHlOWM/zX1X6yW41E4GKYHn8l9qkeDCN4e2lixTMqIGduRQbOwGDZt9YJ2+CaqTBxiOWA4rQMJUuNGx37ncjBci/YXS5GOcxny9LSrewEFiGryagpzx3iAYzm6ToKTnQRV6Ysx0xqMWmcev8BOtJb5PhLLZ//eULtPiDYtJli2y9Ro+/gJbt+YnD/fTAaqGTI26Hnh8xQPhbggEtmgHYPcVLeoghdOPqjnNVGgmoib4r04oBTFwU0HVcWs3KBZV+wC/MxmtQuUpbRVEFE4XoFQtzBtT5HyiOfdQF+1avfFM4dyi1fUPG7N7DC0AJOEvTMYXIdBSZgO21Or9lTfQpecvo7FZ/0C8RBvevnnBg63Ik7cTkmiatXO+jfNh3tu0Q68wvWjOWRRw1CawlF4Qik6ghoKxhNW0f6NCc0MiVwF7JqFZFZCDHsobAt3MawKKW/j6wDKSKKAXv82aMVgvXaYskPqU0lAfDP2oGMIwXRnXQP05hGESIlgrKKDrjJfjhOLK56RLPnxeub+6P5IiJKsAmMLuX+9z+nA3oY/5+j0uogaw65e8ScYsuVvlGbbJi0ctx1l9fb6FmEovndu35W2wqxz+iN/v8vdSq7x45iK2tCbGzLtJgvmUacHY5Uc5faxAvrrde3byaR10XNe8znQ6iVvhThNWJXTRsqEQTwgVZtwle/RzknNEWFwDxvg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(346002)(39860400002)(136003)(451199015)(40470700004)(36840700001)(46966006)(6862004)(8936002)(5660300002)(4744005)(41300700001)(2906002)(36756003)(36860700001)(6486002)(107886003)(70206006)(54906003)(316002)(33656002)(4326008)(8676002)(70586007)(478600001)(336012)(86362001)(47076005)(6512007)(53546011)(6506007)(186003)(26005)(40460700003)(2616005)(82740400003)(81166007)(82310400005)(40480700001)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2022 11:37:02.2258
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 103fd38c-e3d0-44c1-b915-08daddc784c7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9851

Hi Stewart,

> On 13 Dec 2022, at 6:18 pm, Stewart Hildebrand <stewart.hildebrand@amd.co=
m> wrote:
>=20
> When building with clang 12 and CONFIG_ARM_SMMU_V3=3Dy, we observe the
> following build error:
>=20
> drivers/passthrough/arm/smmu-v3.c:1408:20: error: unused function 'arm_sm=
mu_disable_pasid' [-Werror,-Wunused-function]
> static inline void arm_smmu_disable_pasid(struct arm_smmu_master *master)=
 { }
>                   ^
>=20
> arm_smmu_disable_pasid is not currently called from anywhere in Xen, but
> it is inside a section of code guarded by CONFIG_PCI_ATS, which may be
> helpful in the future if the PASID feature is to be implemented. Add the
> attribute __maybe_unused to the function.
>=20
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>

Reviewed-by: Rahul Singh <rahul.singh@arm.com>

Regards,
Rahul
 =

