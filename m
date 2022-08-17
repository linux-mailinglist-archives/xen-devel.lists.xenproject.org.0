Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58218596847
	for <lists+xen-devel@lfdr.de>; Wed, 17 Aug 2022 06:46:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.388665.625390 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOAwX-0000DN-Os; Wed, 17 Aug 2022 04:46:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 388665.625390; Wed, 17 Aug 2022 04:46:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOAwX-0000AV-LJ; Wed, 17 Aug 2022 04:46:13 +0000
Received: by outflank-mailman (input) for mailman id 388665;
 Wed, 17 Aug 2022 04:46:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2GH1=YV=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oOAwV-0000AN-Tu
 for xen-devel@lists.xenproject.org; Wed, 17 Aug 2022 04:46:12 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20087.outbound.protection.outlook.com [40.107.2.87])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8354cfbc-1de7-11ed-bd2e-47488cf2e6aa;
 Wed, 17 Aug 2022 06:46:10 +0200 (CEST)
Received: from FR0P281CA0071.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:49::10)
 by AM6PR08MB5093.eurprd08.prod.outlook.com (2603:10a6:20b:d5::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.17; Wed, 17 Aug
 2022 04:46:07 +0000
Received: from VE1EUR03FT055.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:49:cafe::93) by FR0P281CA0071.outlook.office365.com
 (2603:10a6:d10:49::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.15 via Frontend
 Transport; Wed, 17 Aug 2022 04:46:07 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT055.mail.protection.outlook.com (10.152.19.158) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5546.15 via Frontend Transport; Wed, 17 Aug 2022 04:46:07 +0000
Received: ("Tessian outbound fa99bf31ee7d:v123");
 Wed, 17 Aug 2022 04:46:06 +0000
Received: from 8005e63cb4f5.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8F4664D1-B6FE-495E-9B1E-611AAF265C0E.1; 
 Wed, 17 Aug 2022 04:45:56 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8005e63cb4f5.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 17 Aug 2022 04:45:56 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AM5PR0801MB1730.eurprd08.prod.outlook.com (2603:10a6:203:38::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Wed, 17 Aug
 2022 04:45:53 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::240a:5b52:7540:5772]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::240a:5b52:7540:5772%3]) with mapi id 15.20.5504.028; Wed, 17 Aug 2022
 04:45:53 +0000
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
X-Inumbo-ID: 8354cfbc-1de7-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Q/PLjecc6sGpRYFUgCnf9rr1VdxS/6D1Tg7OaPshIuJWaHFibz3tIMrhlRBqALQ1XDrffP4DP7i9ZVVzoWRY5agqnxNaPKLdHPDaxuDDMEbT+P3KRgTvifb8sL9CA+Vmhc0CSUc22wuJU9+DEpDNiPTPhflvtKeLCzZT93aDupBuCZZYzozscC29pQ7+YMptiru8TPRmk5r6nZEpsVXrI3Kj+lJyJWPfbuxwFRb+vxN5VidRsWhZDlHxGyiCQjHfx0G45o9GdWsJDhYieziyYSCGCdtG9P0VqvB6Zcy9fZD6Vbaxcz7ii1L3RyZ+FtanOuJC1ratrdEkJFb9+0s/7A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y0SKljOjkV1PG8RX7G0fJc3bxX/aGSk5D6n4iZBebzA=;
 b=WPTvdk6XM/E/NYBe29EIxT4UPHj425bhbzii9T1IhkrPXU6gEKeDuKDd835wMZT+djdFXxLidd0m94LWGHZdMq3he3LCMw5c8wekJOO2Uipe1HMB3sh6JfExwTZamkQHyr4EeTK/bIWVL0bjBt0uT47iD6whygujzTftiiWQRHIMZSJjbn5O8mVQqWSpPevV9zP117CGYhi3fVDCgilBBE2Y69vh/fQYGZOpyfZT0j3tNCeq5UHMQqHN3bgTzLAlqGeF0R6RVfBYqvF7r+XQFveYjWaT10UtNfmeutCXDbcl1FL2DnxfsX1znSXqqTKy5G4IDow463TDuKjFmOUELQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y0SKljOjkV1PG8RX7G0fJc3bxX/aGSk5D6n4iZBebzA=;
 b=TkIIBfaLIdnDZ0iABye30EONG74ylvgH3ZGyFYAPRLUxHfmIBue+FDuKrJ/+8Hg1B9AyWGpZsitfpRYlMoYXcfH/Mw0ONmb78IfvaH/2Rzk9kXCNx1yry0qjNauTAv8u6vTPdPeCu+oGnBgaGHqrSmaCaTdPCgChUbXGxRmCk+Y=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gzCA0I+bWlwWDEey3etcDggE1CvtHviV97ADNfk3w/ZCMvDApzx4uCB4RWnuzYmmmfWSVhPpxtP+xBkilBwG5N1wSPRXq2ZRtD0er4FCIqC8y8ur0dxVze771Rf6tNr27bwtILycRCklWiN+xMZIukz0uFmsUV8ri3s1tFvkpkNQXO4ll4VR4us3ZSitlVGT8IbXMT5qAyoHOZz46Q+8DVeHa16CUyaRV7tTuldo6fxce1MONd5z4KhX0aSyxF44Ld4X9oYC1QftL/c+6+25sj6n9ZDL0v7HIf5ycvDWpMcn+FbqAR8obxV9WMYfsC0VLGMF1c26ZC9rwHcUXRwXZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y0SKljOjkV1PG8RX7G0fJc3bxX/aGSk5D6n4iZBebzA=;
 b=J0uYu70NOBzeqHOVbogDP83sPP+N9CjRoYjiU3YV2JzYKw9H19Z5aoAsAFIWPTEEWf9emc5XFh73Fyb99IJxmxJoN9ov9r7QkOLZV97Zzy1Z2ZgAaimL25+CTT5ndo84ITLP2kU2vWjFBpUjk4WJQoJJ0AxzXFNDrb12EMwcBDeMXXyIRaBV5tqn925g6fcxfDTea0VpbK9uj96M/CrFpekVkvR0JnW5FlvpDev+0dtDsprB+AUPnNAOi/iJmcsZrxKGhBPhVORv0/ow+f8crE2wRTl//cnUZcU5llb4B9fGTqU+ZX0pMsEyZQJzNjHcHN66y1jcCPU9Yc53UFXFFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y0SKljOjkV1PG8RX7G0fJc3bxX/aGSk5D6n4iZBebzA=;
 b=TkIIBfaLIdnDZ0iABye30EONG74ylvgH3ZGyFYAPRLUxHfmIBue+FDuKrJ/+8Hg1B9AyWGpZsitfpRYlMoYXcfH/Mw0ONmb78IfvaH/2Rzk9kXCNx1yry0qjNauTAv8u6vTPdPeCu+oGnBgaGHqrSmaCaTdPCgChUbXGxRmCk+Y=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Julien Grall <jgrall@amazon.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH for-4.17] xen/arm: Support properly __ro_after_init on Arm
