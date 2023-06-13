Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB5F872DF8F
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jun 2023 12:33:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.548000.855748 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q91KP-0002k6-Ao; Tue, 13 Jun 2023 10:32:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 548000.855748; Tue, 13 Jun 2023 10:32:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q91KP-0002hK-6o; Tue, 13 Jun 2023 10:32:45 +0000
Received: by outflank-mailman (input) for mailman id 548000;
 Tue, 13 Jun 2023 10:32:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aRu4=CB=epam.com=prvs=05285d8c61=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1q91KN-0001il-5u
 for xen-devel@lists.xenproject.org; Tue, 13 Jun 2023 10:32:43 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9f3f632a-09d5-11ee-8611-37d641c3527e;
 Tue, 13 Jun 2023 12:32:41 +0200 (CEST)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35D6YVNj012776; Tue, 13 Jun 2023 10:32:39 GMT
Received: from eur02-db5-obe.outbound.protection.outlook.com
 (mail-db5eur02lp2104.outbound.protection.outlook.com [104.47.11.104])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3r63wtu7t4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Jun 2023 10:32:39 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by DBAPR03MB6520.eurprd03.prod.outlook.com (2603:10a6:10:19d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.46; Tue, 13 Jun
 2023 10:32:33 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::6fa2:d7b8:9bd4:1a51]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::6fa2:d7b8:9bd4:1a51%5]) with mapi id 15.20.6455.045; Tue, 13 Jun 2023
 10:32:33 +0000
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
X-Inumbo-ID: 9f3f632a-09d5-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AgvA5psbN+TuvJGRhDt2W7CS5GkdWCzvP0OkAIV1da5PrXbX/ADzl/+b4A/5Mw0X2jUQGgprsHHicbbX+vqEIwK/76jdawjwZzZjnqTO5ZNLAdDz/w86kkKP+DPjefBdiNK6aEA0LXY3sQgx8UCgCc5OMArLh3Zq7Hv6lfN8tp7t5gP4QbLsc7RPcoNqAU3t6zmUX45wi5zBec9s57xsiqp68ncDCgRqf/MewO54nJq+GV1wmP5fO5AqtiLdRCVbIrGIY0rXIkml9cQ2MmX3/kiqhcnDoF+/bd2sNWlQouLaSJkguOBoFiFHRIrIsKm1NThx6oxo2GEqt4rL1D3DDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zpFpBBN8bFwrHudq+nmPmlQiloYQd/Hb7VVwCBKtEtE=;
 b=GC7Iymgspayv3LQlo4XrEF6QQcT0HVcv5ACEcEZNIcC46cpApW5VvjxOX3Lxs9dLl9Av6b+hEfkulZHBkq2ecOlSqVs5CVyDeT98Mcu3oGSSc2HB33v5DxLHujsrmzHV+nMtREbfLiDZsoWwbIH4KKUMb7lH7SmwosfeDrdxgh3lKgTxAHfMYg6zu9sBAgy11SmT+0J6GyzYGFoRWerQBL5jKLxaC67ALr4lHhU0FLCo1bmxkNYfw3JCQrNQVoLH6MkavjmwQNAXkk/ivswOmXtZptLplJtSPd8hm8u6Wv81nyHDnIUBZb7LKBX4B6QNVFCrYa8hKNHdlGANKAVg8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zpFpBBN8bFwrHudq+nmPmlQiloYQd/Hb7VVwCBKtEtE=;
 b=NSwD/ZTk0yDSQvaYm5btDFx29lDQjiroGWQehjuxaNdq/YnJvfjYaOStJPEC9Xo3KEdF7lQMSYPVxzN+DsTkevrBYvHpgCJLwhY2M4X+6reFgxutvVePjX7WlXLzVmLyRM1l4h6m608wXOFA3MSdMdFJaJo0zcaedt05CUMtysLXt3/1aMPjN5McVmTbWILUU5t+93QpG5wvU1MbP/aGvQ/yvmTNSI0iTqNc99cM4h1XNzssXhmMuY4I54pxhi6mnrjByKCckDhn4YAd8A8jnE8WtclCNsznIfTQN1IA9JsBNc3U2b/XM+nQ5AS2bh6chdLLnJNo8hLp8CsBxWpDSQ==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
        =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Subject: [PATCH v7 09/12] vpci/header: reset the command register when adding
 devices
Thread-Topic: [PATCH v7 09/12] vpci/header: reset the command register when
 adding devices
Thread-Index: AQHZneJaX+tcZrSWoECrBLaG3eDtVg==
Date: Tue, 13 Jun 2023 10:32:29 +0000
Message-ID: <20230613103159.524763-10-volodymyr_babchuk@epam.com>
References: <20230613103159.524763-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20230613103159.524763-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.40.1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|DBAPR03MB6520:EE_
x-ms-office365-filtering-correlation-id: 37ad6a5e-679b-41b6-0ed9-08db6bf97fd8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 6cnvfMhNIEq6N8SpldBQaan5Ivytr8rEJS9BjA5Hw7e0LconSNxaUYeGNXH+oLMtWR3sO6lInmth7Om3oF9RZXgqd8Cjtt6q/qaHI8KTJOLc3bUeYRrpC/fN/iUH3v1+EEzgPwXkjrqwqpHP+MMNByfHiRR1cY7a1nWpbiphj60ZRGpIF4wxtFvXg1vf2jVU5j/+bXSDJPahKJadyUDphAdLiRZdF2d5oo+D5aQILMl4s5qNKLw/NILjfazlM61EPu3duZSjGZWLkpdhF2PiZQumDhLLXE2e/qjKcjMz3mR/8uTqpNLdFFqJZZJmojkccYBmsmwpPFhSfDlcnVW+N3D7TlMNx0BWUX+j/bsWY+EpM1e3TtKNNBzRJlSYH607WZwiFP4qizVU7wpSYjuzdOaiLmBcouB/3Hym325RFxSFKpKNs3l0E1jwWnRZBDfe6kvmdVum+B3Nb5oqL+9Z1l+fXHF981tSxfLG7MwhdsSN3+wnXOjJ9cRllb3MZFKvcfT3S6ZOyB+6HpkWjTZGVdNVzXVSeqbajUXm6fXBSqlmQtEW53gnxxTrsicZ3999RhbW3Q8SELfTpBpaD5Wl6ruDLq48cjcUGOrIvmyTrP9wqbgEUK3Ii9RG0pyGnQfx
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(136003)(346002)(376002)(39860400002)(451199021)(6486002)(6666004)(6512007)(36756003)(83380400001)(2616005)(38100700002)(86362001)(38070700005)(122000001)(55236004)(1076003)(6506007)(26005)(186003)(2906002)(66446008)(66476007)(5660300002)(54906003)(8936002)(8676002)(316002)(41300700001)(6916009)(4326008)(66946007)(66556008)(76116006)(91956017)(71200400001)(64756008)(478600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?2qxZQKVStmzJ8UmCks8o73r/iZnrnXcfIjsmgVuG0mBqDJBC9xKCPOC8UK?=
 =?iso-8859-1?Q?wx8sE3+yv0BICW8UAN+fLlPo1SG2lVcb6SIQ/mbQohs6Ml8neYkFN+SIAp?=
 =?iso-8859-1?Q?FTFTUd8bSSVY1wzOTztHekKWXfkn3qJLhuo5DiZzcl7RY7SGKUvhe6kUTn?=
 =?iso-8859-1?Q?NhQBcO9nio0roPCHEhr0Oiv9YuG3/PcDrwfcC5oQmpWeYRVsNRuBog2yGs?=
 =?iso-8859-1?Q?43Dhb6Eaz1jJEzFKQr+RDvfe4W3d4suezS86TKlm/Udt3K7n1iFHs7TYNs?=
 =?iso-8859-1?Q?jcdSWMQ6xLMYQogW7/7qCr7dfdtV3QI+mkzRYOoJlmIlUZ2ky5M441gIg9?=
 =?iso-8859-1?Q?kQnuhHH1ihn93aj41nmSrylEOhT1nAPdv6ITSZiELom06/TAorAVpq8Gxm?=
 =?iso-8859-1?Q?nRsE3YJcZqV15OsPAFjOpGH6BJDvEKcbL4Z+BAe+qpvapVurBWwVgWk3SN?=
 =?iso-8859-1?Q?GoAP0Y749JPO70x2hZWZYzQs4Ec27WGct3Xqeo46ZhRSOhsJRpjZXM+QfD?=
 =?iso-8859-1?Q?llfsicMm4EMAs0Kugqt7mTr+j0mnWiLJMlt/toA4EOBfuQqq9IqghuivQj?=
 =?iso-8859-1?Q?jbwAk5GBZ23Z/F/InmnCRhoVCBB161UBrX62Sgvu2juIIxLsnlpx6y9vNw?=
 =?iso-8859-1?Q?HWytQfdn5Vr/McAJZ/RZBCVVjff/vbVz34P+ulXYoNyP+zfoqjgoHNSceQ?=
 =?iso-8859-1?Q?0IOuOmqvScySNV1/pxFEYNAUYQDeqBVEShwIdnFdkbq/QfTzyrMy2fEilC?=
 =?iso-8859-1?Q?Kbx5PMo8oKRaRbUQ8Z4uszRsMfYxvXCJmzD38LlWKAmgJeHSjDA9OHB8rY?=
 =?iso-8859-1?Q?2vCJDJtZSDRr/UUR9zS82BPB7kIzz3ANMOWktwz2fUYWnpzb0Kp5hzi7GO?=
 =?iso-8859-1?Q?4m5vU3AW7KgXOjn5p2V0l6awIuqAzXNnrtQ7HmvD/0bzPe7kJNEyj/odZG?=
 =?iso-8859-1?Q?wedUFzVbn4taPFI/89zoy+vmN2AdSrzIOddUJIImw9JWUcBb8YU0yoltrs?=
 =?iso-8859-1?Q?PKbzNM5ZC4Cd4tOTC/48lAz44e0t/KCyT062Nx8ZmH+4rJ+3Rd+x0RAVa2?=
 =?iso-8859-1?Q?cC1TgumIcEcqArdady0ERKi1kd9E/wmUCjSJWvtNeASzIIGTfm/b1lFwEL?=
 =?iso-8859-1?Q?QJmVCEPZdv9d+KYHxI5sC7EjgvNKNswDKvPTcJR1uc/4ctN97nb7PzoRON?=
 =?iso-8859-1?Q?7z0oPBLhM94FNJHVsDak1TNxnbhjRL001TlGrkq5BnAUoTgw6IsVfmz9D7?=
 =?iso-8859-1?Q?44wYZB90Cc/qCLnLOk6MRK2IdeKjV39V4ZK+hrYCdsGAEbIjnW+/vMaBoM?=
 =?iso-8859-1?Q?ky3jAZO2mtcw0e4+rnscPp7p9rTjvp6a2iq5+BtOcPcP+gFRjvj3SqjyHN?=
 =?iso-8859-1?Q?1Ieb46nSD6uDQoMvIx64YGGZ3uAI4hrEuUxrHwJuxcT6QSbJ9uOTcfSGEU?=
 =?iso-8859-1?Q?bCT/XvoksTbi+uGPVCrI7MtE9T9xHBG//m8cQgXK63KTgO6XUhXPh0unRm?=
 =?iso-8859-1?Q?j0XwRNkU8qwzG7FcS5VWUOB3g39DK28mnnir9Y3g+0k0BnXMKXip+Lad/F?=
 =?iso-8859-1?Q?dCorT5PadE3TW91bu8sTn0SeHtghmNGtxSAb14w9Zlp6VUs1tJQtQlezat?=
 =?iso-8859-1?Q?Jn1KLynmZb2ESMpKABc/I8SNKZzMuYpRsIvfqLpIqHZrj3+9N7uqey8A?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37ad6a5e-679b-41b6-0ed9-08db6bf97fd8
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2023 10:32:29.2119
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D3tRgYPrW/X/COSN/d26vQQY71bFMVq8ux3nItXVy6u3Ag58FTkXCys3N1U7ktlVPBB9xTMtiAIlJBMoSUgLBt7gRetoWJrDlw46DhxCoBk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR03MB6520
X-Proofpoint-GUID: Q52K87s-lGD9Ee8lFvdXvH4qYj16tVCy
X-Proofpoint-ORIG-GUID: Q52K87s-lGD9Ee8lFvdXvH4qYj16tVCy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-13_04,2023-06-12_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 mlxscore=0 phishscore=0
 mlxlogscore=999 priorityscore=1501 spamscore=0 bulkscore=0 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306130093

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Reset the command register when assigning a PCI device to a guest:
according to the PCI spec the PCI_COMMAND register is typically all 0's
after reset, but this might not be true for the guest as it needs
to respect host's settings.
For that reason, do not write 0 to the PCI_COMMAND register directly,
but go through the corresponding emulation layer (cmd_write), which
will take care about the actual bits written.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
---
Since v6:
- use cmd_write directly without introducing emulate_cmd_reg
- update commit message with more description on all 0's in PCI_COMMAND
Since v5:
- updated commit message
Since v1:
 - do not write 0 to the command register, but respect host settings.
---
 xen/drivers/vpci/header.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index 677b93226c..1021a61ed6 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -728,6 +728,10 @@ static int cf_check init_bars(struct pci_dev *pdev)
      */
     ASSERT(header->guest_cmd =3D=3D 0);
=20
+    /* Reset the command register for guests. */
+    if ( !is_hwdom )
+        cmd_write(pdev, PCI_COMMAND, 0, header);
+
     /* Setup a handler for the command register. */
     rc =3D vpci_add_register(pdev->vpci, cmd_read, cmd_write, PCI_COMMAND,
                            2, header);
--=20
2.40.1

