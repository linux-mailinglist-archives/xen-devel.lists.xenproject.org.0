Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE98F6971E5
	for <lists+xen-devel@lfdr.de>; Wed, 15 Feb 2023 00:40:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.495639.766017 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pS4tI-0008I9-BZ; Tue, 14 Feb 2023 23:39:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 495639.766017; Tue, 14 Feb 2023 23:39:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pS4tI-0008GO-6y; Tue, 14 Feb 2023 23:39:16 +0000
Received: by outflank-mailman (input) for mailman id 495639;
 Tue, 14 Feb 2023 23:39:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=weBS=6K=epam.com=prvs=6409b97adc=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1pS4tG-0008Fx-DR
 for xen-devel@lists.xenproject.org; Tue, 14 Feb 2023 23:39:14 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c78406e9-acc0-11ed-93b5-47a8fe42b414;
 Wed, 15 Feb 2023 00:39:11 +0100 (CET)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31EKUNAC021206; Tue, 14 Feb 2023 23:38:46 GMT
Received: from eur05-am6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2109.outbound.protection.outlook.com [104.47.18.109])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3nr8b2jhv2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Feb 2023 23:38:46 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by AM9PR03MB6977.eurprd03.prod.outlook.com (2603:10a6:20b:2d8::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Tue, 14 Feb
 2023 23:38:42 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::967e:573a:15a9:176e]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::967e:573a:15a9:176e%4]) with mapi id 15.20.6086.026; Tue, 14 Feb 2023
 23:38:41 +0000
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
X-Inumbo-ID: c78406e9-acc0-11ed-93b5-47a8fe42b414
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FtBQ0aZuK49I4t4i5AX9AtoBppeZ9LgOXW21Txzfn0fjJCnHj3mLtDKQ7sHe/K2AXUK8kadfsfbUrdHVLUoVNNKoRwcsV5TJ1w7Xt9Enm8GIv140fBgB+H4JYNSf8dD76RKPOxysttkrBJSzp2Y8Z4xFZ7WcbzeXZ4jXUcIx32eAWzpPC/7Chp/BftyR2hJXp5MTxdDJyQzvHXFRO3WD3rPm9IoU2+WelsAfpr2shF4+oWRNa8coVQHtBM8/dhfuLH+a4G3LeCPdn5EyTpEAic9g9a+kdnnGMNIvvHnf0X9KamR3knPcpLHagLGVFjnpQWwLY1wZWw+9OOFOeg8vYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SGv4HB7UbsPLmaPOZhI9GR/eHKTekYVXWtSt/9CNtTA=;
 b=obcTDvsfuPYj13W3WTZSFUxX3w3kXJxANXTriE4tOS2VNzoLR5YyM8UP2cAaHvQIrg62zDdVMX8F0E1T4/IAc3fYAXGv/omjnYJ2970AkuYIOMf6+3iVC2gTJfoXxDUCr0ubwOjTBe+KqkCKo3guKPZMoSmThzG3ACsp6BFQA1rJ3wesrKU0cRdoGzH7x3QJ5Q2UIuHbTIDB9eRYcGLZGc3ycfxYs6HKXD6skdd4fosHqiiZfdwMq3suGp0P65lCPPBGqQ6oMp4f4Nk+IyyUijNan6Itk3oPaCkqA9ey0ObYUhwGUxzjurSBkOiwwDwLdIf/Ae4wX9xhOBqPajEmCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SGv4HB7UbsPLmaPOZhI9GR/eHKTekYVXWtSt/9CNtTA=;
 b=aU0fzNOwG5cNL+P7Eu5+82Atn1E5u9O5CzAKDXKfWlggEohKxFU9J/BfJOKKIvGQbC6hEJlgOGvoNq55UOWlilc6OfP4uzlAr8Cg28YM35S7CwLo77PvKe1sFi9bciNmwm1uquU8CdaI8pI6H0J9MOrkrDO/p+mtiaH6LjoAKaWmZqYa4iErkzZ8ub7DwN7enJ16AKWpYidO3PjhklnLCVxSsP9/cSlGDkCdIR2UHA0zK5P/8Q+9YtUMxznHf+zcxOUeIa85Izw+Z95IlS9S+ImnSYVI56Bp8ZAeHoc3+CVu6GSWOcHkqIzFWJi07ZL7uPvhz0jR2gk/FAnKuB3lLg==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
        Andrew Cooper
	<andrew.cooper3@citrix.com>,
        George Dunlap <george.dunlap@citrix.com>,
        Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
        Wei Liu
	<wl@xen.org>, Paul Durrant <paul@xen.org>,
        =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>,
        Kevin Tian <kevin.tian@intel.com>,
        "Stewart.Hildebrand@amd.com" <Stewart.Hildebrand@amd.com>
