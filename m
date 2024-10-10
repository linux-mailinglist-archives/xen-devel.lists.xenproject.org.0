Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64496997D1C
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2024 08:23:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.815452.1229206 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1symZJ-0007Ir-8j; Thu, 10 Oct 2024 06:22:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 815452.1229206; Thu, 10 Oct 2024 06:22:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1symZJ-0007Gb-5m; Thu, 10 Oct 2024 06:22:37 +0000
Received: by outflank-mailman (input) for mailman id 815452;
 Thu, 10 Oct 2024 06:22:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C3pA=RG=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1symZH-0007GV-30
 for xen-devel@lists.xenproject.org; Thu, 10 Oct 2024 06:22:35 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2062d.outbound.protection.outlook.com
 [2a01:111:f403:2612::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 08863b36-86d0-11ef-a0bd-8be0dac302b0;
 Thu, 10 Oct 2024 08:22:32 +0200 (CEST)
Received: from DB9PR02CA0004.eurprd02.prod.outlook.com (2603:10a6:10:1d9::9)
 by DB4PR08MB9405.eurprd08.prod.outlook.com (2603:10a6:10:3f3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.22; Thu, 10 Oct
 2024 06:22:26 +0000
Received: from DU6PEPF0000A7DD.eurprd02.prod.outlook.com
 (2603:10a6:10:1d9:cafe::78) by DB9PR02CA0004.outlook.office365.com
 (2603:10a6:10:1d9::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.17 via Frontend
 Transport; Thu, 10 Oct 2024 06:22:26 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU6PEPF0000A7DD.mail.protection.outlook.com (10.167.8.37) with
 Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8048.13 via
 Frontend Transport; Thu, 10 Oct 2024 06:22:25 +0000
Received: ("Tessian outbound 0362136859cb:v473");
 Thu, 10 Oct 2024 06:22:25 +0000
Received: from Ld1e73cc05c03.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E0435DC8-2019-40D0-A523-842624AA2C39.1; 
 Thu, 10 Oct 2024 06:22:18 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Ld1e73cc05c03.1 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 10 Oct 2024 06:22:18 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by PA4PR08MB6205.eurprd08.prod.outlook.com (2603:10a6:102:e6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16; Thu, 10 Oct
 2024 06:22:16 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%4]) with mapi id 15.20.8026.020; Thu, 10 Oct 2024
 06:22:16 +0000
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
X-Inumbo-ID: 08863b36-86d0-11ef-a0bd-8be0dac302b0
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=JZo0QmdJUQIB/RaX1wM1sAHSxUb9/IRmmOAIF0C9WBZmDHkWZvGRkXKRtPs7rxgwYZLd+O5OQYxifaRybFKKZV6LSWTW8wZD9G7q6f+09r0HDdIPlnnparEiQM14ddjZ9gc1BoOiIAvpVcqR8OITeyZ5Jz+bQR7l2OINxvFrvKwHREaSW6izPWAqvwm+9jrYZUS60Bv0uvzaXSe+/gVIEAxATAyevq/Mm5wBw9pAe/FQwVF4sjjl/HV2xkRMJxQCUnhuXb7aXwNJSEo5IzS3lDaQvIriYp/uNBeKL1iZv4y1XQrkXZUxNG3kqIDiy3f3176J8Oaw/IrJjsbD9Kd2lg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VYJq2pxbeWCupnCO47J++QxriOMjYYAD5LQbD99YZbs=;
 b=g/oT7Z9CsKu7buhS/2azjBY3eg7ViLq3DcWXya3gw57O525pRYwZwpOl4viEGf254zl3vHCbFyaPbifwFNvdIPWH4Xq88sMAvjTAupfjrtBD/eUuwAhvJnwl2hlh6/Lk91+wTtUmUYYO/noLXrEJrQaduIeABBQ5D5O51//ZPNLkuc/loGhKdUMhDJXGpk0WRMYGJtDBj6AXOUO+tJdKX1piw95tM1It2u91+U1WkY4q+CVtnrDNN1QzR6R/S0Gz5R0OQ8KwJaJt223CsvpLPg8RLow3/lbN8nH2coZF3qt54UvPXXlKxegqK/qptaTf0CTU3Hkx+M0wGXq2R1y4HA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VYJq2pxbeWCupnCO47J++QxriOMjYYAD5LQbD99YZbs=;
 b=RR5T8WmnOWu8vou9QT/yl5D35VAi7Os5jdWyi4a+A9TkUKCbGNy3K2y+rQ5+ptW0rysiwShBFENbKmRxyNW3Itqr421azHMiqJYJk8ficewtInx3KZsH75cKaqg5h8kTqtYrc4UPnz+AKMY18Rl8hxqxGWbM7iKujAw/POSpVJ8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3940d2705cd8153b
X-TessianGatewayMetadata: yWsSW3aaLYvJmckNhNaxFrrpgCHiczm5IAh4yAICANSbEhggV1AD5Ekrdt+xb02uepXCBAIdWJT6D4nkqxZR3P56IuA/nXGXYUb34HDjzUp2lQmFuLuSwBezQ9+IlJuKlVy90fMn6kFtudknWdkZxjfQwn8igRE9aUkJB3cRFRE=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hyxQwLImxWirb962U++ABwFIC0keetUSFqme+oWJGM0u1fM8c43MifiQFgfknljcW/qIlZbwcvITt8lGUFBR8BlRKp9Pw57S2fMUWUcORrZitA10JlbgN1ZyK4FvL+FTX0ghw2k1AuXPIKlHguS0tR4PvZ1tMU3bZu4D8JYTe31BuCVZhrUwqVMPvC3fpD+vTjaSQ7RjbeutshySPj3ZdSWMO7ivBiIZsEA8QxfC465mPsBfIUxVUns++hqF+rxjMWUn74RaFb+7CLeJ21ekN6+JHqhsujNFUeDqVIaunKoS45fIixWWqG9vsU3jJnuaK7fHgz0e17vHhjvXPjzfRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VYJq2pxbeWCupnCO47J++QxriOMjYYAD5LQbD99YZbs=;
 b=qzHTcxAO+1HhlcXxlFCiSW7zbheepfO1KkIzndQPmrK10egDSKUFte5VzPOOMDe8/FC5+q08Sd0uBCT4CRNLsitS5nS8O7drB9ZMJQRlE4Kgx4AOXL+98/WNTZlhkKndomRksViU11m6hLBVDm1rWj+/UKb75prjeUfKiJOTQe8+Fai/aPi4MfTYug8z1Kmgc6X8l7HRSJUIg8d8QzypGeKN/Y9awFWOkk4j/zvCmDNdaTTHIIHGcK8nUQtIo4tLiGZh/asEvii76g440hBjferACexC+774I+STPoLX4tHo4dPx7hxAfs5IZc4Nds61zY8I+VCbBz5hFUswmcB/sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VYJq2pxbeWCupnCO47J++QxriOMjYYAD5LQbD99YZbs=;
 b=RR5T8WmnOWu8vou9QT/yl5D35VAi7Os5jdWyi4a+A9TkUKCbGNy3K2y+rQ5+ptW0rysiwShBFENbKmRxyNW3Itqr421azHMiqJYJk8ficewtInx3KZsH75cKaqg5h8kTqtYrc4UPnz+AKMY18Rl8hxqxGWbM7iKujAw/POSpVJ8=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>, Artem Mygaiev <artem_mygaiev@epam.com>, Hisao
 Munakata <hisao.munakata.vt@renesas.com>
Subject: Re: [PATCH] docs: fusa: Add requirements for Device Passthrough
Thread-Topic: [PATCH] docs: fusa: Add requirements for Device Passthrough
Thread-Index: AQHbGOqFqldnvX8xNEmI4LnFnImSpbJ8YaSAgADTLwCAAMR5AIAAtAsAgADaR4A=
Date: Thu, 10 Oct 2024 06:22:16 +0000
Message-ID: <B4C08480-8240-4B35-99FB-E176CA497ED5@arm.com>
References: <20241007185508.3044115-1-olekstysh@gmail.com>
 <6E89CC97-C7E3-40DF-8BFA-5F3065429F54@arm.com>
 <f8ea9ab4-190e-427a-ae77-b7c0769dffbe@gmail.com>
 <9C3AD765-C165-4B46-AEEB-8C5F87861947@arm.com>
 <e180d843-fe44-42fb-b3ae-c75f0f675aab@gmail.com>
In-Reply-To: <e180d843-fe44-42fb-b3ae-c75f0f675aab@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3776.700.51)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|PA4PR08MB6205:EE_|DU6PEPF0000A7DD:EE_|DB4PR08MB9405:EE_
X-MS-Office365-Filtering-Correlation-Id: ecccbebd-5cc9-4b4a-02a6-08dce8f3e854
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|10070799003|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?FmKCKgQN5tjBaaNQZe9oo/G+3l8Ptrsopqdop1NgoWVvCwyX9Fhh8ACr6llW?=
 =?us-ascii?Q?KsyWuD7ZLXABzvseiINBFrg5QFfD9+GmNRoRKlXoloiSpI/tL+k0/6dseU9l?=
 =?us-ascii?Q?8BV3HaP/QNt6LLmn6GOlwEfZ1nJGJtX+N+UNwAk1RLE3sUGXN6RqQz4lo5Nl?=
 =?us-ascii?Q?OXXrWk+aQhabjsvObgQv0eVxhdJAkmeuPCozG7IlEff3tC54jNA4PQznhjET?=
 =?us-ascii?Q?wDV0Y14P3jF+ORHDazirwwTZ9Knt7lpjDNAaKy3W1iIYe/k2NpHGjndAbiSt?=
 =?us-ascii?Q?omsBjlahZKmt3Q/UNmuSX3qp7vrIqf9qQTn3iccx8buKx7ElT8sbZoAbzluX?=
 =?us-ascii?Q?BZ6QLvHHVTWnIi6fCxmak3l7OqUQTpGYBiab8d+rWHHnkzmmrgHdjYz8MuRq?=
 =?us-ascii?Q?vIXl4gERKFbeGupqKV3qonouYodxBnyqv50OkO0/yJQbt/5b3oRKQxVuK0qI?=
 =?us-ascii?Q?622p5kP0B115cD0uYS8UCy9qEUdHcAlDM9YMrucluWgcKo4uiNhsDiqVGsyq?=
 =?us-ascii?Q?q2RtuagZspqy8seaYYHlYeVStPgqPnVv3Hym2VISEOuKZjhT6vdn/7AfyQ/f?=
 =?us-ascii?Q?c4+y/eMNlVHDHsdfeUnwdh8iNEg0o3aOE5bXR0b24j7/bPyXTSQdIEmqv5OS?=
 =?us-ascii?Q?jGGhrvLtVrw75o4On4qd9l5KMBeisia4fZbDl/YQ+iEqrzQrEUa9E/c7wRnO?=
 =?us-ascii?Q?fpaLtWgj2D5qrWFQzCyd6ANtCHO1y/wzNiQnrcPhrfvdBz4O+GBYRvdZw+Vf?=
 =?us-ascii?Q?p5iujnMpSAWWfOG9bZxqQWEHWvZX5FGdleXM3l3NmF7d3cV90TSr8pI1/XOY?=
 =?us-ascii?Q?hQ+vSgArEpFmwG5p5lEzn9drpf+BNAOEXd15qcgpNkFMcmHMNreYgMcylPK+?=
 =?us-ascii?Q?y+uG9kkr1yMN00jXB2nuc/tEfMhYI1jEmP7dIqotbl26BMuc6dU5W6RAA6f5?=
 =?us-ascii?Q?rRvSTJHVCUG88AFOTSkYaZwcN1B+AuFLsY8kgsn/eB3OXa3guk9Pd2VB0tdZ?=
 =?us-ascii?Q?a3pYgyNCrNUcPmlA2LqbarnTA7WNJQdjS9UKXcF+cZMy26q9xOq0dR36DW1Z?=
 =?us-ascii?Q?Ght7DvKP9YK88YR83B/ClqHI9eD3iGlqfQqgUPwvEt7i732XFsOQ5X+TWkFo?=
 =?us-ascii?Q?5r+YzaxKLhzxFmjZ9A7v8+E3hyFIVbBn2EBcQV8HY6Uj9CbG54Svff8LYkPY?=
 =?us-ascii?Q?DY4rqd9zDgH4LLzRjWAi3FZ04z1uNuwRkawq8b7L2Y2fuuSZNpx1/JFFiA4N?=
 =?us-ascii?Q?HYJobyCpUfdnZ0a3B9ZGpLm95qJv8jICe8C+kSraEQ=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(10070799003)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <25258D2ADC8CED4CACFF40FF6B2CFABE@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6205
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:25a::24];domain=DB9PR08MB6588.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF0000A7DD.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8a866127-27ca-4f72-fdfb-08dce8f3e2ff
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|35042699022|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?saf3fnIInhxNEYcOdBFAHnz81TrTLcOpj7kvu0cbs9L26tG6ACxK6QfMVWHS?=
 =?us-ascii?Q?MN50KmzLvMtq/Y6V4ps/7LdrMiYNtlqgyLRXhWs9xDc1BrvTvt+31eigrXE2?=
 =?us-ascii?Q?BOioajkQneASMc2nYnd43t1/uXvCEOIEAXd1FufJ6NwB5uCJGOxnsioJdceT?=
 =?us-ascii?Q?T/HfIANmGogkQteINj1l0YbJqyVKuw2WBcMd+whSOhNAko8zUsul8G5B841m?=
 =?us-ascii?Q?8fZwaycNeYUMCHceXZW5foY+zJlmsRrWw0x3oZCpX5y6x44dRDHlndza2GEC?=
 =?us-ascii?Q?mRzQ0B3aEPyTkDBAyEfSvPm0lOHI5580LVCodiP0PwirgjXLKB2349Bks8Ar?=
 =?us-ascii?Q?a9oJv3oeaP3avvE8hbBTN780TbGbYZVBW1CaOn+wDm2V3+dnfXALxqFFXzsm?=
 =?us-ascii?Q?Ies6c4a6OuZb9ie3ae2rb7BSqx+9H+ImsT4HuVPW/ipehzVssqRbPVvPUECg?=
 =?us-ascii?Q?78VZ5B2ozLFFfYYC6IT7RNQclnDGM2VO3TDNYg7a83X2VHD6hzuVlV5F2IYe?=
 =?us-ascii?Q?uEDiCjw0rJL92+vtU8iRlRG6jdIUGEAHjqODj1NU8wZazyDjWV8G4dLbS/UX?=
 =?us-ascii?Q?9pSeSdJbgXPLOxzN+BQlnePe9oDWiZCa5a9maYMyX+8CppJR8pG/T1gZQpTi?=
 =?us-ascii?Q?VXsiXNit+QphEcsRyaReSlXglP5CYVThc0FbinHuw1JwkqdiFI2QIhzYxhwk?=
 =?us-ascii?Q?+9HUKd8fAX1rJoauLHOXsWzxkWbImKIyyoHds8MkeVPvksEVBI9uTox0evs2?=
 =?us-ascii?Q?viLrzFDKlKuJ2EXfaA9juemueksf2X9eBW4uAFyvVmmuSEp2DAm5Jd0OGGxd?=
 =?us-ascii?Q?Sj/F7eL0HKNosBY8JeAnBp2zZpVqKkXO1WgB9zpUVRXXlsTE+yt77rGxgfgY?=
 =?us-ascii?Q?4jbnLALFkdxF+Bvhlo6ecrqyW7xNaLoIEQf5kGlzp7R+71WujMT2p6VepZaq?=
 =?us-ascii?Q?VmSCEFM2jBdC6vpI2KE+AJjLsQ7QPJ0ey6t09PvjnpfieoNPg1eRptuW5mmY?=
 =?us-ascii?Q?hoTDru5Nxxz+pA1+QcgNsWXHcQFqfvrTmUJiUKZ9e6FDIXDMsVw0kZpzl+gh?=
 =?us-ascii?Q?P8ZBiVADxrKHGmI/NqK5rQjF9Pd24ndTf259rzlovQJTjE7e0vj/Zi1QnKNc?=
 =?us-ascii?Q?5nxAXn1JWA6wcpI/N2ERkoRqiQqQvy5pNgI6OXaP8IKNhfgWVPrKRjCCYeV1?=
 =?us-ascii?Q?Di9fVkBmhlnN8minrHCkpWJdfH5uzrZ25GklMj+6xElZO8dJKgRNGfdfT97c?=
 =?us-ascii?Q?QTRqJ2eD4LBKSZpTXxomu3AsarieEt+v+QvFNOyayPwL9cnzqeGk8jABGy4n?=
 =?us-ascii?Q?lAzO06UuX3j8SziilhnqrC/1?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(35042699022)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2024 06:22:25.2284
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ecccbebd-5cc9-4b4a-02a6-08dce8f3e854
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000A7DD.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB9405

Hi Oleksandr,

> On 9 Oct 2024, at 19:20, Oleksandr Tyshchenko <olekstysh@gmail.com> wrote=
:
>=20
>=20
>=20
> On 09.10.24 09:36, Bertrand Marquis wrote:
>> Hi Oleksandr,
>=20
> Hello Bertrand
>=20
>=20
>>> On 8 Oct 2024, at 20:53, Oleksandr Tyshchenko <olekstysh@gmail.com> wro=
te:
>>>=20
>>>=20
>>>=20
>>> On 08.10.24 09:17, Bertrand Marquis wrote:
>>>> Hi,
>>>=20
>>> Hello Bertrand
>>>=20
>>>=20
>>>>> On 7 Oct 2024, at 20:55, Oleksandr Tyshchenko <olekstysh@gmail.com> w=
rote:
>>>>>=20
>>>>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>>>=20
>>>>> Add common requirements for a physical device assignment to Arm64
>>>>> and AMD64 PVH domains.
>>>>>=20
>>>>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>>> ---
>>>>> Based on:
>>>>> [PATCH] docs: fusa: Replace VM with domain
>>>>> https://patchew.org/Xen/20241007182603.826807-1-ayan.kumar.halder@amd=
.com/
>>>>> ---
>>>>> ---
>>>>> .../reqs/design-reqs/common/passthrough.rst   | 365 +++++++++++++++++=
+
>>>>> docs/fusa/reqs/index.rst                      |   1 +
>>>>> docs/fusa/reqs/market-reqs/reqs.rst           |  33 ++
>>>>> docs/fusa/reqs/product-reqs/common/reqs.rst   |  29 ++
>>>>> 4 files changed, 428 insertions(+)
>>>>> create mode 100644 docs/fusa/reqs/design-reqs/common/passthrough.rst
>>>>> create mode 100644 docs/fusa/reqs/product-reqs/common/reqs.rst
>>>>>=20
>>>>> diff --git a/docs/fusa/reqs/design-reqs/common/passthrough.rst b/docs=
/fusa/reqs/design-reqs/common/passthrough.rst
>>>>> new file mode 100644
>>>>> index 0000000000..a1d6676f65
>>>>> --- /dev/null
>>>>> +++ b/docs/fusa/reqs/design-reqs/common/passthrough.rst
>>>>> @@ -0,0 +1,365 @@
>>>>> +.. SPDX-License-Identifier: CC-BY-4.0
>>>>> +
>>>>> +Device Passthrough
>>>>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>>> +
>>>>> +The following are the requirements related to a physical device assi=
gnment
>>>>> +[1], [2] to Arm64 and AMD64 PVH domains.
>>>>> +
>>>>> +Requirements for both Arm64 and AMD64 PVH
>>>>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>>> +
>>>>> +Hide IOMMU from a domain
>>>>> +------------------------
>>>>> +
>>>>> +`XenSwdgn~passthrough_hide_iommu_from_domain~1`
>>>>> +
>>>>> +Description:
>>>>> +Xen shall not expose the IOMMU device to the domain even if I/O virt=
ualization
>>>>> +is disabled. The IOMMU shall be under hypervisor control only.
>>>>> +
>>>>> +Rationale:
>>>> I think there should be a rationale here to explain why we do not want=
 the IOMMU
