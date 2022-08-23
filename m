Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19A2359D6AE
	for <lists+xen-devel@lfdr.de>; Tue, 23 Aug 2022 11:42:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.391839.629834 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQQQF-0001x8-07; Tue, 23 Aug 2022 09:42:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 391839.629834; Tue, 23 Aug 2022 09:42:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQQQE-0001v4-Sl; Tue, 23 Aug 2022 09:42:10 +0000
Received: by outflank-mailman (input) for mailman id 391839;
 Tue, 23 Aug 2022 09:42:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fxx3=Y3=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1oQQQC-0001uy-V7
 for xen-devel@lists.xenproject.org; Tue, 23 Aug 2022 09:42:09 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2088.outbound.protection.outlook.com [40.107.21.88])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id da493127-22c7-11ed-9250-1f966e50362f;
 Tue, 23 Aug 2022 11:42:07 +0200 (CEST)
Received: from AS9P250CA0017.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:532::16)
 by AM6PR08MB3096.eurprd08.prod.outlook.com (2603:10a6:209:43::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.21; Tue, 23 Aug
 2022 09:42:05 +0000
Received: from AM7EUR03FT041.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:532:cafe::ec) by AS9P250CA0017.outlook.office365.com
 (2603:10a6:20b:532::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16 via Frontend
 Transport; Tue, 23 Aug 2022 09:42:05 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT041.mail.protection.outlook.com (100.127.140.233) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5546.15 via Frontend Transport; Tue, 23 Aug 2022 09:42:05 +0000
Received: ("Tessian outbound fccf984e7173:v123");
 Tue, 23 Aug 2022 09:42:05 +0000
Received: from ed84d967b700.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B1ED427D-EC35-4AC4-8775-888DC4DBA2A6.1; 
 Tue, 23 Aug 2022 09:41:58 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ed84d967b700.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 23 Aug 2022 09:41:58 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com (2603:10a6:20b:404::24)
 by DB9PR08MB6556.eurprd08.prod.outlook.com (2603:10a6:10:261::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.19; Tue, 23 Aug
 2022 09:41:56 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::f5fa:7206:9197:6ba2]) by AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::f5fa:7206:9197:6ba2%3]) with mapi id 15.20.5546.022; Tue, 23 Aug 2022
 09:41:50 +0000
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
X-Inumbo-ID: da493127-22c7-11ed-9250-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=cWwJ8Sc9hGwZbAYg5plDLRvoIzQtPv4APXckpQ/nN+veIWEIBSo3fWZas8tI9sjl9al0OqbnHatmb8gTkaC7rimBtqvP/hboWf5ZHVa1Lp6pKK+bfeSoDxzCPYKOoQ4zsiWr5JLE+k+tACfOh6q6u0VahxePoAwySFnJGGTx1SLrW62EMZlr6EaGmMew3CtY6yKxzVucpKNdVZfkdiEWJov0CXu6NF+W9WfSDVG+X88AenF4fNZm827//DwRNCA88enOew/RfYST5+jwZf8dCFsHo2bZQrLrVBBWQJKoyVMRNwmc3ExubwR6sr6Tevngw7gKVNnQeigmAsYWFSXg+Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3lKUlB4fxY4zQzcYaF932ZP5kB3enNdez8RwjKTc+tM=;
 b=FrWunqRTpkIJZJg1+A+QbNllUKQbS1j3Zn8Y8VsOYRqOVosXRH+6605KHEGPUHiD0ra82MvYctkAtDpFHdSozfBPD2v+NRGnOq5wm/zvNYZpMkhgGTMB6MBFkXOAs29UdnGODZ8+y27w02xkSYlwdJSaapvImA7RBzq3mgfIqzy7cJJEVQYSIpjdhH6MfPd8g+dXT/BEBhiZu99kW/hFXErGwm5vt+llftPhW+EYH/Flx7fmq9MsgmBWGv8Yzueolrc+7zNaKUC18GdkUmZfJ00jUKguVvKn+cdkf1j6A8b4CFbEH/DR+23O4J7AZViQFj1Q7J86+Y83HBeNBkcDmw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3lKUlB4fxY4zQzcYaF932ZP5kB3enNdez8RwjKTc+tM=;
 b=ZLhzATXbIOb7tx8DAv6Lfcr6PA9amlBQee8IlvCRuhdohDAgLJ+qCmLvzF0QTBlY5V9GLZc77CopChYkU+z9BaIxFUqg5hoLnFWrxaqqjabf6C3TlhW+xIBFVC5Sc1b7hwhQPTekBhhrBQ/JQS642ThnGjAwM7fH9KAJOrovQI4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 63900b9181ad9ba4
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KSo7gkB/2LQLvbuIktfHW4y1bQh8J/rFhi7S3uazLMyoVNLnm6mHKZHXHUxP+xz/peLHW5f9ovzM5wKttzYsmGY1cQCPNBkbW4kxRPGHm8Fenfqa6m13/jDXoDtEjnSbrbpGfSMR4qXC1faJiWbPv4vCNfHgOCHdTGd1pCGah9fgLgFuNw/RdGkXIFlIftXh2AQ5KCEag+8FgRjxpBbwswZEAajRyRWRzkuGrEUbo7hXrECH2o/JJywl3MaBzv+vig5ZTVz7CJZdSqXVmt3HZJ8b4HPnsX8ICdbgvwfzwWFIscTp/oL5Z7Id7lUxTLRdIhfa0FvlDZH9gOZMJV7bBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3lKUlB4fxY4zQzcYaF932ZP5kB3enNdez8RwjKTc+tM=;
 b=LcNQ4DAZ715SxNPOkgCL3cF13x9BnYBJw7RGkuZpNkWqQkNZ7f5PjSs3hDHdifGob4a7mRcG46smuEOT+ll8y30qzXv+6jMT1hB9dRwsL/Fj4pwt3sc9UeAWBVfZzPh3+lKvRGTrYLHezCYY3QyrG9EAyCXQmb+Nr9Z6nd7tDdm4aVd64z0cdDGBJnozLWSzfx96sBKIInteXSZjgPFydk1qtuwof3atb8Phi0vmDtNB5N8qz0rMRxwB9xtk7yynQvAl3ffi97jyTklknLDe+oQF4wIGX8NbyeMaIFwOGPOAwCOcbSss+iI3TTVxqfotixjG3K/QXMsRYQaUgET/4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3lKUlB4fxY4zQzcYaF932ZP5kB3enNdez8RwjKTc+tM=;
 b=ZLhzATXbIOb7tx8DAv6Lfcr6PA9amlBQee8IlvCRuhdohDAgLJ+qCmLvzF0QTBlY5V9GLZc77CopChYkU+z9BaIxFUqg5hoLnFWrxaqqjabf6C3TlhW+xIBFVC5Sc1b7hwhQPTekBhhrBQ/JQS642ThnGjAwM7fH9KAJOrovQI4=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Julien Grall <julien@xen.org>
