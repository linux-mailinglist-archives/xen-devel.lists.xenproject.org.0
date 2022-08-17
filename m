Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 951F4596999
	for <lists+xen-devel@lfdr.de>; Wed, 17 Aug 2022 08:35:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.388702.625439 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOCcp-0004b5-GY; Wed, 17 Aug 2022 06:33:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 388702.625439; Wed, 17 Aug 2022 06:33:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOCcp-0004Yf-DR; Wed, 17 Aug 2022 06:33:59 +0000
Received: by outflank-mailman (input) for mailman id 388702;
 Wed, 17 Aug 2022 06:33:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fSVa=YV=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1oOCcn-0004YZ-Jy
 for xen-devel@lists.xenproject.org; Wed, 17 Aug 2022 06:33:58 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2041.outbound.protection.outlook.com [40.107.20.41])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9079349c-1df6-11ed-9250-1f966e50362f;
 Wed, 17 Aug 2022 08:33:54 +0200 (CEST)
Received: from AM5PR0701CA0051.eurprd07.prod.outlook.com (2603:10a6:203:2::13)
 by HE1PR0801MB1836.eurprd08.prod.outlook.com (2603:10a6:3:89::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Wed, 17 Aug
 2022 06:33:51 +0000
Received: from VE1EUR03FT040.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:2:cafe::c6) by AM5PR0701CA0051.outlook.office365.com
 (2603:10a6:203:2::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.15 via Frontend
 Transport; Wed, 17 Aug 2022 06:33:50 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT040.mail.protection.outlook.com (10.152.18.210) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5546.15 via Frontend Transport; Wed, 17 Aug 2022 06:33:50 +0000
Received: ("Tessian outbound 2af316122c7a:v123");
 Wed, 17 Aug 2022 06:33:49 +0000
Received: from b817348e4be6.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B5A0B673-F819-4130-A626-14BEB96F0C38.1; 
 Wed, 17 Aug 2022 06:33:39 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b817348e4be6.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 17 Aug 2022 06:33:39 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com (2603:10a6:10:2e4::7)
 by DB8PR08MB4969.eurprd08.prod.outlook.com (2603:10a6:10:e1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16; Wed, 17 Aug
 2022 06:33:36 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::80f6:a08f:6f28:6518]) by DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::80f6:a08f:6f28:6518%8]) with mapi id 15.20.5504.028; Wed, 17 Aug 2022
 06:33:36 +0000
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
X-Inumbo-ID: 9079349c-1df6-11ed-9250-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=i+daGOeFbT/BIR5qu92sBiR+s0gVJvGFwiAoNzi69W6XYGgdd0Qs85LaVzktgDWNWCE8FP8Os3VoBuIJvsFnMv9s/6j+XVQZni2ovESazo+r9je6Ysw6cZehN2oe1rBHuYsvtOQrGZQNmBu8Jns1zM2VKEmBaJ6hO/nK2wWqefzawBJplZisVKg1525ylEDIOLnYGEXuWx/Kz4kg2mpAeJguy2Ok543rpjniXgRxoWRdYgtdAmbaStw6alIOGahXAk5z+7GXQnP7sJ8fr+SnKsPD+Fn2pqe3F/G5swQfOB9M5Udip5XAVlHpV+vz0ATBot3lf5PTdkMa598Li2QC+w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hX4NiNgz/35k5Kn33h5cyAgjRGD3jbW93N2mxUJwnVk=;
 b=G1Dzyoor/Jb3EEuwEvW8hZbjVa2Sw+SDirYx83G/+WhGR37Dm+ju8uMiTN/+ZK9FTeimX1EwzX7AFUQaXko94TuG09d/3OxL8ReejUq1uTGOT4ACwvqEMaFL47n8bu441s79e/W6MPnoqRnlmvx6PCnJ6d5ktyKhH3Z10YGzBiYTZzFLjUaopVsKqxWXtCrcZ+5WoUHwaHtRbC87JiC32mc8YFmdcsCz6GJmVSLfrGXmyXxCaNMRCajMXC0AeOK+UENrOKwmvi7H15Oxr86BTcZxJNVSLO+miAqjy4mFFjuO+CyNHIqGus7v39aVJmqlKV828+6abuffsWIGmDNdsA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hX4NiNgz/35k5Kn33h5cyAgjRGD3jbW93N2mxUJwnVk=;
 b=UTeH2a5yQgxd/gncxjbOxpA1KycbiFjMP767BBGjWtLIMZB1GXcsnKRayQ/hudqyLUybf8ZZjuLPKYGNRSbaiOHqj8kQVSVgOfLBgpCDaHDomCaO93qGQ+T9y5CtjKOlLYTDoMsRkp8aLE5obRUbfYA2C3KxDE8btReTBWftUYM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MMIslOvgbxeZMLvP2cyMfXub3ix++DJlDLuXYYpWzk+osqjHyoTo/JyxvwCvhNK5sfudFYEPLm0ko4VualrFXNGlIYYfILZYLnRcUjNRhek8L/7mzSGYFeiNN6RleDp7ZGQT2nnDgSMl4bTmL1aKpeSIjtUXuOw8idOs0t9FSdrnRTpuSyh+GkZwdYK0wdZrdk3S84sEoqSGEsKmc+JyO+E+s2whjbYzRHKBqS5yjpAIH6AmRnQGDbKlABPLKaQwUhYKDcwduwOGK3ONQhpTlCMiu2cSWp3KuhBJEqPBwskKaT8OSqqCkPz1jie6jucCouHm/DOmbN+HqBrp8onHZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hX4NiNgz/35k5Kn33h5cyAgjRGD3jbW93N2mxUJwnVk=;
 b=YDpZouQkN6i5bhOBvlzvMyZGfUIUaCp0ZumYERLS/BPgEuIsooJHx90vvFO7LvhcJZsGZZmxWQdZrvpdM2USEQ3cPhsGbJ+mO0nnc80HPO35YcIAGMHThlW/cINGiNZ7z3+Z9u/enOv1nslLT2+OKmquf6NFRQByJhXNnNKMMqFdOsPli/QKqaXvSxVJ7TsF2E1tj4+uAf8VM0EH+ys6ctbnyNBMgV+fuLBRyqb0qU/BT8l65H6aY6gD4W626JW1561nyYbRnTTy2pPLnEg4dTAnWCqASnjOJCE4aZe8g8yXKczooXX+VBvN3ng/MmNloG7Y7gcwrSWoSjReGGhALw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hX4NiNgz/35k5Kn33h5cyAgjRGD3jbW93N2mxUJwnVk=;
 b=UTeH2a5yQgxd/gncxjbOxpA1KycbiFjMP767BBGjWtLIMZB1GXcsnKRayQ/hudqyLUybf8ZZjuLPKYGNRSbaiOHqj8kQVSVgOfLBgpCDaHDomCaO93qGQ+T9y5CtjKOlLYTDoMsRkp8aLE5obRUbfYA2C3KxDE8btReTBWftUYM=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Julien Grall <jgrall@amazon.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH for-4.17] xen/arm: Support properly __ro_after_init on Arm
