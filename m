Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3483458FEA9
	for <lists+xen-devel@lfdr.de>; Thu, 11 Aug 2022 16:59:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.384658.620076 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oM9eV-0001ZY-LI; Thu, 11 Aug 2022 14:59:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 384658.620076; Thu, 11 Aug 2022 14:59:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oM9eV-0001YG-Hp; Thu, 11 Aug 2022 14:59:15 +0000
Received: by outflank-mailman (input) for mailman id 384658;
 Thu, 11 Aug 2022 14:59:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q8no=YP=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1oM9eU-0001YA-Kg
 for xen-devel@lists.xenproject.org; Thu, 11 Aug 2022 14:59:14 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2044.outbound.protection.outlook.com [40.107.21.44])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 28e16377-1986-11ed-bd2e-47488cf2e6aa;
 Thu, 11 Aug 2022 16:59:12 +0200 (CEST)
Received: from FR0P281CA0145.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:96::18)
 by AM6PR08MB3526.eurprd08.prod.outlook.com (2603:10a6:20b:4e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Thu, 11 Aug
 2022 14:59:04 +0000
Received: from VE1EUR03FT049.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:96:cafe::64) by FR0P281CA0145.outlook.office365.com
 (2603:10a6:d10:96::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.8 via Frontend
 Transport; Thu, 11 Aug 2022 14:59:04 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT049.mail.protection.outlook.com (10.152.19.216) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5525.11 via Frontend Transport; Thu, 11 Aug 2022 14:59:04 +0000
Received: ("Tessian outbound 2af316122c7a:v123");
 Thu, 11 Aug 2022 14:59:03 +0000
Received: from c015735a07c8.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7BB93999-C057-4271-8FC2-F91DE6B2AA6C.1; 
 Thu, 11 Aug 2022 14:58:52 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c015735a07c8.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 11 Aug 2022 14:58:52 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AS8PR08MB8328.eurprd08.prod.outlook.com (2603:10a6:20b:56d::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Thu, 11 Aug
 2022 14:58:50 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a%4]) with mapi id 15.20.5504.024; Thu, 11 Aug 2022
 14:58:50 +0000
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
X-Inumbo-ID: 28e16377-1986-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=JTCQKXY1+QHUiDAlEWEZudoxuKKadf67fQwK21m92w1nOoIH/7PT6gf5nuMpNPFwm9QyMQZ7nyAi4aZCgdKtm/sJXZt0n0h0/eepTsPqIvoYeqdA1tUyGnpvC8fkzj/mXpPuGNz4KR6Qrx8zdoaaV+uhgbh7AYWg7szMYjAoE7OonJ6lRoYrNLgiV2SW/DeNtA92YFCMPzeNGshYZtU1swZTEoUgvczfLLwWwSQkMw8Q8EY8+VJ58VAmfGxmLFFL2fhaP4D+K8Oc8Thlo3jrm6UquM2giawqQ1AbrCQxp64Ymfl6lqrHAgLRSV3x0O7r6jR3bPLMx/TdVlExKyXktA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xpPjzz922B+GbkLI2qbtlyGbTL/cglPwEtotB0ioU2U=;
 b=df/1rtkDurtUWW8kKbw3/eFkdMFC+Y7gt6UbDHcYG5YvcsU5qLiWbb/bc4I9R3EDcGvweu5btISMi3L8Xrahyxt2hsKwa3FWYWeaYA3C1m6gEHDvbj2Z/5y9qJJtc1SIB9AQjbEMMDdqg/6AZkkuSMQVbLubJJj9jjIYWi/Ae1LgDNmr7k5I3kvmp4EKf0JjwI1haIw6ohWfN0QxacxY772vi251kz5GikjZOsiWVafYqZvYc/GQExtDK753Oy3geYRj1lxcCdwgaUaE7vO4qe5vbwPTPHbLvSiWYThMgY92UNx7Npy25vW03ShrDCMmo2jQkqAMtLen4EIaXErR8g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xpPjzz922B+GbkLI2qbtlyGbTL/cglPwEtotB0ioU2U=;
 b=3KzH9KWzN9vtJ91EnEsYkWIa3ylP4jsMkF186AniJImJAPntH0aXOxuc/JGvV86NEWZmzdK3Nsf5i5JnTYrzEkk4e4tEtFQ4e2c9+BSo8PsExhcRVl+YPIbRvu8uSgrzmV9VoaI3jffr1VChSfeWLf+A54os20efLQJlc3kybRE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3f9944ec7b038bf3
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jb3why6vW2cJVO5mhLhGxk8jVGhkBhnlyHJ+BnEfJRWDs033h2qp8B7AaAzXTZKbAW8sGGGv/oCXST3f0VI/1gYZHNjEnLymbeZJDh8h/wILK01FOXx5uCHjpxoQUzOhdbLbz/VwiC2vzoywHYuuzaU0EkBLdWZO+lsWQzZgjC5e9m9rFUSe7329PKKHcINFBeSCNnLieSmAZOhqqYUimtnvvj7o6m8Hrw/0WMAtTM4coZcd1gGC7EyYSewYEsJTP0R5xOT88KW9HRSWdnHaixJUTrzNKPNE4gctNFudrtS+RtBnx9hyuSogA3bYgjyD3xmaubZBp+CfrJWo+afLGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xpPjzz922B+GbkLI2qbtlyGbTL/cglPwEtotB0ioU2U=;
 b=eaYVfk9rW7igJ2JqZucDv20WDDltIKK7zu6kkZqS7Ej6Ka5RmLgH4zOOfBe4KdDdNTsHw8zjg9QT7Hpb6ekB8b9t7exdrEJlzsagbMQrk5SSAMbPUQaXigf+TvCEqpo3EEqyOYymdeOdteUgN6JHC+57K7oC/N4mcgkEGyE5ilXnpRpYwTXK+4IceqVkvMceOXvbik8X0qaH9PRuLswViymou/qEi7lYgBuxgQwZdVROP6DR3zLRiF5JBhP+ISfzb4kkjlLm1Uz+lQLcPcaQvYThsFbm166wx/uPskQFFAa64oPJs2GKgCRkYOWGOeaU3oIvQNcq/2Ukl3jweboGaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xpPjzz922B+GbkLI2qbtlyGbTL/cglPwEtotB0ioU2U=;
 b=3KzH9KWzN9vtJ91EnEsYkWIa3ylP4jsMkF186AniJImJAPntH0aXOxuc/JGvV86NEWZmzdK3Nsf5i5JnTYrzEkk4e4tEtFQ4e2c9+BSo8PsExhcRVl+YPIbRvu8uSgrzmV9VoaI3jffr1VChSfeWLf+A54os20efLQJlc3kybRE=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: "leo.yan@linaro.org" <leo.yan@linaro.org>
CC: xen-devel <xen-devel@lists.xenproject.org>, Peter Griffin
	<peter.griffin@linaro.org>, Jerome Forissier <jerome.forissier@linaro.org>,
	Marc Zyngier <maz@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Rahul Singh
	<Rahul.Singh@arm.com>
Subject: Re: Question: Enable LINUX_EFI_MEMRESERVE_TABLE_GUID in EFI
Thread-Topic: Question: Enable LINUX_EFI_MEMRESERVE_TABLE_GUID in EFI
Thread-Index: AQHYp9oMDnfnppRN40WNR+bqQStYIa2gMcaAgAAFzACACZLNgIAAC6aA
Date: Thu, 11 Aug 2022 14:58:49 +0000
Message-ID: <26D200AA-0CCF-4778-A748-36CE448C6AB9@arm.com>
References: <20220804081253.GA1219098@leoy-ThinkPad-X240s>
 <D6DDAE40-A8EF-4230-A292-401FBA085EE0@arm.com>
 <EA8A294E-856D-4579-B26E-55F6B7EB477C@arm.com>
 <20220811141707.GB868014@leoy-huanghe.lan>
In-Reply-To: <20220811141707.GB868014@leoy-huanghe.lan>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: b5917aaf-bbbf-4ebd-0d5b-08da7baa0879
x-ms-traffictypediagnostic:
	AS8PR08MB8328:EE_|VE1EUR03FT049:EE_|AM6PR08MB3526:EE_
x-ld-processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Sb1jelktBxfSgXzVmEf87tOR3QgJ/fhdBezeHNK4zDUYxkXLf0k5WxDfEGVPiJm43CbFZ65QMqp82kSrHnlHMIrS6j6V9Y+ogiKxh/PhowEdqX3u0cdkOFF1xjkdcHd3H+LiiJlNd9pDK8UxNqUCVU/0dBM+1yk+Q1s7HTZ0iLKF63T4jiwWppkV82tH+Ak2iNltu700HN4ZUFmzIeYMzGQkdaTexPaLpGW/E/uPZ9oykdCBGVpYtd4kcjPIJNp4OBqBJ+fQXIMN1Wtw2lhMUsqRQ8zPMrfve4oDxXAJK9iiLZoFIfF6pe/gc3OeSBDYx11eTWV92bBMwnrzSb73CiHgIve9KPXzch/zdh+HUkC/IZMXymPbLl7qcAR8uFSKLOidaDDpnk5kAxmCLNY66DIYZhmmO1cEwmxPTYQvdcL1Zc2Pk0RcvTfqjGnthWM3QiPRn7bjpy7C+omTbHcWfIeLpgmmEVUnFF7bGHj63ztLsP0bkdIHKfbWYBiA4Ae0683PsU5EF0ztjIUg+ODnLJT5qWiC0QUb7rtRPpVDktDNCK226qFKyDzzGAteDrS671pH7vXNRHHSNkaj/N8mG7eLXXEE6teawKl30BQjw+HGzI51SlRwmZXkmjNPFJ1Wzj1WkTC2HT403bNADDmhbvyTdZAhIee8VwcT2e+hLeswU1K2Anoqvbp/l5OSaEy2SI77xCCXcpWHgd0886MyGO5kXavGxAwHFwMSHSMsVoMtAoXGI6v3qxZf+ryoQMJwx3V+57xzuJi97w59uzebmF7rd0er4fcInJQm6bPOIixxd4Z0M5E2cktzCEq/b0srnjqU+nttZPNmNjxR0FJ4lg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(39860400002)(136003)(346002)(366004)(376002)(66946007)(66476007)(8676002)(76116006)(66446008)(64756008)(186003)(66556008)(2616005)(54906003)(4326008)(91956017)(2906002)(316002)(6512007)(53546011)(33656002)(36756003)(6916009)(6506007)(83380400001)(41300700001)(86362001)(26005)(38070700005)(122000001)(5660300002)(71200400001)(478600001)(6486002)(38100700002)(8936002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <775D71003984B441A78FA5FB9B712E11@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
 =?us-ascii?Q?zuk9jTrqo3z5ooPjvuFc/7HlH31dcYamCebzc0P703/xyT2BY1H9fES7mnGd?=
 =?us-ascii?Q?pLnjaAyZqB7XWIVLnZj3aNIEcy3nr6oPxlonk6hcAQ/gBfWq5n6vs1lj3Gr4?=
 =?us-ascii?Q?R9lWfXfdc7arEzDe2nByyOHiqC/8MaZipLMFmvQkKvDo03kP7lHITvy8M8tk?=
 =?us-ascii?Q?mcgXzcqDPQAzBOQO+pBZsetBNzTaDawt6ixv4YpGYoADrGhpExRhtrPgjfmK?=
 =?us-ascii?Q?XIF/Ql7lS1EvigRSRlQxvQ5xCRg5gshzlXl4yxnkabzy4J3qjls+5o2YyKup?=
 =?us-ascii?Q?cPDhrVzhEhI25zNUNOU2n3mlFio7y9WzxWyON81w+YYr3nTAJrCCPEM/Nh2b?=
 =?us-ascii?Q?BPJdOyKH7h/qUZB2yECkgvY9r7NjZvjL+F8r7vGgah7YcOjmJF5NxeCy94KY?=
 =?us-ascii?Q?vuEKJ+cWRLH5eF6ZZ9vxSaZCSSzIIy1nz7d/Xxe/hWxcRjelBRr2rEw9NfUd?=
 =?us-ascii?Q?7XJk7Ssfd6FgnLwrCsHvbWCQGU0B8IFqAwJemEg1Z989oFb/vrTL1rdNiqEN?=
 =?us-ascii?Q?dCSbbhjWWt4c3p/+5Z+u6KgZLc6XqEf0kKPfbqniExxcK6bJvwNu9eMND7D7?=
 =?us-ascii?Q?KlQQtKmZA0XIkkj5swC9ItmFVpcdIIu+rNwp4VfwuHMCZlfaW+zwBpHi4W4a?=
 =?us-ascii?Q?F0e9tEXPQ5eMh3Ts6G58QDNi4OjfIxZN9jkaDLVQLbxvwyfWa/RFQOkC5LQp?=
 =?us-ascii?Q?BNHvUotALDF0KVoyvVmTBIqAsUYlwYzwb8ABPNB8hoMkjIaJWRYqTLHc22+P?=
 =?us-ascii?Q?FhtJG4/g/2zpPhk6BCeJjH+GnbWdIOYZHWaL5g9dWiVJRve+ApF5v3mPg/iB?=
 =?us-ascii?Q?mKfgchgEUHJJIsWnr+oyCHvuABlSjfWbA+dV8TNzr9l5jmW/EVjzTmxUqxdr?=
 =?us-ascii?Q?2PwvwHNB7uQs1gddgipZLRDMFeWF/PMVk1akrDb9FPT2hO6RNeJXeByqLhw7?=
 =?us-ascii?Q?S/mlttEamg0uMPA6u5qvTCf/gNPPt/uJS3nCAOhtioJpTV7SoJj3aDk7XRdB?=
 =?us-ascii?Q?UyXc?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8328
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	55d075de-9f0c-46e4-fc4c-08da7ba9ffe5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XN6m8htMPjV3xQyO1/B9qRABferNh7E12MmE/++Z+WVCLF1PvGdB3dp68BdDi3Nz2YpiIVkmcZjqmcEUELUpw1lUEZEVcBGGNQ8rLF/f2gUSoKg8GP97uDA1GUe527+nDLU//ieP0WiNkKEASOU3tj202anT5eKfYtEFhQI+J+aPVJJMPKDazSdiZJuLvIMDXwBsgwNOjX2SsKd1X+juB9Pr4Zjw5QQukypT+Ve1xMiU7zkvIMX+tYl0DX2KCwob9La+duqErdsW0W5Wzuwv1Bu521f3MIcwmbLsTRNbQNEx4NkE5gqhqZGtSYaMmx9A7jeLDXuryxq0qo/QvJnHzH0Gs98WBedZmAr8lHvt2i079PrzceZFIoS8Yx+7KzFMN+AreTx5jM2d9okKokiJXrg1Y3siZ+faHHiXmn3j6sjBl+HH4NvsCYTLiFo6k4/qrAlr+AVVobSa9U+shomjtefmNRjgo4BIye6TDC4dUMchJbxkWaXUhJ3xHsycBc/F2qD3EsZbTiZwx1lE5Yv4AJHnWxBxCcPkptzE0n3luZzE7yU5nihOUt4pOHoEIjqbRQsDacTc6GMzjXTFBvkQ7PueIZCaxPuE69fKfSgNsJKJxMAgTEAO55aiYxbwdE95zsmoj5HEPZnSlkrqFlZDhPG8uL8AbMRxbJvMOg6iW7iUT3LKd6BY0E+QCyWiWnpdFoH5ajvnXF8HLiREip6VUvx9drfAvVRDsk59pLEExVQ5anf18y+USdIMRSUk4wAKJvwnO/Ik29bDfP03Mo0ycxFxpHgiXzB7L51EsDxmpxKOcMJlzG6MoVZoiJ4rozof
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(136003)(376002)(396003)(346002)(39860400002)(40470700004)(46966006)(36840700001)(86362001)(70586007)(8676002)(70206006)(2906002)(4326008)(81166007)(6862004)(8936002)(36860700001)(41300700001)(356005)(40460700003)(82310400005)(316002)(40480700001)(82740400003)(53546011)(54906003)(47076005)(186003)(33656002)(336012)(83380400001)(6506007)(36756003)(2616005)(5660300002)(478600001)(26005)(6486002)(6512007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2022 14:59:04.1904
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b5917aaf-bbbf-4ebd-0d5b-08da7baa0879
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3526

Hi Leon,

> On 11 Aug 2022, at 15:17, Leo Yan <leo.yan@linaro.org> wrote:
>=20
> Hi Bertrand, Rahul,
>=20
> On Fri, Aug 05, 2022 at 12:05:23PM +0000, Bertrand Marquis wrote:
>>> On 5 Aug 2022, at 12:44, Rahul Singh <Rahul.Singh@arm.com> wrote:
>=20
> [...]
>=20
>>>> Looked into the code, the GICv3 driver tries to create persistent
>>>> reservations for pending pages, and the persistent reservation table
>>>> can be used by kexec/kdump.  For the persistent reservations, it
>>>> relies on MEMRESERVE EFI configuration table, but this table is not
>>>> supported by xen.efi, I think this is the reason for the above oops.
>>>=20
>>> Yes, you are right above warning is observed because Xen does not suppo=
rt=20
>>> memreserve efi table. I also observed a similar warning on the N1SDP bo=
ard.
>>>>=20
>>>> I checked that if I boot a host Linux (without Xen), then the EFI has
>>>> provided MEMRESERVE configuration table, I can get below log:
>>>>=20
>>>> #  dmesg | grep MEMRESERVE
>>>> [    0.000000] efi: TPMFinalLog=3D0x807f9ef0000 ACPI 2.0=3D0x807fa0d00=
18 ... MEMRESERVE=3D0x807f8141e98
>>>>=20
>>>> Just want to confirm, is anyone working on enabling MEMRESERVE EFI
>>>> configuration table for Xen?  And welcome any comments and
>>>> suggestions!
>>>>=20
>>=20
>> No I do not think anybody is working on this at the moment.
>> If you want to work on adding support for this in Xen, we can provide su=
pport
>> and help on reviewing and testing as we have several targets on which we
>> observe this (N1SDP and Ava).
>=20
> Thanks for your quick response.
>=20
> I took time to look into the code, below are my conclusions.
>=20
> For a normal UEFI boot flow, UEFI will invoke Linux kernel's EFI stub,
> and the EFI stub will install MEMRESERVE EFI configuration table.
> This is accomplished in the Linux function install_memreserve_table().
>=20
> Secondly, Xen passes DT to kernel, it synthesizes ACPI compatible
> nodes in the device tree and finally kernel parses DT and create the
> ACPI table.  In this case, Xen doesn't invoke Linux EFI stub.
>=20
> To be honest, I have very less knowledge for Xen and APCI; just based on
> reading code, I think it's hard for Xen to invoke Linux kernel's EFI
> stub, this is because Xen needs to provide the EFI runtime services, and
> I don't think it's feasible for Xen to pass through UEFI's runtime
> service to Linux kernel.  If we implement the EFI runtime services for
> Xen, then this would introduce a big implementation.
>=20
> So another option is we simply add MEMRESERVE EFI configuration table
> into device tree, just like Xen does for other ACPI tables (e.g.
> RSDP?).  And then in Linux kernel, we need to parse the DT binding and
> initialize the corresponding variables in kernel, so we need to add
> support in the Linux source drivers/firmware/efi/fdtparams.c.
>=20
> Before I proceed, just want to check which option would be the right
> way to move forward?  And I am open for any other solution and welcome
> suggestions.

When Xen is started using EFI, Linux is then started purely using device tr=
ee
there is a standard way to define reserved memory to linux using the device
tree and Xen should decode the Memreserve entry from EFI and add the
corresponding entry in the device tree that we give to linux.

Regards
Bertrand

>=20
> Thanks a lot!
> Leo


