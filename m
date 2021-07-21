Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 425223D165E
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jul 2021 20:29:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.159535.293400 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m6GxC-0008Jr-Sn; Wed, 21 Jul 2021 18:28:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 159535.293400; Wed, 21 Jul 2021 18:28:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m6GxC-0008HI-Pi; Wed, 21 Jul 2021 18:28:22 +0000
Received: by outflank-mailman (input) for mailman id 159535;
 Wed, 21 Jul 2021 18:28:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hVq+=MN=epam.com=prvs=7836cd435a=oleksii_moisieiev@srs-us1.protection.inumbo.net>)
 id 1m6GxB-0008H9-0r
 for xen-devel@lists.xenproject.org; Wed, 21 Jul 2021 18:28:21 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6b8fd4de-ea51-11eb-8d13-12813bfff9fa;
 Wed, 21 Jul 2021 18:28:18 +0000 (UTC)
Received: from pps.filterd (m0174681.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16LIFASW017411; Wed, 21 Jul 2021 18:28:17 GMT
Received: from fra01-mr2-obe.outbound.protection.outlook.com
 (mail-mr2fra01lp0101.outbound.protection.outlook.com [104.47.25.101])
 by mx0b-0039f301.pphosted.com with ESMTP id 39xr2485ex-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Jul 2021 18:28:16 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com (2603:10a6:102:ea::23)
 by PR2PR03MB5434.eurprd03.prod.outlook.com (2603:10a6:101:1f::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.23; Wed, 21 Jul
 2021 18:28:13 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::1c8:a432:8446:ee8c]) by PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::1c8:a432:8446:ee8c%8]) with mapi id 15.20.4331.034; Wed, 21 Jul 2021
 18:28:13 +0000
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
X-Inumbo-ID: 6b8fd4de-ea51-11eb-8d13-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JDZoPNCiohABqBSwOpw5e218iN+CfirvbASzoQSn5O3ZO6qLpr6rtUmNFVLxbjlx55ZRKWgtin5kIi+OKd4O7Za3zLvMKguOwpeK8zQ7qOoNR3p0HNah8FdLrTeD0YsSmyQi5VwyyXS9W0+picpFHOlMFesaDAY83wXo3Gee+LW/uXEgXLQlQ9CT1oQbSpPg4HpuMRJZ1QZ1PiWOtV8F3nxP2XFotKju5TmH91mvKl1UwtGEF2v7zrbH8GIeV8DMVk5D56wh0QqdRQQ2SzgVYTT8acD1sU5yoYIk5dsG4e1mCndvVyKkaBWuDy5cG/LS3mRlxtUYqJEF9H9F/0tBWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r6zi+OiVf7DpspvaUjPpllKD/aKjvcY1uyx+URWFnhM=;
 b=Jn+ugNf1GMPClpHsm3aa//H6LXIRhbIyZPMAkviZavM9Jt0B/ik1UGoNd4clZq7LhcVORA3zyGjE5vDEALkUGYhRMewV81hSJD4kSqbGuEyJUvQW6n754zpFE2CGtXnzSGGvhcMNaQ8Zg+Oj2djaieFt5NIMXQ+wMBFep3B1AnqlgjoRb5C2fYEaTI6XmmT2mmSr03m/bgTueGeRb09aA3IPn5zzt30mRDcEGINhoTdBcnjMJfBzhbSoyly+5dAHjRJ4EKHwR0HrUs4gZit6hEjEdPibGu1S0hFZ+a62sXyvgWt7au15vytmgnPhmOXQgdbkblXXc1a1HZcSjst09w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r6zi+OiVf7DpspvaUjPpllKD/aKjvcY1uyx+URWFnhM=;
 b=ARcmCiyxpCg8gvddAznAtddHKum0SfRu2Kt9LOUlMaCY33wu9s4UJGLcIPYc2hBCrmXJKLFcg8vUA4c7MKhme/HS0bKRZAL5L4dBpSFgCZl3FmAr7KT067cAHyrc0AD/LDDyEMkie69cvANlzBxlLOtt/cwEYjpWOIHKN12TdGvcr+06tkuFQ8AbAsn4hQbUE1OjwEBCMYiflZbcsvyAfgVqDHyh0DKqzR9FY3WObnxmrsOHA0z18fx2oQDWSKzT6D/sUfXOILW+Rkkgv+jscOH03biUnFsUhXyKFcqMbsh0ZEnW/OvAtM2sciu/DYg3c5eK1HLdpKri8J9COaCfvA==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: Julien Grall <julien@xen.org>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Andrii Anisov <Andrii_Anisov@epam.com>,
        Stefano Stabellini
	<sstabellini@kernel.org>
Subject: Re: [arm] Dom0 hangs after enable KROBE_EVENTS and/or UPROBE_EVENTS
 in kernel config
Thread-Topic: [arm] Dom0 hangs after enable KROBE_EVENTS and/or UPROBE_EVENTS
 in kernel config
Thread-Index: AQHXfk7sayRbwafWg0WziHoeeCAd5atNqbDZ
Date: Wed, 21 Jul 2021 18:28:13 +0000
Message-ID: 
 <PA4PR03MB7136D3B811F820FC8A5AFF95E3E39@PA4PR03MB7136.eurprd03.prod.outlook.com>
References: 
 <PA4PR03MB7136DEB7183936907DFE145AE3E39@PA4PR03MB7136.eurprd03.prod.outlook.com>
 <PA4PR03MB713685E6A8004ED13814B05AE3E39@PA4PR03MB7136.eurprd03.prod.outlook.com>
 <PA4PR03MB71367B7662A1D3E4E234F6C0E3E39@PA4PR03MB7136.eurprd03.prod.outlook.com>
 <a02d4291-e48e-28cc-52da-6b9c998b2d0a@xen.org>
 <PA4PR03MB7136452DF9961BC283718F4BE3E39@PA4PR03MB7136.eurprd03.prod.outlook.com>,<8ce6f5fe-ccb6-d463-a39e-50fd82816b86@xen.org>
