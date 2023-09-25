Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B14C87AD1A7
	for <lists+xen-devel@lfdr.de>; Mon, 25 Sep 2023 09:27:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.607664.945945 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qkg02-0007h2-TS; Mon, 25 Sep 2023 07:27:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 607664.945945; Mon, 25 Sep 2023 07:27:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qkg02-0007eT-PT; Mon, 25 Sep 2023 07:27:22 +0000
Received: by outflank-mailman (input) for mailman id 607664;
 Mon, 25 Sep 2023 07:27:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LToL=FJ=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qkg01-0007eN-Ai
 for xen-devel@lists.xenproject.org; Mon, 25 Sep 2023 07:27:21 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0604.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::604])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f640b439-5b74-11ee-878a-cb3800f73035;
 Mon, 25 Sep 2023 09:27:20 +0200 (CEST)
Received: from DUZPR01CA0352.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b8::15) by PAXPR08MB6431.eurprd08.prod.outlook.com
 (2603:10a6:102:157::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Mon, 25 Sep
 2023 07:27:18 +0000
Received: from DBAEUR03FT062.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:4b8:cafe::d3) by DUZPR01CA0352.outlook.office365.com
 (2603:10a6:10:4b8::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.35 via Frontend
 Transport; Mon, 25 Sep 2023 07:27:17 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT062.mail.protection.outlook.com (100.127.142.64) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.19 via Frontend Transport; Mon, 25 Sep 2023 07:27:17 +0000
Received: ("Tessian outbound 169aaa6bf2b7:v175");
 Mon, 25 Sep 2023 07:27:17 +0000
Received: from d51afce9298d.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B2409C2C-06E6-4F8D-9F67-D165FECD288D.1; 
 Mon, 25 Sep 2023 07:27:05 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d51afce9298d.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 25 Sep 2023 07:27:05 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DU2PR08MB10015.eurprd08.prod.outlook.com (2603:10a6:10:49f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Mon, 25 Sep
 2023 07:27:04 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::dfff:49d6:ed04:118b]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::dfff:49d6:ed04:118b%6]) with mapi id 15.20.6813.027; Mon, 25 Sep 2023
 07:27:03 +0000
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
X-Inumbo-ID: f640b439-5b74-11ee-878a-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0+Bw2Ci4eNWkfjov4TwYQtPmfdPrIQJH85vhAGsIFhQ=;
 b=XApxgD96WGx3KP1A8wq1bewKpm9qzH4KhQXqrsbVrscci/zmDdeeUoozxnG64HuM7ntBdRwH8+nSy3xtqdkrlmS/4rg444kacBlXBDbp3WGQjzBDPKwrjtgoFIMXo95QvBElm+6ZrCuugY821yNtafPG5tbC42Bte/99op4li8w=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 311f964ca14aa111
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V2NfFvD2TwGkXtg7ZcKhs2UeCC3fQDvaH9Ur4Rw8drE8gZV4aOrsg9/8saN1MZ2NbYe0wmFj3dkZcadManrzaLfMDmwappIbBvp6sssBv07Vh4hu52Ua1TtZ8wbL6QZ1k5QiLqgiTWciHZSYI4V9MxjnwyeW3t5q4jvoOvy/aO5b5FHEt7QRKQCxL7rw2Qqg590wlM/lWcyMgtwH7VZzER7yjBCenKPq4wLZY9sWO1Xb2okolHUguKOrddLRbGuBH/OfWfRQgIUoDHG60Qa/LhI9YN3og193ismWKl4xC3AXsi8pccR31dtSgRTJE93uR/qXuhwnWCqBU9adH9zCaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0+Bw2Ci4eNWkfjov4TwYQtPmfdPrIQJH85vhAGsIFhQ=;
 b=P9HKpKu+RVLoE/6nf6nQ/vpfAp+Am96Kun/hXAAsiw67m5+k5nRRwGAx58Mg4sU1N0BUmG4DcuHd7Lrz7E0M9x3qUj2K6soeOrj+Ocp1nSidiqK94FmW51DIXYnSmM/Mkl2jvsEjan4HWTBLfcN+jVqeJoiVJwpw5/W/upGkbuCIMwtFO+/n30T3cbO/Tdv2stBKh2NScCDL9WhiOWBIE/UHFFhCJQU3js3XMpuFX8Dtj4a+DTft38AHzEgcS5cO9RAz+ukE7gZAeRTOLbr1YaOvz2skdHr+1lnYD/uhvxAzTgNYbYnEfNFRTFsie8NTvcEEVicCExcCVx67SUrPFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0+Bw2Ci4eNWkfjov4TwYQtPmfdPrIQJH85vhAGsIFhQ=;
 b=XApxgD96WGx3KP1A8wq1bewKpm9qzH4KhQXqrsbVrscci/zmDdeeUoozxnG64HuM7ntBdRwH8+nSy3xtqdkrlmS/4rg444kacBlXBDbp3WGQjzBDPKwrjtgoFIMXo95QvBElm+6ZrCuugY821yNtafPG5tbC42Bte/99op4li8w=
