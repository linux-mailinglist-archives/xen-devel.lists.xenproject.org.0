Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C345C6E2441
	for <lists+xen-devel@lfdr.de>; Fri, 14 Apr 2023 15:29:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.521137.809474 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pnJU4-0002R2-7i; Fri, 14 Apr 2023 13:29:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 521137.809474; Fri, 14 Apr 2023 13:29:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pnJU4-0002Oh-4h; Fri, 14 Apr 2023 13:29:00 +0000
Received: by outflank-mailman (input) for mailman id 521137;
 Fri, 14 Apr 2023 13:28:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Krav=AF=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1pnJU2-0002OK-KG
 for xen-devel@lists.xenproject.org; Fri, 14 Apr 2023 13:28:58 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on062d.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4d26f363-dac8-11ed-b21e-6b7b168915f2;
 Fri, 14 Apr 2023 15:28:54 +0200 (CEST)
Received: from DB8PR06CA0009.eurprd06.prod.outlook.com (2603:10a6:10:100::22)
 by AS8PR08MB8491.eurprd08.prod.outlook.com (2603:10a6:20b:566::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Fri, 14 Apr
 2023 13:28:52 +0000
Received: from DBAEUR03FT013.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:100:cafe::f1) by DB8PR06CA0009.outlook.office365.com
 (2603:10a6:10:100::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.36 via Frontend
 Transport; Fri, 14 Apr 2023 13:28:52 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT013.mail.protection.outlook.com (100.127.142.222) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6298.29 via Frontend Transport; Fri, 14 Apr 2023 13:28:51 +0000
Received: ("Tessian outbound 5bb4c51d5a1f:v136");
 Fri, 14 Apr 2023 13:28:51 +0000
Received: from ad04a3c511c1.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0CD39F26-1907-4FCF-BD32-365204672364.1; 
 Fri, 14 Apr 2023 13:28:45 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ad04a3c511c1.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 14 Apr 2023 13:28:45 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by GV1PR08MB7732.eurprd08.prod.outlook.com (2603:10a6:150:53::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.43; Fri, 14 Apr
 2023 13:28:43 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6b4f:579f:6dca:8b91]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6b4f:579f:6dca:8b91%5]) with mapi id 15.20.6298.030; Fri, 14 Apr 2023
 13:28:42 +0000
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
X-Inumbo-ID: 4d26f363-dac8-11ed-b21e-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=snhBR0/mjQ5oUipLv/cbHjCeqCM07eecgS70/ZHYkqA=;
 b=CLGQoFgfnVJstUBhVeTem5FqptzgBX1j1lGcpv3dH/lEbPUYciZjgPDmM+ixrAgvsOB69rWNcSMuNSg3zlqFB/uc85/nlt2V8T1vAAQM3Z3rzHcMot1SohwEeB1g/Q0v7Y8mSA7q9oJgBF181bZD5GRp13Rek1fUs1FjN9m09qU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9b15a0689fb03e2f
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O3o23tdmV2j6qcD/+sg5XY85DhZ3bYZyLFuLkkp6kY/p9BUa54t5HBoZIMZM/29p3OhMEARayQ0u9+B08lmhA3bdp9S18LZ+6/6YjMbDHOvbOSQHet4HizmPBXq1zD9xuqNS9+zke6Irb+LdVKY7Yb6OxalMF4a87L1wNA7LefwN0G6l1lfahg1qqqVvWN4tPp9zp/TO7aFjsHSdBgInfUJenmu6Cf+QLgoYzV2rMKU0RgYiaywAF0dEpHGr2zfGEUTqs/1gleXNmSLzaePw1DxV5/Gk23XJpbQvh/6hyA8S52XqSJwPRcTs6Y/4HEq7U3MjWRHXevBIk3JX26Au1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=snhBR0/mjQ5oUipLv/cbHjCeqCM07eecgS70/ZHYkqA=;
 b=PR4kRNhorLgBA0TL6UW2HCSTaw5XDCb4HGnvy0QScV4gRlM0Cu7HUbuW40F25mcu51785sHBWG2XA6sOQbL3ahvjIS/+p5kaiEfiZY6sn07QMOuO7S3RhC8aj9PwyLUaWmuHKe5YXHBLjcHZlTbfKor3229HfS3uCBj18x4FTyuo37k0PNjwFfThnxlnEFdp6sWvkVfx136wIdu7Rc/wUg8UhhCh4eiftpD2C2dmq6Ce60UVlljDC4GW0uowWoQ1F8/yRkKt2VHQOwU+gOpcLHPJkXdayBfKq78fsZhSS5Xg694UU5qW7Dn9DkbXc6AXuVGeCYWc38OT+l8EBjE2nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=snhBR0/mjQ5oUipLv/cbHjCeqCM07eecgS70/ZHYkqA=;
 b=CLGQoFgfnVJstUBhVeTem5FqptzgBX1j1lGcpv3dH/lEbPUYciZjgPDmM+ixrAgvsOB69rWNcSMuNSg3zlqFB/uc85/nlt2V8T1vAAQM3Z3rzHcMot1SohwEeB1g/Q0v7Y8mSA7q9oJgBF181bZD5GRp13Rek1fUs1FjN9m09qU=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v5 01/12] xen/arm: enable SVE extension for Xen
