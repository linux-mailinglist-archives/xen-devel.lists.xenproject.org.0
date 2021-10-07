Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D5A1425A23
	for <lists+xen-devel@lfdr.de>; Thu,  7 Oct 2021 19:58:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.203910.359073 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYXdw-0006wh-TG; Thu, 07 Oct 2021 17:57:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 203910.359073; Thu, 07 Oct 2021 17:57:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYXdw-0006tt-PA; Thu, 07 Oct 2021 17:57:20 +0000
Received: by outflank-mailman (input) for mailman id 203910;
 Thu, 07 Oct 2021 17:57:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7uL+=O3=epam.com=prvs=0914b18df8=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1mYXdu-0006dD-8h
 for xen-devel@lists.xenproject.org; Thu, 07 Oct 2021 17:57:18 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ad78c608-140f-43ba-97fc-ad72cff4fd89;
 Thu, 07 Oct 2021 17:57:14 +0000 (UTC)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 197H3uCX022957; 
 Thu, 7 Oct 2021 17:57:11 GMT
Received: from eur05-db8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2106.outbound.protection.outlook.com [104.47.17.106])
 by mx0a-0039f301.pphosted.com with ESMTP id 3bj3am0jf4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 07 Oct 2021 17:57:10 +0000
Received: from PAXPR03MB7594.eurprd03.prod.outlook.com (2603:10a6:102:201::14)
 by PAXPR03MB7779.eurprd03.prod.outlook.com (2603:10a6:102:20a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Thu, 7 Oct
 2021 17:57:08 +0000
Received: from PAXPR03MB7594.eurprd03.prod.outlook.com
 ([fe80::24db:d530:e190:518b]) by PAXPR03MB7594.eurprd03.prod.outlook.com
 ([fe80::24db:d530:e190:518b%6]) with mapi id 15.20.4587.019; Thu, 7 Oct 2021
 17:57:08 +0000
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
X-Inumbo-ID: ad78c608-140f-43ba-97fc-ad72cff4fd89
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KC35jQqNx3a4SgOKr89I5KUtiMvvNBWzyhGfcXipsighzB7j+yKZ2+Fv5jOAWXLjbOCAFMKvOperX/hJSae6lXmhWhwAtyqsRm5XPB8AVaiIxJfzuGSzTQ+yj7T9Y4vTgQEaP3krj+jPuduRlExwsDuSUE9yn3h/gxi3UAZaB2savJ5zsMP3AEo/Epz5ANeHHCfS0gZAvsUeAXIB4u/V6OSnJmXGmA6ecR6v84gLm8pMs5SbXN7bmn6jFySgapP1YtUdmgF3Mzu/HisJjeMSLaDG0/8iHEBAbykGFx1SxOgJ+Q8pZE3tOLCfucftCUBSkzYWUnhtjraJQ6lBRmrdLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K8EISo5WwoNX9rPB/VLTqw0ZVyskXDLqo42UTwgybnk=;
 b=CIpApnB0pVwVwm71P69E2KSdvMjnpAeo4zDU3XhDHrJUM+Ds55fotKOtPVSoEz5RWBwp89uFdYj/Cr3pprpKoUdPzsA8iU4nwRrxwZalBBCQWVAIWkivy9OCwEN8e74LGPcr+TlxopJmyTXBY/486HrqrbJVcKGKNaH70zMQXZM3lfEbHh1W0R546RiunXiOdorCRWl/5t5Lqldf+KNI4V8iSJ9Q5IugDOk4A4hp1uw4oNoXTa5OwpOpGFgQOEDcs3R3vtdI0m/nk75BDYWeueF4GZpb+mTz3x6mSg/ljkPDoFmDm7LcapvKvCz71g9enyJfhwVZq2QR6zj8CeMPjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K8EISo5WwoNX9rPB/VLTqw0ZVyskXDLqo42UTwgybnk=;
 b=T/UQilBI8dPt/2UUW8+AnArw3moK1a1+7ac094Lv2hM9XXZ38C5eM6/N147ZvWR2XIGbPKRTg4VtoNjB8cu5SQeGwoGgU3yf4g2Ll23XTWw3paCidGz1T6mTn0r/oancwkgl4XgRHLa+EsHF7YNsTTqazzW6RqudYvtTdwhyFzMQlnNdF4DsqWo3FRce3DerirqGUo7yRzSeAkQgbvPP2AAgLTNid62FOL1p/wFYuagcg47akU1pbEmsWBeRm0DZnAWD/Fmy+4gtwGps5KSquCRI+53SnZg4hdxt/B5Mz5sHng25N5HQm352nAfH2HCpZtNm/4u5up5YOIa7tnOLUA==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Oleksandr <olekstysh@gmail.com>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Julien Grall <julien@xen.org>, Julien Grall
	<jgrall@amazon.com>
Subject: Re: [PING] Re: [PATCH] xen/arm: optee: Allocate anonymous domheap
 pages
Thread-Topic: [PING] Re: [PATCH] xen/arm: optee: Allocate anonymous domheap
 pages
Thread-Index: AQHXoyUNSkY32SPluU6N5DMbFmm656uyJ0MAgAAJFoCAE/PzgIAAsCsAgAESVAA=
Date: Thu, 7 Oct 2021 17:57:08 +0000
Message-ID: <87r1cwra4t.fsf@epam.com>
References: <1630935741-17088-1-git-send-email-olekstysh@gmail.com>
 <alpine.DEB.2.21.2109231308200.17979@sstabellini-ThinkPad-T480s>
 <87bl4jrovq.fsf@epam.com> <81f7699b-69c1-da52-a1a7-5000343bf872@gmail.com>
 <alpine.DEB.2.21.2110061639050.3209@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2110061639050.3209@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.6.5; emacs 27.2
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e53d690d-96be-416b-4be7-08d989bbe14a
x-ms-traffictypediagnostic: PAXPR03MB7779:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: 
 <PAXPR03MB77795E57E854ADEA15DBA6C6E6B19@PAXPR03MB7779.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 u2cDA+9fj146BLWSQqR29fpD03ZU3/bsuqOjHOErPT1x1JnpKT1pGJCkrclcgPsOBTCT4rTxj+fR42SInZFgyOnyA9Q6JcfNxrEy5eh7vpmIHEt+E9aF2Py2bydsGn/QUJKfP4n2Sdb6pJrx7kT+oCbrkgvgS6ukV/wrVXiwXrPpASqce9ulWDvg5UBPvUGUnCyBlLsnSKFRfMRG4N2rS3fetDHOwDbyP7VheJrCTWVKH8qCpQMu2mZXRn2deh/BpiousXvFfwguwa9nAK+YFAh8Dh4SMZIzANdDrAU5UvZSLVJ5g/nxChtYu2KQGmAN5DTosUFPmePIdcAe4z1eEeLJJPAG6BbJlBmJfAX7Xxu0vD08hspn0CJfw3NYOu/En47UY72XEVKGYd+ulKtDJIHizBBfnBOz/nq1HhXIExBnTJaj8iMTZytbQv8znGXcDBEsby0T+2Xa8mh5jYwxpD6e9eztdJI/6xnMtanp2J1WmHGT864r7TV4i/Az32eJfvnh10QKE6ucU+3rcyZCqPYDGUn1MjhwZqVyEC9lKgJsVMdRguRmWyEZTJ2Wx81giBxv3DjKR0xXVOg/GxsXmnyNVGHt0gX+DhcIPIBndbGq2TWCG0u/XmGJ221278ozcBelheGQcgM4K5p0aJcTbw75jTpeoHY1+7K4rRJec28OBVkg1hUXiz7ffjBt5lQRswCLE5iIoWfVLyj2LoEsNw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR03MB7594.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(4326008)(26005)(6486002)(38100700002)(122000001)(2906002)(83380400001)(8676002)(8936002)(508600001)(54906003)(6506007)(91956017)(6512007)(66556008)(55236004)(53546011)(66476007)(36756003)(66446008)(71200400001)(64756008)(5660300002)(66946007)(76116006)(86362001)(38070700005)(186003)(2616005)(316002)(6916009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?vdaiwgr1OC8rG37Oym4RjmHjSEdUJYrahR/qnPeyNIyENifJnkxBwAMLcN?=
 =?iso-8859-1?Q?2670e/QVzs63DDltHzZKYMp51q1uTXgB6xPb5rNxgtcF9zxkYK+PdFbTtW?=
 =?iso-8859-1?Q?Evkue75cMu6okjjLzNYIZG+qFRRkugzMOWwXrFmXNz/ZGcg/1Egr1gGBIK?=
 =?iso-8859-1?Q?SSNJVHgftljTbRRmkd3z1a35M9ooTn/m6Czy0tjAWheyregD206xz/RybM?=
 =?iso-8859-1?Q?aDXfDYhEBUpjhNhBvx3/MTXbWjiLhPWg3dFMqq4S4zwX2Cic/rzchRhElh?=
 =?iso-8859-1?Q?FTkRk7FGqrGSggZncF5pSmrVyRNvn1g4earmsRLkD1f1wbDrc/eqt1iQ1C?=
 =?iso-8859-1?Q?6CDyfIki/PkbWKYhpUTT/BmWlmZiozu4syGfhhwvY+abgTJnT57nZeXgRx?=
 =?iso-8859-1?Q?xr2F7lMifbkoAQ5Z+15kX4SJNZ+u4zZ7jqxctP1nPQBuH4xUJAgxwmi8DE?=
 =?iso-8859-1?Q?pZqh9uDy+OAa4t2b4beGYFNfc6PS3nRkhT73BABZ86rRna9IgMKKKnl5fQ?=
 =?iso-8859-1?Q?s0fuzYXTtHt88O9g8QsY2wnITT3CqnKW3XsO/N2v6Wyxh15MWabxH5cnw+?=
 =?iso-8859-1?Q?ySOjD/CQG3O444wBo2LQy09wyJegMXPDOx/iUAjihIT0gnkexko6Hi2b6/?=
 =?iso-8859-1?Q?wizoHyujrSWWYgk9h546EZ8ahYgKhRu1OluIWgDzQLvX6+dyKUDX8kZoxI?=
 =?iso-8859-1?Q?9Ks0ftSKTcXI1rUR3HqC/BqN7/ytId888G65bBuLgsb8LupNs2X42kQ9CI?=
 =?iso-8859-1?Q?zAh4FIxLvRpyznZBXJlnbYwJ7wVBReUdLEXElRLky4sFWbdbRAL5cbYUpz?=
 =?iso-8859-1?Q?nEpwIIrOlFPB/baS5UqnPY8F3TzXyLJ9fDK7nCRdBV4g+g3gxdDT0M3yJ8?=
 =?iso-8859-1?Q?s3Ydpj1m3UCaWxg/LbFqROJA550GTgzmbz5PXydnbsOHujnkF0Mjaht+HX?=
 =?iso-8859-1?Q?hqujEXKO1rx/LoM2G1jpfHLyUy1pviH3Rgpc0YKsb16s9QuEw7J9cD7IIl?=
 =?iso-8859-1?Q?vZ5tWesp1D0wBDewhWXHI4r+o779LXdFWRH15LPSS9RyzzMJqdZ6PfysPK?=
 =?iso-8859-1?Q?8fX9xs6MtYyp2yS9J9PcERe6pFTWDNCMHIktGdys6NsZ2FOBuYk3lEFNDH?=
 =?iso-8859-1?Q?FCnhy7uXIzBqgMEEw00+bBl8jgaCEjiU36gMB2ISplzuHnq0zcdq+R5z0a?=
 =?iso-8859-1?Q?KcycpEYbphglNVvbV7nharv7bC8T4JxkS2/F2R06Uuw3fyc7tPSMSlhIul?=
 =?iso-8859-1?Q?UFBMYVF6i4MAWPvFfd9uqqir6ueSCvfm0l7JbY6AlWZQ4cA85czR2zMu4J?=
 =?iso-8859-1?Q?Z+F4MZ3iUfo3WmN6bqt3T0PFhoGgBdYhSu/177ZLPeiHDzwF3TGbrBDatB?=
 =?iso-8859-1?Q?tzB5yucvzC?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR03MB7594.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e53d690d-96be-416b-4be7-08d989bbe14a
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2021 17:57:08.0322
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: b4/aV9QTJPdc43K79b5AXXGc8otWfC8MPlqV/eDRnqABLvMwC6eJBav1zX/z9ooPClLxT1Ta9RdRzidhScQYs7Q672f1lEUtiBkk8qDh7Hs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB7779
X-Proofpoint-ORIG-GUID: KWyNnFnHEoYzZJrs1mgf8Ua9XtYPWB7_
X-Proofpoint-GUID: KWyNnFnHEoYzZJrs1mgf8Ua9XtYPWB7_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-07_03,2021-10-07_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 mlxlogscore=999 suspectscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110070116


Hi Stefano,

Stefano Stabellini <sstabellini@kernel.org> writes:

> On Wed, 6 Oct 2021, Oleksandr wrote:
>> Hello all
>>=20
>> Gentle reminder.
> =20
> Many thanks for the ping, this patch fell off my radar.
>
>
> =20
>> On 23.09.21 23:57, Volodymyr Babchuk wrote:
>> > Hi Stefano,
>> >=20
>> > Stefano Stabellini <sstabellini@kernel.org> writes:
>> >=20
>> > > On Mon, 6 Sep 2021, Oleksandr Tyshchenko wrote:
>> > > > From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>> > > >=20
>> > > > Allocate anonymous domheap pages as there is no strict need to
>> > > > account them to a particular domain.
>> > > >=20
>> > > > Since XSA-383 "xen/arm: Restrict the amount of memory that dom0les=
s
>> > > > domU and dom0 can allocate" the dom0 cannot allocate memory outsid=
e
>> > > > of the pre-allocated region. This means if we try to allocate
>> > > > non-anonymous page to be accounted to dom0 we will get an
>> > > > over-allocation issue when assigning that page to the domain.
>> > > > The anonymous page, in turn, is not assigned to any domain.
>> > > >=20
>> > > > CC: Julien Grall <jgrall@amazon.com>
>> > > > Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com=
>
>> > > > Acked-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
>> > > Only one question, which is more architectural: given that these pag=
es
>> > > are "unlimited", could the guest exploit the interface somehow to fo=
rce
>> > > Xen to allocate an very high number of anonymous pages?
>> > >=20
>> > > E.g. could a domain call OPTEE_SMC_RPC_FUNC_ALLOC in a loop to force=
 Xen
>> > > to exaust all memory pages?
>> > Generally, OP-TEE mediator tracks all resources allocated and imposes
>> > limits on them.
>> >=20
>> > OPTEE_SMC_RPC_FUNC_ALLOC case is a bit different, because it is issued
>> > not by domain, but by OP-TEE itself. As OP-TEE is more trusted piece o=
f
>> > system we allow it to request as many buffers as it wants. Also, we kn=
ow
>> > that OP-TEE asks only for one such buffer per every standard call. And
>> > number of simultaneous calls is limited by number of OP-TEE threads,
>> > which is quite low: typically only two.
>
> So let me repeat it differently to see if I understood correctly:
>
> - OPTEE_SMC_RPC_FUNC_ALLOC is only called by OP-TEE, not by the domain
> - OPTEE is trusted and only call it twice anyway

Correct.

> I am OK with this argument, but do we have a check to make sure a domU
> cannot issue OPTEE_SMC_RPC_FUNC_ALLOC?

domU can't issue any RPC, because all RPCs are issued from OP-TEE
side. This is the nature of RPC - OP-TEE requests Normal World for some
service. But of course, Normal World can perform certain actions that
will make OP-TEE to issue a RPC. I discuss this in depth below.

>
> Looking at the patch, there are other two places, in addition to
> OPTEE_SMC_RPC_FUNC_ALLOC, where the anonymous memory pages can be
> allocated:
>
> 1) copy_std_request
> 2) translate_noncontig
>
> We need to prove that neither 1) or 2) can result in a domU exausting
> Xen memory.
>
> In the case of 1), it looks like the memory is freed before returning to
> the DomU, right? If so, it should be no problem?

