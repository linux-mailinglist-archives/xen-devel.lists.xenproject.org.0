Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E016A6CD6
	for <lists+xen-devel@lfdr.de>; Wed,  1 Mar 2023 14:06:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.504040.776532 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXMAD-0007wT-Hf; Wed, 01 Mar 2023 13:06:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 504040.776532; Wed, 01 Mar 2023 13:06:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXMAD-0007tx-DQ; Wed, 01 Mar 2023 13:06:33 +0000
Received: by outflank-mailman (input) for mailman id 504040;
 Wed, 01 Mar 2023 13:06:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Km5w=6Z=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1pXMAB-0007n9-1e
 for xen-devel@lists.xenproject.org; Wed, 01 Mar 2023 13:06:31 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20630.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e2530f35-b831-11ed-96a4-2f268f93b82a;
 Wed, 01 Mar 2023 14:06:31 +0100 (CET)
Received: from DB6PR1001CA0005.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:4:b7::15)
 by PA4PR08MB6142.eurprd08.prod.outlook.com (2603:10a6:102:ee::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.30; Wed, 1 Mar
 2023 13:06:26 +0000
Received: from DBAEUR03FT062.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:b7::4) by DB6PR1001CA0005.outlook.office365.com
 (2603:10a6:4:b7::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.18 via Frontend
 Transport; Wed, 1 Mar 2023 13:06:26 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT062.mail.protection.outlook.com (100.127.142.64) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6156.18 via Frontend Transport; Wed, 1 Mar 2023 13:06:26 +0000
Received: ("Tessian outbound fcd8b5fba459:v135");
 Wed, 01 Mar 2023 13:06:26 +0000
Received: from 058ec4a08d4d.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D9255EDA-2C23-4734-A154-2C1A3AD32E27.1; 
 Wed, 01 Mar 2023 13:06:15 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 058ec4a08d4d.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 01 Mar 2023 13:06:15 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by PAXPR08MB6448.eurprd08.prod.outlook.com (2603:10a6:102:152::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.30; Wed, 1 Mar
 2023 13:06:13 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::806c:fd65:92cf:7b7a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::806c:fd65:92cf:7b7a%6]) with mapi id 15.20.6156.018; Wed, 1 Mar 2023
 13:06:13 +0000
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
X-Inumbo-ID: e2530f35-b831-11ed-96a4-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rKcbyU1x2+pDecp4JXNBP5OuFczh/0eOuyh5Qc8Uu7c=;
 b=2WDQ4NlzR9YmkiEeBTA/SIMlv/5qo4rAVjsYSIPbJ6OIM6Qp+kOKKqzxTitRFd0cncJGhGCEdiJe/q7g7JW6wBQEibCVn65jmwXeUpFlFm5Sg4co5WjWzRWJ3aA4i1ASuYeaHDlYOX5AVHtHsQsbwAdBH5j3tZKzou7VkjSiuYE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: ac1f84102085ed87
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J2hqEb+pfVKxz/gn4dPVhyphlXWDwRijTMQP2NazD6QLVe1FiKkJTew0r8yzbpL4Squ8Aybx9b7vO0vCczAszkkfk3TNQ+SLrbTwFDNxBGQ/4G/sNnZQmRY6N0EAcl8uYo+Nss7Ov/oonWdHESAt0Fc4nOBQW4iAnCAm+3zvMzksF5ViEBHCrPLwKV3t2oA6F72q+oLOVnsdazg9iErTwT/D5qJpICkb1cNma0++fecAU/FK9L6+fbO7V/xoqiBUriVrK+30iT1fseCfarVnWPIShutcpFSfyQdn7gQGIvO872UGR7VO/99501iu1T09GcS1GVd11akQaTk8fImJ9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rKcbyU1x2+pDecp4JXNBP5OuFczh/0eOuyh5Qc8Uu7c=;
 b=gJXrpBRhL5KD+pG6HjxiYhQhsJVfgc83HXbiyDy48SpeOUrWwzwpSS+it85/hjRvxmlouGvH79X4JqVfnL8wdwVW9o3uQecIrU7GvGjEfE+KWa2EhpubgoaMDDFdCU60yfDcVeneDDNRp9JP1qAcUAZFw21/GgA3KQV71VMuC3KRPlyStQakMHS3auiJ8JpS0Ve/iXTa3KXXnMkovRlbY2YhuLXLNM4APNfefIun1kXIBisRbUaq1Gy/4oKB/klya0AMzc1t6CKJs+L4eQaMb/t78Aa6LtXiUS/54dRqKUV80GJ6CZaIvjp86ab1mRmi3RIydQesRygMnUSTqrao3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rKcbyU1x2+pDecp4JXNBP5OuFczh/0eOuyh5Qc8Uu7c=;
 b=2WDQ4NlzR9YmkiEeBTA/SIMlv/5qo4rAVjsYSIPbJ6OIM6Qp+kOKKqzxTitRFd0cncJGhGCEdiJe/q7g7JW6wBQEibCVn65jmwXeUpFlFm5Sg4co5WjWzRWJ3aA4i1ASuYeaHDlYOX5AVHtHsQsbwAdBH5j3tZKzou7VkjSiuYE=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Marc Bonnici
	<Marc.Bonnici@arm.com>, Achin Gupta <Achin.Gupta@arm.com>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>
