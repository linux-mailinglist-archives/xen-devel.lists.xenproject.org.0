Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B31CA388EBA
	for <lists+xen-devel@lfdr.de>; Wed, 19 May 2021 15:13:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.130122.243928 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljM0D-0007hT-PF; Wed, 19 May 2021 13:12:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 130122.243928; Wed, 19 May 2021 13:12:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljM0D-0007en-Ln; Wed, 19 May 2021 13:12:45 +0000
Received: by outflank-mailman (input) for mailman id 130122;
 Wed, 19 May 2021 13:12:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=udgl=KO=arm.com=luca.fancellu@srs-us1.protection.inumbo.net>)
 id 1ljM0B-0007eh-Bs
 for xen-devel@lists.xenproject.org; Wed, 19 May 2021 13:12:43 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:7e1b::626])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0d111433-e209-4e0e-8f4d-4cd9960b0923;
 Wed, 19 May 2021 13:12:41 +0000 (UTC)
Received: from AM5P194CA0005.EURP194.PROD.OUTLOOK.COM (2603:10a6:203:8f::15)
 by DBBPR08MB5978.eurprd08.prod.outlook.com (2603:10a6:10:1f5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.27; Wed, 19 May
 2021 13:12:39 +0000
Received: from AM5EUR03FT014.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:8f:cafe::e3) by AM5P194CA0005.outlook.office365.com
 (2603:10a6:203:8f::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.33 via Frontend
 Transport; Wed, 19 May 2021 13:12:39 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT014.mail.protection.outlook.com (10.152.16.130) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.25 via Frontend Transport; Wed, 19 May 2021 13:12:38 +0000
Received: ("Tessian outbound 504317ef584c:v92");
 Wed, 19 May 2021 13:12:38 +0000
Received: from b70c10a0e2d7.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 736B3D62-D8D1-45A2-97A9-6B56A3A8EF36.1; 
 Wed, 19 May 2021 13:12:30 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b70c10a0e2d7.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 19 May 2021 13:12:30 +0000
Received: from VI1PR08MB3629.eurprd08.prod.outlook.com (2603:10a6:803:7f::25)
 by VI1PR08MB3758.eurprd08.prod.outlook.com (2603:10a6:803:bd::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Wed, 19 May
 2021 13:12:24 +0000
Received: from VI1PR08MB3629.eurprd08.prod.outlook.com
 ([fe80::5ca9:87ed:e959:758a]) by VI1PR08MB3629.eurprd08.prod.outlook.com
 ([fe80::5ca9:87ed:e959:758a%5]) with mapi id 15.20.4129.033; Wed, 19 May 2021
 13:12:24 +0000
Received: from smtpclient.apple (82.8.129.65) by
 LO4P123CA0156.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:188::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.32 via Frontend Transport; Wed, 19 May 2021 13:12:23 +0000
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
X-Inumbo-ID: 0d111433-e209-4e0e-8f4d-4cd9960b0923
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YvwwWGAEFt90ka/F0LiIrlodcOLwe4zL5M3dJ3EI4gU=;
 b=TYI8kD0B70LTUpUyHUTFAmpSjYHg81W2QhnYVFit6jWu/MW2ncu0nz4Rl7CkLJ0cVQS4zfsJL2+U8dvGSwFovFEfaxt6kHZ+S3dLv48vAiaDL5zyxsu2A3t5cPw9d3/wjBrI+dUyiChSlro+Iho8Q6gyedH7SIQdDMM6PWT8tHQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 04811a044d062e1a
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j2qqUDKgeq43zGnMCcb0uD84s/+IbcGr5z+AfA3fs+hkiPsUrqYl8gqAmxgMsQC806WlN2y4Lh80CHlXpHjmMnObIUF5+YFJ8L9ap1aUEC7v9TBFD6KZ6TaLhvVKUhlhV1JQ5vWf/vgDSR2d+HqB5+LMd+TS9ciqvrzhyaGOd0Ahu+gC5pGzq+Z8STfCygo15noAIKA7zBVJRCBG16o2uFYUBH4z1p+vRVYueMRJbRbmvwLIs/6hYFmZkK5kOjTvktADlls14VXa4EcbNIL3A8d1SrfU4VjZzLXrOBTJNThCqeedwvT1IwmcdSbKtHenYxGY8+l31o5c05k7+Tcjaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YvwwWGAEFt90ka/F0LiIrlodcOLwe4zL5M3dJ3EI4gU=;
 b=Pinw3VJTU6GccX2NbNYmZh9t3MhiVpxMi/Ss+CaYKGommpdhuaWWhIc2Qsy6pIFFdzG1B2MoOydA+giKhQt6Yv0y8r8xqym0iTKxp7PV3vXKkJ7lAOCv9SkqcZniYa3B6RKdtlNKMURi5cgVHIg0uXlShlKCnBpWncKQ+pcce+0t55/UNY26gnvkTA71HKOdaqYlHzVFpBA6dI01wdMvaP8ac8GGds5vagY9rwEuFQnFH1mQz8rKaQ5roikIa34W1JzrWx0pBNKclI4bK4DTmxFA8TF2UwSg1JwBqbQ+7og196e6WMIN6FXgzMC+a8dpbnj72xztGjVfbRfPkLlhHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YvwwWGAEFt90ka/F0LiIrlodcOLwe4zL5M3dJ3EI4gU=;
 b=TYI8kD0B70LTUpUyHUTFAmpSjYHg81W2QhnYVFit6jWu/MW2ncu0nz4Rl7CkLJ0cVQS4zfsJL2+U8dvGSwFovFEfaxt6kHZ+S3dLv48vAiaDL5zyxsu2A3t5cPw9d3/wjBrI+dUyiChSlro+Iho8Q6gyedH7SIQdDMM6PWT8tHQ=
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=us-ascii
Subject: Re: [PATCH] x86/shadow: fix DO_UNSHADOW()
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <cdee4753-674d-23a3-7b94-fed9f2bdd0c1@suse.com>
Date: Wed, 19 May 2021 14:12:17 +0100
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Tim Deegan <tim@xen.org>,
 George Dunlap <george.dunlap@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>,
 =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <601E0335-5A78-462C-A43B-0B8195CAB70C@arm.com>
References: <cdee4753-674d-23a3-7b94-fed9f2bdd0c1@suse.com>
To: Jan Beulich <jbeulich@suse.com>
X-Mailer: Apple Mail (2.3654.80.0.2.43)
X-Originating-IP: [82.8.129.65]
X-ClientProxiedBy: LO4P123CA0156.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:188::17) To VI1PR08MB3629.eurprd08.prod.outlook.com
 (2603:10a6:803:7f::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 022b8c2a-0329-43c5-c79d-08d91ac7c6ee
X-MS-TrafficTypeDiagnostic: VI1PR08MB3758:|DBBPR08MB5978:
X-Microsoft-Antispam-PRVS:
	<DBBPR08MB597879744FAD21EDE71DFF8EE42B9@DBBPR08MB5978.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 M/usEBZPruVMmgwmmvlFUeLXNwgHkv54EpVwHXayGdLljbul6vm5ofMMKxHog5VP6KXufF6cPrN41A/wsdZAqpspn6KHsCuBpy95lhyJJa/H4ib5WaJxP9BvFtn8AMU6+Oi6W2d5cgir1qcfLzvIbM9ZVDw07dIghrxPH1LSXeWmMioIYh1pTgH0Fg5zCljiXSvPachcriy/KeueInd8f7qsAG9VukXWMl8564k15C+RPfYpUYTh3tcq65XiGB5sc8DwyMrDS4+3hTpasGInfC39O9dhI2pl/0KusooUveaL1GOprkyr4Y52BbEupw0EIs7Jsq46BLHHvyPI6/CXkmXbWNwgTELd/LR6YEOiXD8GniyYtavKmQA6C0H8lnOwlk0b/FvS3zVKagHOfftsogz0xhyfOWAICjndKyW0v1QtBO5szTTd1iyHSY/mMMd/EpkrIm4G4VdmY2DgVp/JE2rDsTnX6CpvbZk1f/Rj26aw/gFI3+UnBkzfsaGTxBHNiItHyJzMlDTyHkeV9gfb7Rn0g2TiFhwQINh05PP0u+HvbpUIu5EOS1Qe8B+Ep9cCiddVRGQ7NSY5gd898PZ9wP/62J/spAybkJtrLeEzyttWxKIPc/V6hPc0yBJlvUIEuf6iNPu7Ey12NFIewh2glE0zd+mLKIdm3B1+PCS6tqyNFnq2e1e8MYbMrQrI5tzC
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB3629.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(376002)(346002)(366004)(39860400002)(6916009)(33656002)(956004)(8676002)(36756003)(2616005)(478600001)(66946007)(66556008)(86362001)(66476007)(2906002)(16526019)(53546011)(6506007)(38350700002)(186003)(38100700002)(83380400001)(52116002)(6512007)(316002)(8936002)(54906003)(5660300002)(6486002)(6666004)(44832011)(4326008)(26005)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData:
 =?us-ascii?Q?c1u3fWBKNgDKNzPo7/17YZUKWeUwMBCV7BDrXYFCPvIzmm0vWj2n81EXK4Ey?=
 =?us-ascii?Q?GKcADBfEn2lOgiIDEouvQrq6TeR89Oft63geDQijFjQEpS/882yUL36UXR/M?=
 =?us-ascii?Q?EWE6M2GjcyVrkH9vn1pXqyCXOvpDJpjBfwplo7eVd/N5XiF1V+YqW67ByL9B?=
 =?us-ascii?Q?hJQd1HRy5HwI6kAn4NvCRDDLEJHR/K03cT7tWVduDeYc6FbqS54zOcCZ9LDg?=
 =?us-ascii?Q?i2iF0DPxcuEgVJw6zrqOpX3EetgbVbPhhe8THfaz9tO8tbg69bcnDDbIuqn+?=
 =?us-ascii?Q?3K3zvzYzN6D/xoNN3OYFOJsK35hYAWDtuVFtxHG/TDrPqY19EwGoo3sBsQxU?=
 =?us-ascii?Q?Yi0+y9NZVRUivCQ8dtfzoFgtsvy1luI/wAR0FkoFZblxDgvcpTDcwmZuVx4S?=
 =?us-ascii?Q?Q7ljgEol4GoGxOwVgCneXoRVXhmCBsiVoqNWdgbBTHNOYekhLOfuao2Dz5Hz?=
 =?us-ascii?Q?guY56fHtmvgqzTjIVyPYI3GEor42bDcA0FUXrxGGrQxbMmM3C7tc6MFXpgic?=
 =?us-ascii?Q?Asol5RiJZfhha9Na+RkkDaNwVI8GnououAbqOw9HiEWTB45U9LbkNLmTXMn3?=
 =?us-ascii?Q?/JJGoYEdJwcW3/DSeG89du3H0aqY5Wz3XYFrY8sH11tN4jWA2hsWkD7Du/LW?=
 =?us-ascii?Q?rvzJIKQYTrK2xQCihBE1Ua+zMjUoC4fwaPFzl+9nJtv+5KGvOo2zo9tzz47b?=
 =?us-ascii?Q?zfITEnAoUdm1knvUCNmSxO1rsLvOITjDnX8Kr5qpR9EFFLUxvGV+7FHmntrY?=
 =?us-ascii?Q?+VsaVt1DSXYtlIPAimfsU4ah9GugeGGbtIDjoImcTa8hEGyBaDn5zfx2KJIr?=
 =?us-ascii?Q?W4j0C+W/fS9fI3oF6KZQt4abCpw5lA6yI1jbCpmvU6b2H0ThFEs7eEq7fw65?=
 =?us-ascii?Q?xsi/nS496IhsWRIvcZFeex2VwHaTNJ6bAyCxZsd1hEeIzgKN1AJtT0wTKD4g?=
 =?us-ascii?Q?S9d7YfH7fhDXFewzAwXsYl2H4EserVH3eKeZqdqgJqXh5O9jSCjfz9yp4TP7?=
 =?us-ascii?Q?OPxwROEdCZmKoXPicJgEKvYt14Fnhw4THtJ0FbeoRNXC8tVUXnpV5TuVcotn?=
 =?us-ascii?Q?gag3aGS5lZh+4l1kmfSbSUs+rlWtem+hNjuECZqf5agccf9ea+MtLG4dMr4j?=
 =?us-ascii?Q?NqiQiqnvo18xKvKfrKVZrQW3X18b34XVdlWsJpiBDpCcSxXz14ZOs7P7XL4G?=
 =?us-ascii?Q?LmS8ag4H5C7SNZgP3RiOA8faBUO5V243IBZRhp92S0oBbhj+BLcKV9gtRU22?=
 =?us-ascii?Q?Wk0D5M4UsxUsU44Qb8pG72KZUmnMuhymMeb9JFaXyqZrzTPJIOzXW8JyPsjy?=
 =?us-ascii?Q?JU2frIKuvHALuuhxDy5Fcku0?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3758
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a961e46b-2240-4e8f-8208-08d91ac7be4f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UlVzj3H6mvklHuzwMyC1yDy4X95ZD5xPGvi+0I8rS10y4F8Ogr8ShG4ITrjLf1jNZ27HbWnKVoF7tahyMpsPUmcxtuhP3neeoyhf5ZO+kyE3JS5vVHBQNHfOJSV1xY1J8Zw0ksYRVFJgl2RGYU8YgYTukGNipxkicYxxfgtT148Cmlp5lf0BuILXoLt8cU4DpsloaH83UpvcwiOYtziffsFbW/9ScXodX5WMZaElZakCw2apZvmHGzLJn0MGQ6nFJEWI+ARqXD2n9XRS5V8W8XiQZDElb/QB4ggzmLgawr5VDU3XURHOAMPGBIZ/EAoY1QnawRvBtvVOiG+h1Uuvp+BXOZFG2ogO2lhaf7Hru3oHxXyVFWVyPh4OOFwOzpbd+MqwJ+Jy0Ft1KMPAc7z6dKPJqu651zkU7Zp2KuRObboyLDTBmPdf9AWvYWRgTH0VKRJmOQ0CXq+JdvocyC1gcOUvKOMir93cfyXxVQW7LTS0vhGQtvVUmlnJFsmEitrjfuxfMbrNhB6eeC0hS6OhrYoH7WFNbYBoUeCj09Q1ticxqD93kNM2bvG+Fop0H6arDdW+NTxLOLm+kOEzT4ifUXr/h4qtfH7mc/Vd7IX9gDlI2PbgpyW9mxM0lRDluSyLYfUzIedF2HwQ4/s5cl9jvQiZfXWejKTFDgZJGF/PNtA=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(376002)(396003)(346002)(39860400002)(46966006)(36840700001)(2616005)(70206006)(186003)(6666004)(6512007)(36756003)(956004)(16526019)(70586007)(36860700001)(336012)(316002)(44832011)(107886003)(82740400003)(4326008)(47076005)(5660300002)(86362001)(6486002)(6862004)(356005)(8676002)(83380400001)(81166007)(8936002)(53546011)(33656002)(82310400003)(2906002)(54906003)(6506007)(478600001)(26005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2021 13:12:38.7397
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 022b8c2a-0329-43c5-c79d-08d91ac7c6ee
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB5978



> On 19 May 2021, at 13:36, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> When adding the HASH_CALLBACKS_CHECK() I failed to properly recognize
> the (somewhat unusually formatted) if() around the call to
> hash_domain_foreach()). Gcc 11 is absolutely right in pointing out the
> apparently misleading indentation. Besides adding the missing braces,
> also adjust the two oddly formatted if()-s in the macro.
>=20
> Fixes: 90629587e16e ("x86/shadow: replace stale literal numbers in hash_{=
vcpu,domain}_foreach()")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

Cheers,
Luca

> ---
> I'm puzzled as to why this bug didn't cause any fallout.
>=20
> --- a/xen/arch/x86/mm/shadow/common.c
> +++ b/xen/arch/x86/mm/shadow/common.c
> @@ -2220,8 +2220,8 @@ void sh_remove_shadows(struct domain *d,
>      */
> #define DO_UNSHADOW(_type) do {                                         \
>     t =3D (_type);                                                       =
 \
> -    if( !(pg->count_info & PGC_page_table)                              =
\
> -        || !(pg->shadow_flags & (1 << t)) )                             =
\
> +    if ( !(pg->count_info & PGC_page_table) ||                          =
\
> +         !(pg->shadow_flags & (1 << t)) )                               =
\
>         break;                                                          \
>     smfn =3D shadow_hash_lookup(d, mfn_x(gmfn), t);                      =
 \
>     if ( unlikely(!mfn_valid(smfn)) )                                   \
> @@ -2235,11 +2235,13 @@ void sh_remove_shadows(struct domain *d,
>         sh_unpin(d, smfn);                                              \
>     else if ( sh_type_has_up_pointer(d, t) )                            \
>         sh_remove_shadow_via_pointer(d, smfn);                          \
> -    if( !fast                                                           =
\
> -        && (pg->count_info & PGC_page_table)                            =
\
> -        && (pg->shadow_flags & (1 << t)) )                              =
\
> +    if ( !fast &&                                                       =
\
> +         (pg->count_info & PGC_page_table) &&                           =
\
> +         (pg->shadow_flags & (1 << t)) )                                =
\
> +    {                                                                   =
\
>         HASH_CALLBACKS_CHECK(SHF_page_type_mask);                       \
>         hash_domain_foreach(d, masks[t], callbacks, smfn);              \
> +    }                                                                   =
\
> } while (0)
>=20
>     DO_UNSHADOW(SH_type_l2_32_shadow);
>=20


