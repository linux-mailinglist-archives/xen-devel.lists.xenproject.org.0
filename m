Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 709428D6898
	for <lists+xen-devel@lfdr.de>; Fri, 31 May 2024 19:56:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.733819.1140128 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sD6UT-0000zM-V9; Fri, 31 May 2024 17:56:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 733819.1140128; Fri, 31 May 2024 17:56:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sD6UT-0000wk-S0; Fri, 31 May 2024 17:56:33 +0000
Received: by outflank-mailman (input) for mailman id 733819;
 Fri, 31 May 2024 17:56:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bCkY=NC=epam.com=prvs=288140c18d=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1sD6US-0000wY-Ip
 for xen-devel@lists.xenproject.org; Fri, 31 May 2024 17:56:32 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1bce38e9-1f77-11ef-90a1-e314d9c70b13;
 Fri, 31 May 2024 19:56:31 +0200 (CEST)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44VHuK2s029588;
 Fri, 31 May 2024 17:56:20 GMT
Received: from eur04-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2044.outbound.protection.outlook.com [104.47.14.44])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3yfkd0g001-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 May 2024 17:56:20 +0000 (GMT)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by VI2PR03MB10738.eurprd03.prod.outlook.com
 (2603:10a6:800:272::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.16; Fri, 31 May
 2024 17:56:16 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%3]) with mapi id 15.20.7633.001; Fri, 31 May 2024
 17:56:16 +0000
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
X-Inumbo-ID: 1bce38e9-1f77-11ef-90a1-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c9Ox6HNUuaq/U+vnoC/ewPWvfe4c1iRmXQGPvXGL7RpR0ubmJjHnVTDyzH17dIZ6kPVsTAFejGPPCgqYGvqSR5EDG8kUjaUVS4NZN+6kigRQ1sLcCn4076Er1HJLOyNprOHYl3WuqWnhQFBNGTJ/Ziiyw7NkLQjLD+ZX5PQy97gp8fHkjPdtdPqMEr9rUFNzthlnhX9Zr43Ppsyy0AmJqHAQzoiqUvyQfWwRqAuM6/KaNzebPLlKt6I1Vb/f6cyOf7RVmT6qPMUcDH2cxL2nV8+TvchutIZO/CHja+YYJqAnHsrPf94RiTIDmvfHbpZgxH/iEvsN6lMiopCZRDzW9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S8snQEhOQFqU11fm4e3rbBUwlkvRc+kZu7Ez7QA0yKg=;
 b=CUssqmKU1v1zlvVSXIPdW2i2KLBkIYgv3HZlDD2bugDkvBnZI5gMPju8wjqdhDA0puYTIRA8jVYB/6XXFMVDysqdKNCb71D9k/mDwX4dD81r7qVU819NbzRSelzGA/ShEiKDgQusMUoeUWfwbHiXmMP3y+wvmxNyH5uXW7YkraxvRKP7HGAT7GkWLRbRV9mFJhYmtM64R2ryIhtZHKjsxQWJnmgKJqgwqrbBTw03um57Q84fkPUYxsjF4dBFrXSHpDDh5IpaULlTFnJ0myCYOHpTMxkv8JSaNy0aMmceQ+9lsE+BPDOJcRc7ND+Wcd3xV87NrFqCpA2pwBZbMB2niA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S8snQEhOQFqU11fm4e3rbBUwlkvRc+kZu7Ez7QA0yKg=;
 b=hk9Y5U+A9D3En5BlXTqWpoXhzO+8ttPfDeME0nDO/rZXPGDBFTSNqY90Bmn1qX+HMwTdYtlZQ3hHRR1KWPF14ZBqjkARVCfTxPUcyAmZ1Yuy/fX3ee/dVOSTjg5sUknl+5hqS9dWdqg3rz/fgSYYR/ASSU48vGLwVCVx86i7a3VO7407c1SrgKNh4fe99l77bNNlCJQ4Yafy5l3VHZV6nUWNcAmZnmoloJ+qf7AkGL5S9TP67s/1NCwaecwot8pRrBjh8VqwrJ0/unmLjGa7jJv5f9sgAyFeyVJp/C++tO6OlirUzjWOKAUVRi6Wqlx9txHZVgcKjr24YRBIhX9pjA==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Stefano
 Stabellini <sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>,
        Bertrand
 Marquis <bertrand.marquis@arm.com>,
        Michal Orzel <michal.orzel@amd.com>
