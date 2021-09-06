Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C214017C7
	for <lists+xen-devel@lfdr.de>; Mon,  6 Sep 2021 10:25:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.179463.325737 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mN9vx-0002Fo-EX; Mon, 06 Sep 2021 08:24:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 179463.325737; Mon, 06 Sep 2021 08:24:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mN9vx-0002CO-BW; Mon, 06 Sep 2021 08:24:53 +0000
Received: by outflank-mailman (input) for mailman id 179463;
 Mon, 06 Sep 2021 08:24:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kxtw=N4=arm.com=Bertrand.Marquis@srs-us1.protection.inumbo.net>)
 id 1mN9vv-0002CG-N8
 for xen-devel@lists.xenproject.org; Mon, 06 Sep 2021 08:24:51 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [40.107.6.59]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e7a0ee50-0eeb-11ec-b09b-12813bfff9fa;
 Mon, 06 Sep 2021 08:24:51 +0000 (UTC)
Received: from DU2PR04CA0167.eurprd04.prod.outlook.com (2603:10a6:10:2b0::22)
 by DB6PR08MB2663.eurprd08.prod.outlook.com (2603:10a6:6:21::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Mon, 6 Sep
 2021 08:24:39 +0000
Received: from DB5EUR03FT023.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2b0:cafe::b5) by DU2PR04CA0167.outlook.office365.com
 (2603:10a6:10:2b0::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.20 via Frontend
 Transport; Mon, 6 Sep 2021 08:24:39 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT023.mail.protection.outlook.com (10.152.20.68) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19 via Frontend Transport; Mon, 6 Sep 2021 08:24:39 +0000
Received: ("Tessian outbound 5918cb94a4b5:v103");
 Mon, 06 Sep 2021 08:24:39 +0000
Received: from d993e605fcea.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 BCFFB8A1-1D20-4CD7-827A-2EFA6490215F.1; 
 Mon, 06 Sep 2021 08:24:32 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d993e605fcea.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 06 Sep 2021 08:24:32 +0000
Received: from PAXPR08MB6446.eurprd08.prod.outlook.com (2603:10a6:102:12d::10)
 by PR3PR08MB5707.eurprd08.prod.outlook.com (2603:10a6:102:8b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.22; Mon, 6 Sep
 2021 08:24:30 +0000
Received: from PAXPR08MB6446.eurprd08.prod.outlook.com
 ([fe80::c029:ed0:82e7:3c2f]) by PAXPR08MB6446.eurprd08.prod.outlook.com
 ([fe80::c029:ed0:82e7:3c2f%6]) with mapi id 15.20.4478.025; Mon, 6 Sep 2021
 08:24:29 +0000
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
X-Inumbo-ID: e7a0ee50-0eeb-11ec-b09b-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r9quR08hWtYNSsdIKzLQ+LhdPucH7fi6yjeXX0EcObI=;
 b=bGEFN9PQjFtVTa/QYC3EUCsQ9bX1se+s5be+Gz6ls7tM11chJFLa6KHuFkxiEQTtpiZSFDRxrzJkiZr/ZbyYqru/v7Ub1gEyHWJYXYmskX4q2Vy97EnBQVkYTHUUpSw1+VTXEnqYhistEJzXGVzK54BpKmdItPmW1s4RGaXY2VM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 35b6929ec9af1a07
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GHZ1tyoVJznr+V/ahN3pJIP6eaykjvYKgIJFUSdHdekqZ2UcUvFqSs7wf+p4CQ2MvwGUU9gaBXdl1s15QKa/RuXRA7dblIeqGMmBt7cMZ3zfrTqKf5Ahc4RRl03/wQ3s/n4Ve34qQ66k9sc6tlxXSIAEiAVO0DdSRjdGhPfTUbsGH1x1L4AY2TztlFTj73HgqbsVukuQGOTUwy2ZoYCqWKnAgKMl8x0BMMCgoMunJojpPqQKrEEPmWum5Q6kecICw5pV2znNL/gWgNmeSPIEhll+R+aZXrzv/vg2LCB3KkL3mlWOQe8ggoGLj9uKbAQfHAOhTMV5A6c7QklFAJg8Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=r9quR08hWtYNSsdIKzLQ+LhdPucH7fi6yjeXX0EcObI=;
 b=kj99V3tP1IAJvjv2e53fRjm6zBLqzsT3zWPWrSJ7uykBlEQlAP2fq5Y0dfJ/zLQb3NUz6MWY88ctWESgX5w8fKfup2XkyaKLosg3ZSaP+FMpFyAXITAFzMmd9VZdN5mlNJQQARMDDFO8f0juHd8JWOdfEx7zpDIe5Ask9CCvW9ZKEJ8abk4EH7a9DEVFEnK/eKqov3HxGmaz45jtc3vpcZKaA1So8oUGd3mTHG8YBy4tfD4gl7KZdOMi5glAEyLzRBQq6u8t3DdpakEBcUI4+Hc9/RNi8VjxpAzBf8iFFMutc1xS4WkxL0BJbphR4X00uhDQX0eh8prrH2hQP4l3Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r9quR08hWtYNSsdIKzLQ+LhdPucH7fi6yjeXX0EcObI=;
 b=bGEFN9PQjFtVTa/QYC3EUCsQ9bX1se+s5be+Gz6ls7tM11chJFLa6KHuFkxiEQTtpiZSFDRxrzJkiZr/ZbyYqru/v7Ub1gEyHWJYXYmskX4q2Vy97EnBQVkYTHUUpSw1+VTXEnqYhistEJzXGVzK54BpKmdItPmW1s4RGaXY2VM=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Ian
 Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH v3 4/7] xen/arm: Sanitize cpuinfo ID registers fields
Thread-Topic: [PATCH v3 4/7] xen/arm: Sanitize cpuinfo ID registers fields
Thread-Index: AQHXmbPuT8O7GIjNskafsumV8a3YcquS+CyAgAPFowA=
Date: Mon, 6 Sep 2021 08:24:29 +0000
Message-ID: <3A692AFD-CFD5-4E90-BEF8-5D29E3A9821B@arm.com>
References: <cover.1629897306.git.bertrand.marquis@arm.com>
 <6710cc0ac3fbc9c8030dfa3d6dfc3ecb79de4b71.1629897306.git.bertrand.marquis@arm.com>
 <alpine.DEB.2.21.2109031425030.26072@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2109031425030.26072@sstabellini-ThinkPad-T480s>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: e9779a59-db3f-42c4-33cc-08d9710fc4e7
x-ms-traffictypediagnostic: PR3PR08MB5707:|DB6PR08MB2663:
X-Microsoft-Antispam-PRVS:
	<DB6PR08MB2663BBBF528BDD35DB10CEC19DD29@DB6PR08MB2663.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:556;OLM:556;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 c2vy3/kqsm0SFth62usHfZM9sf7Ck197UGqPe0QpHH0uNXnSTxKBuYvB2sXRc84yOXg7WFBP9RCmQu0GMe9HO79JtUhkbZEWKx4ulXMzos7dU0OuE4FiI2DcT3Rzjfz1IsGDRmw+RAzSfQ11Gp/3h/jAz3jLKEPmw04Wpp92Q5+viTKQJCgPPr31Auhv63nk768gGAihHoX+xzAjLUJIvgj0Z9gFgEraAu3TDNOoda/YExL+SC2OW0qFZqDS/lBDosy446/f/orDQ9Jg01Y0LLQg3WVBL2BiBI+OyLINqA0VbyXPcHtwKXyVBu9HJoMiKaegS5Zp6C0c1unV9gYB+UsWzVS+Zs0ERvBoLnEg69D648Ccy71SXwEOK6IH6/S24ZTu46remKanJzjbI67VJ0J1feRJx3SYxR2ptjvKcCud4XKajEQAfS4dbo6ja7Gkui7Nnkf44LVBgKRSpNBA9tE9HJYq09bVTbJSJJpAP9n4+XbAsru5kWTESJeaW6eirdmAHt8Aa1pp7NQIcGG+m9M7c6/LRPk2JA7TYCZUdwAwLGqjdokWESA1CR6WP6qqm+XPrWge6YxZLpsPZEdcWqlQMkeOu9rKf5MI2cPeDEEWdZWPopOs53/nfCFc8AZva5aI+wgWmTtTHKHwyUBlKPWyEz5b/1QaCb7+eY7hj4R0D3AEmJfqLm0OOVE8+LrrwOsWdZ5aF3DGkL4MBqWzhE0tJzzjwSpoyEjrL4X9qMV5GhtK6Dv/WkgfLCSasEZp
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6446.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(122000001)(33656002)(316002)(6916009)(38100700002)(6486002)(83380400001)(86362001)(2906002)(54906003)(2616005)(8676002)(36756003)(91956017)(76116006)(4326008)(26005)(38070700005)(508600001)(71200400001)(53546011)(8936002)(6506007)(6512007)(66946007)(5660300002)(64756008)(66446008)(66556008)(66476007)(186003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <6C9677CDE8FB0741AA53416A35C173E6@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5707
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	1ae03149-6456-44fb-73e4-08d9710fbf2b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9azTzZTES3EjOBhFC0hoMX+C5+9GUarXijMq0D5oBzKku2ZsVcQBjfZEJ61gu1Dy+M0GOyyGDOi4jf0yLFxxpGeNhrEGXp5LPk8r5PvdM1nnBqE9X4iODhFQ/dhH2UdwMOaNsWh+GY3DaBZiXyzKrcQNOmP+8mSL8Rt+MrNlkVmrIwcAgAZEqdPE069nXpp+2ULC88UKaVvLt0kmXteDqhM4L30hZRQGIEOldNX94f2a8WU79icrxjeYPNrjltIUgevvi9DQ/0M6//Eu3RrW8Vuxccf2b6mnhWjOiIJeETxQdMygpcHFAWRuF9Lh6wm3g0W/+ETdsSgZKBdCGIF0SWedKkONjTTFp10s8Mt2gqSd5gysPhyHCnbNJpzpFdFxZvgc/ZtFZWv5PDxDYqp7bltifh5NqERhpe1IXaGIaG2Iotxrh0IIl2j17Q8LT7nNqG9t02ssorqvSY69crsrGuojk5JlSxAUDKWGjW0Bpq2ATkssJCqHMHv33zlWXewC1eqYsu6+qtXYz4sx8X2pJg2JWhwopGsZCJ3q93RzssBX3Hw5fq3H6fTo2w5N0SlCCOmZV8QhZ7Z//JGc3eNpiJdajNs9KRuM1KMKU0mF2bFg8qNhPCGIm5MmISpBCyl641rcIx0vvVyQB88r0nOMXpf+IJkW/D3BWKSJk+4OErZEEN2L+OBfcGhta6Vvc7REoX+7XJvAt50i4x9aThyDZA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(376002)(39860400002)(396003)(346002)(46966006)(36840700001)(6506007)(53546011)(2616005)(6862004)(4326008)(47076005)(316002)(6512007)(83380400001)(82310400003)(5660300002)(36756003)(6486002)(82740400003)(8676002)(54906003)(186003)(8936002)(36860700001)(26005)(356005)(81166007)(70206006)(70586007)(336012)(478600001)(33656002)(2906002)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2021 08:24:39.1490
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e9779a59-db3f-42c4-33cc-08d9710fc4e7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR08MB2663

Hi Stefano,

> On 3 Sep 2021, at 23:48, Stefano Stabellini <sstabellini@kernel.org> wrot=
e:
>=20
> On Wed, 25 Aug 2021, Bertrand Marquis wrote:
>> Define a sanitize_cpu function to be called on secondary cores to
>> sanitize the system cpuinfo structure.
>>=20
>> The safest value is taken when possible and the system is marked tainted
>> if we encounter values which are incompatible with each other.
>>=20
>> Call the update_system_features function on all secondary cores that are
>> kept running and taint the system if different midr are found between
>> cores but hmp-unsafe=3Dtrue was passed on Xen command line.
>>=20
>> This is only supported on arm64 so update_system_features is an empty
>> static inline on arm32.
>>=20
>> The patch is adding a new TAINT_CPU_OUT_OF_SPEC to warn the user if
>> Xen is running on a system with features differences between cores which
>> are not supported.
>>=20
>> The patch is disabling CTR_EL0, DCZID_EL0 and ZCRusing #if 0 with a TODO
>> as this patch is not handling sanitization of those registers.
>> CTR_EL0/DCZID will be handled in a future patch to properly handle
>> different cache attributes when possible.
>> ZCR should be sanitize once we add support for SVE in Xen.
>>=20
>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>=20
> Great patch! It looks good I only have a couple of minor questions
> below.

Thanks
>=20
>=20
>> ---
>> Changes in v3:
>> - in case of different midr but hmp-unsafe passed on the command line,
>> enable all cores anyway but taint Xen with CPU_OUT_OF_SPEC.
>> - use current core info to sanitize cpu only if we keep it on
>> Changes in v2:
>> - add compilation of cpufeature.c in this patch instead of previous one
>> - remove functions reused from linux code and moved to header
>> - rename sanitize_cpu to update_system_features
>> - change to Linux coding style
>> - remove dev comments
>> - surround currently not used Linux structures with #if 0 and adapt the
>> commit message
>> - add missing aa64dfr1 register
>> - add TODO for CTR, DCZID and ZCR
>> - add CPU_OUT_OF_SPEC support to print_taint
>> - use system_cpuinfo instead of boot_cpu_data
>> ---
>> xen/arch/arm/arm64/Makefile      |   1 +
>> xen/arch/arm/arm64/cpufeature.c  | 121 +++++++++++++++++++++++++++++++
>> xen/arch/arm/smpboot.c           |  34 +++++++--
>> xen/common/kernel.c              |   6 +-
>> xen/include/asm-arm/cpufeature.h |   9 +++
>> xen/include/xen/lib.h            |   1 +
>> 6 files changed, 162 insertions(+), 10 deletions(-)
>>=20
>> diff --git a/xen/arch/arm/arm64/Makefile b/xen/arch/arm/arm64/Makefile
>> index 40642ff574..701d66883d 100644
>> --- a/xen/arch/arm/arm64/Makefile
>> +++ b/xen/arch/arm/arm64/Makefile
>> @@ -1,6 +1,7 @@
>> obj-y +=3D lib/
>>=20
>> obj-y +=3D cache.o
>> +obj-y +=3D cpufeature.o
>> obj-$(CONFIG_HARDEN_BRANCH_PREDICTOR) +=3D bpi.o
>> obj-$(CONFIG_EARLY_PRINTK) +=3D debug.o
>> obj-y +=3D domctl.o
>> diff --git a/xen/arch/arm/arm64/cpufeature.c b/xen/arch/arm/arm64/cpufea=
ture.c
>> index 5777e33e5c..61f629ebaa 100644
>> --- a/xen/arch/arm/arm64/cpufeature.c
>> +++ b/xen/arch/arm/arm64/cpufeature.c
>> @@ -275,6 +275,9 @@ static const struct arm64_ftr_bits ftr_id_aa64mmfr2[=
] =3D {
>> 	ARM64_FTR_END,
>> };
>>=20
>> +#if 0
>> +/* TODO: use this to sanitize the cache line size among cores */
>> +
>> static const struct arm64_ftr_bits ftr_ctr[] =3D {
>> 	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_EXACT, 31, 1, 1), /* RES1 *=
/
>> 	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, CTR_DIC_SHIFT, =
1, 1),
>> @@ -291,6 +294,7 @@ static const struct arm64_ftr_bits ftr_ctr[] =3D {
>> 	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, CTR_IMINLINE_SH=
IFT, 4, 0),
>> 	ARM64_FTR_END,
>> };
>> +#endif
>>=20
>> static const struct arm64_ftr_bits ftr_id_mmfr0[] =3D {
>> 	S_ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_MMFR0_INNER=
SHR_SHIFT, 4, 0xf),
>> @@ -325,11 +329,14 @@ static const struct arm64_ftr_bits ftr_mvfr2[] =3D=
 {
>> 	ARM64_FTR_END,
>> };
>>=20
>> +#if 0
>> +/* TODO: handle this when sanitizing cache related registers */
>> static const struct arm64_ftr_bits ftr_dczid[] =3D {
>> 	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_EXACT, DCZID_DZP_SHIFT, 1, =
1),
>> 	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, DCZID_BS_SHIFT,=
 4, 0),
>> 	ARM64_FTR_END,
>> };
>> +#endif
>>=20
>> static const struct arm64_ftr_bits ftr_id_isar0[] =3D {
>> 	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_ISAR0_DIVIDE_=
SHIFT, 4, 0),
>> @@ -444,11 +451,15 @@ static const struct arm64_ftr_bits ftr_id_dfr1[] =
=3D {
>> 	ARM64_FTR_END,
>> };
>>=20
>> +#if 0
>> +/* TODO: use this to sanitize SVE once we support it */
>> +
>> static const struct arm64_ftr_bits ftr_zcr[] =3D {
>> 	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE,
>> 		ZCR_ELx_LEN_SHIFT, ZCR_ELx_LEN_SIZE, 0),	/* LEN */
>> 	ARM64_FTR_END,
>> };
>> +#endif
>>=20
>> /*
>>  * Common ftr bits for a 32bit register with all hidden, strict
>> @@ -502,3 +513,113 @@ static s64 arm64_ftr_safe_value(const struct arm64=
_ftr_bits *ftrp, s64 new,
>>  * End of imported linux structures and code
>>  */
>>=20
>> +static void sanitize_reg(u64 *cur_reg, u64 new_reg, const char *reg_nam=
e,
>> +						const struct arm64_ftr_bits *ftrp)
>> +{
>> +	int taint =3D 0;
>> +	u64 old_reg =3D *cur_reg;
>> +
>> +	for (;ftrp->width !=3D 0;ftrp++)
>> +	{
>> +		u64 mask;
>> +		s64 cur_field =3D arm64_ftr_value(ftrp, *cur_reg);
>> +		s64 new_field =3D arm64_ftr_value(ftrp, new_reg);
>> +
>> +		if (cur_field =3D=3D new_field)
>> +			continue;
>> +
>> +		if (ftrp->strict)
>> +			taint =3D 1;
>> +
>> +		mask =3D arm64_ftr_mask(ftrp);
>> +
>> +		*cur_reg &=3D ~mask;
>> +		*cur_reg |=3D (arm64_ftr_safe_value(ftrp, new_field, cur_field)
>> +					<< ftrp->shift) & mask;
>=20
> I wonder why you haven't also imported arm64_ftr_set_value?  This seems
> to be the open-coded version of it.

You are right I could have used it instead (no idea why I did not).

I will modify that and send an update.

Good finding :-)

>=20
>=20
>> +	}
>> +
>> +	if (old_reg !=3D new_reg)
>> +		printk(XENLOG_DEBUG "SANITY DIF: %s 0x%"PRIx64" -> 0x%"PRIx64"\n",
>> +				reg_name, old_reg, new_reg);
>> +	if (old_reg !=3D *cur_reg)
>> +		printk(XENLOG_DEBUG "SANITY FIX: %s 0x%"PRIx64" -> 0x%"PRIx64"\n",
>> +				reg_name, old_reg, *cur_reg);
>> +
>> +	if (taint)
>> +	{
>> +		printk(XENLOG_WARNING "SANITY CHECK: Unexpected variation in %s.\n",
>> +				reg_name);
>> +		add_taint(TAINT_CPU_OUT_OF_SPEC);
>> +	}
>> +}
>> +
>> +
>> +/*
>> + * This function should be called on secondary cores to sanitize the bo=
ot cpu
>> + * cpuinfo.
>> + */
>> +void update_system_features(const struct cpuinfo_arm *new)
>> +{
>> +
>> +#define SANITIZE_REG(field, num, reg)  \
>> +	sanitize_reg(&system_cpuinfo.field.bits[num], new->field.bits[num], \
>> +				 #reg, ftr_##reg)
>> +
>> +#define SANITIZE_ID_REG(field, num, reg)  \
>> +	sanitize_reg(&system_cpuinfo.field.bits[num], new->field.bits[num], \
>> +				#reg, ftr_id_##reg)
>> +
>> +#define SANITIZE_RAZ_REG(field, num, reg)  \
>> +	sanitize_reg(&system_cpuinfo.field.bits[num], new->field.bits[num], \
>> +				#reg, ftr_raz)
>> +
>> +#define SANITIZE_GENERIC_REG(field, num, reg)  \
>> +	sanitize_reg(&system_cpuinfo.field.bits[num], new->field.bits[num], \
>> +				#reg, ftr_generic_32bits)
>> +
>> +	SANITIZE_ID_REG(pfr64, 0, aa64pfr0);
>> +	SANITIZE_ID_REG(pfr64, 1, aa64pfr1);
>> +
>> +	SANITIZE_ID_REG(dbg64, 0, aa64dfr0);
>> +	SANITIZE_RAZ_REG(dbg64, 1, aa64dfr1);
>> +
>> +	SANITIZE_ID_REG(mm64, 0, aa64mmfr0);
>> +	SANITIZE_ID_REG(mm64, 1, aa64mmfr1);
>> +	SANITIZE_ID_REG(mm64, 2, aa64mmfr2);
>> +
>> +	SANITIZE_ID_REG(isa64, 0, aa64isar0);
>> +	SANITIZE_ID_REG(isa64, 1, aa64isar1);
>> +
>> +	SANITIZE_ID_REG(zfr64, 0, aa64zfr0);
>> +
>> +	if ( cpu_feature64_has_el0_32(&system_cpuinfo) )
>> +	{
>> +		SANITIZE_ID_REG(pfr32, 0, pfr0);
>> +		SANITIZE_ID_REG(pfr32, 1, pfr1);
>> +		SANITIZE_ID_REG(pfr32, 2, pfr2);
>> +
>> +		SANITIZE_ID_REG(dbg32, 0, dfr0);
>> +		SANITIZE_ID_REG(dbg32, 1, dfr1);
>> +
>> +		SANITIZE_ID_REG(mm32, 0, mmfr0);
>> +		SANITIZE_GENERIC_REG(mm32, 1, mmfr1);
>> +		SANITIZE_GENERIC_REG(mm32, 2, mmfr2);
>> +		SANITIZE_GENERIC_REG(mm32, 3, mmfr3);
>> +		SANITIZE_ID_REG(mm32, 4, mmfr4);
>> +		SANITIZE_ID_REG(mm32, 5, mmfr5);
>> +
>> +		SANITIZE_ID_REG(isa32, 0, isar0);
>> +		SANITIZE_GENERIC_REG(isa32, 1, isar1);
>> +		SANITIZE_GENERIC_REG(isa32, 2, isar2);
>> +		SANITIZE_GENERIC_REG(isa32, 3, isar3);
>> +		SANITIZE_ID_REG(isa32, 4, isar4);
>> +		SANITIZE_ID_REG(isa32, 5, isar5);
>> +		SANITIZE_ID_REG(isa32, 6, isar6);
>> +
>> +		SANITIZE_GENERIC_REG(mvfr, 0, mvfr0);
>> +		SANITIZE_GENERIC_REG(mvfr, 1, mvfr1);
>> +#ifndef MVFR2_MAYBE_UNDEFINED
>> +		SANITIZE_REG(mvfr, 2, mvfr2);
>> +#endif
>> +	}
>> +}
>=20
> Looking at the list of registers we are sanitizing here we are only
> missing aux32 and aux64 compared to struct cpuinfo_arm. Is that because
> there is nothing to sanitize there?

Aux registers have no standard bit definition and as such cannot be treated=
.
Linux is doing the same.

Cheers
Bertrand




