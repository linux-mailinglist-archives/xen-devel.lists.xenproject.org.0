Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 225237916B8
	for <lists+xen-devel@lfdr.de>; Mon,  4 Sep 2023 14:01:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.595107.928601 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qd8F8-0003qr-82; Mon, 04 Sep 2023 11:59:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 595107.928601; Mon, 04 Sep 2023 11:59:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qd8F8-0003nY-4o; Mon, 04 Sep 2023 11:59:46 +0000
Received: by outflank-mailman (input) for mailman id 595107;
 Mon, 04 Sep 2023 11:59:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pUi+=EU=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1qd8F6-0003nP-B9
 for xen-devel@lists.xenproject.org; Mon, 04 Sep 2023 11:59:44 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20613.outbound.protection.outlook.com
 [2a01:111:f400:7d00::613])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 87399f3b-4b1a-11ee-8783-cb3800f73035;
 Mon, 04 Sep 2023 13:59:42 +0200 (CEST)
Received: from DU2PR04CA0260.eurprd04.prod.outlook.com (2603:10a6:10:28e::25)
 by AM8PR08MB5780.eurprd08.prod.outlook.com (2603:10a6:20b:1c4::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.32; Mon, 4 Sep
 2023 11:59:38 +0000
Received: from DBAEUR03FT007.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:28e:cafe::e3) by DU2PR04CA0260.outlook.office365.com
 (2603:10a6:10:28e::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.32 via Frontend
 Transport; Mon, 4 Sep 2023 11:59:38 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT007.mail.protection.outlook.com (100.127.142.161) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6768.22 via Frontend Transport; Mon, 4 Sep 2023 11:59:37 +0000
Received: ("Tessian outbound 169aaa6bf2b7:v175");
 Mon, 04 Sep 2023 11:59:37 +0000
Received: from 03d416cd6d63.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0BEA148F-4CA3-4668-B216-6FE42A71A45D.1; 
 Mon, 04 Sep 2023 11:59:31 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 03d416cd6d63.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 04 Sep 2023 11:59:31 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DB9PR08MB6666.eurprd08.prod.outlook.com (2603:10a6:10:2a7::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.32; Mon, 4 Sep
 2023 11:59:29 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::3cb8:2053:e853:92fe]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::3cb8:2053:e853:92fe%4]) with mapi id 15.20.6745.030; Mon, 4 Sep 2023
 11:59:29 +0000
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
X-Inumbo-ID: 87399f3b-4b1a-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c27yNJOKjC7RlfGgXnh4UN95e54DnrHxIaarBPGZC5Y=;
 b=UvSFVr6a+eB2PVmZDLvvm6mlCAoSBBTcGa8o4/GDm9qJmJUiLlrpdl5ALsJ9oXHD+ITmPNQNH/JK/mAmqY0+OFl4Esq9RiQ8VjxgpLsyV1ha25bcdwOOMxXOYDcHQoafGQaulf5TNp1qO1/m+YIc6N9TRLMD/P3OOTTzPaOUHeI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 69ada62281fbdb12
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U69xA5w+o7jGAM/nkULT6sabWCjHVW3kkjElFYBiLLMpogSm6qRdd48dP4ttWHqpp5DX2qx3Kzvj800EXHde/9xsjOH/PiXC+kfZQQ379pZBKgR69J4Zy5Lal3QNiFWFg21eeSgpP9CG0p1/30BJjr8vzct+ht0ECLEb0eopuoCzFOLLV5LOTbYII/kAxwrSqqkecha3RzhNOadg7ptrOUns4v+RFwGyHQMqjGuq2QzrVlgIOQR+WPB8FLGcEGbUuRRxPLqwwkwfez9crtHgQVGw+NYFiYi21Y5VkZPEW0RDEB7VWWiV7ag1OLu3t/kRl5FGoow5Lg2B1ScA4Br2nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c27yNJOKjC7RlfGgXnh4UN95e54DnrHxIaarBPGZC5Y=;
 b=jiXO3hbQSpZ4aKKpXR0zT7lL/KhYiNb4KL1lJ3AeVuAPiAFUq4MvCMcw/F7vHaabgjz4C5f9AfV40UkpDY3RovnkADvWOzrNJatZHm+Kh9AH5FCC7GKPzpBEtx0jlxk8Weg/54Co/VmHudSo2gMCODzJZIchQJU0gj8AImxVl4gHuEUpIMJPrq2fcrKO07QTY1BIUolwYdboPF4B+jCVUevAv0iJWjwvTPo0lukjDqKWi37z6gRwRgRZJ3FCFSw4C3xZvIyuvwd8SJeH73UMGhQ0Zv0RZDvW0sqRjRx2GNpEXkTFwfuUmet9gRH4uhqCQLOR+O+uoz+wHOsxHbBi/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c27yNJOKjC7RlfGgXnh4UN95e54DnrHxIaarBPGZC5Y=;
 b=UvSFVr6a+eB2PVmZDLvvm6mlCAoSBBTcGa8o4/GDm9qJmJUiLlrpdl5ALsJ9oXHD+ITmPNQNH/JK/mAmqY0+OFl4Esq9RiQ8VjxgpLsyV1ha25bcdwOOMxXOYDcHQoafGQaulf5TNp1qO1/m+YIc6N9TRLMD/P3OOTTzPaOUHeI=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 1/2] xen/arm: smmuv3: Add missing U for shifted constant
