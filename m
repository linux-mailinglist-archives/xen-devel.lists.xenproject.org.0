Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 381B3426065
	for <lists+xen-devel@lfdr.de>; Fri,  8 Oct 2021 01:33:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.204152.359361 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYcsb-0002TC-9o; Thu, 07 Oct 2021 23:32:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 204152.359361; Thu, 07 Oct 2021 23:32:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYcsb-0002Qi-6c; Thu, 07 Oct 2021 23:32:49 +0000
Received: by outflank-mailman (input) for mailman id 204152;
 Thu, 07 Oct 2021 23:32:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7uL+=O3=epam.com=prvs=0914b18df8=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1mYcsZ-0002Qc-4T
 for xen-devel@lists.xenproject.org; Thu, 07 Oct 2021 23:32:47 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e009102a-27c6-11ec-8010-12813bfff9fa;
 Thu, 07 Oct 2021 23:32:45 +0000 (UTC)
Received: from pps.filterd (m0174681.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 197N4en8021891; 
 Thu, 7 Oct 2021 23:32:43 GMT
Received: from eur02-he1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2052.outbound.protection.outlook.com [104.47.5.52])
 by mx0b-0039f301.pphosted.com with ESMTP id 3bja7y01jb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 07 Oct 2021 23:32:43 +0000
