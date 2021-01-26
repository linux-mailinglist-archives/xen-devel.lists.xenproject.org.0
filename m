Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52600304029
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jan 2021 15:24:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.75119.135178 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4PGN-0007Tc-9J; Tue, 26 Jan 2021 14:24:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 75119.135178; Tue, 26 Jan 2021 14:24:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4PGN-0007TD-63; Tue, 26 Jan 2021 14:24:11 +0000
Received: by outflank-mailman (input) for mailman id 75119;
 Tue, 26 Jan 2021 14:24:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=55K9=G5=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1l4PGL-0007T8-EY
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 14:24:09 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.44]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3a2a0dc4-bb64-40d4-b238-2e59648823dc;
 Tue, 26 Jan 2021 14:24:07 +0000 (UTC)
Received: from AM6P193CA0054.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:8e::31)
 by AM8PR08MB5652.eurprd08.prod.outlook.com (2603:10a6:20b:1d8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.16; Tue, 26 Jan
 2021 14:23:42 +0000
Received: from VE1EUR03FT030.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8e:cafe::7a) by AM6P193CA0054.outlook.office365.com
 (2603:10a6:209:8e::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12 via Frontend
 Transport; Tue, 26 Jan 2021 14:23:42 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT030.mail.protection.outlook.com (10.152.18.66) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.11 via Frontend Transport; Tue, 26 Jan 2021 14:23:42 +0000
Received: ("Tessian outbound 28c96a6c9d2e:v71");
 Tue, 26 Jan 2021 14:23:41 +0000
Received: from c1b881efba28.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5FFBB85E-9970-47F3-A24E-435CA9B367BB.1; 
 Tue, 26 Jan 2021 14:23:30 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c1b881efba28.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 26 Jan 2021 14:23:30 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com (2603:10a6:800:1ae::15)
 by VI1PR08MB5501.eurprd08.prod.outlook.com (2603:10a6:803:138::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12; Tue, 26 Jan
 2021 14:23:28 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::c8bf:1301:3373:94a6]) by VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::c8bf:1301:3373:94a6%5]) with mapi id 15.20.3784.017; Tue, 26 Jan 2021
 14:23:28 +0000
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
X-Inumbo-ID: 3a2a0dc4-bb64-40d4-b238-2e59648823dc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XTx/eoR77d/6vQZXnSmBfeszOpLOAqTA4K5kQT35Kiw=;
 b=E8M3TiWqOVTx8/iAo70p1FadaCFVp1oecg5G5YbdLAbg6do7M037CfokQjxGtkj59UqUkAzxjih1U2O6we75dyDl38idiSk23jJxs6LowkyxB69wUj7PfhaTYOtwJXDN+VT8OthyhnCQrWXYEqSTTGB1Dis+CvD4se1d7+YKvp0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: cc51ef870b26bcea
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nhE8UH6piz7YCAogjMKC8LpvDOh8SsdwDPs//FyRD+mr0g9K54TRKE9xF0AqPAwoO5cmf8HPHnBNIvsEGGB0rXjkqinuF+Fikw5DHj3tFLdb7/Yli5ThurJZS6qt4WgG7vZws5Evxrqfsr72VnKFxvQPH9Zl5amXRcGneW5xcYy8c5R9hzkR98Xkj0hS2cua6tPfe63caRGihdiQmY2+h8LxYQ0jb6e0f9dxmDBiiN8E5e0W2JQXvU+p0xhT89WNheaWphJW268+rmiOBV0YuiY3q6jrWNh5SxTMmy8GD6NPDdNgkzcFjYmpAGKslBCZnZ4VnYcHygWj0zjv4G/L6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XTx/eoR77d/6vQZXnSmBfeszOpLOAqTA4K5kQT35Kiw=;
 b=AnRvKlyEr6DZxDJOKA46MZOMCd0c+pYAbChFYuiT7de0hjY8s3GPuDqqK1TZAggRPRXzgYlSpSmHpvFGA7pGo0+4ozio4frFvxlQBVDV4U6wN8TczgwbPOqy3ZXMdY7VVnPiT6ZnOQ7GwvgkfHKG/igo6z/hay3LLrhzHnS7oNp76YdKInXRYdfyp0uCHwLNE+ZY5PL6DAgGS3RruACxbzf9ttER47t5xQonSn9avJ3LTqd/iJMma1rT9NR+McWMiGEHjpJc+JrnEZABjkYNE55WFADxzUTrp50MplOjcxTk4sTHAJ5QM6UUMQskZvtNWOkP5QFRYUmQyIeTmLZgLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XTx/eoR77d/6vQZXnSmBfeszOpLOAqTA4K5kQT35Kiw=;
 b=E8M3TiWqOVTx8/iAo70p1FadaCFVp1oecg5G5YbdLAbg6do7M037CfokQjxGtkj59UqUkAzxjih1U2O6we75dyDl38idiSk23jJxs6LowkyxB69wUj7PfhaTYOtwJXDN+VT8OthyhnCQrWXYEqSTTGB1Dis+CvD4se1d7+YKvp0=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <stefano.stabellini@xilinx.com>, "andrew.cooper3@citrix.com"
	<andrew.cooper3@citrix.com>, "george.dunlap@citrix.com"
	<george.dunlap@citrix.com>, "iwj@xenproject.org" <iwj@xenproject.org>,
	"jbeulich@suse.com" <jbeulich@suse.com>, "wl@xen.org" <wl@xen.org>