Subject: Re: [RFC PATCH 01/10] xen: pci: add per-domain pci list lock
Thread-Topic: [RFC PATCH 01/10] xen: pci: add per-domain pci list lock
Thread-Index: AQHYvUN+sHWq0w//vE+eH46Zd/aTJ66yPm0AgB3Z5oA=
Date: Tue, 14 Feb 2023 23:38:41 +0000
Message-ID: <87cz6b3ji7.fsf@hp.mail-host-address-is-not-set>
References: <20220831141040.13231-1-volodymyr_babchuk@epam.com>
 <20220831141040.13231-2-volodymyr_babchuk@epam.com>
 <alpine.DEB.2.22.394.2301261435230.1978264@ubuntu-linux-20-04-desktop>
In-Reply-To: 
 <alpine.DEB.2.22.394.2301261435230.1978264@ubuntu-linux-20-04-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.8.9; emacs 28.2
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|AM9PR03MB6977:EE_
x-ms-office365-filtering-correlation-id: fd19b9b0-c039-43a0-5dfd-08db0ee49ae7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 r7MZcFyFTOsJeQAKLc+OFOpdyRkOKR+HkHHz2VZhi+QweP306sFRUfPk4ajC9JA0uuepJWlUN4CiV+x/5X/ZkNolVLj6KCslTP1bMNoRY/ENWAFEF6KCKeHRC0vOhx0v4iypE18R7KwfLLbqeAFzAgsn5zj3ZfXEpEqw3puecPcPBRWaug+tigDTx2mtIA451U30tmP0G7bbjymagitO+RBS0a8wrDA/DJELL0RMNl0/hdhNqX73FfrkaLOh1t8Bbg5Lv+KxOSRyYBJzDc+rdZ6avphrJ2ORfpeU8nMNjkXExXeueUodQLXJF6CZdx/rEFkmDt3Bt21QF0YLtMLwhnIOaBvzC6wQcxJ7+lkSLcp0bdh3nq2wu29qaq8DfH06KMhiGG6TRfIrfjqyYTTpjE2Pvk89zv+xHADdt+u7HyDm35NBIbpHjiSGdc8oOBi7Dbb6giIdjPIE5iDjTv6dEu1ivHPXdp5Wklj+05XAzguly4gbHtvO4tCKzdapbAQ6gmAwG3zIcTN50SI/ttZBphRSazkqrZtI3nqDHExrSgGJHhKAJGwAVQ2Fq92pYhPBb/IzTUa1UhkQO09LujVviVepBtwVGyZbj8pqIhBUGHMn6ZVS9zaKf81EOhrZ9uKiE5I3vz6TXdWMjtjU3n71yFBhe0SnIusFxLuIndyjZrhlf+uOw2aku+N4YrYfXEkPlIpmCVyCquh0jOsar+2Mbg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(346002)(396003)(39860400002)(376002)(366004)(451199018)(186003)(6512007)(316002)(9686003)(26005)(6506007)(6486002)(76116006)(66946007)(66476007)(8676002)(66446008)(91956017)(6916009)(4326008)(478600001)(64756008)(83380400001)(66556008)(71200400001)(54906003)(55236004)(41300700001)(2906002)(8936002)(5660300002)(7416002)(122000001)(38100700002)(86362001)(38070700005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?588yj3+4xo87Fan2lC0y6BDJBUxDXziNJfKWO/nBSaVQP4u/39YRARi+SS?=
 =?iso-8859-1?Q?gESd6cfXmPIv8HrnUc6rWf56oMqzXRVZzeXo6FE4AxLLqFwdDhJft4uidC?=
 =?iso-8859-1?Q?MBX+8y+YfNFvQIH/OOK3+hXKK4rPqMK9AzYyxLEEHUJhFBm36WZxJrAKji?=
 =?iso-8859-1?Q?0rh+RcX4vHQGdlXGNhZXfYyV3YdgBH7yggUiT5s5kPImUbAVEAGu28YX2u?=
 =?iso-8859-1?Q?QXMVgVG3OBaft2uWh7eA5i/Szta6Wvjw0rrBtu7p5SvQO5X4tC7dn2sdL3?=
 =?iso-8859-1?Q?VhW/LVRFDL5mOe+S8PBctFUvNep070BElWA3peAGvleL88g9bfisTiGD/N?=
 =?iso-8859-1?Q?yQ4BKHtoO0QZAbnZzzr2RrrwEeiT3MWD1da7YYYNhPTWes4UmlC+UnxH8i?=
 =?iso-8859-1?Q?I9Fk+isC3DP/nhuIokX9ucRXwcV9C+DSq18AkrEq24T0psIRd9U1X6Fj/x?=
 =?iso-8859-1?Q?iDGBtf+48Gb64ScCIoWB13mXEntM8jpFD0rboIQGdTl7dFZ52KFxXs8C2x?=
 =?iso-8859-1?Q?fhZZ9x1/6GiQ4J8uPSBQ3GPdw58L8KPHMi6deGcuAQ1VcdMY8H9Qf/s+oh?=
 =?iso-8859-1?Q?U36yLTAFy3Od5S8g5umO+96n9Ro6Jn4Hntk/5DPvB2spkbUFe1fFujsj0u?=
 =?iso-8859-1?Q?A7Tvcv6z5ZMQ0zg8uC3cau6mrvzMyRamH+ZLvJ3q73RCAoobHDaC1eoFgj?=
 =?iso-8859-1?Q?i0cYMN0hUxUBeOxysZb/M330l8ciPbijJcQLahyu6hSGgUiuRwM2MJQ8oF?=
 =?iso-8859-1?Q?XShp8VBGTjT5pmaJdnsduXdMDe8zrdVO98fy4grd7TUOIY5CWnNo0g8TuB?=
 =?iso-8859-1?Q?NMrBn8b1wGKazvTPiWw8OwIxeMdOe91ASjqlZN3BnyiwMvDAjx9oaC5dOg?=
 =?iso-8859-1?Q?HD1QvRodPWmWSPYCiOFY2IUZtZQAKAvGLFEMHrkHSTSYVGD7HyXnfH2si5?=
 =?iso-8859-1?Q?/EM2WXfmOoH6+VqOXCXct9NJTaenROB1780t839I5BKANeFNPRIkmUO/k2?=
 =?iso-8859-1?Q?nX4fVu2EsAJF6MQupjCwBFb/U4xgIljr57K+E654q+nCX4MPTPlqlsbwHO?=
 =?iso-8859-1?Q?HuHqwahYXYygD1j01zFfP9BkGJHl2y6/SxbKypXF/C017pMyAAmJacVG/7?=
 =?iso-8859-1?Q?msMH6R5Hdcdc6NITQDxs1I7CE8nU4hRm8YhsBP9QFFNTG5S50/J9/WjjGv?=
 =?iso-8859-1?Q?Cu3gDv+kQI6G5ALoHyF8ahEhvActHpna97xec/OZwFbdYfDy1DwE8gKNyr?=
 =?iso-8859-1?Q?jJgbR/YPLX13zBF4oqVr6r/Bi3/RqxkJryOvg+R7kN9ZDtUgz6kqDt8j08?=
 =?iso-8859-1?Q?xa2y1KmSzwJMZj5uh+BKU/5i/Fq+paW4ojO9JhomdRhAwgXqU7G/f9YNPu?=
 =?iso-8859-1?Q?+UjhFzqVoFq/naC2rSA/TOX6YfHrDU0ntcwY5U6Y6VxQrfS5ZtL63x4Ifq?=
 =?iso-8859-1?Q?9cO4lY32HnnxahAzM8vRN7k0r59UYUd7a4OQyIGVTDWde1QG9vkV+ZNMot?=
 =?iso-8859-1?Q?zeXgLdqE9N5pXOpyM45pgmgvL3nUWwVXndGxu0lfKaoM5YbByHVR8cFjIj?=
 =?iso-8859-1?Q?3TmoAt7/RlGtBu1NK7NpwFs8819N/EQEgTaaciCwYT5zQ9/hTaVrhV/JEo?=
 =?iso-8859-1?Q?M4NT8RS3In5JEsT2d6gHTOS2Oka2bXhfzPXvsW90e/E8CPhZC9ZIZ3Hg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd19b9b0-c039-43a0-5dfd-08db0ee49ae7
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2023 23:38:41.6618
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: juqhJB+k09Ha0ibgpZcrn2sfXY3Rc0kmcc7rg19luV0U5X+s4ESbVquOF6XxP9r0EdrkdusxOEkHGRsK3Byjk3wtcJkJTg0QE4UoO3PsY7c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB6977
X-Proofpoint-GUID: 0vv8Tn8rfNtI9AkIeyGqPXGfdAsut9TL
X-Proofpoint-ORIG-GUID: 0vv8Tn8rfNtI9AkIeyGqPXGfdAsut9TL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-14_15,2023-02-14_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 spamscore=0 mlxscore=0 bulkscore=0 mlxlogscore=999 clxscore=1011
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302140203


Hello Stefano,

Stefano Stabellini <sstabellini@kernel.org> writes:

> On Wed, 31 Aug 2022, Volodymyr Babchuk wrote:
>> domain->pdevs_lock protects access to domain->pdev_list.
>> As this, it should be used when we are adding, removing on enumerating
>> PCI devices assigned to a domain.
>>=20
>> This enables more granular locking instead of one huge pcidevs_lock that
>> locks entire PCI subsystem. Please note that pcidevs_lock() is still
>> used, we are going to remove it in subsequent patches.
>>=20
>> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
>
> I reviewed the patch, and made sure to pay extra attention to:

Thank you for doing this.

> - error paths
> - missing locks
> - lock ordering
> - interruptions

> Here is what I found:
>
>
> 1) iommu.c:reassign_device_ownership and pci_amd_iommu.c:reassign_device
> Both functions without any pdevs_lock locking do:
> list_move(&pdev->domain_list, &target->pdev_list);
>
> It seems to be it would need pdevs_lock. Maybe we need to change
> list_move into list_del (protected by the pdevs_lock of the old domain)
> and list_add (protected by the pdev_lock of the new domain).

