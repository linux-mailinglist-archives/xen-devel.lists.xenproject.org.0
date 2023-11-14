Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FBB17EB45C
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 17:04:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.632862.987378 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2vtS-0008DO-C2; Tue, 14 Nov 2023 16:04:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 632862.987378; Tue, 14 Nov 2023 16:04:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2vtS-0008Ag-8x; Tue, 14 Nov 2023 16:04:02 +0000
Received: by outflank-mailman (input) for mailman id 632862;
 Tue, 14 Nov 2023 16:04:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hHxF=G3=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1r2vtQ-00088o-FR
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 16:04:00 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on062d.outbound.protection.outlook.com
 [2a01:111:f400:fe02::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6abe86be-8307-11ee-9b0e-b553b5be7939;
 Tue, 14 Nov 2023 17:03:57 +0100 (CET)
Received: from AM6PR04CA0005.eurprd04.prod.outlook.com (2603:10a6:20b:92::18)
 by AS8PR08MB6246.eurprd08.prod.outlook.com (2603:10a6:20b:296::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Tue, 14 Nov
 2023 16:03:55 +0000
Received: from AM1PEPF000252DA.eurprd07.prod.outlook.com
 (2603:10a6:20b:92:cafe::35) by AM6PR04CA0005.outlook.office365.com
 (2603:10a6:20b:92::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31 via Frontend
 Transport; Tue, 14 Nov 2023 16:03:55 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM1PEPF000252DA.mail.protection.outlook.com (10.167.16.52) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7002.13 via Frontend Transport; Tue, 14 Nov 2023 16:03:55 +0000
Received: ("Tessian outbound 8289ea11ec17:v228");
 Tue, 14 Nov 2023 16:03:54 +0000
Received: from b82e24b52005.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B31F5954-2EEA-49A3-BF9A-F3D610168EDA.1; 
 Tue, 14 Nov 2023 16:03:43 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b82e24b52005.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 14 Nov 2023 16:03:43 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by VI0PR08MB10539.eurprd08.prod.outlook.com (2603:10a6:800:208::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.29; Tue, 14 Nov
 2023 16:03:40 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::8da:b5c2:b334:838]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::8da:b5c2:b334:838%6]) with mapi id 15.20.6977.029; Tue, 14 Nov 2023
 16:03:40 +0000
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
X-Inumbo-ID: 6abe86be-8307-11ee-9b0e-b553b5be7939
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=fBiWvvrdrIdaSWW6NKlRNeoe/crkBLqkCR0JEe8pDv2d2EtknVVnUl6Ou7PKlGWvOjMjqgLQSw12AxVCcVtKdvYIhBog7feW7zrHNYCmVGgiyE8zGJIYnuSR1gDfldiUez80sPdhh2vrXjCEIfHLBv7Hya349t7H0wIhV9nLv5+Ulz8fUCX1KfXUDgiUj0o67Jz555IcqrkJ0vq0J3LTOS6X/54HJL8Qjwr4JY+Zl7M3Cl5KvqWFR+gyWsJ6Gx8i7M9YJGOyxT89ta+iC4ijaJJYWbOJTUEpA4qFsbh9m73FmHmkzAWVKJvuIJStKYDX8uyZ9Ca6Ss6W2WaDM+5yeA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q2x7SbHi+JvtDG46pn1lpw73/oSkfZQhpe1S0pa1yEA=;
 b=Jl8u5W0hgXH1L0gHsJswVPtOE4pp39sRK+vqsJu3/h38jGCZGFVJP0YY/VZouMCEq3mxx70ZZ9yVRhm9v7Xf3iAVDglv3b7YJl/6WsCBgdiPpiAaUtKGGCbH2G1hdl/5wc+BOQcRzA8VAgXS7Sifi6RvzL6fJBujzGEk9cLcZTMvpHSdbA2O/aGN5h50EJMmJJboPpskwHM/TSCMKGAwxkgge//v/RfA3hF4pATpSQq5VtWNCVsI8mscrk4Htf5ojKRtL1I5b0z61B3s04nKRrmZdhA1CCOHrMY0dxAuiibbQQ/i5ARxwoiBDBAXucqckA64IU/Lx3PsV0i/zH6i4Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q2x7SbHi+JvtDG46pn1lpw73/oSkfZQhpe1S0pa1yEA=;
 b=8H0dyRI40bh3pA2dEolRAIMLvuPfzhCerucLqfxzeXTgFawMr3W9/EdXpLYdj5wxRLS7niJnXEbs5TJVG8mTJMeXM4dDznsDYAijZNElizW2z3nxAeshaFD7ewqmsEPad4slouZDLMpjDMyr5VMiqvYgYpgvx+wHRJLVZcAiT6E=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6fcca6e0abc59b90
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UKC2GLQI0IkDLskLL/53s58vT8SmPaPAo4lq7UG9DOCSSup+rvqDEg1PNUPiQRPsIVSSsd4AST1XOordpCs10v3rdOxIURi5thQPEkACzXuWWfWNUQtxlT2eOPZ4vSaxCQXVvzNvkFlGV48+11dJSu6I7gkHWuVtD87Lev4FfpKYfQgHGWHFV+PAkMNt6CbCjTE8RdqQn3qazHXP8Mcz4dmpCXxM56aLY67M5Sv2UQ26YELLowfY2cARr58XA1eZ/jMkeZnTPTwzUxNNwkQIUgnRGxgIOT0OpolOgm25G01MPHG/Ikuh/dZJtltEIr3o6nhJkTsHUlxWQiy8t2KzSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q2x7SbHi+JvtDG46pn1lpw73/oSkfZQhpe1S0pa1yEA=;
 b=iNdWmIOGmF2nfswLg5RJpFxIM/XFY7iMBcONe9DUj/6Dl4ma/GoI9bN/40y/UoYEb1uNanelKU92fW8ube8djYxja8/tQMet8A/ZfS/6bGU4C6vXr7b0SwpIFBgi0G3VwfONeEgcQjfajgRh8EnP3gWpRxsAs+9CmOIKYprUgrJqzWp9TgQmSZ9VjEq9e+UwSBpcUKXT6Q14gaBTfHoYqd7Db69zGo5BUt6OO4uYisySd+xMiSMnRVwI9+2YKFNGPmVdapZOsOYGafLk8zwFoaxBsE9QBLv8khSMnQjxlsweGTVkE0expTw3cYzHZVYIb3K4OBVnUhZX8qewi6ElsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q2x7SbHi+JvtDG46pn1lpw73/oSkfZQhpe1S0pa1yEA=;
 b=8H0dyRI40bh3pA2dEolRAIMLvuPfzhCerucLqfxzeXTgFawMr3W9/EdXpLYdj5wxRLS7niJnXEbs5TJVG8mTJMeXM4dDznsDYAijZNElizW2z3nxAeshaFD7ewqmsEPad4slouZDLMpjDMyr5VMiqvYgYpgvx+wHRJLVZcAiT6E=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Michal Orzel <Michal.Orzel@amd.com>,
	George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Alejandro
 Vallejo <alejandro.vallejo@cloud.com>
Subject: Re: Clang-format configuration discussion - pt 1
Thread-Topic: Clang-format configuration discussion - pt 1
Thread-Index:
 AQHaEild8psuTSSrb0SmQq+9AXKRR7B4JX+AgABAHYCAABLFAIABeZyAgAAQ0ICAAAEYAA==
Date: Tue, 14 Nov 2023 16:03:40 +0000
Message-ID: <89CF09D5-58CB-49BD-9585-43978CCCC65D@arm.com>
References: <174FCBBC-3C2F-47E9-936A-F1399DD9AFFB@arm.com>
 <930d7aa7-7573-97d2-e146-ebe68214c0aa@suse.com>
 <7235E3F4-8387-49D7-A3B6-0EA93CAE408B@arm.com>
 <30a94519-c622-6017-2cbf-35690114d49e@suse.com>
 <31A47242-54F9-42D4-B804-6D0A0392650C@arm.com>
 <530df892-42f4-4c2f-a8c9-23dbb6e6e2b2@suse.com>
In-Reply-To: <530df892-42f4-4c2f-a8c9-23dbb6e6e2b2@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|VI0PR08MB10539:EE_|AM1PEPF000252DA:EE_|AS8PR08MB6246:EE_
X-MS-Office365-Filtering-Correlation-Id: 1077d0ed-2a84-4d96-fcd9-08dbe52b4d91
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 LWahpJ4+7kR6EBFgLzvhMc8USJBY5ykiif2OQ5jostLt5ilnkov34YBpKutGxN43RHhfD9pW1HlTyRzSgC2HO8qVW76TdmJsJr8e/Gh0bs1LJADQJbb6eDmDci2YWXD59e49kp7UGTYA2J4ZmNb0m+8S82vwaHc/pp3v7oq2OzGJUljha0x7QFDMHJdM8FeaOlcZlG4M6XbWRVZ6olG9FEwMl1UnhdB4GHYiXgzzrdZwPhejEeVV4Am6U4FQN++MMkMXWacfm/t7+OOfcj2EH5js49ehkZ5NvsBxx4/sgxnRL8KW6w8maNwIRXIXXmoXUNQoBdlgc/EqluaMd0cYzni+OBH69Dt0imSMqk6Zt6pW6dPxMVpZm1fYhc/ohju1y2fG674J3ad5F4E03qA60oFQIafdgLYNxarOI/Qftv1ovJ91lSvwnXDleQRWp7sxwCJtTI/sKHo+y4PNwVoPZ62RqOr0yGW6kLA0OJHOsZ0nkg6X1p0ttosAqpLAy19ZKQrROjbEyUt1r6SQ/4iQm18lAsMYJyyjL6OHrPYhr2boTN81qfQUeK+HbAo3Rp6IX9eVY6d+vJzvaAsdkDw/WgM1zjksrp/eZnbbDE29/NPxktiHBlvV8ExeoNZMyOiEgl1XQQ2W+MVk7id4Esa2qw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(376002)(366004)(39860400002)(136003)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(54906003)(66556008)(66476007)(6512007)(66946007)(316002)(6916009)(76116006)(83380400001)(38100700002)(64756008)(66446008)(91956017)(8676002)(8936002)(4326008)(6486002)(478600001)(122000001)(36756003)(6506007)(53546011)(7416002)(86362001)(5660300002)(71200400001)(2616005)(38070700009)(2906002)(26005)(33656002)(41300700001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <EAA528DB7FF25B4A8007E50FE99F5847@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB10539
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM1PEPF000252DA.eurprd07.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	940972d1-e665-4cf0-e708-08dbe52b44e6
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rGOBLoWR6nlvLfUB4h4FY8nm4crCriBgTik0hIEBOglEWCGOVyPzE8JIZZMany6EajV6EqFbiHpSVVLDFcKvOJ4vi6DELzkigB2Yq9M57j5FLh6io8HSxf8uuJd+XgHN+deOjaNjaRck/bRHATzypH84N+xeDa2SIwwkLkrJf5K0o6qjRAwllF3gET761KTTbqzrp8VRtvKHSoAqTaLUkI9GxoAGo9qNBJpAQrHBaBzqWSckxuW5FPlhJDqhK1LiKLamiUTKaWzQUBQ+LbZH8A69Kqzb4HH+5qof2Xq3VzGJ4lBi42evshVVNXZH6NMpbuwVJLZB5yiXQ2FkU3OzT0Wpw4WRj/QGzk9Ks5c/3VTI+ehUQiveLkoKSzh0pBJAWwJgifxv2UtybV/eO3sQtrG31jLqAi9YWo46r5AEQPQ0wLE2amkyaY+45+hULfyIxEibYvJVaN2cYFje+l8Ll1g1DPQWR/IXmbNd4oFxsWtYCGJBJjsld+rP557lrwPODnwpBQITfpWrC46ZLf8aHZV36gkjrY03Ik8QIHnFJ13mcL2Zsj54Rj70CjR1swezlMRseW+5ui5xxFAa9eVTMbyNk0IpBnG7jNnRuWJMUQ6U15G6DE4x4tXrtKAN6Y6K6YFNL9rChqJWsKF4DiqhAcZ6Om95OcMoCpMLU07IceP2qdIw4daKogUjd6aryYpOA55y28IBUB8OtOUipsQG5TvM/XcO2csRxVlHlzC8c7aD/hWFVMYQn4Q8IzRKrnpK
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(376002)(136003)(39860400002)(346002)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(82310400011)(46966006)(36840700001)(40470700004)(6512007)(26005)(82740400003)(107886003)(40460700003)(2616005)(336012)(6486002)(478600001)(36756003)(8936002)(86362001)(4326008)(8676002)(6862004)(5660300002)(41300700001)(33656002)(2906002)(54906003)(70206006)(70586007)(316002)(53546011)(6506007)(40480700001)(47076005)(356005)(36860700001)(81166007)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2023 16:03:55.0199
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1077d0ed-2a84-4d96-fcd9-08dbe52b4d91
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM1PEPF000252DA.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6246

DQoNCj4gT24gMTQgTm92IDIwMjMsIGF0IDE1OjU5LCBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOg0KPiANCj4gT24gMTQuMTEuMjAyMyAxNTo1OSwgTHVjYSBGYW5jZWxsdSB3
cm90ZToNCj4+IA0KPj4gDQo+Pj4gT24gMTMgTm92IDIwMjMsIGF0IDE2OjI3LCBKYW4gQmV1bGlj
aCA8amJldWxpY2hAc3VzZS5jb20+IHdyb3RlOg0KPj4+IA0KPj4+IE9uIDEzLjExLjIwMjMgMTY6
MjAsIEx1Y2EgRmFuY2VsbHUgd3JvdGU6DQo+Pj4+PiBPbiAxMyBOb3YgMjAyMywgYXQgMTE6MzEs
IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4gd3JvdGU6DQo+Pj4+PiBPbiAwOC4xMS4y
MDIzIDEwOjUzLCBMdWNhIEZhbmNlbGx1IHdyb3RlOg0KPj4+Pj4gLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4+Pj4+PiANCj4+Pj4+PiBTdGFuZGFyZDogQysr
MDMNCj4+Pj4+PiANCj4+Pj4+PiAtLS0NCj4+Pj4+PiBGcm9tIHRoZSBkb2N1bWVudGF0aW9uOiBQ
YXJzZSBhbmQgZm9ybWF0IEMrKyBjb25zdHJ1Y3RzIGNvbXBhdGlibGUgd2l0aCB0aGlzIHN0YW5k
YXJkLg0KPj4+Pj4gDQo+Pj4+PiBTaW5jZSBJIGNvbnRpbnVlIHRvIGJlIHB1enpsZWQgLSBpaXJj
IHlvdSBzYWlkIHRoaXMgaXMgYmVjYXVzZSBvZiBsYWNrDQo+Pj4+PiBvZiBhdmFpbGFiaWxpdHkg
b2YgIkM5OSIgYXMgYSB2YWx1ZSBoZXJlLiBXaGF0J3MgZW50aXJlbHkgdW5jbGVhciB0bw0KPj4+
Pj4gbWUgaXM6IEhvdyBkb2VzIHRoaXMgbWF0dGVyIHRvIGEgdG9vbCBjaGVja2luZyBjb2Rpbmcg
c3R5bGUgKHdoaWNoIGlzDQo+Pj4+PiBsYXJnZWx5IGFib3V0IGZvcm1hdHRpbmcsIG5vdCBhbnkg
bGV4aWNhbCBvciBzeW50YWN0aWNhbCBhc3BlY3RzKT8NCj4+Pj4+IA0KPj4+Pj4+IFRoaXMgdmFs
dWUgaXMgdXNlZCBhbHNvIGluIExpbnV4Lg0KPj4+Pj4gDQo+Pj4+PiBDb25zaWRlcmluZyBob3cg
ZGlmZmVyZW50IHRoZSB0d28gc3R5bGVzIGFyZSwgSSBkb24ndCB0aGluayB0aGlzIGlzDQo+Pj4+
PiBvdmVybHkgcmVsZXZhbnQuDQo+Pj4+IA0KPj4+PiBPaywgbWF5YmUgSSB1bmRlcnN0YW5kIHlv
dXIgcG9pbnQsIHlvdSBhcmUgbG9va2luZyBmb3IgYSByZWFzb24gdG8gZGVjbGFyZSB0aGlzIGNv
bmZpZ3VyYWJsZSBpbnN0ZWFkDQo+Pj4+IG9mIG5vdCBzcGVjaWZ5aW5nIGl0IGF0IGFsbD8NCj4+
PiANCj4+PiBOb3QgcmVhbGx5LCBuby4gSGVyZSBJIHdhcyBtZXJlbHkgc2F5aW5nIHRoYXQgd2l0
aCB0aGUgc3R5bGVzIGJlaW5nDQo+Pj4gc3VmZmljaWVudGx5IGRpZmZlcmVudCwgd2hhdCBMaW51
eCB1c2VzIGlzIHByb2JhYmx5IG5vdCB2ZXJ5IHNpZ25pZmljYW50DQo+Pj4gZm9yIG91ciBvd24g
ZGVjaXNpb24uDQo+Pj4gDQo+Pj4+IElmIGl04oCZcyB0aGF0LCBmcm9tIHdoYXQgSSB1bmRlcnN0
YW5kIGNsYW5nLWZvcm1hdCB3aWxsIHVzZSB0aGUgZGVmYXVsdCB2YWx1ZSBpZiB3ZSBkb27igJl0
IHNwZWNpZnkgYW55dGhpbmcNCj4+Pj4gZm9yIHRoaXMgb25lLCBzbyBpdCB3aWxsIHRha2Ug4oCY
TGF0ZXN04oCZLiBJIHRoaW5rIHdlIHNob3VsZCBwdXQgYSB2YWx1ZSBmb3IgdGhpcyBvbmUgdG8g
Zml4IGl0IGFuZCBkb27igJl0IGhhdmUNCj4+Pj4gc3VycHJpc2VzIGlmIHRoYXQgYmVoYXZpb3Vy
IGNoYW5nZXMgYW5kIHNlZWluZyB0aGF0IGFsc28gaW4gTGludXggdGhhdCB2YWx1ZSBpcyBmaXhl
ZCBpbmNyZWFzZWQgbXkNCj4+Pj4gY29uZmlkZW5jZS4NCj4+Pj4gDQo+Pj4+IEhvd2V2ZXIsIGlm
IHlvdSBmZWVsIHRoYXQgd2Ugc2hvdWxkIG5vdCBzcGVjaWZ5IGl0LCBJ4oCZdmUgZG9uZSBhIHRl
c3QgYW5kIG5vdCBzcGVjaWZ5aW5nIGl0IGlzIG5vdCBjaGFuZ2luZw0KPj4+PiB0aGUgY3VycmVu
dCBvdXRwdXQuIEkgY2Fu4oCZdCBzYXkgdGhhdCBmb3IgYSBkaWZmZXJlbnQgY2xhbmctZm9ybWF0
IHZlcnNpb24gdGhvdWdoIG9yIGlmIGNoYW5nZXMgaGFwcGVuIGluIHRoZQ0KPj4+PiBmdXR1cmUu
DQo+Pj4gDQo+Pj4gSXQncyBmaW5lIHRvIHNldCB2YWx1ZXMuIEFsbCBJJ20gc2F5aW5nIGlzIHRo
YXQgYXQgbGVhc3QgSSB3b3VsZCBwcmVmZXINCj4+PiBpZiBpdCB3YXMgYWxzbyBjbGVhciB3aGF0
IGV4YWN0IGVmZmVjdCB0aGUgc2V0dGluZyBvZiBhIHZhbHVlIGhhcywNCj4+PiBlc3BlY2lhbGx5
IHdoZW4gdGhhdCBkb2VzIG5vdCByZWFsbHkgbWF0Y2ggdGhlIGxhbmd1YWdlIHdlIHVzZSBpbiB0
aGUNCj4+PiBwcm9qZWN0Lg0KPj4gDQo+PiBZZXMgSSBhZ3JlZSwgSSB0aGluayBBbGVqYW5kcm/i
gJlzIHJlcGx5IHRvIHRoaXMgY29uZmlndXJhYmxlIHJlZmxlY3RzIG15IHRob3VnaHRzIGFib3V0
IGl0Lg0KPj4gDQo+PiBTbyBpZiB3ZSBhbGwgYWdyZWUgdGhhdCB3ZSBzaG91bGQgc2V0IHRoaXMg
cGFyYW1ldGVyLCBkbyB3ZSBhbGwgYWdyZWUgdGhhdCBpdCBzaG91bGQgYmUgdGhlDQo+PiB2YWx1
ZSBhYm92ZT8NCj4+IA0KPj4gRG8geW91IGhhdmUgb3RoZXIgY29uY2VybnMgcmVnYXJkaW5nIHRo
aXMgb3IgdGhlIG90aGVyIHBhcmFtZXRlcnMgaW4gdGhpcyB0aHJlYWQ/DQo+IA0KPiBJIGRpZCBy
YWlzZSB3aGF0IHdhcyBvY2N1cnJpbmcgdG8gbWUuIFRoaXMgZG9lc24ndCBtZWFuIHRoYXQgZG93
biB0aGUNCj4gcm9hZCB5ZXQgc29tZXRoaW5nIGVsc2UgbWlnaHQgbm90IHBvcCB1cC4NCg0KU3Vy
ZSwgdGhhbmtzIGZvciByYWlzaW5nIHlvdXIgY29uY2VybiwgSeKAmXZlIGFza2VkIHNvIHRoYXQg
YXQgdGhlIGRlYWRsaW5lIGlmIG5vIG90aGVyIGNvbmNlcm4NCmFyZSByYWlzZWQsIHdlIGNhbiBt
b3ZlIG9uIHdpdGggYW5vdGhlciBzZXQgb2YgY29uZmlndXJhYmxlIHRvIGRpc2N1c3MuDQoNCg0K
DQo=

