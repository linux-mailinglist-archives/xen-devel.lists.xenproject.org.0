Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 879099DED28
	for <lists+xen-devel@lfdr.de>; Fri, 29 Nov 2024 23:13:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.846068.1261331 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tH9E6-0001JJ-Sy; Fri, 29 Nov 2024 22:12:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 846068.1261331; Fri, 29 Nov 2024 22:12:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tH9E6-0001Hp-PZ; Fri, 29 Nov 2024 22:12:38 +0000
Received: by outflank-mailman (input) for mailman id 846068;
 Fri, 29 Nov 2024 22:12:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3Fhq=SY=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1tH9E5-0001He-B0
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2024 22:12:37 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2062f.outbound.protection.outlook.com
 [2a01:111:f403:2612::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 082e471a-ae9f-11ef-99a3-01e77a169b0f;
 Fri, 29 Nov 2024 23:12:34 +0100 (CET)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by VI0PR03MB10831.eurprd03.prod.outlook.com
 (2603:10a6:800:263::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.20; Fri, 29 Nov
 2024 22:12:31 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%7]) with mapi id 15.20.8182.018; Fri, 29 Nov 2024
 22:12:30 +0000
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
X-Inumbo-ID: 082e471a-ae9f-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjYxMjo6NjJmIiwiaGVsbyI6IkVVUjA1LUFNNi1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjA4MmU0NzFhLWFlOWYtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyOTE4MzU0LjEyMDkyLCJzZW5kZXIiOiJ2b2xvZHlteXJfYmFiY2h1a0BlcGFtLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n9P2qEdI8waFsh57ETUH0CTkZ6cv9NacmsjcJm3QItRgpLxXipR/2IUjvDhy5ByBj9xbH4FlQQypeFwT6o+/n9UzWp2s/IK3nkCMve5eerOyUgtnAS6t4Q7+2tSng4uT7wUTjMY/n0mYDFQ++qmOVGk1a9d6p7S1TKK/NdAW23S8Pqq1QpzBGHAApS2t/hCtOFdE5qE6h+jMVxjfXzY+m37xIJ1c4JBSv08dSsBZMvVCVe6yZDPpCLqWTOihJnLt3eHTtGl6Ty/7eyt/pV2Aj0sMTxVWayIaWX7DXYQP6y3ue5v69qE2QsrgTPtAIL3aJWlHvOSBe3rjns0S/dt1CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zDI37MTGwsTOjaf0fbNTmdswCc6H9iBRmrI5tKAopRc=;
 b=J7t9wje1yHh2aeZa5DxWYkOwcDw6l1Bjk7XS7lZOg23vW0FdyTtXF5S0PdFraO8BI8g8wIwtrdTn/yidikZUjBzBdUaM3Pzo/j2DgCcTXC//udjO3npTcOYpMUao1OyG9vsgOEZr1InAGx1WR1nSUQZ64K5WlaKPnwxIvP4Tf2e8OU0/eN+EvLEUgXwd0Buhe52brQwFSaUgnt8Jt52K+klNgLeW2wWwBCX9dQESlwjOjRZnRAuwH4cEqSm3OXPzezFMctECUMRWPacQIhKTfy6JvoIsNbYdm6HV08oTKudVgTTsvSMNJTXaqOVmPYHaz6GZUdKeq/1+3xIVArL/dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zDI37MTGwsTOjaf0fbNTmdswCc6H9iBRmrI5tKAopRc=;
 b=bP0WFfVrCKGNHHOPEtmM0WxSMGQd7zY123xqrs1bw5dIcRbh7e6eEj5izfgLi/z1CvUeDlMES/EjqB69EzFZ+mSr+jaXWNzrXIbVVAYJhWbI3r1Bkq8ZYcXjU34OQgryV5FMegTFBK0A6bXa16YpEvBn9NUQPc2knk7+80c5IWJ+HY51vxPYL81inKNpq9fKArNm4d74VLzTKSXeqwlhBQDNzujbbAXUYmVGXdpie14d35OWiMIfKhRnnQPgJby1o27m2CW6GxqBoLpIc/59AtaTEXAjSzUdiNFhCWlkymG9DYQuFSn1jDLlf0k2W/xSX5kOkQWcTYA8CsfgCFhYUQ==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: [PATCH 3/5] build: arm64: provide -target and -march if using
 clang
