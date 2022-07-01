Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 483EE563455
	for <lists+xen-devel@lfdr.de>; Fri,  1 Jul 2022 15:26:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.359044.588438 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o7GfL-0004nc-F1; Fri, 01 Jul 2022 13:26:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 359044.588438; Fri, 01 Jul 2022 13:26:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o7GfL-0004lF-C8; Fri, 01 Jul 2022 13:26:35 +0000
Received: by outflank-mailman (input) for mailman id 359044;
 Fri, 01 Jul 2022 13:26:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XPX9=XG=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1o7GfJ-0004l9-V6
 for xen-devel@lists.xenproject.org; Fri, 01 Jul 2022 13:26:34 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00069.outbound.protection.outlook.com [40.107.0.69])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6bcf034f-f941-11ec-bd2d-47488cf2e6aa;
 Fri, 01 Jul 2022 15:26:32 +0200 (CEST)
Received: from DB6P192CA0016.EURP192.PROD.OUTLOOK.COM (2603:10a6:4:b8::26) by
 AM7PR08MB5416.eurprd08.prod.outlook.com (2603:10a6:20b:10e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Fri, 1 Jul
 2022 13:26:30 +0000
Received: from DBAEUR03FT008.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:b8:cafe::27) by DB6P192CA0016.outlook.office365.com
 (2603:10a6:4:b8::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14 via Frontend
 Transport; Fri, 1 Jul 2022 13:26:30 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT008.mail.protection.outlook.com (100.127.142.107) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5395.14 via Frontend Transport; Fri, 1 Jul 2022 13:26:30 +0000
Received: ("Tessian outbound 3c5325c30453:v121");
 Fri, 01 Jul 2022 13:26:30 +0000
Received: from 6a83de522ebb.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0C87525E-E9E4-4009-8968-9FA61688A849.1; 
 Fri, 01 Jul 2022 13:26:18 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6a83de522ebb.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 01 Jul 2022 13:26:18 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AS8PR08MB8158.eurprd08.prod.outlook.com (2603:10a6:20b:54f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.18; Fri, 1 Jul
 2022 13:26:16 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb%5]) with mapi id 15.20.5373.017; Fri, 1 Jul 2022
 13:26:16 +0000
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
X-Inumbo-ID: 6bcf034f-f941-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Vf/zpFKEw+N/1ikkPDYxKoSkKpapxlAVVCJzNW/ke47zhn2vaig0eaiBzR2i6mh1BLMlupjol7aWuRbWnLFuBqxPKGhk25eodsp9u8CKOxppmUFN/y065HSMFFyfxLQye1xYfdbNfDDwff1EX4ZNyz7ABmJBXqCXmJeNFMI4t6xeWrU0iMtPukCCew9W3K8s5BH1siuBuvNCm09RnYvWwfRT99YxRWUJPeWmvc87KUWQLVmt5BzTVGYVOhK97jWX7TS9tS183PKRwPB4tgu4T36KDFi9nnhEtYq1tx4RLKAWn6cWTwFsWcacV45l4rBTsuTHK4Nlj410Zb1ZoXX15g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XD1r2363ZMcUMyaSlz47vbHfCLXF3PDOIa2qfMikFa0=;
 b=mD+vUiz2aolIICRyLy6/TSRFjVXmKOrsh7G07Tw9+5S0XyFDf4bkRu/1/w4f7v5HuT6KjZml/dhSN113WLhJw5Ix85zDRczqtHxILprFeTNE4ptDE1LM3xpQuBh48ftT8pVLwDVUTKcsq83+ISbH7c3EFeDm9/1oHD6f7KdJlsMWiiaI5p230a6D/L17rD7EwqjDcyvRphcOWci4vjXczmTdSdEWe+jMbger0bI12fjP4OiIT39/wPy9A1eaZuxnGOrDfETP93UO3NEtvrBf1eFBff0cvMFW7zKXjuFfzyAGwiYiWAZfuq/JUN+FO0rPoDURlizhSULGfLMCKFbpTA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XD1r2363ZMcUMyaSlz47vbHfCLXF3PDOIa2qfMikFa0=;
 b=sWyOgZth/qjQfTPClQkRcxPt4kzO3wcXmdQKvqvmECiWI31RhpTDSv38VzF2UnwtwMh/q0+GmZYddiRez2yWhnWj3pj984hpdrvLRze6T4wu/2Q4MOH+uBxzT7Iw4KqwlTjyFnfexWvmVoy76WHUvfm3EAv9V38LyXYmsd6vT4k=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: c2ad9bf90fc1ecb7
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ECjL+wO3/NYj80q7wKOWrFniNVXBKUbW8tzADRiI0t5DV/lFXdrgGeQtrYqbL9y3i/D8ER4FTMUbgVZlvdUv3gvk6rfATywIc3dxIhpvLtCfYw/BV1xBYacoOkR/oqNlRHEgQb0Um8CFGAoXyUZoMlWYVfLWn53iEy6V3X3r7XcX6DvyhKu0V7nOoKIwD7/+u8DQIfkwAVjbZC7zyE1SjCmSzk0/F2M84N66VXKwaVzLNg69OEe7t5eJ4F19OcAZ3fcQpgnyLFT4rrbeaqvpHOly9rorvRPwNjhKigi1aTSwUYnkxakhkbHsnq3mpomQ+Sw8qUCY6KIzt6mB8+ThQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XD1r2363ZMcUMyaSlz47vbHfCLXF3PDOIa2qfMikFa0=;
 b=LNL1hFkg5JVFtQg76Lx0k8x6YHhVw4u9V0xdi5PFkar+Tqt6xQpL2wvXP8rQP+mt82MbbZjgvKbigfgpGZttOEF/EuGJ1+VARZ7zaY+tm1nLF0jJWEt1YP8E+PyDTabFYlPcZ6+V/7+DGx89/ePjHZT4JtvMIY8yXA4rSGG64+SvQYIffVwujgByVVBjknwyzdl20KoaPsLfkEAW28NEJ9Pnmskw1X8NTCcJFiDtD/FyL7Y7zfg5paN+1Ldv7IYstvbBtaQWoNqXxKLypjqCKYisNe6Fmi5AwUQpnzcHsFKaxqKZod79sr3KFrAJ80eqJBH9PWD2rNTJLNocaADrSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XD1r2363ZMcUMyaSlz47vbHfCLXF3PDOIa2qfMikFa0=;
 b=sWyOgZth/qjQfTPClQkRcxPt4kzO3wcXmdQKvqvmECiWI31RhpTDSv38VzF2UnwtwMh/q0+GmZYddiRez2yWhnWj3pj984hpdrvLRze6T4wu/2Q4MOH+uBxzT7Iw4KqwlTjyFnfexWvmVoy76WHUvfm3EAv9V38LyXYmsd6vT4k=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Luca Fancellu <Luca.Fancellu@arm.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>, Wei
 Liu <wl@xen.org>, Elena Ufimtseva <elena.ufimtseva@oracle.com>, Tim Deegan
	<tim@xen.org>, Daniel De Graaf <dgdegra@tycho.nsa.gov>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Juergen Gross <jgross@suse.com>, Christian Lindig
	<christian.lindig@citrix.com>, David Scott <dave@recoil.org>
