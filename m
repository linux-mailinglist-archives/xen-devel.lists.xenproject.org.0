Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2911C7C7953
	for <lists+xen-devel@lfdr.de>; Fri, 13 Oct 2023 00:10:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616066.957788 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qr3s2-0001MO-OW; Thu, 12 Oct 2023 22:09:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616066.957788; Thu, 12 Oct 2023 22:09:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qr3s2-0001FW-LK; Thu, 12 Oct 2023 22:09:30 +0000
Received: by outflank-mailman (input) for mailman id 616066;
 Thu, 12 Oct 2023 22:09:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hhgq=F2=epam.com=prvs=4649fa389a=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1qr3s0-00016v-Lo
 for xen-devel@lists.xenproject.org; Thu, 12 Oct 2023 22:09:28 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 01ef1e01-694c-11ee-98d4-6d05b1d4d9a1;
 Fri, 13 Oct 2023 00:09:27 +0200 (CEST)
Received: from pps.filterd (m0174682.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 39CKqmlB008371; Thu, 12 Oct 2023 22:09:24 GMT
Received: from eur01-db5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2050.outbound.protection.outlook.com [104.47.2.50])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3tpr7cr8dp-8
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Oct 2023 22:09:24 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by DBAPR03MB6376.eurprd03.prod.outlook.com (2603:10a6:10:193::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.45; Thu, 12 Oct
 2023 22:09:17 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::f606:63f7:5875:6076]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::f606:63f7:5875:6076%4]) with mapi id 15.20.6863.043; Thu, 12 Oct 2023
 22:09:17 +0000
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
X-Inumbo-ID: 01ef1e01-694c-11ee-98d4-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HKfg5qXdDexzLV0+sZbNbyvTpFHTwVC5+rRHRYnQj4SK+Xl0hOCChTqhFsmRDjK6hrkQcBA5Md4w6VfFjcz7hcCkIgPWW+CfiX25Xy7p4HkNqjQY8oITAD/n2YG7ZJPkr9G23BmtB+h+00JbmS6h2QI52e3BZAUaDpvjuoMfq08IitmRjg0kZrFg0OXY/wlJVOpL6tm7d51cH4L7WgWAKqIw+KVEP3GZUnr8ZZ54I7kLVpcyYwJxWvlbI4cwyfH2e+68DMlrgqNdqI+2I4Cm5e5S30SBaynbkLS+J8iYKhZ+NCsG6BcOc3OLGkPvXzQHiOj9okJ8coIvhN/S9C6dng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sHEaJEc3G9E8e7KRUoJf4jCqFeFYGoQCExX39F4Rr1I=;
 b=RsiRUVP8cT+JS7Dw9wFSb/H4R+DZCcREN2y30ac875vhZqKpeqxLV311RQ14Wf8QsslJUFldkyla3T+opjtBzRbW6Wb8Py3uXcq0jFhKXpcgy7PfbTmSFNiWg0nN857wquTrqSoApcA6jJoY/JE8urhquy8W02LX6NTtaflKv9bAeyiKOllOB4NB6FEa3P2+YUPds3EUYLv1Y1w7HWA0phKbNq5jRRnWCUS/yaBejceHRmKfAOmHr1NshqK2GPhiYLZ/xPEuhYECfeAktuENLUy2yKrboVRq9+Oga6cl9tNqirQyfM9IoDSk8ovRic6XrgcX7vwDQ+eXXJOWmCTp0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sHEaJEc3G9E8e7KRUoJf4jCqFeFYGoQCExX39F4Rr1I=;
 b=KL1ebSqNDtsoco09bWyUcTxN0oR1TTeo/3xGTjP+GXZzZLpYGr7EZ5y0OKehB1Ds28MHVbKQnv4Zh2d3+d3M21sQC0M7UTonnFQoI5FBVR3/rY2jj7463qezz9nh4b+0ylwB1XzwCiO7Q4WfmJBph2rsN5XkSGlj4EmUUibgL4lpox+rRNL8QMJmnX+3I2DL36277iut03Bw2bn1ZTnk/Z1Ndj+eYrlXN5oMl2VKdcrRBMDpXq+OV7p90F/mxGeyC8qZFc7ypRHVR0LnwvpRPcKtcywkWLk4G5FFFeaKEyjfFduRpSZrxUveNoyzrbMAFb9ZIy2SJHhIYz5v1R/Ufw==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>,
        =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>
Subject: [PATCH v10 07/17] vpci/header: implement guest BAR register handlers
Thread-Topic: [PATCH v10 07/17] vpci/header: implement guest BAR register
 handlers
