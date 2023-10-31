Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23AB77DD14A
	for <lists+xen-devel@lfdr.de>; Tue, 31 Oct 2023 17:12:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625940.975748 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxrLI-0004fT-Tw; Tue, 31 Oct 2023 16:11:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625940.975748; Tue, 31 Oct 2023 16:11:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxrLI-0004dl-RI; Tue, 31 Oct 2023 16:11:48 +0000
Received: by outflank-mailman (input) for mailman id 625940;
 Tue, 31 Oct 2023 16:11:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kxST=GN=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qxrLH-0004b1-8M
 for xen-devel@lists.xenproject.org; Tue, 31 Oct 2023 16:11:47 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0613.outbound.protection.outlook.com
 [2a01:111:f400:fe02::613])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2f6f1a12-7808-11ee-98d6-6d05b1d4d9a1;
 Tue, 31 Oct 2023 17:11:45 +0100 (CET)
Received: from DUZPR01CA0119.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bc::19) by PAWPR08MB9446.eurprd08.prod.outlook.com
 (2603:10a6:102:2f3::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.28; Tue, 31 Oct
 2023 16:11:39 +0000
Received: from DB5PEPF00014B8B.eurprd02.prod.outlook.com
 (2603:10a6:10:4bc:cafe::4e) by DUZPR01CA0119.outlook.office365.com
 (2603:10a6:10:4bc::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.29 via Frontend
 Transport; Tue, 31 Oct 2023 16:11:38 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5PEPF00014B8B.mail.protection.outlook.com (10.167.8.199) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6954.19 via Frontend Transport; Tue, 31 Oct 2023 16:11:38 +0000
Received: ("Tessian outbound 385ad2f98d71:v228");
 Tue, 31 Oct 2023 16:11:38 +0000
Received: from 0ff7d8298ad0.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 46F043F1-5E66-4D45-B4AD-384D5CDD96CF.1; 
 Tue, 31 Oct 2023 16:11:31 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0ff7d8298ad0.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 31 Oct 2023 16:11:31 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by GVXPR08MB7701.eurprd08.prod.outlook.com (2603:10a6:150:6d::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.27; Tue, 31 Oct
 2023 16:11:29 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::ae6e:f96c:f2f3:efc9]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::ae6e:f96c:f2f3:efc9%4]) with mapi id 15.20.6933.028; Tue, 31 Oct 2023
 16:11:29 +0000
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
X-Inumbo-ID: 2f6f1a12-7808-11ee-98d6-6d05b1d4d9a1
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=biJ6jFuN1WZsBLp/Fa3LyDQdFQCsvuhRE6nMtYwovWJxGyakhtWm6IJpA7yAjMCcc57X7ZjdnxVdQpOqxvfNum02k6XVBZ0j4/1bOUkQ9jiy1l6rmetW6RZE8IYH/4E91qLly0YZaNw1UFf6vBtEZIagzQNgo51NP9LQFBMBn8LOU396OcVVzhOu0sZTFaH7q+isXHyeSZkZiMvJqU9B8pb8Btx2zySS4L1AryFEyBWp47zFce1bO6SQS1zmigZam4S8SPek5r23baZmPAyswvjUVFOmjZTd9xJOnsRES8Aqv0ScZOE6/Ob+s4zVh6scKrxkljsZRCInMmeAjlx43g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5RKu8CaC3+J5cz+iL3NmIuAwtK2XGoiqvGD9RgVVaCI=;
 b=bxgPquHdu7cIupj0mHbLDJfCq7LStgqIZB1eSKlcHgp++eW5p81ED3de8REKN7sRwql6OUxIXPdN8AydgnmuoQulshFYiRpIEeQb5XmeZWveUtXRgv7UApDp/h91CvfJ6jOCYScYpHR8cz+jiH/QNc7/s/mfMhIhvrgvAxThWlG9EjKeYJLYnWIt1KrHxuK0uRKkbpSv3Fi4HWTtZouJfA/GAAdzWg3lSU8/H1s/ltz5KzUP0zH11fMSQTEFPX+ejxrsiIAns3EuW/hWjsyFId65kNWyzfE/yY6HrAGqlxLo/3jTV1onQdog57sAnLQot1YHAPxHH3EsMYiRZiP9dA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5RKu8CaC3+J5cz+iL3NmIuAwtK2XGoiqvGD9RgVVaCI=;
 b=KPdjBacB7oIorctVS6xS/Qgxe6J3nyPR4DPfDrHsZt5GRsr9hJHhq0C6FGSpiwulUIgEOLNjwHkdoRUNUcUPSOw73/snGSa1DHbGVB0xRxufmKh2wI9Frqk4tjrJvdbNNs7PvtGp77AksNuqJbdPQmaZmyX0RkOkxER8Pk+ARuM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: a59492a80f5ce046
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fJXpXnxyKnUpGHM6VX5SuJGG7jod3LfW19mGLQtW/zlXwoLb1eIjkni8mYx7DQRS3bQ0qfYMoWfZgoI0vYdGA5D/U6MJ4JlyioCkmZa9yxlE/o+UxUieE6wlLCPAmDxFiBFdd2MyqGC0c4qBc88v1nUaG66KbGyUsBXaUvn0GRc29OoaXvNeuJ/X/VTSPs9YIUKfpkoh4lNVHzggM7/BaI9HXGzrgWkDClTY7ZF/40G+VSTjoyp5TZTGZMnxfHTHoeko6Bp2v/u9wdXT3tN++5O8aMMPEyEIZVI2+ijNCdSRFwtNDFWT6lap9777n4T7eeb0wN/53Epy+/8ITxGJug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5RKu8CaC3+J5cz+iL3NmIuAwtK2XGoiqvGD9RgVVaCI=;
 b=D8axuXfpZXCF+INRpjBdaLXKluDU+ksC5EOONvPrR52+Y4bCUxWSNazYw/WPldD38sg6ITQobXY+/zqPPPKKe9FjWb+aToipKAdx71FKYEv1wDMxDbdKUNjxkXpbIKGnr1Yeu8DttpV9GN+57TYKt+Jy0LMsi5KnRqVZVLGR6VjUIgCIayU3S6y4BIxSA5x2GTqCiCUIOCbEwgIKGxuMql/+wd1sdhDuxdP16D9sZLhsSZ6Mf82W8zF48toebPWqaUELgkWPSbIOvcMRMBGRsyn9B1fTJ/kBLPQSvJtQTkJB3F6GC+UtkCzzqqY9M0ZdWGUYN8JAwdv71MZQZqAeVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5RKu8CaC3+J5cz+iL3NmIuAwtK2XGoiqvGD9RgVVaCI=;
 b=KPdjBacB7oIorctVS6xS/Qgxe6J3nyPR4DPfDrHsZt5GRsr9hJHhq0C6FGSpiwulUIgEOLNjwHkdoRUNUcUPSOw73/snGSa1DHbGVB0xRxufmKh2wI9Frqk4tjrJvdbNNs7PvtGp77AksNuqJbdPQmaZmyX0RkOkxER8Pk+ARuM=
