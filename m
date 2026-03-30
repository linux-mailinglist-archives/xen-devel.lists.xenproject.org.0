Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2CheCtRlymll8gUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2026 14:00:20 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5BB635AB94
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2026 14:00:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1267453.1556970 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7BHh-00014G-TB; Mon, 30 Mar 2026 11:59:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1267453.1556970; Mon, 30 Mar 2026 11:59:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7BHh-0000r9-OJ; Mon, 30 Mar 2026 11:59:57 +0000
Received: by outflank-mailman (input) for mailman id 1267453;
 Mon, 30 Mar 2026 11:59:56 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykyta_Poturai@epam.com>) id 1w7BHf-0000Nt-Ox
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2026 11:59:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7BHf-00CdRq-46
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2026 13:59:55 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 69ca65af-bab6-0a2a0a5309dd-0a2a4503af12-46
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 13:59:55 +0200
Received: from [52.101.70.120]
 (helo=AS8PR04CU009.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 69ca65ba-1947-0a2a45030019-346546784220-5
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 13:59:54 +0200
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by GV1PR03MB8639.eurprd03.prod.outlook.com
 (2603:10a6:150:95::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Mon, 30 Mar
 2026 11:59:52 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%5]) with mapi id 15.20.9745.027; Mon, 30 Mar 2026
 11:59:52 +0000
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
 b=b0y66QiZM3Ap3iVY09S89Mtp4XI57DXDVjOXnhOD8hvneScOY/z5YTBJr9nSp78W95reA6BiCzDcbbp6BgRLDJ1l4cWSg45AG77EHUuIrIn0cNm5KAMatjALP+oIowAdS0rgWxLo3wIksuga7nyC8Ng4xAqYMJy6xqSI4ofeOsvk6ooQyh/lbK47AL0j8FY+mASuOV2OQ96VkTgoP1zt+3xTFjhjEC/jIPHFS3O223rgtiQNqvYqzhNV2tpS2DmO+Dl9EnYdlIM6b3b2cQ+nsKZrS3tcEPnhlfdlNVEANPsx1WWRPBx+GWonZuWmclBNI6xP/zvVjcN6N/Ner9NIzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E3iSLGPHqmeiKU0oUeQNqssLEt+HtM9f9hldHYWh/ZE=;
 b=hzch4FgvrxIqLQdoC2LSCfsrSyKComsehHgMloIhyOCD0e6hYfwEvAYRepoPv4G5tka8Wu5AQDy46xhuQbosK1C+tuZKyh4v5XBPORVeTXDc4o3K3oXcioydMnlBfUCiCyIBmYBnFnhBLyTQURKWwIg5aaH+3hj/G49g4Rsj0xAR+q+tWce03rCXkGYCuBsFHoNCr4RyJKq85t3Z0ida5F0FcjhO31USInhX2pfUK+5Tjo3x+0+z0PiwnyUGubCPSWezcxgNOfHnOdWiTjQYJZeDMHA23Cog/UZ1IQoXOy/l3xFsmR4u9dGh+1WuwG+jvH/AEzDV9MzvevJB7g3WPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E3iSLGPHqmeiKU0oUeQNqssLEt+HtM9f9hldHYWh/ZE=;
 b=HmS/CeHgsMMbd8zZAjwUZwClJeBYRIpwJ+4jCVIxQFLRpdFMYmUNhxPk8A9HAKxMkqYUCRIXOzAqxMisVQ3zSz9KjIzBVPtkjg0PuTFhuaI3Kl2r5OYJxUUrYTDAnA/zah6Dwc7Zlm9updCMUfBoz4c0KOdWhYcQWh5kHPlIHbRiGxfzTCeuYVEFWLUruaazg/xJ0tcCZsRhShESE8b3xQ1oQ7/mnP1UmXmR8s2r12Jy65xiWjdQdDg4zUblh9cCcDtXAqSi/yN3B8gK+8xNGCFYWdjXGDCSGeIBFpdwoZ9r1x4aeBXzlxRkq5cE2iL/x4aCTSrPDhoC+VzjpbG/qw==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Jan
 Beulich <jbeulich@suse.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Timothy Pearson <tpearson@raptorengineering.com>,
	Alistair Francis <alistair.francis@wdc.com>, Connor Davis
	<connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH v7 4/6] arm/sysctl: Implement cpu hotplug ops