Thread-Topic: [PATCH v5 01/12] xen/arm: enable SVE extension for Xen
Thread-Index: AQHZbSQxNKEijLDBi06LhQ6zHwegOK8pMc0AgAGd7gA=
Date: Fri, 14 Apr 2023 13:28:42 +0000
Message-ID: <8C042AAE-8256-488C-92C6-E4C0B5DEB3C1@arm.com>
References: <20230412094938.2693890-1-luca.fancellu@arm.com>
 <20230412094938.2693890-2-luca.fancellu@arm.com>
 <190AEC88-68BE-4DEA-84D5-9DDF0F63A365@arm.com>
In-Reply-To: <190AEC88-68BE-4DEA-84D5-9DDF0F63A365@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|GV1PR08MB7732:EE_|DBAEUR03FT013:EE_|AS8PR08MB8491:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c3b403b-afad-491d-aa7c-08db3cec300f
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 ElOEsLgAC++ZrJMXt0wODsLoHfu4XhSVFlp7SotoHf7Ym2A43kT2cCQAjvX1Z7Z0+ikcp+XjBtMG9SZZMekbS/496CtCmBGieaQeUzxFe7cfK0MAczT2RsdxybngFgMJWgDUxwcZsWyqv06i6M4wlhhG7WB+eqNF5VWP1Mg4XJp2lGAqmeSM4K9cqxBzpc2X17jhh977rhOxK4FAwdMbyOkpbA4dwd7d2TYZoHH+jKsBEHAnANp1eFJIhtMnKVsNiZi3j1fxYtGW9+/t2oXDJ6Y20g3yn6jXyzVfcQxxuFXc2NWh0fLnCL06pbftyBEJdTctFDyW8bNATwv7A9GRetzZP92W6GkRGvoztCZ+XITODZQ35qUATt26AjrfcZnbAgUzWrSzXPlOEeJKjrI1Kxrzgo8cha3/gS19YtGOmdJZ/96IY2brC+yLy7/udOCm9l3wYpyclasyGfbc9rJgK35wGm4tHvXS1f/gF0prv4inkxPJGI62YOJXMp7OzH5aAs3pKRkWZjOQN+9qKxpp3f6XnkuEfYOX2WSunlnp0N1PHF5Lh+ncN+nx04Xlu+0iYGqCHVRbG/Qx2eN/bvK04sbtlzqnXeDMg0qC9fS66dLn6s6CEq+zVD2ANw0fMv7AYDdvmgNnITLs7B5gVya/tQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(346002)(136003)(39860400002)(376002)(396003)(451199021)(37006003)(4326008)(54906003)(6636002)(6486002)(66476007)(64756008)(91956017)(66556008)(66946007)(66446008)(76116006)(316002)(186003)(53546011)(6512007)(6506007)(26005)(38100700002)(2616005)(83380400001)(5660300002)(8676002)(6862004)(8936002)(41300700001)(478600001)(71200400001)(86362001)(36756003)(33656002)(38070700005)(122000001)(2906002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <C630C58CB4E1CE438F3168FBDF313329@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7732
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ce1f7720-5c70-4dfb-e03a-08db3cec2ab1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	82vQjQTbCotXVhMtalVvZns+MatpACoC6+L1QBkQflSesIChuY55h1+JFwV+o8n0yHYOJo2Dmf4GbBjOFMUvj4RBIu+im6n8YsRdae73DkUXzNWrbMzjqp712rje3IM+TOgNjxyMP+NnHpW0VxLdqFAHYQMvG11ctzprfO/m8yQSAoN1b9gibQfOOYSaFpG/bXHMg4ChbLfJICWmGlUYlnVOiyoWTmDyIITKfc9qKDT1VSqmqLsxDNfEXMiLlbOfMukRva7miCXTS5nl6tmuFaYJgO2ZY9d2Td9VnunDuX/abePMwBwL67ZKVzWguvF/eCf/b8kG+Vh6xuHFZLR+nhoNyYiV5yW/+cQoVhYznSHkYAlDA0NENAhRCDxwjiDhsOBTMyIj7ZIQxP/ld8PxYAVc0/wi7BCWMmeeCPdVqd2kNc8i8FJVasqfEZn6IfF2iB2XrJlAQjj5PLCIO2PvGksUlMs9Y5bkQCD3XrQrC4o8PiMV/QmIaR7aym3Zn0Q9lNX9IcOlFepip6umzxgGcv5wU86yJ8ml9aM3yNXTgnmDDCkmKjTejdadjxgmxNW9NMGJ9m0/6MACbvmhYC+O0dhqOYFrmxJPp/twSnGbqc+nWObmme0RKbu6nf3IObEsYeD8R0B0+HB7+OmZyTmiRPq+CgHe3qsou5P4/NIqZqgAxm6iY6TmNJGGYPQY4YfW2ZBjALGDO4quKY5wpZTQlQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(346002)(376002)(396003)(451199021)(40470700004)(36840700001)(46966006)(36860700001)(40480700001)(82740400003)(2616005)(336012)(47076005)(53546011)(40460700003)(107886003)(6512007)(2906002)(6506007)(33656002)(186003)(26005)(82310400005)(81166007)(356005)(8936002)(83380400001)(86362001)(70206006)(70586007)(478600001)(6486002)(36756003)(6636002)(5660300002)(6862004)(4326008)(316002)(8676002)(54906003)(41300700001)(37006003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2023 13:28:51.9026
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c3b403b-afad-491d-aa7c-08db3cec300f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8491



> On 13 Apr 2023, at 13:47, Bertrand Marquis <Bertrand.Marquis@arm.com> wro=
te:
>=20
> Hi Luca,
>=20
>> On 12 Apr 2023, at 11:49, Luca Fancellu <Luca.Fancellu@arm.com> wrote:
>>=20
>> Enable Xen to handle the SVE extension, add code in cpufeature module
>> to handle ZCR SVE register, disable trapping SVE feature on system
>> boot only when SVE resources are accessed.
>> While there, correct coding style for the comment on coprocessor
>> trapping.
>>=20
>> Now cptr_el2 is part of the domain context and it will be restored
>> on context switch, this is a preparation for saving the SVE context
>> which will be part of VFP operations, so restore it before the call
>> to save VFP registers.
>> To save an additional isb barrier, restore cptr_el2 before an
>> existing isb barrier and move the call for saving VFP context after
>> that barrier.
>>=20
>> Change the KConfig entry to make ARM64_SVE symbol selectable, by
>> default it will be not selected.
>>=20
>> Create sve module and sve_asm.S that contains assembly routines for
>> the SVE feature, this code is inspired from linux and it uses
>> instruction encoding to be compatible with compilers that does not
>> support SVE.
>>=20
>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>> ---
>> Changes from v4:
>> - don't use fixed types in vl_to_zcr, forgot to address that in
>>  v3, by mistake I changed that in patch 2, fixing now (Jan)
>> Changes from v3:
>> - no changes
>> Changes from v2:
>> - renamed sve_asm.S in sve-asm.S, new files should not contain
>>  underscore in the name (Jan)
>> Changes from v1:
>> - Add assert to vl_to_zcr, it is never called with vl=3D=3D0, but just
>>  to be sure it won't in the future.
>> Changes from RFC:
>> - Moved restoring of cptr before an existing barrier (Julien)
>> - Marked the feature as unsupported for now (Julien)
>> - Trap and un-trap only when using SVE resources in
>>  compute_max_zcr() (Julien)
>> ---
>> xen/arch/arm/Kconfig                     | 10 +++--
>> xen/arch/arm/arm64/Makefile              |  1 +
>> xen/arch/arm/arm64/cpufeature.c          |  7 ++--
>> xen/arch/arm/arm64/sve-asm.S             | 48 +++++++++++++++++++++++
>> xen/arch/arm/arm64/sve.c                 | 50 ++++++++++++++++++++++++
>> xen/arch/arm/cpufeature.c                |  6 ++-
>> xen/arch/arm/domain.c                    |  9 +++--
>> xen/arch/arm/include/asm/arm64/sve.h     | 43 ++++++++++++++++++++
>> xen/arch/arm/include/asm/arm64/sysregs.h |  1 +
>> xen/arch/arm/include/asm/cpufeature.h    | 14 +++++++
>> xen/arch/arm/include/asm/domain.h        |  1 +
>> xen/arch/arm/include/asm/processor.h     |  2 +
>> xen/arch/arm/setup.c                     |  5 ++-
>> xen/arch/arm/traps.c                     | 28 +++++++------
>> 14 files changed, 201 insertions(+), 24 deletions(-)
>> create mode 100644 xen/arch/arm/arm64/sve-asm.S
>> create mode 100644 xen/arch/arm/arm64/sve.c
>> create mode 100644 xen/arch/arm/include/asm/arm64/sve.h
>>=20
>> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
>> index 239d3aed3c7f..41f45d8d1203 100644
>> --- a/xen/arch/arm/Kconfig
>> +++ b/xen/arch/arm/Kconfig
>> @@ -112,11 +112,15 @@ config ARM64_PTR_AUTH
>> This feature is not supported in Xen.
>>=20
>> config ARM64_SVE
>> - def_bool n
>> + bool "Enable Scalar Vector Extension support (UNSUPPORTED)" if UNSUPPO=
RTED
>> depends on ARM_64
>> help
>> -  Scalar Vector Extension support.
>> -  This feature is not supported in Xen.
>> +  Scalar Vector Extension (SVE/SVE2) support for guests.
>=20
> I would prevent to mention SVE2 here unless both versions of SVE are supp=
orted with this config.
> Is it the case ?

Hi Bertrand,

Yes both versions of SVE are supported with this config, SVE2 is a superset=
 of SVE that includes new
instructions, but the work done in this serie for registers settings and co=
ntext switch will apply to both
versions.

>=20
> Cheers
> Bertrand