>>>> in particular to be assigned to a domain.
>>>=20
>>>=20
>>> ok, will add. I propose the following text:
>>>=20
>>> Xen having the whole picture of the host resources and device assignmen=
t unlike the individual domain makes use of the IOMMU to:
>>> - perform DMA Remapping on Arm64 and AMD64 platforms, which is also kno=
wn as stage-2 (or 2nd stage) address translations for DMA devices passed th=
rough to domains and Interrupt Remapping on AMD64 platforms.
>> remove arm64 or amd64, this is always true >
>>> - provide access protection functionalities to prevent malicious or bug=
gy DMA devices from accessing arbitrary memory ranges (e.g. memory allocate=
d to other domains) or from generating interrupts that could affect other d=
omains.
>> I would turn this in positive: restrict DMA devices to only have access =
to the memory of the Domain there are assigned to or no memory at all if no=
t assigned (maybe 2 reqs here).
>=20
>=20
> ok to both. However, I am a bit lost ...
>=20
>=20
>=20
>>>=20
>>>=20
>>>> Added to that, I am not completely sure that there is a clear way to t=
est this one
>>>> as for example one could assign registers not known by Xen.
>>>=20
>>> I am afraid you are right, valid point. For example, on Arm64, if there=
 is no corresponding driver in use, we will end up exposing IOMMU dt node t=
