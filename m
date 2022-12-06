Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E886440DF
	for <lists+xen-devel@lfdr.de>; Tue,  6 Dec 2022 10:57:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.454575.712087 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2Uh7-0005ic-KA; Tue, 06 Dec 2022 09:56:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 454575.712087; Tue, 06 Dec 2022 09:56:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2Uh7-0005g1-Gh; Tue, 06 Dec 2022 09:56:57 +0000
Received: by outflank-mailman (input) for mailman id 454575;
 Tue, 06 Dec 2022 09:56:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZfYr=4E=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1p2Uh6-0005eR-2U
 for xen-devel@lists.xenproject.org; Tue, 06 Dec 2022 09:56:56 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20624.outbound.protection.outlook.com
 [2a01:111:f400:7d00::624])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 069b7cf4-754c-11ed-8fd2-01056ac49cbb;
 Tue, 06 Dec 2022 10:54:51 +0100 (CET)
Received: from FR0P281CA0087.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1e::12)
 by GV1PR08MB8744.eurprd08.prod.outlook.com (2603:10a6:150:3d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.11; Tue, 6 Dec
 2022 09:56:47 +0000
Received: from VI1EUR03FT017.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:1e:cafe::6a) by FR0P281CA0087.outlook.office365.com
 (2603:10a6:d10:1e::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5901.10 via Frontend
 Transport; Tue, 6 Dec 2022 09:56:46 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT017.mail.protection.outlook.com (100.127.145.12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5880.14 via Frontend Transport; Tue, 6 Dec 2022 09:56:46 +0000
Received: ("Tessian outbound f394866f3f2b:v130");
 Tue, 06 Dec 2022 09:56:45 +0000
Received: from d5b75a4754e6.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1C8B7797-BFD3-4166-819D-B83D2AB0F1E4.1; 
 Tue, 06 Dec 2022 09:56:39 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d5b75a4754e6.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 06 Dec 2022 09:56:39 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com (2603:10a6:20b:404::24)
 by AM7PR08MB5462.eurprd08.prod.outlook.com (2603:10a6:20b:10b::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Tue, 6 Dec
 2022 09:56:37 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::b45:fa8a:caad:25c0]) by AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::b45:fa8a:caad:25c0%4]) with mapi id 15.20.5880.014; Tue, 6 Dec 2022
 09:56:36 +0000
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
X-Inumbo-ID: 069b7cf4-754c-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X76SZbhbNN2Lux8ISxBg/1QoARoFPsLobLK9q31qVPQ=;
 b=APGSTwZQRAIow6LSMqI2W0HXIoN+gJxLwSeQLvD7YgQwP/efbFrBVT7184F4BEtYoIVm6NP7dfKatARPgG23Hm6x8TR5TZi5OOGfk4ESBWRlSBTpRXk9i3P2nameJsqromnceMNsCPYUOt7Savt10oZYSHZ6JfC6R+A3wplTJKg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 19fbab1ca3911510
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lrVCRCT/yhaS6cDnZOyfjOOTQaZ6OMJaBJc6FiUcmYUkuKi38KIi9bq+1/KT3nfrIfG4e9nIEbAxiDuuHyA/zE+lPYt0H5LuF+8ESAIioSV502NePVklbV8MtFP8WMVXeDI8bXel8vY96drwN5QwPiUsl8VSwwkKIlgGXU+fOAXSNx9Bfi0yaUkBBpEBYCxWTSo4LbqI2sB0oERpFbCxj7KBpkok2GFCaz6gEYjziv/l6LMULBEEaJ8TCmwtJFn4+oj217ue31IeV0kOcZk+oX2y1J/WUeLYlkKGFHTGjk+t+i3TANTQEWN9dd9GRlTpMl6V2Yqh2Q36pg+KKf2ssw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X76SZbhbNN2Lux8ISxBg/1QoARoFPsLobLK9q31qVPQ=;
 b=EsWIUkEjl/7pfdaYD4/McPFPuPkVrhdDbsKyiKk406dZqNtG0JqqV6e1lyoO+PA7Zuuya6gm0Yq3lTeqtw0/fobqIWMam8UF+ZmqnmtLSpV6V01fvmIvzEmKVqijm3lOAm2ckfVl9uXnx7vk4VeVxjVUskWhESMX/noRjn5JGVv8Hl1P8LLnqXyQTQ26Qy+6lhGOft8WqQq/nAnnCm/1LvVm6zA/fYZX++eDbnREBpNSiJEM+XCWSYW4wYyN+TCOGTMcTe4TUvUC+urJDQ6xAggWFiP9Nd7wR+0ukPl67n0mBy3JN6BkngdsXpFDlz6O++AWC/00sOonVahzlltnLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X76SZbhbNN2Lux8ISxBg/1QoARoFPsLobLK9q31qVPQ=;
 b=APGSTwZQRAIow6LSMqI2W0HXIoN+gJxLwSeQLvD7YgQwP/efbFrBVT7184F4BEtYoIVm6NP7dfKatARPgG23Hm6x8TR5TZi5OOGfk4ESBWRlSBTpRXk9i3P2nameJsqromnceMNsCPYUOt7Savt10oZYSHZ6JfC6R+A3wplTJKg=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Julien Grall <julien@xen.org>
