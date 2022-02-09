Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B644AEF29
	for <lists+xen-devel@lfdr.de>; Wed,  9 Feb 2022 11:21:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.268923.462839 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHk5i-0002Im-3j; Wed, 09 Feb 2022 10:20:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 268923.462839; Wed, 09 Feb 2022 10:20:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHk5h-0002FH-WF; Wed, 09 Feb 2022 10:20:50 +0000
Received: by outflank-mailman (input) for mailman id 268923;
 Wed, 09 Feb 2022 10:20:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4iPq=SY=epam.com=prvs=403937cc0f=oleksii_moisieiev@srs-se1.protection.inumbo.net>)
 id 1nHk5g-0002FB-PT
 for xen-devel@lists.xenproject.org; Wed, 09 Feb 2022 10:20:48 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f17075a5-8991-11ec-8f75-fffcc8bd4f1a;
 Wed, 09 Feb 2022 11:20:46 +0100 (CET)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 219AFSlL027144;
 Wed, 9 Feb 2022 10:20:43 GMT
Received: from eur03-ve1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2051.outbound.protection.outlook.com [104.47.9.51])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3e4bpt00s6-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Feb 2022 10:20:43 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com (2603:10a6:102:ea::23)
 by DB9PR03MB7291.eurprd03.prod.outlook.com (2603:10a6:10:221::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Wed, 9 Feb
 2022 10:20:38 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::c1c:f98:9dd:86e0]) by PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::c1c:f98:9dd:86e0%6]) with mapi id 15.20.4975.011; Wed, 9 Feb 2022
 10:20:38 +0000
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
X-Inumbo-ID: f17075a5-8991-11ec-8f75-fffcc8bd4f1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WyPVVPfboBBS6PjiiOO4JxbmvtIuUPLonLHglvMtJqCW1U0Hp4kLMpXm1cvok7p258O1GA1gEQc4bLhs2luYVhY4A5UqyyJzMiEurYlRPIgBDgYTQowfLK/csUfR9ZSsKDkZSDrBCZ2xUpeWlycbmFekAB0RVSMTFCHuXHtEG6CK+h3ItCE47Fjpl986yq0Xrv9HflxZJzuBR0R5PI5QXDQ8JhJ/iNkpGqjvwoMZzWcZQjeJIg46KWypP0NGid/zuzv6/0DHJUlHheGN4vWZqm3AznJN7mL6qLtnoezb53l6TYWV9N1noWYTVF9w+GcyQ8h1QF0kO+Q0IOKPCdoYiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zgXPjBiGwaJIK/z8yCxnzELuL+zHuRsre0yutMwKAlw=;
 b=Nh/Fv2jUtHu8kCUArV6jWqm6sAdc7gLDfdubKdsquOOeC7L929FjxefjYjyaGJeo/EqnjBClA1IOKhXSIixZrc6XU6ijtKL8fiUwbmj292EoN7bNEzvX9fuezpSwTThPf2PpmuZ8Pza86nxXKC/gwxIjALMVyiAW+LDMh1/hc+r0CnqJ+BxOHI2rvXDH0QC1GOs8Vb9NIrpn9KAtvEGoS1Y7a3vZRs3kcwnG2uBKsUT9Wd+Jpo62XhXR2L4DFCxsMjbWzGonrH57fEca9IuaUM/l5jcUuM0Uje9S64JxdlDDJs6Y4yVTyCrNEfsgtJZxS6MYy/W2TxSoLulMgUZ9mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zgXPjBiGwaJIK/z8yCxnzELuL+zHuRsre0yutMwKAlw=;
 b=rSqdyA0iVnTJ+49LQKFog4qGwq4IkfWbYHlyJ8F/ES7yys6Z5W0j5RJqXpWT5/zuMWxmPC8uNI4K0q4F8E276V5skybHf1TDJ/gN7u+GaZTYFkkPtyyIAfPtwWjjqfZ59gNdPR1GGVAyh2nftsUOASj0zQvr3R/kiyCEWYGgzHijokPnH1QN8k2+FkHDr3t17FeTQInBPcomNN6nQ00WeewsC1NGZWfwjVWqGTHnnXeFcHeUtqIKzvMDSJJWF2YVLF0cYLCveDRkqjrrkBobjxc0XQQpDcsbzqN3TQrFGCXorIlpCT7OaetmdKf4ZUQn5K0DdFITUUSXaWyV3TLM7A==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Stefano
 Stabellini <sstabellini@kernel.org>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Juergen Gross <jgross@suse.com>