CC: Jan Beulich <jbeulich@suse.com>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Wei
 Liu <wl@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 3/7] xen/evtchn: restrict the maximum number of evtchn
 supported for domUs
Thread-Topic: [PATCH v2 3/7] xen/evtchn: restrict the maximum number of evtchn
 supported for domUs
Thread-Index: AQHYs7MVCCbVCzB/DU2JPHyjxuVOOK269JmAgAEvmICAAB2KgA==
Date: Tue, 23 Aug 2022 09:41:49 +0000
Message-ID: <579C8A74-055D-445B-9955-750107DC80CF@arm.com>
References: <cover.1660902588.git.rahul.singh@arm.com>
 <1a8c49dcc237187cbb9fccaafe1e6533fe68381c.1660902588.git.rahul.singh@arm.com>
 <71c651a6-e8ad-78fc-efe5-2f20c332530a@suse.com>
 <96618b21-7cb5-d160-75b3-953ccdc75ac5@xen.org>
In-Reply-To: <96618b21-7cb5-d160-75b3-953ccdc75ac5@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: e5f1be61-977a-4274-0a83-08da84ebbd35
x-ms-traffictypediagnostic:
	DB9PR08MB6556:EE_|AM7EUR03FT041:EE_|AM6PR08MB3096:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 obwPDcUzF1gjEL5kE8g9/8DleErtPSRkeavkWJwRlAU1eXjBQy0GxeNCrFAVBr6S8wzMQVUrSeXcYYOnN4Ik0TbHPrmF2nrdIndRnnYr6ybv5VWE10RHYp0fk2mUt7nkar1VfpUlhKQhmtvhugkI/f435TzU3yTD9FXzKUkL4KAYXaEsmSaq5/op4p7SrTHWgOmsKDcLIalwWXisZbJygNh9LrNJ4HRtnTro6EIXAPfJsiFYtVvYT4iJtGZ8h0m5PcFjx0E9r5lZWikT/1G2CzZfGcQkGowR97jli5V+1cQO/kPoRzy/kLL4UsQdLDL9i1oMBnZ4Lb8cul2JmXRf9fiOO103Hqal1LuFcyAGjSWHU9Yh4dhut3Fjk7cwDG1Jdkz4aV3yenc24QQ4cmMvDSsSTWkX7+2uYyCabeehcqD6OmBE1K8R2VeCYYaEKtdIhI0DoIs/yCLLK8CfhqZQOI8EWY6nGCbJSAKBUZqnc8xpW6bZnlHQDVfpAuPCFR1kScRt33UYWYuTW6ZanxWmcwg3z6M6c/6mDuglUYhSOhbfPjQ3010s0hrCzNUofMVXMgpySvXWdoywbw9STxS4YC21S7QQGbv/xjZiYm6yMVnkD2tsjhiJGLSkwqcG5I2SE1ZXRTR6iUXGsH6vA78+cKqx3+A/Uz05bjELxji5SHBIlv6XMuagyohnDW4p6UDugGJ0kxUdJUPKF5xyXqUu8Zq/QuOiLkF2Z++GOg1QKtdGD00P9+fTFatPrfhARACiXW3AH78JmEpdOlumHEm9leFDWSUmFuzOctbuQUrSZt8=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7158.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(396003)(39860400002)(366004)(136003)(376002)(66556008)(8936002)(66446008)(8676002)(64756008)(4326008)(86362001)(91956017)(6916009)(76116006)(54906003)(36756003)(33656002)(66476007)(66946007)(38100700002)(122000001)(38070700005)(186003)(83380400001)(6506007)(26005)(6512007)(6486002)(71200400001)(41300700001)(478600001)(316002)(2616005)(53546011)(2906002)(5660300002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <82977BF9BD81A5498BC355DD16C1569B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6556
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	bbeb3a90-e1ed-42d1-3d5e-08da84ebb422
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hS6VXihZ5EINSRzhMf4kS5E/jE8dnpqVM1biZiEUeYbpB2weKoh5XSVdr/UYtZV1yAXi7efBiRL8ASUj3ZSy6LiNO5v7HxKv7VjJsv0UJiqGFxpIwSpP9WhXdykfs64Ypie9uRtbPzk+HaqRCvy2WW67zDQlN87fAzwp4TMFRFms7sxY5J6X33EAO1KB3hW9F3jkwIusuKZLvshj2BXk9aotOSkvPsp/cQC1ntSLGM3t9CW4fPY2NIq5OjZX7pYip8+i+FruvtRLT0sIDQLS3ONUAOt2ci+OzIphv+yNt5eViVEGmTm75wdYNfuMrQrwIA7CK0d7+tlOWDAbYWzV2zFfP4ZHU0LS27guWw3Y8MEKEKErBCqOdzOWpFDxaWDX9u2qB23Nq3TVpbIvss/aUVOzDxrblmFSqElXR1FWS7KUeX2kocMC9w4Nrto8mZSW1zBpVUh0dZiURz7lXcf9vVoNCWbqrWanet7YZuwmCK/6HIRDCmipoLdqGo8tNmcrajmOFIcmx2xHxtchazqOxn0knQv/+rB4D39gZgAs2Bg4erd+9f65Ore62CAVjKzFXDoxx6Dspdctt1lHoVWsK6oDWtunDJbb+GKIDM+FK8qGw7tHvb4VmsN7HYmhMFX7L+S/zKuhOnYjpIsBUfFSXRbvgiF+TNg2tZ8c/h0iRvPJEBTfyfbgYvCTCMmJBo6MMO+MpdxxWr4MgyoAfd0IYpC/0PlXTSR7Yu8hEBBKq4263426jwjqP9+tfLbndZSKi5CfyZ0W6XIdLLScDvEjhw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(136003)(376002)(396003)(346002)(39860400002)(46966006)(40470700004)(36840700001)(53546011)(26005)(478600001)(6486002)(41300700001)(6512007)(6506007)(82310400005)(4326008)(40480700001)(8676002)(2906002)(86362001)(33656002)(36756003)(54906003)(316002)(40460700003)(81166007)(356005)(336012)(47076005)(2616005)(186003)(82740400003)(5660300002)(8936002)(70206006)(6862004)(70586007)(83380400001)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2022 09:42:05.2428
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e5f1be61-977a-4274-0a83-08da84ebbd35
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3096

Hi Julien,

> On 23 Aug 2022, at 8:56 am, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Rahul and Jan,
>=20
> On 22/08/2022 14:49, Jan Beulich wrote:
>> On 19.08.2022 12:02, Rahul Singh wrote:
>>> Static event channel support will be added for dom0less domains.
>=20
> I am not sure how this sentence is related to this patch. You...
>=20
>>> Restrict the maximum number of evtchn supported for domUs to avoid
>>> allocating a large amount of memory in Xen.
>=20
> ... still need the limit to prevent a domain using more memory because at=
 the moment they are unlimited.

Ok. I will remove the sentence.
>=20
>> Please clarify here how you arrived at 4096 and why you expect no
>> dom0less DomU would ever want to have more. The limit, after all,
>> is far below that of FIFO event channels.
>=20
> I will reply on this because I suggested the limit. A dom0less DomU is ex=
actly the same as a DomU created by the toolstack. The default is 1023 (I o=
riginally thought it was 4096).
>=20
> I would expect that is 1023 is going to be fine by default also for dom0l=
ess domU as on Arm we don't bind physical interrupts to event channels. So =
the only big use for them is for inter-domain communication.
>=20

I will add this information in commit msg.

> Therefore, I think it should be ok to default to 1023 if we want consiste=
ncy.
>=20
> If someone needs more than 1023, we could introduce a per-domain device-t=
ree property to override the default maximum.
>=20
>>> --- a/xen/arch/arm/domain_build.c
>>> +++ b/xen/arch/arm/domain_build.c
>>> @@ -3277,7 +3277,7 @@ void __init create_domUs(void)
>>>          struct xen_domctl_createdomain d_cfg =3D {
>>>              .arch.gic_version =3D XEN_DOMCTL_CONFIG_GIC_NATIVE,
>>>              .flags =3D XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap,
>>> -            .max_evtchn_port =3D -1,
>>> +            .max_evtchn_port =3D MAX_EVTCHNS_PORT,
>>>              .max_grant_frames =3D -1,
>>>              .max_maptrack_frames =3D -1,
>>>              .grant_opts =3D XEN_DOMCTL_GRANT_version(opt_gnttab_max_ve=
rsion),
>>> --- a/xen/include/xen/sched.h
>>> +++ b/xen/include/xen/sched.h
>>> @@ -76,6 +76,9 @@ extern domid_t hardware_domid;
>>>  /* Maximum number of event channels for any ABI. */
>>>  #define MAX_NR_EVTCHNS MAX(EVTCHN_2L_NR_CHANNELS, EVTCHN_FIFO_NR_CHANN=
ELS)
>>>  +/* Maximum number of event channels supported for domUs. */
>>> +#define MAX_EVTCHNS_PORT 4096
>> I'm afraid the variable name doesn't express its purpose, and the
>> comment also claims wider applicability than is actually the case.
>> It's also not clear whether the constant really needs to live in
>> the already heavily overloaded xen/sched.h.
>=20
> IMHO, I think the value would be better hardcoded with an explanation on =
top how we chose the default value.

Ack.=20
=20
Regards,
Rahul=

