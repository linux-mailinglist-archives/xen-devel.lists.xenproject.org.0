Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF5F61A6BC
	for <lists+xen-devel@lfdr.de>; Sat,  5 Nov 2022 02:45:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.437977.692370 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1or8Dg-0003eC-MW; Sat, 05 Nov 2022 01:43:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 437977.692370; Sat, 05 Nov 2022 01:43:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1or8Dg-0003cN-GV; Sat, 05 Nov 2022 01:43:36 +0000
Received: by outflank-mailman (input) for mailman id 437977;
 Sat, 05 Nov 2022 01:43:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ClQV=3F=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1or8Df-0003cH-31
 for xen-devel@lists.xenproject.org; Sat, 05 Nov 2022 01:43:35 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2087.outbound.protection.outlook.com [40.107.247.87])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 40646062-5cab-11ed-91b5-6bf2151ebd3b;
 Sat, 05 Nov 2022 02:43:31 +0100 (CET)
Received: from AS9PR06CA0639.eurprd06.prod.outlook.com (2603:10a6:20b:46f::26)
 by PAXPR08MB7624.eurprd08.prod.outlook.com (2603:10a6:102:242::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.19; Sat, 5 Nov
 2022 01:43:22 +0000
Received: from AM7EUR03FT019.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:46f:cafe::a5) by AS9PR06CA0639.outlook.office365.com
 (2603:10a6:20b:46f::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.24 via Frontend
 Transport; Sat, 5 Nov 2022 01:43:22 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT019.mail.protection.outlook.com (100.127.140.245) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5791.20 via Frontend Transport; Sat, 5 Nov 2022 01:43:22 +0000
Received: ("Tessian outbound 0800d254cb3b:v130");
 Sat, 05 Nov 2022 01:43:21 +0000
Received: from ff877a6dda53.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F9D4C0C1-513B-408F-A0B7-D599C6C21303.1; 
 Sat, 05 Nov 2022 01:43:16 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ff877a6dda53.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Sat, 05 Nov 2022 01:43:16 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DB9PR08MB7512.eurprd08.prod.outlook.com (2603:10a6:10:303::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.16; Sat, 5 Nov
 2022 01:43:14 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339%8]) with mapi id 15.20.5813.009; Sat, 5 Nov 2022
 01:43:13 +0000
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
X-Inumbo-ID: 40646062-5cab-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=ceq4d8y//JP/tj2VicR6XdGKkNCH1gz1/C31VLF++IeqBJQ/BIuT0ER6cLCRc0O72pe59fmfUl7tlWOiAvQM1VSKjjiM2dQlJbNV9ZS4FGcSay0mdm8NBkD4VKYgxpFzf9NOaeod3+HvicWQsNV73w7g5if8NQV2QWDT20+iWyXWfgu7WF18WwoZ5U4Gq3cCMOovNsHMp/+838swf7nXbAbO3aSoSbElamTw1m8LZw6x3lBJIoHSreuXMObvtKHyORwaelWE4FswC4UGG2/RmEMcOkfXnMNt2YzwEFQaJRe0GBP50z/MLolcM8ilzglUlT0/F+WSNFr/Skc4Ymtbvw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WYvllwfOZD9O6T5HTCLx1s4/8S5pf4PPIIacqGUBqeI=;
 b=FGGcOHa91k21rCHD9LA/CO7DvhqMSGL7+BGG0tLBhFslNGM+0dbODaztSLk1Uld7o7/t31m+6v4K+4BROX6TtQXfgy56YRhjrBkuB+SkoxSw5gVy1rqn0MYqlErvaTV/+3HfNyk6A9ADeMvft1zfaVS82utw6XBiH3+6sVqu0P79QfcydaOJJxKIk3FzhTqptHb/dBU95IkCE3HxCZlOBF4JtjEJ+3FKHMU5eIgUxq8ELEjKidC0d1rURTrCE2+j/HNT0NTuGfcYHWRO4Hf4X336CjW9BXjdrM4VQo9ZJ1BbTctUxfVZBFluq/uKfb+IT1V8te3YkjZPYS6wn9iNvA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WYvllwfOZD9O6T5HTCLx1s4/8S5pf4PPIIacqGUBqeI=;
 b=HLtHYzHRaWrSYbS2alSNWmcK/LYfOisEqqFTzCw/C8jxautzOMMi0M9+n5wVQ9ouC0BFShn4cI5+i9HolAoDNOyjnPzbpZ/YXYmI9NwrcCO5/R/vimy9KUWXeQH4mDKpes/LR8XIkdl4P5MREXshzInOynENCnfFnmCpPjFEGWg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XYi3GSAuR8mg1+r15PiWOylG8ouHLGV4Z30owjArjKWnUXFGG69NWTQLJbYbNo7xl1QGm7se63b4uPGPuX47pCkMKZJB/3qnQ3YkwdARcRBte4sb0j2ts6y9EyZLPcM4O0T8EjrC31AgBeBo3RDUif2uJd2CUKSP+10t/lMn6F7by8vDODzmofG1sddmiE2ulHB8DqprsaQCesaRKqguFxBOEm+T2p9BRzVcw78V9MysH+5kiaQNj9PIVnLAtyzDzk37pGeJHjHV7Uh/hyQviT7XfCxOULqqT06WbXqkBPyLK3e16r8VcM1F/fb+J6398MVAEhMX99bChQmTEK0S0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WYvllwfOZD9O6T5HTCLx1s4/8S5pf4PPIIacqGUBqeI=;
 b=Kj07oJuvb/MxGEQvowD/pxPi3o7pU3qRuZv7MPzatnQElgglmyY7BRwxXP4ov1mEHbh+h/pO7qzjVf4KiekNNrMeZ2kx2FC4OJkADfUug+zR2W5ILKMBadMqV/n/y9peMlli0sqWs93lB/ZX2WEMC5kGd58d0UFWFcATR8Gais9UlT0bZVBCJ7e4jolTGLlNO3kfApIn+P7iQNooDfNDWhk1HV4Esa75hSRDuFEDnF88F7S3E1l0ysesjexaNAA6gKpdJLCASLChuX0FDErF50DVuhxTFSpGpbmDjVuXT/5srxJIxMwT9Ir/mM4M18RS2PRK8f3eH/T0C96DYCJArw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WYvllwfOZD9O6T5HTCLx1s4/8S5pf4PPIIacqGUBqeI=;
 b=HLtHYzHRaWrSYbS2alSNWmcK/LYfOisEqqFTzCw/C8jxautzOMMi0M9+n5wVQ9ouC0BFShn4cI5+i9HolAoDNOyjnPzbpZ/YXYmI9NwrcCO5/R/vimy9KUWXeQH4mDKpes/LR8XIkdl4P5MREXshzInOynENCnfFnmCpPjFEGWg=
