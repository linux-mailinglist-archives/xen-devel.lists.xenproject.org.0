Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C78A558E12A
	for <lists+xen-devel@lfdr.de>; Tue,  9 Aug 2022 22:34:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.383175.618300 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLVuv-0002ga-V1; Tue, 09 Aug 2022 20:33:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 383175.618300; Tue, 09 Aug 2022 20:33:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLVuv-0002ed-SI; Tue, 09 Aug 2022 20:33:33 +0000
Received: by outflank-mailman (input) for mailman id 383175;
 Tue, 09 Aug 2022 20:33:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+xpM=YN=epam.com=prvs=022073e3d3=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1oLVuu-0002eX-6K
 for xen-devel@lists.xenproject.org; Tue, 09 Aug 2022 20:33:32 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8714965b-1822-11ed-924f-1f966e50362f;
 Tue, 09 Aug 2022 22:33:30 +0200 (CEST)
Received: from pps.filterd (m0174681.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 279JOM4B013616;
 Tue, 9 Aug 2022 20:33:10 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2176.outbound.protection.outlook.com [104.47.17.176])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3huwq8r5pj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Aug 2022 20:33:10 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by AS8PR03MB7718.eurprd03.prod.outlook.com (2603:10a6:20b:402::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.21; Tue, 9 Aug
 2022 20:33:02 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::6175:686:14fd:b1ad]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::6175:686:14fd:b1ad%4]) with mapi id 15.20.5504.014; Tue, 9 Aug 2022
 20:33:02 +0000
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
X-Inumbo-ID: 8714965b-1822-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LNH5PsOr+jXDN5Yae1cmxvo7KGEAa0gkm0AeuI8vNujxWUXTklxzPU0bQ+2jjr/578A4BkqjLPSs4KvGyYx06po1PxkM1VK9VuqrP+jD8NSCO5c5gw7pI6o4tAajicHkeSi01f5SZ8E6wFa1hYF8X84QaL9OTVq6w/B7CCfokgkOfrNHvYc2kb/RodQICHJtLPIBDM2F+0sbvMO2j8/m6waYHArmPe05Oas7qWu7JpjLb2gWub81k0EdV1CFD4N/LXr6zwZA8D9uBiNwPdEof1ZWGLoyynnownnavJ7thNVqWchLU+PSu7VpWo4+eyKrw+1OZybgm4Adw9fn+p2exw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=goQEol/P2znPQQotiJy0LTLLYpOVZ0Czi4c0xmYmRxg=;
 b=hozD/JqADAVcaGvOfRlEYo/8UYmYLgEb8SU3WU5H0hMhuPpJS2g11qEz+uL8qvxmxU9zbRCv3DQsSuriJnYNwo/t00XTt6Wm+7v7QyWoCdBS3VSgLwfSUrO0Ov17NSOSJ/mvh9kFlLJ4WjnLWhIoM/ivquPWbZbw+mYbE7MeuICl6bNA+Tu3NkUkIJvk+HQD9FRfykORKO2pTGCCrfj7eL8+rGSiWgMm62g0AgQ6TJBOF1IjK+5pIPCgFmWNIHJ1lHmDHx1gQhSQOnDsO239+MPdFFjSpMTNckcKuHHOCi3YJE2M0we/Rc6+9YUegMdZlNC6FMorm5ylOcuC+0KdHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=goQEol/P2znPQQotiJy0LTLLYpOVZ0Czi4c0xmYmRxg=;
 b=qO0K2F+dqdpMeJRGYYI0xebVAxGVLMic6B1TpnYOPDsE0Uh1xz0nYjCUqSWKs1SxBBC1pEo+uRWyRhHckENHIuT/ph49jKOFoozE24QKdhoPEaaxhiUP8/hsR3CnG6Dd1diZZgmXbqzOPpyy55JSBDwpKhY6I0oiWbq2N0dteoQ3j3f/4y4I3NRWc6IfLcXr5tHVwG2G4UfOLgsYQWPQMgo3mDkXZ9T+DM5/X4gm4sS/UafYRnABeq5wdh2NbzemdIuJ+EVcLOvJ2ZmTO24Ty9uJ14ow3woULI4jtUZBgf5n9+3XwXSnJjfuxIrCF5WOTooROxn3Bcz6C+1BsAOgcw==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
        Andrew Cooper
	<andrew.cooper3@citrix.com>,
        =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>,
        Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>,
        Julien Grall <julien@xen.org>,
        Stefano Stabellini
	<sstabellini@kernel.org>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 3/4] vpci: use pcidevs locking to protect MMIO handlers