Yes, I did as you suggested. But this leads to another potential
issue. I'll describe it below, in deassign_device() part.

[...]

>> +    spin_lock(&d->pdevs_lock);
>>      list_for_each_entry_safe ( pdev, tmp, &d->pdev_list, domain_list )
>>      {
>>          bus =3D pdev->bus;
>>          devfn =3D pdev->devfn;
>>          ret =3D deassign_device(d, pdev->seg, bus, devfn) ?: ret;
>
> This causes pdevs_lock to be taken twice. deassign_device also takes a
> pdevs_lock.  Probably we need to change all the
> spin_lock(&d->pdevs_lock) into spin_lock_recursive.

You are right, I missed that deassign_device() causes
iommu*_reassign_device() call. But there lies the issue: with recursive
locks, reassign_device() will not be able to unlock source->pdevs_lock,
but will try to take target->pdevs_lock also. This potentially might
lead to deadlock, if another call to reassign_device() moves some other
pdev in the opposite way at the same time. This is why I want to avoid
recursive spinlocks if possible.

So, I am thinking: why does IOMMU code move a pdev across domains in the
first place? We are making IOMMU driver responsible of managing domain's
pdevs, which does not look right, as this is the responsibility of pci.c

I want to propose another approach: implement deassign_device() function
in IOMMU drivers. Then, instead of calling to reassign_device() we might
do the following:

1. deassign_device()
2. remove pdev from source->pdev_list
3. add pdef to target->pdev_list
4. assign_device()


[...]

>> diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
>> index 1cf629e7ec..0775228ba9 100644
>> --- a/xen/include/xen/sched.h
>> +++ b/xen/include/xen/sched.h
>> @@ -457,6 +457,7 @@ struct domain
>> =20
>>  #ifdef CONFIG_HAS_PCI
>>      struct list_head pdev_list;
>> +    spinlock_t pdevs_lock;
>
> I think it would be better called "pdev_lock" but OK either way

As Jan pointed out, we are locking devices as in plural. On other hand, I c=
an rename
pdev_list to pdevs_lists to make this consistent.

>
>
>>  #endif
>> =20
>>  #ifdef CONFIG_HAS_PASSTHROUGH
>> --=20
>> 2.36.1
>>=20

