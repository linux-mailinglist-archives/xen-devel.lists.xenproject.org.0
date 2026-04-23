Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gNS8G91E6mkhxgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2026 18:12:13 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1134B454BA2
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2026 18:12:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1292413.1570909 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFwem-0001Xp-IU; Thu, 23 Apr 2026 16:12:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1292413.1570909; Thu, 23 Apr 2026 16:12:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFwem-0001VW-Ea; Thu, 23 Apr 2026 16:12:00 +0000
Received: by outflank-mailman (input) for mailman id 1292413;
 Thu, 23 Apr 2026 16:11:59 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Oleksii_Moisieiev@epam.com>) id 1wFwel-0001Sy-2A
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2026 16:11:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFwek-004X8B-Et
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2026 18:11:58 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 69ea44cd-5cb7-0a2a0a5109dd-0a2a4503b4ba-2
 for <xen-devel@lists.xenproject.org>; Thu, 23 Apr 2026 18:11:58 +0200
Received: from [52.101.65.82]
 (helo=DU2PR03CU002.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 69ea44ce-672d-0a2a45030019-346541523953-3
 for <xen-devel@lists.xenproject.org>; Thu, 23 Apr 2026 18:11:58 +0200
Received: from DU5PR03MB10263.eurprd03.prod.outlook.com (2603:10a6:10:519::5)
 by PA4PR03MB6752.eurprd03.prod.outlook.com (2603:10a6:102:ea::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.21; Thu, 23 Apr
 2026 16:11:42 +0000
Received: from DU5PR03MB10263.eurprd03.prod.outlook.com
 ([fe80::8c9e:b301:61c0:3908]) by DU5PR03MB10263.eurprd03.prod.outlook.com
 ([fe80::8c9e:b301:61c0:3908%5]) with mapi id 15.20.9846.021; Thu, 23 Apr 2026
 16:11:42 +0000
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
 b=WaMhlaGHLVRqRK1rmuiHLsU9FNN1BH3/EuraybNZrfFcbaJpltYvLQTBLiDagZxwZIxVmondjR1FVlPozOI51QTByf/GKmH3kGqvpss+xlyiZZCEBLwe0e+agJACjL+ucoxZgJUrQSahuBz8hrGE3tgISYWhOO0sIyv+eHjtIxQHIcECdj08WMxivIph/pJj7mt6tAySViP6x5BEAxHG7A39P98iFZvSUHx3QsHkqfII3TdfEmOciuTUJfUw1FjTvkMMYJBvaM+iHszULuIerYoxjKozg+NeZYXdYVYJHWnCpsi/7XUlci4U/dlplHGcfmwOomAY6Ui+WpA6TN/FEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mvr5mzI9zMbvHinWk6X4HXPCOg0zLvukpXSOGKW0FUg=;
 b=Cc3gTOxEaYjW9SdUCK5XJp5HlhokNH3rY5hLUHI3btX9UBu7VUV2hkQ7H/Gk3vhITz0o0rVbDVHYmEYZVTnSTz+lbj2DagJlRza2+pZVHIBxjTz6Tgr8rwbh3GyKDTKSs64Bq6eM32EBTiqCXn3w7338m4XzY1EUzwzUqpk9KzNFq7Edyl/zudEkM1Zk/qoImhHILtG/jDddTuT/rPnwAB84TOZJwnPuXMrDWqu6I07P8PpgkT89uIFIAISfGZx6YjkEw6tgk4YkZaRvmWk7TGWNinHKH9M3DnpPq4X3zEh+aNbROFX/0kQHnw6xjSTNhuaQM6m3ZNghPzn4Dw6HvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mvr5mzI9zMbvHinWk6X4HXPCOg0zLvukpXSOGKW0FUg=;
 b=frBAt8e3Y9CReptWl6YW0626v9tI5naQkpsSZmVdhKssjCkJffsiT5r15zBxUM4XeSzJ+jjuJv5UDrN6qAOQwXc51XJ9nmwaH/AWO10lfQenrJZfgBZfjUQElW/TOmOy+d56Yjf0zCc0H9UeigKJhJiDKNsFSXplPYR3/McNS0iXQSe3Nc5F7woC3jTK0cmyJg0yJ0a375povNVljP5zTY39zMk+cqkbfcUlMPUBSSHz9CpUtZA2cGXUS9DzZ0AR+/RYgCu5FQfgtLH8tO/DM02OIgeBNY6hzq+6lG66tYR/dKDXF5Pqpoyi4XZx8b4tvPLy+RirQYv7VjlcVMSLXA==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Bertrand Marquis <bertrand.marquis@arm.com>, Julien Grall
	<julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>, Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>
Subject: [PATCH v4 3/4] xen/drivers/char/cadence-uart: fix IRQ registration
 failure propagation
Thread-Topic: [PATCH v4 3/4] xen/drivers/char/cadence-uart: fix IRQ
 registration failure propagation
Thread-Index: AQHc0zvfVnWwKQ/dg0SioeeuT3c8CA==
Date: Thu, 23 Apr 2026 16:11:42 +0000
Message-ID:
 <da5af37c01b39495aac11da15325236904c77a5c.1776960679.git.oleksii_moisieiev@epam.com>
References: <cover.1776960679.git.oleksii_moisieiev@epam.com>
In-Reply-To: <cover.1776960679.git.oleksii_moisieiev@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU5PR03MB10263:EE_|PA4PR03MB6752:EE_
x-ms-office365-filtering-correlation-id: 301c4b89-c713-4158-644d-08dea153021b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|18002099003|38070700021|56012099003|22082099003;
x-microsoft-antispam-message-info:
 LQgckP5heoKs5Qw65LsHv1hFeOuexpPHetEvmGDCO2I4FefVSw7J9Z6186lXtToldrf5OPTqNYAugtoRGwXDq/ibFHvn28AcmDX3ozol0QwJdV0olwRBfOK6iaDAJ4blJD+/mky6QkqXPGxVpP2N8uL4Ugsqd2JqS6uyIeD1SLBsScfVGMZxb35qrWy8SbNByFPSK4toWpfXl3HxumrTVwilawXanCCUYc5IpYnUOE96v3AqKly5J+v3+iAYVoOrHXq7Qj45oazpRFvLXv+IIQLPeUh2/+omzpdBeyib9Ya43zmK4ZxP8ylLUGBXSdyi6ZyJ7Dj46RgNYvCcbqCm72ndcrtgUV3NRNFz9d5C94pzauhlO5JoINTZnQvyMzbDXvS8HA/PvWhWK4T3P+AoE5LOgSvNsjJ1IXUzFhux/TytIVvT/62dPNP6cFMgLo9SyQLR6T2ez+QlXBJFg9jPCX1/MdxIpUJPhMi67HbD7AX2ALhQF7uHwodTY4uT1SZJZ/bKICye0qncD9NDODvm7xE3imnADFqyy4lggpsv3yjKHBaxr6M1EpAaIpZwUy/CjAn7bCfMwOn7uh9qEwUTxoofvA7szFfnP622a8Xe79jXq9t5LoRbfaCMlmNtV+O66O8q4w87jLTZ+9EagDedJy3FO1GuNLuf3M6eRcyInV89JQW+9mjcwbBh+zVIMRlIdTeC5ySsOVT8PucMjSh+rKMkGi2YP4BOB6r+ZhF6MHCYR5koHtWTmjS1Zh5CEvgDzfuIorI/KzYyXRR9QYhGtUFHFmE6FVCQiCVvxTmKmBI=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU5PR03MB10263.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(38070700021)(56012099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?jvKcKlgrBDhh6UEv87etZNSRXnk1JIb7/qPPBw6RUNw+EaZMOycCyA8Kdm?=
 =?iso-8859-1?Q?bXFNEWXUKxWBM1viFi4mpyVmlW3CBjhh96i6IqB2Nm1hk97TlNI5T+QuL1?=
 =?iso-8859-1?Q?5KBAR3jeFvZt7nDiit3JZpnsLOiCyRsNTZCGcO49AokGIa+yrKVh7Y2We7?=
 =?iso-8859-1?Q?AghLRUCT+2NtXqYjoXRJnM8g49blCTKj4GFZAhTzvtWfVkC8eIUdDEYzpP?=
 =?iso-8859-1?Q?ab5KJR/YyRcRIuuLa28/ufrSGZRKOyOACboi8I9zGxY2dGcaoQTzqDpREH?=
 =?iso-8859-1?Q?H2brTfA6ZAmPXmcy2I/AS/Cy6kqCKq0o1zWI1ZmJF6L9nIitU9R29Cqrvi?=
 =?iso-8859-1?Q?DDxBkXz3B8ZyrUtHyJXOzeSGbt45Z4aRhQZmq98SOk07OiVgwXTMuLcIfd?=
 =?iso-8859-1?Q?a4z3Rzx2VMNxWTukWH5mtAO111BhWt6xrn4zbjveolEIHmSAJL+/XS0Pkr?=
 =?iso-8859-1?Q?PftojvC+4ocyvcZR27cUb7Gxf5pY2EfjmedxC4k5BCGpFef84d2JcuqCkA?=
 =?iso-8859-1?Q?D/BhbN20xIX5N8Fk7o1MlUAwFcS6gsJpOqsBT+U0vUtdAkEQC1BvwOQnDO?=
 =?iso-8859-1?Q?IerYn8HAKyEZVT4GVyIWxqAQgp/cX9ul7Hd2/pZ0NPHzJBRIM2Vy6u/nfq?=
 =?iso-8859-1?Q?zGQcuYVUAx76V1nZJgGZPOuK/vPLoIgAVcxLqVWD3xBMDZGX72ANzHHPbM?=
 =?iso-8859-1?Q?wNyMgcY/Pb9GubodAxqssZoZMWal6yuOSLPMVLHhLRq2oczX5WfzKxarYa?=
 =?iso-8859-1?Q?Yu5115eVzgT6J8wXJ3Qp4+jF8B38rGdnoswNHZzxIon9SFitvk7YLqpGjZ?=
 =?iso-8859-1?Q?UrQAEIB50n7pFrwRXRetXz2/jd3FFZPBbwYIgIYojz7wZDemOk9WTAZUt9?=
 =?iso-8859-1?Q?dCVDvaS52ubOuuomkCtAd2CEGF8fYyOlBCmGC2fIyJGO/XSrhKaAYOA5yP?=
 =?iso-8859-1?Q?nQw/gjaDXLxosu2DeMkShaEMCXXngfaXakKgUbIh5UTazn8jb3cVmwriT3?=
 =?iso-8859-1?Q?CA6juof1yO9DATvYWXj2C1umeeV+R8iSFtabC5ow1DFffFvRB9l/oryyAS?=
 =?iso-8859-1?Q?sEbGHNjelsZWdzw131bwk9XfLYrDbHBNqxrh5dD2BAy3JOvodisvHHjgRR?=
 =?iso-8859-1?Q?/1aM5xhpjdXsak4gpbRye4WNIdT1d3SyNUf66OMbjoUFe8RCB7BTCjlqsW?=
 =?iso-8859-1?Q?KoG+j9Bk7aauEoCXuLv9AnxZd1i9eyde6AETiZXWJGTQVJrkA1rXPwVXFs?=
 =?iso-8859-1?Q?Z2r8d5+teCPNaFizdzJQTg8kp/ws8loLBbvzK0BBFUX1kfOrnnFMIeWM94?=
 =?iso-8859-1?Q?Lmr5ERu/CpFqYo6YXGEwUiLTQ6YExKL40wnb9/Z32KF3zw4MPt9prgt+Hr?=
 =?iso-8859-1?Q?E92XtKunJk4yG9rq5myMHi6MlDhKIz29jjOjHkiPl9tYh3oXoL43cVtKha?=
 =?iso-8859-1?Q?p6Ak5nSTz2yYZlhSOoPV+WK4qImCdn6nlSpVhoJQHjzlHGj36CcUfhUosn?=
 =?iso-8859-1?Q?F8NRB+7zw1eHQztlJlKNIqB0wwfMAn1V9m6Sidx851FeWjpLBrfF1Fsoza?=
 =?iso-8859-1?Q?dO72bwoYI46tQlXLH9+xm7iKaOGgfh/LI311gDfbnATyjFRDHZ1/EaHPmR?=
 =?iso-8859-1?Q?GBzciLJF+mz6TOsF7AeGw3u7DKZ7xb3wYp7lrlTzCgVCYXMVhGyi45yg+F?=
 =?iso-8859-1?Q?mIBvoq5s4qlTfyBCUEqCQ2MbF/Z8TeoMGj+wQ+qcX4+au7XlSM8MXrdzt1?=
 =?iso-8859-1?Q?FxqC1LVyJjZDNHoXKusr8bcZepMoAnOkWsYmR3OC9GxIh5fMZj6Fa8+Kp4?=
 =?iso-8859-1?Q?QrTZoiWoztncMyCdYjRAiJQ2O7eRAM8=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU5PR03MB10263.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 301c4b89-c713-4158-644d-08dea153021b
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Apr 2026 16:11:42.2002
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PmwOBkVQ0B4+RR4dLsLU9a71VTZJNIakFLnZvuJUm6jjeiMqxmrBmbQzMDpdwXLAxdopvH7KJlUJOSS5bcs6uQtlm8SonX8a9hdIqp/yCPg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB6752
X-purgate-ID: tlsNG-33051d/1776960718-2B161938-A244AA8A/0/0
X-purgate-type: clean
X-purgate-size: 2817
X-Spamd-Result: default: False [-1.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:email,epam.com:dkim,epam.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[Oleksii_Moisieiev@epam.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:bertrand.marquis@arm.com,m:julien@xen.org,m:michal.orzel@amd.com,m:sstabellini@kernel.org,m:Volodymyr_Babchuk@epam.com,m:Oleksii_Moisieiev@epam.com,m:Oleksandr_Tyshchenko@epam.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[epam.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[Oleksii_Moisieiev@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 1134B454BA2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In cuart_init_postirq(), two code paths could reach the
interrupt-enable write to IER without a handler being registered:

- When no valid IRQ number was provided (uart->irq <=3D 0), the original
  positive-condition guard (if uart->irq > 0) skipped the irqaction
  setup but still fell through to the IER write, enabling the receive
  data interrupt with no handler installed.

- When setup_irq() returned an error, only an error message was
  printed and execution continued to the IER write, arming the
  receive hardware interrupt line with no handler to service it. On
  platforms where the GIC receives this asserted line, the result is
  either repeated spurious-interrupt warnings or an unhandled
  interrupt fault.

Restructure cuart_init_postirq() to use early returns in both error
paths.

Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
Reviewed-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
---

Changes in v4:
- fix %d to %u since irq is unsigned in cadence uart
- add R-b

Changes in v3:
- clear pending error interrupts before setup_irq call for cadence uart
- change uart->irq <=3D 0 to uart->irq =3D=3D 0 since irq is unsigned

 xen/drivers/char/cadence-uart.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/xen/drivers/char/cadence-uart.c b/xen/drivers/char/cadence-uar=
t.c
index b2f379833f..0f1c3dd461 100644
--- a/xen/drivers/char/cadence-uart.c
+++ b/xen/drivers/char/cadence-uart.c
@@ -72,19 +72,25 @@ static void __init cuart_init_postirq(struct serial_por=
t *port)
     struct cuart *uart =3D port->uart;
     int rc;
=20
-    if ( uart->irq > 0 )
-    {
-        uart->irqaction.handler =3D cuart_interrupt;
-        uart->irqaction.name    =3D "cadence-uart";
-        uart->irqaction.dev_id  =3D port;
-        if ( (rc =3D setup_irq(uart->irq, 0, &uart->irqaction)) !=3D 0 )
-            printk("ERROR: Failed to allocate cadence-uart IRQ %d\n", uart=
->irq);
-    }
+    /* Don't unmask interrupts if no valid irq was provided */
+    if ( uart->irq =3D=3D 0 )
+        return;
+
+    uart->irqaction.handler =3D cuart_interrupt;
+    uart->irqaction.name    =3D "cadence-uart";
+    uart->irqaction.dev_id  =3D port;
=20
     /* Clear pending error interrupts */
     cuart_write(uart, R_UART_RTRIG, 1);
     cuart_write(uart, R_UART_CISR, ~0);
=20
+    if ( (rc =3D setup_irq(uart->irq, 0, &uart->irqaction)) !=3D 0 )
+    {
+        printk("ERROR: Failed to allocate cadence-uart IRQ %u\n", uart->ir=
q);
+        /* Do not unmask interrupts if irq handler wasn't set */
+        return;
+    }
+
     /* Unmask interrupts */
     cuart_write(uart, R_UART_IDR, ~0);
     cuart_write(uart, R_UART_IER, UART_SR_INTR_RTRIG);
--=20
2.43.0