CC: Michal Orzel <michal.orzel@amd.com>, Xen developer discussion
	<xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Jan Beulich
	<jbeulich@suse.com>, Paul Durrant <paul@xen.org>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [RFC PATCH 04/21] xen/arm: vIOMMU: add generic vIOMMU framework
Thread-Topic: [RFC PATCH 04/21] xen/arm: vIOMMU: add generic vIOMMU framework
Thread-Index: AQHZBZ7dBYCbekoSiE+Vqn2CZKLLUK5e+1eAgABbRACAAAkRgIAAD0UAgAE30wA=
Date: Tue, 6 Dec 2022 09:56:36 +0000
Message-ID: <742E1F89-45AC-4EC2-B363-6AA503E5CAFF@arm.com>
References: <cover.1669888522.git.rahul.singh@arm.com>
 <505b4566579b65afa0696c3a8772416a4c7cf59f.1669888522.git.rahul.singh@arm.com>
 <345d7d3c-e090-356b-1b4e-a9b491a146b5@amd.com>
 <4D9FBC4E-CF83-4D45-B657-A58041EAFCAB@arm.com>
 <2739e776-6bd6-6f35-d46e-9e1223b3d6ef@amd.com>
 <2a062390-ea9a-7458-2411-0d89b5309523@xen.org>
