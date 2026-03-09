Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8MCEKT2qrmntHQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Mar 2026 12:08:45 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45120237958
	for <lists+xen-devel@lfdr.de>; Mon, 09 Mar 2026 12:08:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1249274.1546746 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzYTP-0003jx-WD; Mon, 09 Mar 2026 11:08:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1249274.1546746; Mon, 09 Mar 2026 11:08:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzYTP-0003iX-T4; Mon, 09 Mar 2026 11:08:31 +0000
Received: by outflank-mailman (input) for mailman id 1249274;
 Mon, 09 Mar 2026 11:08:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OAaF=BJ=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1vzYTP-0003iR-6e
 for xen-devel@lists.xenproject.org; Mon, 09 Mar 2026 11:08:31 +0000
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c207::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4d7eae7c-1ba8-11f1-b164-2bf370ae4941;
 Mon, 09 Mar 2026 12:08:29 +0100 (CET)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by PAVPR03MB9775.eurprd03.prod.outlook.com
 (2603:10a6:102:312::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.23; Mon, 9 Mar
 2026 11:08:25 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%5]) with mapi id 15.20.9678.020; Mon, 9 Mar 2026
 11:08:25 +0000
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
X-Inumbo-ID: 4d7eae7c-1ba8-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uOvZmtkZw3rwduwh2mSb8KdWHJwNlpBrMK/iYdDlDnYlHLyqMsDzx5cdCnz59SbRSfEWJecrTaJMdo4S2LTSj/CtJ+QWPhEzx++0oUR++ayKXZxlNTPINeqW64lhUTs8nQe32V8hX3sOsGjaFpQYUn6MBZE1zfK4B3X1h0ZtRspvrYs0/pPTHPAYGz3nQE990WSZV6QrI+oQAKE0W+K4Y58jIBHmf5qH16ahRTQ5yUrZGKDg7OZ5bheerl5Q/P04lgeHqA55HJ/W9lMpqxSKrfxZnLrN/F42r9ocRLZ9URIBIOZ1Nyvj+BdzJcTi/PdsUjP/Oq/ee6yvNAsFFUH9NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ORmtUgXQjDNdy0TrDi9teNyaY6deTFrWqE/Nuuy8jbU=;
 b=D2t0GIiQCe0F9gBVDz1wFuh6V4FFchw0jIP9RSRhQrcdzPjcDzK0l6vDOm9EAALLWWK7690wBjYdiDH3K/LnINZeAIXNa9DCvAtzJKudF+IZD75ybE0nHUPcB4ddGQVTh/vuhNVz3BgnC+qPQNLcKPfvE2dom0J/qCyb0dNYRRfrABpdlPPDkOPSn9bgp63dUxZMKKb40bomw6bxb1k+BCr9pKnz0QdoaDQBxaauktYxmGFYgB1gXaHmXPvAUDeaY4l6d3axBGSWjzLcmaRh1LWwtK4DUJeP2GghpSiaAJf9GSVmtJM+ZP1Tgp2a7ThK/LtU8FwCPr6x3EGEy0dNPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ORmtUgXQjDNdy0TrDi9teNyaY6deTFrWqE/Nuuy8jbU=;
 b=mLdF77Iiv3Dh69B7B6JBqVS3ehRzNWWifz4h/jrut9sNzrm4UwjNmqI75+wlQVApxDF4vqvPjVWkmFznvnPRcMFX3igwo/8+RfAMsGX4hvgRYPXWbvA4qH/sYeoWLeBhGy9EvGaqPB/km3wz3PtD1AlnxkjQBiEHcJmLMaRF6vHGwe2DAHDIpsLJxhi4idr6EYqcG8lMO6u2zIBo08SDaxxDnjIOiQ+S4RdkWRuJrUTTsrKNnb+3co6xjnT/xVg8VXG/RWkaM6h9Mt6AG1L3ydoV4YMLvbFMTv7h200AWPKqho4ylezOvpOWwyqtWHeU4P4HbSVqvmw2SBIM4wAYJA==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Stewart
 Hildebrand <stewart.hildebrand@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, "Daniel
 P. Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH v2 0/8] Implement SR-IOV support for PVH