Thread-Topic: [PATCH v2 3/4] vpci: use pcidevs locking to protect MMIO
 handlers
Thread-Index: AQHYmuuJA1lWCBgnj0iqi/IOtvD1PK2aAUWAgA0kaAA=
Date: Tue, 9 Aug 2022 20:33:02 +0000
Message-ID: <87o7wt9myq.fsf@epam.com>
References: <20220718211521.664729-1-volodymyr_babchuk@epam.com>
 <20220718211521.664729-4-volodymyr_babchuk@epam.com>
 <381b3611-79c2-807e-c5db-d5c0d9ea4fc4@suse.com>
In-Reply-To: <381b3611-79c2-807e-c5db-d5c0d9ea4fc4@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.6.5; emacs 28.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 48e4c18b-50c5-4962-87bb-08da7a465b13
x-ms-traffictypediagnostic: AS8PR03MB7718:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 +p1mmOKWhOVUSghMrhWV1QtblffeSKaAgsgUEWln/91kSSo4zWzwRUzciyYXGRNDEIQ9+r172zD11ffiKhrG+Mz1Wv83ksR7M2gCipww6PXysX1729Ep3yMHYbfCRc2Tq6IsAqg6zie8bLZ+yncWRqsS6A/zQs5GbB9p60NIYR7Hz4q7t6gziM5u0LC71Vvc3sCB/yhE6xbvm1uA0NJXXRFDLgpTPWjLBFL+o4dN8WBaKziHQ5mtQSFJaqJdvHGN3qVBrDDgvRE3klxEdrUN0muA8nLHzLVjon8qEP4UuxaaE82fMcZeKB3DjxghexjJlUdl7JUIaxm8aEPMZ0EX0aPxCn6BaX7WSA7OQkxKq5wWEcR2M0mAnD9qzjEEV9GzeLX3flHdQOs2IBWV//k+utCE3TkEdQamoOhbUUmHyTT+JqMREtpB0gRPFrYTKetalBE6x2ufEYmTyjkqYd0EkQGklbgoolp5FcOOG5NRPCdE86zXuq9J2yFEElQM7VCho+Uz6r8hzAxklxXXkXS2iIvN65G5zKnt1K40MVx4qGWL9ZYzPlyBTFUvEDhMYFm42r93jeBwjV4f/8naCk+ruwMlcIb39YX8KUzAcwRf33H++1S1u5tMHL3YtyDUv9mudboZ/XDuNNkA8rR3Y3JSmNhNfQaWP59HZpynetD03ap3TLWclCGkduQ9yAhvcz5KRY+IYNsIvi1Ij96xIs+yVDr0hcpNNwDM2SBmClzFwAiZqvjFNhOKZfhphxQEFEab1YF6tvKAe6mBRu3w9r9KmfFAOUnOa0gekmIN1yKUgKw=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(39860400002)(396003)(366004)(136003)(346002)(6916009)(2906002)(186003)(26005)(53546011)(6506007)(41300700001)(2616005)(6512007)(55236004)(38100700002)(86362001)(38070700005)(83380400001)(122000001)(5660300002)(66446008)(66946007)(36756003)(66556008)(66476007)(8936002)(8676002)(478600001)(71200400001)(6486002)(91956017)(4326008)(64756008)(76116006)(54906003)(316002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?KgvvF0W2FTmX6GcVyH/lafBFRmZE8hAD3bZryeEvAR3GL4bidqpydh31kg?=
 =?iso-8859-1?Q?eqQkyC1QmAPYzYu4kssvLZTyxF2ADaglSSNk9sxISWTWIVHY20ThkUYwU2?=
 =?iso-8859-1?Q?StA3gJD6lj7s/VNtDlNHfgtA9OMFwlcR+ufLKv+2dWX1Uy3Z2d70zSO7+m?=
 =?iso-8859-1?Q?X0AeLa1KXvvQEqOttDRN6cUp2hqseEnn/6qvgdyT50wzi8/2CXvgo0F84j?=
 =?iso-8859-1?Q?opI9M0MCgUFXzq30zx4mhbd06BvRTmmJ2E/G/o0Axd0lskLgzd+ZinKTvt?=
 =?iso-8859-1?Q?CNMT4T7x30G/o43nEH2cjyMn3nK9NPFW4rnXXfFaIZiRLTF0SPPNP/oDUq?=
 =?iso-8859-1?Q?qv/QWHkkJGW6PePkjWFm1BZG/thEXSbaB7Bzse7603q1DU6nlzyDeDgwgf?=
 =?iso-8859-1?Q?ZDKZCk8R5LDTI3Tcs9P6MG8ZaFzZB6f1g9R5ssuUjIepJ9v87PUz5fd++y?=
 =?iso-8859-1?Q?WjgwW8h5e8J6Wvahn1rjJ6E+Xd90LryMWy8I3OXZUtgQT/Dq3FL9xDR2yl?=
 =?iso-8859-1?Q?q9ky3qNttRg6Xfm+RMM9cMio4wW7f2zWdo1vjW0TgAL4PWf4n/lh9Vh6RS?=
 =?iso-8859-1?Q?1qmVMFYKgmOjp1R4+9ArKyeONzLKDtSPliBE0xUBMaLCTp2GaCbDXv8umz?=
 =?iso-8859-1?Q?WGfIVGX4SDcbIOLjH1oLg6mqyKYqAR0KClw58z0bcb4PsBdZCPi1kmDCuP?=
 =?iso-8859-1?Q?cjaJJzsM/uxMdbJM3Mswf5RhSU0b5oAEYBHWO0fOx9C0cs6Srt/ysPc0gB?=
 =?iso-8859-1?Q?RPAqX7QyGiDDnPQjE2fIPZouwXTDUQ1EjXXQn2Wa3fowAotRltctdY4Tn1?=
 =?iso-8859-1?Q?j1ktm3LUdAxm4Mjps9pRUP15gGYLHcj2GFMx6uER5qZNHzZjCVbLDkF2Xq?=
 =?iso-8859-1?Q?189byeZbI5E2iIYADMut5xD/ze7NvBPvKu4tnQm9TX98DgaFVoP6gWXOgU?=
 =?iso-8859-1?Q?XRrYJ31T+DtaSwJvf3hdll4XOdXEmaIIxtiWPJZL8yrSqcekDqAP0fZXDT?=
 =?iso-8859-1?Q?zIViDAioXlDknH9zGpDTVrK/Fb713xC6v89GNA21+OsZEWW9Cc8Ijfbx4C?=
 =?iso-8859-1?Q?WyiXmtdsO/fpYAyTGABo71u+2QRgms01ZFENH+cWqOkUqwwE+bg61Y4Tzg?=
 =?iso-8859-1?Q?zh110TM5+eYTCrhBmXg0I+m0306NBV8EpmveeKooh3BEHxM4Qe/qvdTaww?=
 =?iso-8859-1?Q?NiKjsmxmU2CEIsUbpid8SvtVqtJ2FSByq4EoANwmIDgREoXaN5BCg2M2Je?=
 =?iso-8859-1?Q?BnJS3afZaYMg8ZgDXSUsgazWKHQYh4u3qZYnkXCJb5l550O1ay8NSDY8FW?=
 =?iso-8859-1?Q?w6jIoUkoz/6rVkBsaIA0DB5KS9UdcKlpT1iErf/5Zxh4xPOg13tOSuJVko?=
 =?iso-8859-1?Q?ZdBeLmh/zUM1B5uRqabnzrr5NPm/u/ENwoIEOLhTwS9cGk10kYifJXO6Om?=
 =?iso-8859-1?Q?lkyZxi53lABZQctSCgnonitE6Tu0ymPugmujUYHb39jkMXIMo6KizU7oC0?=
 =?iso-8859-1?Q?hGQFcq+PVKAajjS4lmWZAKX+VKk3MQSGTv25zNlSB4zhiVA5q0h+A/AlJp?=
 =?iso-8859-1?Q?zs2dSSoD4xsh0LDinuoXd8UOqcRZcy9g8IGZIMWiQ2x4mhHekOCBRrjvbk?=
 =?iso-8859-1?Q?Pku1Qj3uCsIQTpiyZCARVg5oShjpusHVmmZ00OGGx/tR0Rky+71+pIgQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48e4c18b-50c5-4962-87bb-08da7a465b13
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Aug 2022 20:33:02.0496
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8yh5So7NPzw0fTybDQeHJT1nZ+rgUZ2P6djfY81zmbbdcupDIcNhv817ceUDpJt19B7px9Cr3Wdq1Lqtqw2ZVFZfc87SJbrXqsJemjArqlo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7718
X-Proofpoint-GUID: UZnTcOaLel2e8uX75B9xIAW5h--7mZmy
X-Proofpoint-ORIG-GUID: UZnTcOaLel2e8uX75B9xIAW5h--7mZmy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-09_05,2022-08-09_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 phishscore=0 malwarescore=0 mlxlogscore=767 lowpriorityscore=0 spamscore=0
 mlxscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2208090076


