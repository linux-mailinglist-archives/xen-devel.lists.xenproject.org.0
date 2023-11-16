Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E0047EE590
	for <lists+xen-devel@lfdr.de>; Thu, 16 Nov 2023 17:54:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.634546.990046 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3fcz-0006Bj-R2; Thu, 16 Nov 2023 16:54:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 634546.990046; Thu, 16 Nov 2023 16:54:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3fcz-000698-Nc; Thu, 16 Nov 2023 16:54:05 +0000
Received: by outflank-mailman (input) for mailman id 634546;
 Thu, 16 Nov 2023 16:54:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ww8j=G5=epam.com=prvs=56846b66b7=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1r3fcx-00068T-Rl
 for xen-devel@lists.xenproject.org; Thu, 16 Nov 2023 16:54:03 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id be7a6fe3-84a0-11ee-98db-6d05b1d4d9a1;
 Thu, 16 Nov 2023 17:54:02 +0100 (CET)
Received: from pps.filterd (m0174682.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3AGGr2pM004265; Thu, 16 Nov 2023 16:53:53 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2168.outbound.protection.outlook.com [104.47.17.168])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3udhuvs9r6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Nov 2023 16:53:53 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by AS8PR03MB6774.eurprd03.prod.outlook.com (2603:10a6:20b:295::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.18; Thu, 16 Nov
 2023 16:53:50 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822%6]) with mapi id 15.20.7002.021; Thu, 16 Nov 2023
 16:53:49 +0000
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
X-Inumbo-ID: be7a6fe3-84a0-11ee-98db-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mwBSmbjHUI3QAuk0XNLQujFIu+jUn8mRbKeXfrYETyFgKg9PGch9wRwHsgNuXSp+0Gn+4QO/E2HwJ+ni8nSYWUoTL+zkrrLAvLE5DrDNEQKt3OsA1KdWN9hEPk4qkYlqH+SYH3gyHhIUHdrIi5fozDQo4vIIL2+ufuqR5w2yYoJPh0Znd74v5QAZtY13nK1cGI1NAc9VBKqGyOHkWC6SP8ceZkNVPmMZp29mUMRiMfCk4uclV4NZ0R5MbT3NvH18JHUoME+tj9DMZM3fK+yA7ZS7iiuZul8Stvu+i8ND36TIDh2dtc4y6oEkxh/Ao1MaYMdYwGdQZ1UVzJEJjWhuYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ObtFzB/EJgjKxULECZJvr2iPpfS5cnBO61g5/t9IYu4=;
 b=oRfhhuAEPfIOrDlShlMGf0NmqSYdT8hvIVBmoHpMoaMH6Z75c01VC6mW8Nvq6ZQTP+kKNw2Cofx2WwFa2sfXXP1vM3brp4GJMywh5+49/Wfg1UJA6vCifugv3kuOSbWC/Ycfs8E8XZej+LEnIAGeIb146PWpOUb1G9TBN69i+vFouph1s3Q9Cwtxv4QlSs64OTQl3oPyOm/4cJ1HwbiatTynATX/L2dgcHz0CaMiU3JQBeqVn4OuwLMo/0K10+DbXInKIBeIx83BvqqSlW/eiNhvrr6hUUv0Zb+r8XtqiUxDbv6KCiWU2Q+c32VtqsewAiNRbKYLAG3z0R6Y4sJ1LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ObtFzB/EJgjKxULECZJvr2iPpfS5cnBO61g5/t9IYu4=;
 b=BCEI9TlqEFlUwL0iDsPl9rcza1mcXcKWGdeVF/gJvCwIfpq/L0TynSMuQwIbql4UCku4dKABCAykiqJSp4ZIRVFa7DIN8yuO9YIhQQRCYWdLGCvz0qHsz8YlAJtkFn3dbVlk1EXRhZrmkLAWh4MOYJFvaQLmapDwKL7TiYC8kXQaOmWD8AajKG9hFMjW8lWvMFIiA43KUrCUyHUMNZJMUU2KI6VMMJR/u8kXDsg8YY8IjRxIe4aJQcfVhLsaxmXkLJEidiBeUg+EuopM+7SdhhJvdaNIFOYkQtELb+qsEuVLdRdZBVBScurDWQaVPM9D3Qz/boZjne4fjq0i5POGCg==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Julien Grall <julien@xen.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>,
        Stefano Stabellini
	<sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Bertrand
 Marquis <bertrand.marquis@arm.com>,
        Michal Orzel <michal.orzel@amd.com>,
        "vikram.garhwal@amd.com" <vikram.garhwal@amd.com>