From: Henry Wang <Henry.Wang@arm.com>
To: "committers@xenproject.org" <committers@xenproject.org>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	Community Manager <community.manager@xenproject.org>
Subject: Re: Commit moratorium for branching 4.18
Thread-Topic: Commit moratorium for branching 4.18
Thread-Index: AQHaByyrPO+3wCfL+UGXB2cQc11Ty7BkGL6AgAACqAA=
Date: Tue, 31 Oct 2023 16:11:29 +0000
Message-ID: <79A0F39C-562F-45E0-A693-1167FDE4C2A6@arm.com>
References: <E63E9C8C-471E-4524-A61B-EB5BA4618288@arm.com>
 <6AA9BF50-8717-437C-9C09-4D81234A8BFB@arm.com>
In-Reply-To: <6AA9BF50-8717-437C-9C09-4D81234A8BFB@arm.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|GVXPR08MB7701:EE_|DB5PEPF00014B8B:EE_|PAWPR08MB9446:EE_
X-MS-Office365-Filtering-Correlation-Id: beb1f9a6-120f-48fc-3da4-08dbda2c1024
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Ec096K+v3XfyD9nHc0u3pahwoPL0R1ZuE7goL7yJOll7NpCqCJqhLaj6Vb4Y+lGcnwj87f6QnTUGqFGo59vB2kWLma+N1BBKp3CAI9ODifYBXC4Sd/6VMLa1f50KhlNBiKBPthjkPdKLz2u5WfE0w+4cSq4olUV1hGa+dtmmSLxVgvQZVBksGfYDxd5EdMGs+lD2OwtI+8WlWdX4ptXw/NHVJgDoZgwY2K+YGXlQu8+YxepZrAm3v+MH3BcI8qvv8bHSu6rTuZgFKnccru23k35zeQQEuNOAJJleVABv79i643E4S4lA+3zFdtfS0zyG4uklvjzgdssCZFY2vreWEHbHrbWyQetalWouy+n5Q1fcskkaU6tzxKQvaOAuSBsB1pUQv3ZKNo5NE9TDMri1YfR5CbZqNhNgq8mDQnZ5e8nfMbNYJXDE9VPJNVqYKTFKb8o22O+fO8qGsrDTVCW9noLe97efcPX5kzfrPVGPlWovjDyV7gT71d4UcAniEBk0qxb6PE2wGUD9mtAvanmFfxjMnP4wrjoHQFoUgpRGFN5PWiyNVC+bL9971aMaQ9ljo3cqEKND7/BmQT2CW+5sxQLatisjeMisuxoRnPD8NTHzmPgRLdge3Bkr7NUyjRcN2jued7HkElwmFHHAGYRTNw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(346002)(366004)(396003)(136003)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(2906002)(66476007)(4744005)(6486002)(66556008)(91956017)(110136005)(66946007)(76116006)(5660300002)(478600001)(66446008)(64756008)(54906003)(41300700001)(316002)(71200400001)(53546011)(6512007)(6506007)(2616005)(26005)(8936002)(8676002)(83380400001)(38070700009)(4326008)(122000001)(36756003)(38100700002)(33656002)(86362001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <40C8BF85BD750B49A5EFD281AF06A48D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB7701
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B8B.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	21f3dfa3-a92c-48e4-1315-08dbda2c0ac4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vG5nO+AAeKFRv2G/96hxVkh8mWFhIk2ZUB9Of31BWe3iAU+wmheiAvkqOkso+Zxh/sETlvG9g3gZmLb2QaJuPvS6xzqOx4H/e3eH3Peew0dRJXAeEMqEe9qcpD5EJiC8Re5wPF3YV6q+1oeAJHx1NjbRRkFbt0jsZRX4chVy0tWB4KfsSBEUHBFR6tgR+cRFzbfflCKo2cLZGgAY+4MQAkZmfwn9mRlMnuRDTyidR98VhiBQlpK3iRhyUXKQufTbNLdYXN3hEINh2GHvNcsoVhyJNahhNQatq+mQrm6T6JCvWDUTYBZQ+e2kHJjm24G+1r/9y07rtUtupZMe/JINEYfiAX5N0hRizPPw0rNSe/4A5Mk1tPl6rl65Mdxhz723SZzhQSGmJyx+KlDgV7ycMTmRimvAIn/wqvfaJkpr0Noxc1GUkM/VIC/x+0aWjELBcYfM0ZO0xR3juZRXrMcbN7Ryr6UKMKAS2ZMOWNdPf6jCV9TBzKWqGREun3BULMH3nrUvpsXG4NANRLFWmxri7gmu7eVIjlODL+D7tXGPDDRxhDfoDTANLPLy39A1yNCvf3wLfPhogJtk18q2SrCOdf7VWViuvIGQzqnv40rCxAIUjlKYjCJHu48M6cAeI1cvcc2V63dMOfOgGSx+in/+HNmDfPLH4KLUgkeZ+v9YEcZhSxeZfMXHjcTxRSPwvGjZMCkJSWiSBXP7itb6/4n96PW5zFIq1P/Zyr2uVyYDeXj47Xjzli2zRVw+q/+WVEUc
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(136003)(376002)(346002)(396003)(230922051799003)(451199024)(64100799003)(82310400011)(186009)(1800799009)(46966006)(40470700004)(36840700001)(40460700003)(6512007)(26005)(53546011)(6506007)(336012)(47076005)(478600001)(36860700001)(83380400001)(5660300002)(2906002)(70586007)(110136005)(70206006)(2616005)(54906003)(6486002)(8676002)(8936002)(316002)(41300700001)(4326008)(82740400003)(81166007)(356005)(86362001)(36756003)(33656002)(40480700001)(4744005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2023 16:11:38.7283
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: beb1f9a6-120f-48fc-3da4-08dbda2c1024
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B8B.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9446

SGkgYWxsLA0KDQo+IE9uIE5vdiAxLCAyMDIzLCBhdCAwMDowMSwgSGVucnkgV2FuZyA8aGVucnku
d2FuZ0Bhcm0uY29tPiB3cm90ZToNCj4gDQo+IEhpLA0KPiANCj4+IE9uIE9jdCAyNSwgMjAyMywg
YXQgMTg6MTgsIEhlbnJ5IFdhbmcgPEhlbnJ5LldhbmdAYXJtLmNvbT4gd3JvdGU6DQo+PiANCj4+
IEhpIGNvbW1pdHRlcnMsDQo+PiANCj4+IFdlIHdpbGwgYmUgYnJhbmNoaW5nIHRoZSB0cmVlIGZv
ciBYZW4gNC4xOCBpbiB0aGUgbmV4dCBmZXcgZGF5cy4gUGxlYXNlIA0KPj4gYXZvaWQgY29tbWl0
dGluZyBhbnkgbmV3IHBhdGNoZXMgdG8gc3RhZ2luZyB1bnRpbCBmdXJ0aGVyIG5vdGljZS4NCj4g
DQo+IFRoZSBicmFuY2hpbmcgaGFzIGJlZW4gZmluaXNoZWQuIFRoZSBzdGFnaW5nIGlzIHJlb3Bl
bmVkIGZvciA0LjE5IGRldmVsb3BtZW50Lg0KDQpPbmUgc21hbGwgbm90ZSwgZ2l2ZW4gdGhlIHN0
YXRlIHRoYXQgd2UgZGVmaW5pdGVseSBjYW5ub3QgZnJlZXplIGZvciBhbm90aGVyIGZldw0Kd2Vl
a3MgYW5kIHdlIGFyZSB0ZWNobmljYWxseSBub3QgNC4xOCByZWxlYXNlZCwgSSB3b3VsZCBzYXkg
Y3VycmVudGx5IHRoZSBzdGFnaW5nDQppcyAic29mdC1vcGVu4oCdLCBiYXNpY2FsbHkgIm5vdGhp
bmcgdGhhdCdzIGxpa2VseSB0byBtYWtlIGJhY2twb3J0cyB0byA0LjE4IGhhcmTigJ0gd291bGQN
CmJlIGNhbmRpZGF0ZXMgdG8gYmUgcHVzaGVkIHRvIHN0YWdpbmcgbm93Lg0KDQpLaW5kIHJlZ2Fy
ZHMsDQpIZW5yeQ0KDQoNCj4gDQo+IFRoYW5rcy4NCj4gDQo+IEtpbmQgcmVnYXJkcywNCj4gSGVu
cnkNCj4gDQo+PiANCj4+IEtpbmQgcmVnYXJkcywNCj4+IEhlbnJ5DQo+IA0KDQo=