Thread-Topic: [PATCH 1/2] xen/arm: smmuv3: Add missing U for shifted constant
Thread-Index: AQHZ3xA6Uh0Zbf8c6kSq95XOBrrVBLAKkFYA
Date: Mon, 4 Sep 2023 11:59:28 +0000
Message-ID: <7B8C61A5-0AC2-487D-B7B5-908A1184B205@arm.com>
References: <20230904091406.942-1-michal.orzel@amd.com>
 <20230904091406.942-2-michal.orzel@amd.com>
In-Reply-To: <20230904091406.942-2-michal.orzel@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|DB9PR08MB6666:EE_|DBAEUR03FT007:EE_|AM8PR08MB5780:EE_
X-MS-Office365-Filtering-Correlation-Id: 34e95101-c2e2-4715-e20a-08dbad3e69ca
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 fpwOfH36ljnbin4TPLZjaSP9oxnEGh4XjwsOnt2lDEUvoPHWsAfQW4EJqqGIepOcvWkspuG/RTuTx60HjlP+A+PNxe+aqCu9AnH4AhEEMihODeki633ssUxS9VRIViXnu1Dy4x0X0xt0jIyeQxhnQaAFB5RbDylzNg0L5BDflQuW40ZiykQL9pooskE8cBuYwHYcXgE/HNh7eH5CdJzPCDrE81fPXI1g5709PneQuzpXNJzDs+3zJSCipjSE9JBMxgwUF+qXdy6X1FQO6YkopRRYa//pwAj5xHX4H5PbJsNRe5kw/1e/Ww+mQUkAgNiU/XTgaq4X9fLmToV40Gd5h/ESDKLgqYT5o4M8+hguN0FlEH+Lc/gcWkaQg7cmspu4LfIc1i3WDiq0CFuaJwpNVSsWmQjC4TjR4STjrbb7HXibpe6ime6HfKS4B1f2QO7/7vcG8mR1MZ2/hT1arTa8HM/RdByBDdJRyUonC5yzmD73kQcuSc1qQ/K/Gy4spf/qlzxIRbJ2+EpYppy7DjTQeSrone3JofYEtAzRfauHHkmJxULUizD1mgjpG3k9HDwbDCATt58hE875yoAzB0jEx2HKKtmuc9FwKJHpxKp+aY11cpwNTBuYusOXsTvPzYQLb7gyv0RflwdbfuBs2QCjQA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(396003)(39860400002)(136003)(376002)(186009)(1800799009)(451199024)(41300700001)(71200400001)(6486002)(6506007)(53546011)(122000001)(478600001)(83380400001)(2616005)(26005)(6512007)(38070700005)(38100700002)(54906003)(91956017)(76116006)(66946007)(2906002)(36756003)(66556008)(66476007)(6916009)(64756008)(66446008)(316002)(33656002)(86362001)(5660300002)(8936002)(4326008)(8676002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <581C922DCF5CC347A8DDAB2A2739A3DA@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6666
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	bd8936f1-822a-4268-c5bc-08dbad3e647a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	x9HkTms8j2QQqsdG9CbR82PFC8rxoM+6zCtdHT7LEd6q+ikn4Y7BpbLRpVaY69epZAnLC6iiQej69/o95+AQXF8dwHQar9yu7iXKV2uHWVbDCiGuG5UF3R1hYB1IU+5cIrgRTmr1RQiJJIAc/ojwudRStwVUn/dw/8/VSjxQbfeQ9/KRXzwbHPVhAO2gnWoSFaZr7lsY7GmCjrDEmogOa4tV63O2/VJMnJ8kskMNIGvStYtgG52nAIeQEJb2AETdE05r7IwpGmQy+Ng/4+3mt+qQ/Xi3mN6TWY43d9Q4aOZwlriadi3ldErv9qQIo4V5knkS6G9sU8xBr9OsSU/UP5P+peKAMusXwJUWlouDf15uDke61RhEfFDv4h5mpIVzKjyAuP9bpR9zq+NRWK/svbNsqScIhVozLtE1JshXhCV5fkyMvS46aPR2b+HqZalQjooeG93z2uIGF4izJAmCZ/XAI2I74CLZnSWEdlzBqRJhPLOuswoH8KpBxlzdR4Debh/SXK0FtNcxkDpS/Dg3DT+8VLH4WW68DoY7noRInCF6CIhe7iRGopODyt/TgLotHecyk1Wz7d5fhnojK0f1qzJ7W2sOXeH5tK2Mt+n5S8DNdyL537CgJRjcXO+aMrk2uImHNGoszJdJ7HLGHFbysM+wXWP6ah8E1yiANqbHJyHojyKMzW8HcLHVUG9eCyzdBAFrHe+0xYv4mGLolpHBVXNADDYjeMjMdBWN/7WB8C7Wkr2u4FAAXQD0MW3iaLUl
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(346002)(136003)(376002)(396003)(1800799009)(186009)(82310400011)(451199024)(46966006)(40470700004)(36840700001)(53546011)(6486002)(6506007)(40460700003)(41300700001)(6512007)(54906003)(81166007)(82740400003)(356005)(2906002)(36756003)(33656002)(86362001)(316002)(70586007)(478600001)(70206006)(40480700001)(6862004)(8676002)(4326008)(8936002)(336012)(26005)(83380400001)(2616005)(107886003)(5660300002)(36860700001)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2023 11:59:37.7538
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 34e95101-c2e2-4715-e20a-08dbad3e69ca
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5780

