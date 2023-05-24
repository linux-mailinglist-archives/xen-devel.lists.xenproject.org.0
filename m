Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F96F70F2A6
	for <lists+xen-devel@lfdr.de>; Wed, 24 May 2023 11:24:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.538911.839279 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1kit-00052D-6T; Wed, 24 May 2023 09:23:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 538911.839279; Wed, 24 May 2023 09:23:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1kit-0004zk-2e; Wed, 24 May 2023 09:23:59 +0000
Received: by outflank-mailman (input) for mailman id 538911;
 Wed, 24 May 2023 09:23:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VEVP=BN=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1q1kir-0004ze-6u
 for xen-devel@lists.xenproject.org; Wed, 24 May 2023 09:23:57 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20627.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::627])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b43a3f79-fa14-11ed-b22f-6b7b168915f2;
 Wed, 24 May 2023 11:23:55 +0200 (CEST)
Received: from DU2PR04CA0020.eurprd04.prod.outlook.com (2603:10a6:10:3b::25)
 by AS2PR08MB9125.eurprd08.prod.outlook.com (2603:10a6:20b:5e5::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15; Wed, 24 May
 2023 09:23:51 +0000
Received: from DBAEUR03FT016.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:3b:cafe::f9) by DU2PR04CA0020.outlook.office365.com
 (2603:10a6:10:3b::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15 via Frontend
 Transport; Wed, 24 May 2023 09:23:50 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT016.mail.protection.outlook.com (100.127.142.204) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6433.15 via Frontend Transport; Wed, 24 May 2023 09:23:50 +0000
Received: ("Tessian outbound 3570909035da:v136");
 Wed, 24 May 2023 09:23:50 +0000
Received: from f7e971803245.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 58F759A5-6B55-42E8-9CD1-DB34678A2609.1; 
 Wed, 24 May 2023 09:23:43 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f7e971803245.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 24 May 2023 09:23:43 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AS2PR08MB9221.eurprd08.prod.outlook.com (2603:10a6:20b:59f::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.29; Wed, 24 May
 2023 09:23:41 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::5e17:39a6:eec7:c482]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::5e17:39a6:eec7:c482%4]) with mapi id 15.20.6433.015; Wed, 24 May 2023
 09:23:40 +0000
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
X-Inumbo-ID: b43a3f79-fa14-11ed-b22f-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aWazh+9nbq7/LJc2LuqEiBu97kDOqNZYQHm76r3j/jU=;
 b=VLU63AnHR3ZoPXeLFoHuZYNLktx20+1bqCIqr90Nr8RB79Z1ApCjv48BFBAd/i7wLGWDNF20Vip4ItzzaBTmxmzGVSyD8dm0suj+1RhHNo4l5d20gmnBz5m+IQRF7M7immHI0COHerQ3uWMgzDLRilBEilTTOrE2DM8OpG5bP+U=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 71be40462b8243ff
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ei82EH1GYOi+/D1e2B7UyLaTijBkH5U0Vx6mr/URZ1BTOgsQwc0BFaqf0vE+sHHG642fwOWwbymI/3XkEUcY6Dks0wTIOIu+CCKAw1v88f7mp5srWfAh2QaM8/oIWxi5AIrtXNDJlK0fT6VIXbywhzH8Cd1TevW7IGzjMHzrqboXtaUeWIPgAt9y5RRNNZZCCu4O5R90Vexx8hlN9zlnJN7vKn7Lt6cKIBPaJF/NimiMP3gwxjKM13c/G5JJVOhk5r/Qua7LmYJXwn/f++wexd+2znKz6WPvVukKkcSYLyWtRJy9wv2+4+c8DiJa/g3+E1O7aBqhWodZzYDM6RbO4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aWazh+9nbq7/LJc2LuqEiBu97kDOqNZYQHm76r3j/jU=;
 b=aokwgMI8Ob2s8u+x+4rV03j0G0RrtCG8h1/Vk9q7yTViG6yNNcpKdVYBo+0738Hee+4xxGQpSTet1/31DzLPsDWG+Iq73RqUcv5h8lsazmnVAOaRivDofS5KPuv35gfG/LbIPm+qHB41tCZFOc5sctFYfSy+cIWg6hBVf2lnzs0+vf2kFMfNZroiiTttMgqadyG0p9Y6Yhx3WJ2mFEwURaw7kTS9cXcD8drrVDk5sUOmDYpCduHPhyiKCLDaVsDuXAiHUJc6i1ypa2EZfPAbW6hkmDK4RmEXs67k6TfcRlNNZfzGNgcI7T8uOLujSUmdAZOgoIMLJNp0CjeTNmQqXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aWazh+9nbq7/LJc2LuqEiBu97kDOqNZYQHm76r3j/jU=;
 b=VLU63AnHR3ZoPXeLFoHuZYNLktx20+1bqCIqr90Nr8RB79Z1ApCjv48BFBAd/i7wLGWDNF20Vip4ItzzaBTmxmzGVSyD8dm0suj+1RhHNo4l5d20gmnBz5m+IQRF7M7immHI0COHerQ3uWMgzDLRilBEilTTOrE2DM8OpG5bP+U=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Luca Fancellu <Luca.Fancellu@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v7 02/12] xen/arm: add SVE vector length field to the
 domain
