Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E345A58AA
	for <lists+xen-devel@lfdr.de>; Tue, 30 Aug 2022 02:59:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.394757.634285 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oSpaU-00070G-Kv; Tue, 30 Aug 2022 00:58:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 394757.634285; Tue, 30 Aug 2022 00:58:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oSpaU-0006y3-Hj; Tue, 30 Aug 2022 00:58:42 +0000
Received: by outflank-mailman (input) for mailman id 394757;
 Tue, 30 Aug 2022 00:58:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y69e=ZC=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oSpaT-0006xv-AX
 for xen-devel@lists.xenproject.org; Tue, 30 Aug 2022 00:58:41 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2046.outbound.protection.outlook.com [40.107.21.46])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e2607495-27fe-11ed-9250-1f966e50362f;
 Tue, 30 Aug 2022 02:58:39 +0200 (CEST)
Received: from DBBPR09CA0006.eurprd09.prod.outlook.com (2603:10a6:10:c0::18)
 by DB7PR08MB3339.eurprd08.prod.outlook.com (2603:10a6:5:1c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Tue, 30 Aug
 2022 00:58:35 +0000
Received: from DBAEUR03FT009.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:c0:cafe::d7) by DBBPR09CA0006.outlook.office365.com
 (2603:10a6:10:c0::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.18 via Frontend
 Transport; Tue, 30 Aug 2022 00:58:32 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT009.mail.protection.outlook.com (100.127.143.21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5566.15 via Frontend Transport; Tue, 30 Aug 2022 00:58:31 +0000
Received: ("Tessian outbound fccf984e7173:v123");
 Tue, 30 Aug 2022 00:58:31 +0000
Received: from 0803ebb65fe3.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9CADB68E-D7E5-436B-B2A7-256D49A7D87B.1; 
 Tue, 30 Aug 2022 00:58:26 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0803ebb65fe3.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 30 Aug 2022 00:58:26 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by VI1PR08MB2768.eurprd08.prod.outlook.com (2603:10a6:802:19::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Tue, 30 Aug
 2022 00:58:23 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::9c75:2d29:bb6a:663f]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::9c75:2d29:bb6a:663f%5]) with mapi id 15.20.5566.021; Tue, 30 Aug 2022
 00:58:23 +0000
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
X-Inumbo-ID: e2607495-27fe-11ed-9250-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=FAD+dNmd/ByCKF40cV7Pa8E4oC6oTJgCBWISoXA+J9lSBxX7smWhsrhPknLJXRYKDJmgTem89sdC725fsd/KpaufIgSoStNvf1D1ILbVhIDSYLOPIaRerlSGIGZ0HgPBfKr8BfnRkaqIjMo7btlYzjd/GOfovpp7rx+R8FUTc2ruUwGxi/UZfDN29dYaMZAfaS8XRAnefMsxrslHgJUAJU9YxD1rSG3Ukow1utILLLrrQrsYYRupU69o0sqzBVNqJgFInzDKeXHTNr8jQlKHRyvTLNUR+ErJXb851xZkkfJwzmbJO73zXpJ7caMcnsprbzAkU0/TIuTI3KVjZiDzeQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U1gujnHkgu3GEGxdmUmZpeltirryqyZLv7UVkksZmqM=;
 b=YwH1I3NxIFtMxVeqQr+faX+QTXQLY4UERCkMS/Yvtb7nqFXL9cq8cPZgZtjNwS0ZkVqTaAxap96et3Nsv0SAHSw0xwL/JTBXJmAZgJJmKgHJEl1r0hPFaZGZYxADczgMWlnreke1opPf1Obd++N5yayzy/vu7lk7hDBqLuGIU+FYo5C+rSqcOy8pQsazcZ6WUtFuV/gEs9fVuVqw9l8Oq2/P/JFb+QEV5w2h/AJ0tjrXegYnftcn/GujjYtAvWKiJTZ2l2sCGPujkoLHnn7XbObRHGBW42HyYex3mtoV952WsQwv2lcMWqo40aFM6FH7lSFF0J6/sSEnqrhPaGJ6uw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U1gujnHkgu3GEGxdmUmZpeltirryqyZLv7UVkksZmqM=;
 b=YeOiB3LOPNiYHEbGGWeU896w3l9gAYPEXyd2cpK8rIDwMG4ojcPRfUvEMmV59xCBZeKC/wrv924msbTqy4QN81WwzzK2QQAGufOln70OjKr48f0H68BnC/qKJ127qb35z/j2adK7ShQA72V4yjm4XXwkwzMMwxfhnrrMy1iBVfU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ca/DhFap9YKUUHSV6ciJNUFShzk329DfDEmM2jnGRUOLsKw2ZmUCZVwpADot0dCkNUe351CxiYi+k4ci+TblZ+3u9fGD9LZzAMKm+9JQ4MlRtyJXdo0qWA8UjsZz6FIA9KlWwslQrgOfuWnY5vpkm1Kd3n0d2DP6H9wuXK3Hq0xAuJVSt4z9qYO5fVTFfKfI75bXmXNV6zV3Ye7yWqSthUN5r2MIklfR7sU+CM2ao+zEfLpYILQh6xzOsOoGt/iVrL7mho6BRmMnNXEBS6LIHyfmVLql6rbf3FpQxNcut++bRB0n2nPov226CXS881Wh45R5i8HWCANxDRVTxcDJTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U1gujnHkgu3GEGxdmUmZpeltirryqyZLv7UVkksZmqM=;
 b=f6PcGuprRzYc4yKMptnngm66zZHp1hny7aYFEB/M/DTsoTyOTF0Y6pmCtmRQH5ZV3jFbQRQu3YWf3tDhWvFEn+h4G2hkXtDF3z1PmmaurNedmY3oMCP87OZyRwQDNQAt2V0/N1FNLloAf1VOcxBGivwfHWdfPGfgEU9lBYUIBEFDOFiS1oro2FSK9GwPNGJgTXEphJEfWvgbDtPZfwCbfiNXYSOiVQMjxp/9kTRINSkZs5NHytrHOlc3abX9uAQkWbnPSwSl8pK2hTl/qpPnwHyZrQExMX78kujpnTHgC5HrNvRkiyZRXffOuDncaRrDbY9RGkxm67Cw0u/OANUb8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U1gujnHkgu3GEGxdmUmZpeltirryqyZLv7UVkksZmqM=;
 b=YeOiB3LOPNiYHEbGGWeU896w3l9gAYPEXyd2cpK8rIDwMG4ojcPRfUvEMmV59xCBZeKC/wrv924msbTqy4QN81WwzzK2QQAGufOln70OjKr48f0H68BnC/qKJ127qb35z/j2adK7ShQA72V4yjm4XXwkwzMMwxfhnrrMy1iBVfU=
