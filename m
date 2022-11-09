Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C0F1622542
	for <lists+xen-devel@lfdr.de>; Wed,  9 Nov 2022 09:26:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.440722.694858 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osgOn-0007Wi-U6; Wed, 09 Nov 2022 08:25:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 440722.694858; Wed, 09 Nov 2022 08:25:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osgOn-0007Tg-R2; Wed, 09 Nov 2022 08:25:29 +0000
Received: by outflank-mailman (input) for mailman id 440722;
 Wed, 09 Nov 2022 08:25:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lI5b=3J=arm.com=Jiamei.Xie@srs-se1.protection.inumbo.net>)
 id 1osgOm-0007Ta-FT
 for xen-devel@lists.xenproject.org; Wed, 09 Nov 2022 08:25:28 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2041.outbound.protection.outlook.com [40.107.20.41])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0e797d04-6008-11ed-91b5-6bf2151ebd3b;
 Wed, 09 Nov 2022 09:25:26 +0100 (CET)
Received: from DB6PR0301CA0077.eurprd03.prod.outlook.com (2603:10a6:6:30::24)
 by PAWPR08MB10117.eurprd08.prod.outlook.com (2603:10a6:102:361::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15; Wed, 9 Nov
 2022 08:25:15 +0000
Received: from DBAEUR03FT040.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:30:cafe::4) by DB6PR0301CA0077.outlook.office365.com
 (2603:10a6:6:30::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.14 via Frontend
 Transport; Wed, 9 Nov 2022 08:25:15 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT040.mail.protection.outlook.com (100.127.142.157) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5813.12 via Frontend Transport; Wed, 9 Nov 2022 08:25:15 +0000
Received: ("Tessian outbound 2ff13c8f2c05:v130");
 Wed, 09 Nov 2022 08:25:15 +0000
Received: from 81fd5d764b4d.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 BD0BC32D-5391-4015-906C-6B590716FBB2.1; 
 Wed, 09 Nov 2022 08:25:04 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 81fd5d764b4d.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 09 Nov 2022 08:25:04 +0000
Received: from AS8PR08MB7696.eurprd08.prod.outlook.com (2603:10a6:20b:523::11)
 by AS8PR08MB6374.eurprd08.prod.outlook.com (2603:10a6:20b:338::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.11; Wed, 9 Nov
 2022 08:25:02 +0000
Received: from AS8PR08MB7696.eurprd08.prod.outlook.com
 ([fe80::d34b:9a50:9e36:20f]) by AS8PR08MB7696.eurprd08.prod.outlook.com
 ([fe80::d34b:9a50:9e36:20f%3]) with mapi id 15.20.5813.012; Wed, 9 Nov 2022
 08:25:02 +0000
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
X-Inumbo-ID: 0e797d04-6008-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=mQ+bMpUWwr9g4Ii8E8QP8hnB2etDho+gsiwTVQZoRTarXufo9BvrAfXF0n9eEuE+V4DfqLBdwpPLdb6+dZY11xqxNZpihXUXlF5Au2s/TqI+0ZJAoD3lQIbS3ilGGbieKeO1kUMyvZ4pwggrf08wk0Cv4RaDFE2Zx/cci4i3RRTfH7mm2SnDlllQTWv1DQI++V7iGr6OdWatZssr7jca0GFWn21MoQzXVrgUO2Pcczjelfdszsiw0TBwE4xg/iqKS6q3DpRqVzOTfBexzTC368VSGH4BWi3R14zKfGlqRs6Si8EIWswfhrH+GfPeNdDALvUMnh7JMyuUOvCnexBPzg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FBZKwRlsIv8VcIZGXvt5p4gypDcXXucJmvXtwmN67hs=;
 b=ambyAMYACh7HBlhwEnaVugTYU4WgOEc/ov06ycI3HDaH1aRBFqgl53MUPgud+2q/8lB3nIgeCuQFL/q5BxfChyX4frs0VfieuneqMFHvFX3rEblmFcIfWl5mhXegWrqDR4IBcFOgrqE1E1PgAhWbZh7+jHimljTkQQYy0UGu0qmQnRUf9ZbjNQBY62exNSIxx4Lrg3kUhZ0OK9ckman2CSD7hw6txpiLi80yI5/NhyhEXRs5Anmhw/eU6fbGMP9W6sYftZkHhrubZvEr2ne4rMLSufjD1YusD0QSlPj/8x9IViZKwSpohxaCF+Rxyu+izayI9OsOJSNX9IAbHei+YQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FBZKwRlsIv8VcIZGXvt5p4gypDcXXucJmvXtwmN67hs=;
 b=dQTHKKvvy0zVA6ManzN6aMCGpHe6Sk4PHyj6/iX0vMaEuFldCGZG+OKeURF9YBtQnXOEXIF27dk6X42uJ0PqxCcN5JCAbGMsLEbIKO/7ousDqNx8qivge1pFw+zYCt9hTAIAvIrbf1ethwH5+CbhlAvkWY5bDB1WON6PGUep7hM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RHdCQNqwnYsX6c6v5t11vUhk8kt5AcrwdPy65dJ8ziNPsShg6MHsX33qS4WUDpHCeMm005n2E0HrOQ04LgtNaX4+CEb6MPgdcZ9Iqqmc0vAHV4LX9e5UZ3cF2iEK4RebeAksCJuqZdXajDJgov4J0PWqp15Y6zBQPMPBZc5FfGahv+2tUHmvjScmwfyWzMZHBDlBhH1LMcACKhlhIPmznBLjJSavqeRMldMVpRwMECRRsxcFp8XC+RnEWYpN9vUhC3GzIfGITb8N99A8ajbjsI9VjyrDg8jcPhWYfbg17+yJ8mgbXhbzubn7ayRlJAmnzF7nxJVPTVMaSjD6Jy3YHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FBZKwRlsIv8VcIZGXvt5p4gypDcXXucJmvXtwmN67hs=;
 b=KgVoqM+/HMUXDUo+zgzNY2sZ8qFKvwF7vfjHKIDLRM+68eDfSv+Co12Cu8vEtaZCX98DN1gIRKkQpNODYaLi+Y8QFUCNSMNJQA1xkUnLb6qboa2+PlP3z48JMpF3wUCIEXxdq/Lqab22fg36lQH1jI+StPBo55NyZJ4I17pDXM/YxxhdcgSvj3y/MhisNVbqwyRcPB2A9NaFK+F/MLIgxXjKelnopi9DchqCzhgKmziWyZCcXkDz6nLvp1QRfm/UQ21Bg/MdxkaxUqQHhOGk5KF9BqYZKRZrptm5gxS+ZhL5SUKyel33i72yGUiNgkirgnmRv1mrXTo3DdtMfNeKKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FBZKwRlsIv8VcIZGXvt5p4gypDcXXucJmvXtwmN67hs=;
 b=dQTHKKvvy0zVA6ManzN6aMCGpHe6Sk4PHyj6/iX0vMaEuFldCGZG+OKeURF9YBtQnXOEXIF27dk6X42uJ0PqxCcN5JCAbGMsLEbIKO/7ousDqNx8qivge1pFw+zYCt9hTAIAvIrbf1ethwH5+CbhlAvkWY5bDB1WON6PGUep7hM=
From: Jiamei Xie <Jiamei.Xie@arm.com>
To: Michal Orzel <michal.orzel@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Chen <Wei.Chen@arm.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	"julien@xen.org" <julien@xen.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>
Subject: RE: Xen Arm vpl011 UART will cause segmentation fault in Linux guest
Thread-Topic: Xen Arm vpl011 UART will cause segmentation fault in Linux guest
Thread-Index: Adj0C3U97KqJOGXWTaWwFEv08mPlLwAAvb+AAAFgduA=
Date: Wed, 9 Nov 2022 08:25:02 +0000
Message-ID:
 <AS8PR08MB7696950216E688E67644CBDB923E9@AS8PR08MB7696.eurprd08.prod.outlook.com>
References:
 <AS8PR08MB76960AFEAA767A12368E83D9923E9@AS8PR08MB7696.eurprd08.prod.outlook.com>
 <00764fe2-f78a-e5db-cb16-903ad1a5ec03@amd.com>
In-Reply-To: <00764fe2-f78a-e5db-cb16-903ad1a5ec03@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: D2358222C976E74188107F13D9B0636A.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7696:EE_|AS8PR08MB6374:EE_|DBAEUR03FT040:EE_|PAWPR08MB10117:EE_
X-MS-Office365-Filtering-Correlation-Id: 7574c5d1-8b09-4b77-a58a-08dac22bedb2
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 MSf79pwXpQEqxVTxNjSogcEzpcW4AeGSurfpxnuBJuweovLudvHWRJotcd/wtIOoCg21OZqG4fuoXG8GdOg0SOKYBvSG1MNFoU/I7MO/FVb0JM4Dn3B1WWtlKWDtVy9t/hKx+U9SHK5L1+gCf/1bgwJtfmAU7kB3URcPvrBs7DaT0uKYTHVtHkOucJpq31PNKVW1ZN9B+geSof/koFvPdWww1i72hzBdSGEbM+jzIuhxlOM6Kn7NIuf/ijzRROtFEG62Vu3GpvrORVLQ2litoL8t4hpqhOOfHfvWPtjOd78XGU7H2ennUISyP8OVuk0HJ7CynGmrp/xiKR0G0SCnT9M09BU8yeYh1ShAq/ug/jC4achTmUgJHuI8hTNk/Y3GnwffDABZvO2QCUhKrgZGoGymLsMs6QHvv1mP6IXCh9byVbdSGiIg8EbykFbE14BgK1HekVXz88Ls1BEZqRD+0tj/YqfqzrdnugGl6/3Xx9h4LJBhkJIdZGBCnLMEVHV61PFcOFZaa4/qCjteqr+3GnUeWjEKna3jrggJ/lrM+Jok0VR8v4VgqkAlIqUaJpy9T7QL9xq1BFcWQy7gzOfZYdQ8oPGwgpxhhLqgZKfmFOtBIJIwCkE5MrsGi4j5GQmZd18WZcsBavBU66lT9a0kZBkcJd9Z8/pZUqFjfAScb+xzMQlwcYchoufBgSXBCgu7PglVyhsGGdL+Au3wXcJW6ivpo2vyBq0EA+VSTK+8cMCeC2DNukC612nLMwDhyWAIestHolzUl3jNVZqmB8ZKMw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(366004)(376002)(136003)(346002)(396003)(451199015)(71200400001)(55016003)(478600001)(66946007)(66476007)(8936002)(52536014)(186003)(4326008)(8676002)(41300700001)(64756008)(38070700005)(110136005)(76116006)(316002)(45080400002)(83380400001)(6506007)(66446008)(53546011)(122000001)(33656002)(66556008)(54906003)(38100700002)(86362001)(7696005)(9686003)(26005)(66899015)(5660300002)(2906002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6374
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	fb5f07eb-e9f0-4f57-c7fd-08dac22be609
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zrF4Xh7Nn/p7Tyh2CYdWa2wF16XGQpzGj5/ktlxdG0ebKFZyIpoBIybJW6rfiu8dRJNn+VGG77dJQfyG2FPKNXoTPfqLc4HZstl0yBp6G8GTd00Kt8HALo7QZaPDz/b/ghKfytnNhczwGTvc3sDpSoDnutNxNQc+a6UHJ0mp1kelE1mnVw4svwNqgb/7i7BddTmkKfRyZQUeRdxJ//IcVa//d1uHfx/em4FqYKZsO1SWg9Wi//EAfcqt2IxyCiHZw2btRoNsR7F9oPUO6cohCZgVxEMk3A34clRqzkR0SFi46/NPVULO1D30OGAdenY76aE5Cm3+cDDE07QGThCVaJsKxAIf2baWPsFT1VkhQU/sAkOkYbtUEZjYZK1h+6XVkZQiSTNPwWx/F+OsFH0ZYxEcXhEcpWbIKMgUji4Rbbvttg/OKXw2L4+15dR/LDEbs6a43BczSjgkPFLCmpg2AxJx74X/w6Zu/HAA3Y756N996ZD/Y54uaDdikFJbrrnTuerRsA3NeCTXAU1KZdezLGCEiQPI0J1FAN+VzGTIuXOokB2ArbCbLWDNuy1UW8JHtXE1LiodHd3pSXkIynehscSc5mn+Yr+avNO/Dh+YKzcvV1YGHgkQJn69NKrz2wufGalfW237oZSUAHPBK6U581HROeGkwjnaUY/2V98rV3pbnAcF0G7mjTz7wbVs1sZifwTZoEwdhO5uk9oHe/hN7efYksGLh0T/HAydD9fbApW9lnt4/rjWp6qh9ylSNiZb76AxQ/uyLdurP22XM9aVIw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(346002)(39860400002)(396003)(451199015)(40470700004)(46966006)(36840700001)(36860700001)(33656002)(66899015)(86362001)(356005)(81166007)(82740400003)(7696005)(47076005)(40480700001)(4326008)(9686003)(55016003)(107886003)(478600001)(40460700003)(26005)(53546011)(83380400001)(2906002)(82310400005)(186003)(8936002)(110136005)(45080400002)(336012)(54906003)(5660300002)(70586007)(8676002)(316002)(41300700001)(6506007)(70206006)(52536014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2022 08:25:15.3636
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7574c5d1-8b09-4b77-a58a-08dac22bedb2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB10117

SGkgTWljaGFs77yMDQoNCkJlbG93IGxvZyBjYW4gYmUgZ290IHdoZW4gc3RhdGluZyB0aGUgbGlu
dXggZ3Vlc3QuIEl0IHNheXMgOWMwOSBpcyBzYnNhLiBBbmQgOWMwOSBpcyBhbHNvIG91dHB1dA0K
IGluIGJvb3Rsb2dkIGVycm9yIG1lc3NhZ2U6IA0KU2VyaWFsOiBBTUJBIFBMMDExIFVBUlQgZHJp
dmVyDQo5YzBiMDAwMC51YXJ0OiB0dHlBTUEwIGF0IE1NSU8gMHg5YzBiMDAwMCAoaXJxID0gMTIs
IGJhc2VfYmF1ZCA9IDApIGlzIGEgUEwwMTEgcmV2Mg0KcHJpbnRrOiBjb25zb2xlIFt0dHlBTUEw
XSBlbmFibGVkDQo5YzA5MDAwMC5zYnNhLXVhcnQ6IHR0eUFNQTEgYXQgTU1JTyAweDljMDkwMDAw
IChpcnEgPSAxNSwgYmFzZV9iYXVkID0gMCkgaXMgYSBTQlNBDQoNCkJlc3Qgd2lzaGVzDQpKaWFt
ZWkgWGllDQoNCg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IE1pY2hh
bCBPcnplbCA8bWljaGFsLm9yemVsQGFtZC5jb20+DQo+IFNlbnQ6IFdlZG5lc2RheSwgTm92ZW1i
ZXIgOSwgMjAyMiAzOjQwIFBNDQo+IFRvOiBKaWFtZWkgWGllIDxKaWFtZWkuWGllQGFybS5jb20+
OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCj4gQ2M6IFdlaSBDaGVuIDxXZWkuQ2hl
bkBhcm0uY29tPjsgQmVydHJhbmQgTWFycXVpcw0KPiA8QmVydHJhbmQuTWFycXVpc0Bhcm0uY29t
PjsganVsaWVuQHhlbi5vcmc7IHNzdGFiZWxsaW5pQGtlcm5lbC5vcmcNCj4gU3ViamVjdDogUmU6
IFhlbiBBcm0gdnBsMDExIFVBUlQgd2lsbCBjYXVzZSBzZWdtZW50YXRpb24gZmF1bHQgaW4gTGlu
dXgNCj4gZ3Vlc3QNCj4gDQo+IEhpIEppYW1laSwNCj4gDQo+IE9uIDA5LzExLzIwMjIgMDg6MjAs
IEppYW1laSBYaWUgd3JvdGU6DQo+ID4NCj4gPg0KPiA+IEhpIGFsbCwNCj4gPg0KPiA+IFdoZW4g
dGhlIGd1ZXN0IGtlcm5lbCBlbmFibGVzIERNQSBlbmdpbmUgd2l0aA0KPiAiQ09ORklHX0RNQV9F
TkdJTkU9eSIsIExpbnV4IEFNQkEgUEwwMTEgZHJpdmVyIHdpbGwgYWNjZXNzIFBMMDExDQo+IERN
QUNSIHJlZ2lzdGVyLiBCdXQgdGhpcyByZWdpc3RlciBoYXZlIG5vdCBiZWVuIHN1cHBvcnRlZCBi
eSB2cGwwMTEgb2YgWGVuLg0KPiBYZW4gd2lsbCBpbmplY3QgYSBkYXRhIGFib3J0IGludG8gZ3Vl
c3QsIHRoaXMgd2lsbCBjYXVzZSBzZWdtZW50YXRpb24gZmF1bHQgb2YNCj4gZ3Vlc3Qgd2l0aCB0
aGUgYmVsb3cgbWVzc2FnZToNCj4gSSBhbSBxdWl0ZSBjb25mdXNlZC4NCj4gVlBMMDExIGltcGxl
bWVudHMgU0JTQSBVQVJUIHdoaWNoIG9ubHkgaW1wbGVtZW50cyBzb21lIHN1YnNldCBvZiBQTDAx
MQ0KPiBvcGVyYXRpb25zIChTQlNBIFVBUlQgaXMgbm90IFBMMDExKS4NCj4gQWNjb3JkaW5nIHRv
IHNwZWMgKFNCU0EgdmVyLiA2LjApLCB0aGUgU0JTQV9VQVJUIGRvZXMgbm90IHN1cHBvcnQgRE1B
DQo+IGZlYXR1cmVzIHNvIFhlbiBjb2RlIGlzIGZpbmUuDQo+IFdoZW4gWGVuIGV4cG9zZXMgdnBs
MDExIGRldmljZSB0byBhIGd1ZXN0LCB0aGlzIGRldmljZSBoYXMgImFybSxzYnNhLXVhcnQiDQo+
IGNvbXBhdGlibGUgYW5kIG5vdCAidWFydC1wbDAxMSIuDQo+IExpbnV4IGRyaXZlciAiYW1iYS1w
bDAxMS5jIiBzaG91bGQgc2VlIHRoaXMgY29tcGF0aWJsZSBhbmQgYXNzaWduIHByb3Blcg0KPiBv
cGVyYXRpb25zIChzYnNhX3VhcnRfcG9wcyBpbnN0ZWFkIG9mIGFtYmFfcGwwMTFfcG9wcykgdGhh
dCBkbyBub3QgZW5hYmxlDQo+IERNQS4NCj4gTWF5YmUgdGhlIGlzc3VlIGlzIHdpdGggeW91ciBj
b25maWd1cmF0aW9uPw0KPiANCj4gfk1pY2hhbA0KPiANCj4gPiBVbmhhbmRsZWQgZmF1bHQgYXQg
MHhmZmZmZmZjMDA5NDRkMDQ4DQo+ID4gTWVtIGFib3J0IGluZm86DQo+ID4gRVNSID0gMHg5NjAw
MDAwMA0KPiA+IEVDID0gMHgyNTogREFCVCAoY3VycmVudCBFTCksIElMID0gMzIgYml0cw0KPiA+
IFNFVCA9IDAsIEZuViA9IDANCj4gPiBFQSA9IDAsIFMxUFRXID0gMA0KPiA+IEZTQyA9IDB4MDA6
IHR0YnIgYWRkcmVzcyBzaXplIGZhdWx0DQo+ID4gRGF0YSBhYm9ydCBpbmZvOg0KPiA+IElTViA9
IDAsIElTUyA9IDB4MDAwMDAwMDANCj4gPiBDTSA9IDAsIFduUiA9IDANCj4gPiBzd2FwcGVyIHBn
dGFibGU6IDRrIHBhZ2VzLCAzOS1iaXQgVkFzLCBwZ2RwPTAwMDAwMDAwMjBlMmUwMDANCj4gPiBb
ZmZmZmZmYzAwOTQ0ZDA0OF0gcGdkPTEwMDAwMDAwM2ZmZmY4MDMsIHA0ZD0xMDAwMDAwMDNmZmZm
ODAzLA0KPiBwdWQ9MTAwMDAwMDAzZmZmZjgwMywgcG1kPTEwMDAwMDAwM2ZmZmE4MDMsIHB0ZT0w
MDY4MDAwMDljMDkwZjEzDQo+ID4gSW50ZXJuYWwgZXJyb3I6IHR0YnIgYWRkcmVzcyBzaXplIGZh
dWx0OiA5NjAwMDAwMCBbIzFdIFBSRUVNUFQgU01QDQo+ID4gTW9kdWxlcyBsaW5rZWQgaW46DQo+
ID4gQ1BVOiAwIFBJRDogMTMyIENvbW06IGJvb3Rsb2dkIE5vdCB0YWludGVkIDUuMTUuNDQteW9j
dG8tc3RhbmRhcmQgIzENCj4gPiBwc3RhdGU6IDYwNDAwMGM1IChuWkN2IGRhSUYgK1BBTiAtVUFP
IC1UQ08gLURJVCAtU1NCUyBCVFlQRT0tLSkNCj4gPiBwYyA6IHBsMDExX3N0b3BfcngrMHg3MC8w
eDgwDQo+ID4gbHIgOiB1YXJ0X3R0eV9wb3J0X3NodXRkb3duKzB4NDQvMHgxMTANCj4gPiBzcCA6
IGZmZmZmZmMwMDk5OWJiYTANCj4gPiB4Mjk6IGZmZmZmZmMwMDk5OWJiYTAgeDI4OiBmZmZmZmY4
MDIzNGFjMzgwIHgyNzogZmZmZmZmODAyMmY1ZDAwMA0KPiA+IHgyNjogMDAwMDAwMDAwMDAwMDAw
MCB4MjU6IDAwMDAwMDAwNDU1ODU0MDEgeDI0OiAwMDAwMDAwMDAwMDAwMDAwDQo+ID4geDIzOiBm
ZmZmZmY4MDIxYmE0NjYwIHgyMjogMDAwMDAwMDAwMDAwMDAwMSB4MjE6IGZmZmZmZjgwMjFhMGUy
YTANCj4gPiB4MjA6IGZmZmZmZjgwMjE5OGY4ODAgeDE5OiBmZmZmZmY4MDIxYTBlMWEwIHgxODog
MDAwMDAwMDAwMDAwMDAwMA0KPiA+IHgxNzogMDAwMDAwMDAwMDAwMDAwMCB4MTY6IDAwMDAwMDAw
MDAwMDAwMDAgeDE1OiAwMDAwMDAwMDAwMDAwMDAwDQo+ID4geDE0OiAwMDAwMDAwMDAwMDAwMDAw
IHgxMzogMDAwMDAwMDAwMDAwMDAwMCB4MTI6IDAwMDAwMDAwMDAwMDAwMDANCj4gPiB4MTE6IDAw
MDAwMDAwMDAwMDAwMDAgeDEwOiAwMDAwMDAwMDAwMDAwMDAwIHg5IDogZmZmZmZmYzAwODcxYmEx
NA0KPiA+IHg4IDogZmZmZmZmYzAwOTlkZTI2MCB4NyA6IGZmZmZmZjgwMjFhMGUzMTggeDYgOiAw
MDAwMDAwMDAwMDAwMDAzDQo+ID4geDUgOiBmZmZmZmZjMDA5MzE1ZjIwIHg0IDogZmZmZmZmYzAw
OTQ0ZDAzOCB4MyA6IDAwMDAwMDAwMDAwMDAwMDANCj4gPiB4MiA6IGZmZmZmZmMwMDk0NGQwNDgg
eDEgOiAwMDAwMDAwMDAwMDAwMDAwIHgwIDogMDAwMDAwMDAwMDAwMDA0OA0KPiA+IENhbGwgdHJh
Y2U6DQo+ID4gcGwwMTFfc3RvcF9yeCsweDcwLzB4ODANCj4gPiB0dHlfcG9ydF9zaHV0ZG93bisw
eDdjLzB4YjQNCj4gPiB0dHlfcG9ydF9jbG9zZSsweDYwLzB4Y2MNCj4gPiB1YXJ0X2Nsb3NlKzB4
MzQvMHg4Yw0KPiA+IHR0eV9yZWxlYXNlKzB4MTQ0LzB4NGMwDQo+ID4gX19mcHV0KzB4NzgvMHgy
MjANCj4gPiBfX19fZnB1dCsweDFjLzB4MzANCj4gPiB0YXNrX3dvcmtfcnVuKzB4ODgvMHhjMA0K
PiA+IGRvX25vdGlmeV9yZXN1bWUrMHg4ZDAvMHgxMjNjDQo+ID4gZWwwX3N2YysweGE4LzB4YzAN
Cj4gPiBlbDB0XzY0X3N5bmNfaGFuZGxlcisweGE0LzB4MTMwDQo+ID4gZWwwdF82NF9zeW5jKzB4
MWEwLzB4MWE0DQo+ID4gQ29kZTogYjkwMDAwODMgYjkwMWYwMDEgNzk0MDM4YTAgOGIwMDAwNDIg
KGI5MDAwMDQxKQ0KPiA+IC0tLVsgZW5kIHRyYWNlIDgzZGQ5M2RmMTVjMzIxNmYgXS0tLQ0KPiA+
IG5vdGU6IGJvb3Rsb2dkWzEzMl0gZXhpdGVkIHdpdGggcHJlZW1wdF9jb3VudCAxDQo+ID4gL2V0
Yy9yY1MuZC9TMDdib290bG9nZDogbGluZSA0NzogMTMyIFNlZ21lbnRhdGlvbiBmYXVsdCBzdGFy
dC1zdG9wLQ0KPiBkYWVtb24NCj4gPiBJbiBYZW4sIHZwbDAxMV9tbWlvX3dyaXRlIGRvZXNuJ3Qg
aGFuZGxlIERNQUNSIC4gQW5kIGtlcm5lbCBkb2Vzbid0DQo+IGNoZWNrIGlmIHBsMDExX3dyaXRl
IGV4ZWN1dGVzIHN1Y2Vzc2Z1bGx5IGluIHBsMDExX2RtYV9yeF9zdG9wIC4gU28gc3VjaA0KPiBz
ZWdtZW50YXRpb24gZmF1bHQgb2NjdXJzLg0KPiA+IHN0YXRpYyBpbmxpbmUgdm9pZCBwbDAxMV9k
bWFfcnhfc3RvcChzdHJ1Y3QgdWFydF9hbWJhX3BvcnQgKnVhcCkNCj4gPiB7DQo+ID4gICAgICAg
ICAvKiBGSVhNRS4gIEp1c3QgZGlzYWJsZSB0aGUgRE1BIGVuYWJsZSAqLw0KPiA+ICAgICAgICAg
dWFwLT5kbWFjciAmPSB+VUFSVDAxMV9SWERNQUU7DQo+ID4gICAgICAgICBwbDAxMV93cml0ZSh1
YXAtPmRtYWNyLCB1YXAsIFJFR19ETUFDUik7DQo+ID4gfQ0KPiA+DQo+ID4gSSB0aGluayB3ZSBz
aG91bGQgcHJldmVudCBzdWNoIHNlZ21lbnRhdGlvbiBmYXVsdC4gV2UgaGF2ZSBjaGVja2VkIHRo
ZQ0KPiBQTDAxMSBzcGVjLCBpdCBzZWVtcyB0aGVyZSBpcyBub3QgYW55IHJlZ2lzdGVyIGJpdCBj
YW4gaW5kaWNhdGUgRE1BIHN1cHBvcnQNCj4gc3RhdHVzIG9mIFBMMDExLiBXZSBtaWdodCBoYXZl
IHR3byBvcHRpb25zOg0KPiA+IDEuIE9wdGlvbiMxIGlzIHRvIGFkZCBETUEgc3VwcG9ydCBmb3Ig
dnBsMDExLCBidXQgdGhpcyBpcyBub3QgdHJpdmlhbC4NCj4gPiAyLiBPcHRpb24jMiBpcyB0byBp
Z25vcmUgdGhlIHdyaXRlIHRvIERNQUNSLCBhbmQgcmV0dXJuIDAgZm9yIERNQUNSIHJlYWQNCj4g
aW4gdnBsMDExLiBCdXQgdGhpcyBvcHRpb24gbmVlZCBjby13b3JrIHdpdGgga2VybmVsLCBiZWNh
dXNlIGN1cnJlbnQgTGludXgNCj4gUEwwMTEgZHJpdmVyIGFzc3VtZSB0aGUgd3JpdGUgb3BlcmF0
aW9uIHdpbGwgbmV2ZXIgYmUgZmFpbGVkLCBhbmQgd2lsbCBub3QNCj4gZmFsbGJhY2sgdG8gbm8t
RE1BIG1vZGUsIHdoZW4gWGVuIHJldHVybiAwIGZvciBETUEgZW5hYmxlZCBiaXQgaW4gRE1BQ1Iu
DQo+ID4NCj4gPiBIb3cgZG8geW91IHRoaW5rIGFib3V0IGl0PyAgQW55IHN1Z2dlc3Rpb24gYWJv
dXQgaXQgaXMgd2VsY29tZS4gVGhhbmtzLg0KPiA+DQo+ID4gQmVzdCB3aXNoZXMNCj4gPiBKaWFt
ZWkgWGllDQo+ID4NCg==

