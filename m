Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D165F0257
	for <lists+xen-devel@lfdr.de>; Fri, 30 Sep 2022 03:46:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.413977.657994 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oe56F-000761-Hh; Fri, 30 Sep 2022 01:45:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 413977.657994; Fri, 30 Sep 2022 01:45:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oe56F-00073C-Ep; Fri, 30 Sep 2022 01:45:59 +0000
Received: by outflank-mailman (input) for mailman id 413977;
 Fri, 30 Sep 2022 01:45:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QDfz=2B=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1oe56D-000733-Rr
 for xen-devel@lists.xenproject.org; Fri, 30 Sep 2022 01:45:58 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70079.outbound.protection.outlook.com [40.107.7.79])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9ffd302d-4061-11ed-964a-05401a9f4f97;
 Fri, 30 Sep 2022 03:45:56 +0200 (CEST)
Received: from AM5PR0602CA0012.eurprd06.prod.outlook.com
 (2603:10a6:203:a3::22) by PAXPR08MB7600.eurprd08.prod.outlook.com
 (2603:10a6:102:23f::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17; Fri, 30 Sep
 2022 01:45:40 +0000
Received: from VE1EUR03FT012.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:a3:cafe::db) by AM5PR0602CA0012.outlook.office365.com
 (2603:10a6:203:a3::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17 via Frontend
 Transport; Fri, 30 Sep 2022 01:45:40 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT012.mail.protection.outlook.com (10.152.18.211) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5676.17 via Frontend Transport; Fri, 30 Sep 2022 01:45:39 +0000
Received: ("Tessian outbound 937eed45f6ed:v128");
 Fri, 30 Sep 2022 01:45:38 +0000
Received: from c60807f225ed.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D7EF0F20-6BD0-49E5-BF29-3268CD2D2F52.1; 
 Fri, 30 Sep 2022 01:45:33 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c60807f225ed.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 30 Sep 2022 01:45:33 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by DBBPR08MB6153.eurprd08.prod.outlook.com (2603:10a6:10:20e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.19; Fri, 30 Sep
 2022 01:45:31 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::6f9a:a2b6:e5d3:349e]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::6f9a:a2b6:e5d3:349e%7]) with mapi id 15.20.5676.017; Fri, 30 Sep 2022
 01:45:31 +0000
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
X-Inumbo-ID: 9ffd302d-4061-11ed-964a-05401a9f4f97
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=F94RCtdB+kJr0FyeDwQ6rNS9UgaVHWfXJdyn1Yo2VpQfihJ1pQ+kUcBirsO4HLIGrHP94pJMH2Wvz2BxkrOCNwc0GeET4HD7pspxnPc05oMvOxNZoUZyrkDBoyqO+xgZq/kyXMS7gCBa4RRE1SleW630VnrvJnSiWUpHLYGOVa6yMyIJNPl16N3uQnuJBJz12qRXRQPLqFiSjRA3g4EomDCfb07k42Q+/rsJuNoOVof5uBrR9Y+6Z9FIJ3HBs8cdgUag7/2C7cawJHl1JZCzR51q3L3pUeFfZM0QQ9fxkC7w9DTbhw9qtiNav6bweR7y+vGmY5T9E1m5U88sg+SkTA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZZAEitwMsMioq+jgAgQnYyC/ecnmIWHIZugmig0g7+8=;
 b=IpsgJGdAlDLuY1nusz6r9t9d8hO0FPpc7mP/6Z9MQb4PFePErf2VpljO34KgQ5GJ2UkytCE/UkVkbVKHdu9y3wRxDjHwe2tv9JSZY1OyoTOkmlvPH8tSndHwU2SXKthq8wYwnNW3JOiT58QCgybz6/VBEs9oeJfASozRqg4ULImhKi3kIZXB0NXcm24iMKrJ4WdB2MVPDjSqQ5a7qK19j6wEGHi8cHf58kV61ZEj6cqAWCS4UYHhnAcSDPro0PWnm9f11x9BcxouUu6UMxEaFXoX+muBn7Goe9MfgSFNO64L5BXID4keNT8aJc6wNKNrEkvT8mILiuNcn8egXXvhbg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZZAEitwMsMioq+jgAgQnYyC/ecnmIWHIZugmig0g7+8=;
 b=fFHO5jMgJbLKxRMTuU2sJpDOkJ0iDe6Sww6C7wNsInUA1OiMEOUuyHNf6k/mkKFaQK3Ay0b0O7q4vwA4aPOKFmLruoapjnQjQM+K+NIePhRhoCC4lIsvi9dnIvx+IRw1m8rAm7+F3nEEeVoQ5DGGY+k4CTUg/ma2YT8n5n/H2C0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DMlIF1jSABlRT6hhFH1pdSCG3LVApvrEG+Q/K/gw/snY3BX0YB+e6oNFx+KwCprEmgzz4BrWAxa6vHqFSJ9VF3KUt/T+LfslHAQtMfrYc68BDPaq8ezTIQNFLYOSbc+8Q1ZfbNkMYpw5BikszOoTCwCi738fY09G/Vgh/4pllMqzqPukpz6EBQ7URvCq8CCIrOnb91y0RUbQwveZoWCAo+HpY0mb+1A+RpvAtk5hSq+yllzS1mN/sCfH6L/EWxKgBXfITM1417YR1MeT94XIVGpM9gN/P9j+TO4rWqUlf2/wZMwGChQ23bDkI64KrzKFZ0clJJQPQx1RIGUeWwnXKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZZAEitwMsMioq+jgAgQnYyC/ecnmIWHIZugmig0g7+8=;
 b=Qgjl57/WCN08TPGOgNw0CgJnQQMPjPCuqbPOwaj/47tcETe+BX1o0Q1ed2/rn7s6869CE9N5IT6hZJdjKpifz/Z4BNjxPc2udyK6KVSWja0AwjbTKlQ8fOHOsmyx2DU5lzd+EJ+I4zTUrr4yALYCUmZByI5b0oYl7zsZUWomjezEPhVUkYbQfHv352oBVv0A5uFhKgCYQ+BNJ9C897copqsyJvNajxMv7TDO/udjg0tfQ6YNQYb/P5KmFo3ZJ59PdVvFJvBui0wlLvMdTusEZjK93HHEMGP6bmou9LrDxMNJb7jagjrGI0lcgOK560yY6G07uIXj7TXoad/KsevLbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZZAEitwMsMioq+jgAgQnYyC/ecnmIWHIZugmig0g7+8=;
 b=fFHO5jMgJbLKxRMTuU2sJpDOkJ0iDe6Sww6C7wNsInUA1OiMEOUuyHNf6k/mkKFaQK3Ay0b0O7q4vwA4aPOKFmLruoapjnQjQM+K+NIePhRhoCC4lIsvi9dnIvx+IRw1m8rAm7+F3nEEeVoQ5DGGY+k4CTUg/ma2YT8n5n/H2C0=
