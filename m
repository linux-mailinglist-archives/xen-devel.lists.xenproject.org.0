Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0PAnNTfOgGkuBwMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 02 Feb 2026 17:17:59 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 665B9CED1C
	for <lists+xen-devel@lfdr.de>; Mon, 02 Feb 2026 17:17:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1218877.1527766 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmwcR-0006hK-Fg; Mon, 02 Feb 2026 16:17:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1218877.1527766; Mon, 02 Feb 2026 16:17:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmwcR-0006bo-8f; Mon, 02 Feb 2026 16:17:43 +0000
Received: by outflank-mailman (input) for mailman id 1218877;
 Mon, 02 Feb 2026 16:17:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hK3N=AG=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1vmwZi-0000fY-2q
 for xen-devel@lists.xenproject.org; Mon, 02 Feb 2026 16:14:54 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4b61fbbc-0052-11f1-b161-2bf370ae4941;
 Mon, 02 Feb 2026 17:14:47 +0100 (CET)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by VI0PR03MB10299.eurprd03.prod.outlook.com
 (2603:10a6:800:202::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 16:14:44 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%5]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 16:14:43 +0000
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
X-Inumbo-ID: 4b61fbbc-0052-11f1-b161-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G6nuLztQ/wdM36eWAmOnG1il8adpcVEBSaTxxCyQPXRPvvw3S/Rma870p33t8xzNZ74XazSDMObLjDatNjuSKkWCCGDcntzYLpPN2Lf1Hqa0NQEo/p7pRKvGB0kMp4qdv3SStlNkkzN8lfABg4BWN43AXeWy2toarZSw5aEy+sXbwKCWaUhMKK1m3rfnD7x2/UmBw+4KSk0A6fsFdL2o1sWSPvGlrvRfSr30kas0Gf5tBxaJ2jWTDUflSEG5kcC4f31n3+mFONtGjzelGnQz/vqoIqEqbDK+Wtl84zBRVQhv8E9OWnZxSuzfItQ84vq5EMlAi3RggyUL4Sp5uLn2IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WRSDgXVxXnkwAo7J3b+c0zIiiSWvTsWTE54wMalFVxM=;
 b=hRmt9VygD8ZUhkssAqlvZWTT3Gb3HQGSXL1xZYeB4eVQqoZHrP9OOGsW8GsIZLb9XC/TOIXwtxRxq+4JNse06TDVPsdqqjRhwTxUIEEC6jEgEI3PCm6GkzviFcNXHbnzCE/Ha7lg5XTqUF2bM90AGnEvuZBW4/AT792IRHhd0gerBfG8IPVX0HoU8w0QtFHSvIKgr6abxEwDMjQTzq09ArJ2yRUoIYJiGwVMriAUi5Vptdh15nIQ5WW7p6GQMuxB3e6BmEBK+OBS0X5xfHGOQu+TzsQlg6kz95aAx3y0YTjCIChERsUzpXqeyQYTBW0s5eMx8KJ9t1GPak3cVACaBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WRSDgXVxXnkwAo7J3b+c0zIiiSWvTsWTE54wMalFVxM=;
 b=Dw6bAghNE+oFGhCYbxVLDwQMODjzMU+o9er5AGY5zKbsWFvhrvAaxmvoQzOlePla9UrVWbLUR+oBM7yZJ3+0BZpjUVdVUH1P/J71leS2mqzfRAO164iPEUZlQjoA2PHryWXR4ClZNkjOAHaTQiJRrWMjHzQS+RypuPqMIEOxeYl7Ybu3IZxBtoLjN1dxB9PKMquXkQ/nnltB0DghLPhIyXNhlzGySTw0l5c0IQXpAPmrIHzVkDwu3rdAEowra6BAtXAt3F88jr01QPTMdd9MoRiiial6b5NwRzikA6kcQ3HMjA+Py1XvzEc/RCXDwP+Z0FmQAEmYjAUvFZjobJPRVg==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "xakep.amatop@gmail.com" <xakep.amatop@gmail.com>, Mykyta Poturai
	<Mykyta_Poturai@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: [RFC PATCH 14/19] arm/its: VPE affinity changes