Thread-Topic: [PATCH for-4.17] xen/arm: Support properly __ro_after_init on
 Arm
Thread-Index: AQHYsaJ0EDYKZbrdhku3pAc3qkaNP62yhPIA
Date: Wed, 17 Aug 2022 04:45:52 +0000
Message-ID:
 <AS8PR08MB79915101E4562B17C14E43BC926A9@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20220816185954.31945-1-julien@xen.org>
In-Reply-To: <20220816185954.31945-1-julien@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: ADE14694A4D5AD4DA905A77F3C5F4F2B.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: a8d90dfc-6cc4-47ff-f26a-08da800b6610
x-ms-traffictypediagnostic:
	AM5PR0801MB1730:EE_|VE1EUR03FT055:EE_|AM6PR08MB5093:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 3P80RFzbXvyX/urAbJyKm/JXuK3Mk831QXHCuYcgIdpiXphXtlxIAryDb3ORtAwOmtdbzf/GTN287N2ArPoHvmvFFKrd2ioxa/z3V0HxEHym6wrHY5W7TglEAhk8z83++FOMbrqUCnFaC85ZhOzRiNfNIpYbBo6Izgcx8tGpJfpC3VFBLWtMOeIp0jy35rgBubjVglOdP5YztuKIA+fKnGMboxX6jUmE6V3JrXN2vyde3z+6HP9Weu8Fess3j/bhvbKvz17BgWTeAS9luHgSQjaRomrIbUGZbJOEsYqHcgL7Wb1YaPBbXrYq/KEWogxpsbZjpH9Ahxtksun4PwLLMqsAAGwK3d4wpPu404Pkoxy2wEjgmin/TfKQHjixXFpMHtJ4OlYIdpZ67Frt28ItekAzLPMG9U92tvzZ4UxBfqlhQVUqS6qwA71yqplQQC5TXqYzuYMFd4sXY3WfPR8blYveQUbzERjDc36AbbYaQFBIwUlRGnKa3pZWRm8lIWZ5X8DKahoIa6aOsQZIeykxkZU4lo69R4spkhFRmAZmYcr5ens4SN5au8202XaOck6UbVGh7zKCrhAEqPVqZq5ZETmxmZvtVoxn0Mmm2ozMAag7oXzbQXft0s8XYOxQINvdEznFLQwbz5LL+XivdgCnnajmftcFXft5iEpEwRQByNUKhWZcVpCBm3VzNdZd6d76+Dpxw/G3Bp9iuNpuAwtA0OGEVVR6LqmwKWVmGuNYLEdl5Uv4VYSdjNfCqTSJgwUn2ogLwnnz18MQcxf0x/pEBlL4RG5X3D9wncYLk9KFQxQ=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(39860400002)(346002)(366004)(376002)(136003)(9686003)(122000001)(38100700002)(26005)(7696005)(5660300002)(6506007)(66476007)(52536014)(33656002)(4744005)(478600001)(38070700005)(86362001)(8936002)(71200400001)(66446008)(41300700001)(64756008)(8676002)(83380400001)(76116006)(4326008)(2906002)(66946007)(66556008)(316002)(55016003)(54906003)(110136005)(186003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1730
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	925c780f-36e3-47db-4a22-08da800b5d2d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oGbos1TX0sJXPcAD5968BL5+XuJO4zn3lHOrB7KaxEdhUg7g7Sb7dO1qpasENMZNjjIjEkobd/PB0fGJpUzrY1mg/hfcB3ui4xRAb1EPpPynrWnL5ArFCLjYECj8x+46s8yJzMPHUKDWeorXqMU7tmrkWsHoXclVTsZxBiqs3rHYM/ZxTVPt6tg2ItN1s1Luo8eu8F29y44AMDd/IC7uvr5IgClscgTU1SQwvwWeANXmEDMz8h0fMRIzHgdeCPpAHMy/qybQU6bYGhImlPVvPtLLx6rjh9Mh2vyDlMQn3I/Ze7DiHPOgjmnNErAQqqyPpwOz50ItdCRm22ibCIJOsGO71cSk5oSlYk4QoACIyAhcZZTnpus4+ZuNJk2fzSX1ClvR22IBrytRzaoyF8fhRuDZGsPMnQw3nIpZDGyoHKLvkUDjXFnFwn9qMtw1Y7RpW0f3yf7V1/rPsZSk0C6bxw9c+KsjzwONpA0odb9A5eEtf43xTX5dXHnwRyddMZr6cvnlbxqQcPk+kjJEUWovcOXTneJp1zC5ablTRd+NvRsijZSPsLzpk04sa2uJ6UYsUdr/PZiTVEkb77BasCto8KiSR3n4vL+14ex00RYQ6Bg/n3WRPv/U1/Zhp4xNIF4eXSMN5HUazWmRWp4YMfR/70jSwE1DqPWHxwWpk0er9veFjt/RayYoP1hdJNe7jgcg9sSC3fHUCJJtTVYDjI0a/e8avxudk44Z7ljV6UUFCYaJXNOIJ/k9WeHML1BTxZg8Gb+IrUBnL+bj6xh3IPRdyiD2INSWKJ44lzuKWgMvjzVteTV1B6fyUZ6AZ38rWWEh
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(346002)(376002)(39860400002)(396003)(136003)(40470700004)(46966006)(36840700001)(8676002)(70586007)(70206006)(5660300002)(54906003)(316002)(4326008)(110136005)(82310400005)(40480700001)(55016003)(52536014)(82740400003)(36860700001)(4744005)(8936002)(81166007)(2906002)(356005)(40460700003)(9686003)(86362001)(41300700001)(6506007)(33656002)(26005)(478600001)(7696005)(83380400001)(186003)(47076005)(336012)(107886003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2022 04:46:07.0635
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a8d90dfc-6cc4-47ff-f26a-08da800b6610
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5093

Hi Julien,

> -----Original Message-----
> Subject: [PATCH for-4.17] xen/arm: Support properly __ro_after_init on Ar=
m
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> __ro_after_init was introduced recently to prevent modifying
> some variables after init.
>=20
> At the moment, on Arm, the variables will still be accessible
> because the region permission is not updated.
>=20
> Address that, but moving the sections .data.ro_after_init
> out of .data and then mark the region read-only once we finish
> to boot.
>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Tested-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry

