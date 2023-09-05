Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F64791FF4
	for <lists+xen-devel@lfdr.de>; Tue,  5 Sep 2023 03:27:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.595346.928880 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdKpE-000648-Bm; Tue, 05 Sep 2023 01:25:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 595346.928880; Tue, 05 Sep 2023 01:25:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdKpE-00061O-8k; Tue, 05 Sep 2023 01:25:52 +0000
Received: by outflank-mailman (input) for mailman id 595346;
 Tue, 05 Sep 2023 01:25:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qilU=EV=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qdKpD-00061H-JT
 for xen-devel@lists.xenproject.org; Tue, 05 Sep 2023 01:25:51 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20613.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::613])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 12ffa025-4b8b-11ee-8783-cb3800f73035;
 Tue, 05 Sep 2023 03:25:19 +0200 (CEST)
Received: from DB3PR08CA0036.eurprd08.prod.outlook.com (2603:10a6:8::49) by
 PAVPR08MB8893.eurprd08.prod.outlook.com (2603:10a6:102:321::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.30; Tue, 5 Sep
 2023 01:25:15 +0000
Received: from DBAEUR03FT039.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:8:0:cafe::8a) by DB3PR08CA0036.outlook.office365.com
 (2603:10a6:8::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.32 via Frontend
 Transport; Tue, 5 Sep 2023 01:25:15 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT039.mail.protection.outlook.com (100.127.142.225) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6768.25 via Frontend Transport; Tue, 5 Sep 2023 01:25:15 +0000
Received: ("Tessian outbound 169aaa6bf2b7:v175");
 Tue, 05 Sep 2023 01:25:14 +0000
Received: from a69a6a279955.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8EE84764-2F13-400C-847B-CD96A11DA65C.1; 
 Tue, 05 Sep 2023 01:25:08 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a69a6a279955.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 05 Sep 2023 01:25:08 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by GV1PR08MB7801.eurprd08.prod.outlook.com (2603:10a6:150:58::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.30; Tue, 5 Sep
 2023 01:25:05 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::7083:22dc:6b5f:5965]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::7083:22dc:6b5f:5965%7]) with mapi id 15.20.6745.030; Tue, 5 Sep 2023
 01:25:05 +0000
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
X-Inumbo-ID: 12ffa025-4b8b-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xOw4Oi59PFX4ysVZJuIxorJytYFaH52BkmSQWBeFz7g=;
 b=nL6kRV0v5zCwebdUN4zQz/cVTrLdRd64ChRRqJ1vg+1g8gX4NApKjXn/eKcu0V12mLgvZLUSgmbf1JzVn2bAE6L/huKbOgV+/ZNuq1ifJ0UKJ5kh1L8UEShKjO3m6Npb1ppSKOJOgY3poL4ThLNgFMom2WFl0f+80pWPLdH8puY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: bdadc0a676c3c753
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A4atISDtaPjEMaE5fWJdJYnkXlji1QuTj3a3WEYj75m3xhmy+QoviBJt2hscYmrThU5UapGQ1UW1hoe4hsBliL/zNZpKEV3eH6s7/huh/pYAXCAFT6/ZDsm/PdlzO0OlblPTWqSt1+P9Kl7OrECwvYYf/mcHy0y2pZ5wq6h+lX29rDylc6ieARVg1u1Ec4OdmgktPAcbrQsNWRpVq/KbAQEtW9BxmOnA1pYre6oamR1XNUssYaBp7wcQcV4tEzjVxqFKtjgw8FY0jtj4i8d8826iHnpFKCTTS3bPw8+7PjQtIm5rlfECWcjkBQd3QmLo41sDF3Xi0GHoziY7kFwzRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xOw4Oi59PFX4ysVZJuIxorJytYFaH52BkmSQWBeFz7g=;
 b=DxA6D/INqXC5c6fyjbm/K/qOo0hfgn+NqYTd+UcAZ+mEbXiZL5TrovdoUcIDKYBtPbchPnzU6rHVqtOe0dyOn2QBX2+UCFj/WnNqSPPJ5upeAGPNzw8qve4Y070IaJb0glfsysBq3O2qrK+ZDi5J6LB9+SUyoPJISC7sw5WAyAHce4an/s1X29GZPkQNWcSLK07rD6HJjms2Y9asH7gxcK1AG9y6mUYyG8HMn3r2C6HozaQgs+Pr3OHibXIO5IBtkibd/q4FFptqkEQj2YS2pcpZ6v+rjT2vmmt07D4uWhi1ekc0IKI9jxTpe18os162rd7OkXoEwky8TXNeqcQfow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xOw4Oi59PFX4ysVZJuIxorJytYFaH52BkmSQWBeFz7g=;
 b=nL6kRV0v5zCwebdUN4zQz/cVTrLdRd64ChRRqJ1vg+1g8gX4NApKjXn/eKcu0V12mLgvZLUSgmbf1JzVn2bAE6L/huKbOgV+/ZNuq1ifJ0UKJ5kh1L8UEShKjO3m6Npb1ppSKOJOgY3poL4ThLNgFMom2WFl0f+80pWPLdH8puY=
