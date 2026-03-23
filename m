Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GEtNLAbEwWlUWQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2026 23:51:50 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D1B22FE917
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2026 23:51:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1259651.1553069 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4o7R-0001Zf-Sf; Mon, 23 Mar 2026 22:51:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1259651.1553069; Mon, 23 Mar 2026 22:51:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4o7R-0001VV-Lu; Mon, 23 Mar 2026 22:51:33 +0000
Received: by outflank-mailman (input) for mailman id 1259651;
 Mon, 23 Mar 2026 22:51:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P8gh=BX=epam.com=milan_djokic@srs-se1.protection.inumbo.net>)
 id 1w4o7Q-0001IP-8l
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2026 22:51:32 +0000
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazon11021140.outbound.protection.outlook.com
 [40.107.130.140]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d42862d5-270a-11f1-9ccf-f158ae23cfc8;
 Mon, 23 Mar 2026 23:51:29 +0100 (CET)
Received: from VI1PR03MB5088.eurprd03.prod.outlook.com (2603:10a6:803:c2::20)
 by AS8PR03MB7653.eurprd03.prod.outlook.com (2603:10a6:20b:34b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Mon, 23 Mar
 2026 22:51:27 +0000
Received: from VI1PR03MB5088.eurprd03.prod.outlook.com
 ([fe80::8471:b7dd:8a1c:c30]) by VI1PR03MB5088.eurprd03.prod.outlook.com
 ([fe80::8471:b7dd:8a1c:c30%6]) with mapi id 15.20.9723.022; Mon, 23 Mar 2026
 22:51:27 +0000
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
X-Inumbo-ID: d42862d5-270a-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GZaHfpskWRsWCWvVOX2nOi+PPWYpwFkzMMpmxB27zeefKxF+WkkvcNjOgE8hkocMD2ibGF+kT2i92fP9zH7j6BplCQB2ANWII1X4LsfukjtQbImpZC9xsbOU84BDLdFJamZ2YMT4DPIJEY21+QWv80PmvY2OwPADT4D8XSDByU7rs2XcCEAQbfbKNF/1UuP5IWqrdYom4IZxv17zzpt4wEwiUYbchVq72dYJXb1d2JZv1TMzQtwPqeak2VdvmEmPh/uCXxEnTxwh5nVuJ/FmCAJobUT/xs6W0sna6Lbk8wsBli9n/J8CYZ2CnAvb3ZYu60Ognxqs6L4UOPGX2P2HuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0XZSO1UVrC8SXwDBQpjDCvjjP780VAbXtnJxzn+t7Pc=;
 b=tOX+UijnQiLRHJ+kS1RgkQkzAov/ZyORQoDYdMzsgfTcQror3I4C84LQlLWDujn5QDwgg6iyGZq9o1/DoiX8l9G9S7aLASBR2uUSlxxP6NZQj/Zh6Z3Iwnk0S9SuccI23+pxp5Gbo48JHzvz+isvP1JFVL8EfaI9oqZohzOBaXXajKcoSqEvQvFAL71DBNh+AN4ZW2xj3hWV+E1PxPPB9C19k7BLJweqYmM/j6mdXqNaZvRt+THoeKdGDFoI5gu+TKIg+tPe0uuyPOtrMMSSLJ0ultbhGjFHGzZbLIrg9ZjFeJfuFDuL+AjOpAMBymhi/bcUslNrATgfZWPMQ6Ke4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0XZSO1UVrC8SXwDBQpjDCvjjP780VAbXtnJxzn+t7Pc=;
 b=bpdJxJpk22n2LhrmUPCEA6nGTh46G39yF15w8WU2AuhsN4SAzwuIGUKh6LhQvdE2IozyDPyFt/ykZ/N1mp0XXrkseWdcKS6SL6Tl7fkFZXMBh+FKznkH2xLpYhju5p8LfrrPia7z0fbZ+eCDbdvayvkrFlMLZRLhwKJNRUmBB45lkNj2zZ2pau+g9J6YVyp8C4rKsb6VxubM+2p1YCawXhjhNerv+elPJ2IscfU4vT4Hg2LhJjcDm1uLNaBCZIAwtG4yTn6+tWx08okO5nXsq5tgknae5+rVnotzLTADwJbLXe/qTSls98jZJpc24KMuQI9r7lN9ynFQDlo8MuATig==
From: Milan Djokic <milan_djokic@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Rahul Singh <rahul.singh@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Milan Djokic <milan_djokic@epam.com>
Subject: [PATCH v2 10/23] xen/arm: vsmmuv3: Add support for command
 CMD_CFGI_STE
Thread-Topic: [PATCH v2 10/23] xen/arm: vsmmuv3: Add support for command
 CMD_CFGI_STE
Thread-Index: AQHcuxeUYaeevOD7N0GVZ8vVI9YqNQ==
Date: Mon, 23 Mar 2026 22:51:27 +0000
Message-ID:
 <5e653fb05843d18725b6eaf50a8d7766ab82dabc.1774305918.git.milan_djokic@epam.com>
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
x-ms-office365-filtering-correlation-id: e5d9561b-6371-44ee-13ff-08de892eb762
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700021|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info:
 P5pGoOuqQwrIIsuvHAjAq0I1F6P9rdTHcLdU/+PUgqmg4V6U1pnZ/EJPmfF4foMZX127aBY/Jh9KGU8eTOIRcST5SvBPYPx1bwMa/iX76YQlz4y8g0YcMp4ZOhfAgd9PrKgHeTO0lK6WdYCwg/CwKVAYO7Igyy1wq+0ymyZDzIX4EE4XRHuZ+9HUYqTZ8BpbyssOOBtJfiZkKYp7om1LHVu9Aj0VK9bzEwj1I5J9dIrlrXtSxKT9dZOJmYCdARW5w95H80c1QpbKiRtZNCEqp7ixbuqitw0BUXu0ZKUCS4YkK+b1+K89DTGpUbey+VDuG+jFVJBdRkLvmc1/Fhz51ViZb5cfquYcRRoov5Nr1gEwJSkIbIHCxj0G7ck0VfG/InOkdN2RT4w1iEZtfjwtb4b7PoYreP0iSc5q42jNdt38ZWtt1JRaPsKdQNdYOAAnMkBVgaX/q0z5B75zb8m+i9nqnXjbzUkWo58DoHLkksHfMolHy9LTTnfybM8OeJQ3DfE96pTeiTdt0P9kYU3YYXTvLnALx/FEMAt1Re248T/gQjJxCZ7IuBYBKrmbqZbLD6/9dKbPHac2MZocGnc+sXXP4yKuEss7PXSjeo/PcRKyX8PjBQ5h3YDkiZjVh5IFj56qwB/4WVZFStRkbOu/kp8ecT6bsjhcMGV1g8TmTAteef6fUHT5Hp03GAgWgJweg0CZlVpdTJ66eMK5QyV77eLGjLSKtkYi7ntGBHzSfi3oaFt/u0xyy+tbv+T6EP56qiGp7ktyR8PlDIFFrudTKmoZrS0h9QoR6Y1A0juWrwU=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB5088.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?NQQKINRMe4tg6nznZCSWi3TnWWwNPzocRHAFCd2vDZaRRYz2Zo7Ko3C03g?=
 =?iso-8859-1?Q?ksVwAFQB+/EKdSpT31bEnYn2GK+diZjGpW1nHqy6KI35wYN4XWGDb/M62m?=
 =?iso-8859-1?Q?fOxsr4dbYbnWv64F2vY9ftXgIc1zJ21X0zO0LzmlkHWkdsy4x9Busz3gfu?=
 =?iso-8859-1?Q?W6e8W8zZi5Of2WcC88WM7OGuTaCp4tDGGh44KKrVtcxpfvprdKBBaLBb5h?=
 =?iso-8859-1?Q?gejGofaIwMj2SuHROZsfRzBnd6ZrEIZ65NCYkyZ2F38VArzOKrn8nS7xRN?=
 =?iso-8859-1?Q?8Bx6vnHkuVa62GcHLIuwh0mLGS0ExyXwkUQ9EGqg66Tm0nPHHdaC4zolK6?=
 =?iso-8859-1?Q?EdCy7Xbt5puKx95NvI6sb7cbT1b9Qw6sh2t+EEYEHGZ4zuP3IBUGilzrug?=
 =?iso-8859-1?Q?Jaebow0kn39+LiGPP2XQYBLzzF6e7aD7M+ggrxBEw6Ui4li+SSnzOCb5zA?=
 =?iso-8859-1?Q?L1ACrq4DZ6hMgRPjTpF2zCJKU2zmf01jcV1pavMcaYwgEFn0fjJ65hJE7k?=
 =?iso-8859-1?Q?6RKeoJg2g7VW8j7mGR/7D8DGPn92TnL87RJBPGzov9s+H/Dtd0sSV7mGIT?=
 =?iso-8859-1?Q?+NmiTw8WT8wj2dtbBuYuCZ01h1vNzOfsRJOzcZMkZbuWou9h3OfYkatj8Q?=
 =?iso-8859-1?Q?xi+i5PCVBJiB3OY75F/EAQo5RXwkCT/UUZQTkRl/ma7LldIOh9Xpbco3Tl?=
 =?iso-8859-1?Q?95dDBRGK5t51T+RYdkpjFstLqNmUNFvwVT10CaIjh+JO/S6t1n62WCOwY8?=
 =?iso-8859-1?Q?aa4LzkC+KwYFAu0mu4360ktykpQteniJW2LO1l3D/x3KaK8VXq7czyBbn/?=
 =?iso-8859-1?Q?jIfIciEhCwTzZ2AtVqKOXFC3tEjPs1rE0iEp5OIegM54s7NwvFd/qB1DaI?=
 =?iso-8859-1?Q?3324FNP9foloBfg2JPTE+p2lJPmjTv6zAdF0sMKf/gUa75gZfZk+PeOr0D?=
 =?iso-8859-1?Q?fNga+B1Ww03peWDwi55nUB33XPs+IUeEPM0nnWpSpupbx/lJsgtROt+If5?=
 =?iso-8859-1?Q?PbvQ53I2sBDL3l0qbU/MtUxEZnemrR+FY5B4uLoOlJ0hrOgX8fHybGKorp?=
 =?iso-8859-1?Q?mbSDhhIImXqAnCpT6hBvqiho6JKo6t3YQj/huJwMoLKtYHeCa/8YLVUC+5?=
 =?iso-8859-1?Q?brak40tkN2qebSnhhD9mUbll+1xKLjo9RtFveOF4WDQjVPth0ptvnOZG59?=
 =?iso-8859-1?Q?XSpsZMrf5A2h4Snbtc6IwaWYYpM1vDST17W5ooiOVWzqr2d+ZumNPDvEmV?=
 =?iso-8859-1?Q?ScrijBnDjasB2N8ENNxLe4IdraVkGnNk+XKjQdfjiMnaGpH+F+kvgX06ol?=
 =?iso-8859-1?Q?hoKEq1YrAVUt0oaRdTRm0RJlUfwz/G11Gl0AeTOMSHRAlByDgzlJY6yTfi?=
 =?iso-8859-1?Q?WAiUEdLWqn8P7GHxiGDz8O9iRROdPkXYS9P13IRf3pKalf2f9MyU7jQ6K2?=
 =?iso-8859-1?Q?y0uyPdpJG7c/WGaPgkhsexoqqHzSFiO9objBtSM8wyHHZlSfyrvW1R8mbW?=
 =?iso-8859-1?Q?PbLJdizDC38Xa+1DQPJ7Fngp4gpGJFSK/nTtW+BBGylr2Bws+TJOP6O/Ci?=
 =?iso-8859-1?Q?lOSmyuDC/3fjyTrVqBPQfDczEX5YtjvIqE5HmNhLeld26GF/pP294VVvAp?=
 =?iso-8859-1?Q?V18h+4yEqinEy6ZYu35vOd/p+vDTfqY6tNdFolOOEAlPbOvDxTZZwPj5Iw?=
 =?iso-8859-1?Q?4RtzLQlh+z4aBJ3M5ioV8mitDQhismurHBnrCtk/v9gDc7yDIGDxPt00lS?=
 =?iso-8859-1?Q?XE8PLG6eNJJpqlcI1VVK5Z/vu7S4V1c/2uGhekWKDR1kZ7nXId+zmd+4Ea?=
 =?iso-8859-1?Q?dQqJ5Tx/cnzuMnWiouOdHmGN7+SiXmE=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB5088.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5d9561b-6371-44ee-13ff-08de892eb762
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2026 22:51:27.1257
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KCk0okgF7V2k7oyLE+pPzct0CDPH4BO5vGXmwL6Y39NchAA2woAv8p8IeHIDbQ1JhfvVCbxUp5aEKx5piqoOfA==
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:rahul.singh@arm.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:milan_djokic@epam.com,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 4D1B22FE917
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Rahul Singh <rahul.singh@arm.com>

CMD_CFGI_STE is used to invalidate/validate the STE. Emulated vSMMUv3
driver in XEN will read the STE from the guest memory space and capture
the Stage-1 configuration required to support nested translation.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Signed-off-by: Milan Djokic <milan_djokic@epam.com>
---
 xen/drivers/passthrough/arm/vsmmu-v3.c | 148 +++++++++++++++++++++++++
 1 file changed, 148 insertions(+)

diff --git a/xen/drivers/passthrough/arm/vsmmu-v3.c b/xen/drivers/passthrou=
gh/arm/vsmmu-v3.c
index 02fe6a4422..39ed4dc577 100644
--- a/xen/drivers/passthrough/arm/vsmmu-v3.c
+++ b/xen/drivers/passthrough/arm/vsmmu-v3.c
@@ -45,6 +45,21 @@ extern const struct viommu_desc __read_mostly *cur_viomm=
u;
 /* Helper Macros */
 #define smmu_get_cmdq_enabled(x)    FIELD_GET(CR0_CMDQEN, x)
 #define smmu_cmd_get_command(x)     FIELD_GET(CMDQ_0_OP, x)
+#define smmu_cmd_get_sid(x)         FIELD_GET(CMDQ_PREFETCH_0_SID, x)
+#define smmu_get_ste_s1cdmax(x)     FIELD_GET(STRTAB_STE_0_S1CDMAX, x)
+#define smmu_get_ste_s1fmt(x)       FIELD_GET(STRTAB_STE_0_S1FMT, x)
+#define smmu_get_ste_s1stalld(x)    FIELD_GET(STRTAB_STE_1_S1STALLD, x)
+#define smmu_get_ste_s1ctxptr(x)    FIELD_PREP(STRTAB_STE_0_S1CTXPTR_MASK,=
 \
+                                    FIELD_GET(STRTAB_STE_0_S1CTXPTR_MASK, =
x))
+
+/* stage-1 translation configuration */
+struct arm_vsmmu_s1_trans_cfg {
+    paddr_t s1ctxptr;
+    uint8_t s1fmt;
+    uint8_t s1cdmax;
+    bool    bypassed;             /* translation is bypassed */
+    bool    aborted;              /* translation is aborted */
+};
=20
 /* virtual smmu queue */
 struct arm_vsmmu_queue {
@@ -91,6 +106,138 @@ static void dump_smmu_command(uint64_t *command)
     gdprintk(XENLOG_ERR, "cmd 0x%02llx: %016lx %016lx\n",
              smmu_cmd_get_command(command[0]), command[0], command[1]);
 }
+static int arm_vsmmu_find_ste(struct virt_smmu *smmu, uint32_t sid,
+                              uint64_t *ste)
+{
+    paddr_t addr, strtab_base;
+    struct domain *d =3D smmu->d;
+    uint32_t log2size;
+    int strtab_size_shift;
+    int ret;
+
+    log2size =3D FIELD_GET(STRTAB_BASE_CFG_LOG2SIZE, smmu->strtab_base_cfg=
);
+
+    if ( sid >=3D (1 << MIN(log2size, SMMU_IDR1_SIDSIZE)) )
+        return -EINVAL;
+
+    if ( smmu->features & STRTAB_BASE_CFG_FMT_2LVL )
+    {
+        int idx, max_l2_ste, span;
+        paddr_t l1ptr, l2ptr;
+        uint64_t l1std;
+
+        strtab_size_shift =3D MAX(5, (int)log2size - smmu->sid_split - 1 +=
 3);
+        strtab_base =3D smmu->strtab_base & STRTAB_BASE_ADDR_MASK &
+                        ~GENMASK_ULL(strtab_size_shift, 0);
+        idx =3D (sid >> STRTAB_SPLIT) * STRTAB_L1_DESC_DWORDS;
+        l1ptr =3D (paddr_t)(strtab_base + idx * sizeof(l1std));
+
+        ret =3D access_guest_memory_by_gpa(d, l1ptr, &l1std,
+                                         sizeof(l1std), false);
+        if ( ret )
+        {
+            gdprintk(XENLOG_ERR,
+                     "Could not read L1PTR at 0X%"PRIx64"\n", l1ptr);
+            return ret;
+        }
+
+        span =3D FIELD_GET(STRTAB_L1_DESC_SPAN, l1std);
+        if ( !span )
+        {
+            gdprintk(XENLOG_ERR, "Bad StreamID span\n");
+            return -EINVAL;
+        }
+
+        max_l2_ste =3D (1 << span) - 1;
+        l2ptr =3D FIELD_PREP(STRTAB_L1_DESC_L2PTR_MASK,
+                    FIELD_GET(STRTAB_L1_DESC_L2PTR_MASK, l1std));
+        idx =3D sid & ((1 << smmu->sid_split) - 1);
+        if ( idx > max_l2_ste )
+        {
+            gdprintk(XENLOG_ERR, "idx=3D%d > max_l2_ste=3D%d\n",
+                     idx, max_l2_ste);
+            return -EINVAL;
+        }
+        addr =3D l2ptr + idx * sizeof(*ste) * STRTAB_STE_DWORDS;
+    }
+    else
+    {
+        strtab_size_shift =3D log2size + 5;
+        strtab_base =3D smmu->strtab_base & STRTAB_BASE_ADDR_MASK &
+                      ~GENMASK_ULL(strtab_size_shift, 0);
+        addr =3D strtab_base + sid * sizeof(*ste) * STRTAB_STE_DWORDS;
+    }
+    ret =3D access_guest_memory_by_gpa(d, addr, ste, sizeof(*ste), false);
+    if ( ret )
+    {
+        gdprintk(XENLOG_ERR,
+                "Cannot fetch pte at address=3D0x%"PRIx64"\n", addr);
+        return -EINVAL;
+    }
+
+    return 0;
+}
+
+static int arm_vsmmu_decode_ste(struct virt_smmu *smmu, uint32_t sid,
+                                struct arm_vsmmu_s1_trans_cfg *cfg,
+                                uint64_t *ste)
+{
+    uint64_t val =3D ste[0];
+
+    if ( !(val & STRTAB_STE_0_V) )
+        return -EAGAIN;
+
+    switch ( FIELD_GET(STRTAB_STE_0_CFG, val) )
+    {
+    case STRTAB_STE_0_CFG_BYPASS:
+        cfg->bypassed =3D true;
+        return 0;
+    case STRTAB_STE_0_CFG_ABORT:
+        cfg->aborted =3D true;
+        return 0;
+    case STRTAB_STE_0_CFG_S1_TRANS:
+        break;
+    case STRTAB_STE_0_CFG_S2_TRANS:
+        gdprintk(XENLOG_ERR, "vSMMUv3 does not support stage 2 yet\n");
+        goto bad_ste;
+    default:
+        BUG(); /* STE corruption */
+    }
+
+    cfg->s1ctxptr =3D smmu_get_ste_s1ctxptr(val);
+    cfg->s1fmt =3D smmu_get_ste_s1fmt(val);
+    cfg->s1cdmax =3D smmu_get_ste_s1cdmax(val);
+    if ( cfg->s1cdmax !=3D 0 )
+    {
+        gdprintk(XENLOG_ERR,
+                 "vSMMUv3 does not support multiple context descriptors\n"=
);
+        goto bad_ste;
+    }
+
+    return 0;
+
+bad_ste:
+    return -EINVAL;
+}
+
+static int arm_vsmmu_handle_cfgi_ste(struct virt_smmu *smmu, uint64_t *cmd=
ptr)
+{
+    int ret;
+    uint64_t ste[STRTAB_STE_DWORDS];
+    struct arm_vsmmu_s1_trans_cfg s1_cfg =3D {0};
+    uint32_t sid =3D smmu_cmd_get_sid(cmdptr[0]);
+
+    ret =3D arm_vsmmu_find_ste(smmu, sid, ste);
+    if ( ret )
+        return ret;
+
+    ret =3D arm_vsmmu_decode_ste(smmu, sid, &s1_cfg, ste);
+    if ( ret )
+        return (ret =3D=3D -EAGAIN ) ? 0 : ret;
+
+    return 0;
+}
+
 static int arm_vsmmu_handle_cmds(struct virt_smmu *smmu)
 {
     struct arm_vsmmu_queue *q =3D &smmu->cmdq;
@@ -114,6 +261,7 @@ static int arm_vsmmu_handle_cmds(struct virt_smmu *smmu=
)
         switch ( smmu_cmd_get_command(command[0]) )
         {
         case CMDQ_OP_CFGI_STE:
+            ret =3D arm_vsmmu_handle_cfgi_ste(smmu, command);
             break;
         case CMDQ_OP_PREFETCH_CFG:
         case CMDQ_OP_CFGI_CD:
--=20
2.43.0