Thread-Topic: [RFC PATCH 14/19] arm/its: VPE affinity changes
Thread-Index: AQHclF8KLzy5RNi6mUqjbCAyuDg4TA==
Date: Mon, 2 Feb 2026 16:14:43 +0000
Message-ID:
 <7cddaf16eb840dbd1480d7a1d6ddb0cbf0357113.1770046465.git.mykyta_poturai@epam.com>
References: <cover.1770046465.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1770046465.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|VI0PR03MB10299:EE_
x-ms-office365-filtering-correlation-id: 54576a18-9c90-4227-e258-08de62762d49
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?4jFWzzG0XDEZ+DEq5yoI+gLIV7U6cFLuvvdFrQUL9U4rxzpgJhyfvaTAtH?=
 =?iso-8859-1?Q?a+v5ZdCmGPG9Qp1jpfGXsYDTjiFoZN0bCaXE8N7nVqqvapQmwanE4fi6Yl?=
 =?iso-8859-1?Q?Gh1dtgqloS16YyHk2u7UtLkU+fvMQATjJgDvS3LFg73VIV9dNbq+gsCP29?=
 =?iso-8859-1?Q?kqrqW6JxAupGkYX6c0ILEbwHN/f4lI3vr+tWPu9IvGm0Czn9ehkJ5ErdrU?=
 =?iso-8859-1?Q?w1390xnbDNHBGjeX2dQbmBFx1T55tpgY1EYOzw9sfw5YqVKufbiW7k4L7G?=
 =?iso-8859-1?Q?ypdONFT/dag0p2osrqebcelMj77OOCAnT60/0DWFU1TQ9BgYujvKd5FU4l?=
 =?iso-8859-1?Q?kgisyKCqu0NrX0HJm8Nye97Kqq2I677/dagX5yM9LtY4N9yHkwAFZuxKz2?=
 =?iso-8859-1?Q?pRpVr9bOUgbkV+MEeMR875LI/dlZIRvWWgif1LAnL5rPB/TURdAOr0qgxE?=
 =?iso-8859-1?Q?C1p3znSHhIWwphrWzHzdSZXD8wmYSlNdeUYrdSHbMG2GybyGmp39sFfMrn?=
 =?iso-8859-1?Q?3U5AngpB3WGOtZ4VrN3HtVUPRhWhyCv7bUPcHtmdKXEi7Ihiyiyel9c0Rm?=
 =?iso-8859-1?Q?XGrRACSxRGIm2s4XdBIKncw65+r+JFz9hpICTjULTB7N5H0W0tKv45XeRi?=
 =?iso-8859-1?Q?2TwO2yTRLXti3xV/GdWT3COV9R7koxbkt8iGpDZqmrQMQjcI7qN3Rz9TB3?=
 =?iso-8859-1?Q?sVp9ioAu8CKSN7Q2Sb4hjNkyw/ClOrCpgZcW//4yBgYijY1m4a9VISTNxI?=
 =?iso-8859-1?Q?IHE9wl/7EEeuL7stGN5kD/QVW2j3RtZq7OvSwToEsj4KPrbxnfQjqUEeeg?=
 =?iso-8859-1?Q?k3ILBWo4Dg6sQ6tySRDJwTgCztPlRbiZKVXNI48BczpHGVh/4TIHPRN19x?=
 =?iso-8859-1?Q?cCIRS8vlTAkGkiB2USvmQcX9TKqX+BusSWXrOnShojfvfPtu0dZzLN4AnR?=
 =?iso-8859-1?Q?l+vSNSbTsVFAkIyBF51Ez4Rs0KIy2FF7VcT4VVEffkeZKgiP/YrUw48jF0?=
 =?iso-8859-1?Q?LcmQGpNkZM01blSH0z+7WAh2OJbnKTc4/KtRnLwW0tSqhTE92G30Whq4QU?=
 =?iso-8859-1?Q?NbGJZye5ArrFOMytHMV9l/KXZKMzkq0u0E07stK7A1BoSd9nSFpGEEQ/ei?=
 =?iso-8859-1?Q?qd2S/bx0JrDE/Prpp0po7b8TG+bw/OSBgmYjirEPrF1ulrM/iWR6+7w5e0?=
 =?iso-8859-1?Q?0OemqG8cU3j/PRgBhs87w3K3j3lD+IZLIigJNDyGdmawruxgspcjbD/rzt?=
 =?iso-8859-1?Q?PM04I+RY/JGCj7b8+wZy5i27PPtcx0WGlKeHI6PhQIznkRFls3EbnyeUA4?=
 =?iso-8859-1?Q?+wlx70JVMJyNPGawknJj9fOH4EUDrS2KCjaDDSoTozbG6HOdN/XRD25jES?=
 =?iso-8859-1?Q?O6cC/CfuV5vMYVFszYMSCj7S6UJzMlerlY7wTLZwPmsRhDD9XFTghKlK5M?=
 =?iso-8859-1?Q?7ZuN4QaqzypYit+AiU2u8f3jJoC8iJKf5sei1J3MJbm6ndRlhaX2URgCuI?=
 =?iso-8859-1?Q?LgibsW+9iuHDvIp0LLaDdJM+6W4BTxQ8SlrRq7dAM9NxboBLIXMM/yx0nI?=
 =?iso-8859-1?Q?ugji5M05LojtoU/YZq1ZVBhHqCVHYr2JmVOYuS6aOLhsGP06sr71sbZQ6Z?=
 =?iso-8859-1?Q?aaLcFc8JYRT/k5nKM86tNPyUXHoSLxxpRS6phaijE1LL+sKQsqzD8jcqjH?=
 =?iso-8859-1?Q?8dGb5rzv3dbDFXg5BNQ=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?DRWdAeMp/ZkQscPQ7aTMo3M4jqu95vhwagDWLgKa1oO2jZ9gzZrEV4b10+?=
 =?iso-8859-1?Q?KTBUL+J6a/e7Pqsul2EZ/O3o+bUkSTiuJQkYedJOSxzGvJ9O6pilcOSgI1?=
 =?iso-8859-1?Q?mSKyX+sryegL332BIpcrjS5HE5Sts9nK1+wq31Do2YK1XrUSAtk+M3HYg9?=
 =?iso-8859-1?Q?Mrpnh/gviiCmtG7QIdtwNj6eKG4QjrAdNW45x87TcjL2l0WtWu5+dAf1fu?=
 =?iso-8859-1?Q?eI3VR0vG+2CfI43tLqbfiEXgQtfrY81LWBAAPAFH14f9v4Sjw/ae30jD2N?=
 =?iso-8859-1?Q?wZi2dwQVHjh9WjKHRI7ApHmKsluu6eXSCArP+irjVKRtcPDy13M4r9wifG?=
 =?iso-8859-1?Q?FVJnqDvTpoc7IWqnRE6vb7AHy+YkMwFRt1v8ids69smAbwGh6ktH1bBBsX?=
 =?iso-8859-1?Q?vG0O5lhr1kg3G3MiNcHW4u2jpw8kg07rdz55jWza6ssi16GitC/If8NdXq?=
 =?iso-8859-1?Q?6f3DIK6H9H/oqv8XXIcQjyvYucMX7klAa0C0CgB8LQPtHkJAwyepfuI028?=
 =?iso-8859-1?Q?KHzsInpqvtynFhiz+PmRJiPCPhNHCh30s0blp7O46h+Ujb6YLe5mW3VIAI?=
 =?iso-8859-1?Q?S8ngKN1gbvpdiuDglyG7jDJlJtCBKGVq1bIbsh4PiF2qyflCbPrLYlQyOY?=
 =?iso-8859-1?Q?jQjiwciwVDc7F7abNkLzgF9BK2rdJxm7UkYMAb5g1OU3rxKV/qscQQPqmm?=
 =?iso-8859-1?Q?ZwkthovFFkeqNyBBYzI+W2RRv9IT++jTW9EiGTcmY+liSTWYSqlKSVa3db?=
 =?iso-8859-1?Q?P1IZ5S/bqrGGv+UGjcvwC9Ulac1sPhrUxg5r7Lzm3WnLkjU1L7HPRbMuc4?=
 =?iso-8859-1?Q?tfriq7isKRj0RIk76XrXCFdYmbszLDNRFV6B/LEDhZmTBtaCome2bdvg3+?=
 =?iso-8859-1?Q?9nGoAFtNgdLiD48suTk7w2/RjJVH5ZsB55cgA1snSi2Hm7bksaPpcYtk6j?=
 =?iso-8859-1?Q?fDD8WIthBtU1QfDqHqhE8oQZcHKdcV5vukMsgYhKnl7bkSPbwImsXzWuB1?=
 =?iso-8859-1?Q?m/blNKmuxyL5Zf2bGXXuQ0hx8TSzAUoxP7v74Os1ZNJtiJeWnajGJ4wCcm?=
 =?iso-8859-1?Q?C1SntpcWTou94TXb0/ablrIaoEO9uJwDFajtzup/yRqvIN1fgLPV319Hz4?=
 =?iso-8859-1?Q?GAf95Jw7iYjyJp7jLNtgNNVP31zNgQi4s+0hYAv0CX0m9T8Bph3OQl+k7+?=
 =?iso-8859-1?Q?rymgg92QGfvo0KSZ6PCGAAXdpK+sAvaZW3qWlbJw1RElx6K+y5xFhYHvCk?=
 =?iso-8859-1?Q?BiiYnNw/IJDaE3I/Vtv1n+EQLKEoRVaMszlWfwuFakG7qehEP62i2aPmDM?=
 =?iso-8859-1?Q?HBGqkr3lfiKLDZLG1VHx3EE0pySP8b+s5iIzNalGF2d5Ik2iW9t/Y3rRH4?=
 =?iso-8859-1?Q?3QC+rS8kjID6697AAv6huxM3Y+fFhHwuixyPIjLpNv8OvpA4oaK/eXMX2e?=
 =?iso-8859-1?Q?Zz8rsHPq37kxLK06XYJy8bGhclKBfnK+BvldLxV/iZkvDfkjGghJSXNMEl?=
 =?iso-8859-1?Q?ZBUTsCnykc/epBuXR0ozg31yD25DfTsk9afX7UvkKv1vnw+olTR4yc4j8P?=
 =?iso-8859-1?Q?/WP1mEkgWAEQ4Ny0SiXar8weImY/NamjHF+JTtSybkwHm5Rv82UzF8zose?=
 =?iso-8859-1?Q?3NMRluuwPDpfDw4xaA86AwlwD+BpGheHz6g0AUgB/fB4kLE/mGGOQPdD/3?=
 =?iso-8859-1?Q?Vi6utzMnuGptoqMXuM4FLDISe3LI4aJiTsJy1hdRs+JdoXddn8RNih+7tu?=
 =?iso-8859-1?Q?0uwxOqPDXOAD/BcLgO7CTSaN6/IPFD/ke7tvwG+QwuJWmGXrZC56X9iWRt?=
 =?iso-8859-1?Q?aaGZStZ13/T4YXE4CZunPp0PAWNXNyA=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54576a18-9c90-4227-e258-08de62762d49
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2026 16:14:43.0668
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ha2n/UlX+/AS/iMDNbdDPWxS8nRRupBq2fRLIvVcz25V9gg0he+XVGb44rG1omzQfGJCJ9poz6i0Re9uBlBnSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR03MB10299
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,epam.com,kernel.org,xen.org,arm.com,amd.com];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:xakep.amatop@gmail.com,m:Mykyta_Poturai@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:email,epam.com:dkim,epam.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 665B9CED1C
X-Rspamd-Action: no action