Subject: Re: [PATCH v4 1/2] xen: EXPERT clean-up and introduce UNSUPPORTED
Thread-Topic: [PATCH v4 1/2] xen: EXPERT clean-up and introduce UNSUPPORTED
Thread-Index: AQHW82EN9R2ynrmbqk6EAVX0Oyalkao57c2AgAAJDwA=
Date: Tue, 26 Jan 2021 14:23:28 +0000
Message-ID: <F383D21D-2C97-471D-9B20-DE65028A597C@arm.com>
References: <alpine.DEB.2.21.2101251321420.20638@sstabellini-ThinkPad-T480s>
 <20210125212747.26676-1-sstabellini@kernel.org>
 <616b0552-33fc-360e-664c-44178e5afc6a@xen.org>
In-Reply-To: <616b0552-33fc-360e-664c-44178e5afc6a@xen.org>
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
X-MS-Office365-Filtering-Correlation-Id: d676301f-262f-44e0-eafa-08d8c205fb98
x-ms-traffictypediagnostic: VI1PR08MB5501:|AM8PR08MB5652:
X-Microsoft-Antispam-PRVS:
	<AM8PR08MB5652E0DF8C3A6F01D696D8C89DBC0@AM8PR08MB5652.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 08cesnmH7QD3FDeeWSdtTY3j0VDijkAGSzGWgxIE6GftGY7Bb5FuTN3ttmC5G7m0Vc9+zZ3fp2hAXBDP1ylRV7ZLTgugmPJsdAc6ZgNr2FAxv+NhHbTfMtIEnx3UgjVPTie3zPxtzhneiB4PvMPLKbDohNEPHKJhzsgxk1RwBxv83UrLzvpKcgv4ouFts1E0v81s8Z4iGhDyAbKv5AWsBAsVOKJX6R7qb+4f5ECbucHULzuZnoRyALfUkHDK6mIrspgsKjlIyOVdqv6l0VIfAlHml8q1ZYun18bgbrClGHwSRTazmWI4J9JsWsR8qdx95CIoAWGQluY+LeG2XNRKMGA1dMvBVOSTmGDBVl1Zp5ucowyD30hrPbD3s56Czeeg2PoFMcFEX8Bm1hfm+28YWkN87quiykC4dLM8g9+ddmV8zITvj6zDpk+DA0YGkTwr
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(346002)(136003)(366004)(39860400002)(71200400001)(5660300002)(478600001)(6916009)(8936002)(316002)(86362001)(83380400001)(2616005)(6506007)(55236004)(91956017)(186003)(53546011)(33656002)(76116006)(66946007)(64756008)(66446008)(36756003)(66556008)(6486002)(66476007)(2906002)(54906003)(26005)(6512007)(4326008)(8676002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?lkt8wlTCAOz7hqR/Xmo7vGCIqN2Yy1qDQIzTPJ7S1fWYMbH7odLjralCyhm/?=
 =?us-ascii?Q?C/slU2YyyMljscePGqBiDaiG+5BHfbUAv4k7QdJ7rhtAPBpI/Hs9yt2SI28o?=
 =?us-ascii?Q?RHdQYkHYf5hzOcpWNqQfTxG5OnQr1G+0hx9kIeUMD7wHYrMj1KeHO2169EV8?=
 =?us-ascii?Q?Qvz0DYaog8o1KgeMkvgRw7L4oKwImc8VcCwB494RoX8TCENgm/hy9hffjr5j?=
 =?us-ascii?Q?PrV4yaHY3hbOvdFtRs5QQ0nhd6hKnbfdABE6gvhzVLaGAkwPOarVDNrA7jIN?=
 =?us-ascii?Q?Qzxgr+j8ovirTIyatExsuy2R2v23oACrOZTlvepbqGXx457O42DyLp+zwzJU?=
 =?us-ascii?Q?AnzrYqLsWCsctKUSWL6uSsJ2Hl3TvaYVOhLurWxgI7wneLLMKKDFdKHkqtke?=
 =?us-ascii?Q?Wgyy+C5UgRHI3M0os+w6U1WYj3ww6o3r7PGeGe6/h6gCZTHTITj/tdeNsRku?=
 =?us-ascii?Q?R8O9ig1fQdw/YhKG3+jdMohmYL+K986MnQaZr/a9qXaqLODqJhNgm0LugyuI?=
 =?us-ascii?Q?9fkden3gnZ7fVzrIY14MSqepX5qOQ1Ts3BZy8DR+GJt1HQ2GIyXmmjDvAPdW?=
 =?us-ascii?Q?GAKq0jyL4vROQ9qJfsAbgZxQsppIz1D3YpAeAdRteP+iwWQcL7I4XPNT2IGF?=
 =?us-ascii?Q?fcEX5ycAT7Wt8WJS/Qi1yvT6gArReBZ4JhvqIXgpVTdbhedGTrgpVh9cSGvA?=
 =?us-ascii?Q?wVPoppUqCg1OagpmnP7mRKBR9dSmswaRBEIvFJD8oNqfHhtfpVPnC5KpEDmw?=
 =?us-ascii?Q?urFtVs9sc4gA9IphtGsJh3Tfu3bEyzCT5go+3W/Q4SVaT8qQMedCUZoXZG2C?=
 =?us-ascii?Q?QaoT1TAGPUKE3haOLR3zkM+m3pXfwcfuRdgtWCGh4m98rDUAR1ZDaBhsllRo?=
 =?us-ascii?Q?Gdhmw/g2F0wUgALSk/9vwHd0sWEoYsMZ88yMALTYrAvt4hcY8haa1SvnmPkf?=
 =?us-ascii?Q?ZlPQwUveorPodMJMh1KqwVr5zMzylZdoIu8CqGgow78UUgPyjXiUi/Ip6Kju?=
 =?us-ascii?Q?+/0wzb7Vg/t9tWmga9uBYDEp43AAuZTKgpD5EA7gAPVVVnKn5B3nTkdYMdwS?=
 =?us-ascii?Q?fjbgbtjb?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <27BE1FF482304249AD145EAE5783E9D7@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5501
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	98e784f8-c7a6-4500-cec0-08d8c205f35a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	q2sdkKzPaM+NhgVsOGghLJTnzJ69ScI0ESlJjA0PQNjRvXZgKSjCfC7HKH7OUDbJDMqQNmOL2VWlGHirUBEQpPtCy87KOo0HI4+fTsY0IF9un7Zl69idpfPbSEFTLf6xrt3SUG3ZEUADlD4hoUwTq4C6yvIsP5xc1LCPZC7ojDBahYPEmoS0NJ2A8ht1y5fZmo90Dl+CUaozPo47XuhJ3sNeQPyvXldgjFoqNxm8UBQtEK4FjOKArlmo38z3ShOJO7d1SntFWxZEVWtSoC5VI/lFBY4wcSqtEZH0N3pVgUtHwV/b8IzpTjdsbKGPnpPw3YoxYx1umNJlWzMSRsQMsz9VUogn7x9uJx2mW4GYgzaJbaKnr93cqyb9qRM3H/H2vTXoE7TehCKJT8PiC5rNWgDOvI3nEOVpkSkBgRde6EMav6VIzO3QPo90ASgd00r+JED7ouVm6ZyWVIYVaKHnK3V6sag8+WK4LOjK9UAk4Rd94Emmx3Ke81N717N05UDTBAVej5BizvCR+9jX4U96AWN1SUh2HaZ1Cgc+kfjMIo1ZiSPNoFlZjpRfGh2DGnc7/uC5VyT5LmW2S3o0/XFOZBy0gZ2cgfYgoxusIfRRtGw=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(346002)(396003)(136003)(39860400002)(46966006)(54906003)(86362001)(316002)(8936002)(2616005)(6512007)(5660300002)(6486002)(53546011)(70206006)(8676002)(478600001)(4326008)(6506007)(33656002)(6862004)(82310400003)(2906002)(336012)(82740400003)(47076005)(186003)(36756003)(81166007)(70586007)(55236004)(356005)(26005)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2021 14:23:42.2993
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d676301f-262f-44e0-eafa-08d8c205fb98
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5652

Hi Julien,

> On 26 Jan 2021, at 13:51, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Stefano,
>=20
> On 25/01/2021 21:27, Stefano Stabellini wrote:
>>  config ARM_SSBD
>> -	bool "Speculative Store Bypass Disable" if EXPERT
>> +	bool "Speculative Store Bypass Disable (UNSUPPORTED)" if UNSUPPORTED
>>  	depends on HAS_ALTERNATIVE
>>  	default y
>>  	help
>> @@ -87,7 +87,7 @@ config ARM_SSBD
>>  	  If unsure, say Y.
>>    config HARDEN_BRANCH_PREDICTOR
>> -	bool "Harden the branch predictor against aliasing attacks" if EXPERT
>> +	bool "Harden the branch predictor against aliasing attacks (UNSUPPORTE=
D)" if UNSUPPORTED
>>  	default y
>>  	help
>>  	  Speculation attacks against some high-performance processors rely on
>=20
> I read through the back and forth between Bertrand and Jan about "UNSUPPO=
RTED". However, I still don't understand why those two options are moved to=
 UNSUPPORTED.

Discussion was more on what to do for options which have a default y and ca=
n only be turned off with UNSUPPORTED or EXPERT selected.

>=20
> Both options will only build the code to enable the mitigation. The decis=
ion is still based on the processor you are running on.
>=20
> In addition to that, ARM_SSBD can also be forced enabled/disabled on the =
command line.
>=20
> A user may want to compile out the code if the target processor is not th=
e affected by the two issues. This wouldn't be much different to Xen decidi=
ng to not enabling the mitigation.
>=20
> I would view the two options as supported but not security supported. So =
this seems to fit exactly in the definition of EXPERT rather than UNSUPPORT=
ED.

I think you are right here, not security supported should be only available=
 to EXPERT.

Cheers
Bertrand

>=20
> Cheers,
>=20
> --=20
> Julien Grall
>=20


