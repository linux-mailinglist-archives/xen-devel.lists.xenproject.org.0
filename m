Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42DEB7E7C68
	for <lists+xen-devel@lfdr.de>; Fri, 10 Nov 2023 14:12:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.630374.983243 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1RJ9-0001Pk-UI; Fri, 10 Nov 2023 13:12:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 630374.983243; Fri, 10 Nov 2023 13:12:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1RJ9-0001Nc-RG; Fri, 10 Nov 2023 13:12:23 +0000
Received: by outflank-mailman (input) for mailman id 630374;
 Fri, 10 Nov 2023 13:12:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sssJ=GX=epam.com=prvs=567869e99b=mykyta_poturai@srs-se1.protection.inumbo.net>)
 id 1r1R44-0001y0-6z
 for xen-devel@lists.xenproject.org; Fri, 10 Nov 2023 12:56:48 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 984bfa7a-7fc8-11ee-9b0e-b553b5be7939;
 Fri, 10 Nov 2023 13:56:42 +0100 (CET)
Received: from pps.filterd (m0174681.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3AACHnNZ029602; Fri, 10 Nov 2023 12:56:20 GMT
Received: from eur05-am6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2104.outbound.protection.outlook.com [104.47.18.104])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3u93ptjrx7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Nov 2023 12:56:20 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by AS8PR03MB8783.eurprd03.prod.outlook.com
 (2603:10a6:20b:53c::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29; Fri, 10 Nov
 2023 12:56:15 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::f172:7877:386b:8dc0]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::f172:7877:386b:8dc0%6]) with mapi id 15.20.6954.029; Fri, 10 Nov 2023
 12:56:15 +0000
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
X-Inumbo-ID: 984bfa7a-7fc8-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UCL+EFNSQqbN67dLlM/pGAUUzC/hKdX1tkDs/LiNoCHBPIHsozuT+e8wv7PFqoGagBXOAS1PcuP0zXzP4SPUKaBM38Yp/0KY45Pyf06BeXGNqDXjYndlqcXtoMXCvJbGUtnwDzNBkoh74LbnqQxOO9GObmrHw0zxvH7w0vCe7cuQX562z2fWfcU9IMq8prAbhO8ZrZyMWTLjD5BaWNdoY9+NQvDIVgRDn+jWBdpabYuNU05FMHnc+7W7Mf5jCpFYCGBgkF++UEpLJRePLvs1PMtj1mFq51ZqZxp/ho0wG7V+aAu0czEOgH9yVWynrMEJdTiTdAEpogeeZUVDNi7ydA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3w8Xsi4wnPxswAFvPOhXxXIV1tEKsc1WOPhc1i6tJPg=;
 b=b0YDifWYD55gXq+AolwyuZWwmzM4gjQS0KZ7YC0rdRcCPh1+lu+wsDUxJKvYDIG0lEAHMcJ5M53hYo92+TFVR1dHXqWZZfofKqqsVF0N3x9cC82GLIZx+krSLjonAaCE1L4Avqp+t1JywbZ/+S/n7HkL3jRvEPw4wyk7Oq2MpnSYnnYgUb3yewSacNxa7mz13Y1ol7EYCyESL9dC3kAtk/4Y0ycivVaZWFT+bntw1tiN1keXPlmGZVLk08UNbG78mW1/74yB8b4locLp+5WZ1iBaeP8Qs2eN1836Uwfy0boqOLAwquuRoFigFGZLlPpugyEc/o1gr75WKiEZFJlALg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3w8Xsi4wnPxswAFvPOhXxXIV1tEKsc1WOPhc1i6tJPg=;
 b=p9FW215t2LL756+sx+xQ4yVOdQc0jI3r3cyOAQCBMHuq3r2aatw+Ad0pYxCp28VCnSNAPGndq3bOoDeL7yQYIwm5FTutiSq+p9aCqCB6/GCiM4dpVoF79mN18VY1vbj70qV9lL95vrXTBaiSDScouZeU7Stnh7PS6IbkX9VyB4YJMZqe3zua+1QBSSB3LWLB0rmP5i80yJOq7ZAaCjBDaVceZ74sodkfxHQrUWgKF4/wC73k6i9DSvzZr5/JkF4hoxh0esMS05CUwx9H6RVRe+QDF39XHaNCTL5Ws6mWdVURuSzfn+/TxE91wf+6ao7KtoKPIdmQv3xy8Oia05NE7g==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>,
        Stefano Stabellini
	<sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
        Michal Orzel <michal.orzel@amd.com>
