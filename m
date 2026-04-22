Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UGrKB/KV6GmsNAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 11:33:38 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D5B4440AB
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 11:33:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1290082.1569778 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFTxP-000155-4n; Wed, 22 Apr 2026 09:33:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1290082.1569778; Wed, 22 Apr 2026 09:33:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFTxO-0000wP-Uz; Wed, 22 Apr 2026 09:33:18 +0000
Received: by outflank-mailman (input) for mailman id 1290082;
 Wed, 22 Apr 2026 09:33:16 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Oleksii_Moisieiev@epam.com>) id 1wFTxM-0000qp-Lj
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 09:33:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFTxM-00HYU2-2Q
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 11:33:16 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 69e895d9-5cb7-0a2a0a5109dd-0a2a450abbdc-16
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 11:33:16 +0200
Received: from [52.101.72.72]
 (helo=AM0PR02CU008.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 69e895db-56b3-0a2a450a0019-346548484ad9-5
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 11:33:16 +0200
Received: from DU5PR03MB10263.eurprd03.prod.outlook.com (2603:10a6:10:519::5)
 by AM9PR03MB7710.eurprd03.prod.outlook.com (2603:10a6:20b:41f::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.19; Wed, 22 Apr
 2026 09:33:14 +0000
Received: from DU5PR03MB10263.eurprd03.prod.outlook.com
 ([fe80::8c9e:b301:61c0:3908]) by DU5PR03MB10263.eurprd03.prod.outlook.com
 ([fe80::8c9e:b301:61c0:3908%5]) with mapi id 15.20.9846.016; Wed, 22 Apr 2026
 09:33:14 +0000
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
 b=Mc1L7OodYJLH/U/RtB9sH6osP3vKbUei9kiYh33JYenxEzUbOEOYoUjxtPVPFo5j81lJxOT8oM8Y0NHY0RPSOq64dud1ADK03GsJrU1fTTcc8+O4OC2omNdhRtOquSGklvz1KfAmHwaxZmLLMOeAzVcbuVywpnpqbAnS3p8RKZnVKJo31OF2SZY3wvp8ZyfKVNyYHbUq5wWzmSd7hfQh3PJvt0e9Q2kw9VHNmVQERVIssovLkNk57uAocLilBZktY0rdkj1nkdjganNGoUfFtCgv5JbSwyQzkAlcGoHDZyVYIAdIEWjxG7uY4UkTmHTQd7x7lgI7ByAnLSxhy36qjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CFQIFsP5+diQWT/tmHpgEU6ehFAOV8r9AIbIJgv6aIE=;
 b=ex7elLNLK6Gvp60ey6HaE9Blf/9wWei6VAqDO37o7wC8myxejgtFwc8kCPE1wEWnVDOumJhCOoYeohcoVNzSuGkDQ+igR9KZHO/IwfrKa5E/HJfCiGcVwRqzrHXf9FWPSqp6aHromZzAYAbYKbRTv9VlO9hinDJNAZDgtF4rcJPUrqwliOa/go838P6qh8XXyQP2WWPrH0wRpXaR3CyOBn1i0GALSVc0x3KRUNkgzNpxONMYMxYkobZTEI//mhSQMqyPDPlmHXS6mvSfWRsePzY0FuGe6wn11QTrMbBQvWeEoQeDmu+BxjMf67UZ4j2dHOlKUX3GizcDpHTakB0zQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CFQIFsP5+diQWT/tmHpgEU6ehFAOV8r9AIbIJgv6aIE=;
 b=FnhRXs2tngTum8OgrlHNa2iun/7aRZuRPRbfGSjSZSiVFsPURqRM9qOAjit3mNuPowRX4wHFfMbzvmPfQAGKiCfAhVFhq5jv3TA5lap+S0GKbyLiQHRZ1+stjE4CMr0+IVGprs7vFgh6yEM7NmckJ4bz8QEBic3e7CGjOG1zdicD3pS5FhcttI1UoOABJEJJeEtNGcEXRj8JFYeOg5HGEM1WdnfkwXbzrjLmKoXB62+upFZeCRvmHVGQ0DOLZRNJKg1SHiaePbHW479uRd/EdxpQ5y8aaxmp89y2y6HdY40WsLL9qn4j1au0XHqnK6FbhpCTAoO2XVchhgmnTmmU9w==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Bertrand Marquis <bertrand.marquis@arm.com>, Julien Grall
	<julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
Subject: [PATCH v3 2/4] xen/drivers/char/pl011: fix IRQ registration failure
 propagation
Thread-Topic: [PATCH v3 2/4] xen/drivers/char/pl011: fix IRQ registration
 failure propagation
Thread-Index: AQHc0jsKoK+EtepSVECSPLBLZ3eygQ==
Date: Wed, 22 Apr 2026 09:33:13 +0000
Message-ID:
 <6945fddd3a6df7ed9d9ca9efa7c126ab210d0420.1776850201.git.oleksii_moisieiev@epam.com>
References: <cover.1776850201.git.oleksii_moisieiev@epam.com>
In-Reply-To: <cover.1776850201.git.oleksii_moisieiev@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU5PR03MB10263:EE_|AM9PR03MB7710:EE_
x-ms-office365-filtering-correlation-id: 07b75fff-a301-4f0b-dec0-08dea0522d46
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 TTgieKNx6ekKibWYb3xUCep6gyneisNg0BnjULac7iG/HqnxSUcJGj1vg8gwNOB0/gqKukaoPgjRjO0skdjeIITmXmgxtcJdWcRrm+IC5L4T7A74fhZf1MWq85L5P9A3wjYKCJL1WyDOy/TgC/EUjtwBHzxkCViVr98S31fzqqmeA7dv7bhvWwjr5jdTPvTYah4+FfZXF8uNWDfkHyJ1fvPQ/DIB+TrkKbXttjMcyp7ol7XZxA5WtVqNESStXx/5aNhPEQzhTEo2ZA61EtVNgYCw4qASQ3lIYVZm/IjacmUPVranDYWp9E0bq/4sztDpIByCPwIpwnOK7cXU7bq63hUP9KPHwjn6d5xlkZ6f4G3Tnngrplf2wO0g7kaVCppftMy1MWv4tou4iGVvHdSlcuhwCa4vWggs/j6QYqHCe4/U1jaL781SiKRUyzUqZtKIWgck5ISgGe7nBxjV/hc5k93dnewrb3eLeQz7TsxKyribJ2V0+wX29WQr86HdiJS04rtxB7k2hrMLFO9OP+4aOhrhJjjv+1rfnfHDPjKeg3zvnl9NlB7jHBLf3yEn0BrnpIWfyPG2wqdSviIIL+MZPbEMArjPPXq5TxFSuGCVs7Y7Qis7umZJbRo9sQS4VNRNuXfZfVIAbOFtbFBHnYUa3Wm7U/KwDrYfWJXVjCrw5ovnZn8HVL1ooKcyHOnnMsyHYmY/GO6I7NQ4r19Fki0vDgobsbNbjrVf0B80z2SPtL5FRprrhwtD5yBOBcagJZuOijxypts+LvEC8GLwbN3xxGFw/s2nr25fqnHJT8jUvUA=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU5PR03MB10263.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?CkKrIX9931ClTE9Oq+XiYXMlKeeGnepLUzcSflklOaW+sEBNkt1IP6sgEq?=
 =?iso-8859-1?Q?bnQ3pZRSdigu3uD0RI5Lc3Dq9gPfdG/DKExX1tO1jMPXbokgraOkH+LcwX?=
 =?iso-8859-1?Q?mTjx2ybteZbZeSM879syAN2NIoAS+LQQTmcvJ++NsnpHD0uC08G69H9gIV?=
 =?iso-8859-1?Q?Jinz9MYhChgoXAKE3g0iRsiXIY0Pu+/GJs5yVNR3M7sd4w2Iy4TpqgbBI+?=
 =?iso-8859-1?Q?xl/bAIYQkT3ACRfk2Ph286yd5x/mIGCw7hdBGP5NPsWYCi9fKohcgd7DlV?=
 =?iso-8859-1?Q?9t5z07mYOFEvPdjCidkYRkAXbBqbX1wKkJHy1jBiu39EkVEOFPiBM40lvJ?=
 =?iso-8859-1?Q?YV+lKkvILnzpO09oqhD9UrfH1T0DcoDBcelMFb2Jq2KChi04M1nshDrFR1?=
 =?iso-8859-1?Q?N9KFmIx58Ky0H7C4Yt8VfXrAdhS3n4wns4KJtHOyWr+wF1XqX4IJ2j2qOo?=
 =?iso-8859-1?Q?rURZBSBPE5IxnFWCz3Rm6+ZlBem6DOPnFOVWh46CcGlhI3uhaolBKGfTgW?=
 =?iso-8859-1?Q?J3pnEb0dvSODWbiBYBIFdjX57R2G4mqJpGkLQfcwpVwSJvo5paWi4mmbx8?=
 =?iso-8859-1?Q?K7896yjVAyx8jkFFSFjR1jGjeNTI1YnB6Jw5I9Fnihe7QUnGqeb0Jy9/15?=
 =?iso-8859-1?Q?bqN9dlCCP8fq5R+TpqUsCQUbO/7UxPH62YXjEDQSaOn/WRtqWSbAZoicAS?=
 =?iso-8859-1?Q?nV6aPfMjolQy56zG9RdsK6kUEyHQ6N5dfIxldx+E+6NgD1XX8QrY+udY8/?=
 =?iso-8859-1?Q?IxFd36eqt4Bev/Q80KqCZQkQQs6b+7uhGEoAmQQCEXUiLHSVlu84CnjG0n?=
 =?iso-8859-1?Q?rBYSxGMgR4VyNIErcrWHccH7jw/FuPNlEKDnjQ01t4uC1OX4esQOHbQN+Q?=
 =?iso-8859-1?Q?wrCM5sFJDdWIz49Im1kiZpMqPYWoUsJxfniF9hkSFNEreux6QWoy0cr0uG?=
 =?iso-8859-1?Q?VDPVFyfiTaLw89nw8Fwka5gKmU7KkfmVHSQdmYUo4TgcZqmJqpdIGxMcYv?=
 =?iso-8859-1?Q?aJIBIE2552pOcAgnJyfYiMsjEpo6TAd35ZrZz79SviDNMixD8RGzhueSeL?=
 =?iso-8859-1?Q?zAko1JvABak1aVT7hypZ3tQCD7fiytmq2k+RLPqpwJ/1RXqM4I3QiirvpY?=
 =?iso-8859-1?Q?fVE29Nmvga6BpnES+azJj5HZLFd3v5D4alRxf8Zn7TzEZMnwAtjCQxPYjH?=
 =?iso-8859-1?Q?3G45CdtmCZd0qUzADlCv0VYuagJPfvNsXWcercNCOxv31qq5vFhEkxYyH0?=
 =?iso-8859-1?Q?TJiwD3uPPWzbCRGqchnk+jD9G+N/fQv+Ih2FGJxbrmyB1vEYApglaVPSVN?=
 =?iso-8859-1?Q?h9CsvDGNRSrp4fk1LCaApZ7biVt1e2r2SE1hK/H/qVTESqaXwf++wDhm0J?=
 =?iso-8859-1?Q?UfH12ogdBj/PR7lbnUJeoDxltFJh1Gv2T8XFI6cPlilAN+W8qDZLKfW5zw?=
 =?iso-8859-1?Q?6S5ASCZEE3eq6gxjWATQJAdcRIU5cvexzh76T61boUKHmtPT9ncjjDc/hN?=
 =?iso-8859-1?Q?XC0cTcO2y3J3TUeMrX3XKKSvmnbJSPNPm/hvGuHYPk+HMaxRD9f60oQiS2?=
 =?iso-8859-1?Q?2PZwSn2JT0LdF0ZTPX4zwkNNsgEC06cNjWGC9tDKXPt4chKuLoA0GM+Osa?=
 =?iso-8859-1?Q?pzOP4b24JP2AqCKT4Fa+9KhaUYuFSxnD8dM3MOK8yzvPnelPJVyG218kkf?=
 =?iso-8859-1?Q?eN1PnyFLicc1Hvd49JTjjguqogI0SJDYTZ6kQ03FTQL8lKHCQVmx3WZTgu?=
 =?iso-8859-1?Q?VRZCo+qzFE9fUDnOF65fA9r4ueR9SpgQzIXGLu9sdAETvZ8KV/dsLi2wiu?=
 =?iso-8859-1?Q?LH85lmvy0QLiOVKe6jVQz6YhKD5QUGY=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU5PR03MB10263.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07b75fff-a301-4f0b-dec0-08dea0522d46
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2026 09:33:14.0000
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: M2WDQRhRHo05/l+j528oiPgc3D6a8bWxvNUcDwnatDkr2sLNiX91V1nNiM3nh4VoVgPay6MFBazLHukXK5z3plFPghX8hQh4n+VG/KgDbgM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7710
X-purgate-ID: tlsNG-4011c0/1776850396-CE36B8B7-1CB6F78A/0/0
X-purgate-type: clean
X-purgate-size: 2617
X-Spamd-Result: default: False [-1.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: C5D5B4440AB
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
---

Changes in v3:
- clear pending error interrupts before setup_irq for pl011

 xen/drivers/char/pl011.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/xen/drivers/char/pl011.c b/xen/drivers/char/pl011.c
index 5f9913367d..9e308f4936 100644
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
+    if ( uart->irq <=3D 0 )
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
+        printk("ERROR: Failed to allocate pl011 IRQ %d\n", uart->irq);
+        /* Do not unmask interrupts if irq handler wasn't set */
+        return;
+    }
+
     /* Unmask interrupts */
     pl011_write(uart, IMSC, RTI|OEI|BEI|PEI|FEI|TXI|RXI);
 }
--=20
2.43.0

