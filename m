Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 283CE757806
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jul 2023 11:30:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565041.882861 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLh1x-0002zG-BJ; Tue, 18 Jul 2023 09:30:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565041.882861; Tue, 18 Jul 2023 09:30:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLh1x-0002vl-8Z; Tue, 18 Jul 2023 09:30:05 +0000
Received: by outflank-mailman (input) for mailman id 565041;
 Tue, 18 Jul 2023 09:30:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=88xE=DE=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1qLh1v-0002a7-Cm
 for xen-devel@lists.xenproject.org; Tue, 18 Jul 2023 09:30:03 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0607.outbound.protection.outlook.com
 [2a01:111:f400:fe02::607])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id abd53cb4-254d-11ee-b23a-6b7b168915f2;
 Tue, 18 Jul 2023 11:30:02 +0200 (CEST)
Received: from DUZPR01CA0243.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b5::11) by AS8PR08MB10221.eurprd08.prod.outlook.com
 (2603:10a6:20b:63e::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.32; Tue, 18 Jul
 2023 09:29:59 +0000
Received: from DBAEUR03FT019.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:4b5:cafe::fd) by DUZPR01CA0243.outlook.office365.com
 (2603:10a6:10:4b5::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.33 via Frontend
 Transport; Tue, 18 Jul 2023 09:29:59 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT019.mail.protection.outlook.com (100.127.142.129) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6588.33 via Frontend Transport; Tue, 18 Jul 2023 09:29:59 +0000
Received: ("Tessian outbound f9124736ff4f:v145");
 Tue, 18 Jul 2023 09:29:59 +0000
Received: from 6adc37988c29.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4E93CB6E-CE9B-49EC-A7B4-35F222C46891.1; 
 Tue, 18 Jul 2023 09:29:52 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6adc37988c29.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 18 Jul 2023 09:29:52 +0000
Received: from AM0PR08MB3778.eurprd08.prod.outlook.com (2603:10a6:208:104::24)
 by VE1PR08MB5646.eurprd08.prod.outlook.com (2603:10a6:800:1a9::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Tue, 18 Jul
 2023 09:29:50 +0000
Received: from AM0PR08MB3778.eurprd08.prod.outlook.com
 ([fe80::5a82:e906:eecd:7854]) by AM0PR08MB3778.eurprd08.prod.outlook.com
 ([fe80::5a82:e906:eecd:7854%3]) with mapi id 15.20.6588.031; Tue, 18 Jul 2023
 09:29:49 +0000
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
X-Inumbo-ID: abd53cb4-254d-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K8/ZEmILh4dJGcS0LKb7dHCk2B0qJMepv4YyPjgTj5g=;
 b=+KpFR4mET26kF/tie94Jz84XOLbZMA3oReqgVdeyEw1NkxW384TOL9GvD1WlElgK5dyoskRa2AZ11gfVIMMhwbEi9GAViN7jaLUfUY63TCE9o9228ILMpKSpPV3NPvH7yO53xa/JHj6cpuDmaizHii447ZJLC1kdJGf62ZIke8k=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 17601c4c6a3a368b
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kp3EVIcF1ckUWl8EQguRYaHBCh6N5ugAS4GXFInMxn5hbpIQdthrV/J8mcMp3TGzoIxUaQJDhQ8hiF+gZ5CbSdRz8pUK5hzrB1A+NfdrpfbqLVvy5N2oLlKUlSqHySH0SUOtIBIu+4aKRO8KPP5azqWxrKbuEMNRCJOr9W7ZslNDnYWg3QNm1eh63zzVqIfIhXURs4neLP2DbQ5cxNZoAmvas8GvgTLuVl2ntiJS2JO7JSN4CEoL5PsFfDawqybSZofyO+2NKeyYK5ZqtPRUcrVFdjYqoXm7XgSDb39C2qikSPkFpasFKcxMIZy/lu7KKh1SvnUhJv1j/ljk3mcARA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K8/ZEmILh4dJGcS0LKb7dHCk2B0qJMepv4YyPjgTj5g=;
 b=kpSjTWgx+3wGK26ro/se9Ysp78i5LZ8Y9BoCZ7IMKmAqXtbegbq1k2tW5ic3X8S1CBoapJy1gmMBmbzpStAe70aYNJxKZsBSOzo0LMVLyCF2vyobZ58tAPNPiIbinTphCimWFKOUai6lGipVJvz9tK2hiGdDNl4MuRdtsp1suPa57U5SdiEXn34vs7G73HF4/V4brqedPWz1cfahBHFSiu5M0nwzDFk2dndO/vpq8UPIS+7JCGdB07+CaWptPXMttwUMCijqY7hEM+v7vlyRyyRWa0JpfwJJDLshjECvnX0fTpMHDAe1+0r0GC0pwPLvKXlo35e0+9pJuxFFbWmpVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K8/ZEmILh4dJGcS0LKb7dHCk2B0qJMepv4YyPjgTj5g=;
 b=+KpFR4mET26kF/tie94Jz84XOLbZMA3oReqgVdeyEw1NkxW384TOL9GvD1WlElgK5dyoskRa2AZ11gfVIMMhwbEi9GAViN7jaLUfUY63TCE9o9228ILMpKSpPV3NPvH7yO53xa/JHj6cpuDmaizHii447ZJLC1kdJGf62ZIke8k=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>, Marc Bonnici
	<Marc.Bonnici@arm.com>, Achin Gupta <Achin.Gupta@arm.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>
Subject: Re: [XEN PATCH v10 04/24] xen/arm: tee: add a primitive FF-A mediator
Thread-Topic: [XEN PATCH v10 04/24] xen/arm: tee: add a primitive FF-A
 mediator
Thread-Index: AQHZuH9Qs/YHnqnvzkGuhUSzNiJMga+/Q8GA
Date: Tue, 18 Jul 2023 09:29:49 +0000
Message-ID: <CF2AB21D-B2A5-4B65-91D1-21FA16530048@arm.com>
References: <20230717072107.753304-1-jens.wiklander@linaro.org>
 <20230717072107.753304-5-jens.wiklander@linaro.org>
In-Reply-To: <20230717072107.753304-5-jens.wiklander@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM0PR08MB3778:EE_|VE1PR08MB5646:EE_|DBAEUR03FT019:EE_|AS8PR08MB10221:EE_
X-MS-Office365-Filtering-Correlation-Id: 8df1e729-4c7e-4b51-872f-08db87718e78
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 ChjHZOZrNAqmn7HjsGOuZlBZX8T5grUb3FtNcJ0N5dbJgJXrdpoKhg3k65tmxxxjxZEo9qFjE9vMpLlCRNW4VWEpyoT7iSmhQ1/v8GWUs5FTNy/MSftFg2LM7y5gGJpifZffKck/VVf+nX8qcpYnv89CV4Xpvijdl+J7GIYATseAJdrEAyYC+CyLXu63w+Gb9ISkcbvMD9awQr6YDfKH8HQ/7fTDYd+mCl+vFVMg2YdujhrfPFanC0uWbtNJixNu6lvl2jUL7AXLHJrFgL6Imv7jcWUWOJHG5xPU4A2lqXzruEs/9+NIEldql9AMClJzu9Q+4ALuMzXSg3ctrxtr+bBCraqx8GukaggxP+2S87NLaAOjRmeAO4Q9dDmHimrBf2zERUx/eeT/Cji4BDt22yGpgpf4Di8OLowRaY5T+HMRQskZSViy4EltSN6gajNACzGmtUool43VJOHElirF6meUwBaxNDyoqIKjsnMQ6LzoItK1Fe7i1in2BWe/0kjFy+1gVEkWhDOrUIuNuCiOQtAbDw8x3R40qqUMIvAh5StgatAuL+JSodjYA6w2Kc6Urz8wIAiolw63e3Wli4qrWRc0HX+S7DjO5eR0EMTM7MR5B3fYiYLENJ2qnAF0DQWT
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3778.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(39860400002)(396003)(366004)(136003)(451199021)(2616005)(53546011)(41300700001)(6506007)(316002)(6512007)(966005)(83380400001)(186003)(6486002)(478600001)(122000001)(71200400001)(4326008)(6916009)(76116006)(66476007)(66946007)(91956017)(66556008)(64756008)(66446008)(38100700002)(33656002)(86362001)(8676002)(2906002)(8936002)(36756003)(54906003)(38070700005)(5660300002)(30864003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <E1E8184D605F3F41945A6DF7576FD4C1@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5646
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3273c79f-0ee6-430a-e7ff-08db877188b3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oIs/4R0sCSHVVReg4H9NUFD/aSZ6aYQ2A9z9I4OKaJ8+EHHTmIAdQqQ16xW663+L0bfKEdgSdMy+Vn/ikELaFdAxnXcy2dNgA0z4XwqHKRbBZr3vEEKllABmt2F5HgAXsJ/fpgYhilbehCQet0hLy7ljrsJPBEnQQ7Udliqk5jFBkvRCt9M38mvfQFktZYtHkcW9UOWKXN0p/7dwIR67oHa+6cy1xZmsaNemShGTN8daQ4Odzk4qTh86d9tsP4vnRZLEAcY8joHDcchRZLm6Uh8O8nw0+jPzXDER9vzl6EoTZCXV01FPK3caK1EmOQkJeyBGq4ThbNzulPkG1XYU4/R2ELGz+HsR0suvLjvKV6Yan7FQE+Lb6RIUipfRF8raTJV4khgW7rSfAcEpQ7t7Oa2ezY2UeQFvGk9tiH/vGtem8e4r3nLbHp58wRT/10ZvYw47NqGB9bA+9DT1mnHwELzkL9Kv45lFsdXaJJUhJDDQae7gxEwykCBJ7cC2chzankLAhCAfa/QxVmC/ZJC9pRq+OfnYWenLAsd3SiQpE1aA6/ZxgWx2QHQKuSZrBjsZ+Ldlvb9wo+R8w2QVzGGT8wz+kIJcVqTGYaUpAxbesS6Mv431e39DdARzUMlQs4/mcJ/znNzO/XEtWMmtWRurYeeN8m2b4VGthNcx0P6CjsdaL1aJLCTen6rNX4CjJltG8Q0qPEU5IPGarRnvODkkGZWr/RHgUxWQuEQBUUgTPmQ=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(136003)(376002)(346002)(82310400008)(451199021)(40470700004)(36840700001)(46966006)(36860700001)(478600001)(356005)(36756003)(33656002)(40480700001)(86362001)(82740400003)(40460700003)(81166007)(6486002)(70586007)(966005)(54906003)(6512007)(6862004)(30864003)(8676002)(8936002)(316002)(41300700001)(70206006)(4326008)(5660300002)(336012)(2616005)(6506007)(186003)(26005)(53546011)(107886003)(47076005)(83380400001)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2023 09:29:59.4218
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8df1e729-4c7e-4b51-872f-08db87718e78
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB10221

Hi Jens,

> On 17 Jul 2023, at 09:20, Jens Wiklander <jens.wiklander@linaro.org> wrot=
e:
>=20
> Adds a FF-A version 1.1 [1] mediator to communicate with a Secure
> Partition in secure world.
>=20
> This commit brings in only the parts needed to negotiate FF-A version
> number with guest and SPMC.
>=20
> [1] https://developer.arm.com/documentation/den0077/e
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> xen/arch/arm/include/asm/psci.h    |   4 +
> xen/arch/arm/include/asm/tee/ffa.h |  35 +++++
> xen/arch/arm/tee/Kconfig           |  11 ++
> xen/arch/arm/tee/Makefile          |   1 +
> xen/arch/arm/tee/ffa.c             | 225 +++++++++++++++++++++++++++++
> xen/arch/arm/vsmc.c                |  17 ++-
> xen/include/public/arch-arm.h      |   1 +
> 7 files changed, 291 insertions(+), 3 deletions(-)
> create mode 100644 xen/arch/arm/include/asm/tee/ffa.h
> create mode 100644 xen/arch/arm/tee/ffa.c
>=20
> diff --git a/xen/arch/arm/include/asm/psci.h b/xen/arch/arm/include/asm/p=
sci.h
> index 832f77afff3a..4780972621bb 100644
> --- a/xen/arch/arm/include/asm/psci.h
> +++ b/xen/arch/arm/include/asm/psci.h
> @@ -24,6 +24,10 @@ void call_psci_cpu_off(void);
> void call_psci_system_off(void);
> void call_psci_system_reset(void);
>=20
> +/* Range of allocated PSCI function numbers */
> +#define PSCI_FNUM_MIN_VALUE                 _AC(0,U)
> +#define PSCI_FNUM_MAX_VALUE                 _AC(0x1f,U)
> +
> /* PSCI v0.2 interface */
> #define PSCI_0_2_FN32(nr) ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL,        =
     \
>                                              ARM_SMCCC_CONV_32,          =
     \
> diff --git a/xen/arch/arm/include/asm/tee/ffa.h b/xen/arch/arm/include/as=
m/tee/ffa.h
> new file mode 100644
> index 000000000000..44361a4e78e4
> --- /dev/null
> +++ b/xen/arch/arm/include/asm/tee/ffa.h
> @@ -0,0 +1,35 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * xen/arch/arm/include/asm/tee/ffa.h
> + *
> + * Arm Firmware Framework for ARMv8-A(FFA) mediator
> + *
> + * Copyright (C) 2023  Linaro Limited
> + */
> +
> +#ifndef __ASM_ARM_TEE_FFA_H__
> +#define __ASM_ARM_TEE_FFA_H__
> +
> +#include <xen/const.h>
> +#include <xen/kconfig.h>
> +
> +#include <asm/smccc.h>
> +#include <asm/types.h>
> +
> +#define FFA_FNUM_MIN_VALUE              _AC(0x60,U)
> +#define FFA_FNUM_MAX_VALUE              _AC(0x86,U)
> +
> +static inline bool is_ffa_fid(uint32_t fid)
> +{
> +    uint32_t fn =3D fid & ARM_SMCCC_FUNC_MASK;
> +
> +    return fn >=3D FFA_FNUM_MIN_VALUE && fn <=3D FFA_FNUM_MAX_VALUE;
> +}
> +
> +#ifdef CONFIG_FFA
> +#define FFA_NR_FUNCS    12
> +#else
> +#define FFA_NR_FUNCS    0
> +#endif
> +
> +#endif /*__ASM_ARM_TEE_FFA_H__*/
> diff --git a/xen/arch/arm/tee/Kconfig b/xen/arch/arm/tee/Kconfig
> index 392169b2559d..923f08ba8cb7 100644
> --- a/xen/arch/arm/tee/Kconfig
> +++ b/xen/arch/arm/tee/Kconfig
> @@ -8,3 +8,14 @@ config OPTEE
>  virtualization-enabled OP-TEE present. You can learn more
>  about virtualization for OP-TEE at
>  https://optee.readthedocs.io/architecture/virtualization.html
> +
> +config FFA
> + bool "Enable FF-A mediator support (UNSUPPORTED)" if UNSUPPORTED
> + default n
> + depends on ARM_64
> + help
> +  This option enables a minimal FF-A mediator. The mediator is
> +  generic as it follows the FF-A specification [1], but it only
> +  implements a small subset of the specification.
> +
> +  [1] https://developer.arm.com/documentation/den0077/latest
> diff --git a/xen/arch/arm/tee/Makefile b/xen/arch/arm/tee/Makefile
> index 982c87968447..58a1015e40e0 100644
> --- a/xen/arch/arm/tee/Makefile
> +++ b/xen/arch/arm/tee/Makefile
> @@ -1,2 +1,3 @@
> +obj-$(CONFIG_FFA) +=3D ffa.o
> obj-y +=3D tee.o
> obj-$(CONFIG_OPTEE) +=3D optee.o
> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> new file mode 100644
> index 000000000000..927c4d33a380
> --- /dev/null
> +++ b/xen/arch/arm/tee/ffa.c
> @@ -0,0 +1,225 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * xen/arch/arm/tee/ffa.c
> + *
> + * Arm Firmware Framework for ARMv8-A (FF-A) mediator
> + *
> + * Copyright (C) 2023  Linaro Limited
> + */
> +
> +#include <xen/bitops.h>
> +#include <xen/domain_page.h>
> +#include <xen/errno.h>
> +#include <xen/init.h>
> +#include <xen/lib.h>
> +#include <xen/sched.h>
> +#include <xen/sizes.h>
> +#include <xen/types.h>
> +
> +#include <asm/event.h>
> +#include <asm/regs.h>
> +#include <asm/smccc.h>
> +#include <asm/tee/ffa.h>
> +#include <asm/tee/tee.h>
> +
> +/* Error codes */
> +#define FFA_RET_OK                      0
> +#define FFA_RET_NOT_SUPPORTED           -1
> +#define FFA_RET_INVALID_PARAMETERS      -2
> +#define FFA_RET_NO_MEMORY               -3
> +#define FFA_RET_BUSY                    -4
> +#define FFA_RET_INTERRUPTED             -5
> +#define FFA_RET_DENIED                  -6
> +#define FFA_RET_RETRY                   -7
> +#define FFA_RET_ABORTED                 -8
> +
> +/* FFA_VERSION helpers */
> +#define FFA_VERSION_MAJOR_SHIFT         16U
> +#define FFA_VERSION_MAJOR_MASK          0x7FFFU
> +#define FFA_VERSION_MINOR_SHIFT         0U
> +#define FFA_VERSION_MINOR_MASK          0xFFFFU
> +#define MAKE_FFA_VERSION(major, minor)  \
> +        ((((major) & FFA_VERSION_MAJOR_MASK) << FFA_VERSION_MAJOR_SHIFT)=
 | \
> +         ((minor) & FFA_VERSION_MINOR_MASK))
> +
> +#define FFA_VERSION_1_0         MAKE_FFA_VERSION(1, 0)
> +#define FFA_VERSION_1_1         MAKE_FFA_VERSION(1, 1)
> +/* The minimal FF-A version of the SPMC that can be supported */
> +#define FFA_MIN_SPMC_VERSION    FFA_VERSION_1_1
> +
> +/*
> + * This is the version we want to use in communication with guests and S=
Ps.
> + * During negotiation with a guest or a SP we may need to lower it for
> + * that particular guest or SP.
> + */
> +#define FFA_MY_VERSION_MAJOR    1U
> +#define FFA_MY_VERSION_MINOR    1U
> +#define FFA_MY_VERSION          MAKE_FFA_VERSION(FFA_MY_VERSION_MAJOR, \
> +                                                 FFA_MY_VERSION_MINOR)
> +
> +/* Function IDs */
> +#define FFA_ERROR                       0x84000060U
> +#define FFA_SUCCESS_32                  0x84000061U
> +#define FFA_VERSION                     0x84000063U
> +
> +struct ffa_ctx {
> +    /* FF-A version used by the guest */
> +    uint32_t guest_vers;
> +};
> +
> +/* Negotiated FF-A version to use with the SPMC */
> +static uint32_t __ro_after_init ffa_version;
> +
> +static bool ffa_get_version(uint32_t *vers)
> +{
> +    const struct arm_smccc_1_2_regs arg =3D {
> +        .a0 =3D FFA_VERSION,
> +        .a1 =3D FFA_MY_VERSION,
> +    };
> +    struct arm_smccc_1_2_regs resp;
> +
> +    arm_smccc_1_2_smc(&arg, &resp);
> +    if ( resp.a0 =3D=3D FFA_RET_NOT_SUPPORTED )
> +    {
> +        gprintk(XENLOG_ERR, "ffa: FFA_VERSION returned not supported\n")=
;
> +        return false;
> +    }
> +
> +    *vers =3D resp.a0;
> +
> +    return true;
> +}
> +
> +static void set_regs(struct cpu_user_regs *regs, register_t v0, register=
_t v1,
> +                     register_t v2, register_t v3, register_t v4, regist=
er_t v5,
> +                     register_t v6, register_t v7)
> +{
> +        set_user_reg(regs, 0, v0);
> +        set_user_reg(regs, 1, v1);
> +        set_user_reg(regs, 2, v2);
> +        set_user_reg(regs, 3, v3);
> +        set_user_reg(regs, 4, v4);
> +        set_user_reg(regs, 5, v5);
> +        set_user_reg(regs, 6, v6);
> +        set_user_reg(regs, 7, v7);
> +}
> +
> +static void handle_version(struct cpu_user_regs *regs)
> +{
> +    struct domain *d =3D current->domain;
> +    struct ffa_ctx *ctx =3D d->arch.tee;
> +    uint32_t vers =3D get_user_reg(regs, 1);
> +
> +    if ( vers < FFA_VERSION_1_1 )
> +        vers =3D FFA_VERSION_1_0;
> +    else
> +        vers =3D FFA_VERSION_1_1;
> +
> +    ctx->guest_vers =3D vers;
> +    set_regs(regs, vers, 0, 0, 0, 0, 0, 0, 0);
> +}
> +
> +static bool ffa_handle_call(struct cpu_user_regs *regs)
> +{
> +    uint32_t fid =3D get_user_reg(regs, 0);
> +    struct domain *d =3D current->domain;
> +    struct ffa_ctx *ctx =3D d->arch.tee;
> +
> +    if ( !ctx )
> +        return false;
> +
> +    switch ( fid )
> +    {
> +    case FFA_VERSION:
> +        handle_version(regs);
> +        return true;
> +
> +    default:
> +        gprintk(XENLOG_ERR, "ffa: unhandled fid 0x%x\n", fid);
> +        return false;
> +    }
> +}
> +
> +static int ffa_domain_init(struct domain *d)
> +{
> +    struct ffa_ctx *ctx;
> +
> +    if ( !ffa_version )
> +        return -ENODEV;
> +
> +    ctx =3D xzalloc(struct ffa_ctx);
> +    if ( !ctx )
> +        return -ENOMEM;
> +
> +    d->arch.tee =3D ctx;
> +
> +    return 0;
> +}
> +
> +/* This function is supposed to undo what ffa_domain_init() has done */
> +static int ffa_domain_teardown(struct domain *d)
> +{
> +    struct ffa_ctx *ctx =3D d->arch.tee;
> +
> +    if ( !ctx )
> +        return 0;
> +
> +    XFREE(d->arch.tee);
> +
> +    return 0;
> +}
> +
> +static int ffa_relinquish_resources(struct domain *d)
> +{
> +    return 0;
> +}
> +
> +static bool ffa_probe(void)
> +{
> +    uint32_t vers;
> +    unsigned int major_vers;
> +    unsigned int minor_vers;
> +
> +    /*
> +     * psci_init_smccc() updates this value with what's reported by EL-3
> +     * or secure world.
> +     */
> +    if ( smccc_ver < ARM_SMCCC_VERSION_1_2 )
> +    {
> +        printk(XENLOG_ERR
> +               "ffa: unsupported SMCCC version %#x (need at least %#x)\n=
",
> +               smccc_ver, ARM_SMCCC_VERSION_1_2);
> +        return false;
> +    }
> +
> +    if ( !ffa_get_version(&vers) )
> +        return false;
> +
> +    if ( vers < FFA_MIN_SPMC_VERSION || vers > FFA_MY_VERSION )
> +    {
> +        printk(XENLOG_ERR "ffa: Incompatible version %#x found\n", vers)=
;
> +        return false;
> +    }
> +
> +    major_vers =3D (vers >> FFA_VERSION_MAJOR_SHIFT) & FFA_VERSION_MAJOR=
_MASK;
> +    minor_vers =3D vers & FFA_VERSION_MINOR_MASK;
> +    printk(XENLOG_INFO "ARM FF-A Mediator version %u.%u\n",
> +           FFA_MY_VERSION_MAJOR, FFA_MY_VERSION_MINOR);
> +    printk(XENLOG_INFO "ARM FF-A Firmware version %u.%u\n",
> +           major_vers, minor_vers);
> +
> +    ffa_version =3D vers;
> +
> +    return true;
> +}
> +
> +static const struct tee_mediator_ops ffa_ops =3D
> +{
> +    .probe =3D ffa_probe,
> +    .domain_init =3D ffa_domain_init,
> +    .domain_teardown =3D ffa_domain_teardown,
> +    .relinquish_resources =3D ffa_relinquish_resources,
> +    .handle_call =3D ffa_handle_call,
> +};
> +
> +REGISTER_TEE_MEDIATOR(ffa, "FF-A", XEN_DOMCTL_CONFIG_TEE_FFA, &ffa_ops);
> diff --git a/xen/arch/arm/vsmc.c b/xen/arch/arm/vsmc.c
> index cd68fa80e98a..7f2f5eb9ce3d 100644
> --- a/xen/arch/arm/vsmc.c
> +++ b/xen/arch/arm/vsmc.c
> @@ -15,6 +15,7 @@
> #include <asm/monitor.h>
> #include <asm/regs.h>
> #include <asm/smccc.h>
> +#include <asm/tee/ffa.h>
> #include <asm/tee/tee.h>
> #include <asm/traps.h>
> #include <asm/vpsci.h>
> @@ -24,7 +25,7 @@
> #define XEN_SMCCC_FUNCTION_COUNT 3
>=20
> /* Number of functions currently supported by Standard Service Service Ca=
lls. */
> -#define SSSC_SMCCC_FUNCTION_COUNT (3 + VPSCI_NR_FUNCS)
> +#define SSSC_SMCCC_FUNCTION_COUNT (3 + VPSCI_NR_FUNCS + FFA_NR_FUNCS)
>=20
> static bool fill_uid(struct cpu_user_regs *regs, xen_uuid_t uuid)
> {
> @@ -188,13 +189,23 @@ static bool handle_existing_apis(struct cpu_user_re=
gs *regs)
>     return do_vpsci_0_1_call(regs, fid);
> }
>=20
> +static bool is_psci_fid(uint32_t fid)
> +{
> +    uint32_t fn =3D fid & ARM_SMCCC_FUNC_MASK;
> +
> +    return fn >=3D PSCI_FNUM_MIN_VALUE && fn <=3D PSCI_FNUM_MAX_VALUE;
> +}
> +
> /* PSCI 0.2 interface and other Standard Secure Calls */
> static bool handle_sssc(struct cpu_user_regs *regs)
> {
>     uint32_t fid =3D (uint32_t)get_user_reg(regs, 0);
>=20
> -    if ( do_vpsci_0_2_call(regs, fid) )
> -        return true;
> +    if ( is_psci_fid(fid) )
> +        return do_vpsci_0_2_call(regs, fid);
> +
> +    if ( is_ffa_fid(fid) )
> +        return tee_handle_call(regs);
>=20
>     switch ( fid )
>     {
> diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.=
h
> index 38311f559581..c6449893e493 100644
> --- a/xen/include/public/arch-arm.h
> +++ b/xen/include/public/arch-arm.h
> @@ -296,6 +296,7 @@ DEFINE_XEN_GUEST_HANDLE(vcpu_guest_context_t);
>=20
> #define XEN_DOMCTL_CONFIG_TEE_NONE      0
> #define XEN_DOMCTL_CONFIG_TEE_OPTEE     1
> +#define XEN_DOMCTL_CONFIG_TEE_FFA       2
>=20
> struct xen_arch_domainconfig {
>     /* IN/OUT */
> --=20
> 2.34.1
>=20


