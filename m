Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F6952B7AD
	for <lists+xen-devel@lfdr.de>; Wed, 18 May 2022 12:22:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.331894.555513 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrGor-0006lB-Ep; Wed, 18 May 2022 10:22:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 331894.555513; Wed, 18 May 2022 10:22:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrGor-0006iU-At; Wed, 18 May 2022 10:22:17 +0000
Received: by outflank-mailman (input) for mailman id 331894;
 Wed, 18 May 2022 10:22:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qF5t=V2=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1nrGoq-0006iO-2m
 for xen-devel@lists.xenproject.org; Wed, 18 May 2022 10:22:16 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on0613.outbound.protection.outlook.com
 [2a01:111:f400:fe0d::613])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6292cd30-d694-11ec-bd2c-47488cf2e6aa;
 Wed, 18 May 2022 12:22:14 +0200 (CEST)
Received: from AS9PR06CA0299.eurprd06.prod.outlook.com (2603:10a6:20b:45a::28)
 by VE1PR08MB5216.eurprd08.prod.outlook.com (2603:10a6:803:113::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14; Wed, 18 May
 2022 10:22:11 +0000
Received: from AM5EUR03FT015.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:45a:cafe::87) by AS9PR06CA0299.outlook.office365.com
 (2603:10a6:20b:45a::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14 via Frontend
 Transport; Wed, 18 May 2022 10:22:11 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT015.mail.protection.outlook.com (10.152.16.132) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5273.14 via Frontend Transport; Wed, 18 May 2022 10:22:09 +0000
Received: ("Tessian outbound 07c1c99345b0:v119");
 Wed, 18 May 2022 10:22:09 +0000
Received: from 580a75d7349d.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7089268D-2842-4877-9B06-24CF45F1DBFD.1; 
 Wed, 18 May 2022 10:22:03 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 580a75d7349d.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 18 May 2022 10:22:03 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by PA4PR08MB6207.eurprd08.prod.outlook.com (2603:10a6:102:f2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.14; Wed, 18 May
 2022 10:22:02 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::91a2:f704:9c0d:fca6]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::91a2:f704:9c0d:fca6%6]) with mapi id 15.20.5273.014; Wed, 18 May 2022
 10:22:01 +0000
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
X-Inumbo-ID: 6292cd30-d694-11ec-bd2c-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=diVF5sFWFZsNXh5Wum896ILFL5Fg/P/XqI/3A5Zy2NyIJSyMPrLpfrPpGXhOhF5whNfyLJeJxx8H4jvE2EEfiF2R/6MiIdjVRA/L3HFIc6gFaBwUd86FtRnDDWl+LUhkiKj+0SEkrhWu8oEd92mf8MxxU0BKk5MHosOfjut1iI2Jk1gT5PW8D5dfUr/Kh5he0xDfMPDu2Cgcq6o760PPhA23BwV3CQwgnUUu2nN+fTg0ShvZPcE18/igdK1q57kdWl5B0Lw1T84luKoFJfy7ojDpGxE6E2fETdFAU7vBLQ4/SQhbbRWzwPZl2ttYFZh0jW5ScQUDki/OpIQVNT5spg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zQy2dhOexMIlY4x0cMdRhmrw1eWU3wLJuWRqUHeBWvg=;
 b=GXV0PQXpMR7c+EiAzcPCiwAASGmtNc8aqgSPFKtqMiWxPx4F9t8C7b+Td8ZAJgDSksGhAo8d2TpVmmbauEQP/dZFcnNGFkDVDcJ7bhWC8Dkf9tpMzIovcfxNB/FCtyVi2nGbQtT+jntxfuC0EgEnIwm6rCCyCUittLb4dvFVswVyobag7JPEDjI2EaINRPJSo+kxj4YkdHc8vD3QAxEX27oRLDu8jktIocsW7N1c+hD3fg2lT12hO90zdeghAOz58ae3jiUl/ZZSHqldnlyaFF7xgJuLwPAze9PBr9dG6f1jitrZKLevBBrsr9YUaEYbAiNjXf2J+sE0cbNxZJA3AQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zQy2dhOexMIlY4x0cMdRhmrw1eWU3wLJuWRqUHeBWvg=;
 b=X4/xJeuhy7aOmRB/1RTOElXNKcwN2zoOvmf0fTCh9zLc4lAYCQLfurIS3iclD1NAGIG1rrAm8KUscN+TTt/4QjfpZPyugqDfh0SJfU33IIWCeSFWOcNeykyfxidvaouXngpb4apzi7G72zO3gWnvHozaKGllG6VxdZpGAEB+ARc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ye3TzbgdrqAgjMYIm7c5o1VcwtLNzxI+rAzCw12fahX/qaaF4bsJMyyFXGYAYUbDXfno9TH7edM9AbzAw+W9fH/inev2+1X1t8w0c3Zpi/hXuzlLfUcRb9mlgokZFex6cvaGl8D2+X1E2yQp7RclPs2n+gIpwl+Fy9kR68bYKOzR16WLXZWdM24dJkScsvVhmsa4fRVMBUWcx80TewAFUshZ5MWiSb5Vv49qSNuCABdXveGB+lQZF3iqKi3t7cINJm0JXV7ywrAAsOPy2ifXNFmBdJP/ziKcAFBcAQTAiJXgGdbkYozy8353fvBQQN16voIDF7LCHXhb+IuUZgqftQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zQy2dhOexMIlY4x0cMdRhmrw1eWU3wLJuWRqUHeBWvg=;
 b=XZSutT6ZxLHlnmIcecamCwD2jFsP+pwczuDGqgMx8Ho7hffapOodfOFS/GS8fO+Q+7vYG3I27HyPr7CLkJp8wPNZd/xlSfbo0jtCFbKvZmOILFoJdp/XoGBYeM6t7F73LXgEx/k4DrZbPj1zYFwjkePxpP/gm8mHkqhJyGtOO3LSmNOKRP/y/wFmWPhkKGw1tJBLPWLf6DGoYv/0LWguPDnDu2+nhp0nD54wqKo04o2YkmL6x9/03wsqceaOP/Oj89o5bmPmYwhYSJtL8lT+TPz6fyN+qFDnvc3j5/A9PFKhbU5Rif3nhQEDsxLs0MjmsmUm6UzOVzT7mwgFNgyl8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zQy2dhOexMIlY4x0cMdRhmrw1eWU3wLJuWRqUHeBWvg=;
 b=X4/xJeuhy7aOmRB/1RTOElXNKcwN2zoOvmf0fTCh9zLc4lAYCQLfurIS3iclD1NAGIG1rrAm8KUscN+TTt/4QjfpZPyugqDfh0SJfU33IIWCeSFWOcNeykyfxidvaouXngpb4apzi7G72zO3gWnvHozaKGllG6VxdZpGAEB+ARc=
