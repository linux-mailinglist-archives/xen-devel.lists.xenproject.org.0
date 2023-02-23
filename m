Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4EB46A0CE9
	for <lists+xen-devel@lfdr.de>; Thu, 23 Feb 2023 16:28:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.500545.771979 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVDWF-0005rC-H5; Thu, 23 Feb 2023 15:28:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 500545.771979; Thu, 23 Feb 2023 15:28:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVDWF-0005oa-Dw; Thu, 23 Feb 2023 15:28:27 +0000
Received: by outflank-mailman (input) for mailman id 500545;
 Thu, 23 Feb 2023 15:28:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ERnD=6T=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1pVDWD-0005oU-PA
 for xen-devel@lists.xenproject.org; Thu, 23 Feb 2023 15:28:25 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20608.outbound.protection.outlook.com
 [2a01:111:f400:7d00::608])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b646bed2-b38e-11ed-88bb-e56d68cac8db;
 Thu, 23 Feb 2023 16:28:25 +0100 (CET)
Received: from DUZPR01CA0032.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:468::11) by GV2PR08MB10384.eurprd08.prod.outlook.com
 (2603:10a6:150:b2::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.19; Thu, 23 Feb
 2023 15:28:20 +0000
Received: from DBAEUR03FT019.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:468:cafe::9b) by DUZPR01CA0032.outlook.office365.com
 (2603:10a6:10:468::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.21 via Frontend
 Transport; Thu, 23 Feb 2023 15:28:20 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT019.mail.protection.outlook.com (100.127.142.129) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6134.21 via Frontend Transport; Thu, 23 Feb 2023 15:28:20 +0000
Received: ("Tessian outbound 43b0faad5a68:v132");
 Thu, 23 Feb 2023 15:28:20 +0000
Received: from 6a80b0a65d4a.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1042DB7F-0CD7-4728-BC23-8C19ECDC9587.1; 
 Thu, 23 Feb 2023 15:28:13 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6a80b0a65d4a.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 23 Feb 2023 15:28:13 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by PA4PR08MB7593.eurprd08.prod.outlook.com (2603:10a6:102:26f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.21; Thu, 23 Feb
 2023 15:28:09 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::fca8:db36:98b:b1c4]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::fca8:db36:98b:b1c4%7]) with mapi id 15.20.6134.021; Thu, 23 Feb 2023
 15:28:09 +0000
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
X-Inumbo-ID: b646bed2-b38e-11ed-88bb-e56d68cac8db
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L6On54c92xQpXUqK6v9PKgGDnWPNKLlbkVnkow1IHUs=;
 b=qqdgS0nBfP/SZKMiO107+ie9h/UuABRWj5pJ9QZzOAwHGhWCcNgLFcSWPRh6sxXBwOKi2v8pKe9VhUqhR4j1H2sW2/P2QUbn/EF0hoB2Atk3FXTQAiAwRQQdsuM5ATbyHSZTuXqjX9bmiIoEpYeie2Zgv+9TsLroLca5KcPd/LU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1bac6939a0299f7e
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WigyLtY6z25ubRemoSyuH7QUJYdTi19QUZ9JVJckCNiyVFm2ob4zGGXL7UvS5Bvsi6bV+VfXuoSBnI1ZbincyHzPwYVFo5Ut0Ge4OJ3wYf7wtRVtFH7F+Iew1GL+NTfF3EkSYHmbdRTDq8zHczzJq5Otn7wH/XcaQ3xN+PL7OAQPRbBKuzM7hG6dHGSjhcm8QtM2GyStvfO+7L99YpdFmJgQ9RgDFUGoPefZqJXkoJG8dFJC4s0bqDH8WH3SrPq4rdX2PBZ8X1d0BQQ/kRG5V4ZMcXpoFDf8dp24nzfHHvSF76vz/Qufj1otYciDPxEsMYX1QHdTNv7JAciNoI5VTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L6On54c92xQpXUqK6v9PKgGDnWPNKLlbkVnkow1IHUs=;
 b=XWjjcy+0QdsmrxfQIKPJGfZ+UwhclwONOu2UFg/Ab49G/O4gUTeUVzUBj4xbXAHRplPqohro6BTZfPnCZ2sAxTDFodP9jeikTj09JXfeJmZtLWchQ4I7AjGgkuXHxrgjOz4TNkzvzxfbfxy8ne9kUgxW3/fjCN+j0BwrX1UMfjmoqOotqNOeibzCJq1cJbuhzqCSAsvuaXwMQMU7jYz+pSOqIY5x1yVpYmgPct1Nmsc6hudfm7sBZKPcdQuHQO1g7cPGsjcCJc9cpr1p8t4zVTM9uJuIvKUlUIds1OLE8u1bg4lrG6sDfefjpXV/jVT9MY6GZgxOggIJQcEf7u/sYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L6On54c92xQpXUqK6v9PKgGDnWPNKLlbkVnkow1IHUs=;
 b=qqdgS0nBfP/SZKMiO107+ie9h/UuABRWj5pJ9QZzOAwHGhWCcNgLFcSWPRh6sxXBwOKi2v8pKe9VhUqhR4j1H2sW2/P2QUbn/EF0hoB2Atk3FXTQAiAwRQQdsuM5ATbyHSZTuXqjX9bmiIoEpYeie2Zgv+9TsLroLca5KcPd/LU=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Marc Bonnici
	<Marc.Bonnici@arm.com>, Achin Gupta <Achin.Gupta@arm.com>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>
