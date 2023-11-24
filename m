Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2534B7F69C3
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 01:26:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640068.997860 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6K0P-0007U9-V4; Fri, 24 Nov 2023 00:25:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640068.997860; Fri, 24 Nov 2023 00:25:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6K0P-0007Ri-Rt; Fri, 24 Nov 2023 00:25:13 +0000
Received: by outflank-mailman (input) for mailman id 640068;
 Fri, 24 Nov 2023 00:25:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SG+4=HF=epam.com=prvs=569229df20=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1r6K0O-0007Rc-0F
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 00:25:12 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eb4a508a-8a5f-11ee-9b0e-b553b5be7939;
 Fri, 24 Nov 2023 01:25:08 +0100 (CET)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3AO0ORxk013091; Fri, 24 Nov 2023 00:24:49 GMT
Received: from eur05-am6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2105.outbound.protection.outlook.com [104.47.18.105])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3uhkw34ve0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Nov 2023 00:24:48 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by DBAPR03MB6453.eurprd03.prod.outlook.com (2603:10a6:10:190::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.20; Fri, 24 Nov
 2023 00:24:45 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822%6]) with mapi id 15.20.7025.020; Fri, 24 Nov 2023
 00:24:44 +0000
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
X-Inumbo-ID: eb4a508a-8a5f-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nLglW6xJh8OjH26zqO4oUedRj7yreNlMNzWAtzXfX6AF5xHNUJ4qVbR0YspPLtw7qM0JjXIYYK/cg0Rr7kCRwaR0JLZrqzGXeY+0T3aC/swgykhXBCN/j/9YalLWA2p2/35dJBMtuVFo3cPI/FqUsQCLqAgtn/wMzqMDxj8KunIl8aRXllZPsRPVJb3acBF4TkolQj69+Wrap25jKNqkb+1WWJbbWQtfGSSIE4Ux2U6eVfpeiu5HGyBP+Mnfuk6DXINjSlIBwqt0qv03JLdCW/mbxw09gGerHW1TXLVr+AHjMYTsRVtRizLm6Zrna6vdSQc1gBh6gx3eal6jr276CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HTGjCRKPV+GhqL+983Xg/W5ncFSyldI8vndC+osq6gQ=;
 b=E2ehPulxSAW21M2WQRmNSuLr3s28AE0PtlZeX9ZPyTIw3SOlC9Wfh3hu/03RnymrGtwWu5sc41SjvURqh+gGdNr5bZ8O7DeXOdzw8QqNpBSm9OYu3u/jnUrzyAfITs9VFAVnnWhxtPkPHWr2gasDmklMAgJWgiTBs6ck+lpFSXTbmhGsggwfEczpCoa2WZmzRcCMKQBRlno+CC9xPYCqPOnzvlG08A5sJr5OM+hyKsMb57UYCTjQbMLuVk7TQ+aYcf5lVB736Lr0iVBiVIzI+1soTDpdM5i/WEIzZum5VcRDJ+IAsuYjMiUHoiAFEPcK1simCrKF0pgESCsSSjgJeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HTGjCRKPV+GhqL+983Xg/W5ncFSyldI8vndC+osq6gQ=;
 b=q0qh+giNdAeXr1R1aJ803MiO1x5f4EkLNSRm9punsdaojnXrV18WZQg81y8wtHvAqMbgpMOwejSsx6ZP769WaQqA59ht2uFW0A3LYFG1jM0bA0P/EnLRGd7eauiJZG9xyL6C23FooAGyurS3C+MZoh4bJfqgX82rNq5sqAlhqF+VVT2y2CWLIhmLND/4fuOtR84hpZdxHswrMGsK+tUACMASpKGyack5lc0dzV83HBU9HyA3+BcGfJ3iCnyioK30yKKfhC5St74aWzJ+VkrbUZLHGOrD/+innGTeZ1xiEjIm31WkLHEixTH3qvxPvKeSItubCM66AcgQjfApv28sng==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: David Woodhouse <dwmw2@infradead.org>
CC: "paul@xen.org" <paul@xen.org>,
        Stefano Stabellini
	<sstabellini@kernel.org>,
        "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
        Julien Grall <julien@xen.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Anthony Perard <anthony.perard@citrix.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 4/6] xen_pvdev: Do not assume Dom0 when creating a
 directory
Thread-Topic: [PATCH v2 4/6] xen_pvdev: Do not assume Dom0 when creating a
 directory
Thread-Index: 
 AQHaHMeIsCU+MAEGAkSnPoa9ThBNz7CGlGOAgABYsYCAAAmAgIAAAakAgAAAyoCAAAJ4gIAABwqAgAAFCoCAAJ2+AIAAJb8AgAAD5ICAAASYAIAAA+AAgADHXgA=
Date: Fri, 24 Nov 2023 00:24:44 +0000
Message-ID: <87leaovvzo.fsf@epam.com>
References: <20231121221023.419901-1-volodymyr_babchuk@epam.com>
 <20231121221023.419901-5-volodymyr_babchuk@epam.com>
 <b04daedc-ba6a-4109-8e23-fbcd023bcfec@xen.org>
 <alpine.DEB.2.22.394.2311221428570.2053963@ubuntu-linux-20-04-desktop>
 <ce719f35e72a9387fc04af098e6d688f9bbdca4e.camel@infradead.org>
 <alpine.DEB.2.22.394.2311221508270.2424505@ubuntu-linux-20-04-desktop>
 <a4e6a62a7cfe756344a1efcb8b2c3cfb1e50817e.camel@infradead.org>
 <alpine.DEB.2.22.394.2311221515010.2424505@ubuntu-linux-20-04-desktop>
 <87r0khz6zj.fsf@epam.com> <87cyw1z61i.fsf@epam.com>
 <dce4efb0-4fdc-404c-8e5d-c90ed732eb8a@xen.org> <87bkbky9bb.fsf@epam.com>
 <5941AF2D-71E7-4A5B-A519-25F87F90DC05@infradead.org>
 <87v89swtmz.fsf@epam.com>
 <C2DEE963-41CB-4377-93FD-BD9FB500926F@infradead.org>
