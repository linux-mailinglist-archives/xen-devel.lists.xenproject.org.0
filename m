Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7716A574B06
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jul 2022 12:45:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.367463.598525 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBwKy-0004lX-7S; Thu, 14 Jul 2022 10:44:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 367463.598525; Thu, 14 Jul 2022 10:44:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBwKy-0004jg-4V; Thu, 14 Jul 2022 10:44:52 +0000
Received: by outflank-mailman (input) for mailman id 367463;
 Thu, 14 Jul 2022 10:44:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Lagp=XT=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1oBwKw-0004jV-Iu
 for xen-devel@lists.xenproject.org; Thu, 14 Jul 2022 10:44:50 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2071.outbound.protection.outlook.com [40.107.104.71])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fbe344e5-0361-11ed-924f-1f966e50362f;
 Thu, 14 Jul 2022 12:44:49 +0200 (CEST)
Received: from DB8P191CA0017.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:130::27)
 by DB6PR08MB2902.eurprd08.prod.outlook.com (2603:10a6:6:1b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.21; Thu, 14 Jul
 2022 10:44:36 +0000
Received: from DBAEUR03FT062.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:130:cafe::41) by DB8P191CA0017.outlook.office365.com
 (2603:10a6:10:130::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.12 via Frontend
 Transport; Thu, 14 Jul 2022 10:44:36 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT062.mail.protection.outlook.com (100.127.142.64) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.15 via Frontend Transport; Thu, 14 Jul 2022 10:44:35 +0000
Received: ("Tessian outbound 190453a6d737:v122");
 Thu, 14 Jul 2022 10:44:35 +0000
Received: from 04af41098621.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 717067F9-525F-4241-A0F2-3D3619AB5773.1; 
 Thu, 14 Jul 2022 10:42:57 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 04af41098621.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 14 Jul 2022 10:42:57 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM6PR08MB3975.eurprd08.prod.outlook.com (2603:10a6:20b:a7::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.25; Thu, 14 Jul
 2022 10:42:55 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a%4]) with mapi id 15.20.5417.026; Thu, 14 Jul 2022
 10:42:55 +0000
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
X-Inumbo-ID: fbe344e5-0361-11ed-924f-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=CgjWanMHvepepiBmibWibEnzK+kKCKLoV78MlGc6Jr9Be+g5y/Zjh8SwQ48tNKo6UxSmjaFVvfxjEN/CbG11elt7K2Fjyzy0TMroe23zz/nQLVN2Ml2bLt57CtWeigmx/ZUKcAID0en6/Nj0bcqrtf3htZVQCpNaZ7Pepe5xXJpdGbSb4DQc7U5640S+I1Y4wV72Vl3jOQvAQd/rFUzFjhaBEiXMc1VtNblc5gNSaR8BEIFwxIlx0i/nFFqEqI+36oi6tkeneyLtxTMTDs9O2miYRdDRhWS+E/Kke2081Z5KdWWk9QnDJN+zvt1FiF89LPGevqPZQGsG7+q3mcCuoA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wwDkF22i7Fj5EvOLNGirO00OQNWiRNo5aPZ9fHSBrJU=;
 b=nPdouDdHogT1nE9TiY6Rh9X3SJ7pZiZaz1hr04LKEVZDKTC+9FPKS0mMJ+cz1GC19tPVuGdPzW7s9ui34PL0p9Y8bT0VelNX1Re0b2Vb5xN/Nyir+PjHqikWx/QdjfiZHb0xDbyaYqLNDSeLG3eH+kstpcf8R/JrDeMA8sS8I116jpaWALBPyPofJlkE0Ccc5IK814tEilPDgfgN755Z5GhZwgOF1Pt6DmRVpmZ23IOhrvCCDvYO+s+zDmvwWqU1H5nhS40GrZM1v1Gx4cTtYxSUcda13HUdjgqUfbR7DjmklO7QUplhY59GUUGbe76BDZ5VOFGoZFE4uhh5ura1qQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wwDkF22i7Fj5EvOLNGirO00OQNWiRNo5aPZ9fHSBrJU=;
 b=v575aBanFrz/wU8A0LY4UQDQkhKDgWk6jLOM7qI4zNWxFU5uqTXYmEhK1sedFD940Y+H9uURPR6mzrZt+yjeWgWE8xdVr55SHM6/e0yX3S5942rzoQ6lw5TeAV1viJpEHzJtvlAEAj5k4l9zmg3QzPvy5JB9VhhaY3YF1XB3diw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2d22269e404014df
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GPmT2iD9EtTeewXNg9sYMynZ83EO7p/1httePV+L4J4SsE+xC3/1Qz1ouFOrOijZZb9eGYXHvN9NVCfZs8Wdx7uadSlReG+PM9I/voW6Lj9w7E2HL1BI8Y3ySj9qHsih8/nU8GZqf/FjZw6eURQyRdv1f8ixfDp7LZFmiN+q21K5tnz7GpH8jmpyvmqOw/lnNcy5PfbbCYGcYY8YkONEXzyMzVL7YLUnoHHZqssR0Cl+5b039QbwRSFj2lPNWOmbXZZ9nN6I/PZhXubPrpmhfnyXRQNXXY5D6i2db+9gKVCzwX6BDXhve2B4qVknh7PysvbdYh5QAs82YsMGDycLzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wwDkF22i7Fj5EvOLNGirO00OQNWiRNo5aPZ9fHSBrJU=;
 b=mL4r4+9UaYcZBmKTAhEOe/rOqBl9zq64Srr3v9SJCFBG0CjUQiLto6vNnkJxuyVd2ecfxdKpHRkJTjxXQ1SFZHZK5OXDyUHQy3CQ0ofRu6Bumt+wwb8YS71Grh2PDLqSDS+5gE1Sq1hMM1zsrcZ96h8ai1XkSGHKfDqx0gJ7fYrBnWLUL98p1sr9+jkbhWzeijxDDEwIv0vssI0C8rfEdFL83f1A0piweKBOVIwmpuiU4Yh8MtiIGYi8QkTq5JunE7jm8QxyHgLM4H0wNGEMirO5v+07qIr5a5KaI+x9+n1rApqWfqydu1/lvOTbcMZ27qMrzkpJEbQBlaYomG2DnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wwDkF22i7Fj5EvOLNGirO00OQNWiRNo5aPZ9fHSBrJU=;
 b=v575aBanFrz/wU8A0LY4UQDQkhKDgWk6jLOM7qI4zNWxFU5uqTXYmEhK1sedFD940Y+H9uURPR6mzrZt+yjeWgWE8xdVr55SHM6/e0yX3S5942rzoQ6lw5TeAV1viJpEHzJtvlAEAj5k4l9zmg3QzPvy5JB9VhhaY3YF1XB3diw=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>, "marc.ungeschikts@vates.fr"
	<marc.ungeschikts@vates.fr>
