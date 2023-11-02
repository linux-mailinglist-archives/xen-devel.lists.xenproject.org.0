Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1AE27DE969
	for <lists+xen-devel@lfdr.de>; Thu,  2 Nov 2023 01:35:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626706.977201 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyLgF-0004Ib-7d; Thu, 02 Nov 2023 00:35:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626706.977201; Thu, 02 Nov 2023 00:35:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyLgF-0004Fv-4f; Thu, 02 Nov 2023 00:35:27 +0000
Received: by outflank-mailman (input) for mailman id 626706;
 Thu, 02 Nov 2023 00:35:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y1wU=GP=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qyLgD-0004FT-9h
 for xen-devel@lists.xenproject.org; Thu, 02 Nov 2023 00:35:25 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0630.outbound.protection.outlook.com
 [2a01:111:f400:fe02::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b5db61e2-7917-11ee-98d6-6d05b1d4d9a1;
 Thu, 02 Nov 2023 01:35:24 +0100 (CET)
Received: from AM6PR10CA0015.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:89::28)
 by DBAPR08MB5655.eurprd08.prod.outlook.com (2603:10a6:10:1ab::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.29; Thu, 2 Nov
 2023 00:35:14 +0000
Received: from AM3PEPF0000A792.eurprd04.prod.outlook.com
 (2603:10a6:209:89:cafe::ca) by AM6PR10CA0015.outlook.office365.com
 (2603:10a6:209:89::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.19 via Frontend
 Transport; Thu, 2 Nov 2023 00:35:14 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM3PEPF0000A792.mail.protection.outlook.com (10.167.16.121) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6954.19 via Frontend Transport; Thu, 2 Nov 2023 00:35:12 +0000
Received: ("Tessian outbound 20615a7e7970:v228");
 Thu, 02 Nov 2023 00:35:12 +0000
Received: from 1026e5851ebd.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E803DCE3-A45D-4C9B-984E-910DA0C02ED1.1; 
 Thu, 02 Nov 2023 00:35:06 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1026e5851ebd.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 02 Nov 2023 00:35:06 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by VI1PR08MB5536.eurprd08.prod.outlook.com (2603:10a6:803:13b::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.32; Thu, 2 Nov
 2023 00:35:00 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::ae6e:f96c:f2f3:efc9]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::ae6e:f96c:f2f3:efc9%4]) with mapi id 15.20.6954.019; Thu, 2 Nov 2023
 00:35:00 +0000
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
X-Inumbo-ID: b5db61e2-7917-11ee-98d6-6d05b1d4d9a1
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=VjwMM5kczdu70Tz8X+8akBrNbXKqDdV23UR6NCeSoPimLKdysspgnb+gcnpiMfKmchlkCpsYEIMJ8JRwiyc7p8jYrtj5SyI+hW2LyOfgDJBiPl7wTv5UggPG2pSfUU1cS8j/sgbyac97vmVVXgB9IgHPW4dxPVbXOhSqIgtbRJkhD/DIKVswECRjCHwaSmA3e9h4KiUEvxXvSbIeXo5oV6cIut8z5/+GNrCCcWba4g+iPrjRrxO6XaPF8PceYhpLU2F4XR/lJsiSh+z2wH5G9DWQu2htmXE5BF3mxszNTz2UBGeTOqci3VN7qQG85C7E46a5rCvVCxyswyLcWuVD8A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uY0i+bDrufiyejQEaFO9AjtV3Y0S6iYwwdp4/pVT21s=;
 b=HG8UIUTRGG/YK4zy7bB12MURHKZOKLwzCgYeXv3hbHwgusmqSJNXwI+wOf1tR6QKUMqVfMh0gZITWod7nzkDgUD9i5LWSBL3xg/fS8ArWRT3tsUMsXeuyLpnEz2ysM1jDtwis9VtwGElACRaOcOXuNAnRQ3eHtk7k2VSo0V7cbX8HfntzrrM7VolBCFLvcoLOkL6eO7r1jiB+UYo2NGg5GkBTBcqh3g9Yihag5ecnD3CSGOrfgLW/z8RPjGTwWp19YDJtEgSwB4ObyIJrO8MNaqwQPYrxZRXwvM3zQFQUGwIFisLZxSuith58yk4CKGsqbfSObLNa38On8cr5Ut5xw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uY0i+bDrufiyejQEaFO9AjtV3Y0S6iYwwdp4/pVT21s=;
 b=mjmsXskY/oIHfyU/v1NJ+JnjlodrPyoAJU0pSR9I4CKZiJVw30fLHUquh4zjyoHh+l5lYhiMwRiNaSycATt4t0kJ14hbN9WhIGqUxFRtQxt4lHUTwtwWUxgYB7TRmuYZQZfgs0soAS/ZagXvPZr3ljMPN9CqfkOZBXxDctZCGtQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: dce25e8c3f18d8d2
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UFM/s9MeQEgXNRaE371PNN3jBIf1Xx04BaAI5+eJom4NT8za43Za6LUZOvrfvp8t6lIzEeuKl7490lCpk44Od4tk5+h4SVkZFs6OpsyPsvpgdYgsmcZnZsHifG5rmwZnfdy/t3b3VsnD8GLR27kaJ8QU+Fyvr9QYbHNVjTZHCtrpH4aiSt4R+4K1DhXCkW2/LXoaCwUYPMaRmG9ZvPHp+Nq6NgJVgIBmJwK41Wqylj1P9YfzxavBAa3Q/V8cABQniUsWNMiPKUdQFGnmYdu7ikL/zrXuomsyOJMB70QA1dOw3bRKYaIjgJoNvPi0GwZqhgFmSmX064S5xQRttCV0zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uY0i+bDrufiyejQEaFO9AjtV3Y0S6iYwwdp4/pVT21s=;
 b=hqyEM1puu8ttVQKPM194coIB92Pz6pscrGrVU9/Ul4dcMYV2+9e66/UxT/gVLwARpWEeeTJvIwkiNYNq0oUktbEw/o64yFxPlkHxiEz3xLEMpRgC73kx4af2VMYzHnJ9dKW4xI1tfv26wJcdv+6pWspkYh0XUzr/ek7SWG0lbZSvB85mB16wAqJw7cq0GpSSPtm65eLU4O75kbL0Rd8Z0QOV+YA4dWKphH6Y8kXdq6qAJH1mArlu/4y5hf88K2yCnPiEShb7fr/OMmguT0ZMUMbURImubkEoW+5ztq+XLvr8R7wMzgJD7mslOyJIqi94r36CKdaQP9hQ0+sblqTTVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uY0i+bDrufiyejQEaFO9AjtV3Y0S6iYwwdp4/pVT21s=;
 b=mjmsXskY/oIHfyU/v1NJ+JnjlodrPyoAJU0pSR9I4CKZiJVw30fLHUquh4zjyoHh+l5lYhiMwRiNaSycATt4t0kJ14hbN9WhIGqUxFRtQxt4lHUTwtwWUxgYB7TRmuYZQZfgs0soAS/ZagXvPZr3ljMPN9CqfkOZBXxDctZCGtQ=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Penny Zheng
	<Penny.Zheng@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Wei Chen <Wei.Chen@arm.com>
