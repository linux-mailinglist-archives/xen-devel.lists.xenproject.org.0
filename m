Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 170267CE33C
	for <lists+xen-devel@lfdr.de>; Wed, 18 Oct 2023 18:58:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618731.962763 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qt9rQ-0005rs-QT; Wed, 18 Oct 2023 16:57:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618731.962763; Wed, 18 Oct 2023 16:57:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qt9rQ-0005pH-NB; Wed, 18 Oct 2023 16:57:32 +0000
Received: by outflank-mailman (input) for mailman id 618731;
 Wed, 18 Oct 2023 16:57:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B+S+=GA=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1qt9rP-0005pB-82
 for xen-devel@lists.xenproject.org; Wed, 18 Oct 2023 16:57:31 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0624.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::624])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6acb83ff-6dd7-11ee-9b0e-b553b5be7939;
 Wed, 18 Oct 2023 18:57:28 +0200 (CEST)
Received: from DBBPR09CA0044.eurprd09.prod.outlook.com (2603:10a6:10:d4::32)
 by GV1PR08MB8009.eurprd08.prod.outlook.com (2603:10a6:150:9b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36; Wed, 18 Oct
 2023 16:57:19 +0000
Received: from DBAEUR03FT015.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:d4:cafe::6e) by DBBPR09CA0044.outlook.office365.com
 (2603:10a6:10:d4::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36 via Frontend
 Transport; Wed, 18 Oct 2023 16:57:18 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT015.mail.protection.outlook.com (100.127.142.112) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6907.24 via Frontend Transport; Wed, 18 Oct 2023 16:57:17 +0000
Received: ("Tessian outbound d1b3e404ba03:v215");
 Wed, 18 Oct 2023 16:57:17 +0000
Received: from d88b962c1cae.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B2B15E3A-D1EA-4B49-BFF6-A9420AACAFD1.1; 
 Wed, 18 Oct 2023 16:57:11 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d88b962c1cae.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 18 Oct 2023 16:57:11 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AS8PR08MB8372.eurprd08.prod.outlook.com (2603:10a6:20b:569::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36; Wed, 18 Oct
 2023 16:57:08 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::30ea:681d:5fa7:8bfb]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::30ea:681d:5fa7:8bfb%2]) with mapi id 15.20.6907.022; Wed, 18 Oct 2023
 16:57:08 +0000
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
X-Inumbo-ID: 6acb83ff-6dd7-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9SSYl09/YNSdJREsa4NJqyceIX6U7xNIcXTttQPm2ec=;
 b=62ERlDbxYQgLzHFb9CbDKUFJKKckPrpVmbVFlu8Zi+clhwtorPvbwus8afr174e1wiov73qOzrTDEJWYyaZgpSzaYNFo1yzbHUwIPyiLBY6fE689fyxYKPqNL85ma9n1jZCoS8x88IXBk3i9W7rrJ1QKqldcuVRBfBP30/mdJqA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 902c6696850cbd39
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BBT3nAMPr83g929ZcUL1nLTNEFOLYgbI5xl1cxyPq3qiYSc5c8eLJ6nQ/vkx1GwyrwLLLxSeLlw/k3Ao7u/sAIaA4Tq+0nPxDPcRuPUZ7RHe/gTG+GDi1Qoed5N3VZTAisUuInj6iXc5Q7ZluM/rAqJyqJ2vmB5Xr57K8BwbGqswN7vRWM3LazjTtxL3IBlArIcIoHvHH803T4DQ7QjcUAs5K1C7eiiCoigjQC0WL8IWKzhp2QqBBMMTD3RwrHHq33bxytbXugwNBRs49kCNABMo8WyToyhFeXj/3bK5v34DlG2X3fpDQM3RjERX7MKjf8CiF5xI/QY2EJtiB5LD9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9SSYl09/YNSdJREsa4NJqyceIX6U7xNIcXTttQPm2ec=;
 b=LTy7AbnHfDSWmt/WuUY0SwfQS28SDBHFr7FJAKaek2k82JsFrewR9ZrQfJUuTwk6SvtnghcJDOqCMG/0zArjMtTW7TItkZP0lK/5rVQNSFSKs7Hs4t1yBBDGA9LrBl5l3HnAo+5jp+gfHkrPZ2pkO9EJmoGdJl0g1yZjwrdi7MOZzynAHdxVCb/8BRv13lDDv8xz6vV3qyL8wkYu17e4RoPoRAhMQWFcSe7iKqaDIhE4qwpHvaT7rrRGD6bFUO/1lQfxqIjvu/R+izfwY1HpX3MPoWa5cbz9A5PmJ8nZo2bJqml37xK/JLUAR728tJ5YOKSSYQEGhgwhKn7gG0CENQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9SSYl09/YNSdJREsa4NJqyceIX6U7xNIcXTttQPm2ec=;
 b=62ERlDbxYQgLzHFb9CbDKUFJKKckPrpVmbVFlu8Zi+clhwtorPvbwus8afr174e1wiov73qOzrTDEJWYyaZgpSzaYNFo1yzbHUwIPyiLBY6fE689fyxYKPqNL85ma9n1jZCoS8x88IXBk3i9W7rrJ1QKqldcuVRBfBP30/mdJqA=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Federico Serafini <federico.serafini@bugseng.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, "consulting@bugseng.com"
	<consulting@bugseng.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [XEN PATCH v2] arm/cpufeature: address violations of MISRA C:2012
 Rule 8.2
