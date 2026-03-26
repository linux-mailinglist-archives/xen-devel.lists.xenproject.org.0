Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YJHtFo8xxWkP8AQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 14:15:59 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C30EE335CB3
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 14:15:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1264096.1555826 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5kYn-0006Ge-H3; Thu, 26 Mar 2026 13:15:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1264096.1555826; Thu, 26 Mar 2026 13:15:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5kYn-0006Ei-EP; Thu, 26 Mar 2026 13:15:41 +0000
Received: by outflank-mailman (input) for mailman id 1264096;
 Thu, 26 Mar 2026 13:15:39 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Oleksandr_Tyshchenko@epam.com>) id 1w5kYl-0006Ea-C2
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 13:15:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5kYk-004Vwj-Nd
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 14:15:38 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Oleksandr_Tyshchenko@epam.com>)
 id 69c5316b-bab6-0a2a0a5309dd-0a2a4507c162-44
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 14:15:38 +0100
Received: from [52.101.69.81]
 (helo=AM0PR83CU005.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <Oleksandr_Tyshchenko@epam.com>)
 id 69c5317a-fd74-0a2a45070019-34654551319a-4
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 14:15:38 +0100
Received: from AM4PR03MB11152.eurprd03.prod.outlook.com
 (2603:10a6:20b:6cc::22) by GVXPR03MB10804.eurprd03.prod.outlook.com
 (2603:10a6:150:223::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Thu, 26 Mar
 2026 13:15:36 +0000
Received: from AM4PR03MB11152.eurprd03.prod.outlook.com
 ([fe80::bbbf:5b9b:1043:4510]) by AM4PR03MB11152.eurprd03.prod.outlook.com
 ([fe80::bbbf:5b9b:1043:4510%5]) with mapi id 15.20.9745.019; Thu, 26 Mar 2026
 13:15:36 +0000
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
 b=wdZ39SUTbUowxV36x/kD2WxgoRcsf7mB+AnBzChKGV1bBmHQ3klksu5zvYTjGnmqEESk+uc9UFJL/d5sayLlJL9KiCurL6d/ZK8dQmXfVJ/MHweWwxGPJmObs+D3Le6ASQSK72LabTndFMy8nX2ODj13zkBrpQBt2TGmNhlozE1DApzLYqx+VgJVwnVQE5JMDSfvCy4d7xK2mnDU/JMK6H7QASeVkFwx5WYEO+4Q4yHiPGzHX/aoiqh25hV3JNtT/AQDp0F1NEbUxBQp3CNlaSecy3qrB/j4GkcUJgKEy27rmgHkZrWDEiEx8D12C6JqUrHE+bKG/3EHdYvRf0F3Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hBA45rH/iUDhuUY3wYV77y73MaL2jmNL3rTz0lBSRcY=;
 b=yWEpnua3vsbM5AfHOOVJoXNyuMUSLSFFW/ceX7UK6sCqZmhBIFg26rkY2wbonZTYOPUs3yPTvR+o83iLOC2aNaIVee/Z2jL6gqoNUKBk8pQLd8nnI/ghPV7kCLiwkb9d9TuiAU0NYcEy9Gp92YGpbi/NGHfCCSs+A9ixTAxveTrhhL3Pb8NYXz6XSZEbTgXMQL67DRb2lceHL/T7zpiKd3JmK5mS0KXZdj4ycO9jW8VaQVDyXgXSfKhoLrvsbtLksre7FeSSwyYhIQ+MfH8CCmUdlAFvrxpObZ7SZiet+uK0ife6OvieFI7ZW8g996NO7uWhSJ5TZHCS3/HOnukNUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hBA45rH/iUDhuUY3wYV77y73MaL2jmNL3rTz0lBSRcY=;
 b=izq8kfvQRdYJLDjROogTgm8FT8cicP3zjMdsfobQ08XvUgoOWE0mso5TyftjpGUDpbch5KSQVQEcMnMX4FK1qFj23ezp0uHbp5uHGKMfFwCUzWUUFuiqvfX/h8LJ4hglFfXLd12wU+84HqxFakCJRP9VHKTZCet5hI2b+lZT1J8edqMa2vLPlUHJ0RKO7Z7ykmKH7yuKOTPBoLuJOUKI8EKDRS0nqqzSjdtwkrXdtPukA0BhCgMl8H/Gt2rq6QIbYKbm8HwuRmidLuiH83cBAlbp00h7hsiOVwIo13loqkasS0jC9qmoixOuWNpLgogsLpxax8lYa/Yy34KZDQYqWw==
From: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] xen/arm: Increase DOM0_FDT_EXTRA_SIZE to support max reserved
 memory banks
