Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 278AB40F224
	for <lists+xen-devel@lfdr.de>; Fri, 17 Sep 2021 08:14:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.188900.338313 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mR77v-0008HG-Ha; Fri, 17 Sep 2021 06:13:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 188900.338313; Fri, 17 Sep 2021 06:13:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mR77v-0008FF-B1; Fri, 17 Sep 2021 06:13:35 +0000
Received: by outflank-mailman (input) for mailman id 188900;
 Fri, 17 Sep 2021 06:13:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KSMa=OH=epam.com=prvs=9894170f70=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mR77t-0008Ef-Sg
 for xen-devel@lists.xenproject.org; Fri, 17 Sep 2021 06:13:34 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 61aa9293-177e-11ec-b66d-12813bfff9fa;
 Fri, 17 Sep 2021 06:13:32 +0000 (UTC)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18H5xRrr024299; 
 Fri, 17 Sep 2021 06:13:28 GMT
Received: from eur03-am5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2055.outbound.protection.outlook.com [104.47.8.55])
 by mx0a-0039f301.pphosted.com with ESMTP id 3b4eyhgkhw-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Sep 2021 06:13:28 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM9PR03MB7298.eurprd03.prod.outlook.com (2603:10a6:20b:26c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16; Fri, 17 Sep
 2021 06:13:22 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994%3]) with mapi id 15.20.4523.017; Fri, 17 Sep 2021
 06:13:22 +0000
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
X-Inumbo-ID: 61aa9293-177e-11ec-b66d-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mfW8aEVabUB9BOQe0+rLofZBWk3gfegJbqs89l72WkixPQCdGptuo7MGYMV65M/8EUZgRZ1CooX3pbLsrdJA0+EAi8pGBiDbSmal0SuXQwcoNTcfhC9fBYDhw5MeWpvFTIXD3n/dyKRVJmpcT4NtNuUMb7IxHl7/azl2hGOgXMxGshJwNYiJMMSINndoG0BjUap34M4tEzO98B9ITQnln3hYHOldJtG4vw77QBXBdSXac/AKJ2ZJ9GUOeo12m0AT5xiBVP8SVnMMf6KTiDGE3iRWxUPz12m9XTe2tJFDufuDzo35SgS6+HtbTWkrkXbwrq9Nzzk5bWL1gHNmFpMj3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=o8wErlSaar3+Ph3dkvw6ArHP5WXhVZsLJbe9lTTMHLw=;
 b=eSztGXaLNov/m9SxtXsWgtrScwSaHEDeam4k0uSU0kFKZVwurKvadShx29nH0eODpK6xI2alQR5n+SyxD51/+oASJIkKzFhvll/vIWmZGsXJmsJgbseeGGVa5SgeLLwDXCOgkDiHMU/wTWl8eVVIFNfMY+9ju3R8B0laFj5Q64fAjh3Q3xNvzcDQMvDv4IMeHK2H89z6bsvq5Pq8UKepsv8MONOUeEGRgs0r9nEaZOSPLGZnuMh9dhNKe/PxZ8LnlSJp8ekMcs9cPolYsf2mukS1Bnxden8VN7Lu4OEc8mlXf0mxKZoVOZ0vb+zHHrTrTvSIllYSE2zM2sL7zfAM6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o8wErlSaar3+Ph3dkvw6ArHP5WXhVZsLJbe9lTTMHLw=;
 b=fY3ZjVxZaFHW+sMbugcyuddajZFuG7jOGJaZtVPiFDoGIU5cj7hGHWrCSxDdTN9h5AAnbC57kOMpbNQpkT4R7TXtxYmTWrpe2S1QmvE87Hyhc3HkAP18iow4SNm5mfrNFxdcdy17mC4hBMZ05UyI+nfAohLUJWoVZTVXe2AeyycEs/Pw/2Gwer42KVgg6OV6HXNEj2OKgA9wFWyWa+t/PVHoWLcm78TzLw97ZmrgUUraA9GK/C/o8xL//ZcbxDKmSRdY1dBB6A0MlD9kZJXzIEvRc3lhevpMj3huKm5lBiWPPFO60UuziWc2qQmOSaJHsXPTLFjbvsP9lzQ/hwolmA==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Rahul Singh <rahul.singh@arm.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "julien@xen.org" <julien@xen.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        "roger.pau@citrix.com" <roger.pau@citrix.com>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Oleksandr Andrushchenko <andr2000@gmail.com>
Subject: Re: [PATCH 09/11] xen/arm: Setup MMIO range trap handlers for
 hardware domain
Thread-Topic: [PATCH 09/11] xen/arm: Setup MMIO range trap handlers for
 hardware domain
Thread-Index: 
 AQHXoJ6eIuPEzuAZLUmx1GA90MGEBKudvyQAgAXn/ACAAP1GAIAAWBmAgACkJoCAAjRYgA==
Date: Fri, 17 Sep 2021 06:13:22 +0000
Message-ID: <e413eea9-b6ae-9cf8-66a6-f02fdcb645bd@epam.com>
References: <20210903083347.131786-1-andr2000@gmail.com>
 <20210903083347.131786-10-andr2000@gmail.com>
 <alpine.DEB.2.21.2109101308490.10523@sstabellini-ThinkPad-T480s>
 <6a4e6a1d-12c9-09bb-442d-ce7f6586ef89@epam.com>
 <20b0a8c0-10dc-7473-3c56-a9baeaa43e62@epam.com>
 <6EA9A8EE-8101-4679-832C-A912819891BC@arm.com>
 <alpine.DEB.2.21.2109151321030.21985@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2109151321030.21985@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4f148901-3a18-48a1-d99c-08d979a240b0
x-ms-traffictypediagnostic: AM9PR03MB7298:
x-ms-exchange-transport-forked: True
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM9PR03MB729805D9315E859BEC66E530E7DD9@AM9PR03MB7298.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 EK87Ldy5OguzKIazwVLqLGgeQt81OYM9Kq+BBmxk6lGTkCy1ffvlQSmgioi9Lx9FoVL2dr8hqdmVebgxWhLURnW/wp+F25px79PoFgPW/loFApBwfG60hXqb6WKIBA/jLHsNw9fcF4NV1SX6QURv0wnTP9weJCQsBec9VVS4HAKzcajFrPQFzqaWUYaQbq7rriwc6+bDXBb7jty4cD+tILwOlYe7q2n+mvNAZ+QVXXMEBFHwStSJdalLDXBX+vt11qs2S6RqyM2Uy/DzeHFV4UVdrWguuuGmJkMq6VvPJs4zb3rrbsEAaHa3oWAQ9tLyIDOGxe3qtNscT3NdByuGqBFR5ddlLOE/xjsZY0tZwFDxY5rgxPYc8sV6gtZuQbiR8KfZhzCikBqdCZ/XWmwqaUWDpJ3AQG+XdsVi4wTkJ61O7NPRgFyzlamNNKGH+T/I6aszvipWnYpCuNBgo+0AiNU5d9xu8e0st3LeRebwUaVLteizrY5wZpY+yOlxH9Y+bydnAVPMaCkTo+aLaZYiCfNM82r5uEPbVWffVWrTEa9htpD+2Js0PKYcFNv85MHkuATSfW6zJY5oZcVjkS2h5IRiEoFpr0CZOyIaK6WMuR8NE9xPfS7Jvz0ek0RoZQ+14V0Nxq7CrC6gcLhgXEkkg6SDDnVbvkSVlt3L7Vc6ugkyHVezGY1GeaEvPWp18pE6wzlPqAEIjvHTayOecstk+YycIADThvASMEGajX2iT3JMs258flEr6ArnyMdTx3louyJifABBIivldNhd5yBrF6lLjWMydmUTz0X5YdNj/36WcAOb5hrW9pvrwUuSeexh/XjH6GFNytnlDc9XOwgKsg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66476007)(66556008)(66946007)(5660300002)(86362001)(186003)(31696002)(91956017)(76116006)(36756003)(26005)(6916009)(8936002)(316002)(6512007)(6486002)(64756008)(83380400001)(66446008)(53546011)(31686004)(2616005)(54906003)(2906002)(71200400001)(38100700002)(966005)(38070700005)(8676002)(508600001)(122000001)(4326008)(6506007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?Windows-1252?Q?TSwWIxHEbUz3F6eRYjA7vVVf83sxLMIVCsVwGJqnPsCTPbZmu6FyFb68?=
 =?Windows-1252?Q?qY85xRQHwJ4xbncnYFJPpwhqeQdoG/ySK44CeDztKKMOIshiEysje633?=
 =?Windows-1252?Q?vtu6rRwwU7y3iXLJZdOygQD77Q08Q26t5VApSL+FMkiUAHSVq2LXDara?=
 =?Windows-1252?Q?YqF6/ivYPPkxmAiTArC/++/PzA4OavQ5EKyQr/QbsW6HMMKg/DTeQs9I?=
 =?Windows-1252?Q?Ci7XLrjSUd0vd4XPuKFoY+Q1DfgoS7sMC2jeWNQFRNdc7v+RadXrOnBi?=
 =?Windows-1252?Q?Pfo4kN5RUFmK1SIZFXVCAWXshHWukQOfR1fKQpK0AOyTsn0IybVyjsMI?=
 =?Windows-1252?Q?xlyg62ufuTPQUgcoUSqhAqXZpKJaJQXhHFpmHyAzymhR8dN5P7NOun0n?=
 =?Windows-1252?Q?I4MIIw5PVFLrnEtNyMYa5/4JUyTGdB7iQbubYw6Y5pclpJ1mbEwcbXT4?=
 =?Windows-1252?Q?WcO4H63hsKtpbnKvr9Q21WoQuJ/Wxmm/CbRNpXimBY0KPo4jB332Xh+x?=
 =?Windows-1252?Q?jNU79MMdmcVzT5H2etaP/D35zigLDjkDsvnBzV7oBcz8mSlQ64QUP1aK?=
 =?Windows-1252?Q?S1Izsg2tztVAthNMhHzcgWWoRib/leTvwxlacAIRFRi5ZSLBdNZYcuLS?=
 =?Windows-1252?Q?of8r+JzGZWQ1m3US5CGtW5j4xtNOK1IGcHzpjOijudB8VzL3MS0o05nq?=
 =?Windows-1252?Q?1f/25M9oibjqboj4uCxerxx1/FwbxnO4JPLLCv5yQFSoyE/adjV0Xrtp?=
 =?Windows-1252?Q?9MlnMpy/nhGG3/3FKYVzvQ5o5rabdYEE6aqhitIOZ2fwRjqHK+/0DV7G?=
 =?Windows-1252?Q?gaOWeQ6lyBDMgQNFZTIZ75iGlWOAOq/nB3VaFBD4uQqL2UxAfp1EWWNq?=
 =?Windows-1252?Q?Y2uBDfyt3poUQTXSQ6y8z4XdYkdCEqPwx7qZ9MSFyemWRNj++WEykAoi?=
 =?Windows-1252?Q?jnufIYW4XrHxqjuDQTTdzmOiTjA+0FFLtn11o60/bSO7cWhi8FGAn/L+?=
 =?Windows-1252?Q?4gq7G+537x2qDnf1coQfGtKKUiZU3Zs1QE0qihWx6Srk8LcG5XoJsTZ+?=
 =?Windows-1252?Q?4Q0Qu6UqFVwK8goqraIZIX7bhYd96ZCl/IU8vldApbvsf1kbk2Mg2vvs?=
 =?Windows-1252?Q?pjt9Vskt73Tn8EgGnSThRZm9d14wql/qMJIeelt9Ml0v7Ll/2TExyvlU?=
 =?Windows-1252?Q?bR7eNLqwHkwp6GJScLEJ8TBVkLm8IQxVKuC3y6St48E9p8Iz5j5cnn1a?=
 =?Windows-1252?Q?3NsEVESbl2LkoeSuQEO1jUaPbHWQOSr79zd/jNRR77IgeX4p/dMrQDjG?=
 =?Windows-1252?Q?R8qf/t6A7Yl4DIIpZUAM9WzRDTXV2OomSWkAPKX0a8ttOrg/i5z4M3l2?=
 =?Windows-1252?Q?7WV4R/D99yBkTZjtkiNOXZ4Ejbqr+uglB0HQxR61QrZkGuLpLFEEu1pU?=
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <2B44B73081C7394D82DBF62321EC10BB@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f148901-3a18-48a1-d99c-08d979a240b0
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2021 06:13:22.4947
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yiHqLErbKiboUH8Pm7uI3/ZaNWEhffttHJQ1p09tWYXMqKQeKG8W5gz4hXIm5dzRAdkFnk6bH/Xrp7baqpw6+A1XaZB79rGumHNlTZoI0IVBh8DKoUgwgQoLl7MXmHv7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7298
X-Proofpoint-ORIG-GUID: Sj2uQbxknBPftXChShWHbC65H4gwLHd2
X-Proofpoint-GUID: Sj2uQbxknBPftXChShWHbC65H4gwLHd2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-17_03,2021-09-16_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 mlxscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 spamscore=0 suspectscore=0 impostorscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109170038

Hi, Rahul!

On 15.09.21 23:33, Stefano Stabellini wrote:
> On Wed, 15 Sep 2021, Rahul Singh wrote:
>> Hi Oleksandr, Stefano,
>>
>>> On 15 Sep 2021, at 6:30 am, Oleksandr Andrushchenko <Oleksandr_Andrushc=
henko@epam.com> wrote:
>>>
>>> Hi, Rahul!
>>>
>>> On 14.09.21 17:24, Oleksandr Andrushchenko wrote:
>>>> }
>>>>>>    +static int pci_ecam_register_mmio_handler(struct domain *d,
>>>>>> +                                          struct pci_host_bridge *b=
ridge,
>>>>>> +                                          const struct mmio_handler=
_ops *ops)
>>>>>> +{
>>>>>> +    struct pci_config_window *cfg =3D bridge->sysdata;
>>>>>> +
>>>>>> +    register_mmio_handler(d, ops, cfg->phys_addr, cfg->size, NULL);
>>>>>> +    return 0;
>>>>>> +}
>>>>> Given that struct pci_config_window is generic (it is not specific to
>>>>> one bridge), I wonder if we even need the .register_mmio_handler
>>>>> callback here.
>>>>>
>>>>> In fact,pci_host_bridge->sysdata doesn't even need to be a void*, it
>>>>> could be a struct pci_config_window*, right?
>>>> Rahul, this actually may change your series.
>>>>
>>>> Do you think we can do that?
>>>>
>>> This is the only change requested that left unanswered by now.
>>>
>>> Will it be possible that you change the API accordingly, so I can
>>>
>>> implement as Stefano suggests?
>> We need pci_host_bridge->sysdata as void* in case we need to implement t=
he new non-ecam PCI controller in XEN.
>> Please have a look once in Linux code[1] how bridge->sysdata will be use=
d. struct pci_config_window is used only for
>> ecam supported host controller. Different PCI host controller will have =
different PCI interface to access the PCI controller.
>>
>> [1] https://urldefense.com/v3/__https://git.kernel.org/pub/scm/linux/ker=
nel/git/torvalds/linux.git/tree/drivers/pci/controller/pcie-rcar-host.c*n30=
9__;Iw!!GF_29dbcQIUBPA!kjkv6KIlvXOEgVaS6BNPRo0gyABihhO0XmNHRPFJaFAGhhTEuK1m=
IsWqPs0cXEipzkT_MmA-Eg$ [git[.]kernel[.]org]
>>
>> I think we need bridge->sysdata in future to implement the new PCI contr=
oller.
> In my opinion the pci_config_window is too important of an information
> to be left inside an opaque pointer, especially when the info under
> pci_config_window is both critical and vendor-neutral.
>
> My preference would be something like this:
>
>
> diff --git a/xen/include/asm-arm/pci.h b/xen/include/asm-arm/pci.h
> index 9c28a4bdc4..c80d846da3 100644
> --- a/xen/include/asm-arm/pci.h
> +++ b/xen/include/asm-arm/pci.h
> @@ -55,7 +55,6 @@ struct pci_config_window {
>       uint8_t         busn_start;
>       uint8_t         busn_end;
>       void __iomem    *win;
> -    const struct    pci_ecam_ops *ops;
>   };
>  =20
>   /*
> @@ -68,7 +67,8 @@ struct pci_host_bridge {
>       uint16_t segment;                /* Segment number */
>       u8 bus_start;                    /* Bus start of this bridge. */
>       u8 bus_end;                      /* Bus end of this bridge. */
> -    void *sysdata;                   /* Pointer to the config space wind=
ow*/
> +    struct pci_config_window* cfg;   /* Pointer to the bridge config win=
dow */
> +    void *sysdata;                   /* Pointer to bridge private data *=
/
>       const struct pci_ops *ops;
>   };
>
>
> As a reference the attached patch builds. However, I had to remove const
> where struct pci_ecam_ops *ops is used.

I'd like to know which route we go with this as this is now the last

thing which stops me from sending v2 of this series.

Thank you,

Oleksandr

