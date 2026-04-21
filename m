Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aKixM80x52kD5QEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 10:14:05 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB27438001
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 10:14:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1288555.1568819 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wF6Eo-0007ZV-92; Tue, 21 Apr 2026 08:13:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1288555.1568819; Tue, 21 Apr 2026 08:13:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wF6Eo-0007Y6-5m; Tue, 21 Apr 2026 08:13:42 +0000
Received: by outflank-mailman (input) for mailman id 1288555;
 Tue, 21 Apr 2026 08:13:40 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmytro_prokopchuk1@epam.com>) id 1wF6Em-0007Xu-Jb
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 08:13:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wF6Em-00DbnD-0D
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 10:13:40 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 69e731a6-e002-0a2a0a5209dd-0a2a45098912-46
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 10:13:39 +0200
Received: from [40.107.159.103]
 (helo=OSPPR02CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 69e731b3-2497-0a2a45090019-286b9f67f072-3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 10:13:39 +0200
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com (2603:10a6:20b:3de::17)
 by GVXPR03MB10430.eurprd03.prod.outlook.com (2603:10a6:150:14a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.33; Tue, 21 Apr
 2026 08:13:36 +0000
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba]) by AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba%3]) with mapi id 15.20.9818.033; Tue, 21 Apr 2026
 08:13:35 +0000
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
 b=EPTS/jURHYyLW5Xye5BGObWBb3Br+6QAJwL+xH7wClq5O/WMaSw/NB4Dn/e9EyqsOeEiT1yfU30AqOjPTnt4koXucpPLrWj37WUbQrBsEYAIDIspY95OJHKo4b6ARdfTl2EmVrYaVJJ3tR9FciKtg8d8MGbZ7CADNkHoIMIApYtE/mTsKWTWPvzE2cp4mG5FRE5Fg5TamVArtBf2J3qrA/El4NOlyVvtyFzmylDVIWjxCwkcSYIFRxwr2LIaj7agDLsNVFpMkQqn82cXdD0qWp1XyQxPoHa6E30u40bxqPPvrZKrE53bKiAmSz99yLGlfzXQvoeA41cJwFXDHEK2QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MuwN+CYQN7LwYacx1s2AYxOvF1H40MlBjXXkluvlta8=;
 b=HVZU6F8fgNr972O8AYUaJ1X9Nllyumow+DPc4BX1zrlOeCmcl344fcBwaXg5xzeg9bZR43FQqGNH9jjhcpp58d2rBPEDMGu59C6BmEIx88BpYpcLJNnwrEwSQOg0FPb0hIHmB3u5mfwgmNNQ4lV6aQ2jn5U3VfJj/+p3SVxuL8bbztrHaf120xmYbEy54+AS0ADgvU2lYzcelXtPWxBwbAPGTYvAXyDkZvuO5s/GdNJGZqXJwC0UC1dkEJqaGJ5HDuUUwHDhao1pnX2MNXGTYAAhGxh4Jyi/q4uufJDO54dMD3gaFNnXZXXLudybaONzgKEzLIyjSbsVGPw57HuSBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MuwN+CYQN7LwYacx1s2AYxOvF1H40MlBjXXkluvlta8=;
 b=iEjqSYDUfW2hvySoWcTwqQgpljrgPcBLSZe4sUg7LNurZjNL6nT92rUwzmhvLPfG0iCeNACgnL4AOKvtb1Nur8JV7jKHrqypX2Sgkpd+/h8PDQqiWR0B4kddEorhgxKKJ7iN4YIE54605v7Leht01raIThkO/wbU0DJsyhIRyO1RdHh5MvR6CWHOA4VKfKaCo10mQ8HngqLLfkQoeH2bisE/dZxVcfBzayT507ZeqvbSjZsQYP7l3hOyPo567/8bPuAFmVesGQpw7td1SJ3i0XHHpgm4BwHZnWIChoMSYxWeq+Rs3o1MJiU8IXDPK7gD6hTZpAjdzDKDCvPxlVL5Rg==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Jens Wiklander <jens.wiklander@linaro.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal Orzel
	<michal.orzel@amd.com>
Subject: [PATCH] xen/arm: ffa: fix build with clang/ATfE
Thread-Topic: [PATCH] xen/arm: ffa: fix build with clang/ATfE
Thread-Index: AQHc0WbA/s1rIXoAmU6+7rPJ118Z7Q==
Date: Tue, 21 Apr 2026 08:13:35 +0000
Message-ID:
 <581a0752a1af3775fb676a70c4f42e7fb958dadc.1776758025.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR03MB7526:EE_|GVXPR03MB10430:EE_
