Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE5480A012
	for <lists+xen-devel@lfdr.de>; Fri,  8 Dec 2023 10:57:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.650523.1016144 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBXbK-0002Pm-CR; Fri, 08 Dec 2023 09:56:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 650523.1016144; Fri, 08 Dec 2023 09:56:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBXbK-0002MF-93; Fri, 08 Dec 2023 09:56:54 +0000
Received: by outflank-mailman (input) for mailman id 650523;
 Fri, 08 Dec 2023 09:56:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1wyI=HT=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1rBXbI-00023G-EX
 for xen-devel@lists.xenproject.org; Fri, 08 Dec 2023 09:56:52 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2060d.outbound.protection.outlook.com
 [2a01:111:f400:fe16::60d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1c27fec9-95b0-11ee-98e8-6d05b1d4d9a1;
 Fri, 08 Dec 2023 10:56:51 +0100 (CET)
Received: from DB9PR01CA0003.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:1d8::8) by PR3PR08MB5786.eurprd08.prod.outlook.com
 (2603:10a6:102:85::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.28; Fri, 8 Dec
 2023 09:56:44 +0000
Received: from DU6PEPF0000A7DF.eurprd02.prod.outlook.com
 (2603:10a6:10:1d8:cafe::5d) by DB9PR01CA0003.outlook.office365.com
 (2603:10a6:10:1d8::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.28 via Frontend
 Transport; Fri, 8 Dec 2023 09:56:44 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU6PEPF0000A7DF.mail.protection.outlook.com (10.167.8.36) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7068.20 via Frontend Transport; Fri, 8 Dec 2023 09:56:44 +0000
Received: ("Tessian outbound 385ad2f98d71:v228");
 Fri, 08 Dec 2023 09:56:44 +0000
Received: from ffcf9c74dc5b.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E7F47997-7E14-4314-8260-B16C4BCFD4DA.1; 
 Fri, 08 Dec 2023 09:56:32 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ffcf9c74dc5b.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 08 Dec 2023 09:56:32 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by GV2PR08MB9877.eurprd08.prod.outlook.com (2603:10a6:150:dd::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.27; Fri, 8 Dec
 2023 09:56:30 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::c64b:7a3:ac99:25db]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::c64b:7a3:ac99:25db%2]) with mapi id 15.20.7068.027; Fri, 8 Dec 2023
 09:56:30 +0000
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
X-Inumbo-ID: 1c27fec9-95b0-11ee-98e8-6d05b1d4d9a1
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=SMWYkGD7iC8W6MMhaH93mFggg4icm5+8RGuiMBk0PFeSwMRHhQ0zNy1JjFzfL3ewslYHJVAh0LdTxscnI/38Gl2cO6uTugyVjkOZv7sTfoTZVWpTfzFRgy1RIROrhN1siuUI4+2lVC1MwtjBtKugddpn+t4xMfsyYzH5h2VLNkNaWyq/GwgyexyahewauKsXheJrIEi5aPL8A+EUhgELUkd9vu4/QaMPNBypHdrx8Aa0p0tSfM/2SwyH+76WKuHXxRhi5MytPJaKWo3Ydib5WscFtAc+vuonMBrPlW619Wb8KTh0WSJS9487HJm+n+4vWTThs6IML8AGREemz3buPw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HIQ6AVcEwHFVid0mEKgi2jeR1mP+K9tXRGAbuuK8amw=;
 b=irurMWgLTdRtPpwOdkTgyhU06LadjJqONkbn4gKapwmQD1uInII4yrsO96X06FuomG8ZmmslY1+vEufNx4nUwZRMlBQZYg1nGmW9INYb1HFDefLWsbnbKce02utJww/pNuxnW9qHOMD6ErDhJdZhko2SAbjgh9JY2u/1xGy+iVYj7fvMBupRWRUQ6o/Ff8RRofLKRCh9oFyZhR8in5eaTS/7npsxTyNhciqclyixa3n+3sEjHPG0hKaUq8mJ+LFwqFgPciqRK+GpFm90KQyjig+ixcFv4cqLjIo/gSzdsTvbkp/FKCckYub+rAGgT+DlDC9PATjN7cIOG+ha2Foyuw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HIQ6AVcEwHFVid0mEKgi2jeR1mP+K9tXRGAbuuK8amw=;
 b=r3ujacXaMSR7WRYc+as7kuOmE/3a6qt8s4fRvbbKwfNylXktKPnual+NZCLeI8bH+cfaHorLldW0K/OHTbFZsVPqcNLnqyOSs0DN3qsT4Agh9s2l86IJlEM/w3My6X7qa0WZJ9Pts/mhz2XxONMbBpnZlpgeXNc7eJHeaLFcdFQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 73a18c06a29d953b
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RezEQK0jlo6828WeomUTgseK/zKPr7s4737GzloUPiKLRdXQAAxjKUOUZrPf43AADw843YauEh2Rn0srfhydcU5M/+tOq3f0Ck1+RGt4AU3y2Ynv0C9SWWG+DN2pi5rwirolKlQrQ06ZCs3VJVohzxyZcsNMMQ/vHat49k1Z7d+Wxlrwgbh/Lay6CowHkCZOjbvTVl3B8EiYlcTaj9WSv7kLBRw4saAdE8ExMV6KhQLTmAHLXUVyAVaM39gYX7JKbW+QMw8pSRFb4biSx77dfnKBYkJI8i8lbHwEcwHkA7j0Q2H35GytUbpamxCMQBANAbE5rL5lGXj5PnQk6TYoMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HIQ6AVcEwHFVid0mEKgi2jeR1mP+K9tXRGAbuuK8amw=;
 b=ByHGyEsf7KY7cuKtWvBCPMYdn9cEBXbv0qfPd8estTAuWtmsvxUA7QlaFXjK9EfxpGtiu7SQ8mERjncmLgwRV5Vj5M6PqQA4ZAYwaH/jZczxX9+MdfZ3CX4NU5bkIE7q4sFR4XLZEi84VSj1tC6jQSDSAWhleqIOYdNYQyxQqf6eCHhh9eJxh83AVij2Hg4QC+iJ/l/40apUVuTEf7+LVUaB76GgqfLh+ywxJmmkfWg7lGScF61AVWGEA5AP2IvmQ+N4yy7PEB18iVTDoch9dOkiiZp1S6boyz3jFwAhUgvfMPUGTeAfwCzVunDSc2oX2eXC7h9jIRhKjti220K/6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HIQ6AVcEwHFVid0mEKgi2jeR1mP+K9tXRGAbuuK8amw=;
 b=r3ujacXaMSR7WRYc+as7kuOmE/3a6qt8s4fRvbbKwfNylXktKPnual+NZCLeI8bH+cfaHorLldW0K/OHTbFZsVPqcNLnqyOSs0DN3qsT4Agh9s2l86IJlEM/w3My6X7qa0WZJ9Pts/mhz2XxONMbBpnZlpgeXNc7eJHeaLFcdFQ=