CC: Luca Fancellu <Luca.Fancellu@arm.com>, Mathieu Tarral
	<mathieu.tarral@protonmail.com>, Xen-users <xen-users@lists.xenproject.org>,
	Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>,
	xen-devel <xen-devel@lists.xenproject.org>, Henry Wang <Henry.Wang@arm.com>
Subject: Re: make debball fails on Ubuntu 20.04: More valid-addrs than
 all-addrs
Thread-Topic: make debball fails on Ubuntu 20.04: More valid-addrs than
 all-addrs
Thread-Index:
 AQHYlsicqOth5aGebEinuouQN8xr5618caEAgAAKCYCAAPuhAIAAJpSAgAAJHQCAAAWjAIAAAsOA
Date: Thu, 14 Jul 2022 10:42:55 +0000
Message-ID: <FFA160EC-7734-467D-B9FD-F918F98900FE@arm.com>
References:
 <okFlqhJjn071_UXGT4dzMfI03eqFRtlDcnSyS_QtHFu3vZVCdTTKkvZS1ApPFXEN65mcnhOc2g-9HjZmTGYMyV1OOzrv_PkCzdo4KNKICf4=@protonmail.com>
 <5952497A-CB6F-4C66-8FA9-8EF9A1A08B5E@arm.com>
 <9gC8biTj2pIJoXJRy4N2I6nsOUEUjYsbIAj0XZsWdAwiwzXpgBBeBrLFB0bAC7LjVmKwPvzufWHPSVYaWuMl33lKHKbzChEgW4R9QBwJZJk=@protonmail.com>
 <F18A101C-ED4C-44DA-AB2C-15E79620A692@arm.com>
 <13TmiNmQ9iXXKyshVeCbt4ul_jYjdNejXrqhIJK7CioLQRgpSITJX1Ik0jNEZZDTUIXs9OvM0qjZJeqRhQl1oKU9IdiZ3W-Ajsqp3sYgt6Y=@protonmail.com>
 <F1773D90-2760-4098-BF08-4D4125D349DF@arm.com>
 <a3de7469-9b75-ea19-4ce7-ce80e737806f@citrix.com>
