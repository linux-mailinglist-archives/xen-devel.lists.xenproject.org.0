Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5E5754E0D
	for <lists+xen-devel@lfdr.de>; Sun, 16 Jul 2023 11:22:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.564040.881376 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qKxw0-0006wN-FN; Sun, 16 Jul 2023 09:20:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 564040.881376; Sun, 16 Jul 2023 09:20:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qKxw0-0006tm-CN; Sun, 16 Jul 2023 09:20:56 +0000
Received: by outflank-mailman (input) for mailman id 564040;
 Sun, 16 Jul 2023 09:20:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+Zb8=DC=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1qKxvy-0006tg-VP
 for xen-devel@lists.xenproject.org; Sun, 16 Jul 2023 09:20:55 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0611.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::611])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0f170093-23ba-11ee-b239-6b7b168915f2;
 Sun, 16 Jul 2023 11:20:52 +0200 (CEST)
Received: from DU2PR04CA0018.eurprd04.prod.outlook.com (2603:10a6:10:3b::23)
 by PAXPR08MB6589.eurprd08.prod.outlook.com (2603:10a6:102:159::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.28; Sun, 16 Jul
 2023 09:20:48 +0000
Received: from DBAEUR03FT024.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:3b:cafe::16) by DU2PR04CA0018.outlook.office365.com
 (2603:10a6:10:3b::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31 via Frontend
 Transport; Sun, 16 Jul 2023 09:20:47 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT024.mail.protection.outlook.com (100.127.142.163) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6588.28 via Frontend Transport; Sun, 16 Jul 2023 09:20:47 +0000
Received: ("Tessian outbound f1e964b3a9be:v145");
 Sun, 16 Jul 2023 09:20:47 +0000
Received: from bc0ada54e362.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0FDC83B4-6430-4FEB-BD92-C76295CAF3C7.1; 
 Sun, 16 Jul 2023 09:20:36 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id bc0ada54e362.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Sun, 16 Jul 2023 09:20:36 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by GV2PR08MB8320.eurprd08.prod.outlook.com (2603:10a6:150:b5::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.28; Sun, 16 Jul
 2023 09:20:31 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::c78c:c78a:5ab9:570c]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::c78c:c78a:5ab9:570c%4]) with mapi id 15.20.6588.031; Sun, 16 Jul 2023
 09:20:31 +0000
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
X-Inumbo-ID: 0f170093-23ba-11ee-b239-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TCG6tiNKZKE6QnUD5HVuiJSmtqHSTSDCv50XvdrqgyQ=;
 b=tQxXcIEkJ7cChkRMu6KrDwTGFVcJWCubRdniYRI+dVsfo608Fwe3cHOJx5O6f4Y+74XZIJ/aPH2E0u5mvZV4mX6KK0FwHEz0EeLy8+3lNVwCl+27i06yK/SoObgKPv88xsE8rd58TyAxuYSebcGHZGr89wLLZUsJLRTIw3tgHZ0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: dde4a536feca7860
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L7P4uZa9oepihb4lHux2lnD8SsYq+XfWKlWM5OBtwOUxtjPu2GnWWFpgBNvr6qjJLfvBWvQRvDGbvF/uuoLlshhc33qOR/QfrTCAmg4Q8jfI1XYp5E2JSidZqYRwlgACgRbHO57H0gq+FFLc6Bs0sbElBniVCoczgai+7No+GhlidiBlhbREy406eb9p+L49cVJ2y9NfWHzANMDydF/NovOYlzixtCWHev4SOZMfT0di8uVeS0p7JYPQOLkKUshyNpYAyAzeP8Kf/tAEsdqecrz4I7Pgb3xYickqPy8upFhfTjcOUt7kj56zx/dAGz4jnqnlT6pKc93ziaQighvH8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TCG6tiNKZKE6QnUD5HVuiJSmtqHSTSDCv50XvdrqgyQ=;
 b=lnfNGEX/aD9ZdAY6MFHGBOMpiC+h/Qb5a857/GvbMPPcSyP7WcJ39VNZqpUgFQb/NesckYJ9ui6h6fZWI7prhPx2qDwMYUOakHrELUU4mDKKFwMIZnyIprcgme1iJeIzPK4oHYXE3WhFGdPIxYElcMz4I7l4RI/KJIgZsyNtlldHDN4Y8dVQJZZq29Gq2wAyQYmeI0CNzGsl05MZfv+TeWNyN9Z20jmoPqoaFzKvKdqv1YSq3A+TnWIuQhJeq5ulzZibxjr4VIU+B9NpjZcElfaBqHobvigRj8trYK13pjUAI0OBTujMwCMkr2+YYFF8hqYzNw0pCtXn8FjMYA9JlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TCG6tiNKZKE6QnUD5HVuiJSmtqHSTSDCv50XvdrqgyQ=;
 b=tQxXcIEkJ7cChkRMu6KrDwTGFVcJWCubRdniYRI+dVsfo608Fwe3cHOJx5O6f4Y+74XZIJ/aPH2E0u5mvZV4mX6KK0FwHEz0EeLy8+3lNVwCl+27i06yK/SoObgKPv88xsE8rd58TyAxuYSebcGHZGr89wLLZUsJLRTIw3tgHZ0=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Julien Grall <julien@xen.org>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>, Xen-devel
	<xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, "michal.orzel@amd.com" <michal.orzel@amd.com>,
	"xenia.ragiadakou@amd.com" <xenia.ragiadakou@amd.com>,
	"ayan.kumar.halder@amd.com" <ayan.kumar.halder@amd.com>,
	"consulting@bugseng.com" <consulting@bugseng.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [RFC PATCH 2/4] xen/arm64: bitops: justify uninitialized variable
 inside a macro
