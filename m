Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A95A169D654
	for <lists+xen-devel@lfdr.de>; Mon, 20 Feb 2023 23:30:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.498413.769277 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUEfJ-0000in-If; Mon, 20 Feb 2023 22:29:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 498413.769277; Mon, 20 Feb 2023 22:29:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUEfJ-0000fz-FV; Mon, 20 Feb 2023 22:29:45 +0000
Received: by outflank-mailman (input) for mailman id 498413;
 Mon, 20 Feb 2023 22:29:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HNad=6Q=epam.com=prvs=6415815d8c=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1pUEfI-0000ft-Ao
 for xen-devel@lists.xenproject.org; Mon, 20 Feb 2023 22:29:44 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 118c2b6c-b16e-11ed-933d-83870f6b2ba8;
 Mon, 20 Feb 2023 23:29:42 +0100 (CET)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31KHN8NS003537; Mon, 20 Feb 2023 22:29:37 GMT
Received: from eur04-db3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2051.outbound.protection.outlook.com [104.47.12.51])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3nvd0hgpas-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Feb 2023 22:29:36 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by AM7PR03MB6184.eurprd03.prod.outlook.com (2603:10a6:20b:141::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.21; Mon, 20 Feb
 2023 22:29:32 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::967e:573a:15a9:176e]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::967e:573a:15a9:176e%4]) with mapi id 15.20.6111.018; Mon, 20 Feb 2023
 22:29:31 +0000
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
X-Inumbo-ID: 118c2b6c-b16e-11ed-933d-83870f6b2ba8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lN8HYgBW2xXMKFN5iSiIovwYbEbJMdmG8f2oynVewZYC0HLyVJXiN+PKN1XeSPE4uIku885xtbWLvdgF0RkRNVYCSIEnjAxkD92coeRUU4lu1IWShwfqSWISQJGGEF6bToR3Om+9NxcMSdFGy/ENzLsXohdaH51i9Ykwea9VASJCgUUTqW/MohLCicwCJn/9CowoOfD062vvkKJNQjXcjOXIyc9OVHzjEuye7xEupj3KfkkU7V1FFX9ym5wF+4G1pAy+oBL33UQbK/HjsppiVbyJsnFzNZ97rdm9SEIr6jSHVV6dYc+3CbjUzrEiSqdIL0Rs+bYy6UhPX5wZQt8CNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rgR3Iu1Rr9Nu0FdGhM/WZ/b0x1eHMMrtpWQ4dd8r63Q=;
 b=AG62hJaolsLJ6lmEEGu2Ea6JfuO0XzkClyEvRd7S08D3j+yjlke6xZLzzYJND29ffNKHm2zQJ92NjtHMeNQHekdE2WWwhyuTKWP5LjkrmccF6lc+sJcOCpymhl6GVpPCC7Q/cc22MfPaEDt7rw7052WpOKnpLeii8c1+t+mDY5bHFH6rX+DkLdehAIx3x4z2kMcGGQxh8U6c5jVR7nhySw0tWfvDzTkpMnR1EYtFW0OhhIAcpHEqf49Reg49Szhe3ihCCsrrejtf23Fg0yoZSaJV7lpLSYBj7GI8zije5vY4siCxqUWPtPQOK8I5Q0ENJU3pS6S5XQS1BrxGdB3eKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rgR3Iu1Rr9Nu0FdGhM/WZ/b0x1eHMMrtpWQ4dd8r63Q=;
 b=XBlAYr3rwbKrpGoc+3ZJeCD4wXXazBOvZ9bBuY2iF7fPK4fpZYMlOxIZejBJmJAUiePaGzp+wFmC5YXV1vhQj51zC1Y2sCFyaeJOCUDh6j7rULGJcsfND/SxmPBOusj1PVH89Lp2toPMctcryw8h8KrgW1+8HozlcTPhZLv6IyJ9C/HmBRusww1MEbHR2a6djtjEnMr9Hpb3OMnpv/EYXLsbq5jHiUFqSgwRRK+hVt7BosctPTlYEwThaBiYVPpS4teqn7SeBC0K8FNj8OlcvlOVDNAjZHK0s11XyDnZhxX5yu2ZhxjA+HaAzn7czdFroFL0CxLU4XANJpsC4ekknA==
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
	<julien@xen.org>, Paul Durrant <paul@xen.org>
