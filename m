Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D88D375BB4A
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jul 2023 01:37:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.566808.886159 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMdDB-0001Xp-Fr; Thu, 20 Jul 2023 23:37:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 566808.886159; Thu, 20 Jul 2023 23:37:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMdDB-0001VO-Ci; Thu, 20 Jul 2023 23:37:33 +0000
Received: by outflank-mailman (input) for mailman id 566808;
 Thu, 20 Jul 2023 23:37:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5z78=DG=epam.com=prvs=156527e6f7=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1qMdDA-0001VI-GR
 for xen-devel@lists.xenproject.org; Thu, 20 Jul 2023 23:37:32 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 646a1544-2756-11ee-b23a-6b7b168915f2;
 Fri, 21 Jul 2023 01:37:30 +0200 (CEST)
Received: from pps.filterd (m0174681.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36KM1ina021895; Thu, 20 Jul 2023 23:37:28 GMT
Received: from eur04-he1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2050.outbound.protection.outlook.com [104.47.13.50])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3rxknwnp33-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Jul 2023 23:37:28 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by DB9PR03MB7385.eurprd03.prod.outlook.com (2603:10a6:10:222::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.25; Thu, 20 Jul
 2023 23:37:24 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::68d2:d90f:ac32:7c85]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::68d2:d90f:ac32:7c85%3]) with mapi id 15.20.6609.026; Thu, 20 Jul 2023
 23:37:23 +0000
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
X-Inumbo-ID: 646a1544-2756-11ee-b23a-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MepVV0JEgr6+6Oy/aoXcrSiXkJ3Kc8hC7mBjjz2k7bjeZSxzmKt8SySTse4I5t+SAHh0oR/+v9wlvRfvAMt6L5H4+ipUU61xRqLzgJGXd0uNih8Oa+EE0T3Rs8txjaUuVXc1duNQbLhwddADx0t76Y2EQyxw4V0ZGjgcJsFvTHOnx+XJt7zmdAemkZoiD5au24VMgrMB53iVdPYvY4oaglI1jEwg7L8XabzBlmpmBPFKRLD4QA4o8PRvdQCX5B3S9RqFU9TRKT3PbaWUacz/5lrO3pXupcBsbG/xXehotDAtOOVfi1xHSj/GVpsp/vU+a4f+q3h59sfGOa0RKseHKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qaYDi3NstrVNCkpkxaVmpvrl7M537rpQ+bzUpN4xTdk=;
 b=eRk4Mz91bAPViOAK73tnFD6RQOKLhSynF7wfU0TNvePOcfTik+EpoDxnmFXa7jLNcCMVG0kzo+JYYO56jLTGhK9ddW8qsEM4peKUPzclla+izmKBPuAH5DCySxqOfL6FYMHM7cn9Cw2luH/uAO8QQTzk4KvwwZmjhKfdIFpxXG/MdRZMcQMcZyB8CkLJCFoQ4Ef5hVAp2DN8hvoZuAGCly70LWbUkYfeLz180gNzH29clNfp+UFZbIr2vt7DTXitGJnqwtQnETWW2VZ49UCztp2E+uvar3dDj0EW0VCwBGhz1LNkJ6S5GtQW1z2c2s4JSYOxSpJXKRN5aiMJuuV1jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qaYDi3NstrVNCkpkxaVmpvrl7M537rpQ+bzUpN4xTdk=;
 b=XSS9K7DFTgQhXE9ZtmR4MwlPtVEF3bPXsSZspxWUdczuRHfFSTxLMrdbaNI9oXn3V5jj24eG9O90kC4PUvGmD4Nj86k0I9JO7FDVB0kmLKaFfX7LSLMEXHkGqeQkfWMeo8/rxwlcQVUZUh41FXx00nsXEP9pgb80ggkHGHV/eWTK+8wycBSxfT98YDfjlC3fLOQv3pb26Mz5PiZbf6bVPVnvrAjY7nLtrqM6kTiKxvfrgNc6UyxA7WthfdiuHREkCuSEOHBOZ8x9b9xQF28gDWftvEUH5Yt7e25tGroOhMEFQhQaYCsrWGCuEWFzr3DjGpH6YItxCv8WDZM7/A6w9Q==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v8 01/13] pci: introduce per-domain PCI rwlock
