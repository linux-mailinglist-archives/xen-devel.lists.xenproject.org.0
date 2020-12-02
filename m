Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 661742CBDD1
	for <lists+xen-devel@lfdr.de>; Wed,  2 Dec 2020 14:08:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.42706.76840 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkRrf-0001Ve-BI; Wed, 02 Dec 2020 13:08:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 42706.76840; Wed, 02 Dec 2020 13:08:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkRrf-0001VE-7V; Wed, 02 Dec 2020 13:08:11 +0000
Received: by outflank-mailman (input) for mailman id 42706;
 Wed, 02 Dec 2020 13:08:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8zz6=FG=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1kkRrd-0001UK-QN
 for xen-devel@lists.xenproject.org; Wed, 02 Dec 2020 13:08:09 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (unknown
 [40.107.15.88]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d8ec5658-98e7-46ac-a19a-f1f7efd86ef7;
 Wed, 02 Dec 2020 13:08:07 +0000 (UTC)
Received: from AS8PR04CA0025.eurprd04.prod.outlook.com (2603:10a6:20b:310::30)
 by VE1PR08MB5134.eurprd08.prod.outlook.com (2603:10a6:803:110::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.24; Wed, 2 Dec
 2020 13:08:04 +0000
Received: from VE1EUR03FT053.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:310:cafe::33) by AS8PR04CA0025.outlook.office365.com
 (2603:10a6:20b:310::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.18 via Frontend
 Transport; Wed, 2 Dec 2020 13:08:04 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT053.mail.protection.outlook.com (10.152.19.198) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.17 via Frontend Transport; Wed, 2 Dec 2020 13:08:03 +0000
Received: ("Tessian outbound 6ec21dac9dd3:v71");
 Wed, 02 Dec 2020 13:08:03 +0000
Received: from 115d48dd8c1b.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 CF21F612-78FF-48A1-B430-A048B8CC1E42.1; 
 Wed, 02 Dec 2020 13:07:57 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 115d48dd8c1b.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 02 Dec 2020 13:07:57 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com (2603:10a6:10:49::10)
 by DBBPR08MB4629.eurprd08.prod.outlook.com (2603:10a6:10:f4::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.25; Wed, 2 Dec
 2020 13:07:54 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::21f3:34c:8f7e:42ef]) by DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::21f3:34c:8f7e:42ef%2]) with mapi id 15.20.3611.025; Wed, 2 Dec 2020
 13:07:54 +0000
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
X-Inumbo-ID: d8ec5658-98e7-46ac-a19a-f1f7efd86ef7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4th91duCNOldyqSfMrh+bv83mKXJID4jEUUfnNKZ3Lg=;
 b=5SBpEv0hVSG9d4TZR5Z52y04bHceiXFRstXR4clbOLjz05xtC2V7Yn79u5D16nlNzEvFe+jygkmfVrrsJ+Zj2HJUn2cFmtDE8vtaqBlDQtdM2EBfKMLJ+UxmkbzOjKfWU16fxVv5yXbdadxARNAmuivBNrFzB/1jvOhLVkZXGtY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8b7abede8de565d9
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lmAgi4U8dIlvIVN6d6mvwLWwVY/XMUacdgJsoctiLMhB9HvPgNZZku0wh/iQPxDPQs6Zo4e/OcLjeSwwB+RHHN38F2XXUZ2GiyJ1/ubMZnLkCT4B1JtHD+l4SQmo/MTAB9ItSIwgrfuc1DHPAHVf52SNRLwJMP9r58VypfsHXJ/TtyFB/qiASbjewCjnPnD/ipKiiOHyp7cym6OOaXBCq2hYFblmFH698NYFGZO827IO5OW/Obp94McutFslxteOdbc6aUycpUXhamb1QPXQTtU6HZYBA8nvM4svhKBx6yWE/sSbnx7Q92uKaAR/immIboPGNQm/GPdBR9BcuJTHOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4th91duCNOldyqSfMrh+bv83mKXJID4jEUUfnNKZ3Lg=;
 b=ev6TnqaNO2fsMy0+E72X2Uk/xSefDdcXg4r3PmqGFf1CbAwMAotcWwN6GHOrX8cSroDHBHfY2No15AZlVV+lOHGWJuSl/kLak3+bbfm9UUmyinvtJsXvRmVanxoIiPL+qlubxyvv3two9pJGEdE+PdrqpTLOAIC0t+Gqo+nr1mvsJS/zTB1hjNpSQ7lPjdW8d8B3o8mtmGY+E8HAp+Ur/UFCKqWojsfHH36fjz1kkfSADgH4Yts7BVtecUxSs0LE9n4qAWPyE48SJM0ixdISdg6AG4gHxmAbuWtfo9lZ1aCkCC/ceu9nRyTooY+OPcbNCqGfVySEvz/edI7uBbkamA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4th91duCNOldyqSfMrh+bv83mKXJID4jEUUfnNKZ3Lg=;
 b=5SBpEv0hVSG9d4TZR5Z52y04bHceiXFRstXR4clbOLjz05xtC2V7Yn79u5D16nlNzEvFe+jygkmfVrrsJ+Zj2HJUn2cFmtDE8vtaqBlDQtdM2EBfKMLJ+UxmkbzOjKfWU16fxVv5yXbdadxARNAmuivBNrFzB/1jvOhLVkZXGtY=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 5/8] xen/arm: Remove support for PCI ATS on SMMUv3