From: Henry Wang <Henry.Wang@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Doug Goldstein
	<cardoe@cardoe.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen
	<Wei.Chen@arm.com>
Subject: Re: [PATCH v2 3/5] automation: Add the expect script with test case
 for FVP
Thread-Topic: [PATCH v2 3/5] automation: Add the expect script with test case
 for FVP
Thread-Index:
 AQHaKZoAVIHO2rCYDECWUL8sUR2sfLCfFe6AgAACFwCAAAHkAIAAAsIAgAAIGgCAAAGZgA==
Date: Fri, 8 Dec 2023 09:56:30 +0000
Message-ID: <9F69A6E2-2D83-46AF-8AB6-C1B409F4ADE0@arm.com>
References: <20231208054637.1973424-1-Henry.Wang@arm.com>
 <20231208054637.1973424-4-Henry.Wang@arm.com>
 <213f2b46-2668-4dae-8c57-269a73eff1bb@amd.com>
 <4609F9AA-44B6-40EA-A1A5-9D677679002D@arm.com>
 <0554806a-35c2-4abb-aa3c-3bab104c6c61@amd.com>
 <B9AFD918-42F6-4190-963B-E5A639D9F60E@arm.com>
 <2f34c0ec-0d94-48e2-bec0-faa96e1702f1@amd.com>
