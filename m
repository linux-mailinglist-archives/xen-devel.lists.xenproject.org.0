Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84BA26A0BE1
	for <lists+xen-devel@lfdr.de>; Thu, 23 Feb 2023 15:29:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.500450.771836 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVCax-0007So-Ug; Thu, 23 Feb 2023 14:29:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 500450.771836; Thu, 23 Feb 2023 14:29:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVCax-0007Q2-Re; Thu, 23 Feb 2023 14:29:15 +0000
Received: by outflank-mailman (input) for mailman id 500450;
 Thu, 23 Feb 2023 14:29:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ERnD=6T=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1pVCaw-0007OA-33
 for xen-devel@lists.xenproject.org; Thu, 23 Feb 2023 14:29:14 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20621.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::621])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 717e1334-b386-11ed-88bb-e56d68cac8db;
 Thu, 23 Feb 2023 15:29:13 +0100 (CET)
Received: from DB6PR0201CA0039.eurprd02.prod.outlook.com (2603:10a6:4:3f::49)
 by GV2PR08MB8318.eurprd08.prod.outlook.com (2603:10a6:150:b5::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.19; Thu, 23 Feb
 2023 14:29:07 +0000
Received: from DBAEUR03FT014.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:3f:cafe::e6) by DB6PR0201CA0039.outlook.office365.com
 (2603:10a6:4:3f::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.19 via Frontend
 Transport; Thu, 23 Feb 2023 14:29:06 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT014.mail.protection.outlook.com (100.127.143.22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6134.21 via Frontend Transport; Thu, 23 Feb 2023 14:29:06 +0000
Received: ("Tessian outbound 43b0faad5a68:v132");
 Thu, 23 Feb 2023 14:29:06 +0000
Received: from 0af5b98e6956.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3E9C5C9C-BAA7-4CCE-B9D8-33E692F30474.1; 
 Thu, 23 Feb 2023 14:29:00 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0af5b98e6956.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 23 Feb 2023 14:28:59 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM7PR08MB5319.eurprd08.prod.outlook.com (2603:10a6:20b:dc::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.21; Thu, 23 Feb
 2023 14:28:47 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::fca8:db36:98b:b1c4]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::fca8:db36:98b:b1c4%7]) with mapi id 15.20.6134.021; Thu, 23 Feb 2023
 14:28:47 +0000
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
X-Inumbo-ID: 717e1334-b386-11ed-88bb-e56d68cac8db
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qlWZk0bqqV6v3CZkxy6QwvlP5s/BWN27HWXK5DTmjM0=;
 b=8TtczvRAPJC+3ewcpYVnjppkhcFTeVs1C6X6taRBMOKIyYdbdyOgyQ31OSxz13AjKs3MaqukGNmt3nL2+d8kq7m1YXLGceV5C7r62IgsY0xW8wTuMb08ExsuAVzsbY/HLGdW/c8mdJ4DBZmDmtQji+pH7u5T8S/gCiI5eHwkWoM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 15ff6a42f3ccae8f
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MRUZy8QBnrJginRRYnL6nICuGnPF/3WMs27lcrTqpIPbpygfX+w0FcJJFSseKIh4laYWEKdP1I1LQuoJxfMr5zCSCYSdWvDXAGZw/On44nYzZpprCnmld1JOWR0HSbybsed2iFhqQhOxEumuT9g9STjhavP/1+rXPJl54iLa3GAL08MwSsJDig1IyWJX+xHBHk9md0Uf8FS/Qrd4hgin3uglMAmcX/QNmaPIsLeZxB8uQ1d/95I3C0VRMAIlsVaVBDEeVsO/mSkal5GfsjZXgUuEnalRpyT0xNnvIMC6c6SAEPUaOa/MiR2kkVpLmBWiRhbvlLtgypWFeYyyC0Os1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qlWZk0bqqV6v3CZkxy6QwvlP5s/BWN27HWXK5DTmjM0=;
 b=Vp65RbCJBY2fseNLE2JfPSjJY7VeIcvsZMJAYm9AOCBUMRSDf7Wz0A2/JWRN4JoSo5fjAqkVfzewGqfHiRErUlw8LdrpkrZS0QhcPUW8WflKW9V3dYqU/vrqxqPRuS0KpYMIgwId+rs4U3bt8AQH/Z1aJlcPDUc+t+ih2fvueIPgg8H/8MOXylDyO2XASYYgo/kQtLKGOPq0ZXpu3U3FWfuobYouwnVYbfi8rPo6rZJjQ9NqopDrGeQknqA397e4Uaj1FZkluxVHJTHw37M2p5mWCi35G2Rboykrgzr0aSddulUBVS7AdEeQMymx6vJcZkmZlpWKfG4xMYhKgAu4bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qlWZk0bqqV6v3CZkxy6QwvlP5s/BWN27HWXK5DTmjM0=;
 b=8TtczvRAPJC+3ewcpYVnjppkhcFTeVs1C6X6taRBMOKIyYdbdyOgyQ31OSxz13AjKs3MaqukGNmt3nL2+d8kq7m1YXLGceV5C7r62IgsY0xW8wTuMb08ExsuAVzsbY/HLGdW/c8mdJ4DBZmDmtQji+pH7u5T8S/gCiI5eHwkWoM=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Marc Bonnici
	<Marc.Bonnici@arm.com>, Achin Gupta <Achin.Gupta@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Luca Fancellu <Luca.Fancellu@arm.com>