Thread-Topic: [PATCH v2 0/8] Implement SR-IOV support for PVH
Thread-Index: AQHcr7UMVee0NzcPjUC5JqPDg9DN/A==
Date: Mon, 9 Mar 2026 11:08:25 +0000
Message-ID: <cover.1772806036.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|PAVPR03MB9775:EE_
x-ms-office365-filtering-correlation-id: 5cf795bc-6e92-4c06-21c3-08de7dcc2f48
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|7416014|38070700021;
x-microsoft-antispam-message-info:
 oNd6p/lsyul6TjMoRq1/BBTIp92yn0toBKalNsVPofxTezZ3RD43jcHUM0XW+P/NPmf2IhmkGhCDnZkPpprrcBeYDX1MUOj3gjPf74za80BhTY6gdbeSPLT9VrgABtpJOJPr1KXwhbT2LMXFTspl4a/gYAyBEpjk95aKq4TepMX4qyuzzhaukh9D02S7XoyhwabpAgEhgeZ7muZMDFQHJNM6ktKYWN+2J2L97rnBJeesEcbiOUqpFtXTMwbZf00SLA50WbkjBfq3mL4imySrmApsjY2EvLJ2OT0gcegbRALwJmdnKL3Msc0ihtZd3eXAcHR1wILtyMy44aVeLkQ0bDKFpnmQw8Y0WtxbpXuBEOEHRhGACYxD2fxrE53vjFvhTdUbeY2YLoJTzL4NgTqy006w2qgmch4Iud3gBLjY7PnUFX3ueWguRd5Blo2nqt9HgPQOyuuSytvhWysputZvBXjV3ji0BdwXcAD2KAvSbE2dRM7jufmY+HeTPWCV3hIGAI0Zzc6gUPcBlI6OZzcp14kLj0KNbCCeFKtBBLEcTzXhUaXFMqjcgxj20LyLHMVJMOiKsEHGtbvYYcUqGcxJAscvxvZMtovroR3fi8dKSjOYMVjHJwJaWJ13UjH+vJWBMimKeI6+IYZJYsQCrLZdfue2cC3nflJINCC6hRNsS3x1ZYjraTtNnWxZcIPNMJG5+fJ0WvvVpCMtfdXYB1E5b29r7QCfqXIeWVdNrfEP/YVJmq9csrsOHCuYt42DACcxcLoQ9PjjVnCL1MjZI/uV5YE1DNv5Y9zCfJ9jZUl9+uQ=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RDlveWxSVlNMZkJwOCtIRU9CejVLUmJHbjlubS9ndXVyYlk0M2VlUkpWZzZM?=
 =?utf-8?B?akpZWWE2ZVcwMWJ2aTJqQ1YwSTZJaHRaUWRMQkg2bEptc3JyUFRJYncvMCt4?=
 =?utf-8?B?QXFkclZqeC9DVnNZRUNoeUZSdDdkYVJNbWZkQnJhNE1UbnJ3OEZxQUZHNVVy?=
 =?utf-8?B?ZFQyZVAvTGM5RG1aTU55NHNTcmhWUjNoVHBuYzk2Qm9hTDlkZ3RBZlV4OEVw?=
 =?utf-8?B?UitGNHZIOVpuc2orQzM5dDBIMThTL3EyTlpsWlJsajN5RVNDbm9QeGtNZE82?=
 =?utf-8?B?VU9SdFdQemhKMzQwOXJXd2gzVGRMK0NXRXRUeGVGOVlOTW4vcUFMZ2RvcW5y?=
 =?utf-8?B?YkczZTM3d2VyRktJSWdYa1ppWkZJcW1kTlNSTmZzSktMNHlyNWpIY0Nyei9O?=
 =?utf-8?B?OEJDdGEyU1lEVGlZK09jY1lISWNrYUxvRVBaNm9zN2s1Zm8vQlUxVnFRTFhw?=
 =?utf-8?B?ajJDdXdJdjFURUdFWHREMjliaEg0N3FLQ1dZSFJFbjZqTjZTeDlzZTFDSXZ2?=
 =?utf-8?B?TXJTMDBHbWplWFRuMm1MVFZ1NFNVOU5pZ2NXakdWNTEwcjlZNGUrd282U2Zk?=
 =?utf-8?B?LzNGY0ZQTUJ3KzhCYjJIR3dhZ0hJNnRjRE41QTdXZjZjY3FhVGxTcjZPTzdL?=
 =?utf-8?B?M1V3S3dtbEpvT3c1QkpBaDVaM1RTZUVhS2t1UmxWUzdEOFJVQTgzSEtDa21G?=
 =?utf-8?B?b1I3NnhIUTFHcHM1b0p4cFpXZ2h4ZkdkdEdKTzU5cEkxbVI5QUFERTdqenpn?=
 =?utf-8?B?MHRhRWdjWXFCVEp3bHNxc2pEcmZQeVdNSmF3MWVoOFlVUy9reWlwY3NNWlAz?=
 =?utf-8?B?QWNZT1ZlU0dTQzNlL3E4VzAzdDdmaGpQcWFDN0ZqREQrMCtXNXFyNUVuOFh1?=
 =?utf-8?B?RTZSc2tidVcwV2hWOWxHUkxCMEY2WlRMYTY0Mkg4ZU1yVGRNSkw5dVVaSkpF?=
 =?utf-8?B?b3VoVEtKc3p5VzUvNU1uVXhmMWVaYVRjM3VXWUdKSHNEVTNZOUVWZjdxNnlj?=
 =?utf-8?B?Z3pKMmQzc0plSmUwZVNGNUMyRXlvMDk1alkwV3d2ODI2bjdwcEZ2cFdyTUN3?=
 =?utf-8?B?dlgxTjNBdVZNZzNxNEF0d2wyUkpKWlBZRExhVnlrUnAvY0k5MmRoMWcybFpv?=
 =?utf-8?B?KzI5SDl4aGhKM2xkVVhwdmlpaDFTekc3OXV5eGdQNTk1VEdIUm9KMzlPQzZl?=
 =?utf-8?B?NmNabVFxWkc2a1RNM2doT0xla1E2VkMzOWFKLzh2YXR3aVVGY2pSZWE4WmlH?=
 =?utf-8?B?TkJHa2syZTF6QXBUM3V6TUVPWFJIY3Q5bG1mL0pIT0VOSVRKLzM3NmdPbjNC?=
 =?utf-8?B?cXNWMG8xUndPWnlSR092ZDdEU250bVpSWjNQSkJoS0t2aStrWStza3Fxd1c2?=
 =?utf-8?B?cTJzSDNnaHY2bEVINU4xaW1SNnVsWC80empENTRtTEZnOVhKa0RDeU5rS2xI?=
 =?utf-8?B?dUlFcU01WVhSNTQrWDJFZDlpenY5WDUwN2tocEV2YkFxdGR3ZStRSi9vRE1Z?=
 =?utf-8?B?WTZ3Mm1JeW1zTUYrRWF3L2ZFdEczR1RTem5qTXFIRHg5d0thd1VELzd5amti?=
 =?utf-8?B?TGlSWW1yWEZWUWR6M05xUGxmZUNYQUJxV3M4dkNvNkJMQVdTVzhOa3VtcEhY?=
 =?utf-8?B?U0QrdGgxaXBOdk1sU2tsNjBQQWRVY0pUVndCcDhKTURZYzFzSHpNY3VWR0V2?=
 =?utf-8?B?blVJQ09SK1hWZXVGVmYvUVdkK3lYbm91dzNoVWo1ajRRMXFMWXZubUtQSFJv?=
 =?utf-8?B?NW1GVVlFQml1bVhwc2daOC9HSnQrTk91QWwrWjRhT0x2MDRDcURVZ0ZSMlA5?=
 =?utf-8?B?c2RNYU1IRTdWbHdCTXJTSDZSL0dXemFsTFhMS3lvcVg4d2tqcnNNeU9lMWpz?=
 =?utf-8?B?clh4ejZ4dEJIQnFmbzRLekQ3YWdhQ1kzSkhLTFdYc2Jkc1N6QVJraHJVOGlv?=
 =?utf-8?B?bWp1cFN2L2ZtVnd3aUJ0V2NuakdpamxzTVd4R0VsU2VNR2VhTGh4QVJGeXll?=
 =?utf-8?B?R3Q2bm84UkJyaVh6M2NmQmVHTWN6Sk5uU3BPZlBRZTVONFc1QXptcGF0dG5w?=
 =?utf-8?B?ZnUrZFArNHZyM3U2Zi9aNURZT3lIZmhlTjNNaTVpYmFpL1FiZWhtQTRFWGRq?=
 =?utf-8?B?NWVWakVodm9saFpYSXBEZlpEQU9QWkg3UXFFMVI2cktHS0tTZTBtbS9RL09k?=
 =?utf-8?B?bEs1Z3J2dnpNU3p2S09BOEhMRTZlbVJPL1h6c3BmM2grdkFYV0U3K2I0SVBx?=
 =?utf-8?B?eHZ3RTJZUDg5V2s2M0lyTXNsWURmRmdiQUZEVGErd3NOUFFhaUM1WE5ERVBa?=
 =?utf-8?B?OGY4MWROTWdjV2J3Sk9rMFZKZDlHTi83VTNCNEdsWUtlM1drcWVOakN0c0JG?=
 =?utf-8?Q?LyMr27A75TKP/H0k=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <354D3193A0109744899CF9AFFC908DB1@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cf795bc-6e92-4c06-21c3-08de7dcc2f48
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Mar 2026 11:08:25.2657
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y6nt577vE8zQeTQPWZxag4XXYexzkbFuA5ed1RAvF0UnWPocUuicf9p//vdYucy4BKy+l/UvYEtQiodd0ASELg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR03MB9775
X-Rspamd-Queue-Id: 45120237958
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.09 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Mykyta_Poturai@epam.com,m:roger.pau@citrix.com,m:stewart.hildebrand@amd.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:sstabellini@kernel.org,m:dpsmith@apertussolutions.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,support.md:url];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[11];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

