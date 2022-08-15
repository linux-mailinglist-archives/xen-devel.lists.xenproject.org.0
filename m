Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3072B59278F
	for <lists+xen-devel@lfdr.de>; Mon, 15 Aug 2022 03:36:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.386904.622929 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNP25-0000qg-Ab; Mon, 15 Aug 2022 01:36:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 386904.622929; Mon, 15 Aug 2022 01:36:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNP25-0000nJ-7M; Mon, 15 Aug 2022 01:36:45 +0000
Received: by outflank-mailman (input) for mailman id 386904;
 Mon, 15 Aug 2022 01:36:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Zthq=YT=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1oNP23-0000nB-Dk
 for xen-devel@lists.xenproject.org; Mon, 15 Aug 2022 01:36:43 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80050.outbound.protection.outlook.com [40.107.8.50])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b70dd57d-1c3a-11ed-924f-1f966e50362f;
 Mon, 15 Aug 2022 03:36:42 +0200 (CEST)
Received: from AS9PR06CA0550.eurprd06.prod.outlook.com (2603:10a6:20b:485::11)
 by GV2PR08MB8196.eurprd08.prod.outlook.com (2603:10a6:150:7c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.27; Mon, 15 Aug
 2022 01:36:29 +0000
Received: from AM7EUR03FT021.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:485:cafe::31) by AS9PR06CA0550.outlook.office365.com
 (2603:10a6:20b:485::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.16 via Frontend
 Transport; Mon, 15 Aug 2022 01:36:29 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT021.mail.protection.outlook.com (100.127.140.243) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5525.11 via Frontend Transport; Mon, 15 Aug 2022 01:36:28 +0000
Received: ("Tessian outbound 2af316122c7a:v123");
 Mon, 15 Aug 2022 01:36:28 +0000
Received: from c736debfd267.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 094D319C-76BF-4E2B-AEB4-2B4D42BD1098.1; 
 Mon, 15 Aug 2022 01:36:23 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c736debfd267.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 15 Aug 2022 01:36:23 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by AM6PR08MB4584.eurprd08.prod.outlook.com (2603:10a6:20b:90::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16; Mon, 15 Aug
 2022 01:36:20 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::5d27:806b:5d1f:f63]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::5d27:806b:5d1f:f63%2]) with mapi id 15.20.5504.027; Mon, 15 Aug 2022
 01:36:20 +0000
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
X-Inumbo-ID: b70dd57d-1c3a-11ed-924f-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Dz4+W5JwG7JAZzh4mizsH1ZW0CyapJiAK85cwJi2V+MNRCyc/Nw2B6W7CNwibUkb8c+vuBnylDuDPSJiMnf0Yl+JtLdbLpRwMLW8DuIr5ATQbTR0epbcyOZSd7BJI3pXmUZ8QPgfRrBRhjjxBBh1HzyOxb3/g2qOa34hPOqH6zdprvamxLQRd1TRV219+B0EW2D3ugufyKWjSwV6Vjzh+FOFoBig+GT5X5WWyEY+yVU5kbJrJZSHFYvno6Yihxqvco/7XRsmaSI2kNCHDmHsCkERzL/ppgeENEbmg224aNukIigs2/hCPv6mJL6VBHdJ0vFxeghtPoXCl17DIuUbbA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MD9AcI6josYGeCEXq7jU3pVCX60dvpLBxZ8R8+chxXE=;
 b=b/F2GHnbtAdmiJn85/ajUyoks12POaBhGrtFsMeKWLzIg4rsmxzNMDTTv9l9Lz196SnP4qcv+EDRarGailURTTPdIxtOb95/zbAhsN2dBOtXH8f32z4Sp1ctz5wDPHEaByq+W1CbcUFb4v1e6wNuW55ZjAwAz1GRMKCKnG1RIc1UzS8BxFJhFdf3QUWi9TbxQlbhR19r9SipsNtYnDMmeKMVtzDtaM59On6Qvd98aTvik2irVWHme1w/eIvEIxGquEtaW1QuuYnkyGKnA7EI5XANPekKwKyLEqDNOPvPGnlzBjSG5bzB2q9ZsGlvdk8e2V5N/T6d1Y6atT3F6OWs3Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MD9AcI6josYGeCEXq7jU3pVCX60dvpLBxZ8R8+chxXE=;
 b=3Q5A7eSRGwfafaYi4++14OQnAeMWP+kPhHkuQelOcZw4mtZ95DdI+GmMFo/YoYcWCRbRT/6E4MSw7k52881zG8fa25mYoOzTkisUEGa2L+8q3qjeYq/22UMXnR5GV6jcBqKQI9m/XKbc/pBCpYRu/ZkiXGBhw02qx4pwA5nCc+U=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=becSCRteeFBhrzDXkznofgoYbwAJKG+FyH7oCB/B9oowedY3Dz6SkLMwq8PjFX72dCBpwyzFtPscXwhP45SonorzyEUBOo6/tEGB2MNMnBHxkAgs70LDlNrk3lLPm/AeuuxXct5jhgnDFmeHKzhQhqQoBp4CmEaxi+pN+e84pkD19jQTy0x5xlbnScECF4VpWhcS01/oG7aG4+ZjHJ2wjiOa7vWCO51qU6o+7C8xbKGFKMNYVp+Z9Ccoy2yMfzXZP7z+RTIRsr3hwx/wAKjpnRoBWsWKvhEV0snpx0gAb+iEPBcSeizSeHAiJENZISisHslDZagBY5cGxMloG9KjHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MD9AcI6josYGeCEXq7jU3pVCX60dvpLBxZ8R8+chxXE=;
 b=Sma5kT+se81Bq613TGsAmwi181BKtM7O3fQOADoWWDqZeIq4ywIhexYMVSHdAYG6JfWWJQMXEAABQat6kxaMg4VvyRMWw3mO3ta424tcAuIC8Ju9w8OceowiW0OO/LdlVExHVAHH2xOp2HWTKjL0SXMbQQ2EHbW84oXhBK/7f8tL5/VFUntJN7jiDmj47Z1IpQNG8bHbl9wBd8xvRjeiUZVmPjvksOznGaauMXsVrfRQbuii1BtK7mvFuKODxp1BB/NV5crihlsZwyPw/eHlyZ8QaWxOj1xm+zB24tv0bGnazLPTq+CiFHJ1GGmdRCtvP7HKZ6VHC0lXAddszcy7nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MD9AcI6josYGeCEXq7jU3pVCX60dvpLBxZ8R8+chxXE=;
 b=3Q5A7eSRGwfafaYi4++14OQnAeMWP+kPhHkuQelOcZw4mtZ95DdI+GmMFo/YoYcWCRbRT/6E4MSw7k52881zG8fa25mYoOzTkisUEGa2L+8q3qjeYq/22UMXnR5GV6jcBqKQI9m/XKbc/pBCpYRu/ZkiXGBhw02qx4pwA5nCc+U=
From: Wei Chen <Wei.Chen@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Julien Grall <jgrall@amazon.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH 1/7] xen/arm64: head: Don't set x22 and update the
 documentation
Thread-Topic: [PATCH 1/7] xen/arm64: head: Don't set x22 and update the
 documentation
Thread-Index: AQHYroFIQn9s3NohHEWvCLSRgBfZSa2vMCzQ
Date: Mon, 15 Aug 2022 01:36:19 +0000
Message-ID:
 <PAXPR08MB7420AF7171C65086D4BDDF019E689@PAXPR08MB7420.eurprd08.prod.outlook.com>
References: <20220812192448.43016-1-julien@xen.org>
 <20220812192448.43016-2-julien@xen.org>
In-Reply-To: <20220812192448.43016-2-julien@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 9F25CA698164754C96E6C8D2EA0DC862.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: a63aa50d-9974-4506-293a-08da7e5e9359
x-ms-traffictypediagnostic:
	AM6PR08MB4584:EE_|AM7EUR03FT021:EE_|GV2PR08MB8196:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 oQ3yPStyzp/t46xq+xtjn721PxaMGRGTEkBh0hWvuOlkmrGm+sYMQn7W/+AP4K8keEgN7nkOlFtXc9X4wWyzUQPNIUAkv5aSuTs7yl/BSqpyYLNaRp6dYjAW/enoSuSTITxx/snUAB0HD9PP2dx3kBZyX+PftyAz2AILZSoKN6/M3uGMnkvr4l2U/R2R0DrEsGhPaXPEPBnsVQDwUoRrJSoYjinG3y4bf+RDRCEeMfXkCLhlpmelcj2fUqtKC1gPRaHkcosOxh4+c63E3Mjz6bgj6MUi69igev+hVZ7yJYDNU0UwPgugyI5qmXht7JJN1NMQhBFOe4hwgvAYXSqnmG0ywqF/dREmFRowHV8zXSFgd3215oRd28SR3saei6TwhZzGJ7wIMnGT4aVVaqfpBwLSHmQn3OC6FDBOqIMMr5feCMfnBRNEByC/cEm+Oyc2flTZs65n0dg3kwdxCQvh1aTP8yN41re2rrJVdme37wKoKGwUefHQQqE+i5fX2f5Uh0+k0lIk5LJPOHGw6SK7EhoC2unStf3GUA/OOqGlVRxCXYIFG34ndq2nvgecDQc5u/oan3C4ArpkcpQvPUnDrHll82FIdevi4IBKd0vlY6047QKELoTYsTefPivCfeRs+7vWn9m2dU4e0d5GEIv0WsL/9n2vvrpp6dktJHrtg+l6NIXrjjquvzu+uzuopmr4pd7I/lq/gF8vkH6iw58Yg1fa/Ix+NxEzk3bkms23L1gSOMLtx9HZGDs2o7GodnFrP1jZYcCtncTpY7QGzjjtaTOCKSI9opBerZPK8oTPcxGb3nrwJlkuMIuud/W1pSna
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(366004)(346002)(376002)(396003)(39860400002)(26005)(478600001)(33656002)(8936002)(83380400001)(8676002)(9686003)(71200400001)(186003)(110136005)(316002)(54906003)(64756008)(4326008)(66556008)(76116006)(66476007)(66946007)(66446008)(52536014)(55016003)(15650500001)(5660300002)(2906002)(41300700001)(6506007)(53546011)(7696005)(38070700005)(38100700002)(86362001)(122000001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4584
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a292f4c0-1f54-4ee1-d095-08da7e5e8dea
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YFEWRfhBVoAnfXMRTncCQYP4R87BQ2ne85FIEQrLd4Zjs3iG3zmzQlKjIrMMUIKj7ANEBJT4i5E1VWT7KiFKFJWs8H7F8EXUPMhNBdRLETK7Y8/jqLucr2go2d+38iC3QUf+EXoyazsAKRcyDqEv8vNH1gqDEFu0eCtuR9tmtno1r2T7oUwk/fJJEpXoWD91SosNbesSjsOKPnaoeDkiEDm8OVl6VuQ7CSTGaQBmrtLDwlUJQdijmXrxNInt2drJSSjJIq51rQ+UwjA1XpVDDQioMXIx49wR4iMBPHoWARC7heZyxb4YTxIUwWNsnykV7lDMWZ4HHIgiqwmaVO4SjPfaZRwipf+hqpUrSvnfvda+Bd78H01rxtf4lGhHPz7V4NuypK6n0gvja6fKGSSRm8IWv5U+rf91U4j6DQuIaFz2QBdwluqwAjtj2gdln486RYzMdfVWsy6Y8ZQBIjf1MMYTwjx962nRDJC7eyer1NNoRr9nJ/hg4Tiq3Kz7p/xidwbSQ8aqCoGhTZs05FxvGIg2TFHb/TRKaE0Wm2hKN3f3QDl2wiM1wO1EQ7Z+eGNKZ/9roSrdVnKMENXh3m+xM2AtW1NrCnT/nPULQeiBJrXEf86J/WbRX1SuW0S+dpK2dxf2Qx4lJ+mdPnmMjYOFEhnEnAV35oAqAHVYsV6QhuqGShkpiAvhv3BYUpwEksN6mV8HE2kjNeW4WdTR/ZVU8+XsR3JIjlqi5y98IjfjC4KPzeoOzfDPRsOgR0ybtfOW8WMgNUaW8JLnVCKmVsDL0A==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(396003)(136003)(346002)(376002)(36840700001)(46966006)(36860700001)(81166007)(82740400003)(83380400001)(47076005)(186003)(107886003)(336012)(9686003)(53546011)(7696005)(6506007)(26005)(41300700001)(478600001)(54906003)(82310400005)(316002)(55016003)(40480700001)(4326008)(86362001)(8676002)(110136005)(70586007)(70206006)(15650500001)(2906002)(33656002)(356005)(52536014)(5660300002)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2022 01:36:28.9841
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a63aa50d-9974-4506-293a-08da7e5e9359
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8196

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFhlbi1k
ZXZlbCA8eGVuLWRldmVsLWJvdW5jZXNAbGlzdHMueGVucHJvamVjdC5vcmc+IE9uIEJlaGFsZiBP
Zg0KPiBKdWxpZW4gR3JhbGwNCj4gU2VudDogMjAyMsTqONTCMTPI1SAzOjI1DQo+IFRvOiB4ZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCj4gQ2M6IGp1bGllbkB4ZW4ub3JnOyBKdWxpZW4g
R3JhbGwgPGpncmFsbEBhbWF6b24uY29tPjsgU3RlZmFubyBTdGFiZWxsaW5pDQo+IDxzc3RhYmVs
bGluaUBrZXJuZWwub3JnPjsgQmVydHJhbmQgTWFycXVpcyA8QmVydHJhbmQuTWFycXVpc0Bhcm0u
Y29tPjsNCj4gVm9sb2R5bXlyIEJhYmNodWsgPFZvbG9keW15cl9CYWJjaHVrQGVwYW0uY29tPg0K
PiBTdWJqZWN0OiBbUEFUQ0ggMS83XSB4ZW4vYXJtNjQ6IGhlYWQ6IERvbid0IHNldCB4MjIgYW5k
IHVwZGF0ZSB0aGUNCj4gZG9jdW1lbnRhdGlvbg0KPiANCj4gRnJvbTogSnVsaWVuIEdyYWxsIDxq
Z3JhbGxAYW1hem9uLmNvbT4NCj4gDQo+IFNpbmNlIGNvbW1pdCA3ZTE0YTQ3ZTdjNzMgKCJ4ZW4v
YXJtNjQ6IGhlYWQgUmV3b3JrIGFuZCBkb2N1bWVudA0KPiBsYXVuY2goKSIpLCB0aGUgYm9vdCBj
b2RlIGlzIHNldHRpbmcgeDIyIGJ1dCBub3QgcmVhZCBpdC4NCj4gDQo+IFNvIHJlbW92ZSB0aGUg
dHdvIGluc3RydWN0aW9ucyBzZXR0aW5nIHgyMiBhbmQgdXBkYXRlIHRoZSBkb2N1bWVudGF0aW9u
DQo+IHRvIHNob3cgeDIyIGhhcyBubyBzcGVjaWZpYyBwdXJwb3NlLg0KPiANCj4gU2lnbmVkLW9m
Zi1ieTogSnVsaWVuIEdyYWxsIDxqZ3JhbGxAYW1hem9uLmNvbT4NCj4gLS0tDQo+ICB4ZW4vYXJj
aC9hcm0vYXJtNjQvaGVhZC5TIHwgNiArLS0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgNSBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0v
YXJtNjQvaGVhZC5TIGIveGVuL2FyY2gvYXJtL2FybTY0L2hlYWQuUw0KPiBpbmRleCAxYmFiY2M2
NWQ3YzkuLjI2Y2M3NzA1ZjU1NiAxMDA2NDQNCj4gLS0tIGEveGVuL2FyY2gvYXJtL2FybTY0L2hl
YWQuUw0KPiArKysgYi94ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5TDQo+IEBAIC03MSw3ICs3MSw3
IEBADQo+ICAgKiAgeDE5IC0gcGFkZHIoc3RhcnQpDQo+ICAgKiAgeDIwIC0gcGh5cyBvZmZzZXQN
Cj4gICAqICB4MjEgLSBEVEIgYWRkcmVzcyAoYm9vdCBjcHUgb25seSkNCj4gLSAqICB4MjIgLSBp
c19zZWNvbmRhcnlfY3B1DQo+ICsgKiAgeDIyIC0NCj4gICAqICB4MjMgLSBVQVJUIGFkZHJlc3MN
Cj4gICAqICB4MjQgLQ0KPiAgICogIHgyNSAtDQo+IEBAIC0zMDUsOCArMzA1LDYgQEAgcmVhbF9z
dGFydF9lZmk6DQo+ICAjZW5kaWYNCj4gICAgICAgICAgUFJJTlQoIi0gQm9vdCBDUFUgYm9vdGlu
ZyAtXHJcbiIpDQo+IA0KPiAtICAgICAgICBtb3YgICB4MjIsICMwICAgICAgICAgICAgICAgIC8q
IHgyMiA6PSBpc19zZWNvbmRhcnlfY3B1ICovDQo+IC0NCj4gICAgICAgICAgYmwgICAgY2hlY2tf
Y3B1X21vZGUNCj4gICAgICAgICAgYmwgICAgY3B1X2luaXQNCj4gICAgICAgICAgYmwgICAgY3Jl
YXRlX3BhZ2VfdGFibGVzDQo+IEBAIC0zNDUsOCArMzQzLDYgQEAgR0xPQkFMKGluaXRfc2Vjb25k
YXJ5KQ0KPiAgICAgICAgICBhZHIgICB4MTksIHN0YXJ0ICAgICAgICAgICAgIC8qIHgxOSA6PSBw
YWRkciAoc3RhcnQpICovDQo+ICAgICAgICAgIHN1YiAgIHgyMCwgeDE5LCB4MCAgICAgICAgICAg
LyogeDIwIDo9IHBoeXMtb2Zmc2V0ICovDQo+IA0KPiAtICAgICAgICBtb3YgICB4MjIsICMxICAg
ICAgICAgICAgICAgIC8qIHgyMiA6PSBpc19zZWNvbmRhcnlfY3B1ICovDQo+IC0NCj4gICAgICAg
ICAgbXJzICAgeDAsIG1waWRyX2VsMQ0KPiAgICAgICAgICBsZHIgICB4MTMsID0ofk1QSURSX0hX
SURfTUFTSykNCj4gICAgICAgICAgYmljICAgeDI0LCB4MCwgeDEzICAgICAgICAgICAvKiBNYXNr
IG91dCBmbGFncyB0byBnZXQgQ1BVIElEICovDQo+IC0tDQo+IDIuMzcuMQ0KPiANCg0KUmV2aWV3
ZWQtYnk6IFdlaSBDaGVuIDxXZWkuQ2hlbkBhcm0uY29tPg0KDQo=