Subject: Re: [RFC PATCH 07/10] xen: pci: add per-device locking
Thread-Topic: [RFC PATCH 07/10] xen: pci: add per-device locking
Thread-Index: AQHYvUN/+u7dK30KdkO8lqgvo0jPya6z7CCAgCWN6wA=
Date: Mon, 20 Feb 2023 22:29:31 +0000
Message-ID: <87cz64ynqs.fsf@epam.com>
References: <20220831141040.13231-1-volodymyr_babchuk@epam.com>
 <20220831141040.13231-8-volodymyr_babchuk@epam.com>
 <alpine.DEB.2.22.394.2301271615330.1978264@ubuntu-linux-20-04-desktop>
In-Reply-To: 
 <alpine.DEB.2.22.394.2301271615330.1978264@ubuntu-linux-20-04-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.8.9; emacs 28.2
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|AM7PR03MB6184:EE_
x-ms-office365-filtering-correlation-id: 0b9bcd88-38a2-48ba-637f-08db1391efe3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 OdmpZP6XG5yMzr5gK5G3IU9fmdt2Xrn6uZ0Fzf0ojZMMLUbDm/1vMOCMjPWD/yVm026P698SpfyVyXu//aCsRHpOxFS4tbjrLvB8NL2yOcxRFA5kBQyx8CeBjpX5fwAqIlapv5FaTk5csSX2jXHf+WjU54eCSwqsR87zdbuMfcvaARRUFrKaYBsEOGL1uQLeo/rvcpxKI/rvvf0XWyfor3pPL+93F0EJQIJo0vBhq3wj1Kx4mIHme5Q9r1AYdJNXMvoKDXVQAT5JvWVZ3fNv6CH7kJLOqsX5hVQTVaGvknZwbnCXvl4qZbogPma+syPpT51TiwGCxkbDG10OjvT8/kS9iLc5Wq2Nzr9s5G+EBFIRtVO9M9THJlvYpnPTwzU8HTHPjOX4+q+Zb9DM5Nh0PNj88DJ+N+/0Y9bznxc8wrxBnWi9+NYke9wkwJKt1gZZAvP/wa3wNM8CU8G6NstBIPgVEaQ865nXdRPZF+vgoKikZ/7kHVQE5kFuUwBbWvX8zTbTy5cfKZobJTk360hPCakZJDD8NkMv1xr9GZYWTwr37cJOJca+NUNphK2H9XGBlHSHpS9/fbLgGz5a30BF5iXtKXpV9gwxvKyuxjdoUNtvTCYBHLr11/OaF427vBCWWiUoWnYdYVQpR7fVeozWuVdhAu7sm+UQr+92D272b6IfXlIIZNNgr+ARUnf40RV3AbOXCsbzubTMFRjPTyudfg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(366004)(396003)(376002)(346002)(39860400002)(451199018)(122000001)(38100700002)(2906002)(8936002)(5660300002)(26005)(6512007)(54906003)(76116006)(41300700001)(83380400001)(91956017)(38070700005)(2616005)(36756003)(6916009)(66446008)(8676002)(66476007)(66556008)(64756008)(4326008)(66946007)(6486002)(55236004)(86362001)(478600001)(6506007)(316002)(186003)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?GqIC3WT7Z5iE0REFMyNlcA2pM09+cZIeUPs2DpEUNwR5ke1ZoyGK+tdDl0?=
 =?iso-8859-1?Q?2v6EgjiQCHe3ICJgoRjyaPL1aAH/pgM84aoTJxZ2fl+UG0B9U6NxyH6mF6?=
 =?iso-8859-1?Q?BZXVv9vKaEDsROxVW8wnQQfYNlYcd3fYcAzEZsrwhHKLAeZEZfksg/i9W8?=
 =?iso-8859-1?Q?Rh84olG2JEXkxXyaGydf46Oj6Mw5oGVXg6j9e1V0fIIYOdJpugGQcHqcG9?=
 =?iso-8859-1?Q?avByIgwcZt1TnR4nXrUfpYe5chwMWSoFaklRNapIM5EQJM1HenPjx/cEio?=
 =?iso-8859-1?Q?X+ycbCUC4LnzF3+JmEiYoUAUl5TwYoL9gze2sUnJ6joZNPT9d8yBhx6tf6?=
 =?iso-8859-1?Q?vo55IvrstLf1xld8g6yVTJzLD/Xa6f7Mt0jmQBQfnkBeZ83IFaGZC7afIR?=
 =?iso-8859-1?Q?eSEJB+CW6u7rEqWzr72KKt+Sdit+da1DCvjlgSWpJ6Ov0vtLgCcciLGnGS?=
 =?iso-8859-1?Q?n4puYrHWOVKkzPt7kNDTWXeVeMTYPvGkEcU/T4Jbdys4MJSY5joapMkoRo?=
 =?iso-8859-1?Q?LNmEyYhE1eP4f63+Zz0wRsT8624JIm0KuvCmYI0mzT2BxGrBASThgzALmT?=
 =?iso-8859-1?Q?gfsX6aZcHe6vSTXefUXRItVeqikySyPof6RGLAPkj/vcVpIyRYfqYiBPIQ?=
 =?iso-8859-1?Q?En6oQB4BEASz/RJ8nAjkSH2uXP0LG8nilqjVIBgqGnEKYG4ELDNjPODFVR?=
 =?iso-8859-1?Q?Co8V/OQI7rkO4kuHAyhxjuTQt64YIwL/iSUj/hBDuaP29j1OoyPAZbreFJ?=
 =?iso-8859-1?Q?h/75+C+HmNZkEGnRkYwYk+qwbI0GgktE/h94bgiQK5hBjzjLz76YT7xvAl?=
 =?iso-8859-1?Q?tH3Mh7TJiMUivBtXE3/yPzvtEesAVbpov9wMm121FiZQWUVKuDRax7TqmB?=
 =?iso-8859-1?Q?T+qujpWq5kK18IS1R16FsBGUIfcgp5vybv1dRMC+f4rmkv9OBT/62sIvv/?=
 =?iso-8859-1?Q?rw0VY5Oy7tKk7XDr402FzAXfWQa8eFUTXG0zRIqxx2mMfF43wHxQXMC/L2?=
 =?iso-8859-1?Q?N4e3YVqFLkteFOqPPlZM4D86p+LGr8/Znw3UOBuulMsEbDMrHl0pVQURGZ?=
 =?iso-8859-1?Q?M90e7q7gmdMWpmdG4zVJr72YzM6CpiZ6b//j/KfJPE8m4jZumJFWWVxk2G?=
 =?iso-8859-1?Q?VDgwLyMjPCOb/QP2cmEX6TBvj1KPWtvx6aQ5+3R4DJLQtiEeK3jzUH1gvW?=
 =?iso-8859-1?Q?dgQy+Vu5KAmoWETPjybOegBtLFiP8DuKfAy1LTdJshEN3RnCBiVjcYmsDT?=
 =?iso-8859-1?Q?jxlgw0+RZxNOoivqCJEsjgC8unu8SYWVy5HGmiQvpvoAzVD6znQbT2G2fH?=
 =?iso-8859-1?Q?DzD5KHHucHT0zwstCCc5wkYuiGs1RDcQNqxHWxA9L78i1mlCnr86Coj2Kp?=
 =?iso-8859-1?Q?WsuVb4oLECfxyZRgmH0TIJdxIFJhHaTCb61ZB8vS1fmsct4Jn9RxHJ/QAR?=
 =?iso-8859-1?Q?KBsuTn3ShvXyxLGRjbofOKZi0O4p1Ocq2hXEvGZvAaJ+rKVZPrcVopCd1v?=
 =?iso-8859-1?Q?M7+1sBKKGGtVfXvvaPBuDR2ZenlnaQbCEYWj7yflW7zHRu7Lgr78KaydSX?=
 =?iso-8859-1?Q?WgIrHSnhCty4VvbanSlSBf7sFTuQumxF0OZJwuneZ/IKV0UspBaxY4FC1q?=
 =?iso-8859-1?Q?bK46CgNMfhu/XwIoQJ4eAzJe2XiBS7fpcHFfOyNaYaOqkLa4TLAJUrmA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b9bcd88-38a2-48ba-637f-08db1391efe3
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2023 22:29:31.8430
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5Ruos/Cnb+sfY0u63BS5H9PkbWMbtmkjs0Vv1QFbehP1vhHRUyMcdyiv0tmJP8iJF0D3tTzBAjU3saQyu1HDzGkjfL4KQCcLezTubCjjVjk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR03MB6184
X-Proofpoint-GUID: fbdF4JrvU72T7nBP76jQGx368ldgYx3N
X-Proofpoint-ORIG-GUID: fbdF4JrvU72T7nBP76jQGx368ldgYx3N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-20_17,2023-02-20_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 mlxlogscore=931
 spamscore=0 priorityscore=1501 adultscore=0 clxscore=1015 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302200208