Yes, mediator makes shadow copy of every request buffer to hide
translated addresses from the guest. Number of requests is limited by
number of OP-TEE threads.

> In the case of 2), it looks like the memory could outlive the call where
> it is allocated. Is there any kind of protection against issuing
> something like OPTEE_MSG_ATTR_TYPE_TMEM_INOUT in a loop? Is it OP-TEE
> itself that would refuse the attempt? Thus, the idea is that
> do_call_with_arg will return error and we'll just free the memory there?

Well, translate_noncontig() calls allocate_optee_shm_buf() which counts
all allocated buffers. So you can't call it more than
MAX_SHM_BUFFER_COUNT times, without de-allocating previous memory. But,
thanks to your question, I have found a bug there: memory is not freed
if allocate_optee_shm_buf() fails. I'll prepare patch later today.

> I cannot see a check for errors returned by do_call_with_arg and memory
> freeing done because of that. Sorry I am not super familiar with the
> code, I am just trying to make sure we are not offering to DomUs an easy
> way to crash the system.

I tried to eliminate all possibilities for a guest to crash the
system. Of course, this does not mean that there are none of them.

And yes, code is a bit hard to understand, because calls to OP-TEE are
stateful and you need to account for that state. From NW and SW this
looks quite fine, because state is handled naturally. But mediator sits
in a middle, so it's implementation is a bit messy.

