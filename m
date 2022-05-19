Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F41E452CA6C
	for <lists+xen-devel@lfdr.de>; Thu, 19 May 2022 05:37:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.332611.556332 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrWyX-0004Ws-AV; Thu, 19 May 2022 03:37:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 332611.556332; Thu, 19 May 2022 03:37:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrWyX-0004US-6I; Thu, 19 May 2022 03:37:21 +0000
Received: by outflank-mailman (input) for mailman id 332611;
 Thu, 19 May 2022 03:37:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+51y=V3=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1nrWyV-0004UK-DG
 for xen-devel@lists.xenproject.org; Thu, 19 May 2022 03:37:19 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0607.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::607])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id faf56ee0-d724-11ec-bd2c-47488cf2e6aa;
 Thu, 19 May 2022 05:37:18 +0200 (CEST)
Received: from DB6PR0301CA0085.eurprd03.prod.outlook.com (2603:10a6:6:30::32)
 by AM6PR08MB5000.eurprd08.prod.outlook.com (2603:10a6:20b:e6::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14; Thu, 19 May
 2022 03:37:14 +0000
Received: from DBAEUR03FT042.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:30:cafe::5e) by DB6PR0301CA0085.outlook.office365.com
 (2603:10a6:6:30::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.16 via Frontend
 Transport; Thu, 19 May 2022 03:37:14 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT042.mail.protection.outlook.com (100.127.142.143) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5273.14 via Frontend Transport; Thu, 19 May 2022 03:37:14 +0000
Received: ("Tessian outbound c1f35bac1852:v119");
 Thu, 19 May 2022 03:37:14 +0000
Received: from 78f24063d63c.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 22FEF9E4-4012-4455-988A-789A9163DDDC.1; 
 Thu, 19 May 2022 03:37:08 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 78f24063d63c.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 19 May 2022 03:37:08 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by PAXPR08MB7351.eurprd08.prod.outlook.com (2603:10a6:102:229::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.15; Thu, 19 May
 2022 03:37:06 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::d007:5582:9bbe:425e]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::d007:5582:9bbe:425e%3]) with mapi id 15.20.5273.015; Thu, 19 May 2022
 03:37:06 +0000
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
X-Inumbo-ID: faf56ee0-d724-11ec-bd2c-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=FBBEKbXRGWRX8WUMTgmo7yCffzOWXw0PIvnZBY8CFRGzJTclt0rC8SHW1vIWZsC/MxmmNANuFD1yU3EvJMHIk/Uo5cFvdxxzIO+jyi6DIRcoXUUzurSuCfE93/x6HmsN6gcD4UA20I9uIPyCRYxd6aYRvEZ7Zwdl/Rc/qp1e6N0lZMtojebd8B2JMFZq8NYLg7RlzhzphBgrK0zexok7oK0nIVl4M9/oLOC5Giwk1/u3Kj1LfHa8itt5DbbaUvDr4gUPxUpAQN8tnosz4ce5MqQzV97cnvhQjGHNjgy0W38JGvw8i+LKilUahe5+d8gNwqWza5ij5wdQeIvtC49Uig==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xs4zjADiaEX/YriP9sNFK7JlmaSd1WYyrSb7ClwrtMA=;
 b=hx0l6yLrecPD7KatwgJ2sD4u+INKhWYjA+nAlD6Q9Mkify+B0laVxyr/LHsZzTbOPJRSVRpts5bVhk/eKTz97fCt7y2Eta2e+X/ohG7NVH0n8DigH5wz5XvpyemNBf6Xejre6ZcrbMIQtC0+qVeDtOOa2WRVPk4P9fB2oP/INIYLkD+vb6FL7SE8dXx+feGxB5yjQGA7t3Dds+87A+zH3NlZ2ExxV6nROh14Zq8sHBSixoP3F6M0+tXQt0lwK6kFVV0xnppf+gxNKfzLRvcd6owkS5OEILaPNmeZWKst5u+xMoAz5EMozWSPpkMUOS5BMEbeLDK5H66Et/AWQlIlCQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xs4zjADiaEX/YriP9sNFK7JlmaSd1WYyrSb7ClwrtMA=;
 b=WAJ2X676y63OoQo2k5bk8dHJUugBp7thZ/ULvXNFgbuwNfYKjh5EBKE5mCIxopn5wJuIxQQTlJ/XumtJ3csIvXnfSoRn6xtjGRNfzG8oo7KGWjJleSAIMIc4OAf5DsJ+gWu8DEwVssmwhvP+m/q6QHkctXeYePXQkCUUDOwBoaI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mGyfaF5CsmFGERQ0wkLAcbZYN9KUspgoOvQJiXxbVX0922hn8hQaEWaEDrIW3BBJtbsG3C4Lq94HxH5qrJtu0hMpIsF+nPrqi7gND+RdlabRUosrpFABGiLR3c66AyJ4Oy3DS9UCSOuypA/uOwEjkNSEGppsqJsBfmCAogVqdY/eNLZ9ewHuN29aYV/YZs5ToQXOIbLZoSE5KSSYGGZuyWVLbIUh2CDhjbOFX/9yoKrnEQP0yEpN2dhaV1DdShRC4JjHiqq/vhUWOiXdnXCLZ4sBad9hkWV9xBguc6DUHaJH0d19HgFfEOySyVvfYBNGAmQ0KrBJstB49SiuMC+/yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xs4zjADiaEX/YriP9sNFK7JlmaSd1WYyrSb7ClwrtMA=;
 b=ZJw2/v+DivS69JSBv4jATD/NZCs6QIDzFZUKnYn6qOkgdI65miqKNHwAELN11SkFVEluvIqEAmoCAvV2haStQ/ShZRiRqjXwhLw4gTcDOm2XEbVgjCY2PMJLv3Suu7BLE4vlI07OdqrFeIdqTGQH6MO3tO1UrG62dzom2vyeI7v2rTLO+KYqxD+TnwIz7tUn0rZHqzncQlXs131wlnJsSuX4DCGjF6FijA8EIMbjLWpttu7sYMo62AYVBkrYl75XyIMFrD7rMKui6JTQ+OuUxS1CPwxl3xqwz8FimddPdPKbQbjf0F1AY8gmu/SmKugKWN3k8sSNiCOjLMk6h5CkYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xs4zjADiaEX/YriP9sNFK7JlmaSd1WYyrSb7ClwrtMA=;
 b=WAJ2X676y63OoQo2k5bk8dHJUugBp7thZ/ULvXNFgbuwNfYKjh5EBKE5mCIxopn5wJuIxQQTlJ/XumtJ3csIvXnfSoRn6xtjGRNfzG8oo7KGWjJleSAIMIc4OAf5DsJ+gWu8DEwVssmwhvP+m/q6QHkctXeYePXQkCUUDOwBoaI=
