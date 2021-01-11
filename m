Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF842F1EC3
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jan 2021 20:15:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.65355.115785 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kz2ee-0007s7-Ep; Mon, 11 Jan 2021 19:15:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 65355.115785; Mon, 11 Jan 2021 19:15:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kz2ee-0007rl-BL; Mon, 11 Jan 2021 19:15:04 +0000
Received: by outflank-mailman (input) for mailman id 65355;
 Mon, 11 Jan 2021 19:15:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S6qt=GO=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kz2ec-0007rg-CX
 for xen-devel@lists.xenproject.org; Mon, 11 Jan 2021 19:15:02 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe05::61e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 12ca69e3-5cef-47be-8d64-c78e595f6cc9;
 Mon, 11 Jan 2021 19:15:00 +0000 (UTC)
Received: from DB6PR07CA0099.eurprd07.prod.outlook.com (2603:10a6:6:2c::13) by
 PA4PR08MB6317.eurprd08.prod.outlook.com (2603:10a6:102:ec::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6; Mon, 11 Jan 2021 19:14:58 +0000
Received: from DB5EUR03FT047.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:2c:cafe::1f) by DB6PR07CA0099.outlook.office365.com
 (2603:10a6:6:2c::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.2 via Frontend
 Transport; Mon, 11 Jan 2021 19:14:57 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT047.mail.protection.outlook.com (10.152.21.232) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Mon, 11 Jan 2021 19:14:57 +0000
Received: ("Tessian outbound e989e14f9207:v71");
 Mon, 11 Jan 2021 19:14:57 +0000
Received: from 5810625e8420.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F357F127-937A-4AB2-8E96-179E27E5302D.1; 
 Mon, 11 Jan 2021 19:14:52 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 5810625e8420.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 11 Jan 2021 19:14:52 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com (2603:10a6:800:1ae::15)
 by VI1PR08MB4446.eurprd08.prod.outlook.com (2603:10a6:803:fa::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Mon, 11 Jan
 2021 19:14:49 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::c8bf:1301:3373:94a6]) by VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::c8bf:1301:3373:94a6%5]) with mapi id 15.20.3742.012; Mon, 11 Jan 2021
 19:14:49 +0000
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
X-Inumbo-ID: 12ca69e3-5cef-47be-8d64-c78e595f6cc9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZwwmA0HvTWsuz+QVtXEbHROxSwKkJ99daUm8VeuBw8E=;
 b=MsI4C+Ll4mGIP56C8cLBR03khHZkfYwmkoQ2L+abNOCKDlSF0AtrsGGMIrNDUQ7JTkxUKP/DljDrx0w/jwx/fYv9SUgk4o6obBN2AUjF6VbnclOkMjioO6SoC+6n2WcPQw7+wWPMZbWbt3ZdmNDXg0BzoMeQHzFDq3INUXpUBEY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: f179b7ea126045fd
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fiKdshi48p+4kzAo+jekP9cio4M7oT2ZWrH3cPMBBUVWoW5Q77u+rgnph96mz3HHDEV8zAoU6f+gc4MOSxWXu+VmdhXEcEw8cgYq7RSrdbWoh4y1GEKceHoaomjtYc33NlyunsLllLW0mbK9KqAe9ZsNC+/2GrmNuCOlJegBd2rc8JtikzixpNPjC//DpLZMBElEPnsOMQv++qWdnrYPxNZYo2RjZ63pb2gl7Q+E+HMRflwTnyzN4Ujo2vQtmFsvSUzLokjKPjzvNMFR8xR5AqA1vHII0HdslszMYlBEFosu5LRpyDgot9F9s4lczS+aXkWLGyUGreOKxE2jZuE+/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZwwmA0HvTWsuz+QVtXEbHROxSwKkJ99daUm8VeuBw8E=;
 b=lx8XMKY59xF4YeEV+wohZTP+5zz+V+6z2gh/wP9VCitcjBuDyQWeF9jwjEReQOZZu0pXhvAP52Kru/GRF/WpJiCZ02wNdiNPV0O6ELB9eL2W+BzSH5Ha9vVTqmvvYIr6M7coqCDHAkgLA54Z+iMzZrEzHrUAv1zJSdcCdTm4lXCwEpIjZ12gC3LIlyQTvWFasl2SqXtec1p3F5hwCmhYD6mKgpnPZZOa7UVOGyCu/6rOHOv0IIaxjMP6GELG2BGNRIQGmmxF4espN4B8vrEiKOfPJBl3Pms7QYbjVi017TW8Dt+1dHuNtK9TDFVz97n+PJ95bgusyu28Q2QaXfs3tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZwwmA0HvTWsuz+QVtXEbHROxSwKkJ99daUm8VeuBw8E=;
 b=MsI4C+Ll4mGIP56C8cLBR03khHZkfYwmkoQ2L+abNOCKDlSF0AtrsGGMIrNDUQ7JTkxUKP/DljDrx0w/jwx/fYv9SUgk4o6obBN2AUjF6VbnclOkMjioO6SoC+6n2WcPQw7+wWPMZbWbt3ZdmNDXg0BzoMeQHzFDq3INUXpUBEY=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
	<sstabellini@kernel.org>, "Volodymyr_Babchuk@epam.com"
	<Volodymyr_Babchuk@epam.com>, Stefano Stabellini
	<stefano.stabellini@xilinx.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Andre Przywara <Andre.Przywara@arm.com>
