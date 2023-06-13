Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD1872DF99
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jun 2023 12:33:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.547998.855726 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q91KN-00021X-FN; Tue, 13 Jun 2023 10:32:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 547998.855726; Tue, 13 Jun 2023 10:32:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q91KN-0001rz-4O; Tue, 13 Jun 2023 10:32:43 +0000
Received: by outflank-mailman (input) for mailman id 547998;
 Tue, 13 Jun 2023 10:32:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aRu4=CB=epam.com=prvs=05285d8c61=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1q91KL-0001il-9R
 for xen-devel@lists.xenproject.org; Tue, 13 Jun 2023 10:32:41 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9dc236fc-09d5-11ee-8611-37d641c3527e;
 Tue, 13 Jun 2023 12:32:38 +0200 (CEST)
Received: from pps.filterd (m0174683.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 35DAO5Kb019280;
 Tue, 13 Jun 2023 10:32:36 GMT
Received: from eur05-am6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2106.outbound.protection.outlook.com [104.47.18.106])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3r5yahmgn9-5
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Jun 2023 10:32:35 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by DU0PR03MB9706.eurprd03.prod.outlook.com (2603:10a6:10:44e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Tue, 13 Jun
 2023 10:32:31 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::6fa2:d7b8:9bd4:1a51]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::6fa2:d7b8:9bd4:1a51%5]) with mapi id 15.20.6455.045; Tue, 13 Jun 2023
 10:32:31 +0000
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
X-Inumbo-ID: 9dc236fc-09d5-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cgs50T4PHJFAx6AN472fH7lOQR+CdRNilfvZPfLopN+qB03XMd16Av8PDHKcEA7aVki71QLvF+rSnGkcOJ2dm1776V66xCKjV0goefqyNpFjQu+drV2RenFDiWuFNaJPJFaMr2z6YLpEWUVfuLgh27P7yyWyxZtbE0Wag3e93ADz4rxAIZNV/ciEUW6Ve9N6DZ5KXUX8wUW9DmkxDaFCAKx+BVQGACLmQT8+KQZXIIuDNoPBJVWWGvldR4Rr/eM1JEnopT3U1wmAEm/7sJdDxDpp7r8n82vkI5YkdcN3/rOt4kcRTnd+nWD/kWfPVlW6wKeAmjrLcZHUzuxaeXBsVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bg2Pv1RvB/O+YBpcN1DSr5WA6RwAEpXU/ehRxVBAmd0=;
 b=RY35SzCwv5enZ9PZ9bITKyGeF1ETQx7zrw9inDii+TIDs+yNCLCWYKi9S72nWcBbkI8n7TNFtwfWxDW8vGOyo279Yl7K4abwgn8nbXMwy7gNh3bouNaqQb/5Nr0u4W57H9Y3nIeUZqMqzXPccsCstJGmoU53erFnmBKD//GkNscxUw8dI/rsmz0jgUu7gVl9CCWSt8ScWais+IBW30JtcVs8HZhCBfJT0868HFI5pktuRRgxQHv0eFxZ3uzWlSKyateVBdHThE7XGbO7DR/tXSJqLI3VZvjQZR/IaHb5UCj7y/Ti96UdPsUXY18v6qGLsdrHEhUoQeBOk9GNJJnOlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bg2Pv1RvB/O+YBpcN1DSr5WA6RwAEpXU/ehRxVBAmd0=;
 b=JbmF4h0Xf7gAFIGnbj7Melf6KO/TQRdIFlPHALmaaNQwLFQVkc+TLt9eNBcliedy27x1cptK9Mnv9AWjG7Dh6IY87xa1Q//0ySpGnIklYsT8Z5Rtto+H0VKNfDmqoLiVRIanGX45ZmgcK5E9c0NoA8jOsMaK6ZuB6ZtsYt3IkKoMNueW9+jO3BOGnCOK20Fr1A1x3zWMQj7lQwUcYa1Vr6FAvuSWm0QVnRy2Ri32YEw89OLCIjXoBcmp2EDJCdiFFCpfoQpwPW2ygAVtsABdXu8uuJKm1U1JP5TN8yNiZPkp0nbnrsyZSI1qVFGlkHwijUNXMJOeSWTHopDTyFsmLQ==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
        =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Subject: [PATCH v7 04/12] vpci/header: implement guest BAR register handlers
Thread-Topic: [PATCH v7 04/12] vpci/header: implement guest BAR register
 handlers
Thread-Index: AQHZneJZUi9Iw7CMVkOOSMh1fJDqRg==
Date: Tue, 13 Jun 2023 10:32:27 +0000
Message-ID: <20230613103159.524763-5-volodymyr_babchuk@epam.com>
References: <20230613103159.524763-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20230613103159.524763-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.40.1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|DU0PR03MB9706:EE_
x-ms-office365-filtering-correlation-id: b20dec47-4d7e-411b-c5e1-08db6bf97e42
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 z8ehHA14NksaMzFSB+W1BNxvLxanrInkJas1ZbmAAo0Djkfnozwz5sf13l0WRFrW44SW2+sD0skYVE8miYF0IISf2AlzMYMmtb8v1Fmpe2Pm6ci0aa/oxXAxcy1YYAtksqouF9nQk5L2ULMulZq00q/UkWQhPnm9ktxGcQmK2t4N9EICLb4fVSL9qQJ8V6QwJw+EWT+TtYRO/lu5iJWZYDnGNerDl8PD4FKGDk2EGr0SC3iU9/D3GoDZmM/9gdWS/UtIlE6rpiVsgcI5RDzSSNK6Qs+URPOdqoJDpToLoljEKTzQzSzolgfmIQVIvkzOwW3DkmQI9Ax7i+06n/WFhASbR4VZpuVLtZUv5FZnO2SXEIl9kvWrw6vcmBiOGoeRueTdWXzb0q6bwdA0Qoa/1M8HhzvuhkHsSSsipOaTXlnqvUPhF/fLchGzLPWmIakyS8K6Akcdx3bzrec0XAYjlbFVbnLhe0EUSFTiy4VkpHWuP9hPOYOQ+HoZujfZ0OABkXRk0seUIfqhgVMwhhgFzVszUq82nKXqePaoQ+Vhdr47XiPko6Y6EEICHd3q7Xdl/mXQI+OzoXHbIV+MRibdCqiv+pKCvmdBP4GoDsdW3ihF0Lbh3vHiOLmqR7NQyIKg
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(376002)(136003)(346002)(366004)(451199021)(91956017)(64756008)(76116006)(66556008)(66446008)(4326008)(6916009)(66476007)(71200400001)(5660300002)(66946007)(41300700001)(8936002)(8676002)(316002)(36756003)(54906003)(83380400001)(478600001)(2906002)(6486002)(38100700002)(6666004)(186003)(6506007)(26005)(1076003)(6512007)(86362001)(55236004)(38070700005)(2616005)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?F4y8YE62j4UKdOjD9QiXsexWqs2XZF943gGjyMOkbAOWLaI128DIcDHqh4?=
 =?iso-8859-1?Q?6YkQs6jeuAbDdG1vrsiDmX8HLjkriuD7LZjypofZirbalqnlP38Jutpqy2?=
 =?iso-8859-1?Q?JtON3/afJblrJlzt2Azc8nOE3hiErJEaus8rBWA3tKzhQgJNY8/0WlvW1L?=
 =?iso-8859-1?Q?zj3g/RzWYN8Xi1dfcFzTH376a4SIPQkmG01n4nf3BPqPbIteqU3JodvDm/?=
 =?iso-8859-1?Q?vlCNIllPKFPPPOORufYi29de6Lr/juFcFcTTdK5BMF7WAyWjwsgyTiLvQW?=
 =?iso-8859-1?Q?p9SXh+KwW34UeOgu5CXOIY5PDN5gTILzPDxUcAFJknsOr5Y1bhlRzrfhFw?=
 =?iso-8859-1?Q?KoDxJGflxgQ11YpD6XI0ay9sIrFW3pDL0ptbKzf+sO485elNNV5wqeruNq?=
 =?iso-8859-1?Q?gaV4RJIgyh510OARxAhRvnOczGfZoYSWd/MMd5WIIGcIQbu7V2BXE1ei1/?=
 =?iso-8859-1?Q?UidIcbXu2q/s31tXOnRMg/+AA96NRhkrPKcTkv6ndHpve9ejnVRqAIgCld?=
 =?iso-8859-1?Q?3jRKsasecr1FJ6L/8UUP4NLBEdg5lz9txgeJyTQp9taZsl8ZoFL6qdwVk6?=
 =?iso-8859-1?Q?nasOHwtbpsVeZ9IugXrUK56/iktIzpU5xYSRxXP22ip2xDp/LUxvs1AXAW?=
 =?iso-8859-1?Q?h3CnC55GSSsG5jt8m8V3pGoJ/ZhHRXBREIyyxdjE3sBjn4rzJRNZ0Go0CA?=
 =?iso-8859-1?Q?i3V7vujvAi41n0MlSeSIVkNdpnR1X1PB3mkuEzLu18Qm5BYUd1EkCvQtlt?=
 =?iso-8859-1?Q?u/O+gaikzt3si4GJU6RzIDCmp4rqgstVE4iFdI5dIAgwh0JswzFyYlMv7+?=
 =?iso-8859-1?Q?1323c/PkhwIDbW5WhlSrEaUDpEUYSjl9MB3lF3R3xEC7dI3dbZx8DSux2c?=
 =?iso-8859-1?Q?XIq6ungY3tb49+5eObbJAYV5d5NSBExdsKlqqB7519nz86HPrN5XqpHFlS?=
 =?iso-8859-1?Q?tCg2dQjbSpayMIS/JcqwLjk7UvCeIKnk2hQORgPDuP1Z3Wz9d2JyshpW7D?=
 =?iso-8859-1?Q?InVVxQrsUf+I0/YxYvzJ9GjW1dhJBIFsueqppLpH6NexExwV04Ll8jDRVk?=
 =?iso-8859-1?Q?uYRGjmI+aBJa0wHAfCOd6gXUBIBPh4Qpl2lTvs91HOyqGLHGDL9khYpxFm?=
 =?iso-8859-1?Q?vgUSlH3A4kz0g4adPvuR+F8K5Er+eRwYetSwg9IDff07hRPqYsx6crMBX9?=
 =?iso-8859-1?Q?8DCafzMXSBQ+Iry2fRYFS5I70On1zHJNCpDfJ2paVewZv1JmZVBUk2OiGr?=
 =?iso-8859-1?Q?fDNSzuvJZCBZKx7DJ6/sy2b8+FRNF3mDBLOAeWWfTc/cvXIR6B/Oh3vrUl?=
 =?iso-8859-1?Q?5NHurf1E5fnB8xsATFYFoYRpJw6C1C83l2F+KcIn8LuMyh/6uqGGe7hvy5?=
 =?iso-8859-1?Q?HPddKkD6GbkURniA836tDnThhMU1pAM4nNgi12nMSD+xNqo4CebKf8ADRc?=
 =?iso-8859-1?Q?cPfqaczptK7ylCnEcc1L+wJVTsoa/3L1GIT2+WDH501Fh5GHWpmf1MdBzW?=
 =?iso-8859-1?Q?FTYFCdXxpMLD9hUvL8QUGo8G+dWCtIm77qzBNhJMIlf5UC8OJBMlUE1swQ?=
 =?iso-8859-1?Q?GCCoZQ2YAkEM0dCwbF7XqHV3LvBlNCydUH0nJZ2I6auhiMDWdXr8Jsfrhy?=
 =?iso-8859-1?Q?5tIbm11DIoyv8ALXZGMxcU0YwRNZkfihEsaFsZdzhSiu7o6GjkTzIqGA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b20dec47-4d7e-411b-c5e1-08db6bf97e42
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2023 10:32:27.7897
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hI4cfV7LiUpL7A+QjeL4K/rCOaJOn8GmCYbH/0cSBCvujwvrLnS+oVdkvtKXcIPNoHiDBcHhWnKCu9MVHQU1npa9HRmMH/CrXkILKjTnHi4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB9706
X-Proofpoint-GUID: s_sy44IgshwmrV0AxU46G3B8zEiRkNBi
X-Proofpoint-ORIG-GUID: s_sy44IgshwmrV0AxU46G3B8zEiRkNBi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-13_04,2023-06-12_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 mlxlogscore=999 spamscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2305260000 definitions=main-2306130093

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Add relevant vpci register handlers when assigning PCI device to a domain
and remove those when de-assigning. This allows having different
handlers for different domains, e.g. hwdom and other guests.

Emulate guest BAR register values: this allows creating a guest view
of the registers and emulates size and properties probe as it is done
during PCI device enumeration by the guest.

All empty, IO and ROM BARs for guests are emulated by returning 0 on
reads and ignoring writes: this BARs are special with this respect as
their lower bits have special meaning, so returning default ~0 on read
may confuse guest OS.

Memory decoding is initially disabled when used by guests in order to
prevent the BAR being placed on top of a RAM region.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
---

Since v6:
- unify the writing of the PCI_COMMAND register on the
  error path into a label
- do not introduce bar_ignore_access helper and open code
- s/guest_bar_ignore_read/empty_bar_read
- update error message in guest_bar_write
- only setup empty_bar_read for IO if !x86
Since v5:
- make sure that the guest set address has the same page offset
  as the physical address on the host
- remove guest_rom_{read|write} as those just implement the default
  behaviour of the registers not being handled
- adjusted comment for struct vpci.addr field
- add guest handlers for BARs which are not handled and will otherwise
  return ~0 on read and ignore writes. The BARs are special with this
  respect as their lower bits have special meaning, so returning ~0
  doesn't seem to be right
Since v4:
- updated commit message
- s/guest_addr/guest_reg
Since v3:
- squashed two patches: dynamic add/remove handlers and guest BAR
  handler implementation
