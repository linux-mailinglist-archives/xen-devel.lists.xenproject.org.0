Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A83756254BE
	for <lists+xen-devel@lfdr.de>; Fri, 11 Nov 2022 08:57:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.442346.696445 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otOuK-0002RD-5v; Fri, 11 Nov 2022 07:57:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 442346.696445; Fri, 11 Nov 2022 07:57:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otOuK-0002OZ-2Z; Fri, 11 Nov 2022 07:57:00 +0000
Received: by outflank-mailman (input) for mailman id 442346;
 Fri, 11 Nov 2022 07:56:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Waqq=3L=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1otOuI-0002OT-BC
 for xen-devel@lists.xenproject.org; Fri, 11 Nov 2022 07:56:58 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70041.outbound.protection.outlook.com [40.107.7.41])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6901710b-6196-11ed-8fd2-01056ac49cbb;
 Fri, 11 Nov 2022 08:56:55 +0100 (CET)
Received: from DB8PR06CA0022.eurprd06.prod.outlook.com (2603:10a6:10:100::35)
 by VE1PR08MB5856.eurprd08.prod.outlook.com (2603:10a6:800:1ab::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Fri, 11 Nov
 2022 07:56:52 +0000
Received: from DBAEUR03FT021.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:100:cafe::ec) by DB8PR06CA0022.outlook.office365.com
 (2603:10a6:10:100::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27 via Frontend
 Transport; Fri, 11 Nov 2022 07:56:52 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT021.mail.protection.outlook.com (100.127.142.184) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5813.12 via Frontend Transport; Fri, 11 Nov 2022 07:56:51 +0000
Received: ("Tessian outbound 0800d254cb3b:v130");
 Fri, 11 Nov 2022 07:56:51 +0000
Received: from 060c07116091.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B09D2327-91C7-4306-A780-B7EDDBF94AA7.1; 
 Fri, 11 Nov 2022 07:56:40 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 060c07116091.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 11 Nov 2022 07:56:40 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by AM9PR08MB6676.eurprd08.prod.outlook.com (2603:10a6:20b:2ff::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Fri, 11 Nov
 2022 07:56:39 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::b62d:6e04:1c26:6684]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::b62d:6e04:1c26:6684%5]) with mapi id 15.20.5813.013; Fri, 11 Nov 2022
 07:56:39 +0000
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
X-Inumbo-ID: 6901710b-6196-11ed-8fd2-01056ac49cbb
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Xx0E53wLiwXKbWSxiCJu+fxPZ0MT3oeLpM35PLMIwTG1io8Cv6OecRcLJ4ocy5ytTsuOyH89qmVOvWFErdpufw9AVoxLPYtu1BKYC2iQ0EHt1FuHU0ipvVKCNU3tMVc4IbUElIMQrjSF2jo93IQTYRJjUpI/Wlsw0O+F/q6r9zSG1z5TfvQ0LKYe9XuVTRJfrpeniFCDbBz7/GkHpkqQT3uKsiBfCbhnIiKcHIFNSzDp7St84ZRuYCuFGY1NrO+ptnUIX/+WVV2JUu1rOy+RouAFI+/Vmyjnk0MUdw5Nm42yxnMNLrGfrcAvzPxlbaW3f+FDl3KGF4mPkxI9HaDaqA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p4K/JReIs0wGnmT/fHNkpujlAvHDTOvPix5oIV+KhSU=;
 b=kOFqfnzB1IQn9z8Ns0g0D7zLT5XkmFnRsmnPC4xQbEJ4+4iyuqmNIMiCYAQ5t3uXwE3H5YEEllglJstYcdoUaVbaLZDSLDwAD05oLlfA6OaVNWPFURF2sMDqv7wI0F7onNOimCa25jK5XCJqaN03cekuI4Sla954Z9rJqF4jb7u7cU8PKEINWN7XN7R/yKHbA+bNBmMDP9XKdHN5tmVx3woDgNHvQQWYcc1KKQWhGvOevUICzK1GJ8zn/qiALgIAXVzWykYLMyfJghFlKCfd5uN++ySGsZBgDAg9g6y1zcWcpRIwen1QXQ9gTAxQL6ZpNgQk78ue2l9AQf4SL4QGgg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p4K/JReIs0wGnmT/fHNkpujlAvHDTOvPix5oIV+KhSU=;
 b=7eJmDkYy35cSscsQrjbDjD2+4cjC1YrYe+ut8E+d6bwURIfuq7CiMoqG5At0t/xBRqqJZem2cNByMaOCdounDGI5Y2+8vyKTl5h2pfbNN1oNvJqgnDwHev3WoK528j44Nj7QkhR84A9OjSvwgjkevXjz9/ksLR5zLm7UbCZINsc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z81Q+O2j9KN0FhnAsRhMlyLRpsIU2QPpogeN6X5C9OgvNPaPwGQAjKIs9J/jgypD/Z5V+h5p7m1lgMAX3FWIRDMJUI5waXEaNz+5Ob2+Y8zpRbtbez4CndNUtVdW6Bv9aIzzTaQ/hV/L8/ZiKazwWB2nz0TGAGLjkxX78luUQhBmBQ91CnpkaZk5oQtzEXBixZApOoSy6UUp86tV2SIPfaxSvBJcufqavr3DpAgWJIJa6VCeCGD54YEnVcZQ/y0pNaVCuEFx5x7pfB/g41GMIuf8fm6W1gJOHmw3kZaYmEBzZlJsZMzEPrMjBgPWHa4DJZ+fAtwO+izHefMOuQicog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p4K/JReIs0wGnmT/fHNkpujlAvHDTOvPix5oIV+KhSU=;
 b=FBjy8bnacf97SXNuJkRPeLb1/eWhtZ7G8q042pPlOmo8s5oredjKRRG9c973jgyecvO2E2RvUEqkg9rU+63SbrdWIoN+Bj1Raef6Vjslx0EzEjhvnSrm/++cRLGB1nZzj7JJX3FJnP8igcZa8oTq69KTG3mRmp7JkXeb7K+rjM4ndGlJCZPyD9gdCjdTEiZs5tAGrfNRFmcs8QkwRkVxVzbVkdwy4sCbXlj5Q7J8sijNJ+v4w6nVEWjCUQw+/ozi2V4vnWZPBSz513liuP1DcErpcHmA7gB6GVrjNS/RyPdRrOGbCfL1BKPltlEAdokG27DK+oDabA+A9X1KhBNs+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p4K/JReIs0wGnmT/fHNkpujlAvHDTOvPix5oIV+KhSU=;
 b=7eJmDkYy35cSscsQrjbDjD2+4cjC1YrYe+ut8E+d6bwURIfuq7CiMoqG5At0t/xBRqqJZem2cNByMaOCdounDGI5Y2+8vyKTl5h2pfbNN1oNvJqgnDwHev3WoK528j44Nj7QkhR84A9OjSvwgjkevXjz9/ksLR5zLm7UbCZINsc=
