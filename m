Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06D9B78D049
	for <lists+xen-devel@lfdr.de>; Wed, 30 Aug 2023 01:20:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.592512.925273 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qb808-0007dl-Mh; Tue, 29 Aug 2023 23:20:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 592512.925273; Tue, 29 Aug 2023 23:20:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qb808-0007Wf-I2; Tue, 29 Aug 2023 23:20:00 +0000
Received: by outflank-mailman (input) for mailman id 592512;
 Tue, 29 Aug 2023 23:19:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y18t=EO=epam.com=prvs=36058b40d2=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1qb806-0007EX-Ou
 for xen-devel@lists.xenproject.org; Tue, 29 Aug 2023 23:19:58 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 906de3b4-46c2-11ee-8783-cb3800f73035;
 Wed, 30 Aug 2023 01:19:56 +0200 (CEST)
Received: from pps.filterd (m0174682.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 37TFMk9n021983; Tue, 29 Aug 2023 23:19:54 GMT
Received: from eur05-db8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2108.outbound.protection.outlook.com [104.47.17.108])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3ssdvpbm4f-9
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Aug 2023 23:19:54 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by AM7PR03MB6371.eurprd03.prod.outlook.com (2603:10a6:20b:1b8::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35; Tue, 29 Aug
 2023 23:19:47 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::9d42:8444:f00d:7895]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::9d42:8444:f00d:7895%4]) with mapi id 15.20.6699.034; Tue, 29 Aug 2023
 23:19:47 +0000
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
X-Inumbo-ID: 906de3b4-46c2-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NFNvxgSYc7546OdTijmQX44mWvoH4tcLfFaU9etjqk16saqG/2vvNZuHwPYOFNxVYYZiavhrGkXxfHcHy9C8+xMgyoFoUIs0GmrFJFs4akMsUyjoL/F6BSDYO2R/C0v2ieE2SZA6sNkq0Kue3i1s3ZwcaUxswZPbcwkv/ht7z0ebblhGsA9JEgTIQibsviN7uptXXVcelUqHuKNFW1xhI4yEjRwy/E2GQuGgpiybbMKPAUw+vz245GjFk4uL2a97oHoXf+/Nh1hLGhMyZTjmea0iLtTbi9u5TETjCFgqwt0SvBZWzHOUJJrlvJPhiD0vaNP6iDIEr5pBCzunYR4VvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9RSd6gDogowC6YhVNDeraATH9brdfi3Ahv2ppWZqTGA=;
 b=atcBiMjCfxvymrQ4SJ0twGA54cS7eYzAlura4+BMruMC4SzahHXr/fdCX7aSgfU6NNo9H8R0J8khXoTTqgMbgBig7HojyEjLAM78Yna6hIhv6IEmQT5uXNWSTZqr3n22rxNYPle+Cltp5YIaWiJJG8Y0R0DCkqEzA5K9d/41jY2DlGnfNuo59tT2EmBFFAqHkW45ncO9GNrklrPHrBYZIO5o8D5DoI3FvYmrywwYe2pNZaJmU7/HOkGHC/YBNl+6KRIugZUBN08Y1OrbHUySa7Dwc/9fu53GXQfmRWZ9TCPBbqktSBuUHj8DtaPc/rabrPx1BsQxjkFR1vcUno4JTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9RSd6gDogowC6YhVNDeraATH9brdfi3Ahv2ppWZqTGA=;
 b=I2jgfL5DnVKAf1ygP4cdznYC0z/K09yDnV7bNh+A/HYc3CTIugtY8EDQzwojAEMr/n9XQVWAeThbpAH37OpxRK7iKjVf2UkR5LM/oMV9yCOv1dGHtKYgoqaVb+mvE5vjeBwuAxnRYSZtCQxycKtODT/aaO3VDDYAiXDXH9vla63VubOMt3hMiidJ8t9uLKpKAt458y/YszA+mN+oHDxrYt7LKEkXslgQn+5/Fwq6qiDBb/YOLBgvl6NNP2bB3Ml1SC1Vbjb/EIFykcZebaZbmZvYL0G04UzZgQkggTiBXOKpmLHX+2+lPEIpW2JbbuOv/sL90lef01kXJMabnsIiHQ==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>,
        =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v9 11/16] vpci/header: reset the command register when adding
 devices
Thread-Topic: [PATCH v9 11/16] vpci/header: reset the command register when
 adding devices