In-Reply-To: <2f34c0ec-0d94-48e2-bec0-faa96e1702f1@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|GV2PR08MB9877:EE_|DU6PEPF0000A7DF:EE_|PR3PR08MB5786:EE_
X-MS-Office365-Filtering-Correlation-Id: f98a601a-a6a8-4ec8-8af1-08dbf7d3fc07
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 zjarFPkjpe/HEANCuv4gqD9sy3lBUtYVFkqprto5OdXwY+V+gxUinUgmmzw61zeL7r3Eme7r4iQ9FP5fnIyNCYfyhM25xhfWzCZI/qWLTJ7us/vkfh0yHZoHKk12HViqzofPBw3jAyf/IOfoc673d36GJCPboPdr38Q4TGK27nByB1cRlxe9gWLtq2TNgq8C7gNpvkrUghFz7vB0VixbH67dYPpjXNyN3m9jkXOdAXLMHYIDuif89MMzsIRK8OnYR3CUD1bpWsCeR/nKsHukf+F19GRxzKaHF0StNxtsgrPmasxHMfbz1ps/MTv1xIc2lzWDPpjvGiGzcQbUMp3DxduOGn9n/5EfqUUgRab79zNq/Tc9BOkTdvw64gkL5V1hdyw8+J2F/frlocIOCFlk4rfJCybd1EmXAa7cYJrGL74apyYWxE3aqZXvYWIxUxylCeFvp8jTYISPB2111SdlRtSArBWPEoTuG6C3jF3xkG2R4+kw/SB0Y3N/o4JG2SePl45rpIDJsDdJynLRYPDj3/Uwsa7/XEiweGKNGh2o4HesWfzbb9hsXzpT2Fg2I24dL5IW69iUnQ76btEURStbIWCY30aJLEVX8VWu9AIDeEK56zuESPl2TtBwFUTNW8SwT6EL2CVP2yt9aoPmdHTH0Q==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(396003)(376002)(136003)(39860400002)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(2906002)(8936002)(4326008)(8676002)(5660300002)(316002)(66556008)(76116006)(66446008)(66946007)(66476007)(64756008)(91956017)(54906003)(6916009)(6486002)(2616005)(6512007)(6506007)(53546011)(36756003)(26005)(38070700009)(41300700001)(478600001)(71200400001)(83380400001)(33656002)(38100700002)(122000001)(86362001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <450C31365114C34481F25E09BBA317AB@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB9877
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF0000A7DF.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3de89327-5216-4880-b3f8-08dbf7d3f3fa
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	djvZ9/SU4mnma0wH7DBcHg/CN8ijJ2mJy27mqx1FMcErk7b3tCKmvrNh/+LDS0WDHbUlhR5W7VDPy3YQC8Srk9+nZS43p+PLo3oYtMmnNHfywnHWJXUdG7c2ZcuctBTg4bxgzFygy9lS0dpqdFd/MYGG3kVP3H/OpkX1mPZsl1k2KrodSacN26GZRHRur80kcN8U3dok6V9MBSZ8X/775gNzmXhukZwLvAzBl3mYWGqg0KpKMcL6sSS0R+bGXtPlju5re9Io0H/4kxqUPaH6zJISxMkBa4MgGJ1q+O4OcrS15Rl12psyHQLC0S36qEDj5GhqziERC2F1PISnRnUEJ+2cvobEYPpGHy1I8OIYlfs0Qc00J6Qk0wx6KJbE702cK1yD9K1q3lBRWgQoRsJnD/X9oGvNVDGUAimUvp2iKZl6hcDfty6T5zxlGqG6mHdT52HdW15X0p1yfGhfZg4/FrGqTXY0aioZ4BpyQY2URBJEqBSPiE2JWjVP3cuE1pp6gg4YpKt6mCzINaZjoedZy65KjDmNqH8Pabw35qpTYCTo9iX1pU8gXgHqtcIvbG3O3ah7A7m4/j6eI23bB4lJIdDCIrNDFTnJAfEOt4960F0ZxeDbXPH2tzkrPg2iCCiYinSUQUOA+7riSlgKa3dPKvy5qZJKAFuHSObC2ifEcBBDDk+DSidDfuF2ahq1gO6ggSCQ9kBcb0z+rY1vR1SfwFy/GDjYfNc6VC598r/YW1mIkuBSzztZl7pjrnihKNKP
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(39860400002)(136003)(376002)(396003)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(82310400011)(46966006)(36840700001)(40470700004)(2906002)(36756003)(4326008)(8936002)(8676002)(6862004)(5660300002)(41300700001)(82740400003)(40480700001)(36860700001)(47076005)(26005)(336012)(2616005)(83380400001)(33656002)(356005)(81166007)(86362001)(478600001)(40460700003)(316002)(6506007)(70206006)(70586007)(6486002)(54906003)(6512007)(53546011);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2023 09:56:44.1570
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f98a601a-a6a8-4ec8-8af1-08dbf7d3fc07
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000A7DF.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5786

SGkgTWljaGFsLA0KDQo+IE9uIERlYyA4LCAyMDIzLCBhdCAxNzo1MCwgTWljaGFsIE9yemVsIDxt
aWNoYWwub3J6ZWxAYW1kLmNvbT4gd3JvdGU6DQo+IE9uIDA4LzEyLzIwMjMgMTA6MjEsIEhlbnJ5
IFdhbmcgd3JvdGU6DQo+PiANCj4+IA0KPj4gSGkgTWljaGFsLA0KPj4gDQo+Pj4gT24gRGVjIDgs
IDIwMjMsIGF0IDE3OjExLCBNaWNoYWwgT3J6ZWwgPG1pY2hhbC5vcnplbEBhbWQuY29tPiB3cm90
ZToNCj4+PiBPbiAwOC8xMi8yMDIzIDEwOjA1LCBIZW5yeSBXYW5nIHdyb3RlOg0KPj4+PiANCj4+
Pj4gSGkgTWljaGFsLA0KPj4+PiANCj4+Pj4+IE9uIERlYyA4LCAyMDIzLCBhdCAxNjo1NywgTWlj
aGFsIE9yemVsIDxtaWNoYWwub3J6ZWxAYW1kLmNvbT4gd3JvdGU6DQo+Pj4+PiANCj4+Pj4+IEhp
IEhlbnJ5LA0KPj4+Pj4gDQo+Pj4+PiBPbiAwOC8xMi8yMDIzIDA2OjQ2LCBIZW5yeSBXYW5nIHdy
b3RlOg0KPj4+Pj4+IGRpZmYgLS1naXQgYS9hdXRvbWF0aW9uL3NjcmlwdHMvZXhwZWN0L2Z2cC1i
YXNlLXNtb2tlLWRvbTAtYXJtNjQuZXhwIGIvYXV0b21hdGlvbi9zY3JpcHRzL2V4cGVjdC9mdnAt
YmFzZS1zbW9rZS1kb20wLWFybTY0LmV4cA0KPj4+Pj4+IG5ldyBmaWxlIG1vZGUgMTAwNzU1DQo+
Pj4+Pj4gaW5kZXggMDAwMDAwMDAwMC4uMjVkOWE1ZjgxYw0KPj4+Pj4+IC0tLSAvZGV2L251bGwN
Cj4+Pj4+PiArKysgYi9hdXRvbWF0aW9uL3NjcmlwdHMvZXhwZWN0L2Z2cC1iYXNlLXNtb2tlLWRv
bTAtYXJtNjQuZXhwDQo+Pj4+Pj4gQEAgLTAsMCArMSw3MyBAQA0KPj4+Pj4+ICsjIS91c3IvYmlu
L2V4cGVjdA0KPj4+Pj4+ICsNCj4+Pj4+PiArc2V0IHRpbWVvdXQgMjAwMA0KPj4+Pj4gRG8gd2Ug
cmVhbGx5IG5lZWQgc3VjaCBhIGJpZyB0aW1lb3V0ICh+MzAgbWluKT8NCj4+Pj4+IExvb2tpbmcg
YXQgeW91ciB0ZXN0IGpvYiwgaXQgdG9vayAxNiBtaW5zIChxdWl0ZSBhIGxvdCBidXQgSSBrbm93
IEZWUCBpcyBzbG93DQo+Pj4+PiArIHNlbmRfc2xvdyBzbG93cyB0aGluZ3MgZG93bikNCj4+Pj4g
DQo+Pj4+IFRoaXMgaXMgYSByZWFsbHkgZ29vZCBxdWVzdGlvbi4gSSBkaWQgaGF2ZSB0aGUgc2Ft
ZSBxdWVzdGlvbiB3aGlsZSB3b3JraW5nIG9uDQo+Pj4+IHRoZSBuZWdhdGl2ZSB0ZXN0IHRvZGF5
LiBUaGUgdGltZW91dCAyMDAwIGluZGVlZCB3aWxsIGZhaWwgdGhlIGpvYiBhdCBhYm91dCAzMG1p
biwNCj4+Pj4gYW5kIHdhaXRpbmcgZm9yIGl0IGlzIGluZGVlZCBub3QgcmVhbGx5IHBsZWFzYW50
Lg0KPj4+PiANCj4+Pj4gQnV0IG15IHNlY29uZCB0aG91Z2h0IHdvdWxkIGJlIC0gZnJvbSBteSBv
YnNlcnZhdGlvbiwgdGhlIG92ZXJhbGwgdGltZSBub3cNCj4+Pj4gd291bGQgdmFyeSBiZXR3ZWVu
IDE1bWluIH4gMjBtaW4sIGFuZCBoYXZpbmcgYSAxMG1pbiBtYXJnaW4gaXMgbm90IHRoYXQgY3Jh
enkNCj4+Pj4gZ2l2ZW4gdGhhdCB3ZSBwcm9iYWJseSB3aWxsIGRvIG1vcmUgdGVzdGluZyBmcm9t
IHRoZSBqb2IgaW4gdGhlIGZ1dHVyZSwgYW5kIGlmIHRoZQ0KPj4+PiBHaXRMYWIgQXJtIHdvcmtl
ciBpcyBoaWdoIGxvYWRlZCwgRlZQIHdpbGwgcHJvYmFibHkgYmVjb21lIHNsb3dlci4gQW5kIG5v
cm1hbGx5DQo+Pj4+IHdlIGRvbuKAmXQgZXZlbiB0cmlnZ2VyIHRoZSB0aW1lb3V0IGFzIHRoZSBq
b2Igd2lsbCBub3JtYWxseSBwYXNzLiBTbyBJIGRlY2lkZWQNCj4+Pj4gdG8ga2VlcCB0aGlzLg0K
Pj4+PiANCj4+Pj4gTWluZCBzaGFyaW5nIHlvdXIgdGhvdWdodHMgYWJvdXQgdGhlIGJldHRlciB2
YWx1ZSBvZiB0aGUgdGltZW91dD8gUHJvYmFibHkgMjVtaW4/DQo+Pj4gRnJvbSB3aGF0IHlvdSBz
YWlkIHRoYXQgdGhlIGF2ZXJhZ2UgaXMgMTUtMjAsIEkgdGhpbmsgd2UgY2FuIGxlYXZlIGl0IHNl
dCB0byAzMC4NCj4+PiBCdXQgSSB3b25kZXIgaWYgd2UgY2FuIGRvIHNvbWV0aGluZyB0byBkZWNy
ZWFzZSB0aGUgYXZlcmFnZSB0aW1lLiB+MjAgbWluIGlzIGEgbG90DQo+Pj4gZXZlbiBmb3IgRlZQ
IDopIEhhdmUgeW91IHRyaWVkIHNldHRpbmcgc2VuZF9zbG93IHRvIHNvbWV0aGluZyBsb3dlciB0
aGFuIDEwMG1zPw0KPj4+IFRoYXQgc2FpZCwgd2UgZG9uJ3Qgc2VuZCB0b28gbWFueSBjaGFycyB0
byBGVlAsIHNvIEkgZG91YnQgaXQgd291bGQgcGxheSBhIG1ham9yIHJvbGUNCj4+PiBpbiB0aGUg
b3ZlcmFsbCB0aW1lLg0KPj4gDQo+PiBJIGFncmVlIHdpdGggdGhlIHNlbmRfc2xvdyBwYXJ0LiBB
Y3R1YWxseSBJIGRvIGhhdmUgdGhlIHNhbWUgY29uY2VybiwgaGVyZSBhcmUgbXkgY3VycmVudA0K
Pj4gdW5kZXJzdGFuZGluZyBhbmQgSSB0aGluayB5b3Ugd2lsbCBkZWZpbml0ZWx5IGhlbHAgd2l0
aCB5b3VyIGtub3dsZWRnZToNCj4+IElmIHlvdSBjaGVjayB0aGUgZnVsbCBsb2cgb2YgRG9tMCBi
b290aW5nLCBmb3IgZXhhbXBsZSBbMV0sIHlvdSB3aWxsIGZpbmQgdGhhdCB3ZSB3YXN0ZWQgc28N
Cj4+IG11Y2ggdGltZSBpbiBzdGFydGluZyB0aGUgc2VydmljZXMgb2YgdGhlIE9TIChtb2Rsb29w
LCB1ZGV2LXNldHRsZSwgZXRjKS4gQWxsIG9mIHRoZXNlIHNlcnZpY2VzDQo+PiBhcmUgcmV0cmll
ZCBtYW55IHRpbWVzIGJ1dCBpbiB0aGUgZW5kIHRoZXkgYXJlIHN0aWxsIG5vdCB1cCwgYW5kIGZy
b20gbXkgdW5kZXJzdGFuZGluZyB0aGV5DQo+PiB3b27igJl0IGFmZmVjdCB0aGUgYWN0dWFsIHRl
c3QoPykgSWYgd2UgY2FuIHNvbWVob3cgZ2V0IHJpZCBvZiB0aGVzZSBzZXJ2aWNlcyBmcm9tIHJv
b3RmcywgSSB0aGluaw0KPj4gd2UgY2FuIHNhdmUgYSBsb3Qgb2YgdGltZS4NCj4+IA0KPj4gQW5k
IGhvbmVzdGx5LCBJIG5vdGljZWQgdGhhdCBxZW11LWFscGluZS1hcm02NC1nY2Mgc3VmZmVycyBm
cm9tIHRoZSBzYW1lIHByb2JsZW0gYW5kIGl0IGFsc28NCj4+IHRha2VzIGFyb3VuZCAxNW1pbiB0
byBmaW5pc2guIFNvIGlmIHdlIG1hbmFnZWQgdG8gdGFpbG9yIHRoZSBzZXJ2aWNlcyBmcm9tIHRo
ZSBmaWxlc3lzdGVtLCB3ZQ0KPj4gY2FuIHNhdmUgYSBsb3Qgb2YgdGltZS4NCj4gVGhhdCBpcyBu
b3QgdHJ1ZS4gUWVtdSBydW5zIHRoZSB0ZXN0cyByZWxhdGl2ZWx5IGZhc3Qgd2l0aGluIGZldyBt
aW51dGVzLiBUaGUgcmVhc29uIHlvdSBzZWUgZS5nLiAxMiBtaW5zDQo+IGZvciBzb21lIFFlbXUg
am9icyBjb21lcyBmcm9tIHRoZSB0aW1lb3V0IHdlIHNldCBpbiBRZW11IHNjcmlwdHMuIFdlIGRv
bid0IGhhdmUgeWV0IHRoZSBzb2x1dGlvbiAod2UgY291bGQNCj4gZG8gdGhlIHNhbWUgYXMgUXVi
ZXMgc2NyaXB0KSB0byBkZXRlY3QgdGhlIHRlc3Qgc3VjY2VzcyBlYXJseSBhbmQgZXhpdCBiZWZv
cmUgdGltZW91dC4gVGhhdCBpcyB3aHkgY3VycmVudGx5DQo+IHRoZSBvbmx5IHdheSBmb3IgUWVt
dSB0ZXN0cyB0byBmaW5pc2ggaXMgYnkgcmVhY2hpbmcgdGhlIHRpbWVvdXQuDQo+IA0KPiBTbyB0
aGUgcHJvYmxlbSBpcyBub3Qgd2l0aCB0aGUgcm9vdGZzIGFuZCBzZXJ2aWNlcyAodGhlIGltcHJv
dmVtZW50IHdvdWxkIG5vdCBiZSBzaWduaWZpY2FudCkgYnV0IHdpdGgNCj4gdGhlIHNpbXVsYXRp
b24gYmVpbmcgc2xvdy4gVGhhdCBzYWlkLCB0aGlzIGlzIHNvbWV0aGluZyB3ZSBhbGwga25vdyBh
bmQgSSBleHBlY3QgRlZQIHRvIG9ubHkgYmUgdXNlZCBpbiBzY2VuYXJpb3MNCj4gd2hpY2ggY2Fu
bm90IGJlIHRlc3RlZCB1c2luZyBRZW11IG9yIHJlYWwgSFcuDQoNCk9rLCB5b3UgbWFkZSBhIHBv
aW50LiBMZXQgbWUgZG8gc29tZSBleHBlcmltZW50cyB0byBzZWUgaWYgSSBjYW4gaW1wcm92ZS4g
T3RoZXJ3aXNlIG1heWJlDQp3ZSBjYW4gbGl2ZSB3aXRoIHRoaXMgdW50aWwgYSBiZXR0ZXIgc29s
dXRpb24uDQoNCktpbmQgcmVnYXJkcywNCkhlbnJ5DQoNCj4gDQo+IH5NaWNoYWwNCg0K

