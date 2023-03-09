Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61FEC6B2479
	for <lists+xen-devel@lfdr.de>; Thu,  9 Mar 2023 13:46:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.508254.782741 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1paFem-0002c9-FP; Thu, 09 Mar 2023 12:46:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 508254.782741; Thu, 09 Mar 2023 12:46:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1paFem-0002ZV-C4; Thu, 09 Mar 2023 12:46:04 +0000
Received: by outflank-mailman (input) for mailman id 508254;
 Thu, 09 Mar 2023 12:46:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V3pJ=7B=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1paFel-0002ZP-Eq
 for xen-devel@lists.xenproject.org; Thu, 09 Mar 2023 12:46:03 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20601.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 583ec31b-be78-11ed-956e-85ef70e17bfa;
 Thu, 09 Mar 2023 13:46:00 +0100 (CET)
Received: from DU2PR04CA0219.eurprd04.prod.outlook.com (2603:10a6:10:2b1::14)
 by PAXPR08MB7319.eurprd08.prod.outlook.com (2603:10a6:102:220::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.17; Thu, 9 Mar
 2023 12:45:55 +0000
Received: from DBAEUR03FT045.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2b1:cafe::21) by DU2PR04CA0219.outlook.office365.com
 (2603:10a6:10:2b1::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.19 via Frontend
 Transport; Thu, 9 Mar 2023 12:45:55 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT045.mail.protection.outlook.com (100.127.142.142) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.19 via Frontend Transport; Thu, 9 Mar 2023 12:45:54 +0000
Received: ("Tessian outbound f2a8d6d66d12:v135");
 Thu, 09 Mar 2023 12:45:54 +0000
Received: from 4ab41626abce.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 960C4169-0308-49DD-B22F-F38C2AC0D07D.1; 
 Thu, 09 Mar 2023 12:45:47 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4ab41626abce.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 09 Mar 2023 12:45:47 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by VE1PR08MB5629.eurprd08.prod.outlook.com (2603:10a6:800:1a6::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.18; Thu, 9 Mar
 2023 12:45:45 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::806c:fd65:92cf:7b7a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::806c:fd65:92cf:7b7a%7]) with mapi id 15.20.6178.019; Thu, 9 Mar 2023
 12:45:44 +0000
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
X-Inumbo-ID: 583ec31b-be78-11ed-956e-85ef70e17bfa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/bSnaV5nyAWkgByTd86v2pOYSLzC4xT2VlP6CUG2CX0=;
 b=ZIc9jopIE9nk0Ckrv1VuqqVQ6Wy8+d5PPNHfzVlnLfX3t+7vq2a2f/KxODxSZ5vc/ESVM3S4gYVNhMyvLCsh68+yKHTVBO1K0MKF5GYgXtmrkHp8SjsjXj/IfMkP1OvMNO/3/0kjqk6NbVm5mNlP+krPueIvqSsNbeWJAkKC/X8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 51e44c80441b3583
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XDyKzC94KWIpBZJY+9vN9xQHTcEnfrDp9X7/Jsb16gq8J2m96KRAxd+juEd1jIIfugHzDHjWOmj3yh9o4b3ePK2L8IteoJGX1QX/WnHzncatQCQ6bvlmKUIS/ZqkZiGEhcYdySmqkXxUlvxBMaE0DUXSwoW7lCJ5e5lZmG8owqzNak3oSPh0KdtusA1/HK+1yhlSnZmUa/3ScWX+fnQQKwmPMi7s39iL4FZ0utbWfkBcXCr6BNEPfMfTtaNHpqC83asQgRhFwCbk3loAUJ3wfAi98PsfLzZkVYTZUeTLm044m8zodhA5kFVpstvW48Z/7UhytHc874Avc8NoKDHRrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/bSnaV5nyAWkgByTd86v2pOYSLzC4xT2VlP6CUG2CX0=;
 b=Pg4jE9oqF8MHvbjN9GDklj5QIkxxT+aUwVHG+8NMeHNI+zlnD7jMFBeWPWFjEmW2BX1UrTdWevrq9JvUEITiKUKtCeXVi1KsSC8MmN2S130cswf2z0RRf2H9+2rNcLf/qdHzF+SkWIAsH316daGp0KRSuzYRYNiLptCGeX7DY6AGNG+A7kesUQOlFC8GmLMAqaGZeV0Aqk+vbxJNzALqBgpE4Ll0Ff7mrsFI0PvzlyurxIgoSzE+BlX63NLj6lXNW6QjRyGquqp1zqhOm68guPU9Wo9sNuuaf77zmmBFMD9s0wMFIBY2FmxQoPhcf7cGF/nWrhrvfGPh81pSNvH7RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/bSnaV5nyAWkgByTd86v2pOYSLzC4xT2VlP6CUG2CX0=;
 b=ZIc9jopIE9nk0Ckrv1VuqqVQ6Wy8+d5PPNHfzVlnLfX3t+7vq2a2f/KxODxSZ5vc/ESVM3S4gYVNhMyvLCsh68+yKHTVBO1K0MKF5GYgXtmrkHp8SjsjXj/IfMkP1OvMNO/3/0kjqk6NbVm5mNlP+krPueIvqSsNbeWJAkKC/X8=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, "Andrei Cherechesu (OSS)"
	<andrei.cherechesu@oss.nxp.com>, Xen-devel <xen-devel@lists.xenproject.org>,
	Andrei Cherechesu <andrei.cherechesu@nxp.com>, Julien Grall <julien@xen.org>
Subject: Re: [PATCH v1 2/2] arch/arm: time: Add support for parsing interrupts
 by names
Thread-Topic: [PATCH v1 2/2] arch/arm: time: Add support for parsing
 interrupts by names
Thread-Index:
 AQHZUN0sbGmRWBiDtEmQnPFLsz5lVK7vc/8AgABafACAAkqcgIAAIo2AgAAJfwCAAA/CAIAADAKAgAAGfwCAAAD0AA==
Date: Thu, 9 Mar 2023 12:45:44 +0000
Message-ID: <CA41DB66-DB7E-4EDD-9A34-38328A2A8C9E@arm.com>
References: <20230307100949.9231-1-andrei.cherechesu@oss.nxp.com>
 <20230307100949.9231-3-andrei.cherechesu@oss.nxp.com>
 <370745D6-D6AF-43D0-8E9F-2DB160BE0E07@arm.com>
 <alpine.DEB.2.22.394.2303071301300.863724@ubuntu-linux-20-04-desktop>
 <B58C926D-25FD-4EB6-A83C-229E72E16181@arm.com>
 <7a0734e9-a980-3dc1-026d-0c96a89c4d5c@amd.com>
 <0932C0EB-F90A-45D4-87F4-3594E6E74C64@arm.com>
 <3c0a6e88-2a1a-f06a-cac1-59801b1acfd6@amd.com>
 <D0D43830-5F75-4284-86E5-967E2059B377@arm.com>
 <df481924-6fa9-cac3-f822-9ff51b0824fe@amd.com>