Subject: Re: [RFC PATCH 2/6] xen/public: arch-arm: reserve resources for
 virtio-pci
Thread-Topic: [RFC PATCH 2/6] xen/public: arch-arm: reserve resources for
 virtio-pci
Thread-Index: 
 AQHaF7/0FLT7PaxCl0mKzTq8kNpAxLB7mIqAgABuuwCAAP6dAIAACUiAgAAD6wCAAAjzAIAAC4aA
Date: Thu, 16 Nov 2023 16:53:49 +0000
Message-ID: <87v8a14p2c.fsf@epam.com>
References: <20231115112611.3865905-1-Sergiy_Kibrik@epam.com>
 <20231115112611.3865905-3-Sergiy_Kibrik@epam.com>
 <f4523916-f8aa-4f3c-a148-2fc73b0c5fa4@xen.org>
 <a5ce647b-f372-41ee-b1d2-b6ff16c3d1a0@epam.com>
 <alpine.DEB.2.22.394.2311151518500.160649@ubuntu-linux-20-04-desktop>
 <875y2168ki.fsf@epam.com> <0999dc30-05ed-4afd-bb10-0128e2ca1d97@xen.org>
 <7964c688-c4b5-4688-9f53-88679bb931b3@amd.com>
 <7c5f7a8d-a30c-455d-a44b-384c0f242741@xen.org>
