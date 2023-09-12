Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27BA879C135
	for <lists+xen-devel@lfdr.de>; Tue, 12 Sep 2023 02:44:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.599839.935422 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfrVc-0007wg-U8; Tue, 12 Sep 2023 00:44:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 599839.935422; Tue, 12 Sep 2023 00:44:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfrVc-0007tZ-Qv; Tue, 12 Sep 2023 00:44:04 +0000
Received: by outflank-mailman (input) for mailman id 599839;
 Tue, 12 Sep 2023 00:44:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O/bM=E4=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qfrVb-0007tN-Cg
 for xen-devel@lists.xenproject.org; Tue, 12 Sep 2023 00:44:03 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0601.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7770e1f1-5105-11ee-8786-cb3800f73035;
 Tue, 12 Sep 2023 02:44:01 +0200 (CEST)
Received: from AS9PR06CA0179.eurprd06.prod.outlook.com (2603:10a6:20b:45c::9)
 by AS2PR08MB9200.eurprd08.prod.outlook.com (2603:10a6:20b:59f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.36; Tue, 12 Sep
 2023 00:43:57 +0000
Received: from AM7EUR03FT056.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:45c:cafe::21) by AS9PR06CA0179.outlook.office365.com
 (2603:10a6:20b:45c::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.35 via Frontend
 Transport; Tue, 12 Sep 2023 00:43:57 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT056.mail.protection.outlook.com (100.127.140.107) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6792.16 via Frontend Transport; Tue, 12 Sep 2023 00:43:57 +0000
Received: ("Tessian outbound 0b7d6027328f:v175");
 Tue, 12 Sep 2023 00:43:57 +0000
Received: from 9c137dc5a0c0.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5AFA3396-8FA9-4B8C-BA74-7943F3CAB411.1; 
 Tue, 12 Sep 2023 00:43:50 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9c137dc5a0c0.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 12 Sep 2023 00:43:50 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DB4PR08MB9381.eurprd08.prod.outlook.com (2603:10a6:10:3f3::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.31; Tue, 12 Sep
 2023 00:43:48 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::7083:22dc:6b5f:5965]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::7083:22dc:6b5f:5965%7]) with mapi id 15.20.6768.029; Tue, 12 Sep 2023
 00:43:48 +0000
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
X-Inumbo-ID: 7770e1f1-5105-11ee-8786-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LnOd2v9u8uxlV4pBGlodF00l3Gey+fcGZxtTRdArrKI=;
 b=ClqzD+Wwnx6w0rTstgF7gpqEy2b0j6/QsJBxP/Xj5uHK6pLkHJ5FEst7Zh3EoolEI/zOqaExmRwWTMClpRJN3xicK6wFpPBqraHVdBGuN0fDJkyWuPF7FVHz9754Ey7oiLcXb6DcRY8kp7a0OJG+zvtb4Cs896FUH8Wf/vFIBgI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7802d9f1c62564ff
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZVbJEFyIbeoRcsOAXg6ndqBhtdbDivpx/xe2QoJz7Y2NIyczYMMfg3+2uWUskxoFEWphu+6oxJZjvZ3WUV/iE9V1kVxxb3gtyfDVN4c1DSPev5mX3NP4NBPMY7ZmaT3canWRShco39j1ZKlZcH79RntXY5Kdg9H2hHxbdEH69tnWorY6ASXFUzTOmocjb4lEEC5l2edVt/R2rehI7K0+m08L4OE587kMcRWaUQyRD4viqyv/D0J35d6FXtZysDbmKhaHz/jK126qSv97z0IIc8kPJuCREUgCUiadyE/EXL+NqPH6t482VmHgiXM73N962HyK9J5x7SFdk6P3IGVXgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LnOd2v9u8uxlV4pBGlodF00l3Gey+fcGZxtTRdArrKI=;
 b=KG4IZBos88RL0UYTv9xkbK8jEeX3AdJeecu5eUDnjSRuVQ4qoCnss9wlxtdbKgNt2sAR+CzpZ83jETJE/JWgZJG+SX/uMJfFElymFTpbR1OIFuD0UiTG1/X2tVycQElRXj4Rp7S6zMNKOT9COyhahIGDJoRltZ/G/89/gKb/LFdS0vxhSi21ZkXlnLNwup8omg/akJfcIMTNR8bcmdGw7IPaOvSqjQqdBhCKehTLVHplUI9swiN24mMRIXNAWG1J4l3heIkhPDxqYDo0J1mA+weV5kwGiL6k28NcX5Ly9XUwPFDscYNHk35Py2otRaflWuasRvLp8+qvBY/IUpUyBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LnOd2v9u8uxlV4pBGlodF00l3Gey+fcGZxtTRdArrKI=;
 b=ClqzD+Wwnx6w0rTstgF7gpqEy2b0j6/QsJBxP/Xj5uHK6pLkHJ5FEst7Zh3EoolEI/zOqaExmRwWTMClpRJN3xicK6wFpPBqraHVdBGuN0fDJkyWuPF7FVHz9754Ey7oiLcXb6DcRY8kp7a0OJG+zvtb4Cs896FUH8Wf/vFIBgI=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>