Subject: Re: [RFC PATCH v2] arm: dom0less: add TEE support
Thread-Topic: [RFC PATCH v2] arm: dom0less: add TEE support
Thread-Index: AQHas4LmA3+MKr53jE6Kc+pdYgdQGLGxoCWA
Date: Fri, 31 May 2024 17:56:16 +0000
Message-ID: <871q5hyif4.fsf@epam.com>
References: <20240531174915.1679443-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20240531174915.1679443-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.10.7; emacs 29.3
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|VI2PR03MB10738:EE_
x-ms-office365-filtering-correlation-id: b94ced4d-bd77-4646-1aea-08dc819af82d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|366007|1800799015|376005|38070700009;
x-microsoft-antispam-message-info: 
 =?iso-8859-1?Q?c/BxCJI+Fjl75/Aex0fpEfL6jcyIPJXbX+wnJfA7aVG6fukUkhV8ASGOtv?=
 =?iso-8859-1?Q?J3her1vCSeGEdRKI7FOaKJ4Gb2G1bJO6qdn/xxBPRT2EwS/iCT7Uvi1+q3?=
 =?iso-8859-1?Q?BRGw/HS9Wdc8TY7w+mGxCAHRyUcJhf9knAZkEun2Ae8nBHvjxQ4HnYyeXH?=
 =?iso-8859-1?Q?soosTYfKi/xfCkWasen8QQMUVs2AZIcnbyDpm/FBf2w7LSAsXxm7sditKc?=
 =?iso-8859-1?Q?gn8cT4kXaIYA8hzGsj+tAA83TiZeEUz1GbPkga3pXsZyTT4c/nBSSWEQeU?=
 =?iso-8859-1?Q?ut25Rm/iLBsZ4fprtQgbA02bc7c2J/hy1dYVtkBxGgP0CKOBG7f7wnkkgd?=
 =?iso-8859-1?Q?Gp3frf4FvdCceUghR3NAgi6NCJJsEhKvqadxVWzdAPRKymGI4GuybI1hs4?=
 =?iso-8859-1?Q?L3kuYNm3a5rpsmx8gm78IK5jibH4k3UTls+JRqHce082d4K6LMYiSOTFlC?=
 =?iso-8859-1?Q?NuDS8paYa6hZI/UhFgO+Zs17xMTMCEEVyOIyJ5Y3o1ZFsHcx3cw9pjYDVj?=
 =?iso-8859-1?Q?VLRBZw8eKbrewRjoR9bMHBmuIIjY67wHRs+G6V6Unr7c6rFBIvC7uFVcMH?=
 =?iso-8859-1?Q?f1Kqow8cxeou/g5zyuoxuFksVsQR3x0CkER1+6cZgPcJfng9j++/bkhX/z?=
 =?iso-8859-1?Q?NmjZq8cAEAcfMQF5VC3Fa/5ueUZdeYemI+PXQp2xzZ5dObg16PFcLg2DyB?=
 =?iso-8859-1?Q?6ndWrozfK6QORA7OEn7xE5TZk3f4DbmaGxkPH/JkSVOkPAr0QUQWpQ2PfI?=
 =?iso-8859-1?Q?Ko/sMEV0ukO5IQj51PBkn8bRX/kyCKTatdckGtXUywkjw2C7IaAKdBoEEh?=
 =?iso-8859-1?Q?FfT+mUxAYjXGJppluL1IOPgW5YEOANhFxlgCiWpsAMjp52KduP8SvgfxM5?=
 =?iso-8859-1?Q?ln6xhSdXwUvRanShCYeqStXJJ1jGbTHaOj7EedfZIICZulxytIioZBVEXy?=
 =?iso-8859-1?Q?OKvahGIeGYw9QJ7LEOu/ISOzF3qSvrz87KXAzWoap8902Apx7ChR5eWfUR?=
 =?iso-8859-1?Q?lVeLSnlC96BFWRQnhpGLxYZNRRTvkmSMRi6hnBnTRYVt+IUEce734aatdu?=
 =?iso-8859-1?Q?fwLWq6AkY1+KqD+jhTwTHGmuZAYYtbbd4fbWMfIMPpmT7xKIQfjYo7hllW?=
 =?iso-8859-1?Q?+T4uekgKYdGi4sklVKLaTYL0sdb2cBOYYxX5CRab46TzUKnhXmthW+YrqU?=
 =?iso-8859-1?Q?g5j3thXo8ipBr2CE+XahZsJsHiZuDPBtcVcHl1QteUtFYq/lmOUuPzGtrG?=
 =?iso-8859-1?Q?9WbRhvLSDpp1FU8HMTQ0+Qn+/sv1qojwtj23YEF5BurYxIm1bK7t7dCXld?=
 =?iso-8859-1?Q?L0wa3qqOKDm5GMbzixKVDnNLFdH33LM98rio//yA2xLqdKbIUHHBPIKv0l?=
 =?iso-8859-1?Q?iQ4PykMkItsOEKxO1o2+zvtcE8BZ2FSQ=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?EH1VhRUYp8AbJF4Eny1/u54Wu/J5PvLKG6BHG68FtAWw/uU2fjgFncwFkp?=
 =?iso-8859-1?Q?w//++pXUeONOmmqIA9Yu9YWwVLLufmYH9XRR+F4FuLPpYuFOapc1NZY2E1?=
 =?iso-8859-1?Q?g5wP6A514x/PLbNrCZWhcWhCYvEfuni3geWdBAMIP/LLI8kS96RytNp/iS?=
 =?iso-8859-1?Q?//7OVeCHfrq/eCFRpW7UyC9/PtVYwunnZM9gVYp2Xyj82HeMgF8DLMDi70?=
 =?iso-8859-1?Q?uHIbqDDep75vfosDPcqtB0RYmHInvDxwgeJ4dZowIQ1bMTWK3CzOWLyyMB?=
 =?iso-8859-1?Q?DZXy93+7HSwcUbe6+qaDEKf8CwctkVDmY2PTb2S78isPpCYY/lkxNCwlNl?=
 =?iso-8859-1?Q?nC0FJdU4FQNsIbM1oDCj2C1jqalIJ78f2uWA3rjm5xf2D8mIgJVf1ne/D1?=
 =?iso-8859-1?Q?JK4hDlIJFXOjyVCVkfCBTzm+0CYvYlXwkfm9qG0osccoS6JihwYnMYL5Nd?=
 =?iso-8859-1?Q?57EGkh0Ov1sawMqP1SmX6DiNC1eDN2hXTlj5lAj/yTqxAEU8HAFOb9OTY4?=
 =?iso-8859-1?Q?UeVBnzXJzWWWDezGqNQtdrTgWL/OEwod2TnmY0+8dU1yY+X9QSVkE6T5Xq?=
 =?iso-8859-1?Q?nfJfOg4BEiw/sB7WAVKOwrqyk+CG079+7Qh2GvMIW1dLQaBQkBkQQafbjB?=
 =?iso-8859-1?Q?zmK2jgALTdJsaSFybDWyS1G389eVq5Hpid78pKPK7Hw17jXRbbAJzdelUO?=
 =?iso-8859-1?Q?aITLpTJNzQ1IhD0lPasExNtFzyHBs9DKYcVwWAZhByhKBoULFuGSoSTtGl?=
 =?iso-8859-1?Q?e/WFNmuKWG/H58l0wkgEHg0oMqPJKWaI6zkExJiqun1lPAdR8rqrz2ZdGH?=
 =?iso-8859-1?Q?fP2TYtMXdhvUEeMCQgeReS/QGQsYtTZunDUDd7IH1rsFcmRC9LgNtsLZaM?=
 =?iso-8859-1?Q?PdykIhkUFPhFtPXDlAFXWd7Pu9DPYzn6DXD4jTwbhhqlFvaMj8PYqRoI8z?=
 =?iso-8859-1?Q?hJGbOQ1IWXSEutRc4jMmJ2LDwjRCiRiX/cbeh3QmFfH1v8XSGCLFZwr0PN?=
 =?iso-8859-1?Q?Fr6hU/eRc3vrhrHyKvTYj/zmIes6bHBTr2sKQFtSyUghmjUabAyu0+gKwR?=
 =?iso-8859-1?Q?H/3p4/6+yLEufuOrscEwk6PrT4aYCUKj7cuzcoPXoku7mpfU5jmjoRiFFx?=
 =?iso-8859-1?Q?V39DgTtK9/oEvmVVT4+1Q2TeuL9TwDULkvu85/N2oO76hq1x3kwDDl5Xxj?=
 =?iso-8859-1?Q?o4alA6b6g6R83oFjZVXr1kDH8UmDxo4r9b1ednj3ou144Ly2dQUYPZP/gL?=
 =?iso-8859-1?Q?g8/Cgh1rMN1Tt4s1Iri1LO+og1kBbSPc1jyCLyCi6QlYVRE8Dwpa/0Osph?=
 =?iso-8859-1?Q?dvoQMPnrvipwSHSeuLyNSg6vZ1kEfAE8+jov8k+xOpTL183agIabHJrNsv?=
 =?iso-8859-1?Q?I6KKpWrOQZgMERvlKvs6wTOsVwhrPBNJ/tEOIcP2wVQLOigiMuOJACRy1Y?=
 =?iso-8859-1?Q?D2g5UvBLZ8b8cn7cAE7p+CIp65LJaiMIm6PQvsq4URICvXoqYB3zZ0Q2tS?=
 =?iso-8859-1?Q?IgWtAIuScldletnhwQUCa3L15l4VsnyVRYWwUUYCkEv2KEVRB5YUukwUFB?=
 =?iso-8859-1?Q?Na01K1/4VufpCnxOj/aHM2O3Hx/PbKyhygJT2WyyFYUoTVS2nuU/ek4YDS?=
 =?iso-8859-1?Q?D7DyBcQbT87YchX5r/v2EhSCTKSMxhioJvONmuSRp7TWBiEO1Rh/XSOg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b94ced4d-bd77-4646-1aea-08dc819af82d
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 May 2024 17:56:16.8239
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2UOGBnowdRduewB9fZhgy5L0h96H/N2hm64b035AwBSYufCxCBiX70KxJcYbNfSGpa3oWWUnVWJH85hyxDvU25qQ57adfUFisjU1TW8IVlU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR03MB10738
X-Proofpoint-GUID: nqLg42PsRG1SOBJnYjtXKtz8qHiAGHqR
X-Proofpoint-ORIG-GUID: nqLg42PsRG1SOBJnYjtXKtz8qHiAGHqR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-31_12,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 lowpriorityscore=0 bulkscore=0 spamscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 phishscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2405310136


Hello all,

Volodymyr Babchuk <Volodymyr_Babchuk@epam.com> writes:

> Extend TEE mediator interface with two functions :
>
>  - tee_get_type_from_dts() returns TEE type based on input string
>  - tee_make_dtb_node() creates a DTB entry for the selected
>    TEE mediator
>
[..]

>  bool __init is_dom0less_mode(void)
>  {
> @@ -650,6 +651,10 @@ static int __init prepare_dtb_domU(struct domain *d,=
 struct kernel_info *kinfo)
>      if ( ret )
>          goto err;
>

I forgot to add

#ifdef CONFIG_TEE

> +    /* We are making assumption that every mediator sets d->arch.tee */
> +    if ( d->arch.tee )
> +        tee_make_dtb_node(kinfo->fdt);
> +
#endif

So build fails if TEE is disabled.

I'll fix this in the next version. Anyways, this is RFC.

>      /*
>       * domain_handle_dtb_bootmodule has to be called before the rest of
>       * the device tree is generated because it depends on the value of
> @@ -871,6 +876,7 @@ void __init create_domUs(void)
>          unsigned int flags =3D 0U;
>          uint32_t val;
>          int rc;
> +        const char *tee_name;

[...]

--=20
WBR, Volodymyr=

