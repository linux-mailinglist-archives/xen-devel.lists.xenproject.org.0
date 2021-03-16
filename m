Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A560133D605
	for <lists+xen-devel@lfdr.de>; Tue, 16 Mar 2021 15:47:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.98331.186474 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMAyP-0001dN-B7; Tue, 16 Mar 2021 14:47:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 98331.186474; Tue, 16 Mar 2021 14:47:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMAyP-0001cw-75; Tue, 16 Mar 2021 14:47:05 +0000
Received: by outflank-mailman (input) for mailman id 98331;
 Tue, 16 Mar 2021 14:47:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o079=IO=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1lMAyN-0001cq-Gy
 for xen-devel@lists.xenproject.org; Tue, 16 Mar 2021 14:47:03 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe0c::620])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5a120ad2-e93a-4ebc-b14f-42fbf4ec4ebd;
 Tue, 16 Mar 2021 14:47:01 +0000 (UTC)
Received: from AM5PR0701CA0069.eurprd07.prod.outlook.com (2603:10a6:203:2::31)
 by HE1PR0801MB2122.eurprd08.prod.outlook.com (2603:10a6:3:88::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Tue, 16 Mar
 2021 14:46:58 +0000
Received: from VE1EUR03FT050.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:2:cafe::16) by AM5PR0701CA0069.outlook.office365.com
 (2603:10a6:203:2::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.11 via Frontend
 Transport; Tue, 16 Mar 2021 14:46:58 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT050.mail.protection.outlook.com (10.152.19.209) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3933.31 via Frontend Transport; Tue, 16 Mar 2021 14:46:58 +0000
Received: ("Tessian outbound 26664f7d619a:v87");
 Tue, 16 Mar 2021 14:46:57 +0000
Received: from b7b27420c0c0.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 FDF15061-72CD-4862-B2E1-0D4E3C732977.1; 
 Tue, 16 Mar 2021 14:46:50 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b7b27420c0c0.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 16 Mar 2021 14:46:50 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com (2603:10a6:800:1ae::15)
 by VI1PR0801MB1661.eurprd08.prod.outlook.com (2603:10a6:800:56::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Tue, 16 Mar
 2021 14:46:46 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::5c93:6e79:8f1e:a839]) by VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::5c93:6e79:8f1e:a839%6]) with mapi id 15.20.3933.032; Tue, 16 Mar 2021
 14:46:46 +0000
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
X-Inumbo-ID: 5a120ad2-e93a-4ebc-b14f-42fbf4ec4ebd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=502hhquAsz4C6PePJ+D/1WquiqQ1u/qvKv1jDcf709k=;
 b=AWxLz9E8lFPy+HY6EVFkKEmWOxdAqbc/gu6AFSJVbydxQ+qYJbJ/ImIrXml9EyAv4dpKsiLPfFnQJndZhki/cscSAySKpKA1KlW+AhxEvYcv7ImG6AjZVs1bBxT5u4iloUfq15gWp/c+P6Yy8wbOLxEYKCEa/MAAoB8IU9+ysiM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 01b4c183cc878b8e
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dCux68JHLE9/txYFI8wl6rnyMh2VoWR1+TyNvlGyxRhxVadh3x0Ga1ERdmdSQpjH/LTpox+Y6kcXveG3YW7pNuh+yddrG7C7jCLPoXhNLi5gooxUt8P/l7dmVNG8Nob4Ceag5dKaLfD61jQCRdjsRTKIYXYAfWm+jViBJKCofydpvcp4EAMnPTNcmjxam/apEYCGpkT903A2a4oN5VAV1dkj1g38RDW4ZhxmsokDvLS9WcJRnOr7qIi8rD6k/lczGP3IhVjjLncPI04lUEbELj/dG3PSx8aJhKlTBd3ipis6V2syDOjolb76dmG5yQYUfjOPSdBqAQteyKOPDRSEMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=502hhquAsz4C6PePJ+D/1WquiqQ1u/qvKv1jDcf709k=;
 b=MYkbMM7P/KBCkR6x0K31PRGDTNF78ft9x6SaCqHlPlv6kWSFuNwYoJvsK9dMMH7tAzYOFOZ1E2JNGCzJBzf/0/BrF6g0a2r9vuIz4qasqZCt388FM7ADY+lxMojZhdLHPz7Fwkke9vG2GQKTc7aZCtg6iod5YDtIhMS7b/rGg7EhBX2Z7FBtML++n3kRbwGmnnyp2+KMowxEvat87iZFmI9YQtLRNAWMKNyKgv1OIT98Qk4lEu8laC1G4utXR0ieAzgqtjepXy+iWxB+PftZ58c0H7bDm2hpJhXuc/cFivNvlb3GJrz/MvSx3/Xe5yP4sppJ7hn0SRSX3OdnWR1xdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=502hhquAsz4C6PePJ+D/1WquiqQ1u/qvKv1jDcf709k=;
 b=AWxLz9E8lFPy+HY6EVFkKEmWOxdAqbc/gu6AFSJVbydxQ+qYJbJ/ImIrXml9EyAv4dpKsiLPfFnQJndZhki/cscSAySKpKA1KlW+AhxEvYcv7ImG6AjZVs1bBxT5u4iloUfq15gWp/c+P6Yy8wbOLxEYKCEa/MAAoB8IU9+ysiM=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2] xen/arm: Use register_t type of cpuinfo entries
