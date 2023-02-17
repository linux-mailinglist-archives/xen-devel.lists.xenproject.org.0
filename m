Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 106CC69A3AA
	for <lists+xen-devel@lfdr.de>; Fri, 17 Feb 2023 02:57:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.496854.767785 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSpzV-0004d2-8G; Fri, 17 Feb 2023 01:56:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 496854.767785; Fri, 17 Feb 2023 01:56:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSpzV-0004Zu-4t; Fri, 17 Feb 2023 01:56:49 +0000
Received: by outflank-mailman (input) for mailman id 496854;
 Fri, 17 Feb 2023 01:56:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YTmJ=6N=epam.com=prvs=6412cfc5d5=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1pSpzS-0004ZY-Tj
 for xen-devel@lists.xenproject.org; Fri, 17 Feb 2023 01:56:46 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 52ca481f-ae66-11ed-93b5-47a8fe42b414;
 Fri, 17 Feb 2023 02:56:43 +0100 (CET)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31GK53kf017780; Fri, 17 Feb 2023 01:56:32 GMT
Received: from eur04-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2053.outbound.protection.outlook.com [104.47.14.53])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3nsp88ay20-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Feb 2023 01:56:31 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by AM7PR03MB6152.eurprd03.prod.outlook.com (2603:10a6:20b:134::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26; Fri, 17 Feb
 2023 01:56:27 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::967e:573a:15a9:176e]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::967e:573a:15a9:176e%4]) with mapi id 15.20.6086.026; Fri, 17 Feb 2023
 01:56:26 +0000
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
X-Inumbo-ID: 52ca481f-ae66-11ed-93b5-47a8fe42b414
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MSKbjKV7K1KFrbQ5RuailHgytiOr1QesUoS1oPk2RauXuyicmmdfIVDdWYzOgG//kHVPG5bKE0eLyHZkHigev5xmpIkkdN9eKuA9USFkksvhPQUrR6f7v192rT3CjYdWdT5rGF2lNKxL4L/6jrK1zqkaC4BWzc6JS/j4XJe9wTqA6fl1kgpdUqs0HnYlEe0vyYhvd2bj1EuVu1ZMKr8SUVNPQz5Azz5XuKTtcNtcceagxfE0h0YKgqzPazinFhocbKgB//TBsX7U4nQ2M64Ygl6ZNd5Dh3duY5IcgnqLmbXTPwo5IzT4FQtYfxD1xkMDme9vFd5iaieQ5FrtHEexGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d2y/DrUVa0c11NRh59r0tbNS03ypDf2k1REZaYaAuKM=;
 b=d/xEBuepJ1fkSPVtz9wkfPINLO3HsG1tAMFoqRosyUQKBKAtFTfZi6YmDQ3NYa+QGEOhtVhpIvpeITmYZxCvo3s8iMqJdCzk2XJ6JgwsiYe1mtrU4H0UncvaYgPA5XFTvxiIdQiooaGxpmn4OfYLtFCHAtWnxtaH3Ulw73fQibh1D5k90+OZFRmhB/KjzM513xF3h7lWR1jw1F7Hesd2yEyJuiOCej9ynBc7D3JK4gG6xQB9QpYUS1avsDWjDoHYf8M4+Z0Rf7uJGGwyJbx5xBvLFXHzjyjaO8on60hDY/8V132mpPPGDw+zaHWJfVdebXSR69kkQbQvVUL5dZ4WaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d2y/DrUVa0c11NRh59r0tbNS03ypDf2k1REZaYaAuKM=;
 b=Q/O3vwIprh4I+PZhY06k0sDA8fSkoFFlJRRol2m70JApf3ycvpdcpkL7+Pu8dJAB8Pj6/aGmqEtQuz9W7LpQoLDH2Xeji797U2s5shve079AhscsORxX+fMer4wws9ROUfqotrSBjblLiG6vIx5CClTWDVLgOkKHYGatRj2RXGiZ5cQ8rWEDfMq1gpbIR9M6vo72YLyBIgBB9mCJbKgR5MxxPoHwb9Dxa0tbqudzFZLsTicmCGKjKivX1faIFaYlcn5WPRxz2PhA3EvSnjp0rnMeqXNx5jMuBhTOAnEUM0FY5tp6FE/RCIaZGJTUVtkFBDU82SFgJ80Urue4SUTWZA==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
        Andrew Cooper
	<andrew.cooper3@citrix.com>,
        George Dunlap <george.dunlap@citrix.com>,
        Julien
 Grall <julien@xen.org>,
        Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [RFC PATCH 04/10] xen: add reference counter support
