Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF976A18C3
	for <lists+xen-devel@lfdr.de>; Fri, 24 Feb 2023 10:31:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.500861.772386 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVUPh-0000sr-2a; Fri, 24 Feb 2023 09:30:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 500861.772386; Fri, 24 Feb 2023 09:30:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVUPg-0000qE-VG; Fri, 24 Feb 2023 09:30:48 +0000
Received: by outflank-mailman (input) for mailman id 500861;
 Fri, 24 Feb 2023 09:30:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/OIK=6U=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1pVUPf-0000q8-QB
 for xen-devel@lists.xenproject.org; Fri, 24 Feb 2023 09:30:47 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2061c.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::61c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ea73b8b2-b425-11ed-88bb-e56d68cac8db;
 Fri, 24 Feb 2023 10:30:46 +0100 (CET)
Received: from DB7PR02CA0016.eurprd02.prod.outlook.com (2603:10a6:10:52::29)
 by PAXPR08MB6702.eurprd08.prod.outlook.com (2603:10a6:102:134::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.24; Fri, 24 Feb
 2023 09:30:41 +0000
Received: from DBAEUR03FT057.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:52:cafe::e2) by DB7PR02CA0016.outlook.office365.com
 (2603:10a6:10:52::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.24 via Frontend
 Transport; Fri, 24 Feb 2023 09:30:41 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT057.mail.protection.outlook.com (100.127.142.182) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6156.11 via Frontend Transport; Fri, 24 Feb 2023 09:30:40 +0000
Received: ("Tessian outbound 43b0faad5a68:v132");
 Fri, 24 Feb 2023 09:30:40 +0000
Received: from 2dfaf0d8d9be.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 36A6EC97-9EC6-430C-951C-8C13542ADD2B.1; 
 Fri, 24 Feb 2023 09:30:30 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2dfaf0d8d9be.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 24 Feb 2023 09:30:30 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AS4PR08MB7853.eurprd08.prod.outlook.com (2603:10a6:20b:51c::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.24; Fri, 24 Feb
 2023 09:30:27 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::fca8:db36:98b:b1c4]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::fca8:db36:98b:b1c4%7]) with mapi id 15.20.6134.024; Fri, 24 Feb 2023
 09:30:27 +0000
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
X-Inumbo-ID: ea73b8b2-b425-11ed-88bb-e56d68cac8db
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ShNW6fG4S+HSV39TrO3L3RCVPXUhCOt4kcszsvLmgMs=;
 b=D7sbQZgk/PjENqzrvpw8ahvOAfv4QGBtYD40d6wVGjbC6KdbyLtfGPt2mio6kMDJjKeIIKy6HNfkbnolqkDKryautt77ALD0ViPWSTC0Fa0ubwSapFwGsmqLUmm6Cm8V/sDmz3jBk+XKPeJ5z3o+t4FDDS9/X1RWZD4UQ/jbhWQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 113e5bab92f8a054
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W/2mLbPwCk6CUGlfwT+ymbglmBHkdaFitN9XacTQrbzDpFDjKHOyIj1zwqyykZpzuv2H4UIBeea7qiYCUMeYKZ0h8OX7u+5Gbh7TC0O1T1aEpJl+oL9iv+ChSmAmbEzexTcIGRDxq1QVpuwhwVNEcEWgbW2OYbvHsnQ38qHaRDX6KopRN+Q0I5gVYT8c//Aol06YxtzenZ8J9wGH4uLz7ZhAN3M/Wis6I1hlohFOCD/iP6qhiyJWtW0FAeSGbwF2+tDuL8PH2wIEleCfdt7pGbYpiF4e4RB9hZAKsECZ0TlYeHrHPVDOja+4xx2TbN5rxkEA9LEsJMr/XM0wuQbXRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ShNW6fG4S+HSV39TrO3L3RCVPXUhCOt4kcszsvLmgMs=;
 b=R0oVX9Eaod100gJJnWayoAeIH8BJBSFjB6VchURCiv4HgyNjS/4MPoi14ELbmnXK/iGO4e53KXaWib+PV8/u6B6Oa9m0P6qO63IZZ3J3bBNTqzr9joYOlt3+/UHvk+t7OO2LFpzZIYiaSx5tILOO2y+32o416h3mA9fv7IKOL5QPE+9h5CcoJOOnwRF9WAvEE6IrMj5EgdZgVQ/vOteAWUSJY9EgVWW2U4Lahp79mDou+dozCY9RzLLA3xWgHl+80Ucu3S8gbh2RlFC97LdjT8MTG9VwwUmFlUbix2rA2sI4IZE1qHyAHvSCnxIEix1c4PgXEUYNLHp6Kswa6Vglkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ShNW6fG4S+HSV39TrO3L3RCVPXUhCOt4kcszsvLmgMs=;
 b=D7sbQZgk/PjENqzrvpw8ahvOAfv4QGBtYD40d6wVGjbC6KdbyLtfGPt2mio6kMDJjKeIIKy6HNfkbnolqkDKryautt77ALD0ViPWSTC0Fa0ubwSapFwGsmqLUmm6Cm8V/sDmz3jBk+XKPeJ5z3o+t4FDDS9/X1RWZD4UQ/jbhWQ=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Marc Bonnici
	<Marc.Bonnici@arm.com>, Achin Gupta <Achin.Gupta@arm.com>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>
