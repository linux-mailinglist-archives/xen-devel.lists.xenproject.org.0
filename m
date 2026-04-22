Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oAWaM8Kb6GlNNQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 11:58:26 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE79444561
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 11:58:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1290186.1569856 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFULB-0001cN-7c; Wed, 22 Apr 2026 09:57:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1290186.1569856; Wed, 22 Apr 2026 09:57:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFULB-0001aO-4F; Wed, 22 Apr 2026 09:57:53 +0000
Received: by outflank-mailman (input) for mailman id 1290186;
 Wed, 22 Apr 2026 09:57:51 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykyta_Poturai@epam.com>) id 1wFUL9-0001Z9-EY
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 09:57:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFUL8-006vHZ-QK
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 11:57:50 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 69e89b8e-2eae-0a2a0a5409dd-0a2a450b9c54-40
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 11:57:50 +0200
Received: from [52.101.65.139]
 (helo=DU2PR03CU002.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 69e89b9e-212f-0a2a450b0019-3465418b1c46-3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 11:57:50 +0200
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by DU4PR03MB10597.eurprd03.prod.outlook.com
 (2603:10a6:10:58d::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.18; Wed, 22 Apr
 2026 09:57:49 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%5]) with mapi id 15.20.9818.033; Wed, 22 Apr 2026
 09:57:48 +0000
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
 b=WPQ3Bv8RD8iZYK4yznJ+jITF+1anfYmAUgPg5/ULTGHXfSQRG2RkesQDp3EFL40YT5us+xwCCikAh1EofzuaaitJUTcJgeuEX28IpD5eXi71rMyWELirCIUmGY7syKvPJqDTxzs2vCsnvepdS3Xf8xiYAR3B0EDXG08R0zoAWEygxAucrrua4c21brCHypF6YRB4wrTl6v/D3OmVM9OOZ/vUX0B8u8fdbGCCCcaptHvIAb0eElMMHhtJJycAKqYX2VyjHC+v3ORsXOKJ7Z3Ox0ZIr0XaDhv0VHJ6mznnEglO4wbZOJmJuzTb9sjDp5ATN2ZOJx6fqBBba06hzVFRIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XQQyWDXhHF3VLbDeoZxXTRSe1JvDvOtpXS6zqyAfK4s=;
 b=U6jrNA8y6SxMf2BgRqvu6vUTCFAwqCQkcnbPLBw0B/8hPnVPy6J566Y5ZKQ5NL8yMj8aOupe04COCGs6Ii62+qvMvD/VdYHSvmH0hq/+uJQgxDyN4QsItAir52Mczo6TE8yj23jK5ZxP4bRDwgtWDqBSb3Hzypykkc+Y9H34pAIirFQNEZJF9VjSBy4E0Sty0HrJkDkiOP7ACSi/zvzqgHm2Qg7MMTuMMRKgC3z1m18Ct0pmlw0alxJrcGtmmCIBPJqFnkwWzBOA+frLAa1V+bayosmyGNXAmwVogr2eI7WOkKryPjx+/rDpg9feLJ/C+ccbDU2qjfDfhVJoXfCLNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XQQyWDXhHF3VLbDeoZxXTRSe1JvDvOtpXS6zqyAfK4s=;
 b=qmb1uNGe4XUSrpwkseq2Bct1eAFC9lHXT8uKcFt4Kh2ld32hNvnSDdWHFgz5Gvr6RdnMlwLG9S29RVeM/t6DPfVTGJDAvt+GFrcJGYuVkAEQCs1GTA4/qgttrGTJczv2s7d/eH/osFIHsKTutwMztFJu1a25+5TLqkxkoXYd+G9SBPRoBoRhIl/ZhD4MnMVZ+RrR7NpWlgT9En8AGVMQ5G3LktHzpItVpbPIugaT6R1CnY+aPliQmDRgYRj2siREfvXC/0xtcJRZTQAYVEa39fLkV3FHrsZPkodwBhBNsgdRz58cbRKIt58WMqAKXCWiJTpmhPMRd/P5TfPWscwWoQ==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Rahul Singh <rahul.singh@arm.com>
