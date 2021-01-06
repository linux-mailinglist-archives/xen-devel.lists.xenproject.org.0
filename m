Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A3702EC6D3
	for <lists+xen-devel@lfdr.de>; Thu,  7 Jan 2021 00:23:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.62728.111211 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxI8M-0002wz-EY; Wed, 06 Jan 2021 23:22:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 62728.111211; Wed, 06 Jan 2021 23:22:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxI8M-0002wZ-BF; Wed, 06 Jan 2021 23:22:30 +0000
Received: by outflank-mailman (input) for mailman id 62728;
 Wed, 06 Jan 2021 23:22:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ymaU=GJ=epam.com=prvs=1640561998=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1kxI8K-0002wU-9z
 for xen-devel@lists.xenproject.org; Wed, 06 Jan 2021 23:22:28 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 418cbaae-e57d-4b13-876f-bc0cadf70d8a;
 Wed, 06 Jan 2021 23:22:27 +0000 (UTC)
Received: from pps.filterd (m0174682.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 106NKuQ5015576; Wed, 6 Jan 2021 23:22:25 GMT
Received: from eur03-am5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2057.outbound.protection.outlook.com [104.47.8.57])
 by mx0b-0039f301.pphosted.com with ESMTP id 35vh9kvx5r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 Jan 2021 23:22:25 +0000
Received: from AM0PR03MB3508.eurprd03.prod.outlook.com (2603:10a6:208:4f::23)
 by AM0PR03MB4836.eurprd03.prod.outlook.com (2603:10a6:208:102::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.20; Wed, 6 Jan
 2021 23:22:17 +0000
Received: from AM0PR03MB3508.eurprd03.prod.outlook.com
 ([fe80::2dc5:6ffb:56c8:f539]) by AM0PR03MB3508.eurprd03.prod.outlook.com
 ([fe80::2dc5:6ffb:56c8:f539%6]) with mapi id 15.20.3742.006; Wed, 6 Jan 2021
 23:22:17 +0000
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
X-Inumbo-ID: 418cbaae-e57d-4b13-876f-bc0cadf70d8a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cd4BTj2ykeXeQtqjUYHH0xC6DhN4nvL+JAIH5FcPfiTWlWJPRtmCzYvaliFRJcNrONF2WMDZdhH5ynNLMJETs0r6IkrfbmIOTZ1/ZiYkOFqe9+vqT8wpKMlihqAbeP1YSu24irN5KdR9zYOERG0gYvCxTI1ALsSnkFWdtHP+/8priF628VoKKbjikiPIiIBpr4Pk5dOWwMyB0s7t9gMI2EaToa6izAtG4Kms7X1ncyMN8Dt0lP6bxJR40LqhQ8CE9/VkhmnbRouqktpYMuqQKGqHr+AwrTsfTsL9lvSMxqBXqGaxeidlbe9y4NqhyIlizowhFs9PFKXrJxgm14zC6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fL2ohcFdgPSgn2pwufUN3MhTkdpWj+aMh8mtGZX6ubk=;
 b=OWsoTvyUr9lSwd6tfaRgJMulBg797YI1KNP+ZzCjIIM7gLWEhfQHmN14lo9ch6lWxrOxap9mzZ7lV1PIEl2Qh6lRAS3hAdyL9V8iGc9aPP2JIrG2daMuZIR+jqlbdp9E0mMUydwS2buqi30wsp0kZyRROh/FmWH5iLhgoYeBl//dsYODS0DG84PDNnzQVikA/gcQBXgDpaP9gCxMnsImzX00oaOsMeKeE0FUDnNVKhVS19kNEt5yK0qyw2ZSHTVDBnAxJU9/wt+HT2ic8cncUt/PUMx8S7yo7PQv2HguspCdF5BlH9nKqWsNApq7A40ByFd1HH79Ve8rBsE9ZeuYlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fL2ohcFdgPSgn2pwufUN3MhTkdpWj+aMh8mtGZX6ubk=;
 b=B3KjzhHcLH7Y+zyazaPnfV5tF2YPU41/o9L/c86PDSEjJWY3didNbIPrsf44NX7X4t5ajbZfi0QsxbSXDZ0h2x6txLAwvr1jt3yx60UIcDOAPb/rKqHa+F0N2Ikdtoeea+6HkVrnxVMutKYyt5pjZDrIOqRs9smNuZi+c4bwbnvUUL57bT+sSRSCnUWAqWdjzKrS4jPH8PfpHDEf7bc4p5alDg1ibZMzHe8341hkoBHaGgyqyoPdKGzWtn/mpMX4BOilgrmUSCqEFsDN/1EXMbojgydeUu3v8aPn7ZhFVnZIBK5/1Ur6rEBy4yj53tCBKq5o1vOoZvXx3TwioreicA==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Julien Grall <julien@xen.org>
CC: Roman Skakun <Roman_Skakun@epam.com>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>,
        Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v1] arm/optee: Use only least 32 bits for SMC type arg
 according to SMCCC
