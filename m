Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 437495309E2
	for <lists+xen-devel@lfdr.de>; Mon, 23 May 2022 09:19:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.335517.559694 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nt2Ls-0005ze-4C; Mon, 23 May 2022 07:19:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 335517.559694; Mon, 23 May 2022 07:19:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nt2Ls-0005ws-0L; Mon, 23 May 2022 07:19:40 +0000
Received: by outflank-mailman (input) for mailman id 335517;
 Mon, 23 May 2022 07:19:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eb4B=V7=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1nt2Lq-0005wj-SD
 for xen-devel@lists.xenproject.org; Mon, 23 May 2022 07:19:38 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on0610.outbound.protection.outlook.com
 [2a01:111:f400:fe0d::610])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b3d5a195-da68-11ec-bd2c-47488cf2e6aa;
 Mon, 23 May 2022 09:19:37 +0200 (CEST)
Received: from AM5PR0201CA0016.eurprd02.prod.outlook.com
 (2603:10a6:203:3d::26) by DU0PR08MB7737.eurprd08.prod.outlook.com
 (2603:10a6:10:3bf::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.18; Mon, 23 May
 2022 07:19:35 +0000
Received: from VE1EUR03FT063.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:3d:cafe::37) by AM5PR0201CA0016.outlook.office365.com
 (2603:10a6:203:3d::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.22 via Frontend
 Transport; Mon, 23 May 2022 07:19:34 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT063.mail.protection.outlook.com (10.152.18.236) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5273.14 via Frontend Transport; Mon, 23 May 2022 07:19:34 +0000
Received: ("Tessian outbound 42cead292588:v119");
 Mon, 23 May 2022 07:19:33 +0000
Received: from 58f4032245c7.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 326B7388-F97C-4974-811A-EFB1883F75C1.1; 
 Mon, 23 May 2022 07:19:23 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 58f4032245c7.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 23 May 2022 07:19:23 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by DU2PR08MB7312.eurprd08.prod.outlook.com (2603:10a6:10:2e7::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.20; Mon, 23 May
 2022 07:19:22 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::d007:5582:9bbe:425e]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::d007:5582:9bbe:425e%3]) with mapi id 15.20.5273.022; Mon, 23 May 2022
 07:19:22 +0000
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
X-Inumbo-ID: b3d5a195-da68-11ec-bd2c-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=WLDOOew1wHYqr98/tzkE2OJ+jpShoAm+sY4PVGqJaVqgVnUnajqNak4WT3HtrO+eKAUY5ITbx+ClPs3H1CuAezIfsM3CRg3kmNW1WsHaa7i3OcTqJmpw9JUUBfqfg6LwA0rJniEAxtCYPeEKFzsDuSmly5hifnYwfmNTV1javr0EB16rlypBNmHtSnW9ezNj24hfJYZEBq9AhSc7MTWvK7ujSzD8mpeN1ErDgl6IMFhCy3UPsbhKwCGEX/xkKm6wc4ZRGGiW5fjUNHuGY48BF15oQV3E0nlPofHMCbY52RrWPGEgdsFQFhxaI3bg/RnbC/DhotdNELkpD3/3SgXU1w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tjP7EIVAkBtTHUF8RX62iJa4V70bhXyRSs0SPfDbKE8=;
 b=eiuifb7wLuJjmkwNbLBJySShAo9M+U9gfpXfHgQ+b4H6/DiGwm5VcmDE75kuVYakgZBXMKMzN5tD0/YIT8Bp8bSD4L+7V6VBUVE9fJd8IWUVGKEBz++35XLe1UpKZLdxX7f6JKDbZXVuxaTZab5XOCMc2KzIoiFqU6ho2dHImxHvHeYoACt0N3vyJPcWaFiVjNvLIgVy4DrfJgb6erbQpPvbau98Nbno8MLMoSwuGBHYN9Ym70aFanCav5q106U4NDKVG6Vdnc8H2Z1GYxndbVz3ZWt3EZoHJgyyvP1JDbAyrM326tnkA7ZS4Z3lnPzgYUv8GzPND1RG3jWu/5/rCg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tjP7EIVAkBtTHUF8RX62iJa4V70bhXyRSs0SPfDbKE8=;
 b=BMXpXSZcYC1yRUqBVRtRgnryV3QaQRDYMjWEUpD6Gk3CMaOtyX6lcYsK98yX8ceL2yrzEI4P0wutSY9eGhAmdkWawYIJtBgo2JRHr/JH/Yfv+j8zW7jISBz4AuX4pOxh4uDQWIiwAGq4Zj+fmsh5zwbUm5FgJyXOMRp8EQcXkm4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hiArrzuzXUe6l7zjYZLDfmUVseLhW0oZ8a270n+CMRG7zT/dcxR6/hOCkralwTJfH8ukb2LJInYHH84OOCCUmpMfEh1YBjxU7AyDC6hhhCKbFpTm3Tb9dHBXdf7vq3yRN866ASPbQm5dt9ozat+n0ATtMblsitpaX1Mg877imKu1It2Gao0vwBDiEYmRYgQiGvHdAWk+JG+BRgHB5yqwqYohteavaTYb4uV8dRCOoyy5OMvqDr7ofVEZ8Mny/l38cknMU2z29Jm4EkYu2FSp9TMfZNMJUVrrzO3n+1v2uwGPxtr8wjfi/MK1IFM4MEpa0DyhOCT3a3esSFr7iqN8pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tjP7EIVAkBtTHUF8RX62iJa4V70bhXyRSs0SPfDbKE8=;
 b=KY+3QggHvrvGOlMi/hQxVg3GQQxLtgIvQ8/nt+tDluAZe1LWgQ2HmuDvKST0Jv5X9ZVM1X+zStGVSc24yMUOchWcoQfp9ylIA2BSeW7HKTL9ruZLBEv0DH0gTbb9WCNqq1gPvJxz62+01FwjN5/dS1QynnLEzJLX2f9/TeRDI8wDgLWrRrAB3L51voOh9UBZKQ/yZ9eChPzH2TDQCNtmJ5thmD38llXqM5VFFhpUf7ILBFbDODBSbZFehJObsLA7EdZjDjTITfu3OG4RoqAPIWBOjA02CDG8+RDz12Ihokl1Sjw+2lrb8h2Z5/I//0qN0u3Ol6/a9E7Vg+bCm1rUZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tjP7EIVAkBtTHUF8RX62iJa4V70bhXyRSs0SPfDbKE8=;
 b=BMXpXSZcYC1yRUqBVRtRgnryV3QaQRDYMjWEUpD6Gk3CMaOtyX6lcYsK98yX8ceL2yrzEI4P0wutSY9eGhAmdkWawYIJtBgo2JRHr/JH/Yfv+j8zW7jISBz4AuX4pOxh4uDQWIiwAGq4Zj+fmsh5zwbUm5FgJyXOMRp8EQcXkm4=
