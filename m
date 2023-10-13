Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 194347C8C30
	for <lists+xen-devel@lfdr.de>; Fri, 13 Oct 2023 19:18:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616773.959024 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrLnk-0004uN-HG; Fri, 13 Oct 2023 17:18:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616773.959024; Fri, 13 Oct 2023 17:18:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrLnk-0004ra-Dx; Fri, 13 Oct 2023 17:18:16 +0000
Received: by outflank-mailman (input) for mailman id 616773;
 Fri, 13 Oct 2023 17:18:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3A4Z=F3=epam.com=prvs=465081a231=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1qrLni-0004rQ-45
 for xen-devel@lists.xenproject.org; Fri, 13 Oct 2023 17:18:14 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7bf5b4c7-69ec-11ee-9b0e-b553b5be7939;
 Fri, 13 Oct 2023 19:18:11 +0200 (CEST)
Received: from pps.filterd (m0174680.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 39DF2xYs027596; Fri, 13 Oct 2023 17:18:03 GMT
Received: from eur05-am6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2104.outbound.protection.outlook.com [104.47.18.104])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3tpt0b2uqg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Oct 2023 17:17:46 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by AM9PR03MB7710.eurprd03.prod.outlook.com (2603:10a6:20b:41f::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.46; Fri, 13 Oct
 2023 17:17:42 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::f606:63f7:5875:6076]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::f606:63f7:5875:6076%4]) with mapi id 15.20.6863.043; Fri, 13 Oct 2023
 17:17:42 +0000
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
X-Inumbo-ID: 7bf5b4c7-69ec-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YGzCFvEH4x72DjlnxHhJpiQMFhSy7vufkxIcUDuhbnBoNvfhQq+N0aM+QhX9eY79DJDHYIpCBwUA/XNZaT1Q79FLji7BSbxgnDs+O7p5LqayhUfSuGUR9tp3eImE8VHw4dRhlZgIHMRjpTSww6LNwOo+LKfV+oR2sSAOPyTgwGPwC0Ybhd9IVn38uaPfHVp5r10zOeXHoSuOuEVVIEKwMAAVhUD9lQpdVAzkuki01JWJrb4c20/nM9BrxDDupKCGyGByEKHTfG8Turbgf8tmZVjpscVro4ZgSYNLr2LtT1MH8fZlx9M1z0n4hI1WI7ZLIBffBYi07Fc1SaQ85tmqcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DeuGO7xiNgdUKfWpjSn0Ko+/HVknrXULioq7CxC+PWE=;
 b=it4EdzvHrHLpw8ocotNuHYiQuPMBLtIQaGfLHQ7FkIcB/TzZjld+6XYrVyAVqMDHpy7VldonSgbIRuAvvS4LEWzjaAcr3g8e0ivZjQ6vIc3QUC5d0vlF+jHX+ALuKlEY9ETXpuSOxb64sJTvajNzaAzpzJOG/HgzvGLZ7oRA+kub7NTDxhJ9mjXJP0LUjXUlh56ZuAAapxUWV0isVOUe7MQ1xMrmtKLmamj+Y7RngISbv2auRNLc0v8TeqZaUk3f4T2iS2TkB1zVukMuY2UYvHuQepnGH2gFE8PtLyrVu4BN1ZJ0VpzYObBsIuZqez1r47yADyFX6m+MwOcpE8oejg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DeuGO7xiNgdUKfWpjSn0Ko+/HVknrXULioq7CxC+PWE=;
 b=MRUcPZWwXohJdw9hKMbqhV+DTKaCkrZpeLFOuaXrIn/Qky/ZrZxqqt7I4xKBZl58f90Xsmn65R6zZ+8hGAgjB1KhpNAuKx0JTyFcKm1Z5aPCYbH/hOfjt6y18OfHAmi+a175RolrZV47aVufAIqErXbewjmu6VNiFysyTSNpK6PyRD6Hievv9auChKvkVeKjZFzKWa5d0Cn4wX234qP/sZNec/8rZ2gpWOz2zKMkKFRRX+sc9W6Ozje2TTmbuReG4e6EWRBN04hWo2avoo+5Et1vxfMpxY2v/l9j9OxSOirLS4g4S0KTW9ePw1w0mXXK0Ms4nZTH+OzpaBHaGkUyVQ==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Stewart
 Hildebrand <stewart.hildebrand@amd.com>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Julien Grall <jgrall@amazon.com>,
        Stefano
 Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v10 15/17] xen/arm: account IO handlers for emulated PCI
 MSI-X
