Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YHqyHdTB/WnEigAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 12:58:28 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C24914F560C
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 12:58:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1303471.1576855 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLItj-0001EM-An; Fri, 08 May 2026 10:57:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1303471.1576855; Fri, 08 May 2026 10:57:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLItj-0001Bx-7r; Fri, 08 May 2026 10:57:35 +0000
Received: by outflank-mailman (input) for mailman id 1303471;
 Fri, 08 May 2026 10:57:34 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Luca.Fancellu@arm.com>) id 1wLIti-0001Br-1s
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 10:57:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wLIth-00CWDR-8r
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 12:57:33 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69fdc196-5cb7-0a2a0a5109dd-0a2a450cc7f6-32
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 12:57:32 +0200
Received: from [52.101.70.18]
 (helo=AS8PR04CU009.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69fdc19c-62f1-0a2a450c0019-346546127468-3
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 12:57:32 +0200
Received: from AM0P190CA0030.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:190::40)
 by DU0PR08MB9848.eurprd08.prod.outlook.com (2603:10a6:10:443::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Fri, 8 May
 2026 10:57:25 +0000
Received: from AM3PEPF0000A79A.eurprd04.prod.outlook.com
 (2603:10a6:208:190:cafe::c5) by AM0P190CA0030.outlook.office365.com
 (2603:10a6:208:190::40) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.20 via Frontend Transport; Fri,
 8 May 2026 10:57:25 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF0000A79A.mail.protection.outlook.com (10.167.16.105) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.9
 via Frontend Transport; Fri, 8 May 2026 10:57:24 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by DU0PR08MB7785.eurprd08.prod.outlook.com (2603:10a6:10:3ba::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.19; Fri, 8 May
 2026 10:56:20 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.20.9891.008; Fri, 8 May 2026
 10:56:20 +0000
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
 b=Y3nXOsBL/6yqUARtEf0nN8UhnxSRVb8TMKkqQZtllv+2jin0q2cRILfnzZ5LiNnbxDxK441p8+t5SNKxwxsCUUMpmdKgTyqKEQezDSMPsbv3MnmADs0UNWRExquYXCK85CWxhgmRmxrpG4vn9wTK/4P7EafquQhOVx6YEzMyt5E7frUoxaMgNkq0IlPMtSU3DvRtio7UU+ZwsHDCPEk06jfA3WDabtAi1Q6E0AiAFnYNI7KCeL8rCSNkMvdd4ZkuVCXoWJFEpRUEBKVp3TuIe601qoZTHHet6B7Wp4Ycd7XcoFJv7sr3Uf8uvmnH8OfG93TfWVFn1RtSZOn9PO4JnA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CP/6vag/2app4BulpkySxH1/PFZBR4XPDOK7xYt4KPw=;
 b=Ju2VsYqmH5MzRG8FKUnrRTxAjHsbnFYG2PokrDIQrjanfFk5twQqz6RPAtX6Kr647JzKCIYXl8c2LwI3n8PHWudhutPPAIFvk94+gmFsX6k4I38Rx1jRnd21Vo1IIBjNkSlPXPktAv/WbMzMQVLij6rbeL4AkJn9YDjZ4Q1MEyGHjY8Io0I8bHnHLnYYP193548nPOg5BM7p5h+nEPN6vvjD2MA18VIVV16/FZbnA1XQdOnVQio9xv12kU4yjQynRPhw8oaI2BQMLmfDK83s6UdSjaFAPwOO4VbVs3HiSIxn1+yQFuRA+EHBNN/cEKzBk36OcJNz4RKr0c2MK0OY6g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CP/6vag/2app4BulpkySxH1/PFZBR4XPDOK7xYt4KPw=;
 b=bumXGDCpyFoPvFB+de9EKYiS6MM2WEPy8HyxpAGWu8Pq6Jky8EbkYpiso6Fj99UCLNSZ9tvX3XdjXtEN4QZ1P7v8ItAEsai9Avd7E5FTa1yX9aUbIwjgHIU/3ADMWP6SJfqTjUmDhEKTLLRUZayBPe8mlZn30a27LrlFJyp8kWM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JceA6Issf6lfyo+veaT8MkTt/8o8Bh0t5xn0r+5xLCczd8llGI8Aoe5p6cEyx8jnsXvnx2vaJ67bMr7IrT4XLk6Y8NGkqtkOFflZUBxNIELhfbQFGMoipJBBiERgg4sAqW1+WFRHJo4fvADBUI+C4A6IbIEs78geBPKb4Co8FgwxJVRKSCbJjiX3KqNeQkhgTu4D3Bxptbanp7aNUUARQSqBUKUpjJqDqrujoCfSlA5qT47eL2zykAk+QL7P2JfHOIJO9bZS+c8tLGUP0hk338wM0CaSoekFPQ1JbQRAI4XMBL2p83Vv7JYmw1/ovbp4pqv6I7dvgz6dMnc/LrAK1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CP/6vag/2app4BulpkySxH1/PFZBR4XPDOK7xYt4KPw=;
 b=CPLgi7B+dVn1jvU6BqOgeMU9IsdAVfzdL1v3W9t4fgLT8T9lLbk50Q7lI4QQs7CwmsPslh7K+GKz6DJ9ZdeQ3EFxpP/O47skuAajqRwg7s771Ew77ki2Ov25CJqCpxLbGx71x/tHXqjMIXrAhNOFsfQz2DwEhZCzxPht+D5gMgsk4h5OX72z6j79mQwK94eXsP4J8LMEzxbvfthBwbAbESeQAijUPXj+eZwVVh4LRwJ9zMSuWotaPRR6bn+qzSQXW7/QivmGC0Ir1UQsFD+pE7NvCTiVKML1duXMCWPe91RXrhd0KgvKGFn5VDvg/F/RFC7raIsXxzR5CHtg9JoAtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CP/6vag/2app4BulpkySxH1/PFZBR4XPDOK7xYt4KPw=;
 b=bumXGDCpyFoPvFB+de9EKYiS6MM2WEPy8HyxpAGWu8Pq6Jky8EbkYpiso6Fj99UCLNSZ9tvX3XdjXtEN4QZ1P7v8ItAEsai9Avd7E5FTa1yX9aUbIwjgHIU/3ADMWP6SJfqTjUmDhEKTLLRUZayBPe8mlZn30a27LrlFJyp8kWM=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Mykola Kvach <xakep.amatop@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Mykola
 Kvach <mykola_kvach@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v8 02/13] xen/arm: gic-v2: Implement GIC suspend/resume
 functions
Thread-Topic: [PATCH v8 02/13] xen/arm: gic-v2: Implement GIC suspend/resume
 functions
Thread-Index: AQHc0ZIp4iA20ItBV0OKtUp08vt6QrYCSMAAgAHGpwA=
Date: Fri, 8 May 2026 10:56:19 +0000
Message-ID: <CF8E0EB2-3048-4B04-B763-AE5EF1909416@arm.com>
References: <cover.1775125380.git.mykola_kvach@epam.com>
 <5e1951e1c17037e020de9c0eecb5fba94edcd9dd.1775125380.git.mykola_kvach@epam.com>
 <EB3F884F-FCD6-4AE7-84FA-79ABF31EA88E@arm.com>
 <CAGeoDV80QHdesYQF-J4fg7wYQ6RLNg6u27aQhj4F+JoM4hU3uQ@mail.gmail.com>
In-Reply-To:
 <CAGeoDV80QHdesYQF-J4fg7wYQ6RLNg6u27aQhj4F+JoM4hU3uQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|DU0PR08MB7785:EE_|AM3PEPF0000A79A:EE_|DU0PR08MB9848:EE_
X-MS-Office365-Filtering-Correlation-Id: d2637cfb-077d-43cf-dab5-08deacf0967f
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|376014|366016|56012099003|18002099003|22082099003|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 Y8IXCuHDnDvIqdxFcEkmy2OYE+mlh902EPwVP6h1wqVVJ6YcIBy6brTDsgnaT6wrUyeCcN//KYIMmcACatvIG/Lf+97/2xia/jZxk8Ya8zRvr8EL+i2112dZzRXCGT11wkfoLDuGrre7/zAFziMB5BZ1oFYcmpvZcMy24d56b3Pfs8TsbaJTuAVc1DRQxYsArxgHLF7DuWAy6G2EoSVQ5+ijWqs9dVluSb+D/KNGFN+Q0TivrKwW7NlP6tGA1cEBsElUYf3jCzXVPLQ6TDcW6KNM6lNIYsByVoad71DYMe3o/JhmOVIN0jZloY/5fT5m7ZD3vNbkg+SXyIQPqHw4Kpo4kRjBQR/nceC4Eu5vOxyy/W3H6VpD59UZ7XHuv/lCDVlsbtPnvXLpXwJL3gA/fxlP4m1C8fsx9CI7IDZfWwTaAlaWsHGhQQIpKVZgFKiT4fqnjGZ/n62b86BPAhidrsVLuM6bwTwXyJt7sal4C3ZsiQKOfUTDYx34LoRES+OUyCq3bYL4J70GI9BrxMoR3bu76OFzE3mBcqpQwA75rKPyPCphcIVoEfw/YMkvqDb6IZyeKVHh9VkMehby9TvNuCKNJb56sb5top+ZhSoa3qSVKQ012UTjJRgWq9UshC+dmenJgMv05wp1P33hr+FtsxuBHJ9F0XvkMtd7kkCbv5OrzL/Ni8y9y6DIK37UzwD/9gMCTggNPaDlSpBRCmRu+33380Wns7e8si0bdKKKWg/hB0BcV1VliiB+Lb2bt8R1
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <64DC2241F4FD694490BE4BE0DEEA0BA0@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 T/ZA+Hlb2/EiAnpUuUQmiMTE/I/mBfEfdPiVD3cfZEIG9iJMsw4McciZHD4BT+VBLiMn7TdGwKkE07af1lGOHOjav6U1X05q3xOoPoBjw1iihIOCmtdol/eT9ZMYHQmh84kGTX+ff3WZo25pmBr9Wh9f8CKE9w/0wdBEwGFCiHBaaqxZuA0MaSqmZ9bVyHb7FlWhH9QoMD9U5H+2snAl1SUBbsn5OvXfgR/kg5CwYKE9Xt64It91rRn/DaTDetgAVkHou/cikRgqQGQFkOS/vZgvdO0vQeabcuhDZ5sX3N1OA46D2Yk3IDejzXygAziY4Ty3pFqhrPnIWG3PZXg1fA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7785
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF0000A79A.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3de46763-1720-4326-c83e-08deacf06fac
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|35042699022|82310400026|14060799003|36860700016|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	kANu7JYov481KLFgJqaEuihC+FFt1+Y7GDTNlrGOxFqR6pDl0/KFy7mxq3lj6FSP6WVWCclr9CTDnclEU+UQ66FnAnIKeYeVo0LtshgsHEVKjKW8QSoFubfi4k5Ci7HSFJuGxUwVEVyUGUoJs3JDc7ObZ4Jm8JU0BkvGl5umMKEDG8AKClczZXPyxCrSLOxUJpH0/EQ6Qy2aK+0Q7yMhQEn8d97FtEMbJjORJvIVLeLfmhkDHkGshj4Yl2AkhEbzeypWIxS/tK5IvH1KyUZ/Wz1VpxwOUJfNKufswKsvX5+lK3cI24P93WJPLrpQG89eRp9irhUIUB1Yz+sdM5WUfaf0TeMT/TWqfTxhu+Ehp4pJLY9bVyANK+dUC8EdDcpjnM4+fv+uFOyfe1JPjhoeIMV7lWbw74kV5Gcrivv3mFNkUKpCUadRMcDJ4Wu5nhKQ8cPJUDeAV6lxPXiPScby/znhGXxjzVjnFBdl4s/BxVAJhn/zRYhSeWxbgo59+muHkuro9Bm+Yg2XvQeA4QAHGJrS4fuK84ISYYggH/kuMHi6j9KPWbOZmCyKeASXP9m6Hotg1ZAvGsqzm1f+27/Zgzq64K1FX2VOcyE3DGXNUKPJlSvt/xsPLC2/GaboBVbfnEsy4lw2TrhoZHeYLHNh8OYbXQgrXSRUZ46jP2/YO8JGnVJMAj9ikKvMOPyV9tO0wjcxyD5Libnn7BW5k+c762+4enIiJsZ6EnwPpFv6kHU=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(35042699022)(82310400026)(14060799003)(36860700016)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	OUDTY8huCFk90Q+7niQYWHtwO4Hc+BoHWb6JIhjbcdYSVGg+BwLb5CLviDcX6Q2SgP7Z/F9XYWU10qZReAn7OYT2Xv7RJFA/LdNL7XMrnWWl4fxbYi2n9nA6WOnsev0WtvKgB4ITtK05DIf9KNHrfwbFDdH6WIpDXEna9DoF0Q68+DmsySmuKFTR52LReV91aPYlyljUmEyB3awTb31+lJ2eH89mr4sQM8bR+dUnvAqXRonUiobBCWIgyNyQ7ZbxedK5i2zInbEYKILAcBSCFYr6SPoELy0ZIyZS2KWUcx6TMjgHtf/LtN3dI5P1DDyjMQLqjGUKKK4xEsorD9w5lsaVirbLHrF10W5m3BbK69hU8O9axnAvp3xw3B70IVhJUCjtxayJoGuEjtDUxuer1JQItr/r7yYPJiBH98Ll2lJQkaygo4jJhtdtTssi4uF2
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2026 10:57:24.9359
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d2637cfb-077d-43cf-dab5-08deacf0967f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A79A.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9848
X-purgate-ID: tlsNG-d25034/1778237852-E397DCF5-0B17D3D3/0/0
X-purgate-type: clean
X-purgate-size: 3958
X-Rspamd-Queue-Id: C24914F560C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.59 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xakep.amatop@gmail.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[arm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:mid,arm.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Action: no action

SGkgTXlrb2xhLA0KDQo+IA0KPj4gDQo+Pj4gKyAgICAgICAgfQ0KPj4+ICsNCj4+PiArICAgICAg
ICBvZmYgPSBpICogc2l6ZW9mKGlycXMtPmljZmdyKTsNCj4+PiArICAgICAgICBmb3IgKCBqID0g
MDsgaiA8IEFSUkFZX1NJWkUoaXJxcy0+aWNmZ3IpOyBqKysgKQ0KPj4+ICsgICAgICAgICAgICB3
cml0ZWxfZ2ljZChpcnFzLT5pY2ZncltqXSwgR0lDRF9JQ0ZHUiArIG9mZiArIGogKiA0KTsNCj4+
PiArICAgIH0NCj4+PiArDQo+Pj4gKyAgICAvKiBNYWtlIHN1cmUgYWxsIHJlZ2lzdGVycyBhcmUg
cmVzdG9yZWQgYW5kIGVuYWJsZSBkaXN0cmlidXRvciAqLw0KPj4+ICsgICAgd3JpdGVsX2dpY2Qo
Z2ljX2N0eC5kaXN0LmN0bHIsIEdJQ0RfQ1RMUik7DQo+Pj4gKw0KPj4+ICsgICAgLyogUmVzdG9y
ZSBHSUMgQ1BVIGludGVyZmFjZSBjb25maWd1cmF0aW9uICovDQo+Pj4gKyAgICB3cml0ZWxfZ2lj
YyhnaWNfY3R4LmNwdS5wbXIsIEdJQ0NfUE1SKTsNCj4+PiArICAgIHdyaXRlbF9naWNjKGdpY19j
dHguY3B1LmJwciwgR0lDQ19CUFIpOw0KPj4+ICsNCj4+PiArICAgIC8qIEVuYWJsZSBHSUMgQ1BV
IGludGVyZmFjZSAqLw0KPj4+ICsgICAgd3JpdGVsX2dpY2MoZ2ljX2N0eC5jcHUuY3RsciwgR0lD
Q19DVExSKTsNCj4+PiArfQ0KPj4+ICsNCj4+IA0KPj4gSSBhbHNvIHNlZSB0aGF0IHdlIGRvbuKA
mXQgc2F2ZSBwZW5kaW5nIFNHSXMgc3RhdGUgKGJ5IEdJQ0RfQ1BFTkRTR0lSbi9HSUNEX1NQRU5E
U0dJUm4pIG9yIEFjdGl2ZSBQcmlvcml0aWVzIHJlZ2lzdGVycw0KPj4gc3RhdGUgKEdJQ0NfQVBS
bi9HSUNDX05TQVBSbiBbbGF0dGVyIGlmIHNlY3VyaXR5IGV4dGVuc2lvbiBhcmUgdGhlcmVdKSBh
cyB3cml0dGVuIGluIFsxXSDigJw0LjUgUHJlc2VydmluZyBhbmQgcmVzdG9yaW5nIEdJQyBzdGF0
ZeKAnSwNCj4+IHdhcyBpdCBpbnRlbnRpb25hbD8NCj4gDQo+IFllcywgdGhpcyB3YXMgaW50ZW50
aW9uYWwuDQo+IA0KPiBUaGUgR0lDdjIgc3VzcGVuZCBjYWxsYmFjayBpcyBjYWxsZWQgYXQgYSBx
dWllc2NlbnQgcG9pbnQgaW4gdGhlDQo+IFNZU1RFTV9TVVNQRU5EIHBhdGg6IGFsbCBkb21haW5z
IGFyZSBhbHJlYWR5IHNodXQgZG93biBmb3Igc3VzcGVuZCwgZ3Vlc3QNCj4gZXhlY3V0aW9uIGlz
IHF1aWVzY2VkLCB0aGUgc2NoZWR1bGVyIGlzIGRpc2FibGVkLCBub24tYm9vdCBDUFVzIGhhdmUg
YmVlbg0KPiBvZmZsaW5lZCwgYW5kIENQVTAgZW50ZXJzIGdpY19zdXNwZW5kKCkgd2l0aCBsb2Nh
bCBpbnRlcnJ1cHRzIGRpc2FibGVkLg0KPiANCj4gRm9yIFNHSXMsIEkgZG9uJ3QgY29uc2lkZXIg
R0lDRF9DUEVORFNHSVJuL0dJQ0RfU1BFTkRTR0lSbiBwYXJ0IG9mIHRoZSBzYXZlZA0KPiBob3N0
IEdJQyBjb250ZXh0LiBYZW4gdXNlcyBwaHlzaWNhbCBTR0lzIGFzIElQSXMsIGFuZCBJUEkgZGVs
aXZlcnkgaXMgYW4NCj4gaW50ZXJuYWwgc3luY2hyb25pemF0aW9uIG1lY2hhbmlzbSwgbm90IGFy
Y2hpdGVjdHVyYWwgc3RhdGUgdGhhdCBzaG91bGQgYmUNCj4gcmVwbGF5ZWQgYWZ0ZXIgU1lTVEVN
X1NVU1BFTkQuIEd1ZXN0IFNHSSBzdGF0ZSBpcyB2aXJ0dWFsIEdJQyBzdGF0ZSBhbmQgaXMgbm90
DQo+IHJlcHJlc2VudGVkIGJ5IHRoZXNlIHBoeXNpY2FsIEdJQ0QgU0dJIHBlbmRpbmcgcmVnaXN0
ZXJzLg0KDQphY2ssIEkgd291bGQgbWF5YmUgbWVudGlvbiBpbiB0aGUgY29tbWl0IG1lc3NhZ2Ug
dGhhdCB3ZSBleGNsdWRlIHRyYW5zaWVudCBJUEkvYWN0aXZlLXByaW9yaXR5DQpzdGF0ZSBhdCB0
aGUgc3VzcGVuZCBxdWllc2NlbnQgcG9pbnQuDQoNCj4gDQo+IEZvciBHSUNDX0FQUm4vR0lDQ19O
U0FQUm4sIHRob3NlIHJlZ2lzdGVycyBkZXNjcmliZSBhY3RpdmUgcHJpb3JpdHkgc3RhdGUgZm9y
DQo+IGludGVycnVwdHMgYWxyZWFkeSBhY2tub3dsZWRnZWQgYnkgdGhlIENQVSBpbnRlcmZhY2Uu
IFRoZSBmaW5hbCBzdXNwZW5kIHBhdGggaXMNCj4gbm90IGV4cGVjdGVkIHRvIHJ1biB3aXRoIGFu
IGFjdGl2ZSBwaHlzaWNhbCBpbnRlcnJ1cHQgY29udGV4dC4gSWYgdGhvc2UNCj4gcmVnaXN0ZXJz
IHdlcmUgbm9uLXplcm8gdGhlcmUsIHJlc3RvcmluZyBvbmx5IEFQUi9OU0FQUiB3b3VsZCBub3Qg
bWFrZSB0aGUNCj4gY29ycmVzcG9uZGluZyBpbnRlcnJ1cHQgaGFuZGxpbmcgY29udGV4dCB2YWxp
ZCBhZnRlciByZXN1bWUsIGFuZCBjb3VsZCBpbnN0ZWFkDQo+IGxlYXZlIHRoZSBDUFUgaW50ZXJm
YWNlIHdpdGggc3RhbGUgYWN0aXZlIHByaW9yaXR5IHN0YXRlLg0KDQpPayBJIHVuZGVyc3RhbmQg
bm93LCBidXQgaWYgd2UgYXJlIGV4cGVjdGluZyBoZXJlIEdJQ0RfSVNBQ1RJVkVSbiB6ZXJvZWQs
IHdoeSBhcmUNCndlIHNhdmluZy9yZXN0b3JpbmcgaXQ/IFNob3VsZG7igJl0IHdlIGluc3RlYWQg
aGF2ZSBhIHJ1bnRpbWUgY2hlY2sgdGhhdCBpdOKAmXMgemVybyBhbmQgaW4gY2FzZQ0KaXTigJlz
IG5vdCBiYWlsIG91dD8gQW5kIGluIHRoZSByZXN1bWUgcGF0aCB3ZSB3b3VsZCBvbmx5IHplcm8g
aXQuDQoNCkFtIEkgbWlzc2luZyBzb21ldGhpbmc/DQoNCj4gDQo+IFNvIEkgZGlkIG5vdCBhZGQg
c2F2ZS9yZXN0b3JlIGZvciBHSUNEX0NQRU5EU0dJUm4vR0lDRF9TUEVORFNHSVJuIG9yDQo+IEdJ
Q0NfQVBSbi9HSUNDX05TQVBSbiBpbiB0aGlzIHBhdGNoLiBJIGNhbiBhZGQgYSBzaG9ydCBjb21t
ZW50IGluIHY5IHRvIG1ha2UNCj4gdGhpcyBzY29wZSBleHBsaWNpdC4NCj4gDQo+IFBsZWFzZSBs
ZXQgbWUga25vdyBpZiB5b3UgdGhpbmsgdGhlcmUgaXMgYSBzdXNwZW5kL3Jlc3VtZSBwYXRoIHdo
ZXJlIHRoaXMNCj4gc3RhdGUgc3RpbGwgbmVlZHMgdG8gYmUgcHJlc2VydmVkLg0KPiANCj4gQmVz
dCByZWdhcmRzLA0KPiBNeWtvbGENCg0KQ2hlZXJzLA0KTHVjYQ0KDQo=

