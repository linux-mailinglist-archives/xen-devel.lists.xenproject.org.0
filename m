Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 959D96E0B66
	for <lists+xen-devel@lfdr.de>; Thu, 13 Apr 2023 12:29:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520611.808376 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmuCD-0005nq-Iy; Thu, 13 Apr 2023 10:28:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520611.808376; Thu, 13 Apr 2023 10:28:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmuCD-0005lv-G9; Thu, 13 Apr 2023 10:28:53 +0000
Received: by outflank-mailman (input) for mailman id 520611;
 Thu, 13 Apr 2023 10:28:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vvgu=AE=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1pmuCC-0005lp-Br
 for xen-devel@lists.xenproject.org; Thu, 13 Apr 2023 10:28:52 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20600.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fa81314e-d9e5-11ed-8611-37d641c3527e;
 Thu, 13 Apr 2023 12:28:49 +0200 (CEST)
Received: from AS9PR04CA0122.eurprd04.prod.outlook.com (2603:10a6:20b:531::24)
 by PR3PR08MB5707.eurprd08.prod.outlook.com (2603:10a6:102:8b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.28; Thu, 13 Apr
 2023 10:28:47 +0000
Received: from AM7EUR03FT009.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:531:cafe::5a) by AS9PR04CA0122.outlook.office365.com
 (2603:10a6:20b:531::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.32 via Frontend
 Transport; Thu, 13 Apr 2023 10:28:47 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT009.mail.protection.outlook.com (100.127.140.130) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6298.28 via Frontend Transport; Thu, 13 Apr 2023 10:28:46 +0000
Received: ("Tessian outbound e13c2446394c:v136");
 Thu, 13 Apr 2023 10:28:46 +0000
Received: from bf118fd0be95.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 90881DDF-AD1E-45BE-A0AB-ACE3A38CCFDF.1; 
 Thu, 13 Apr 2023 10:28:35 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id bf118fd0be95.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 13 Apr 2023 10:28:35 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by PAWPR08MB10044.eurprd08.prod.outlook.com (2603:10a6:102:362::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Thu, 13 Apr
 2023 10:28:32 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6%7]) with mapi id 15.20.6298.030; Thu, 13 Apr 2023
 10:28:32 +0000
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
X-Inumbo-ID: fa81314e-d9e5-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PTfLyCN+fkRfuN0F3YonH3ulHsbdCoNdxmseEkV5p6E=;
 b=bd5muEGq3UdxCmY/IWmF9TfpwTbEjqSmccp9NQoBt/Fqw86ThqIaZe/fUrTdejZ1dOC5kJt6B/IrCNFtbJ300aZU05A6J5MJFxSApvDQ3HXjv2wR7IEWmk4ZkYos6L/a6fMlPLZBlfINfPP994QOSnE54aFQIZrYplpEO45pgpY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 105883896882219a
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aBja5EV1Q3CTT/efdWDogIBK6SaDsLAbdrCmamMZe2fgqUTkKMu0f9B0SK3TQGOK3Tz9LOnv1XlaeJx6nBRkL3msT7cl1k69JKbW/kp45zrTM/JOlflMuY7la8etghUF54RUM6JlMqwBSN652b6h9Rvq1C0q+srmnygOqyqrMnEI64kMpwfCGQ0tLqIVZ5nrHelkcpKKi4CVyakkkc2CTuW+8I2TtlFUpVPXNxzspz/rU6Pvs5bV4/cPFDOUw6KgdXIymwn7mp6o49Zk6ylMEL1++G6aeYNYcbJ3QNcPCEbutnhj1cIVUH0LvuSDqydoPAkG6bZpl7Ru/30zCrVV8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PTfLyCN+fkRfuN0F3YonH3ulHsbdCoNdxmseEkV5p6E=;
 b=GPA/1yNFI1ELc89KaibtrPykCdwRGpk93P+yxemHrBRxKMptvEDWa8FVKXPDK25bGkTb9zQE23VgRzO5YojChvPPfvodIdQOMR5VD7qlQVTzUn4/mub1YLh63ZKZKn+yJmKfbFZ4X/8Kr7qJcJBkaFiCv9ctNkD43KAkLGFeQI8A1YuzD/8ALFNOfq/pHQ7nHNzVbjCQkl4QRwwGH2zjUJBwQ8268CSfgXiM2718P3aRMEwhI/3pRU0Pg1KZ5xPae6Ezp273pyRV1b/Y0zGNW/Rb5mY8rBJ/CnJTa93QJhiPZGg0iajk7hWcGNilgLrXhGdTzX80C7FgGm7Zo2Z7sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PTfLyCN+fkRfuN0F3YonH3ulHsbdCoNdxmseEkV5p6E=;
 b=bd5muEGq3UdxCmY/IWmF9TfpwTbEjqSmccp9NQoBt/Fqw86ThqIaZe/fUrTdejZ1dOC5kJt6B/IrCNFtbJ300aZU05A6J5MJFxSApvDQ3HXjv2wR7IEWmk4ZkYos6L/a6fMlPLZBlfINfPP994QOSnE54aFQIZrYplpEO45pgpY=