Thread-Topic: [PATCH v7 4/6] arm/sysctl: Implement cpu hotplug ops
Thread-Index: AQHcwDy3jsTaF4UzaEqMI3x4mLb6EQ==
Date: Mon, 30 Mar 2026 11:59:51 +0000
Message-ID:
 <9ac96559ed00257f347bd61b1e074fc3f6ce8a32.1774871881.git.mykyta_poturai@epam.com>
References: <cover.1774871881.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1774871881.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|GV1PR03MB8639:EE_
x-ms-office365-filtering-correlation-id: 9b5cc244-782b-4fa6-1d85-08de8e53d9ca
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700021|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info:
 8QbRfh/jT9D8bw2p8y3/4Bxmdyh3Ry52U+h6cCl2Mxoyvfz6B635w5mGSRd6bWmhXSpREnHUbcacCTK/X/h6yW7mPhQ6MetZ8VXCSiPuEmsWxLMqrpdpdaGmNYiMrQ74VQI05C8xv6+P99vudpA2eBGCvrNw+bSYYuu+gmkMn1ocaGNIbZlqd97zUN8P5t9CjnJ3yaB1KS652Zp3RRuFSGpCwa49qEfQjR5Mn0wxBDLAe4nHvDRalnIiJkfW77dG3+tWZ29Yots7DrWtxi+SsdCGTrX+TFlU6LY8KZ0Ehm/Zheu8U7GOVGmpCHCRFZ+Xv0TwqP2QJo38aACEDsPbr3pAV0SGJU3A4l46meGRA0V0vXR5fx0GUryj4qq3n8xm9CE4MDwHygM02hHiXIFkt15+2Qhu3RVB8Pxai9oFs7VJbyGzX6Si2vRhJUgUVWapWptzJn3sTVWac9UwC3jHtuBfkRXCb+EhzSaExz1tv5WKapsN4xesAErfadWnSrBjndqFh9zMtPZtS8kSmYGMle4ga0MfmwXjQmQOJHBcd7AEFDXTnJSM5E0qcIQXo3WcPUlH7/6BaZlsuhoIBbS+9FHBQz64jVCIEdCmPCkwPvgbJIJZR+bJwnY4D/RF84Ug7RMrPpIOsg6+7MZAQRgJ4t+DfALBnPkFb6mK7vlQiLrSCcJRRUqgpRZk0kC9Z5VspK/5rP4FHac4bausvaxCL5GyjCMZcOgioN/vOKy+V4bj/jqfwiTPnXYN2kkWgvApGWE8GTwm8NqfglD902mOHerv8Ve8XQmYc9r4qv3Sqxo=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700021)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?s+GKFinJO2KzNzs7rr0ldjBrWLx2VNvqFkailmvAS90KHd19+3brLQFted?=
 =?iso-8859-1?Q?WlnlcbJVzj/G2rGUAtkvJdGwB/mVJaVNrkHYbEXABEhCpb365yCYVq6YQ8?=
 =?iso-8859-1?Q?AclKtAcuyh2vWIiAlQ7Me3MjNRSyScIWVDGkp5yZgDdQb+eyUnZj5rsdOI?=
 =?iso-8859-1?Q?/zUoted/Z8bikYS6iSA0xeOMkApwgkyJ2j7gYvk/09HTaUNgZKut5Polld?=
 =?iso-8859-1?Q?ExNOfBdpxROrFPJ62KTnxCOfC0dpbTlFBDuQGc4i4xw2o1UefnSoGQudZ3?=
 =?iso-8859-1?Q?WmeFV/92MUH2d/u8LOK7hhG9CYxUDHYCBCi5PqmiB23vfx3VbokqrD87iA?=
 =?iso-8859-1?Q?BlOQacbIz0r2VWH41smWVfGOKJV3tm41BMbRraGhSBjbJ4kooJ+wmjyNOe?=
 =?iso-8859-1?Q?EhWN5rsVdJ334YBoNnP3zJljpmjlhLqcMXe3PcYZWGf3B+mJIiZjB3qLkR?=
 =?iso-8859-1?Q?dPdiNGBNxq9Ij0abgbEVx2BhvVoxL9mfYkpUB8oPiF7if9VVcIE5qpYa6j?=
 =?iso-8859-1?Q?enRGQms3/8TpNYF9H6dt34VV5pmoPcg7LfEMjiHK2oxysTWQDWVA+zdC8Y?=
 =?iso-8859-1?Q?7lC6Dc8zQTPUFjULPis0jbSFUpPDNpvdxDFu0sPp+6yamXQsaIlz7ZdtH7?=
 =?iso-8859-1?Q?wnbX0GVcNkpVA2WpXL+4sTYpZePNcJWbBhpv/dkEWc9Dm6IPFmJsgG37pP?=
 =?iso-8859-1?Q?aYNnTjcC8o/i3tCNTLsmbkn3RdG406+JArDREeAiZRM9H9CaIUpGo82Cxe?=
 =?iso-8859-1?Q?x72XLGegrH9zofOEUsShArt4Wi31KRPQe40tdYlZvOHuIzysUG/t5CulPt?=
 =?iso-8859-1?Q?fwi/fkmQvJg4OZ3vDiM5CCBCpjr/mfCdgX7ulAzrc4xQxBt8yWA4UCgtTO?=
 =?iso-8859-1?Q?n/0CI/mFgvwjbbwblF5/lLYyzL3YX3oAQ9Z++Qtmj9czx9Ylh9kTLPr+FZ?=
 =?iso-8859-1?Q?op2NXSHrYx1TFxZBhfF6Op7ySqxOQADt5MfPCsrjRYvrKaB7te+Hf2KDdL?=
 =?iso-8859-1?Q?yRHIVoIbXL6IKAm6VZKlyclpypVo8B9AJZ0aCvkJfvxGmkWSVQJmlysuyv?=
 =?iso-8859-1?Q?8l5onsGZHuozb+MdO/qYW/kib2O77Msr8uv53JGelRVAjqD3SahwhdcGl9?=
 =?iso-8859-1?Q?XBg8PSaUvfuo8mg7UU+GSm2Jc5pwjFtrtI+X29xTkOM1xXVfnhFsinxM7m?=
 =?iso-8859-1?Q?ViPwOtcRbT2c4c0lqRqbS22sGENQWsymO3f37fm7ofXBVcH4rleYDylX0p?=
 =?iso-8859-1?Q?PDOlR2C5B09F6ADuelDy3OhgC0lF2RjtHI1AMK1itcJ3xfPX3/49It5ijj?=
 =?iso-8859-1?Q?U3xqcyUfyLPIjc99HezGWRAjtvIc5raoLX+iXxmBWrtx1nfwKxvy3s76bb?=
 =?iso-8859-1?Q?295QOZSBLuxGkZRRXf6TwjUdC3FWpzyj+EzWL+suIOUKXV9C1tiWa4sSCi?=
 =?iso-8859-1?Q?7Tfjhng/sKrUZLswP7chXfBLgDe4e/i2NveQRMrMRR+3isv26GxdmFzQjX?=
 =?iso-8859-1?Q?wuJSxgg5jYGrZcVA7X2zi/lJVD86MEmopJeEoIdN6ixeCBgjQhQDKkUXEP?=
 =?iso-8859-1?Q?s7N9LTi7a4330OIjWNnZ3nA6Smb/dvRoqYWwbTbLWh//WGWzU88Y6mF16P?=
 =?iso-8859-1?Q?NbpTmzJMapkcChZEdvYoqVrOg/kMsOV6dloFYgXa5jepeB0iFKhQac+iRE?=
 =?iso-8859-1?Q?Nf6p6J5Kraw486MbEJo1VJCx9j0+9ZjAJg1roqdPP7SKOD5ULEoxewfNkr?=
 =?iso-8859-1?Q?6wTL0inKRDliDbkkbJdWbcxWEZYPmIgAkltmsAN9+IckPB5eHOl4v8H7A9?=
 =?iso-8859-1?Q?/X+k3xeng4uhl5NmBF9FVS569el0UjM=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b5cc244-782b-4fa6-1d85-08de8e53d9ca
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Mar 2026 11:59:51.6847
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aqVUqB4LrCUeZfVqWuJjMdcPi2M9Kqbp20oQwQIizPoWYRAc7vcjWBl5SEnyHr6l9jKz+TIni9f00so3PyG4vA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR03MB8639
X-purgate-ID: tlsNG-33051d/1774871994-4885072C-57F18BA1/0/0
X-purgate-type: clean
X-purgate-size: 10644
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[epam.com,kernel.org,xen.org,arm.com,amd.com,citrix.com,vates.tech,suse.com,raptorengineering.com,wdc.com,gmail.com,apertussolutions.com];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Mykyta_Poturai@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:tpearson@raptorengineering.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:oleksii.kurochko@gmail.com,m:dpsmith@apertussolutions.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.991];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: B5BB635AB94
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SMT-disable enforcement check is moved into a separate
architecture-specific function.

