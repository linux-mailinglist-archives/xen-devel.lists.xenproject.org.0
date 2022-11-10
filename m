Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC29623E0A
	for <lists+xen-devel@lfdr.de>; Thu, 10 Nov 2022 09:54:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.441540.695665 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ot3KN-0003s4-FN; Thu, 10 Nov 2022 08:54:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 441540.695665; Thu, 10 Nov 2022 08:54:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ot3KN-0003pz-Cc; Thu, 10 Nov 2022 08:54:27 +0000
Received: by outflank-mailman (input) for mailman id 441540;
 Thu, 10 Nov 2022 08:54:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jazc=3K=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1ot3KM-0003pt-RQ
 for xen-devel@lists.xenproject.org; Thu, 10 Nov 2022 08:54:26 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60060.outbound.protection.outlook.com [40.107.6.60])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 46d3df98-60d5-11ed-91b5-6bf2151ebd3b;
 Thu, 10 Nov 2022 09:54:25 +0100 (CET)
Received: from FR0P281CA0138.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:96::7) by
 DB9PR08MB7747.eurprd08.prod.outlook.com (2603:10a6:10:396::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5813.11; Thu, 10 Nov 2022 08:54:16 +0000
Received: from VI1EUR03FT060.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:96:cafe::1) by FR0P281CA0138.outlook.office365.com
 (2603:10a6:d10:96::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.12 via Frontend
 Transport; Thu, 10 Nov 2022 08:54:14 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT060.mail.protection.outlook.com (100.127.144.243) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5813.12 via Frontend Transport; Thu, 10 Nov 2022 08:54:14 +0000
Received: ("Tessian outbound f394866f3f2b:v130");
 Thu, 10 Nov 2022 08:54:13 +0000
Received: from 04a61264e464.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 57490369-0796-4CD6-B613-3C658C5263B4.1; 
 Thu, 10 Nov 2022 08:54:07 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 04a61264e464.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 10 Nov 2022 08:54:07 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DB8PR08MB5484.eurprd08.prod.outlook.com (2603:10a6:10:111::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Thu, 10 Nov
 2022 08:54:06 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::58db:2a7f:e8f5:92ad]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::58db:2a7f:e8f5:92ad%7]) with mapi id 15.20.5813.013; Thu, 10 Nov 2022
 08:54:06 +0000
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
X-Inumbo-ID: 46d3df98-60d5-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=F8UQG72crJZajTCLcrPvdckCLVJh/VT1mM1ftpVSQs6NbjIMr96YKIxqFTCalrk19WPAVV9toeOhzZYNy7B/KfGf6cfpqgd47cRgDoZEJemVI5Y0jKfmJ1qfieCY7dmBLFdCRSjffo27f0n28nBKHVQpldD14g57L+2rqWQaqUOxBj7pvXOix0IsT8mmRhFdJ5XFrOLj5pKn1/pqWlzHf4klvMcrEPG+gi4foabFi5PK5NR4nWYGhp3omIB9PZzBQHYJ60Cbr3nnKaPIkofDI3ca30MwJIz/cl7H63wwswlV2WE6a7olppzAmn4Hj+SncA8BraPN6tBaqRf421XFrw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lAE9CgBaMSnFZYP3w6bTPL/eIphS78Wy40DT5C3H23E=;
 b=GSqDJkG+ktXEb1bzeIr5j89OXTn/P6zyMCTzFvsk6pGveHrj15sSqUJmFm0aTPretYLw3Jj1wj/RlDhXAkTTLAtqwtWVmocMuRKF/TYAaneBJhgOQbIeVzQsNQsmUQgvCuViuIoF88ESHeblyzKvWZHz5f1Kh9D7t+QhRzU51+H4k2YLHHhLoZXdw0jgswP42Ky140F0Lt4FZit50LFkfg7mSs2Q79JESODUdjJ4276WSecAFKUFha5ihZ08h4rXQxCY3dsdRxEUKFrPwe84pXs6cmG/T2pmvJtGzgMwzozUuaCjMgkW+YUVBKpzA7cCbuYTHTghIfG58eQHnDgR9g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lAE9CgBaMSnFZYP3w6bTPL/eIphS78Wy40DT5C3H23E=;
 b=Nbq28TtknWBH4i+x4XhD1ydRRhgfy5v3hzP4nFFTyERefBU7OvQGC/+MXtckJT10Mr1sfblFjAT6MDuInQIEQ7/BUEa5kd6zkkHYni8apHMhhqyJ4uIcCziF+O3vxNR4nj7VrDiaJfZ6KX4Nt/JNAiAyM6dE8VtmxYSnuTEsFnQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3b3e77e605d14de8
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=da/IsVPCbXZcfJcQL9GPXQjYndKbFFccSC11qGnyMolUpi8vnE4zPaBPd3Ehh9kOLOGcbbYtQzhkdj4DHg3DB3iGpQK4FDNhZlhpm36oYUgkCx0Jg6usDCSyAK0N5ygurQlHqTPbx7L9DFWK3UbxsIOgbRql9ZFRHaQsR+z849oTuV2FkLfH6SajrLH2RuOgfX0JF3xtk8gWbMJbYUd5JD8J/Xq/nE02PxEOpFqrPnnGwByaO/BG8Bgu3h3I1cyaWeqebV7JbqleF4PH4p//0FIr8ufCXcV+ku0UyaD2FrV4O4o/57PHX07i4mywkt8R/jI3hJGhMSJlaAxA4zrtYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lAE9CgBaMSnFZYP3w6bTPL/eIphS78Wy40DT5C3H23E=;
 b=ZH1TG8EnAWQeY9a+b5KBIKSBk89nZzbJ4oyfJ1Dfi/7l9ExGKjMLVQMYv4gn1ve3Zl9abdRlagxH1DGGMhRXGwNiuHPX1xAVQKZUtiDpk8hu7Nw83eh1KrJXx0vy65jGwqTFDV3hTXlvoMBV2x8e4YB7JrURBqw7zlNr30DpDov962p/ySamYIPvStjBMUd1oQPYBPYXXHgrtxs01Y734zEouvqO7fZsNXD3dQThBJyqQujnsWZlJGWYWQyLiMT/LdUt/CZtWw5TTgZQwGYlRbxjq+uU/rEYPpl5fGrCBRuSFr8aDtFuNEs+dfKEfIYkdPg7yvZqSML93BYBGbq9fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lAE9CgBaMSnFZYP3w6bTPL/eIphS78Wy40DT5C3H23E=;
 b=Nbq28TtknWBH4i+x4XhD1ydRRhgfy5v3hzP4nFFTyERefBU7OvQGC/+MXtckJT10Mr1sfblFjAT6MDuInQIEQ7/BUEa5kd6zkkHYni8apHMhhqyJ4uIcCziF+O3vxNR4nj7VrDiaJfZ6KX4Nt/JNAiAyM6dE8VtmxYSnuTEsFnQ=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	osstest service owner <osstest-admin@xenproject.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [linux-5.4 test] 174684: regressions - FAIL
Thread-Topic: [linux-5.4 test] 174684: regressions - FAIL
Thread-Index: AQHY9K76AziskhXElk+EohtHPDzhJa430IgAgAAKE4A=
Date: Thu, 10 Nov 2022 08:54:06 +0000
Message-ID: <B18BCE65-0099-4704-8F40-5E4615D043D0@arm.com>
References: <osstest-174684-mainreport@xen.org>
 <0fe79723-d279-9744-b6c5-8c43e6bb29cd@suse.com>
In-Reply-To: <0fe79723-d279-9744-b6c5-8c43e6bb29cd@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|DB8PR08MB5484:EE_|VI1EUR03FT060:EE_|DB9PR08MB7747:EE_
X-MS-Office365-Filtering-Correlation-Id: 6de2541a-ef18-466b-c2a6-08dac2f92496
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 4xTLX6XwNm+eLN9EVBFjKcV04dUequYCppZtcFfrGBYXkWtZ8ptIU0l9LezIsViL4Gk+pGqbry9Gs/Ys1yamt616W/6hMe4WWlxpQq4LDvPvx1SuTHh4jGI3fey0DFLK51G/8K7Gf4HbOZXX9Sk13bZ53oU87F8PP2S/YDqhbRY11Udej7GthXpk7+H3An/S1Uq0YQB+OBc5oD03OV5FsS/yxsTvWi2qVESnEpmoTo8V07IxzpGgHxXRu5n5hR6y54dZSJjK4vuKiiU+t83kk3CSFbMUXNRbAUTdNfnUSpeYhzJggsbjaSgG9pt2KoTenYZzabXvd6gWb0zHxBg1GnJxkNFvaRTRaHj+twARw1vtv8iwAnSYi+cnJj0RyFIfz0O+d6XFxNDAP7JxfUi9EZMTaBA/DdYXzMgQclm0c5gsJGZiih2hbyUxsuwmbyS+/q3IXaXJtTd3aF5/10hTgSFplObmmU2b+v4Ek0iiFt9C298ejtKgde2BVrqpz9I+wqF0Oa7qs98tttmqd42YG4Gwr4INOlG+Jkt1hh8W1UwBy2eYYh3/idAjSWPesFacDOSMyBL/3ZxEh3ttL7PnfZQmmDGjDkjIzxsS2wrzs9I/seqnwo5dP9jyF2mqiUUbJ+qNuORXYRPg23MwbnRTg02C19nMIxJztjpElr8xRTSBum2QE00MQ++708g7y3wCDvpYdj9Mx8LjWkfwbIXSXWZKGA3UIv+eiAdjsO2F0nd6v06zE36nB67LdIkYRMKWByKS2v9HPvVB3upjAIQIYe3r6TGB8WSVYG7c6sPE1P7vl5h4lntyRM0X7NGbO3rXqTGXtuD34AEkNnaKhMeBbQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(376002)(396003)(39860400002)(366004)(451199015)(53546011)(6506007)(2616005)(6512007)(38100700002)(186003)(122000001)(26005)(83380400001)(2906002)(5660300002)(8936002)(54906003)(6916009)(6486002)(71200400001)(966005)(41300700001)(478600001)(64756008)(8676002)(4326008)(66476007)(66446008)(66946007)(76116006)(316002)(91956017)(66556008)(36756003)(38070700005)(86362001)(33656002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <EA5183BB00948B4A991C7FBF3C7589BB@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5484
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VI1EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	bd912cca-5a9a-415a-bac1-08dac2f91fcc
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5AR7sMfCFF+bC9L9caY3opcTdL9RJlqx9sgvav4nC3pP6mc+OIStWYJuFD4VdFiDCoAYkSeoQhEzXVaSRhuu4DCFS6jANCVzwHruCav5lNjL3SsI5RZmVLmiHbYRlHAQ3VJlbCan0rpcJbtx650kZyGq0JJD92cO09RytYeNGn26NNHDsW9rag8diUMqQJXjoALHlJGke1qwjvZLKNBdqPFO+fG1pIJwKDYR1ML+kwiyTA5moF6VUK/DykgvzdZ9feAW9ZGuOvzwQLVfvOBfzZDsPGcbSLb9+Xi/kAPae0ywHjK+xAh44aQ61bK5oPNgp798uvsWSNcKNYdTYKWgQ8tSzto8ybVzHnyor5OMBcEjzUXGtyyQJvhmGBRWv9yLd4zJixTUdDeFoh2wIsMzGldvH6kQ4k0xkyk8kug11VKw4UW6fat00UiMi3LQtuvOSgc47VrkREf8GSiIx0CeBizTZFBtA+UYVc/O8fIh3RrOIQ0i3EB9HvCHTHRsdFQbn0gXRTE9Ek+UrWHW2KpxSh6992EGP+V/VIrTmiO7jLSEQzZ1QQCAGt5OjEZoR+UJsLI2rPLHPldYrwGRUI/EMf69FUJf0jzNd8Qiv32jlHZrW6vXpipG1CXG5vvX+U+VnR3V3OH+WSmM/E+QXqx7bRSSZ4soNscnm6qSWWK85tP6QO8aKue7a4r/G9OcbPW/JeR3CNIHUg1ZqOvw03aW7WS5/nPFIxsZIB+N4gYWr6gwXpsmYi/XZJ3P1cbC/cGeqqlZ+PRUHLf88+f4q9oPaVNhsbPRrfg/50hOq+Um1UVYHhzqrhW2br++qoYXtXVS
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(136003)(346002)(39860400002)(451199015)(36840700001)(46966006)(40470700004)(36756003)(40480700001)(33656002)(70206006)(54906003)(6486002)(86362001)(82740400003)(356005)(6862004)(966005)(6512007)(82310400005)(316002)(36860700001)(70586007)(478600001)(81166007)(6506007)(5660300002)(53546011)(26005)(2906002)(4326008)(47076005)(8936002)(41300700001)(2616005)(83380400001)(8676002)(336012)(40460700003)(186003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2022 08:54:14.1758
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6de2541a-ef18-466b-c2a6-08dac2f92496
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VI1EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7747

Hi Jan,

> On 10 Nov 2022, at 08:18, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 10.11.2022 03:48, osstest service owner wrote:
>> flight 174684 linux-5.4 real [real]
>> http://logs.test-lab.xenproject.org/osstest/logs/174684/
>>=20
>> Regressions :-(
>>=20
>> Tests which did not succeed and are blocking,
>> including tests which could not be run:
>> test-armhf-armhf-xl-credit2 18 guest-start/debian.repeat fail REGR. vs. =
174540
>=20
> This now looks to be failing relatively frequently (about every other fli=
ght),
> and I'd rather suspect it to point at a hypervisor issue than a Linux one=
.
> Looking at the log I found
>=20
> (XEN) d5v0: vGICD: unhandled word write 0xffffffff to ICACTIVER0
> (XEN) arch/arm/traps.c:1985:d5v1 HSR=3D0x80000006 pc=3D00000000 gva=3D0 g=
pa=3D0000000000000000
> (XEN) arch/arm/traps.c:1985:d5v1 HSR=3D0x80000006 pc=3D0x00000c gva=3D0xc=
 gpa=3D0x0000000000000c
> (XEN) arch/arm/traps.c:1985:d5v1 HSR=3D0x80000006 pc=3D0x00000c gva=3D0xc=
 gpa=3D0x0000000000000c
>=20
> with the last two messages then repeated over and over, many dozen times =
a
> second. Which makes me wonder whether that verbosity alone is causing a
> problem.

The 2 messages are not necessarily related.

The first one is a warning and the write is ignored, we see that all the ti=
me with Xen in Debug mode during linux boot.

The other traps, with PC at 0xc look like there was an exception in Linux b=
ut the register pointing to the exception table is at 0 which means the gue=
st did an exception before it initialised the exception table pointer.

When a guest is going to this kind of error it will loop on this:
- exception
- jump to exception table at 0 + offset depending on exception
- trap in xen because 0 is not mapped and push back the exception to guest
- go back to step 1

Now it could be that the first exception we reported back to guest should n=
ot have been reported and the guest falls into this loop after.

Our CI was a bit late compared to staging status until today (due to some s=
ervers being down).
I will check what is happening on our side with the last status today on ar=
m32.

Cheers

Bertrand

>=20
> Jan


