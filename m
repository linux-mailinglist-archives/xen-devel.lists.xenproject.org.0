Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E462364C9BC
	for <lists+xen-devel@lfdr.de>; Wed, 14 Dec 2022 14:08:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.462207.720387 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5RUR-0004Rs-6Q; Wed, 14 Dec 2022 13:08:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 462207.720387; Wed, 14 Dec 2022 13:08:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5RUR-0004OZ-1r; Wed, 14 Dec 2022 13:08:03 +0000
Received: by outflank-mailman (input) for mailman id 462207;
 Wed, 14 Dec 2022 13:08:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LNGa=4M=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1p5RUP-0004OH-K9
 for xen-devel@lists.xenproject.org; Wed, 14 Dec 2022 13:08:01 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on2058.outbound.protection.outlook.com [40.107.6.58])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5439f2d1-7bb0-11ed-8fd2-01056ac49cbb;
 Wed, 14 Dec 2022 14:07:59 +0100 (CET)
Received: from AS9PR0301CA0026.eurprd03.prod.outlook.com
 (2603:10a6:20b:468::12) by DB8PR08MB5354.eurprd08.prod.outlook.com
 (2603:10a6:10:114::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.11; Wed, 14 Dec
 2022 13:07:54 +0000
Received: from AM7EUR03FT008.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:468:cafe::a) by AS9PR0301CA0026.outlook.office365.com
 (2603:10a6:20b:468::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.11 via Frontend
 Transport; Wed, 14 Dec 2022 13:07:54 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT008.mail.protection.outlook.com (100.127.141.25) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5924.11 via Frontend Transport; Wed, 14 Dec 2022 13:07:54 +0000
Received: ("Tessian outbound 6c699027a257:v130");
 Wed, 14 Dec 2022 13:07:54 +0000
Received: from de28fffe11c5.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E862ABBA-A57B-444C-952D-97D611C5EFA2.1; 
 Wed, 14 Dec 2022 13:07:47 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id de28fffe11c5.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 14 Dec 2022 13:07:47 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by PAXPR08MB6749.eurprd08.prod.outlook.com (2603:10a6:102:13d::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.11; Wed, 14 Dec
 2022 13:07:45 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1245:e53:a5ec:66fd]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1245:e53:a5ec:66fd%8]) with mapi id 15.20.5924.009; Wed, 14 Dec 2022
 13:07:44 +0000
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
X-Inumbo-ID: 5439f2d1-7bb0-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=03lNVbzWY76D7u/NjYyUe5EVruMkOvu6iz0M+Qh95Eo=;
 b=+OKb8XsE7SA5wPMIiSI0aYjQHE4h+DT8xx2rSiFHH+1RgBpnYXG2pQ0avuYcxcYRbf6HoAq9DcN0hAbuercItaH90L11saGJUuZQEQ7bWD6s3KLj52cU4pABeQyk5Fx2g6kUBi0X0fkRV8YyNL0WbjBWA7oWK9bg/hySHa9heK8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lpFG6gkCK+CThixAM0yLCCwz5rezTgoA5F7HV+8f8vSl+LQ1Dw8irI1tB4QbWs2k2W249OaaZM2Ws/NICX/Y8W+BTCq/m2KllenZ76I8T7KXQpk+y29ZuBona9wjmf/HQO7NAu30uJQwkvvnM+dgCQd//fgTNK7oHNT2VzUOIYf7ZOaKZBZijgCM1kBURM0zRkTDQoPQwRc3GECfSGTdlhU0UjvTHOG44AAps63keDvRggpWrXRNV/RnbxoyoCfpyQ0s6sTlUyQCIttbNqc04h4YaGZMJ52nQXi/cqbAKLqRFcflW+Xo742AaZ1kjd4EABW/ie6q7qI3jDs/td+vFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=03lNVbzWY76D7u/NjYyUe5EVruMkOvu6iz0M+Qh95Eo=;
 b=na57/EhhdvkfzZDCna9Bgs4eQnA7DNbswPtSXfNawehtxFHamzMfbC6yEwcIWuQJoKdhyGdCrp67AizHb4wHeB1mK7X3QX4q2Zq428ga2SRtV1GjN1oIHlC5c0m46U5Prr2LQQfIJ5L08ZMEJheRgFe4akFR3W6lQMlrPAri+rMs5dQZohgodPSBMKymxNhcLsk/WbSXxshsjONvgN4u6favbQGYcpimWlamWdEG9nFYwOGW9W/fJoUOhX9gsoPWDabLq9pXnrui9ot7w6LOjV6FUYIR8/eLSH+Uz7VOuF5vKpAaDs3vlO3CZoZ32/BbbWhn3QzR9n46KlptHJwUnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=03lNVbzWY76D7u/NjYyUe5EVruMkOvu6iz0M+Qh95Eo=;
 b=+OKb8XsE7SA5wPMIiSI0aYjQHE4h+DT8xx2rSiFHH+1RgBpnYXG2pQ0avuYcxcYRbf6HoAq9DcN0hAbuercItaH90L11saGJUuZQEQ7bWD6s3KLj52cU4pABeQyk5Fx2g6kUBi0X0fkRV8YyNL0WbjBWA7oWK9bg/hySHa9heK8=
From: Henry Wang <Henry.Wang@arm.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"xen-announce@lists.xenproject.org" <xen-announce@lists.xenproject.org>,
	Xen-users <xen-users@lists.xenproject.org>
Subject: [ANNOUNCEMENT] Xen 4.17 is released
Thread-Topic: [ANNOUNCEMENT] Xen 4.17 is released
Thread-Index: AdkPhB/We2miLp4BTbmjb8taM7dc5Q==
Date: Wed, 14 Dec 2022 13:07:44 +0000
Message-ID:
 <AS8PR08MB7991FA6E147FC0C0E4B99D3392E09@AS8PR08MB7991.eurprd08.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 8F25FE6A80BA0846A218CC61685782D2.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|PAXPR08MB6749:EE_|AM7EUR03FT008:EE_|DB8PR08MB5354:EE_
X-MS-Office365-Filtering-Correlation-Id: 72a802e9-db1a-4260-e4f6-08daddd4368a
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Wu8g44OKhyXcV/hnLc/KcChwllW+yCbtGMeUiCyRH7CJMN0LDzL7XsDjRO+wo8/EEt/C0vI8v8nAlJjxB4LIdckLxHYCRQcmQlKC7acvhWmiI6TUFVGH+yflyFi/AiQRhcbnIdiWDSB1Hs6pcPbAI9AgwnbGVYu4VFQtnSbYl6rMtm//QZKUgIpZc4sW4eqfSRS7djmstW1bdWlh2PP3QvW+KRbPpaMtZMI+NglA0ZgDoShDzFaIqra+oSh6hu2Rn0AkaMmzkUP9iz0zE8CN1HbMj3ZHgGHgktyr+wMg3v2tg4ED/XgzBeXCQCvn140AY8LhNB3htCWHSHZJ5fUqBdcZkEt2C2i8Sls962RzZlNxt2qGJoLF+JtsWxm812sKN0N21g93sfHx0EM1sYft2pO6v+pmcS8Px200dEoK0AzW5qqO2OKrJ3lqTJQoTGoRLt8X2Rz7CbgQ3DMAUzTrkLzCAbtvjHWkyjd7A8CZZjU3PNpZwHEg7dOJ5UmrIP2iRBExBE+2x7jAJwWdOSfzY6p4l/ViaNJjq7sQMgJLrjXdhjHKCoEaX6d8UMphyS8HkYrmaeGH6fxTDeOsqHFGOyj0zNUmSdH+6NAdxWq8703eYRDgfv1xvg65edW8ZRUHZ3AJTZJlo2Ckun9tPHuc46Yem244/sn3ZEZjifn9IH+IFBWbQooLnT+WnlRr9MIMaxYTRDyddVT3+1SowppFgvPTh5suMlw5kJaVEtZiEf4=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(366004)(376002)(39860400002)(396003)(451199015)(76116006)(450100002)(8676002)(64756008)(66476007)(66446008)(66556008)(86362001)(66946007)(186003)(7696005)(6506007)(9686003)(38100700002)(33656002)(55016003)(83380400001)(2906002)(41300700001)(122000001)(52536014)(8936002)(5660300002)(38070700005)(966005)(478600001)(316002)(110136005)(26005)(71200400001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6749
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9a62c6fa-0008-49a3-0137-08daddd430b3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	saSyuJ8Q4E+InwbqwRtdlkdhVB0xG/051UE0WRAskQr08h+m4eBLOE2iI/RQWbu+WZ37Ydjm1QjPgeLQfe/IyMne7WyGGQcSBzPMElueq4A9ZAOJyRopPiz7foYfcSw+VmOfIp4bdjgqFQDAUjTHX8MQAskfTL8SYfgwK0ATkSsEHAYy76/hHkaxdT5F+Ke81j++UWHUW1E7XhagVjdXT5W9S0mPRmOQbAl1ry0s26h9WUVKf4PyGZQNJ6KeZVjimFZgscVtvx1jZHbz2BMxfI8ozl+z80Wj3WyoRbwmAR9eUjgxWBonHxoC1LOtKG7PsQIX81yCP4lDE4nkxIC/sXwhpToS8ij/W40IrZcT1c406R2GPFN6cyE0SbKk4zWDosr53MB7goNTIsE2fIf8ieNATE8969dJQmqFbPikqyiHe+Mfxz6XJ6ADMn1y2tinS/EhnjfoG6vYRf/lGIi6x00+YnOe/oiHxRv0hY9xP7Y8gFdoM6i1O6IUEPAIZqwMoYYjyCRSms0vsjFtCbXrsCzLUeu7lEGY8bgABOJHikGsHwoW773fDQ1Gjb4WLYxoTt8KCtLwtJ6J/i1v7/9/Ee6BFDWa8o9EGYTEJ7Xu09/MeMoNqCgICO8JlaLJ4FgJKcbJXMG6Uhw6A7jK4zAsCSN84xmsDMAinFdH++Vk4xH2jA0GAB6BDzF7824gZG4XPaQXhXhF6lBlP71NGpNBqVnzp1N0VYWCJUfKhhV8+rQ=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(396003)(136003)(376002)(451199015)(36840700001)(46966006)(40470700004)(7696005)(52536014)(9686003)(6506007)(186003)(8936002)(26005)(82740400003)(81166007)(356005)(55016003)(2906002)(110136005)(478600001)(40480700001)(33656002)(86362001)(316002)(966005)(70206006)(70586007)(40460700003)(5660300002)(450100002)(8676002)(83380400001)(82310400005)(336012)(47076005)(41300700001)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2022 13:07:54.3286
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 72a802e9-db1a-4260-e4f6-08daddd4368a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5354

Dear community members,

I'm pleased to announce that Xen 4.17.0 is released.

Please find the tarball and its signature at:

https://xenproject.org/downloads/xen-project-archives/xen-project-4-17-seri=
es/xen-project-4-17-0/

You can also check out the tag in xen.git:

git://xenbits.xen.org/xen.git RELEASE-4.17.0

Git checkout and build instructions can be found at:

https://wiki.xenproject.org/wiki/Xen_Project_4.17_Release_Notes#Build_Requi=
rements

Release notes can be found at:

https://wiki.xenproject.org/wiki/Xen_Project_4.17_Release_Notes

A summary for 4.17 release documents can be found at:

https://wiki.xenproject.org/wiki/Category:Xen_4.17

Technical blog post for 4.17 can be found at:

https://xenproject.org/2022/12/14/xen-project-releases-version-4-17-with-en=
hanced-security-higher-performance-improved-embedded-static-configuration-a=
nd-speculative-mitigation-support/

Thanks everyone who contributed to this release. This release would
not have happened without all the awesome contributions from around
the globe.

Kind regards,
Henry Wang (on behalf of the Xen Project Hypervisor team)

