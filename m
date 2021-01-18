Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E462FA4D6
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jan 2021 16:34:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.69769.125045 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1WYH-0003gp-T8; Mon, 18 Jan 2021 15:34:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 69769.125045; Mon, 18 Jan 2021 15:34:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1WYH-0003gO-PX; Mon, 18 Jan 2021 15:34:45 +0000
Received: by outflank-mailman (input) for mailman id 69769;
 Mon, 18 Jan 2021 15:34:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ECrn=GV=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1l1WYG-0003gF-FK
 for xen-devel@lists.xenproject.org; Mon, 18 Jan 2021 15:34:44 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.2.68]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 018bbaa2-5604-4f01-8222-c6b4c08b2413;
 Mon, 18 Jan 2021 15:34:42 +0000 (UTC)
Received: from DB6PR0202CA0011.eurprd02.prod.outlook.com (2603:10a6:4:29::21)
 by HE1PR08MB2779.eurprd08.prod.outlook.com (2603:10a6:7:35::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.14; Mon, 18 Jan
 2021 15:34:08 +0000
Received: from DB5EUR03FT031.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:29:cafe::db) by DB6PR0202CA0011.outlook.office365.com
 (2603:10a6:4:29::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9 via Frontend
 Transport; Mon, 18 Jan 2021 15:34:08 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT031.mail.protection.outlook.com (10.152.20.142) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.12 via Frontend Transport; Mon, 18 Jan 2021 15:34:08 +0000
Received: ("Tessian outbound 2b57fdd78668:v71");
 Mon, 18 Jan 2021 15:34:07 +0000
Received: from 999fd3b02cee.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A86C7FAC-AE1F-4AE7-9485-E7BA26DCE027.1; 
 Mon, 18 Jan 2021 15:34:02 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 999fd3b02cee.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 18 Jan 2021 15:34:02 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com (2603:10a6:10:49::10)
 by DB8PR08MB4027.eurprd08.prod.outlook.com (2603:10a6:10:a7::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.12; Mon, 18 Jan
 2021 15:33:59 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::f5c1:9694:9263:d90d]) by DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::f5c1:9694:9263:d90d%2]) with mapi id 15.20.3763.014; Mon, 18 Jan 2021
 15:33:59 +0000
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
X-Inumbo-ID: 018bbaa2-5604-4f01-8222-c6b4c08b2413
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XvjyKpKrg5Yo0u4yZkGArzclJ4pnHy0fgDw8P78Fjzk=;
 b=USKawSuvm6zvbBFmLGkBWarryBFGmWx4by/9Iu6k87BHTHynwDEkWp6z38mECcnvft/rh+f9IyNbKUuMES4wqTfunkmcroHeBUo32ksAxNccWn9V9tR3HicpD3KeazWQsWnM2QXIizUAkJOB2HmZ2E/rj2S71FKSd13EyHRIs9c=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 879131a63dd80cc5
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Suqoq8kGkmRI8ICUg3hV9yqfLakUlDVJIvWo16ocW+6XXsVKqR3UKKeJm8kRQKZNKlfyQlP8RF92Z1LrP7pISbP+66W2JUwgHHJM+Ff4aSdkENYJELWgfO5oEWKzdB7J4vehWVK35ysVrmlZ/lNMiPsLZI6iAvimnhktk9esYbMpRrFBrfMirXdWhtr7RAykBBEWvSb8VkLecrw6T130eFIuAzJ/qrm+r9ulVkxAPBkCubBFf/2zF6Vttm5Z9UWqJFgAuQ73764rFdlnZOrjXVRxQp6nAiOkkoDtuqrMsbYmdeLDa7TLDakIIDMMM+cs4HTMOAULClAPjJBMB+e1nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XvjyKpKrg5Yo0u4yZkGArzclJ4pnHy0fgDw8P78Fjzk=;
 b=NLu4S60a7MgZakgpKMHSBzWGdGmHaeP+JeNPKD0ItpIFhtwG3rLsKg+++mr965SxglmMuYdGBSX45LP07epN1hUOONduPAb0WacG/2ASkb/We/DysgzPQzDBXLgxG6wBbPAfyA0mSLoY+qRzuVejnTl/icOWXwkD5yDz6IpMQS46WcFN9vEOx0Ba4LDIbL9u8w2NJdTc4JvCq6fdH3U9MDLuvaerVv0M2haKDEdCJksCKP32CHD41W+Wvo7+LjvZlenuPcB7QRE/rltuhjajVZATT5HWkcHVJHzHkVNHvbkcJG29QEy8zaOpZNMOIDimEifJdY4E9lwiDt4L97cOvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XvjyKpKrg5Yo0u4yZkGArzclJ4pnHy0fgDw8P78Fjzk=;
 b=USKawSuvm6zvbBFmLGkBWarryBFGmWx4by/9Iu6k87BHTHynwDEkWp6z38mECcnvft/rh+f9IyNbKUuMES4wqTfunkmcroHeBUo32ksAxNccWn9V9tR3HicpD3KeazWQsWnM2QXIizUAkJOB2HmZ2E/rj2S71FKSd13EyHRIs9c=
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
Thread-Index: AQHW5c4BALh9w79bakGJi7B8FnwYpqoinLCAgAAIcQCACu3xgA==
Date: Mon, 18 Jan 2021 15:33:59 +0000
Message-ID: <5405ECAE-F22F-4893-B302-5D48C57A8847@arm.com>
References: <cover.1610115608.git.rahul.singh@arm.com>
 <9ba174516e01e2a53390420fa957ea563219141f.1610115608.git.rahul.singh@arm.com>
 <7762de2c-da11-5643-8f70-fdd87a7583eb@gmail.com>
 <81983272-f423-f24d-3094-1f4ba7568e1b@gmail.com>
