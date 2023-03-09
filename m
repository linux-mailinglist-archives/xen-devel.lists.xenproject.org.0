Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A88E6B2400
	for <lists+xen-devel@lfdr.de>; Thu,  9 Mar 2023 13:20:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.508246.782721 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1paFEy-0006am-2Y; Thu, 09 Mar 2023 12:19:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 508246.782721; Thu, 09 Mar 2023 12:19:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1paFEx-0006Xu-VV; Thu, 09 Mar 2023 12:19:23 +0000
Received: by outflank-mailman (input) for mailman id 508246;
 Thu, 09 Mar 2023 12:19:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V3pJ=7B=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1paFEw-0006Xo-Ew
 for xen-devel@lists.xenproject.org; Thu, 09 Mar 2023 12:19:22 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2062c.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9c97c070-be74-11ed-956e-85ef70e17bfa;
 Thu, 09 Mar 2023 13:19:17 +0100 (CET)
Received: from AM5PR0101CA0023.eurprd01.prod.exchangelabs.com
 (2603:10a6:206:16::36) by PAVPR08MB10338.eurprd08.prod.outlook.com
 (2603:10a6:102:30d::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.19; Thu, 9 Mar
 2023 12:19:15 +0000
Received: from VI1EUR03FT007.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:16:cafe::a2) by AM5PR0101CA0023.outlook.office365.com
 (2603:10a6:206:16::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29 via Frontend
 Transport; Thu, 9 Mar 2023 12:19:15 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT007.mail.protection.outlook.com (100.127.144.86) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.19 via Frontend Transport; Thu, 9 Mar 2023 12:19:14 +0000
Received: ("Tessian outbound c2bcb4c18c29:v135");
 Thu, 09 Mar 2023 12:19:14 +0000
Received: from b7d79e1fde92.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 563B6907-C1EA-4778-989E-58BB0D34374C.1; 
 Thu, 09 Mar 2023 12:19:08 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b7d79e1fde92.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 09 Mar 2023 12:19:08 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AS8PR08MB8299.eurprd08.prod.outlook.com (2603:10a6:20b:56f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.18; Thu, 9 Mar
 2023 12:19:06 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::806c:fd65:92cf:7b7a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::806c:fd65:92cf:7b7a%7]) with mapi id 15.20.6178.019; Thu, 9 Mar 2023
 12:19:05 +0000
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
X-Inumbo-ID: 9c97c070-be74-11ed-956e-85ef70e17bfa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c2Y77HtL4cv+QaJCpgXlOoNGw3B+nCspZ6c4cjvQfsg=;
 b=lIB4OCM2m3gn2wvYOKufPbfr6GHhx0DkrxhCSgktAkI5/wIjGv/HhWYCCkZwS4ZiuBQ2DlZ+SfpcFmdYu65rYx7LxyhNKVVVI3ZVGtpqoUBUCzkXwUVnFo7T/9Jm/tcq6eI2yGVFgHpMYaBu1g7mDDPj7UhxsT1gjZQGjK4RG0s=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7eca62ed57b32ad3
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lOpPHtPp2niL4lHyrIqnmjPN1lXGkUer/GRMG+KmtU2qE2zySIgTs0HlK4RMEEOpU/h2bETFjSOPMyGL1qtgobsgDyI2Iffsa7JA2UwwMwCgBhIgFsSggH1g81rqPPay22Fmb7dnbHrynYauP+yFP0fIfP2f8uaLsNqRvPghZupBF4eYRxxBHMqJ7UjFNkvdTGDiyvT+Tl6Ap9+6APkD6/c+EA2XAdl+sZ9A5u76KHryWrVBZYOcFtsRQCHKbRzMj6xe48kaePAXSMSxRcVBuPNyufAXQJsj4175sEl0zqqLwtKp8nw7xFnn8KOTg7l94ZtPe+jr7vTbrfaHqeuUwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c2Y77HtL4cv+QaJCpgXlOoNGw3B+nCspZ6c4cjvQfsg=;
 b=DtrC0RUVYCSgntLMgfu+3cfGACL6x9nMht3vX7S90hJfo9mCHX/OwtPG8WJD4dfY83LLMOlsZ1C22CBeErz5lfjC8YdoRM+EgzWIShcSL7+ZPtiwaLFMkNtF3Ju7PC5tRg8I1+Oh2Dwd7NWNUvB5LSJivEmkmBoxfmjFpkc6ETHNyw3G4jKg+a+sfW/gy+LPhdoxCV+O0BM3SDrjGnf/+7be5o2UvBksoFxhG9HlOAo6N/ZuasLGR5f7fK2YaE7jft3HPfxE7jxBddBYEP5vRMR6vD0+B/U6SlGBUWNqlI9AqJ/KU85YNKiH7gRp/1umHEm6B1rxSDZ2GFfj83s7vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c2Y77HtL4cv+QaJCpgXlOoNGw3B+nCspZ6c4cjvQfsg=;
 b=lIB4OCM2m3gn2wvYOKufPbfr6GHhx0DkrxhCSgktAkI5/wIjGv/HhWYCCkZwS4ZiuBQ2DlZ+SfpcFmdYu65rYx7LxyhNKVVVI3ZVGtpqoUBUCzkXwUVnFo7T/9Jm/tcq6eI2yGVFgHpMYaBu1g7mDDPj7UhxsT1gjZQGjK4RG0s=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, "Andrei Cherechesu (OSS)"
	<andrei.cherechesu@oss.nxp.com>, Xen-devel <xen-devel@lists.xenproject.org>,
	Andrei Cherechesu <andrei.cherechesu@nxp.com>, Julien Grall <julien@xen.org>