Thread-Topic: [PATCH v2] xen/arm: Use register_t type of cpuinfo entries
Thread-Index: AQHXGYdqjLxhKB84IUOgt1y/chNQHKqGsYUAgAAAfACAAAFPgA==
Date: Tue, 16 Mar 2021 14:46:45 +0000
Message-ID: <1BBC6549-FC75-4644-A05D-0B79EE4D62F1@arm.com>
References:
 <7a6a8c5c33d13fb43f3777f046036b91233534d3.1615804612.git.bertrand.marquis@arm.com>
 <722ebf03-d037-de42-69d7-625f2ae13d2c@xen.org>
 <967f25ef-6d17-18b6-1eb1-763efd0882ff@xen.org>
In-Reply-To: <967f25ef-6d17-18b6-1eb1-763efd0882ff@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.60.0.2.21)
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [86.26.33.241]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0e2170b5-0b05-4614-5a0b-08d8e88a59d2
x-ms-traffictypediagnostic: VI1PR0801MB1661:|HE1PR0801MB2122:
X-Microsoft-Antispam-PRVS:
	<HE1PR0801MB2122EC5AF5271509CD23CBF59D6B9@HE1PR0801MB2122.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8273;OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 xHs+Hwgm8PqBP3GdEw+7dCqHubk3FPTernHiDZXmUkAIhzJNGyQtWe9q1uBdE3czQOXZ+CJc9FzijPOZh97+a3+LCvEtSQ44klkHm44CCzw46IZs2nim8BU8yXLaitaHW1iIPvMTCXBqnZK2C51pvbD6ys+kIR9rFd1l3FdgPaDZF7MwelatBqoOS9d2hOQxTsgZJXLzvGqgPsTeWUwpzqHVOPzAb//Jh5vsUiRz5tP8QPFxfHZ69898QBIoCz7KOiYEax5pCdWdVYNWlrMMMO79sQj1yekDCRMLguSWhfFfb9j2O2+IcDLtSIryKqSkBQDzA6IPumq3rr6ZB7opFCFHTPr+RLmZFrrUDuM5o76iDKycCB8DnU9qSPupIt7h6ryW2Dacu9PuwRZG/sBwM/GnPKEoPDF3pCn0mrIpR/B76hO8JhzqL8n+4vdPr02BEJ8AL9IOwmsJrL+Bv2tVJtbXaE3CWv1fWgrfwPNSxq250t0kZZEttN581EQipF/VunBSapoUOOwvrE31il8Vtq3KfxzJs5Ug1YN5a07tPMrkOeK6NJksafBpW5tmGY5xg8JegR7vnsgD5WcwkFFlHD1v39+XiwktYcCdasgVA8sfFuF5w+wnjCzq6UG7uCLD
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(366004)(346002)(396003)(136003)(376002)(33656002)(66946007)(91956017)(54906003)(76116006)(478600001)(2906002)(316002)(186003)(26005)(86362001)(6916009)(8936002)(8676002)(6512007)(2616005)(66556008)(71200400001)(66476007)(6486002)(6506007)(55236004)(66446008)(5660300002)(64756008)(53546011)(4326008)(36756003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?h/rVXO2p/JSW/5nFGk2XRJREaOugeAkdAXHlLDS2V/GlO1UvzJqqZuRsORhU?=
 =?us-ascii?Q?2gZ4HCzFMQcK6OApLx4qHNKVfxrNPox3brL+t1Pr41C5V48vojNNHYm/Vk6B?=
 =?us-ascii?Q?2xun1e00RRgnBOVD/kUKHcrX0QVuO1UouLEkbi7Vha6I6nmBwdDvrdXZ7RmS?=
 =?us-ascii?Q?h4CHKKFCBAYFAQgJ24S/5Zme9X8PnA0Y4llD4udHMuFOOqGcDdX0RlayIact?=
 =?us-ascii?Q?IiFdtFfOS3wl+Z0We/JbIlRXzXeJVCX/IFPXMv5llHedJknMMvx8ca6j5xwJ?=
 =?us-ascii?Q?CS4WtT+0Ul/W4XLAS4HczX3PDXKXpI0QlhzQupdqhl3Otar5c0jPWl15jMgH?=
 =?us-ascii?Q?IaYF989AwN57IdCafFlRkU+q32o6zdj30E8ytC/zDZyFbL28ctnqxhYTsF+U?=
 =?us-ascii?Q?B47M+7UNWqzRjQwszLnCZDmU1LfTxqXshyFeeNNqC182at+sF/rgSlKi3bf+?=
 =?us-ascii?Q?nharSyQ1GZkZByZKR+rluWRbTxW3d4Sf/bUDvjxYjL+RvsQtVA/6SQnpIGZb?=
 =?us-ascii?Q?ThAb6H8cgr6K5AZK+YQgXEQYDTa1SEz/7ZBbAPBUfl4us2YLjjgacvkJm7+S?=
 =?us-ascii?Q?yaE54XVvVvIpZSpKdlueHVRwDJGhgeceB4c2VobzjXGP3Lg2vgoqrkFExm9r?=
 =?us-ascii?Q?Ioim+L16vvukGmnSYb4DY3UqW8kRWaI9a0zlEsu1F9+CpeYUwS+3s7WC5uT4?=
 =?us-ascii?Q?SdGGX17UwzU8H8gcNRl/lPwWvgogE3w+zwqNaWXpNnVdQVxjZay2UoeP0Zwc?=
 =?us-ascii?Q?fxI5pOAsa+PiuTv8nZLwAF3Dn8GOwDFliJL8HyGnokbcMiHx+vMT9fXAi8EY?=
 =?us-ascii?Q?XrHh3/3k1D7yQ7VaN7CTE8LjzSp+Z0mwrMYXc5Kcvvo9ALIQhz28GFHzTEqi?=
 =?us-ascii?Q?8d48/5qxdJ2E+Hr9+Cl4WnLjvhej3eDpb0PjW9THi+A1lmUa5G5TsOrPd2Ku?=
 =?us-ascii?Q?UddUxI+IB3Ipfe+hqBxVlIs2QRz9nxOcTsLrl8k/McwoTiWSNdZum3HTMO+U?=
 =?us-ascii?Q?s3HI1IrVEDuD0CSvVXHbjmx+fqkNb2BQgKGP74VaADje0X+kkwoI6Y36EI3R?=
 =?us-ascii?Q?hijEcvugAMmx8bKvlaCwMZ+1bwoBhl+Q4tNDGhMZwqPa2/aUZIIe2+DAOqc1?=
 =?us-ascii?Q?/akqWQIL2FLNiE17/wGs8y1Z/jhQp/neluZUBwfS6Lo6FJnoa5Jrl4n+ndcx?=
 =?us-ascii?Q?8s0IyNguaBIQJIf8FX0tbCYR1ZbhUx1/Gl+k8tz5zvmkzmfklCn3NXJXXuxX?=
 =?us-ascii?Q?lgUQXWBcCdkttyFPKbukDkLcIAmLX/HAO4nk9GYNgjWFIE5EOBkamNJA06Ua?=
 =?us-ascii?Q?mRvCchcMgDBbG3YOvQ76Qi7x?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <43A015BAAFD184468D524DC397503D62@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1661
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT050.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	35acc52f-56d0-4a4b-7ceb-08d8e88a5284
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DryO+ggW8Txtq0YF+g65N1Pdls4VYwkxh0RB6tGD/PJD9OHVmY3c0HPFG2mO8SYtf7nD3ZCko+KHw0h1T4zx3W2kznbo4YNecsgORxvEbjNAgz9eGED0cN0NssnDOG4ZYQAcw0Hh6jibKa0p6PlyFtra8e9XeLBYinWPZo20EPHhde+nFybskBdEf9RM8r3jwSWnv85sv7DpkO6ebKO3d1Kt6K1VZ48cuoVB97LX+qtOX/REISdrgkJM5N+ipiGSoZr4xDsVyPPU5fFnHT/sav4uZDBdCXAnZXWiGHpQsiDh3eDEyyVNZoitHKV86/9Jx0+zmwHy9+eVhWE642iFmnE0s4RH7twg8XA+uSvEjvDdP5IYqT36ARX/nyLwjo3QLU3R79Cb7/W1M1CCeZEbkacQAZG+iioh3q5IyHTsGYQ8TWmFsExGqKLJP0tiFXnug+0NdIrB39Wk2WbEK/Hnk41RfmTGHZlHzBVFnts8Oz8tsottFqJIqSCzgdchLmDS/BoeKDx/pMLiWIOasvVgePKxZrGngEtAsnNooXpa1j8NU+p979Met6NR0DicpnFSn7oUJtW19qq8XhhDXkMXgWuv2/JHRjxNrByUy9VsE7NeZg9vJWEHpVU7Gs/s15DXQftw4Rw0UZjIKYbbukS72A==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(39850400004)(396003)(136003)(346002)(36840700001)(46966006)(6862004)(336012)(4326008)(26005)(2616005)(70586007)(186003)(36756003)(107886003)(47076005)(356005)(81166007)(82310400003)(82740400003)(8936002)(36860700001)(70206006)(2906002)(55236004)(5660300002)(8676002)(86362001)(6506007)(53546011)(54906003)(33656002)(478600001)(6486002)(316002)(6512007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2021 14:46:58.1744
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e2170b5-0b05-4614-5a0b-08d8e88a59d2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT050.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB2122

Hi Julien,

> On 16 Mar 2021, at 14:42, Julien Grall <julien@xen.org> wrote:
>=20
>=20
>=20
> On 16/03/2021 14:40, Julien Grall wrote:
>> Hi Bertrand,
>> On 15/03/2021 10:38, Bertrand Marquis wrote:
>>> All cpu identification registers that we store in the cpuinfo structure
>>> are 64bit on arm64 and 32bit on arm32 so storing the values in 32bit on
>>> arm64 is removing the higher bits which might contain information in th=
e
>>> future.
>>>=20
>>> This patch is changing the types in cpuinfo to register_t (which is
>>> 32bit on arm32 and 64bit on arm64) and adding the necessary paddings
>>> inside the unions.
>>> For consistency uint64_t entries are also changed to register_t on 64bi=
t
>>> systems.
>>>=20
>>> It is also fixing all prints using directly the bits values from cpuinf=
o
>>> to use PRIregister and adapt the printed value to print all bits
>>> available on the architecture.
>>>=20
>>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>> Acked-by: Julien Grall <jgrall@amazon.com>
>=20
> I have committed it to my for-next/4.16 branch.

Thanks

Cheers
Bertrand

>=20
> Cheers,
>=20
> --=20
> Julien Grall