Thread-Topic: [PATCH v8 01/13] pci: introduce per-domain PCI rwlock
Thread-Index: AQHZuqGr3g/gocvkCU2kdSqq613Aoa/Cy8SAgACDMIA=
Date: Thu, 20 Jul 2023 23:37:22 +0000
Message-ID: <87zg3qduj1.fsf@epam.com>
References: <20230720003205.1828537-1-volodymyr_babchuk@epam.com>
 <20230720003205.1828537-2-volodymyr_babchuk@epam.com>
 <b6375b17-7922-66ea-88fd-697fa759f96a@suse.com>
In-Reply-To: <b6375b17-7922-66ea-88fd-697fa759f96a@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.8.9; emacs 28.2
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|DB9PR03MB7385:EE_
x-ms-office365-filtering-correlation-id: 8a3bcf48-4424-4143-3a13-08db897a446b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 bILj6+O6KgR4DH51Wi55HW0cAin/FtE24krUCmPaPYKXZFjUuiaaX9yIUVFT77j1Idhiiu+rfgyLJzBI6zgeVxGLMfimVFHdI+mCmvDStFhoa7Bi/hXxCaA/Z6A58t39Xq6gkR41XU6aHDCL0mbQqtwn2BCxRsoEsdGcuu1Xx4SR6EdmS9KwlXLnWQB2yc7uUMlmc/IsnQi6S/Cqc8hbxRuiyj7xLwOEnDL97jSAPoSPa9AQsy49DXEY1UIdzrk2M/ChByuglKQVmnUMHK5dUnaMSfWbmJE6zDM6YwWycyiBddAUeIQVhzCGLTm4R0Dncf3jcoqeR2kS6PYsH9SIEd0B6xuoCfzFxMrwDTzdvXk+P4pOY/3TwGME04zGtqPuX+mODeH8R71w4RG85MyyWDOYJoGj4Pn7xepfTQKVrUF1h0NZMbsuXpSum2oMv4zl1DgRX1aVjKHlYhwL9wG37XZaVGaF8dL/IEqQbJA63FRlcnrklYFaO/GueB2AbRaax4q6Vq8u+n+huM4rK0TTOHCtXM81oqD64+ugEMBy7SL8hNhWf/qbIRm8UDk0yP9/vg7epwIGRTPVH9DIzQ3EAt/7syBlvsxv+iuPGTNMkBH/uz5xl+a8dze5MA/Ujh19
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(396003)(366004)(136003)(39860400002)(451199021)(6486002)(71200400001)(478600001)(38100700002)(122000001)(2906002)(5660300002)(316002)(41300700001)(38070700005)(54906003)(8936002)(8676002)(36756003)(6512007)(2616005)(66446008)(83380400001)(6916009)(26005)(4326008)(66476007)(6506007)(66556008)(64756008)(53546011)(86362001)(55236004)(66946007)(76116006)(186003)(91956017);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?AwaZfbwS49UruznDatGYGCv3Sw7wRKdL+ENEQI/vTu6UMcyynTpYtaGgVS?=
 =?iso-8859-1?Q?F7dCj4uSKYjS/Z4dJ3KySrdihlBtHbk2UktV/s7P2np/b3nY2iC2GSqkhe?=
 =?iso-8859-1?Q?bhn/3Fpim21d++xGFIM52gXew6AVRR61vjy29FMbAbRjLd78gs8ZZxygrg?=
 =?iso-8859-1?Q?GrSJLPMILJROw1DZy6dCLF4v4oiPQXKrfMDZTAnA33eXm4gWPz0F9QO7BK?=
 =?iso-8859-1?Q?yJMibdhzfA2OZOMXv42PzBjC14D3rlPaHzoNcx33QKOJ9zecDsJiJgqBXw?=
 =?iso-8859-1?Q?o1x+ZGCvwc+GkAUHN5WphpE2ez3yBBMJScGezaYnu8tmHtgu3ZXiGGgKtA?=
 =?iso-8859-1?Q?f4HLJZ1ULHbD9nzy7VGD9uU65lOb5YRSGCtTafpltzQRCxBVJm9/kY0fgB?=
 =?iso-8859-1?Q?M8bYLzRnQ2sQA5SPamQFLLyrwZDnNJ2xdglDKSsynJMajqWYJZQS+FZfuJ?=
 =?iso-8859-1?Q?h0MhVZLhN+YcU/Bb+WUlgYGjFjrhnalc8LBaxa/gWSkd/IeLmn3sInA3yF?=
 =?iso-8859-1?Q?q/lovNJzTnugvhaFKUb21jrynC+6VocG9i4n4vlvXeegb0rvEcexDKl1KG?=
 =?iso-8859-1?Q?Lj3KOnspXKSKFayDrd+2801+PB5ZKunhLs1Trhdy+z0yqpiWZKhl1dT0hA?=
 =?iso-8859-1?Q?aK/TVvqYCGK0ehaOeqLhLvR87tsmzdXW/tjsKYFd20u4iJWMHdE1NPDMyH?=
 =?iso-8859-1?Q?kAlY5jcVvJ8B3dmyaXDA/p+TnoVWjqCWTyFB5met4V5nWsW+onwmDlenjQ?=
 =?iso-8859-1?Q?0XnsrPGiln4IsO5HuidSxgIO/6PFUcJICJJtrbWSFAzxTtlnFHVmnbIBxS?=
 =?iso-8859-1?Q?BLZYT3lOwtJNqqsgm81h026hrtK55JG8nYiJcAtBZ7NETNpbQq9nabfxtF?=
 =?iso-8859-1?Q?PIHGNRBhHQgz9OeLZjiWYAAZbq5ijExPFFi9EHZiBV8fI25Xsnq2p5/OsH?=
 =?iso-8859-1?Q?+pDnGASW4FnbHWzDNhYsAu+KlgGQ57hd0evLHkl4N/2q6gwjFjAw8yOWO1?=
 =?iso-8859-1?Q?fXsOlXp3FcZgsBZBnSRtZ+hnDQgghKx7iVHf44s+Mn/cMJhLoULDHTEcWz?=
 =?iso-8859-1?Q?MhkOL4HTHPb1qEYGl233wIgq0j9b3gLq1Clj/pi5LNeHXL4mBoN1vB84tC?=
 =?iso-8859-1?Q?6xN9I5Y03phk0GtDZJk6H2jLUJ/6xKOVhNkqW9rpO6WyysOMIF8xLrJwuj?=
 =?iso-8859-1?Q?ieN5RNkEnlMEIIrjtoI5M8wrnAs6d7wTkcsyWDnqnaP/NUMj2buG+eBgxF?=
 =?iso-8859-1?Q?HFlZgRvEpHnBZWkEsaUmr8hD/yxdW7Q3T/nwKHVNe3k8ue/GUSB3uB0Of4?=
 =?iso-8859-1?Q?fAn7spwka9ShNKJNwt1Ct7HZQ5oW4BrzyM8WSTbF/SRB+8d8k55HI6F6lT?=
 =?iso-8859-1?Q?GpPQA4EcIMyL7IO3JFDzMKSjBL+/kaoaL+ynz3ztY8mLuxPdHfcyv+HfoP?=
 =?iso-8859-1?Q?gjXmZhstZrE1qOC1UAkXDRu2LFYM55Z8CcjsL0A7kO3QzNOetgz9Gt2Oi1?=
 =?iso-8859-1?Q?1itn4vuDj0N5RLzm4SQ0NbvE09yZ5w3u2kAnKYf23fHmi801HggmxiJ+1d?=
 =?iso-8859-1?Q?KOEW3QQGM24LXcdbmai/LWgsr5QKZe+TtGS7LsLoZ7idSDpaYhah1mq1Om?=
 =?iso-8859-1?Q?75oG7ZCzE+NqdVSR3olixcNIzp76BxpV+AHHW2D/dST4D06XMenUNvMQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a3bcf48-4424-4143-3a13-08db897a446b
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2023 23:37:22.9783
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GwFM8bSkNkL0+sIRM9StZxvE0kfGwIpT7Zw2ldhV3XwXfU5sH975IXyqOBPiHvoP/33kJMOUCsebvopVnCqvS4s2Zms1gKxNuR7EeKlJK70=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB7385
X-Proofpoint-ORIG-GUID: ujnrI4VXT58ErsJ8XwzmN_gPKvFO16u3
X-Proofpoint-GUID: ujnrI4VXT58ErsJ8XwzmN_gPKvFO16u3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-20_10,2023-07-20_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 malwarescore=0
 impostorscore=0 mlxscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 mlxlogscore=792 priorityscore=1501 clxscore=1015 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2306200000
 definitions=main-2307200202