From: Henry Wang <Henry.Wang@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Liu <wl@xen.org>, Community Manager
	<community.manager@xenproject.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: RE: [PATCH v6 0/3] amd/msr: implement MSR_VIRT_SPEC_CTRL for HVM
 guests
Thread-Topic: [PATCH v6 0/3] amd/msr: implement MSR_VIRT_SPEC_CTRL for HVM
 guests
Thread-Index: AQHYagM6tDpJ92rV50ONWDPDxej1sa0kY+2AgAABBzCAAAWtgIAAAFLw
Date: Wed, 18 May 2022 10:22:01 +0000
Message-ID:
 <AS8PR08MB79910BE1C478719B372748BB92D19@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20220517153127.40276-1-roger.pau@citrix.com>
 <6b5362c8-2a41-d2c8-b25e-2e9c421d6da2@suse.com>
 <AS8PR08MB799171E2FE25B734B6331AFB92D19@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <17f8215c-7b8e-1c10-350b-21a9dec64d82@suse.com>
In-Reply-To: <17f8215c-7b8e-1c10-350b-21a9dec64d82@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 132EAFB82FB11241BB56695CC250A18D.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: f4eb4853-f693-4783-a427-08da38b8446b
x-ms-traffictypediagnostic:
	PA4PR08MB6207:EE_|AM5EUR03FT015:EE_|VE1PR08MB5216:EE_
