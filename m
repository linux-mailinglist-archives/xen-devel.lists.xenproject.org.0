Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC4664672E
	for <lists+xen-devel@lfdr.de>; Thu,  8 Dec 2022 03:44:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.456759.714564 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p36sR-0004K2-P7; Thu, 08 Dec 2022 02:43:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 456759.714564; Thu, 08 Dec 2022 02:43:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p36sR-0004H3-KJ; Thu, 08 Dec 2022 02:43:11 +0000
Received: by outflank-mailman (input) for mailman id 456759;
 Thu, 08 Dec 2022 02:43:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R/A3=4G=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1p36sP-0004Gw-JT
 for xen-devel@lists.xenproject.org; Thu, 08 Dec 2022 02:43:09 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2060b.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::60b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0b2a6b08-76a2-11ed-91b6-6bf2151ebd3b;
 Thu, 08 Dec 2022 03:43:07 +0100 (CET)
Received: from AS9PR01CA0040.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:542::29) by DBBPR08MB6137.eurprd08.prod.outlook.com
 (2603:10a6:10:20f::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Thu, 8 Dec
 2022 02:43:03 +0000
Received: from AM7EUR03FT021.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:542:cafe::84) by AS9PR01CA0040.outlook.office365.com
 (2603:10a6:20b:542::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14 via Frontend
 Transport; Thu, 8 Dec 2022 02:43:03 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT021.mail.protection.outlook.com (100.127.140.243) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5901.16 via Frontend Transport; Thu, 8 Dec 2022 02:43:02 +0000
Received: ("Tessian outbound 0800d254cb3b:v130");
 Thu, 08 Dec 2022 02:43:02 +0000
Received: from d69d59d0a853.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DE05313D-8E09-45BA-AE39-355F33D6D299.1; 
 Thu, 08 Dec 2022 02:42:56 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d69d59d0a853.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 08 Dec 2022 02:42:56 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DU0PR08MB9462.eurprd08.prod.outlook.com (2603:10a6:10:42e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.11; Thu, 8 Dec
 2022 02:42:54 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1245:e53:a5ec:66fd]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1245:e53:a5ec:66fd%8]) with mapi id 15.20.5880.011; Thu, 8 Dec 2022
 02:42:53 +0000
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
X-Inumbo-ID: 0b2a6b08-76a2-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6auQQt+vUZOtnURhAJ9WwXyhmnCWx3oEh2d9RSClWxU=;
 b=wDcHCnMIbhMeVx5yyraWRyb0RW0pBcTAyD3tAZrlu12NXjZQ+S4MzgVvI3VCxxl8y2gMnFNbGtRBoArZyVqA6DU0JOPwXjj3USM0M0HoRK44JbBKfhGEe1FshPp8KMl4/EyB9flR7c116ALa+UUbp7Ro5zKAgEPPbga9DgSh2LA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T6cjR303sEm1lCK9hsfpuxUUmMwLfCIMGKwwCybJk/993nTPM66HwSFOF52tqJpUhcoPYwa9+OZjLP9Cjxk7z8UmjDbGzoScKtdZbHyQZ+m5Monu/xa+zW5RuKl2tNr7+rc/rK0OPI0s9FMJ7whlHOSCKoZyMFMd65cW9mYl9W8WTYRprmXkPNl6grXmWOdYEQUHRP/7EInywkSPgrDUH9TSL3EU/aRTUPN0NjiDvggb8rCiAMzQenYf9bPvHQ5wC56sFv2EO3iniHuznjc4hYogh6YqPDrXqo2xREEjM4Ws6DF4PSFjBcFvzsTMyBt3yDvAH+/lzckFqtKkgOQ5Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6auQQt+vUZOtnURhAJ9WwXyhmnCWx3oEh2d9RSClWxU=;
 b=b0uQOsPMD3q+wG8EKGbH167kzJnoL+1nDPK2BPZNwLD7vYHoDsvLufo3Hpty9qQWr19uiVe4Z2Zxyaas6JPvrCpwZPpBFpE8ZmO1L1d6zLKen3QWgMiWLE8maVMFRc1lL1rjqllq1w9VorblF2mfGM4R7kL8otzMw5e1oRTEOI0jw+9b0Z5G8s9hwnAAydrTiuAwMbkDUi+lxeDbqMLBGSgN5ZNVPfgA8l/NbKnCxKFe1TQ1ucdKyGt2lvSEwvOXfRkbzBVdmWGbWdbDm+fj1I6EZd5JwqOgoytNS1EFwGd+5LQClAudvdw/ZpMU1nXxl0W4oiSoC/W+SS5uhb0hHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6auQQt+vUZOtnURhAJ9WwXyhmnCWx3oEh2d9RSClWxU=;
 b=wDcHCnMIbhMeVx5yyraWRyb0RW0pBcTAyD3tAZrlu12NXjZQ+S4MzgVvI3VCxxl8y2gMnFNbGtRBoArZyVqA6DU0JOPwXjj3USM0M0HoRK44JbBKfhGEe1FshPp8KMl4/EyB9flR7c116ALa+UUbp7Ro5zKAgEPPbga9DgSh2LA=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei
 Liu <wl@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH for-4.17] SUPPORT.md: Define support lifetime
Thread-Topic: [PATCH for-4.17] SUPPORT.md: Define support lifetime
Thread-Index: AQHZCnZsv+8PKKoBH0mt4ztR2VHs5a5jSHfg
Date: Thu, 8 Dec 2022 02:42:53 +0000
Message-ID:
 <AS8PR08MB7991FA0A2F1A326527E9AC4D921D9@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20221207195907.23606-1-julien@xen.org>
