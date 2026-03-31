Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6CwALOwoy2n/EQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 03:52:44 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D283632E5
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 03:52:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1268234.1557608 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7OH8-0001VP-Bk; Tue, 31 Mar 2026 01:52:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1268234.1557608; Tue, 31 Mar 2026 01:52:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7OH7-0001Ox-OM; Tue, 31 Mar 2026 01:52:13 +0000
Received: by outflank-mailman (input) for mailman id 1268234;
 Tue, 31 Mar 2026 01:52:10 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <milan_djokic@epam.com>) id 1w7OH4-0000eF-CW
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 01:52:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7OH3-00CyDl-Oc
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 03:52:09 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <milan_djokic@epam.com>)
 id 69cb28c8-5cb7-0a2a0a5109dd-0a2a45089e38-4
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 03:52:09 +0200
Received: from [40.107.162.75]
 (helo=PA4PR04CU001.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <milan_djokic@epam.com>)
 id 69cb28c9-1950-0a2a45080019-286ba24bfb1c-4
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 03:52:09 +0200
Received: from VI1PR03MB5088.eurprd03.prod.outlook.com (2603:10a6:803:c2::20)
 by GVXPR03MB11035.eurprd03.prod.outlook.com (2603:10a6:150:287::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Tue, 31 Mar
 2026 01:52:07 +0000
Received: from VI1PR03MB5088.eurprd03.prod.outlook.com
 ([fe80::8471:b7dd:8a1c:c30]) by VI1PR03MB5088.eurprd03.prod.outlook.com
 ([fe80::8471:b7dd:8a1c:c30%4]) with mapi id 15.20.9745.027; Tue, 31 Mar 2026
 01:52:07 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=epam.com header.i="@epam.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:x-ms-exchange-senderadcheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wCp+eC77mxtfOHbAVbFEe+XCLRKDmmfZi1UyaPgCcf+Ia0RIHLmgQa+/8SPUkPwqrv6Bg39DGHCsGxu0S4yKiCJQRiMl7R76lFVpP1OT2DnmTlz7P4I9s8/zueGPIBiBe0PfFPLF8OLUvQZVbt50KFrkK3aafHTYS0nlpzfZcMESbGTyaH4zpD9IJA6sZrxPcFcdoRnDFJKkyEIYO5pXvmhIiThlIQd4zbmQfUTxYxDilJnI0E56TJ0bhhZlG7gO8lv08tfhJghg2GpOVSxI2V8CEwiErhilkQypMrE1mJwqrGPORRRoGdriXEA8TDQ4s723v2ZNkImWlUgRd8S7Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0XZSO1UVrC8SXwDBQpjDCvjjP780VAbXtnJxzn+t7Pc=;
 b=TXfHO/7jBZthazLL8ZdvgXpF3sW8kKh6PqhExkiVl9oA5uAkqYDl0oAjcdlyHmMyFkLdBe7Y0xsaybDd1BxLKNsD2oPgzCOWAhmwc/LhR9LyyfJr2tYjSXZ9j2F9wpe7r/5zqJOqB9jZcsVNJcnEHfRqufRzLBflvM/sreO2LUkeMAvYLcD7H7QBdFpZmBhoL9xG/qPN7WIv4e5HEMpvYeSFUcP4aQ1akhfurCXerTurLFl9owlum7F/eiTrfl/Qb/U3TrA2aEUOLWCpBUNwqrNM2OB4glRFri3s7PjemdjtpNGJ8tG5LaZRMukq9KWo2NZ1qZBP10GWf1W+IbTRyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0XZSO1UVrC8SXwDBQpjDCvjjP780VAbXtnJxzn+t7Pc=;
 b=SEbNCSAsy8w55b6rHF9DgXITNIG6QXTFMOYrdP7bixKu+J2fC3ubWtuKakzrBhRxnjRL1IfYe5poAUHEeq099AZj3YfeCZ2slid3k+EFmVcXR43XgannNtdJ2K7o8zTYLJUDWVrRoilZOsclFXNK6r4R4fourtMnvGUGJc5mvMwTXMWsmuqcFnj+VAim7AFxq49Htoi6/WpomRB3TNDe62y16wexOKuBP1g+dDC3oNsXIv3KXx4f6U5gZZx2mcHRr5YAZRlmI9LxUD8q8pgGtiUl212UCPvEY7bGPTfenDkbtCVyzk/pMcVVkfw4zu8iG8fXgNCxNBVCBcB1DhaT8w==
From: Milan Djokic <milan_djokic@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Rahul Singh <rahul.singh@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Milan Djokic <milan_djokic@epam.com>
Subject: [PATCH v3 10/23] xen/arm: vsmmuv3: Add support for command
 CMD_CFGI_STE
Thread-Topic: [PATCH v3 10/23] xen/arm: vsmmuv3: Add support for command
 CMD_CFGI_STE
Thread-Index: AQHcwLD70TVWtdvxQUW3kRgdvQZ+4g==
Date: Tue, 31 Mar 2026 01:52:07 +0000
Message-ID:
 <5342a5355191ae3b5b7bfcb86c6494334dda82e6.1774918270.git.milan_djokic@epam.com>
References: <cover.1774918270.git.milan_djokic@epam.com>
In-Reply-To: <cover.1774918270.git.milan_djokic@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB5088:EE_|GVXPR03MB11035:EE_
x-ms-office365-filtering-correlation-id: e3cfe55f-b415-4c94-e090-08de8ec81de0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|56012099003|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info:
 gdNwvrXbu5UFMj6Ao6fGg6rUsOmDVUjFjAAkDsbgTvAYM9emuG3siihCIR4DsXBejRM807yimNXoqITbNjIp2fGuh3cfcxjl7T3fncjU4jax/aYs9bG4HHaz/iWDzuou9nxcgXKjZIVN1bAxMEU07LHKVIbuus3vWmdUGbzEnl/44LhyLmAlyQys3HKXw2uzRFDJ10c/g9WsNcR1e75+D+/XVryy5n4QkkgdyG9397aYOwuLM2GRvN3memIn5Ui4FHRtELknCQi19H/HEIZ8TqDeIAPAvlU4of354I5JQ0dhbUrr+wLbzykb3sQT7y9khIPoLr70uxA9ZntI9yxCgy1DvwqO/3zefMrLYM12kMyaWRUy1vzfNK6bmcnxp8ylDMeutCMlLJz9dC6aaPEoHK1ROc0mZDFcre3vRzYjS+SBRisLgeqaybbFuqbPWUmgGJKupXKD9d2da09CT4ErcaoqqVkWltU1iWkz7vGyqm9giYLIqZ0dY/k5Tv8eD/xil5L/DWvTwD6dYl8gsunjA59TzJ7Ld/39UmNOHsxPlgZZEPIqaP/9IQ6Z86jrHGH2JmePW4pd0S5Uk99VABUDjUYNP7NWk8cynhx/8eM0N/BRNX+97MRoN7pKSIotwU4CNyfE24lu48HMgVZ6i3L4JGPD2hJ5gtGU+MypYfVOkMLI6dL7D9aCUS5FhK3ivKPmRqVPf39PY5xpon0Ot5QqWiVko8NZmesqHIrPZ0ppEFWOYL8HtC4JVh86FucfTfaC80gURSXMfsaB1RpRfDd9uobIiXROYEcqjBoruUXeqg0=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB5088.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?xziJyB3N6vEIPqEI0vqi3UYzbmg/1myUBY5y/alK7hT4Q55vTeoIp2upfZ?=
 =?iso-8859-1?Q?OD8pwp2W8JBD/+x+nDRqmol3AHuqo+i0v2GE036fKcu33cz2GJNQZiSJf+?=
 =?iso-8859-1?Q?2C3udVckR9vJMkj2tDGiaFi0Im9apONRj+LdmoRwRJ5eozwsbiOrxMV2yN?=
 =?iso-8859-1?Q?jaMOoDYrRdp1HO6bPJSKc9a3VtBPMkmDxwuLKVmsgoFbbfUS+/TQ8JNkum?=
 =?iso-8859-1?Q?4Q6C++MjTofstAmS1PwdMfMrfCz2BOwdeLVI2r4xxMsSBc8UpXVTrkTeAt?=
 =?iso-8859-1?Q?fLhq1TPVzwdCGge1ZILBYJ5I20/ok6hINKfQqJ9eIkQZsa6bG+yZfGfZIz?=
 =?iso-8859-1?Q?KyIAngdvn1Ii6z38aHhEVC+EGvlXJokMepuHICQ5faOh+nAKdsCwn9LH2U?=
 =?iso-8859-1?Q?x+MBmjTQScZcP6H7amGmp2HsYRSBiDkp+PKNwAgB+AYm7Kmchx6f0YtwDN?=
 =?iso-8859-1?Q?Ou5loZvUakQ3Z4m/B2127KnGOj70Y5MS8kDviqynTDsiaQz4CCvROMQ4Id?=
 =?iso-8859-1?Q?f/6+sMcbsqsCke/9yT69fj4ZBxaDw9Ta3uYlu43l5TWrlDsI4JptEwoy9Q?=
 =?iso-8859-1?Q?duACIvPylzfvVhRAw6bVDhAguvPt71o2iHvih3jXhPz8NVTyyz65tzYlTB?=
 =?iso-8859-1?Q?igr5BkkuDh+V0WvYOCkKfg6Zr5gm+eRMheiqM0aDy5DERXUXGce1VGyC4A?=
 =?iso-8859-1?Q?nPHI4zMl/caHMCaoAIGi6WW16ZWmTZroqRC3LwS8PZ58ll1NQZvp3aA4YM?=
 =?iso-8859-1?Q?yYnYHdqLuUkA0n9dve529gKExC3w4WWal8bI++CuzpRhrBiqlvHHZU/Sw5?=
 =?iso-8859-1?Q?90bRDP1DMSKtny8nswWtg+41buXxpw33S+S0qC2DQMs7PkTTe2alJ4BKbM?=
 =?iso-8859-1?Q?T4FhhdqnrmKJVuWfv9+54adazahLwQhSIiKVrg9LN80KaBH6aEewEzhwbc?=
 =?iso-8859-1?Q?oJojWCNsscPJoIpDmlhasUptxvY2Km9V5k7MdplVk9ZWFuH4Yw9LsG8RMt?=
 =?iso-8859-1?Q?wQKT08NcW+l3akDGPgxgJGKzYNNtUk0+szIY93jgFVRlnAi3OeqyL2XDmm?=
 =?iso-8859-1?Q?GyC0pYyFkxMlCQCNSrmW35hpUSBJMcZNSIB/JFksLW5N/av/5Ys6LjryJ7?=
 =?iso-8859-1?Q?ABfYnDMgAA6QdTY3+4DbXGfPjQeixTfU4QFVhtL3LeEMXyxTYpjMdcDvF6?=
 =?iso-8859-1?Q?QSJpSNJX0naWA2VxHp7qFOy5jhUAc4gcdkhkC4HuzuoOf3xFmyktOgrE/8?=
 =?iso-8859-1?Q?PLnG2lgTE+bEOl9vWdac+TSYp3F1BBiiC5zGJaMYxxsm65yhibSzN4lbHd?=
 =?iso-8859-1?Q?NE9XbMsJTZHAbqs3ZOCCbQa6hRmdXZNKQwYADrPDaiLLqI6R00jeMeKcCj?=
 =?iso-8859-1?Q?C0Vgs9C0wKd8HhHjkv8M32/PouHedzNlyKrPCw9U2w1dB4KA4S8sxWBdKI?=
 =?iso-8859-1?Q?hWNKS3jsg8ALEYR6ekH1FSi/HkeuEI1mUxKDuWDLaxTTHVL+FvSc/s3Y5n?=
 =?iso-8859-1?Q?eLWDusyZ2A2UHzjbyNr6OLqS+29Dkmch6zNiczhcGALDCwxsnQ99AGMvmw?=
 =?iso-8859-1?Q?ga94VshdZaMl6/ffc3NCmfcMMn+M9UpbsPrQCThIWy7Db6d0qMYH17xPD3?=
 =?iso-8859-1?Q?3o+wng5mUoLf2uFaIyx4UBX1bBsrd8pFq2ZN0gTepI5Sv/18xhBi6PhCYw?=
 =?iso-8859-1?Q?udnRAyGAQCFEz709U3OEFEdp7vbK2f0cdt/81IQdsKFdUxpnKpfM6V2GyS?=
 =?iso-8859-1?Q?75Arvo7+L94/rUv9UNMJL17z9XCCwMBi20f9W1qGrWd1gdkgOBBiRKpUwz?=
 =?iso-8859-1?Q?Il/kF91/dhO/QDH00pz8USAJwGIlXUU=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB5088.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3cfe55f-b415-4c94-e090-08de8ec81de0
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2026 01:52:07.8804
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xlLiwwyey/ZnI69M6yMxr1NHTEt2VOCWSwqWgbiM6zq7U+mc8kktGZMD6qA8Lw+Zxh+vGy7851JC9jPgO+v8KQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR03MB11035
X-purgate-ID: tlsNG-c1860d/1774921929-EA691726-963038AB/0/0
X-purgate-type: clean
X-purgate-size: 6564
X-Spamd-Result: default: False [-1.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
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
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[milan_djokic@epam.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[epam.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 49D283632E5
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