I'll try to explain what is going on, so you it will be easier to
understand logic in the mediator.

There are two types of OP-TEE calls: fast calls and standard calls. Fast
call is simple: call SMC and get result. It does not allocate thread
context in OP-TEE and is non-preemptive. So yes, it should be fast. It
is used for simple things like "get OP-TEE version" or "exchange
capabilities". It is easy to handle them in mediator: just forward
the call, check result, return it back to a guest.

Standard calls are stateful. OP-TEE allocates thread for each call. This
call can be preempted either by IRQ or by RPC. For consistency IRQ
return is also considered as special type of RPC. So, in general one
standard call can consist of series of SMCs:

--> SMC with request
<-- RPC return (like IRQ)
--> SMC "resume call"
<-- RPC return (like "read disk")
--> SMC "resume call"
<-- RPC return (like "send network packet")
--> SMC "resume call"
...
<-- Final return

There are many types of RPCs: "handle IRQ", additional shared buffer
allocation/de-allocation, RPMB access, disks access, network access,
synchronization primitives (when OP-TEE thread is gets blocked on a
mutex), etc.

Two more things that makes all this worse: Normal World can register
shared buffer with OP-TEE. Such buffer can live indefinitely
long. Also, Normal World decides when to resume call. For example,
calling process can be preempted and then resumed seconds
later. Misbehaving guest can decide to not resume call at all.