In-Reply-To: <df481924-6fa9-cac3-f822-9ff51b0824fe@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.400.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|VE1PR08MB5629:EE_|DBAEUR03FT045:EE_|PAXPR08MB7319:EE_
X-MS-Office365-Filtering-Correlation-Id: 616567a6-5088-41cc-c709-08db209c391c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 eeGpUjOgwyYIWFwm2KsWWShUaTKH+0i8DaoEsJhFbTyS56rVRkQaJ1euL2j0hMWwVJfONKEK2ezMNn0TixRUUkEL/qfePokp24ghPB2bxiC3uxsnUdyJZap6O/irKsvnPrQ722xfoUfP5/IMJnOjvg7h5t+rBrQ6dATD8ZZJPppmsny6469t4oN66M2XzZ2erMJVIMq00St3wTkU649Hv8LiwbrtrRbe5vCyvQhSn7QLdNKksgy0qfNpFdnmpUqmTu1yaePht9JYJHwbBmRCP4EaxcLcPvaHJ2lS8p2LvhTt/d3KgSMDt870jWJi3tzcrvaFAW3My0gLlQ1PVp4Hx7rg92Qnfi1a4ay8TArVX0hSCGubRAV3mwinjd7sNLthXZBztK7HZ5WnR/A3U9wtMYfYRqbO6UjB3mR/RHyALJlhcDeR1PeDMFFt3EV1e7pLeycF8K2Upplm7oO/TMU/4/G4tB8uJw2i0rMJzucVBaabyjmd7mDJXgRDhXFlDodKAGJVHoaJRK9aLOO69PXRid+nT06Dkl2YovZ6YaOKu5HSR6wUFrzQoNZWaVT62vB9RSaUy7WSg4WCfciPQlgbH8MsPLd6dqCW8fhNSO3/DvgeftQHBwrSpHt6Qj/Kd6sTdxSEfnCiirKlvo+y03+IOAt0bhPVjFg6bmePYyIXtC61D+mEshXBfaUcgXXUDp+aLnUv+sgjGEJAhoh7NUKYCPJoCv5LmkccMC+JN3gvfCQ=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(376002)(396003)(39860400002)(136003)(346002)(451199018)(8936002)(36756003)(5660300002)(122000001)(53546011)(6506007)(6512007)(38100700002)(83380400001)(186003)(2616005)(91956017)(316002)(54906003)(86362001)(41300700001)(64756008)(33656002)(4326008)(6916009)(66446008)(8676002)(66556008)(76116006)(66946007)(66476007)(6486002)(71200400001)(478600001)(38070700005)(2906002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <B383682817595842AD358CD0FBDCA7F8@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5629
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	86b1d984-7888-4e45-e82c-08db209c331b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Qy4ofCYbrG0otwQxAzfJ5tRPaGBB8ZLAPK+Lb0iYTVwlC979/2jIyDezKb4KdLptUrviNUi2n791NAwGdEonB1yelmWgJut4X+7VZQhJaXB3ZOTZck1C+/aroR0K3HyzGSouU7+rQmv2qPnHuCPbwa9QORFbxszYRYZo4QETH10sRk1TP6CvPDF25d2r9GZrJG8R0/Yxsr8FhzythLRKI3Qije3nJtz2kCdQjp6SfrxmUyW17eC2ZrE/C/UZPoqM3KNP8aYLXKFPdoC3eQRtkDQZM9Sp5FOw6OWBVifNVgnPWLZbLBO1k7F/s5bxooLx/nYaRwCZg+Ajmwlu+zseMV9rTlDtCIQL34JGfhRSfQezOfbTUgY8pIP1057TMwJlvcZD03cxOHow9tWZrf59x1F4KANNOPP5B78K/ZpL4F8F3cRBOBpUzcIftPENsdvuxRx+dsgxA3aI01w1yYvZn9Supc053y9s9n8H/VHW3PxszWIgnHR6ODTfSUqHbUYst1bKvEFZlgPqKnQkeX10HX5oS7zCPWZOye9F1kq1IobF6WulzUEdwW8XJmV0DxB+K/wd49wkIY8+7MQaufOEPXTUGIn6oqDcxxr5ievInKDnfPuDwTOT6pqdcDqHMP4IdqUTPpg0mc2xxPU3iBt0edv561SzPrsDtwnh8EmmddmW0lOIWtDoHTWyGmQCZBgTojmjHdr+v/zbmAI81yl4pw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(136003)(376002)(396003)(39860400002)(346002)(451199018)(36840700001)(46966006)(40470700004)(8676002)(41300700001)(70586007)(81166007)(4326008)(2906002)(356005)(70206006)(316002)(54906003)(8936002)(82740400003)(6862004)(186003)(478600001)(82310400005)(36860700001)(40460700003)(36756003)(6486002)(26005)(6506007)(40480700001)(83380400001)(53546011)(33656002)(6512007)(2616005)(5660300002)(86362001)(47076005)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2023 12:45:54.8231
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 616567a6-5088-41cc-c709-08db209c391c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7319

Hi Michal,

> On 9 Mar 2023, at 13:42, Michal Orzel <michal.orzel@amd.com> wrote:
>=20
> Hi Bertrand,
>=20
> On 09/03/2023 13:19, Bertrand Marquis wrote:
>>=20
>>=20
>> Hi Michal,
>>=20
>>> On 9 Mar 2023, at 12:35, Michal Orzel <michal.orzel@amd.com> wrote:
>>>=20
>>>=20
>>>=20
>>> On 09/03/2023 11:39, Bertrand Marquis wrote:
>>>>=20
>>>>=20
>>>> Hi Michal,
>>>>=20
>>>>> On 9 Mar 2023, at 11:05, Michal Orzel <michal.orzel@amd.com> wrote:
>>>>>=20
>>>>>=20
>>>>>=20
>>>>> On 09/03/2023 09:02, Bertrand Marquis wrote:
>>>>>>=20
>>>>>>=20
>>>>>> Hi Stefano,
>>>>>>=20
>>>>>>> On 7 Mar 2023, at 22:02, Stefano Stabellini <sstabellini@kernel.org=
> wrote:
>>>>>>>=20
>>>>>>> On Tue, 7 Mar 2023, Bertrand Marquis wrote:
>>>>>>>>> On 7 Mar 2023, at 11:09, Andrei Cherechesu (OSS) <andrei.chereche=
su@oss.nxp.com> wrote:
>>>>>>>>>=20
>>>>>>>>> From: Andrei Cherechesu <andrei.cherechesu@nxp.com>
>>>>>>>>>=20
>>>>>>>>> Added support for parsing the ARM generic timer interrupts DT
>>>>>>>>> node by the "interrupt-names" property, if it is available.
>>>>>>>>>=20
>>>>>>>>> If not available, the usual parsing based on the expected
>>>>>>>>> IRQ order is performed.
>>>>>>>>>=20
>>>>>>>>> Also added the "hyp-virt" PPI to the timer PPI list, even
>>>>>>>>> though it's currently not in use. If the "hyp-virt" PPI is
>>>>>>>>> not found, the hypervisor won't panic.
>>>>>>>>>=20
>>>>>>>>> Signed-off-by: Andrei Cherechesu <andrei.cherechesu@nxp.com>
>>>>>>>>> ---
>>>>>>>>> xen/arch/arm/include/asm/time.h |  3 ++-
>>>>>>>>> xen/arch/arm/time.c             | 26 ++++++++++++++++++++++----
>>>>>>>>> 2 files changed, 24 insertions(+), 5 deletions(-)
>>>>>>>>>=20
>>>>>>>>> diff --git a/xen/arch/arm/include/asm/time.h b/xen/arch/arm/inclu=
de/asm/time.h
>>>>>>>>> index 4b401c1110..49ad8c1a6d 100644
>>>>>>>>> --- a/xen/arch/arm/include/asm/time.h
>>>>>>>>> +++ b/xen/arch/arm/include/asm/time.h
>>>>>>>>> @@ -82,7 +82,8 @@ enum timer_ppi
>>>>>>>>> TIMER_PHYS_NONSECURE_PPI =3D 1,
>>>>>>>>> TIMER_VIRT_PPI =3D 2,
>>>>>>>>> TIMER_HYP_PPI =3D 3,
>>>>>>>>> -    MAX_TIMER_PPI =3D 4,
>>>>>>>>> +    TIMER_HYP_VIRT_PPI =3D 4,
>>>>>>>>> +    MAX_TIMER_PPI =3D 5,
>>>>>>>>> };
>>>>>>>>>=20
>>>>>>>>> /*
>>>>>>>>> diff --git a/xen/arch/arm/time.c b/xen/arch/arm/time.c
>>>>>>>>> index 433d7be909..794da646d6 100644
>>>>>>>>> --- a/xen/arch/arm/time.c
>>>>>>>>> +++ b/xen/arch/arm/time.c
>>>>>>>>> @@ -38,6 +38,14 @@ uint32_t __read_mostly timer_dt_clock_frequenc=
y;
>>>>>>>>>=20
>>>>>>>>> static unsigned int timer_irq[MAX_TIMER_PPI];
>>>>>>>>>=20
>>>>>>>>> +static const char *timer_irq_names[MAX_TIMER_PPI] =3D {
>>>>>>>>> +    [TIMER_PHYS_SECURE_PPI] =3D "sec-phys",
>>>>>>>>> +    [TIMER_PHYS_NONSECURE_PPI] =3D "phys",
>>>>>>>>> +    [TIMER_VIRT_PPI] =3D "virt",
>>>>>>>>> +    [TIMER_HYP_PPI] =3D "hyp-phys",
>>>>>>>>> +    [TIMER_HYP_VIRT_PPI] =3D "hyp-virt",
>>>>>>>>> +};
>>>>>>>>> +
>>>>>>>>=20
>>>>>>>> I would need some reference or a pointer to some doc to check thos=
e.
>>>>>>>>=20
>>>>>>>>> unsigned int timer_get_irq(enum timer_ppi ppi)
>>>>>>>>> {
>>>>>>>>> ASSERT(ppi >=3D TIMER_PHYS_SECURE_PPI && ppi < MAX_TIMER_PPI);
>>>>>>>>> @@ -149,15 +157,25 @@ static void __init init_dt_xen_time(void)
>>>>>>>>> {
>>>>>>>>> int res;
>>>>>>>>> unsigned int i;
>>>>>>>>> +    bool has_names;
>>>>>>>>> +
>>>>>>>>> +    has_names =3D dt_property_read_bool(timer, "interrupt-names"=
);
>>>>>>>>>=20
>>>>>>>>> /* Retrieve all IRQs for the timer */
>>>>>>>>> for ( i =3D TIMER_PHYS_SECURE_PPI; i < MAX_TIMER_PPI; i++ )
>>>>>>>>> {
>>>>>>>>> -        res =3D platform_get_irq(timer, i);
>>>>>>>>> -
>>>>>>>>> -        if ( res < 0 )
>>>>>>>>> +        if ( has_names )
>>>>>>>>> +            res =3D platform_get_irq_byname(timer, timer_irq_nam=
es[i]);
>>>>>>>>> +        else
>>>>>>>>> +            res =3D platform_get_irq(timer, i);
>>>>>>>>> +
>>>>>>>>> +        if ( res > 0 )
>>>>>>>>=20
>>>>>>>> The behaviour of the code is changed here compared to the current
>>>>>>>> version as res =3D 0 will now generate a panic.
>>>>>>>>=20
>>>>>>>> Some device tree might not specify an interrupt number and just pu=
t
>>>>>>>> 0 and Xen will now panic on those systems.
>>>>>>>> As I have no idea if such systems exists and the behaviour is modi=
fied
>>>>>>>> you should justify this and mention it in the commit message or ke=
ep
>>>>>>>> the old behaviour and let 0 go through without a panic.
>>>>>>>>=20
>>>>>>>> @stefano, julien any idea here ? should just keep the old behaviou=
r ?
>>>>>>>=20
>>>>>>> platform_get_irq returns 0 if the irq is 0. The irq cannot be 0 bec=
ause
>>>>>>> 0 is reserved for SGIs, not PPIs. So I think it is OK to consider 0=
 an
>>>>>>> error.
>>>>>>=20
>>>>>> Problem here is that a DTB might not specify all interrupts and just=
 put
>>>>>> 0 for the one not used (or not available for example if you have no =
secure
>>>>>> world).
>>>>> Xen requires presence of EL3,EL2 and on such system, at least the fol=
lowing timers needs to be there
>>>>> according to Arm ARM:
>>>>> - EL3 phys (if EL3 is there)
>>>>=20
>>>> This might be needed by EL3 but not by Xen.
>>> Xen requires system with EL3 and if there is EL3, both Arm spec and dt =
bindings requires sec-phys timer to be there.
>>> So it would be very strange to see a fake interrupt with IRQ being 0. B=
ut if we relly want to only care about
>>> what Xen needs, then we could live with that (although it is difficult =
for me to find justification for 0 there).
>>> Device trees are created per system and if system has EL3, then why for=
cing 0 to be listed for sec-phys timer?
>>>=20
>>=20
>> Let's see that on the other angle: why should Xen check stuff that it do=
es not need ?
> Because apart from what it needs or not, there is a matter of a failure i=
n Xen.
> Xen exposes timer IRQs to dom0 as they were taken from dtb and allowing 0=
 for any of the timer IRQ would result
> in a Xen failure when reserving such IRQ. Xen presets SGI IRQs, meaning b=
its 0:15 in allocated_irqs bitmap are set.
> This is why when calling vgic_reserve_virq and passing SGI always results=
 in calling a BUG().
>=20
> So we have two options:
> - panic earlier with a meaningful message when IRQ is 0
> - let Xen continue and reach BUG which would be not that obvious for peop=
le using but not knowing Xen

So you are saying that in the current state 0 would be ignored during scan =
and create a bug later.

If this is the case than definitely we should panic earlier with a proper m=
essage I agree.

Regards
Bertrand

>=20
> I think first option is always better.
>=20
> ~Michal



