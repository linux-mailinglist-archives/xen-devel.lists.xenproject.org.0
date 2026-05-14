Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QJ/FKKb7BWrFdwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 14 May 2026 18:43:18 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0DD6544DF4
	for <lists+xen-devel@lfdr.de>; Thu, 14 May 2026 18:43:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1309088.1580253 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNZ99-0007a3-Fm; Thu, 14 May 2026 16:42:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1309088.1580253; Thu, 14 May 2026 16:42:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNZ99-0007XM-CT; Thu, 14 May 2026 16:42:51 +0000
Received: by outflank-mailman (input) for mailman id 1309088;
 Thu, 14 May 2026 16:42:50 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Luca.Fancellu@arm.com>) id 1wNZ98-0007XG-HK
 for xen-devel@lists.xenproject.org; Thu, 14 May 2026 16:42:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNZ97-00DZIO-Qg
 for xen-devel@lists.xenproject.org; Thu, 14 May 2026 18:42:49 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 6a05fb7c-bab6-0a2a0a5309dd-0a2a450bb1ee-10
 for <xen-devel@lists.xenproject.org>; Thu, 14 May 2026 18:42:49 +0200
Received: from [52.101.83.45]
 (helo=GVXPR05CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 6a05fb88-212f-0a2a450b0019-3465532d833d-3
 for <xen-devel@lists.xenproject.org>; Thu, 14 May 2026 18:42:49 +0200
Received: from DU2P250CA0013.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:231::18)
 by AS2PR08MB8829.eurprd08.prod.outlook.com (2603:10a6:20b:5f2::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Thu, 14 May
 2026 16:42:45 +0000
Received: from DB5PEPF00014B92.eurprd02.prod.outlook.com
 (2603:10a6:10:231:cafe::56) by DU2P250CA0013.outlook.office365.com
 (2603:10a6:10:231::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.18 via Frontend Transport; Thu, 14
 May 2026 16:42:45 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B92.mail.protection.outlook.com (10.167.8.230) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.13
 via Frontend Transport; Thu, 14 May 2026 16:42:44 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by GV1PR08MB10569.eurprd08.prod.outlook.com (2603:10a6:150:16e::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Thu, 14 May
 2026 16:41:41 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.20.9913.009; Thu, 14 May 2026
 16:41:41 +0000
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
 b=Sl87ylpzEcS4sMoVjQGrwcKSFlbe5lTwmbzP7YeQQ6sDesGqiddcRi52rYHvUSzHoF5dKrqAZSeYA8L7VspcjWTOeHbp6z+Y9pV99KjUQ2NVrOi00lQyIVVjX28gR4mZtMi6er5BqnXElNXwsA8cHthuwCTsMNgUANBsceF1INZNg8IEwi3ulVBxomKfCappTXuuBCYlW+HqCcmuSNLpcfsQgTgbN6xy5KoZOAfr7Cwbi+wAblj6XsNKVrhwhaAXBoQyHmPS5IWtnYdrrW33wj9IYUpaux8/K8pDB3y3y+M+D61afCvfF4IGX6TBrZGOGcMkF+xsLyUIT/uTLeKqdA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mADvXDcdpVEOIdGT8nopkjibaLkuis7WqzV8jV4RAB8=;
 b=FVgJpRczaBcWSiSiWvMJVuBFLygp1dLem1YH6NjxKMeetIa28KKNuTLjaaAAWNuKb1Vpd6Qnk4wXpgXqbtzxVNdXVYOpIonDQmAJhsB0421/jXAn29/sXIF8pSqugBdYAIjIqvQWxFpMisx81i/Q1oj/s5XyA1kSaikFx4m9KVFgw1IAOO2zEWFOwWxscykkEJsLKulb+kM/2NlLyTg41wmZA99kpY80wG56yBwg8C3WkFBlZxSUkjNs8H4U2HMUlYD5/bhCCy2XCBprxwMg0YBjADBeiB+dWU7gxBvIa190WcNbX+74z0itoLpzz30ewES7vZ7VkLhz2IUtCZZyEg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mADvXDcdpVEOIdGT8nopkjibaLkuis7WqzV8jV4RAB8=;
 b=GCxD2/xPGU3HICBzHH4B3K4Z6OmtWabdGePV5mjuIFPcwlh/TF+RTmN/TmxDOtzJG2ZyBVlrK2xyHyXs1mVuLg/7XN09KsC15uKrZ3eAmvxTvvMi/Z5Su5n4hm6HAN7p330gqxjQcNBSDzDSK0ymTwluP//hCU3yxvacWkC4MhY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lin+YFZJJXWn41uKo2v9mHuqSBmbLyVcA0bjbbP7WXGCcWxqMBIXUxRPf8NgWNmoD0gftzm1+KsX1cX5g7LmrJNYv9Oe4AKyY5IU0IWdp+SALEbHxy2uWH8n4RYRS+y/VmElt+3iCbDBUAiMyQNoX8NCSwmTULwtKytILNKo2TIWq09CZ6hf0DI9oEqlm7W1dc7T4r18OMiSJLtLwH0AFF0d09SFeg/TmpXtXAFoBwf6NVRXxkTIrSHl0NCX0NzRgE0ckko8ACJVdLykQ0TzzaGpZP8Bbwzvtud2cCf6ODaukxnbHOB7SF/aHEgnCzADTf/udDpOScAhrPnoTJFePw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mADvXDcdpVEOIdGT8nopkjibaLkuis7WqzV8jV4RAB8=;
 b=Uys74nfkqK2rRDgP80KT4kbfjm68um/kkFYaWIuwhFLLy773jOGqtZ57XlIjs/5ruoY1pPwFF6pJPwgWu5m8iKuKtYQImSLr4J9GWp3vFlUCnMeOKAsswd86BR2GbqZ+rqQ0rQul0F1nFklixPyfyD4lUH7E3YPZ37FUp6pcml3F/5ZMv8x7UrA63PZINJHFuBQn0csoN34dkOtozlAXhp/AMcZkfTZLgd7mNz6kTxMAnQODOHYMkrrgUx2EbixvKr1/VZK4K4BWqiarj8tbyAbBDZgx19VLcAuReOs74VdwUY5FHlCtcEEkqxh+8ifY8DVGqnbGEhjuoYlfkfptmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mADvXDcdpVEOIdGT8nopkjibaLkuis7WqzV8jV4RAB8=;
 b=GCxD2/xPGU3HICBzHH4B3K4Z6OmtWabdGePV5mjuIFPcwlh/TF+RTmN/TmxDOtzJG2ZyBVlrK2xyHyXs1mVuLg/7XN09KsC15uKrZ3eAmvxTvvMi/Z5Su5n4hm6HAN7p330gqxjQcNBSDzDSK0ymTwluP//hCU3yxvacWkC4MhY=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Mykola Kvach <xakep.amatop@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Mykola
 Kvach <mykola_kvach@epam.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Rahul Singh <Rahul.Singh@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Pranjal Shrivastava <praan@google.com>
Subject: Re: [PATCH v9 09/13] xen/arm: smmu-v3: add suspend/resume handlers
Thread-Topic: [PATCH v9 09/13] xen/arm: smmu-v3: add suspend/resume handlers
Thread-Index: AQHc4jI185A+Eexrf0ingdP9c/cyN7YNvIyA
Date: Thu, 14 May 2026 16:41:41 +0000
Message-ID: <EF57B350-AB80-4157-AB49-6A449604BC06@arm.com>
References: <cover.1778605274.git.mykola_kvach@epam.com>
 <fae03d32bb817d56a20b0437e433bd124f89ac88.1778605274.git.mykola_kvach@epam.com>
In-Reply-To:
 <fae03d32bb817d56a20b0437e433bd124f89ac88.1778605274.git.mykola_kvach@epam.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|GV1PR08MB10569:EE_|DB5PEPF00014B92:EE_|AS2PR08MB8829:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ad8138c-449d-4bf1-df8f-08deb1d7d30c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|376014|366016|4143699003|38070700021|18002099003|56012099003|22082099003|11063799003;
X-Microsoft-Antispam-Message-Info-Original:
 1r+qfPV71SlJwhpKmIzo6FdvAyB5lTT3m6VeyDG+2/dkDm2w9eYvUxkqovdJuhzwaxxJxIL4jknT6MXpeeaAuiw1xJIx5TtCfK2NaXYmb9ctFq6kWtidYmu3Zt1/9DjIV4pK8NprlfGuTQ+TYpNyKUzR9DmDZLIYpX4IiTjU7AJJ/4sbUfyS3VD/anfTFyZLc0Jg5ly4q8HzE+OgABmqDI2uEoTV3xYjATMwpceR69E2caSjM8O4i6jqemLMEuYJ13A6msOrjUZ0aY+jNfwAbTqiJpy1UosVTzv8j2X9g8EEliMwJSTJooBLttpN9ywlpkYiXWtWGsHOOwrNXilFK3IerkzP2zcWVhpdK1TOJrIyARvMwzRHG41drBxCxKRvom1CGtrP2PYwF38ikH/QXkz2Y0zCj2paYAi8NtmYzMw2ClovxDl4a1SCCXDJAamQ9IxDz8yMNQPkRjf8hy2noIUZe4yPqQ7e1F7x9FwSZe67rSBTRmVRFpBn9cZzgrcQIheKxm1+rS1HclxCysEVGGzzX1M0Me182bQ2f0XdjS87Zz/mmseE9dtYm/+iFQBIZ2xdKuzy7OdAHmrbBqOLGiJravlPd0Ci7hw8ssbQ6fH7x50j0lvcw2N0cO5axRT6o9wMHkWPA6/etPxECG3f5Qo9o8zO79/ToEby/RbO1ueYF4QIcqjnBZ2NvlSePrNL9Eyu+kMG5TOZFcIiDCA212AWMryq5QD/qriAG/Zn7Bn1YtHdMu6F5b0CXhJexMUe
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(4143699003)(38070700021)(18002099003)(56012099003)(22082099003)(11063799003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <86CBBB898C72C24F9E4DD1A5803F35BD@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 jrOaZN6wC/BfrwC4tT02hs4WOeizapTRqSjZuMqyDUhlJ6p7N7WhpB9iIJZcxnYeSK5quFo7RiXuk1Lw+Cv74+of5crUKGVGEVg+fOTv3192ynv4dtJpzCFtJeraIHbD/WBiKhRYstXoSmT8H9iMBYHcFelGaEf1giFyuRjKNxyTA8kKm5tgHqlUbEXyqWirYs9KXnAh4yNx7iPEFj0KgNpqqXZumrVKIApkspo+EI70tObVPCSfnqTSeo8/ROti0hFODId/i9sFjS7OlaQO3WjvPRw5sBPETzqCa8LCaZJ9VBr/MFbJ6uZqVjhqvCaUGyvgEeFAiBcSfJLmcxGocA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB10569
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B92.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5d2edc7d-8074-473b-1721-08deb1d7ad40
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|35042699022|14060799003|36860700016|11063799003|4143699003|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	swFuXTm1r905loNf8f/HJw1IqSm7BOZ6SarrJ7hD8MtF1D/IkV4QndIwXt5QdyKJtTFS0SVRLWjMr9P+KTL/R3JxAI7irT/vfX0CWJypZn5FvLtp93sDMcDuXCtJAqM+DQewH3N4atT8sSzxtRmvadOxn95ZsB5GkzRVE8arYgKTP3eYVoWN71xkPKpbevM+FLUWawt59zeWWlflptVMvL93kUdjb2JO0NeTz3itYUnzeE6zAKmIcjJsWm5HEXcgDqhEh8A0NqosGzI070N7mRCmsD5vf6KIF+tVggXjO6FLgxOFxnebcHmxOx3w3EqrqavwrjvtFbNWdXdrkh5elqk5PsX8tGxHYWx7HDY8N/oDOGNk6aeseAmsWU2X/uSaRG8WYRJgxGjStuLw0hvTUGUbx00GfGNScx6ZsjIyOb6uk/bYE/9CDXUKJVCNjIXMwB7s/0LrsPOdt8vE7M6ahszFQdxcubrPx9HFvQcrN4OtFBAK0fFsA/wv5sCi4SZTgp3R7LsqmrEczlk7BsS9nT3CN5VktkmRD75YM//tthW+9dizHkxJLKLTC+0YP3xzym/0TmS8fwAhUwgXrL/KpTVGWrOU9aZkMuUnLO18AWSUsXpLgXf8csd4BmHqO3VPVE707eckN648dpqr34hhyvSCHe3UXkPGfP0sfRZG4zTmR9aRhlYbER1H9rXmCmfgbIv72rKK83J2JQAhn2zXRs/f2akX4BPIlCgJs2UIyPw=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(35042699022)(14060799003)(36860700016)(11063799003)(4143699003)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	rNupZ0OE1uiyu3R+4mdGLl5fqac36ES0fSmLOjCZZnw247n5giISI3tLelwcCk9AwnPPozqsd9uJoXqq4a91Y1lQcqAr26iopMbVq4D8j4yRTTJqkA+JseQlpv5nSoKoqe0Onh2ZpDRklMeQHWsbgbEfnIBzyiPLqpc7txlKgnJy2nKVSYvwBbj9MWN5lHygMZI1JCHRgsiyjbhCcHXHuutSWYIeNqPFSRej1Rpfpmm9JsKDYwu3u8NQEOLnsletyxq70LzsQ1WS8xXfWC0aIMbgJKQkBybL0K5sxWf7wYkOK7ny6AGxcMLmKI7Pzu2r2Xf5hu2Phix2GdTXa3hA+Qq3AjJjuKpg0DSQGIpd4PdycYppmKFhEIu3R43WrQSZAI6+YmTl77rg5PdylBFij0UX9HUu5B8eqYsUHXc9PpELqSkDKeuUZnIbT+oCYKVl
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 16:42:44.8951
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ad8138c-449d-4bf1-df8f-08deb1d7d30c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B92.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8829
X-purgate-ID: tlsNG-42698a/1778776969-1377AF3B-7FE4ACE3/0/0
X-purgate-type: clean
X-purgate-size: 5377
X-Rspamd-Queue-Id: E0DD6544DF4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xakep.amatop@gmail.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:Bertrand.Marquis@arm.com,m:Rahul.Singh@arm.com,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:praan@google.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[arm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:mid,arm.com:dkim]
X-Rspamd-Action: no action

Hi Mykola,

>=20
> +static int arm_smmu_enable_irqs(struct arm_smmu_device *smmu)
> +{
> + int ret;
> + u32 irqen_flags =3D IRQ_CTRL_EVTQ_IRQEN | IRQ_CTRL_GERROR_IRQEN;
> +
> + if ( smmu->features & ARM_SMMU_FEAT_PRI )
> + irqen_flags |=3D IRQ_CTRL_PRIQ_IRQEN;
> +
> + /* Enable interrupt generation on the SMMU */
> + ret =3D arm_smmu_write_reg_sync(smmu, irqen_flags,
> +      ARM_SMMU_IRQ_CTRL, ARM_SMMU_IRQ_CTRLACK);
> + if ( ret )
> + {
> + dev_warn(smmu->dev, "failed to enable irqs\n");
> + return ret;
> + }
> +
> + return 0;
> +}
> +
> +/*
> + * Probe-time only: request host IRQs and, when available, program the S=
MMU's
> + * MSI doorbells. Resume does not restore the SMMU *_IRQ_CFGn MSI regist=
ers,
> + * so any host suspend support must treat the active MSI IRQ path as
> + * unsupported until that restore path exists.
> + */
> static int __init arm_smmu_setup_irqs(struct arm_smmu_device *smmu)
> {
> int ret, irq;
> - u32 irqen_flags =3D IRQ_CTRL_EVTQ_IRQEN | IRQ_CTRL_GERROR_IRQEN;
>=20
> /* Disable IRQs first */
> ret =3D arm_smmu_write_reg_sync(smmu, 0, ARM_SMMU_IRQ_CTRL,
> @@ -2028,22 +2052,7 @@ static int __init arm_smmu_setup_irqs(struct arm_s=
mmu_device *smmu)
> }
> }
>=20
> - if (smmu->features & ARM_SMMU_FEAT_PRI)
> - irqen_flags |=3D IRQ_CTRL_PRIQ_IRQEN;
> -
> - /* Enable interrupt generation on the SMMU */
> - ret =3D arm_smmu_write_reg_sync(smmu, irqen_flags,
> -      ARM_SMMU_IRQ_CTRL, ARM_SMMU_IRQ_CTRLACK);
> - if (ret) {
> - dev_warn(smmu->dev, "failed to enable irqs\n");
> - goto err_free_irqs;
> - }
> -
> return 0;
> -
> -err_free_irqs:
> - arm_smmu_free_irqs(smmu);
> - return ret;
> }
>=20
> static int arm_smmu_device_disable(struct arm_smmu_device *smmu)
> @@ -2057,7 +2066,7 @@ static int arm_smmu_device_disable(struct arm_smmu_=
device *smmu)
> return ret;
> }
>=20
> -static int __init arm_smmu_device_reset(struct arm_smmu_device *smmu)
> +static int arm_smmu_device_reset(struct arm_smmu_device *smmu)
> {
> int ret;
> u32 reg, enables;
> @@ -2163,17 +2172,9 @@ static int __init arm_smmu_device_reset(struct arm=
_smmu_device *smmu)
> }
> }
>=20
> - ret =3D arm_smmu_setup_irqs(smmu);
> - if (ret) {
> - dev_err(smmu->dev, "failed to setup irqs\n");
> + ret =3D arm_smmu_enable_irqs(smmu);
> + if ( ret )
> return ret;
> - }
> -
> - /* Initialize tasklets for threaded IRQs*/
> - tasklet_init(&smmu->evtq_irq_tasklet, arm_smmu_evtq_tasklet, smmu);
> - tasklet_init(&smmu->priq_irq_tasklet, arm_smmu_priq_tasklet, smmu);
> - tasklet_init(&smmu->combined_irq_tasklet, arm_smmu_combined_irq_tasklet=
,
> - smmu);
>=20
> /* Enable the SMMU interface, or ensure bypass */
> if (disable_bypass) {
> @@ -2181,20 +2182,16 @@ static int __init arm_smmu_device_reset(struct ar=
m_smmu_device *smmu)
> } else {
> ret =3D arm_smmu_update_gbpa(smmu, 0, GBPA_ABORT);
> if (ret)
> - goto err_free_irqs;
> + return ret;
> }
> ret =3D arm_smmu_write_reg_sync(smmu, enables, ARM_SMMU_CR0,
>      ARM_SMMU_CR0ACK);
> if (ret) {
> dev_err(smmu->dev, "failed to enable SMMU interface\n");
> - goto err_free_irqs;
> + return ret;
> }
>=20
> return 0;
> -
> -err_free_irqs:
> - arm_smmu_free_irqs(smmu);
> - return ret;
> }
>=20
> static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
> @@ -2558,10 +2555,23 @@ static int __init arm_smmu_device_probe(struct pl=
atform_device *pdev)
> if (ret)
> goto out_free;
>=20
> + ret =3D arm_smmu_setup_irqs(smmu);
> + if ( ret )
> + {
> + dev_err(smmu->dev, "failed to setup irqs\n");
> + goto out_free;
> + }
> +
> + /* Initialize tasklets for threaded IRQs*/
> + tasklet_init(&smmu->evtq_irq_tasklet, arm_smmu_evtq_tasklet, smmu);
> + tasklet_init(&smmu->priq_irq_tasklet, arm_smmu_priq_tasklet, smmu);
> + tasklet_init(&smmu->combined_irq_tasklet, arm_smmu_combined_irq_tasklet=
,
> + smmu);
> +
> /* Reset the device */
> ret =3D arm_smmu_device_reset(smmu);
> if (ret)
> - goto out_free;
> + goto out_free_irqs;
>=20
> /*
> * Keep a list of all probed devices. This will be used to query
> @@ -2575,6 +2585,8 @@ static int __init arm_smmu_device_probe(struct plat=
form_device *pdev)
>=20
> return 0;
>=20
> +out_free_irqs:
> + arm_smmu_free_irqs(smmu);
>=20
> out_free:
> arm_smmu_free_structures(smmu);
> @@ -2855,6 +2867,96 @@ static void arm_smmu_iommu_xen_domain_teardown(str=
uct domain *d)
> xfree(xen_domain);
> }
>=20
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +
> +static void arm_smmu_reset_for_suspend_rollback(struct arm_smmu_device *=
smmu)
> +{
> + int ret =3D arm_smmu_device_reset(smmu);
> +
> + if ( ret )
> + dev_err(smmu->dev, "Failed to reset during suspend rollback: %d\n",
> + ret);
> +}
> +
> +static int arm_smmu_suspend(void)
> +{
> + struct arm_smmu_device *smmu;
> + int ret =3D 0;
> +
> + list_for_each_entry(smmu, &arm_smmu_devices, devices)
> + {
> + /* Abort all transactions before disable to avoid spurious bypass */
> + ret =3D arm_smmu_update_gbpa(smmu, GBPA_ABORT, 0);
> + if ( ret )
> + goto fail;

Should we have this here as the restore path calls arm_smmu_enable_irqs()?

ret =3D arm_smmu_write_reg_sync(smmu, 0,
                              ARM_SMMU_IRQ_CTRL,
                              ARM_SMMU_IRQ_CTRLACK);
if ( ret )
    goto fail;

Cheers,
Luca


