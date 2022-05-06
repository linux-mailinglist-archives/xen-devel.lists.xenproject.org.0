Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A720551D746
	for <lists+xen-devel@lfdr.de>; Fri,  6 May 2022 14:03:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.322998.544572 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmwgQ-00042f-VE; Fri, 06 May 2022 12:03:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 322998.544572; Fri, 06 May 2022 12:03:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmwgQ-0003zp-RF; Fri, 06 May 2022 12:03:42 +0000
Received: by outflank-mailman (input) for mailman id 322998;
 Fri, 06 May 2022 12:03:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CuCn=VO=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1nmwgP-0003zZ-1z
 for xen-devel@lists.xenproject.org; Fri, 06 May 2022 12:03:41 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20613.outbound.protection.outlook.com
 [2a01:111:f400:7d00::613])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 90db9586-cd34-11ec-8fc4-03012f2f19d4;
 Fri, 06 May 2022 14:03:39 +0200 (CEST)
Received: from AM6P191CA0028.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8b::41)
 by DB9PR08MB7161.eurprd08.prod.outlook.com (2603:10a6:10:2ca::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.18; Fri, 6 May
 2022 12:03:37 +0000
Received: from VE1EUR03FT051.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8b:cafe::4f) by AM6P191CA0028.outlook.office365.com
 (2603:10a6:209:8b::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.20 via Frontend
 Transport; Fri, 6 May 2022 12:03:36 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT051.mail.protection.outlook.com (10.152.19.75) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5227.15 via Frontend Transport; Fri, 6 May 2022 12:03:36 +0000
Received: ("Tessian outbound ac9bb5dd84f6:v118");
 Fri, 06 May 2022 12:03:36 +0000
Received: from 16eaaaab0055.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1C7135CC-DC7B-4674-82B0-F9A03719975D.1; 
 Fri, 06 May 2022 12:03:25 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 16eaaaab0055.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 06 May 2022 12:03:25 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by PA4PR08MB5981.eurprd08.prod.outlook.com (2603:10a6:102:e2::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.12; Fri, 6 May
 2022 12:03:24 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1d49:4e03:8569:a07c]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1d49:4e03:8569:a07c%7]) with mapi id 15.20.5144.027; Fri, 6 May 2022
 12:03:23 +0000
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
X-Inumbo-ID: 90db9586-cd34-11ec-8fc4-03012f2f19d4
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=ntH+jH9s2SIop0JhZ2+C/ylcvr9r3Uwvsw1gPRmboCmohoCQF+R0XvEGjY2WcQ9TR8ulmxBhrneo0rdKyReuRo6u0MCu4teDc9WqECdkG8sh8Donwj8RDNouv+FydZ4mFReisa60kHSV5o5Ty+eXeF8cpCvRvKrQSvvr9L+/yb2m0sHrSOnGlCdHfpVo7lmUXvEIfaAVKv4zSWfbP3RBsL0XrYlouNN4wFoqIodj4gNdwvClEJi8iO4tShRmIhAZtogb4/H2lkxiM3uok3B5dkeQ5XZUT1oqOdtIxu9rUIGVsnsnUrm/PNrw41vinw82jFGi7DojvjCmeJG8SJq8fg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3ngeQtgrxCaWSrBPVmd67JBnD1aLnowqKALKoCu1V0g=;
 b=I5AajyWBttD+aoVrncfo1sVp9ByUGjMCdS39Qu62CgCK0YCdshNlFMF6zS3Nl5AegDG7gnJ5VPNqkOu7+elE2jXmcI7H8FW4pOPOLLPek2L6cCdNJQCE6cvSZoLn44JSPgOW1iH0PVlLWWAYsT62mpbY39dPexc+lbn5FMC7Gths7L8q8dH3Ni90lzXSX46FKxtDDVIRaSwcWLSbHQYCl6a1Zn99LMWJYHy0dFI9mt1rzUnLbzECWi9sGC79fDmXPWiNkVnCDMrEXzUV6pHedqUzEWdDwAGHa/uRs7Gt6L/N0JAKpqbY26bRE631LCajri8OEvNcniupY6qkf+o6Zg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3ngeQtgrxCaWSrBPVmd67JBnD1aLnowqKALKoCu1V0g=;
 b=GOj52XuPV1OS4xn5IBQtrfEIjBRukzzeHRIhk3x2zPrTxJ+FcEijeheKPXUc9yudn13lbjnn3DxNIXnhu0M5lUkT5wHCatAwr4N5k8DOSiJa4ipGiX7A5u/LT2K5yNDWcMFiejIQSA/aEJxBp667CDglvR4yFv3g6WxxHIPh0Xk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cgWIcq+TXEqFkn7ATUpLEeekh+D06WeDm6/iWfMAsKL4czylh3xRYBG9lEuHXXfF6jtDgoGkFGMUtMbos2mjYP91Vt+EeveJp8jx7Pf3m+VqV1Y1cZIgosG+4JKEVNr8WQGtlhpEthK7sOC3l61C4rXAQkdVuHZftm7RQOKhhSFen2XzF5B0+Fc9y0CvnRIov4sGolSTKSY+6yJ3Q65mKR/gqFW1EeMke/FznNgYWpEAXvqpJN5m2dp3bAmlKNTeYmG2mF9R4Zd54ATyWv4cjlrq5F+RYVWl0lJjKta6P6SwCnkFYhNXYOPFfx923jo2xAbv5uyhH4WiDO5Lb/nOTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3ngeQtgrxCaWSrBPVmd67JBnD1aLnowqKALKoCu1V0g=;
 b=NlWm5hRQY6Xbq+VzP48YMaDAwP/QfcxYizN8bQ4kwp1GV7G3ftxPzY0LWZmRK4ua0djL+ECuZidh/MXKm3QJSxbTJN7XxTUEXKEB9YixYfbEEzV9X7mdYUdU1Mm9POZY+7Kemzma2a8KvO/ic760LWOgmou+zv5adJ2BAVZquMVZUBzjHKaKGcY1i0nj3ZN6uqiQmJ7t256ycKu6JgGmXYluG99w3XfOj+oYRroVhTlpB8JQEV4sT0tRdB2MNbsStJa9UzEtfupKDPvk0Z7uvABkSeGxrEQ0H5jcz3+6STBgVpDLAK/SSFBBgGzpuSyzwcJkYhRrtRH1qBIY4PTmkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3ngeQtgrxCaWSrBPVmd67JBnD1aLnowqKALKoCu1V0g=;
 b=GOj52XuPV1OS4xn5IBQtrfEIjBRukzzeHRIhk3x2zPrTxJ+FcEijeheKPXUc9yudn13lbjnn3DxNIXnhu0M5lUkT5wHCatAwr4N5k8DOSiJa4ipGiX7A5u/LT2K5yNDWcMFiejIQSA/aEJxBp667CDglvR4yFv3g6WxxHIPh0Xk=
