Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 816CD459F1F
	for <lists+xen-devel@lfdr.de>; Tue, 23 Nov 2021 10:20:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.229223.396685 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpRxu-0000IY-RJ; Tue, 23 Nov 2021 09:19:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 229223.396685; Tue, 23 Nov 2021 09:19:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpRxu-0000F4-O5; Tue, 23 Nov 2021 09:19:50 +0000
Received: by outflank-mailman (input) for mailman id 229223;
 Tue, 23 Nov 2021 09:19:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r6oU=QK=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1mpRxu-0000Ey-0d
 for xen-devel@lists.xenproject.org; Tue, 23 Nov 2021 09:19:50 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20627.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::627])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7b460c22-4c3e-11ec-a9d2-d9f7a1cc8784;
 Tue, 23 Nov 2021 10:19:39 +0100 (CET)
Received: from AM0PR07CA0035.eurprd07.prod.outlook.com (2603:10a6:208:ac::48)
 by VI1PR0801MB2095.eurprd08.prod.outlook.com (2603:10a6:800:8c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.24; Tue, 23 Nov
 2021 09:19:45 +0000
Received: from VE1EUR03FT051.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:208:ac:cafe::22) by AM0PR07CA0035.outlook.office365.com
 (2603:10a6:208:ac::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.11 via Frontend
 Transport; Tue, 23 Nov 2021 09:19:45 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT051.mail.protection.outlook.com (10.152.19.75) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.19 via Frontend Transport; Tue, 23 Nov 2021 09:19:43 +0000
Received: ("Tessian outbound de6049708a0a:v110");
 Tue, 23 Nov 2021 09:19:42 +0000
Received: from 34afdb4bd97e.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8A11E55E-172E-46C5-B495-B2D3B79FE7AF.1; 
 Tue, 23 Nov 2021 09:19:32 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 34afdb4bd97e.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 23 Nov 2021 09:19:32 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM6PR08MB2965.eurprd08.prod.outlook.com (2603:10a6:209:49::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Tue, 23 Nov
 2021 09:19:27 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::69d7:e26:6610:ebd8]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::69d7:e26:6610:ebd8%4]) with mapi id 15.20.4713.025; Tue, 23 Nov 2021
 09:19:27 +0000
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
X-Inumbo-ID: 7b460c22-4c3e-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DlYhhnkxV5+rn3Am7ZGdO/r2/K+pzQACH2qYqOI0kYE=;
 b=tNBL1tiD2tDIVXrYJQVcxBERltcQDc1pY4DM9quYpGrfDLi5ootRq9jnZ5jxLJTpGQFvFsLjUfNWYbNRi28xL3vN5BsAC5VuC0RIOqskuT7aDNEnPqcqA7lrZnI1aYvDEuSiZuFQELF49r8zvPPijwNhc3X2I9b8ETg0DkQIVYI=
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 63.35.35.123) smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=temperror action=none
 header.from=arm.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
X-CheckRecipientChecked: true
X-CR-MTA-CID: a63ce3238dad0468
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bL59AMrwCazS3PIenXaoybmhrElS2pbQ7yGA1GpAZQBc4snt+1Wbt/d9rCVkNR/u0n7PM7kfvrHPE9SZQwbtHAH8dKn0GEKmU/zZhOy5jUxBVzs7yGsdbFr6iu7R3mNxU5jKvi4LyrSKu859yGa+pwvLkGvsZX4jtj33Qe39VHsa4IjGuSdoaXzWaTnQoVHo0UTtvEReghr/R+NBFdzfBkfzt/Jm7P9Wec3rZVrVo73kvGcbb2zXZas5xisc5x7GhU0KAeiwdjeqP7B4ruLDHfncdkHsdUm4w4IXAb4NtCgL2rZmjB9xLDw73mFOBicJqJmRkMCjVLaPWSnaHhmPOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DlYhhnkxV5+rn3Am7ZGdO/r2/K+pzQACH2qYqOI0kYE=;
 b=guBXJ+7Z/1oEZgRM2gmG8n7RSkWDQMOftNh3793lr7PeTJENn2Jvt85IE8EpDy2mE5L1qQdWw3z3aGsQofrB8JwgIKMncq/QRt8gVaUVC2NOYkyijDxG68TNCS+qNUIgrGigEkXrZuMOgjwCrePKsuE58sJUPoFCVqpRmBeWauibefNRb2+T5A7Y/+busNSrDbylo/xVts74hRuhRN5+IGxKhxim3e7Y4enBOyeD9EvnFvUDPpLWpHTjnxZJ5QmfB4YWCL56UfOrPTglPjrxAMOgEN9mf/WuOtz0BpMOkbALd8l/D1UFN69K0jVsBd7dxBithc0DCrfHwLFTu6j4TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DlYhhnkxV5+rn3Am7ZGdO/r2/K+pzQACH2qYqOI0kYE=;
 b=tNBL1tiD2tDIVXrYJQVcxBERltcQDc1pY4DM9quYpGrfDLi5ootRq9jnZ5jxLJTpGQFvFsLjUfNWYbNRi28xL3vN5BsAC5VuC0RIOqskuT7aDNEnPqcqA7lrZnI1aYvDEuSiZuFQELF49r8zvPPijwNhc3X2I9b8ETg0DkQIVYI=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien.grall.oss@gmail.com>, Ayan Kumar Halder
	<ayan.kumar.halder@xilinx.com>, xen-devel <xen-devel@lists.xenproject.org>,
	Wei Chen <Wei.Chen@arm.com>, Stefano Stabellini
	<stefano.stabellini@xilinx.com>, Jan Beulich <jbeulich@suse.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Rahul Singh <Rahul.Singh@arm.com>
