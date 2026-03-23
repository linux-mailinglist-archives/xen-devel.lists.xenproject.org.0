Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MKaTNgXEwWlUWQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2026 23:51:49 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A652FE8E2
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2026 23:51:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1259653.1553078 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4o7T-0001rL-GH; Mon, 23 Mar 2026 22:51:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1259653.1553078; Mon, 23 Mar 2026 22:51:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4o7T-0001lu-8Q; Mon, 23 Mar 2026 22:51:35 +0000
Received: by outflank-mailman (input) for mailman id 1259653;
 Mon, 23 Mar 2026 22:51:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P8gh=BX=epam.com=milan_djokic@srs-se1.protection.inumbo.net>)
 id 1w4o7Q-0001IP-MA
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2026 22:51:32 +0000
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazon11021140.outbound.protection.outlook.com
 [40.107.130.140]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d57ce2ab-270a-11f1-9ccf-f158ae23cfc8;
 Mon, 23 Mar 2026 23:51:31 +0100 (CET)
Received: from VI1PR03MB5088.eurprd03.prod.outlook.com (2603:10a6:803:c2::20)
 by AS8PR03MB7653.eurprd03.prod.outlook.com (2603:10a6:20b:34b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Mon, 23 Mar
 2026 22:51:28 +0000
Received: from VI1PR03MB5088.eurprd03.prod.outlook.com
 ([fe80::8471:b7dd:8a1c:c30]) by VI1PR03MB5088.eurprd03.prod.outlook.com
 ([fe80::8471:b7dd:8a1c:c30%6]) with mapi id 15.20.9723.022; Mon, 23 Mar 2026
 22:51:28 +0000
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
X-Inumbo-ID: d57ce2ab-270a-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pkqo6b/VYSu3slkL+hGGP+w33FD5kvukCVnpByoCYQ1e+7J/tA73ZVY1raZGsCmheFNv2jf56pir0/LnSD5VvXrAXaPQJY4i6LTczV+bOJ7T9kZSSAPFJoGNy/ld1JXg2LL7S1EUlLkOY9Pa+LsEu3efTN18BXubyMiT1yFfToe2BzTdu/wDDGopLgUk5xENzuU9KJ4JDUh6VA1Qlkf1toIt37WtwOuP78CZyv+EV3t+nzfMZucWkv5dlluSUr3n+bI7UKejih3ni2xIJkzRMW6ujw9o3LBpHXdLq5umoNhKhzd6DKJDrKczZpt9OZ37fi+mDkD8HFjh5IUDt7sEVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XbDC0a5nibgzeF5+UsHAJm7Cq8gQ7KacSzA3s/TbKVQ=;
 b=mnrtO6A9uj0nz4QIjog7C1OrWnsaJgvhw75UjHh570RGD3r66j2dB9PnyLlNny6eS93yIrUlzj/JmcuSSiryAEXisR4zRmjrOk1XmloYAIvhXIY498w3BVM+Y+Oy8ygqNTtTAPaCBoYSWvf1pc+wSw7Grai1XepQ5Xv90N5biSVm6gWLYg+YWZIs5D4aQCfv3sU95dDafQTZxkf1qnxdn3zD4sf3nixf2Z2PF+RO6R/1SSheN/Ohv36RYA66ZQUqYOL7PiiCD7oDjL2mIscNVITFgGTdvBTM9OJ7dWIJF9e5M5pSzEvwN+LMOJfs+I/cC69hYK9a7Adue46TTjw/RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XbDC0a5nibgzeF5+UsHAJm7Cq8gQ7KacSzA3s/TbKVQ=;
 b=gqwGmgdvbQobgDhI+4DDARrohK64lNMGD3jBj63BZZgZExtO0Lj4emhtkPzZmPCGDSedAj0CK6JwQIVNWIbtpGhu84qHERAp9T9/MgNP2jQ5ouaxelK0wBvSnjQ8mmcz+A3x0DXUoBcVD/jcDvNOs+CWKFaXss2as8l2AjA49+CW58R5Lldt4Em6NfTpC+J4fGuhmTdAAs9KrIl2nOE20nrncoWxVlQqfEN1A+DyNTPDhDWtqKBc0ljqh+U0Y/2POH7zNiP1NsH7yF86o7X2A6jj82RUTYX25OKPRw9ccfm6ENZb8whX2r559muLKqpD2VFqw4SpYHqpYOLlxAuCDw==
From: Milan Djokic <milan_djokic@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Rahul Singh <rahul.singh@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Jan Beulich <jbeulich@suse.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Milan Djokic
	<milan_djokic@epam.com>
Subject: [PATCH v2 11/23] xen/arm: vsmmuv3: Attach Stage-1 configuration to
 SMMUv3 hardware
Thread-Topic: [PATCH v2 11/23] xen/arm: vsmmuv3: Attach Stage-1 configuration
 to SMMUv3 hardware
Thread-Index: AQHcuxeVuD6wQXCP2US+GuPZccSubw==
Date: Mon, 23 Mar 2026 22:51:28 +0000
Message-ID:
 <364e3781c041e12343d15ca7a17a420463281e57.1774305918.git.milan_djokic@epam.com>
References: <cover.1774305918.git.milan_djokic@epam.com>
In-Reply-To: <cover.1774305918.git.milan_djokic@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB5088:EE_|AS8PR03MB7653:EE_
x-ms-office365-filtering-correlation-id: a049d1aa-fedc-4782-15c3-08de892eb7f3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700021|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info:
 xtSUfXpOy44bkTsu14gkCxsbh/jaCxh5gqljWmxV9erD5y9PRpV0viiMiWPiTC3EBG2hosmupb4BFtDRBvb9ocgKMzF4V8CZPXui32+iIyLMKttom3cTS8q/mlqOYZoehGMMGMbX7aok32f9R0GzJOs7oUOFruOt/LlUZmxo8XhtKipptYXfQ5gAiJgbjaTLohq5Ahpdu8u2o/KwtLA6Vo4S7w0ScyBnEbutaDIvZhWhBvJqeXjPa2USVta5yfGnvZMbOMVbviUIqyOuvDXkO1rn08o0I9Fwv/ePKXCONYqjKXFxWUv4oAfHh19AZ02qk4idDs4em+VUH07jucd+2xEH7NMtnpCD+GfJ1B/fQnCab3CslWk7my+sjyoym2Uxx1Re92F3kdljXNRGuC7jePja8b/BdY2Pd80jHVjaxbs8nbW8fAsiume4SI5iOYPmpRRg3F6lDt4apOtSPV7kZ16zZTkqs/mc54oAqKbyJGLPsENXIE2vbXw6V5jgQ7zDIiZDFmBzqKPL1K9WzbLc7d8v9GVk0NMquXSJCbL2LDa29s/Rec4DA1FlvF4zondtPQjK2AbzJapaLLfb1XZ2BpHVz56GYsrz6uKb/7ETGhlYKl+LDnvwor1FvlwfSJ77tmGbUgiQnLlXXa7MfEyAzWSz5QkPGs8t4aOPQ5vugV6TDGzwO00FEcOCOxGXkShuGFYl5jQv3Y37Rn2ZwWwPZ70M5FcpgpIOLeRec+w8ONbBeH9Mbk87I95GPO+oh7rs0WjJKmWyjaTvFCgaKbFhzFuBWPRoQg0WWgJGfu9OwnA=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB5088.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?GE7BWhKeYkbJWEs1noLDcOXDn0DO1Xj5kBRYLWhtC8DO+vMDcthGOAB9M+?=
 =?iso-8859-1?Q?gLO+DGX5zyPKA7i4SeX9ty+5E3QBihF3EGzZuCDCCwOu/OWkWW9YyS4TpS?=
 =?iso-8859-1?Q?+sSdUuynxpxcRk/yZM83V5VJ1OsQpqDurlpLvCNbuartVexOm9w+ztytKF?=
 =?iso-8859-1?Q?bV87ragrsb1EKu5Tnc2BRNbvmMMju4w6MgkYwb9WZCrxUDVorr+oMhqARs?=
 =?iso-8859-1?Q?1R0CabJ0mDptWwfvGtwLR8fPh2lLdSNFEfvJG8rOz+gj/7GzxXdyKlwDGJ?=
 =?iso-8859-1?Q?xqy3JUFWCH7566wkALw9YFChPpkq5cYWJt4NDat7ihU82nIhezBJDxvy5z?=
 =?iso-8859-1?Q?qgTqDugm8CsBAEegS/DXTNH8ibjJ8hC4cXAy/B0JQUXPvrMBYiN946o+qb?=
 =?iso-8859-1?Q?Ej4ibsPVVyUD/I1eGllKQDF0aQHcYfEdSBs8GEZT4AGmt1IlSMPC31dGQi?=
 =?iso-8859-1?Q?ruVL4q3RBxu+miay24GIOhpmB4ocwjEicsGQ6KxVPkAxj3AoMXqRfz87oo?=
 =?iso-8859-1?Q?WcgxVtowhTnnBtMMitFnhD+oSm5k8YaILNBrokpoyQRiQ0rxTdRQ+IJp8b?=
 =?iso-8859-1?Q?N3grQOiywjTuMxJ7Kuo15kq9S8mKv5rz0oQa4eYQV0HCIz84Cu6wVxRNaH?=
 =?iso-8859-1?Q?RqvXk2lckxAgLi7qgfI1FszllRlvZeLjDZPRdnBAZ+AlFbOC7tmCNx9Jry?=
 =?iso-8859-1?Q?eIQAXC2XYymjjVL6AKf0MW7T+m/ka985HxoYwxl6mlfIMRQm1fsAdtJ5lE?=
 =?iso-8859-1?Q?C9B7QZD80ZQd15fblKMX2+kUJqEJliBWEM5Tp+LWKf/0WDF/UZLWY2QB3b?=
 =?iso-8859-1?Q?EngxxH1JNfK3BuefQRKAjBqCUduiw6Ij/iHdhFhH0qHBj/Vq87u7FRktKz?=
 =?iso-8859-1?Q?fspwDdnQ/ZvdgB062FZWaEauxsMY9D3I1huyBKuG99rmT/lmS1h38fZyV7?=
 =?iso-8859-1?Q?A827O9xLs8+cxjfERDDM6+4IXQIfaYIT9W17BQpnT6RlYBOcs034u5zTMT?=
 =?iso-8859-1?Q?RKu6cJLon/uO4z/iRFbMTOl4SDri+l1Id4cuzJhih/SqU4l1SDdotzeyEN?=
 =?iso-8859-1?Q?19acFwyn/h5jEnxRjxM2vnpj0BOYSIqY3wXF0+XU6j+/cO185S9elNUfMC?=
 =?iso-8859-1?Q?OQPGALbAvIaY2xs+KuCjoP/HuhNxbTklI/UPK+neEolxNGEdDT6TnFLBzR?=
 =?iso-8859-1?Q?C/ngX3MWQcstx8vI2KTuzFnAzKSGe+nSQlxZ/0cWt0L5zPeGgXfIy6BD/E?=
 =?iso-8859-1?Q?f/jVkJ3h4lB9GeBKaVdOhEZCIZ2NWdwoEc7JZuc12qDBqXL2crIpHG6VIm?=
 =?iso-8859-1?Q?ZVjrGQFahqFVU77DLN/SvN9c8x0IdrIpdpsjb0ERwiYTBDKrT16Yswxy/6?=
 =?iso-8859-1?Q?Pt7wlKgAJKURNgp4k8RmtyXcmnInzkIvfwQadEYpTi25lV00kMSMeuoWvd?=
 =?iso-8859-1?Q?g/EnBiKjhYmVneyI1gkdX+8lVZKcfOIzxBy7+pzWyaYcFbHRQpvxOKaw9z?=
 =?iso-8859-1?Q?dYrhkws2ywvEWUqk3F+QajsFHR1kqB31xEGIBPW8hXETPDafwuvMLh/NC8?=
 =?iso-8859-1?Q?RGS9vZDsUEs50R1cpHwF7y+XqM/EJBFfL4Pb6l2uG4jkuRq0Zyufh4enBu?=
 =?iso-8859-1?Q?ISp1YAtZkdZBzMLuJL1UUaD6d5AUpFiMYVM4ylOivyxHXk55Zxk63YInuG?=
 =?iso-8859-1?Q?oQMBZA62/xxQ/H84O8KHJxt5ilHwBtFrqoxF5fYXJ5LAt3qJM8Rm3AxeLe?=
 =?iso-8859-1?Q?KEGbgrkKkUsPudWLX6aO2Di88mJvqPU5tV7H0wwitjcA3BwAswNTj5rA+z?=
 =?iso-8859-1?Q?bM6KPTBD+yEtTfErUuPU/cmKxEr1XzQ=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB5088.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a049d1aa-fedc-4782-15c3-08de892eb7f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2026 22:51:28.0610
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xZVqC+Z8JSIbHxcXdzrMg3Es+fjqCoCqE4BMLxaSykrLIPWRWOrTylPmGIRTx9+3hQj0KsuOWrE5E0NFrAQFQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7653
X-Spamd-Result: default: False [-1.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[milan_djokic@epam.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:rahul.singh@arm.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:milan_djokic@epam.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,epam.com:dkim,epam.com:email,epam.com:mid];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[milan_djokic@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[10];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 77A652FE8E2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Rahul Singh <rahul.singh@arm.com>

Attach the Stage-1 configuration to device STE to support nested
translation for the guests.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Signed-off-by: Milan Djokic <milan_djokic@epam.com>
---
 xen/arch/arm/include/asm/iommu.h       |  7 +++
 xen/drivers/passthrough/arm/smmu-v3.c  | 79 ++++++++++++++++++++++++++
 xen/drivers/passthrough/arm/smmu-v3.h  |  1 +
 xen/drivers/passthrough/arm/vsmmu-v3.c | 18 ++++++
 xen/include/xen/iommu.h                | 13 +++--
 5 files changed, 114 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/include/asm/iommu.h b/xen/arch/arm/include/asm/io=
mmu.h
index ad15477e24..56bc9314a7 100644
--- a/xen/arch/arm/include/asm/iommu.h
+++ b/xen/arch/arm/include/asm/iommu.h
@@ -20,6 +20,13 @@ struct arch_iommu
     void *priv;
 };
=20
+struct iommu_guest_config {
+    paddr_t     s1ctxptr;
+    uint8_t     config;
+    uint8_t     s1fmt;
+    uint8_t     s1cdmax;
+};
+
 const struct iommu_ops *iommu_get_ops(void);
 void iommu_set_ops(const struct iommu_ops *ops);
=20
diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthroug=
h/arm/smmu-v3.c
index 87612df21d..cf8f638a49 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.c
+++ b/xen/drivers/passthrough/arm/smmu-v3.c
@@ -2810,6 +2810,37 @@ static struct arm_smmu_device *arm_smmu_get_by_dev(c=
onst struct device *dev)
 	return NULL;
 }
=20
+static struct iommu_domain *arm_smmu_get_domain_by_sid(struct domain *d,
+				u32 sid)
+{
+	int i;
+	unsigned long flags;
+	struct iommu_domain *io_domain;
+	struct arm_smmu_domain *smmu_domain;
+	struct arm_smmu_master *master;
+	struct arm_smmu_xen_domain *xen_domain =3D dom_iommu(d)->arch.priv;
+
+	/*
+	 * Loop through the &xen_domain->contexts to locate a context
+	 * assigned to this SMMU
+	 */
+	list_for_each_entry(io_domain, &xen_domain->contexts, list) {
+		smmu_domain =3D to_smmu_domain(io_domain);
+
+		spin_lock_irqsave(&smmu_domain->devices_lock, flags);
+		list_for_each_entry(master, &smmu_domain->devices, domain_head) {
+			for (i =3D 0; i < master->num_streams; i++) {
+				if (sid !=3D master->streams[i].id)
+					continue;
+				spin_unlock_irqrestore(&smmu_domain->devices_lock, flags);
+				return io_domain;
+			}
+		}
+		spin_unlock_irqrestore(&smmu_domain->devices_lock, flags);
+	}
+	return NULL;
+}
+
 static struct iommu_domain *arm_smmu_get_domain(struct domain *d,
 				struct device *dev)
 {
@@ -3022,6 +3053,53 @@ static void arm_smmu_iommu_xen_domain_teardown(struc=
t domain *d)
 	xfree(xen_domain);
 }
=20
+static int arm_smmu_attach_guest_config(struct domain *d, u32 sid,
+		struct iommu_guest_config *cfg)
+{
+	int ret =3D -EINVAL;
+	unsigned long flags;
+	struct arm_smmu_master *master;
+	struct arm_smmu_domain *smmu_domain;
+	struct arm_smmu_xen_domain *xen_domain =3D dom_iommu(d)->arch.priv;
+	struct iommu_domain *io_domain =3D arm_smmu_get_domain_by_sid(d, sid);
+
+	if (!io_domain)
+		return -ENODEV;
+
+	smmu_domain =3D to_smmu_domain(io_domain);
+
+	spin_lock(&xen_domain->lock);
+
+	switch (cfg->config) {
+	case ARM_SMMU_DOMAIN_ABORT:
+		smmu_domain->abort =3D true;
+		break;
+	case ARM_SMMU_DOMAIN_BYPASS:
+		smmu_domain->abort =3D false;
+		break;
+	case ARM_SMMU_DOMAIN_NESTED:
+		/* Enable Nested stage translation. */
+		smmu_domain->stage =3D ARM_SMMU_DOMAIN_NESTED;
+		smmu_domain->s1_cfg.s1ctxptr =3D cfg->s1ctxptr;
+		smmu_domain->s1_cfg.s1fmt =3D cfg->s1fmt;
+		smmu_domain->s1_cfg.s1cdmax =3D cfg->s1cdmax;
+		smmu_domain->abort =3D false;
+		break;
+	default:
+		goto out;
+	}
+
+	spin_lock_irqsave(&smmu_domain->devices_lock, flags);
+	list_for_each_entry(master, &smmu_domain->devices, domain_head)
+		arm_smmu_install_ste_for_dev(master);
+	spin_unlock_irqrestore(&smmu_domain->devices_lock, flags);
+
+	ret =3D 0;
+out:
+	spin_unlock(&xen_domain->lock);
+	return ret;
+}
+
 static const struct iommu_ops arm_smmu_iommu_ops =3D {
 	.page_sizes		=3D PAGE_SIZE_4K,
 	.init			=3D arm_smmu_iommu_xen_domain_init,
@@ -3034,6 +3112,7 @@ static const struct iommu_ops arm_smmu_iommu_ops =3D =
{
 	.unmap_page		=3D arm_iommu_unmap_page,
 	.dt_xlate		=3D arm_smmu_dt_xlate,
 	.add_device		=3D arm_smmu_add_device,
+	.attach_guest_config =3D arm_smmu_attach_guest_config
 };
=20
 static __init int arm_smmu_dt_init(struct dt_device_node *dev,
diff --git a/xen/drivers/passthrough/arm/smmu-v3.h b/xen/drivers/passthroug=
h/arm/smmu-v3.h
index fab4fd5a26..df3b7ec1b5 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.h
+++ b/xen/drivers/passthrough/arm/smmu-v3.h
@@ -398,6 +398,7 @@ enum arm_smmu_domain_stage {
 	ARM_SMMU_DOMAIN_S2,
 	ARM_SMMU_DOMAIN_NESTED,
 	ARM_SMMU_DOMAIN_BYPASS,
+	ARM_SMMU_DOMAIN_ABORT,
 };
=20
 /* Xen specific code. */
diff --git a/xen/drivers/passthrough/arm/vsmmu-v3.c b/xen/drivers/passthrou=
gh/arm/vsmmu-v3.c
index 39ed4dc577..6d3636b18b 100644
--- a/xen/drivers/passthrough/arm/vsmmu-v3.c
+++ b/xen/drivers/passthrough/arm/vsmmu-v3.c
@@ -224,8 +224,11 @@ static int arm_vsmmu_handle_cfgi_ste(struct virt_smmu =
*smmu, uint64_t *cmdptr)
 {
     int ret;
     uint64_t ste[STRTAB_STE_DWORDS];
+    struct domain *d =3D smmu->d;
+    struct domain_iommu *hd =3D dom_iommu(d);
     struct arm_vsmmu_s1_trans_cfg s1_cfg =3D {0};
     uint32_t sid =3D smmu_cmd_get_sid(cmdptr[0]);
+    struct iommu_guest_config guest_cfg =3D {0};
=20
     ret =3D arm_vsmmu_find_ste(smmu, sid, ste);
     if ( ret )
@@ -235,6 +238,21 @@ static int arm_vsmmu_handle_cfgi_ste(struct virt_smmu =
*smmu, uint64_t *cmdptr)
     if ( ret )
         return (ret =3D=3D -EAGAIN ) ? 0 : ret;
=20
+    guest_cfg.s1ctxptr =3D s1_cfg.s1ctxptr;
+    guest_cfg.s1fmt =3D s1_cfg.s1fmt;
+    guest_cfg.s1cdmax =3D s1_cfg.s1cdmax;
+
+    if ( s1_cfg.bypassed )
+        guest_cfg.config =3D ARM_SMMU_DOMAIN_BYPASS;
+    else if ( s1_cfg.aborted )
+        guest_cfg.config =3D ARM_SMMU_DOMAIN_ABORT;
+    else
+        guest_cfg.config =3D ARM_SMMU_DOMAIN_NESTED;
+
+    ret =3D hd->platform_ops->attach_guest_config(d, sid, &guest_cfg);
+    if ( ret )
+        return ret;
+
     return 0;
 }
=20
diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
index 37c4a1dc82..9fdcf03630 100644
--- a/xen/include/xen/iommu.h
+++ b/xen/include/xen/iommu.h
@@ -311,6 +311,10 @@ static inline int iommu_add_dt_pci_sideband_ids(struct=
 pci_dev *pdev)
=20
 #endif /* HAS_DEVICE_TREE_DISCOVERY */
=20
+#if defined(CONFIG_HAS_PASSTHROUGH) || defined(CONFIG_ARM)
+#include <asm/iommu.h>
+#endif
+
 struct page_info;
=20
 /*
@@ -387,6 +391,11 @@ struct iommu_ops {
 #endif
     /* Inhibit all interrupt generation, to be used at shutdown. */
     void (*quiesce)(void);
+
+#ifdef CONFIG_ARM
+    int (*attach_guest_config)(struct domain *d, u32 sid,
+                               struct iommu_guest_config *cfg);
+#endif
 };
=20
 /*
@@ -407,10 +416,6 @@ extern int iommu_add_extra_reserved_device_memory(unsi=
gned long start,
 extern int iommu_get_extra_reserved_device_memory(iommu_grdm_t *func,
                                                   void *ctxt);
=20
-#ifdef CONFIG_HAS_PASSTHROUGH
-#include <asm/iommu.h>
-#endif
-
 #ifndef iommu_call
 # define iommu_call(ops, fn, args...) ((ops)->fn(args))
 # define iommu_vcall iommu_call
--=20
2.43.0