From: Henry Wang <Henry.Wang@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Wei
 Liu <wl@xen.org>, Wei Chen <Wei.Chen@arm.com>, Julien Grall
	<jgrall@amazon.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v2 2/2] xen/common: Use enhanced ASSERT_ALLOC_CONTEXT in
 xmalloc()
Thread-Topic: [PATCH v2 2/2] xen/common: Use enhanced ASSERT_ALLOC_CONTEXT in
 xmalloc()
Thread-Index: AQHYYQ1+wSNISpljvkG6pMKyJcwNSq0Rpx4AgAAWlnA=
Date: Fri, 6 May 2022 12:03:23 +0000
Message-ID:
 <AS8PR08MB7991DBFE189E7FC5E63C1EB392C59@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20220506055201.999277-1-Henry.Wang@arm.com>
 <20220506055201.999277-3-Henry.Wang@arm.com>
 <6a44bc43-c392-2eac-d350-ec87cb2c3ab3@suse.com>
In-Reply-To: <6a44bc43-c392-2eac-d350-ec87cb2c3ab3@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 3E0E6FAB06ADAE4CB84E0CAAE5AFB91F.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 9c5174aa-5cfa-4f41-c55c-08da2f587359
x-ms-traffictypediagnostic:
	PA4PR08MB5981:EE_|VE1EUR03FT051:EE_|DB9PR08MB7161:EE_
