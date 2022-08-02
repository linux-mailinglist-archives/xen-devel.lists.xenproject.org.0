Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4932C5874EF
	for <lists+xen-devel@lfdr.de>; Tue,  2 Aug 2022 03:04:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.379164.612410 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oIgJN-0002Sp-56; Tue, 02 Aug 2022 01:03:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 379164.612410; Tue, 02 Aug 2022 01:03:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oIgJN-0002Qo-14; Tue, 02 Aug 2022 01:03:05 +0000
Received: by outflank-mailman (input) for mailman id 379164;
 Tue, 02 Aug 2022 01:03:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Ypk=YG=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oIgJL-0002Qi-TZ
 for xen-devel@lists.xenproject.org; Tue, 02 Aug 2022 01:03:04 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2070.outbound.protection.outlook.com [40.107.20.70])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id da869992-11fe-11ed-bd2d-47488cf2e6aa;
 Tue, 02 Aug 2022 03:03:00 +0200 (CEST)
Received: from DBBPR09CA0040.eurprd09.prod.outlook.com (2603:10a6:10:d4::28)
 by AM6PR08MB5288.eurprd08.prod.outlook.com (2603:10a6:20b:ac::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.14; Tue, 2 Aug
 2022 01:02:57 +0000
Received: from DBAEUR03FT016.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:d4:cafe::30) by DBBPR09CA0040.outlook.office365.com
 (2603:10a6:10:d4::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.7 via Frontend
 Transport; Tue, 2 Aug 2022 01:02:57 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT016.mail.protection.outlook.com (100.127.142.204) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5482.12 via Frontend Transport; Tue, 2 Aug 2022 01:02:56 +0000
Received: ("Tessian outbound c883b5ba7b70:v123");
 Tue, 02 Aug 2022 01:02:56 +0000
Received: from c5bd1f3f9a1f.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 34700241-8639-4161-A25D-5AD6242CE56D.1; 
 Tue, 02 Aug 2022 01:02:50 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c5bd1f3f9a1f.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 02 Aug 2022 01:02:50 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by HE1PR0802MB2555.eurprd08.prod.outlook.com (2603:10a6:3:e0::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.12; Tue, 2 Aug
 2022 01:02:40 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::240a:5b52:7540:5772]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::240a:5b52:7540:5772%3]) with mapi id 15.20.5482.016; Tue, 2 Aug 2022
 01:02:40 +0000
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
X-Inumbo-ID: da869992-11fe-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=MxE1kfgVcN8jK8KDlLSLiaNwpT6C5KrEmX381t0bZYTYc6yFJRMquUK9zYJZZxjLrMSAUqshE+82NCUoZkqGOQPSmJIbU4w1SeSrA6ohRMJy3zQkiJXVS2LwSkQ1ZTN7EXkBqXUgvs5oMogipTrusfNoK+6WutGqRBIbQSApJCqJRgpJBMoTipneDjnXPrmvA5ygW9IPQUzXDemGaARi0EZDifea9891x2uapoIXuKvRXcUUKlawqdRdl7uLUjYpqYb36tn4S+Ur1ja2qcrXz9FhzW+0tRTnqxH5puH0LbMcmmGoAvwp8j3jQzqwFSmerriRUQQL6wypQBQr/Pi/uw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TBGpo6bsMUbmNl74Y2M+PFWIwhChzFfUlpjiuDNnGN0=;
 b=cb6bQPXDO3D3ovq9tuiYWqncZe458D2so1bwnW59Pz9JPZVmHeeBcvBZdg34YfutA5hNLi8ZILGdyqZyZTQqWmobrgXgmFSFFX0E2AV3H/8FxWC36ReqmmxbgQR5eCpJfUYPA/MyX4NaQDBmu1D+zDJyDxcrRP1hp3d8PC3Ay6ggPpEZIOy8OmxXqBkp4KNbIiMUs/8btLwG5WcwAKqi4sp9ZXjPyfySXXo0uTNpM7jWtVcuDVumGCPS/zV+4K78KvxgPF/7jkPTdEha5X/47iTprj9ifUrvXfw2DfLCOPKgxwbatBsRnXx7N+xQywVVQGWwKd3QeljsMyIEaalWzA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TBGpo6bsMUbmNl74Y2M+PFWIwhChzFfUlpjiuDNnGN0=;
 b=QEzCk0WxtUovGcfK50/WYGFy+dZKZEjTKBQZMC7HgT5LGxPAxC/R9fH3xy0SDlrBxxuynZyxEWWaZJk1ugNjlIu9WGduMPjxSsnEjsepmVq3NJ8dhsU07jdhubIqJylnQYltngpuf0N10u23u5BwIvDjInoipnKAwdSWJ4ZF7Xg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IMo8WnqqzqxJgsbxoGr/hE2ojYOYOMX4VFTBrvmAp2gvOrYcU76X7+DFO/3v9xLj9U/NXrgscSLwcYsRFL+joRxgDlcQiuN5clHX5rvZC0XAZow7Os/V9Nv838XVevWr1xz6tliECD/9murVdBY++b1kjn+HtzuYk0Sth7VufeAPA3cVORqsmsvcn3bGzfk9BP/ostXJCzUgSw4Bj3pvj80ERbDu5gjCm9QOue8HWqf9UYBtnyOfcden/I+vuT+6pCxN18sVSmbK3Sgb+HGEkV2GO/4s/RXWLK2VBi+rfQ/q+fZNQqyIN6C9t8ddoAWGxs/JJWAl4lonr+YX7I2aUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TBGpo6bsMUbmNl74Y2M+PFWIwhChzFfUlpjiuDNnGN0=;
 b=Z4SUe/dEOm7CmRc/6WJ5ienDGXMCv8MuOD2Y0b3O26DPkNAY/tddWoKpEhUsHM8YP+X5n2OTTpHMc8vqjUMVbemuV08pnl8XPWAzEEGsolSzVYs+qE7wnQTKXwOb3Me1vwayFzy26Stl2cNPMn8QamnhRZ3f6AEVdFvt+ZB83ApOzB090aCh3Y/f03QuTh5e+CsIkOlWuBP5eu2KdLmfElNW+Dcajh1c98BdMq1N0T3QSqmYAggV36XF4XT/QWtiPgoGBqQcZ6M6RRJvJkD/9hS3LKMkQrK/qqbXBb6+UgyLGJi2dsICOjVZiOGUu1RxYN7KaUhvX9G7Qfcmc3ux8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TBGpo6bsMUbmNl74Y2M+PFWIwhChzFfUlpjiuDNnGN0=;
 b=QEzCk0WxtUovGcfK50/WYGFy+dZKZEjTKBQZMC7HgT5LGxPAxC/R9fH3xy0SDlrBxxuynZyxEWWaZJk1ugNjlIu9WGduMPjxSsnEjsepmVq3NJ8dhsU07jdhubIqJylnQYltngpuf0N10u23u5BwIvDjInoipnKAwdSWJ4ZF7Xg=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>
