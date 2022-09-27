Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B245EBF3D
	for <lists+xen-devel@lfdr.de>; Tue, 27 Sep 2022 12:07:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.412466.655795 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1od7Ua-0007qU-GG; Tue, 27 Sep 2022 10:07:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 412466.655795; Tue, 27 Sep 2022 10:07:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1od7Ua-0007of-DK; Tue, 27 Sep 2022 10:07:08 +0000
Received: by outflank-mailman (input) for mailman id 412466;
 Tue, 27 Sep 2022 10:07:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a/4/=Z6=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1od7UY-0007oY-LL
 for xen-devel@lists.xenproject.org; Tue, 27 Sep 2022 10:07:06 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70081.outbound.protection.outlook.com [40.107.7.81])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2360344f-3e4c-11ed-9374-c1cf23e5d27e;
 Tue, 27 Sep 2022 12:07:05 +0200 (CEST)
Received: from FR3P281CA0072.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4b::23)
 by DB9PR08MB6474.eurprd08.prod.outlook.com (2603:10a6:10:255::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Tue, 27 Sep
 2022 10:07:02 +0000
Received: from VE1EUR03FT056.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:4b:cafe::47) by FR3P281CA0072.outlook.office365.com
 (2603:10a6:d10:4b::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.15 via Frontend
 Transport; Tue, 27 Sep 2022 10:07:02 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT056.mail.protection.outlook.com (10.152.19.28) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5654.14 via Frontend Transport; Tue, 27 Sep 2022 10:07:01 +0000
Received: ("Tessian outbound 7e4a920b87c0:v128");
 Tue, 27 Sep 2022 10:07:01 +0000
Received: from f3b91cef4d80.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2D6A9716-8E51-41E9-BEC2-F01D9148CDCC.1; 
 Tue, 27 Sep 2022 10:06:55 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f3b91cef4d80.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 27 Sep 2022 10:06:55 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS8PR08MB9693.eurprd08.prod.outlook.com (2603:10a6:20b:617::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.26; Tue, 27 Sep
 2022 09:51:03 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::10bf:2915:c966:b45a]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::10bf:2915:c966:b45a%3]) with mapi id 15.20.5654.025; Tue, 27 Sep 2022
 09:51:02 +0000
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
X-Inumbo-ID: 2360344f-3e4c-11ed-9374-c1cf23e5d27e
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=CCW/8NlgE5GasuyNJ7//NH/bj0ObbyyDqRpnlFQB6XAr5Du547DULeZyRu2FsN24waHLkKp+AIwEWzxZ5kBY2uh6jtmodoiH3B9QKYze2VXeW9eXA+MaeCmqwkC9io2RvnexUbMHXMicMwaTQBHfbvA3s3x31Mb8J50Nx1rfWJVo0r4f0htzdm709g6nbOpXco5SOAs2YyyLMARHiXrY1HbOz7/uuaA+5MmYEvPqkC3AdJN/cm5JrxV9ttOj3upinyNvde7/cgx/oGTR/ZK3NLQBvJBgV5AIQGyMbq+l+5ysobdFH3oDb1nd5+ewjw6dBL+f38UHcyK+YQ3SdybUmg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Go3MPMRwpXFKHo+ehy+CQzA0SeVKJ6rqZoPaAo0mcU0=;
 b=dXmtUlIkrNWWRRbPAxDY/L1RIJhrPhfGAFioqMJC8pGUvVien7r7pVcZDmF8jOGUaS6oA9zjfbji/rbyxgm+Fyui7js8Qzv8qLq48CDwrORVv5Dc2/lEsq8VYnSPodGF7AB4Xv1A5V9rxD/iH5K4EIJBd80d1IFfW3VwyeRfPDnxnPKw9i/PLt+qaWcsIVY4uszP7sMlvIhAob7FoAt4Q6883mijQEnkn+0uNqE4SVvWQFFstquEm891sqi6RQrHIUBXxrRFnzWl63JfX1yWThMI59tsqdUoH6C4E+KhcEEa1SdvZ5+Uytnm3XGykGv3LdMvhtm6VBKxcihjlop1Zg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Go3MPMRwpXFKHo+ehy+CQzA0SeVKJ6rqZoPaAo0mcU0=;
 b=KFfGj+zgCcBmc6bkXMUbuW/Yw5i8p7lSKocW3h/6r1vbTy+zMtdVsL9csnBsSAKsUYir+oqrpo7atT2sMX8qzUPdVicqW7h6MwDffEJOWkbaUfCFrhmmRi8TIu124Z6Kn1VjwFMtdK0K6He2zJKf0r4FxaJMgdHPN0YVKKnWC3g=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fa4N6CWF7UybnPdHVKKiiXXpX3WZOh1zXjoMNZzUAOPczEgdWD/bkdex7Ga5d6JXhv4VwYQmkgKjrXF/c8M79eX3TJS/tvaK/Zbn3p0q5CO7b2Te8iXUamE9KDjmjSvH0IX1CU+BMGw6UI4e4bLupTKciwXlCTS0FSrSdajtJScLx8Go7Ya4x9w2QqLH0JP2po+0G5J/tJolJZr8Nu/zOx7rjyBagDjfqZjK+aDIgE7fenTOi81KNEqTwGGcgzQm9jhPoqyluRVcmxJSGETQw670AFdsJozC8ggFRrnJBls2+xhfYNwZKA44HE56h7VqJSavzF9irTpXPuQB9K3T5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Go3MPMRwpXFKHo+ehy+CQzA0SeVKJ6rqZoPaAo0mcU0=;
 b=n2DYbQRahc7iY3cyPQIzfqshUdAsHQVCkpow1LNCyYmdDdNhRKAE1MRL5e2KyIWGNwmk58xpFCDfoXgyfTMCGUoQFwwbDKez8McbMN41LIH/skKt5T2qTOX5FgKloshReP/fykKQ3trOZHqZG5MTLXWM4paggN31j2hyQs76Li/bxG9skyafDE2uTdcviagkPU/o0K/U6jmii18Glb1j4UzUaWBJhAiLtmBlUUAlEdu4OOs+bMiqTMNB7KwxDM+TTK9um6Es0KarpyJUGLbLqF/8TOuQNUg24mojf331XrXbhVDFEkWwqSXF1pR15ES3bGu7lDj+U8k4ROWelbyAkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Go3MPMRwpXFKHo+ehy+CQzA0SeVKJ6rqZoPaAo0mcU0=;
 b=KFfGj+zgCcBmc6bkXMUbuW/Yw5i8p7lSKocW3h/6r1vbTy+zMtdVsL9csnBsSAKsUYir+oqrpo7atT2sMX8qzUPdVicqW7h6MwDffEJOWkbaUfCFrhmmRi8TIu124Z6Kn1VjwFMtdK0K6He2zJKf0r4FxaJMgdHPN0YVKKnWC3g=
