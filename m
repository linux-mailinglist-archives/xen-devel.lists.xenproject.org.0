Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1BE62CD941
	for <lists+xen-devel@lfdr.de>; Thu,  3 Dec 2020 15:35:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.43662.78503 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkpgp-0004MM-TK; Thu, 03 Dec 2020 14:34:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 43662.78503; Thu, 03 Dec 2020 14:34:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkpgp-0004Lu-OI; Thu, 03 Dec 2020 14:34:35 +0000
Received: by outflank-mailman (input) for mailman id 43662;
 Thu, 03 Dec 2020 14:34:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Lp8G=FH=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1kkpgo-0004Lp-Ra
 for xen-devel@lists.xenproject.org; Thu, 03 Dec 2020 14:34:35 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.21.51]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 70022968-8d93-40a6-84fe-9628d4666c09;
 Thu, 03 Dec 2020 14:34:31 +0000 (UTC)
Received: from DB3PR08CA0016.eurprd08.prod.outlook.com (2603:10a6:8::29) by
 VI1PR08MB3486.eurprd08.prod.outlook.com (2603:10a6:803:8a::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.18; Thu, 3 Dec 2020 14:34:29 +0000
Received: from DB5EUR03FT017.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:8:0:cafe::3f) by DB3PR08CA0016.outlook.office365.com
 (2603:10a6:8::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend
 Transport; Thu, 3 Dec 2020 14:34:29 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT017.mail.protection.outlook.com (10.152.20.114) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.17 via Frontend Transport; Thu, 3 Dec 2020 14:34:29 +0000
Received: ("Tessian outbound 6af064f543d4:v71");
 Thu, 03 Dec 2020 14:34:28 +0000
Received: from 0f355e6c8d50.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 86795AA3-26F8-4342-8770-ECD0CA247716.1; 
 Thu, 03 Dec 2020 14:33:51 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0f355e6c8d50.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 03 Dec 2020 14:33:51 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com (2603:10a6:10:49::10)
 by DB6PR0802MB2373.eurprd08.prod.outlook.com (2603:10a6:4:88::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20; Thu, 3 Dec
 2020 14:33:49 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::21f3:34c:8f7e:42ef]) by DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::21f3:34c:8f7e:42ef%2]) with mapi id 15.20.3611.032; Thu, 3 Dec 2020
 14:33:49 +0000
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
X-Inumbo-ID: 70022968-8d93-40a6-84fe-9628d4666c09
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=83I9tKpsKyeU0i3y+i565ekiUkZAPReSxob8mTNCB2c=;
 b=KU5LULRPR+NEVep/dbI43P1Mqsew8/RTgz0lV8+ZUVJEhK5Z38xg6VW0i+whE2kVfSEaAxENs6z8CobPNr4WWFYKxwV/uaFHMiqjCcRXvSF72g5ov8MVKnXWXr33YdVsQoDXdUCi5PS/X5Q5hyDfI8SD9hB8fltINecMkmo00fg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6cde29299ee41a61
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XVyj+TiTc5qlY8WPXIqXlGQ+p3xKbiqIR9XTFlC1KB9pm+vFXeiROwVZZW44bgQUjShCeJjPNwboUMV4vz5tGjeGi20fX+NF5E/gJ+dMr5NoSJgKRDkDAsy3Op/ZUjYWGtzd2a9FGJtiznJ9eNtq5kLuOaD/1GZCXcG9V9ldyMYS0wziBCQR3AT2veIkvuhVKJ8lW5ULzy1ouuck+1l3TPH6kQg9dbiAMNADVW7iXyyP7/5d9F4fbrXYH/ppMnBJu3CwEWrQhvoLUtxym9XBmvCqsvNho2/c0ghQN4U5DxevdsafrYF6tcBw1Zsdy6JyCLHLZF6+AF5aDSBhDqjHQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=83I9tKpsKyeU0i3y+i565ekiUkZAPReSxob8mTNCB2c=;
 b=fQsvru/4hGkM7BNnzB2yLmjXvr6a2Xy9KMsYo5xNJitOPVXJk6F8E5Dx3THf2Q0/1/8MG1WM0sY8O32fjZJSLLSXMqa7YgYsksZsFgm3dZVyVHuFTsHHM1JNFUHHBJWmTcS3NHK4Ej9W6z1fPDDYhRETbTsfHnaRRQf17gdftNuAn1APgb7SWkAt0MyO67+bk2bjjTmJS57lWI91oYSEbqbzwPDPihTreyOjpiGzV4kAAAffRaTM1LNOZdIyRACmw8WRyBoYIIAAhR2bKTFMKtXOeI2Arn08xILouW6mXre3BqfnqRd9WtSwadViGkHZr9XaaBy30OOlGCvGEa2BBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=83I9tKpsKyeU0i3y+i565ekiUkZAPReSxob8mTNCB2c=;
 b=KU5LULRPR+NEVep/dbI43P1Mqsew8/RTgz0lV8+ZUVJEhK5Z38xg6VW0i+whE2kVfSEaAxENs6z8CobPNr4WWFYKxwV/uaFHMiqjCcRXvSF72g5ov8MVKnXWXr33YdVsQoDXdUCi5PS/X5Q5hyDfI8SD9hB8fltINecMkmo00fg=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 7/8] xen/arm: Remove Linux specific code that is not
 usable in XEN
Thread-Topic: [PATCH v2 7/8] xen/arm: Remove Linux specific code that is not
 usable in XEN
Thread-Index: AQHWxBX830xFguE4YkK2klATz/ucYKnj64aAgAGO7QA=
Date: Thu, 3 Dec 2020 14:33:49 +0000
Message-ID: <51C0C24A-3CE6-48A3-85F5-14F010409DC3@arm.com>
References: <cover.1606406359.git.rahul.singh@arm.com>
 <1d9da8ed4845aeb9e86a5ce6750b811bd7e2020e.1606406359.git.rahul.singh@arm.com>
 <cd74f2a7-7836-ef90-9cd8-857068adb0f5@xen.org>
In-Reply-To: <cd74f2a7-7836-ef90-9cd8-857068adb0f5@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [80.1.41.211]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: fee75201-d87d-45b7-a483-08d897988aaf
x-ms-traffictypediagnostic: DB6PR0802MB2373:|VI1PR08MB3486:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB3486783AE68BA3C29F1055EEFCF20@VI1PR08MB3486.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8273;OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 VSvj0AEDkjCTAPBv3sHqxgEbkaBwcaxDfitwaxil2c0msYS6d3YI/yz2LLc+990GC4UOHKBL3qRwPXSlcTQI/SzUue2a9YKKGv8nJ83Ee6Kx2P3VkFwbpho9Xy8HnAwJiIyp8fG1JO4m7ZRMVAQuL7tYP2ATLRlQ3UZu79+pjh2TUBj9yLSmP6HHa5ckaLI3/dfQt4+4zEwWCNh4xzNLX75+ZgH1YJoEAlpo9RNkSBXbe8Yrje32Q/CeN1OmQ55Us+Ym08qcHh3ItpjaGSd9gCmJq286f6qHVb2hiWxIh414N7XLQEnYYX4MQCmYefQT/WHnttfHLOeEjg2G4WZRycifYinFFQXd2Rup96tM2GhiStE8M/4ND2RWsY7PKi1N
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3500.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(39860400002)(366004)(376002)(136003)(4326008)(66476007)(6512007)(2616005)(64756008)(71200400001)(66556008)(66446008)(76116006)(6506007)(26005)(316002)(91956017)(83380400001)(53546011)(66946007)(2906002)(186003)(6486002)(6916009)(30864003)(478600001)(8676002)(36756003)(86362001)(54906003)(5660300002)(33656002)(8936002)(45980500001)(579004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?ocqhkChp4MDHMg6J/XB/M9uVVT2F4E8k/1XST6MPDvrR/5NlthHvFKZBxbg8?=
 =?us-ascii?Q?04q5JfM9hNl50vVuzUPGCKpWEQJ/yrYNwMXO0dSGUo+obYVmQMAYlmsa2FPl?=
 =?us-ascii?Q?hQ8DrK7jAbIlfJRoxSQ2mUy9oqrrOVDuFGpOICVWgOHGr95StvViD6t3ELIb?=
 =?us-ascii?Q?jrCkrV+aerNgr/BOvAwj/5pDHaWSEZMF0I99uuV/HycHdw432DgsVY8b1qak?=
 =?us-ascii?Q?yrfOsdmW+YOMfMOjeBemG4/VoO0yNDIgru4NV1EPfk6pD7YLXQQ425dS+TMI?=
 =?us-ascii?Q?ElxDzFcKWE1GbatgxFClMRBv2F/2RsCe1YgT37Scq1YJjdbJO6pKrCol9qBM?=
 =?us-ascii?Q?X93Fgz+/+ltVPGYrtkiLamaIFDovY9EjLMgWh6cH0wZHE7TgA3c+1Nx8PS9Z?=
 =?us-ascii?Q?L7ba4O8rw5D5ZmPLpkcsa+qdxmmJ4ThL2ioAiWivPm7H8Ir0DCaVrooHFK2V?=
 =?us-ascii?Q?fnHkRDyC/Uh8Xcb7keeEBowKX0FuRA+fm/5hdUBZ4C63S2KYSnmq54hYqOhm?=
 =?us-ascii?Q?10+7kQxXvWVqCk2PsjYTwtzS7vkl47+jCtDWw2Zye/oUXCi2mZ2YtOnQBi7m?=
 =?us-ascii?Q?mwJqLetb/a7jT+KtCIRtbLQgGSlWGEGxrXGYwvIrLkWpZJmB7qHfYmDmZCWa?=
 =?us-ascii?Q?rSimYjhy2fpci80qSZKOQKqriNLXcvWTA/dAyUm673diaOIo7/vE6WquWcB8?=
 =?us-ascii?Q?r2kwMMFWQL/q0DYNnMtAkITAHCB5XQO5CEl7k2AUsw34kcLtzQQ5Xh1Qwl1H?=
 =?us-ascii?Q?5WNfGolGSx4uUyz1zr0b7D79zfIWcdc0wl2kArtOE75hZ6eZ8ZYc0wjkTIxt?=
 =?us-ascii?Q?6rmrhl1ah88VD59DEVbBqz7zK4BUcsHiEjaq2ocI/erLPv3GFkel9f3r+sRg?=
 =?us-ascii?Q?BwhHgBLUsQ5Mp1B5tNPBhMHpiEx8hg4/LV+TZCSRqJWciijjDg6+o8F0hS7W?=
 =?us-ascii?Q?ceBa1Bo+aLicDNy2mqVgM33megIlROIQJQ11RKx6+izjuoo4YRqanvMTG0dQ?=
 =?us-ascii?Q?rE1V?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <EDE4DE96C99B454C8B1E63886EDDFFFD@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2373
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0d735777-e761-4755-d51e-08d897987314
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4SximX/vUjIfVacz6t9LV2eut5D9xdAk8Ot0aFHmOTOcL53T09nMSqdH5VNhy+LEZG79hLcVgydw/Mka+51opxYmjfnt39wErgcqteCjWp0EmMUz9zIXOFhv4RkkDkDGZDGyQVH7ECxx7XK/kMshfsrHQwNXSIkTFNNR6a9rycSTLKGwhQVGgESxpp0L4Iibnmjtf3+Nsly8gp/0vKzrOi66eUJjDeNt8fe7MQDYaUPysv4oI/SAo46IE3QxLhJTan2QRVEMMmv7FvLlXEte4/yQq0Kitz+bDSTH36XXl2jnH80tq5IHC6jQOXQYGhZnzWNWYYrvOlAC6Dt9a6Kiltzdhog2BB86qJ54/Ut9jGKpAt9doZjOl3gYjXvquSnXiYKu4r6HPW+be5XS4VH0CQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(136003)(376002)(396003)(346002)(46966005)(2906002)(82740400003)(6506007)(478600001)(8676002)(8936002)(82310400003)(6862004)(4326008)(107886003)(83380400001)(70586007)(54906003)(70206006)(30864003)(2616005)(316002)(5660300002)(356005)(186003)(6512007)(26005)(6486002)(53546011)(336012)(86362001)(81166007)(47076004)(36756003)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2020 14:34:29.0430
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fee75201-d87d-45b7-a483-08d897988aaf
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3486

Hello Julien,

> On 2 Dec 2020, at 2:45 pm, Julien Grall <julien@xen.org> wrote:
>=20
>=20
>=20
> On 26/11/2020 17:02, Rahul Singh wrote:
>> struct io_pgtable_ops, struct io_pgtable_cfg, struct iommu_flush_ops,
>> and struct iommu_ops related code are linux specific.
>=20
> So the assumption is we are going to support only sharing with the P2M an=
d the IOMMU. That's probably fine short term, but long-term we are going to=
 need unsharing the page-tables (there are issues on some platforms if the =
ITS doorbell is accessed by the processors).
>=20
> I am ok with removing anything related to the unsharing code. But I think=
 it should be clarified here.

Ok I will add in commit message what is removed from the code.
>=20
>> Remove code related to above struct as code is dead code in XEN.
>> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
>> ---
>>  xen/drivers/passthrough/arm/smmu-v3.c | 457 --------------------------
>>  1 file changed, 457 deletions(-)
>> diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthr=
ough/arm/smmu-v3.c
>> index 40e3890a58..55d1cba194 100644
>> --- a/xen/drivers/passthrough/arm/smmu-v3.c
>> +++ b/xen/drivers/passthrough/arm/smmu-v3.c
>> @@ -402,13 +402,7 @@
>>  #define ARM_SMMU_CMDQ_SYNC_TIMEOUT_US	1000000 /* 1s! */
>>  #define ARM_SMMU_CMDQ_SYNC_SPIN_COUNT	10
>>  -#define MSI_IOVA_BASE			0x8000000
>> -#define MSI_IOVA_LENGTH			0x100000
>> -
>>  static bool disable_bypass =3D 1;
>> -module_param_named(disable_bypass, disable_bypass, bool, S_IRUGO);
>> -MODULE_PARM_DESC(disable_bypass,
>> -	"Disable bypass streams such that incoming transactions from devices t=
hat are not attached to an iommu domain will report an abort back to the de=
vice and will not be allowed to pass through the SMMU.");
>=20
> Per your commit message, this doesn't look related to what you intend to =
remove. Maybe your commit message should be updated?

Ok.
>=20
>>    enum pri_resp {
>>  	PRI_RESP_DENY =3D 0,
>> @@ -599,7 +593,6 @@ struct arm_smmu_domain {
>>  	struct arm_smmu_device		*smmu;
>>  	struct mutex			init_mutex; /* Protects smmu pointer */
>>  -	struct io_pgtable_ops		*pgtbl_ops;
>>  	bool				non_strict;
>>    	enum arm_smmu_domain_stage	stage;
>> @@ -1297,74 +1290,6 @@ static void arm_smmu_tlb_inv_context(void *cookie=
)
>>  	arm_smmu_cmdq_issue_sync(smmu);
>>  }
>>  -static void arm_smmu_tlb_inv_range_nosync(unsigned long iova, size_t s=
ize,
>> -					  size_t granule, bool leaf, void *cookie)
>> -{
>> -	struct arm_smmu_domain *smmu_domain =3D cookie;
>> -	struct arm_smmu_device *smmu =3D smmu_domain->smmu;
>> -	struct arm_smmu_cmdq_ent cmd =3D {
>> -		.tlbi =3D {
>> -			.leaf	=3D leaf,
>> -			.addr	=3D iova,
>> -		},
>> -	};
>> -
>> -	cmd.opcode	=3D CMDQ_OP_TLBI_S2_IPA;
>> -	cmd.tlbi.vmid	=3D smmu_domain->s2_cfg.vmid;
>> -
>> -	do {
>> -		arm_smmu_cmdq_issue_cmd(smmu, &cmd);
>> -		cmd.tlbi.addr +=3D granule;
>> -	} while (size -=3D granule);
>> -}
>> -
>> -static void arm_smmu_tlb_inv_page_nosync(struct iommu_iotlb_gather *gat=
her,
>> -					 unsigned long iova, size_t granule,
>> -					 void *cookie)
>> -{
>> -	arm_smmu_tlb_inv_range_nosync(iova, granule, granule, true, cookie);
>> -}
>> -
>> -static void arm_smmu_tlb_inv_walk(unsigned long iova, size_t size,
>> -				  size_t granule, void *cookie)
>> -{
>> -	struct arm_smmu_domain *smmu_domain =3D cookie;
>> -	struct arm_smmu_device *smmu =3D smmu_domain->smmu;
>> -
>> -	arm_smmu_tlb_inv_range_nosync(iova, size, granule, false, cookie);
>> -	arm_smmu_cmdq_issue_sync(smmu);
>> -}
>> -
>> -static void arm_smmu_tlb_inv_leaf(unsigned long iova, size_t size,
>> -				  size_t granule, void *cookie)
>> -{
>> -	struct arm_smmu_domain *smmu_domain =3D cookie;
>> -	struct arm_smmu_device *smmu =3D smmu_domain->smmu;
>> -
>> -	arm_smmu_tlb_inv_range_nosync(iova, size, granule, true, cookie);
>> -	arm_smmu_cmdq_issue_sync(smmu);
>> -}
>> -
>> -static const struct iommu_flush_ops arm_smmu_flush_ops =3D {
>> -	.tlb_flush_all	=3D arm_smmu_tlb_inv_context,
>> -	.tlb_flush_walk =3D arm_smmu_tlb_inv_walk,
>> -	.tlb_flush_leaf =3D arm_smmu_tlb_inv_leaf,
>> -	.tlb_add_page	=3D arm_smmu_tlb_inv_page_nosync,
>> -};
>> -
>> -/* IOMMU API */
>> -static bool arm_smmu_capable(enum iommu_cap cap)
>> -{
>> -	switch (cap) {
>> -	case IOMMU_CAP_CACHE_COHERENCY:
>> -		return true;
>> -	case IOMMU_CAP_NOEXEC:
>> -		return true;
>> -	default:
>> -		return false;
>> -	}
>> -}
>> -
>>  static struct iommu_domain *arm_smmu_domain_alloc(unsigned type)
>>  {
>>  	struct arm_smmu_domain *smmu_domain;
>> @@ -1421,7 +1346,6 @@ static void arm_smmu_domain_free(struct iommu_doma=
in *domain)
>>  	struct arm_smmu_s2_cfg *cfg =3D &smmu_domain->s2_cfg;
>>    	iommu_put_dma_cookie(domain);
>> -	free_io_pgtable_ops(smmu_domain->pgtbl_ops);
>>    	if (cfg->vmid)
>>  		arm_smmu_bitmap_free(smmu->vmid_map, cfg->vmid);
>> @@ -1429,7 +1353,6 @@ static void arm_smmu_domain_free(struct iommu_doma=
in *domain)
>>  	kfree(smmu_domain);
>>  }
>>  -
>=20
> Looks like a spurious change.

Ack.=20
>=20
>>  static int arm_smmu_domain_finalise_s2(struct arm_smmu_domain *smmu_dom=
ain,
>>  				       struct arm_smmu_master *master,
>>  				       struct io_pgtable_cfg *pgtbl_cfg)
>=20
> You commit message leads to think that all the use of struct io_pgtable_c=
fg will be removed.

Ok I will remove it.
>=20
>> @@ -1437,7 +1360,6 @@ static int arm_smmu_domain_finalise_s2(struct arm_=
smmu_domain *smmu_domain,
>>  	int vmid;
>>  	struct arm_smmu_device *smmu =3D smmu_domain->smmu;
>>  	struct arm_smmu_s2_cfg *cfg =3D &smmu_domain->s2_cfg;
>> -	typeof(&pgtbl_cfg->arm_lpae_s2_cfg.vtcr) vtcr;
>=20
> It feels a bit odd that the definition of 'vtcr' is removed but there are=
 still users.

Ack. Will fix that.
>=20
>>    	vmid =3D arm_smmu_bitmap_alloc(smmu->vmid_map, smmu->vmid_bits);
>>  	if (vmid < 0)
>> @@ -1461,20 +1383,12 @@ static int arm_smmu_domain_finalise(struct iommu=
_domain *domain,
>>  {
>>  	int ret;
>>  	unsigned long ias, oas;
>> -	enum io_pgtable_fmt fmt;
>> -	struct io_pgtable_cfg pgtbl_cfg;
>> -	struct io_pgtable_ops *pgtbl_ops;
>>  	int (*finalise_stage_fn)(struct arm_smmu_domain *,
>>  				 struct arm_smmu_master *,
>>  				 struct io_pgtable_cfg *);
>>  	struct arm_smmu_domain *smmu_domain =3D to_smmu_domain(domain);
>>  	struct arm_smmu_device *smmu =3D smmu_domain->smmu;
>>  -	if (domain->type =3D=3D IOMMU_DOMAIN_IDENTITY) {
>> -		smmu_domain->stage =3D ARM_SMMU_DOMAIN_BYPASS;
>> -		return 0;
>> -	}
>> -
>=20
> Per your commit message, this doesn't look related to what you intend to =
remove. Maybe your commit message should be updated?

Ok I will update the commit message.
>=20
>>  	/* Restrict the stage to what we can actually support */
>>  	smmu_domain->stage =3D ARM_SMMU_DOMAIN_S2;
>>  @@ -1483,40 +1397,17 @@ static int arm_smmu_domain_finalise(struct iomm=
u_domain *domain,
>>  	case ARM_SMMU_DOMAIN_S2:
>>  		ias =3D smmu->ias;
>>  		oas =3D smmu->oas;
>> -		fmt =3D ARM_64_LPAE_S2;
>>  		finalise_stage_fn =3D arm_smmu_domain_finalise_s2;
>>  		break;
>>  	default:
>>  		return -EINVAL;
>>  	}
>>  -	pgtbl_cfg =3D (struct io_pgtable_cfg) {
>> -		.pgsize_bitmap	=3D smmu->pgsize_bitmap,
>> -		.ias		=3D ias,
>> -		.oas		=3D oas,
>> -		.coherent_walk	=3D smmu->features & ARM_SMMU_FEAT_COHERENCY,
>> -		.tlb		=3D &arm_smmu_flush_ops,
>> -		.iommu_dev	=3D smmu->dev,
>> -	};
>> -
>> -	if (smmu_domain->non_strict)
>> -		pgtbl_cfg.quirks |=3D IO_PGTABLE_QUIRK_NON_STRICT;
>> -
>> -	pgtbl_ops =3D alloc_io_pgtable_ops(fmt, &pgtbl_cfg, smmu_domain);
>> -	if (!pgtbl_ops)
>> -		return -ENOMEM;
>> -
>> -	domain->pgsize_bitmap =3D pgtbl_cfg.pgsize_bitmap;
>> -	domain->geometry.aperture_end =3D (1UL << pgtbl_cfg.ias) - 1;
>> -	domain->geometry.force_aperture =3D true;
>> -
>>  	ret =3D finalise_stage_fn(smmu_domain, master, &pgtbl_cfg);
>>  	if (ret < 0) {
>> -		free_io_pgtable_ops(pgtbl_ops);
>>  		return ret;
>>  	}
>>  -	smmu_domain->pgtbl_ops =3D pgtbl_ops;
>>  	return 0;
>>  }
>>  @@ -1626,71 +1517,6 @@ out_unlock:
>>  	return ret;
>>  }
>>  -static int arm_smmu_map(struct iommu_domain *domain, unsigned long iov=
a,
>> -			phys_addr_t paddr, size_t size, int prot, gfp_t gfp)
>> -{
>> -	struct io_pgtable_ops *ops =3D to_smmu_domain(domain)->pgtbl_ops;
>> -
>> -	if (!ops)
>> -		return -ENODEV;
>> -
>> -	return ops->map(ops, iova, paddr, size, prot, gfp);
>> -}
>> -
>> -static size_t arm_smmu_unmap(struct iommu_domain *domain, unsigned long=
 iova,
>> -			     size_t size, struct iommu_iotlb_gather *gather)
>> -{
>> -	struct arm_smmu_domain *smmu_domain =3D to_smmu_domain(domain);
>> -	struct io_pgtable_ops *ops =3D smmu_domain->pgtbl_ops;
>> -
>> -	if (!ops)
>> -		return 0;
>> -
>> -	return ops->unmap(ops, iova, size, gather);
>> -}
>> -
>> -static void arm_smmu_flush_iotlb_all(struct iommu_domain *domain)
>> -{
>> -	struct arm_smmu_domain *smmu_domain =3D to_smmu_domain(domain);
>> -
>> -	if (smmu_domain->smmu)
>> -		arm_smmu_tlb_inv_context(smmu_domain);
>> -}
>> -
>> -static void arm_smmu_iotlb_sync(struct iommu_domain *domain,
>> -				struct iommu_iotlb_gather *gather)
>> -{
>> -	struct arm_smmu_device *smmu =3D to_smmu_domain(domain)->smmu;
>> -
>> -	if (smmu)
>> -		arm_smmu_cmdq_issue_sync(smmu);
>> -}
>> -
>> -static phys_addr_t
>> -arm_smmu_iova_to_phys(struct iommu_domain *domain, dma_addr_t iova)
>> -{
>> -	struct io_pgtable_ops *ops =3D to_smmu_domain(domain)->pgtbl_ops;
>> -
>> -	if (domain->type =3D=3D IOMMU_DOMAIN_IDENTITY)
>> -		return iova;
>> -
>> -	if (!ops)
>> -		return 0;
>> -
>> -	return ops->iova_to_phys(ops, iova);
>> -}
>> -
>> -static struct platform_driver arm_smmu_driver;
>> -
>> -static
>> -struct arm_smmu_device *arm_smmu_get_by_fwnode(struct fwnode_handle *fw=
node)
>> -{
>> -	struct device *dev =3D driver_find_device_by_fwnode(&arm_smmu_driver.d=
river,
>> -							  fwnode);
>> -	put_device(dev);
>> -	return dev ? dev_get_drvdata(dev) : NULL;
>> -}
>> -
>>  static bool arm_smmu_sid_in_range(struct arm_smmu_device *smmu, u32 sid=
)
>>  {
>>  	unsigned long limit =3D smmu->strtab_cfg.num_l1_ents;
>> @@ -1701,206 +1527,6 @@ static bool arm_smmu_sid_in_range(struct arm_smm=
u_device *smmu, u32 sid)
>>  	return sid < limit;
>>  }
>>  -static struct iommu_ops arm_smmu_ops;
>> -
>> -static struct iommu_device *arm_smmu_probe_device(struct device *dev)
>> -{
>=20
> Most of the code here looks useful to Xen. I think you want to keep the c=
ode and re-use it afterwards.

Ok. I removed the code here and added the XEN compatible code to add device=
s in next patch.
I will keep it in this patch and will modifying the code to make XEN compat=
ible.

>=20
>> -	int i, ret;
>> -	struct arm_smmu_device *smmu;
>> -	struct arm_smmu_master *master;
>> -	struct iommu_fwspec *fwspec =3D dev_iommu_fwspec_get(dev);
>> -
>> -	if (!fwspec || fwspec->ops !=3D &arm_smmu_ops)
>> -		return ERR_PTR(-ENODEV);
>> -
>> -	if (WARN_ON_ONCE(dev_iommu_priv_get(dev)))
>> -		return ERR_PTR(-EBUSY);
>> -
>> -	smmu =3D arm_smmu_get_by_fwnode(fwspec->iommu_fwnode);
>> -	if (!smmu)
>> -		return ERR_PTR(-ENODEV);
>> -
>> -	master =3D kzalloc(sizeof(*master), GFP_KERNEL);
>> -	if (!master)
>> -		return ERR_PTR(-ENOMEM);
>> -
>> -	master->dev =3D dev;
>> -	master->smmu =3D smmu;
>> -	master->sids =3D fwspec->ids;
>> -	master->num_sids =3D fwspec->num_ids;
>> -	dev_iommu_priv_set(dev, master);
>> -
>> -	/* Check the SIDs are in range of the SMMU and our stream table */
>> -	for (i =3D 0; i < master->num_sids; i++) {
>> -		u32 sid =3D master->sids[i];
>> -
>> -		if (!arm_smmu_sid_in_range(smmu, sid)) {
>> -			ret =3D -ERANGE;
>> -			goto err_free_master;
>> -		}
>> -
>> -		/* Ensure l2 strtab is initialised */
>> -		if (smmu->features & ARM_SMMU_FEAT_2_LVL_STRTAB) {
>> -			ret =3D arm_smmu_init_l2_strtab(smmu, sid);
>> -			if (ret)
>> -				goto err_free_master;
>> -		}
>> -	}
>> -
>> -	return &smmu->iommu;
>> -
>> -err_free_master:
>> -	kfree(master);
>> -	dev_iommu_priv_set(dev, NULL);
>> -	return ERR_PTR(ret);
>> -}
>> -
>> -static void arm_smmu_release_device(struct device *dev)
>> -{
>> -	struct iommu_fwspec *fwspec =3D dev_iommu_fwspec_get(dev);
>> -	struct arm_smmu_master *master;
>> -
>> -	if (!fwspec || fwspec->ops !=3D &arm_smmu_ops)
>> -		return;
>> -
>> -	master =3D dev_iommu_priv_get(dev);
>> -	arm_smmu_detach_dev(master);
>> -	kfree(master);
>> -	iommu_fwspec_free(dev);
>> -}
>> -
>> -static struct iommu_group *arm_smmu_device_group(struct device *dev)
>> -{
>> -	struct iommu_group *group;
>> -
>> -	/*
>> -	 * We don't support devices sharing stream IDs other than PCI RID
>> -	 * aliases, since the necessary ID-to-device lookup becomes rather
>> -	 * impractical given a potential sparse 32-bit stream ID space.
>> -	 */
>> -	if (dev_is_pci(dev))
>> -		group =3D pci_device_group(dev);
>> -	else
>> -		group =3D generic_device_group(dev);
>> -
>> -	return group;
>> -}
>> -
>> -static int arm_smmu_domain_get_attr(struct iommu_domain *domain,
>> -				    enum iommu_attr attr, void *data)
>> -{
>> -	struct arm_smmu_domain *smmu_domain =3D to_smmu_domain(domain);
>> -
>> -	switch (domain->type) {
>> -	case IOMMU_DOMAIN_UNMANAGED:
>> -		switch (attr) {
>> -		case DOMAIN_ATTR_NESTING:
>> -			*(int *)data =3D (smmu_domain->stage =3D=3D ARM_SMMU_DOMAIN_NESTED);
>> -			return 0;
>> -		default:
>> -			return -ENODEV;
>> -		}
>> -		break;
>> -	case IOMMU_DOMAIN_DMA:
>> -		switch (attr) {
>> -		case DOMAIN_ATTR_DMA_USE_FLUSH_QUEUE:
>> -			*(int *)data =3D smmu_domain->non_strict;
>> -			return 0;
>> -		default:
>> -			return -ENODEV;
>> -		}
>> -		break;
>> -	default:
>> -		return -EINVAL;
>> -	}
>> -}
>> -
>> -static int arm_smmu_domain_set_attr(struct iommu_domain *domain,
>> -				    enum iommu_attr attr, void *data)
>> -{
>> -	int ret =3D 0;
>> -	struct arm_smmu_domain *smmu_domain =3D to_smmu_domain(domain);
>> -
>> -	mutex_lock(&smmu_domain->init_mutex);
>> -
>> -	switch (domain->type) {
>> -	case IOMMU_DOMAIN_UNMANAGED:
>> -		switch (attr) {
>> -		case DOMAIN_ATTR_NESTING:
>> -			if (smmu_domain->smmu) {
>> -				ret =3D -EPERM;
>> -				goto out_unlock;
>> -			}
>> -
>> -			if (*(int *)data)
>> -				smmu_domain->stage =3D ARM_SMMU_DOMAIN_NESTED;
>> -			else
>> -				smmu_domain->stage =3D ARM_SMMU_DOMAIN_S1;
>> -			break;
>> -		default:
>> -			ret =3D -ENODEV;
>> -		}
>> -		break;
>> -	case IOMMU_DOMAIN_DMA:
>> -		switch(attr) {
>> -		case DOMAIN_ATTR_DMA_USE_FLUSH_QUEUE:
>> -			smmu_domain->non_strict =3D *(int *)data;
>> -			break;
>> -		default:
>> -			ret =3D -ENODEV;
>> -		}
>> -		break;
>> -	default:
>> -		ret =3D -EINVAL;
>> -	}
>> -
>> -out_unlock:
>> -	mutex_unlock(&smmu_domain->init_mutex);
>> -	return ret;
>> -}
>> -
>> -static int arm_smmu_of_xlate(struct device *dev, struct of_phandle_args=
 *args)
>> -{
>> -	return iommu_fwspec_add_ids(dev, args->args, 1);
>> -}
>> -
>> -static void arm_smmu_get_resv_regions(struct device *dev,
>> -				      struct list_head *head)
>> -{
>> -	struct iommu_resv_region *region;
>> -	int prot =3D IOMMU_WRITE | IOMMU_NOEXEC | IOMMU_MMIO;
>> -
>> -	region =3D iommu_alloc_resv_region(MSI_IOVA_BASE, MSI_IOVA_LENGTH,
>> -					 prot, IOMMU_RESV_SW_MSI);
>> -	if (!region)
>> -		return;
>> -
>> -	list_add_tail(&region->list, head);
>> -
>> -	iommu_dma_get_resv_regions(dev, head);
>> -}
>> -
>> -static struct iommu_ops arm_smmu_ops =3D {
>> -	.capable		=3D arm_smmu_capable,
>> -	.domain_alloc		=3D arm_smmu_domain_alloc,
>> -	.domain_free		=3D arm_smmu_domain_free,
>> -	.attach_dev		=3D arm_smmu_attach_dev,
>> -	.map			=3D arm_smmu_map,
>> -	.unmap			=3D arm_smmu_unmap,
>> -	.flush_iotlb_all	=3D arm_smmu_flush_iotlb_all,
>> -	.iotlb_sync		=3D arm_smmu_iotlb_sync,
>> -	.iova_to_phys		=3D arm_smmu_iova_to_phys,
>> -	.probe_device		=3D arm_smmu_probe_device,
>> -	.release_device		=3D arm_smmu_release_device,
>> -	.device_group		=3D arm_smmu_device_group,
>> -	.domain_get_attr	=3D arm_smmu_domain_get_attr,
>> -	.domain_set_attr	=3D arm_smmu_domain_set_attr,
>> -	.of_xlate		=3D arm_smmu_of_xlate,
>> -	.get_resv_regions	=3D arm_smmu_get_resv_regions,
>> -	.put_resv_regions	=3D generic_iommu_put_resv_regions,
>> -	.pgsize_bitmap		=3D -1UL, /* Restricted during device attach */
>> -};
>> -
>>  /* Probing and initialisation functions */
>>  static int arm_smmu_init_one_queue(struct arm_smmu_device *smmu,
>>  				   struct arm_smmu_queue *q,
>> @@ -2406,7 +2032,6 @@ static int arm_smmu_device_hw_probe(struct arm_smm=
u_device *smmu)
>>  	switch (FIELD_GET(IDR0_STALL_MODEL, reg)) {
>>  	case IDR0_STALL_MODEL_FORCE:
>>  		smmu->features |=3D ARM_SMMU_FEAT_STALL_FORCE;
>> -		fallthrough;
>=20
> We should keep all the fallthrough documented. So I think we want to intr=
oduce the fallthrough in Xen as well.

Ok I will keep fallthrough documented in this patch.=20

fallthrough implementation in XEN should be another patch. I am not sure wh=
en we can implement but we will try to implement.

>=20
>>  	case IDR0_STALL_MODEL_STALL:
>>  		smmu->features |=3D ARM_SMMU_FEAT_STALLS;
>>  	}
>> @@ -2426,7 +2051,6 @@ static int arm_smmu_device_hw_probe(struct arm_smm=
u_device *smmu)
>>  	switch (FIELD_GET(IDR0_TTF, reg)) {
>>  	case IDR0_TTF_AARCH32_64:
>>  		smmu->ias =3D 40;
>> -		fallthrough;
>>  	case IDR0_TTF_AARCH64:
>>  		break;
>>  	default:
>> @@ -2515,21 +2139,10 @@ static int arm_smmu_device_hw_probe(struct arm_s=
mmu_device *smmu)
>>  	default:
>>  		dev_info(smmu->dev,
>>  			"unknown output address size. Truncating to 48-bit\n");
>> -		fallthrough;
>>  	case IDR5_OAS_48_BIT:
>>  		smmu->oas =3D 48;
>>  	}
>>  -	if (arm_smmu_ops.pgsize_bitmap =3D=3D -1UL)
>> -		arm_smmu_ops.pgsize_bitmap =3D smmu->pgsize_bitmap;
>> -	else
>> -		arm_smmu_ops.pgsize_bitmap |=3D smmu->pgsize_bitmap;
>> -
>> -	/* Set the DMA mask for our table walker */
>> -	if (dma_set_mask_and_coherent(smmu->dev, DMA_BIT_MASK(smmu->oas)))
>> -		dev_warn(smmu->dev,
>> -			 "failed to set DMA mask for table walker\n");
>> -
>>  	smmu->ias =3D max(smmu->ias, smmu->oas);
>>    	dev_info(smmu->dev, "ias %lu-bit, oas %lu-bit (features 0x%08x)\n",
>> @@ -2595,9 +2208,6 @@ static int arm_smmu_device_dt_probe(struct platfor=
m_device *pdev,
>>    	parse_driver_options(smmu);
>>  -	if (of_dma_is_coherent(dev->of_node))
>> -		smmu->features |=3D ARM_SMMU_FEAT_COHERENCY;
>> -
>>  	return ret;
>>  }
>>  @@ -2609,55 +2219,6 @@ static unsigned long arm_smmu_resource_size(stru=
ct arm_smmu_device *smmu)
>>  		return SZ_128K;
>>  }
>>  -static int arm_smmu_set_bus_ops(struct iommu_ops *ops)
>> -{
>> -	int err;
>> -
>> -#ifdef CONFIG_PCI
>> -	if (pci_bus_type.iommu_ops !=3D ops) {
>> -		err =3D bus_set_iommu(&pci_bus_type, ops);
>> -		if (err)
>> -			return err;
>> -	}
>> -#endif
>> -#ifdef CONFIG_ARM_AMBA
>> -	if (amba_bustype.iommu_ops !=3D ops) {
>> -		err =3D bus_set_iommu(&amba_bustype, ops);
>> -		if (err)
>> -			goto err_reset_pci_ops;
>> -	}
>> -#endif
>> -	if (platform_bus_type.iommu_ops !=3D ops) {
>> -		err =3D bus_set_iommu(&platform_bus_type, ops);
>> -		if (err)
>> -			goto err_reset_amba_ops;
>> -	}
>> -
>> -	return 0;
>> -
>> -err_reset_amba_ops:
>> -#ifdef CONFIG_ARM_AMBA
>> -	bus_set_iommu(&amba_bustype, NULL);
>> -#endif
>> -err_reset_pci_ops: __maybe_unused;
>> -#ifdef CONFIG_PCI
>> -	bus_set_iommu(&pci_bus_type, NULL);
>> -#endif
>> -	return err;
>> -}
>> -
>> -static void __iomem *arm_smmu_ioremap(struct device *dev, resource_size=
_t start,
>> -				      resource_size_t size)
>=20
> This seems a bit odd that you are removing the function but not the calle=
rs. Shouldn't you keep this function until next patch?
>=20
Ok I will keep this in this patch and will remove in next patch.

>> -{
>> -	struct resource res =3D {
>> -		.flags =3D IORESOURCE_MEM,
>> -		.start =3D start,
>> -		.end =3D start + size - 1,
>> -	};
>> -
>> -	return devm_ioremap_resource(dev, &res);
>> -}
>> -
>>  static int arm_smmu_device_probe(struct platform_device *pdev)
>>  {
>>  	int irq, ret;
>> @@ -2785,21 +2346,3 @@ static const struct of_device_id arm_smmu_of_matc=
h[] =3D {
>>  	{ .compatible =3D "arm,smmu-v3", },
>>  	{ },
>>  };
>> -MODULE_DEVICE_TABLE(of, arm_smmu_of_match);
>> -
>> -static struct platform_driver arm_smmu_driver =3D {
>> -	.driver	=3D {
>> -		.name			=3D "arm-smmu-v3",
>> -		.of_match_table		=3D arm_smmu_of_match,
>> -		.suppress_bind_attrs	=3D true,
>> -	},
>> -	.probe	=3D arm_smmu_device_probe,
>> -	.remove	=3D arm_smmu_device_remove,
>> -	.shutdown =3D arm_smmu_device_shutdown,
>> -};
>> -module_platform_driver(arm_smmu_driver);
>> -
>> -MODULE_DESCRIPTION("IOMMU API for ARM architected SMMUv3 implementation=
s");
>> -MODULE_AUTHOR("Will Deacon <will@kernel.org>");
>> -MODULE_ALIAS("platform:arm-smmu-v3");
>> -MODULE_LICENSE("GPL v2");
>=20
> --=20
> Julien Grall


