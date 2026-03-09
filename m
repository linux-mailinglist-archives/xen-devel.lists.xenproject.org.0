Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6NXXAD+qrmntHQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Mar 2026 12:08:47 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E8A237967
	for <lists+xen-devel@lfdr.de>; Mon, 09 Mar 2026 12:08:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1249276.1546763 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzYTX-0004FY-Il; Mon, 09 Mar 2026 11:08:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1249276.1546763; Mon, 09 Mar 2026 11:08:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzYTX-0004Db-Dk; Mon, 09 Mar 2026 11:08:39 +0000
Received: by outflank-mailman (input) for mailman id 1249276;
 Mon, 09 Mar 2026 11:08:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OAaF=BJ=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1vzYTV-0003iR-TL
 for xen-devel@lists.xenproject.org; Mon, 09 Mar 2026 11:08:37 +0000
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c207::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 521c8dc5-1ba8-11f1-b164-2bf370ae4941;
 Mon, 09 Mar 2026 12:08:37 +0100 (CET)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by AS2PR03MB9695.eurprd03.prod.outlook.com
 (2603:10a6:20b:60d::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Mon, 9 Mar
 2026 11:08:27 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%5]) with mapi id 15.20.9678.020; Mon, 9 Mar 2026
 11:08:27 +0000
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
X-Inumbo-ID: 521c8dc5-1ba8-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nl8QLc9UdP4ObnHMHs2oJLNhVmBTPr7g7K/+hl+X37iwSZo8VxQXuDT8O90eGWeeO67dqMdQyQu16VlnC4z7czZ9hghgP0c7KmmAYV6OqRYZvwDbiCzEZdiB14C4uokcLH6QRS8pcc/uH9lseoX6LPkoXFED6XeY/7uaXGzN5rXpC3ZL916wDMYd8YEL+hBsJSqx1UPcbEkNwsg/tWsZO0d/bILruNZJEapkStxToql0n3FTuvV1Dw6SEsl3HSBwzgrpRMSUBxGydgadz8fgmfW9qIwRxwZc3kAXAvOObtAGmcDfqLTNbk2YByiFyCsN9IQm9BaD8UO6ZLbnlvHjSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pWzIGDE75yh52u15Xirf0pf0J8xYC99w/7XLPD+73E4=;
 b=RutKlxD6KyV5kxYSoeghtgKLH9y+5DtP0UA2c/EICN1DbJ8PVVGXnPWiHF4zhh+RhhFdyJr3k7WP+euOM8vpEnyiHvmBJgXyC6ubHCo1bvfDHMeSAJypI5ntTQtxgMAGEGgJb0W1zy9fPQ/5IT0Xc7kPv4aYXNISqe/4hYLO0V0erg4KL2kwKoLYOMHA83fNMJAI5oTih+SKjuKAhWQZQU8XxEcMOVu4thXBTcLZDIiKt3rH5+1pTVr64e1t7YFc6slmyP9G4Ym96GKgvhwedG+pHmJF0ELLumlxJ6CsMT8Nj3xdJXVZZ8P6L3/aNraWaQH+y6w/I84vOiQbXmbyug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pWzIGDE75yh52u15Xirf0pf0J8xYC99w/7XLPD+73E4=;
 b=PHiJLcidbNn0dDFazHvU98HdYzaVw3FIO+hxVLLyOY+i8kZOlKOk8NaJ8+xoEzqpdR9Togc9youYXVngFNTl+TBD8BFSCJouCd7gi0eUORPifGY0LLHzbERZ+deNb/8HYog+6LrPWJc71IAWCYkcr/5xKXl6Cb+2hdESYSN+MoHwSdltFOZrxk65KdRM+XjYPWT+PWGkOx2Wr4SJPJWQ/yao6DoyvFNhAecaSm3nBQlWsOqzMbpuZ3BsqT5lxQoC9s9nah5GFtF+OJLybqkW0R/9d5ivDQaPDpZmZMue6Qg0XhKQkdkKe+kNFgPg0JlEcLYg3CF3u05ex15GUAB1vA==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Mykyta Poturai
	<Mykyta_Poturai@epam.com>, Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v2 2/8] vpci: rename and export
 vpci_guest_mem_bar_{read,write}