x-ms-office365-filtering-correlation-id: 99fb0c34-5fb2-48e6-4f1d-08de9f7de2dd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|42112799006|38070700021|18002099003|56012099003;
x-microsoft-antispam-message-info:
 Az6NoPT9QowUZJuF/6Av22BXTf8/DwTWieX2JodpHDvZ02QJD0iTRU64Wd3jl4dSqfkSpEmRNTVjke8S5991VwS9fPSdbHbmTsGeIbk4jq6Y+ulWb6CY0cYEiiA6lugL5OjfxH93wUppIVvYU/s4/tX93CNpXYYh8RgREWryjmHug2g61Bh0d+p/C8CxIRYAs/jVX99XRAu301GAOYuNImEjiNQ58QPJg6iQ4MaNnBVk93Jse3YHVrIrPKd1zU6L/CX2NnoGXK++4q0bjacxW17jca2ceDrgVPnDOrA2IWJor5j3mAGmAqMMoDrCV+fWa1lF50lJTIxQSACjsq7XB23lA/fVqGpfXLlsMvnmhnr3jntzdCXK1h4iGHTsc9VHgPJRr0biiH/c14/x7QMdhi4VtF6XRnjad8l0YGQ0ZKZ6CMd3G+VYScgT18DGnsmtlZ8ZSLgONqCyTp1+pzi2SVVHcalRQl8oI0MkwEbaalQ9ToqMB6DbNQ6l5YUi8MGgJGGPdXC8FM6NX7blpD/DYxTcTjGRK/2PYDWffkZCCrwAMuaQk1DT6RTizXfBcVcHvCP3fsVm3FQrYIWCO+06XmqNs9b7w/H83Z+onchaDGfW3DCxCZ1wWjceJRi3hnOqJpR5Y3WWIMwU+C1DI2LyvS5WvfJ+/DLlXRkJYf2edx8yKNW3i9WuYuGw56m6IMBu+LNNvRDVWifth6yQWo9u/Gh1J0K3t7F2koJNj7x10m1Yx3rfUUdghq/BHehv7IE+S9+nHGxxDB6fPEOBP0I8Qe7QBxNBONJf7GfGi470cBM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB7526.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(42112799006)(38070700021)(18002099003)(56012099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?vChuRn9/AxrzrTJ2eRfpwdcamJq61V1wufPZWRU68rCogljf8tbrNvWOa8?=
 =?iso-8859-1?Q?6xe4VCr8gkdol4WcXOfTWd04+VTN9Odwqo6+IM6z7ZoLxoaXm1Hkjo9Yxg?=
 =?iso-8859-1?Q?T9mSRYgysiyyXzJyqWjnrP3QPgMIJXImtXFwf3fBeR2YHqo+/8fB+9QRXT?=
 =?iso-8859-1?Q?aVxB2MBnotXwD2ZEasaflIQDk6WyICkRsOnwWOsk5PKjEnsr7zY8RFevaa?=
 =?iso-8859-1?Q?yDqvqDR8U6oI74DWOtrjmpC06Xw4VozITZZq/KBWGyGhA2lys57NnloR20?=
 =?iso-8859-1?Q?wFBH81tQ1jvyGfnNmU8a2lzGhMouX5w9wCpBZkYyNUrO/8x1UZjGTKOJC+?=
 =?iso-8859-1?Q?3U6Txfz2f2U66iCzJOvzBlWFTBMjcBAXipI+qX4LAxkW40E4xXlLrb88f7?=
 =?iso-8859-1?Q?gQ8/QT39Hgn/9oCt7GEnR4NmFYY4drGn/SjOVDvqKHXwes60wZcQRnLc2L?=
 =?iso-8859-1?Q?EFQUSvu5MR7ThZlU+LbptnySrvMUfKo+kRaBb1KIIAJpE8qsqUjPn+jkkE?=
 =?iso-8859-1?Q?rimBsdUZ/cU7c8jG7Ls42nPKKvnL9gn/FKek23TCz6fDIOlKwdSitKUYY+?=
 =?iso-8859-1?Q?PE2yftE5KhZ/geUYN5QdkApvMXBvm0lUaDuhQpLkD7leWpggTPwEp6bndf?=
 =?iso-8859-1?Q?pHWPc9yflH/bdgezus7aPo+WIZxUFHCDClsNsD4iCy3zQdtpf3IB20BgQ0?=
 =?iso-8859-1?Q?C+Gjr9EBjQU5yQ+XDN9qTAUikiWF8R6Vl0Ut51ihIHpr+ueNKJjoFIAvaE?=
 =?iso-8859-1?Q?3WqK39vnYZnnaH+OLVPLITyq1WxAPkMc8awNUaALmcHHoijSoswKofJAj1?=
 =?iso-8859-1?Q?n3elH/IiE7JHrB1StJVkuajdKiNCXwgcdwR8UZvq3TRoehPXRbLWuLNEhV?=
 =?iso-8859-1?Q?KLFSlSXNB4rqRRqjtLo4+FOVTlKqf6opXlSbBq+v6RqSRQoYq2dy9Tp4oy?=
 =?iso-8859-1?Q?47liOyvf7XEQORtkoIwajCZsTm5Myuw4dYdJUYc+efdmFiM1GlRlYN8Xtn?=
 =?iso-8859-1?Q?m7c87jFaHfPSz8WbKfrfV0exel2acxJGl9RDvMB+wu+kQzfXmnopkWs3Js?=
 =?iso-8859-1?Q?HMD+5H9olPsaygdP4yhbG5DQosA/SBSBxbOIUJV2Mwvhko0KqSPWH3bytX?=
 =?iso-8859-1?Q?K4RtBBYEnKre1xhL9n7igcUcB7m6jRR3e1BDEEVe7fpb4KqI7u2mWWHq5C?=
 =?iso-8859-1?Q?qbZSIWdtl1tFQJcJc0bsXvbiquMgjFjCd0EIjTJ0FAKtNJ5pUT/wjZ1WBp?=
 =?iso-8859-1?Q?FM8AMV8kQmUSSeRVs3qywSE5J5f5qfPRGpQlO7eQKUg3F3EJ9NrJvI5d0B?=
 =?iso-8859-1?Q?E6kzYYy9PT4WZxPKdx4L1COhtApHCVkUnzfLJxUAkX34Zfoc336Fxy/kum?=
 =?iso-8859-1?Q?Kzr7WIMXKuyP887GZgRag1n6LLTmvw36FYVGkMwhR3gKlV1//AEPUG3p+l?=
 =?iso-8859-1?Q?eESD2vKuP+FEmY+T1EbuGIeDD+wIESGZ5z/WzdLQa4Hofrmz26+todJdiI?=
 =?iso-8859-1?Q?97mtOisZHmxv+FJpNSi9ZKAE5jz3TteD2Uw9MKsTLDrFpxgfUMCDrM6lVr?=
 =?iso-8859-1?Q?p1OJaIN4LcZWdhic3A+uicAoqhE9aVSE57nCZbfgoNQgQZ5uBl9NMFQacg?=
 =?iso-8859-1?Q?zxgT6919fzo9owI2n63eBk7OPvqAL9CyZptn05FRgaoRjMO4eG2FBFZF9O?=
 =?iso-8859-1?Q?FpYGYz6uM9gMyHzMQFHqkdn4Ri9RViDrTIM7qpXS464FrTNDDB+CZ0sljN?=
 =?iso-8859-1?Q?KtNFtoot9Br5swPaWDQa3mspsR5Rn/PFod4gcxt/hU/pGRi8GLcUWAsA92?=
 =?iso-8859-1?Q?U9X7Q6COjDNpWVjeQpeQsf8G8t5z87I=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB7526.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99fb0c34-5fb2-48e6-4f1d-08de9f7de2dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2026 08:13:35.8450
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g15U2TxS674RGqwyp7nZWsUiaf19X6GTl1Y4g/2rrE5+eI+M9KBXgoeG9zsMFJi8q1cEkWCgbDxsxWMyo0miwR/OJX732KwxR+gTMy9nNow=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR03MB10430
X-purgate-ID: tlsNG-bad1c0/1776759219-41AB6A53-D664EE93/0/0
X-purgate-type: clean
X-purgate-size: 1570
X-Spamd-Result: default: False [-1.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.com:url,epam.com:email,epam.com:dkim,epam.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[dmytro_prokopchuk1@epam.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:dmytro_prokopchuk1@epam.com,m:Volodymyr_Babchuk@epam.com,m:bertrand.marquis@arm.com,m:jens.wiklander@linaro.org,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[epam.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[dmytro_prokopchuk1@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.991];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 2FB27438001
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Clang 22.x.x or Arm Toolchain for Embedded 22.x.x reports:

In file included from arch/arm/tee/ffa.c:75:
arch/arm/tee/ffa_private.h:439:17: error: 'used' attribute ignored on a non=
-definition declaration [-Werror,-Wignored-attributes]
  439 | extern uint32_t __ro_after_init ffa_fw_version;
      |                 ^

There is a fix for clang 16 in the git history:
a1a1e2b7dc4f ("xen/arm: ffa: fix build with clang")
which was broken by the following commit:
a90376c6adbc ("xen/arm: ffa: Add FF-A 1.2 endpoint memory access descriptor=
s")

Remove __ro_after_init from the extern declaration of ffa_fw_version.
The attribute is already present on the definition in ffa.c, which is
sufficient and correct.

Fixes: a90376c6adbc ("xen/arm: ffa: Add FF-A 1.2 endpoint memory access des=
criptors")
Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
---
Test CI pipeline:
https://gitlab.com/xen-project/people/dimaprkp4k/xen/-/pipelines/2467446333
---
 xen/arch/arm/tee/ffa_private.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/arm/tee/ffa_private.h b/xen/arch/arm/tee/ffa_private.=
h
index c291f32b56..e16bc0d83d 100644
--- a/xen/arch/arm/tee/ffa_private.h
+++ b/xen/arch/arm/tee/ffa_private.h
@@ -436,7 +436,7 @@ struct ffa_ctx {
 };
=20
 extern DECLARE_BITMAP(ffa_fw_abi_supported, FFA_ABI_BITMAP_SIZE);
-extern uint32_t __ro_after_init ffa_fw_version;
+extern uint32_t ffa_fw_version;
=20
 extern struct list_head ffa_ctx_head;
 extern rwlock_t ffa_ctx_list_rwlock;
--=20
2.43.0

