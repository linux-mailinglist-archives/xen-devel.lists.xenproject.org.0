Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 678F27E7C4F
	for <lists+xen-devel@lfdr.de>; Fri, 10 Nov 2023 13:57:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.630297.983036 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1R3w-0002Go-Bq; Fri, 10 Nov 2023 12:56:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 630297.983036; Fri, 10 Nov 2023 12:56:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1R3w-00029Z-5y; Fri, 10 Nov 2023 12:56:40 +0000
Received: by outflank-mailman (input) for mailman id 630297;
 Fri, 10 Nov 2023 12:56:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sssJ=GX=epam.com=prvs=567869e99b=mykyta_poturai@srs-se1.protection.inumbo.net>)
 id 1r1R3u-0001y0-5l
 for xen-devel@lists.xenproject.org; Fri, 10 Nov 2023 12:56:38 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 93db860f-7fc8-11ee-9b0e-b553b5be7939;
 Fri, 10 Nov 2023 13:56:35 +0100 (CET)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3AACIeeh019156; Fri, 10 Nov 2023 12:56:28 GMT
Received: from eur01-db5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2051.outbound.protection.outlook.com [104.47.2.51])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3u9kkyram6-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Nov 2023 12:56:27 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by DB3PR0302MB9063.eurprd03.prod.outlook.com
 (2603:10a6:10:43d::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29; Fri, 10 Nov
 2023 12:56:21 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::f172:7877:386b:8dc0]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::f172:7877:386b:8dc0%6]) with mapi id 15.20.6954.029; Fri, 10 Nov 2023
 12:56:21 +0000
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
X-Inumbo-ID: 93db860f-7fc8-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UrsWcyC+UHEaDmnvbeJWM9HFzQmmECxldzd2ClYbqQzk7JjcADZxwH6bw9LW3VukH+gtGh4+JtA4INF4EVPwrpotFlJS79nbifrlZYWHM9RSwxs0ulYFjJETu5ehthZ9g3dauKUmmPWENUbUxMvGJcE7dr9BBkaGWQEZ0Y+BIRC/bfGoWN2nTpK70Fnj74TucuF1kdoVtiYHU/CRrY7/oVTfN0Fp9b/dO8QGR4tGKAsK+uW2ADHQ4I02TZtAj3ICSZSkKR/Uny5+EX1/vp1bfmjq9TFIwvSauZJB51akX6SOotUFVobbh95LBA9bVs+iodlTTfq1ixlR9Ixhq1ohsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tSPiK95kipwtC6I3hCNGMy/9HCeBgCvnJ9pxXmqknj8=;
 b=Psc6iroDwQtFqLtYz573AVV7yZunO7S4gd7JQ7SeOvKWGn6wabdMfpBk70pVoys0v2Vd8ZIB3cMgA3RzXHYx0F8zuMtuAfJZL1DfHLqZZlmyUHW+hA+GaHGDqC2PVIidextaPsH2HEAN//SJvgHG0e+lBdMoDGJCMZv6SIsVcAt6RYnDy6yIPfTkecUMvWnl0n4/G1m387/pSCNO4UX5OnEQgUpUzzMgND8u6AIh+SF5HdfzWI50+kedcvqWxjf7tkGBON3zyPxAQQJfPw0RizvELhQz15M0ldcgqO1Sz7SzEcKmWOTJE8uRM4nqEYHZdca4f/hO2CtM2NBaqq+iKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tSPiK95kipwtC6I3hCNGMy/9HCeBgCvnJ9pxXmqknj8=;
 b=oPxJDntyaL5kEP7JdZcQQWjO7HLQfvhDDUfQRgv4B8PBBlmsLvGat5fIgfXbEo8uYU9zWq+RuqaNHdnptguWRSMlanmdyVwVDWqYfy8Q0opoqlFfTbv1JZP+85q6ZJLCLQVafYuXNd7C7kcagFJLI+gjvN1hxS4+6dRgjAu7GmpPJWoUXEApOH+fsDQeAAOBPlsn3mmJ7EEpc7G8CPrrjlnqWUJKJR/oAHm6buz6ZafwsP42SmgOARm4QYo8wivdVu9mjJE8UKJOhdiO5JvdN8DkCEo39ivIXvPrnWGVWDwfku98r9/lG6hOnX/Zu0Mf6h+XNq5lV7MqLqEDTLAcyQ==
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
Subject: [XEN PATCH v2 12/25] arm: new VGIC: Wire new GICv3 into the build
 system
Thread-Topic: [XEN PATCH v2 12/25] arm: new VGIC: Wire new GICv3 into the
 build system
Thread-Index: AQHaE9VMxtczAj4WwUSEIvU5E74CCQ==
Date: Fri, 10 Nov 2023 12:56:20 +0000
Message-ID: 
 <17d6dd8df0ca5fa60429dcfbc8c089b88b0085ba.1699618395.git.mykyta_poturai@epam.com>
References: <cover.1699618395.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1699618395.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|DB3PR0302MB9063:EE_
x-ms-office365-filtering-correlation-id: 736c2b3c-2393-4cd9-c009-08dbe1ec7068
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 7dQExTISd4kpFDB61Fr5UN6/XGdZw8mwryck8VRmnK9vDxlNhh2TiEjlh3MSiv5jdAPs/+Heh7o+VMVtgmV7Mr2J3VdMVU3isKgxnQk+bA9iFk+kjo3exEutr7IenjpfZoh5/0vgfPHrnXHBtkGOPx8QFQAVpSS7Q/N4sa0pvdd1ykFlHVtHxlitObIGTbUCQAVrF/XYd32LunaJq5veQs5EJzxHJIE8XczsHMKIAhY1YctFxfK3CfzBCztxZ7F1NGhwzqRUKNGVfyMAGBi15uKpKK4uiVlVKUtw8GElOM37E/spckN+oMXBHr8VmhmFXG3sa3t1/7Akx4ZpLvNiFrQ8rqdP3klno2Y2wSjfow/SvJmTuv2YKvKrZv0QNfWqurL1CEqKcvs4/PhCkCKRB1XiQ6WvG+/3vEotZ2sA8XCEAVz3z6yWICrJ/+ZxVHVPj3SOCF0gLMDAuakv2PDfQY8wJ1IWBVcoTCWTnmikoAdHo8Ujp9f4LRQL313DOi/LqEOtD5xsFwhiU2CX7zQttYdMo8Twq0YdU/wjmM70yryGizsGJqAxfI3mOH+BlIwClDlrxdODdzsDJOCScmk2/OvmaBaV6LB2fLJ7SZ7AdJ8=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(396003)(366004)(376002)(39860400002)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(66556008)(86362001)(6512007)(6506007)(66946007)(66446008)(36756003)(66476007)(8936002)(76116006)(91956017)(8676002)(71200400001)(38100700002)(4326008)(4744005)(26005)(5660300002)(6916009)(2616005)(6486002)(64756008)(316002)(478600001)(54906003)(2906002)(122000001)(41300700001)(83380400001)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?atZFypU/ChBfZlHnuLSbuTPXb7++vH07W4eauYqTW8o3ljfvMTz1nIkldq?=
 =?iso-8859-1?Q?8NJbW0AKJlrTtbV/pFsEbg9BqrZ/wDCkutgxfl12dMAScFrvZtAss7FDEy?=
 =?iso-8859-1?Q?LTgtOdF1fR1Lu6nmA6iwSweudgg3jYNMU8glCLcQmukGeajl2hqC5VA9QK?=
 =?iso-8859-1?Q?XKsIbRtN+MkOmnij9GDzl9DRlSUEW8pQeztuNIuZYAAMQt2c5H3VAZjPe6?=
 =?iso-8859-1?Q?KEvjvE00czGqKpDG9bhYtDYGgurA2hRu/W64EF5YCcUilacQ4JO7PkFh9v?=
 =?iso-8859-1?Q?eyKY39jmX6pTtxfomg9VsJ4oJTDr3KUMHQ+cLNTLTZ9HdXC2XqCL9X6akA?=
 =?iso-8859-1?Q?ldkJ+YjgxT+V5LGip7UU8hqVERY73MYNI/pfHTLMdBMEazH+Apu2ffxyQ3?=
 =?iso-8859-1?Q?87jv+W97TNHXSM24mhB5tlGsIGJz9mXfcV9DbE1lfiEgEsJvuVRH3a4o1y?=
 =?iso-8859-1?Q?60AhFOJXGzyYI/73EAZrLiuWOpNM2uGbvVk81vJYbTF8/CCXHXC52rLBkg?=
 =?iso-8859-1?Q?VMtWipnTZRjDvEdGUOeWIQ7tF9pDSsiunbAYI5c44MJMIJhLnURQ09ftmZ?=
 =?iso-8859-1?Q?2PuJyC41HAz6hRNYTJjy1M5zxbyy+LdvUAFXAIBkWSlyfuGd92BEdiSfoW?=
 =?iso-8859-1?Q?BBMoqhHpQq8OpMWH9M5HXcQpAQmSCslZ3oKg6nvS5FgYg8oQOZiOFNbndE?=
 =?iso-8859-1?Q?Pfa7pRM4M4JM2wxv73SOE78OWHR8ouJmG4awJkq7BLKjWjM5oHWXkcGE9p?=
 =?iso-8859-1?Q?TJzz5YbfZxSQx5FIwdgI+mcvUaTJx3yipLfBstAS9ZY5vWQfXNIgcd7SO9?=
 =?iso-8859-1?Q?Rj2kbw/bTn9Z9BAimor7aWeAwpuVuoxChkiEmu8nfpYc7WPTRwicbBLlLm?=
 =?iso-8859-1?Q?bNGUdYPinIvDxzukDsSAe9o72Wf+X4WqE4H/yjDX7Z8TOasKC8sKOlDsy0?=
 =?iso-8859-1?Q?5omIHUhooBSior2zGCIbh9HQc43NIkjDB6hgtUd6zERQAo4uSP6jUjTngO?=
 =?iso-8859-1?Q?fj7SMGmKRpj2yamWwixXLnITNM/wlvrJtCQ5gajvnY3Dv1bDFQkdhyTW8+?=
 =?iso-8859-1?Q?qU52S07nshBIZGTVt1Ch6lKATGzFXw0XC70y7f6tSCq69Q7agvZPdbUjT5?=
 =?iso-8859-1?Q?FXOGsLLatrJPsh4w4DqQl6QxcIHle69LQgkTYIoAv963MFFSQHZg3vIHer?=
 =?iso-8859-1?Q?9xGOisoki/WT0+qAm1GPjVNrxVDRrcaDdqwRumyBA0SRtSFPwg9bOwXbOp?=
 =?iso-8859-1?Q?W3Ln2qMP0DFVCqo+tA6083gW4H8Vjr+42tNKwh5v3trcnmJ9xIEWvhuXrT?=
 =?iso-8859-1?Q?oLo0KjqiPRM0nus0YOINA1sC7YPtAJUZWhJ8PJh4evUvclqFWtJMcCZOwy?=
 =?iso-8859-1?Q?A7sj6PV9jtTE13LRfqVtOXs5IPSPvG8tTUQ9/TkXs6XnhaxjmC5LjxYqKT?=
 =?iso-8859-1?Q?xZjM3re3+Jx3OglsM983JYv+8Y87ZcUF7a8LBepWAIJ1F4gO/RBCNiz6Fb?=
 =?iso-8859-1?Q?/JXIqB/FPuXotQe8QEMbCmwF/EB10X2Y5+hYABRsEquLyn2ADMId87l6x9?=
 =?iso-8859-1?Q?cualdt79y7TtushDVVp9k4O4Tttuw5AhJLvu403LsII/QxI7LrZXYveRCn?=
 =?iso-8859-1?Q?62uOQfZ96EPAyMQwoqq8H8TZm2IB0Hfa2iOgnJOYpYNdoE9ECkEciIHQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 736c2b3c-2393-4cd9-c009-08dbe1ec7068
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2023 12:56:20.0637
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LoRwKn7GZbK9VlxEyYwN88ksRCE4hClwrEnBYzuGNYXv902l00O3tZB+IgXHtmkRS5HwW1DCGlvyOVuWvxA/0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0302MB9063
X-Proofpoint-GUID: qKrW8wEgGFGBOofE4ce49iJXqA5n41Y6
X-Proofpoint-ORIG-GUID: qKrW8wEgGFGBOofE4ce49iJXqA5n41Y6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-10_08,2023-11-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 suspectscore=0 mlxscore=0 phishscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 mlxlogscore=736 lowpriorityscore=0 impostorscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311100106

Remove !NEW_VGIC dependency from GICV3 config and add new GICv3 files to
the build system.

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
 xen/arch/arm/Kconfig       | 1 -
 xen/arch/arm/vgic/Makefile | 2 ++
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 2939db429b..c91011bc15 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -82,7 +82,6 @@ config ARM_EFI
=20
 config GICV3
 	bool "GICv3 driver"
-	depends on !NEW_VGIC
 	default n if ARM_32
 	default y if ARM_64
 	---help---
diff --git a/xen/arch/arm/vgic/Makefile b/xen/arch/arm/vgic/Makefile
index 806826948e..21a71d2502 100644
--- a/xen/arch/arm/vgic/Makefile
+++ b/xen/arch/arm/vgic/Makefile
@@ -1,5 +1,7 @@
 obj-y +=3D vgic.o
 obj-y +=3D vgic-v2.o
+obj-$(CONFIG_GICV3) +=3D vgic-v3.o
 obj-y +=3D vgic-mmio.o
 obj-y +=3D vgic-mmio-v2.o
+obj-$(CONFIG_GICV3) +=3D vgic-mmio-v3.o
 obj-y +=3D vgic-init.o
--=20
2.34.1

