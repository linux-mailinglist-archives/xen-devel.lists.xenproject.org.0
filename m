Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CCCD61ECB2
	for <lists+xen-devel@lfdr.de>; Mon,  7 Nov 2022 09:15:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.439106.693069 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1orxGn-0004wL-Ko; Mon, 07 Nov 2022 08:14:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 439106.693069; Mon, 07 Nov 2022 08:14:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1orxGn-0004tO-Hg; Mon, 07 Nov 2022 08:14:13 +0000
Received: by outflank-mailman (input) for mailman id 439106;
 Mon, 07 Nov 2022 08:14:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zkz+=3H=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1orxGl-0004tI-HQ
 for xen-devel@lists.xenproject.org; Mon, 07 Nov 2022 08:14:11 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70055.outbound.protection.outlook.com [40.107.7.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 26802b6e-5e74-11ed-8fd1-01056ac49cbb;
 Mon, 07 Nov 2022 09:14:07 +0100 (CET)
Received: from FR3P281CA0164.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a2::18)
 by DU0PR08MB9107.eurprd08.prod.outlook.com (2603:10a6:10:474::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.11; Mon, 7 Nov
 2022 08:14:05 +0000
Received: from VI1EUR03FT012.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:a2:cafe::bc) by FR3P281CA0164.outlook.office365.com
 (2603:10a6:d10:a2::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.11 via Frontend
 Transport; Mon, 7 Nov 2022 08:14:05 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT012.mail.protection.outlook.com (100.127.145.22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5791.20 via Frontend Transport; Mon, 7 Nov 2022 08:14:04 +0000
Received: ("Tessian outbound 73ab5f36653e:v130");
 Mon, 07 Nov 2022 08:14:04 +0000
Received: from 4e4af5fd337b.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DC86490B-A6A4-4789-B968-7130828E7BDA.1; 
 Mon, 07 Nov 2022 08:13:55 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4e4af5fd337b.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 07 Nov 2022 08:13:55 +0000
Received: from AM0PR08MB4530.eurprd08.prod.outlook.com (2603:10a6:208:13c::21)
 by AS1PR08MB7563.eurprd08.prod.outlook.com (2603:10a6:20b:472::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.11; Mon, 7 Nov
 2022 08:13:52 +0000
Received: from AM0PR08MB4530.eurprd08.prod.outlook.com
 ([fe80::461b:c1cb:368c:707e]) by AM0PR08MB4530.eurprd08.prod.outlook.com
 ([fe80::461b:c1cb:368c:707e%5]) with mapi id 15.20.5813.011; Mon, 7 Nov 2022
 08:13:51 +0000
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
X-Inumbo-ID: 26802b6e-5e74-11ed-8fd1-01056ac49cbb
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=T+JW2wJFWl7rqZK00VwXfaA7P9RTNLwBnnMguPkeZf4hTlb2SF9poeVlY/bvxjULBZ4vrMnHDcHh5vMYTO+lbwVu4vnLrp21r9AA+cXifLSG3ZN+Gx1zQ2OVS+oqewvBgvXI/v4/ZyB11pDp/jND8SNvczvBZXcIkEyJN24Gz7RV280pEZrprfw+lL0UtK3HA9Oow+evyhuRutgpvItJBiOpjKK5cGWmsXDyNvE6ZsRCQ5BF5TOZsNAni92bj0ANfp7AsbCNxOJs6812A0Bo6E2fVjJ1iHkgbn8scWDSPZXcniCmiOyoBYFHoYWZS9tSZ70EXLchj/36gMFMhpTIrg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lk9NoasUVOTkCBDr/3dLFRuEfRfCohQzAho7KSNL8sc=;
 b=UL7GGjM8O/cwXPXDnHNIctAncAKiYTwbout6Cz5ZvmvI0VwJlMxE24gFfZMirL3lCvdSruHiHy2K5QbtaBKxis3415E5kCWxs9ScmraKiPTwxExkS28vk1Drt6/3BSaO2yKpRIconSzP+dVNOW+/4gIJ6UvmVsLVARMpfrJ8CvE9+zDnSp8RWc15uHZiHnGZACqPuQrC03tiiXRl4mRzdSUxAtGWtjVqQDvxzI7SBua4e+Fpn+b6RbyBQTRYJbTKM5y1RrgnthEvVRGdVE9cpcZtDh06Xqi/CuNZbZqw/rAOVy0fwoM/jnmVmKxUYieQJj6aYIvj2aqp+xR0CTw44A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lk9NoasUVOTkCBDr/3dLFRuEfRfCohQzAho7KSNL8sc=;
 b=dscdued/0FTDU8HHEZg3+FK2t4ZB9fYax3vEBI+yTHd8khiOFec8pZs6E8KR+SaVRU8AmqS/3y7FxqmIThPdqqa+kwTBfhwceHB2il4iGnK5+iKEERM5uXiFnTeEZ23SkNN/FYdaacOvOVKfHzYWLNJBMfgTWXI55mggBzbhh0I=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AyQX6/Yhd31dVV6e/G4ToNcav8L/91MxdH8dvmXskkvjPH8X5mE2oSn3EKelXuN6ptUIBmhQR0sbINJ1JdnauoRxZhrfpeBD5RGfWW47dYJJAUjifJoVn7VjElxVcjHuzBET8VXJVpgY0Xrnhc8KsXwVsRmO9Z41F1EKkuzOcijxUq0j2XH9q4OMSlklg+SmyAxk07GlBrxMv/mv1ASDqQIm/S2Zzpm0YeZzCucvNf9lxaZc5QAVvzeV7A4509quBGG8XV4KMun8wJ9oJ/9fkXr1ZMAP5JU0XnkWXECxzy1lcVEM3slQVFx0jaXKtWSnRkpoxCui6oEPujUtu10wPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lk9NoasUVOTkCBDr/3dLFRuEfRfCohQzAho7KSNL8sc=;
 b=Hq4vGZtxkCCAQSxAgzPF7ZiMYuksR5z8uknKdhjNbNXZIar2r8lTDwRy9kTEjp5YqKL6EfKueIWW4u3NDkF33xY2iWT69P/9Sf0Th2yFCarfsolqTVZbxgOFnunsm4QvQLdBghyIYPA6SarLs5Qcof8hwDZNaNqjb8OYDC7XQ+4V8GuIgEHa/Ad6hcEabbcp5GYRTpLuc/XAvcIowwKtFprBRfJYtDc146FE6Iqfv+iYeAsr3cOHYWL0S1Hah8bpPC0R9VhJzh897zMU24RGdY9+z4nsZ8VCuNjv1QEOHof7qQdVDLrPZqWbf9dxZUE4/rhDBQcfSwD11en6Zh2HLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lk9NoasUVOTkCBDr/3dLFRuEfRfCohQzAho7KSNL8sc=;
 b=dscdued/0FTDU8HHEZg3+FK2t4ZB9fYax3vEBI+yTHd8khiOFec8pZs6E8KR+SaVRU8AmqS/3y7FxqmIThPdqqa+kwTBfhwceHB2il4iGnK5+iKEERM5uXiFnTeEZ23SkNN/FYdaacOvOVKfHzYWLNJBMfgTWXI55mggBzbhh0I=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Julien Grall <julien@xen.org>, Wei Chen <Wei.Chen@arm.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: nd <nd@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH v6 11/11] xen/arm64: add setup_fixmap and
 remove_identity_mapping for MPU
Thread-Topic: [PATCH v6 11/11] xen/arm64: add setup_fixmap and
 remove_identity_mapping for MPU
Thread-Index: AQHY8DVuAVhDJRf6ukC080lsu+G2J64yZbeAgAC01OA=
Date: Mon, 7 Nov 2022 08:13:51 +0000
Message-ID:
 <AM0PR08MB45308B2EEB1F956FE30C3289F73C9@AM0PR08MB4530.eurprd08.prod.outlook.com>
References: <20221104100741.2176307-1-wei.chen@arm.com>
 <20221104100741.2176307-12-wei.chen@arm.com>
 <84e476a5-9365-bb80-a8e2-86dcf09681f0@xen.org>
In-Reply-To: <84e476a5-9365-bb80-a8e2-86dcf09681f0@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 9711C6EF94D243438F0B097AE4A0E0A4.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM0PR08MB4530:EE_|AS1PR08MB7563:EE_|VI1EUR03FT012:EE_|DU0PR08MB9107:EE_
X-MS-Office365-Filtering-Correlation-Id: 323e6fb6-d469-4296-38dd-08dac0980952
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 xNUQ478zdUWTV7aE0AInzLoq5LGJsFuKdF23K1bpx26e9jDfiNCjGFVMdwpfL6qAWy7ztJSLWf377W8YoqAbeB4luAk/3DRx54E0NFr2UuVCbBsOleQsiiChr6wk3nuxo8ANTMnfmSv4ooKRO6YGnFM0orOO1c/nRl9EE328ccXpwkuL+HxQ2uQgA2hPNImW6GNq5gZpqm1oDOK+CVBxJakQKBBfWRaxmW9XOHGeaYWnIKrBRWSsGYmDRD5p9Mcvbr1x2Ph3EJb4XiEPtgkU8Xblb3GLEuGImG6vn/EHlmAVvWgFuBYJxc/Nq8uC0m2S4mEo83A52rkVk8IbLMiLIssfX164rkkXhUY6/IaFWpTJXpoXTbJqv3qaDsKoa6cKDwtRy2lWydFxmpxLNbY0elMvB+A+7QeeWsJLcBwOsBgVXw1OzJDxdT5IT8JSElB3BKd/SePk/vVOflNu11nT6xfxv++4KPxIDmZkJE5FpkVApaontdGaLnp4mrJRs/JiVCmiQ3CIWHHBOt/F6HUWkgOpRjkPW4QTRK2fgl4sHqIYutDba23/jQk8PAvZWX9WyfaztvPk89SD0WOdNiiwFcyguBfkB3cvxsGoBzEv2ycw1TUL1TaYtn5zIKzjI+9XGJFFncDEvNrraEpKRjQmg4xF9O/icqwGQn7Rq51u65K7U1rF9ZMjntPgYEG716pIoxEN2bRtl17icJrPmeq/VlYr8omzO519GTYpsBBay/rAQUW8XS7x6ips8Xjqdaa+7UTA5oXnULlipnmFbMgzRmVJQXFMyLlon5jQnzfag+0=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB4530.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(376002)(366004)(39860400002)(346002)(451199015)(110136005)(54906003)(316002)(966005)(5660300002)(55016003)(38070700005)(2906002)(83380400001)(478600001)(41300700001)(76116006)(66946007)(66446008)(66556008)(8676002)(4326008)(64756008)(66476007)(71200400001)(52536014)(33656002)(8936002)(9686003)(186003)(26005)(38100700002)(122000001)(53546011)(86362001)(6506007)(7696005);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR08MB7563
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VI1EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	34dc3efc-a7f7-4926-6319-08dac098017c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YzA6dWSOrjcwer/XxreKO/b6qJ1iHKqY846JksaNLTyutjUf4MhTn6598gqK5jbwmBoY/aoFnzO3dFn7MySouHdcIvYP6nCRFyPdMdpZm/xxB+KNcWTl9cfR94Q+tp1isJb92YQVHB3ZzmR1EN+7c2ldHZ1k9G3cUZUtTpSOMNz6e6Mq66smzPYcpZS7bsu1+OvjfHg0aJes+hETC/LAzn4QnMxtBUAqVWsSUbe6L/FodhzAqbVf2/wjToQy2A/+7zMIPBdqwwRi3f92UwnCLX3hwLoWFdHrvLDFnqI9ZYZ19J9/ng25Nq+9JH2j6DJFZBeXKEv8MLfIpL6I/YifZwl1mqthEIeEf0DVLeCF7aEleAy6FK3Wa03xs7chTGMCFcNJpLOKEpMD18WBzEifKiLjNetN8vFTwlPT3ScOG60yyVPJROqm8lsuOaPGm4c+9VcFQJGp/KFSghuTHMFm11GcHnwIsxWQ50K4DggUHY6HDxYg/HkDI1hJnoiOWzmn2LRnXia8AFMqNduqfw/0q612dGEGRHnxeuszDPlaJH0cgmFPLZupd0L9ntJ/YAL3vSqSk9A99nAU6lQYM5HbsFistdg9FD6dTcwhG1sDqW2vplBy9/y55PV3aMx73yOF3z8RlVNPnplqnU85MugJ41L2KF4AuyVKYogij3NSX8uOlT9LKstE5ToPYyWufNJzjanUCh8g5+uHv1rckLWq1Y6WZgOIJIHCDJwQW/OEqnpGXrPzch1JlJod/BD8oP3h2OmY6sQcOdw5D5R2kxVp5vcvSbvE2CBS64sT58z0vl+HP3aYaTPX9MBwHZA9j7LN
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(346002)(136003)(39860400002)(451199015)(46966006)(36840700001)(40470700004)(82310400005)(55016003)(36860700001)(966005)(33656002)(8936002)(5660300002)(81166007)(83380400001)(356005)(316002)(41300700001)(2906002)(70586007)(52536014)(70206006)(478600001)(4326008)(54906003)(8676002)(110136005)(40480700001)(40460700003)(336012)(186003)(53546011)(26005)(82740400003)(86362001)(6506007)(7696005)(47076005)(107886003)(9686003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2022 08:14:04.8729
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 323e6fb6-d469-4296-38dd-08dac0980952
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VI1EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9107

SGkgSnVsaWVuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSnVsaWVu
IEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4NCj4gU2VudDogTW9uZGF5LCBOb3ZlbWJlciA3LCAyMDIy
IDU6MDIgQU0NCj4gVG86IFdlaSBDaGVuIDxXZWkuQ2hlbkBhcm0uY29tPjsgeGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnDQo+IENjOiBuZCA8bmRAYXJtLmNvbT47IFBlbm55IFpoZW5nIDxQ
ZW5ueS5aaGVuZ0Bhcm0uY29tPjsgU3RlZmFubw0KPiBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBr
ZXJuZWwub3JnPjsgQmVydHJhbmQgTWFycXVpcw0KPiA8QmVydHJhbmQuTWFycXVpc0Bhcm0uY29t
PjsgVm9sb2R5bXlyIEJhYmNodWsNCj4gPFZvbG9keW15cl9CYWJjaHVrQGVwYW0uY29tPg0KPiBT
dWJqZWN0OiBSZTogW1BBVENIIHY2IDExLzExXSB4ZW4vYXJtNjQ6IGFkZCBzZXR1cF9maXhtYXAg
YW5kDQo+IHJlbW92ZV9pZGVudGl0eV9tYXBwaW5nIGZvciBNUFUNCj4gDQo+IEhpLA0KPiANCj4g
T24gMDQvMTEvMjAyMiAxMDowNywgV2VpIENoZW4gd3JvdGU6DQo+ID4gRnJvbTogUGVubnkgWmhl
bmcgPHBlbm55LnpoZW5nQGFybS5jb20+DQo+ID4NCj4gPiBzZXR1cF9maXhtYXAgYW5kIHJlbW92
ZV9pZGVudGl0eV9tYXBwaW5nIGFyZSB0d28gZnVuY3Rpb25zIHRoYXQgYXJlDQo+ID4gdXNlZCBp
biBYZW4gYm9vdC10aW1lIGNvZGUgZmxvdy4gV2UgaW1wbGVtZW50IHRoZXNlIHR3byBmdW5jdGlv
bnMgZm9yDQo+ID4gTVBVIHN5c3RlbSwgaW4gdGhpcyBjYXNlLCB0aGUgY29kZSBmbG93IGluIGhl
YWQuUyBkb2Vzbid0IG5lZWQgdG8gdXNlDQo+ID4gI2lmZGVmIHRvIGdhdGUgTVBVL01NVSBjb2Rl
Lg0KPiA+DQo+ID4gSW4gTU1VIHN5c3RlbSwgc2V0dXBfZml4bWFwIGlzIHVzZWQgZm9yIFhlbiB0
byBtYXAgc29tZSBlc3NlbnRhaWwgZGF0YQ0KPiA+IG9yIGRldmljZXMgaW4gYm9vdC10aW1lLiBG
b3IgTVBVIHN5c3RlbSwgd2Ugc3RpbGwgaGF2ZSB0aGlzDQo+ID4gcmVxdWlyZW1lbnQsIHdlIG1h
cCB0aGUgZWFybHkgVUFSVCB0byBNUFUgcHJvdGVjdGlvbiByZWdpb24gd2hlbg0KPiA+IGVhcmx5
cHJpbnRrIGlzIGVuYWJsZWQuIFRoaXMgYWxzbyBtZWFucyBQUklOVCBjYW4ndCBiZSB1c2VkIGFm
dGVyDQo+ID4gdHVybmluZyBvbiBNUFUgYnV0IGJlZm9yZSBzZXR1cF9maXhtYXAuIFRoaXMgcmVz
dHJpY3Rpb24gaXMgdGhlIHNhbWUNCj4gPiBhcyBNTVUgc3lzdGVtLg0KPiA+DQo+ID4gRm9yIHJl
bW92ZV9pZGVudGl0eV9tYXBwaW5nLCB3ZSBqdXN0IG5lZWQgYW4gZW1wdHkgZnVuY3Rpb24gdG8g
bWFrZQ0KPiA+IGhlYWQuUyBjb2RlIGZsb3cgaGFwcHkuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5
OiBXZWkgQ2hlbiA8d2VpLmNoZW5AYXJtLmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBQZW5ueSBa
aGVuZyA8cGVubnkuemhlbmdAYXJtLmNvbT4NCj4gPiAtLS0NCj4gPiAgIHhlbi9hcmNoL2FybS9h
cm02NC9oZWFkX21wdS5TICAgICAgICAgICAgICAgICB8IDQ5ICsrKysrKysrKysrKysrKysrKysN
Cj4gPiAgIC4uLi9hcm0vaW5jbHVkZS9hc20vcGxhdGZvcm1zL2Z2cF9iYXNlci5oICAgICB8ICA0
ICsrDQo+ID4gICAyIGZpbGVzIGNoYW5nZWQsIDUzIGluc2VydGlvbnMoKykNCj4gPg0KPiA+IGRp
ZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZF9tcHUuUw0KPiA+IGIveGVuL2FyY2gv
YXJtL2FybTY0L2hlYWRfbXB1LlMgaW5kZXggNWExYjAzZTI5My4uMzM2YzBhNjMwZg0KPiAxMDA2
NDQNCj4gPiAtLS0gYS94ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZF9tcHUuUw0KPiA+ICsrKyBiL3hl
bi9hcmNoL2FybS9hcm02NC9oZWFkX21wdS5TDQo+ID4gQEAgLTIwLDEzICsyMCwyMCBAQA0KPiA+
ICAgLyoNCj4gPiAgICAqIEluIGJvb3Qgc3RhZ2UsIHdlIHdpbGwgdXNlIDEgTVBVIHJlZ2lvbjoN
Cj4gPiAgICAqIFJlZ2lvbiMwOiBOb3JtYWwgbWVtb3J5IGZvciBYZW4gdGV4dCArIGRhdGEgKyBi
c3MgKDJNQikNCj4gPiArICogUmVnaW9uIzE6IERldmljZSBtZW1vcnkgZm9yIEVBUkxZIFVBUlQs
IHNpemUgaXMgZGVmaW5lZA0KPiA+ICsgKiAgICAgICAgICAgYnkgcGxhdGZvcm0ncyBFQVJMWV9V
QVJUX1NJWkUNCj4gPiAgICAqLw0KPiA+ICAgI2RlZmluZSBCT09UX05PUk1BTF9SRUdJT05fSURY
ICAweDANCj4gPiArI2RlZmluZSBCT09UX0RFVklDRV9SRUdJT05fSURYICAweDENCj4gPg0KPiA+
ICAgLyogTVBVIG5vcm1hbCBtZW1vcnkgYXR0cmlidXRlcy4gKi8NCj4gPiAgICNkZWZpbmUgUFJC
QVJfTk9STUFMX01FTSAgICAgICAgMHgzMCAgICAvKiBTSD0xMSBBUD0wMCBYTj0wMCAqLw0KPiA+
ICAgI2RlZmluZSBQUkxBUl9OT1JNQUxfTUVNICAgICAgICAweDBmICAgIC8qIE5TPTAgQVRUUj0x
MTEgRU49MSAqLw0KPiA+DQo+ID4gKy8qIE1QVSBkZXZpY2UgbWVtb3J5IGF0dHJpYnV0ZXMuICov
DQo+ID4gKyNkZWZpbmUgUFJCQVJfREVWSUNFX01FTSAgICAgICAgMHgyMCAgICAvKiBTSD0xMCBB
UD0wMCBYTj0wMCAqLw0KPiA+ICsjZGVmaW5lIFBSTEFSX0RFVklDRV9NRU0gICAgICAgIDB4MDkg
ICAgLyogTlM9MCBBVFRSPTEwMCBFTj0xICovDQo+ID4gKw0KPiA+ICAgLm1hY3JvIHdyaXRlX3By
LCBzZWwsIHByYmFyLCBwcmxhcg0KPiA+ICAgICAgIG1zciAgIFBSU0VMUl9FTDIsIFxzZWwNCj4g
PiAgICAgICBkc2IgICBzeQ0KPiA+IEBAIC02OSw2ICs3Niw0OCBAQCBFTlRSWShwcmVwYXJlX2Vh
cmx5X21hcHBpbmdzKQ0KPiA+ICAgICAgIHJldA0KPiA+ICAgRU5EUFJPQyhwcmVwYXJlX2Vhcmx5
X21hcHBpbmdzKQ0KPiA+DQo+ID4gKy8qDQo+ID4gKyAqIEluIE1NVSBzeXN0ZW0sIHNldHVwX2Zp
eG1hcCBpcyB1c2VkIGZvciBYZW4gdG8gbWFwIHNvbWUgZXNzZW50aWFsDQo+ID4gK2RhdGENCj4g
PiArICogb3IgZGV2aWNlcyBpbiBib290LXRpbWUuIEluIG9yZGVyIHRvIGJlIGNvbnNpc3RlbnQg
d2l0aCBNTVUNCj4gPiArc3lzdGVtLCB3ZQ0KPiA+ICsgKiBpbmhlcml0IHRoZSBmdW5jdGlvbiBu
YW1lIGZvciBNUFUgc3lzdGVtLg0KPiA+ICsgKiBzZXR1cF9maXhtYXAgb2YgTVBVIHN5c3RlbSB3
aWxsOg0KPiA+ICsgKiAtIE1hcCB0aGUgZWFybHkgVUFSVCB0byBNUFUgcHJvdGVjdGlvbiByZWdp
b24gd2hlbiBlYXJseXByaW50ayBpcw0KPiA+ICsgKiAgIGVuYWJsZWQgKFRoZSBQUklOVCBjYW4n
dCBiZSB1c2VkIGFmdGVyIHR1cm5pbmcgb24gTVBVIGJ1dCBiZWZvcmUNCj4gPiArICogICBzZXR1
cF9maXhtYXApLg0KPiANCj4gRm9yIHRoZSBNTVUsIHdlIGhhdmUgdGhpcyByZXN0cmljdGlvbiBi
ZWNhdXNlIHRoZSBmaXhtYXAgY291bGQgY2xhc2ggd2l0aA0KPiB0aGUgaWRlbnRpdHkgbWFwcGlu
Zy4gSSBkb24ndCB0aGluayB0aGVyZSBhcmUgc3VjaCByZXN0cmljdGlvbnMgZm9yIHRoZSBNUFUN
Cj4gYW5kIHRoZXJlZm9yZSBpdCBzZWVtcyBzdHJhbmdlIHRvIHBlcnRhaW4gdGhlIHNhbWUgYmVo
YXZpb3IuDQo+IA0KDQpZZXMsIGJvdGggcmVtb3ZpbmcgaWRlbnRpdHkgbWFwcGluZyBhbmQgdXNp
bmcgZml4bWFwIHZpcnR1YWwgbWVtb3J5IGxheW91dCBhcmUNCm5vdCBhcHBsaWVkIHRvIHRoZSBN
UFUgc3lzdGVtLg0KDQpBbmQgaW4gTU1VIHN5c3RlbSwgdGhlIHNldHVwX2ZpeG1hcCBmdW5jdGlv
biBoYXMgYSBiZWhhdmlvciB0byBtYXAgdGhlIFVBUlQNCmZvciBlYXJseSBwcmludGsuIEFuZCB3
ZSBhcmUgb25seSB0cnlpbmcgdG8gcGVydGFpbiB0aGlzIGJlaGF2aW9yIG9uIE1QVSBzeXN0ZW0u
IA0KDQo+IEluIGZhY3QsIEkgaGF2ZSBwbGFuIHRvIGdldCByaWQgb2YgdGhpcyByZXN0cmljdGlv
biBldmVuIGZvciB0aGUgTU1VLiBTbyBiZXR0ZXINCj4gdGhpcyByZXN0cmljdGlvbiBpcyBub3Qg
c3ByZWFkIGlmIHdlIGNhbi4NCg0KSG1tLCBJJ20gYSBiaXQgY29uZnVzZWQgaGVyZS4gV2hpY2gg
cmVzdHJpY3Rpb24geW91IGFyZSB0cnlpbmcgdG8gcmVtb3ZlPyBUaGUgd2hvbGUNCmZpeG1hcCB2
aXJ0dWFsIG1lbW9yeSBsYXlvdXQ/DQogDQo+IA0KPiA+ICsgKg0KPiA+ICsgKiBDbG9iYmVycyB4
MCAtIHgzDQo+ID4gKyAqLw0KPiA+ICtFTlRSWShzZXR1cF9maXhtYXApDQo+ID4gKyNpZmRlZiBD
T05GSUdfRUFSTFlfUFJJTlRLDQo+ID4gKyAgICAvKiBNYXAgZWFybHkgdWFydCB0byBNUFUgZGV2
aWNlIHJlZ2lvbiBmb3IgZWFybHkgcHJpbnRrLiAqLw0KPiA+ICsgICAgbW92IHgwLCAjQk9PVF9E
RVZJQ0VfUkVHSU9OX0lEWA0KPiA+ICsgICAgbGRyIHgxLCA9Q09ORklHX0VBUkxZX1VBUlRfQkFT
RV9BRERSRVNTDQo+ID4gKyAgICBhbmQgeDEsIHgxLCAjTVBVX1JFR0lPTl9NQVNLDQo+ID4gKyAg
ICBtb3YgeDMsICNQUkJBUl9ERVZJQ0VfTUVNDQo+ID4gKyAgICBvcnIgeDEsIHgxLCB4Mw0KPiA+
ICsNCj4gPiArICAgIGxkciB4MiwgPUNPTkZJR19FQVJMWV9VQVJUX0JBU0VfQUREUkVTUw0KPiA+
ICsgICAgbGRyIHgzLCA9KENPTkZJR19FQVJMWV9VQVJUX0JBU0VfQUREUkVTUyArIEVBUkxZX1VB
UlRfU0laRSAtIDEpDQo+ID4gKyAgICBhZGQgeDIsIHgyLCB4Mw0KPiA+ICsgICAgYW5kIHgyLCB4
MiwgI01QVV9SRUdJT05fTUFTSw0KPiA+ICsgICAgbW92IHgzLCAjUFJMQVJfREVWSUNFX01FTQ0K
PiA+ICsgICAgb3JyIHgyLCB4MiwgeDMNCj4gPiArDQo+ID4gKyAgICAvKg0KPiA+ICsgICAgICog
V3JpdGUgdG8gTVBVIHByb3RlY3Rpb24gcmVnaW9uOg0KPiA+ICsgICAgICogeDAgZm9yIHByX3Nl
bCwgeDEgZm9yIHByYmFyIHgyIGZvciBwcmxhcg0KPiA+ICsgICAgICovDQo+ID4gKyAgICB3cml0
ZV9wciB4MCwgeDEsIHgyDQo+ID4gKyNlbmRpZg0KPiA+ICsNCj4gPiArICAgIHJldA0KPiA+ICtF
TkRQUk9DKHNldHVwX2ZpeG1hcCkNCj4gPiArDQo+ID4gKy8qIFN0dWIgb2YgcmVtb3ZlX2lkZW50
aXR5X21hcHBpbmcgZm9yIE1QVSBzeXN0ZW1zICovDQo+ID4gK0VOVFJZKHJlbW92ZV9pZGVudGl0
eV9tYXBwaW5nKQ0KPiA+ICsgICAgcmV0DQo+ID4gK0VORFBST0MocmVtb3ZlX2lkZW50aXR5X21h
cHBpbmcpDQo+IA0KPiBUaGlzIHN0dWIgY291bGQgYmUgYXZvaWRlZCBpZiB5b3UgbW92ZSB0aGUg
Y2FsbCB0byByZW1vdmVfaWRlbnRpdHlfbWFwcGluZw0KPiBpbiBlbmFibGVfbW11KCkgYXMgSSBk
aWQgZm9yIGFybTMyLiBTZWUgWzFdLg0KPiANCj4gWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L2FsbC8yMDIyMTAyMjE1MDQyMi4xNzcwNy0zLWp1bGllbkB4ZW4ub3JnLw0KPiANCg0KVGh4ISBV
bmRlcnN0b29kLCBhbmQgSSdsbCB1c2UgdGhlIHNhbWUgbG9naWMgZm9yIGVuYWJsZV9tbXUuDQoN
Cj4gQ2hlZXJzLA0KPiANCj4gLS0NCj4gSnVsaWVuIEdyYWxsDQo=

