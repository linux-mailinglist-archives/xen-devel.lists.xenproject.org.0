Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 883056440D7
	for <lists+xen-devel@lfdr.de>; Tue,  6 Dec 2022 10:55:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.454567.712077 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2Uf3-00052D-6Z; Tue, 06 Dec 2022 09:54:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 454567.712077; Tue, 06 Dec 2022 09:54:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2Uf3-0004zk-24; Tue, 06 Dec 2022 09:54:49 +0000
Received: by outflank-mailman (input) for mailman id 454567;
 Tue, 06 Dec 2022 09:54:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZfYr=4E=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1p2Uf0-0004w5-Ru
 for xen-devel@lists.xenproject.org; Tue, 06 Dec 2022 09:54:47 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20631.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0062be2c-754c-11ed-91b6-6bf2151ebd3b;
 Tue, 06 Dec 2022 10:54:43 +0100 (CET)
Received: from FR0P281CA0141.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:96::12)
 by PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.13; Tue, 6 Dec
 2022 09:54:38 +0000
Received: from VI1EUR03FT048.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:96:cafe::2b) by FR0P281CA0141.outlook.office365.com
 (2603:10a6:d10:96::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5901.8 via Frontend
 Transport; Tue, 6 Dec 2022 09:54:38 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT048.mail.protection.outlook.com (100.127.144.182) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5880.14 via Frontend Transport; Tue, 6 Dec 2022 09:54:37 +0000
Received: ("Tessian outbound 73ab5f36653e:v130");
 Tue, 06 Dec 2022 09:54:37 +0000
Received: from 3eb40ba41ca2.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4A12B028-4EBF-44EE-8BF3-FB32EE15FD5E.1; 
 Tue, 06 Dec 2022 09:54:26 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3eb40ba41ca2.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 06 Dec 2022 09:54:26 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com (2603:10a6:20b:404::24)
 by DB9PR08MB9612.eurprd08.prod.outlook.com (2603:10a6:10:45e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Tue, 6 Dec
 2022 09:54:14 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::b45:fa8a:caad:25c0]) by AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::b45:fa8a:caad:25c0%4]) with mapi id 15.20.5880.014; Tue, 6 Dec 2022
 09:54:14 +0000
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
X-Inumbo-ID: 0062be2c-754c-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dl0xvX1OoPPektWZwP94wkxOWre4IosRu6T9p/pBDIU=;
 b=SDjsR8WGfd3vMA7PzVrP/yaLyBesyH1HBehjSmN81fh46Edkb2T6kUa2CxqIumDRYoyraWF0IRSexhFyHJIJWny/DS17k6JFsfB3XrU2/VC4/zpEDocr/M3ruau2xz6VKOHy46mriO4W7ywAWvUT1TGdFFB8U6oYb0PNf1Q7j14=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2ba2ffa26b9dd997
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F8bHqTSYh2H8YlRq4kluDH8URvQkewDpZ7Zm8RGzCyYICXzGRqP06+Qv6B7hje5zSbF9/Os+V7pGu+0K61TbrWIsPmPet9ZbOIQh338Pvkl+WNlSCsZwdfBvymWPXgj+XimejPdbCpYW/mjEyB9WwEOhmPzY0V3pQ5ElvldP9DmW+av6t8saJuT0kG8PJVNYAHqv8ZwZI0oA8LwCG0CBhULP9FLuw7U2LPjhoqpusWpowqGT883nr5qeIe+MZIm/4u4F0/I7m2mdeB8bV1wjUQW3DLpXQCItRLaMy0boSZvnVoa9FwQFD/SS40G7wxsMJpwd2/ACZQksDaaw9DzRoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dl0xvX1OoPPektWZwP94wkxOWre4IosRu6T9p/pBDIU=;
 b=XlbzyfaUARTcSY3bwP5FoNYfPgTJagYCfkv19srrw2E2D/uE0IAIZEZV1r9Au8zwUmoLgtgjiIWoROoukDA3/a6mE67nebpct5lRRkFEFWGNrdr0EXMjRLYZvBChSHb4Fikm9ZkCK+ZDvuWhltZ+y7d+iEdV6Kskk5+Sg9VRDRCbt5lUT3NmZOKLrNsrqyRRviaPqWZxfRjX2dO4XyUa69NyhD2TnhcTazJ/tQRE3plE4eUZw6G2Oxx/wsVg3xUt9hskoxBPU35hFeqIIePX1+XI6TRnuqLIv+nIzmzx7YxZ/j8Xz0w3CSOMdCNGSwQBK2eBFh0h/haX3s7zjlWCWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dl0xvX1OoPPektWZwP94wkxOWre4IosRu6T9p/pBDIU=;
 b=SDjsR8WGfd3vMA7PzVrP/yaLyBesyH1HBehjSmN81fh46Edkb2T6kUa2CxqIumDRYoyraWF0IRSexhFyHJIJWny/DS17k6JFsfB3XrU2/VC4/zpEDocr/M3ruau2xz6VKOHy46mriO4W7ywAWvUT1TGdFFB8U6oYb0PNf1Q7j14=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: Xen developer discussion <xen-devel@lists.xenproject.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Jan Beulich <jbeulich@suse.com>, Paul Durrant
	<paul@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, George
 Dunlap <george.dunlap@citrix.com>, Nick Rosbrook <rosbrookn@gmail.com>,
	Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [RFC PATCH 00/21] Add SMMUv3 Stage 1 Support for XEN guests