X-Microsoft-Antispam-PRVS:
	<DB9PR08MB7161DC3B475B271B773947E492C59@DB9PR08MB7161.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 QIreALH1mh4V27Kia3GoiRxHduStCjvoUkmwSoh1/B1PVxa3626MsLGY2l/lDr1ZJcrCPFsBgkn+Ax3fBi5FRSc5PJvaPw//PAYDRvEXQMHSBf18jx9ffdlcaSwwrWsewPrq2Ph0Fc7OV2QomESuhgXBjxz6HYTwoQiqS3Ekvz0vxBP3vmlRbw1tYmLVMdqBSSI3K1gGBOPgS8yDlKlOeeVq8i1Z0L+s/48zAsai0YMcPnF+0wPTqsecH+5z5UnoIWmmstX1AePh8oRhQHLEDve6jOeoKJEsbhLrw40mXXqnkdXxjp2EuKbTzgX7k9ISOtIa8MiKMPRda3Ts+xyzUP4eHxbce0yIeTsQR3tjsrTotzrB1c+xejMnhKFY2F5BTUfwnzs+6OAkF1CjDtq2Pps7Gg9/EELlpy6SnZ1Mf26n51v0z9f5euoXfnRXPVDjZS6YL3T2QU+x7xaiklEL+/Nca/NVCHE+aaodseubPiyTXvIxIlfNY+BxqfpeqL6t9Ow5vRE5wfsOPH0BPE1ktomiVFWHMkUBHDHMYidB58qZvfI8Rp2haB8D/8xSnJjfi6edXfgWwNpheXpqQ+WbmoJOh4RQO5n0xBOOpjHDdMpCI2eKtEztYLSKObVEaxE27W67HHrVr30mXm2WaRrqJCUUnSoQGG9MkU5AXkSPkAI2A0PxR8dc/TaavlOlGqEqOvAqlttYyuyz9i2bFH78Eg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66476007)(66446008)(64756008)(8676002)(9686003)(71200400001)(186003)(26005)(66946007)(4326008)(66556008)(5660300002)(6506007)(53546011)(8936002)(7696005)(52536014)(2906002)(86362001)(55016003)(508600001)(6916009)(76116006)(54906003)(316002)(38100700002)(38070700005)(33656002)(122000001)(83380400001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5981
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	45e00738-b8c1-46c8-92de-08da2f586bd4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qgiYK+873Ew1ob+1eK8lrB+oidMlEGqv/mn794bzTz2+++Zdr7981eTF+cty6O+WzXzfKUWY92TdJvk0RmMz07GJRRJsBIJIMLYVJf6DWJZ9dZDJXxfs6ceSx3cRxycK5t9cxzUlbLfEFIfH5RUB5/6BunJrUERCcB8c5+HueG/93HDaED/N+3lcAtIpzFTkcpomQFPT0Dnwv4Azd92k6GZsTE8lBJnNdd0nUiArrbqaA5dcZoMgbq8RZIUOZJm6QrRC6o0kDyAA9GRP0wLuOMycgE4dFE5lux47+PhC87I4sVG2hyQl+P35GIfdUYTv7JKsOAxl3ASgUGhQSL3nnZ/yj6f9k10VUVRXc8/8++CJcl8anP3B/chv43O80IG3VCP+ZekTmLrY6l+ANFaKBL6blBlmqXYXOU8h5pPdGgCSudRzOMETQu9vFngEUhlz8YBYKBFQ26u8sSVoq1omVBbImUgHoSUUNU/g4AUIluxYAJTJJaPnegG3iDwyo4LqW0q4Vw8vuy4jO0F3dPHQNKxAvAMy72siPQW+6Xdim+g27UysgYcpHiN8k+OtLah6Zi1keq/7T4CrgKWC4ZPz2CP1o3kZhuPFiH/JwRfOMDvOEP8vk5UCEpG5ygJb9q/RH+qYnaRSRrJzeAc0XDu607yCZxULJ83WtKPml6rAw5XJYMybhJFsxpSVR3i3kFHg
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(54906003)(36860700001)(55016003)(70206006)(2906002)(316002)(70586007)(9686003)(47076005)(508600001)(336012)(356005)(8676002)(81166007)(7696005)(6862004)(8936002)(5660300002)(40460700003)(26005)(4326008)(52536014)(33656002)(53546011)(6506007)(83380400001)(82310400005)(86362001)(186003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2022 12:03:36.4299
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c5174aa-5cfa-4f41-c55c-08da2f587359
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7161

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU2VudDogRnJpZGF5LCBNYXkgNiwgMjAyMiA2OjMz
IFBNDQo+IFRvOiBIZW5yeSBXYW5nIDxIZW5yeS5XYW5nQGFybS5jb20+DQo+IENjOiBTdGVmYW5v
IFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyBKdWxpZW4gR3JhbGwgPGp1bGll
bkB4ZW4ub3JnPjsNCj4gQmVydHJhbmQgTWFycXVpcyA8QmVydHJhbmQuTWFycXVpc0Bhcm0uY29t
PjsgVm9sb2R5bXlyIEJhYmNodWsNCj4gPFZvbG9keW15cl9CYWJjaHVrQGVwYW0uY29tPjsgQW5k
cmV3IENvb3Blcg0KPiA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT47IEdlb3JnZSBEdW5sYXAg
PGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT47DQo+IFdlaSBMaXUgPHdsQHhlbi5vcmc+OyBXZWkg
Q2hlbiA8V2VpLkNoZW5AYXJtLmNvbT47IEp1bGllbiBHcmFsbA0KPiA8amdyYWxsQGFtYXpvbi5j
b20+OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRD
SCB2MiAyLzJdIHhlbi9jb21tb246IFVzZSBlbmhhbmNlZA0KPiBBU1NFUlRfQUxMT0NfQ09OVEVY
VCBpbiB4bWFsbG9jKCkNCj4gDQo+IE9uIDA2LjA1LjIwMjIgMDc6NTIsIEhlbnJ5IFdhbmcgd3Jv
dGU6DQo+ID4gLS0tIGEveGVuL2NvbW1vbi94bWFsbG9jX3Rsc2YuYw0KPiA+ICsrKyBiL3hlbi9j
b21tb24veG1hbGxvY190bHNmLmMNCj4gPiBAQCAtNTk0LDcgKzU5NCw3IEBAIHZvaWQgKl94bWFs
bG9jKHVuc2lnbmVkIGxvbmcgc2l6ZSwgdW5zaWduZWQgbG9uZw0KPiBhbGlnbikNCj4gPiAgew0K
PiA+ICAgICAgdm9pZCAqcCA9IE5VTEw7DQo+ID4NCj4gPiAtICAgIEFTU0VSVCghaW5faXJxKCkp
Ow0KPiA+ICsgICAgQVNTRVJUX0FMTE9DX0NPTlRFWFQoKTsNCj4gDQo+IEZvciBvbmUgLSB3aGF0
IGFib3V0IHhmcmVlKCk/DQoNCk9oIHlvdSBhcmUgZGVmaW5pdGVseSBjb3JyZWN0LCB0aGFua3Mg
Zm9yIHBvaW50aW5nIHRoaXMgb3V0LiBJIHdpbGwNCmRlZmluaXRlbHkgY2hhbmdlIHRoZSBhc3Nl
cnRpb24gaW4geGZyZWUoKSBhcyB3ZWxsIGluIHYzLg0KDQo+IA0KPiBBbmQgdGhlbiBkaWQgeW91
IGNvbnNpZGVyIHRha2luZyB0aGUgb3Bwb3J0dW5pdHkgYW5kIG1vdmluZyBib3RoIHRvDQo+IHRo
ZSByZXNwZWN0aXZlIHBvb2wgYWxsb2MgZnVuY3Rpb25zLCB0aHVzIGdpdmluZyBldmVuIGJldHRl
ciBjb3ZlcmFnZT8NCg0KWWVhaCBJIHdvdWxkIGxvdmUgdG8uIEJ1dCBzb3JyeSBhYm91dCB0aGUg
cXVlc3Rpb24gKGp1c3QgZm9yIGxlYXJuaW5nKToNCkkgYXNzdW1lIHlvdSBhcmUgdGFsa2luZyBh
Ym91dCBjb2RlIGNvdmVyYWdlLCBjb3VsZCB5b3UgcGxlYXNlIGtpbmRseQ0KYWRkIGEgbGl0dGxl
IGJpdCBtb3JlIGRldGFpbCB0byBoZWxwIG1lIHVuZGVyc3RhbmQgd2h5IGFkZGluZyB0aGUgc2Ft
ZQ0KQVNTRVJUX0FMTE9DX0NPTlRFWFQgd291bGQgaGVscCB0byBhIGJldHRlciBjb3ZlcmFnZT8g
U2luY2UuLi4NCg0KPiBHcmFudGVkIHRoZXJlJ3Mgb25lIGRvd25zaWRlIHRvIG1vdmluZyBpdCB0
byB4bWVtX3Bvb2xfYWxsb2MoKTogVGhlbg0KPiB0aGUgZWFybHkgemVyby1zaXplIGFuZCBlcnJv
ciByZXR1cm5zIHdvbid0IGJlIGNvdmVyZWQsIHNvIG1heWJlIHdlDQo+IGFjdHVhbGx5IHdhbnQg
Y2hlY2tzIGluIGJvdGggcGxhY2VzLiANCg0KLi4uYWZ0ZXIgcmVhZGluZyB0aGVzZSBJIGhhdmUg
YSBmZWVsaW5nIHRoYXQgd2UgbmVlZCB0byBhZGQgdGhlIHNhbWUNCkFTU0VSVF9BTExPQ19DT05U
RVhUIGluIHRoZSBiZWdpbm5pbmcgb2YgdGhlIHhtZW1fcG9vbF9hbGxvYywNCnhtYWxsb2Nfd2hv
bGVfcGFnZXMsIGFuZCB4bWVtX3Bvb2xfZnJlZSwgd2hpbGUga2VlcGluZw0KQVNTRVJUX0FMTE9D
X0NPTlRFWFQgaW4gX3htYWxsb2MuIEkgdGhpbmsgeG1lbV9wb29sX2FsbG9jIGFuZA0KeG1hbGxv
Y193aG9sZV9wYWdlcyBhcmUgb25seSBjYWxsZWQgaW4gX3htYWxsb2MgYW5kIHhtZW1fcG9vbF9m
cmVlDQppcyBvbmx5IGNhbGxlZCBpbiB4ZnJlZS4gQWRkaW5nIHRoZSBzYW1lIGFzc2VydGlvbiBp
biB0aGVzZSB0aHJlZSBmdW5jdGlvbnMNCmlzIGR1cGxpY2F0aW9uIG9mIGNvZGU/DQoNClRoYW5r
IHlvdSBmb3IgeW91ciBleHBsYW5hdGlvbiBhbmQgcGF0aWVuY2UuDQoNCj4gSW4geGZyZWUoKSBJ
IHRoaW5rIHRoZSBjaGVjaw0KPiB3b3VsZCB0aGVuIGFsc28gd2FudCB0byBtb3ZlIGFoZWFkIG9m
IHRoZSBlYXJseSByZXR1cm4uDQoNClN1cmUsIHdpbGwgZG8gYXMgeW91IHN1Z2dlc3RlZC4NCg0K
S2luZCByZWdhcmRzLA0KSGVucnkNCg0KPiANCj4gSmFuDQoNCg==