In-Reply-To: <2a062390-ea9a-7458-2411-0d89b5309523@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7158:EE_|AM7PR08MB5462:EE_|VI1EUR03FT017:EE_|GV1PR08MB8744:EE_
X-MS-Office365-Filtering-Correlation-Id: 1edd79c4-2617-42b2-6082-08dad7702fb2
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 ZnszM19CcSjnxyo8oXQ4/3wrrnZI+sVyID3z6MXFiiXZeQniFqUp5Ww68nzTk8PuVrDOycvQsBh0gyw8C+LA9andIP8njXvkTYzdh8YLJxxuyNC/WOLAxONsbYcvvl4UhGbnGHvmwSgZdPdeLQeyUhTjRYeM/XIVExssNzGPjGv5/Ty/I874/inA7r6O9Q92lOhZvyoHGcRwExkL6zFgvM2RkzCvVX2jvWieTS0bNnzFReAym52ben8Qgql3r9RXFIj2XYeiWi+m9v1/cMV0DhERnrIUPh4d0bRcEkYvgO1ZQ8Zgmq/+9OuhaMBY5JGX+4gQZ8WPq8uWYjIkRkMFmKrpnWJoD4/L1HiEpN+Sm3zqoK/rOBEOGcEJMMxGP5bwfEoZWwy9WVapOaxdyMAhmyUWLay41MiyAw5zneciQi59MbLQMul7kQ9DXlgp6LT7H44eGV/F2Y46YvDZInYpfjw27tZ15jNE8mZKvk7GeGc9V1x8WWMEHtGgiF0fvzE1cInWL7Og5y0PkFGQmlnI1OQh0dqGJ1HTF8gqjl3VbHmezVPnpGyTv45Z0tVa3tiUWYCsufv9Mg6/xuJz7Ronxjt3naub1D7bs5mPFVvDRiBeFU33LPZAU1FiALF/l1Acquq9ayXJtrSifvRNwOVyzeYhxoTnBPNb0gyYX4/fk0jMwZnxD7rKA5RFoihCICBmm+S7KYNVUP+yUDTvj3AN4c4u++EdBZ97nUeMFPM+UbJ86I0Xx+649IUnJqcnRwi5
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7158.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(376002)(136003)(396003)(346002)(39860400002)(451199015)(26005)(53546011)(316002)(76116006)(6486002)(6506007)(478600001)(6512007)(6916009)(54906003)(71200400001)(66556008)(66446008)(91956017)(66946007)(4326008)(66476007)(8676002)(64756008)(186003)(5660300002)(2906002)(41300700001)(122000001)(2616005)(36756003)(8936002)(38100700002)(38070700005)(86362001)(33656002)(41533002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <CB29A064F9CE96419E52E2D0352A6263@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5462
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VI1EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f8f0f1cc-05e5-4713-797b-08dad77029e8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9/D+KRn27PQHayGeWYx5twx9aO72Qd9LkRNkA3x5FUhcUmwCPNVNArhxpjg785qLeukvItCN2FAPj145ckoXdBK0KtP1u5t5Rc6RgsjrL4ANv1cNqgFPUvaQUIguZzEKlWbc4HORNHv0Pk/zDYNlF/AmO09EcdfCL7+Qc1G/auZhTNmkCojw3rbY/BPf2Zuy4mp+g3oCvmYQnN0CZiTXkKx5MHOuPmq1JYFAj6xDl4wtlS9lsb9bMmhuaZ5od7m4u5mPMNleI2HGYvmZj2S/jeV1JJwIJFTuPtMSOnA7ZaQBX7mZ8fW7a5ccUWjM3PD2zKJMn971dt+es7iK37ZXXLAJzoH89yAJMLuUvWXPG2qCsKNYsVXo1OJ5fAfLfdyehlb9FM4OE21JJIy7bN588SI9XH18Etcc5fN2jSDVnGaUcziSbmvetZG2ExXe15Af8Ke5oHvqma/NQW9lxVA395z6dDcRcu1iQtXHdSaM1lGkqXO4qwiq3IUw8npcO+bor20zQ/VuSbUE+dlYwbcLnr+jzRHwHsiP/tFcMfBe0bUjIVJN2ypIsDcjUjRHiw2AjaWmWsN4X9ZBpM6VnXF791BLnIkqDs1yx7AV5ntNfOhVT9NNXCeNtRNH88WUofeReKD6kyLZPC0friSLF6XJrXc36gRzdhhKCko1RJqOb/+dRoQdjFYUCdViH7vDTvCi8M8+hMbg0GKxOJ+rsPehLS24wEcTFvI0xK5ssZ7b90c=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(376002)(396003)(39860400002)(451199015)(36840700001)(46966006)(40470700004)(107886003)(478600001)(6486002)(53546011)(6506007)(26005)(82740400003)(2906002)(4326008)(40460700003)(8676002)(2616005)(186003)(8936002)(336012)(36756003)(5660300002)(6862004)(47076005)(6512007)(41300700001)(54906003)(33656002)(81166007)(316002)(40480700001)(356005)(36860700001)(86362001)(70586007)(70206006)(82310400005)(41533002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2022 09:56:46.1937
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1edd79c4-2617-42b2-6082-08dad7702fb2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VI1EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8744

Hi Julien,

> On 5 Dec 2022, at 3:20 pm, Julien Grall <julien@xen.org> wrote:
>=20
> On 05/12/2022 14:25, Michal Orzel wrote:
>>>>> diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-=
arm.h
>>>>> index 1528ced509..33d32835e7 100644
>>>>> --- a/xen/include/public/arch-arm.h
>>>>> +++ b/xen/include/public/arch-arm.h
>>>>> @@ -297,10 +297,14 @@ DEFINE_XEN_GUEST_HANDLE(vcpu_guest_context_t);
>>>>> #define XEN_DOMCTL_CONFIG_TEE_NONE      0
>>>>> #define XEN_DOMCTL_CONFIG_TEE_OPTEE     1
>>>>>=20
>>>>> +#define XEN_DOMCTL_CONFIG_VIOMMU_NONE   0
>>>>> +
>>>>> struct xen_arch_domainconfig {
>>>>>     /* IN/OUT */
>>>>>     uint8_t gic_version;
>>>>>     /* IN */
>>>>> +    uint8_t viommu_type;
>>>> this should be uint16_t and not uint8_t
>>>=20
>>> I will modify the in viommu_type to uint8_t in "arch/arm/include/asm/vi=
ommu.h" and will
>>> also fix  everywhere the viommu_type to uint8_t.
>> Also I think that you need to bump XEN_DOMCTL_INTERFACE_VERSION due to t=
he change
>> in struct xen_arch_domainconfig.
>=20
> We only need to bump the domctl version once per release. So if this is t=
he first modification of domctl.h in 4.18 then yes.
>=20
> That said, I am not sure whether this is necessary here as you are using =
a padding.
>=20
> @Rahul, BTW, I think you may need to regenerate the bindings for OCaml an=
d Go.

Ack. I will check this before sending the v2.

Regards,
Rahul


