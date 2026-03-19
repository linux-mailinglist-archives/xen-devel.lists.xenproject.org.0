Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SEv4MmJdvGlxxQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 21:32:34 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD502D2307
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 21:32:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1257550.1551920 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3K24-0006NW-8s; Thu, 19 Mar 2026 20:31:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1257550.1551920; Thu, 19 Mar 2026 20:31:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3K24-0006Ke-4h; Thu, 19 Mar 2026 20:31:52 +0000
Received: by outflank-mailman (input) for mailman id 1257550;
 Thu, 19 Mar 2026 20:31:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S4vP=BT=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1w3K23-0006KY-8O
 for xen-devel@lists.xenproject.org; Thu, 19 Mar 2026 20:31:51 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a4c56806-23d2-11f1-9ccf-f158ae23cfc8;
 Thu, 19 Mar 2026 21:31:44 +0100 (CET)
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com (2603:10a6:20b:3de::17)
 by PAWPR03MB9761.eurprd03.prod.outlook.com (2603:10a6:102:2e4::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.22; Thu, 19 Mar
 2026 20:31:39 +0000
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba]) by AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba%3]) with mapi id 15.20.9723.018; Thu, 19 Mar 2026
 20:31:40 +0000
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
X-Inumbo-ID: a4c56806-23d2-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mNeK/Vqj1s+QPZpmICNW3uEitBet+GxBNgPLZgyrtz6Ozz48Rbrrim4Telv0CMYDzmn1WIn632Ho+/W5w25R2XDH6QU6nC/fZFnMQiBcfo+USGg0TuoC5LcaHpXNr+W1/xLw8aUSftrGe/GbXVac+fLj7wx+ga0U/CINiTslys7Ycvyb+OpnUUEj2nHQUo2iRQV9oSki9j/3/f+6jT2RguyOasufmCkDp3QQSKju7a+eQs0L7jRF/8WuYpsYseThOOQmnI4csmrzWCWWFZjMGwlmk5cuif/LTITKt6s3FZebzzydD2E55O1/+MQg8ln9716Gz1T7IM59zGxuWWzBXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SaxsfFLqPWY8Z0990llkc2YeoFB0uS8/8dnWO7VyWpM=;
 b=DUM6ZuSB0I5upJFIiIPzB75LJgJK0o5duL7Z9fOdJwJSu/J1tGIO6vkbpIqZ5fXU/5jaryEJz9/pO28J0yHSrl+PMaOz1Wb5GipsSkcY6GWCfxoa/CvQV2Pi0hk8u2OoSxgNduWf2KU30Ku2jsiGwo7gTv6kL3J5W8ZVkHCP1sIfWidrJzQiGnQHNTqD5BWaVzMGP4bBiiXvBYWkRNcgDcAr2dh8H/FuMwkflypvB++YhPOcoAY/hMgVTsh7IAXZC0t1Fp5bGOG2TLy7fMcOYTLzUzYRhgx+F6mp0b9xz9T913RHkNGWKyYjrEhQ2klomlbCHjzTM4p10mXKvV4f8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SaxsfFLqPWY8Z0990llkc2YeoFB0uS8/8dnWO7VyWpM=;
 b=EQeolzz9Y41VXl8OyvJmdiehnxIZQRD0RM1tccF83g4lzg3S8vkqiUKX4Kv+8KdiBG03GQhGhcxQTOBhjWSNCy24eonk5n1JAi/nTRSzKgYQD/KaimeGijyO/XRbBFrIyFcr3iFbuaAPC4HIbjWzkVM+J5RSbwHYpEsiad/6Zkk+0RcUH9JoYbJ4oltFr2WyU7snBDVgR26B/aSeWsn1PvlL/oyA34MZZcjX1UCCQP2Fuw5LO60xulW/0lhHiKNvOVDqfPQzOW0Y21riqgYFw9e2WaVRGVkLQOKzNvOyGs5r1xu+NcHLVMhH/FyzcHEhl1EgAcmYzrkEyozjW+0QgA==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] xen/cache-col: address MISRA C Rule 5.3
Thread-Topic: [PATCH] xen/cache-col: address MISRA C Rule 5.3
Thread-Index: AQHct99kwxPxzBz4DUGcLo60qBaCjA==
Date: Thu, 19 Mar 2026 20:31:39 +0000
Message-ID:
 <ded7e2aeecd18109bf2fde5cff0d356932f08e28.1773952245.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR03MB7526:EE_|PAWPR03MB9761:EE_
x-ms-office365-filtering-correlation-id: 4b1cc597-3c15-42e8-0ef6-08de85f6869a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|42112799006|376014|38070700021|18002099003|56012099003;
x-microsoft-antispam-message-info:
 u3roHqd6XG4YNNTvhhed/5f4j7BQYuCKTDP1LhizfAq6vdAoGtCYT7yBEzmEpUoOwSSJbNThKwMOZZqwYIX9t6oYJpU8YiDdKwCSrQzdIInxCowu1hLTptVtA7vyk+m/3wgawn5a5pevFV51yhwpRlGsht1UDg6xhPg827EdsH+ZZdsq7mywu7ONpCfLZn9vVN/lpJxis43G7P7y2tiWP32EOmurRGDL7MrSjuQXOzNImdfjuLaDfqvk1q/cZINyZeymQ0xTr4/i2hAiG6qbu+6vfYEbODfUZpgLocV2p50CM8GKmFo2gBHdGMCExS5gQbvhTOk7emg7y31Cy/TOr58xAwbFPs/EPWUePSV//LlZ6pOirSWbWgc7tYftH9F3zlejCr+tv08AeQ99mP7oDtsilZGMJ6sJNEA9Gb9e4zZ4hJBWw+CRb/vYZ+nxYaTZuTaWLBN60BViTvk/QBTbZY+i3fRjhIAtibJW+pobfkHyzaA4uPHFQtlRVg6ZU6OkHoHkjwEINqYzNycJdEo1gssS4Uo2ivLrVKOIHTStJTazh5q+E3aO/uWbeVpBcwPTqupP3ykevjeeS6R8J07NiXzsE5uEX09YgG0ttBR51Oc2y9p4H06KK90tM8Ur7M2VeBdPRZdQSmDfneQfAZXHDxWX04Ac2mVUwgOf/w4rVefwtIHWoO12eixZnMNWXZiu5OOjo18jBBvCGhVKQoDkCB05ZpeksHEdTky1DONFjCrQZicfLUyX1vIRXasQyEsRwcZ+QSHH3PjSdHFkcITBq01c+ni1NRABEFFmXhv/ZHw=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB7526.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(42112799006)(376014)(38070700021)(18002099003)(56012099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?M2VwHVbYkpJ41TjLotNQpXMm8X22/okbC26UpFPB/ckR0Y1f5CTiEn5Kao?=
 =?iso-8859-1?Q?p6n4G7kndOo9tpKe1FfmXDggqhqrVyKtvkrKw/5xONmwJMDCg5gddl383E?=
 =?iso-8859-1?Q?Z1bJfvkkdFxWF5zjsjtgqLXtiqHq/XgIbDnwO9HUMUZA1ti645o3xsW/NE?=
 =?iso-8859-1?Q?CDK4B4DdW1z6trU4WAtnvfd5W/JbbtkWl3DulEf2LCf1thSitj9WMS7d0z?=
 =?iso-8859-1?Q?nyTbCjy3oF0BXsV2SBiDTA0Wsb8qB/3wpxEkWufznol9swix9Rhx5DS4TS?=
 =?iso-8859-1?Q?8SzsbpOMqj3wUPxUJZQq2mR5pZHM7gXhl6rrWiBWDO8y5EMRFCFBEaonfG?=
 =?iso-8859-1?Q?uaERVrIiQbvbH5cqycCFF/CGIdiepEL5LjQ705aaSY4GBiIjPYZABoziDZ?=
 =?iso-8859-1?Q?vyXGmzaqOmpahD2DVTYuOaAJPGgCKfQ98T+OOAPBFH5QQR63kRvaLjouFH?=
 =?iso-8859-1?Q?If3BSrj7g4WRXFZxgoxZb7FR7utWW0yGJCjn3UiEVuDvMOygslp+vI62Eb?=
 =?iso-8859-1?Q?YeHFArIMYL2Kr3er+KaR7cuCfwDBY5+dxStwAScj68+7srTd9k9IhK2+v2?=
 =?iso-8859-1?Q?8ZKjWCfSSzmsqibaitfwMb6To1d7+aohFHhr1kBIEApMd2dk7izgLY5Tgh?=
 =?iso-8859-1?Q?lqt5Td0FWzlAB2Wlpc6ivDmMsi4Y4VtPTiVDXFy6Z5s5YmeXs2jJJX3FJk?=
 =?iso-8859-1?Q?RpFl0hi7ZyUJiGvr36meNXEdv7QfnjUIDIsNDraOGC3IP08KhCcCatpzcF?=
 =?iso-8859-1?Q?fyfLw7KSoh+2VcY7SgvcCL17JhCVKTNBPr4fXvzaw0x9Tjz4f0ba4m9zLe?=
 =?iso-8859-1?Q?y9IXJ2ceyEI0LVw2MylgNg7tK7r69k3VLfhoF6aAK5PW5InW4VZw6D/Uau?=
 =?iso-8859-1?Q?B2eWphP34J/RPt3VshH4boJF6LH7GoWw4FkV+6d5zfhzrTgcidMW7YCnZM?=
 =?iso-8859-1?Q?YGURZlutPNGvAOiMLRhQCpiTGbI3s+i54eKS+f+tOTtdisVXSqa+d93lXI?=
 =?iso-8859-1?Q?CF558APx3zwmm3wah7R4c6zaM8I/3HWkw3kvH1Uy7QE9fkdgrlwzA521xY?=
 =?iso-8859-1?Q?HbAq6zMbC6gENYrSOrMmKETfwjfB13UuYlyynQurMBmxH4IUrjp5mpoBYo?=
 =?iso-8859-1?Q?gvg5EDQnkchS6HvWPtgeLH/qVXK6lkAa3xXw8njAjzfTyjc/fRlkpuiZ20?=
 =?iso-8859-1?Q?4OKfrst2tyguZYVfOYP7xlYHZ7PJEPtE7gwC3wIIf3EzH+r/j6/qLtNLtU?=
 =?iso-8859-1?Q?ydknHaCXhTtU4Gjbr/e51mB2DmF+S6thNqyafZrAsWpgWcyFDxiMmfY5AA?=
 =?iso-8859-1?Q?euAvlBtY8y5XHk1t++3WGTM4E0MIiQBgAWil2DLKuRpK6t85AverRxd2LW?=
 =?iso-8859-1?Q?OfknF/zqo1R6DZgybJPCx1l4sMFIvI28BX6//HemBIK7w/HnWaJdCLeeQR?=
 =?iso-8859-1?Q?fcVcu6g4cziBuFaz87tMa2qMraH6gz6BnzplIGOP4CfqxAyFVuEoT1zbyJ?=
 =?iso-8859-1?Q?ZHfkDwoHii6rJH7mXdULIIZvMDhVRbuQw6k4YmJEJmP4Rnc7iEtU0c1lGn?=
 =?iso-8859-1?Q?UR4zFjMj8NQwoAPOkYzMKXsuoFCAefyKJhA+IGLdiO+JUcL+Od9BnT+0pN?=
 =?iso-8859-1?Q?ydYC69TscDGEF1WTnPrQ3meLLCGFkXzetfUqKHnDt7qa7rhfo6vkEVa+2A?=
 =?iso-8859-1?Q?CQK6b/xKFeZ+a68c7Z234fAC1Qo3D8aHwfIRUbb5Rq/tIZin2ptYKvoWTu?=
 =?iso-8859-1?Q?n/vAx5Zf7DBu3nDBTzdm7zV4JeRMhpUvbTZtixCT1ctnSRw/6dyl08odFg?=
 =?iso-8859-1?Q?1P197MZeM7+X8avieTC4NxhMM9QYHX8=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB7526.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b1cc597-3c15-42e8-0ef6-08de85f6869a
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2026 20:31:39.9544
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HxN9QxoHOQAb6cw6hf7f42275ltgKvZpAyKlGa5rEwr0Bl+4Eh7/i24B4WyI9so3INyRFFP1aMwB1nFuLhx8bWrL0TCMted6HmMvVPRAiRA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR03MB9761
X-Spamd-Result: default: False [-1.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[dmytro_prokopchuk1@epam.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:dmytro_prokopchuk1@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,epam.com:dkim,epam.com:email,epam.com:mid];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_NEQ_ENVFROM(0.00)[dmytro_prokopchuk1@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 2CD502D2307
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

MISRA C:2012 Rule 5.3 states as following: An identifier declared in an
inner scope shall not hide an identifier declared in an outer scope.

Inside the 'if' block, the inner 'i' shadows the outer 'i'.
Reuse the outer variable and remove the inner declaration to fix that.

No functional change.

Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
---
 xen/common/llc-coloring.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/xen/common/llc-coloring.c b/xen/common/llc-coloring.c
index 77a54beed1..822a6b2ed5 100644
--- a/xen/common/llc-coloring.c
+++ b/xen/common/llc-coloring.c
@@ -193,8 +193,6 @@ void __init llc_coloring_init(void)
=20
     if ( !xen_num_colors )
     {
-        unsigned int i;
-
         xen_num_colors =3D MIN(XEN_DEFAULT_NUM_COLORS, max_nr_colors);
=20
         printk(XENLOG_WARNING
--=20
2.43.0

