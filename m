Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WCHhBE368GlpbgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2026 20:19:57 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B5848A926
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2026 20:19:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1296742.1573010 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHn1s-000237-Hx; Tue, 28 Apr 2026 18:19:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1296742.1573010; Tue, 28 Apr 2026 18:19:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHn1s-00021c-F5; Tue, 28 Apr 2026 18:19:28 +0000
Received: by outflank-mailman (input) for mailman id 1296742;
 Tue, 28 Apr 2026 18:19:27 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmytro_prokopchuk1@epam.com>) id 1wHn1q-00021W-Rz
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2026 18:19:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wHn1q-009BXj-4D
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2026 20:19:26 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 69f0fa1c-e002-0a2a0a5209dd-0a2a4505e6f2-18
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 20:19:26 +0200
Received: from [52.101.84.113]
 (helo=DB3PR0202CU003.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 69f0fa2d-aaa8-0a2a45050019-346554718a49-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 20:19:25 +0200
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com (2603:10a6:20b:3de::17)
 by AS8PR03MB7125.eurprd03.prod.outlook.com (2603:10a6:20b:23e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Tue, 28 Apr
 2026 18:19:24 +0000
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba]) by AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba%3]) with mapi id 15.20.9846.025; Tue, 28 Apr 2026
 18:19:23 +0000
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
 b=G0bqprHb5T1rr6oJfN31N3qtHHInVdiT8rE0CF4GOujZNuOgeKAF2tNo1PGMirotB81ld2NZEZaLX1+PIqy+8uYvXqsiWPJEgTi3hWKci2SvJuCw7IIv9h3jbC4IYwNISe26M2O7tkCqsMiWeReOLwRbe+laBy7VXkzmuRAXRQa1NdJtVt4OlEcu/SoIwwFZdF3pSqpDcqyxEO605n4ud6Y79HZ8AzdLC+pqcTHUk9m8AoPOvP7GrlmoRBl9B+8WypGg4KX7k/8vijvZhmcWT9XXUcsWkkxIM0APgZqOTq1y8RgWHRGrU3dOqTcfAGvAxdKRkkhTQ1A4ujLwKSpsmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s/8ETfaR1Eca5iRdOa4d7CLlQAmv+d0HpoYpF9dtQoU=;
 b=hZOTFutNIW7G1kYAzOS23MNL581OeCcK9/Q87OhzHttlX4C/x6k4PICJGA/RsJeiwMegT0jfJcnelvcT2OzrnqGBAZCmWMSAYnSI+xoWAGjdqAun3lB7J9nZR3B2Z0kg74gHH4LJPTigQRwEmWKTTr392S37/MCEjWfPDha5EVCQvMbj6sXNfawEZ2m1aWbbmf/vvQfjTpkl+zdvtN/bprJbksI1YOHwE0MzMWSvGbaADSkVruX9EkPkcvsRMGI8sHv+PWgIpSMhrMfugOYgE46wCf/xPz2IfxK36YHlVc1pXzFiv7oh6S+N19Xu3HIp2UAI9kiJ177vJvUA6R3mmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s/8ETfaR1Eca5iRdOa4d7CLlQAmv+d0HpoYpF9dtQoU=;
 b=H9qADw5zjH2/wNi7GGdC2DQcs3gbqvtJEO0FRBqDgebkcs356iPlAPYsCg2IOqysoL1ucvYGi313o0Y2+dAzPVmTiqHsjHgokZS3VDeojHqL6jiOHAhvyk7RQojDBfei9bBixcHJdPRzpxKZstLA19Phcsnnanivb4aeKk3w8sZJALEmvahF6z9katkxCIHxEgYrkTw4//g4gLi+HA8A05fxSf1G7d27qrTbW3PPOHGt1ZiOUueJdtLqsNFymh385ZMr7A3295oUu2xt92//isu2+w5YwZSZF4amAEZmo28tzuqhH3CbVzm2+UiWpqou+OrUNeXiBRR2TZJDvnPt4w==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Juergen Gross
	<jgross@suse.com>
Subject: [PATCH v2] hypfs: add ASSERT_UNREACHABLE() in hypfs_get_entry_rel()
Thread-Topic: [PATCH v2] hypfs: add ASSERT_UNREACHABLE() in
 hypfs_get_entry_rel()
Thread-Index: AQHc1zuKSCUJ+s/V9k2YkPF8TK6+Gg==
Date: Tue, 28 Apr 2026 18:19:23 +0000
Message-ID:
 <6db49190e85a30c0129f251ce718d50923baba8d.1777387070.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR03MB7526:EE_|AS8PR03MB7125:EE_
