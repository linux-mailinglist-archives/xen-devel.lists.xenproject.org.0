Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC027302327
	for <lists+xen-devel@lfdr.de>; Mon, 25 Jan 2021 10:14:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.73936.132885 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l3xwu-0000iE-0d; Mon, 25 Jan 2021 09:14:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 73936.132885; Mon, 25 Jan 2021 09:14:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l3xwt-0000hp-TA; Mon, 25 Jan 2021 09:14:15 +0000
Received: by outflank-mailman (input) for mailman id 73936;
 Mon, 25 Jan 2021 09:14:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hfRN=G4=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1l3xws-0000hj-5I
 for xen-devel@lists.xenproject.org; Mon, 25 Jan 2021 09:14:14 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [40.107.22.77]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id aa5e5fd9-0ed1-4619-a657-792dd57001ae;
 Mon, 25 Jan 2021 09:14:11 +0000 (UTC)
Received: from AM6PR08CA0048.eurprd08.prod.outlook.com (2603:10a6:20b:c0::36)
 by VI1PR0802MB2448.eurprd08.prod.outlook.com (2603:10a6:800:b1::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.13; Mon, 25 Jan
 2021 09:14:08 +0000
Received: from VE1EUR03FT039.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:c0:cafe::47) by AM6PR08CA0048.outlook.office365.com
 (2603:10a6:20b:c0::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12 via Frontend
 Transport; Mon, 25 Jan 2021 09:14:08 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT039.mail.protection.outlook.com (10.152.19.196) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.11 via Frontend Transport; Mon, 25 Jan 2021 09:14:07 +0000
Received: ("Tessian outbound af289585f0f4:v71");
 Mon, 25 Jan 2021 09:14:06 +0000
Received: from a7d5b1e74fca.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 87CA9E75-B248-4EBD-A763-89AAEBF2492A.1; 
 Mon, 25 Jan 2021 09:13:59 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a7d5b1e74fca.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 25 Jan 2021 09:13:59 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com (2603:10a6:10:49::10)
 by DBAPR08MB5814.eurprd08.prod.outlook.com (2603:10a6:10:1b1::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.13; Mon, 25 Jan
 2021 09:13:56 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::f5c1:9694:9263:d90d]) by DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::f5c1:9694:9263:d90d%2]) with mapi id 15.20.3784.017; Mon, 25 Jan 2021
 09:13:56 +0000
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
X-Inumbo-ID: aa5e5fd9-0ed1-4619-a657-792dd57001ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SOTQ7vuYl+TbrTyVzlw+kbQud6xFvcCU36SQSYu77tQ=;
 b=Saj3YGp2kSdLeIXFH5qJ+isYIlffONLJZI3f+0Sr1lpfH75fo+hXMu5RQvBfrKIt5rfq2RnPkv/diPCVeV1kyjUPw0j0/Fhbju8DDNvO7XA6587qmjD/iPWXa8MFg0R/xEeMWgjgGXgLZA6OeJJ9K0Vz9TmMqPe83ymVoiVJvMU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 01b8bac4cd95bcbb
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J+4237TtxSiEoUbQtRx8MOqiAmhtHDeCR53I8aSFmrzMHvaa3fGB7SaM6U1NhU9pyFQFBkXQgq3z2zKItF3N/PsjKMbxwu6xt5gcB/4refiLs4Vg1AxEovnS3VSZfBzURzQXMv4W0jyynJUOVErQmFsAnUcbyfdHUOOesxKfTxD7Zq/+mpcKWAK3zGnRVa5cTTmOWZlPyLKesXVa07i0zgGI2uekrdlOj5GcDiX1LxniWMngbsHMNOA2HO/b+kAC0TK01AoCy61Ap1BSW9m7R/auejTPbLLJjES7DyY/bUfw8+zwrBHmhlsYK0MgDZZAjBjcHWrRNhokibY4XaFWmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SOTQ7vuYl+TbrTyVzlw+kbQud6xFvcCU36SQSYu77tQ=;
 b=EQZ4ufzM7yclertDeN/kHTUrOzbqJQk1mzmuUDQ5HKlgmnZ9bo8J/sQzLJuT5cIL3M3pG6tcP90MCz0mz1iC+FdslkJTYSG+/iQcaSskRBah3z5XgwT0i3QF2lG+Bf3NIND6OhZExvTg0SO0bpDNPo5m3AKeD9NtIOzY50S5fJTD3QfqqR8z0+JlUu4Cl/w1lp3J+KFS9sNK3dC8A3EI3KHVJueXlbb8f5onvjOyHRIKKx9wm3RfNJENplt3P+YkJatbCuourrei1R638lwVMa/gRd8+woQbDxxHKfaisgOnhcfm9ujrl/Nb9TUcDsRq4RDdinfx8Ivg1q5gzMGjEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SOTQ7vuYl+TbrTyVzlw+kbQud6xFvcCU36SQSYu77tQ=;
 b=Saj3YGp2kSdLeIXFH5qJ+isYIlffONLJZI3f+0Sr1lpfH75fo+hXMu5RQvBfrKIt5rfq2RnPkv/diPCVeV1kyjUPw0j0/Fhbju8DDNvO7XA6587qmjD/iPWXa8MFg0R/xEeMWgjgGXgLZA6OeJJ9K0Vz9TmMqPe83ymVoiVJvMU=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Ian
 Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Paul Durrant
	<paul@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v6 10/10] xen/arm: smmuv3: Add support for SMMUv3 driver
