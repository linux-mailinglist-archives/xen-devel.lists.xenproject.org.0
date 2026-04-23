Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ODkRD81E6mkhxgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2026 18:11:57 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5843454B7F
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2026 18:11:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1292401.1570890 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFweb-0000k4-1P; Thu, 23 Apr 2026 16:11:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1292401.1570890; Thu, 23 Apr 2026 16:11:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFwea-0000gS-Sf; Thu, 23 Apr 2026 16:11:48 +0000
Received: by outflank-mailman (input) for mailman id 1292401;
 Thu, 23 Apr 2026 16:11:46 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Oleksii_Moisieiev@epam.com>) id 1wFweY-0000D9-KD
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2026 16:11:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFweY-004X3T-11
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2026 18:11:46 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 69ea44be-5cb7-0a2a0a5109dd-0a2a450bafd8-14
 for <xen-devel@lists.xenproject.org>; Thu, 23 Apr 2026 18:11:46 +0200
Received: from [40.107.159.119]
 (helo=OSPPR02CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 69ea44bf-212f-0a2a450b0019-286b9f772e5a-5
 for <xen-devel@lists.xenproject.org>; Thu, 23 Apr 2026 18:11:45 +0200
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
 b=G2H4HdNfquR99Q4SsTiDtuUd725CnHJ1llXPeZCujd68wb0SvIijOD5Pjphsp5HuPQbjPpB/rI7a3yYDI69IAJmEOclGOuyhh18vz0jE0JZqPePFeef0OpCIyCwNFGVTwB6CGHa+mQw9FgrdMev4REAUYhyTbrzf6Gr/Rl6ORD51iIdvNx7IX0ritqkJlRDudiNsNWurjzdcwdVetEGsrvf7pkQBHvNHRVutcO0a6IIk4blu6Ks1VdknHm2IEYDmACya6rbl+GTimmJSqZxUHHGnjuqn5s0Y8oZ+4otWEC9X0koNBUMblrMZ3RBZ+Vkreyh3VGoRJDdMgaeVRLpL2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hwLaTMy1vY8qP6h9+hcCU5LH4m+dOUrZTarK3BrxX1w=;
 b=LFXCSpFePUD/ohX6jZZQ8SRt6YF6nece0+GBpghLi3QFnOVTXYPaGWWihxtwg5fmF/j6IJFz1e0N19izTMKFTXUNBcwSRoT54CduZ5RBbrPmGmO7AsQvklt2oWJojb68Y7ygq01GOiqdOxzt7Q/HMd+YZ77tiMd9nYMg5+bTPOEC/tZBY4r9ht7lEEB0CoybhkhNJulNX5VdcckRoGRVliRjCmCN5IgtLZtWzgHpLSDxNfYF1KKz2Uq9YTXiDAEsTyg6dTAIlAzAcmAnEmm6tXokA4aCgnKoJEeHpCXp2KBwGzGpL53fgTLSPhT36bAl2IP4O0TEZUF56DuIjn+ImA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hwLaTMy1vY8qP6h9+hcCU5LH4m+dOUrZTarK3BrxX1w=;
 b=M2hiLI07lsdQ6DeREGtirNKT4/3FwVaOSCFgtesrJCrAqbImotKbNvnEffZetXhYM05TnHYILBXWPkPnTrbxmaPL1FaECaOs/+bg5YCHXvv+/kXMtUh7fC75uQ1tY/DUmw69f0MwI2OyAMmVgdSNaFfcjkBW3J+FIkZtM8enKiTuz1GIAO3MUM2EWTpKepPRy3qixItiEwGD0UujljqiwcIKBB/33uda1rHDrTGPiDf1CHZZRhrZTfxh/SiBOC1wr29mOFmj7YVZy2c3vZAhHdRCoyXF4jzfcUerLHiLXkc1CDdL6cWVXuJIrH5IpYDk/81Jx7tFp02P41+1ESqTKA==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Bertrand Marquis <bertrand.marquis@arm.com>, Julien Grall
	<julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
Subject: [PATCH v4 2/4] xen/drivers/char/pl011: fix IRQ registration failure
 propagation
Thread-Topic: [PATCH v4 2/4] xen/drivers/char/pl011: fix IRQ registration
 failure propagation
Thread-Index: AQHc0zvfp867h1iE6UiP0oRgFR3PCw==
Date: Thu, 23 Apr 2026 16:11:41 +0000
Message-ID:
 <7a3d7e4b73ca1c144ce7687b8494f2a0eb862383.1776960679.git.oleksii_moisieiev@epam.com>
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
x-ms-office365-filtering-correlation-id: 11a4c04b-3f44-4545-e675-08dea15301f1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|18002099003|38070700021|56012099003|22082099003;
x-microsoft-antispam-message-info:
 3AMt3qtGqnJsT4Zepe+VBbSAIKYQyfJorTiAkOfCeyEMD/xavRgWF5i3gRipIxHMq/axl6Js7xQrL7jQhGSCdLqen6hJNjYUUw9Kly+LSj8BZ8voOF6SChnay1kmtpSx/pbV4H3mC/fbC+2l8Th9BZJMQRaQ13mnxm7gONX6VTU6BGNEUgr93YT69oWQUlJIylxJDuH4cEC6yYX8MMmh0dGNYKyLEDImOmDVjVY1ZOgpAshcPsozE8sHPy9dE0V4q4jA5OWR0CW0SAOtBvx0CAcHgRm7LyyK6PVwfYuH/KdH/ANTTKfPvwVmoSlkaFnL0wq4dIH7EiiQPC5ZmoT1+TvBpePNnxP1m3S2XPJJOORV15s3lWEhQPIaxwS599rXkT/ZVhm8Stum60RcevABsPAum/8U/+p4ipgM1v6WUbHjh7raoNolIVojyE+ZZ1zV4UxVlpdxWguHmlXJwrnZDbdCOk9IPa0ojnSfuhw+kOJEMZqyLSSXka8a8TdNcjysmUPUKjrNIbnGeF/gD7EVBlWUsPsPLRgYmb3K8KuLgxcjGMs8ge9meQu24YSm73bm/Gjf0PrJlsDM+xq91PlGFN92uOdEIdzs4azDk/yNRTX64YVUnj/gXkr7VmSbiOl/OSoPcOzZ4GfRpsOEH6gBX3o5EOKfx0o7ddTZfy9DNWQAD7xEBZfioZU8GnjO1ZcnrDM+azxejSx9bC1vSJ0PNu1zZL9ddyXvSERyKFpgenU6DjS9RsohU3SvBXc9xsGGtiGfujC0BoPj6JcXCCQuRUiryvQghqm+tusgmdEFmZc=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU5PR03MB10263.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(38070700021)(56012099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?ddY3dRJUE/dYBmHlsOmZ0JDfSmMAitK4EEpH/qEeyPm02B//bJIzWd6G/g?=
 =?iso-8859-1?Q?3uu0d7ODr7wUeGO8KgJj9wu1eNDs631rxEgkyio360B9PdIoBnBnVANylx?=
 =?iso-8859-1?Q?MsTx2GwCM/RsYlZRNWUhDebZ9lSZewii6PVaT5xw5IHKKAthHHPRrcApxN?=
 =?iso-8859-1?Q?sHrLv19JKc6zalmcfewqstQARFRHt7ALpl6zBkjSIbZp8uIPiA+0c5IZfZ?=
 =?iso-8859-1?Q?u9T3lysZ96WyR27+qGSownAb4E8aQgC8ZITs7cKwbhqiCtY7xKuIlRU/15?=
 =?iso-8859-1?Q?H2wSuIjeuZXknmmwzkkzl1fuk+daEq9rVULlI9UtLmXSTkCx8rJbFMAYCd?=
 =?iso-8859-1?Q?Ir349MaKHVg6R2WVgr8stSLIDMEJCBFYoN1PeyqM6HXMVa5085Q4S/rDrk?=
 =?iso-8859-1?Q?Mc5X98+6UBTJ+Xy2QvKG8VSYyeMbHIBsqGddIBQ+pNn5BCO5qakTNKhEMJ?=
 =?iso-8859-1?Q?yVy/QxjivO27cnn27PgGHbDELpLAH2O5G23FkVLBLvBH0vw5BotJk5XJoG?=
 =?iso-8859-1?Q?EXB4ZGUiTWo1aCUXvz76zoJAOehLNlYLxE06pNkG00X3ZgPrh80Gl2sFQ9?=
 =?iso-8859-1?Q?IwDKhUOkwDWdjw57In/j+N4igUH3Rug836rucX1wqngen+iKJcNHiUkams?=
 =?iso-8859-1?Q?IHu3DxrwGdGH1OdyrhB5LZDUtNVZJsL2E6zYiWMfARFkK/Ts54eA/9xhpG?=
 =?iso-8859-1?Q?y8BvwedQJQ/vXhR1F0Hp+kvHPd+4DWki0IErXJKdZlNHICKiMcmagnBE5z?=
 =?iso-8859-1?Q?qOLv84yKJm7R3PEnUhgh7pcpMcpcLqWrUU2AiXqmpC9KjWJOYBid1IbNSi?=
 =?iso-8859-1?Q?w2iOnrfLdQAVBSby3So4Be9PAe/GyEJ45UqlxQ7inLqafpkaH9j+c9EaW/?=
 =?iso-8859-1?Q?BnNLoZkxXYlqKalA/gduBZlVMcxzJcr4R9HwNLqO/pnOjnEVH83bKg/69W?=
 =?iso-8859-1?Q?H8Yi0t7u0Px1MZpqCKvO/zSX3c8My+gC4aQ8Dlo320S17LBJVKBPcRxj/7?=
 =?iso-8859-1?Q?AhpFn0eNZG6gapgS8vdfixgKMeayrmtD8wV2rYLkyIohlUY33i1DiXMcpM?=
 =?iso-8859-1?Q?Dx6txytlNttf0lzS4TXbTVpdS+hZXX64S7fj3s8+lWQBdKQq5RST/oIya9?=
 =?iso-8859-1?Q?YTH7VAZR0j/JQ/12sGn6gjPjF1ivZqMBSaAe6s+1G2Bs6KFmwNECLs9qKk?=
 =?iso-8859-1?Q?ICWLO/vzJEu1+5FEo8kQHzJjP6bnooYgExLC43U5m9Fysz3G25UazA8XHr?=
 =?iso-8859-1?Q?SUqg5gj+pOfo6UXCqnzFjIXFWQOqIkR5+xRtS1jv7EpU8eONSHtD/5e5si?=
 =?iso-8859-1?Q?PndvrBgJMNudDqac3K9ZQLevXD9nZ4zmT9ZCzLW6d4MEwbOdMAQy0rQvaC?=
 =?iso-8859-1?Q?bm8n4qlv5/XJaKHg0vn5QX2orVtJk6msdbUenu2Fza2qXlJdUtm4RLn0vx?=
 =?iso-8859-1?Q?A56D+XqUJIuyZOMJHEiVpdgFMulMP2Wk92fI8Q6zbUPkbDr/Jo34x116cP?=
 =?iso-8859-1?Q?ACqf5oPVYXQ9ArV1mMinojvuax1o+vF0RlrS5p+bND49hjA5wiUfWCN3kw?=
 =?iso-8859-1?Q?YYvmNOZuZwtNUfzvUOSSXflLZHsI6+ppe4yacuqjDRAUVWzCA08SLGHvgn?=
 =?iso-8859-1?Q?QvWUncP82peKM/J4HvnBRAjZD6vmSoUhFOG8KXMYvoUp/MMXqyKU5lniH0?=
 =?iso-8859-1?Q?DlPq6n0FNIM+gQmoXYWP8WxJTuFmkJuEGDrUb6DKAyBFe3l5NVIrICEvsm?=
 =?iso-8859-1?Q?j+sX2u6BjUEF0UNaEIUBOakdf4bI4zA3WmLrO3MWQ63FPB0XK0dvrD7TMS?=
 =?iso-8859-1?Q?lbVOTQ9vrh6ccT9BMDXiHMlxrSfeF3k=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU5PR03MB10263.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11a4c04b-3f44-4545-e675-08dea15301f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Apr 2026 16:11:41.9102
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nCHoJKpAKYqVftbJFQxwpMTkEuXvJhev6mUPG/T3PGTR2AWmuw0EJ/RnR/0+Q2MRR1rA+KBe09hvEGluLcpIo9fCWb+AkVx6B9DKOpc3hMQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB6752
X-purgate-ID: tlsNG-42698a/1776960705-05165F3B-ED63BCAD/0/0
X-purgate-type: clean
X-purgate-size: 2815
X-Spamd-Result: default: False [-1.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,epam.com:email,epam.com:dkim,epam.com:mid];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[Oleksii_Moisieiev@epam.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
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
X-Rspamd-Queue-Id: E5843454B7F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In pl011_init_postirq(), two code paths could reach the
interrupt-unmask write to IMSC without a handler being registered:

- When no valid IRQ number was provided (uart->irq <=3D 0), the original
  positive-condition guard (if uart->irq > 0) skipped the irqaction
  setup but still fell through to the IMSC write, unmasking
  RTI|OEI|BEI|PEI|FEI|TXI|RXI with no handler installed.

- When setup_irq() returned an error, only an error message was
  printed and execution continued to the IMSC write, arming all
  hardware interrupt lines with no handler to service them. On
  platforms where the GIC receives these asserted lines, the result
  is either repeated spurious-interrupt warnings or an unhandled
  interrupt fault.

Restructure pl011_init_postirq() to use early returns: return
immediately when no valid IRQ is provided, and return after logging
the error when setup_irq() fails. The interrupt-enable write to IMSC
is only reached when IRQ registration succeeds.

Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
---

Changes in v4:
- fix uart->irq <=3D 0 to uart->irq =3D=3D 0 since it's unsigned
- update %d to %u in printk since irq is unsigned
- add r-b

Changes in v3:
- clear pending error interrupts before setup_irq for pl011

 xen/drivers/char/pl011.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/xen/drivers/char/pl011.c b/xen/drivers/char/pl011.c
index 5f9913367d..a336241033 100644
--- a/xen/drivers/char/pl011.c
+++ b/xen/drivers/char/pl011.c
@@ -150,18 +150,24 @@ static void __init pl011_init_postirq(struct serial_p=
ort *port)
     struct pl011 *uart =3D port->uart;
     int rc;
=20
-    if ( uart->irq > 0 )
-    {
-        uart->irqaction.handler =3D pl011_interrupt;
-        uart->irqaction.name    =3D "pl011";
-        uart->irqaction.dev_id  =3D port;
-        if ( (rc =3D setup_irq(uart->irq, 0, &uart->irqaction)) !=3D 0 )
-            printk("ERROR: Failed to allocate pl011 IRQ %d\n", uart->irq);
-    }
+    /* Don't unmask interrupts if no valid irq was provided */
+    if ( uart->irq =3D=3D 0 )
+        return;
+
+    uart->irqaction.handler =3D pl011_interrupt;
+    uart->irqaction.name    =3D "pl011";
+    uart->irqaction.dev_id  =3D port;
=20
     /* Clear pending error interrupts */
     pl011_write(uart, ICR, OEI|BEI|PEI|FEI);
=20
+    if ( (rc =3D setup_irq(uart->irq, 0, &uart->irqaction)) !=3D 0 )
+    {
+        printk("ERROR: Failed to allocate pl011 IRQ %u\n", uart->irq);
+        /* Do not unmask interrupts if irq handler wasn't set */
+        return;
+    }
+
     /* Unmask interrupts */
     pl011_write(uart, IMSC, RTI|OEI|BEI|PEI|FEI|TXI|RXI);
 }
--=20
2.43.0