Subject: Re: [XEN PATCH v7 06/20] xen/arm: ffa: add flags for
 FFA_PARTITION_INFO_GET
Thread-Topic: [XEN PATCH v7 06/20] xen/arm: ffa: add flags for
 FFA_PARTITION_INFO_GET
Thread-Index: AQHZRtMZk9F4kN2K/k606WK6T8KuQ67d144A
Date: Fri, 24 Feb 2023 09:30:27 +0000
Message-ID: <6B714A07-F3D0-4F27-BA66-078433430B3D@arm.com>
References: <cover.1677079671.git.jens.wiklander@linaro.org>
 <a3f70753dc853c2fb81efad72321ec00accf3f27.1677079672.git.jens.wiklander@linaro.org>
In-Reply-To:
 <a3f70753dc853c2fb81efad72321ec00accf3f27.1677079672.git.jens.wiklander@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.400.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|AS4PR08MB7853:EE_|DBAEUR03FT057:EE_|PAXPR08MB6702:EE_
X-MS-Office365-Filtering-Correlation-Id: e37cc82a-249a-44db-796f-08db1649cbc2
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 vwaqMGsmaUpsFInWPjBUaV/CWjkkYWhwuKHPbNMraSYQp7BKzVxzSMpE4Nq8NHt/Uakk8fA8rLJxasn3JbJrljZfFALN6tKdGs4DSqjWz6Xn+BM8+Vx2yKG27EAjDcRB4Ak7ss3wmpzb8zGiJYj23YRjulO9tUBWt9QXg8XDS1D5UuIQBhw3b7KVuqnF4TjVzfFnWySTQlAwTY2Ko2G3XWhpI8rMzO6dF8z/jFxSW5tpT/WzCrt90FvbuV6P2H0mmzRONrY31/d4JsppzG1hnT2MeWVvdSaQujwCLqYPt6Cj9Tm07ab1CIqZiVNygrPos9g7Ciiw1LBECj9u2GbC/2530dTMwJ8Vj2viz9VueXPWKe4I51Fd5wFMnR8AL67BOXHSVKh2c9HEeEJ7U3vQz5HNdDD466wgM9fC7lLP6GA+4A8QeyhZaTRTfax8pLnUhH8nairTj2vILNQ9wcDrbA5F2S1bLBoRpkQIT7C3BkLWExH/q8BzhOFNeNLQTZ+qClb04VKLViB43yAKirawo5rpVEgejvEaSchUoZ3d3pDmZsjO6Fvfify4d3O578Bn5GvqrebEDTVsmqC+mfqqm3XRIRHBZNsKGUucauTNDQySNRPlAt24UVroNhWU0DNl27STtjV5yCjzrENJMSnl0LWBaolQENUFH2dMaJvw0ELipPW4BH+8+Ze5s8Mzexns6kOHgRMo5QYLUn4S+83sbYYHvwcwsxTLP3zNIC1YBpY=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(346002)(396003)(39860400002)(136003)(376002)(451199018)(38100700002)(33656002)(41300700001)(4326008)(66556008)(76116006)(66446008)(6916009)(66946007)(8676002)(64756008)(66476007)(53546011)(8936002)(6512007)(6506007)(478600001)(86362001)(71200400001)(6486002)(54906003)(91956017)(316002)(2906002)(83380400001)(36756003)(186003)(38070700005)(26005)(5660300002)(2616005)(122000001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <F04C81A1429312478B4253FEFFABD6A3@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7853
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d78d1ac5-964e-445a-a0dd-08db1649c37e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZKQvVwz60JUdvccRPzPjrFWQHVJJccPN4oMp7+Oi05VuOFhzsvkEat0+DpgS3Wce0AMaULgE8/0wBAvCyT4hjLFCIWqgKaXfDIyH+SAXyXccAoq7Or6zDvadpsEhtp7zchRt4fOkn8/TmW1M3XlwmlYhybE9cgSpoB/sJUUock3MsdkK5W6/XMKTC+q5iclAH1OvEoN8Lfg3P0EX0JEdDQKZSxe1KgH3co5zwf1PA3XwYbY8PRxTiNlCUk20Of5Wyqaqv2MScZ7ijJ5oxnaNGJeiu+yvSknC+VWDakLRCHFfnI7JMZn+HdtAfh76wK2/mYuZHypiDWvr5r9j2KFI8etDDXF5MODgGXxlwfPhV85x5DA2Bk9AFhOLi8EzJNldi0gK/EEinPpgWi8kduFfrWwwTD5n7oy0kqbGdd5rN4I/veBFkmGsIlyRIpYShb9kqS14V/N4OOho0+DN6WVZiePL/YoCMRHnPj6nC4xef5lNopfzMbuoXRhAD5qZEED49ufkUpwc+OsliAYLsw/Z+yTbrrYvV6WEBSZ+W0f85tfhHuYWxndZPvXBt4Cwa0mEN40PZd9MKGUj2BAZzoOme4F9DC3P1f5C6W/2LTRFeeXEuODiQ3ld7ux3gUktSrhBJ2sHZ2EdSmF7Qaz4RD2SSoxFJjZSgO2/0fC+mNB83xztUhmLfywsehVPqLruzu9vJAk/NMCdp6SKE9oXuCqA5g==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(376002)(346002)(39860400002)(136003)(396003)(451199018)(36840700001)(40470700004)(46966006)(36756003)(33656002)(8676002)(478600001)(36860700001)(82310400005)(82740400003)(6486002)(83380400001)(336012)(47076005)(2616005)(186003)(53546011)(6506007)(6512007)(26005)(8936002)(356005)(41300700001)(2906002)(40480700001)(5660300002)(86362001)(6862004)(316002)(54906003)(81166007)(70206006)(70586007)(4326008)(40460700003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2023 09:30:40.9844
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e37cc82a-249a-44db-796f-08db1649cbc2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6702

Hi Jens,

> On 22 Feb 2023, at 16:33, Jens Wiklander <jens.wiklander@linaro.org> wrot=
e:
>=20
> Defines flags used for the function FFA_PARTITION_INFO_GET.
>=20
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> ---
> xen/arch/arm/tee/ffa.c | 26 ++++++++++++++++++++++++++
> 1 file changed, 26 insertions(+)
>=20
> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> index aa6cdbe0a4f9..f4562ed2defc 100644
> --- a/xen/arch/arm/tee/ffa.c
> +++ b/xen/arch/arm/tee/ffa.c
> @@ -56,6 +56,32 @@
> #define FFA_MY_VERSION          MAKE_FFA_VERSION(FFA_MY_VERSION_MAJOR, \
>                                                  FFA_MY_VERSION_MINOR)
>=20
> +/*
> + * Flags used for the FFA_PARTITION_INFO_GET return message:

This is somehow no completely precise.
Could I suggest to use what the doc says:
Flags to determine partition properties in FFA_PARTITION_INFO_GET return me=
ssage


> + * BIT(0): Supports receipt of direct requests
> + * BIT(1): Can send direct requests
> + * BIT(2): Can send and receive indirect messages
> + * BIT(3): Supports receipt of notifications
> + * BIT(4-5): Partition ID is a PE endpoint ID

You describe all bits until 5 but not 6,7 and 8.
Please describe all of them to be coherent.

> + */
> +#define FFA_PART_PROP_DIRECT_REQ_RECV   BIT(0, U)
> +#define FFA_PART_PROP_DIRECT_REQ_SEND   BIT(1, U)
> +#define FFA_PART_PROP_INDIRECT_MSGS     BIT(2, U)
> +#define FFA_PART_PROP_RECV_NOTIF        BIT(3, U)
> +#define FFA_PART_PROP_IS_PE_ID          (0U << 4)
> +#define FFA_PART_PROP_IS_SEPID_INDEP    (1U << 4)
> +#define FFA_PART_PROP_IS_SEPID_DEP      (2U << 4)
> +#define FFA_PART_PROP_IS_AUX_ID         (3U << 4)
> +#define FFA_PART_PROP_NOTIF_CREATED     BIT(6, U)
> +#define FFA_PART_PROP_NOTIF_DESTROYED   BIT(7, U)
> +#define FFA_PART_PROP_AARCH64_STATE     BIT(8, U)

bits definitions are coherent with the standard

> +
> +/*
> + * Flag used as parameter to FFA_PARTITION_INFO_GET to return partition
> + * count only.
> + */
> +#define FFA_PARTITION_INFO_GET_COUNT_FLAG BIT(0, U)

same here.

Cheers
Bertrand

> +
> /* Function IDs */
> #define FFA_ERROR                       0x84000060U
> #define FFA_SUCCESS_32                  0x84000061U
> --=20
> 2.34.1
>=20