From: Wei Chen <Wei.Chen@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: nd <nd@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH v6 07/11] xen/arm: implement FIXMAP_ADDR for MPU systems
Thread-Topic: [PATCH v6 07/11] xen/arm: implement FIXMAP_ADDR for MPU systems
Thread-Index: AQHY8DVneLUTj6n4XEmKaYaqtg988K4yT/yAgAPcKRCAAMX/AIACaq9w
Date: Fri, 11 Nov 2022 07:56:38 +0000
Message-ID:
 <PAXPR08MB7420AF1E44DF6FF39CD74B749E009@PAXPR08MB7420.eurprd08.prod.outlook.com>
References: <20221104100741.2176307-1-wei.chen@arm.com>
 <20221104100741.2176307-8-wei.chen@arm.com>
 <db5667fc-ac64-411c-4011-dd4bbe25ad7e@xen.org>
 <PAXPR08MB7420B9D326528EC2D20FE47D9E3E9@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <88350ef8-3f52-7535-b3e0-b2a76e8bc7de@xen.org>
In-Reply-To: <88350ef8-3f52-7535-b3e0-b2a76e8bc7de@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 6D600E6ACDB5524E846A4B24DAEDF1A0.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PAXPR08MB7420:EE_|AM9PR08MB6676:EE_|DBAEUR03FT021:EE_|VE1PR08MB5856:EE_
X-MS-Office365-Filtering-Correlation-Id: 74ea0241-116d-4d19-e411-08dac3ba4af0
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 lkyRzgwAjtRy4kuETLnabTtAEVAeZCWEAuK3TxOLnmIASoC8kGD7GMhRhmbzqWHnuaZJWXHU6jhHk2wIgK4yb9pwGx1Yl+juwm3sYNve/KCP/w1vExo1RSXjSXhuRJSKRwg5Wp4P5H//wmSzWoFRGbAczXEtpclnmnwugiCFG4ZiHWn7lgBt/lS4OI7plwJC5l//NxIPSPdvfFErQAq6dsgBYi4QMsyKSRRoPYPAJwaPHas9OUxSYjaU8lFmSq6ltdKmGg4gYH+N6QfAGDgdMkOJwFGED5Fz+cKkrx9df9Ch9z9Qv2fZRZHkoPHHnLDd2pGN/6rnVawc76VZuKyER3oGVhTr9oZ7XsEqXpapt4G1OY4Ror8+t8EERNbrepAD94d4pZO0424BUjZcSuhiLyCmDPvEZ7NnrmoczfAsIQSNedWlRFY9nEIwyfBqPMDjfx/E8s71XBMBXou409gn6WCsMrxRwVP0uUnb8FqK7gsCO/V9kRfrDS5Kl7RdzU6xULHYi54Lhc2BmjlUiXwEKv9yELMxORmJPN42QHzlKSk69NqI4rYxWyuoAmswhQFV5V4es+0OplCA2vP02a7CnbPB0IpQR28eaU3T+hwoOgATSSVn7qsWpVVIz2ASsIIKXTrGmSLQP+/zVGz8TZU/eqKszYC/zI3hIhxG813miD8Ixue9VXV0iEClkdH5a0YFx6UvOkVngmrqfy+rRRRb+vSa8spvjtW9jGpJ4MmVfG35YA1A8hROSAVUH+YoEHW5EowRGwyu+9n2IRbB9DAX7g==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(396003)(136003)(366004)(39860400002)(451199015)(38070700005)(71200400001)(110136005)(66446008)(316002)(66556008)(76116006)(66476007)(64756008)(66946007)(8676002)(38100700002)(55016003)(86362001)(33656002)(122000001)(26005)(6506007)(186003)(7696005)(9686003)(53546011)(54906003)(478600001)(41300700001)(2906002)(4326008)(83380400001)(5660300002)(52536014)(8936002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6676
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	18ed0bb3-e988-4e02-914b-08dac3ba4374
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	22VgmkHq5Xf2DkjaEdj5wAdn662hKfJ7MvOebXZ2yx0kVHMAZ9qvy+ibtDtfHIRfnFKMkMJLklK9Fv8XMxD6hkuF7ig3N0nw5Smcq8tJ8TKSvltzUquMuZi/4EUFfpK5I11f40KZ7VxLjTzfNrocR55wHGBf8qMYEk/OKZ0lT9q2bTC6yma02Hz2elZnTRWcJCMAGI9G8VOm4zbeVNTM/O9AzZ2Uyd3gwbodinJIWA0irA/1UFWv8CZnvzzxRfq3SLiUUsa+DzXBM8vKV8Js+qObgmy9njkzwRVPReV17PW0HKO+UV4hOzo9wTpQI9UYP/ri3ATaumULcTW7UOgZaDEFe/5H5EB9UsYfRTWRtyiV68A8jtikMub4M908Nyk/F1fiKLuDeaROYgMSIfh7PH1Yc3hmYpubiufrNNaFbQqSB3jU+0rOz1Ilj9HZ/60ktfSG9mGICen84jRaxJa+F9m1KqtjUO7+7rku21U061+U15ob+uEhNmq6E8x3kCDthYHl26QdBFIu7lrJPIrV7QsV2L300rKiGroTiBD66pXVMuJ+qcRlzSbPtzkkrF5vmZGs08N83BCYLVVmciqiVOUMeHafXzo9eqvoD1aXAr1JxC7T3sK1f1Ov9cmoSMzH+JMmDg9h5c7GILkv0YUy2TY2T1sbViEUU+D4qmoJVCItB3s/lKdz7L8hOUodRFgB8pZDEHjiRNVvX5hRM7xwDWHbpeC6T6gsbaKUxi0noqfPooK0BjZ2aigG/bzJ2bGk8rkVS9B2SSuqKs+RzXAKBw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(136003)(39860400002)(346002)(451199015)(40470700004)(36840700001)(46966006)(26005)(4326008)(47076005)(9686003)(40460700003)(8676002)(33656002)(70586007)(70206006)(2906002)(52536014)(8936002)(107886003)(86362001)(5660300002)(41300700001)(336012)(316002)(53546011)(356005)(186003)(55016003)(7696005)(478600001)(6506007)(81166007)(40480700001)(82310400005)(82740400003)(54906003)(83380400001)(110136005)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2022 07:56:51.4980
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 74ea0241-116d-4d19-e411-08dac3ba4af0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5856

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IFNlbnQ6IDIwMjLlubQxMeaciDEw5pelIDI6MzAN
Cj4gVG86IFdlaSBDaGVuIDxXZWkuQ2hlbkBhcm0uY29tPjsgeGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnDQo+IENjOiBuZCA8bmRAYXJtLmNvbT47IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0
YWJlbGxpbmlAa2VybmVsLm9yZz47IEJlcnRyYW5kDQo+IE1hcnF1aXMgPEJlcnRyYW5kLk1hcnF1
aXNAYXJtLmNvbT47IFZvbG9keW15ciBCYWJjaHVrDQo+IDxWb2xvZHlteXJfQmFiY2h1a0BlcGFt
LmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NiAwNy8xMV0geGVuL2FybTogaW1wbGVtZW50
IEZJWE1BUF9BRERSIGZvciBNUFUNCj4gc3lzdGVtcw0KPiANCj4gDQo+IA0KPiBPbiAwOS8xMS8y
MDIyIDA2OjQ2LCBXZWkgQ2hlbiB3cm90ZToNCj4gPiBIaSBKdWxpZW4sDQo+IA0KPiBIaSBXZWks
DQo+IA0KPiA+DQo+ID4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+IEZyb206IEp1
bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+ID4+IFNlbnQ6IDIwMjLlubQxMeaciDfml6Ug
Mzo0NQ0KPiA+PiBUbzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+OyB4ZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcNCj4gPj4gQ2M6IG5kIDxuZEBhcm0uY29tPjsgU3RlZmFubyBTdGFi
ZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsNCj4gQmVydHJhbmQNCj4gPj4gTWFycXVp
cyA8QmVydHJhbmQuTWFycXVpc0Bhcm0uY29tPjsgVm9sb2R5bXlyIEJhYmNodWsNCj4gPj4gPFZv
bG9keW15cl9CYWJjaHVrQGVwYW0uY29tPg0KPiA+PiBTdWJqZWN0OiBSZTogW1BBVENIIHY2IDA3
LzExXSB4ZW4vYXJtOiBpbXBsZW1lbnQgRklYTUFQX0FERFIgZm9yIE1QVQ0KPiA+PiBzeXN0ZW1z
DQo+ID4+DQo+ID4+IEhpIFdlaSwNCj4gPj4NCj4gPj4gT24gMDQvMTEvMjAyMiAxMDowNywgV2Vp
IENoZW4gd3JvdGU6DQo+ID4+PiBGSVhNQVAgaXMgYSBzcGVjaWFsIHZpcnR1YWwgYWRkcmVzcyBz
ZWN0aW9uIGZvciBYZW4gdG8gbWFwIHNvbWUNCj4gPj4+IHBoeXNpY2FsIHJhbSBvciBkZXZpY2Ug
bWVtb3J5IHRlbXBvcmFyaWx5IGluIGluaXRpYWxpemF0aW9uIGZvcg0KPiA+Pj4gTU1VIHN5c3Rl
bXMuIEZJWE1BUF9BRERSIHdpbGwgcmV0dXJuIGEgdmlydHVhbCBhZGRyZXNzIGJ5IGluZGV4DQo+
ID4+PiBmb3Igc3BlY2lhbCBwdXJwb3NlIHBoeXMtdG8tdmlydCBtYXBwaW5nIHVzYWdlLiBGb3Ig
ZXhhbXBsZSwNCj4gPj4+IEZJWE1BUF9BRERSKEZJWE1BUF9DT05TT0xFKSBmb3IgZWFybHkgY29u
c29sZSBtYXBwaW5nIGFuZA0KPiA+Pj4gRklYTUFQX0FERFIoRklYTUFQX01JU0MpIGZvciBjb3B5
X2Zyb21fcGFkZHIuDQo+ID4+DQo+ID4+IFRvIG1lLCB3ZSBhcmUgYmVuZGluZyBxdWl0ZSBhIGJp
dCB0aGUgZGVmaW5pdGlvbiBvZiB0aGUgZml4bWFwLiBUaGVyZQ0KPiA+PiBhcmUgbm90IG1hbnkg
dXNlIG9mIHRoZSBGSVhNQVAgd2l0aGluIHRoZSBjb2RlIGFuZCBJIHRoaW5rIGl0IHdvdWxkDQo+
ID4+IHNpbXBseSBiZSBiZXR0ZXIgdG8gYWJzdHJhY3QgdGhlIHVzZSAob3IgcmVtb3ZpbmcgaXQg
d2hlbiBwb3NzaWJsZSkgYW5kDQo+ID4+IGF2b2lkIGRlZmluaW5nIEZJWE1BUF9BRERSKCkgJiBj
byBmb3IgTVBVLg0KPiA+Pg0KPiA+DQo+ID4gSSBhZ3JlZSwgaWYgd2UgZG9uJ3QgbWluZCB0byBh
ZGQgc29tZSBDT05GSUdfSEFTX01QVSBpbiBzb21lIGdlbmVyaWMNCj4gY29kZS4NCj4gDQo+IEZB
T0QsIHRoaXMgaXMgbm90IHdoYXQgSSBoYWQgaW4gbWluZC4gSW5zdGVhZCwgaXQgd2FzIHRvIHBy
b3ZpZGUgaGVscGVyDQo+IHdoaWNoIGZvciAhSEFTX01QVSB3b3VsZCBjYWxsIGZpeG1hcCBhbmQg
Zm9yIEhBU19NUFUgd291bGQgZG8gdGhlIHdvcmsNCj4gdG8gbWFwIHRoZSByZWdpb24gaW4gdGhl
IE1QVS4NCj4gDQoNClNvcnJ5LCBJIGFtIHN0aWxsIGNvbmZ1c2VkIGFib3V0IHRoaXMgY29tbWVu
dCwgZGlkIHlvdSBtZWFuIHdlIGNhbiBwcm92aWRlcg0KU29tZSBnZW5lcmljIGhlbHBlcnMgbGlr
ZTogZWFybHlfbWFwX2NvbnNvbGUgLyBlYXJ5X21hcF9ndWVzdF9tZW1vcnkuDQpGb3Igbm9uLU1Q
VSBzeXN0ZW0sIHdlIHN0aWxsIGNhbiBjYWxsIGZpeG1hcCBpbiB0aGVzZSBjYWxsZXJzLCBidXQg
Zm9yDQpNUFUgc3lzdGVtLCB3ZSBoYXZlIHRvIG1hcCB0aGUgcmVnaW9uIHRvIE1QVSByZWdpb24/
DQoNCj4gWy4uLl0NCj4gDQo+ID4+PiAgICB4ZW4vYXJjaC9hcm0vS2NvbmZpZyAgICAgICAgICAg
ICAgICAgIHwgIDIgKy0NCj4gPj4+ICAgIHhlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9jb25maWdf
bXB1LmggfCAgMiArKw0KPiA+Pj4gICAgeGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL2ZpeG1hcC5o
ICAgICB8IDI1DQo+ICsrKysrKysrKysrKysrKysrKysrKysrKysNCj4gPj4+ICAgIDMgZmlsZXMg
Y2hhbmdlZCwgMjggaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiA+Pj4NCj4gPj4+IGRp
ZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vS2NvbmZpZyBiL3hlbi9hcmNoL2FybS9LY29uZmlnDQo+
ID4+PiBpbmRleCBhYzI3NjMwN2Q2Li4xNDU4ZmZhNzc3IDEwMDY0NA0KPiA+Pj4gLS0tIGEveGVu
L2FyY2gvYXJtL0tjb25maWcNCj4gPj4+ICsrKyBiL3hlbi9hcmNoL2FybS9LY29uZmlnDQo+ID4+
PiBAQCAtMTYsNyArMTYsNyBAQCBjb25maWcgQVJNDQo+ID4+PiAgICAJc2VsZWN0IEhBU19ERVZJ
Q0VfVFJFRQ0KPiA+Pj4gICAgCXNlbGVjdCBIQVNfUEFTU1RIUk9VR0gNCj4gPj4+ICAgIAlzZWxl
Y3QgSEFTX1BEWA0KPiA+Pj4gLQlzZWxlY3QgSEFTX1BNQVANCj4gPj4+ICsJc2VsZWN0IEhBU19Q
TUFQIGlmICFIQVNfTVBVDQo+ID4+DQo+ID4+IEkgY2FuJ3QgZmluZCBhbnkgY2hhbmdlIG9mIG1t
LmMgaW4gdGhpcyBzZXJpZXMuIFNvIHN1cmVseSB0aGlzIHdpbGwNCj4gPj4gYnJlYWsgdGhlIGJ1
aWxkPw0KPiA+DQo+ID4gWWVzLCBpbiBvdXIgaW50ZXJuYWwgdGVzdGluZywgb3BlbiBQTUFQIGZv
ciBNUFUgd2lsbCBjYXVzZSBidWlsZGluZw0KPiA+IGZhaWxlZCwgZXhjZXB0IHdlIGFkZCBzb21l
IG5ldyBzdHVicyBmb3IgTVBVIHN5c3RlbS4NCj4gDQo+IERvIHlvdSBtZWFuIHlvdSBhZGRlZCBz
b21lIHN0dWJzIGZvciBQTUFQPyBJZiBzbywgSSB3b3VsZCBub3QgZXhwZWN0IGFueQ0KPiBjYWxs
ZXIgZm9yIHRoZSBwbWFwKCkgdG8gYmUgdXNlZCBmb3IgdGhlIE1QVS4gVGhlcmVmb3JlLCB3aHkg
d291bGQgdGhleQ0KPiBiZSBuZWNlc3Nhcnk/DQo+IA0KDQpObywgSSBtZWFuIGlmIHdlIHdhbnQg
dG8gbWFrZSBwbWFwIGNhbiBiZSBidWlsdCBzdWNjZXNzZnVsbHkgZm9yIE1QVSwNCndlIGhhdmUg
dG8gaW1wbGVtZW50IHNvbWUgc3R1YnMgbGlrZTogZml4X3RvX3ZpcnQsIHhlbl9maXhtYXAgYW5k
DQp3cml0ZV9wdGUsIHRvIG1ha2UgY29tcGlsaW5nIHN1Y2Nlc3MuIEJ1dCBqdXN0IGFzIHlvdSBz
YWlkLCB3ZSB3b3VsZA0Kbm90IGV4cGVjdCBNUFUgdG8gdXNlIGFueSBQTUFQIGZ1bmN0aW9uLCBz
byB3ZSBoYXZlIG5vdCBpbXBsZW1lbnRlZA0KdGhlbSBmb3IgTVBVLiBJbnN0ZWFkIHdlIGRpc2Fi
bGUgUE1BUCBmb3IgTVBVLiANCg0KQ2hlZXIsDQpXZWkgQ2hlbg0KDQo+IENoZWVycywNCj4gDQo+
IC0tDQo+IEp1bGllbiBHcmFsbA0K