Thread-Topic: [PATCH for-4.17] xen/arm: Support properly __ro_after_init on
 Arm
Thread-Index: AQHYsaJ0xhlVHJdhd0SDwNAPSJC5Za2yoEsQ
Date: Wed, 17 Aug 2022 06:33:36 +0000
Message-ID:
 <DU2PR08MB7325F0A3D69B1CECC9896704F76A9@DU2PR08MB7325.eurprd08.prod.outlook.com>
References: <20220816185954.31945-1-julien@xen.org>
In-Reply-To: <20220816185954.31945-1-julien@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 81D34571BA5F8B4DBDB94E034C092CBD.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 8383c829-ccee-4d1e-3023-08da801a725b
x-ms-traffictypediagnostic:
	DB8PR08MB4969:EE_|VE1EUR03FT040:EE_|HE1PR0801MB1836:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 egSosROYD5fhKq1K/tK342mtQu8hAqqFUcD/pJ6vUNdWeBaxbDqpKuGAlztNgi9K8/Rlf3MvxSbbcf8/VSmUP/Vd/P4oZXl+oRpAO/H0Tox54qpQ6FIo3N4hnR7i6c0zskiolK/t1GUrnfORYzm2kbx5CjEtMkdI8/YU+dOzwwUewf1p7CRyAJQxlzN9hRcl5TnYtPr/hk5r6EjSIHcmqzcWG1jeaVPPgd7twshIKUOEXuHfkVLSA1kt9zQTORR3vLqUQaKG1LCL3a14pBCdCwNh54ZBjVN+XBLYI/IttIS6UlgnetWKMAxnmsEVRRxBxS2KxwdHVTfKOGDINMFj48LENvdDHS/G/to3O5HcIUHne7E4OssN5lAjlgOLVfSRuOBJ/YySwQd/yBEJSvzemYmkLiiXHnwHJxRoOZTSo0xBF4K3cIMU/nCzcv/QW1RNow/wYa2MQPBB2elY4qHX4UENMmf+KRrj9TcGBZ7Ask0DnqP+Kswso11Kxp+wcSFOS3+YQ4Os7n5bR3tB17hjVPo4BSD3n0ghCdejnTJdNfJHRY2R6kgaQGIfCsxzKFHmt6YxfJ7IM1uqOgyzl4WkKQDeRRg1IW8bM6MONEnucOUv/NPu3btZl5F21vgcxa6gUqlxFW5v+PaZ3LvacH/R55gw1NfIzErNCLQCLJ2mCbgBJJ9Ek/2uvlAdiCrnJhnF4VSBtEqdcikwCJLm3joYsK72drQix1wSFSkA2IINSY180xR6BHwCZjB80G22e7AbEzalQJgW/n2hoRf0GPvN2nesRBgChqFK1ytLRNgq89z18CFMOr+/UTYJlZ6dtBEr
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7325.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(376002)(396003)(136003)(366004)(346002)(122000001)(83380400001)(38070700005)(86362001)(76116006)(54906003)(4326008)(66476007)(66946007)(66446008)(64756008)(8676002)(38100700002)(66556008)(52536014)(5660300002)(316002)(8936002)(2906002)(110136005)(7696005)(6506007)(26005)(9686003)(53546011)(186003)(71200400001)(478600001)(55016003)(41300700001)(33656002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4969
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5535909e-5bf3-4f8c-8f66-08da801a6a12
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ApID+NrsWvhkza1xjeHjy7+2mpiOv0OXO08CCNvkamchDGU1oqHqFdFtHg5iQtkXVj7w6JYFAsBFjkmHoEptvSxWb/mTrL1H+oG5SRK3AF4vMIrtugAKLOw80cF/BXSw+dFL6gBZwDxbifmoiONISftrL1jFHWWuoJLdu9CTejxMtdMmnDu80dxKwOys3+uhf9//SI3migFbNDu18pqvPm3LKxhAx7ogXLVRZmRgb9sorLMZs8tbEyItSduXn92myAr/TsoV/wJCIsjaVyJmHrDW9SdnAngUxckv4goVFGHdtoOfu2kleeoq/x24xHV1Jbr5diajFsgj+ZLyo1ALOXfapQhNILAsMeAMm2p6gigqcdiR7HZehQVE8q2/eNk2vAefbxsR8U338ELl8OvimdOCsN2Xs7rApJwbFfPtZBvh8BNlHsFrb2qXnBXQZzIiU1X0OWX5uXsuzgStsdPd/xTc+kY429kYvYQmzbvHKkb3GkDDA0L3qtofP5mOqgYQZiDDwKeFmQzoVypiIxCNPtkSkZg3fwvgxJLSNYxVCnU6wK5EjLu8MRf2Tua2s5kmqIeBrHf0g0MJ8rA6cYHhikxI+ksj50DhQenU0L7GG1BPaVhshBSSBSySV0OPE/4dTwkXe7Wv5/pn9YK3+zO0HC5gLFEn9bB05beFkPmAXbmPagQm/HjVndzS73TfIw27AUihaej/nBuGd5momv8teORbnztoj3RtdYmAm0EqwknGXO0g/ywBYyP8/jvfRUtjoaNPEHamqlktIK/Ms1PKsvM0Kn+ptjnSUkcYBsaL+UXciy78jgqbU30OACH3RE1m
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(136003)(346002)(39860400002)(396003)(376002)(46966006)(40470700004)(36840700001)(83380400001)(7696005)(26005)(336012)(40460700003)(53546011)(33656002)(47076005)(6506007)(82310400005)(5660300002)(9686003)(186003)(107886003)(41300700001)(52536014)(40480700001)(55016003)(316002)(478600001)(2906002)(4326008)(86362001)(110136005)(8676002)(70206006)(82740400003)(70586007)(8936002)(36860700001)(54906003)(81166007)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2022 06:33:50.1252
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8383c829-ccee-4d1e-3023-08da801a725b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB1836

Hi Julien

> -----Original Message-----
> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of
> Julien Grall
> Sent: Wednesday, August 17, 2022 3:00 AM
> To: xen-devel@lists.xenproject.org
> Cc: julien@xen.org; Julien Grall <jgrall@amazon.com>; Stefano Stabellini
> <sstabellini@kernel.org>; Bertrand Marquis <Bertrand.Marquis@arm.com>;
> Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> Subject: [PATCH for-4.17] xen/arm: Support properly __ro_after_init on Ar=
m
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> __ro_after_init was introduced recently to prevent modifying some variabl=
es
> after init.
>=20
> At the moment, on Arm, the variables will still be accessible because the
> region permission is not updated.
>=20
> Address that, but moving the sections .data.ro_after_init out of .data an=
d
> then mark the region read-only once we finish to boot.
>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>
>=20

Reviewed-by: Penny Zheng <penny.zheng@arm.com>

> ---
>=20
> This patch is targeting Xen 4.17. There are quite a few arm specific vari=
ables
> that could be switch to use __ro_after_init.
>=20
> This is not addressed by the commit. We could consider to switch some of
> them for Xen 4.17. So the benefits for now is any common variables using
> __ro_after_init.
> ---
>  xen/arch/arm/include/asm/setup.h |  2 ++
>  xen/arch/arm/setup.c             | 14 ++++++++++++++
>  xen/arch/arm/xen.lds.S           |  7 +++++++
>  3 files changed, 23 insertions(+)
>=20
> diff --git a/xen/arch/arm/include/asm/setup.h
> b/xen/arch/arm/include/asm/setup.h
> index 2bb01ecfa88f..5815ccf8c5cc 100644
> --- a/xen/arch/arm/include/asm/setup.h
> +++ b/xen/arch/arm/include/asm/setup.h
> @@ -137,6 +137,8 @@ u32 device_tree_get_u32(const void *fdt, int node,
> int map_range_to_domain(const struct dt_device_node *dev,
>                          u64 addr, u64 len, void *data);
>=20
> +extern const char __ro_after_init_start[], __ro_after_init_end[];
> +
>  #endif
>  /*
>   * Local variables:
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c index
> 500307edc08d..5bde321b9d07 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -75,10 +75,24 @@ domid_t __read_mostly max_init_domid;
>=20
>  static __used void init_done(void)
>  {
> +    int rc;
> +
>      /* Must be done past setting system_state. */
>      unregister_init_virtual_region();
>=20
>      free_init_memory();
> +
> +    /*
> +     * We have finished to boot. Mark the section .data.ro_after_init
> +     * read-only.
> +     */

Nit: Maybe it is finish + doing, could be wrong, feel free to change or not=
~~
=20
> +    rc =3D modify_xen_mappings((unsigned long)&__ro_after_init_start,
> +                             (unsigned long)&__ro_after_init_end,
> +                             PAGE_HYPERVISOR_RO);
> +    if ( rc )
> +        panic("Unable to mark the .data.ro_after_init section read-only =
(rc
> =3D %d)\n",
> +              rc);
> +
>      startup_cpu_idle_loop();
>  }
>=20
> 2.37.1
>=20