In-Reply-To: <a3de7469-9b75-ea19-4ce7-ce80e737806f@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 1629ced1-ccd4-4c5a-6807-08da6585d844
x-ms-traffictypediagnostic:
	AM6PR08MB3975:EE_|DBAEUR03FT062:EE_|DB6PR08MB2902:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?V3ZoTUx6dElKUDZKZi9xaXpnLzB3UVRmTkJtdkk3MExQME5PeEQ2QXozT1Rj?=
 =?utf-8?B?L2pmQUNpREoyYmtpR0pPMEJQclY3WUpJU3RDV0d2R2dHZlpaNjZVZ3ZNOW5i?=
 =?utf-8?B?YVlrVUZEOWRxUUdTcVFGT2xkZXNrM0pBMkJpYkpJS3FnNWhmUW5GdENIVURi?=
 =?utf-8?B?aitDUHpuQ1MzWlpBa1oyL0M2a2tNU3hoTHV6ejVBbW5YRERsQWhTOEpLNjF0?=
 =?utf-8?B?Sk1KT2tkeDFJTUhIUmloMm9Da0hPd0tGNURXUmx0S3FOcnJOUVZYaHhOaSsr?=
 =?utf-8?B?akdBK0dnQ0F3WFFxOFo4MU80U3dPMVRaRG9ST3NQQlVHTE1JQ1pNQVBWazZP?=
 =?utf-8?B?TnBkcU1KdU50TVJVOTFWak9sdTJYczZSOVdlVHduanBvUUtyZmRWMnFnWUhi?=
 =?utf-8?B?Vy9YVmlhMWQ4SGRJMFhoN3d0K0ZhdDZqUm9lNXQxdUZrb3VEVzZEZlNPMzRQ?=
 =?utf-8?B?VWtzWDltMzhzT28wbE9OWmxSbUx6TEZSak5HY0p4dWpRTDFhNXB5czgvTkNr?=
 =?utf-8?B?OXZJSzVtSkV5RUpmbHNsaGxaRVhkd0R5S1lVSWRxRGZTZDFhU2s4aXM4bXF3?=
 =?utf-8?B?aDdtWjdCNi9tdE90ZDJ6OFNyaFpuS1RjQ1R5clEyb2dXbVMvUnhENktQN2Rr?=
 =?utf-8?B?ejNIdnBlYUNRaGlsZno1VXBRYWJGTEZQUGlFS0xHdjhoUHlJaDZJZUI2ZWtK?=
 =?utf-8?B?NXJaUEJBL2JnbU9QNitUWHU1NS9ocXJzSjBnVmhSNUU1MXlpSFdEcW9EQXJN?=
 =?utf-8?B?dk9OZmQ0dUVxK2xUZVRYRjlKVVdYeFZJY1lqQy82azZ1M1h2b0lVdmtzTDZy?=
 =?utf-8?B?diswcHhtWXFTc2FHREt3VEFHR0RSdGw0Q0l2WnRmQ1RxVm1zTkZTOWUvbTJj?=
 =?utf-8?B?dkRwRVE3SzM2d0dHdFZyTG0wSldiUHNmSGpSU0RjaGI2a2xwSTh6Z3pWMFJk?=
 =?utf-8?B?a2hRdFBnK1NXVDlMWk44SW82ejd2a0djK2VSelVFTFpKVWs5cUdpaFFCaDM3?=
 =?utf-8?B?U2RJSnFDUmxqT0xiWVlSVXpjOWUxZWRiL1JCTFBtOGlIOFlZakZ5cXlWOXJW?=
 =?utf-8?B?MEJ6clI0ckNSM3hDUDhIaWZQNFhEK3BuVGJLSWVqNFV3cjdNQ3RrYUJKUXNt?=
 =?utf-8?B?NWJFUk9XU29jUUd3cW4yK3M4MEJaYi83WHRUNkxaZnprWVU0dlB1SlJLNE4z?=
 =?utf-8?B?S0R1YXZob3k4R3d3TmQ5OUtGUXhQL1FzU0VCVGlIL3pTYzlHZXlzdjJSRHVW?=
 =?utf-8?Q?A1TGOn6SIdt6dCZ?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(39860400002)(396003)(366004)(346002)(376002)(8676002)(66476007)(6486002)(66446008)(316002)(64756008)(4326008)(66946007)(71200400001)(478600001)(8936002)(91956017)(66556008)(2906002)(5660300002)(76116006)(110136005)(54906003)(966005)(83380400001)(86362001)(36756003)(41300700001)(122000001)(33656002)(38100700002)(2616005)(53546011)(26005)(38070700005)(6506007)(6512007)(186003)(547064002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <C044F7CD16BEF14D965A8472C7949068@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3975
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7f1a50e0-f8c3-484f-85ca-08da65859c93
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/gGOi72Jf10pRklcdA01H19w85YRtzsD4+1Bc4NNCGwX/L3dVNYaoGCqODe1Cy+40FOKXcsek8BeVdmqhRQ+l6vKnDR0J1xb29ys1RSQF65iOQoyduDkRE+Dmk8W0pkN+L/gP40X0+E1iVhXBTPbIXKxNwMv0HtY6iz/etx+V2FavcvH9sNhevmoDx10SOU+rt7jgLlKmPuf0vuRi8UnFzLI9wxyOVeV3c6/IYt/TSXKHxuFbwXQ6AXulQdPCc0BBAgss0kEsYGpCysIkYvJKtmJjNKvMVJOgOu5g9nXtYp8e90R0XYothEDLzeM/YBYrZ3zpH5GTyyatBytBpcBo2agVgh0JQkWjPTAESqFaU5C32BqA/WdCp8vd/biu79gBUHlAtZDQVWCLwYvjcndbX9X2BFzpJpgkqHR10c9BbTLoB1zaXg8wdf6RB1+shjUiLjekg2jZc0lwTV+DAQkAjUwd52toyJSneomgZBW1U+UtLVhRan3OyJVluoBeSEs7fXfL5bRBb5HWuVlhiYaOrCotyWX/IAJ1+Z6a9f1EchBbTYRIF9u8aoW45y8aVn36hjDoZDEJwmR65c1f54uXSnxfgS3mBjrlPCruTLH+moMoxIjpUbZbTF/jkPMfOMx7/dKbl24nQiVGY6qlOsk/lXww366dJ780cy9GwaXhlemUmqCQGNsutRDeKMfQb6eNaHAKBfGGpKUlXxRCQlQcZoiZ31y//EDddXFzoXIhUimQml3iVIED6aWIp9Tqy7Z9wpCI6nV+tz4+PY+Nrj0e8GaWltCU+FjgI8mFhsb5s2MC+60JsTLnBgFh7YA4yFI8TW0HZ+fUri7FGP708q7y6k/jWfgt3j71SkQc/zLCkwOXTc1M1VMUYk5nXBq2nCaP1TdCs0zJ6Ryvj34ivs7zMW6K1DJDKSo45g1Fgscvaw=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(346002)(376002)(39860400002)(136003)(396003)(36840700001)(46966006)(40470700004)(186003)(86362001)(82310400005)(70206006)(70586007)(36860700001)(316002)(8676002)(450100002)(336012)(26005)(47076005)(83380400001)(6486002)(5660300002)(4326008)(966005)(33656002)(6512007)(40460700003)(54906003)(82740400003)(81166007)(478600001)(41300700001)(2906002)(53546011)(8936002)(40480700001)(36756003)(356005)(110136005)(6506007)(2616005)(547064002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2022 10:44:35.9607
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1629ced1-ccd4-4c5a-6807-08da6585d844
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR08MB2902

DQoNCj4gT24gMTQgSnVsIDIwMjIsIGF0IDExOjMzLCBBbmRyZXcgQ29vcGVyIDxBbmRyZXcuQ29v
cGVyM0BjaXRyaXguY29tPiB3cm90ZToNCj4gDQo+IE9uIDE0LzA3LzIwMjIgMTE6MTIsIEx1Y2Eg
RmFuY2VsbHUgd3JvdGU6DQo+PiArIENDIHg4NiBtYWludGFpbmVycw0KPj4gDQo+Pj4gT24gMTQg
SnVsIDIwMjIsIGF0IDEwOjQwLCBNYXRoaWV1IFRhcnJhbCA8bWF0aGlldS50YXJyYWxAcHJvdG9u
bWFpbC5jb20+IHdyb3RlOg0KPj4+IA0KPj4+IEhpIEx1Y2EsDQo+Pj4gDQo+Pj4+IEhpIE1hdGhp
ZXUsDQo+Pj4+IA0KPj4+PiBZb3UgYXJlIG1pc3Npbmcgd2dldCBpbiB5b3VyIHBhY2thZ2VzLg0K
Pj4+IEluZGVlZCwgaW5zdGFsbGluZyB3Z2V0IHNvbHZlZCB0aGUgaXNzdWUgYW5kIEkgd2FzIGFi
bGUgdG8gZ2VuZXJhdGUNCj4+PiBhIGRlYmlhbiBwYWNrYWdlLg0KPj4+IA0KPj4+IFN0aWxsLCB3
ZSBoYXZlIGEgYnVpbGQgc3lzdGVtIHRoYXQgc2lsZW50bHkgZGVwZW5kcyBvbiBnYXdrIGFuZCB3
Z2V0LCBhbmQgdGhlcmUgaXMgbm8gY2hlY2sgaW4gdGhlIGNvbmZpZ3VyZSBzY3JpcHQgdG8gZW5z
dXJlIHRoZXNlIHRvb2xzIGFyZSBpbnN0YWxsZWQuDQo+Pj4gDQo+Pj4gQW5kIHRoZSBlcnJvcnMg
aW4gdGhlIGJ1aWxkIHN5c3RlbSBhcmUgcXVpdGUgb2JzY3VyZSwgaXQncyBoYXJkIHRvIHVuZGVy
c3RhbmQgdGhhdCB5b3Ugd2VyZSBtaXNzaW5nIGdhd2sgb3Igd2dldCBpbiB0aGUgZmlyc3QgcGxh
Y2UuDQo+Pj4gDQo+Pj4gV2hhdCBkbyB5b3UgdGhpbmsgYWJvdXQgdGhpcyA/DQo+PiBIaSBNYXRo
aWV1LA0KPj4gDQo+PiBJ4oCZdmUgQ0MgdGhlIHg4NiBtYWludGFpbmVyLCBwcm9iYWJseSB0aGV5
IGtub3cgYmV0dGVyIHRoZSByZWFzb25zLg0KPiANCj4gVGhlc2UgYXJlIHR3byBkaWZmZXJlbnQg
cHJvYmxlbXMuDQo+IA0KPiBUaGUgY29uZmlndXJlIHNjcmlwdCBkb2VzIGNoZWNrIGZvciBXR0VU
IChvciBtb3JlIGdlbmVyYWxseSBGRVRDSEVSKSBhbmQNCj4gd2lsbCBvYmplY3QgaWYgc29tZXRo
aW5nIGlzIG5vdCBwcmVzZW50LiAgVGhpcyBpcyBvbmx5IHJlbGV2YW50IGZvcg0KPiB0b29scy8g
d2hpY2ggeW91IHNob3VsZCBoYXZlIGJlZW4gZm9yY2VkIHRvIHJ1biBjb25maWd1cmUgZm9yIGFu
eXdheSwgc28NCj4gSSdtIHJlYWxseSBub3Qgc3VyZSB3aGF0IHdlbnQgb24gdGhlcmUuDQo+IA0K
PiBGb3IgdmFsaWQtYWRkcnMgdnMgYWxsLWFkZHJzLCB0aGF0J3MgY29tZSB1cCBvbiB4ZW4tZGV2
ZWwgYmVmb3JlLiAgSQ0KPiB0aGluayB0aGUgZ2VuZXJhbCBjb25zZW5zdXMgaXMgdGhhdCB3ZSBk
b24ndCB3YW50IHRvIHNpbGVudGx5IGRlcGVuZCBvbg0KPiBnYXdrLg0KPiANCj4gKFdlJ3JlIHRy
eWluZyBzb21lIG5ldyBwcm9qZWN0IG1hbmFnZW1lbnQgdG9vbHMuKSBDYW4geW91IHRyeSBvcGVu
aW5nIGENCj4gYnVnIGhlcmU6IGh0dHBzOi8vZ2l0bGFiLmNvbS94ZW4tcHJvamVjdC94ZW4vLS9p
c3N1ZXMgYWJvdXQgdGhlDQo+IGNoZWNrLWVuZGJyLnNoIGlzc3VlPw0KDQpodHRwczovL2dpdGxh
Yi5jb20veGVuLXByb2plY3QveGVuLy0vaXNzdWVzLzI2DQoNClBsZWFzZSBjb21wbGV0ZSBpZiBu
ZWVkZWQuDQoNCkBtYXJjOiBXZSBoYXZlIGEgZmlyc3QgZXhhbXBsZSBvZiBzb21ldGhpbmcgdG8g
YmUgdXNlZCBhcyBhIHBvdGVudGlhbCByZWxlYXNlDQpibG9ja2VyLiBBbHNvIHRoZSB0ZW1wbGF0
ZSBpcyBxdWl0ZSBleHRlbnNpdmUgYW5kIGhhcmQgdG8gZmlsbCwgd2UgbWlnaHQgd2FudCB0byBz
aW1wbGlmeSBpdC4NCg0KQ2hlZXJzDQpCZXJ0cmFuZCANCg0KPiANCj4gVGhpcyBvdWdodCB0byBi
ZSBhIDQuMTcgcmVsZWFzZSBibG9ja2VyIHNlZWluZyBhcyBpdHMgYSByZWdyZXNzaW9uIGZyb20N
Cj4gNC4xNi4gIChDQydpbmcgSGVucnkgYXMgcmVsZWFzZSBtYW5hZ2VyLikNCj4gDQo+IH5BbmRy
ZXcNCg0K

