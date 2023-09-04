Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A26E791A63
	for <lists+xen-devel@lfdr.de>; Mon,  4 Sep 2023 17:17:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.595306.928829 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdBKJ-000402-TV; Mon, 04 Sep 2023 15:17:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 595306.928829; Mon, 04 Sep 2023 15:17:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdBKJ-0003y0-Qo; Mon, 04 Sep 2023 15:17:19 +0000
Received: by outflank-mailman (input) for mailman id 595306;
 Mon, 04 Sep 2023 15:17:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pUi+=EU=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1qdBKI-0003xu-DR
 for xen-devel@lists.xenproject.org; Mon, 04 Sep 2023 15:17:18 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0606.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::606])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2260692d-4b36-11ee-8783-cb3800f73035;
 Mon, 04 Sep 2023 17:17:17 +0200 (CEST)
Received: from DU7PR01CA0033.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50e::11) by GV1PR08MB8130.eurprd08.prod.outlook.com
 (2603:10a6:150:92::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.30; Mon, 4 Sep
 2023 15:17:09 +0000
Received: from DBAEUR03FT010.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:50e:cafe::e4) by DU7PR01CA0033.outlook.office365.com
 (2603:10a6:10:50e::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.32 via Frontend
 Transport; Mon, 4 Sep 2023 15:17:09 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT010.mail.protection.outlook.com (100.127.142.78) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6768.22 via Frontend Transport; Mon, 4 Sep 2023 15:17:08 +0000
Received: ("Tessian outbound 169aaa6bf2b7:v175");
 Mon, 04 Sep 2023 15:17:08 +0000
Received: from ae8c9c03de5f.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B2C66D6F-F144-4F9C-A660-B7F02B1CA0B5.1; 
 Mon, 04 Sep 2023 15:17:02 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ae8c9c03de5f.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 04 Sep 2023 15:17:02 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DU0PR08MB7462.eurprd08.prod.outlook.com (2603:10a6:10:355::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.30; Mon, 4 Sep
 2023 15:17:00 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::3cb8:2053:e853:92fe]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::3cb8:2053:e853:92fe%4]) with mapi id 15.20.6745.030; Mon, 4 Sep 2023
 15:17:00 +0000
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
X-Inumbo-ID: 2260692d-4b36-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=moJc+Plf2lnc+nhGDyE/NC3UhTpdM5oHUFDrKjzeQGM=;
 b=1jCdM3uAjEh5GgVY/APjRV70GKVBepUgU9bTxofJTlKqykkAO8zNVu1klmjEX4XRFCK1qUU3GIFQsxvOpANqeCSU+XCGMA1QPcSrHqNBIBlvONYLB+RAex25YGYcCkti9p+kcg4PPyL+MGBhlEWTmgYnnaOUf/wx5hSvj+TxSzI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4243503d17548822
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AVecoezH//7eBLyAV59mGjFkskN/EZJEySGgszIdXwSWsCRG4Yek4pMeKvmlHLVxOo36eN9HFNDxWfBlIxBNfzpY43ghQH1nQLcYkpC8F0XI1zSNImHWcc4zL3O/KKbLda0efil6YDv4cJpN/h1t5I3tfhKkqah+Z3ekPHtFXeDB96qkE8cV3IOiG8uq6gVbjHqsgcIVRmwtvC8NryUM/XSFmv6s+QItrDvmcKsxtUnINhus+Gg+179DqD5wLV0AWMM3Z2LAPksRUfFPANpyE9Taq8iqhdiekNZlYY3XFkT6L6HHKo57roeLw9jd+sXLA0FOJBc9ATs7Qxi+mBCSOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=moJc+Plf2lnc+nhGDyE/NC3UhTpdM5oHUFDrKjzeQGM=;
 b=OxCkULfF93+8tv94MHKumwt7YlEwtmf/dLmHwsBHapmSVJwCu2UkVzqGwjw8ciuFsRnOQTgF6fEnwEDYgAHI7AXv+4kumqo2PQrHubSqdBhY1CvtPmHuz241ZIenZJTrm37NcwYnHRiz+qw3nUcSnLNCe5vuErpnFC+FPCUXQ7RE9GYK1LFgdR+5Ahsk0OHm/bdw957FhrU22UXb2E6qGGpiHE+mNVf18b6SEsCgZ4GVag8hVLBBVq9lmoCtqPgeN+zlpQmcex61mw2rRnt7xRMKBMOaxXlGyBHgNEUg061USavmXN41HRjeSjdgyJG2qU54Lu77xmIxQwlFbfGpUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=moJc+Plf2lnc+nhGDyE/NC3UhTpdM5oHUFDrKjzeQGM=;
 b=1jCdM3uAjEh5GgVY/APjRV70GKVBepUgU9bTxofJTlKqykkAO8zNVu1klmjEX4XRFCK1qUU3GIFQsxvOpANqeCSU+XCGMA1QPcSrHqNBIBlvONYLB+RAex25YGYcCkti9p+kcg4PPyL+MGBhlEWTmgYnnaOUf/wx5hSvj+TxSzI=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Marc Bonnici
	<Marc.Bonnici@arm.com>, Achin Gupta <Achin.Gupta@arm.com>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>
Subject: Re: [PATCH] xen/arm: ffa: fix guest map RX/TX error code
Thread-Topic: [PATCH] xen/arm: ffa: fix guest map RX/TX error code
Thread-Index: AQHZ30BfHINFg5m3OEWmBuJ6JsrWObAKxyWA
Date: Mon, 4 Sep 2023 15:17:00 +0000
Message-ID: <1570C23B-D0D5-4794-9B77-13D3BB81D6C3@arm.com>
References: <20230904145814.2534808-1-jens.wiklander@linaro.org>
In-Reply-To: <20230904145814.2534808-1-jens.wiklander@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|DU0PR08MB7462:EE_|DBAEUR03FT010:EE_|GV1PR08MB8130:EE_
X-MS-Office365-Filtering-Correlation-Id: 85987ea3-ce7a-4a49-09ab-08dbad5a01a6
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 hkty+aK/YARSnVNYjdYUFWlDl9jWu4m0OVUp5bzhqw5Uu3DiFCjyK/whQYMgBCVHxohNh8PDyS+l1qtuGaZFokjrPFM0Onpqg4hu1NhmAzGbRSRZigrwiKvhlYCIn/N6wEViCe295LdJmO/8Lvrz5HqMhVeYoAQBWxXSvqrveyN2I27coTsx8Sbd8j1D1xv0sJ6+C/nteb7jbFK+Z7Oie9JCoCBsXmTwV9sN4ApBRM/DSw/GWMnG0x5fd6A7ICuM2rZB7GguFWLeVsYWHelgqCxxdMdZByfy7H3kwzkoEEG5Ish9BjxLxZvnTuxk921ZvMhDFjO24psCKe6VK7FR3FhIUeEZyMqSAZsgvHmR04FgCWBuUTfgl2jGUvCEmGUwA5DVWzaxtdkK/Mj5g55HNiMOvSVLnytnTwvQ4PVT67RPlHBGeLFAV8BZqfZ80JTRY/r2mIuMlzzGJd7j48jhwUJ8diZQUyuUavtR9j+6yPPXDAvU7gf57fLO1YOxMVjJ0aUmgTE+YFaSbfwbq4gDkTzw8+i5CLfXTE7oP0ndw85038MjxLNhZuDnumlQFOgUEYArOJWjve+1/RX7GYJMANuflgWPEevuSqB9uslgiG/OxE1UqpPyez2MJgAc/UjZK7huukUXkHRkwiL+WxLHbg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(376002)(136003)(346002)(366004)(451199024)(1800799009)(186009)(6916009)(64756008)(66446008)(66476007)(36756003)(54906003)(76116006)(91956017)(66946007)(2906002)(316002)(86362001)(33656002)(66556008)(5660300002)(8936002)(8676002)(4326008)(41300700001)(6512007)(2616005)(83380400001)(26005)(38100700002)(38070700005)(478600001)(122000001)(6486002)(71200400001)(6506007)(53546011)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <F2B8A464CCC6C64C98A365DE6BADC2F2@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7462
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8d9d0ece-20c4-4d2e-137a-08dbad59fca0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UlVrEELSMKI1DnpdJXvZ1cXLqpljd47nh9y+2R/klwqF4YyBRtrU9y459AOO1Y9dRhH0nAgmAM/kXGKn/ZLdpOVNk6XA5Zp8Ua1TBtTEgQMtMxkSU4dHclfNPqGFtoHaQbomvtndYqoYL9ZOedqvrrG78NKNIWPGibDZ5YPfjXWEl7ubH+zFSRFwqLoiMxATrxzpFkRm9XH1sg/WO9KG/c6z/cfrxAbbZoIJJRV+NDluj5v7l5/Nhi/HT/mmFSN6jsSBoyJHgyHvYX8i6SCzExjCZ+6lp0y6DqaFNqdOMf0POLFHikfskX3JXTEZP5CC8TuvYQ+GsiPYIunjDeOYEenE+bS7Vmh9BQNt3CYhRU0NAzOw0YyTEJCax4RtN8+lC2LvTOxJ0H3Q2rCbDRqTDIQGOZZa3yWvpRfJu7V9aWX8HzCpHKv6ZNOQX/TWYEv/SPPtvS+PMWM3sqd7h6urkD2sp1XS9S3wPXNb7RKClTPnbFDBZfVmJFY+yifdZ4PRIskH6dDNholV3ImK3WJZL1RJE2+86j+Y6jGnATRpNM9Hgt9STugTzWIyXhRDKQ6vJc33HXsLhgvSF7krmEiWNbIT/cPLBq+Hw8vEkqIjK9xrQM6nIksOWj9r0XeIrimgr+kOgc5UT6PD+mMli6a9vd0oiSGrQKvzJnAQTvQRUkSyM5s34Dgu183z5ibZnLDsLKeGhbx/OaA1nkdsnSDP2gV8VTQWDNtRR47EAneP0IG9aAERh0c21EtE33J3cpD8
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(396003)(376002)(136003)(346002)(451199024)(1800799009)(186009)(82310400011)(36840700001)(40470700004)(46966006)(36756003)(54906003)(2906002)(316002)(86362001)(70586007)(70206006)(33656002)(40480700001)(5660300002)(8936002)(8676002)(6862004)(4326008)(41300700001)(40460700003)(47076005)(6512007)(336012)(2616005)(83380400001)(26005)(36860700001)(478600001)(81166007)(356005)(82740400003)(6486002)(6506007)(53546011);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2023 15:17:08.9377
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 85987ea3-ce7a-4a49-09ab-08dbad5a01a6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8130