When a VCPU is migrated to another PCPU, its VPE affinity must be
updated. Hook into VPE scheduling to ensure that the VPE to be scheduled
is located on the correct PCPU, if not, move it with VMOVP command.

VMOVP needs to be issued on all ITSes in the system, and in the same
order, unlsess single VMOVP capable ITS is used.

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
 xen/arch/arm/gic-v3-its.c             |  55 ++++++++++++++
 xen/arch/arm/gic-v4-its.c             | 105 ++++++++++++++++++++++++++
 xen/arch/arm/include/asm/gic_v3_its.h |  12 +++
 3 files changed, 172 insertions(+)

diff --git a/xen/arch/arm/gic-v3-its.c b/xen/arch/arm/gic-v3-its.c
index fb1d2709be..be840fbc8f 100644
--- a/xen/arch/arm/gic-v3-its.c
+++ b/xen/arch/arm/gic-v3-its.c
@@ -31,6 +31,8 @@
 LIST_HEAD(host_its_list);
=20
=20
+unsigned long its_list_map;
+
 unsigned int nvpeid =3D 16;
=20
 /*
@@ -612,10 +614,47 @@ static int gicv3_disable_its(struct host_its *hw_its)
     return -ETIMEDOUT;
 }
=20
+static int __init its_compute_its_list_map(struct host_its *hw_its)
+{
+    int its_number;
+    uint32_t ctlr;
+
+    its_number =3D find_first_zero_bit(&its_list_map, GICv4_ITS_LIST_MAX);
+    if ( its_number >=3D GICv4_ITS_LIST_MAX )
+    {
+        printk(XENLOG_ERR
+               "ITS@%lx: No ITSList entry available!\n", hw_its->addr);
+        return -EINVAL;
+    }
+
+    ctlr =3D readl_relaxed(hw_its->its_base + GITS_CTLR);
+    ctlr &=3D ~GITS_CTLR_ITS_NUMBER;
+    ctlr |=3D its_number << GITS_CTLR_ITS_NUMBER_SHIFT;
+    writel_relaxed(ctlr, hw_its->its_base + GITS_CTLR);
+    ctlr =3D readl_relaxed(hw_its->its_base + GITS_CTLR);
+    if ( (ctlr & GITS_CTLR_ITS_NUMBER) !=3D
+         (its_number << GITS_CTLR_ITS_NUMBER_SHIFT) )
+    {
+        its_number =3D ctlr & GITS_CTLR_ITS_NUMBER;
+        its_number >>=3D GITS_CTLR_ITS_NUMBER_SHIFT;
+    }
+
+    if ( test_and_set_bit(its_number, &its_list_map) )
+    {
+        printk(XENLOG_ERR
+               "ITS@%lx: Duplicate ITSList entry %d\n",
+               hw_its->addr, its_number);
+        return -EINVAL;
+    }
+
+    return its_number;
+}
+
 static int gicv3_its_init_single_its(struct host_its *hw_its)
 {
     uint64_t reg;
     int i, ret;
+    int its_number;
=20
     hw_its->its_base =3D ioremap_nocache(hw_its->addr, hw_its->size);
     if ( !hw_its->its_base )
@@ -633,6 +672,22 @@ static int gicv3_its_init_single_its(struct host_its *=
hw_its)
     hw_its->itte_size =3D GITS_TYPER_ITT_SIZE(reg);
     if ( reg & GITS_TYPER_PTA )
         hw_its->flags |=3D HOST_ITS_USES_PTA;
+    hw_its->is_v4 =3D reg & GITS_TYPER_VLPIS;
+    if ( hw_its->is_v4 )
+    {
+        if ( !(reg & GITS_TYPER_VMOVP) )
+        {
+            its_number =3D its_compute_its_list_map(hw_its);
+            if ( its_number < 0 )
+                return its_number;
+            dprintk(XENLOG_INFO,
+                    "ITS@%lx: Using ITS number %d\n",
+                    hw_its->addr, its_number);
+        }
+        else
+            dprintk(XENLOG_INFO,
+                    "ITS@%lx: Single VMOVP capable\n", hw_its->addr);
+    }
     spin_lock_init(&hw_its->cmd_lock);
=20
     for ( i =3D 0; i < GITS_BASER_NR_REGS; i++ )
diff --git a/xen/arch/arm/gic-v4-its.c b/xen/arch/arm/gic-v4-its.c
index 6a550a65b2..175fda7acb 100644
--- a/xen/arch/arm/gic-v4-its.c
+++ b/xen/arch/arm/gic-v4-its.c
@@ -36,6 +36,9 @@ static unsigned long *vpeid_mask;
=20
 static spinlock_t vpeid_alloc_lock =3D SPIN_LOCK_UNLOCKED;
=20
+static uint16_t vmovp_seq_num;
+static spinlock_t vmovp_lock =3D SPIN_LOCK_UNLOCKED;
+
 void __init gicv4_its_vpeid_allocator_init(void)
 {
     /* Allocate space for vpeid_mask based on MAX_VPEID */
