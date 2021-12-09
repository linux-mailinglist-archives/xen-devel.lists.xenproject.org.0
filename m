Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD1B46E67B
	for <lists+xen-devel@lfdr.de>; Thu,  9 Dec 2021 11:19:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.242877.420020 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvGVz-0001CL-Aq; Thu, 09 Dec 2021 10:19:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 242877.420020; Thu, 09 Dec 2021 10:19:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvGVz-00019C-79; Thu, 09 Dec 2021 10:19:03 +0000
Received: by outflank-mailman (input) for mailman id 242877;
 Thu, 09 Dec 2021 10:19:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i/Bx=Q2=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1mvGVw-00018z-QQ
 for xen-devel@lists.xenproject.org; Thu, 09 Dec 2021 10:19:00 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0625.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::625])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6beffbee-58d9-11ec-a831-37629979565c;
 Thu, 09 Dec 2021 11:18:59 +0100 (CET)
Received: from DB6PR07CA0004.eurprd07.prod.outlook.com (2603:10a6:6:2d::14) by
 AM9PR08MB6641.eurprd08.prod.outlook.com (2603:10a6:20b:306::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.10; Thu, 9 Dec 2021 10:18:55 +0000
Received: from DB5EUR03FT046.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:2d:cafe::15) by DB6PR07CA0004.outlook.office365.com
 (2603:10a6:6:2d::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.12 via Frontend
 Transport; Thu, 9 Dec 2021 10:18:55 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT046.mail.protection.outlook.com (10.152.21.230) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4778.12 via Frontend Transport; Thu, 9 Dec 2021 10:18:55 +0000
Received: ("Tessian outbound a33f292be81b:v110");
 Thu, 09 Dec 2021 10:18:55 +0000
Received: from f2bde170992b.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F4A7BDE3-19EF-45F0-82FF-23D4E314EB9C.1; 
 Thu, 09 Dec 2021 10:18:37 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f2bde170992b.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 09 Dec 2021 10:18:37 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com (2603:10a6:20b:39e::10)
 by AM6PR08MB4968.eurprd08.prod.outlook.com (2603:10a6:20b:e2::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Thu, 9 Dec
 2021 10:18:35 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::8851:be59:208:265e]) by AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::8851:be59:208:265e%6]) with mapi id 15.20.4734.024; Thu, 9 Dec 2021
 10:18:35 +0000
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
X-Inumbo-ID: 6beffbee-58d9-11ec-a831-37629979565c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fnsiNX87ajLgfh6tqi80Bzu92jKM8w5R3UugHDcNgJ8=;
 b=nXEqYUZNsjnowV3UzVT1NwMLUXMPsj+/+dFOzKFapElKIbx9lDG9vwFQ7yoSzzvP1pmYf+8tSpoFTjRd2w51B1a2q+/hhL5tT68QdVGF30wwz5+dNhFwrkWQkxICwia+oUWfi/qWxjn2RIV6Pqs3y63etXdfd93cIDUTJYulw1w=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0a9f50c91b3b225e
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ilntKihMDRZZBQpt7wko8V8L/oZ700JJf8MVsYVWCtgRUZIkIH53oWsVSQcUp9lSvxrV8zSTBlvne8nZH1feVqy96Knjd3HVcDZfrG+RChBcYu9M2R6nLlJpvzAHg8Cy9AVs5fvma4hGmbRB06wrYtHODVH+ck2hKyjZing95AWXZMKTgQdo2wWBOwTcwebWF7pZhbOlr94JGTLQTcWGPVxI1/wVNMoIQUCU+WYtI3sfQDHy3DM9B0okWKCfHoOIre1h7yk/royyV8cc1Oqjwr0mpaOQXb0eam5XiNLxOZIFejGPUga0YzHBx9PRyHZ6QQjd1mg9Wfn8xO2bRn7kXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fnsiNX87ajLgfh6tqi80Bzu92jKM8w5R3UugHDcNgJ8=;
 b=UEETZ1JuF2rfktw7wMz/45y8Vs1mdKxU3HOasi9GEE4kTu9zLWRueZOisqRomf5J5UA2SA3s+hJKrQiEQkbJsV0PbEHlYk2nZRY4wV/onVzbml7UM3HZG83+QU6wLTY7tQMn0NhUPDBTT9XpnYq+EYr0EKU/WB6CA92d7oQsXUf9pVsmIWife0M/YSM5r2eSuH0TZXkDAoH59g2QdyNqQTbJ17+5ZMUgVy5S/jZK9NriQQHo+Pbju2+OXUxhIxhWLIsjYO2qp+RL0VnZiezpE+VZdipipBKkg7WxAHiq+OmbWYGVSpnp79nkoblaip6g08l9bxc9v8+5brX0d/Yamw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fnsiNX87ajLgfh6tqi80Bzu92jKM8w5R3UugHDcNgJ8=;
 b=nXEqYUZNsjnowV3UzVT1NwMLUXMPsj+/+dFOzKFapElKIbx9lDG9vwFQ7yoSzzvP1pmYf+8tSpoFTjRd2w51B1a2q+/hhL5tT68QdVGF30wwz5+dNhFwrkWQkxICwia+oUWfi/qWxjn2RIV6Pqs3y63etXdfd93cIDUTJYulw1w=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Oleksandr Andrushchenko <andr2000@gmail.com>
