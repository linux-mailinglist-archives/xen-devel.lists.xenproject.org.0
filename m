Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9738A75016B
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jul 2023 10:27:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.562050.878605 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJVBV-0008BK-5B; Wed, 12 Jul 2023 08:26:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 562050.878605; Wed, 12 Jul 2023 08:26:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJVBV-00088R-2O; Wed, 12 Jul 2023 08:26:53 +0000
Received: by outflank-mailman (input) for mailman id 562050;
 Wed, 12 Jul 2023 08:26:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mhes=C6=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1qJVBT-00088L-Lr
 for xen-devel@lists.xenproject.org; Wed, 12 Jul 2023 08:26:51 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0617.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::617])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d856e161-208d-11ee-8611-37d641c3527e;
 Wed, 12 Jul 2023 10:26:49 +0200 (CEST)
Received: from DB3PR08CA0033.eurprd08.prod.outlook.com (2603:10a6:8::46) by
 PR3PR08MB5740.eurprd08.prod.outlook.com (2603:10a6:102:87::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6588.20; Wed, 12 Jul 2023 08:26:43 +0000
Received: from DBAEUR03FT050.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:8:0:cafe::e8) by DB3PR08CA0033.outlook.office365.com
 (2603:10a6:8::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.22 via Frontend
 Transport; Wed, 12 Jul 2023 08:26:43 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT050.mail.protection.outlook.com (100.127.142.250) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6588.20 via Frontend Transport; Wed, 12 Jul 2023 08:26:42 +0000
Received: ("Tessian outbound d7adc65d10b4:v145");
 Wed, 12 Jul 2023 08:26:42 +0000
Received: from e93874af4946.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F1AB98FE-B333-490D-A544-764E0D3058E0.1; 
 Wed, 12 Jul 2023 08:26:36 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e93874af4946.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 12 Jul 2023 08:26:36 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by PAWPR08MB9736.eurprd08.prod.outlook.com (2603:10a6:102:2ea::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.31; Wed, 12 Jul
 2023 08:26:32 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::488c:5182:718d:7759]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::488c:5182:718d:7759%4]) with mapi id 15.20.6588.017; Wed, 12 Jul 2023
 08:26:32 +0000
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
X-Inumbo-ID: d856e161-208d-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/fdltWaRaZ3Qd0pr9Pl71uUsm0vggxSmJCiXLHjsZOE=;
 b=uVa+MgTyINWUhLK1R6Z74mI22+EGbVYYTSbHBW0cWyHWR1SSYnXxBrSKYOEVWzzZSQj+RguwQn/30Iq9E7DDtejRvY493wJdBFrqc9B6DuH3hUdq1GivNwrqMxvDs8MmmlmyVIKXX/38M9EtxDu2IT4JY7czIMU+60wq/tIYWBI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 23ed87bb55ad49c9
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=imr9aj5WcY+HdeDTt0vfkcz15RKo6/87Pmy+K5aJltwOU6XZuGJ8u1newIq/e82HFvXbXKNGMx4ODBi6wJAC08BqETJoQowOaAJG/7mwB9VnTC5ir+mvkkVoru8cfBqfYKNLSti5OeiZh/YTKVEU4bLxpYiof9N3TaxtWGbRsieFP4kMjYmuKHc3+7KC3EUsH7QLJcF2jg8PtmbBeTNE9dP7K2NDDcin1M3xdcuHIr2nfJrZmevwbSc/3TyZBxxUkwcKgs1gT28boqsv1sM2/mlkEph3RSSgktcBT52kKVWZMHK99h7AWWLjaJbda3NAE/+VC/EwRvHMJ18Fr/JAOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/fdltWaRaZ3Qd0pr9Pl71uUsm0vggxSmJCiXLHjsZOE=;
 b=CPdcICXt7aAKQ3+01FbFUVVVjAZcPA0w9w+Ojwxz7zPx9YAgDTgCU7A98GlNIfvJsUARIIm/af00mttcnt61ozyXHPqzhkXZ44zmZ59yA9vA3Lrfk9lqMpaV3HnlhXJEUDDMlt7HgXcRBAfnzaoosVUlIHWlLclt0pJvIuCuHEcJLFJRDZtuPd9k11ghE/SoYj40UhlbFzVeIaOF3kSEg/wEqdeaGbreqJcyuFWK2ik0bwFy4PLv9Gw0mz9jqhPpQcw917n8T1DpS4PngtFUijDudJBDNw+l5u6lw9FtqY3DIk22rIHw1On6uSciaeeUkANWpiFcRJpi8W/r5U1bow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/fdltWaRaZ3Qd0pr9Pl71uUsm0vggxSmJCiXLHjsZOE=;
 b=uVa+MgTyINWUhLK1R6Z74mI22+EGbVYYTSbHBW0cWyHWR1SSYnXxBrSKYOEVWzzZSQj+RguwQn/30Iq9E7DDtejRvY493wJdBFrqc9B6DuH3hUdq1GivNwrqMxvDs8MmmlmyVIKXX/38M9EtxDu2IT4JY7czIMU+60wq/tIYWBI=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Peter Hoyes <Peter.Hoyes@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>,
	Luca Fancellu <Luca.Fancellu@arm.com>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v4 0/2] Add escape character argument to Xen console
Thread-Topic: [PATCH v4 0/2] Add escape character argument to Xen console
Thread-Index: AQHZtJOZfmsm6IPK4UC9HWuyh33zD6+1y+0A
Date: Wed, 12 Jul 2023 08:26:32 +0000
Message-ID: <9CDCE950-D826-424C-8BBD-ED2B8630DF61@arm.com>
References: <20230712073556.14719-1-peter.hoyes@arm.com>
In-Reply-To: <20230712073556.14719-1-peter.hoyes@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|PAWPR08MB9736:EE_|DBAEUR03FT050:EE_|PR3PR08MB5740:EE_
X-MS-Office365-Filtering-Correlation-Id: d24e1ebb-48e7-49b8-1746-08db82b1b913
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 fqgSCEXCb1UOoX9l6sG9zUbyKUaSoaxtIQBvAgttcG+iB200/sHjoD94jGy2RhE1nnEuxsNlZKlR3EMBfpILKtu5TF7q1htVUTp4rCgYUtOp9EJRT99xyCDQoEOlnfUEoKbDx0ZKdWUCRWMJ3WoQ4tQSIXGtJHzPM2M5kgSgJJGEHx6Zy22MxGJOMznQ5BwseBLEjX9jEOodxO4IQiwkdPCCfvRBFGnYgsYB5NnnimzuIEasKoNmSsdjBTmPRll1hFMUlAx4tizyXebNjQIhaS9mT2RO4nH1ywPbdveRnK/8NYbV3XNyjT0Tp9gzevhxltinZcucJHNEGhxc/b1NKXtil8/DxDTUIJZWfgZQdRMmeUj+HkvQrIQLWoVmfAdjVwULveMbxo9cdxhWTLD8XHf1DKyPH/MmEkArUHXcppN1IEUY0V56f2UsH+Kd//iQCHw1zVRApbCGa8AC5RZm6AlScNWFEdB9YU/iMA9Twtk8wfNN7JX4pc9wmqew6Vx/49mvZ1YwN/7MhRNHa2uiETFRnF1otVPmVH1VlHBmjJyfUGUmV5wDDFoOG5hnWuZbB56qutYkglxTj2noGkTkN2p1iGivpECxQv3sJTNC7haUrDp/pnv3H+AmRVLEzCwWRECZNPYUiWvkaXNaVyGK5UzCyyeDYJLBSSGdBhAKGXY=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(366004)(376002)(136003)(396003)(346002)(451199021)(38100700002)(38070700005)(86362001)(36756003)(71200400001)(6486002)(76116006)(54906003)(37006003)(91956017)(66946007)(33656002)(122000001)(2616005)(6506007)(186003)(6512007)(53546011)(2906002)(66476007)(5660300002)(64756008)(66446008)(66556008)(8676002)(6862004)(8936002)(478600001)(4326008)(83380400001)(6636002)(316002)(41300700001)(21314003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <BBFC81F235C99443AA80C76C888E2EB7@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9736
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT050.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	83d8d7ea-ba45-4bf7-b816-08db82b1b2ff
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0f4Oywd3iLPzhAYqsVH2tegdEjlsqoR8Ag61ldA00rpOzYtMVZKuO6k5v8tHBa0ogwyHNfpwA0f3K/0tgeyAeNiyUDjqCPUz8W14bpcX6pCxxJgKBcCiB7pChDmRQ7TH3lEvv0azQDmqOZQPQFay5yFRSe0eHW1QDrH38t+2Spuxkj0u7gmiMcBRRs2/Tzcu3b2SLAGNRNvQ8s7WJC/my4US2xKUkEWeUFuTSWpEHtTWOv7NbwzQycj43XFiNu8370GAJ2YMop2pA/avTABhLpUKk37alClc21ibldMaT+P5ZbqafDI1czq6ziMFF5uoQhiPl9tAYCfYN5Ct5K+xCxRLhL6pkfw+FyYCT/FUgl5Fs7dqWJVDgUXl1tPuMaXNb+ubG8uvh9KIy9FFlN73xMGM9Tv6+DtH4YtNVt8h2+d6jUnaPJo79jKNsoP2jc8OtICLDQFkPWTTZekIVF458Kw1dYwvnX9eawBFAAUrQMNJk1TmtmA/TEruDYOG5JAZYEaex6YSiJcxQw5GaKgFFHSmR0LCEKdFakgMnWfGFePFvKtaTWkbWHXkYQmJBrcguiYLNbSS2adJIx4NKbk3DLQAzHLIIDtmnEiUYkH6DA+IgDCEY1pUuQoWR75cm+AGlxY1f2nvRDFTssxU1G8At+Wq82+unQGpJgA0CV7gtBAZrDjeFQzgjeQbIpCQP39GIWLVTy0ce5eiwAKwGZLUe40NEX9Ir1dRV/MXphknfW58oDtsqbnB7KPTZMYg5mYaEi3fuirLIBk/sz0lIlFzFg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(396003)(136003)(346002)(451199021)(40470700004)(46966006)(36840700001)(70206006)(70586007)(6636002)(4326008)(36860700001)(40460700003)(478600001)(36756003)(37006003)(54906003)(40480700001)(86362001)(336012)(107886003)(26005)(6506007)(186003)(53546011)(33656002)(6512007)(6486002)(47076005)(83380400001)(82310400005)(82740400003)(81166007)(356005)(41300700001)(2616005)(6862004)(8936002)(8676002)(316002)(2906002)(5660300002)(21314003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2023 08:26:42.8915
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d24e1ebb-48e7-49b8-1746-08db82b1b913
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT050.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5740

Hi Peter,

> On 12 Jul 2023, at 09:35, Peter Hoyes <Peter.Hoyes@arm.com> wrote:
>=20
> From: Peter Hoyes <Peter.Hoyes@arm.com>
>=20
> Dom0 may be accessed via telnet, meaning the default escape character
> (which is the same as telnet's) cannot be directly used to exit the
> console. It would be helpful to make the escape character customizable
> in such use cases, falling back to the existing=20
>=20
> Make the necessary changes to the console client, libxl and the xl
> console sub-command to support this.
>=20
> Changes in v4:
> * Update xl docs
> * Add necessary changes for libxl API version compatibility
> * Improve escape sequence argument validation
>=20
> Peter Hoyes (2):
>  tools/console: Add escape argument to configure escape character
>  xl: Add escape character argument to xl console

In the patches you did not add a change log to get what has been modified
between versions of the serie.
This is making it a bit harder to diff review.

Could you resent your serie and add a change log:
--
Changes in v4:
- xxx
- xxx

Changes in v3:
- xxx

...etc

Thanks

Cheers
Bertrand

>=20
> docs/man/xl.1.pod.in             |  8 ++++++-
> tools/console/client/main.c      | 21 +++++++++++++----
> tools/include/libxl.h            | 39 +++++++++++++++++++++++++++++---
> tools/libs/light/libxl_console.c | 30 +++++++++++++++++-------
> tools/xl/xl_cmdtable.c           |  3 ++-
> tools/xl/xl_console.c            | 10 +++++---
> tools/xl/xl_vmcontrol.c          |  2 +-
> 7 files changed, 92 insertions(+), 21 deletions(-)
>=20
> --=20
> 2.34.1
>=20


