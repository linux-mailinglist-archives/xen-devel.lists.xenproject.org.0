Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 450105FD98A
	for <lists+xen-devel@lfdr.de>; Thu, 13 Oct 2022 14:50:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.422001.667767 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oixeb-00078w-Vg; Thu, 13 Oct 2022 12:49:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 422001.667767; Thu, 13 Oct 2022 12:49:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oixeb-000762-SW; Thu, 13 Oct 2022 12:49:37 +0000
Received: by outflank-mailman (input) for mailman id 422001;
 Thu, 13 Oct 2022 12:49:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j8+s=2O=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oixea-00075s-Is
 for xen-devel@lists.xenproject.org; Thu, 13 Oct 2022 12:49:36 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150071.outbound.protection.outlook.com [40.107.15.71])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7d91efbb-4af5-11ed-91b4-6bf2151ebd3b;
 Thu, 13 Oct 2022 14:49:35 +0200 (CEST)
Received: from AM5PR0202CA0020.eurprd02.prod.outlook.com
 (2603:10a6:203:69::30) by PAWPR08MB9637.eurprd08.prod.outlook.com
 (2603:10a6:102:2ec::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15; Thu, 13 Oct
 2022 12:49:27 +0000
Received: from VE1EUR03FT007.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:69:cafe::21) by AM5PR0202CA0020.outlook.office365.com
 (2603:10a6:203:69::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.19 via Frontend
 Transport; Thu, 13 Oct 2022 12:49:27 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT007.mail.protection.outlook.com (10.152.18.114) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5709.10 via Frontend Transport; Thu, 13 Oct 2022 12:49:26 +0000
Received: ("Tessian outbound c2c2da38ad67:v128");
 Thu, 13 Oct 2022 12:49:26 +0000
Received: from 891c66ecfef4.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3594B63C-93B6-4D46-96D8-CEF6E40EE23A.1; 
 Thu, 13 Oct 2022 12:49:16 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 891c66ecfef4.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 13 Oct 2022 12:49:16 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by VI1PR08MB5534.eurprd08.prod.outlook.com (2603:10a6:803:135::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Thu, 13 Oct
 2022 12:49:06 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339%7]) with mapi id 15.20.5709.015; Thu, 13 Oct 2022
 12:49:06 +0000
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
X-Inumbo-ID: 7d91efbb-4af5-11ed-91b4-6bf2151ebd3b
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=lYETr7cDWIs6bPL/Yst3SiBX3q3Fy8GwC+5WNLJ4KYmRd3yRicXVPUyVvROVpJlRnr2MhaltidshZeHeh/PIwYZaw3PeyyLrPl7KmkvMppO9t/J9dbGbK/8/15SPDWaAU4quXq2szfF026id71ZFcgyC9S+E0lhqJW/tSajOAY14JoQmPvi4C67wC1yRyWc1SvfeMPA1MprE0kcPPVG6QxFCGzKWa6OaEIX6Ens+wFaLzjBG14afIY3yCe4K6hLAlAnJV3H3vjd3wFeYPICJ8Y6nQ50wJtU8ZQ9I8sJNXCCpakh0E1gQs2rxPoMoeUG9FKs1RR9oy1mVIzQ2ZucPXA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xf+r8Bc3QMJLG5H3ag52ZoXOW4MPEbB9Nsco29WT7sc=;
 b=EFs80SA3mT985AMMg1vZZNVYfNS+a0obURiLf67AUskltTrncSdsU/PuZbKKiz3wqIjf4VSsoSmos3d53qNogTBfmyYkl06HPtlK0L0NEHtF+wSaCeZj0oFAyzqO2+5g3MjeO9Ch61LjEDJ04mTGrDku0FI0v9Hv7kdIyCCchw0fO7cqal8IN3dVnyg8gyHcsPhmV2mag3UmsfYc3SVtWx5f6tmzQo2B7FEyhPRY6CGeGJ2BcS7M4MxrVCaFb100U5Nxn8q513ClP9Q0wTRrH3GN0xKX8PUc/BvAq3M+Z/M8147ZjAy1LuGVOUY4+F1ieCGk88z1qQ6IzzDCcH2xUg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xf+r8Bc3QMJLG5H3ag52ZoXOW4MPEbB9Nsco29WT7sc=;
 b=CvQRBNLrjWcYcbKEXU21odAQunDIOWWE3ni28QxMplcVKEKoEXRu/Ai9NV4xSGXiRtgPerOdkK+yNhgMXkn81ZYo+T/sD55E4NsC706zwpSiJjdrfrioP+xIezhK+piO/yi+QkBHvfcIQ7JqIuqKszwSVe2WKM6tr24Dw93Dqhg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mHREdVwTHmB/QReUObEjOdarOCM0XfYFE1LnZ3cZDhHWAUyo8fOmNxafRfS4tyUHAOK/SGfecXgf5PpOyd+vMV3Wt8sG+RNKMY7EwjKvX3ZD4C8eclk4pd4OPh2HQiDJjeUKLPeM2xUPjdbfTWpGTYvFF+zcBA2jvXiWx3+lmabDJXNRtKKT+Eknd+p5qaUocE9bULkkq53AQOMHbASYJZ3PtkpIwoGBbt4txwU1iHH83BfijUhxdqHiIxXbCZXRjDEsaPIlIwUiELsxPqiK3T0gIQLMxubRAtkF5sOgAQKc1PjGAQeNXw0NLoH53KXKA80EkKRmkH90YfjTqfpVwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xf+r8Bc3QMJLG5H3ag52ZoXOW4MPEbB9Nsco29WT7sc=;
 b=QQVgJky01nEGDlM3jK11V/GpkxkTXpYy867QGOEnISMoZS29wQfjT3DBqOUj9yw/439KC/ytCvypTU8xeRXNxOkE2zQCpREyW9nTdFA95gkJPBvCfsr1BDI1f1FkIjS4SZqAmsurH+51W9+7TikvTOsd8DJuN9yrjfcwEUE61A+ZDLUbgxhVMcZg7xidW0ficeqLE9lmwzTSkr4ivJMX/1LvLV0z4Us4QNk2WSFmznqJDObu4Wk9intBtW6l8Le3kp7dytIN7OwsQmCvNsE1Id1HccFdOK2UJoq0q7yWmDWGsfchvrRg4r3TzP2kWaukxcrg/pcqY2k0KTmXuUbzLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xf+r8Bc3QMJLG5H3ag52ZoXOW4MPEbB9Nsco29WT7sc=;
 b=CvQRBNLrjWcYcbKEXU21odAQunDIOWWE3ni28QxMplcVKEKoEXRu/Ai9NV4xSGXiRtgPerOdkK+yNhgMXkn81ZYo+T/sD55E4NsC706zwpSiJjdrfrioP+xIezhK+piO/yi+QkBHvfcIQ7JqIuqKszwSVe2WKM6tr24Dw93Dqhg=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>, Andrew Cooper <Andrew.Cooper3@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH] xen/arm: p2m: Populate pages for GICv2 mapping in
 arch_domain_create()