For now this operations only support Arm64. For proper Arm32 support,
there needs to be a mechanism to free per-cpu page tables, allocated in
init_domheap_mappings. Also, hotplug is not supported if ITS enabled,
and partially supported FFA, or TEE is enabled, as they use non-static
IRQ actions.

Remove ifdef guards for x86 in flask, as cpu hotplug is now
supported on more architectures.

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>

---
v6->v7:
* use IS_ENABLED istead of ifdef in more places
* remove unneded variables
* more explicit fallthrough in do_sysctl

v5->v6:
* fix style issues
* rename arch_smt_cpu_disable -> arch_cpu_can_stay_online and invert the
logic
* use IS_ENABLED istead of ifdef
* remove explicit list af arch-specific SYSCTL_CPU_HOTPLUG_* options
from the common handler
* fix flask issue

v4->v5:
* move handling to common code
* rename config to CPU_HOTPUG
* merge with "smp: Move cpu_up/down helpers to common code"

v3->v4:
* don't reimplement cpu_up/down helpers
* add Kconfig option
* fixup formatting

v2->v3:
* no changes

v1->v2:
* remove SMT ops
* remove cpu =3D=3D 0 checks
* add XSM hooks
* only implement for 64bit Arm

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
 xen/arch/arm/smp.c             |  9 ++++++++
 xen/arch/ppc/stubs.c           |  4 ++++
 xen/arch/riscv/stubs.c         |  5 ++++
 xen/arch/x86/include/asm/smp.h |  3 ---
 xen/arch/x86/smp.c             | 36 +++--------------------------
 xen/arch/x86/sysctl.c          | 13 ++++-------
 xen/common/Kconfig             |  6 ++---
 xen/common/smp.c               | 35 ++++++++++++++++++++++++++++
 xen/common/sysctl.c            | 42 ++++++++++++++++++++++++++++++++++
 xen/include/xen/smp.h          |  4 ++++
 xen/xsm/flask/hooks.c          |  2 --
 11 files changed, 109 insertions(+), 50 deletions(-)

