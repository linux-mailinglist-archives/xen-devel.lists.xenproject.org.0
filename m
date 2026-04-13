Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sCr8AD4C3Wk3YwkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 13 Apr 2026 16:48:30 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF023ED84D
	for <lists+xen-devel@lfdr.de>; Mon, 13 Apr 2026 16:48:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1281230.1564243 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCIZf-0001M0-SM; Mon, 13 Apr 2026 14:47:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1281230.1564243; Mon, 13 Apr 2026 14:47:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCIZf-0001JG-PB; Mon, 13 Apr 2026 14:47:39 +0000
Received: by outflank-mailman (input) for mailman id 1281230;
 Mon, 13 Apr 2026 14:47:38 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Luca.Fancellu@arm.com>) id 1wCIZd-0001JA-T7
 for xen-devel@lists.xenproject.org; Mon, 13 Apr 2026 14:47:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wCIZd-005Sru-0O
 for xen-devel@lists.xenproject.org; Mon, 13 Apr 2026 16:47:37 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69dd0206-bab6-0a2a0a5309dd-0a2a4505df80-8
 for <xen-devel@lists.xenproject.org>; Mon, 13 Apr 2026 16:47:36 +0200
Received: from [40.107.162.51]
 (helo=PA4PR04CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69dd0207-3760-0a2a45050019-286ba2335dd3-4
 for <xen-devel@lists.xenproject.org>; Mon, 13 Apr 2026 16:47:36 +0200
Received: from AM8P191CA0019.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:21a::24)
 by DBBPR08MB5994.eurprd08.prod.outlook.com (2603:10a6:10:20d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Mon, 13 Apr
 2026 14:47:32 +0000
Received: from AM4PEPF00027A65.eurprd04.prod.outlook.com
 (2603:10a6:20b:21a:cafe::4e) by AM8P191CA0019.outlook.office365.com
 (2603:10a6:20b:21a::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.48 via Frontend Transport; Mon,
 13 Apr 2026 14:47:32 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00027A65.mail.protection.outlook.com (10.167.16.86) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.17
 via Frontend Transport; Mon, 13 Apr 2026 14:47:32 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by GV2PR08MB11605.eurprd08.prod.outlook.com (2603:10a6:150:2d6::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Mon, 13 Apr
 2026 14:46:29 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.20.9769.046; Mon, 13 Apr 2026
 14:46:29 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=arm.com header.i="@arm.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"; dkim=pass header.s=selector1 header.d=arm.com header.i="@arm.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=A13YOEKs/5fu+PG42GwaQnDsIYmOHBjecb03/BJN2qlozKy/f9lRBIpvfxKDhjTms6405Xs+NHkUos094fYuVvga2+/X3wv3kJB4HJJHdf0GpTnNanpT9Ly7WUUxummUPE7064uouUAyGEhJQwWFw/AKBaBkfClK9LvCsPDhadVS9ieMUjLJeje7p8gKlVhU7by0HaPuaAkLLm/6aRRQ5rtdK6eG14y/bWiUHO6r5xetRF/dp47ImS19Kv+fOMBU86iANfJ77FmJEWR9xWgKWv6BS5ifULwnnn3OFbU4OAv9E2bIOJvMXkInToPsRTf1Sz+xSAa0dFJ9TSsBokyUVw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p4FmrOpFb0e42n9yiw5GMtvYtRFntCV4vjFBnK7J5CQ=;
 b=aQJI5Jbg7YkmQHijPwK1YCbvoXqwS/bTR3Xeoi5UtmcutG2a9FM+oJoOYvBTmeR00uQcmtQJzkU3yWLRySEpeVssfOmsx8WnD8psEe+kFHjw+t1CVYTyT+u704o1wHrY/lvA95hoHr5kH5kHPejb5Voo9BG7/mHDTmg2KbGPeQsY6wzWonxgYk+3Z08NM/1QM+RycjN/R9N0joZKq/BViVLCN9QcMRxrqzTBgCSQnb3LKuD/qZcD82h5+z1cGQ1qQgm5Jp0Rv1LjLqzw8mssYvfRR5Rydrl1HqRuJUUDDhtfb2hc2NWaRBpytF3FkXxeKA2Y/TRE1eI2TMcNhaD9kg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=epam.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p4FmrOpFb0e42n9yiw5GMtvYtRFntCV4vjFBnK7J5CQ=;
 b=E9Y1+5FcyYcH7WWNRNjH9A23Wkgp9rtREzhzlnyN8OrmlUxZYf+JVDfOCqHxilwbDODs2fvPnxsAzObka2wrlAveDarKCN/DvA4YBr8RYgixIFEbLCr+y2izl/hw80kZ9TqKfvABxF8A2KY5wOMCuQDQDkfNuFQIXwGS7cEKucQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iDe8x30MXtO/HO8CFSN6E6vwtdqo++h+eiMWZwoCBQCPhKAdh27XRP6aJ8N0uESjMoEuVJG3p5uFcO57znDe2WSEyHwM0HO9uQI3A0Ld8X5GZ+dGZwQpZ+XeEC+RopYkfIFnj8GD449LUyjEqwvkoANzc0Jd5SryOvJ6aTI7bfkTieoSRkpS/LNsrUUM6m96PFwwGpE+OUOUE1wIHWew3bXf/2nXJNdJ7Te6a7nssyHOqku7ftg3EF482fQ0n6oNlzQlCVFo81QjivEmzne/IWBzI7UplFPo2FbzHryLtNLYefGtzZIEQTjUhKHyK04A9AAMWsNkKQzTOHohAXpyoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p4FmrOpFb0e42n9yiw5GMtvYtRFntCV4vjFBnK7J5CQ=;
 b=PJvgHDltr+Qrr1JFZQrRl7EtxsiBi9AVw+qGDxpvxlD0BQB/uARmCYO3cBUeU708q7hjXC4BSbyLanjdjfwgSMI5tmknzvM+kAQys//mZ+eR+ZvcQxO3TspCzmpGW40pIsq7dvryz90BFBFmTsDfiqb6xTg0RERDLb20OUw6pl1OQ4lWw3b8iYevHGo0h0QTb3mV1kKsEyRS9UfAhS9XnVfVQ08HRaQZxNRp1h9rhmm9CdlK6U4CQu8WZKDHUKueKgNBkoz/xyvjGtKFSIQEDKb77UbDX1Twq3xu9CdfKsrQjRA7ls6+HRSVpD7eKfesw4dFFAna80jZLkXHKQ81Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p4FmrOpFb0e42n9yiw5GMtvYtRFntCV4vjFBnK7J5CQ=;
 b=E9Y1+5FcyYcH7WWNRNjH9A23Wkgp9rtREzhzlnyN8OrmlUxZYf+JVDfOCqHxilwbDODs2fvPnxsAzObka2wrlAveDarKCN/DvA4YBr8RYgixIFEbLCr+y2izl/hw80kZ9TqKfvABxF8A2KY5wOMCuQDQDkfNuFQIXwGS7cEKucQ=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Milan Djokic <milan_djokic@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Rahul
 Singh <Rahul.Singh@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v3 20/23] xen/arm: vIOMMU: Modify the partial device tree
 for dom0less
Thread-Topic: [PATCH v3 20/23] xen/arm: vIOMMU: Modify the partial device tree
 for dom0less
Thread-Index: AQHcy1RPOVtQoBcTykuFEWgWmPGPfw==
Date: Mon, 13 Apr 2026 14:46:29 +0000
Message-ID: <F81332F5-7278-489E-BB76-4BDEEB2BA727@arm.com>
References: <cover.1774918270.git.milan_djokic@epam.com>
 <2de0eddeb862a7d9f0fb55c7dca1152591d71404.1774918270.git.milan_djokic@epam.com>
In-Reply-To:
 <2de0eddeb862a7d9f0fb55c7dca1152591d71404.1774918270.git.milan_djokic@epam.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|GV2PR08MB11605:EE_|AM4PEPF00027A65:EE_|DBBPR08MB5994:EE_
X-MS-Office365-Filtering-Correlation-Id: bcff1009-62e3-4384-45c6-08de996b984a
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700021|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 0kO2crIU1Ejio8ZX9ziZyhISCuhHieBLfitmAC2U16NH/lKa28NqxB/pk6im3w4IQKHP3RKyuHZPDKkHP4+sQWY5Axx5qhhFEQ2krArpTOdS7JQ4CWSlQCoHuKsbFufM9xaG+RINmXn3JMpxiMm2BDz0q0EGCO5gw5ChoMRKXv4zt1qRsmqeSH+fiqUxQ9iUPUv1zO4mx0s9SMRnBP5GGxkcNhTe8mCjry4HfFFeoHAVsJaGei76EJCtnDtYvgFHVsEdHQJ3jm74/Z8hC/BbFbKlo2vnlgMNn85krFxJHgJbGHVet7pJOKJnxTqxydRLMmkE38pXDmM7u0okc9O239tIUSwtIyH6//8VGb1bUMHMEchM5apV7qlaAEMbx8KjmH7jR/eae9Fb9IzDFuZFsVo6qaMNlvhUv5DkRlQ0E9pmHYdmm3v903BtPDLx5KjEMSd/Ksn0DCWwtfRtZtcrOXsZFrUySU3s1q7A2wdP0xvefYFGeSKijjB0GFjyNaNL96E5JZxhzfmbjKb+MCfIV/xhlWsw91VyA8YeIDT9KW+oGjiQcBmPCZYbxjWDga4Uqq7ne1vC5cpf8/0M+DYbnfhwxptp3beETBP0AE4Lp1DLeF2AxqFKsQjSSBOvWXvmILM4O5+KQcwPDHap5GxJqGeQT/uHn1b0IKWSG0a7vTKFu9Y75KA3E5qlNOegyJS4yZ6EBc8p4Gjc/9IT0qQ2mrpGTmBY8E3LcRKcYvTTZ3vsVjSD58SRqi0AxJ5a5wNCoiErZSGuekmf8ZaDV4IY56lj4hzhlCcczWDcra7Vsr0=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <7255C820ECBFAB46B46587FFAA6CFE23@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 pwbajrYYlUpqKdgEKhHM2tFbx6i02gud/30hiaFyZZWmLyplCxM/vn6J5/D3AXGcRvFM7UbxI1MRfaDfcv6lGTTcoTJpUWavu9AFHGvyzBgbufVDEMC+LlYmKt4ep9DKHs+aoh0PYyfYHKv4adHprNY2JTVSanF6n5+34cMdFhGQMqyIzb+puX0VeiSWsWKe8xwYe5Z3KnBTT8bFCEpevYUArXYVwgiBz21fqfyLZ7r6Nd3HaQvP9NKrbTmnisgnIyXmTxg/elAiIMWKqErDaeeJnLUVviN+9tVNIaPMIG/kI7FxiA9rAhrmIptgLCCBDQQVWY0iprOE5TP0I1kpTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB11605
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00027A65.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e45ecc21-da52-43e8-2a12-08de996b726e
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|35042699022|14060799003|36860700016|1800799024|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	ckg+RrE+EbbIs/mjDu0x+bi4SyQaAnt3u6vu2QZJZ3uhPwZBrnSW+nj2/BSXZmmevZpIuAB48f5itvRvtfMHSvRMtf+LLkiKLL0St4dCIriKiIj6q89NbfOW0rMAgU/Gb55EJWHmzKZtYAdE64YrkTN2HQauchGJkuomv05mXRh3NZwsWq7jrKvjstMZkODhoeRScIZ51bhdRxlPVL89ZWQfbTWUuuhBrsY9oT9AZUjXn5/a+TVyGLD9pwmg3ILe0F64DLRAQrLk/GOmO2YGd8XOxQsecpAC/kZjOZ/IPX5INZrWdhZZj1Go2VUCB9xEryEfBUVgNiAl5BaslQMJsgVasFLs+bIMIUeeWKiipCp9HrMJo2li1g200njkOWbBBufS0YtLL64sL64/c9nb45F0OvoymvvE9ZDKYGcSmbkWenQKfQ3yIw+qpU6vV26mYxgv9G8tYQEK7R7olDhVC0RFaeveIQII8vlf28vOVOnj5u8BXbsqWLXoHoVT3OHHFfxLRScvuMrJVx4DQ3BPXr795GGWdBVmOEcEbSAVpkkL/tMDZFF3CRABhVizPEUdUjIAqIvVPjAp2Hp4POJ27JugGpiMu9EFOVZaM148jyaVb1s8D/KXvZcjMv4h3dzOuvtsUOn/w2tcIVy5N4mxZyFNEiaakjgn6vHzhgwRuCA+lOOBJNZeJWZJ2p0Cn/AAEKBiTAs9PXzun9OWlgByJW7UHtEEWAblJkpcqUFCmbJli8IdIlqEuCU2SOIO/YOsW/4NR3ZA5By+GrLfUsXvZg==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(35042699022)(14060799003)(36860700016)(1800799024)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	hiR0EYiCY/JOpFiX1EXzwPGW63uES4PyGusw+fhPDg4hqwiZYQbYSEm1zLXo2BZ+BufqykuMjUUi6f2/2cMFHN2CJA59yd7HBwb0UNoUFuBsMJSReejgauWBQhzFZB/DkRw1awlanfIA6/xwlvWhCeDOc4LkPrrjUw0BGkU3GgQhDQHFmg6pJtJKolZm4RrZc4g2uhMVJf+7Mr5uL8ngO/6wcJ/yr7Pe4/1LiuMv8bOAfc0UdWvFK1O9iUSuilYMQQ+hc5H/m/COKQKvH1XRdD7X2FSnl5r8DtJHKbWbHq98+ArLA8LuS3V5QedrO12OBiTserp/35HUoLW0QrLm3nmbGy7lQPAZBIancD0iu5DSR7J2uc0Ik5sdXP3qRQSNzCbyLWy4F7VKxNH1rjeouKeGjBYxZJCVIdGhDZprdNx/iGf/u1ZffxCYspVprMN/
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2026 14:47:32.7628
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bcff1009-62e3-4384-45c6-08de996b984a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00027A65.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB5994
X-purgate-ID: tlsNG-c201ff/1776091656-383E496F-E143179A/0/0
X-purgate-type: clean
X-purgate-size: 2742
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:milan_djokic@epam.com,m:xen-devel@lists.xenproject.org,m:Rahul.Singh@arm.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:michal.orzel@amd.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:email,arm.com:dkim,arm.com:email,arm.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: 4BF023ED84D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Milan,

> On 31 Mar 2026, at 02:52, Milan Djokic <milan_djokic@epam.com> wrote:
>=20
> From: Rahul Singh <rahul.singh@arm.com>
>=20
> To configure IOMMU in guest for passthrough devices, user will need to
> copy the unmodified "iommus" property from host device tree to partial
> device tree. To enable the dom0 linux kernel to confiure the IOMMU

typo s/confiure/configure/

> correctly replace the phandle in partial device tree with virtual
> IOMMU phandle when "iommus" property is set.
>=20
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> Signed-off-by: Milan Djokic <milan_djokic@epam.com>
> ---
> xen/common/device-tree/dom0less-build.c | 31 ++++++++++++++++++++++++-
> 1 file changed, 30 insertions(+), 1 deletion(-)
>=20
> diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-=
tree/dom0less-build.c
> index 840d14419d..4b74d2f705 100644
> --- a/xen/common/device-tree/dom0less-build.c
> +++ b/xen/common/device-tree/dom0less-build.c
> @@ -318,7 +318,35 @@ static int __init handle_prop_pfdt(struct kernel_inf=
o *kinfo,
>     return ( propoff !=3D -FDT_ERR_NOTFOUND ) ? propoff : 0;
> }
>=20
> -static int __init scan_pfdt_node(struct kernel_info *kinfo, const void *=
pfdt,
> +static void modify_pfdt_node(void *pfdt, int nodeoff)
> +{
> +    int proplen, i, rc;
> +    const fdt32_t *prop;
> +    fdt32_t *prop_c;
> +
> +    prop =3D fdt_getprop(pfdt, nodeoff, "iommus", &proplen);
> +    if ( !prop )
> +        return;
> +
> +    prop_c =3D xzalloc_bytes(proplen);

we should check if the allocation was ok

> +
> +    for ( i =3D 0; i < proplen / 8; ++i )
> +    {
> +        prop_c[i * 2] =3D cpu_to_fdt32(GUEST_PHANDLE_VSMMUV3);
> +        prop_c[i * 2 + 1] =3D prop[i * 2 + 1];
> +    }
> +
> +    rc =3D fdt_setprop(pfdt, nodeoff, "iommus", prop_c, proplen);
> +    if ( rc )
> +    {
> +        dprintk(XENLOG_ERR, "Can't set the iommus property in partial FD=
T");
> +        return;
> +    }
> +
> +    return;
> +}
> +
> +static int __init scan_pfdt_node(struct kernel_info *kinfo, void *pfdt,
>                                  int nodeoff,
>                                  uint32_t address_cells, uint32_t size_ce=
lls,
>                                  bool scan_passthrough_prop)
> @@ -344,6 +372,7 @@ static int __init scan_pfdt_node(struct kernel_info *=
kinfo, const void *pfdt,
>     node_next =3D fdt_first_subnode(pfdt, nodeoff);
>     while ( node_next > 0 )
>     {
> +        modify_pfdt_node(pfdt, node_next);
>         rc =3D scan_pfdt_node(kinfo, pfdt, node_next, address_cells, size=
_cells,
>                             scan_passthrough_prop);
>         if ( rc )
>=20

Cheers,
Luca


