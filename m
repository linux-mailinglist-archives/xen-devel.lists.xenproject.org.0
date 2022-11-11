Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81301625890
	for <lists+xen-devel@lfdr.de>; Fri, 11 Nov 2022 11:42:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.442427.696576 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otRU2-00037k-7D; Fri, 11 Nov 2022 10:42:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 442427.696576; Fri, 11 Nov 2022 10:42:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otRU2-000352-4M; Fri, 11 Nov 2022 10:42:02 +0000
Received: by outflank-mailman (input) for mailman id 442427;
 Fri, 11 Nov 2022 10:42:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Waqq=3L=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1otRU1-00034w-5q
 for xen-devel@lists.xenproject.org; Fri, 11 Nov 2022 10:42:01 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70043.outbound.protection.outlook.com [40.107.7.43])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 779c0ef6-61ad-11ed-8fd2-01056ac49cbb;
 Fri, 11 Nov 2022 11:41:58 +0100 (CET)
Received: from AS9PR06CA0116.eurprd06.prod.outlook.com (2603:10a6:20b:465::26)
 by AS4PR08MB7508.eurprd08.prod.outlook.com (2603:10a6:20b:4fa::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Fri, 11 Nov
 2022 10:41:51 +0000
Received: from AM7EUR03FT013.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:465:cafe::d5) by AS9PR06CA0116.outlook.office365.com
 (2603:10a6:20b:465::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13 via Frontend
 Transport; Fri, 11 Nov 2022 10:41:51 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT013.mail.protection.outlook.com (100.127.140.191) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5813.12 via Frontend Transport; Fri, 11 Nov 2022 10:41:51 +0000
Received: ("Tessian outbound b4aebcc5bc64:v130");
 Fri, 11 Nov 2022 10:41:51 +0000
Received: from 359a832b9bba.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 EA777137-8E52-4DE8-B5ED-E12A1CCA4993.1; 
 Fri, 11 Nov 2022 10:41:45 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 359a832b9bba.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 11 Nov 2022 10:41:45 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by PA4PR08MB6158.eurprd08.prod.outlook.com (2603:10a6:102:e2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Fri, 11 Nov
 2022 10:41:43 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::b62d:6e04:1c26:6684]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::b62d:6e04:1c26:6684%5]) with mapi id 15.20.5813.013; Fri, 11 Nov 2022
 10:41:43 +0000
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
X-Inumbo-ID: 779c0ef6-61ad-11ed-8fd2-01056ac49cbb
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=nQY9NuMirQm7gMK46psNevGLcifgmC7QHT0wU8AFbCPP7fm/TMG3Ft6Q4MJk5RPZXEw0/nPJu9YRppzxcEpzAseOAiy2MkEkC2AdD7ekuplhMcPknCRnySb/u4cVm1vLGQ+lHFLzhTv2C0emVmtUATnYwV3Yp1Bgs8u7VMA5gTcWL016GMwtYjeAgrQUDZeTAx4hy0UpjaMhBdGApZ9UxBh77rSlIf4DIGvp3S2NrRZV/fTNRh6YrdXro5pEKYdgOyXhVswLZpHAlfdm3N+K/A4QB3L6/gGZZ2j91QQ+DmjtBO2WwnYvvBsIGJEzealm3uQRUxc6nzPV9HFrEoP5EA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ERJWhtGlLPpaSTkzlryZMpTsv33uMWawfDic7zG+PuU=;
 b=laPH6XOrR+4gBDUwpS4XEpY+RXOeNJHC38NGNYuOAbxjvfcRNU/VIEHc+jRQhgxdDCB/6s9+3Yk4berughyV+fXo/eNkWYHOF7e6A1X48R8BolQ/dU8AqTFUMoy+XWDXNK+W+IyE7n2gMxGi0STyQQuuk5pnZcYyoU3m0cE5BAMZ6tGOmh/rGw0myNcGmD1oz8XmzHubWiwqhO3k4Dq1W5R2luNIfxVmkSBlP+Jqa9/KQ9itznPr/C2M/gBnYkT/gkdugNFwYbbt6HeodC9rsfwxeVKyWXrotueHXBqHo+yPvwCi67zCLnBmOhXRnEcRF8487PjGHDbsw3KQyjTMvw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ERJWhtGlLPpaSTkzlryZMpTsv33uMWawfDic7zG+PuU=;
 b=eAJ5KIU82Y/TmmSWMlGSpOIkg/q9sXbERST14InOJm9csGes2hkji//3aSLSqhkazRybBHwBQ6iW/FY2xAMzKGDtW7iZQE4T/Y4bhqov+qyEyiDXHf936cN6mt8ni+04K2HjkEeYrXInyYpTLHVNImcERKN9wPQ0N7fuXXiZCRA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wbd/fN5ms09I/JT7luXAAQiPPW7MrvmvExEFYJsAsWx5CfIaMX6zcxLso9sQ/z6JhdGURpLTsuOl9yiNGmxqWLaidTzzYxYoTSjbLH5Uhnd1e18MYaQIFD7KVx6sitjT4fLWUn4jnqIJHe5vcGxMi1NOWXApLsTNHYK8Kyx2jajs/xu4HbrwSOvaXI219Ut7eO7CKIN4OqwiMKqVh/v+PK3xGxLxSdPewsOb/An9CJ8QTWStn+d3e/ERz2FF0XC5OOd/5IUIne/FqOOaQa6J2IArvgdbZt2gDe1xVc36rT1bBTu3aXpgjKUQ+EMCFF/3QzgHbbykYagtPrQorQV8Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ERJWhtGlLPpaSTkzlryZMpTsv33uMWawfDic7zG+PuU=;
 b=fjy3ScPBQW7kp3jLXcZUm8GFRbRFVEuzQs0JUWtO/XsEdMJjzdX/xgIjtTsZSpy2YdSzBBKtBIHX86aIBTqSmZr+r58ft3bbywqSmziaMVLuk7LtXYV6rqhcK4XE6L7uey+Cunh7Aww80LepjK2JnIo3rTVw3rrvy2CXBoMsVmVsK1N7rXISzOaQTvfg5p4bsfGZ0Rv17pauw6iBZxTP7U42tQgLIxvi1t5EXuusAsDWfotHITpDHszooX9YlvQOjiSwJW3xw5do7884TNSWNcXcoTudlYArZw9UtP6KC19IsOorwV0+fWlBmSMkB2VMb3Pf6i/jPc+RTy+BrXrHug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ERJWhtGlLPpaSTkzlryZMpTsv33uMWawfDic7zG+PuU=;
 b=eAJ5KIU82Y/TmmSWMlGSpOIkg/q9sXbERST14InOJm9csGes2hkji//3aSLSqhkazRybBHwBQ6iW/FY2xAMzKGDtW7iZQE4T/Y4bhqov+qyEyiDXHf936cN6mt8ni+04K2HjkEeYrXInyYpTLHVNImcERKN9wPQ0N7fuXXiZCRA=