From: Wei Chen <Wei.Chen@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: nd <nd@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Jiamei Xie <Jiamei.Xie@arm.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v3 8/9] xen/x86: add detection of memory interleaves for
 different nodes
Thread-Topic: [PATCH v3 8/9] xen/x86: add detection of memory interleaves for
 different nodes
Thread-Index: AQHYZNkRevkwA8X5Q0qos/NOAm18uq0krTiAgADb+cA=
Date: Thu, 19 May 2022 03:37:05 +0000
Message-ID:
 <PAXPR08MB7420AF2735B2076F2EF4A9579ED09@PAXPR08MB7420.eurprd08.prod.outlook.com>
References: <20220511014639.197825-1-wei.chen@arm.com>
 <20220511014639.197825-9-wei.chen@arm.com>
 <f81355e7-cbe2-4772-3799-9e53d15c458f@suse.com>
In-Reply-To: <f81355e7-cbe2-4772-3799-9e53d15c458f@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 91E66FCFB6F79B47B50E6D37E1D9BADA.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: ea267980-7a32-44e1-63d2-08da3948dd82
x-ms-traffictypediagnostic:
	PAXPR08MB7351:EE_|DBAEUR03FT042:EE_|AM6PR08MB5000:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB5000EAE4A3118D467A4D861E9ED09@AM6PR08MB5000.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 7tRpuYiICLJmnKt0Z+X6tW35iSYnDxn9gVNoH1T4Z9JDyXjjR5i3hI2mq3F21EQkUij/OJ1N/84InWCw5Z7YmCdtwH5aWLv+tpknBUid50hZpa8I0a9YQtg8r6Ya/ZAoKDULhxPaG3EqRGT+gyUs/W6QOBOJ+iW/ZjLbxPd7N2jsJotrlzrGnZCN+UfauPJFFqtf3muYI4fydsh+JwIMUvEe/sVSQlm0slspbvT5eIyJTZ6eaTFLDlR8s5au894cxWPu06SPzF2kwd9bDteXZzbcMO7s/MVPz4ZHu3qfV+u1v/y+Q9Q6Xf/zvMmNMcz6Fa2xSYJhxtsDDrk5Hbr13M8hb1HmlvzAGwGml7JmUmT3zd1Ms0T3RAcRs5Yea4XaIdwS4xr2kA8dElSymGh3+nd+5a6cL9L5/sjHI81tcj8mdZrixLXzltW74z8s2/PzySnwwkae8PPv7v2gQeQ3/GnqibqwRyVUA+yqZ0+cToCmnnjq4mqr6Xu0d/G0tzqZkC3BVh148PgZ+q/PtsXLnFdM9PKJUCQ2X+efhSLvax/oAiJoCghXTB87sApMfzIbZ/t9gnSbZrUw/Fm8xlziooHLBWRgvCN+gKjytb360XE37F3HiiRuPE9fnvIAPxdfxQpr8Ego1/CtNAahIEBX4iB79j9gOiz6cJMtCOpmZGmmXIY5wDSS5KjzaYKJBIyNvgOLwakqLc1nCmUY6V9BmQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(7696005)(38100700002)(9686003)(316002)(54906003)(53546011)(6506007)(86362001)(186003)(2906002)(122000001)(64756008)(8936002)(52536014)(5660300002)(66556008)(66476007)(66446008)(55016003)(76116006)(66946007)(71200400001)(6916009)(26005)(33656002)(83380400001)(38070700005)(508600001)(8676002)(4326008);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7351
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d8d4a0f2-552d-4887-1a74-08da3948d892
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MnliTgJdHEVxC+JkKIpN8oVtU+/0KhP3G+vCuV9q/rv3J/DwonBFF2w6NdzC5upmIXaR6EfyQMWsZxhHuIC6kCWbXfUYwLG40sZRhmhQc4mk/MOuyaKxKE8HbvgtgCEthpFl40LlgRaw4V8hWA+xNS8/tJpKhL9zUGymTTotbLDk4paaXlnn8ryh1a/55wCVrVhQsseQMzFDqNBAIxl9/HxVqAdCHJjHmYqWpL3P3ZkVyiF6m5jeeasuhQngfX/VyrpgPQprZD6Lxs+6z+LK1k0ZbWeq9VBBOC1Nyq/yhQrliPm+Eyu7JA/xNe1nD3py042YKIr/YIs14vk2m+D++8hJ2BtIhsnFdrArZZpDMWsJRrNpPwIEsi4BPFD6Hgi4g/aePFAPljiWQLjt1sMDb6tMISfoyjgpS2jMyYTO+Tb1ZFBcr4ojEJB1ggAW+Y4EW7Yl8iFexpLxKQbz7U/ZCyjozHsQAgQHE1Okc7Q1VaplSGnyqCb+k2QjpjOU6Ob/NohAgXGMSJ7hy5DE7NLwuwFmj4qttv7fu78tZTdbyvjt4uj6bW9w80yk8r4nzsxZYTv/whDmMOwzr0UalSfA2+tWjoEOoXoin1QSiyooyWPDH65PO3DhN3L4MzPTKgvvQmgOQ5AIave3Fjz5V27WBLWUoMx3CAKUuYd+pAf5M6grBidJtLd0bT6U+gVh07Wp
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(82310400005)(70206006)(508600001)(4326008)(70586007)(8676002)(6862004)(316002)(36860700001)(54906003)(7696005)(86362001)(53546011)(52536014)(81166007)(8936002)(55016003)(83380400001)(6506007)(47076005)(5660300002)(40460700003)(356005)(186003)(33656002)(2906002)(336012)(26005)(9686003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2022 03:37:14.3085
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ea267980-7a32-44e1-63d2-08da3948dd82
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5000

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU2VudDogMjAyMuW5tDXmnIgxOOaXpSAyMTozMQ0K
PiBUbzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+DQo+IENjOiBuZCA8bmRAYXJtLmNvbT47
IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+OyBSb2dlciBQYXUNCj4g
TW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT47IFdlaSBMaXUgPHdsQHhlbi5vcmc+OyBKaWFt
ZWkgWGllDQo+IDxKaWFtZWkuWGllQGFybS5jb20+OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MyA4LzldIHhlbi94ODY6IGFkZCBkZXRlY3Rp
b24gb2YgbWVtb3J5IGludGVybGVhdmVzDQo+IGZvciBkaWZmZXJlbnQgbm9kZXMNCj4gDQo+IE9u
IDExLjA1LjIwMjIgMDM6NDYsIFdlaSBDaGVuIHdyb3RlOg0KPiA+IC0tLSBhL3hlbi9hcmNoL3g4
Ni9zcmF0LmMNCj4gPiArKysgYi94ZW4vYXJjaC94ODYvc3JhdC5jDQo+ID4gQEAgLTQyLDYgKzQy
LDEyIEBAIHN0YXRpYyBzdHJ1Y3Qgbm9kZSBub2RlX21lbWJsa19yYW5nZVtOUl9OT0RFX01FTUJM
S1NdOw0KPiA+ICBzdGF0aWMgbm9kZWlkX3QgbWVtYmxrX25vZGVpZFtOUl9OT0RFX01FTUJMS1Nd
Ow0KPiA+ICBzdGF0aWMgX19pbml0ZGF0YSBERUNMQVJFX0JJVE1BUChtZW1ibGtfaG90cGx1Zywg
TlJfTk9ERV9NRU1CTEtTKTsNCj4gPg0KPiA+ICtlbnVtIGNvbmZsaWN0cyB7DQo+ID4gKwlOT19D
T05GTElDVCA9IDAsDQo+IA0KPiBObyBuZWVkIGZvciB0aGUgIj0gMCIuDQo+IA0KDQpBY2suDQoN
Cj4gPiArCUVSUl9PVkVSTEFQLA0KPiANCj4gV2hpbGUgdGhpcyBhdCBsZWFzdCBjYW4gYmUgYW4g
ZXJyb3IgKHRoZSBzZWxmLW92ZXJsYXAgY2FzZSBpcyBtZXJlbHkNCj4gd2FybmVkIGFib3V0KSwg
Li4uDQo+IA0KPiA+ICsJRVJSX0lOVEVSTEVBVkUsDQo+IA0KPiAuLi4gSSBkb24ndCB0aGluayB0
aGlzIGlzLCBhbmQgaGVuY2UgSSdkIHJlY29tbWVuZCB0byBkcm9wICJFUlJfIi4NCj4gDQoNCk9o
LCB5ZXMuIEkgYWxsIGRyb3AgaXQgZm9yIGFsbCBhYm92ZSBlbnVtZXJhdGlvbnMuDQoNCj4gPiBA
QCAtMTE5LDIwICsxMjUsNDMgQEAgaW50IHZhbGlkX251bWFfcmFuZ2UocGFkZHJfdCBzdGFydCwg
cGFkZHJfdCBlbmQsDQo+IG5vZGVpZF90IG5vZGUpDQo+ID4gIAlyZXR1cm4gMDsNCj4gPiAgfQ0K
PiA+DQo+ID4gLXN0YXRpYyBfX2luaXQgaW50IGNvbmZsaWN0aW5nX21lbWJsa3MocGFkZHJfdCBz
dGFydCwgcGFkZHJfdCBlbmQpDQo+ID4gK3N0YXRpYyBlbnVtIGNvbmZsaWN0cyBfX2luaXQNCj4g
PiArY29uZmxpY3RpbmdfbWVtYmxrcyhub2RlaWRfdCBuaWQsIHBhZGRyX3Qgc3RhcnQsIHBhZGRy
X3QgZW5kLA0KPiA+ICsJCSAgICBwYWRkcl90IG5kX3N0YXJ0LCBwYWRkcl90IG5kX2VuZCwgaW50
ICptYmxraWQpDQo+IA0KPiBXaHkgImludCI/IENhbiB0aGUgdmFsdWUgcGFzc2VkIGJhY2sgYmUg
bmVnYXRpdmU/DQo+IA0KDQpUaGUgY2FsbGVyICJhY3BpX251bWFfbWVtb3J5X2FmZmluaXR5X2lu
aXQiIGRlZmluZXMgaW50IGZvciBub2RlIG1lbW9yeQ0KYmxvY2sgaWQsIGFuZCBhcyBhIHJldHVy
biB2YWx1ZSBhdCB0aGUgc2FtZSB0aW1lLiBTbyBJIGhhdmVuJ3QgY2hhbmdlZCBpdC4NCkFzIHdl
IGRvbid0IHVzZSB0aGlzICJpbnQiIGZvciByZXR1cm4gdmFsdWUgYW55IG1vcmUsIEkgYWdyZWUs
IGl0IHdpbGwNCm5ldmVyIGJlIG5lZ2F0aXZlLCBJIHdvdWxkIGZpeCBpdC4NCg0KPiA+ICB7DQo+
ID4gIAlpbnQgaTsNCj4gPg0KPiA+ICsJLyoNCj4gPiArCSAqIFNjYW4gYWxsIHJlY29yZGVkIG5v
ZGVzJyBtZW1vcnkgYmxvY2tzIHRvIGNoZWNrIGNvbmZsaWN0czoNCj4gPiArCSAqIE92ZXJsYXAg
b3IgaW50ZXJsZWF2ZS4NCj4gPiArCSAqLw0KPiA+ICAJZm9yIChpID0gMDsgaSA8IG51bV9ub2Rl
X21lbWJsa3M7IGkrKykgew0KPiA+ICAJCXN0cnVjdCBub2RlICpuZCA9ICZub2RlX21lbWJsa19y
YW5nZVtpXTsNCj4gPiArCQkqbWJsa2lkID0gaTsNCj4gDQo+IFN0eWxlOiBQbGVhc2UgbWFpbnRh
aW4gYSBibGFuayBsaW5lIGJldHdlZW4gZGVjbGFyYXRpb24ocykgYW5kDQo+IHN0YXRlbWVudChz
KS4NCj4gDQoNCk9rLg0KDQo+ID4gQEAgLTMxMCw0MiArMzQyLDY3IEBAIGFjcGlfbnVtYV9tZW1v
cnlfYWZmaW5pdHlfaW5pdChjb25zdCBzdHJ1Y3QNCj4gYWNwaV9zcmF0X21lbV9hZmZpbml0eSAq
bWEpDQo+ID4gIAkJYmFkX3NyYXQoKTsNCj4gPiAgCQlyZXR1cm47DQo+ID4gIAl9DQo+ID4gKw0K
PiA+ICsJLyoNCj4gPiArCSAqIEZvciB0aGUgbm9kZSB0aGF0IGFscmVhZHkgaGFzIHNvbWUgbWVt
b3J5IGJsb2Nrcywgd2Ugd2lsbA0KPiA+ICsJICogZXhwYW5kIHRoZSBub2RlIG1lbW9yeSByYW5n
ZSB0ZW1wb3JhcmlseSB0byBjaGVjayBtZW1vcnkNCj4gPiArCSAqIGludGVybGVhdmVzIHdpdGgg
b3RoZXIgbm9kZXMuIFdlIHdpbGwgbm90IHVzZSB0aGlzIG5vZGUNCj4gPiArCSAqIHRlbXAgbWVt
b3J5IHJhbmdlIHRvIGNoZWNrIG92ZXJsYXBzLCBiZWNhdXNlIGl0IHdpbGwgbWFzaw0KPiA+ICsJ
ICogdGhlIG92ZXJsYXBzIGluIHNhbWUgbm9kZS4NCj4gPiArCSAqDQo+ID4gKwkgKiBOb2RlIHdp
dGggMCBieXRlcyBtZW1vcnkgZG9lc24ndCBuZWVkIHRoaXMgZXhwYW5kc2lvbi4NCj4gPiArCSAq
Lw0KPiA+ICsJbmRfc3RhcnQgPSBzdGFydDsNCj4gPiArCW5kX2VuZCA9IGVuZDsNCj4gPiArCW5k
ID0gJm5vZGVzW25vZGVdOw0KPiA+ICsJaWYgKG5kLT5zdGFydCAhPSBuZC0+ZW5kKSB7DQo+ID4g
KwkJaWYgKG5kX3N0YXJ0ID4gbmQtPnN0YXJ0KQ0KPiA+ICsJCQluZF9zdGFydCA9IG5kLT5zdGFy
dDsNCj4gPiArDQo+ID4gKwkJaWYgKG5kX2VuZCA8IGVuZCkNCj4gDQo+IERpZCB5b3UgbWVhbiBu
ZC0+ZW5kIGhlcmUgb24gdGhlIHJpZ2h0IHNpZGUgb2YgPCA/IEJ5IGludGVudGlvbmFsbHkNCg0K
T2ghIHRoYW5rcyBmb3IgcG9pbnRpbmcgb3V0IHRoaXMgb25lISBZZXMsIHJpZ2h0IHNpZGUgc2hv
dWxkIGJlIG5kLT5lbmQuDQoNCj4gbm90IGFkZGluZyAiZGVmYXVsdDoiIGluIHRoZSBib2R5LCB5
b3UgdGhlbiBhbHNvIGFsbG93IHRoZSBjb21waWxlcg0KPiB0byBwb2ludCBvdXQgdGhhdCBhZGRp
dGlvbiBvZiBhIG5ldyBlbnVtZXJhdG9yIGFsc28gbmVlZHMgaGFuZGxpbmcNCj4gaGVyZS4NCj4g
DQoNCkRpZCB5b3UgbWVhbiwgd2UgbmVlZCB0byBhZGQgaWYgLi4uIGVsc2UgLi4uIGluIHRoaXMg
YmxvY2s/IElmIHllcywNCmlzIGl0IG9rIHRvIHVwZGF0ZSB0aGlzIGJsb2NrIGxpa2U6DQoJaWYg
KG5kLT5zdGFydCAhPSBuZC0+ZW5kKSB7DQoJCW5kX3N0YXJ0ID0gbWluKG5kX3N0YXJ0LCBuZC0+
c3RhcnQpOw0KCQluZF9lbmQgPSBtYXgobmRfZW5kLCBuZC0+ZW5kKTsNCgl9DQo/DQoNCj4gPiAr
CQkJbmRfZW5kID0gbmQtPmVuZDsNCj4gPiArCX0NCj4gPiArDQo+ID4gIAkvKiBJdCBpcyBmaW5l
IHRvIGFkZCB0aGlzIGFyZWEgdG8gdGhlIG5vZGVzIGRhdGEgaXQgd2lsbCBiZSB1c2VkDQo+IGxh
dGVyKi8NCj4gPiAtCWkgPSBjb25mbGljdGluZ19tZW1ibGtzKHN0YXJ0LCBlbmQpOw0KPiA+IC0J
aWYgKGkgPCAwKQ0KPiA+IC0JCS8qIGV2ZXJ5dGhpbmcgZmluZSAqLzsNCj4gPiAtCWVsc2UgaWYg
KG1lbWJsa19ub2RlaWRbaV0gPT0gbm9kZSkgew0KPiA+IC0JCWJvb2wgbWlzbWF0Y2ggPSAhKG1h
LT5mbGFncyAmIEFDUElfU1JBVF9NRU1fSE9UX1BMVUdHQUJMRSkgIT0NCj4gPiAtCQkgICAgICAg
ICAgICAgICAgIXRlc3RfYml0KGksIG1lbWJsa19ob3RwbHVnKTsNCj4gPiAtDQo+ID4gLQkJcHJp
bnRrKCIlc1NSQVQ6IFBYTSAldSAoJSJQUklwYWRkciItJSJQUklwYWRkciIpIG92ZXJsYXBzIHdp
dGgNCj4gaXRzZWxmICglIlBSSXBhZGRyIi0lIlBSSXBhZGRyIilcbiIsDQo+ID4gLQkJICAgICAg
IG1pc21hdGNoID8gS0VSTl9FUlIgOiBLRVJOX1dBUk5JTkcsIHB4bSwgc3RhcnQsIGVuZCwNCj4g
PiAtCQkgICAgICAgbm9kZV9tZW1ibGtfcmFuZ2VbaV0uc3RhcnQsIG5vZGVfbWVtYmxrX3Jhbmdl
W2ldLmVuZCk7DQo+ID4gLQkJaWYgKG1pc21hdGNoKSB7DQo+ID4gKwlzdGF0dXMgPSBjb25mbGlj
dGluZ19tZW1ibGtzKG5vZGUsIHN0YXJ0LCBlbmQsIG5kX3N0YXJ0LCBuZF9lbmQsICZpKTsNCj4g
PiArCWlmIChzdGF0dXMgPT0gRVJSX09WRVJMQVApIHsNCj4gDQo+IFBsZWFzZSB1c2Ugc3dpdGNo
KHN0YXR1cykgd2hlbiBjaGVja2luZyBlbnVtZXJhdGVkIHZhbHVlcy4NCj4gDQoNCk9rLCBJIHdp
bGwgZG8gaXQuDQoNCj4gPiArCQlpZiAobWVtYmxrX25vZGVpZFtpXSA9PSBub2RlKSB7DQo+ID4g
KwkJCWJvb2wgbWlzbWF0Y2ggPSAhKG1hLT5mbGFncyAmDQo+ID4gKwkJCQkJQUNQSV9TUkFUX01F
TV9IT1RfUExVR0dBQkxFKSAhPQ0KPiA+ICsJCQkgICAgICAgICAgICAgICAgIXRlc3RfYml0KGks
IG1lbWJsa19ob3RwbHVnKTsNCj4gDQo+IFN0eWxlOiBUaGUgbWlkZGxlIGxpbmUgd2FudHMgaW5k
ZW50aW5nIGJ5IHR3byBtb3JlIGNoYXJhY3RlcnMuDQo+IA0KDQpZZXMsIEkgd2lsbCBkbyBpdC4N
Cg0KPiA+ICsNCj4gPiArCQkJcHJpbnRrKCIlc1NSQVQ6IFBYTSAldSAoJSJQUklwYWRkciItJSJQ
UklwYWRkciIpDQo+IG92ZXJsYXBzIHdpdGggaXRzZWxmICglIlBSSXBhZGRyIi0lIlBSSXBhZGRy
IilcbiIsDQo+ID4gKwkJCSAgICAgICBtaXNtYXRjaCA/IEtFUk5fRVJSIDogS0VSTl9XQVJOSU5H
LCBweG0sIHN0YXJ0LA0KPiA+ICsJCQkgICAgICAgZW5kLCBub2RlX21lbWJsa19yYW5nZVtpXS5z
dGFydCwNCj4gPiArCQkJICAgICAgIG5vZGVfbWVtYmxrX3JhbmdlW2ldLmVuZCk7DQo+ID4gKwkJ
CWlmIChtaXNtYXRjaCkgew0KPiA+ICsJCQkJYmFkX3NyYXQoKTsNCj4gPiArCQkJCXJldHVybjsN
Cj4gPiArCQkJfQ0KPiA+ICsJCX0gZWxzZSB7DQo+ID4gKwkJCXByaW50ayhLRVJOX0VSUg0KPiA+
ICsJCQkgICAgICAgIlNSQVQ6IFBYTSAldSAoJSJQUklwYWRkciItJSJQUklwYWRkciIpIG92ZXJs
YXBzDQo+IHdpdGggUFhNICV1ICglIlBSSXBhZGRyIi0lIlBSSXBhZGRyIilcbiIsDQo+ID4gKwkJ
CSAgICAgICBweG0sIHN0YXJ0LCBlbmQsIG5vZGVfdG9fcHhtKG1lbWJsa19ub2RlaWRbaV0pLA0K
PiA+ICsJCQkgICAgICAgbm9kZV9tZW1ibGtfcmFuZ2VbaV0uc3RhcnQsDQo+ID4gKwkJCSAgICAg
ICBub2RlX21lbWJsa19yYW5nZVtpXS5lbmQpOw0KPiA+ICAJCQliYWRfc3JhdCgpOw0KPiA+ICAJ
CQlyZXR1cm47DQo+ID4gIAkJfQ0KPiA+IC0JfSBlbHNlIHsNCj4gPiArCX0gZWxzZSBpZiAoc3Rh
dHVzID09IEVSUl9JTlRFUkxFQVZFKSB7DQo+ID4gIAkJcHJpbnRrKEtFUk5fRVJSDQo+ID4gLQkJ
ICAgICAgICJTUkFUOiBQWE0gJXUgKCUiUFJJcGFkZHIiLSUiUFJJcGFkZHIiKSBvdmVybGFwcyB3
aXRoDQo+IFBYTSAldSAoJSJQUklwYWRkciItJSJQUklwYWRkciIpXG4iLA0KPiA+IC0JCSAgICAg
ICBweG0sIHN0YXJ0LCBlbmQsIG5vZGVfdG9fcHhtKG1lbWJsa19ub2RlaWRbaV0pLA0KPiA+ICsJ
CSAgICAgICAiU1JBVO+8miBOb2RlICV1OiAoJSJQUklwYWRkciItJSJQUklwYWRkciIpIGludGVy
bGVhdmVzDQo+IHdpdGggbm9kZSAldSBtZW1ibGsgKCUiUFJJcGFkZHIiLSUiUFJJcGFkZHIiKVxu
IiwNCj4gPiArCQkgICAgICAgbm9kZSwgbmRfc3RhcnQsIG5kX2VuZCwgbWVtYmxrX25vZGVpZFtp
XSwNCj4gDQo+IFBsZWFzZSBsb2cgcHhtIChub3Qgbm9kZSkgaGVyZSBqdXN0IGxpa2UgaXMgZG9u
ZSBpbiB0aGUgb3ZlcmxhcCBjYXNlLg0KPiBUaGUgcmVtb3RlIG5vZGUgSUQgd2lsbCB0aGVuIHJl
cXVpcmUgY29udmVydGluZyB0byBQWE0sIG9mIGNvdXJzZS4NCj4gDQoNCk9rLCB3aWxsIHVzZSBQ
WE0gaGVyZS4gQnV0IEkgaGF2ZSBxdWVzdGlvbiBmb3IgdXBjb21pbmcgY2hhbmdlcywgaWYgd2UN
Cm1vdmUgdGhpcyBwYXJ0IG9mIGNvZGUgdG8gY29tbW9uLiBBcyBkZXZpY2UgdHJlZSBOVU1BIGRv
ZXNuJ3QgaGF2ZQ0KUFhNIGNvbmNlcHQgKGV2ZW4gSSBjYW4gdXNlIGEgZmFrZSBub2RlX3RvX3B4
bSB0byBkbyAxOjEgbWFwcGluZyksIHNvDQpjYW4gd2Ugc3RpbGwgdXNlIFBYTSBoZXJlPw0KDQo+
IEphbg0KDQo=