Thread-Topic: [PATCH v10 15/17] xen/arm: account IO handlers for emulated PCI
 MSI-X
Thread-Index: AQHZ/Vi/WuE7cEBbNE2PUEpOXmVwbLBHZXWAgABKrACAAD7pAIAAB/qA
Date: Fri, 13 Oct 2023 17:17:42 +0000
Message-ID: <87ttqu8mru.fsf@epam.com>
References: <20231012220854.2736994-1-volodymyr_babchuk@epam.com>
 <20231012220854.2736994-16-volodymyr_babchuk@epam.com>
 <8f70079a-ab08-4b41-8aab-834958ae93eb@xen.org> <874jiuacyy.fsf@epam.com>
 <9f79eb03-cd1f-4d4b-84c4-302e1ba9f8f8@xen.org>
In-Reply-To: <9f79eb03-cd1f-4d4b-84c4-302e1ba9f8f8@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.10.7; emacs 29.1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|AM9PR03MB7710:EE_
x-ms-office365-filtering-correlation-id: 34349430-845b-482e-794d-08dbcc104f41
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 L3r6RK+jH2P86nT+9Q4AHN3zb2KdK2sL5pE1S76BuOYxkqNUhfKIMyKpU7W/xjrRuP+ZbTF0oUtKsb+s86dtT33P9WNiN+zk75cYsDTeRePzKqC6it7YFAI6eYzEBSjINNBX1KPLYIhMdJyZNZYu/qtIOClLFXbV1fQnTA+qbGWu+QW9bpftQRaX9CGqB5n0knWsS6W5+yUaRInDEnNxllLIN42p284YEjxmApYc6MMz3ARCAWzhkxXW4ncb4J9W/p/Z1EuFDUBoDlrLyqTuFTPm7Uxh2QJPuRTdUsAPy5MHO61YZ8iAy1McE/mLoo7oP5UWOmieePKWdTTphvYxfao8eBXGFFnIE1+TZ3DQ7vb5sVRMhK/k0oPSVA5Q8/lFdSKsn+JfP2CGJ7gciLXTAvh1WjzMFW3YbXVOcQ6sTKiF0iSTOg3NpeaP8FGgCk6QIuabtYldYBDPa1rNQ7qj4NzWHvUuhwDF+obM1BD5wvcX8ZdwhxqwlyHwz73zZmLzpGgeVImObevvNuAdsGsYEakguzUGOmuGjnEMn2QI2k7XJJQgCeLDUMeAHqu1DmNqe3NJrZFudCwtdJtD5TopaKV5Bs1NAzE2ZAYylItaj/E=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(39860400002)(366004)(346002)(396003)(230922051799003)(186009)(64100799003)(451199024)(1800799009)(41300700001)(4326008)(5660300002)(316002)(6916009)(54906003)(66446008)(66476007)(64756008)(91956017)(66556008)(8676002)(66946007)(76116006)(8936002)(966005)(6486002)(478600001)(2906002)(2616005)(71200400001)(26005)(53546011)(55236004)(6512007)(6506007)(15650500001)(83380400001)(38100700002)(122000001)(38070700005)(36756003)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?pQvdOLK0wyXlvN7gsUw+xWazMD8/tf96OA1emruhhvaXCzund14FMVuOuL?=
 =?iso-8859-1?Q?1uwU6jvTdbbLKOEUY2TZWokI1kMYXUuYmaUetDgwZonjj2MyvZ6HD4rqO1?=
 =?iso-8859-1?Q?fsUeYGxR/WlWKmSRcsiiA0GZg8B+IiMoyPwVi8ZV+QZJCVrXfwS62koAiA?=
 =?iso-8859-1?Q?VyVG21UxNYKdkS7JFnmg11TiJFMQlRUvDYZwOwr5BtTWxV3YGvO3moVNFF?=
 =?iso-8859-1?Q?UOF98pFPLe+LviiU0Ecns7LaF32+OoSZuMsOmit7xhvian6DzRRWePm4tV?=
 =?iso-8859-1?Q?+3Yk6UpP9bBx5fcxfBITg/I0j9oiJGCjKej7Ug86GotCEOm1CsPOlVRH50?=
 =?iso-8859-1?Q?JGDzGjYFTUt+R+3wYyS/eHHrYyii/jXYL+r5mIWtu9owZcolQCrSJeuVD2?=
 =?iso-8859-1?Q?BR+Sm3Mu53btReD93btPLzR26aZpSHgdK1rrHUVWLTQSh1kLmiSzYTYGxC?=
 =?iso-8859-1?Q?1/110+9ZfKvosVPz/sC4OH9sHZ75FqoXEFSSZnsp/HrlsFsPfSJwIZDsMo?=
 =?iso-8859-1?Q?Y4y3WIOv2K0i51tYVQaaX1/aHnJocD9e78dDDi3bileayrJ3suGaXHcW8g?=
 =?iso-8859-1?Q?kwpEyav47bfozajVV3OFkVN34gzk66OmqJwYeIEh/JvG8D79XYMqpY1ElY?=
 =?iso-8859-1?Q?W1gIS9zqGpCY+cjMVOXg/bx11d5PGkXFJ+GtfIO6H4lv5T8WJ8Fr5tg6zN?=
 =?iso-8859-1?Q?gs0W9CWZBZ25jQlNqEVCzkJUtsC1UhcVAI1BfHG4aVUR5+k/knDOm6f3CY?=
 =?iso-8859-1?Q?4m6ExTEzIANMaoDZZdD6GiiKq3AL0+8adl8xhzmVPGHBdbOFy1Qym/OA6x?=
 =?iso-8859-1?Q?yeDLrW5wy3yws17h/0T794fGlQmhDH5ltug1+acQlvY9lL7FUD76da+xjv?=
 =?iso-8859-1?Q?uDP5PZ6bFSwMZQuW5Wn3EFIdGgvU/KO1Z8p+JtAlh1atLVYoIooUNd9zkg?=
 =?iso-8859-1?Q?DyITukMWwq0HGEzeRi5aeFd/WR/7l03B1pnEle9Qw+C+pilQFPmvXMBFm6?=
 =?iso-8859-1?Q?vEwAbem/fJIFp7bR955/t8qPf9ECKEKB3LR46tDh5wGqM8q45UmH0+84+s?=
 =?iso-8859-1?Q?q9gaKguMTjxySnrnGSuuZscW8Ghj5YGHJ3VgP8aaDVxywgoTGRekGiA8N4?=
 =?iso-8859-1?Q?vJSuPCPgin9iQACWD4wDSINcc231oO8eBm7iGDDBgpHUyoL7NHp2PrXMF9?=
 =?iso-8859-1?Q?Gfg6aifUqyPWh+E+rH9lP17iEG27NOJvGR8DQzAnw40LfQ1uy1BwvARutr?=
 =?iso-8859-1?Q?77q9WCXgzbptRK/ibtt6yUZtsD81WXe5GoDEMHBTuJltyDQQlHCOQwa0t1?=
 =?iso-8859-1?Q?m7VYVX9XTWW5XFO/2oobe8lNfVnbVzGd+DYqp2QPe47aPXmJC/o/srOhGT?=
 =?iso-8859-1?Q?tUyCFmC5E62jMuxz244VrOEFD/nRL8j21pOpPi0cLyvXuCe61OPAJ5ANNL?=
 =?iso-8859-1?Q?WGb00VAkoXuPaPNKXvXvOAxmqvdOa2hxqDUB1IRCtMqT/d/gHKEYQKxnp0?=
 =?iso-8859-1?Q?V807/mfpcgHWqqIS3LlDNeoS+4Qlgsu4AuQaOqCja90WwUj6f0RqHgke2b?=
 =?iso-8859-1?Q?bR7kOJ8BZE34lzzlU1fKMNUXgZwAukkmmvV6jY4wa9Mp6UAzEu5jNA2UwD?=
 =?iso-8859-1?Q?HMlVTIrLUuEkqU89YDFhwJAYcdmvUjuk8tmPybpcjAupkLDu0WczASSQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34349430-845b-482e-794d-08dbcc104f41
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2023 17:17:42.4078
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iyZdoTv2hLLFtqXNwCTFiMZFegRkcKs6JhxsmOPWWciComq1klRWFfRK0J58RhDdig0uii7rO3uUO8G+SazD7MEqf/pfSuiOkctT5ntp9uw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7710
X-Proofpoint-ORIG-GUID: TEM_FRpAUwiQXR398ZuTkS3HIe3AaUTh
X-Proofpoint-GUID: TEM_FRpAUwiQXR398ZuTkS3HIe3AaUTh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-13_08,2023-10-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=725
 impostorscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 malwarescore=0 lowpriorityscore=0 mlxscore=0 bulkscore=0 spamscore=0
 adultscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2309180000 definitions=main-2310130148


