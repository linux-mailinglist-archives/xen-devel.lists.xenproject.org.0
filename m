Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WCM0BQbEwWkHWQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2026 23:51:50 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4672FE8F1
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2026 23:51:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1259640.1553005 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4o7J-00089Z-LY; Mon, 23 Mar 2026 22:51:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1259640.1553005; Mon, 23 Mar 2026 22:51:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4o7J-00087b-F6; Mon, 23 Mar 2026 22:51:25 +0000
Received: by outflank-mailman (input) for mailman id 1259640;
 Mon, 23 Mar 2026 22:51:24 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <milan_djokic@epam.com>) id 1w4o7I-0007t2-9F
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2026 22:51:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w4o7H-0000sX-LJ
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2026 23:51:23 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <milan_djokic@epam.com>)
 id 69c1c360-5cb7-0a2a0a5109dd-0a2a4502e3b2-42
 for <xen-devel@lists.xenproject.org>; Mon, 23 Mar 2026 23:51:23 +0100
Received: from [52.101.70.72]
 (helo=AS8PR04CU009.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <milan_djokic@epam.com>)
 id 69c1c3eb-63bb-0a2a45020019-34654648d8b3-3
 for <xen-devel@lists.xenproject.org>; Mon, 23 Mar 2026 23:51:23 +0100
