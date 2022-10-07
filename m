Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97FF65F76E8
	for <lists+xen-devel@lfdr.de>; Fri,  7 Oct 2022 12:33:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.417692.662503 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogkfM-0008AK-40; Fri, 07 Oct 2022 10:33:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 417692.662503; Fri, 07 Oct 2022 10:33:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogkfK-0007wl-Lv; Fri, 07 Oct 2022 10:33:14 +0000
Received: by outflank-mailman (input) for mailman id 417692;
 Fri, 07 Oct 2022 10:33:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uvLM=2I=epam.com=prvs=22797713c5=mykyta_poturai@srs-se1.protection.inumbo.net>)
 id 1ogkfA-0004P4-HN
 for xen-devel@lists.xenproject.org; Fri, 07 Oct 2022 10:33:04 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6bc43563-462b-11ed-964a-05401a9f4f97;
 Fri, 07 Oct 2022 12:33:03 +0200 (CEST)
Received: from pps.filterd (m0174680.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 297AP2K3008629;
 Fri, 7 Oct 2022 10:33:00 GMT
Received: from eur01-db5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2053.outbound.protection.outlook.com [104.47.2.53])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3k208bupyg-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Oct 2022 10:33:00 +0000
Received: from VI1PR03MB3758.eurprd03.prod.outlook.com (2603:10a6:803:33::29)
 by DBBPR03MB6716.eurprd03.prod.outlook.com (2603:10a6:10:207::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.38; Fri, 7 Oct
 2022 10:32:54 +0000
Received: from VI1PR03MB3758.eurprd03.prod.outlook.com
 ([fe80::77e8:5cf6:210:7273]) by VI1PR03MB3758.eurprd03.prod.outlook.com
 ([fe80::77e8:5cf6:210:7273%5]) with mapi id 15.20.5676.038; Fri, 7 Oct 2022
 10:32:54 +0000
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
X-Inumbo-ID: 6bc43563-462b-11ed-964a-05401a9f4f97
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=luFEI+qQMoIWiYFBrabotg1JzwDYEbP3HlDTqs0Bsfs3D3yPzeT88AmvMgejj+QjaVOGJHAJhe/jGHHgs4WD6S44VlmwHM3zMMJxB9kqUFCeQiOy5yT36rFvMNzXylr/KI23NhUak5dnowduj92vQqVsY6/dgTIQn/P4Xhw8d0ZFzFFNJlRXzUMKCRBi4jnilLoxaTNjzVUADUunImNBYBx90Q9BsLDX3lRt4GOpP44kAHLWS98cZh9ft84Zryhd+ODww+6vDbZQBHVkehd7a8phbCf1rMFhfQ+Y2RMii+uWIbYQkyMLYcXikhvR7bsFx6EjG9Q7A00WTZBrx9X5bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l/O4J5C7W0TXxhhwyyXIZrFFLgHA9mzwFIl98tctyyM=;
 b=JAH1/Bf9hBO1EmYjWG96fVbWUs+nTMXc+529YFhxZGTvTgW0DMJuIXCg8MlsnO7TJnHXJP3VTDpGYm/dDzz0ph0xsmdLY7MCMP0qa0Kv0bwXeOpwoDL4uD6fqLauzl4vhrQ74iZCpNaPAMeZgX4Pj/FoFeyvf/iILe2BL3Fmg2nzZdJc0uNRR+Y9cUY4b1eeadln25T7m+aAzJS9jgj8sm4Oe+B+2BYzRCHwgiFizCcsNAirFVuGsfS2Eep/ol/CGBvGf459Q1YjvdrhYeeKzTeI8+Ai1Mfnz58Hzh9sGQ01uu9Lor24wRZDDJmnIFEXtw+EOFCJkyb0RWRZmjws3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l/O4J5C7W0TXxhhwyyXIZrFFLgHA9mzwFIl98tctyyM=;
 b=YePPQsBvjVYnDInnG6sujRFYOc7LbmeNlyv1BaRqiv3nPYx7YK5gHJ2QKrGbAmlIia+lYgGr24upEW3OMhR4nrlJ5q5GP+BAF9bN9agEkTCGRtE3sp+WgwjuSzlrq4K+boS6u5Ap0bjBBu28wU6Tc+5Ie3/boLctreMjJiixyj/rLQsVA2j9QkVFykPQsfk32WKci3hqAjh1/FO8xVmOctGv+nbm4d8vd7nC/J7UwR7y5Zy4FrVc0u4hD4zZEPDqdn48EORtl+by/SrrVyCORVJ50dz583IJDf5ogGQoojiLvwYU1i5VIBapNyv6Ux8jzkrNMDGpW+sk2mKSiA9Quw==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mirela Simonovic <mirela.simonovic@aggios.com>,
        Stefano Stabellini
	<sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Saeed Nowshadi <saeed.nowshadi@xilinx.com>
Subject: [PATCH 16/19] xen/arm: Suspend/resume console on Xen suspend/resume
Thread-Topic: [PATCH 16/19] xen/arm: Suspend/resume console on Xen
 suspend/resume
Thread-Index: AQHY2jgmltStcpUKEUSAkPaRlzuavQ==
Date: Fri, 7 Oct 2022 10:32:50 +0000
Message-ID: 
 <a3dc2fe24f8f474a3976f4b307a693e359e910d5.1665137247.git.mykyta_poturai@epam.com>
References: <cover.1665137247.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1665137247.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3758:EE_|DBBPR03MB6716:EE_
x-ms-office365-filtering-correlation-id: 7b8c9611-5c07-4ff5-cc51-08daa84f4b17
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 zwMCtSxttXwEff5MqwTdTSd7zmw6E5kEBzmGspGVpb4T7K/OTK3+/2dGPET/v8Bu701mRt/LypzvU4VyHjeQptFUz8MeiEAIdVULNpBCqsRBt2QU4Zs7x6s6QBl25zPWoi69k6AJa31JeeD2qZRFGU3gRaK9xJkns1QCfvH0U7tPA3Xg3y4mWOuCs3vw/getRcraUY1H23Uxrn778gQ8qaCpyJlNYtMhOvg1p3lI2XQIqDsPU/AeFAzvZGTTU7snsDx8AUI2pDPyAy/4HNY/mhZbIxiGTVJSAD/ENKGoIlk+wRQa+rgmpmSMZOqEAtlHHDXidrTQyuFXpT7QYzHEfptQDLiwtZAMmUYdJY4VjBq1Ox+c6v2q6OuEgM7Vr/G4GpQtLON1r6TkTQa5mf7+qUR1OA8Gg1Jhu2/ovqY+o4s3JqShvx4SLn/0mrvSKwilQtIA9Crngp4Ljm511unUmtE2uqXDY87LG6NJbAa6zgfz+au2CXCu8kILFB5QiBwojhWBENpi/BACa6wv7MxA9dk74sgXbs6kEwYntjgeCso/ywuQ57vq0Ie5aBp+Z1Vy3/KNXjXSCH2NUNhI7gV/ZVXWubedIe42AYgRtd7OHhx3cOutgn003hrxnLz74OW876MQ8KIXp8iijM+doVqSX7CxfKOIR3hW6hq942/1yQOGB4Np35R3B6s3kDyDUhgsYLa9ZUhuErpRpqbKBhVM7tgqyNI15twG40lnQuy73BG111+KVLlcBs/0PPJ2zn+Q0Ekvzbbb+NQUzTe93PBxNg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3758.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(396003)(366004)(376002)(346002)(451199015)(2616005)(186003)(83380400001)(38100700002)(38070700005)(122000001)(41300700001)(15650500001)(2906002)(5660300002)(8936002)(55236004)(6486002)(26005)(6666004)(71200400001)(6506007)(316002)(478600001)(8676002)(54906003)(76116006)(91956017)(4326008)(64756008)(66446008)(66476007)(66946007)(66556008)(6916009)(6512007)(36756003)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?RLP+jj4iA39jVfIQJ9bTcMB+i/97uN9tZODvEdGAvt20/qVbnoknpKlI+Z?=
 =?iso-8859-1?Q?+YxjHAJNQ02PeX13rB0dojn2+rZod/ELVRoktoY3G4gxTSQpn8unitn+ic?=
 =?iso-8859-1?Q?HvrAISqjEeaMufsvWZr47tp3xrOKDPZq9Js9qcetJfFGOrRzrGM8jcwXEQ?=
 =?iso-8859-1?Q?Dp5+MmY99V1si/Y1o9O/mcZQTmy8iS5ohUvNxlmkTKOcAlGLTqz+4wqeq2?=
 =?iso-8859-1?Q?12RGJzGOK7VGd3HljA2kH9UiVxfZQJ63st+NMGwj11eZIMhM1CazOf6a6q?=
 =?iso-8859-1?Q?RiJJdG9h23N8T2nzJeZv6Vwnkd5h1ajg3ZMIB3EqSclB83c7UtQ4340avp?=
 =?iso-8859-1?Q?mj9jLB52NNTBK0uew5Cm66qB/ic+CoXFfb/O0pHgqjHe4xeo6la71H/CjT?=
 =?iso-8859-1?Q?pObWHWgXU/ic2fuiEm7ufcV6IlVpBlXOwJHD1zLxsKd8+wZKjuLI52ooFn?=
 =?iso-8859-1?Q?73OihRrVnPCCN1PSeZWmERrYqIaUvPfPiLANQyqkO+Q19jJQpzfZ2875Sg?=
 =?iso-8859-1?Q?VZimFqIaFu5dPKLyj8LyuZD+L5VEedAP9znHSSuINhk7ZEIrOtFN9Ni7KH?=
 =?iso-8859-1?Q?N24Fpsyha71faRrVHegJ9Dln+puLOtinqFFUyaL6JZaA27BXO7nv64BbF/?=
 =?iso-8859-1?Q?5McWq1Aji6jhjzienrN3M+FdWbddenwddZhseOF5wU1f6qjHyXJHjMAdhZ?=
 =?iso-8859-1?Q?eC5xBRP2S5CjLBynQuacDp34aSfVPrqx5XrjEoB1lFvp0p6oGOVjdk46U0?=
 =?iso-8859-1?Q?268UriiP3amZiA1gZET3okiM2nUWQPjWs1Clwzr4ypMG1JKz4BzdMxpwMv?=
 =?iso-8859-1?Q?RC+1krLHCNIoiwDvs8Wx4EQRcbcxGVNggKyZZIj8DwK8YJny/nHQEWiE4U?=
 =?iso-8859-1?Q?yOrk3OpsNpDtjproQvqCxTBkOzdUDiExPkVVYsjRD7iErxA2wSLKEDfd2i?=
 =?iso-8859-1?Q?6m0ON1UEYzKJDt1WWQ4r7BHuY+l7nKjqSfWr5Cer1bUkYS51UUc9cABx8h?=
 =?iso-8859-1?Q?ClInbQndvoShz6Ten2OIrMoRxIXMzUVppVY5KQQ0SbVEG+FA1Y84hCzr0j?=
 =?iso-8859-1?Q?e762K1m9vt8fJGUulK0UXxzkjWqiDLjSE2l46yO7vJIp5CWSMBr2KL66K0?=
 =?iso-8859-1?Q?lLRFqpwDGuZKSOZ/8uZVPfo40ju7jOTTb9sya0M2YMjNubiYs0jKA+Fzuu?=
 =?iso-8859-1?Q?26qNEoioWaQt4KSUOs4jK7F13G5T5KzeDsCqxUF0MvPK7ElXlHP5JWAqTL?=
 =?iso-8859-1?Q?RPDCbfDb0+7+yaiL3/x6fqFMwMzxbkNFalBqmypqhe572tCcrkH3vN+53A?=
 =?iso-8859-1?Q?0HLjnuuY2ZO0cRiYYGUXE9Rw4KJsEPF5FSys7KNTh5SsgLBTo7hsI+5+Qe?=
 =?iso-8859-1?Q?AIFd00jUM61xwJfOb0UD5C7fcmlN6j2+VxzYseyLUIEOlIzJc1EIcrkNRb?=
 =?iso-8859-1?Q?/KrpM2VSC7QoKBjeZOC/KKl6vV98Rc+FeTReVkwtHVKEB3SFHuOaRqUHSf?=
 =?iso-8859-1?Q?ZHXevN9J1j36lYPAuI1v3N9JNEB4B2oq/HOp8aUE4yGMjLSNxT8S2xl0Q1?=
 =?iso-8859-1?Q?g5fsuCjHG7QxXr+Eut2yOnkPS5trfRPE/bCWpFhm3/h5dzc+N94UBPQIvZ?=
 =?iso-8859-1?Q?0zC3ES8bDrzJIz0o/on9BsJWsz47YXB0DpXBw46HSYf4o31KBbTQZ3CA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3758.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b8c9611-5c07-4ff5-cc51-08daa84f4b17
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2022 10:32:50.7863
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P9wDr/WWKnLegaxkz/yvxyESAyLGyoPKiLCIUKJeSXoAT0hwlv14aQWVjolQs/w8K1cz8tXybqcN7vEGZ1k3Gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR03MB6716
X-Proofpoint-GUID: ooEga1gzhCCwLWDCb3ycrn8mnY-708Jy
X-Proofpoint-ORIG-GUID: ooEga1gzhCCwLWDCb3ycrn8mnY-708Jy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-06_05,2022-10-07_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 mlxlogscore=718 adultscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210070064

From: Mirela Simonovic <mirela.simonovic@aggios.com>

This is done using generic console_suspend/resume functions that cause
uart driver specific suspend/resume handlers to be called for each
initialized port (if the port has suspend/resume driver handlers
implemented).

Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>
---
 xen/arch/arm/suspend.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/xen/arch/arm/suspend.c b/xen/arch/arm/suspend.c
index 4a690eac3b..cf3aab0099 100644
--- a/xen/arch/arm/suspend.c
+++ b/xen/arch/arm/suspend.c
@@ -14,6 +14,7 @@
=20
 #include <xen/sched.h>
 #include <xen/cpu.h>
+#include <xen/console.h>
 #include <asm/cpufeature.h>
 #include <asm/event.h>
 #include <asm/psci.h>
@@ -166,6 +167,15 @@ static long system_suspend(void *data)
         goto resume_irqs;
     }
=20
+    dprintk(XENLOG_DEBUG, "Suspend\n");
+    status =3D console_suspend();
+    if ( status )
+    {
+        dprintk(XENLOG_ERR, "Failed to suspend the console, err=3D%d\n", s=
tatus);
+        system_state =3D SYS_STATE_resume;
+        goto resume_console;
+    }
+
     if ( hyp_suspend(&cpu_context) )
     {
         status =3D call_psci_system_suspend();
@@ -192,6 +202,10 @@ static long system_suspend(void *data)
      */
     mmu_init_secondary_cpu();
=20
+resume_console:
+    console_resume();
+    dprintk(XENLOG_DEBUG, "Resume\n");
+
     gic_resume();
=20
 resume_irqs:
--=20
2.37.1