diff --git a/xen/arch/arm/smp.c b/xen/arch/arm/smp.c
index b372472188..0ea64d2ee1 100644
--- a/xen/arch/arm/smp.c
+++ b/xen/arch/arm/smp.c
@@ -44,6 +44,15 @@ void smp_send_call_function_mask(const cpumask_t *mask)
     }
 }
=20
+/*
+ * We currently don't support SMT on ARM so we don't need any special logi=
c for
+ * CPU disabling
+ */
+inline bool arch_cpu_can_stay_online(unsigned int cpu)
+{
+    return true;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/ppc/stubs.c b/xen/arch/ppc/stubs.c
index a333f06119..8f280ba080 100644
--- a/xen/arch/ppc/stubs.c
+++ b/xen/arch/ppc/stubs.c
@@ -101,6 +101,10 @@ void smp_send_call_function_mask(const cpumask_t *mask=
)
     BUG_ON("unimplemented");
 }
=20
+bool arch_cpu_can_stay_online(unsigned int cpu)
+{
+    BUG_ON("unimplemented");
+}
 /* irq.c */
=20
 void irq_ack_none(struct irq_desc *desc)
diff --git a/xen/arch/riscv/stubs.c b/xen/arch/riscv/stubs.c
index daadff0138..7c3cda7bc5 100644
--- a/xen/arch/riscv/stubs.c
+++ b/xen/arch/riscv/stubs.c
@@ -70,6 +70,11 @@ void smp_send_call_function_mask(const cpumask_t *mask)
     BUG_ON("unimplemented");
 }
=20
+bool arch_cpu_can_stay_online(unsigned int cpu)
+{
+    BUG_ON("unimplemented");
+}
+
 /* irq.c */
=20
 void irq_ack_none(struct irq_desc *desc)
diff --git a/xen/arch/x86/include/asm/smp.h b/xen/arch/x86/include/asm/smp.=
h
index 3f16e62696..cb3e0fed19 100644
--- a/xen/arch/x86/include/asm/smp.h
+++ b/xen/arch/x86/include/asm/smp.h
@@ -50,9 +50,6 @@ int cpu_add(uint32_t apic_id, uint32_t acpi_id, uint32_t =
pxm);
=20
 void __stop_this_cpu(void);