Subject: Re: [XEN PATCH v7 05/20] xen/arm: ffa: add remaining SMC function IDs
Thread-Topic: [XEN PATCH v7 05/20] xen/arm: ffa: add remaining SMC function
 IDs
Thread-Index: AQHZRtMYAJ2KLqffP06VvWf7OsCgT67cqSoA
Date: Thu, 23 Feb 2023 15:28:09 +0000
Message-ID: <CDBEDCB0-89D5-432A-A57E-EDC9B91F25FC@arm.com>
References: <cover.1677079671.git.jens.wiklander@linaro.org>
 <aed4b3a97e7ab2db85fc53fd157de82e0a1be8cb.1677079672.git.jens.wiklander@linaro.org>
In-Reply-To:
 <aed4b3a97e7ab2db85fc53fd157de82e0a1be8cb.1677079672.git.jens.wiklander@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.400.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|PA4PR08MB7593:EE_|DBAEUR03FT019:EE_|GV2PR08MB10384:EE_
X-MS-Office365-Filtering-Correlation-Id: 63abd662-c4e3-4c85-49ff-08db15b29812
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 ECklM+yB3NCk9EHNEBioRo/LmqRO9j43b3OL7RK37Esj7JtbPwS3AToYoE0GFs1GeHPimMef1RMYiAOvmd/urpca96byoYWNQkdKb+1blkn7zQ712b+Bvrh0TjQBzumMVpZynLTf4zwyBCg48TCV5mj4ULTHLFdwG82UMBbuRhY/a71KHsXlmslU2NplRnlyyyzD1j8/Op14KCK88013gV+Bn0o2Jus8JmXpE3VHYcb4cqCLtASP1rTOy85FfbVNiu352kYa5uBK1v0oISNfkiydC1L6OPZhYX549WEgDfZ0Od6gjvgDbeyq82c3fEgei0BR0npT2m0panS+iRh0yKTCTLc3zOdpkupFzFCTaTJPDAyP/VG3fg2JClG/RESTfa+oVxVHLrlIAXZtjSwO5349C/B6l+Nk83UWn1CNA//+FUNlr1dsmev8laciUPU77ZRmEMs2ZHTpN0+o2qtmgaNsz2MAYiUzvCwIv3lu/3D5UejhYSiEegFE+q4U7wqRFAy36t6QrT6SeDnxYvXJrqUgDb/1d7ITPj3rSNkWDS/iAQYj6Yu9O/vyYU/h55KYisw0jyPbu4w5Si7ibuIHjSbk9KHlvHclqSr16Cy7YDo0pb91+eFF/Dn5+WSDNWEhesaFVsiH8ZaOTnEjJbaPIkF8YpkSzE2JUZpXJaRIyNyxoUD6mhiqN4h+qP2uDHrn/tMriqWqx+ARm0w6s6O0TKk2KyZ1LbSEgUpwT59jYLM=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(39860400002)(346002)(136003)(376002)(396003)(451199018)(478600001)(6506007)(6512007)(26005)(186003)(71200400001)(66556008)(41300700001)(6916009)(66946007)(66476007)(66446008)(316002)(6486002)(4326008)(8676002)(64756008)(53546011)(83380400001)(8936002)(5660300002)(2906002)(122000001)(38100700002)(38070700005)(86362001)(54906003)(91956017)(2616005)(76116006)(33656002)(36756003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <4728EE8CB1D61A428A21D180E3D7B91D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB7593
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	dfea67de-1c86-4807-6ab7-08db15b2918d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pTihrvbVJ9mRWkxtygxw3Ae141MvEVKS6PadDD8+9NXn2juBmjFg2EvNk36Oe3Ib8GOLm2pwEB6IXfSuPF4AAFInxcAZpQFy/CC7WgsD0vBMaMks+bGrPYfcKuH82Ovb4ZC3DUnuKN88lxZSJYjmsMmccfyaqJ6idOjxR8Lm3tg2yTAjVAqtadLsRNdUdeGiFF5xQK89EKg5RhUCQwncwYxEgrF+5V1r/LUgnUA0zImzMamyy/WbGC1+wm2kgRhKozC6KoGGgdrkoIqapoe2qKngsCyM1Ij8JCoZZlwUyoN3xcvIJIylzN9Q8YXd4UDhPKsCnU8aPcNgboJQ/p/UqZvTkQ3onIrThXxwlStpVhS7XTwPA8Orm827mQsQ9i2qdm86GLCuzm/q8qmjGEmPrZGyQBVywFBiJX8Ox3THET+2UB+BeUk8hOrIr1e6udn0KGT8KM1TQjvDEKgCZpOidpmyooGPs0wMemmER8Q3pGtBOThsO1X//1icdARDwj76zBEyLFcGdu35bCqXppuyavfEUd5uNrbRxsZc8nA5DR0IcdiXJvu17Tn/7GnMuZEEHaaTdipfcWSAlcMsljwEk1klM9rJylijVaHW6xlHxygpoZP0ef6S8tkSa30/npWduFr24MmkpCaxIJR0p4zHSOz5KTHmTupuGAREHcKXKBZHq2nAPbxzfI2Rar7nj0ytl1qUqyX1LBbVji13TkBJEg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(376002)(39860400002)(346002)(136003)(396003)(451199018)(46966006)(40470700004)(36840700001)(82310400005)(83380400001)(36860700001)(47076005)(6506007)(36756003)(33656002)(40460700003)(81166007)(54906003)(82740400003)(316002)(186003)(336012)(40480700001)(478600001)(6512007)(356005)(26005)(6486002)(53546011)(2906002)(8936002)(5660300002)(6862004)(2616005)(41300700001)(4326008)(86362001)(70586007)(70206006)(8676002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2023 15:28:20.2754
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 63abd662-c4e3-4c85-49ff-08db15b29812
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB10384

