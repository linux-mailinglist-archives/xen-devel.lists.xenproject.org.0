Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C503473F91
	for <lists+xen-devel@lfdr.de>; Tue, 14 Dec 2021 10:34:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.246487.425113 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mx4Cp-0007w3-2q; Tue, 14 Dec 2021 09:34:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 246487.425113; Tue, 14 Dec 2021 09:34:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mx4Co-0007p2-Tp; Tue, 14 Dec 2021 09:34:42 +0000
Received: by outflank-mailman (input) for mailman id 246487;
 Tue, 14 Dec 2021 09:34:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qXUZ=Q7=epam.com=prvs=298265c1fe=oleksii_moisieiev@srs-se1.protection.inumbo.net>)
 id 1mx4Cm-0007JG-Ta
 for xen-devel@lists.xenproject.org; Tue, 14 Dec 2021 09:34:41 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 341575b3-5cc0-11ec-85d3-df6b77346a89;
 Tue, 14 Dec 2021 10:28:32 +0100 (CET)
Received: from pps.filterd (m0174682.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1BE943EG004675;
 Tue, 14 Dec 2021 09:34:35 GMT
Received: from eur05-db8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2107.outbound.protection.outlook.com [104.47.17.107])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3cxraag3uw-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Dec 2021 09:34:35 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com (2603:10a6:102:ea::23)
 by PA4PR03MB6976.eurprd03.prod.outlook.com (2603:10a6:102:e4::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Tue, 14 Dec
 2021 09:34:27 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::85d2:c8aa:2196:21c6]) by PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::85d2:c8aa:2196:21c6%9]) with mapi id 15.20.4778.018; Tue, 14 Dec 2021
 09:34:27 +0000
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
X-Inumbo-ID: 341575b3-5cc0-11ec-85d3-df6b77346a89
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UwnGUl9bX6i59s6B7qkAKXp2jvEk4m7FzejG+a51nPdxUmLM/UBuMP9Z4IyX3NzazUlxzRvPAm8CsE8l4BrWmg1ZC/s3ine+LIUY5e4ebh2wJ2jawc5NwvluPjX4ZBcrQQ3AwQHmPKTXRLR0CUFA1HYjBzVqE0HgkbwimfbmbDzWS4HubPke9bqMhXvUNKoCp2Sp3V3pgC/MwyvB7vQMJSK0d+9qfXL6xcETr6oxk6IqYKiqEggHDczWqoXFsYb7aXVwDHupBWznBoi+DKqtcjkvLCs0XNr2sUrASSHLyj3nyeJmzcj1ufzpkQRPxjFO4HEDgKN8luqIyxv3Hwbl/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RqDx/qBEgEJtOnIYy1d9FCWR8MG1fPXkQ1whSTJXTl0=;
 b=h5II6aVCW9LhIQ0pcInCCgzIW9lD0XJZ+6e/hPWM5IF7INA5AGmj6HMFZ1G/Kj2c/kqT6WpD7d94pbrxw2NeXtZnSGdqkEyS442DNNbK36HTJCo5ChJ71YBoR63M47dj0a6WpyBvWl63sFtMWQVppsp6JGI4sUD85eD7cJ/PwVjYDuUapESz2WUzs0piisObrveiAZqtZPeIFX8jZvY04rSFAQ/Na4JYL+10AE9wzKJK/2mG268hNdh6ggS91n4f6GrJ9COB8bKvB9r5KCANBmpj0dh1ipWxdz5veDCoUCf+oaB3rHup596GhKfbotFZ5AW/aF/OukbPhAgkNtq2TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RqDx/qBEgEJtOnIYy1d9FCWR8MG1fPXkQ1whSTJXTl0=;
 b=S2qouYjWnD58sLL8Daum0iLSgcv0bumf18ECt3jQopfj51OJx+IdRDc5l7TDqryrN6YQbT//YHOVX4XY6znp+W72rdS2YgrbLKODk4AdOClSuhfu8aUnXRUmROER+T9N6DWU7PPduBmLAhcjowZzVIUuVKDsjsGFugj9wZq8wO4zL23gKfv6CWVA3MQ67XEUhyRgCynnS5SOgGDFwId4Io8+ZzsnoUzIPGROMSJ88dkja2JLX4bGKHHwdmoH/pP4+/lNzlu8bLxwlb4gIbLXhpyCc+eaQen8ppz4WzElGfi4dyYVb1M6qCU5i/+PlwX0Hs9mSdBRTQfC57s8Bk2oKw==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>,
        Stefano Stabellini
	<sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Bertrand Marquis <bertrand.marquis@arm.com>
Subject: [RFC v1 3/5] xen/arm: introduce SCMI-SMC mediator driver
Thread-Topic: [RFC v1 3/5] xen/arm: introduce SCMI-SMC mediator driver
Thread-Index: AQHX8M3JF7Ng56/tV0+8/7pODiaWfA==
Date: Tue, 14 Dec 2021 09:34:27 +0000
Message-ID: 
 <e9dadd96aa5b64b9232e10a083ce393af620adde.1639472078.git.oleksii_moisieiev@epam.com>
References: <cover.1639472078.git.oleksii_moisieiev@epam.com>
In-Reply-To: <cover.1639472078.git.oleksii_moisieiev@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ca2bd1b1-d2d6-4e69-31af-08d9bee4ec24
x-ms-traffictypediagnostic: PA4PR03MB6976:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <PA4PR03MB6976A3FC83739D5FC3B491B3E3759@PA4PR03MB6976.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2512;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 QwNPoH92G8HviE3JqVCX0MMKrkRnBlo95OojdFpOxpxXsoVZb7ZxL7H/ygk4JxkgBoRJQ6b5pp1fIajW4hwT9UHWaXRp79JW9o8s8mMhhA0x0q+nOjdP27JF2ydYhvlnMqUuAGsTxxFFpuWIj+bxUtIK4cOU0a/EAkNUkaKoxPPndinnZod7nuM5MGRyKxsPKfYAiMsj3RhBgDmkJAhvPrRmPOQ3aIqG6px0u8lYeXT01LnNuctFRF9s2vcJPXPp8dIFKAwoWg6+Mnud2Nyz1ZEJtpzyXIn5PBKzpZdgv/0ZIfTBFzbWQftJRcsVuGW+iBZnsoku8ckB7tFedt6Qobjgynd5UYrSxiDF9VnpDwV1jt6Ce1lF4Q1KweMX0TeycvHNeCYKhWrCBBtE6xD7vUl0/68atdi1l/fxRd0porCLQUzR3R7fzNKtAhcJFEoXlL5o1OHB/LCfIfebEiqV5CkPNJOhu7E7sh39xzpCguWgkdJ7BkTtlNOTk8cyPJPhyEb/tWGiMz+5TtrS6CZQ11pvAJmFvyksYAOI1rSD2AI6B9uyD1wJgjylvsje4vEQJO9IFNXpwzOge8rLPJa9sUe3hBvsGkGazQ1BtXEAIVCcDNn5GHLz77CilsrZEFiSxkmFrMMWnzCDdY0OplHZQXWFFPz3qVzPqoAJSA89vcYq1bk5OrdUlzaYusbewIdGhz52t/HeTHHV95ll+m/DKHz0umTQN3PPopKikkk58z4=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR03MB7136.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66476007)(64756008)(66556008)(66946007)(26005)(66446008)(76116006)(5660300002)(91956017)(508600001)(86362001)(83380400001)(186003)(30864003)(6916009)(4326008)(2906002)(6486002)(38070700005)(8936002)(2616005)(36756003)(71200400001)(8676002)(38100700002)(122000001)(6512007)(6506007)(316002)(54906003)(2004002)(579004)(559001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?ACcJU8qchTVDnGm/rPhClN22iecsD0+V2QbTOgNWdsKL/Cejigh3DRJ3Pv?=
 =?iso-8859-1?Q?XIyAesdLAQ6gDvzH5dsc3M5B09HfVVXVq2T4De2gAktQYjykZS3ouW8P9C?=
 =?iso-8859-1?Q?g3opwMiO8C9wI86nQa1Hsj610D09VQp6u2y41s0868gFLQHoxrar0d+zJ5?=
 =?iso-8859-1?Q?WTMF5SZ2nPwC6ZJar178KTkDgSZomff0FXmx0IUSH81VPkr/S21aECD2gS?=
 =?iso-8859-1?Q?xMbf5JhrxndxZGaWCRXBNYhXRc1pK6twGx160H221H7bhKd0R32MN7+4Fg?=
 =?iso-8859-1?Q?ptuFuud3p1LXL5VjFV8WQijEGSIo2lP2d8TRlbZFthO5JjCzl+PtQpilvB?=
 =?iso-8859-1?Q?GekbmuzL+C/7cw6AJZ4igt4KS7hYDo6NoXWHK7eBEuKNXZ4RhZUR7Bk6jk?=
 =?iso-8859-1?Q?0+an3vCkO2hpJmy5WcKwLv64EN+Mpnb4YfPdc1sRDh2cND/rj3rSnlsjaJ?=
 =?iso-8859-1?Q?RG5N/SgJCO5eTgJYQBsEeedK7iofMmokZIXfQYxLNqqKxzoB7iF2dV8Azz?=
 =?iso-8859-1?Q?ryOAwfxiO7ck/enc79YIGzHWasu/3mZDGJeXg3uFCjYAWG/zWmoHdGTNmV?=
 =?iso-8859-1?Q?JQceO4Ctzor8JEWchAR46xx0zFDGK80GGTjxQxgooIr7wjoszL26clKeem?=
 =?iso-8859-1?Q?n01N+EVJxCKnVHn4iW4y4F1SlXDsDy7IsLIEoEfPBQ153Nn2g+1j41bfrY?=
 =?iso-8859-1?Q?I2OrxFG1wvjWlUFAPurQetQ90BBx/qsTuTkChFxfFOwap/zM7HeKqjWvAW?=
 =?iso-8859-1?Q?4dYXaos5V3w3mRtFxbzUXqIVNNtt9/31c0qvV1SJzoqbFiJg3wNzeJ3iAd?=
 =?iso-8859-1?Q?maRmhLjXfYuF46kVIROqaS4WgF1b+bLKfrymq4xn37XLLRPpvSwlztEtk6?=
 =?iso-8859-1?Q?5mfZ/YI0sGdL3VwvjqrOdOCS1tpRsLnENA97k4M5T8bWQSZH2ViiEvUsRn?=
 =?iso-8859-1?Q?7KWsK9BgWSSfDhxXA+R1KYFQTLoy2PCzAUbJ3AUOBnmJNp43Cz8cBals2S?=
 =?iso-8859-1?Q?xns2rLGKR0mkDpFXA2RWM5KqQc+pgBB2PXNVcGMnOZdk6rQOvOJEUDgdP8?=
 =?iso-8859-1?Q?JhqaJPh9DwV4xCPABe+ivJTdajly+QRnhiDm0SsTKFs/ZJP2o6Jf6P8s7q?=
 =?iso-8859-1?Q?ylNqom3IjOpXVPYj5R1DapIQBQJz2nsCs3nUhvqDgYhDMBGZhhDrK0BFyS?=
 =?iso-8859-1?Q?qYH9U7WWYyyoO721FXhD6nKGI2M6rlnT923RLwhQCSMGTLoxi2KFD7OzJs?=
 =?iso-8859-1?Q?PVeQ34ZQiHcCujPHSJxswAdOdy+8tvTCJbhom4105LCtw2YPidOHyydeT/?=
 =?iso-8859-1?Q?gYh13GT2WevJCQZs2LkNmHC4XsmBXIIg3hDvJ8570DbLV8hjH0O1djQAXs?=
 =?iso-8859-1?Q?+y2IxcCw0sFfUS286qR5uXRI8LWTdrA4ZkB5vRBatX3dBKpEhyipiLKfD/?=
 =?iso-8859-1?Q?D0aWaI6PhWnIWpiPvFqPy71xCiqxYL/cLqu+YlEjMhDDrmSnWEV6CPSb9V?=
 =?iso-8859-1?Q?tVZI4DPpX1+1TTBrNNul3Nu8xbZrtMpJ9ibs78QddRoFB333515WJLxsNe?=
 =?iso-8859-1?Q?pjYS9K0ZYxxCwTU4T2vwpDqNL0WmRspyklpgjw1fzEuyqy7w0ABT5XUm2W?=
 =?iso-8859-1?Q?n7GHZcyoqL/HD/rulG0TPuIKoLfw4L4yY2kVu4tbups7jSnp/NL0XhvYcT?=
 =?iso-8859-1?Q?CEv61RpeMkN3x2y79sW+UVPdhdRy6VPTCNKwtz3ixXKk3JtuaGlJDoB/UN?=
 =?iso-8859-1?Q?MrswuMkvL+lEVJEz9XlcBllJA=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR03MB7136.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca2bd1b1-d2d6-4e69-31af-08d9bee4ec24
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Dec 2021 09:34:27.2470
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: srjvjyhM4KXgTORbS998EPN9Xp8+YAyT1IeXfJ44QFbEe6qaThdp+G2XjhWMoXb460rZLmaCbQlIVi1SLiJl4vZglk82YAM1byWvxiop6NU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB6976
X-Proofpoint-ORIG-GUID: bnENPmIRLNVAf6yDf1GfFMAyvJYcr5gA
X-Proofpoint-GUID: bnENPmIRLNVAf6yDf1GfFMAyvJYcr5gA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-14_05,2021-12-13_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxscore=0
 bulkscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112140054

This is the implementation of SCI interface, called SCMI-SMC driver,
which works as the mediator between XEN Domains and Firmware (SCP, ATF etc)=
.
This allows devices from the Domains to work with clocks, resets and
power-domains without access to CPG.

The following features are implemented:
- request SCMI channels from ATF and pass channels to Domains;
- set device permissions for Domains based on the Domain partial
device-tree. Devices with permissions are able to work with clocks,
resets and power-domains via SCMI;
- redirect scmi messages from Domains to ATF.

Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
---
 xen/arch/arm/Kconfig          |   2 +
 xen/arch/arm/sci/Kconfig      |  10 +
 xen/arch/arm/sci/Makefile     |   1 +
 xen/arch/arm/sci/scmi_smc.c   | 795 ++++++++++++++++++++++++++++++++++
 xen/include/public/arch-arm.h |   1 +
 5 files changed, 809 insertions(+)
 create mode 100644 xen/arch/arm/sci/Kconfig
 create mode 100644 xen/arch/arm/sci/scmi_smc.c

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 186e1db389..02d96c6cfc 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -114,6 +114,8 @@ config SCI
 	  support. It allows guests to control system resourcess via one of
 	  SCI mediators implemented in XEN.
=20
+source "arch/arm/sci/Kconfig"
+
 endmenu
=20
 menu "ARM errata workaround via the alternative framework"
diff --git a/xen/arch/arm/sci/Kconfig b/xen/arch/arm/sci/Kconfig
new file mode 100644
index 0000000000..9563067ddc
--- /dev/null
+++ b/xen/arch/arm/sci/Kconfig
@@ -0,0 +1,10 @@
+config SCMI_SMC
+	bool "Enable SCMI-SMC mediator driver"
+	default n
+	depends on SCI
+	---help---
+
+	Enables mediator in XEN to pass SCMI requests from Domains to ATF.
+	This feature allows drivers from Domains to work with System
+	Controllers (such as power,resets,clock etc.). SCP is used as transport
+	for communication.
diff --git a/xen/arch/arm/sci/Makefile b/xen/arch/arm/sci/Makefile
index 837dc7492b..67f2611872 100644
--- a/xen/arch/arm/sci/Makefile
+++ b/xen/arch/arm/sci/Makefile
@@ -1 +1,2 @@
 obj-y +=3D sci.o
+obj-$(CONFIG_SCMI_SMC) +=3D scmi_smc.o
diff --git a/xen/arch/arm/sci/scmi_smc.c b/xen/arch/arm/sci/scmi_smc.c
new file mode 100644
index 0000000000..2eb01ea82d
--- /dev/null
+++ b/xen/arch/arm/sci/scmi_smc.c
@@ -0,0 +1,795 @@
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
+#define SCMI_SHARED_MEMORY                 "linux,scmi_mem"
+#define SCMI_SHMEM                         "shmem"
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
+typedef struct scmi_perms_tx {
+    uint32_t agent_id;
+    uint32_t device_id;
+    uint32_t flags;
+} scmi_perms_tx_t;
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
+struct scmi_channel {
+    int chan_id;
+    int agent_id;
+    uint32_t func_id;
+    int domain_id;
+    uint64_t paddr;
+    struct scmi_shared_mem *shmem;
+    spinlock_t lock;
+    struct list_head list;
+};
+
+struct scmi_data {
+    struct list_head channel_list;
+    spinlock_t channel_list_lock;
+    bool initialized;
+    u64 shmem_addr, shmem_size;
+};
+
+static struct scmi_data scmi_data;
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
+static int send_smc_message(struct scmi_channel *chan_info,
+                            scmi_msg_header_t *hdr, void *data, int len)
+{
+    struct arm_smccc_res resp;
+    int ret;
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
+        memcpy((void *)(chan_info->shmem->msg_payload), data, len);
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
+    }
+
+    return -EINVAL;
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
+        memcpy(data, chan_info->shmem->msg_payload, recv_len);
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
+        if ( curr->chan_id =3D=3D chan_id )
+        {
+            found =3D true;
+            break;
+        }
+
+    spin_unlock(&scmi_data.channel_list_lock);
+    if ( found )
+        return curr;
+
+    return NULL;
+}
+
+static struct scmi_channel *get_channel_by_domain(uint8_t domain_id)
+{
+    struct scmi_channel *curr;
+    bool found =3D false;
+
+    spin_lock(&scmi_data.channel_list_lock);
+    list_for_each_entry(curr, &scmi_data.channel_list, list)
+        if ( curr->domain_id =3D=3D domain_id )
+        {
+            found =3D true;
+            break;
+        }
+
+    spin_unlock(&scmi_data.channel_list_lock);
+    if ( found )
+        return curr;
+
+    return NULL;
+}
+
+static struct scmi_channel *aquire_scmi_channel(int domain_id)
+{
+    struct scmi_channel *curr;
+    bool found =3D false;
+
+    ASSERT(domain_id !=3D DOMID_INVALID && domain_id >=3D 0);
+
+    spin_lock(&scmi_data.channel_list_lock);
+    list_for_each_entry(curr, &scmi_data.channel_list, list)
+        if ( (curr->domain_id =3D=3D DOMID_INVALID)
+            && (curr->chan_id !=3D HYP_CHANNEL) )
+        {
+            curr->domain_id =3D domain_id;
+            found =3D true;
+            break;
+        }
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
+    spin_lock(&scmi_data.channel_list_lock);
+    ASSERT(channel !=3D NULL);
+    channel->domain_id =3D DOMID_INVALID;
+    spin_unlock(&scmi_data.channel_list_lock);
+}
+
+static struct scmi_channel *smc_create_channel(uint8_t chan_id,
+                                               uint32_t func_id, uint64_t =
addr)
+{
+    struct scmi_channel *channel;
+    mfn_t mfn;
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
+    mfn =3D maddr_to_mfn(addr);
+    channel->shmem =3D vmap(&mfn, 1);
+    if ( !channel->shmem )
+    {
+        xfree(channel);
+        return ERR_PTR(ENOMEM);
+    }
+
+    printk(XENLOG_DEBUG "scmi: Got shmem after vmap %p\n", channel->shmem)=
;
+    channel->paddr =3D addr;
+    channel->shmem->channel_status =3D SCMI_SHMEM_CHAN_STAT_CHANNEL_FREE;
+    spin_lock_init(&channel->lock);
+    spin_lock(&scmi_data.channel_list_lock);
+    list_add(&channel->list, &scmi_data.channel_list);
+    spin_unlock(&scmi_data.channel_list_lock);
+    return channel;
+}
+
+static int map_memory_to_domain(struct domain *d, uint64_t addr, uint64_t =
len)
+{
+    return iomem_permit_access(d, paddr_to_pfn(addr),
+                paddr_to_pfn(PAGE_ALIGN(addr + len -1)));
+}
+
+static int unmap_memory_from_domain(struct domain *d, uint64_t addr,
+                                     uint64_t len)
+{
+    return iomem_deny_access(d, paddr_to_pfn(addr),
+                paddr_to_pfn(PAGE_ALIGN(addr + len -1)));
+}
+
+static int dt_update_domain_range(struct domain *d, uint64_t addr,
+                                  uint64_t size)
+{
+    struct dt_device_node *shmem_node;
+    __be32 *hw_reg;
+    const struct dt_property *pp;
+    uint32_t len;
+
+    shmem_node =3D dt_find_compatible_node(NULL, NULL, "arm,scmi-shmem");
+
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
+        vunmap(curr->shmem);
+        list_del(&curr->list);
+        xfree(curr);
+    }
+
+    spin_unlock(&scmi_data.channel_list_lock);
+}
+
+static __init bool scmi_probe(struct dt_device_node *scmi_node)
+{
+    struct dt_device_node *shmem_node;
+    int ret, i;
+    struct scmi_channel *channel, *agent_channel;
+    int n_agents;
+    scmi_msg_header_t hdr;
+    struct rx_t {
+        int32_t status;
+        uint32_t attributes;
+    } rx;
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
+    shmem_node =3D dt_find_node_by_name(NULL, SCMI_SHARED_MEMORY);
+    if ( IS_ERR_OR_NULL(shmem_node) )
+    {
+        printk(XENLOG_ERR
+               "scmi: Device tree error, can't parse shmem phandle %ld\n",
+               PTR_ERR(shmem_node));
+        return false;
+    }
+
+    ret =3D dt_device_get_address(shmem_node, 0, &scmi_data.shmem_addr,
+                                &scmi_data.shmem_size);
+    if ( IS_ERR_VALUE(ret) )
+        return false;
+
+    channel =3D smc_create_channel(HYP_CHANNEL, func_id, scmi_data.shmem_a=
ddr);
+    if ( IS_ERR(channel) )
+        return false;
+
+    hdr.id =3D SCMI_BASE_PROTOCOL_ATTIBUTES;
+    hdr.type =3D 0;
+    hdr.protocol =3D SCMI_BASE_PROTOCOL;
+
+    ret =3D do_smc_xfer(channel, &hdr, NULL, 0, &rx, sizeof(rx));
+    if ( ret )
+        goto clean;
+
+    ret =3D check_scmi_status(rx.status);
+    if ( ret )
+        goto clean;
+
+    n_agents =3D FIELD_GET(MSG_N_AGENTS_MASK, rx.attributes);
+    printk(XENLOG_DEBUG "scmi: Got agent count %d\n", n_agents);
+
+    n_agents =3D (n_agents > scmi_data.shmem_size / PAGE_SIZE) ?
+        scmi_data.shmem_size / PAGE_SIZE : n_agents;
+
+    for ( i =3D 1; i < n_agents; i++ )
+    {
+        uint32_t tx_agent_id =3D 0xFFFFFFFF;
+        struct {
+            int32_t status;
+            uint32_t agent_id;
+            char name[16];
+        } da_rx;
+
+        agent_channel =3D smc_create_channel(i, func_id, scmi_data.shmem_a=
ddr +
+                                           i * PAGE_SIZE);
+        if ( IS_ERR(agent_channel) )
+        {
+            ret =3D PTR_ERR(agent_channel);
+            goto clean;
+        }
+
+        hdr.id =3D SCMI_BASE_DISCOVER_AGENT;
+        hdr.type =3D 0;
+        hdr.protocol =3D SCMI_BASE_PROTOCOL;
+
+        ret =3D do_smc_xfer(agent_channel, &hdr, &tx_agent_id,
+                          sizeof(tx_agent_id), &da_rx, sizeof(da_rx));
+        if ( ret )
+            goto clean;
+
+        ret =3D check_scmi_status(da_rx.status);
+        if ( ret )
+            goto clean;
+
+        printk(XENLOG_DEBUG "scmi: status=3D0x%x id=3D0x%x name=3D%s\n",
+                da_rx.status, da_rx.agent_id, da_rx.name);
+
+        agent_channel->agent_id =3D da_rx.agent_id;
+    }
+
+    scmi_data.initialized =3D true;
+    return true;
+
+clean:
+    free_channel_list();
+    return ret =3D=3D 0;
+}
+
+static int scmi_domain_init(struct domain *d)
+{
+    struct scmi_channel *channel;
+    int ret;
+
+    if ( !scmi_data.initialized )
+        return 0;
+
+    channel =3D aquire_scmi_channel(d->domain_id);
+    if ( IS_ERR_OR_NULL(channel) )
+        return -ENOENT;
+
+    printk(XENLOG_INFO "scmi: Aquire SCMI channel id =3D 0x%x , domain_id =
=3D %d"
+           "paddr =3D 0x%lx\n", channel->chan_id, channel->domain_id,
+           channel->paddr);
+
+    if ( is_hardware_domain(d) )
+    {
+        ret =3D map_memory_to_domain(d, scmi_data.shmem_addr,
+                                   scmi_data.shmem_size);
+        if ( IS_ERR_VALUE(ret) )
+            goto error;
+
+        ret =3D dt_update_domain_range(d, channel->paddr, PAGE_SIZE);
+        if ( IS_ERR_VALUE(ret) )
+        {
+            int rc =3D unmap_memory_from_domain(d, scmi_data.shmem_addr,
+                                              scmi_data.shmem_size);
+            if ( rc )
+                printk(XENLOG_ERR "Unable to unmap_memory_from_domain\n");
+
+            goto error;
+        }
+    }
+
+    d->arch.sci =3D channel;
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
+    scmi_perms_tx_t tx;
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
+    agent_channel =3D get_channel_by_domain(d->domain_id);
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
+    unmap_memory_from_domain(d, channel->paddr, PAGE_SIZE);
+    spin_unlock(&channel->lock);
+    return;
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
+    if ( agent_channel->func_id !=3D regs->x0 )
+    {
+        printk(XENLOG_ERR "scmi: func_id mismatch, exiting\n");
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
+static int scmi_get_channel_paddr(void *scmi_ops,
+                           struct xen_arch_domainconfig *config)
+{
+    struct scmi_channel *agent_channel =3D scmi_ops;
+
+    if ( !agent_channel )
+        return -EINVAL;
+
+    config->sci_agent_paddr =3D agent_channel->paddr;
+    return 0;
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
+    .get_channel_info =3D scmi_get_channel_paddr
+};
+
+REGISTER_SCI_MEDIATOR(scmi_smc, "SCMI-SMC", XEN_DOMCTL_CONFIG_SCI_SCMI_SMC=
,
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
diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
index 9180be5e86..a67237942d 100644
--- a/xen/include/public/arch-arm.h
+++ b/xen/include/public/arch-arm.h
@@ -315,6 +315,7 @@ DEFINE_XEN_GUEST_HANDLE(vcpu_guest_context_t);
 #define XEN_DOMCTL_CONFIG_TEE_OPTEE     1
=20
 #define XEN_DOMCTL_CONFIG_SCI_NONE      0
+#define XEN_DOMCTL_CONFIG_SCI_SCMI_SMC  1
=20
 struct xen_arch_domainconfig {
     /* IN/OUT */
--=20
2.27.0