- fix guest BAR read of the high part of a 64bit BAR (Roger)
- add error handling to vpci_assign_device
- s/dom%pd/%pd
- blank line before return
Since v2:
- remove unneeded ifdefs for CONFIG_HAS_VPCI_GUEST_SUPPORT as more code
  has been eliminated from being built on x86
Since v1:
 - constify struct pci_dev where possible
 - do not open code is_system_domain()
 - simplify some code3. simplify
 - use gdprintk + error code instead of gprintk
 - gate vpci_bar_{add|remove}_handlers with CONFIG_HAS_VPCI_GUEST_SUPPORT,
   so these do not get compiled for x86
 - removed unneeded is_system_domain check
 - re-work guest read/write to be much simpler and do more work on write
   than read which is expected to be called more frequently
 - removed one too obvious comment
---
 xen/drivers/vpci/header.c | 159 ++++++++++++++++++++++++++++++--------
 xen/include/xen/vpci.h    |   3 +
 2 files changed, 131 insertions(+), 31 deletions(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index 23b5223adf..8eebbf968b 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -439,6 +439,71 @@ static void cf_check bar_write(
     pci_conf_write32(pdev->sbdf, reg, val);
 }
=20
+static void cf_check guest_bar_write(const struct pci_dev *pdev,
+                                     unsigned int reg, uint32_t val, void =
*data)
+{
+    struct vpci_bar *bar =3D data;
+    bool hi =3D false;
+    uint64_t guest_reg =3D bar->guest_reg;
+
+    if ( bar->type =3D=3D VPCI_BAR_MEM64_HI )
+    {
+        ASSERT(reg > PCI_BASE_ADDRESS_0);
+        bar--;
+        hi =3D true;
+    }
+    else
+    {
+        val &=3D PCI_BASE_ADDRESS_MEM_MASK;
+        val |=3D bar->type =3D=3D VPCI_BAR_MEM32 ? PCI_BASE_ADDRESS_MEM_TY=
PE_32
+                                           : PCI_BASE_ADDRESS_MEM_TYPE_64;
+        val |=3D bar->prefetchable ? PCI_BASE_ADDRESS_MEM_PREFETCH : 0;
+    }
+
+    guest_reg &=3D ~(0xffffffffull << (hi ? 32 : 0));
+    guest_reg |=3D (uint64_t)val << (hi ? 32 : 0);
+
+    guest_reg &=3D ~(bar->size - 1) | ~PCI_BASE_ADDRESS_MEM_MASK;
+
+    /*
+     * Make sure that the guest set address has the same page offset
+     * as the physical address on the host or otherwise things won't work =
as
+     * expected.
+     */
+    if ( (guest_reg & (~PAGE_MASK & PCI_BASE_ADDRESS_MEM_MASK)) !=3D
+         (bar->addr & ~PAGE_MASK) )
+    {
+        gprintk(XENLOG_WARNING,
+                "%pp: ignored BAR %zu write attempting to change page offs=
et\n",
+                &pdev->sbdf, bar - pdev->vpci->header.bars + hi);
+        return;
+    }
+
+    bar->guest_reg =3D guest_reg;
+}
+
+static uint32_t cf_check guest_bar_read(const struct pci_dev *pdev,
+                                        unsigned int reg, void *data)
+{
+    const struct vpci_bar *bar =3D data;
+    bool hi =3D false;
+
+    if ( bar->type =3D=3D VPCI_BAR_MEM64_HI )
+    {
+        ASSERT(reg > PCI_BASE_ADDRESS_0);
+        bar--;
+        hi =3D true;
+    }
+
+    return bar->guest_reg >> (hi ? 32 : 0);
+}
+
+static uint32_t cf_check empty_bar_read(const struct pci_dev *pdev,
+                                        unsigned int reg, void *data)
+{
+    return 0;
+}
+
 static void cf_check rom_write(
     const struct pci_dev *pdev, unsigned int reg, uint32_t val, void *data=
)
 {
@@ -499,6 +564,7 @@ static int cf_check init_bars(struct pci_dev *pdev)
     struct vpci_header *header =3D &pdev->vpci->header;
     struct vpci_bar *bars =3D header->bars;
     int rc;
+    bool is_hwdom =3D is_hardware_domain(pdev->domain);
=20
     ASSERT(rw_is_write_locked(&pdev->domain->vpci_rwlock));
=20
@@ -540,13 +606,12 @@ static int cf_check init_bars(struct pci_dev *pdev)
         if ( i && bars[i - 1].type =3D=3D VPCI_BAR_MEM64_LO )
         {
             bars[i].type =3D VPCI_BAR_MEM64_HI;
-            rc =3D vpci_add_register(pdev->vpci, vpci_hw_read32, bar_write=
, reg,
-                                   4, &bars[i]);
+            rc =3D vpci_add_register(pdev->vpci,
+                                   is_hwdom ? vpci_hw_read32 : guest_bar_r=
ead,
+                                   is_hwdom ? bar_write : guest_bar_write,
+                                   reg, 4, &bars[i]);
             if ( rc )
-            {
-                pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd);
-                return rc;
-            }
+                goto fail;
=20
             continue;
         }
@@ -555,6 +620,17 @@ static int cf_check init_bars(struct pci_dev *pdev)
         if ( (val & PCI_BASE_ADDRESS_SPACE) =3D=3D PCI_BASE_ADDRESS_SPACE_=
IO )
         {
             bars[i].type =3D VPCI_BAR_IO;
+
+#ifndef CONFIG_X86
+            if ( !is_hwdom )
+            {
+                rc =3D vpci_add_register(pdev->vpci, empty_bar_read, NULL,
+                                       reg, 4, &bars[i]);
+                if ( rc )
+                    goto fail;
+            }
+#endif
+
             continue;
         }
         if ( (val & PCI_BASE_ADDRESS_MEM_TYPE_MASK) =3D=3D
@@ -566,14 +642,20 @@ static int cf_check init_bars(struct pci_dev *pdev)
         rc =3D pci_size_mem_bar(pdev->sbdf, reg, &addr, &size,
                               (i =3D=3D num_bars - 1) ? PCI_BAR_LAST : 0);
         if ( rc < 0 )
-        {
-            pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd);
-            return rc;
-        }
+            goto fail;
=20
         if ( size =3D=3D 0 )
         {
             bars[i].type =3D VPCI_BAR_EMPTY;
+
+            if ( !is_hwdom )
+            {
+                rc =3D vpci_add_register(pdev->vpci, empty_bar_read, NULL,
+                                       reg, 4, &bars[i]);
+                if ( rc )
+                    goto fail;
+            }
+
             continue;
         }
=20
@@ -581,38 +663,53 @@ static int cf_check init_bars(struct pci_dev *pdev)
         bars[i].size =3D size;
         bars[i].prefetchable =3D val & PCI_BASE_ADDRESS_MEM_PREFETCH;
=20
-        rc =3D vpci_add_register(pdev->vpci, vpci_hw_read32, bar_write, re=
g, 4,
-                               &bars[i]);
+        rc =3D vpci_add_register(pdev->vpci,
+                               is_hwdom ? vpci_hw_read32 : guest_bar_read,
+                               is_hwdom ? bar_write : guest_bar_write,
+                               reg, 4, &bars[i]);
         if ( rc )
-        {
-            pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd);
-            return rc;
-        }
+            goto fail;
     }