Hi Jan,

Jan Beulich <jbeulich@suse.com> writes:

> On 20.07.2023 02:32, Volodymyr Babchuk wrote:
>> --- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
>> +++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
>> @@ -476,8 +476,13 @@ static int cf_check reassign_device(
>> =20
>>      if ( devfn =3D=3D pdev->devfn && pdev->domain !=3D target )
>>      {
>> -        list_move(&pdev->domain_list, &target->pdev_list);
>> -        pdev->domain =3D target;
>> +        write_lock(&pdev->domain->pci_lock);
>> +        list_del(&pdev->domain_list);
>> +        write_unlock(&pdev->domain->pci_lock);
>
> As mentioned on an earlier version, perhaps better (cheaper) to use
> "source" here? (Same in VT-d code then.)

Sorry, I saw you comment for the previous version, but missed to include
this change. It will be done in the next version.

>> @@ -747,6 +749,7 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>>      ret =3D 0;
>>      if ( !pdev->domain )
>>      {
>> +        write_lock(&hardware_domain->pci_lock);
>>          pdev->domain =3D hardware_domain;
>>          list_add(&pdev->domain_list, &hardware_domain->pdev_list);
>> =20
>> @@ -760,6 +763,7 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>>              printk(XENLOG_ERR "Setup of vPCI failed: %d\n", ret);
>>              list_del(&pdev->domain_list);
>>              pdev->domain =3D NULL;
>> +            write_unlock(&hardware_domain->pci_lock);
>>              goto out;
>
> In addition to Roger's comments about locking scope: In a case like this
> one it would probably also be good to move the printk() out of the locked
> area. It can be slow, after all.
>
> Question is why you have this wide a locked area here in the first place:
> Don't you need to hold the lock just across the two list operations (but
> not in between)?

Strictly speaking yes, we need to hold lock only when operating on the
list. For now. Next patch will use the same lock to protect the VPCI
(de)alloction, so locked region will be extended anyways.

I think, I'll decrease locked area in this patch and increase in the
next one, it will be most logical.


>> @@ -887,26 +895,62 @@ static int deassign_device(struct domain *d, uint1=
6_t seg, uint8_t bus,
>> =20
>>  int pci_release_devices(struct domain *d)
>>  {
>> -    struct pci_dev *pdev, *tmp;
>> -    u8 bus, devfn;
>> -    int ret;
>> +    int combined_ret;
>> +    LIST_HEAD(failed_pdevs);
>> =20
>>      pcidevs_lock();
>> -    ret =3D arch_pci_clean_pirqs(d);
>> -    if ( ret )
>> +    write_lock(&d->pci_lock);
>> +    combined_ret =3D arch_pci_clean_pirqs(d);
>> +    if ( combined_ret )
>>      {
>>          pcidevs_unlock();
>> -        return ret;
>> +        write_unlock(&d->pci_lock);
>> +        return combined_ret;
>>      }
>> -    list_for_each_entry_safe ( pdev, tmp, &d->pdev_list, domain_list )
>> +
>> +    while ( !list_empty(&d->pdev_list) )
>>      {
>> -        bus =3D pdev->bus;
>> -        devfn =3D pdev->devfn;
>> -        ret =3D deassign_device(d, pdev->seg, bus, devfn) ?: ret;
>> +        struct pci_dev *pdev =3D list_first_entry(&d->pdev_list,
>> +                                                struct pci_dev,
>> +                                                domain_list);
>> +        uint16_t seg =3D pdev->seg;
>> +        uint8_t bus =3D pdev->bus;
>> +        uint8_t devfn =3D pdev->devfn;
>> +        int ret;
>> +
>> +        write_unlock(&d->pci_lock);
>> +        ret =3D deassign_device(d, seg, bus, devfn);
>> +        write_lock(&d->pci_lock);
>> +        if ( ret )
>> +        {
>> +            bool still_present =3D false;
>> +            const struct pci_dev *tmp;
>> +
>> +            /*
>> +             * We need to check if deassign_device() left our pdev in
>> +             * domain's list. As we dropped the lock, we can't be sure
>> +             * that list wasn't permutated in some random way, so we
>> +             * need to traverse the whole list.
>> +             */
>> +            for_each_pdev ( d, tmp )
>> +            {
>> +                if ( tmp =3D=3D pdev )
>> +                {
>> +                    still_present =3D true;
>> +                    break;
>> +                }
>> +            }
>> +            if ( still_present )
>> +                list_move(&pdev->domain_list, &failed_pdevs);
>
> In order to retain original ordering on the resulting list, perhaps bette=
r
> list_move_tail()?

Yes, thanks.


--=20
WBR, Volodymyr=