Hi Stefano,

Stefano Stabellini <sstabellini@kernel.org> writes:

> On Wed, 31 Aug 2022, Volodymyr Babchuk wrote:
>> Spinlock in struct pci_device will be used to protect access to device
>> itself. Right now it is used mostly by MSI code.
>>=20
>> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
>
> There are 2 instances of:
>
>     BUG_ON(list_empty(&dev->msi_list));
>
> in xen/arch/x86/msi.c:__pci_disable_msi and
> xen/arch/x86/msi.c:__pci_disable_msix which are not protected by
> pcidev_lock. However list_empty needs to be protected. (pci_disable_msi
> can also be called from xen/arch/x86/irq.c where it is not surrounded by
> pcidev_lock.)

I checked all call paths. pci_disable_msi() is called from three places in
xen/arch/x86/irq.c. As I can see, all three are "protected" with
ASSERT(pcidevs_locked()), or am I missing something?

>
> Given that they are BUG_ON, I wonder if we could remove them instead of
> adding locks there. It would make things simpler.

Well, I will be happy to remove them, if there are no objections.

>
>
>> ---
>>  xen/arch/x86/hvm/vmsi.c       |  6 +++++-
>>  xen/arch/x86/msi.c            | 16 ++++++++++++++++
>>  xen/drivers/passthrough/msi.c |  8 +++++++-
>>  xen/drivers/passthrough/pci.c |  2 ++
>>  xen/include/xen/pci.h         | 12 ++++++++++++
>>  5 files changed, 42 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/xen/arch/x86/hvm/vmsi.c b/xen/arch/x86/hvm/vmsi.c
>> index 7fb1075673..c9e5f279c5 100644
>> --- a/xen/arch/x86/hvm/vmsi.c
>> +++ b/xen/arch/x86/hvm/vmsi.c
>> @@ -203,10 +203,14 @@ static struct msi_desc *msixtbl_addr_to_desc(
>> =20
>>      nr_entry =3D (addr - entry->gtable) / PCI_MSIX_ENTRY_SIZE;
>> =20
>> +    pcidev_lock(entry->pdev);
>>      list_for_each_entry( desc, &entry->pdev->msi_list, list )
>>          if ( desc->msi_attrib.type =3D=3D PCI_CAP_ID_MSIX &&
>> -             desc->msi_attrib.entry_nr =3D=3D nr_entry )
>> +             desc->msi_attrib.entry_nr =3D=3D nr_entry ) {
>> +	    pcidev_unlock(entry->pdev);
>
> code style
>
>
>>              return desc;
>> +	}
>> +    pcidev_unlock(entry->pdev);
>> =20
>>      return NULL;
>>  }
>> diff --git a/xen/arch/x86/msi.c b/xen/arch/x86/msi.c
>> index bccaccb98b..6b62c4f452 100644
>> --- a/xen/arch/x86/msi.c
>> +++ b/xen/arch/x86/msi.c
>> @@ -389,6 +389,7 @@ static bool msi_set_mask_bit(struct irq_desc *desc, =
bool host, bool guest)
>>      default:
>>          return 0;
>>      }
>> +
>
> spurious change
>
>
>>      entry->msi_attrib.host_masked =3D host;
>>      entry->msi_attrib.guest_masked =3D guest;
>> =20
>> @@ -585,12 +586,17 @@ static struct msi_desc *find_msi_entry(struct pci_=
dev *dev,
>>  {
>>      struct msi_desc *entry;
>> =20
>> +    pcidev_lock(dev);
>>      list_for_each_entry( entry, &dev->msi_list, list )
>>      {
>>          if ( entry->msi_attrib.type =3D=3D cap_id &&
>>               (irq =3D=3D -1 || entry->irq =3D=3D irq) )
>> +	{
>> +	    pcidev_unlock(dev);
>>              return entry;
>> +	}
>>      }
>> +    pcidev_unlock(dev);
>> =20
>>      return NULL;
>>  }
>> @@ -661,7 +667,9 @@ static int msi_capability_init(struct pci_dev *dev,
>>          maskbits |=3D ~(uint32_t)0 >> (32 - dev->msi_maxvec);
>>          pci_conf_write32(dev->sbdf, mpos, maskbits);
>>      }
>> +    pcidev_lock(dev);
>>      list_add_tail(&entry->list, &dev->msi_list);
>> +    pcidev_unlock(dev);
>> =20
>>      *desc =3D entry;
>>      /* Restore the original MSI enabled bits  */
>> @@ -946,7 +954,9 @@ static int msix_capability_init(struct pci_dev *dev,
>> =20
>>  	pcidev_get(dev);
>> =20
>> +	pcidev_lock(dev);
>>          list_add_tail(&entry->list, &dev->msi_list);
>> +	pcidev_unlock(dev);
>>          *desc =3D entry;
>>      }
>> =20
>> @@ -1231,11 +1241,13 @@ static void msi_free_irqs(struct pci_dev* dev)
>>  {
>>      struct msi_desc *entry, *tmp;
>> =20
>> +    pcidev_lock(dev);
>>      list_for_each_entry_safe( entry, tmp, &dev->msi_list, list )
>>      {
>>          pci_disable_msi(entry);
>>          msi_free_irq(entry);
>>      }
>> +    pcidev_unlock(dev);
>>  }
>> =20
>>  void pci_cleanup_msi(struct pci_dev *pdev)
>> @@ -1354,6 +1366,7 @@ int pci_restore_msi_state(struct pci_dev *pdev)
>>      if ( ret )
>>          return ret;
>> =20
>> +    pcidev_lock(pdev);
>>      list_for_each_entry_safe( entry, tmp, &pdev->msi_list, list )
>>      {
>>          unsigned int i =3D 0, nr =3D 1;
>> @@ -1371,6 +1384,7 @@ int pci_restore_msi_state(struct pci_dev *pdev)
>>              dprintk(XENLOG_ERR, "Restore MSI for %pp entry %u not set?\=
n",
>>                      &pdev->sbdf, i);
>>              spin_unlock_irqrestore(&desc->lock, flags);
>> +	    pcidev_unlock(pdev);
>>              if ( type =3D=3D PCI_CAP_ID_MSIX )
>>                  pci_conf_write16(pdev->sbdf, msix_control_reg(pos),
>>                                   control & ~PCI_MSIX_FLAGS_ENABLE);
>> @@ -1393,6 +1407,7 @@ int pci_restore_msi_state(struct pci_dev *pdev)
>>              if ( unlikely(!memory_decoded(pdev)) )
>>              {
>>                  spin_unlock_irqrestore(&desc->lock, flags);
>> +		pcidev_unlock(pdev);
>>                  pci_conf_write16(pdev->sbdf, msix_control_reg(pos),
>>                                   control & ~PCI_MSIX_FLAGS_ENABLE);
>>                  return -ENXIO;
>> @@ -1438,6 +1453,7 @@ int pci_restore_msi_state(struct pci_dev *pdev)
>>          pci_conf_write16(pdev->sbdf, msix_control_reg(pos),
>>                           control | PCI_MSIX_FLAGS_ENABLE);
>> =20
>> +    pcidev_unlock(pdev);
>>      return 0;
>>  }
>> =20
>> diff --git a/xen/drivers/passthrough/msi.c b/xen/drivers/passthrough/msi=
.c
>> index ce1a450f6f..98f4d2721a 100644
>> --- a/xen/drivers/passthrough/msi.c
>> +++ b/xen/drivers/passthrough/msi.c
>> @@ -22,6 +22,7 @@ int pdev_msi_init(struct pci_dev *pdev)
>>  {
>>      unsigned int pos;
>> =20
>> +    pcidev_lock(pdev);
>>      INIT_LIST_HEAD(&pdev->msi_list);
>> =20
>>      pos =3D pci_find_cap_offset(pdev->seg, pdev->bus, PCI_SLOT(pdev->de=
vfn),
>> @@ -41,7 +42,10 @@ int pdev_msi_init(struct pci_dev *pdev)
>>          uint16_t ctrl;
>> =20
>>          if ( !msix )
>> -            return -ENOMEM;
>> +        {
>> +             pcidev_unlock(pdev);
>> +             return -ENOMEM;
>> +        }
>> =20
>>          spin_lock_init(&msix->table_lock);
>> =20
>> @@ -51,6 +55,8 @@ int pdev_msi_init(struct pci_dev *pdev)
>>          pdev->msix =3D msix;
>>      }
>> =20
>> +    pcidev_unlock(pdev);
>> +
>>      return 0;
>>  }
>> =20
>> diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci=
.c
>> index c8da80b981..c83397211b 100644
>> --- a/xen/drivers/passthrough/pci.c
>> +++ b/xen/drivers/passthrough/pci.c
>> @@ -1383,7 +1383,9 @@ static int cf_check _dump_pci_devices(struct pci_s=
eg *pseg, void *arg)
>>              printk("%pd", pdev->domain);
>>          printk(" - node %-3d refcnt %d", (pdev->node !=3D NUMA_NO_NODE)=
 ? pdev->node : -1,
>>                 atomic_read(&pdev->refcnt));
>> +        pcidev_lock(pdev);
>>          pdev_dump_msi(pdev);
>> +        pcidev_unlock(pdev);
>>          printk("\n");
>>      }
>>      spin_unlock(&pseg->alldevs_lock);
>> diff --git a/xen/include/xen/pci.h b/xen/include/xen/pci.h
>> index e71a180ef3..d0a7339d84 100644
>> --- a/xen/include/xen/pci.h
>> +++ b/xen/include/xen/pci.h
>> @@ -106,6 +106,8 @@ struct pci_dev {
>>      uint8_t msi_maxvec;
>>      uint8_t phantom_stride;
>> =20
>> +    /* Device lock */
>> +    spinlock_t lock;
>>      nodeid_t node; /* NUMA node */
>> =20
>>      /* Device to be quarantined, don't automatically re-assign to dom0 =
*/
>> @@ -235,6 +237,16 @@ int msixtbl_pt_register(struct domain *, struct pir=
q *, uint64_t gtable);
>>  void msixtbl_pt_unregister(struct domain *, struct pirq *);
>>  void msixtbl_pt_cleanup(struct domain *d);
>> =20
>> +static inline void pcidev_lock(struct pci_dev *pdev)
>> +{
>> +    spin_lock(&pdev->lock);
>> +}
>> +
>> +static inline void pcidev_unlock(struct pci_dev *pdev)
>> +{
>> +    spin_unlock(&pdev->lock);
>> +}
>> +
>>  #ifdef CONFIG_HVM
>>  int arch_pci_clean_pirqs(struct domain *d);
>>  #else
>> --=20
>> 2.36.1
>>=20