Subject: Re: [PATCH v8 8/8] xen/arm: mmu: move MMU specific P2M code to
 mmu/p2m.{c,h}
Thread-Topic: [PATCH v8 8/8] xen/arm: mmu: move MMU specific P2M code to
 mmu/p2m.{c,h}
Thread-Index: AQHaBVa3sLk3IeHXfE+9kkvgtQfUTbBl2VsAgABkvgA=
Date: Thu, 2 Nov 2023 00:35:00 +0000
Message-ID: <EA7BFF62-76A3-494B-B3EF-67E0664F98E8@arm.com>
References: <20231023021345.1731436-1-Henry.Wang@arm.com>
 <20231023021345.1731436-9-Henry.Wang@arm.com>
 <fcc12d0f-5529-4f2a-a721-f6f92410e5b7@xen.org>
In-Reply-To: <fcc12d0f-5529-4f2a-a721-f6f92410e5b7@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|VI1PR08MB5536:EE_|AM3PEPF0000A792:EE_|DBAPR08MB5655:EE_
X-MS-Office365-Filtering-Correlation-Id: cd623140-bc9a-41a4-ecb2-08dbdb3b938c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 JvD5m/p6BXv1AnMZeTFJKAZckKlc14ZuNjMtIx35l082KbOqI0K1s+G/75rwKc2XbJf06PiIdazck5wo+4rny8SLCd9gbGctDVBNsITPRQC8SYQhQ67Ioten7xlCxMXWhHXbJBurJMJZxh3L2FRGw5kCn00tFlrQW0CAlaqkAR562CNet4HIBUfEGg3yoxAoFrgwMz34r7OTmmvPKieSWOul+CyyQZLA9z1DFFYGPqAH6+Iq/Dp8mWPsKhy8nRD75OkuJnCHWEvVGGHMlzUUeIkJ9y2VYvDp87vNwgQaa1oLOCwJ8euba07DHK6RshhLi/Uj/nFdex2IfRioMpIxtH4oYFyeb/yltjIKGLbS9FG3KTIrLeLkPO48DQx3xXRcMRLIRc/pj9vKvDMHEB9RQAeh8l+uk35i45NG6n8RzUzByPdbs/zv703bpncXDB3UfqlcMCxZUX5JW7r8AiBnBAqjalNCPeoxC9auvxIJMDEtFPq/jhtIHqGZljfBXLIKaan32u7I6IxVuvWi7lZ6iugZ1j58VL2PYqhs0eF1dgYjTOxRtpk5Q+FQ3goiPdQzte8Vtm5crrXxvO0XF444XyjHZyROFwql9pO/r4Io2Z9q8Pyq8n4PVEpMoKfbgCIsvI193u7YIVP/2sC/RD1KyQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(366004)(396003)(136003)(376002)(346002)(230922051799003)(1800799009)(451199024)(186009)(64100799003)(316002)(54906003)(36756003)(8936002)(4326008)(41300700001)(6916009)(8676002)(5660300002)(64756008)(38100700002)(122000001)(66446008)(66476007)(2906002)(2616005)(26005)(66556008)(66946007)(6486002)(478600001)(86362001)(83380400001)(76116006)(91956017)(33656002)(71200400001)(6512007)(53546011)(6506007)(38070700009)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <FDAD0627D53C2F4C92E57E7F98E641FD@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5536
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF0000A792.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	1a51d054-b0c6-4a3d-20b1-08dbdb3b8c39
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2sOzDffOsUwiOd0g30F4p8pXDotp5DDOsDhbu3XHexhWapfDCleeH1E/sq4Ah9cfoNEFJhpXPdBgxvF8tRb/72uMtba/7lK907nIyiwVDwRtYfwdRAglW0wP4GOeLp/3fB6y6hcPsjojxVfopPPwEpTJYrt3JYmchKAs3kVCUwwD8OQYxJH7ncv+UAMABwsReqMar4/7wFsDabHWhVpGe0jHZ9kwqmFvJlKZzWt6Shwx4kzQLzk/Csoy5AF+1+k0rQE8O/sG3EIuvmmpcaOasGeD74bU5tg4iFElnO3glX1D2Umfkq8x7pEjHyp2WKS0/t8wgJMSSIs3iJVEptpbtTkHGV7V2uMUK8ORhdWnHc50VKO0ymwgZjXJBqQUh/EQtKg5RDVxGIJv2GfNhqUm+neoqkR6fD+yfVCQuHQzzaXnsGXl2s4bLoRs35Ai0ivjOdsk9IEj+f/6YW/LakNxZTH8QAqQrMx9arISTdOODTrrYJAegHykTAE8t2uImRbbJY7NPwrftwFs3dIdkU9jlAWfO9b1MvbgB4Y7pxxMYfNXHfTz3/uOYvYEEmknj8p0QKxGe/+b2k8WDqmMR0iKqfL+tpvja2m6MYhQ0EWPijwFBjUV2IGqf5qlgckTZjWSp6+RiuW6NjbxvIZoEXL+kxEryueCmA7/gLZSYAcMaSxG7tpnVF6l58XH0h20S53RDXsdE7NmK/AkdOE18cUUZmMrIZclGOCSBI5ZQYj3oNxuY3KH0TcKFV6y+LE4+q52
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(136003)(346002)(39850400004)(376002)(230922051799003)(82310400011)(451199024)(186009)(64100799003)(1800799009)(36840700001)(46966006)(40470700004)(47076005)(336012)(40460700003)(70586007)(54906003)(316002)(70206006)(26005)(4326008)(8676002)(40480700001)(8936002)(6862004)(83380400001)(5660300002)(82740400003)(36756003)(6486002)(81166007)(478600001)(33656002)(2906002)(53546011)(6506007)(356005)(6512007)(86362001)(36860700001)(41300700001)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2023 00:35:12.7471
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cd623140-bc9a-41a4-ecb2-08dbdb3b938c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A792.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5655

