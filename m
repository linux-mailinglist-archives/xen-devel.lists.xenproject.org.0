Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB892CD647
	for <lists+xen-devel@lfdr.de>; Thu,  3 Dec 2020 13:59:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.43441.78088 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkoD4-0007iB-HP; Thu, 03 Dec 2020 12:59:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 43441.78088; Thu, 03 Dec 2020 12:59:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkoD4-0007ho-E8; Thu, 03 Dec 2020 12:59:46 +0000
Received: by outflank-mailman (input) for mailman id 43441;
 Thu, 03 Dec 2020 12:59:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Lp8G=FH=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1kkoD2-0007hh-H5
 for xen-devel@lists.xenproject.org; Thu, 03 Dec 2020 12:59:44 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe1e::61d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b7c7da62-63c2-4c15-b9b1-a244afe11af8;
 Thu, 03 Dec 2020 12:59:42 +0000 (UTC)
Received: from MR2P264CA0099.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:33::15)
 by AM0PR08MB3346.eurprd08.prod.outlook.com (2603:10a6:208:5e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Thu, 3 Dec
 2020 12:59:40 +0000
Received: from VE1EUR03FT025.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:500:33:cafe::3d) by MR2P264CA0099.outlook.office365.com
 (2603:10a6:500:33::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20 via Frontend
 Transport; Thu, 3 Dec 2020 12:59:40 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT025.mail.protection.outlook.com (10.152.18.74) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.17 via Frontend Transport; Thu, 3 Dec 2020 12:59:39 +0000
Received: ("Tessian outbound eeda57fffe7b:v71");
 Thu, 03 Dec 2020 12:59:39 +0000
Received: from 0cfccb92f110.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6BB4CED3-44E5-46B7-BAB2-F376C9FCAFFD.1; 
 Thu, 03 Dec 2020 12:59:23 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0cfccb92f110.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 03 Dec 2020 12:59:23 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com (2603:10a6:10:49::10)
 by DB8PR08MB5097.eurprd08.prod.outlook.com (2603:10a6:10:38::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.21; Thu, 3 Dec
 2020 12:59:22 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::21f3:34c:8f7e:42ef]) by DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::21f3:34c:8f7e:42ef%2]) with mapi id 15.20.3611.032; Thu, 3 Dec 2020
 12:59:22 +0000
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
X-Inumbo-ID: b7c7da62-63c2-4c15-b9b1-a244afe11af8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VYGW/pOXP38DWcAUaDYijjkZxd8MUBtl4szVtA1Qfss=;
 b=adwQhaGK4VEhgkSz1y3hk67sDVZRHvfYuA48eb51bViQKdPp1iz5YkN6udCzgXMEFwSe66L5g9J3J5yPt4iezYBxoNew3RK6fQy063oZ/QKqjtXuH4q5XZzIn6bBMMIS3guiBt1zRZqIPTZA1CdHDhhCCKnBjitvTpy02zZhglg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4b7c2bf8a5d959e3
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=exEUrM5JQjvloBIXHy+l+4MIh/XVTRQysRkr1cpqpmlifleBMJAUYnSdEjVseYloK+X2pM9v9q21Xujm+jU7tcUnIpY1rSJg918uEqOionNic1MoBjPkFTJ9Hgva81MpvYdlLm/5Fd+dulnIOkTFdJKrDJMBXgG3ji18DG7L2DZzMe/yohFqfpaFppQmhh0nBQ530ArR73pgsOPfp2LzeYU3Q7t0Ojy9GmjAhQ48zN4axBFNZrhmKyaA7C0vRNG4B/0mySEAR1+CI8yafSHmPoX/vYFj0e8box1DFnzQIVnI3/wjNi84bfOQpM+E0NM4AqrV4fGo96Uy3J0MBfNuGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VYGW/pOXP38DWcAUaDYijjkZxd8MUBtl4szVtA1Qfss=;
 b=PM74SHrfcPp+YYObxxq5lFGEyhnryEXw95836pT7U6hbDK+orj0RLw0x5LtVyMGHo+JqQCU7/Sx91xTXxk751e6RddXC0qHvtbUS5dI7cI5kInTa70Jq5WppQg6ooLNhzFlZ7NRTOllZyu3e8cJB8CwzOQUsL0H5+FgqdSaT4+C+tDkhase+JFKmgzla3FGdCNN0H7XZVhKX5XwAQP7OBE5jvUHmiO7VqXaHbLRki/cVq8U8ExY+kfrA0LXq9FX2iu6B0JjmEkn2do0EV4RFYwO2+lCEiknJzEufYyWWEgc/53l/PjrGJh2loSePRw4CSR8N6O82xEtwGRVK86y/XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VYGW/pOXP38DWcAUaDYijjkZxd8MUBtl4szVtA1Qfss=;
 b=adwQhaGK4VEhgkSz1y3hk67sDVZRHvfYuA48eb51bViQKdPp1iz5YkN6udCzgXMEFwSe66L5g9J3J5yPt4iezYBxoNew3RK6fQy063oZ/QKqjtXuH4q5XZzIn6bBMMIS3guiBt1zRZqIPTZA1CdHDhhCCKnBjitvTpy02zZhglg=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Julien Grall <julien@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 4/8] xen/arm: Remove support for MSI on SMMUv3