@@ -242,6 +245,57 @@ static int __init its_vpe_init(struct its_vpe *vpe)
     return rc;
 }
=20
+static int its_send_cmd_vmovp(struct its_vpe *vpe)
+{
+    uint16_t vpeid =3D vpe->vpe_id;
+    int ret;
+    struct host_its *hw_its;
+
+    if ( !its_list_map )
+    {
+        uint64_t cmd[4];
+
+        hw_its =3D list_first_entry(&host_its_list, struct host_its, entry=
);
+        cmd[0] =3D GITS_CMD_VMOVP;
+        cmd[1] =3D (uint64_t)vpeid << 32;
+        cmd[2] =3D encode_rdbase(hw_its, vpe->col_idx, 0x0);
+        cmd[3] =3D 0x00;
+
+        return its_send_command(hw_its, cmd);
+    }
+
+    /*
+     * If using the its_list "feature", we need to make sure that all ITSs
+     * receive all VMOVP commands in the same order. The only way
+     * to guarantee this is to make vmovp a serialization point.
+     */
+    spin_lock(&vmovp_lock);
+
+    vmovp_seq_num++;
+
+    /* Emit VMOVPs */
+    list_for_each_entry(hw_its, &host_its_list, entry)
+    {
+        uint64_t cmd[4];
+
+        cmd[0] =3D GITS_CMD_VMOVP | ((uint64_t)vmovp_seq_num << 32);
+        cmd[1] =3D its_list_map | ((uint64_t)vpeid << 32);
+        cmd[2] =3D encode_rdbase(hw_its, vpe->col_idx, 0x0);
+        cmd[3] =3D 0x00;
+
+        ret =3D its_send_command(hw_its, cmd);
+        if ( ret )
+        {
+            spin_unlock(&vmovp_lock);
+            return ret;
+        }
+    }
+
+    spin_unlock(&vmovp_lock);
+
+    return 0;
+}
+
 static void __init its_vpe_teardown(struct its_vpe *vpe)
 {
     unsigned int order;
@@ -687,6 +741,52 @@ static void its_make_vpe_non_resident(struct its_vpe *=
vpe, unsigned int cpu)
     vpe->pending_last =3D val & GICR_VPENDBASER_PendingLast;
 }
