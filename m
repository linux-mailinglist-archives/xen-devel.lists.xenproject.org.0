Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC8A04BEA48
	for <lists+xen-devel@lfdr.de>; Mon, 21 Feb 2022 19:40:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.276403.472551 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMDaf-00038x-EA; Mon, 21 Feb 2022 18:39:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 276403.472551; Mon, 21 Feb 2022 18:39:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMDaf-00036N-AJ; Mon, 21 Feb 2022 18:39:17 +0000
Received: by outflank-mailman (input) for mailman id 276403;
 Mon, 21 Feb 2022 18:39:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S5yU=TE=epam.com=prvs=40514b27e2=oleksii_moisieiev@srs-se1.protection.inumbo.net>)
 id 1nMDad-00036H-28
 for xen-devel@lists.xenproject.org; Mon, 21 Feb 2022 18:39:15 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8f40fcf9-9345-11ec-8539-5f4723681683;
 Mon, 21 Feb 2022 19:39:13 +0100 (CET)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 21LIV3ei010739;
 Mon, 21 Feb 2022 18:39:05 GMT
Received: from eur03-db5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2059.outbound.protection.outlook.com [104.47.10.59])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3ecg3900ky-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Feb 2022 18:39:05 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com (2603:10a6:102:ea::23)
 by VI1PR03MB3582.eurprd03.prod.outlook.com (2603:10a6:803:34::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.27; Mon, 21 Feb
 2022 18:39:00 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::c1c:f98:9dd:86e0]) by PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::c1c:f98:9dd:86e0%5]) with mapi id 15.20.4995.027; Mon, 21 Feb 2022
 18:39:00 +0000
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
X-Inumbo-ID: 8f40fcf9-9345-11ec-8539-5f4723681683
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XgdLDFaFyX3dsMVBhoy0S4tyFiHB3L7h9clgEGh8NW4m6N9NDsdu0A29cm82fvwvUXFGqsIE1cF/Dw947DixEDDLcMjSudgDnEXSl8uqe3giQZWLBilVKoUfWWctDSEYXa+AkXh593118VOwJ5sJJBGRl1wVHtvx9MXyNhsjVIlTvRfE9XX9DEW3s+ZcZe/N4cKdu/NVaGLz1CYhn/CHuVn+EYZp0zN4uOvs/k2jnMSBnxGXGKjq7imfCGFuLY8c5rSnBytC4Pe7ZmKddN1osqtIZK0EVsa1Ee5AfHfXXMZOxqirpBtwcCkbQdTrn1acjxqv/YvSe/R6oNfGGdv51g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9aAKFgdGEsTa7WZqY3ARW9nutAOMip2HQvlx/JW81nw=;
 b=Las/vRN+CmzgWdpw/1bYBn/PaJq3LZyFyEKQ/gyhyjqxc9nn2KOWv6zcLz6Ew9Fs7+nImClg2Y5TbkK1qpSyBwyqX+YQKIo9nDXVHZgkD49stQmiTN4yyIpaMN/0g+3tKaem1qWi1gV7u5tjKbBLhBVuvD8Oyzam1E/Dt4eNmNDAJPUhNSuIEHHEOoyty//6V2MZcqEI/DbCnMDESwfz1Nw9JtmZ8+VFXrK94enPcKv40bRLgpMJ5HadmPdgraOxDRI4EXGEqnnb/jFXf05RLCBrtCRkQBN/EfOihIl3ya/9ijVdS75GTOEjoLaWYRz1gVgITQkUba/THm7m3x0mdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9aAKFgdGEsTa7WZqY3ARW9nutAOMip2HQvlx/JW81nw=;
 b=ILevcOuOq1o6/v1gEFmQku6GxxO1KyxKEq1zdeE5NVJGWHKEJShd7+oCh+Ps1jFTUFVMtSYzll1CQENY3Hk1NFoBX53cAIHF+2Tti0dloPMocRasfobwqVrjU1ZPA61FpPoH6kyuDkdQ1RjlroGH+YoUVCYCRAJKmPYP5t2K6EFCNdSnAnt6x71bN63ZUgdtNQcFYayDgDIKgHB64qrpXMc/rt7oqiet/MzBUFIvddtyruv+wKsFbynv0gvpY1OtY3mpaEuTEuTFz+NkeLyNd0YOcOYJU6WzzDUY6iOo2uchmE7jciOxN7fHPD75xZH/y0llofYFYsJHBFkfHP8tVQ==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Wei Liu
	<wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
        George Dunlap
	<george.dunlap@citrix.com>,
        Jan Beulich <jbeulich@suse.com>,
        Stefano
 Stabellini <sstabellini@kernel.org>,
        Nick Rosbrook <rosbrookn@ainfosec.com>,
        Anthony PERARD <anthony.perard@citrix.com>,
        Juergen Gross <jgross@suse.com>, Paul Durrant <paul@xen.org>
Subject: Re: [RFC v2 6/8] tools/arm: Introduce force_assign_without_iommu
 option to xl.cfg
Thread-Topic: [RFC v2 6/8] tools/arm: Introduce force_assign_without_iommu
 option to xl.cfg
Thread-Index: AQHYHRW3O86755dYV0qSgPdVO9oeMayX6acAgAEsnQCAABEMgIAFQxiA
Date: Mon, 21 Feb 2022 18:39:00 +0000
Message-ID: <20220221183859.GA66126@EPUAKYIW015D>
References: <cover.1644341635.git.oleksii_moisieiev@epam.com>
 <d333126d12f2281f8df92e66cfba1c9eb2425dca.1644341635.git.oleksii_moisieiev@epam.com>
 <ab6d8d13-30cf-d322-668e-f3f5aaa56824@xen.org>
 <20220218091632.GA1486420@EPUAKYIW015D>
 <15ada062-2ec5-d8ff-6bd7-5c580939accc@xen.org>
In-Reply-To: <15ada062-2ec5-d8ff-6bd7-5c580939accc@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 73171b87-d3e0-43f1-b191-08d9f5696d73
x-ms-traffictypediagnostic: VI1PR03MB3582:EE_
x-microsoft-antispam-prvs: 
 <VI1PR03MB3582BC9FD4470ABCEF5850F0E33A9@VI1PR03MB3582.eurprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 /bwrVmHMQPd0Qt1v5K4PXJ+RaB9rxJHMieOsN/+PIoXPM6z1vPJpyLW1saQ30mBJs5tGIRR7Svfjz7z7dufhY3hNuwrJbV9IZy7LXpfcPYS0vfUjepl3XABeg6NKBtO7T5zcg9NbsH5Kg6PZlUomraJNVtG8HFYOVC2qp6umOcMozlLphL01Kb//ABU1SUHbfrFTPwhxuQ/30eBYUoDBZ05s6OoJOVO1XzPmDwMPT87UE1PZtsg0GqFwVE9KTzGXmfPPIvBqwvifsHwoEfIafyZpZRMTRWfMthmJxNnGEta+hTZNDDgTf/LaE1g9r5mXg9X7aREiaK3+5z78GdAy6MH8Lc946bBA0WoWEADKkbVsIxwjW2r26pzCmkowBVS3oIOvPBhjkYd83nDRfxWqpaMAGThkzsp5r1ALwUjvgK2PCi3Symm9cf80udFb6UrFI6JgNgdSyQzRQ9OvMvBsfTHxBpsgxJF6TcZwlAniogx4X8QtkWmFwbqYpWQ/Z5m/GG9j7h/Y7ZCcPZi2NfnjaLKrToUU2NAbeSIbjiyGiel+sd1XF6weS9RLIbpvI8rkkbhhixv+VkJHoba49Xw1tfp0Vq6ccBaMCr6JaXLirawvs/CfOSsnnSmmwx4k+2YXa+y0Ylei//kgiq99izPVGtLf4Sf3xo2eHiFcs6oCILsr2XVVLEhfqt4eB1biWBGen0DWo3CLuYkXP5BJACB+qDs3Guck2m/97PAcyPnxnvR/ITrModCDTLLuCIzwhao15YYxmtQ8chQFOgt5eNekIJOWMpGGAqYvPI0MVijWaSs=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR03MB7136.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(66476007)(6506007)(66446008)(9686003)(4326008)(66556008)(6512007)(2906002)(1076003)(86362001)(26005)(53546011)(5660300002)(186003)(66946007)(122000001)(6486002)(966005)(508600001)(38100700002)(8676002)(64756008)(71200400001)(8936002)(7416002)(91956017)(83380400001)(33716001)(38070700005)(6916009)(316002)(33656002)(54906003)(76116006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?XXN946FvnROtrO+1CLTyor9hZBKJAcgtGIElVKD6Z3IsI53oyKdd2ypvFsz7?=
 =?us-ascii?Q?HKofHyMEJU+6JBpKM0pwhBv2kRC+pXYxO93nn0omSHJrrWjpvzaNOViu0uAv?=
 =?us-ascii?Q?iFjRiJROpBqMHaPHj95Wvsi3AUVLVMf1H58IOfov2rcB9ROPU9se/pN3ay8C?=
 =?us-ascii?Q?yAze5hwIz/5WsiYFlVOsX/hWnove859MFKoYTNgQkJWI5kwCFuGJt7vesO6K?=
 =?us-ascii?Q?5p9pUsLA/3OHULp9ZlnnMlcOugRhJ7e1tJc0BwJiyPcsfvpnXi8MTp57RmA+?=
 =?us-ascii?Q?/hj7rpp4UbSnnSDfFkpMnsgU7ARejz8+wLQAfv71eMOXUybLEkidThEU0w8A?=
 =?us-ascii?Q?IBbyU66qWL4JhazN/5qR7myU15nVYu1+g4EFi7D71y5gL3rhxvD0xiSlju8s?=
 =?us-ascii?Q?GVy+JQuyVlHK5HbVBjrbn1AO47jV4IJCDVUxSp5ueH1dsJ7skUXDG8cLi2zo?=
 =?us-ascii?Q?Mtv8g0KV1lhxdvOUeBx8+stH0egqFUj6oq7x5qWIJrC4wSTyZpRTOscJqPxo?=
 =?us-ascii?Q?a9y5LbGq4yh+GleeEdqvi41+OxMVd+eUnjio88Kd3kOnTFHgQu8azV5BFdzY?=
 =?us-ascii?Q?USQtQ9HzZ43WEKoDvUtrpqn0CmnB6Ysve1UuGhlNn2yHkFYqLS50UlCSgc3X?=
 =?us-ascii?Q?I1oD6dHMNCZltNyjnypuNHGSsHCfUyxgjmoWIy8eOk3F1/xZUAS0v+MiCy3F?=
 =?us-ascii?Q?teBQjkR4r+yhi6tPbq2HCfOiKNCaE77EumyowqDOCGlhoN9opW/xc7YwX0ME?=
 =?us-ascii?Q?L09VCoZjMUDDLZ83DsVZN8GLm+cy8ObNS6xSJ+deG3AIZ4op7qmP3wsRu7cH?=
 =?us-ascii?Q?dy0rhbQwsjAb7khlDx5TH5RntrqNShpQ0VNZ2RlSXW82Kp1HbWIppZuwJACa?=
 =?us-ascii?Q?UMAzAJoGVcpOTTOdfpvblKmV977qrPgQejmdqoBQFy+uJIBUJOJ0t8NJDGUW?=
 =?us-ascii?Q?eZp2+K8t8XPaYqZ6OmP9sTIcywpxnBzTc+WqZUEZAt5AoQEjYduT2rNs6GBP?=
 =?us-ascii?Q?sD+ZLiMi1Gu1nrceNb7hfgzaks5a7HYQC+UjsBovHjTZjfkCWCMXZER7yulb?=
 =?us-ascii?Q?RvJww0pbGT02T/VK17Ru9nQNI6XKupOuRRojV/gjCKMO1Rd+Lg1TGcC2bQf7?=
 =?us-ascii?Q?EW1F8vO90AV+MYtuPQYk6+jDhv/w713FaXe/jxPe93WUkGk47JIbDI8T+G4A?=
 =?us-ascii?Q?gVF0JjOcnHgcGKrgUAGm1yy4yuO4wPOLXKXM4Ak7K/KC+XMd3FopOiiQtJog?=
 =?us-ascii?Q?O8/S38EozC1iPYA8CFaIXBjyBTfuIYGsoyG10M+E/dqrJcJFTVkqZC0J2Ga/?=
 =?us-ascii?Q?h8eCXlndrL5CEINrCJN1140BpayKj4swImsohY+cheATtywfozBeO2sgAZfJ?=
 =?us-ascii?Q?83hC4ADB8vQapDIKR7G9As9aUYtK4fcvBbI80yIzp16Up7tEWLk/gJ11tCjy?=
 =?us-ascii?Q?VJmdEKfBkq2cqS9qYpMluevAgBCMnzwOaNZOfUeRb3G3YipkHKZY5QYvNpPu?=
 =?us-ascii?Q?mImp986rGmot9W969CBJkIq5q/jLqr5p6cYDs+BKRAmHHWK/DOqzYY6KcOTE?=
 =?us-ascii?Q?q9rDG9IeiR5PAqed578JGA395mMP/RK5XzLOWE1CrEbWlfSiTB521/vQHkca?=
 =?us-ascii?Q?IEMI5Em1GhsFOfGBU2cRNk8OS9CT8/iDjAxR+pImm/UnQAWKjdw9oSbfBbRR?=
 =?us-ascii?Q?y9oZtvWyfyDTZoru/J3tSFhDaQI=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <08E2A50F93F65749A6C202EE21114000@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR03MB7136.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73171b87-d3e0-43f1-b191-08d9f5696d73
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Feb 2022 18:39:00.5524
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tShoDLFbLtY527UfaXAquiAjo2XcPmPNsQmohhAqyWi4dMm87zkOXoorYvcYnDrDZ53+LVWeb9diOVJsB5pec9FqJbwyVGx3AhxxpfBMoqI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB3582
X-Proofpoint-GUID: wzYD_0f3M7M9QnSjnhO0_MFiII_R37R8
X-Proofpoint-ORIG-GUID: wzYD_0f3M7M9QnSjnhO0_MFiII_R37R8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-21_08,2022-02-21_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 mlxlogscore=999 phishscore=0
 adultscore=0 suspectscore=0 spamscore=0 mlxscore=0 clxscore=1015
 bulkscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202210110