In-Reply-To: <7c5f7a8d-a30c-455d-a44b-384c0f242741@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.10.7; emacs 29.1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|AS8PR03MB6774:EE_
x-ms-office365-filtering-correlation-id: 58affa53-51ec-4864-75f6-08dbe6c49b5f
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Nhi7pggE+Dejq9Kpb57/NxmhPtjqPsvrh0Afwbt92SOANx0jSOqI6QvzgIuCk7qC5OqVjdnJwfL4X736rZ9m41hdudtQSr5Ni5gh9puLiC8ybMKmvGZkX3v+GvajjNlp7FNBXW0HO1tP23aKUJ9r31yAkGjt2lSmZjTjza3Pc3uf1526GJEb/PUrSvlLdrGRxI9Ua09cF2FxYZy2IRvLkUQXjmkqMErq2bKB6j69Yqk7MWYohbpTtlMzgwbIuv2gvwBQ59l8pzW+7fL/GcIGzM9Xcog3NAidOnCkpOOofs/DhAntYt6DE03QP2OHIjLrEjTHpIKYVBibpNz08gtrwkVZ5m2I4t9FK0y6uLOjVcuFuQwINpvfWvB6kkwXXWpMJkdV5kIXNoE5ax+MfbFBcTzaoYQiyLA//JgwI8oizTZxHFudVT8bXgCpXRAKFmqHEjir9IblC7BO6WG8YpddxTaRp41/LmQ8A/CVqNeXR79rsoWBwa72DpvyCL17IdTVT17AWOMonDBaAXaz59I+LxQa0PCvbwlMmCdOQWOb4uCr8qQ/dgatNU6JdbPZdQvMVfZfi/dHziWiw/v6s847Gfjiie41FAOKzqwdMTkKnTOd8vZhgDpbaANWimugDkfE
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(366004)(39860400002)(376002)(396003)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(83380400001)(478600001)(6506007)(86362001)(71200400001)(55236004)(53546011)(26005)(6512007)(6486002)(8676002)(8936002)(2616005)(91956017)(2906002)(41300700001)(122000001)(38070700009)(66556008)(66946007)(76116006)(38100700002)(6916009)(66476007)(316002)(54906003)(64756008)(36756003)(4326008)(66446008)(5660300002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?lTblEjdtePiodBFY/i4tJyjVTvutQVvYIorpCFpMECKzsuBHYAHsttlT4T?=
 =?iso-8859-1?Q?f9+JJOQKrLqCueC0cpxlsq0f2iyaf1JBr8e6xfJQ1MIoPdYt/q4Zp/5xsa?=
 =?iso-8859-1?Q?4bdk5IgH4o6oVTS1X6hGPjCV2Mk2vnYA2pMEGj5fJlN0Xpf5cFhiMr7jY0?=
 =?iso-8859-1?Q?hf9HMksAdYrJzodUllPwmMP13Omd31chYDVsFtzTMMNi5PJPyqX6On1nNp?=
 =?iso-8859-1?Q?9+XZDBnnGvdtB9GtotXPS9zuvzzP6kIWNrax3EtCO+ZHiVNrAlM/Ya1Rvr?=
 =?iso-8859-1?Q?yBPGLuquhir0HCZfp8AhEevPInsABi2zwBP6GnVeQ8AYxEedPsNdDkfBaw?=
 =?iso-8859-1?Q?4IFhzougiZ1VB6eYMJZOzjGTmZvBVnb7gyyq30RBeKwTcFX5RFRGq/Tkem?=
 =?iso-8859-1?Q?DrQtLq5ycC8HvV4VjgU/4HClmqWX/2e4CwNU9bvhUOBDjnrQDw3hLWmfgt?=
 =?iso-8859-1?Q?LpI+n1km57MCvw+QRCOfbNBupkPr1R9zp34Vr7Hc4wHnpMtUOKj/SIaezx?=
 =?iso-8859-1?Q?qpHcg+aSPFsz06oRqrgav7NIheLE+C4IdG0V4M6L/ZsgSKqKPOtR/Uw1XX?=
 =?iso-8859-1?Q?TutW0GZ0TkTbWZAoNMnDgbiOVbrJadIVfpCdCLvgXcQMs7zD83m60bJs/z?=
 =?iso-8859-1?Q?QdKjrR+AZNCajq6whujWEVGNBj2lhp4Gf//TQXzhlX0MJBZy/k5RPEKI2J?=
 =?iso-8859-1?Q?pAwfGSvX/3mO4UZsl/ANt39KXHRonawqMRxtq4TR4HiFDtU/r/oBWv94v2?=
 =?iso-8859-1?Q?JUa8YDWUmQZUyy1vwBj8BQKIj6CD2HvWCshTrxsIsiNzjFdoPmLad/+CL2?=
 =?iso-8859-1?Q?0PeUaUzQTlA6ZvognRADIvxufnnjHB8JuDSqoBbVA/iyxDM5T4uBR3BRMC?=
 =?iso-8859-1?Q?hyzP+YL1nVGeOxAN/qzJ+NZtOz6ekaJl327FTfvgjAAcrI0NdvJHzZK5jZ?=
 =?iso-8859-1?Q?91dGOqW+mQa9Ukbu4G0+YTRmNBvEKw44FL9QSR0roP08Bo2VjTDvsEov8U?=
 =?iso-8859-1?Q?R7IaeaHN7qQgXtLr53U+a5NGnMj5X7iu2DIXUAWcDPGdxo45psZw5yi6BI?=
 =?iso-8859-1?Q?aUjUIImexWqLW8wZwzfqkSnRROCnDxSzDbAmEE9eM2r/FAPIzMY7QthHXN?=
 =?iso-8859-1?Q?S/iOK+4oKXjIzulaiJLVhHXzCJS8/sxZtJj0glk37m8NrGAWMsvJD4py4D?=
 =?iso-8859-1?Q?dqerFoKas2VzE3MEI+3HHPa0HuKmrz2gvnLeDgFfdrn1JttmEpqhg40+kr?=
 =?iso-8859-1?Q?VOYoXJB0sEavPCqcVC3PDb9CcASccpGwYGVRLt1q+4na2mHyZvqle2pOdb?=
 =?iso-8859-1?Q?Bga7PTIrwK3QOirkHe0j0snETElemHRGVzvcnSXUsWoRiHPxhu7rgYf6Av?=
 =?iso-8859-1?Q?KXBH8FKA4Sj6li087sNL0o1pmxPUE9CYnaDQON6rdgkS9W78htvr1AtiRi?=
 =?iso-8859-1?Q?9gpaM3aVZ8i3zGzsHzsm3bPnrHCR07UIyyOcT+uPPnz7ZdNP3svVoE0FwQ?=
 =?iso-8859-1?Q?b2yoKR9Bc6up+U0reMgvsF8AZahn8yPwN0jpGWTn9Bcoin7ryDvVrYuKQL?=
 =?iso-8859-1?Q?GH3WqWfCHTjkD3nXLZ/xe49UyTeKjHpY3Ghj7kcurekO8kTUGoMAZMWhjB?=
 =?iso-8859-1?Q?c3CHpm9iEHLiAUg9IlRaztPIC0kgrpCo6+Yso3Xm3HvmTqGZDrc4zVcw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58affa53-51ec-4864-75f6-08dbe6c49b5f
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2023 16:53:49.7164
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oYGBYxB9oT3aQ21r5D2+b0no8RTW1Uf2ysR7EkoFud6i3rh8G+bfvCXv7+mwgSAvPttNgiy2Hc3CIC+JkZQC5UDm2yqFnM7MuOxPMxv9nVM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB6774
X-Proofpoint-GUID: YTpuKpUJb16e5hmIG6aA-y791uJllQ0J
X-Proofpoint-ORIG-GUID: YTpuKpUJb16e5hmIG6aA-y791uJllQ0J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_17,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 adultscore=0 mlxlogscore=599 impostorscore=0 spamscore=0 clxscore=1015
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311160132


Hi Julien,

Julien Grall <julien@xen.org> writes:

> On 16/11/2023 15:26, Stewart Hildebrand wrote:
>> On 11/16/23 10:12, Julien Grall wrote:
>>> Hi Volodymyr,
>>>
>>> On 16/11/2023 15:07, Volodymyr Babchuk wrote:
>>>> With my vPCI patch series in place, hypervisor itself assigns BDFs for
>>>> passed-through devices. Toolstack needs to get this information to kno=
w
>>>> which BDFs are free and can be used by virtio-pci.
>>>
>>> It sounds a bit odd to let the hypervisor to assign the BDFs. At
>>> least because there might be case where you want to specific vBDF
>>> (for instance this is the case with some intel graphic cards). This
>>> should be the toolstack job to say "I want to assign the pBDF to
>>> this vBDF".
>> Keep in mind we are also supporting dom0less PCI passthrough.
> Right, but even with that in mind, I expect the Device-Tree to provide
> the details where a given PCI is assigned.
>
> You could have logic for assigning the BDF automagically. But that
> should be part of dom0less, not deep into the vPCI code.

As far as I know, right now toolstack does not allow you to assign BDF
in any form. For x86 there are two options, and they are controlled by
"passthrough" option of xen-pciback driver in Linux:

  "Option to specify how to export PCI topology to guest:"
  " 0 - (default) Hide the true PCI topology and makes the frontend"
  "   there is a single PCI bus with only the exported devices on it."
  "   For example, a device at 03:05.0 will be re-assigned to 00:00.0"
  "   while second device at 02:1a.1 will be re-assigned to 00:01.1."
  " 1 - Passthrough provides a real view of the PCI topology to the"
  "   frontend (for example, a device at 06:01.b will still appear at"
  "   06:01.b to the frontend). This is similar to how Xen 2.0.x"
  "   exposed PCI devices to its driver domains. This may be required"
  "   for drivers which depend on finding their hardward in certain"
  "   bus/slot locations.");

Also, isn't strict dependency on BDF breaks the PCI specification? I
mean, of course, you can assign Function on random, but what about Bus
and Device parts?


I mean, we can make toolstack responsible of assigning BDFs, but this
might break existing x86 setups...=20

--=20
WBR, Volodymyr=