Thread-Topic: [PATCH v6 10/10] xen/arm: smmuv3: Add support for SMMUv3 driver
Thread-Index: AQHW8LMBkc1Fz+s0Zkin6A/2bKvT9Ko1G8mAgAL3mYA=
Date: Mon, 25 Jan 2021 09:13:56 +0000
Message-ID: <4C31618C-8EBA-40D7-B1B5-48037511D8AE@arm.com>
References:
 <388adde9a060eb9fc685cc743a354361fcdf0374.1611314782.git.rahul.singh@arm.com>
 <df3a76bc971a09daf4e61361bbc635e82cf9b59e.1611314782.git.rahul.singh@arm.com>
 <1a7e0989-29c6-7c7e-43a1-0caa11caad61@xen.org>
In-Reply-To: <1a7e0989-29c6-7c7e-43a1-0caa11caad61@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [80.1.41.211]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 9b46a921-dc48-4954-4f68-08d8c111919d
x-ms-traffictypediagnostic: DBAPR08MB5814:|VI1PR0802MB2448:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR0802MB2448E29608536AC671461627FCBD0@VI1PR0802MB2448.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 PuH4ymxE+gZxMPSDVFFYPqGwa14+lpR9FJrvLSQOY3bjYLayvm7opMqJtBaoiSN6Mwi3VyV1yoHtk/UdzLofPGVJwD19/NwnCUNvN7noc8qsLO4OWwTkcrEoF1aRO0xu4OJ2U1AIhAVAzK3iUoKIUfHusfkq2luK89evNC5Yq9kexPobB/HR8mWwVQCUGwHB5+2n72yscYYlKQhs0gZ9IM9cDQLnQnjoRMdctc4oB4tDGrA7vzBiwYfKePNc2xheezdjEjpA9+Z49GM8Euzm9rEYwz+dJiIb4W6qr6B9oLaTqwCs/xpysL6OKhV4EESMFceTBsseLv0iua+to6FqeJBSqvn6ZexdbGuKzgwwxDoZD804MzuqTqXGXdkAin1KECOvY2S8cFZD5W/Hn7vUhborAbOkGBCJrzRSXwrIbZpqub1qrHPDKL4j7NnUOjcA
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3500.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(346002)(366004)(136003)(376002)(71200400001)(6512007)(6916009)(7416002)(4326008)(54906003)(86362001)(26005)(316002)(186003)(6486002)(478600001)(33656002)(5660300002)(64756008)(66946007)(6506007)(66446008)(53546011)(8676002)(2616005)(36756003)(83380400001)(2906002)(66556008)(66476007)(91956017)(8936002)(76116006)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?ROjb+2QhNuPAfolARzI4VB3LJDOMvn34veW2LffzPixRnbgyO8IDse9erEED?=
 =?us-ascii?Q?bdNRsjWQayMcVmJEZRQq2vBcBd9NlQQ6AEFscvSYLj2rhv8d+k11uXLXUVX8?=
 =?us-ascii?Q?FDuNnEfTEdzneeAG/MdjiaFIjF9SJkttQJgbkym1mJopBlESr0iLVKdiQDYX?=
 =?us-ascii?Q?EIhBazSBuzPJXnURPoqNu5cKG+F2L9Puo5oh1LfVGWsQOy61hRa/43LmmACu?=
 =?us-ascii?Q?WvD2cHxNzgtM/aV83Jk/U8dA4MF4aoEh6LPOqkUfoeAk/eH2IZVaHlnpk1/I?=
 =?us-ascii?Q?rmP4WPu3NydCvJPm1oTPAPc0Zo4r5aNO0pfjLvefUsKumNa+StLnhuZDecdO?=
 =?us-ascii?Q?B7hDiTZkEteH+L3+lsfL2s8L+TWnUkxGfXQqYYPqtw1kKhZUIL1ac3iKCn8n?=
 =?us-ascii?Q?nFWVFrVCz9ETBWxRHKulaIts21Osu/15h4njfFZmHpwCJStdqcQ339v0czPH?=
 =?us-ascii?Q?jvqc89ScBO37jIYG1qWO2mcq9fBrY2n1geR+8mqIPBJK6JaJZCFt5VfrYg4l?=
 =?us-ascii?Q?D5EPHzirsx42o+oLkzdaKSz/KsI0W898M7h+uzM/uXIOCm2McxQvMK1I9NnB?=
 =?us-ascii?Q?hGdkB7QgamBoEQt50o/ijqQJTu3LtF46REKpfskYV1prUnmoa4JTFPh+abfJ?=
 =?us-ascii?Q?BO+69vtbXyxuRf65EURRjLq02Wk5SsC9ZEw0JtDuTH3+R3qQ6e7NDNK2bG2R?=
 =?us-ascii?Q?48XTnK3njcuj/Nq2wo6AWKKD1gD3l03TTnmAiz5QJhqyl12M2Kql4dV0+M7O?=
 =?us-ascii?Q?4Mndx0gkIN7hEfBY4hLKnTkPSjzO0m6qx6BVTW63S3pTCp0TGDdl1WhYLoCn?=
 =?us-ascii?Q?40EVJtifGJ+C1L4LhkMU8iO0XUIXvji1/DGFaY0zOwXG3DIt2akr72trlrzl?=
 =?us-ascii?Q?wZinwezPhauXnXk4P4H2m8SFSYF7Er7e+Q03P//fPdtWrHiw5mJMsUTLI3gH?=
 =?us-ascii?Q?9atH+IfHORucY8i2U4YvMD7WSax4DK2/3MZJK/iaPsGeJAKimMGRp1cnsuUA?=
 =?us-ascii?Q?FKcOYLDIHne50bN79ydp9u0ruWCTPvFenyKUH4RNwwBEHVvSvtz06FLo5vPj?=
 =?us-ascii?Q?1AdYRFio?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <25338286F4C3D14EB5823086742CF44A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5814
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	04cd04b5-c188-43d5-11a4-08d8c1118b28
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	josoC8swcuF/XqGDcGPTBLLcHXaJgYYi0i5xVuMX0WRD2xUpkT7nvyn18yxUtnwJOchtw/O3Wh8jvRRGRC2QW9q0/9bu9x1Tkf4FIhHPf6AhVHZlHWCRh3RgQPZhghRIYvIQav0rpgTCOH1NZI2lnyUIPHcCGxhJD+4PT+YHBoaL8BCC7p/RwgKS4fsMjTkYy7UnKH38GHqL1xn0qke5SvTlNfECrDhT1eOLVp913ulXLGux4LBJjrxIR7/pIqfvnS99lt8AaOmrAeDf6kpFGO04OQOi84GGTi5oqdskf3DMWJ1BsgVfSYJh3KRlGnX7iySEezyMfbJm8aEnEcOF/raXgXXUvwDGPDKoLI26flXNO7YErOUQx4MRcHAmRGIAlaWEk5y14TCUcm0ksvlKrKaFwALZd3eKPZ5A02xTicAnVtNjyI8iMANDpyiCG6A7WA5fx7xCW6FhHfuT8uXDog==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(396003)(136003)(346002)(39860400002)(46966006)(26005)(86362001)(33656002)(6486002)(81166007)(356005)(53546011)(54906003)(316002)(8936002)(83380400001)(186003)(8676002)(6506007)(47076005)(336012)(2616005)(2906002)(107886003)(478600001)(4326008)(6512007)(82740400003)(5660300002)(70586007)(82310400003)(6862004)(36756003)(70206006);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2021 09:14:07.3206
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b46a921-dc48-4954-4f68-08d8c111919d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2448