Subject: Re: [XEN PATCH v3 25/25] tools: Remove -Werror everywhere else
Thread-Topic: [XEN PATCH v3 25/25] tools: Remove -Werror everywhere else
Thread-Index: AQHYh+S8oo1uKED1kUSSvOK+OMp/V61mHT4AgACMngCAAO3MAIAA4jeAgAESnoA=
Date: Fri, 1 Jul 2022 13:26:16 +0000
Message-ID: <8D4E96D0-A591-440D-BD1B-E52D7F2283E5@arm.com>
References: <20220624160422.53457-1-anthony.perard@citrix.com>
 <20220624160422.53457-26-anthony.perard@citrix.com>
 <BF28045C-0848-4B5A-8DAB-57192C7B4A18@arm.com>
 <alpine.DEB.2.22.394.2206291019550.4389@ubuntu-linux-20-04-desktop>
 <6CA16D2D-8AD6-415A-A98D-00B27F91C4DA@arm.com>
 <alpine.DEB.2.22.394.2206301348380.4389@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2206301348380.4389@ubuntu-linux-20-04-desktop>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 7d32bca1-a9e1-4105-0a1e-08da5b654ef6
x-ms-traffictypediagnostic:
	AS8PR08MB8158:EE_|DBAEUR03FT008:EE_|AM7PR08MB5416:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 x9UpPwfxqnM2nnWoXDPAWpaaghKuReb8T/4/srMNPuk43lz+aqugsJmKrXruHQQ4J+AC18Km9Jc6MOKNgoCqAxiVX9YSZ0GYdRDlVGtSHwmCtanNk1z69oKc+26PtmIV/ihS/4jMnRiG+sU4am6SU8SdWLGHRDrFxNhdPeGg/T6LsIk9efw2DIruXmqKQ8IGV85v1S8pJ165vOU8O1dlBYAo92P4AN5FHNd7H2yeBS08Wdk2iYscTQFJLjdHsnmAW4vjRXPU1ND9Z1d0kl4k/k2C0EviY/X4YV4GOV7WNVrpRZv+nawzwDzqH4a1vSRkzoq785j87892N2UDWg7SqxCTSscDjbiqKCg9XG0Dld0pYk9t+EZKalnMhlUrTQSYV8HPnGQ/8QDp9MBLFqsKP/eiE93L55GEX5Ry08wBjXUEWXjm3uwbumNbUa6JpNquHc0EnTOfOAcTXuqZACRkQ6NOieshO/FrMUraki3a3D/aC/zuDzp5roe7GrBjbgM7Jo+I7A+vqoZ5WUw7AJvPrieXoDTfwU9nuXynPrBVYWvtLu7zjh4uVLQj+npq+EYqBIV6cfvMsgEynT2ioG7qI/+O6g/0+8jowBIe5THkNO8jK5coa2BQ+2NnKJHwWSOauhr1DK8SH6QJdMdHAMu+DFaf2uqKILv3+WvXOYTi295QZLdzpWi3zxYixG3o1TUWng0aJF4cOFZw3Xt6hSaMOG7YGDT9vDiBHO6gRc0b8R12I5A196E3jBzJSyaSPmOmfV6LSAcOJ4DD+fT92h4twra+qozFTkSfS6vE6fXt/0NJ8cIRL0PGrRnERyFMvqQH8ZMCjjvnRnFMHDscVHTQtvVH+yx1JtdD9mhdX96VjUk=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(39860400002)(396003)(376002)(346002)(136003)(186003)(66446008)(64756008)(38070700005)(86362001)(71200400001)(478600001)(5660300002)(66946007)(66476007)(33656002)(38100700002)(122000001)(4326008)(66556008)(2616005)(8676002)(8936002)(76116006)(6486002)(91956017)(53546011)(7416002)(6916009)(26005)(41300700001)(6506007)(6512007)(36756003)(83380400001)(54906003)(316002)(2906002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <681AE8BA6551D4479F117C2D3D679335@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8158
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c492bd83-feeb-4b58-26b0-08da5b6546bf
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3dSCA3W/Yfyn64MesWSI//qAx5HKbEN9jiloFATsnOEl/vi1HmUKoB4rhJJNG9WpVPCInYvmsItMgJauLhCT537E3nSAnRdImi0UtQ23ARFJZ4Jts6DWzYH5cJFYXv+S+rR7fTzdljknAMdc3fqWKNX3jHaGQAZI8rZvPXBTT05sUnZbj+IyG/d23tqaABTo5UXC/S2WSzSyo+SFQ+1p79HcpOhvHMKevNbwWR6FGBXbt2uP76E4Y/CFuSbZG9xiH0xsTtYiTPyXjeNsI71CKM6pQp8nJLdTswBiYUiO0n+/pbXvv02ymh5UC6rza2H1b15Oel2NQvGOT72Ecv7MaosuhI+dk3calyYwCNum2ZMVoeS1/ZlbhsGxHkdr9j430d7zohioTqfs+eSIZLGfW3v/iNhtK5ywBUs1keKVmx0VphUXzWPxwzkq467Y1xNi0FGSml2vBRSTUCV3JdxndewXZL2dVQdfq95XHmuyuLVICP4ymafkuxUFCC21dEnGRGOvdDd3nT5iNqWM62wuoF4zqTNcBu1VEgQXApnacvB43X5Oyf5vm9Wz4rYs4UJDhWx7g6rr95b+B3IThjuxTirzTB3HCXL8RS5d7rfegudORyTkNsNjXvdcjXjaV7g6+SDBD2rvtOvSkLEalrz9c6uwMQs6oyv1Asw/2ukSgdFgYUgXa+1lPB6RR7ET970Qfx7int4GNBcl/VLRF4dVRPq9dvgTRCvz7gXRKiqhj6Wnlpzo1D77Qn6AIk//sgqu/zk9SqVBOSgl+cbQL3E3FdzqccHYvKLte7urRllkcZcEYGDMMEzcOdoSNoyjpZrU
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(396003)(376002)(39860400002)(346002)(136003)(36840700001)(46966006)(40470700004)(54906003)(36756003)(478600001)(70586007)(6862004)(70206006)(316002)(356005)(8676002)(82740400003)(40460700003)(33656002)(41300700001)(83380400001)(81166007)(336012)(82310400005)(36860700001)(47076005)(2616005)(107886003)(53546011)(6506007)(40480700001)(26005)(6512007)(186003)(86362001)(5660300002)(6486002)(2906002)(8936002)(4326008);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2022 13:26:30.0762
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d32bca1-a9e1-4105-0a1e-08da5b654ef6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5416

SGkgU3RlZmFubywNCg0KPiBPbiAzMCBKdW4gMjAyMiwgYXQgMjI6MDMsIFN0ZWZhbm8gU3RhYmVs
bGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6DQo+IA0KPiBPbiBUaHUsIDMwIEp1
biAyMDIyLCBCZXJ0cmFuZCBNYXJxdWlzIHdyb3RlOg0KPj4+IE9uIDI5IEp1biAyMDIyLCBhdCAx
ODoyMiwgU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPiB3cm90ZToN
Cj4+PiANCj4+PiBPbiBXZWQsIDI5IEp1biAyMDIyLCBMdWNhIEZhbmNlbGx1IHdyb3RlOg0KPj4+
PiArIENDOiBTdGVmYW5vIFN0YWJlbGxpbmkNCj4+Pj4gDQo+Pj4+PiBPbiAyNCBKdW4gMjAyMiwg
YXQgMTc6MDQsIEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPiB3cm90
ZToNCj4+Pj4+IA0KPj4+Pj4gUGF0Y2ggInRvb2xzOiBBZGQgLVdlcnJvciBieSBkZWZhdWx0IHRv
IGFsbCB0b29scy8iIGhhdmUgYWRkZWQNCj4+Pj4+ICItV2Vycm9yIiB0byBDRkxBR1MgaW4gdG9v
bHMvUnVsZXMubWssIHJlbW92ZSBpdCBmcm9tIGV2ZXJ5IG90aGVyDQo+Pj4+PiBtYWtlZmlsZXMg
YXMgaXQgaXMgbm93IGR1cGxpY2F0ZWQuDQo+Pj4+PiANCj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEFu
dGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPg0KPj4+PiANCj4+Pj4gSGkg
QW50aG9ueSwNCj4+Pj4gDQo+Pj4+IEkgd2lsbCB0cnkgdG8gcmV2aWV3IHRoZSBzZXJpZSB3aGVu
IEkgbWFuYWdlIHRvIGhhdmUgc29tZSB0aW1lLCBpbiB0aGUgbWVhbiB0aW1lIEkgY2FuIHNheSB0
aGUgd2hvbGUNCj4+Pj4gc2VyaWUgYnVpbGRzIGZpbmUgaW4gbXkgWW9jdG8gc2V0dXAgb24gYXJt
NjQgYW5kIHg4Nl82NCwgSeKAmXZlIHRyaWVkIGFsc28gdGhlIHRvb2wgc3RhY2sgdG8NCj4+Pj4g
Y3JlYXRlL2Rlc3Ryb3kvY29uc29sZSBndWVzdHMgYW5kIG5vIHByb2JsZW0gc28gZmFyLg0KPj4+
PiANCj4+Pj4gVGhlIG9ubHkgcHJvYmxlbSBJIGhhdmUgaXMgYnVpbGRpbmcgZm9yIGFybTMyIGJl
Y2F1c2UsIEkgdGhpbmssIHRoaXMgcGF0Y2ggZG9lcyBhIGdyZWF0IGpvYiBhbmQgaXQNCj4+Pj4g
ZGlzY292ZXJzIGEgcHJvYmxlbSBoZXJlOg0KPj4+IA0KPj4+IFRoYXQgcmVtaW5kcyBtZSB0aGF0
IHdlIG9ubHkgaGF2ZSBhcm0zMiBYZW4gaHlwZXJ2aXNvciBidWlsZHMgaW4NCj4+PiBnaXRsYWIt
Y2ksIHdlIGRvbid0IGhhdmUgYW55IGFybTMyIFhlbiB0b29scyBidWlsZHMuIEknbGwgYWRkIGl0
IHRvIG15DQo+Pj4gVE9ETyBidXQgaWYgc29tZW9uZSAobm90IG5lY2Vzc2FyaWx5IEx1Y2EpIGhh
cyBzb21lIHNwYXJlIHRpbWUgaXQgY291bGQNCj4+PiBiZSBhIG5pY2UgcHJvamVjdC4gSXQgY291
bGQgYmUgZG9uZSB3aXRoIFlvY3RvIGJ5IGFkZGluZyBhIFlvY3RvIGJ1aWxkDQo+Pj4gY29udGFp
bmVyIHRvIGF1dG9tYXRpb24vYnVpbGQvLg0KPj4gDQo+PiBXZSBoYXZlIG5vdyBhIHdheSB0byBi
dWlsZCBhbmQgcnVuIHhlbiBmb3IgYXJtMzIgb24gcWVtdSB1c2luZyBZb2N0by4NCj4+IFdlIGFy
ZSB1c2luZyB0aGlzIGludGVybmFsbHkgYW5kIGFsc28gd2lsbCB0ZXN0IFhlbiB3aXRoIGd1ZXN0
cyBvbiBhcm0zMiB1c2luZyB0aGlzIHNvb24uDQo+PiANCj4+IEkgYW0gdXBzdHJlYW1pbmcgdG8g
bWV0YS12aXJ0dWFsaXNhdGlvbiBhbGwgdGhlIGZpeGVzIG5lZWRlZCBmb3IgdGhhdCBzbyBpdCBz
aG91bGQgYmUgZmFpcmx5IHN0cmFpZ2h0IGZvcndhcmQgZG8gcmVwcm9kdWNlIHRoaXMgaW4gWW9j
dG8gYnVpbGQgaW4gYSBjb250YWluZXIuDQo+PiANCj4+IFBsZWFzZSB0ZWxsIG1lIHdoYXQgeW91
IG5lZWQgYW5kIEkgd2lsbCB0cnkgdG8gcHJvdmlkZSB5b3UgYSBzZXQgb2Ygc2NyaXB0cyBvciBp
bnN0cnVjdGlvbnMgZG8gcmVwcm9kdWNlIHRoYXQgb24gZ2l0bGFiLg0KPiANCj4gVGhhdCB3b3Vs
ZCBiZSBncmVhdCENCj4gDQo+IFdlIG5lZWQgdHdvIHRoaW5nczoNCj4gDQo+IC0gYSBZb2N0byBi
dWlsZCBjb250YWluZXINCj4gLSBhIGJ1aWxkIHNjcmlwdA0KPiANCj4gDQo+IFRoZSBidWlsZCBj
b250YWluZXIgd291bGQgYmUgc29tZXRoaW5nIGxpa2U6DQo+IGF1dG9tYXRpb24vYnVpbGQvZGVi
aWFuL3Vuc3RhYmxlLWFybTY0djguZG9ja2VyZmlsZS4gSXQgaXMgYSBEb2NrZXJmaWxlDQo+IHRv
IGNyZWF0ZSBhIGNvbnRhaW5lciB3aXRoIFlvY3RvIGFuZCBhbGwgcmVxdWlyZWQgZGVwZW5kZW5j
aWVzLiBJdCBjb3VsZA0KPiBiZSBiYXNlZCBvbiBEZWJpYW4gYXJtNjQuIFRoZSBidWlsZCBjb250
YWluZXIgaXMgb25seSBidWlsdCBvbmNlIGFuZA0KPiBwdXNoZWQgdG8gdGhlIGdpdGxhYiByZWdp
c3RyeSwgYnV0IGl0IGlzIGV4ZWN1dGVkIGV2ZXJ5IHRpbWUgYSBnaXRsYWINCj4gcGlwZWxpbmUg
aXMgc3RhcnRlZC4NCj4gDQo+IFdlIHByb2JhYmx5IHdhbnQgdGhlIG1ldGEgbGF5ZXJzIHRvIGJl
IHB1bGxlZCBhcyBwYXJ0IG9mIHRoZSBidWlsZA0KPiBjb250YWluZXIgYnVpbGQgKGdpdCBjbG9u
ZSBmcm9tIHRoZSBEb2NrZXJmaWxlKSBiZWNhdXNlIG90aGVyd2lzZSB3ZQ0KPiB3b3VsZCBlbmQg
dXAgZ2l0IGNsb2luaW5nIHRoZW0gZXZlcnkgdGltZSB3ZSBydW4gYSBnaXRsYWItY2kgcGlwZWxp
bmUsDQo+IHNsb3dpbmcgZXZlcnl0aGluZyBkb3duLg0KPiANCj4gDQo+IFRoZSBidWlsZCBzY3Jp
cHQgaXMgdGhlIHNjcmlwdCBleGVjdXRlZCBpbiB0aGUgYnVpbGQgY29udGFpbmVyIGZvciBldmVy
eQ0KPiBwaXBlbGluZS4NCj4gDQo+IEltYWdpbmUgeW91IGhhdmUgYSBjb250YWluZXIgInlvY3Rv
LWFybTMyIiwgYmFzaWNhbGx5IHdlIHdhbnQgdG8gZG86DQo+IA0KPiAjIGRvY2tlciBydW4geW9j
dG8tYXJtMzIgYnVpbGQuc2NyaXB0DQo+IA0KPiB3aGVyZSBidWlsZC5zY3JpcHQgaXMgdGhlIHNj
cmlwdCB0aGF0IGFjdHVhbGx5IHRyaWdnZXJzIHRoZSBYZW4gYnVpbGQNCj4gYW5kIHByb2R1Y2Vz
IHRoZSBiaW5hcnkgb3V0cHV0Lg0KPiANCj4gVGhlIGN1cnJlbnQgYnVpbGQgc2NyaXB0IGlzIGF1
dG9tYXRpb24vc2NyaXB0cy9idWlsZDsgaXQgaXMgdXNlZCBmb3IgYWxsDQo+IGJ1aWxkIGNvbnRh
aW5lcnMgKGFsbCBvZiB0aGVtLCBmcm9tIERlYmlhbiB0byBGZWRvcmEgYW5kIEFscGluZSkgYnV0
IGl0DQo+IGlzIHByb2JhYmx5IG5vdCBzdWl0YWJsZSB0byBiZSB1c2VkIGZvciBZb2N0by4gIEl0
IHNpbXBseSBjYWxscw0KPiAuL2NvbmZpZ3VyZTsgbWFrZTsgbWFrZSBpbnN0YWxsLiBJdCBpcyBt
b3JlIGZvciBub3JtYWwgZGlzdHJvcy4NCj4gDQo+IEkgaW1hZ2luZSB0aGF0IHRoZSBidWlsZCBz
Y3JpcHQgZm9yIFlvY3RvIHdvdWxkIGNhbGwgYml0YmFrZS4NCj4gDQo+IA0KPiBXaXRoIHRoZSBi
dWlsZCBjb250YWluZXIgRG9ja2VyZmlsZSBhbmQgdGhlIGJ1aWxkIHNjcmlwdCBpdCBiZWNvbWVz
DQo+IHZlcnkgc2ltcGxlIHRvIGFkZCBZb2N0byBhcm0zMiB0byBnaXRsYWItY2kuDQo+IA0KPiBJ
IHJlYWxpemUgdGhhdCB0aGUgYWN0dWFsIGJ1aWxkIGNvdWxkIGJlIGRvbmUgb24gYm90aCBhcm02
NCBvciB4ODYuDQo+IEN1cnJlbnRseSB0aGUgYXJtMzIgaHlwZXJ2aXNvci1vbmx5IGNyb3NzLWJ1
aWxkIGlzIGRvbmUgb24geDg2LiBTZWUNCj4gYXV0b21hdGlvbi9idWlsZC9kZWJpYW4vdW5zdGFi
bGUtYXJtMzItZ2NjLmRvY2tlcmZpbGUuIEVpdGhlciB3YXkgaXMgT0suDQoNCkkgd2lsbCB3b3Jr
IG9uIHRoYXQgYW5kIEkgdGhpbmsgd2UgY2FuIHRha2UgdGhpcyBkaXNjdXNzaW9uIG9mZmxpbmUg
YXMgdGhlcmUgYXJlIHNvbWUgZWxlbWVudHMgbWlzc2luZyByaWdodCBub3cgKGxpa2Ugd2hlcmUg
aXMgdGhlIHhlbiB0cmVlIHRvIHRlc3QpLg0KDQpDaGVlcnMNCkJlcnRyYW5kDQoNCg0KDQo=