In-Reply-To: <C2DEE963-41CB-4377-93FD-BD9FB500926F@infradead.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.10.7; emacs 29.1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|DBAPR03MB6453:EE_
x-ms-office365-filtering-correlation-id: cf822bc6-e517-431c-d1e2-08dbec83c1f8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 pOp5IsOMnRsbMTB5K0nr7zG4dl0KUlN5nc4+5jWQEGTSxj+ieqPrQlATWv8l85M0sLeXHnHzBGFvUAMw2cWftGo9ANPWZVKHyMWrpmWroD9LW+QtmLnWdf0U0s8gPHtuLX1KN6Cp+W8PChGlwrfuijrfjHU7uh+y68f4u3hzcaVoZOJI2h66bSdalCbxIxCVELKZG1YXh3IWVhiPMc7cmg5Xb34OD9W/UQdjJSzYFPhkg7rj74g2cm6vSwC85dyWnzloAm286UiCYYxL66f0VUQx6z4Tm7IIrvW2R3L3FHHbSsfnQ2hdn6kYZT4G88JAmkXWGlJB5+fThAjrGPHj7KaX1cgmg7vI2WGHMoNv+xVzq15UcJIKqgtIwqzf/h9iDeOqiXpTPt6gt7dmIbObhPp35G8vZPQgpmY3lR0JODmaqn60IjUaNTWqeAz6jDvCrvkZAqFsFwU1UTxJq49Pin8RM7z8DgEexKJkbjPDsHxATTWkOpn7nStzkE7/XTlYGSFFy8hk1kNPavKAom12eV6QhJ5js9+q6eeCYTJScKf9eAiOSThDeFqxxe92SnXx74PdqeotztHXSsxZlwiMYeCv02IQ8wL5+0R/IE2xnm+oOx7y7tHMU9Y8evaKU1Dr
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(376002)(136003)(366004)(39860400002)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(5660300002)(2906002)(4326008)(8936002)(8676002)(41300700001)(66446008)(66556008)(64756008)(66476007)(316002)(54906003)(6916009)(66946007)(76116006)(91956017)(71200400001)(478600001)(6506007)(6486002)(53546011)(26005)(2616005)(6512007)(55236004)(38100700002)(83380400001)(38070700009)(122000001)(86362001)(36756003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?4urS4pTYUmo7j9hl3LTvmHsSdZA9ObLZB8sO11uSq98g+Xo2yjonyvIrHl?=
 =?iso-8859-1?Q?8nc400zt1WLVl8xkoZX/CVJL6fAYjTdf8Mx1vUP4iVFK+/tjRaMzwYoarW?=
 =?iso-8859-1?Q?bjYRptlA2JCSeRhkjM5unjSqDhOlsJeEangMTf8gpG8JQMKDkDIVVqnaIN?=
 =?iso-8859-1?Q?wC97150UWH3dMKpOjgfOXnoMmk90NVOQxN7BAg/jVYbU76knyyf5D/PvAh?=
 =?iso-8859-1?Q?R6Lso3smUsYQUnnHmbd+I6ZULL3myRd+yS4S1xf4X6zxNFzbztHNHQsFw+?=
 =?iso-8859-1?Q?q8xEff25XMIXol7rbGem38ZZOfGSWghDEDUB0WCNavwAepCrUZEd2tzJZS?=
 =?iso-8859-1?Q?mSM95jf4n9Ri0VohcmEKpscjfSP5LGs7nn6qgroq6/w/v04i+EkjZq8/1G?=
 =?iso-8859-1?Q?Qdig6pFVFdYtL7hrNkMFGjA242MAVsz7IUe393LeKd6Bcc0mqLHjFBrL/E?=
 =?iso-8859-1?Q?CMbWrNdqIf0qHSiGI9ItuPWZ/8cE83sr6SQa1R8k2Y3+1DixcspR97BoPh?=
 =?iso-8859-1?Q?COvjk0Ui3/BkeIcmxGwORe70HjXR+vqNADYYUtIhGjspY1QlxbJppK+MXk?=
 =?iso-8859-1?Q?jSRntUyn+tLNLf/LOFcy20HEXecL3M7miJy57I4LeMG6BFCs4TqhVH9Bt+?=
 =?iso-8859-1?Q?ZAGUVGGPFRFjsgniUlr7Hhaboh1ZLp5sLosLiNiCSECfuO/kTlwpWY+Que?=
 =?iso-8859-1?Q?lzfjJhpHdJbmkRL5mJ/zrl8uL7a2viyuQdAMMVhksJsUbCMSwNt9NmPys5?=
 =?iso-8859-1?Q?4Yl9mh03xY8MAzcLmtwLSdFiFfcls1WlD/2X8vG7IXRn4QU6p3Gb3XlUqq?=
 =?iso-8859-1?Q?IlGfUnZpO9Cp46+bIudwYCf94e1LHNcvtFYQy3gPFqUoWQVm1rNV+BnObN?=
 =?iso-8859-1?Q?ugXlrK1flpffoLRnpV8li+WalGeMm2W4ob1L1E8kMbkXfbt1Nroqoud4dk?=
 =?iso-8859-1?Q?xVOdLkvM6sh65od4oAhAFC9w8X65GIgztWbXcU15bdLoW3uL/nd8CjA6f9?=
 =?iso-8859-1?Q?jAo8xuKmL3wP8PwCoVXkheHJ+PBXz9BCMtml+DQRkUx/urb+myJUwsMXN/?=
 =?iso-8859-1?Q?PZJcsL6iN/gtGKmAxkEY8uodHHzGaqsb4IeZW4QrNYyojZdicxaGSDSgmo?=
 =?iso-8859-1?Q?k5HfhGdpAf8mYqXfdI2usBq/x0HW7M0EskL7Hj8coJViySK0/f4ym4qLgb?=
 =?iso-8859-1?Q?T2F+SCJYZznPgcmTYG5nqi/O0BX4GcN6kCF8Mh9DefkWDcerT2BwvBKpXD?=
 =?iso-8859-1?Q?+7k7VaMQPIKwxpMUIg7yTEfBDGEWzuur8wZk1CAH1YIVFMSKABDDd0IeyI?=
 =?iso-8859-1?Q?jy0yLr4wFtci3oeaElBX2OUn3nzcQYgi+KN41jYDdPEFUJcw/m7KetR2Jh?=
 =?iso-8859-1?Q?+uvXgMV7Gjl9YLU/5H+Opm3wf3j3qcua4qCCvTWL1M4hPmag18jzFHhjY5?=
 =?iso-8859-1?Q?FFZthV23upCdL677lwkijk/m45LQrN8euAPqFv8II81IQp9hmhZMqWH4wg?=
 =?iso-8859-1?Q?i1s2irmSMBDP7tEobNHnO9nLozcUb25RZjFPDlPYPALLp6IlS4gV4xGjlD?=
 =?iso-8859-1?Q?x5fCnWPrZYImbI7CPbbOZjET4TeTK5OkcAEVIQGVECWdQG8MJyq0wT9lll?=
 =?iso-8859-1?Q?+FJWGXPjIxKRLfiO8Cwmrm5b4ONamt3Do0SJogS+9RbJU3n41u/l343g?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf822bc6-e517-431c-d1e2-08dbec83c1f8
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2023 00:24:44.1623
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4FcRQmsOtVxJZPiz4FjHliwCMk/+0ddemCxmORRnvMSOx2ZREcRWzaGfucUWC4O+dl7wCblmobQEYVRm3H6z2M5eVMKeRai+xyXq/BnK/J8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR03MB6453
X-Proofpoint-ORIG-GUID: T1p5sik6KRT4ji6dIs1wU6XFiUZiTi8r
X-Proofpoint-GUID: T1p5sik6KRT4ji6dIs1wU6XFiUZiTi8r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-23_15,2023-11-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 adultscore=0 mlxlogscore=784 priorityscore=1501 bulkscore=0
 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311240001


Hi David,

David Woodhouse <dwmw2@infradead.org> writes:

> On 23 November 2023 12:17:57 GMT, Volodymyr Babchuk <Volodymyr_Babchuk@ep=
am.com> wrote:
>>
>>Hi David,
>>
>>David Woodhouse <dwmw2@infradead.org> writes:
>>> Which PV backends do you care about? We already have net, block and con=
sole converted.
>>
>>Well, this is all what we need, actually. Even console only will be
>>sufficient, as we are using QEMU to provide virtio-pci backends, so both
>>storage and networking should be provided by virtio. Are you proposing
>>to just drop this patch at all? I believe we can live without it, yes.
>
> Yeah, I think you can drop anything that's only needed for the legacy bac=
kends. I'm tempted to make a separate config option to compile those out.

Yep, we need this. Because without the patch ("xen_pvdev: Do not assume
Dom0 when creating a directory") I can't run QEMU in the driver domain:

root@spider-domd:~# qemu-system-aarch64  -machine xenpv -m 128M
xen be core: xs_mkdir device-model/0/backends/vkbd: failed
xen be core: xs_mkdir device-model/0/backends/vkbd: failed
xen be core: xs_mkdir device-model/0/backends/9pfs: failed
xen be core: xs_mkdir device-model/0/backends/9pfs: failed

So yeah, we need something like CONFIG_XEN_LEGACY_BACKENDS option if we
don't want to fix xenstore_mkdir()

--=20
WBR, Volodymyr=