o Dom0.
>>>=20
>>>=20
>>>> Shouldn't this requirement in fact be an assumption of use ?
>>>=20
>>> Assumption of use on Xen? From my PoV sounds reasonable, will do.
>> As was suggested by stefano, i agree with him on turning it differently.=
 Please see his answer.
>=20
>=20
> ... yes, I saw his answer and completely agree with him as well, my quest=
ion is what I should do with the rationale?
>=20
> The rationale I proposed above explains why we do not want the IOMMU
> in particular to be assigned to a domain. But, it belongs to the initial =
"Hide IOMMU from a domain" requirement. Now, with turning it into "Xen shal=
l configure the IOMMU at boot according to the stage 2 translation
> tables" requirement should the rationale still be present?

No this would now be part of integrator role or something like that but sho=
uld not be a rationale here anymore.

>=20
>=20
>>>=20
>>>>> +
>>>>> +Comments:
>>>>> +
>>>>> +Covers:
>>>>> + - `XenProd~device_passthrough~1`
>>>>> +
>>>>> +Discover PCI devices from hardware domain
>>>>> +-----------------------------------------
>>>>> +
>>>>> +`XenSwdgn~passthrough_discover_pci_devices_from_hwdom~1`
>>>>> +
>>>>> +Description:
>>>>> +The hardware domain shall enumerate and discover PCI devices and inf=
orm Xen
>>>>> +about their appearance and disappearance.
>>>> Again this is a design requirement telling what should be done by a do=
main.
>>>> This is an interface or an assumption of use but not a Xen design req.
>>>=20
>>> I agree, will convert to Assumption of use on domain.
>>>=20
>>>=20
>>>>> +
>>>>> +Rationale:
>>>>> +
>>>>> +Comments:
>>>>> +
>>>>> +Covers:
>>>>> + - `XenProd~device_passthrough~1`
>>>>> +
>>>>> +Discover PCI devices from Xen
>>>>> +-----------------------------
>>>>> +
>>>>> +`XenSwdgn~passthrough_discover_pci_devices_from_xen~1`
>>>>> +
>>>>> +Description:
>>>>> +Xen shall discover PCI devices (enumerated by the firmware beforehan=
d) during
>>>>> +boot if the hardware domain is not present.
>>>> I am a bit wondering here why we would not want Xen to always do it if=
 we have
>>>> the code to do it in Xen anyway.
>>>=20
>>> Makes sense, will drop "if the hardware domain is not present".
>>>=20
>>>=20
>>>>> +
>>>>> +Rationale:
>>>>> +
>>>>> +Comments:
>>>>> +
>>>>> +Covers:
>>>>> + - `XenProd~device_passthrough~1`
>>>>> +
>>>>> +Assign PCI device to domain (with IOMMU)
>>>>> +----------------------------------------
>>>>> +
>>>>> +`XenSwdgn~passthrough_assign_pci_device_with_iommu~1`
>>>>> +
>>>>> +Description:
>>>>> +Xen shall assign a specified PCI device (always implied as DMA-capab=
le) to
>>>>> +a domain during its creation using passthrough (partial) device tree=
 on Arm64
>>>>> +and Hyperlaunch device tree on AMD-x86. The physical device to be as=
signed is
>>>>> +protected by the IOMMU.
>>>> This is a very long and complex requirement.
>>>> I would suggest to split it in 3:
>>>> - generic: Xen shall support assign PCI devices to domains.
>>>> - arm64 one: Xen shall assign PCI devices based on device tree (explai=
n how this is configured in dts)
>>>> - amd: xxxx based on hyperlaunch
>>>=20
>>> I agree, will split, but ...
>>>=20
>>>> - Xen shall use the IOMMU to enforce DMA operations done by a PCI devi=
ce assigned to a domain to be restricted to the memory of the given domain.
>>>=20
>>>=20
>>> ... does this need to be a separate 4th requirement here (and for the s=
imilar requirement for the platform device down the document) or this sente=
nce is meant to be added to all resulting generic/arm64/amd requirements?
>>>=20
>>> I would like to clarify, there are two groups of requirements to cover =
DMA-capable devices in this document:
>>> - for devices that are behind the IOMMU and IOMMU can be used for them,=
 those requirements description explicitly mention "device xxx is protected=
 by the IOMMU" in addition to "(with IOMMU)" in the subject.
