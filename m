Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 312812F7993
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 13:38:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.68052.121734 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0ONK-0005GL-FS; Fri, 15 Jan 2021 12:38:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 68052.121734; Fri, 15 Jan 2021 12:38:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0ONK-0005Fz-By; Fri, 15 Jan 2021 12:38:46 +0000
Received: by outflank-mailman (input) for mailman id 68052;
 Fri, 15 Jan 2021 12:38:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Sc3p=GS=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1l0ONI-0005Ft-PI
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 12:38:44 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:7e1b::611])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 69500777-aa22-4fba-867c-e9d685847fb6;
 Fri, 15 Jan 2021 12:38:42 +0000 (UTC)
Received: from AM6P194CA0019.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:90::32)
 by HE1PR0801MB1833.eurprd08.prod.outlook.com (2603:10a6:3:80::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9; Fri, 15 Jan
 2021 12:38:39 +0000
Received: from AM5EUR03FT046.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:90:cafe::b2) by AM6P194CA0019.outlook.office365.com
 (2603:10a6:209:90::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10 via Frontend
 Transport; Fri, 15 Jan 2021 12:38:39 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT046.mail.protection.outlook.com (10.152.16.164) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.12 via Frontend Transport; Fri, 15 Jan 2021 12:38:38 +0000
Received: ("Tessian outbound 587c3d093005:v71");
 Fri, 15 Jan 2021 12:38:37 +0000
Received: from f33ddc899637.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 82FB6693-7206-45B2-9811-991278315958.1; 
 Fri, 15 Jan 2021 12:38:32 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f33ddc899637.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 15 Jan 2021 12:38:32 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com (2603:10a6:10:49::10)
 by DB8PR08MB5385.eurprd08.prod.outlook.com (2603:10a6:10:119::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11; Fri, 15 Jan
 2021 12:38:29 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::f5c1:9694:9263:d90d]) by DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::f5c1:9694:9263:d90d%2]) with mapi id 15.20.3742.013; Fri, 15 Jan 2021
 12:38:29 +0000
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
X-Inumbo-ID: 69500777-aa22-4fba-867c-e9d685847fb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K91hh1swl2lVM1njqWutf0pZPIOf4X5RHdKxoMdYRQc=;
 b=7GwYbqHg5P1CaeWUn5nOLQhlUk8IEgMqoA0snF6YzQTXowNuvylceWQ/zbEQn15ZdEenGqdm/zcXTH8MX8ifFrApCSfSAzOTy0yBKLII0UXlXFg6L+M/r3l2PIEhd8BYodqW1uhMV4nnJafwAPf+DrQXV+QCl1/VQg9i3ISTPGE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 142fc5146a662a5c
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SERhSER8p/m13XfsuSmxkyRiJx/hMnaBFvUxQ20ioL+TbQgR8Z+blfCLvjGS2c47oGi+r8Bs4nZK7MIzsF7WKIjdW/1Ll/gfSVEbBOUjN1/NWLc/F4XonVzfySEO1QEjHWYtqj6olF7y55raaXr194gTWivtKSkzda3qzKi+0UvRc2Re+0BR0Agk/HHqbXG/FSLdP1cg06ndvr0YAEYH0eVzf4Lli865EUXJQ9fjSzmmmcUohEKoWUlolX4umcI41vrN4N5qNYiffRIHEGtqKUHt/YlAY/qMvoTUEpsKmhb8o7PXHIOVugKOrqfrglgQ3fi59sZm5FwGD+odr5FUTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K91hh1swl2lVM1njqWutf0pZPIOf4X5RHdKxoMdYRQc=;
 b=FsBiMMzEkEJSOrc+2KvKgEvSNmsVoQy7n/s8pxA73fP5yCtBs7dKfMN3Ny1y9vP16CrwvHOXDsCT6QuxdO0QsbZxUkSmW8eRVWtqHX2Ixr5uJ55mscOJWHBnfPmIB28sSs2tCee3pzmTrIAXd4wRBQZWJS3BbHlmaxhy29VLX26yhWOW5f561xgzPP7m6afuzVaS7EV5nyDEtTNkGOkY5S2mPQQbZPbqNc52738JAmnevMuhTPx+uKd8raYGczTjXURTMdbomkuaOkJElkIYsLfbaC54FKxm7HquGlXF7Vp1GFn4pmtNuRCY2bT1D6v2xlsCZ/Bm4Xo23Bsrrmmd2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K91hh1swl2lVM1njqWutf0pZPIOf4X5RHdKxoMdYRQc=;
 b=7GwYbqHg5P1CaeWUn5nOLQhlUk8IEgMqoA0snF6YzQTXowNuvylceWQ/zbEQn15ZdEenGqdm/zcXTH8MX8ifFrApCSfSAzOTy0yBKLII0UXlXFg6L+M/r3l2PIEhd8BYodqW1uhMV4nnJafwAPf+DrQXV+QCl1/VQg9i3ISTPGE=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Oleksandr <olekstysh@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Ian
 Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Paul Durrant <paul@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v4 11/11] xen/arm: smmuv3: Add support for SMMUv3 driver