Hi Jens,

> On 4 Sep 2023, at 16:58, Jens Wiklander <jens.wiklander@linaro.org> wrote=
:
>=20
> FFA_RXTX_MAP is currently limited to mapping only one 4k page for each
> RX and TX buffer. If a guest tries to map more than one page, an error
> is returned. Until this patch, we have been using FFA_RET_NOT_SUPPORTED.
> However, that error code is reserved in the FF-A specification to report
> that the function is not implemented. Of all the other defined error
> codes, the least bad is FFA_RET_INVALID_PARAMETERS, so use that instead.

Agree and thanks for the fix.

>=20
> Fixes: 38d81e7ccb11 ("xen/arm: ffa: support mapping guest RX/TX buffers")
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> xen/arch/arm/tee/ffa.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> index 802b2dbb1d36..183528d13388 100644
> --- a/xen/arch/arm/tee/ffa.c
> +++ b/xen/arch/arm/tee/ffa.c
> @@ -706,7 +706,7 @@ static uint32_t handle_rxtx_map(uint32_t fid, registe=
r_t tx_addr,
>     {
>         printk(XENLOG_ERR "ffa: RXTX_MAP: error: %u pages requested (limi=
t %u)\n",
>                page_count, FFA_MAX_RXTX_PAGE_COUNT);
> -        return FFA_RET_NOT_SUPPORTED;
> +        return FFA_RET_INVALID_PARAMETERS;
>     }
>=20
>     /* Already mapped */
> --=20
> 2.34.1
>=20