Hi Jens,

> On 22 Feb 2023, at 16:33, Jens Wiklander <jens.wiklander@linaro.org> wrot=
e:
>=20
> Adds the remaining SMC function IDs from FF-A 1.1 specification.
>=20
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>

All number are coherent with the spec.

I guess you did not include the notification ones because you do not plan t=
o support them for now ?

Anyway:
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> xen/arch/arm/tee/ffa.c | 34 ++++++++++++++++++++++++++++++++++
> 1 file changed, 34 insertions(+)
>=20
> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> index 824153c9303a..aa6cdbe0a4f9 100644
> --- a/xen/arch/arm/tee/ffa.c
> +++ b/xen/arch/arm/tee/ffa.c
> @@ -59,7 +59,41 @@
> /* Function IDs */
> #define FFA_ERROR                       0x84000060U
> #define FFA_SUCCESS_32                  0x84000061U
> +#define FFA_SUCCESS_64                  0xC4000061U
> +#define FFA_INTERRUPT                   0x84000062U
> #define FFA_VERSION                     0x84000063U
> +#define FFA_FEATURES                    0x84000064U
> +#define FFA_RX_ACQUIRE                  0x84000084U
> +#define FFA_RX_RELEASE                  0x84000065U
> +#define FFA_RXTX_MAP_32                 0x84000066U
> +#define FFA_RXTX_MAP_64                 0xC4000066U
> +#define FFA_RXTX_UNMAP                  0x84000067U
> +#define FFA_PARTITION_INFO_GET          0x84000068U
> +#define FFA_ID_GET                      0x84000069U
> +#define FFA_SPM_ID_GET                  0x84000085U
> +#define FFA_MSG_WAIT                    0x8400006BU
> +#define FFA_MSG_YIELD                   0x8400006CU
> +#define FFA_MSG_RUN                     0x8400006DU
> +#define FFA_MSG_SEND2                   0x84000086U
> +#define FFA_MSG_SEND_DIRECT_REQ_32      0x8400006FU
> +#define FFA_MSG_SEND_DIRECT_REQ_64      0xC400006FU
> +#define FFA_MSG_SEND_DIRECT_RESP_32     0x84000070U
> +#define FFA_MSG_SEND_DIRECT_RESP_64     0xC4000070U
> +#define FFA_MEM_DONATE_32               0x84000071U
> +#define FFA_MEM_DONATE_64               0xC4000071U
> +#define FFA_MEM_LEND_32                 0x84000072U
> +#define FFA_MEM_LEND_64                 0xC4000072U
> +#define FFA_MEM_SHARE_32                0x84000073U
> +#define FFA_MEM_SHARE_64                0xC4000073U
> +#define FFA_MEM_RETRIEVE_REQ_32         0x84000074U
> +#define FFA_MEM_RETRIEVE_REQ_64         0xC4000074U
> +#define FFA_MEM_RETRIEVE_RESP           0x84000075U
> +#define FFA_MEM_RELINQUISH              0x84000076U
> +#define FFA_MEM_RECLAIM                 0x84000077U
> +#define FFA_MEM_FRAG_RX                 0x8400007AU
> +#define FFA_MEM_FRAG_TX                 0x8400007BU
> +#define FFA_MSG_SEND                    0x8400006EU
> +#define FFA_MSG_POLL                    0x8400006AU
>=20
> struct ffa_ctx {
>     uint32_t guest_vers;
> --=20
> 2.34.1
>=20


