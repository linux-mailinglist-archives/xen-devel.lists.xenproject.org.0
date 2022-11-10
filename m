Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 606CF623F7C
	for <lists+xen-devel@lfdr.de>; Thu, 10 Nov 2022 11:08:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.441574.695721 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ot4Tt-0006GF-5M; Thu, 10 Nov 2022 10:08:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 441574.695721; Thu, 10 Nov 2022 10:08:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ot4Tt-0006DK-2A; Thu, 10 Nov 2022 10:08:21 +0000
Received: by outflank-mailman (input) for mailman id 441574;
 Thu, 10 Nov 2022 10:08:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jazc=3K=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1ot4Tq-0006DE-PK
 for xen-devel@lists.xenproject.org; Thu, 10 Nov 2022 10:08:19 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80088.outbound.protection.outlook.com [40.107.8.88])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9803af49-60df-11ed-8fd2-01056ac49cbb;
 Thu, 10 Nov 2022 11:08:16 +0100 (CET)
Received: from AM5PR0502CA0003.eurprd05.prod.outlook.com
 (2603:10a6:203:91::13) by AM8PR08MB6450.eurprd08.prod.outlook.com
 (2603:10a6:20b:317::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Thu, 10 Nov
 2022 10:08:12 +0000
Received: from AM7EUR03FT046.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:91:cafe::e) by AM5PR0502CA0003.outlook.office365.com
 (2603:10a6:203:91::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.24 via Frontend
 Transport; Thu, 10 Nov 2022 10:08:12 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT046.mail.protection.outlook.com (100.127.140.78) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5813.12 via Frontend Transport; Thu, 10 Nov 2022 10:08:11 +0000
Received: ("Tessian outbound 6c699027a257:v130");
 Thu, 10 Nov 2022 10:08:11 +0000
Received: from 0a31d866176b.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 97DE5B1D-B9FB-4193-B4A5-7E8190CBAE19.1; 
 Thu, 10 Nov 2022 10:08:03 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0a31d866176b.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 10 Nov 2022 10:08:03 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DU0PR08MB9510.eurprd08.prod.outlook.com (2603:10a6:10:44e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Thu, 10 Nov
 2022 10:08:01 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::58db:2a7f:e8f5:92ad]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::58db:2a7f:e8f5:92ad%7]) with mapi id 15.20.5813.013; Thu, 10 Nov 2022
 10:08:00 +0000
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
X-Inumbo-ID: 9803af49-60df-11ed-8fd2-01056ac49cbb
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=RJohZk5q8a1K90rsFeWkwl7Dug8P7HROwlQBOSRbi1OYmfAV53AqZ7huGiz3Pci4wUFb1CrPkX+yD+T+vooxHypYHTMyH7T5qGgdUyPvojskw7VFkJKjfXExCY/ErdeYg+h0lyCg4CV9ig+XYNBaNVRptnsvQZ/64fb9vAdK4jF0S5W5dqTZrckS3fzFDYV5l3Rk6PlJBfF4Ba/Yfo6XrUskPVgKBzopU0lc/A8yXMEEC4wXuoI9KRv/ByuW5Ku8VEuON5t/dBGlqIL4HhQzKPNWYkFBaKsKpewAPEcFAoVjqKqwsTRaBEC859b5J9BhxZ0+HtuarqEeh4cHL0Stig==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pDf9fLYcDaftzMjbxV7J+mqaiqnt7IsTWjw6Qq4tbkU=;
 b=nyZBoKAb45jhKjEcAj48bn9rZaGNO6thofi89DEbaO5byV0lAeOjB203gssLbJ2dXmx2Tw9JCk/yVRa2n1yA+O8fztmSDdrjOzI52Z4w8EeYd8nQjTydZfTTExX7JrPef5F/PWRqPhVC6tvalonJhFg5Abs/zPFAUa1qhZMpDCZkCT49y2J3nJ+FFhoTcTPhdxWuCmllytE4MoJS/KwSHYstVbR6HADO1WlmwfnmfHrn8n0fDrnUooQelWsR2Y69BB2bMs3CJWSzMVesZVk004EYafYxRoHdzcb7mhKwC9SDlRvNC1ppenrhVKVccEbVGnHqn3vdYHIkFbyGImcmRA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pDf9fLYcDaftzMjbxV7J+mqaiqnt7IsTWjw6Qq4tbkU=;
 b=fAqOu0BwAplJudW8QlEjA0/RKF2yDpoz43sSnVxs/tsGFIYH9K86oa9ZLdg7UmODrUHp4lkjfYsaOjZKOETvjAEsNltauYh/lj9atZtLneJOO/7Fhnaa1sxNouYTzdwHMUHibSjdLa96lgTc5c+TXHNbvGnN3+/bXAuYyRC+NOA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 028205128a85c7fb
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zn4HnDGLlpwrv8SM1ndWiWunmI+/epqmGFX5w6VRWELmJU2C4aa+/6qn5sJgNkgrrJS714O2+QRSGElukr65/FaZGNUXucWrJ8FrtshiC7g/+Ylv13JeclJ+atq/TwlfxKfA1warKYKA31kTuKS58WHUAMShprHHqieIa2lIorKeUmBsXbe3af8UAbfC0JSRf6Cf8OQh8LnHjkvlCrB9qiUOsj88Bq+zCm9UlX3APc1Ol1sHhH2rYyogkHd5b0eYBSnDIYEGrpzsR1ZOzhq7tgosyky562lBK9fA6ZGEJ8ziBoVWOvXNXvHARbuTWqBztJ3bDt5sXb+85fBCEht9iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pDf9fLYcDaftzMjbxV7J+mqaiqnt7IsTWjw6Qq4tbkU=;
 b=V8Be2EH8DqvG+b5MXwheTIMlUacUHASFC+JOUfBjPyyZF8weyMJkJyLyFaAZ9xM1eq/3u2lkWdPTwAEi65GKOr4tryYvObtc0js940iQqPKz7l+bs1Bf0l8VGqRMjdFGipqhbKA+cmOUlacDPUfRP5alai+1Z1eOR3kqzIy1M4GoD4QLvC5Sx7kVChWhz2qWWji/cI3GvePj3O7BTkYu9/8p5D8JCnvuU2573egA4+h6ci4CvcCF+gI1uPVSqMheaabGXI/H9Ca8S8WwPUmoeBqIHbUnAc6TtSjrRpyJparWfOmc1sH1JSqawCfkW5qzfpVnIv6Br6VkEpBPPowIJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pDf9fLYcDaftzMjbxV7J+mqaiqnt7IsTWjw6Qq4tbkU=;
 b=fAqOu0BwAplJudW8QlEjA0/RKF2yDpoz43sSnVxs/tsGFIYH9K86oa9ZLdg7UmODrUHp4lkjfYsaOjZKOETvjAEsNltauYh/lj9atZtLneJOO/7Fhnaa1sxNouYTzdwHMUHibSjdLa96lgTc5c+TXHNbvGnN3+/bXAuYyRC+NOA=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Doug
 Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH v3 0/4] Yocto Gitlab CI
Thread-Topic: [PATCH v3 0/4] Yocto Gitlab CI
Thread-Index:
 AQHY7TFh2hDh7VPqHUGkPo4tUdJZza4okuGAgAAFoQCACog5gIAEOL6AgAB51ICAACrvgA==
Date: Thu, 10 Nov 2022 10:08:00 +0000
Message-ID: <1C829AF9-8DFF-47FA-8334-09A31AA9B069@arm.com>
References: <cover.1667224593.git.bertrand.marquis@arm.com>
 <1220596a-4fe7-5c08-5437-fa98eb14254c@amd.com>
 <D1248F50-542B-474D-B016-A3BF09A21CE8@arm.com>
 <6ee0706b-d1b3-187a-1557-c4b8173c6e37@amd.com>
 <alpine.DEB.2.22.394.2211091613160.50442@ubuntu-linux-20-04-desktop>
 <46c0e05f-47e1-39e6-d978-9f6c7d6db53a@amd.com>
In-Reply-To: <46c0e05f-47e1-39e6-d978-9f6c7d6db53a@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|DU0PR08MB9510:EE_|AM7EUR03FT046:EE_|AM8PR08MB6450:EE_
X-MS-Office365-Filtering-Correlation-Id: aed0e272-9275-4c1f-3859-08dac303797b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 EI/Ir7VpERGKztJCe/OnmivL+RoHFbXwAd9+mpOZsD0LarbbdJ9bFFxHohAj1hyAIOz0ShUPshuipw+h4Nbzv6AR/bkiapPkwT5v9E+ipnz7r88wn5Q9KVEoE4Y2EkMueroTrBNfwlB1SlRj9ffQOxc60gnahBcqXgOAB0pCqWC/RTiQgKiuc8kRppEKlaQq/1dWnoMVYtCKu+rII9aefhQ9UQ9PWtQLjCfwnhcPPZ57hkdJdqC4orxw6f1yNXC50oI23UzTBYfljub1UpokPoHWEyoR6fQa2jcSMC/j0jA8nOyifrmb3g/KUIP7V/4KMvNwFFXrRtb9GgRx/joMPwjQGTqQ6aZ4mcZCU7d0pzBB5IJEXGFzgplGgUTH1813mu26jyYpMcY/J3tRRH5ksXyzzh4hqa4R9SYy56vp4zg/+cCCzK0jT2/yeLd8JEkZScFRHhONhwvfdh2Q0x3HlDlYnvWSHSccjtf8SqONdIhFzBZzOSJIzIk2Uhee7BnS8q72OlhIOt9WylDU3S+McbQiP1U2Hq9MS3YeVcyebzE+mF1Jlk+RMWz+KgKjsVZ6NVKo3FMo8BAY3rWFpcxZbF9wspa1bduhwtB1b8iCEAdz1m0J0uqynq7aZTT+m1qG649NCiXi6OOO/wdGexumEf9JYJ+ywO8yJIA2/RQt4xCNPRhrwHywCzRlyjHvF3dz5bUmv7a/Af0r23Pzs2lkr6rZUyi6WjTF5mY0m5Cdafxp2s1kNcVDOUH9gs0GQVHew3OqltNeCIIEh2i3LnF9Ze3bN8VNx4QMWjwmJpJwfGxoHXHT/ZAAeOPHHdmrcyIeD+w61Rb0sCIKOPqf4bHiHQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(39860400002)(136003)(346002)(376002)(396003)(451199015)(186003)(2616005)(6512007)(53546011)(6506007)(26005)(478600001)(83380400001)(33656002)(2906002)(86362001)(45080400002)(966005)(6486002)(316002)(6916009)(54906003)(71200400001)(38070700005)(36756003)(5660300002)(8936002)(91956017)(76116006)(66946007)(66446008)(64756008)(66476007)(66556008)(4326008)(8676002)(41300700001)(38100700002)(122000001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <26E588448E0DC740AAA97032CF4B2F9A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9510
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	74876afa-e70d-4aaf-e3cb-08dac30372d4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZUKhr2bB4HG+CxbsChDQo5Zr9IDpowdh7KsAECg+ky0dz1sCUetS2oDo2WLsf3wgbGCjk1XBnh8hp8DvM8Wg4qi4jbvWOxUR3iIcybvB4KYEKEIuPW3PUZ3wekoHuqUrMyEtCAvQKK6on1PFC9OMzYj4eS03U/jgSTvwaRUkqEHsJPRB0H/vh60MLPYM48wYyy18hp3BQ809Hmh+pgLNt4OF3MfC0Gq0CPL/xV/fd4ZP076owIejhqFBGvspKNMBbimiWQnR4LUY27ubN8AhlkVx6THUxY8yR8De3wgiARmDzFD7bNvQmcQSZBRcaiRKWUnCIBsmqLQVu5/8XeXu2lfMmPEpXBcdngVTo6vys+vO+6ZmvPe1eCoc6CLT/0lpMQKRvSEywUHCTMn9/Y5OaTNcowzxz5Jc5R6xpLwzA1WmzaWOPcoEfscJGWF8cy506SZX2hkf3px7wpjpGIsV/GhPGaxG+YvovMb3t13J3S8+/U1KEWH7QutnyNjbW8Yrw/+ustozSwfLKcR96xfJHCTWDG3UAkgpCU0NL8shS8Oxc4MKLAGjLwWwCOLj4k9/GelPLLGm9jIewOGPMWqC8epdGJ3ONkn0m3vCp67XDOqdQOzOnjbbolHeW4qL+SaXjV/FUUX20B6BmYPFk1E2G+mn3660gF6gVw0rZE6VX7mH5ZbNVjJwx3RQY8k7uEwWQn6f9p4XIx9fUrK6G4qIp5oOTnJc8PIcprnJm8xaJmH98pCgJiJqD+6oC9wpsnQ9JF1p8I6Po8bo+PYEWbNRLe/+FtwMwLg+KnGdYluprrrZhn7xZHv7GhFoBHBsitPO
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(346002)(136003)(396003)(451199015)(40470700004)(36840700001)(46966006)(36860700001)(6506007)(316002)(54906003)(6862004)(8936002)(83380400001)(2616005)(33656002)(336012)(5660300002)(47076005)(40480700001)(40460700003)(2906002)(186003)(70586007)(70206006)(53546011)(4326008)(8676002)(6512007)(41300700001)(26005)(36756003)(86362001)(82740400003)(81166007)(6486002)(966005)(45080400002)(356005)(107886003)(82310400005)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2022 10:08:11.6158
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aed0e272-9275-4c1f-3859-08dac303797b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6450

Hi Michal,

> On 10 Nov 2022, at 07:34, Michal Orzel <michal.orzel@amd.com> wrote:
>=20
> Hi Stefano,
>=20
> On 10/11/2022 01:18, Stefano Stabellini wrote:
>>=20
>>=20
>> On Mon, 7 Nov 2022, Michal Orzel wrote:
>>> Hi Bertrand and Stefano,
>>>=20
>>> On 31/10/2022 16:00, Bertrand Marquis wrote:
>>>>=20
>>>>=20
>>>> Hi Michal,
>>>>=20
>>>>> On 31 Oct 2022, at 14:39, Michal Orzel <michal.orzel@amd.com> wrote:
>>>>>=20
>>>>> Hi Bertrand,
>>>>>=20
>>>>> On 31/10/2022 15:00, Bertrand Marquis wrote:
>>>>>>=20
>>>>>>=20
>>>>>> This patch series is a first attempt to check if we could use Yocto =
in
>>>>>> gitlab ci to build and run xen on qemu for arm, arm64 and x86.
>>>>>>=20
>>>>>> The first patch is creating a container with all elements required t=
o
>>>>>> build Yocto, a checkout of the yocto layers required and an helper
>>>>>> script to build and run xen on qemu with yocto.
>>>>>>=20
>>>>>> The second patch is creating containers with a first build of yocto =
done
>>>>>> so that susbsequent build with those containers would only rebuild w=
hat
>>>>>> was changed and take the rest from the cache.
>>>>>>=20
>>>>>> The third patch is adding a way to easily clean locally created
>>>>>> containers.
>>>>>>=20
>>>>>> This is is mainly for discussion and sharing as there are still some
>>>>>> issues/problem to solve:
>>>>>> - building the qemu* containers can take several hours depending on =
the
>>>>>> network bandwith and computing power of the machine where those are
>>>>>> created
>>>>> This is not really an issue as the build of the containers occurs on =
the local
>>>>> machines before pushing them to registry. Also, building the containe=
rs
>>>>> will only be required for new Yocto releases.
>>>>>=20
>>>>>> - produced containers containing the cache have a size between 8 and
>>>>>> 12GB depending on the architecture. We might need to store the build
>>>>>> cache somewhere else to reduce the size. If we choose to have one
>>>>>> single image, the needed size is around 20GB and we need up to 40GB
>>>>>> during the build, which is why I splitted them.
>>>>>> - during the build and run, we use a bit more then 20GB of disk whic=
h is
>>>>>> over the allowed size in gitlab
>>>>> As we could see during v2 testing, we do not have any space restricti=
ons
>>>>> on the Xen GitLab and I think we already decided to have the Yocto
>>>>> integrated into our CI.
>>>>=20
>>>> Right, I should have modified this chapter to be coherent with your la=
test tests.
>>>> Sorry for that.
>>>>=20
>>>>>=20
>>>>> I will do some testing and get back to you with results + review.
>>> I did some testing and here are the results:
>>>=20
>>> In the current form this series will fail when running CI because the Y=
octo containers
>>> are based on "From ubuntu:22.04" (there is no platform prefix), which m=
eans that the containers
>>> are built for the host architecture (in my case and in 99% of the cases=
 of the local build it will
>>> be x86). In Gitlab we have 2 runners (arm64 and x86_64). This means tha=
t all the test jobs would need
>>> to specify x86_64 as a tag when keeping the current behavior.
>>> After I built all the containers on my x86 machine, I pushed them to re=
gistry and the pipeline was successful:
>>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgit=
lab.com%2Fxen-project%2Fpeople%2Fmorzel%2Fxen-orzelmichal%2F-%2Fpipelines%2=
F686853939&amp;data=3D05%7C01%7Cmichal.orzel%40amd.com%7C2449f063e67341c3b9=
5a08dac2b112a5%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C638036363027707=
274%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1=
haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3DEwTJrW2vuwQIugKc7mnzG9NNbsY=
LP6tw5UODzBMmPEE%3D&amp;reserved=3D0
>>=20
>> When I tested the previous version of this series I built the
>> containers natively on ARM64, so that is also an option.
>>=20
>>=20
>>> Here is the diff on patch no. 3 to make the series work (using x86 tag =
and small improvement to include needs: []):
>>> ```
>>> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test=
.yaml
>>> index 5c620fefce59..52cccec6f904 100644
>>> --- a/automation/gitlab-ci/test.yaml
>>> +++ b/automation/gitlab-ci/test.yaml
>>> @@ -65,6 +65,9 @@
>>>     paths:
>>>       - 'logs/*'
>>>     when: always
>>> +  needs: []
>>> +  tags:
>>> +    - x86_64
>>>=20
>>> # Test jobs
>>> build-each-commit-gcc:
>>> @@ -206,19 +209,13 @@ yocto-qemuarm64:
>>>   extends: .yocto-test
>>>   variables:
>>>     YOCTO_BOARD: qemuarm64
>>> -  tags:
>>> -    - arm64
>>>=20
>>> yocto-qemuarm:
>>>   extends: .yocto-test
>>>   variables:
>>>     YOCTO_BOARD: qemuarm
>>> -  tags:
>>> -    - arm32
>>>=20
>>> yocto-qemux86-64:
>>>   extends: .yocto-test
>>>   variables:
>>>     YOCTO_BOARD: qemux86-64
>>> -  tags:
>>> -    - x86_64
>>> ```
>>>=20
>>> Now, the logical way would be to build x86 yocto container for x86, arm=
64 for arm64 and arm32 on arm64 or x86.
>>> I tried building the container qemuarm64 specifying target arm64 on x86=
. After 15h, only 70% of the Yocto build
>>> was completed and there was an error with glibc (the local build of the=
 container for the host arch takes on my machine max 2h).
>>> This enormous amount of time is due to the qemu docker emulation that h=
appens behind the scenes (I checked on 2 different machines).
>>>=20
>>> So we have 3 solutions:
>>> 1) Build and run these containers for/on x86_64:
>>> - local users can build the containers on local machines that are almos=
t always x86 based, in short period of time,
>>> - "everyone" can build/push the containers once there is a new Yocto re=
lease
>>> - slightly slower CI build time
>>> 2) Build and run these containers for specific architectures:
>>> - almost no go for local users using x86 machine (unless using more tha=
n 16 threads (which I used) and willing to wait 2 days for the build)
>>> - faster CI build time (arm64 runner is faster than x86 one)
>>> - someone with arm64 based machine (not that common) would have to buil=
d and push the containers
>>> 3) Try to use CI to build and push the containers to registry
>>> - it could be possible but what about local users
>>=20
>> From a gitlab-ci perspective, given the runners we currently have, we
>> have to go with option 2). We don't have enough resources available on
>> the x86 runner to run the Yocto jobs on x86.
>>=20
> That is what I reckon too. Running the Yocto build/test on CI using x86 r=
unner will always be slower.
> So, if we go with this solution, then the following is needed:
> 1. Modify test jobs so that yocto-qemu{arm64/arm} uses arm64 tag to be ta=
ken by arm64 runner and use tag x86_64 for yocto-qemux86-64.
> 2. Come up with a solution to build the yocto containers automatically fo=
r the above platforms + possibility to specify the platform for local users=
.
>   Right now, these containers are being always build for the host machine=
 platform, so without doing tricks like adding --platform or prefix to imag=
e name,
>   one cannot build the Yocto containers that would be ready to be pushed =
to registry. We need to have a clean solution without requiring user to do =
tricks.
>=20
> The only drawback of this solution is that the person building the yocto-=
qemu{arm64/arm} container and willing to push it to registry,
> needs to have access to arm64 machine.

I think we need to find a solution working for both possibilities.
And we also need a solution so that one can have both kind of images so the=
 host machine should be encoded in the container name somehow.

>=20
>>=20
>>> Regardless of what we chose, we need to keep in mind that the biggest a=
dvantage to the Yocto build/run is that
>>> it allows/should allow local users to perform basic testing for all the=
 Xen supported architectures. This is because
>>> everything happens in one place with one command.
>>=20
>> That's right, but it should be possible to allow the Yocto containers to
>> also build and run correctly locally on x86, right? The arm/x86 tag in
>> test.yaml doesn't matter when running the containers locally anyway.

All in all, test.yaml only matter for gitlab.
Maybe we could have it supporting both cases but only use one ?

Cheers
Bertrand

>=20
> ~Michal


