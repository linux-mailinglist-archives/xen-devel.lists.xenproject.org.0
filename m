Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C945D5F0250
	for <lists+xen-devel@lfdr.de>; Fri, 30 Sep 2022 03:42:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.413972.657982 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oe51O-0006Mu-2L; Fri, 30 Sep 2022 01:40:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 413972.657982; Fri, 30 Sep 2022 01:40:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oe51N-0006L7-Sc; Fri, 30 Sep 2022 01:40:57 +0000
Received: by outflank-mailman (input) for mailman id 413972;
 Fri, 30 Sep 2022 01:40:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QDfz=2B=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1oe51M-0006KC-Kg
 for xen-devel@lists.xenproject.org; Fri, 30 Sep 2022 01:40:56 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2064.outbound.protection.outlook.com [40.107.20.64])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e923dd09-4060-11ed-9374-c1cf23e5d27e;
 Fri, 30 Sep 2022 03:40:49 +0200 (CEST)
Received: from DU2P251CA0004.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:230::14)
 by AS2PR08MB9073.eurprd08.prod.outlook.com (2603:10a6:20b:5fd::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23; Fri, 30 Sep
 2022 01:40:47 +0000
Received: from DBAEUR03FT038.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:230:cafe::d1) by DU2P251CA0004.outlook.office365.com
 (2603:10a6:10:230::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23 via Frontend
 Transport; Fri, 30 Sep 2022 01:40:47 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT038.mail.protection.outlook.com (100.127.143.23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5676.17 via Frontend Transport; Fri, 30 Sep 2022 01:40:46 +0000
Received: ("Tessian outbound ce981123c49d:v128");
 Fri, 30 Sep 2022 01:40:46 +0000
Received: from b2432e3c2801.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5194CCC3-2CFE-4053-9746-DECB8C1803CD.1; 
 Fri, 30 Sep 2022 01:40:39 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b2432e3c2801.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 30 Sep 2022 01:40:39 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by DU0PR08MB9155.eurprd08.prod.outlook.com (2603:10a6:10:416::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.19; Fri, 30 Sep
 2022 01:40:36 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::6f9a:a2b6:e5d3:349e]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::6f9a:a2b6:e5d3:349e%7]) with mapi id 15.20.5676.017; Fri, 30 Sep 2022
 01:40:36 +0000
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
X-Inumbo-ID: e923dd09-4060-11ed-9374-c1cf23e5d27e
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=IAlHIPUh9VXr9pv1OX+pqiwmCzvyOvKl02/jhlqujytW7JqycJOX6ZYCCUoDx1d9CfuVgSaEcs3Zuv3JolPdUqJ5J3rme9zQXIwRuAif/K4vPA67tSh6mt5SyBOpfs5y7Wwa3wILLuklB2RvLaryy/cgVEkyvXiy5w2DTfDoEXwexIINtFQqwbJc/MSEA6PaRl43UMpyb1XQIelKbfDIPpj4itMzagyovu2psAMYvBhFbWisUdDPZxqYaW3LDpE16S0OYCJjh8/5dk6rg8yQVPyWfx1NZ2jlM+kfkzxm8ieyNqBR/UbMFnmYowwbNshV/d/Q6xjdWOVjtFsJEsw5iA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n0tYdRF1uMknpB0KEvfUZ1am4t4d6QbYvKcLNfle6uc=;
 b=nbFVVT4pFAh2cuhCCvaFFumMUOghMfJX+IHrqsM/jvFg8QTvC3BP3YDs/ZWbu9Wl19gdIjZLxwXlful4zq/4ZL0Rtq3vwAFcNNU61J/tRbAU/sAO1rHe/vPg+21OA2F8KhpROTzq5kDhj8JPyQ+Iz4QET/isirZfyE8OyzpULmRwPyV6NSYDPvTUdwoZjfZulqnZlxv2ADoOWYA3+vw3aug/s4+za64qdNDwgKi4xChClkbbYH9zZ89wBiRxdiZ28DbIl/ukXSeYveWkjay2Dsoy76BHNRyjyQcxu+OvUgmxboQbGXPZ2M1oq15iYwwg8Ngl47xzkE8s4g7SV8Q1iw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n0tYdRF1uMknpB0KEvfUZ1am4t4d6QbYvKcLNfle6uc=;
 b=yZi6V61AOrLnTpfTDKzmohWMUc97ODCzkYjIzDnpUFUN3wk1EPNcgvPUbaS+M+Nq2pkZfk2FICW27cHZv0hupmzLx0igqV6aOx2YAPyC8yuWvgoQ4q3k9ZBC/SIrp5UZ4L98wY/IG3TpqsgfhdHmYcggtqYAoOJf7CNUIKkMihU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TnS0oYYDMoVzeBwDxHW6IplaSWK6BsFmSv6gQlPr2w/UIJ3UjCosNpGCjCUfjEMuCnqfyAnV2QabJiQzSeI0yqZtiaW5NLjv826K9zF1qvKKvLYzQfPPJVgAtcLeyfwNBwh2MO8VcGd0fMmXJk3z7DEq3UIBtmPkqP+ifPHugK2nfPOuoHUVJ/RbjQW4BnK+ZwRj5eNtpUba+WbuBrpz1xplmoy1Kk5tNu8PlUUR37U21rp/aTUbQYfE/53vLwtwUxoqUQ9OKSOrGRM+VnehpVyeO6Z4d6FGWSU037LW/w/d7XI4SBw6Jt3E0aQypFXhPq2ujrSNNla3hjHC8Au8vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n0tYdRF1uMknpB0KEvfUZ1am4t4d6QbYvKcLNfle6uc=;
 b=GOVCAOqlytqcbjUn85dz60ZLNrUZZwWeVMdLWWhQha6wICUxr6J1R5Y04DB5YGSe1xKfCjXB0nfuRcR0FU2jgd/JtyqZAv0R5v+dLefcA0R5iORjHzx8q4gDZQ2haCpsVkjniluOq1p9wXmV3pdeDQLyocCGTZ5729IlF1ErPEVysFRejnd4lVEcTJ/dcF5Km51hexQNzLj0QerrE+iFbkjcCaOCGxYs/w6NxIVpi5t0ldgsOlgHMCT9Q506puua3+e8tZArZ7ao/0/JUWiU/XYaduINxQQ1+Jyp7m6bk+nj0yN1RSmHXfSmAOdIQw6R6xGkP1v0CBGzNN378qQxkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n0tYdRF1uMknpB0KEvfUZ1am4t4d6QbYvKcLNfle6uc=;
 b=yZi6V61AOrLnTpfTDKzmohWMUc97ODCzkYjIzDnpUFUN3wk1EPNcgvPUbaS+M+Nq2pkZfk2FICW27cHZv0hupmzLx0igqV6aOx2YAPyC8yuWvgoQ4q3k9ZBC/SIrp5UZ4L98wY/IG3TpqsgfhdHmYcggtqYAoOJf7CNUIKkMihU=