Subject: Re: [RFC v2 3/8] xen/arm: Export host device-tree to hypfs
Thread-Topic: [RFC v2 3/8] xen/arm: Export host device-tree to hypfs
Thread-Index: AQHYHRW1S717SraA0Ui+K6wc2/TNAKyJ+LkAgAEKd4A=
Date: Wed, 9 Feb 2022 10:20:38 +0000
Message-ID: <20220209102037.GA1025795@EPUAKYIW015D>
References: <cover.1644341635.git.oleksii_moisieiev@epam.com>
 <e440e4f16a506ecc87078635dbb3fda2ebd45346.1644341635.git.oleksii_moisieiev@epam.com>
 <b88f6a50-6e9e-5679-8d25-89e26031e88e@xen.org>
In-Reply-To: <b88f6a50-6e9e-5679-8d25-89e26031e88e@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4eaed1fa-9802-4c6c-cf40-08d9ebb5d19b
x-ms-traffictypediagnostic: DB9PR03MB7291:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <DB9PR03MB729144C9F0984380F7901913E32E9@DB9PR03MB7291.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 X5TR0JoT4kXD5iSuktPwRwvEbxGqqWLX3iuVvvmceIOXjpo09hu5ARCM+hVmuPnLlOh9bHIrInJuw5fusotH1igN7BDPpG0TV/BYQD4XIoscHIvAA3HfJLuako4gH5eHidkHd77HCSm7+9UPNqrKuscbnIRWaXwUhgtzVqwomj4XXnCJpIY5bB+oIFhEzT7Ut0LCvy3LJi/keYaI/DoD9GdLDuLOE6VFh9Le5+nf7oovjQgJlXyaid7wtoaFajYRiBvOLE2eHkuCDY2CmIwn4cSsJHejjIlVOlK9AwOUsX6t4WtG/4JGy7KbA4uS0p6pX/adCNorpsYx6iTdCZ+/SBHBEbBFpVoid9/9XSQjXMnbYPAeSyiiFU8ArwPiUVVcH+S9nh07Eb03KZGPMQUCvugSmVC25qvAotniYjRVVHwaaLiWehAohmjWIOwRwROg1amgh2MDrimV+Rwqcv5FGIuwIbmsSGqhXBiN/w61NMOHfGydIMntTWPpNLodNe/HeYbkpGrUkJEiXo6ovlQZjef5ZMxqE677VM1KwZq9q0YieAH1G+Oz3WU+EVgVVHV+mI1Xepo50YCBTbkiVpcSD/O/IwQvjQFJKmdfxFYsLgwASAFgfhh8feRrC1lA2DtiwXCtetRIdOtS9+79JeR5hM2ErQHqhh0taSc9jWtZJHVQWvJG00UHHDXIKmBDjcjZuxNp1hJXRAl4TsKUb+wSes7Oix1Dy3bwjECdqPleY08=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR03MB7136.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(508600001)(122000001)(316002)(6916009)(76116006)(38100700002)(9686003)(26005)(33716001)(83380400001)(5660300002)(33656002)(6486002)(86362001)(8936002)(8676002)(54906003)(66946007)(38070700005)(66476007)(66446008)(66556008)(4326008)(2906002)(64756008)(53546011)(186003)(91956017)(1076003)(71200400001)(6506007)(6512007)(2004002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?VNIpnouWfwNrzM6V2SiXBfd0kGofx5lRSem6IpfZIOMXXoRI13lVcNwgZLHp?=
 =?us-ascii?Q?ZXAnexZJmBubNoUG+cdNxIQBCoyVPkFcPRORrRKl77WJtIXrbf8qaIviHabs?=
 =?us-ascii?Q?vdOdYnBrswlpoU+7XCfScVduHXlxXOVC26DCZXcvbV+BG+QGcBhuTh8po12e?=
 =?us-ascii?Q?x+n8ouRuetGvbpWY9SvU1Eh23g6WE9DmvndGkH/Wq9gr3iNN2Ucr2NfXAhzn?=
 =?us-ascii?Q?ytgYMaeRDQs9y8grUCuIRC3LDvL8OjwfILnxzBK/CoWU+7c0RrqyvyA8wiHh?=
 =?us-ascii?Q?niiWd5+rlWmg1V5O+A9wd7P+VN+LGUSV021nHCRNmNKGmHZ1aMrLRE3wee6J?=
 =?us-ascii?Q?J9q87TeuRL1o8amQU/xLMpKHVRV6YHkgGZyO2CjP7JDkAR5kon7gc6pl/aEL?=
 =?us-ascii?Q?Ri3n5Bscq8VaiLzrO8nN6s3QejyP2Y/sMPf3Z2bUCDWQ0oXnF7iJIoVaWH7h?=
 =?us-ascii?Q?3Y7SLj8794NkVB4e6dow8+TVAGbkFYOxb1Bj90F3Xsuo08k/2ifO3bzD5b68?=
 =?us-ascii?Q?tF1MTlN8EeXsqeWlSUKWd9CdMGv/GhXz0k0s/4redCsDJPgnrQUkg9Ktr+pM?=
 =?us-ascii?Q?i1dm27pLfOWRksqJAn0an55BRCiXP6f9JnuhVkY2YvaToGKJmvceFZQnrsr8?=
 =?us-ascii?Q?sNmgrgKuiNZgZ3+1hZuYBWLeUE0IfD1qT8iDksgWXBGazZDxspwlRWfAVLd8?=
 =?us-ascii?Q?mOE89ywyrVXP7Ga4JGdLlgsdJZFgNN9zoJWLWOX0jVAOhF7jw/UbZi3UaF9c?=
 =?us-ascii?Q?dNzCpILWN00AqJFnAgik7i9hZrGveGKzesJQnffcvNzj6Fhn+DY9Xdf7gA8M?=
 =?us-ascii?Q?xaPPepIE3WnvOKO+StfUf1kmcFU/LSxniLDdzRakSfuMecAOiMl9K4B2Jo7M?=
 =?us-ascii?Q?OoVjA+vY1zxdnb229GY/tnQMKYB8fJ8riXaOo6meRuraa26rIpkTAm0+c1Ua?=
 =?us-ascii?Q?NZYQeOfQ77C7iA/uKqWq4rvYhMyuRYYsa82Euc5sfDr7NTpwU9ywLCgMStbS?=
 =?us-ascii?Q?R0rJDe3r5g6uRmSYsPl6LzcJSkouFRtMK20sip1ocK8JSdHdaZRBXKJHiYNZ?=
 =?us-ascii?Q?HAIhseZTK9JI3PAMIYCMdsDumwj01Cw6dwGdmuFNbglX/t0Ow4XOLjWmbOfX?=
 =?us-ascii?Q?qeWj+hZiSuc37khEtYQSDNmW28a3An1p1MUInczhZM6C05vxqtwrvFiL/45P?=
 =?us-ascii?Q?pyn2wkRud9TsrnJguPiEnwKoV0UnAcEMlQIZWfTcmHpOJaXmhAxyLfnGyt/x?=
 =?us-ascii?Q?jEWl9Z4CpWnFZ1JLPj88NzZVWyQa9sUF9t5lqCcqct0qanG22MUHvk5JfblA?=
 =?us-ascii?Q?R8r3J2f+bA2srR0aDVrPIVk9ttcJ1k3NGk3zfusdeWBhF5/K8ySIXoD/Zo3Z?=
 =?us-ascii?Q?KvUBZEDgvQC2rFE2+GyPSf21OicH4fj+d2idqDDMSZ+H2QfXCZ3Jghf3KC+v?=
 =?us-ascii?Q?Fc3F5FmlMTAxOEDmTNdETQ+ESA2rOngxCAsaEhXnRRQ63/5429Z8jPITcgar?=
 =?us-ascii?Q?e0vhVDipTpsYIOwR5EKMcfNG45OOmxOUAH2KG3GAfFa1Ej7/5THXA/TMd96r?=
 =?us-ascii?Q?EyugxK398R2PRQM5Ba9XPKSE/3DN1xJuNgdfQNL1oGEbpT8jhxQX/Fblpv+T?=
 =?us-ascii?Q?lbp/6ejmjJPRX66sMsUxKVaQZ0MkZm2sgMXXTPM/xbhSvPRCxzRvolZtqLEv?=
 =?us-ascii?Q?I22342I0P6EnqGr1LPjpGlDObvE=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <8906586B46A06B4083F14DA312E54ADE@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR03MB7136.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4eaed1fa-9802-4c6c-cf40-08d9ebb5d19b
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Feb 2022 10:20:38.7111
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6Y1VDkxZUtgpgSz04YagkSZZQUNF9ic5zETg2QXL3C66USD6xKj9O1m3aWoygyLZGP+uqeH62MptOD+ddoTkEnQwPhiBKHmn5jbTNMHLeko=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB7291
X-Proofpoint-GUID: FvRuTa8PDYmRXcljWbsyNsBHCpFDsb0G
X-Proofpoint-ORIG-GUID: FvRuTa8PDYmRXcljWbsyNsBHCpFDsb0G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-09_05,2022-02-09_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 impostorscore=0 spamscore=0 adultscore=0 clxscore=1015
 mlxscore=0 priorityscore=1501 bulkscore=0 phishscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202090066

Hi Julien,

On Tue, Feb 08, 2022 at 06:26:54PM +0000, Julien Grall wrote:
> Hi Oleksii,
>=20
> On 08/02/2022 18:00, Oleksii Moisieiev wrote:
> > If enabled, host device-tree will be exported to hypfs and can be
> > accessed through /devicetree path.
> > Exported device-tree has the same format, as the device-tree
> > exported to the sysfs by the Linux kernel.
> > This is useful when XEN toolstack needs an access to the host device-tr=
ee.
> >=20
> > Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> > ---
> >   xen/arch/arm/Kconfig           |   8 +
> >   xen/arch/arm/Makefile          |   1 +
> >   xen/arch/arm/host_dtb_export.c | 307 ++++++++++++++++++++++++++++++++=
+
>=20
> There is nothing specific in this file. So can this be moved in common/?

You're right. I will move it to common.

>=20
> >   3 files changed, 316 insertions(+)
> >   create mode 100644 xen/arch/arm/host_dtb_export.c
> >=20
> > diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> > index ecfa6822e4..895016b21e 100644
> > --- a/xen/arch/arm/Kconfig
> > +++ b/xen/arch/arm/Kconfig
> > @@ -33,6 +33,14 @@ config ACPI
> >   	  Advanced Configuration and Power Interface (ACPI) support for Xen =
is
> >   	  an alternative to device tree on ARM64.
> > +config HOST_DTB_EXPORT
> > +	bool "Export host device tree to hypfs if enabled"
> > +	depends on ARM && HYPFS && !ACPI
>=20
> A Xen built with ACPI enabled will still be able to boot on a host using
> Device-Tree. So I don't think should depend on ACPI.
>=20
> Also, I think this should depend on HAS_DEVICE_TREE rather than ARM.

I agree. Thank you.

>=20
> > +	---help---
> > +
> > +	  Export host device-tree to hypfs so toolstack can have an access fo=
r the
> > +	  host device tree from Dom0. If you unsure say N.
> > +
> >   config GICV3
> >   	bool "GICv3 driver"
> >   	depends on ARM_64 && !NEW_VGIC
> > diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
> > index 07f634508e..0a41f68f8c 100644
> > --- a/xen/arch/arm/Makefile
> > +++ b/xen/arch/arm/Makefile
> > @@ -8,6 +8,7 @@ obj-y +=3D platforms/
> >   endif
> >   obj-$(CONFIG_TEE) +=3D tee/
> >   obj-$(CONFIG_HAS_VPCI) +=3D vpci.o
> > +obj-$(CONFIG_HOST_DTB_EXPORT) +=3D host_dtb_export.o
> >   obj-$(CONFIG_HAS_ALTERNATIVE) +=3D alternative.o
> >   obj-y +=3D bootfdt.init.o
> > diff --git a/xen/arch/arm/host_dtb_export.c b/xen/arch/arm/host_dtb_exp=
ort.c
> > new file mode 100644
> > index 0000000000..794395683c
> > --- /dev/null
> > +++ b/xen/arch/arm/host_dtb_export.c
>=20
> This is mostly hypfs related. So CCing Juergen for his input on the code.

Thank you.

>=20
> > @@ -0,0 +1,307 @@
> > +/*
> > + * xen/arch/arm/host_dtb_export.c
> > + *
> > + * Export host device-tree to the hypfs so toolstack can access
> > + * host device-tree from Dom0
> > + *
> > + * Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> > + * Copyright (C) 2021, EPAM Systems.
> > + *
> > + * This program is free software; you can redistribute it and/or modif=
y
> > + * it under the terms of the GNU General Public License as published b=
y
> > + * the Free Software Foundation; either version 2 of the License, or
> > + * (at your option) any later version.
> > + *
> > + * This program is distributed in the hope that it will be useful,
> > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > + * GNU General Public License for more details.
> > + */
> > +
> > +#include <xen/device_tree.h>
> > +#include <xen/err.h>
> > +#include <xen/guest_access.h>
> > +#include <xen/hypfs.h>
> > +#include <xen/init.h>
> > +
> > +#define HOST_DT_DIR "devicetree"
> > +
> > +static int host_dt_dir_read(const struct hypfs_entry *entry,
> > +                            XEN_GUEST_HANDLE_PARAM(void) uaddr);
> > +static unsigned int host_dt_dir_getsize(const struct hypfs_entry *entr=
y);
> > +
> > +static const struct hypfs_entry *host_dt_dir_enter(
> > +    const struct hypfs_entry *entry);
> > +static void host_dt_dir_exit(const struct hypfs_entry *entry);
> > +
> > +static struct hypfs_entry *host_dt_dir_findentry(
> > +    const struct hypfs_entry_dir *dir, const char *name, unsigned int =
name_len);
>=20
> This is new code. So can you please make sure to avoid forward declaratio=
n
> by re-ordering the code.
>=20

I can't avoid forward declaration here because all those functions
should be passed as callbacks for node template dt_dir. And dt_dir is
used in read and findentry functions.

>=20
> [...]
>=20
> > +static char *get_root_from_path(const char *path, char *name)
> > +{
> > +    const char *nm =3D strchr(path, '/');
> > +    if ( !nm )
> > +        nm =3D path + strlen(path);
> > +    else
> > +    {
> > +        if ( !*nm )
> > +            nm--;
> > +    }
> > +
> > +    return memcpy(name, path, nm - path);
>=20
> What does guaranteee that name will be big enough for the new value?

I will refactor that.

>=20
> > +}
> > +
> > +static int host_dt_dir_read(const struct hypfs_entry *entry,
> > +                            XEN_GUEST_HANDLE_PARAM(void) uaddr)
> > +{
> > +    int ret =3D 0;
> > +    struct dt_device_node *node;
> > +    struct dt_device_node *child;
>=20
> The hypfs should not modify the device-tree. So can this be const?

That's a good point.
Unfortunatelly child can't be const because it is going to be passed to
data->data pointer, but node can be const I think. In any case I will go
through the file and see where const for the device_node can be set.

>=20
> > +    const struct dt_property *prop;
> > +    struct hypfs_dyndir_id *data;
> > +
> > +    data =3D hypfs_get_dyndata();
> > +    if ( !data )
> > +        return -EINVAL;
>=20
> [...]
>=20
> > +static struct hypfs_entry *host_dt_dir_findentry(
> > +    const struct hypfs_entry_dir *dir, const char *name, unsigned int =
name_len)
> > +{
> > +    struct dt_device_node *node;
> > +    char root_name[HYPFS_DYNDIR_ID_NAMELEN];
> > +    struct dt_device_node *child;
> > +    struct hypfs_dyndir_id *data;
> > +    struct dt_property *prop;
> > +
> > +    data =3D hypfs_get_dyndata();
> > +    if ( !data )
> > +        return ERR_PTR(-EINVAL);
> > +
> > +    node =3D data->data;
> > +    if ( !node )
> > +        return ERR_PTR(-EINVAL);
> > +
> > +    memset(root_name, 0, sizeof(root_name));
> > +    get_root_from_path(name, root_name);
> > +
> > +    for ( child =3D node->child; child !=3D NULL; child =3D child->sib=
ling )
> > +    {
> > +        if ( strcmp(get_name_from_path(child->full_name), root_name) =
=3D=3D 0 )
> > +            return hypfs_gen_dyndir_entry(&dt_dir.e,
> > +                                  get_name_from_path(child->full_name)=
, child);
> > +    }
> > +
> > +    dt_for_each_property_node( node, prop )
> > +    {
> > +
> > +        if ( dt_property_name_is_equal(prop, root_name) )
> > +            return hypfs_gen_dyndir_entry(&dt_prop.e, prop->name, prop=
);
> > +    }
> > +
> > +    return ERR_PTR(-ENOENT);
>=20
> [...]
>=20
> > +static HYPFS_DIR_INIT_FUNC(host_dt_dir, HOST_DT_DIR, &host_dt_dir_func=
s);
> > +
> > +static int __init host_dtb_export_init(void)
> > +{
> > +    ASSERT(dt_host && (dt_host->sibling =3D=3D NULL));
>=20
> dt_host can be NULL when booting on ACPI platform. So I think this wants =
to
> be turned to a normal check and return directly.
>=20

I will replace if with
if ( !acpi_disabled )
    return -ENODEV;

> Also could you explain why you need to check dt_host->sibling?
>=20

This is my way to check if dt_host points to the top of the device-tree.
In any case I will replace it with !acpi_disabled as I mentioned
earlier.

Best regards,
Oleksii=