x-ms-office365-filtering-correlation-id: 273f55db-88db-4fba-9049-08dea552acd0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|42112799006|366016|376014|38070700021|18002099003|56012099003;
x-microsoft-antispam-message-info:
 TW4OM+YNvB5y0hhpVscTF4LkFB/Uxbgu84nDMypv6+rh7KqH0RfAjSfxnxmwd64RaMaWoD7uRF/4zmtVlRmlRw2rE2I2w9NCyG26GpLlnmlvcNtZW7ijzoGricBr1JnGTLRVfDrplgjb18bmphrOacqkGOUjNrHne7hqPx0iV3Te2+cawdhzNgY+AmnqY3VG8xPa8yNKRm3yVu54A47/bdrffZsMsbQj2qCbqvKuBdQZj6T+62xE4pJ4OHagOQLkxU2Vx3imrq495lzoV16cosxsvEqSYuGPTAiQH0RwASkxeyWBXPBkocY/OjcySfBOYuWY/JDzw70ayJEAujy1zxhGx3XAH+6kHYE4a5UQnY5EWtaHZm75aCT7LDztiurJUovom+NvXByCatS5pDPW7Y6NCeWydk5QIXy1HgOdZCXdJuLh80SpOrnt5zU02Lq1ileZqvHuQ6tUQyhP7wkkTrBEB5cLVNSNR19Y8UJTJNy0zFjRVUw9GpwP++cuDyU8NADdtkw0WhDYpBnaNattlvMdpeaOcYIv+P9JJF+lj4FRZvgP2f+SD3KRQcG8zkofV+r37cTvgUKxyLHCjPWtOYve2ws/gCB+Ya57aI4fbdIkzU2y+3RL1SEtdc3eb7VERweqCteWxMWUaimr0eSzcV6lQC1g120M+fCO0NQGSXFCjbqORDtMmgnbcsHZ/d/WW90Bw/3y0OziZBGGXBtfARJGbSMMEuEeNxmU4DTUXQuguuzUKjvKSNRdcQA2sDP1
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB7526.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(42112799006)(366016)(376014)(38070700021)(18002099003)(56012099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?KpTMr/C0X6vNswm0LL4lKjm7LPGoVjajrs9NJs0mgDeoz1+FTanJy7dKaM?=
 =?iso-8859-1?Q?4/rsw4CtK562I3/P7E/43bvIrG6QJC7Wh54NlpVlwn39qSmvL8TlBe5t/o?=
 =?iso-8859-1?Q?fuq6hNofdQK3pu60SG9rkLjG8OilxLg7pxF4esRqYureLZjq3v6G3tSS2w?=
 =?iso-8859-1?Q?gV8aGycZVUFeN/Nkx2XoN2OzrrD18fu+eflDHfJbqHScLD1SVR0o9Nk8r2?=
 =?iso-8859-1?Q?AHoXvL6xHvEKtAwwc0sjD5JeCLsguPIl7qdLtnD06aLG/GOpQswVE6XYnu?=
 =?iso-8859-1?Q?C1rmU7G2p5EdyRVe0mRXq5plxsW0mRJNDbVYAH6HsJE1x0HZjv2D4tOHRi?=
 =?iso-8859-1?Q?jcWxE2eRNr4CJEdbgW63SVuMzsGsVTBpsx8X0Jmdi+8znz0onFW8UsrFNN?=
 =?iso-8859-1?Q?amuhkI/qoRs9xLZUzI7JXnAZT3egHRbyTpKaW8vpWeyUEVvmS3DhiW3q+A?=
 =?iso-8859-1?Q?CxNz7aV84WLaL4qawJ7TTyiHm2u+T4MdlyyvvMsDwGMUeF8qhxvhh3azAU?=
 =?iso-8859-1?Q?znEAbjJBjYFVgqgIvzHPqAbWxOoQ8UyzGXHgseXpyZBFWAIUH+cD++KS61?=
 =?iso-8859-1?Q?V430Lkfha8bin9VeA++qTBtWM8jL7cU8sdHQ9MNf/l8eiO9j99jS0iCDbY?=
 =?iso-8859-1?Q?J2MmctvI4VC7h67dSQvREeGNZaYDhoEOPBBpCotslzYUqx9M6T/SGT7sen?=
 =?iso-8859-1?Q?pYMQD/MrV1EX4wKlt5a8yKTerK4DUjjX2rTszYkDBMSTheo0I9Y++C7X8q?=
 =?iso-8859-1?Q?IvPxqwhcAQ6XwfLmLTMlXedsLrt8tn6ZZcYEyl8rCtqh+oXn8VsmYlf6Id?=
 =?iso-8859-1?Q?R0cHx5xUk1T2LnGtwcG2IZUO+CFT5CYhDEeA78G4NqFxCTIx7l3Xl+L8Nq?=
 =?iso-8859-1?Q?IePQXmKHEh004/cTYF+JZgU6syJsIK299kWU2Gb6tY63zzbb2ImXHudxS8?=
 =?iso-8859-1?Q?mDoRGMsYJrGjVRTU8Bz8j8jUK0uQeFciaQe/bSmFLl9E30+D/+G1qW+dcB?=
 =?iso-8859-1?Q?1mY7gI/FXoJAOowKVfAB91yuxAzq3fl7NhaO1qAXhitQkSfR6mdtBnskKk?=
 =?iso-8859-1?Q?1hQHuN7Os4ChzW6bllONFjNhUi3us0qzwTMZxhpNc1647pGNtzDXofP5HR?=
 =?iso-8859-1?Q?el53fL/Tqr3cHU4b0GvHdfzdxKaGLCGgz9hgDS3XSUXunm+UVkjVo/xIOh?=
 =?iso-8859-1?Q?jef1z+rGg+aYk2WSwZomAIn6c9td5N0K7OuxXO+h6TdWnnSXT3oWr/9u71?=
 =?iso-8859-1?Q?cTGltuGKJ4SLREchXwVwoW93T/mCmEB1xeKCeVkbzDIezDQJCiS4GiICgt?=
 =?iso-8859-1?Q?kplI5RMzR6TwWSUsX/IshF0NQM0O2evSC6fGlkd2mTC88/PMTEhf6hk12U?=
 =?iso-8859-1?Q?jHwZ8V+LHv5mwfnet7NAyFsS1iiaj7+FJY8s1PI8+aKRWS0OV2zvZPOjFq?=
 =?iso-8859-1?Q?/H3rKXIVT8XPuu38W9OvkaJFiLsbcD1y4zQtw89FqsdlN/uNK98ebnB6xQ?=
 =?iso-8859-1?Q?7V8ox+XDGvXUu680jw5hso1lhgxPdIOgtmNUYoPCX2Lf6yaaBkc4Tmjlex?=
 =?iso-8859-1?Q?bvEMqkrsWfEtNmiMsPCO3H5P0stg4t+qV56btYHuZQ3vaYIdaPACVjPJQH?=
 =?iso-8859-1?Q?dRjQJ0VO2ftOjRqgQBCPIk/IzmhLtbGCYXkOrNzbiFBl7c9ecwQQf5SNcT?=
 =?iso-8859-1?Q?5FraUtnjTm2psSo1Iy+PU4VQf/QTaGDMCpXJtz86YWCUE6M+7g7fq0lBHc?=
 =?iso-8859-1?Q?oBbMazpHQrtHSZX1uUd7m6g/Z5AKXasSody6Cpyb8nw1aeH8Wj/vOcm2SI?=
 =?iso-8859-1?Q?xJPi487a2p5nVhUHCabA/lPH5C5nNGM=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB7526.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 273f55db-88db-4fba-9049-08dea552acd0
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2026 18:19:23.8377
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: loehAS8/n51UdIIV+V5xu9I3IFUs6oXMApDbh4WQ94jsoQuywpqpOI+2i8g/pZWkAH+RM5gWt4AZ3+PvM135wnfgubfrBbZpB2CsD6AUq88=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7125
X-purgate-ID: tlsNG-c201ff/1777400366-E1BA4443-3D05F7DB/0/0
X-purgate-type: clean
X-purgate-size: 1456
X-Rspamd-Queue-Id: 93B5848A926
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[dmytro_prokopchuk1@epam.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:dmytro_prokopchuk1@epam.com,m:jgross@suse.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,gitlab.com:url,epam.com:email,epam.com:dkim,epam.com:mid];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[dmytro_prokopchuk1@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]

The statement 'return ERR_PTR(-ENOENT);' on the final line of the
function 'hypfs_get_entry_rel()' is unreachable because the logic within
the infinite loop 'for (;;)' provides all possible exit paths for the
function. So there is no execution path to exit the loop and reach the
final that statement.

This unreachable code violates MISRA C Rule 2.1 which states: "A project
shall not contain unreachable code".

To fix that and potential compilers "control reaches end of non-void
function" warning, mark the code path as unreachable using macro
'ASSERT_UNREACHABLE()'.

Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
---
Changes in v2:
- add ASSERT_UNREACHABLE() before the final return statement instead of rem=
oving it
Test CI pipeline:
https://gitlab.com/xen-project/people/dimaprkp4k/xen/-/pipelines/2485661910
Link to v1:
https://patchew.org/Xen/341811ced2943fb79d0235c27781c564c7bdaf02.1775749146=
.git.dmytro._5Fprokopchuk1@epam.com/
---
 xen/common/hypfs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/common/hypfs.c b/xen/common/hypfs.c
index cdf4ee0171..02fb234568 100644
--- a/xen/common/hypfs.c
+++ b/xen/common/hypfs.c
@@ -348,6 +348,7 @@ static struct hypfs_entry *hypfs_get_entry_rel(struct h=
ypfs_entry_dir *dir,
         dir =3D container_of(entry, struct hypfs_entry_dir, e);
     }
=20
+    ASSERT_UNREACHABLE();
     return ERR_PTR(-ENOENT);
 }
=20
--=20
2.43.0