Thread-Topic: [PATCH v2 2/8] vpci: rename and export
 vpci_guest_mem_bar_{read,write}
Thread-Index: AQHcr7UNr/GbhVrPC0iBoBGfLfVFWg==
Date: Mon, 9 Mar 2026 11:08:26 +0000
Message-ID:
 <5f364e8fddc83b9a7ae08945a91c38ae1648442a.1772806036.git.mykyta_poturai@epam.com>
References: <cover.1772806036.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1772806036.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|AS2PR03MB9695:EE_
x-ms-office365-filtering-correlation-id: acd06d94-67d8-467e-243d-08de7dcc3047
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 jsAlT0GNPi0IS2NxVOWAoYpQiAmM0cDPg2eh7bUOYeRfdqOZiE24yLU2/siQ0vDErl18i/1bIPp827lFJiULUMJja9zTPEE917ec7vu9/wdinp4p6luFKLa0RBLRvIGZnz+wq4BUz9TJYW20unLgZ4s1IllDFzIVOdjOueeRG7FX2PuZbj5ujnRzuDNihlTBggpt7F3cmn0IWa3tK6MVPki7XCFV6vGEPCVs4rW+x9/bgYb7mG8p11YBY51n6kwKrDQY+cdjYotq9CJEp6JiVpcK+nMVUse5tezCE7rFAvjSMDVYkPc/1q+BTxYPVAbG2Cjem3FF/TVSYAsEOvaQB+xbtDqs4oDAIDNKDanUrmQ9fsinWaIevRi7Xl4xtlkaFw+NXCD3bRXa0eoLvwtfHdntorHGu8yrfleOW10SM+4OUXUsZzNuBZfHXL4wN5F6pkJIB7rZAUDr2Uyoe+WqKP50344TSc0d849cvTtRP98dkuXCP2U0spUCXiPlE9ErqJPIfxPzyoMyQaJXqFrgWduaSKxLFUUk/BV5+EnvJljT8Jgs+1a2AcMnYDmw7mmMUlM1G5/BaAHI55Ks8DWUeqdI8n+oXD9AtLnI4vl4Nz14V0dMostCi0/FBQOyfcxoYwze8zpqnCudvtmYg7JImb84zFKxzlu7PqmPcVE5oiFR5oidqjs29LkIp7Keiv2ImlL9ciO2Avd1oOR8y5Ovwgof3Lkfs49r/31cWcGf6/m4YmlavTTVg/DYmMHN/fwE7jiymyYRhii15lWvD5GVL2d7ALPHqMTa0k7P1qwYpHk=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?auwvkiNQA2GZu4QqaB+cl/5cXA3UfuB8bj8To7PB0vkaqMTlTNkXZBok27?=
 =?iso-8859-1?Q?QNHUFEEa8DrXqOHczIp4lSVrBJY//w/tgiyRB6UPtld6zL11Kf95Pj3F6v?=
 =?iso-8859-1?Q?29Rx3LQpyGhaXUfIzyjWifCrXTC6/Sp9E7PCuJ1q5q532PGbhtg5Rj4HUc?=
 =?iso-8859-1?Q?C3UiAEVIgynCkfFKoH/JtJXftJw4cr22ynvTB23yxPP4bcJo+PxFjKSkWh?=
 =?iso-8859-1?Q?BhhpyA3I9TMRKPGLDnIKPOrlunZHtR3fWLqfhwvBW02Awif+5aMjuW+CXH?=
 =?iso-8859-1?Q?hcSGuLP2lYIJxCndVb9q14SoMYl5mQG+yirhQ5Dq4Bd820yigWBP2lCh9b?=
 =?iso-8859-1?Q?27mas/VjtjWTuqFzEVsfO+VVV39THkwSna/oiUYtHxe9Bte5dw3FYRReUQ?=
 =?iso-8859-1?Q?xU+IJ+ARY3FeDk/CGJN6pHJumqsLRFhaR3r1w69t6Lq9BDSmC5MT4ENYPe?=
 =?iso-8859-1?Q?+F62wN36nIJkLtOO4/rB7JpPTXRQE4cmLS2zqiEUd2lRI/xzlHFMHopMJL?=
 =?iso-8859-1?Q?kA8X00Y5+lNCLVxfc74YgZ1HpjC5pkRLK6s3Cdmxk2jGYKcT0HmkyV+CC4?=
 =?iso-8859-1?Q?17bQDmm0IVB99GeIoEX+zv76NtTdHmdw3VWfuFmRO8r55AK4QoV4y4X05j?=
 =?iso-8859-1?Q?B12c51r0Jz6VlrVvs3fm/XyTPDwbqF3r9AlC4x1pXswI08RGU4IIAJyjhu?=
 =?iso-8859-1?Q?u8z4nmtCPMvhEMTkP+0rCB9xAAScV+pAw/UVjWFXRoO5UIj9q1FZ1+0as/?=
 =?iso-8859-1?Q?bgiKBK50dm+g06qOHjuNgvB9paEjMfFOd09oJX9Rg2eVBfLZ2rRb64RwoN?=
 =?iso-8859-1?Q?KbfzBPRfyM2H7kV+W4KB4oI1PR/rXT7JDYGNSN1/ZPYQeBAhLWu/uPACRG?=
 =?iso-8859-1?Q?cjzPD3AzQsnHysFT0uC9VGKRj6hVNS+dUWynntMioFg0vLLqZ7wybjd7ki?=
 =?iso-8859-1?Q?IeDhANaeN1f6FY1lDlr44NoKyoH83/7dIRafhjPZxTVD6Ihwwbt9I//8Kp?=
 =?iso-8859-1?Q?rorBOjYJZu33PtwrpaLJ50cRgfIDDAoNcdNVvaQJ9tUw4Q7XmQE/AUvqC0?=
 =?iso-8859-1?Q?BBNguujleBwG/A6sYIk1KDtDcGkJbwmj2Cqp510FLoVUttWkKvVI70Y0Ql?=
 =?iso-8859-1?Q?W7y1Fs9sPID7zjoJf1EFdLfCVb2P8wVAiiHpeUn4EC0Z99xapNam7KjRCg?=
 =?iso-8859-1?Q?FsUQu5oLKZJYj5Lr4LssiY7T+SKXAbd+ntxcoagdO2ULpvurS2L494s7ez?=
 =?iso-8859-1?Q?kLnxJPECQeDZ2IadwkuSHJqkPWVdl17a4fSrnDXng82YW84BfmwevATjMf?=
 =?iso-8859-1?Q?DTqdBiMB5tT9P79T2pftUgOWPjC6w4Fb/4XPriKu65JEmD0mzWNyaWSQ7T?=
 =?iso-8859-1?Q?ITm4CSFR8oahilOd92EPPz17H1Lk34OG9mA9v/VuGNQO8NdQpUMxA5EXjs?=
 =?iso-8859-1?Q?TyMdDFfiuAQ7X8vBtkTM8rrcbbSUdRxZ25VheBk/7HoKKY3qOvuIM9BSIE?=
 =?iso-8859-1?Q?ReFGZJSNTOqnJKwbIxpkk/0STHCbTv2sEMQ9nuoX5LPMwsRPMT0bEdj9wZ?=
 =?iso-8859-1?Q?01EFDq343q7UGRJae5VpX1YfgErL+zrlYyagY+LU9IWVrSVIJrp3294m+1?=
 =?iso-8859-1?Q?N+CT9OeXDo/aD0uH0UqwjU7v9ulBHsevjUnbkYvpa8eLuBF9bWIun2fanS?=
 =?iso-8859-1?Q?7j44MNG1tVDw14wW1X+a/NB/bb3F1xs6arF1S0oBh1h1nWNoz6ltSb3iwS?=
 =?iso-8859-1?Q?gfS47j3K3RuFlthJZNKic8TwkMnOK/dS/DVeXWYiTOmn2N10MvC+75cZUZ?=
 =?iso-8859-1?Q?CpP+O+HxFHwYFVsosu768htF6eHgop8=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acd06d94-67d8-467e-243d-08de7dcc3047
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Mar 2026 11:08:26.0310
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: e4WSfxWyCKueygyCsJC6swW/fwfuIaiKHOdObpxVS2Z2PMvVr8qZJ/MGfx5o5EGYntWyDkhnExk2sy2//qMjIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB9695
X-Rspamd-Queue-Id: A4E8A237967
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:stewart.hildebrand@amd.com,m:roger.pau@citrix.com,m:Mykyta_Poturai@epam.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,amd.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	NEURAL_HAM(-0.00)[-0.985];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