From: Henry Wang <Henry.Wang@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, "jgross@suse.com" <jgross@suse.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Anthony PERARD
	<anthony.perard@citrix.com>, "community.manager@xenproject.org"
	<community.manager@xenproject.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: Xen 4.18 release: Reminder about code freeze
Thread-Topic: Xen 4.18 release: Reminder about code freeze
Thread-Index: AQHZ705Dwyrpd4I60kahQfZlaJ2JtLArJCcAgAAAjIA=
Date: Mon, 25 Sep 2023 07:27:03 +0000
Message-ID: <7DCCBB43-0396-4C61-9D7B-8022707775F7@arm.com>
References:
 <AS8PR08MB7991D1099E32CC9F03B0E0F692FCA@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <a582759b-c967-44cc-ec6c-7d9104bad4a5@suse.com>
In-Reply-To: <a582759b-c967-44cc-ec6c-7d9104bad4a5@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DU2PR08MB10015:EE_|DBAEUR03FT062:EE_|PAXPR08MB6431:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fbfa83c-9a0b-49db-60e2-08dbbd98d92d
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 b8qEXk3yLDspCnygJhaB64ljTRjTD64uE03B8xqdQWqcJCLWd+am5gPpQdKtGFTXexIBzlXP8LPfIix5FeDnPi2KZhNtZZpJb7jsP5fAbHVxRqTBKBi7yM6ILo9BAYpCWwqNFoNXJnVTsoElOnpPfK0xB1URx8wi5yTbXMafKVcVY9GZuFRKXfdYtYm3bVprnUoiE/KBI1Cy12GD7TuKer1sS4YzKHmztkcAmEgYjk1EuN2s0c3n2jIwh/R3xqWrnLFaegr23/oYyTTO5vvL1CYRBF3W62/rZX6E4Y29nnNK5k2j1ibXfxbslwvnG1iMG6RljltNqiRUo0iEo8cVsCr+9dKclUn87N/cSp8uC63U4frQnuepSM8zY0JZcHpMq6bvNvenN+ctnnGBwiUQvbGK1q1uZF//NsgSmcX5zaekmK+JNtuHrSE2GfzD4lFO+QBMdRB0wis0Ob17+Z71NrNRJauy6nfOztGL5hVjFeiq/Hw0JaDOecnHjcdV798r6cjUGFkqD/oRjAyrxHlHffpQIOK0cb7WRA8LKEITBmw5k3FpanO+zeBjMgyyR2IiuMpAza7cDbT1l3k1nYM1sNIvNY882uENz9lzx2Bu1jtZ90EJhgX9g7HEjRHI7cM8bNIzn64SmxyUabH8CYh7jpTGQeXx1sTl6GX6a9KJDUk=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(346002)(366004)(396003)(39850400004)(230922051799003)(451199024)(186009)(1800799009)(54906003)(316002)(41300700001)(66556008)(66476007)(66446008)(64756008)(76116006)(66946007)(6916009)(91956017)(6512007)(8936002)(8676002)(2906002)(4326008)(478600001)(71200400001)(26005)(5660300002)(6486002)(38070700005)(33656002)(6506007)(38100700002)(53546011)(83380400001)(36756003)(966005)(2616005)(86362001)(122000001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <1A196174151F014ABBFC3C60271F9268@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB10015
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	86d63ac1-d1bc-4a07-2099-08dbbd98d0d4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6z16NV3rJRS2//73Foad/3Gfq2zaXvpVvM5DRNV3faeIeQ00GFdRVMMQ+bI22vPGUz+HfGLNhsIQgGgqmTL+vA8KNzcuoZlyxog/u+OhUCHYe82k/h3FvdSGCYoDZgshuMIJ3yP+wiyQsgeqRiwxjIAjZ2uOVgl5HmF7GQt2BZCOFLbJVeVrJqKFhC9TKJdVEKG8GeEVva/r0QZw0dfnjKvMPeWP8BnOHiVkmn+/T1E7+qRpCPKO38thebbHgidHh4AUKX71m5dcAEO0hJFqCwNw+q0oitdCoOgMTA13u7SSUi2IxxV67ScZjINy3zDO6+pqO4QH0K6I2JCZht8U1UUGReKxfb+nhgzo3zs96h+cx6I9PmF1tRo56SINHHxFd/YHGKvlm2cW296wNbADIWAIHpEkyQ30hoPBFehcTmyIlKZtObgSLUARVbjow++aQZ2E1m0Ck1EMevvCitD4kgDWoRv+6II4loJO6oPiJVqCvA8KwS4eGcX9eOKiQ+zLMmeVcRyDDt9Pccny9VfZ/eOuSW2lnl/r60D5TuiUknckq9VXJNjxzgHgciMj4VvYYjSXUEqO/sKUYCBTB9Wl/GbmJDwugKonuipq4MvGe9Zi2Z+S0i81N9lU0/8VoWlp+V8CnxCWs7nGwsZiIjGaRFY7N0UmtRbSal6WZA+CAgacbhIU1lO57VD1o2lNkbGLw9ks8m6eDq8vxbhzgk16NYLQaq9jWhgZcoi/81hhCmwX3lVkfgHRgliAK8arMOb6otDNsszLMNdEcS/n5QjO3g==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(396003)(39860400002)(136003)(376002)(230922051799003)(451199024)(82310400011)(1800799009)(186009)(40470700004)(46966006)(36840700001)(316002)(41300700001)(336012)(40480700001)(26005)(2906002)(5660300002)(8676002)(478600001)(966005)(70206006)(70586007)(54906003)(6862004)(4326008)(8936002)(6486002)(6506007)(53546011)(40460700003)(6512007)(36756003)(36860700001)(47076005)(2616005)(83380400001)(81166007)(86362001)(33656002)(356005)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2023 07:27:17.9209
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fbfa83c-9a0b-49db-60e2-08dbbd98d92d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6431

