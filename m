Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 353872F2D33
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jan 2021 11:51:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.65586.116218 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzHG5-0002Oa-6O; Tue, 12 Jan 2021 10:50:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 65586.116218; Tue, 12 Jan 2021 10:50:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzHG5-0002OB-2w; Tue, 12 Jan 2021 10:50:41 +0000
Received: by outflank-mailman (input) for mailman id 65586;
 Tue, 12 Jan 2021 10:50:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zMwe=GP=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kzHG3-0002O6-Q2
 for xen-devel@lists.xenproject.org; Tue, 12 Jan 2021 10:50:39 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [40.107.20.76]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fc15b201-9c65-4939-8a2a-299b7755b550;
 Tue, 12 Jan 2021 10:50:37 +0000 (UTC)
Received: from MRXP264CA0026.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:14::14)
 by VI1PR08MB4205.eurprd08.prod.outlook.com (2603:10a6:803:e1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9; Tue, 12 Jan
 2021 10:50:35 +0000
Received: from VE1EUR03FT050.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:500:14:cafe::e4) by MRXP264CA0026.outlook.office365.com
 (2603:10a6:500:14::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.8 via Frontend
 Transport; Tue, 12 Jan 2021 10:50:35 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT050.mail.protection.outlook.com (10.152.19.209) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Tue, 12 Jan 2021 10:50:34 +0000
Received: ("Tessian outbound 8418c949a3fa:v71");
 Tue, 12 Jan 2021 10:50:34 +0000
Received: from 6ad551d7fa0b.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1ABA2E6B-581B-4B6D-9BC4-6E839EF5A96F.1; 
 Tue, 12 Jan 2021 10:50:29 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6ad551d7fa0b.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 12 Jan 2021 10:50:29 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com (2603:10a6:800:1ae::15)
 by VE1PR08MB5853.eurprd08.prod.outlook.com (2603:10a6:800:1a5::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Tue, 12 Jan
 2021 10:50:28 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::c8bf:1301:3373:94a6]) by VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::c8bf:1301:3373:94a6%5]) with mapi id 15.20.3742.012; Tue, 12 Jan 2021
 10:50:28 +0000
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
X-Inumbo-ID: fc15b201-9c65-4939-8a2a-299b7755b550
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=geeL1Qau3uigoFryzk1EY9YeP0uaRoArwhEcjTgurGg=;
 b=PINTeBP5hMllJWDEmFxXApthQjCaD/GkfEERRut4M3NUneBAjbFQvLrNC7KbKRwt1MBqPJclG159MaJ6bL22LFyRjQpSj9LDz5Dl+DecFQet2eqcxqnJYH2NQalO3pvNUMRGE6G5U7ungU/5rBFikcYZt0a5jWvRbSzpNXOWYSk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: efe8565f6d739be2
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cj0NtYL1WctPJxjoMhMxjAnFjEhPkDE384WBQ81l8tR9kI50z1apEAqDwGXQwww0Jdgi1iq0GUghV8qvTuOVotBzA8GS3j97mw85SXfhGmF1GIohkIN6dxIoQP3k4BY5NeA8Dyjf3n5kHboZyJhhxGFTnvEazPXnj+042s7iRhoLa51SQOeaUz3uGWSLjP5cXPZ2u79MOUBrfrQwa6KC7fs7o8wK0lRu1N00I91S9GsgyNeQB+jao1QgUVy6HlobrO+hWvm2l+R7z648duu+l/y6D3lgqUMz3tkkB2KLM8JRMN1nPNH6FYM6ctrg/dRMVwbtv9i6yjscz4LTmoxHog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=geeL1Qau3uigoFryzk1EY9YeP0uaRoArwhEcjTgurGg=;
 b=Q8qXILrTuPF324dYEOYMQm8qKEIEdzaBl4on9knGDmZNOPs8l0USihQfZ2t8IGc5CQl1Ujg9tU7haYHItJLeLeaIXim6enaunP0Umj4rwfVP/IorZlmqRaV80bOV5ThzczLSFVaUXTOsUCCumrCOGFyG1rkWaIPdiKtP3pzQVN/uInaYtarOdzj3jic4qj/yvprhThxyMRtVlrdpu86J8IhYSwP2dwx8PN27EzJXTCgxY8SXoaBbrMRnQmoQM/TYx47EGCiSY20uiHH3jWnrns+qzvKFNEZE/XW5oateoJ9tuYvJr0H1DCtsNsq+OEh03u5iqo3Pe+z2gBpQ1KwQsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=geeL1Qau3uigoFryzk1EY9YeP0uaRoArwhEcjTgurGg=;
 b=PINTeBP5hMllJWDEmFxXApthQjCaD/GkfEERRut4M3NUneBAjbFQvLrNC7KbKRwt1MBqPJclG159MaJ6bL22LFyRjQpSj9LDz5Dl+DecFQet2eqcxqnJYH2NQalO3pvNUMRGE6G5U7ungU/5rBFikcYZt0a5jWvRbSzpNXOWYSk=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, "julien@xen.org"
	<julien@xen.org>, "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>,
	Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: Re: [PATCH] xen/arm: don't read aarch32 regs when aarch32 isn't
 available
Thread-Topic: [PATCH] xen/arm: don't read aarch32 regs when aarch32 isn't
 available
Thread-Index: AQHW6HhLZe62+lKsX0KJMppOaCzey6oj0IcA
Date: Tue, 12 Jan 2021 10:50:28 +0000
Message-ID: <05DC1229-9A51-421F-8BBB-73D719CD0F93@arm.com>
References: <20210112001623.28421-1-sstabellini@kernel.org>
In-Reply-To: <20210112001623.28421-1-sstabellini@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3608.120.23.2.4)
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [217.140.99.251]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d59c247c-7955-4c1a-8eb8-08d8b6e7e3f2
x-ms-traffictypediagnostic: VE1PR08MB5853:|VI1PR08MB4205:
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB4205361ACFB43852F49C9C6E9DAA0@VI1PR08MB4205.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 xzVMZA33L7LgqCh/83Tb04e34x++hELZwyAY5xR+kgfBXOT80QY78pYKN0KE9HSzGGoYf8N517/xAgPrJKXIpxnP22XTIh+iX3bN+BdRY1ArJZlp+hBFwhu2CcQ+lm95CP4Ljet9nZcx0b9T+HI9wj+KRpo2Dtzn+TrpUzbgU8k63FOXS+lBqZguZNyVb7fMyveQIO2ilb3gwF0GUa4lSE8rILB7D+DCKpSCtEiMQDpsBo75K542GWFLihbc9B3vXyLl75Mfs30PKr6IJ+wkU/TLjcx2JO9/10FBUUkru/7TMmfUAXtg9ynJv8r5UkwAwgl/0tQyBnA0ZtboUwBm3mak40JTyobbYOL08LPuXr/Qe9WUTfAGkhj9NDZhmYtUJ3C0TDLd4wI5fWXuzF/SbLwhUws22kZcRe8QJR/7zBVQyUE14X7+ZJkla0nPPa5yshZnaNGc6f2gxnwhg9oxdIX9nixUfpw+fnrNzkPHcUH4mffYxktfgI9cC9Ch9kVr1v3rFKxQN1NAUzdDalLRmWcRKC0XgjR8nvAMLiHol5c=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(346002)(366004)(136003)(376002)(91956017)(66946007)(76116006)(6916009)(64756008)(66476007)(6486002)(54906003)(66556008)(2906002)(26005)(316002)(53546011)(36756003)(71200400001)(66446008)(6506007)(966005)(5660300002)(33656002)(478600001)(2616005)(4326008)(8676002)(186003)(6512007)(83380400001)(86362001)(8936002)(45980500001)(6606295002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?ypiACKuhqpMdMn8C8PdSay6XG1tlNHjM1CPS+Oe1AVfkdAtNxOkUYLGlqZmF?=
 =?us-ascii?Q?VMEYAjJ+iBMvYMl1m6C9HxUi28IrobfNcqAKb9QlS+KiaT3qk/zIAv4HfooU?=
 =?us-ascii?Q?/anr0VXZ1bc+E1NK2YdtoT0jwPScbI7OFgPmgsIlz3jbq6PV2vliPc5BeBnz?=
 =?us-ascii?Q?dcZX01YlwQpIRWDbJBiSTHNpjMbUoyi7h8bKCY1Mmu+WOoerbVHzs3ug67vk?=
 =?us-ascii?Q?Fjz3vuAFu4rXZKmuxEhXglxFB7mUVFAZYTUeYDR2E6OLRfLZv07y2Ypy4bgj?=
 =?us-ascii?Q?e3Uo//UzovOspBtEzzRe8eeit+udIsLDRnUqhhr3h30z4D6EHE3ARTAtbver?=
 =?us-ascii?Q?iSrtTIfN8wb+2K0EkEjGbHypXj/19iijE9tOb669U8o6ltOEG1znGfDvPbhj?=
 =?us-ascii?Q?0vaCGwWiH/d/2jxPF+oac4QB0uZxmONimgmE5NxKm4mwxgNvCGk/USNAut6e?=
 =?us-ascii?Q?6cTGaT3maJMb3YXJ5OZq5eew9Zw5gvYwim98zdbv00lWtNRMVt5llX72VPzO?=
 =?us-ascii?Q?gRNxKWHoWDvMnDDHMs1Af7+5sYYNCvThtHu/DKhjqUi1ZmXhMTvniC5BEVKt?=
 =?us-ascii?Q?l5zWoTbRxih2qChoJJp7hggpIE4kcp8+PcSQFQJFKi3UA2AYw0g0uxD6gQLf?=
 =?us-ascii?Q?E5CZx9o8Co0ZrPGgTlC9MHZoNHD3JzaesgTke7TSjIQRTjeF3WokoAqJyih1?=
 =?us-ascii?Q?CcbfgMiQWdzOZb6VpY0UL8be26i5Ob4iTq8pfemU3r0+y3bJvRXecURhyfD6?=
 =?us-ascii?Q?rtg3X6UPuo8Xuw+3zCkVW+eZVds1Un5GAbh/0ZCC6vxM5s3LexsQ1sMklaaL?=
 =?us-ascii?Q?1B7jzBbvdMMer5TmORjSKQqn2GFHApdBNFUJ6zyWovdm7AIldP/iVBZTAKwG?=
 =?us-ascii?Q?pas2mhnBDHSBnEFQRL8i/SZkh7k6W/QGYi3/wsDhn36Jja7LEFEBm+t2O1Qb?=
 =?us-ascii?Q?4szT+Wq+xsc69MoqghIbwPAkmAK20gokbKjvh0tz1eySG6gWK8osfUYa0Har?=
 =?us-ascii?Q?/CPT?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <8C172D4FD0677047A904F91122D0CBB0@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5853
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT050.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c57e6303-8483-41fa-f979-08d8b6e7dfd2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5RV8Yse83NJPF4P6co7kEHitBV4OGDK765rSjeC7TIT1KpI5XCfbFaxCbAD4QOuSiMmX/qbfJKcF52QOPbnVNKye7yaC3DXhWCfhLXYaOwGpFB+h6O/YpmSKqXm8nzmdXXWkE12dWFBFVQMq5dqHvw4p2UDBKkJP844+FYkBoIeG/Lia7LUPS3zsPRC+BLQcNsoSFdHAMv0dJnH7+IuIJO2brBP12v8JB7Blim9F8yW+oumiBs59So6uhnZxuCFlzlX2ZkCz6ebbQ3pVWAUTh8oKQ6AsHDhHDm+ecYiV2ZxWaG03oQ7kmYAvXw+I6OsbBgmkTdOy4kjcrzuCzW46Iq1Q9WtdSb0qnRbAVkOS5N+fIagHu3P8uLO4YI9vmm3IJZXcnzRzd+6FU/HcewLI1IyCv5kz65Ne6NVcwV3BGzSbWyiRT8Q5GtlmE3uvO0lCzrT/mKM5Nck+UrS7QUe0Bdcx3Nc3UKCEwO3u6fC4lh1lAJ8lmoDme6JUi8MQt0E5Y1wWKuds6D6wzoeqnUcjdClJe/DgTEH6ngmclU8OAaq3RqkDLPmJ+lCTuhZCWLweH47x8tSJiMQWtHY2rNcJySoX7CQ2eqSxtDDSnqHc4tQ=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(39860400002)(136003)(376002)(396003)(46966006)(4326008)(316002)(966005)(81166007)(5660300002)(356005)(70586007)(34020700004)(82740400003)(82310400003)(6512007)(86362001)(2906002)(47076005)(54906003)(186003)(336012)(83380400001)(6506007)(53546011)(8676002)(36756003)(2616005)(8936002)(6486002)(33656002)(6862004)(107886003)(26005)(478600001)(70206006)(6606295002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2021 10:50:34.9680
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d59c247c-7955-4c1a-8eb8-08d8b6e7e3f2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT050.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4205

Hi Stefano,

> On 12 Jan 2021, at 00:16, Stefano Stabellini <sstabellini@kernel.org> wro=
te:
>=20
> Don't read aarch32 system registers at boot time when the aarch32 state
> is not available. They are UNKNOWN, so it is not useful to read them.
> Moreover, on Cavium ThunderX reading ID_PFR2_EL1 causes a Xen crash.
> Instead, only read them when aarch32 is available.
>=20
> Leave the corresponding fields in struct cpuinfo_arm so that they
> are read-as-zero from a guest.

I agree with the fact that all users of identify_cpu are currently using sp=
aces
which are 0 but to make the core a bit more robust we could do a memset(0)
of the structure at the beginning of the function.

>=20
> Since we are editing identify_cpu, also fix the indentation: 4 spaces
> instead of 8.
>=20
> Fixes: 9cfdb489af81 ("xen/arm: Add ID registers and complete cpuinfo")
> Link: https://marc.info/?l=3Dxen-devel&m=3D161035501118086
> Link: http://logs.test-lab.xenproject.org/osstest/logs/158293/test-arm64-=
arm64-xl-xsm/info.html
> Suggested-by: Julien Grall <julien@xen.org>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> ---
> xen/arch/arm/cpufeature.c | 35 +++++++++++++++++++++--------------
> 1 file changed, 21 insertions(+), 14 deletions(-)
>=20
> diff --git a/xen/arch/arm/cpufeature.c b/xen/arch/arm/cpufeature.c
> index 698bfa0201..b1c82ade49 100644
> --- a/xen/arch/arm/cpufeature.c
> +++ b/xen/arch/arm/cpufeature.c
> @@ -101,29 +101,35 @@ int enable_nonboot_cpu_caps(const struct arm_cpu_ca=
pabilities *caps)
>=20
> void identify_cpu(struct cpuinfo_arm *c)
> {
> -        c->midr.bits =3D READ_SYSREG(MIDR_EL1);
> -        c->mpidr.bits =3D READ_SYSREG(MPIDR_EL1);
> +    bool aarch32 =3D true;
> +
> +    c->midr.bits =3D READ_SYSREG(MIDR_EL1);
> +    c->mpidr.bits =3D READ_SYSREG(MPIDR_EL1);
>=20
> #ifdef CONFIG_ARM_64
> -        c->pfr64.bits[0] =3D READ_SYSREG(ID_AA64PFR0_EL1);
> -        c->pfr64.bits[1] =3D READ_SYSREG(ID_AA64PFR1_EL1);
> +    c->pfr64.bits[0] =3D READ_SYSREG(ID_AA64PFR0_EL1);
> +    c->pfr64.bits[1] =3D READ_SYSREG(ID_AA64PFR1_EL1);
> +
> +    c->dbg64.bits[0] =3D READ_SYSREG(ID_AA64DFR0_EL1);
> +    c->dbg64.bits[1] =3D READ_SYSREG(ID_AA64DFR1_EL1);
>=20
> -        c->dbg64.bits[0] =3D READ_SYSREG(ID_AA64DFR0_EL1);
> -        c->dbg64.bits[1] =3D READ_SYSREG(ID_AA64DFR1_EL1);
> +    c->aux64.bits[0] =3D READ_SYSREG(ID_AA64AFR0_EL1);
> +    c->aux64.bits[1] =3D READ_SYSREG(ID_AA64AFR1_EL1);
>=20
> -        c->aux64.bits[0] =3D READ_SYSREG(ID_AA64AFR0_EL1);
> -        c->aux64.bits[1] =3D READ_SYSREG(ID_AA64AFR1_EL1);
> +    c->mm64.bits[0]  =3D READ_SYSREG(ID_AA64MMFR0_EL1);
> +    c->mm64.bits[1]  =3D READ_SYSREG(ID_AA64MMFR1_EL1);
> +    c->mm64.bits[2]  =3D READ_SYSREG(ID_AA64MMFR2_EL1);
>=20
> -        c->mm64.bits[0]  =3D READ_SYSREG(ID_AA64MMFR0_EL1);
> -        c->mm64.bits[1]  =3D READ_SYSREG(ID_AA64MMFR1_EL1);
> -        c->mm64.bits[2]  =3D READ_SYSREG(ID_AA64MMFR2_EL1);
> +    c->isa64.bits[0] =3D READ_SYSREG(ID_AA64ISAR0_EL1);
> +    c->isa64.bits[1] =3D READ_SYSREG(ID_AA64ISAR1_EL1);
>=20
> -        c->isa64.bits[0] =3D READ_SYSREG(ID_AA64ISAR0_EL1);
> -        c->isa64.bits[1] =3D READ_SYSREG(ID_AA64ISAR1_EL1);
> +    c->zfr64.bits[0] =3D READ_SYSREG(ID_AA64ZFR0_EL1);
>=20
> -        c->zfr64.bits[0] =3D READ_SYSREG(ID_AA64ZFR0_EL1);
> +    aarch32 =3D c->pfr64.el1 =3D=3D 2;

I would put some () around the test.

> #endif
>=20
> +    if ( aarch32 )
> +    {
>         c->pfr32.bits[0] =3D READ_SYSREG(ID_PFR0_EL1);
>         c->pfr32.bits[1] =3D READ_SYSREG(ID_PFR1_EL1);
>         c->pfr32.bits[2] =3D READ_SYSREG(ID_PFR2_EL1);
> @@ -153,6 +159,7 @@ void identify_cpu(struct cpuinfo_arm *c)
> #ifndef MVFR2_MAYBE_UNDEFINED
>         c->mvfr.bits[2] =3D READ_SYSREG(MVFR2_EL1);
> #endif

If we test for aarch32, the ifndef here should not be needed anymore.

Is your previous patch really still needed if we go with the aarch32 path ?

Cheers
Bertrand

> +    }
> }
>=20
> /*
> --=20
> 2.17.1
>=20