Subject: Re: [RFC PATCH] Added the logic to decode 32 bit ldr/str
 post-indexing instructions
Thread-Topic: [RFC PATCH] Added the logic to decode 32 bit ldr/str
 post-indexing instructions
Thread-Index:
 AQHX3WXgMxQOWtsAQkCagYrL+eVmYKwLGnaAgASCuICAAF76gIAACHQAgACBjgCAAE4VAIAAB2AA
Date: Tue, 23 Nov 2021 09:19:27 +0000
Message-ID: <59260878-D0DC-441D-A039-FCCF683F2FD0@arm.com>
References: <20211119165202.42442-1-ayankuma@xilinx.com>
 <647a76f8-fea9-57b3-eb64-82a67adba1fb@xen.org>
 <5a2f681a-c6ef-bc3a-ed09-e378dc6abc90@xilinx.com>
 <alpine.DEB.2.22.394.2111221157050.1412361@ubuntu-linux-20-04-desktop>
 <CAJ=z9a1L5v2+wC7-aaA2PjV2FzrFXjT-5t_0ijznGKvwywvd5A@mail.gmail.com>
 <alpine.DEB.2.22.394.2111221241450.1412361@ubuntu-linux-20-04-desktop>
 <B4D77172-9AD5-49CD-90E6-872AB2F13258@arm.com>
