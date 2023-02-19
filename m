Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7137C69C2F6
	for <lists+xen-devel@lfdr.de>; Sun, 19 Feb 2023 23:37:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.497891.768676 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pTsHg-0006V6-MK; Sun, 19 Feb 2023 22:35:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 497891.768676; Sun, 19 Feb 2023 22:35:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pTsHg-0006SW-Ip; Sun, 19 Feb 2023 22:35:52 +0000
Received: by outflank-mailman (input) for mailman id 497891;
 Sun, 19 Feb 2023 22:35:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aZ04=6P=epam.com=prvs=6414846240=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1pTsHe-0006SO-P6
 for xen-devel@lists.xenproject.org; Sun, 19 Feb 2023 22:35:51 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bfe93de1-b0a5-11ed-93b5-47a8fe42b414;
 Sun, 19 Feb 2023 23:35:47 +0100 (CET)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31JIKx79013592; Sun, 19 Feb 2023 22:34:40 GMT
Received: from eur01-he1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2052.outbound.protection.outlook.com [104.47.0.52])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3ntkv5qvk0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 19 Feb 2023 22:34:40 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by VI1PR03MB6384.eurprd03.prod.outlook.com (2603:10a6:800:193::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.19; Sun, 19 Feb
 2023 22:34:36 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::967e:573a:15a9:176e]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::967e:573a:15a9:176e%4]) with mapi id 15.20.6111.018; Sun, 19 Feb 2023
 22:34:36 +0000
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
X-Inumbo-ID: bfe93de1-b0a5-11ed-93b5-47a8fe42b414
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MzLtdryCH5c9s0HtHWgwUvptzynmMKnvnSrU0UYZ6i2j33/+b/XQOxfPhC9pT0OyPtWFNfH/ww6XIIY5eZhiEjzKx2lwSC188zu2RjZnzHWNHeYk1Vm9997WSWUUkmPm+1AYNNtrZp7yp4n1RvDHbNLcyMxujcf17Pqk57JwlGnliT2QvxCY1oAPP7IvZsPUGc/yYX9MpoICa1R9wtlgIo91OaLwWuv78nrACLi7thrZ+k7XytuR2u8msCkfEk7q8E1h1leslzzJpoZ8gzh1DQWpNYjREGplH5/e/Aw4eaDwMbsQLaxuJPnWD1r4QvWBOQNtJVgTy+UwmJsRwpUKmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CJJTLYqy5XrjbcUncr8iEEgcJMinHUQfO4vbC4nZR24=;
 b=FzZTAiD1ArOGc2UXz5M7RuAZ3F0vu/etp997MbsTdDUMcizUPoCmShDnAp2mV5vj6Exbw9itoQWspWUPKNkQcoHy0eW4XWEpIeM29v+LlyX0GRWXks8m9g/uEsRlJVCDraahkrYUxvNC3oewEp6pBp9dqQ4I/J4M3dtR2dKglb8noAc6DI5lk3luoHOEgXB6uhqSCmPmQZ2JpzgTkJac5gJcEQk+b5b7MxmtTWMebOnZmLEQKcAfE4zk6Hbb/l3rlxZKNGLGYP5gjtq657144AF8oCJtWb7o9QUcTCdfRZ4SIppLovlb9OxNRPWmW0h/blwc7N8Ibe30ErWAM224YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CJJTLYqy5XrjbcUncr8iEEgcJMinHUQfO4vbC4nZR24=;
 b=lXvREBQkCU3tSQDefff8JJx2ZDQ/IXAd7V/BSubadEvmS8s67SBFjEIJRGoCmnqjmY+l5WAqQnMHxNWQC+zM5sAZOAfo2MTAdvH4JbjZJsGB6qKqNdff7W94VZpP6ivCSLSQQ5mc3bTcOzWIPNEN5iT8lNeGHXb0g0kEb9soaQ2bFnpytmZLdst3eNnREJb30wyA3PmFYNo080eOkFbZnPVlWeqEoWvUsVi/RcWZWxu22ulhDCNJpu9yF63TuEBDOV2ZCCDuGI0uYDW+ugNo2y+87Ei7ArXm6AxvJ1T92EzQG9XOowAGUn0GImQUKWoCDJVoxnR4k/bBj+i5Ymsteg==
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
Thread-Index: AQHYvUN+XE3jlJIvEkq5uMVpvnNlQq7Q5HaAgAKFNICAAGWNgIAEDL2A
Date: Sun, 19 Feb 2023 22:34:35 +0000
Message-ID: <87lekt1dz9.fsf@epam.com>
References: <20220831141040.13231-1-volodymyr_babchuk@epam.com>
 <20220831141040.13231-5-volodymyr_babchuk@epam.com>
 <a89db71d-dc4d-5b17-1528-4b8a4243addc@suse.com> <87sff512d2.fsf@epam.com>
 <0bbbb1c7-bc05-a28e-6573-6bfc5bb0ad28@suse.com>
