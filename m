Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD2414AE041
	for <lists+xen-devel@lfdr.de>; Tue,  8 Feb 2022 19:01:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.268498.462412 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHUmy-00089a-T9; Tue, 08 Feb 2022 18:00:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 268498.462412; Tue, 08 Feb 2022 18:00:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHUmy-00086h-LM; Tue, 08 Feb 2022 18:00:28 +0000
Received: by outflank-mailman (input) for mailman id 268498;
 Tue, 08 Feb 2022 18:00:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TsJg=SX=epam.com=prvs=40387f30b1=oleksii_moisieiev@srs-se1.protection.inumbo.net>)
 id 1nHUmv-00068L-Ec
 for xen-devel@lists.xenproject.org; Tue, 08 Feb 2022 18:00:25 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fc1d3e92-8908-11ec-8eb8-a37418f5ba1a;
 Tue, 08 Feb 2022 19:00:23 +0100 (CET)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 218EgrTB015757;
 Tue, 8 Feb 2022 18:00:19 GMT
Received: from eur02-he1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2057.outbound.protection.outlook.com [104.47.5.57])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3e3t5xrs6q-10
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Feb 2022 18:00:19 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com (2603:10a6:102:ea::23)
 by VE1PR03MB5613.eurprd03.prod.outlook.com (2603:10a6:803:12a::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.19; Tue, 8 Feb
 2022 18:00:11 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::c1c:f98:9dd:86e0]) by PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::c1c:f98:9dd:86e0%6]) with mapi id 15.20.4951.019; Tue, 8 Feb 2022
 18:00:11 +0000
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
X-Inumbo-ID: fc1d3e92-8908-11ec-8eb8-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cfCuyyHlgadn8j+UYBWok7zac+2TzkmJ2j4bLiiwMg/1466/pTjVETa0HtAMQgCX6cP9eE38ZogXqstamqH9eMUEjNkVPPyYXYdT1ssz2XUI7SStubRZ6gK6dHtCLNTow3okq52G/65e7l5Nl1pU6kl5gRnNJO7zNoSn5POOb9NSgYuvrFzqTpQ4Hp5WJURa1yhZr7BlfL5IEGlldsB0UzjeuNO8SGZ79S1tvBEhC3dBFW/sGy8rMQVfSui47Y/t3vPrz3cpYqIDPOMaJeqpWoUFIQm3aJmeNi3GuBlNPp8vduMDNWNioSN8rf8An7t/+ad4+URTw87Sx+FsoztLjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lwBesdAFpbbKcuHszwtd+zJh3/6ZoEfXGDzAO3r/9m0=;
 b=c9UB4kZlMfSoZTWEqbYQtbmDVnhLxbrEoh7pFvdu3KrQVuIUpifU4fvwgvA4PCOACWI4/E9rJ4YbyYP+Sav2geTt0wo8lwiLdm7s0PWb/XpzM/d3hE1EWlJnl2ky+fTyBpLUKq1+SYUuvpYBsInuxWahFpzdB1CptNIAQAtN9f7m6ZemBaRdL4jVDKxc/sF86xBIYx/npPnQ3/5WJ1RJmCC1LircLrRxBVTDcjb+SrY4dle68TCnGWjNrz4/SEgpzXVGKuEj8kaipWb5uaRFKY3XoHG6CyhaxcThdQiyWw46XcHA2q8A44ccnA03U4eBXcgd3JkbeLAlxBHahS1Wlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lwBesdAFpbbKcuHszwtd+zJh3/6ZoEfXGDzAO3r/9m0=;
 b=TpPGHIgG0FILxJtDzG9X/2roEE4dC+yowbSQLihWnwBIa58Vxaox+kKNBXECiiMi0+zHo5/WCHAH7LmHan1uV3rCG7RvJU3XYUlHhQE7Bi1+pMYwFr7BUPrl2a5mCdnjSdswDBqQPBeYqyRa50FA88d88YBTRNk/WFIBXJmLvEnRXNdde0BnLv1UHhZsNTF7Hi5KHc+Q56U6DNxrz3maZGwFEb8hROHs24qqDClriSNR/pYX8V6omfFJWmUGhX0ej0gfamIirroEorjHMu/AOP6/kBpbeqNMnjxPahtiSwElORDQZZWsONJUbyj878Rek0JbTKiungZgMMxVeDWzPA==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>,
        Stefano Stabellini
	<sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Bertrand Marquis <bertrand.marquis@arm.com>
Subject: [RFC v2 5/8] xen/arm: introduce SCMI-SMC mediator driver
Thread-Topic: [RFC v2 5/8] xen/arm: introduce SCMI-SMC mediator driver
Thread-Index: AQHYHRW24Dmb0qV8ZkqAv39Pf6/nVQ==
Date: Tue, 8 Feb 2022 18:00:10 +0000
Message-ID: 
 <cb1493f5d9b5c3437268054b4a8e345cb35c8708.1644341635.git.oleksii_moisieiev@epam.com>
References: <cover.1644341635.git.oleksii_moisieiev@epam.com>
In-Reply-To: <cover.1644341635.git.oleksii_moisieiev@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 51fb966e-0e48-4ba5-d203-08d9eb2cd9cc
x-ms-traffictypediagnostic: VE1PR03MB5613:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <VE1PR03MB56137E640128E908C0E46C46E32D9@VE1PR03MB5613.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3383;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 UIoCAc8+AFzUwByPeHaDyknesucUZr0veB6PMzgQPBSlzEC/jxCZtvOTDmZgLQS9/plIDRB8EgieFRTqpmk/Cb3hQSllfDvAa0oUTr9XWq7o63zOHA/FUwNjtm7MZrkcOMFumx7go/DPaF8VydGHITziojEhKtzmYPUDPaeTP4n/jXiLglRvATiVs2oxh7ChV1ZT+DYn3S8MA9Iq2gIXNqgaBQeF7A0S8w45Kyi06KMmnATsIT/5zAFihScY7mFTZuQ5iABLKr1NL/kFquWAMGPPTOHR6L4XaBZ+5qJed+c/onnuukx3vtk9xS623MRihgXecUjZgePD9RBq7HY9CGPby3nOoMa9IU35pMDoHVEL5R+bNwLI6bLlpZXfXjDF1CoqFJ3cpJLDhhooHaNry5vdQUwh/cDwZEFAQxHdO6SxMteaa2q11+eslAD47pZ2Ev005FLn159csA1mybXCanmX7OhRdMFfUTUkBZcaGeqod7snfxC+q8Q3Tm/dn+7kK3r/om10s00OIr05elF10KIKae1xafdg8qtMMJD05X34oPzNa/jlssN5HI0Zq9kIe3qMO8nHLdSCHF/xsdgQa3B2fbUTq0zFieEh1I+HNZWzEx07lQrwveRyqFY6z8UQWsUkX1XsMFPcSIF9tYMR7C6ijWv7KgoO8NBpN64F101YR0CD+4Owxt7LpmYwJwzUCOePc+qpzFz+0/JZonijGrJKIQN4FFgrvKtjCT13p+Q=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR03MB7136.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38070700005)(71200400001)(6486002)(508600001)(66476007)(64756008)(86362001)(66556008)(316002)(122000001)(6916009)(6506007)(2616005)(5660300002)(6512007)(4326008)(83380400001)(54906003)(30864003)(2906002)(26005)(186003)(8676002)(76116006)(38100700002)(66446008)(66946007)(8936002)(36756003)(91956017)(2004002)(579004)(559001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?7DKeJTm3R0sBtYj9VngbEwbgcb5SIqliGCV12ylc/tO668jfbZOrRSzw+E?=
 =?iso-8859-1?Q?1Z/neW3FLRW5d+c910kMbSJX4+uLPOWWcytJ5LdYCihdf1/zkEaNqzOJZz?=
 =?iso-8859-1?Q?cfUJGlr0j4+AigdBafZQkytDsDLqVUW85HYqEpKO4muG50nlxedLxe8al5?=
 =?iso-8859-1?Q?rMcJBEvFyS1/jgINlNpjMVgjForVFpjCzNtuUr7iT3NVGSdluu+GS5E+GM?=
 =?iso-8859-1?Q?s/oWSdc6wAl+N0zqkg68GmCzwI9wdG+cpcnZaLNDh+0LJC3bdHnIN3KGDi?=
 =?iso-8859-1?Q?cXkM7eZPNqAGU8sIRZVaknfDt9NY/zpopRYzDSvAvPeEPgjy0XuQxef0ZZ?=
 =?iso-8859-1?Q?G/Zs6tbr3zCk7tqv/1bnbkjxeNrajadymc0GYu+qk0/KOERXj9G6LVWT2v?=
 =?iso-8859-1?Q?FlqJOqYlQUoKC6u9Qjj89sz9rOGdbdZz8H3N390p6J+awqd1zOGxtDJ8Me?=
 =?iso-8859-1?Q?qAtsZZIpSxeOX/QNoxxvUX6b2V+tm6MeQiEUAjXG+aoy0tKUKZdvn/yygt?=
 =?iso-8859-1?Q?Iyd6wk6texgJJ+OKFjQTEbFA3ANG6/QwJgToEhbHm+ogEUuruOpiSRRGRs?=
 =?iso-8859-1?Q?0Njnco3DoEA/JJSFt1tr7TBgtcx+nAODiEbAGhHVMqUvzuMfvITa2GzxBS?=
 =?iso-8859-1?Q?vOo5PxFSIFS87jBCbQnjAm3oJWibkfGnrgH/7UfqSOUU6gXYV5SDkLDBDq?=
 =?iso-8859-1?Q?h9gyj9JiOnFi5vRQ/m/A649vKCaBx3NLFPIBvqSm7wMhhE9mMc2z10pXNB?=
 =?iso-8859-1?Q?808No95b3MCIrUqVZ/h8EMU0X26XyvBFipfNuDlgXkR9YakfW6C+izOs0C?=
 =?iso-8859-1?Q?A8cjx6i75n95CAfOv4uO0zy4lkYsG/f8RQr0nEub+87JMgFvJQ2ViV1e8q?=
 =?iso-8859-1?Q?JgYMO8hv0FNkazdMPfGG5tfJqlWbKeMCLJ+zY4OvBm4mFJauU/wjn5PDxh?=
 =?iso-8859-1?Q?A2EyMyACgtDkC724wE+zDWglZwiBN19h4xY70yP4KZtpjD/bn3nhbVemnr?=
 =?iso-8859-1?Q?VTMaK/ib7IUkGUjefqUEpO9cOL7uZc7AGr0ZZ5jr2TqB1ebrvsRat/HLAB?=
 =?iso-8859-1?Q?T3Edh0d8cyQBm5LjqP0DJj14VTGNGW0LKpLEUhe7JicSJ3nmPnCdsMv4T7?=
 =?iso-8859-1?Q?p+5ThbvWuCje220ZCNvGGkNgjBznAkl+nYhXnzMfSEonlra53xWJFKb1ta?=
 =?iso-8859-1?Q?gKHK2pL1hJnJN9ZHDMi4cgy8jJVZeLrUZI+x37IYWo3jRMqwNmJw7Rw/4m?=
 =?iso-8859-1?Q?swWubhIkf1v9i/dV/PY4s2f+rr26o0GSaA/cVX+3AIP4VAoSSMGIvscR4h?=
 =?iso-8859-1?Q?ODArtzf8fl4A3gMJ3XP67dwkVpPMyJGlUfp1LHE8NJcitE3kgRLEp/vsX4?=
 =?iso-8859-1?Q?tilCyolk/h0mbfdO3LfKrpIA7dMLL49FF8Zq7ioFYPvc9giHMN4UehdWNU?=
 =?iso-8859-1?Q?XuDIsg9vhFj+aA9yPCrBMFkcjNvUpBqVrW5BXeJVOpyPOLr/jSWE7u3iJJ?=
 =?iso-8859-1?Q?3OV5jK6ulnyG7s9+iZkpuf913wckfhoPMIM0umtGUTMBg6jqeHez4Kcs5H?=
 =?iso-8859-1?Q?kx0gzCWDg0VxWRkgT0LMZbso0oFT3XBBHPkSAsQIEMcMt0rg5nkz7HYJOI?=
 =?iso-8859-1?Q?wIKBcuJe0ZVM+qpw8VNpquKMZUbLupwui7rIZiZnmFZR/i9VaEsNCVZ9cV?=
 =?iso-8859-1?Q?yJ/cVyNvwjxxbREyVL0uMCuEIU/9fj6udtcprz7VEX8usMovdyOfkY5/vV?=
 =?iso-8859-1?Q?toQ+yK6uQMTvEHpECIztpiMTM=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR03MB7136.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51fb966e-0e48-4ba5-d203-08d9eb2cd9cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2022 18:00:10.4983
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yGu9sE7NDwwHGwOdYtqFBcUWXZU6xbwMnEwcDmw6QdQtZf+MQmFrAVyteEg6ZK7w8OPd9EycTMTHfJ3GO25CjPWelkClig20eXRgIZOyTm4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR03MB5613
X-Proofpoint-GUID: Xjku0kQnLWwAjadQoLtDOOfoMLBUmhBS
X-Proofpoint-ORIG-GUID: Xjku0kQnLWwAjadQoLtDOOfoMLBUmhBS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-08_06,2022-02-07_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 adultscore=0
 suspectscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 mlxlogscore=999 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2201110000 definitions=main-2202080106

This is the implementation of SCI interface, called SCMI-SMC driver,
which works as the mediator between XEN Domains and Firmware (SCP, ATF etc)=
.
This allows devices from the Domains to work with clocks, resets and
power-domains without access to CPG.

Originally, cpg should be passed to the domain so it can work with
power-domains/clocks/resets etc. Considering that cpg can't be split betwee=
n
the Domains, we get the limitation that the devices, which are using
power-domains/clocks/resets etc, couldn't be split between the domains.
The solution is to move the power-domain/clock/resets etc to the
Firmware (such as SCP firmware or ATF) and provide interface for the
Domains. XEN should have an entity, caled SCI-Mediator, which is
responsible for messages redirection between Domains and Firmware and
for permission handling.

The following features are implemented:
- request SCMI channels from ATF and pass channels to Domains;
- set device permissions for Domains based on the Domain partial
device-tree. Devices with permissions are able to work with clocks,
resets and power-domains via SCMI;
- redirect scmi messages from Domains to ATF.

Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
---
 xen/arch/arm/Kconfig        |   2 +
 xen/arch/arm/sci/Kconfig    |  10 +
 xen/arch/arm/sci/scmi_smc.c | 959 ++++++++++++++++++++++++++++++++++++
 3 files changed, 971 insertions(+)
 create mode 100644 xen/arch/arm/sci/Kconfig
 create mode 100644 xen/arch/arm/sci/scmi_smc.c

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index ab07833582..3b0dfc57b6 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -123,6 +123,8 @@ config ARM_SCI
 	  support. It allows guests to control system resourcess via one of
 	  ARM_SCI mediators implemented in XEN.
=20
+	source "arch/arm/sci/Kconfig"
+
 endmenu
=20
 menu "ARM errata workaround via the alternative framework"
diff --git a/xen/arch/arm/sci/Kconfig b/xen/arch/arm/sci/Kconfig
new file mode 100644
index 0000000000..10b634d2ed
--- /dev/null
+++ b/xen/arch/arm/sci/Kconfig
@@ -0,0 +1,10 @@
+config SCMI_SMC
+	bool "Enable SCMI-SMC mediator driver"
+	default n
+	depends on ARM_SCI && HOST_DTB_EXPORT
+	---help---
+
+	Enables mediator in XEN to pass SCMI requests from Domains to ATF.
+	This feature allows drivers from Domains to work with System
+	Controllers (such as power,resets,clock etc.). SCP is used as transport
+	for communication.
diff --git a/xen/arch/arm/sci/scmi_smc.c b/xen/arch/arm/sci/scmi_smc.c
new file mode 100644
index 0000000000..103529dfab
--- /dev/null
+++ b/xen/arch/arm/sci/scmi_smc.c
@@ -0,0 +1,959 @@
+/*
+ * xen/arch/arm/sci/scmi_smc.c
+ *
+ * SCMI mediator driver, using SCP as transport.
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
+#include <asm/sci/sci.h>
+#include <asm/smccc.h>
+#include <asm/io.h>
+#include <xen/bitops.h>
+#include <xen/config.h>
+#include <xen/sched.h>
+#include <xen/device_tree.h>
+#include <xen/iocap.h>
+#include <xen/init.h>
+#include <xen/err.h>
+#include <xen/lib.h>
+#include <xen/list.h>
+#include <xen/mm.h>
+#include <xen/string.h>
+#include <xen/time.h>
+#include <xen/vmap.h>
+
+#define SCMI_BASE_PROTOCOL                  0x10
+#define SCMI_BASE_PROTOCOL_ATTIBUTES        0x1
+#define SCMI_BASE_SET_DEVICE_PERMISSIONS    0x9
+#define SCMI_BASE_RESET_AGENT_CONFIGURATION 0xB
+#define SCMI_BASE_DISCOVER_AGENT            0x7
+
+/* SCMI return codes. See section 4.1.4 of SCMI spec (DEN0056C) */
+#define SCMI_SUCCESS              0
+#define SCMI_NOT_SUPPORTED      (-1)
+#define SCMI_INVALID_PARAMETERS (-2)
+#define SCMI_DENIED             (-3)
+#define SCMI_NOT_FOUND          (-4)
+#define SCMI_OUT_OF_RANGE       (-5)
+#define SCMI_BUSY               (-6)
+#define SCMI_COMMS_ERROR        (-7)
+#define SCMI_GENERIC_ERROR      (-8)
+#define SCMI_HARDWARE_ERROR     (-9)
+#define SCMI_PROTOCOL_ERROR     (-10)
+
+#define DT_MATCH_SCMI_SMC DT_MATCH_COMPATIBLE("arm,scmi-smc")
+
+#define SCMI_SMC_ID                        "arm,smc-id"
+#define SCMI_SHARED_MEMORY                 "arm,scmi-shmem"
+#define SCMI_SHMEM                         "shmem"
+#define SCMI_SHMEM_MAPPED_SIZE             PAGE_SIZE
+
+#define HYP_CHANNEL                          0x0
+
+#define HDR_ID                             GENMASK(7,0)
+#define HDR_TYPE                           GENMASK(9, 8)
+#define HDR_PROTO                          GENMASK(17, 10)
+
+/* SCMI protocol, refer to section 4.2.2.2 (DEN0056C) */
+#define MSG_N_AGENTS_MASK                  GENMASK(15, 8)
+
+#define FIELD_GET(_mask, _reg)\
+    ((typeof(_mask))(((_reg) & (_mask)) >> (ffs64(_mask) - 1)))
+#define FIELD_PREP(_mask, _val)\
+    (((typeof(_mask))(_val) << (ffs64(_mask) - 1)) & (_mask))
+
+typedef struct scmi_msg_header {
+    uint8_t id;
+    uint8_t type;
+    uint8_t protocol;
+} scmi_msg_header_t;
+
+#define SCMI_SHMEM_CHAN_STAT_CHANNEL_FREE   BIT(0, UL)
+#define SCMI_SHMEM_CHAN_STAT_CHANNEL_ERROR  BIT(1, UL)
+
+#define SCMI_ALLOW_ACCESS                   BIT(0, UL)
+
+struct scmi_shared_mem {
+    uint32_t reserved;
+    uint32_t channel_status;
+    uint32_t reserved1[2];
+    uint32_t flags;
+    uint32_t length;
+    uint32_t msg_header;
+    uint8_t msg_payload[];
+};
+
+struct dt_channel_addr {
+    u64 addr;
+    u64 size;
+    struct list_head list;
+};
+
+struct scmi_channel {
+    int chan_id;
+    int agent_id;
+    uint32_t func_id;
+    domid_t domain_id;
+    uint64_t paddr;
+    uint64_t len;
+    struct scmi_shared_mem *shmem;
+    spinlock_t lock;
+    struct list_head list;
+};
+
+struct scmi_data {
+    struct list_head channel_list;
+    spinlock_t channel_list_lock;
+    bool initialized;
+};
+
+static struct scmi_data scmi_data;
+
+
+/*
+ * pack_scmi_header() - packs and returns 32-bit header
+ *
+ * @hdr: pointer to header containing all the information on message id,
+ *    protocol id and type id.
+ *
+ * Return: 32-bit packed message header to be sent to the platform.
+ */
+static inline uint32_t pack_scmi_header(scmi_msg_header_t *hdr)
+{
+    return FIELD_PREP(HDR_ID, hdr->id) |
+        FIELD_PREP(HDR_TYPE, hdr->type) |
+        FIELD_PREP(HDR_PROTO, hdr->protocol);
+}
+
+/*
+ * unpack_scmi_header() - unpacks and records message and protocol id
+ *
+ * @msg_hdr: 32-bit packed message header sent from the platform
+ * @hdr: pointer to header to fetch message and protocol id.
+ */
+static inline void unpack_scmi_header(uint32_t msg_hdr, scmi_msg_header_t =
*hdr)
+{
+    hdr->id =3D FIELD_GET(HDR_ID, msg_hdr);
+    hdr->type =3D FIELD_GET(HDR_TYPE, msg_hdr);
+    hdr->protocol =3D FIELD_GET(HDR_PROTO, msg_hdr);
+}
+
+static inline int channel_is_free(struct scmi_channel *chan_info)
+{
+    return ( chan_info->shmem->channel_status
+            & SCMI_SHMEM_CHAN_STAT_CHANNEL_FREE ) ? 0 : -EBUSY;
+}
+
+/*
+ * Copy data from IO memory space to "real" memory space.
+ */
+void __memcpy_fromio(void *to, const volatile void __iomem *from, size_t c=
ount)
+{
+    while (count && !IS_ALIGNED((unsigned long)from, 4)) {
+        *(u8 *)to =3D __raw_readb(from);
+        from++;
+        to++;
+        count--;
+    }
+
+    while (count >=3D 4) {
+        *(u32 *)to =3D __raw_readl(from);
+        from +=3D 4;
+        to +=3D 4;
+        count -=3D 4;
+    }
+
+    while (count) {
+        *(u8 *)to =3D __raw_readb(from);
+        from++;
+        to++;
+        count--;
+    }
+}
+
+/*
+ * Copy data from "real" memory space to IO memory space.
+ */
+void __memcpy_toio(volatile void __iomem *to, const void *from, size_t cou=
nt)
+{
+    while (count && !IS_ALIGNED((unsigned long)to, 4)) {
+        __raw_writeb(*(u8 *)from, to);
+        from++;
+        to++;
+        count--;
+    }
+
+    while (count >=3D 4) {
+        __raw_writel(*(u32 *)from, to);
+        from +=3D 4;
+        to +=3D 4;
+        count -=3D 4;
+    }
+
+    while (count) {
+        __raw_writeb(*(u8 *)from, to);
+        from++;
+        to++;
+        count--;
+    }
+}
+
+static int send_smc_message(struct scmi_channel *chan_info,
+                            scmi_msg_header_t *hdr, void *data, int len)
+{
+    struct arm_smccc_res resp;
+    int ret;
+
+    if ( (len + sizeof(chan_info->shmem->msg_header)) >
+                         SCMI_SHMEM_MAPPED_SIZE )
+    {
+        printk(XENLOG_ERR
+               "scmi: Wrong size of smc message. Data is invalid\n");
+        return -EINVAL;
+    }
+
+    printk(XENLOG_DEBUG "scmi: status =3D%d len=3D%d\n",
+           chan_info->shmem->channel_status, len);
+    printk(XENLOG_DEBUG "scmi: header id =3D %d type =3D %d, proto =3D %d\=
n",
+           hdr->id, hdr->type, hdr->protocol);
+
+    ret =3D channel_is_free(chan_info);
+    if ( IS_ERR_VALUE(ret) )
+        return ret;
+
+    chan_info->shmem->channel_status =3D 0x0;
+    /* Writing 0x0 right now, but SCMI_SHMEM_FLAG_INTR_ENABLED can be set =
*/
+    chan_info->shmem->flags =3D 0x0;
+    chan_info->shmem->length =3D sizeof(chan_info->shmem->msg_header) + le=
n;
+    chan_info->shmem->msg_header =3D pack_scmi_header(hdr);
+
+    printk(XENLOG_DEBUG "scmi: Writing to shmem address %p\n",
+           chan_info->shmem);
+    if ( len > 0 && data )
+        __memcpy_toio((void *)(chan_info->shmem->msg_payload), data, len);
+
+    arm_smccc_smc(chan_info->func_id, 0, 0, 0, 0, 0, 0, chan_info->chan_id=
,
+                  &resp);
+
+    printk(XENLOG_DEBUG "scmi: scmccc_smc response %d\n", (int)(resp.a0));
+
+    if ( resp.a0 )
+        return -EOPNOTSUPP;
+
+    return 0;
+}
+
+static int check_scmi_status(int scmi_status)
+{
+    if ( scmi_status =3D=3D SCMI_SUCCESS )
+        return 0;
+
+    printk(XENLOG_DEBUG "scmi: Error received: %d\n", scmi_status);
+
+    switch ( scmi_status )
+    {
+    case SCMI_NOT_SUPPORTED:
+        return -EOPNOTSUPP;
+    case SCMI_INVALID_PARAMETERS:
+        return -EINVAL;
+    case SCMI_DENIED:
+        return -EACCES;
+    case SCMI_NOT_FOUND:
+        return -ENOENT;
+    case SCMI_OUT_OF_RANGE:
+        return -ERANGE;
+    case SCMI_BUSY:
+        return -EBUSY;
+    case SCMI_COMMS_ERROR:
+        return -ENOTCONN;
+    case SCMI_GENERIC_ERROR:
+        return -EIO;
+    case SCMI_HARDWARE_ERROR:
+        return -ENXIO;
+    case SCMI_PROTOCOL_ERROR:
+        return -EBADMSG;
+    default:
+        return -EINVAL;
+    }
+}
+
+static int get_smc_response(struct scmi_channel *chan_info,
+                            scmi_msg_header_t *hdr, void *data, int len)
+{
+    int recv_len;
+    int ret;
+
+    printk(XENLOG_DEBUG "scmi: get smc responce msgid %d\n", hdr->id);
+
+    if ( len >=3D SCMI_SHMEM_MAPPED_SIZE - sizeof(chan_info->shmem) )
+    {
+        printk(XENLOG_ERR
+               "scmi: Wrong size of input smc message. Data may be invalid=
\n");
+        return -EINVAL;
+    }
+
+    ret =3D channel_is_free(chan_info);
+    if ( IS_ERR_VALUE(ret) )
+        return ret;
+
+    recv_len =3D chan_info->shmem->length - sizeof(chan_info->shmem->msg_h=
eader);
+
+    if ( recv_len < 0 )
+    {
+        printk(XENLOG_ERR
+               "scmi: Wrong size of smc message. Data may be invalid\n");
+        return -EINVAL;
+    }
+
+    if ( recv_len > len )
+    {
+        printk(XENLOG_ERR
+               "scmi: Not enough buffer for message %d, expecting %d\n",
+               recv_len, len);
+        return -EINVAL;
+    }
+
+    unpack_scmi_header(chan_info->shmem->msg_header, hdr);
+
+    if ( recv_len > 0 )
+    {
+        __memcpy_fromio(data, chan_info->shmem->msg_payload, recv_len);
+    }
+
+    return 0;
+}
+
+static int do_smc_xfer(struct scmi_channel *channel, scmi_msg_header_t *hd=
r, void *tx_data, int tx_size,
+                       void *rx_data, int rx_size)
+{
+    int ret =3D 0;
+
+    ASSERT( channel && channel->shmem);
+
+    if ( !hdr )
+        return -EINVAL;
+
+    spin_lock(&channel->lock);
+
+    ret =3D send_smc_message(channel, hdr, tx_data, tx_size);
+    if ( ret )
+        goto clean;
+
+    ret =3D get_smc_response(channel, hdr, rx_data, rx_size);
+clean:
+    spin_unlock(&channel->lock);
+
+    return ret;
+}
+
+static struct scmi_channel *get_channel_by_id(uint8_t chan_id)
+{
+    struct scmi_channel *curr;
+    bool found =3D false;
+
+    spin_lock(&scmi_data.channel_list_lock);
+    list_for_each_entry(curr, &scmi_data.channel_list, list)
+    {
+        if ( curr->chan_id =3D=3D chan_id )
+        {
+            found =3D true;
+            break;
+        }
+    }
+
+    spin_unlock(&scmi_data.channel_list_lock);
+    if ( found )
+        return curr;
+
+    return NULL;
+}
+
+static struct scmi_channel *aquire_scmi_channel(domid_t domain_id)
+{
+    struct scmi_channel *curr;
+    bool found =3D false;
+
+    ASSERT(domain_id !=3D DOMID_INVALID && domain_id >=3D 0);
+
+    spin_lock(&scmi_data.channel_list_lock);
+    list_for_each_entry(curr, &scmi_data.channel_list, list)
+    {
+        if ( curr->domain_id =3D=3D DOMID_INVALID )
+        {
+            curr->domain_id =3D domain_id;
+            found =3D true;
+            break;
+        }
+    }
+
+    spin_unlock(&scmi_data.channel_list_lock);
+    if ( found )
+        return curr;
+
+    return NULL;
+}
+
+static void relinquish_scmi_channel(struct scmi_channel *channel)
+{
+    ASSERT(channel !=3D NULL);
+
+    spin_lock(&scmi_data.channel_list_lock);
+    channel->domain_id =3D DOMID_INVALID;
+    spin_unlock(&scmi_data.channel_list_lock);
+}
+
+static int map_channel_memory(struct scmi_channel *channel)
+{
+    ASSERT( channel && channel->paddr );
+    channel->shmem =3D ioremap_cache(channel->paddr, SCMI_SHMEM_MAPPED_SIZ=
E);
+    if ( !channel->shmem )
+        return -ENOMEM;
+
+    channel->shmem->channel_status =3D SCMI_SHMEM_CHAN_STAT_CHANNEL_FREE;
+    printk(XENLOG_DEBUG "scmi: Got shmem after vmap %p\n", channel->shmem)=
;
+    return 0;
+}
+
+static void unmap_channel_memory(struct scmi_channel *channel)
+{
+    ASSERT( channel && channel->shmem );
+    iounmap(channel->shmem);
+    channel->shmem =3D NULL;
+}
+
+static struct scmi_channel *smc_create_channel(uint8_t chan_id,
+                                               uint32_t func_id, uint64_t =
addr)
+{
+    struct scmi_channel *channel;
+
+    channel =3D get_channel_by_id(chan_id);
+    if ( channel )
+        return ERR_PTR(EEXIST);
+
+    channel =3D xmalloc(struct scmi_channel);
+    if ( !channel )
+        return ERR_PTR(ENOMEM);
+
+    channel->chan_id =3D chan_id;
+    channel->func_id =3D func_id;
+    channel->domain_id =3D DOMID_INVALID;
+    channel->shmem =3D NULL;
+    channel->paddr =3D addr;
+    spin_lock_init(&channel->lock);
+    spin_lock(&scmi_data.channel_list_lock);
+    list_add(&channel->list, &scmi_data.channel_list);
+    spin_unlock(&scmi_data.channel_list_lock);
+    return channel;
+}
+
+static int mem_permit_access(struct domain *d, uint64_t addr, uint64_t len=
)
+{
+    return iomem_permit_access(d, paddr_to_pfn(addr),
+                paddr_to_pfn(PAGE_ALIGN(addr + len -1)));
+}
+
+static int mem_deny_access(struct domain *d, uint64_t addr,
+                                     uint64_t len)
+{
+    return iomem_deny_access(d, paddr_to_pfn(addr),
+                paddr_to_pfn(PAGE_ALIGN(addr + len -1)));
+}
+
+static int dt_update_domain_range(uint64_t addr, uint64_t size)
+{
+    struct dt_device_node *shmem_node;
+    __be32 *hw_reg;
+    const struct dt_property *pp;
+    uint32_t len;
+
+    shmem_node =3D dt_find_compatible_node(NULL, NULL, SCMI_SHARED_MEMORY)=
;
+    if ( !shmem_node )
+    {
+        printk(XENLOG_ERR "scmi: Unable to find %s node in DT\n", SCMI_SHM=
EM);
+        return -EINVAL;
+    }
+
+    pp =3D dt_find_property(shmem_node, "reg", &len);
+    if ( !pp )
+    {
+        printk(XENLOG_ERR "scmi: Unable to find regs entry in shmem node\n=
");
+        return -ENOENT;
+    }
+
+    hw_reg =3D pp->value;
+    dt_set_range(&hw_reg, shmem_node, addr, size);
+
+    return 0;
+}
+
+static void free_channel_list(void)
+{
+    struct scmi_channel *curr, *_curr;
+
+    spin_lock(&scmi_data.channel_list_lock);
+    list_for_each_entry_safe (curr, _curr, &scmi_data.channel_list, list)
+    {
+        list_del(&curr->list);
+        xfree(curr);
+    }
+
+    spin_unlock(&scmi_data.channel_list_lock);
+}
+
+static struct dt_device_node *get_dt_node_from_property(
+                struct dt_device_node *node, const char * p_name)
+{
+    const __be32 *prop;
+
+    ASSERT( node );
+
+    prop =3D dt_get_property(node, p_name, NULL);
+    if ( !prop )
+        return ERR_PTR(-EINVAL);
+
+    return dt_find_node_by_phandle(be32_to_cpup(prop));
+}
+
+static int get_shmem_regions(struct list_head *head, u64 hyp_addr)
+{
+    struct dt_device_node *node;
+    int ret;
+    struct dt_channel_addr *lchan;
+    u64 laddr, lsize;
+
+    node =3D dt_find_compatible_node(NULL, NULL, SCMI_SHARED_MEMORY);
+    if ( !node )
+        return -ENOENT;
+
+    while ( node )
+    {
+        ret =3D dt_device_get_address(node, 0, &laddr, &lsize);
+        if ( ret )
+            return ret;
+
+        if ( laddr !=3D hyp_addr )
+        {
+            lchan =3D xmalloc(struct dt_channel_addr);
+            if ( !lchan )
+                return -ENOMEM;
+            lchan->addr =3D laddr;
+            lchan->size =3D lsize;
+
+            list_add_tail(&lchan->list, head);
+        }
+
+        node =3D dt_find_compatible_node(node, NULL, SCMI_SHARED_MEMORY);
+    }
+
+    return 0;
+}
+
+static int read_hyp_channel_addr(struct dt_device_node *scmi_node,
+                                 u64 *addr, u64 *size)
+{
+    struct dt_device_node *shmem_node;
+    shmem_node =3D get_dt_node_from_property(scmi_node, "shmem");
+    if ( IS_ERR_OR_NULL(shmem_node) )
+    {
+        printk(XENLOG_ERR
+               "scmi: Device tree error, can't parse reserved memory %ld\n=
",
+               PTR_ERR(shmem_node));
+        return PTR_ERR(shmem_node);
+    }
+
+    return dt_device_get_address(shmem_node, 0, addr, size);
+}
+
+static void free_shmem_regions(struct list_head *addr_list)
+{
+    struct dt_channel_addr *curr, *_curr;
+
+    list_for_each_entry_safe (curr, _curr, addr_list, list)
+    {
+        list_del(&curr->list);
+        xfree(curr);
+    }
+}
+
+static __init bool scmi_probe(struct dt_device_node *scmi_node)
+{
+    u64 addr, size;
+    int ret, i;
+    struct scmi_channel *channel, *agent_channel;
+    int n_agents;
+    scmi_msg_header_t hdr;
+    struct rx_t {
+        int32_t status;
+        uint32_t attributes;
+    } rx;
+    struct dt_channel_addr *entry;
+    struct list_head addr_list;
+
+    uint32_t func_id;
+
+    ASSERT(scmi_node !=3D NULL);
+
+    INIT_LIST_HEAD(&scmi_data.channel_list);
+    spin_lock_init(&scmi_data.channel_list_lock);
+
+    if ( !dt_property_read_u32(scmi_node, SCMI_SMC_ID, &func_id) )
+    {
+        printk(XENLOG_ERR "scmi: Unable to read smc-id from DT\n");
+        return false;
+    }
+
+    ret =3D read_hyp_channel_addr(scmi_node, &addr, &size);
+    if ( IS_ERR_VALUE(ret) )
+        return false;
+
+    if ( !IS_ALIGNED(size, SCMI_SHMEM_MAPPED_SIZE) )
+    {
+        printk(XENLOG_ERR "scmi: Reserved memory is not aligned\n");
+        return false;
+    }
+
+    INIT_LIST_HEAD(&addr_list);
+
+    ret =3D get_shmem_regions(&addr_list, addr);
+    if ( IS_ERR_VALUE(ret) )
+        goto out;
+
+    channel =3D smc_create_channel(HYP_CHANNEL, func_id, addr);
+    if ( IS_ERR(channel) )
+        goto out;
+
+    ret =3D map_channel_memory(channel);
+    if ( ret )
+        goto out;
+
+    spin_lock(&scmi_data.channel_list_lock);
+    channel->domain_id =3D DOMID_XEN;
+    spin_unlock(&scmi_data.channel_list_lock);
+
+    hdr.id =3D SCMI_BASE_PROTOCOL_ATTIBUTES;
+    hdr.type =3D 0;
+    hdr.protocol =3D SCMI_BASE_PROTOCOL;
+
+    ret =3D do_smc_xfer(channel, &hdr, NULL, 0, &rx, sizeof(rx));
+    if ( ret )
+        goto error;
+
+    ret =3D check_scmi_status(rx.status);
+    if ( ret )
+        goto error;
+
+    n_agents =3D FIELD_GET(MSG_N_AGENTS_MASK, rx.attributes);
+    printk(XENLOG_DEBUG "scmi: Got agent count %d\n", n_agents);
+
+    i =3D 1;
+    list_for_each_entry(entry, &addr_list, list)
+    {
+        uint32_t tx_agent_id =3D 0xFFFFFFFF;
+        struct {
+            int32_t status;
+            uint32_t agent_id;
+            char name[16];
+        } da_rx;
+
+        agent_channel =3D smc_create_channel(i, func_id,
+                                           entry->addr);
+        if ( IS_ERR(agent_channel) )
+        {
+            ret =3D PTR_ERR(agent_channel);
+            goto error;
+        }
+
+        ret =3D map_channel_memory(agent_channel);
+        if ( ret )
+            goto error;
+
+        hdr.id =3D SCMI_BASE_DISCOVER_AGENT;
+        hdr.type =3D 0;
+        hdr.protocol =3D SCMI_BASE_PROTOCOL;
+
+        ret =3D do_smc_xfer(agent_channel, &hdr, &tx_agent_id,
+                          sizeof(tx_agent_id), &da_rx, sizeof(da_rx));
+        if ( ret )
+        {
+            unmap_channel_memory(agent_channel);
+            goto error;
+        }
+
+        unmap_channel_memory(agent_channel);
+
+        ret =3D check_scmi_status(da_rx.status);
+        if ( ret )
+            goto error;
+
+        printk(XENLOG_DEBUG "scmi: status=3D0x%x id=3D0x%x name=3D%s\n",
+                da_rx.status, da_rx.agent_id, da_rx.name);
+
+        agent_channel->agent_id =3D da_rx.agent_id;
+
+        if ( i =3D=3D n_agents )
+            break;
+
+        i++;
+    }
+
+    scmi_data.initialized =3D true;
+    goto out;
+
+error:
+    unmap_channel_memory(channel);
+    free_channel_list();
+out:
+    free_shmem_regions(&addr_list);
+    return ret =3D=3D 0;
+}
+
+static int scmi_domain_init(struct domain *d,
+                           struct xen_arch_domainconfig *config)
+{
+    struct scmi_channel *channel;
+    int ret;
+
+    if ( !scmi_data.initialized )
+        return 0;
+
+    printk(XENLOG_INFO "scmi: domain_id =3D %d\n", d->domain_id);
+
+    channel =3D aquire_scmi_channel(d->domain_id);
+    if ( IS_ERR_OR_NULL(channel) )
+        return -ENOENT;
+
+#ifdef CONFIG_ARM_32
+    printk(XENLOG_INFO
+           "scmi: Aquire SCMI channel id =3D 0x%x , domain_id =3D %d paddr=
 =3D 0x%llx\n",
+           channel->chan_id, channel->domain_id, channel->paddr);
+#else
+    printk(XENLOG_INFO
+           "scmi: Aquire SCMI channel id =3D 0x%x , domain_id =3D %d paddr=
 =3D 0x%lx\n",
+           channel->chan_id, channel->domain_id, channel->paddr);
+#endif
+
+    if ( is_hardware_domain(d) )
+    {
+        ret =3D mem_permit_access(d, channel->paddr, PAGE_SIZE);
+        if ( IS_ERR_VALUE(ret) )
+            goto error;
+
+        ret =3D dt_update_domain_range(channel->paddr, PAGE_SIZE);
+        if ( IS_ERR_VALUE(ret) )
+        {
+            int rc =3D mem_deny_access(d, channel->paddr, PAGE_SIZE);
+            if ( rc )
+                printk(XENLOG_ERR "Unable to mem_deny_access\n");
+
+            goto error;
+        }
+    }
+
+    d->arch.sci =3D channel;
+    if ( config )
+        config->arm_sci_agent_paddr =3D channel->paddr;
+
+    return 0;
+error:
+    relinquish_scmi_channel(channel);
+
+    return ret;
+}
+
+static int scmi_add_device_by_devid(struct domain *d, uint32_t scmi_devid)
+{
+    struct scmi_channel *channel, *agent_channel;
+    scmi_msg_header_t hdr;
+    struct scmi_perms_tx {
+        uint32_t agent_id;
+        uint32_t device_id;
+        uint32_t flags;
+    } tx;
+    struct rx_t {
+        int32_t status;
+        uint32_t attributes;
+    } rx;
+    int ret;
+
+    if ( !scmi_data.initialized )
+        return 0;
+
+    printk(XENLOG_DEBUG "scmi: scmi_devid =3D %d\n", scmi_devid);
+
+    agent_channel =3D d->arch.sci;
+    if ( IS_ERR_OR_NULL(agent_channel) )
+        return PTR_ERR(agent_channel);
+
+    channel =3D get_channel_by_id(HYP_CHANNEL);
+    if ( IS_ERR_OR_NULL(channel) )
+        return PTR_ERR(channel);
+
+    hdr.id =3D SCMI_BASE_SET_DEVICE_PERMISSIONS;
+    hdr.type =3D 0;
+    hdr.protocol =3D SCMI_BASE_PROTOCOL;
+
+    tx.agent_id =3D agent_channel->agent_id;
+    tx.device_id =3D scmi_devid;
+    tx.flags =3D SCMI_ALLOW_ACCESS;
+
+    ret =3D do_smc_xfer(channel, &hdr, &tx, sizeof(tx), &rx, sizeof(&rx));
+    if ( IS_ERR_VALUE(ret) )
+        return ret;
+
+    ret =3D check_scmi_status(rx.status);
+    if ( IS_ERR_VALUE(ret) )
+        return ret;
+
+    return 0;
+}
+
+static int scmi_add_dt_device(struct domain *d, struct dt_device_node *dev=
)
+{
+    uint32_t scmi_devid;
+
+    if ( (!scmi_data.initialized) || (!d->arch.sci) )
+        return 0;
+
+    if ( !dt_property_read_u32(dev, "scmi_devid", &scmi_devid) )
+        return 0;
+
+    printk(XENLOG_INFO "scmi: dt_node =3D %s\n", dt_node_full_name(dev));
+
+    return scmi_add_device_by_devid(d, scmi_devid);
+}
+
+static int scmi_relinquish_resources(struct domain *d)
+{
+    int ret;
+    struct scmi_channel *channel, *agent_channel;
+    scmi_msg_header_t hdr;
+    struct reset_agent_tx {
+        uint32_t agent_id;
+        uint32_t flags;
+    } tx;
+    uint32_t rx;
+
+    if ( !d->arch.sci )
+        return 0;
+
+    agent_channel =3D d->arch.sci;
+
+    spin_lock(&agent_channel->lock);
+    tx.agent_id =3D agent_channel->agent_id;
+    spin_unlock(&agent_channel->lock);
+
+    channel =3D get_channel_by_id(HYP_CHANNEL);
+    if ( !channel )
+    {
+        printk(XENLOG_ERR
+               "scmi: Unable to get Hypervisor scmi channel for domain %d\=
n",
+               d->domain_id);
+        return -EINVAL;
+    }
+
+    hdr.id =3D SCMI_BASE_RESET_AGENT_CONFIGURATION;
+    hdr.type =3D 0;
+    hdr.protocol =3D SCMI_BASE_PROTOCOL;
+
+    tx.flags =3D 0;
+
+    ret =3D do_smc_xfer(channel, &hdr, &tx, sizeof(tx), &rx, sizeof(rx));
+    if ( ret )
+        return ret;
+
+    ret =3D check_scmi_status(rx);
+
+    return ret;
+}
+
+static void scmi_domain_destroy(struct domain *d)
+{
+    struct scmi_channel *channel;
+
+    if ( !d->arch.sci )
+        return;
+
+    channel =3D d->arch.sci;
+    spin_lock(&channel->lock);
+
+    relinquish_scmi_channel(channel);
+    printk(XENLOG_DEBUG "scmi: Free domain %d\n", d->domain_id);
+
+    d->arch.sci =3D NULL;
+
+    mem_deny_access(d, channel->paddr, PAGE_SIZE);
+    spin_unlock(&channel->lock);
+}
+
+static bool scmi_handle_call(struct domain *d, void *args)
+{
+    bool res =3D false;
+    struct scmi_channel *agent_channel;
+    struct arm_smccc_res resp;
+    struct cpu_user_regs *regs =3D args;
+
+    if ( !d->arch.sci )
+        return false;
+
+    agent_channel =3D d->arch.sci;
+    spin_lock(&agent_channel->lock);
+
+    if ( agent_channel->func_id !=3D regs->r0 )
+    {
+        res =3D false;
+        goto unlock;
+    }
+
+    arm_smccc_smc(agent_channel->func_id, 0, 0, 0, 0, 0, 0,
+                  agent_channel->chan_id, &resp);
+
+    set_user_reg(regs, 0, resp.a0);
+    set_user_reg(regs, 1, resp.a1);
+    set_user_reg(regs, 2, resp.a2);
+    set_user_reg(regs, 3, resp.a3);
+    res =3D true;
+unlock:
+    spin_unlock(&agent_channel->lock);
+
+    return res;
+}
+
+static const struct dt_device_match scmi_smc_match[] __initconst =3D
+{
+    DT_MATCH_SCMI_SMC,
+    { /* sentinel */ },
+};
+
+static const struct sci_mediator_ops scmi_ops =3D
+{
+    .probe =3D scmi_probe,
+    .domain_init =3D scmi_domain_init,
+    .domain_destroy =3D scmi_domain_destroy,
+    .add_dt_device =3D scmi_add_dt_device,
+    .relinquish_resources =3D scmi_relinquish_resources,
+    .handle_call =3D scmi_handle_call,
+};
+
+REGISTER_SCI_MEDIATOR(scmi_smc, "SCMI-SMC", XEN_DOMCTL_CONFIG_ARM_SCI_SCMI=
_SMC,
+                      scmi_smc_match, &scmi_ops);
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
--=20
2.27.0

