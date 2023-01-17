Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE84166D442
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jan 2023 03:31:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.479034.742612 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHbjw-00035W-NU; Tue, 17 Jan 2023 02:30:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 479034.742612; Tue, 17 Jan 2023 02:30:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHbjw-00032y-IB; Tue, 17 Jan 2023 02:30:20 +0000
Received: by outflank-mailman (input) for mailman id 479034;
 Tue, 17 Jan 2023 02:30:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mnn9=5O=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1pHbju-00032s-Re
 for xen-devel@lists.xenproject.org; Tue, 17 Jan 2023 02:30:19 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on2052.outbound.protection.outlook.com [40.107.8.52])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e02f9d20-960e-11ed-91b6-6bf2151ebd3b;
 Tue, 17 Jan 2023 03:30:15 +0100 (CET)
Received: from FR3P281CA0126.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:94::16)
 by DB9PR08MB9945.eurprd08.prod.outlook.com (2603:10a6:10:3d2::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Tue, 17 Jan
 2023 02:30:13 +0000
Received: from VI1EUR03FT049.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:94:cafe::dc) by FR3P281CA0126.outlook.office365.com
 (2603:10a6:d10:94::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6023.12 via Frontend
 Transport; Tue, 17 Jan 2023 02:30:13 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT049.mail.protection.outlook.com (100.127.144.168) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.13 via Frontend Transport; Tue, 17 Jan 2023 02:30:12 +0000
Received: ("Tessian outbound 8038f0863a52:v132");
 Tue, 17 Jan 2023 02:30:11 +0000
Received: from 45f7033facbf.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 ACB7310D-757F-494D-8875-0BDB32C95B6B.1; 
 Tue, 17 Jan 2023 02:30:01 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 45f7033facbf.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 17 Jan 2023 02:30:01 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by GV1PR08MB8354.eurprd08.prod.outlook.com (2603:10a6:150:a4::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Tue, 17 Jan
 2023 02:29:58 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::d1d7:166d:6c34:d19e]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::d1d7:166d:6c34:d19e%5]) with mapi id 15.20.5986.018; Tue, 17 Jan 2023
 02:29:58 +0000
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
X-Inumbo-ID: e02f9d20-960e-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cz0CZqL3S/ce4G+/I/Tj9WtuJq7K7FSPIMrz63rOQyg=;
 b=LJ32SKiaWimC6NjYwfItbpCUWTX7fwGeL6HEhjvULSbE+zrf2evfGYnjBFVbVGE25x3eKGf2viFhCbXCAij6Nful6eVh8aZ/utZy+3bTfGNRtF4AtUyH7RShQ4vIHqLeFLWoIjFSCypAf2cDYUtGs46AM/7dfdffGvr4skLGCcE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a6tE+CyJJDtYXTjTf24d+xy/Ohn22Qr6NAbYgSFBYcyc6s+OZvAuTUIaO5vnhvM8GEvjUN1KdpYNzpY0z1AFBmXhetVm17xxM75NCxSm/KQMzgdWs93DBgn1CeWib9xj8PGVf2YtPPjcS8kU2VMLK72JQ9n4ITs2DKGBoNsNT6QYsIoWUvseZ4TuzC+rzm1OHxtgGEhZBFU8EHiVD1v9hv46GzsXU+IJmh0/jwA9pH5HOtWYprMILRxHMCU7GpA6sbKAGL+42BAj/dFU7u2RAHjhfmllzTVMbpAyKd6Vz54QHEUCuBHOA+QidMwHk0KJ+iqqa92d0q0f3mNzW+EMTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cz0CZqL3S/ce4G+/I/Tj9WtuJq7K7FSPIMrz63rOQyg=;
 b=lKy2rxY8n78uiNbr7ePiUw1y0RRJLNlA265tUu2Wl7tvWuHzKj9X2TNWGDNyftPi4nd7aNq7xjO7ZHCPiv2gvqmB0oPotCPGaKFLYwZNwe2AuS8KBD/JN66i6GkVlYv0Kk9WuO4KFnvbMG5twhJtrpCxd41xd6zX8qMzTTlxRPvAkHzyLc1MJdNu+M2a4fgSsLCGoXAx6YyVjwFfoH5Bb/FULaU9ymKW3Fv7y7OtJJUrQWU5R8Nn+kQQSaDm9knT4p8R6cT8wFMkmoL+e2Dokx4G/M56bElLZvce3LAwsKi/QelLSIrg8HVu18l1A1F+X3ROOK+gAbvkTSAXBQW35g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cz0CZqL3S/ce4G+/I/Tj9WtuJq7K7FSPIMrz63rOQyg=;
 b=LJ32SKiaWimC6NjYwfItbpCUWTX7fwGeL6HEhjvULSbE+zrf2evfGYnjBFVbVGE25x3eKGf2viFhCbXCAij6Nful6eVh8aZ/utZy+3bTfGNRtF4AtUyH7RShQ4vIHqLeFLWoIjFSCypAf2cDYUtGs46AM/7dfdffGvr4skLGCcE=
From: Henry Wang <Henry.Wang@arm.com>
To: Michal Orzel <michal.orzel@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH] xen/arm: Harden setup_frametable_mappings
Thread-Topic: [PATCH] xen/arm: Harden setup_frametable_mappings
Thread-Index: AQHZKbkxN5rEygeNfEqj+XfEFX++Ha6h0GPg
Date: Tue, 17 Jan 2023 02:29:58 +0000
Message-ID:
 <AS8PR08MB79913948C3C92CEBD6657DC992C69@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230116144106.12544-1-michal.orzel@amd.com>
In-Reply-To: <20230116144106.12544-1-michal.orzel@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 3CAFD5B202B30C478707AB64A30E7448.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|GV1PR08MB8354:EE_|VI1EUR03FT049:EE_|DB9PR08MB9945:EE_
X-MS-Office365-Filtering-Correlation-Id: bf290444-1f16-4463-8e80-08daf832c292
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 nxACedG7mo3+wVSuJUHjrssBM6+Tvl+LvL/4L4bONckbBo7iCFU2g3vnNJDM0+uAyZX4AruNXljqXpBAic1oxpXqLrZOedI08Dpb+R+1VM4ol9sxmhyzb9yt19FAqVek/0fNRoAU0/OA8r6q4QXv9aPu/xpIYgzyxPwoo6wzepK00P71NU66XrfRYhzxFVVmR2iyiQcI6OLnJg+vUOJg6A79fAz5NqRHqd7LewucSbl+C6TM31qEjsgMy2BSP/wyjb56epzcHGWLiu+gBM80+RZJXcIhdFds7e25dhD989zBEFc2yBH6gGfGb4Oac4I9gegqmtbvsLq0NqHOD2K67I8mrjMRTaQYTjY69W4ut1izcGIwnhRde9oJJ2ONZJ2GySQDqM4JsqzA7dAyuf1sOlO+qhCH3vaHujaFA08vAmkZuy19O9RNHy5ev2QC6ai1N6eXIWObKagOH4ugDxS5PDW2TXfMM/PBotrYbjZJdpjBr/x1E7F3gMdAFeGSnLNAFJ6WwV1osprQe8+1qdah0qPeAP/f2OySyVeP4mpaejLRsXyhCqAvF+sSfuLGJRTDa/4Rhi0exc47H3NhOWUgBTBq4TyKQe3blFxLqI2T5fv6cGOd/bb+6Af+vZzT57dDv6NQF3jTHywCvz/fmqfcCS+e4j5iYqQyWDy4K1XaRhErODnsysNrb0vHyqGLFXyOxd6qQRdYlClZNJsrtIIncQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(39860400002)(136003)(366004)(396003)(376002)(451199015)(86362001)(55016003)(7696005)(33656002)(71200400001)(478600001)(186003)(9686003)(6506007)(66946007)(64756008)(66446008)(52536014)(66476007)(4326008)(5660300002)(66556008)(26005)(76116006)(8936002)(54906003)(2906002)(110136005)(41300700001)(4744005)(8676002)(316002)(38070700005)(122000001)(38100700002)(83380400001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8354
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VI1EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	bdfa63c2-32d4-426d-e7ad-08daf832ba4e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Vk8BR/M04fHn+tS87w4w29WG1T2ZqY+h+zfmBBgjNrycFzwwKewEtZHGfPUXJe0e8wht+KAnWIvJyrss8TWPySPKentF1z1t7s2F4cVrY3nihddymDhrmwPdJuEjO8RPN27EN/8S/zWJQYHHhZn4H/apNVbpaW5FjeFakqr4YS1BEV77uVApDUeimQybrvgwmMQVcc+hN8p7Qwn36z84Peeq9/fCwsnyintT8zBaYxp/JavPm7XiivBZR8ALnwmZ4o1iemlUQ0z9YVnI+dFUdwq7RaIFcA1TpdPAzbgDcGiwcHyd8YFRx6oBjlPXfcs9XLLPG2bsPd7qNehim1k9ixbhzvEcO6CoQDCaW4U9H3c03aCB8tjGI6IYhA9qy8Orq2YOM2u39KXAeB7LitDjF1x9Tp91KSObmW+Frwm8vz6p+lrxxfjxjW29Iyhy0my9grS1Xd7rf2zFeChUS7KXUh7mt5yWt/uw7276bn+joHe8NY36zqBCoGldxHcDeiPBlgrLDqkffdNGkQK5VMnSPQPMvw+3oyCr/ineVpajZJ6aJGFrbswnJ/oKa2ECal4dOu4P9EGN7Y3SydEEt97M59EvwKpXR8lZszvrenShfX098JRv+zbgohaO1LZ7fOfHScd2pr14+0bhG0QMRrhfa5YNxvt+Po1skDEFQ+6bNWEZg2o4/bgXVZCgD+BPMhJWmcICKWPSNa7tdHYTV8bXjw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(346002)(136003)(39860400002)(451199015)(40470700004)(36840700001)(46966006)(86362001)(55016003)(40480700001)(33656002)(40460700003)(336012)(83380400001)(41300700001)(8936002)(8676002)(4326008)(70206006)(70586007)(5660300002)(52536014)(186003)(478600001)(26005)(9686003)(47076005)(7696005)(6506007)(107886003)(316002)(54906003)(110136005)(356005)(82310400005)(36860700001)(2906002)(82740400003)(81166007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2023 02:30:12.1690
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bf290444-1f16-4463-8e80-08daf832c292
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VI1EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9945

Hi Michal,

> -----Original Message-----
> Subject: [PATCH] xen/arm: Harden setup_frametable_mappings
>=20
> The amount of supported physical memory depends on the frametable size
> and the number of struct page_info entries that can fit into it. Define
> a macro PAGE_INFO_SIZE to store the current size of the struct page_info
> (i.e. 56B for arm64 and 32B for arm32) and add a sanity check in
> setup_frametable_mappings to be notified whenever the size of the
> structure changes. Also call a panic if the calculated frametable_size
> exceeds the limit defined by FRAMETABLE_SIZE macro.
>=20
> Update the comments regarding the frametable in asm/config.h and take
> the opportunity to remove unused macro FRAMETABLE_VIRT_END on arm32.
>=20
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Reviewed-by: Henry Wang <Henry.Wang@arm.com>

I've also used XTP to test this patch on FVP in both arm32 and arm64 execut=
ion
mode, and this patch is good, so:

Tested-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry

