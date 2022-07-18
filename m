Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B06C35783EB
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jul 2022 15:40:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.369801.601316 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDQz5-0000jr-2a; Mon, 18 Jul 2022 13:40:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 369801.601316; Mon, 18 Jul 2022 13:40:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDQz4-0000i2-VE; Mon, 18 Jul 2022 13:40:26 +0000
Received: by outflank-mailman (input) for mailman id 369801;
 Mon, 18 Jul 2022 13:40:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5UWo=XX=arm.com=Marc.Bonnici@srs-se1.protection.inumbo.net>)
 id 1oDQz3-0000hp-DR
 for xen-devel@lists.xenproject.org; Mon, 18 Jul 2022 13:40:25 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30043.outbound.protection.outlook.com [40.107.3.43])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2c00bcdb-069f-11ed-bd2d-47488cf2e6aa;
 Mon, 18 Jul 2022 15:40:22 +0200 (CEST)
Received: from AS8PR04CA0047.eurprd04.prod.outlook.com (2603:10a6:20b:312::22)
 by AM6PR08MB3622.eurprd08.prod.outlook.com (2603:10a6:20b:4c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.14; Mon, 18 Jul
 2022 13:40:20 +0000
Received: from VE1EUR03FT049.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:312:cafe::79) by AS8PR04CA0047.outlook.office365.com
 (2603:10a6:20b:312::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.23 via Frontend
 Transport; Mon, 18 Jul 2022 13:40:20 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT049.mail.protection.outlook.com (10.152.19.216) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5438.12 via Frontend Transport; Mon, 18 Jul 2022 13:40:19 +0000
Received: ("Tessian outbound 6a3290ff1310:v123");
 Mon, 18 Jul 2022 13:40:19 +0000
Received: from ad529d77fbe9.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7E0B5B72-B17B-4C9A-B516-106F82FA60F1.1; 
 Mon, 18 Jul 2022 13:40:13 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ad529d77fbe9.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 18 Jul 2022 13:40:13 +0000
Received: from DB8PR08MB5452.eurprd08.prod.outlook.com (2603:10a6:10:111::10)
 by PAXPR08MB6656.eurprd08.prod.outlook.com (2603:10a6:102:135::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.15; Mon, 18 Jul
 2022 13:40:11 +0000
Received: from DB8PR08MB5452.eurprd08.prod.outlook.com
 ([fe80::4f1:335d:1b5f:feed]) by DB8PR08MB5452.eurprd08.prod.outlook.com
 ([fe80::4f1:335d:1b5f:feed%7]) with mapi id 15.20.5438.023; Mon, 18 Jul 2022
 13:40:11 +0000
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
X-Inumbo-ID: 2c00bcdb-069f-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=F1mBLisaIzBcaR7+8sZc2Hw68ctVPKDj/tcThv5OPn/2Ox7nTUs6R4Qd/Vqe9J0k6DbNeRh0NM6lZUrRnpZBo4QEhpOia4QAle4Ydbg8d8zk5Qqflc/RXW9E0+DIVIE5wjyjmRv/2I6PjokzMOwMNQ/9JfQg2bw7Hg9O6V3qrM8QJ2DBrQ5hcC06SsM7O/6Q7F4m3hGJ4MHU40LgxPSYG2oHOUwcoeeXTjKYrydx9cWEo33ob6HkPrXvEEoIrm0fGTywufzN+3ZjtmRgEkdiGu2oUYzjUiVi8Iftjg9C8moOaBtL0q39H6XQxmEVgjfQZc93PRsopP7QG/5cDkFeYw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rOirScCeSzXvj4um928qzdIzv7TtuIW2pHcKkfkWtFI=;
 b=XPbGwoMlNSHsTkyiEJRHZQSePeC1HChncLVL5eD9hYHZNQQHbhPTkXNcO4YSL6kP3wIuJ9ZZWxKIsLccuWBb1Juk44xjcFlJvsbgbDlmYq9aHMOQx6ddT7DYTV8xNrL072E0KXwQtxsVFKPvtDK+eSaYVSI7LZ472wP9Ni/S4RxkG+Rv6etSNb+QtwtMmM/xuxPqdvVWzuNSXwyd4+TOxEI5ElD04m81JkfZZ+ubQtmEjMNrcxDrN0iB8/fnzgGVqy7QnDce2sH8DtwoYGN24bLiXUXdKrw6jxLpQBCydXZcg+AG22qeInOd7nidYNgh0dk9Zk+imhpRpEq/ry7LEw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rOirScCeSzXvj4um928qzdIzv7TtuIW2pHcKkfkWtFI=;
 b=YKhBHLOSd9mnb2x7NLhGz3eOewPdo7D8bh5i8Pz4UF1xC38Y7hch0NLD2fzJf90Qa8Biwcz6cQaCpIEA2effDu6HqawILZb6kQXxBdkZbrQ1061BClm7KsihDyyVGpz7YVjUboe5wi4CSpEpwNrlwudSFV3o7Efhlx5nqZhYMLI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IYnZptiSLpqnZX0emNTvrI+JSjSaZmRYNPjVcjoPRYs6X/bVlRX1J9P8YGKGQCDqVCTawGuadV3fHQXB7zjz1g+sUQ4KL4s6Nws6bVBmPn6vU2ZRwqp4963hUfR1Iy8+rnFqqkJB/yktCvH01syQwEfiqssd1GaB4mFgjATjVkaekqX/NtSa4+TkQYHO9C3I/3DhorPMjSfyjp+R4BuoyWVkIk2yxS4qyCICFWUZ98OG03qEg12p8b540AgZZhtqhfvI/h3qIGIKl7rvFif+T2H5/dLPMfk2elDkUQebAxt8/iRbclwZj8TgVG6PmO1jPHCU9xTWXEtnExurf0QUmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rOirScCeSzXvj4um928qzdIzv7TtuIW2pHcKkfkWtFI=;
 b=TQb7H/d1SHxqvyjhbycAEGuRAu1epX3CEbWD8V4xPzl3DLFVYxZdR26xkLSrgGg61ZSecJgH9W0xo4EaBkNwBdPGobHsNfON9wAt/6VBpOV9cVZXI66fr1jBwJ9TkVtAfnF/3lzurNrAFvDKp5nP9K1GTbI36pGOTulEkpfjVd1V34hSry2fwDozx0CRVz3z/+zGyRVlRnofYfGfVVssZ1Q0FsFFHTVI3YyjGyKL+xUMuB307vzE5bxgOWE2NH9EkwCEMOqwmQpQ9Ckpswgwg/UD270HBVvdHiB5yps7D/GmeIQE2paQXqOvRfFuCGWCbTKOxe1MwVLy/zpmtyCAKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rOirScCeSzXvj4um928qzdIzv7TtuIW2pHcKkfkWtFI=;
 b=YKhBHLOSd9mnb2x7NLhGz3eOewPdo7D8bh5i8Pz4UF1xC38Y7hch0NLD2fzJf90Qa8Biwcz6cQaCpIEA2effDu6HqawILZb6kQXxBdkZbrQ1061BClm7KsihDyyVGpz7YVjUboe5wi4CSpEpwNrlwudSFV3o7Efhlx5nqZhYMLI=
From: Marc Bonnici <Marc.Bonnici@arm.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: Xen Memory Sharing Query
Thread-Topic: Xen Memory Sharing Query
Thread-Index: AdiXcIvKzj1u3ooYRvOwLKlCsLdCEAA/89UAAIdcHqA=
Date: Mon, 18 Jul 2022 13:40:11 +0000
Message-ID:
 <DB8PR08MB5452F79C2E13B0D7D9E58681968C9@DB8PR08MB5452.eurprd08.prod.outlook.com>
References:
 <DB8PR08MB5452C2AEA96D0BB6AECD6618968B9@DB8PR08MB5452.eurprd08.prod.outlook.com>
 <e9e66c0c-147e-c2a7-b8ad-99a82dc89a61@citrix.com>
In-Reply-To: <e9e66c0c-147e-c2a7-b8ad-99a82dc89a61@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: C51211359E8EE44E842BCFF30796C23D.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: e36ff496-60fc-4a5c-abe7-08da68c30e8c
x-ms-traffictypediagnostic:
	PAXPR08MB6656:EE_|VE1EUR03FT049:EE_|AM6PR08MB3622:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 vFiDpqT9rgJZqcP4tfU1ebFIZ7E6ZGI0vXtGAGmVnMrpXDXP+0lIH86Bi71Uxwmi/ofLNqG4dC4vf2M9Lfeb3rh2enNxUgjwnBhJp64/G4v+rEW0c89CDOO25b/N9BlXbNyfq9JdlZvCL6RGRbUQyF4OM81lV3xoKmCob85plFtIi3Zto9YSaxkf3lSPJ6nWudRqF3qin66sakOpywv+MvxwtZCDz9gUlfDa/CeNRx95prH4UksiJ55LPQJxhP6Dv/G9ZJY4xpKq9jP28CvJftkTsqxpojH8dvB6We6nVVoXS3z8r2Z9zy1NjbVVMqhw7O/YQKA3HXgC132TTwhWS3QuRloqkOAnV6qdiUfF8fUjkALIr1BXmds3csgV+5DuGO9jBxlefNm/8Ndz2Pv6hFGBwZICdpRIwxeLhxpLYl1jPGR3eny1Zg5Mw2hPl2neG97tI1qBuSdGeZEvk9FeTP3QkVfZFPkQ8c/WubQWkiKgH1kFSHt9v9dDv0ia77d3gmCB3Q3NdMdv/mG+TZQm6D2XBXOqHqXIN7EArxINnxSMUuAlrCWJiNAhrUlx3m7463+Kl3H7FbbzGpd8T5fl3NdKCEbLrQS+P2Mt2UGMEDEogQpMOC6j7/3PdY+VsFdDEnQQCfnzBPmWBnMVwliKR9FkeQuNOOuruQ77qh8sjwNveDkaBAGBBu1n7Ogr7cAuffDHYAW8heby73ekQKlB0IFBuICimuF+qmxhaHJY8SkCraN3LVHbw/X4sFTazYqM9pe/h7xTFxF5RibieIV/NIBzeXLisQStvdfDRMUNTVZaPsYnoKK/PWJqFiN82MOwsUKouERWjvcuv82WyyCTwFY9FLHmEq7Jlmm6HJ+vAxo=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR08MB5452.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(39860400002)(136003)(396003)(346002)(366004)(38070700005)(26005)(8676002)(9686003)(66446008)(76116006)(66946007)(66556008)(64756008)(41300700001)(66476007)(83380400001)(110136005)(7696005)(6506007)(86362001)(478600001)(3480700007)(316002)(53546011)(55016003)(186003)(71200400001)(5660300002)(38100700002)(2906002)(8936002)(122000001)(52536014)(33656002)(966005);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6656
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	703c5759-075c-4180-5dd4-08da68c30976
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EPYwiV1opkiNbHxhsP56oyyqLpeNfqDqAGhDYXiPuV1gi6IeSuDV5nKzWR8ZkOHMfSLTwrnYA3HsrMRxkRMoO7y1Eeto3BCiWXB3NP1s+BkvvuVi5tIcBdRF6w1ATofVjYEES/p+SBg7t1L4YrFJ/5XvSUAYE/0QrSBHmaVBWJL6j3pBndU044yaVethr4yIlgiCdREMa7GRyJmerWlyOFq9GEpNAsbNMyNWJwkylmNUp9+gvCNuFDUOZDvk3VJFaRVfP+t1lNwcioDDH4Q2kpS+U8/jtAeioG75sZhXdRshNMaFx9dFFr8C3fybYL2sY0XXs9fkidC+PSAWwfLUn5tlzhb7TA6q5tH9KXfic4ncJMiIRXJHmoqdjgdoonv6L+oZ6Djvv+aOdXDlLXW7IVmJUmLMJloKxlAwBSfcKK18EuVMrmyF8SpeS/B6dTkpRbaNmEBK3fi72C2eJ5lYXUmTWkRjmhdzTqBJ7YH8ahis3rIbtMShptsuRQs9cLZk6WRkG6GGN/vY5nOcN78kkN4X0O1fesx2kpHGA23i7daNpU7/HqamObb/tPZiuTRZnsKFlzmxfzYzyrTaMB+eg73a4QJYLuDfwbBAUOX/N/ocdBNFPMGiyE0VlgqtUZ8hsDt2e0be2e+OMDYxk8I8V3olNv3ltHRJBOXmssM2vdQEkKz6q41ESlY0LYzmAcM7HQQcHIvsOsdjq9cjSW9dVkfBtnL458Ol22CiF7zxhJ1jmJ471kNx3FXld0ZrLBk4T3AQSih1Jum5p7MmecXbnPxbb9L+LsBMWac1aJ0ISBsyVPD957gQ6GkryBxdscj99vS0rKiBOLiYOVNY2wjTyvaRoIoCdny5yO2hmf+OLhI=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(396003)(39860400002)(136003)(346002)(376002)(40470700004)(46966006)(36840700001)(5660300002)(41300700001)(966005)(53546011)(52536014)(3480700007)(8936002)(86362001)(478600001)(70206006)(8676002)(26005)(9686003)(2906002)(33656002)(40460700003)(6506007)(7696005)(47076005)(81166007)(36860700001)(82740400003)(356005)(82310400005)(83380400001)(336012)(316002)(110136005)(186003)(40480700001)(55016003)(70586007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2022 13:40:19.6795
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e36ff496-60fc-4a5c-abe7-08da68c30e8c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3622

SGkgQW5kcmV3LA0KDQpUaGFuayB5b3UgdmVyeSBtdWNoIGZvciB5b3VyIGRldGFpbGVkIHJlcGx5
LCB0aGF0IG1ha2UgdGhpbmdzIA0KYSBsb3QgY2xlYXJlci4gSSBkaWQgaGF2ZSBhIGZldyBmb2xs
b3cgdXAgcXVlc3Rpb25zLg0KDQo+IGdudHRhYiB2MiBpcyBob3JyaWJseSBtb3JlIGNvbXBsaWNh
dGVkLiAgDQoNCldpdGggdjIsIGRvIHRoZSBoaWdoIGxldmVsIGJlaGF2aW91cnMgY2hhbmdlIG11
Y2ggZnJvbSANCndoYXQgeW91IGhhdmUgb3V0bGluZWQgaGVyZT8gRG8geW91IGV4cGVjdCBpbiB0
aGUgbG9uZyB0ZXJtIA0KZm9yIHYyIHRvIGJlIHRoZSBwcmVmZXJyZWQgaW1wbGVtZW50YXRpb24g
b3IgYXJlIHRoZXkgbW9yZSBsaWtlIA0KYWx0ZXJuYXRpdmVzPw0KDQoNCj4gV2hpbGUgYSBncmVm
IGlzIG1hcHBlZCwgZG9tQSBpcyBub3QgcGVybWl0dGVkIHRvIGVkaXQgdGhlIA0KPiBhc3NvY2lh
dGVkIGVudHJ5LiAgDQoNClNvIElJVUMgb25jZSB0aGUgZ3JlZiBpcyBtYXBwZWQgdGhlbiBkb21B
IGNhbid0IG1ha2UgYW55IGNoYW5nZXMgDQp0byB0aGUgZW50cnkgYXQgYWxsLCAob3IgYXQgbGVh
c3QgdGhleSB3b24ndCBiZSByZWZsZWN0ZWQpLiBTbyBpZiANCmRvbUEgd2FudHMgdG8gbWFrZSBh
bnkgbW9kaWZpY2F0aW9ucyAoZXh0ZW5kIHRoZSBzaGFyZWQgbWVtb3J5IA0KcmVnaW9uLCBjaGFu
Z2UgcGVybWlzc2lvbnMgZXRjLiksIHRoZW4gaXQgd291bGQganVzdCBjcmVhdGUgYW5vdGhlcg0K
ZW50cnkgYW5kIHNoYXJlIHRoZSBuZXcgZ3JlZj8gDQoNCg0KPiBGcm9tIGEgZ3JhbnQgcGVyc3Bl
Y3RpdmUsIFhlbiBkb2Vzbid0IGVuZm9yY2UgYW55IHBvbGljeS4gIGRvbUEncyBncmVmcw0KPiBj
YW4gYmUgbWFwcGVkIGluIHRoZSBtYW5uZXIgcGVybWl0dGVkIGJ5IHdoYXQgZG9tQSB3cm90ZSBp
bnRvIHRoZSBncmFudA0KPiB0YWJsZS4NCg0KU28gZG9lcyB0aGlzIG1lYW4gdGhhdCBpZiBkb21B
IGdyYW50cyBhY2Nlc3MgdG8gZG9tQiBmb3IgYSBnaXZlbiBmcmFtZSwgDQphbmQgdGhlbiBhZGRl
ZCBhIG5ldyBlbnRyeSBpbiBpdHMgZ3JhbnQgdGFibGUgd2l0aCB0aGUgc2FtZSBmcmFtZSBkZXRh
aWxzIA0KYnV0IHdpdGggImRvbWlkID0gZG9tQyIgaW5zdGVhZC4gVGhpcyB3b3VsZCBiZSBhbGxv
d2VkPyBBbmQgaWYgc28sIHdvdWxkIHRoaXMgDQpyZXN1bHQgaW4gYSAzLXdheSBzaGFyZWQgYnVm
ZmVyPw0KDQpBbmQgZmluYWxseSBhIHNpbWlsYXIgc2NlbmFyaW8sIGlmIGEgZnJhbWUgd2FzIHNo
YXJlZCBmcm9tIGRvbUEgdG8gZG9tQiwgDQp3b3VsZCBkb21CIGJlIGFibGUgdG8gYWRkIGFuIGVu
dHJ5IGluIGl0cyBvd24gZ3JhbnQgdGFibGUgdG8gc2hhcmUgdGhlIA0Kc2FtZSBmcmFtZSB3aXRo
IGRvbUMgYW5kIGVuZCB1cCB3aXRoIHRoZSBzYW1lIG91dGNvbWU/DQoNClRoYW5rcw0KDQpLaW5k
IFJlZ2FyZHMNCk1hcmMgQm9ubmljaQ0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+
IEZyb206IEFuZHJldyBDb29wZXIgPEFuZHJldy5Db29wZXIzQGNpdHJpeC5jb20+DQo+IFNlbnQ6
IDE1IEp1bHkgMjAyMiAxODoyOQ0KPiBUbzogTWFyYyBCb25uaWNpIDxNYXJjLkJvbm5pY2lAYXJt
LmNvbT47IHhlbi0NCj4gZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCj4gU3ViamVjdDogUmU6
IFhlbiBNZW1vcnkgU2hhcmluZyBRdWVyeQ0KPiANCj4gT24gMTUvMDcvMjAyMiAxNjo1NiwgTWFy
YyBCb25uaWNpIHdyb3RlOg0KPiA+IEhpIEFsbCwNCj4gPg0KPiA+IEkgd2FzIHdvbmRlcmluZyBp
ZiBzb21lb25lIGNvdWxkIGhlbHAgbWUgdW5kZXJzdGFuZCBzb21lIG9mIHRoZQ0KPiBydWxlcyBv
ZiB0aGUNCj4gPiBtZW1vcnkgc2hhcmluZyBpbXBsZW1lbnRhdGlvbiBpbiBYZW4/DQo+ID4NCj4g
PiBTcGVjaWZpY2FsbHkgSSdtIGxvb2tpbmcgdG8gdW5kZXJzdGFuZCB3aGF0IHJlc3RyaWN0aW9u
cyBYZW4NCj4gcGxhY2VzIG9uDQo+ID4gZ3JhbnRpbmcgYWNjZXNzIGZyb20gb25lIERvbSB0byBh
bm90aGVyIGZyb20gWGVuJ3MgcGVyc3BlY3RpdmUsDQo+IGFuZCB3aGF0IHR5cGVzDQo+ID4gb2Yg
Z3JhbnQgcmVxdWVzdHMgd291bGQgYmUgYWxsb3dlZC9yZWplY3RlZCBieSBYZW4/DQo+ID4NCj4g
PiBJLmUuIEhvdyB3b3VsZCB0aGUgc2l0dWF0aW9uIGJlIGhhbmRsZWQgaWYgdGhlIHNhbWUgZnJh
bWUgb2YNCj4gbWVtb3J5IHdhcyBhdHRlbXB0ZWQNCj4gPiB0byBiZSBzaGFyZWQgbXVsdGlwbGUg
dGltZXM/DQo+ID4NCj4gPiBBcyBhbiBleGFtcGxlIHNjZW5hcmlvLCBEb21BIHNoYXJlcyAxIHBo
eXNpY2FsIHBhZ2Ugb2YgbWVtb3J5IGluIGENCj4gdHJhbnNhY3Rpb24NCj4gPiB3aXRoIERvbUIu
IEFuZCB0aGVuIHdpdGhvdXQgcmVsZWFzaW5nIGFueSBtZW1vcnksIERvbUEgYXR0ZW1wdHMgdG8N
Cj4gc2hhcmUNCj4gPiBhbm90aGVyIHJlZ2lvbiBvZiBtZW1vcnksIHdoaWNoIGluY2x1ZGVzIHRo
ZSBzYW1lIHBoeXNpY2FsIHBhZ2Ugb2YNCj4gdGhlIHByZXZpb3VzIHNoYXJlDQo+ID4gd2l0aCBE
b21CIGFnYWluLiBUaGlzIHdvdWxkIHJlc3VsdCBpbiB0d28gY29uY3VycmVudCBzaGFyZXMNCj4g
Y29udGFpbmluZyBhbiBvdmVybGFwLg0KPiA+DQo+ID4gQXBvbG9naWVzIGlmIEkndmUgbWlzc2Vk
IHNvbWV0aGluZyBidXQgaXMgdGhlcmUgYW55IGRvY3VtZW50YXRpb24NCj4gLyB0aHJlYXQgbW9k
ZWwNCj4gPiB0aGF0IHdvdWxkIGNvdmVyIHRoZXNlIHR5cGVzIG9mIHNjZW5hcmlvcz8gU28gZmFy
IEkgaGF2ZSBiZWVuDQo+IHRyeWluZyB0byByZWFkIHRocm91Z2gNCj4gPiB0aGUgY29kZSBidXQg
d2FzIHdvbmRlcmluZyBpZiB0aGVyZSBpcyBzb21ldGhpbmcgZWxzZSBJIGNvdWxkDQo+IHJlZmVy
IHRvIGhlbHAgbWUNCj4gPiB3aXRoIG15IHVuZGVyc3RhbmRpbmc/DQo+IA0KPiBUaGVyZSdzIG5v
dGhpbmcgYWRlcXVhdGVseSB3cml0dGVuIGRvd24uwqAgSXQgb3VnaHQgdG8gbGl2ZSBpbiBzcGhp
bngNCj4gZG9jcywgYnV0IG15IGNvcGlvdXMgZnJlZSB0aW1lIGlzIG5vbi1leGlzdGVudCBmb3Ig
c3BlY3VsYXRpdmUNCj4gc2VjdXJpdHkNCj4gcmVhc29ucy4NCj4gDQo+IFRoaXMgYWxsIHBlcnRh
aW5zIHRvIGdudHRhYiB2MSB3aGljaCBpcyB0aGUgb25seSBzdXBwb3J0ZWQgb25lIG9uDQo+IEFS
TQ0KPiByaWdodCBub3cuwqAgZ250dGFiIHYyIGlzIGhvcnJpYmx5IG1vcmUgY29tcGxpY2F0ZWQu
wqAgUmVmZXIgdG8NCj4gaHR0cHM6Ly9naXRodWIuY29tL3hlbi0NCj4gcHJvamVjdC94ZW4vYmxv
Yi9tYXN0ZXIveGVuL2luY2x1ZGUvcHVibGljL2dyYW50X3RhYmxlLmgjTDEzMi1MMTg2DQo+IA0K
PiBXaGVuIERvbUEgYW5kIERvbUIgYXJlIHNldCB1cCBhbmQgcnVubmluZywgdGhleSBlYWNoIGhh
dmUgYSBncmFudA0KPiB0YWJsZS7CoCBUaGUgZ3JhbnQgdGFibGUgaXMgc29tZSBzaGFyZWQgbWVt
b3J5IChvZiBYZW4ncykgbWFwcGVkIGludG8NCj4gdGhlDQo+IGd1ZXN0LCBhbmQgaXMgYSBiaWRp
cmVjdGlvbmFsIGNvbW11bmljYXRpb24gaW50ZXJmYWNlIGJldHdlZW4gdGhlDQo+IGd1ZXN0DQo+
IGtlcm5lbCBhbmQgWGVuLg0KPiANCj4gVGhlIGd1ZXN0IGtlcm5lbCBsb2dpY2FsbHkgb3ducyB0
aGUgZ3JhbnQgdGFibGUsIGFuZCBpdCdzIGEgc2ltcGxlDQo+IGFycmF5DQo+IG9mIGdyYW50IGVu
dHJpZXMuwqAgRW50cmllcyAwIHRocnUgNyBhcmUgcmVzZXJ2ZWQgZm9yIHN5c3RlbSB1c2UsIGFu
ZA0KPiBpbmRlZWQgdHdvIGVudHJpZXMgKG9uZSBmb3IgeGVuc3RvcmUsIG9uZSBmb3IgeGVuY29u
c29sZSkgYXJlIHNldCB1cA0KPiBvbg0KPiB0aGUgZ3Vlc3Qga2VybmVsJ3MgYmVoYWxmIGJ5IHRo
ZSBkb21haW4gYnVpbGRlci7CoCBFbnRyaWVzIDggdGhydSAkTg0KPiBhcmUNCj4gZW50aXJlbHkg
dW5kZXIgdGhlIGd1ZXN0J3MgY29udHJvbC4NCj4gDQo+IEEgZ3Vlc3Qga2VybmVsIChkb21BKSBj
cmVhdGVzIGEgZ3JhbnQgYnkgZmlsbGluZyBpbiBhIGdyYW50IHRhYmxlDQo+IGVudHJ5LA0KPiBh
bmQgcGFzc2luZyB0aGUgZ3JhbnQgcmVmZXJlbmNlICh0aGUgZW50cnkncyBpbmRleCBpbiB0aGUg
dGFibGUpIHRvDQo+IHNvbWUNCj4gb3RoZXIgZW50aXR5IGluIHRoZSBzeXN0ZW0gKGluIHRoaXMg
Y2FzZSwgZG9tQikuDQo+IA0KPiBUaGUgZ3JhbnQgdGFibGUgZW50cnkgaXMgZm9ybWVkIG9mOg0K
PiANCj4gdTE2IGZsYWdzDQo+IHUxNiBkb21pZA0KPiB1MzIgZnJhbWUNCj4gDQo+IHNvIGZvciBk
b21BIHRvIGdyYW50IGEgZnJhbWUgdG8gZG9tQiwgaXQgd291bGQgcGljayBhIGZyZWUgZ3JlZiAo
YW55DQo+IGVudHJ5IGluIHRoZSB0YWJsZSB3aXRoIGZsYWdzPTApIGFuZCBmaWxsIGluOg0KPiAN
Cj4gZnJhbWUgPSBmDQo+IGRvbWlkID0gZG9tQg0KPiBzbXBfd21iKCkNCj4gZmxhZ3MgPSBHVEZf
cGVybWl0X2FjY2VzcyAodGhpbmsgImdyYW50IHVzYWJsZSIpDQo+IA0KPiBHRlRfcmVhZG9ubHkg
aXMgYW5vdGhlciByZWxldmFudCBmbGFnIHRoYXQgZG9tQSBtaWdodCBjaG9vc2UgdG8gc2V0Lg0K
PiANCj4gVGhlbiwgZG9tQiB3b3VsZCB0YWtlIHRoZSBncmVmIGl0IGhhcyBiZWVuIGdpdmVuIGJ5
IGRvbUEsIGFuZCBtYWtlIGENCj4gZ250dGFiX29wX21hcCgpIGh5cGVyY2FsbCwgcGFzc2luZyB7
ZG9tQSwgZ3JlZn0gYXMgYW4gaW5wdXQuDQo+IA0KPiBYZW4gbG9va3MgdXAgZ3JlZiBpbiBkb21B
J3MgZ3JhbnQgdGFibGUsIGNoZWNrcyBlLmcuIGRvbUEgZ3JhbnRlZA0KPiBhY2Nlc3MNCj4gdG8g
ZG9tQiwgYW5kIGlmIGV2ZXJ5dGhpbmcgaXMgaGFwcHksIHNldHMgdGhlIHRoZQ0KPiBHRlRfe3Jl
YWRpbmcsd3JpdGluZ30NCj4gZmxhZ3MgKGFzIGFwcHJvcHJpYXRlKSBpbiBmbGFncy7CoCBUaGlz
IHRlbGxzIGRvbUEgdGhhdCB0aGUgZ3JhbnQgaXMNCj4gY3VycmVudGx5IG1hcHBlZCByZWFkYWJs
eSBhbmQvb3Igd3JpdGVhYmx5Lg0KPiANCj4gTGF0ZXIsIHdoZW4gZG9tQiB1bm1hcHMgdGhlIGdy
YW50LCBYZW4gY2xlYXJzIHRoZQ0KPiBHRlRfe3JlYWRpbmcsd3JpdGluZ30NCj4gYml0cywgdGVs
bGluZyBkb21BIHRoYXQgdGhlIGdyYW50IGlzIG5vIGxvbmdlciBpbiB1c2UuDQo+IA0KPiBEb21B
IHRoZW4gY2xlYXJzIEdURl9wZXJtaXRfYWNjZXNzIHRvIG1hcmsgdGhpcyBhcyBncmVmIGFzIGlu
dmFsaWQsDQo+IGFuZA0KPiBjYW4gdGhlbiBmcmVlIHRoZSBmcmFtZS4NCj4gDQo+IA0KPiBOb3cs
IHRoYXQncyB0aGUgc2ltcGxlIG92ZXJ2aWV3LsKgIFRvIGFuc3dlciBzb21lIG9mIHlvdXIgc3Bl
Y2lmaWMNCj4gcXVlc3Rpb25zOg0KPiANCj4gRG9tQSBpcyBwZXJmZWN0bHkgZnJlZSB0byBncmFu
dCBhd2F5IHRoZSBzYW1lIGZyYW1lIG11bHRpcGxlIHRpbWVzLg0KPiBEb21BIGRvZXMgdGhpcyBi
eSB3cml0aW5nIG11bHRpcGxlIGRpZmZlcmVudCBncmVmcyB3aXRoIHRoZSBzYW1lDQo+IGZyYW1l
DQo+IGZpZWxkLsKgIFRoZXNlIGdyZWZzIGNvdWxkIGJlIHRvIHRoZSBzYW1lLCBvciBkaWZmZXJl
bnQgZG9tYWlucywgYW5kDQo+IGNhbg0KPiBoYXZlIGFueSAodmFsaWQpIGNvbWJpbmF0aW9uIG9m
IGZsYWdzLg0KPiANCj4gRG9tQiBpcyBwZXJmZWN0bHkgZnJlZSB0byBtYXAgdGhlIHNhbWUgZ3Jl
ZiBtdWx0aXBsZSB0aW1lcy7CoCBUaGlzIGlzDQo+IGFjdHVhbGx5IGEgbmVjZXNzaXR5IGZvciB4
ODYgUFYgZ3Vlc3RzLCBiZWNhdXNlIG9mIGhvdyB3ZSByZWZlcmVuY2UNCj4gY291bnQgcGFnZXRh
YmxlIGVudHJpZXMuwqAgSXQgaXMgbm90IG5lY2Vzc2FyeSBmb3IgYW55IGtpbmQgb2YgZ3Vlc3QN
Cj4gb2YNCj4gSFZNIGd1ZXN0ICh4ODYgb3IgQVJNKSBiZWNhdXNlIG9mIGhvdyBndWVzdCBwaHlz
aWNhbCBhZGRyZXNzIHNwYWNlDQo+IHdvcmtzLg0KPiANCj4gSU1PIGl0IHNob3VsZCBoYXZlIGJl
ZW4gcmVzdHJpY3RlZCB3aGVuIHRoZSBIVk0gQUJJIHdhcyBkZXNpZ25lZCwNCj4gYnV0DQo+IGFs
YXMuwqAgSW4gcHJhY3RpY2UsIFhlbiBoYXMgYW4gaW50ZXJuYWwgcmVmY291bnQgd2hpY2ggcHJl
dmVudHMgYQ0KPiBncmVmDQo+IGJlaW5nIG1hcHBlZCBtb3JlIHRoYW4gMTI3IHRpbWVzIElJUkMu
DQo+IA0KPiBXaGlsZSBhIGdyZWYgaXMgbWFwcGVkLCBkb21BIGlzIG5vdCBwZXJtaXR0ZWQgdG8g
ZWRpdCB0aGUgYXNzb2NpYXRlZA0KPiBlbnRyeS7CoCBEb2luZyBzbyBzaG91bGRuJ3QgY2F1c2Ug
YSBzZWN1cml0eSB2aW9sYXRpb24gKFhlbiBoYXMgYQ0KPiBsb2NhbA0KPiBjb3B5IG9mIHRoZSBl
bnRyeSBpbiB0aGUgbWFwdHJhY2sgdGFibGUpLCBidXQgd2lsbCBhdCBsZWFzdCBjb25mdXNlDQo+
IGRpYWdub3N0aWNzIG9mIHRoZSBncmFudGVkIHN0YXRlLg0KPiANCj4gSW1wb3J0YW50bHksIGFu
ZCB3aGF0IG1heSBjb21lIGFzIGEgc3VycHJpc2UsIGlzIHRoYXQgZG9tQSBoYXMgbm8NCj4gd2F5
IHRvDQo+IHJldm9rZSBhIGN1cnJlbnRseS1tYXBwZWQgZ3JhbnQuwqAgRml4aW5nIHRoaXMgbGlt
aXRhdGlvbiBoYXMgYmVlbg0KPiBkaXNjdXNzZWQgc2V2ZXJhbCB0aW1lczsgdGhlcmUgYXJlIHNv
bWUgdmVyeSBjb21wbGljYXRlZCBjb3JuZXINCj4gY2FzZXMsDQo+IGFuZCBJJ20gbm90IGF3YXJl
IG9mIGFueSB3b3JrIGhhdmluZyBzdGFydGVkIGluIGVhcm5lc3QuDQo+IA0KPiBYZW4gZG9lcyBo
YXZlIGxvZ2ljIHRvIHVubWFwIGdyYW50cyBvZiBWTXMgd2hpY2ggaGF2ZSBzaHV0IGRvd24gKGZv
cg0KPiB3aGF0ZXZlciByZWFzb24pIHdpdGggZ3JhbnRzIHN0aWxsIG1hcHBlZC7CoCBUaGlzIHBy
ZXZlbnRzIGRlYWRsb2Nrcw0KPiAoZS5nLiB0d28gZG9tYWlucyBncmFudCB0byBlYWNoIG90aGVy
LCB0aGVuIGJvdGggY3Jhc2ggZGVsaWJlcmF0ZWx5KS4NCj4gDQo+IA0KPiBGcm9tIGEgZ3JhbnQg
cGVyc3BlY3RpdmUsIFhlbiBkb2Vzbid0IGVuZm9yY2UgYW55IHBvbGljeS7CoCBkb21BJ3MNCj4g
Z3JlZnMNCj4gY2FuIGJlIG1hcHBlZCBpbiB0aGUgbWFubmVyIHBlcm1pdHRlZCBieSB3aGF0IGRv
bUEgd3JvdGUgaW50byB0aGUNCj4gZ3JhbnQNCj4gdGFibGUuDQo+IA0KPiBJZiB5b3Ugd2FudCB0
byBnZXQgaW50byBwb2xpY2llcyB0aGF0IFhlbiBtYXkgZW5mb3JjZSwgdGhhdCB3b3VsZCBiZQ0K
PiBhDQo+IGRpc2N1c3Npb24gYWJvdXQgWFNNLCBYZW4gU2VjdXJpdHkgTW9kdWxlcy4NCj4gDQo+
IERvZXMgYW55IG9mIHRoaXMgaGVscD8NCj4gDQo+IH5BbmRyZXcNCg==