Thread-Topic: [PATCH v2 5/8] xen/arm: Remove support for PCI ATS on SMMUv3
Thread-Index: AQHWxBX6mY7D6FQdO06LxAF1ZfWTsani/uUAgADROIA=
Date: Wed, 2 Dec 2020 13:07:54 +0000
Message-ID: <9DCDC4CF-6503-477A-8C38-E50D1448B598@arm.com>
References: <cover.1606406359.git.rahul.singh@arm.com>
 <78079d1d6e9d2e7e87125da131e9bdb5809b838a.1606406359.git.rahul.singh@arm.com>
 <alpine.DEB.2.21.2012011637560.1100@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2012011637560.1100@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [217.140.99.251]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4b6fdeee-ead9-4bc1-ce9b-08d896c34d93
x-ms-traffictypediagnostic: DBBPR08MB4629:|VE1PR08MB5134:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<VE1PR08MB513401F396EE8BD14B093EBCFCF30@VE1PR08MB5134.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:639;OLM:605;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 HGCWlaT+KemwTOZAuI0qJu9JUByzLg+fl8wq1elnRWOhKwhfzxP0Vo1bXZ+7anEaeOmJuXXkGB53pF3lCS9wD3OYtm8/bCaU9kIVypCjwhnCjpxhWFLTDtcPavnLDJa697HHginXFtlca/fKhgcYI9CEJHSUT2uP8oiblzl8ZpwKLuMcbCE1dPKuJpMYxlG2MVJO0W/V42SyJftW4xgJeMMNC2naK4m96YwFaDXRBQR8HpSx5kjhxS/F2sfSodkL/1whPeeE48ht91kVGmgdLzVT3b7ZZDU25pcN6x116Q67Le24zzNgvj8Yh7CT0WCv3uAmoCXAtM9J+6Zn7tDdOrTl9etI+WvUW6qpZpW4s0N2Q7PGS6lNRsu27hLokWI8uHbUGNwY9rfgayVinSHKgiUte73yW4QoYs9ZBB4b6Ao=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3500.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(396003)(366004)(376002)(346002)(136003)(64756008)(6506007)(26005)(8936002)(2616005)(66476007)(478600001)(30864003)(6916009)(186003)(36756003)(6512007)(66946007)(53546011)(33656002)(5660300002)(2906002)(66556008)(4326008)(6486002)(54906003)(83380400001)(66446008)(8676002)(91956017)(76116006)(86362001)(71200400001)(316002)(45980500001)(309714004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?KUAL8opg5+yKUsejdsyNaIMLE3MvC3x52WEdsnWYa+eBRnUMzlfJ6l0IeNa7?=
 =?us-ascii?Q?6Aoe97u0NOLjl3szZl8DJ3zlXUfwO16wG+FV3nrubYtMAeAC3izRiLIWtNly?=
 =?us-ascii?Q?qnt21LUlvyhgWCBGpyYtWcciX423ospJbcIWgiDPqjvLAMcX3OIF2b0AVB7v?=
 =?us-ascii?Q?Df+/qceP41v7UYh9+NtsDeQi5mHh7IwTAd9dgZhAcwLbpDJax/3Ve5d5+96E?=
 =?us-ascii?Q?vytYVUVwI31fq5K95REVOGQlK5stGD036VdBHb19dVmvRdvZo0CpDtxjCKFd?=
 =?us-ascii?Q?5Sf/mce31J8YkN3F5HDhHDNGD6LbGb/Qa8mes1CYcKfADcsNLQF6nvqdhVJE?=
 =?us-ascii?Q?JFBR2xvZFYtSHIPoZ21Wsk3AbPjdjhPZ3gzgBHU/ATkufyaTN+e/D7SObOUY?=
 =?us-ascii?Q?GsiwpPnf+ERwszVHY6aprBaHTk/su0UkMwE1AgnlwcTydH+KQ/pTfFesG1ls?=
 =?us-ascii?Q?ahYl6owa9/E1oLtTTHGXNbmmWw1DTfQTZLmVZGmZHSKgZsV7bUeur8zz8vXX?=
 =?us-ascii?Q?9lcYsNhJ9igwUlxj6LxJGBSNrwJulHo9pne+fNvxF8r2VrQV2Rrh2KzZ4rVd?=
 =?us-ascii?Q?ZMAf1VVQjQ04BGGm4RudhEu2pkNLkEEW2paGnPUNczc7b9pu/9RxmF7QeiPR?=
 =?us-ascii?Q?6TnvQzTkZxWTpanTmjmbuBtg+gK3dUdRnNgy3ZALQftQzrNYhbX01rAcwa+c?=
 =?us-ascii?Q?dVQZXzQbSnp5x216MrGypeCThewGvwpoYOA6v+J8z3fCm/VYLEd9TzsEqBYX?=
 =?us-ascii?Q?vZGD/l7SMlhd9mF0cEEW51uogXK01N2qrCRcE6f7PVsE28W4w8USBGTWc93V?=
 =?us-ascii?Q?IRdwKKREKJ4O0lCgGxQmgTyRZRSfCmnqpqQxQ6t/W6EdNugJaXoYhkSt6he1?=
 =?us-ascii?Q?bvSsWEuaf5PiJDaE6l+ecn34Vyd9TCnpmGdQ/XdQRYtZYjArmnmCg+0RPkPm?=
 =?us-ascii?Q?rYEqf59I94BHtnn1n8iT0NfEZH64kYH1GGt1g9gGOVCjevDN8iD4ne/ZbyUD?=
 =?us-ascii?Q?DFg5?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1D4995E940986A499FCA7121AB8245CA@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4629
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	24a54b48-9ccb-4ecf-ea43-08d896c347e9
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	F6TWcz2CX8ZSl89aAWCqo9BJxrLUKHl7rGdm/G8RCti+yfJ5Mn2siFcgrqic3bC/UOinG90qLVnrC22WKOQx1cZ/JhdtOyZ7RaduWudzFMMR2MRv7kDdQQHxXSGtrPLyfrLrL8UvhTU5TwjYB9b9+Kt9lyhwO0VCEpojJlIk4YGbks0ne4o8ZPkIXWcpHp2aJust4mZ26gXD83JYhXbsziA6B0a8VUXwjIXaLg5lXeDEPC6PLyy5u022ycnsyi26iiyOWKaGRvLTfUrt27OYurN1SgdFqaGLt+MzZZoPF/liO3gAi30qSSsKg5OfbOxGOjg2kg90AA92KQLSR3ly2IlQOse0aoVCDPpj4KLTDoUl1hhUT8rQ7+biWkINafuH9nAJ3hRgpj+I2zbFcz2Z80vTGQbFz72kvt+JWIOB7lA=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(376002)(136003)(396003)(346002)(46966005)(70586007)(8936002)(81166007)(47076004)(82740400003)(6512007)(6862004)(26005)(336012)(53546011)(6506007)(186003)(316002)(83380400001)(54906003)(82310400003)(36756003)(356005)(33656002)(86362001)(2616005)(4326008)(107886003)(2906002)(30864003)(6486002)(8676002)(70206006)(478600001)(5660300002)(309714004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2020 13:08:03.5557
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b6fdeee-ead9-4bc1-ce9b-08d896c34d93
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5134

Hello Stefano,

> On 2 Dec 2020, at 12:39 am, Stefano Stabellini <sstabellini@kernel.org> w=
rote:
>=20
> On Thu, 26 Nov 2020, Rahul Singh wrote:
>> PCI ATS functionality is not implemented and tested on ARM. Remove the
>> PCI ATS support, once PCI ATS support is tested and available this
>> patch can be added.
>>=20
>> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
>=20
> This looks like a revert of 9ce27afc0830f. Can we add that as a note to
> the commit message?
=20
Ok I will add in next version.

>=20
> One very minor comment at the bottom

Ack.

Regards,
Rahul
>=20
>=20
>> ---
>> xen/drivers/passthrough/arm/smmu-v3.c | 273 --------------------------
>> 1 file changed, 273 deletions(-)
>>=20
>> diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthr=
ough/arm/smmu-v3.c
>> index 401f7ae006..6a33628087 100644
>> --- a/xen/drivers/passthrough/arm/smmu-v3.c
>> +++ b/xen/drivers/passthrough/arm/smmu-v3.c
>> @@ -460,16 +460,6 @@ struct arm_smmu_cmdq_ent {
>> 			u64			addr;
>> 		} tlbi;
>>=20
>> -		#define CMDQ_OP_ATC_INV		0x40
>> -		#define ATC_INV_SIZE_ALL	52
>> -		struct {
>> -			u32			sid;
>> -			u32			ssid;
>> -			u64			addr;
>> -			u8			size;
>> -			bool			global;
>> -		} atc;
>> -
>> 		#define CMDQ_OP_PRI_RESP	0x41
>> 		struct {
>> 			u32			sid;
>> @@ -632,7 +622,6 @@ struct arm_smmu_master {
>> 	struct list_head		domain_head;
>> 	u32				*sids;
>> 	unsigned int			num_sids;
>> -	bool				ats_enabled;
>> 	unsigned int			ssid_bits;
>> };
>>=20
>> @@ -650,7 +639,6 @@ struct arm_smmu_domain {
>>=20
>> 	struct io_pgtable_ops		*pgtbl_ops;
>> 	bool				non_strict;
>> -	atomic_t			nr_ats_masters;
>>=20
>> 	enum arm_smmu_domain_stage	stage;
>> 	union {
>> @@ -886,14 +874,6 @@ static int arm_smmu_cmdq_build_cmd(u64 *cmd, struct=
 arm_smmu_cmdq_ent *ent)
>> 	case CMDQ_OP_TLBI_S12_VMALL:
>> 		cmd[0] |=3D FIELD_PREP(CMDQ_TLBI_0_VMID, ent->tlbi.vmid);
>> 		break;
>> -	case CMDQ_OP_ATC_INV:
>> -		cmd[0] |=3D FIELD_PREP(CMDQ_0_SSV, ent->substream_valid);
>> -		cmd[0] |=3D FIELD_PREP(CMDQ_ATC_0_GLOBAL, ent->atc.global);
>> -		cmd[0] |=3D FIELD_PREP(CMDQ_ATC_0_SSID, ent->atc.ssid);
>> -		cmd[0] |=3D FIELD_PREP(CMDQ_ATC_0_SID, ent->atc.sid);
>> -		cmd[1] |=3D FIELD_PREP(CMDQ_ATC_1_SIZE, ent->atc.size);
>> -		cmd[1] |=3D ent->atc.addr & CMDQ_ATC_1_ADDR_MASK;
>> -		break;
>> 	case CMDQ_OP_PRI_RESP:
>> 		cmd[0] |=3D FIELD_PREP(CMDQ_0_SSV, ent->substream_valid);
>> 		cmd[0] |=3D FIELD_PREP(CMDQ_PRI_0_SSID, ent->pri.ssid);
>> @@ -925,7 +905,6 @@ static void arm_smmu_cmdq_skip_err(struct arm_smmu_d=
evice *smmu)
>> 		[CMDQ_ERR_CERROR_NONE_IDX]	=3D "No error",
>> 		[CMDQ_ERR_CERROR_ILL_IDX]	=3D "Illegal command",
>> 		[CMDQ_ERR_CERROR_ABT_IDX]	=3D "Abort on command fetch",
>> -		[CMDQ_ERR_CERROR_ATC_INV_IDX]	=3D "ATC invalidate timeout",
>> 	};
>>=20
>> 	int i;
>> @@ -945,14 +924,6 @@ static void arm_smmu_cmdq_skip_err(struct arm_smmu_=
device *smmu)
>> 		dev_err(smmu->dev, "retrying command fetch\n");
>> 	case CMDQ_ERR_CERROR_NONE_IDX:
>> 		return;
>> -	case CMDQ_ERR_CERROR_ATC_INV_IDX:
>> -		/*
>> -		 * ATC Invalidation Completion timeout. CONS is still pointing
>> -		 * at the CMD_SYNC. Attempt to complete other pending commands
>> -		 * by repeating the CMD_SYNC, though we might well end up back
>> -		 * here since the ATC invalidation may still be pending.
>> -		 */
>> -		return;
>> 	case CMDQ_ERR_CERROR_ILL_IDX:
>> 	default:
>> 		break;
>> @@ -1422,9 +1393,6 @@ static void arm_smmu_write_strtab_ent(struct arm_s=
mmu_master *master, u32 sid,
>> 		val |=3D FIELD_PREP(STRTAB_STE_0_CFG, STRTAB_STE_0_CFG_S2_TRANS);
>> 	}
>>=20
>> -	if (master->ats_enabled)
>> -		dst[1] |=3D cpu_to_le64(FIELD_PREP(STRTAB_STE_1_EATS,
>> -						 STRTAB_STE_1_EATS_TRANS));
>>=20
>> 	arm_smmu_sync_ste_for_sid(smmu, sid);
>> 	/* See comment in arm_smmu_write_ctx_desc() */
>> @@ -1633,112 +1601,6 @@ static irqreturn_t arm_smmu_combined_irq_handler=
(int irq, void *dev)
>> 	return IRQ_WAKE_THREAD;
>> }
>>=20
>> -static void
>> -arm_smmu_atc_inv_to_cmd(int ssid, unsigned long iova, size_t size,
>> -			struct arm_smmu_cmdq_ent *cmd)
>> -{
>> -	size_t log2_span;
>> -	size_t span_mask;
>> -	/* ATC invalidates are always on 4096-bytes pages */
>> -	size_t inval_grain_shift =3D 12;
>> -	unsigned long page_start, page_end;
>> -
>> -	*cmd =3D (struct arm_smmu_cmdq_ent) {
>> -		.opcode			=3D CMDQ_OP_ATC_INV,
>> -		.substream_valid	=3D !!ssid,
>> -		.atc.ssid		=3D ssid,
>> -	};
>> -
>> -	if (!size) {
>> -		cmd->atc.size =3D ATC_INV_SIZE_ALL;
>> -		return;
>> -	}
>> -
>> -	page_start	=3D iova >> inval_grain_shift;
>> -	page_end	=3D (iova + size - 1) >> inval_grain_shift;
>> -
>> -	/*
>> -	 * In an ATS Invalidate Request, the address must be aligned on the
>> -	 * range size, which must be a power of two number of page sizes. We
>> -	 * thus have to choose between grossly over-invalidating the region, o=
r
>> -	 * splitting the invalidation into multiple commands. For simplicity
>> -	 * we'll go with the first solution, but should refine it in the futur=
e
>> -	 * if multiple commands are shown to be more efficient.
>> -	 *
>> -	 * Find the smallest power of two that covers the range. The most
>> -	 * significant differing bit between the start and end addresses,
>> -	 * fls(start ^ end), indicates the required span. For example:
>> -	 *
>> -	 * We want to invalidate pages [8; 11]. This is already the ideal rang=
e:
>> -	 *		x =3D 0b1000 ^ 0b1011 =3D 0b11
>> -	 *		span =3D 1 << fls(x) =3D 4
>> -	 *
>> -	 * To invalidate pages [7; 10], we need to invalidate [0; 15]:
>> -	 *		x =3D 0b0111 ^ 0b1010 =3D 0b1101
>> -	 *		span =3D 1 << fls(x) =3D 16
>> -	 */
>> -	log2_span	=3D fls_long(page_start ^ page_end);
>> -	span_mask	=3D (1ULL << log2_span) - 1;
>> -
>> -	page_start	&=3D ~span_mask;
>> -
>> -	cmd->atc.addr	=3D page_start << inval_grain_shift;
>> -	cmd->atc.size	=3D log2_span;
>> -}
>> -
>> -static int arm_smmu_atc_inv_master(struct arm_smmu_master *master,
>> -				   struct arm_smmu_cmdq_ent *cmd)
>> -{
>> -	int i;
>> -
>> -	if (!master->ats_enabled)
>> -		return 0;
>> -
>> -	for (i =3D 0; i < master->num_sids; i++) {
>> -		cmd->atc.sid =3D master->sids[i];
>> -		arm_smmu_cmdq_issue_cmd(master->smmu, cmd);
>> -	}
>> -
>> -	return arm_smmu_cmdq_issue_sync(master->smmu);
>> -}
>> -
>> -static int arm_smmu_atc_inv_domain(struct arm_smmu_domain *smmu_domain,
>> -				   int ssid, unsigned long iova, size_t size)
>> -{
>> -	int ret =3D 0;
>> -	unsigned long flags;
>> -	struct arm_smmu_cmdq_ent cmd;
>> -	struct arm_smmu_master *master;
>> -
>> -	if (!(smmu_domain->smmu->features & ARM_SMMU_FEAT_ATS))
>> -		return 0;
>> -
>> -	/*
>> -	 * Ensure that we've completed prior invalidation of the main TLBs
>> -	 * before we read 'nr_ats_masters' in case of a concurrent call to
>> -	 * arm_smmu_enable_ats():
>> -	 *
>> -	 *	// unmap()			// arm_smmu_enable_ats()
>> -	 *	TLBI+SYNC			atomic_inc(&nr_ats_masters);
>> -	 *	smp_mb();			[...]
>> -	 *	atomic_read(&nr_ats_masters);	pci_enable_ats() // writel()
>> -	 *
>> -	 * Ensures that we always see the incremented 'nr_ats_masters' count i=
f
>> -	 * ATS was enabled at the PCI device before completion of the TLBI.
>> -	 */
>> -	smp_mb();
>> -	if (!atomic_read(&smmu_domain->nr_ats_masters))
>> -		return 0;
>> -
>> -	arm_smmu_atc_inv_to_cmd(ssid, iova, size, &cmd);
>> -
>> -	spin_lock_irqsave(&smmu_domain->devices_lock, flags);
>> -	list_for_each_entry(master, &smmu_domain->devices, domain_head)
>> -		ret |=3D arm_smmu_atc_inv_master(master, &cmd);
>> -	spin_unlock_irqrestore(&smmu_domain->devices_lock, flags);
>> -
>> -	return ret ? -ETIMEDOUT : 0;
>> -}
>>=20
>> /* IO_PGTABLE API */
>> static void arm_smmu_tlb_inv_context(void *cookie)
>> @@ -1765,7 +1627,6 @@ static void arm_smmu_tlb_inv_context(void *cookie)
>> 	 */
>> 	arm_smmu_cmdq_issue_cmd(smmu, &cmd);
>> 	arm_smmu_cmdq_issue_sync(smmu);
>> -	arm_smmu_atc_inv_domain(smmu_domain, 0, 0, 0);
>> }
>>=20
>> static void arm_smmu_tlb_inv_range_nosync(unsigned long iova, size_t siz=
e,
>> @@ -2106,108 +1967,6 @@ static void arm_smmu_install_ste_for_dev(struct =
arm_smmu_master *master)
>> 	}
>> }
>>=20
>> -static bool arm_smmu_ats_supported(struct arm_smmu_master *master)
>> -{
>> -	struct device *dev =3D master->dev;
>> -	struct arm_smmu_device *smmu =3D master->smmu;
>> -	struct iommu_fwspec *fwspec =3D dev_iommu_fwspec_get(dev);
>> -
>> -	if (!(smmu->features & ARM_SMMU_FEAT_ATS))
>> -		return false;
>> -
>> -	if (!(fwspec->flags & IOMMU_FWSPEC_PCI_RC_ATS))
>> -		return false;
>> -
>> -	return dev_is_pci(dev) && pci_ats_supported(to_pci_dev(dev));
>> -}
>> -
>> -static void arm_smmu_enable_ats(struct arm_smmu_master *master)
>> -{
>> -	size_t stu;
>> -	struct pci_dev *pdev;
>> -	struct arm_smmu_device *smmu =3D master->smmu;
>> -	struct arm_smmu_domain *smmu_domain =3D master->domain;
>> -
>> -	/* Don't enable ATS at the endpoint if it's not enabled in the STE */
>> -	if (!master->ats_enabled)
>> -		return;
>> -
>> -	/* Smallest Translation Unit: log2 of the smallest supported granule *=
/
>> -	stu =3D __ffs(smmu->pgsize_bitmap);
>> -	pdev =3D to_pci_dev(master->dev);
>> -
>> -	atomic_inc(&smmu_domain->nr_ats_masters);
>> -	arm_smmu_atc_inv_domain(smmu_domain, 0, 0, 0);
>> -	if (pci_enable_ats(pdev, stu))
>> -		dev_err(master->dev, "Failed to enable ATS (STU %zu)\n", stu);
>> -}
>> -
>> -static void arm_smmu_disable_ats(struct arm_smmu_master *master)
>> -{
>> -	struct arm_smmu_cmdq_ent cmd;
>> -	struct arm_smmu_domain *smmu_domain =3D master->domain;
>> -
>> -	if (!master->ats_enabled)
>> -		return;
>> -
>> -	pci_disable_ats(to_pci_dev(master->dev));
>> -	/*
>> -	 * Ensure ATS is disabled at the endpoint before we issue the
>> -	 * ATC invalidation via the SMMU.
>> -	 */
>> -	wmb();
>> -	arm_smmu_atc_inv_to_cmd(0, 0, 0, &cmd);
>> -	arm_smmu_atc_inv_master(master, &cmd);
>> -    atomic_dec(&smmu_domain->nr_ats_masters);
>> -}
>> -
>> -static int arm_smmu_enable_pasid(struct arm_smmu_master *master)
>> -{
>> -	int ret;
>> -	int features;
>> -	int num_pasids;
>> -	struct pci_dev *pdev;
>> -
>> -	if (!dev_is_pci(master->dev))
>> -		return -ENODEV;
>> -
>> -	pdev =3D to_pci_dev(master->dev);
>> -
>> -	features =3D pci_pasid_features(pdev);
>> -	if (features < 0)
>> -		return features;
>> -
>> -	num_pasids =3D pci_max_pasids(pdev);
>> -	if (num_pasids <=3D 0)
>> -		return num_pasids;
>> -
>> -	ret =3D pci_enable_pasid(pdev, features);
>> -	if (ret) {
>> -		dev_err(&pdev->dev, "Failed to enable PASID\n");
>> -		return ret;
>> -	}
>> -
>> -	master->ssid_bits =3D min_t(u8, ilog2(num_pasids),
>> -				  master->smmu->ssid_bits);
>> -	return 0;
>> -}
>> -
>> -static void arm_smmu_disable_pasid(struct arm_smmu_master *master)
>> -{
>> -	struct pci_dev *pdev;
>> -
>> -	if (!dev_is_pci(master->dev))
>> -		return;
>> -
>> -	pdev =3D to_pci_dev(master->dev);
>> -
>> -	if (!pdev->pasid_enabled)
>> -		return;
>> -
>> -	master->ssid_bits =3D 0;
>> -	pci_disable_pasid(pdev);
>> -}
>> -
>> static void arm_smmu_detach_dev(struct arm_smmu_master *master)
>> {
>> 	unsigned long flags;
>> @@ -2216,14 +1975,11 @@ static void arm_smmu_detach_dev(struct arm_smmu_=
master *master)
>> 	if (!smmu_domain)
>> 		return;
>>=20
>> -	arm_smmu_disable_ats(master);
>> -
>> 	spin_lock_irqsave(&smmu_domain->devices_lock, flags);
>> 	list_del(&master->domain_head);
>> 	spin_unlock_irqrestore(&smmu_domain->devices_lock, flags);
>>=20
>> 	master->domain =3D NULL;
>> -	master->ats_enabled =3D false;
>> 	arm_smmu_install_ste_for_dev(master);
>> }
>>=20
>> @@ -2271,17 +2027,12 @@ static int arm_smmu_attach_dev(struct iommu_doma=
in *domain, struct device *dev)
>>=20
>> 	master->domain =3D smmu_domain;
>>=20
>> -	if (smmu_domain->stage !=3D ARM_SMMU_DOMAIN_BYPASS)
>> -		master->ats_enabled =3D arm_smmu_ats_supported(master);
>> -
>> 	arm_smmu_install_ste_for_dev(master);
>>=20
>> 	spin_lock_irqsave(&smmu_domain->devices_lock, flags);
>> 	list_add(&master->domain_head, &smmu_domain->devices);
>> 	spin_unlock_irqrestore(&smmu_domain->devices_lock, flags);
>>=20
>> -	arm_smmu_enable_ats(master);
>> -
>> out_unlock:
>> 	mutex_unlock(&smmu_domain->init_mutex);
>> 	return ret;
>> @@ -2410,16 +2161,6 @@ static struct iommu_device *arm_smmu_probe_device=
(struct device *dev)
>>=20
>> 	master->ssid_bits =3D min(smmu->ssid_bits, fwspec->num_pasid_bits);
>>=20
>> -	/*
>> -	 * Note that PASID must be enabled before, and disabled after ATS:
>> -	 * PCI Express Base 4.0r1.0 - 10.5.1.3 ATS Control Register
>> -	 *
>> -	 *   Behavior is undefined if this bit is Set and the value of the PAS=
ID
>> -	 *   Enable, Execute Requested Enable, or Privileged Mode Requested bi=
ts
>> -	 *   are changed.
>> -	 */
>> -	arm_smmu_enable_pasid(master);
>> -
>> 	if (!(smmu->features & ARM_SMMU_FEAT_2_LVL_CDTAB))
>> 		master->ssid_bits =3D min_t(u8, master->ssid_bits,
>> 					  CTXDESC_LINEAR_CDMAX);
>> @@ -2442,7 +2183,6 @@ static void arm_smmu_release_device(struct device =
*dev)
>>=20
>> 	master =3D dev_iommu_priv_get(dev);
>> 	arm_smmu_detach_dev(master);
>> -	arm_smmu_disable_pasid(master);
>> 	kfree(master);
>> 	iommu_fwspec_free(dev);
>> }
>> @@ -2997,15 +2737,6 @@ static int arm_smmu_device_reset(struct arm_smmu_=
device *smmu, bool bypass)
>> 		}
>> 	}
>>=20
>> -	if (smmu->features & ARM_SMMU_FEAT_ATS) {
>> -		enables |=3D CR0_ATSCHK;
>> -		ret =3D arm_smmu_write_reg_sync(smmu, enables, ARM_SMMU_CR0,
>> -					      ARM_SMMU_CR0ACK);
>> -		if (ret) {
>> -			dev_err(smmu->dev, "failed to enable ATS check\n");
>> -			return ret;
>> -		}
>> -	}
>>=20
>> 	ret =3D arm_smmu_setup_irqs(smmu);
>> 	if (ret) {
>> @@ -3076,13 +2807,9 @@ static int arm_smmu_device_hw_probe(struct arm_sm=
mu_device *smmu)
>> 	if (IS_ENABLED(CONFIG_PCI_PRI) && reg & IDR0_PRI)
>> 		smmu->features |=3D ARM_SMMU_FEAT_PRI;
>>=20
>> -	if (IS_ENABLED(CONFIG_PCI_ATS) && reg & IDR0_ATS)
>> -		smmu->features |=3D ARM_SMMU_FEAT_ATS;
>> -
>> 	if (reg & IDR0_SEV)
>> 		smmu->features |=3D ARM_SMMU_FEAT_SEV;
>>=20
>> -
>> 	if (reg & IDR0_HYP)
>=20
> spurious change


