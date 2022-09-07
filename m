Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A02EF5AFEAE
	for <lists+xen-devel@lfdr.de>; Wed,  7 Sep 2022 10:13:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.400911.642541 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVqBm-0006hM-Fh; Wed, 07 Sep 2022 08:13:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 400911.642541; Wed, 07 Sep 2022 08:13:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVqBm-0006er-CS; Wed, 07 Sep 2022 08:13:38 +0000
Received: by outflank-mailman (input) for mailman id 400911;
 Wed, 07 Sep 2022 08:13:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a/dp=ZK=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1oVqBk-0006bV-Gn
 for xen-devel@lists.xenproject.org; Wed, 07 Sep 2022 08:13:36 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00072.outbound.protection.outlook.com [40.107.0.72])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f82e9d9b-2e84-11ed-af93-0125da4c0113;
 Wed, 07 Sep 2022 10:13:35 +0200 (CEST)
Received: from FR0P281CA0086.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1e::22)
 by PA4PR08MB7570.eurprd08.prod.outlook.com (2603:10a6:102:26f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.16; Wed, 7 Sep
 2022 08:13:33 +0000
Received: from VE1EUR03FT059.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:1e:cafe::7a) by FR0P281CA0086.outlook.office365.com
 (2603:10a6:d10:1e::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14 via Frontend
 Transport; Wed, 7 Sep 2022 08:13:33 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT059.mail.protection.outlook.com (10.152.19.60) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5612.13 via Frontend Transport; Wed, 7 Sep 2022 08:13:32 +0000
Received: ("Tessian outbound 2af316122c7a:v123");
 Wed, 07 Sep 2022 08:13:32 +0000
Received: from e8b3d4db4ae5.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DDD0B74A-5750-4F2A-BFE7-AF751F0C9E1F.1; 
 Wed, 07 Sep 2022 08:13:20 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e8b3d4db4ae5.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 07 Sep 2022 08:13:20 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com (2603:10a6:20b:404::24)
 by AS8PR08MB9669.eurprd08.prod.outlook.com (2603:10a6:20b:617::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Wed, 7 Sep
 2022 08:13:17 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::f5fa:7206:9197:6ba2]) by AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::f5fa:7206:9197:6ba2%3]) with mapi id 15.20.5588.018; Wed, 7 Sep 2022
 08:13:17 +0000
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
X-Inumbo-ID: f82e9d9b-2e84-11ed-af93-0125da4c0113
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=lBNhkbaquuwgF5H40YbTxlKLa7IO4TAKMPbQk1t3fVFPqC6KF5QO+nvtuZPTWKPMTnC7RqgC26RGLaynyc3KwSSheLFnihCdLnZwvwY14pkNj3ey+YVbLceMO43shMLR7OIq2wCc1z/S16u5Fz/JmJmvoRB+/ZTuCyDP97d5LyMlGn821910fX2fLIbP73mA4zBeNc/vmgljTckuzE4uTBo5DYTujWNTPWdO44rA+weYRthA863ubggjleNy9IIm+wlZxECSDs0tzZOfWTNq+dKIC8LVIk7mJWit2Sqd7RHy1uU+ma9k8QGum2KRdsqH+muqZf6ZHk2OneQKgyaANw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ft6uLKczm3hU5DDIuM7yyjOWYpK/8bv0f33qklLKKmU=;
 b=A+Q4BPM2rGrrsRnvLncvcVGPJpbgNbtweRk8tf3UTr5+4MtPFBruqDbrQWafo6ET13dr5wZ7aFb1Y+b1rfjSrxp6fUrfQL+48gZgjaFxNCI+YaRDkziwtOuGoASpG61Djr8SzrKd9+fNzG8P4p5IFJ/7c18TOs/siAgTxLSLnDkkumpwvzR4vAktmyu6sPu3FR6OJ+KRRj3COa5qFqz0MhA6XFqGou7DxnS0wWrydnRvkSGVulUuqVQ5SjD0N/krMG2Mi+QZ7ahsJnEvQQsPbNU5XCybytGoNLjHY1/K6p3mMbfOJQdQTBJPup+92FWJ05OIjY9ugSnwtC32xO+90Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ft6uLKczm3hU5DDIuM7yyjOWYpK/8bv0f33qklLKKmU=;
 b=tD6IrOFOd86MyiVqER8ddSCeMUDhX6qLYyZe5gd15psJyEb1IP1Zr84aZhtDIboTEjjLiVtXl+7cbk/ALSQLV9uGFm2W93qShc7mzYCDMCwZzNTE/ocOsYCdKUpqxSNU2IJMBLcKsc1g53R0DJzIN0lWalFe3qS5TLQqh3m9A98=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 111e2dc249194893
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nOwoyD6PHiJPhQH/1Rfu68VOuVYNgS5+dBzlJUDb+7piciY5wdA8769Ei1xWwiioCEHiSTouJVl0AsWH+1FjgILuoeKEKeJaz86VJL4XwNFO2lz1+5auNSKZX6Z6WFCyB/3FPKRT7fVRVZ3R+jGOZD95gzag+fH3cxeYzE88QZ5HkH9JV3Q8quFTvT0VvLAZwMx+pCqWvU5ArPdmUppdIiU38mlxsk/H8RQ8TIhrwOujboOy8wXRGH/UwpLiMSX/YZ31ILF7ey/g+b1gdvYXBBaZzVgZcm756aeDmiAcx7D+uin1gnl8Xdv06ZRRiNVmbKxaSg3sjFDNWUwZ30m/nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ft6uLKczm3hU5DDIuM7yyjOWYpK/8bv0f33qklLKKmU=;
 b=OrSAN7ApASwH3zs2zBHpgjJ2S75bFe2VLwowkdyKm5UIYVEMZSo+suifUPqjgIThFJiGpK9KwKH2vCUOc4rkUNNTyi90rrGNb0P+7UV8nUff+w2gA8EzG/pr+TrdQ6UsG0K7w/kK3pOL8Us8dg1apxNft9KR5uLkGvrQ46RZXEowAmRc4AYbA4pCbdWOtm+oxIoCLKVtX1tTlEY0AfjPTK57AYFWv4bUg+1wNVPWaA8PGEeH/lY3/p6xq3OTKflTt2O7DUIhBsVuy7DvyVMkuer1xleuf4oaWGf1ZlzGi/u311nyT9uIwhR0ZiFoEPB/ZKE1ohonhpuq5dQFxqJ2Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ft6uLKczm3hU5DDIuM7yyjOWYpK/8bv0f33qklLKKmU=;
 b=tD6IrOFOd86MyiVqER8ddSCeMUDhX6qLYyZe5gd15psJyEb1IP1Zr84aZhtDIboTEjjLiVtXl+7cbk/ALSQLV9uGFm2W93qShc7mzYCDMCwZzNTE/ocOsYCdKUpqxSNU2IJMBLcKsc1g53R0DJzIN0lWalFe3qS5TLQqh3m9A98=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: xen-devel <xen-devel@lists.xenproject.org>, Julien Grall <julien@xen.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v4 6/7] xen/arm: introduce new xen,enhanced property value