In-Reply-To: <81983272-f423-f24d-3094-1f4ba7568e1b@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [80.1.41.211]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 9b146f37-98e6-4674-717a-08d8bbc67eeb
x-ms-traffictypediagnostic: DB8PR08MB4027:|HE1PR08MB2779:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<HE1PR08MB2779E25F67F59CD0EF7ADDA7FCA40@HE1PR08MB2779.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 yPLuchv7x8CblKrm5VABKkPrLuOvk28A9UjbyoW1iYEIUaN3k0TzGHu0YuJKW4ds3lOgPC2wvLe7GRKxutOVjOBlenA/1tevHJ/kkYJQFeqhQTM2fswpa2TnVufN+k4bdXW5NSw19joNXUaeWoDksl+49AfQcYTTvtW/RTtZzEXdjeohNz8xHKaV902He9ow80//+zRGIAfxjptT+ZWdZN2ezO+06tMwh6bgJD0dXeWZ8ZPHLMw9JNxDNFWiab+QXFKuPoPmCy9Gw/3M/x3q8Nsr72GgDDBmkE+SfU7CQumTUz4NSGtvCUVqUh9qQaax9jcUTEFQvD7lLuSmPCL0Fup6x8DPAFk74SCVZvgfOsad1G7iZIarVQtGc2eyi5ziW9V3qO6shVm3C1IenqB3AOL3CO+ymOVsiiu90uo45Lfz/TydjEKbXJwZ0/pTEFJb1AYon1Y8OPseHZH/jTot3Fqg0rr5tLqvh1f2dlvcm8dB1+fdXHiMtbHo4JhM3v+7qqjJCsAydu3bvhY1ICo9ecucbdroqXjXpW0ApRShGsXVh9Wenj28uBtoifEFVHaH3PcSKeiblSdhJ8lVUF5T3hIK69XhXqnlqzu0A7kaqEA=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3500.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(39860400002)(136003)(396003)(366004)(91956017)(53546011)(6506007)(5660300002)(66556008)(66446008)(64756008)(66476007)(76116006)(26005)(186003)(66946007)(86362001)(478600001)(6916009)(2616005)(7416002)(8676002)(83380400001)(8936002)(4326008)(6486002)(2906002)(33656002)(316002)(71200400001)(6512007)(36756003)(54906003)(45980500001)(309714004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?NnkR9JBe7aqPeMFCM5UGzfqcEgEKqw4CoLphKmmXUjHrmJKpLzwK8r2OxD/k?=
 =?us-ascii?Q?3phD85JGhGqjFyYb9bj5ggcr2IqhTC3OAm7tsoRwuQ7VzW65VANvRgWvQdl2?=
 =?us-ascii?Q?NxtGowUvnhLhnd4SH8JaxNu5FCJIqtl3DtHJppGxYAQXRJUN9ceNoKqtE4dw?=
 =?us-ascii?Q?lG81SOxhYftkED6XJJKCUn0Suz1vbBjFX2thHTlOIEdTCEkj3ak1dbi1zCu9?=
 =?us-ascii?Q?c88ztmkoKjfWxvxLrRl05ywbRK00X084Vz+hhgvD0SeZAuEt1gnz3Hk7e9+U?=
 =?us-ascii?Q?wBB4sOzPZI5jBpQwYPnUppjkYB4kJPGigj8QGtSFyw1WDHbuDFGFLuedRGM5?=
 =?us-ascii?Q?Hzeh9druU2xYIs2BgqJGSVW5VDs0tMAN9lbQNg5KAM44otpRVGcmzOg3wPnZ?=
 =?us-ascii?Q?MgwQIaIt23usHlOgixY2rl40MQqgVana2OPmDmcsNtdbZ+QXtjbEfVkTrTHt?=
 =?us-ascii?Q?SSmpPHzzo/x6a1ZMpgsql5kw1RUL+uJdsl9xxGKf6SUTMByQt6RLXXQAVYMx?=
 =?us-ascii?Q?42uFeQGhN1GLhbXIBeddyWKo4sw2oPKiCtbOL2sYpef5W2O3Fk1719iMxvJC?=
 =?us-ascii?Q?eGkrJD971vg0Z1ySD0LLVhuvQ+p6bUVIAOulMDGDfRqnDvKyFqNXn99O8n+V?=
 =?us-ascii?Q?loPZANsrEyPBwG9XRNaWJHT2FKX5KDVmeIXIr60BXtGnfqfoW+Aspo7+O14d?=
 =?us-ascii?Q?yUPRzrvymJs0yW9i2coYPd2hTA47vY9ydw1taJYEtcdwWxQaKTael0tWN9np?=
 =?us-ascii?Q?3y6PdaDBIa29i2pavd91VSPE3uls27R5M7coofpiQ31n5L/hNoV53lD4ujcp?=
 =?us-ascii?Q?Or0tbe0jKIfRPh/GQFrXYJeTTafd1aVYqVhAjvxTAgQyvFQRVKA77EITuYnm?=
 =?us-ascii?Q?TFNxKfWMSgjkhLzA9s9Ut30+52w2hcfNuYtllWVnLPQ2xucmrz2CZZ0H8Aug?=
 =?us-ascii?Q?fKLzgXwYQQcSycdelzPKs/K2nnO3gqvGXR0wc+Ro/yrs0taSgbIJ4ybQ/0cV?=
 =?us-ascii?Q?QwARSW20mOXOHiz3Ddds1YbOcJc6ySeKq0Cp5/fivNY0OqVjKZHqRpFIB1kp?=
 =?us-ascii?Q?z81m0Dny?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <7393BB7F784A2D4C9A562D4FA87E1BAE@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4027
Original-Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9f847f99-34fb-4400-2ad8-08d8bbc67a03
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VxNY78Xno1a7EALrhKvcTDqlyjOFwJ3u9gX+1eYdn8tZUYVB4k6zYK90Ud66I1voYMtmYFPPD76JRB5TLqalVdN91awsrx11j1pHK2wOKy49H4VG1+g8oB+drZIAIUXydSNO3PABcdFAcg4KdALb2+YYz/Ut64r/9Khoumyzf2HVRnS9IatYxjbAmztjFmvcvLa9ew1VBIKZ0zpPB04q/X5DdZ2dqiJTKcN16qoH90GLY96kZl9YmTLw05Alt64Xv8USljZndbVmFNm6Zau7y79UBp1ueGMe86mV3DZ1eMvD8VM6UW9dKQMvqUTe5ejSmw8o+MLjOm3gaxGo3opFPZ44ydmvvYosWn7qlhEH9/KDBqMsKuIQwg0eg5KSUOlQufsXZ7zNJWi/yAOFzBAyy2yLTiMbSoKv8wokI1guALybSEiao4X6FdRoxSGufgkDWNM5x1VeKBFI3g+ecrmVAwE/pB6gFffGnsmOxEDBhQI=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(39850400004)(376002)(136003)(396003)(46966006)(53546011)(6506007)(186003)(82740400003)(4326008)(316002)(26005)(81166007)(54906003)(83380400001)(82310400003)(70206006)(70586007)(478600001)(5660300002)(356005)(6486002)(36756003)(47076005)(107886003)(6862004)(8676002)(2906002)(33656002)(2616005)(336012)(8936002)(86362001)(6512007)(309714004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2021 15:34:08.0123
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b146f37-98e6-4674-717a-08d8bbc67eeb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR08MB2779

Hello Oleksandr,

> On 11 Jan 2021, at 4:39 pm, Oleksandr <olekstysh@gmail.com> wrote:
>=20
>=20
> Hi Rahul
>=20
>=20
>>> -
>>>   static int arm_smmu_device_probe(struct platform_device *pdev)
>>>   {
>>>       int irq, ret;
>>> -    struct resource *res;
>>> -    resource_size_t ioaddr;
>>> +    paddr_t ioaddr, iosize;
>>>       struct arm_smmu_device *smmu;
>>> -    struct device *dev =3D &pdev->dev;
>>> -    bool bypass;
>>>   -    smmu =3D devm_kzalloc(dev, sizeof(*smmu), GFP_KERNEL);
>>> +    smmu =3D xzalloc(struct arm_smmu_device);
>>>       if (!smmu) {
>>> -        dev_err(dev, "failed to allocate arm_smmu_device\n");
>>> +        dev_err(pdev, "failed to allocate arm_smmu_device\n");
>>>           return -ENOMEM;
>>>       }
>>> -    smmu->dev =3D dev;
>>> +    smmu->dev =3D pdev;
>>>   -    if (dev->of_node) {
>>> +    if (pdev->of_node) {
>>>           ret =3D arm_smmu_device_dt_probe(pdev, smmu);
>>> +        if (ret)
>>> +            return -EINVAL;
>>>       } else {
>>>           ret =3D arm_smmu_device_acpi_probe(pdev, smmu);
>>>           if (ret =3D=3D -ENODEV)
>>>               return ret;
>>>       }
>>>   -    /* Set bypass mode according to firmware probing result */
>>> -    bypass =3D !!ret;
>>> -
>>>       /* Base address */
>>> -    res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
>>> -    if (resource_size(res) < arm_smmu_resource_size(smmu)) {
>>> -        dev_err(dev, "MMIO region too small (%pr)\n", res);
>>> +    ret =3D dt_device_get_address(dev_to_dt(pdev), 0, &ioaddr, &iosize=
);
>>> +    if (ret)
>>> +        return -ENODEV;
>>> +
>>> +    if (iosize < arm_smmu_resource_size(smmu)) {
>>> +        dev_err(pdev, "MMIO region too small (%lx)\n", iosize);
>>>           return -EINVAL;
>>>       }
>>> -    ioaddr =3D res->start;
>>>         /*
>>>        * Don't map the IMPLEMENTATION DEFINED regions, since they may c=
ontain
>>> -     * the PMCG registers which are reserved by the PMU driver.
>>> +     * the PMCG registers which are optional and currently not support=
ed.
>>>        */
>>> -    smmu->base =3D arm_smmu_ioremap(dev, ioaddr, ARM_SMMU_REG_SZ);
>>> +    smmu->base =3D ioremap_nocache(ioaddr, ARM_SMMU_REG_SZ);
>>>       if (IS_ERR(smmu->base))
>>>           return PTR_ERR(smmu->base);
>>>   -    if (arm_smmu_resource_size(smmu) > SZ_64K) {
>>> -        smmu->page1 =3D arm_smmu_ioremap(dev, ioaddr + SZ_64K,
>>> +    if (iosize > SZ_64K) {
>>> +        smmu->page1 =3D ioremap_nocache(ioaddr + SZ_64K,
>>>                              ARM_SMMU_REG_SZ);
>>>           if (IS_ERR(smmu->page1))
>>>               return PTR_ERR(smmu->page1);
>>> @@ -2765,14 +3101,262 @@ static int arm_smmu_device_probe(struct platfo=
rm_device *pdev)
>>>           return ret;
>>>         /* Reset the device */
>>> -    ret =3D arm_smmu_device_reset(smmu, bypass);
>>> +    ret =3D arm_smmu_device_reset(smmu);
>>>       if (ret)
>>>           return ret;
>>>   +    /*
>>> +     * Keep a list of all probed devices. This will be used to query
>>> +     * the smmu devices based on the fwnode.
>>> +     */
>>> +    INIT_LIST_HEAD(&smmu->devices);
>>> +
>>> +    spin_lock(&arm_smmu_devices_lock);
>>> +    list_add(&smmu->devices, &arm_smmu_devices);
>>> +    spin_unlock(&arm_smmu_devices_lock);
>=20
> Looks like that we need some kind of manual roll-back logic here in case =
of error during probe (there is no real devm_*):
>=20
> iounmap, xfree, etc.

I agree with you that manual roll-back logic is good to have clean code but=
 in this scenario what I have found out that if there is an error during pr=
obe arm_smmu_device_probe() will return and XEN will not continue to boot (=
call panic function) , in that case if we free the memory also there is no =
much difference. That why I decided not to modify the code that we ported f=
rom Linux.

XEN) I/O virtualisation disabled
(XEN)=20
(XEN) ****************************************
(XEN) Panic on CPU 0:
(XEN) Couldn't configure correctly all the IOMMUs.
(XEN) ****************************************
(XEN)=20
(XEN) Manual reset required ('noreboot' specified)

Do we have a requirement to continue to boot the XEN if there is an IOMMU a=
vailable in the system and IOMMU probe is failed? If yes then I will modify=
 the code to free all the resources if there is error during probe.


Regards,
Rahul
>=20
>=20
>>>=20
>>> +
>>>       return 0;
>>>   }
>>=20
> --=20
> Regards,
>=20
> Oleksandr Tyshchenko
>=20


