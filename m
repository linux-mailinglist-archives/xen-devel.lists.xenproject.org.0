Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sKk9BFIPi2l/PQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 10 Feb 2026 11:58:26 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56FFB119E6C
	for <lists+xen-devel@lfdr.de>; Tue, 10 Feb 2026 11:58:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1226276.1532819 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vplRZ-0007fL-4U; Tue, 10 Feb 2026 10:58:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1226276.1532819; Tue, 10 Feb 2026 10:58:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vplRZ-0007cs-16; Tue, 10 Feb 2026 10:58:09 +0000
Received: by outflank-mailman (input) for mailman id 1226276;
 Tue, 10 Feb 2026 10:58:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1KCy=AO=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1vplRX-0007bQ-Bn
 for xen-devel@lists.xenproject.org; Tue, 10 Feb 2026 10:58:07 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c201::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5e0daa1b-066f-11f1-9ccf-f158ae23cfc8;
 Tue, 10 Feb 2026 11:58:01 +0100 (CET)
Received: from AS4P189CA0068.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:659::23)
 by AS2PR08MB8808.eurprd08.prod.outlook.com (2603:10a6:20b:5f4::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.8; Tue, 10 Feb
 2026 10:57:56 +0000
Received: from AMS0EPF000001A2.eurprd05.prod.outlook.com
 (2603:10a6:20b:659:cafe::83) by AS4P189CA0068.outlook.office365.com
 (2603:10a6:20b:659::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.8 via Frontend Transport; Tue,
 10 Feb 2026 10:57:53 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001A2.mail.protection.outlook.com (10.167.16.235) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.8
 via Frontend Transport; Tue, 10 Feb 2026 10:57:53 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by PA4PR08MB5982.eurprd08.prod.outlook.com (2603:10a6:102:eb::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Tue, 10 Feb
 2026 10:56:50 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%4]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 10:56:49 +0000
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
X-Inumbo-ID: 5e0daa1b-066f-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=HdHFyGXoimFLLl2JYhPektua9XaaZbQBtJzsZIwZPk+hIH5bZ94++uu3SCYZ7V9kqaxPdWGHMwSBfdjlJ8MITFPu/Jaj6nl57UZHWxZ4NL0pZqSsKqpzQvyiF/fRDW4nO/BuChU62Glehy6yesMW9P2Z03cste95iFe4+v07AmMsz8shKz9EMVwOCfrEi1oBMbpNjzjmnpBeBl7GSwH0Ac9PkUHMxpzKHuliCzL0Us1ZtKuD5SCItfsT0N4SycLoYFBWoSQY1I8a9OoG3FH6Q95Wq2VL4RoNVB5fk/L6KomahvYH4wNLqdXIBOSWeI33kjZMsX3n90hUEeyJwxyM2w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3vSRvN6jQa18VAIu2UwbYv79xlVhe1ii3Iw0qDfTxEE=;
 b=gJY3TFBILI36O6d5WmKWjej3WpGEO4Kx70HjC3U1X6+fzQkvJtfc3M6Rsjzhho9A8fquaRNsQ0RmAkBoRTdHXqr286qGoBbaqxTdyvBaZ+IVHWY2Ud2HBfrXFuM0r2MY6ekUh2lXCAkF/pgVeEYJBDx+hHhJxIS73InXQl+Brh0CQtIht4Gx7YkQT4HooAzBNq484RJXzBtfMJbI+LXPqavDF3s9Shce6hVVkLbdWJtvHcRTOJBK5AvC93rooBUxj/yaLKBOzHJO6k2g1pN6uv23mJZAXWocDE/FshUkHbI9q46Q6y/CupQK7D2SFXnlfBmkOJWh6dZlvNJMTiaaFA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=suse.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3vSRvN6jQa18VAIu2UwbYv79xlVhe1ii3Iw0qDfTxEE=;
 b=qvo2LIQXJ6g69hMQvq1qRjY+eTkXyKJw35GCLrbHl+Lr2y62S45vFVe4++7N6A8xQCkX00Rm4JGJyO1O2VRJOIzxpK8hSXmGAUbSaLW3vLvxhtgsRBb1Ac1zj8swYxW+MCyIBk1IiUC/u8Lw9x/jRhvC1mUGnbae1CVsmMkflTk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Se17rQP2Yq4UpZpOLRg+mWj3T4Wh1m2iIqcnRgaE6R6EOkWaRcQGzOR+pUlAqgL59GcBXhUYMkHeV4b0SlXE29qZrlOQJKoKYZ1W8uNyA2WwQOLjMWmJnUubJWtxHyFVEfNZnkN7eyM11cxKQhGax5eUubtJ/G0isPbe1RIhvJo5bdckL1OeeD1C6VfIUHBiIHqQfruSLdsFRok8EECtGhdGUrugwBFeEwlSFEvDZAPsOTzWJbeUjlgu2MX9tdgJ8E2aKplyKhyv7LxBz+oZlllyLyvwZXfEjOhAh/QwFb+g8QypFadWoryjwXLMujdPm7NMxQ5cJWWOwopL2H6l4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3vSRvN6jQa18VAIu2UwbYv79xlVhe1ii3Iw0qDfTxEE=;
 b=T4IEEOPIU3VRxUtboh/lRhil0P6FV5B2SYvqx/lMTsLq9waVlxhzqxhPKnwLPPwbbjfbeD6PDarUb/mlnzTN2toGb8KZoniiZJdH4OPodfiYqQGr7SXuz1BG/XIj1XBqwclmDYe96JpfcJhupRlwJwT9x4sAy2nSMmbv07Kj1/LEgt4D1/RsNc9ic4TBNTrWwwkpjG+EATdkAZb7lxaYr4GSbtUt8beVEy3o818ZGX7RY4u6zvtMs4h++mcAPnFozezp2b79qZYcL6TK0keiovvpKmyYsdr8g8WRVVrMT//Yt0fmYGFy5dUbAXLAijxFWWVGAn+0aklcaEwY3T+HlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3vSRvN6jQa18VAIu2UwbYv79xlVhe1ii3Iw0qDfTxEE=;
 b=qvo2LIQXJ6g69hMQvq1qRjY+eTkXyKJw35GCLrbHl+Lr2y62S45vFVe4++7N6A8xQCkX00Rm4JGJyO1O2VRJOIzxpK8hSXmGAUbSaLW3vLvxhtgsRBb1Ac1zj8swYxW+MCyIBk1IiUC/u8Lw9x/jRhvC1mUGnbae1CVsmMkflTk=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v5] xen: Add Darwin.mk
Thread-Topic: [PATCH v5] xen: Add Darwin.mk
Thread-Index: AQHcmbF131JHt0VrQEG2yzDmCYz1i7V7wbUAgAACxAA=
Date: Tue, 10 Feb 2026 10:56:48 +0000
Message-ID: <E52B6D6A-3EE2-4739-B3E3-61F8E99545CD@arm.com>
References:
 <49c0bd388d45b6936bd852d99fbbc262fb078253.1770633598.git.bertrand.marquis@arm.com>
 <d1baa448-962c-4c2a-9a79-cf334b860450@suse.com>
In-Reply-To: <d1baa448-962c-4c2a-9a79-cf334b860450@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.300.41.1.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|PA4PR08MB5982:EE_|AMS0EPF000001A2:EE_|AS2PR08MB8808:EE_
X-MS-Office365-Filtering-Correlation-Id: 10e568d1-d716-475e-05bf-08de68933dca
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?iso-8859-1?Q?hR9GopA3hBGM4Ip2oD3IZ2uIsNFHB1e6V4BR/4VRrOGeFjBIPkvlJKHdEN?=
 =?iso-8859-1?Q?4KntHtZyKldfiGCoaigtvCvcq90IkNRA+I0mFT7cR6PjE0ORVd53ZqaCCz?=
 =?iso-8859-1?Q?v6QYj5BGAnV1zW8xfK6ox8xx3Bs7FE61EU5YgBACXssCkkAO/k9uQZsTIB?=
 =?iso-8859-1?Q?4acrKmyv2dKS5Lje/tMctSZsBD/sP5UNcFdAeGqfMAJClZEtfbYBFe9LV+?=
 =?iso-8859-1?Q?rb91ZQLIxHPmqDKLmbo5azmVU+6gqD7yUPVZV/oNDBUQYTZdixEzeIvuiJ?=
 =?iso-8859-1?Q?aKcH80PcJ1ZKHI7IsK7u6OkWNMIaUjWDLF7yP4Ddz1Xuo0/jyBVmgfbaj8?=
 =?iso-8859-1?Q?x58RHciDSlaT8DmBFRylSynDbQ9zdneKQRv+eSrDRKObnzFMNgr/yUEb+R?=
 =?iso-8859-1?Q?fdc3fQ9ddKeCFNs8eNw81ghcu62syARhIrdYqkPB3+TZAvbHE+MElIQ+9+?=
 =?iso-8859-1?Q?mABxJF5OfgE5bjC4QanXJ6b60p0naRf2cz/BeJusjYYI9SnyG28eUcXxeR?=
 =?iso-8859-1?Q?ROq+k6WvQPd2LPUcsTwJ8YSeF2dpV96159Oyqqd3LFf99ZFRtr9pM1O/Mx?=
 =?iso-8859-1?Q?GV6GFFXx/NxC9QcQmyb4sZRQ9O8MGmOR5xY9xXQI4qY8u+83qZp1Wjt3Iv?=
 =?iso-8859-1?Q?Iyk30GTgWGmX7epCg3W81YwOUqE4lj9FMHp+Queq7Np3Hig6E4swztvMnu?=
 =?iso-8859-1?Q?1f5j87OWXlpZ1XgT9WMZ2rILjG+IQXlZHVi/FPjzJge1maW2tkz3HyiUFy?=
 =?iso-8859-1?Q?uXCY/Iv/5wGLRHbIgIWIvlgcP4UK1AaLJnVDSAYiiCCz7u/hDVXQkuy0im?=
 =?iso-8859-1?Q?KhrKhxR2vLv+1AhJiQ7+2z3fcWxmfNw32FSUdZQnHivcYh0JJXr9965JBX?=
 =?iso-8859-1?Q?uaEN0drW6axBmk7hLliDOcABE55Uyi+zU0m/BESLuyBQef7IMoIGRFj1yA?=
 =?iso-8859-1?Q?BNsXnv7BJSeFsBFsF6J5Lor8WGaJ34dd35Pvl2P82Z5SzuS9C44S854kdh?=
 =?iso-8859-1?Q?MKUv7ZVxt0U3X2E8JwHAHMarQZ2Ma+nt6JPznMbkQPxTrikEhSSRNKjmL1?=
 =?iso-8859-1?Q?fUkQbI/4bnKWfcZTzGg+Fm4VUL8oe4q6lyuj2up71+e8e1KADkHxYA/HqD?=
 =?iso-8859-1?Q?eVBASmNMZRj3JmYPaJEaLpGH/vohjdRwA0IHQNqKfjb2A6tCmom/m86bww?=
 =?iso-8859-1?Q?SPTZfFIAt/rCYKDcipRMFumZAuj5GhZUUvNgOzZXWyeOxXkcFZ9bS3qk7h?=
 =?iso-8859-1?Q?oYGzohXGkZeroY61kdPOJTwRVN1eT+DMrAAR5iJ6e0I9LNAp01V83y/Y5Q?=
 =?iso-8859-1?Q?SXRpatEB7t3CvUkDVjqAaakdTnDUE0g48wgHvjd4j4TKqY/4eOPSPz1YzF?=
 =?iso-8859-1?Q?ZML68YK6RET3XOQUDPNNVAnMoRmSADioDvV20KvUsc1etbkp03N4O0bm56?=
 =?iso-8859-1?Q?YxGmXbnmmgGqm0+2KePeVO56qqbnOb6iennOae6xNswT4ET00mk+VUhKo4?=
 =?iso-8859-1?Q?ewreqxslhR35uarZQk9stE2RQi7hvhCV3B9hFNS9nwae72St7kbgEBnApE?=
 =?iso-8859-1?Q?Ac6hEPGfEamG9HGjdPIHuzKqqkOmZI6KrwDGSpooCHz8ijnYvLCZMX6/Os?=
 =?iso-8859-1?Q?14wMRzaTu478gi7XB7ECCdPZqw4lbBJEa8SaEes4yex1voj+R0LjiN9Cn4?=
 =?iso-8859-1?Q?gMoz3X/WPfVZUfMPZ9U=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <DA1374C21F6DB64E94364812644CBA16@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5982
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001A2.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a69801a2-2e18-4797-760d-08de689316f8
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|376014|36860700013|14060799003|82310400026|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?PbcynOZesTePkZ1mhFPVeqjP57bBxKT2YzN7JIzbUSyUrpBdVZIKZBIO3j?=
 =?iso-8859-1?Q?kKJfKYn7VGIkp4H9/QFpwESs3y389Q7aoSHW5nfgkB6L7RUQ9gtHCGlfav?=
 =?iso-8859-1?Q?9d4TiJR6eUw1ZPy2kP/SoLV90mP3Fa4IYcJzRK226DK2tpVkBqw4WFdO75?=
 =?iso-8859-1?Q?qfcFe6Zz9j9vjw3aTcGZe+vere1g07PxLYt0jaSolY4Qwpd4jrPZS8FYme?=
 =?iso-8859-1?Q?nO6JyzudtkuPkO+x1Z9ElHurR0yqH0nj3S2KlCzcHvvNAdrxNwmzZMD7hm?=
 =?iso-8859-1?Q?JGXWo1BtaTr91MwGLvuK2EU5Eknwo812r/B432k3ZaYk0RKhqcoc8fdF7w?=
 =?iso-8859-1?Q?sbnYdVT2txRSNSeU8khNgeli8+oaVVFSiV8P+fdCwoVpLTUzFM54X5Tq8b?=
 =?iso-8859-1?Q?uEy0AjVwKLCwUd/9izFqCrgPyaW0e8PMKdXcEtH57VrlT6nBmFAfpp74Xq?=
 =?iso-8859-1?Q?fGt/pNsrRnbhH6HkN8cZvSK7zHpduQcyUB/92TbYAMZ769D6gXUFqtWnix?=
 =?iso-8859-1?Q?UJ2P9MukIQirhJB/4/iuOybGWYYx8+hqWofjkKj50H90ECNe0qZ8pqK+ns?=
 =?iso-8859-1?Q?LWrDiw2Zk/562z1+0LyJUxjfbwdB9Pk0wwd25iHOOxaDycxzli6/PquXiR?=
 =?iso-8859-1?Q?+TXs74Wi6X3rCzkB1IWbmk50+i/BKa+xgZa/J5k08OL+A4Z8C+cxFSFGoH?=
 =?iso-8859-1?Q?y2sPyg7vatrPr2H2+esN0HlLt1YKPRluWd6GTBKizHc7wb9JR9zB6FzACS?=
 =?iso-8859-1?Q?QN4BebWveKpNAMViL0vpaYjY/xs2Q9O6LHiGTh6Q2R6EcfQXTD5AE6R92U?=
 =?iso-8859-1?Q?rHeA+rKIWFLNhb5dO2kXTIpCJcHFIvHAHWAwc1eLICgDUEgQuC8IPDprTA?=
 =?iso-8859-1?Q?Rn4YJUCIx6LAHxVQgUAMYKIrjST4G/31abqFs49IWjb9E3wBlc8xC5kTx7?=
 =?iso-8859-1?Q?5fIdACw8ELFffT5vvWkRsXq1cUCpX6u+2Jov9RvfOwZve0Eo1KaV3bvWEh?=
 =?iso-8859-1?Q?etDeWo8PcqFzfI4sVri8itrFb25w8xZxHA2/p9zv7F6B8pGqpZUTXOxwkY?=
 =?iso-8859-1?Q?1DeVvW+7VM525Aq2ew1vVY1KPkUv4AKZWo4BvBqaDGf68eIh2cTtu8NNAu?=
 =?iso-8859-1?Q?+HW8GRy+Dc1tUn8Y460SPQUX0I/4w0w10MDtHdHhIABw6/pC5bmReGvRfV?=
 =?iso-8859-1?Q?LvGnseEsToAm3525/r71OYOUm1FcjakaK7OP1KUD+Gt/xGox/MSySs9mO7?=
 =?iso-8859-1?Q?CalPLzjtJWEIc5X0OWNZfUDZEQMjVVjWOnIF2iy15WYlw6xf0gFipGfv3d?=
 =?iso-8859-1?Q?2DPsOSE3JdQYa/o5+ln3NO7DrAwbKHYszcBwoNBVOYQhAOAk5uvUxUbq9Q?=
 =?iso-8859-1?Q?n9zybMuJtqHbD5vmocdAgJw834rmQ3nXRLRBHQpoR+TxoK1sGs1HEvwgOO?=
 =?iso-8859-1?Q?OH7SU285QUtNBRR7DJMrXELivkXaYZbsQtS+2jyIhh5JzmL/QSrPY6PaZo?=
 =?iso-8859-1?Q?zuCSqJpa5ivgdsIphA8qDCkwzHapIIcE9w3jpKO4yVqqcuHTBGLWMdzNRg?=
 =?iso-8859-1?Q?XVLPGV/INF1BmcZnnIsqJ4V+yWAHh5Idt3D86AqBrSD4Hi64BvzVnppnlG?=
 =?iso-8859-1?Q?eKvRNV7p9xzPeaUN7S0Pakrotd2/Zvk3xOpNT2zXPP29yvma1+TjVVUjJs?=
 =?iso-8859-1?Q?mlynBx+A0eKQf/cdM75Hdwf04SF08Hk9TnbKvVndLX1pkrotu+Jfl8JlRF?=
 =?iso-8859-1?Q?2Jdw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(376014)(36860700013)(14060799003)(82310400026)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	apC9g/RNfuVlHGVX4UNZpuIkoW/KzEdxavfLgMjMW4iBLOfU1fVNECVowoR+rjER2LmfzRC4w0trGnD2A2f5ycFjAzxQcVBa+iGnoJmL52a0NtVDASM8MoYzYlqn2ai1i3SICgSXjwDs/v2hjtGA9rmAJ91WuqKu/Pg2XAAVPa6rHvXcEfVOhigpH3GMbVisMANIrsWbCt6VEKnpxEM9k7fFXKPvbqeaXP+748z6wdPg4mDFxnwcU58uc6CwpDU4xXNXs8nRlMybhJVXKbNG90JqbfOhikK4ygShqbTnN3AXXQ8zYXOTDHr8f5bJJX61flQKR4XJ0WqSGgwIz8pdhziWCOcfVMyTWnyPLZTjqmSsMuAafMz5BgpIroCGuW17e9LFB1nzrPhVDEgVcHHE6XNXydjSKVlTkt15T4qX4yau4GKMNyBeKmHe7ExDvzop
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 10:57:53.8503
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 10e568d1-d716-475e-05bf-08de68933dca
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001A2.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8808
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email,arm.com:mid,arm.com:dkim];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: 56FFB119E6C
X-Rspamd-Action: no action

Hi Jan,

> On 10 Feb 2026, at 11:46, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 09.02.2026 11:46, Bertrand Marquis wrote:
>> --- /dev/null
>> +++ b/config/Darwin.mk
>> @@ -0,0 +1,6 @@
>> +# Use GNU tool definitions as the tools we are using are either GNU com=
patible
>> +# or we only use features which are supported on Mac OS.
>> +include $(XEN_ROOT)/config/StdGNU.mk
>> +
>> +# Cross compile on Mac OS, only hypervisor build has been tested, no to=
ols
>> +XEN_COMPILE_ARCH =3D unknow
>=20
> While editing in the ABI aspect, it occurred to me to check what Apple ha=
s
> to say regarding their ABI. For both aarch64 and x86-64 they say they use
> the standard ABI with some modifications. We may want to evaluate whether
> those modifications are actually compatible with what we need.
>=20
> Talking of x86-64: Has building on an x86 Mac been tested as well?

No i did not tested that (and i have no x86 mac i can use to do so).

> Especially if that doesn't work, it may want mentioning.

We might have to say that it was only tested on arm mac.

I would expect that it works on x86 mac but i cannot sign on that.

Cheers
Bertrand

>=20
> Jan


