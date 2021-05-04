Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EFB93732E4
	for <lists+xen-devel@lfdr.de>; Wed,  5 May 2021 01:51:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.122765.231573 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1le4nd-0003vz-6X; Tue, 04 May 2021 23:49:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 122765.231573; Tue, 04 May 2021 23:49:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1le4nd-0003va-34; Tue, 04 May 2021 23:49:57 +0000
Received: by outflank-mailman (input) for mailman id 122765;
 Tue, 04 May 2021 23:49:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6YMU=J7=epam.com=prvs=5758e446ec=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1le4nb-0003vV-AU
 for xen-devel@lists.xenproject.org; Tue, 04 May 2021 23:49:55 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8cde2d31-1922-4aa8-b691-d910a3a05bb1;
 Tue, 04 May 2021 23:49:54 +0000 (UTC)
Received: from pps.filterd (m0174683.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 144NjNrV008864; Tue, 4 May 2021 23:49:51 GMT
Received: from eur04-he1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2054.outbound.protection.outlook.com [104.47.13.54])
 by mx0b-0039f301.pphosted.com with ESMTP id 38bfxc811x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 May 2021 23:49:51 +0000
Received: from AM0PR03MB4372.eurprd03.prod.outlook.com (2603:10a6:208:cd::14)
 by AM9PR03MB7090.eurprd03.prod.outlook.com (2603:10a6:20b:281::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25; Tue, 4 May
 2021 23:49:45 +0000
Received: from AM0PR03MB4372.eurprd03.prod.outlook.com
 ([fe80::e123:973d:6af2:97c]) by AM0PR03MB4372.eurprd03.prod.outlook.com
 ([fe80::e123:973d:6af2:97c%5]) with mapi id 15.20.4087.044; Tue, 4 May 2021
 23:49:45 +0000
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
X-Inumbo-ID: 8cde2d31-1922-4aa8-b691-d910a3a05bb1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NDyPnfcphszEVUaIt932EAhKfoupyLKZG7shGeeFGsMgLVoxqjx65CT8SMnEwbeh3Z0CBppNx6LhCM5e6YCtJJv/dUsfcGY9YM0elIHzOnQZBJxajhN8eKMztQI4oLveQ/R65eoU/p2LrNUBHRv6PcXpmGd1B2xusdfZzp2p05jS9Cq/MvfZQZRTqSZQjyOPljTzTFTWZ7YaKMfzdq8QDYfe6Enqeo7q5wYQ9UvYnAsBIfEq3GkfqKjARpFvzuHzmt9NZ0BNv3Q7YHAEmDsaiPjalnmd79Doe8EZAvDgjdIso00GCP1FUnyFnWg6Qj1gisI0GUfzkJGwEV+4dCUGCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qc+HixMJxamX3swsunGRJaTdq8WZhDGUY8qU1/TMy/c=;
 b=AJCppXvBabdy3Ty5h4iDsNGpNQioThcDvrYsOAJPdJz0PsT2sfQZcFNp0dpnZxq0yKMxyDIAOqDlUK8Pv9jFJguWvaTG0Ip/6Z6ejez0Gvtiaf5IaSCbx/BWbkOnok4Kj/Xs4Jb9TTLUfO3i9rRN6VTod/zWs9InaEbq4XNRW73r21xbRKm6gf1GFxpsT+ikAbeZBhl1s9u8XU7anK+R4MBkBGrMGT/4CZPpBxdHwPewu1f9VNLaN1IDAFWmKUIBZg5v54BrZiUwVe4tafdLB4KTUko+4VAMdfZClNHorvitiCUmjkFtybTqmr6JNOGFrRRfYgWvZZ8X4OVr08X8hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qc+HixMJxamX3swsunGRJaTdq8WZhDGUY8qU1/TMy/c=;
 b=tREVOi/UKY8pA6P2LY6m4dlf0UdmDfQ3fhCrgs6wVScOaM7mVwO52TuZDAX++4x10kxoW3q00HhHxK4iBD28LKSrsY5H+t7O7kMXlRIVlDrHzxTMVH4yhHY+YAbqXpIHaffAMP0yporrX5c8WylPZXy8j3NHZU7sh0pBTVJPe8vz3RvJ4LkLjAJ+nMbayPX90dFOtWY43Kz4UXy6uE7wpDb/2y92vd/E+jhQrdB+n3x48rx/5vjaSBaZVswZW2luiikp75PbhRAp4m9tTRjyIoh1k9hzA718650ZAP5t4MX8oVr0d+Gi8/ubgfuNKrdlXrJ7An5EfV2QgvPfLdDzoQ==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
        Stefano Stabellini <sstabellini@kernel.org>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: Ping: [PATCH v2 8/8] Arm/optee: don't open-code
 xzalloc_flex_struct()
Thread-Topic: Ping: [PATCH v2 8/8] Arm/optee: don't open-code
 xzalloc_flex_struct()
Thread-Index: AQHXNr8I7//bY0jNu0uR6+4GJdDAWKrR2dcAgAI4+wA=
Date: Tue, 4 May 2021 23:49:44 +0000
Message-ID: <874kfixdnr.fsf@epam.com>
References: <091b4b91-712f-3526-78d1-80d31faf8e41@suse.com>
 <5fa042ac-9609-eab7-b14d-a59782ef4141@suse.com>
 <d61a2123-b501-15d6-e2c1-f18aa4790b46@suse.com>
In-Reply-To: <d61a2123-b501-15d6-e2c1-f18aa4790b46@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.4.15; emacs 27.2
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=epam.com;
x-originating-ip: [176.36.48.175]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 33362de5-1f11-488f-94cc-08d90f574b56
x-ms-traffictypediagnostic: AM9PR03MB7090:
x-microsoft-antispam-prvs: 
 <AM9PR03MB7090ADB279C77BEB89D9667EE65A9@AM9PR03MB7090.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 UrbqdePil/fXwNBYVLqbl8BiXO+FOgGcRG/ZcXYtaSh2cEgOHwe/UXndkiV0noWcMenrYvWwQrl8+YcuiH/TfjT+dLFO0EGcf3K04srlBE7uRV4wKwT4N9HS8X7KZSLx+19RntJlOZoV6cqSG5eIMiETm6LVZLCGuvC/RrTPdpwftS7arib46lHo+ZBcRl6x6htLvxyCfY7UCmsa3jwvSMNxZoyLpGbGhD5PtwIcT//sr6DnVy4RMFTe063vbDRpnj5bZkcV9UYKN59Iy7Xq1HkjRmruVYQ97EHPV5OkIi/YFLAMJVAU1Rk9yCC4LSJ39mVURoHG3tLACdzlRRw94FZLmcH9pPgKRiCE55MTqBCkv84SRHKHnS/QezeRMsRQJ9lHxI1wrsK9CEqMAqECNMv0IyZBpchFYE0WyBjxsi1MOQcaT6UKCBqTQ1cMQLZmAxDnvinIIsVHNbnUi/UMX+DUnpeaBDtn1v9gHHo415riBl2Yf1mHZ2H1uosFlCtCj7bznRMpUZgeKZO3wr2lLy9nuHwoa9PgWOVzlRmEMHMUSjKJiIOsHWqt8jW9LzoUfpK5pM4oOzV/Q4BuEy6g5sG0hOAepIsfPcV5ADxaDdM=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB4372.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(39830400003)(366004)(396003)(346002)(71200400001)(2616005)(83380400001)(6916009)(6512007)(86362001)(6486002)(122000001)(54906003)(66446008)(316002)(66476007)(66556008)(5660300002)(64756008)(4326008)(66946007)(38100700002)(91956017)(76116006)(8936002)(55236004)(53546011)(6506007)(478600001)(8676002)(36756003)(186003)(2906002)(26005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?iso-8859-1?Q?Sz0edf+RUSu6dxYjwXSZ/ZohcR9JNwNEqv5EcKi4vz5U1ZChTGjJ6wbEfT?=
 =?iso-8859-1?Q?/OH+GnkcFd9ETn+IVNYnBGv+CMOyP4VelzGQkrrirbcttfHNQPV/xcVBu3?=
 =?iso-8859-1?Q?msW6H/qK4QuASUcqsmJctueo9gss8iuNz1LqAqIi3XhO6yYo+kUURxvUP7?=
 =?iso-8859-1?Q?gfILXqT6Gpk0U+zd7df67B2HPOd4f8zuwddpgVi9emsKaFbdcPZydS3y3t?=
 =?iso-8859-1?Q?Fcl9YGHienTr0isLf/rF0YB/42pkJtG0mshvld121EcmNkNHiSeBS6oP/4?=
 =?iso-8859-1?Q?PczyX9g9LyoP3j/v8QorxyS3u2z8m6F+wuM2c1ObNU0vgz/Oz4EgRTR9YN?=
 =?iso-8859-1?Q?oa07kWx6dF+kzPpJSV43cYAcV5Uf6/0nVMw6ZHoQw5bf+FhXQj3+1IUT3t?=
 =?iso-8859-1?Q?oi0vFw97sQk4eAVQRLbOSClLA1L62OXxJPAyUN7DGuy2zw4khAhtsRdhHB?=
 =?iso-8859-1?Q?8F65MChxFMA+sbQ3DQI+IH8tmpMJDxxlgposWiFWCILTuaXO3NHnPTIi5x?=
 =?iso-8859-1?Q?4j5re4wCITO5dk/l+fVIYyyLslGOl+Xjamn9nEB3bRuYqdgp+JDnBV44Ar?=
 =?iso-8859-1?Q?yfxsHgN0xVZN+1uPAG642Cf7s/fsl6trAF4kijKINqCIO1O/0c9X2QTupO?=
 =?iso-8859-1?Q?f6pMIu1csalB8OfBWClUZaZ1FuYeGFLF3Iw+KMvp/5TaNHnoJEpKgFvSJA?=
 =?iso-8859-1?Q?gbojLWc+eu1nAorgGWWaKWtQ7VFlckEc2gs5mYnAa8KZSVnsXNqA1yeb2s?=
 =?iso-8859-1?Q?1DjwSmvc9oySL2QGMZy6NC4SGyvHXKc8t/kHApis9Vp0uScoyfi/qNGz5B?=
 =?iso-8859-1?Q?GCrT9TI6YR4rZ533dScsmOimtbnPfisqCGmyfAj6g3ES/nVuIb5Pr1yavl?=
 =?iso-8859-1?Q?Py2NgxVeveUMKLOqj7956Cys7B8HfolvAEtyMgurTGxxiUtnArticCcqFP?=
 =?iso-8859-1?Q?vqnXPjqU8Ht4Njb2IvLU6JbLQFVqCsdGTsq4arlF7fo6pjHZLdaa78knM0?=
 =?iso-8859-1?Q?wSkp1x9k7fUumNZRdYpqK11XJ8KQWnBAaa47tUYKTG4A/PyIZei5az+eQu?=
 =?iso-8859-1?Q?aHaE9JvUhRRp8TMOaaCgdOXb5LSXtI0YfIgXwaK2XOFBTD1qrjyGHUMaXP?=
 =?iso-8859-1?Q?TlYnOSWJmcxq6c/pf9zeHFxJ6uLiJXYLQ1xZ6AuWW/5zXOdXozWcXANGmd?=
 =?iso-8859-1?Q?BHmo76DX2RjlhjcqJJDoid2xHCeOqZyNi7a32FMToC0jsRCozKkKQDe5t9?=
 =?iso-8859-1?Q?oV+iUvmO3i9ntvwdJhwqOHmYAt1jJLn/Hfsv7Tfk3Rg5JmybcSBs2yf+4B?=
 =?iso-8859-1?Q?5n1Aq4G1iw/U4e2MhzgZ0VbazgfBfITVKE9in3XV56Mt/v5LUU5mQrIdEv?=
 =?iso-8859-1?Q?YAd+b7QMki?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB4372.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33362de5-1f11-488f-94cc-08d90f574b56
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 May 2021 23:49:44.8873
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zDU5hH+Il8E/nfFMun/nPmv44MxE0M5gvP75MWsHYC9bNIkhcnXyNaGZuqiM/vkADZM99ts/eeqOO4OybvFQajvuV6025uYs5gv6yRhJyIU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7090
X-Proofpoint-GUID: 3rXtlQaaj-v4OtuCYRatqVOp6H9znCbc
X-Proofpoint-ORIG-GUID: 3rXtlQaaj-v4OtuCYRatqVOp6H9znCbc
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 clxscore=1011 mlxscore=0 adultscore=0 priorityscore=1501 spamscore=0
 mlxlogscore=999 phishscore=0 suspectscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2105040163


Hi Jan,

Jan Beulich writes:

> On 21.04.2021 16:59, Jan Beulich wrote:
>> The current use of xzalloc_bytes() in optee is nearly an open-coded
>> version  of xzalloc_flex_struct(), which was introduced after the driver
>> was merged.
>>=20
>> The main difference is xzalloc_bytes() will also force the allocation to
>> be SMP_CACHE_BYTES aligned and therefore avoid sharing the cache line.
>> While sharing the cache line can have an impact on the performance, this
>> is also true for most of the other users of x*alloc(), x*alloc_array(),
>> and x*alloc_flex_struct(). So if we want to prevent sharing cache lines,
>> arranging for this should be done in the allocator itself.
>>=20
>> In this case, we don't need stricter alignment than what the allocator=20
>> provides. Hence replace the call to xzalloc_bytes() with one of
>> xzalloc_flex_struct().
>>=20
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> Signed-off-by: Julien Grall <julien@xen.org>
>> ---
>> v2: Use commit message very close to what was suggested by Julien.
>
> I realize I forgot to Cc you on the v2 submission, but I didn't hear
> back on v1 from you either. May I ask for an ack or otherwise?

You already had discussion on v1, so I just wanted to see how it will
conclude before stepping in.

I'm fine with this change:

Acked-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

>
>> --- a/xen/arch/arm/tee/optee.c
>> +++ b/xen/arch/arm/tee/optee.c
>> @@ -529,8 +529,7 @@ static struct optee_shm_buf *allocate_op
>>      while ( unlikely(old !=3D atomic_cmpxchg(&ctx->optee_shm_buf_pages,
>>                                             old, new)) );
>> =20
>> -    optee_shm_buf =3D xzalloc_bytes(sizeof(struct optee_shm_buf) +
>> -                                  pages_cnt * sizeof(struct page *));
>> +    optee_shm_buf =3D xzalloc_flex_struct(struct optee_shm_buf, pages, =
pages_cnt);
>>      if ( !optee_shm_buf )
>>      {
>>          err_code =3D -ENOMEM;
>>=20
>>=20


--=20
Volodymyr Babchuk at EPAM=

