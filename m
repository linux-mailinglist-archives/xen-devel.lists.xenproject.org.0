Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E2E275BF52
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jul 2023 09:06:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.567374.886339 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMkCG-0008TX-60; Fri, 21 Jul 2023 07:05:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 567374.886339; Fri, 21 Jul 2023 07:05:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMkCG-0008Rs-2f; Fri, 21 Jul 2023 07:05:04 +0000
Received: by outflank-mailman (input) for mailman id 567374;
 Fri, 21 Jul 2023 07:05:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=So7w=DH=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1qMkCE-0008Rm-3Y
 for xen-devel@lists.xenproject.org; Fri, 21 Jul 2023 07:05:02 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2081.outbound.protection.outlook.com [40.107.7.81])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e860bf13-2794-11ee-b23a-6b7b168915f2;
 Fri, 21 Jul 2023 09:05:00 +0200 (CEST)
Received: from AS9PR06CA0031.eurprd06.prod.outlook.com (2603:10a6:20b:463::7)
 by AS1PR08MB7452.eurprd08.prod.outlook.com (2603:10a6:20b:4dc::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.28; Fri, 21 Jul
 2023 07:04:22 +0000
Received: from AM7EUR03FT020.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:463:cafe::6c) by AS9PR06CA0031.outlook.office365.com
 (2603:10a6:20b:463::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.25 via Frontend
 Transport; Fri, 21 Jul 2023 07:04:22 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT020.mail.protection.outlook.com (100.127.140.196) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6609.28 via Frontend Transport; Fri, 21 Jul 2023 07:04:22 +0000
Received: ("Tessian outbound e1fdbe8a48d3:v145");
 Fri, 21 Jul 2023 07:04:22 +0000
Received: from 5fdc735c9c8c.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 CF68A395-46B1-4FF1-9AA4-DE0EEC465369.1; 
 Fri, 21 Jul 2023 07:04:15 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 5fdc735c9c8c.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 21 Jul 2023 07:04:15 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM7PR08MB5367.eurprd08.prod.outlook.com (2603:10a6:20b:dd::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.28; Fri, 21 Jul
 2023 07:04:13 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::3cb8:2053:e853:92fe]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::3cb8:2053:e853:92fe%4]) with mapi id 15.20.6609.026; Fri, 21 Jul 2023
 07:04:13 +0000
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
X-Inumbo-ID: e860bf13-2794-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n25+3Nh6lWSsuegEl7U23VehCU5dJJi/qzU5jDxHu6c=;
 b=nNXaIhRIR2CDtT7EsOG59q5Sy30vrg6jeiiRzZo+T2sdHUkOYHl3ALmjxKT4tVBqQyzCtI1eBqf8qVfprB7yTELj4SrupMdQtsB021WruzU+bguyU+ME5PX6iK+96Z3j2PSqPvv8i8btoowUUejNB8RiKgMgZEO4JQJHfRt/1Vg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: cb5a981db509fa1b
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=InKHlQ0A/6gvD+8VV0nZdu66zlvtVGAK5fLGZ5F6oj10OnWRcwybz0H2xq/M9kvQ4KY5i4HpN0QyrFoxkRLW/rJ4QabNN6WxsiFsAWWspk/26k5YxMszOnsQZXMjEnjMASumzxPXgXdGH1wcZOodnXUqeGBnMftGM2+0PD5RuhCUfo4kRg7Hum8ZVR5p7qF/K6jHJGSpPFeDUvTB/O8D/ZN8faB1LWfFcOjQx60FYx/M/LU/fqktKFdpZT4cWKWpZD4I3abinQsLENEmav8Mk0nciCQ4nx8tstFCwxTWtsXwWLHZeGFxLVqszr0d32Pnj1dVpH6+rYeBSm2ILM0Ktw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n25+3Nh6lWSsuegEl7U23VehCU5dJJi/qzU5jDxHu6c=;
 b=diWUQDsjBhlACYmPp2vVAv96GYjhq0H/U9ySfjENOlNcU2XN/Mmy2hpBFrjQLyqte35Nb65ypBLnXPPyPzwYhMVOACj1V7d/VhdKYxX45JOeZSTXMAF8+NvdRLmfRWmfuLpCQzN05zOVMnLb+NFODc33axr+H4kI0hamBRcAPofMRKfvletE5YoMYYwhVdUwjCw1sFr0U6GMfd+a+u9ADcvpX8g94wN83nBonhzpyWAD8DfZiwYLLDFxpdVQDun2hgpjNcN73UHdFON1x7dpYjzKcERL/0PzD146bqvO5rnzxs6xXox3fuRi72Ngq+iJ7oYgrElXZeQmNfB+SuA90A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n25+3Nh6lWSsuegEl7U23VehCU5dJJi/qzU5jDxHu6c=;
 b=nNXaIhRIR2CDtT7EsOG59q5Sy30vrg6jeiiRzZo+T2sdHUkOYHl3ALmjxKT4tVBqQyzCtI1eBqf8qVfprB7yTELj4SrupMdQtsB021WruzU+bguyU+ME5PX6iK+96Z3j2PSqPvv8i8btoowUUejNB8RiKgMgZEO4JQJHfRt/1Vg=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Jens Wiklander <jens.wiklander@linaro.org>, Xen-devel
	<xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>, Marc Bonnici <Marc.Bonnici@arm.com>, Achin Gupta
	<Achin.Gupta@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [XEN PATCH v10 04/24] xen/arm: tee: add a primitive FF-A mediator
