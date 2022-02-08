Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 362994AE042
	for <lists+xen-devel@lfdr.de>; Tue,  8 Feb 2022 19:01:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.268497.462396 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHUmw-0007cC-86; Tue, 08 Feb 2022 18:00:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 268497.462396; Tue, 08 Feb 2022 18:00:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHUmw-0007Xg-1q; Tue, 08 Feb 2022 18:00:26 +0000
Received: by outflank-mailman (input) for mailman id 268497;
 Tue, 08 Feb 2022 18:00:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TsJg=SX=epam.com=prvs=40387f30b1=oleksii_moisieiev@srs-se1.protection.inumbo.net>)
 id 1nHUmt-00068L-Uq
 for xen-devel@lists.xenproject.org; Tue, 08 Feb 2022 18:00:24 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fb07cd74-8908-11ec-8eb8-a37418f5ba1a;
 Tue, 08 Feb 2022 19:00:21 +0100 (CET)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 218EgrT8015757;
 Tue, 8 Feb 2022 18:00:17 GMT
Received: from eur02-he1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2057.outbound.protection.outlook.com [104.47.5.57])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3e3t5xrs6q-7
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Feb 2022 18:00:16 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com (2603:10a6:102:ea::23)
 by VE1PR03MB5613.eurprd03.prod.outlook.com (2603:10a6:803:12a::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.19; Tue, 8 Feb
 2022 18:00:09 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::c1c:f98:9dd:86e0]) by PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::c1c:f98:9dd:86e0%6]) with mapi id 15.20.4951.019; Tue, 8 Feb 2022
 18:00:09 +0000
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
X-Inumbo-ID: fb07cd74-8908-11ec-8eb8-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mY+RaWVddAkBShMK2W/v2hY4BXTUyA7H5kj+8oORo432vKYFcOFXIA8npCiDdWiKWDXEkkmyEvQTiD+q2DF3rFED0OTA7pQewOKDDy0/kuflsNwMezKsvLhxD9OUwQSwR/nJEgdUDgaB5iMolp4jIWm/VsL9SufaYm91b/kjp3pe8ZgnJTgggHgGO6k2J4ia5DfBqwCnSFHL444BV5Sr/JVT9H6BNVSJ0dalb5pQ2eUwzCofUjKMkFtf0QSOTb/M5q6wgprDYI/hxZcjx0xoEMekKK2bJY89ytjZ2//3uUpg5Z3omI7d+CFayreG1MMuyR72zXFVSUkaVT8t87n3qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FDKbwCjLZ0DanLs0acIscY6UBZ+tUS318cgSdULOaTg=;
 b=FhC4vSwd/EHlw2WOgLDGBVWKU+o/GodGP5omeA/sR57/LrY4MbJsKNgcgonyzMGdVBa20hgnGe7hHOg4On01ZVpOQlFKVhkpthzI1LpA4SvvEPqnC8ohTWkeYbOSHNRwXI9K6Y1zorSR0waI2TSMBq5iu2IjPNmvr7KAAbQRVkEjRGhvXfTOKQATec6BH+GT8z72KPwWohfhXSj/EH6tA+s+CITgppFH/Dtt5HqKVmXaTaX2ElNKjlYa8bIsGDjYeZHfVOjgkTN/X3SoxLQStmgefmJj6aGyTTY2BMtnbIZqsrzz7FwFV+qU4HfBDhK7xsdsvLOevd2AS8meXKx7ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FDKbwCjLZ0DanLs0acIscY6UBZ+tUS318cgSdULOaTg=;
 b=rFaqhDGBTGz4gKZ4MhsIX+kLwWEk+26jQSFZU03NjW34KeTzNt8ztxbuA78xADTTnk2MpcvGi2Rk6RIMR8PJ+us8NAtQpYTz7LbqCK0M7XZI5u+wtJJ08GxSaBX4F9F7k2i09jsqrmIBy3pxph1EbC1Z7j539/u25OpzhLjWQgYNhvNfwMsbM2eC8CPFn9vDqeGYTBVTpQZGg94fOvaI3hNIHJndSphh/iY27ePZ93gg8yMUGk+/fv8X8bgPhFnNetf1EfBODF1Ta0V38n/clzxEALZN9zrds1U42aSVN3ZK1mXhV2yMTfHMFSNRh2M+tumXgwBWtlnmW5qaMgX1mA==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>,
        Andrew Cooper
	<andrew.cooper3@citrix.com>,
        George Dunlap <george.dunlap@citrix.com>,
        Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
        Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Bertrand Marquis <bertrand.marquis@arm.com>
Subject: [RFC v2 4/8] xen/arm: add generic SCI mediator framework
Thread-Topic: [RFC v2 4/8] xen/arm: add generic SCI mediator framework
Thread-Index: AQHYHRW2uVlYW22dYk+LMpDDmAXomw==
Date: Tue, 8 Feb 2022 18:00:09 +0000
Message-ID: 
 <83ecc9060352952bad547ad42c335ee979bf53c3.1644341635.git.oleksii_moisieiev@epam.com>
References: <cover.1644341635.git.oleksii_moisieiev@epam.com>
In-Reply-To: <cover.1644341635.git.oleksii_moisieiev@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1001ae67-d63f-437f-d2b7-08d9eb2cd8ba
x-ms-traffictypediagnostic: VE1PR03MB5613:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <VE1PR03MB56137DC792574F9FB79B292EE32D9@VE1PR03MB5613.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 GySFz62y0pVP20BKAldSaWT1FG+Kvk6Yc3QdhUZf7v6cVXTnKJ2cXMq1Nwj7/6Y2XPRorMHhEvDAE1m3iLRmnewtczBxD0vmRtgCZP34hSUm6jXvNLL9SOQQEdbc0mhCfnDHzclXkwnc+WxGuHbtetkZJmqoRTEaqGm9rBGNE2wP1KWgq91AOHbDHocX46rgtSvdyLjbDNX2+REyicV7gKD9q0OEMwyUxQduvNIvrOA2mzGqlRAhCoFU6XTXyvrjXq+oZUQUX70Vmtgf6b+QohRJ6o8XslBWcuehz8NpQeP/1udZ2VXlbKycn1r73bN+NPboJH7UVWp9Zb45nVtJD2ipfa0agtwkwv40R2ejDXZBOxGD6WizbXzOiOn5e+RwW40BixkcbjKYXBRcNj/VXEj1QCXzo9US07CgYvuRHewkNqvlNTGQLmte6nrjbm8hDt6tVZaHzn/W/+Bte89wG2YajlqvZmokrDvEg6NvYbTsvsptRuQKNm1KXUq/Mt6SWbYJFKj2EM/HoqHtiDRDDhBP/IEROlgFiUMEamf9xUoXu96KbO94FTL2BMhgEITTNOw7irpYrP8wpY7PEbZQLuMi0X4DWfcYQuOj8Fe/zePYdxJ849qnvarN/x/Llm9wTYldqH16hz72v0jjB880oXxONhDnjQFtFT1ruDbhSAf9fLGRPLi19Pm+MqywZDEklb4srA6F7GRsUz2OI2hu/OS5T7C3GC2cwk0KdcLq7eOIR8i9jcPRe+levxRtU011uZ6DrLisoEc2e8b3zeiFZa55jsMOxD2Jr2e4fOy4Tqs=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR03MB7136.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38070700005)(71200400001)(6486002)(508600001)(66476007)(64756008)(86362001)(66556008)(316002)(122000001)(6916009)(6506007)(2616005)(5660300002)(6512007)(4326008)(83380400001)(54906003)(30864003)(2906002)(26005)(186003)(8676002)(76116006)(38100700002)(66446008)(66946007)(8936002)(36756003)(91956017)(41533002)(2004002)(21314003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?L2WYFMsGfGar/YWPAkdWTw/gWc9uUoGI7y+Fs2AeVK3Df9Jc2pHx3MKwSr?=
 =?iso-8859-1?Q?aFIfwrjW/BJUTK+MNMDWcchQ2xP324ATL3+qazqPYLa3W/swfHJ6R3APlN?=
 =?iso-8859-1?Q?LMsRfRtvWme3uzWOCl5ULXVPMMDntaf4MYv3NdLftHJoWzEqfFLIB/KOZX?=
 =?iso-8859-1?Q?D5jKkf5QEXzewOgWvp8X+I44gcgNnAa7tAAlc47Y+FXZb0xQ/3w34QAj6C?=
 =?iso-8859-1?Q?4/R9F4gDPPr7a8L/w5pFvrDm0saMI0JBdQaZkWA+e9CKJysYOaj7SSLXsl?=
 =?iso-8859-1?Q?UvmV6hlHahK8zIsG2o+gzVy9zUDn38hIEZe23cFU5Mg0SFL2jbgKVYtF6t?=
 =?iso-8859-1?Q?6payt0NL3rUjrotra+eNiGR7qK5gJJI8eqg20bsQJMgQGuYEN16fdW9Pan?=
 =?iso-8859-1?Q?404UGUeYeShUyq0tz3ekHfpcongyoPUrlbhnj2n/hyjxtl7C4aCr5nnuU4?=
 =?iso-8859-1?Q?o9f90258Bo9I7C0Apgkff+NeNBdNreRglEPCIxmJB+fZsqa97rbzTSPt2V?=
 =?iso-8859-1?Q?doqqJY3ln1vnenivgeSpbr3QxgMRsSEafTHYUbynfEajVuO0FGHVSNzc+w?=
 =?iso-8859-1?Q?GLMtGJmy6RRb3Rmo/nTf1FsWo7JL4JqM/AS3Tk/o6pOYmlTLc3ColwFts4?=
 =?iso-8859-1?Q?By5k5tQyS599F4Ogs5oXbxgAyMH5ws92Qw7bhBHgTA0V1i/Xz/bVMam2SJ?=
 =?iso-8859-1?Q?wwyAJnoSWiQcztjNjGU9OzZIaKo+z/24rFHfF183T8e27EefKmTPnI9K2H?=
 =?iso-8859-1?Q?gwqvQ2mlx/lm7JJMnz3rA0yNtLxCw+Xqso5mtzgyPkZw1Y0Xf5ZidURayH?=
 =?iso-8859-1?Q?IzKUOpjkYxxESLirCcziv08K/eLBc50Ak8tLRgB4cCeV4JuYIVHi067q3c?=
 =?iso-8859-1?Q?ZJvikyrANj2HGVqtoQtmWAe2QFhy698kh/SKxBOhHSkA9YJ+DtRLMJ0pmM?=
 =?iso-8859-1?Q?+PIUldOIdawwysCZtFogeaaqZx7DO/hJ+Jt+uiQc4gi6Ox8QE93oBKm2Oy?=
 =?iso-8859-1?Q?BXY7ls/iq9dbVNjZgFkU1m3R/P0E+hEWI0oNN3FdJgroCXGelxGvTLm6XX?=
 =?iso-8859-1?Q?BJ+/L1r8ku2WppU86tQqbkmkN0w4DkrO5nrOLLxRM5un5/fR9EtJvQLkg0?=
 =?iso-8859-1?Q?pJS9YtpHVI2AzEhyvBkjX8QWqAnbAxXc6bPNTFUEEOpgPZkjaOcNG35FJ6?=
 =?iso-8859-1?Q?qbMVq4Eon+PoKLppMrxNUsOZ6de/ChvEJ7lH+WG9NQkfJ8Hg+6IsYKuaUg?=
 =?iso-8859-1?Q?iehs7NP8djwNbbdSzr2qWc9s2B/zsW7AYu8Zb6hKsAFR1lkdmY5VsyQdvS?=
 =?iso-8859-1?Q?9BjW01H5kNU31yiTX+FW4ojDtBsykDqmt+rZPrAW0oC8aTL/mGwKkVSva8?=
 =?iso-8859-1?Q?oYkvsPMX5t95nAkKEDp+1/rVV2xfvyU8HCIVKjs5YaW3ZByvk4qntJ8tKu?=
 =?iso-8859-1?Q?va+TDUw3Z8MuhIGjkJBqfTflIItoKo3g8xKCcSm+xoIk6wzWHupP678loE?=
 =?iso-8859-1?Q?0eDi6aMZXkvJRqPw5zhePlt2vmos0Q6Jr7k95SyYOxIaNizIB6udmNl55U?=
 =?iso-8859-1?Q?zF6BtRWP5uzjnlB1mAqoN4rj02ktrjrtICbJtPJcV/2ER+QLzQv6Vdlium?=
 =?iso-8859-1?Q?8luUn18PFV5M4LcfTv5XMJ8Cqak41bVaFaadoBH5/tQSmNnauT+8E32YKF?=
 =?iso-8859-1?Q?DnZeUp9QIMkb0WbIt9yfKIs+fmcLapPmerNe/RU65F1valgnih+OSol4Yj?=
 =?iso-8859-1?Q?AHe29gtmVKWhNhwfPwo2g/cg8=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR03MB7136.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1001ae67-d63f-437f-d2b7-08d9eb2cd8ba
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2022 18:00:09.5908
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Fvz0XaV4ZZ14C1yQBR08IJaqI0CoZ4i2HYY2Zt52ID3ARkWDmS8hUoXsdyY5kj6QjLE/F7n0V0wegxhE6BwhO7QQiLQlxC9sSYElKgUGOtg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR03MB5613
X-Proofpoint-GUID: cA5HE8dSeDrbPlw6Q8YLP4RcCfN2Sp5M
X-Proofpoint-ORIG-GUID: cA5HE8dSeDrbPlw6Q8YLP4RcCfN2Sp5M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-08_06,2022-02-07_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 adultscore=0
 suspectscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 mlxlogscore=999 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2201110000 definitions=main-2202080106

This patch adds the basic framework for SCI mediator.
SCI is System Control Interface, which is designed to redirect
requests from the Domains to Firmware. This will allow the devices,
passed-through to the different Domains, to access to the System Controls
(such as clocks/resets etc) by sending requests to the firmware.
Xen mediates requests between the Domains and the Firmware, also it is
responsible for permission handling during Domain crateion.

SCI mediator register itself with REGISTER_SCI_MEDIATOR() macro.

At run-time, during initialization, framework calls probe for the first
matching device in the device-tree. When no device-tree is present - the
first registered mediator should be probed.

Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
---
 MAINTAINERS                   |   6 ++
 xen/arch/arm/Kconfig          |   9 ++
 xen/arch/arm/Makefile         |   1 +
 xen/arch/arm/domain.c         |  22 +++++
 xen/arch/arm/domain_build.c   |  11 +++
 xen/arch/arm/sci/Makefile     |   2 +
 xen/arch/arm/sci/sci.c        | 152 +++++++++++++++++++++++++++++++
 xen/arch/arm/setup.c          |   1 +
 xen/arch/arm/vsmc.c           |   5 +-
 xen/arch/arm/xen.lds.S        |   7 ++
 xen/include/asm-arm/domain.h  |   4 +
 xen/include/asm-arm/sci/sci.h | 162 ++++++++++++++++++++++++++++++++++
 xen/include/public/arch-arm.h |  15 ++++
 13 files changed, 396 insertions(+), 1 deletion(-)
 create mode 100644 xen/arch/arm/sci/Makefile
 create mode 100644 xen/arch/arm/sci/sci.c
 create mode 100644 xen/include/asm-arm/sci/sci.h

diff --git a/MAINTAINERS b/MAINTAINERS
index e43dc0edce..5f96ea35ba 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -512,6 +512,12 @@ S:	Supported
 F:	xen/arch/arm/tee/
 F:	xen/include/asm-arm/tee
=20
+SCI MEDIATORS
+M:	Oleksii Moisieiev <oleksii_moisieiev@epam.com>
+S:	Supported
+F:	xen/arch/arm/sci
+F:	xen/include/asm-arm/sci
+
 TOOLSTACK
 M:	Wei Liu <wl@xen.org>
 S:	Supported
diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 895016b21e..ab07833582 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -114,6 +114,15 @@ config TEE
=20
 source "arch/arm/tee/Kconfig"
=20
+config ARM_SCI
+	bool "Enable ARM_SCI mediators support"
+	depends on ARM
+	default n
+	help
+	  This option enables generic ARM_SCI (System Control Interface) mediator=
s
+	  support. It allows guests to control system resourcess via one of
+	  ARM_SCI mediators implemented in XEN.
+
 endmenu
=20
 menu "ARM errata workaround via the alternative framework"
diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index 0a41f68f8c..f071d912aa 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -8,6 +8,7 @@ obj-y +=3D platforms/
 endif
 obj-$(CONFIG_TEE) +=3D tee/
 obj-$(CONFIG_HAS_VPCI) +=3D vpci.o
+obj-$(CONFIG_ARM_SCI) +=3D sci/
 obj-$(CONFIG_HOST_DTB_EXPORT) +=3D host_dtb_export.o
=20
 obj-$(CONFIG_HAS_ALTERNATIVE) +=3D alternative.o
diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 96e1b23550..607ea8c3a8 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -34,6 +34,7 @@
 #include <asm/platform.h>
 #include <asm/procinfo.h>
 #include <asm/regs.h>
+#include <asm/sci/sci.h>
 #include <asm/tee/tee.h>
 #include <asm/vfp.h>
 #include <asm/vgic.h>
@@ -688,6 +689,13 @@ int arch_sanitise_domain_config(struct xen_domctl_crea=
tedomain *config)
         return -EINVAL;
     }
=20
+    if ( config->arch.arm_sci_type !=3D XEN_DOMCTL_CONFIG_ARM_SCI_NONE &&
+         config->arch.arm_sci_type !=3D sci_get_type() )
+    {
+        dprintk(XENLOG_INFO, "Unsupported ARM_SCI type\n");
+        return -EINVAL;
+    }
+
     return 0;
 }
=20
@@ -764,6 +772,13 @@ int arch_domain_create(struct domain *d,
         /* At this stage vgic_reserve_virq should never fail */
         if ( !vgic_reserve_virq(d, GUEST_EVTCHN_PPI) )
             BUG();
+
+        if ( config->arch.arm_sci_type !=3D XEN_DOMCTL_CONFIG_ARM_SCI_NONE=
 )
+        {
+            if ( (rc =3D sci_domain_init(d, config->arch.arm_sci_type,
+                                       &config->arch)) !=3D 0)
+                goto fail;
+        }
     }
=20
     /*
@@ -796,6 +811,7 @@ void arch_domain_destroy(struct domain *d)
     domain_vgic_free(d);
     domain_vuart_free(d);
     free_xenheap_page(d->shared_info);
+    sci_domain_destroy(d);
 #ifdef CONFIG_ACPI
     free_xenheap_pages(d->arch.efi_acpi_table,
                        get_order_from_bytes(d->arch.efi_acpi_len));
@@ -996,6 +1012,7 @@ enum {
     PROG_xen,
     PROG_page,
     PROG_mapping,
+    PROG_sci,
     PROG_done,
 };
=20
@@ -1056,6 +1073,11 @@ int domain_relinquish_resources(struct domain *d)
         if ( ret )
             return ret;
=20
+    PROGRESS(sci):
+        ret =3D sci_relinquish_resources(d);
+        if ( ret )
+            return ret;
+
     PROGRESS(done):
         break;
=20
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index d02bacbcd1..05afd3e8e7 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -22,6 +22,7 @@
 #include <asm/kernel.h>
 #include <asm/setup.h>
 #include <asm/tee/tee.h>
+#include <asm/sci/sci.h>
 #include <asm/platform.h>
 #include <asm/psci.h>
 #include <asm/setup.h>
@@ -1894,6 +1895,10 @@ static int __init handle_device(struct domain *d, st=
ruct dt_device_node *dev,
                 return res;
             }
         }
+
+        res =3D sci_add_dt_device(d, dev);
+        if ( res < 0 )
+            return res;
     }
=20
     res =3D handle_device_interrupts(d, dev, need_mapping);
@@ -3075,6 +3080,10 @@ static int __init construct_dom0(struct domain *d)
     if ( rc < 0 )
         return rc;
=20
+    rc =3D sci_domain_init(d, sci_get_type(), NULL);
+    if ( rc < 0 )
+        return rc;
+
     if ( acpi_disabled )
         rc =3D prepare_dtb_hwdom(d, &kinfo);
     else
@@ -3109,6 +3118,8 @@ void __init create_dom0(void)
     dom0_cfg.arch.tee_type =3D tee_get_type();
     dom0_cfg.max_vcpus =3D dom0_max_vcpus();
=20
+    dom0_cfg.arch.arm_sci_type =3D sci_get_type();
+
     if ( iommu_enabled )
         dom0_cfg.flags |=3D XEN_DOMCTL_CDF_iommu;
=20
diff --git a/xen/arch/arm/sci/Makefile b/xen/arch/arm/sci/Makefile
new file mode 100644
index 0000000000..67f2611872
--- /dev/null
+++ b/xen/arch/arm/sci/Makefile
@@ -0,0 +1,2 @@
+obj-y +=3D sci.o
+obj-$(CONFIG_SCMI_SMC) +=3D scmi_smc.o
diff --git a/xen/arch/arm/sci/sci.c b/xen/arch/arm/sci/sci.c
new file mode 100644
index 0000000000..05c948a071
--- /dev/null
+++ b/xen/arch/arm/sci/sci.c
@@ -0,0 +1,152 @@
+/*
+ * xen/arch/arm/sci/sci.c
+ *
+ * Generic part of SCI mediator driver
+ *
+ * Oleksii Moisieiev <oleksii_moisieiev@epam.com>
+ * Copyright (C) 2021, EPAM Systems.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#include <xen/acpi.h>
+#include <xen/errno.h>
+#include <xen/init.h>
+#include <xen/sched.h>
+#include <xen/types.h>
+
+#include <asm/sci/sci.h>
+
+extern const struct sci_mediator_desc _sscimediator[], _escimediator[];
+static const struct sci_mediator_desc __read_mostly *cur_mediator;
+
+bool sci_handle_call(struct domain *d, void *args)
+{
+    if ( unlikely(!cur_mediator) )
+        return false;
+
+    return cur_mediator->ops->handle_call(d, args);
+}
+
+int sci_domain_init(struct domain *d, uint16_t sci_type,
+                    struct xen_arch_domainconfig *config)
+{
+    if ( sci_type =3D=3D XEN_DOMCTL_CONFIG_ARM_SCI_NONE )
+        return 0;
+
+    if ( !cur_mediator )
+        return -ENODEV;
+
+    if ( cur_mediator->sci_type !=3D sci_type )
+        return -EINVAL;
+
+    return cur_mediator->ops->domain_init(d, config);
+}
+
+void sci_domain_destroy(struct domain *d)
+{
+    if ( !cur_mediator )
+        return;
+
+    cur_mediator->ops->domain_destroy(d);
+}
+
+int sci_relinquish_resources(struct domain *d)
+{
+    if ( !cur_mediator )
+        return 0;
+
+    return cur_mediator->ops->relinquish_resources(d);
+}
+
+
+int sci_add_dt_device(struct domain *d, struct dt_device_node *dev)
+{
+    if ( !cur_mediator )
+        return 0;
+
+    return cur_mediator->ops->add_dt_device(d, dev);
+}
+
+uint16_t sci_get_type(void)
+{
+    if ( !cur_mediator )
+        return XEN_DOMCTL_CONFIG_ARM_SCI_NONE;
+
+    return cur_mediator->sci_type;
+}
+
+int sci_do_domctl(
+    struct xen_domctl *domctl, struct domain *d,
+    XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
+{
+    int rc =3D -EINVAL;
+    struct dt_device_node *dev;
+
+    switch ( domctl->cmd )
+    {
+    case XEN_DOMCTL_assign_device:
+        if ( domctl->u.assign_device.dev !=3D XEN_DOMCTL_DEV_DT )
+            break;
+
+        rc =3D dt_find_node_by_gpath(domctl->u.assign_device.u.dt.path,
+                               domctl->u.assign_device.u.dt.size,
+                               &dev);
+        if ( rc )
+            return rc;
+
+        rc =3D sci_add_dt_device(d, dev);
+
+        break;
+    default:
+        rc =3D -ENOSYS;
+        break;
+    }
+
+    return rc;
+}
+
+static int __init sci_init(void)
+{
+    const struct sci_mediator_desc *desc;
+    struct dt_device_node *dt =3D NULL;
+
+
+    for ( desc =3D _sscimediator; desc !=3D _escimediator; desc++ )
+    {
+        if ( acpi_disabled )
+        {
+            dt =3D dt_find_matching_node(dt_host, desc->dt_match);
+            if ( !dt )
+                continue;
+        }
+
+        if ( desc->ops->probe(dt) )
+        {
+            printk(XENLOG_INFO "Using SCI mediator for %s\n", desc->name);
+            cur_mediator =3D desc;
+            return 0;
+        }
+    }
+
+    return 0;
+}
+
+__initcall(sci_init);
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index d5d0792ed4..201de01411 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -50,6 +50,7 @@
 #include <asm/cpufeature.h>
 #include <asm/platform.h>
 #include <asm/procinfo.h>
+#include <asm/sci/sci.h>
 #include <asm/setup.h>
 #include <xsm/xsm.h>
 #include <asm/acpi.h>
diff --git a/xen/arch/arm/vsmc.c b/xen/arch/arm/vsmc.c
index a36db15fff..c68482fbd8 100644
--- a/xen/arch/arm/vsmc.c
+++ b/xen/arch/arm/vsmc.c
@@ -22,6 +22,7 @@
 #include <asm/cpufeature.h>
 #include <asm/monitor.h>
 #include <asm/regs.h>
+#include <asm/sci/sci.h>
 #include <asm/smccc.h>
 #include <asm/tee/tee.h>
 #include <asm/traps.h>
@@ -275,7 +276,9 @@ static bool vsmccc_handle_call(struct cpu_user_regs *re=
gs)
             handled =3D handle_sssc(regs);
             break;
         case ARM_SMCCC_OWNER_SIP:
-            handled =3D platform_smc(regs);
+            handled =3D sci_handle_call(current->domain, regs);
+            if ( !handled )
+                handled =3D platform_smc(regs);
             break;
         case ARM_SMCCC_OWNER_TRUSTED_APP ... ARM_SMCCC_OWNER_TRUSTED_APP_E=
ND:
         case ARM_SMCCC_OWNER_TRUSTED_OS ... ARM_SMCCC_OWNER_TRUSTED_OS_END=
:
diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
index 08016948ab..3683f4821f 100644
--- a/xen/arch/arm/xen.lds.S
+++ b/xen/arch/arm/xen.lds.S
@@ -142,6 +142,13 @@ SECTIONS
       _eteemediator =3D .;
   } :text
=20
+  . =3D ALIGN(8);
+  .scimediator.info : {
+      _sscimediator =3D .;
+      *(.scimediator.info)
+      _escimediator =3D .;
+  } :text
+
   . =3D ALIGN(PAGE_SIZE);             /* Init code and data */
   __init_begin =3D .;
   .init.text : {
diff --git a/xen/include/asm-arm/domain.h b/xen/include/asm-arm/domain.h
index 9b3647587a..11c8db8db1 100644
--- a/xen/include/asm-arm/domain.h
+++ b/xen/include/asm-arm/domain.h
@@ -89,6 +89,10 @@ struct arch_domain
 #ifdef CONFIG_TEE
     void *tee;
 #endif
+
+#ifdef CONFIG_ARM_SCI
+    void *sci;
+#endif
 }  __cacheline_aligned;