CC: Ayan Kumar Halder <ayankuma@amd.com>, Xen-devel
	<xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei
 Chen <Wei.Chen@arm.com>, Penny Zheng <Penny.Zheng@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v6 08/13] xen/arm: Fold mmu_init_secondary_cpu() to head.S
Thread-Topic: [PATCH v6 08/13] xen/arm: Fold mmu_init_secondary_cpu() to
 head.S
Thread-Index: AQHZ2U+hoB0xrFr/oU+WCBP7wHF2i7AEJAQAgAAA3gCAEadGgIAApY8A
Date: Tue, 12 Sep 2023 00:43:48 +0000
Message-ID: <B37C194E-F73F-4E79-A62F-41991364C511@arm.com>
References: <20230828013224.669433-1-Henry.Wang@arm.com>
 <20230828013224.669433-9-Henry.Wang@arm.com>
 <19a8b434-3b2d-9e3d-fc05-fc2828d1abbd@amd.com>
 <CE8AF1AE-8F01-4DD8-86EE-12C4AD18E4A0@arm.com>
 <ec41bd05-4a25-438b-84cb-ca86d7bf34d8@xen.org>
In-Reply-To: <ec41bd05-4a25-438b-84cb-ca86d7bf34d8@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DB4PR08MB9381:EE_|AM7EUR03FT056:EE_|AS2PR08MB9200:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f84557a-f72b-46fa-d839-08dbb329595e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 JsuyaejrwiKyrXsxVXul5D8eF0+Sfs73GlDVCW9G34bQDMT6A3lFjQ2VograG8N0fYoHo0x1teOT9HaNUI6HvRhKseLfDaKtY0kW2pmIr0Z/ajHpLuLSzr4OAdrvCuBSuhKYl+williylFhUUVK22OFSd6LuaxNbFCCX4VQahAe3RoqMAPCakUqtGzw9SHiOnUY82QEyZABMLt7Zn1CTsoHvWPVBZjsSb/QD2xaYRkU8S/XnY+CORgVePmonDILOvCfxewBNzBHhqP57/0KKfCcBbcfYB8LcLf6ohZm9e0mvWyfT10qulI1SZnycysvnsHx2xGkmakp0SL1+iXts8QCGK0YF8tRacDn5Q9FG6wPE7PtGOV89sAPjT2W6TKse5AFiG39l2LL5aGB/ATteQm0DBZlXLL6nTKfQ8hqAI8qhiivom2RH3dMbz1MoAPpS4yKK23lshEQ0g8ctMubyV64jEhcrV9Lf/7CZM4rikaHPTZq22W/lEBo7iNVEdIm4bfwJkUTvZZ9zVz4Q7PXMkBtvTiNeMNV1MaGpBd1GnTd0vHvBJOtgy7YXIhz9t+j/111jLCxrFVaQ28mVEK+0/S0XJAw4pNsL4dzV0ghJvi94Z90RG1hpycPqoF/VRHH/+J+HB2Bi5Fx9IjTdiPI5CQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(136003)(376002)(396003)(366004)(186009)(1800799009)(451199024)(71200400001)(53546011)(6506007)(6486002)(6512007)(83380400001)(2616005)(478600001)(2906002)(76116006)(66556008)(66476007)(66946007)(64756008)(66446008)(54906003)(6916009)(26005)(4326008)(8676002)(91956017)(5660300002)(8936002)(316002)(36756003)(33656002)(86362001)(38100700002)(38070700005)(41300700001)(122000001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <FA91719642174F429348E56711A12F43@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB9381
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b2905a36-7d4c-4e3a-26cc-08dbb32953e2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pLCd+8hbejAzCt8jDfp2sbQfR1FPeI1Yct7cp2UW+4bzx1aOEIjU4inXPjdhopCQSY55L3IfxsyYCT/yf5lypTBmPo9+lGiA+4xwfu+Ch3BWZd7RmwIzGG+mTb/XUi+QH+Dov6I5mKlxTEzepJlxGIVx/jYtSRg8IQCXPKTE7GqW/fIKIVt34Wr7jjY0JQQaH0vjYYuf8XKj0QYFOO9k9lnY6gj4W4bboGUOgpGRUZO9IvMu2fVdiY9diDo3jv5D6ab9R/PHODgM2kLSyhLj0IwsbkFVkXNqeUGbd6HeizsHCF+tk5GJkojGZJCJ2jAGt2+Q3E1dGWQIycUPNKan9aDj0WqUi4hwnidfkzkHRjq3x7fFyXDqRs1Exh/riM/YS7B9/1DyFtAGaqNK4KBngErAEZVdjziQIdtXss1zsWGcwgyhvm8Yom++C77KbVYILJWrK77vkQWtPfcpMmQQIoEZDuXQfY/FJx12s0rTA30IWLgE+HvV6VcMxr0xP8irpC7HQu5Ozbbs73SinkfuiOstj/JfO0RjIQsCdiPQ0T76Jvxo1zgJgvLjEQgQyhAFxN15xoG0WSeRxlXDQgnSELXr550y+gyyZaGDmbVN+q6AI4/xhOt4NBOx/x5rhVP2+oeaRrWNbALTrjn+03O7OhZmiffo5M7MSNEPVByrk59SUFtXye62Pzm9/fku80WgBpuyLOJSR1/qOLPCS/qaFpvXnCTnCCxJBymIG9MGDqZBxY8QcD0HCYs5dOpq1ABk
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(136003)(346002)(396003)(39860400002)(186009)(451199024)(1800799009)(82310400011)(46966006)(40470700004)(36840700001)(81166007)(356005)(70206006)(53546011)(6486002)(6506007)(40460700003)(36756003)(33656002)(40480700001)(86362001)(82740400003)(36860700001)(47076005)(336012)(6512007)(8676002)(26005)(2906002)(478600001)(83380400001)(4326008)(6862004)(5660300002)(8936002)(2616005)(107886003)(41300700001)(316002)(54906003)(70586007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2023 00:43:57.6851
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f84557a-f72b-46fa-d839-08dbb329595e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9200

Hi Julien,

> On Sep 11, 2023, at 22:51, Julien Grall <julien@xen.org> wrote:
> On 31/08/2023 10:16, Henry Wang wrote:
>>> On Aug 31, 2023, at 17:12, Ayan Kumar Halder <ayankuma@amd.com> wrote:
>>>=20
>>> Hi Henry,
>>>=20
>>> On 28/08/2023 02:32, Henry Wang wrote:
>>>>=20
>>>> diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
>>>> index 33b038e7e0..39218cf15f 100644
>>>> --- a/xen/arch/arm/arm32/head.S
>>>> +++ b/xen/arch/arm/arm32/head.S
>>>> @@ -83,6 +83,25 @@
>>>>          isb
>>>>  .endm
>>>>=20
>>>> +/*
>>>> + * Enforce Xen page-tables do not contain mapping that are both
>>>> + * Writable and eXecutables.
>>>> + *
>>>> + * This should be called on each secondary CPU.
>>>> + */
>>>> +.macro pt_enforce_wxn tmp
>>>> +        mrc   CP32(\tmp, HSCTLR)
>>>> +        orr   \tmp, \tmp, #SCTLR_Axx_ELx_WXN
>>>> +        dsb
>>>> +        mcr   CP32(\tmp, HSCTLR)
>>>> +        /*
>>>> +         * The TLBs may cache SCTLR_EL2.WXN. So ensure it is synchron=
ized
>>>> +         * before flushing the TLBs.
>>>> +         */
>>>> +        isb
>>>> +        flush_xen_tlb_local \tmp
>>>> +.endm
>>>> +
>>>>  /*
>>>>   * Common register usage in this file:
>>>>   *   r0  -
>>>> @@ -254,6 +273,7 @@ secondary_switched:
>>>>          /* Use a virtual address to access the UART. */
>>>>          mov_w r11, EARLY_UART_VIRTUAL_ADDRESS
>>>>  #endif
>>>> +        pt_enforce_wxn
>>>> =20
>>>=20
>>> Can you move ^^^ to before "#ifdef CONFIG_EARLY_PRINTK" so that the MMU=
 related functionality are bundled together?
>>>=20
>>> Also AFAIU, mov_w has not effect on pt_enforce_wxn().
>>>=20
>>> So that I can create a function "enable_secondary_cpu_mm()" - similar t=
o one you introduced for arm64
>> Sure, I am good with this if other maintainers do not have any objection=
s.
>=20
> I am objecting. It would be quite handy to print a message on the console=
 to indicate that we are enforce WXN. So we want to update UART address (st=
ored in r11) before hand.

Good idea about the printing, I am happy to add a printed message on top of=
 the macro saying that we are enforcing WXN from here if you agree.

Kind regards,
Henry

>=20
> Cheers,
>=20
> --=20
> Julien Grall