Hello Jan,

Jan Beulich <jbeulich@suse.com> writes:

> On 18.07.2022 23:15, Volodymyr Babchuk wrote:
>> --- a/xen/arch/x86/hvm/vmsi.c
>> +++ b/xen/arch/x86/hvm/vmsi.c
>> @@ -891,10 +891,16 @@ void vpci_msix_arch_init_entry(struct vpci_msix_en=
try *entry)
>>      entry->arch.pirq =3D INVALID_PIRQ;
>>  }
>> =20
>> -int vpci_msix_arch_print(const struct vpci_msix *msix)
>> +int vpci_msix_arch_print(const struct domain *d, const struct vpci_msix=
 *msix)
>
> I don't think the extra parameter is needed:
>
>> @@ -911,11 +917,23 @@ int vpci_msix_arch_print(const struct vpci_msix *m=
six)
>>          if ( i && !(i % 64) )
>>          {
>>              struct pci_dev *pdev =3D msix->pdev;
>
> You get hold of pdev here, and hence you can take the domain from pdev.

Yes, makes sense.

>> +            pci_sbdf_t sbdf =3D pdev->sbdf;
>> =20
>>              spin_unlock(&msix->pdev->vpci->lock);
>> +            pcidevs_read_unlock();
>> +
>> +            /* NB: we still hold rcu_read_lock(&domlist_read_lock); her=
e. */
>>              process_pending_softirqs();
>> -            /* NB: we assume that pdev cannot go away for an alive doma=
in. */
>
> I think this comment wants retaining, as the new one you add is about
> a different aspect.
>
>> -            if ( !pdev->vpci || !spin_trylock(&pdev->vpci->lock) )
>> +
>> +            if ( !pcidevs_read_trylock() )
>> +                return -EBUSY;
>> +            pdev =3D pci_get_pdev_by_domain(d, sbdf.seg, sbdf.bus, sbdf=
.devfn);
>> +            /*
>> +             * FIXME: we may find a re-allocated pdev's copy here.
>> +             * Even occupying the same address as before. Do our best.
>> +             */
>> +            if ( !pdev || (pdev !=3D msix->pdev) || !pdev->vpci ||
>
> Despite the comment: What guarantees that msix isn't a dangling pointer
> at this point? At the very least I think you need to check !pdev->vpci
> first. And I'm afraid I don't view "do our best" as good enough here
> (considering the patch doesn't carry an RFC tag). And no, I don't have
> any good suggestion other than "our PCI device locking needs a complete
> overhaul". Quite likely what we need is a refcounter per device, which
> - as long as non-zero - prevents removal.

Refcounter itself is a good idea, but I'm not liking where all this
goes. We already are reworking locking by adding rw-locks with counters,
adding refcounter on top of this will complicate things even further.

I'm starting to think that complete PCI device locking rework may be
simpler solution, actually. By any chance, were there any prior
discussion on how proper locking should look like?=20

>
>> +                 !spin_trylock(&pdev->vpci->lock) )
>>                  return -EBUSY;
>
> Don't you need to drop the pcidevs lock on this error path?

Yeah, you are right.

>
>> @@ -450,10 +465,15 @@ static int cf_check init_bars(struct pci_dev *pdev=
)
>>      uint16_t cmd;
>>      uint64_t addr, size;
>>      unsigned int i, num_bars, rom_reg;
>> -    struct vpci_header *header =3D &pdev->vpci->header;
>> -    struct vpci_bar *bars =3D header->bars;
>> +    struct vpci_header *header;
>> +    struct vpci_bar *bars;
>>      int rc;
>> =20
>> +    ASSERT(pcidevs_write_locked());
>> +
>> +    header =3D &pdev->vpci->header;
>> +    bars =3D header->bars;
>
> I'm not convinced the code movement here does us any good. (Same
> apparently elsewhere below.)
>
>> @@ -277,6 +282,9 @@ void vpci_dump_msi(void)
>> =20
>>          printk("vPCI MSI/MSI-X d%d\n", d->domain_id);
>> =20
>> +        if ( !pcidevs_read_trylock() )
>> +            continue;
>
> Note how this lives ahead of ...
>
>>          for_each_pdev ( d, pdev )
>>          {
>
> ... the loop, while ...
>
>> @@ -310,7 +318,7 @@ void vpci_dump_msi(void)
>>                  printk("  entries: %u maskall: %d enabled: %d\n",
>>                         msix->max_entries, msix->masked, msix->enabled);
>> =20
>> -                rc =3D vpci_msix_arch_print(msix);
>> +                rc =3D vpci_msix_arch_print(d, msix);
>>                  if ( rc )
>>                  {
>>                      /*
>> @@ -318,12 +326,13 @@ void vpci_dump_msi(void)
>>                       * holding the lock.
>>                       */
>>                      printk("unable to print all MSI-X entries: %d\n", r=
c);
>> -                    process_pending_softirqs();
>> -                    continue;
>> +                    goto pdev_done;
>>                  }
>>              }
>> =20
>>              spin_unlock(&pdev->vpci->lock);
>> + pdev_done:
>> +            pcidevs_read_unlock();
>
> ... this is still inside the loop body.
>
>> @@ -332,10 +334,14 @@ uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int r=
eg, unsigned int size)
>>          return data;
>>      }
>> =20
>> +    pcidevs_read_lock();
>>      /* Find the PCI dev matching the address. */
>>      pdev =3D pci_get_pdev_by_domain(d, sbdf.seg, sbdf.bus, sbdf.devfn);
>> -    if ( !pdev )
>> +    if ( !pdev || (pdev && !pdev->vpci) )
>
> Simpler
>
>     if ( !pdev || !pdev->vpci )
>
> ?
>
>> @@ -381,6 +387,7 @@ uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg=
, unsigned int size)
>>          ASSERT(data_offset < size);
>>      }
>>      spin_unlock(&pdev->vpci->lock);
>> +    pcidevs_read_unlock();
>
> I guess this is too early and wants to come after ...
>
>>      if ( data_offset < size )
>>      {
>
> ... this if, which - even if it doesn't use pdev - still accesses the
> device.
>
> Both comments equally apply to vpci_write().
>
>> --- a/xen/include/xen/pci.h
>> +++ b/xen/include/xen/pci.h
>> @@ -161,6 +161,7 @@ void pcidevs_unlock(void);
>>  bool __must_check pcidevs_locked(void);
>> =20
>>  void pcidevs_read_lock(void);
>> +int pcidevs_read_trylock(void);
>
> This declaration wants adding alongside the introduction of the
> function or, if the series was structured that way, at the time of the
> dropping of "static" from the function (which from a Misra perspective
> would likely be better).
>
> Jan


--=20
Volodymyr Babchuk at EPAM=