Hi Julien,

On Fri, Feb 18, 2022 at 10:17:33AM +0000, Julien Grall wrote:
>=20
>=20
> On 18/02/2022 09:16, Oleksii Moisieiev wrote:
> > Hi Julien,
>=20
> Hi Oleksii,
>=20
> > On Thu, Feb 17, 2022 at 03:20:36PM +0000, Julien Grall wrote:
> > > >        xlu_cfg_get_defbool(config, "xend_suspend_evtchn_compat",
> > > > diff --git a/xen/common/domain.c b/xen/common/domain.c
> > > > index 093bb4403f..f1f19bf711 100644
> > > > --- a/xen/common/domain.c
> > > > +++ b/xen/common/domain.c
> > > > @@ -512,7 +512,7 @@ static int sanitise_domain_config(struct xen_do=
mctl_createdomain *config)
> > > >        if ( iommu )
> > > >        {
> > > > -        if ( config->iommu_opts & ~XEN_DOMCTL_IOMMU_no_sharept )
> > > > +        if ( config->iommu_opts >> XEN_DOMCTL_IOMMU_MAX )
> > >=20
> > > XEN_DOMCTL_IOMMU_MAX will be defined as:
> > >=20
> > > (1U << _XEN_DOMCTL_IOMMU_force_iommu)
> > >=20
> > > This means the shift will do the wrong thing. However, AFAICT, this n=
ew
> > > option will only be supported by Arm and likely only for platform dev=
ice for
> > > the time being.
> >=20
> > Thanks, I will fix that.
> >=20
> > >=20
> > > That said, I am not convinced this flag should be per-domain in Xen.
> > > Instead, I think it would be better to pass the flag via the device a=
ssign
> > > domctl.
> >=20
> > Do you mean that it's better to set this flag per device, not per
> > domain? > This will require setting this flag for each device which sho=
uld
> > require either changing the dtdev format in dom.cfg or setting
> > xen,force-assign-without-iommu in partial device-tree.
> >=20
> > Both of those ways will complicate the configuration. As was mentioned
> > before, we don't want to make domain configuration more complicated.
> > What do you think about that?
>=20
> We have two interfaces here:
>   1) User -> tools
>   2) tools -> Xen
>=20
> We can chose different policy for each interface.
>=20
> For the tools -> Xen interface, I think this should be per device (simila=
r
> to XEN_DOMCTL_DEV_RDM_RELAXED).
>=20
> For the User -> tools, I am open to discussion. One advantage with per
> device is the user explicitely vet each device. So it is harder to
> passthrough a device wrongly.
>=20
> But I agree this also complicates the interface. What do other thinks?
>=20

