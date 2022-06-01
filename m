Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F29F53A007
	for <lists+xen-devel@lfdr.de>; Wed,  1 Jun 2022 11:05:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.340337.565351 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwKHf-000074-46; Wed, 01 Jun 2022 09:04:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 340337.565351; Wed, 01 Jun 2022 09:04:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwKHe-000053-Vk; Wed, 01 Jun 2022 09:04:54 +0000
Received: by outflank-mailman (input) for mailman id 340337;
 Wed, 01 Jun 2022 09:04:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qdo/=WI=epam.com=prvs=8151ed00d6=oleksii_moisieiev@srs-se1.protection.inumbo.net>)
 id 1nwKHd-00004v-Dy
 for xen-devel@lists.xenproject.org; Wed, 01 Jun 2022 09:04:53 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e439799f-e189-11ec-bd2c-47488cf2e6aa;
 Wed, 01 Jun 2022 11:04:51 +0200 (CEST)
Received: from pps.filterd (m0174682.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2518PCPc015107;
 Wed, 1 Jun 2022 09:04:39 GMT
Received: from eur03-ve1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2057.outbound.protection.outlook.com [104.47.9.57])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3ge4k8r4yg-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Jun 2022 09:04:39 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com (2603:10a6:102:ea::23)
 by DB7PR03MB4970.eurprd03.prod.outlook.com (2603:10a6:10:7c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Wed, 1 Jun
 2022 09:04:35 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::31b5:dfd5:2d38:c0b2]) by PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::31b5:dfd5:2d38:c0b2%9]) with mapi id 15.20.5314.012; Wed, 1 Jun 2022
 09:04:35 +0000
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
X-Inumbo-ID: e439799f-e189-11ec-bd2c-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TmsHQLJO7V2Svpj9+yx/nFs1XzrUQ6D5egy+K+2Py4H67PcfIisVHOe7OSdqONjLYMhMGDx7bYCYdrj4KmB06gPIFv+QcsyLSYBUDIBOVHRfDIAQV4OO0RnlyBEVLpBtD/yn1kmcspztdqe/1wrADEMyAbh7yH08psoJ/2qbE3RiVSrNRSlivXs/zYs2EtUnSd6fwbcaF3xsppWSioAw9cqLuqZPJJJYFGqKZszFY9i+XFI4lWoBkdThYjDM3Ngw/o9YTewe5p5W1b/8LHGo5HVgsr4tQYYOvd5gcC1IvebcxZ+gZvH1vv6GqZyodSe9eOcU32Ilx2skpGmQr4No8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FJGi0jDrsdDVUTUEv+r1p4LlW3UjXyOGb5PcbVcR0pw=;
 b=PZSI866UMfDLuy7DQSZgZMOKpLcsXBpYaW6qFpVGUyG7IqQkAesX+kdunrPP7I6b+SDewKl7lkfVMH3MaP9qA/SdKOU3NwLv6lRXtPA/4KBUK7+mqbX+9yyDVDmWRA4Z/tPJhxPIxs7ordZIBwqAwVEqY5NJXqS8km8GZuzMSggcUaMlCQ+++PKRfDkgWjUKLOSks8APy1Ly+Rpqx/oBL1gJSYh/DHrJ0F7TYmTtsqryEfPDfNEE7RNMWyei5+9aAfKRqHv0KsATpqUTA16jM6+FQaD1MFPSXDeXEOQCEfJ/jYdJpTX6D6r5avvKerw+AmpYW3bzNvmr4bt1lDgOXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FJGi0jDrsdDVUTUEv+r1p4LlW3UjXyOGb5PcbVcR0pw=;
 b=Mfdpqcw4g84HyleYO1kbNDWAUqR9yZ5Hsh5av/IlqjIla9zgCzyIQTCBqwpBeK2PnM8iXfnKG1GaEM8XfEpqZGSuBnvbYDRBdFtQGXXGzMMwFsfcxKOdqOSc48SPtuGJhfGILtMoidVGNfGVF0esK6vutKzV0qZxDvjmzqVTSU/4YUwXwCPC/7G2OtIc03FelAzk5ElWzBf6pJ7KsvqLs/HYArMUZIvlypeVzvJR0tmtTGxiK0hf5UaLDrqEdMv/CQnJ10K2xi+8SiSrEz7DFE8DiEd8MF1Pp6q2LrO4zltMjicSq7fDqvv+rXIGx3RANco+ZmlxKW22IGGm48f7iw==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Peng
 Fan <peng.fan@nxp.com>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Stefano
 Stabellini <sstabellini@kernel.org>
