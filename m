Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F109F73AB77
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jun 2023 23:19:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.554163.865203 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCRhY-0005yh-T8; Thu, 22 Jun 2023 21:18:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 554163.865203; Thu, 22 Jun 2023 21:18:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCRhY-0005vt-QD; Thu, 22 Jun 2023 21:18:48 +0000
Received: by outflank-mailman (input) for mailman id 554163;
 Thu, 22 Jun 2023 21:18:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fyU+=CK=epam.com=prvs=053747cf20=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1qCRhW-0005vg-TA
 for xen-devel@lists.xenproject.org; Thu, 22 Jun 2023 21:18:46 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5ecbb3a3-1142-11ee-b237-6b7b168915f2;
 Thu, 22 Jun 2023 23:18:45 +0200 (CEST)
Received: from pps.filterd (m0174681.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35MFWGqo031937; Thu, 22 Jun 2023 21:18:38 GMT
Received: from eur05-db8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2108.outbound.protection.outlook.com [104.47.17.108])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3rcs1f1b1w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Jun 2023 21:18:37 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by PR3PR03MB6489.eurprd03.prod.outlook.com (2603:10a6:102:7c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Thu, 22 Jun
 2023 21:18:35 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::10c0:3ca8:e226:2335]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::10c0:3ca8:e226:2335%4]) with mapi id 15.20.6521.024; Thu, 22 Jun 2023
 21:18:35 +0000
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
X-Inumbo-ID: 5ecbb3a3-1142-11ee-b237-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UTDZZX7qU7iNroh1eTaz4T1g+Jt7qns9eOJ4rBt0IlAQ7PUtHlsz67GLAbDlQTWvy+5M+g1bYdWFQ6CjfiCNqlcGkRZZbB5gMuC8+6oVDTIZDPUKJWTYDXT/Nh8MdK29//6QVOwh/OJlr3maoRfv5OVV9xTN1CnJO/JBtrB3eDw5bfJ8YQ6cK8fr/NL9/w/vu65UczjgI1p632PItqaRw5c7InV3ohKb++sZpeu/UyCshhpp2Z9mm6WkTeSVEYImwyp3Q/9vDtb7UKhOdQelrZGDeZ51WE/iuLBUo9c64UAKgRfO+OQfnpGu5QP3XsJmS6+vwXk3jWSbefLcQ258tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0hL1RkDsAXcoZmu4i5wm3nL9aMbgRi24gx7koHDvWro=;
 b=ZKy8H5MAcP/Ma9AojITdfTFE79aiRuhjBFFJ1sc9axlfYL7184piW57cY2/bSildVpAvUQ/+qt2r0DryawCOKcqfTxD2/aJVg1iAPhxzMvkoAlphU9lpllS1Eu2J4uqkKlp/x1HtlAbYPNAZ6entOJbDMBMEguWYNNEbrCiCZeAh6M4Mw+t/lX62K2N73ze17AEU1AANKG1LuJ1aXkGe1J9d+yaq+3gsAdbrf9vLt2HnLTsVxP0PduwR9eaCOHYaZX5BsfjHWXBP1jGLzwTkkd/6sgypGA04jGCJn7eBJuMbZ5Pd/NOxa9HjXTk9CCPXbUEhmTyqUIGDA6yayl9EYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0hL1RkDsAXcoZmu4i5wm3nL9aMbgRi24gx7koHDvWro=;
 b=mwf7XaJSOZ6xQ0ADGXuJqOkXkTPPq8vkLsForvP1RooCQClQPuv3eVsCdJMNMGNd0EwWZ++LQPcdj7BA2PAt98i2jD7bsmIewUh8SxPjwGUQv1pMCiEkYR5eHzPR0TySCLNPtWyFJKEkxLGV/SWKSyTlaf9sZYYDULJEyOsm1ZzPZSunga3rZjfaKPIhikt4Z3NKvbT5tLmxxYnEF0HwSTKMqej5tVxkxWQTNxPm9op50c5k+1eTPYjNw++EvEIWUWvGJe7NxLeG0akWIBsacNkjP7gLbxCm+4cEqyXMbwueFxL7WXBfm4G5D3DUJuhMmK0vbIhKJ6VFgPi68CS9qw==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
        Jan Beulich
	<jbeulich@suse.com>,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>,
        Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
        Julien Grall
	<julien@xen.org>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Paul Durrant
	<paul@xen.org>