VGhpcyBzZXJpZXMgZW5hYmxlcyBzdXBwb3J0IGZvciBQQ0kgU1ItSU9WIGNhcGFiaWx0eSBmb3Ig
UFZIIGRvbWFpbnMuDQpJdCBhbGxvd3MgRG9tMCB0byBlbmFibGUgYW5kIHVzZSBTUi1JT1Ygdmly
dHVhbCBmdW5jdGlvbnMgYW5kIGZvciB0aGlzDQpmdW5jdGlvbnMgdG8gYmUgcGFzc2VkIHRvIGd1
ZXN0cy4NCg0KVG8gYWNoaWV2ZSB0aGlzLCBoYW5kbGVycyBmb3IgU1JJT1ZfQ09OVFJPTCByZWdp
c3Rlcywgc2ltcGxpZmllZCBoYW5kbGVycw0KZm9yIFZGcyBoZWFkZXIsIGFuZCBzY2FubmluZyBm
b3IgYWRkZWQgVkZzIHdlcmUgaW1wbGVtZW50ZWQgaW4gWGVuLg0KDQpDb3JlIGZ1bmN0aW9uYWxp
dHkgaXMgYmFzZWQgb24gcHJldmlvdXMgd29ya1sxXS4NCg0KVGVzdGVkIG9uIFItQ2FyIFNwaWRl
ciBib2FyZCB3aXRoIFNhbXN1bmcgTlZNZSBTU0QgQ29udHJvbGxlciA5ODAgYW5kIEludGVsDQpY
NTUwVCBldGhlcm5ldCBjYXJkLg0KDQpbMV06IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3hlbi1k
ZXZlbC8yMDE4MDcxNzA5NDgzMC41NDgwNi0xLXJvZ2VyLnBhdUBjaXRyaXguY29tLw0KDQp2MS0+
djI6DQoqIHJld29yayB0aGUgc2VyaWVzIGZvciBWRiBkaXNjb3ZlcnkgaW4gWGVuDQoqIHNlcGFy
YXRlIGRvYyBjaGFuZ2VzIGludG8gdGhlIGxhc3QgcGF0Y2gNCg0KDQpNeWt5dGEgUG90dXJhaSAo
NCk6DQogIHZwY2k6IFVzZSBwZXJ2Y3B1IHJhbmdlcyBmb3IgQkFSIG1hcHBpbmcNCiAgdnBjaTog
YWRkIGEgd2FpdCBvcGVyYXRpb24gdG8gdGhlIHZwY2kgdmNwdSBwZW5kaW5nIGFjdGlvbnMNCiAg
cGNpL2lvbW11OiBDaGVjayB0aGF0IElPTU1VIHN1cHBvcnRzIHJlbW92aW5nIGRldmljZXMNCiAg
ZG9jczogVXBkYXRlIFNSLUlPViBzdXBwb3J0IHN0YXR1cw0KDQpTdGV3YXJ0IEhpbGRlYnJhbmQg
KDQpOg0KICB2cGNpOiByZW5hbWUgYW5kIGV4cG9ydCB2cGNpX21vZGlmeV9iYXJzDQogIHZwY2k6
IHJlbmFtZSBhbmQgZXhwb3J0IHZwY2lfZ3Vlc3RfbWVtX2Jhcl97cmVhZCx3cml0ZX0NCiAgdnBj
aTogYWRkIFNSLUlPViBzdXBwb3J0IGZvciBQVkggRG9tMA0KICB2cGNpOiBhZGQgU1ItSU9WIHN1
cHBvcnQgZm9yIERvbVVzDQoNCiBTVVBQT1JULm1kICAgICAgICAgICAgICAgICAgICB8ICAgMiAt
DQogeGVuL2NvbW1vbi9kb21haW4uYyAgICAgICAgICAgfCAgMjQgKysNCiB4ZW4vZHJpdmVycy9w
YXNzdGhyb3VnaC9wY2kuYyB8ICAgNiArDQogeGVuL2RyaXZlcnMvdnBjaS9NYWtlZmlsZSAgICAg
fCAgIDIgKy0NCiB4ZW4vZHJpdmVycy92cGNpL2hlYWRlci5jICAgICB8IDIyNiArKysrKysrKyst
LS0tLS0tLS0NCiB4ZW4vZHJpdmVycy92cGNpL3NyaW92LmMgICAgICB8IDQyMCArKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrDQogeGVuL2RyaXZlcnMvdnBjaS92cGNpLmMgICAgICAg
fCAgIDMgLQ0KIHhlbi9pbmNsdWRlL3hlbi92cGNpLmggICAgICAgIHwgIDQyICsrKy0NCiA4IGZp
bGVzIGNoYW5nZWQsIDYwOCBpbnNlcnRpb25zKCspLCAxMTcgZGVsZXRpb25zKC0pDQogY3JlYXRl
IG1vZGUgMTAwNjQ0IHhlbi9kcml2ZXJzL3ZwY2kvc3Jpb3YuYw0KDQotLSANCjIuNTEuMg0K