From: Henry Wang <Henry.Wang@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Marc Bonnici
	<Marc.Bonnici@arm.com>, Achin Gupta <Achin.Gupta@arm.com>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: RE: [XEN PATCH v8 05/22] xen/arm: ffa: add flags for
 FFA_PARTITION_INFO_GET
Thread-Topic: [XEN PATCH v8 05/22] xen/arm: ffa: add flags for
 FFA_PARTITION_INFO_GET
Thread-Index: AQHZbdfQYdI+Ke10g0y9D6f6Y8dBZq8pCBXg
Date: Thu, 13 Apr 2023 10:28:32 +0000
Message-ID:
 <AS8PR08MB79913E8D281DB674FDC0D70192989@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230413071424.3273490-1-jens.wiklander@linaro.org>
 <20230413071424.3273490-6-jens.wiklander@linaro.org>
In-Reply-To: <20230413071424.3273490-6-jens.wiklander@linaro.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 4F5B102125D24D46A420CEEA92276860.0
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|PAWPR08MB10044:EE_|AM7EUR03FT009:EE_|PR3PR08MB5707:EE_
X-MS-Office365-Filtering-Correlation-Id: dc55f43e-70ae-40f5-edd3-08db3c09dd49
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 GDdBHOUZRu7x/LLEd4YfEe2DZ+8KECTFA+y5bnxNNcJpkg/tCcnmBn+U8XPBYCaM8PMQibVAz3OcK7b9lClHipd0WFaCwBw77zFTZ0aPEXzojBn3VNatnxoCEHjlWMc01cb4UxALtTQuEcHI6E98JJeuVarDJAqhYdrC8ARAkNiZNjuMLLiFu7ppSvUAgAX1CFowFHFQoJj4JwLZjhk4dcFnvBB2zKnhjkmhO6jwWMFOuEJPynacT1A9viiK+dS2uznz82E7mSa6l9Cof6NvVV2u1LjKbtsTUFTxfucOdwPyYaYQI/tXog9zW+uP4+ruOIhRtVxOCErBEKsEedk+kgC56NQSafwRvbXJnQtumuRf4Yxa3LToYihxzEnvBc7y0Ib7khE7MxSetk2o2R0IkmsKv6r9xO/8Iu/02lmGUWCc9rUA2ZjtlpvCKl75sjJ1sx/WcCxBm63glcGlWWIFBMQxgFSIpI5zKcuIRFoYgiL/3NUfEAqd3SGypbncT7VFh/Lz8StYRwC+zUUXXpSSNSVhFwcQZLnDOYWwgs3lsR41+pAdLH7LtkKw9zMuxsmPayRebKPys96t3rCBI6TzINYcc7f20zupyTk3gWzD+4YI7WhExkZNAaPLvRRG8TwW
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(366004)(346002)(136003)(376002)(451199021)(478600001)(64756008)(66446008)(52536014)(55016003)(38070700005)(5660300002)(4326008)(2906002)(76116006)(66946007)(66476007)(66556008)(41300700001)(8936002)(8676002)(122000001)(33656002)(186003)(9686003)(38100700002)(316002)(26005)(110136005)(6506007)(86362001)(54906003)(83380400001)(71200400001)(7696005);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB10044
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	26ec4f1e-5931-4834-ead8-08db3c09d487
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JBQH98YUjfG0JLRLMXE0oXCYH6cVisRA5/tij5Gsay+u4IicDe/cqdyOgONF24jH/FfTSeLHP+teON7nS03q321BWNO8yVuEZHLfrBWz5xaqk4MghcHhL6oLGmL3gCL0D6c13yInLJeZh/7H+CJ3mgY/wrI9Fr0BoCY+Xph+3VtyECKyDLHOu+8NezQs9R5TqyrW7yQ6PampSH1ZZv3kACrh0WHES7mgHNBmvxRGEdxNEp1krpPp5Kb42AtJSXich+fJgdV0Ujlnbwa+O7F0teHPc25s0SyFVOW4b+8f+R2Mwm4Sj2k/cop4C+oChg37HOCgt61pCdNmSvUt9Ti3gakt4gNUJXyHAL/RlA9eZc6l/tT+JvxMDpoD+F1ySdhyI+Ni7NK+oeewZjUbnhmNxLRWyQyIrONXfwkuZS/dBtqLZCUYDjTMyCHkfQDH7ATujqr2q5GKOhvQ+W+ClrWY/hy0HyTTc2uTcB6QGRYq87OUY1X0Ts003uoc/o48WsvYYRC/mZO7wUDEL2XdNeDLWhIOwyEiSQsO1o+fPYO6S4rrD97GF8O9/mCqXUrWXMzzsR/nMUdddwkouyAfWE8WXrByO/DJlzCGTwuthgLkOV349GLHZcAeTng13n8+KQvdmNAtnWraiu8JOvFK4CNI23eyjV6dVIf+M3BK+u/am8psSvH+eIuNqgQvnC6EevrT5ZmRICospuFvWwB0NAimHw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(39860400002)(136003)(346002)(451199021)(36840700001)(40470700004)(46966006)(54906003)(36860700001)(83380400001)(478600001)(55016003)(7696005)(40480700001)(6506007)(9686003)(26005)(70586007)(70206006)(316002)(82740400003)(110136005)(4326008)(47076005)(336012)(186003)(5660300002)(52536014)(8676002)(8936002)(356005)(40460700003)(2906002)(81166007)(41300700001)(86362001)(33656002)(82310400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2023 10:28:46.7414
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dc55f43e-70ae-40f5-edd3-08db3c09dd49
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5707

Hi Jens,

> -----Original Message-----
> Subject: [XEN PATCH v8 05/22] xen/arm: ffa: add flags for
> FFA_PARTITION_INFO_GET
>=20
> Defines flags used for the function FFA_PARTITION_INFO_GET.

Nit: Similarly as my comment for patch #4, I would suggest that in
commit message you can mention the documentation number and
the chapter of FFA_PARTITION_INFO_GET. Something like:
"According to DEN0077A version 1.1 REL0, section 13.8, defines
flags used for the function FFA_PARTITION_INFO_GET"

>=20
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> ---
>  xen/arch/arm/tee/ffa.c | 34 ++++++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
>=20
> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> index ba0942e76993..72e7d0575de5 100644
> --- a/xen/arch/arm/tee/ffa.c
> +++ b/xen/arch/arm/tee/ffa.c
> @@ -57,6 +57,40 @@
>  #define FFA_MY_VERSION
> MAKE_FFA_VERSION(FFA_MY_VERSION_MAJOR, \
>                                                   FFA_MY_VERSION_MINOR)
>=20
> +/*
> + * Flags to determine partition properties in FFA_PARTITION_INFO_GET
> return
> + * message:
> + * BIT(0): Supports receipt of direct requests
> + * BIT(1): Can send direct requests
> + * BIT(2): Can send and receive indirect messages
> + * BIT(3): Supports receipt of notifications
> + * BIT(4-5): Partition ID is a PE endpoint ID
> + * BIT(6): Partition must be informed about each VM that is created by
> + *         the Hypervisor
> + * BIT(7): Partition must be informed about each VM that is destroyed by
> + *         the Hypervisor
> + * BIT(8): Partition runs in the AArch64 execution state else AArch32
> + *         execution state
> + */
> +#define FFA_PART_PROP_DIRECT_REQ_RECV   BIT(0, U)
> +#define FFA_PART_PROP_DIRECT_REQ_SEND   BIT(1, U)
> +#define FFA_PART_PROP_INDIRECT_MSGS     BIT(2, U)
> +#define FFA_PART_PROP_RECV_NOTIF        BIT(3, U)
> +#define FFA_PART_PROP_IS_MASK           (3U << 4)

I am a bit confused here, here (3U<<4) is "IS_MASK" but...

> +#define FFA_PART_PROP_IS_PE_ID          (0U << 4)
> +#define FFA_PART_PROP_IS_SEPID_INDEP    (1U << 4)
> +#define FFA_PART_PROP_IS_SEPID_DEP      (2U << 4)
> +#define FFA_PART_PROP_IS_AUX_ID         (3U << 4)

...here the same value is used for "IS_AUX_ID". According to
the spec that I referred to, bit[5:4] has the following encoding:
b'11: Partition ID is an auxiliary ID. Hence I guess the above
"IS_MASK" should be removed?

I confirm the values of other fields are consistent with the spec.

Kind regards,
Henry