Thread-Index: AQHZ/Vi9sL7dfLy6W0u4NsE3jXsp9g==
Date: Thu, 12 Oct 2023 22:09:16 +0000
Message-ID: <20231012220854.2736994-8-volodymyr_babchuk@epam.com>
References: <20231012220854.2736994-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20231012220854.2736994-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.42.0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|DBAPR03MB6376:EE_
x-ms-office365-filtering-correlation-id: 84293fd7-60c6-45d2-927d-08dbcb6fe0c1
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 g5TcQAGvDSz6D5rIRrUrWqzsLuXPF6SMdzA5Dv9UheJumLKqV6ToelEolQLEI9ILPkh0JyG9S9P60ujoliRBdhix1iLsr+BCGihJGR/QERnxVZxgHzWLWI3eBTP24tmWQmNFRa/Gq6xGv/bkj4XE/7yIvhsjJ0+DUPpyXROoj6kYxW9IIKSjMKw9muHhq0KZ8W79ooT/1y7Ehc5Xeio7UJDsB0avQKsSbX1XfQFstfSHySzJeyZc83ajarPUfVXw2qMIqveN5917cDziKM1ZZ7vpwpXOl9Nc/qJGPVpYBGG8wm0Sckp2E/jWkfATWP5qTRZZhvvTZrclh3kfjn8ubRCfP158gfNmiQaGnpGU55jNwAXwrSsJU4zC3KCr4mvNA3geiYqb/0r5OCmSkU6X1C69Kod228XXg6NA219umVb8GmKmI4qc48yKbA+f5oZSUJlVdZL6k3ik99KwSe4qMHy9nKDnOCSolcwLZvsyi1XoTjk7u5C4h61vhLzV4hT9xBfGMgEMz0g94HMzT/gtaUqKKlL5f+F2ucIgHkgk1nQEthEZqQQTaPtarOcYRL8xrz3GBApTCghOvv1Gtmb1rJqk6rCnS2yp73iaAxcImmPo0pEL9vmTi0RBGfgOXkCE
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(396003)(346002)(366004)(136003)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(2616005)(71200400001)(26005)(6512007)(6506007)(55236004)(36756003)(86362001)(38100700002)(38070700005)(122000001)(1076003)(83380400001)(91956017)(41300700001)(64756008)(316002)(76116006)(54906003)(66946007)(66446008)(6916009)(66556008)(66476007)(2906002)(8936002)(5660300002)(8676002)(4326008)(6486002)(478600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?0oODUwcBgKr4gqpn75YmGL+2GYSfZGSQinF3y6ess2CVsOpxIOT1uUP5h4?=
 =?iso-8859-1?Q?P7HOkN9TSdEPHUeIUPlZ18RRT5p5+VLCXNQ28o1AdV8ZClF2hd8oZKmGhT?=
 =?iso-8859-1?Q?jNVmyBwHBBCK0De1g9XCbNGEywhrXNZ6wUnFB/tz0sXP15qUqUkYk+o0w9?=
 =?iso-8859-1?Q?zuUL7J0G0KVUDBrxrSlEpWKwMg8NL2ENvcktXYk3gmm5LQxZAaj8gqwT4P?=
 =?iso-8859-1?Q?/SUcNkFmuwprKTZT92DOmH7J54ZKipRsTBZTyE/OickSfowpGMoO3psB7w?=
 =?iso-8859-1?Q?LxdO3TDxLkm5ehZ6GXB4NfZlEUNuUy+BEJxvo+eqdsJs+NMeXSJw4fjz0M?=
 =?iso-8859-1?Q?BiyLs823WKktrPgyAUH8ObZh1zT1rSSuk5s1d5GMTF5MAm9zdqGtv4ztYf?=
 =?iso-8859-1?Q?WEQM23SR8PxdUfxSUMmCyFizY/5DzHsO/IcszU9zdk8x1a/FEigdQ7q4Z7?=
 =?iso-8859-1?Q?H8FOAQC0FnkhvcMEZY+2/Z1rHPR8vShv+ISQdt6oh2zK4F8e7jiy6a4c5l?=
 =?iso-8859-1?Q?1dsMRXVticzaqgaJZrQ5BbmgPPuIia9kPTPijmwZjIHifHRN1aDzpYmlSm?=
 =?iso-8859-1?Q?qASRL8enpU9VbBiH/1ZtulAU/7ArppnzX2/XYNCSjAbRobXGzanaAMGhF+?=
 =?iso-8859-1?Q?3KBUDglZ881MeXFz/m8M3ZXMkznNH0T7HohD/ZUjHRBVwWE0z6pjPodH8t?=
 =?iso-8859-1?Q?71uAYjw+/3naXxJT6hQtst+MvY0qEd3+C+v/xvLIrbVxFr7XCwjc6cwtjF?=
 =?iso-8859-1?Q?zuTFRO1zvm5s64pikSSI1E0we9X0ajcC43fpTikDADW5L0qzsPY9cHtewV?=
 =?iso-8859-1?Q?AhHkiygJStllj5hbgvLnTNIGHBlSVElBjAVd6EcxPJn3rnnqgfSiUQPRYw?=
 =?iso-8859-1?Q?lw+z4gFEz1HU21ylq0noF+yzMbBLcVVCF6KeJYkYjjIjZ3IsE8/n6gK5bj?=
 =?iso-8859-1?Q?Mzy13I2PW9SRl8dWKn87qZfm8hGDDgyXjXHSU9J8CV6qzBb84fra89Udhh?=
 =?iso-8859-1?Q?7aGn5KUGerpTH6A4cWXxD6cggoG0WTJ2948C2U6qx1uMy4aF+9/JZ55CHg?=
 =?iso-8859-1?Q?i23jFgjEy2SG47ApbK7BLEOLt81V83e9DPfVsTfC21Gdvb9eCfPIUfN8rb?=
 =?iso-8859-1?Q?iC0A9liN+gTmDK3uXBcEj4TIvAYrwPdmP4PJj0ukkCyOB/Mq0w55PUN9S0?=
 =?iso-8859-1?Q?51MFnvq4IMI46uFvinWdapzH6jHPoVUCPsjxXmIc0SDng2cjtKV0hFDAqj?=
 =?iso-8859-1?Q?6A0pMzWeXVTP5ZLix3vjEENe4dOWmloI8AlxNBM7trftGU3lgG0SneS7dO?=
 =?iso-8859-1?Q?hPnhg1R/RxgorMdR6RIfYmFh0XBXF8iNjdBPMBy5Wn23jJr7GLaoL8AzE0?=
 =?iso-8859-1?Q?jP0qv+WwJcVXVr3hm9guj0jR2BCXzDcNp4PoeUxXVINrv+QxS0+1L469Dq?=
 =?iso-8859-1?Q?wLEfwbjtfE6feFkIr7SqRlMV7RsDBIZEG98rpS1ywGn86piRoLPvogmXBd?=
 =?iso-8859-1?Q?DIDPixgrkiCVtIXeVVS9ap+QEja5laTJQ21Y5q5YISHxBenoZsFpbvardt?=
 =?iso-8859-1?Q?nl76RjuwtATtZ6dRBXUj4poUB3m56stKMLEPgTf7sgp5ItkG4VtGMPB6IX?=
 =?iso-8859-1?Q?xRgX1CVoQL38PzPAyLKVjssCePjNgT66xcwZY3nhq76ycR50zgXKufnA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84293fd7-60c6-45d2-927d-08dbcb6fe0c1
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2023 22:09:16.6198
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0xjQaEJ1sdTbZRPOoTkk22uoYvAw8ba6sDXGfJkW0WSQNyRKfLCrAbAG84aGnZSw93AhJZttYWcscZltRqT4UkiyjKdGMeLsqCI9GIfIvEI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR03MB6376
X-Proofpoint-GUID: Nj2eEDhtFVFt6sGLO1ttSKBvltZmPO8t
X-Proofpoint-ORIG-GUID: Nj2eEDhtFVFt6sGLO1ttSKBvltZmPO8t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-12_14,2023-10-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310120186

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

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
---
In v10:
- ull -> ULL to be MISRA-compatbile
- Use PAGE_OFFSET() instead of combining with ~PAGE_MASK
- Set type of empty bars to VPCI_BAR_EMPTY
In v9:
- factored-out "fail" label introduction in init_bars()
- replaced #ifdef CONFIG_X86 with IS_ENABLED()
- do not pass bars[i] to empty_bar_read() handler
- store guest's BAR address instead of guests BAR register view
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
 xen/drivers/vpci/header.c | 137 +++++++++++++++++++++++++++++++++-----
 xen/include/xen/vpci.h    |   3 +
 2 files changed, 123 insertions(+), 17 deletions(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index 33db58580c..40d1a07ada 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -477,6 +477,74 @@ static void cf_check bar_write(
     pci_conf_write32(pdev->sbdf, reg, val);
 }
=20
+static void cf_check guest_bar_write(const struct pci_dev *pdev,
+                                     unsigned int reg, uint32_t val, void =
*data)
+{
+    struct vpci_bar *bar =3D data;
+    bool hi =3D false;
+    uint64_t guest_addr =3D bar->guest_addr;
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
+    }
+
+    guest_addr &=3D ~(0xffffffffULL << (hi ? 32 : 0));
+    guest_addr |=3D (uint64_t)val << (hi ? 32 : 0);
+
+    /* Allow guest to size BAR correctly */
+    guest_addr &=3D ~(bar->size - 1);
+
+    /*
+     * Make sure that the guest set address has the same page offset
+     * as the physical address on the host or otherwise things won't work =
as
+     * expected.
+     */
+    if ( guest_addr !=3D ~(bar->size -1 )  &&
+         PAGE_OFFSET(guest_addr) !=3D PAGE_OFFSET(bar->addr) )
+    {
+        gprintk(XENLOG_WARNING,
+                "%pp: ignored BAR %zu write attempting to change page offs=
et\n",
+                &pdev->sbdf, bar - pdev->vpci->header.bars + hi);
+        return;
+    }
+
+    bar->guest_addr =3D guest_addr;
+}
+
+static uint32_t cf_check guest_bar_read(const struct pci_dev *pdev,
+                                        unsigned int reg, void *data)
+{
+    const struct vpci_bar *bar =3D data;
+    uint32_t reg_val;
+
+    if ( bar->type =3D=3D VPCI_BAR_MEM64_HI )
+    {
+        ASSERT(reg > PCI_BASE_ADDRESS_0);
+        bar--;
+        return bar->guest_addr >> 32;
+    }
+
+    reg_val =3D bar->guest_addr;
+    reg_val |=3D bar->type =3D=3D VPCI_BAR_MEM32 ? PCI_BASE_ADDRESS_MEM_TY=
PE_32 :
+                                             PCI_BASE_ADDRESS_MEM_TYPE_64;
+    reg_val |=3D bar->prefetchable ? PCI_BASE_ADDRESS_MEM_PREFETCH : 0;
+
+    return reg_val;
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
@@ -537,6 +605,7 @@ static int cf_check init_bars(struct pci_dev *pdev)
     struct vpci_header *header =3D &pdev->vpci->header;
     struct vpci_bar *bars =3D header->bars;
     int rc;
+    bool is_hwdom =3D is_hardware_domain(pdev->domain);
=20
     ASSERT(rw_is_write_locked(&pdev->domain->pci_lock));
=20
@@ -578,8 +647,10 @@ static int cf_check init_bars(struct pci_dev *pdev)
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
                 goto fail;
             continue;
@@ -588,7 +659,17 @@ static int cf_check init_bars(struct pci_dev *pdev)
         val =3D pci_conf_read32(pdev->sbdf, reg);
         if ( (val & PCI_BASE_ADDRESS_SPACE) =3D=3D PCI_BASE_ADDRESS_SPACE_=
IO )
         {
-            bars[i].type =3D VPCI_BAR_IO;
+            if ( !IS_ENABLED(CONFIG_X86) && !is_hwdom )
+            {
+                rc =3D vpci_add_register(pdev->vpci, empty_bar_read, NULL,
+                                       reg, 4, NULL);
+                if ( rc )
+                {
+                    bars[i].type =3D VPCI_BAR_EMPTY;
+                    goto fail;
+                }
+            }
+
             continue;
         }
         if ( (val & PCI_BASE_ADDRESS_MEM_TYPE_MASK) =3D=3D
@@ -605,6 +686,15 @@ static int cf_check init_bars(struct pci_dev *pdev)
         if ( size =3D=3D 0 )
         {
             bars[i].type =3D VPCI_BAR_EMPTY;
+
+            if ( !is_hwdom )
+            {
+                rc =3D vpci_add_register(pdev->vpci, empty_bar_read, NULL,
+                                       reg, 4, NULL);
+                if ( rc )
+                    goto fail;
+            }
+
             continue;
         }
=20
@@ -612,28 +702,41 @@ static int cf_check init_bars(struct pci_dev *pdev)
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
             goto fail;
     }
=20
-    /* Check expansion ROM. */
-    rc =3D pci_size_mem_bar(pdev->sbdf, rom_reg, &addr, &size, PCI_BAR_ROM=
);
-    if ( rc > 0 && size )
+    /* TODO: Check expansion ROM, we do not handle ROM for guests for now.=
 */
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
+            rc =3D vpci_add_register(pdev->vpci, vpci_hw_read32, rom_write=
,
+                                   rom_reg, 4, rom);
+            if ( rc )
+                rom->type =3D VPCI_BAR_EMPTY;
+        }
+    }
+    else
+    {
+        header->bars[num_bars].type =3D VPCI_BAR_EMPTY;
+        rc =3D vpci_add_register(pdev->vpci, empty_bar_read, NULL,
+                               rom_reg, 4, NULL);
         if ( rc )
-            rom->type =3D VPCI_BAR_EMPTY;
+            goto fail;
     }
=20
     return (cmd & PCI_COMMAND_MEMORY) ? modify_bars(pdev, cmd, false) : 0;
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index 75cfb532ee..2028f2151f 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -67,7 +67,10 @@ struct vpci {
     struct vpci_header {
         /* Information about the PCI BARs of this device. */
         struct vpci_bar {
+            /* Physical (host) address. */
             uint64_t addr;
+            /* Guest address. */
+            uint64_t guest_addr;
             uint64_t size;
             enum {
                 VPCI_BAR_EMPTY,
--=20
2.42.0

