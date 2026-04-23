Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +A2DJspE6mkhxgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2026 18:11:54 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C1C9454B71
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2026 18:11:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1292400.1570878 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFweZ-0000Ka-LP; Thu, 23 Apr 2026 16:11:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1292400.1570878; Thu, 23 Apr 2026 16:11:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFweZ-0000Fq-Fo; Thu, 23 Apr 2026 16:11:47 +0000
Received: by outflank-mailman (input) for mailman id 1292400;
 Thu, 23 Apr 2026 16:11:46 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Oleksii_Moisieiev@epam.com>) id 1wFweY-0000D5-Au
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2026 16:11:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFweX-004X3T-Nq
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2026 18:11:45 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 69ea44be-5cb7-0a2a0a5109dd-0a2a450bafd8-12
 for <xen-devel@lists.xenproject.org>; Thu, 23 Apr 2026 18:11:45 +0200
Received: from [40.107.159.119]
 (helo=OSPPR02CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 69ea44bf-212f-0a2a450b0019-286b9f772e5a-4
 for <xen-devel@lists.xenproject.org>; Thu, 23 Apr 2026 18:11:45 +0200
Received: from DU5PR03MB10263.eurprd03.prod.outlook.com (2603:10a6:10:519::5)
 by PA4PR03MB6752.eurprd03.prod.outlook.com (2603:10a6:102:ea::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.21; Thu, 23 Apr
 2026 16:11:41 +0000
Received: from DU5PR03MB10263.eurprd03.prod.outlook.com
 ([fe80::8c9e:b301:61c0:3908]) by DU5PR03MB10263.eurprd03.prod.outlook.com
 ([fe80::8c9e:b301:61c0:3908%5]) with mapi id 15.20.9846.021; Thu, 23 Apr 2026
 16:11:41 +0000
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
 b=ySiJqrFt3mUe8QGpemROgPJqzREyMdhx2hzmuUbPWi4DrrV1mKOdREChiDvejVo4c1ZTLEBb0+ZZS/vDHgsNahYp8OGSa9yDyu1J9aSn+ru9+q7KK34qbTPenXTovIljm5NeYks0j5eHGVmzHpQWkvYhRVz8/Th2rBtu9dXHZ9VLEMZkVrTiTwtfOedCaOa+L2KBqeqh6t6URyuI/kCkWn25nU1NyOkYCWaKpTv0kuU8mjUsNovsPzIz4W8I+jslXdqYwT4rg7LuOS1WDA8dbgbF7PI19WC7nCbyvDQmSqc3L2JZ6drt4t4MBniIKrnM7cwh7sOrNXyneZfUn0GWgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8XFlwxcfYZJh/uiCumI4nsPxB8Lb0/HADTO3tOS7JAA=;
 b=ew9X2biMpn/9tI6QcFwVhShF9GNedAA1ojjhrVVEbp7LwquSb0udP+s9rKJS/ocLoXGcnlvIPLa7vjeOTQsRJ6WfWqZyBx9c8Oh2pxNsjm9HVtAdxwbpM0skyvyYX2SDeD5ijE4cCR9MGlDLGSWpSpYZEVSoCfCcVBqaTKErTnbsOKP2QRZJf5zhwAqBB5CZ/DEWELxbyF0QiE7xWZtn4k/5DZcguu0kKBlJGdf3g1jGThlczdQEWLhmQc8oOPBdryBm51J9CnSWL/kCWVBxcoNiSfq9x8aR41kD9C++/lpx/6KnQNMn+AtqwQpYeF6HmRktwKLnkm0S16tk10sdWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8XFlwxcfYZJh/uiCumI4nsPxB8Lb0/HADTO3tOS7JAA=;
 b=jkT2csH9lUH45wCurczWDd/HfdnPel5e8WBfF+iu5Ofu8P1upV1AWP7Bjhsyp2G0MaRZfGl+0Hx4Sawpx3S+/3Y1k8O4MyBGhZhk3Ph+PAkVhy5ax9XfaG9jRVwdHmLyQa9sPGLaHE6Mfi3qSVZJO1W8nJtKVu+XH7Z/jlZnTOc2k35hTO8wfVfB6Bm5mWB/unawvy6hXnCALFQo9nYMrtb1wyXd5N+QqOc8EahLfPTLf02WhW8s7fRJdCEQc/0ZjzimTmzL7EokTkMpE4Ybb2WmAbPpUE9roJpcs1XVvMrfvA/VWK5MIh366OQh+1CUmP+PE/uofKEcNmN0Zj4xxQ==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Bertrand Marquis <bertrand.marquis@arm.com>, Julien Grall
	<julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
Subject: [PATCH v4 1/4] xen/drivers/char: fix SCIF IRQ registration failure
 propagation
Thread-Topic: [PATCH v4 1/4] xen/drivers/char: fix SCIF IRQ registration
 failure propagation
Thread-Index: AQHc0zvf/bLY5rMgLEeCO+A68ZSaAw==
Date: Thu, 23 Apr 2026 16:11:41 +0000
Message-ID:
 <0d39b0fc5ea8351e660b716cd55da2e677538b09.1776960679.git.oleksii_moisieiev@epam.com>
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
x-ms-office365-filtering-correlation-id: 41ec653e-e4d1-4ea1-7d66-08dea153019e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|18002099003|38070700021|56012099003|22082099003;
x-microsoft-antispam-message-info:
 NJFWg7eMr9kO4n3/I9Hl1hHOwHN+cbyFhTRcUa8NuFKh7ZxpfjEWMerJXlBnvFDc5iY1aoo0A2p+aRKgSbYkAbkCwT6FNOEubtg2lJi51YSQhJd0x5zOXBNJ5qM6c/BKiHJGFg5uoIaXNCgwqu6ohceGR1AaMNtp6gp45+VRhLH+06Et2qP8V/dpYVtKT+gk9GM3sX9yZFz5UkOXX5OK2BarLmWhhYXhBI9tYRepBT9Q4tm6jvzFdPes2fBs3PXukDPa6JPJYFA1G3bjTfhG1Tj5b0SBLxHmykjuOnBpUMv1Wgaqu5i8q+GRUYKaJHDUsib3CUyk4Wl26wTtaDwzM/QpCBAPr8dscUBs8EmUPcTusiqIOhcFlbdnwHQv/Xky/6OnLuFKBF6t31D7YsXHK/RtGSiVIr7fo8iRFojthqs6YoOUyC/fb0lBX4K6Ntba8wf8xK008ELoq6THGJlGWfpQ7k2UNJ0JYfyP70f0s5qqU16CYPNUnnXhzriQYf8u5ETqFPTOATwMOpoGd8yRZELCvMgQwvDSeHWyK2LAG8Xvz+R+rAUWGzDNaTJTBCTAY31p+Y3d3BXDebj6dBnwyTDFi5ca4Ow8570157EqD2etCK1UT0t1/fuSruhpeWA4cA5Yh3folHuOamYaCMl/MvlavsU5SejYUXGxW+CaiKtF4G2M+VHAhrZL9KAVDTBQg214odpV8XveN5qoKh35B+G0roCy4WY+BEh7StwENuAUF0WK3O8Cu3j0WIMJzuTIXR+/rtSb5av8HkAnpwCnrb/9rI3O7kvPdUr1YR2kZsY=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU5PR03MB10263.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(38070700021)(56012099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?m5RQ1ygqWDEIlkf9mnU4dMl1wI60e0Cpcz20aE8tBZcVXQTCIIlRyQzR6t?=
 =?iso-8859-1?Q?Q7kJsJNmSb5OaA6VwJFIdsv0wFNFvG0jjzrTA4GZY6LAFg79/eyA7a3sC5?=
 =?iso-8859-1?Q?BoSJNEKhUuoxw0ALrGvij/03VL5J/leyHu71Y6wSe2tZcemPV3LZDhtMP6?=
 =?iso-8859-1?Q?53VefnRV3CZm/fhL938jokjWqRUlhVdcL5pI1a+t/PpoPTrir1Nb6zA0+n?=
 =?iso-8859-1?Q?FjoYrYPnCY7My1YKacAwh69VyZ2nOuzwLBbFHd4tzm1yrNc8rhvrHs8b8S?=
 =?iso-8859-1?Q?j0OHedVsA1YtDO7hqpjCsOBr4QB7RGrmaj0+XhqE2rHOUsszDmBzn4/rDj?=
 =?iso-8859-1?Q?hXIJyRUgw5kJzDmS+YT6Ughh36ZzsZXdegKc0uYnEJ5FZ38wAMMqlsGo2i?=
 =?iso-8859-1?Q?uU7gNbtdJx23H5HGKOlwdo4RhUKOR2//BATSTk4ArVGjSvkCRf4a4zEyiJ?=
 =?iso-8859-1?Q?tX7tDIv2AXwo0eD/eaIFclVWU8Q0WOgTFOLgyf8LS7qj+W5z2O7R5mYQo/?=
 =?iso-8859-1?Q?yBjcPBZWFwxKsd2ch/rnKh+lDrze+dL+uD3fAXZ2Ch0i0x0mj1SdJk45WP?=
 =?iso-8859-1?Q?BRS+aRq1LI4FaANeudBgiPNhLX0icMpMaprIK4xlstMKRlzgRujPQQHnkM?=
 =?iso-8859-1?Q?tTa3JdfG01ve1e1phQJWPRzgz/6cEw38bssS6R/kI/NvIMcuvGmmPGMCfp?=
 =?iso-8859-1?Q?FzTVXCCVcQpdYwrHSY6qDpTYz8yIsnIotZCagYtwQYsfElQwsAcGLzDb4E?=
 =?iso-8859-1?Q?LuLXhKkFNIRIDGTt8KWbh5I+jOqgJS9qdExgHta4JNy/2tm1Vx6k6oJ8o9?=
 =?iso-8859-1?Q?clnU3pd1kyU35IrUT2uxRtYWJG7TkluSS0tg6pXyHtzQzoZGW+0polevuI?=
 =?iso-8859-1?Q?LPqfXuNs7GxfyL5xOxn4sIPEzv3SdDZS8R1iVHzXd8Bt1mwaFBL1lbsFea?=
 =?iso-8859-1?Q?50k0o+DrwKeKqGMRxPc/sA/No5Wv8uykpPBvDrzbbbGW3mQTaE4EqTpuiS?=
 =?iso-8859-1?Q?FL8kQK0B1R3q6W4w3b9ChmMDHattcZ3q+W70dipsF7n3GhhNHUuRLQnd5J?=
 =?iso-8859-1?Q?Gzem9BaLLmR8lgNIk3yjauVJHVS9tevTF/Grm2EyR4tNG4F9JSTYCtyeLd?=
 =?iso-8859-1?Q?6fDPUjHXehwio03S2yLY9WJpDnimnIM1veq76hooFC5+bFhU3K2XYFX2it?=
 =?iso-8859-1?Q?bDmrdBor1JfsmSNlcL0uGvmrE8U39e8mubzMb2WD97d61I4ckvMl5j+0Gs?=
 =?iso-8859-1?Q?I61I5+w5Evgi/DjmlJ4hY/keK/enTlF4hAbLmTGsJZYGU1KpC9FZ9ZMmJt?=
 =?iso-8859-1?Q?66FcluG3WZC85JI1veSCxlBkvhwh5LQOu0gUa5XSIH/iDfyLgPgZA+wsGt?=
 =?iso-8859-1?Q?8c+MCixJnTDeBpJkJyd4hpw05dinUpSid/mYeDYV31KbA5wqq0vdDPRT9+?=
 =?iso-8859-1?Q?xL+SiR4zkQNxfdF1Lkg9hcGaViU63Lei95HCIjhrwhkzSh/GcDQxfSnv9v?=
 =?iso-8859-1?Q?eWZaQ11MsawxbcBCvXIV3LK1+gNdO4LQxVGP5VpMMHSpH5YH9NxynIAzxY?=
 =?iso-8859-1?Q?4PR01mIXpodqSGNuxFIgyzEGBrlOtox+EhAynC12Zl5RiYWfevQ2EGCsXG?=
 =?iso-8859-1?Q?oF/8Ub/DiTYc+Lr5qqfjw+fpA8a3iltenKtkHI+JvWkC7DHrNZistD8hpX?=
 =?iso-8859-1?Q?XKSL8JAgctv4jRjGNig9KnFkQhhIxgh+1HCSv9QRjAudM3jC+zjzFYNQSc?=
 =?iso-8859-1?Q?Bvv6IwrlfcaJOvaia1poWJJwfqjmhTqTR4VRoCdZIv7bWegsaOr4tgs+4i?=
 =?iso-8859-1?Q?TQAvw4BJ8Q2b2t0m3fpDpykkKYenVIs=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU5PR03MB10263.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41ec653e-e4d1-4ea1-7d66-08dea153019e
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Apr 2026 16:11:41.4272
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0J8Rc+1ri7W8MxDXAN/dMcHe5M3c6aZ8/XWRDXG5jdMvF66n3rxMPVxTXeTQb7KjH7KIz447Eae9eFqL4bNUomnBGHU3CvvSXndtlqLFVO8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB6752
X-purgate-ID: tlsNG-42698a/1776960705-7D364F3B-5D38FF89/0/0
X-purgate-type: clean
X-purgate-size: 3024
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:email,epam.com:email,epam.com:dkim,epam.com:mid];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[Oleksii_Moisieiev@epam.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:bertrand.marquis@arm.com,m:julien@xen.org,m:michal.orzel@amd.com,m:sstabellini@kernel.org,m:Volodymyr_Babchuk@epam.com,m:Oleksii_Moisieiev@epam.com,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 2C1C9454B71
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In scif_uart_init_postirq(), when setup_irq() returns an error the
failure was only logged via dprintk() and execution continued,
unconditionally writing TIE|RIE|REIE into the Serial Control Register
(SCSCR). This armed all three hardware interrupt lines (TX FIFO empty,
RX data ready, receive error) with no handler registered to service
them. On platforms where the GIC receives these asserted lines, the
result is either repeated spurious-interrupt warnings or an unhandled
interrupt fault.

The fix adds an early return inside the error branch. The
interrupt-enable write to SCSCR is skipped entirely when no handler is
registered.

SCIF TX continues to operate correctly after this change. The Xen
serial framework never calls serial_async_transmit() for SCIF, so
port->txbuf is always NULL. This causes __serial_putc() to take the
synchronous finite-capacity path, which polls the SCFSR_TDFE hardware
flag directly and does not depend on the interrupt mechanism. RX
wouldn't work if irq wasn't registered.

As a secondary clean-up, the hardware error-flag clearing sequence is
moved to before the setup_irq() call so that error bits accumulated
since init_preirq() are cleared unconditionally, regardless of whether
IRQ registration succeeds.

Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
---

Changes in v4:
- update comment for setup_irq
- add R-b
- change %d to %u in printk since irq is unsigned

Changes in v2:
- Extend fix to pl011, cadence-uart and exynos4210
- fix typo in patch 1 description

 xen/drivers/char/scif-uart.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/xen/drivers/char/scif-uart.c b/xen/drivers/char/scif-uart.c
index 888821a3b8..350d5f14b9 100644
--- a/xen/drivers/char/scif-uart.c
+++ b/xen/drivers/char/scif-uart.c
@@ -187,16 +187,20 @@ static void __init scif_uart_init_postirq(struct seri=
al_port *port)
     uart->irqaction.name    =3D "scif_uart";
     uart->irqaction.dev_id  =3D port;
=20
-    if ( (rc =3D setup_irq(uart->irq, 0, &uart->irqaction)) !=3D 0 )
-        dprintk(XENLOG_ERR, "Failed to allocated scif_uart IRQ %d\n",
-                uart->irq);
-
     /* Clear all errors */
     if ( scif_readw(uart, params->status_reg) & params->error_mask )
         scif_writew(uart, params->status_reg, ~params->error_mask);
     if ( scif_readw(uart, params->overrun_reg) & params->overrun_mask )
         scif_writew(uart, params->overrun_reg, ~params->overrun_mask);
=20
+    if ( (rc =3D setup_irq(uart->irq, 0, &uart->irqaction)) !=3D 0 )
+    {
+        dprintk(XENLOG_ERR, "Failed to allocated scif_uart IRQ %u\n",
+                uart->irq);
+        /* Do not unmask interrupts if irq handler wasn't set */
+        return;
+    }
+
     /* Enable TX/RX and Error Interrupts  */
     scif_writew(uart, SCIF_SCSCR, scif_readw(uart, SCIF_SCSCR) |
                 params->irq_flags);
--=20
2.43.0

