Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YLMABaIJB2r5qwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 13:55:14 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A86654EDE9
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 13:55:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1309893.1580937 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNr8C-0005tv-E7; Fri, 15 May 2026 11:55:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1309893.1580937; Fri, 15 May 2026 11:55:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNr8C-0005pC-9Z; Fri, 15 May 2026 11:55:04 +0000
Received: by outflank-mailman (input) for mailman id 1309893;
 Fri, 15 May 2026 11:55:01 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykyta_Poturai@epam.com>) id 1wNr88-0004vB-IM
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 11:55:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNr87-006N3i-UH
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 13:54:59 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 6a07098e-bab6-0a2a0a5309dd-0a2a450ce7ce-18
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 13:54:59 +0200
Received: from [52.101.66.95]
 (helo=DUZPR83CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 6a070993-62f1-0a2a450c0019-3465425fdad9-4
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 13:54:59 +0200
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by PAWPR03MB10041.eurprd03.prod.outlook.com
 (2603:10a6:102:359::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Fri, 15 May
 2026 11:54:57 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%5]) with mapi id 15.20.9913.009; Fri, 15 May 2026
 11:54:57 +0000
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
 b=xcxA63gNiOmEhnVdrVyshILhIIOSQyPLin0Xy4uRH9XBF907E6ECNA5W7NyNoQ0Nt13G+4u+K/+xNV+Dnj3Hp/GWACDBhSGI8zgOQnkjPZYkwh0YpdXHvaragEP7Wlf1nW1WoqirCfP6NtNmtRl64p4ffZpFRhBOmE/eq1LlWUvVriWvT8gnvYZslR8H2pa+6/09+36lTw/3OVN2Hl1qxj5M8XPucjBO9dUNlzVJ1zHUTn6Azye59I2sxMfPH0d4XBvBjRfyiAGyc407SJUKvvOb6wPTQDbyXmBJ70nza/eskJyORcTH1hwqJ+xQ77X0XPYU+Atj1QzV5MdilDCbFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qBPuAdZn25EVVYx3eWOg7V3LNEk4yjCeJuAwYmmpDgs=;
 b=AKHn4UDDYPRHhiEPmCYrlQxYlnaVEKff1h+vajIvI4roRhOclF+Qc/ut3jY+R0Hl2yfQLBakgE2sK2u6JIsGja7Sgf1gY1GzDdRyK3OpBYPxSicM+fVS8oamunXNa0qitf/cDB7JdtttnGOwNx/GN9/sXPL0cnHvJMdOf0Pl84G7Q3QlbX/rrUMLnfIdBhfFZuHfKsxYOBEMBGlWtbDu1yRR+bHkFLeWDRbByVeKo2nSDRVqhE7aawBef5s/0BK68RovyaaWME+uLQYsMD4jCefKw2FkmhjYqvaJEeGSh1wYjqKgP0ohq9xWqZbHKNV6x2dHOojchWrwjQtJ5dG8GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qBPuAdZn25EVVYx3eWOg7V3LNEk4yjCeJuAwYmmpDgs=;
 b=ob9ul3q8AiV8s9zs+fPGFQo/CHFkiuB7UP4FfQI7Z7IWv+v1eACE1ZJnfgWJ4vR328C3iqiDio/UTa8kXS60AADYjmax6Jr4+fliv8DwscPUqz5Gvo7ZMKiHz77WfgFkZbGKKhyUaicvS//wxHKBGu+An6zhDDuwQ05kfQUZyJ15CwtWYBeJ4b+wmGLmwtT+9P0tdvTirg23DvWumYihP1rVjg1mh842o5llgXMpNr+Ueqkc4Y2pdEvZJMzAmt694fwoYSZn8dmeQiV87Qdrf+eeNBYY661Wj6If7tAsEYoGlXXoSobhdEYJP52T8xJrc099fGD/8UrQCS/IOIUbXA==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Anthony PERARD
	<anthony.perard@vates.tech>
Subject: [PATCH v8 5/6] tools: Allow building xen-hptool without
 CONFIG_MIGRATE
Thread-Topic: [PATCH v8 5/6] tools: Allow building xen-hptool without
 CONFIG_MIGRATE
Thread-Index: AQHc5GGmgZHFl4GybESq6ehOLkSGhw==
Date: Fri, 15 May 2026 11:54:57 +0000
Message-ID:
 <d4db5afa4cc02a234bff93416a639c750e5f1bf9.1778845596.git.mykyta_poturai@epam.com>
References: <cover.1778845596.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1778845596.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|PAWPR03MB10041:EE_
x-ms-office365-filtering-correlation-id: 971da0c4-8372-455f-daec-08deb278c94b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|11063799003|22082099003|38070700021|56012099003|18002099003;
x-microsoft-antispam-message-info:
 PSkE88+ylz0Syl4QYS/GdMpHD/H1wRpkeFUR3z2oXqsqko6OF7E0R7th2kbjyQMGNLrV7jl0tGSkP33GF5coSMVjGaNf6U/M+rNXJyLshz9pdBD1wdgCHuReD+Ro97oX8jJVeilDhW1uwHoHy68bqcZP6eskye4vv4fn5RIJTeWRKJIili1YbB0HGe/eHLaD517wKvU/3aj9z7P9D8j50ekzeJH+M1Nv1c1diiNKHaQraYl5XU0zf4D+Aj/+uDCNjSGQtJdUbZgIRbnY34/EyH/xd0onvu4t0MWjvbcFYYYBxwygHgVrzFf5K5H2pb8LICdVmKlRXSPqm9Ew7peNYI4jI48HOB0d9kTiecMxRmTGdC7WiZrXZkMSVyGagWVrB4BtA1tMA+a+1COyjEOxkd92iFyL4TkTwhg8W2lOlqK+bYZUPex6HDAgRMxmATsW/ad3FtURB0PM0lzHclnKuqO5CHOhP4ErCm6CqYo0JzNQUUAnnOa3CRbtn1OMLpF/X9C3t58mEcWbgTTNRFiMRRuP1TvY+7n5GU8+WmLIaYUTKewnSy81U0uE86wnhVaw0/GlVCLc7xw2rNhiyK2B8/ElFUiJTeVP+pSFSB0O/V1BMHiFdtyK8CyHdnUIruEDQHer/UaeA90xEjh/r7o7iAy1hwnAjIZQWG6EuhdKoK5f7IHP/GfXpQfN+pWORR3R92Ve+LjvrhLH5nAJknVj4zFiJCuMcnaxLXDoqoyzKSiyLWjJFhZfKHgrSAqAk5/g
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(11063799003)(22082099003)(38070700021)(56012099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?4G49oejgRU7yQbsAaLqnk3K4Z0rdkmZwf7EAxXm+w62HYnyJn9smgkmg5o?=
 =?iso-8859-1?Q?l6H1NVxFhsHLUW4VWoQYjyOjHVqHyoZhl9WM7B5jrjemjjXIEB/sqaAR/j?=
 =?iso-8859-1?Q?KUo9B3I6HLdIySc1M9kkJkwvEKhkmiD/yXsJZSL8b9UAVgWuSTW2uavONA?=
 =?iso-8859-1?Q?zv1/y9kwq5uOg2Q3NPi4BPM5NqDlKka1Hd8glGkW+oVjR91i2PyQ2oaaC1?=
 =?iso-8859-1?Q?tMnwfYGyTgBxus3gspTmYOC4fV5ZxDWgx/DLZlki/mGohLt7nZDSx455mj?=
 =?iso-8859-1?Q?zAqxkXAjvxpdaX0z9E5nLjedWl1z8Fl4D6KgB/a/wxqF1bVvp0R9fRjjuO?=
 =?iso-8859-1?Q?OwhXqdRPVM54XOGOpQvCLdEkvX80WNqKJvTgGEZRCXFNZRX1Gnv6Ki1wUu?=
 =?iso-8859-1?Q?JGhU7QsYZD4mrDXQD89z8mrHm6T/UQ0ROTRnaEcRe5qMBaigCJwD0RipZq?=
 =?iso-8859-1?Q?gkH6x/k7ADk49CBS2T2f70Cauu1f1A/6VrbwblXUFzCSsJMPbp81lnJaQH?=
 =?iso-8859-1?Q?ecoml9Jo8pptXolYmmmx1Gzi2HtYAqFB3z1C/jVilO1ES7PJ6BOt/m/mq5?=
 =?iso-8859-1?Q?rLOGg15PxAsB/p0DlzOfcA/ypQuHjXkMf/pMDXv0eLAFgo1iIzMLf1CG0/?=
 =?iso-8859-1?Q?6wXUkzzqvT4Q02BlPhU29LOfSK8oxCCLdp4unPo9fwHStY3eGCm3DDovPg?=
 =?iso-8859-1?Q?U6OJdU0aG4EKQ8UzzaMQe4HQTx8BHElxlQW8C0HI43n+doG5tPBC0UdyiE?=
 =?iso-8859-1?Q?umM8x8t7KcCXucZKNW0bP30skhsNFJ1ywGlJlU0Nlx/8M5YWM2aFNjWy7r?=
 =?iso-8859-1?Q?gLFaoV0/etE4iXG6k652HHgKi+kHqlqsS0nFQvRNeLjE5tcKb8RHQqtMUB?=
 =?iso-8859-1?Q?CJWW4EB7SGlvZ9euyOuvX/KRIgV6Xqf7YBO+w+X52j/Cx1CfUcYbbs1dFH?=
 =?iso-8859-1?Q?QkhamqR7VEivx0xA2OPNvvsj+79kSrmWijOFGtHUycLlXyJ19v5BB+9Mu0?=
 =?iso-8859-1?Q?rIi2XULxlyWWDCWbSfjA+D41m+6scMqLugeD3qv81qwCYtKnhAjaoGuuhk?=
 =?iso-8859-1?Q?CgPcZ0v7qdL97AHe6/3OI1AJwhdriU0u9hET0Xe6UxEQLpamPLWqCLFhAt?=
 =?iso-8859-1?Q?6SyU7WfURJJxuUsGprwFbe/4IWwjlqSTlP1m6aclv/CvGFQ318l+W4Hekq?=
 =?iso-8859-1?Q?gXtFb3Aw24pMQdfi++UwLr+wDHIp+yuof6VOKvWlVzzlDNwjmApmBP/ypz?=
 =?iso-8859-1?Q?HvdO/4PXAgNSfoE9tJZ1O14lWBMlWf6VDG5a5PGZuDEOLt390hRMXzYJZB?=
 =?iso-8859-1?Q?5jQzQus8eyENcLC8GEFvu1nWdqH1vBiMZOYp3U1VHCdNn591s+k2nHUT22?=
 =?iso-8859-1?Q?es24/4aTf8vcEGhlIhHrkMUfuhdhnQKK7yyrFGWSd+1As+fb+j1zghuENO?=
 =?iso-8859-1?Q?jQR26lwIpfAz8R5TM2j3lpNyS8Kwcp9VM8+rJmhoRfzpmQtgVbvjiMqQwR?=
 =?iso-8859-1?Q?iHJXN1srYSnXPJFCnPK89IorzGNEfVJlX9aOp9XLCqwtj2PIWtSWROgvwa?=
 =?iso-8859-1?Q?xT/aEwzQdtBXzwLXVjmwrQGUGbSDn3sIQpiMBULrEXqjjFleG8HzKLCEXL?=
 =?iso-8859-1?Q?xCaCdHUshv/XPLTEp6YDnbe8JnxmxzcyfBW/HV0cZgeT7YB8xyW6XaLxld?=
 =?iso-8859-1?Q?9lL/aGoLXpm1/NN/uPzdeYig4lMta8ZbHyb9CbHWZn9w4eqNFeAeZwpCF+?=
 =?iso-8859-1?Q?zRLd8SutX92H5LvkM4wgQCm2PtzmXRycAQ6VznBUFHeZVl9ix7eeoHPkXV?=
 =?iso-8859-1?Q?DxZMPwSkEVcFMDaqp5J1tiujC5lG4Wc=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 971da0c4-8372-455f-daec-08deb278c94b
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2026 11:54:57.2987
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Em5Z4175Po9cYd5nT6hZFmLNrY35+Hjjdlm+jA01GOrlA6k4hZLo9CEePTu2VNKqG0ccAN8uivs+rnscxIMGLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR03MB10041
X-purgate-ID: tlsNG-d25034/1778846099-F5983CF5-4968DD1C/0/0
X-purgate-type: clean
X-purgate-size: 24276
X-Rspamd-Queue-Id: 7A86654EDE9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Mykyta_Poturai@epam.com,m:anthony.perard@vates.tech,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[epam.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

With CPU hotplug sysctls implemented on Arm it becomes useful to have a
tool for calling them.

According to the commit history it seems that putting hptool under
config MIGRATE was a measure to fix IA64 build. As IA64 is no longer
supported it can now be brought back. So build it unconditionally.

Operations specific to x86 architecture are moved into a separate file and =
only built on x86.

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
v7->v8:
* move x86 specific function into a separate file

v6->v7:
* no changes

v5->v6:
* don't change order in Makefile

v4->v5:
* make hptool always build

v3->v4:
* no changes

v2->v3:
* no changes

v1->v2:
* switch to configure from legacy config
---
 tools/misc/Makefile         |   8 +-
 tools/misc/xen-hptool-x86.c | 277 ++++++++++++++++++++++++++++++++++
 tools/misc/xen-hptool.c     | 293 ++----------------------------------
 tools/misc/xen-hptool.h     |  14 ++
 4 files changed, 311 insertions(+), 281 deletions(-)
 create mode 100644 tools/misc/xen-hptool-x86.c
 create mode 100644 tools/misc/xen-hptool.h

diff --git a/tools/misc/Makefile b/tools/misc/Makefile
index 6ee783f43e..645819e455 100644
--- a/tools/misc/Makefile
+++ b/tools/misc/Makefile
@@ -16,7 +16,7 @@ INSTALL_BIN                    +=3D xencov_split
 INSTALL_BIN +=3D $(INSTALL_BIN-y)
=20
 # Everything to be installed in regular sbin/
-INSTALL_SBIN-$(CONFIG_MIGRATE) +=3D xen-hptool
+INSTALL_SBIN                   +=3D xen-hptool
 INSTALL_SBIN-$(CONFIG_X86)     +=3D xen-hvmcrash
 INSTALL_SBIN-$(CONFIG_X86)     +=3D xen-hvmctx
 INSTALL_SBIN-$(CONFIG_X86)     +=3D xen-lowmemd
@@ -104,8 +104,10 @@ xenhypfs: xenhypfs.o
 xenlockprof: xenlockprof.o
 	$(CC) $(LDFLAGS) -o $@ $< $(LDLIBS_libxenctrl) $(APPEND_LDFLAGS)
=20
-xen-hptool: xen-hptool.o
-	$(CC) $(LDFLAGS) -o $@ $< $(LDLIBS_libxenevtchn) $(LDLIBS_libxenctrl) $(L=
DLIBS_libxenguest) $(LDLIBS_libxenstore) $(APPEND_LDFLAGS)
+HPTOOL_OBJS-$(CONFIG_MIGRATE) +=3D xen-hptool-x86.o
+
+xen-hptool: xen-hptool.o $(HPTOOL_OBJS-y)
+	$(CC) $(LDFLAGS) -o $@ $^ $(LDLIBS_libxenevtchn) $(LDLIBS_libxenctrl) $(L=
DLIBS_libxenguest) $(LDLIBS_libxenstore) $(APPEND_LDFLAGS)
=20
 xenhypfs.o: CFLAGS +=3D $(CFLAGS_libxenhypfs)
=20
diff --git a/tools/misc/xen-hptool-x86.c b/tools/misc/xen-hptool-x86.c
new file mode 100644
index 0000000000..9336f30f1f
--- /dev/null
+++ b/tools/misc/xen-hptool-x86.c
@@ -0,0 +1,277 @@
+#include <stdlib.h>
+#include <string.h>
+#include <unistd.h>
+#include <xenevtchn.h>
+#include <xenctrl.h>
+#include <xenguest.h>
+#include <xenstore.h>
+#include "xen-hptool.h"
+
+int hp_mem_online_func(int argc, char *argv[], xc_interface *xch)
+{
+    uint32_t status;
+    int ret;
+    unsigned long mfn;
+
+    if (argc !=3D 1)
+    {
+        show_help();
+        return -1;
+    }
+
+    sscanf(argv[0], "%lx", &mfn);
+    printf("Prepare to online MEMORY mfn %lx\n", mfn);
+
+    ret =3D xc_mark_page_online(xch, mfn, mfn, &status);
+
+    if (ret < 0)
+        fprintf(stderr, "Onlining page mfn %lx failed, error %x\n", mfn, e=
rrno);
+    else if (status & (PG_ONLINE_FAILED |PG_ONLINE_BROKEN)) {
+        fprintf(stderr, "Onlining page mfn %lx is broken, "
+                        "Memory online failed\n", mfn);
+        ret =3D -1;
+    }
+    else if (status & PG_ONLINE_ONLINED)
+        printf("Memory mfn %lx onlined successfully\n", mfn);
+    else
+        printf("Memory is already onlined!\n");
+
+    return ret;
+}
+
+int hp_mem_query_func(int argc, char *argv[], xc_interface *xch)
+{
+    uint32_t status;
+    int ret;
+    unsigned long mfn;
+
+    if (argc !=3D 1)
+    {
+        show_help();
+        return -1;
+    }
+
+    sscanf(argv[0], "%lx", &mfn);
+    printf("Querying MEMORY mfn %lx status\n", mfn);
+    ret =3D xc_query_page_offline_status(xch, mfn, mfn, &status);
+
+    if (ret < 0)
+        fprintf(stderr, "Querying page mfn %lx failed, error %x\n", mfn, e=
rrno);
+    else
+    {
+        printf("Memory Status %x: [", status);
+        if ( status & PG_OFFLINE_STATUS_OFFLINE_PENDING)
+            printf(" PAGE_OFFLINE_PENDING ");
+        if ( status & PG_OFFLINE_STATUS_BROKEN )
+            printf(" PAGE_BROKEND  ");
+        if ( status & PG_OFFLINE_STATUS_OFFLINED )
+            printf(" PAGE_OFFLINED ");
+        else
+            printf(" PAGE_ONLINED ");
+        printf("]\n");
+    }
+
+    return ret;
+}
+
+static int suspend_guest(xc_interface *xch, xenevtchn_handle *xce, int dom=
id,
+                         int *evtchn, int *lockfd)
+{
+    int port, rc, suspend_evtchn =3D -1;
+
+    *lockfd =3D -1;
+
+    if (!evtchn)
+        return -1;
+
+    port =3D xs_suspend_evtchn_port(domid);
+    if (port < 0)
+    {
+        fprintf(stderr, "DOM%d: No suspend port, try live migration\n", do=
mid);
+        goto failed;
+    }
+    suspend_evtchn =3D xc_suspend_evtchn_init_exclusive(xch, xce, domid,
+                                                      port, lockfd);
+    if (suspend_evtchn < 0)
+    {
+        fprintf(stderr, "Suspend evtchn initialization failed\n");
+        goto failed;
+    }
+    *evtchn =3D suspend_evtchn;
+
+    rc =3D xenevtchn_notify(xce, suspend_evtchn);
+    if (rc < 0)
+    {
+        fprintf(stderr, "Failed to notify suspend channel: errno %d\n", rc=
);
+        goto failed;
+    }
+    if (xc_await_suspend(xch, xce, suspend_evtchn) < 0)
+    {
+        fprintf(stderr, "Suspend Failed\n");
+        goto failed;
+    }
+    return 0;
+
+failed:
+    if (suspend_evtchn !=3D -1)
+        xc_suspend_evtchn_release(xch, xce, domid,
+                                  suspend_evtchn, lockfd);
+
+    return -1;
+}
+
+int hp_mem_offline_func(int argc, char *argv[], xc_interface *xch)
+{
+    uint32_t status, domid;
+    int ret;
+    unsigned long mfn;
+
+    if (argc !=3D 1)
+    {
+        show_help();
+        return -1;
+    }
+
+    sscanf(argv[0], "%lx", &mfn);
+    printf("Prepare to offline MEMORY mfn %lx\n", mfn);
+    ret =3D xc_mark_page_offline(xch, mfn, mfn, &status);
+    if (ret < 0) {
+        fprintf(stderr, "Offlining page mfn %lx failed, error %x\n", mfn, =
errno);
+        if (status & (PG_OFFLINE_XENPAGE | PG_OFFLINE_FAILED))
+            fprintf(stderr, "XEN_PAGE is not permitted be offlined\n");
+        else if (status & (PG_OFFLINE_FAILED | PG_OFFLINE_NOT_CONV_RAM))
+            fprintf(stderr, "RESERVED RAM is not permitted to be offlined\=
n");
+    }
+    else
+    {
+        switch(status & PG_OFFLINE_STATUS_MASK)
+        {
+            case PG_OFFLINE_OFFLINED:
+            {
+                printf("Memory mfn %lx offlined successfully, current stat=
e is"
+                       " [PG_OFFLINE_OFFLINED]\n", mfn);
+                if (status & PG_OFFLINE_BROKEN)
+                    printf("And this offlined PAGE is already marked broke=
n"
+                        " before!\n");
+                break;
+            }
+            case PG_OFFLINE_FAILED:
+            {
+                fprintf(stderr, "Memory mfn %lx offline failed\n", mfn);
+                if ( status & PG_OFFLINE_ANONYMOUS)
+                    fprintf(stderr, "the memory is an anonymous page!\n");
+                ret =3D -1;
+                break;
+            }
+            case PG_OFFLINE_PENDING:
+            {
+                if (status & PG_OFFLINE_XENPAGE) {
+                    ret =3D -1;
+                    fprintf(stderr, "Memory mfn %lx offlined succssefully,=
"
+                            "this page is xen page, current state is"
+                            " [PG_OFFLINE_PENDING, PG_OFFLINE_XENPAGE]\n",=
 mfn);
+                }
+                else if (status & PG_OFFLINE_OWNED)
+                {
+                    int result, suspend_evtchn =3D -1, suspend_lockfd =3D =
-1;
+                    xenevtchn_handle *xce;
+                    xce =3D xenevtchn_open(NULL, 0);
+
+                    if (xce =3D=3D NULL)
+                    {
+                        fprintf(stderr, "When exchange page, fail"
+                                " to open evtchn\n");
+                        return -1;
+                    }
+
+                    domid =3D status >> PG_OFFLINE_OWNER_SHIFT;
+                    if (suspend_guest(xch, xce, domid,
+                                      &suspend_evtchn, &suspend_lockfd))
+                    {
+                        fprintf(stderr, "Failed to suspend guest %d for"
+                                " mfn %lx\n", domid, mfn);
+                        xenevtchn_close(xce);
+                        return -1;
+                    }
+
+                    result =3D xc_exchange_page(xch, domid, mfn);
+
+                    /* Exchange page successfully */
+                    if (result =3D=3D 0)
+                        printf("Memory mfn %lx offlined successfully, this=
 "
+                                "page is DOM%d page and being swapped "
+                                "successfully, current state is "
+                                "[PG_OFFLINE_OFFLINED, PG_OFFLINE_OWNED]\n=
",
+                                mfn, domid);
+                    else {
+                        ret =3D -1;
+                        fprintf(stderr, "Memory mfn %lx offlined successfu=
lly"
+                                " , this page is DOM%d page yet failed to =
be "
+                                "exchanged. current state is "
+                                "[PG_OFFLINE_PENDING, PG_OFFLINE_OWNED]\n"=
,
+                                mfn, domid);
+                    }
+                    xc_domain_resume(xch, domid, 1);
+                    xc_suspend_evtchn_release(xch, xce, domid,
+                                              suspend_evtchn, &suspend_loc=
kfd);
+                    xenevtchn_close(xce);
+                }
+                break;
+            }
+        }//end of switch
+    }//end of if
+
+    return ret;
+}
+
+int main_smt_enable(int argc, char *argv[], xc_interface *xch)
+{
+    int ret;
+
+    if ( argc )
+    {
+        show_help();
+        return -1;
+    }
+
+    for ( ;; )
+    {
+        ret =3D xc_smt_enable(xch);
+        if ( (ret >=3D 0) || (errno !=3D EBUSY) )
+            break;
+    }
+
+    if ( ret < 0 )
+        fprintf(stderr, "Unable to enable SMT: errno %d, %s\n",
+                errno, strerror(errno));
+    else
+        printf("Enabled SMT\n");
+
+    return ret;
+}
+
+int main_smt_disable(int argc, char *argv[], xc_interface *xch)
+{
+    int ret;
+
+    if ( argc )
+    {
+        show_help();
+        return -1;
+    }
+
+    for ( ;; )
+    {
+        ret =3D xc_smt_disable(xch);
+        if ( (ret >=3D 0) || (errno !=3D EBUSY) )
+            break;
+    }
+
+    if ( ret < 0 )
+        fprintf(stderr, "Unable to disable SMT: errno %d, %s\n",
+                errno, strerror(errno));
+    else
+        printf("Disabled SMT\n");
+
+    return ret;
+}
diff --git a/tools/misc/xen-hptool.c b/tools/misc/xen-hptool.c
index 590810b6eb..7b886e2304 100644
--- a/tools/misc/xen-hptool.c
+++ b/tools/misc/xen-hptool.c
@@ -6,8 +6,8 @@
 #include <xenguest.h>
 #include <xenstore.h>
 #include <xen-tools/common-macros.h>
+#include "xen-hptool.h"
=20
-static xc_interface *xch;
=20
 void show_help(void)
 {
@@ -18,239 +18,25 @@ void show_help(void)
             "  help                     display this help\n"
             "  cpu-online    <cpuid>    online CPU <cpuid>\n"
             "  cpu-offline   <cpuid>    offline CPU <cpuid>\n"
+#if defined(__i386__) || defined(__x86_64__)
             "  mem-online    <mfn>      online MEMORY <mfn>\n"
             "  mem-offline   <mfn>      offline MEMORY <mfn>\n"
             "  mem-status    <mfn>      query Memory status<mfn>\n"
             "  smt-enable               onlines all SMT threads\n"
             "  smt-disable              offlines all SMT threads\n"
+#endif
            );
 }
=20
 /* wrapper function */
-static int help_func(int argc, char *argv[])
+static int help_func(int argc, char *argv[], xc_interface *xch)
 {
     show_help();
     return 0;
 }
=20
-static int hp_mem_online_func(int argc, char *argv[])
-{
-    uint32_t status;
-    int ret;
-    unsigned long mfn;
-
-    if (argc !=3D 1)
-    {
-        show_help();
-        return -1;
-    }
-
-    sscanf(argv[0], "%lx", &mfn);
-    printf("Prepare to online MEMORY mfn %lx\n", mfn);
-
-    ret =3D xc_mark_page_online(xch, mfn, mfn, &status);
-
-    if (ret < 0)
-        fprintf(stderr, "Onlining page mfn %lx failed, error %x\n", mfn, e=
rrno);
-    else if (status & (PG_ONLINE_FAILED |PG_ONLINE_BROKEN)) {
-        fprintf(stderr, "Onlining page mfn %lx is broken, "
-                        "Memory online failed\n", mfn);
-        ret =3D -1;
-    }
-    else if (status & PG_ONLINE_ONLINED)
-        printf("Memory mfn %lx onlined successfully\n", mfn);
-    else
-        printf("Memory is already onlined!\n");
-
-    return ret;
-}
-
-static int hp_mem_query_func(int argc, char *argv[])
-{
-    uint32_t status;
-    int ret;
-    unsigned long mfn;
-
-    if (argc !=3D 1)
-    {
-        show_help();
-        return -1;
-    }
-
-    sscanf(argv[0], "%lx", &mfn);
-    printf("Querying MEMORY mfn %lx status\n", mfn);
-    ret =3D xc_query_page_offline_status(xch, mfn, mfn, &status);
-
-    if (ret < 0)
-        fprintf(stderr, "Querying page mfn %lx failed, error %x\n", mfn, e=
rrno);
-    else
-    {
-        printf("Memory Status %x: [", status);
-        if ( status & PG_OFFLINE_STATUS_OFFLINE_PENDING)
-            printf(" PAGE_OFFLINE_PENDING ");
-        if ( status & PG_OFFLINE_STATUS_BROKEN )
-            printf(" PAGE_BROKEND  ");
-        if ( status & PG_OFFLINE_STATUS_OFFLINED )
-            printf(" PAGE_OFFLINED ");
-        else
-            printf(" PAGE_ONLINED ");
-        printf("]\n");
-    }
-
-    return ret;
-}
-
-static int suspend_guest(xc_interface *xch, xenevtchn_handle *xce, int dom=
id,
-                         int *evtchn, int *lockfd)
-{
-    int port, rc, suspend_evtchn =3D -1;
-
-    *lockfd =3D -1;
-
-    if (!evtchn)
-        return -1;
-
-    port =3D xs_suspend_evtchn_port(domid);
-    if (port < 0)
-    {
-        fprintf(stderr, "DOM%d: No suspend port, try live migration\n", do=
mid);
-        goto failed;
-    }
-    suspend_evtchn =3D xc_suspend_evtchn_init_exclusive(xch, xce, domid,
-                                                      port, lockfd);
-    if (suspend_evtchn < 0)
-    {
-        fprintf(stderr, "Suspend evtchn initialization failed\n");
-        goto failed;
-    }
-    *evtchn =3D suspend_evtchn;
-
-    rc =3D xenevtchn_notify(xce, suspend_evtchn);
-    if (rc < 0)
-    {
-        fprintf(stderr, "Failed to notify suspend channel: errno %d\n", rc=
);
-        goto failed;
-    }
-    if (xc_await_suspend(xch, xce, suspend_evtchn) < 0)
-    {
-        fprintf(stderr, "Suspend Failed\n");
-        goto failed;
-    }
-    return 0;
-
-failed:
-    if (suspend_evtchn !=3D -1)
-        xc_suspend_evtchn_release(xch, xce, domid,
-                                  suspend_evtchn, lockfd);
-
-    return -1;
-}
-
-static int hp_mem_offline_func(int argc, char *argv[])
-{
-    uint32_t status, domid;
-    int ret;
-    unsigned long mfn;
-
-    if (argc !=3D 1)
-    {
-        show_help();
-        return -1;
-    }
-
-    sscanf(argv[0], "%lx", &mfn);
-    printf("Prepare to offline MEMORY mfn %lx\n", mfn);
-    ret =3D xc_mark_page_offline(xch, mfn, mfn, &status);
-    if (ret < 0) {
-        fprintf(stderr, "Offlining page mfn %lx failed, error %x\n", mfn, =
errno);
-        if (status & (PG_OFFLINE_XENPAGE | PG_OFFLINE_FAILED))
-            fprintf(stderr, "XEN_PAGE is not permitted be offlined\n");
-        else if (status & (PG_OFFLINE_FAILED | PG_OFFLINE_NOT_CONV_RAM))
-            fprintf(stderr, "RESERVED RAM is not permitted to be offlined\=
n");
-    }
-    else
-    {
-        switch(status & PG_OFFLINE_STATUS_MASK)
-        {
-            case PG_OFFLINE_OFFLINED:
-            {
-                printf("Memory mfn %lx offlined successfully, current stat=
e is"
-                       " [PG_OFFLINE_OFFLINED]\n", mfn);
-                if (status & PG_OFFLINE_BROKEN)
-                    printf("And this offlined PAGE is already marked broke=
n"
-                        " before!\n");
-                break;
-            }
-            case PG_OFFLINE_FAILED:
-            {
-                fprintf(stderr, "Memory mfn %lx offline failed\n", mfn);
-                if ( status & PG_OFFLINE_ANONYMOUS)
-                    fprintf(stderr, "the memory is an anonymous page!\n");
-                ret =3D -1;
-                break;
-            }
-            case PG_OFFLINE_PENDING:
-            {
-                if (status & PG_OFFLINE_XENPAGE) {
-                    ret =3D -1;
-                    fprintf(stderr, "Memory mfn %lx offlined succssefully,=
"
-                            "this page is xen page, current state is"
-                            " [PG_OFFLINE_PENDING, PG_OFFLINE_XENPAGE]\n",=
 mfn);
-                }
-                else if (status & PG_OFFLINE_OWNED)
-                {
-                    int result, suspend_evtchn =3D -1, suspend_lockfd =3D =
-1;
-                    xenevtchn_handle *xce;
-                    xce =3D xenevtchn_open(NULL, 0);
-
-                    if (xce =3D=3D NULL)
-                    {
-                        fprintf(stderr, "When exchange page, fail"
-                                " to open evtchn\n");
-                        return -1;
-                    }
-
-                    domid =3D status >> PG_OFFLINE_OWNER_SHIFT;
-                    if (suspend_guest(xch, xce, domid,
-                                      &suspend_evtchn, &suspend_lockfd))
-                    {
-                        fprintf(stderr, "Failed to suspend guest %d for"
-                                " mfn %lx\n", domid, mfn);
-                        xenevtchn_close(xce);
-                        return -1;
-                    }
-
-                    result =3D xc_exchange_page(xch, domid, mfn);
-
-                    /* Exchange page successfully */
-                    if (result =3D=3D 0)
-                        printf("Memory mfn %lx offlined successfully, this=
 "
-                                "page is DOM%d page and being swapped "
-                                "successfully, current state is "
-                                "[PG_OFFLINE_OFFLINED, PG_OFFLINE_OWNED]\n=
",
-                                mfn, domid);
-                    else {
-                        ret =3D -1;
-                        fprintf(stderr, "Memory mfn %lx offlined successfu=
lly"
-                                " , this page is DOM%d page yet failed to =
be "
-                                "exchanged. current state is "
-                                "[PG_OFFLINE_PENDING, PG_OFFLINE_OWNED]\n"=
,
-                                mfn, domid);
-                    }
-                    xc_domain_resume(xch, domid, 1);
-                    xc_suspend_evtchn_release(xch, xce, domid,
-                                              suspend_evtchn, &suspend_loc=
kfd);
-                    xenevtchn_close(xce);
-                }
-                break;
-            }
-        }//end of switch
-    }//end of if
-
-    return ret;
-}
-
-static int exec_cpu_hp_fn(int (*hp_fn)(xc_interface *, int), int cpu)
+static int exec_cpu_hp_fn(int (*hp_fn)(xc_interface *, int), int cpu,
+                          xc_interface *xch)
 {
     int ret;
=20
@@ -265,7 +51,7 @@ static int exec_cpu_hp_fn(int (*hp_fn)(xc_interface *, i=
nt), int cpu)
     return ret;
 }
=20
-static int hp_cpu_online_func(int argc, char *argv[])
+static int hp_cpu_online_func(int argc, char *argv[], xc_interface *xch)
 {
     int cpu, ret;
=20
@@ -277,7 +63,7 @@ static int hp_cpu_online_func(int argc, char *argv[])
=20
     cpu =3D atoi(argv[0]);
     printf("Prepare to online CPU %d\n", cpu);
-    ret =3D exec_cpu_hp_fn(xc_cpu_online, cpu);
+    ret =3D exec_cpu_hp_fn(xc_cpu_online, cpu, xch);
     if (ret < 0)
         fprintf(stderr, "CPU %d online failed (error %d: %s)\n",
                 cpu, errno, strerror(errno));
@@ -287,7 +73,7 @@ static int hp_cpu_online_func(int argc, char *argv[])
     return ret;
=20
 }
-static int hp_cpu_offline_func(int argc, char *argv[])
+static int hp_cpu_offline_func(int argc, char *argv[], xc_interface *xch)
 {
     int cpu, ret;
=20
@@ -298,7 +84,7 @@ static int hp_cpu_offline_func(int argc, char *argv[])
     }
     cpu =3D atoi(argv[0]);
     printf("Prepare to offline CPU %d\n", cpu);
-    ret =3D exec_cpu_hp_fn(xc_cpu_offline, cpu);
+    ret =3D exec_cpu_hp_fn(xc_cpu_offline, cpu, xch);
     if (ret < 0)
         fprintf(stderr, "CPU %d offline failed (error %d: %s)\n",
                 cpu, errno, strerror(errno));
@@ -308,76 +94,27 @@ static int hp_cpu_offline_func(int argc, char *argv[])
     return ret;
 }
=20
-static int main_smt_enable(int argc, char *argv[])
-{
-    int ret;
-
-    if ( argc )
-    {
-        show_help();
-        return -1;
-    }
-
-    for ( ;; )
-    {
-        ret =3D xc_smt_enable(xch);
-        if ( (ret >=3D 0) || (errno !=3D EBUSY) )
-            break;
-    }
-
-    if ( ret < 0 )
-        fprintf(stderr, "Unable to enable SMT: errno %d, %s\n",
-                errno, strerror(errno));
-    else
-        printf("Enabled SMT\n");
-
-    return ret;
-}
-
-static int main_smt_disable(int argc, char *argv[])
-{
-    int ret;
-
-    if ( argc )
-    {
-        show_help();
-        return -1;
-    }
-
-    for ( ;; )
-    {
-        ret =3D xc_smt_disable(xch);
-        if ( (ret >=3D 0) || (errno !=3D EBUSY) )
-            break;
-    }
-
-    if ( ret < 0 )
-        fprintf(stderr, "Unable to disable SMT: errno %d, %s\n",
-                errno, strerror(errno));
-    else
-        printf("Disabled SMT\n");
-
-    return ret;
-}
-
 struct {
     const char *name;
-    int (*function)(int argc, char *argv[]);
+    int (*function)(int argc, char *argv[], xc_interface *xch);
 } main_options[] =3D {
     { "help", help_func },
     { "cpu-online", hp_cpu_online_func },
     { "cpu-offline", hp_cpu_offline_func },
+#if defined(__i386__) || defined(__x86_64__)
     { "mem-status", hp_mem_query_func},
     { "mem-online", hp_mem_online_func},
     { "mem-offline", hp_mem_offline_func},
     { "smt-enable", main_smt_enable },
     { "smt-disable", main_smt_disable },
+#endif
 };
=20
=20
 int main(int argc, char *argv[])
 {
     int i, ret;
+    xc_interface *xch;
=20
     if (argc < 2)
     {
@@ -402,7 +139,7 @@ int main(int argc, char *argv[])
         return 1;
     }
=20
-    ret =3D main_options[i].function(argc -2, argv + 2);
+    ret =3D main_options[i].function(argc -2, argv + 2, xch);
=20
     xc_interface_close(xch);
=20
diff --git a/tools/misc/xen-hptool.h b/tools/misc/xen-hptool.h
new file mode 100644
index 0000000000..2efa7c8177
--- /dev/null
+++ b/tools/misc/xen-hptool.h
@@ -0,0 +1,14 @@
+#ifndef __XEN_HPTOOL_H__
+#define __XEN_HPTOOL_H__
+
+#if defined(__i386__) || defined(__x86_64__)
+int hp_mem_online_func(int argc, char *argv[], xc_interface *xch);
+int hp_mem_query_func(int argc, char *argv[], xc_interface *xch);
+int hp_mem_offline_func(int argc, char *argv[], xc_interface *xch);
+int main_smt_enable(int argc, char *argv[], xc_interface *xch);
+int main_smt_disable(int argc, char *argv[], xc_interface *xch);
+#endif
+
+void show_help(void);
+
+#endif /* __XEN_HPTOOL_H__ */
--=20
2.51.2

