Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F874757827
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jul 2023 11:34:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565050.882892 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLh5j-0004jd-Fn; Tue, 18 Jul 2023 09:33:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565050.882892; Tue, 18 Jul 2023 09:33:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLh5j-0004hk-C5; Tue, 18 Jul 2023 09:33:59 +0000
Received: by outflank-mailman (input) for mailman id 565050;
 Tue, 18 Jul 2023 09:33:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=88xE=DE=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1qLh5i-0004fd-6i
 for xen-devel@lists.xenproject.org; Tue, 18 Jul 2023 09:33:58 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2045.outbound.protection.outlook.com [40.107.7.45])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3734d598-254e-11ee-8611-37d641c3527e;
 Tue, 18 Jul 2023 11:33:56 +0200 (CEST)
Received: from AM0PR01CA0142.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:168::47) by GV2PR08MB8296.eurprd08.prod.outlook.com
 (2603:10a6:150:be::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.28; Tue, 18 Jul
 2023 09:33:26 +0000
Received: from AM7EUR03FT054.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:208:168:cafe::ce) by AM0PR01CA0142.outlook.office365.com
 (2603:10a6:208:168::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.18 via Frontend
 Transport; Tue, 18 Jul 2023 09:33:26 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT054.mail.protection.outlook.com (100.127.140.133) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6588.33 via Frontend Transport; Tue, 18 Jul 2023 09:33:25 +0000
Received: ("Tessian outbound 997ae1cc9f47:v145");
 Tue, 18 Jul 2023 09:33:25 +0000
Received: from ea69b31679df.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F3FA705D-14A4-493D-A28E-56C1A2A41341.1; 
 Tue, 18 Jul 2023 09:33:14 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ea69b31679df.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 18 Jul 2023 09:33:14 +0000
Received: from AM0PR08MB3778.eurprd08.prod.outlook.com (2603:10a6:208:104::24)
 by VE1PR08MB5646.eurprd08.prod.outlook.com (2603:10a6:800:1a9::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Tue, 18 Jul
 2023 09:33:12 +0000
Received: from AM0PR08MB3778.eurprd08.prod.outlook.com
 ([fe80::5a82:e906:eecd:7854]) by AM0PR08MB3778.eurprd08.prod.outlook.com
 ([fe80::5a82:e906:eecd:7854%3]) with mapi id 15.20.6588.031; Tue, 18 Jul 2023
 09:33:12 +0000
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
X-Inumbo-ID: 3734d598-254e-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Tbv1FKb9waQ6bfaBtm0gETPPGX9DNMmKySPDtTCDXs=;
 b=Y2o4wfQKbpsnpBZi1i9Bgn1t0mqO59TLz/FNYkkeZLH+rfsbc87Ob6SthXjpnNOBx51HL1IRtGW0JZMWoWE32ztlUtlxJTINVxBbq/ur76Fm7t7Ki5WZkEFQEYz4IUrWIiUKkUOPRoP5YQjWF05/ih6UwtaxxuFP+xMxXmv81iE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1f760bb9ffd1f118
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=huVZsB6raCyBeSjwB7sgOO5d7s0XUxXL7yorm216AmcPwedof2iIqfJLBnbhhO1wXquBjNabSqeNhfVQ2S7ULOCOEu8/INmZj2LAXJiMTvSD19PwmdSSdqUzy/JCkk+XbnRdDkrN4WTumyFjP0yl0yurB/IZGFnggjG8no57TiFVQ8b5bKSG92flkXcPQ8JmLSHsDUQlj0eP4wuznPRzphGUopCblQlyEAgxHgMTBwP4NEJC8e2ck0HA7sgZecfrSiexvAqExcS2bpITvxZ/0/NUq4PFAJgCaolKb9qU906qEUqeZ+TM3m9Lzx15wSiSEsjMf1QnW9PkLb4LMXj1tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Tbv1FKb9waQ6bfaBtm0gETPPGX9DNMmKySPDtTCDXs=;
 b=gc4bt+C7iQdbsdXjktU+JQiIBQp75H6a/xOafj+y4EEi626q1wj4YcPXv62Cq3v0XPfl4PKIrKtzomjOY3QglOhS4WaMI5j0q1jIWqUS02m3L52t61Polr5eHRfiilowC0iJ6BTJn0Shv2GYkghP6xL3waIoLh8QqiAQVtvadNUQ7zRn+niuM0MvbP4YP/LJllujXan8MFb4AK2/OHqE4rezg33QMC/A21cio7MrB+a994/9Z9epIbAtQT0HH/uBL3YDpfxi5pO7tQPJS83HYPuV7m37fkXlEo5hQFPeIIb1phmXIyQ3BEP7TL7RV4KhWramhbKEo4bJSB9uss/I2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Tbv1FKb9waQ6bfaBtm0gETPPGX9DNMmKySPDtTCDXs=;
 b=Y2o4wfQKbpsnpBZi1i9Bgn1t0mqO59TLz/FNYkkeZLH+rfsbc87Ob6SthXjpnNOBx51HL1IRtGW0JZMWoWE32ztlUtlxJTINVxBbq/ur76Fm7t7Ki5WZkEFQEYz4IUrWIiUKkUOPRoP5YQjWF05/ih6UwtaxxuFP+xMxXmv81iE=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>, Marc Bonnici
	<Marc.Bonnici@arm.com>, Achin Gupta <Achin.Gupta@arm.com>, Henry Wang
	<Henry.Wang@arm.com>
Subject: Re: [XEN PATCH v10 07/24] xen/arm: ffa: add defines for framework
 direct request/response messages
Thread-Topic: [XEN PATCH v10 07/24] xen/arm: ffa: add defines for framework
 direct request/response messages
Thread-Index: AQHZuH9VLJxUidniTESByzUbqPoASa+/RLGA
Date: Tue, 18 Jul 2023 09:33:11 +0000
Message-ID: <71CE2D23-EA20-4216-A448-EBECE0564875@arm.com>
References: <20230717072107.753304-1-jens.wiklander@linaro.org>
 <20230717072107.753304-8-jens.wiklander@linaro.org>
In-Reply-To: <20230717072107.753304-8-jens.wiklander@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM0PR08MB3778:EE_|VE1PR08MB5646:EE_|AM7EUR03FT054:EE_|GV2PR08MB8296:EE_
X-MS-Office365-Filtering-Correlation-Id: 27bb4bec-85d7-4a32-0213-08db87720969
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 /CJwQHUs1ngDZCS+ImxiF6PHUfa6lJGl8Io2t0+YyN41eVWeG/+8H1SO5EUnzVB5vITf0hRmweDMF908z/ZcTjbzwRKitfpz0EJ+7DC7p6jiuGXYMxOzVtFOh9W99mG7iytMWY3JPrr+Miah9dCK0FZY9XeCcY3jbR2G1AuZTIyJWPz/2/F5qY5BjErzcQVTnNwcyoFjW2slfwwyqWbDg9DUrxoNoPZK8s7QQCDs83ZG7p3Yw8Lgg4gd/ewxwS4iAsAfrDtlXfwvBuOcpLLiFq46LzgJczKlVi8LcRCmu20aQCYncKQCcOhtxiar58ie9vLieKPNenWlVbSs+OVEkv/Cn8HH4SnZs5henKWXS6J5msIuQ6hnjJzRdklKQhBzW60UbvsrvCe5iuo1x/EwcLfxNZGiOeMVVjOvd6qNvZ7sOwfycFwvKFe/h0aZtag2FBWhLPTO7ZnjbU45EYfrgNfL4Yx0w7+1qS3k+LPNpJ2uvI9d3G3vISBjAqN3gdMfLUpHfap+oX8EnIAZ8I1ZJm6ijzNJLosVGsxUwHgTQfKpZZTKPXUtfRcN7BcisDQhYcjre5RdR7yDhNrbIFZyJR79zHJWeTnmuZICnY0WhqhyvOiU6qqd1NJnGuhlF+gy7cxxdyApsWnWAjWZ+Ed/AQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3778.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(39860400002)(396003)(366004)(136003)(451199021)(2616005)(53546011)(41300700001)(6506007)(316002)(6512007)(83380400001)(186003)(6486002)(478600001)(122000001)(71200400001)(4326008)(6916009)(76116006)(66476007)(66946007)(91956017)(66556008)(64756008)(66446008)(38100700002)(33656002)(15650500001)(86362001)(8676002)(2906002)(8936002)(36756003)(54906003)(38070700005)(5660300002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <FC830DB1AA2D5B45849FAFA40346AF89@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5646
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	cd955d8b-e8f7-4f87-ad0d-08db87720143
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GmgAnjzYn8dFE2903d/lL/9lGC+drfYy6OZknt5c6SMXygx+jzXapb0tU52CVJsDkyfKNPnKOV0/kvt04IvC9MlDfABh5qkNYWWn72bfhOpbrNfFfxlmcmM4kXADic21HMAHGIergO7x+T8U+BROXWxtY/aerPgQZIK/lcpleHZzh2Ds6MJYsu/t+/7YFjX3wGKWJPDIoOwHbWqFOJu0N/sl5sSAJkeqzs+HGBV+HyqtyT3evwWls+R4pEvRMt8nPEQzUAWUkgbc6zRDJvZQux+WBcv1OCBzDCMdo7bT7/ZgINBol1KpoChQyA6Q05f0Eo3Zdmx3pgVU1oMmZ9NqwMa5RkHPZGWyZEc1qcksxtawl+6PCwiQ6Q6d8ZuZxrw6RDpnR+rDsW/MpfD04s2X+n2coDgQCvy1LlhxM0mFiI4rqdfEjq0bnT9qWcjTqcXHkaYX+8Ty2OjrrA7LpdRw797rhT8p9x8QlnVNOEmig+iq+xdc53Ub1BwIZSBMORnh7Qye1TFnvfRAR6xDwp7eozict++xsRtoAEXcVFZhVtH4a2kz9ebPNYpgE/tqc4dGLBJ7ogJyYJ10k9hn/kRd4r29jnfU9Ysxunie9hOQJkzUsdqJ4wYueCW4GXQbJgkg/z55uJcrtBtSwbhIHGnsB9GAnJxCUb1jRHTIbv86nzZO3Iw/66A3QHXzOubHazcmH6CAnOgO6+ymDO/hmWIGSeAK8alwMVl5XMJwXh/q11ZIYCEv3cGE1YKRg8PYUx4A
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(39860400002)(396003)(136003)(451199021)(82310400008)(46966006)(40470700004)(36840700001)(316002)(4326008)(70206006)(41300700001)(2906002)(47076005)(70586007)(40460700003)(40480700001)(54906003)(33656002)(86362001)(478600001)(8676002)(6862004)(8936002)(356005)(81166007)(82740400003)(36860700001)(6506007)(26005)(53546011)(36756003)(6512007)(6486002)(83380400001)(5660300002)(336012)(186003)(2616005)(15650500001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2023 09:33:25.6486
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 27bb4bec-85d7-4a32-0213-08db87720969
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8296

Hi Jens,

> On 17 Jul 2023, at 09:20, Jens Wiklander <jens.wiklander@linaro.org> wrot=
e:
>=20
> According to DEN0077A version 1.1 REL0, section 18.3, Table 18.{21, 25,
> 26, 27, 28}, add defines for framework direct request/response messages.
>=20
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> Reviewed-by: Henry Wang <Henry.Wang@arm.com>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> xen/arch/arm/tee/ffa.c | 13 +++++++++++++
> 1 file changed, 13 insertions(+)
>=20
> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> index c1dead73d1f2..56a0a10c1e99 100644
> --- a/xen/arch/arm/tee/ffa.c
> +++ b/xen/arch/arm/tee/ffa.c
> @@ -57,6 +57,19 @@
> #define FFA_MY_VERSION          MAKE_FFA_VERSION(FFA_MY_VERSION_MAJOR, \
>                                                  FFA_MY_VERSION_MINOR)
>=20
> +/*
> + * Flags and field values used for the MSG_SEND_DIRECT_REQ/RESP:
> + * BIT(31): Framework or partition message
> + * BIT(7-0): Message type for frameworks messages
> + */
> +#define FFA_MSG_FLAG_FRAMEWORK          BIT(31, U)
> +#define FFA_MSG_TYPE_MASK               0xFFU;
> +#define FFA_MSG_PSCI                    0x0U
> +#define FFA_MSG_SEND_VM_CREATED         0x4U
> +#define FFA_MSG_RESP_VM_CREATED         0x5U
> +#define FFA_MSG_SEND_VM_DESTROYED       0x6U
> +#define FFA_MSG_RESP_VM_DESTROYED       0x7U
> +
> /*
>  * Flags to determine partition properties in FFA_PARTITION_INFO_GET retu=
rn
>  * message:
> --=20
> 2.34.1
>=20


