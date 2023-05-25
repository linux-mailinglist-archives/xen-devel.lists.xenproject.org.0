Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88BFF710840
	for <lists+xen-devel@lfdr.de>; Thu, 25 May 2023 11:04:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539437.840302 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q26t5-00070M-Go; Thu, 25 May 2023 09:03:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539437.840302; Thu, 25 May 2023 09:03:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q26t5-0006x1-Dq; Thu, 25 May 2023 09:03:59 +0000
Received: by outflank-mailman (input) for mailman id 539437;
 Thu, 25 May 2023 09:03:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0YGP=BO=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1q26t3-0006wv-IK
 for xen-devel@lists.xenproject.org; Thu, 25 May 2023 09:03:57 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20613.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::613])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1374a759-fadb-11ed-8611-37d641c3527e;
 Thu, 25 May 2023 11:03:55 +0200 (CEST)
Received: from AM6PR05CA0001.eurprd05.prod.outlook.com (2603:10a6:20b:2e::14)
 by DBBPR08MB6170.eurprd08.prod.outlook.com (2603:10a6:10:200::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.16; Thu, 25 May
 2023 09:03:52 +0000
Received: from AM7EUR03FT044.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:2e:cafe::56) by AM6PR05CA0001.outlook.office365.com
 (2603:10a6:20b:2e::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.17 via Frontend
 Transport; Thu, 25 May 2023 09:03:52 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT044.mail.protection.outlook.com (100.127.140.169) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6433.15 via Frontend Transport; Thu, 25 May 2023 09:03:52 +0000
Received: ("Tessian outbound e13c2446394c:v136");
 Thu, 25 May 2023 09:03:52 +0000
Received: from fbbbfd49a036.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6DBA8194-BC65-46F5-BE12-49B510BD0F0B.1; 
 Thu, 25 May 2023 09:03:41 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id fbbbfd49a036.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 25 May 2023 09:03:41 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AS8PR08MB8299.eurprd08.prod.outlook.com (2603:10a6:20b:56f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15; Thu, 25 May
 2023 09:03:40 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::5e17:39a6:eec7:c482]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::5e17:39a6:eec7:c482%4]) with mapi id 15.20.6433.015; Thu, 25 May 2023
 09:03:40 +0000
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
X-Inumbo-ID: 1374a759-fadb-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WRynqVwXjJMpUlCc78Xq0TrpPcne2D1ACfj/WSgty70=;
 b=U80Wqb4hJOQ8KINiwvxmjGNIOeEPb/eBAyC5/tShPT7H0Xtey8Joan/1qov7fKX8se7bns2JKUk42XsH8HWh7KMO9G6zZb2Zx51fmBgy7mJrIvioxVpEV//TKcpL78JayhEXIWVaQ+yyUOwjxIiMVV8yv24emNcpBT5E+69KmD0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7fbd2d0fde1ef26f
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G4mZq7YR3W4BdAuWoYvgQNUF83e4KCuYdldATFgcFhQXxPWsPvn6ZYwcX1aSThku9jp82olSRBymHqYMNHVf81jXT7JQ55d9SKKXXOCckN87LAG8D39AYJnDRcyFH57MeLpIe3DoiqFFQx4ftBXdkAb1AD7KZgDmZJ2eEreC1uitIYAOQ9tYVCG0tKVI8GX9SQV/xoqgPudFxDa6VQ/2Sg0w9YLFeuEL/ihBeQL7LzfAxRsYT4NYoAIr1MmAaKstNifCoyFH1Vz7meuJ0gMwV93pNTeCm6S0hCcjMoV9dcELfQEwe3FN9Nu0xWINnnppLdkgAJ8xYeZ816ktFpnHMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WRynqVwXjJMpUlCc78Xq0TrpPcne2D1ACfj/WSgty70=;
 b=NEOSaofd+du3nSQXoFN1WfzOHxfwUUEVap+u5TkGMwQX7xF2vXaqiSjyX1btxCns9H90naxbAp1Gck5yxPZbSkmskB30rSSPar+Jjz7ZC0Qs4YDFiOeIA4ce06q/2O1FQ75GRGjls1b6LyouaBHBEBKE+KE5Ro7KxYsn96jrExW/O7AQu91dpFoakZH5nIXvnNb1JDhBNy+fZrGArsfDpr8t1DSZzavrrO5sDSX76xP+1fi3ssV4NHGBE4XiX8BZNiFuRW/WMPxgVf/jZexcM0/0r6+SIRCbYId+8HGmPcmQGpIcNOitzHwF6O8ZX3t8U7rOrGYx/Dw/A0zu5GOzLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WRynqVwXjJMpUlCc78Xq0TrpPcne2D1ACfj/WSgty70=;
 b=U80Wqb4hJOQ8KINiwvxmjGNIOeEPb/eBAyC5/tShPT7H0Xtey8Joan/1qov7fKX8se7bns2JKUk42XsH8HWh7KMO9G6zZb2Zx51fmBgy7mJrIvioxVpEV//TKcpL78JayhEXIWVaQ+yyUOwjxIiMVV8yv24emNcpBT5E+69KmD0=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Luca Fancellu <Luca.Fancellu@arm.com>