In-Reply-To: <0bbbb1c7-bc05-a28e-6573-6bfc5bb0ad28@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.8.9; emacs 28.2
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|VI1PR03MB6384:EE_
x-ms-office365-filtering-correlation-id: d882e4c4-1262-4fec-3abe-08db12c97aa4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 pur7K7SkUXpmFy3dMwmV8F09+PLNTGktJbwdhrX6KgN/vBcBwpS8gDT4SOGOPDWxXeCA8wsmWtygDj2E1E3jwqhj1eqNVErBDlX+lsIpdq7g3MHEMWnI5GwKLMdpFAi0GsCgV8Vrq4ApwKNU0Eu3RxKFFgo6Af+L7bYTjjqnYU1tv7cmq+l/1+B8E9JY3ZGJ9Jh49QzAkJmMwJbZQiPT/JdY5VmVOvAP96U1Qg8jQL3ycHu/3kf8tNOOyte2f3RmDL5qjbLoiipVNnf61xpILVo7Bs8R08UXYhMG8J3f3AgmC0zgyQHd9I4t6qLhmFAwb9ENZDx5Xn0Y71SSglOfUoZn2ZPpRW+RzW35PoJkBzZ/GbtM03PaLxTvQliSd8kXwQSXrSgJ0GJ2ZVbxD3im1XC1XtBAslR0ciRh6+/LEACXn/4RLXV6P0QuJ+H4XdOPu8vYyFWc+CRurD0ZCs2uSX+YvCyKDujz7hM73ffgDHznUVer0LDuN5O19KSLTGKYwVdlaWd2jB4AoD1lH16+5fB9K87iawuJ3ZTJeTJSbxRfdl8Nd3ILsDDWZsYrGokl4kYelFPVbetIxoWTkHzhKi0+BOnK4jZmnGT/f3cbQVSRBWYj6RUgcqalRagQgg63nxZNMM6aaqjrLakPV+bw76eTQQWR6coC3SD+awTfejIE02YXJFpfC5XgvpDLN7OvfkGjiOAQFYCGIZXHfWGkZg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(136003)(366004)(39860400002)(376002)(396003)(451199018)(83380400001)(64756008)(66446008)(66476007)(66556008)(91956017)(66946007)(76116006)(316002)(8936002)(5660300002)(6916009)(8676002)(2616005)(41300700001)(54906003)(4326008)(53546011)(55236004)(26005)(186003)(478600001)(6486002)(71200400001)(6512007)(6506007)(38070700005)(36756003)(86362001)(2906002)(38100700002)(122000001)(66899018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?HuVdZ/HcrSg8vzBHGqYhmyuPdMsN08wepQo7rCmyF8UjNtYlUhELy5aGnb?=
 =?iso-8859-1?Q?3cr/jmUfJjEWGXc69Hk5WNSlZfeZl4h46Okolv1QOGk0f3aZQV62QhzqA0?=
 =?iso-8859-1?Q?zQz2qSdaiuRkRn3Pgdj/omY1ULdTFMGw604vTBorylFFgBfIAgVzVobYNv?=
 =?iso-8859-1?Q?Sva8ovKRmQDq9imgRjR22jY972EPijIq2Pt1R8FwJUWnlZWxYMNNdinxB2?=
 =?iso-8859-1?Q?B7LkhK8KJkLXSyR2doRDnDKT1z1Jveq2SfmaiVa6hur7qL3wPSeP4PceMM?=
 =?iso-8859-1?Q?HeEpNa6GUYcvLt/p7vK7hAKAggBKcUUqqpLLhjFpaeYUCq7RUuWXd9m1zW?=
 =?iso-8859-1?Q?Dkr3AFAzhKfE2QSY80DXgwOiSz174O8ndzFlURo0w0j2ELBi8Cy36V0JCx?=
 =?iso-8859-1?Q?04dg61NrKUf4Xeop/0gnHFdkYFJQaJbXKtHco5MULPf+ef/YCJSfFk9KCi?=
 =?iso-8859-1?Q?eC1vH7uaaPndILRK0nnWOWAzgt1UHp1sSTW8i4vrvjxAGRiagx96y0n/up?=
 =?iso-8859-1?Q?/cLBexgyuZ/E3XfaaXNPO1EdkJaCXt2AgD8qoyGHWjH/Qg7TiPwXxZ/lwq?=
 =?iso-8859-1?Q?xMuTils2+ZTOGOAceNaMk4SRr1akYYHoVIuMeEPSSsy4CSqmmn1HDMR104?=
 =?iso-8859-1?Q?d0TY474YMVC133mYgRt46ah/rCb62dWQX81626wUt/zAEwSjqAE6jwWT+8?=
 =?iso-8859-1?Q?a0oycFXDJVWmnJoVE9IAPWR59ninK4m4KzUP3B/9u74dgWyBP8y1mXP888?=
 =?iso-8859-1?Q?tMIhanNGrV0xTAWkZ8E+wnVVby7gSCNFPsHssM1EBV+5yb6N3PBk+aKyW2?=
 =?iso-8859-1?Q?QpPLb2Htx4BhrKpFFYG/C+7QpagqffZ9Iu+P+j2qkpv3w/1k7WLeuHmNTR?=
 =?iso-8859-1?Q?ssm99uqpglDIh2/rdZEaD4BORDSHxiC1JlCM8KXRNip7agtZQRaHNO/UQl?=
 =?iso-8859-1?Q?HPjju9JkE35/BJgJvLuTfjM72YAPfeqi15EwHsg+dKh9Scn+WzzYb7iZXa?=
 =?iso-8859-1?Q?DYkgJ+XAqKwUOwWMeOyhZOyvH7nBQZWhv3XzMtqaeNLm2JS2EV4/WZoIDX?=
 =?iso-8859-1?Q?8mjh6aglWvFaJJvEg8qLIFQ6WBAZXJjoVaYKQprJ4HyEPQw2oA62EePSWj?=
 =?iso-8859-1?Q?miJSAUq9qwE3s/5olb3+HkHaixVtsI2djBSZjx8kG6whgrhyhtCgrso/oV?=
 =?iso-8859-1?Q?wrb9I6+ThSvOK/YSrNvRsNMaANz2VkwaUoNHzN2A6pPTlfRV5J4xnlFCff?=
 =?iso-8859-1?Q?tSd7+WCq3kimeuqs2WXpmyKFRUmubbR5QuShIKwE27xMfHqdFB5KtvWMt/?=
 =?iso-8859-1?Q?5bX8b7f+o32TGRFUrypTi3QJL5GnelTbifB+EpREqWe4TyhelLkNxgndfk?=
 =?iso-8859-1?Q?5abhLeqAm/DnfkCnVHuZVSR6ZcjQa8PnEjVGd38mVUPqR1oaFYPHu8YdfZ?=
 =?iso-8859-1?Q?cQEitfO/RhMOonGhWIUMxS+2T9hzEV8C6NgwBuhvbsf5EVGvDpZYLCj7Q6?=
 =?iso-8859-1?Q?041cQ6smT8DUiK/5NWssIT/xN0nIj3O2wDOXo12EZDBMociluaJs0Dp8pw?=
 =?iso-8859-1?Q?I7PvSp4a//myzOjPIC42K/tdKem5MOOTalKoxImqPY1CpLCrv2q3S7nnxK?=
 =?iso-8859-1?Q?UPXqUd98OGLAc7cje80Yjg/T90+YZA/9FqDHPD6HcM2NYQfabvR8UmzA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d882e4c4-1262-4fec-3abe-08db12c97aa4
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Feb 2023 22:34:35.7898
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zoCu2B0riJgKADTVoMwPVBBYmnNzRMIRR0glBzObyIyjqxl8sIGRUZIr3b7qabUZ3h1eX6fPaBZCLlI1tbbjmevQCrzQ56kavMZx9pdwuGw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB6384
X-Proofpoint-GUID: Bzsnx803eKDnIu7YSN_z49y8StIcPYkB
X-Proofpoint-ORIG-GUID: Bzsnx803eKDnIu7YSN_z49y8StIcPYkB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-19_14,2023-02-17_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 mlxlogscore=999 phishscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302190215


Hi Jan,

Jan Beulich <jbeulich@suse.com> writes:

> On 17.02.2023 02:56, Volodymyr Babchuk wrote:
>> Jan Beulich <jbeulich@suse.com> writes:
>>> On 31.08.2022 16:10, Volodymyr Babchuk wrote:
>>>> --- /dev/null
>>>> +++ b/xen/include/xen/refcnt.h
>>>> @@ -0,0 +1,28 @@
>>>> +#ifndef __XEN_REFCNT_H__
>>>> +#define __XEN_REFCNT_H__
>>>> +
>>>> +#include <asm/atomic.h>
>>>> +
>>>> +typedef atomic_t refcnt_t;
>>>
>>> Like Linux has it, I think this would better be a separate struct. At
>>> least in debug builds, i.e. it could certainly use typesafe.h if that
>>> ended up to be a good fit (which I'm not sure it would, so this is
>>> merely a thought).
>>=20
>> Sadly, TYPE_SAFE does not support pointers. e.g I can't get pointer to
>> an encapsulated value which is also passed as a pointer. I can expand
>> TYPE_SAFE with $FOO_x_ptr():
>>=20
>>     static inline _type *_name##_x_ptr(_name##_t *n) { &return n->_name;=
 }
>>=20
>> or make custom encapsulation in refcnt.h. Which one you prefer?
>
> First of all, as said - typesafe.h may not be a good fit. And then the
> helper you suggest looks to be UB if the passed in pointer was to an
> array rather than a singular object, so having something like that in
> a very generic piece of infrastructure is inappropriate anyway.

Okay, no problem. I'll use a separate struct. Also, I played a bit with
compiler outputs. Looks like there is no additional overhead in reading
single value from a struct. So I don't think that we need an additional
non-debug implementation for this type.

>>>> +static inline void refcnt_init(refcnt_t *refcnt)
>>>> +{
>>>> +	atomic_set(refcnt, 1);
>>>> +}
>>>> +
>>>> +static inline void refcnt_get(refcnt_t *refcnt)
>>>> +{
>>>> +#ifndef NDEBUG
>>>> +	ASSERT(atomic_add_unless(refcnt, 1, 0) > 0);
>>>> +#else
>>>> +	atomic_add_unless(refcnt, 1, 0);
>>>> +#endif
>>>> +}
>>=20
>>> I think this wants doing without any #ifdef-ary, e.g.
>>>
>>> static inline void refcnt_get(refcnt_t *refcnt)
>>> {
>>>     int ret =3D atomic_add_unless(refcnt, 1, 0);
>>>
>>>     ASSERT(ret > 0);
>>> }
>>>
>>=20
>> Thanks, did as you suggested. I was afraid that compiler would complain
>> about unused ret in non-debug builds.
>>=20
>>> I wonder though whether certain callers may not want to instead know
>>> whether a refcount was successfully obtained, i.e. whether instead of
>>> asserting here you don't want to return a boolean success indicator,
>>> which callers then would deal with (either by asserting or by suitably
>>> handling the case). See get_page() and page_get_owner_and_reference()
>>> for similar behavior we have (and use) already.
>>=20
>> For now there are no such callers, so I don't want to implement unused
>> functionality. But, if you prefer this way, I'll do this.
>
> Well, I can see your point about unused functionality. That needs to be
> weighed against this being a pretty basic piece of infrastructure, which
> may want using elsewhere as well. Such re-use would then better not
> trigger touching all the code which already uses it (in principle the
> domain ref counting might be able to re-use it, for example, but there's
> that DOMAIN_DESTROYED special case which may require it to continue to
> have a custom implementation).
>
> What you may want to do is check Linux'es equivalent. Depending on how
> close ours is going to be, using the same naming may also want considerin=
g.

I wrote my implementation from scratch to avoid any potential licensing
issues. But, looking at Linux implementation:

There are two abstractions: struct refcount and struct kref. Struct
refcount is like atomic_t but with saturation to avoid wrapping. Struct
kref is built on top of struct refcount. It is tailored to handle
reference counted objects by having ability to call release() function
when refcounter reaches zero. Both kref_get() and refcount_inc()
functions return void.

My implementation has no separation on this two types - ref counter with
saturation and kernel object reference counter. My implementation does
only latter thing. It is a good idea to add saturation and I will do
this in the next patch version.

As for details on function prototypes and type names - I'll do as you
say. If you want refcnt_put() to return bool - no problem. If you want
this functionality renamed or aligned with Linux's one - just tell
me. From my point of view, right now we have minimal implementation that
covers all available use cases and can be easily expended in the future
to cover new use cases. For use cases I can see PCI, cpupool and maybe
couple of ARM IOMMU drivers. All others:

- get_domain() uses that DOMAIN_DESTROYED special case you mentioned

- {get,put}_page* does not use atomic_t all and rely on direct cmpxchg()
  call for some reason.

- OP-TEE code is happy with atomics due to complex logic

- {get,put}_cpu_var and put_gfn does not use ref counting at all=

