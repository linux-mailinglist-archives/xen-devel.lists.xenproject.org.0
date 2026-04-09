Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4BNBKmGx12mxRggAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 16:02:09 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5213A3CBB81
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 16:02:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1277475.1562686 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wApwx-0004xU-NX; Thu, 09 Apr 2026 14:01:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1277475.1562686; Thu, 09 Apr 2026 14:01:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wApwx-0004lY-D2; Thu, 09 Apr 2026 14:01:39 +0000
Received: by outflank-mailman (input) for mailman id 1277475;
 Thu, 09 Apr 2026 14:01:37 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykyta_Poturai@epam.com>) id 1wApwv-0004Kd-D9
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 14:01:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wApwu-001xw2-Nn
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 16:01:36 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 69d7b13e-bab6-0a2a0a5309dd-0a2a4503d692-8
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 16:01:36 +0200
Received: from [52.101.66.135]
 (helo=DUZPR83CU001.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 69d7b140-02b3-0a2a45030019-346542872ee8-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 16:01:36 +0200
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by PA3PR03MB10964.eurprd03.prod.outlook.com
 (2603:10a6:102:4b2::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.42; Thu, 9 Apr
 2026 14:01:34 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%5]) with mapi id 15.20.9769.016; Thu, 9 Apr 2026
 14:01:34 +0000
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
 b=CFIsQP8lMB7NjP4Wa4osJkF/SMG6LpglWMnEA+Tn8hfTTsPrZwKC0jszTdW0a6C8QDjqXRwTTVjrgZ2fyyqbnfDILa//ychWpD+AmFaR6F2GvA5yYvP4LgGK8l+r0NWAyGeEa79a+F057NZezV4VZHtKbz6euNyJP0IAp/RKv8sGsDElTmALh9C3iUNUGgfP0xvsuFuvocwXvBDgk4OrhFHowfdFuunofcn0eWLd0+/hj/yBnwaNWeLbAVUNoF1hedBGaRHBAV5j+oHlaP8880vRHcSOJ5ecCgLlodnaF6s1qOZIrRP7UaoHRwVxj0AbRUUkdhdUilHL4aa5CcoICw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=98O9tjNO0ZyAg+iIvonlDRg03kkEWulLxNl1NsKdKko=;
 b=lbCS+74MRPC0j8U/BPCn2UqTjuOcHQfbyPRtiDkw7HFyld7ml9OnQo6mlT5KwlTGPlSEKqKVODHn6HJM7iJ9bdV0h6mnvEaNUvNfBxg4tDcxFNOqtQLiKjOagN60MvI4LfUhRs798sbRgYHE6Fq+jdLuWtJy6WGrvD6gV6MesmXV8u4OLbCQIkDH27M+wacC0DEY3Je+SKSMabJ72XlkbSy027ab+98vRunHSyqFrNkdEOW9fNoVqx/iyPX5ptyw1Pv1F7+TLUhNBI/anmWBk+unGHqEE3ilg1iQiPXei/EPWa9x0YorabPYoEg4Y1dosmFFeFqKJfNy5n0/UMv88Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=98O9tjNO0ZyAg+iIvonlDRg03kkEWulLxNl1NsKdKko=;
 b=pw1tQiWlj74LD3Dt2PH3dQ8qjSt97RfqAZezhSUGi5AbbMu+hGMSZOmFBtJ2u0Z3jiujlQzdOTPHP0gQ9gCYLU6/Ad8RHTgXorPXv7/X3/Q2jxgq4ELEEvde3IpZe2MOqVlwqYfnGTpsk+VSbEJPYvZf4LvR0jNJa519N9EodYK5CrFFbBnHz9K10L4kk6s3GOSPh+VFuKWclESfzN9PdOwUxHH9/efkyc59YdziVLLQwbh/uIumirT5mBh57w9AodwNV3llbMbm5V4i+nd3ncVoXL8W+2IJPHJz117m9EhGE8hbDf7xUD0YOhQmXrLxLEMzHIwEqzsNrGMlsulvSw==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Mykyta Poturai
	<Mykyta_Poturai@epam.com>
Subject: [PATCH v3 6/7] vpci: add SR-IOV support for DomUs
Thread-Topic: [PATCH v3 6/7] vpci: add SR-IOV support for DomUs
Thread-Index: AQHcyClgJVtVkM11YECyJKBoUo8yuw==
Date: Thu, 9 Apr 2026 14:01:34 +0000
Message-ID:
 <1aaf1a087ca0003d943d43c55500b3ab84195cf5.1775742115.git.mykyta_poturai@epam.com>
References: <cover.1775742115.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1775742115.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|PA3PR03MB10964:EE_
x-ms-office365-filtering-correlation-id: a5dadb01-ed72-404c-024e-08de964082b3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021|22082099003|56012099003|18002099003;
x-microsoft-antispam-message-info:
 ZmX5U1e3mmsxRV7SYz2jHD4E8k6hTOp8RI5QaJmjvzT2/MMYmh7JH7caE/n7KK6nyklY9w2afcr4WDBdMhklurB1gyy0M55fZIhNV+6ii0vgoy5BZBGjFxrpXjQnXqexK17OPlKbJY7JQ11McU3FCGCwcwgseo+rPku5sHuNzKlaSveEnULUnVjBmWNceFJqTmOag1tTnyFLZzJJySFzJvXsVN6de+R2/rCQcLkBRC5SFROZJdo+pq70D+8ZUIXGDLM1p+zr0iX92nb1tbfrc6wiSQ7XLWdX6+agG7BTvvGWu31E9vrS+MEkFVzHINhzefu02acLH1Dwn0PcmZjROV47pm3PShuepQFSMVUy8ZaErlakXCIQaVVT1i9R4kLc9kcUta+uXlnpoftXHE1yuEmuJ7ZJxKfQ4e6ctOTdUfJ5j2vKCTcODQfdjVoUtdrVW3yTESefgQyDW7l850d9/mZFOVeyKYkc08lq1s2+8h1GQ/YQ7Pj2C9079QvuPJbuLP68WqaJggPNiPtQW1cOjUqcs5u5PJKb5D+ivsvcyZoI3H++6ByxRPayGOMv4vAQbCPgv8rSYA1UITMuRzHiw7dMiv24l2KCJlQXNkeHhfuOZ2sNCULvkGlW/0jiIrISFx7WiQ7Ue6UlhHsnEpzCxFPrP95R1wRHD5QVE56YcY7MEUOZuCVt7KjwG9W9yTwY+FpAmNK70+G6EGMdRCm5mvvzucuaAFVSR4LoMQIRaO9feoS3w7X6Cf9WA4tMCkNqbZaJYq2K48JVETOJebTFwgT75IZ8b7GYw0KIFny6lUw=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?mkMra2oLNjgy2U4shXxzBATFWQx3sxC5fV9WtsMp2+kJ8Zy0GVIXwlVvpi?=
 =?iso-8859-1?Q?BHYjb7OOJBpLhVaayKctX+CTtN2B0GezMWMxcGKaw+PRodfwE3TkY0AE0l?=
 =?iso-8859-1?Q?C8Ud59uEVg7f30Uzwiwuk0y/cP7nZUY8DhDXq5azpdIEGpKGR4s/9WDaes?=
 =?iso-8859-1?Q?Mkmxjb3qKXhou+p2XSrqJnaywHZC905201SkjIeVC12CykHo5YOc8gTCq9?=
 =?iso-8859-1?Q?ARO/K3VDbU1f2h3mYMZRNfgWn+qzXE3wCbbz7I0nroLYt4OXg/sMK56xAS?=
 =?iso-8859-1?Q?CLaMBrQuUDjp4UClfjZ9WvKRe6t1jR4supPga0xrs0Ijy+AH2N0RkT9L33?=
 =?iso-8859-1?Q?mjMvfCP5Cfh1opPrQ87jpxCaN0UzOCR0j9px0+rg0ABR8aWmeAotD331u5?=
 =?iso-8859-1?Q?GgG3HzMZcQ1EeB0nMUDAZt/6LD/LVgJtY+AUNYvabEOY9KtNHQRAK2EKfG?=
 =?iso-8859-1?Q?0icn1m9Ji22vcbAjzHZ0Wgyd6yzKJ8jtl8/55HUNAQ0K6BOxNEJs055sJC?=
 =?iso-8859-1?Q?rKd/U58PND9/YobL2iA5N/tPexxa0qYyXkoz2BFZ/rbGSDeMYFjK0KaL03?=
 =?iso-8859-1?Q?XdANqo8YnkxFQaBcJ7/kDOgsOVsykABPeQ0CjgJ2aAWDg0mfRpF3LkJ34c?=
 =?iso-8859-1?Q?ONIWrMHvKFh9tFlPk9oU3sVDdCjP6hy50hd0RRo2WucGQh6tQAiqrxRxT3?=
 =?iso-8859-1?Q?5SKaWAhyQRry9UQNM/zCNEWre6T84oyBfnfVfsZA64B+ifTdP+pPLqsOTP?=
 =?iso-8859-1?Q?kBqHHdGYYPspUXERRHd4ubGbrCY3L4hE0CYR0q9G7DoMPqd+q64Fn+JHd3?=
 =?iso-8859-1?Q?BKbvx6O0lLUjGNfn+AGq6Syr/n8fyHFqTCJWT1Drpxbvpk2u/qxiB6Ju4Y?=
 =?iso-8859-1?Q?/9jAGI/Nh7eTLVAwCJjuDdpe/hWCtwMuss8rAYLl3aegk258r2PxDRzVr+?=
 =?iso-8859-1?Q?wZZarxhuagyefPzk2SJftXy8D8RrNzUaC+g9FoMiqeAchga0d0zt9Do9XQ?=
 =?iso-8859-1?Q?UmA2z7TJ0sqR+TbFIDtAIsixwq2+xYOKPGbhnqMQ1mWxCFH1wkaxbYV323?=
 =?iso-8859-1?Q?vpFpcrsB5o9Dt8z1KFCwABXEu8Dc5Q88ruINLqBKIgtj4E0EGFwmKadls2?=
 =?iso-8859-1?Q?d5ebo5Fv6aZObAnmzCS9UuOhIrcZTKTXyyGBEZTqCRs1fr7+roEPSDJFWQ?=
 =?iso-8859-1?Q?5a3rgUlgmeIh0U46B1TBsDjYlyRLLXroAZnYEDRkWmYPqhrLIgxhGzG3Gb?=
 =?iso-8859-1?Q?K0IEyn2+RcxGgwjnQymrSY/oaSlwnIkCBAL5k619SJ13Aj4t40dErhUaXE?=
 =?iso-8859-1?Q?beOWXgDYsSA4mnB58gl/9Yq8bgKXpOpil9A3/E2SZxkIDBapQO4d4wPan9?=
 =?iso-8859-1?Q?gc6cLkwKbq/r5o4L9XF9mN5Lc56Jv7apsd/CeNxbmFNi23Q0V3k6h2/OI5?=
 =?iso-8859-1?Q?CeNnHCO7v3z7dKn7v3O49jwdTTptiTaDL4ShikUUiRk/fO7KQF0JDbSY7P?=
 =?iso-8859-1?Q?gItIpKoh7TOFJU9960HSOCXu0mWUSnPi8XnNOR9yA/DKRs3v52SGt3/AzL?=
 =?iso-8859-1?Q?F7N39qWW8NlmT/KYQ5y61RdvaVZKyml0ARqVEXYlIeuxCG1QphiaftYuoA?=
 =?iso-8859-1?Q?x+tO8LgZqbaQlIDBPIVPpl6Feyz7UHtYo06UgdWoYTDa2fw2bUEFrnYdg4?=
 =?iso-8859-1?Q?PRbSSYOXyXeaIMjoCEmyYDfcIumTGX6xLwZUZcMA+4PM8UnpV5+uyk+9Iz?=
 =?iso-8859-1?Q?ltgtdZyTwgzFPd4funjN5Cr162/tI5Q41QV/SRH1qqOokIwpKqpGWgaBke?=
 =?iso-8859-1?Q?ZIg5b96RzQ8TNukSI6oIMlSO0esMvdk=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5dadb01-ed72-404c-024e-08de964082b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2026 14:01:34.6597
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xc4XkSyo2nbA77++RX3g6Gfgxb1TsxTYBD5Y1tuk7/8+ygXYkkd23AxMny3v0/aJPfPhXQAzg7kbNakZQH6xeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA3PR03MB10964
X-purgate-ID: tlsNG-33051d/1775743296-C9D3CC9A-6EB0357B/0/0
X-purgate-type: clean
X-purgate-size: 3434
X-Spamd-Result: default: False [-1.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RSPAMD_URIBL_FAIL(0.00)[epam.com:query timed out];
	FORGED_SENDER(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:stewart.hildebrand@amd.com,m:roger.pau@citrix.com,m:Mykyta_Poturai@epam.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:email,epam.com:dkim,epam.com:email,epam.com:mid];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 5213A3CBB81
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Stewart Hildebrand <stewart.hildebrand@amd.com>

Emulate guest BAR register values based on PF BAR values for VFs.
This allows creating a guest view of the normal BAR registers and emulates
the size and properties as it is done during PCI device enumeration by
the guest.

Expose VID/DID and class/revision to the guest.

Note, that VFs ROM BAR is read-only and is all zeros, but VF may provide
access to the PFs ROM via emulation and is not implemented.

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
v2->v3:
* don't emulate VID/DID registers
* replace ifdef with IS_ENABLED

v1->v2:
* remove VF register handlers covered by init_header
* set guest addr unconditionally
---
 xen/drivers/vpci/sriov.c | 52 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/xen/drivers/vpci/sriov.c b/xen/drivers/vpci/sriov.c
index ec6a7b84d5..b43a2b26d3 100644
--- a/xen/drivers/vpci/sriov.c
+++ b/xen/drivers/vpci/sriov.c
@@ -211,6 +211,58 @@ int vpci_vf_init_header(struct pci_dev *vf_pdev)
     sriov_pos =3D pci_find_ext_capability(pf_pdev, PCI_EXT_CAP_ID_SRIOV);
     ctrl =3D pci_conf_read16(pf_pdev->sbdf, sriov_pos + PCI_SRIOV_CTRL);
=20
+    if ( IS_ENABLED(CONFIG_HAS_VPCI_GUEST_SUPPORT) &&
+         pf_pdev->domain !=3D vf_pdev->domain )
+    {
+        struct vpci_bar *bars =3D vf_pdev->vpci->header.bars;
+
+        rc =3D vpci_add_register(vf_pdev->vpci, vpci_hw_read16, NULL,
+                               PCI_VENDOR_ID, 2, NULL);
+        if ( rc )
+            return rc;
+
+        rc =3D vpci_add_register(vf_pdev->vpci, vpci_hw_read16, NULL,
+                               PCI_DEVICE_ID, 2, NULL);
+        if ( rc )
+            return rc;
+
+        /* Hardcode multi-function device bit to 0 */
+        rc =3D vpci_add_register(vf_pdev->vpci, vpci_read_val, NULL,
+                               PCI_HEADER_TYPE, 1,
+                               (void *)PCI_HEADER_TYPE_NORMAL);
+        if ( rc )
+            return rc;
+
+        rc =3D vpci_add_register(vf_pdev->vpci, vpci_hw_read32, NULL,
+                               PCI_CLASS_REVISION, 4, NULL);
+        if ( rc )
+            return rc;
+
+        for ( unsigned int i =3D 0; i < PCI_SRIOV_NUM_BARS; i++ )
+        {
+            switch ( pf_pdev->vpci->sriov->vf_bars[i].type )
+            {
+            case VPCI_BAR_MEM32:
+            case VPCI_BAR_MEM64_LO:
+            case VPCI_BAR_MEM64_HI:
+                rc =3D vpci_add_register(vf_pdev->vpci, vpci_guest_mem_bar=
_read,
+                                       vpci_guest_mem_bar_write,
+                                       PCI_BASE_ADDRESS_0 + i * 4, 4, &bar=
s[i]);
+                if ( rc )
+                    return rc;
+                break;
+
+            default:
+                rc =3D vpci_add_register(vf_pdev->vpci, vpci_read_val, NUL=
L,
+                                       PCI_BASE_ADDRESS_0 + i * 4, 4,
+                                       (void *)0);
+                if ( rc )
+                    return rc;
+                break;
+            }
+        }
+    }
+
     if ( (pf_pdev->domain =3D=3D vf_pdev->domain) && (ctrl & PCI_SRIOV_CTR=
L_MSE) )
     {
         rc =3D vpci_modify_bars(vf_pdev, PCI_COMMAND_MEMORY, false);
--=20
2.51.2

