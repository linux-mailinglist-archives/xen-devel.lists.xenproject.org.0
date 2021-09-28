Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A9DC41B3FC
	for <lists+xen-devel@lfdr.de>; Tue, 28 Sep 2021 18:37:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.198162.351520 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVG6O-0001g7-3S; Tue, 28 Sep 2021 16:37:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 198162.351520; Tue, 28 Sep 2021 16:37:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVG6O-0001eK-0E; Tue, 28 Sep 2021 16:37:08 +0000
Received: by outflank-mailman (input) for mailman id 198162;
 Tue, 28 Sep 2021 16:37:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4iZ8=OS=arm.com=Rahul.Singh@srs-us1.protection.inumbo.net>)
 id 1mVG2r-0007R3-PW
 for xen-devel@lists.xenproject.org; Tue, 28 Sep 2021 16:33:29 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [40.107.20.55]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7aef723d-36b8-417f-b96f-ed62e803d2df;
 Tue, 28 Sep 2021 16:33:19 +0000 (UTC)
Received: from DB8P191CA0012.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:130::22)
 by AM0PR08MB5073.eurprd08.prod.outlook.com (2603:10a6:208:15c::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.18; Tue, 28 Sep
 2021 16:33:17 +0000
Received: from DB5EUR03FT052.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:130:cafe::23) by DB8P191CA0012.outlook.office365.com
 (2603:10a6:10:130::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15 via Frontend
 Transport; Tue, 28 Sep 2021 16:33:17 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT052.mail.protection.outlook.com (10.152.21.82) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Tue, 28 Sep 2021 16:33:17 +0000
Received: ("Tessian outbound 71ebfb754289:v103");
 Tue, 28 Sep 2021 16:33:16 +0000
Received: from c1534b78cb71.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1DC65BD7-9CC4-4D7E-93B1-37FD3EB7D8FE.1; 
 Tue, 28 Sep 2021 16:33:05 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c1534b78cb71.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 28 Sep 2021 16:33:05 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com (2603:10a6:20b:39e::10)
 by AS8PR08MB6342.eurprd08.prod.outlook.com (2603:10a6:20b:31a::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14; Tue, 28 Sep
 2021 16:32:53 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::c8de:afad:1d5a:efd0]) by AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::c8de:afad:1d5a:efd0%7]) with mapi id 15.20.4544.022; Tue, 28 Sep 2021
 16:32:53 +0000
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
X-Inumbo-ID: 7aef723d-36b8-417f-b96f-ed62e803d2df
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w/JEL8gsVihe+EMjYMhR2HrrRVt3HBZQnGRkx6R/jyw=;
 b=IAoR/xBmcCnfE16iQHmPcqfaPRARgdBL6nLJTaGKfYUXmkNLT7y09O8npe2fJ2e2fLC8tWgr6pLSQnXyr6RAmkJyEsLx3WNY/6mRfScleW7xgu8adjx7X8weAw4DqSW5FOUVM8ts6gLbeiACTCaT0C9iOmQphWciYACyavfL+wY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: d90e10f3e6d110af
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KbQeAfIrhQBfq1gRMUAQdEkfn1AGJrOWh+sW2bF/1NC/qT3VheoviUMz+18Xi/FuRf+m2HqKJMTLITd8U7zDWMsqTkFeHSr9cMESxzsX79iSQXm2eLAwVBN5AD9RdWVM8l0ZdxSi4L3/2vKbvJQ1PngVbi3r7E+JJsI0OkDjENPx9qcpz2QPsr8H+nnv1TyPCEq1RjBLtWUWma2Hj3bg1RZd7KXYm7TPQI27jQEF+NGVMFI3jFP4QVlf14KjWIh0c+1QlzmttsdWsTw8IqXWOHThhw7EwD/9yDbThNTh3dGoNnRuHv7dxrxhp+khtNpyWJVav0ZNo9FDSrlrcreUAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=w/JEL8gsVihe+EMjYMhR2HrrRVt3HBZQnGRkx6R/jyw=;
 b=HLzOp3FMsX+FCoqblQKb3D+eKU6CZmdPKrtYIiSHDj2PKErd08QTTR8isEyePLyghouBCHKN7r/PtL2Htcuht0au6x5d5NAy9R4QjYz6NY8aVgWTppjxADj164YRNSFEKDS6+uthGtz4BdeiEEtNKyFDs42MgR0ZxOsZT+2pODl/EvUeP3JwB0gL42Zz3nASAGaQ6N/VAV/b4mqyGxaOUdAdzY6iTji4/1WOWzwedYw4hzCqrKYbYBznMlzJ/feG5iWk/+WFb25Bw5RJn72yhB09YHKjtyfJSReNO0R2PkVncadIzLIeF7Jwe27Kw00sRV5zRE577m6hMkzVzx85PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w/JEL8gsVihe+EMjYMhR2HrrRVt3HBZQnGRkx6R/jyw=;
 b=IAoR/xBmcCnfE16iQHmPcqfaPRARgdBL6nLJTaGKfYUXmkNLT7y09O8npe2fJ2e2fLC8tWgr6pLSQnXyr6RAmkJyEsLx3WNY/6mRfScleW7xgu8adjx7X8weAw4DqSW5FOUVM8ts6gLbeiACTCaT0C9iOmQphWciYACyavfL+wY=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Andre Przywara
	<Andre.Przywara@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>, Paul Durrant <paul@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 14/17] xen/arm: Enable the existing x86 virtual PCI
 support for ARM.
