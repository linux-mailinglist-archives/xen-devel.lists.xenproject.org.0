Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3FF05A057C
	for <lists+xen-devel@lfdr.de>; Thu, 25 Aug 2022 03:05:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.392989.631667 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oR1Iy-0008UY-F6; Thu, 25 Aug 2022 01:05:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 392989.631667; Thu, 25 Aug 2022 01:05:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oR1Iy-0008Rn-CD; Thu, 25 Aug 2022 01:05:08 +0000
Received: by outflank-mailman (input) for mailman id 392989;
 Thu, 25 Aug 2022 01:05:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CXX7=Y5=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oR1Iw-0008Rh-8M
 for xen-devel@lists.xenproject.org; Thu, 25 Aug 2022 01:05:06 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140077.outbound.protection.outlook.com [40.107.14.77])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f2ae8d82-2411-11ed-bd2e-47488cf2e6aa;
 Thu, 25 Aug 2022 03:05:03 +0200 (CEST)
Received: from DB6PR07CA0049.eurprd07.prod.outlook.com (2603:10a6:6:2a::11) by
 AS4PR08MB8117.eurprd08.prod.outlook.com (2603:10a6:20b:589::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Thu, 25 Aug
 2022 01:04:50 +0000
Received: from DBAEUR03FT059.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:2a:cafe::3d) by DB6PR07CA0049.outlook.office365.com
 (2603:10a6:6:2a::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.3 via Frontend
 Transport; Thu, 25 Aug 2022 01:04:49 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT059.mail.protection.outlook.com (100.127.142.102) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5566.15 via Frontend Transport; Thu, 25 Aug 2022 01:04:49 +0000
Received: ("Tessian outbound cc6a8ab50b6b:v123");
 Thu, 25 Aug 2022 01:04:49 +0000
Received: from 515c51ad4efe.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 57175A83-283A-4585-A4EF-4989D9E6B8C1.1; 
 Thu, 25 Aug 2022 01:04:43 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 515c51ad4efe.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 25 Aug 2022 01:04:43 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AM5PR0801MB1618.eurprd08.prod.outlook.com (2603:10a6:203:37::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Thu, 25 Aug
 2022 01:04:41 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::9c75:2d29:bb6a:663f]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::9c75:2d29:bb6a:663f%4]) with mapi id 15.20.5566.015; Thu, 25 Aug 2022
 01:04:40 +0000
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
X-Inumbo-ID: f2ae8d82-2411-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=KimXK6ZVQLXrGXRSHuub1Ra/x9NV5QOvz7PQ4PLMZE56K0kztvXLH+HmXPgoQO2Rq9YvDhh40NsNACrCen4afijX1iOHftZeTaD4v6L4XYnAPgGy7JJ18MZiwkSY2h3dMneVfZjSLld7tIveIFYey1Fz6IhhboQ+wmuLblBd0G8Ws1FdeUidF0KldokADBcwaMLkevCJVpc9xL3wCtTleXmA/JVZlzjlEc6gp379D6p2/hGh3I+M8YjQ+/PZYnFFni39t3yY7CNOS5lyRREwI+7DERxC2J2TV3z9MNfq3LuTdSb0hPcYPzDDsEaCYkEklb2eYI1LdgfzRu3P9ShIpg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5uxMi8NdCFS6azrqEu/MbtKTnWjYBCx3Q2X5WXhIB9k=;
 b=MoyA5G1Kk8+NhyYI567/3eUX15UaSof0WuGqPV0eXCxuJNy8Is7SAyqkrxKKQVFGAlGgw0Jlto63lanAEtqjo7OGp0JPLlGdBjRLgBlE3nv8/nEsq8DnFOD0r2uidZsKfPLvgMHze42BdA4hWoRJKRxiUhFC4KdBdCpLhQqvVNRtBSFCMCRPiNkcYGuxLVtORCgbNwzjLO804aZF5FVrZRDXtsqn56asMN1NRfgtR2QkUTuvwNLiScwqhBZGXsXlt/KZIks2prBTg05pyYXXZXmPrpCI8w82A1eV1yZen48VQJXWejFnZSG3aD6ek8VHdROp0hUZlqqSgasHGZqiig==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5uxMi8NdCFS6azrqEu/MbtKTnWjYBCx3Q2X5WXhIB9k=;
 b=j6+YMJA362ppaEzZfWJ8Rvy1YNiitsMnPtfXBYiPX/5yktP6GcVkJboplj2oSbwMLTt7fx2Fj2HGeD8N8gRCZO9kDYW2FB+DJEWWX5NvsqJgeUQg6GQkHCZZAWTynmdVUdqnuS2YfrE0tgi39i57Q4DxPHWOv2dZa+iR5F2GRU4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l1f9HXdySdkYxmQLRlPLnXyWG3yy3W1cWAXU16maoID5x/6qzHZNgFQnnWDI0v00hrm2HnWccFgIexLG4esJZn8msHRpG631UpuweLLdAjwCxkkM/z4GbzzENtC1ayefT5R20p8WtMQ5HyZgw/aPOnm1toGK2rYMJmXKwbHP2f3Z3prZrG0w3q8F9ykGCNKs56MCngHTWuFhbkLsRGEZiL/v2hLsN7mzXWR/Pf/Mr6hV3u7BDLTXMe7lJyxlyljCQPk3s7/mdPBF9nY89cJT8rYtbTXFjDt2n8gdueTp9+t3PXAqQXzDTi0O0a1nqNtMGmx42+AaNY9qDDx44Eru2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5uxMi8NdCFS6azrqEu/MbtKTnWjYBCx3Q2X5WXhIB9k=;
 b=b25IcSQl1QaA2RzwJXg1R9NMYEZ/adpqBq8796A4Ml2zFGDKx79i9Opq6DNODc/oKVVL59dMtz0LzTQZznOh/EbR2Zty+JQ21g+1AGMh3JaHgR+zkxZyYx4tbeo6KXsUWKrmRuNmrsav0XffH6aDcogheX/c0tVhLxHkxPD2QcHFGb85TyAPuB6KERsz4bldI8jzIkrt5D/8z8EqmX1EVfNTXcKWQ8xAUyov2UfBoFl30VumrzAm2nHXHjmc8bmuT0p6ucsUsZHDVSerxfFcBKL+0qeUmCjq1HykmNn3r9B+8AjzbQ4OtY7C+vERQsWKs2tLotyYu/hj4DcsuGMN3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5uxMi8NdCFS6azrqEu/MbtKTnWjYBCx3Q2X5WXhIB9k=;
 b=j6+YMJA362ppaEzZfWJ8Rvy1YNiitsMnPtfXBYiPX/5yktP6GcVkJboplj2oSbwMLTt7fx2Fj2HGeD8N8gRCZO9kDYW2FB+DJEWWX5NvsqJgeUQg6GQkHCZZAWTynmdVUdqnuS2YfrE0tgi39i57Q4DxPHWOv2dZa+iR5F2GRU4=