From: Wei Chen <Wei.Chen@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: nd <nd@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Jiamei Xie
	<Jiamei.Xie@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v4 1/8] xen: reuse x86 EFI stub functions for Arm
Thread-Topic: [PATCH v4 1/8] xen: reuse x86 EFI stub functions for Arm
Thread-Index: AQHYbm35zG4dPV1xEEaM1LzUwkDv8K0sC4oAgAABzdA=
Date: Mon, 23 May 2022 07:19:22 +0000
Message-ID:
 <PAXPR08MB74200558A446E4CEC9FABA709ED49@PAXPR08MB7420.eurprd08.prod.outlook.com>
References: <20220523062525.2504290-1-wei.chen@arm.com>
 <20220523062525.2504290-2-wei.chen@arm.com>
 <4254847c-3364-d0c3-5e32-66a12a200ed2@suse.com>
In-Reply-To: <4254847c-3364-d0c3-5e32-66a12a200ed2@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: D86E11DC46D8CD428F2928E713734816.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: f0f7e4f8-9fdf-40c3-84d8-08da3c8c9673
x-ms-traffictypediagnostic:
	DU2PR08MB7312:EE_|VE1EUR03FT063:EE_|DU0PR08MB7737:EE_
X-Microsoft-Antispam-PRVS:
	<DU0PR08MB7737F324F352E24654B510459ED49@DU0PR08MB7737.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 kBKM+PnMfqsr0BVf87P6rsmgaLFEJUAv1mmtw2nH/7gxkj1T5MTfCrtYjeR9074p66mfNPjiO5ISu8lG6am/HKHZN0lLyAcMAvJP6uw4AR1ykpxosoPBlSJnpiwqb+WsvKaXrxbtzBW0BH2LDP8o9+nrkDhzjn+Zl+XAtzlRdZ169iMjZBkVzrumX5Mzt6xiz814LO2eowF3Pauvg4J/9JpVbX4TNSsRvhlg9jO7K4HbBd6drHuM83FUphiwWtNrIq2ueFqPZjPyG2fQZX6UlDy+kj35mpYX8Q4VD9FRdv1bZrT+v+tjadDxAZ9F1wkE75c1F/JkIQD8w5xyH0EyIj+3nddhy3pIvCJmqQp+6Zi2aPTNC0SKsTC1mqgKL/Yc3lEiuFiHiPXFZW+C42OUsTxUl84OdKGMuEFS9cFb77ic2j3YEfzSDu5I1GQHK0p8dihtdSx2CaB4ExjUlsjU9w1a9BN72FTYEVkiMBZmknvv5E+80DmKAEKHZvs0AGPxtHdaf0u7fLbx1pySLeo0j0HLoiI/+DZUDrbGUQYdzj1y/5cztOVqSCxAkL5MWb6brCF62Cc3FTnRdOCFAG1V3S3lrtjGychrj9PFhUn5TK5CvAowx5K3500wKdZuPrbAlDaJCYXx5KNjTPmgj35fXJpo0+ykGw3y0+4G182k2F/E2JSPNDOWQoncjqy9As3dvPONQRT30cjO5r3yaIQ1hQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(5660300002)(316002)(55016003)(122000001)(8936002)(7696005)(52536014)(508600001)(53546011)(8676002)(33656002)(4326008)(83380400001)(64756008)(86362001)(186003)(66556008)(54906003)(71200400001)(38070700005)(38100700002)(26005)(6916009)(66946007)(66476007)(6506007)(76116006)(9686003)(2906002)(66446008);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB7312
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	970eeb61-e05f-4d35-37a8-08da3c8c8f37
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HPDx81gd+y8eY8Erdh+etsqG/eS5tlDVZJxOJsctCiZsu89I3tOfgU/kv2jZxOh2SeFZCtJPeFgdwUli6Jz08W3Be3wxjxUiRP3jlfHbSKFSB/l21BiJ65PUh5f37cI1VezfeuEjeGcErTpDtHVmJFVHpsHFImp+rymiJ2++P7bBu3M9PcW4PMnyC5gHy9vh/eNLWIAPX6QtxLADX14wcP90ZWasJBZzPRH5u1TvsYEKevr5hmowEUPztdUkMrl8GY9/mPuUSGK8dZOegpHlRiANgu4zyb+McEdHySIfhPVWVSwj+txwmQ7S318xHF/Yov6eGzj98DudWz/ANg+viw4nh2eVx3lB9nPi8MxlLyP3yHRzQEmoWJpVGQPmK3iwe9mdc4l0A4Ni2nPQFV6uemmmX1lRnOFA8cVKM66D4lYdCNYV8Wn+p/Iq1p9emgqNdRLId64FILL1fsm/80vpzihbMMGyzVsfPFAjk/eSUUJ4KkUIH9/OVrcK00GYQSzoIgUkWkKSvad617aMvAMa0fIZasQXNomRTaIkbiljfYXQ8gF82Oj7v03nQBqahazoWcPYUwcOSetw7690Cr+RGByHqUstpjw1P9whm7xKPCVhg23B/eVHTp5fxqXr87PHIaDs1xhdZRzSpUirKLQ4YlfJMjzuvqIdaElELtaEl5z5z8s/JQTt26C1MAGe4pO6
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(40460700003)(82310400005)(33656002)(7696005)(53546011)(54906003)(356005)(81166007)(316002)(8936002)(55016003)(186003)(9686003)(70586007)(52536014)(70206006)(26005)(508600001)(5660300002)(2906002)(86362001)(83380400001)(6862004)(47076005)(8676002)(36860700001)(4326008)(6506007)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2022 07:19:34.2493
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f0f7e4f8-9fdf-40c3-84d8-08da3c8c9673
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7737

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU2VudDogMjAyMuW5tDXmnIgyM+aXpSAxNToxMQ0K
PiBUbzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+DQo+IENjOiBuZCA8bmRAYXJtLmNvbT47
IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47IEp1bGllbg0KPiBH
cmFsbCA8anVsaWVuQHhlbi5vcmc+OyBCZXJ0cmFuZCBNYXJxdWlzIDxCZXJ0cmFuZC5NYXJxdWlz
QGFybS5jb20+Ow0KPiBWb2xvZHlteXIgQmFiY2h1ayA8Vm9sb2R5bXlyX0JhYmNodWtAZXBhbS5j
b20+OyBBbmRyZXcgQ29vcGVyDQo+IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPjsgUm9nZXIg
UGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+OyBXZWkNCj4gTGl1IDx3bEB4ZW4ub3Jn
PjsgSmlhbWVpIFhpZSA8SmlhbWVpLlhpZUBhcm0uY29tPjsgeGVuLQ0KPiBkZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY0IDEvOF0geGVuOiByZXVzZSB4
ODYgRUZJIHN0dWIgZnVuY3Rpb25zIGZvciBBcm0NCj4gDQo+IE9uIDIzLjA1LjIwMjIgMDg6MjUs
IFdlaSBDaGVuIHdyb3RlOg0KPiA+IHg4NiBpcyB1c2luZyBjb21waWxlciBmZWF0dXJlIHRlc3Rp
bmcgdG8gZGVjaWRlIEVGSSBidWlsZA0KPiA+IGVuYWJsZSBvciBub3QuIFdoZW4gRUZJIGJ1aWxk
IGlzIGRpc2FibGVkLCB4ODYgd2lsbCB1c2UgYW4NCj4gPiBlZmkvc3R1Yi5jIGZpbGUgdG8gcmVw
bGFjZSBlZmkvcnVudGltZS5jIGZvciBidWlsZCBvYmplY3RzLg0KPiA+IEZvbGxvd2luZyB0aGlz
IGlkZWEsIHdlIGludHJvZHVjZSBhIHN0dWIgZmlsZSBmb3IgQXJtLCBidXQNCj4gPiB1c2UgQ09O
RklHX0FSTV9FRkkgdG8gZGVjaWRlIEVGSSBidWlsZCBlbmFibGUgb3Igbm90Lg0KPiA+DQo+ID4g
QW5kIHRoZSBtb3N0IGZ1bmN0aW9ucyBpbiB4ODYgRUZJIHN0dWIuYyBjYW4gYmUgcmV1c2VkIGZv
cg0KPiA+IG90aGVyIGFyY2hpdGVjdHVyZXMsIGxpa2UgQXJtLiBTbyB3ZSBtb3ZlIHRoZW0gdG8g
Y29tbW9uDQo+ID4gYW5kIGtlZXAgdGhlIHg4NiBzcGVjaWZpYyBmdW5jdGlvbiBpbiB4ODYvZWZp
L3N0dWIuYy4NCj4gPg0KPiA+IFRvIGF2b2lkIHRoZSBzeW1ib2wgbGluayBjb25mbGljdCBlcnJv
ciB3aGVuIGxpbmtpbmcgY29tbW9uDQo+ID4gc3R1YiBmaWxlcyB0byB4ODYvZWZpLiBXZSBhZGQg
YSByZWd1bGFyIGZpbGUgY2hlY2sgaW4gZWZpDQo+ID4gc3R1YiBmaWxlcycgbGluayBzY3JpcHQu
IERlcGVuZHMgb24gdGhpcyBjaGVjayB3ZSBjYW4gYnlwYXNzDQo+ID4gdGhlIGxpbmsgYmVoYXZp
b3JzIGZvciBleGlzdGVkIHN0dWIgZmlsZXMgaW4geDg2L2VmaS4NCj4gPg0KPiA+IEFzIHRoZXJl
IGlzIG5vIEFybSBzcGVjaWZpYyBFRkkgc3R1YiBmdW5jdGlvbiBmb3IgQXJtIGluDQo+ID4gY3Vy
cmVudCBzdGFnZSwgQXJtIHN0aWxsIGNhbiB1c2UgdGhlIGV4aXN0ZWQgc3ltYm9sIGxpbmsNCj4g
PiBtZXRob2QgZm9yIEVGSSBzdHViIGZpbGVzLg0KPiA+DQo+ID4gQ2hhbmdlLUlkOiBJZGYxOWRi
MWFkYTYwOWQwNWZjMGMwYzNiMGUxZTg2ODdjOWQ2YWM3MQ0KPiA+IElzc3VlLUlkOiBTQ00tMjI0
MA0KPiANCj4gSSBkb24ndCB0aGluayB0aGVzZSB0d28gbGluZXMgYmVsb25nIGluIGFuIHVwc3Ry
ZWFtIHN1Ym1pc3Npb24gKEkNCj4gY2hlY2tlZCBwYXRjaCAyIGFuZCBhdCBsZWFzdCB0aGVyZSB0
aGV5IGFyZSB0d28gc2ltaWxhciBsaW5lcykuDQo+IA0KDQpBaCwgc29ycnksIEkgaGFkIHNlbGVj
dGVkIHRoZSB3cm9uZyBkaXJlY3RvcnkgYWZ0ZXIgSSByYW4gdGhlIHNjcmlwdHMuDQpCdXQgdGhl
IHBhdGNoIGNvbnRlbnQgaXMgdGhlIHNhbWUuDQoNCj4gPiBTaWduZWQtb2ZmLWJ5OiBXZWkgQ2hl
biA8d2VpLmNoZW5AYXJtLmNvbT4NCj4gPiBUZXN0ZWQtYnk6IEppYW1laSBYaWUgPGppYW1laS54
aWVAYXJtLmNvbT4NCj4gDQo+IFdoaWxlIEknbSBub3QgcmVhbGx5IGhhcHB5IHdpdGggdGhlIEFy
bSBzaWRlLCBpdCdzIG9ubHkgdGhlIG90aGVyDQo+IHBhcnRzIHdoaWNoIHRoaXMgaXMgYXBwbGlj
YWJsZSB0byBhbnl3YXkgKHdpdGggdGhlIHN0cmF5IHRhZ3MNCj4gZHJvcHBlZCk6DQo+IEFja2Vk
LWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IA0KDQpUaGFua3MhDQoNCj4g
SmFuDQoNCg==

