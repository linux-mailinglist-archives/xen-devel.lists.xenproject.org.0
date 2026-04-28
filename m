Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qD2OE6hq8GkITAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2026 10:07:04 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F80747F9BF
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2026 10:07:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1295440.1572082 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHdT0-0004Qv-HO; Tue, 28 Apr 2026 08:06:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1295440.1572082; Tue, 28 Apr 2026 08:06:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHdT0-0004OG-ES; Tue, 28 Apr 2026 08:06:50 +0000
Received: by outflank-mailman (input) for mailman id 1295440;
 Tue, 28 Apr 2026 08:06:49 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Luca.Fancellu@arm.com>) id 1wHdSz-0004OA-6V
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2026 08:06:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wHdSy-00F5H0-CH
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2026 10:06:48 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69f06a96-2eae-0a2a0a5409dd-0a2a45019742-6
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 10:06:47 +0200
Received: from [52.101.72.40]
 (helo=AM0PR02CU008.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69f06a97-c1f2-0a2a45010019-346548286f10-4
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 10:06:47 +0200
Received: from CWLP123CA0035.GBRP123.PROD.OUTLOOK.COM (2603:10a6:401:58::23)
 by PAXPR08MB7645.eurprd08.prod.outlook.com (2603:10a6:102:240::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Tue, 28 Apr
 2026 08:06:40 +0000
Received: from AMS0EPF000001AB.eurprd05.prod.outlook.com
 (2603:10a6:401:58:cafe::38) by CWLP123CA0035.outlook.office365.com
 (2603:10a6:401:58::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.26 via Frontend Transport; Tue,
 28 Apr 2026 08:06:40 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001AB.mail.protection.outlook.com (10.167.16.151) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.18
 via Frontend Transport; Tue, 28 Apr 2026 08:06:40 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by PA4PR08MB7409.eurprd08.prod.outlook.com (2603:10a6:102:2a1::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Tue, 28 Apr
 2026 08:05:36 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.20.9846.025; Tue, 28 Apr 2026
 08:05:34 +0000
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
 b=O4F/W7oV58Qw9R/iNX/3QAX2vCDZVuGT8wvC7JT+WBsTvIrqNUD+TXvVRQOJKlcJg38Lmf+ABpl8xzawNUHR1ARRFL4GzK1doK5ZdLJQcUPziQurc8dO9LT8ykDnXUHqNk60V0mNUFu2nrtaoC7+7vGQ5fYvzsK8oMu+2w9kqhn7AtmzS20iBqpbvGpIIFez8UihZ1QTw4dG3xoC9u6/pExus17XD9FYcXpr6+iJHw4XcWoFtzypl/8BQAarThaVSTaKV/+KnG+nmDAo7l3JYYN/Lpg3/qTXUrhkBM1kpkiBdZQvsXFACLbiePRLTU8TU0pB5qplcYPpw6d8cC6apQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8TvU1uWUvq40iIuRGu+7+Arbt4KrRaG+uvclWK2hGHQ=;
 b=LhFk+cl4rGuyWiR7kTzoO+KxyIhDZx8ZdGi/n4TSSdwR5b5R2Vom9xO9gJyOqFjqqxr2X/UiUQ1JROLo7E7KlwHhHSjoL31iXRbmqNNj2H0wIa1+ieaobckAezypYG/363oSUje8q4B4p96daAz8/oQT7hNGzRTA4Ifgx37ynutwE6TK+ayf/a9cFEnhhaQasQDGVZcyHir5umJGCe+sDycteS3K4XOychkzLfAWE3DAnhSQq0d/0F3ig5pTmySwXgcp+WIx3eXkxIRWzIOL2n77LKKpAANStLhUhzTs610Gb991A82JtkxyhIXI+vCV6m3odnaxyinyEGimC0FgAA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8TvU1uWUvq40iIuRGu+7+Arbt4KrRaG+uvclWK2hGHQ=;
 b=fJeA6Ky49ZZ1PzaJFexCJKZ3iSbymcJN+pMPTUSjTgcpPrLPTmd4iSSrR37Sz5tWhwrCyqlgPeinQWBPt/dS9l1nS5yCpTwJRpdIl2f0KGQ+rBjNvtLSUibUSUf/ldUnF9g6FnqdOwzm32yrKaNTG1ClKu+4H6JUqf4Ei/BbfcA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o4P6McHCG+eYw6qPAJTbq3rK2ez7zRoUrCtbK3m8Y71Py8xUhjc0qX6/tSdwhiVDZqsbizD9/HY4Dqnx88ZpCWinuGPKa/2a6uVpP3nIZZNrj+eCUHdtQuuN95CnorzfcMjLnkY5TTfvv9LkZFfpMvrV7uI2HjFmoH2H2cgNNaexy5lNh9Qs9AOfa9/TE/n6qJyw5xaaNhgsaMUmkheiTGUQmBVO6ee43LEB4YfC3V2UVn6sSRRxOdP4EMBTIjOu+eA3wneAp+tNI08Ow+6zgpiT0Zph1CqyY4RCk42T41K0/y+WiX7mpfz8mW9GTvtFqf6d8dQK+kXhMu3sOseHog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8TvU1uWUvq40iIuRGu+7+Arbt4KrRaG+uvclWK2hGHQ=;
 b=fkrzvYZuv+yMJjUVzQIS7vcNjTBPIYLJYmbYubIgITSYMTgXncTDiOp/4MNjXUyBBj9SiXgnGoc7k6yJnT+rQfCtDJ72zUaZGa6cLTqWEekPs4xSDBp91qARId/XTrOQ6FTnrG9a7eA9YDHzYaS0k0prlU/qfbDqRlh1V0B9Xg6BOum7aS4xbC9E0VFuKCXmiu7I+hlTx0HBqVwVOqPp+WzfDcfeUY8ioQM0/iEp1lGginnUuSGJgfyOmWHiHyzOEmuosnTCwjmmxjALuehw2T3l/UwPSPI+mnM+27NqTeepGgYoCiNYZIQe5JUQx1Ko6IHQnr6G7p8+en+rChbF2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8TvU1uWUvq40iIuRGu+7+Arbt4KrRaG+uvclWK2hGHQ=;
 b=fJeA6Ky49ZZ1PzaJFexCJKZ3iSbymcJN+pMPTUSjTgcpPrLPTmd4iSSrR37Sz5tWhwrCyqlgPeinQWBPt/dS9l1nS5yCpTwJRpdIl2f0KGQ+rBjNvtLSUibUSUf/ldUnF9g6FnqdOwzm32yrKaNTG1ClKu+4H6JUqf4Ei/BbfcA=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Nicola
 Vetrini <nicola.vetrini@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: Re: [PATCH v2] xen/dt-overlay: support phandle-based targeting in
 overlay_get_nodes_info
Thread-Topic: [PATCH v2] xen/dt-overlay: support phandle-based targeting in
 overlay_get_nodes_info
Thread-Index: AQHc1uViFjC75IOoe0On2+u4z8CzhrX0HacA
Date: Tue, 28 Apr 2026 08:05:34 +0000
Message-ID: <E8BED2DC-49DB-4A10-B179-25A5880A5593@arm.com>
References: <20260428080218.19371-1-michal.orzel@amd.com>
In-Reply-To: <20260428080218.19371-1-michal.orzel@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|PA4PR08MB7409:EE_|AMS0EPF000001AB:EE_|PAXPR08MB7645:EE_
X-MS-Office365-Filtering-Correlation-Id: cacb8c9c-d6b6-4947-5e40-08dea4fd1406
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700021|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info-Original:
 lW26pNmG6BYMw2HHLwE2Cub90jPa1x4cjHMgX7fvdMf+na0A05YOtTI79EHDPnUGBJyq8265G2D/WYGYdRGCtksRctCkUm8cLDswHx/BQ77zx8iY3/+hkw7zNuWqMyYIzqRu8X3WzDDELnO0xp+hgBD7uEfTd7/ETVIrK5z8hjKCbrh9J2k9B5xBfhC2Xw9YJBSvPjD1XB63XhuSWOLnbFp2k1XrCsCSxY2ELOiY2G6oqR3otxfxcuUZFZqMEPi+Sx52BkI8b637/Lr/matuaGjRNKidxZXe9wU1HJuIaZDisZThQr99yP4Ln8U96VyzGN6eIK4POV2n/ngRC2M6D7vFrsoytb6PMUV0BgwxhAACaiFMQdQL3XEPY7VWn+RDbXBaXNfDcq9rCJgmH5A2ucs4EplvWtYXL3ca3XpqoMp7DrIn9N/YvLNgFF4aIAu7rRf6pCM9+kR7f8Zmx+t4XlQgl4XPU7IvggZLjbb4vUI2UTmOPBLBox8yvOTW6lt9lbaFTc4eCPauqvC+MxHa1VLmkGouk6CG6Ovn5//Usm78D2IPTcOV3/XE8BYhFFBAS4QrA6TdmQyUHOxgz3PEoABUAi0R60pF6FEkHtUu1EnwzZiHj21U3Z5VPy0peYde+tyVqJmf2DQMmawuUzVwp/49Vn25FZ9zt9JlmYRYgr90Ct+S0sBF5Mf1SdY0PPW5jiMacr/hqt9sXqF4eAVizqFJgNdqxB1/GqtwjPrFaIpjPT7vaee2T7nMvhszlCsdz5dnN0xcHza3i7UYbwtUBpviADYMWP1yti/KsUcWYPE=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <96C413748FCA7341881C45B29E13F66B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 dalV56x3Z6TZV9lXiF8mPQjaavf2PkNbCt+MBbvfWsy6YWWZjkkMk9xg5wRn0Cvx94/MukAPp5OpuwSV7yGGcbHwNLXzkbTcbn91kHlfPgVPHGLHbOgUoEXrqJK80l6MKuoLMyltr+K3CQtp70VGxBdC9cZzv4YcOVt2LKtvKiEdsKKM7avZ/pOA/EIo289eEdw3umdqYzwuVupu1swU4VubN57Coz/D5ZDG1UFC5BQCxQY2nMpOxBRnSkO7svQrJqIlwE/oEbbbsr6uJfW2PIRQT2KmxEv0U9o/OS5bE25u7H1wLeKLG7XsM7hKbdUK1aoYchdH0s8Hh3QEJDnucg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB7409
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001AB.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	441f0a86-25d0-4f6e-3024-08dea4fcecff
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|14060799003|1800799024|82310400026|35042699022|376014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	LLUeOwYGiYS7Y9Vqaj4sbtnG9e0Z6jtATgXp8yrbQeA/RHT2jg8ZBxb/qR+vGxgFc87UVMgGjKdrJelDmPiAfgnOUcGIHaxFgpTcGxZeCCdH6JFah7wRjTkegWyIQTt/z7Bd758q2J85rBiwoxYDwUKTsbUrUa5hwuVzpbj2twbEbUzEfbFItt6XFJsZN68r47CNJN6VFK5Wy648ne1JnqXVIZJuutmM4c1KgfRu/vVagD9d5VVConClXEcrcLAiJiY15WAUWt0Y+2wv0DNsE7GjmNv2mpCQLFqbfxBJpUMNllxHBpXffmxGqpG0p8ENh9ANfnir2GY5MJOz0fhE30lZlMOmXTPr5dKZ433S6YJ9sbx5FlBqrPrSSTzWLFJQl0rW4gmQofn65w/4/sjLZy617xC+ndj2+zf2wqZ1wlx7+Lbyt9Fp5M7gEW2Wk+ziTN/iSWX7n3dCltZmvHq9Xb7vrz2eLIP1tm+Jkmn6ZblweIbatOGWn0W3ILM6FPKv/uLrhNsHEglrsazGnVx5NG+KKOV2bOeRkky7qZHS36dYNNgA/bIN36NYAcX21abcGOFhvpYIzdxRQnUHBzTBOKoJku+SBAUy/58ll+014zID0jq5tM7NWADfvFrQcrepDPRc1uqR04B8gArpo2kOe6ybwM2DyUj6yiKRW9eywH9QZIq22KkpNdEvvvRy5P3otfdUp39/Oswxq0Oqv5gMgbnu/VB8nlKccJG3kgqp9MPQBvafYdd3lX+UDylC2gZLfyMy0rf/ye3/foHJ8mGqTw==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(14060799003)(1800799024)(82310400026)(35042699022)(376014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	dLqXhYDEa0fEDjSGkKtzZlVx7jyo7YRv2ayeLhqLq0oSVr/TFuvDlfU5cdaRClBk0KWPaPuMQwJC499kbTVSH8qsVdrBCZQ8LbABAWbEFjKQvoCT4nvMSCBWmsAAiCFCUeT2NBuaem30a1xnpIoRVmEhXGYNGIs4D+A19NOGnOshmPXQBRnu34SKP0EUt6VFjWo5ENUqoYSmTcOnEY4cG8pHh2+ZIeCxQMdv+10DgWtt8om5IwK9ekS+G9vNPoD2e4k31n5UEEA8RC9cy4uKrQ5n5KOWo5mD/oCwYTsWuzo4lTvDvk+vXZecLKiCFE/DzkD8V6vGd1olxrMinHOUDlQ043+nm0tmjKX57u32e8RRyC6wd3094H7OqREuewNXz/GfANtrFE4hiSA1O+RhIJBdEcnDNFxJNXzlfjQdVKNJLt6nH8SQRGWFNy2a8gj4
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2026 08:06:40.1848
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cacb8c9c-d6b6-4947-5e40-08dea4fd1406
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001AB.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7645
X-purgate-ID: tlsNG-d62444/1777363607-BD26DFF4-D9BE6DE4/0/0
X-purgate-type: clean
X-purgate-size: 1964
X-Rspamd-Queue-Id: 8F80747F9BF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.08 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:michal.orzel@amd.com,m:xen-devel@lists.xenproject.org,m:nicola.vetrini@bugseng.com,m:cardoe@cardoe.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[arm.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns]

DQoNCj4gT24gMjggQXByIDIwMjYsIGF0IDA5OjAyLCBNaWNoYWwgT3J6ZWwgPG1pY2hhbC5vcnpl
bEBhbWQuY29tPiB3cm90ZToNCj4gDQo+IG92ZXJsYXlfZ2V0X25vZGVzX2luZm8oKSBpcyBjYWxs
ZWQgYmVmb3JlIGZkdF9vdmVybGF5X2FwcGx5KCkgdG8gZXh0cmFjdA0KPiB0YXJnZXQgcGF0aHMg
ZnJvbSB0aGUgb3ZlcmxheS4gVGhpcyBmYWlscyBmb3Igb3ZlcmxheXMgdXNpbmcgcGhhbmRsZS1i
YXNlZA0KPiB0YXJnZXRpbmcgKHRhcmdldCA9IDwmbGFiZWw+KSBiZWNhdXNlIERUQyBjb21waWxl
cyB0aGVzZSBhcyB1bnJlc29sdmVkDQo+IGZpeHVwcyAodGFyZ2V0ID0gPDB4ZmZmZmZmZmY+KSwg
Y2F1c2luZyBmZHRfb3ZlcmxheV90YXJnZXRfb2Zmc2V0KCkgdG8NCj4gcmV0dXJuIC1GRFRfRVJS
X0JBRFBIQU5ETEUuIFByaW9yIHRvIHRoaXMgY2hhbmdlIHVzZXJzIHdlcmUgZm9yY2VkIHRvDQo+
IG1hbnVhbGx5IG1vZGlmeSB0aGUgZHRibyAoZXZlbiBmb3IgaHdkb20pIHRvIHN3aXRjaCBmcm9t
IHRhcmdldCB0bw0KPiB0YXJnZXQtcGhhbmRsZSBieSBtYW51YWxseSBpbnNwZWN0aW5nIGFsc28g
dGhlIGhvc3QgRFRCLg0KPiANCj4gSW50cm9kdWNlIG92ZXJsYXlfZ2V0X3RhcmdldF9wYXRoKCkg
d2hpY2ggZGlyZWN0bHkgaGFuZGxlcyB0aGUgdHdvDQo+IHRhcmdldGluZyBjYXNlcyB0aGF0IG9j
Y3VyIGJlZm9yZSBmaXh1cCByZXNvbHV0aW9uOg0KPiAtIHRhcmdldC1wYXRoOiB0aGUgc3RyaW5n
IHByb3BlcnR5IGlzIHJldHVybmVkIGRpcmVjdGx5Lg0KPiAtIHRhcmdldCA9IDwmbGFiZWw+OiB0
aGUgbGFiZWwgaXMgZm91bmQgaW4gdGhlIG92ZXJsYXkncyBfX2ZpeHVwc19fDQo+ICAgbm9kZSwg
dGhlbiByZXNvbHZlZCB0byBhIHBhdGggdmlhIHRoZSBiYXNlIERUQidzIF9fc3ltYm9sc19fIG5v
ZGUuDQo+IA0KPiBMaWJmZHQgZmR0X2Zvcl9lYWNoX3Byb3BlcnR5X29mZnNldCgpIHZpb2xhdGVz
IE1JU1JBIFIyMC43LiBEZXNwaXRlDQo+IGxpYmZkdCBiZWluZyBleGNsdWRlZCBmcm9tIHRoZSBh
bmFseXNpcywgdGhpcyBjYXVzZXMgRUNMQUlSIHNjYW4gdG8NCj4gcmVwb3J0IGEgcmVncmVzc2lv
biBiZWNhdXNlIHRoZSB2aW9sYXRpb24gaW50cm9kdWNlZCBieSBhIG1hY3JvIGlzDQo+IHJlcG9y
dGVkIGF0IHRoZSBjYWxsIHNpdGUuIERldmlhdGUgUjIwLjcgZm9yIGxpYmZkdC5oLg0KPiANCj4g
UmV2aWV3ZWQtYnk6IEx1Y2EgRmFuY2VsbHUgPGx1Y2EuZmFuY2VsbHVAYXJtLmNvbT4NCj4gQWNr
ZWQtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4NCj4gU2ln
bmVkLW9mZi1ieTogTWljaGFsIE9yemVsIDxtaWNoYWwub3J6ZWxAYW1kLmNvbT4NCg0KTklUOiBz
aG91bGRu4oCZdCB0aGVzZSBiZSBpbiBjaHJvbm9sb2dpY2FsIG9yZGVyPw0KDQpDaGVlcnMsDQpM
dWNhDQoNCg==