Subject: [PATCH v3] xen/arm: smmuv3: Add support for removing devices
Thread-Topic: [PATCH v3] xen/arm: smmuv3: Add support for removing devices
Thread-Index: AQHc0j55GUlr8UPy3U2zLlIUZUxNrQ==
Date: Wed, 22 Apr 2026 09:57:48 +0000
Message-ID:
 <d9f90d511208d17f0a98db5d858955f8adfecc03.1776851790.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|DU4PR03MB10597:EE_
x-ms-office365-filtering-correlation-id: 645f12f4-bd57-4f23-f05d-08dea0559c3e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700021|56012099003|18002099003;
x-microsoft-antispam-message-info:
 ZLg8uTQALZXmywx7qoARTfwq2eFer52b9r9fDnLyJefcch4WHQQ+kDogwkm8xz8D2T3E6qqnM4lPVsfOUXF5Jf3MKC5+BRusts1Z0djBC7jhG+SfZ/JUWhlsR973/NOrmMkhoaiDXCJlNgU3lmJpzhMjKYukQYv5GMsE2JjrEpfSv2GWrvp8KAb9NH8yOW3dURZT3vu9tqLMwqA+CkzDaPqyycAFIjJiKGVgB8ca7sZh7QpTg45amXak+BKwvjs3xxNml4M/XgipQ2JngT+Z/FubXZUPuUOuQjSICKcvVV5njceihSOOhTvSrH/xZPSINokOHCCz1kX4bBzBcAukxFPpjuubtj3kE1SVzImVnEpMP7xd0LGYc6NYli2egkqByGaf0FJQrjJ8PJYtO1dYuBa/dTq0f5UdD1dghWE2Q8OWCbtKC9g80Xd2kRgz3oldsGtXmemYVBDjW4H7B4SzR8gO5CX/i56tZYH6GSbKJv3mMKEGQsOl6vFMAQ6iatYf6OcIifaqmk2u0tEG/W4hIw9U3UkmwWrBTQcKFbxxxpBpZAsV+OYqL+hGkQ9pccpEgYeS9Ntz/XQULJT28lFrjtLHJejXwTmHHbrXSC5FS6apAdk1qW4/Apf3kFE6T3SSL2L+56FZKTmXe536mv8j3oWyNxuF6fEI7JRRVwRW0Fj1I3sBgy4KOtLKt0NuORRX9dC+69L2UlJWSFV+O19ZzJnjJV1MMPXLM4AcVI1VoQWxKFGCzkekW1YN8xbXjck+
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(56012099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?Mf4HeTsRCQhbGci5tAi7Vbv7D0eyfUqSjyItpWXKITuHuvUb6vvwJlBiRG?=
 =?iso-8859-1?Q?mAtdq5koeKrbhHERqbOp0w9OoT40Bnz3xsIMBnPDOFqLCcaTUltChzxJeA?=
 =?iso-8859-1?Q?ozywh2SpfkcNvoYLEEwkV/V31DUaVo3/75NIOOFp552Tr/heCBdXR38ge3?=
 =?iso-8859-1?Q?rIEtl/W2m3QyJHN7CHO9nSTixfadQpFfKuc17vCkcD2i4WO2k38107tC3g?=
 =?iso-8859-1?Q?ujZRWaaMklUzzrbvnrpEuCf9tZMfKx8QuEFl90gxdgZgnSUPPNzobGwtBi?=
 =?iso-8859-1?Q?Yx+J6pAO8k5ye5kiEUWTjKaXj55h0CYEx19R4pReqLjD5pkBP+KirlqNU9?=
 =?iso-8859-1?Q?4yRnxdM43w0PlVLB4Evyp7ZVsf4i8venx2JmV4ZfewEBQ3yBlJA2r8EuvU?=
 =?iso-8859-1?Q?zgwxK7uiDd0zSEt6aJ9IwWTKUPNPFeF/YTh1GJ5TbmQKGlHEDgdK0s6l0J?=
 =?iso-8859-1?Q?L4bBRwcS9CSMQUzAjSQdKO3WrBrHO7SQFeuQJc8VGpIXz9tNKKSj5RaUld?=
 =?iso-8859-1?Q?24OZYcU0jQoFjDkw+6GjdPHMlDoqBIThrsHeHxdGm3WRasiiONbMJYRNht?=
 =?iso-8859-1?Q?VV0ELZ17qBLbe8qVU2zEAA/jn+tMopNkrFbNzHBhgu9ClCjfnBE/yNCQcn?=
 =?iso-8859-1?Q?/Vz1h3HNQqG47oQod0jDPxeL4T+VyCYOBwtNR+D+ofIa7fSO6gP0lix9Vg?=
 =?iso-8859-1?Q?Bo/CeDwGnaDaLw7mpd+I4tigH2q/5f7Hn3ngXfCzzB1wSuxIbsOKvMPcia?=
 =?iso-8859-1?Q?s9PiQGQIhHqjJs0BauyWcPh54LBBQrU7Aif91bJfJQRPnYUAIzFeY1LGSZ?=
 =?iso-8859-1?Q?XuybaBITZ++CcMHBbQnPBCcgew15sxKQHD4j1I+1/OVswou3UJVonRODKd?=
 =?iso-8859-1?Q?JF+itRpaLCvEM+4Epalp00gwO0//5hjTm56CEStE1Bs79GL5lm6lZOT+c1?=
 =?iso-8859-1?Q?EjZAomWlQFC40WNTQ50XDiIyPbDMJKOuE46vkYAz3K5Xr4x75qU9StURad?=
 =?iso-8859-1?Q?wUQGz9diQH7QtwOvdaMvPfky48Ycxrm2XTK+yRgc5gOgkU4Ob67NeK3Tvi?=
 =?iso-8859-1?Q?Qvzdk+eEbPDiWDpgKjAmFl9pJW/uI4hUiXpNMaB2VPMbRNQDccHxbWz1qp?=
 =?iso-8859-1?Q?EGaSejApEzcqfFp1X0+a74+2eusQDtsbnVSji+P6xbvfjY18RiNR4YyZP/?=
 =?iso-8859-1?Q?l9QWngqiylHYOWg0FeK1s9BYcJiyhbYWKw9EP1kJHUrh/Kj6tupcVT80AI?=
 =?iso-8859-1?Q?JYRbLWAsV5TwoVLvKbxc95Lz/n1ShoWFbV2ClNP+XysoGFCMhtWJ3vcKMN?=
 =?iso-8859-1?Q?AA9iWmedOWB/4rtX/PkSrNbUIbFR5C3fUriD6YKHlgS1dKQjCObM8XpXcs?=
 =?iso-8859-1?Q?w7GXQTEtl88kiLJtnBFmFMtPhpPk7vScPeZz+J26XgXzUHU0v5/czSsweK?=
 =?iso-8859-1?Q?bqBs5u6kmuTYzpiqxQpDFZdEJKF9zY5FJ/pD0Siabky0fiuZQL/xtd2X5l?=
 =?iso-8859-1?Q?ORATZ9uYGgiErZuvcaLnTC6nF6RudPlxer1i+1JDm3GEHbByXlR5M7+zn6?=
 =?iso-8859-1?Q?Q+Y1LBI16Gg2JLhRwTSTxfQePpnhKn3bvY5x4dGxeZ0zeV/eE3o+cgoC8W?=
 =?iso-8859-1?Q?u6QaLSgCMjG+hg9XjTOuCNCxvMHQsfA4Air2X6nDX43Tc9dzC1Dh2ZSaDk?=
 =?iso-8859-1?Q?DFSmluBOaWVu75/mpwuHxbyBIuIxc3Qs5C3rfNA37hbTJ2V9WDxdzDxMnV?=
 =?iso-8859-1?Q?LXycghfzyASXvBHh6qWnfTYKfrmp3UWeW4AKM6ZNGSub+WTXaxjnBBiFSF?=
 =?iso-8859-1?Q?hbbRvbkeXc+puEXdBRTDRz0Va1HbV4A=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 645f12f4-bd57-4f23-f05d-08dea0559c3e
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2026 09:57:48.6636
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NzirEGj5FKaYzJOhLPwA1GpNcxoP2eUjQk/u6vUu3jQKn0PJXH/8gPCY2WgRh3uoaY7FObsKZs9oAk5njiIWKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR03MB10597
X-purgate-ID: tlsNG-42698a/1776851870-0777AF3B-3ED51FD0/0/0
X-purgate-type: clean
X-purgate-size: 6015
X-Spamd-Result: default: False [-1.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,patchew.org:url,epam.com:email,epam.com:dkim,epam.com:mid];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Mykyta_Poturai@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:rahul.singh@arm.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[epam.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.990];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 1CE79444561
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Allow for removing devices from SMMUv3. arm_smmu_deassign_dev handles
most of the work by disabling ATS and zeroing STEs. Additionally, unset
the dt_device_is_protected flag and free no longer needed smmu_master.
Free iommu_fwspec for PCI devices only, for DT devices it is handled by
generic IOMMU layer.

Rework dt_device_set_protected to accept a boolean parameter, update
callsites.

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
Tested on QEMU with SRIOV series[1] by repeatedly enabling/disabling
VFs.

[1]: https://patchew.org/Xen/cover.1772806036.git.mykyta._5Fpoturai@epam.co=
m/

V2->V3:
* free fwspec for pci devices
* remove testing note from commit message

V1->V2:
* check for phantom functions
* simplify pci/dt device split
* improve error handling
* don't try to free master for unprotected devices
* rework dt_device_set_protected
---
 xen/drivers/passthrough/arm/ipmmu-vmsa.c |  2 +-
 xen/drivers/passthrough/arm/smmu-v3.c    | 65 +++++++++++++++++++++++-
 xen/drivers/passthrough/arm/smmu.c       |  4 +-
 xen/include/xen/device_tree.h            |  5 +-
 4 files changed, 70 insertions(+), 6 deletions(-)

diff --git a/xen/drivers/passthrough/arm/ipmmu-vmsa.c b/xen/drivers/passthr=
ough/arm/ipmmu-vmsa.c
index fa9ab9cb13..0648f9b407 100644
--- a/xen/drivers/passthrough/arm/ipmmu-vmsa.c
+++ b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
@@ -1367,7 +1367,7 @@ static int ipmmu_add_device(u8 devfn, struct device *=
dev)
         }
