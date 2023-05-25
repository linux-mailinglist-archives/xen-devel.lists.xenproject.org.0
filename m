Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4CEE7107FB
	for <lists+xen-devel@lfdr.de>; Thu, 25 May 2023 10:55:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539405.840230 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q26l2-00023h-Uo; Thu, 25 May 2023 08:55:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539405.840230; Thu, 25 May 2023 08:55:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q26l2-00021b-SA; Thu, 25 May 2023 08:55:40 +0000
Received: by outflank-mailman (input) for mailman id 539405;
 Thu, 25 May 2023 08:55:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zmzE=BO=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1q26l1-00021V-El
 for xen-devel@lists.xenproject.org; Thu, 25 May 2023 08:55:39 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2061c.outbound.protection.outlook.com
 [2a01:111:f400:fe13::61c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e98e935c-fad9-11ed-8611-37d641c3527e;
 Thu, 25 May 2023 10:55:35 +0200 (CEST)
Received: from DU2PR04CA0319.eurprd04.prod.outlook.com (2603:10a6:10:2b5::24)
 by AS1PR08MB7452.eurprd08.prod.outlook.com (2603:10a6:20b:4dc::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15; Thu, 25 May
 2023 08:55:32 +0000
Received: from DBAEUR03FT045.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2b5:cafe::3c) by DU2PR04CA0319.outlook.office365.com
 (2603:10a6:10:2b5::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.16 via Frontend
 Transport; Thu, 25 May 2023 08:55:32 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT045.mail.protection.outlook.com (100.127.142.142) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6433.15 via Frontend Transport; Thu, 25 May 2023 08:55:31 +0000
Received: ("Tessian outbound e13c2446394c:v136");
 Thu, 25 May 2023 08:55:31 +0000
Received: from 912fde970d27.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 82475F19-895C-4A67-891A-BC9886F922FC.1; 
 Thu, 25 May 2023 08:55:25 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 912fde970d27.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 25 May 2023 08:55:25 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by DU0PR08MB9108.eurprd08.prod.outlook.com (2603:10a6:10:47a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.29; Thu, 25 May
 2023 08:55:22 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::362c:56c7:5ea4:422e]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::362c:56c7:5ea4:422e%7]) with mapi id 15.20.6433.015; Thu, 25 May 2023
 08:55:22 +0000
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
X-Inumbo-ID: e98e935c-fad9-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cWcc9kxYhxm2dPFps10rBh+mKb5CXHjxBQEa56fevtc=;
 b=u0+Cr3ApwoY8vGL1yLUQoNRIaKKiF3Q4EGbXS95I3t3fKSNlFX3w/SEVsrJ9GP4xfGRmoZJmWZ1cKLtTbTxXJJ6Qcml/VMaA2Qto7q3irMCwv19PAnharKLhCTO9FTAPGWyGleBvPnwptYCVXHp6I05VeFebXFbQf4uHpsEQREs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2267f36ba8566114
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gXPSMvSUW3sVSGxprKleMrp5YDHd/vNQPHYK9aN04Xz1nqZz/SgqnBCYQsydPcg6ysL7SawnHifArc4LVfH7jglTBmKq2d1q+pmWVqyQwQcKLcWmJAutlJ02MU/OQRNyh+0OxgLfGHJmnH9wRLTjK/eHvNcPwLwiEm6wR4GiNyFHtwUypuA7Iku15c2OIdwvBt21J12DkevxaXkEOPp+lbOYRcPVRw76plRE33cbTv8zvCfBOfkIoTyGScSWgTSeruoDKGyMv9Jw9m9JhjYruYvyi0UPcKeI7O25eURA+L/WUrD9kJi+cRoflBVS4yD/Actv9St4LVUFUj8rdOfDuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cWcc9kxYhxm2dPFps10rBh+mKb5CXHjxBQEa56fevtc=;
 b=Dty+p2yBotySzgNsvtrOmdFl46voYyCarfO0X3Sd0+qrMV2mfw1o+x7z2fhWEzYp31qGBsrf+wr5eM5SK9DPtcdGHvBygFUVCViCwFxFNGeZHwjZHnWjolMyCC/YhETwgu02ULQcum78JgDkjRI9Zct7r+slqKySpPua0ZG45+aN6tPnVtGv4qRLvsNiL9MRQfERtuJWOHgY0bNtwdkWCnahoYDTrXHEmPWsSG06fv0g9u0R8F3laUdlS/pOii5UgcYTVFGc1JkmQhey2LVzqeb0zC7ccdt6uS3XNlgOdKILcuNUHga9DnrAcRD5p80lHcny/VUa/lf1tbScOBtgRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cWcc9kxYhxm2dPFps10rBh+mKb5CXHjxBQEa56fevtc=;
 b=u0+Cr3ApwoY8vGL1yLUQoNRIaKKiF3Q4EGbXS95I3t3fKSNlFX3w/SEVsrJ9GP4xfGRmoZJmWZ1cKLtTbTxXJJ6Qcml/VMaA2Qto7q3irMCwv19PAnharKLhCTO9FTAPGWyGleBvPnwptYCVXHp6I05VeFebXFbQf4uHpsEQREs=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Xen-devel
	<xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v7 11/12] xen/arm: add sve property for dom0less domUs