CC: osstest service owner <osstest-admin@xenproject.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Oleksandr
 Tyshchenko <oleksandr_tyshchenko@epam.com>, Anthony PERARD
	<anthony.perard@citrix.com>, "committers@xenproject.org"
	<committers@xenproject.org>
Subject: RE: [xen-unstable-smoke bisection] complete build-amd64-libvirt
Thread-Topic: [xen-unstable-smoke bisection] complete build-amd64-libvirt
Thread-Index:
 AQHYouc0D/RQH6dMvkiHdRu7Ize84q2U4XaAgAC8VYCABB/vgIAAAhuAgAAGdwCAAAjfgIABAYig
Date: Tue, 2 Aug 2022 01:02:40 +0000
Message-ID:
 <AS8PR08MB7991D03CA18A95FAE2D6179F929D9@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <E1oHEQO-0008GA-Uo@osstest.test-lab.xenproject.org>
 <08606914-f5f4-8415-51a2-f6a5e1c54d20@suse.com>
 <db39670c-7e36-2cf5-a87b-92d10d3aac18@xen.org>
 <7bcf8fac-df56-2032-0057-2b7c671e59be@suse.com>
 <16b1c490-1d8f-1c35-496a-a60fb1404fc3@xen.org>
 <230338bf-b709-f2dd-bc8f-80052e98233b@suse.com>
 <b9b3a07d-a24d-deac-c812-7393554407e4@xen.org>