Hi Jan,

> On Sep 25, 2023, at 15:24, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 25.09.2023 03:25, Henry Wang wrote:
>> Hi everyone,
>>=20
>> This is the reminder that we are currently in code freeze. The hard code
>> freeze date will be in two weeks, i.e. Fri Oct 6, 2023.
>>=20
>> The planned date for 4.18 rc1 is this Friday, i.e. Sep 29, 2023.
>>=20
>> Also, below is the (updated) critical items on my list for 4.18 release:
>> 1. [PATCH 0/7] tools: More Python 3 fixes (part 1 of N)
>> https://gitlab.com/xen-project/xen/-/issues/114
>>=20
>> 2. tools: Switch to non-truncating XENVER_* ops
>> https://lore.kernel.org/xen-devel/20230117135336.11662-1-andrew.cooper3@=
citrix.com/
>>=20
>> 3. dom0less vs xenstored setup race Was: xen | Failed pipeline for stagi=
ng | 6a47ba2f
>> https://marc.info/?l=3Dxen-devel&m=3D168312468808977
>> https://marc.info/?l=3Dxen-devel&m=3D168312687610283
>>=20
>> 4. [PATCH v2 0/8] Fixes to debugging facilities
>> https://lore.kernel.org/xen-devel/21cc28b9-91d1-1e6e-23ac-00c44f3ec08e@g=
mail.com/
>=20
> May I ask that at least "x86: support data operand independent timing mod=
e"
> also be put on this list? There were other x86 items we wanted in 4.18, b=
ut
> I think they have been put on hold now for too long to still be reasonabl=
e
> to expect to make it.

I am ok with that as long as there is no other objections from other x86 ma=
intainers,
I will add this to my list.

Kind regards,
Henry


>=20
> Jan


