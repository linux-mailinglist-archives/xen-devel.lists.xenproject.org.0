Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0643042A0B5
	for <lists+xen-devel@lfdr.de>; Tue, 12 Oct 2021 11:07:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.206958.362656 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maDjt-0003VI-N4; Tue, 12 Oct 2021 09:06:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 206958.362656; Tue, 12 Oct 2021 09:06:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maDjt-0003TF-JX; Tue, 12 Oct 2021 09:06:25 +0000
Received: by outflank-mailman (input) for mailman id 206958;
 Tue, 12 Oct 2021 09:06:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GT6b=PA=arm.com=Luca.Fancellu@srs-us1.protection.inumbo.net>)
 id 1maDjs-0003T9-0h
 for xen-devel@lists.xenproject.org; Tue, 12 Oct 2021 09:06:24 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:7e1b::623])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 13be89fd-ff9a-49db-af6b-a5be55d6d32e;
 Tue, 12 Oct 2021 09:06:22 +0000 (UTC)
Received: from AM6P194CA0049.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:84::26)
 by DBBPR08MB6123.eurprd08.prod.outlook.com (2603:10a6:10:20a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Tue, 12 Oct
 2021 09:06:19 +0000
Received: from AM5EUR03FT023.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:84:cafe::21) by AM6P194CA0049.outlook.office365.com
 (2603:10a6:209:84::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.24 via Frontend
 Transport; Tue, 12 Oct 2021 09:06:19 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT023.mail.protection.outlook.com (10.152.16.169) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.18 via Frontend Transport; Tue, 12 Oct 2021 09:06:17 +0000
Received: ("Tessian outbound d5def7722ff7:v103");
 Tue, 12 Oct 2021 09:06:17 +0000
Received: from 3bc9fbb810a2.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8CB05183-4295-426E-8EB6-A509E9BF2FAF.1; 
 Tue, 12 Oct 2021 09:06:07 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3bc9fbb810a2.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 12 Oct 2021 09:06:07 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com (2603:10a6:102:130::10)
 by PR2PR08MB4714.eurprd08.prod.outlook.com (2603:10a6:101:1c::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.22; Tue, 12 Oct
 2021 09:06:03 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::c1b4:db1c:376f:b697]) by PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::c1b4:db1c:376f:b697%8]) with mapi id 15.20.4587.026; Tue, 12 Oct 2021
 09:06:03 +0000