Subject: Re: [PATCH v2] xen/arm: do not read MVFR2 when is not defined
Thread-Topic: [PATCH v2] xen/arm: do not read MVFR2 when is not defined
Thread-Index:
 AQHW5fO/cBZB5l3jZkmpNH6hbDKrc6oiIY2AgAAasgCAAIUfgIAACBWAgAADOgCAAAFfAIAAAhyA
Date: Mon, 11 Jan 2021 19:14:49 +0000
Message-ID: <E9856BE0-889B-4700-9731-83A02D6755CF@arm.com>
References: <20210108192243.25889-1-sstabellini@kernel.org>
 <f90e40ee-b042-6cc5-a08d-aef41a279527@suse.com>
 <dce8bed2-db66-b032-06a9-86c8f80d26aa@xen.org>
 <F715A994-7B47-4171-84F8-5BE912985784@arm.com>
 <7311f402-dd5d-7484-345a-ef62071adb58@xen.org>
 <9A54F469-6A90-46C8-8BC4-673F469240E7@arm.com>
 <5d38eb31-7fbb-50f8-e8b8-ea9704122b1f@xen.org>
In-Reply-To: <5d38eb31-7fbb-50f8-e8b8-ea9704122b1f@xen.org>
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
X-MS-Office365-Filtering-Correlation-Id: f4a0554f-a2cf-44ec-4404-08d8b6652f6a
x-ms-traffictypediagnostic: VI1PR08MB4446:|PA4PR08MB6317:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<PA4PR08MB6317D45C8C27FC5843D263B69DAB0@PA4PR08MB6317.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 HVxsH6505tPbP16ZbUhz/fiUuhmsnZ4c2mHVoEwtc5fPQiITD2Aq2d06fQe1dUjSiobW3t5JnXuy1/pmyQhA2xVNuKteY/DdpoFDZQ67E7zzo9lQnF/zM1xYbnHbTvsoYRbGYj9jUFEF+GH3aEMb8AhiWSAA0ZOrBnDBQ7myeQYc5Su8gc+4DvT/nbFb3O4MzPyXiv0+U9o3zEg6ir0I09HJ/Q/mQACbXmIRKjjdk7gj0WfEDtMs5mF+lG+96Pb+x0Ua71MyIqywB/tus4AX74AO7aWFmQ/pqRPrZ/fa4IPJ8OCFXMP8UMV9AkmQlF1FfRgokfYWOUypVVpa6wj6DtxFcqcBufyzwxEXOVdBBmzYbxn7o3MJUzsG/aIGcKHbLVxRPjoK1StNWqSMYBkitTfaq4uREiFsgPQgJUJCaDp3V3PDCap0ks+FcdurP9ON
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39850400004)(396003)(136003)(366004)(346002)(316002)(53546011)(54906003)(8676002)(478600001)(2906002)(6486002)(2616005)(6916009)(6512007)(8936002)(4326008)(55236004)(33656002)(5660300002)(91956017)(86362001)(76116006)(64756008)(36756003)(66446008)(66476007)(26005)(66556008)(186003)(66946007)(6506007)(71200400001)(83380400001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?YXFEEUcCaHrIhFh9d+AFw0iazzi+ghbFop+qxWE9tCjS6mHgdeEJrtAeHF3m?=
 =?us-ascii?Q?Z2ZGDMvmeWsoMwShNkxpp4f/SxpHY+7dInuFLMfnomibQfdrreFfGwNiLd4G?=
 =?us-ascii?Q?SmEwXOObPmBSFGfwS3dJmr4NlyNcq1vnGAeywLhbjHnGaJf2pd5aSnAY96Dd?=
 =?us-ascii?Q?0MxnVHzRlQLW6S5OLG6FbleUJg8ZYjTvmKhVflHlZT45hCK9gytGaJDhaQ2B?=
 =?us-ascii?Q?FPo7x9Mcv47Cqm63v9yqPp0RpMmnzgz2dIjRrkb4A+kXFVTOjgtwV4UktJgC?=
 =?us-ascii?Q?wwUekeUcHjHBeix0TUwB2+rv9YYPK0mCTM6SPc3yq0dP8M793uGXPsqGneHp?=
 =?us-ascii?Q?dUPDMFd06wokiUmVNbaGp5rxFIgwhAwXrVFmkIhDw5ksG+qgXsLtSGAM0oc3?=
 =?us-ascii?Q?iIbDGk4CFwXVduSfrOmJ76hTpUe+p9rowSRdEsyOkI3H0q0P/ThXr+xG3dgx?=
 =?us-ascii?Q?+Si8tkrpTqKQS815PoWgYAI7kFFc19uJ3ltMTpqpW3hHARnn6QN3EEMcWS+K?=
 =?us-ascii?Q?Es6dTsYev/K0hKAmLkU+6XfGDsd3j9ZvEcFknDg2tN0bjNpAziyzGor8kJe2?=
 =?us-ascii?Q?mE+mgJ30C+EvzofmUoHp3TIn465BZgu/cHuB04CAGaXMOH0/mAZFFfA4Dyvm?=
 =?us-ascii?Q?rmbdjc77H7laWQFGcjX3Bh4djgSTaSEoHdGV7gZNtTbwkh3TxUP7g92Qd4y4?=
 =?us-ascii?Q?wURsqQ9XSF9CDKgaiKDCl/AvqAMozLwKp67zM5rncWYpPr+8MqrC6MvXGS//?=
 =?us-ascii?Q?JonZjy8+QafqhuzzdRnVHeV/RE0YFjKeg/g73U0vI9FQVUWSqwJI6qfbAb7a?=
 =?us-ascii?Q?xCy1ieoSdjDPyzH5C4vQ8f/ZoVRI4x0u8aLvupGWeeWouBCQfScPpG2TtyYt?=
 =?us-ascii?Q?FVPLUcZBWMHp8LCNiPlGWDakq5MM0DapwciZ+XoSihGWt7F0So6BrjPjFsYk?=
 =?us-ascii?Q?4V0/T3KY/sRVH4OcorSazB7X3fPIl3ZL7tmBce5YuBmwlCk9k+rQ+GfmZ+pG?=
 =?us-ascii?Q?EA9c?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <744E86F9F193964A87FB642B3B641F9D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4446
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT047.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	234a65ee-329e-4045-172e-08d8b6652acf
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4PFZLfSTF+EuvUcL2INz8Pid5FGhWmMLyMc1jz0GN9t3WesCSpC0YF8ityLbK/lsLLwkskndLdZwIBulYxOYEKSXRMWNVa73pzofenlfqZm1BgO1ywbryd7qpp2veJH/dwFdfIRdObOWdzi4xSfZB5WKuzq7DD8kDDAS0l8BS9I/G6tenwrhpyZWGsBTrNWB++8HsSuB1dvz198jpU72PX4k7ec9Dlz4tNdJLAph1RlkVEDJIYq89qIVOkBuEupPBP/NXIEHIM/xVZoibkfelmSglqs2TpACY5h9mH9k6h6orwJxYsStXO194Y7U6B53poNyl7IIHkXg5oTKzC5NUI22sqYibRQuNB3VRVDp8a7Jr/YR9X+yxBCQVKJ89veU74clTAf43ZHiCLBDgefKIueqK5YFCJb8UJFclkyYe89GvWaiF+WXxl6ZACJevfpDmzv7e7HUWPNtvpA43UjikkSTHHkU/w01sbqcpFUlRggp6NQlJqVPPVoQ3+OYJHu5
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(39840400004)(136003)(376002)(396003)(46966006)(4326008)(356005)(2616005)(5660300002)(2906002)(336012)(8936002)(6862004)(8676002)(81166007)(83380400001)(6486002)(55236004)(82310400003)(86362001)(36756003)(34020700004)(6506007)(26005)(53546011)(70586007)(478600001)(54906003)(186003)(70206006)(316002)(6512007)(33656002)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2021 19:14:57.6230
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f4a0554f-a2cf-44ec-4404-08d8b6652f6a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT047.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6317

Hi,

> On 11 Jan 2021, at 19:07, Julien Grall <julien@xen.org> wrote:
>=20
>=20
>=20
> On 11/01/2021 19:02, Bertrand Marquis wrote:
>> Hi Julien,
>=20
> Hi Bertrand,
>=20
>>> On 11 Jan 2021, at 18:50, Julien Grall <julien@xen.org> wrote:
>>>=20
>>> On 11/01/2021 18:21, Bertrand Marquis wrote:
>>>> Hi Julien,
>>>=20
>>> Hi Bertrand,
>>>=20
>>>> Sorry for the delay but I was on holiday until today.
>>>=20
>>> Welcome back! No worries.
>>>=20
>>>>> On 11 Jan 2021, at 10:25, Julien Grall <julien@xen.org> wrote:
>>>>>=20
>>>>> Hi Jan,
>>>>>=20
>>>>> On 11/01/2021 08:49, Jan Beulich wrote:
>>>>>> On 08.01.2021 20:22, Stefano Stabellini wrote:
>>>>>>> MVFR2 is not available on ARMv7. It is available on ARMv8 aarch32 a=
nd
>>>>>>> aarch64. If Xen reads MVFR2 on ARMv7 it could crash.
>>>>>>>=20
>>>>>>> Avoid the issue by doing the following:
>>>>>>>=20
>>>>>>> - define MVFR2_MAYBE_UNDEFINED on arm32
>>>>>>> - if MVFR2_MAYBE_UNDEFINED, do not attempt to read MVFR2 in Xen
>>>>>>> - keep the 3rd register_t in struct cpuinfo_arm.mvfr on arm32 so th=
at a
>>>>>>>   guest read to the register returns '0' instead of crashing the gu=
est.
>>>>>>>=20
>>>>>>> '0' is an appropriate value to return to the guest because it is de=
fined
>>>>>>> as "no support for miscellaneous features".
>>>>>>>=20
>>>>>>> Aarch64 Xen is not affected by this patch.
>>>>>> But it looks to also be affected by ...
>>>>>=20
>>>>> AFAICT, the smoke test passed on Laxton0 (AMD Seattle) [1] over the w=
eek-end.
>>>>>=20
>>>>>>> Fixes: 9cfdb489af81 ("xen/arm: Add ID registers and complete cpuinf=
o")
>>>>>> ... this, faulting (according to osstest logs) early during boot on
>>>>>=20
>>>>> The xen-unstable flight [2] ran on Rochester0 (Cavium Thunder-X). So =
this has something to do with the platform.
>>>>>=20
>>>>> The main difference is AMD Seattle supports AArch32 while Cavium Thun=
der-X doesn't.
>>>>>=20
>>>>>> 000000000025D314	mrs	x1, id_pfr2_el1
>>>>> This register contains information for the AArch32 state.
>>>>>=20
>>>>> AFAICT, the Arm Arm back to at least ARM DDI 0487A.j (published in 20=
16) described the encoding as Read-Only. So I am not sure why we receive an=
 UNDEF here, the more it looks like ID_PFR{0, 1}_EL1 were correctly accesse=
d.
>>>>>=20
>>>>> Andre, Bertrand, do you have any clue?
>>>> I will double check this but my understanding when I checked this was =
that it would be possible to read with an unknown value but should not gene=
rate an UNDEF.
>>>>>=20
>>>>> However, most of the AArch32 ID registers are UNKNOWN on platform not=
 implementing AArch32. So we may want to conditionally skip the access to A=
Arch32 state.
>>>> We could skip aarch32 registers on platforms not supporting aarch32 bu=
t we will still have to provide values to a guest trying to access them so =
might be better to return what is returned by the hardware.
>>>=20
>>> Per the Arm Arm, the value of the registers may changed at any time. IO=
W, two read of the sytem registers may return different values.
>>>=20
>>> IIRC, the original intent of the series was to provide sanitized value =
of the ID registers. So I think it would be unwise to let the guest using t=
he values.
>>>=20
>>> Instead, I would suggest to implement them as RAZ.
>> Works for me.
>>>=20
>>>> Now if some platforms are generating an UNDEF we need to understand in=
 what cases and behave the same way for the guest.
>>>=20
>>> I am not entirely sure what you mean by platforms here.
>>>=20
>>> If you mean any platform conforming with the Arm Arm, then I agree with=
 your statement.
>>>=20
>>> However, if you refer to platform that may not follow the Arm Arm, then=
 I disagree. We should try to expose a sane interface to the guest whenever=
 it is possible.
>>>=20
>>> In this case, I would bet the hardware would not even allow us to trap =
the ID_PFR2. Although, I haven't tried it.
>>>=20
>>>> Do i understand it right that on Cavium which has no aarch32 support t=
he access is generating an UNDEF ?
>>>=20
>>> Yes. The UNDEF will happen when trying to read ID_PFR2_EL1. Interesting=
ly, it doesn't happen when reading ID_PFR{0, 1}_EL1. So this smells like a =
silicon bug.
>> Sounds like the ifdef ARM64 should be something like if (!cavium)
>=20
> Hmmm.... Cavium may not the only platform where AArch32 is not supported.
> So as the values are actually UNKOWN (or UNDEF or Cavium), then there is =
no point to read them.
>=20
> Therefore the following pseudo-code should be enough:
>=20
> if ( aarch32 supported )
>  read AArch32 ID registers
>=20
> This will nicely solve the UNDEF on Cavium without adding more workaround=
 in the code :).

Works for me.

Cheers
Bertrand

>=20
> Cheers,
>=20
> --=20
> Julien Grall