SGkgSnVsaWVuLA0KDQo+IE9uIE5vdiAyLCAyMDIzLCBhdCAwMjozNCwgSnVsaWVuIEdyYWxsIDxq
dWxpZW5AeGVuLm9yZz4gd3JvdGU6DQo+IA0KPiBIaSBIZW5yeSwNCj4gDQo+IE9uIDIzLzEwLzIw
MjMgMDM6MTMsIEhlbnJ5IFdhbmcgd3JvdGU6DQo+PiBGcm9tOiBQZW5ueSBaaGVuZyA8cGVubnku
emhlbmdAYXJtLmNvbT4NCj4+IEN1cnJlbnQgUDJNIGltcGxlbWVudGF0aW9uIGlzIGRlc2lnbmVk
IGZvciBNTVUgc3lzdGVtIG9ubHkuDQo+PiBXZSBtb3ZlIHRoZSBNTVUtc3BlY2lmaWMgY29kZXMg
aW50byBtbXUvcDJtLmMsIGFuZCBvbmx5IGtlZXAgZ2VuZXJpYw0KPj4gY29kZXMgaW4gcDJtLmMs
IGxpa2UgVk1JRCBhbGxvY2F0b3IsIGV0Yy4gV2UgYWxzbyBtb3ZlIE1NVS1zcGVjaWZpYw0KPj4g
ZGVmaW5pdGlvbnMgYW5kIGRlY2xhcmF0aW9ucyB0byBtbXUvcDJtLmgsIHN1Y2ggYXMgcDJtX3Rs
Yl9mbHVzaF9zeW5jKCkuDQo+PiBBbHNvIGV4cG9zZSBwcmV2aW91c2x5IHN0YXRpYyBmdW5jdGlv
bnMgcDJtX3ZtaWRfYWxsb2NhdG9yX2luaXQoKSwNCj4+IHAybV9hbGxvY192bWlkKCkgZm9yIGZ1
cnRoZXIgTVBVIHVzYWdlLiBTaW5jZSB3aXRoIHRoZSBjb2RlIG1vdmVtZW50DQo+PiBwMm1fZnJl
ZV92bWlkKCkgaXMgbm93IHVzZWQgaW4gdHdvIGZpbGVzLCBhbHNvIGV4cG9zZSBwMm1fZnJlZV92
bWlkKCkuDQo+PiBXaXRoIHRoZSBjb2RlIG1vdmVtZW50LCBnbG9iYWwgdmFyaWFibGUgbWF4X3Zt
aWQgaXMgdXNlZCBpbiBtdWx0aXBsZQ0KPj4gZmlsZXMgaW5zdGVhZCBvZiBhIHNpbmdsZSBmaWxl
IChhbmQgd2lsbCBiZSB1c2VkIGluIE1QVSBQMk0NCj4+IGltcGxlbWVudGF0aW9uKSwgZGVjbGFy
ZSBpdCBpbiB0aGUgaGVhZGVyIGFuZCByZW1vdmUgdGhlICJzdGF0aWMiIG9mDQo+PiB0aGlzIHZh
cmlhYmxlLg0KPj4gQWxzbywgc2luY2UgcDJtX2ludmFsaWRhdGVfcm9vdCgpIHNob3VsZCBiZSBN
TVUgb25seSBhbmQgYWZ0ZXIgdGhlDQo+PiBjb2RlIG1vdmVtZW50IHRoZSBvbmx5IGNhbGxlciBv
ZiBwMm1faW52YWxpZGF0ZV9yb290KCkgb3V0c2lkZSBvZg0KPj4gbW11L3AybS5jIGlzIGFyY2hf
ZG9tYWluX2NyZWF0aW9uX2ZpbmlzaGVkKCksIGNyZWF0aW5nIGEgbmV3IGZ1bmN0aW9uDQo+PiBu
YW1lZCBwMm1fZG9tYWluX2NyZWF0aW9uX2ZpbmlzaGVkKCkgaW4gbW11L3AybS5jIGZvciB0aGUg
b3JpZ2luYWwNCj4+IGNvZGUgaW4gYXJjaF9kb21haW5fY3JlYXRpb25fZmluaXNoZWQoKSwgYW5k
IG1hcmtpbmcNCj4+IHAybV9pbnZhbGlkYXRlX3Jvb3QoKSBhcyBzdGF0aWMuDQo+PiBUYWtlIHRo
ZSBvcHBvcnR1bml0eSB0byBmaXggdGhlIGluY29ycmVjdCBjb2Rpbmcgc3R5bGUgd2hlbiBwb3Nz
aWJsZS4NCj4+IFdoZW4gdGhlcmUgaXMgYml0IHNoaWZ0IGluIG1hY3JvcywgdGFrZSB0aGUgb3Bw
b3J0dW5pdHkgdG8gYWRkIHRoZQ0KPj4gbWlzc2luZyAnVScgYXMgYSBjb21wbGlhbmNlIG9mIE1J
U1JBLg0KPj4gU2lnbmVkLW9mZi1ieTogUGVubnkgWmhlbmcgPHBlbm55LnpoZW5nQGFybS5jb20+
DQo+PiBTaWduZWQtb2ZmLWJ5OiBXZWkgQ2hlbiA8d2VpLmNoZW5AYXJtLmNvbT4NCj4+IFNpZ25l
ZC1vZmYtYnk6IEhlbnJ5IFdhbmcgPEhlbnJ5LldhbmdAYXJtLmNvbT4NCj4gDQo+IEFja2VkLWJ5
OiBKdWxpZW4gR3JhbGwgPGpncmFsbEBhbWF6b24uY29tPg0KDQpUaGFua3MhDQoNCj4gDQo+IEkg
dGhpbmsgdGhlIHNlcmllcyBpcyBub3cgZnVsbHkgYWNrZWQuIEJ1dCBJIHdpbGwgd2FpdCBmb3Ig
NC4xOCB0byBiZSByZWxlYXNlZCBiZWZvcmUgbWVyZ2luZyB0aGlzIHNlcmllcy4NCg0KSSB0aGlu
ayB0aGUgdGhpcmQgcGF0Y2ggInhlbi9hcm06IEZvbGQgbW11X2luaXRfc2Vjb25kYXJ5X2NwdSgp
IHRvIGhlYWQuU+KAnSB3aWxsIG5lZWQgdGhlDQpkb3VibGUgY2hlY2sgZnJvbSB5b3VyIHNpZGUg
OikNCg0KSGVyZSBpcyB3aGF0IEkgaGF2ZSBsb2NhbGx5LCB0byBzYXZlIHRpbWUgSSB3aWxsIGp1
c3Qgc2hvdyB0aGUgY29udGVudCBoZXJlIGZvciB5b3UgdG8gY2hlY2ssDQphbmQgSSB3aWxsIHB1
c2ggaXQgaW4gdGhlIG5leHQgZmV3IGRheXM6DQoNCmNvbW1pdCBiYTcyZDZkYzE3ZmQ3Y2U5YTg2
M2I5ZTAwYjA2YjMzYzA2OWM3NjQxDQpBdXRob3I6IEhlbnJ5IFdhbmcgPEhlbnJ5LldhbmdAYXJt
LmNvbT4NCkRhdGU6ICAgV2VkIEF1ZyAyMyAxNzo1OTo1MCAyMDIzICswODAwDQoNCiAgICB4ZW4v
YXJtOiBGb2xkIG1tdV9pbml0X3NlY29uZGFyeV9jcHUoKSB0byBoZWFkLlMNCg0KICAgIEN1cnJl
bnRseSBtbXVfaW5pdF9zZWNvbmRhcnlfY3B1KCkgb25seSBlbmZvcmNlcyB0aGUgcGFnZSB0YWJs
ZQ0KICAgIHNob3VsZCBub3QgY29udGFpbiBtYXBwaW5nIHRoYXQgYXJlIGJvdGggV3JpdGFibGUg
YW5kIGVYZWN1dGFibGVzDQogICAgYWZ0ZXIgYm9vdC4gVG8gZWFzZSB0aGUgYXJjaC9hcm0vbW0u
YyBzcGxpdCB3b3JrLCBmb2xkIHRoaXMgZnVuY3Rpb24NCiAgICB0byBoZWFkLlMuDQoNCiAgICBG
b3IgYXJtMzIsIHRoZSBXWE4gYml0IGNhbm5vdCBiZSBzZXQgZWFybHkgYmVjYXVzZSBhdCB0aGUg
cG9pbnQgd2hlbg0KICAgIHRoZSBNTVUgaXMgZW5hYmxlZCwgdGhlIHBhZ2UtdGFibGVzIG1heSBz
dGlsbCBjb250YWluIG1hcHBpbmcgd2hpY2gNCiAgICBhcmUgd3JpdGFibGUgYW5kIGV4ZWN1dGFi
bGUuIFRoZXJlZm9yZSwgaW50cm9kdWNlIGFuIGFzc2VtYmx5IG1hY3JvDQogICAgcHRfZW5mb3Jj
ZV93eG4uIFRoZSBtYWNybyBpcyBjYWxsZWQgYmVmb3JlIHNlY29uZGFyeSBDUFVzIGp1bXBpbmcN
CiAgICBpbnRvIHRoZSBDIHdvcmxkLg0KDQogICAgRm9yIGFybTY0LCBzZXQgdGhlIFNDVExSX0F4
eF9FTHhfV1hOIGZsYWcgcmlnaHQgd2hlbiB0aGUgTU1VIGlzDQogICAgZW5hYmxlZC4gVGhpcyB3
b3VsZCBhdm9pZCB0aGUgZXh0cmEgVExCIGZsdXNoIGFuZCBTQ1RMUiBkYW5jZS4NCg0KICAgIFNp
Z25lZC1vZmYtYnk6IEhlbnJ5IFdhbmcgPEhlbnJ5LldhbmdAYXJtLmNvbT4NCiAgICBDby1hdXRo
b3JlZC1ieTogSnVsaWVuIEdyYWxsIDxqZ3JhbGxAYW1hem9uLmNvbT4NCiAgICBTaWduZWQtb2Zm
LWJ5OiBKdWxpZW4gR3JhbGwgPGpncmFsbEBhbWF6b24uY29tPg0KICAgIFNpZ25lZC1vZmYtYnk6
IEF5YW4gS3VtYXIgSGFsZGVyIDxheWFuLmt1bWFyLmhhbGRlckBhbWQuY29tPg0KICAgIC0tLQ0K
ICAgIHY5Og0KICAgIC0gTW92ZSBwdF9lbmZvcmNlX3d4bigpIGZvciBhcm0zMiB1cCBhIGZldyBs
aW5lcy4NCiAgICAtIEFkZCBjb21taXQgbWVzc2FnZSBleHBsYWluaW5nIHdoeSBXWE4gY2Fubm90
IGJlIHNldCBlYXJseSBmb3IgYXJtMzIuDQogICAgLSBDb3JyZWN0IGluLWNvZGUgY29tbWVudCBm
b3IgZW5hYmxlX21tdSgpLg0KICAgIHY4Og0KICAgIC0gQ2hhbmdlIHRoZSBzZXR0aW5nIG9mIFND
VExSX0F4eF9FTHhfV1hOIGZvciBhcm02NCB0byBzZXQgdGhlDQogICAgICBmbGFnIHJpZ2h0IHdo
ZW4gdGhlIE1NVSBpcyBlbmFibGVkLg0KICAgIHY3Og0KICAgIC0gTm8gY2hhbmdlLg0KICAgIHY2
Og0KICAgIC0gTmV3IHBhdGNoLg0KDQpkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2FybTMyL2hl
YWQuUyBiL3hlbi9hcmNoL2FybS9hcm0zMi9oZWFkLlMNCmluZGV4IDMzYjAzOGU3ZTAuLjJmZWEy
YTg3MmEgMTAwNjQ0DQotLS0gYS94ZW4vYXJjaC9hcm0vYXJtMzIvaGVhZC5TDQorKysgYi94ZW4v
YXJjaC9hcm0vYXJtMzIvaGVhZC5TDQpAQCAtODMsNiArODMsMjUgQEANCiAgICAgICAgIGlzYg0K
IC5lbmRtDQoNCisvKg0KKyAqIEVuZm9yY2UgWGVuIHBhZ2UtdGFibGVzIGRvIG5vdCBjb250YWlu
IG1hcHBpbmcgdGhhdCBhcmUgYm90aA0KKyAqIFdyaXRhYmxlIGFuZCBlWGVjdXRhYmxlcy4NCisg
Kg0KKyAqIFRoaXMgc2hvdWxkIGJlIGNhbGxlZCBvbiBlYWNoIHNlY29uZGFyeSBDUFUuDQorICov
DQorLm1hY3JvIHB0X2VuZm9yY2Vfd3huIHRtcA0KKyAgICAgICAgbXJjICAgQ1AzMihcdG1wLCBI
U0NUTFIpDQorICAgICAgICBvcnIgICBcdG1wLCBcdG1wLCAjU0NUTFJfQXh4X0VMeF9XWE4NCisg
ICAgICAgIGRzYg0KKyAgICAgICAgbWNyICAgQ1AzMihcdG1wLCBIU0NUTFIpDQorICAgICAgICAv
Kg0KKyAgICAgICAgICogVGhlIFRMQnMgbWF5IGNhY2hlIFNDVExSX0VMMi5XWE4uIFNvIGVuc3Vy
ZSBpdCBpcyBzeW5jaHJvbml6ZWQNCisgICAgICAgICAqIGJlZm9yZSBmbHVzaGluZyB0aGUgVExC
cy4NCisgICAgICAgICAqLw0KKyAgICAgICAgaXNiDQorICAgICAgICBmbHVzaF94ZW5fdGxiX2xv
Y2FsIFx0bXANCisuZW5kbQ0KKw0KIC8qDQogICogQ29tbW9uIHJlZ2lzdGVyIHVzYWdlIGluIHRo
aXMgZmlsZToNCiAgKiAgIHIwICAtDQpAQCAtMjQ5LDYgKzI2OCw3IEBAIHNlY29uZGFyeV9zd2l0
Y2hlZDoNCiAgICAgICAgIGRzYg0KICAgICAgICAgaXNiDQogICAgICAgICBmbHVzaF94ZW5fdGxi
X2xvY2FsIHIwDQorICAgICAgICBwdF9lbmZvcmNlX3d4biByMA0KDQogI2lmZGVmIENPTkZJR19F
QVJMWV9QUklOVEsNCiAgICAgICAgIC8qIFVzZSBhIHZpcnR1YWwgYWRkcmVzcyB0byBhY2Nlc3Mg
dGhlIFVBUlQuICovDQpkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2FybTY0L21tdS9oZWFkLlMg
Yi94ZW4vYXJjaC9hcm0vYXJtNjQvbW11L2hlYWQuUw0KaW5kZXggODgwNzVlZjA4My4uMzRkZTVk
ZjBjNyAxMDA2NDQNCi0tLSBhL3hlbi9hcmNoL2FybS9hcm02NC9tbXUvaGVhZC5TDQorKysgYi94
ZW4vYXJjaC9hcm0vYXJtNjQvbW11L2hlYWQuUw0KQEAgLTI2MywxMSArMjYzLDEzIEBAIEVORFBS
T0MoY3JlYXRlX3BhZ2VfdGFibGVzKQ0KICAqDQogICogSW5wdXRzOg0KICAqICAgeDAgOiBQaHlz
aWNhbCBhZGRyZXNzIG9mIHRoZSBwYWdlIHRhYmxlcy4NCisgKiAgIHgxIDogRXh0cmEgZmxhZ3Mg
b2YgdGhlIFNDVExSLg0KICAqDQotICogQ2xvYmJlcnMgeDAgLSB4NA0KKyAqIENsb2JiZXJzIHgw
IC0geDUNCiAgKi8NCiBlbmFibGVfbW11Og0KICAgICAgICAgbW92ICAgeDQsIHgwDQorICAgICAg
ICBtb3YgICB4NSwgeDENCiAgICAgICAgIFBSSU5UKCItIFR1cm5pbmcgb24gcGFnaW5nIC1cclxu
IikNCg0KICAgICAgICAgLyoNCkBAIC0yODMsNiArMjg1LDcgQEAgZW5hYmxlX21tdToNCiAgICAg
ICAgIG1ycyAgIHgwLCBTQ1RMUl9FTDINCiAgICAgICAgIG9yciAgIHgwLCB4MCwgI1NDVExSX0F4
eF9FTHhfTSAgLyogRW5hYmxlIE1NVSAqLw0KICAgICAgICAgb3JyICAgeDAsIHgwLCAjU0NUTFJf
QXh4X0VMeF9DICAvKiBFbmFibGUgRC1jYWNoZSAqLw0KKyAgICAgICAgb3JyICAgeDAsIHgwLCB4
NSAgICAgICAgICAgICAgICAvKiBFbmFibGUgZXh0cmEgZmxhZ3MgKi8NCiAgICAgICAgIGRzYiAg
IHN5ICAgICAgICAgICAgICAgICAgICAgLyogRmx1c2ggUFRFIHdyaXRlcyBhbmQgZmluaXNoIHJl
YWRzICovDQogICAgICAgICBtc3IgICBTQ1RMUl9FTDIsIHgwICAgICAgICAgIC8qIG5vdyBwYWdp
bmcgaXMgZW5hYmxlZCAqLw0KICAgICAgICAgaXNiICAgICAgICAgICAgICAgICAgICAgICAgICAv
KiBOb3csIGZsdXNoIHRoZSBpY2FjaGUgKi8NCkBAIC0yOTcsMTYgKzMwMCwxNyBAQCBFTkRQUk9D
KGVuYWJsZV9tbXUpDQogICogSW5wdXRzOg0KICAqICAgbHIgOiBWaXJ0dWFsIGFkZHJlc3MgdG8g
cmV0dXJuIHRvLg0KICAqDQotICogQ2xvYmJlcnMgeDAgLSB4NQ0KKyAqIENsb2JiZXJzIHgwIC0g
eDYNCiAgKi8NCiBFTlRSWShlbmFibGVfc2Vjb25kYXJ5X2NwdV9tbSkNCi0gICAgICAgIG1vdiAg
IHg1LCBscg0KKyAgICAgICAgbW92ICAgeDYsIGxyDQoNCiAgICAgICAgIGxvYWRfcGFkZHIgeDAs
IGluaXRfdHRicg0KICAgICAgICAgbGRyICAgeDAsIFt4MF0NCg0KKyAgICAgICAgbW92ICAgeDEs
ICNTQ1RMUl9BeHhfRUx4X1dYTiAgICAgICAgLyogRW5hYmxlIFd4TiBmcm9tIHRoZSBzdGFydCAq
Lw0KICAgICAgICAgYmwgICAgZW5hYmxlX21tdQ0KLSAgICAgICAgbW92ICAgbHIsIHg1DQorICAg
ICAgICBtb3YgICBsciwgeDYNCg0KICAgICAgICAgLyogUmV0dXJuIHRvIHRoZSB2aXJ0dWFsIGFk
ZHJlc3MgcmVxdWVzdGVkIGJ5IHRoZSBjYWxsZXIuICovDQogICAgICAgICByZXQNCkBAIC0zMjAs
MTQgKzMyNCwxNSBAQCBFTkRQUk9DKGVuYWJsZV9zZWNvbmRhcnlfY3B1X21tKQ0KICAqIElucHV0
czoNCiAgKiAgIGxyIDogVmlydHVhbCBhZGRyZXNzIHRvIHJldHVybiB0by4NCiAgKg0KLSAqIENs
b2JiZXJzIHgwIC0geDUNCisgKiBDbG9iYmVycyB4MCAtIHg2DQogICovDQogRU5UUlkoZW5hYmxl
X2Jvb3RfY3B1X21tKQ0KLSAgICAgICAgbW92ICAgeDUsIGxyDQorICAgICAgICBtb3YgICB4Niwg
bHINCg0KICAgICAgICAgYmwgICAgY3JlYXRlX3BhZ2VfdGFibGVzDQogICAgICAgICBsb2FkX3Bh
ZGRyIHgwLCBib290X3BndGFibGUNCg0KKyAgICAgICAgbW92ICAgeDEsICMwICAgICAgICAvKiBO
byBleHRyYSBTQ1RMUiBmbGFncyAqLw0KICAgICAgICAgYmwgICAgZW5hYmxlX21tdQ0KDQogICAg
ICAgICAvKg0KQEAgLTMzNyw3ICszNDIsNyBAQCBFTlRSWShlbmFibGVfYm9vdF9jcHVfbW0pDQog
ICAgICAgICBsZHIgICB4MCwgPTFmDQogICAgICAgICBiciAgICB4MA0KIDE6DQotICAgICAgICBt
b3YgICBsciwgeDUNCisgICAgICAgIG1vdiAgIGxyLCB4Ng0KICAgICAgICAgLyoNCiAgICAgICAg
ICAqIFRoZSAxOjEgbWFwIG1heSBjbGFzaCB3aXRoIG90aGVyIHBhcnRzIG9mIHRoZSBYZW4gdmly
dHVhbCBtZW1vcnkNCiAgICAgICAgICAqIGxheW91dC4gQXMgaXQgaXMgbm90IHVzZWQgYW55bW9y
ZSwgcmVtb3ZlIGl0IGNvbXBsZXRlbHkgdG8NCmRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vaW5j
bHVkZS9hc20vbW0uaCBiL3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9tbS5oDQppbmRleCBkMjVl
NTlmODI4Li4xNjNkMjJlY2QzIDEwMDY0NA0KLS0tIGEveGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNt
L21tLmgNCisrKyBiL3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9tbS5oDQpAQCAtMjE0LDggKzIx
NCw2IEBAIGV4dGVybiB2b2lkIHJlbW92ZV9lYXJseV9tYXBwaW5ncyh2b2lkKTsNCiAvKiBBbGxv
Y2F0ZSBhbmQgaW5pdGlhbGlzZSBwYWdldGFibGVzIGZvciBhIHNlY29uZGFyeSBDUFUuIFNldHMg
aW5pdF90dGJyIHRvIHRoZQ0KICAqIG5ldyBwYWdlIHRhYmxlICovDQogZXh0ZXJuIGludCBpbml0
X3NlY29uZGFyeV9wYWdldGFibGVzKGludCBjcHUpOw0KLS8qIFN3aXRjaCBzZWNvbmRhcnkgQ1BV
UyB0byBpdHMgb3duIHBhZ2V0YWJsZXMgYW5kIGZpbmFsaXNlIE1NVSBzZXR1cCAqLw0KLWV4dGVy
biB2b2lkIG1tdV9pbml0X3NlY29uZGFyeV9jcHUodm9pZCk7DQogLyoNCiAgKiBGb3IgQXJtMzIs
IHNldCB1cCB0aGUgZGlyZWN0LW1hcHBlZCB4ZW5oZWFwOiB1cCB0byAxR0Igb2YgY29udGlndW91
cywNCiAgKiBhbHdheXMtbWFwcGVkIG1lbW9yeS4gQmFzZSBtdXN0IGJlIDMyTUIgYWxpZ25lZCBh
bmQgc2l6ZSBhIG11bHRpcGxlIG9mIDMyTUIuDQpkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL21t
LmMgYi94ZW4vYXJjaC9hcm0vbW0uYw0KaW5kZXggYjdlYjNhNmUwOC4uOTIzYTkwOTI1YyAxMDA2
NDQNCi0tLSBhL3hlbi9hcmNoL2FybS9tbS5jDQorKysgYi94ZW4vYXJjaC9hcm0vbW0uYw0KQEAg
LTMyNiwxMiArMzI2LDYgQEAgdm9pZCBfX2luaXQgc2V0dXBfcGFnZXRhYmxlcyh1bnNpZ25lZCBs
b25nIGJvb3RfcGh5c19vZmZzZXQpDQogI2VuZGlmDQogfQ0KDQotLyogTU1VIHNldHVwIGZvciBz
ZWNvbmRhcnkgQ1BVUyAod2hpY2ggYWxyZWFkeSBoYXZlIHBhZ2luZyBlbmFibGVkKSAqLw0KLXZv
aWQgbW11X2luaXRfc2Vjb25kYXJ5X2NwdSh2b2lkKQ0KLXsNCi0gICAgeGVuX3B0X2VuZm9yY2Vf
d254KCk7DQotfQ0KLQ0KICNpZmRlZiBDT05GSUdfQVJNXzMyDQogLyoNCiAgKiBTZXQgdXAgdGhl
IGRpcmVjdC1tYXBwZWQgeGVuaGVhcDoNCmRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vc21wYm9v
dC5jIGIveGVuL2FyY2gvYXJtL3NtcGJvb3QuYw0KaW5kZXggZWM3NmRlM2NhYy4uYmViMTM3ZDA2
ZSAxMDA2NDQNCi0tLSBhL3hlbi9hcmNoL2FybS9zbXBib290LmMNCisrKyBiL3hlbi9hcmNoL2Fy
bS9zbXBib290LmMNCkBAIC0zNjEsOCArMzYxLDYgQEAgdm9pZCBzdGFydF9zZWNvbmRhcnkodm9p
ZCkNCiAgICAgICovDQogICAgIHVwZGF0ZV9zeXN0ZW1fZmVhdHVyZXMoJmN1cnJlbnRfY3B1X2Rh
dGEpOw0KDQotICAgIG1tdV9pbml0X3NlY29uZGFyeV9jcHUoKTsNCi0NCiAgICAgZ2ljX2luaXRf
c2Vjb25kYXJ5X2NwdSgpOw0KDQogICAgIHNldF9jdXJyZW50KGlkbGVfdmNwdVtjcHVpZF0pOw0K
DQpLaW5kIHJlZ2FyZHMsDQpIZW5yeQ0KDQoNCg0KDQo=

