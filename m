Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E898533DB80
	for <lists+xen-devel@lfdr.de>; Tue, 16 Mar 2021 18:54:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.98441.186759 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMDtj-0004aa-KZ; Tue, 16 Mar 2021 17:54:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 98441.186759; Tue, 16 Mar 2021 17:54:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMDtj-0004aB-HP; Tue, 16 Mar 2021 17:54:27 +0000
Received: by outflank-mailman (input) for mailman id 98441;
 Tue, 16 Mar 2021 17:54:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M/08=IO=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1lMDth-0004a6-L6
 for xen-devel@lists.xenproject.org; Tue, 16 Mar 2021 17:54:25 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.1.50]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 82565abf-1c4c-400d-90b3-75cf495dad40;
 Tue, 16 Mar 2021 17:54:23 +0000 (UTC)
Received: from AS8PR04CA0130.eurprd04.prod.outlook.com (2603:10a6:20b:127::15)
 by HE1PR08MB2828.eurprd08.prod.outlook.com (2603:10a6:7:2e::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Tue, 16 Mar
 2021 17:54:19 +0000
Received: from AM5EUR03FT003.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:127:cafe::d8) by AS8PR04CA0130.outlook.office365.com
 (2603:10a6:20b:127::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31 via Frontend
 Transport; Tue, 16 Mar 2021 17:54:18 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT003.mail.protection.outlook.com (10.152.16.149) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3933.30 via Frontend Transport; Tue, 16 Mar 2021 17:54:18 +0000
Received: ("Tessian outbound de94f9ae513a:v87");
 Tue, 16 Mar 2021 17:54:17 +0000
Received: from e9fc613119e8.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C9305DE4-AD30-4604-ADE4-F2C89B67A15D.1; 
 Tue, 16 Mar 2021 17:54:11 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e9fc613119e8.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 16 Mar 2021 17:54:11 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com (2603:10a6:10:49::10)
 by DBAPR08MB5654.eurprd08.prod.outlook.com (2603:10a6:10:1a6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Tue, 16 Mar
 2021 17:54:09 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::5959:35df:3647:b78d]) by DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::5959:35df:3647:b78d%7]) with mapi id 15.20.3933.032; Tue, 16 Mar 2021
 17:54:09 +0000
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
X-Inumbo-ID: 82565abf-1c4c-400d-90b3-75cf495dad40
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l+MBN7cKfFPeJ9kNJiqi4ei7+ENVT3/uLQGPG91NxQ0=;
 b=RS8nyvMeQSfNV/05PO4hAeDbXDUgV0getXO3GtMehHYO9Nl2y8ZOVjClZcqvbh5jCOaqMzktVc2fBla1thGUV2eIqsrnHcxMtUugggtTRYGrN274AArvfqgHrsXArb+u2Ogi4BtNeJ4S8vTIt6ycEXb8CkWriKSQlY2iey+kC18=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: d80dd835a00bab58
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iTx4Qoh+CPi4DewnDYaWTDUocXpYamXqtHidmVy3zHi5AkJA4mnB6ZY7gyotRpRpvCE/8YFt3M+mLtmUbiWT1yOtMnBODvTIilL+6GMO5aeFmyswjfnjhP576OECnTQpA+QVDXJiLvc9+5l8vIOb3DLziU2toZd0gItTMtcS9P8BccV8b+y0Jgn8m3k08RRUD5rvcD+8TG68Iq6i36/3pP7sjEmDImVkc6XW+ulXNtJnu5X8f5frdrU2zAziqHDDYpAZ1WrC2K8HbHIijG72rze29YO3iRL9PTpQ2oeDTtLywzoMrfFy9xkayMBpYzXv/IGdSncd7RYJTlYJtvFp7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l+MBN7cKfFPeJ9kNJiqi4ei7+ENVT3/uLQGPG91NxQ0=;
 b=BBNlSWCHALzvk6+vcK3pYM5cyRZNSWSyxW6JXqRf8GvCRr6Lor/Gkp/Vf5Vr8timdhE+fXsk6NblANnGuyDq1Sbo9Mn3Ynr8TERDH15zA+NaEcyXz3gpBtaCoLt/rImmiFcB575I2OhfJgwZv19LGu66WE8clGoxzUjJgM3zbjymejm0ijrwd5BGmj2bo2+26WBZU7je51R9ciBJUatPCah6Qg6ePymN3mofXno5fs3A24ScQqvCNwDD9rWRCM+Dkn7VUB01qMYnZIB8hoWjuWjm9fJr2J+j6ekh+mgdDjaQiFzfnsCnK8mwubUMEZT7IblIRDVbtzYbDiOW1V0rTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l+MBN7cKfFPeJ9kNJiqi4ei7+ENVT3/uLQGPG91NxQ0=;
 b=RS8nyvMeQSfNV/05PO4hAeDbXDUgV0getXO3GtMehHYO9Nl2y8ZOVjClZcqvbh5jCOaqMzktVc2fBla1thGUV2eIqsrnHcxMtUugggtTRYGrN274AArvfqgHrsXArb+u2Ogi4BtNeJ4S8vTIt6ycEXb8CkWriKSQlY2iey+kC18=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Julien Grall <julien@xen.org>