Subject: Re: [PATCH v7 01/12] vpci: introduce per-domain lock to protect vpci
 structure
Thread-Topic: [PATCH v7 01/12] vpci: introduce per-domain lock to protect vpci
 structure
Thread-Index: AQHZneJZdDE+HOoSO0y6VB9l0x1hDq+ULLMAgAM1noA=
Date: Thu, 22 Jun 2023 21:18:35 +0000
Message-ID: <87bkh7nql1.fsf@epam.com>
References: <20230613103159.524763-1-volodymyr_babchuk@epam.com>
 <20230613103159.524763-2-volodymyr_babchuk@epam.com>
 <6418b3bf-5b7e-3c12-52d6-534bf791617a@amd.com>
In-Reply-To: <6418b3bf-5b7e-3c12-52d6-534bf791617a@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.8.9; emacs 28.2
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|PR3PR03MB6489:EE_
x-ms-office365-filtering-correlation-id: be719b83-2b44-4f44-395c-08db73663d28
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 avaHSGqIIvuheCeURX9uZLo4JbEZiyoNcB9XKre54/rgBq9/ILmIO0x9JrbSd5xow9HJB9sawnHtnkjMNlAQbvMaFCZhneheRI7ZMurL61T8h6GITk/zBZaqTXUzhUUsf0jWr6FnkBw3sFORcVN14mfmT7QPNrm7A7l8YDQ/Lk/jPm5sSGfWL9D7tU6KJDEEY18g4DvMETAObRjA+VNfHdBgzJuBZqvKMyhTSl1qp8GEwyYApzb1GJojHceUW3ipXBRbrMOuyA8ACkP0Tu7JrG3nfOVcui+oYQaU/IluoELw8AA9wpK7mlL9SK8xi+BcWy7d3m/EdOLM8j8ZRh3xIvQotcrkrkzH2axkgSRdkpyeb7Koy2eRnBGUIKOGA7Jb1G4V8O+VxNixb0p7K/p5qXIMLOJXuVn2ebMQjYnAvQgL2n7tkBYcF9eEoAJbAO0OJjTvkchidHwhGga1fSyG08X6a7dh1PEr7tTmYKc6cukMSBuyNzAlYNbnF8UHd7oJZZ7T46HYGxZla/D3H8dZCPhxiy5M7kwfH2pMY3vbcTiEiBr19ollQIZ4osPPsVgCPCmCNwLTmV7Kzb6Xj3byBkQUgw+Op+EipLNaIaSYGBIWKfIF7lLyJNwlC43hVOCa
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(346002)(136003)(366004)(39860400002)(451199021)(7416002)(5660300002)(36756003)(8936002)(8676002)(122000001)(38100700002)(2906002)(38070700005)(478600001)(186003)(6486002)(71200400001)(54906003)(2616005)(86362001)(55236004)(53546011)(26005)(6512007)(6506007)(64756008)(66446008)(66476007)(66946007)(66556008)(6916009)(83380400001)(91956017)(76116006)(316002)(41300700001)(4326008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?Ykzg9Ex+xx+k4bv8ICyTkG7DPXbAy1v+3euQIm/DjD2d6pPKlmF7EzieRW?=
 =?iso-8859-1?Q?0X0PWKygOxCLKl3+rlxWgzCzuopPcuoKxSjQNQoK/3jyvG4jpZzoehMjaW?=
 =?iso-8859-1?Q?TxQYyRWMM3rHpk0OEqStgLaVli8MIkT7hzZSu0S+QYrQFVmu05xW+6su/l?=
 =?iso-8859-1?Q?y1sJXNbszWtXBzEx6UDaZBK1jPAnEUJyykWBYdS/iMJAQfn/KmCPgW/jlz?=
 =?iso-8859-1?Q?EqysiLZ6znTkQkzkCTt/S8t6emz91bsJ9IYLha0EyHtjQs9jdcq9ZNqdnO?=
 =?iso-8859-1?Q?K+Tfk19C9fJweTLeI+l8KR/v7yG6d7PPBQrDt5u9z2tgYmh5T2alNXaGeL?=
 =?iso-8859-1?Q?YmI9ouHiNWsTE58SP/GOgqoCv0UDkXg3dDSjZf14n6L2coxOJm3UFfTEL6?=
 =?iso-8859-1?Q?jGLF2/iSc9vxFpiMxlzYfaTvzqc1FikburCdLVA0DsGSf33DknavW5LFzr?=
 =?iso-8859-1?Q?aG52cqNrU4H4Vf4uYTABSFVOp6tFU8lRgpPoHZLSaycPCeOqLQk031pzNc?=
 =?iso-8859-1?Q?6YJnZ+uqmSSTZpu7BvFbF+qTRzj66BnOvKxnq42D7sLFmOWGTNxh7PEYeT?=
 =?iso-8859-1?Q?wzvCnBgcdlNVF3apXKzcTJLbVfDxQKGNEh20TW1tG7HGbnBjgVwW2LGP1L?=
 =?iso-8859-1?Q?oE++CEwa+Dvw8d21PLkM9RRKU7boJPLh5RwkRqATTcOZE2BEGn8v6psYNc?=
 =?iso-8859-1?Q?D50Q63OE19yvHJQW0lad+RgPxi9MIksU6Hdw71h7GS1cEyfjEayr6vAueZ?=
 =?iso-8859-1?Q?65PNACkqNOeqRmGxLfLTaMOu7/uQTd4Z/KrIXI6zeMDxK86tcvtV+js+Ub?=
 =?iso-8859-1?Q?HVcYct2joJiUrr8UvSsycWY+61IxDXF1B6+K15dYYGq+fp+n78xPVlSjc6?=
 =?iso-8859-1?Q?/ld/E3qxzIEGOu300TGUXhf3EkJonwZwHB6TZIVNp1HVZcBglbLw8ytgBz?=
 =?iso-8859-1?Q?CLcEBnQx+EvRsEx648AeG8VFO3WmiPo6XwndhCrl4NXytcKn9tceTlTdWV?=
 =?iso-8859-1?Q?py7vi57IgFn70mrssUlXVPsb8ZZNLfpKNI0nLvVjB/MsK0ZhFyGTQ2/VZ8?=
 =?iso-8859-1?Q?c5WJskC2LDu2va2bclxRb11Egtm/uugCjVZqfF9kOgyjinNYj13FQcweyP?=
 =?iso-8859-1?Q?JcuI+/s4mgRIfltk9i8EN0LPKY0z6wtLuv59tUJALMROk1MJIkcLapc5Td?=
 =?iso-8859-1?Q?fCUt5cmNv7WhM8n4vguCGta4OTN3UVXATVHyAdLW8kVxoDUon81N0thxCc?=
 =?iso-8859-1?Q?g/5VPrc088M8b9R/+RKL0O8lOVB4Y80Qh0FuiH5fiWjhr+430mnOauQn6k?=
 =?iso-8859-1?Q?rc1M8eCSvEJ9ejd8NMHmLtPQlLKGI/zwWUuVfynDpYg33yVQutzvUhkw12?=
 =?iso-8859-1?Q?c6EBOAkbhLIzdaXhdLBCyIpFaVk6Qz5fj+WLyXNLk2QhLlPQehF4Xfu4hk?=
 =?iso-8859-1?Q?INTZIOX9IoJfAU4KrIrbB0VNabXEGC3bwmJBH1CEnaNQesIHEeF9GO+FRz?=
 =?iso-8859-1?Q?P+pbnmLecpcTeyYZlgcu+x3QyamBIW5z6AxuJjBeBopFx9952XUoLbZpLR?=
 =?iso-8859-1?Q?8X+BJiQ3YMQg9LrKdTNDDxdNWsZR+3rljKrIe9UXb6etMnOwjcXycwNFPL?=
 =?iso-8859-1?Q?jP9B5+gZCeJzx6ES9hUi1ueXVjp+D9f4IbcYqXNzF8KXlnpu2odgI0Uw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be719b83-2b44-4f44-395c-08db73663d28
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jun 2023 21:18:35.2714
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nlm9rQReI2ThnkhDiW/kuqzuRkmDerPS+5Ik9Mvp2tpSGF4DaXbBiTjR8a6dMOaYoUlmSpM2u6PNkAr7HK5ouQPTyiNjwMrUXN/RLO/UvEs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR03MB6489
X-Proofpoint-GUID: lwNpx2uzOno15TJlrcjDR04iia8XanEz
X-Proofpoint-ORIG-GUID: lwNpx2uzOno15TJlrcjDR04iia8XanEz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-22_16,2023-06-22_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 mlxscore=0 impostorscore=0 phishscore=0 adultscore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306220181


Hi Stewart,

Stewart Hildebrand <stewart.hildebrand@amd.com> writes:

> On 6/13/23 06:32, Volodymyr Babchuk wrote:
>
> ...
>
>> diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
>> index 652807a4a4..1270174e78 100644
>> --- a/xen/drivers/vpci/vpci.c
>> +++ b/xen/drivers/vpci/vpci.c
>> @@ -38,20 +38,32 @@ extern vpci_register_init_t *const __end_vpci_array[=
];
>>=20
>>  void vpci_remove_device(struct pci_dev *pdev)
>>  {
>> -    if ( !has_vpci(pdev->domain) || !pdev->vpci )
>> +    struct vpci *vpci;
>> +
>> +    if ( !has_vpci(pdev->domain) )
>>          return;
>>=20
>> -    spin_lock(&pdev->vpci->lock);
>> +    write_lock(&pdev->domain->vpci_rwlock);
>> +    if ( !pdev->vpci )
>> +    {
>> +        write_unlock(&pdev->domain->vpci_rwlock);
>> +        return;
>> +    }
>> +
>> +    vpci =3D pdev->vpci;
>> +    pdev->vpci =3D NULL;
>
> Here we set pdev->vpci to NULL, yet there are still a few uses
> remaining after this in vpci_remove_device. I suspect they were missed
> during a s/pdev->vpci/vpci/ search and replace.
>

Yes, you are right. Thank you, I'll fix this in the next version.

>> +    write_unlock(&pdev->domain->vpci_rwlock);
>> +
>>      while ( !list_empty(&pdev->vpci->handlers) )
>
> pdev->vpci dereferenced here
>
>>      {
>> -        struct vpci_register *r =3D list_first_entry(&pdev->vpci->handl=
ers,
>> +        struct vpci_register *r =3D list_first_entry(&vpci->handlers,
>>                                                     struct vpci_register=
,
>>                                                     node);
>>=20
>>          list_del(&r->node);
>>          xfree(r);
>>      }
>> -    spin_unlock(&pdev->vpci->lock);
>> +
>>      if ( pdev->vpci->msix )
>
> pdev->vpci dereferenced here
>
>>      {
>>          unsigned int i;
>> @@ -61,29 +73,33 @@ void vpci_remove_device(struct pci_dev *pdev)
>>              if ( pdev->vpci->msix->table[i] )
>
> pdev->vpci dereferenced here, and two more above not shown in the diff co=
ntext
>
>>                  iounmap(pdev->vpci->msix->table[i]);
>
> pdev->vpci dereferenced here
>
>>      }
>> -    xfree(pdev->vpci->msix);
>> -    xfree(pdev->vpci->msi);
>> -    xfree(pdev->vpci);
>> -    pdev->vpci =3D NULL;
>> +    xfree(vpci->msix);
>> +    xfree(vpci->msi);
>> +    xfree(vpci);
>>  }


--=20
WBR, Volodymyr=