Thread-Topic: [XEN PATCH v10 04/24] xen/arm: tee: add a primitive FF-A
 mediator
Thread-Index: AQHZuH9Qs/YHnqnvzkGuhUSzNiJMga/CdpeAgADLs4CAAI/HgA==
Date: Fri, 21 Jul 2023 07:04:13 +0000
Message-ID: <1493A958-AB33-4E3D-9298-27B3394A22FD@arm.com>
References: <20230717072107.753304-1-jens.wiklander@linaro.org>
 <20230717072107.753304-5-jens.wiklander@linaro.org>
 <FE5A2E30-8737-415E-92B2-B6B7B0BF0CCE@arm.com>
 <7289237e-5197-a515-959a-023e62dceb14@xen.org>
In-Reply-To: <7289237e-5197-a515-959a-023e62dceb14@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|AM7PR08MB5367:EE_|AM7EUR03FT020:EE_|AS1PR08MB7452:EE_
X-MS-Office365-Filtering-Correlation-Id: 26314cfc-6e17-4842-ac46-08db89b8b5fb
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 8KssSl6pRIQVXOSjEBopK5ywR+na5kgb0XIV82gOjqUN08QClAHoWQSvnC/fc9ZeiDjbb3sT+j+NuUmgH4iJofy9bEMhULmROs/r2GAzWyh2vUEyB47hnnWABBCbgxfwYv4fSvVQHpIhM0jp0VC1rQyQO4UyH5gOsq62WqIZKr3kV5LqEGqCBehIT4xza3dlwmSjy94XZhIZTwFhdrVqw9EdiHMLdUP/Giqkn+E4kRgMOumJg4qzJvXrNtLpVE6KFFYecnSjbbHP/HyeTx3yK5gmpzoNjF3HG0AmnwfHXfdATQ35vNTY3ZikGsc2mpvqKwUh2R49B32f2V2riOwqvDTZAlbct8LU6oau/bYwqM3oWy0hdchfy5Q2ZDOf6BKmASTuNeMVo+JDbLzKxWjO5nxelTL1k5/V4aZKXNJqXfHiFIglcfjjZEXK51qwlw38pxZoGvb0madujDyBAceSc/pUxhqLCVDTgQZPCLj3x7CI3wGmIgeqzXR5CsVJr4zrAr+k4/ANWbh+2VHkgvHIOhgB7IV8DFWLxQNRhNKktA8Iht5DMYw9edIsY0O4oeM7mCuo8px7RuxVDNB5x/4kpLZkPPdGKMECBVXy9b8hx8qvppXj3zCRTbom8BfxbAj+8o0xNWXBZQsw7eEU6dGneg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(366004)(39860400002)(396003)(376002)(451199021)(6506007)(53546011)(186003)(41300700001)(5660300002)(36756003)(316002)(4326008)(6916009)(54906003)(38070700005)(76116006)(91956017)(64756008)(66446008)(66476007)(66556008)(33656002)(66946007)(478600001)(8936002)(8676002)(71200400001)(38100700002)(966005)(6486002)(6512007)(86362001)(83380400001)(122000001)(2906002)(2616005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <C3B56CA944EDA041A5F1B037189BA2E3@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5367
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	360dbe48-6a06-4d37-4df5-08db89b8b0c6
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7wLpsA4MBD/8HncLfyOEtmQ0jt8UjPmFYpbHdGycgf+utYd+AfPj60ABR2fsazWeQKZimb1aG5N2rVsNPnjTDVptlgAwNHhDNcCSIH46VgIbEqJodWRP4+5jZ062RwXi9zORuw7LrW+5i7CTiEV2MgLQ7euWEfY5tMCtdmo0UzdFKgAiERwS0opsHH1gT1IzvulqNj0uSTulJ6hrEGQoQbjUXRSWO6hh4x/wsSB5Mo53xkbNM6PMFTfspfThrznVTswK/Zz68yetomGYRJtgZSBtmkqT9q4UxSyhK91CcDXqJSPlIocDSDvVDQbQocSMU5wNFGFeCvoB4nMGWvwGcfDwYuy59cMHNbV4lP8YpENHu7f9JgYUdwQjRVisMnLyOv6pT9R7wRbyDNcgR0eXWI3lb/ayYxfmlrn14IIJAhxNr2XnfrV3jI/awPKHmjEKttx1nUzPSWBGPTognbOLcL9nr/mo0mppy3KSIZCy7sbFbY7zv11CAXRqHDFJMeL857omconAOgC8Ooyv3uK7uJRAYN7VZYF1ag7hO30+8mIeZ4G1Iqh8vnwHh9Wpn0VvqoVi9+TPPMsxuLuQOxEB4HhEwuEPXAYr2QfML2/JMG0CjyFpgKDaJjwcmqip8xsk8e4GpfBxOWszIcdAlOTsGcqp7g9YaS6oPWjni9jFOML6bhMt6PHvZEWPaSRQ9abeGxBPukHyf1l4yL0S/lmwjc4+1B8ioYlSCjPpr9RY3Jk=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(136003)(39860400002)(346002)(82310400008)(451199021)(36840700001)(46966006)(40470700004)(2906002)(478600001)(6486002)(54906003)(36756003)(8676002)(41300700001)(316002)(4326008)(70586007)(70206006)(83380400001)(356005)(82740400003)(47076005)(81166007)(40480700001)(966005)(6512007)(86362001)(40460700003)(53546011)(5660300002)(33656002)(8936002)(6862004)(107886003)(26005)(2616005)(186003)(336012)(6506007)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2023 07:04:22.2433
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 26314cfc-6e17-4842-ac46-08db89b8b5fb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR08MB7452

Hi Julien,

> On 21 Jul 2023, at 00:29, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Bertrand,
>=20
> On 20/07/2023 11:20, Bertrand Marquis wrote:
>> Hi Jens,
>>> On 17 Jul 2023, at 09:20, Jens Wiklander <jens.wiklander@linaro.org> wr=
ote:
>>>=20
>>> Adds a FF-A version 1.1 [1] mediator to communicate with a Secure
>>> Partition in secure world.
>>>=20
>>> This commit brings in only the parts needed to negotiate FF-A version
>>> number with guest and SPMC.
>>>=20
>>> [1] https://developer.arm.com/documentation/den0077/e
>>> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
>>> ---
>>> xen/arch/arm/include/asm/psci.h    |   4 +
>>> xen/arch/arm/include/asm/tee/ffa.h |  35 +++++
>>> xen/arch/arm/tee/Kconfig           |  11 ++
>>> xen/arch/arm/tee/Makefile          |   1 +
>>> xen/arch/arm/tee/ffa.c             | 225 +++++++++++++++++++++++++++++
>>> xen/arch/arm/vsmc.c                |  17 ++-
>>> xen/include/public/arch-arm.h      |   1 +
>>> 7 files changed, 291 insertions(+), 3 deletions(-)
>>> create mode 100644 xen/arch/arm/include/asm/tee/ffa.h
>>> create mode 100644 xen/arch/arm/tee/ffa.c
>>>=20
>>> diff --git a/xen/arch/arm/include/asm/psci.h b/xen/arch/arm/include/asm=
/psci.h
>>> index 832f77afff3a..4780972621bb 100644
>>> --- a/xen/arch/arm/include/asm/psci.h
>>> +++ b/xen/arch/arm/include/asm/psci.h
>>> @@ -24,6 +24,10 @@ void call_psci_cpu_off(void);
>>> void call_psci_system_off(void);
>>> void call_psci_system_reset(void);
>>>=20
>>> +/* Range of allocated PSCI function numbers */
>>> +#define PSCI_FNUM_MIN_VALUE                 _AC(0,U)
>>> +#define PSCI_FNUM_MAX_VALUE                 _AC(0x1f,U)
>>> +
>>> /* PSCI v0.2 interface */
>>> #define PSCI_0_2_FN32(nr) ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL,      =
       \
>>>                                              ARM_SMCCC_CONV_32,        =
       \
>>> diff --git a/xen/arch/arm/include/asm/tee/ffa.h b/xen/arch/arm/include/=
asm/tee/ffa.h
>>> new file mode 100644
>>> index 000000000000..44361a4e78e4
>>> --- /dev/null
>>> +++ b/xen/arch/arm/include/asm/tee/ffa.h
>>> @@ -0,0 +1,35 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>> +/*
>>> + * xen/arch/arm/include/asm/tee/ffa.h
>>> + *
>>> + * Arm Firmware Framework for ARMv8-A(FFA) mediator
>>> + *
>>> + * Copyright (C) 2023  Linaro Limited
>>> + */
>>> +
>>> +#ifndef __ASM_ARM_TEE_FFA_H__
>>> +#define __ASM_ARM_TEE_FFA_H__
>>> +
>>> +#include <xen/const.h>
>>> +#include <xen/kconfig.h>
>=20
> None of the headers aside xen/config.h will include xen/kconfig.h. The fo=
rmer is included everything from the compiler command line. So I have remov=
ed it.
>=20
>>> +
>>> +#include <asm/smccc.h>
>>> +#include <asm/types.h>
>>> +
>>> +#define FFA_FNUM_MIN_VALUE              _AC(0x60,U)
>>> +#define FFA_FNUM_MAX_VALUE              _AC(0x86,U)
>>> +
>>> +static inline bool is_ffa_fid(uint32_t fid)
>>> +{
>>> +    uint32_t fn =3D fid & ARM_SMCCC_FUNC_MASK;
>>> +
>>> +    return fn >=3D FFA_FNUM_MIN_VALUE && fn <=3D FFA_FNUM_MAX_VALUE;
>>> +}
>>> +
>>> +#ifdef CONFIG_FFA
>>> +#define FFA_NR_FUNCS    12
>>> +#else
>>> +#define FFA_NR_FUNCS    0
>>> +#endif
>>> +
>>> +#endif /*__ASM_ARM_TEE_FFA_H__*/
>>> diff --git a/xen/arch/arm/tee/Kconfig b/xen/arch/arm/tee/Kconfig
>>> index 392169b2559d..923f08ba8cb7 100644
>>> --- a/xen/arch/arm/tee/Kconfig
>>> +++ b/xen/arch/arm/tee/Kconfig
>>> @@ -8,3 +8,14 @@ config OPTEE
>>>  virtualization-enabled OP-TEE present. You can learn more
>>>  about virtualization for OP-TEE at
>>>  https://optee.readthedocs.io/architecture/virtualization.html
>>> +
>>> +config FFA
>>> + bool "Enable FF-A mediator support (UNSUPPORTED)" if UNSUPPORTED
>>> + default n
>>> + depends on ARM_64
>> Even if the tee Makefile is only included if CONFIG_TEE is activated,
>> the missing dependency on TEE here allows to select FFA without TEE
>> resulting in a config with FFA activated but not compiled in.
>> No build error is coming from this, FFA is just not in if selected witho=
ut TEE.
>> Should be:
>> depends on ARM_64 && TEE
>> I am ok if this is fixed on commit and my R-B kept.
>=20
> I have fixed it and committed up to patch #9. That said, I think it would=
 be best if we have a category TEE where both the OPTEE and FFA config is u=
nder. This will help to make the menuconfig clearer and avoid the "depends =
TEE".

Thanks :-)

>=20
> Bertrand, Jens, can one of you have a look?

The fact that both depend on TEE is making both of those appearing under TE=
E in Kconfig and in menuconfig as sub-items of TEE.

But i agree having a menu for those would be nicer and I will propose a pat=
ch for that later today.

Cheers
Bertrand