Thread-Topic: [RFC PATCH 04/10] xen: add reference counter support
Thread-Index: AQHYvUN+XE3jlJIvEkq5uMVpvnNlQq7Q5HaAgAKFNIA=
Date: Fri, 17 Feb 2023 01:56:26 +0000
Message-ID: <87sff512d2.fsf@epam.com>
References: <20220831141040.13231-1-volodymyr_babchuk@epam.com>
 <20220831141040.13231-5-volodymyr_babchuk@epam.com>
 <a89db71d-dc4d-5b17-1528-4b8a4243addc@suse.com>
In-Reply-To: <a89db71d-dc4d-5b17-1528-4b8a4243addc@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.8.9; emacs 28.2
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|AM7PR03MB6152:EE_
x-ms-office365-filtering-correlation-id: e0e187a9-7370-4c5a-ee8c-08db108a2df5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 gyc9XjsQWHnO0YyX3pKbDPmTU830cls2qYhByTWdTcECB7XcMAtmV2k67ICY2OoJtulpfEXd765KuPMwXBGlhT2+jzP0ZBPqagg1Av4iVORc8pG9JbhBcmksdAtor4ndFDVjq+pRtB+beM6XxSI9JX4e/WxGa9d0njgZqhNeSQFHuW5Ju5+XWDzplEefK1FPYbpWTh5sl4nqJKTN/YJDijYfTH/YLt4XmHVPAOnnq21T76LlrTrtZKDsRD+Lv9hcuQUouHdVswQlHXYA/RXHxVvMsC9iFF1J2Q4C6WRbpHCYkZUBW+wTYJD5EWOqmsNL2YylzxQhIzkeW7WYbjkrTSFysq2sQpQeQQLIe1Dyly++jZmq/pMO4Xmr1UfUm3AT9gIAd1KH51agSht+G9cPF3ozfTXN3NgmGGHaemgKu3MQ8SeSZp94SG2dn+5AlOdVtayTTA4+9wJWJJG1M/KE8rmrDbQm2/MJHrfuKhAlFPLVqRYo6hzImgtl0z3R0O7EoBGm0i2uvWCCiT7R9DN8JbGGJfxlPGVXpsuI6Q1yA0h6jbbTu1+W5LpkbaxZgjiQcObfWUAenq23vTflL+IDs4z1IuXc4XIbNR81LH0a0+Kub45kOt6os3R/PRZ2AP+FePujmb7ekC0rthN5Yf4GfPSbahdpXHD37ZkbXyZbDajN5U4JWxrxVBd5XS9s4Qllb8VCWwHFx9wGRaFINYUumA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(376002)(136003)(366004)(39860400002)(346002)(451199018)(54906003)(478600001)(2616005)(71200400001)(6486002)(55236004)(6512007)(53546011)(6506007)(26005)(186003)(36756003)(38100700002)(41300700001)(5660300002)(86362001)(38070700005)(8936002)(316002)(66476007)(8676002)(6916009)(66946007)(91956017)(66556008)(122000001)(66899018)(2906002)(66446008)(64756008)(76116006)(4326008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?WM4RTZVP8tghxnWKL+r3vB804cENtd05gHiWxJ5ZKh//MAI48sKYTxXRGB?=
 =?iso-8859-1?Q?3MJBW9N/ZiiKpDRn8Z8qgL3aVzmCBBv/elYGpaS8CVd3rWNOY4cRu5D/ea?=
 =?iso-8859-1?Q?SwT+Vm9VRu+sShbObwhT5xxFV7Eeaz7MVDfuSqClJV8FPWPUbScQJ6FQvA?=
 =?iso-8859-1?Q?KP9YAAWjB+2xpgnwuEOVPGC/azzBpUmkojbhmJ6gTnWZHGgIgaHGf1dOLR?=
 =?iso-8859-1?Q?cyhuA0Dxa70VrCF+0J5I5uUYq26R/ol02D3VJy7vdAUAEwBn91DIZ1dkbe?=
 =?iso-8859-1?Q?srn1iqq9bBjlkEEFLXp71rDAdlnM3gQAqzKmGJ6fa4owI1oFHozD7J3Gxx?=
 =?iso-8859-1?Q?AZhss670OjQMH2VAAMaQ+v3aJW+LrAw4Q1daTnmHGJARf34uZEzZQZN0XT?=
 =?iso-8859-1?Q?eOA8/zEeBT/YOb2TWZIYKej9/9cq1lI2zy07c+hOzucMRh+pvIYs9Cg3sV?=
 =?iso-8859-1?Q?al6cVQzXOzBVJIM/F1e4pMXo5pHYplD0Jb+E0/XoHFtsBK0Uog32su+QzP?=
 =?iso-8859-1?Q?e3k4pmMnPttYO9C4nhnoo4wZzbGiVo8gZBhD7rW6uWvrECL0XGYehSdHz8?=
 =?iso-8859-1?Q?2ejIzdiV07xCnPhZPY3+4AAzn7qePUF/zJB2vcddqgIjRoLSdGVkQ0iIoK?=
 =?iso-8859-1?Q?N6EirxhRRdoO6KiuAnqNLOFXTtlV/4H6ZQ4oh2fJDvOyzXdhVvvjMOYJq/?=
 =?iso-8859-1?Q?OAll7jwg1dX81730Vb/DG6ZGg8bWS7c1vrkFoHEm3eMk2gMLbPXOcEtFV8?=
 =?iso-8859-1?Q?wzDZ/1cLWDZyXAdHh55KZjCf30bHZFo2HkXQR1KLaogAwm2mUh/AQwm/2/?=
 =?iso-8859-1?Q?nnL1HfX1mMkJz60gA/+k1gfhwCeSnLZW43w4n7ihjwuWD9Jf0Qw/5bkLT0?=
 =?iso-8859-1?Q?XiKdrLvzjlLMNWGugfrc5JdJcKIJXGcYw4crpq3nURFlVO60PWsU6Icsd2?=
 =?iso-8859-1?Q?Qt6kEXdSbBrDqxtqeyxQZwufIeZwgx7LjWc1HqjiZud3+3cwiXWkNqn4XD?=
 =?iso-8859-1?Q?MxfQMW82c37uvjjJZYPYdNAWr3ZLUNU4vLAwE9oMJw5dOTIVvO/APFbFgd?=
 =?iso-8859-1?Q?MMQ+WHB/pcZ+ojVscoZ7KB8nFuC8iBiOdkXB6HMGjy61qlroUP+ZnrtUOr?=
 =?iso-8859-1?Q?4ZbohX+1cRU6LeNOREO9xMkWYvedDSXS+bdkr8rYvrlyW+69uN6BqpEAsl?=
 =?iso-8859-1?Q?VAevAhIm75SLTWYQpWMwXDWJj1rj/sxwjpKjYDAsIOF/94a7sU1yo3kLgl?=
 =?iso-8859-1?Q?q7V0xvWsv9R8bkRTG+fonyp6wZqsldZZzpCn1GZf/nW8ZmlhXhlMMw4pzE?=
 =?iso-8859-1?Q?y3cWrHaXdQjFKdQl4bH7ixoPL6ZPx+0+8ubW/d8CvFPQyhjnPReTJKVqsU?=
 =?iso-8859-1?Q?7asDirbJYO/dmVmYv7Snql4G05wMWYCI+RCAivmrKDBcQvmC4FaL3j0jrT?=
 =?iso-8859-1?Q?NunJf3ZHferdmrr5J78gHwBUKIMh+s3MU6Hwg7sPcQ/9E0L/1rGdMEUTwB?=
 =?iso-8859-1?Q?M9bwHUolLOPSeeTvvFQ+NsNHlaFIeHw3Jwe1MyDtJJc8nrD//xmzpoYp3X?=
 =?iso-8859-1?Q?DxQtAGFZy4Rfiw0d47zoinjvYF0PKUa03NCJeNXLDX54/nSYHHERFcx8bj?=
 =?iso-8859-1?Q?QZUSOknntPo8yY3qcB4RDCNyl6+PTKrVBBZr+QwTw8Jr77c7SbmGe2TA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0e187a9-7370-4c5a-ee8c-08db108a2df5
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2023 01:56:26.5524
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EQbeppY0eziokrvnjxfy/0xGfKd44IRZGsviRaGvkH83rLCeLXuaShuE69AWhZTMM8uEjJ0lJ2X9NScXavRAsAvyEs3BIQ+xyI2uB0sV0jY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR03MB6152
X-Proofpoint-ORIG-GUID: r1gPpwhf77Ri8Lypnsn-Rf6fO_2r1alb
X-Proofpoint-GUID: r1gPpwhf77Ri8Lypnsn-Rf6fO_2r1alb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-16_18,2023-02-16_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 mlxscore=0 malwarescore=0
 impostorscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302170015


Hello Jan,

Jan Beulich <jbeulich@suse.com> writes:

> On 31.08.2022 16:10, Volodymyr Babchuk wrote:
>> --- /dev/null
>> +++ b/xen/include/xen/refcnt.h
>> @@ -0,0 +1,28 @@
>> +#ifndef __XEN_REFCNT_H__
>> +#define __XEN_REFCNT_H__
>> +
>> +#include <asm/atomic.h>
>> +
>> +typedef atomic_t refcnt_t;
>
> Like Linux has it, I think this would better be a separate struct. At
> least in debug builds, i.e. it could certainly use typesafe.h if that
> ended up to be a good fit (which I'm not sure it would, so this is
> merely a thought).

Sadly, TYPE_SAFE does not support pointers. e.g I can't get pointer to
an encapsulated value which is also passed as a pointer. I can expand
TYPE_SAFE with $FOO_x_ptr():

    static inline _type *_name##_x_ptr(_name##_t *n) { &return n->_name; }

or make custom encapsulation in refcnt.h. Which one you prefer?

>> +static inline void refcnt_init(refcnt_t *refcnt)
>> +{
>> +	atomic_set(refcnt, 1);
>> +}
>> +
>> +static inline void refcnt_get(refcnt_t *refcnt)
>> +{
>> +#ifndef NDEBUG
>> +	ASSERT(atomic_add_unless(refcnt, 1, 0) > 0);
>> +#else
>> +	atomic_add_unless(refcnt, 1, 0);
>> +#endif
>> +}

> I think this wants doing without any #ifdef-ary, e.g.
>
> static inline void refcnt_get(refcnt_t *refcnt)
> {
>     int ret =3D atomic_add_unless(refcnt, 1, 0);
>
>     ASSERT(ret > 0);
> }
>

Thanks, did as you suggested. I was afraid that compiler would complain
about unused ret in non-debug builds.

> I wonder though whether certain callers may not want to instead know
> whether a refcount was successfully obtained, i.e. whether instead of
> asserting here you don't want to return a boolean success indicator,
> which callers then would deal with (either by asserting or by suitably
> handling the case). See get_page() and page_get_owner_and_reference()
> for similar behavior we have (and use) already.

For now there are no such callers, so I don't want to implement unused
functionality. But, if you prefer this way, I'll do this.

[...]