Hello Julien,

> On 23 Jan 2021, at 11:55 am, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Rahul
>=20
> On 22/01/2021 11:37, Rahul Singh wrote:
>> Add support for ARM architected SMMUv3 implementation. It is based on
>> the Linux SMMUv3 driver.
>> Driver is currently supported as Tech Preview.
>> Major differences with regard to Linux driver are as follows:
>> 2. Only Stage-2 translation is supported as compared to the Linux driver
>>    that supports both Stage-1 and Stage-2 translations.
>> 3. Use P2M  page table instead of creating one as SMMUv3 has the
>>    capability to share the page tables with the CPU.
>> 4. Tasklets are used in place of threaded IRQ's in Linux for event queue
>>    and priority queue IRQ handling.
>> 5. Latest version of the Linux SMMUv3 code implements the commands queue
>>    access functions based on atomic operations implemented in Linux.
>>    Atomic functions used by the commands queue access functions are not
>>    implemented in XEN therefore we decided to port the earlier version
>>    of the code. Atomic operations are introduced to fix the bottleneck
>>    of the SMMU command queue insertion operation. A new algorithm for
>>    inserting commands into the queue is introduced, which is lock-free
>>    on the fast-path.
>>    Consequence of reverting the patch is that the command queue
>>    insertion will be slow for large systems as spinlock will be used to
>>    serializes accesses from all CPUs to the single queue supported by
>>    the hardware. Once the proper atomic operations will be available in
>>    XEN the driver can be updated.
>> 6. Spin lock is used in place of mutex when attaching a device to the
>>    SMMU, as there is no blocking locks implementation available in XEN.
>>    This might introduce latency in XEN. Need to investigate before
>>    driver is out for tech preview.
>> 7. PCI ATS functionality is not supported, as there is no support
>>    available in XEN to test the functionality. Code is not tested and
>>    compiled. Code is guarded by the flag CONFIG_PCI_ATS.
>> 8. MSI interrupts are not supported as there is no support available in
>>    XEN to request MSI interrupts. Code is not tested and compiled. Code
>>    is guarded by the flag CONFIG_MSI.
>> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
>> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
>=20
> Thank you for sending a new version. I have commited the series now.
>=20

Thank you for committing the series.

Regards,
Rahul

> Cheers,
>=20
> --=20
> Julien Grall


