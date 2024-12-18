Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8947E9F601E
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2024 09:28:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.860019.1272093 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNpOw-0006ux-0A; Wed, 18 Dec 2024 08:27:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 860019.1272093; Wed, 18 Dec 2024 08:27:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNpOv-0006tT-TK; Wed, 18 Dec 2024 08:27:25 +0000
Received: by outflank-mailman (input) for mailman id 860019;
 Wed, 18 Dec 2024 08:27:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=auIu=TL=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1tNpOu-0006tN-Ej
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2024 08:27:24 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170110001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e776cee8-bd19-11ef-a0d6-8be0dac302b0;
 Wed, 18 Dec 2024 09:27:23 +0100 (CET)
Received: from DUZPR01CA0053.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:469::11) by AS8PR08MB10170.eurprd08.prod.outlook.com
 (2603:10a6:20b:63f::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Wed, 18 Dec
 2024 08:27:13 +0000
Received: from DB3PEPF00008859.eurprd02.prod.outlook.com
 (2603:10a6:10:469:cafe::45) by DUZPR01CA0053.outlook.office365.com
 (2603:10a6:10:469::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.23 via Frontend Transport; Wed,
 18 Dec 2024 08:27:12 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB3PEPF00008859.mail.protection.outlook.com (10.167.242.4) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.15
 via Frontend Transport; Wed, 18 Dec 2024 08:27:11 +0000
Received: ("Tessian outbound 7762b28e8285:v528");
 Wed, 18 Dec 2024 08:27:10 +0000
Received: from Lf16dce637394.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A3A9DCC4-E6F2-449E-94A1-79937F7EC93B.1; 
 Wed, 18 Dec 2024 08:27:04 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Lf16dce637394.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 18 Dec 2024 08:27:04 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by VI1PR08MB9981.eurprd08.prod.outlook.com (2603:10a6:800:1c5::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Wed, 18 Dec
 2024 08:27:01 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%4]) with mapi id 15.20.8251.015; Wed, 18 Dec 2024
 08:27:01 +0000
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
X-Inumbo-ID: e776cee8-bd19-11ef-a0d6-8be0dac302b0
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=KgbXF4X7SiQ+gglKiw+44YuOqJpiTn7upw9VXnoJGt/a+EJedqm7vdVA73LtWi6pqSsSO5uQHaMe0jZhg6/LmhzVD2stMhqXczgAG85OEYROV69+GpsC38m+TRCD0dG15NwGWsfIT7z+K5eEwEp+ceKvrWGiw2XNzOb1CgMCKMiMsdDjZbrjV7I+9WBeI3pmagODVQZsQhYk5m3RQ0mRfAkKAJY3V/Hg1bqkL6aGCsGG9zerb0Vw3eEeZavMBro85dIBjJqzTS1mZobsGIrM5lBDJpImWZi0qNIJFGSInr4r8tXATWtlgN6MDJh5mg4D25KIgqe9tahKx78mdG5QXQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=toBtqezZ82CRFAR74FnNEi+z7c7elFH7reaWejHxzdU=;
 b=SQn326/4cHdM91RrGoTaxEjbfinsYiVQw5+iu0PA5aYBQMNzhL+8TbIioz0Kkly3lYSxHK0I3lGpVGGG/KOer2NvgrnWa4MT9HS4G7TE0/JJKfTSjtanraHKADqhAmBZCxfriargxlXd5WtADkILzZd+9NkYN6P8F5rRRhCFYp3tRhLxx5iUCVQmHa/SRklNV1LO1V7xXMF7roOSy48JMiz/38wMolzH/l/BWpGaoszg3ogbz7iRTWTXBMvlK4XF+etSco/8p91o9PT51L2C4DCeqNFb8y2ub7nl3zyxJ4xQV1nAcJHQYRlExjfXNqdrl4OoPAnKeEME6XsyNVtB5w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=toBtqezZ82CRFAR74FnNEi+z7c7elFH7reaWejHxzdU=;
 b=prP3GsI8iZ99X6k5z4YEd6y7It/lUn5FhKoBRXGCiR5GT+g18L5diiW+evLnZgtPdMqJlwphejVRzz1JxEFmRihh00PtJJw8H2ugFI9t8Pmc4DAQH1zcl2bkAleLCyuQWuxz7XB7OZWkun+Eew/kqf0m4G8+79OpzW/8ymY5q4g=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1d5e4208821c43e0
X-TessianGatewayMetadata: qz4jRF9RsteyhxIxTjYqkm2G2ec5WDlF4akHeo+nknBje+1TE4Zu8fpADJqEui4UhbLPitvDByNTEYXMRmBbzEx25vHob84WJf+RofmXrVBuKf2sBDTtckrJod1x9LRZ9eyVYJu05LDpnc55fh0iH2GRgwnKaVXminQQsm1Zt5c=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZwVsIRgu2vTgfqLenXMU1NaGBGscxguhWtNs3N8z+mwVw78f9q8/7E4fiA+s4hu8xfs000U4x2d+c2Y3/VDVX1JQ3VHUHd/LJkR+BUplTqxG/LbQ0RrvTD/ejU8G5QhgYxr1ummbE/zMy75K57E6k7yHJqvipV7HJe9EcPbVjS7FU9h6cjRUnkoon0avZZ7oulFlHoMeBDjQiTVCJhPSN+SXaeKfFgA7YJV0F/T/OxeEFxLWkT01BRwH2WTJ4X7LrFmVvsS3QdbX2teMIn4/YU0JVHshJzoWYH+JDroR6C8XjBSnkWSmIh6Y+4kgTARlTeD8jR8jZAU/8jmWmab49A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=toBtqezZ82CRFAR74FnNEi+z7c7elFH7reaWejHxzdU=;
 b=OWGKE1mBKIDML20lkJuF7E/bWf5x4MKLagNwzlt/hW1mk/eZ0dvinuOU2er1iN7Jbv9RaC4ixCbkaEBsHHgIJZJLRc6J/p0nQWafxpHCpyL8JJfIjddj3ifL52CJXFE4sodsljknCOvS3OgU44ckTucsSoMhlgBzJHSJuVuWn9wU+iY8DptXElBMyTUb0XvURIrMphHEMUEcK9dhKSIx0rKDc2uQ70VHlwr81vMSRNSkPoGf1dTLdUC0md9ENg+oTW64h0IIwI0An0YeOs5Z6WaN6xvL9273DxaF9gPDmpb6oBES2ycRBvqBy43V5RH/gc5XLi5n9jInIqVGWhpLiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=toBtqezZ82CRFAR74FnNEi+z7c7elFH7reaWejHxzdU=;
 b=prP3GsI8iZ99X6k5z4YEd6y7It/lUn5FhKoBRXGCiR5GT+g18L5diiW+evLnZgtPdMqJlwphejVRzz1JxEFmRihh00PtJJw8H2ugFI9t8Pmc4DAQH1zcl2bkAleLCyuQWuxz7XB7OZWkun+Eew/kqf0m4G8+79OpzW/8ymY5q4g=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Michal
 Orzel <michal.orzel@amd.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Artem Mygaiev <artem_mygaiev@epam.com>
Subject: Re: [PATCH v2] docs: fusa: Add dom0less domain configuration
 requirements
Thread-Topic: [PATCH v2] docs: fusa: Add dom0less domain configuration
 requirements
Thread-Index: AQHbTMiRgWsw6YUipkyfuZOmy7e9xLLrs5oA
Date: Wed, 18 Dec 2024 08:27:01 +0000
Message-ID: <779AFC45-3F8C-4065-A39E-9325F9C72AAD@arm.com>
References: <20241212190325.2130129-1-ayan.kumar.halder@amd.com>
In-Reply-To: <20241212190325.2130129-1-ayan.kumar.halder@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.200.121)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|VI1PR08MB9981:EE_|DB3PEPF00008859:EE_|AS8PR08MB10170:EE_
X-MS-Office365-Filtering-Correlation-Id: 915e162f-5d36-40e2-9edc-08dd1f3dc4bc
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|1800799024|366016|10070799003|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?/WHQQB1VOx1pqCG0bj3HV//kzOj28jVSO3vM1+s4zMo64SETEc7qZJ1Jahkg?=
 =?us-ascii?Q?8igULc2DsEGutYrVOlZZB5n2KUnIBHE3/WZH4Q2Q1JodjuqDta5O2GsTfUzq?=
 =?us-ascii?Q?W+08pNfM617eThHYwalSUO1kgronhWX+h2d34IqmYlZ+5ZmcgQ8W7Aa4QqFX?=
 =?us-ascii?Q?cSfCe284ETMGK8WkIEUQ1TBHvWu8TpHANDbvb+lvk/sCKTatKPDSLKPTxDvi?=
 =?us-ascii?Q?+QC7cVEcyPh5VnBU84bLMXBWjbbJBvlByBXtpzjXVUNTIfx8mTSfSgVnzzCN?=
 =?us-ascii?Q?JgmBU+9ZM4R7X07Pj/L+5GqnQ+RGPAUZ8jpRZYsyDjBWruR7nf2XbLJcvVdd?=
 =?us-ascii?Q?Cqoipyau7L7CmfQujROvIMnWxz/arV4c2ay85U05t5TpDkByaN/VMkcI6GXG?=
 =?us-ascii?Q?G2FS5zRF5rQ8iIFdJ2xtrF7upl5YFCleaaudtghCCgGqg3k8e8V0uJoWwWIL?=
 =?us-ascii?Q?EbX3O5o1LIzeL+JytHwaLLn31yJNox+EBg9P3cBiWS778eTvsc38kmglhZwX?=
 =?us-ascii?Q?O5iRh1SXn8HFdJfPIVzIYb9MNu3YnrgcKo5MgaYwGh9m1aqbsn9cVjoRGBY8?=
 =?us-ascii?Q?92OX8K083sNRs43BS/eJsB7mswnWoBRMA8japqQ5eZycIz6nhjsMzRx+yclZ?=
 =?us-ascii?Q?Az9h1pXB/G5QsMgxXA15RZzsilLfWAUKkiUG7WKG++VdJuVI0QOgpQ7gELp2?=
 =?us-ascii?Q?nuQ1muouN/h1aMExtLOmkeNVwmmIubFrvX0WmpsgJOGmrQKJQx1tYK7zJBvJ?=
 =?us-ascii?Q?nslmy1O7dNg5AV4GeNsxQhHMBUxW1vzDe5pUO0b6wNu9zWWQoIVRaiftUW2K?=
 =?us-ascii?Q?8q0ts9ClxiqwFvFqJw/ez7SoLYKJWI3KWlbSlNIw4axBb/SfvUo1a2FXk8TD?=
 =?us-ascii?Q?gxb/iaBLAJ5sMfyzrF4edUivzVsyF9EAgsDv/gBhJp57sUP3Dflxt/hmOnhE?=
 =?us-ascii?Q?4xG5ZZgX/QkewJEO4VLJP0LriG6P3hk8zErQzFifKtwwtffQl2gzGWjVQDcQ?=
 =?us-ascii?Q?BjJHrl4W3oy2i6ILje7pdMJLxkVIf/+hGmhByveVbhcrE7KeN4v3pUG23sI9?=
 =?us-ascii?Q?sANZPCeCRcB/nws0RUQhyjhU4JxDlXzfxi5Ws3EvHdC/IsoAm54WUZ8i6tQW?=
 =?us-ascii?Q?icdZzOydyoe3j40B4x0791eeuXkTTrjU1/o3PSd2lp1hs4ECjRFkNGdJYxV7?=
 =?us-ascii?Q?KfjrI8nNB4x+8r1u5VwNgVhFYoi4LI8sASxVJiFZJY8gAfpdJ6WR3R52jWvZ?=
 =?us-ascii?Q?MK3DWaKMhx4Sy/dAi8aUk/6Q7AAYQZMa1imQ1Lp2jRwKIcLjYR4ptBF/ro4e?=
 =?us-ascii?Q?0fHE70N+miojNyD/GQeA2Lr1/eiJViYU1fzhy1Xlr9l9lrFKhee7P8HLZYw5?=
 =?us-ascii?Q?Nv1p2R1/GjPgB5UO5wEflIVN8Ju2Y4IlXtC0517rGoClPDCnjQ=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(10070799003)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <C53212F8EEFE7149921B1B80A872685C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB9981
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:25a::24];domain=DB9PR08MB6588.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB3PEPF00008859.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3a1148a2-e6e2-469b-746c-08dd1f3dbf1c
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|36860700013|1800799024|376014|82310400026|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3uNhSt0tpOL4HE2c5XWBPFcp90FmsoESN1d7V7V5EDRN8UtT2mLVYpVbUAHd?=
 =?us-ascii?Q?w/KkowaB834iSiGmgYBuKLdh7xAQAdYnUkgnACsm8bzXJF/O6OJknGRVKH4j?=
 =?us-ascii?Q?aDahiSo3U3HY/ldvkKTWQndeX7cFouAePDbDubXLXv/A8+2UvfCg8UK6W8T0?=
 =?us-ascii?Q?MJzNTRvvCOf84vTGrBPeqe3PumHbEAB5nk8XeO4loWG8Xxu9RXumDdOIhOAS?=
 =?us-ascii?Q?t+uxWwtwEylSAmvdW/hlOXxkX5Q5jQi7daTWjecvZoebMOf7ejO1Y1XKFFMR?=
 =?us-ascii?Q?FPOfMUYMGBm74s8AIzQEbyoqN/jkulzgO2Vf7MgL88suGW5FWMDMPUxuSatI?=
 =?us-ascii?Q?JL+lakWoT79bGa0XFdQwqdvLGnO9YDBZnubU2uZM7TuC1hzxtOWdEpPUuWfP?=
 =?us-ascii?Q?6Ck1DtOZgvOXchd7NA1pSie/bRkdTnhZkpkrKz0kcHF5Fglo5aq7cNsqfW/G?=
 =?us-ascii?Q?rbZJ+p5Xr1IHWy21rMhgjoZlVj9QZGX07qAX6JnWasndYv5M4YNw7D+bVZYf?=
 =?us-ascii?Q?BetnzOCytW7XVMskmGU1cADV0LGmSMI0ZnduBrBQXkjzdZBpAyEcZ4X5R2sf?=
 =?us-ascii?Q?IkhVrOaWqq2QcHoqxVPenQBtvp2nuXVJ+MrYVLc3wdh9bz5ITP7LpG7Gsh0U?=
 =?us-ascii?Q?k6WGEGV1rl1gDFw2MbYvKaIfAUEK/ZXqJUZWilhz8uhqRTP1/MgfvcZFcefV?=
 =?us-ascii?Q?XFszPT9V66rbHZc5JC7U10vWFR0By6M2TLE+zY2J3k2Twt6hwnxyyKrb9Xuf?=
 =?us-ascii?Q?OsRV8sSf+f3Hn1m52PPq/KqjKOrob6PWXSAuRsCErh3z5OI2dzeooIY5ieIr?=
 =?us-ascii?Q?vHUzlIyyObAfm6Cfzxsk3Hrdhy3IOvur5a9xdiK3KXnBmpPsZnPsLQaDmv9H?=
 =?us-ascii?Q?lO0XT89Q+acylJKWQZzQedIM4PQ6X4pzNf1+tMRDmGT2samVc+X2BeweAPTT?=
 =?us-ascii?Q?9HtISGg1IvMvM8/fiV/Y0ZO3kAvt5JOtcXoLFj/kv6eLN/7O/YcA4vncGKDJ?=
 =?us-ascii?Q?gBEczklaQ/9GkHX580UxdD7XuLZtBvlVrKLsrVoaEeUrtsT8jLhQOJeJ0KiZ?=
 =?us-ascii?Q?yGJO41l26QyLOSDf7KrIEQftpXkKsgrH5fExgT4GEUVz5Z9mJ1/qpP5+gV+H?=
 =?us-ascii?Q?6C4QxAJNMeTpHdnEKJuJnG8QMq9J5xboFKb80gMDfOZ/n5Df0c6tXe9M5/do?=
 =?us-ascii?Q?XojRuqZDrd0teRXKrnD4a1B4x8gwqFOjqbhkPkc4rLw2IzJnOwW7x9xT5l0k?=
 =?us-ascii?Q?/iR2AEMg0YuPh2VMRjWWVRBwoToCbtj/ZiryH+0LJ8pvaFDLbfyMlJ8DS0by?=
 =?us-ascii?Q?teUKux4xm7GgzutKqNTf2PRLSN1eDs1v4P6TXUBHnnr5CfFegXQd0hvSPLRL?=
 =?us-ascii?Q?VwVIFeg5mNXCUG5B0A4tYFQvAziYBpPaIm9TgdXQe3U37H0lbIWzk6AjJ90A?=
 =?us-ascii?Q?mtQfAoZ3mcADkpr2c7gVcNykAS6SGjsDrr59Brd3DQBb0/IrEPNCiA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(14060799003)(36860700013)(1800799024)(376014)(82310400026)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2024 08:27:11.0327
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 915e162f-5d36-40e2-9edc-08dd1f3dc4bc
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB3PEPF00008859.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB10170