Thread-Index: AQHZ2s9MXPBeWfv85UCGprRCw+JOTA==
Date: Tue, 29 Aug 2023 23:19:45 +0000
Message-ID: <20230829231912.4091958-12-volodymyr_babchuk@epam.com>
References: <20230829231912.4091958-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20230829231912.4091958-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.41.0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|AM7PR03MB6371:EE_
x-ms-office365-filtering-correlation-id: 7fe41a12-c778-4505-0a99-08dba8e66f85
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Khx25rAAxPb5tewtTg56lJepyiILqmxKrWLWqy1AYR0tEnVJ8xZCAS1jhafIpaREn3Ew5AIlLHe91+AESZf8v4LdHZx97VRUqs39kpyGuEBNvXRjehvU3+ausJWkdHFDYkfjMxLFqiQxkVrGWhjE0BuoyiUmiA1YG6EpXnHG32YBsXNLgbii3orGellZlL6dyrKcV0xzJpalZThVjI/uKfHJPlb8/Th0WQSJiDZZM0fmNsMVWHJ2TCF+IUyb6s+C9jdT950dkYdAOJUu8blbERcNXD6rRfiW8rN1lnRKjXoASp5S2FJLFbDwx5S3mJ+lkGWliRB7D1ury6uTKcxkSErYVagUI9GSJ24HPYpXOm9wa6uKJ09zBYtB512KQcAyoFdS9tNgaYlzzV4WNZKrYpGtoxBNPt43lHE4hEXVoG5idE+o40Voi3XdfKUvOzJjtuI1hjub/JWUaSwvp4GtXUVvuhUzwnwdmax6WUA6snzfsoUIXX/32kpvywTb+K+Vp9ZIzMMeR2yRn1BhHlknQ+eVqLHEhCru8GpaeGeGaWgZBOBmP9G5q1qOmQCpHzu6TJ9kPJKDBFKrWC2nH3BD2qhQVUEMbu6hJZ4KhSfE3+OYJBRo8g2Il3bB2e+WtSU3
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(376002)(396003)(136003)(366004)(451199024)(1800799009)(186009)(71200400001)(6512007)(6506007)(6486002)(478600001)(55236004)(76116006)(1076003)(2616005)(107886003)(26005)(2906002)(6916009)(64756008)(66446008)(54906003)(316002)(5660300002)(66476007)(66556008)(91956017)(66946007)(41300700001)(83380400001)(8936002)(4326008)(8676002)(36756003)(38070700005)(38100700002)(86362001)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?kKVjg2jz1fMVhMkci3qaTCO5RXnT2hxuIhVQVDTpnRumPOqtHX7kqcRZNz?=
 =?iso-8859-1?Q?4gBLGbNp8yAtUFdIWd7Rg8x8OQBMxrHkYYVR01e9RlSMwMoBFkQZqAW3a1?=
 =?iso-8859-1?Q?P03ycvzU4SAzOf43q+fNaabmA9miI6CAH6SBx3xPyRoSdJ68A/FIbGwfqt?=
 =?iso-8859-1?Q?J/jAqzMg5ujnSz3Y51IJ5l3hmw0+l1onCDwPT63IqEFwRY7wA71aMfy2so?=
 =?iso-8859-1?Q?gGgcnmeyb8LxoyB4xE8pddHkT3IIaLTnHL2TYqTmUwsVgk/Qvaf0/v6clK?=
 =?iso-8859-1?Q?1RgG2VfmXVU9tf0mCGl2EfFlWIWs+tA1TY2GoNHyMiUtdVbzDHL252mlqL?=
 =?iso-8859-1?Q?Ygd4XvikyDNLVG2EgoVrfv7e8ug8XpblP7awshlXY1Fu02gyUaRglYV4qa?=
 =?iso-8859-1?Q?mmXgw2REaGF/m7XKrgF4ocqxRsGfplMk1E8B3XDRhyPPZgE2BtyNWQ4I5q?=
 =?iso-8859-1?Q?/rtze5125XmP9ptNL4M3fu1THndUxBapgUnMFeSOgCmTxnabmZIzyU9au+?=
 =?iso-8859-1?Q?LBvISciGyHLHrZ7GH6tQL3zBhKTHjM4SLR1ZiSQg9TAxhLLvddwlpvYXm3?=
 =?iso-8859-1?Q?4XSStH2KOlEFkLEbewaVBbezTvmKWOUvMOc/KfmO//WS8myBXd9V+ZoAWa?=
 =?iso-8859-1?Q?jw6qOPxB+RLQEoQHNIuUWDvOjONkx9MxSnFG5Hifv8nFR1otuQpk1xGiDI?=
 =?iso-8859-1?Q?RGeHyzRgcpwYr1y9NLtkZvRssXF1VqFqLGilZ9XR0sz9fOWpA4WxY+wwQl?=
 =?iso-8859-1?Q?HVcHSpf45TMMdnlgL/BsEcZmETjG3BlJ4dlTSLPS9hhJ2Mph3RC4kV/1GS?=
 =?iso-8859-1?Q?f73mTCjFZ0aXKKgfUlz/1nUAOkYiz9Lc3U++TolGtIU20uEiohkq4tQy/0?=
 =?iso-8859-1?Q?Uk2a9YtQ1PslPgEp/FKtPjcd1BphV4oZ/ZQH+hMOCbODmvp1fb+B/L5nCW?=
 =?iso-8859-1?Q?1W/Qmn2ViJF2Mp1LgWQNlJ9pqXMzvExY9xshwDfmpGBJzT6kNvYnHm6gM0?=
 =?iso-8859-1?Q?OLHD9O3zJ/GcjuwxLQ6zQCQeTxBjKzh82wJ4DdZlzuGR/ZLpJdFgEkazH6?=
 =?iso-8859-1?Q?ij4jKZqzfX4t5jkhWpRL4o02M26hR/FWWXm9XQkA/nJWpSocqx16CLtiqZ?=
 =?iso-8859-1?Q?CgflUHkNNoOUfgpkPVrX6dCFSlELztZIXUstcH819Tls7Pc9kMvsGnf65+?=
 =?iso-8859-1?Q?yDBi2W/ASMkg36nZYvsAzwesvTWyNObxy3im2u4DRYOqSvAI90QNwifIIf?=
 =?iso-8859-1?Q?s4PL6DPK3qyd5o9rcIoqm9rnoXUGSw5D+M3IleAVfSMQ+A/PoSYG/bKEP/?=
 =?iso-8859-1?Q?+QmGVG/CGKApwUxI0d/4X7x/JVMLp6mkrpt3jofixwWOUVJ0/YrQCUbxAL?=
 =?iso-8859-1?Q?HZEjf6mz6E/XaPZUT8aGHUMpe9Z93zB+X///CyNlC/uIozEVTygdUIut83?=
 =?iso-8859-1?Q?aL68tYSg9j5EPk3CQzWC2eVNAdAfuNLUoWEM1soyrXVsMoVhsxMxIKdyW6?=
 =?iso-8859-1?Q?ddeZMpzQ5WJ+peu3qXzlgrN9u0bQw8yauh5Mc5JPP7W59bmbX6FI0WEWIX?=
 =?iso-8859-1?Q?JfBnKRbXxsWNfSvM05o33+q79+VNK0j035b8MOqguIUO/EBTp3/W90qLOZ?=
 =?iso-8859-1?Q?J8q49OuKkVonlqV0pjFvTQajEqVSBd+bgEEyNC4hy/HUZqreFwKN5gdg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fe41a12-c778-4505-0a99-08dba8e66f85
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2023 23:19:45.7988
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bZCU0z54kkWGdCZrSNmr86fffomPYbPYVxkN/dRFcei4yxubJXWfxl/MwisPI2rSQVtN3JntZKSrwBx8d1ekNhoH5fjzOo4W9eN4zVcHkwM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR03MB6371
X-Proofpoint-ORIG-GUID: MQgBqpkbI7iOVGkXuVffYd7iKFg8BBkZ
X-Proofpoint-GUID: MQgBqpkbI7iOVGkXuVffYd7iKFg8BBkZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-29_16,2023-08-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 mlxscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0 mlxlogscore=999
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2308290202

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Reset the command register when assigning a PCI device to a guest:
according to the PCI spec the PCI_COMMAND register is typically all 0's
after reset, but this might not be true for the guest as it needs
to respect host's settings.
For that reason, do not write 0 to the PCI_COMMAND register directly,
but go through the corresponding emulation layer (cmd_write), which
will take care about the actual bits written. Also, honor value of
PCI_COMMAND_VGA_PALETTE value, which is set by firmware.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
---
Since v9:
- Honor PCI_COMMAND_VGA_PALETTE bit
Since v6:
- use cmd_write directly without introducing emulate_cmd_reg
- update commit message with more description on all 0's in PCI_COMMAND
Since v5:
- updated commit message
Since v1:
 - do not write 0 to the command register, but respect host settings.
---
 xen/drivers/vpci/header.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index e351db4620..1d243eeaf9 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -762,6 +762,12 @@ static int cf_check init_bars(struct pci_dev *pdev)
         return -EOPNOTSUPP;
     }
=20
+    /* Reset the command register for guests. We want to preserve only
+     * PCI_COMMAND_VGA_PALETTE as it is configured by firmware */
+    cmd =3D pci_conf_read16(pdev->sbdf, PCI_COMMAND);
+    if ( !is_hwdom )
+        cmd_write(pdev, PCI_COMMAND, cmd & PCI_COMMAND_VGA_PALETTE, header=
);
+
     /* Setup a handler for the command register. */
     if ( is_hwdom )
         rc =3D vpci_add_register(pdev->vpci, vpci_hw_read16, cmd_write, PC=
I_COMMAND,
@@ -776,7 +782,6 @@ static int cf_check init_bars(struct pci_dev *pdev)
         return 0;
=20
     /* Disable memory decoding before sizing. */
-    cmd =3D pci_conf_read16(pdev->sbdf, PCI_COMMAND);
     if ( cmd & PCI_COMMAND_MEMORY )
         pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd & ~PCI_COMMAND_MEMOR=
Y);
=20
--=20
2.41.0