In-Reply-To: <B4D77172-9AD5-49CD-90E6-872AB2F13258@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: d3f8ddbb-1deb-4341-184c-08d9ae6262bb
x-ms-traffictypediagnostic: AM6PR08MB2965:|VI1PR0801MB2095:
X-Microsoft-Antispam-PRVS:
	<VI1PR0801MB20950B1FEA872FCC4917D0969D609@VI1PR0801MB2095.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 8mpB9zBf0mhxNaTugRdAYNJN8+UscGplbkmZrSa8JfXuueL58gx6IrQpWUiY4CJWe/BjIeQxtFG07sUMy2vT4s3N8lr8NibEC6ACkiQLnXY05GOyAOzmhIR+deHFTLMOLHhZF2Ce1MjcvqGbZDYZVAIiZ4a/DiJMw1YCW1f5qzUu2yK10m+fL4qp1LXCC75Nw9S4xxwc6Mrggg4VSNFp2orRXWRk6M5H7H5sWq4xQeVbk5exSrIzE3KQG0d0joEdYuoiE/reVoHrsddhuXGi1fpb/LnOUxlHete3Gc0RuhFFbceolgIqdUvVwhrROeie3NAKG7ih75oj8MiQH81LziGeTFT2Fa7/TjwHVVxGVy6mplRqg9dFaHDUBerbkp382StRYeWwXIJjNGuQJEUlXHSTr63XbuaFdk9u8/x012N4ZaNf5DvPCuFgP4aOnupWYqig9uzuF88SFoqjEDoO4heHxMVKNhAeDs/Fdql6LKJeBUDd2BgvN5iSRPoQT78weQfPIytOwWu5o4n7gNT7QOp7ybxM+ZpMpYxw3anYr0+4EYgu8edpNIl3De6Kclr9J5BeApUkgjWVHKUJZYGQ/v1hBNMFGf5D+USSdiHSHL3oKemzWDhMVcH3GIT20XOQ49aoWieUzJRRyxC8J8sZPef6ix1SASIu/KM1zljdUa3Bjlck0tPKF7v2mOmDFHP5jdP+4CBBgyDzrBxcNjgg1XEvUGSJJXW56NSZPrwApZumxpiWkobzdugNGyS+j2Z4
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38070700005)(53546011)(71200400001)(38100700002)(33656002)(122000001)(6506007)(54906003)(5660300002)(8676002)(36756003)(2906002)(6916009)(86362001)(2616005)(4326008)(6512007)(76116006)(83380400001)(508600001)(64756008)(66446008)(66556008)(66476007)(91956017)(26005)(316002)(8936002)(186003)(6486002)(66946007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2427CE4214FF29468EB565812128CC97@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB2965
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b62806d7-8ebf-493d-9e52-08d9ae625933
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Rnj23b+zHR1xKdpNt8/ovm0Hh3LMPYdXOwNLLnn8xJk3ARC4f39cdR2AA8Ss2xXYIuK2hqnoD+HP63N8tV5P83IGnn51oa5eUb7yW03uyAGrg6ToXeSGhYVnFaJ1DAxYFFN5BQYA3JXZLZamH5BQpBT3hpMmHnLF3Ex1o+vHHZLeCmdlPkxm0j9VxVPeBJgo/NzsaOl3Dd/9FgX+RITBv3qNFWyQeoexlpeBURcdjYiHMuU0e9CLn8PQEKRO7ayDMrHVsj6tfhxaucPwRv9OEUcYIFekbQyzqI0pEi3h4D2CVDgnWIutlzdmGEwlCxkS23dPzOqpVNY56zDIwK6SOHG2PrJFHAeQcTqt5t5JAQ21gOXREVXgJ+Q2Tw+kgwzdFRaN9cRRxu7gHxsu4y/ikSRRiB4AWZ4swXAvZ5KttnlPl2D8vlKVEDY68bePonmjLofNDMOeV6exJXFXsAgXb1NLQlUHFwKVO/9NNxcbRTlNnKRmFcBOk4hiF+s+ey7EotDkssPiLZvd2zmzKhxLxTFh3Epnu5jHV5/cVH+/PWdENaHDYJM93L3UKyijdpy1MsBVYFRYMyoEnwsebsWK2Qe428EPCQ83lA83pcBiscLl165n/g8ZM3qKuE4cwANbwgG3MTChsoT0Gs6GhgczGnxbWETnWfpimkRFd1RczaBYPnn1ZblZcRiIfZHWkJCGtnIBuok7qxDSkOqt+eYW7kiu3NrH2+Bcdv5+GeD+2DE=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(316002)(82310400004)(54906003)(6512007)(6486002)(86362001)(36860700001)(6862004)(5660300002)(2616005)(83380400001)(8936002)(4326008)(70206006)(70586007)(356005)(8676002)(63370400001)(63350400001)(47076005)(186003)(81166007)(26005)(36756003)(6506007)(336012)(2906002)(53546011)(33656002)(508600001)(45980500001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2021 09:19:43.5019
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d3f8ddbb-1deb-4341-184c-08d9ae6262bb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB2095

Hi,

> On 23 Nov 2021, at 08:53, Bertrand Marquis <bertrand.marquis@arm.com> wro=
te:
>=20
> Hi Stefano,
>=20
>> On 23 Nov 2021, at 04:13, Stefano Stabellini <sstabellini@kernel.org> wr=
ote:
>>=20
>> On Mon, 22 Nov 2021, Julien Grall wrote:
>>> On Mon, 22 Nov 2021 at 19:59, Stefano Stabellini <sstabellini@kernel.or=
g> wrote:
>>>>=20
>>>> On Mon, 22 Nov 2021, Ayan Kumar Halder wrote:
>>>>> Stefano > It doesn't look like we are setting dabt->write anywhere.
>>>>>=20
>>>>> Ayan > Yes, this is a miss. Depending on the opc, this should be upad=
eted
>>>>> accordingly in decode_64bit_loadstore_postindexing().
>>>>>=20
>>>>> Stefano > Also, is info.gpa in try_handle_mmio already updated in the
>>>>> pre-index
>>>>> case? If not, do we need to apply the offset manually here?
>>>>>=20
>>>>> Ayan > Sorry, I did not understand you. This patch is only related to=
 the post
>>>>> indexing ldr/str issue. Why do we need to check for pre-indexing ?
>>>>=20
>>>> I thought you were trying to handle both post-indexing and pre-indexin=
g.
>>>> It is OK if you intend to only handle post-indexing but considering th=
at
>>>> most of the code is shared between the two, we might as well also make
>>>> pre-indexing work (unless it turns out it is more difficult).
>>>=20
>>> Wouldn't this effectively be dead code?
>=20
> I agree this would be dead code. Pre-indexing is handled by the hardware,=
 only post are not.
>=20
>>>=20
>>>>=20
>>>> In the pre-indexing case, I would imagine we need to update the base
>>>> address before taking any other actions.
>>>=20
>>>> From my understanding, this would have already been performed by the
>>> HW when the syndrome is valid. This may also be the case for
>>> the non-valid case, but I haven't checked the Arm Arm.
>>=20
>> It is not clear to me either, that's why I wrote "I would imagine"... I
>> was guessing that it is not done by the HW in the non-valid case but I
>> don't know.
>=20
> This should be handled by the hardware here, so only post actions should
> be handled here.
>=20
>>=20
>> Of course, if it is already done by the HW, that's all the better: no
>> need for us to do anything.
>=20
> I am wondering though if other types of accesses could not be handled her=
e
> without major modification of the code like other sizes then 32bit.

I did some checks and I think the following cases could be handled:
    ldr x2, [x1], #4
    nop
    ldr w2, [x1], #-4
    nop
    ldrh w2, [x1], #8
    nop
    ldrb w2, [x1], #16
    nop
    str x2, [x1], #4
    nop
    str w2, [x1], #-4
    nop
    strh w2, [x1], #8
    nop
    strb w2, [x1], #16
    nop

Anything that I could have missed ?

>=20
> There are also post instructions with shifting but to be honest I do not =
think this is really needed.

Please ignore this, there is no post shifting.

Once this is done I can test and add a test to XTF on arm (on our side, ups=
treaming of this is in progress) to make sure this is maintained.

Regards
Bertrand