Thread-Topic: [XEN PATCH v2] arm/cpufeature: address violations of MISRA
 C:2012 Rule 8.2
Thread-Index: AQHaAcHJMtQzql3zbUq10ZfwUNid8rBPxLGA
Date: Wed, 18 Oct 2023 16:57:08 +0000
Message-ID: <53253259-C582-4941-9CF0-BD61B4CA16AA@arm.com>
References:
 <7976ea7591a073a7896c2cfe9d0b1b77f414731a.1697632684.git.federico.serafini@bugseng.com>
In-Reply-To:
 <7976ea7591a073a7896c2cfe9d0b1b77f414731a.1697632684.git.federico.serafini@bugseng.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|AS8PR08MB8372:EE_|DBAEUR03FT015:EE_|GV1PR08MB8009:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c4ab611-7fba-4ec4-c74e-08dbcffb4973
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 4DzDpC+YB69DN8uforbkmaQjg2CAxixKDhjdD+cVVGN2KQezld4udyv5oYVrbH1yB19oJRsfzBctyzVsAX0I0QFDkNNQMjmSlAX3tRESEbPJfKAjxG9P7FQp/18kR3v+zNRa1XtkqYYD5/G181qZLngFvMyXCzTEmprPo0T6T57XSyGlKVvFei/aY/Mbi7yvTeuLE/lDrl8J5TqHfA7qVQFzmj7CaCAKZpoYaootg+48R21fcETiIF23KlnF8iaqmU7ICsyNn1iToCtWO1DqXUgv6GoJ1hnWEIUHJBG2gZFdXAYGeQpdmQsoNrLwINB1sHiU96uKKVolwbJxtlsnWryn0L0Ip4iIwpmdSqV2E4UTN+oc9zNbBNsBlsxy2KXjYFqxTIYJJhDplY0bZ6+oPOYfJA96c9r5hUn8N+w2O2n9NTTBylJwdt8wi6V3qOPj/wSqvdFuMJ4m3vpB+ovGm69iLUf74RHaYyl+z27xbHGPcDQQwJJ5zafY72OhC85IsxraV5nFloch757OUtSbeV0Uf0aW5bacMpFja7eVGzWLQtK/89TVHVvIRgR0DtgsI6gYBarwI9ogN+kl7hjj910XcAgkkyQR7ANclR7ZTuygxbW6aWYRnK9tmOtlKABhnyhHN2Ynh6cX2kLv6qtXMg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(366004)(39860400002)(376002)(346002)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(36756003)(33656002)(6512007)(66476007)(6916009)(66946007)(66556008)(54906003)(76116006)(91956017)(66446008)(64756008)(38100700002)(86362001)(38070700005)(122000001)(53546011)(83380400001)(8936002)(2616005)(6506007)(71200400001)(4326008)(2906002)(478600001)(6486002)(5660300002)(316002)(8676002)(41300700001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <E2FC68B4146E0746BC85C62C3328C2A7@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8372
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9e1b8496-5fae-4272-5043-08dbcffb43d1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/W278xmJPHAtHOV40c4PXVo81yRJnjws6Nwq7Z5kHrTW+8cU8mUjxhTNtKMMEVtOMhLFubtadDkeF6jLD2mHQdKFA/cT/AezZpoK66bExFnXNSZkqbb24ProoxCHLJN7VATY6bojF/tUyOya/grcQbz/hfoLZ0TFpYaQES1/Yj9LNQAbGW9V1qQPdCgPhCA5ZVLc9TIb9Hemokfo3IsF6BR+KXU+myolRPdwFmm9Cpx2eviixnfCh6T5S/Mi82iqRrcZFDlqI4R1/yrIN34wjzf4vgyv8bvwgExxmVmY8lK8sPSQ3HKVf6tCypqEAM0CDyKrzVaIcFGHKfgAcQ2rESGmAjXgqplSbNGdzAiTctylfWMM+mwmKU/y33LRPq7VoI66vCl9PV7V1s+B+eWkh8XlwyzV4BRIR3lBAyEod7MRefhWbkxn8ddUjK05ej7KZ0CEQqiM1smDeqXbxP//Z3O/L+ZOQe0rGiDuFwlcfCFbuKhIk5ilUs0dQr3NP5IT7q8HskAFLQVAa3CPKOfqEYKud7fsiVOcyRu79im1fXIC3VaqbI5cRO2/z9E8gqNzuHSJRna2HB07Gd9WyP804dskIaEXqBDZRyzB2yesiJQD9eGzVujl8sTgkSal/u8HlxznNtjcRdTqinEzzlpvEQTTLFRrL8/0EHI6oub3Nn/7hrBpwF8/VOt7OR4p+ZbSN5J50BJPE3THvIu/RNdTVtbKub2G6aF/Isz/UEHofk/AqAAng/kvbHdvdZ6EsTBF
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(346002)(396003)(376002)(136003)(230922051799003)(186009)(82310400011)(1800799009)(451199024)(64100799003)(40470700004)(46966006)(36840700001)(36860700001)(478600001)(70586007)(6486002)(70206006)(54906003)(356005)(107886003)(336012)(53546011)(81166007)(33656002)(2616005)(83380400001)(8676002)(316002)(2906002)(41300700001)(4326008)(6862004)(8936002)(5660300002)(6512007)(36756003)(86362001)(82740400003)(47076005)(6506007)(26005)(40480700001)(40460700003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2023 16:57:17.8653
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c4ab611-7fba-4ec4-c74e-08dbcffb4973
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8009

Hi Frederico,

> On 18 Oct 2023, at 14:50, Federico Serafini <federico.serafini@bugseng.co=
m> wrote:
>=20
> Add missing parameter names. No functional change.
>=20
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> Changes in v2:
> - fixed names.
> ---
> xen/arch/arm/include/asm/cpufeature.h | 8 ++++----
> 1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/xen/arch/arm/include/asm/cpufeature.h b/xen/arch/arm/include=
/asm/cpufeature.h
> index 8011076b8c..c95582044a 100644
> --- a/xen/arch/arm/include/asm/cpufeature.h
> +++ b/xen/arch/arm/include/asm/cpufeature.h
> @@ -127,8 +127,8 @@ static inline void cpus_set_cap(unsigned int num)
> struct arm_cpu_capabilities {
>     const char *desc;
>     u16 capability;
> -    bool (*matches)(const struct arm_cpu_capabilities *);
> -    int (*enable)(void *); /* Called on every active CPUs */
> +    bool (*matches)(const struct arm_cpu_capabilities *entry);
> +    int (*enable)(void *data); /* Called on every active CPUs */
>     union {
>         struct {    /* To be used for eratum handling only */
>             u32 midr_model;
> @@ -448,10 +448,10 @@ struct cpuinfo_arm {
>=20
> extern struct cpuinfo_arm system_cpuinfo;
>=20
> -extern void identify_cpu(struct cpuinfo_arm *);
> +extern void identify_cpu(struct cpuinfo_arm *c);
>=20
> #ifdef CONFIG_ARM_64
> -extern void update_system_features(const struct cpuinfo_arm *);
> +extern void update_system_features(const struct cpuinfo_arm *new);
> #else
> static inline void update_system_features(const struct cpuinfo_arm *cpuin=
fo)
> {
> --=20
> 2.34.1
>=20