Received: from smtpclient.apple (85.255.237.104) by
 LO4P123CA0266.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:194::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.25 via Frontend Transport; Tue, 12 Oct 2021 09:06:01 +0000
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
X-Inumbo-ID: 13be89fd-ff9a-49db-af6b-a5be55d6d32e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jyG4HKQOj0NacWVS083vK83cbjR4x0e6QbTTpM3q1Kw=;
 b=QcwhdrjJ8NRCGOyWG9zFM6P/bH1zON/aE5mZXTlgVR8GTpyjVuLygaeV/HUah2PNlYMOdJvHnkZQwWjBE33Sg+MHfYNrDfFUAUnam7f9qGIVj43uUSAnp/qwz9tIpvR42zcsinARrKhgh9evNXUQU/Phr4RIn1syIYFo95az65I=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: e3a983ed42c84c11
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GxudOVeDP3fOnFM4IVQpWEG/b6AKptxYKtjkEanTff+woiHLOTPWW2LLCzf0Qqw13Gm2W3m2ZznEWuFoEVQ5dLa2yaWkShbDc10uOV59hSRzc4voRFMm9IynzyOZzQSyR9yp5uJb4bSN06o1AjjccrI5iJPLhnyhGrX7BOfXwGf1wqpRf34+WwI9QSZgiQpCItcnHcPNslr738zOpsDOnV1lfh76dhRwrSAwi8pC9xgAsTpah121iNgQftzWRa+uqTT/veODcAXC0kBhiJdWx6dSdsvQlFYmU0lVPHo1WZYWnjIafzhIWk9pzLiVgSyJENx/NSPZP6Kn2xZDJ5YpfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jyG4HKQOj0NacWVS083vK83cbjR4x0e6QbTTpM3q1Kw=;
 b=WUay/CHIrZSYh3EXZZ5vAf3qYb86oLfU+zxuAeckFQ+JbGIV8O6nT4mfxAXQjU4L1akieYA3zN2AgXVKFlU8HrLXN9Oa/A0LY9MshZEh6aGYC9pb5mI1wNmHr2v9bHty0CZ7y5YwSyvaNF+wk76pzZR9Ai5Yv2b9MNtKhqmab337BPFfoFWUV6m5/t9Jh3W3HNNE7uzW/Gx/mlyPfPpwGK7fez7WRapT/mlIlD3dkqq0BLmkvzDmEeVg8r3m9aIxetYD5M0zeybvAVtxtLDbEdsU3XZN/8M+NjFdu1GssxosZ1keFodOnWDYSHOjsTm9dU12YBcZegI4FcJnQzEZmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jyG4HKQOj0NacWVS083vK83cbjR4x0e6QbTTpM3q1Kw=;
 b=QcwhdrjJ8NRCGOyWG9zFM6P/bH1zON/aE5mZXTlgVR8GTpyjVuLygaeV/HUah2PNlYMOdJvHnkZQwWjBE33Sg+MHfYNrDfFUAUnam7f9qGIVj43uUSAnp/qwz9tIpvR42zcsinARrKhgh9evNXUQU/Phr4RIn1syIYFo95az65I=
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [PATCH v6 1/2] arm/efi: Use dom0less configuration when using EFI
 boot
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <f29c8062-8430-6e08-7d4b-02096a6b049f@suse.com>
Date: Tue, 12 Oct 2021 10:05:53 +0100
Cc: Bertrand Marquis <bertrand.marquis@arm.com>,
 wei.chen@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <4FFFB177-883F-44DE-BF7E-53137AA7F0CB@arm.com>
References: <20211011181528.17367-1-luca.fancellu@arm.com>
 <20211011181528.17367-2-luca.fancellu@arm.com>
 <f29c8062-8430-6e08-7d4b-02096a6b049f@suse.com>