From: Henry Wang <Henry.Wang@arm.com>
To: Michal Orzel <michal.orzel@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Doug Goldstein <cardoe@cardoe.com>, Stefano Stabellini
	<sstabellini@kernel.org>
Subject: RE: [for-4.17,PATCH v3 01/10] automation: qemu-smoke-arm{32/64}.sh:
 Fix typo in DEBIAN_FRONTENT
Thread-Topic: [for-4.17,PATCH v3 01/10] automation: qemu-smoke-arm{32/64}.sh:
 Fix typo in DEBIAN_FRONTENT
Thread-Index: AQHY0lY1F0Uwk2EhR0quzgKaLW4epa3zCDUw
Date: Tue, 27 Sep 2022 09:51:02 +0000
Message-ID:
 <AS8PR08MB7991784D2298C426BB3C2F7E92559@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20220927094727.12762-1-michal.orzel@amd.com>
 <20220927094727.12762-2-michal.orzel@amd.com>
In-Reply-To: <20220927094727.12762-2-michal.orzel@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 7346AABF8DDDCE4FAF8850D6EC0C550F.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AS8PR08MB9693:EE_|VE1EUR03FT056:EE_|DB9PR08MB6474:EE_
X-MS-Office365-Filtering-Correlation-Id: bcdc5a52-2274-4124-947b-08daa07005c8
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 +4Y2ep9OHHS6zRlWAqS1h/P6Q1NzyPC7zElBWcLcZJ/FQnDknYzp02RT+/RHsjEnwIVmgPPM/EgtJQMazGMBbchFdcJ+1wd6wkBZaELIha2sxiG80QPZhxP9OI1bBwhFUUYpdMcylwbhEbhZzMT7nypNsZsnGxSoEV6+vGk2f10xTcU5NfXeiITCfs0QxpHB3Q1LYf6U3gpTlPFf7sPPVwpwaJbReLBv+HNLO2QFP4tlIzvLPMF0s/0rVJcH7ThXPXhhGr/iq8JtTcQ1Ueyj+fMcnh5PWQNmgArxgWHuuwAK83uI4kOCFepWftUFjxTvZFHLEgGAw5xvwQy0JByPZnY8Q5b5VLMfnRv0fCQLZvWOYZORZ1dald6yC75J0NHK7UWKX0rLyMj06UamuByL6nfMjTpH6fJQIXxi76Ak7cPEDPvPwyciS3hyu6iGA+O63x27npU040sP3Zv9pFLzit/jXdTNzMbDQQRItFNX1NKdZbY5wSB7rlxiOLeQhOKEbTAN438wuKz4whbJS884rqh/cxnK0JobCkyuH3hrfCY5Z+H8A4cHj2zvFwEW2LOJKGPcE8/zlo4bxSHGJJWwoLk1unQWhQzWvGZIHGLTSqqYQVJdq5oYlIztzvXIhbBMqq7EnTZucndln3MkjB3J3+LmrjdBTLW+14rUeWGEBvicfQ3YZZCamZxHeo3NXEX/bwHb0l18m26aaP2GdUpXZLinMsNG62wmdluIezJuo7Px6EXaCJanyc75UAIE8QXeRq99h/GvPaQFsvA5bpLR/g==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(366004)(346002)(376002)(136003)(39860400002)(451199015)(66446008)(86362001)(64756008)(66476007)(66556008)(52536014)(5660300002)(8936002)(33656002)(41300700001)(2906002)(4744005)(76116006)(8676002)(4326008)(66946007)(110136005)(54906003)(38070700005)(316002)(55016003)(122000001)(83380400001)(38100700002)(9686003)(26005)(71200400001)(7696005)(6506007)(478600001)(186003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9693
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	50014deb-bb89-4261-dee1-08daa06dca1f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HmdD/subbuvxwyY5A2Oo+Qkjvbg6/FjmaVWHot4MRH7odzwEs8pEkd0fUHUOKlj3gBz4slgV5GmzHcZfOsvPaluwMz9jdkj3FQKd1ambFzTLHbZ016p97t13EGSvjzAo2AQHs5valilalm82LJAdW3gCJQeOYEi6dOhF+0Yp2HcDuVSKU4XaGp8hwlbtkyxr1xo5F7b+wJnNseNsCNqC0455zi6neirZ4Cvi5sg84Jq06AnANmwLMWgdwKGllg+t9NmZrTVJS92koBzfXNLA50Z4Bos5oyNfw4h43Sa7eUPQadS/YwH9n54awrvxdEKtffgSn0FOvXpRomt090/7X5iNf8qKxtGH7NE0s13FiT5TALoiefLD9nWwAZZh3O+0vIulgjjjFHKn7TGSG3bOoM3ndkXC5pfrLJ7sBSCv1y2deMLIYrE6IGG+Zq1+ACj3lwQ2qJ6tPuGQevFPAAvaxX2tXgI833fSA6RT+yfvn1nbyHH9K/+kls4TJ+2esPXFurEdaqumvqk5XaYY4DmgqNZVBaEZiT4cm58Kb3vOmbq3XU1/V4s6UZAZrYKpJUF3ymnnIEoDW+xsrcRrIU4CtJIErA9qlwnH7koUaHF0qQMW9q1pahKI26varK8EpQPYyUOVjITzhTjnbJkmtaeb/YccZxrHzEdB0f5hs7Vjm8Kn/B+1I/f6kXCPi2BF203rOtYLWHBA+eguW50Hv0O2UIcupDTrhEdOFbyGD6kWHz5ML2Y+zxbuk2jK/Mv1UgfLXVIgoBWWkeDgxrEHxyGHQQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(39860400002)(346002)(376002)(451199015)(46966006)(40470700004)(36840700001)(70586007)(186003)(6506007)(4326008)(70206006)(8676002)(336012)(47076005)(107886003)(26005)(54906003)(110136005)(82740400003)(33656002)(316002)(5660300002)(356005)(7696005)(9686003)(2906002)(4744005)(55016003)(81166007)(8936002)(41300700001)(86362001)(40460700003)(40480700001)(52536014)(36860700001)(83380400001)(82310400005)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2022 10:07:01.9065
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bcdc5a52-2274-4124-947b-08daa07005c8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6474

Hi Michal,

> -----Original Message-----
> From: Michal Orzel <michal.orzel@amd.com>
> Subject: [for-4.17,PATCH v3 01/10] automation: qemu-smoke-arm{32/64}.sh:
> Fix typo in DEBIAN_FRONTENT
>=20
> The correct variable name is DEBIAN_FRONTEND and not DEBIAN_FRONTENT.
>=20
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> ---
> CC: Henry Wang <Henry.Wang@arm.com>
>=20
> Rationale for taking this patch for 4.17:
> Setting DEBIAN_FRONTEND to noninteractive menas that we need zero
> interaction
> while installing/upgrading the system via apt-get. It accepts the default
> answer to all the questions (using apt-get -y only works for "yes"/"no"
> prompts). With the typo not fixed, we might get stuck in CI jobs.
> The risk is very low as we perform pre-push testing using GitLab CI to ma=
ke
> sure the changes will not break the pipeline.

I have no objection to take this patch for 4.17, so as long as you have the
R-b or ack from CI maintainers, you can have my release ack.

Kind regards,
Henry