Hi Ayan,

> On 12 Dec 2024, at 20:03, Ayan Kumar Halder <ayan.kumar.halder@amd.com> w=
rote:
>=20
> From: Michal Orzel <michal.orzel@amd.com>
>=20
> Add requirements for dom0less domain creation.
>=20
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
> Changes from v1 :-
>=20
> 1. As the dom0less domain creation requirements specifies the dt properti=
es
> for creating domains, it has been moved to product requirements. Product
> requirements define the interface Xen exposes to other domains.
>=20
> 2. For the requirements which introduces new terms (like grant table, etc=
), I
> have provided the definition as part of the comments.
>=20
> 3. Introduced new market requirements to specify that Xen can assign iome=
m and
> irqs to domains.
>=20
> 4. The design requirements will be added later.
>=20
> docs/fusa/reqs/market-reqs/reqs.rst        |  16 ++
> docs/fusa/reqs/product-reqs/arm64/reqs.rst | 306 +++++++++++++++++++++
> 2 files changed, 322 insertions(+)
>=20
> diff --git a/docs/fusa/reqs/market-reqs/reqs.rst b/docs/fusa/reqs/market-=
reqs/reqs.rst
> index f456788d96..47e1b6ad61 100644
> --- a/docs/fusa/reqs/market-reqs/reqs.rst
> +++ b/docs/fusa/reqs/market-reqs/reqs.rst
> @@ -47,3 +47,19 @@ Comments:
>=20
> Needs:
>  - XenProd
> +
> +Static VM definition
> +--------------------
> +
> +`XenMkt~static_vm_definition~1`
> +
> +Description:
> +Xen shall support assigning peripherals to various domains.
> +
> +Rationale:
> +
> +Comments:
> +Peripheral implies an iomem (input output memory) and/or interrupts.
> +
> +Needs:
> + - XenProd
> diff --git a/docs/fusa/reqs/product-reqs/arm64/reqs.rst b/docs/fusa/reqs/=
product-reqs/arm64/reqs.rst
> index db91c47a02..66f2978733 100644
> --- a/docs/fusa/reqs/product-reqs/arm64/reqs.rst
> +++ b/docs/fusa/reqs/product-reqs/arm64/reqs.rst
> @@ -40,3 +40,309 @@ Covers:
>=20
> Needs:
>  - XenSwdgn
> +
> +Linux kernel image
> +------------------
> +
> +`XenProd~linux_kernel_image~1`
> +
> +Description:
> +Xen shall create a domain with a Arm64 Linux kernel image [1].

This shall be rephrased to mention that it shall be a binary with a header =
compliant with the Linux kernel image format.
We do not want to say that we can only boot Linux.

> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenMkt~run_arm64_domains~1`
> +
> +Needs:
> + - XenSwdgn
> +
> +Gzip Linux kernel image
> +-----------------------
> +
> +`XenProd~linux_kernel_gzip_image~1`
> +
> +Description:
> +Xen shall create a domain with a Arm64 Gzip compressed Linux kernel imag=
e.

Ditto.

> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenMkt~run_arm64_domains~1`
> +
> +Needs:
> + - XenSwdgn
> +
> +Kernel with uImage header
> +-------------------------
> +
> +`XenProd~kernel_uimage~1`
> +
> +Description:
> +Xen shall create a domain with a kernel containing uImage header [2].

I would remove kernel and say binary executable and add compatible or somet=
hing like that.

> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenMkt~run_arm64_domains~1`
> +
> +Needs:
> + - XenSwdgn
> +
> +Gzip kernel with uImage header
> +------------------------------
> +
> +`XenSwdgn~arm64_gzip_kernel_uimage~1`
> +
> +Description:
> +Xen shall create a domain with a Gzip compressed kernel containing uImag=
e
> +header [2].

Same

> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenMkt~run_arm64_domains~1`
> +
> +Needs:
> + - XenSwdgn
> +
> +Kernel command line arguments
> +-----------------------------
> +
> +`XenSwdgn~kernel_cmd_line_args~1`
> +
> +Description:
> +Xen shall pass kernel command line arguments to a domain.

I am a bit wondering if this one and the following are not a bit to generic=
.
Should we say through DT or ACPI header for example ?

> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenMkt~run_arm64_domains~1`
> +
> +Needs:
> + - XenSwdgn
> +
> +Ramdisk
> +-------
> +
> +`XenSwdgn~ramdisk~1`
> +
> +Description:
> +Xen shall provide initial ramdisk to a domain.

This should be mentioning that it is provided in memory and the address is =
provided through DT.

> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenMkt~run_arm64_domains~1`
> +
> +Needs:
> + - XenSwdgn
> +
> +Memory
> +------
> +
> +`XenSwdgn~memory~1`
> +
> +Description:
> +Xen shall create a domain with specified amount of memory.

I am missing the where this is specified here ? i guess this is also DT

> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenMkt~run_arm64_domains~1`
> +
> +Needs:
> + - XenSwdgn
> +
> +vCPUs
> +-----
> +
> +`XenSwdgn~vcpus~1`
> +
> +Description:
> +Xen shall create a domain with a number of virtual CPUs.

number here is unprecise

> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenMkt~run_arm64_domains~1`
> +
> +Needs:
> + - XenSwdgn
> +
> +Credit2 CPU pool scheduler
> +--------------------------
> +
> +`XenSwdgn~credit2_cpu_pool_scheduler~1`
> +
> +Description:
> +Xen shall assign a Credit2 CPU pool scheduler [3] to a domain.

