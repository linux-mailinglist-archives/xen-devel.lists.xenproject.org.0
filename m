Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A766225E6
	for <lists+xen-devel@lfdr.de>; Wed,  9 Nov 2022 09:53:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.440735.694880 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osgoj-0003Wu-CP; Wed, 09 Nov 2022 08:52:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 440735.694880; Wed, 09 Nov 2022 08:52:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osgoj-0003Uc-9R; Wed, 09 Nov 2022 08:52:17 +0000
Received: by outflank-mailman (input) for mailman id 440735;
 Wed, 09 Nov 2022 08:52:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zIzN=3J=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1osgoh-0003UW-N2
 for xen-devel@lists.xenproject.org; Wed, 09 Nov 2022 08:52:15 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20070.outbound.protection.outlook.com [40.107.2.70])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ce05eec1-600b-11ed-91b5-6bf2151ebd3b;
 Wed, 09 Nov 2022 09:52:14 +0100 (CET)
Received: from AS9PR06CA0487.eurprd06.prod.outlook.com (2603:10a6:20b:49b::12)
 by DB9PR08MB7400.eurprd08.prod.outlook.com (2603:10a6:10:370::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.11; Wed, 9 Nov
 2022 08:52:09 +0000
Received: from AM7EUR03FT022.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:49b:cafe::b8) by AS9PR06CA0487.outlook.office365.com
 (2603:10a6:20b:49b::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27 via Frontend
 Transport; Wed, 9 Nov 2022 08:52:09 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT022.mail.protection.outlook.com (100.127.140.217) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5813.12 via Frontend Transport; Wed, 9 Nov 2022 08:52:08 +0000
Received: ("Tessian outbound 2ff13c8f2c05:v130");
 Wed, 09 Nov 2022 08:52:08 +0000
Received: from 273ea141b46c.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 EAD57D85-61BD-47D9-8AA7-1E9EA37297DD.1; 
 Wed, 09 Nov 2022 08:52:02 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 273ea141b46c.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 09 Nov 2022 08:52:02 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by DB9PR08MB6522.eurprd08.prod.outlook.com (2603:10a6:10:250::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.11; Wed, 9 Nov
 2022 08:51:59 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::b62d:6e04:1c26:6684]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::b62d:6e04:1c26:6684%6]) with mapi id 15.20.5813.012; Wed, 9 Nov 2022
 08:51:59 +0000
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
X-Inumbo-ID: ce05eec1-600b-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=f4TQs4uSNA5/tAKZVPhdRDqgytAjimSrxE3D5nRx4D4FkTZ1EGugo/gvI2YZ7R9zQ5VVjBBydzFTETNMELJXWjKeWJfHHdSXm+LFhyEHA+37ulgDQ2C2dHrhYHaSUFQOab5LzclUejZ+lTowT14lfdjm3OadMDKhBMKfV607vHcj5Jnk5XYAXMyTATd6FesW18Bd/evQQ3qrG8yQ1cqH9ugpzwMp9nazTh8Ng9uN3CG1+cV0fT9BpTVnTUZgWsmlml017iokJYsxN9fc+g/uEPt/Y7AtQn8WccIlh7qwsRpxdiBKwQJBqBzRNxyT8yoojVRb2ZU1rGsk454AsIGong==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N6hCrj/BCkI13OSrtI5sCVOlvwOyCwZt6T3Umr7LA9A=;
 b=dAAryuNcUevs7yRu1cGFby9WuTU06otqirXzWy2VaGwScZPeLGtYEIZN5uVVHm3zWAmbDMdAetJ02zywEJb77td0NWcNDBUkOhtp1FZNdIXjXLQEhmYJ/NCHA/e7EWpnvx2nxW+q5XQAPfqBuoRWRVUZqv70ncyuN8LHBPi2WWUwu91gfjPdtcZWNvRnlUzUviWohmz5oNruw7IknuH8453udk16H6OiEbMwiVed/8l6wi8hf30MA9EjGayuHsi1ABcr84llM+D1HCJKfETChqDQYgef2PFlfpIszPjrHvD6DySHut71cwlPX3HFv831K9zU1kxb9a3lKXdb+6OzkA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N6hCrj/BCkI13OSrtI5sCVOlvwOyCwZt6T3Umr7LA9A=;
 b=Nih91N0xLFFa0T1Elw7w40i8KGWj4N1iOd2Rz7nkuy9iJTgwHdVnYvS2TwvSCJl/mIg+Tiv1P/6a1EaBASAkwCN5RKO7SscRXJjIw1hvb2MgRDaSqPMSEWjwZkKFOzOEqd7td7y2ZvDUWtl+7iISBIFgbdBU9a0b/ORy63CJvkw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QpFlAFSAShetcajjgSqGYO4+LSbDuNEmTUZCq3hpucRUY9jS8iIFomSWCZTt9WQ23q/izyCvj0FETE6riarcc89hUpBtQgzeThmOHOS/pgHYljpXMkqyaFbcV4B5Z3inINYyFssLLDGz3oqNUb5nqAUjtFnffKmxFcGP0nM2FGx5Y/wof7IeWeUDdTOUUkqM2lZrwu1F03+0qZEp1V+EdgZl1dxUiD0qyDa6e0Bg6fF/W6LPsZYcFGrvkMyUrz0rar0fhiWsM76XkeRRSwD5By9ChIB0osgh27vuMTFOcMBya0G7vZ+rmfXHDJ8hD7efAwlBnQs/drLbtun4ll/H/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N6hCrj/BCkI13OSrtI5sCVOlvwOyCwZt6T3Umr7LA9A=;
 b=aP/YnsO61fzWbo6h1GcHMafMjU2Slhiv8cCdyYWKkAT+RhR38y7dRr9IDzkLx47bqeota6oLRDYYHT4L80MbtnHrVSJzcX0Q0ohqGpZNwLlpeAsOSdfqFJVTvsAdr/OBK4dfeLEb+3FRJ6P8WKK+Befm6oE01O7EZ6c5+VAV8v/QP7LpqwVOruSR5xjzvefCvXngphzJNCEbT7XJjVzHoPfPcf96qVOOrDcKWiSUvWKEasqvy8jGz8CeTm/PuineO8SU9lwyWVQ7F3YzTL/+ndMja3VC7AHiJ08xg471gvgXVJ3+NotZLw9XQZGON+pzpCLJcHLQXH/BISygO1Biag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N6hCrj/BCkI13OSrtI5sCVOlvwOyCwZt6T3Umr7LA9A=;
 b=Nih91N0xLFFa0T1Elw7w40i8KGWj4N1iOd2Rz7nkuy9iJTgwHdVnYvS2TwvSCJl/mIg+Tiv1P/6a1EaBASAkwCN5RKO7SscRXJjIw1hvb2MgRDaSqPMSEWjwZkKFOzOEqd7td7y2ZvDUWtl+7iISBIFgbdBU9a0b/ORy63CJvkw=