Subject: Re: [XEN PATCH v7 10/20] xen/arm: ffa: add direct request support
Thread-Topic: [XEN PATCH v7 10/20] xen/arm: ffa: add direct request support
Thread-Index: AQHZRtMbYfucWbm5fkaW7bEI3lX4ea7i8oGAgALYoYCAACRdAA==
Date: Wed, 1 Mar 2023 13:06:13 +0000
Message-ID: <05270146-5270-4ADE-A89A-7231D623833B@arm.com>
References: <cover.1677079671.git.jens.wiklander@linaro.org>
 <3332563e64568b2ffd236b1f428c27aa4cdf9790.1677079672.git.jens.wiklander@linaro.org>
 <F22A4773-94E8-4F24-A5C8-BF4E075A7698@arm.com>
 <CAHUa44FrC_S1Ot8-2s3=q5f7omZ+gsZhYTJUTMA0yVG5BBp6mw@mail.gmail.com>
In-Reply-To:
 <CAHUa44FrC_S1Ot8-2s3=q5f7omZ+gsZhYTJUTMA0yVG5BBp6mw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.400.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|PAXPR08MB6448:EE_|DBAEUR03FT062:EE_|PA4PR08MB6142:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b7032b2-d213-4387-17e3-08db1a55c3fd
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 5VLPULP7nwL/7Z1+a9HxRBKb3SsDdxPvBL/bWC9bGYUR4hnJgpofr2c/GgHQaNy3TqbovtXmfhw2Cifk2cYr4VR9I92Ife4mZZocOpdsN6YOeWX/0GDAHVLcAVvK2/rDKlCd6bssMpT9iBKpc6DbSyus45Ne1v/fOdTTGK/p7utd3tjsZ92mvG+nTDafhOBIMmyMD7VKhGaSkee/EXFV0rbTfOy1pPwAWKpMt8RY/mt+1Dhp9IB2etbzzrW2DmQZi7a0Pl3+0FICO+JgiEKZUlUwLun6l7SZPptxfFiFmmDMl4UzVJVLS0dx7aiwjfLQ7gVQtWxL//NkPq7mWgef04B9YKM07U2+8hLTWMhTFhApFgGTNx9OlW4wZLSe+FD/XzDWxgUhpXGEVH0mnMG8JymVUgwEUTPr4GQ/2gBYM4viDcnp8UDxgma7H4XQujdrl6ITN9Yk3eu91dAG5xq9hCDrdY9bFHn62jIs8rnDXgXSZ/1o/yy5SPXLbq3herSJfLaxi6mRHcTQEbwsCkCN8D7wUtcHtJK6ZiBVGYAvPxzXbmrIWQFpBjIv4De4YslV9DGGLzqLMRmKZFlxzA8AYaRyugPLZKBYVsyWeoUD0wiTh/KVmj77+nI3W3ICHAu/dPY/8VmNq/GmkuzK/mTBf8XwUcDxlkJaMwjC3Dqv/lV+RbLZQk3T3bDjHSzezYUH8aktQ05FEWHL7e6uutntBrT4U2CIn+6dRBjKZlIabzQ=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(136003)(346002)(39860400002)(396003)(366004)(451199018)(66899018)(36756003)(86362001)(33656002)(8676002)(66556008)(64756008)(5660300002)(8936002)(41300700001)(4326008)(6916009)(66446008)(66476007)(2906002)(66946007)(122000001)(6486002)(38070700005)(38100700002)(478600001)(316002)(54906003)(91956017)(76116006)(71200400001)(186003)(83380400001)(2616005)(53546011)(6506007)(6512007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <229ADDCA48CE8448A4AD46ACF0957EBF@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6448
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	fed83546-e852-492a-b486-08db1a55bc07
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LYkzSJfjRLzf3ihkI/ehnqT79ATbmGJGBSiEpju9vL7Efm69IN7MhBDMsZXqIvdDCpaiwa1zntmmGGLNWPyzveV0OeVEy2FuV+RwrwXI1RuIVUobJ8pX8x8hB1vj+dg041P63I1k0CeGYOxi5OlgaHiLhw4w+wsdcEabpoVO9i+2DlFisJkoIRZyaJO0CSCHEyC6KyxGgAbjS1yx3Ej31pON8SUttD5iEBR/E+NE6Hg6MayQvCv1V0JvuNjppAxHNBNPKRBoPbxmTLTBLvacu9XNDO1zxZz6YvpCU9Ld22fZJu5di/LVTfGGIaZMGiReYTE59i5iguHGcQH44xZmPwZyPmFL4SnQUL/D49b7dnt8LnyngbhOKlwYMAtXR5Y8FvE3DFsnx3kQiHL1zrYemeZq0HQ2HHj9BGen2eJbrwxVGRknp6Pyzg3BoC8rbGk2S0LH54ubZVdDUeM4CLPM4HW7lasq+jMep4wnDb4ztuIFG8jLBjUAeY1lOz96yQhU65BUMTkB7t3tY+Q9XYDvs6Z89o+B5AQ7eKOe/+CmnM4ho27fV5H1B7dvPL3i7QNPO1Eyzw+mqWBQ9QDML9b3SWL80StsgwgUKXovvlKG7n2cJj7HtUyKBD9LWgLfdNz/UVrFe7z/T0x+NLkLSkiz+/FhCFpE4gnm2IBF4xiYYaHTm7O98oeagu+scy5teLZEeoJzIFTJ5loe4z0XjOq6dA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(346002)(376002)(136003)(39860400002)(396003)(451199018)(40470700004)(36840700001)(46966006)(6512007)(186003)(26005)(53546011)(47076005)(66899018)(6506007)(336012)(2616005)(2906002)(478600001)(82310400005)(83380400001)(54906003)(36860700001)(70586007)(82740400003)(81166007)(41300700001)(4326008)(356005)(36756003)(8676002)(70206006)(40480700001)(86362001)(316002)(8936002)(6486002)(33656002)(40460700003)(6862004)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2023 13:06:26.5743
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b7032b2-d213-4387-17e3-08db1a55c3fd
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6142