From: Henry Wang <Henry.Wang@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>, Michal Orzel
	<michal.orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Julien
 Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen
	<Wei.Chen@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Penny
 Zheng <Penny.Zheng@arm.com>
Subject: RE: [PATCH 1/2] docs, xen/arm: Introduce reserved heap memory
Thread-Topic: [PATCH 1/2] docs, xen/arm: Introduce reserved heap memory
Thread-Index: AQHYt4ueuuTQX+2f5E69518db+C55q2+ENkAgAC6AOCAB9oWAIAAAi5w
Date: Tue, 30 Aug 2022 00:58:23 +0000
Message-ID:
 <AS8PR08MB7991EC7FAD3D1EDBD379D9C892799@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20220824073127.16762-1-Henry.Wang@arm.com>
 <20220824073127.16762-2-Henry.Wang@arm.com>
 <af2f8888-7223-429e-cc7e-b0950f759608@amd.com>
 <AS8PR08MB7991A2A6EF808136FBF090F392729@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <alpine.DEB.2.22.394.2208291745550.1134492@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2208291745550.1134492@ubuntu-linux-20-04-desktop>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 12B33139CB1D9E44B88640808CC6CD3C.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 6ac66243-ae32-4036-06a2-08da8a22c232
x-ms-traffictypediagnostic:
	VI1PR08MB2768:EE_|DBAEUR03FT009:EE_|DB7PR08MB3339:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 0PyF2aUmQusZPpIE2YoSbWMM/3NBnfQhsY5cepgQKFIwgrULyJwNdy1am1NLhjSayFTO1boP04BXnTRCR87N5CjYtpb8cVjatlA6cmvq0MHjFUAzAbO1ILBXHZve50ysQMpteVT92Bj07jERNaOCYUYLcoC74yDPccnTfk54ZFb6AgxdNCh0gCzmAFgZXTikCl7y0iqsD2HDGzYcVG14QpAFQ/xzi5cT0nxfbVng8NWNJQLbBacQdXRgTTKU+hF7EZVLbBMxNxGiPadv0FNoHzUIiOwNUG2+UAwx+PkylQ+nrJepTgfI/fJSPa85Wj0mycuYI++XO7Xg+/UgpxAC62TNrwoGVVzSKnX7Y7zlJFi+PuvWDb/sMJmQlivLF1X2lfxaIg1TkmOX5abR1APjLyfPmhJ1c8kBnMhuCAOZgrmK/iMdXTWre51VrvzmeyIClFWAeT9/f6eB5R/UNuOXeeiFVCReG3XfrxWSoRX8AJOwTHooTa8OfelUIClioqCroUZK8J6xHMdETxbZgN0TgkU6zqX+gp+B5JWNEeo93Rj6ap8EaCZvPX+v2cl7WeK6AJj3x65guhzss0PZ+f/03uk/tGjM5/uQoWDnx7dWZGpuTzpsFKwuOTjZcIQYjVDiDn/RpSHttmlMkeBjzvl1j5V7L+CfLYsxU251bRofOI/CFj08/E7POuHOVCc01Teke/Rlgd7SIS96cJHEq9el5mLqwzYurC7eovwOZua6Qok7+pt3I/B1JxaCYdWC2KXAITsr5HIlZUNUNSxnu4NI9w==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(366004)(346002)(396003)(136003)(39860400002)(38070700005)(26005)(478600001)(83380400001)(5660300002)(52536014)(2906002)(8936002)(186003)(8676002)(71200400001)(316002)(33656002)(4326008)(110136005)(38100700002)(122000001)(54906003)(66556008)(66946007)(66446008)(76116006)(64756008)(9686003)(66476007)(55016003)(53546011)(7696005)(86362001)(41300700001)(6506007);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2768
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	25f556c4-5aba-487a-1c70-08da8a22bd31
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	va4AH4Rgnc6qRDQ4tYlQDp31KtuhmE8FKYnR6fJCjwlSLD6ICM79AMb9dvs+7EC71HXojSni1vLrmckxwyGVjnqQenlVKi/45dCduWGVD3hjYQEY+qikilX2MqWvuG2gKJjKvYKMHG5tlQnQG9dcOeKZXKYm+FwvyWXSFgyDxzLeQF6CT87F+vtGYXadqoMF8SJt1seBuMqYhaqhkxpdbbyh+Ld7lZ6daRZa2jQSjNqEccv+mQcngMjMseODDTmCj/Ef12HTk3QA2xYhguZNPJpKmjABv31J6qpsXroFBG1YAHssVqgVLpuHG+RtVic9fNjHBzC+Ak1UurnXovoXh0+jYaXVTLMb1WM4K7d2I4wsbBn0kISC2ijs3GwjdoAIMufe4We94LCxf5/4Iuo9J8h2KOmbbiIzVm+LfAKydWMpyrftUxTPttwEAu1i/U8803mwdXHRRMYqs1Av0KTciHt2Ya+f6iWOu32gk3MllOj18nmDM8vS1rLsJMsTWHOEMEuq1MXWZdMp1bOi4FFQczMt0OD5J2C5necYhmqK4PJOhRXHSi49oEjJ2f4u78mgtUljdCocFxAtfPIDfiijIkinkjSLZBO6WI11vcC33sUfkemFxNy6mjV2exMBOsJz1C7wm1nYmnbx+mt6GqcVM8ZS0V7UcyUk1N0YC5bt59zzMMpCjY0OMKA1TuCnI1UTsjajLkzM2drQ9Ur25Hofipj6xoFxEnkIclF/P27gzVPix2kpwS0GtEfER9/jz5bDvlIy5FviTKgsN4pBgyOWYA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(346002)(396003)(376002)(136003)(39860400002)(46966006)(36840700001)(40470700004)(47076005)(40480700001)(55016003)(82310400005)(4326008)(36860700001)(54906003)(356005)(86362001)(82740400003)(110136005)(81166007)(8676002)(70586007)(41300700001)(478600001)(5660300002)(8936002)(40460700003)(52536014)(70206006)(316002)(186003)(83380400001)(2906002)(7696005)(6506007)(33656002)(336012)(26005)(53546011)(9686003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2022 00:58:31.7769
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ac66243-ae32-4036-06a2-08da8a22c232
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3339

Hi Stefano and Michal,

> -----Original Message-----
> From: Stefano Stabellini <sstabellini@kernel.org>
> Sent: Tuesday, August 30, 2022 8:47 AM
> To: Henry Wang <Henry.Wang@arm.com>
> Cc: Michal Orzel <michal.orzel@amd.com>; xen-devel@lists.xenproject.org;
> Stefano Stabellini <sstabellini@kernel.org>; Julien Grall <julien@xen.org=
>;
> Bertrand Marquis <Bertrand.Marquis@arm.com>; Wei Chen
> <Wei.Chen@arm.com>; Volodymyr Babchuk
> <Volodymyr_Babchuk@epam.com>; Penny Zheng <Penny.Zheng@arm.com>
> Subject: RE: [PATCH 1/2] docs, xen/arm: Introduce reserved heap memory
>=20
> On Thu, 25 Aug 2022, Henry Wang wrote:
> > > >                                         const char *name,
> > > >                                         u32 address_cells, u32 size=
_cells)
> > > >  {
> > > > @@ -301,16 +303,40 @@ static void __init process_chosen_node(const
> > > void *fdt, int node,
> > > >      paddr_t start, end;
> > > >      int len;
> > > >
> > > > +    if ( fdt_get_property(fdt, node, "xen,static-mem", NULL) )
> > > > +    {
> > > > +        u32 address_cells =3D device_tree_get_u32(fdt, node,
> > > > +                                                "#xen,static-mem-a=
ddress-cells",
> > > > +                                                0);
> > > > +        u32 size_cells =3D device_tree_get_u32(fdt, node,
> > > > +                                             "#xen,static-mem-size=
-cells", 0);
> > > > +        int rc;
> > > > +
> > > > +        printk("Checking for reserved heap in /chosen\n");
> > > > +        if ( address_cells < 1 || size_cells < 1 )
> > > address_cells and size_cells cannot be negative so you could just che=
ck if
> > > there are 0.
> >
> > In bootfdt.c function device_tree_get_meminfo(), the address and size c=
ells
> > are checked using <1 instead of =3D0. I agree they cannot be negative, =
but I
> am
> > not very sure if there were other reasons to do the "<1" check in
> > device_tree_get_meminfo(). Are you fine with we don't keep the
> consistency
> > here?
>=20
> I would keep the < 1 check but it doesn't make much difference either
> way

I also would prefer to keep these two places consistent and I agree Michal =
is
making a good point.

Kind regards,
Henry