Thread-Topic: [PATCH v4 11/11] xen/arm: smmuv3: Add support for SMMUv3 driver
Thread-Index: AQHW5c4BALh9w79bakGJi7B8FnwYpqoinLCAgAElzwCAAL2RgIAEKvqA
Date: Fri, 15 Jan 2021 12:38:29 +0000
Message-ID: <2AAC732A-5407-4B6B-ABFC-BA3914FB1DA1@arm.com>
References: <cover.1610115608.git.rahul.singh@arm.com>
 <9ba174516e01e2a53390420fa957ea563219141f.1610115608.git.rahul.singh@arm.com>
 <7762de2c-da11-5643-8f70-fdd87a7583eb@gmail.com>
 <A92B97AF-953C-4523-A438-CED1D8C1F1AC@arm.com>
 <3485d705-9063-59b9-f282-9661883265f3@gmail.com>
In-Reply-To: <3485d705-9063-59b9-f282-9661883265f3@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [80.1.41.211]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d2461544-8855-46ec-1028-08d8b9527ba6
x-ms-traffictypediagnostic: DB8PR08MB5385:|HE1PR0801MB1833:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<HE1PR0801MB18335016FB2CA6AA04098333FCA70@HE1PR0801MB1833.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 AuCkgXwrYjDBmRXHiz5bt26Otc3QP/paU4wW4w6hW0ipUxu8GUYdQLRdmzlL8fB1qrDQCm48fZXcXnppbDCVCB/mMXWocHECnvafO3zr1HOY2YYHcYTc14crZrR/+ufTrhgs3lUxL8KYIf9FkfpLD9chS1JEOXbz1Afq6wpHxMe22hk3w64q5vVieETREGtCkP2oGyE1stU7+HT10aut8uoTzB7X7i2LYh2wSlFDS5NJ2JPrqycujguRWiWDi1dEBN8NUk9NMyQgbDXCYAIbG+yIc8fCrPud7L2JRNRxg1i+OTywLE+sDBLUTJJJoGqMYFkpBfb9FISFoHALnY0wuxajgOHs/Y3Lkaz3dR8Mgmi41O8gt78UkrVqhkXVLThXwo5isEds1QSf+gXn+Y8QafiGypQXOKyr9VZz5c0McaInUwrMD/3ub2oYX3O2ze/Q
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3500.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(346002)(39850400004)(396003)(376002)(66946007)(66476007)(66556008)(4326008)(33656002)(64756008)(66446008)(71200400001)(6506007)(2616005)(76116006)(2906002)(478600001)(8936002)(26005)(91956017)(5660300002)(36756003)(54906003)(186003)(53546011)(6916009)(83380400001)(6486002)(8676002)(86362001)(6512007)(316002)(7416002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?NIfjGHTd7FAkDzT6k0/7bQf8+aD0sFGQWnKcxSUhG3rp9qtcqqTLXHc/KM4/?=
 =?us-ascii?Q?76JIaJcTI8rFEqLhREkbYUpwXJ6p8vdPJINgAjw9NAd6cuZh8MgoRvuE3t56?=
 =?us-ascii?Q?x2V67x+m8x0HhzWxcb809Pfvk6M1iVL2cIo0IoUuS2h3BkK6mkoM74VxoQs+?=
 =?us-ascii?Q?6IXWfBKEQihPxS6Il79RDiYGyYmmm9Hu1IeP2o3/qlXznoE2eq637FJf5MUn?=
 =?us-ascii?Q?nbB7do/jjdj4HG0mUqvsDZc9ufzVHOCNNolu0190tJ0mbynZ/qKjRhe2DwlP?=
 =?us-ascii?Q?xBc0r/3eDBCWyTJ2hfVF+WM00w58EQY+wFQElcHtagODQ0IWndBspcpZWCsT?=
 =?us-ascii?Q?5jTfuj3812VH7xT3Svwlz+N/YhPaNybQhJGtYWvquUtsDUE/GWxMWtbA/w+K?=
 =?us-ascii?Q?d9BIIl0vrEPpqIP0QO39kWFgGsWW+TLEbfl0jmkwEjh87s+K4dLGXx2JSJsZ?=
 =?us-ascii?Q?5TZYagQGGYqa8dWVomj6k6PxaqNSl9qwLm1VPMr2WMRQBdVKjnDq9QwuBkPq?=
 =?us-ascii?Q?yzoJL5dfMEy1+mGGb7hjTiCeGFDMnRrGfCbO33oHgWEI+jZIAlHJyx4gEobs?=
 =?us-ascii?Q?oAwFNfe/odAsl7atV8sxUugz8Qo+W8bDcWsrGIO50BlmWWxjgmLUS3n+v29j?=
 =?us-ascii?Q?dg8WI09PItsmyJxAAKRiwg8h/J2y1QpbldtCP+IWr9IGoadLBzFm4oGH4lE/?=
 =?us-ascii?Q?Sg3upRTx7CwEWQNwYFJguVb7wNw5nlOdjlUfoHkw+0q+j5EWZxJ9EB2Ov0Bd?=
 =?us-ascii?Q?pE/GrzrO1DqyT3v8rTzN7mIOTfYsSdQRybLTnMe8XUqSorTyMCNZFKQtfPDJ?=
 =?us-ascii?Q?9ufqtyE+4N8HVHI/QtrhiuxHbSNyPuuiEAxKh4LA4d7lfYyXhOLwBrZIr2za?=
 =?us-ascii?Q?4rSbJey+xU2cT0aLK5V7QG7xq0t02Dun4CooXC3OP2yZ2wWxmhe7CwX5LtfS?=
 =?us-ascii?Q?oZWi5NCecYboBSTmb65sluIqsrCrS3P9NIb7Vbopwhu26pAAHJWztSqsb82Z?=
 =?us-ascii?Q?NTb4?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <F3F89D428EDAAD47AF09274D0FC65756@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5385
Original-Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	1f50d3b6-c0ed-4250-41dc-08d8b9527676
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	q8kI+Hk6cTtGVsmTrAh7v9SI5gNQjMNvINHg3OPbmr7bFR9BoUZYkqEd71qk9+qndAeE8HNniya+MUHqLBA/ONTI4PNIXoHRtiTVNa+wLBD6PpL2eODrwXZBCl+AnVmNirNsh4R3ZS+DUSPCqi4B9Oho5w73hDDgLuUm78dhwwjedjAEHqkqSkzv8XYKo93IjaegmBr9J0mGnVyGGNAyDaswOPSIjJKAqgwXa+zKta8CFAJdlR/YpQyAvZ6xPfW/WLAie46AL8eB5AqFvgarFRP66JCF/eVzz/bUeS3yZzu+jUyhKQMuXvyiwpWRykZtT0+sIexK8C03YLX8nQLkdtz1NY5IeeXzHsXqtPYYnbEFCfSNyviE7w8oGZ7c/pzYjWPQ0IhScKCKwSZvNjYpY8NhzrQGkoAw3dSxCJgb3L8ByOk1HRZLAiaTitrwRkuiizpE7H0ROosAFR0bY2P4qql90aQWSfXLwfym68r8V1Qe/zIkAO6vZBLwLFKnAkPE
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(136003)(346002)(396003)(39850400004)(46966006)(356005)(70206006)(83380400001)(5660300002)(70586007)(81166007)(47076005)(107886003)(82740400003)(2906002)(53546011)(26005)(186003)(6506007)(2616005)(6862004)(86362001)(316002)(8936002)(34020700004)(6512007)(6486002)(478600001)(336012)(82310400003)(36756003)(54906003)(8676002)(4326008)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2021 12:38:38.5302
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d2461544-8855-46ec-1028-08d8b9527ba6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB1833

Hello Oleksandr,

> On 12 Jan 2021, at 8:59 pm, Oleksandr <olekstysh@gmail.com> wrote:
>=20
>=20
> On 12.01.21 11:41, Rahul Singh wrote:
>=20
> Hi Rahul
>=20
>=20
>>=20
>>>>  -static int arm_smmu_of_xlate(struct device *dev, struct of_phandle_a=
rgs *args)
>>>> +static int arm_smmu_dt_xlate(struct device *dev,
>>>> +				const struct dt_phandle_args *args)
>>>>  {
>>>> -	return iommu_fwspec_add_ids(dev, args->args, 1);
>>>> +	int ret;
>>>> +	struct iommu_fwspec *fwspec =3D dev_iommu_fwspec_get(dev);
>>> Please bear in mind I am not familiar with the SMMU, but don't we need =
to perform a some kind
>>> of sanity check of passed DT IOMMU specifier here?
>> I checked the code follow we will never hit the dt_xlate without IOMMU s=
pecifier but anyway I will add the sanity check.
> By sanity check I meant to make sure that device ID (stream ID) is in all=
owed range (of course, if this is relevant for SMMU).
> For example, for IPMMU-VMSA we have a check that device ID (uTLB) is less=
 than max uTLB number.

Sorry I misunderstood your previous comments. Yes SMMUv3 driver is performi=
ng the sanity check for Stream Id before configuring the hardware in functi=
on arm_smmu_sid_in_range().=20
>=20
>> =20
>>=20
>>>> +
>>>> +static int arm_smmu_iommu_xen_domain_init(struct domain *d)
>>>> +{
>>>> +	struct arm_smmu_xen_domain *xen_domain;
>>>> +
>>>> +	xen_domain =3D xzalloc(struct arm_smmu_xen_domain);
>>>> +	if (!xen_domain)
>>>> +		return -ENOMEM;
>>>> +
>>>> +	spin_lock_init(&xen_domain->lock);
>>>> +	INIT_LIST_HEAD(&xen_domain->contexts);
>>>> +
>>>> +	dom_iommu(d)->arch.priv =3D xen_domain;
>>>> +	return 0;
>>>> +
>>>> +}
>>>> +
>>>> +static void __hwdom_init arm_smmu_iommu_hwdom_init(struct domain *d)
>>>> +{
>>> Both SMMUv2 and IPMMU perform some actions here. Any reason we don't ne=
ed to do the same here?
>>>=20
>>>     /* Set to false options not supported on ARM. */
>>>     if ( iommu_hwdom_inclusive )
>>>         printk(XENLOG_WARNING
>>>         "map-inclusive dom0-iommu option is not supported on ARM\n");
>>>     iommu_hwdom_inclusive =3D false;
>>>     if ( iommu_hwdom_reserved =3D=3D 1 )
>>>         printk(XENLOG_WARNING
>>>         "map-reserved dom0-iommu option is not supported on ARM\n");
>>>     iommu_hwdom_reserved =3D 0;
>>>=20
>>>     arch_iommu_hwdom_init(d);
>> I will add the above code for SMMUv3 also.
>=20
> Great.
>=20
> I was thinking about it, this is the third IOMMU driver on Arm which has =
to disable the _same_ unsupported options, probably this code wants to be f=
olded in arch_iommu_hwdom_init() to avoid duplication?

Yes I also agree with you to avoid duplication we can move the come code to=
 the function arch_iommu_hwdom_init().
I will submit the patch(not part of this series)  if everyone is ok to move=
 the common code to arch_iommu_hwdom_init().

Regards,
Rahul
=20
>=20
> --=20
> Regards,
>=20
> Oleksandr Tyshchenko
>=20


