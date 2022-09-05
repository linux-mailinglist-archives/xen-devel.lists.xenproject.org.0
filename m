Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E21D5AD00E
	for <lists+xen-devel@lfdr.de>; Mon,  5 Sep 2022 12:24:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.398688.639598 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oV9GT-0005DI-BW; Mon, 05 Sep 2022 10:23:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 398688.639598; Mon, 05 Sep 2022 10:23:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oV9GT-0005Ab-8l; Mon, 05 Sep 2022 10:23:37 +0000
Received: by outflank-mailman (input) for mailman id 398688;
 Mon, 05 Sep 2022 10:23:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PPTu=ZI=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1oV9GR-0005AF-SJ
 for xen-devel@lists.xenproject.org; Mon, 05 Sep 2022 10:23:36 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80079.outbound.protection.outlook.com [40.107.8.79])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id caed54dc-2d04-11ed-af93-0125da4c0113;
 Mon, 05 Sep 2022 12:23:32 +0200 (CEST)
Received: from DB6P195CA0007.EURP195.PROD.OUTLOOK.COM (2603:10a6:4:cb::17) by
 AS8PR08MB7815.eurprd08.prod.outlook.com (2603:10a6:20b:529::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Mon, 5 Sep
 2022 10:23:30 +0000
Received: from DBAEUR03FT054.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:cb:cafe::15) by DB6P195CA0007.outlook.office365.com
 (2603:10a6:4:cb::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10 via Frontend
 Transport; Mon, 5 Sep 2022 10:23:29 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT054.mail.protection.outlook.com (100.127.142.218) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.10 via Frontend Transport; Mon, 5 Sep 2022 10:23:28 +0000
Received: ("Tessian outbound 6a3290ff1310:v123");
 Mon, 05 Sep 2022 10:23:28 +0000
Received: from 9d38d3bb0c37.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C02FB8FB-3FD9-4108-86F1-E87DA5E6419C.1; 
 Mon, 05 Sep 2022 10:23:17 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9d38d3bb0c37.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 05 Sep 2022 10:23:17 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by GV1PR08MB7899.eurprd08.prod.outlook.com (2603:10a6:150:5e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.14; Mon, 5 Sep
 2022 10:23:15 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a%4]) with mapi id 15.20.5588.018; Mon, 5 Sep 2022
 10:23:15 +0000
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
X-Inumbo-ID: caed54dc-2d04-11ed-af93-0125da4c0113
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=eQ7BizAAR6M48iJ4HXGhISHwMjg0DPp8zslSeuse62jNHchDzP64B1nDNsnYvROc9XdGoOZUeilzbuXMkTo2kMvC72bewEGlRJC3vzm6VD8uOyOcdoWScW8qU7IfdT6YaIwPpbx9yCGbX9+3gAgHZIP1/b9bsh+Xw/rGBLKPvvWxAS3OaA3y7JPZmKFqGxjKqoqNMzSXXXufFGBmBMqfPG8uwxdPKoaz7zuR5dpJ95rFSdKdt8DXMYp+kG0bIq16EC99hZAoMsHy3Il4+IlAPMtKOqQ/p+K1ViwHHC4iSftT3k1T7XlWV972xDjkS876OiA3auyGdEk+lEyGK5eBYQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PMk4SVauaH5SMHMK2VVZThaO7HX4T+edUbNHKUIHbnY=;
 b=SMCcj+5tVpDZ38IpG08vUshpQy/UO7RnCt4W/wva+/YOjPfzdyQCTz+/+2boNxu9TZIok/6V/urxwJ1Si0sQwQp4fFHlc01eXd8EhTd/9E66Wq8+fq17stvP7bBVRP3AAfyNzufbqLvWHjgXV0m23qUTm1V6WvooT4fNJlhHvM4wGe3lBmJ4EyPcYJcqb53JqGXUT0AG4CCNzSrIawYRtdUlH3vouTMDQxySzPjQDr7HJVF4JgIOuTajwnt7Av1iACLVmZNbC0BIxBY6ZdwKiTuYem59jsVASEYdHNPPGi+GslVVYROSmY7yt3aa+NzOk7h9qTjdlqyHIpxnl9RdBg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PMk4SVauaH5SMHMK2VVZThaO7HX4T+edUbNHKUIHbnY=;
 b=gI6oDDACbjN+SnVkvPU6ceZ42O8QeLRH02omfKeKTJQb4Oo4G0kvbbaTGCi5x/yEalOo+0DmBdK+Ti2SyXVgmdsD0VQRPlrA0cvnWwzgDpAT2e3cP390nvUvPlNHEzNQv16u7YNzQKQ+wVW6Dq3YecAWm2ZpZKw0jv9ksOni4Ps=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 786d5d970e109e3d
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lq828TaKAiJajCe1r0KFQa1p+VqS5wJ3oqUH5olclae1QZHMsL38zTcap6gTXIio+MDD2w9FcM6qH5usqkuDD+25nTawRSLFQlouIOynj1tVmUIgG2l8R2vATqkGaS338GTdfMQXfDwVADCx28QkjEdAy1dhkL1xtm8umvA31LuAF99gnRi+333IqNavE7idLLz914MZMWtiK7B6fQ9ZAUXi5IajqQJisVhxf3Cg/jUdvxfLgviDo4YygI3iHxd6iSXAWnR6nqIVRh90TrvyTlbQ5jFw6UUOq77i9GubDcDw6Qavb/jP4RTRxMThEekF3/DK9V4OXCVKa3HlT7A3bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PMk4SVauaH5SMHMK2VVZThaO7HX4T+edUbNHKUIHbnY=;
 b=epgVZuRH4H0AP4QbYiMp3D6wKS6Z7VPTFybShTWs8TkxHzqLWkBw3k9GKgX3jrpAErAg45sf6h+PWAY0x24A16bn9u7Bdj8CG4MDKhVqd5eNsoW/n3w+lYh1flq3Dj5ubGgDGD7SsPRVrOYfOlyQCBGYJHGPapGUDonQv+pEDjgIzlt3xhM+tYlBlxSq3E+l/hJeWBcACLaGMYk0dewJHgBwM5BLNfBEq6g4fQMn72YEVFWJza4KIAxlw2UJllQppNDXl7+4mSzp8q7NbVv179gU3lvO372U4XI1bZL8scKUwP6zn2+nT9elTSmJGNWMIyr4Dn9TzNLxqizcHCHz2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PMk4SVauaH5SMHMK2VVZThaO7HX4T+edUbNHKUIHbnY=;
 b=gI6oDDACbjN+SnVkvPU6ceZ42O8QeLRH02omfKeKTJQb4Oo4G0kvbbaTGCi5x/yEalOo+0DmBdK+Ti2SyXVgmdsD0VQRPlrA0cvnWwzgDpAT2e3cP390nvUvPlNHEzNQv16u7YNzQKQ+wVW6Dq3YecAWm2ZpZKw0jv9ksOni4Ps=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Rahul Singh <Rahul.Singh@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, xen-devel <xen-devel@lists.xenproject.org>, Zhou
 Wang <wangzhou1@hisilicon.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH v2 03/10] xen/arm: smmuv3: Ensure queue is read after
 updating prod pointer