Thread-Topic: [PATCH v7 02/12] xen/arm: add SVE vector length field to the
 domain
Thread-Index: AQHZjUpOjVckXKVhKUe5W06SOMG/nq9pKDiA
Date: Wed, 24 May 2023 09:23:40 +0000
Message-ID: <0052F4DC-79EF-47BF-968E-B3E42F7900D0@arm.com>
References: <20230523074326.3035745-1-luca.fancellu@arm.com>
 <20230523074326.3035745-3-luca.fancellu@arm.com>
In-Reply-To: <20230523074326.3035745-3-luca.fancellu@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|AS2PR08MB9221:EE_|DBAEUR03FT016:EE_|AS2PR08MB9125:EE_
X-MS-Office365-Filtering-Correlation-Id: 3faaa439-2511-489c-56b0-08db5c3895d0
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 aiT2SjJUqgPbLQz12Kl52vW3FY+9j4vF/fnnuX3ABACm4cDsdXShU4qzu3BKjoe5k6PSPg8cCklYCb41AwLdkGwu+hVfeEF37/zshK1LjVTDLk78p3lcB9CY1VWT6EDN7yY1ijovS2P3azUdi9MJGMBNl3cmR5sJbgKE3jXo2RyBYdgcAJlSAYqkL0+0WDFeQ/NjRNyjwKtxkL1uUdtikjB9CzzOhtKY1vUbClBjDxLO/p7WYMROsMR6gLlUiil87tXvcjMEkF8Aq5SihXQZDQBykY3dGOS9erxvCfcCVJuMfuWVpHcTDsKj9LSwunD5tju2gxSHvH9k2ao6tMykU7ZCJKCzB82GgK6Hu/N/m4o1cObewEs1ynYXLzrIl5CHovAn+zf5dxqaw6NH43FfW1F5+4Hhu9VevN3HqGbpiMOogRjFfYrgXiuRCl3GtrqZPOLNRT1n5bbmWnet/HQuWGJxwoL5dlSPCmk3+XxNtGU/wZtYMCeCmeTMXCieaXNLVciB6ZoZz3/uEvFmtScc5PtHmKcuRlYtAb0F4QAoncoOJHZ8s1bZ0ePOKSOU1ZClfEjDkJJmnyzZOgaPM6nwDNd1haxMZbKwPF1gDJ3y4Qv4pqJMMkaDsYl9Gct11lsowh3bqlV6x+I9oY4WU+vzpg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(136003)(39860400002)(346002)(376002)(451199021)(478600001)(66476007)(66446008)(66946007)(64756008)(66556008)(6636002)(76116006)(4326008)(91956017)(6486002)(41300700001)(37006003)(316002)(54906003)(71200400001)(5660300002)(8936002)(6862004)(8676002)(38070700005)(86362001)(38100700002)(122000001)(26005)(6506007)(6512007)(33656002)(186003)(53546011)(83380400001)(2906002)(4744005)(2616005)(36756003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2F14255A2B6B13478AF45DEFA7EBDFBB@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9221
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6a970f28-8c25-4c05-954d-08db5c388ff1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qWRTTtg5g7XeT5YhclwtD2ggMDO9eABiyQobJ4DqAeTY6uWJ0L6RwZwDDmy0hAc3Z9yOx1ZDTEUZE2kds84SxMxz2k8CjemFA8WE8YgMPFf+qTJmNLV/3tJLNB1qx0RvJd9lqPF39feUKC+0hopK0/yv/2FyvA3mnqpOEBa0IENs15+YAaJTWyNs0gxxt2RHf1mys2cqS5KBwgNK9gN/8Y6S88gLadrJb8fi8KKQBuOD3FH/c5JRyTjLj8Bw70jfIMkPPWvSGFC3H7yfV13RVZih8hkEKqy0blRTiE8+YtqmRG5fYZCI/vIY2ycMz6hn+NRO9eu9yhfHCJtBo4xpku8e8vZhwPqt1lWVjqxzkMBCCQBaT2bBtw9adjpLz2BpyZLYVxhmPAwwW3EKOqtO0Fl2V6HghGYmxPdOBC1N4MNBQRbIdpdWNtaS/yZ8H9Gi5kGuFVYdbBrhT7qhWcgFu8767Izr/iiBeCwBAo+c5/iB3Sjb9XajOMDXteBVigozAcnPALGt02L7CxcyCSq+N9jiRrmvMhGWAwEQODvmrhLaJRRX7+oEvAmQZnMZNc6zV8+NrTBRPc9bIEfcz9XCt/8oLXej4oqhuXIeZcu6Pu9I5ruU70SB7PMXNo78cVr5pM6pQ+S6vbe2LBUg8ffZGQGiEJU0BYFAvwIzXjxh4lKYPoiDp8GWRI/fhcFrZAVrZaLKTlTUMCK0nDixBeLNFfCixAFPkksWoGkJcqXUCbid1+YVqIkgcgbAyumlOgKT
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(136003)(346002)(376002)(451199021)(46966006)(36840700001)(40470700004)(5660300002)(8936002)(6862004)(8676002)(40460700003)(40480700001)(186003)(53546011)(33656002)(36860700001)(47076005)(86362001)(36756003)(2906002)(4744005)(336012)(83380400001)(2616005)(82310400005)(356005)(82740400003)(81166007)(6506007)(26005)(6512007)(107886003)(4326008)(6636002)(316002)(70586007)(70206006)(54906003)(37006003)(6486002)(478600001)(41300700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2023 09:23:50.4439
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3faaa439-2511-489c-56b0-08db5c3895d0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9125

Hi Luca,

> On 23 May 2023, at 09:43, Luca Fancellu <Luca.Fancellu@arm.com> wrote:
>=20
> Add sve_vl field to arch_domain and xen_arch_domainconfig struct,
> to allow the domain to have an information about the SVE feature
> and the number of SVE register bits that are allowed for this
> domain.
>=20
> sve_vl field is the vector length in bits divided by 128, this
> allows to use less space in the structures.
>=20
> The field is used also to allow or forbid a domain to use SVE,
> because a value equal to zero means the guest is not allowed to
> use the feature.
>=20
> Check that the requested vector length is lower or equal to the
> platform supported vector length, otherwise fail on domain
> creation.
>=20
> Check that only 64 bit domains have SVE enabled, otherwise fail.
>=20
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand


