Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 215567F552E
	for <lists+xen-devel@lfdr.de>; Thu, 23 Nov 2023 01:12:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.639335.996566 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5xJp-0002g1-BN; Thu, 23 Nov 2023 00:11:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 639335.996566; Thu, 23 Nov 2023 00:11:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5xJp-0002do-89; Thu, 23 Nov 2023 00:11:45 +0000
Received: by outflank-mailman (input) for mailman id 639335;
 Thu, 23 Nov 2023 00:11:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B0YW=HE=epam.com=prvs=5691553e4c=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1r5xJo-0002c8-FP
 for xen-devel@lists.xenproject.org; Thu, 23 Nov 2023 00:11:44 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e14128e8-8994-11ee-98e1-6d05b1d4d9a1;
 Thu, 23 Nov 2023 01:11:43 +0100 (CET)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3AMNDGEx029570; Thu, 23 Nov 2023 00:11:34 GMT
Received: from eur04-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2050.outbound.protection.outlook.com [104.47.14.50])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3uhkuk18s2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Nov 2023 00:11:34 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by AS8PR03MB6903.eurprd03.prod.outlook.com (2603:10a6:20b:299::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.18; Thu, 23 Nov
 2023 00:11:30 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822%6]) with mapi id 15.20.7025.020; Thu, 23 Nov 2023
 00:11:30 +0000
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
X-Inumbo-ID: e14128e8-8994-11ee-98e1-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ac7cqcZRB25QyYZ/jW83mDW82VFOALuLgG2s32sfBMjNo2W6YQG7jnkglQH8nu6t8dlvIaDkeCeVTjVeZnG8Et0jsq2p9Hc4dYmNFTnkKriSJk89C5yOhrFt0/KeE42NgEOa31yMrt0ySNPgLVW2b2UZIFw/GdR3L1wQG7htcUSDkUBw5DXQ6L+lHTnYYAvv/UB+tqih6fuTZnC4vOB7VF3AGDZW6+pUDXaf/dbofKeFFZ0lu4TL+4M01n8u7nbZAtgvao24QB+tw7038jJv/m6RykFx+vRt2em1FumK88nmxLd3vK96iT44ADnK4NGjWqh//T4D/daSZVIIqDOF9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yg5IKdJ3sJaUwvbyO2HX4rr4pZeOo+2XVSWIPetYogQ=;
 b=Y47oKmjG7XXFPQzX0qG74VSQpspebMuCauIfEXHhI7S1klCgh1PrLft1bLzzs6kUzjgLazwBDb+/urVCKfYEyOrprY2lyrMB06P+jPG43BiqgfgsRMwkHRWRJplbW1Qad16GvZz08yRpjm98hIqb7sAIqmwAw3YzBsi11hhWpEcrRLz1p+mO//Kj/qf9dcHxSnlnREK+l4aKY23Xdb5A8kuXPD+mgXEVB3w3Az3m2/+TZ7jHlNLQfropbfP1KVVIegcT+D+uM/2DyDoOfLw1SjxHgCCn82V/XPBmnYDmzTrW9+cEFXx3Ylx5lx70lse678imiHAEMTqkmnceL+SMMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yg5IKdJ3sJaUwvbyO2HX4rr4pZeOo+2XVSWIPetYogQ=;
 b=HxfhAARTsc8/dWHEvRqZ0SZvoegf+v1y3h8sFgZVnZLwNlZNl/hPV6Ds78LFx4lhSI7HVApiOOXi18DIgfHMrOstr7S4BVfn0CJCENkx1wX/L7qR/2nDKLTkcZ5wRWKtW0/kK5eqCZBOmR5lbRivCiRFK8+pHFDgc8KfCfDHEv4KMQ04Yop+Fe2CRwDeQRg5nIC5swA491I2Q0BmG+ZU0wLXwFugyHUGaoxdJj+JNEF2ZSUbPMnNyZHeXvTAUuRV5TNto83i1MvJCeWKod/ggx9Cv/yDm53XIIt6H/3vN2HbACYO+OLHd1fChPeYShXd3uyZy44tIQ5NuQbyGsDcsA==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Vikram Garhwal <vikram.garhwal@amd.com>
CC: Stefano Stabellini <sstabellini@kernel.org>,
        "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>,
        David Woodhouse <dwmw@amazon.co.uk>, Julien Grall
	<julien@xen.org>,
        Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
        Peter
 Maydell <peter.maydell@linaro.org>,
        Anthony Perard
	<anthony.perard@citrix.com>,
        Paul Durrant <paul@xen.org>,
        "open list:ARM TCG
 CPUs" <qemu-arm@nongnu.org>,
        "open list:X86 Xen CPUs"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 6/6] xen_arm: Add virtual PCIe host bridge support
Thread-Topic: [PATCH v2 6/6] xen_arm: Add virtual PCIe host bridge support
Thread-Index: AQHaHMeJqHnam8LJkECFe490J2r1JLCG8AcAgAASMYCAAAZ1AA==
Date: Thu, 23 Nov 2023 00:11:30 +0000
Message-ID: <8734wxz5u6.fsf@epam.com>
References: <20231121221023.419901-1-volodymyr_babchuk@epam.com>
 <20231121221023.419901-7-volodymyr_babchuk@epam.com>
 <alpine.DEB.2.22.394.2311221436430.2053963@ubuntu-linux-20-04-desktop>
 <ZV6SdQZ7ZuN-xZKF@amd.com>
In-Reply-To: <ZV6SdQZ7ZuN-xZKF@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.10.7; emacs 29.1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|AS8PR03MB6903:EE_
x-ms-office365-filtering-correlation-id: 768970b3-d05e-4ab3-f5b0-08dbebb8be57
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 OYJLi3+dQEVdP1CE9bEt0bUphzI23bUohdDnMng2R1y/p3rUt+QppEjHqAJYv0eWFBLd6DIfgOnYf67TweWppoYeQYpCAcoQEPsiMBWDUiOmsf5f5EO/Y1wDT1ynHQhI125jFpBP54cfE1zT/wpNJmMGQmAwzmZyJR6ytwB2/1qIz2sEg7O/BLTM31H5sQxhil5mNMvzvsLT8TzFmcIhLGaAqibO4UdQO3oHCEBO9bW3Jo9zMkgivbHLw1zDADC9AiX6uRJjm4tCTPCy1a7ZXd9V5UB92mY0Y6qnMasuqOTR0ynt9U8YSQFsCGKKrhI/xSkvCwefK1EacmP/jaClBSlMYhT/jZnzG2Q8FVKdtDfUMyVKPK7QK/NcirkA9buwYxgRbmMPxZWCzYTO/tUytbcBUNDR28j6vpChGQftrgPniRJer5Rlx1UdYa+twttqPb8chNlUMFx80wN3p8c5/VNY9lvaSEnQNkmwD3orHqb+PeqQWyK+l0lnSE5+sD2SfxkP6REl8HDUGhQC4v/4SUSJKSA3Mioio6laYPqVKqzWlJBvvj4DNrcUQvT4BZ8l/4i5IpXmcuLDPeo1xLFFF8h1RLLxaB7LIsjp/Zve9f8m0sOxN7CKvuYGFeVZ8PCH
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(376002)(396003)(136003)(366004)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(26005)(2906002)(2616005)(6512007)(6506007)(55236004)(71200400001)(6486002)(4326008)(8676002)(8936002)(7416002)(41300700001)(5660300002)(478600001)(6916009)(316002)(91956017)(66446008)(76116006)(66556008)(64756008)(66946007)(66476007)(86362001)(54906003)(122000001)(38100700002)(36756003)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?2SL2o2OdeXwMh1vvYoPgCvhP6Ak6KmXjDcDQdQmNb354nelrO/rMtxYtzc?=
 =?iso-8859-1?Q?f9DXxVqFk+9KDgMcfEs1+/wNljVNPTn44Og1FIq90aGpTkqS1f/1TCILA8?=
 =?iso-8859-1?Q?hs07zi07uK0StORONB3vub7MDvxc+oezkbrMQHHXHiSbmqe5oVELysseQa?=
 =?iso-8859-1?Q?MXAclwIlJPIYDB2viCZW5pqb/o4TvRBx2y5yA2Yeqz9qsIwT8i6K4Hc2af?=
 =?iso-8859-1?Q?qjFhmq9nidiUnFldSG1xysaW5ESU7NLGyO9/Sm2iIsSoCyJoZOrw6FNueP?=
 =?iso-8859-1?Q?1VxBLCRAeLTryt0CttBOvBWUxDTw8guxeg/JpKophUTyXTiPfu+ubvxbi3?=
 =?iso-8859-1?Q?oMDeJhNqUSI8Z7y/EfcWmYvedmHhYvRWHkAgh5imFiB2tMnFmxMzof8gal?=
 =?iso-8859-1?Q?vcIfcYyqzDok7EMrp7QeQdJ4XdZXRnE6rKoum5VgDMVAMPG11nZzw8oHIR?=
 =?iso-8859-1?Q?3BpTBSsj5uUYnFRMNF9JzKD0W9MteFLHOj5XBjFso9AlbN+pljGPBpvNqs?=
 =?iso-8859-1?Q?2+NpgYic6xpGRpryd91TfdQp80lmJkJim0zbUBjyxcuxpTSc0buWEgmUKa?=
 =?iso-8859-1?Q?Af5tlAycVPahjLL9Dp+Hy3HTXJyyEUPBV94dVjREEmf0DJnNN9WX6A3bgf?=
 =?iso-8859-1?Q?6gQn2TMBjm7byxv9+c043am1GH0gU8bxPrrsgf2qeceE0nt5ioYwANQE4f?=
 =?iso-8859-1?Q?QLDJ+aL3XUxjr84ygb3iT8qqjpPPreHum36Mg7rVu33Wvyjsy9YagYC0xh?=
 =?iso-8859-1?Q?sbOgHC0YFlv0GloRJ6yCwznbnp8Xc2eDcbKFkKdMMDDHm6FtXhtCbOKzMW?=
 =?iso-8859-1?Q?p9ARRl9ZwKD22ISKJ97XH4X0cZJP1xE5fbri4eGSdk2Y95EvRGb1pfyUDD?=
 =?iso-8859-1?Q?hiAnldlPoRTE5hLtpKLfHaAgqZYXZ9VwOD4baKw4EF2kwDfWcNPBjDIhQY?=
 =?iso-8859-1?Q?wQV1ZVVmy2oSbkSl1YkqbxNQz7ym/Eu07i4pbX6Rym7Yf22ncLS8SXQPMd?=
 =?iso-8859-1?Q?H0G/0aNTW+YoXbkvvFOQccOm6bvQCFrPpQi6YYwPZabH77dqL3spi6uyCM?=
 =?iso-8859-1?Q?3/xqRq/LIBiDKqW2NmkSG60vdxdjEhpwcvRI38OZRkC/HKLS/24LBinPAW?=
 =?iso-8859-1?Q?qT/l2hz6PxGoJ/9LGWXBPDLdXMR+hlazb9x4xRkkGj9unNFX5CUB3KYzie?=
 =?iso-8859-1?Q?nQbyNOQcg7Dyifp4L6lVFxT4w5IWbK/v/TOHXZXC+I4LI04MIqKLAjLVi4?=
 =?iso-8859-1?Q?ekhnvZf8Po3n2tUy31bKO1PGyUhF0w9srjYpU4eUtmcmTa8Q65+uvxvBDa?=
 =?iso-8859-1?Q?Ifkcwi2s9z/qlCYJNMNRH2MGGVdUIuRkL1Tb8/hX2etJes4ljDC0HPDaAQ?=
 =?iso-8859-1?Q?DazkP2KZSl7pi1/o99XkiTV6m1eAbno9u1TMnIhP+dF/j+ZbESZFY5GVeR?=
 =?iso-8859-1?Q?7RuuwoVvEdWLzTa5vvM7EIDewQE1JRPMNCqCJDrYvjtZrPHeHvLYXTnWFK?=
 =?iso-8859-1?Q?UwkmhZNfRceazxzI/HJa5FQapvmQo5FedvTb34QshtCxGFuEw9RK7+0qpD?=
 =?iso-8859-1?Q?VXVteUtlhgTgfYp9np/fkAyQTiQBEMI75KfTUNNTkpoStaXg5EyA5nRC2l?=
 =?iso-8859-1?Q?vKIgcB+ct2HkUyKyulby32DU27KSoT33aKlawYYCC6scNvxsgxwwW5Lg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 768970b3-d05e-4ab3-f5b0-08dbebb8be57
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Nov 2023 00:11:30.2397
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hCtX+Emih1Z/rUDP/ecH0b48H3VQfuRpaLmLhx7Xh7ZCZARB+0y4+53qrjUm+RQUDe3/pj8MRqL5bgqSXmaUmFnWZU6jY6LjCxUh+KkohjA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB6903
X-Proofpoint-ORIG-GUID: eeZhu0ymgN_qRLApaL3dPp88H8Xg4Lnj
X-Proofpoint-GUID: eeZhu0ymgN_qRLApaL3dPp88H8Xg4Lnj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-22_18,2023-11-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 clxscore=1015 adultscore=0 mlxscore=0 lowpriorityscore=0
 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311220178


