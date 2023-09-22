Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B998F7ABB98
	for <lists+xen-devel@lfdr.de>; Sat, 23 Sep 2023 00:03:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.607003.945153 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjoEh-0006VP-O7; Fri, 22 Sep 2023 22:02:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 607003.945153; Fri, 22 Sep 2023 22:02:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjoEh-0006SK-Ku; Fri, 22 Sep 2023 22:02:55 +0000
Received: by outflank-mailman (input) for mailman id 607003;
 Fri, 22 Sep 2023 22:02:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xvxl=FG=epam.com=prvs=362941c556=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1qjoEf-0006SE-NU
 for xen-devel@lists.xenproject.org; Fri, 22 Sep 2023 22:02:53 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c5c39d4f-5993-11ee-878a-cb3800f73035;
 Sat, 23 Sep 2023 00:02:51 +0200 (CEST)
Received: from pps.filterd (m0174683.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 38MGijC2028693;
 Fri, 22 Sep 2023 22:02:44 GMT
Received: from eur04-he1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2050.outbound.protection.outlook.com [104.47.13.50])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3t9eqeghhj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Sep 2023 22:02:44 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by GV2PR03MB9450.eurprd03.prod.outlook.com (2603:10a6:150:d7::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.23; Fri, 22 Sep
 2023 22:02:40 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::78ef:303c:8f74:957f]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::78ef:303c:8f74:957f%7]) with mapi id 15.20.6813.017; Fri, 22 Sep 2023
 22:02:40 +0000
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
X-Inumbo-ID: c5c39d4f-5993-11ee-878a-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oWhoxnP4hGRRASICsX60nPVkbdoobtmFE9+tmXW+lIStPJs2X3TO03aep4KWwszMkQADcm1B6Acsrw5FDMkijMcLVBQdHgIJFi1fCaqWYD5zspHoqDBOIQwyRxBXwjeYONMMCzHXrSjKaEVPGZAxfyq0kxsdUzsvxCunXJ2y2FeCyGNps1TNv+WKNvD4E+Kr2aViNs2y6scVZP2TAoOQX0unRxyDYXAENdy3TZRWiM4jl7ZjHppiUoZoOcOqFBAuCk66aVSArAv5OoQZWa7mkBsJQlFZiT6Qn+8PMlMbecmTctjSfvCCW8KyAAg8F8XGr4aoGXGxYt9Bcw3lw5qgeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YrnjRjeA70pd1e/P97qqXsmHPDfkXcLUyIaVep3si5U=;
 b=ArQkYikU86PgO/xXBhDzCjG52JTIz7ZFxXO35B7GXtvcsPYfP+bvisK3PRBWgHABRQgE26cGtsCA7ywyYEhMS8TH4FxrJCKda3l7M61L5SFnW6ahuNEH1EXOnC073IS006VIHWZTzauc0ICrB3gnlAbmtYcwqL0Rm3BjsYMtw7hBIQ5reCemds/qlo1JUW9pLLlGhuC8THp0k8JjNCQN1YiMRuAuT2zMpvRMugznbxFkg8eslHyy34r3kGiL6JAJax0GAxp/YCLYT+bUc4rHkSGsI0sV/U/a1G5pyMuUop6S4z2MUVyNyFzG56wizzkcEqRhS5aav09IXfOidolkDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YrnjRjeA70pd1e/P97qqXsmHPDfkXcLUyIaVep3si5U=;
 b=NonAeH/PZLEav1HzxkHqJQcyvTQWWpukeEJuGjs4AqJY3DKjtW29RXqg2IukXKPpDPu8kTjNUMPqhk01mGbdoXKHy46RPXTeIDb7yZ75PnS4jvj+VZ+pk2qUIWM8zyDBrWhjmQzTaOufRI4CciE2/rm8paYIjii6+IaF5SaZ3nlemYdmNHl9cJMqTsvvPUT+DF3EPEayHceFu4ocP14bM+Sibvg8yuhrh0G6Ih7t2lR9jJPjixCYP9UjVs02Khy1lSdQpEoTJMsLIhEJjZlHTfwpwPrdkpNsD2sl87a0cT2nw9HQIf0X1jNetQ9dQ6Qj/+Ox0qh6VyfAwHK9UOxL5A==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Marc Zyngier <maz@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Stewart
 Hildebrand <stewart.hildebrand@amd.com>,
        Stefano Stabellini
	<sstabellini@kernel.org>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Julien
 Grall <julien@xen.org>
Subject: Re: [PATCH v1 2/3] ARM: GICv3 ITS: do not invalidate memory while
 sending a command
Thread-Topic: [PATCH v1 2/3] ARM: GICv3 ITS: do not invalidate memory while
 sending a command
Thread-Index: 
 AQHZ6ux4LpE3chDIj0mOPudUv9951bAiHTaAgAAZXICAAA0EAIADt3gAgACvAICAAMDUgA==