>>> - for devices that are not behind the IOMMU or IOMMU cannot be used for=
 them, those requirements description explicitly mention "device xxx is not=
 protected by the IOMMU" in addition to "(without IOMMU)" in the subject.
>> I think you need to be more generic and any DMA engine that is not prote=
cted by an IOMMU shall not be assigned to a non trusted domain.
>> This is in fact a requirement on the integrator, Xen cannot do much abou=
t this.
>=20
> yes, I agree
>=20
>=20
>>>=20
>>>>> +
>>>>> +Rationale:
>>>>> +
>>>>> +Comments:
>>>>> +
>>>>> +Covers:
>>>>> + - `XenProd~device_passthrough~1`
>>>>> +
>>>>> +Deassign PCI device from domain (with IOMMU)
>>>>> +--------------------------------------------
>>>>> +
>>>>> +`XenSwdgn~passthrough_deassign_pci_device_with_iommu~1`
>>>>> +
>>>>> +Description:
>>>>> +Xen shall deassign a specified PCI device from a domain during its d=
estruction.
>>>>> +The physical device to be deassigned is protected by the IOMMU.
>>>> Remove second sentence or turn it into a req to say that the PCI devic=
e shall not be allowed to do DMA anymore somehow.
>>>=20
>>>=20
>>> I would like to clarify, the second sentence here is just to indicate w=
hat type of device (in the context of IOMMU involvement) the requirement is=
 talking about, not about special care for denying any DMA from it after de=