=20
-long cf_check cpu_up_helper(void *data);
-long cf_check cpu_down_helper(void *data);
-
 long cf_check core_parking_helper(void *data);
 bool core_parking_remove(unsigned int cpu);
 uint32_t get_cur_idle_nums(void);
diff --git a/xen/arch/x86/smp.c b/xen/arch/x86/smp.c
index a49505fb57..b781e933f2 100644
--- a/xen/arch/x86/smp.c
+++ b/xen/arch/x86/smp.c
@@ -418,38 +418,8 @@ void cf_check call_function_interrupt(void)
     smp_call_function_interrupt();
 }
=20
-#ifdef CONFIG_CPU_HOTPLUG
-long cf_check cpu_up_helper(void *data)
+bool arch_cpu_can_stay_online(unsigned int cpu)
 {
-    unsigned int cpu =3D (unsigned long)data;
-    int ret =3D cpu_up(cpu);
-
-    /* Have one more go on EBUSY. */
-    if ( ret =3D=3D -EBUSY )
-        ret =3D cpu_up(cpu);
-
-    if ( !ret && !opt_smt &&
-         cpu_data[cpu].compute_unit_id =3D=3D INVALID_CUID &&
-         cpumask_weight(per_cpu(cpu_sibling_mask, cpu)) > 1 )
-    {
-        ret =3D cpu_down_helper(data);
-        if ( ret )
-            printk("Could not re-offline CPU%u (%d)\n", cpu, ret);
-        else
-            ret =3D -EPERM;
-    }
-
-    return ret;
-}
-
-long cf_check cpu_down_helper(void *data)
-{
-    int cpu =3D (unsigned long)data;
-    int ret =3D cpu_down(cpu);
-
-    /* Have one more go on EBUSY. */
-    if ( ret =3D=3D -EBUSY )
-        ret =3D cpu_down(cpu);
-    return ret;
+    return opt_smt || cpu_data[cpu].compute_unit_id !=3D INVALID_CUID ||
+           cpumask_weight(per_cpu(cpu_sibling_mask, cpu)) <=3D 1;
 }