Subject: Re: [Xen-devel] SMMU permission fault on Dom0 when init vpu_decoder
Thread-Topic: [Xen-devel] SMMU permission fault on Dom0 when init vpu_decoder
Thread-Index: AQHYdDjfc3Z/1SeAUE+eDUzXC1OEPa03j+IAgAK05QA=
Date: Wed, 1 Jun 2022 09:04:35 +0000
Message-ID: <20220601090434.GA3644565@EPUAKYIW015D>
References: <20220530152102.GA883104@EPUAKYIW015D>
 <da899c6a-a9ec-fa25-75ef-6f375dfd422a@xen.org>
In-Reply-To: <da899c6a-a9ec-fa25-75ef-6f375dfd422a@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1f22742d-ea74-421c-b8a1-08da43adc017
x-ms-traffictypediagnostic: DB7PR03MB4970:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <DB7PR03MB49701D92F5230210AB01A59FE3DF9@DB7PR03MB4970.eurprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 gd+CQknD1ZeYplYRfeYiBfq21emIjYkwhUvPBgH0aujna49OBZPuiTChFwShQQEi7KIf8i2mAPlt3nx0IRicWT0af1pewOMVmhneXqLDkpStv7ykigKPVQ/P7K3/ZmX+Wozy8fhuRvew2ki9zJtuULMwAvuwjxpzc3oZBsqSU5YB96mmNldTyczkJ59uxS0Rl9UJtnpho/QU8rnVqK66rbKgjnJUit6TWOUJ1/eEhDlUuGYSpDDskU3KeVknPLMyQozK3m6SJkd0V+N19rDNmFPbEL6lpb+rdQVka+a2X2xyainoCnpmQ5Xr/Xk4AeDBtv5J+bF5zUt569LqVFQL5QB57EUgtvHqiqJihaExGkrJb8+BYp+zJdeyP0uV+3mZKINptMnP7wVmlwgCtMewPowzvAWN3E9JFPjM8gGm4e4x8ULjA9+mUVwj+Secf7cD79WNDFjiBUzroH4jieAzbfdcFVXG7nZoBC3+PgzyixC39oxvYnRLS416fA4QLRNlkAa4aubDoS43AsSiXiWaD18RiwsgIZuwSwaBFQpyDAQJoldtRNlpZjSAQrQz8Lt3f5+fgiTyV/E9hzZkrBhxFDlvxwEZ86rKq9lT91ZLDAIe8KHLiz/EidRNkn+2CkisPHSjFHIM1bakYfkV/7STcrkpVFeZZm28TlWPPd21BwA/1Rq/Mhu0tH9vTUXACNqCczOVLuX+HbkbTDTKr/SweszQn/4MxOWRrMtxEgysnO6pX4pF6IdoujTX7L9lNaYMAiGyWI2z7qy0GKIM0sC4OE08bhU7Q34vUxZPc6dwK1o=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR03MB7136.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(966005)(6486002)(71200400001)(6512007)(508600001)(9686003)(53546011)(26005)(38100700002)(6506007)(38070700005)(122000001)(1076003)(8936002)(83380400001)(316002)(76116006)(66946007)(91956017)(66476007)(66446008)(64756008)(4326008)(8676002)(66556008)(5660300002)(2906002)(33656002)(86362001)(6916009)(54906003)(33716001)(186003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?1mONyPVLxLNQrb21RT1fRF1Ipy1p4noZ7uo2u/dpZxv2oTUHpodslt8fSI6/?=
 =?us-ascii?Q?Na/kaoFCOGxfk9IiQoqa3/C2BiAAYif2VhNLZQxJ6Tc4KfjlZgteOqgVdSCf?=
 =?us-ascii?Q?TgojLr4QBTJhoUZHKDD8AH8+meOfd0ftv/iC0x6bcAjonw0jViqaRPmn8tf+?=
 =?us-ascii?Q?i+mfDmkllvNMdXZYTt8yhrdXX/bYAOQhvTXEv480a8u4S25POdsihlyPni3a?=
 =?us-ascii?Q?NJZT/1ZBNpOl9ftmKqH1vBani/Yd7n/Y6pvN0ZlyvENg4WhMZyf5491I04/6?=
 =?us-ascii?Q?rMvWo5o+8SGDOKW77FjTaGJzkugVnKkaJzwEJrzR1pvxvhHvMMtUwhHPi33f?=
 =?us-ascii?Q?tw4bVjlZY95PsZQnzvioeKPPxYfyWcVKSv4RWJhdlbw3jA7HBtgXfefvHlvE?=
 =?us-ascii?Q?f+U6Gab+GLDgHYR20HEsxbvlkRITs0c+1/c2z47Fanxg+4xVPlPDqqFzjxi3?=
 =?us-ascii?Q?2rY629BoUz64IlXfsCqASjEzVoHzKIw6zg+cfdf7hnFG8XMKnUJ+woJU+eR+?=
 =?us-ascii?Q?J0OIoNnoJeKjgP8TIjXZRA728Q9ExCxumt0klILhPdYomWxczuBILNDm/KEX?=
 =?us-ascii?Q?KqwUpIYx7DAjbLXf0Ez8lHFZq1p4TAcXvTtR6UDgRiF7hhJecJgbVEEtGE7d?=
 =?us-ascii?Q?vdYeNgXQ1yJUVPdY+Lk21qOXF9OXJA/lX2yya63OPSNHp6EJHD63vcMUpcEm?=
 =?us-ascii?Q?3l2l3Ndlc5wAHD8Ol8inC9BG+C9I+Qb8i2jjx+GAof1CmI6jNyckSvgFax5z?=
 =?us-ascii?Q?0oOouHfMm873kCGLEDaCCNPn5v0VgJARDkYertrjqSFuyGg4M4+R8h38x+vk?=
 =?us-ascii?Q?PmjTBSLXOopMByN14V4r/adMK8C7K+us+MnWrIPjKPBrzjxQ+T4nuB+zNPTQ?=
 =?us-ascii?Q?qlwVzUewY09LQ3N1HU19tFcSHnupzso3N2fGtD5ep3rku+cax+KcyAYKtuYP?=
 =?us-ascii?Q?R9VjsglCWb0bZRWCJi5mrA5dvbypFLmhkGM2nAQOyblkDbOGuxaN7Ot+ZfZz?=
 =?us-ascii?Q?7qZEXhilAtEoSHYX25m2/xPIm5aRaDJPLZdOPmzy1caralla4UVvwX3sH4cb?=
 =?us-ascii?Q?eOzrV9s/rHKPYyjYu5BPoy7lXvT39ZummICNyS17TOfFdjkS263L+6b+Yf5i?=
 =?us-ascii?Q?c81CGEpFlwEQjrhf7jpJZdNHIKKgEqE84zjqXPES4tQlj2NMZkvsOmbD1s6T?=
 =?us-ascii?Q?YBsaT9ZVTSMj7D9YpvT3+eV8+KlGro9ZC+e1si2PMXOKq8/SSy6gUlD+NyQb?=
 =?us-ascii?Q?Mny3Lge9WRb4kZPxDmDV0Gtdi8Yc3Xs6387mzTvy/yCgyPjmWsAS/ni/RUpf?=
 =?us-ascii?Q?tCl+Sm4dR4K4cs0ZiU+FAG3hMIpgKStP7zQ9mDaZEQxfNSIb0dlsyadpyKQE?=
 =?us-ascii?Q?jpdm4IXNHl2KSy/2SWEt1rBRNbhgcDu3H1cYD0xHUpcNFbhjxPIY7kCylFsE?=
 =?us-ascii?Q?JXVdQdYobUoAycl2fwKCCDVDCn6GMZIVDYw2TBADyRpslvAKsnVOWZrDMVMk?=
 =?us-ascii?Q?71wnGG/RBJ0H1+T9wgrm8ATuWKjSe0JTAknNgMsKBCCttHnD9cUjsmMKeOAW?=
 =?us-ascii?Q?OHnlv+tyhTVNPLw0eKSrKzJyl33Fay/IJKJy9m/jkfXnReAaZw2FpLkscgEt?=
 =?us-ascii?Q?qvPxdMMcLercDhLfWZrvIHslX9lxcjzG9W17I7vOHkCSBlrrwapxP8+95Q8K?=
 =?us-ascii?Q?xdXOTV7FbqVcBQI/7zGZ1H4WVF5xXw4AYJM+jnARmgiNdAbjOgeUCb0OIXmb?=
 =?us-ascii?Q?/ngzoEYGolv28eQTlxxC1lXTaLAn6BhGX4WsptS7Qk41Yo/SiPx+?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <398587978E43FF4AA8E68A6215483E7E@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR03MB7136.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f22742d-ea74-421c-b8a1-08da43adc017
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jun 2022 09:04:35.7373
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yV9/kpHzN5yp4dewoi1hQqZufDJ2B1urVeeFTQu50dihDxdXjp+e1CnPEm6urAyzalo9yWlrOBG+33VabfBngGkkd/ZFJTpheTy3YA0sYhg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR03MB4970
X-Proofpoint-GUID: IpR9jMS1cLM2tFdMEt78zFkjUti7gFAK
X-Proofpoint-ORIG-GUID: IpR9jMS1cLM2tFdMEt78zFkjUti7gFAK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-01_03,2022-05-30_03,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 priorityscore=1501 adultscore=0 mlxlogscore=999 clxscore=1015 spamscore=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2206010041

On Mon, May 30, 2022 at 04:44:36PM +0100, Julien Grall wrote:
Hi Julien,

> (+ Stefano)
>=20
> On 30/05/2022 16:21, Oleksii Moisieiev wrote:
> > Hello,
>=20
> Hi Oleksii,
>=20
> > I'm getting permission fault from SMMU when trying to init VPU_Encoder/=
Decoder
> > in Dom0 on IMX8QM board:
> > (XEN) smmu: /iommu@51400000: Unhandled context fault: fsr=3D0x408, iova=
=3D0x86000a60, fsynr=3D0x1c0062, cb=3D0
> > This error appears when vpu_encoder/decoder tries to memcpy firmware im=
age to
> > 0x86000000 address, which is defined in reserved-memory node in xen dev=
ice-tree
> > as encoder_boot/decoder_boot region.
>=20
> It is not clear to me who is executing the memcpy(). Is it the device or
> your domain? If the former, where was the instruction fetch from?
>=20
> The reason I am asking that is, from what you wrote, mempcy() will write =
to
> 0x86000000. So the write should not result to a instruction abort. Only a=
n
> instruction fetch would lead to such abort.

My configuration is the following:=20
In Dom0 I have vpu_decoder, operated by vpu_malone driver.
During initialization, in function vpu_firmware_download it requests
firmware and put it to decoder_boot memory using memcpy. Then waiting
for the interrupt from the device. Looks like, device decoder tries to
execute something from this memory.

>=20
> >=20
> > I'm using xen from branch xen-project/staging-4.16 + imx related patche=
s, which were
> > taken from https://urldefense.com/v3/__https://source.codeaurora.org/ex=
ternal/imx/imx-xen__;!!GF_29dbcQIUBPA!xy4tOkXLiMzvC0wg_Me93zTZ4sZBZ7dq_-zkw=
YSaJvqt5vNVEOa-mV7Li2crSK3OBTQFb396tUDElwtpiw$ [source[.]codeaurora[.]org].
> >=20
> > After some investigation I found that this issue was fixed by Peng Fan =
in
> > commit: 46b3dd3718144ca6ac2c12a3b106e57fb7156554 (Hash from codeaurora)=
, but only for
> > the Guest domains.
> > It introduces new p2m_type p2m_mmio_direct_nc_x, which differs from
> > p2m_mmio_direct_nc by XN =3D 0. This type is set to the reserved memory=
 region in
> > map_mmio_regions function.
> >=20
> > I was able to fix issue in Dom0 by setting p2m_mmio_direct_nc_x type fo=
r the
> > reserved memory in map_regions_p2mt, which is used to map memory during=
 Dom0 creation.
> > Patch can be found below.
> >=20
> > Based on initial discussions on IRC channel - XN bit did the trick beca=
use looks
> > like vpu decoder is executing some code from this memory.
>=20
> This was a surprise to me that device could also execute memory. From the
> SMMU spec, this looks a legit things. Before relaxing the type, I would l=
ike
> to confirm this is what's happenning in your case.
>=20
> [...]
>=20
> > ---
> > arm: Set p2m_type to p2m_mmio_direct_nc_x for reserved memory
> > regions
> >=20
> > This is the enhancement of the 46b3dd3718144ca6ac2c12a3b106e57fb7156554=
.
> > Those patch introduces p2m_mmio_direct_nc_x p2m type which sets the
> > e->p2m.xn =3D 0 for the reserved-memory, such as vpu encoder/decoder.
> >=20
> > Set p2m_mmio_direct_nc_x in map_regions_p2mt for reserved-memory the
> > same way it does in map_mmio_regions. This change is for the case
> > when vpu encoder/decoder works in DomO and not passed-through to the
> > Guest Domains.
> >=20
> > Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> > ---
> >   xen/arch/arm/p2m.c | 7 +++++++
> >   1 file changed, 7 insertions(+)
> >=20
> > diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
> > index e9568dab88..bb1f681b71 100644
> > --- a/xen/arch/arm/p2m.c
> > +++ b/xen/arch/arm/p2m.c
> > @@ -1333,6 +1333,13 @@ int map_regions_p2mt(struct domain *d,
> >                        mfn_t mfn,
> >                        p2m_type_t p2mt)
> >   {
> > +    if (((long)gfn_x(gfn) >=3D (GUEST_RAM0_BASE >> PAGE_SHIFT)) &&
> > +        (((long)gfn_x(gfn) + nr) <=3D
> > +        ((GUEST_RAM0_BASE + GUEST_RAM0_SIZE)>> PAGE_SHIFT)))
>=20
> I am afraid I don't understand what this check is for. In a normal setup,=
 we
> don't know where the reserved regions are mapped. Only the caller may kno=
w
> that.
>=20
> For dom0, this decision could be taken in map_range_to_domain(). For the
> domU, we would need to let the toolstack to chose the memory attribute.
> Stefano attempted to do that a few years ago (see [1]). Maybe we should
> revive it?
>=20
> > +    {
> > +        p2m_remove_mapping(d, gfn, nr, mfn);
> > +        return p2m_insert_mapping(d, gfn, nr, mfn, p2m_mmio_direct_nc_=
x);
> > +    }
> >       return p2m_insert_mapping(d, gfn, nr, mfn, p2mt);
> >   }
>=20
> Cheers,
>=20
> [1] https://urldefense.com/v3/__https://lore.kernel.org/xen-devel/alpine.=
DEB.2.10.1902261501020.20689@sstabellini-ThinkPad-X260/__;!!GF_29dbcQIUBPA!=
xy4tOkXLiMzvC0wg_Me93zTZ4sZBZ7dq_-zkwYSaJvqt5vNVEOa-mV7Li2crSK3OBTQFb396tUB=
ARsu3hw$
> [lore[.]kernel[.]org]
>=20
> --=20
> Julien Gral=