From: Wei Chen <Wei.Chen@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: nd <nd@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v5 5/6] xen/x86: move NUMA scan nodes codes from x86 to
 common
Thread-Topic: [PATCH v5 5/6] xen/x86: move NUMA scan nodes codes from x86 to
 common
Thread-Index: AQHYzNExhaWvtVxVf06aoC2sQxI0u63zd60AgAKngwCAAEMigIAA3nNw
Date: Fri, 30 Sep 2022 01:40:36 +0000
Message-ID:
 <PAXPR08MB742077FE40B3FB0614787B599E569@PAXPR08MB7420.eurprd08.prod.outlook.com>
References: <20220920091218.1208658-1-wei.chen@arm.com>
 <20220920091218.1208658-6-wei.chen@arm.com>
 <5ac85819-9a1d-b8bc-d49d-13cb34a3e7e9@suse.com>
 <fc03f565-8c05-e310-fa0a-698ad7c569e3@arm.com>
 <47ec8e01-8ea6-4678-78c2-c67305fe3b7a@suse.com>
In-Reply-To: <47ec8e01-8ea6-4678-78c2-c67305fe3b7a@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: F4017657489D804FADC1EB523F820560.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PAXPR08MB7420:EE_|DU0PR08MB9155:EE_|DBAEUR03FT038:EE_|AS2PR08MB9073:EE_
X-MS-Office365-Filtering-Correlation-Id: d31b5ffb-51d2-4da8-5474-08daa284cbea
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 pZ1s/wvvBkm2C+pZS+mXL6WR1ZFihla4rWMgPFowZxYAK6k81TBXnUXmto8J4bMrHr0wrLVXTyFNBkzy9g+Yh8sAt9MpCem7wIsfalaMNvPYjKR/xtGvp//8/DOiJ9ovzb3lMa6C9WBcD/6ZPH+UNjqn62S13HG/E+v+LV2VOkYMbiKN69ElXv216agFmdWlyxFqepjlcTLn56W8T5GHSwgw47UENYg+Ap+10tJFQ31rQdOzSOfbkMlDRy/4cU7DhiXa/aMGwiU3KptyVXGIzaDbm8iQhAVpD/iUqZbcGWtYYBz4/Uo2dds8TRUT6AYe7+01LT2gry15zvLKqr44aNLYUWsT9Dcf0X9JKcMEkxcQ1YjAEreGz0yoWL6bFq76LltndLg3VXmIqYcH4nWlUORrNJSo/lrzuOQ2/kwx+fvHTkXtdLMybhvA1Er/cmPW8Dtu5TOeq/BKoJHmSURq2+qyg6TOgTbuu2L+Pof2//twjzWGomqXOj41LHBCBzJQ+382iVEC8341pEpjBw4D2Zh512ikcgAXESZ0gjdf+kz2Ih9gqwb948SEZhihQ3xGE/ye2RztjnX17+O41z7/9w8gRNt5vOwlOLYKFVXxGdrNBSw6kBMWrnqCeP/OaIKF24wN2iFk4iuMoniqXy0jINoPaKlfVwRVdv0XeZSYJnNfI29Gka5+kAE1Ooj3XAmWSM/8XpezN8yTHG0RC8HS9ZSGxeN5MoQNhVgrpJAm43b6ev0G+oNq9ijemRRc2nuO
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(136003)(39860400002)(346002)(366004)(451199015)(54906003)(316002)(6916009)(7696005)(52536014)(86362001)(8936002)(41300700001)(33656002)(186003)(8676002)(66946007)(66476007)(76116006)(66556008)(64756008)(4326008)(66446008)(53546011)(6506007)(2906002)(5660300002)(9686003)(83380400001)(55016003)(38070700005)(478600001)(71200400001)(122000001)(38100700002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9155
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT038.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ba54014a-978d-4dd7-398b-08daa284c5d8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rvzqxzoAuyAlyA4w1JgRxmXVNr0AklbMuH0gOFv7wXjZcAPdd/2d3d3i6tah5kUS3/RZf5A6Jn/Ljt3NyleA8tboqp1kGmBBoebSNJ45avY6YUrRqtjQBBtJjT3NPCpVM7GnoG3anepMEpwlzHVjDmMuHyTjXqKC9p5uDex/ol2eUPceLaUpjEr/LLBt4tYA83gQuuAky7W7u++VwZf1ath8N2w1whTBqifvA0Bvx+I+pracXUyVWHWjOKbYHfnt5wsgI5hMiRnKIxt79/z7yoXJodpYI9F9PuNDYHv/pcYgWS9DErzb/LJmGgjdHWN+r9PftkiY4jTHygsDXo1Wrtqo3kaCDNere/lJX0BGoFGnegpScAZURba2LFsES1qhzniLDeGrr3w8p+TN8FXP073IqRRUcLNIRGKvtmm19dcXxCIFoHFe5xBY+Lyby7JLvERPQgf0wzWtXn1Y5Joa7CVe0f8CRwXzs61K/GeJmhxql/ZhjxpmntZlwlTqR/nOTvKHuTtXhj9oX4k7TiRenw0OzLsTAvp6CHAf6Xy26WwmZvUW1HVdYu/Ajri7DvnStGSe5JDPLQxzHau5aGeILoEke4nGPixrgaGR4/sIOeiTGBw+Lql0B/aGPO6TNEHaljUA4UAE+BVWDF6KjbMTv+2FIidqyJG8X8OSzvfMt+W0M9DNtOMWovi4NumJGxwtusSkgzIuDiOkxHeZEjIxV7bPmYjJjKsbd8Q24ZMQzDJA7branm2Bfb/nVlBFKarfVYn7JFmYMw6nWtJ4CN0l9Q==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(39860400002)(376002)(346002)(451199015)(36840700001)(40470700004)(46966006)(47076005)(2906002)(26005)(6862004)(8936002)(33656002)(52536014)(70586007)(70206006)(9686003)(41300700001)(53546011)(36860700001)(8676002)(4326008)(86362001)(336012)(54906003)(40460700003)(6506007)(7696005)(186003)(5660300002)(316002)(478600001)(55016003)(81166007)(40480700001)(83380400001)(356005)(82310400005)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2022 01:40:46.6861
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d31b5ffb-51d2-4da8-5474-08daa284cbea
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT038.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9073

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU2VudDogMjAyMuW5tDnmnIgyOeaXpSAyMDoyMQ0K
PiBUbzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+DQo+IENjOiBuZCA8bmRAYXJtLmNvbT47
IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+OyBSb2dlciBQYXUNCj4g
TW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT47IFdlaSBMaXUgPHdsQHhlbi5vcmc+OyBHZW9y
Z2UgRHVubGFwDQo+IDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+OyBKdWxpZW4gR3JhbGwgPGp1
bGllbkB4ZW4ub3JnPjsgU3RlZmFubw0KPiBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwu
b3JnPjsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFU
Q0ggdjUgNS82XSB4ZW4veDg2OiBtb3ZlIE5VTUEgc2NhbiBub2RlcyBjb2RlcyBmcm9tIHg4Ng0K
PiB0byBjb21tb24NCj4gDQo+IE9uIDI5LjA5LjIwMjIgMTA6MjEsIFdlaSBDaGVuIHdyb3RlOg0K
PiA+IE9uIDIwMjIvOS8yNyAyMzo0OCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+ID4+IE9uIDIwLjA5
LjIwMjIgMTE6MTIsIFdlaSBDaGVuIHdyb3RlOg0KPiA+Pj4gLS0tIGEveGVuL2RyaXZlcnMvYWNw
aS9LY29uZmlnDQo+ID4+PiArKysgYi94ZW4vZHJpdmVycy9hY3BpL0tjb25maWcNCj4gPj4+IEBA
IC03LDQgKzcsNSBAQCBjb25maWcgQUNQSV9MRUdBQ1lfVEFCTEVTX0xPT0tVUA0KPiA+Pj4NCj4g
Pj4+ICAgY29uZmlnIEFDUElfTlVNQQ0KPiA+Pj4gICAJYm9vbA0KPiA+Pj4gKwlzZWxlY3QgSEFT
X05VTUFfTk9ERV9GV0lEDQo+ID4+PiAgIAlzZWxlY3QgTlVNQQ0KPiA+Pg0KPiA+PiBXaGlsZSBJ
IG1pZ2h0IGd1ZXNzIHRoYXQgeW91J3ZlIGNob3NlbiB0aGUgaW5zZXJ0aW9uIHBvaW50IHRvIGhh
dmUNCj4gPj4gdGhpbmdzIHNvcnRlZCBhbHBoYWJldGljYWxseSwgSSB0aGluayBoZXJlIGl0IHdv
dWxkIGJlIG1vcmUgbmF0dXJhbA0KPiA+PiB0byBzZWxlY3QgdGhlIHdpZGVyIG9wdGlvbiBmaXJz
dCBhbmQgdGhlbiBhbHNvIHNlbGVjdCB0aGUgbW9yZQ0KPiA+PiBuYXJyb3cgb25lLg0KPiA+Pg0K
PiA+DQo+ID4gT2ssIEkgd2lsbCBhZGp1c3QgdGhlIG9yZGVyLg0KPiA+DQo+ID4+IE9uZSBmdXJ0
aGVyIHF1ZXN0aW9uIHRob3VnaDogSG93IGlzIHRoaXMgZ29pbmcgdG8gd29yayBmb3IgQXJtNjQN
Cj4gPj4gb25jZSBpdCB3YW50cyB0byBzdXBwb3J0IGJvdGggdGhlIGZvcm0gb2YgTlVNQSB5b3Un
cmUgd29ya2luZyB0bw0KPiA+PiBlbmFibGUgX2FuZF8gQUNQSS1iYXNlZCBOVU1BPyBUaGVyZSBi
ZXR0ZXIgd291bGRuJ3QgYmUgYSByZXF1aXJlbWVudA0KPiA+PiB0byBwaWNrIG9uZSBvZiB0aGUg
dHdvIGF0IGJ1aWxkIHRpbWUgLSBpdCB3b3VsZCBiZSBuaWNlIGZvciBzdXBwb3J0DQo+ID4+IG9m
IGJvdGggZm9ybXMgdG8gYmUgYWJsZSB0byBjby1leGlzdCBpbiBhIHNpbmdsZSBiaW5hcnkuDQo+
ID4NCj4gPiBXZSBhcmUgYWxzbyB3b3JraW5nIGluIHRoaXMgd2F5LiBJbiBwYXJ0IzMsIHdlIHdp
bGwgY2hlY2sgQUNQSSBmaXJzdCwNCj4gPiBvbmx5IHdoZW4gQUNQSSBpcyBvZmYsIHRoZSBEVCBO
VU1BIHdpbGwgYmUgdXNlZCBieSBBcm0uIElmIEFDUEkgaXMgb24sDQo+ID4gd2Ugd2lsbCBza2lw
IERUIE5VTUEuDQo+IA0KPiBFdmVuIG1vcmUgc28gYW4gYW5zd2VyIHRvIG15IHF1ZXN0aW9uIHdv
dWxkIGJlIG5pY2U6IFlvdSdsbCB0aGVuIGhhdmUNCj4gQ09ORklHX0hBU19OVU1BX05PREVfRldJ
RD15IGV2ZW4gb24gQXJtICh1c2luZyBQWE0gYXMgbWFuZGF0ZWQgYnkgQUNQSQ0KPiB3aGVuIGlu
IEFDUEkgbW9kZSkuIEJ1dCB0aGVuIHdoYXQncyB0aGUgRldJRCBmb3IgRFQ/IEkga25vdyBpdCB3
YXMgbWUNCj4gdG8gc3VnZ2VzdCB0aGlzIGJ1aWxkIHRpbWUgZGlzdGluY3Rpb24sIGJ1dCBJJ20g
YWZyYWlkIEkgd2Fzbid0IGRvaW5nDQo+IG11Y2ggZ29vZCB3aXRoIHRoYXQgKGFuZCBJJ20gc29y
cnkpLg0KDQpIb3cgYWJvdXQgaW50cm9kdWNpbmcgYSBmbGFnIGZvciBzZWxlY3RlZCBOVU1BIGlt
cGxlbWVudGF0aW9uIHRvDQpzZXQgaXQgaW4gcnVudGltZT8NCkZvciBleGFtcGxlOg0KYm9vbCBu
dW1hX2hhc19md19ub2RlaWQ7DQoNCkFDUEkgTlVNQSB3aWxsIHNldCB0aGlzIGZsYWcgdG8gMSwg
YnV0IDAgZm9yIERUIE5VTUEuDQoNCkNoZWVycywNCldlaSBDaGVuIA0KDQo+IA0KPiBKYW4NCg==