Date: Fri, 22 Sep 2023 22:02:39 +0000
Message-ID: <87v8c1euip.fsf@epam.com>
References: <20230919112827.1001484-1-volodymyr_babchuk@epam.com>
 <20230919112827.1001484-3-volodymyr_babchuk@epam.com>
 <1614d73f-72b0-44f2-8e34-0e6c58a1a375@xen.org> <87fs3afcxb.fsf@epam.com>
 <597db9f5-b959-4b75-9410-0d0c16e3acda@xen.org> <875y43f45p.fsf@epam.com>
 <86wmwio5x8.wl-maz@kernel.org>
In-Reply-To: <86wmwio5x8.wl-maz@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.10.7; emacs 29.1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|GV2PR03MB9450:EE_
x-ms-office365-filtering-correlation-id: 43913f52-dfba-429d-9eb3-08dbbbb7a374
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 oLgd88aKA/IjJU9t8NAYLkhaUZLWdB6EjIeqOlsC/yqHUrWmwJpBWpeKIhaMAoaaPkHjeFZu1jQ1RCJFylJVtduM/G0+6NwUijQ7Qmj/Koyc5gE/QezEN3fd+9qYXrhQJcxCYPbeXXMfBGzpI1SPEfIdxzcclzLUnenyJ6lM9lmcQMqHcbrudvg3HmHoMo8weAh0VUotqmEehWhkX+uSa6aj1R94lMxP6wdzdEl7+5bkNS1ZrPOL0BWT93AEBUNQmHvrXdwhcBPc/v5PTSVCw5VFFjbHvbUmB9AX82Tgtb+TGSzvu2b64gYfE6fFahzXSONUjw84L0GUeKtPjM8NdN/NDgRY92l7N+tvExmQ5OJXpV2UNyZT4m1ef3zY3yHBWSHNlGOkk3icijLElLqVG0LGXzrxEFY0fpWD7Xd1zxGPQ9EA1rW/Sl7fpAGFXThJgfB/qmtJrVl9nHodZIFrykw3HumqSAU47YmyfB6jrdmyJ/tOvc5JwRT+1WFomvbibV1k9GVjp4HIekSQ4b+uEeD1mTVrxp6ssc9o2N7/c3GOlOb39yByZlHvVM9R7JRJxXwUv/iVEAcwbhZR+j5ocCQUeJVCcSxoRVOneRNXaFTg8O6aWjCoGfHPJP95o+GD
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(39860400002)(346002)(366004)(136003)(451199024)(186009)(1800799009)(38070700005)(71200400001)(478600001)(38100700002)(83380400001)(2616005)(86362001)(26005)(6512007)(6486002)(55236004)(6506007)(8676002)(41300700001)(122000001)(64756008)(8936002)(66556008)(2906002)(5660300002)(66476007)(66946007)(54906003)(66446008)(36756003)(76116006)(6916009)(91956017)(316002)(4326008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?XBmdeqgH/v3K2UeRNxfoaLWYD95qCYC8RPAHg1/fixhQhb8fV9iKrFgw31?=
 =?iso-8859-1?Q?Cn/MHOoT3nDk07Yfi85DCVXyqqMDjHHFXbCS8Wn839oLMNm3PSDWbklKGd?=
 =?iso-8859-1?Q?VD7AmnvzcVldCkHbsakJrIhM7eP6rGv+C7IKt2fisMu0+Ltsz9xqLBnOVE?=
 =?iso-8859-1?Q?oGB0Jvi8uB4+t7ZHEuoVmiBkpRwfA+/w0sRxav0CwKRUPuA+Qj14zIlwhY?=
 =?iso-8859-1?Q?0FU2NmEmGmkfsN64i2vjyCBYdd0p+hSd2ViLptB0Yg+xkVywgAxIOuSegE?=
 =?iso-8859-1?Q?eDiiEbvK0u2tYlClHV1CQz7pVvrVxaiR5EyrwMPI3/m/zeMBnop6pqD6Bp?=
 =?iso-8859-1?Q?EGekoFtwUCLMUer1Jedn9j93b7ukG4UwmNYY50nrkQWmeSNn1lHL9cctIR?=
 =?iso-8859-1?Q?EcQOS5GIJQYiSdi8XiQGCGGl+dMwhVELf81AiqZ4r26XSmbzNfmTUTbJ2A?=
 =?iso-8859-1?Q?isE81KD07+7cebD2zbJJMgROraCbIU/Xq01JrXRxPC+wqoJlT2I4uZ4YdP?=
 =?iso-8859-1?Q?FtVu07Z2Ib72EVpcfL7VQlGtMelGdiceAg16IVUCnZev8MBIMDn9kWMWu8?=
 =?iso-8859-1?Q?wUlsuQgPoGmpn9bm1sA36yH2pZDipNs2JJTwT/wKK2qtW3zXx4XAqjNVJo?=
 =?iso-8859-1?Q?q0fU0Rhr/PBkpnXsJ0KMXgj39SV6AfTzDLSix+zE3YPJlaNJu7iXWuHcOv?=
 =?iso-8859-1?Q?+QFF292SMqUyAFY22QUrHRV+j+neON2GBZ6N+Tyu1TGA4WT4PbRMBIRBoM?=
 =?iso-8859-1?Q?506oJJpKSbuUlOOgqQqv7yX1CaCY8gavhBsAW3HPY+55Sk0Oh2hguEPUNV?=
 =?iso-8859-1?Q?YUyv9/+w/1ghNgV+jXs5mY51ajjAoqnPg2UU5WcDQPI/I2JXDDEuTR3ers?=
 =?iso-8859-1?Q?vjTsR1CKKhlqTLF0Y7hNMSrea9s1NQCttElOnvLr3Idr6EzDLVr7eyyHm/?=
 =?iso-8859-1?Q?oaqn+Hb2QdaSxfL9/j7gCA6H9HY9bAWzWUwBhvY3r+jQCjr+Fw/Z3fxtbD?=
 =?iso-8859-1?Q?nTGRhQ+bwkMp1dl5W1KlIIrczuLwZ8ikS7wczdQKU1MHThJoUSKC50Yaic?=
 =?iso-8859-1?Q?wtQIOmXMKk68WxxJttJduBS1gSUxkeLvqK247xHoLGXizkw5D0t012KK9K?=
 =?iso-8859-1?Q?pD0tOQF7NO/ROm1JYHBIogfql71aAz73+0fPx9LdpyHu3SBOq+Gnho+DLh?=
 =?iso-8859-1?Q?yS48vIIPxf+HLbbJE0Tn+Ls0+qu+1YMcCgf9T4TGUc9yU4hit/qVvmjnXV?=
 =?iso-8859-1?Q?9Eu02a4KsBHevOt/tdJjCfrHWNts69q/0fgHc8dSbp9d45Ka+QEf5uhDEx?=
 =?iso-8859-1?Q?+4v0mKLKkjJJCiKcf5kJZpB6UthUuwIcaEbkQaS2llDxT2AXWl2s9cLcio?=
 =?iso-8859-1?Q?jXyBV6R+2qkLRyLsJs2Y1RUNh1LwaIH46eT+srmmVJjT20FVYhn2uCEMBR?=
 =?iso-8859-1?Q?NvVASZCEERooHe7BqNT4vG/bKn6kqBz6BM2IaJtVkOYfkVep/Bs66+tUu2?=
 =?iso-8859-1?Q?HcwMOXKL9LU7BQDoENw1hQJtNYKehOWx6N3JpaDfemC0x+lsjm9z9/dl6g?=
 =?iso-8859-1?Q?eXyAd4P3bXkkZ9ocG+DVaR7N4nxSiwQjDwF8sQtRg22J30fyefJ6BmJIEj?=
 =?iso-8859-1?Q?mj2ogrhH0gEZ4r5jiwnAZ7J53X27fEmKA5rxec28L4Qr3lerg2t6K69Q?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43913f52-dfba-429d-9eb3-08dbbbb7a374
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2023 22:02:39.8492
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OypXTrO01kLa2hTNG0qVA7rtYHyPxpkvzpA/JzmxiZPP3DVo+sjMNL+WxwR9jgDMLXqlM9t0Pjmm49zweDJ0jp1BxSVQPctity4Z/0Cl68k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR03MB9450
X-Proofpoint-GUID: Zk2IJEgEzsmzKs66AmMJAu_MHhXbzCIE
X-Proofpoint-ORIG-GUID: Zk2IJEgEzsmzKs66AmMJAu_MHhXbzCIE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-22_19,2023-09-21_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 clxscore=1015 malwarescore=0 phishscore=0 mlxlogscore=659
 mlxscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2309220188


Hello Marc,

Marc Zyngier <maz@kernel.org> writes:

> Volodymyr,
>
> On Fri, 22 Sep 2023 01:22:11 +0100,
> Volodymyr Babchuk <Volodymyr_Babchuk@epam.com> wrote:
>>=20
>>=20
>> Hi Mark,
>
> s/k/c/

Oh, I'm sorry.

>>=20
>> I am writing to you, because you are GICv3 maintainer in Linux. We are
>> updating ITS driver in Xen and we have a question about cache
>> maintenance WRT memory shared with ITS. As I can see, the Linux ITS
>> driver uses gic_flush_dcache_to_poc() all over the code. This boils down
>> to "dc civac" instruction which does both clean and invalidate. But do
>> we really need to invalidate a cache when we are sending an ITS command?
>> In my understanding it is sufficient to clean a cache only and Linux
>> uses clean&invalidate just out of convenience. Is this correct?
>
> It really depends how you look at it. We use DC CIVA as the standard
> way to give a buffer to a device, as that's what the DMA API
> does. Switching to a simple clean is possible, but I don't really see
> what it brings you.
>
> ITS commands are usually written as a single command followed by a
> SYNC/VSYNC. That's a total a 8 64bit words, which makes a cache line
> on 99.999% of the implementations.
>
> What do you gain by keeping the cache line around? Not much. By the
> time you go around the command queue and need the same data again, it
> will have been evicted from your L1 already.

This is a great point. Thank you.

--=20
WBR, Volodymyr=