X-Microsoft-Antispam-PRVS:
	<VE1PR08MB5216A0C7E0BFF77DD190722C92D19@VE1PR08MB5216.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 gqFknhBYaWDFZPdd3DvrZB5iDl7LQImmHfTWaZhOvjpHCpJuawgW1guVvijbxVVga1terSacew1lhQUv1144Cq78aNj1pT+4cgFEXOclFEslEJE8PrCXDiAGznTKKVpw3PE2rIeI63ym+EHDRppny5aylOmMmRNGaMLcOg3LQC/ZxRFDqwVJsSWWE7HPw/4pYOBSpu13yObdU4zQgKaZmLQNeMqMRx2i9oHy6kkpq3op9neAILEEGgGFPmTMk+Ux9CMfGJpfKjBP4mgen0TG7O8up3Hxx8fvYyIC36n4S4nPaLYVjBg8DSlI/sg71+p0uK7IvFHORaDkm9kTvJEkUCounYjPWRAlFxM5yLmrrR91rHPWzhoquwb4b/nZOLVLGs5lP/lsLva+9te0xi6UGrCuqSfVB5He/fHrTI8ab9ZOXp3+uwlGB5Uiwnso0rU8XQbi7Vgtu+/3GhNPT4Ljg0l0e16zEDgA8lbxBu0NGwmeVYvk9OZfJJVkzvx9p3i3O5dj6Wa+llbbG4fc79sCn6fD8LWapoZsEbEF3ecpdbPvecP7Bol+MsoYURoaQNw7eDWtOLIfZuVtumy9tof/9AX+Kn9UFekhP2PaMj3YGiTj+JETv3QNZM7y0l2SwN9PfQRsH5Amleq3RnYP1xmP7w2FYMKvPT+Ty/ABuFY7lAJMQNRQbqE3fkj/+hrlTPshMbzSJrtw3fFlcY7sAhcNuw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(316002)(2906002)(7696005)(53546011)(54906003)(6506007)(66556008)(26005)(71200400001)(6916009)(38100700002)(83380400001)(38070700005)(55016003)(86362001)(33656002)(66446008)(52536014)(508600001)(8936002)(76116006)(122000001)(186003)(64756008)(5660300002)(8676002)(4326008)(9686003)(66946007)(66476007);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6207
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4118bb45-b4c0-42d0-c13d-08da38b83fa0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	j02fidEQUyR99JpghIvp/8u/gbVJUlDoFTO79AoEFluzpeLLnSiLPkT+h01Mgsn7qXnOoA8F77wXLeiGoPH6a0Ftyp19p3SJK1cYSbQ5ie55Py4p8aIOozt+yIq0UVvRLOZOukr3XeqV15C8hYHz0MlWMRXDvNLl/nAovI8os+MAT33B+0RTHBQu0/xmFIvihdU2p3gT507vuVPaSHWXSqRzDZGTbraiiBCe++bV+h3wQbmcbYAji+bH8BZdSLz3FtRzyJ2+ypTMO7xbO4D7rS6o5xetrPMW7Q91tAhBdxXFNx5j2Tq5G+2jS5lF0EKxqlBHjNF3TfCltRKFxswsNiM+lvVd2BpUh0TuFkPfLxhTY2trsy29qzguehr2t6SMBjZR0l3U4FyMw3jLU56hGN0uKvG0nejqAhKVr+N1LjDN5PRVaoOz9KdLUquvKvkeG4NbsZgev2720YLJMIYQUKoK+/ca0lFpMwvOILs5/izR/EjdqLt/2dFZciN3SM7G7oJmQA7ogmIw1uysV5Vtq+gyEkdB07/JyutLRReVf+3esEukl6Fu7q8DP0HltI75KUH7Z/M7LlXqLY0/TQ7grTwSSaKnuis5yluHbETKSv7Htz/d77DnqBE1CURr7d4cz2jZIBMm77SaZGo9djAOoBdtKn7+AzChsCCovldb8RzFfWXcy3SajUFM8K40Wibb
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(70586007)(33656002)(82310400005)(70206006)(8676002)(4326008)(9686003)(54906003)(86362001)(6862004)(508600001)(55016003)(26005)(81166007)(53546011)(40460700003)(356005)(316002)(7696005)(52536014)(336012)(8936002)(83380400001)(47076005)(5660300002)(2906002)(107886003)(6506007)(36860700001)(186003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2022 10:22:09.8764
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f4eb4853-f693-4783-a427-08da38b8446b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5216

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gDQo+IE9uIDE4LjA1LjIwMjIgMTE6NTEsIEhlbnJ5
IFdhbmcgd3JvdGU6DQo+ID4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+IEZyb206
IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gPj4NCj4gPj4gT24gMTcuMDUuMjAy
MiAxNzozMSwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOg0KPiA+Pj4gUm9nZXIgUGF1IE1vbm5lICgz
KToNCj4gPj4+ICAgYW1kL21zcjogaW1wbGVtZW50IFZJUlRfU1BFQ19DVFJMIGZvciBIVk0gZ3Vl
c3RzIG9uIHRvcCBvZg0KPiA+PiBTUEVDX0NUUkwNCj4gPj4+ICAgYW1kL21zcjogYWxsb3cgcGFz
c3Rocm91Z2ggb2YgVklSVF9TUEVDX0NUUkwgZm9yIEhWTSBndWVzdHMNCj4gPj4+ICAgYW1kL21z
cjogaW1wbGVtZW50IFZJUlRfU1BFQ19DVFJMIGZvciBIVk0gZ3Vlc3RzIHVzaW5nIGxlZ2FjeQ0K
PiBTU0JEDQo+ID4+DQo+ID4+IEZUQU9ELCB3aGlsZSBiZXNpZGVzIGEgbWlzc2luZyBhY2sgZm9y
IC4uLg0KPiA+Pg0KPiA+Pj4gIENIQU5HRUxPRy5tZCAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgfCAgIDMgKw0KPiA+Pg0KPiA+PiAuLi4gdGhpcyBhZGRpdGlvbiB0aGUgc2VyaWVzIHdv
dWxkIG5vdyBsb29rIHRvIGJlIHJlYWR5IHRvIGdvIGluLA0KPiA+PiBJJ2QgbGlrZSB0byBoYXZl
IHNvbWUgZm9ybSBvZiBjb25maXJtYXRpb24gYnkgeW91LCBBbmRyZXcsIHRoYXQNCj4gPj4geW91
IG5vdyB2aWV3IHRoaXMgYXMgbWVldGluZyB0aGUgY29tbWVudHMgeW91IGdhdmUgb24gYW4gZWFy
bGllcg0KPiA+PiB2ZXJzaW9uLg0KPiA+DQo+ID4gTm90IGNvbXBsZXRlbHkgc3VyZSBpZiBJIGFt
IHByb3BlciB0byBkbyB0aGF0IGJ1dCBmb3IgdGhlIENIQU5HRUxPRy5tZA0KPiA+IGNoYW5nZToN
Cj4gDQo+IFdlbGwsIG5vLW9uZSBleGNlcHQgeW91IGFjdHVhbGx5IGNhbiBhY2sgY2hhbmdlcyB0
byB0aGlzIGZpbGUsIGFzIHBlcg0KPiAuL01BSU5UQUlORVJTLg0KDQpUaGFua3MgZm9yIGNvbmZp
cm1pbmcgYW5kIHNlbmRpbmcgdGhlIHJlbWluZGVyIHRvIGhlbHAgbWUgdG8gdW5kZXJzdGFuZA0K
dGhhdCBJIHNob3VsZCBhY2sgdGhlIGNoYW5nZXMgaW4gQ0hBTkdFTE9HLm1kIGZvciB0aGlzIHNl
cmllcywgSSB3aWxsIGtlZXANCnRoZSBpbmZvcm1hdGlvbiBpbiBtaW5kIGFuZCBJIGd1ZXNzIEkg
YW0gZ3JhZHVhbGx5IGFjcXVpcmluZyBleHBlcmllbmNlcyA6KQ0KDQpLaW5kIHJlZ2FyZHMsDQpI
ZW5yeQ0KDQo+IA0KPiA+IEFja2VkLWJ5OiBIZW5yeSBXYW5nIDxIZW5yeS5XYW5nQGFybS5jb20+
DQo+IA0KPiBUaGFua3MuDQo+IA0KPiBKYW4NCg0K