From: Henry Wang <Henry.Wang@arm.com>
To: Paul Durrant <xadimgnik@gmail.com>, Roger Pau Monne
	<roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, Kevin
 Tian <kevin.tian@intel.com>
Subject: RE: [PATCH for-4.17 v2] hvm/apic: repurpose the reporting of the APIC
 assist options
Thread-Topic: [PATCH for-4.17 v2] hvm/apic: repurpose the reporting of the
 APIC assist options
Thread-Index: AQHY8GkebAmmr6JZXEeYf3zz1Gj/l64vB4qAgACHc2A=
Date: Sat, 5 Nov 2022 01:43:13 +0000
Message-ID:
 <AS8PR08MB799168C8982994D0AD2DE176923A9@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20221104161815.38007-1-roger.pau@citrix.com>
 <d93ad249-8b6e-2ab4-482a-bfd8a07eb6b5@xen.org>
In-Reply-To: <d93ad249-8b6e-2ab4-482a-bfd8a07eb6b5@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: CF801592F278FD4983EF47BEC51520FA.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DB9PR08MB7512:EE_|AM7EUR03FT019:EE_|PAXPR08MB7624:EE_
X-MS-Office365-Filtering-Correlation-Id: fd1a9fd8-ea44-4819-e995-08dabecf1f7f
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Su1ARq/IW1WVnZJ36p1sHg6np+MLwt8ZdQOGDOniaFVV6WIy/2sQuzBPr+0LRaMP2zh3i9ehfKpzs2AWS/hd3SkngcRi7LXOpzgL+bIQu4R4Cv36OvcR3M6w63z3d0GG3SjHkLxJqGMcM4Sjtiz6iC23kAmWyVxXv+zpUNWEU/H1KUCS6pYRaiyDFlmV+ux8k9mGHywYKrcm4gwLQJB/kpIE5XVWx4L9jxg82svydw6cTaevY2QT0APLmiYgqXvCIaudRuzd0vDCXAUc7Syq3LMT04eXgc6g+Agj9ghJlNKWcuOlAWKKZxaqsgtO4rfPLSPA94Fm2g6rnhhueODDsGaIu6F2m3oRZk+theH9lLlKTpDlkeMWZzLhm8FeetVtovDnhY1e8K65TfhMMNFtiejqYb3BIVpRBp4XYMfkdGHh8HomknZwzM2oj2z3/PHFfGPlkX0QtRY9GDB4Sv+Hrtj5RMwaqfKI1a2fQaw3v1raRGT5brv9IWXiyghbZvq/w8D6/4zE5TLPcvaJkoBi9VEAsxNlsF5sgObD0SvSMzCZ2mWcOQdqr6n8jZIc0aP8vIanCosPLWvLlO6Im2dbNrIoB+LDtB8qTZ8HfWKvjGVoxUd3xqnJyl2SZnQXd/yVbEhI56TVvK0nLpdbvmY84RjbuqP9TY8oxMB/+HnQY6lHc78V6HChMfJ+2aJVmI91yqczAzTjE+x095wCRSWn222Y71PrHfCnnE4Bnay5vxYLR3oXz3Y8EvP3fivW5k6sWaIi4fT4WjZKgLnGmZe71Q==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(396003)(376002)(366004)(346002)(451199015)(76116006)(52536014)(8936002)(186003)(83380400001)(66946007)(66556008)(33656002)(4326008)(66476007)(64756008)(9686003)(6506007)(55016003)(53546011)(2906002)(41300700001)(26005)(7696005)(8676002)(5660300002)(38070700005)(54906003)(66446008)(71200400001)(316002)(478600001)(38100700002)(86362001)(110136005)(122000001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7512
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9e1d544f-e1d0-4920-863e-08dabecf1a68
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4gAi+PlfjrThqbhWkaKuhNiXqRO8WcGcKwoZ9bOoEQoW0eZgf1cjru+gNR51BaxiKyea+WDF3yNzLTjBvimKDoJn8Jpg802/44BEpQU/rfE2Fo/Y9gOFMTJGdbbxQm9tepJjmaHRkFsKjx4h+9MuhHwW+Idv3Zaqp7Ffz4zQgVsJD2Xy8OZo+yUdKt+A7LEPfXz+w+N2WUg8tUgJl4kA5pPd65V1yo6EQa666eHCwT1UieoOZl3vLpJa47YSzMBqkVMAxHw9p/hEOaKrYfmBumQ3g2MeK3A4sYgTJBMPch+j4B+6sa+kZyUTwRSSV7GVknVffyuXNkB2Q55jy+d60lvyKIDagPpNP+qhP2w5kX2TlYXmUcLBynpRQdLjwLuEubWQrjtYCsurvQA7kS7xi82r6tnEplnHr29/TVvrL1tWzGvD5QZNDCuGze9+MTQKshJIq/vymeBxGzc6rqnKZfpHHaouRU5hAlWDTmHBaV6ui2V2YiiXhdFpnHjbSvgEzrYYvwaIHBqbSN04+1lps0/safBM3wWJ5KchquUJ1wp5JP5+scRHOLKZ7XS4yiUzsGUONxF1gpANMnlShhYyF2DiMenvUAbSjAHskqV6cA7c6y+h84DCSIexXvtnmlN/DFTKFxK2lWtFl+KFtpgZuKlRys93xD5oFlxhkIIAZud0Aoma97xuR3j3BArIIaCCpXZTYjDicO7EuIprgbEhxYEx+JKeLygNWSfTPVxclYYLGcmGxd3b4jxR15C4iBswWb8Gh3cxQsx2/G73njYEvA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(39860400002)(396003)(346002)(451199015)(36840700001)(46966006)(40470700004)(33656002)(40460700003)(356005)(41300700001)(81166007)(8676002)(107886003)(9686003)(40480700001)(2906002)(82740400003)(82310400005)(54906003)(52536014)(86362001)(7696005)(5660300002)(6506007)(110136005)(478600001)(186003)(53546011)(70206006)(26005)(4326008)(316002)(8936002)(70586007)(55016003)(36860700001)(83380400001)(336012)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2022 01:43:22.1705
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fd1a9fd8-ea44-4819-e995-08dabecf1f7f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7624

SGkgUm9nZXIsDQoNCj4gU3ViamVjdDogUmU6IFtQQVRDSCBmb3ItNC4xNyB2Ml0gaHZtL2FwaWM6
IHJlcHVycG9zZSB0aGUgcmVwb3J0aW5nIG9mIHRoZQ0KPiBBUElDIGFzc2lzdCBvcHRpb25zDQo+
IA0KPiBPbiAwNC8xMS8yMDIyIDE2OjE4LCBSb2dlciBQYXUgTW9ubmUgd3JvdGU6DQo+ID4gVGhl
IGN1cnJlbnQgcmVwb3J0aW5nIG9mIHRoZSBoYXJkd2FyZSBhc3Npc3RlZCBBUElDIG9wdGlvbnMg
aXMgZG9uZSBieQ0KPiA+IGNoZWNraW5nICJ2aXJ0dWFsaXplIEFQSUMgYWNjZXNzZXMiIHdoaWNo
IGlzIG5vdCB2ZXJ5IGhlbHBmdWwsIGFzIHRoYXQNCj4gPiBmZWF0dXJlIGRvZXNuJ3QgYXZvaWQg
YSB2bWV4aXQsIGluc3RlYWQgaXQgZG9lcyBwcm92aWRlIHNvbWUgaGVscCBpbg0KPiA+IG9yZGVy
IHRvIGRldGVjdCBBUElDIE1NSU8gYWNjZXNzZXMgaW4gdm1leGl0IHByb2Nlc3NpbmcuDQo+ID4N
Cj4gPiBSZXB1cnBvc2UgdGhlIGN1cnJlbnQgcmVwb3J0aW5nIG9mIHhBUElDIGFzc2lzdGFuY2Ug
dG8gaW5zdGVhZCByZXBvcnQNCj4gPiBzdWNoIGZlYXR1cmUgYXMgcHJlc2VudCB3aGVuIHRoZXJl
J3Mgc3VwcG9ydCBmb3IgIlRQUiBzaGFkb3ciIGFuZA0KPiA+ICJBUElDIHJlZ2lzdGVyIHZpcnR1
YWxpemF0aW9uIiBiZWNhdXNlIGluIHRoYXQgY2FzZSBzb21lIHhBUElDIE1NSU8NCj4gPiByZWdp
c3RlciBhY2Nlc3NlcyBhcmUgaGFuZGxlZCBkaXJlY3RseSBieSB0aGUgaGFyZHdhcmUsIHdpdGhv
dXQNCj4gPiByZXF1aXJpbmcgYSB2bWV4aXQuDQo+ID4NCj4gPiBGb3Igc3ltZXRyeSBhbHNvIGNo
YW5nZSBhc3Npc3RlZCB4MkFQSUMgcmVwb3J0aW5nIHRvIHJlcXVpcmUNCj4gPiAidmlydHVhbGl6
ZSB4MkFQSUMgbW9kZSIgYW5kICJBUElDIHJlZ2lzdGVyIHZpcnR1YWxpemF0aW9uIiwgZHJvcHBp
bmcNCj4gPiB0aGUgb3B0aW9uIHRvIGFsc28gYmUgcmVwb3J0ZWQgd2hlbiAidmlydHVhbCBpbnRl
cnJ1cHQgZGVsaXZlcnkiIGlzDQo+ID4gYXZhaWxhYmxlLiAgUHJlc2VuY2Ugb2YgdGhlICJ2aXJ0
dWFsIGludGVycnVwdCBkZWxpdmVyeSIgZmVhdHVyZSB3aWxsDQo+ID4gYmUgcmVwb3J0ZWQgdXNp
bmcgYSBkaWZmZXJlbnQgb3B0aW9uLg0KPiA+DQo+ID4gRml4ZXM6IDJjZTExY2UyNDkgKCd4ODYv
SFZNOiBhbGxvdyBwZXItZG9tYWluIHVzYWdlIG9mIGhhcmR3YXJlDQo+IHZpcnR1YWxpemVkIEFQ
SUMnKQ0KPiA+IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRy
aXguY29tPg0KPiA+IC0tLQ0KPiA+IENoYW5nZXMgc2luY2UgdjE6DQo+ID4gICAtIEZpeCBWaXJp
ZGlhbiBNU1IgdGlwIGNvbmRpdGlvbnMuDQo+IA0KPiBSZXZpZXdlZC1ieTogUGF1bCBEdXJyYW50
IDxwYXVsQHhlbi5vcmc+DQoNClJlbGVhc2UtYWNrZWQtYnk6IEhlbnJ5IFdhbmcgPEhlbnJ5Lldh
bmdAYXJtLmNvbT4NCg0KS2luZCByZWdhcmRzLA0KSGVucnkNCg0K