Thread-Topic: [PATCH] xen/arm: Increase DOM0_FDT_EXTRA_SIZE to support max
 reserved memory banks
Thread-Index: AQHcvSKiuRz6O/EU8kCzrBnRPjf18w==
Date: Thu, 26 Mar 2026 13:15:36 +0000
Message-ID: <20260326131535.662466-1-oleksandr_tyshchenko@epam.com>
Accept-Language: en-US, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM4PR03MB11152:EE_|GVXPR03MB10804:EE_
x-ms-office365-filtering-correlation-id: 1a80449e-75c5-47ae-81c5-08de8b39c4a2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|42112799006|1800799024|366016|38070700021|56012099003|18002099003;
x-microsoft-antispam-message-info:
 d+XpNal6uLnSAvCXdLpEvzpm4reK0WYoyyquhBq9yXjw63MHjs0TDFpu5cAXEsnxcvDL0VJ5Bk40Ddulzb3Z4TSNV+XUSwmMLJE6BM+uuqxlpAUAmwJbZsdi6CTDJVEUzNYSNm5J4ohbvVmw0auz79uBfoX+9a5Pmx5Byo7X1xqFTzpDoOWAFE5blEIz0UJGl1ncJTvMm5YRpMPAzEMCnCWUxSE90YOASpdAWdpNVcvKpOCLk9fGwNIjwjvGKxXVoUBegMr/cmKp6sT+9AkT8WeZ1q1SLwwgQI8Xzz3944rjGSyBcuQe34jiJQLhHeiz7eiD6UYI4Pxwa8uMrxMK1ZSf1tBHHAvPpLlB4LylXL5Z5GF1+Yzo6WbMmQOwnNg6cxgIaMZ1+hAZqxPSKez0mdIY+Rlf4hRyeZJQo1NiRTiu2k04hGqG3vqxgM6ByWlmKV70vK6z99EW0IB50toYpDasi1kFZwzDEe+aLcjjVtuDxDd0qwjNd6zfouKF1KUbifrWO4Sn6QuGvg3VtNJiWxqhQ55cb1IjRBkXNwY0XfLkF2nvojmKA0EhKrRdWdMaJzU/rc8NQiiOMGffOimL5j2TK9joqixXoJcJTH41EXYEd8jnFiAE4Z8fbRUHpN/v+V6rov3Sz4X4iECX+2bemly7UgVn+UsDoQErylQ0D/hWrgLtLKVtACFJCUu6D/UgpzhNeZe8WNCqUsjJtyW8/qzYd5RDa/av54T1FmqXICnZeOdCqOLfosW2yoWrHemP+MzcTu5GGO5jegMb4u3SH2eFGky5L5MyKcnuPinjPj0=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM4PR03MB11152.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(42112799006)(1800799024)(366016)(38070700021)(56012099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?ZkVYK4F63S2Mbp/eHrVO9lxqFijJTtigTngxJFRdOOJ4vs95ldgM0aWL8D?=
 =?iso-8859-1?Q?ZFbCbFJAalNiCU0k+IVzQZmJdUqx/Fq8yN2NPhrgXAjj4FYxK4akFQoi/x?=
 =?iso-8859-1?Q?AQCRS3AxvKOLfpLWtC2raovcjDs3v9PZoKscikBV26QquIHgS1gNFigjEQ?=
 =?iso-8859-1?Q?MdvVEEYLOfXh91OUhSr8c6yTibDVwt3lDcM6u21W5lsCALty/yO69mf3vG?=
 =?iso-8859-1?Q?9BFSfDO4VAf0FqKxYcQZELOjxdILtZpjZRhvBnYTvQg3UNkUA+/ZxbJRvI?=
 =?iso-8859-1?Q?zWnd0cZpOUGopJ/qKOflP7gxhgtlSdbb1Tvapzz1Zl5XlpQZThAUNoJpc3?=
 =?iso-8859-1?Q?Etwr6Sg7IWOYaT3IV/JHixWxpSAxVL4yIdnn8EU/IkdOQ1rGOsw27V3GPZ?=
 =?iso-8859-1?Q?oSiXw4Go3YFGA718WUld4ZSV9jbXDnnr1VS1yb8OBEf4299nP9nkudk/FU?=
 =?iso-8859-1?Q?vLrWYYVZHD+frDPRoDqocV8sf3XltpbBrSn4XyPd1SMdxdzjhaMKZTSx9R?=
 =?iso-8859-1?Q?ZwBKMxkF5jo0ZdtHEEIgJYkewZ0TGo2TLaEUfBKNBq0TDKT1oN/CMCegZP?=
 =?iso-8859-1?Q?FaZDBygujx6P5IEo5XrLHy0p65tNCA2syqzLedxHZrwjtUbdIBER3HASs8?=
 =?iso-8859-1?Q?Vol2HHTTXeJYupvvo88XD/u+fA+rzQeIhTDXbzv5cMjF2HwMPLDW6YTKyD?=
 =?iso-8859-1?Q?L/ymTGj+uewM3qgQQCsk6DQzA9QgA7nyJmVGUqFk89UghtV8PPv562R86V?=
 =?iso-8859-1?Q?70w+ZmA6V5wkvL/ttt8njUB3PnaCZ0tIvEGzlQ7qxEoSDl+La6jKzeSvok?=
 =?iso-8859-1?Q?5N7TDUNsykrTl6/DXkEfUYHmkjgVdCfJy3dNYxN1XLe1KrhxLpqGcS/yLd?=
 =?iso-8859-1?Q?RGjnr+knvatrh0ix0xAjqDp9tUAYEhuvGvyMOWza1F16Wlts0KUQU6gXW9?=
 =?iso-8859-1?Q?sDUbvH/QmufbsKnNqbZof/09zW1GQYjzHx+ex06ta5y8AWXizu96AJfGVZ?=
 =?iso-8859-1?Q?ogDQwXs5H7gJgDRnRFxMqKWcQqgEcQMlXz0sEBPGEF8xfh8NLqiPE1c/DA?=
 =?iso-8859-1?Q?peunyzuR1lyVDYTft6avpkN4tCKhFOw0U4poy4E5dT6/cfzMZNdmQKcVd3?=
 =?iso-8859-1?Q?4So8z/9DObbxdN/yDvaqrX1+7bRfEES3DM3UfEiBYW+9zZiGzUGvgv7LiS?=
 =?iso-8859-1?Q?QE2bZ9xNOBRf2hJntv+rjUn85ZZndpzwt/RSmta833VS0iCjW0BRzIsWLA?=
 =?iso-8859-1?Q?XmBdXh1I59ZcH+s67k4EpWktLeP/1ywYSBg28agjaRE0MYEzYUpYUt+sdE?=
 =?iso-8859-1?Q?LiIntwg5P79+j3r2RYe/3pdu3xNiEM1yUHSeTITWxZfaOoCCFRfCm4vDvB?=
 =?iso-8859-1?Q?MUug3r7pXIqmvncQpjgmsSkzqJGfCyDyoMz26wxV+FwsrBg5xF+bEO7D2A?=
 =?iso-8859-1?Q?wDUqwjNC6P8EijpOwqE6LSxCMhhsdCgswJbA9XJaVfFJodZMtZdtgXW7Sy?=
 =?iso-8859-1?Q?KSBjthb5A/qKLCLMoa3AUiKLTWLhLz7UwbWPuhvparopILS6DZxUNxmvMz?=
 =?iso-8859-1?Q?mOajKDR5LSBgHGhT8F705WGI1mIza7OuwCT3vXnoXMzQjLYQqovS+SdZWF?=
 =?iso-8859-1?Q?aYE8I5N44dCTE8PPKb7dwqvfVPmu2qWKSIYMobZjPDnc+oBH9E7Tv0XZi4?=
 =?iso-8859-1?Q?TAPeun2/bQq7ftg4koPAN4N2tcxtIaSfwmuWTKRwp12wNW9oLd7ZfBaubK?=
 =?iso-8859-1?Q?2rQLeYpM3zq/5xYj2XE5NaGEIR7Xz764tbo3dtOUBnX3u3ALvwi4Xh+ufk?=
 =?iso-8859-1?Q?ZEQkW+PRARo1SHueeSlvmWkpLyBZ4/dLKAtvL7aZb5eHJmkqoin+?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM4PR03MB11152.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a80449e-75c5-47ae-81c5-08de8b39c4a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2026 13:15:36.1373
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EGGYKpYCyJ0auhyWAJif5svzqFRrfRB23rPE+zHbKAh4jRbWzf4zBrCtWDCvqBSK4zPo0KqvyTIO/uJ9wVak+EgUMt8tQLIQL9d4MkGvQGs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR03MB10804
X-purgate-ID: tlsNG-ef75cf/1774530938-5C58B303-9BAC3241/0/0
X-purgate-type: clean
X-purgate-size: 1898
X-Spamd-Result: default: False [-1.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[Oleksandr_Tyshchenko@epam.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,epam.com:dkim,epam.com:email,epam.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[Oleksandr_Tyshchenko@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: C30EE335CB3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Xen fails to construct the hardware domain's device tree with
FDT_ERR_NOSPACE (-3) when the host memory map is highly fragmented
(e.g., numerous reserved memory regions).

This occurs because DOM0_FDT_EXTRA_SIZE underestimates the space
required for the generated extra /memory node. make_memory_node()
aggregates all reserved regions into a single reg property. With
NR_MEM_BANKS (256) and 64-bit address/size cells, this property
can grow up to 4KB (256 * 16), easily overflowing the allocated
buffer.

Fix this by increasing DOM0_FDT_EXTRA_SIZE to account for
the worst-case size: NR_MEM_BANKS * 16 bytes.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
---
Just to be clear, I have not seen a real-world issue with this.
The issue was observed during testing of limit conditions.
With this patch applied, Xen successfully boots the hardware domain,
exposing 256 reserved memory regions to it (using a synthetically
generated configuration).
---
---
 xen/arch/arm/domain_build.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index e8795745dd..7f9f0f5510 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -100,9 +100,11 @@ int __init parse_arch_dom0_param(const char *s, const =
char *e)
 /*
  * Amount of extra space required to dom0's device tree.  No new nodes
  * are added (yet) but one terminating reserve map entry (16 bytes) is
- * added.
+ * added. Plus space for an extra memory node to cover all possible reserv=
ed
+ * memory regions (2 addr cells + 2 size cells).
  */
-#define DOM0_FDT_EXTRA_SIZE (128 + sizeof(struct fdt_reserve_entry))
+#define DOM0_FDT_EXTRA_SIZE (128 + sizeof(struct fdt_reserve_entry) + \
+    (NR_MEM_BANKS * 16))
=20
 unsigned int __init dom0_max_vcpus(void)
 {
--=20
2.34.1