Subject: Re: [XEN PATCH v7 01/20] xen/arm: smccc: add support for SMCCCv1.2
 extended input/output registers
Thread-Topic: [XEN PATCH v7 01/20] xen/arm: smccc: add support for SMCCCv1.2
 extended input/output registers
Thread-Index: AQHZRtMYVVTNOF7qc0qcOVZW1lBMHq7cmJQA
Date: Thu, 23 Feb 2023 14:28:47 +0000
Message-ID: <1F99611A-13C1-402A-AED0-5ED40E4E94AF@arm.com>
References: <cover.1677079671.git.jens.wiklander@linaro.org>
 <13719ab3736160259ad9245d5d5b5071b8933194.1677079672.git.jens.wiklander@linaro.org>
In-Reply-To:
 <13719ab3736160259ad9245d5d5b5071b8933194.1677079672.git.jens.wiklander@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.400.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|AM7PR08MB5319:EE_|DBAEUR03FT014:EE_|GV2PR08MB8318:EE_
X-MS-Office365-Filtering-Correlation-Id: 81ebd603-91fd-4951-c262-08db15aa51f0
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 CRC0Qmxzx32QHCXkke6toaqjdccBxn7q5JF5Czgcw2xYKatgkR8xYWUsdv09GdFkc4uPYxwQqQJjmXXioBw5vRunmqsNK/PNaEYp0jZLDH9uRHfl736TEslJof1zUAFRZFDc/urzIUaQ8M81hjISrn0L8ujYqKI67FvglM7vi0FtBrYAxWYQQuGMvx+td5qfN6baQZH5xGc86xgkls2lquPEo6CVPxiQDmj32w5AqxkYSVoqK6/HAOoK6oWfI/VxFIekSBniKsaXvVBnWgn4/X/YsCKE55JTsVGzPqGyD1+bUkKFz8AiAFb6/esamHj5LOsmNAszlj4pQiB8N0HMC+NX41gX51HnYA3TNqenI7wHPj9S8MyIcQj9Ma/UjxjEv1i54m2ouHii7+vQlNT7RXbPf2GkpuGeYy4k65uODU0j8nUUPMFajYRHh/IRzdnTFzoAmxXypQeICuwd7nw6qo1Xm88JohTRxiQzzDgu7pt6M7foZzCUFm4T6CAI5PgvkjCtqRpJqW4wdwIpbje/O/okt8Wr84l4U6zhskFLsziskNpvfDvPDOz3+nLBTzBWGEHGhzblzsn8YMglj5OcUmiYfrVuhUvNKYAcvDgZklOmDQyO17QY+8zAb+ihUj3e75CqnkQY11rfLlWOoFeAFoTLruSE1Hp3Kfnq87LKx/x/vzWRt/isRq5keCPql3nhM46ruP5ruosHd+r0RVYMl9wvDyv+/UwFvMMMh1Hs3hM=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(39860400002)(376002)(366004)(346002)(396003)(451199018)(6512007)(2906002)(38100700002)(83380400001)(122000001)(38070700005)(91956017)(8936002)(66446008)(8676002)(66556008)(64756008)(4326008)(6916009)(41300700001)(53546011)(76116006)(66946007)(5660300002)(66476007)(36756003)(71200400001)(478600001)(6506007)(186003)(26005)(2616005)(6486002)(86362001)(316002)(33656002)(54906003)(966005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <33E646BCAB50944EACBEFF0E437CE431@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5319
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a6d20426-17a5-4c0a-31c9-08db15aa4664
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ri7abhdZ5YgyJptnjimBY7KnJySoHWxvUojh1E7APpLx0qzar9OtYKzYANU3yabAOHnWm7jYVibo6bE/r6TqxI4N226K0bAGx4mRfKg0zi9QL4FuVNSk/ORDuJLvQMjegS/KeX0B2Y5fbilmcCROAOCUwFrxI6b31r2EbksCgMcMgSAnXxG3u/O0e5c8q3nMI0qxqK8HxMd3yKoUNr3Hy9sC54/NuiwPTDk2uRlcXJmYO7tMeXE20CcOGeS+fF3+3wKBcq3s2wOCId+DZ/8NXOih2kRrY4mZkN4+tMaO2fm/EmfNLZOVtfWKYoo5jSCz3l0OOvaxHNGala2K1E0RGvwKrtrL+eLEKVT//kKTgbqw5XGjzEaxAbE4LyrQEoNml0RhIBOwvpRw59+kgZRNdZ1e/jlyKz5bbizT2QiDNkcv3ikx7hBWCZYpOZVz7GKX9+HW3+u9uIcppvULywkNSUIQ8nY20bGF+F//ztHzxcUeZqkMvHOvjmSq0RjqZ31h0x++MWS4teP/hIFdWkeRou1dAqda58HhdyFnJhKhilP/CBr1TZmeh6urG5wxOLUg/1J18WtbG/2MUO4kDOF6zdpEWEnQyIOZw3s8Yttbo7rwgmWG4iYJxnapGF9fwPwQ83LtAhL2XIRSw+5sl9CeJ/3u93z2NZY8GDZN3/GmEs+r4yZlp3MK03Hmco6V7mQI
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(346002)(136003)(396003)(376002)(451199018)(36840700001)(46966006)(40470700004)(6486002)(47076005)(83380400001)(478600001)(2906002)(36756003)(5660300002)(6512007)(86362001)(966005)(41300700001)(8936002)(6862004)(53546011)(82310400005)(33656002)(81166007)(36860700001)(356005)(186003)(26005)(2616005)(336012)(40480700001)(54906003)(6506007)(316002)(8676002)(82740400003)(4326008)(70586007)(40460700003)(70206006);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2023 14:29:06.6257
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 81ebd603-91fd-4951-c262-08db15aa51f0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8318

Hi Jens,

> On 22 Feb 2023, at 16:32, Jens Wiklander <jens.wiklander@linaro.org> wrot=
e:
>=20
> SMCCC v1.2 [1] AArch64 allows x0-x17 to be used as both parameter
> registers and result registers for the SMC and HVC instructions.
>=20
> Arm Firmware Framework for Armv8-A specification makes use of x0-x7 as
> parameter and result registers.
>=20
> Let us add new interface to support this extended set of input/output
> registers.
>=20
> This is based on 3fdc0cb59d97 ("arm64: smccc: Add support for SMCCCv1.2
> extended input/output registers") by Sudeep Holla from the Linux kernel
>=20
> The SMCCC version reported to the VM is bumped to 1.2 in order to support
> handling FF-A messages.
>=20
> [1] https://developer.arm.com/documentation/den0028/c/?lang=3Den
>=20
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> xen/arch/arm/arm64/asm-offsets.c |  9 +++++++
> xen/arch/arm/arm64/smc.S         | 42 ++++++++++++++++++++++++++++++++
> xen/arch/arm/include/asm/smccc.h | 40 ++++++++++++++++++++++++++++++
> xen/arch/arm/vsmc.c              |  2 +-
> 4 files changed, 92 insertions(+), 1 deletion(-)
>=20
> diff --git a/xen/arch/arm/arm64/asm-offsets.c b/xen/arch/arm/arm64/asm-of=
fsets.c
> index 7226cd9b2eb0..7adb67a1b81a 100644
> --- a/xen/arch/arm/arm64/asm-offsets.c
> +++ b/xen/arch/arm/arm64/asm-offsets.c
> @@ -57,6 +57,15 @@ void __dummy__(void)
>    BLANK();
>    OFFSET(SMCCC_RES_a0, struct arm_smccc_res, a0);
>    OFFSET(SMCCC_RES_a2, struct arm_smccc_res, a2);
> +   OFFSET(ARM_SMCCC_1_2_REGS_X0_OFFS, struct arm_smccc_1_2_regs, a0);
> +   OFFSET(ARM_SMCCC_1_2_REGS_X2_OFFS, struct arm_smccc_1_2_regs, a2);
> +   OFFSET(ARM_SMCCC_1_2_REGS_X4_OFFS, struct arm_smccc_1_2_regs, a4);
> +   OFFSET(ARM_SMCCC_1_2_REGS_X6_OFFS, struct arm_smccc_1_2_regs, a6);
> +   OFFSET(ARM_SMCCC_1_2_REGS_X8_OFFS, struct arm_smccc_1_2_regs, a8);
> +   OFFSET(ARM_SMCCC_1_2_REGS_X10_OFFS, struct arm_smccc_1_2_regs, a10);
> +   OFFSET(ARM_SMCCC_1_2_REGS_X12_OFFS, struct arm_smccc_1_2_regs, a12);
> +   OFFSET(ARM_SMCCC_1_2_REGS_X14_OFFS, struct arm_smccc_1_2_regs, a14);
> +   OFFSET(ARM_SMCCC_1_2_REGS_X16_OFFS, struct arm_smccc_1_2_regs, a16);
> }
>=20
> /*
> diff --git a/xen/arch/arm/arm64/smc.S b/xen/arch/arm/arm64/smc.S
> index 91bae62dd4d2..fc6b676e2ee3 100644
> --- a/xen/arch/arm/arm64/smc.S
> +++ b/xen/arch/arm/arm64/smc.S
> @@ -27,3 +27,45 @@ ENTRY(__arm_smccc_1_0_smc)
>         stp     x2, x3, [x4, #SMCCC_RES_a2]
> 1:
>         ret
> +
> +/*
> + * void arm_smccc_1_2_smc(const struct arm_smccc_1_2_regs *args,
> + *                        struct arm_smccc_1_2_regs *res)
> + */
> +ENTRY(arm_smccc_1_2_smc)
> +    /* Save `res` and free a GPR that won't be clobbered by SMC call */
> +    stp     x1, x19, [sp, #-16]!
> +
> +    /* Ensure `args` won't be clobbered while loading regs in next step =
*/
> +    mov x19, x0
> +
> +    /* Load the registers x0 - x17 from the struct arm_smccc_1_2_regs */
> +    ldp x0, x1, [x19, #ARM_SMCCC_1_2_REGS_X0_OFFS]
> +    ldp x2, x3, [x19, #ARM_SMCCC_1_2_REGS_X2_OFFS]
> +    ldp x4, x5, [x19, #ARM_SMCCC_1_2_REGS_X4_OFFS]
> +    ldp x6, x7, [x19, #ARM_SMCCC_1_2_REGS_X6_OFFS]
> +    ldp x8, x9, [x19, #ARM_SMCCC_1_2_REGS_X8_OFFS]
> +    ldp x10, x11, [x19, #ARM_SMCCC_1_2_REGS_X10_OFFS]
> +    ldp x12, x13, [x19, #ARM_SMCCC_1_2_REGS_X12_OFFS]
> +    ldp x14, x15, [x19, #ARM_SMCCC_1_2_REGS_X14_OFFS]
> +    ldp x16, x17, [x19, #ARM_SMCCC_1_2_REGS_X16_OFFS]
> +
> +    smc #0
> +
> +    /* Load the `res` from the stack */
> +    ldr x19, [sp]
> +
> +    /* Store the registers x0 - x17 into the result structure */
> +    stp x0, x1, [x19, #ARM_SMCCC_1_2_REGS_X0_OFFS]
> +    stp x2, x3, [x19, #ARM_SMCCC_1_2_REGS_X2_OFFS]
> +    stp x4, x5, [x19, #ARM_SMCCC_1_2_REGS_X4_OFFS]
> +    stp x6, x7, [x19, #ARM_SMCCC_1_2_REGS_X6_OFFS]
> +    stp x8, x9, [x19, #ARM_SMCCC_1_2_REGS_X8_OFFS]
> +    stp x10, x11, [x19, #ARM_SMCCC_1_2_REGS_X10_OFFS]
> +    stp x12, x13, [x19, #ARM_SMCCC_1_2_REGS_X12_OFFS]
> +    stp x14, x15, [x19, #ARM_SMCCC_1_2_REGS_X14_OFFS]
> +    stp x16, x17, [x19, #ARM_SMCCC_1_2_REGS_X16_OFFS]
> +
> +    /* Restore original x19 */
> +    ldp     xzr, x19, [sp], #16
> +    ret
> diff --git a/xen/arch/arm/include/asm/smccc.h b/xen/arch/arm/include/asm/=
smccc.h
> index b3dbeecc90ad..1adcd37443c7 100644
> --- a/xen/arch/arm/include/asm/smccc.h
> +++ b/xen/arch/arm/include/asm/smccc.h
> @@ -33,6 +33,7 @@
>=20
> #define ARM_SMCCC_VERSION_1_0   SMCCC_VERSION(1, 0)
> #define ARM_SMCCC_VERSION_1_1   SMCCC_VERSION(1, 1)
> +#define ARM_SMCCC_VERSION_1_2   SMCCC_VERSION(1, 2)
>=20
> /*
>  * This file provides common defines for ARM SMC Calling Convention as
> @@ -265,6 +266,45 @@ void __arm_smccc_1_0_smc(register_t a0, register_t a=
1, register_t a2,
>         else                                                    \
>             arm_smccc_1_0_smc(__VA_ARGS__);                     \
>     } while ( 0 )
> +
> +/*
> + * struct arm_smccc_1_2_regs - Arguments for or Results from SMC call
> + * @a0-a17 argument values from registers 0 to 17
> + */
> +struct arm_smccc_1_2_regs {
> +    unsigned long a0;
> +    unsigned long a1;
> +    unsigned long a2;
> +    unsigned long a3;
> +    unsigned long a4;
> +    unsigned long a5;
> +    unsigned long a6;
> +    unsigned long a7;
> +    unsigned long a8;
> +    unsigned long a9;
> +    unsigned long a10;
> +    unsigned long a11;
> +    unsigned long a12;
> +    unsigned long a13;
> +    unsigned long a14;
> +    unsigned long a15;
> +    unsigned long a16;
> +    unsigned long a17;
> +};
> +
> +/*
> + * arm_smccc_1_2_smc() - make SMC calls
> + * @args: arguments passed via struct arm_smccc_1_2_regs
> + * @res: result values via struct arm_smccc_1_2_regs
> + *
> + * This function is used to make SMC calls following SMC Calling Convent=
ion
> + * v1.2 or above. The content of the supplied param are copied from the
> + * structure to registers prior to the SMC instruction. The return value=
s
> + * are updated with the content from registers on return from the SMC
> + * instruction.
> + */
> +void arm_smccc_1_2_smc(const struct arm_smccc_1_2_regs *args,
> +                       struct arm_smccc_1_2_regs *res);
> #endif /* CONFIG_ARM_64 */
>=20
> #endif /* __ASSEMBLY__ */
> diff --git a/xen/arch/arm/vsmc.c b/xen/arch/arm/vsmc.c
> index 7335276f3fa1..cd68fa80e98a 100644
> --- a/xen/arch/arm/vsmc.c
> +++ b/xen/arch/arm/vsmc.c
> @@ -85,7 +85,7 @@ static bool handle_arch(struct cpu_user_regs *regs)
>     switch ( fid )
>     {
>     case ARM_SMCCC_VERSION_FID:
> -        set_user_reg(regs, 0, ARM_SMCCC_VERSION_1_1);
> +        set_user_reg(regs, 0, ARM_SMCCC_VERSION_1_2);
>         return true;
>=20
>     case ARM_SMCCC_ARCH_FEATURES_FID:
> --=20
> 2.34.1
>=20


