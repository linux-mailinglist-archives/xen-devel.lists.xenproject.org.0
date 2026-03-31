Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OHQDKPMoy2n/EQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 03:52:51 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC5336330B
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 03:52:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1268247.1557639 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7OHD-0002YF-Lr; Tue, 31 Mar 2026 01:52:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1268247.1557639; Tue, 31 Mar 2026 01:52:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7OHC-0002Ji-KY; Tue, 31 Mar 2026 01:52:18 +0000
Received: by outflank-mailman (input) for mailman id 1268247;
 Tue, 31 Mar 2026 01:52:15 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <milan_djokic@epam.com>) id 1w7OH8-0001a7-DK
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 01:52:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7OH7-00G5Gh-Od
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 03:52:13 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <milan_djokic@epam.com>)
 id 69cb2895-2eae-0a2a0a5409dd-0a2a450580c2-46
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 03:52:13 +0200
Received: from [52.101.84.91]
 (helo=DB3PR0202CU003.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <milan_djokic@epam.com>)
 id 69cb28cd-5aeb-0a2a45050019-3465545b23da-3
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 03:52:13 +0200
Received: from VI1PR03MB5088.eurprd03.prod.outlook.com (2603:10a6:803:c2::20)
 by GVXPR03MB11035.eurprd03.prod.outlook.com (2603:10a6:150:287::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Tue, 31 Mar
 2026 01:52:11 +0000
Received: from VI1PR03MB5088.eurprd03.prod.outlook.com
 ([fe80::8471:b7dd:8a1c:c30]) by VI1PR03MB5088.eurprd03.prod.outlook.com
 ([fe80::8471:b7dd:8a1c:c30%4]) with mapi id 15.20.9745.027; Tue, 31 Mar 2026
 01:52:11 +0000
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
 b=FLmNUmpZbVgA/bCxORaiRXHcWFN9ffiLH2lCIwJHf+n/Ykjn02axs2f9Kq1tAaxoJcgEJorsDlgYDrNc4eVfunqKsSZDpSWCuoI+FnJ98sJJ02XMPdMhqdmYqH9yi46x0z6UjMSx/lMBGhWpsSV2Octj1xUlzJ+ryHHjxl7QQqBMIZ6td38DQPbLQaMarpmITHJzjfvTf1rwVtGsuI1mAdR2kLrS+6zWFeHRMR8p2AyO0TR7T//XyYHJ5JTXzTPUx/bPMBn2zc1Kz4z9wYHWbhEF5VKChuiPjIleORcejhcX/skrft0U+blCo2Eg9Vov49uIoaNn0DMghGpqjbcG2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lGucRxjoem7MAS3dc6mlC8+J9iI1gxrtrCaR0uXUaLI=;
 b=HsWLZMRH09uvdMqQqgciN2cOTe5TOValY7ysMQJfPf3MvN39yKdEd3f2udBKq6b2Icra43NuY/Hc+jmtTZ4vuewlQ/0J4DcyHpobNQfmdtOQ3XGJ6nx9mpSVy2x7tTNcwZZC0FvkjL8XkqRILOF6ZrZZdZXkwN82dIXqj9RisiddAWBp+bzLxNHaWZOQ3VOhfRkGck9i7edhoDGx6kOLp01+PoC3DQu1AcqQTK9H//wghgDUc32/1n49JbmEFaCtbM1cFshD+Z9ewpsUT13KEJzd3w9xa5VEZZrmeVh00Nf0/ntpHn3gdXc3sAtrZZ0S67sJ7rhqwCZ8Kss1DmLscA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lGucRxjoem7MAS3dc6mlC8+J9iI1gxrtrCaR0uXUaLI=;
 b=qxOYysYkA2NNaloec6eb84kSihPD8j6XcBMzU02s2p+fCwhnMr1WaKH4ibs1DittGpysat5rJP6NvT3Bi583eD7xOqXXkHdCR9tKLE5Jk1mFEFdPzc8wbWrwzeZnKBXpHJz0CXH6XbzYeQ9txdjG4zLbNWiewEirvDnDiPRSoLWZCus0pbo0i480MHx0/iRppi1Qu1wCd/5WdSJe/LQVbdLVqWpnu+3Vq41zR+6XNiHNB0yrAjwkoNFsX293jQ1N4Itxjq84ct8Pvx2sJ2Wwl5HTbfG5mdSE9yZ1ReaLAIKg8Yr1ORTMFnUvtzvnrdgx6YbDDEZjG31nyuBXB2K8VA==
From: Milan Djokic <milan_djokic@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Rahul Singh <rahul.singh@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Milan Djokic <milan_djokic@epam.com>
Subject: [PATCH v3 14/23] xen/arm: vIOMMU: IOMMU device tree node for dom0
Thread-Topic: [PATCH v3 14/23] xen/arm: vIOMMU: IOMMU device tree node for
 dom0
Thread-Index: AQHcwLD92F0UqAfNCE6nQ24lJgi4xg==
Date: Tue, 31 Mar 2026 01:52:11 +0000
Message-ID:
 <ad7c5071c7d2424d292d4a2dc863a69c0a4b973c.1774918270.git.milan_djokic@epam.com>
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
x-ms-office365-filtering-correlation-id: ff1d3ccd-c8dd-4e24-0582-08de8ec81ffb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|56012099003|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info:
 6zkKl+8a8V7cJySYUoRUfwOTtmbE9sNXZFSOzB5fGRizHZNkvr1e73Oj3IJNYrZVcP9UQgg15cdHtT9Ecf4TQIaJe959jBinCoIzYdy7xQDFD5aae7A/6xLit4ShiP5RzHfPm90wdvAN+PPsfD5Z3ZQVDxAiiiClXPS1vgwBFgWYwAJvXdJhR/6z1M49aHvk6wUCwPMeQ0Z6ffeN18Xpq/n9dSH075NK5/HNzPgnnd2XUJ4dt4N3CW1RnI4Sr9pHSwhrUO6D4yQwTQ6g8ZASFsV2W9Xrk2mZRpdQvpjuYTTzrSXz3oG4UrhITMJZI7OohXGyAXKH3pQKMN/ydkYx4hng9rBeH+K6sn+KmOi2zgYRPa8sKZQWdRofZEhOUr0TMVf9vWg+Qy+JNNoReW1i8VNdgHj0qRcyl6wGMZjKWJo1qsv20yJQ9e6DanDC3r4TXt3+YuML09l//Wkp0hr/wYg1HnrLlpxsz/M9Wc7qkrSRysZE8R3Rxl2lGtXDIEp9TKvPd/petRXQ41PcCwh+K9aHpPDSIDGeqY5VRUyd+GNE8WUS2LmbN/4dpY9DCWEWYcAXS/T4b0E3Hl2g3asDz4u64meI81vR/VDEJcNCvgomGmuKs0XUrgYX32MDt7KrQW/HYDMTr5ufa3ZUkOrs6+nEMnlzWq4TINxMwH9+qL1K7BpfaXG8ZAur8Y1L/IB7ZbEiOHuqd1J7Fbl1sYBJ/5hmxTbsmPBloLAOqElRecPNCGQuu56+o66O2VpFYxiM69oP049+Evl8rNx81XCZDWE+1KN/h+r7sUcmd4Ky6Ks=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB5088.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?tFg+8bvNw3AZanTQvqZSt+MArwvd6doyY8Cn9CQZRa/1rzgAkhZ64mk8/+?=
 =?iso-8859-1?Q?9GNCHnae/h9YsVrIdJyYcHecXLiQH+BMjICiZAw8G8n1YwdxfwyjjfH4Pp?=
 =?iso-8859-1?Q?StufVdCD4a4fgTbUUhegf7IE4nfGqX72OZvqQtN2w1jlwbFBqcCPsKVFzl?=
 =?iso-8859-1?Q?xdCmFHfs6H5xdLDRRJqabbTyP7mpKR8sFMtrjE9HBFZ8zz79YE6PJOdDS9?=
 =?iso-8859-1?Q?hZop+1/EVwhuFiIQVT0Uc+tKCgzjOpL3Ec6ZyLASsIJKP/SCFN+Lo5LvIh?=
 =?iso-8859-1?Q?sJdc65EwqE9dX5wNPqbaDi0V+8gKA1+8I3/BT8mSBlh0N+xgzhlIjAS4jM?=
 =?iso-8859-1?Q?V7146bda0Uc20BIG5CWBlUH1+HSpuP8ZlCVBAUG/oqQPfuoO4ISUXR1vNl?=
 =?iso-8859-1?Q?jNVbV+Y8q2ewciATLaul5YWlgxIoUDqyHhTtbfUdUCTH6ZIXx/UiwLK66/?=
 =?iso-8859-1?Q?ZQ1amkhdoTbYetCBSZfh8T6mDRNG88yg5WoG8TlaGJ6qsHLIts3LgAn1Py?=
 =?iso-8859-1?Q?zipy9tgsVtdWP/chnIFppN0+wxQnuO0xl+fZlAJg14+QA1XAEy7Rvkbi1u?=
 =?iso-8859-1?Q?z8JGNszON33W2XdC+LMcilBsxscAl+0EA3bJE1zaeuVGy8wsgtuvp6HZLD?=
 =?iso-8859-1?Q?IY6pOrkUsHtknqIYA6K8JUvioj0k5aNLEesqLxB9gGn4VCzsM5IGGD937E?=
 =?iso-8859-1?Q?HivYgKlsyeQvyPRmmBVVtab00k3biPIhHjccIGWB0kCHg0UxmiBMJL7S+V?=
 =?iso-8859-1?Q?CKGbZzTy91Lmv5QwxKyU36vxbQD733sPOh8CDjdgrCRqoYer1rGjlpbHC2?=
 =?iso-8859-1?Q?QAjEiszfgwNPdOgo00Kyxkbocf77k4bwHGbi/6LKSsL6AOttR+Y1aFjhQv?=
 =?iso-8859-1?Q?6b3V17+4I2s48NgflP+Om3PNgH72i+dq+VmRXsxEtwwK1Hrnxu25p0tUYq?=
 =?iso-8859-1?Q?LimIGXNs5/hJEYYkiUJpXqmElr1i8bD+fZjU/lKnWiwMbuBoEYjn5mGKNx?=
 =?iso-8859-1?Q?unRhHZvaST7hzPZW4CmXcyuGMNJSKOLCMPVZsufkF+YJpXbSxdAivDS5cT?=
 =?iso-8859-1?Q?5q37gAyT22/HflQvKWjv04Nf+2sjvNrZ3BLNOsc1C0bBdkOSkWtaN7bDpm?=
 =?iso-8859-1?Q?soaxFN7Uw3rrXcRCeZP32a15q2zF1WJMAm5aX1x9Xd86zrUSHDD2dbQWCV?=
 =?iso-8859-1?Q?m3A7bbRYdFDQJIC7FYmRotP9l3aB4Z32KdD2vsWPfLgKYVAXgYgJGwCDD5?=
 =?iso-8859-1?Q?ioRUYvxiTjtkLS5mMMR46mYgTbB4snppjJxYzcvwUqEcldWt76xEc8fvP/?=
 =?iso-8859-1?Q?zvI3VFMNr8wDMNQDnbKoScspCxeW3SQmlpUF9MuM8RyqpsCDFhRjwP2TDx?=
 =?iso-8859-1?Q?wpAvw6jVaiW4IEu0xfG9Evaq0FQ0q1fRlS5m3QmGqQIo8aInxs8+J+gklJ?=
 =?iso-8859-1?Q?feSXiDcaqlPrqUMzP3yZPjEZEF9Jzgk7wJUEn4ADrbsVz4UBQPe+92c+6F?=
 =?iso-8859-1?Q?uLMduEajdzDdG0vFs9scq7zgUlMG59p4pxB0UAJzMl+/eeaskJ+IkcnBo8?=
 =?iso-8859-1?Q?mUca6lJrB/JkZd0gywYLQuSLeEMIrglufdFKraC23Oo9qyNpIgymasqqPI?=
 =?iso-8859-1?Q?kf1n9Zq9i36VBa5k46vqWwe6w1o6eOVPZkSe53Zme37ITzqV3sQ8VicPOE?=
 =?iso-8859-1?Q?D3NdUU/r+Mb2LS2fvnda8PhVnnAYF5cchVrnbMeN6/ekxMfkM/Nt+mLkK9?=
 =?iso-8859-1?Q?93PT04lyPwDD9aWZ51R8TvMe3k8P5EQWnwu8dW2LAsu18kA4I9eGZl9Z0x?=
 =?iso-8859-1?Q?WyJgZ7aMTvP82Sy1NwMs+F20zeZa/qg=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB5088.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff1d3ccd-c8dd-4e24-0582-08de8ec81ffb
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2026 01:52:11.4298
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EgweI40GOQ3rzaGBo85YWl/QRMEi0LuH0kx3Z5N7FDjX+DWr5D1eZHLMBs2lrWd2zMWRlI2+D9TnM0ETG8932A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR03MB11035
X-purgate-ID: tlsNG-c201ff/1774921933-82558488-213CC8AD/0/0
X-purgate-type: clean
X-purgate-size: 4282
X-Spamd-Result: default: False [-1.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:dkim,epam.com:email,epam.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[milan_djokic@epam.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:rahul.singh@arm.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:milan_djokic@epam.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[epam.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[milan_djokic@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 3FC5336330B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Rahul Singh <rahul.singh@arm.com>

XEN will create an IOMMU device tree node in the device tree
to enable the dom0 to discover the virtual SMMUv3 during dom0 boot.
IOMMU device tree node will only be created when cmdline option viommu
is enabled.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Signed-off-by: Milan Djokic <milan_djokic@epam.com>
---
 xen/arch/arm/domain_build.c       | 94 +++++++++++++++++++++++++++++++
 xen/arch/arm/include/asm/viommu.h |  1 +
 2 files changed, 95 insertions(+)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 30a4f1fd09..54ae3b5033 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -1440,6 +1440,95 @@ int __init make_timer_node(const struct kernel_info =
*kinfo)
     return res;
 }
=20
+#ifdef CONFIG_ARM_VIRTUAL_IOMMU
+static int make_hwdom_viommu_node(const struct kernel_info *kinfo)
+{
+    uint32_t len;
+    int res;
+    char buf[24];
+    void *fdt =3D kinfo->fdt;
+    const void *prop =3D NULL;
+    const struct dt_device_node *iommu =3D NULL;
+    struct host_iommu *iommu_data;
+    gic_interrupt_t intr;
+
+    if ( list_empty(&host_iommu_list) )
+        return 0;
+
+    list_for_each_entry( iommu_data, &host_iommu_list, entry )
+    {
+        if ( iommu_data->hwdom_node_created )
+            return 0;
+
+        iommu =3D iommu_data->dt_node;
+
+        snprintf(buf, sizeof(buf), "iommu@%"PRIx64, iommu_data->addr);
+
+        res =3D fdt_begin_node(fdt, buf);
+        if ( res )
+            return res;
+
+        prop =3D dt_get_property(iommu, "compatible", &len);
+        if ( !prop )
+        {
+            res =3D -FDT_ERR_XEN(ENOENT);
+            return res;
+        }
+
+        res =3D fdt_property(fdt, "compatible", prop, len);
+        if ( res )
+            return res;
+
+        if ( iommu->phandle )
+        {
+            res =3D fdt_property_cell(fdt, "phandle", iommu->phandle);
+            if ( res )
+                return res;
+        }
+
+        /* Use the same reg regions as the IOMMU node in host DTB. */
+        prop =3D dt_get_property(iommu, "reg", &len);
+        if ( !prop )
+        {
+            printk(XENLOG_ERR "vIOMMU: Can't find IOMMU reg property.\n");
+            res =3D -FDT_ERR_XEN(ENOENT);
+            return res;
+        }
+
+        res =3D fdt_property(fdt, "reg", prop, len);
+        if ( res )
+            return res;
+
+        prop =3D dt_get_property(iommu, "#iommu-cells", &len);
+        if ( !prop )
+        {
+            res =3D -FDT_ERR_XEN(ENOENT);
+            return res;
+        }
+
+        res =3D fdt_property(fdt, "#iommu-cells", prop, len);
+        if ( res )
+            return res;
+
+        res =3D fdt_property_string(fdt, "interrupt-names", "combined");
+        if ( res )
+            return res;
+
+        set_interrupt(intr, iommu_data->irq, 0xf, DT_IRQ_TYPE_LEVEL_HIGH);
+
+        res =3D fdt_property_interrupts(kinfo, &intr, 1);
+        if ( res )
+            return res;
+
+        iommu_data->hwdom_node_created =3D true;
+
+        fdt_end_node(fdt);
+    }
+
+    return res;
+}
+#endif
+
 static int __init handle_node(struct domain *d, struct kernel_info *kinfo,
                               struct dt_device_node *node,
                               p2m_type_t p2mt)
@@ -1508,6 +1597,11 @@ static int __init handle_node(struct domain *d, stru=
ct kernel_info *kinfo,
     if ( dt_match_node(timer_matches, node) )
         return make_timer_node(kinfo);
=20
+#ifdef CONFIG_ARM_VIRTUAL_IOMMU
+    if ( device_get_class(node) =3D=3D DEVICE_IOMMU && is_viommu_enabled()=
 )
+        return make_hwdom_viommu_node(kinfo);
+#endif
+
     /* Skip nodes used by Xen */
     if ( dt_device_used_by(node) =3D=3D DOMID_XEN )
     {
diff --git a/xen/arch/arm/include/asm/viommu.h b/xen/arch/arm/include/asm/v=
iommu.h
index ed338fe0ec..01d4d0dfef 100644
--- a/xen/arch/arm/include/asm/viommu.h
+++ b/xen/arch/arm/include/asm/viommu.h
@@ -19,6 +19,7 @@ struct host_iommu {
     paddr_t addr;
     paddr_t size;
     uint32_t irq;
+    bool hwdom_node_created;
 };
=20
 struct viommu_ops {
--=20
2.43.0