Thread-Topic: [PATCH v2 03/10] xen/arm: smmuv3: Ensure queue is read after
 updating prod pointer
Thread-Index: AQHYvtEAS2RWaHYM0E2SfKglZEy6Bq3Mx8YAgAPLlICAAAOLAIAADnwA
Date: Mon, 5 Sep 2022 10:23:15 +0000
Message-ID: <71FC45C0-2F78-4CB7-AAB7-5B2C357F2C74@arm.com>
References: <cover.1662123432.git.rahul.singh@arm.com>
 <59c24309e2d8494edf414904fe9725b4e7387098.1662123432.git.rahul.singh@arm.com>
 <alpine.DEB.2.22.394.2209021613440.3931@ubuntu-linux-20-04-desktop>
 <FB788985-2DE3-406D-9282-56B8C9E4B1C1@arm.com>
 <5f0bf815-3236-2262-62b4-cd3d99bb60ff@xen.org>
In-Reply-To: <5f0bf815-3236-2262-62b4-cd3d99bb60ff@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 91271be0-81d9-4304-e0fc-08da8f28acc3
x-ms-traffictypediagnostic:
	GV1PR08MB7899:EE_|DBAEUR03FT054:EE_|AS8PR08MB7815:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 khkh8fo6lKUrBxXsbq+FSUqP2bSsXc2UmTJKuD1ledXSkLyr6wIoa3OcGYETqsviHHlKTFtvmO8CEht5mtpwV+OJjACB/XwsklEUAxYOZ+1k30n6IdTQcFrEsPw7AhjOlRbpSDP7nEvgmrj1O+tQCh/hxRIWSg6Dn07JQEQI/+BXNML9T2oQmJzHlRSdZkY+eILs7x2alDlLC433oVQhTqsFxjAA5a7Bsw/uffrdNAmzyH3n5S29QKXiYS84ayaGy3+TPd0ZR+bV533CJLtXb0CmhLyGdS/7KiEMJWEzAD7+IgKrtaXQXIkaROQreODbJvx9dQODkluPe+1DoZzFJVROMvhijHqJZnagYjzBOHjLanRTkoVYa5V/ULqXA8GW51X3WnNOf3Y4HyI52v/QqhV4wZfZ4AcfnlGJlwYU5+V/Kqts2bsySeecyySlFHn1qb8+sTLkD/kSfhJB56eC7EXPvJW/U3GxfdauetqM3NAzK1iRf2zcMWzGaOM4zKz64VOo3GSaiexN+PXiuLa7btKJag3kmXxr5H2ExFGYfxoKNvt8Nh33a6qCNi7cAVXnNGudig1hUAe0hAxU0vB3tPf5nXwh+p6RG73IW/rUw7Zt0MT+JKm0gzB3TwG+dhrmmI3OS3Ke3vlsmXOQfMj1lGcN0uFTQGqhvtdZmcaFgPRKWp47CKX055QIJtYyM1ejAgFi3+gUDCFaISzEOtPvqse58N6D1qjH3jW4ryLw2sIsabmB96FfGlhFEahgIrk18Ik7/bzlgbPjCShsSUqrm8FiweeU01jhjRZN1wVaVV5T1146wPHV1Dhrn5K6RC4TB71uZDANIOcQuknFcDQygg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(346002)(396003)(376002)(366004)(39860400002)(53546011)(26005)(6506007)(8936002)(2616005)(6512007)(186003)(71200400001)(5660300002)(33656002)(41300700001)(478600001)(86362001)(6486002)(966005)(36756003)(38070700005)(83380400001)(2906002)(6916009)(8676002)(4326008)(66446008)(54906003)(64756008)(38100700002)(66476007)(316002)(122000001)(66946007)(76116006)(91956017)(66556008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <4F7EBBC32551A141B68075FCF77C4621@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7899
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a5d56338-7da0-40f1-193c-08da8f28a4d1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	t8JuapwEz+5mnPVvaBekSOmuGQw25P/in9WULN+2hw91LeBao/KJXdlVIAo6f+N0q1Cq8IJH/cHAtTafadGq4EhNJHOZq4E8ciEIdJv7d6+yvLz29b+BgO28/lhHus6CyGpdDHTlcnIam0bkBAKZf/74iWebPmByVSyZZ3JVwECYeQoIFyd7euvC1muodPM2qO/K/Sb+Y1egE3IHjt3KQkYTUTB/9l7s0izekZCXkI29tPoIt8rcx33xEy/saH0IQWf/2cD9c/mCDIBFvzjg5M1h3/BMQr2nM9iR6kk5b3on8HuRJdXvfcZK1NhRYAeZrL5cLxjSztQm1qr4TaCdW/WgjyviY2HSBJ3K4v2XW21fE7XE67ASH1d9Ajb5lOvXYgVWM9yeZ6wPlZHRfch6eKAYECmMT4c69BlK+cKoqyqvqIZFFQPQdqhK90WBbCg81dYd5aLGc8RTKfggsfI4FlzJV+LDDX2aJpL6fzBQL8oFr98ZOqnQeQmn7F+hqKs4ZpAbDgn0wKWjuSLS6yaVWy5WBhaUdNTZo5NiedohJO+T8WYiVyF8KdAIr23GSqdPW4oJs1aDVDg7ItgenCRH7wdg3oQUth0tFwOsaPBBGH3GPalvx7JrRkxh3lyQiwQQLmxezen/oTg26OPCX/uTHGiurXXUfIcFv/2HjAGSsnNBPnNmv3cr236qeDCzJ3XW9QdflqlJux8666421llsYnkuoeOmpKoZ/M/FnV1maUD6WP1aRfGiHdP2awaVgGCQ96sUQXu8e4Uo8GWeg9WyNvKJFiUQZL9jdCtTUQqf2dA=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(136003)(376002)(346002)(396003)(36840700001)(40470700004)(46966006)(316002)(478600001)(82310400005)(54906003)(8676002)(966005)(40480700001)(4326008)(5660300002)(8936002)(6862004)(2906002)(356005)(70586007)(81166007)(70206006)(6486002)(33656002)(86362001)(82740400003)(36756003)(40460700003)(336012)(107886003)(47076005)(53546011)(26005)(41300700001)(186003)(2616005)(83380400001)(36860700001)(6512007)(6506007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2022 10:23:28.6172
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 91271be0-81d9-4304-e0fc-08da8f28acc3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7815

SGksDQoNCj4gT24gNSBTZXAgMjAyMiwgYXQgMTA6MzEsIEp1bGllbiBHcmFsbCA8anVsaWVuQHhl
bi5vcmc+IHdyb3RlOg0KPiANCj4gDQo+IA0KPiBPbiAwNS8wOS8yMDIyIDEwOjE4LCBSYWh1bCBT
aW5naCB3cm90ZToNCj4+PiBPbiAzIFNlcCAyMDIyLCBhdCAxMjoyMSBhbSwgU3RlZmFubyBTdGFi
ZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPiB3cm90ZToNCj4+PiANCj4+PiBPbiBGcmks
IDIgU2VwIDIwMjIsIFJhaHVsIFNpbmdoIHdyb3RlOg0KPj4+PiBGcm9tOiBaaG91IFdhbmcgPHdh
bmd6aG91MUBoaXNpbGljb24uY29tPg0KPj4+PiANCj4+Pj4gQmFja3BvcnQgTGludXggY29tbWl0
IGE3NmEzNzc3N2YyYy4gVGhpcyBpcyB0aGUgY2xlYW4gYmFja3BvcnQgd2l0aG91dA0KPj4+PiBh
bnkgY2hhbmdlcy4NCj4+Pj4gDQo+Pj4+IFJlYWRpbmcgdGhlICdwcm9kJyBNTUlPIHJlZ2lzdGVy
IGluIG9yZGVyIHRvIGRldGVybWluZSB3aGV0aGVyIG9yDQo+Pj4+IG5vdCB0aGVyZSBpcyB2YWxp
ZCBkYXRhIGJleW9uZCAnY29ucycgZm9yIGEgZ2l2ZW4gcXVldWUgZG9lcyBub3QNCj4+Pj4gcHJv
dmlkZSBzdWZmaWNpZW50IGRlcGVuZGVuY3kgb3JkZXJpbmcsIGFzIHRoZSByZXN1bHRpbmcgYWNj
ZXNzIGlzDQo+Pj4+IGFkZHJlc3MgZGVwZW5kZW50IG9ubHkgb24gJ2NvbnMnIGFuZCBjYW4gdGhl
cmVmb3JlIGJlIHNwZWN1bGF0ZWQNCj4+Pj4gYWhlYWQgb2YgdGltZSwgcG90ZW50aWFsbHkgYWxs
b3dpbmcgc3RhbGUgZGF0YSB0byBiZSByZWFkIGJ5IHRoZQ0KPj4+PiBDUFUuDQo+Pj4+IA0KPj4+
PiBVc2UgcmVhZGwoKSBpbnN0ZWFkIG9mIHJlYWRsX3JlbGF4ZWQoKSB3aGVuIHVwZGF0aW5nIHRo
ZSBzaGFkb3cgY29weQ0KPj4+PiBvZiB0aGUgJ3Byb2QnIHBvaW50ZXIsIHNvIHRoYXQgYWxsIHNw
ZWN1bGF0ZWQgbWVtb3J5IHJlYWRzIGZyb20gdGhlDQo+Pj4+IGNvcnJlc3BvbmRpbmcgcXVldWUg
Y2FuIG9jY3VyIG9ubHkgZnJvbSB2YWxpZCBzbG90cy4NCj4+Pj4gDQo+Pj4+IFNpZ25lZC1vZmYt
Ynk6IFpob3UgV2FuZyA8d2FuZ3pob3UxQGhpc2lsaWNvbi5jb20+DQo+Pj4+IExpbms6IGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL3IvMTYwMTI4MTkyMi0xMTcyOTYtMS1naXQtc2VuZC1lbWFpbC13
YW5nemhvdTFAaGlzaWxpY29uLmNvbQ0KPj4+PiBbd2lsbDogVXNlIHJlYWRsKCkgaW5zdGVhZCBv
ZiBleHBsaWNpdCBiYXJyaWVyLiBVcGRhdGUgJ2NvbnMnIHNpZGUgdG8gbWF0Y2guXQ0KPj4+PiBT
aWduZWQtb2ZmLWJ5OiBXaWxsIERlYWNvbiA8d2lsbEBrZXJuZWwub3JnPg0KPj4+PiBPcmlnaW46
IGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9s
aW51eC5naXQgYTc2YTM3Nzc3ZjJjDQo+Pj4+IFNpZ25lZC1vZmYtYnk6IFJhaHVsIFNpbmdoIDxy
YWh1bC5zaW5naEBhcm0uY29tPg0KPj4+PiAtLS0NCj4+Pj4gQ2hhbmdlcyBpbiB2MjoNCj4+Pj4g
LSBmaXggY29tbWl0IG1zZw0KPj4+PiAtIGFkZCBfaW9tYiBjaGFuZ2VzIGFsc28gZnJvbSB0aGUg
b3JpZ2luIHBhdGNoDQo+Pj4+IC0tLQ0KPj4+PiB4ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vc3lz
dGVtLmggICAgIHwgIDEgKw0KPj4+PiB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vc21tdS12
My5jIHwgMTEgKysrKysrKysrLS0NCj4+Pj4gMiBmaWxlcyBjaGFuZ2VkLCAxMCBpbnNlcnRpb25z
KCspLCAyIGRlbGV0aW9ucygtKQ0KPj4+PiANCj4+Pj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2Fy
bS9pbmNsdWRlL2FzbS9zeXN0ZW0uaCBiL3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9zeXN0ZW0u
aA0KPj4+PiBpbmRleCA2NWQ1YzhlNDIzLi5mZTI3Y2Y4YzVlIDEwMDY0NA0KPj4+PiAtLS0gYS94
ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vc3lzdGVtLmgNCj4+Pj4gKysrIGIveGVuL2FyY2gvYXJt
L2luY2x1ZGUvYXNtL3N5c3RlbS5oDQo+Pj4+IEBAIC0yOSw2ICsyOSw3IEBADQo+Pj4+ICNlbmRp
Zg0KPj4+PiANCj4+Pj4gI2RlZmluZSBzbXBfd21iKCkgICAgICAgZG1iKGlzaHN0KQ0KPj4+PiAr
I2RlZmluZSBfX2lvbWIoKSAgICAgICAgZG1iKG9zaCkNCj4+PiANCj4+PiBXZSBkb24ndCBoYXZl
IGFueSBvdGhlciAjZGVmaW5lIHN0YXJ0aW5nIHdpdGggX18gaW4gc3lzdGVtLmguDQo+Pj4gSSB3
b25kZXIgaWYgd2Ugc2hvdWxkIGNhbGwgdGhpcyBtYWNybyBkaWZmZXJlbnRseSBvciBzaW1wbHkg
aW9tYigpLg0KPj4gIEkgdGhpbmsgZWl0aGVyIGlvbWIoKSBvciBkbWFfbWIoKSB3aWxsIGJlIHRo
ZSByaWdodCBuYW1lLg0KPj4gUGxlYXNlIGxldCBtZSBrbm93IHlvdXIgdmlldyBvbiB0aGlzLg0K
PiANCj4gSXQgaXMgbm90IDEwMCUgY2xlYXIgd2h5IExpbnV4IHdlbnQgd2l0aCBfX2lvbWIoKSBy
YXRoZXIgdGhhbiBpb21iKCkuIEJ1dCBJIHdvdWxkIHByZWZlciB0byBrZWVwIHRoZSBfXyogdmVy
c2lvbiB0byBtYXRjaCBMaW51eC4NCj4gDQo+IElmIHRoZSBvdGhlcnMgcmVhbGx5IHdhbnQgdG8g
ZHJvcCB0aGUgX18uIFRoZW4gSSB0aGluayBpdCBzaG91bGQgYmUgbmFtZSBpb21iKCkuIFRoZSBy
YXRpb25hbGUgaXMgd2hpbGUgX19pb21iKCkgaXMgYW4gYWxpYXMgdG8gZG1hX21iKCksIHRoZSBf
X2lvcm1iKCkgYmVoYXZlcyBkaWZmZXJlbnRseSBjb21wYXJlIHRvIGRtYV9tYigpIChJIGhhdmVu
J3QgaW50byBkZXRhaWxzIHdoeSkuDQo+IA0KPiBTbyBpZiBpdCB3YXMgYSByZWFkIGJhcnJpZXIs
IHdlIHdvdWxkIGxpa2VseSB3YW50IHRvIHVzZSB0aGUgaW9ybWIoKSBzZW1hbnRpYy4gVGhpcyB3
aWxsIGtlZXAgdGhlIHRlcm1pbm9sb2d5IGNvbnNpc3RlbnQgd2l0aCBMaW51eCAoZXZlbiBpZiB3
ZSByZW1vdmUgdGhlIF9fKS4NCg0KV2UgbmVlZCB0aGUgX19pb21iIGFzIOKAnGxpbnV4IGNvbXBh
dGliaWxpdHnigJ0gaW4gZmFjdCBzbyBJIHdvdWxkIHN1Z2dlc3QgZm9yIG5vdyB0byBvbmx5IGlu
dHJvZHVjZSBpdCBhdCB0aGUgYmVnaW5uaW5nIG9mIHNtbXUtdjMuYyB3aXRoIG90aGVyIGxpbnV4
IGNvbXBhdGliaWxpdHkgc3R1ZmYgdG8gcHJldmVudCBhZGRpbmcgdGhpcyB0byBYZW4gb3ZlcmFs
bC4NCg0KQ2hlZXJzDQpCZXJ0cmFuZA0KDQoNCj4gDQo+IENoZWVycywNCj4gDQo+IC0tIA0KPiBK
dWxpZW4gR3JhbGwNCg0K