Thread-Topic: [PATCH v4 6/7] xen/arm: introduce new xen,enhanced property
 value
Thread-Index: AQHYwfap3Ps5bdyrBEC9qTgdrU+ZKq3S960AgACnw4A=
Date: Wed, 7 Sep 2022 08:13:17 +0000
Message-ID: <83BE5FFC-EB92-48F8-A76A-2651DD84BB7C@arm.com>
References: <cover.1662462034.git.rahul.singh@arm.com>
 <667059a3bc6ed9a8b993f64f2b1176a2a131f41e.1662462034.git.rahul.singh@arm.com>
 <alpine.DEB.2.22.394.2209061507481.157835@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2209061507481.157835@ubuntu-linux-20-04-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 4fa1a18d-2922-4881-c9a7-08da90a8dad6
x-ms-traffictypediagnostic:
	AS8PR08MB9669:EE_|VE1EUR03FT059:EE_|PA4PR08MB7570:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 3VQxxmm7hcFb/RGI2AEU5hjha0u6Pnn6dUTVE9/+xsoDuKfaUX+YpLoeGpm+GRgzPiQ0K1toTxwC+pPMZprnAXZac8hDJzQtHpmxJHEUpOzxUsaKr20MKPOjYryqEIS3TXZFbn0Eu3EPyI8KSRTnHguhkPayyQWoOrFS3wReVZcewh5BBdgWHg3FV+h6+5attRYVB7bvdoEQkt7dXFdCVbFuH7w5BbSDomG2hY0liFEdeiRM8kRLDx2jaVa1eDB5FTmGR1Mvtf+gVsqyb6gmPzBVQh5G9e1ZTh6QrF2TU7ou+5zlL2oiAxPllFUfCNDystZO/A6aDxE1wHD+jX4le/REc+f7Oc/CudE12yOVQ6ogYlGBV+X0b6vobHdLEqP0xGeBzR9S4yw5N0kxkgAGvJg351jKORwzHCq4ZjQ/XF6qxqayoJnBw/ItayL+HNCwAxpcD9Ik6N7E41WXJb6QTe+/3pnt3nZJxRAv5zTwrzp/MWRqvy6ODIJi/AJP0Xi8UZ9BcMrBLgtzTN+jNODdaTMm2xETFbUstC0jH+Hmn3/6zBtfUQlfwlRgD0riPyvxy/bd3PI7CLt/veLnPrE1WKFEIh7mrh+Hip2LqpIjnshIpo/o62oDPcgtp/HgSi82wsZvI559pX+JOrikwkyNMFsrVCRVpSolVyH4SWmN20aJCmsJ0kA/+OnhH1rOx1dSTFAskrdRZTtQx0NBM/+TQAXALmbk56GBZpN9JoIGBL9E/I9yqdywYOq0ZJHMBaVpoYoe5MlYQt/rbBontnYzpZi5PgkoTcDgXCPcPSADILM=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7158.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(366004)(136003)(39860400002)(376002)(346002)(6506007)(86362001)(6486002)(4326008)(8676002)(53546011)(64756008)(66946007)(66476007)(66556008)(76116006)(91956017)(478600001)(186003)(66446008)(41300700001)(2616005)(8936002)(33656002)(5660300002)(71200400001)(2906002)(316002)(6916009)(54906003)(36756003)(38070700005)(26005)(6512007)(122000001)(83380400001)(38100700002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <AAC9D651AB8FD642A522D245B88A4BC4@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9669
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	dca1a666-0ac1-4f1e-c013-08da90a8d200
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OcQqw6Z3cNyvo1SHR+53/IE+C0vSaG+QT4dfNbSoNTFaSdWPhydHpYpJkL1dhNUQl+uhCIhG6Ree0epA8eP9aMUb/IhtP7a/6N91+SvxB5w5jYPY3/8gvJ86AmLV1VhlelFI0HISoiNf7CCZG8ygCdUaz2dNX+TmljcLjAVQI0UjqYx5ohCSJqIiPDst8s626mtjjnV1Pqlv0FsiGymb952VQn7u1EpO8vwJM1F+lx2Lc+XwtJf6t0umrGSX1/YsKHRcnB1Aho1vcR+yRYFqWsCibomeAGTBraZe3KjX6hPaNSPbk2GB0uXDXd/eyZ9D0DbfD4APs0DdYyUjfvy6nPPjmEyjwHon/6QpByPrHw89pMvTrjhov1E4pV2KpPeayV/9vuK7ooqmNIbUM0unylUaPYdgt65w+z0ojh0iINSjOQq5rhRU/Quk4dbNgy+9B75mCwhb3AtgOUJaw/hlPm5KrKfKf5rPtPGMjklrvznlp3bZryZbX2HrSKU8vKwQuW/d3GAkl1As1nFWlVwOBRWfrGGeyakHbxzCAnB2kEGoJhl1OSW/RuEW3Pi66IpuJZMDfZLsB6zlc6V0cFII2NI+0FRTv/gfDpOTArFgEzGsXL5QzawaNoskUkCRMFoRBdhHdRhoHEN8GGHoZ4GKxEvmuYF4Uq44N1dtcchj5T6KmZpt8+g1Wk/mS7A93luKQ0hE1HgCciGiclKWXKYRh9UF+MdGtiXFrdmqRsJympD8YEYSr6he+ZL3limpbeWePeHxNPai4FTsQcxJT5xRgQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(396003)(346002)(39860400002)(376002)(136003)(40470700004)(36840700001)(46966006)(5660300002)(4326008)(36756003)(316002)(40460700003)(8936002)(47076005)(54906003)(70206006)(70586007)(36860700001)(8676002)(6862004)(33656002)(2906002)(6486002)(41300700001)(6506007)(53546011)(478600001)(6512007)(40480700001)(26005)(356005)(2616005)(186003)(336012)(107886003)(86362001)(82310400005)(83380400001)(81166007)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2022 08:13:32.5698
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fa1a18d-2922-4881-c9a7-08da90a8dad6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB7570

Hi Stefano,

> On 6 Sep 2022, at 11:12 pm, Stefano Stabellini <sstabellini@kernel.org> w=
rote:
>=20
> On Tue, 6 Sep 2022, Rahul Singh wrote:
>> Introduce a new "xen,enhanced" dom0less property value "no-xenstore" to
>> disable xenstore interface for dom0less guests.
>>=20
>> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
>> ---
>> Changes in v4:
>> - Implement defines for dom0less features
>> Changes in v3:
>> - new patch in this version
>> ---
>> docs/misc/arm/device-tree/booting.txt |  4 ++++
>> xen/arch/arm/domain_build.c           | 10 ++++++----
>> xen/arch/arm/include/asm/kernel.h     | 23 +++++++++++++++++++++--
>> 3 files changed, 31 insertions(+), 6 deletions(-)
>>=20
>> diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/devic=
e-tree/booting.txt
>> index 98253414b8..1b0dca1454 100644
>> --- a/docs/misc/arm/device-tree/booting.txt
>> +++ b/docs/misc/arm/device-tree/booting.txt
>> @@ -204,6 +204,10 @@ with the following properties:
>>     - "disabled"
>>     Xen PV interfaces are disabled.
>>=20
>> +    - no-xenstore
>> +    Xen PV interfaces, including grant-table will be enabled but xensto=
re
>> +    will be disabled for the VM.
>=20
> Please use "" for consistency:
>=20
>    - "no-xenstore"
>=20

Ack.=20
>=20
>>     If the xen,enhanced property is present with no value, it defaults
>>     to "enabled". If the xen,enhanced property is not present, PV
>>     interfaces are disabled.
>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>> index 707e247f6a..0b164ef595 100644
>> --- a/xen/arch/arm/domain_build.c
>> +++ b/xen/arch/arm/domain_build.c
>> @@ -2891,7 +2891,7 @@ static int __init prepare_dtb_domU(struct domain *=
d, struct kernel_info *kinfo)
>>             goto err;
>>     }
>>=20
>> -    if ( kinfo->dom0less_enhanced )
>> +    if ( kinfo->dom0less_feature & DOM0LESS_ENHANCED_NO_XS )
>>     {
>>         ret =3D make_hypervisor_node(d, kinfo, addrcells, sizecells);
>>         if ( ret )
>> @@ -3209,10 +3209,12 @@ static int __init construct_domU(struct domain *=
d,
>>          (rc =3D=3D 0 && !strcmp(dom0less_enhanced, "enabled")) )
>>     {
>>         if ( hardware_domain )
>> -            kinfo.dom0less_enhanced =3D true;
>> +            kinfo.dom0less_feature =3D DOM0LESS_ENHANCED;
>>         else
>> -            panic("Tried to use xen,enhanced without dom0\n");
>> +            panic("At the moment, Xenstore support requires dom0 to be =
present\n");
>>     }
>> +    else if ( rc =3D=3D 0 && !strcmp(dom0less_enhanced, "no-xenstore") =
)
>> +        kinfo.dom0less_feature =3D DOM0LESS_ENHANCED_NO_XS;
>>=20
>>     if ( vcpu_create(d, 0) =3D=3D NULL )
>>         return -ENOMEM;
>> @@ -3252,7 +3254,7 @@ static int __init construct_domU(struct domain *d,
>>     if ( rc < 0 )
>>         return rc;
>>=20
>> -    if ( kinfo.dom0less_enhanced )
>> +    if ( kinfo.dom0less_feature & DOM0LESS_XENSTORE )
>>     {
>>         ASSERT(hardware_domain);
>>         rc =3D alloc_xenstore_evtchn(d);
>> diff --git a/xen/arch/arm/include/asm/kernel.h b/xen/arch/arm/include/as=
m/kernel.h
>> index c4dc039b54..ad240494ea 100644
>> --- a/xen/arch/arm/include/asm/kernel.h
>> +++ b/xen/arch/arm/include/asm/kernel.h
>> @@ -9,6 +9,25 @@
>> #include <xen/device_tree.h>
>> #include <asm/setup.h>
>>=20
>> +/*
>> + * List of possible features for dom0less domUs
>> + *
>> + * DOM0LESS_ENHANCED_NO_XS: Notify the OS it is running on top of Xen. =
All the
>> + *                          default features (excluding Xenstore) will =
be
>> + *                          available. Note that an OS *must* not rely =
on the
>> + *                          availability of Xen features if this is not=
 set.
>> + * DOM0LESS_XENSTORE:       Xenstore will be enabled for the VM. This f=
eature
>> + *                          can't be enabled without the
>> + *                          DOM0LESS_ENHANCED_NO_XS.
>> + * DOM0LESS_ENHANCED:       Notify the OS it is running on top of Xen. =
All the
>> + *                          default features (including Xenstore) will =
be
>> + *                          available. Note that an OS *must* not rely =
on the
>> + *                          availability of Xen features if this is not=
 set.
>> + */
>> +#define DOM0LESS_ENHANCED_NO_XS  BIT(0, U)
>> +#define DOM0LESS_XENSTORE        BIT(1, U)
>> +#define DOM0LESS_ENHANCED        (DOM0LESS_ENHANCED_NO_XS | DOM0LESS_XE=
NSTORE)
>> +
>> struct kernel_info {
>> #ifdef CONFIG_ARM_64
>>     enum domain_type type;
>> @@ -36,8 +55,8 @@ struct kernel_info {
>>     /* Enable pl011 emulation */
>>     bool vpl011;
>>=20
>> -    /* Enable PV drivers */
>> -    bool dom0less_enhanced;
>> +    /* Enable/Disable PV drivers interface,grant table, evtchn or xenst=
ore */
>=20
> missing a whitespace

Ack.=20
>=20
>=20
>> +    uint32_t dom0less_feature;
>=20
> Given that we only really need 2 bits today, and given that uint8_t and
> uint16_t are free but uint32_t increases the size of the struct, could
> we just use uint16_t dom0less_feature ?

Yes, I will change to uint16_t in next version.

Regards,
Rahul=