Thread-Topic: [PATCH v2 14/17] xen/arm: Enable the existing x86 virtual PCI
 support for ARM.
Thread-Index: AQHXr6at03qE3GlVrUSsAw4u98X5EKuy0MOAgAbc5gA=
Date: Tue, 28 Sep 2021 16:32:53 +0000
Message-ID: <AB8CE929-1B53-4595-819E-AB1E3762BA39@arm.com>
References: <cover.1632307952.git.rahul.singh@arm.com>
 <06e0cf146ca4d82526282c1960177fad97346ad5.1632307952.git.rahul.singh@arm.com>
 <fe23eeb0-c31f-0525-dcda-f7cf548ea0cf@suse.com>
In-Reply-To: <fe23eeb0-c31f-0525-dcda-f7cf548ea0cf@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: b5123bc6-d3bf-474d-24e9-08d9829dad1c
x-ms-traffictypediagnostic: AS8PR08MB6342:|AM0PR08MB5073:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB5073609668603400712B8138FCA89@AM0PR08MB5073.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:4714;OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 wDQDwJr1Y/Y9fK6OwOpOEd1SPrK2Drmu+BuCVJl8RAOh6ikohGETcDFq0aBD2hpwTSR1DarO8GGAEZg61Mg8XFus93rKQZjzRUo8uNOHFE7xrdD4UDsl7wZRk+sdFTQLX0Tjk8N31dDLxUixfBJxsPGFroU8FqqiBo6VxfGfIZhFiIYgqOWpf6Fn6H8NAobgN1lyCTO6vxErPAQVjZrNk6BKqAbBXfWut6lemraOzJA+iwqji5p4C6yIk0QYPOG4MFLCGZVofun0KsUdGRKtNfX8CMrO2k2KQDbacxLehkACeEfj5t5kpccpLr/oKpppRxZcDhTITPRy2Rj3OgLFVBSrQjVaU1JTEv8uSiHBgyrSKlwdyFh4dJDkHQyJeBUa4aRhY0JhMIXAEg3HO1wkFcwX3SFumAEZZXtDGvHDig9RvZ4ZRdD4ufnZtugxV7WhZ5WpVNF0cKw+DIZqbquG/N6q4l9439Jvbl5bXZnysXnQZ3DfhSFalGOEs2HmTHJszXvJewigQPChNd5pXVriDOnBlBIN/Q5tPEaJgEIxCBBZtjfXMhicJO8/Zk4ErK0HGx6nbN4i03wT6xN5UpuszylaRWQYw1nGoRBa3eTXRc8iEj4JTdYvNBmusHGK6+bOCykOmYWhko3LoEmFe5GDUFziGLO6jMori8zCjfq4IxrVG7jAkjtY1ni/IYYqPhpuFsTLgP3FUwpzIeFBNb2/zVnaP7jeY1LnSzRLl1Yk0WIjXZZQzNGxx1uCTLOTkmQF
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB6919.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(33656002)(38100700002)(6916009)(122000001)(6512007)(71200400001)(38070700005)(54906003)(36756003)(186003)(8936002)(86362001)(8676002)(7416002)(2616005)(4326008)(53546011)(76116006)(91956017)(6506007)(6486002)(5660300002)(2906002)(508600001)(64756008)(66446008)(316002)(26005)(66556008)(66476007)(66946007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <6113B935DFA4A644BDE412999C02AC24@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6342
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT052.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5c83bf4c-eb2e-4dee-15d1-08d9829d9eb6
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0RX+D0upyYimdNKFb+R2Jql6ol686uVaVKTok/+kvbL2cn60qDKvb8+EK//hK+CS1aAlxypoYms6n8SL7Iv9ULRn9xN1l8/4VspiBZjaQB5DYri22REZlZzpnqljUTFsp3T0bqEX+eWl+OSJ1Pf6JXlQdmC6m0MtoEbL2HRV1sH7rXE+r9N9aUUIujoNeL1jVL7clFSj0AA6i3H+CMxX3BpODxmfXIx3QnxIHiRHDfi0oeLF8V7KqhbzZ0sqgBA+84Dfdvrq2a8gB2lbHo0ZUKUQcogUUG2x/0wyNsTHsSdQgenxhvT/bbi/1Ob8hDfvnY1VGz7ZcML8BebmMwXPg30Bd3zIuFcGyCX2naElKY7Uh4Z4wxFY11yn9JTn7GG4rN1420XG1yUM4fnhV/wHfuSz+rJFq3W5qzT1Z5f8gGZU4wqDt4zloSvPEzR7D1wns0cIgM+CnW7Xa2WxbpLUUWUqLK5yEJpdeqeKmJx61N3dC6YigbP2qu/sfG4fEbphtLcN+/nGF13B6fihUx77ah3WYpeZODP1s7ediQs2gixPFFi8VCFI9UbxpJvFUunXZmR7I3vwRCYl4KcoRbEvIKRj2G35NKggfDrXY5V5FQWQ91r6Pypt+Rbp/i5Pv5vKwe+NdXTBOI56LZ/vZtGkjf1mwDvPZKC1sbx8JYJol/Fw2TJp7HE1hxom9Qwvi9oiySF48E5ykLwmgrowuVn3pQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(2616005)(6486002)(316002)(6512007)(2906002)(508600001)(356005)(36860700001)(186003)(6862004)(47076005)(26005)(86362001)(8676002)(5660300002)(54906003)(53546011)(36756003)(6506007)(336012)(81166007)(70586007)(4326008)(33656002)(82310400003)(70206006)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2021 16:33:17.5345
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b5123bc6-d3bf-474d-24e9-08d9829dad1c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT052.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5073

Hi Jan

> On 24 Sep 2021, at 8:44 am, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 22.09.2021 13:35, Rahul Singh wrote:
>> @@ -623,7 +624,7 @@ int arch_sanitise_domain_config(struct xen_domctl_cr=
eatedomain *config)
>>     unsigned int max_vcpus;
>>=20
>>     /* HVM and HAP must be set. IOMMU may or may not be */
>> -    if ( (config->flags & ~XEN_DOMCTL_CDF_iommu) !=3D
>> +    if ( (config->flags & ~XEN_DOMCTL_CDF_iommu & ~XEN_DOMCTL_CDF_vpci)=
 !=3D
>>          (XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap) )
>>     {
>>         dprintk(XENLOG_INFO, "Unsupported configuration %#x\n",
>=20
> While you accept the new flag here and ...
>=20
>> --- a/xen/common/domain.c
>> +++ b/xen/common/domain.c
>> @@ -483,7 +483,7 @@ static int sanitise_domain_config(struct xen_domctl_=
createdomain *config)
>>          ~(XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap |
>>            XEN_DOMCTL_CDF_s3_integrity | XEN_DOMCTL_CDF_oos_off |
>>            XEN_DOMCTL_CDF_xs_domain | XEN_DOMCTL_CDF_iommu |
>> -           XEN_DOMCTL_CDF_nested_virt) )
>> +           XEN_DOMCTL_CDF_nested_virt | XEN_DOMCTL_CDF_vpci) )
>>     {
>>         dprintk(XENLOG_INFO, "Unknown CDF flags %#x\n", config->flags);
>>         return -EINVAL;
>=20
> ... here, you need to somehow reject it on x86, until DomU support
> there gets added (unless I have misunderstood things and you're
> aiming at enabing that support for x86 here at the same time). I
> cannot spot existing code which would take care of such a newly
> added flag.

Ok. I will reject the flag in x86 arch_sanitise_domain_config().
>=20
>=20
>> --- a/xen/include/asm-x86/pci.h
>> +++ b/xen/include/asm-x86/pci.h
>> @@ -6,8 +6,6 @@
>> #define CF8_ADDR_HI(cf8) (  ((cf8) & 0x0f000000) >> 16)
>> #define CF8_ENABLED(cf8) (!!((cf8) & 0x80000000))
>>=20
>> -#define MMCFG_BDF(addr)  ( ((addr) & 0x0ffff000) >> 12)
>=20
> While there was a reason for the padding blank after the first
> opening parentheses here, ...
>=20
>> --- a/xen/include/xen/pci.h
>> +++ b/xen/include/xen/pci.h
>> @@ -41,6 +41,8 @@
>> #define PCI_SBDF3(s,b,df) \
>>     ((pci_sbdf_t){ .sbdf =3D (((s) & 0xffff) << 16) | PCI_BDF2(b, df) })
>>=20
>> +#define MMCFG_BDF(addr)  ( ((addr) & 0x0ffff000) >> 12)
>=20
> ... that blank ends up bogus here.
Ack . I will remove the extra blank in next version.

Regards,
Rahul
>=20
> Jan
>=20