=20
+static int vpe_to_cpuid_lock(struct its_vpe *vpe, unsigned long *flags)
+{
+    spin_lock_irqsave(&vpe->vpe_lock, *flags);
+    return vpe->col_idx;
+}
+
+static void vpe_to_cpuid_unlock(struct its_vpe *vpe, unsigned long *flags)
+{
+    spin_unlock_irqrestore(&vpe->vpe_lock, *flags);
+}
+
+static int gicv4_vpe_set_affinity(struct vcpu *vcpu)
+{
+    struct its_vpe *vpe =3D vcpu->arch.vgic.its_vpe;
+    unsigned int from, to =3D vcpu->processor;
+    unsigned long flags;
+    int ret =3D 0;
+
+    /*
+     * Changing affinity is mega expensive, so let's be as lazy as
+     * we can and only do it if we really have to. Also, if mapped
+     * into the proxy device, we need to move the doorbell interrupt
+     * to its new location.
+     *
+     * Another thing is that changing the affinity of a vPE affects
+     * *other interrupts* such as all the vLPIs that are routed to
+     * this vPE. This means that we must ensure nobody samples
+     * vpe->col_idx during the update, hence the lock below which
+     * must also be taken on any vLPI handling path that evaluates
+     * vpe->col_idx, such as reg-based vLPI invalidation.
+     */
+    from =3D vpe_to_cpuid_lock(vpe, &flags);
+    if ( from =3D=3D to )
+        goto out;
+
+    vpe->col_idx =3D to;
+
+    ret =3D its_send_cmd_vmovp(vpe);
+    if ( ret )
+        goto out;
+
+ out:
+    vpe_to_cpuid_unlock(vpe, &flags);
+    return ret;
+}
+
 void vgic_v4_load(struct vcpu *vcpu)
 {
     struct its_vpe *vpe =3D vcpu->arch.vgic.its_vpe;
@@ -695,6 +795,11 @@ void vgic_v4_load(struct vcpu *vcpu)
     if ( vpe->resident )
         return;
=20
+    /*
+     * Before making the VPE resident, make sure the redistributor
+     * corresponding to our current CPU expects us here
+     */
+    WARN_ON(gicv4_vpe_set_affinity(vcpu));
     its_make_vpe_resident(vpe, vcpu->processor);
     vpe->resident =3D true;
 }