I see the following ways of User -> tools format:

a) Set force_assign_without_iommu =3D 1 in dom.cfg
b) Update dtdev format add force_iommu parameter, so dtdev will look
like this:
dtdev =3D [
    "/soc/dma-controller@e6700000",
    "/soc/gpio@e6055000,force_iommu",
    ...
]
c)...

Tools -> Xen possible ways:

d) Set force_assign_without_iommu to domain globally
e) Pass force_assign_without_iommu via device-assign domctl.

a) + d) is what we have in the patch series.

I think a) + e) can work for now so we will have an interface to make
force_assign_without_iommu per device in future.

What do you think about it?

> > >=20
> > > >            return -EOPNOTSUPP;
> > > > @@ -542,7 +545,7 @@ int iommu_do_domctl(
> > > >    #endif
> > > >    #ifdef CONFIG_HAS_DEVICE_TREE
> > > > -    if ( ret =3D=3D -ENODEV )
> > > > +    if ( ret =3D=3D -ENOSYS )
> > >=20
> > > AFAICT, none of the code (including callee) before ret have been modi=
fied.
> > > So why are you modifying the check here?
> > >=20
> >=20
> > Because this check will fail if we have CONFIG_HAS_DEVICE_TREE define,
> > but do not have CONFIG_HAS_PCI and iommu_do_dt_domctl will not be
> > called.
>=20
> Below the implementation of iommu_do_domctl() on staging:
>=20
> int iommu_do_domctl(
>     struct xen_domctl *domctl, struct domain *d,
>     XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
> {
>     int ret =3D -ENODEV;
>=20
>     if ( !is_iommu_enabled(d) )
>         return -EOPNOTSUPP;
>=20
> #ifdef CONFIG_HAS_PCI
>     ret =3D iommu_do_pci_domctl(domctl, d, u_domctl);
> #endif
>=20
> #ifdef CONFIG_HAS_DEVICE_TREE
>     if ( ret =3D=3D -ENODEV )
>         ret =3D iommu_do_dt_domctl(domctl, d, u_domctl);
> #endif
>=20
>     return ret;
> }
>=20
> 'ret' is initialized to -ENODEV. So for !CONFIG_HAS_PCI, then ret will no=
t
> be changed. Therefore the current check is correct.
>=20
> AFAICT, your patch is setting 'ret' so I don't expect any change here.
>=20
> > Same thing if switch/case inside iommu_do_pci_domctl go to default and
> > return -ENOSYS. This part looked strange for me. But I will definitely
> > go through this part once again.
> We use the same sub-op to assign/deassign a PCI and "DT" device. So we ar=
e
> not interested in -ENOSYS but -ENODEV that would be returned by the check=
s:
>=20
> if ( domct->u.assign_device.dev !=3D XEN_DOMCTL_DEV_PCI )
>=20
> At the moment, there are no sub-op specific to "DT" device. So it is not
> necessary for us to check -ENOSYS yet.
>=20
> I haven't looked at the rest of the series to see if we need it. But if w=
e
> do, then I think the check should be extended in the patch that requires =
it.
>=20

Thank you for the comment. I will refactor this code.

Also I wanted to share with you some thoughts about using SMC client_id
field to pass agent_id to the SCMI.
Posted question regarding this approach to trustedfirmware
phabricator [0].

I've found that ATF already has multiagent approach implemented for
stm32mp1 platform, see plat/st/stm32mp1/include/stm32mp1_smc.h [1].
It uses 2 funcids hardcoded for AGENT0 and AGENT1:
STM32_SIP_SMC_SCMI_AGENT0       0x82002000
STM32_SIP_SMC_SCMI_AGENT1       0x82002001

I think this approach will be very promising for SCI mediator.

Firmware defines a range of func_ids, let's say from 0x82000010 to 0x820000=
20,
where 0x82000010 is the base func_id for trusted agent. This func_id is
set in arm,scmi-smc node in Xen device-tree.

During startup Xen requests agent configuration and calculate func_id for
each channel the following way:

<Base Func_ID> + <channel_id>

Calculated func_id should be assigned to the Domain by setting it as
arm,scmi-id in arm,scmi-smc node. So for the Domain Xen will generate
the following nodes:

scmi {
   compatible =3D "arm,scmi-smc";
   arm,smc-id =3D <calculated func_id>;
   ...
   shmem =3D <&shmem_node>
};=20

shmem_node {
  compatible =3D "arm,scmi-shmem";
  ...
};

In this case each domain will get unique func_id to send SCMI commands.

I see the following advantages of this approach:
1) There is no need for Xen to intercept SMC requests. All requests from
agents will go directly to the Firmware, which can calculate agent_id
from func_id. This mean that there is no need for scmi_handle_call
function.
2) This approach already implemented for stm32mp1 board so it's more
likely to be accepted.

Another thing I want to discuss is how Xen should handle scmi related
nodes from xen device-tree.
Currently Xen device-tree includes arm,scmi-smc node and a list of
scmi-shmem nodes for the channels:
scmi {
   compatible =3D "arm,scmi-smc";
   ...
};

sram@0x53ff0000 {
    compatible =3D "mmio-sram";
    ...
    cpu_scp_shm: scp-shmem@0x0 {
        compatible =3D "arm,scmi-shmem";
        ...
    };
    scp-shmem@0x1000 {
        ...
    };

    ...

    scp-shmem@0xF000 {
        ...
    };

};

We do not want all of this nodes to be present in Dom0.
I suggest to set xen,passthrough for all this nodes to ensure that Dom0
will not get information about other channels and generate nodes
arm,scmi-shmem and arm,scmi-smc for Dom0.
I think this approach will be more secure.

What do you think about both suggested approaches?

[0] https://developer.trustedfirmware.org/T985
[1] https://review.trustedfirmware.org/TF-A/trusted-firmware-a=