CC: xen-devel <xen-devel@lists.xenproject.org>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, "oleksandr_tyshchenko@epam.com"
	<oleksandr_tyshchenko@epam.com>, "volodymyr_babchuk@epam.com"
	<volodymyr_babchuk@epam.com>, "artem_mygaiev@epam.com"
	<artem_mygaiev@epam.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: Re: [PATCH v8 2/4] xen/arm: setup MMIO range trap handlers for
 hardware domain
Thread-Topic: [PATCH v8 2/4] xen/arm: setup MMIO range trap handlers for
 hardware domain
Thread-Index: AQHX7M6C5/TVkloENUKtLtY2iMOfH6wp8qEA
Date: Thu, 9 Dec 2021 10:18:35 +0000
Message-ID: <B1713D3D-77E8-44A1-9AC3-D754269DE50C@arm.com>
References: <20211209072918.460902-1-andr2000@gmail.com>
 <20211209072918.460902-3-andr2000@gmail.com>
In-Reply-To: <20211209072918.460902-3-andr2000@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 32df948d-e2c3-4f18-28d7-08d9bafd4e6b
x-ms-traffictypediagnostic: AM6PR08MB4968:EE_|DB5EUR03FT046:EE_|AM9PR08MB6641:
X-Microsoft-Antispam-PRVS:
	<AM9PR08MB66411108805AB984BD72991CFC709@AM9PR08MB6641.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:7219;OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 fUd7gSBRpOfwRjpGrt7x406NdiDErTHq61drZ5t+yaFAbEcnQMWpKEuXKYfeYA3WibU5xd7nKPP1+y6M+1fNKbXxM2J1k4iyhPIbaBAurj1bBfXZmIQXrKKwxfQysqhk6JY2dflpuzV/kqGwQDCf2FhJx1xTfEFBC7Yyy9PqFJCus/SdYLUDHOlA/nOKAu3ChU4AufziNBpqCpKjP/FtsCXGYabVFcCtfbEwmZPFyDg5ZC+ipHyS+/ZRX1CzHIf1d+LNNkT5gMGxoU+Rqp2sX6pA2plZyORVtVYoz623odmna+UgPolFr1IL/7cqN3hYuFhIagm244Yz4Tx5NfpyN9VJNPxR699qIdoUE4JBVLnQs41SgbAuhc6JFfWJIloeLKHwE8TVF9WNsTYeYZydOpGYJPWAPEFQFu4f34ezXVUzfxjyFzLXTUKOQX+qkQ3/jQsPcYdBFQGo+jYD3PWc+s213JgvYxTmPDHvDYEDR+0LdRnRcz3Bt26JpMB2+UFI01p7seHmUFrM3h5u5a6wtFaQ+QyO3WrH8ehe/18vFP7ljQe0pMmW7B6BQ/0UM4yK1j8+iM3cH+9zWxnAdCQ7AzyB0tfVO1AKJ5/+G9DGYyUgU4aFwofvZFZUQ3q9nuJ92j4YveKch2aKc7nDlJb2N42ws+U/KhEAVoT6Y6KcI1DxgQStTLIFEtVOdZHhnaDU9xpkpIWKaV8lJeUjUtnIeTvEKoCpYd3/nvpWkaLuqn0QPTvYwy3ConHJ1Jg54DEb
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB6919.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(316002)(2906002)(54906003)(508600001)(4744005)(6506007)(33656002)(122000001)(83380400001)(86362001)(8676002)(8936002)(66556008)(64756008)(66476007)(66446008)(71200400001)(91956017)(4326008)(53546011)(76116006)(2616005)(6916009)(38070700005)(5660300002)(6486002)(186003)(26005)(38100700002)(36756003)(6512007)(66946007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <D3B6DAE15D9C0547B46328161C028567@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4968
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	97a0f300-7488-48bb-8cab-08d9bafd42a4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SgFoH6jeUgzLfNiah5JWkxC3wjdy2mvNZFkUMAWkyJ7x+veq2TMpnTSLUXz7mnuHjKGrG0l8X7PLu4W5ujMkoNOsDbKaU7hO7b29wypqzROiO0pwTbzSnSU/pTvomeza6GZvdACmk6hLT/ABpzK/cQMK5Ml9KfIcj5fzOQs3GmSOkKjH6vwuiqoQl0Rj/TjGD3xseNXmnno/1cmj0Q/alj3L1tkX0rrDnPotWSmgn1IBVf7h3vPfxvwZuE+2WdE2l/HNdVSI+TF1lOkREhNC4IC/WRUg5vYfGmuiNuxCM5c1wYXxDUiqEV1TtQybvTrZBpt1rzbU8PQMfhrFnhZpHP+SywS+A4YkeKGQVmKaR0RfLLim9pvKKjR5EpxGyXecg1B2whIydEriM1AObNjKzUvRgIxH8cC7nBW9k3fO4/BA1qIPTa/oWuJJsuZksH6xs7w7TwrvOnQJo5CylTMO+r6iCt3lfX8if+hCQAQwiphM7L0hZAwk7rnVB4Wjm6rO0p1JmfefI4FwIfFTbNhXjh/ZLdz9Qkghop6wQkLY9gGBLdjSgtwZWMnoKnE7oEyaqQdeieRTJypoILBx9gjk/bwQ2rBV9eotDVvGnTZAIExvu1qKwRpqsZeV7WCocAf87gr87npN7MxSYxERP/63Zjpm7V5XnqOhzYgvqNQYFxgtfy9LYFqsBq2ph0Rwg0ygy89j4Vicqu25hpN8NaaWbq6Qk7/Ya/8d+LGg0fetsw8tebE0zhf/mwKwJ8S4LReinGk63uwUCNFBh3KbRwyq0A==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(40470700001)(26005)(336012)(4744005)(5660300002)(4326008)(86362001)(54906003)(6506007)(2906002)(81166007)(36860700001)(33656002)(40460700001)(47076005)(107886003)(83380400001)(70206006)(356005)(6512007)(508600001)(316002)(8676002)(2616005)(82310400004)(70586007)(6486002)(53546011)(6862004)(8936002)(36756003)(186003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2021 10:18:55.4693
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 32df948d-e2c3-4f18-28d7-08d9bafd4e6b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6641

Hi Oleksandr,

> On 9 Dec 2021, at 7:29 am, Oleksandr Andrushchenko <andr2000@gmail.com> w=
rote:
>=20
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>=20
> In order for vPCI to work it needs to maintain guest and hardware
> domain's views of the configuration space. For example, BARs and
> COMMAND registers require emulation for guests and the guest view
> of the registers needs to be in sync with the real contents of the
> relevant registers. For that ECAM address space needs to also be
> trapped for the hardware domain, so we need to implement PCI host
> bridge specific callbacks to properly setup MMIO handlers for those
> ranges depending on particular host bridge implementation.
>=20
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Reviewed-by: Rahul Singh <rahul.singh@arm.com>
Tested-by: Rahul Singh <rahul.singh@arm.com>

Regards,
Rahul