Received: from VI1PR03MB5088.eurprd03.prod.outlook.com (2603:10a6:803:c2::20)
 by AS8PR03MB7653.eurprd03.prod.outlook.com (2603:10a6:20b:34b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Mon, 23 Mar
 2026 22:51:21 +0000
Received: from VI1PR03MB5088.eurprd03.prod.outlook.com
 ([fe80::8471:b7dd:8a1c:c30]) by VI1PR03MB5088.eurprd03.prod.outlook.com
 ([fe80::8471:b7dd:8a1c:c30%6]) with mapi id 15.20.9723.022; Mon, 23 Mar 2026
 22:51:20 +0000
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
 b=V95KxmpTkvXsMy9XZlzuW2MyqN69Uar5M5Sejsc1YNHQOEGAntUK1BxuG6BjvaJCgaVPl71/L3D+b4dnEliC20/IprTx5uO2vUdMK6tGlseuIF4GRhancwWj58eteyewu6+ispoFNbWaKCQxLkcI/lOGpe2oP4tJAOnMMecqIIf7j8LNh59wo6HOVgDAz8aLitm+EdW+bJF0jLJGt3GHpxwvC6RO2LzzRK5kOpZvisk/JHzMoMyCwbaX+pt1Ss/AS8DktHMlBFPq/srtHdt/FZpF1ziGHOEJxpJo4zz80sqXOv7dOBzmenIiE4b8oeR7W1YCdAQ5RMvA3CGIAIf4hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sU8GoKCw1duoKn68Ez7JxNbztNRn7RHZZ1LI+M+VqSU=;
 b=lGLv/PUdMQGeaPQ3HTyGKyx5GXpEsMsaNmOYwyjGRrNqdBDvGZ+nm8prnzg0kjIrbXXmbARei7cHThNCQQ5KX1pC5PuEyTgTOXv21p+DjiEk/bvogujMD+5nJ7Kz2pH9mmRKpearJBl+RgXB6T6scWpsaToerTPkf2mrrb0MY7OISKyKciKQmqdhusIohcJnMQzxSCum6FyfEWPkrok+LDcKXHBGErOeR/3P5DlJPzKABOKiNxhFJXW1PvMJUPNHfKN/19m54phzyC7WIwR4xwESsISIJNAMyfN2VCVrSYXgugbqBPkKUJnfD+UycC9SpESJxqlfdqnBwIC7FmAzDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sU8GoKCw1duoKn68Ez7JxNbztNRn7RHZZ1LI+M+VqSU=;
 b=KDSOdCapyD9dyejwgJuyqWgj8y/L5sgmWAOZfV5ATwLYJbSEBSI8VfC91FlUDc4IfQ7p5V8VFHPlGe3LPPUGuSh8augzPH0XDBuXsRHRK0CuZNwDO9HcQqV1Ir/PKRqF1qmbR5tzOzRlDh2ydNYwU+9neS5WkWZ0x2RmI8hs9XzH5F6GQx1Q0gyNQX5Zy2ZyhgXO0YxY3jOpdZ8uVmWoFngeGmUBhzOSdjh1dal88Q9fzMKachhW2hHCz+/luCL639698r9w/xffICyU5XBKdLLlx7uZ5vtaWYm161NnPDD0Old3q7FzZxcxlb1TCu4hTrnxcNkr4PealEF3yr4BIQ==
From: Milan Djokic <milan_djokic@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Rahul Singh <rahul.singh@arm.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Milan Djokic <milan_djokic@epam.com>
Subject: [PATCH v2 03/23] xen/arm: smmuv3: Alloc io_domain for each device
Thread-Topic: [PATCH v2 03/23] xen/arm: smmuv3: Alloc io_domain for each
 device
Thread-Index: AQHcuxeQDJJ467Fpv0mX/F/Xkhss4A==
Date: Mon, 23 Mar 2026 22:51:20 +0000
Message-ID:
 <213efdf828034e421b79cd8ae203b081b839663e.1774305918.git.milan_djokic@epam.com>
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
x-ms-office365-filtering-correlation-id: acbdc7fc-1112-40f1-0ee3-08de892eb336
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700021|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info:
 5kyhcNWdAq7i42Ra+2CmbM3PsvlqO9g2MZD4sP2+eyK9MWGk2FEPln8U/rjOS3ITGRN4v5oNCyhs/PerzotDrjDTPkelARTSht4ONoUGIr7678Xh8+Q91DFERXMGK7gG/NeLUhMoUKZJKRY2tZRB/3MT/5tVeTvzIgUExKg/O5uSmElb5j7JqM31Kuvk94iAjHRgXLFHIwPVdgyYQKPsptjqYhQ8laS3Av/1ILgFAhV9PMi1aQXrP8rxXVmXQRF5l+HDw75Fff2nI74tyxcWXKph3gusvJWK0F4NWtMDZNuyZR4tsN0U2/orljlAJzYu5/xRviFGu5TJHHudmnpWT6lqH4EhYCt2N2FBhzJ5nB96Yib+7RZj5aFe0+SyofubTSiy2X/5dLbg/8efW6DbZ0K1HbflysNtBQIgllkvWModnLCPgU08hp6sJWCvhXY+J1mLorYNC3L6kctv8SpXpbjZcu3QRNRckIMRBBqjGAw59dkro6aVanN3aKZ9RCHKDO1Rp8Q7o3PDRRpEHXMR0YzDXtAfHNCBF4q4XK8jpKcrGMf5dyC2AdbT677XVWaYQVrrgwBIaxInzsjNC1RkTpnoet4YDcl+qU0T5tcZLX/GgSJGLq7GddiK7EaEwMcrP5cFKAc0SgeoPMzC1kIBdb28rKeu6B+YrnapldTqbE7foXXS/pE7e3rSRow/7bMo5ASSfyUi6GS1NxuD+ZnczP9puE2E87wnVik1Ze0WkYUIEyViIT8Tt71CkjQNnYb7uIBZLV8qkPlkwDWA+W1Kp0BG8uMyNOHVc4BH7KmcA8Y=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB5088.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?Xe8UEL5RTv6W/PvB0IjFBjSKBnoglXudHaWnHiiujBEjObsyQYoTFNM2ps?=
 =?iso-8859-1?Q?yxGLuzRAfLR2CZ+5wIjJISDf5lmXQD5pIM6OYrbXUgqiu/8HWzZ3n0W4b5?=
 =?iso-8859-1?Q?IiGCkEm/vgIrtEqev8Ch7+3aKSyHhbThOmvf2FXyPulL4agvp6tyMhJEGr?=
 =?iso-8859-1?Q?pZ8hQa/8nPEG8QFLqYAITNHO26YW57Uop/qc7kGyAVPSbAEZ+G1Vse8fAZ?=
 =?iso-8859-1?Q?SQTJ1WhVFEbEtqcmacA7OZgBa0KIlPTJS0W/1VG9SLyHU9BFYTY3iklzhR?=
 =?iso-8859-1?Q?3Hxz3pflAQ0k+Qt0ZUL4g0vvCLLkJRVj2WzJZ3eXCC5M98vYh4tD6sira7?=
 =?iso-8859-1?Q?7auzCDwQmk0Cporp77nw7J2evgYUczsxKxsjnIsZrl0+OKZSATqqXgqcUJ?=
 =?iso-8859-1?Q?Kl+yec+aifmlIqt8w4rZw9vwyQ6rg9vcw3fhZmccSatY7AnRVI8HKaoYh5?=
 =?iso-8859-1?Q?Er3WmZv0/0lOnLDj21Qnyg9aU3NUPlZNaU6CxYBJhEy1BCqu9m0MMpCkZa?=
 =?iso-8859-1?Q?6lxIldAI1pgrewcNRaJinX2eLgCh7co0Kxz3HVql5fXZcyyJ+sntaogz3S?=
 =?iso-8859-1?Q?/7XyL3jnztgkpuzvAqFMMxSaE0expQ/cmZcE7wJu7izYFVJbnRYG/My0xw?=
 =?iso-8859-1?Q?ASZ4Fwx7UOSzFaFIjr0ORkfClIV+nFHPCThAtXoNLUqsl2wl85Mu+oiaNO?=
 =?iso-8859-1?Q?OaDI9GUsx2o718gzNfOVg3jegAMf9yEwpQbW3+fAPkE6721NjZAM7uZb7j?=
 =?iso-8859-1?Q?l8UgkKQ787FkZiMILLso1VOHyrRUUPFgw1WjO3HxgoGK1miQJYiKGzYWw2?=
 =?iso-8859-1?Q?87L2v05fA3r3Kswj062MHqJSL0CdZ7kfJVyUo5jmi0twZKLlXPKFePPS5l?=
 =?iso-8859-1?Q?z8sXkpcTskZtP6I58GWkQ3AdqRlQVc9GS8zWI6ly+kLpOVh5ft30sL4qNI?=
 =?iso-8859-1?Q?oPUQefTu/RBN4Dfi11UXnoOjLjzxjFMpg5833zbon3vRVJVfAhn3BwUxmG?=
 =?iso-8859-1?Q?WVG91feyTpvR2tsdI5b/I31u8gRtsAAC/h3sreQe1xrWnpHBUBjmaoljWc?=
 =?iso-8859-1?Q?OLfNlAxEhU8aiOxsxyvRrL/h2/yGh5v2c40eRqJfgm5hgjzAK8z3Ck/KKX?=
 =?iso-8859-1?Q?42cBkzvfa21aJT8gMq2O2bXTjKH6a+4BmrLui12pq08BKkSwA+iO8XuZ7u?=
 =?iso-8859-1?Q?dzuYSAs/QTolXv5cCfVXSwWVN7DPtN8HJU+Z3t+zpGGMBNVkrzwHShE/Qy?=
 =?iso-8859-1?Q?WTHOHjXeiVbtYqpyFRZCDzmT6mMduXnIfu5ootvk4WPUAH88EJZjp54mbt?=
 =?iso-8859-1?Q?s7bDlmoN6nu3y1asUS+zmTc9HAztEmQUtMImZNG2fIfkQfuV5ufj/AJSTw?=
 =?iso-8859-1?Q?N57EEK2+vOwxO5nv30kvFVvdMuyeynCGczoWNmsf3UiYu0xtF3I8C7VIFF?=
 =?iso-8859-1?Q?Zvu4WXbIrNjGBMERkF7U5FUr5DAxVaTwE0NINExkh3aRTSHps97+1Y2W0W?=
 =?iso-8859-1?Q?YQK3c4Lke7hoM25NwdcbldKt5tmuwZv/7K/sIxRlVhg5vDuVyBdyyQqTA1?=
 =?iso-8859-1?Q?gYGIhHkwG3Tq8RXhRdi0hZmiZUDl1x7b5vCcINhZi1SEIl4nB0Zt+16NVy?=
 =?iso-8859-1?Q?nibHzIRYkEgX4Xktx2MHmS3hVVIBZ+KzR5EXk/0061rLPboJ15ji7vJ+u8?=
 =?iso-8859-1?Q?waq3wLCISyXELS699U0G9opstFufck/FbxAEa66Qa2xXnz95fYtKRvf9C+?=
 =?iso-8859-1?Q?pSpgMxOcQiSlkeMUsMsFbwjixdAiRY98odvNvEultQuvHbbE/yOhTBa1dX?=
 =?iso-8859-1?Q?R8kC/6PhkQQLcl0eyOY/0s0uDqdZdPg=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB5088.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acbdc7fc-1112-40f1-0ee3-08de892eb336
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2026 22:51:20.1001
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: I0SVuKoBINuZefJ6/VG3AYBTN/lsl9K7537ND7gJbR/VbW/vaZLupbNlRiqePq1WC63exttxPNpy7VU3NFJQHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7653
X-purgate-ID: tlsNG-720697/1774306283-43C8BDB8-DA626BD9/0/0
X-purgate-type: clean
X-purgate-size: 2159
X-Spamd-Result: default: False [-1.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:dkim,epam.com:email,epam.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,arm.com:email];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[milan_djokic@epam.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:rahul.singh@arm.com,m:bertrand.marquis@arm.com,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:milan_djokic@epam.com,s:lists@lfdr.de];
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
X-Rspamd-Queue-Id: BB4672FE8F1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Rahul Singh <rahul.singh@arm.com>

In current implementation io_domain is allocated once for each xen
domain as Stage2 translation is common for all devices in same xen
domain.

Nested stage supports S1 and S2 configuration at the same time. Stage1
translation will be different for each device as linux kernel will
allocate page-table for each device.

Alloc io_domain for each device so that each device can have different
Stage-1 and Stage-2 configuration structure.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Signed-off-by: Milan Djokic <milan_djokic@epam.com>
---
 xen/drivers/passthrough/arm/smmu-v3.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthroug=
h/arm/smmu-v3.c
index f9c6837919..19e55b6c9b 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.c
+++ b/xen/drivers/passthrough/arm/smmu-v3.c
@@ -2809,11 +2809,13 @@ static struct arm_smmu_device *arm_smmu_get_by_dev(=
const struct device *dev)
 static struct iommu_domain *arm_smmu_get_domain(struct domain *d,
 				struct device *dev)
 {
+	unsigned long flags;
 	struct iommu_domain *io_domain;
 	struct arm_smmu_domain *smmu_domain;
 	struct iommu_fwspec *fwspec =3D dev_iommu_fwspec_get(dev);
 	struct arm_smmu_xen_domain *xen_domain =3D dom_iommu(d)->arch.priv;
 	struct arm_smmu_device *smmu =3D arm_smmu_get_by_dev(fwspec->iommu_dev);
+	struct arm_smmu_master *master;
=20
 	if (!smmu)
 		return NULL;
@@ -2824,8 +2826,15 @@ static struct iommu_domain *arm_smmu_get_domain(stru=
ct domain *d,
 	 */
 	list_for_each_entry(io_domain, &xen_domain->contexts, list) {
 		smmu_domain =3D to_smmu_domain(io_domain);
-		if (smmu_domain->smmu =3D=3D smmu)
-			return io_domain;
+
+		spin_lock_irqsave(&smmu_domain->devices_lock, flags);
+		list_for_each_entry(master, &smmu_domain->devices, domain_head) {
+			if (master->dev =3D=3D dev) {
+				spin_unlock_irqrestore(&smmu_domain->devices_lock, flags);
+				return io_domain;
+			}
+		}
+		spin_unlock_irqrestore(&smmu_domain->devices_lock, flags);
 	}
 	return NULL;
 }
--=20
2.43.0