Thread-Topic: [PATCH v7 11/12] xen/arm: add sve property for dom0less domUs
Thread-Index: AQHZjUpoyjbTsitUikWCGPYyG/Olya9qshGMgAAAlQA=
Date: Thu, 25 May 2023 08:55:22 +0000
Message-ID: <D7FF883F-D8DF-48A0-A32D-15F2D0CF7426@arm.com>
References: <20230523074326.3035745-1-luca.fancellu@arm.com>
 <20230523074326.3035745-12-luca.fancellu@arm.com>
 <D01601D3-8215-46A0-8539-CF126A5FE11F@arm.com>
 <3dcbec7c-87d2-31cc-ad0f-d8ff4c8baeae@amd.com>
In-Reply-To: <3dcbec7c-87d2-31cc-ad0f-d8ff4c8baeae@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|DU0PR08MB9108:EE_|DBAEUR03FT045:EE_|AS1PR08MB7452:EE_
X-MS-Office365-Filtering-Correlation-Id: d5ba1fc7-d750-4259-bd54-08db5cfdcbdb
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 WdfUlRTXAW4VktWFgZjhTBN5Ct2eMvwhVsZchgK6ab56cfPQIvQc8h5cRDnlIj1nrBgLOI/9TM5sCfbecLNI9n/hq67jmfF+yzK73YHqBXPbRdaJw1stvsVILvM2bAb+jiWQHTdZbOWzV1EGu9SiVRs4nuOUkFeDkedQKo93Jmc/4X2EeG+okUU9fxZ1KaH2tbLUka3bSls6fjLT9Ad+tOMVSZX06+1CEGdI8rtlVC2FIrXWf0O3iVkW4IjHAffeJHx+RUrzOlgV0o012kLNil7EfODV9cp3jWsVXGi5mkiIzZLFmVai6Si3i42dkLCN/XhrXxR4B6kzkPlpBOrPB5nCzkAgGMVa+V/y7W8vVJe+1eNE9000LG2BVgukrSY6LSOfPoU1eGJ/Mvi0uiUj7xuNWsDUCBFDh5X29miPaTDFvjjYV8CCCUQqnyEJQ/m0/wWNOAbUGC46hcyaIfTk7ZcQw2g4btFKL2UTlBD78Bx9NUNPxVXHGCS+DGjOtunhPpyqX/ml7BbiNRGf39oLB3VghCeabcjO9M2N9we2k4vLiQnke/9LeVHUe4XgTkq4GDS48ijYlbk1Jn+m6nEdzo1tIINhJIuWFCNu/duMI7wvqCJm6DsjpWlB62IOskg5zluWQ/jJcjdb8NU0QZjvfMaAHIEDe0VOK7Y7bz57HsY=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(136003)(39860400002)(376002)(366004)(451199021)(478600001)(53546011)(6512007)(6506007)(186003)(54906003)(2616005)(26005)(71200400001)(6486002)(122000001)(38100700002)(76116006)(66446008)(91956017)(6916009)(64756008)(4326008)(33656002)(83380400001)(36756003)(66556008)(316002)(8676002)(66946007)(2906002)(66476007)(41300700001)(8936002)(86362001)(38070700005)(5660300002)(32563001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <C231D55EC84D384AB8E3F81214DE44C0@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9108
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	1389ef13-dfee-4fad-6c3f-08db5cfdc671
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pLP+ZOKe9Y8tgscwJDCxU7w/GJvkDo/3J+pw6sEmGoKaNl1PXGi92fcZGfjCcbU3iAwXc/9BzA+t+/yF63ODiEbQ8SIkaVhmtQFSg0RySb+Pc82xkxWEkjZUvRJk9sz63vkEIB1lLu/B2UUDAWjbEEq/U+4qoXXWZmiPSYMa/wTnz/+W5pPOq6Qud8ABcKGdCSS7jmhRYmj6gXQNuWYC+DPb9T0+Bbhq5UebXvLm2AQlylDTFdvNNi4qWYr781MmDCWFlOCTo7QKaC7x7nX6COB2o1NJbZJko0lMzmE9C2n8d33qObEGvFlU2awP7f2fvyqtPl+95GOWjlN5bxk0EcTuOTkkYPAUa0wqnCsi7ou5GFxp4u7mXIOLsquO7xYEad3wInsBPkLRS6LJ0mx1n0nS3lH3kPGGWjun5OcYqr3bCuDZcm0JM+ZRnYsPV+leHWoFBv5IwMvdbTQI+i9+83YraSajScjn3+6raw/zYBnLLeCdCUgXS2czecF9wHUlSx65nWGXRC2vv7HYT7k7qtV0NWJI6EP0K3Cmxu2wnBekVL+wQWxjrkeBSYOwC6j/YbjFxIAjulTiR3hRKm6luzJvm9VcHMoWgbHS6iBr/kqRQBuiTGeTCYl111ZTZeEp5acU4pPnd1KeU8SY6gjaoYXUBl5kDw3S2N1ojklzE3Pxe+C/Op0thPyIYu6kiGBWWFxqop6wYW3t8Pdh0loNHl51cFWYJAoQKsPydCbPp+IGjHsy7AuUUS6P5hdTUEPpyI9xYmvr8tMtqIN2WqBA2g==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(346002)(396003)(376002)(451199021)(46966006)(40470700004)(36840700001)(8676002)(82310400005)(5660300002)(2906002)(8936002)(316002)(4326008)(70206006)(70586007)(54906003)(478600001)(47076005)(33656002)(2616005)(83380400001)(40460700003)(53546011)(186003)(107886003)(36756003)(26005)(6506007)(6512007)(41300700001)(6862004)(86362001)(40480700001)(336012)(36860700001)(81166007)(6486002)(82740400003)(356005)(32563001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 08:55:31.9557
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d5ba1fc7-d750-4259-bd54-08db5cfdcbdb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR08MB7452



> On 25 May 2023, at 09:52, Michal Orzel <michal.orzel@amd.com> wrote:
>=20
> Hi Luca,
>=20
> Sorry for jumping into this but I just wanted to read the dt binding doc =
and spotted one thing by accident.
>=20
> On 24/05/2023 17:20, Bertrand Marquis wrote:
>>=20
>>=20
>> Hi Luca,
>>=20
>>> On 23 May 2023, at 09:43, Luca Fancellu <Luca.Fancellu@arm.com> wrote:
>>>=20
>>> Add a device tree property in the dom0less domU configuration
>>> to enable the guest to use SVE.
>>>=20
>>> Update documentation.
>>>=20
>>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>>=20
>> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
>=20
> (...)
>>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>>> index 9202a96d9c28..ba4fe9e165ee 100644
>>> --- a/xen/arch/arm/domain_build.c
>>> +++ b/xen/arch/arm/domain_build.c
>>> @@ -4008,6 +4008,34 @@ void __init create_domUs(void)
>>>            d_cfg.max_maptrack_frames =3D val;
>>>        }
>>>=20
>>> +        if ( dt_get_property(node, "sve", &val) )
>>> +        {
>>> +#ifdef CONFIG_ARM64_SVE
>>> +            unsigned int sve_vl_bits;
>>> +            bool ret =3D false;
>>> +
>>> +            if ( !val )
>>> +            {
>>> +                /* Property found with no value, means max HW VL suppo=
rted */
>>> +                ret =3D sve_domctl_vl_param(-1, &sve_vl_bits);
>>> +            }
>>> +            else
>>> +            {
>>> +                if ( dt_property_read_u32(node, "sve", &val) )
>>> +                    ret =3D sve_domctl_vl_param(val, &sve_vl_bits);
>>> +                else
>>> +                    panic("Error reading 'sve' property");
> Both here and ...
>=20
>>> +            }
>>> +
>>> +            if ( ret )
>>> +                d_cfg.arch.sve_vl =3D sve_encode_vl(sve_vl_bits);
>>> +            else
>>> +                panic("SVE vector length error\n");
>>> +#else
>>> +            panic("'sve' property found, but CONFIG_ARM64_SVE not sele=
cted");
> here you are missing \n at the end of string. If you take a look at panic=
() implementation,
> new line char is not added so in your case it would result in an ugly for=
matted panic message.

Hi Michal,

Thank you for pointing that out! Indeed there might be some issues, I will =
fix in the next push.

@Bertrand, can I retain your R-by with this fix?

>=20
> ~Michal