diff --git a/xen/arch/arm/include/asm/gic_v3_its.h b/xen/arch/arm/include/a=
sm/gic_v3_its.h
index 411beb81c8..f03a8fad47 100644
--- a/xen/arch/arm/include/asm/gic_v3_its.h
+++ b/xen/arch/arm/include/asm/gic_v3_its.h
@@ -43,6 +43,9 @@
 #define GITS_CTLR_QUIESCENT             BIT(31, UL)
 #define GITS_CTLR_ENABLE                BIT(0, UL)
=20
+#define GITS_CTLR_ITS_NUMBER_SHIFT      4
+#define GITS_CTLR_ITS_NUMBER            (0xfUL << GITS_CTLR_ITS_NUMBER_SHI=
FT)
+
 #define GITS_TYPER_PTA                  BIT(19, UL)
 #define GITS_TYPER_DEVIDS_SHIFT         13
 #define GITS_TYPER_DEVIDS_MASK          (0x1fUL << GITS_TYPER_DEVIDS_SHIFT=
)
@@ -60,6 +63,8 @@
                                                  GITS_TYPER_ITT_SIZE_SHIFT=
) + 1)
 #define GITS_TYPER_PHYSICAL             (1U << 0)
=20
+#define GITS_TYPER_VLPIS                (1UL << 1)
+#define GITS_TYPER_VMOVP                (1UL << 37)
 #define GITS_BASER_INDIRECT             BIT(62, UL)
 #define GITS_BASER_INNER_CACHEABILITY_SHIFT        59
 #define GITS_BASER_TYPE_SHIFT           56
@@ -118,6 +123,12 @@
 /* We allocate LPIs on the hosts in chunks of 32 to reduce handling overhe=
ad. */
 #define LPI_BLOCK                       32U
=20
+/*
+ * Maximum number of ITSs when GITS_TYPER.VMOVP =3D=3D 0, using the
+ * ITSList mechanism to perform inter-ITS synchronization.
+ */
+#define GICv4_ITS_LIST_MAX      16
+
 extern unsigned int nvpeid;
 /* The maximum number of VPEID bits supported by VLPI commands */
 #define ITS_MAX_VPEID_BITS      nvpeid
@@ -214,6 +225,7 @@ struct __lpi_data {
 extern struct __lpi_data lpi_data;
=20
 extern struct list_head host_its_list;
+extern unsigned long its_list_map;
=20
 int its_send_cmd_discard(struct host_its *its, struct its_device *dev,
                          uint32_t eventid);
--=20
2.51.2