From: Wei Chen <Wei.Chen@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, nd <nd@arm.com>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH v6 00/11] xen/arm: Add Armv8-R64 MPU support to Xen -
 Part#1
Thread-Topic: [PATCH v6 00/11] xen/arm: Add Armv8-R64 MPU support to Xen -
 Part#1
Thread-Index:
 AQHY8DVcKFNDls96akm0LlhB1cf9B64yRBkAgADyKCCAAA1MAIAAAWqggAWBUQCAAMY1wA==
Date: Fri, 11 Nov 2022 10:41:43 +0000
Message-ID:
 <PAXPR08MB74204217EECA6BB4F5F73FAA9E009@PAXPR08MB7420.eurprd08.prod.outlook.com>
References: <20221104100741.2176307-1-wei.chen@arm.com>
 <9c3bfa0c-2c8f-2160-46d1-3be234b5bcaf@xen.org>
 <PAXPR08MB742097DFF1BD4E9BF19B41459E3C9@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <88c909b5-4cad-aab0-2acd-fb3519963128@xen.org>
 <PAXPR08MB7420AA9428230246BF21D0409E3C9@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <alpine.DEB.2.22.394.2211101420320.50442@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2211101420320.50442@ubuntu-linux-20-04-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 62A7EE719CDB9044B34973E2CB774014.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PAXPR08MB7420:EE_|PA4PR08MB6158:EE_|AM7EUR03FT013:EE_|AS4PR08MB7508:EE_
X-MS-Office365-Filtering-Correlation-Id: e684e707-679f-4ffc-d742-08dac3d157b9
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 jgq7Oc+5vpAsfo84VfMZj/7YGz5HJ5XqBTW/oBnlw8DuLfN1/TNN72e2E4aPNBxk1wXAWsAvOH/rSbQfioZG+B4KG7pRuiJwReThxL6hdwB21RE/KTg0amW97/Uju2dUcrDaAG+AStuBb3vRE2uTtQbfwBMmtU69KDQPt8YvnRgzl2cdr2rBMMCz9rWdGhuh6sZbCelLbIm7ruaiIRACf2mDliOnbUcBh1t4ka5U+g6bVsTa5A/sxFxKhjMvpMeYNtpAdlIUSf0e5glCT54I8VnydrApITp6pMvVHVdpv9Vr0BUE1hcW5DYasa8vtcReOPuWrKg3UUipCZpgH78AuMfd7+4ZwskMqIGwTgkK4MPHJQqJKip2NdZG7aB3I+gUVZlpdlRlMEmUCcfc1tT+KUoQR1gwGX995FeL7t2jf8N184VM/xEkUW3F+kamG29vToh5651+5fjT3KnCIOWIRyflLPEP5Li8ZBBb9TsmVbT6UJeQZ5x8WScAzDsdq02SRCVElI5krGLRexELl15D6Q8kDrPmYcjd23YnJE5VQwBbfbao5ivCuI8+laaCjY+SdkEooRNJfMwP5lHSWe4209Fd9xGvscDwS8UeG+kLk94Gb6SOvQMlyQMCZ035KF62g5yHLLMdjQ2UiuZjaszV5ufw9Sj6sD/3SOxF1jGOYBGuSK+i8OOntLhEWZyEvCgpr153TFrz3YApmfxJqM7KvSymvE1RJrZvRSlSOZ0wf3yy+mS+oaaQfLz6q3X243D9S499KYv+C/Vif5oivsUo0IZ+ZxQ5MwKwLp3nlCKvLD8=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(366004)(396003)(39860400002)(136003)(346002)(451199015)(38070700005)(71200400001)(6916009)(54906003)(6506007)(316002)(122000001)(7696005)(2906002)(53546011)(38100700002)(33656002)(83380400001)(55016003)(52536014)(8936002)(478600001)(41300700001)(8676002)(5660300002)(4326008)(186003)(26005)(9686003)(76116006)(64756008)(66476007)(66446008)(66556008)(66946007)(86362001)(17413003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6158
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	dff67ecd-d7de-40b7-bbf2-08dac3d1533d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iUBikSXuUxPaXA2U8chuagd2Nv0/Xw0zXI5tBEDSV0YBRJ5y3t8uWF4QXTm3kBIvvgOlFbR3/NmEu69nSUUM6u9FGJRM7Uj0lCV/Kc8gXoC5FlF5WD93Z9GwEt6+CuGzoXGHnMKxgQTnL5hP/PVCzsf0XzaicF9iO/AHMBDK89yMJHBYIKl0gBETtE+8OyJNGfhC9oToGLK039U6eJcjy5eNKYOGl8Uto4iem1h8voRMtbM5NDVoUoqE0Us2iX8CFjcPgZvM6YhHuNQdNAuDYhVUcqwk/ZVplLUJJlXac56oRr9VyAKLGEsm6DLJp/iE8cfrkxxMPoLEFdhzapnwzINjPDFf2XQ7F8ysuCGzu5fls8YX/772lnwvVz4eDyMabJXL2SU0ksTTulmwFGmCeubmnVkI8+i75YpZk7PlujcK3CmnQ2z6edPClJfCRLPej36x7c7pX1x95cqfVpkuLn58gtSCDkI3kZ0c9vGvvciEm2VltUnyYiBuQBYHi5T1UoQsFA+80l1jIbhQnhZEw17rdNLQSfbD6JSm9yUb/ZQ/r6ZY2TrRuAYLHJdvpEEvX9JJxnJssUoMaWz2VL05+OTVqC+gk9/2SgxkapWnf2GzHZOL2b13tziaW4rgGrTOxsGKAIpoDG/wMEksyoLX1DWbZGyqYPq1KSgVvuHP0mU3R/KsmFjY5K5w81wqZHPIdeRR/Vx79CYPFSLwx5QubaQPi9rHZWM/PWBda24R/LxxJ0UZlN5FuY3GZIPevLKSCHryvh5+gana9uELOZjW3B1AWphKGKRIzXqN1ErgqL8=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(376002)(39860400002)(136003)(451199015)(40470700004)(36840700001)(46966006)(5660300002)(52536014)(6862004)(8936002)(4326008)(70586007)(70206006)(41300700001)(8676002)(2906002)(33656002)(83380400001)(47076005)(478600001)(40480700001)(336012)(40460700003)(107886003)(53546011)(7696005)(26005)(6506007)(186003)(55016003)(316002)(356005)(81166007)(82740400003)(9686003)(54906003)(36860700001)(86362001)(82310400005)(17413003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2022 10:41:51.2943
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e684e707-679f-4ffc-d742-08dac3d157b9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7508

SGkgU3RlZmFubywgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZy
b206IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4NCj4gU2VudDog
MjAyMuW5tDEx5pyIMTHml6UgNjoyNg0KPiBUbzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+
DQo+IENjOiBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPjsgeGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnOyBuZA0KPiA8bmRAYXJtLmNvbT47IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0
YWJlbGxpbmlAa2VybmVsLm9yZz47IEJlcnRyYW5kDQo+IE1hcnF1aXMgPEJlcnRyYW5kLk1hcnF1
aXNAYXJtLmNvbT47IFZvbG9keW15ciBCYWJjaHVrDQo+IDxWb2xvZHlteXJfQmFiY2h1a0BlcGFt
LmNvbT4NCj4gU3ViamVjdDogUkU6IFtQQVRDSCB2NiAwMC8xMV0geGVuL2FybTogQWRkIEFybXY4
LVI2NCBNUFUgc3VwcG9ydCB0byBYZW4gLQ0KPiBQYXJ0IzENCj4gDQo+IE9uIE1vbiwgNyBOb3Yg
MjAyMiwgV2VpIENoZW4gd3JvdGU6DQo+ID4gSGkgSnVsaWVuLA0KPiA+DQo+ID4gPiAtLS0tLU9y
aWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+ID4gRnJvbTogSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVu
Lm9yZz4NCj4gPiA+IFNlbnQ6IDIwMjLlubQxMeaciDfml6UgMTg6MTYNCj4gPiA+IFRvOiBXZWkg
Q2hlbiA8V2VpLkNoZW5AYXJtLmNvbT47IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZw0K
PiA+ID4gQ2M6IG5kIDxuZEBhcm0uY29tPjsgU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGlu
aUBrZXJuZWwub3JnPjsNCj4gQmVydHJhbmQNCj4gPiA+IE1hcnF1aXMgPEJlcnRyYW5kLk1hcnF1
aXNAYXJtLmNvbT47IFZvbG9keW15ciBCYWJjaHVrDQo+ID4gPiA8Vm9sb2R5bXlyX0JhYmNodWtA
ZXBhbS5jb20+DQo+ID4gPiBTdWJqZWN0OiBSZTogW1BBVENIIHY2IDAwLzExXSB4ZW4vYXJtOiBB
ZGQgQXJtdjgtUjY0IE1QVSBzdXBwb3J0IHRvDQo+IFhlbiAtDQo+ID4gPiBQYXJ0IzENCj4gPiA+
DQo+ID4gPg0KPiA+ID4NCj4gPiA+IE9uIDA3LzExLzIwMjIgMDk6NTIsIFdlaSBDaGVuIHdyb3Rl
Og0KPiA+ID4gPiBIaSBKdWxpZW4sDQo+ID4gPg0KPiA+ID4gSGksDQo+ID4gPg0KPiA+ID4gPg0K
PiA+ID4gPj4+ICAgIC0gU3VwcG9ydHMgb25seSBhIHNpbmdsZSBTZWN1cml0eSBzdGF0ZSAtIFNl
Y3VyZS4NCj4gPiA+ID4+PiAgICAtIE1QVSBpbiBFTDEgJiBFTDIgaXMgY29uZmlndXJhYmxlLCBN
TVUgaW4gRUwxIGlzIGNvbmZpZ3VyYWJsZS4NCj4gPiA+ID4+Pg0KPiA+ID4gPj4+IFRoZXNlIHBh
dGNoIHNlcmllcyBhcmUgaW1wbGVtZW50aW5nIHRoZSBBcm12OC1SNjQgTVBVIHN1cHBvcnQNCj4g
PiA+ID4+PiBmb3IgWGVuLCB3aGljaCBhcmUgYmFzZWQgb24gdGhlIGRpc2N1c3Npb24gb2YNCj4g
PiA+ID4+PiAiUHJvcG9zYWwgZm9yIFBvcnRpbmcgWGVuIHRvIEFybXY4LVI2NCAtIERyYWZ0QyIg
WzFdLg0KPiA+ID4gPj4+DQo+ID4gPiA+Pj4gV2Ugd2lsbCBpbXBsZW1lbnQgdGhlIEFybXY4LVI2
NCBhbmQgTVBVIHN1cHBvcnQgaW4gdGhyZWUgc3RhZ2VzOg0KPiA+ID4gPj4+IDEuIEJvb3QgWGVu
IGl0c2VsZiB0byBpZGxlIHRocmVhZCwgZG8gbm90IGNyZWF0ZSBhbnkgZ3Vlc3RzIG9uIGl0Lg0K
PiA+ID4gPj4NCj4gPiA+ID4+IEkgcmVhZCB0aGlzIGFzIEkgY2FuIGJ1aWxkIFhlbiBhbmQgc2Vl
IGl0IGJvb3RzIChub3QgY3JlYXRpbmcNCj4gZG9tYWluKS4NCj4gPiA+ID4+IEhvd2V2ZXIuLi4g
SEFTX01QVSBpcyBub3QgZGVmaW5lZCBhbmQgSSB3YXMgZXhwZWN0aW5nIG1tLmMgdG8gYmUNCj4g
PiA+ID4+IG1vZGlmaWVkIHRvIGNhdGVyIHRoZSBNUFUgc3VwcG9ydC4gU28gSSBhbSBhIGJpdCBl
bnN1cmUgd2hhdCB0aGUNCj4gc2VyaWVzDQo+ID4gPiA+PiBpcyBhY3R1YWxseSBkb2luZy4NCj4g
PiA+ID4+DQo+ID4gPiA+DQo+ID4gPiA+IFRoZXNlIDExIHBhdGNoZXMgYXJlIHBhcnQjMSBvZiBz
dGFnZSMxLCB0aGUgZnVsbCBzdGFnZSMxIGhhcyBhYm91dA0KPiAzMA0KPiA+ID4gPiBwYXRjaGVz
LiBXZSBoYXZlIHNvbWUgY29uY2VybnMgaWYgd2Ugc2VuZCBzbyBtYW55IHBhdGNoZXMgYXQgb25j
ZSwNCj4gdGhlDQo+ID4gPiA+IHJldmlldyBwcmVzc3VyZSBvZiBtYWludGFpbmVycyBtYXkgYmUg
dmVyeSBoaWdoLCBzbyB3ZSBvbmx5IGNob29zZQ0KPiBhYm91dA0KPiA+ID4gPiAxMCB0byBzZW5k
IGFzIHBhcnQgb2YgaXQuIEJ1dCB0aGlzIGFsc28gbWVhbnMgdGhhdCB3ZSBjYW4ndCBkbyBhDQo+
ID4gPiByZWxhdGl2ZWx5DQo+ID4gPiA+IGNvbXBsZXRlIHRoaW5nIGluIHRoaXMgcGFydCMxIHNl
cmllcy4NCj4gPiA+ID4NCj4gPiA+ID4gV2Ugd2FudCB0byBoZWFyIHNvbWUgc3VnZ2VzdGlvbnMg
ZnJvbSB5b3UgdG8gbWFrZSBzbyBtYW55IHBhdGNoZXMNCj4gY2FuIGJlDQo+ID4gPiA+IFJldmll
d2VkIGVmZmljaWVudGx5LiBDYW4gd2Ugc2VuZCB0aGUgcGF0Y2hlcyBieSBzdGFnZXMsIGV2ZW4g
dGhlDQo+ID4gPiBzdGFnZSMxDQo+ID4gPiA+IHdpbGwgaGF2ZSBhYm91dCAzMCBwYXRjaGVzPw0K
PiA+ID4NCj4gPiA+IDMwIHBhdGNoZXMgaW4gYSBnbyBpcyBubyB0b28gYmFkLiBJIHdvdWxkIHBl
cnNvbmFsbHkgcHJlZmVyIHRoYXQNCj4gYmVjYXVzZQ0KPiA+ID4gYXQgbGVhc3QgSSBoYXZlIGJl
dHRlciBpZGVhIG9mIHRoZSBzaGFwZSBvZiB0aGUgY29kZSBhZnRlciBzdGFnZSMxIGFuZA0KPiA+
ID4gYWxzbyBwb3NzaWJseSB0ZXN0IGl0IChJIG5lZWQgdG8gY2hlY2sgaWYgSSBoYXZlIGFjY2Vz
cyBmb3IgdGhlIEFSTXY4LQ0KPiBSDQo+ID4gPiBtb2RlbCkuDQo+ID4gPg0KPiA+DQo+ID4gSSBh
bHNvIHByZWZlciB0byB0aGlzIHdheS4gQWZ0ZXIgd2UgaGF2ZSBhZGRyZXNzZWQgdGhlIGNvbW1l
bnRzIGluDQo+ID4gdGhpcyBzZXJpZXMsIHdlIHdpbGwgc2VuZCB0aGUgZnVsbCBzdGFnZSMxIHBh
dGNoZXMgdG9nZXRoZXIgaW4gdjIuDQo+IA0KPiANCj4gT25lIHN1Z2dlc3Rpb24gdG8gbWFrZSB0
aGluZ3MgZWFzaWVyIHRvIHJldmlldyBhbmQgdG8gY29tbWl0IGlzIHRvDQo+IG9yZ2FuaXplIHRo
ZSBzZXJpZXMgaW4gYSB3YXkgc28gdGhhdCB0aGUgZmlyc3QgMTAgcGF0Y2hlcyBjYW4gc3RpbGwg
YmUNCj4gY29tbWl0dGVkIGZpcnN0IGluZGVwZW5kZW50bHksIGV2ZW4gaWYgYWxsIDMwIHBhdGNo
ZXMgYXJlIHNlbnQgdG9nZXRoZXIuDQo+IA0KDQpJIHRoaW5rIHRoaXMgaXMgZm9yZXNlZWFibGUs
IGFuZCB3ZSBoYXZlIGRvbmUgaW4gdGhpcyB3YXkgaW50ZXJuYWxseS4NCkV2ZXJ5IHBhdGNoIGNh
biBiZSBidWlsdCBhbmQgd2lsbCBub3QgYnJva2VuIG90aGVyIGFyY2hpdGVjdHVyZXMuDQoNCj4g
T3IgYWx0ZXJuYXRpdmVseSBvbmx5IHNlbmQgMTAgcGF0Y2hlcyBidXQgYWxzbyBhZGQgYSBsaW5r
IHRvIGENCj4gZ2l0aHViL2dpdGxhYiB0cmVlIHdpdGggYWxsIHRoZSAzMCsgcGF0Y2hlcyBzbyB0
aGF0IG1haW50YWluZXJzIGNhbiBoYXZlDQo+IGEgbG9vayBob3cgdGhlIHdob2xlIHdvcmsgZml0
IHRvZ2V0aGVyLg0KPiANCg0KSW4gdGhpcyBzZXJpZXMgd2UgaGF2ZSBsaW5rZWQgdGhlIGdpdGxh
YiBicmFuY2ggd2l0aCB0aGUgZnVsbCBwYXRjaGVzLg0KDQo+IEkgdGhpbmsgd2UgYXJlIGFsbCBv
biB0aGUgc2FtZSBwYWdlIC0tIEkganVzdCB3YW50ZWQgdG8gaGlnaGxpZ2h0IHRoYXQNCj4gd2Ug
ZG9uJ3QgaGF2ZSB0byBmaW5pc2ggdGhlIHJldmlldyBvZiBhbGwgMzAgcGF0Y2hlcyBiZWZvcmUg
d2UgY2FuIHN0YXJ0DQo+IGNvbW1pdHRpbmcgc29tZSBvZiB0aGUgaW5pdGlhbCBwYXRjaGVzIGlu
IHRoZSBzZXJpZXMuDQo+IA0KDQpZZXMsIEkgYWdyZWUgd2l0aCBpdC4gQW5kIGFib3ZlIHNvbHV0
aW9ucyBhcmUgb2sgZm9yIHVzLiBUaGVyZSB3aWxsIG5vdA0KYmUgbXVjaCBkaWZmZXJlbmNlIGlu
IGVmZm9ydHMgZm9yIHRoZXNlIHR3byB3YXlzIGZvciB1cywgc28gaWYgeW91IGd1eXMNCnRoaW5r
IHdoaWNoIG1ldGhvZCBpcyB0aGUgbW9zdCBlZmZpY2llbnQsIEkgd2lsbCBmb2xsb3cgaXQuDQoN
CkNoZWVycywNCldlaSBDaGVuDQoNCj4gQ2hlZXJzLA0KPiANCj4gU3RlZmFubw0K