In-Reply-To: <20221207195907.23606-1-julien@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 12E2EF9BE2791642B9CAE714436A631E.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DU0PR08MB9462:EE_|AM7EUR03FT021:EE_|DBBPR08MB6137:EE_
X-MS-Office365-Filtering-Correlation-Id: 67ebb3c9-d23c-45a0-4186-08dad8c5ed2b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 RtIqqvV53p8g9V7cuLXd5PCwc/gRGZMtSCnonQkqdi4XViWLy8QiyKdscpZKpe7CtdOSgt21tcEk3L3mUr1mFaFgdgaINQjIjRptZuhOxHcrlGVI6MKz9KPvqafS5dzMpMI2REV9wn/agJpRp0hCkjuHKpN67ND1X4rPsDp1pnjTPDvoLZHmcwjhVoPbnmhCrDJHL8rO97qbJcg8A385bmfy7NKkOScCQfOl5j3hvoSh5uee0FG48gLB3ZjaWAAMN/4+A9R+vM3g0DY6TPuempggOkuam3Jp4Ulgnonf74XvUEGNDacRT8kaedxMSrTc4sSzhGO4NZte82EeYL75e3hqf3h+pdWA/4u1RA+hWNM0W7Mn88bWuf7+r7ZdGtFmLbE7hsjcKwYRTidztAefjKBvuxVWTNA0D0rxSzZcAc0GvM6OylVquQ+J1h76tz1fGGjrLvZ7DJwc1FYsPAXSxP4/hTT8YBc/iO4YSDjYIl+N15aYh9rNfgpZvqqy/uR0Bp72LuOevQiJZ+Neor7tn+Xigk0NNf7E9NvlREwGEhNkJc5ZtTEY6f6mHYHrm7+wk8WmtkniiBTTwge87TsJh5P5HlvgfE06acIwUOwXFgEHxdn75Nx8x2Al6iDOBfAkV3e0laaHXAo9f/6kYHTyFGm5Wr01mnyYaA8xhKOVYXgEnvGVmGF/0CJNJ9G49wPAtuN2liCSgOp/hvMtuy04Ww==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(376002)(39860400002)(366004)(396003)(451199015)(9686003)(7696005)(26005)(2906002)(6506007)(86362001)(54906003)(38100700002)(55016003)(52536014)(83380400001)(5660300002)(33656002)(110136005)(8936002)(316002)(186003)(71200400001)(66556008)(66946007)(66476007)(66446008)(558084003)(76116006)(478600001)(4326008)(8676002)(64756008)(38070700005)(41300700001)(122000001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9462
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	41b3a22a-b58c-49f0-7b05-08dad8c5e7f9
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IrHbt7zTjsPb6mDc+L1Y86w+56z2hkcqHpzIK4i7m8oA9rNC5TkZVswkLJqn9jsWd8BcHf8bNcFwIVQOQoyIC3VJq3YwNqJolar2UAstyGKmTiRUgLmVQXoOpNuRBJUWYH7ME+RoEgke/DvtGCU42GWCr86x1Pe4jPPhgQSZ/7YSTCUVZiZ0f6c7iABezCiuPupprdSsSKM30Gxx0uTo5bI0ge4Q/mIeWQ69UuD1ABOgntt2B8zFaoZg04A2AOOwDXrTDpjpubN9B1+MHtLNxV1oYDro3id9yT3vXGI8//PRKCBhaD6zJi/qtfXYdh4WHYga8pXAN5no5lO0Tc9C0aKRmrvBO7jpJ5wXgVL/OZFlka2ZU6AUOZuqcAxz1uYj1abeqWLcz6AQI53JEV1e/uTaqGybSYMl/fLyElLlnIiV9rHtgmsJBcPKOcZOTMJRndmVFVH3mTRdrWVmUR4JszdlY6nQngaJDkZZ6qtzxIedMum1DsKQznkaIgV1DOdA/sYSwTUlwJUf+4ksnfxzATHVhtYaJpqM8uTWB5nxQgevql18nLHFVakVq8XVAuN+8qMN6LwAIUpHuFgjmMyF4MSD5KbVQkAMxT81YDv6OmHS9HaAY5puEq5CUvG6PSq2hd//HrYeVVGjJoDxfsKcAHE5l+1rFQwE7D2sqgLtbFXtcHpIT7kIhFhBzzAbza2QVhxbmsguqadhbfVNkYleUA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(346002)(39860400002)(396003)(376002)(136003)(451199015)(40470700004)(46966006)(36840700001)(2906002)(40460700003)(7696005)(478600001)(6506007)(26005)(186003)(9686003)(55016003)(82740400003)(33656002)(81166007)(356005)(40480700001)(336012)(82310400005)(36860700001)(47076005)(558084003)(86362001)(83380400001)(70586007)(4326008)(8936002)(70206006)(8676002)(41300700001)(5660300002)(110136005)(52536014)(54906003)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2022 02:43:02.4913
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 67ebb3c9-d23c-45a0-4186-08dad8c5ed2b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6137

Hi Julien,

> -----Original Message-----
> From: Julien Grall <julien@xen.org>
> Subject: [PATCH for-4.17] SUPPORT.md: Define support lifetime
>=20
> Signed-off-by: Julien Grall <julien@xen.org>

Release-acked-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry

