Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE81F52508F
	for <lists+xen-devel@lfdr.de>; Thu, 12 May 2022 16:49:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.327795.550676 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npA7m-0000rH-7L; Thu, 12 May 2022 14:49:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 327795.550676; Thu, 12 May 2022 14:49:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npA7m-0000oj-3q; Thu, 12 May 2022 14:49:06 +0000
Received: by outflank-mailman (input) for mailman id 327795;
 Thu, 12 May 2022 14:49:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7wFL=VU=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1npA7k-0000od-Ff
 for xen-devel@lists.xenproject.org; Thu, 12 May 2022 14:49:04 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03on0628.outbound.protection.outlook.com
 [2a01:111:f400:fe08::628])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a9c5f669-d202-11ec-a406-831a346695d4;
 Thu, 12 May 2022 16:49:02 +0200 (CEST)
Received: from AS8PR05CA0022.eurprd05.prod.outlook.com (2603:10a6:20b:311::27)
 by AM0PR08MB2961.eurprd08.prod.outlook.com (2603:10a6:208:66::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.21; Thu, 12 May
 2022 14:48:57 +0000
Received: from AM5EUR03FT024.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:311:cafe::6a) by AS8PR05CA0022.outlook.office365.com
 (2603:10a6:20b:311::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.14 via Frontend
 Transport; Thu, 12 May 2022 14:48:57 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT024.mail.protection.outlook.com (10.152.16.175) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5250.13 via Frontend Transport; Thu, 12 May 2022 14:48:57 +0000
Received: ("Tessian outbound 32b886dfa5b9:v119");
 Thu, 12 May 2022 14:48:56 +0000
Received: from b42b8cf05718.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 707039D1-6917-4FA7-928B-AD7E3D56504C.1; 
 Thu, 12 May 2022 14:48:45 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b42b8cf05718.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 12 May 2022 14:48:45 +0000
Received: from DB7PR08MB2986.eurprd08.prod.outlook.com (2603:10a6:5:1e::14) by
 AM6PR08MB5240.eurprd08.prod.outlook.com (2603:10a6:20b:ec::28) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5227.20; Thu, 12 May 2022 14:48:43 +0000
Received: from DB7PR08MB2986.eurprd08.prod.outlook.com
 ([fe80::c93a:3b90:5380:ddac]) by DB7PR08MB2986.eurprd08.prod.outlook.com
 ([fe80::c93a:3b90:5380:ddac%3]) with mapi id 15.20.5227.023; Thu, 12 May 2022
 14:48:43 +0000
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
X-Inumbo-ID: a9c5f669-d202-11ec-a406-831a346695d4
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=e5m2M3vV49fiUFktbenOP1Y9fMcBTUowhNs8n74Hg8gPqPsXTy1dI2xdwj3jlTEDwOXZDk3iU8HRjKhcuBKKTSzPQR1TuHLhPifxYQXBqgZoME1eP0gm+Q5vIUBxFPrnOGuvgav9Vgfeiukoekc5/1GIhhn5fGkbGQTPYmOLLQuM7upVQhTwUBBBReaSrKQ3XlChasSRbbVDBCGTw8/Vcf7doAIshIfPxNEWWWu5xazBVyEPhIvoqt/bYP5AvScqGlxgGTOEe/S/ZqwJOv5y34/7BSXqGSbSFbVNjB5BPEYk7wHjyhCzn9/Gt6y3r7r+/40ZP3iF+b2w3mfki5FfCQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LSR3rnBL8vFfYhYJKLbnoHxmOx7dXFv75WGJ+ZozHiM=;
 b=OMzTGRrHN8Zm7071vU6E4+oJH1gkGRW1In9e5XIfpZOGGKqCTn3A8jSo4x0SqyjVNEmzEx6F4Ov2VF8oTINkMNjTxF0qSF5rC41DDdab9j+I2UzQPLCgfQJG+mcW3hVN22dE0vKkFhg2xWIp6NE+QObJe3fbjnpofLyA3DZeJpBc6hsj4u+FH07RNPtn/E2iHw6HIS4jhP2bhF6TfM2Zhty0imY0srEwvktcAwH1v/GWM9WzrstCzJ337f+nNf/1HNzuPV47MnMv6n/NRoSTY0Z26O61bWjEP5w+zZ/3Id1eKjt4Zv3SuhPJ7JiYyMqIcFXbxXCXlTH8qE+sy60n0g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LSR3rnBL8vFfYhYJKLbnoHxmOx7dXFv75WGJ+ZozHiM=;
 b=rqjMdUmwkYhUB53JMTCWcLqLQG+ieHOnkK6htLvDLuwH80HBAsbsM7aoMLLMnfx6FRaKdoN/0Q+Hjh1QRWqmStRpf7qt0y4cSm0Q7aDcSjHqFR4sswS+FF+RB6DapBSYScqtYobpdzy7ZTTfAMEzI5hgTokT/v5fW7VcyXsH5Dc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 19c464296615fc3a
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DoZ4P/3s6diGzNn5nzon9LqWS9QJ3ie9h9kPq3lZOsJmbEtzEWKuVjxKOEioQqOp9ecscG5/0Ai9x44ovUkjKwYqF9Hmzz4F1gcsauz91CJ+U3clf0eas5j4HCSBLnt91Gg782oIYNRJkpgM23YY9fNNxGXEGBX6B0WkEyf3fxopZq7tSq+KYy0DhIvqDgGL9El28TZvtSy16txnHGwkAcz9scRRYic91Ph1hh08RxoWn6rXHtrguMX/5GQlJGh7ePLN/Sb7XAwIyCLpE+ys4Rv3x7Kkz3Xl/zmJXbnk0E4EXnTTUocBCyF5LudpJfOtPc6YXeJgNswNgOjfX9k9XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LSR3rnBL8vFfYhYJKLbnoHxmOx7dXFv75WGJ+ZozHiM=;
 b=aj64HKONegfNQBVRfBFOPfF9Ri0NsRejZntVSpQ3Wp1omVXiJ/FKkKXCjfBi6m6gRXvCahCce1xSIfCLb4sbFXCIt1MzYHRg2wXVq70tybn+/en/eTyGatsqjScQbLLPYvTmgrsXlw6c8zgg4dWukMDNIQ5gFolP0oqkDKpb6k19AHhgxdf5TyN0zFJk5k/Z1iyj7r/9fx4O8jWukUUgOKwogSX/gxS6CQJZ5isFFQi2qSISDl9VsCuYOZO694obhbh9do5lslKTlxRK2AVsBQaSrQ1WCsJIlLBgaL1+c4AoKvU6Nox3eA7OWht+o7gGurTcxwVu98ZjSuDQyMcYog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LSR3rnBL8vFfYhYJKLbnoHxmOx7dXFv75WGJ+ZozHiM=;
 b=rqjMdUmwkYhUB53JMTCWcLqLQG+ieHOnkK6htLvDLuwH80HBAsbsM7aoMLLMnfx6FRaKdoN/0Q+Hjh1QRWqmStRpf7qt0y4cSm0Q7aDcSjHqFR4sswS+FF+RB6DapBSYScqtYobpdzy7ZTTfAMEzI5hgTokT/v5fW7VcyXsH5Dc=
From: Rahul Singh <Rahul.Singh@arm.com>
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
CC: xen-devel <xen-devel@lists.xenproject.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>, "scott.davis@starlab.io"
	<scott.davis@starlab.io>, "jandryuk@gmail.com" <jandryuk@gmail.com>,
	"christopher.clark@starlab.io" <christopher.clark@starlab.io>, Luca Fancellu
	<Luca.Fancellu@arm.com>, Julien Grall <jgrall@amazon.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Dario
 Faggioli <dfaggioli@suse.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>
Subject: Re: [PATCH v7 1/2] xsm: create idle domain privileged and demote
 after setup
Thread-Topic: [PATCH v7 1/2] xsm: create idle domain privileged and demote
 after setup
Thread-Index: AQHYZSqefRP9ouSNjU+f65pQpb3T1K0bVGqA
Date: Thu, 12 May 2022 14:48:43 +0000
Message-ID: <10F86570-D9AC-48C2-B4A3-A4CE3FB0D064@arm.com>
References: <20220511113035.27070-1-dpsmith@apertussolutions.com>
 <20220511113035.27070-2-dpsmith@apertussolutions.com>
In-Reply-To: <20220511113035.27070-2-dpsmith@apertussolutions.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 5d4ea6d7-0183-49cc-7a70-08da34268af2
x-ms-traffictypediagnostic:
	AM6PR08MB5240:EE_|AM5EUR03FT024:EE_|AM0PR08MB2961:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB2961E069184C68B9E693239BFCCB9@AM0PR08MB2961.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 zkyQQpJwXcrC2Bp7MbPMCoFsMT1nXpNCpMeRaSLcFCoy0Alq/jaezg93PkZoKKVfAKrvVvTDTjPdEBszMJySe7aOmMf1IeSQCm/dKlD5HA+jXuWk/5Ye767TuneTBoDgRtGPaywc3Wlk0/lgvF06KGfzXNGDCe7s/zwuc68uaPL2sDdmj/XM/eRuYyOEdeiAvYlOUiwRj/ZGFUJ+UxMCM7XFEUnJDwMcEpJegysmU/pwcVYFPYSNau+bK/pRlpb+Uq6Lc1fwVG4QMa+1TgjhNapfOMLOLIy3+ygiQS2687L8tEHT1XtGhRfkOPbsvkvKmsG6S2jmhW3uOVo2yBFkKBiz4yr7WzKuJMJ8G4l9sr0/PShZyjRSoi55Dmb1iu0CEdPDVCRyCoFO2LDZ4uEULZa67RVsEBlbK6+b8SbHWQPauHE/uj+0HJNOORWnBC8Fi5f/Qy0fz+yEMqR6ORqyxgLq70snj9tSVKt6kJhCmxYqWSd00RpmPjjvr+FOe/HFQk4YjJrdJIAVYJok+GZPm4ePto0rqUcYHlJy48LMpGzc8elUJLYDza6G2heVWiBTYqLbaXmj72amPRrcZ1WNGROSTx4UtKPZUPs7zRT7m2kp9rpXIruBNifTj0qefx6108/fJen8kk5rafPpOWZD8yhGiGCiUmEwFkZzxIub3i60N5v/Lscp9JvsID73GqLxz/8Hhc8fjew2dQHB2HbAVgc6dAdeGMlM5CI3cA6Dpx9HorcQtlIikDR8jQVHSdEY
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB2986.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(36756003)(2906002)(71200400001)(316002)(186003)(76116006)(64756008)(66556008)(66476007)(66946007)(91956017)(66446008)(8676002)(6486002)(83380400001)(5660300002)(33656002)(508600001)(8936002)(2616005)(7416002)(6512007)(26005)(122000001)(6506007)(53546011)(38070700005)(54906003)(6916009)(38100700002)(86362001)(4326008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <C50B596408F0DB42B4B929535B3BB0AF@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5240
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT024.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7f20de80-d33f-4f1b-a332-08da34268311
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AbMa0S26JFSEcd0gzv/cbbpYQgwtZs32NF4JMatzvAF5eJ1MJbkYAKRoGli9QaNoQCgkS5jVPD3FLnM2xiIg62vURToz/azzGn6hBbciJbAjk6LAwo0i9gSgeTYCF8k/mmIziTaW+Uu2emFgc0uJ3oKe21sjhyF2SLZloteBnNSMFGkMDuCatizZ/SON3jVg1URID0uR21tEUcndbeFJ07+bA7ivJGw+gibc0shmypjFvuHxN2xvo8LPCtfoFp1x3GbpkQyyppneeJMAmfc55AFoDHA6Hhz22jUMjZIAEewNINqthiRlM9ujB+CMcFlu91oa77OsFckBGlOV+EEznpJyrrj6Ryw19IdhcgE8XrrF+HGWbRd9Ig6TJqmSVx9ySqeV5R1f1qBoy+ikShNsSzqpRNKmhfj+bkBC1AUV553bzFa++ZFiCJ8yNOsxZTfQeVnX+tKIlY6IhuxksMaeNA5TZIlzsafl6lafR0O4L0rnkNmsJALSe/GZZfozcsBFD62a1K7x+6Voe2zGQ961NleMiIdnQBpkeiVjZGWzjSAyLocLIPT2nClEaYAIxIRntdTB9xp0gPqmClWReTWQWYhuBDPsuA8SMzU9vkODYhcdwDeq40cCVPNA+9frndG5fuaL9JIwgZZLuHj72fQUQoDQFTx62xjV6XyOduRS7GKyAcll4ZsfL57101udAvxX
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(82310400005)(6512007)(8936002)(6506007)(86362001)(26005)(6862004)(53546011)(186003)(4326008)(47076005)(336012)(83380400001)(70206006)(70586007)(5660300002)(8676002)(33656002)(2616005)(36860700001)(36756003)(356005)(54906003)(81166007)(40460700003)(6486002)(2906002)(508600001)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2022 14:48:57.0113
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d4ea6d7-0183-49cc-7a70-08da34268af2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT024.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB2961

Hi Daniel,

> On 11 May 2022, at 12:30 pm, Daniel P. Smith <dpsmith@apertussolutions.co=
m> wrote:
>=20
> There are new capabilities, dom0less and hyperlaunch, that introduce inte=
rnal
> hypervisor logic which needs to make resource allocation calls that are
> protected by XSM access checks. This creates an issue as a subset of the
> hypervisor code is executed under a system domain, the idle domain, that =
is
> represented by a per-CPU non-privileged struct domain. To enable these ne=
w
> capabilities to function correctly but in a controlled manner, this commi=
t
> changes the idle system domain to be created as a privileged domain under=
 the
> default policy and demoted before transitioning to running. A new XSM hoo=
k,
> xsm_set_system_active(), is introduced to allow each XSM policy type to d=
emote
> the idle domain appropriately for that policy type. In the case of SILO, =
it
> inherits the default policy's hook for xsm_set_system_active().
>=20
> For flask a stub is added to ensure that flask policy system will functio=
n
> correctly with this patch until flask is extended with support for starti=
ng the
> idle domain privileged and properly demoting it on the call to
> xsm_set_system_active().
>=20
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
> Acked-by: Julien Grall <jgrall@amazon.com> # arm

Reviewed-by: Rahul Singh <rahul.singh@arm.com>
Tested-by: Rahul Singh <rahul.singh@arm.com>

Regards,
Rahul
> ---
> xen/arch/arm/setup.c    |  3 +++
> xen/arch/x86/setup.c    |  4 ++++
> xen/common/sched/core.c |  7 ++++++-
> xen/include/xsm/dummy.h | 17 +++++++++++++++++
> xen/include/xsm/xsm.h   |  6 ++++++
> xen/xsm/dummy.c         |  1 +
> xen/xsm/flask/hooks.c   | 23 +++++++++++++++++++++++
> 7 files changed, 60 insertions(+), 1 deletion(-)
>=20
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index d5d0792ed4..7f3f00aa6a 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -1048,6 +1048,9 @@ void __init start_xen(unsigned long boot_phys_offse=
t,
>     /* Hide UART from DOM0 if we're using it */
>     serial_endboot();
>=20
> +    if ( (rc =3D xsm_set_system_active()) !=3D 0 )
> +        panic("xsm(err=3D%d): unable to set hypervisor to SYSTEM_ACTIVE =
privilege\n", rc);
> +
>     system_state =3D SYS_STATE_active;
>=20
>     for_each_domain( d )
> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> index 6f20e17892..57ee6cc407 100644
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -620,6 +620,10 @@ static void noreturn init_done(void)
> {
>     void *va;
>     unsigned long start, end;
> +    int err;
> +
> +    if ( (err =3D xsm_set_system_active()) !=3D 0 )
> +        panic("xsm(err=3D%d): unable to set hypervisor to SYSTEM_ACTIVE =
privilege\n", err);
>=20
>     system_state =3D SYS_STATE_active;
>=20
> diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
> index 19ab678181..7b1c03a0e1 100644
> --- a/xen/common/sched/core.c
> +++ b/xen/common/sched/core.c
> @@ -3021,7 +3021,12 @@ void __init scheduler_init(void)
>         sched_ratelimit_us =3D SCHED_DEFAULT_RATELIMIT_US;
>     }
>=20
> -    idle_domain =3D domain_create(DOMID_IDLE, NULL, 0);
> +    /*
> +     * The idle dom is created privileged to ensure unrestricted access =
during
> +     * setup and will be demoted by xsm_set_system_active() when setup i=
s
> +     * complete.
> +     */
> +    idle_domain =3D domain_create(DOMID_IDLE, NULL, CDF_privileged);
>     BUG_ON(IS_ERR(idle_domain));
>     BUG_ON(nr_cpu_ids > ARRAY_SIZE(idle_vcpu));
>     idle_domain->vcpu =3D idle_vcpu;
> diff --git a/xen/include/xsm/dummy.h b/xen/include/xsm/dummy.h
> index 58afc1d589..77f27e7163 100644
> --- a/xen/include/xsm/dummy.h
> +++ b/xen/include/xsm/dummy.h
> @@ -101,6 +101,23 @@ static always_inline int xsm_default_action(
>     }
> }
>=20
> +static XSM_INLINE int cf_check xsm_set_system_active(void)
> +{
> +    struct domain *d =3D current->domain;
> +
> +    ASSERT(d->is_privileged);
> +
> +    if ( d->domain_id !=3D DOMID_IDLE )
> +    {
> +        printk("%s: should only be called by idle domain\n", __func__);
> +        return -EPERM;
> +    }
> +
> +    d->is_privileged =3D false;
> +
> +    return 0;
> +}
> +
> static XSM_INLINE void cf_check xsm_security_domaininfo(
>     struct domain *d, struct xen_domctl_getdomaininfo *info)
> {
> diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
> index 3e2b7fe3db..8dad03fd3d 100644
> --- a/xen/include/xsm/xsm.h
> +++ b/xen/include/xsm/xsm.h
> @@ -52,6 +52,7 @@ typedef enum xsm_default xsm_default_t;
>  * !!! WARNING !!!
>  */
> struct xsm_ops {
> +    int (*set_system_active)(void);
>     void (*security_domaininfo)(struct domain *d,
>                                 struct xen_domctl_getdomaininfo *info);
>     int (*domain_create)(struct domain *d, uint32_t ssidref);
> @@ -208,6 +209,11 @@ extern struct xsm_ops xsm_ops;
>=20
> #ifndef XSM_NO_WRAPPERS
>=20
> +static inline int xsm_set_system_active(void)
> +{
> +    return alternative_call(xsm_ops.set_system_active);
> +}
> +
> static inline void xsm_security_domaininfo(
>     struct domain *d, struct xen_domctl_getdomaininfo *info)
> {
> diff --git a/xen/xsm/dummy.c b/xen/xsm/dummy.c
> index 8c044ef615..e6ffa948f7 100644
> --- a/xen/xsm/dummy.c
> +++ b/xen/xsm/dummy.c
> @@ -14,6 +14,7 @@
> #include <xsm/dummy.h>
>=20
> static const struct xsm_ops __initconst_cf_clobber dummy_ops =3D {
> +    .set_system_active             =3D xsm_set_system_active,
>     .security_domaininfo           =3D xsm_security_domaininfo,
>     .domain_create                 =3D xsm_domain_create,
>     .getdomaininfo                 =3D xsm_getdomaininfo,
> diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
> index 0bf63ffa84..54745e6c6a 100644
> --- a/xen/xsm/flask/hooks.c
> +++ b/xen/xsm/flask/hooks.c
> @@ -186,6 +186,28 @@ static int cf_check flask_domain_alloc_security(stru=
ct domain *d)
>     return 0;
> }
>=20
> +static int cf_check flask_set_system_active(void)
> +{
> +    struct domain *d =3D current->domain;
> +
> +    ASSERT(d->is_privileged);
> +
> +    if ( d->domain_id !=3D DOMID_IDLE )
> +    {
> +        printk("%s: should only be called by idle domain\n", __func__);
> +        return -EPERM;
> +    }
> +
> +    /*
> +     * While is_privileged has no significant meaning under flask, set t=
o false
> +     * as is_privileged is not only used for a privilege check but also =
as a type
> +     * of domain check, specifically if the domain is the control domain=
.
> +     */
> +    d->is_privileged =3D false;
> +
> +    return 0;
> +}
> +
> static void cf_check flask_domain_free_security(struct domain *d)
> {
>     struct domain_security_struct *dsec =3D d->ssid;
> @@ -1766,6 +1788,7 @@ static int cf_check flask_argo_send(
> #endif
>=20
> static const struct xsm_ops __initconst_cf_clobber flask_ops =3D {
> +    .set_system_active =3D flask_set_system_active,
>     .security_domaininfo =3D flask_security_domaininfo,
>     .domain_create =3D flask_domain_create,
>     .getdomaininfo =3D flask_getdomaininfo,
> --=20
> 2.20.1
>=20
>=20