In-Reply-To: <8ce6f5fe-ccb6-d463-a39e-50fd82816b86@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a6c391ea-b4e9-43ce-99c6-08d94c754d15
x-ms-traffictypediagnostic: PR2PR03MB5434:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: 
 <PR2PR03MB54347B5ECF50FCCD7BC0D194E3E39@PR2PR03MB5434.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 HuL7/Bt8xw+r2yhujHS9Eflly7dG4DAVkIiL3cE6XcqWuZhMAZ2zPgwHMuth+KY61zogJtwWlgArEfAwXUtx/zvWezqfNzGVPG1i83qg/juO5STcBB73nvRmDxe1MF7xjCrgb7I21VYGE1B90es9HsBNEJf2wSOmJ9xW4s70ME8s+rvMHUatQSIcv6uKKCKbOTB7E1aJahsm6iTMOO3XXtj8EAi31GFlnLxW247kRUA7lmJctSa7aQ9krd5tZISmdNHJOj1UVgrVFUEe7/Ppm8ufRpSxLGeRtwMfDkQ7ZQVTob0wDkLT8yMATPfhxlKMnbBJqlgSJkOuYXFklHsXokYReglZgpDBGKdyWgmrVe2/zrsEUw7Z9mW0rnUeCulyhi4eh8iBloX9daJ/wwNelA2Tk+O52nYYR82PAg5WYUpMxOHAnmTP3CXoUZUuQFZxJ5mG0KPpz2HKeBuleQfnohsRImXrOmHuca/10ZPRAS3T3/uvmY6cZYtLyQukC8VrHrYjWqqtHZOGWzVEMWHCzyDRFtKFdTB4JYmkCgmHIlpjPAHOyUySOMb8x1614oEa+7pcmbjP1Mzk4ec88i/yGfkJSSsK90l20Wx9ysszM7k9WFWUzoZp9Zmwm3n92n2t4jbubSB9XrwKeMFjWdIEN5LoHzK8DBW/jnLquforOMv3SQcX+ki57MBqS2lNgHxDZzDz31NK34vt5crvf8rnfxaEepNIh1owbcK9OiVFVXQ/9mTvY2KP1VqCrYXZL9ECt75PyeJ6orhZWofbUStU2Sd3/oTPi5hAdcZgPJm0Tsjo2Q0e0MFxXR9GeRGRQt/FvQcQU9P/JZrwE6OGeGPpk8fZPmFH2D0s+Ljly1OwVsM5IRWVSrsCJrMhI82zIlw1zfhxXJwRaZMeaFnGXrEv0A==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR03MB7136.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(376002)(136003)(346002)(396003)(366004)(7696005)(19627405001)(71200400001)(86362001)(110136005)(4326008)(53546011)(33656002)(5660300002)(966005)(83380400001)(6506007)(9686003)(478600001)(66946007)(316002)(64756008)(76116006)(18265965003)(52536014)(66556008)(8676002)(8936002)(166002)(66476007)(122000001)(26005)(186003)(54906003)(38100700002)(55016002)(66446008)(2906002)(10126625002)(38070700004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?w/n6ct/kfyiP/48Sy+gCatkUi0meBiR6DlDRZvA/1xWNoVshAdjgtV5hBt?=
 =?iso-8859-1?Q?6NsjjAKEcmqDME7EsyCak6s8OKncNiCCqsemA3A6LDSZOsFAlC12zujamW?=
 =?iso-8859-1?Q?agd1wGltXvhj34cEfuDaAaoaAGJ67izjGPc9hQkX7pCp5z4ndB3GocuG4F?=
 =?iso-8859-1?Q?o6tWVY0t8mJZIsMt/Ouf3GytDZIgQJlm5nHe8gDhEnIwmJOlpecNPRn45t?=
 =?iso-8859-1?Q?kxtSpEI4FeInKzftcz91x36A/kvgbZTt99WIRBM3YIXG9b4qu3eMiAZ24M?=
 =?iso-8859-1?Q?X3HBQCWaYOVT20PPLi6w//bcL/pDFOlxo8v5zWHgyMacq1KEzDMGkAc2kd?=
 =?iso-8859-1?Q?EqfMcFJqGYNtdZzT9nDQPhm+PlaqMWKiiLXJsq0WjQYY8TZiHo8elm5ege?=
 =?iso-8859-1?Q?KWmaU5z/6rDrtCjXJvxstribL/xlfpppcbzJi7Dpeoujnlmx/bCExOIHhT?=
 =?iso-8859-1?Q?LEYCfmn0LpUQVfbkS6VgrQmKmJhVFhWj8owzyp1rFbFuLNKWX+aE6msHFn?=
 =?iso-8859-1?Q?ATsKXzna3YbzW0cYnkeu4C+a2IovWdMc+r4KYu3HaXkjz6SD+bRxAAg8Bc?=
 =?iso-8859-1?Q?xLENQVUfLq0BTrGM81/wIx88PBgNdFv7OCIfZ0GCiMQctRyl5jWu0xba8p?=
 =?iso-8859-1?Q?g+kjYa390smSkA7pO8XpAiIZFt/yxSNyxso7jGiL1u6nTmGV5hZ/Ck2zI/?=
 =?iso-8859-1?Q?aRUr20tffC8bOqb0qCTIbPOV9Su8tX/I/q0spnp9dr6Vll8/ffZqH8RKpA?=
 =?iso-8859-1?Q?CuX/PMl+pge4/2yVnIEXiSaxOgPDqlyktD5dbs0WHiEeTYL39hH5XztJvH?=
 =?iso-8859-1?Q?a0UALCTq7P4SuMCT0PudOZS6IuA/kR9RS8Vf3kgQ32OMWJzDpHq11ISZGK?=
 =?iso-8859-1?Q?72jSSKW4D6drYmFxEIhOKlJY91YjgVvqiz9FyH5tSAJtOI5y12K3QV8P/Z?=
 =?iso-8859-1?Q?mQFDV2JmlyxmTVnkSAwEd/thYlCpGgy39O6JrbBDubB86vqXuMjdOryZeQ?=
 =?iso-8859-1?Q?jeetWdNorHkSJxBOFHXFYVyTbAN3zU4Tx+R+qrUnZ2dvJEjixgaAHtKE2e?=
 =?iso-8859-1?Q?QC5vvUuY+BJdnNAygDWO7eiU431Yb9F3IHmlYZqFqVKtlMFZtaHNWFPIhE?=
 =?iso-8859-1?Q?/aiE5AkdQCHx588+U9HExsYBd9kMX1PleCJAczxDpz6F2m3YiGwlcFODvK?=
 =?iso-8859-1?Q?cV5P+KOqdnNwRIKP7RD4J3aZ8kpDAgEUS1Mb42Va26fA3G2NkhKFSK940n?=
 =?iso-8859-1?Q?HqcjnBNBV4esKjtlB2lKPhFcnOosfYJiV7QjXRjlSR7aRuTgR3isHS6Y2Y?=
 =?iso-8859-1?Q?i9f2J99WSkIjCE1ohmfZr7wt+gC0xvyjBWkhnS7c2qJNnnU=3D?=
Content-Type: multipart/alternative;
	boundary="_000_PA4PR03MB7136D3B811F820FC8A5AFF95E3E39PA4PR03MB7136eurp_"
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR03MB7136.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6c391ea-b4e9-43ce-99c6-08d94c754d15
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2021 18:28:13.6786
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LhXIHAN/Xiv1Tk0zUH/dLXnXwTB/6T64xp5hH/xBOKSESRFCKXx/hR/bX3alSlm5qdcqy9N0fErU/cAMkcbdY7NUsTr2Fxqlzc0EMy04A5w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR03MB5434
X-Proofpoint-GUID: rcYE-AjOl94nWou6Mxge2-zq4QC7Qur-
X-Proofpoint-ORIG-GUID: rcYE-AjOl94nWou6Mxge2-zq4QC7Qur-
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-07-21_10:2021-07-21,2021-07-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 mlxlogscore=999 spamscore=0 bulkscore=0 adultscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107210108

--_000_PA4PR03MB7136D3B811F820FC8A5AFF95E3E39PA4PR03MB7136eurp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Please see my answers below.

________________________________
From: Julien Grall <julien@xen.org>
Sent: Wednesday, July 21, 2021 7:39 PM
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>; xen-devel@lists.xenproj=
ect.org <xen-devel@lists.xenproject.org>
Cc: Andrii Anisov <Andrii_Anisov@epam.com>; Stefano Stabellini <sstabellini=
@kernel.org>
Subject: Re: [arm] Dom0 hangs after enable KROBE_EVENTS and/or UPROBE_EVENT=
S in kernel config

On 21/07/2021 15:40, Oleksii Moisieiev wrote:
> Hello Julien,

Hello,

>>>
>>> My setup:
>>> Board: H3ULCB Kinfisher board
>>> Xen: revision dba774896f7dd74773c14d537643b7d7477fefcd (stable-4.15)
>>> https://urldefense.com/v3/__https://github.com/xen-project/xen.git__;!!=
GF_29dbcQIUBPA!m4NHC2XbbSHWWZjQ7CX1ZZhaET6l0bQhZo581jtCmpst8E8JBp8Qri3haIak=
s6cbo7Ri$
> <https://urldefense.com/v3/__https://github.com/xen-project/xen.git__;!!G=
F_29dbcQIUBPA!m4NHC2XbbSHWWZjQ7CX1ZZhaET6l0bQhZo581jtCmpst8E8JBp8Qri3haIaks=
6cbo7Ri$>[github[.]com]
>
>>> <https://urldefense.com/v3/__https://github.com/xen-project/xen.git__;!=
!GF_29dbcQIUBPA!m4NHC2XbbSHWWZjQ7CX1ZZhaET6l0bQhZo581jtCmpst8E8JBp8Qri3haIa=
ks6cbo7Ri$
> [github[.]com]>;
>>> Kernel: revision 09162bc32c880a791c6c0668ce0745cf7958f576 (v5.10-rc4)
>
>>Hmmm... 5.10 was released a few months ago and there are probably a few
>>stable release for the version. Can you try the latest 5.10 stable?
>
> Switched to tag v5.10 rev: 2c85ebc57b3e of
> https://urldefense.com/v3/__https://github.com/torvalds/linux.git__;!!GF_=
29dbcQIUBPA!hJARiSsCASVNpAQxrnN-7sFsVHHTS39sjRraLqBkD6AoaCbplgoyiv-iCGlHhXa=
fbPNc$ [github[.]com]
> and got the same problem, that I see no output from kernel. All tests
> were done with earlycon parameter set in the kernel cmdline.
The tag v5.10 is the first official release. What I meant is using the
stable branch from
git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git (branch
linux-5.10.y).
I need some time to download and build mainline kernel. I'll test this scen=
ario and send you results tomorrow.
>
>>>
>>> https://urldefense.com/v3/__https://github.com/torvalds/linux.git__;!!G=
F_29dbcQIUBPA!m4NHC2XbbSHWWZjQ7CX1ZZhaET6l0bQhZo581jtCmpst8E8JBp8Qri3haIaks=
29w69MC$
> <https://urldefense.com/v3/__https://github.com/torvalds/linux.git__;!!GF=
_29dbcQIUBPA!m4NHC2XbbSHWWZjQ7CX1ZZhaET6l0bQhZo581jtCmpst8E8JBp8Qri3haIaks2=
9w69MC$>[github[.]com]
>
>>> <https://urldefense.com/v3/__https://github.com/torvalds/linux.git__;!!=
GF_29dbcQIUBPA!m4NHC2XbbSHWWZjQ7CX1ZZhaET6l0bQhZo581jtCmpst8E8JBp8Qri3haIak=
s29w69MC$
> [github[.]com]>;
>>>
>>> kernel config: see attached;
>>>
>>> dtb: see attached;
>
>>Please avoid large attachment as they will be duplicated on every
>>mailbox. Instead, in the future, please upload them somewhere (your own
>>webserve, pastebin...) and provide a link in the e-mail.
>
> I'm sorry for that.
>
>>>
>>>
>>> If kprobe/uprobe events are enabled - I see no output after xen switche=
d
>>> input to Dom0, if disabled - system boots up successfully.
>>The console subsystem tends to be enabled quite late in the boot
>>process. So this may mean a panic during early boot.
>
>>If you haven't done yet, I would suggest to add earlycon=3Dxenboot on the
>>dom0 command line. This will print some messages during early boot.
>>ing.
>
> All tests were done with earlycon parameter set in the kernel command
> line (xen, dom0-bootargs).
>
>>>
>>> Both configs work fine when I boot without xen.
>>>
>>>
>>> Dom0 information from Xen console shows that only one CPU works, and PC
>>> stays in "__arch_counter_get_cntvct" function on read_sysreg call. //
>>>
>>> I did further investigation and found that kernel 5.4 doesn't have such
>>> kind of issues.
>>> After bisecting kernel,between 5.10 and 5.4, I found that output
>>> disappeared on commit:
>>>
>>> 76085aff29f585139a37a10ea0a7daa63f70872c
>
>> From the information you provided so far, I am a bit confused how this
>>could be the source of the problem. But given this is not the latest
>>5.10, I will wait for you to confirm the bug is still present before
>>providing more input.
>
> I was confused with this commit either. As I mentioned above, I've
> checked with the latest stable 5.10 kernel and still got the same problem=
.

Thanks for the testing. I am not quite too sure where this may fail.
Maybe Stefano has an idea?

If you have an external debugger, can you use it to get a stack trace?
Otherwise, I would suggest to add some xen_raw_printk() in the code to
figure out where it may fail.
Unfortunately, I don't have an external debugger right now (my testing boar=
d is placed in the different country).
Let me share with you the results of the investigation I've done, before as=
king help from community. I haven't shared it before because I wasn't sure =
it's related.

 I've met error with no printk on linux-bsp kernel taken from the latest re=