As I said, I tried to take all this things into account. There are
basically 3 types of objects that can lead to memory allocation on Xen
side:

1. Standard call context. Besides memory space for struct optee_std_call
itself it allocates page for a shadow buffer, where argument addresses
are translated by Xen. Number of this objects is limited by number of
OP-TEE threads:

    count =3D atomic_add_unless(&ctx->call_count, 1, max_optee_threads);
    if ( count =3D=3D max_optee_threads )
        return ERR_PTR(-ENOSPC);

2. Shared buffer. This is a buffer shared by guest with OP-TEE. It can
be either temporary buffer which is shared for one standard call
duration, or registered shared buffer, which is remains active until it
is de-registered. This is where translate_noncontig() comes into play.
Number of this buffers is limited in allocate_optee_shm_buf():

    count =3D atomic_add_unless(&ctx->optee_shm_buf_count, 1,
                              MAX_SHM_BUFFER_COUNT);
    if ( count =3D=3D MAX_SHM_BUFFER_COUNT )
        return ERR_PTR(-ENOMEM);

3. Shared RPC buffer. This is very special kind of buffer. Basically,
OP-TEE needs some shared memory to provide RPC call parameters. So it
requests buffer from Normal World. There is no hard limit on this from
mediator side, because, as I told earlier, OP-TEE itself limits number
of this buffers. There is no cases when more that one buffer will be
allocated per OP-TEE thread. This type of buffer is used only to process
RPC requests themselves. OP-TEE can request more buffers via RPC, but
they will fall to p.2: NW uses separate request to register buffer and
then returns its handle in the preempted call.


Apart from those two limits, there is a limit on total number of pages
which is shared between guest and OP-TEE: MAX_TOTAL_SMH_BUF_PG. This
limit is for a case when guest tries to allocate few really BIG buffers.


> It looks like they could be called from one of the OPTEE operations that
> a domU could request? Is there a limit for them?

Yes, there are limits, as I described above.

Also, bear in mind that resources available to OP-TEE are also quite
limited. So, in case of some breach in mediator, OP-TEE will give up
first. This of course is not an excuse to have bugs in the mediator...

--=20
Volodymyr Babchuk at EPAM=

