Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ACBF7C7948
	for <lists+xen-devel@lfdr.de>; Fri, 13 Oct 2023 00:10:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616069.957819 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qr3s4-00026W-Mw; Thu, 12 Oct 2023 22:09:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616069.957819; Thu, 12 Oct 2023 22:09:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qr3s4-0001xq-Gf; Thu, 12 Oct 2023 22:09:32 +0000
Received: by outflank-mailman (input) for mailman id 616069;
 Thu, 12 Oct 2023 22:09:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hhgq=F2=epam.com=prvs=4649fa389a=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1qr3s2-00016v-Qw
 for xen-devel@lists.xenproject.org; Thu, 12 Oct 2023 22:09:30 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 038fa9a2-694c-11ee-98d4-6d05b1d4d9a1;
 Fri, 13 Oct 2023 00:09:30 +0200 (CEST)
Received: from pps.filterd (m0174682.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 39CKqml4008371; Thu, 12 Oct 2023 22:09:18 GMT
Received: from eur01-db5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2050.outbound.protection.outlook.com [104.47.2.50])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3tpr7cr8dp-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Oct 2023 22:09:18 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by DBAPR03MB6376.eurprd03.prod.outlook.com (2603:10a6:10:193::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.45; Thu, 12 Oct
 2023 22:09:15 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::f606:63f7:5875:6076]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::f606:63f7:5875:6076%4]) with mapi id 15.20.6863.043; Thu, 12 Oct 2023
 22:09:15 +0000
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
X-Inumbo-ID: 038fa9a2-694c-11ee-98d4-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HCVX/2lqseYlqrTNVPwrAyVuvhlRLLg/hegDl11cpLjnCiujJxRxVa19fu9nc4Wlf8TQVU2jh6p/9kkDyg+v2HFohG1O8fxVZiIBQ/0DUZAVdM6HKa6IQNrFobPgtsgtBrxUROhBsS1f5Tn1wz4C0QqSvOPfKd24LMV/02BN1tl83KR0Y7/5TzHSN7zX53hD/BI5UZuLvJfMlPmfBOHrflLZIE0Zg7ZsmE45t4WMkhCDv5mwv4W5VpUe/i0yULIx4BqFZ4rwTqwk8wItndi/ZIdG80MwFTVkYpb3s0cc0hAo7GO+XpfnOpX0+ppEhuJdwCdOjwmpbvJS/26BNTO1KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nUbdmISXespujyGMhnqpZyFZ9IBb/MEFeA/aVd7WW+s=;
 b=mVCvwanMMS3gWHTNPG5cMEQziX3sJ7Qk6d0+Uz06dHftVlsJ+tRVBO5MZ8c8ET5ZybR38oeJ0Nj1QiaE81q7Epz88i18m9sfgnpr/DoqYvaciV7qMR7K/eA1i0uXZLM9VawvTUYhAHFNb2XSWT26LIdhdkINPelNGounp/R28V+JGtY/u/vvnCzgXFsYwjnlIYGEWdP4Lxot5/znc415bBt2FPKApnSDm/ZxeDeA4B6nfp0OkDFghTaZnDQJmelbxXd0BdOqS4RJUIFlsZzs5tbZy3NFYwqaseOgI3cZlp61rdoqMiFvOVzZvrkWvWMiN6GaL68HSFgqHJPHj4kHZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nUbdmISXespujyGMhnqpZyFZ9IBb/MEFeA/aVd7WW+s=;
 b=lpPZlM1yKu+nbUsMNnz+qLHhrt2nrbr73jEJgtgsh4XGBjLJvwAggbGiCJMg5/Uiufk6pZqvwKrGMJqLE627/TOZ7WpPjZNbzxZSuxUULb339FBBAJMwJ/RrSX6FyFsJeCRpw3Oo15L8nVFRlMIVMDYR4VgWXKLzS9rvKV/bwyClExpRwy46vytiJDgd9/yM2YVW/R/6MNseSvGvqbKU/sW7QGXkxnI7C/b7wX/37rN8ZGVzm1f1apLfdCkkvVuV8QBDCGRkFvFQPTzbJIIMlJDhMesX03sge4y3xEDjHCfmZcPx1/Pw23O+X6rQhJAypzXeLPEB12O3Bw5ojoWQPQ==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Jan Beulich <jbeulich@suse.com>,
        Andrew Cooper
	<andrew.cooper3@citrix.com>,
        =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>,
        Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>,
        Julien Grall <julien@xen.org>,
        Stefano Stabellini
	<sstabellini@kernel.org>
Subject: [PATCH v10 01/17] pci: msi: pass pdev to pci_enable_msi() function
Thread-Topic: [PATCH v10 01/17] pci: msi: pass pdev to pci_enable_msi()
 function
Thread-Index: AQHZ/Vi8+1vtmDC560CdrPPIvL4UuQ==
Date: Thu, 12 Oct 2023 22:09:14 +0000
Message-ID: <20231012220854.2736994-2-volodymyr_babchuk@epam.com>
References: <20231012220854.2736994-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20231012220854.2736994-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.42.0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|DBAPR03MB6376:EE_
x-ms-office365-filtering-correlation-id: 9385d259-8333-464f-e543-08dbcb6fdf48
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 if2bpCTT6R5djnnp24r325/p4Ni3LFzDfiigZrGdmD2YfbpCcbzfA1AeSgODRB46Cp9VhdRVSWdBY3yn0j0x+X1/1aFL6IA/QrxPQjsKDrmhFcmnMrs2QsyjjMYlT8ho0QK6Pl+uZgDnT890xiLORbJAuQR5aWAnJq0Lbb9gtEVvyQMzQ5HeW+e018z/Bn3+JmNAky6dr45tKN3lHP5m54bVEvjrhtT7E6BQEevs2oh3L7IakkoDZh/Lqy02CdzskzvTAQb2KLAtZI2RAjyCFVXa4sU6vnt0TzJnz/BJLWl+/ialLGfQqui6WDNPCRhZzuNR3lV+0KaVLKDxH7wzWFtBAvKafen5yRAaeGh+wVPQmKdUJALAj8iU0l/46JGssLLO9rO0KNC6zvRgEOrP0Y2BU9TwN5BdmxI2v4kSDtBTFdODlpvn5l4kGAEIFOX0tAX8/WQEq3WWS0VDcYQLaDb0LDpb9Ga0mATl/Am+J/i2SwJxu5ix7rry4NuX7SC8XnnbZE9lD3+hZR60cd/GK98ZZtGLjOhTRMOkXJjFu3HDzUXHWkBaNdzYRDJY6gQFezGWKIyIh3oC+e+9L+GOtclGg/csBl4afaginXoy7wiiAHEox9lCgSBasbZre+V4
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(396003)(346002)(366004)(136003)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(2616005)(71200400001)(26005)(6512007)(6506007)(55236004)(36756003)(86362001)(38100700002)(38070700005)(122000001)(1076003)(83380400001)(91956017)(41300700001)(64756008)(316002)(76116006)(54906003)(66946007)(66446008)(6916009)(66556008)(66476007)(2906002)(8936002)(5660300002)(8676002)(4326008)(6486002)(478600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?/Iz9Pg2fBp+lj8rwpOs4fb0hCEImxuUhFtNj0OfmpkEto3yyybeUeEt0iK?=
 =?iso-8859-1?Q?BdLc9OAmCQjeRcNyxLnvn+3hcZ3DqC7355PNn7SA2I9oDK7uIxgFhZht4z?=
 =?iso-8859-1?Q?DgH22CJNBwQNqXQd6/m1eO0Ysc5MWmI9GI3lWh9gEJ4CsM/5B1C/iJzIrt?=
 =?iso-8859-1?Q?xek9qHAc686OerriC15KSJjQgNe0LMrTO5fLJ9UfN5CpLzlRXDBtLttFsH?=
 =?iso-8859-1?Q?RgF0kZkuaBtLxzUUq0aijea63ugmydiUY4jdxHONdarS/yjdw0xDTZnIKI?=
 =?iso-8859-1?Q?rcziGi5Vy3g5hHSsTG7qHBFar1Ux/DHDLaBuVdir8e17CihXZtjLDCQE7W?=
 =?iso-8859-1?Q?nvHhBAupybIo/a6phdkUnXiIscew2n4JbrOt+hX3xeOwNRCOG56SCFxxo9?=
 =?iso-8859-1?Q?oygrciHIsH4IbrLV8GDOE3VUZWair6oj3+Ztj3Wh4M+Xxeln8de82yZt7D?=
 =?iso-8859-1?Q?miv6sRr/4IIyIQ3VetH2m5xbQHSJPDbSH5TFilV++8hCSZlyxd6dN0uSgQ?=
 =?iso-8859-1?Q?clDe09EOA0SEMNLmnLNbH5OxMLxNqaZFvnmy9ZU9zRjfixxkt/nFGiC2WT?=
 =?iso-8859-1?Q?f5glpCtzSwjsLWMjam39dLxep8D5tOj/x0xALN1eexC9Ump/dz4EyrQ1a/?=
 =?iso-8859-1?Q?KBBDPRfgTkk7aPzVoo74OrKvQLbhLDXbv9AMsbBL3N9l1UHXySM9JNDMTH?=
 =?iso-8859-1?Q?KYr66UUFBXTbar7tO1sxacqGX4NHASZHjLG16IuaWoC5dGIcj3BEx+8YB0?=
 =?iso-8859-1?Q?jyOXpvbV6Rit6HavvNFlFd4uwJm0pjK/k3ZnL6xHMR5widCV18q2P1sva3?=
 =?iso-8859-1?Q?na7L4Ccw6bi04ODWe7hBYs0kjTVy82zWzxeg2rSNLeM7PCzp2x3zyqVqI0?=
 =?iso-8859-1?Q?BXRqUnpFad0p4BM6U+0eqPdYTTmLXz8xPv2JO+7c5jB7FKcfXKKkvkBIPX?=
 =?iso-8859-1?Q?YhsKAwS7GhNUNVDgLT0tMOsmJMUq6OFC0z75astU5w7pWbvinkmSwSlV8K?=
 =?iso-8859-1?Q?Nv2OUEnVsvJ0Sde4kxw1NZ1Et+Ef3saqko0agapPCL3uG8qq5kGETQv70O?=
 =?iso-8859-1?Q?+e6o8mwLcxr11xn3W39jgkPHTG6Rq3HwPqUYSMlgo16SwKFo2BZPtzZqKc?=
 =?iso-8859-1?Q?PMcBctozf7yuS8TgzgTd31Snuj0ZruPVMeFadp9Aoe4bITwHlumvClCW0k?=
 =?iso-8859-1?Q?vCGzm6VYNeH38vCatW1M30//k7LnBCnolhH9zUfulXJwTBU8gpJF4D3Ubz?=
 =?iso-8859-1?Q?LJMLeMbCUM1c9cCay9j18/EOyxY5lyOEiCzPu1xSlKiMnXSGK16Qi7jbjk?=
 =?iso-8859-1?Q?eoG3aFYi/HeOQOAa0NrRfT5rlOkyV3EgelGzOk6LVirEpF+7Fu7idGNoqZ?=
 =?iso-8859-1?Q?RBAeK6G3Q/lmvQqVq13lbJbsZB9xs461rw6T3Vx9f8061z7DVxIWVPkqZP?=
 =?iso-8859-1?Q?6FEzdarBH5utkxaywjMoCLhEpjj5aA3ydru70Cy4Kb59MFTJaKSFHilOu5?=
 =?iso-8859-1?Q?gyhufBfndVNa5e1/Tt23tx4SHuV8fU0vD34Y8DnHxQicv4IGr6ahSTNbCf?=
 =?iso-8859-1?Q?uFOYydCZLmKOHAScowx8gkeq4etCOQq1R7TBkJOD6PbLI8ASkcxzdCuafX?=
 =?iso-8859-1?Q?vmmfcdsfioOaivI82t37xQKAFX5Jf3UMIxhE3vB8EA2eR5iVxA8XV6QA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9385d259-8333-464f-e543-08dbcb6fdf48
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2023 22:09:14.5076
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iK/voxAwtiw+7wIxak+45MttHbuarMe2lCVNroGC85TNgBLTalS7ZH/HkIFdyKHF5qkfyV9zp6G9FYJE8rhzfwleU+v6RP1ifS9rR/XUb40=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR03MB6376
X-Proofpoint-GUID: oWPZhzSBKvDFZcijyL9aFYhlavcIPxAL
X-Proofpoint-ORIG-GUID: oWPZhzSBKvDFZcijyL9aFYhlavcIPxAL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-12_14,2023-10-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0 mlxlogscore=574
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310120186

Previously pci_enable_msi() function obtained pdev pointer by itself,
but taking into account upcoming changes to PCI locking, it is better
when caller passes already acquired pdev pointer to the function.

Note that ns16550 driver does not check validity of obtained pdev
pointer because pci_enable_msi() already does this.

Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

---
Changes in v10:

 - New in v10. This is the result of discussion in "vpci: add initial
 support for virtual PCI bus topology"
---
 xen/arch/x86/include/asm/msi.h |  3 ++-
 xen/arch/x86/irq.c             |  2 +-
 xen/arch/x86/msi.c             | 19 ++++++++++---------
 xen/drivers/char/ns16550.c     |  4 +++-
 4 files changed, 16 insertions(+), 12 deletions(-)

diff --git a/xen/arch/x86/include/asm/msi.h b/xen/arch/x86/include/asm/msi.=
h
index a53ade95c9..836c8cd4ba 100644
--- a/xen/arch/x86/include/asm/msi.h
+++ b/xen/arch/x86/include/asm/msi.h
@@ -81,7 +81,8 @@ struct irq_desc;
 struct hw_interrupt_type;
 struct msi_desc;
 /* Helper functions */
-extern int pci_enable_msi(struct msi_info *msi, struct msi_desc **desc);
+extern int pci_enable_msi(struct msi_info *msi, struct msi_desc **desc,
+			  struct pci_dev *pdev);
 extern void pci_disable_msi(struct msi_desc *desc);
 extern int pci_prepare_msix(u16 seg, u8 bus, u8 devfn, bool off);
 extern void pci_cleanup_msi(struct pci_dev *pdev);
diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
index 6abfd81621..68b788c42e 100644
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -2167,7 +2167,7 @@ int map_domain_pirq(
         if ( !pdev )
             goto done;
=20
-        ret =3D pci_enable_msi(msi, &msi_desc);
+        ret =3D pci_enable_msi(msi, &msi_desc, pdev);
         if ( ret )
         {
             if ( ret > 0 )
diff --git a/xen/arch/x86/msi.c b/xen/arch/x86/msi.c
index a78367d7cf..20275260b3 100644
--- a/xen/arch/x86/msi.c
+++ b/xen/arch/x86/msi.c
@@ -983,13 +983,13 @@ static int msix_capability_init(struct pci_dev *dev,
  * irq or non-zero for otherwise.
  **/
=20
-static int __pci_enable_msi(struct msi_info *msi, struct msi_desc **desc)
+static int __pci_enable_msi(struct msi_info *msi, struct msi_desc **desc,
+			    struct pci_dev *pdev)
 {
-    struct pci_dev *pdev;
     struct msi_desc *old_desc;
=20
     ASSERT(pcidevs_locked());
-    pdev =3D pci_get_pdev(NULL, msi->sbdf);
+
     if ( !pdev )
         return -ENODEV;
=20
@@ -1038,13 +1038,13 @@ static void __pci_disable_msi(struct msi_desc *entr=
y)
  * of irqs available. Driver should use the returned value to re-send
  * its request.
  **/
-static int __pci_enable_msix(struct msi_info *msi, struct msi_desc **desc)
+static int __pci_enable_msix(struct msi_info *msi, struct msi_desc **desc,
+			     struct pci_dev *pdev)
 {
-    struct pci_dev *pdev;
     struct msi_desc *old_desc;
=20
     ASSERT(pcidevs_locked());
-    pdev =3D pci_get_pdev(NULL, msi->sbdf);
+
     if ( !pdev || !pdev->msix )
         return -ENODEV;
=20
@@ -1151,15 +1151,16 @@ int pci_prepare_msix(u16 seg, u8 bus, u8 devfn, boo=
l off)
  * Notice: only construct the msi_desc
  * no change to irq_desc here, and the interrupt is masked
  */
-int pci_enable_msi(struct msi_info *msi, struct msi_desc **desc)
+int pci_enable_msi(struct msi_info *msi, struct msi_desc **desc,
+		   struct pci_dev *pdev)
 {
     ASSERT(pcidevs_locked());
=20
     if ( !use_msi )
         return -EPERM;
=20
-    return msi->table_base ? __pci_enable_msix(msi, desc) :
-                             __pci_enable_msi(msi, desc);
+    return msi->table_base ? __pci_enable_msix(msi, desc, pdev) :
+			     __pci_enable_msi(msi, desc, pdev);
 }
=20
 /*
diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
index 28ddedd50d..1856b72e63 100644
--- a/xen/drivers/char/ns16550.c
+++ b/xen/drivers/char/ns16550.c
@@ -452,10 +452,12 @@ static void __init cf_check ns16550_init_postirq(stru=
ct serial_port *port)
             if ( rc > 0 )
             {
                 struct msi_desc *msi_desc =3D NULL;
+                struct pci_dev *pdev;
=20
                 pcidevs_lock();
=20
-                rc =3D pci_enable_msi(&msi, &msi_desc);
+                pdev =3D pci_get_pdev(NULL, msi.sbdf);
+                rc =3D pci_enable_msi(&msi, &msi_desc, pdev);
                 if ( !rc )
                 {
                     struct irq_desc *desc =3D irq_to_desc(msi.irq);
--=20
2.42.0