=20
         /* Let Xen know that the master device is protected by an IOMMU. *=
/
-        dt_device_set_protected(dev_to_dt(dev));
+        dt_device_set_protected(dev_to_dt(dev), true);
     }
 #ifdef CONFIG_HAS_PCI
     if ( dev_is_pci(dev) )
diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthroug=
h/arm/smmu-v3.c
index bf153227db..a46c421399 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.c
+++ b/xen/drivers/passthrough/arm/smmu-v3.c
@@ -1493,6 +1493,68 @@ static int arm_smmu_assign_dev(struct domain *d, u8 =
devfn, struct device *dev,
 static int arm_smmu_deassign_dev(struct domain *d, uint8_t devfn,
 				 struct device *dev);
=20
+static int arm_smmu_remove_device(u8 devfn, struct device *dev)
+{
+	struct arm_smmu_master *master;
+	struct iommu_fwspec *fwspec;
+	struct domain *d =3D NULL;
+
+	fwspec =3D dev_iommu_fwspec_get(dev);
+	if ( !fwspec )
+		return -ENODEV;
+
+	master =3D dev_iommu_priv_get(dev);
+	if ( !master )
+		return -ENODEV;
+
+	if ( IS_ENABLED(CONFIG_HAS_PCI) && dev_is_pci(dev) )
+	{
+		struct pci_dev *pdev =3D dev_to_pci(dev);
+
+		/* Ignore calls for phantom functions */
+		if ( devfn !=3D pdev->devfn )
+			return 0;
+
+		d =3D pdev->domain;
+	}
+	else
+	{
+		if ( !dt_device_is_protected(dev_to_dt(dev)) )
+		{
+			dev_err(dev, "Not added to SMMUv3\n");
+			return -ENODEV;
+		}
+
+		dt_device_set_protected(dev_to_dt(dev), false);
+		if ( master->domain && master->domain->d )
+			d =3D master->domain->d;
+	}
+
+	if ( d )
+	{
+		int ret =3D arm_smmu_deassign_dev(d, devfn, dev);
+		/* This should never fail because we already checked the domain */
+		ASSERT(!ret);
+	}
+
+	arm_smmu_disable_pasid(master);
+
+	dev_info(dev, "Removed master device (SMMUv3 %s StreamIds %u)\n",
+		 dev_name(fwspec->iommu_dev), fwspec->num_ids);
+
+	xfree(master);
+	dev_iommu_priv_set(dev, NULL);
+
+	/*
+	 * For DT devices the fwspec is freed by iommu subsystem, but for PCI
+	 * devices we need to free it here
+	 */
+	if ( IS_ENABLED(CONFIG_HAS_PCI) && dev_is_pci(dev) )
+	    iommu_fwspec_free(dev);
+
+	return 0;
+}
+
 static int arm_smmu_add_device(u8 devfn, struct device *dev)
 {
 	int i, ret;
@@ -1571,7 +1633,7 @@ static int arm_smmu_add_device(u8 devfn, struct devic=
e *dev)
 		}
