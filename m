Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0ED32FD7AC
	for <lists+xen-devel@lfdr.de>; Wed, 20 Jan 2021 19:02:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.71700.128617 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2Ho5-0007oK-Sa; Wed, 20 Jan 2021 18:02:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 71700.128617; Wed, 20 Jan 2021 18:02:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2Ho5-0007nv-OS; Wed, 20 Jan 2021 18:02:13 +0000
Received: by outflank-mailman (input) for mailman id 71700;
 Wed, 20 Jan 2021 18:02:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ziLf=GX=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1l2Ho3-0007nq-P9
 for xen-devel@lists.xenproject.org; Wed, 20 Jan 2021 18:02:11 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [40.107.20.47]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 972bd734-a346-4882-aa86-83c2c6dff4b1;
 Wed, 20 Jan 2021 18:02:08 +0000 (UTC)
Received: from AM6P191CA0037.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:7f::14)
 by AM6PR08MB4422.eurprd08.prod.outlook.com (2603:10a6:20b:be::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11; Wed, 20 Jan
 2021 18:02:06 +0000
Received: from AM5EUR03FT022.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:7f:cafe::8c) by AM6P191CA0037.outlook.office365.com
 (2603:10a6:209:7f::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11 via Frontend
 Transport; Wed, 20 Jan 2021 18:02:06 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT022.mail.protection.outlook.com (10.152.16.79) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.11 via Frontend Transport; Wed, 20 Jan 2021 18:02:06 +0000
Received: ("Tessian outbound af289585f0f4:v71");
 Wed, 20 Jan 2021 18:02:05 +0000
Received: from 9294a812fe05.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 98BB1043-CB24-4F36-951C-52838CDAF032.1; 
 Wed, 20 Jan 2021 18:02:00 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9294a812fe05.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 20 Jan 2021 18:02:00 +0000
Received: from PR3PR08MB5689.eurprd08.prod.outlook.com (2603:10a6:102:90::10)
 by PA4PR08MB6047.eurprd08.prod.outlook.com (2603:10a6:102:e3::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11; Wed, 20 Jan
 2021 18:01:59 +0000
Received: from PR3PR08MB5689.eurprd08.prod.outlook.com
 ([fe80::850d:8ef2:87a1:8892]) by PR3PR08MB5689.eurprd08.prod.outlook.com
 ([fe80::850d:8ef2:87a1:8892%6]) with mapi id 15.20.3784.011; Wed, 20 Jan 2021
 18:01:59 +0000
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
X-Inumbo-ID: 972bd734-a346-4882-aa86-83c2c6dff4b1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=61sc3qh+iXzYr93Lkty1KxubI6uEJzno85wSQt9WbOk=;
 b=LG0caycdyqrGh/wp6gf2Yrm9EwisN5cBJUZ7A6SmUzXcl/R7b6zH1yyr523Bdup+sl0AzBuZPt/tJU12ycmBq0f0ncNz3thB+vp6Lf04ZXrQoexc9L/AxgCzaOyKIcC8FEIkgWLezrleuFeYmqY+bZ8Z6C4gt0DzXEEaAl0nhh4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5dd412049a1b9f9c
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kxuW3dRRuybSVB1fcfBF3Y82G/MWgO48bQv3gPkeCP6IAXrV+iczTyGFeQ79gmkWt5+J7DLvf+n9rzJKcdz1769gZ8yfJvNKGgELWC0MMO0nV4PlqxGxM1wsR8Zene5TuAhLh8QiT40OPghxBArPufMxqDIyVl9UEApYKRtz5wY/q4Y/ySdnQCze9M+JL+aXnCk8jxuP5s0GwCk1vZn+cQKsI6DyodQuTnrSKAbfdUlidq0PT1Ts9f8RqNjrzE/q2ksSou/DSqKbUiWm/FHfBZSujYuL4EUCOWBZJ8DfFnIw6LmzSE0EwOh38gIu/78VXHX4a7jp02vSaTIrIr81wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=61sc3qh+iXzYr93Lkty1KxubI6uEJzno85wSQt9WbOk=;
 b=RWoPw7GUaXi+Zm4NZX5WTD8dcUeCCgZ4gY/RbifgWTQmOW+dEYQhfCQ/vo87Uiq/VWLaLPHSVShVlsmjVSzDhL/VCt2bcesyRmwSO5pShZlhywE88E6tOluy0cI+Fd93mQWMQVjj549GGM1p3GrVpHwPow6HiB01XdXmKIZlQqXWWwTPa3iTBhqfbLicMPjHatFgv3jlui7q6bl0UxlvBhzqhcYEZZ3mvjRNjeY2jquJs91ZzYE4LqQmK4M4avRGjsjYRlFDC7zz/jnZkwrTx6RKQCdo7dc7JxEsjFxd3IP4lLZCVTQsDc90aDhttJCVDzJdqXW+g0JeX57MjtYeDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=61sc3qh+iXzYr93Lkty1KxubI6uEJzno85wSQt9WbOk=;
 b=LG0caycdyqrGh/wp6gf2Yrm9EwisN5cBJUZ7A6SmUzXcl/R7b6zH1yyr523Bdup+sl0AzBuZPt/tJU12ycmBq0f0ncNz3thB+vp6Lf04ZXrQoexc9L/AxgCzaOyKIcC8FEIkgWLezrleuFeYmqY+bZ8Z6C4gt0DzXEEaAl0nhh4=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Wei Chen <Wei.Chen@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, Penny Zheng <Penny.Zheng@arm.com>, Jiamei Xie
	<Jiamei.Xie@arm.com>, nd <nd@arm.com>
Subject: Re: [PATCH v2] xen/arm: Using unsigned long for arm64 MPIDR mask
Thread-Topic: [PATCH v2] xen/arm: Using unsigned long for arm64 MPIDR mask
Thread-Index: AQHW5Ye9qAqBzHV/jEeIa7+b+bK7L6odnJIAgAABQgCAE0LNAIAAAP0A
Date: Wed, 20 Jan 2021 18:01:58 +0000
Message-ID: <2E326D05-D97C-4367-8702-58A156D3A66A@arm.com>
References: <20210108062953.2335932-1-wei.chen@arm.com>
 <a11a8270-68ab-066f-7799-511e72869e95@xen.org>
 <AM0PR08MB3747169FD88CFD00C5E38A039EAE0@AM0PR08MB3747.eurprd08.prod.outlook.com>
 <bbeffe6a-beac-54f7-560d-00b99135d365@xen.org>
In-Reply-To: <bbeffe6a-beac-54f7-560d-00b99135d365@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3608.120.23.2.4)
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [86.26.33.241]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 2b5ee695-2521-4235-9098-08d8bd6d7f99
x-ms-traffictypediagnostic: PA4PR08MB6047:|AM6PR08MB4422:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB4422E4CA0B7A0394316648DC9DA20@AM6PR08MB4422.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 5ImcumR3bLN9gAg3U4XTdNmhwIas2Q4sbNpq/Kxbrr1k/xQcyoxvyHa2aoiNGZqGX34OtHLPeUKirrMNpWihm5XLWhyrcld+gVuP3zInawgf0lisej9BWRqqlfDtlmphE2z8LTdbAkTqEOJseKSyHcJknLbDWH9GecWqb9Mm/J8qG+ny+0d9YgSATWlsT8BYDIji5gTQnqI1PWAk6scBce1hAFAPEh7IQjmM2gEmdNPDttp0oZXbtVYas05M3VQIMGAKg3e/65tWSACNHFDyenyukitBnN0+NRUfdLhqidqDl2nd/rQ72MJ7nbm0HdOhfFaJNkT2zdCymyaRikFxhXRXRng8q3UnZk23FzIwjdIq5AXLsNql84cLiIHohH6r2ypAaMzG7Lt+qwU8bAJFLV2+Iphze/SLl87VAbbNU0si+AEkZIKwMcfjlKzFdhmv
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(366004)(136003)(376002)(396003)(346002)(83380400001)(66446008)(55236004)(6916009)(6486002)(36756003)(316002)(6512007)(4326008)(91956017)(8936002)(66946007)(76116006)(54906003)(66476007)(66556008)(64756008)(2616005)(86362001)(71200400001)(8676002)(2906002)(26005)(53546011)(5660300002)(6506007)(33656002)(186003)(478600001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?cnCxljH+BM/RfyINb6Ri8hCAU3h26Z/NOhyMuAcpQnCnP0BdIdv3jX+GYSDn?=
 =?us-ascii?Q?jf1bc6lADQ20i9TOKEZm3OsMCBSL7WhkMKIahv9bs/JQYsmfdGpjzbcV+TR7?=
 =?us-ascii?Q?d8NOMcMRUI1TELqO8d15wK53qrChWesNq2w0iSNVe0TfmwFof/Y8e5XBP80O?=
 =?us-ascii?Q?K2LUHmGzpMBQH11UF0rIYzCv0wov7DDHN2Hxm3pZmnWoBEIX69lnye3omP+q?=
 =?us-ascii?Q?F9HMZsdgP23EZO70YcZck3ENwKg3mR7nNmLdVsRNbfRNXx9umqi2EhfZcSb9?=
 =?us-ascii?Q?8PE2YJO+0AxNT8hvOc7UBql+6boh09KgAoMx1Bu7Iy1jLMed6oTvLMNIT17H?=
 =?us-ascii?Q?EfrlAgEqtuRXryGgedH2CMdHohWobkUl9cNWgzu8SOQLlleZBOtIPG0sanI/?=
 =?us-ascii?Q?2v5FHovf5Mo0uhXHnu8h+fnx0pSNo3orExwmYYdZdZfVxYDlCgEpvI9bpmf8?=
 =?us-ascii?Q?Fg7Ts4yr3PDKDpXPtriDHDfT8wMiV17EALd8DnfQrBqN+QpGyVae0cpKI9y3?=
 =?us-ascii?Q?qGLsMy99nebZU+2eRwJm9EhjkaoX+BfXni6NdkHGpcPCx2nzcg3bh4rYvBKQ?=
 =?us-ascii?Q?dOVoCTdlT2ueUnC5ut1L6homMqSWNsTbb5yJeb6+aPKLaPaYUTCdIycb7q08?=
 =?us-ascii?Q?B9CL27DSv8Ujkn6MSO7Mq5oZobtv9xcWmSjLJ3JoRbXtxeuyBjquda+zlKN0?=
 =?us-ascii?Q?/sj5USLSo4UiW+wmQN9uyvXJgVUmwJeFMCwXqTHL39dOFcwcU0eCEZWNCHY7?=
 =?us-ascii?Q?SJtZZR71f1xUQZQ9RsMKj5k8STpQ0CzuoQYRYwtAUcwYd0HfTffQxrr1Xyal?=
 =?us-ascii?Q?p9OAPntYvgZSltd4S+uQCN+PU5fCxQSrdvWH+/yrnrj5fXwCeO1Czyb7JtN2?=
 =?us-ascii?Q?uio7TVwTWtdHrwwzmzDzRYKZ+keN9goyoFfh7hjqdmk62nU9ylCaC7kBHj1i?=
 =?us-ascii?Q?5HAR2IKezZk7v083NEgB1WnJz/GyNIWhq1Sq2PvBjakCCE7mXd52bI4bAjvG?=
 =?us-ascii?Q?nb0e?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <DB1A7138EE4E1D49ACCD4912E83C98CD@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6047
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b08a3781-9ab8-4e40-4642-08d8bd6d7b8f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	eI7kcUi5ranfdWHiJGICmYehfPS9IpWCxi6/aFmhJ57vmFsxDkJD6p8ehfRQWBb32VJOXS7JSd5ZFUCX9iMHp/gyAoSTGZ6om3wkAWF15zDX3GhU0rXNt7YWeK0oOkEOyxwWdjWH1Sjsrdcaw8DgluDQdAAl341UKHszMrwAbemeY28Q6iLNPZztveD05Uq6d+0tzyfAg7Lv8idqUMijbh9FkfZEcwjxTwR2pJpYGSy6qa9x+14n2SXOCD+wXs9Ev8Xj8r0sNnHB1chv4xhefg9lvQscKL9sOwgFsbwrlTssuAkUJaXVy9Fm6IGrendglqXruVo+y9UcJRLQJh9njpkj77C/4NNCQmkfrAkzVfyctI00/BkU3IV/vwYw1Kay3jzjDwiMN5bQYhEl1Ibbby1ai0RuW0WjY58ecan9tRJhC7bWM8iWLMF9WJi9lAEDYPcq66r/wtDxgya9EyQLCw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(39860400002)(346002)(396003)(136003)(46966006)(47076005)(8936002)(26005)(82740400003)(336012)(70586007)(36756003)(356005)(70206006)(55236004)(186003)(6862004)(53546011)(6512007)(54906003)(33656002)(8676002)(478600001)(316002)(6506007)(5660300002)(83380400001)(4326008)(2906002)(86362001)(6486002)(81166007)(2616005)(82310400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2021 18:02:06.2160
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b5ee695-2521-4235-9098-08d8bd6d7f99
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4422

Hi,

> On 20 Jan 2021, at 17:58, Julien Grall <julien@xen.org> wrote:
>=20
> On 08/01/2021 11:50, Wei Chen wrote:
>> Hi Julien
>=20
> Hi Wei,
>=20
> Sorry for the late answer. While cleaning my inbox today, I noticied that=
 I didn't reply to this thread :(.
>=20
>>>> integer will do unsigned extend while doing some operations
>>>> with 64-bit unsigned integer. This can lead to unexpected
>>>> result in some use cases.
>>>>=20
>>>> For example, in gicv3_send_sgi_list of GICv3 driver:
>>>> uint64_t cluster_id =3D cpu_logical_map(cpu) & ~MPIDR_AFF0_MASK;
>>>>=20
>>>> When MPIDR_AFF0_MASK is 0xFFU, compiler output:
>>>>      f7c: 92785c16 and x22, x0, #0xffffff00
>>>> When MPIDR_AFF0_MASK is 0xFFUL, compiler output:
>>>>      f88: 9278dc75 and x21, x3, #0xffffffffffffff00
>>>>=20
>>>> If cpu_logical_map(cpu) =3D 0x100000000UL and MPIDR_AFF0_MASK is
>>>> 0xFFU, the cluster_id returns 0. But the expected value should
>>>> be 0x100000000.
>>>>=20
>>>> So, in this patch, we force aarch64 to use unsigned long
>>>> as MPIDR mask to avoid such unexpected results.
>>>=20
>>> How about the following commit message:
>>>=20
>>> "Currently, Xen is considering that all the affinity bits are defined
>>> below 32-bit. However, Arm64 define a 3rd level affinity in bits 32-39.
>>>=20
>>> The function gicv3_send_sgi_list in the GICv3 driver will compute the
>>> cluser using the following code:
>>>=20
>>> uint64_t cluster_id =3D cpu_logical_map(cpu) & ~MPIDR_AFF0_MASK;
>>>=20
>>> Because MPIDR_AFF0_MASK is defined as a 32-bit value, we will miss out
>>> the 3rd level affinity. As a consequence, the IPI would not be sent to
>>> the correct vCPU.
>>>=20
>>> This particular error can be solved by switching MPIDR_AFF0_MASK to use
>>> unsigned long. However, take the opportunity to switch all the MPIDR_*
>>> define to use unsigned long to avoid anymore issue.
>>> "
>>>=20
>>> I can update the commit message while committing if you are happy with =
it.
>>>=20
>> Yes, that would be good, thank you very much : )
>=20
> Reviewed-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Also tested on a platform where Xen was not booting without this patch and =
i can
confirm it fixed the issue :-)

Cheers
Bertrand

>=20
> And committed.
>=20
> Cheers,
>=20
> --=20
> Julien Grall