From: Stewart Hildebrand <stewart.hildebrand@amd.com>

Export functions required for SR-IOV support.

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
Reviewed-by: Teddy Astie <teddy.astie@vates.tech>
---
v1->v2:
* collect RBs
---
 xen/drivers/vpci/header.c | 20 +++++++++++---------
 xen/include/xen/vpci.h    |  6 ++++++
 2 files changed, 17 insertions(+), 9 deletions(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index 5202518e83..07ec991a12 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -610,9 +610,9 @@ static void cf_check bar_write(
     pci_conf_write32(pdev->sbdf, reg, val);
 }
=20
-static void cf_check guest_mem_bar_write(const struct pci_dev *pdev,
-                                         unsigned int reg, uint32_t val,
-                                         void *data)
+void cf_check vpci_guest_mem_bar_write(const struct pci_dev *pdev,
+                                       unsigned int reg, uint32_t val,
+                                       void *data)
 {
     struct vpci_bar *bar =3D data;
     bool hi =3D false;
@@ -652,8 +652,8 @@ static void cf_check guest_mem_bar_write(const struct p=
ci_dev *pdev,
     bar->guest_addr =3D guest_addr;
 }
=20
-static uint32_t cf_check guest_mem_bar_read(const struct pci_dev *pdev,
-                                            unsigned int reg, void *data)
+uint32_t cf_check vpci_guest_mem_bar_read(const struct pci_dev *pdev,
+                                          unsigned int reg, void *data)
 {
     const struct vpci_bar *bar =3D data;
     uint32_t reg_val;
@@ -959,8 +959,9 @@ int vpci_init_header(struct pci_dev *pdev)
             bars[i].type =3D VPCI_BAR_MEM64_HI;
             rc =3D vpci_add_register(pdev->vpci,
                                    is_hwdom ? vpci_hw_read32
-                                            : guest_mem_bar_read,
-                                   is_hwdom ? bar_write : guest_mem_bar_wr=
ite,
+                                            : vpci_guest_mem_bar_read,
+                                   is_hwdom ? bar_write
+                                            : vpci_guest_mem_bar_write,
                                    reg, 4, &bars[i]);
             if ( rc )
                 goto fail;
@@ -1018,8 +1019,9 @@ int vpci_init_header(struct pci_dev *pdev)
         bars[i].prefetchable =3D val & PCI_BASE_ADDRESS_MEM_PREFETCH;
=20
         rc =3D vpci_add_register(pdev->vpci,
-                               is_hwdom ? vpci_hw_read32 : guest_mem_bar_r=
ead,
-                               is_hwdom ? bar_write : guest_mem_bar_write,
+                               is_hwdom ? vpci_hw_read32
+                                        : vpci_guest_mem_bar_read,
+                               is_hwdom ? bar_write : vpci_guest_mem_bar_w=
rite,
                                reg, 4, &bars[i]);
         if ( rc )
             goto fail;
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index a98ddbb32e..dd233b8b03 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -78,6 +78,12 @@ void vpci_write(pci_sbdf_t sbdf, unsigned int reg, unsig=
ned int size,
 uint32_t cf_check vpci_read_val(
     const struct pci_dev *pdev, unsigned int reg, void *data);
=20
+void cf_check vpci_guest_mem_bar_write(const struct pci_dev *pdev,
+                                       unsigned int reg, uint32_t val,
+                                       void *data);
+uint32_t cf_check vpci_guest_mem_bar_read(const struct pci_dev *pdev,
+                                          unsigned int reg, void *data);
+
 /* Passthrough handlers. */
 uint32_t cf_check vpci_hw_read8(
     const struct pci_dev *pdev, unsigned int reg, void *data);
--=20
2.51.2