=20
 		/* Let Xen know that the master device is protected by an IOMMU. */
-		dt_device_set_protected(dev_to_dt(dev));
+		dt_device_set_protected(dev_to_dt(dev), true);
 	}
=20
 	dev_info(dev, "Added master device (SMMUv3 %s StreamIds %u)\n",
@@ -2867,6 +2929,7 @@ static const struct iommu_ops arm_smmu_iommu_ops =3D =
{
 	.unmap_page		=3D arm_iommu_unmap_page,
 	.dt_xlate		=3D arm_smmu_dt_xlate,
 	.add_device		=3D arm_smmu_add_device,
+	.remove_device		=3D arm_smmu_remove_device,
 };
=20
 static __init int arm_smmu_dt_init(struct dt_device_node *dev,
diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/a=
rm/smmu.c
index d63c901551..4d2f71f152 100644
--- a/xen/drivers/passthrough/arm/smmu.c
+++ b/xen/drivers/passthrough/arm/smmu.c
@@ -825,7 +825,7 @@ static int arm_smmu_dt_add_device_legacy(struct arm_smm=
u_device *smmu,
 	if ( !dev_is_pci(dev) )
 	{
 		/* Xen: Let Xen know that the device is protected by an SMMU */
-		dt_device_set_protected(dev_node);
+		dt_device_set_protected(dev_node, true);
 	}
=20
 	for (i =3D 0; i < fwspec->num_ids; ++i) {
@@ -862,7 +862,7 @@ static int arm_smmu_dt_remove_device_legacy(struct arm_=
smmu_device *smmu,
=20
 	if ( !dev_is_pci(dev) )
 		/* Protected by dt_host_lock and dtdevs_lock as caller holds these locks=
. */
-		dev_node->is_protected =3D false;
+		dt_device_set_protected(dev_node, false);
=20
 	kfree(master);
 	return 0;
diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
index 06d7643622..76ae1e674a 100644
--- a/xen/include/xen/device_tree.h
+++ b/xen/include/xen/device_tree.h
@@ -300,9 +300,10 @@ static inline domid_t dt_device_used_by(const struct d=
t_device_node *device)
     return device->used_by;
 }
=20
-static inline void dt_device_set_protected(struct dt_device_node *device)
+static inline void dt_device_set_protected(struct dt_device_node *device,
+                                           bool protected)
 {
-    device->is_protected =3D true;
+    device->is_protected =3D protected;
 }
=20
 static inline bool dt_device_is_protected(const struct dt_device_node *dev=
ice)
--=20
2.51.2

