Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26BCD75BB9C
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jul 2023 02:44:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.566818.886188 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMeFR-0004OU-Jl; Fri, 21 Jul 2023 00:43:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 566818.886188; Fri, 21 Jul 2023 00:43:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMeFR-0004La-H0; Fri, 21 Jul 2023 00:43:57 +0000
Received: by outflank-mailman (input) for mailman id 566818;
 Fri, 21 Jul 2023 00:43:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7rgW=DH=epam.com=prvs=15665e8a21=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1qMeFQ-0004LU-BJ
 for xen-devel@lists.xenproject.org; Fri, 21 Jul 2023 00:43:56 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aa44e08b-275f-11ee-8611-37d641c3527e;
 Fri, 21 Jul 2023 02:43:53 +0200 (CEST)
Received: from pps.filterd (m0174682.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36KHsIur013644; Fri, 21 Jul 2023 00:43:52 GMT
Received: from eur04-he1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2053.outbound.protection.outlook.com [104.47.13.53])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3ry11tbcyj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Jul 2023 00:43:52 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by PAVPR03MB9752.eurprd03.prod.outlook.com (2603:10a6:102:311::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.25; Fri, 21 Jul
 2023 00:43:48 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::68d2:d90f:ac32:7c85]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::68d2:d90f:ac32:7c85%3]) with mapi id 15.20.6609.026; Fri, 21 Jul 2023
 00:43:48 +0000
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
X-Inumbo-ID: aa44e08b-275f-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kxwknxcZOJUgpHshiiXafYmULwWywwdunJm2OClk+/mNDZS3VGHTxMxjEDkByjJ7vfqIpt0nNpKKT/h2ow1AR0tTV9ga+5ahHF9LoZ5DXdi3pTSBjcxyIyBvtUOgTibxwHbtHHi4sTtLW6K12ZrhtZV42XbuNtdKi1rJfnImjgzg3Jl/QOZuRF/ZV2cWkmV7KKjx/lmp/stV2Lzl1O6g0rBHnXZVnvF+d3bnwTjin4mSH9agFMpSlSnN60I8BFoOa0OKz7INXxLDAcyF7hgxKdmQhyjqP9ad30kxe5l1erWs5Aqa5uzWjjEcb0M20XVag8SqjtyNLBkBTrbYPxWEOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CO17EFDJgsFR9UJhz+9HOaYW0nSUraGFVT/+sQwxqVs=;
 b=Mr+8ommbMrkFalVRnDvy6/8EHSqTv2VU55gE0g5zI92rhUAfK3GjawaYIw67TrpvW4I3EvtdsqOMjzqydhCnxu+AAUMm9ZWHdbYum2lzRRxrHmenHrcLZj/5RgRDz7WeQI7fw7CA7gwX1s7FOZQrA6I2LG1JK39C1t4eQ+nhEnBfa8OB1mxOe1M8QoaeoQzchqDuGanx+iqPHDo9FLzDYOyilKdfH0M0IPxaLZ8y/kU1Xt41tuQywCbg0gK139RCVHHiiEAin6FR0auW0NkDejRMsF7OcwskS36fdcpZBRKKIWmnw/Qy1fzWYN5kL6HQc6ljpgVdEu8g3Je56fQGWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CO17EFDJgsFR9UJhz+9HOaYW0nSUraGFVT/+sQwxqVs=;
 b=VU+FlaFM2WL9wA+D+/SVnY9MVyUzbUVNVDiFkMvXG+Rc9t3QYrkFN6rZ9NLUilfgm77opq7X/IR/mJDmzy8BrIrd7F2O9q5ZFe82wYU4CaGZRw5KU9jg2/nvJZkgV1mwC3+T/E5WL6+ariR5n3cY4otONX4Z4jgAhuWXpnmCcyZw9Nn50FnJaKJVLnWMP7v5RVfTC0zVWvnGo5G1xVh8+qKE+3mBx68NcINtn6HzsIVzLM71kXQz+G8BLNv4XFw2Ewp+HvaJP7SWzF3/zjVBcc1zxDgRmYo9kdFVeS1mVF0KUygEvSxvsFBK1F6ryLTL+R4348PrFAHN34Z4vQv1wA==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v8 11/13] vpci: add initial support for virtual PCI bus
 topology