From: Wei Chen <Wei.Chen@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: nd <nd@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v5 2/6] xen/x86: move generically usable NUMA code from
 x86 to common
Thread-Topic: [PATCH v5 2/6] xen/x86: move generically usable NUMA code from
 x86 to common
Thread-Index: AQHYzNEmJs18WyT35kWq9bNIXVbTQ63y+hyAgAMalwCAAEusAIAA4YSw
Date: Fri, 30 Sep 2022 01:45:31 +0000
Message-ID:
 <PAXPR08MB74208C93DBE8F0F4F71086489E569@PAXPR08MB7420.eurprd08.prod.outlook.com>
References: <20220920091218.1208658-1-wei.chen@arm.com>
 <20220920091218.1208658-3-wei.chen@arm.com>
 <359e87d9-aec7-2198-86ab-1d0f76bf567d@suse.com>
 <72691b9b-761e-a89b-97df-afd5cf0ddebb@arm.com>
 <ce60f432-fed5-0fbb-c544-36b767c22130@suse.com>
In-Reply-To: <ce60f432-fed5-0fbb-c544-36b767c22130@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 723DE3EA7D5B6143AEE4F82FD2DE8C57.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PAXPR08MB7420:EE_|DBBPR08MB6153:EE_|VE1EUR03FT012:EE_|PAXPR08MB7600:EE_
X-MS-Office365-Filtering-Correlation-Id: ec4d504e-35ea-4308-8e0d-08daa2857a6f
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 368gDz3DIt1DBRJ+YXpi9maZHm1e/uo8MV5agoFxfFkrOWhwueh/T6wK/OaYOUSP/Dp6WY76wz1cV/7lGzCH9e+aV+VPLrW4y9mDAmxszHA6zO6dMplN8DWV8Z2DThzWvgQ0rIeoY17JEicmYaIa7ndykEEEt2U2LhP2RWcS9/qfHfpTkMxZ5hGt3piENB2ox7hvaI7zQTVTuBEFsXuiEF7LbqXkFJuRVs5kA26oUGUamdO+hFk/25S9664DICWrpSYMUdTK+UNZBhDdaFl4YU7ED8hFrlUUx56oo0qfO0VwFqHCg0FEtMmtoVjktl3v7AupuUhrGKMDJGYPYV2ZctXiPOfM7vEVIrysC4ocA2cmOVz1wBaLnIKwlSrQa2XUOHFYJUlHnuaGZBiKII7fCkIEHf+K4Iz6wB+R4oX0DNxHUAu5breLHNr+0PN+wes+Wmis0PmjOTk/Hs+JxFBG7uRZU+BRAwQ1FAGlMPeZZHabTu7bONoSdQUHtVl9lTmov/qb+9E9CkmzkVGBshJZ5otAixGCCf8DAQnYaicZWHr+uz3+q8y2Yw86kLpWvH9RD8aOM3UMgsfYUaG75TiFTsSGBsGB8X+IeFN4yWB9WXRX0IjaxQWV/elhKF6jQTqgYtsoQ+A+5Tj+SooiB82sLeJQpHW4pV1cHu6MFcvUgdU3L/nHGOodlia2R3GDBFmPY4A7YpKtkPE0un6Hi0PFtnQX6CuyNL3ddvF+d3mj4F6aIgMzBUvsUl82yJ42TgbrJUQAbFRhKDTtORcoiuK7cQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(396003)(39860400002)(346002)(136003)(376002)(451199015)(38100700002)(33656002)(38070700005)(86362001)(122000001)(83380400001)(186003)(2906002)(55016003)(71200400001)(53546011)(7696005)(6506007)(478600001)(9686003)(54906003)(8676002)(5660300002)(41300700001)(316002)(6916009)(52536014)(66446008)(64756008)(66946007)(4326008)(76116006)(66476007)(66556008)(8936002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6153
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	78d8d145-464c-408c-9a2b-08daa28575a8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6oeihYaunJDmBrj6k5STvnXyZPXt743TNPueD4GZgpSOTpBQ6Q7PT6N+LQ737b5aXvo0U8/xN9PaLSzxgRotihwZKIXS/aO2c/melpd1xPr8cVtVJPU7X9ROJvy0GN7b1KawbgjsRsJBYMZc8XEHyYznFBzGvRZMF2p7qc3Cr3JJOjbDurzjmyM6dyuwUMk0QQSV/H9sYbJo/cKsNocED1Zrs/dMTDz+jCwd5fubKLm68BGbs5yBcuWUE7YPrgPrYViCXQ0YTRdixLaH724KxTNQwmJ4qSLyC9XFeyQgtqbSh1mAZn8yzJQTpSH1bNDjRteBop6j8o/xdQuG0118gNJgGLMpStqnCtWtm8DyJkGPh9yMOLsFqtXV7m5EqTL60OiqCwO3Yl07x+Ctdi62Op5fxYEHvjNfZyroUlJ7PJe8mEcIKZQ0BGMBm+B8PUSoQon04ng/uweP46AvWPoZJj82/dr/e1DLpvIFBVbBD4aiXnZZAbVhzmwMJs4WQf71Ao88ShZig94frXVCBZKB81gEOQ9MhIQknU11ITAo64Z2jukj37oWN9SYn2Tbkq/QPcDw2KKAz8Eg/rAKngWWjUrcQblNG38hd9H+0KJUnRlRa6zH7VJZSkI7cubPwtHla6JsIwZA4A9omp4gJ/sTwSHpt7j7EPlL0P1IQGIxbjPWceHH6UjMZ5NmsSDoh2NygYX1Wu0YeLM1CimPoAWcSxqguWlfXvM407u43SMV5C9z4JOrtIIOKrDWNcTXbnTHB28l2hKATVwrxTqsvj+5xQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(39860400002)(376002)(396003)(451199015)(36840700001)(40470700004)(46966006)(36860700001)(81166007)(356005)(82740400003)(40460700003)(55016003)(86362001)(316002)(33656002)(5660300002)(83380400001)(8936002)(2906002)(6862004)(70586007)(52536014)(40480700001)(54906003)(4326008)(41300700001)(8676002)(70206006)(7696005)(82310400005)(186003)(47076005)(6506007)(478600001)(336012)(53546011)(9686003)(26005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2022 01:45:39.3265
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ec4d504e-35ea-4308-8e0d-08daa2857a6f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7600

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU2VudDogMjAyMuW5tDnmnIgyOeaXpSAyMDoxNA0K
PiBUbzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+DQo+IENjOiBuZCA8bmRAYXJtLmNvbT47
IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+OyBSb2dlciBQYXUNCj4g
TW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT47IFdlaSBMaXUgPHdsQHhlbi5vcmc+OyBHZW9y
Z2UgRHVubGFwDQo+IDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+OyBKdWxpZW4gR3JhbGwgPGp1
bGllbkB4ZW4ub3JnPjsgU3RlZmFubw0KPiBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwu
b3JnPjsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFU
Q0ggdjUgMi82XSB4ZW4veDg2OiBtb3ZlIGdlbmVyaWNhbGx5IHVzYWJsZSBOVU1BIGNvZGUNCj4g
ZnJvbSB4ODYgdG8gY29tbW9uDQo+IA0KPiBPbiAyOS4wOS4yMDIyIDA5OjQzLCBXZWkgQ2hlbiB3
cm90ZToNCj4gPiBPbiAyMDIyLzkvMjcgMTY6MTksIEphbiBCZXVsaWNoIHdyb3RlOg0KPiA+PiBP
biAyMC4wOS4yMDIyIDExOjEyLCBXZWkgQ2hlbiB3cm90ZToNCj4gPj4+ICsgICAgICAgIG5vZGVz
X3VzZWQrKzsNCj4gPj4+ICsgICAgICAgIGlmICggZXBkeCA+IG1lbXRvcCApDQo+ID4+PiArICAg
ICAgICAgICAgbWVtdG9wID0gZXBkeDsNCj4gPj4+ICsgICAgfQ0KPiA+Pj4gKw0KPiA+Pj4gKyAg
ICBpZiAoIG5vZGVzX3VzZWQgPD0gMSApDQo+ID4+PiArICAgICAgICBpID0gQklUU19QRVJfTE9O
RyAtIDE7DQo+ID4+DQo+ID4+IElzIHRoaXMgYWN0dWFsbHkgZ29pbmcgdG8gYmUgY29ycmVjdCBm
b3IgYWxsIGFyY2hpdGVjdHVyZXM/IEFpdWkNCj4gPj4gQXJtNjQgaGFzIG9ubHkgdXAgdG8gNDgg
cGh5c2ljYWwgYWRkcmVzcyBiaXRzLCBidXQgd2hhdCBhYm91dCBhbg0KPiA+PiBhcmNoaXRlY3R1
cmUgYWxsb3dpbmcgdGhlIHVzZSBvZiBhbGwgNjQgYml0cz8gSSB0aGluayBhdCB0aGUgdmVyeQ0K
PiA+PiBsZWFzdCB3ZSB3YW50IEJVSUxEX0JVR19PTihQQUREUl9CSVRTID49IEJJVFNfUEVSX0xP
TkcpIGhlcmUuDQo+ID4+DQo+ID4NCj4gPiBPayBJIHdpbGwgYWRkIGFib3ZlIEJVSUxEX0JVR19P
Ti4gQW5kIEkgYWxzbyBoYXZlIHF1ZXN0aW9uIHdoeSBjYW4ndA0KPiA+IHdlIHVzZSBQQUREUl9C
SVRTIGhlcmUgZGlyZWN0bHk/DQo+IA0KPiBXZWxsLCBpZiB5b3UgdXNlZCBQQUREUl9CSVRTLCB0
aGVuIHlvdSB3b3VsZCB1c2UgaXQgd2l0aG91dCBzdWJ0cmFjdGluZw0KPiAxLCBhbmQgeW91J2Qg
YmUgaW4gdHJvdWJsZSBhZ2FpbiB3aGVuIFBBRERSX0JJVFMgPT0gQklUU19QRVJfTE9ORy4gV2hh
dA0KPiBtYXkgYmUgcG9zc2libGUgdG8gZG8gaW5zdGVhZCBvZiBCVUlMRF9CVUdfT04oKSBpcw0K
PiANCj4gICAgIGlmICggbm9kZXNfdXNlZCA8PSAxICkNCj4gICAgICAgICBpID0gbWluKFBBRERS
X0JJVFMsIEJJVFNfUEVSX0xPTkcgLSAxKTsNCj4gDQoNClRoaXMgb25lIHNlZW1zIGJldHRlciwg
SSB3aWxsIGZvbGxvdyBpdC4NCg0KPiA+Pj4gKyAgICBlbHNlDQo+ID4+PiArICAgICAgICBpID0g
ZmluZF9maXJzdF9iaXQoJmJpdGZpZWxkLCBzaXplb2YodW5zaWduZWQgbG9uZykgKiA4KTsNCj4g
Pj4+ICsNCj4gPj4+ICsgICAgbWVtbm9kZW1hcHNpemUgPSAobWVtdG9wID4+IGkpICsgMTsNCj4g
Pj4NCj4gPj4gQWdhaW4gcGVyaGFwcyB0aGUgc3ViamVjdCBvZiBhIHNlcGFyYXRlIHBhdGNoOiBJ
c24ndCB0aGVyZSBhbiBvZmYtYnktMQ0KPiA+PiBtaXN0YWtlIGhlcmU/IG1lbXRvcCBpcyB0aGUg
bWF4aW11bSBvZiBhbGwgZXBkeC1lcywgd2hpY2ggYXJlDQo+ID4+IGNhbGN1bGF0ZWQgdG8gYmUg
dGhlIGZpcnN0IFBEWCBmb2xsb3dpbmcgdGhlIHJlZ2lvbi4gSGVuY2UgSSdkIGV4cGVjdA0KPiA+
Pg0KPiA+PiAgICAgIG1lbW5vZGVtYXBzaXplID0gKChtZW10b3AgLSAxKSA+PiBpKSArIDE7DQo+
ID4+DQo+ID4+IGhlcmUuIEkgZ3Vlc3MgSSdsbCBtYWtlIHBhdGNoZXMgZm9yIGJvdGggaXNzdWVz
LCB3aGljaCB5b3UgbWF5IHRoZW4NCj4gPj4gbmVlZCB0byByZS1iYXNlIG92ZXIuDQo+ID4+DQo+
ID4NCj4gPiBUaGFua3MsIEkgd2lsbCB3YWl0IHlvdXIgcGF0Y2hlcy4NCj4gDQo+IEFscmVhZHkg
c2VudCBvdXQgeWVzdGVyZGF5Lg0KPiANCg0KT2suDQoNCj4gPj4+ICtzdGF0aWMgdm9pZCBjZl9j
aGVjayBkdW1wX251bWEodW5zaWduZWQgY2hhciBrZXkpDQo+ID4+PiArew0KPiA+Pj4gKyAgICBz
X3RpbWVfdCBub3cgPSBOT1coKTsNCj4gPj4+ICsgICAgdW5zaWduZWQgaW50IGksIGosIG47DQo+
ID4+PiArICAgIHN0cnVjdCBkb21haW4gKmQ7DQo+ID4+PiArICAgIGNvbnN0IHN0cnVjdCBwYWdl
X2luZm8gKnBhZ2U7DQo+ID4+PiArICAgIHVuc2lnbmVkIGludCBwYWdlX251bV9ub2RlW01BWF9O
VU1OT0RFU107DQo+ID4+PiArICAgIGNvbnN0IHN0cnVjdCB2bnVtYV9pbmZvICp2bnVtYTsNCj4g
Pj4+ICsNCj4gPj4+ICsgICAgcHJpbnRrKCInJWMnIHByZXNzZWQgLT4gZHVtcGluZyBudW1hIGlu
Zm8gKG5vdyA9ICUiUFJJX3N0aW1lIilcbiIsDQo+IGtleSwNCj4gPj4+ICsgICAgICAgICAgIG5v
dyk7DQo+ID4+PiArDQo+ID4+PiArICAgIGZvcl9lYWNoX29ubGluZV9ub2RlICggaSApDQo+ID4+
PiArICAgIHsNCj4gPj4+ICsgICAgICAgIHBhZGRyX3QgcGEgPSBwZm5fdG9fcGFkZHIobm9kZV9z
dGFydF9wZm4oaSkgKyAxKTsNCj4gPj4+ICsNCj4gPj4+ICsgICAgICAgIHByaW50aygiTk9ERSV1
IHN0YXJ0LT4lbHUgc2l6ZS0+JWx1IGZyZWUtPiVsdVxuIiwNCj4gPj4+ICsgICAgICAgICAgICAg
ICBpLCBub2RlX3N0YXJ0X3BmbihpKSwgbm9kZV9zcGFubmVkX3BhZ2VzKGkpLA0KPiA+Pj4gKyAg
ICAgICAgICAgICAgIGF2YWlsX25vZGVfaGVhcF9wYWdlcyhpKSk7DQo+ID4+PiArICAgICAgICAv
KiBTYW5pdHkgY2hlY2sgcGh5c190b19uaWQoKSAqLw0KPiA+Pj4gKyAgICAgICAgaWYgKCBwaHlz
X3RvX25pZChwYSkgIT0gaSApDQo+ID4+PiArICAgICAgICAgICAgcHJpbnRrKCJwaHlzX3RvX25p
ZCglIlBSSXBhZGRyIikgLT4gJWQgc2hvdWxkIGJlICV1XG4iLA0KPiA+Pj4gKyAgICAgICAgICAg
ICAgICAgICBwYSwgcGh5c190b19uaWQocGEpLCBpKTsNCj4gPj4+ICsgICAgfQ0KPiA+Pj4gKw0K
PiA+Pj4gKyAgICBqID0gY3B1bWFza19maXJzdCgmY3B1X29ubGluZV9tYXApOw0KPiA+Pj4gKyAg
ICBuID0gMDsNCj4gPj4+ICsgICAgZm9yX2VhY2hfb25saW5lX2NwdSAoIGkgKQ0KPiA+Pj4gKyAg
ICB7DQo+ID4+PiArICAgICAgICBpZiAoIGkgIT0gaiArIG4gfHwgY3B1X3RvX25vZGVbal0gIT0g
Y3B1X3RvX25vZGVbaV0gKQ0KPiA+Pj4gKyAgICAgICAgew0KPiA+Pj4gKyAgICAgICAgICAgIGlm
ICggbiA+IDEgKQ0KPiA+Pj4gKyAgICAgICAgICAgICAgICBwcmludGsoIkNQVSV1Li4uJXUgLT4g
Tk9ERSVkXG4iLCBqLCBqICsgbiAtIDEsDQo+IGNwdV90b19ub2RlW2pdKTsNCj4gPj4+ICsgICAg
ICAgICAgICBlbHNlDQo+ID4+PiArICAgICAgICAgICAgICAgIHByaW50aygiQ1BVJXUgLT4gTk9E
RSVkXG4iLCBqLCBjcHVfdG9fbm9kZVtqXSk7DQo+ID4+PiArICAgICAgICAgICAgaiA9IGk7DQo+
ID4+PiArICAgICAgICAgICAgbiA9IDE7DQo+ID4+PiArICAgICAgICB9DQo+ID4+PiArICAgICAg
ICBlbHNlDQo+ID4+PiArICAgICAgICAgICAgKytuOw0KPiA+Pj4gKyAgICB9DQo+ID4+PiArICAg
IGlmICggbiA+IDEgKQ0KPiA+Pj4gKyAgICAgICAgcHJpbnRrKCJDUFUldS4uLiV1IC0+IE5PREUl
ZFxuIiwgaiwgaiArIG4gLSAxLA0KPiBjcHVfdG9fbm9kZVtqXSk7DQo+ID4+PiArICAgIGVsc2UN
Cj4gPj4+ICsgICAgICAgIHByaW50aygiQ1BVJXUgLT4gTk9ERSVkXG4iLCBqLCBjcHVfdG9fbm9k
ZVtqXSk7DQo+ID4+PiArDQo+ID4+PiArICAgIHJjdV9yZWFkX2xvY2soJmRvbWxpc3RfcmVhZF9s
b2NrKTsNCj4gPj4+ICsNCj4gPj4+ICsgICAgcHJpbnRrKCJNZW1vcnkgbG9jYXRpb24gb2YgZWFj
aCBkb21haW46XG4iKTsNCj4gPj4+ICsgICAgZm9yX2VhY2hfZG9tYWluICggZCApDQo+ID4+PiAr
ICAgIHsNCj4gPj4+ICsgICAgICAgIHByb2Nlc3NfcGVuZGluZ19zb2Z0aXJxcygpOw0KPiA+Pj4g
Kw0KPiA+Pj4gKyAgICAgICAgcHJpbnRrKCJEb21haW4gJXUgKHRvdGFsOiAldSk6XG4iLCBkLT5k
b21haW5faWQsDQo+IGRvbWFpbl90b3RfcGFnZXMoZCkpOw0KPiA+Pj4gKw0KPiA+Pj4gKyAgICAg
ICAgZm9yX2VhY2hfb25saW5lX25vZGUgKCBpICkNCj4gPj4+ICsgICAgICAgICAgICBwYWdlX251
bV9ub2RlW2ldID0gMDsNCj4gPj4NCj4gPj4gSSdkIGJlIGluY2xpbmVkIHRvIHN1Z2dlc3QgdG8g
dXNlIG1lbXNldCgpIGhlcmUsIGJ1dCBJIHdvbid0IGluc2lzdA0KPiA+PiBvbiB5b3UgZG9pbmcg
dGhpcyAib24gdGhlIGZseSIuIEFsb25nIHdpdGggdGhpcyB3b3VsZCBsaWtlbHkgZ28gdGhlDQo+
ID4+IHJlcXVlc3QgdG8gbGltaXQgdGhlIHNjb3BlIG9mIHBhZ2VfbnVtX25vZGVbXSAoYW5kIHRo
ZW4gcGVyaGFwcyBhbHNvDQo+ID4+IHZudW1hIGFuZCBwYWdlKS4NCj4gPj4NCj4gPg0KPiA+IG1l
bXNldCBmb3IgcGFnZV9udW1fbm9kZSBtYWtlcyBzZW5zZSwgSSB3aWxsIGRvIGl0IGJlZm9yZQ0K
PiA+IGZvcl9lYWNoX2RvbWFpbiAoIGQgKS4NCj4gDQo+IFRoYXQgd29uJ3QgYmUgcmlnaHQgLSBh
cnJheSBlbGVtZW50cyBuZWVkIGNsZWFyaW5nIG9uIGV2ZXJ5IGl0ZXJhdGlvbi4NCj4gUGx1cyAu
Li4NCj4gDQoNCk9oLCBZZXMuDQoNCj4gPiBBYm91dCBsaW1pdCB0aGUgc2NvcGUsIGRpZCB5b3Ug
bWVhbiwgd2Ugc2hvdWxkIG1vdmU6DQo+ID4NCj4gPiAiY29uc3Qgc3RydWN0IHBhZ2VfaW5mbyAq
cGFnZTsNCj4gPiB1bnNpZ25lZCBpbnQgcGFnZV9udW1fbm9kZVtNQVhfTlVNTk9ERVNdOw0KPiA+
IGNvbnN0IHN0cnVjdCB2bnVtYV9pbmZvICp2bnVtYTsiDQo+ID4NCj4gPiB0byB0aGUgYmxvY2sg
b2YgZm9yX2VhY2hfZG9tYWluICggZCApPw0KPiANCj4gLi4uIHRoaXMgbGltaXRpbmcgb2Ygc2Nv
cGUgKHllcyB0byB5b3VyIHF1ZXN0aW9uKSB3b3VsZCBhbHNvIGNvbmZsaWN0DQo+IHdpdGggdGhl
IG1vdmVtZW50IHlvdSBzdWdnZXN0LiBJdCBpcyBhY3R1YWxseSAoYW1vbmcgb3RoZXIgdGhpbmdz
KQ0KPiBzdWNoIGEgbWlzdGFrZW4gbW92ZW1lbnQgd2hpY2ggdGhlIG1vcmUgbmFycm93IHNjb3Bl
IGlzIGludGVuZGVkIHRvDQo+IHByZXZlbnQuDQo+IA0KDQpUaGFua3MsDQpXZWkgQ2hlbg0KDQo+
IEphbg0K