Received: from PAXPR03MB7594.eurprd03.prod.outlook.com (2603:10a6:102:201::14)
 by PAXPR03MB7561.eurprd03.prod.outlook.com (2603:10a6:102:1dc::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.21; Thu, 7 Oct
 2021 23:32:41 +0000
Received: from PAXPR03MB7594.eurprd03.prod.outlook.com
 ([fe80::24db:d530:e190:518b]) by PAXPR03MB7594.eurprd03.prod.outlook.com
 ([fe80::24db:d530:e190:518b%6]) with mapi id 15.20.4587.019; Thu, 7 Oct 2021
 23:32:41 +0000
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
X-Inumbo-ID: e009102a-27c6-11ec-8010-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EaQ1+CBKtHusJvTn1dWFHPeS9kaIy30Vy/v6j/lCexmIyfo5XIoamocpqU3X6ZE6xfMpny3k0TDiwx+OIBfVopjD/rAL+QzxwGOwON77LI7cdXYKtUohmSsNkqJMuIhD4VD1bP7K2FEhcS8FUvSMfVZZqYgM2lYc7VByWWR0f04N7wwNlGQSama3FH0N7kLsns6luBNV/bhK+amn8PigMX3l4qoSA/XXNN7xgcnS2OVIn/vfSEpQq1rlXwE6TEW5h4MGKjgFFnCStiZ0i/pCjrZ01Y0MJ9IiDvXSTtd2J3ozRpLcQvDbXG2PUTHOJnviwdVczLSXQmsX/Cb4npRuBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6l8artcHo1hOL5v26iTr6RvV93yEMXXxdFgbI0hHPjk=;
 b=MN4HCVXz7YRhNbObFKe0sB/L58yxaRb9I5U7YH1e3nav+mB8u0wVBIjUcmmVwHF5JnQVbj0+uJ+IqyijJrdPE4/qRjWta8dikDpBi6RFKocZb2AN9fmxxsHaXU8a8qy7KEAQDI2p2BCfgB+m9jXTOSaHQ3nblp1Y5cWN7NTU6A3KdY9JG3mrSxk1Hmryys4HLu5RgmP1IMS5hMifUqdaP6m8+K8cKdVSbnRX6o2AXwNqM+HIQv+aUxnxpvAUhNnh/eYto8kT56wEc7FPZbIo0l6XfKmtyi4nEAoCpA1bpQYd7KTAFkcQ3u4np0MfR1Ihk0Xw96OavjY7rm9lXxfp0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6l8artcHo1hOL5v26iTr6RvV93yEMXXxdFgbI0hHPjk=;
 b=JQ/2q3ZNVHW9j9Rn6XBbUWgPYoZeh7o59mYBp0TraBArxlr9d85wd6Ad9rZtxOi5F5w0mSWnhOlQaODuNoziBIoe9/NL8aSNX2Uh2YqacS3qtnGf7R3b3xZ/n2NLTJG5g5efal0FLQQNa0k65AD6hwC/tyVRJSst5oNQ//E6n5yieluhTYVCmbjk6nhi2sJ7BbWW3yk5iS6wYEi4FPGeS0+Y69Z+G0ZdIO/0bXSJ2I/+vF+F3GK1Bi7BTaqTm5nJO403DMziffrnw3WbCMXgfjgEqXn342vYZKtXETSYuP/jthO0N8s3FpUpfGZct8eZNfBOu7ckJj79+XC3vU1y0w==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Oleksandr <olekstysh@gmail.com>
CC: Stefano Stabellini <sstabellini@kernel.org>,
        Julien Grall
	<julien@xen.org>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        "tee-dev@lists.linaro.org"
	<tee-dev@lists.linaro.org>
Subject: Re: [PATCH] xen/arm: optee: Fix arm_smccc_smc's a0 for
 OPTEE_SMC_DISABLE_SHM_CACHE
Thread-Topic: [PATCH] xen/arm: optee: Fix arm_smccc_smc's a0 for
 OPTEE_SMC_DISABLE_SHM_CACHE
Thread-Index: AQHXs6cvn7zQUNndCEOzhQWRkGM4Xqu44f8AgA17pgCAAEHdAIABQq8AgABb1YA=
Date: Thu, 7 Oct 2021 23:32:40 +0000
Message-ID: <87czogqulj.fsf@epam.com>
References: <1632750850-28600-1-git-send-email-olekstysh@gmail.com>
 <alpine.DEB.2.21.2109272151260.5022@sstabellini-ThinkPad-T480s>
 <e612c225-cda6-2c41-bf20-73314ebceb02@xen.org>
 <alpine.DEB.2.21.2110061537310.3209@sstabellini-ThinkPad-T480s>
 <29e1696a-5664-25f4-b679-1f73020ecf97@gmail.com>
In-Reply-To: <29e1696a-5664-25f4-b679-1f73020ecf97@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.6.5; emacs 27.2
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 52ddf15b-c077-493d-3ccd-08d989eac171
x-ms-traffictypediagnostic: PAXPR03MB7561:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: 
 <PAXPR03MB7561049F49240379A9D5C85BE6B19@PAXPR03MB7561.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Sb9p0kSmPFTwMmhCPfqzOl0G1rr0kmH4pU0RfrVAjwgPr2VnpKAxEZIlU+xb6j/xzWrcsiE+vWZ61RgXtR4NukILYRwBtKGAdDc8aZh31BlCOSiwogwO8MN/GuwXExBVbah0WqofGjfNf0YUI8JbyFyh3o6+B9zJZfEn1HedqWDCDgU5ekntkTroJXsD2lR8bRZXvY5CU43YmUKZpACYvymdY024YGaJtND6sdZAGKdDCYLxIJjLt5+2XAA+2NxStzuZ+79LVaech1Z5bmFriSb7+Zd4s1/jEP4o8Lrtl+m11tBnBDKEcanwpsrCW2cfkPJ4ian0M+OmO05Oi/HeyMbwdWXCJ6Ha+91qUNwFAyS1X0l74XVZ2UMby1sAVFqm6JAis1cZBIPz+TwoC7RHbj7+uw1/rpptZi9obZeMm6xu5UezVvRhjDT/zE63GBjET+aYfuuCEYNsrdrzxMzq0wZZQrzezSoRNJ7ymnfriy+ARca6Zz1QW3N7C7RUb1jRd0aHH9WaiPnjhZ/o5GKJ92JLRT4yQdoVZ8KnVdG549gkPsPqJbLsMQ9wjCJOb3/yhflZmKmXdollAiWz79EE/8woTmnaW7CuvLKiQtuQiWOvS3dzYBxpJIR9PTLd74oehSWA4ITHGV+1peWdFhDWRjcdCZ1FxRFqksAvtvHRbyTaCd20PlHThQ5uFvbfDZ1VSBrl0ALPbl9DjhM+dmj97Q==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR03MB7594.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(508600001)(83380400001)(6486002)(71200400001)(2616005)(86362001)(8676002)(8936002)(6512007)(38100700002)(5660300002)(6916009)(53546011)(122000001)(36756003)(6506007)(66556008)(76116006)(91956017)(4326008)(66446008)(66476007)(64756008)(66946007)(26005)(316002)(38070700005)(186003)(2906002)(55236004)(54906003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?srrYthoinTXkJINvOYdew5f52S6q89ZLUjLcE8MpztNgdOFhkepm0wwMyl?=
 =?iso-8859-1?Q?otO7PSwCFnXktbW5kh+j5trnK4DEaKx/f6J6j6Q68qRWrZri242uXe62Oc?=
 =?iso-8859-1?Q?gPD1YeZVsm3pQ5lELqieD2motiIPxYfsvVAPiljkORBLhn64eAGMinYsQl?=
 =?iso-8859-1?Q?xqaGOJGccIA1NiFvm9i+eqZxoWeqiB+ei/P5g2TYnOJA8FHg+sm0WYbm8y?=
 =?iso-8859-1?Q?YECw+p3dCC9ycXnNO29LvxrP4/atUDJADJuxy2m0+qfTr+NoJjmUZZV3BW?=
 =?iso-8859-1?Q?WZKLPRiBTL/YclAmCUhU6fggFRWGOXxCjSGX0guIJRWoznyiLnv0iLvL3V?=
 =?iso-8859-1?Q?i6eSZrndQ/FXWm1Y1ytivxIDgYL73ixloN0ukaYPVNvoSuGhKDrmlalFgW?=
 =?iso-8859-1?Q?5ggT6W03ArWNC8kv8LeWS+VPrE/nEv79rgnryyaX5H4ve071RMSkjFEXwh?=
 =?iso-8859-1?Q?1LKiI9FVLWEjYNvuqTj5x6PVP7bFQ0AtpI17mDUX2RFKUcGjbWVWGGMRDh?=
 =?iso-8859-1?Q?YujSQJlYiihTuJ0g4VTCWpFXe7ciGh+HEf3Yqdcb/aoeZHD+l8plFbf3Ar?=
 =?iso-8859-1?Q?Yi1/bO7q6F5GVDMp0JuTsToxzeyubbyc1WOjLRavxE6BcOEJiP5HjL0241?=
 =?iso-8859-1?Q?GFh82BboSwsRpIdK0byrOrM31Mbz/hyl1sRBTB9O/dKfHEQTz4+38JtADy?=
 =?iso-8859-1?Q?7HZ1lmKisMqBc2A9oSokGb4EQHt1LGbKfRup5uK+p7hMjWCPkKVF1cilRs?=
 =?iso-8859-1?Q?gPR6igP3PvHmmWpeopH8Uggry8mLkNOC2rRAioyXsUoBnFSXRlMmUldS/i?=
 =?iso-8859-1?Q?TwuHWGGsYL9UmkBwx//NanD8j7GGp0fVsjaejq4SlWo7VID4bG+ealcVf3?=
 =?iso-8859-1?Q?UjSIw7R6/8QZWrS8qcQ3wltpWkEdzCsuZBHm20SvhXwMwfDS4GUQjCPWFs?=
 =?iso-8859-1?Q?54vm2w4hLmvKIOdGDSAVikFl24AF88pDi5JuZTRKapygzDojpFCRVpqZaG?=
 =?iso-8859-1?Q?y2rFzzJhKG+nETR0P4azNWjuJzjWVhg7+7r8iryh/rR3NTQQFnWeSx0wBU?=
 =?iso-8859-1?Q?LccNm77BbBakkMv36kjNdAGX9DMYx3j7aAlaTTRZ6HHwvj7e2RD6B9gWnx?=
 =?iso-8859-1?Q?tLHqQiBBnMs9nBOiVGw6VJ4X4F1u9ZqFGD5t6rtlqxscwa+jzZ0lvb7sdI?=
 =?iso-8859-1?Q?lTwW63HCTBYKjo1z1HIpVFGf+S33AtIUZU8gks145dNKpMSdYsqJBEY8RC?=
 =?iso-8859-1?Q?Hkg0HG0j5OGo2+VotE+DxtwfMJ8wB0D4mDaFQexRpNSW2jPx6XG+B7uddj?=
 =?iso-8859-1?Q?lY36nZ2oPkRc/zmkBvTvInacPCL06qO3jgi7p0nQlIQ6yC941iTbPzag5t?=
 =?iso-8859-1?Q?GS6bSBG0wg?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR03MB7594.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52ddf15b-c077-493d-3ccd-08d989eac171
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2021 23:32:40.9755
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7CsnvIZwjn+1AaahMj9AtdPvhagfeD50Q8uMzpsVQnpWto48j3EHx/Y5q/efNf40x3rh5NfUEkT+CvFpQjHMOLwUOGs+KyOvzJtXcQL+Prk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB7561
X-Proofpoint-GUID: fMkCNCbMvVKhxFzaTL77KvlvYLi05x3p
X-Proofpoint-ORIG-GUID: fMkCNCbMvVKhxFzaTL77KvlvYLi05x3p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-07_05,2021-10-07_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=999
 spamscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110070147


Hi Oleksandr, Stefano,

Oleksandr <olekstysh@gmail.com> writes:

> On 07.10.21 01:42, Stefano Stabellini wrote:
>
> Hi Stefano, Julien.
>
>> On Wed, 6 Oct 2021, Julien Grall wrote:
>>> Hi Stefano,
>>>
>>> On 28/09/2021 06:52, Stefano Stabellini wrote:
>>>> On Mon, 27 Sep 2021, Oleksandr Tyshchenko wrote:
>>>>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>>>
>>>>> Fix a possible copy-paste error in arm_smccc_smc's first argument (a0=
)
>>>>> for OPTEE_SMC_DISABLE_SHM_CACHE case.
>>>>>
>>>>> This error causes Linux > v5.14-rc5
>>>>> (b5c10dd04b7418793517e3286cde5c04759a86de
>>>>> optee: Clear stale cache entries during initialization) to stuck
>>>>> repeatedly issuing OPTEE_SMC_DISABLE_SHM_CACHE call and waiting for
>>>>> the result to be OPTEE_SMC_RETURN_ENOTAVAIL which will never happen.
>>>>>
>>>>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>> Acked-by: Stefano Stabellini <sstabellini@kernel.org>
>>>>
>>>> I added Fixes: and Backport: tags to the commit
>>> Per SUPPORT.MD, OP-TEE is still a technical preview. So I would argue t=
hat we
>>> should not do any backport because the feature itself is not officially
>>> considered supported.
>> Good point!
>>
>>
>>> That said, what's missing to make the feature officially supported?
>> If Oleksandr is also happy to make OP-TEE support in Xen "Supported" in
>> SUPPORT.md I'd be happy with that too. Specifically I suggest to change
>> it to:
>>
>> Status: Supported, not security supported
>>
>> Security Support is a bit of a heavy process and I am thinking that
>> "Supported, not security supported" would be an excellent next step.
>
> I would be happy, and can send a formal patch. But I am not an expert
> in this code.

I'm will be happy with this too. We are using this mediator in our
projects and I know that OP-TEE community adopted tests for
virtualization in theirs CI stack. So this is kind of official now.

Also, I helped other people to bring up virtualization on theirs
platforms, so there are other users for this feature besides EPAM and
Linaro.

> (looks like there are some TODO left in the code and I have no idea
> what are the implications)

Well, there were a lot of TODOs when I submitted initial
implementation. At that time it indeed wasn't ready for production. But
I eventually fixed almost all of them. Only one left now. It is about
very unlikely situation when one of guest pages in mapped at PA=3D0. I'm
not sure that is even possible at all.

--=20
Volodymyr Babchuk at EPAM=