To: Jan Beulich <jbeulich@suse.com>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-ClientProxiedBy: LO4P123CA0266.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:194::19) To PAXPR08MB6816.eurprd08.prod.outlook.com
 (2603:10a6:102:130::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f2f4c524-5025-42f6-2fcd-08d98d5f8d23
X-MS-TrafficTypeDiagnostic: PR2PR08MB4714:|DBBPR08MB6123:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<DBBPR08MB6123BBB4D8D2AA68CAF1F45EE4B69@DBBPR08MB6123.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:972;OLM:972;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 16PZtdk7Qdf/euWJvyXCBmp/f6aeETmBqUAmRXP1vavc7uZ3I8IZlJXPuuNf2T1LtYU701HxJeYtZLrpo1i+2ofXFohtr7162GVe4K5D/T4U0exxNFo60inCpiUXQ9HVg1j1rrHW5XqXLnFzPHcXJpfY4DTU8EU2YdqVQpYdOCatEXhx4It94Tvdx/KombUHLBzGMpBsyv4McNPza/QmdDFptCsCIsNSMnTVn4rAM9e2F/Doqy9V9nGLiqga0Bx/z+4svO9rXPaka5iT6IU8EUuoiELEme//qs9fmmbJVaSU7yv9LvNIv+RvzvdVQkqnzsZFHLLvejlW3StxWtypVeQae+mRDvqas0Ftg5zyhTT2l+NP95hb/+c+75nhVev3d2aDg4CHFTVrLWqi0h48bi20Y40an0SEbQiyUJ8U9lMvrfS6E5ROhZETRHFaPIzdkLpCtUYAwadWC63b+WnB6REN6N0Rmd7w9CxPfcAW8moraEZ7c1RUlD7wmvGMnKZMnx6gzBSG/eg5m78ycuyv2ozg/bqlLIgpSmbSPV8Mtkd92prbCKYh75JOROc1RjWsgttq8ipyQaHu1DIAa9JsK5CFlDlWmM1qtOui94yPsm7JJunGIxv8wvPgBSHfcbvPD7nBroxixgLZa6vXA4jQGoqoB8p2iJPiQq5Hv4ANxzXe5iNcaMCwZOkg39gpxe+5mpZae4UJPYnkhT/1BMNFbK7kfK/+yx4MTC1Iqa93BjsOYFcu3ym7w/8z2HPn8VszGo2+UrzHw/zRaGe6ihVk2Q==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6816.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2906002)(6486002)(54906003)(66946007)(36756003)(4744005)(52116002)(53546011)(6506007)(508600001)(66556008)(66476007)(316002)(6512007)(6666004)(956004)(8936002)(2616005)(33656002)(186003)(6916009)(26005)(86362001)(44832011)(38100700002)(38350700002)(5660300002)(4326008)(8676002)(32563001)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR08MB4714
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d281bbe6-2273-44a0-8201-08d98d5f8408
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WsXPKHvj0s7MrGJ2kdpKtmhp60ASElUD18SbQIsUllV2I9FOo3Jy4KQE6EJUrj6GeZVP4s/K6o++1yme4sFHNxQtFOregqVhwWlMl0ukvn03ClqHcidAy9uP36ZoMKpmsBMMblMIHBTy9bPzSD9rzTQTB6S0NZhKQ4T0mgLFOK7WNQoJHxSkkry5Wn05j3PAZ6v9SM62X59xmHjjhuevtbGkd/utdzbabfEs23390cQc02irjfxdjFpaC6P10akTSNZkKhafuxTqcean2B/OywtCEUnadyaYhKWem9FgxkfRO9C77VR6M+IVE3vWTEXa/V6JSt2G+JiuBoPBlH9JUq1L2WpBN7H9Ty06HUydhFoPrAp/3O7fp7CIPlw6wgO1mELSViPtrrVha7Ur5vQDkF4YbYBWADdOO0gFvxdi7PVaP6L6AAvlwz1zb8O7ViBC7sm+TsJIFGzZXYLV6nzPBKa8RFmH/JHoYhgkmHOtBNe2+jEjHINs30N84hyIlJ1oA+o5J3PqaBG2Qa1wUDJ1Q2CDWYagGbwIgc3k8x9EOOoQu83neixdlBJDrToEsWhfZT++cHneie35FVMmCHkiG8VGVv9jpTwBVuEtrqVewyq062AdQrboCUoTpbKDNHSpYZsoRXKD6Uh+nOm5LcUFYRxN8LZLbGPu2Q20yV9jRbY+gTaebXRG3kW5vPEMbWOFsvc1v4E3Mt/ya9bercc3hnKzP+P6TImfrY0fh5Lt1k0=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(54906003)(33656002)(956004)(2616005)(82310400003)(36756003)(4326008)(356005)(5660300002)(6862004)(336012)(36860700001)(53546011)(6506007)(44832011)(316002)(508600001)(186003)(6666004)(26005)(47076005)(81166007)(8676002)(70586007)(8936002)(70206006)(6512007)(4744005)(6486002)(86362001)(2906002)(32563001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2021 09:06:17.8399
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f2f4c524-5025-42f6-2fcd-08d98d5f8d23
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6123



> On 12 Oct 2021, at 09:45, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 11.10.2021 20:15, Luca Fancellu wrote:
>> --- a/xen/common/efi/boot.c
>> +++ b/xen/common/efi/boot.c
>> @@ -166,6 +166,13 @@ static void __init PrintErr(const CHAR16 *s)
>>     StdErr->OutputString(StdErr, (CHAR16 *)s );
>> }
>>=20
>> +#ifndef CONFIG_HAS_DEVICE_TREE
>> +static inline int __init efi_check_dt_boot(EFI_FILE_HANDLE dir_handle)
>=20
> Didn't we agree that you would drop "inline" from here?
>=20

Yes we did, really sorry I forgot to drop it, I=E2=80=99ll push another ser=
ie, given the inline
Dropped are you ok with the patch?

> Jan
>=20