Thread-Topic: [PATCH 3/5] build: arm64: provide -target and -march if using
 clang
Thread-Index: AQHbQgDiBM9r6Gu0CEmbvf51boI0mQ==
Date: Fri, 29 Nov 2024 22:12:30 +0000
Message-ID: <87iks5bsgd.fsf@epam.com>
References: <20241129014850.2852844-1-volodymyr_babchuk@epam.com>
	<20241129014850.2852844-4-volodymyr_babchuk@epam.com>
	<d8bdd084-3e0a-40aa-b829-534219b24df7@suse.com>
In-Reply-To: <d8bdd084-3e0a-40aa-b829-534219b24df7@suse.com> (Jan Beulich's
	message of "Fri, 29 Nov 2024 09:04:23 +0100")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|VI0PR03MB10831:EE_
x-ms-office365-filtering-correlation-id: 4d642a54-cf9a-43b4-7a1a-08dd10c2ead5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?Ljgyo9Xw0AclLYOjebp9EzJvH0KsNzuu+8TvLaUqaKxfPg5rln3mZRJHz2?=
 =?iso-8859-1?Q?ZSXSi7H7AiFIpPx0SNKSillHetOH0Vu+JMnrZOOUd7MDyHFC+YjFn8fiRI?=
 =?iso-8859-1?Q?1QWENZc6FFByxo+367g61nQLQO/iuSVxpKngiZ+Cl7P3RCgVv9RrtBT9S7?=
 =?iso-8859-1?Q?WiCwhFZdJhn3agkmuKeSGmw7X8alRrKIKs7n6ih1Q2apTq4NMIO75dyoPL?=
 =?iso-8859-1?Q?cC2s2XhtjovgfzK3ESibGL5wUvKY0U18Zo9jeYCRgwx6Cb1EgKxUMQb7iy?=
 =?iso-8859-1?Q?2rxGv1eYmgdi7gV169STJLjbv9XshLa5DN4gQd11yXhs0WxEdXUQQrRIyZ?=
 =?iso-8859-1?Q?pbqT0M7qU9mwkD31z5+IEEkgvCeRvxw2+baK0pl+unF3U4vMcyIOCiz1VE?=
 =?iso-8859-1?Q?tzunB2kh29kr/fk52Jpc0+VDbqcnHrg0X6ciLc+mEDxScbMDuMJvvnXKcp?=
 =?iso-8859-1?Q?MfqTFUL9HdOTBao3s5Y2s+DSdHvDEs2/XF890HrXoPcEweR2ZrbtEu0yqi?=
 =?iso-8859-1?Q?MgkFnKnOWVQZeC7QPgj3SK2OpfU3eu+J2iuh38f6dih/pEnb9EuYseC3Tt?=
 =?iso-8859-1?Q?G7viB71dbhVobm2wBrh/NmlpryBQPSVgodhWVXjT7rsB6oGYuVfRyvdOqM?=
 =?iso-8859-1?Q?4P7Yov809Z4AUmgicM05TCJKVbB3MdyQwemhcWv8wav0bnhG7JIFdwHD29?=
 =?iso-8859-1?Q?PrT+tAZuG8EzbSzdE7nrhPyFna0Rt2sGdnXqx7jsbCJUFuj6WbE9u3YXPH?=
 =?iso-8859-1?Q?vPcMKE9EUZQwpHWj8LZiNO7d8ra5Llrr7mJT4WTfEW4r5cIbTOrnwwNzjk?=
 =?iso-8859-1?Q?np1aNvOfRnC9YM6uLwsde87eeqW9bW8Sio3NYePRazEnZLFKkJ3hIB4etZ?=
 =?iso-8859-1?Q?hseXswlPnF0zeA9phMhg1sGRtSY7fCYy7Qm6if9rHuBssnWASw7NarzEdK?=
 =?iso-8859-1?Q?YiJBj/PiCb1De0d95HdEMZf3qmFxy8QNKuWZZ0OHN4QKFvcmFxkvlQVQl7?=
 =?iso-8859-1?Q?iiC13YMYpKeg0Xgu9ght3y8bLHF7jwLLByyNxlzCLCpgdV+/T00X6DpcV+?=
 =?iso-8859-1?Q?BNr4MLjZK6k95au+1QgAHPEWjwHWUCIEn52nofHBESWYTzH1+7t8HGq0Tm?=
 =?iso-8859-1?Q?YASjroj0vNjyJu2oRuAjXMua1cVxbyJApUJO2TaYJxg7mHieNHgnc69TLF?=
 =?iso-8859-1?Q?keBxHz2PRMd4XdttyY+C6MgOMSKfPfMaHVSeD5GMlSL4suMhaRUX9PakrF?=
 =?iso-8859-1?Q?mAzIDDpmVPb6ZZXus12w0z0ztgvZNsy3qIRu+r8rC3eMmnXHsNsy3/NdWS?=
 =?iso-8859-1?Q?ZsiR3og2/j5oZVjs74B7hRPAU8OVojTQ6xHaKwg66i29SDIMK00sYtA7q0?=
 =?iso-8859-1?Q?HYMAFZc8JHSm9PzSJ6w1rTeAI34Qtk9DNBFLaaLzR7QnVTiKgzkyIyv9cP?=
 =?iso-8859-1?Q?s/dC/suRXPGIANx9+uhWObaVCRsMQH4XKZOBag=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?st6vUo8kgMyl/hQJlkIRQp4GTys+Km31ObCoEK/IJ40Q5Wqy1ddZ0C7qS1?=
 =?iso-8859-1?Q?WNvtJ2lH8NNzGkj+gVqL048YoLZoapmTSRxAiIqQL5pTzqedo2E95RlMld?=
 =?iso-8859-1?Q?ti8saP83oHihEpdGUqncGFbvJhjy5TQtjiXO9WXpTvDxs23YpzvBmZKG9r?=
 =?iso-8859-1?Q?GvqDE8b4oyBGrguGBlvQKTfzDlOtdn27GHxiScnqisBhfpsXTfzB5Iqbeg?=
 =?iso-8859-1?Q?BBRh/0pJiJ6cofWICr1qxA008O5aJxsEmMrNxQOIyRYKzwjO17fUIAJFLt?=
 =?iso-8859-1?Q?RusAyRed43T4YGCg8e5Wj0v3e1Att9FT9scTqJeE2mJfJGcY699fEPty29?=
 =?iso-8859-1?Q?6d3dg3d6caQrvVIWIILfsRcD8amtASGfo8BJXsYvxmUKDrbYExaQP6nMdR?=
 =?iso-8859-1?Q?fElH1KWUlCvuZ6H5Uumof1OKsMoGdzeEuGTIR3eyPxaUGTGyDrlokx+k3y?=
 =?iso-8859-1?Q?mXY3xIzNt6h3TU4AyZPAL7tGszJvwbxnTOnTsqCkC8m7dTPFtz3FwoXpxg?=
 =?iso-8859-1?Q?Ksya7VJ6zbR+IL4plui9JXgmJwno/B8AIl+dTTV7lC7aNQlz9DCiFuxmkh?=
 =?iso-8859-1?Q?y++jXtBtC3kHJDyF/euFoO4SEPf/F/RKUwSKYU+Fg1J+62NRvZbRI6UTgL?=
 =?iso-8859-1?Q?F9KBAmfHd4UnAfmnC6XDs5mQVjRwlDgrjOUiuIgosObCYU1siw0Wb5zCu0?=
 =?iso-8859-1?Q?Owajhg2AtQHwZR6f2VXEXmHhZhRF+pdyaIxQ3+tcBmSmgLTF3Q6zgALwkt?=
 =?iso-8859-1?Q?UtzIyuZyKuONDCqWn++Foj7ke/8/aE/SZP56miPyQJrnOWITbV116SZ27b?=
 =?iso-8859-1?Q?UUKHy1uxoOysyLa/IGN1vm/42YbMGJEkU3QiDXW8q8yxWUKoE6A2H7j1sd?=
 =?iso-8859-1?Q?xxSDC9PlNsKn0C/SWqFpugh4/b+pKYPOTOf+/BngmrKYlw7coSOkJpYgJm?=
 =?iso-8859-1?Q?2rSnU5sp54tcEY7tlkjelOsd5EUxndapSaGPp1Vchz614KO4IQ/5yI2vk+?=
 =?iso-8859-1?Q?Mtt35w7QLdGdvQetoTHGb5LPbXMr9DsMYL9XzYKis87ujRHqIjMwkjeHkj?=
 =?iso-8859-1?Q?irTkuERfWbSvyiuxQxYwxuc8WnZ+EFQzW9bLQ1WzDxYKTeMsrLsVYc3nP+?=
 =?iso-8859-1?Q?q4Ju+N4csxHyYoA+miMsqt9jq+zEGvg/dfmLyJamKCfg/qDXpTAL1jXQiy?=
 =?iso-8859-1?Q?YAV67TlhH4fh/VujZBj7x1sRss1eVRNgaGyMyxbdl881VY9jXurOQLYCsI?=
 =?iso-8859-1?Q?oidBF7EkgB9Qaye/nYZsMwHRc3J4FVLaydIsg12hmzaNUWfYSNHx5W4enO?=
 =?iso-8859-1?Q?A8+ON9b/yCSDmYCMs35/5J+DlAGr2Q5aIBPjDupEINZYTNHzt7Kw0Dqo4X?=
 =?iso-8859-1?Q?njVV7SpAK0p+pU3RZpJ483Y2RBNjXJtznJy0rfb7rjZCpJEx5CewtIZqps?=
 =?iso-8859-1?Q?uenJbnpxOLWNG+MbK7vFxoIKCjszCFQcJVLRtbBNBGUZfLy/RmIr8b5caj?=
 =?iso-8859-1?Q?Xs6ZPygK1YpFasfUFKeu55w2ltTCG482MYY9/uAip2QlSQvnBGVWfgBFIb?=
 =?iso-8859-1?Q?hzu6Hbxu1u3VZudfCoMAdFrPacX+TaoHGCtXcjqBRufrNxugaukwmF7PiI?=
 =?iso-8859-1?Q?rgBZuWHoVHSYTHNkC8evHSL24uSg+2bHEEESs30sDHKKt0+uGjG+IXcw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d642a54-cf9a-43b4-7a1a-08dd10c2ead5
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Nov 2024 22:12:30.5997
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: d/gpvuwVwzrAI4FLKZwTwtNXu2dcJj9T/1rOxAXjpG8TR5yMTHM5rb1etO+eS8iGXc0WLZtU+8ykD1vykmwvzLYpH5IX5Svutu2K2SbA+8s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR03MB10831