From: Wei Chen <Wei.Chen@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: nd <nd@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v7 5/6] xen/x86: move NUMA process nodes nodes code from
 x86 to common
Thread-Topic: [PATCH v7 5/6] xen/x86: move NUMA process nodes nodes code from
 x86 to common
Thread-Index: AQHY5EtSdgmFSeaU8UGG/Ef8aqU5eq41XS4AgAEIj3A=
Date: Wed, 9 Nov 2022 08:51:58 +0000
Message-ID:
 <PAXPR08MB742052EC98548796B21998379E3E9@PAXPR08MB7420.eurprd08.prod.outlook.com>
References: <20221020061445.288839-1-wei.chen@arm.com>
 <20221020061445.288839-6-wei.chen@arm.com>
 <b957bbc9-20a1-fadc-5865-e4a6ff274a93@suse.com>
In-Reply-To: <b957bbc9-20a1-fadc-5865-e4a6ff274a93@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 51E3D4A62DF7E64F96D4B5EED1F4B302.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PAXPR08MB7420:EE_|DB9PR08MB6522:EE_|AM7EUR03FT022:EE_|DB9PR08MB7400:EE_
X-MS-Office365-Filtering-Correlation-Id: f520df7b-f3ac-4064-cf88-08dac22faf33
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 N0OkwOLtAFqlubBiiw0O7c3kTCIkhgFWOK6rpVNOeq92T5DExdy2/y9eyIzGrsm92iz7WbwfO/sDa4/13D5LtWUnvmC34DGk8qhrj/yDnCzkGYa81YJuQwNUNyXHLogAID8QwwTiLagfCzRgELCPBo+X09Ce2OAFCGhMHv77ta2Pk3nGMFufJobNNx2uV8Xz0Fn2K2IqU1mUgynCGDXNg42Qw4QS13tOIs+zbQCqLsTGMN4WCxdu/0RRCzkAlpYPgYdGQxZrgyHnDXaCzGo/aH+KR0+BZkBhZShV1lReGVN16WQG1Ll0YWBtRo3M1/obJIIU+t/ub2bN/IVKdOGno2sSglAF7oodp4J7S9k3p/bXBWq8fB0uZzP1fTlysGuXY9KUWjLY+7QARWcPD+U5KQmuuuQbc9Zdk77AP3gpF3TdnHk+mec4CifRU8IezPADIV/bXJkS9BGmhEJt0d7xmy7fEttSWMwTwxD1gxmFelHNeyfTw/qlIgvuUbLK0KqRNP2j8ZxW6TIYCLHj50D2Ye+0UV3KF2GdRq7TRaSBZTNtAww6nxBlHHQOUXciBglD5iAsMmY26XM4VMI46Kgum/PbpooYCpsr78F/mnDhShPqOVa5pBmcV4MDG+lLznC0V0CV0V3q/SRqJE5T4WAvQxNqFwOWRMg8BD1xbRNUdFFQNfleGqbq8UdsxRPBpcIgiwku4pQSHSkcRmFJoHiZcPd7WM711FSfvBobqLzYccWoNTa6AMk24dod3//KB3g3A01WwX1uBnYP2Of/bgc1qg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(366004)(346002)(39860400002)(376002)(451199015)(66556008)(66946007)(66446008)(6916009)(83380400001)(33656002)(54906003)(38070700005)(8936002)(9686003)(4326008)(2906002)(55016003)(71200400001)(478600001)(8676002)(5660300002)(316002)(52536014)(64756008)(41300700001)(66476007)(186003)(53546011)(26005)(76116006)(38100700002)(7696005)(122000001)(86362001)(6506007);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6522
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	cbaa4f91-2ed0-4918-d674-08dac22fa994
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nmni2HZFTXPCE+GtzTo7Y27YFLS8xQkXcP9NRvkPcwBfLhmmpNuWJQJ/Z8BXh9ilF978ekSE2k1PX9higj4gBDyH23aCR2IUOocUIavADi+VLaihnzTJ9cUBFpK0MwMdHuWXKSlrM3X2lVoWYtoglw0o1H2znjif7sjBpbqyxotBnvE4akENlP3YklClVNzvX7HjMx9NJAdcfhyt/sRKPEbvA5OIC4UUw3L4n3HEqrvr/vDkmhfbze8jbChoBnzPiXmPAPPAvczYweGB/Blw3Nc6El/Dx2ThgShEwZED6j1fz01Ltx+YztsrDKmRqrQK68/K0M/eF6Xz2dCkXlQfuBEUUvTVyHUGLWmQYWrI4H+oe/bP7cJ7+nIyfH6/UqPO1x2MZ14eBfuaOAjj0T9NbSP18Nuwqsy1HCgV0GMYa9ews7yPABblKyzOGh7zuyIZOu69R+n/I2X01IMjg+PRSo0tW5jyAy816bK78/Z4aeGsBdm71kCY+OltrEo/LK4mpW7AKuOMSOaWz2EI9xGZJgoDMVIL4HJuFeldR5akBuBzVRk6F0rpkeeFOCMub+0p3/6vuJxwC4V0s8RboND1j/LqAlrPuOZ+aMLQf+73kc7SjIchgLoz9VFatFlHp2GN0TKWONrw5D2TmwbsM97OcUV9cdk/07jRL80XTntModYmG8tP2DrpG6+QOUrolS8GZqxt3ejaKrQvZdbJDiWbiccAfqzG65erJQrfy/Qdc+O0BnK8DUR/i44ZKJiJz37YQDpg3AfulaCCCQHhyf5AzA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(376002)(39860400002)(396003)(451199015)(46966006)(36840700001)(40470700004)(83380400001)(186003)(336012)(7696005)(316002)(54906003)(6862004)(41300700001)(8936002)(2906002)(36860700001)(9686003)(47076005)(53546011)(6506007)(478600001)(33656002)(26005)(40480700001)(82310400005)(52536014)(55016003)(86362001)(5660300002)(8676002)(81166007)(70586007)(40460700003)(4326008)(356005)(70206006)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2022 08:52:08.4381
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f520df7b-f3ac-4064-cf88-08dac22faf33
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7400

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU2VudDogMjAyMuW5tDEx5pyIOeaXpSAwOjU1DQo+
IFRvOiBXZWkgQ2hlbiA8V2VpLkNoZW5AYXJtLmNvbT4NCj4gQ2M6IG5kIDxuZEBhcm0uY29tPjsg
QW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT47IFJvZ2VyIFBhdQ0KPiBN
b25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPjsgV2VpIExpdSA8d2xAeGVuLm9yZz47IEdlb3Jn
ZSBEdW5sYXANCj4gPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT47IEp1bGllbiBHcmFsbCA8anVs
aWVuQHhlbi5vcmc+OyBTdGVmYW5vDQo+IFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5v
cmc+OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRD
SCB2NyA1LzZdIHhlbi94ODY6IG1vdmUgTlVNQSBwcm9jZXNzIG5vZGVzIG5vZGVzIGNvZGUNCj4g
ZnJvbSB4ODYgdG8gY29tbW9uDQo+IA0KPiA+IG1lbV9ob3RwbHVnIGlzIGFjY2Vzc2VkIGJ5IGNv
bW1vbiBjb2RlIGlmIG1lbW9yeSBob3RwbHVnIGlzDQo+ID4gYWN0aXZhdGVkLiBFdmVuIGlmIHRo
aXMgaXMgb25seSBzdXBwb3J0ZWQgYnkgeDg2LCBleHBvcnQgdGhlDQo+ID4gdmFyaWFibGUgc28g
dGhhdCBvdGhlciBhcmNoaXRlY3R1cmVzIGNvdWxkIHN1cHBvcnQgaXQgaW4gdGhlIGZ1dHVyZS4N
Cj4gPg0KPiA+IEFzIGFzbS9hY3BpLmggaGFzIGJlZW4gcmVtb3ZlZCBmcm9tIGNvbW1vbi9udW1h
LmMsIHdlIGhhdmUgdG8NCj4gPiBtb3ZlIE5SX05PREVfTUVNQkxLUyBmcm9tIGFzbS9hY3BpLmgg
dG8geGVuL251bWEuaCBpbiB0aGlzIHBhdGNoDQo+ID4gYXMgd2VsbC4NCj4gPg0KPiA+IFNpZ25l
ZC1vZmYtYnk6IFdlaSBDaGVuIDx3ZWkuY2hlbkBhcm0uY29tPg0KPiANCj4gVGhlcmUncyBqdXN0
IG9uZSByZW1haW5pbmcgY29uY2VybiBJIGhhdmU6IEkgY29udGludWUgdG8gY29uc2lkZXIgLi4u
DQo+IA0KPiA+IEBAIC0zNDEsMTU5ICsyNDcsMTQgQEAgYWNwaV9udW1hX21lbW9yeV9hZmZpbml0
eV9pbml0KGNvbnN0IHN0cnVjdA0KPiBhY3BpX3NyYXRfbWVtX2FmZmluaXR5ICptYSkNCj4gPiAg
CQlweG0gJj0gMHhmZjsNCj4gPiAgCW5vZGUgPSBzZXR1cF9ub2RlKHB4bSk7DQo+ID4gIAlpZiAo
bm9kZSA9PSBOVU1BX05PX05PREUpIHsNCj4gPiAtCQliYWRfc3JhdCgpOw0KPiA+ICsJCW51bWFf
ZndfYmFkKCk7DQo+ID4gIAkJcmV0dXJuOw0KPiA+IC0JCQkJfQ0KPiA+IC0JCX0gd2hpbGUgKGZv
dW5kICYmIHN0YXJ0IDwgZW5kKTsNCj4gPiAtDQo+ID4gLQkJaWYgKHN0YXJ0IDwgZW5kKSB7DQo+
ID4gLQkJCXByaW50ayhLRVJOX0VSUiAiTlVNQTogTm8gTk9ERSBmb3IgUkFNIHJhbmdlOiAiDQo+
ID4gLQkJCQkiWyUiUFJJcGFkZHIiLCAlIlBSSXBhZGRyIl1cbiIsIHN0YXJ0LCBlbmQgLSAxKTsN
Cj4gPiAtCQkJcmV0dXJuIDA7DQo+ID4gLQkJfQ0KPiA+IC0JfQ0KPiA+IC0JcmV0dXJuIDE7DQo+
ID4gKwludW1hX2Z3X25pZF9uYW1lID0gIlBYTSI7DQo+IA0KPiAuLi4gdGhpcyB0byBiZSBoYXBw
ZW5pbmcgdG9vIGxhdGUuIE5vdCBiZWNhdXNlIEkgY2FuIHNlZSBhIHdheSBmb3IgY3VycmVudA0K
PiBjb2RlIHRvIHVzZSB0aGUgdmFyaWFibGUgZWFybGllciwgYnV0IGJlY2F1c2Ugb2YgdGhlIHJp
c2sgb2YgZnV0dXJlIGNvZGUNCj4gcG90ZW50aWFsbHkgZG9pbmcgc28uIEFmYWljcyBzcmF0X3Bh
cnNlX3JlZ2lvbnMoKSBpcyBjYWxsZWQgcXVpdGUgYSBiaXQNCj4gZWFybGllciwgc28gcGVyaGFw
cyB0aGUgZmllbGQgc2hvdWxkIChhbHNvPykgYmUgc2V0IHRoZXJlLCBwcmVzdW1hYmx5DQo+IGFm
dGVyIGFjcGlfdGFibGVfcGFyc2UoKSBoYXMgc3VjY2VlZGVkLiBJJ3ZlIGluY2x1ZGVkICIoYWxz
bz8pIiBiZWNhdXNlIEkNCj4gdGhpbmsgdG8gYmUgb24gdGhlIHNhZmUgc2lkZSB0aGUgc2V0dGlu
ZyBoZXJlIG1heSB3YW50IGtlZXBpbmcsIGFsYmVpdA0KPiBwZXJoYXBzIG1vdmluZyB1cCBpbiB0
aGUgZnVuY3Rpb24uDQo+IA0KDQpXaGVuIEkgd2FzIGNvbXBvc2luZyB0aGlzIHBhdGNoLCBJIGFs
c28gdGhvdWdodCBjdXJyZW50IHBsYWNlIHRvIGNhbGwgdGhpcw0KIlBYTSIgc2V0dGluZyB3b3Vs
ZCBiZSBhIGxpdHRsZSBsYXRlLiBCdXQgc2luY2UgdGhlcmUgaXMgb25seSBvbmUgZnVuY3Rpb24N
CnRoYXQgdXNlcyB0aGlzIHByZWZpeCByaWdodCBub3csIEkgdGhvdWdodCBpdCB3YXMgYWNjZXB0
YWJsZSBhdCB0aGUgdGltZS4NCkJ1dCBvYnZpb3VzbHkgeW91ciBjb25jZXJucyBtYWtlIHNlbnNl
LCBJIHdpbGwgbW92ZSB0aGlzIGNhbGwgdG8NCnNyYXRfcGFyc2VfcmVnaW9ucyBhZnRlciBhY3Bp
X3RhYmxlX3BhcnNlIGhhcyBiZWVuIGRvbmUgc3VjY2Vzc2Z1bGx5Lg0KDQpDaGVlcnMsDQpXZWkg
Q2hlbg0KDQo+IEphbg0K