Subject: [XEN PATCH v2 00/25] arm: Add GICv3 support to the New VGIC
Thread-Topic: [XEN PATCH v2 00/25] arm: Add GICv3 support to the New VGIC
Thread-Index: AQHaE9VKxM0jrsRdakKdygK99IG2mQ==
Date: Fri, 10 Nov 2023 12:56:15 +0000
Message-ID: <cover.1699618395.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|AS8PR03MB8783:EE_
x-ms-office365-filtering-correlation-id: db82706c-5f83-4dc4-97f6-08dbe1ec6cd7
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 BUf9A5T7M3cL38z9FLddsAI/VSjw1RtIwh5ABjtDYYOup57ldIY5EUHoSZWrjpsSNNUbJxdoVdgsQTzd8BuqPsvjqa52xnTJGLuxWteVdarTbcemkHp/JCqarz4jWrTubjdj7a2xhrpqPZ5I5jT+4+kRQy/InMHX4gPadx2gLSZ0l8PKvWRxo9EJ1a1DQOhfejKUdqUKNX2phZbylDfHifxUtb+wQ218XErq6mVfN+F4UAtzIO390Z7bdZf18Zly/FlHg+p2KX1MqBZlBQQL7PAR6qHUBnH7bhZrndH267m+yIAVPSLFDdzkGt5TwWaEMZm/5tPPn8jdTRZKP9Nz6RIdirbVYS0iedGVVg9xP521RcVHAymhtQvNqEG+6kxhxXt/Hl0ZL009dnv7W7GVFTEQSQeTOz5cEARLhMhCHTIghBFD/k1dxS18Icm/MwXzyOWheby6e2uHDzF2MVsZEwj4kl1KoexXmjuzzd+FhExPXEzqmmNtcM6uciEESShq4UIXmzn/xrK2+dogzgQhk2Ax7EQXnxUFg8c4G0PKA8NH6gzlubNlYNIiytxbQ0NcthRakCIUw0kJEjzrQyencIMgUzZM1c3NZrFibCv3/U+WXFBk59u6OrLdsPhpYLmh
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(39860400002)(346002)(366004)(136003)(230922051799003)(1800799009)(64100799003)(451199024)(186009)(5660300002)(64756008)(66446008)(66556008)(316002)(66476007)(54906003)(91956017)(76116006)(66946007)(2616005)(6916009)(26005)(4326008)(83380400001)(38070700009)(8676002)(8936002)(122000001)(6512007)(2906002)(6506007)(38100700002)(6486002)(478600001)(41300700001)(71200400001)(36756003)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?cstgrKyaPWm8IM48QuD56O2BLYNCOQYEGOpwVNU1CtczeY9v+6aDewf2w6?=
 =?iso-8859-1?Q?cwDXSdSlGiHs39QcJStYDBhxNFnoG26R+K6ZM6xQ70dNmdHD45STNQIy8Y?=
 =?iso-8859-1?Q?JWyiUijtNKeuxhdGv6eJr0NCb9qSVsHhGqrbTJ+RX6H4YuXOW25TTtKaHg?=
 =?iso-8859-1?Q?Lgxl6mMcjcK9lwlH58HqA7I9dxf++aEtwLSTqSCt9BZ34zZ1pUoyLyXLim?=
 =?iso-8859-1?Q?LgDC4Xo0801a7n+uMPJTdKAO5GzKjE+MfuVPn1kLkZbgrsrbynu2+DgS3H?=
 =?iso-8859-1?Q?8gijNs2qx64//kaj2QaS8PurYCbhkkVqfvCtT0AXGIIUmN+B1mvgs798OO?=
 =?iso-8859-1?Q?Iw4KhQUTyRLdtBdOOd8HfMzNrj3HSlCa/Sk9GiuEvifii1J8a+nLMIA3vH?=
 =?iso-8859-1?Q?vA7gKQVVaj/Sy10N4WcVO8pdlisPb7CwdlGpT4h+qbK7h2HtFwZX7RnBED?=
 =?iso-8859-1?Q?mnr+V1DC9nYuxyvt8YOD7qXnWs2MZP45f6p257xxi1U7lrMD3IbIUNYMX1?=
 =?iso-8859-1?Q?g9FmEk0k6VeqL+JDSswNT8DaxmmARA0idenPuGqy+/BYO1FNACah6gsN3c?=
 =?iso-8859-1?Q?/Mq37NF2H7nJRZR9b3SY3cWEy/GnnAeM0WvcmFv58cEfElzVZYXucX1DSm?=
 =?iso-8859-1?Q?Yu8tb2Pz+gnBBnxCmhpBzYTnRETGCoIhzIWftECuLPtDNTEw7wxYo6kUd2?=
 =?iso-8859-1?Q?UBoMhu+N/WueZjODEnc6gPRURBfw8CPI8eNMuMbbpGZtfK8fauAoPdDZDu?=
 =?iso-8859-1?Q?CrVLpJMVWJG+TFCmUyJsdl5EarxJIfBQZMDJBIGxv3UwNPTZTGZd59dHkv?=
 =?iso-8859-1?Q?sgVgPGRMoai7gYHC7QoskEvnlkUviyIsi1PqBbwUYSn6QUqcaUkdaOYA1I?=
 =?iso-8859-1?Q?RcF9KcyhXA/1+4nn8JLtM5PtBxZma4LJuNXl8cBAGVn4Y0McGjumGXADZb?=
 =?iso-8859-1?Q?Fj8QyRyJ965rf3Yz5Fhx5P2GPLU7PXgaH3JVP8OCk5qBMJretUyqAn6vIZ?=
 =?iso-8859-1?Q?7NkdwfTMpUt8n5zJSkBCkhUZNBUMi0TkG8FycoX3wI7ZsaQ+Q5st6azv1x?=
 =?iso-8859-1?Q?S+CSlpxNvXlUeu/bdPGIDw7MN+piR/Tzdkk5NPBtxnxGexdlPzdgtlrt4H?=
 =?iso-8859-1?Q?hHnbYIbDZqDx2h5TnlH0l7/kdFT2SzVy1gH8AbQeULqWe3bCkrJsgqshFA?=
 =?iso-8859-1?Q?l0WEWk4E0VZ64zwXG8JOi5p585hKzdiEndAQnEVz2RHK+qKXp6ZV8mRwPT?=
 =?iso-8859-1?Q?PmgsSKJzRmHMGBAIiNzhz9boAAw9D0dLPO/VRr5gS25H2l6fV47LSNJkhI?=
 =?iso-8859-1?Q?UtY3csxhRyQtbN7V7CjGx8YQNgqWXF5lGvm2uf0bUIRWbH0Jbut0G8ERLO?=
 =?iso-8859-1?Q?Z9uHQmLOZLB81rtNoPJiUiwEnl5nYQn12/B5RMGoGCNNlXLl4t8kmwvmkB?=
 =?iso-8859-1?Q?LdB4EYH/0cQzCqjaESLrgnK0YZcAzBuOCHudtlVfuZBgRvBGQr+HrpTlm9?=
 =?iso-8859-1?Q?gBsAlT7mFf6iX6Bf2ZFno4ZHQmfkUTxv3xZZC9rpAVcpP/K+04xKebUI/F?=
 =?iso-8859-1?Q?O3GmqmWsULXPsA7ZU5Wt7KxODbyQnMQCkNChA58s6sumfBueAcLTmhjY3d?=
 =?iso-8859-1?Q?mhyz0Fv7EZZ5+BZnYDioAM124UiHtBJi5255FrdlLqwFCXJ1a2IwC3tA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db82706c-5f83-4dc4-97f6-08dbe1ec6cd7
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2023 12:56:15.7156
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cJxb0ROnbjyMvzKntES85Y46WoP2TOD3f0Jt/MoZvu05w2xwRInUwhRfQDbW975nYE+53hpgNnbL4uSR5DTZYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB8783
X-Proofpoint-ORIG-GUID: gCn55itlEla0loX-WB_rtcPvKilne7Kc
X-Proofpoint-GUID: gCn55itlEla0loX-WB_rtcPvKilne7Kc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-10_09,2023-11-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 spamscore=0 suspectscore=0 clxscore=1011 impostorscore=0 mlxlogscore=364
 mlxscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311100106

