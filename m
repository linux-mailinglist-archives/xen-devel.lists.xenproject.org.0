Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WCUzE2Oq+Wky+wIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 05 May 2026 10:29:23 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF2A44C8AB5
	for <lists+xen-devel@lfdr.de>; Tue, 05 May 2026 10:29:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1300320.1574844 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKB9O-0000TZ-Ps; Tue, 05 May 2026 08:29:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1300320.1574844; Tue, 05 May 2026 08:29:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKB9O-0000R3-Mb; Tue, 05 May 2026 08:29:06 +0000
Received: by outflank-mailman (input) for mailman id 1300320;
 Tue, 05 May 2026 08:29:04 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Luca.Fancellu@arm.com>) id 1wKB9M-0000Qx-MV
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 08:29:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKB9L-008l7R-KD
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 10:29:03 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69f9aa44-bab6-0a2a0a5309dd-0a2a4502e736-16
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 10:29:02 +0200
Received: from [52.101.69.21]
 (helo=AM0PR83CU005.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69f9aa4e-af86-0a2a45020019-34654515bb56-3
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 10:29:02 +0200
Received: from AS9PR0301CA0004.eurprd03.prod.outlook.com
 (2603:10a6:20b:468::7) by GV2PR08MB8678.eurprd08.prod.outlook.com
 (2603:10a6:150:b6::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 08:28:58 +0000
Received: from AMS0EPF000001A8.eurprd05.prod.outlook.com
 (2603:10a6:20b:468:cafe::75) by AS9PR0301CA0004.outlook.office365.com
 (2603:10a6:20b:468::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.27 via Frontend Transport; Tue,
 5 May 2026 08:28:58 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001A8.mail.protection.outlook.com (10.167.16.148) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.9
 via Frontend Transport; Tue, 5 May 2026 08:28:57 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by DU0PR08MB9323.eurprd08.prod.outlook.com (2603:10a6:10:41e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 08:27:52 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 08:27:51 +0000
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
 b=HP7CsRbg0ElU8DUxJv8A2RM886cZuCigGXzppC023C7VusyxUlnE9AGNPAm71PvjYaB1nQh6Yi6muhxKa3Oy2e771vYsB9HJzI9QP85LV812MRTtf98DyJ9p6ebDjNOk9vXfB+8WLhdSwtolEwAXaKxLHWbc5JBBA1OPROBGhSjf9Bzmk12xObfDphVl0LfgU5tYcmUbc04i+n0SDaHkQ5PEGcZAKFuhJZrPdKbHHpmmCcNUliLhbLIjAfnIlMmneLtzANaFIeVGq7STeUiaS0f8LGca4/AN/HeILbZf1Qgo3YHx6MHOzbBW8Hm20mlTP7SzYJnVXTpwZxYXPVdlpg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uph7Gb0cdNhliHJ085f/SvQ437L6B+bXLdooKxlZok8=;
 b=RZQ2BeKYzVKxZPhCn6iwVNYpZTpQLik6p4V7Lw3OMnqOFzeneYEIX7ez2fNa/nfsD2r1moiNvYsioVlSvNKQZrExS6RKRH3M0EYIWJQXYke/HblubC4UBJEh0ZH5cYSHGalOFhB9CXvBKDoiuqY2bGh3FPW77qI13quRsd0iKDFXSs/AfXkBGme6iNOo3pTF+peZb5LXDILQOpaUmUnaWuHjdKHQRp5Cif5CSyND+vL5Ph+/OOi5BDAICYc++9qKxFMvlNrFeQ3l/mCjNyod1TtbWqIl9y3uI2vyyUKOT+fYGyAPsbqZ3oE+N0rA1lfheg3dMoGuftVj/ppvks1kUA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=suse.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uph7Gb0cdNhliHJ085f/SvQ437L6B+bXLdooKxlZok8=;
 b=FV8uwLI6AcXqwn+mQIERrAhh6W99PIH75Ar5TqyaMAN/67erUS+M+pZlSu4aLmiJhZ5U+0W66f/rwzgTvQ7v11EMsppdI2pyN1N/XDfvwJTS9Xbf0OfPVOTJr9Duu/Tss3xuNDy1hco9tZJEkilBDeNg9YBRLSDEVa/S3er8NL4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZFX2h76rSP9XivF5IOy/vmgoAC0CpcHpQ2Dfb+egUo7a73rlPPKGfTXNUGXzYRn3X59Jhq2u9GQPF/4N2ryeRfsiD62TuUh/H9Q/2+TlRG/MibVuBPjBgQ+B5891cD1Ez5ScTiofG/pl7mE++wYKAcTw7CXpkxk32wm1foRAWul2v6tS//grybteHqPLx9i2zqEfqtsVRbMRb7ByaPqabchuYwliJAny5qO8qZybDE5l7kB+3Hsd7azqiG5ntwwUZ0Xst8pMuj6qfZvGsWuOXPGsc9eZbHetxnxnobz0WSE5/WI2CPjLWg7s6chy1k2XOqBFm0Ymb11gGUtMH1kwwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uph7Gb0cdNhliHJ085f/SvQ437L6B+bXLdooKxlZok8=;
 b=ACuc6b6bNJZAyOANvWY4wRkRqUkHIEIwEOgJgQXGOsjd9ERpweoTC4RK54YuJsw0KwzSQFpuvbVi2G7F6/xmx+RLGj2pZREqUnZJJUL6BDOITN6WUkRJnNkENBfHiMtpNDD5Tlmmhko9iPAYyx/d5sUeouh5AXJLb78VAcgzfGnXGoXS1ba+O5ESQi6O4IhKSyw5psKPbUKewAX3zgq9OCzyoOWKltoYnWyiAFX+bEG809CkcHc4KPRydxlZETsKNh68fHgwCLYNmBticcmHsVaoFBSVwePCOJudTfRZF7UrDJXjQze8jBzN7vq5+ecYEG87ZdGYC17Kq93g+bkXxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uph7Gb0cdNhliHJ085f/SvQ437L6B+bXLdooKxlZok8=;
 b=FV8uwLI6AcXqwn+mQIERrAhh6W99PIH75Ar5TqyaMAN/67erUS+M+pZlSu4aLmiJhZ5U+0W66f/rwzgTvQ7v11EMsppdI2pyN1N/XDfvwJTS9Xbf0OfPVOTJr9Duu/Tss3xuNDy1hco9tZJEkilBDeNg9YBRLSDEVa/S3er8NL4=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Romain
 Caritey <Romain.Caritey@microchip.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>
Subject: Re: [PATCH v4 01/11] xen: arm: fix len type for guest copy functions
Thread-Topic: [PATCH v4 01/11] xen: arm: fix len type for guest copy functions
Thread-Index: AQHc1xwXYYBcuLui0UypBKVcqnkF/bX10fCAgAeOAYCAAcPSgA==
Date: Tue, 5 May 2026 08:27:51 +0000
Message-ID: <F9DB9C27-810C-41DB-95DD-D00772CE4385@arm.com>
References: <cover.1777303844.git.oleksii.kurochko@gmail.com>
 <e29e6176063f8e7c612a4bfa44ac072d7a686b81.1777303844.git.oleksii.kurochko@gmail.com>
 <53BD54C0-E493-4D04-9CB1-D16B148CA3A9@arm.com>
 <edfb6bc3-ad1a-4185-9966-29bb126a6b3f@suse.com>
In-Reply-To: <edfb6bc3-ad1a-4185-9966-29bb126a6b3f@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|DU0PR08MB9323:EE_|AMS0EPF000001A8:EE_|GV2PR08MB8678:EE_
X-MS-Office365-Filtering-Correlation-Id: f752a4c9-c74f-4b80-df5e-08deaa805a42
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|22082099003|18002099003|56012099003|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 tT6W6Y9+XJFC0/9KNpT8EiPlyYSTQ7OCgN9w1Nz0RiDq7Bn5Bmjs8H/i9zbHsoLlkWV9aiuNlMYiN8B3OIBoW3W6neq5/5lkeuoHwtJr9synxg0cxM5AUtI9KBuHLb/0p87lKnrLnMyx7WA0L80cgYky8cL/N7oqKW9Tn2VgPQCejm9oOBrnxaK+1fqx/a1PTsZTNHNEhaYUTtH4QqQ1eSgFiIw5DXyzfIPjdc1pIe6ntujzDC0WubYy8Kmh4g5KglAcZ4wMaVMATuFAT33KmQOr3oQoa5FAdvJlGAQTg2RBXSDlM7iiGGm9jfui6x5Ty0jB5CM3DTYIsV623q8IVwt+z27CLa2ggIKVeqLluW/zGGuRp6iFFsweN1smKnMPrSTfDXjr9BM8/q/PMQz3pMYWolpOBihoufrYwZgMGxKPjwA342UHmfKVPX/L2yNe37TgbFfWmHobSTMc8nMwaPCOpZfBuCqZ0tnTPuCVKYsBsLPoKkLiT836xw6h+OfoX5JnzTVR9mXQ5tMPy4o5KwGrpmYw5bFmDdtlK8k1x0AHrzm+90lbkKPxOfcfJ5dVFzMMGdL8i6xo4dId3ewxgY/v+5kc0mYXaxsscfAYsucV2Y0ZTd/MNVrixIGgc8wCS0qlZOtGMdSCsnWojFERGvVhGqz6a+huBkt97V/LCNL9Kc4mqstEvNNOt04jgPUtsM+RGa1e/kLqNqBNs2TEnP0LhyGUVE9q9azVwp/yZ7BfAO6eWbEzUQ/vGKIp6KB1
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(22082099003)(18002099003)(56012099003)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <17642A2E6BDB7642A70C7FE0AE383100@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 VAUl//w3spxgS22/0oLOxqdDGYCOcsxT01ziySXsi5K6M5r2ezfCJ13hkqoxSkaIMT0jzl4yzcLQymHlzClG5jkmk+KsVD9dnGreiWRiyFaqAh13UdtOrgFCR2CDPtlAbwr6svYK78h0ZkLYP0jD3ADEIOgpqoAJ8/5+GHuWUrqIIh0xN2gmiLceqsF0Xx48xX5XaOLI6Tl0m8Zm6FL3Ac6XoR7hMMRHWl3DIiSqsadSRk2w8S+Ee48LZjFgeSq9/DSADdw41/YkbtqJQkeOnDHYDweyrUekwpyy61Z1vMj8i5HcX57+eCCaeBPMn9DUI42/NKbBJF6Vn2nNmC8X0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9323
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001A8.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9a3e6b0d-1a62-4af5-e1c1-08deaa8032da
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|14060799003|35042699022|82310400026|36860700016|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	pJOAhQ5K/FK6/FVkox4SiYMjctPdLBApsqMCIzZEK86/5qNqOUyzT4iGxzTOWakkhzhD4LFQ6bq/PZ9yU2Qim7RymZFjNVeStsMt67x5BeTgIaapjMG0CbfUSDxTtMX1yz+i3jNb+Moy/Rew6v7MgFKoogs6+abvIZNvP92G8S2GvopIGcdZF+Il7GGwsv3jvkueNLfaeazKmh68q0iWvTzjOnkTaQRAzGG3Okhup2fPWOGO243mArdDw3dZX3u/jci1inQbluv/RnQR216+Z/WuRAG4aDl1byi6HzkrTevze8zf1AimvEUKQDRROruZ37wj5VHqE1bSRDb3e+L0gc6ovJ3QGQ1HBJ1V7xohjzowKsQaBGY+9/en+VweUu9qJp69HKTCtv0pRkG95H6kNgpNd4FCPWrSBY6NSKKZFFKoPiQXoMGCWGAvebHasTtco3RfafLta1a3/GXmZgNgeyY6kFAy5tKaexLz6iZSjBA9lUoBWnHkzb5YA24M3BDEUcJOO/t/JQDiZy63SrI+QnDjEw2P+lUSCSEhvUm8P0gN29muixR9L9u1LvsymtJT3RhKCzJg0vH9jTlXgL7ZtD4QKLK6ojmpGhB+PCzbwB4UFlEoioRNdYhh5l7pOq+mAdY0l98wtppMR0fLE4iO+OKZp35qpJevMgpbK6DhKPs/uk//GIMZYt/uMtgJeL/Fr+Gqor+c/715J+51ls6rE+50YrkeYUremmD71twlzGA=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(14060799003)(35042699022)(82310400026)(36860700016)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Mqnay1g4BqLf0Y2lFBKQTPwMY38BGhsdQLW7nhD87mr/HPVm0hMyOiA0YQ+qqeDqDN1QZvkECowxZDGzLE6zJxwjpoi/LcM1dbQdNtDEqFEs09lf2hiFNCZfLwEXDBbgrWnxn3QUNxvem8rBFXOgdsncpnlvQ0idPtQoAuPK4dyZT+/a+AH1uHfKrRD5KRs3REtCCMEBrqGLedchtgctoqCcV7ADRMiSzaZQjqxJdDl/pTC+hX2tQbj/y0F7N/4G+JezvlLW+wLC3+G/f6GWpzetV6qcl1aT/Ub75HAcfsHgNqkDHfTP3AV3e4Ndqn9X/zOSv7bIyadwPtFkvew5QiTCrL0M4kWGAVG2aKen3IQNxpgG25r10KvH5KJRQJgI6/YCIH2cIrlj9eQluJQLJwbTwYZAWZpjjFD+NZdErWfO6UeQHEHCbMI0JYBxF5yO
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 08:28:57.9145
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f752a4c9-c74f-4b80-df5e-08deaa805a42
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001A8.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8678
X-purgate-ID: tlsNG-720697/1777969742-82374161-31ADEA75/0/0
X-purgate-type: clean
X-purgate-size: 1454
X-Rspamd-Queue-Id: AF2A44C8AB5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.59 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[lists.xenproject.org,microchip.com,kernel.org,xen.org,arm.com,amd.com,epam.com,citrix.com,vates.tech,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	FROM_NEQ_ENVFROM(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-0.988];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,arm.com:dkim,arm.com:mid]

SGkgSmFuLA0KDQo+IE9uIDQgTWF5IDIwMjYsIGF0IDA2OjMwLCBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+IHdyb3RlOg0KPiANCj4gT24gMjkuMDQuMjAyNiAxMjowOCwgTHVjYSBGYW5j
ZWxsdSB3cm90ZToNCj4+PiBAQCAtMTM2LDcgKzEzNiw3IEBAIHVuc2lnbmVkIGxvbmcgcmF3X2Nv
cHlfZnJvbV9ndWVzdCh2b2lkICp0bywgY29uc3Qgdm9pZCBfX3VzZXIgKmZyb20sDQo+Pj4gdW5z
aWduZWQgbG9uZyBjb3B5X3RvX2d1ZXN0X3BoeXNfZmx1c2hfZGNhY2hlKHN0cnVjdCBkb21haW4g
KmQsDQo+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFk
ZHJfdCBncGEsDQo+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgdm9pZCAqYnVmLA0KPj4+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgdW5zaWduZWQgaW50IGxlbikNCj4+PiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgbGVuKQ0KPj4+IHsNCj4+IA0KPj4g
Tm93IHRoYXQgd2UgZG8gdGhpcywgcG90ZW50aWFsbHkgd2UgY291bGQgaGF2ZSB0cnVuY2F0aW9u
IGluIHRoZSBwbGFjZXMgd2hlcmUgd2Ugc3RvcmUgaXRzIHJldHVybiB2YWx1ZQ0KPj4gaW5zaWRl
IGFuIGludDoNCj4gDQo+IFRob3NlIHdvdWxkIHN1ZmZlciBmcm9tIHRydW5jYXRpb24gYmVmb3Jl
IGFuZCBhZnRlciB0aGlzIGNoYW5nZSwgd291bGRuJ3QgdGhleT8NCj4gSnVzdCB0aGF0IHdoZXJl
IHRoZSB0cnVuY2F0aW9uIG9jY3VycyBkb2VzIG1vdmUuIEkuZS4gaWYgbmVjZXNzYXJ5IHRoZXkg
d291bGQNCj4gd2FudCBkZWFsaW5nIHdpdGggc2VwYXJhdGVseS4NCg0KeWVzIHRoYXTigJlzIHRy
dWUsIHRydW5jYXRpb24gd2FzIGFscmVhZHkgdGhlcmUgaW4gZGlmZmVyZW50IHBsYWNlcywgZG8g
eW91IHdhbnQgdG8gZGVhbCB3aXRoIGl0IHNlcGFyYXRlbHkgc28gdGhhdA0Kd2UgaGF2ZSBhIEZp
eGVzIHRhZyBmb3IgaXQ/DQoNCkNoZWVycywNCkx1Y2ENCg0K