assigning.
>>>=20
>>> If you still think that we need a new requirement to explicitly highlig=
ht that, I will be ok to create, in that case, I assume, the platform devic=
e will want to gain the similar requirement. Please let me know your prefer=
ence.
>> As said in the mail to stefano, i think we should try to generalise more=
.
>> So i would say we should handle:
>> - register assignments
>> - DMA engine handling
>> - interrupt handling
>> A device is a just a logical construct which may or may not contain or u=
se several of those elements.
>=20
>=20
> I agree regarding DMA engine handling. As for register assignments and in=
terrupt handling I am not quite sure. I am afraid we will need to different=
iate between platform and PCI devices.

Once a PCI device has been detected it becomes some registers and interrupt=
s.
There might be some PCI ways to configure some stuff but appart from that i=
 do not see any difference with a platform device.
Do i miss something ?

>=20
>=20
>>>=20
>>>=20
>>>>> +
>>>>> +Rationale:
>>>>> +
>>>>> +Comments:
>>>>> +
>>>>> +Covers:
>>>>> + - `XenProd~device_passthrough~1`
>>>>> +
>>>>> +Forbid the same PCI device assignment to multiple domains
>>>>> +---------------------------------------------------------
>>>>> +
>>>>> +`XenSwdgn~passthrough_forbid_same_pci_device_assignment~1`
>>>>> +
>>>>> +Description:
>>>>> +Xen shall not assign the same PCI device to multiple domains by fail=
ing to
>>>>> +create a new domain if the device to be passed through is already as=
signed
>>>>> +to the existing domain. Also different PCI devices which share some =
resources
>>>>> +(interrupts, IOMMU connections) can be assigned only to the same dom=
ain.
>>>> Please split and simplify
>>>> - Xen shall assign a single device to a single domain
>>>> - Xen shall assign PCI devices sharing resources to the same domain.
>>>=20
>>> Good point, will split.
>>>=20
>>>=20
>>>>> +
>>>>> +Rationale:
>>>>> +
>>>>> +Comments:
>>>>> +
>>>>> +Covers:
>>>>> + - `XenProd~device_passthrough~1`
>>>>> +
>>>>> +Requirements for Arm64 only
>>>>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
>>>>> +
>>>>> +Assign interrupt-less platform device to domain
>>>>> +-----------------------------------------------
>>>>> +
>>>>> +`XenSwdgn~passthrough_assign_interrupt_less_platform_device~1`
>>>>> +
>>>>> +Description:
>>>>> +Xen shall assign a specified platform device that has only a MMIO re=
gion
>>>>> +(does not have any interrupts) to a domain during its creation using=
 passthrough
