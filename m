Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2171654F5B5
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jun 2022 12:43:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.351287.577887 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o29RU-00067n-9v; Fri, 17 Jun 2022 10:43:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 351287.577887; Fri, 17 Jun 2022 10:43:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o29RU-00064w-66; Fri, 17 Jun 2022 10:43:08 +0000
Received: by outflank-mailman (input) for mailman id 351287;
 Fri, 17 Jun 2022 10:43:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tGKg=WY=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1o29RS-00064p-05
 for xen-devel@lists.xenproject.org; Fri, 17 Jun 2022 10:43:06 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02on0603.outbound.protection.outlook.com
 [2a01:111:f400:fe06::603])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 439194fa-ee2a-11ec-b725-ed86ccbb4733;
 Fri, 17 Jun 2022 12:43:03 +0200 (CEST)
Received: from DB8P191CA0007.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:130::17)
 by DB6PR0802MB2181.eurprd08.prod.outlook.com (2603:10a6:4:82::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.14; Fri, 17 Jun
 2022 10:43:01 +0000
Received: from DBAEUR03FT036.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:130:cafe::4e) by DB8P191CA0007.outlook.office365.com
 (2603:10a6:10:130::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.16 via Frontend
 Transport; Fri, 17 Jun 2022 10:43:01 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT036.mail.protection.outlook.com (100.127.142.193) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5353.14 via Frontend Transport; Fri, 17 Jun 2022 10:43:00 +0000
Received: ("Tessian outbound 01afcf8ccfad:v120");
 Fri, 17 Jun 2022 10:43:00 +0000
Received: from 1d2a114aa5c2.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9C317B7D-6A40-49DB-A118-27F92C3EC71E.1; 
 Fri, 17 Jun 2022 10:42:50 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1d2a114aa5c2.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 17 Jun 2022 10:42:50 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by AM0PR08MB5121.eurprd08.prod.outlook.com (2603:10a6:208:159::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.14; Fri, 17 Jun
 2022 10:42:49 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::7da8:5168:ad86:7178]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::7da8:5168:ad86:7178%7]) with mapi id 15.20.5353.013; Fri, 17 Jun 2022
 10:42:49 +0000
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
X-Inumbo-ID: 439194fa-ee2a-11ec-b725-ed86ccbb4733
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=C9rtyUXibJ+uqfGKlk206yW197/fpbbH82k85dS3RohKy3fCI8u+h2m1v4fHhiVo7G88DGck+ptLoCGDuXJh4t8hweB4A2ynR6ShDpucl+7b3xT7U3xPKy5eJK5pIyjP2fDueO4paFKUKeYi5n5ymcVtPxANDGtVaX7rtXuAH+5kiXzJZpHM1s6yNt4/xvaDi2iHI0DDp4/1SZwP2et6SPwG5CksOE4E9dsTAp2Vnke/matfPCI/ViCMHSNM5ENzXo8LRsKw0lXJCvX+8uik1ufUI5HqSZ4pQMtU/RkmMz+mMDrcPNZrn03NvQALrbbX45utsZebsCQbHKdJmF1aUg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZhHnLb1DtHSLpn0nYAVsoJxBk+anSGpro/6G43XRzKU=;
 b=AKA/gItZiMGmTEHZ6qU6pg5Wkedpxd5D1nwt+a+suKL0bD7tEYSnaFpLp2kpKQEFDl9Qbe8QLCd8yzMWnvE6Nufy0bEVU3XAKS4NXdSAwv8mWMaAapvQLszy+fo3T0ERW2xv1r5fVBjoTNQpjTRZP9MZX8c+PjnZw4e5YKbCqAKOpk8GM3t9X3QNZgiyDBsba85vXxJGL7/0Gfb48BuVoH2iDo5u1r/VvkOunF9DrY1yM3vEP22wvIwzqlWbm6nvSX+qDv3pNn6OSXRUyKihuEWrN6PFk/28dSzR6Vs0X/vT+eLePqUs3obPAlZw726U0FjueCJxwGiWedeI0PKaFw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZhHnLb1DtHSLpn0nYAVsoJxBk+anSGpro/6G43XRzKU=;
 b=VgvUFMwLe9m4lcLdWlmrdhSFedIVDU+wnLhOtuZDXtkwesDpdhBC8QV6wzxxbo4bIay/e390rQZH8iUuuOiSxqI4ixCddY6u3fAK//9WbkCrf0SVhFwpVYWRc2ISJuD778aT7hN/+HAOwoQhOYyJE6JvUVgveYZBne4LYu0xFSQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WS2vsi4z1kQ9K5+XbuAwOWqXJHwrYiVbTIM2Nr9zk96cCNyI/Xl52NKeYLEmXi58iht02dw9mZ3m71NrAFx/Xcu2JBwdoutJ7GAI3xZAWPK9WQBnMQnrjolQHARCzSKAWfKCkX3/MfvZyXdkg3WQomcAOgfQyQAq1eEYhTQMYJ8X/Sixfr9t5XyVvIrp8Bw+3B33EQEgaqwSKUgYPEOul6+mV9bU9IH4JqXR08XexoMq4CK67iIWvSJKfyEzjuNxXKjARMsYxPMf4DG6a/UUt8zK2efHT+cwouXYHfMixhP6TdBkh1FNiAmAG+3j1Gz2dYV0anreW1GeVgYjB7lSqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZhHnLb1DtHSLpn0nYAVsoJxBk+anSGpro/6G43XRzKU=;
 b=LDGoFmYbUdXHwsopJFdqHHGfAaw/YstVODE3KIazK3YgajDfTDaCNXubOxU9Lus6PivctCFLakU8zTGuoV+QcNtSFyQ3SPmHPFRZgnSSusmvhVHz6japkHlmoHl6mVsou1jNO7SyUz4HEgY4mBMOrQ+QQc1Cj0KlhuMqzn5mwFcWyLAFflFXMl+sDUCL+5P1rbPKAdJFlTEy+Ey/jz5czleUm/3dSLNHwr9MBTy0kPsNMEgN6zhcCh/gcbgcipqyIMbJn+aV3uK1i2awSQl1gVGuSjzjIWGx6hN2s7ygJeVykeXHmrHufngTO7ltrPK2THk1W13iQlZub6pSgG1HmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZhHnLb1DtHSLpn0nYAVsoJxBk+anSGpro/6G43XRzKU=;
 b=VgvUFMwLe9m4lcLdWlmrdhSFedIVDU+wnLhOtuZDXtkwesDpdhBC8QV6wzxxbo4bIay/e390rQZH8iUuuOiSxqI4ixCddY6u3fAK//9WbkCrf0SVhFwpVYWRc2ISJuD778aT7hN/+HAOwoQhOYyJE6JvUVgveYZBne4LYu0xFSQ=
From: Wei Chen <Wei.Chen@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: nd <nd@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH] xen/arm: avoid vtimer flip-flop transition in context
 switch
Thread-Topic: [PATCH] xen/arm: avoid vtimer flip-flop transition in context
 switch
Thread-Index: AQHYgFjGGQRmuhVkyUGP4eiVYzlBr61QOR4AgAABKRCAAw50AIAAI+pg
Date: Fri, 17 Jun 2022 10:42:49 +0000
Message-ID:
 <PAXPR08MB74207970D8931FBCDF6A132E9EAF9@PAXPR08MB7420.eurprd08.prod.outlook.com>
References: <20220615013909.283887-1-wei.chen@arm.com>
 <c48bb719-8cc6-ea8d-291d-4e09d42f93c2@xen.org>
 <PAXPR08MB7420FDB50DA7265956A3B0BC9EAD9@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <6faaa38d-63af-d962-e8de-4accb5b73ab4@xen.org>
In-Reply-To: <6faaa38d-63af-d962-e8de-4accb5b73ab4@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 89E68991C931084D8B4048D60FCBADE8.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 9a6eb116-9ed5-4b87-afbf-08da504e2679
x-ms-traffictypediagnostic:
	AM0PR08MB5121:EE_|DBAEUR03FT036:EE_|DB6PR0802MB2181:EE_
X-Microsoft-Antispam-PRVS:
	<DB6PR0802MB21814B8753DC9B78C5BBB41D9EAF9@DB6PR0802MB2181.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 t+o6SCSucnx4z9Wop8LoqZ3wdTg4vyYFywelK8HVUEUbpjPW0ZT381g2g7Xzg6qgfn1QGMS9QC8jcuygNIIAmAxStD9lYiSTfhNGLBVHyGSJ+IGerdPdO+uyqwuv1j1k12zFNPnt4jwL4aGcwM7JmN//N+XUdSwULDCbgxdU8gbP3b7Snh54203RqZbpBmq/ckhX3nRrmH/GVrDPlOEEMDXDzOah3QI1/ial7YFYmKg5C8gtu4telFCxRKqm15ketY8cQUmIVP1FVJBEN636L4S5YIk2qzsh1MppiBdsxRVA/Az/ikF1CqJFVkEwJnP0QNcHrxcijt2vpqkkDDPMoPV2cf5URSZEvPHe5aD/dE60z3MHgWNro5dLtTBJFXFeggTVLQvRoV4e12H/GQcaMUfAXnm9C4IqGk1baC4qLJV99wfZkTdtrURe8oMh6cZLPHR7koykwByHWayeoYH4A5ps2LBthekQPNHTFkZE+lTh95mwqrVNmQtOBXKBRF0Gh2lNObAGmgsP+7zkI9XW4p9t7ky6GRqDtRxPdRI85iq3hZAIWO3XF61q7gE6zlR5WDnCRg4Pzv9sMfFSa4GDUr8R3AVGG0e/LPem6+HFF6sHx+UpAioVyjSc2txQGHbZSCExRFaEouDRZVdooO3aXX+ChSuYj8E0z38bqx4wLYQ7n0fEKS4jGhjbZxYC6AWTDordrmcqrfEPrl+YYR15Rg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(83380400001)(26005)(9686003)(66446008)(7696005)(53546011)(4326008)(52536014)(110136005)(8936002)(86362001)(33656002)(5660300002)(38070700005)(38100700002)(2906002)(6506007)(186003)(8676002)(71200400001)(64756008)(66556008)(54906003)(316002)(76116006)(66476007)(122000001)(66946007)(498600001)(55016003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5121
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	60858cbd-b31d-44a3-1897-08da504e1f81
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	f8NPcwYsbvxqmQYutpDY25xakF+rh9iopRWSpZd27rDOsO1nqg5PHnaNHuR4kdoWZyCyQaRklCj3CRqnATG0q8yy2EzA4sW5xdrKZeew/jOX42lthOvXpeF+uzkjHzIePlFY+OAgeziLMNQpe8FODpfM1/8ZHsWOPd0tYEwHdYTd5TdWgtUv+gDRjAzAJE/RhkHm/QNR+gBdQKWdS+1MH3w3ZAyQnYPhIs2N9Rv1mdUOgyuca+pB64MmVndk2LmJ14N8qWoz+MeAYn4MMAEmLOBLonWwM/nWkDl+9lWXtYW8NmxRXeCA4tJ1eT6JrBvY9qT47yXHZNyyGm2QxF/EzXzXvG+t/aa40Ua4hPO6grQc/Pqz58Pm/qH37f5jDU21OlMVnU0o0OrbvLzp0t8vzFmLhycQCYb0+MU6Izakxpce6VjZ1RZh06ry7iES0wuAeioAGuoT7sKTceQj8bBtIj5rZ2RdrTfncf4Lr7ou3wDs10kia4l1jHLYLkq+1Y8Pmy/NmjueQisPW/Y1K+iwIHa9MIAl/4DdMV8qx7tuwVxxN9VIo4GgGy46/99Vv3RpPZkmMm3n4qQ5aKhhLD98hJgotX8ZPrYopLq9HmLoAFPyXh5xuAimwSTXDIBjUpXerfwDImAB20f+1lGlOKoEwlcpgxfCIWj/kF3PeC7Rx22svPij38BXXNCf+PqcOx2Z
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(36840700001)(46966006)(40470700004)(186003)(8936002)(5660300002)(8676002)(33656002)(6506007)(316002)(508600001)(26005)(9686003)(53546011)(83380400001)(107886003)(54906003)(81166007)(2906002)(7696005)(336012)(86362001)(47076005)(36860700001)(55016003)(52536014)(70586007)(40460700003)(82310400005)(70206006)(4326008)(356005)(110136005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2022 10:43:00.9370
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a6eb116-9ed5-4b87-afbf-08da504e2679
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2181

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IFNlbnQ6IDIwMjLlubQ25pyIMTfml6UgMTY6MzIN
Cj4gVG86IFdlaSBDaGVuIDxXZWkuQ2hlbkBhcm0uY29tPjsgeGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnDQo+IENjOiBuZCA8bmRAYXJtLmNvbT47IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0
YWJlbGxpbmlAa2VybmVsLm9yZz47IEJlcnRyYW5kDQo+IE1hcnF1aXMgPEJlcnRyYW5kLk1hcnF1
aXNAYXJtLmNvbT47IFZvbG9keW15ciBCYWJjaHVrDQo+IDxWb2xvZHlteXJfQmFiY2h1a0BlcGFt
LmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSF0geGVuL2FybTogYXZvaWQgdnRpbWVyIGZsaXAt
ZmxvcCB0cmFuc2l0aW9uIGluIGNvbnRleHQNCj4gc3dpdGNoDQo+IA0KPiANCj4gDQo+IE9uIDE1
LzA2LzIwMjIgMTE6MzYsIFdlaSBDaGVuIHdyb3RlOg0KPiA+IEhpIEp1bGllbiwNCj4gDQo+IEhp
IFdlaSwNCj4gDQo+ID4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+IEZyb206IEp1
bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+ID4+IFNlbnQ6IDIwMjLlubQ25pyIMTXml6Ug
MTc6NDcNCj4gPj4gVG86IFdlaSBDaGVuIDxXZWkuQ2hlbkBhcm0uY29tPjsgeGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnDQo+ID4+IENjOiBuZCA8bmRAYXJtLmNvbT47IFN0ZWZhbm8gU3Rh
YmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47DQo+IEJlcnRyYW5kDQo+ID4+IE1hcnF1
aXMgPEJlcnRyYW5kLk1hcnF1aXNAYXJtLmNvbT47IFZvbG9keW15ciBCYWJjaHVrDQo+ID4+IDxW
b2xvZHlteXJfQmFiY2h1a0BlcGFtLmNvbT4NCj4gPj4gU3ViamVjdDogUmU6IFtQQVRDSF0geGVu
L2FybTogYXZvaWQgdnRpbWVyIGZsaXAtZmxvcCB0cmFuc2l0aW9uIGluDQo+IGNvbnRleHQNCj4g
Pj4gc3dpdGNoDQo+ID4+Pg0KPiA+Pj4gU28gaW4gdGhpcyBwYXRjaCwgd2UgYWRqdXN0IHRoZSBm
b3JtdWxhIHRvIHVzZSAib2Zmc2V0IC0gYm9vdF9jb3VudCINCj4gPj4+IGZpcnN0LCBhbmQgdGhl
biB1c2UgdGhlIHJlc3VsdCB0byBwbHVzIGN2YWwuIFRoaXMgd2lsbCBhdm9pZCB0aGUNCj4gPj4+
IHVpbnQ2NF90IG92ZXJmbG93Lg0KPiA+Pg0KPiA+PiBUZWNobmljYWxseSwgdGhlIG92ZXJmbG93
IGlzIHN0aWxsIHByZXNlbnQgYmVjYXVzZSB0aGUgKG9mZnNldCAtDQo+ID4+IGJvb3RfY291bnQp
IGlzIGEgbm9uLXplcm8gdmFsdWUgKmFuZCogY3ZhbCBpcyBhIDY0LWJpdCB2YWx1ZS4NCj4gPj4N
Cj4gPg0KPiA+IFllcywgR3Vlc3RPUyBjYW4gaXNzdWUgYW55IHZhbGlkIDY0LWJpdCB2YWx1ZSBm
b3IgdGhlaXIgdXNhZ2UuDQo+ID4NCj4gPj4gU28gSSB0aGluayB0aGUgZXF1YXRpb24gYmVsb3cg
c2hvdWxkIGJlIHJld29ya2VkIHRvLi4uDQo+ID4+DQo+ID4+Pg0KPiA+Pj4gU2lnbmVkLW9mZi1i
eTogV2VpIENoZW4gPHdlaS5jaGVuQGFybS5jb20+DQo+ID4+PiAtLS0NCj4gPj4+ICAgIHhlbi9h
cmNoL2FybS92dGltZXIuYyB8IDUgKysrLS0NCj4gPj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCAzIGlu
c2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+ID4+Pg0KPiA+Pj4gZGlmZiAtLWdpdCBhL3hl
bi9hcmNoL2FybS92dGltZXIuYyBiL3hlbi9hcmNoL2FybS92dGltZXIuYw0KPiA+Pj4gaW5kZXgg
NWJiNTk3MGY1OC4uODZlNjMzMDNjOCAxMDA2NDQNCj4gPj4+IC0tLSBhL3hlbi9hcmNoL2FybS92
dGltZXIuYw0KPiA+Pj4gKysrIGIveGVuL2FyY2gvYXJtL3Z0aW1lci5jDQo+ID4+PiBAQCAtMTQ0
LDggKzE0NCw5IEBAIHZvaWQgdmlydF90aW1lcl9zYXZlKHN0cnVjdCB2Y3B1ICp2KQ0KPiA+Pj4g
ICAgICAgIGlmICggKHYtPmFyY2gudmlydF90aW1lci5jdGwgJiBDTlR4X0NUTF9FTkFCTEUpICYm
DQo+ID4+PiAgICAgICAgICAgICAhKHYtPmFyY2gudmlydF90aW1lci5jdGwgJiBDTlR4X0NUTF9N
QVNLKSkNCj4gPj4+ICAgICAgICB7DQo+ID4+PiAtICAgICAgICBzZXRfdGltZXIoJnYtPmFyY2gu
dmlydF90aW1lci50aW1lciwgdGlja3NfdG9fbnModi0NCj4gPj4+IGFyY2gudmlydF90aW1lci5j
dmFsICsNCj4gPj4+IC0gICAgICAgICAgICAgICAgICB2LT5kb21haW4tPmFyY2gudmlydF90aW1l
cl9iYXNlLm9mZnNldCAtDQo+IGJvb3RfY291bnQpKTsNCj4gPj4+ICsgICAgICAgIHNldF90aW1l
cigmdi0+YXJjaC52aXJ0X3RpbWVyLnRpbWVyLA0KPiA+Pj4gKyAgICAgICAgICAgICAgICAgIHRp
Y2tzX3RvX25zKHYtPmRvbWFpbi0+YXJjaC52aXJ0X3RpbWVyX2Jhc2Uub2Zmc2V0DQo+IC0NCj4g
Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBib290X2NvdW50ICsgdi0+YXJjaC52
aXJ0X3RpbWVyLmN2YWwpKTsNCj4gPj4NCj4gPj4gLi4uIHNvbWV0aGluZyBsaWtlOg0KPiA+Pg0K
PiA+PiB0aWNrc190b19ucyhvZmZzZXQgLSBib290X2NvdW50KSArIHRpY2tzX3RvX25zKGN2YWwp
Ow0KPiA+Pg0KPiA+PiBUaGUgZmlyc3QgcGFydCBvZiB0aGUgZXF1YXRpb24gc2hvdWxkIGFsd2F5
cyBiZSB0aGUgc2FtZS4gU28gaXQgY291bGQNCj4gYmUNCj4gPj4gc3RvcmVkIGluIHN0cnVjdCBk
b21haW4uDQo+ID4+DQo+ID4NCj4gPiBJZiB5b3UgdGhpbmsgdGhlcmUgaXMgc3RpbGwgc29tZSB2
YWx1ZXMgdG8gY29udGludWUgdGhpcyBwYXRjaCwgSSB3aWxsDQo+ID4gYWRkcmVzcyB0aGlzIGNv
bW1lbnQgOiApDQo+IA0KPiBJIHRoaW5rIHRoZXJlIGFyZS4gVGhpcyBjYW4gYmUgZWFzaWx5IHRy
aWdnZXJlZCBieSBhIHZDUFUgc2V0dGluZyBhDQo+IGxhcmdlIGN2YWwuDQo+IA0KDQpPaywgdGhh
bmtzISBXZSB3aWxsIGFkZHJlc3MgaXQgYW5kIHJlZmluZSB0aGUgc3ViamVjdCBhbmQgZGVzY3Jp
cHRpb25zLg0KDQo+IENoZWVycywNCj4gDQo+IC0tDQo+IEp1bGllbiBHcmFsbA0K