Hi Vikram,

Vikram Garhwal <vikram.garhwal@amd.com> writes:

> Hi Volodymyr,
> Thank you sharing this patch. I have few comments below
> On Wed, Nov 22, 2023 at 02:39:46PM -0800, Stefano Stabellini wrote:
>> +Vikram
>>=20
>> On Tue, 21 Nov 2023, Volodymyr Babchuk wrote:
>> > From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>> >=20
>> > The bridge is needed for virtio-pci support, as QEMU can emulate the
>> > whole bridge with any virtio-pci devices connected to it.
>> >=20
>> > This patch provides a flexible way to configure PCIe brige resources
>> > with xenstore. We made this for several reasons:
>> >=20
>> > - We don't want to clash with vPCI devices, so we need information
>> >   from Xen toolstack on which PCI bus to use.
>> > - The guest memory layout that describes these resources is not stable
>> >   and may vary between guests, so we cannot rely on static resources
>> >   to be always the same for both ends.
>> > - Also the device-models which run in different domains and serve
>> >   virtio-pci devices for the same guest should use different host
>> >   bridge resources for Xen to distinguish. The rule for the guest
>> >   device-tree generation is one PCI host bridge per backend domain.
>> >=20
>> > Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>> > Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
>>=20
>> There is still a discussion ongoing on xen-devel if / how to register a
>> PCI Root Complex or individual BDFs. In the meantime a couple of
>> comments.
>>=20
>> Typically emulated devices are configured in QEMU via QEMU command line
>> parameters, not xenstore. If you are running QEMU in a domU (instead of
>> Dom0) you can always read config parameters from xenstore from a wrapper
>> bash script (using xenstore-read) and then pass the right command line
>> options to QEMU.
>>=20
>> If you need help in adding new QEMU command line options, Vikram (CCed)
>> can help.
>>=20
>>=20
> I agree with Stefano here. Setting properties would be better and easier.

Okay, I'll look at this.

> I have one questions here:
> 1. If there are multiple QEMU backends, which means xen tools will end up
> creating lot of entries in xenstore and we need to remove those xenstore
> entries when backend goes away. Is this already handled in Xen tools?

Well, this is not a classic PV backend, so common code in Xen Tools does
not handle those entries. I am not sure if tools remove entries right
now, because I am not the original author. But we definitely will remove
them in the final version of patches.

--=20
WBR, Volodymyr=