Thread-Topic: [PATCH v2 4/8] xen/arm: Remove support for MSI on SMMUv3
Thread-Index: AQHWxBX8l+Fkiiynvkqd+dcwplqzQKni/UOAgAAB/QCAANIPAIAAEHgAgAF+SgA=
Date: Thu, 3 Dec 2020 12:59:22 +0000
Message-ID: <EA25A499-E697-4B7B-AEBF-3842B0C95AE5@arm.com>
References: <cover.1606406359.git.rahul.singh@arm.com>
 <cfc6cbe23f05162d5c62df9db09fef3f8e0b8e14.1606406359.git.rahul.singh@arm.com>
 <alpine.DEB.2.21.2012011621380.1100@sstabellini-ThinkPad-T480s>
 <alpine.DEB.2.21.2012011639230.1100@sstabellini-ThinkPad-T480s>
 <D79D7DC5-649D-4517-A8CA-B13632595DA5@arm.com>
 <5689cfe7-ca16-6540-d394-00d3f60f4f5f@xen.org>
In-Reply-To: <5689cfe7-ca16-6540-d394-00d3f60f4f5f@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [80.1.41.211]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d3266781-c6f2-48ee-cdb6-08d8978b4bb2
x-ms-traffictypediagnostic: DB8PR08MB5097:|AM0PR08MB3346:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB33465794A02D7D29A892444EFCF20@AM0PR08MB3346.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 iXfpwp2NSlOxwE2K6YSFh0BDDRIlVVZ1gqCRimdwEcnnYfGVNVh6ss9VeWZp8znGpKTXspc/o3rQlkDmWp+8LBKCXrXyPOgx/d1vlz4QncWbWwb4LtQQ5+rngqZL/AlWzFQ336hVa8BRuyXDfY8JYRff1+soU8s8Qzr8cDujcroE63kGCipIfKByzpt3QkJIthY8k/pjJOvUv92DZdSkX/pEmHuaVtpbH4K0ejdRvxw5CEhYpPGPBBcJ46z38p7STPrN/BRDl25jbrbUxWkOCA9Ftei7tJm8+xWbuiJJMEuUqn3Cgty/wuwEVL7TXaATVLCVL3F11wugIpVw8EbrKvMOX0Fodzpw/RyefpIJ57bUYFALbunUaOaguaY2FHDP
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3500.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39860400002)(136003)(346002)(396003)(366004)(54906003)(53546011)(6506007)(6486002)(186003)(66556008)(76116006)(26005)(86362001)(91956017)(6512007)(316002)(2616005)(4326008)(71200400001)(2906002)(8936002)(33656002)(5660300002)(6916009)(478600001)(66946007)(66476007)(66446008)(36756003)(8676002)(83380400001)(64756008)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?bW651/g7a5EVULMkDCuFnOHGd584Dp1v2LDc9IV+CRQp+bPECpkEZEByaS0V?=
 =?us-ascii?Q?kaHUtGZR9pmhLS1HFNPDKaB4o0D6nCb7Yr8CNumd1NMhsoi6Jjg558JAHhMy?=
 =?us-ascii?Q?8hOeDkIhEDoZMmmhy5aUyr45R0lsA9aeln8IDgs0SG054iBbeoiOHqp8f8Sj?=
 =?us-ascii?Q?4q1+7Z4PH3HBD7+GWu1fNu0GMoXAOOIr9W041ZE+CEjgzYz7Uqx24ZALixVr?=
 =?us-ascii?Q?RxrclcG0jj41Opj+VOKCkDDB8iNd3yuLf1n+Az6SDoe5TQUueByarzjDtxLH?=
 =?us-ascii?Q?LmFRLpc4pZMYLv8LgBj/k4qeCm7/FJDI3JQAynag1wdjQuQ7bo7bQRHNQXlg?=
 =?us-ascii?Q?kX4wtFHDBvtumWtDz66eEFRj+CyJtc2kCSr4XMtZdb/rQ8mUW8UmE6yDQToY?=
 =?us-ascii?Q?gGoJcAHWRJpSjFiArDJL4z1g5ESVibMyNMnlrwnrTEk2m6KHwsC0akmdIIP4?=
 =?us-ascii?Q?B6gLtK8l/OJfIb3bFtKlbrUaKpcUcbmN+DWfFV1AvhKqU9wcd9LIPHrjuUCO?=
 =?us-ascii?Q?t9ZVUCCGyHndzLYMDgTtmVQEBdSZtYI38uYiEQ2OoR9N4GvlrZr+reILOh3/?=
 =?us-ascii?Q?NnmfDetbtIj9aKOHG/711yb/zaj8+iiFpA0TqoREYPjiEGCwWeZjwfZlMlnk?=
 =?us-ascii?Q?spFA1fgSRCvvsGXfpAEqBsKS7kirj2dIrZmu1+2T0mTuDW/uc95t4BQ3y3iP?=
 =?us-ascii?Q?QaoCMRvq+LkKSwRq4tiMj4qWFYGFBwqHZMDFoeqUyvvxLQaV8qPuvkAWUo4H?=
 =?us-ascii?Q?AMvkKWYtZnvSdsxNC0UReowJt5T6CXcf/VlNATW0o2dXcWHt/8bQ9GogcjXe?=
 =?us-ascii?Q?0KMVe9q6L3wgVSHjIqrq+C1aiIchCnZ+J0caAcVW4dWXYern3vWjkO4R17+O?=
 =?us-ascii?Q?UajQE0L+oqB5Q90CQydcjh+Rtv/jjcE05XzGpUxBQLJaBW+O1za35kN9FmPJ?=
 =?us-ascii?Q?4aI0D3bDkU5z9UcAYLGM4Cbun/8eRVLdRD+QMABBo3fqcOkBk51BFLvp053Q?=
 =?us-ascii?Q?4JGl?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <D219228701739443847EE67FB84DD429@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5097
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	92719819-e378-4fe8-426d-08d8978b4199
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9dAV9AMsn/K0dWgJHsb45+eV24l9sqjhWX6zF4O8zDJiWmygovRsN0eppXKO7S0n+lToMf04s7L9rufd7a02YuriwOAQ71uzrAwfGKhkbyxWdRXA24Ad9aI0hZmd8TZenSWq0zQ62tI2gRF3tF8T8P0DMA1W9X009Mqv/ZcXhZEZkdQiiiF+lw7BuNZDX7eMagS+u2V4Rgb+m8XsnplCLmRcbNyE8T65QbslwjyXstDIYEKRXon3lGUGz0+ut9XbQGnnR4Vki8itcNQ8Jlw0qDi/clnq/Fu2DgTf1O34gQ2B+Ychfr8sLr4U0IAVOommaAqAF70A2EaS8tO1YMHPM1InbnpC7JgyU99A9cBrR8OlyXOwZWftTwG8GbBM3jpnbClHhIVjUCMJiqLoAoPy3Q==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(346002)(376002)(396003)(39860400002)(46966005)(82310400003)(36756003)(83380400001)(8936002)(2616005)(8676002)(2906002)(186003)(478600001)(4326008)(6862004)(107886003)(26005)(86362001)(53546011)(336012)(6506007)(6512007)(5660300002)(47076004)(6486002)(82740400003)(70586007)(81166007)(33656002)(316002)(356005)(70206006)(54906003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2020 12:59:39.7883
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d3266781-c6f2-48ee-cdb6-08d8978b4bb2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3346

Hello Julien,

> On 2 Dec 2020, at 2:11 pm, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Rahul,
>=20
> On 02/12/2020 13:12, Rahul Singh wrote:
>> Hello Stefano,
>>> On 2 Dec 2020, at 12:40 am, Stefano Stabellini <sstabellini@kernel.org>=
 wrote:
>>>=20
>>> On Tue, 1 Dec 2020, Stefano Stabellini wrote:
>>>> On Thu, 26 Nov 2020, Rahul Singh wrote:
>>>>> XEN does not support MSI on ARM platforms, therefore remove the MSI
>>>>> support from SMMUv3 driver.
>>>>>=20
>>>>> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
>>>>=20
>>>> I wonder if it makes sense to #ifdef CONFIG_MSI this code instead of
>>>> removing it completely.
>>>=20
>>> One more thought: could this patch be achieved by reverting
>>> 166bdbd23161160f2abcea70621adba179050bee ? If this patch could be done
>>> by a couple of revert, it would be great to say it in the commit
>>> message.
>>>=20
>>  Ok will add in next version.
>>>=20
>>>> In the past, we tried to keep the entire file as textually similar to
>>>> the original Linux driver as possible to make it easier to backport
>>>> features and fixes. So, in this case we would probably not even used a=
n
>>>> #ifdef but maybe something like:
>>>>=20
>>>>  if (/* msi_enabled */ 0)
>>>>      return;
>>>>=20
>>>> at the beginning of arm_smmu_setup_msis.
>>>>=20
>>>>=20
>>>> However, that strategy didn't actually work very well because backport=
s
>>>> have proven difficult to do anyway. So at that point we might as well =
at
>>>> least have clean code in Xen and do the changes properly.
>=20
> It was difficult because Linux decided to rework how IOMMU drivers works.=
 I agree the risk is still there and therefore clean code would be better w=
ith some caveats (see below).
>=20
>> Main reason to remove the feature/code that is not usable in XEN is to h=
ave a clean code.
>=20
> I agree that short term this feature will not be usable. However, I think=
 we need to think about {medium, long}-term plan to avoid extra effort in t=
he future because the driver evolve in a way making the revert of revert im=
possible.
>=20
> Therefore I would prefer to keep both the MSI and PCI ATS present as they=
 are going to be useful/necessary on some platforms. It doesn't matter that=
 they don't work because the driver will be in tech preview.

Ok. As Stefano also agreed the same I will keep the PC ATS and MSI function=
ality in next version.

Regards,
Rahul

>=20
> Cheers,
>=20
> --=20
> Julien Grall