nesas yocto release: https://elinux.org/R-Car/Boards/Yocto-Gen3/v5.1.0

My original kernel based on rev 301d2c636929be96f3d87b1b5d287f87ed67a7be of=
 linux-bsp kernel.

I've added HYPERVISOR_console_io calls  to the code and got the following b=
acktrace:
https://pastebin.com/E3X74tyZ
It's a little bit messy, but still readable. I've added extra prints to the=
 dump_stack function to be able to see backtrace. In this case, looks like =
the problem is that system is unable to get free descriptor from printk_rin=
gbuffer.
In file kernel/printk/printk_ringbuffer.c, function desc_reserve, line:

prev_state_val =3D atomic_long_read(&desc->state_var); /* LMM(desc_reserve:=
E) */

we get some 18446744073709551615 while expecting 0.

But the problem seems to lay deeper because when I switched to the mainline=
 kernel, it hangs on read_sysreg call in

 __arch_counter_get_cntvct function.

Then I reverted commit 76085aff29f585139a37a10ea0a7daa63f70872c and this fi=
xed problem with no printk output.
Now, with the commit reverted, I see the kernel output with error CPU is in=
 inconsistent state. Looks like commit 76085aff29f585139a37a10ea0a7daa63f70=
872c is the cause of no output issue.
>
>>>
>>>
>>> Another issue, which was revealed after I got kernel output was kernel
>>> oops with message that CPU is in inconsistent state.
>>>
>>> [0.415612] EFI services will not be available.
>>>
>>> [0.420267] smp: Bringing up secondary CPUs ...
>>>
>>> [0.425185] Detected PIPT I-cache on CPU1
>>>
>>> [0.425267] Xen: initializing cpu1
>>>
>>> [0.425292] CPU1: Booted secondary processor 0x0000000001 [0x411fd073]
>>>
>>> [0.425815] Detected PIPT I-cache on CPU2
>>>
>>> [0.425879] Xen: initializing cpu2
>>>
>>> [0.425899] CPU2: Booted secondary processor 0x0000000002 [0x411fd073]
>>>
>>> [0.426362] Detected PIPT I-cache on CPU3
>>>
>>> [0.426425] Xen: initializing cpu3
>>>
>>> [0.426444] CPU3: Booted secondary processor 0x0000000003 [0x411fd073]
>>>
>>> [0.426537] smp: Brought up 1 node, 4 CPUs
>>>
>>> [0.472807] SMP: Total of 4 processors activated.
>>>
>>> [0.477551] CPU features: detected: 32-bit EL0 Support
>>>
>>> [0.482745] CPU features: detected: CRC32 instructions
>>>
>>> [0.499470] ------------[ cut here ]------------
>>>
>>> [0.504034] CPU: CPUs started in inconsistent modes
>
>>Looking at Linux 5.7 code, this is printed when not all the CPUs are
>>booted in the same mode (i.e. EL1 or EL2).
>
>>This is quite odd. So let me ask a question first, did you see this
>>error during the bisection or on the latest 5.7?
>
> Switched to kernel v5.7 tag, rev:3d77e6a8804.