Hi Jan,

Jan Beulich <jbeulich@suse.com> writes:

> On 29.11.2024 02:49, Volodymyr Babchuk wrote:
>> Provide -target and -march explicitly when building with clang. This
>> makes cross-compilation much easier, because clang accept this
>> parameters regardless of host platform. Basically,
>>=20
>>   make XEN_TARGET_ARCH=3Darm64 clang=3Dy llvm=3Dy
>>=20
>> will behave in the same way if building Xen on x86, or on arm64 or on
>> any other platform.
>>=20
>> -march is required because with default value, clang will not
>> recognize EL2 registers.
>>=20
>> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
>> ---
>>  config/arm64.mk | 4 ++++
>>  1 file changed, 4 insertions(+)
>>=20
>> diff --git a/config/arm64.mk b/config/arm64.mk
>> index c4662f67d0..97eb9a82e7 100644
>> --- a/config/arm64.mk
>> +++ b/config/arm64.mk
>> @@ -5,6 +5,10 @@ CONFIG_XEN_INSTALL_SUFFIX :=3D
>> =20
>>  CFLAGS +=3D #-marm -march=3D -mcpu=3D etc
>> =20
>> +ifeq ($(clang),y)
>> +CFLAGS +=3D -target aarch64 -march=3Darmv8-a
>> +endif
>
> Why is this dependent on (just?) $(clang), not (also?) $(llvm)?

Because this parameter is handled by clang only. There is no harm in
providing it explicitly. When building on arm64, value of this parameter
will match the default value for the platform. When building on x86, we
need to tell clang that it should generate arm64 code anyways. There is
no reason in trying to make ARM build with x86 instruction set.

> Also
> this affects both toolstack builds and hypervisor. Is applying -march
> like this actually appropriate for the toolstack?

This is a good question. I can't see why this can't be appropriate for
toolstack. I.e. what bad can happen when building the toolstack.

--=20
WBR, Volodymyr=