CC: xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 5/5] xen/arm: smmuv1: Intelligent SMR allocation
Thread-Topic: [PATCH 5/5] xen/arm: smmuv1: Intelligent SMR allocation
Thread-Index: AQHXFRE3FfFdAlAZ8Eu9+88zMBZ+gqqGwk6AgAAuSQA=
Date: Tue, 16 Mar 2021 17:54:08 +0000
Message-ID: <1C808D23-E8F3-4888-86AD-C37FCBAAD0D1@arm.com>
References: <cover.1615312254.git.rahul.singh@arm.com>
 <789abfb57568dcbaba122ea9b68c627e6c9707c4.1615312254.git.rahul.singh@arm.com>
 <299c8294-5f76-2fd6-85ec-d20c0b99368b@xen.org>
In-Reply-To: <299c8294-5f76-2fd6-85ec-d20c0b99368b@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [80.1.41.211]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 77750f22-c552-4451-8b0c-08d8e8a48541
x-ms-traffictypediagnostic: DBAPR08MB5654:|HE1PR08MB2828:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<HE1PR08MB28280B8ED6DDD611DECDE7D7FC6B9@HE1PR08MB2828.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 yP7oIHsJvQuJCdjUsmyxWnlRvOg/cM1mXZjat5DnRE0aIs/kvYqGxqsOGPcILnbrf3gUY9pjnsB72mrnp4ONuqdOJ/QjUA3/oT2a7JK2VEOPBzyI2JP6IZWaKewBwuPw25lS6ioOLWo7kqQ0+ZgwOVYbeAR+fyNg9QEHIWnsuYK+rKL+E4eOHNBdHdEfKQPQ6j1oo7bw2mp2NSNf7yGNnhLbNJ1uvh7NmbfXnuhj/s385SFdymrDh4RbRxL2zMi0mvbmmTxwlRuz5eqateZf3MSEKwneYMTeYDmk1jzNQ+O0VCsMSBBqHaZjqTNNT68cHOrEJAscq4HLklEiPk5XBQJentQQdX8j1j2g2AJLD/PCgiADYJjAk9YhvMyjrKxuJpQUdKAkbDp/fNYQmIRuFCa2zuaswA+Gy6ZCq8AuMOq0XoTSqoK3Ne4UqEBDQFUvvZbd82HlODfXEmENfO7wB9fffTXMfhx7bG83pr0xZ/HBVqFLh6MgHxXJJITmUJC5KescndIeFcjtShIB70XeZeuxfSPq6wm59JfouLCL+Ta5tg0pehM9+B4Sasb5qAro1CjxPfwRbCmIyODbGs0gU1L0CL81YPn6UxAF4DAJEFpd2e9E1copLdLBX8Lt8Xm9nzWutVxktLV2iH14uG6WYA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3500.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(136003)(376002)(346002)(366004)(396003)(186003)(4326008)(76116006)(36756003)(2906002)(66556008)(26005)(83380400001)(8676002)(5660300002)(66446008)(64756008)(71200400001)(6486002)(6506007)(6916009)(66476007)(53546011)(66946007)(478600001)(91956017)(8936002)(86362001)(33656002)(316002)(6512007)(2616005)(54906003)(3714002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?Rp3b6lFM1hRLfcSpphJtx+YkLjI/OrGKnQWFEGojqo798bmAZBqDXjAHYW0j?=
 =?us-ascii?Q?9YgfO9tKLZ+9JSnAXdxeZY4VR6+ki7pUHwvHUERrizwo0FYQoOwXy2KUvZrX?=
 =?us-ascii?Q?1F/X1beUgqJkYw4Vu4v2+DWWSBY+JfglPdHXOp3ZX6/qBdkxSN6LeQSBFuyp?=
 =?us-ascii?Q?rd2nR23MdezZ1zUe+GvP0Gtv40KMlkEort3Fc0OO6xt8BqQkHJJNgIzxtEPM?=
 =?us-ascii?Q?td9DDXSSjJG7oSzfncR7vPEXQLa86M/ZKzNyGTYWnqeHbMormlea8QpqvdLE?=
 =?us-ascii?Q?sMQ3isGWJXnTnF5PO/PzQJRfesdyGxDJbdP8i8x2pMcT5Fx2kj2wvZrHZvyd?=
 =?us-ascii?Q?DuaSBYVbTaEYBB0ibZXXi9MeOvAPJthH/ujplFfqIlfg8EjCJJXP9qR6x1yy?=
 =?us-ascii?Q?u+GgqOfD4Q31TOg9jJIdkOaVsoATqjRRxSA2fkuqNUqgHge0TW4/Xzw99wKv?=
 =?us-ascii?Q?sho3/hKJ45Dxr4PX6A5je5+KrxTIxjV9lvb5QhLeMzjaYZNTB1kWUjGGwjbI?=
 =?us-ascii?Q?FkshS5H1/ItDatBBEw4jYTuRl1aC8Rk1ukUATduDemwPgjCEjns50w4y9oxS?=
 =?us-ascii?Q?OPL/NxF0CYld2CokguP3G7D4B9YwoetNSZhH/I2snEh1PCQwHHFkVktVfGsT?=
 =?us-ascii?Q?m7w4KlbqzGiLwmYkvK8AvPpL0JFte+L35Nd9rNY4nkCaNysvCuIKyHWjI2Jy?=
 =?us-ascii?Q?sd4UkgDHTmDZBfDDtpQbmdPNwu9KJKF229tQxG3mjWscaSXZ/jF12+8iuMTO?=
 =?us-ascii?Q?5XtrWsjpHJO+nqTvTRH9Aw5mugQ9ZV+kO0zXlAbNs0suM5Gfl20Yxg3XgXE/?=
 =?us-ascii?Q?qaZDgmQ4KxhuVSCCvvEBEXiARJAdRtuBH2ds54sPf9pT3iJqXO+CNQpHjcjo?=
 =?us-ascii?Q?rMQYngeiG/h9VBmpg9mrVhykwp9Ih2L8JO0RG3FUwRznlRpnWyCOaZMQitSu?=
 =?us-ascii?Q?8MlySj7WcA7k7QseLUM4iksL0kL+s8kEkPKd2qFcPzPIfTH2q69aeI3IFjhi?=
 =?us-ascii?Q?QBnUGoQWKWwfkpqfvTIsmrqTpPI3OUhWYyDu/K5SWvxPz4Wrq7C8exC3X1NX?=
 =?us-ascii?Q?dHOM4uIiR09rQsGGSEXNSe7IliskOs4aOTbKqxS4GpAZ97wTBJrHzAsOsER3?=
 =?us-ascii?Q?w4TUGjjtIuFRH7S8cHTp6g4n5hGuvuiC08Vdrin++rgBOiL2JwkSLQMwf8CU?=
 =?us-ascii?Q?GucWxeFJaAnhNvpzPS9f6MqIfQhflkAM0ORsklVLnVX6el/UHsDcNLaocPwf?=
 =?us-ascii?Q?59+28xcUMX1A9nW0mf1Po4ODjM1C1hNl9gxUe+x6WeJiSmimicBBr/8DyXNh?=
 =?us-ascii?Q?7OsvSos5VamSYkPdv9H1SsDC?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <9A5F0B26D191E247B360DC09181C1F27@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5654
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	54839c3e-e8e6-4f9c-57d9-08d8e8a47fd9
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wT6EzCOPutPMkkCUoMCizYWQLD1utY6cqJDvyK8c7nC8e9Kq+FpYK+HAcuq6WSqZwDMvvS6m9JAy6RcA2/aV0wVPHcePwZSlQdQQohIRPryKB12wwNzOOKNiSF6oomoFwb1LE4VSSJn0XhEdpk+9DLb9jZM+GFZycXW5UmhHTC7OITapTdpJ1+hL5b0f+xF7Ry5vov+HxXO0lqrGtM5EYC+Qo5nWqwT5gj3W86uSd34TzVj35ZG+KqW1XFHB7Pg3Kg4TFgarRBI8hfofrowG27DmQSWRRxZzqI+P9U+Ww4NXhjZMXJBJkV4UuZCd6TvHQiVXPSk0cL8/W7nrInuVG+DUcAwWfJX/uVXtf+vPmDOG9cdQshuiXDGBJ9LP0tqsQmG4HFwN6j4c44m4BYEaC7CYZIHUggV2qXbVsIcP3zjyYUDBJVVQrGK9GcWaIAIW2w8gj8P1BOh2p+9uB5ijxvwe8uv6ZvLghEzp47pyTHbHy6Jq1jejGEBY8IVa5dcqQLVRffTKXouJc+vvoB5NgKx26XwFuUmK8u7yIougCdjejRq8tpTYpkUvHrZtR2Tzx9i+JlDVsZl+pV2O0IK6siy8waQ88dqTNVFeEgOcLU0khToa3dURmuakEgOyWWFv6P9r3ZqBKj35uj9mnFy2+50LosO4xOOJpQ/Duu9ayfKrCSs+njQlBVIaVC5HRdWA
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(39860400002)(376002)(396003)(136003)(46966006)(36840700001)(2616005)(6486002)(82310400003)(8676002)(36756003)(86362001)(316002)(5660300002)(4326008)(186003)(70206006)(53546011)(6506007)(70586007)(36860700001)(81166007)(83380400001)(8936002)(82740400003)(33656002)(2906002)(47076005)(6512007)(107886003)(478600001)(356005)(26005)(336012)(6862004)(54906003)(3714002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2021 17:54:18.0371
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 77750f22-c552-4451-8b0c-08d8e8a48541
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR08MB2828

Hello Julien,

> On 16 Mar 2021, at 3:08 pm, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Rahul,
>=20
> On 09/03/2021 18:19, Rahul Singh wrote:
>> Backport 588888a7399db352d2b1a41c9d5b3bf0fd482390
>> "iommu/arm-smmu: Intelligent SMR allocation" from the Linux kernel
>> This patch fix the stream match conflict issue when two devices have the
>> same stream-id.
>> Only difference while applying this patch is to use spinlock in place of
>> mutex and move iommu_group_alloc(..) function call in
>> arm_smmu_add_device(..) function from the start of the function
>> to the end.
>=20
> As you may remember the discussion on the SMMUv3 thread, replacing a spin=
lock by a mutex has consequences. Can you explain why this is fine?
Yes, I remember the discussion on the SMMUv3 thread, replacing a spinlock w=
ith a mutex has consequences.=20

I replaced the mutex with spinlock in the SMMUv1 code when we are configuri=
ng the SMMUv1 hardware arm_smmu_master_alloc_smes(..).

I think it is fine to use the spinlock in place of mutex in SMMUv1 where we=
 are configuring the hardware via registers as compared to SMMUv3 where we =
are configuring the SMMUv3 hardware with Memory-based circular buffer queue=
s. Configuring the hardware via queues might take a long time that why mute=
x is a good choice but if we are configuring the hardware via registers it =
is very fast.

Configuring the SMMUv1 with the register is very fast and there are no side=
 effects of this if we use spinlock. Let me know your view on this.

Regards,
Rahul

> Cheers,
>=20
> --=20
> Julien Grall