Thread-Topic: [PATCH v8 11/13] vpci: add initial support for virtual PCI bus
 topology
Thread-Index: AQHZuqGtdYewPbeaYUqE4k9SPFwhoq/CN8sAgAEqGIA=
Date: Fri, 21 Jul 2023 00:43:48 +0000
Message-ID: <87sf9idrgc.fsf@epam.com>
References: <20230720003205.1828537-1-volodymyr_babchuk@epam.com>
 <20230720003205.1828537-12-volodymyr_babchuk@epam.com>
 <414b65eb-1c28-7303-f9fe-cfe5713b9056@suse.com>
In-Reply-To: <414b65eb-1c28-7303-f9fe-cfe5713b9056@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.8.9; emacs 28.2
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|PAVPR03MB9752:EE_
x-ms-office365-filtering-correlation-id: 53bf8080-e228-48c8-1b9f-08db89838be1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 gTY69RMnidvQ4xdGdaBQsEFJ6vUZgT13CAluLpJRCu4sGzrLmGm8zEHbNA9eBL2ii012GEIuDtfdmkxOWJAosAAV0PVmAVXvVvPCsFBGqx0lCy/3u+/iNRphM7dGMVtdfTqR58QySfUE8Yg/6HF8hDQIMpST7VY2dn5o2E6nHwMop6s/zcXVHF36tosdhHDk2ZlOS2IW4aBR+tbV62Sa/rrwa2Udw0P2Mi9LMXl8m3URTzEU3jifgNpZvpXwsC+lukKUWvGvMIwHHB9RcGIXsQhs4YUqgGy3qpivLwAYO4ZBfxdADPhW4DAA8+qBG0FActaFQCusBCCUeJ+R1Lgkzq2M06etIudCY2NMzCt0IAFK+4yZBhJ0g1H21NwzienLnJsagknnwcEPZYYHy5p2iWjGax8gQKKvZkKW/dPQZ7WG8aeaPv3N5xDYk/+w+YvbpgCMFb8IYOCSxcwvHwpL4axENgbxHvxQQbX2J5u7SSttCHz6cMsPYFQY5KLUISIN8LFqtcUwg/vld1UxP9mnWfXropTs2dA/f3LfJ3757g6RCqvNHbrbDKoUpKxRhqvZ7g7/vrXoEL6q1lTAQV5X8Abn2nRdbN0OV5vIYO20bIZviBnB8ReY0YRc+697c+Qm
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(346002)(366004)(376002)(396003)(451199021)(76116006)(66446008)(66476007)(186003)(26005)(6512007)(316002)(71200400001)(4326008)(66556008)(91956017)(66946007)(6916009)(64756008)(6486002)(55236004)(53546011)(41300700001)(6506007)(5660300002)(54906003)(8936002)(8676002)(478600001)(2616005)(83380400001)(2906002)(38100700002)(38070700005)(122000001)(36756003)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?dm2LJ1GGww4o6suAqbL3HfAIqpEFUeRNsyzOS0DPwFgRjZFmsAQucqlpMQ?=
 =?iso-8859-1?Q?77BgFLEQunde4AQ28SiabAb1GRSUbJGmG+mQr1xXjeO8sFE/WUhgcg2V0F?=
 =?iso-8859-1?Q?D07mf5BvF3X/x3gP1BRkwaKqFnmf6mmQ1nNBlPKAUW97xSdCfX0tHCTzXe?=
 =?iso-8859-1?Q?BrQBkHST38vhPtxencuaGiWlyHLnvZnRdNCuNbx1EhloH5L7L4kMpUTgms?=
 =?iso-8859-1?Q?0IZ0MLEwENHqM9CJ9RErxZLk6KLco6nQPYlSTt7LsfdVGrh12RrrUjoe8M?=
 =?iso-8859-1?Q?Aottiz+oxsH1AalPVVhuM1IQUMiVzZV3pBxv0QCNkxehNVIMhS6PLSvhZb?=
 =?iso-8859-1?Q?OV8bDIwU4MNhAay7XjQgQsB0aOMnXzpfjE/D9vv15OHQkUNn+sKBnj6/Tc?=
 =?iso-8859-1?Q?JR3Nh4lMSyV6/dqI1koC0A2IIWgjyqiZnr18wwyR202L7hHwF3pYwQuNtp?=
 =?iso-8859-1?Q?xsxO5qBq+VGiZc4bL8iUK+M4pVY5YMo+JaclRYNmoPzW9puPYXY+wjYFqH?=
 =?iso-8859-1?Q?nZcH7bxiLWA4bx+RXvkial25a9WD/uDTN3N4mX1af6fTG8zDqjxiBiSUcv?=
 =?iso-8859-1?Q?23fIEk6V5RWTQLzhMZvIjY5d1UB6hyVtJZU5YBYel1wRmQ5NY7hS5aaluN?=
 =?iso-8859-1?Q?aWkq7ur+1nioy4BTtB7vI9lQ1qRtq02tDSFOhkPHi2mXgz5N5CFZnU7sLu?=
 =?iso-8859-1?Q?Qoy2AgbVeNyJr+RqnF44v+02k7Mzi/KYNgKt/HJYM6LnAM38TX0zIDxYH9?=
 =?iso-8859-1?Q?9/vQiCAQNkQADf85Efgx54cSYGxJVSmNET4wfU4xCAK4hWGgl/UD7p7J/m?=
 =?iso-8859-1?Q?IT4DCEk7OjxMyKeThejEgGAAEIHjT2ZUoVxr3A9oiWyofxCH6quYXKui3n?=
 =?iso-8859-1?Q?h0uRvuDCp/kN/rFkzKt6qX6CUKXJDPOXMeT/NT7mL6b4IovJaKIH0zSQru?=
 =?iso-8859-1?Q?8KBQNjShr9Ek1bJ1yryAyonPtOef2m3cdK2Uu+RsvXSjFKfK+lc3RBVR66?=
 =?iso-8859-1?Q?b7pgQVfihrDfJF1+p0k2QgBzSMOj0imB9mHq8gC+bYtCUxmuviTlK4Ph0k?=
 =?iso-8859-1?Q?5yUN1/qGij7UBt2l2VthYPFinXnMh5RZ21oT9xvzkkKgz1SXImiCblaJma?=
 =?iso-8859-1?Q?o3Ax8avQ28UdDLPpP1WO+mG4MKOmCV+2fuAcIdi+izrBwboE8HFwo1R24v?=
 =?iso-8859-1?Q?gR9ROFmXnNwygNaJpexViRzTGYna/4/vhXoo2ZtNk1JYg1U0OgLIz59Jvb?=
 =?iso-8859-1?Q?/PzEXEeAmt7lmitgUfC1igkIqrBmE3VVpoE/0cDhlgePT9/ol7OafKa/dr?=
 =?iso-8859-1?Q?ysocjcCWrPNUuJJQBiSOrLUijH6NAztQmwZnEqDQT4lmj8zJHzvsa0yrIf?=
 =?iso-8859-1?Q?CHkVLkwmdv2SFpag3Exo9QyeBif4OQwO3cpYIpvpN11IV8lLORZfE5Xn5q?=
 =?iso-8859-1?Q?HkK9FbO2afcpKrc8hcSUvlarNxp6QeM8Fqga5D4OMX1N0I5n19IVBKdxDJ?=
 =?iso-8859-1?Q?jMby5c779mPZ3E0akOOlsU3D+cUDCCCEOrhIcSdxXb9VTz81c/TFjqmZGS?=
 =?iso-8859-1?Q?xl0jLN8ztE6JFIN85c8pVvNZTJfML1+8LBEw+p3ENH5t7YnY0nQZ5P7NFt?=
 =?iso-8859-1?Q?BoboQ6S8nFDiKmN7dXu6FGBfv5VRE/Amtk5fyCSzQyCRHJRp7jNbk+xw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53bf8080-e228-48c8-1b9f-08db89838be1
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2023 00:43:48.3065
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DTJxdpSKWqgCGpetfTEikNTUXNPmaTDtiXVgSsSfmv+GafqShklKS5ul5bDxc1L4Bl24Bu0v4OuYBHlhoKog1ot6LsKQoKRX+jkfuh0BpoI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR03MB9752
X-Proofpoint-GUID: 5HA6wNa7M-rpdlQ5PgLcuAtmTyjFRPo8
X-Proofpoint-ORIG-GUID: 5HA6wNa7M-rpdlQ5PgLcuAtmTyjFRPo8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-20_12,2023-07-20_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 mlxscore=0 phishscore=0 clxscore=1015 impostorscore=0
 adultscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307210005