HI Jens,

> On 1 Mar 2023, at 11:55, Jens Wiklander <jens.wiklander@linaro.org> wrote=
:
>=20
> Hi Bertrand,
>=20
> On Mon, Feb 27, 2023 at 4:28 PM Bertrand Marquis
> <Bertrand.Marquis@arm.com> wrote:
>>=20
>> Hi Jens,
>>=20
>>> On 22 Feb 2023, at 16:33, Jens Wiklander <jens.wiklander@linaro.org> wr=
ote:
>>>=20
>>> Adds support for sending a FF-A direct request. Checks that the SP also
>>> supports handling a 32-bit direct request. 64-bit direct requests are
>>> not used by the mediator itself so there is not need to check for that.
>>>=20
>>> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
>>> ---
>>> xen/arch/arm/tee/ffa.c | 119 +++++++++++++++++++++++++++++++++++++++++
>>> 1 file changed, 119 insertions(+)
>>>=20
>>> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
>>> index 463fd7730573..a5d8a12635b6 100644
>>> --- a/xen/arch/arm/tee/ffa.c
>>> +++ b/xen/arch/arm/tee/ffa.c
>>> @@ -142,6 +142,7 @@
>>>=20
>>> struct ffa_ctx {
>>>    uint32_t guest_vers;
>>> +    bool interrupted;
>>=20
>> This is added and set here for one special error code but is never used.
>> I would suggest to introduce this when there will be an action based on =
it.
>=20
> I'm sorry, I forgot about completing this. I'll add code to deal with
> FFA_INTERRUPT. This will be tricky to test though since we don't use
> FFA_INTERRUPT like this with OP-TEE. The Hypervisor is required by the
> FF-A standard to support it so I better add something.

You can do that in a different patch then and just remove this from this pa=
tch ?

>=20
>>=20
>>> };
>>>=20
>>> /* Negotiated FF-A version to use with the SPMC */
>>> @@ -167,6 +168,55 @@ static bool ffa_get_version(uint32_t *vers)
>>>    return true;
>>> }
>>>=20
>>> +static int32_t get_ffa_ret_code(const struct arm_smccc_1_2_regs *resp)
>>> +{
>>> +    switch ( resp->a0 )
>>> +    {
>>> +    case FFA_ERROR:
>>> +        if ( resp->a2 )
>>> +            return resp->a2;
>>> +        else
>>> +            return FFA_RET_NOT_SUPPORTED;
>>> +    case FFA_SUCCESS_32:
>>> +    case FFA_SUCCESS_64:
>>> +        return FFA_RET_OK;
>>> +    default:
>>> +        return FFA_RET_NOT_SUPPORTED;
>>> +    }
>>> +}
>>> +
>>> +static int32_t ffa_simple_call(uint32_t fid, register_t a1, register_t=
 a2,
>>> +                               register_t a3, register_t a4)
>>> +{
>>> +    const struct arm_smccc_1_2_regs arg =3D {
>>> +        .a0 =3D fid,
>>> +        .a1 =3D a1,
>>> +        .a2 =3D a2,
>>> +        .a3 =3D a3,
>>> +        .a4 =3D a4,
>>> +    };
>>> +    struct arm_smccc_1_2_regs resp;
>>> +
>>> +    arm_smccc_1_2_smc(&arg, &resp);
>>> +
>>> +    return get_ffa_ret_code(&resp);
>>> +}
>>> +
>>> +static int32_t ffa_features(uint32_t id)
>>> +{
>>> +    return ffa_simple_call(FFA_FEATURES, id, 0, 0, 0);
>>> +}
>>> +
>>> +static bool check_mandatory_feature(uint32_t id)
>>> +{
>>> +    uint32_t ret =3D ffa_features(id);
>>> +
>>> +    if (ret)
>>> +        printk(XENLOG_ERR "ffa: mandatory feature id %#x missing\n", i=
d);
>>=20
>> It might be useful here to actually print the error code.
>> Are we sure that all errors actually mean not supported ?
>=20
> Yes, that's what the standard says.

The error code might still be useful in the print.

>=20
>>=20
>>> +
>>> +    return !ret;
>>> +}
>>> +
>>> static uint16_t get_vm_id(const struct domain *d)
>>> {
>>>    /* +1 since 0 is reserved for the hypervisor in FF-A */
>>> @@ -208,6 +258,66 @@ static void handle_version(struct cpu_user_regs *r=
egs)
>>>    set_regs(regs, vers, 0, 0, 0, 0, 0, 0, 0);
>>> }
>>>=20
>>> +static void handle_msg_send_direct_req(struct cpu_user_regs *regs, uin=
t32_t fid)
>>> +{
>>> +    struct arm_smccc_1_2_regs arg =3D { .a0 =3D fid, };
>>> +    struct arm_smccc_1_2_regs resp =3D { };
>>> +    struct domain *d =3D current->domain;
>>> +    struct ffa_ctx *ctx =3D d->arch.tee;
>>> +    uint32_t src_dst;
>>> +    uint64_t mask;
>>> +
>>> +    if ( smccc_is_conv_64(fid) )
>>> +        mask =3D GENMASK_ULL(63, 0);
>>> +    else
>>> +        mask =3D GENMASK_ULL(31, 0);
>>> +
>>> +    src_dst =3D get_user_reg(regs, 1);
>>> +    if ( (src_dst >> 16) !=3D get_vm_id(d) )
>>> +    {
>>> +        resp.a0 =3D FFA_ERROR;
>>> +        resp.a2 =3D FFA_RET_INVALID_PARAMETERS;
>>> +        goto out;
>>> +    }
>>> +
>>> +    arg.a1 =3D src_dst;
>>> +    arg.a2 =3D get_user_reg(regs, 2) & mask;
>>> +    arg.a3 =3D get_user_reg(regs, 3) & mask;
>>> +    arg.a4 =3D get_user_reg(regs, 4) & mask;
>>> +    arg.a5 =3D get_user_reg(regs, 5) & mask;
>>> +    arg.a6 =3D get_user_reg(regs, 6) & mask;
>>> +    arg.a7 =3D get_user_reg(regs, 7) & mask;
>>> +
>>> +    while ( true )
>>> +    {
>>> +        arm_smccc_1_2_smc(&arg, &resp);
>>> +
>>> +        switch ( resp.a0 )
>>> +        {
>>> +        case FFA_INTERRUPT:
>>> +            ctx->interrupted =3D true;
>>> +            goto out;
>>> +        case FFA_ERROR:
>>> +        case FFA_SUCCESS_32:
>>> +        case FFA_SUCCESS_64:
>>> +        case FFA_MSG_SEND_DIRECT_RESP_32:
>>> +        case FFA_MSG_SEND_DIRECT_RESP_64:
>>> +            goto out;
>>> +        default:
>>> +            /* Bad fid, report back. */
>>> +            memset(&arg, 0, sizeof(arg));
>>> +            arg.a0 =3D FFA_ERROR;
>>> +            arg.a1 =3D src_dst;
>>> +            arg.a2 =3D FFA_RET_NOT_SUPPORTED;
>>> +            continue;
>>=20
>> There is a potential infinite loop here and i do not understand
>> why this needs to be done.
>> Here if something is returning a value that you do not understand
>> you send back an ERROR to it. I do not find in the spec where this
>> is supposed to be done.
>> Can you explain a bit here ?
>=20
> This should normally not happen, but the SP/SPMC is responding with a
> request that we don't know what to do with. The standard doesn't say
> how to handle that as far as I understand. However, returning back to
> the VM at this point with an error may leave the SP/SPMC in a strange
> state. So I think it's better to report back to the SP/SPMC that the
> request isn't understood and hopefully it can at least return back
> with an error in a sane state.
>=20
> I'll add something to the comment.

Please also make sure that the code is not looping infinitely on this.

>=20
>>=20
>>> +        }
>>> +    }
>>> +
>>> +out:
>>> +    set_regs(regs, resp.a0, resp.a1 & mask, resp.a2 & mask, resp.a3 & =
mask,
>>> +             resp.a4 & mask, resp.a5 & mask, resp.a6 & mask, resp.a7 &=
 mask);
>>> +}
>>> +
>>> static bool ffa_handle_call(struct cpu_user_regs *regs)
>>> {
>>>    uint32_t fid =3D get_user_reg(regs, 0);
>>> @@ -225,6 +335,12 @@ static bool ffa_handle_call(struct cpu_user_regs *=
regs)
>>>    case FFA_ID_GET:
>>>        set_regs_success(regs, get_vm_id(d), 0);
>>>        return true;
>>> +    case FFA_MSG_SEND_DIRECT_REQ_32:
>>> +#ifdef CONFIG_ARM_64
>>> +    case FFA_MSG_SEND_DIRECT_REQ_64:
>>> +#endif
>>> +        handle_msg_send_direct_req(regs, fid);
>>> +        return true;
>>>=20
>>>    default:
>>>        gprintk(XENLOG_ERR, "ffa: unhandled fid 0x%x\n", fid);
>>> @@ -310,6 +426,9 @@ static bool ffa_probe(void)
>>>    printk(XENLOG_INFO "ARM FF-A Firmware version %u.%u\n",
>>>           major_vers, minor_vers);
>>>=20
>>> +    if ( !check_mandatory_feature(FFA_MSG_SEND_DIRECT_REQ_32) )
>>> +        return false;
>>=20
>> One could not need this feature and here this will make everything unava=
ilable instead.
>> Why not just reporting back the unsupported error to clients using unsup=
ported interfaces ?
>=20
> One could perhaps argue that this check should be moved to a later
> patch in this series. Perhaps there's some future configuration that
> might make sense without this feature, but for now, it doesn't make
> sense to initialize without it.

I am starting to wonder if we should not at boot scan for available feature=
s, save them
somewhere and then accept/reject calls depending on the supported features.

Maybe just add a TODO here so that we remember that this is something that =
could be
checked/modified one day. That would also give an insight if someone has su=
ch a usecase
one day.

Cheers
Bertrand

>=20
> Thanks,
> Jens
>=20
>>=20
>> Cheers
>> Bertrand
>>=20
>>> +
>>>    ffa_version =3D vers;
>>>=20
>>>    return true;
>>> --
>>> 2.34.1