>>>>> +device tree.
>>>>> +The example of interrupt-less device is PWM or clock controller.
>>>> I am a bit puzzled by this req. Why making a specific case for interru=
pt less ?
>>>=20
>>>=20
>>> Those devices exist and can be assigned to a domain, they are configure=
d slightly differently in comparison with devices with interrupts ("xen,pat=
h" is not needed for the former), other code paths are executed in Xen.
>>>=20
>>> More technical details:
>>> The allowance of the platform device assignment which is not behind an =
IOMMU (for both non-DMA-capable and DMA-capable devices) is specified using=
 device tree property ("xen,force-assign-without-iommu") in the device node=
 described in the passthrough device tree. The said property also allows th=
e interrupt-less platform device assignment (a device that has only a MMIO =
region) without specifying the corresponding node in the host device via de=
vice tree property ("xen,path").
>> Please see upper.
>=20
> Yes, what I got from the text above is that we won't need a separate set =
of requirements for interrupt-less device, I will drop them. The same goes =
for "Assign/Deassign *non-DMA-capable* platform device to domain". Please l=
et me know if I got this wrong.


No sounds good.

>=20
>=20
> [snip]
>=20
>=20
>>>>> +
>>>>> +Assign DMA-capable platform device to domain (without IOMMU)
>>>>> +------------------------------------------------------------
>>>>> +
>>>>> +`XenSwdgn~passthrough_assign_dma_platform_device_without_iommu~1`
>>>>> +
>>>>> +Description:
>>>>> +Xen shall assign a specified DMA-capable platform device to a domain=
 during
>>>>> +its creation using passthrough device tree. The physical device to b=
e assigned
>>>>> +is not protected by the IOMMU.
>>>>> +The DMA-capable device assignment which is not behind an IOMMU is al=
lowed for
>>>>> +the direct mapped domains only. The direct mapped domain must be eit=
her safe or
>>>>> +additional security mechanisms for protecting against possible malic=
ious or
>>>>> +buggy DMA devices must be in place, e.g. Xilinx memory protection un=
it (XMPU)
>>>>> +and Xilinx peripheral protection unit (XPPU).
>>>> Please split in several reqs.
>>>=20
>>>=20
>>> I agree, will do. I feel it should be split into the following requirem=
ents:
>>> - Assign DMA-capable platform device to domain (without IOMMU)
>>> - Create direct mapped domain
>>> - Enable additional security mechanisms in direct mapped domain
>>>=20
>>> To be honest, I'm not quite sure whether it is worth creating the last =
requirement ...
>> I do not think the last one is needed here.
>> It could be an integrator guidance at best.
>=20
> ok, thanks for the clarification.

Cheers
Bertrand

>=20
>=20
>> Cheers
>> Bertrand
>>>=20
>>>=20
>>>> Stopping here my review for now
>>>=20
>>> Thanks for the review.
>>>=20
>>>=20
>>>> Cheers
>>>> Bertrand
>>>=20
>>> [snip]



