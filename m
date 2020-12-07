Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D062D17A3
	for <lists+xen-devel@lfdr.de>; Mon,  7 Dec 2020 18:35:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.46891.83080 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmKQH-0001PE-FA; Mon, 07 Dec 2020 17:35:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 46891.83080; Mon, 07 Dec 2020 17:35:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmKQH-0001Oo-B9; Mon, 07 Dec 2020 17:35:41 +0000
Received: by outflank-mailman (input) for mailman id 46891;
 Mon, 07 Dec 2020 17:35:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gzin=FL=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kmKQG-0001OY-ON
 for xen-devel@lists.xenproject.org; Mon, 07 Dec 2020 17:35:40 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe0c::624])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 90e580ff-daf2-4067-8aea-c3d93baefa92;
 Mon, 07 Dec 2020 17:35:39 +0000 (UTC)
Received: from DB6PR0501CA0033.eurprd05.prod.outlook.com (2603:10a6:4:67::19)
 by AM6PR08MB3174.eurprd08.prod.outlook.com (2603:10a6:209:45::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.19; Mon, 7 Dec
 2020 17:35:37 +0000
Received: from DB5EUR03FT020.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:67:cafe::ee) by DB6PR0501CA0033.outlook.office365.com
 (2603:10a6:4:67::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend
 Transport; Mon, 7 Dec 2020 17:35:37 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT020.mail.protection.outlook.com (10.152.20.134) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.17 via Frontend Transport; Mon, 7 Dec 2020 17:35:36 +0000
Received: ("Tessian outbound fc5cc0046d61:v71");
 Mon, 07 Dec 2020 17:35:36 +0000
Received: from acb1dfc3750f.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3E0E9D14-DB2C-42E6-86DB-B541866D81A2.1; 
 Mon, 07 Dec 2020 17:35:21 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id acb1dfc3750f.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 07 Dec 2020 17:35:21 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DBBPR08MB6075.eurprd08.prod.outlook.com (2603:10a6:10:207::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.18; Mon, 7 Dec
 2020 17:35:20 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::98c7:4612:2365:cc6b]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::98c7:4612:2365:cc6b%5]) with mapi id 15.20.3632.023; Mon, 7 Dec 2020
 17:35:20 +0000
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
X-Inumbo-ID: 90e580ff-daf2-4067-8aea-c3d93baefa92
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ryUw8W+AuaX954A3E44HR98N9ygf8VNE0rvlGCFDbsw=;
 b=LfFToD/0Kbp/pRv517YAzvJyljI2EQvSr4hgxPRPjmPhLmOpiIfDcqXlsonkh4QyDBtLnRLZYN4x3vwsaPdmlgs+vGKOOHfaZpHelVaMHv7uqY1j4m+hRb+A1JLeZa+BwmvKxLjTA3MD1epYhT8Kq0fTUW5HFFS4QTW+xyBKvX4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5e83f94dd51b0ad5
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mK6bDMwlT0QhWZ9RPBi+LqGYi6f8TxwjO0gkwiJdgQocLpCAM8kgWDfURPTZfEIaidrQv0ZwOXD15wh6iV3ZXsdzC44H5+EvAKk+wwNgh2AD81zCSuC4YeCmBprL85IE83oEjgqfIGEhh9WlR6KP+OotdNr21LscsspSh/ni1tGMxvYio35j/H+ZpBUgw6y7VJcBu59cRsGySsPDdjbtFDXFBA+y0qVMqTUxdF+ERTBqkZtxE/hBepRm+EeSKaLrm4s+p/cON3NvrzV1/B90+yh7AQNy2hx3KucxAT8QEsNzBffN1g/fDageAT6njPYnSy1WJwwzTCHbAB/duvBQqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ryUw8W+AuaX954A3E44HR98N9ygf8VNE0rvlGCFDbsw=;
 b=nVDbf7MunJPRtdH9krxwSs5nwhZO4YjIfIVv8JU/frw9iZDUljIBcCJ9ffELbPOn1by+uOcUqH+EF1+gmVw+qzaCE7mKGlWi9m1QtscyGB0uGfVXkW7SODYNNtEgik1uXnikXvgphrISbeLc5Osucv0WoR7z+Of905L1KS70DizwEk4jVLLK9vBW+hEXJJANa7287etknqejxR6YNa+l8gQARrx9Tj197bTmsitCeXYVIlvjytNm+Rue8V3ZIY1MHMRQkQrcJjBJZ0YGOgZN1APs4t4kWnmSmjaHgA66Fc3NUxpvYg/iip4S8ke4qPTmIpIHf8RDrcUa0n4JvHRgkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ryUw8W+AuaX954A3E44HR98N9ygf8VNE0rvlGCFDbsw=;
 b=LfFToD/0Kbp/pRv517YAzvJyljI2EQvSr4hgxPRPjmPhLmOpiIfDcqXlsonkh4QyDBtLnRLZYN4x3vwsaPdmlgs+vGKOOHfaZpHelVaMHv7uqY1j4m+hRb+A1JLeZa+BwmvKxLjTA3MD1epYhT8Kq0fTUW5HFFS4QTW+xyBKvX4=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 1/7] xen/arm: Add ID registers and complete cpufinfo