Hi Michal,

> On 4 Sep 2023, at 11:14, Michal Orzel <michal.orzel@amd.com> wrote:
>=20
> When running with SMMUv3 and UBSAN enabled, the following is printed:
>=20
> (XEN) UBSAN: Undefined behaviour in drivers/passthrough/arm/smmu-v3.c:297=
:12
> (XEN) left shift of 1 by 31 places cannot be represented in type 'int'
>=20
> This refers to shift in Q_OVERFLOW_FLAG that is missing 'U' suffix.
> While there, also fix the same in GBPA_UPDATE.
>=20
> This should address MISRA Rule 7.2:
>    A "u" or "U" suffix shall be applied to all integer constants that
>    are represented in an unsigned type
>=20
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> xen/drivers/passthrough/arm/smmu-v3.h | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/xen/drivers/passthrough/arm/smmu-v3.h b/xen/drivers/passthro=
ugh/arm/smmu-v3.h
> index b381ad373845..05f6b1fb7e33 100644
> --- a/xen/drivers/passthrough/arm/smmu-v3.h
> +++ b/xen/drivers/passthrough/arm/smmu-v3.h
> @@ -87,7 +87,7 @@
> #define CR2_E2H (1 << 0)
>=20
> #define ARM_SMMU_GBPA 0x44
> -#define GBPA_UPDATE (1 << 31)
> +#define GBPA_UPDATE (1U << 31)
> #define GBPA_ABORT (1 << 20)
>=20
> #define ARM_SMMU_IRQ_CTRL 0x50
> @@ -159,7 +159,7 @@
>=20
> #define Q_IDX(llq, p) ((p) & ((1 << (llq)->max_n_shift) - 1))
> #define Q_WRP(llq, p) ((p) & (1 << (llq)->max_n_shift))
> -#define Q_OVERFLOW_FLAG (1 << 31)
> +#define Q_OVERFLOW_FLAG (1U << 31)
> #define Q_OVF(p) ((p) & Q_OVERFLOW_FLAG)
> #define Q_ENT(q, p) ((q)->base + \
> Q_IDX(&((q)->llq), p) * \
> --=20
> 2.25.1
>=20