Thread-Topic: [RFC PATCH 00/21] Add SMMUv3 Stage 1 Support for XEN guests
Thread-Index: AQHZBZ5+Ng+vzjZ4EEiQHhlU/SEGMa5abvCAgAYxVoCAAAXUgA==
Date: Tue, 6 Dec 2022 09:54:13 +0000
Message-ID: <02001AD0-351A-4F2B-86D9-4C1912AB66FE@arm.com>
References: <cover.1669888522.git.rahul.singh@arm.com>
 <ede99a96-cbf8-f388-0484-7b176d07742e@amd.com>
 <2ea634df-bb2a-6921-a8e0-7ab73fbd3276@amd.com>
In-Reply-To: <2ea634df-bb2a-6921-a8e0-7ab73fbd3276@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7158:EE_|DB9PR08MB9612:EE_|VI1EUR03FT048:EE_|PR3PR08MB5593:EE_
X-MS-Office365-Filtering-Correlation-Id: fdffc0d6-141e-44eb-657d-08dad76fe335
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 nOIZlIrwmlQMpYs+5Ze69/s92KE5KsTXk3VVqmnQsNiV1nqsQkaxDEaSiYR+doLxMfk6YiwSqhQtLs4v/4t3o+VdlqcUaTQBQhyPO+FutfF7XUPZ+VuIZ2dSbJykIM2sKPJV8g/5DoKH4E3umdsHdNuiiIIE37dz5G23b2E1+9zJBA/UITyqqatWHImWvwR37tLvlO8m/UY927gK1WKUvdnWTmwEqsxTolt99SOPzWB8bJnQtwYJbHT+01P1A87RStTPpIGUln6vWCMNvisjOu99IBFcUmczg0we+4qTpKrCzrD3TCeX9dkJM5Lui96svPAtm/vwK7t1FDM/aPg9T6Jhq2a8t/VwxPF+FgNV8Y+1fYpuaaNBeXxevEGfpWvIEuk0KCTmGjKe/369nBUjQVdkvzxmaugdy4uKEDwNHkj7l1w7O8YMdaXeCQ9MpSSx2zIFFQQW3h295zrjwG6ziynhsIj9AqDVUVhcJLP2nxacpPCw2uz5QUUNAPxGrQpeXWHnkUiGOpo1eyAMWVhkuRLB8t7h2g+DjtkwZvOMoTsSutyIRi/2Dhx0JI/Xv78ZWHFRf/CPFjCYdVDZNpQ3Dj31ZZDsU/QyPrC4Yuld+OS1G0MPwwq2HLUwBpfQS2aMEQDzJgOGIIfR7+VWDAJthSE7IBIH+EKyJIPdea0wET3a7Z4/R0RV9Wh7IswheCZISEKXmNyTm5r74XmcEICW54nZOy0EnjObdElK+0ZqbtiREzn1Ub4QsTO82Z3k0sXB+qKN3THH7isJwHd0tCvhLj0VFGM9rG0HZi5ruqnT+IU=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7158.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(136003)(39860400002)(366004)(396003)(451199015)(478600001)(38070700005)(316002)(966005)(6486002)(5660300002)(2616005)(7416002)(45080400002)(6506007)(53546011)(2906002)(186003)(33656002)(26005)(6512007)(6916009)(36756003)(54906003)(71200400001)(86362001)(41300700001)(83380400001)(38100700002)(91956017)(8676002)(4326008)(8936002)(66946007)(66556008)(76116006)(122000001)(66446008)(64756008)(66476007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <7225EDEE6CEF8948A329A82D060BCD70@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9612
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VI1EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e0d14116-3d0c-46e2-ac0c-08dad76fd4f0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	50VXtfTGIqkS6gIaawKlzZAKRIFF89Kkicyy6QleRcUQ40bGcOzBJJaTvntANc1GljmuMxAzmjsc83NYGKgB97XqBvAeFnoG4ZgNXwGdExie+NfIeKclPfrSYP1E9YXUTxgDiqDyPIbS11iNPhsrxEXGanLltSdFZwthPyAZqo0PODU0RBQM+jjFfMDrkKE7mQJR9rR8ZNeMQetlO9MZ6jAPtA+dL+naZVu8BPg6ONO8SnfWRNtPu1+PnIKynbZwgEyV0De3odQ95xX+UkO48s/srlq+9kGTanVFrvnO+ToSt6e+mrxxg7WWgBxP1KXWZ4tVY/7+NqT9Xr+lysbx03yv/G273zlxTtrtcGc7ppBkffKz6lbbMdGT14+lL0El+iLAAmcDVohE889dB3mCPJ/+4+G02dvTK4r2CaQWZAYD6iR6G0XDsXmTVqydrN9pLpLZrjHxl/n0PHJTRunml0SZrQBIyHt99xkDDsvgvra5HLASODvUCIdvICJYCvK7H8wClJmA+T77Cwhpln/QX2yvSrrmB1mYQTgrZP67sG7A1XysBnX8BRpHto1j+QiGlwqIgnOc6qxpYtwvxqCikDXp2HuE8Q2i2/JgvduxNO6OEchTHdSAN6kPt0cxXOpinbRzwP9VWLLrH2Lou5BxoEwQBKqCXEib9lEw0ACkh6r10KcQUCQQl18vz/dtxIOIJDWtwnx8lT7JlPbu+0nHXXXP5PuAycZVZBsGBu5e+vurNqk0Fi7C7mtRHKmD3+dJ2GUNuxH5MTRQ3Plii0bdSw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(346002)(376002)(136003)(451199015)(36840700001)(46966006)(40470700004)(82310400005)(36860700001)(33656002)(54906003)(53546011)(4326008)(82740400003)(81166007)(356005)(86362001)(70206006)(8676002)(70586007)(40460700003)(41300700001)(316002)(8936002)(5660300002)(83380400001)(47076005)(336012)(186003)(2906002)(2616005)(6506007)(107886003)(40480700001)(478600001)(966005)(6486002)(45080400002)(6512007)(6862004)(26005)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2022 09:54:37.8053
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fdffc0d6-141e-44eb-657d-08dad76fe335
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VI1EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5593

Hi Michal,

> On 6 Dec 2022, at 9:33 am, Michal Orzel <michal.orzel@amd.com> wrote:
>=20
> Hi Rahul,
>=20
> On 02/12/2022 11:59, Michal Orzel wrote:
>> Hi Rahul,
>>=20
>> On 01/12/2022 17:02, Rahul Singh wrote:
>>>=20
>>>=20
>>> The SMMUv3 supports two stages of translation. Each stage of translatio=
n can be
>>> independently enabled. An incoming address is logically translated from=
 VA to
>>> IPA in stage 1, then the IPA is input to stage 2 which translates the I=
PA to
>>> the output PA.
>>>=20
>>> Stage 1 is intended to be used by a software entity to provide isolatio=
n or
>>> translation to buffers within the entity, for example DMA isolation wit=
hin an
>>> OS. Stage 2 is intended to be available in systems supporting the
>>> Virtualization Extensions and is intended to virtualize device DMA to g=
uest VM
>>> address spaces. When both stage 1 and stage 2 are enabled, the translat=
ion
>>> configuration is called nested.
>>>=20
>>> Stage 1 translation support is required to provide isolation between di=
fferent
>>> devices within OS. XEN already supports Stage 2 translation but there i=
s no
>>> support for Stage 1 translation. The goal of this work is to support St=
age 1
>>> translation for XEN guests. Stage 1 has to be configured within the gue=
st to
>>> provide isolation.
>>>=20
>>> We cannot trust the guest OS to control the SMMUv3 hardware directly as
>>> compromised guest OS can corrupt the SMMUv3 configuration and make the =
system
>>> vulnerable. The guest gets the ownership of the stage 1 page tables and=
 also
>>> owns stage 1 configuration structures. The XEN handles the root configu=
ration
>>> structure (for security reasons), including the stage 2 configuration.
>>>=20
>>> XEN will emulate the SMMUv3 hardware and exposes the virtual SMMUv3 to =
the
>>> guest. Guest can use the native SMMUv3 driver to configure the stage 1
>>> translation. When the guest configures the SMMUv3 for Stage 1, XEN will=
 trap
>>> the access and configure hardware.
>>>=20
>>> SMMUv3 Driver(Guest OS) -> Configure the Stage-1 translation ->
>>> XEN trap access -> XEN SMMUv3 driver configure the HW.
>>>=20
>>> SMMUv3 driver has to be updated to support the Stage-1 translation supp=
ort
>>> based on work done by the KVM team to support Nested Stage translation:
>>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgit=
hub.com%2Feauger%2Flinux%2Fcommits%2Fv5.11-stallv12-2stage-v14&amp;data=3D0=
5%7C01%7Cmichal.orzel%40amd.com%7Cecb9075a29974c8f5ad608dad3b5916f%7C3dd896=
1fe4884e608e11a82d994e183d%7C0%7C0%7C638055074068482160%7CUnknown%7CTWFpbGZ=
sb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3=
000%7C%7C%7C&amp;sdata=3DPdK4%2Bsps3%2FdXYJUDv3iCy%2Byaqbh1bOVb1AFzTtx1nts%=
3D&amp;reserved=3D0
>>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flwn=
.net%2FArticles%2F852299%2F&amp;data=3D05%7C01%7Cmichal.orzel%40amd.com%7Ce=
cb9075a29974c8f5ad608dad3b5916f%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%=
7C638055074068482160%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2=
luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3D5Kp7023HiA=
4Qbfi28wcPL20JyC2xLwwiyEUZcxTSCOA%3D&amp;reserved=3D0
>>>=20
>>> As the stage 1 translation is configured by XEN on behalf of the guest,
>>> translation faults encountered during the translation process need to b=
e
>>> propagated up to the guest and re-injected into the guest. When the gue=
st
>>> invalidates stage 1 related caches, invalidations must be forwarded to =
the
>>> SMMUv3 hardware.
>>>=20
>>> This patch series is sent as RFC to get the initial feedback from the
>>> community. This patch series consists of 21 patches which is a big numb=
er for
>>> the reviewer to review the patches but to understand the feature end-to=
-end we
>>> thought of sending this as a big series. Once we will get initial feedb=
ack, we
>>> will divide the series into a small number of patches for review.
>>=20
>> Due to the very limited availability of the board we have, that is equip=
ped with
>> DMA platform devices and SMMUv3 (I know that you tested PCI use case tho=
roughly),
>> I managed for now to do the testing on dom0 only.
>>=20
>> By commenting out the code in Linux responsible for setting up Xen SWIOT=
LB DMA ops, I was able
>> to successfully verify the nested SMMU working properly for DMA platform=
 devices on the
>> example of using ZDMA. Both the upstream dmatest client app as well as t=
he VFIO user space driver
>> that I wrote for ZDMA passed the test!
>>=20
>> I added some logs to verify the sync up between Linux and Xen during a V=
FIO test:
>>=20
>> LINUX: SMMUv3: Setting the STE S1 Config 0x1405c000 for SID=3D0x210
>> XEN: vSMMUv3: guest config=3DARM_SMMU_DOMAIN_NESTED
>> XEN: SMMUv3: Setting the STE S1 Config 0x1405c000 for SID=3D0x210
>>=20
>> Before transfer example:
>> src value: 0xdb71faf
>> dst value: 0
>> Waiting for transfer completion...
>> After transfer example:
>> src value: 0xdb71faf
>> dst value: 0xdb71faf
>> TEST RESULT: PASS
>>=20
>> LINUX: SMMUv3: Setting the STE S1 Config 0x12502000 for SID=3D0x210
>> XEN: vSMMUv3: guest config=3DARM_SMMU_DOMAIN_NESTED
>> XEN: SMMUv3: Setting the STE S1 Config 0x12502000 for SID=3D0x210
>=20
> I finished testing this series by also covering dom0less and xl domUs.
> Tests passed so good job!
> I do not have access to any board with more than one IOMMU so I could not=
 validate
> this behavior.
>=20

Thank you much appreciated for testing the series as it helps a lot to conf=
irm that this feature is
working as expected.

Regards,
Rahul