What is Credit2 ? this needs to be defined somewhere and in fact it
shall have product level requirements.

> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenMkt~run_arm64_domains~1`
> +
> +Needs:
> + - XenSwdgn
> +
> +NUL CPU pool scheduler
> +----------------------
> +
> +`XenSwdgn~nul_cpu_pool_scheduler~1`
> +
> +Description:
> +Xen shall assign a NUL CPU pool scheduler to a domain.

Same

> +
> +Rationale:
> +
> +Comments:
> +A NUL CPU pool scheduler maps a virtual cpu to a unique physical cpu.

This is a product requirement saying that Xen shall have a scheduler with s=
uch characteristics
and I think this is not enough to define it.

> +
> +Covers:
> + - `XenMkt~run_arm64_domains~1`
> +
> +Needs:
> + - XenSwdgn
> +
> +SPIs
> +----
> +
> +`XenSwdgn~spis~1`
> +
> +Description:
> +Xen shall allocate a specified number of shared peripheral interrupts fo=
r a
> +domain.

This is very ambiguous. What do you mean here ?

> +
> +Rationale:
> +
> +Comments:
> +A shared peripheral interrupt is an interrupt generated by a peripheral =
that is
> +accessible across all the cpu cores.
> +
> +Covers:
> + - `XenMkt~run_arm64_domains~1`
> + - `XenMkt~static_vm_definition~1`
> +
> +Needs:
> + - XenSwdgn
> +
> +Grant table frames
> +------------------
> +
> +`XenSwdgn~grant_table_frames~1`
> +
> +Description:
> +Xen shall create a domain with a specified number of grant table frames.

It is really weird to say that Xen shall create something specific without =
this being
linked to an higher level definition of the goal.

> +
> +Rationale:
> +
> +Comments:
> +Grant tables are a mechanism for sharing and transferring frames (memory=
 buffers)
> +between domains.
> +
> +Covers:
> + - `XenMkt~run_arm64_domains~1`
> +
> +Needs:
> + - XenSwdgn
> +
> +Grant maptrack frames
> +---------------------
> +
> +`XenSwdgn~grant_maptrack_frames~1`
> +
> +Description:
> +Xen shall create a domain with a specified number of grant maptrack fram=
es.

Why is this needed ? what is the high level req for this ?

> +
> +Rationale:
> +
> +Comments:
> +Maptrack frame is the metadata for tracking the memory mapped into a dom=
ain.
> +
> +Covers:
> + - `XenMkt~run_arm64_domains~1`
> +
> +Needs:
> + - XenSwdgn
> +
> +Virtual PL011
> +-------------
> +
> +`XenProd~virtual_pl011~1`
> +
> +Description:
> +Xen shall provide an "Arm PL011 UART" compliant device to the domains.
> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenMkt~run_arm64_domains~1`
> + - `XenMkt~provide_console_domains~1`
> +
> +Needs:
> + - XenSwdgn
> +
> +Assign iomem
> +------------
> +
> +`XenProd~assign_iomem~1`
> +
> +Description:
> +Xen shall support assigning iomem to a domain.
> +
> +Rationale:
> +
> +Comments:
> +
> +Rationale:
> +
> +Covers:
> + - `XenMkt~static_vm_definition~1`
> +
> +Needs:
> + - XenSwdgn
> +
> +Forward interrupts
> +------------------
> +
> +`XenProd~forward_irqs~1`
> +
> +Description:
> +Xen shall support forwarding interrupts to a domain.
> +
> +Rationale:
> +
> +Comments:
> +
> +Rationale:
> +
> +Covers:
> + - `XenMkt~static_vm_definition~1`
> +
> +Needs:
> + - XenSwdgn
> +
> +| [1] https://github.com/torvalds/linux/blob/master/Documentation/arch/a=
rm64/booting.rst
> +| [2] https://source.denx.de/u-boot/u-boot/-/blob/master/include/image.h=
#L315
> +| [3] https://xenbits.xenproject.org/gitweb/?p=3Dxen.git;a=3Dblob;f=3Ddo=
cs/features/sched_credit2.pandoc
> --=20
> 2.25.1
>=20