-#endif
diff --git a/xen/arch/x86/sysctl.c b/xen/arch/x86/sysctl.c
index bdad44fef1..072726debc 100644
--- a/xen/arch/x86/sysctl.c
+++ b/xen/arch/x86/sysctl.c
@@ -120,7 +120,6 @@ long arch_do_sysctl(
=20
     case XEN_SYSCTL_cpu_hotplug:
     {
-        unsigned int cpu =3D sysctl->u.cpu_hotplug.cpu;
         unsigned int op  =3D sysctl->u.cpu_hotplug.op;
         bool plug;
         long (*fn)(void *data);
@@ -128,6 +127,7 @@ long arch_do_sysctl(
=20
         if ( !IS_ENABLED(CONFIG_CPU_HOTPLUG) )
         {
+            ASSERT_UNREACHABLE();
             ret =3D -EOPNOTSUPP;
             break;
         }
@@ -135,15 +135,10 @@ long arch_do_sysctl(
         switch ( op )
         {
         case XEN_SYSCTL_CPU_HOTPLUG_ONLINE:
-            plug =3D true;
-            fn =3D cpu_up_helper;
-            hcpu =3D _p(cpu);
-            break;
-
         case XEN_SYSCTL_CPU_HOTPLUG_OFFLINE:
-            plug =3D false;
-            fn =3D cpu_down_helper;
-            hcpu =3D _p(cpu);
+            /* Handled by common code */
+            ASSERT_UNREACHABLE();
+            ret =3D -EOPNOTSUPP;
             break;
=20
         case XEN_SYSCTL_CPU_HOTPLUG_SMT_ENABLE:
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 0e5b4738a8..9e26217404 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -638,9 +638,9 @@ config SYSTEM_SUSPEND
 	  If unsure, say N.
=20
 config CPU_HOTPLUG
-	bool "CPU online/offline support"
-	depends on X86
-	default y
+	bool "CPU online/offline support" if EXPERT || X86
+	depends on X86 || (ARM_64 && !HAS_ITS)
+	default y if X86
 	help
 	  Enable support for bringing CPUs online and offline at runtime. On
 	  X86 this is required for disabling SMT.
diff --git a/xen/common/smp.c b/xen/common/smp.c
index a011f541f1..e2bf82856e 100644
--- a/xen/common/smp.c
+++ b/xen/common/smp.c
@@ -16,6 +16,7 @@
  * GNU General Public License for more details.
  */
=20
+#include <xen/cpu.h>
 #include <asm/hardirq.h>
 #include <asm/processor.h>
 #include <xen/spinlock.h>
@@ -104,6 +105,40 @@ void smp_call_function_interrupt(void)
     irq_exit();
 }
=20
+#ifdef CONFIG_CPU_HOTPLUG
+long cf_check cpu_up_helper(void *data)
+{
+    unsigned int cpu =3D (unsigned long)data;
+    int ret =3D cpu_up(cpu);
+
+    /* Have one more go on EBUSY. */
+    if ( ret =3D=3D -EBUSY )
+        ret =3D cpu_up(cpu);
+
+    if ( !ret && !arch_cpu_can_stay_online(cpu) )
+    {
+        ret =3D cpu_down_helper(data);
+        if ( ret )
+            printk("Could not re-offline CPU%u (%d)\n", cpu, ret);
+        else
+            ret =3D -EPERM;
+    }
+
+    return ret;
+}
+
+long cf_check cpu_down_helper(void *data)
+{
+    unsigned int cpu =3D (unsigned long)data;
+    int ret =3D cpu_down(cpu);
+
+    /* Have one more go on EBUSY. */
+    if ( ret =3D=3D -EBUSY )
+        ret =3D cpu_down(cpu);
+    return ret;
+}
+#endif /* CONFIG_CPU_HOTPLUG */
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/common/sysctl.c b/xen/common/sysctl.c
index 5207664252..da95446039 100644
--- a/xen/common/sysctl.c
+++ b/xen/common/sysctl.c
@@ -483,6 +483,48 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_=
sysctl)
             copyback =3D 1;
         break;
=20
+    case XEN_SYSCTL_cpu_hotplug:
+    {
+        unsigned int hp_op =3D op->u.cpu_hotplug.op;
+        bool plug;
+        long (*fn)(void *data);
+        void *hcpu =3D _p(op->u.cpu_hotplug.cpu);
+
+        ret =3D -EOPNOTSUPP;
+        if ( !IS_ENABLED(CONFIG_CPU_HOTPLUG) )
+            break;
+
+        switch ( hp_op )
+        {
+        case XEN_SYSCTL_CPU_HOTPLUG_ONLINE:
+            plug =3D true;
+            fn =3D cpu_up_helper;
+            break;
+
+        case XEN_SYSCTL_CPU_HOTPLUG_OFFLINE:
+            plug =3D false;
+            fn =3D cpu_down_helper;
+            break;
+
+        default:
+            fn =3D NULL;
+            break;
+        }
+
+        if ( fn )
+        {
+            ret =3D plug ? xsm_resource_plug_core(XSM_HOOK)
+                       : xsm_resource_unplug_core(XSM_HOOK);
+
+            if ( !ret )
+                ret =3D continue_hypercall_on_cpu(0, fn, hcpu);
+
+            break;
+        }
+    }
+
+        /* Use the arch handler for cases not handled here */
+        fallthrough;
     default:
         ret =3D arch_do_sysctl(op, u_sysctl);
         copyback =3D 0;
diff --git a/xen/include/xen/smp.h b/xen/include/xen/smp.h
index 2ca9ff1bfc..04530738c9 100644
--- a/xen/include/xen/smp.h
+++ b/xen/include/xen/smp.h
@@ -76,4 +76,8 @@ extern void *stack_base[NR_CPUS];
 void initialize_cpu_data(unsigned int cpu);
 int setup_cpu_root_pgt(unsigned int cpu);
=20
+bool arch_cpu_can_stay_online(unsigned int cpu);
+long cf_check cpu_up_helper(void *data);
+long cf_check cpu_down_helper(void *data);
+
 #endif /* __XEN_SMP_H__ */
diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
index b250b27065..01f9d50605 100644
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -835,9 +835,7 @@ static int cf_check flask_sysctl(int cmd)
     case XEN_SYSCTL_getdomaininfolist:
     case XEN_SYSCTL_page_offline_op:
     case XEN_SYSCTL_scheduler_op:
-#ifdef CONFIG_X86
     case XEN_SYSCTL_cpu_hotplug:
-#endif
         return 0;
=20
     case XEN_SYSCTL_tbuf_op:
--=20
2.51.2