Thread-Topic: [RFC PATCH 2/4] xen/arm64: bitops: justify uninitialized
 variable inside a macro
Thread-Index: AQHZtkllBkKUd/6mO0+M9pyVgMwza6+5OwiAgALl4AA=
Date: Sun, 16 Jul 2023 09:20:30 +0000
Message-ID: <299D0BAE-D15E-4260-AF3E-8D84CF058083@arm.com>
References: <cover.1689329728.git.nicola.vetrini@bugseng.com>
 <d06a312944bee7457fa2ac75e0cfef20f0ec430f.1689329728.git.nicola.vetrini@bugseng.com>
 <d1ccb5e1-d122-88df-e46a-39494b6d6d12@xen.org>
In-Reply-To: <d1ccb5e1-d122-88df-e46a-39494b6d6d12@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|GV2PR08MB8320:EE_|DBAEUR03FT024:EE_|PAXPR08MB6589:EE_
X-MS-Office365-Filtering-Correlation-Id: 66966bf0-ee86-4cbc-253a-08db85ddf09f
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 H7sDDhnzSn/3uBXwmo/7P5bSVHIq1x/1TdBUCP7sd9/voEmNiPTU79bBdWXBAbNDYnINUlySImRAj1X3/5CDvmuInB1dIvNrFUoFzgSdrFupR4XRHWLMPaMCOKl4rxBXvM9gVizYO0Yn406aNYSIUUGmjzBcCQ61OcLtxw42Q3VrlZGPshYEWPlcrd8oZv2RyTBtHgE1H2lbWx25mcbULk7iExtgBEVzxcqQC5bBaAZwfeWixSlCam9TkJb2b4r7x8Vd8Ms1oGwM2KhFv/GiDgXHsbm5fRGOO7b1U0ZVDBB9QWrfcFCFM1DM2YHxt1B+BtptfRaLK0wu+naJu1VsHSDYhNFhXZNe8j8axVGVOdxFuy1nZN75QG8pKi+avopXMOyM0nxWJHxE8dsEO2LbhDYj+sGiI/wO7VomQPhrw3tz0UEMrfPaVF/51P2+2R4JnGHVOa0t0bmaa7O3xoaHdaMr2la2FhnFKVRPD6cY4oiiMTUZdXzLuKtDyWV3Yip4L8OZ0FDdzOvRFxhCQdJfDfr96i3xvVtthKcBpTqzuCjRzp5JMzJOpIsReKOS2XaZQSdl7eV5DFqNnO2OhxinNR62I6Q/vW94pVIDFEWVOp1Bu4O/Uu1+5ru5NJDMmXgNhTJ/atIsaabWODdR0W5mIQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(396003)(376002)(136003)(39860400002)(346002)(451199021)(2616005)(6486002)(6512007)(478600001)(71200400001)(6916009)(64756008)(66446008)(76116006)(66946007)(66476007)(66556008)(54906003)(53546011)(26005)(186003)(4326008)(6506007)(91956017)(8936002)(8676002)(38100700002)(122000001)(4744005)(41300700001)(5660300002)(316002)(2906002)(38070700005)(86362001)(7416002)(33656002)(36756003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <BEE60D5B182C624A976AA55AC8EED27B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8320
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT024.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0ef9483d-fa92-4639-504a-08db85dde6c9
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YRnaJsM+lB8jpOwBKwSCe0VmrYQFhPQ4+Ci0fksIDYtdTQGWRo6EzBMsoN/T2TxzOPhDN4KYnpITTpdbuBKAUFF+EVGptLSpg8JzL6Lgyru73gFaXuoMcoI+KkWLUlwR4yTDeLgOZCQ5gcfC8KGSysWv4dwH2vhgkQ+dqJn5fcIPE+xgDikSxlvsWsIK56AomUebV6MuCq1PkPjnl0CDqM7JZ4297HvXL/1mAdsPO5vQV7RShl7mrwpiqnLVc2PDrujCJtdx9/5aisRhMetu/rm0aqsz5rdMx2nAEXihAwUMNM5s2oVFZbs4aE73qhVdVTFwEbY/gD9B56BEeTefbSZc7BCw2WpaZaSUzJ+cCng1tlV8MJuLvIjhDrSFUpL3efkDraXJWrYFTJVU/sqS68+gSUnYpaLf8ncc860lS9aY2cCP5vULPE9zefZWaZ2rgs3pVkSDdFKv0XLgKURGp94zX39GNYz8wT9OgyDqGzgjuiJMGL8baUMVWtn73Re7Hbmk1VcsIXI0+Pj0XUzVp/irvzvXV2ik599JqvBvfOATmQBstt3k2AdagHIBjvwoKam6F7ZHltV9vOYSmrQmXyvqs8SakSozEAdcmfeu91qQaRjM2P3Tqzs1hEf8Eu1JaxPkFiP2hdLggA/17vzwFf3D5O5Q2V92daJg3MGtTGvcXWPdAoGpHrSytZCyUPqw81FmisIMX1w6uxeJhI/8Gg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(346002)(39860400002)(396003)(376002)(136003)(451199021)(82310400008)(36840700001)(46966006)(8676002)(6862004)(5660300002)(8936002)(316002)(41300700001)(70206006)(4326008)(70586007)(54906003)(478600001)(2906002)(4744005)(6486002)(6512007)(107886003)(53546011)(26005)(6506007)(186003)(336012)(47076005)(2616005)(40480700001)(36860700001)(81166007)(86362001)(33656002)(36756003)(356005)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2023 09:20:47.4129
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 66966bf0-ee86-4cbc-253a-08db85ddf09f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT024.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6589

DQoNCj4gT24gMTQgSnVsIDIwMjMsIGF0IDE0OjA1LCBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4u
b3JnPiB3cm90ZToNCj4gDQo+IEhpLA0KPiANCj4gT24gMTQvMDcvMjAyMyAxMjo0OSwgTmljb2xh
IFZldHJpbmkgd3JvdGU6DQo+PiBUaGUgbWFjcm8gJ3Rlc3RvcCcgZXhwYW5kcyB0byBhIGZ1bmN0
aW9uIHRoYXQgZGVjbGFyZXMgdGhlIGxvY2FsDQo+PiB2YXJpYWJsZSAnb2xkYml0Jywgd2hpY2gg
aXMgd3JpdHRlbiBiZWZvcmUgYmVpbmcgc2V0LCBidXQgaXMgc3VjaCBhDQo+PiB3YXkgdGhhdCBp
cyBub3QgYW1lbmFibGUgdG8gYXV0b21hdGljIGNoZWNraW5nLg0KPiANCj4gVGhlIGNvZGUgaXMg
cHJldHR5IHN0cmFpZ2h0Zm9yd2FyZC4gU28gSSBhbSBub3QgZW50aXJlbHkgc3VyZSB3aHkgRWNs
YWlyIGlzIG5vdCBoYXBweS4gSXMgaXQgYmVjYXVzZSB0aGUgdmFsdWUgaXMgc2V0IGJ5IGFzc2Vt
Ymx5IGNvZGU/DQoNCkhpIEp1bGllbiwNCg0KWWVzIEkgYWdyZWUgdGhhdCBpdOKAmXMgc3RyYW5n
ZSwgZG8geW91IHRoaW5rIHRoYXQgdGhhdCBpZiBhdCBsaW5lIDk3IHdlIGluaXRpYWxpemUgb2xk
Yml0IHRvIHplcm8sIGl0IHdvdWxkIHNvbHZlIHRoZSBpc3N1ZT8NCkBOaWNvbGENCg0KQ2hlZXJz
LA0KTHVjYQ0KDQo+IA0KPiBDaGVlcnMsDQo+IA0KPiAtLSANCj4gSnVsaWVuIEdyYWxsDQo+IA0K
DQo=

