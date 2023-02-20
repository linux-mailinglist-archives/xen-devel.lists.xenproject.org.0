Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC0E69D6F0
	for <lists+xen-devel@lfdr.de>; Tue, 21 Feb 2023 00:14:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.498461.769354 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUFMB-0001xi-Gz; Mon, 20 Feb 2023 23:14:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 498461.769354; Mon, 20 Feb 2023 23:14:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUFMB-0001v6-DJ; Mon, 20 Feb 2023 23:14:03 +0000
Received: by outflank-mailman (input) for mailman id 498461;
 Mon, 20 Feb 2023 23:14:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HNad=6Q=epam.com=prvs=6415815d8c=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1pUFM8-0001v0-M9
 for xen-devel@lists.xenproject.org; Mon, 20 Feb 2023 23:14:01 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 402295d1-b174-11ed-933d-83870f6b2ba8;
 Tue, 21 Feb 2023 00:13:57 +0100 (CET)
Received: from pps.filterd (m0174683.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 31KIu5a8006483;
 Mon, 20 Feb 2023 23:13:47 GMT
Received: from eur04-db3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2054.outbound.protection.outlook.com [104.47.12.54])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3ntppmub60-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Feb 2023 23:13:47 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by PA4PR03MB7359.eurprd03.prod.outlook.com (2603:10a6:102:108::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.21; Mon, 20 Feb
 2023 23:13:43 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::967e:573a:15a9:176e]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::967e:573a:15a9:176e%4]) with mapi id 15.20.6111.018; Mon, 20 Feb 2023
 23:13:42 +0000
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
X-Inumbo-ID: 402295d1-b174-11ed-933d-83870f6b2ba8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a8qjVVwchmGFx1zHjNMoXjjVFJhAt8yM7uQWlohKX38RgJQpQHNpNSiQbuQkFOZYTqZVb8f8hyDO9vLAVx0W7kNAJlkJKLRazO2qax1yvYSgnZ+qU9TJnBZLtZsdIgjGWx35KNm+AJwLLM+F6SE5RpTSDO6oojxflbigy7XpC4Pz8dfD47RJ+ZWtLqVxDplv/gbJFhF5Fwkym/piZTDnPXf9XBfJgcJWnnwntc1MndbfeD4zJcmlrYtUIrDX6m21erCEviJ3aQzmfilEkkERntF1N6pTWKfqD6mrwcFTPtlfT/RB3qs8tL7sxUtQ8Ye21RHCwFFwDgZsOKAiI3Mu4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6HdyQVikCAk0DiXQKPnFgkUdHnGtAYV79Mdm9px+6HA=;
 b=G4j3vC11Vy9ElJgUhJSta1CgSbs0a053n/hw5mK6h+ZDDP7+zIzPmRO3BEWNh9NfmEYnY0tJmaK71IFHCRU773G7KMNXW1SgqSvwO+H9OqGtWDTUBSgF849CaNt3KJGmOhtFEUmTzhnoh+zsASedvp1eF2JzZTydOCxdvznE119nX/er5icBGPdc2KBpQ0/wzBY8Eu5dOZubmD9mUeDmmfyVz8GD4fcT2dMA+Nqxa+/vwaQX1mPqvyk5iGEIv+xN2Ep9SycHPPIYKxdoRSwvWgG7PdLpjUeoNgDHyjIZ2Dcqos9G/2Ki2oc3VSfDKWytjSIgCbgYDYEDFckcm1fNvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6HdyQVikCAk0DiXQKPnFgkUdHnGtAYV79Mdm9px+6HA=;
 b=o9ww2K0X0vWnvyiPdJS+W0kqyAYSATXpxeMK77r3P3asQ8d9H6IUPyX5o8VYOL7LKZVrCl41uRT2PK+XOzV3E5cXFBATdMkDGb7rqWKR29aQRUr9+DNV2Usd56LE0wgbCyU+13AsoSW/TKLTnrgjoz+4OEjjcbSk0kXwsiS7mGgZiY0fYXvBXCZAInOw6DsMy0ptZJVb592gCZIGJY07OE36TDDQ4lhxeU9YwejVl3gxNqWKgkzhjm0pu43PfCAEgVf07Fqakcrs6o9Bjd1QM6IVK9SjxsP3OLkg1R71usosiCyyBbDNb/zQdHMXTkqGFBg89Lb31ce6oLC61IWVSw==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
        Jan Beulich
	<jbeulich@suse.com>,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>,
        Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
        Julien Grall
	<julien@xen.org>, Paul Durrant <paul@xen.org>,
        Kevin Tian
	<kevin.tian@intel.com>
Subject: Re: [RFC PATCH 08/10] xen: pci: remove pcidev_[un]lock[ed] calls
Thread-Topic: [RFC PATCH 08/10] xen: pci: remove pcidev_[un]lock[ed] calls
Thread-Index: AQHYvUN/BRbyNewJG0OqhFjBUWUt7a6z9h8AgCWO7AA=
Date: Mon, 20 Feb 2023 23:13:42 +0000
Message-ID: <875ybwylp6.fsf@epam.com>
References: <20220831141040.13231-1-volodymyr_babchuk@epam.com>
 <20220831141040.13231-9-volodymyr_babchuk@epam.com>
 <alpine.DEB.2.22.394.2301271717090.1978264@ubuntu-linux-20-04-desktop>
In-Reply-To: 
 <alpine.DEB.2.22.394.2301271717090.1978264@ubuntu-linux-20-04-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.8.9; emacs 28.2
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|PA4PR03MB7359:EE_
x-ms-office365-filtering-correlation-id: 7a380ca0-2fc6-42a7-3b7f-08db13981bf3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 HLgDPCm5OkDyPD5YXSO+LZ1Zs/vGgQ1bZFR+i9twKK88FpeJaw8yU081lI5oyQ7lobogfggWNP3ohhbZe1YkfUkbuZBCFw4wmvp2J4vrcR+if1w0LzXcgMiE2TAbufH+ei7ZX0rjPC/74QmDT5Znq4vmp1Ehl5kkaVj6I4vqiTCab2MUzH1lF9GFrGN0KsiOvrlVpPQ/5u9Hw7ebF2VdnTy41vNR75L9T538WzWTrWi8jDHsq2dwLOhBYCCSsXHz1luWLYuavXofmfmKgaKJu1EXnRuR3vyxHHfdvMHX+bigRR1RdIAjYc053iT9jRD/w5nw4Ul13K5ApFZADSjx6KyvSVJ/wDUJlLWntK6+2R4GU6tpfXw4Xw3H1v0hv8BGKQin8q9pYSTm9lvmW1Fswle3R8L7qFKAb4q3vl3H0fCZ4UddRd5Zp1RRjCDuh0tvl1d781RWPzD/luZUC+kqX/9XMwXvuy9aAftWJs8MjhfdpIu9DWFjZTwm0c4s6MjdVyDLoOZhNdqRL+aN6TbFnchYeMInn0juNIxrxmxaJaPr6QAx4xGAa4XLFlh4efJSi1nH+12LAsK5GEMZ/lKMQDOJnsa0/TZ4sxR0BljJL0JzlGUgEUt1w2s6fA0g9KvXG68vdi6oINhbGOWNKpfZeK4SDJMl0MMHEWj/3iCkad0BAPOov5c6HGz3AiBslMoDojulf9BlcrFtTVKGT6Oau+ILbM0KLu1DxyEZJD/QvL4=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(396003)(366004)(136003)(39860400002)(346002)(451199018)(38100700002)(83380400001)(122000001)(36756003)(38070700005)(86362001)(2906002)(8936002)(41300700001)(30864003)(5660300002)(7416002)(6512007)(26005)(55236004)(186003)(6506007)(2616005)(91956017)(4326008)(316002)(6916009)(66556008)(76116006)(8676002)(66946007)(66446008)(66476007)(71200400001)(6486002)(54906003)(64756008)(478600001)(21314003)(559001)(579004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?g1TDgcqq4BCrf90DEr9b276Kd2EnkuBZ4vxNlBCqpoqEEIqe8/Z2C1e1rQ?=
 =?iso-8859-1?Q?MkvU0RAUb5GPxHOLlpRDsHm18AVpcoVUuY4vUrpb+UhuKRp6P7pBOomXNJ?=
 =?iso-8859-1?Q?CxOhFQbSfE45ku56wWWNWD8cIHvHzrTb3x+qNPjuf/we5hFZIW2+suQ/iB?=
 =?iso-8859-1?Q?6j2fXtZxqr40TVgNmbZ1poe2bGWX2cyguCrWn/Xs+IuGyVQhEg5VrGqCz+?=
 =?iso-8859-1?Q?ATxgk2q9QlewkkQW8PsLmcqSAwonMIxzKeWZvE722ZUbd+hmiqi3fVmjsO?=
 =?iso-8859-1?Q?wa+xi6HlnidwXuKC831CG1lrDYv5PCJoxHQGZ8Ja3yXZWJkxXhQ4Zqj07J?=
 =?iso-8859-1?Q?Vza7YgCpWnPhqw8LFzhXvum/MmJkIYKtPkPDEcxny03wOVgmHuD7UG5SnG?=
 =?iso-8859-1?Q?Vu0CCxLKTz6BpybORgwPhhU02GeJssl1dRPUq2ij4J28iqL2IfhrJe+QlO?=
 =?iso-8859-1?Q?c4BZSHm+fr93Ixndz2ga1dQh34M20OK08G8CgBxzFVw5W1KbiN2tc2KLC6?=
 =?iso-8859-1?Q?VlM9dtwHygfnDTnwE1hvNy7WW0h9M4vp9KHb9nYBae4JCOkJCsbQveSFPr?=
 =?iso-8859-1?Q?IgvHS3nUHxs/NDrj/N+UxV6gYzm5OljRz4UkzOMPhHOZdSlR2Oau2ab6/T?=
 =?iso-8859-1?Q?DocyJKfBC8JrU7CenFWebEcZnJ8gqEFLpikFGHDbV7GntuGswGNoZuVogC?=
 =?iso-8859-1?Q?+290XqIxC5xGJdLqAhlKwPESe/aAWFpBhqzrog0Csndcviw5WrTavSJ21o?=
 =?iso-8859-1?Q?6Xl8sqVSPlxrs6bkSH+rNetxkWKmbcQltcXoL4v6g9TZqDld8k5q3cvvYw?=
 =?iso-8859-1?Q?9CoGqW4i0ASIiUpBc5j5XSHPBuUu/fBQtWVpvgQh6LVyjWsLS2Cag7QoCb?=
 =?iso-8859-1?Q?NPjvkL7/zLYeN7R1o970ZjvOBFND55Kju4ZyYjoZpR+dupK/EVYXY3XGzG?=
 =?iso-8859-1?Q?WuoWOSDhBH7iMvwTEKXU7uiZUIyNmNJZUEKeKsUmQglAg9uytegfLjTg/o?=
 =?iso-8859-1?Q?ElUbBsw8lJsxyyBcd9i31u+Ze9A21Nfrgu4EV7edLwHAfMFU2IOiJW7G8p?=
 =?iso-8859-1?Q?mJrPJ/BPBGDjDL2zhGHleDM/+LYv9u9kYFXA2oBaQQ3PT7Vm/YRx+3ydGb?=
 =?iso-8859-1?Q?ciy3EVsKB++fIV2MB6P1BQUV9zC1kMbyTDwYTf3f2beaiUfuyKu8u2FArm?=
 =?iso-8859-1?Q?f+7hE9g8XrZU3OZog9AFRf9CUHia3oKrSGySIXwpo21dNqsm6WCRzvv47/?=
 =?iso-8859-1?Q?qU+Bp5zaGilIVqGd4ngxHhoCCv3T1Ux4mqJ9BI/L8HUXemIs45K4XCYFos?=
 =?iso-8859-1?Q?3hNnNpABrm5JDirGGFgoBGjHZQ5RtsyPWUKvYOPZWq7pknc7bAO8Pb1E4H?=
 =?iso-8859-1?Q?hwcOlcN96X/nArmjPajPHp0vztrU5s4/er0LRQbUsH7NMS89v4qAtfpJqL?=
 =?iso-8859-1?Q?s9hfLs7Sqe1tDZm7N0fZ8ejOwJhykJ/kXxiK9t8DQojnPruiVKsXUUpJ57?=
 =?iso-8859-1?Q?qZ4WqW8ip5Io/imxwTzYTKfN8Ka/I//EWeV280WNdPbfn9iCwEZiFJJ99l?=
 =?iso-8859-1?Q?VmrUE9LsmZ/UcgaIxjLJukqkcCNN2sHRL0FTuM9ShbO3SqEA4YaMOtBVSB?=
 =?iso-8859-1?Q?KOmEBbatrwoSwv+AzljKzFXDdtay1Gj22TJKHJo36qgcVI3ZNxI/EILQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a380ca0-2fc6-42a7-3b7f-08db13981bf3
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2023 23:13:42.7782
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0twmNBvYcKJdKA/oZkkGKI9hs0vCY/iH1Kmz7sU2WAyQBN83beGwSpVRecGvO9otDLIGZPBDAApxNP37d+7gE5zJcY3LWfFH5Tseq2QTKvM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB7359
X-Proofpoint-ORIG-GUID: d9_ZB4r4jGjINRMZoH4VmqsrcSLMvzgr
X-Proofpoint-GUID: d9_ZB4r4jGjINRMZoH4VmqsrcSLMvzgr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-20_17,2023-02-20_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0 mlxlogscore=999
 phishscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302200215


Hi Stefano,

Stefano Stabellini <sstabellini@kernel.org> writes:

> On Wed, 31 Aug 2022, Volodymyr Babchuk wrote:
>> As pci devices are refcounted now and all list that store them are
>> protected by separate locks, we can safely drop global pcidevs_lock.
>>=20
>> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
>
> Up until this patch this patch series introduces:
> - d->pdevs_lock to protect d->pdev_list
> - pci_seg->alldevs_lock to protect pci_seg->alldevs_list
> - iommu->ats_list_lock to protect iommu->ats_devices
> - pdev refcounting to detect a pdev in-use and when to free it
> - pdev->lock to protect pdev->msi_list
>
> They cover a lot of ground.  Are they collectively covering everything
> pcidevs_lock() was protecting?

Well, that is the question. Those patch are in RFC stage because I can't
fully answer your question. I tried my best to introduce proper locking,
but apparently missed couple of places, like

> deassign_device is not protected by pcidevs_lock anymore.
> deassign_device accesses a number of pdev fields, including quarantine,
> phantom_stride and fault.count.
>
> deassign_device could run at the same time as assign_device who sets
> quarantine and other fields.
>

I hope this is all, but problem is that PCI subsystem is old, large and
complex. Fo example, as I wrote earlier, there are places that are
protected with pcidevs_lock(), but do nothing with PCI. I just don't
know what to do with such places. I have a hope that x86 maintainers
would review my changes and give feedback on missed spots.


> It looks like assign_device, deassign_device, and other functions
> accessing/modifying pdev fields should be protected by pdev->lock.

You are right, I'll check again this whole patch to identify places
where additional locks are required. I already have some candidates
besides those you mentioned above.

> In fact, I think it would be safer to make sure every place that
> currently has a pcidevs_lock() gets a pdev->lock (unless there is a
> d->pdevs_lock, pci_seg->alldevs_lock, iommu->ats_list_lock, or another
> lock) ?

I'll try, but problem is that there are places where we don't have
pointer to pdev, so it is not clear what exactly should be locked.

>
>> ---
>>  xen/arch/x86/domctl.c                       |  8 ---
>>  xen/arch/x86/hvm/vioapic.c                  |  2 -
>>  xen/arch/x86/hvm/vmsi.c                     | 12 ----
>>  xen/arch/x86/irq.c                          |  7 ---
>>  xen/arch/x86/msi.c                          | 11 ----
>>  xen/arch/x86/pci.c                          |  4 --
>>  xen/arch/x86/physdev.c                      |  7 +--
>>  xen/common/sysctl.c                         |  2 -
>>  xen/drivers/char/ns16550.c                  |  4 --
>>  xen/drivers/passthrough/amd/iommu_init.c    |  7 ---
>>  xen/drivers/passthrough/amd/iommu_map.c     |  5 --
>>  xen/drivers/passthrough/amd/pci_amd_iommu.c |  4 --
>>  xen/drivers/passthrough/pci.c               | 63 +--------------------
>>  xen/drivers/passthrough/vtd/iommu.c         |  8 ---
>>  xen/drivers/video/vga.c                     |  2 -
>>  15 files changed, 4 insertions(+), 142 deletions(-)
>>=20
>> diff --git a/xen/arch/x86/domctl.c b/xen/arch/x86/domctl.c
>> index 020df615bd..9f4ca03385 100644
>> --- a/xen/arch/x86/domctl.c
>> +++ b/xen/arch/x86/domctl.c
>> @@ -537,11 +537,7 @@ long arch_do_domctl(
>> =20
>>          ret =3D -ESRCH;
>>          if ( is_iommu_enabled(d) )
>> -        {
>> -            pcidevs_lock();
>>              ret =3D pt_irq_create_bind(d, bind);
>> -            pcidevs_unlock();
>> -        }
>>          if ( ret < 0 )
>>              printk(XENLOG_G_ERR "pt_irq_create_bind failed (%ld) for do=
m%d\n",
>>                     ret, d->domain_id);
>> @@ -566,11 +562,7 @@ long arch_do_domctl(
>>              break;
>> =20
>>          if ( is_iommu_enabled(d) )
>> -        {
>> -            pcidevs_lock();
>>              ret =3D pt_irq_destroy_bind(d, bind);
>> -            pcidevs_unlock();
>> -        }
>>          if ( ret < 0 )
>>              printk(XENLOG_G_ERR "pt_irq_destroy_bind failed (%ld) for d=
om%d\n",
>>                     ret, d->domain_id);
>> diff --git a/xen/arch/x86/hvm/vioapic.c b/xen/arch/x86/hvm/vioapic.c
>> index cb7f440160..aa4e7766a3 100644
>> --- a/xen/arch/x86/hvm/vioapic.c
>> +++ b/xen/arch/x86/hvm/vioapic.c
>> @@ -197,7 +197,6 @@ static int vioapic_hwdom_map_gsi(unsigned int gsi, u=
nsigned int trig,
>>          return ret;
>>      }
>> =20
>> -    pcidevs_lock();
>>      ret =3D pt_irq_create_bind(currd, &pt_irq_bind);
>>      if ( ret )
>>      {
>> @@ -207,7 +206,6 @@ static int vioapic_hwdom_map_gsi(unsigned int gsi, u=
nsigned int trig,
>>          unmap_domain_pirq(currd, pirq);
>>          write_unlock(&currd->event_lock);
>>      }
>> -    pcidevs_unlock();
>> =20
>>      return ret;
>>  }
>> diff --git a/xen/arch/x86/hvm/vmsi.c b/xen/arch/x86/hvm/vmsi.c
>> index c9e5f279c5..344bbd646c 100644
>> --- a/xen/arch/x86/hvm/vmsi.c
>> +++ b/xen/arch/x86/hvm/vmsi.c
>> @@ -470,7 +470,6 @@ int msixtbl_pt_register(struct domain *d, struct pir=
q *pirq, uint64_t gtable)
>>      struct msixtbl_entry *entry, *new_entry;
>>      int r =3D -EINVAL;
>> =20
>> -    ASSERT(pcidevs_locked());
>>      ASSERT(rw_is_write_locked(&d->event_lock));
>> =20
>>      if ( !msixtbl_initialised(d) )
>> @@ -540,7 +539,6 @@ void msixtbl_pt_unregister(struct domain *d, struct =
pirq *pirq)
>>      struct pci_dev *pdev;
>>      struct msixtbl_entry *entry;
>> =20
>> -    ASSERT(pcidevs_locked());
>>      ASSERT(rw_is_write_locked(&d->event_lock));
>> =20
>>      if ( !msixtbl_initialised(d) )
>> @@ -686,8 +684,6 @@ static int vpci_msi_update(const struct pci_dev *pde=
v, uint32_t data,
>>  {
>>      unsigned int i;
>> =20
>> -    ASSERT(pcidevs_locked());
>> -
>>      if ( (address & MSI_ADDR_BASE_MASK) !=3D MSI_ADDR_HEADER )
>>      {
>>          gdprintk(XENLOG_ERR, "%pp: PIRQ %u: unsupported address %lx\n",
>> @@ -728,7 +724,6 @@ void vpci_msi_arch_update(struct vpci_msi *msi, cons=
t struct pci_dev *pdev)
>> =20
>>      ASSERT(msi->arch.pirq !=3D INVALID_PIRQ);
>> =20
>> -    pcidevs_lock();
>>      for ( i =3D 0; i < msi->vectors && msi->arch.bound; i++ )
>>      {
>>          struct xen_domctl_bind_pt_irq unbind =3D {
>> @@ -747,7 +742,6 @@ void vpci_msi_arch_update(struct vpci_msi *msi, cons=
t struct pci_dev *pdev)
>> =20
>>      msi->arch.bound =3D !vpci_msi_update(pdev, msi->data, msi->address,
>>                                         msi->vectors, msi->arch.pirq, ms=
i->mask);
>> -    pcidevs_unlock();
>>  }
>> =20
>>  static int vpci_msi_enable(const struct pci_dev *pdev, unsigned int nr,
>> @@ -785,10 +779,8 @@ int vpci_msi_arch_enable(struct vpci_msi *msi, cons=
t struct pci_dev *pdev,
>>          return rc;
>>      msi->arch.pirq =3D rc;
>> =20
>> -    pcidevs_lock();
>>      msi->arch.bound =3D !vpci_msi_update(pdev, msi->data, msi->address,=
 vectors,
>>                                         msi->arch.pirq, msi->mask);
>> -    pcidevs_unlock();
>> =20
>>      return 0;
>>  }
>> @@ -800,7 +792,6 @@ static void vpci_msi_disable(const struct pci_dev *p=
dev, int pirq,
>> =20
>>      ASSERT(pirq !=3D INVALID_PIRQ);
>> =20
>> -    pcidevs_lock();
>>      for ( i =3D 0; i < nr && bound; i++ )
>>      {
>>          struct xen_domctl_bind_pt_irq bind =3D {
>> @@ -816,7 +807,6 @@ static void vpci_msi_disable(const struct pci_dev *p=
dev, int pirq,
>>      write_lock(&pdev->domain->event_lock);
>>      unmap_domain_pirq(pdev->domain, pirq);
>>      write_unlock(&pdev->domain->event_lock);
>> -    pcidevs_unlock();
>>  }
>> =20
>>  void vpci_msi_arch_disable(struct vpci_msi *msi, const struct pci_dev *=
pdev)
>> @@ -863,7 +853,6 @@ int vpci_msix_arch_enable_entry(struct vpci_msix_ent=
ry *entry,
>> =20
>>      entry->arch.pirq =3D rc;
>> =20
>> -    pcidevs_lock();
>>      rc =3D vpci_msi_update(pdev, entry->data, entry->addr, 1, entry->ar=
ch.pirq,
>>                           entry->masked);
>>      if ( rc )
>> @@ -871,7 +860,6 @@ int vpci_msix_arch_enable_entry(struct vpci_msix_ent=
ry *entry,
>>          vpci_msi_disable(pdev, entry->arch.pirq, 1, false);
>>          entry->arch.pirq =3D INVALID_PIRQ;
>>      }
>> -    pcidevs_unlock();
>> =20
>>      return rc;
>>  }
>> diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
>> index d8672a03e1..6a08830a55 100644
>> --- a/xen/arch/x86/irq.c
>> +++ b/xen/arch/x86/irq.c
>> @@ -2156,8 +2156,6 @@ int map_domain_pirq(
>>          struct pci_dev *pdev;
>>          unsigned int nr =3D 0;
>> =20
>> -        ASSERT(pcidevs_locked());
>> -
>>          ret =3D -ENODEV;
>>          if ( !cpu_has_apic )
>>              goto done;
>> @@ -2317,7 +2315,6 @@ int unmap_domain_pirq(struct domain *d, int pirq)
>>      if ( (pirq < 0) || (pirq >=3D d->nr_pirqs) )
>>          return -EINVAL;
>> =20
>> -    ASSERT(pcidevs_locked());
>>      ASSERT(rw_is_write_locked(&d->event_lock));
>> =20
>>      info =3D pirq_info(d, pirq);
>> @@ -2423,7 +2420,6 @@ void free_domain_pirqs(struct domain *d)
>>  {
>>      int i;
>> =20
>> -    pcidevs_lock();
>>      write_lock(&d->event_lock);
>> =20
>>      for ( i =3D 0; i < d->nr_pirqs; i++ )
>> @@ -2431,7 +2427,6 @@ void free_domain_pirqs(struct domain *d)
>>              unmap_domain_pirq(d, i);
>> =20
>>      write_unlock(&d->event_lock);
>> -    pcidevs_unlock();
>>  }
>> =20
>>  static void cf_check dump_irqs(unsigned char key)
>> @@ -2911,7 +2906,6 @@ int allocate_and_map_msi_pirq(struct domain *d, in=
t index, int *pirq_p,
>> =20
>>      msi->irq =3D irq;
>> =20
>> -    pcidevs_lock();
>>      /* Verify or get pirq. */
>>      write_lock(&d->event_lock);
>>      pirq =3D allocate_pirq(d, index, *pirq_p, irq, type, &msi->entry_nr=
);
>> @@ -2927,7 +2921,6 @@ int allocate_and_map_msi_pirq(struct domain *d, in=
t index, int *pirq_p,
>> =20
>>   done:
>>      write_unlock(&d->event_lock);
>> -    pcidevs_unlock();
>>      if ( ret )
>>      {
>>          switch ( type )
>> diff --git a/xen/arch/x86/msi.c b/xen/arch/x86/msi.c
>> index 6b62c4f452..f04b90e235 100644
>> --- a/xen/arch/x86/msi.c
>> +++ b/xen/arch/x86/msi.c
>> @@ -623,7 +623,6 @@ static int msi_capability_init(struct pci_dev *dev,
>>      u8 slot =3D PCI_SLOT(dev->devfn);
>>      u8 func =3D PCI_FUNC(dev->devfn);
>> =20
>> -    ASSERT(pcidevs_locked());
>>      pos =3D pci_find_cap_offset(seg, bus, slot, func, PCI_CAP_ID_MSI);
>>      if ( !pos )
>>          return -ENODEV;
>> @@ -810,8 +809,6 @@ static int msix_capability_init(struct pci_dev *dev,
>>      if ( !pos )
>>          return -ENODEV;
>> =20
>> -    ASSERT(pcidevs_locked());
>> -
>>      control =3D pci_conf_read16(dev->sbdf, msix_control_reg(pos));
>>      /*
>>       * Ensure MSI-X interrupts are masked during setup. Some devices re=
quire
>> @@ -1032,7 +1029,6 @@ static int __pci_enable_msi(struct msi_info *msi, =
struct msi_desc **desc)
>>      struct msi_desc *old_desc;
>>      int ret;
>> =20
>> -    ASSERT(pcidevs_locked());
>>      pdev =3D pci_get_pdev(NULL, msi->sbdf);
>>      if ( !pdev )
>>          return -ENODEV;
>> @@ -1092,7 +1088,6 @@ static int __pci_enable_msix(struct msi_info *msi,=
 struct msi_desc **desc)
>>      struct msi_desc *old_desc;
>>      int ret;
>> =20
>> -    ASSERT(pcidevs_locked());
>>      pdev =3D pci_get_pdev(NULL, msi->sbdf);
>>      if ( !pdev || !pdev->msix )
>>          return -ENODEV;
>> @@ -1191,7 +1186,6 @@ int pci_prepare_msix(u16 seg, u8 bus, u8 devfn, bo=
ol off)
>>      if ( !use_msi )
>>          return 0;
>> =20
>> -    pcidevs_lock();
>>      pdev =3D pci_get_pdev(NULL, PCI_SBDF(seg, bus, devfn));
>>      if ( !pdev )
>>          rc =3D -ENODEV;
>> @@ -1204,7 +1198,6 @@ int pci_prepare_msix(u16 seg, u8 bus, u8 devfn, bo=
ol off)
>>      }
>>      else
>>          rc =3D msix_capability_init(pdev, NULL, NULL);
>> -    pcidevs_unlock();
>> =20
>>      pcidev_put(pdev);
>> =20
>> @@ -1217,8 +1210,6 @@ int pci_prepare_msix(u16 seg, u8 bus, u8 devfn, bo=
ol off)
>>   */
>>  int pci_enable_msi(struct msi_info *msi, struct msi_desc **desc)
>>  {
>> -    ASSERT(pcidevs_locked());
>> -
>>      if ( !use_msi )
>>          return -EPERM;
>> =20
>> @@ -1355,8 +1346,6 @@ int pci_restore_msi_state(struct pci_dev *pdev)
>>      unsigned int type =3D 0, pos =3D 0;
>>      u16 control =3D 0;
>> =20
>> -    ASSERT(pcidevs_locked());
>> -
>>      if ( !use_msi )
>>          return -EOPNOTSUPP;
>> =20
>> diff --git a/xen/arch/x86/pci.c b/xen/arch/x86/pci.c
>> index 1d38f0df7c..4dcd6d96f3 100644
>> --- a/xen/arch/x86/pci.c
>> +++ b/xen/arch/x86/pci.c
>> @@ -88,15 +88,11 @@ int pci_conf_write_intercept(unsigned int seg, unsig=
ned int bdf,
>>      if ( reg < 64 || reg >=3D 256 )
>>          return 0;
>> =20
>> -    pcidevs_lock();
>> -
>>      pdev =3D pci_get_pdev(NULL, PCI_SBDF(seg, bdf));
>>      if ( pdev ) {
>>          rc =3D pci_msi_conf_write_intercept(pdev, reg, size, data);
>>  	pcidev_put(pdev);
>>      }
>> =20
>> -    pcidevs_unlock();
>> -
>>      return rc;
>>  }
>> diff --git a/xen/arch/x86/physdev.c b/xen/arch/x86/physdev.c
>> index 96214a3d40..a41366b609 100644
>> --- a/xen/arch/x86/physdev.c
>> +++ b/xen/arch/x86/physdev.c
>> @@ -162,11 +162,9 @@ int physdev_unmap_pirq(domid_t domid, int pirq)
>>              goto free_domain;
>>      }
>> =20
>> -    pcidevs_lock();
>>      write_lock(&d->event_lock);
>>      ret =3D unmap_domain_pirq(d, pirq);
>>      write_unlock(&d->event_lock);
>> -    pcidevs_unlock();
>> =20
>>   free_domain:
>>      rcu_unlock_domain(d);
>> @@ -530,7 +528,6 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(=
void) arg)
>>          if ( copy_from_guest(&restore_msi, arg, 1) !=3D 0 )
>>              break;
>> =20
>> -        pcidevs_lock();
>>          pdev =3D pci_get_pdev(NULL,
>>                              PCI_SBDF(0, restore_msi.bus, restore_msi.de=
vfn));
>>          if ( pdev )
>> @@ -541,7 +538,6 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(=
void) arg)
>>          else
>>              ret =3D -ENODEV;
>> =20
>> -        pcidevs_unlock();
>>          break;
>>      }
>> =20
>> @@ -553,7 +549,6 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(=
void) arg)
>>          if ( copy_from_guest(&dev, arg, 1) !=3D 0 )
>>              break;
>> =20
>> -        pcidevs_lock();
>>          pdev =3D pci_get_pdev(NULL, PCI_SBDF(dev.seg, dev.bus, dev.devf=
n));
>>          if ( pdev )
>>          {
>> @@ -562,7 +557,7 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(=
void) arg)
>>          }
>>          else
>>              ret =3D -ENODEV;
>> -        pcidevs_unlock();
>> +
>>          break;
>>      }
>> =20
>> diff --git a/xen/common/sysctl.c b/xen/common/sysctl.c
>> index 0feef94cd2..6bb8c5c295 100644
>> --- a/xen/common/sysctl.c
>> +++ b/xen/common/sysctl.c
>> @@ -446,7 +446,6 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) =
u_sysctl)
>>                  break;
>>              }
>> =20
>> -            pcidevs_lock();
>>              pdev =3D pci_get_pdev(NULL, PCI_SBDF(dev.seg, dev.bus, dev.=
devfn));
>>              if ( !pdev )
>>                  node =3D XEN_INVALID_DEV;
>> @@ -454,7 +453,6 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) =
u_sysctl)
>>                  node =3D XEN_INVALID_NODE_ID;
>>              else
>>                  node =3D pdev->node;
>> -            pcidevs_unlock();
>> =20
>>              if ( pdev )
>>                  pcidev_put(pdev);
>> diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
>> index 01a05c9aa8..66c10b18e5 100644
>> --- a/xen/drivers/char/ns16550.c
>> +++ b/xen/drivers/char/ns16550.c
>> @@ -445,8 +445,6 @@ static void __init cf_check ns16550_init_postirq(str=
uct serial_port *port)
>>              {
>>                  struct msi_desc *msi_desc =3D NULL;
>> =20
>> -                pcidevs_lock();
>> -
>>                  rc =3D pci_enable_msi(&msi, &msi_desc);
>>                  if ( !rc )
>>                  {
>> @@ -460,8 +458,6 @@ static void __init cf_check ns16550_init_postirq(str=
uct serial_port *port)
>>                          pci_disable_msi(msi_desc);
>>                  }
>> =20
>> -                pcidevs_unlock();
>> -
>>                  if ( rc )
>>                  {
>>                      uart->irq =3D 0;
>> diff --git a/xen/drivers/passthrough/amd/iommu_init.c b/xen/drivers/pass=
through/amd/iommu_init.c
>> index 7c1713a602..e42af65a40 100644
>> --- a/xen/drivers/passthrough/amd/iommu_init.c
>> +++ b/xen/drivers/passthrough/amd/iommu_init.c
>> @@ -638,10 +638,7 @@ static void cf_check parse_ppr_log_entry(struct amd=
_iommu *iommu, u32 entry[])
>>      uint16_t device_id =3D iommu_get_devid_from_cmd(entry[0]);
>>      struct pci_dev *pdev;
>> =20
>> -    pcidevs_lock();
>>      pdev =3D pci_get_real_pdev(PCI_SBDF(iommu->seg, device_id));
>> -    pcidevs_unlock();
>> -
>>      if ( pdev )
>>          guest_iommu_add_ppr_log(pdev->domain, entry);
>>      pcidev_put(pdev);
>> @@ -747,14 +744,12 @@ static bool_t __init set_iommu_interrupt_handler(s=
truct amd_iommu *iommu)
>>          return 0;
>>      }
>> =20
>> -    pcidevs_lock();
>>      /*
>>       * XXX: it is unclear if this device can be removed. Right now
>>       * there is no code that clears msi.dev, so no one will decrease
>>       * refcount on it.
>>       */
>>      iommu->msi.dev =3D pci_get_pdev(NULL, PCI_SBDF(iommu->seg, iommu->b=
df));
>> -    pcidevs_unlock();
>>      if ( !iommu->msi.dev )
>>      {
>>          AMD_IOMMU_WARN("no pdev for %pp\n",
>> @@ -1289,9 +1284,7 @@ static int __init cf_check amd_iommu_setup_device_=
table(
>>              {
>>                  if ( !pci_init )
>>                      continue;
>> -                pcidevs_lock();
>>                  pdev =3D pci_get_pdev(NULL, PCI_SBDF(seg, bdf));
>> -                pcidevs_unlock();
>>              }
>> =20
>>              if ( pdev && (pdev->msix || pdev->msi_maxvec) )
>> diff --git a/xen/drivers/passthrough/amd/iommu_map.c b/xen/drivers/passt=
hrough/amd/iommu_map.c
>> index 9d621e3d36..d04aa37538 100644
>> --- a/xen/drivers/passthrough/amd/iommu_map.c
>> +++ b/xen/drivers/passthrough/amd/iommu_map.c
>> @@ -726,9 +726,7 @@ int cf_check amd_iommu_get_reserved_device_memory(
>>              /* May need to trigger the workaround in find_iommu_for_dev=
ice(). */
>>              struct pci_dev *pdev;
>> =20
>> -            pcidevs_lock();
>>              pdev =3D pci_get_pdev(NULL, sbdf);
>> -            pcidevs_unlock();
>> =20
>>              if ( pdev )
>>              {
>> @@ -848,7 +846,6 @@ int cf_check amd_iommu_quarantine_init(struct pci_de=
v *pdev, bool scratch_page)
>>      const struct ivrs_mappings *ivrs_mappings =3D get_ivrs_mappings(pde=
v->seg);
>>      int rc;
>> =20
>> -    ASSERT(pcidevs_locked());
>>      ASSERT(!hd->arch.amd.root_table);
>>      ASSERT(page_list_empty(&hd->arch.pgtables.list));
>> =20
>> @@ -903,8 +900,6 @@ void amd_iommu_quarantine_teardown(struct pci_dev *p=
dev)
>>  {
>>      struct domain_iommu *hd =3D dom_iommu(dom_io);
>> =20
>> -    ASSERT(pcidevs_locked());
>> -
>>      if ( !pdev->arch.amd.root_table )
>>          return;
>> =20
>> diff --git a/xen/drivers/passthrough/amd/pci_amd_iommu.c b/xen/drivers/p=
assthrough/amd/pci_amd_iommu.c
>> index 955f3af57a..919e30129e 100644
>> --- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
>> +++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
>> @@ -268,8 +268,6 @@ static int __must_check amd_iommu_setup_domain_devic=
e(
>>                      req_id, pdev->type, page_to_maddr(root_pg),
>>                      domid, hd->arch.amd.paging_mode);
>> =20
>> -    ASSERT(pcidevs_locked());
>> -
>>      if ( pci_ats_device(iommu->seg, bus, pdev->devfn) &&
>>           !ivrs_dev->block_ats &&
>>           iommu_has_cap(iommu, PCI_CAP_IOTLB_SHIFT) &&
>> @@ -416,8 +414,6 @@ static void amd_iommu_disable_domain_device(const st=
ruct domain *domain,
>>      if ( QUARANTINE_SKIP(domain, pdev) )
>>          return;
>> =20
>> -    ASSERT(pcidevs_locked());
>> -
>>      if ( pci_ats_device(iommu->seg, bus, pdev->devfn) &&
>>           pci_ats_enabled(iommu->seg, bus, pdev->devfn) )
>>      {
>> diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci=
.c
>> index c83397211b..cc62a5aec4 100644
>> --- a/xen/drivers/passthrough/pci.c
>> +++ b/xen/drivers/passthrough/pci.c
>> @@ -517,7 +517,6 @@ int __init pci_hide_device(unsigned int seg, unsigne=
d int bus,
>>      struct pci_seg *pseg;
>>      int rc =3D -ENOMEM;
>> =20
>> -    pcidevs_lock();
>>      pseg =3D alloc_pseg(seg);
>>      if ( pseg )
>>      {
>> @@ -528,7 +527,6 @@ int __init pci_hide_device(unsigned int seg, unsigne=
d int bus,
>>              rc =3D 0;
>>          }
>>      }
>> -    pcidevs_unlock();
>> =20
>>      return rc;
>>  }
>> @@ -588,8 +586,6 @@ struct pci_dev *pci_get_pdev(struct domain *d, pci_s=
bdf_t sbdf)
>>  {
>>      struct pci_dev *pdev;
>> =20
>> -    ASSERT(d || pcidevs_locked());
>> -
>>      /*
>>       * The hardware domain owns the majority of the devices in the syst=
em.
>>       * When there are multiple segments, traversing the per-segment lis=
t is
>> @@ -730,7 +726,6 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>>          pdev_type =3D "device";
>>      else if ( info->is_virtfn )
>>      {
>> -        pcidevs_lock();
>>          pdev =3D pci_get_pdev(NULL,
>>                              PCI_SBDF(seg, info->physfn.bus,
>>                                       info->physfn.devfn));
>> @@ -739,7 +734,6 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>>              pf_is_extfn =3D pdev->info.is_extfn;
>>              pcidev_put(pdev);
>>          }
>> -        pcidevs_unlock();
>>          if ( !pdev )
>>              pci_add_device(seg, info->physfn.bus, info->physfn.devfn,
>>                             NULL, node);
>> @@ -756,7 +750,6 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>> =20
>>      ret =3D -ENOMEM;
>> =20
>> -    pcidevs_lock();
>>      pseg =3D alloc_pseg(seg);
>>      if ( !pseg )
>>          goto out;
>> @@ -858,7 +851,6 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>>      pci_enable_acs(pdev);
>> =20
>>  out:
>> -    pcidevs_unlock();
>>      if ( !ret )
>>      {
>>          printk(XENLOG_DEBUG "PCI add %s %pp\n", pdev_type,  &pdev->sbdf=
);
>> @@ -889,7 +881,6 @@ int pci_remove_device(u16 seg, u8 bus, u8 devfn)
>>      if ( !pseg )
>>          return -ENODEV;
>> =20
>> -    pcidevs_lock();
>>      spin_lock(&pseg->alldevs_lock);
>>      list_for_each_entry ( pdev, &pseg->alldevs_list, alldevs_list )
>>          if ( pdev->bus =3D=3D bus && pdev->devfn =3D=3D devfn )
>> @@ -910,12 +901,10 @@ int pci_remove_device(u16 seg, u8 bus, u8 devfn)
>>              break;
>>          }
>> =20
>> -    pcidevs_unlock();
>>      spin_unlock(&pseg->alldevs_lock);
>>      return ret;
>>  }
>> =20
>> -/* Caller should hold the pcidevs_lock */
>>  static int deassign_device(struct domain *d, uint16_t seg, uint8_t bus,
>>                             uint8_t devfn)
>>  {
>> @@ -927,7 +916,6 @@ static int deassign_device(struct domain *d, uint16_=
t seg, uint8_t bus,
>>      if ( !is_iommu_enabled(d) )
>>          return -EINVAL;
>> =20
>> -    ASSERT(pcidevs_locked());
>>      pdev =3D pci_get_pdev(d, PCI_SBDF(seg, bus, devfn));
>>      if ( !pdev )
>>          return -ENODEV;
>> @@ -981,13 +969,10 @@ int pci_release_devices(struct domain *d)
>>      u8 bus, devfn;
>>      int ret;
>> =20
>> -    pcidevs_lock();
>>      ret =3D arch_pci_clean_pirqs(d);
>>      if ( ret )
>> -    {
>> -        pcidevs_unlock();
>>          return ret;
>> -    }
>> +
>>      spin_lock(&d->pdevs_lock);
>>      list_for_each_entry_safe ( pdev, tmp, &d->pdev_list, domain_list )
>>      {
>> @@ -996,7 +981,6 @@ int pci_release_devices(struct domain *d)
>>          ret =3D deassign_device(d, pdev->seg, bus, devfn) ?: ret;
>>      }
>>      spin_unlock(&d->pdevs_lock);
>> -    pcidevs_unlock();
>> =20
>>      return ret;
>>  }
>> @@ -1094,7 +1078,6 @@ void pci_check_disable_device(u16 seg, u8 bus, u8 =
devfn)
>>      s_time_t now =3D NOW();
>>      u16 cword;
>> =20
>> -    pcidevs_lock();
>>      pdev =3D pci_get_real_pdev(PCI_SBDF(seg, bus, devfn));
>>      if ( pdev )
>>      {
>> @@ -1108,7 +1091,6 @@ void pci_check_disable_device(u16 seg, u8 bus, u8 =
devfn)
>>              pdev =3D NULL;
>>          }
>>      }
>> -    pcidevs_unlock();
>> =20
>>      if ( !pdev )
>>          return;
>> @@ -1164,13 +1146,7 @@ static int __init cf_check _scan_pci_devices(stru=
ct pci_seg *pseg, void *arg)
>> =20
>>  int __init scan_pci_devices(void)
>>  {
>> -    int ret;
>> -
>> -    pcidevs_lock();
>> -    ret =3D pci_segments_iterate(_scan_pci_devices, NULL);
>> -    pcidevs_unlock();
>> -
>> -    return ret;
>> +    return pci_segments_iterate(_scan_pci_devices, NULL);
>>  }
>> =20
>>  struct setup_hwdom {
>> @@ -1239,19 +1215,11 @@ static int __hwdom_init cf_check _setup_hwdom_pc=
i_devices(
>> =20
>>              pcidev_put(pdev);
>>              if ( iommu_verbose )
>> -            {
>> -                pcidevs_unlock();
>>                  process_pending_softirqs();
>> -                pcidevs_lock();
>> -            }
>>          }
>> =20
>>          if ( !iommu_verbose )
>> -        {
>> -            pcidevs_unlock();
>>              process_pending_softirqs();
>> -            pcidevs_lock();
>> -        }
>>      }
>> =20
>>      return 0;
>> @@ -1262,9 +1230,7 @@ void __hwdom_init setup_hwdom_pci_devices(
>>  {
>>      struct setup_hwdom ctxt =3D { .d =3D d, .handler =3D handler };
>> =20
>> -    pcidevs_lock();
>>      pci_segments_iterate(_setup_hwdom_pci_devices, &ctxt);
>> -    pcidevs_unlock();
>>  }
>> =20
>>  /* APEI not supported on ARM yet. */
>> @@ -1396,9 +1362,7 @@ static int cf_check _dump_pci_devices(struct pci_s=
eg *pseg, void *arg)
>>  static void cf_check dump_pci_devices(unsigned char ch)
>>  {
>>      printk("=3D=3D=3D=3D PCI devices =3D=3D=3D=3D\n");
>> -    pcidevs_lock();
>>      pci_segments_iterate(_dump_pci_devices, NULL);
>> -    pcidevs_unlock();
>>  }
>> =20
>>  static int __init cf_check setup_dump_pcidevs(void)
>> @@ -1417,8 +1381,6 @@ static int iommu_add_device(struct pci_dev *pdev)
>>      if ( !pdev->domain )
>>          return -EINVAL;
>> =20
>> -    ASSERT(pcidevs_locked());
>> -
>>      hd =3D dom_iommu(pdev->domain);
>>      if ( !is_iommu_enabled(pdev->domain) )
>>          return 0;
>> @@ -1446,8 +1408,6 @@ static int iommu_enable_device(struct pci_dev *pde=
v)
>>      if ( !pdev->domain )
>>          return -EINVAL;
>> =20
>> -    ASSERT(pcidevs_locked());
>> -
>>      hd =3D dom_iommu(pdev->domain);
>>      if ( !is_iommu_enabled(pdev->domain) ||
>>           !hd->platform_ops->enable_device )
>> @@ -1494,7 +1454,6 @@ static int device_assigned(struct pci_dev *pdev)
>>  {
>>      int rc =3D 0;
>> =20
>> -    ASSERT(pcidevs_locked());
>>      /*
>>       * If the device exists and it is not owned by either the hardware
>>       * domain or dom_io then it must be assigned to a guest, or be
>> @@ -1507,7 +1466,6 @@ static int device_assigned(struct pci_dev *pdev)
>>      return rc;
>>  }
>> =20
>> -/* Caller should hold the pcidevs_lock */
>>  static int assign_device(struct domain *d, struct pci_dev *pdev, u32 fl=
ag)
>>  {
>>      const struct domain_iommu *hd =3D dom_iommu(d);
>> @@ -1521,7 +1479,6 @@ static int assign_device(struct domain *d, struct =
pci_dev *pdev, u32 flag)
>>          return -EXDEV;
>> =20
>>      /* device_assigned() should already have cleared the device for ass=
ignment */
>> -    ASSERT(pcidevs_locked());
>>      ASSERT(pdev && (pdev->domain =3D=3D hardware_domain ||
>>                      pdev->domain =3D=3D dom_io));
>> =20
>> @@ -1587,7 +1544,6 @@ static int iommu_get_device_group(
>>      if ( group_id < 0 )
>>          return group_id;
>> =20
>> -    pcidevs_lock();
>>      spin_lock(&d->pdevs_lock);
>>      for_each_pdev( d, pdev )
>>      {
>> @@ -1603,7 +1559,6 @@ static int iommu_get_device_group(
>>          sdev_id =3D iommu_call(ops, get_device_group_id, seg, b, df);
>>          if ( sdev_id < 0 )
>>          {
>> -            pcidevs_unlock();
>>              spin_unlock(&d->pdevs_lock);
>>              return sdev_id;
>>          }
>> @@ -1614,7 +1569,6 @@ static int iommu_get_device_group(
>> =20
>>              if ( unlikely(copy_to_guest_offset(buf, i, &bdf, 1)) )
>>              {
>> -                pcidevs_unlock();
>>                  spin_unlock(&d->pdevs_lock);
>>                  return -EFAULT;
>>              }
>> @@ -1622,7 +1576,6 @@ static int iommu_get_device_group(
>>          }
>>      }
>> =20
>> -    pcidevs_unlock();
>>      spin_unlock(&d->pdevs_lock);
>> =20
>>      return i;
>> @@ -1630,17 +1583,12 @@ static int iommu_get_device_group(
>> =20
>>  void iommu_dev_iotlb_flush_timeout(struct domain *d, struct pci_dev *pd=
ev)
>>  {
>> -    pcidevs_lock();
>> -
>>      /* iommu->ats_list_lock is taken by the caller of this function */
>>      disable_ats_device(pdev);
>> =20
>>      ASSERT(pdev->domain);
>>      if ( d !=3D pdev->domain )
>> -    {
>> -        pcidevs_unlock();
>>          return;
>> -    }
>> =20
>>      pdev->broken =3D true;
>> =20
>> @@ -1649,8 +1597,6 @@ void iommu_dev_iotlb_flush_timeout(struct domain *=
d, struct pci_dev *pdev)
>>                 d->domain_id, &pdev->sbdf);
>>      if ( !is_hardware_domain(d) )
>>          domain_crash(d);
>> -
>> -    pcidevs_unlock();
>>  }
>> =20
>>  int iommu_do_pci_domctl(
>> @@ -1740,7 +1686,6 @@ int iommu_do_pci_domctl(
>>              break;
>>          }
>> =20
>> -        pcidevs_lock();
>>          ret =3D device_assigned(pdev);
>>          if ( domctl->cmd =3D=3D XEN_DOMCTL_test_assign_device )
>>          {
>> @@ -1755,7 +1700,7 @@ int iommu_do_pci_domctl(
>>              ret =3D assign_device(d, pdev, flags);
>> =20
>>          pcidev_put(pdev);
>> -        pcidevs_unlock();
>> +
>>          if ( ret =3D=3D -ERESTART )
>>              ret =3D hypercall_create_continuation(__HYPERVISOR_domctl,
>>                                                  "h", u_domctl);
>> @@ -1787,9 +1732,7 @@ int iommu_do_pci_domctl(
>>          bus =3D PCI_BUS(machine_sbdf);
>>          devfn =3D PCI_DEVFN(machine_sbdf);
>> =20
>> -        pcidevs_lock();
>>          ret =3D deassign_device(d, seg, bus, devfn);
>> -        pcidevs_unlock();
>>          break;
>> =20
>>      default:
>> diff --git a/xen/drivers/passthrough/vtd/iommu.c b/xen/drivers/passthrou=
gh/vtd/iommu.c
>> index 42661f22f4..87868188b7 100644
>> --- a/xen/drivers/passthrough/vtd/iommu.c
>> +++ b/xen/drivers/passthrough/vtd/iommu.c
>> @@ -1490,7 +1490,6 @@ int domain_context_mapping_one(
>>      if ( QUARANTINE_SKIP(domain, pgd_maddr) )
>>          return 0;
>> =20
>> -    ASSERT(pcidevs_locked());
>>      spin_lock(&iommu->lock);
>>      maddr =3D bus_to_context_maddr(iommu, bus);
>>      context_entries =3D (struct context_entry *)map_vtd_domain_page(mad=
dr);
>> @@ -1711,8 +1710,6 @@ static int domain_context_mapping(struct domain *d=
omain, u8 devfn,
>>      if ( drhd && drhd->iommu->node !=3D NUMA_NO_NODE )
>>          dom_iommu(domain)->node =3D drhd->iommu->node;
>> =20
>> -    ASSERT(pcidevs_locked());
>> -
>>      for_each_rmrr_device( rmrr, bdf, i )
>>      {
>>          if ( rmrr->segment !=3D pdev->seg || bdf !=3D pdev->sbdf.bdf )
>> @@ -2072,8 +2069,6 @@ static void quarantine_teardown(struct pci_dev *pd=
ev,
>>  {
>>      struct domain_iommu *hd =3D dom_iommu(dom_io);
>> =20
>> -    ASSERT(pcidevs_locked());
>> -
>>      if ( !pdev->arch.vtd.pgd_maddr )
>>          return;
>> =20
>> @@ -2341,8 +2336,6 @@ static int cf_check intel_iommu_add_device(u8 devf=
n, struct pci_dev *pdev)
>>      u16 bdf;
>>      int ret, i;
>> =20
>> -    ASSERT(pcidevs_locked());
>> -
>>      if ( !pdev->domain )
>>          return -EINVAL;
>> =20
>> @@ -3176,7 +3169,6 @@ static int cf_check intel_iommu_quarantine_init(st=
ruct pci_dev *pdev,
>>      bool rmrr_found =3D false;
>>      int rc;
>> =20
>> -    ASSERT(pcidevs_locked());
>>      ASSERT(!hd->arch.vtd.pgd_maddr);
>>      ASSERT(page_list_empty(&hd->arch.pgtables.list));
>> =20
>> diff --git a/xen/drivers/video/vga.c b/xen/drivers/video/vga.c
>> index 1298f3a7b6..1f7c496114 100644
>> --- a/xen/drivers/video/vga.c
>> +++ b/xen/drivers/video/vga.c
>> @@ -117,9 +117,7 @@ void __init video_endboot(void)
>>                  struct pci_dev *pdev;
>>                  u8 b =3D bus, df =3D devfn, sb;
>> =20
>> -                pcidevs_lock();
>>                  pdev =3D pci_get_pdev(NULL, PCI_SBDF(0, bus, devfn));
>> -                pcidevs_unlock();
>> =20
>>                  if ( !pdev ||
>>                       pci_conf_read16(PCI_SBDF(0, bus, devfn),
>> --=20
>> 2.36.1
>>=20