Thread-Topic: [PATCH] xen/arm: p2m: Populate pages for GICv2 mapping in
 arch_domain_create()
Thread-Index: AQHY3t81xdeRddBbSEGLoF20gErPe64MD6gAgAAAmHCAADWrgIAAAFWw
Date: Thu, 13 Oct 2022 12:49:06 +0000
Message-ID:
 <AS8PR08MB7991FED203D591F95909A8C992259@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20221013083818.36209-1-Henry.Wang@arm.com>
 <6cf1c4a9-f339-217c-4557-b0a9ff37938a@citrix.com>
 <AS8PR08MB7991FF3E7EEA46F11ED4376092259@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <63f5ab77-de4e-7a42-9942-832d8f891a53@xen.org>
In-Reply-To: <63f5ab77-de4e-7a42-9942-832d8f891a53@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 3ACDFB331A6393439A763E4A7C0FC576.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|VI1PR08MB5534:EE_|VE1EUR03FT007:EE_|PAWPR08MB9637:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b8bd702-9ee5-4b29-dca1-08daad195cc0
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Mcgkh1Cpbs8281c737Ld4JORXXWma8VD0vbuq/1Ue/q1Wl2QPZfa5ShhqdN+8qPfQ3vL5KspbcQGNWbRa7nqP148VFR8ynHtvQlNNAyRZvAAEZ2KLVx5NAui9BbsXyiLMqGp1Oa676L7QzJgt5Dn80EqO/tRS3db57ynzRuCgjFKCQSkE0HCJeGE4Krt+FrQFBAXvDyImNGh2opX/JCKPmPVAJlzibIuc9+HgHXGADnP9LFUbUzusxe7dVpjiwJz2pQVj9MPfz6mCwW0hujA/euxjbZcMa2JxVAiKVQ8wah/hw11D8lsmXYaMNz21bc/Rtd+05W2eBFXMV0ePpWmEED3GlfWSdLYqR4WviTehoDZvi+Paasq1hUSKKICGNr7NO2kH5O6NYHiSe0U6CRvRJ3T6Fc5j57/CqEwBog3CfFiNrxz4Uvjmo4UlI1sMDLCtfCuGcoC5Wl2cYHq/oUlhAUSg8qNMBM9hpHL1Kqel8hAT+XAZ8ob50F7+68xjNPKoUlOmMox06WjdUdn+ktWRkJ4dSfDUz/U2Razi0+ECxCtOIAULkWXitpQvhzK4MVVqKA9R8oPwIpHJ2H1fVFC/EcCljhmhlPvUpumgJtLV5HNMfRFeKz670FWBqy9eI3SridOi/I+Ou2qQaMYvVZsuxkZQUG9oUm0X7/Uw6QzPinnf2HGxDpDprV5nhypeRiLacLdz00qYahRda8fuK1FZexM+Xr/bIwTpzMoJhtWTLcoUErvjwasDOvrxAL6P2FNBNXI+0thlI40ckuvwzF1Jg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(136003)(366004)(376002)(396003)(451199015)(186003)(83380400001)(38070700005)(86362001)(122000001)(38100700002)(4744005)(5660300002)(2906002)(41300700001)(4326008)(8936002)(55016003)(52536014)(8676002)(64756008)(478600001)(9686003)(26005)(6506007)(7696005)(110136005)(316002)(66446008)(66556008)(66476007)(54906003)(71200400001)(66946007)(76116006)(33656002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5534
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d045303d-bd38-4c9b-da00-08daad19506d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XaiLDzCgwP2sm0PZNoyVaOeL6I06twF/ToS80SCV8/duQRTrFWGNOVmwMQTy0jckuWsl8kHIbh+JslyQryAntDmWnnLnLkHiqjspNFHubS8r1OT31tJtdPs4kKfCXRvLQCntgtaTOuMZbP1bJKFk5KxdUVoW/r2Ys/D8WXluGek4R+KzXzqNXVhLQsGDMqmD+OEYEVXdo6Vlqae0MiXy1wNGO6VA+xM+Ik8+QbeijKSc4ZAoNL8h4+p6MqQUf8AsiL2rWkaQsoVmc40uwCt9PD8ElVaAeXhAoVEyBF6apbIXFrreaIwhlw/sv8b8sVxh5/pmQ/M0Szj31JgEmFLhhCvjqdGB2zOZHzFsv10ccymKSwGPD+2oRlAsZfs/XRYk5lWrHZMTORkw2IpMTwsIxAEGky0/BzquTAqP7JYgMmS+v6bgxqzxsGerWZRSjTNtT/XrS/ayTTJLIQ5NO2C/lYspohykXKS3nrtdeDRBE714HdAa+rxY9X0Vb781yiF0OfJTPtD2xaZQJPBI4aUP2XmpMC/MtFonIApe63N7VXCBR57dogqg+aMe/dqTAfzGfec8QopghTy/JS2DAey63yoQMvl+z9BOd3CteqXgmIP69zYGWd18Q41XoDyYnrSDsCnMDxQWp2dkRkbKwfpE8fOaz7RxLeiZLFw07oo9ewz3LfV1dKHkIMwSCdf2jMbvnyT68R5MAe8pFaEcJFSFeuEplAlAHjbwHkjY8Lq/xvm2YfmCxbxOdnqVRDqrSiYzPFvzAdU+y6Mu0X4FKJqKQw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(346002)(39860400002)(136003)(451199015)(36840700001)(40470700004)(46966006)(6506007)(40480700001)(356005)(55016003)(7696005)(8676002)(316002)(107886003)(478600001)(70586007)(82310400005)(70206006)(4744005)(2906002)(5660300002)(86362001)(52536014)(4326008)(82740400003)(41300700001)(36860700001)(8936002)(81166007)(40460700003)(54906003)(47076005)(33656002)(110136005)(186003)(83380400001)(9686003)(26005)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2022 12:49:26.7183
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b8bd702-9ee5-4b29-dca1-08daad195cc0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9637

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIHhlbi9hcm06
IHAybTogUG9wdWxhdGUgcGFnZXMgZm9yIEdJQ3YyIG1hcHBpbmcgaW4NCj4gYXJjaF9kb21haW5f
Y3JlYXRlKCkNCj4gPiBJIHRoaW5rIGluIEFybSdzIGFyY2hfZG9tYWluX2NyZWF0ZSgpLCBhbGwg
dGhlIGVycm9yIGhhbmRsaW5nIGFyZSB0aGUNCj4gPiBzYW1lIHN0eWxlIHVzaW5nOg0KPiA+DQo+
ID4gaWYgKCAocmMgPSA8ZnVuY3Rpb24+KSAhPTAgKQ0KPiA+ICAgICAgZ290byBmYWlsOw0KPiA+
DQo+ID4gYW5kIHdlIG5lZWQgdG8ga2VlcCB0aGVtIHRoZSBzYW1lPw0KPiANCj4gV2UgZG9uJ3Qg
aGF2ZSB0b28uIEkgYWdyZWUgd2l0aCBBbmRyZXcncyBwb2ludC4gSG93IGFib3V0IHRoZSBmb2xs
b3dpbmc6DQo+IA0KPiBzcGluX2xvY2soKQ0KPiByYyA9IC4uLg0KPiBzcGluX3VubG9jaygpDQo+
IA0KPiBpZiAoIHJjICkNCj4gICAgZ290byBmYWlsOw0KDQpZZXAgdGhpcyBpcyBteSBjdXJyZW50
IG1ldGhvZCBvZiBsb2NhbCB2Mi4gVGhhbmtzIGZvciB0aGUgY2xhcmlmaWNhdGlvbi4NCldvcmtp
bmcgb24gdGhlIHAybV90ZWFyZG93biBwYXJ0IG5vdy4uLg0KDQpLaW5kIHJlZ2FyZHMsDQpIZW5y
eQ0KDQo+IA0KPiBDaGVlcnMsDQo+IA0KPiAtLQ0KPiBKdWxpZW4gR3JhbGwNCg==