Hi Jan,

Jan Beulich <jbeulich@suse.com> writes:

> On 20.07.2023 02:32, Volodymyr Babchuk wrote:
>> --- a/xen/drivers/vpci/vpci.c
>> +++ b/xen/drivers/vpci/vpci.c
>> @@ -46,6 +46,16 @@ void vpci_remove_device(struct pci_dev *pdev)
>>          return;
>> =20
>>      spin_lock(&pdev->vpci->lock);
>> +
>> +#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
>> +    if ( pdev->vpci->guest_sbdf.sbdf !=3D ~0 )
>> +    {
>> +        __clear_bit(pdev->vpci->guest_sbdf.dev,
>> +                    &pdev->domain->vpci_dev_assigned_map);
>> +        pdev->vpci->guest_sbdf.sbdf =3D ~0;
>> +    }
>> +#endif
>
> The lock acquired above is not ...

vpci_remove_device() is called when d->pci_lock is already held.

But, I'll move this hunk before spin_lock(&pdev->vpci->lock); we don't
need to hold it while cleaning vpci_dev_assigned_map

>> @@ -115,6 +129,54 @@ int vpci_add_handlers(struct pci_dev *pdev)
>>  }
>> =20
>>  #ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
>> +static int add_virtual_device(struct pci_dev *pdev)
>> +{
>> +    struct domain *d =3D pdev->domain;
>> +    pci_sbdf_t sbdf =3D { 0 };
>> +    unsigned long new_dev_number;
>> +
>> +    if ( is_hardware_domain(d) )
>> +        return 0;
>> +
>> +    ASSERT(pcidevs_locked());
>> +
>> +    /*
>> +     * Each PCI bus supports 32 devices/slots at max or up to 256 when
>> +     * there are multi-function ones which are not yet supported.
>> +     */
>> +    if ( pdev->info.is_extfn )
>> +    {
>> +        gdprintk(XENLOG_ERR, "%pp: only function 0 passthrough supporte=
d\n",
>> +                 &pdev->sbdf);
>> +        return -EOPNOTSUPP;
>> +    }
>> +
>> +    write_lock(&pdev->domain->pci_lock);
>> +    new_dev_number =3D find_first_zero_bit(d->vpci_dev_assigned_map,
>> +                                         VPCI_MAX_VIRT_DEV);
>> +    if ( new_dev_number >=3D VPCI_MAX_VIRT_DEV )
>> +    {
>> +        write_unlock(&pdev->domain->pci_lock);
>> +        return -ENOSPC;
>> +    }
>> +
>> +    __set_bit(new_dev_number, &d->vpci_dev_assigned_map);
>
> ... the same as the one held here, so the bitmap still isn't properly
> protected afaics, unless the intention is to continue to rely on
> the global PCI lock (assuming that one's held in both cases, which I
> didn't check it is). Conversely it looks like the vPCI lock isn't
> held here. Both aspects may be intentional, but the locks being
> acquired differing requires suitable code comments imo.

As I stated above, vpci_remove_device() is called when d->pci_lock is
already held.


> I've also briefly looked at patch 1, and I'm afraid that still lacks
> commentary about intended lock nesting. That might be relevant here
> in case locking visible from patch / patch context isn't providing
> the full picture.
>

There is
    ASSERT(rw_is_write_locked(&pdev->domain->pci_lock));
at the beginning of vpci_remove_device(), which is added by
"vpci: use per-domain PCI lock to protect vpci structure".

I believe, it will be more beneficial to review series from the
beginning.

>> +    /*
>> +     * Both segment and bus number are 0:
>> +     *  - we emulate a single host bridge for the guest, e.g. segment 0
>> +     *  - with bus 0 the virtual devices are seen as embedded
>> +     *    endpoints behind the root complex
>> +     *
>> +     * TODO: add support for multi-function devices.
>> +     */
>> +    sbdf.devfn =3D PCI_DEVFN(new_dev_number, 0);
>> +    pdev->vpci->guest_sbdf =3D sbdf;
>> +    write_unlock(&pdev->domain->pci_lock);
>
> With the above I also wonder whether this lock can't (and hence
> should) be dropped a little earlier (right after fiddling with the
> bitmap).

This is the good observation, thanks.

--=20
WBR, Volodymyr=