Subject: Re: [PATCH v1 2/2] arch/arm: time: Add support for parsing interrupts
 by names
Thread-Topic: [PATCH v1 2/2] arch/arm: time: Add support for parsing
 interrupts by names
Thread-Index:
 AQHZUN0sbGmRWBiDtEmQnPFLsz5lVK7vc/8AgABafACAAkqcgIAAIo2AgAAJfwCAAA/CAIAADAKA
Date: Thu, 9 Mar 2023 12:19:05 +0000
Message-ID: <D0D43830-5F75-4284-86E5-967E2059B377@arm.com>
References: <20230307100949.9231-1-andrei.cherechesu@oss.nxp.com>
 <20230307100949.9231-3-andrei.cherechesu@oss.nxp.com>
 <370745D6-D6AF-43D0-8E9F-2DB160BE0E07@arm.com>
 <alpine.DEB.2.22.394.2303071301300.863724@ubuntu-linux-20-04-desktop>
 <B58C926D-25FD-4EB6-A83C-229E72E16181@arm.com>
 <7a0734e9-a980-3dc1-026d-0c96a89c4d5c@amd.com>
 <0932C0EB-F90A-45D4-87F4-3594E6E74C64@arm.com>
 <3c0a6e88-2a1a-f06a-cac1-59801b1acfd6@amd.com>