=20
     ASSERT(!header->rom_reg);
-
-    /* Check expansion ROM. */
-    rc =3D pci_size_mem_bar(pdev->sbdf, rom_reg, &addr, &size, PCI_BAR_ROM=
);
-    if ( rc > 0 && size )
+    /* Check expansion ROM: we do not handle ROM for guests. */
+    if ( is_hwdom )
     {
-        struct vpci_bar *rom =3D &header->bars[num_bars];
+        rc =3D pci_size_mem_bar(pdev->sbdf, rom_reg, &addr, &size, PCI_BAR=
_ROM);
+        if ( rc > 0 && size )
+        {
+            struct vpci_bar *rom =3D &header->bars[num_bars];
=20
-        rom->type =3D VPCI_BAR_ROM;
-        rom->size =3D size;
-        rom->addr =3D addr;
-        header->rom_enabled =3D pci_conf_read32(pdev->sbdf, rom_reg) &
-                              PCI_ROM_ADDRESS_ENABLE;
+            rom->type =3D VPCI_BAR_ROM;
+            rom->size =3D size;
+            rom->addr =3D addr;
+            header->rom_enabled =3D pci_conf_read32(pdev->sbdf, rom_reg) &
+                                  PCI_ROM_ADDRESS_ENABLE;
=20
-        rc =3D vpci_add_register(pdev->vpci, vpci_hw_read32, rom_write, ro=
m_reg,
-                               4, rom);
-        if ( rc )
-            rom->type =3D VPCI_BAR_EMPTY;
+            rc =3D vpci_add_register(pdev->vpci, vpci_hw_read32, rom_write=
,
+                                   rom_reg, 4, rom);
+            if ( rc )
+                rom->type =3D VPCI_BAR_EMPTY;
=20
-        header->rom_reg =3D rom_reg;
+            header->rom_reg =3D rom_reg;
+        }
+    }
+    else
+    {
+        if ( !is_hwdom )
+        {
+            rc =3D vpci_add_register(pdev->vpci, empty_bar_read, NULL,
+                                   rom_reg, 4, &header->bars[num_bars]);
+            if ( rc )
+                goto fail;
+        }
     }
=20
     return (cmd & PCI_COMMAND_MEMORY) ? modify_bars(pdev, cmd, false) : 0;
+
+ fail:
+    pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd);
+    return rc;
 }
 REGISTER_VPCI_INIT(init_bars, VPCI_PRIORITY_MIDDLE);
=20
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index 5383ede556..e9170cc8ca 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -70,7 +70,10 @@ struct vpci {
     struct vpci_header {
         /* Information about the PCI BARs of this device. */
         struct vpci_bar {
+            /* Physical (host) address. */
             uint64_t addr;
+            /* Guest view of the BAR: address and lower bits. */
+            uint64_t guest_reg;
             uint64_t size;
             enum {
                 VPCI_BAR_EMPTY,
--=20
2.40.1