Hi All.

This series aims to add GICv3 support to the New VGIC. It adds support for
the GICv3 distributor, redistributor, sysreg and ITS interfaces. This will
allow Xen to emulate level-triggered interrupts with GICv3 and will make
the NEW_VGIC more complete and usable.

The series also introduces some refactoring of the ITS code to allow for
easier VITS implementation switching.=20


The bulk of the code is taken from the Linux Kernel v6.0 and adapted to the
existing Xen codebase.

Changes in v2:
- Split changes into smaller pieces similar to new VGIC v2 patches
- Refactor some common code to remove ifdefs
- Remove the "move get/put irq" change as it is no longer needed
- Replace GICD base change with proper offset calculation
- Fixed Kconfig dependencies

Mykyta Poturai (25):
  arm: vgic: its: Decouple HW and virtual ITS
  arm: new VGIC: Add GICv3 world switch backend
  arm: new VGIC: Add GICv3 MMIO handling framework
  arm: new VGIC: Add GICv3 CTLR, IIDR, TYPER handlers
  arm: new VGIC: Add GICv3 redistributor IIDR and TYPER handler
  arm: new VGIC: Add GICv3 IDREGS register handler
  arm: new VGIC: Add GICv3 IROUTER register handlers
  arm: new VGIC: Add GICv3 SGI system register trap handler
  arm: new VGIC: vgic_init: implement map_resources
  arm: new VGIC: Add vgic_v3_enable
  arm: new VGIC: Add alternative redist region storage
  arm: new VGIC: Wire new GICv3 into the build system
  arm: new VGIC: Handle ITS related GICv3 redistributor registers
  arm: new VGIC: its: Introduce ITS emulation file with MMIO framework
  arm: new VGIC: its: Introduce ITS device list
  arm: new VGIC: its: Implement basic ITS register handlers
  arm: new VGIC: its: Read initial LPI pending table
  arm: new VGIC: its: Allow updates of LPI configuration table
  arm: new VGIC: its: Add LPI translation cache definition
  arm: new VGIC: its: Implement ITS command queue command handlers
  arm: new VGIC: its: Implement MSI injection in ITS emulation
  arm: new VGIC: its: Implement MMIO-based LPI invalidation
  arm: new VGIC: its: Enable ITS emulation as a virtual MSI controller
  arm: new VGIC: its: Wire new ITS into the build system
  arm: new VGIC: Improve MMIO handling

 xen/arch/arm/Kconfig                   |    5 +-
 xen/arch/arm/gic-v3-its.c              |  208 +--
 xen/arch/arm/gic-v3-lpi.c              |   20 -
 xen/arch/arm/include/asm/gic_v3_defs.h |   13 +-
 xen/arch/arm/include/asm/gic_v3_its.h  |   82 +
 xen/arch/arm/include/asm/new_vgic.h    |   93 +-
 xen/arch/arm/include/asm/vgic.h        |   29 +
 xen/arch/arm/vgic-v3-its.c             |  206 ++-
 xen/arch/arm/vgic/Makefile             |    3 +
 xen/arch/arm/vgic/vgic-init.c          |   24 +-
 xen/arch/arm/vgic/vgic-its.c           | 2022 ++++++++++++++++++++++++
 xen/arch/arm/vgic/vgic-mmio-v3.c       | 1095 +++++++++++++
 xen/arch/arm/vgic/vgic-mmio.c          |   19 +-
 xen/arch/arm/vgic/vgic-mmio.h          |   38 +
 xen/arch/arm/vgic/vgic-v3.c            |  305 ++++
 xen/arch/arm/vgic/vgic.c               |   41 +-
 xen/arch/arm/vgic/vgic.h               |   54 +-
 17 files changed, 4015 insertions(+), 242 deletions(-)
 create mode 100644 xen/arch/arm/vgic/vgic-its.c
 create mode 100644 xen/arch/arm/vgic/vgic-mmio-v3.c
 create mode 100644 xen/arch/arm/vgic/vgic-v3.c

--=20
2.34.1