Julien,

Julien Grall <julien@xen.org> writes:

> Hi,
>
> On 13/10/2023 14:06, Volodymyr Babchuk wrote:
>> Hi Julien,
>> Julien Grall <julien@xen.org> writes:
>>=20
>>> Hi Volodymyr,
>>>
>>> On 12/10/2023 23:09, Volodymyr Babchuk wrote:
>>>> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>>>> At the moment, we always allocate an extra 16 slots for IO handlers
>>>> (see MAX_IO_HANDLER). So while adding IO trap handlers for the emulate=
d
>>>> MSI-X registers we need to explicitly tell that we have additional IO
>>>> handlers, so those are accounted.
>>>> Signed-off-by: Oleksandr Andrushchenko
>>>> <oleksandr_andrushchenko@epam.com>
>>>
>>> Some process remark. All the patches you send (even if they are
>>> unmodified) should also contain your signed-off-by. This is to comply
>>> with point (b) in the DCO certificate:
>> Oh, sorry. I assumed that it is enough to have signed-off-by tag of
>> the
>> original author. I'll add my tags in the next version.
>
> Thanks!
>
>>=20
>>> https://urldefense.com/v3/__https://cert-manager.io/docs/contributing/s=
ign-off/__;!!GF_29dbcQIUBPA!0mzdEfHOZMm2OmzFc6TZukGgMYRHxDWLdEQvbhUlDmOg3tZ=
NeDbWb8vHz38zLzcYv8GUZeHLn-5sWTYCkvkb$ [cert-manager[.]io]
>>>
>>> Please check the other patches in this series.
>>>
>>>> Acked-by: Julien Grall <jgrall@amazon.com>
>>>
>>> Is this patch depends on the rest of the series? If not we can merge
>>> it in the for-4.19 branch Stefano created. This will reduce the number
>>> of patches you need to resend.
>> It uses VPCI_MAX_VIRT_DEV constant which was introduced in ("vpci:
>> add
>> initial support for virtual PCI bus topology").
>
> Ok. I will wait before committing. Please let me know if there are any
> Arm patches that can be already committed (or could potentially be
> reviewed independently).

Well, there is the ("arm/vpci: honor access size when returning an
error") which can be applied partially to the current staging branch.

Maybe it is a good idea to publish it separately.

--=20
WBR, Volodymyr=