=20
 struct arch_vcpu
diff --git a/xen/include/asm-arm/sci/sci.h b/xen/include/asm-arm/sci/sci.h
new file mode 100644
index 0000000000..075e11bc16
--- /dev/null
+++ b/xen/include/asm-arm/sci/sci.h
@@ -0,0 +1,162 @@
+/*
+ * xen/include/asm-arm/sci/sci.h
+ *
+ * Generic part of the SCI (System Control Interface) subsystem.
+ *
+ * Oleksii Moisieiev <oleksii_moisieiev@epam.com>
+ * Copyright (C) 2021, EPAM Systems.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#ifndef __ASM_ARM_SCI_H
+#define __ASM_ARM_SCI_H
+
+#include <xen/lib.h>
+#include <xen/types.h>
+#include <xen/device_tree.h>
+#include <public/domctl.h>
+
+#ifdef CONFIG_ARM_SCI
+
+struct sci_mediator_ops {
+
+    /*
+     * Probe for SCI. Should return true if SCI found and
+     * mediator is initialized.
+     */
+    bool (*probe)(struct dt_device_node *scmi_node);
+
+    /*
+     * Called during domain construction if toolstack requests to enable
+     * SCI support so mediator can inform SCP-firmware about new
+     * guest and create own structures for the new domain.
+     */
+    int (*domain_init)(struct domain *d, struct xen_arch_domainconfig *con=
fig);
+
+    /*
+     * Called during domain destruction, releases all resources, that
+     * were allocated by the mediator.
+     */
+    void (*domain_destroy)(struct domain *d);
+
+    /*
+     * Called during parsing partial device-sci for the domain.
+     * Passing device_node so mediator could process the device and
+     * mark the device as related to the domain if needed.
+     */
+    int (*add_dt_device)(struct domain *d, struct dt_device_node *dev);
+
+    /*
+     * Called during domain destruction to relinquish resources used
+     * by mediator itself. This function can return -ERESTART to indicate
+     * that it does not finished work and should be called again.
+     */
+    int (*relinquish_resources)(struct domain *d);
+
+    /* Handle call for current domain */
+    bool (*handle_call)(struct domain *d, void *regs);
+};
+
+struct sci_mediator_desc {
+    /* Printable name of the SCI. */
+    const char *name;
+
+    /* Mediator callbacks as described above. */
+    const struct sci_mediator_ops *ops;
+
+    /*
+     * ID of SCI. Corresponds to xen_arch_domainconfig.sci_type.
+     * Should be one of XEN_DOMCTL_CONFIG_ARM_SCI_xxx
+     */
+    uint16_t sci_type;
+
+    /* Match structure to init mediator */
+    const struct dt_device_match *dt_match;
+
+};
+
+int sci_domain_init(struct domain *d, uint16_t sci_type,
+                    struct xen_arch_domainconfig *config);
+void sci_domain_destroy(struct domain *d);
+int sci_add_dt_device(struct domain *d, struct dt_device_node *dev);
+int sci_relinquish_resources(struct domain *d);
+bool sci_handle_call(struct domain *d, void *args);
+uint16_t sci_get_type(void);
+int sci_do_domctl(
+    struct xen_domctl *domctl, struct domain *d,
+    XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl);
+
+#define REGISTER_SCI_MEDIATOR(_name, _namestr, _type, _match, _ops) \
+static const struct sci_mediator_desc __sci_desc_##_name __used     \
+__section(".scimediator.info") =3D {                                  \
+    .name =3D _namestr,                                               \
+    .ops =3D _ops,                                                    \
+    .sci_type =3D _type,                                              \
+    .dt_match =3D _match                                              \
+}
+
+#else
+
+static inline int sci_domain_init(struct domain *d, uint16_t sci_type,
+                    struct xen_arch_domainconfig *config)
+{
+    if ( likely(sci_type =3D=3D XEN_DOMCTL_CONFIG_ARM_SCI_NONE) )
+        return 0;
+
+    return -ENODEV;
+}
+
+static inline void sci_domain_destroy(struct domain *d)
+{
+}
+
+static inline int sci_add_dt_device(struct domain *d,
+                                    struct dt_device_node *dev)
+{
+    return 0;
+}
+
+static inline int sci_relinquish_resources(struct domain *d)
+{
+    return 0;
+}
+
+static inline bool sci_handle_call(struct domain *d, void *args)
+{
+    return false;
+}
+
+static inline uint16_t sci_get_type(void)
+{
+    return XEN_DOMCTL_CONFIG_ARM_SCI_NONE;
+}
+
+static inline int sci_do_domctl(
+    struct xen_domctl *domctl, struct domain *d,
+    XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
+{
+    return -ENOSYS;
+}
+
+
+#endif  /* CONFIG_ARM_SCI */
+
+#endif /* __ASM_ARM_SCI_H */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
index 94b31511dd..a6131ab1fd 100644
--- a/xen/include/public/arch-arm.h
+++ b/xen/include/public/arch-arm.h
@@ -314,12 +314,17 @@ DEFINE_XEN_GUEST_HANDLE(vcpu_guest_context_t);
 #define XEN_DOMCTL_CONFIG_TEE_NONE      0
 #define XEN_DOMCTL_CONFIG_TEE_OPTEE     1
=20
+#define XEN_DOMCTL_CONFIG_ARM_SCI_NONE      0
+#define XEN_DOMCTL_CONFIG_ARM_SCI_SCMI_SMC  1
+
 struct xen_arch_domainconfig {
     /* IN/OUT */
     uint8_t gic_version;
     /* IN */
     uint16_t tee_type;
     /* IN */
+    uint16_t arm_sci_type;
+    /* IN */
     uint32_t nr_spis;
     /*
      * OUT
@@ -335,6 +340,12 @@ struct xen_arch_domainconfig {
      *
      */
     uint32_t clock_frequency;
+
+    /* Sets shared address to sw domains.
+     * This information is needed to set correct channel in Domain partial
+     * device-tree
+     */
+    uint64_t arm_sci_agent_paddr;
 };
 #endif /* __XEN__ || __XEN_TOOLS__ */
=20
@@ -429,6 +440,10 @@ typedef uint64_t xen_callback_t;
 #define GUEST_ACPI_BASE xen_mk_ullong(0x20000000)
 #define GUEST_ACPI_SIZE xen_mk_ullong(0x02000000)
=20
+/* SCMI shared memory address */
+#define GUEST_SCI_SHMEM_BASE   xen_mk_ullong(0x05ff0000)
+#define GUEST_SCI_SHMEM_SIZE   xen_mk_ullong(0x01000)
+
 /* PL011 mappings */
 #define GUEST_PL011_BASE    xen_mk_ullong(0x22000000)
 #define GUEST_PL011_SIZE    xen_mk_ullong(0x00001000)
--=20
2.27.0