Similar to 5.10, the lastest stable in the linux-stable repo
linux-5.7.y. If this still doesn't help...

I need some time to download and build mainline kernel. I'll test this scen=
ario and send you results tomorrow.
> On 5.7 kernel I can see printk output, but getting CPUs started in
> inconsistent modes error.
> Also, I tried with hmp-unsafe=3Dfalse ( in xen cmdline, so only 0-3 CPU
> were enabled. And still got the same issue.
... can you print __boot_cpu_mode[0] and __boot_cpu_mode[1]?

Cheers,

--
Julien Grall

--_000_PA4PR03MB7136D3B811F820FC8A5AFF95E3E39PA4PR03MB7136eurp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Please see my answers&nbsp;below.</div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Julien Grall &lt;juli=
en@xen.org&gt;<br>
<b>Sent:</b> Wednesday, July 21, 2021 7:39 PM<br>
<b>To:</b> Oleksii Moisieiev &lt;Oleksii_Moisieiev@epam.com&gt;; xen-devel@=
lists.xenproject.org &lt;xen-devel@lists.xenproject.org&gt;<br>
<b>Cc:</b> Andrii Anisov &lt;Andrii_Anisov@epam.com&gt;; Stefano Stabellini=
 &lt;sstabellini@kernel.org&gt;<br>
<b>Subject:</b> Re: [arm] Dom0 hangs after enable KROBE_EVENTS and/or UPROB=
E_EVENTS in kernel config</font>
<div>&nbsp;</div>
</div>
<div><font size=3D"2">
<blockquote itemscope=3D"" itemtype=3D"https://schemas.microsoft.com/Quoted=
Text" style=3D"font-size: 11pt; border-left-width: 3px; border-left-style: =
solid; border-color: rgb(200, 200, 200); padding-left: 1ex; margin-left: 0.=
8ex; color: rgb(102, 102, 102);">
On 21/07/2021 15:40, Oleksii Moisieiev wrote:<br>
&gt; Hello&nbsp;Julien,<br>
<br>
Hello,<br>
<br>
&gt;&gt;&gt; <br>
&gt;&gt;&gt; My setup:<br>
&gt;&gt;&gt; Board: H3ULCB Kinfisher board<br>
&gt;&gt;&gt; Xen: revision dba774896f7dd74773c14d537643b7d7477fefcd (stable=
-4.15)<br>
&gt;&gt;&gt; <a href=3D"https://urldefense.com/v3/__https://github.com/xen-=
project/xen.git__;!!GF_29dbcQIUBPA!m4NHC2XbbSHWWZjQ7CX1ZZhaET6l0bQhZo581jtC=
mpst8E8JBp8Qri3haIaks6cbo7Ri$">
https://urldefense.com/v3/__https://github.com/xen-project/xen.git__;!!GF_2=
9dbcQIUBPA!m4NHC2XbbSHWWZjQ7CX1ZZhaET6l0bQhZo581jtCmpst8E8JBp8Qri3haIaks6cb=
o7Ri$</a>
<br>
&gt; &lt;<a href=3D"https://urldefense.com/v3/__https://github.com/xen-proj=
ect/xen.git__;!!GF_29dbcQIUBPA!m4NHC2XbbSHWWZjQ7CX1ZZhaET6l0bQhZo581jtCmpst=
8E8JBp8Qri3haIaks6cbo7Ri$&gt;[github[.]com">https://urldefense.com/v3/__htt=
ps://github.com/xen-project/xen.git__;!!GF_29dbcQIUBPA!m4NHC2XbbSHWWZjQ7CX1=
ZZhaET6l0bQhZo581jtCmpst8E8JBp8Qri3haIaks6cbo7Ri$&gt;[github[.]com</a>]
<br>
&gt; <br>
&gt;&gt;&gt; &lt;<a href=3D""></a>https://urldefense.com/v3/__https://githu=
b.com/xen-project/xen.git__;!!GF_29dbcQIUBPA!m4NHC2XbbSHWWZjQ7CX1ZZhaET6l0b=
QhZo581jtCmpst8E8JBp8Qri3haIaks6cbo7Ri$
<br>
&gt; [github[.]com]&gt;;<br>
&gt;&gt;&gt; Kernel: revision 09162bc32c880a791c6c0668ce0745cf7958f576&nbsp=
;(v5.10-rc4)<br>
&gt; <br>
&gt;&gt;Hmmm... 5.10 was released a few months ago and there are probably a=
 few<br>
&gt;&gt;stable release for the version. Can you try the latest 5.10 stable?=
<br>
&gt; <br>
&gt; Switched to tag v5.10 rev: 2c85ebc57b3e of <br>
&gt; <a href=3D"https://urldefense.com/v3/__https://github.com/torvalds/lin=
ux.git__;!!GF_29dbcQIUBPA!hJARiSsCASVNpAQxrnN-7sFsVHHTS39sjRraLqBkD6AoaCbpl=
goyiv-iCGlHhXafbPNc$">
https://urldefense.com/v3/__https://github.com/torvalds/linux.git__;!!GF_29=
dbcQIUBPA!hJARiSsCASVNpAQxrnN-7sFsVHHTS39sjRraLqBkD6AoaCbplgoyiv-iCGlHhXafb=
PNc$</a> [github[.]com]<br>
&gt; and got the same problem, that I see no output from kernel. All tests =
<br>
&gt; were done with earlycon parameter set in the kernel cmdline.<br>
The tag v5.10 is the first official release. What I meant is using the <br>
stable branch from <br>
git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git (branch <br>
linux-5.10.y).<br>
</blockquote>
<div>I need some time to download and build mainline kernel. I'll test this=
 scenario and send you results tomorrow.</div>
<blockquote itemscope=3D"" itemtype=3D"https://schemas.microsoft.com/Quoted=
Text" style=3D"font-size: 11pt; border-left-width: 3px; border-left-style: =
solid; border-color: rgb(200, 200, 200); padding-left: 1ex; margin-left: 0.=
8ex; color: rgb(102, 102, 102);">
&gt; <br>
&gt;&gt;&gt; <br>
&gt;&gt;&gt; <a href=3D"https://urldefense.com/v3/__https://github.com/torv=
alds/linux.git__;!!GF_29dbcQIUBPA!m4NHC2XbbSHWWZjQ7CX1ZZhaET6l0bQhZo581jtCm=
pst8E8JBp8Qri3haIaks29w69MC$">
https://urldefense.com/v3/__https://github.com/torvalds/linux.git__;!!GF_29=
dbcQIUBPA!m4NHC2XbbSHWWZjQ7CX1ZZhaET6l0bQhZo581jtCmpst8E8JBp8Qri3haIaks29w6=
9MC$</a>
<br>
&gt; &lt;<a href=3D"https://urldefense.com/v3/__https://github.com/torvalds=
/linux.git__;!!GF_29dbcQIUBPA!m4NHC2XbbSHWWZjQ7CX1ZZhaET6l0bQhZo581jtCmpst8=
E8JBp8Qri3haIaks29w69MC$&gt;[github[.]com">https://urldefense.com/v3/__http=
s://github.com/torvalds/linux.git__;!!GF_29dbcQIUBPA!m4NHC2XbbSHWWZjQ7CX1ZZ=
haET6l0bQhZo581jtCmpst8E8JBp8Qri3haIaks29w69MC$&gt;[github[.]com</a>]
<br>
&gt; <br>
&gt;&gt;&gt; &lt;<a href=3D""></a>https://urldefense.com/v3/__https://githu=
b.com/torvalds/linux.git__;!!GF_29dbcQIUBPA!m4NHC2XbbSHWWZjQ7CX1ZZhaET6l0bQ=
hZo581jtCmpst8E8JBp8Qri3haIaks29w69MC$
<br>
&gt; [github[.]com]&gt;;<br>
&gt;&gt;&gt; <br>
&gt;&gt;&gt; kernel config: see attached;<br>
&gt;&gt;&gt; <br>
&gt;&gt;&gt; dtb: see attached;<br>
&gt; <br>
&gt;&gt;Please avoid large attachment as they will be duplicated on every<b=
r>
&gt;&gt;mailbox. Instead, in the future, please upload them somewhere (your=
 own<br>
&gt;&gt;webserve, pastebin...) and provide a link in the e-mail.<br>
&gt; <br>
&gt; I'm sorry for that.<br>
&gt; <br>
&gt;&gt;&gt; <br>
&gt;&gt;&gt; <br>
&gt;&gt;&gt; If kprobe/uprobe events are enabled - I see no output after xe=
n switched<br>
&gt;&gt;&gt; input to Dom0, if disabled - system boots up successfully.<br>
&gt;&gt;The console subsystem tends to be enabled quite late in the boot<br=
>
&gt;&gt;process. So this may mean a panic during early boot.<br>
&gt; <br>
&gt;&gt;If you haven't done yet, I would suggest to add earlycon=3Dxenboot =
on the<br>
&gt;&gt;dom0 command line. This will print some messages during early boot.=
<br>
&gt;&gt;ing.<br>
&gt; <br>
&gt; All tests were done with earlycon parameter set in the kernel command =
<br>
&gt; line (xen, dom0-bootargs).<br>
&gt; <br>
&gt;&gt;&gt; <br>
&gt;&gt;&gt; Both configs work fine when I boot without xen.<br>
&gt;&gt;&gt; <br>
&gt;&gt;&gt; <br>
&gt;&gt;&gt; Dom0 information from Xen console shows that only one CPU work=
s, and PC<br>
&gt;&gt;&gt; stays in &quot;__arch_counter_get_cntvct&quot; function on rea=
d_sysreg call. //<br>
&gt;&gt;&gt; <br>
&gt;&gt;&gt; I did further investigation and found that kernel 5.4 doesn't =
have such<br>
&gt;&gt;&gt; kind of issues.<br>
&gt;&gt;&gt; After bisecting kernel,between 5.10 and 5.4, I found that outp=
ut<br>
&gt;&gt;&gt; disappeared on commit:<br>
&gt;&gt;&gt; <br>
&gt;&gt;&gt; 76085aff29f585139a37a10ea0a7daa63f70872c<br>
&gt; <br>
&gt;&gt; From the information you provided so far, I am a bit confused how =
this<br>
&gt;&gt;could be the source of the problem. But given this is not the lates=
t<br>
&gt;&gt;5.10, I will wait for you to confirm the bug is still present befor=
e<br>
&gt;&gt;providing more input.<br>
&gt; <br>
&gt; I was confused with this commit either. As I mentioned above, I've <br=
>
&gt; checked with the latest stable 5.10 kernel and still got the same prob=
lem.<br>
<br>
Thanks for the testing. I am not quite too sure where this may fail. <br>
Maybe Stefano has an idea?<br>
<br>
If you have an external debugger, can you use it to get a stack trace?<br>
Otherwise, I would suggest to add some xen_raw_printk() in the code to <br>
figure out where it may fail.<br>
</blockquote>
<div style=3D"font-size: 11pt;">Unfortunately, I don't have an external deb=
ugger right now (my testing board is placed in the different country).<br>
<span>Let me share with you the results of the investigation I've done, bef=
ore asking help from community. I haven't shared it before because I wasn't=
 sure it's related.</span><br>
</div>
<div style=3D"font-size: 11pt;"><span><br>
</span></div>
<div style=3D"font-size: 11pt;"><span>&nbsp;I've met error with no printk o=
n linux-bsp kernel taken from the latest renesas yocto release:&nbsp;<a hre=
f=3D"https://elinux.org/R-Car/Boards/Yocto-Gen3/v5.1.0" id=3D"LPlnk203591">=
https://elinux.org/R-Car/Boards/Yocto-Gen3/v5.1.0</a></span></div>
<div style=3D"font-size: 11pt;"><br>
</div>
</font>
<div><font size=3D"2"><span style=3D"font-size: 11pt;">My original kernel b=
ased on rev&nbsp;</span></font><font size=3D"2"></font><span style=3D"color=
: rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica, sans-serif; font-si=
ze: 12pt;">301d2c636929be96f3d87b1b5d287f87ed67a7be
 of linux-bsp kernel.</span></div>
<div><span style=3D"color: rgb(0, 0, 0); font-family: Calibri, Arial, Helve=
tica, sans-serif; font-size: 12pt;"><br>
</span></div>
<div><span style=3D"color: rgb(0, 0, 0); font-family: Calibri, Arial, Helve=
tica, sans-serif; font-size: 12pt;">I've added HYPERVISOR_console_io calls<=
span style=3D"caret-color:rgb(102, 102, 102);color:rgb(102, 102, 102);font-=
family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West European)&quot;, &quo=
t;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetic=
a Neue&quot;, sans-serif;font-size:14.666666984558105px;background-color:rg=
b(255, 255, 255);display:inline !important"><span class=3D"Apple-converted-=
space">&nbsp;
 to the code and got the following backtrace:</span></span></span></div>
<div><span style=3D"color: rgb(0, 0, 0); font-family: Calibri, Arial, Helve=
tica, sans-serif; font-size: 12pt;"><span style=3D"caret-color:rgb(102, 102=
, 102);color:rgb(102, 102, 102);font-family:&quot;Segoe UI&quot;, &quot;Seg=
oe UI Web (West European)&quot;, &quot;Segoe UI&quot;, -apple-system, Blink=
MacSystemFont, Roboto, &quot;Helvetica Neue&quot;, sans-serif;font-size:14.=
666666984558105px;background-color:rgb(255, 255, 255);display:inline !impor=
tant"><span class=3D"Apple-converted-space"><a href=3D"https://pastebin.com=
/E3X74tyZ" id=3D"LPlnk">https://pastebin.com/E3X74tyZ</a><br>
</span></span></span></div>
<div class=3D"_Entity _EType_OWALinkPreview _EId_OWALinkPreview _EReadonly_=
1"></div>
<div><font color=3D"#666666"><span style=3D"caret-color: rgb(102, 102, 102)=
; font-size: 14.666666984558105px;">It's a little bit messy, but still read=
able. I've added extra prints to the dump_stack function to be able to see =
backtrace. In this case, looks&nbsp;</span></font><span style=3D"caret-colo=
r: rgb(102, 102, 102); font-size: 14.666666984558105px;">like
 the problem is that system is unable to get free descriptor from printk_ri=
ngbuffer.</span></div>
<div><span style=3D"color: rgb(0, 0, 0); font-family: Calibri, Arial, Helve=
tica, sans-serif; font-size: 12pt;">In file kernel/printk/printk_ringbuffer=
.c, function desc_reserve, line:</span></div>
<div><span style=3D"color: rgb(0, 0, 0); font-family: Calibri, Arial, Helve=
tica, sans-serif; font-size: 12pt;"><br>
</span></div>
<div><span style=3D"color: rgb(0, 0, 0); font-family: Calibri, Arial, Helve=
tica, sans-serif; font-size: 12pt;">prev_state_val =3D atomic_long_read(&am=
p;desc-&gt;state_var); /* LMM(desc_reserve:E) */</span><br>
</div>
<div><br>
</div>
<div><font face=3D"Calibri, Arial, Helvetica, sans-serif">we get some&nbsp;=
</font><span style=3D"color: rgb(0, 0, 0); font-family: Calibri, Arial, Hel=
vetica, sans-serif; font-size: 12pt;">18446744073709551615 while expecting =
0.</span></div>
<div><br>
</div>
<div><span style=3D"display: inline !important;"><span><font color=3D"#6666=
66"><span style=3D"caret-color: rgb(102, 102, 102); font-size: 14.666666984=
558105px; background-color: rgb(255, 255, 255);">But the problem seems to l=
ay deeper because when I switched to the
 mainline kernel, it hangs on read_sysreg call in</span></font>
<p style=3D"margin: 0px; font-stretch: normal; line-height: normal;"><span =
style=3D"font-variant-ligatures: no-common-ligatures;"><span style=3D"font-=
family: Calibri, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(=
0, 0, 0);">&nbsp;</span></span><span style=3D"font-variant-ligatures: no-co=
mmon-ligatures; font-family: Calibri, Arial, Helvetica, sans-serif; font-si=
ze: 12pt; color: rgb(0, 0, 0);">__arch_counter_get_cntvct
 function.</span></p>
</span></span></div>
<div><span style=3D""><span style=3D"caret-color: rgb(102, 102, 102); displ=
ay: inline !important;"><span><br>
</span></span></span></div>
<div><font color=3D"#666666"><span style=3D"font-size: 14.666666984558105px=
;">Then I reverted commit&nbsp;</span></font><font color=3D"#666666"></font=
><span style=3D"color: rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica=
, sans-serif; font-size: 12pt;">76085aff29f585139a37a10ea0a7daa63f70872c
 and this fixed problem with no printk output.</span></div>
<div><font face=3D"Calibri, Arial, Helvetica, sans-serif">Now, with the com=
mit reverted, I see the kernel output with error&nbsp;<span style=3D"caret-=
color:rgb(102, 102, 102);color:rgb(102, 102, 102);font-family:&quot;Segoe U=
I&quot;, &quot;Segoe UI Web (West European)&quot;, &quot;Segoe UI&quot;, -a=
pple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&quot;, sans-s=
erif;font-size:14.666666984558105px;background-color:rgb(255, 255, 255);dis=
play:inline !important">CPU
 is in inconsistent state. Looks like commit&nbsp;<span style=3D"caret-colo=
r:rgb(0, 0, 0);color:rgb(0, 0, 0);font-family:Calibri, Arial, Helvetica, sa=
ns-serif;font-size:16px;background-color:rgb(255, 255, 255);display:inline =
!important">76085aff29f585139a37a10ea0a7daa63f70872c<span class=3D"Apple-co=
nverted-space">&nbsp;is
 the cause of no output issue.</span></span></span></font></div>
<font size=3D"2">
<blockquote itemscope=3D"" itemtype=3D"https://schemas.microsoft.com/Quoted=
Text" style=3D"font-size: 11pt; border-left-width: 3px; border-left-style: =
solid; border-color: rgb(200, 200, 200); padding-left: 1ex; margin-left: 0.=
8ex; color: rgb(102, 102, 102);">
&gt; <br>
&gt;&gt;&gt; <br>
&gt;&gt;&gt; <br>
&gt;&gt;&gt; Another issue, which was revealed after I got kernel output wa=
s kernel<br>
&gt;&gt;&gt; oops with message that CPU is in inconsistent state.<br>
&gt;&gt;&gt; <br>
&gt;&gt;&gt; [0.415612] EFI services will not be available.<br>
&gt;&gt;&gt; <br>
&gt;&gt;&gt; [0.420267] smp: Bringing up secondary CPUs ...<br>
&gt;&gt;&gt; <br>
&gt;&gt;&gt; [0.425185] Detected PIPT I-cache on CPU1<br>
&gt;&gt;&gt; <br>
&gt;&gt;&gt; [0.425267] Xen: initializing cpu1<br>
&gt;&gt;&gt; <br>
&gt;&gt;&gt; [0.425292] CPU1: Booted secondary processor 0x0000000001 [0x41=
1fd073]<br>
&gt;&gt;&gt; <br>
&gt;&gt;&gt; [0.425815] Detected PIPT I-cache on CPU2<br>
&gt;&gt;&gt; <br>
&gt;&gt;&gt; [0.425879] Xen: initializing cpu2<br>
&gt;&gt;&gt; <br>
&gt;&gt;&gt; [0.425899] CPU2: Booted secondary processor 0x0000000002 [0x41=
1fd073]<br>
&gt;&gt;&gt; <br>
&gt;&gt;&gt; [0.426362] Detected PIPT I-cache on CPU3<br>
&gt;&gt;&gt; <br>
&gt;&gt;&gt; [0.426425] Xen: initializing cpu3<br>
&gt;&gt;&gt; <br>
&gt;&gt;&gt; [0.426444] CPU3: Booted secondary processor 0x0000000003 [0x41=
1fd073]<br>
&gt;&gt;&gt; <br>
&gt;&gt;&gt; [0.426537] smp: Brought up 1 node, 4 CPUs<br>
&gt;&gt;&gt; <br>
&gt;&gt;&gt; [0.472807] SMP: Total of 4 processors activated.<br>
&gt;&gt;&gt; <br>
&gt;&gt;&gt; [0.477551] CPU features: detected: 32-bit EL0 Support<br>
&gt;&gt;&gt; <br>
&gt;&gt;&gt; [0.482745] CPU features: detected: CRC32 instructions<br>
&gt;&gt;&gt; <br>
&gt;&gt;&gt; [0.499470] ------------[ cut here ]------------<br>
&gt;&gt;&gt; <br>
&gt;&gt;&gt; [0.504034] CPU: CPUs started in inconsistent modes<br>
&gt; <br>
&gt;&gt;Looking at Linux 5.7 code, this is printed when not all the CPUs ar=
e<br>
&gt;&gt;booted in the same mode (i.e. EL1 or EL2).<br>
&gt; <br>
&gt;&gt;This is quite odd. So let me ask a question first, did you see this=
<br>
&gt;&gt;error during the bisection or on the latest 5.7?<br>
&gt; <br>
&gt; Switched to kernel v5.7 tag, rev:3d77e6a8804.<br>
<br>
Similar to 5.10, the lastest stable in the linux-stable repo <br>
<div>linux-5.7.y. If this still doesn't help...<br>
</div>
<blockquote itemscope=3D"" itemtype=3D"https://schemas.microsoft.com/Quoted=
Text" style=3D"font-size: 11pt; border-left-width: 3px; border-left-style: =
solid; border-color: rgb(200, 200, 200); padding-left: 1ex; margin-left: 0.=
8ex; color: rgb(102, 102, 102);">
<br>
</blockquote>
</blockquote>
<div><span style=3D"caret-color:rgb(0, 0, 0);font-size:small;background-col=
or:rgb(255, 255, 255);display:inline !important">I need some time to downlo=
ad and build mainline kernel. I'll test this scenario and send you results =
tomorrow.</span><br>
</div>
<blockquote itemscope=3D"" itemtype=3D"https://schemas.microsoft.com/Quoted=
Text" style=3D"font-size: 11pt; border-left-width: 3px; border-left-style: =
solid; border-color: rgb(200, 200, 200); padding-left: 1ex; margin-left: 0.=
8ex; color: rgb(102, 102, 102);">
&gt; On 5.7 kernel I can see printk output, but getting CPUs started in <br=
>
&gt; inconsistent modes error.<br>
&gt; Also, I tried with hmp-unsafe=3Dfalse ( in xen cmdline, so only 0-3 CP=
U <br>
&gt; were enabled. And still got the same issue.<br>
... can you print __boot_cpu_mode[0] and __boot_cpu_mode[1]?<br>
<br>
Cheers,<br>
<br>
-- <br>
Julien Grall<br>
</blockquote>
</font></div>
</body>
</html>

--_000_PA4PR03MB7136D3B811F820FC8A5AFF95E3E39PA4PR03MB7136eurp_--

