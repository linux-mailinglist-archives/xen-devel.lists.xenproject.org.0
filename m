Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WMzXNegoy2nLEQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 03:52:40 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36DB83632A3
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 03:52:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1268249.1557645 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7OHE-0002ii-He; Tue, 31 Mar 2026 01:52:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1268249.1557645; Tue, 31 Mar 2026 01:52:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7OHD-0002Vt-Gj; Tue, 31 Mar 2026 01:52:19 +0000
Received: by outflank-mailman (input) for mailman id 1268249;
 Tue, 31 Mar 2026 01:52:15 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <milan_djokic@epam.com>) id 1w7OH9-0001la-9h
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 01:52:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7OH8-00EbSb-Ku
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 03:52:14 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <milan_djokic@epam.com>)
 id 69cb28ca-2eae-0a2a0a5409dd-0a2a450ca5a6-14
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 03:52:14 +0200
Received: from [52.101.84.119]
 (helo=DB3PR0202CU003.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <milan_djokic@epam.com>)
 id 69cb28ce-f93d-0a2a450c0019-3465547766eb-3
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 03:52:14 +0200
Received: from VI1PR03MB5088.eurprd03.prod.outlook.com (2603:10a6:803:c2::20)
 by GVXPR03MB11035.eurprd03.prod.outlook.com (2603:10a6:150:287::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Tue, 31 Mar
 2026 01:52:12 +0000
Received: from VI1PR03MB5088.eurprd03.prod.outlook.com
 ([fe80::8471:b7dd:8a1c:c30]) by VI1PR03MB5088.eurprd03.prod.outlook.com
 ([fe80::8471:b7dd:8a1c:c30%4]) with mapi id 15.20.9745.027; Tue, 31 Mar 2026
 01:52:12 +0000
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
 b=lj9ps9JWld6pog0LY1cxvqB5jOl5ed9o/ozXdfXKvqQLIn17rT6Wh7CUiRd4Hnlx1XMi9zgMiTG2CJfsv1CLF3GngljqyZhz4tQ+TG1Qff+2K21Kjsno2fQm0JFtnDjPXv9woLYuUw1Ksqp+yR1Krh4NFR9xFddxnjAW3tMFpOGE1NaJO2IlYH4YRo04MVDW2ZVW9MOE5ngfH+iwRrwxJzfec+R8n78KIuinYxWgR9t6/bqk3Y0nulVCsNtjcUfmqZxFLf9BvyUkhe+ZZ729q2Qk+WXHZ5JNTsyfH25PG/xf4RSxScuNva9j95gn0rs2UAIU5diL7W0hTDaWI5ozNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L8OQdvq9aXg/4SxgH4QegjDDNYf5k8N/mwCJ7C6pqRo=;
 b=Z9HOMs68XFBsOessW2KwVirVy3aalmZQwUtlAM4kQrWCoDVPGuizDz0ecnfG6RCjuj9KgyjiqhOiw12u4oFgPqZuMwgkuzHh8af2PPMzAd1YPUze8MOcpKo0wEwW21Bt1V2wA9z24dmu3ORZjk++Al+xhl693rg1pJ+OSRmquADidSjXQOvNF/O+eJ/XFMmyAbk4xeqGbrVQksXSMT+zL6PCB1fZjeLoF2l67Vp7wvr46nvURs2RMheGCtm373bqlDuxchJ/xQXYKh1qtW6G3oNggl0ZvU/LvF2GF2dKjSFR+kysg1a5IvQCchvxgIgqJKZ9Jf8TscwoKMjOx9WatA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L8OQdvq9aXg/4SxgH4QegjDDNYf5k8N/mwCJ7C6pqRo=;
 b=QklSEOt3abRoejHbp49HdQ1MHGXP4HfQbv1F3+khQrap24/bfPJC88vhSAFbAuFJdSCrqj1Yl+cjWvV+jleroiDq+fQYMpk4tZ4NWEdVyp5Hwh3shuNh9xxOVPbbB25VdlD80yBJBk3iLzvO+r09I6UVHNk/03wr7zozsKGHou5HrfLsxHIiPAq3CscZckKFaNDSUXT+mfmI2lEle8CNTc20rV3r9taFM3spM/GQWfpv0gmRMIrhorls7+CTlBTAmBw7nNozrR2vXsnSVQBNF1zu4dCQfu4tD63BqyYf02c4G8ERTEBkxq5jk4LOqWh2Nlf9qDs20OYBokp58qMMzw==
From: Milan Djokic <milan_djokic@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Rahul Singh <rahul.singh@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Jan
 Beulich <jbeulich@suse.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Milan Djokic <milan_djokic@epam.com>
Subject: [PATCH v3 15/23] xen/arm: vsmmuv3: Emulated SMMUv3 device tree node
 for dom0less
Thread-Topic: [PATCH v3 15/23] xen/arm: vsmmuv3: Emulated SMMUv3 device tree
 node for dom0less
Thread-Index: AQHcwLD+zNiyrbjSzkm+sUPipfSs/A==
Date: Tue, 31 Mar 2026 01:52:12 +0000
Message-ID:
 <c2eadb067d706e0f6f4289644d30cd4b1167c4df.1774918270.git.milan_djokic@epam.com>
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
x-ms-office365-filtering-correlation-id: 40aa60c9-d87f-4da9-0b20-08de8ec820a8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|56012099003|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info:
 SLhWRY1O5zPSzjmB2xY02W9/Bfb3rbw2ZmxfxVUeLFdVwbrutMhS3UQjJVmMTJ46t1+Q2w1v0SUnVm5yLHIT5BdHfWeURfF6pjvYQ8PRXnJWhw8qRnVjJf4Gp0a+vrkWHoPdQrTciKnkYI7fC51Zslb2VqyETmKt7QFB/yXyaUuYkVS1DcR0u+/P6tKh5tJ7kvRHMQpqEQBasLyNRHeM2yc4rqFYmyKJ5pgBSNfyuQe3ulS9D1P5iDcLodW7KpCQMG0kLAfJkR6xJ7254XJApcHAHQq+V7SGdff2lNhhvomltm3JW5R2hiqwzPxhRMNvNspilWDXs15GEAVOUgmn/q8YIQdZIiy4Pk3zFkXPHzXBBiomU7eAZZW7nwk//SQDax8gWKJuD5RcCeAwOeAp7kybgdAR5S9XqGQFJOdCjZ5h64kRhv5E+of2XdcaZKRLqnWLwR36LrQh5VWgewIpUPimPys/mTMYEkaydb2pzA0wRS9ox4r+Nw1ySze2ed6qconqcCVEySX+Lh/7DuFPVycdoVZMKPr1CTCfLhaY9BY3w8ioq8G1gkaWhzTQp4ixLSkJV3xrzkN/iEvQ6KOGglcvVy6GvtkyW0JfprQkGtx8TJ+hPAMHetNSSNtjZsbSvysrCTUgoe4H2oZVjhI7O9SUq0KAMeNt+wBhrcyVfktEheEACZwC1E52R0VGaX7fK14VZb5uLoKHwANbm/9H99/HbA+7egXfBRlbcH3PZ2+DFqUtWTjocQj5TK4xnRd2STKn/K65XlVeGH7pbsN5U9+Ll5HcfwL7+71zoyK3qpg=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB5088.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(56012099003)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?J0UXZfNfvbVF2KQJTJl4wyoCfItMDqD9i+OiapiSYMDea51yQK3uI4tci7?=
 =?iso-8859-1?Q?HHel/xkmQCQNlmfV6F5YD39PBjTS+UQvEFha0EzrHrcTBccwf6aJ8gJfhZ?=
 =?iso-8859-1?Q?+00UyXwFqNqwlNIIC09Ju0811AGGnHWBGmCizJz5fWincne2XVqcEUboxs?=
 =?iso-8859-1?Q?gBzS3htCxdzA7tRAsghHh8fOlhDNrjJjprefUs7tDEiTu54bM7IKbEaX0t?=
 =?iso-8859-1?Q?k4PnC8HJvXKwGPqD1GPz+y03O9/JyiFlnpvCYDU8//IC6+I0Xs3m90Pmbh?=
 =?iso-8859-1?Q?7+DrFymIpgtX5Nfic+rR8TIJhV8g6hZt+Ht9Kdfm+S24La7BTxI1WFMHb2?=
 =?iso-8859-1?Q?NUjKLohDHDHWKLnntBBr8UY+8DBeOcFdkMVX6NPx/3xHVi2xM+VXjIFZVB?=
 =?iso-8859-1?Q?bQq3fuiAwiCaMIoGA3CWnazaT7/3MsZlO3W0qNVta1anqX0HyaVZrYTjUB?=
 =?iso-8859-1?Q?mzYR8fS6PciBjAcNV5dglHJpQjykTvtxgp3DJ3Wj1fU1uI/uaUfqcYyg7t?=
 =?iso-8859-1?Q?bR5sy6IB0V6J122/MsOoK9mck7X/FRzDO+k/ZG12n1SUU+hKsoyn72XD0p?=
 =?iso-8859-1?Q?zLsWXJ+nQqM85Z9j39QGsCG7hF5agq9Uu52h/WtWvkwykmcWWPEZR0YqXv?=
 =?iso-8859-1?Q?JMgklKf2cE/QSStdG0PLKZhgJ5EWwJXNZjrnkOD1aHC2lnyTKf+UZWD6KJ?=
 =?iso-8859-1?Q?xRfaL/lGmXfuMsg5LACW1j7JA/QyYdTm4Xzbodacvd5SFbCVqZfDOMpdjU?=
 =?iso-8859-1?Q?yN/5E2MhIXT1A23W5+5EklPwTHC8r3V6vp91nFr71QX2bffIDxgHjfv+b7?=
 =?iso-8859-1?Q?87dnZ27S+U6HWAVYCGAR1lfo+k1SUk48guBVqWgJ4q+9XPDxkomB145CYM?=
 =?iso-8859-1?Q?HtFAjMOgxsZoQrOhDErvZvOEsKl3SaGPOCoAw8nV/tFEognVoWaAbtkYyn?=
 =?iso-8859-1?Q?Hp4FzWEP97Ygnym9MbB648Cvx+NM7cruuzwFw0L9su58jzDZhAEDemdgmx?=
 =?iso-8859-1?Q?LD+ae/kemwopMo+bVn8B5utks9604zoQaQyBd1LdRFK3rCxK1zeeKRtvzZ?=
 =?iso-8859-1?Q?I0M3bb46U/CdOYNhKIlP2uRkghm/ZqFyWCzAPfdTMQ3+2NiSLwPCkYX8uO?=
 =?iso-8859-1?Q?YHvzizZ+YVSpduZdVIJvyMh77wA4UOLTkBMFbuGmXHkFl7kiLtVrslwmyB?=
 =?iso-8859-1?Q?ICAoKihJQmj0mDMvv5TetZaPQUNGLuZuDsCA+U8lQVgh4qLXtqaXFqiR8v?=
 =?iso-8859-1?Q?mEcuzJm3ThNImren0qEEkHDj/PWOxJ4vL+H51IYliCAaNF7KT4G9G8HO7x?=
 =?iso-8859-1?Q?Qibd1DH3/aZnGChFXoucCD+yeYb3w/Gr9AZE+BA2CnZdYSbN396+EPrfbW?=
 =?iso-8859-1?Q?m7JrKoVE9Lkil0S2Pkcv7P/e+WyA+MG3Z0CRXi3pWcD2Dy7KcdeY053fKM?=
 =?iso-8859-1?Q?MaRsLyad3lp8AUMoTiv7tPncHiIaW+O3pxF03Lsl+2JpHINvxCpF7fnWcL?=
 =?iso-8859-1?Q?pNlvy+0NH1pHdi+Hug2N1FSK8OhogbNoDWkWQtk1fC+2vcgiom+IGk5vD0?=
 =?iso-8859-1?Q?CMpU7cQfeeCQx/zu9hDZX62NBBw1qDb7AzbTN/my8yQbNJ//fU0MWMiYh8?=
 =?iso-8859-1?Q?8GdDoYcugi4jV/rQvN/JJUk1OF37tw3qdQ0kylRPgNcGVBm0dWiAVofJ/G?=
 =?iso-8859-1?Q?91UC/3xrJmC7uPq5bqPz+gasFe4aCslBmEDGEPMUIyNjWovYPNBiUBC/HX?=
 =?iso-8859-1?Q?joWrThLJfcvxcgxqDhLGHrbXsIpnB2Lw0aA3oISOqtDJWlSOIi3mvqVOcK?=
 =?iso-8859-1?Q?8h670cqVswIfQlM8CbxdrFL1AmpFMLo=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB5088.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40aa60c9-d87f-4da9-0b20-08de8ec820a8
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2026 01:52:12.4835
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6i++xxj/30iSitvKttsg1hKhSS159lM90wWQ3/zhUvq2qnf910WkqEGPTBHNKfUfRQ2sq0J2hPDbbUCUVpIH5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR03MB11035
X-purgate-ID: tlsNG-d25034/1774921934-6FCA2734-82C87703/0/0
X-purgate-type: clean
X-purgate-size: 2928
X-Spamd-Result: default: False [-1.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[milan_djokic@epam.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:rahul.singh@arm.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:milan_djokic@epam.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[milan_djokic@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 36DB83632A3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Rahul Singh <rahul.singh@arm.com>

XEN will create an Emulated SMMUv3 device tree node in the device tree
to enable the dom0less domains to discover the virtual SMMUv3 during
boot. Emulated SMMUv3 device tree node will only be created when cmdline
option vsmmuv3 is enabled.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Signed-off-by: Milan Djokic <milan_djokic@epam.com>
---
 xen/arch/arm/dom0less-build.c         | 53 +++++++++++++++++++++++++++
 xen/include/public/device_tree_defs.h |  1 +
 2 files changed, 54 insertions(+)

diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index 067835e5d0..a48edb9568 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -218,10 +218,63 @@ static int __init make_vpl011_uart_node(struct kernel=
_info *kinfo)
 }
 #endif
=20
+#ifdef CONFIG_VIRTUAL_ARM_SMMU_V3
+static int __init make_vsmmuv3_node(const struct kernel_info *kinfo)
+{
+    int res;
+    char buf[24];
+    __be32 reg[GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS];
+    __be32 *cells;
+    void *fdt =3D kinfo->fdt;
+
+    snprintf(buf, sizeof(buf), "iommu@%llx", GUEST_VSMMUV3_BASE);
+
+    res =3D fdt_begin_node(fdt, buf);
+    if ( res )
+        return res;
+
+    res =3D fdt_property_string(fdt, "compatible", "arm,smmu-v3");
+    if ( res )
+        return res;
+
+    /* Create reg property */
+    cells =3D &reg[0];
+    dt_child_set_range(&cells, GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_C=
ELLS,
+                       GUEST_VSMMUV3_BASE, GUEST_VSMMUV3_SIZE);
+    res =3D fdt_property(fdt, "reg", reg,
+                       (GUEST_ROOT_ADDRESS_CELLS +
+                       GUEST_ROOT_SIZE_CELLS) * sizeof(*reg));
+    if ( res )
+        return res;
+
+    res =3D fdt_property_cell(fdt, "phandle", GUEST_PHANDLE_VSMMUV3);
+    if ( res )
+        return res;
+
+    res =3D fdt_property_cell(fdt, "#iommu-cells", 1);
+    if ( res )
+        return res;
+
+    res =3D fdt_end_node(fdt);
+
+    return res;
+}
+#endif
+
 int __init make_arch_nodes(struct kernel_info *kinfo)
 {
     int ret;
=20
+
+#ifdef CONFIG_VIRTUAL_ARM_SMMU_V3
+    if ( is_viommu_enabled() )
+    {
+        ret =3D make_vsmmuv3_node(kinfo);
+        if ( ret )
+            return -EINVAL;
+    }
+#endif
+
     ret =3D make_psci_node(kinfo->fdt);
     if ( ret )
         return -EINVAL;
diff --git a/xen/include/public/device_tree_defs.h b/xen/include/public/dev=
ice_tree_defs.h
index 9e80d0499d..7846a0425c 100644
--- a/xen/include/public/device_tree_defs.h
+++ b/xen/include/public/device_tree_defs.h
@@ -14,6 +14,7 @@
  */
 #define GUEST_PHANDLE_GIC (65000)
 #define GUEST_PHANDLE_IOMMU (GUEST_PHANDLE_GIC + 1)
+#define GUEST_PHANDLE_VSMMUV3 (GUEST_PHANDLE_IOMMU + 1)
=20
 #define GUEST_ROOT_ADDRESS_CELLS 2
 #define GUEST_ROOT_SIZE_CELLS 2
--=20
2.43.0