Thread-Topic: [PATCH v1] arm/optee: Use only least 32 bits for SMC type arg
 according to SMCCC
Thread-Index: AQHW5FYo0uebW+fa3kaV4/YUoyuEvKobPNyA
Date: Wed, 6 Jan 2021 23:22:16 +0000
Message-ID: <87turt4pnc.fsf@epam.com>
References: 
 <123c27ed53ab50ca6f605a96002dcc7e1b7d3e6e.1609931750.git.rm.skakun@gmail.com>
 <48f8e967-2454-7d4b-8e86-0b1baddef52e@xen.org>
In-Reply-To: <48f8e967-2454-7d4b-8e86-0b1baddef52e@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.4.10; emacs 27.1
authentication-results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=epam.com;
x-originating-ip: [176.36.48.175]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bd1677ea-8b7b-4864-5430-08d8b299e889
x-ms-traffictypediagnostic: AM0PR03MB4836:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: 
 <AM0PR03MB483631B4CD8DE055D19BA1F6E6D00@AM0PR03MB4836.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 xGZiXLQCenNvmqwGoy7F/lXXdMJwhx/thTBsXM/lfHZ01M9jz2kOCp7sosIyOBdu1SQnS51EPU/4YFFqNg038j0VzaOwlw/K8WKuzfASFmkHJxUVIszfHWPjdguxnNIZMXjmEN96aBoSFUzRjl0leuzozQiXZeCzIYrffN2NSaFLkUBRY6oNExVb5A8wzhMyJOIkYQ3C9Y7hxBEsHUdPOzfed7Yr0ytbIqrqEddi3KHhGcsZ/dXA4BKeHEP0CyoJg1ut82fztmLyADS8ZyEqkBKzhWLxfqxxUCnCdAnkg2nkb5Qgtvr5m37GFU61ATD0Hc0BcgV9J0bBXJLtN7zWhL+0GsphzzxFmi8HADbPswM/QMr8745BRbGniLFNMUtRzihxOmgFaHNzwMU4tOwAww==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB3508.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39860400002)(136003)(396003)(376002)(346002)(8936002)(55236004)(6916009)(8676002)(4326008)(6512007)(186003)(53546011)(83380400001)(2616005)(36756003)(71200400001)(6506007)(2906002)(26005)(316002)(66446008)(66946007)(66556008)(76116006)(86362001)(66476007)(5660300002)(64756008)(6486002)(478600001)(54906003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?iso-8859-1?Q?lwiiZ00bGX/1almcbyP5qXGEsFTEoeHlBUU/7pUUMACepiZYujZFfX/c41?=
 =?iso-8859-1?Q?G2FeNJMabo/gmDMD3IXJUuplYcQn07qrXgDqu6F7QMugIHRTgCZcIIBSeO?=
 =?iso-8859-1?Q?8d9TYMAryRvOUEpkCcFFHOiVC0oY0TQgo0fgpg6zTau3i0YkSZFeA4KoTk?=
 =?iso-8859-1?Q?uRy/rk1h94lbMbVVyKsoDr5+yXHnGvuQyXxr7LJ8ZmhUjOjOnaZczuRH5D?=
 =?iso-8859-1?Q?XsdYh8cO7jUp9ZAutcbP0qO4a+qeL0d09sV1eD0b1ZzmDRfvJiiINWQY0g?=
 =?iso-8859-1?Q?JevemOwIjxCYRDJ1CHHzZ4G0pewVmD11FuWIFz10V9uziOpMOqEqE6zxlP?=
 =?iso-8859-1?Q?Cnin289k/KnbykByuKk3JEgqEeCQWYFQn3KQ9WsdF+P6zKkbYVA6RoLEFx?=
 =?iso-8859-1?Q?BPHKVqniZhRgPHRjPghPQfoIincsjI1y/Z/y8CCT4q5LbjwnFsjzbVFwpp?=
 =?iso-8859-1?Q?Wc61P/p/bxy00Z7jhhUlT+hHMCD337Nmy4etwK3IccrVoUtkTHaiR7hJWz?=
 =?iso-8859-1?Q?LQLLuch848e2glkj/6//yYrp9LZxYK7ahyAEAA5gQkI59RxmNUyyrHO6HH?=
 =?iso-8859-1?Q?BZCQ6EbA0u8fB4ucyN8GPA7geVRBpHC/TU0K1xfCXclcxGKJRXOIQkRO9u?=
 =?iso-8859-1?Q?Scka3sx+TC1PqHAPvxGkcaHqBupv0wm9Rx0lAa3OLcmHKFchSPeVBqDxeD?=
 =?iso-8859-1?Q?beO3tpU0S7DQxlWlupwvt4lvRgLFX6fhI/SXHYZ8zjgFxgra7Fb+aDqsko?=
 =?iso-8859-1?Q?YS4CFfEXZhtxh0DkC8EvY0zs/6H8Rpiz9r9UbfmrKXCAW5HUUDYpQuV3lb?=
 =?iso-8859-1?Q?XKYA0nXfDGxWadW0Hc27yjBlKml53pmj7P25MQCLFD3twjC0ppxarNKKXJ?=
 =?iso-8859-1?Q?/32p+MuQpF/QOfTyigua+kf6HupJ7Um6WFxZKmBWeqsSLGtdBJr+wHt0b/?=
 =?iso-8859-1?Q?nUBUe5jETjIKtipAX+m2wohHQ/3OC27uV/aVkKu5ThR/aYYsxRHawokVU0?=
 =?iso-8859-1?Q?g0cWRkXAUIsRMlS6/5nbkGxOyv00WTKWrbtEuj?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB3508.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd1677ea-8b7b-4864-5430-08d8b299e889
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2021 23:22:17.3040
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4acmjLuzlvTwf6MYdt1co2qeQ8R6fyWONp+cf2XW8Z6b1QQ42G8G9r9I6+3TAfHx8YZYaAHms4/uULo5nwe70rb40jFSKHp6t4pvmdticSM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB4836
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 spamscore=0 phishscore=0 mlxlogscore=988 mlxscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101060133


Hi Julien,

Julien Grall writes:

> Hi Roman,
>
> On 06/01/2021 11:26, Roman Skakun wrote:
>> This patch added additional sanity and increases an understanding for
>> getting proper value from the first argument for SMC call on aarch64
>> according to SMCC Convention.
>
> I would suggest the following commit message:
>
> "xen/arm: optee: The function identifier is always 32-bit
>
> Per the SMCCC specification (see section 3.1 in ARM DEN 0028D), the
> function identifier is only stored in the least significant
> 32-bits. The most significant 32-bits should be ignored.
>
> The function optee_handle_call() is now updated to ignore the most
> significant 32-bits.
>
> "
>
> Note that I used the version D rather than B because the latter has
> buggy wording (it seems to suggest that the least significants bits=20
> should be ignored).
>
> Furthermore, I checked vsmc.c (the layer that dispatch the SMC) and it
> was already handled properly thanks to commit 7f4217cc6057 "xen/arm:=20
> vsmc: The function identifier is always 32-bit".
>
>> [0] ARM DEN0028B, page 12
>> Signed-off-by: Roman Skakun <roman_skakun@epam.com>
>> ---
>>   xen/arch/arm/tee/optee.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>> diff --git a/xen/arch/arm/tee/optee.c b/xen/arch/arm/tee/optee.c
>> index ee85359742..87060b52b8 100644
>> --- a/xen/arch/arm/tee/optee.c
>> +++ b/xen/arch/arm/tee/optee.c
>> @@ -1643,7 +1643,8 @@ static bool optee_handle_call(struct cpu_user_regs=
 *regs)
>>       if ( !ctx )
>>           return false;
>>   -    switch ( get_user_reg(regs, 0) )
>> +    /* Only least 32 bits are significant (see ARM DEN 0028B, page 12) =
*/
>
> I would suggest:
>
> /* The function identifier is always stored in the least significant
> 32-bit (see section ARM DEN 0028D) */
>
> I can update it while committing, if both Volodymyr and you are happy
> with changes.

I'm totally fine with the proposed changes. Thank you for tidying this up.

--=20
Volodymyr Babchuk at EPAM=