CC: Michal Orzel <michal.orzel@amd.com>, Xen-devel
	<xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v7 11/12] xen/arm: add sve property for dom0less domUs
Thread-Topic: [PATCH v7 11/12] xen/arm: add sve property for dom0less domUs
Thread-Index: AQHZjUpY6xFVIVbG80+SN4dEj9SmF69pi9WAgAEmH4CAAAC+AIAAAkSA
Date: Thu, 25 May 2023 09:03:40 +0000
Message-ID: <65C07834-FFE3-4158-BFD0-21A7888730A6@arm.com>
References: <20230523074326.3035745-1-luca.fancellu@arm.com>
 <20230523074326.3035745-12-luca.fancellu@arm.com>
 <D01601D3-8215-46A0-8539-CF126A5FE11F@arm.com>
 <3dcbec7c-87d2-31cc-ad0f-d8ff4c8baeae@amd.com>
 <D7FF883F-D8DF-48A0-A32D-15F2D0CF7426@arm.com>
In-Reply-To: <D7FF883F-D8DF-48A0-A32D-15F2D0CF7426@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|AS8PR08MB8299:EE_|AM7EUR03FT044:EE_|DBBPR08MB6170:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b19abb9-73ba-4a1d-e425-08db5cfef636
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 8SKnp/w2aGCy7ZJgUMFZbDEPiIjQwe1E8baqAsiOdYhUmA6tMf6mlke2/ucIVoy495u7qj1Se+nrQ2JDH7BXUl+8clL6j1+HnXYIZRt8U/Rg1ZwOGnY6nktkjGIG3/hpE68DKMbcBO8EkJpxLr7lKKNzguqNn/Y7iXKdXCl29+Sjoa01ibWF9Sxv7K5ruznoPa6MkQPRMdZFNdP6IoygDN6WAq8stp1vhMRTE+KELYRzXASuwMJjcZWzWO4Ra3rqWfsnkEdomR8NP6jRkK20flVJHskcAtJcXMz5tNMPzqTcti1RWfLUo1ETKjYtuHGb/ukFLguhgWWawRSHrPa87b1SiDygZBdofStMBwtsXjkecjUIZtbWIG+FsECH4R/t2OIu1axgW1sNoWK0NxeAj0pTeVmXiEU+zbjqid5XKitsP9HpbdtngduEzblAXC1gKWQO0O/IqYjFLrc2lKVyTQnTbeRqjikHvWMEIsihAnPb66kT8NeNR5GxDtm7VfFLSRJSMkZBnyyDbwIRCPU47LiPpA67DYzo1hngI0IwWpUO54NSvMUkbiY1B3S6aAq9tuJyYD+GOhs7QM6Uwv44YgQIhEGpdtVtBVVjF1HBKZHS8aIhJQer1BCpdbmocFLPbcfalOkWjYzBfHtrWIUHyIQlePDEWm5H7wZELOwuq5E=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(366004)(39860400002)(346002)(396003)(451199021)(8936002)(8676002)(6506007)(6862004)(5660300002)(122000001)(186003)(36756003)(2906002)(33656002)(86362001)(2616005)(83380400001)(6512007)(53546011)(316002)(54906003)(4326008)(71200400001)(478600001)(66476007)(66446008)(66556008)(37006003)(6636002)(76116006)(66946007)(64756008)(38100700002)(6486002)(91956017)(38070700005)(41300700001)(32563001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <011946BC5B080A46B2D37DA5AB19A026@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8299
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	54be1df2-5b4e-4f6e-d949-08db5cfeeec3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ABXpQf55DBYTGAYu5LsLKarAgyKowskkN8JIu3H3U9+/xrmgRogSJ9fGye6k7s93wA6ra+Urvy3td5OcNnmt50SDNkyC4z6i5zwrsG0RrOLZ5DpAJJanQpLxA2Y1YGMluSgQLzUqFML5/x8bEUTznDrfzGlUdxZOXxGVPP67ivRz7C5jZBH7oVeRNEk3ogUR5PzzN1rNWWmeHUxB+G09xaFZGkieMGitg2o2WOaJOQzFCy9RSUoiBeRBSEwnBNQsUe3zKaUcLQY9b1sDbOxgr/628CT+f3W0Fdro3UWK/4PWnZfjND9qe3CztIyjE6JlPiCpF4JFbzzKsquMeA6YcLLezDDKm8mM2pNQngfKQ+YM4KIgYAdq8LUvbMYI/BINhCc5SGnoFguwYnVQ0xXCFccSsMesQhDq6uToluBHnP9kBLRgrVK7MSp+YLLtkBFa8jYLDvp3zJl/ubbtAfIHRZrMNLNuX+gCJE3HXCZN3KvvrbFyPnVid/NXR4LyxR+p2Rws1NV9ICTHJbskHeUls8vYNiRTMNEfXT9fLBoTLGaZILwxDNwp9PvbKe3ur7CnbolaI9G2b+KGm5Nzt7NRN/Ovfsn64qMIXkBepkMrIk7MO9b6EWiDVaZXwvZ7WoUzGyIFsPWoNi0/Kfq3PxjIBnMiSCP7qYY402hUbRMGCez98KcNINDrxdfuA5iBKm6GgIO6FKppgnnz2g7oQ7ZTF5O5ckvNmpmS/68bgovHZ7yQ9yV8w9Z9YzNlg/DQtCOR4XGibqwiiKP41Ea/luTfDA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(396003)(376002)(136003)(451199021)(36840700001)(46966006)(40470700004)(40460700003)(70586007)(70206006)(478600001)(6636002)(4326008)(316002)(54906003)(37006003)(86362001)(33656002)(36756003)(83380400001)(47076005)(6512007)(6506007)(26005)(107886003)(2616005)(336012)(36860700001)(53546011)(186003)(41300700001)(8676002)(6862004)(8936002)(2906002)(6486002)(40480700001)(82310400005)(82740400003)(81166007)(356005)(5660300002)(32563001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 09:03:52.4673
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b19abb9-73ba-4a1d-e425-08db5cfef636
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6170

Hi Luca,

> On 25 May 2023, at 10:55, Luca Fancellu <Luca.Fancellu@arm.com> wrote:
>=20
>=20
>=20
>> On 25 May 2023, at 09:52, Michal Orzel <michal.orzel@amd.com> wrote:
>>=20
>> Hi Luca,
>>=20
>> Sorry for jumping into this but I just wanted to read the dt binding doc=
 and spotted one thing by accident.
>>=20
>> On 24/05/2023 17:20, Bertrand Marquis wrote:
>>>=20
>>>=20
>>> Hi Luca,
>>>=20
>>>> On 23 May 2023, at 09:43, Luca Fancellu <Luca.Fancellu@arm.com> wrote:
>>>>=20
>>>> Add a device tree property in the dom0less domU configuration
>>>> to enable the guest to use SVE.
>>>>=20
>>>> Update documentation.
>>>>=20
>>>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>>>=20
>>> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
>>=20
>> (...)
>>>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>>>> index 9202a96d9c28..ba4fe9e165ee 100644
>>>> --- a/xen/arch/arm/domain_build.c
>>>> +++ b/xen/arch/arm/domain_build.c
>>>> @@ -4008,6 +4008,34 @@ void __init create_domUs(void)
>>>>           d_cfg.max_maptrack_frames =3D val;
>>>>       }
>>>>=20
>>>> +        if ( dt_get_property(node, "sve", &val) )
>>>> +        {
>>>> +#ifdef CONFIG_ARM64_SVE
>>>> +            unsigned int sve_vl_bits;
>>>> +            bool ret =3D false;
>>>> +
>>>> +            if ( !val )
>>>> +            {
>>>> +                /* Property found with no value, means max HW VL supp=
orted */
>>>> +                ret =3D sve_domctl_vl_param(-1, &sve_vl_bits);
>>>> +            }
>>>> +            else
>>>> +            {
>>>> +                if ( dt_property_read_u32(node, "sve", &val) )
>>>> +                    ret =3D sve_domctl_vl_param(val, &sve_vl_bits);
>>>> +                else
>>>> +                    panic("Error reading 'sve' property");
>> Both here and ...
>>=20
>>>> +            }
>>>> +
>>>> +            if ( ret )
>>>> +                d_cfg.arch.sve_vl =3D sve_encode_vl(sve_vl_bits);
>>>> +            else
>>>> +                panic("SVE vector length error\n");
>>>> +#else
>>>> +            panic("'sve' property found, but CONFIG_ARM64_SVE not sel=
ected");
>> here you are missing \n at the end of string. If you take a look at pani=
c() implementation,
>> new line char is not added so in your case it would result in an ugly fo=
rmatted panic message.
>=20
> Hi Michal,
>=20
> Thank you for pointing that out! Indeed there might be some issues, I wil=
l fix in the next push.
>=20
> @Bertrand, can I retain your R-by with this fix?

Yes

Bertrand

>=20
>>=20
>> ~Michal