From: Henry Wang <Henry.Wang@arm.com>
To: Jan Beulich <jbeulich@suse.com>, Michal Orzel <michal.orzel@amd.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Xen-devel
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 2/2] xen: Change parameter of generic_fls() to unsigned
 int
Thread-Topic: [PATCH 2/2] xen: Change parameter of generic_fls() to unsigned
 int
Thread-Index: AQHZ3xBF/3psu2nmz0CVECL22ChB0bAKqSEAgAAKBICAABNjAIAAquSA
Date: Tue, 5 Sep 2023 01:25:05 +0000
Message-ID: <7275DC3D-DEF1-4925-AE6E-5AC2BD6D5070@arm.com>
References: <20230904091406.942-1-michal.orzel@amd.com>
 <20230904091406.942-3-michal.orzel@amd.com>
 <ec00892f-d9e8-1095-fb27-c344caa6aa28@suse.com>
 <3538634f-61df-efc1-e45c-ba4c01b5014b@amd.com>
 <c4c3f708-b3f0-3028-ca3a-6661d0f78d56@suse.com>
In-Reply-To: <c4c3f708-b3f0-3028-ca3a-6661d0f78d56@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|GV1PR08MB7801:EE_|DBAEUR03FT039:EE_|PAVPR08MB8893:EE_
X-MS-Office365-Filtering-Correlation-Id: 94b48a21-c4ac-4890-8269-08dbadaef51c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 WP/TLXt+kRXOtaKmzH8ErAfe6aiHU6xWyI12kRRDlVnEM4vylcnfXs5tHKSc0vO3CEtr5HCVtsObFhlSM1WXz8ftCpelRrCTweC99kIBIIpPmMNleKuDn0RYlgSV/+dTCwL38yWyAAksjKcMZ3/jaWoI01r6EVc/ExzyqDlujhFgrZ0Giv6EkgYd7mwDJEeDy7xeHiu9MiwvTyPp36EPAkXrdar/yo/lDTLuY62mpBPEVfOO5yHhxkCJjDwBl9A7Qj2IC870suZfdse5j13p7wrHRYfwkHa7OCtLyapnXy+gMEmO1e3smEn+PWPib5O0aEbDMucQ7wJOKSMIFASXSgKscG6v6rVtZW4QlY0D9zT+GHmoPPP2f++R2c1/fBnAWrpjhLblh0VWVc78NjV/f7l6S/VZG+JHCZ/uhP7tAxALLHPtw2kF4u/6+YSxRAqAu2s5Mvf/pnZWq4J2DzwStea1Rjf7KRxhJER+0E8rBk+MhJaJXXCJNI6WyvFWK7gEl38PjaXXOPdoZlKQgkYlGzurzpm6PcilJ7/7GUxS7AgVwe2UKy0g4RaXkQysHVEEw8Aq5En0GKPZ49s23JzLclNAvmEm9bcMmA2JZ/ikwHLLXF+tCjMHMRxHFTVun4OWmnK8ll8M1pk1UAucd1yyRXAYB16LGM5YduUjvhEQq44=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(346002)(366004)(376002)(136003)(186009)(451199024)(1800799009)(54906003)(66476007)(66556008)(66946007)(66446008)(86362001)(316002)(110136005)(2906002)(64756008)(36756003)(33656002)(76116006)(91956017)(8936002)(5660300002)(8676002)(4326008)(41300700001)(6512007)(2616005)(83380400001)(38100700002)(38070700005)(26005)(478600001)(122000001)(6486002)(71200400001)(6506007)(53546011)(41533002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <C03574EC82B3C8448B6C72E5F7DF3CCF@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7801
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3247fb4e-7e57-4c60-3dcb-08dbadaeef65
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Wq8sJv271vqEQCbGxz5GioE0M6VR4CdgTvYAbULpeEbgM17b5T0MknIDwM9GH1ytwWr4aSMB5RRyZCcrmnFa2yCF70hf231un9KgzjW3xGBcOW1dcgNi0jLHJzEgZWcZV65parFpnx4OMQzBYBryLjzm+qi1yRGtt3FhsDOR6jABgrgwY8BSRBpKd5PVjx8ODzbJaVLdj2ENacF3VPaL5dkNrCrMzfA79JvmFf0tfrVq3EHXnZOCbv8uDzA5zinhFiyuFImFQAurpK3gILXjDYly/y5ZmC+v+xeKt8nX0UIKA9P6+dinZd9Uo8Ryozlf6WsXZVxoifMIV0rMkEYB+Rji0NJrTSIfJBuX9vCIWNafS3dnwaLVES/umTpqsXEH2SeKURj9w3jVvernR1yKilG+3SgypLzoJ+xUGPgIE3sKjqucz/i2QLcDsW/3yFXlaJ8S2KndAtd2gNwbFKYyXJ28diSTfxeQ8lBYXohtqXkxIS9tppl5lgNdr2sOsdTAC2NqxW6T3RFqLsWSFN0TqUOz6SP77kBtVgoHTybum8qaggaKycKd8pcyRDhVLDxp6+bVIOGFOPpOgmTtoLF0tVrvD5N4vyNt/w1KhGXyH+R52tKDqr8XjsO01m8+aOcxYzuu2EhndMB8ByLON2if52HeBkS3wzNCeEFonievA5ZDLLAyxvOkhZHqOhwDDsAsB3cijQVz+oTKnipTDaczv7/8Rzxo+nAubZEGhOi3Lb5oMOhthJC+TDLQpIyy2993i9cOhljsn08fGYRcQ52d4Q==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(39860400002)(376002)(136003)(346002)(1800799009)(451199024)(186009)(82310400011)(46966006)(36840700001)(40470700004)(70206006)(316002)(36756003)(110136005)(54906003)(86362001)(33656002)(70586007)(2906002)(40480700001)(8936002)(5660300002)(8676002)(4326008)(40460700003)(41300700001)(36860700001)(6512007)(336012)(2616005)(83380400001)(47076005)(26005)(478600001)(81166007)(356005)(82740400003)(6486002)(6506007)(53546011)(41533002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2023 01:25:15.1101
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 94b48a21-c4ac-4890-8269-08dbadaef51c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB8893

Hi Jan and Michal,

> On Sep 4, 2023, at 23:13, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 04.09.2023 16:03, Michal Orzel wrote:
>> On 04/09/2023 15:28, Jan Beulich wrote:
>>> On 04.09.2023 11:14, Michal Orzel wrote:
>>>> --- a/xen/include/xen/bitops.h
>>>> +++ b/xen/include/xen/bitops.h
>>>> @@ -51,7 +51,7 @@ static inline int generic_ffs(int x)
>>>>  * fls: find last bit set.
>>>>  */
>>>>=20
>>>> -static __inline__ int generic_fls(int x)
>>>> +static __inline__ int generic_fls(unsigned int x)
>>>> {
>>>>     int r =3D 32;
>>>>=20
>>>=20
>>> Even if perhaps not affected by UBSAN, generic_ffs() then wants taking =
care
>>> of as well, imo. If additionally you switch __inline__ to inline, thing=
s
>>> will become nicely symmetric with generic_f{f,l}sl().
>> If others agree, I can switch generic_ffs() to take unsigned as well (to=
gether with s/__inline__/inline/).
>> However, such change would no longer fall in fixes category (i.e. nothin=
g wrong with ffs() taking int):
>> - is it ok at this stage of release? (not sure but no problem for me to =
do this)
>=20
> I'd say yes, but the release manager would have the ultimate say.

From the release aspect, I am fine with doing the above-mentioned extra
changes, as we are not in the code freeze stage. From the development
point of view, I think whether doing such extra changes or not is supposed
to be an agreement between the developer and the maintainer.

Also this patch itself looks good to me so:

Reviewed-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry

>=20
>> - is it ok to mix a fix with non-fix change? (I always prefer fixes to b=
e done as standalone changes)
>=20
> Imo it is, to avoid introducing an inconsistency. While such may
> not themselves be bugs, they increase the risk of introducing some.
>=20
> Jan
>=20