From: Henry Wang <Henry.Wang@arm.com>
To: Michal Orzel <michal.orzel@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen
	<Wei.Chen@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Penny
 Zheng <Penny.Zheng@arm.com>
Subject: RE: [PATCH 1/2] docs, xen/arm: Introduce reserved heap memory
Thread-Topic: [PATCH 1/2] docs, xen/arm: Introduce reserved heap memory
Thread-Index: AQHYt4ueuuTQX+2f5E69518db+C55q2+ENkAgAC6AOA=
Date: Thu, 25 Aug 2022 01:04:38 +0000
Message-ID:
 <AS8PR08MB7991A2A6EF808136FBF090F392729@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20220824073127.16762-1-Henry.Wang@arm.com>
 <20220824073127.16762-2-Henry.Wang@arm.com>
 <af2f8888-7223-429e-cc7e-b0950f759608@amd.com>
In-Reply-To: <af2f8888-7223-429e-cc7e-b0950f759608@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: B3889E599FA8374890B8DAA01DF24BA1.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 49d22368-2abb-4cd9-95ce-08da8635cf35
x-ms-traffictypediagnostic:
	AM5PR0801MB1618:EE_|DBAEUR03FT059:EE_|AS4PR08MB8117:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 A2FSpuvwvs4ZaCw3/KyMcsujd1xczBjPpCxXZj2L2k8/b5Fr6oFyCDufsncpqJT9sfbcCV9+4uUBYKwvIoDBb6d/Ky8du2x9fWcoheWLG/JACmzXUomPYXUJJyYw4BcdCgEqsW/ruuzxPuz3jhkwu1lh61NUO0uGiZClSHuJiJVf+kogfHFZ+j4YTYE4v2xgNOl7O81eDlP+KOqRCkU69OkqxIZEQMjqcACYIw6GnYugjVMRChog2dm/3LzLdSI9IOeB44+c9c6Z8cyTia470NAjoAtb2HT8zItdPF8BAGisHr+aWFyN7kEXx2xLlciAVJjYDtYWt4wf0OQ4wEj2z01TjG82WkFYmsxQsxK7bOuAr/9bb+gB+ENoqFJFp/LDdMPAPAwHLrXBeJSTu7gcqIgUTW5UlpUjwgtatCXaHn7vBuSjvYH+a9flBhV8dyPUNJ7PPdKI09F1bvUc+gOpeWD4cu5gNPFUW4L1hJdR67aDQljn4dbebMX48w9N1gw7g7dRVNJQhZvf3BFCfbRu93Iea7ZTt3rMCxPf/G4yFN18WiRMYpZn/fwbHeZ9Ncvwv5CUcoI0xjMv7/s5tVVS7ayP10gMmwKB2DpNwV6QaYp+tCArPwvSPWMGoGk3GhuU3rH4I1qwQKU7V6Vsd/8lM8ZGkWDxNbbXfYzZ4ho0iNqZxHk32xzlEXPzslRs1E8Fw7hswTfT/GIMJ7+IJ9slg8l5Q5jYCy71mWSHOPu3eX7z5AsaapaQbtE4zMuZS9Ck9sbUGMg0VeUq8YHjLMWY0w==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(39860400002)(376002)(136003)(366004)(396003)(83380400001)(38070700005)(186003)(54906003)(4326008)(8676002)(66476007)(71200400001)(66446008)(66556008)(64756008)(110136005)(76116006)(316002)(66946007)(26005)(7696005)(6506007)(41300700001)(33656002)(9686003)(8936002)(52536014)(478600001)(5660300002)(55016003)(38100700002)(122000001)(86362001)(2906002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1618
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	29925d53-47a8-4a2d-16a7-08da8635c8cf
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	szV8db7NY3RfQQIXXdX4CYYQAlgCbStgvWBoByUSrvpYbEgo0NwIXQBX+mEmhKFc5DNxrmTtu3eJZIWfI/77UwBWCVUDcKoFI7Y3GHAkUctYGh8pna98seD8zLJiFilFr+AYN8gxUjTroh68YrnmSzsrlMwwsproROEo1N8C7AK85YCf300VxL/brdtjOgloOY84+zckGJYKfKQXLB0ql3BTEais2jbzCMbk7Bid9hG9nfGWuFcICIHYnIosIKZJABk1erC2w1Qszq7xTaYoszCMenUr7GQaYthQiinDReDYP8f2xg/qeg4VUDJoPsczkRmz3NMAR36Tk2j4ctJlukpdjW9LFaOP4cMX0aNCqDi9AU+mpk9scWzBqSzZtLQPWTQvU/vP72GGqq5zVPZcUEVmlkhv9Cu9F4JQ5dJR9bBSTBciSlL0T/5Bq7AAiIhiVpmJD43Yuq25x3Hqtt1C6WWfKqsvZJfKcrIaMeRlXlTRJ0R3KybZdt5NKdBfupNja1di6vQ4Dpr7b3u3pZ6pnpLohWlWENZ8BopQ6KUNNPfPNzFbrWZfslZWkAmUKruDJujVhcONOQVfxfVdlmdHKBXGAi+iqeh3xF+FOSSCc3Z6RO406Iig89rn9KWp7psIDmhDY+x+rDn4Rq9zZdRdBsDtuYXi9xQvCjEVY7OmU+Z8+K+bemcAejkwaV4fq7goSL+2KkyKyGUNBtvkcPnPUtsyEGPJ4LAH4Ju3t1mttiHUvmFP7zrb5QgPCyLRMaGgMnTy3lGE4+gKBDDDNJQuPQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(136003)(396003)(376002)(346002)(46966006)(36840700001)(40470700004)(86362001)(54906003)(82310400005)(316002)(110136005)(336012)(41300700001)(4326008)(70586007)(55016003)(70206006)(40480700001)(9686003)(356005)(6506007)(7696005)(26005)(8676002)(83380400001)(186003)(5660300002)(8936002)(81166007)(47076005)(478600001)(40460700003)(82740400003)(2906002)(33656002)(52536014)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2022 01:04:49.3974
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 49d22368-2abb-4cd9-95ce-08da8635cf35
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB8117

SGkgTWljaGFsLA0KDQpJdCBpcyBncmVhdCB0byBoZWFyIGZyb20geW91ISBIb3BlIHlvdSBhcmUg
ZG9pbmcgd2VsbC4NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBNaWNo
YWwgT3J6ZWwgPG1pY2hhbC5vcnplbEBhbWQuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDEv
Ml0gZG9jcywgeGVuL2FybTogSW50cm9kdWNlIHJlc2VydmVkIGhlYXAgbWVtb3J5DQo+IEhpIEhl
bnJ5LA0KPiA+ICt0byBwYXJ0cyBvZiBSQU0gcmVzZXJ2ZWQgaW4gdGhlIGJlZ2lubmluZyBmb3Ig
aGVhcC4gVGhlIG1lbW9yeSBpcw0KPiByZXNlcnZlZCBieQ0KPiBJIHRoaW5rIHdlIGFyZSBtaXNz
aW5nICIuLi4gaW4gdGhlIGJlZ2lubmluZyIgb2Ygd2hhdC4NCg0KQ29ycmVjdCwgSSB3aWxsIGNo
YW5nZSBpdCB0byAiLi4uIGluIHRoZSBiZWdpbm5pbmcgb2YgYm9vdCB0aW1lIi4NCg0KPiANCj4g
PiArY29uZmlndXJhdGlvbiBpbiB0aGUgZGV2aWNlIHRyZWUgdXNpbmcgcGh5c2ljYWwgYWRkcmVz
cyByYW5nZXMuDQo+ID4gKw0KPiA+ICtUaGUgcmVzZXJ2ZWQgaGVhcCBtZW1vcnkgZGVjbGFyZWQg
aW4gdGhlIGRldmljZSB0cmVlIGRlZmluZXMgdGhlDQo+IG1lbW9yeSBhcmVhcw0KPiA+ICt0aGF0
IHdpbGwgYmUgcmVzZXJ2ZWQgdG8gYmUgdXNlZCBleGNsdXNpdmVseSBhcyBoZWFwLg0KPiA+ICsN
Cj4gPiArLSBGb3IgQXJtMzIsIHNpbmNlIHRoZXJlIGNhbiBiZSBzZXBlcmF0ZWQgaGVhcHMsIHRo
ZSByZXNlcnZlZCBoZWFwIHdpbGwNCj4gYmUgdXNlZA0KPiBNYXliZSAidGhlcmUgYXJlIiBpbnN0
ZWFkIG9mICJ0aGVyZSBjYW4gYmUiIGFzIHdlIGRvIGRlZmluZSBmb3IgQXJtMzI6DQo+ICNkZWZp
bmUgQ09ORklHX1NFUEFSQVRFX1hFTkhFQVAgMQ0KPiBhbmQgSSBkbyBub3QgdGhpbmsgd2UgaGF2
ZSBzb21lIGZsZXhpYmlsaXR5IHRvIGNoYW5nZSB0aGlzLg0KDQpBY2suDQoNCj4gDQo+ID4gK2Zv
ciBib3RoIGRvbWhlYXAgYW5kIHhlbmhlYXAuDQo+ID4gKy0gRm9yIEFybTY0LCBzaW5jZSBkb21o
ZWFwIGFuZCB4ZW5oZWFwIGFyZSB0aGUgc2FtZSwgdGhlIGRlZmluZWQNCj4gcmVzZXJ2ZWQgaGVh
cA0KPiBJbnN0ZWFkIG9mIHdyaXRpbmcgInNpbmNlIGRvbWhlYXAgYW5kIHhlbmhlYXAgYXJlIHRo
ZSBzYW1lIiBtYXliZSBpdCdkIGJlDQo+IGJldHRlciB0byB3cml0ZToNCj4gIkZvciBBcm02NCwg
YXMgdGhlcmUgaXMgYSBzaW5nbGUgaGVhcC4uLiINCg0KWWVwLCB3aWxsIGNoYW5nZSBpbiB2Mi4N
Cg0KPiANCj4gPiArYXJlYXMgc2hhbGwgYWx3YXlzIGdvIHRvIHRoZSBoZWFwIGFsbG9jYXRvci4N
Cj4gPiArDQo+ID4gK1RoZSByZXNlcnZlZCBoZWFwIG1lbW9yeSBpcyBhbiBvcHRpb25hbCBmZWF0
dXJlIGFuZCBjYW4gYmUgZW5hYmxlZCBieQ0KPiBhZGRpbmcgYQ0KPiA+ICtkZXZpY2UgdHJlZSBw
cm9wZXJ0eSBpbiB0aGUgYGNob3NlbmAgbm9kZS4gQ3VycmVudGx5LCB0aGlzIGZlYXR1cmUgcmV1
c2VzDQo+IHRoZQ0KPiA+ICtzdGF0aWMgbWVtb3J5IGFsbG9jYXRpb24gZGV2aWNlIHRyZWUgY29u
ZmlndXJhdGlvbi4NCj4gPiArDQo+ID4gK1RoZSBkdGIgcHJvcGVydHkgc2hvdWxkIGxvb2sgbGlr
ZSBhcyBmb2xsb3dzOg0KPiA+ICsNCj4gPiArLSBwcm9wZXJ0eSBuYW1lDQo+ID4gKw0KPiA+ICsg
ICAgInhlbixzdGF0aWMtbWVtIiAoU2hvdWxkIGJlIHVzZWQgaW4gdGhlIGBjaG9zZW5gIG5vZGUp
DQo+ID4gKw0KPiA+ICstIGNlbGxzDQo+ID4gKw0KPiA+ICsgICAgU3BlY2lmeSB0aGUgc3RhcnQg
YWRkcmVzcyBhbmQgdGhlIGxlbmd0aCBvZiB0aGUgcmVzZXJ2ZWQgaGVhcCBtZW1vcnkuDQo+ID4g
KyAgICBUaGUgbnVtYmVyIG9mIGNlbGxzIGZvciB0aGUgYWRkcmVzcyBhbmQgdGhlIHNpemUgc2hv
dWxkIGJlIGRlZmluZWQNCj4gPiArICAgIHVzaW5nIHRoZSBwcm9wZXJ0aWVzIGAjeGVuLHN0YXRp
Yy1tZW0tYWRkcmVzcy1jZWxsc2AgYW5kDQo+ID4gKyAgICBgI3hlbixzdGF0aWMtbWVtLXNpemUt
Y2VsbHNgIHJlc3BlY3RpdmVseS4NCj4gPiArDQo+ID4gK0JlbG93IGlzIGFuIGV4YW1wbGUgb24g
aG93IHRvIHNwZWNpZnkgdGhlIHJlc2VydmVkIGhlYXAgaW4gZGV2aWNlIHRyZWU6DQo+ID4gKw0K
PiA+ICsgICAgLyB7DQo+ID4gKyAgICAgICAgY2hvc2VuIHsNCj4gPiArICAgICAgICAgICAgI3hl
bixzdGF0aWMtbWVtLWFkZHJlc3MtY2VsbHMgPSA8MHgyPjsNCj4gPiArICAgICAgICAgICAgI3hl
bixzdGF0aWMtbWVtLXNpemUtY2VsbHMgPSA8MHgyPjsNCj4gPiArICAgICAgICAgICAgeGVuLHN0
YXRpYy1tZW0gPSA8MHgwIDB4MzAwMDAwMDAgMHgwIDB4NDAwMDAwMDA+Ow0KPiBQbGVhc2UgYWRk
ICIuLi4iIGhlcmUgYXMgdGhpcyBkb2VzIG5vdCByZXByZXNlbnQgdGhlIGNvbXBsZXRlIHdvcmtp
bmcgY2hvc2VuDQo+IG5vZGUuDQoNClN1cmUsIHdpbGwgYWRkIGluIHYyLg0KDQo+IA0KPiA+ICsg
ICAgICAgIH07DQo+ID4gKyAgICB9Ow0KPiA+ICsNCj4gPiArUkFNIGF0IDB4MzAwMDAwMDAgb2Yg
MUcgc2l6ZSB3aWxsIGJlIHJlc2VydmVkIGFzIGhlYXAuDQo+ID4gKw0KPiA+IGRpZmYgLS1naXQg
YS94ZW4vYXJjaC9hcm0vYm9vdGZkdC5jIGIveGVuL2FyY2gvYXJtL2Jvb3RmZHQuYw0KPiA+IGlu
ZGV4IGVjODFhNDVkZTkuLjMzNzA0Y2E0ODcgMTAwNjQ0DQo+ID4gLS0tIGEveGVuL2FyY2gvYXJt
L2Jvb3RmZHQuYw0KPiA+ICsrKyBiL3hlbi9hcmNoL2FybS9ib290ZmR0LmMNCj4gPiBAQCAtNjQs
NyArNjQsOCBAQCB2b2lkIF9faW5pdCBkZXZpY2VfdHJlZV9nZXRfcmVnKGNvbnN0IF9fYmUzMiAq
KmNlbGwsDQo+IHUzMiBhZGRyZXNzX2NlbGxzLA0KPiA+ICBzdGF0aWMgaW50IF9faW5pdCBkZXZp
Y2VfdHJlZV9nZXRfbWVtaW5mbyhjb25zdCB2b2lkICpmZHQsIGludCBub2RlLA0KPiA+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBjaGFyICpwcm9wX25h
bWUsDQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHUzMiBh
ZGRyZXNzX2NlbGxzLCB1MzIgc2l6ZV9jZWxscywNCj4gPiAtICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgdm9pZCAqZGF0YSwgYm9vbCB4ZW5fZG9tYWluKQ0KPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB2b2lkICpkYXRhLCBib29s
IHhlbl9kb21haW4sDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGJvb2wgeGVuX2hlYXApDQo+ID4gIHsNCj4gPiAgICAgIGNvbnN0IHN0cnVjdCBmZHRfcHJv
cGVydHkgKnByb3A7DQo+ID4gICAgICB1bnNpZ25lZCBpbnQgaSwgYmFua3M7DQo+ID4gQEAgLTk2
LDYgKzk3LDcgQEAgc3RhdGljIGludCBfX2luaXQgZGV2aWNlX3RyZWVfZ2V0X21lbWluZm8oY29u
c3Qgdm9pZA0KPiAqZmR0LCBpbnQgbm9kZSwNCj4gPiAgICAgICAgICBtZW0tPmJhbmtbbWVtLT5u
cl9iYW5rc10uc3RhcnQgPSBzdGFydDsNCj4gPiAgICAgICAgICBtZW0tPmJhbmtbbWVtLT5ucl9i
YW5rc10uc2l6ZSA9IHNpemU7DQo+ID4gICAgICAgICAgbWVtLT5iYW5rW21lbS0+bnJfYmFua3Nd
Lnhlbl9kb21haW4gPSB4ZW5fZG9tYWluOw0KPiA+ICsgICAgICAgIG1lbS0+YmFua1ttZW0tPm5y
X2JhbmtzXS54ZW5faGVhcCA9IHhlbl9oZWFwOw0KPiA+ICAgICAgICAgIG1lbS0+bnJfYmFua3Mr
KzsNCj4gPiAgICAgIH0NCj4gPg0KPiA+IEBAIC0xODUsNyArMTg3LDcgQEAgc3RhdGljIGludCBf
X2luaXQgcHJvY2Vzc19tZW1vcnlfbm9kZShjb25zdCB2b2lkDQo+ICpmZHQsIGludCBub2RlLA0K
PiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHZvaWQgKmRhdGEpDQo+
ID4gIHsNCj4gPiAgICAgIHJldHVybiBkZXZpY2VfdHJlZV9nZXRfbWVtaW5mbyhmZHQsIG5vZGUs
ICJyZWciLCBhZGRyZXNzX2NlbGxzLA0KPiBzaXplX2NlbGxzLA0KPiA+IC0gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGRhdGEsIGZhbHNlKTsNCj4gPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBkYXRhLCBmYWxzZSwgZmFsc2UpOw0KPiA+ICB9DQo+ID4NCj4g
PiAgc3RhdGljIGludCBfX2luaXQgcHJvY2Vzc19yZXNlcnZlZF9tZW1vcnlfbm9kZShjb25zdCB2
b2lkICpmZHQsIGludCBub2RlLA0KPiA+IEBAIC0yOTMsNyArMjk1LDcgQEAgc3RhdGljIHZvaWQg
X19pbml0IHByb2Nlc3NfbXVsdGlib290X25vZGUoY29uc3QNCj4gdm9pZCAqZmR0LCBpbnQgbm9k
ZSwNCj4gPiAgICAgICAgICAgICAgICAgICAgICAga2luZCwgc3RhcnQsIGRvbVUpOw0KPiA+ICB9
DQo+ID4NCj4gPiAtc3RhdGljIHZvaWQgX19pbml0IHByb2Nlc3NfY2hvc2VuX25vZGUoY29uc3Qg
dm9pZCAqZmR0LCBpbnQgbm9kZSwNCj4gPiArc3RhdGljIGludCBfX2luaXQgcHJvY2Vzc19jaG9z
ZW5fbm9kZShjb25zdCB2b2lkICpmZHQsIGludCBub2RlLA0KPiBZb3UgZG8gbm90IHJlYWxseSBu
ZWVkIHRvIGNoYW5nZSB0aGUgcmV0dXJuIHR5cGUgb2YgdGhpcyBmdW5jdGlvbi4NCj4gQ3VycmVu
dGx5IHByb2Nlc3NfY2hvc2VuX25vZGUganVzdCByZXR1cm5zIG9uIGFuIGVycm9yIGNvbmRpdGlv
biBzbyB5b3UNCj4gY291bGQgZG8gdGhlIHNhbWUuDQoNClRoYW5rcyBmb3IgcG9pbnRpbmcgdGhp
cyBvdXQsIHdpbGwgZG8gaW4gdjIuDQoNCj4gDQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGNvbnN0IGNoYXIgKm5hbWUsDQo+ID4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHUzMiBhZGRyZXNzX2NlbGxzLCB1MzIgc2l6ZV9jZWxscykN
Cj4gPiAgew0KPiA+IEBAIC0zMDEsMTYgKzMwMyw0MCBAQCBzdGF0aWMgdm9pZCBfX2luaXQgcHJv
Y2Vzc19jaG9zZW5fbm9kZShjb25zdA0KPiB2b2lkICpmZHQsIGludCBub2RlLA0KPiA+ICAgICAg
cGFkZHJfdCBzdGFydCwgZW5kOw0KPiA+ICAgICAgaW50IGxlbjsNCj4gPg0KPiA+ICsgICAgaWYg
KCBmZHRfZ2V0X3Byb3BlcnR5KGZkdCwgbm9kZSwgInhlbixzdGF0aWMtbWVtIiwgTlVMTCkgKQ0K
PiA+ICsgICAgew0KPiA+ICsgICAgICAgIHUzMiBhZGRyZXNzX2NlbGxzID0gZGV2aWNlX3RyZWVf
Z2V0X3UzMihmZHQsIG5vZGUsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICIjeGVuLHN0YXRpYy1tZW0tYWRkcmVzcy1jZWxscyIsDQo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDApOw0KPiA+ICsg
ICAgICAgIHUzMiBzaXplX2NlbGxzID0gZGV2aWNlX3RyZWVfZ2V0X3UzMihmZHQsIG5vZGUsDQo+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICIjeGVuLHN0
YXRpYy1tZW0tc2l6ZS1jZWxscyIsIDApOw0KPiA+ICsgICAgICAgIGludCByYzsNCj4gPiArDQo+
ID4gKyAgICAgICAgcHJpbnRrKCJDaGVja2luZyBmb3IgcmVzZXJ2ZWQgaGVhcCBpbiAvY2hvc2Vu
XG4iKTsNCj4gPiArICAgICAgICBpZiAoIGFkZHJlc3NfY2VsbHMgPCAxIHx8IHNpemVfY2VsbHMg
PCAxICkNCj4gYWRkcmVzc19jZWxscyBhbmQgc2l6ZV9jZWxscyBjYW5ub3QgYmUgbmVnYXRpdmUg
c28geW91IGNvdWxkIGp1c3QgY2hlY2sgaWYNCj4gdGhlcmUgYXJlIDAuDQoNCkluIGJvb3RmZHQu
YyBmdW5jdGlvbiBkZXZpY2VfdHJlZV9nZXRfbWVtaW5mbygpLCB0aGUgYWRkcmVzcyBhbmQgc2l6
ZSBjZWxscw0KYXJlIGNoZWNrZWQgdXNpbmcgPDEgaW5zdGVhZCBvZiA9MC4gSSBhZ3JlZSB0aGV5
IGNhbm5vdCBiZSBuZWdhdGl2ZSwgYnV0IEkgYW0NCm5vdCB2ZXJ5IHN1cmUgaWYgdGhlcmUgd2Vy
ZSBvdGhlciByZWFzb25zIHRvIGRvIHRoZSAiPDEiIGNoZWNrIGluDQpkZXZpY2VfdHJlZV9nZXRf
bWVtaW5mbygpLiBBcmUgeW91IGZpbmUgd2l0aCB3ZSBkb24ndCBrZWVwIHRoZSBjb25zaXN0ZW5j
eQ0KaGVyZT8NCg0KPiANCj4gPiArICAgICAgICB7DQo+ID4gKyAgICAgICAgICAgIHByaW50aygi
ZmR0OiBub2RlIGAlcyc6IGludmFsaWQgI3hlbixzdGF0aWMtbWVtLWFkZHJlc3MtY2VsbHMgb3IN
Cj4gI3hlbixzdGF0aWMtbWVtLXNpemUtY2VsbHNcbiIsDQo+ID4gKyAgICAgICAgICAgICAgICAg
ICBuYW1lKTsNCj4gPiArICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+ID4gKyAgICAgICAg
fQ0KPiA+ICsNCj4gPiArICAgICAgICByYyA9IGRldmljZV90cmVlX2dldF9tZW1pbmZvKGZkdCwg
bm9kZSwgInhlbixzdGF0aWMtbWVtIiwNCj4gYWRkcmVzc19jZWxscywNCj4gPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHNpemVfY2VsbHMsICZib290aW5mby5yZXNlcnZl
ZF9tZW0sIGZhbHNlLA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
dHJ1ZSk7DQo+ID4gKyAgICAgICAgaWYgKCByYyApDQo+ID4gKyAgICAgICAgICAgIHJldHVybiBy
YzsNCj4gPiArICAgIH0NCj4gPiArDQo+ID4gICAgICBwcmludGsoIkNoZWNraW5nIGZvciBpbml0
cmQgaW4gL2Nob3NlblxuIik7DQo+ID4NCj4gPiAgICAgIHByb3AgPSBmZHRfZ2V0X3Byb3BlcnR5
KGZkdCwgbm9kZSwgImxpbnV4LGluaXRyZC1zdGFydCIsICZsZW4pOw0KPiA+ICAgICAgaWYgKCAh
cHJvcCApDQo+ID4gICAgICAgICAgLyogTm8gaW5pdHJkIHByZXNlbnQuICovDQo+ID4gLSAgICAg
ICAgcmV0dXJuOw0KPiA+ICsgICAgICAgIHJldHVybiAwOw0KPiA+ICAgICAgaWYgKCBsZW4gIT0g
c2l6ZW9mKHUzMikgJiYgbGVuICE9IHNpemVvZih1NjQpICkNCj4gPiAgICAgIHsNCj4gPiAgICAg
ICAgICBwcmludGsoImxpbnV4LGluaXRyZC1zdGFydCBwcm9wZXJ0eSBoYXMgaW52YWxpZCBsZW5n
dGggJWRcbiIsIGxlbik7DQo+ID4gLSAgICAgICAgcmV0dXJuOw0KPiA+ICsgICAgICAgIHJldHVy
biAtRUlOVkFMOw0KPiBUaGlzIGNoYW5nZSBicmVha3MgdGhlIGN1cnJlbnQgYmVoYXZpb3IgYW5k
IHdpbGwgcmVzdWx0IGluIHRyaWdnZXJpbmcgdGhlDQo+IHByaW50ayBpbiBlYXJseV9zY2FuX25v
ZGUgZm9yIHBhcnNpbmcgZmFpbHVyZS4NCj4gSXMgdGhpcyBpbnRlbmRlZD8gSWYgc28sIHlvdSBj
b3VsZCBtZW50aW9uIHRoaXMgaW4gdGhlIGNvbW1pdCBtc2cuDQoNCkkgdGhpbmsgSSB3aWxsIGZv
bGxvdyB5b3VyIGFkdmljZSBhYm92ZSBmb3IgdGhlIHJldHVybiB0eXBlIHNvIGhlcmUgd2Ugd29u
J3QNCmhhdmUgYW55IGNoYW5nZXMgaW4gdjIuDQoNCj4gDQo+ID4gICAgICB9DQo+ID4gICAgICBz
dGFydCA9IGR0X3JlYWRfbnVtYmVyKCh2b2lkICopJnByb3AtPmRhdGEsIGR0X3NpemVfdG9fY2Vs
bHMobGVuKSk7DQo+ID4NCj4gPiBAQCAtMzE4LDEyICszNDQsMTIgQEAgc3RhdGljIHZvaWQgX19p
bml0IHByb2Nlc3NfY2hvc2VuX25vZGUoY29uc3QNCj4gdm9pZCAqZmR0LCBpbnQgbm9kZSwNCj4g
PiAgICAgIGlmICggIXByb3AgKQ0KPiA+ICAgICAgew0KPiA+ICAgICAgICAgIHByaW50aygibGlu
dXgsaW5pdHJkLWVuZCBub3QgcHJlc2VudCBidXQgLXN0YXJ0IHdhc1xuIik7DQo+ID4gLSAgICAg
ICAgcmV0dXJuOw0KPiA+ICsgICAgICAgIHJldHVybiAtRUlOVkFMOw0KPiA+ICAgICAgfQ0KPiA+
ICAgICAgaWYgKCBsZW4gIT0gc2l6ZW9mKHUzMikgJiYgbGVuICE9IHNpemVvZih1NjQpICkNCj4g
PiAgICAgIHsNCj4gPiAgICAgICAgICBwcmludGsoImxpbnV4LGluaXRyZC1lbmQgcHJvcGVydHkg
aGFzIGludmFsaWQgbGVuZ3RoICVkXG4iLCBsZW4pOw0KPiA+IC0gICAgICAgIHJldHVybjsNCj4g
PiArICAgICAgICByZXR1cm4gLUVJTlZBTDsNCj4gPiAgICAgIH0NCj4gPiAgICAgIGVuZCA9IGR0
X3JlYWRfbnVtYmVyKCh2b2lkICopJnByb3AtPmRhdGEsIGR0X3NpemVfdG9fY2VsbHMobGVuKSk7
DQo+ID4NCj4gPiBAQCAtMzMxLDEyICszNTcsMTQgQEAgc3RhdGljIHZvaWQgX19pbml0IHByb2Nl
c3NfY2hvc2VuX25vZGUoY29uc3QNCj4gdm9pZCAqZmR0LCBpbnQgbm9kZSwNCj4gPiAgICAgIHsN
Cj4gPiAgICAgICAgICBwcmludGsoImxpbnV4LGluaXRyZCBsaW1pdHMgaW52YWxpZDogJSJQUklw
YWRkciIgPj0gJSJQUklwYWRkciJcbiIsDQo+ID4gICAgICAgICAgICAgICAgICAgIHN0YXJ0LCBl
bmQpOw0KPiA+IC0gICAgICAgIHJldHVybjsNCj4gPiArICAgICAgICByZXR1cm4gLUVJTlZBTDsN
Cj4gPiAgICAgIH0NCj4gPg0KPiA+ICAgICAgcHJpbnRrKCJJbml0cmQgJSJQUklwYWRkciItJSJQ
UklwYWRkciJcbiIsIHN0YXJ0LCBlbmQpOw0KPiA+DQo+ID4gICAgICBhZGRfYm9vdF9tb2R1bGUo
Qk9PVE1PRF9SQU1ESVNLLCBzdGFydCwgZW5kLXN0YXJ0LCBmYWxzZSk7DQo+ID4gKw0KPiA+ICsg
ICAgcmV0dXJuIDA7DQo+ID4gIH0NCj4gPg0KPiA+ICBzdGF0aWMgaW50IF9faW5pdCBwcm9jZXNz
X2RvbWFpbl9ub2RlKGNvbnN0IHZvaWQgKmZkdCwgaW50IG5vZGUsDQo+ID4gQEAgLTM1OCw3ICsz
ODYsOCBAQCBzdGF0aWMgaW50IF9faW5pdCBwcm9jZXNzX2RvbWFpbl9ub2RlKGNvbnN0IHZvaWQN
Cj4gKmZkdCwgaW50IG5vZGUsDQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAiI3hlbixzdGF0aWMtbWVtLXNpemUtY2VsbHMiLCAwKTsNCj4gPg0KPiA+ICAgICAgcmV0
dXJuIGRldmljZV90cmVlX2dldF9tZW1pbmZvKGZkdCwgbm9kZSwgInhlbixzdGF0aWMtbWVtIiwN
Cj4gYWRkcmVzc19jZWxscywNCj4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBzaXplX2NlbGxzLCAmYm9vdGluZm8ucmVzZXJ2ZWRfbWVtLCB0cnVlKTsNCj4gPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzaXplX2NlbGxzLCAmYm9vdGluZm8ucmVzZXJ2
ZWRfbWVtLCB0cnVlLA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZh
bHNlKTsNCj4gPiAgfQ0KPiA+DQo+ID4gIHN0YXRpYyBpbnQgX19pbml0IGVhcmx5X3NjYW5fbm9k
ZShjb25zdCB2b2lkICpmZHQsDQo+ID4gQEAgLTM4Myw3ICs0MTIsNyBAQCBzdGF0aWMgaW50IF9f
aW5pdCBlYXJseV9zY2FuX25vZGUoY29uc3Qgdm9pZCAqZmR0LA0KPiA+ICAgICAgICAgICAgICAg
IGRldmljZV90cmVlX25vZGVfY29tcGF0aWJsZShmZHQsIG5vZGUsICJtdWx0aWJvb3QsbW9kdWxl
IiApKSkNCj4gPiAgICAgICAgICBwcm9jZXNzX211bHRpYm9vdF9ub2RlKGZkdCwgbm9kZSwgbmFt
ZSwgYWRkcmVzc19jZWxscywgc2l6ZV9jZWxscyk7DQo+ID4gICAgICBlbHNlIGlmICggZGVwdGgg
PT0gMSAmJiBkZXZpY2VfdHJlZV9ub2RlX21hdGNoZXMoZmR0LCBub2RlLCAiY2hvc2VuIikgKQ0K
PiA+IC0gICAgICAgIHByb2Nlc3NfY2hvc2VuX25vZGUoZmR0LCBub2RlLCBuYW1lLCBhZGRyZXNz
X2NlbGxzLCBzaXplX2NlbGxzKTsNCj4gPiArICAgICAgICByYyA9IHByb2Nlc3NfY2hvc2VuX25v
ZGUoZmR0LCBub2RlLCBuYW1lLCBhZGRyZXNzX2NlbGxzLCBzaXplX2NlbGxzKTsNCj4gPiAgICAg
IGVsc2UgaWYgKCBkZXB0aCA9PSAyICYmIGRldmljZV90cmVlX25vZGVfY29tcGF0aWJsZShmZHQs
IG5vZGUsDQo+ICJ4ZW4sZG9tYWluIikgKQ0KPiA+ICAgICAgICAgIHJjID0gcHJvY2Vzc19kb21h
aW5fbm9kZShmZHQsIG5vZGUsIG5hbWUsIGFkZHJlc3NfY2VsbHMsIHNpemVfY2VsbHMpOw0KPiA+
DQo+ID4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYyBiL3hlbi9hcmNo
L2FybS9kb21haW5fYnVpbGQuYw0KPiA+IGluZGV4IDNmZDExODZiNTMuLjZmOTdmNWYwNmEgMTAw
NjQ0DQo+ID4gLS0tIGEveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jDQo+ID4gKysrIGIveGVu
L2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jDQo+ID4gQEAgLTEwMzgsOCArMTAzOCw5IEBAIHN0YXRp
YyBpbnQgX19pbml0IG1ha2VfbWVtb3J5X25vZGUoY29uc3Qgc3RydWN0DQo+IGRvbWFpbiAqZCwN
Cj4gPiAgICAgIGlmICggbWVtLT5ucl9iYW5rcyA9PSAwICkNCj4gPiAgICAgICAgICByZXR1cm4g
LUVOT0VOVDsNCj4gPg0KPiA+IC0gICAgLyogZmluZCBmaXJzdCBtZW1vcnkgcmFuZ2Ugbm90IGJv
dW5kIHRvIGEgWGVuIGRvbWFpbiAqLw0KPiA+IC0gICAgZm9yICggaSA9IDA7IGkgPCBtZW0tPm5y
X2JhbmtzICYmIG1lbS0+YmFua1tpXS54ZW5fZG9tYWluOyBpKysgKQ0KPiA+ICsgICAgLyogZmlu
ZCBmaXJzdCBtZW1vcnkgcmFuZ2Ugbm90IGJvdW5kIHRvIG5laXRoZXIgYSBYZW4gZG9tYWluIG5v
ciBoZWFwDQo+ICovDQo+ID4gKyAgICBmb3IgKCBpID0gMDsgaSA8IG1lbS0+bnJfYmFua3MgJiYN
Cj4gPiArICAgICAgICAgICAgICAgICAobWVtLT5iYW5rW2ldLnhlbl9kb21haW4gfHwgbWVtLT5i
YW5rW2ldLnhlbl9oZWFwKTsgaSsrICkNCj4gPiAgICAgICAgICA7DQo+IENvdWxkIHlvdSBwbGVh
c2UgYWRkIGFuIGVtcHR5IGxpbmUgaGVyZSB0byBpbXByb3ZlIHJlYWRhYmlsaXR5Pw0KDQpTdXJl
Lg0KDQpLaW5kIHJlZ2FyZHMsDQpIZW5yeQ0K

