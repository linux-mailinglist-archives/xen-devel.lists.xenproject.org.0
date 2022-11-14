Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C54B627590
	for <lists+xen-devel@lfdr.de>; Mon, 14 Nov 2022 06:38:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.443065.697460 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ouS9j-0000iM-FM; Mon, 14 Nov 2022 05:37:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 443065.697460; Mon, 14 Nov 2022 05:37:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ouS9j-0000fQ-CW; Mon, 14 Nov 2022 05:37:15 +0000
Received: by outflank-mailman (input) for mailman id 443065;
 Mon, 14 Nov 2022 05:37:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CFvb=3O=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1ouS9i-0000fI-3N
 for xen-devel@lists.xenproject.org; Mon, 14 Nov 2022 05:37:14 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2055.outbound.protection.outlook.com [40.107.247.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 61cd2757-63de-11ed-8fd2-01056ac49cbb;
 Mon, 14 Nov 2022 06:37:11 +0100 (CET)
Received: from DB6PR1001CA0019.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:4:b7::29)
 by PAWPR08MB9967.eurprd08.prod.outlook.com (2603:10a6:102:358::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.6; Mon, 14 Nov
 2022 05:37:07 +0000
Received: from DBAEUR03FT047.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:b7:cafe::4d) by DB6PR1001CA0019.outlook.office365.com
 (2603:10a6:4:b7::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17 via Frontend
 Transport; Mon, 14 Nov 2022 05:37:07 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT047.mail.protection.outlook.com (100.127.143.25) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5813.12 via Frontend Transport; Mon, 14 Nov 2022 05:37:06 +0000
Received: ("Tessian outbound 58faf9791229:v130");
 Mon, 14 Nov 2022 05:37:06 +0000
Received: from 9ff5d077711d.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4AE02F0E-C796-4897-9BC9-0770327EECEA.1; 
 Mon, 14 Nov 2022 05:37:00 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9ff5d077711d.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 14 Nov 2022 05:37:00 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by AS2PR08MB8286.eurprd08.prod.outlook.com (2603:10a6:20b:555::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.5; Mon, 14 Nov
 2022 05:36:58 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::b62d:6e04:1c26:6684]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::b62d:6e04:1c26:6684%5]) with mapi id 15.20.5834.005; Mon, 14 Nov 2022
 05:36:58 +0000
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
X-Inumbo-ID: 61cd2757-63de-11ed-8fd2-01056ac49cbb
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=XcOVKeudHohIxCx+wwN6dFhd1ba4C+jLykpJJXE+ddVcY4CNf69HvModXTrer0VaaYris06zOKMYF7i/EHzHAT82Ni5fvw1Joh68YOp2Zrwda8hKnpMz7C1fbNTuaURFGpOSYsgIRMSNAccpr+9ccz/k4+JuI8g14t09Vd6cpKP56B4WB9D9q3ZGCTePAOWbiP8wIWXRc4xoch6elc0LFukOVosOIWRd/7Str0JOsnwvh0UI/rBpXNjoh6eEY8dmrJFevQgn4WuKUtb3Ws59sH+bic7MvWDn2GPo8FV4/+T57a6zNOEq7re2hFZUl2JBvdDofCac84zbQrQt60xnew==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bAkquCMnSf9NUHtJdbRks7IaTcn+PKulVs5WYvkH5yU=;
 b=ZYj1sGvBd5YEHb/XMzc5JAeP4nI0tgUeczOkMHG0OMvlduN2nLf7EbvsvS4D0n/LvX+UAq6HYnxOhru+Fkm4IXOfQmezR8mmq7IxGHmGlL6TQ3bGzfn0qpNtweUGV2I/BXNFn6PcjJxsSvbGkdAKgmxX/LJxrtd7wCYRvW6ZiBryupltCFcElPEm2oghWsNFqYj4vTKx3elYXEWRsV5REWr+VcGz/1H7T7i3tVZnBN/uJvBALBfAnBypZhj36xtJEQKCqHwAZWvkfhNZeNdgEYn5l/hZvmBwwKvmH3uZdKIKAJaRbSkCHdGsa8RC09YWsKs4SBSSVRQ4ClHqb8f6Rg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bAkquCMnSf9NUHtJdbRks7IaTcn+PKulVs5WYvkH5yU=;
 b=0xL3idI/QrHgi3FTreyc5Z8QK9OJLZ6U2UTYA0IfOGAMYEjS8NUWs7OumQFh6vfXB9pSmjojcXwVBwaPy/WYkZP7M2eOfMKDECwdsnETeqwe4oZ7mKo7WRmSzfnev5Arvy9oIQSBFJF8V0kINPdrH1ZFFYFNwKfpED/pqhdkuo4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GnYABCFwzrUUpUTYiEqyTwCOQZJdpA79/pdtSFxUqiNnYoJealtzcpQVrSWdhrKIbsjTOyMaypdCyQH7eciFVanuhuZuJbSGw/LNTh9CZxEmqoani8+9TGx7rR4tznFgverQ8NGpSynV3HwgcU5ywYS3ZcSGiz7hqD0CfP/CiGEmbW+vXHUfPSIaza8J/zSprY2bLjIJTdsXHs5iK0JVfXGxwOq9t57vfFSwC0zshB7sS8LbOf+HLh2CVfgKoPBHVwqBwMJBGZCJcsGS0HBU7Onn+HZcAS6tIlXOMQju248Opxj7zH0aw0i4jLKUbbp2az7b4V2it9tiCr0PbkYd8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bAkquCMnSf9NUHtJdbRks7IaTcn+PKulVs5WYvkH5yU=;
 b=UuwU0ozDci/t944A4icqIT19axMhJPlVIYJhAJrIcZwWn58pjLS43ENCo5lj/9LUe2Zbl3eaHPYBgEOLvBjZa2No09FK6j7WiIAjXunii4Jnioqz3A4sLh7RMP8HgBkGrd2N89kMRLf44xUmbVIredHM+bDBXk3RkUPAHcNSAOVYF6yosQ1Hq/kk8NeL99JlDL0257WcWapziaSSQeXPku1Y3ne63fV3eafd0aywNjzWrJi2VoWo9T5AkkmhDqRVvHZK8AQgnaWwRwtC0iRmBdS6kxNgy1Z5fX6d4OlBfLufPvcAZp+Nndvc7QevB5pIRSDrFIdFlKLMWPV2Hefv6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bAkquCMnSf9NUHtJdbRks7IaTcn+PKulVs5WYvkH5yU=;
 b=0xL3idI/QrHgi3FTreyc5Z8QK9OJLZ6U2UTYA0IfOGAMYEjS8NUWs7OumQFh6vfXB9pSmjojcXwVBwaPy/WYkZP7M2eOfMKDECwdsnETeqwe4oZ7mKo7WRmSzfnev5Arvy9oIQSBFJF8V0kINPdrH1ZFFYFNwKfpED/pqhdkuo4=
From: Wei Chen <Wei.Chen@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: nd <nd@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Henry Wang <Henry.Wang@arm.com>
Subject: RE: [PATCH v6 08/11] xen/arm64: move MMU related code from head.S to
 head_mmu.S
Thread-Topic: [PATCH v6 08/11] xen/arm64: move MMU related code from head.S to
 head_mmu.S
Thread-Index: AQHY8DVrMB29cZJCrk+wAkCu80OmKq4yVgCAgAPeDBCABz1OAIAAUxAg
Date: Mon, 14 Nov 2022 05:36:58 +0000
Message-ID:
 <PAXPR08MB74202D560DB64B0C0C2E71B69E059@PAXPR08MB7420.eurprd08.prod.outlook.com>
References: <20221104100741.2176307-1-wei.chen@arm.com>
 <20221104100741.2176307-9-wei.chen@arm.com>
 <5b975a59-5e97-c2a8-805c-9ab99b8712aa@xen.org>
 <PAXPR08MB74206E8C1513DC90DCD71CEC9E3E9@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <927355c8-aea1-83c4-60c1-b06f8e0f182f@xen.org>
In-Reply-To: <927355c8-aea1-83c4-60c1-b06f8e0f182f@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 5FCE17B43323BD469D5FB109401E6D25.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PAXPR08MB7420:EE_|AS2PR08MB8286:EE_|DBAEUR03FT047:EE_|PAWPR08MB9967:EE_
X-MS-Office365-Filtering-Correlation-Id: b6644650-61b6-42e7-fd2e-08dac602444f
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 oSwpW8cHe797NSp5wPeZA60y0ZGssP3s9D2qUMb8LnqVeHB+ejdSjJ5ovHHV9c5y2JEo41V9QuRkpb4xKIiNuUvUcDejcq1j1q3DW2jsODNCGv50I7t0jfKmHnfn/ARbAubi8lgzxRzZ4uBiP3dEeVhkhmG+ecjiqhG7ddT6WAoj8koQMSuGECsXzT4Kz285BnvA691tTWw9mmbmJc6N0ph7U4L278l60hjN0ffsrhxSsJBjLCYZG4OIVL1i4VhbAYmwvLceM7Us/xIJ+DytT+xuxFhqgBF50c4MZbviHD3bvw1jW2qaSEHZ0w7d+yclTLS36zF3ek/U86EtGOyfr1EV1uwfklc80D4A4y7oukkioIU2u3LQBLCxmic6WH3szdr7W/XscsfdHn0xz5RwlwctR3RQ1mZoftyaP3o917EmSc595Q6S2y4Le8PtXRpqw6LfHwqzBfbNJzthu7gTV3kJq+0cOWhUpnxbQ4Qbwc76Pcf+0oJJnFQ5lkeW2vajCddY0rEKVqbgMEfpxzl+oFbjovt7aBfWsuWxZ5amh2JnuCJwOVEZNbbnVDGCkHNChf/adqGiOgIMONeBo4Oxw/sela9Q85sgolENbY/doAdJUIusVxLfa6JqV6JWPI1UJMsTjVkQqdjW3p8mXFWT78KzJfW4G+PYaeYpReRGI71w0QGWZ+sH+V9Cw/wA2z9SWw+GkA4Pu7Xq3dvuFJ0QAy2GAWZoPIk0+v+Nb0+G64/k8MLK0kNT3Qa3fIHPHzIbQjDeKfUUR5DgIoB3nVJMBOblqjBx2T5qqnzMAGCGW/M=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(39860400002)(366004)(396003)(136003)(376002)(451199015)(83380400001)(86362001)(64756008)(38100700002)(122000001)(38070700005)(2906002)(41300700001)(8936002)(52536014)(5660300002)(8676002)(9686003)(66446008)(66476007)(66556008)(71200400001)(53546011)(6506007)(7696005)(55016003)(186003)(54906003)(76116006)(110136005)(478600001)(4326008)(66946007)(316002)(66899015)(33656002)(60764002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8286
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT047.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	56b32369-e3ec-43ea-c9cf-08dac6023f8b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ULAx8fiNHCGS82H3qzl9ZVqsJAcqe4MkkYBnEulxhmmwfEwMJBp+2wBc537X/gpyN5SKQR9YjkiI4QdqmnNS2FhldMD1aIIEdV22adYcftBGLvbQmz+R0LAEaDuDgx+sId8E7BBRldfw8LVlpNHho3Z/PIJkvvp6V7PyQL0Tu1DSJ6pw18KxWzWWyWYx1gTBVxzti9gEH6faq1hsTY2wv0T8vmXv5Y+3NgtmaBYkClkYDHHCSnx+2vzbc325YXjAT+ow2sJ8F1a3d0YS+O71VLt0mPi6RipEM/sx6dY0dbD3zJ0rk2eR7OHIyIvgPvSeWH/HQuxx1DI6/kAZC38VU7NhbJWB6kqcxF0ksYC+8sQ/OL+mOmiBVi7f66recy77SRlzBrqboiZdybslhJb4i1OXUf9NKEM5PiC6qpyhGiwXyN3mPFNSW0tL+1BQ6ecTySv/IYnkpPFB1AemjeXPUmjmQvimmXdl6HNzx00t2qp4qs9IZU5GuYi4CUoHeUqVLwj2ZkkUwjlZVoHykgQnPOfGmQEm79TPHoVIN1M1ACPAclEZNPJG4caCOf9KJ+apm44GHYmQHhtbvJ88NF5YPASYiIm25vT/ZBkjh3xSgs1uuu4eC8RSGddfymhNQVL5FT+G50VzOdj8iDWcmT/NrecHysCATqNec6MkaHY53QuqpR48xMZtHAqA6AvirLXDsdDsMj7FcHFzLjK0oZWZGUFSexr54CrhRCkxaqI7ORPax//ILXf1Pzh5M41Rq2kJCXwljZ6mjsG5W0yZ+ElGYfFuZTwCH5YbkpjDJjmfkqE=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(136003)(396003)(39860400002)(451199015)(46966006)(40470700004)(36840700001)(26005)(478600001)(33656002)(7696005)(6506007)(9686003)(53546011)(40480700001)(55016003)(86362001)(110136005)(54906003)(316002)(186003)(336012)(47076005)(52536014)(8936002)(36860700001)(81166007)(2906002)(70206006)(70586007)(82740400003)(82310400005)(41300700001)(83380400001)(5660300002)(66899015)(356005)(8676002)(4326008)(40460700003)(60764002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2022 05:37:06.4673
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b6644650-61b6-42e7-fd2e-08dac602444f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT047.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9967

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IFNlbnQ6IDIwMjLlubQxMeaciDE05pelIDU6NDMN
Cj4gVG86IFdlaSBDaGVuIDxXZWkuQ2hlbkBhcm0uY29tPjsgeGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnDQo+IENjOiBuZCA8bmRAYXJtLmNvbT47IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0
YWJlbGxpbmlAa2VybmVsLm9yZz47IEJlcnRyYW5kDQo+IE1hcnF1aXMgPEJlcnRyYW5kLk1hcnF1
aXNAYXJtLmNvbT47IFZvbG9keW15ciBCYWJjaHVrDQo+IDxWb2xvZHlteXJfQmFiY2h1a0BlcGFt
LmNvbT47IEhlbnJ5IFdhbmcgPEhlbnJ5LldhbmdAYXJtLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQ
QVRDSCB2NiAwOC8xMV0geGVuL2FybTY0OiBtb3ZlIE1NVSByZWxhdGVkIGNvZGUgZnJvbSBoZWFk
LlMNCj4gdG8gaGVhZF9tbXUuUw0KPiANCj4gDQo+IA0KPiBPbiAwOS8xMS8yMDIyIDA3OjM2LCBX
ZWkgQ2hlbiB3cm90ZToNCj4gPiBIaSBKdWxpZW4sDQo+IA0KPiBIaSBXZWksDQo+IA0KPiA+DQo+
ID4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+IEZyb206IEp1bGllbiBHcmFsbCA8
anVsaWVuQHhlbi5vcmc+DQo+ID4+IFNlbnQ6IDIwMjLlubQxMeaciDfml6UgNDowNg0KPiA+PiBU
bzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcNCj4gPj4gQ2M6IG5kIDxuZEBhcm0uY29tPjsgU3RlZmFubyBTdGFiZWxsaW5pIDxzc3Rh
YmVsbGluaUBrZXJuZWwub3JnPjsNCj4gQmVydHJhbmQNCj4gPj4gTWFycXVpcyA8QmVydHJhbmQu
TWFycXVpc0Bhcm0uY29tPjsgVm9sb2R5bXlyIEJhYmNodWsNCj4gPj4gPFZvbG9keW15cl9CYWJj
aHVrQGVwYW0uY29tPjsgSGVucnkgV2FuZyA8SGVucnkuV2FuZ0Bhcm0uY29tPg0KPiA+PiBTdWJq
ZWN0OiBSZTogW1BBVENIIHY2IDA4LzExXSB4ZW4vYXJtNjQ6IG1vdmUgTU1VIHJlbGF0ZWQgY29k
ZSBmcm9tDQo+IGhlYWQuUw0KPiA+PiB0byBoZWFkX21tdS5TDQo+ID4+DQo+ID4+IEhpIFdlaSwN
Cj4gPj4NCj4gPj4gT24gMDQvMTEvMjAyMiAxMDowNywgV2VpIENoZW4gd3JvdGU6DQo+ID4+PiBU
aGVyZSBhcmUgbG90cyBvZiBNTVUgc3BlY2lmaWMgY29kZSBpbiBoZWFkLlMuIFRoaXMgY29kZSB3
aWxsIG5vdA0KPiA+Pj4gYmUgdXNlZCBpbiBNUFUgc3lzdGVtcy4gSWYgd2UgdXNlICNpZmRlZiB0
byBnYXRlIHRoZW0sIHRoZSBjb2RlDQo+ID4+PiB3aWxsIGJlY29tZSBtZXNzeSBhbmQgaGFyZCB0
byBtYWludGFpbi4gU28gd2UgbW92ZSBNTVUgcmVsYXRlZA0KPiA+Pj4gY29kZSB0byBoZWFkX21t
dS5TLCBhbmQga2VlcCBjb21tb24gY29kZSBzdGlsbCBpbiBoZWFkLlMuDQo+ID4+DQo+ID4+IEkg
YW0gYWZyYWlkIHRoYXQgeW91IGNhbid0IHNpbXBseSBtb3ZlIHRoZSBNTVUgY29kZSBvdXQgb2Yg
aGVhZC5TDQo+ID4+IGJlY2F1c2UgdGhpcyB3aWxsIGJyZWFrIFhlbiB3aGVuIHJ1bm5pbmcgdXNp
bmcgdGhlIGlkZW50aXR5IG1hcC4NCj4gPj4NCj4gPj4gVGhpcyBpcyBiZWNhdXNlIHdlIG9ubHkg
bWFwIHRoZSBmaXJzdCA0S0Igb2YgWGVuIHdpdGggUEEgPT0gVkEuIEF0IHRoZQ0KPiA+PiBtb21l
bnQsIHdlIGd1YXJhbnRlZSBpdCBieSBoYXZpbmcgZXZlcnl0aGluZyB0aGF0IG5lZWRzIHRvIGJl
IHVzZWQgaW4NCj4gPj4gdGhlIGlkZW50aXR5IG1hcHBpbmcgYmVmb3JlIF9lbmRfYm9vdCBhbmQg
Y2hlY2tpbmcgYXQgbGluayB0aW1lIGlmIHRoaXMNCj4gPj4gZml0cyBpbiA0S0IuDQo+ID4+DQo+
ID4+IE5vdyB0aGF0IHlvdSBtb3ZlZCB0aGUgTU1VIGNvZGUgb3V0c2lkZSBvZiBoZWFkLlMuIFdl
IG5lZWQgdG8gZmluZCBhDQo+ID4+IGRpZmZlcmVudCB3YXkgdG8gZ3VhcmFudGVlIGl0LiBPbmUg
d2F5IHRvIGRvIGl0IHdvdWxkIGJlIHRvIGNyZWF0ZSBhDQo+ID4+IHNlY3Rpb24gdGhhdCB3b3Vs
ZCBiZSB1c2VkIGZvciBldmVyeXRoaW5nIHRoYXQgbmVlZHMgdG8gYmUgaWRlbnRpdHkNCj4gbWFw
cGVkLg0KPiA+Pg0KPiA+DQo+ID4gUXVvdGUgZnJvbSBuZXh0IGVtYWlsDQo+ID4gIg0KPiA+IExv
b2tpbmcgYXQgdGhlIGNvZGUgdGhpcyBtb3JuaW5nLCBJIG5vdGljZWQgdGhhdCB3ZSBhbHJlYWR5
IGhhdmUgdGhlDQo+ID4gc2VjdGlvbiAiLnRleHQuaGVhZGVyIi4gRm9yIG5vdywgdGhhdCBzaG91
bGQgZG8gdGhlIGpvYi4gU28gd2UganVzdCBuZWVkDQo+ID4gdG8gY2hlY2sgdGhlIHNpemUgb2Yg
LnRleHQuaGVhZGVyLg0KPiA+DQo+ID4gSWRlYWxseSwgY2hlY2tpbmcgdGhlIHNpemUgc2hvdWxk
IGJlIGRvbmUgaW4gYSBzZXBhcmF0ZSBwcmUtcGF0Y2ggc28gaXQNCj4gPiBpcyBlYXNpZXIgdG8g
cmV2aWV3Lg0KPiA+ICINCj4gPg0KPiA+IE9LLiBXZSB3aWxsIGNyZWF0ZSBhIHBhdGNoIHRvIGNo
ZWNrIHRoZSBzaXplLCBhbmQgcGxhY2UgaXQgaW4gdGhlDQo+ID4gaGVhZCBvZiB0aGUgc2VyaWVz
Lg0KPiANCj4gSSB0aG91Z2h0IGEgYml0IG1vcmUgYWJvdXQgd2hhdCBJIHdyb3RlLiBYZW4gYmlu
YXJ5IHNob3VsZCBhbHdheXMgc3RhcnQNCj4gd2l0aCB0aGUgSW1hZ2UvWmltYWdlIGhlYWRlci4g
QXQgdGhlIG1vbWVudCwgdGhpcyBpcyBndWFyYW50ZWVkIGJlY2F1c2UNCj4gdGhlcmUgaXMgb25s
eSBvbmUgb2JqZWN0IHVzaW5nIHRoZSBzZWN0aW9uIC50ZXh0LmhlYWRlci4NCj4gDQo+IFdpdGgg
dGhlIGNoYW5nZSBpbnRyb2R1Y2VkIGluIHRoaXMgcGF0Y2gsIHRoZXJlIHdpbGwgYmUgbXVsdGlw
bGUgb2JqZWN0cw0KPiB1c2luZyB3aXRoIHRoZSBzZWN0aW9ucyAudGV4dC5oZWFkZXIuIFRoaXMg
bWVhbnMgd2UgYXJlIHJlbHlpbmcgb24gdGhlDQo+IGNvbXBpbGVyIHRvIGFsd2F5cyBwdXQgdGhl
IGNvbnRlbnQgb2YgaGVhZC5TIGZpcnN0Lg0KPiANCg0KWWVzLCBub3cgaXQgZGVwZW5kcyBvbiB0
aGUgb2JqZWN0cycgb3JkZXIgaW4gTWFrZWZpbGUuIFRoaXMgc2hvdWxkIGJlDQphIHJpc2suDQoN
Cj4gVGhpcyBpcyBiYXNpY2FsbHkgcmV2ZXJ0aW5nIHRvIHRoZSBiZWhhdmlvciBiZWZvcmUgY29t
bWl0IDQyNjdhMzNiMTlkDQo+ICgieGVuL2J1aWxkOiBwdXQgaW1hZ2UgaGVhZGVyIGludG8gYSBz
ZXBhcmF0ZSBzZWN0aW9uIikuDQo+IA0KPiBUaGVyZWZvcmUgd2UgZG8gbmVlZCBhIHNlcGFyYXRl
IHNlY3Rpb24gdG8gYmUgdXNlZCBmb3IgaGVhZF8qLlMgYW5kDQo+IG1heWJlIHBhcnQgb2YgaGVh
ZC5TLiBUaGlzIG5ldyBzZWN0aW9uIGNvdWxkIGJlIGNhbGxlZCB0ZXh0LmlkbWFwIHNvIHdlDQo+
IGtub3cgd2hhdCB0aGUgc2VjdGlvbiBpcyB1c2VkIGZvci4NCj4gDQoNClllcywgd2UgbWlnaHQg
cGxhY2UgdGhpcyBuZXcgc2VjdGlvbiBhZnRlciB0ZXh0LmhlYWRlci4NCg0KQ2hlZXJzLA0KV2Vp
IENoZW4NCg0KPiBDaGVlcnMsDQo+IA0KPiAtLQ0KPiBKdWxpZW4gR3JhbGwNCg==