In-Reply-To: <b9b3a07d-a24d-deac-c812-7393554407e4@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 23D718022FD10F42AF4D41A1993DC767.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: f0d64c0e-f47d-4316-055e-08da7422bc95
x-ms-traffictypediagnostic:
	HE1PR0802MB2555:EE_|DBAEUR03FT016:EE_|AM6PR08MB5288:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 4p6Q1imCZNqgj1na8PWGUKJP7pnq1UCiAzpAD9a9/QESsFbk8dmcQyeG5DY77RJpJpFSo/8sZk6ufeWniYSldMWypjpmqmILB2lEBQ/W9h0rj5SyU1NjaMPmcGl3lSiERN7UMZQZGQ5zNKuvzrBdTmNFLMAxUlVnhogb6yugB15ttNj0ITkEbEnV1EvQuK2n5+914PjvNyxFJlosE3lGrO/eJygPYUjt4DuwVDo7OoxO28KXIpyA9kDTQlxSddp+PJCX2+KBHmdMLBvT9k9s7emuskIJBJF5pnXl0flIdGt4zBC/DBMO//STKwxcRjQTdf1RC3iRDZJTJqAt/euA21ttPyP/0Lvx+ZQ4A9Wm0KO8Dv31tXghhEuOS4adx2dAnn4wqLK55I7uz56kf3u7o31jNf+AUOAJi3EGe9BdxNmDdg8+RwN/myYYwNseIrE4bXqO8FVjxhDGL90B5a2ruO8uI6pEg7mMA5gGIB6lzrGVnkKcft3Vptt50NkSkAtaJ1dvyRHhEqdu71NT8lxY2cNbEyfZy0Jz0YeH5jGXTuutWpYSdAWrD/nnxRudFHdXrJfOM40z8AMgn5OBsFfGhTjK2zzZvQQeyilzbC4FZVUIek6a9dV7xUw95i5AdyNrF/diA6WCMfOytK5KwbzKLn8WpDjXackYhq+YcwFgTdSevWtzYYX/flW9HvqBMdtqVq2EgmbTtTpST9Qk/jSHmOxE4OLD3tKZZXyQF2C78uOD2ziXwjJtNUBNiTfKOFTOfE3lPgAkg8mYGn8fjTYjsZN3+aldvuSBJ8/SnmSaQoJggCHCc9qIdPebevU8gt/N
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(396003)(136003)(39860400002)(346002)(366004)(478600001)(83380400001)(33656002)(55016003)(8936002)(54906003)(110136005)(52536014)(4326008)(71200400001)(64756008)(38070700005)(76116006)(66946007)(66556008)(66476007)(66446008)(8676002)(86362001)(38100700002)(122000001)(316002)(2906002)(41300700001)(186003)(53546011)(6506007)(26005)(7696005)(9686003)(5660300002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2555
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ee8ec9a9-ea81-4056-8156-08da7422b2dd
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fU1yD8ezLn6crdoHcYmy6SB2zIsjGv/j7EJ3fJAckMAdyK2i1HYyIs4wrznrv3TlFQQgXchH5VJAKmPlO2QD0x0AXh+DS7Z+LhMjOct0QcexGI3CbyuRYdZe6XUApHq88ChFeR4nK67nuEh13YKIWnjnL/MC+uvzY4cy6Q8iIFrj0KQSwcP86Yof0RxuQwfsAycpM2NyJ6HkoTJdKFNWX+5RFdpVSAuo33Zi3LM46MT214HPd4cszxpxV8hTP9bLJhJiRZ4xhvbF4nkqCewooIKtRRI4aHXfLKFxVhvty5Pz+P+8IGLyoV5Go7+8txwZsVhY1lq7VYnUZK/KsX0UNyPxHGhzR5w45AnmJR/k6+MXzzooUuaGrLj99XxXzu4RMX8WIG5osNR9Ezo2tNuP+7aZM4hhY92uJTOVfAJWoTCSBcurjSnOPQX/Faw5pUW1FanHNsOjBFgijUiwSgxBEPTZRRml+96MAly9F6rkzbG7zUjeaG/zHSDVBDMcKsw4q9nij2AFAIz83NEZgHM0r3UWwttjE3/WajKsFdQoSCwQc/+su7AA3SY9s/zZhY2cb3QCXETvgRByflCwXD/LwIXcAgHg8Z2jBFlAhUhfkzwnqk3fJQksw0RFvAnCIW0DeF8kR94KdiuQBgagRLNP3GaIzPopaR5zfRjjDYTuiZLyqMd5Pl4Pb6bOhH4my4VENhz+7vsu4Y8xWZSwbBY8wU/xHRThL1TCqR5JnIzAz8/77Hl4YpEljVxPl6O2IqKuj19zTwe/OmCERN9HoKXnoceI0Plx8+NYP/XBh1cVMHSZWVPwEzL1X/8lBKkPw4Q2
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(396003)(376002)(346002)(136003)(40470700004)(46966006)(36840700001)(316002)(26005)(9686003)(478600001)(82740400003)(186003)(110136005)(54906003)(83380400001)(336012)(8936002)(53546011)(6506007)(41300700001)(40460700003)(7696005)(356005)(81166007)(33656002)(55016003)(47076005)(2906002)(8676002)(40480700001)(4326008)(86362001)(70586007)(82310400005)(36860700001)(70206006)(5660300002)(52536014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2022 01:02:56.7783
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f0d64c0e-f47d-4316-055e-08da7422bc95
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5288

SGkgSmFuLCBKdWxpZW4sDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTog
SnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4NCj4gU3ViamVjdDogUmU6IFt4ZW4tdW5zdGFi
bGUtc21va2UgYmlzZWN0aW9uXSBjb21wbGV0ZSBidWlsZC1hbWQ2NC1saWJ2aXJ0DQo+IA0KPiBI
aSBKYW4sDQo+IA0KPiBPbiAwMS8wOC8yMDIyIDEwOjA2LCBKYW4gQmV1bGljaCB3cm90ZToNCj4g
PiBPbiAwMS4wOC4yMDIyIDEwOjQzLCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+ID4+IElmIHdlIGRv
bid0IGZvcmNlIHB1c2gsIHdlIGhhdmUgdHdvIHNvbHV0aW9uczoNCj4gPj4gICAgIDEpIFJldmVy
dCBPbGVrc2FuZHIncyBzZXJpZXMNCj4gPj4gICAgIDIpIExlYXZlIGl0IHVudGlsIHdlIGhhdmUg
T3NzdGVzdCBmaXhlZCAqYW5kKiBPbGVrc2FuZHIncyBwYXRjaA0KPiA+PiByZWFjaGVkIGxpYnZp
cnQuDQo+ID4+DQo+ID4+IFRoZSBmb3JtZXIgaXMgbm90IGFuIG9wdGlvbiBmb3IgbWUsIGJlY2F1
c2UgT2xla3NhbmRyJ3Mgc2VyaWVzIGlzIG5vdCBhdA0KPiA+PiBmYXVsdC4gU28gdGhpcyBsZWF2
ZSB1cyB0byAyKS4NCj4gPj4NCj4gPj4gU28gd2hhdCdzIHlvdXIgcHJvcG9zYWw/DQo+ID4NCj4g
PiBJdCdzIHN0aWxsIDEpLCBubyBtYXR0ZXIgdGhhdCBJIGFncmVlIHRoYXQgT2xla3NhbmRyJ3Mg
c2VyaWVzIGlzIG5vdA0KPiA+IGRpcmVjdGx5IGF0IGZhdWx0Lg0KPiANCj4gTXkgd29ycnkgaXMg
d2hpbGUgd2UgaGF2ZSBhIHBsYW4gdG8gYWRkcmVzcyB0aGUgbGlidmlydCBpc3N1ZXMsIEkgYW0g
bm90DQo+IGNvbmZpZGVudCB0aGlzIGNvdWxkIGJlIGFkZHJlc3NlZCBieSBYZW4gNC4xNy4gSW4g
cGFydGljdWxhciwgT3NzdGVzdA0KPiBoYXMgdG8gYmUgZml4ZWQgYW5kIHdlIG5lZWQgYSBwdXNo
Lg0KPiANCj4gSSB0aGluayB0aGlzIGlzIGEgYml0IHVuZmFpciB0byBibG9jayB0aGUgdmlydGlv
IHNlcmllcyBvbiB0aGUgcmVjZW50DQo+IGxhY2sgb2YgaW52ZXN0bWVudCBpbiBsaWJ2aXJ0IHRl
c3RpbmcuDQo+IA0KPiBTbyBpZiB3ZSBlbmQgdXAgdG8gcmV2ZXJ0IGl0LCB0aGlzIHdpbGwgbmVl
ZCB0byBiZSBhIGJsb2NrIGZvciBYZW4gNC4xNy4NCg0KSSB3aWxsIHRyeSB0byB0cmFjayB0aGlz
IGZvciBYZW4gNC4xNyByZWxlYXNlLg0KDQpLaW5kIHJlZ2FyZHMsDQpIZW5yeQ0KDQo+IA0KPiBD
aGVlcnMsDQo+IA0KPiAtLQ0KPiBKdWxpZW4gR3JhbGwNCg==