In-Reply-To: <3c0a6e88-2a1a-f06a-cac1-59801b1acfd6@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.400.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|AS8PR08MB8299:EE_|VI1EUR03FT007:EE_|PAVPR08MB10338:EE_
X-MS-Office365-Filtering-Correlation-Id: 24aa982c-2155-47b3-b1b1-08db20987f84
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 DqyjPTf7VYbkjZNYqFOUTkWKWXzqeeBDTreU+MbjFrB4rthtYcU4ZaJVqpee4P/ijHmnr5oDwZIhqcQfjiO0r+hzm89TDuN7VBI78+u22aRtRUsrNkbugBlj2sZ6hhIt56SmBmSMSAWY59dq/Gx5ST5WENt4F9qx9ZhpDJCkegUDsX8yIIiKZiy0n9RqbLj37MVxR9pexXFcYMP9kF0Nbp+Movx8bYGtzPSSB/aqUOWqK3H9HiV2VPsAgxqCwhSAirswYcfaJHwQ2R3n2leneh7nnJFiKIpUMGRKAv/4qLgEs2r0w+GNraHqAsnOmW1k3jbIrsDUrpN8fr9R3wM+kNE5DnC6GnukwKG0DhDOJgdI8qekGiaaGsJaGcyjOLK1mhcT21u527Y/7Bthn5A6bmS0oL2lINKwrWMNdc6JXskXf55ufj879hSgCPKbUfClp0C04swqSuU6qVHZ7aLLy1hp/FXX4eYQuWgA5F6fwWIjx5HkEFaQic6YaS8AZ3KeP1n2nMzXmDwgkp9k5v+7JiR6n1mrwWiq/0Z/IoahmVAoRI4kugYBymyGMDupXeaggC+rpGSLiHY0Uj9PEj49UvuedLNn9uxO3Hf8iCWQ0i0KwLoNln0ri7QdCPzOz7PP4p7BwGo/8kO9EOgBlSWxJbQEnPq9xo9OKI7T9a1LMFfNTjfHupkKzSvccDidBvBZJqdW9Lt0HFMzfdtVixKyRf8Ew1JeHZHvFUFsAQc8hpw=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(376002)(346002)(39860400002)(396003)(136003)(451199018)(36756003)(33656002)(54906003)(478600001)(6486002)(316002)(5660300002)(71200400001)(2906002)(66476007)(8936002)(64756008)(76116006)(91956017)(66556008)(8676002)(66946007)(66446008)(41300700001)(4326008)(6916009)(122000001)(186003)(38070700005)(38100700002)(86362001)(2616005)(53546011)(6512007)(6506007)(83380400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <C165E77BE3688A45AF9C9205D5BEDABD@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8299
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VI1EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5aacc124-5af2-4073-bcd4-08db20987a0e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QClGzfuoJsrhiCn4QnVKyZKKYOwj3fKiaRSlEr8VqAV62sZnLXnizJS8L2OPrKUYiN/s192yOULFls34B3utffmrVx9PGQXFoTYkE4jIhZtJ+JQY1Ngzj4Fp+b1f5MKNDil1XYpbwyqULcvvmCXGDKqPF+JIk4RWXsH44dzMSk8jnfkUXFABi0Y+Wq27HbXO9BQDLQIEgdw7DGHf58OwBDHuGtNc4xTmt77df8H2NSu+kUwuqMBInGwAzdg0qjgtsw4ys1acfp8AD+omqW/Jke5FnOYABwKEbIMJX+p6bWrOLTqifpUCieS1hXIiXFaj7CRIA+ZFVT2GjAiG4szsVGO2VerOUGBuEkktKg6JHtKlsMjIKSXC9JOJ0SqYH454Z8SELrFUd2q0HMQ6Y7BjORbZMrw8Zoa+2Hs/7aVYzxGWWW2k+msT3WEeranrWvR/Vg6Ji0ezGALMkLBraGV9Eai+9+LSb60grxfn2THB5wAlNzBOn+0VEoRhj4B5s8ebg9A8dwrITdWIquMjBLqX8rFl9WfFKv7Nh/5Z53xFkGCCG+d8Fm8whkwiSNN1LgnPD1dCT/2n9iYNqrjfUAKXP1ujQxOwm9NdDA5iJBZ/qjnMyYmkfsOAk/xCLP4joExuUp6XpL8SmJWsXWGFXDkDJlZMcXk+fcH0cDi4P24tGc2358tgtfg/70nHb6lAZeJMs8jWrOVJm/1nGgVbQ7gkWA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(346002)(136003)(39860400002)(376002)(396003)(451199018)(36840700001)(40470700004)(46966006)(33656002)(36756003)(6486002)(186003)(82740400003)(36860700001)(53546011)(336012)(26005)(2616005)(83380400001)(6506007)(47076005)(6512007)(41300700001)(40480700001)(70586007)(8676002)(2906002)(4326008)(70206006)(5660300002)(8936002)(6862004)(356005)(81166007)(86362001)(316002)(478600001)(54906003)(82310400005)(40460700003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2023 12:19:14.8327
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 24aa982c-2155-47b3-b1b1-08db20987f84
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VI1EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB10338

Hi Michal,

> On 9 Mar 2023, at 12:35, Michal Orzel <michal.orzel@amd.com> wrote:
>=20
>=20
>=20
> On 09/03/2023 11:39, Bertrand Marquis wrote:
>>=20
>>=20
>> Hi Michal,
>>=20
>>> On 9 Mar 2023, at 11:05, Michal Orzel <michal.orzel@amd.com> wrote:
>>>=20
>>>=20
>>>=20
>>> On 09/03/2023 09:02, Bertrand Marquis wrote:
>>>>=20
>>>>=20
>>>> Hi Stefano,
>>>>=20
>>>>> On 7 Mar 2023, at 22:02, Stefano Stabellini <sstabellini@kernel.org> =
wrote:
>>>>>=20
>>>>> On Tue, 7 Mar 2023, Bertrand Marquis wrote:
>>>>>>> On 7 Mar 2023, at 11:09, Andrei Cherechesu (OSS) <andrei.cherechesu=
@oss.nxp.com> wrote:
>>>>>>>=20
>>>>>>> From: Andrei Cherechesu <andrei.cherechesu@nxp.com>
>>>>>>>=20
>>>>>>> Added support for parsing the ARM generic timer interrupts DT
>>>>>>> node by the "interrupt-names" property, if it is available.
>>>>>>>=20
>>>>>>> If not available, the usual parsing based on the expected
>>>>>>> IRQ order is performed.
>>>>>>>=20
>>>>>>> Also added the "hyp-virt" PPI to the timer PPI list, even
>>>>>>> though it's currently not in use. If the "hyp-virt" PPI is
>>>>>>> not found, the hypervisor won't panic.
>>>>>>>=20
>>>>>>> Signed-off-by: Andrei Cherechesu <andrei.cherechesu@nxp.com>
>>>>>>> ---
>>>>>>> xen/arch/arm/include/asm/time.h |  3 ++-
>>>>>>> xen/arch/arm/time.c             | 26 ++++++++++++++++++++++----
>>>>>>> 2 files changed, 24 insertions(+), 5 deletions(-)
>>>>>>>=20
>>>>>>> diff --git a/xen/arch/arm/include/asm/time.h b/xen/arch/arm/include=
/asm/time.h
>>>>>>> index 4b401c1110..49ad8c1a6d 100644
>>>>>>> --- a/xen/arch/arm/include/asm/time.h
>>>>>>> +++ b/xen/arch/arm/include/asm/time.h
>>>>>>> @@ -82,7 +82,8 @@ enum timer_ppi
>>>>>>>  TIMER_PHYS_NONSECURE_PPI =3D 1,
>>>>>>>  TIMER_VIRT_PPI =3D 2,
>>>>>>>  TIMER_HYP_PPI =3D 3,
>>>>>>> -    MAX_TIMER_PPI =3D 4,
>>>>>>> +    TIMER_HYP_VIRT_PPI =3D 4,
>>>>>>> +    MAX_TIMER_PPI =3D 5,
>>>>>>> };
>>>>>>>=20
>>>>>>> /*
>>>>>>> diff --git a/xen/arch/arm/time.c b/xen/arch/arm/time.c
>>>>>>> index 433d7be909..794da646d6 100644
>>>>>>> --- a/xen/arch/arm/time.c
>>>>>>> +++ b/xen/arch/arm/time.c
>>>>>>> @@ -38,6 +38,14 @@ uint32_t __read_mostly timer_dt_clock_frequency;
>>>>>>>=20
>>>>>>> static unsigned int timer_irq[MAX_TIMER_PPI];
>>>>>>>=20
>>>>>>> +static const char *timer_irq_names[MAX_TIMER_PPI] =3D {
>>>>>>> +    [TIMER_PHYS_SECURE_PPI] =3D "sec-phys",
>>>>>>> +    [TIMER_PHYS_NONSECURE_PPI] =3D "phys",
>>>>>>> +    [TIMER_VIRT_PPI] =3D "virt",
>>>>>>> +    [TIMER_HYP_PPI] =3D "hyp-phys",
>>>>>>> +    [TIMER_HYP_VIRT_PPI] =3D "hyp-virt",
>>>>>>> +};
>>>>>>> +
>>>>>>=20
>>>>>> I would need some reference or a pointer to some doc to check those.
>>>>>>=20
>>>>>>> unsigned int timer_get_irq(enum timer_ppi ppi)
>>>>>>> {
>>>>>>>  ASSERT(ppi >=3D TIMER_PHYS_SECURE_PPI && ppi < MAX_TIMER_PPI);
>>>>>>> @@ -149,15 +157,25 @@ static void __init init_dt_xen_time(void)
>>>>>>> {
>>>>>>>  int res;
>>>>>>>  unsigned int i;
>>>>>>> +    bool has_names;
>>>>>>> +
>>>>>>> +    has_names =3D dt_property_read_bool(timer, "interrupt-names");
>>>>>>>=20
>>>>>>>  /* Retrieve all IRQs for the timer */
>>>>>>>  for ( i =3D TIMER_PHYS_SECURE_PPI; i < MAX_TIMER_PPI; i++ )
>>>>>>>  {
>>>>>>> -        res =3D platform_get_irq(timer, i);
>>>>>>> -
>>>>>>> -        if ( res < 0 )
>>>>>>> +        if ( has_names )
>>>>>>> +            res =3D platform_get_irq_byname(timer, timer_irq_names=
[i]);
>>>>>>> +        else
>>>>>>> +            res =3D platform_get_irq(timer, i);
>>>>>>> +
>>>>>>> +        if ( res > 0 )
>>>>>>=20
>>>>>> The behaviour of the code is changed here compared to the current
>>>>>> version as res =3D 0 will now generate a panic.
>>>>>>=20
>>>>>> Some device tree might not specify an interrupt number and just put
>>>>>> 0 and Xen will now panic on those systems.
>>>>>> As I have no idea if such systems exists and the behaviour is modifi=
ed
>>>>>> you should justify this and mention it in the commit message or keep
>>>>>> the old behaviour and let 0 go through without a panic.
>>>>>>=20
>>>>>> @stefano, julien any idea here ? should just keep the old behaviour =
?
>>>>>=20
>>>>> platform_get_irq returns 0 if the irq is 0. The irq cannot be 0 becau=
se
>>>>> 0 is reserved for SGIs, not PPIs. So I think it is OK to consider 0 a=
n
>>>>> error.
>>>>=20
>>>> Problem here is that a DTB might not specify all interrupts and just p=
ut
>>>> 0 for the one not used (or not available for example if you have no se=
cure
>>>> world).
>>> Xen requires presence of EL3,EL2 and on such system, at least the follo=
wing timers needs to be there
>>> according to Arm ARM:
>>> - EL3 phys (if EL3 is there)
>>=20
>> This might be needed by EL3 but not by Xen.
> Xen requires system with EL3 and if there is EL3, both Arm spec and dt bi=
ndings requires sec-phys timer to be there.
> So it would be very strange to see a fake interrupt with IRQ being 0. But=
 if we relly want to only care about
> what Xen needs, then we could live with that (although it is difficult fo=
r me to find justification for 0 there).
> Device trees are created per system and if system has EL3, then why forci=
ng 0 to be listed for sec-phys timer?
>=20

Let's see that on the other angle: why should Xen check stuff that it does =
not need ?

Bertrand

> ~Michal