Thread-Topic: [PATCH v2 1/7] xen/arm: Add ID registers and complete cpufinfo
Thread-Index: AQHWxyRhg3JcFq2vMUqckLksQKUHEKnnotSAgARNjYA=
Date: Mon, 7 Dec 2020 17:35:20 +0000
Message-ID: <06C2A7AB-A28D-4BF0-9837-A15BD2759C1B@arm.com>
References: <cover.1606742184.git.bertrand.marquis@arm.com>
 <97efd89cccdffc2a7fd987ac8156f5eea191fd3f.1606742184.git.bertrand.marquis@arm.com>
 <alpine.DEB.2.21.2012041546340.32240@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2012041546340.32240@sstabellini-ThinkPad-T480s>
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
X-MS-Office365-Filtering-Correlation-Id: d77406fc-339a-4031-7e79-08d89ad68219
x-ms-traffictypediagnostic: DBBPR08MB6075:|AM6PR08MB3174:
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB317478CBE4362894B413323A9DCE0@AM6PR08MB3174.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 EQ5Lbk62JpqDPxslogjTWUQr021DLfyjmP44QCmQwrYvUEGwaItdT/i4tmS6zG8cdQt1ckx6W+ntBSU2jBf3Z/gSU6bjAbr88kV3AGaUCtzziUop07mBvSQ6TqG2Io6/qrvfWaVvQUX1gbbGYHb3KRzDjNVveQY3kc7oA2C1thFCAHrkZimqXMpADKg3nnEiRfQO4MTTFrx3O3ge2KIdQvASe4L/s8qBjCM1nVBdAW6fzFhV7VkwqlyHPQZQKQNtoQbUuCkTy7TeaC7NgVKoo0rd4f1UK0QygO1z3kPAd5lTMJgX4v0qphISjVkNarl1/BihZGpwPIv8NIgQ/PfNdkhho39Y5R8J9Qiz6x+W2lPBkvFaSzkMkL/eUtp1ztyq
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(136003)(366004)(376002)(396003)(346002)(71200400001)(6512007)(8936002)(26005)(66446008)(53546011)(91956017)(36756003)(66476007)(186003)(6506007)(2616005)(4326008)(66556008)(6486002)(76116006)(66946007)(30864003)(64756008)(316002)(83380400001)(8676002)(478600001)(5660300002)(6916009)(2906002)(86362001)(33656002)(54906003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?6KIbhRoos9XsUa0cyTefutihur4n5h1V29Qe3M1JPXrUwlQYqaBHbi6PDJob?=
 =?us-ascii?Q?52CzqN//GYQRpfikpHlX8czLjXSnFKE8xUGwxRPVrdbloP9aJJQuyQpn/luF?=
 =?us-ascii?Q?uFwnZk4nVj5nqcJpaqhLjbcUsJTeXSOOLEivOwyVeDx2b/brvCfsT7HX8Sw0?=
 =?us-ascii?Q?RxcUHCds9SNj2Dyvj4vLrqrkLIsjcVaEdKgqbK/ZV+/c9xPozxblQYlljcNS?=
 =?us-ascii?Q?SoLg8IbpHW+7x5+We+AIId2i95xx41bAOODugF9TI1DAPp12miI3QrEAG09B?=
 =?us-ascii?Q?Lhg3Bw6GDlyXvFSlhm5oyY94r6EYtLsTFAhcK4lVVrF3TD/xhvtBg9Gfll5h?=
 =?us-ascii?Q?sw7I0bWhnINncxN5uGkASjm2mYP+L5CTfWXWRAsmz/5np8TqtApA8P6sCR/y?=
 =?us-ascii?Q?O9Fe+eHzcCWJzg3CWwBKoC9qJGyX/XUw6VLK3gHc4Ul5Qef7WgEELOjZzgq+?=
 =?us-ascii?Q?QUZmffRP993R5wr8MoWricjNzGxMhTt5VvcIrwZw1DPzSL+V1vY4um4H/0Bq?=
 =?us-ascii?Q?XcHly2oV1mWZkWu/YV1nDe67w71u3Gey2WX5jmocdDn5KcwqhpobTkAz5eI1?=
 =?us-ascii?Q?lQECM8jD+6ANq2/j1BX4RE117gz34nSTJP0gcuyewBrAx4A1wiyiofypmHD5?=
 =?us-ascii?Q?XkxZOxKpmGmc6mmxSuK2OFdH2LqQjmsKYS97tQLb5jkI1bqXldxOJf1oqQ9D?=
 =?us-ascii?Q?9sZNQvbtCQ1MmbIqLeGQHkjjd7VQvJVlVy0hvTz4jVrSQFM9GhAy2qPiksV0?=
 =?us-ascii?Q?HarAqrfUGYK4XXbPjetCW1cuZtKklHy5b1+yzV6F/Z6UtcKEuiHJ7lGZvpbs?=
 =?us-ascii?Q?R1AeACOzTA0hrgcFkIHzD8WUZFJONQM7nVBIy56pV6BpRxpTxKH9o8id7DSj?=
 =?us-ascii?Q?KdrYDiimE6vigLlAGEkjZnFs0nd9rSqh3AGB8CgI55mTeeobQTcH62Nt3VW4?=
 =?us-ascii?Q?K/JA4GqtR3BIyXk6Q4TKh7gT118cCoBlqe2fDJMBxo+zn9Cq4g7O8M7KRhuA?=
 =?us-ascii?Q?2DM+?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <0F75C1D391BB43449FD2335535FEF9AB@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6075
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	1926bb22-1d6d-48d8-8537-08d89ad67813
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0+ej5TD0qCL69wGyphK+V0DjNadKrCiytqtnQi1JLLWISr3id4bzbmIX7b0b6xg5bajGBZWj9IUV+BccPryQZnp9Ehf+UQD8owJcf2g69PIqYV+dsu/G/I3droezrGpf5d8jxvRYBmLfKstwSETATbbwF9f7vfp9wF4PIn4KRlQTox5/Z+bupXbH54oIGhV1vD/m9YZrfMIjcpsdYkXCkcHry55LYPwSHWgj3zdQ+NWKEy8rfEfGrQsnGC5MsrphEpIWsiC86Cj3MKNj19kyULMspxaUxLV2b4F/NBVmmGvr5i/Mhrqe4MzEycd9iHWWNt9PVj+YHVn+g0zvGHqRx9ZFcN4F+sr8LAvR+LDLsrXI9wgnSLOOphSY8bnLXdVpfAlodppJ1DQZP3j/jvzNmg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(396003)(346002)(39860400002)(376002)(46966005)(30864003)(81166007)(70206006)(6512007)(33656002)(47076004)(6862004)(6486002)(107886003)(6506007)(316002)(26005)(82740400003)(82310400003)(36756003)(8936002)(70586007)(478600001)(2906002)(53546011)(54906003)(186003)(8676002)(83380400001)(4326008)(356005)(336012)(5660300002)(86362001)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2020 17:35:36.9182
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d77406fc-339a-4031-7e79-08d89ad68219
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3174

Hi Stefano,

> On 4 Dec 2020, at 23:52, Stefano Stabellini <sstabellini@kernel.org> wrot=
e:
>=20
> There is a typo in the subject line

I will fix that in the v3.

>=20
>=20
> On Mon, 30 Nov 2020, Bertrand Marquis wrote:
>> Add definition and entries in cpuinfo for ID registers introduced in
>> newer Arm Architecture reference manual:
>> - ID_PFR2: processor feature register 2
>> - ID_DFR1: debug feature register 1
>> - ID_MMFR4 and ID_MMFR5: Memory model feature registers 4 and 5
>> - ID_ISA6: ISA Feature register 6
>> Add more bitfield definitions in PFR fields of cpuinfo.
>> Add MVFR2 register definition for aarch32.
>> Add mvfr values in cpuinfo.
>> Add some registers definition for arm64 in sysregs as some are not
>> always know by compilers.
>> Initialize the new values added in cpuinfo in identify_cpu during init.
>>=20
>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>=20
> I realize I am using an old compiler but I am getting a build error:
>=20
> /local/repos/gcc-linaro-5.3.1-2016.05-x86_64_aarch64-linux-gnu/bin/aarch6=
4-linux-gnu-gcc -MMD -MP -MF ./.cpufeature.o.d  -DBUILD_ID -fno-strict-alia=
sing -std=3Dgnu99 -Wall -Wstrict-prototypes -Wdeclaration-after-statement -=
Wno-unused-but-set-variable -Wno-unused-local-typedefs   -O1 -fno-omit-fram=
e-pointer -nostdinc -fno-builtin -fno-common -Werror -Wredundant-decls -Wno=
-pointer-arith -Wvla -pipe -D__XEN__ -include /local/repos/xen-upstream/xen=
/include/xen/config.h -Wa,--strip-local-absolute -g -mcpu=3Dgeneric -mgener=
al-regs-only   -I/local/repos/xen-upstream/xen/include -fno-stack-protector=
 -fno-exceptions -fno-asynchronous-unwind-tables -Wnested-externs '-D__OBJE=
CT_FILE__=3D"cpufeature.o"'  -c cpufeature.c -o cpufeature.o
> {standard input}: Assembler messages:
> {standard input}:634: Error: unknown or missing system register name at o=
perand 2 -- `mrs x1,ID_MMFR4_EL1'
>=20
> If I remove the line:
>=20
>  c->mm32.bits[4]  =3D READ_SYSREG32(ID_MMFR4_EL1);

I will add MMFR4 definition if it is not defined by the compiler in v3.

Cheers
Bertrand


>=20
>=20
> it builds just fine
>=20
>=20
>=20
>> ---
>> Changes in V2:
>>  Fix dbg32 table size and add proper initialisation of the second entry
>>  of the table by reading ID_DFR1 register.
>> ---
>> xen/arch/arm/cpufeature.c           | 17 ++++++++
>> xen/include/asm-arm/arm64/sysregs.h | 25 ++++++++++++
>> xen/include/asm-arm/cpregs.h        | 11 +++++
>> xen/include/asm-arm/cpufeature.h    | 63 ++++++++++++++++++++++++-----
>> 4 files changed, 107 insertions(+), 9 deletions(-)
>>=20
>> diff --git a/xen/arch/arm/cpufeature.c b/xen/arch/arm/cpufeature.c
>> index 44126dbf07..204be9b084 100644
>> --- a/xen/arch/arm/cpufeature.c
>> +++ b/xen/arch/arm/cpufeature.c
>> @@ -114,15 +114,20 @@ void identify_cpu(struct cpuinfo_arm *c)
>>=20
>>         c->mm64.bits[0]  =3D READ_SYSREG64(ID_AA64MMFR0_EL1);
>>         c->mm64.bits[1]  =3D READ_SYSREG64(ID_AA64MMFR1_EL1);
>> +        c->mm64.bits[2]  =3D READ_SYSREG64(ID_AA64MMFR2_EL1);
>>=20
>>         c->isa64.bits[0] =3D READ_SYSREG64(ID_AA64ISAR0_EL1);
>>         c->isa64.bits[1] =3D READ_SYSREG64(ID_AA64ISAR1_EL1);
>> +
>> +        c->zfr64.bits[0] =3D READ_SYSREG64(ID_AA64ZFR0_EL1);
>> #endif
>>=20
>>         c->pfr32.bits[0] =3D READ_SYSREG32(ID_PFR0_EL1);
>>         c->pfr32.bits[1] =3D READ_SYSREG32(ID_PFR1_EL1);
>> +        c->pfr32.bits[2] =3D READ_SYSREG32(ID_PFR2_EL1);
>>=20
>>         c->dbg32.bits[0] =3D READ_SYSREG32(ID_DFR0_EL1);
>> +        c->dbg32.bits[1] =3D READ_SYSREG32(ID_DFR1_EL1);
>>=20
>>         c->aux32.bits[0] =3D READ_SYSREG32(ID_AFR0_EL1);
>>=20
>> @@ -130,6 +135,8 @@ void identify_cpu(struct cpuinfo_arm *c)
>>         c->mm32.bits[1]  =3D READ_SYSREG32(ID_MMFR1_EL1);
>>         c->mm32.bits[2]  =3D READ_SYSREG32(ID_MMFR2_EL1);
>>         c->mm32.bits[3]  =3D READ_SYSREG32(ID_MMFR3_EL1);
>> +        c->mm32.bits[4]  =3D READ_SYSREG32(ID_MMFR4_EL1);
>> +        c->mm32.bits[5]  =3D READ_SYSREG32(ID_MMFR5_EL1);
>>=20
>>         c->isa32.bits[0] =3D READ_SYSREG32(ID_ISAR0_EL1);
>>         c->isa32.bits[1] =3D READ_SYSREG32(ID_ISAR1_EL1);
>> @@ -137,6 +144,16 @@ void identify_cpu(struct cpuinfo_arm *c)
>>         c->isa32.bits[3] =3D READ_SYSREG32(ID_ISAR3_EL1);
>>         c->isa32.bits[4] =3D READ_SYSREG32(ID_ISAR4_EL1);
>>         c->isa32.bits[5] =3D READ_SYSREG32(ID_ISAR5_EL1);
>> +        c->isa32.bits[6] =3D READ_SYSREG32(ID_ISAR6_EL1);
>> +
>> +#ifdef CONFIG_ARM_64
>> +        c->mvfr.bits[0] =3D READ_SYSREG64(MVFR0_EL1);
>> +        c->mvfr.bits[1] =3D READ_SYSREG64(MVFR1_EL1);
>> +        c->mvfr.bits[2] =3D READ_SYSREG64(MVFR2_EL1);
>> +#else
>> +        c->mvfr.bits[0] =3D READ_CP32(MVFR0);
>> +        c->mvfr.bits[1] =3D READ_CP32(MVFR1);
>> +#endif
>> }
>>=20
>> /*
>> diff --git a/xen/include/asm-arm/arm64/sysregs.h b/xen/include/asm-arm/a=
rm64/sysregs.h
>> index c60029d38f..5abbeda3fd 100644
>> --- a/xen/include/asm-arm/arm64/sysregs.h
>> +++ b/xen/include/asm-arm/arm64/sysregs.h
>> @@ -57,6 +57,31 @@
>> #define ICH_AP1R2_EL2             __AP1Rx_EL2(2)
>> #define ICH_AP1R3_EL2             __AP1Rx_EL2(3)
>>=20
>> +/*
>> + * Define ID coprocessor registers if they are not
>> + * already defined by the compiler.
>> + *
>> + * Values picked from linux kernel
>> + */
>> +#ifndef ID_AA64MMFR2_EL1
>> +#define ID_AA64MMFR2_EL1            S3_0_C0_C7_2
>> +#endif
>> +#ifndef ID_PFR2_EL1
>> +#define ID_PFR2_EL1                 S3_0_C0_C3_4
>> +#endif
>> +#ifndef ID_MMFR5_EL1
>> +#define ID_MMFR5_EL1                S3_0_C0_C3_6
>> +#endif
>> +#ifndef ID_ISAR6_EL1
>> +#define ID_ISAR6_EL1                S3_0_C0_C2_7
>> +#endif
>> +#ifndef ID_AA64ZFR0_EL1
>> +#define ID_AA64ZFR0_EL1             S3_0_C0_C4_4
>> +#endif
>> +#ifndef ID_DFR1_EL1
>> +#define ID_DFR1_EL1                 S3_0_C0_C3_5
>> +#endif
>> +
>> /* Access to system registers */
>>=20
>> #define READ_SYSREG32(name) ((uint32_t)READ_SYSREG64(name))
>> diff --git a/xen/include/asm-arm/cpregs.h b/xen/include/asm-arm/cpregs.h
>> index 8fd344146e..58be898891 100644
>> --- a/xen/include/asm-arm/cpregs.h
>> +++ b/xen/include/asm-arm/cpregs.h
>> @@ -63,6 +63,7 @@
>> #define FPSID           p10,7,c0,c0,0   /* Floating-Point System ID Regi=
ster */
>> #define FPSCR           p10,7,c1,c0,0   /* Floating-Point Status and Con=
trol Register */
>> #define MVFR0           p10,7,c7,c0,0   /* Media and VFP Feature Registe=
r 0 */
>> +#define MVFR1           p10,7,c6,c0,0   /* Media and VFP Feature Regist=
er 1 */
>> #define FPEXC           p10,7,c8,c0,0   /* Floating-Point Exception Cont=
rol Register */
>> #define FPINST          p10,7,c9,c0,0   /* Floating-Point Instruction Re=
gister */
>> #define FPINST2         p10,7,c10,c0,0  /* Floating-point Instruction Re=
gister 2 */
>> @@ -108,18 +109,23 @@
>> #define MPIDR           p15,0,c0,c0,5   /* Multiprocessor Affinity Regis=
ter */
>> #define ID_PFR0         p15,0,c0,c1,0   /* Processor Feature Register 0 =
*/
>> #define ID_PFR1         p15,0,c0,c1,1   /* Processor Feature Register 1 =
*/
>> +#define ID_PFR2         p15,0,c0,c3,4   /* Processor Feature Register 2=
 */
>> #define ID_DFR0         p15,0,c0,c1,2   /* Debug Feature Register 0 */
>> +#define ID_DFR1         p15,0,c0,c3,5   /* Debug Feature Register 1 */
>> #define ID_AFR0         p15,0,c0,c1,3   /* Auxiliary Feature Register 0 =
*/
>> #define ID_MMFR0        p15,0,c0,c1,4   /* Memory Model Feature Register=
 0 */
>> #define ID_MMFR1        p15,0,c0,c1,5   /* Memory Model Feature Register=
 1 */
>> #define ID_MMFR2        p15,0,c0,c1,6   /* Memory Model Feature Register=
 2 */
>> #define ID_MMFR3        p15,0,c0,c1,7   /* Memory Model Feature Register=
 3 */
>> +#define ID_MMFR4        p15,0,c0,c2,6   /* Memory Model Feature Registe=
r 4 */
>> +#define ID_MMFR5        p15,0,c0,c3,6   /* Memory Model Feature Registe=
r 5 */
>> #define ID_ISAR0        p15,0,c0,c2,0   /* ISA Feature Register 0 */
>> #define ID_ISAR1        p15,0,c0,c2,1   /* ISA Feature Register 1 */
>> #define ID_ISAR2        p15,0,c0,c2,2   /* ISA Feature Register 2 */
>> #define ID_ISAR3        p15,0,c0,c2,3   /* ISA Feature Register 3 */
>> #define ID_ISAR4        p15,0,c0,c2,4   /* ISA Feature Register 4 */
>> #define ID_ISAR5        p15,0,c0,c2,5   /* ISA Feature Register 5 */
>> +#define ID_ISAR6        p15,0,c0,c2,7   /* ISA Feature Register 6 */
>> #define CCSIDR          p15,1,c0,c0,0   /* Cache Size ID Registers */
>> #define CLIDR           p15,1,c0,c0,1   /* Cache Level ID Register */
>> #define CSSELR          p15,2,c0,c0,0   /* Cache Size Selection Register=
 */
>> @@ -312,18 +318,23 @@
>> #define HSTR_EL2                HSTR
>> #define ID_AFR0_EL1             ID_AFR0
>> #define ID_DFR0_EL1             ID_DFR0
>> +#define ID_DFR1_EL1             ID_DFR1
>> #define ID_ISAR0_EL1            ID_ISAR0
>> #define ID_ISAR1_EL1            ID_ISAR1
>> #define ID_ISAR2_EL1            ID_ISAR2
>> #define ID_ISAR3_EL1            ID_ISAR3
>> #define ID_ISAR4_EL1            ID_ISAR4
>> #define ID_ISAR5_EL1            ID_ISAR5
>> +#define ID_ISAR6_EL1            ID_ISAR6
>> #define ID_MMFR0_EL1            ID_MMFR0
>> #define ID_MMFR1_EL1            ID_MMFR1
>> #define ID_MMFR2_EL1            ID_MMFR2
>> #define ID_MMFR3_EL1            ID_MMFR3
>> +#define ID_MMFR4_EL1            ID_MMFR4
>> +#define ID_MMFR5_EL1            ID_MMFR5
>> #define ID_PFR0_EL1             ID_PFR0
>> #define ID_PFR1_EL1             ID_PFR1
>> +#define ID_PFR2_EL1             ID_PFR2
>> #define IFSR32_EL2              IFSR
>> #define MDCR_EL2                HDCR
>> #define MIDR_EL1                MIDR
>> diff --git a/xen/include/asm-arm/cpufeature.h b/xen/include/asm-arm/cpuf=
eature.h
>> index c7b5052992..64354c3f19 100644
>> --- a/xen/include/asm-arm/cpufeature.h
>> +++ b/xen/include/asm-arm/cpufeature.h
>> @@ -148,6 +148,7 @@ struct cpuinfo_arm {
>>     union {
>>         uint64_t bits[2];
>>         struct {
>> +            /* PFR0 */
>>             unsigned long el0:4;
>>             unsigned long el1:4;
>>             unsigned long el2:4;
>> @@ -155,9 +156,23 @@ struct cpuinfo_arm {
>>             unsigned long fp:4;   /* Floating Point */
>>             unsigned long simd:4; /* Advanced SIMD */
>>             unsigned long gic:4;  /* GIC support */
>> -            unsigned long __res0:28;
>> +            unsigned long ras:4;
>> +            unsigned long sve:4;
>> +            unsigned long sel2:4;
>> +            unsigned long mpam:4;
>> +            unsigned long amu:4;
>> +            unsigned long dit:4;
>> +            unsigned long __res0:4;
>>             unsigned long csv2:4;
>> -            unsigned long __res1:4;
>> +            unsigned long cvs3:4;
>> +
>> +            /* PFR1 */
>> +            unsigned long bt:4;
>> +            unsigned long ssbs:4;
>> +            unsigned long mte:4;
>> +            unsigned long ras_frac:4;
>> +            unsigned long mpam_frac:4;
>> +            unsigned long __res1:44;
>>         };
>>     } pfr64;
>>=20
>> @@ -170,7 +185,7 @@ struct cpuinfo_arm {
>>     } aux64;
>>=20
>>     union {
>> -        uint64_t bits[2];
>> +        uint64_t bits[3];
>>         struct {
>>             unsigned long pa_range:4;
>>             unsigned long asid_bits:4;
>> @@ -190,6 +205,8 @@ struct cpuinfo_arm {
>>             unsigned long pan:4;
>>             unsigned long __res1:8;
>>             unsigned long __res2:32;
>> +
>> +            unsigned long __res3:64;
>>         };
>>     } mm64;
>>=20
>> @@ -197,6 +214,10 @@ struct cpuinfo_arm {
>>         uint64_t bits[2];
>>     } isa64;
>>=20
>> +    struct {
>> +        uint64_t bits[1];
>> +    } zfr64;
>> +
>> #endif
>>=20
>>     /*
>> @@ -204,25 +225,38 @@ struct cpuinfo_arm {
>>      * when running in 32-bit mode.
>>      */
>>     union {
>> -        uint32_t bits[2];
>> +        uint32_t bits[3];
>>         struct {
>> +            /* PFR0 */
>>             unsigned long arm:4;
>>             unsigned long thumb:4;
>>             unsigned long jazelle:4;
>>             unsigned long thumbee:4;
>> -            unsigned long __res0:16;
>> +            unsigned long csv2:4;
>> +            unsigned long amu:4;
>> +            unsigned long dit:4;
>> +            unsigned long ras:4;
>>=20
>> +            /* PFR1 */
>>             unsigned long progmodel:4;
>>             unsigned long security:4;
>>             unsigned long mprofile:4;
>>             unsigned long virt:4;
>>             unsigned long gentimer:4;
>> -            unsigned long __res1:12;
>> +            unsigned long sec_frac:4;
>> +            unsigned long virt_frac:4;
>> +            unsigned long gic:4;
>> +
>> +            /* PFR2 */
>> +            unsigned long csv3:4;
>> +            unsigned long ssbs:4;
>> +            unsigned long ras_frac:4;
>> +            unsigned long __res2:20;
>>         };
>>     } pfr32;
>>=20
>>     struct {
>> -        uint32_t bits[1];
>> +        uint32_t bits[2];
>>     } dbg32;
>>=20
>>     struct {
>> @@ -230,12 +264,23 @@ struct cpuinfo_arm {
>>     } aux32;
>>=20
>>     struct {
>> -        uint32_t bits[4];
>> +        uint32_t bits[6];
>>     } mm32;
>>=20
>>     struct {
>> -        uint32_t bits[6];
>> +        uint32_t bits[7];
>>     } isa32;
>> +
>> +#ifdef CONFIG_ARM_64
>> +    struct {
>> +        uint64_t bits[3];
>> +    } mvfr;
>> +#else
>> +    /* Only MVFR0 and MVFR1 exist on armv7 */
>> +    struct {
>> +        uint32_t bits[2];
>> +    } mvfr;
>> +#endif
>> };
>>=20
>> extern struct cpuinfo_arm boot_cpu_data;
>> --=20
>> 2.17.1


