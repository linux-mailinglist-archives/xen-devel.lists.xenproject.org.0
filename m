Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B82F566F2B
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jul 2022 15:28:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.361276.590701 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8ibJ-0002LC-Ky; Tue, 05 Jul 2022 13:28:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 361276.590701; Tue, 05 Jul 2022 13:28:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8ibJ-0002Il-Hj; Tue, 05 Jul 2022 13:28:25 +0000
Received: by outflank-mailman (input) for mailman id 361276;
 Tue, 05 Jul 2022 13:28:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ii77=XK=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1o8ibH-0002FI-SH
 for xen-devel@lists.xenproject.org; Tue, 05 Jul 2022 13:28:24 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80088.outbound.protection.outlook.com [40.107.8.88])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5756e15b-fc66-11ec-bd2d-47488cf2e6aa;
 Tue, 05 Jul 2022 15:28:22 +0200 (CEST)
Received: from DU2PR04CA0320.eurprd04.prod.outlook.com (2603:10a6:10:2b5::25)
 by AM4PR08MB2753.eurprd08.prod.outlook.com (2603:10a6:205:b::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.17; Tue, 5 Jul
 2022 13:28:20 +0000
Received: from DBAEUR03FT018.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2b5:cafe::cb) by DU2PR04CA0320.outlook.office365.com
 (2603:10a6:10:2b5::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.21 via Frontend
 Transport; Tue, 5 Jul 2022 13:28:20 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT018.mail.protection.outlook.com (100.127.142.74) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5395.14 via Frontend Transport; Tue, 5 Jul 2022 13:28:19 +0000
Received: ("Tessian outbound 879f4da7a6e9:v121");
 Tue, 05 Jul 2022 13:28:19 +0000
Received: from b0ca8669104f.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 CB140AC8-CFD2-4CD3-99AF-18B2794C3B0A.1; 
 Tue, 05 Jul 2022 13:28:08 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b0ca8669104f.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 05 Jul 2022 13:28:08 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com (2603:10a6:20b:404::24)
 by AM9PR08MB6676.eurprd08.prod.outlook.com (2603:10a6:20b:2ff::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Tue, 5 Jul
 2022 13:28:05 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::5cc5:d9b5:e3b0:c8d7]) by AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::5cc5:d9b5:e3b0:c8d7%9]) with mapi id 15.20.5395.022; Tue, 5 Jul 2022
 13:28:05 +0000
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
X-Inumbo-ID: 5756e15b-fc66-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=EURIAwbY+n70QWF6BBS2+/nedY4JwqsRp8z12XK/rO82RSs3H/Oe0HZUUqS3LQ+fKNI1IgDN/V+SsLwXAvwLyqJOSBqWQmmiVA0OaVJ3OgCAi7QvS7Kwom1ByFRRbwwJh9ZtZNY8FxE0btGrNBtL5YTgbqhbRP/5l6dTo3EHVz2gY0ne9alG85z5gzl3IElc6WP9XCnhQwzk2+XvTDLyXQXfP+nJfP8QQO1VGZMKf6GU4NqGyr50iuluuQoOmT2dp2KVvkQiJt1VZweqKPGDFOHmLaAvjr/l7ZWKlenwGtBdac+FmZ44cRXUMvy1EqmibKFvycw+lAugaollL/xv+w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DuxF+E5c0NFcvjIRz9Oz5mpwJkWf85WGb601UpzGeZk=;
 b=PZVb0M1S9y388rqh+/Gj64LBVxr93DLdEiMWxfO7/YoUiQ2IO/Mimo2TT0VEv4EC+l5JBlBvw6VR6XlNGqqaXzJuipBy5K/4dugF7cjA0GYVI6HU5ekbqUucSpocOqJMluTLnU3z3SDkI8BL447Bl9tI61WrxfAacQQEtYPI+7hFOLR6BkBUutVVFXGqQNWBSbx/SwIVn5rMJyembpGNnmLxg0bWkVidh8jIE0qSmd3+BonmdxdTYkw4+ZRiNXhzIzLRS+iZVvfln5VLpPFjJ9t+ik8LuUnrXv6Ns2VmpYF6wRIbbK6yOGCe4V4H1ysXUd0xqFsK23i0j4GsLNLlSw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DuxF+E5c0NFcvjIRz9Oz5mpwJkWf85WGb601UpzGeZk=;
 b=QTlh5SdnMZb7qB6TAEmSxYP+FyL0u1spns4Stq9EjgJnuX3J19Ev8oiLDPi3eKq33LLN0TSTH/OiQBXp3A6hicRWxLGw2BxebyPu4+o4xH3UacLCvDf8mWXFNZ1/uYgIlG0OtiQ5lKFT7G9hN3S6KZmUIbcyVWtaCCjtoykPiOM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9399af79af11ef54
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GyxiEcQfW9+EXbH6v8B56sN2iEwMcMHz/mX+t2GJzcjVUmdpLC41X3eveYZB/K9fbVqa+o1tGBKpEZBYhSBIX8nCTFB5yYfF4nIt8amW6XGXzmy+/mdWeiWvfKuBTdtXb20ChGGHOkjulL6YmoazfGpJ4NkS8O//zqxTRn0Ehfkt0t30A75YRHJdGsVEPHnRtR8zezZk0KabBw1x2jjTdi+lsoFRoOLqO1tCBiBbMINJYRoRg4JEkkkUTkRuAnMnSca1FH6G3PIv4LnHo66cd0IkuIIO2RYxh63bdxSLmMErSLs65OiiHFh3nF8BQl6gnmV6oPXJo2pmXxoa/q6fHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DuxF+E5c0NFcvjIRz9Oz5mpwJkWf85WGb601UpzGeZk=;
 b=Cf0KRR12gSR3TyctxmkQaPKqLcYkYaVrmI1t3h2y6gKhjtfKf0zJsIUHTXgy7XsucqE5GBdtN/h/s0y9q0mDBjdrmhllSRoP7jIvO1q6SWPCjcXvIimZ96DZSTESxhJ9mfxNuGVd5SUYNxfa+akRqz2+luGXp51aFkWsjxGKk1IjuJUubRTaw4haHywln3USpdW+FLBg7f7aM8B4MSjxeRInni41bbvr7DH+XSEVZAqUwU7g7FrRyZL68IU8EheOQJM+MJHWt0kilSoqBET6g0guVqMgXnATWoRP34IsczaDG47HMwXI04C+SHH3Krg91xFnVxSugUCtGxqs0lddGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DuxF+E5c0NFcvjIRz9Oz5mpwJkWf85WGb601UpzGeZk=;
 b=QTlh5SdnMZb7qB6TAEmSxYP+FyL0u1spns4Stq9EjgJnuX3J19Ev8oiLDPi3eKq33LLN0TSTH/OiQBXp3A6hicRWxLGw2BxebyPu4+o4xH3UacLCvDf8mWXFNZ1/uYgIlG0OtiQ5lKFT7G9hN3S6KZmUIbcyVWtaCCjtoykPiOM=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Julien Grall <julien@xen.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, xen-devel
	<xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH 5/8] xen/evtchn: don't close the static event channel.
Thread-Topic: [PATCH 5/8] xen/evtchn: don't close the static event channel.
Thread-Index:
 AQHYhkX79rj81mJ150e3nBZ0EA7O6K1bhmuAgAGTuoCAAAWegIAHwJEAgAAJPQCAAAcgAIAAB1iAgArhiIA=
Date: Tue, 5 Jul 2022 13:28:05 +0000
Message-ID: <DCF75039-2719-4FC4-AA0A-2E5A00018823@arm.com>
References: <cover.1655903088.git.rahul.singh@arm.com>
 <91656930b5bfd49e40ff5a9d060d7643e6311f4f.1655903088.git.rahul.singh@arm.com>
 <b64a7980-e51b-417b-4929-94a020c81438@xen.org>
 <7403EAA7-67A4-4A8D-835E-6015463B9016@arm.com>
 <a5cd291d-45b1-baf4-4d0b-907140b38eab@xen.org>
 <DC011AED-F74B-4055-8DEE-6FFC6FC5215C@arm.com>
 <dbdf3bb2-edc6-e622-f17a-8819f6fcb43d@xen.org>
 <67EA3F72-5F6D-4150-A9BA-EAF92E6C9EA1@arm.com>
 <289ebc8b-96f2-8764-5b17-680734e473fe@xen.org>
In-Reply-To: <289ebc8b-96f2-8764-5b17-680734e473fe@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 6fb5bac5-853b-4a57-6e1f-08da5e8a3a1a
x-ms-traffictypediagnostic:
	AM9PR08MB6676:EE_|DBAEUR03FT018:EE_|AM4PR08MB2753:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 LA5xWoCJrmO7WBkRqa1ERZ3yzqRcxe6kG7DnvvvdtYmwOZfoOfa7ymwIl1kyWPAiz59LyozZKNtvscGZh7fwFiogjFLTbAmR/E7TqSOOeOAwD4fq+WJnLHTuk/yhvRgn7fNiallojv341MrmBs7FLD+Mo5ru51hn/ITp1tcGB2AeSSdGgKF5TEGAAOzErePfPMSmXCENfD4kZ+5Ws1zLqsQKW3wUyB7u0RMrLADUcz8KFsvQv9kyoOUvWVNaD1X64Ol62One0/KSBuohd1sL/HUJEUDBJhPD4B2oVI0MW0i/qfilNWQaMsmuDkdIxshQXGotthgFk1zvnPX9SNjO4snLdbzdc1swM7s0A5NwMuz/KiVSD5RDhAPW1RUEYw2h53ugwj4Xf5k6nsKm9MvUpyYCagMCDiZRSqnDdCZWqjrxrvGBHgBnK3U7ux7SrBVDvnMTZYJ5TRW/3XjWggorXJs9ybNjEIUgQZjL7JBoT/dybWwwA8+W7URSnvnKHO335cfnAux8NjWv5aQiz9wgELP59ejau+vPBvE42RhekXL+NDzJYR02z/ytAWS26gwhynA6spYy+4BQz9v/jGtoqufTNmf3/2q0bl18KlxbxEHr/dqZJLBv5TJzMfwX2yQB3sWTn2PZ+4eymCEWdR3T2ao6U1haekxFYX2qWlJZOiy8rg6MPprUe9Iox4s2xxGTPuuM1fvcqLKnPof9kFhs1buL6vrCNncK2DZTh0Gogmi8fNBSgNplkDnYpB/EUbuQGnBi88f8OLL6SyynDuA1gLKQ0NHinWACGmhfdSxV8+p4+GJeer4EvRv+tfN+H77baoZSYag7PBMsx8WRxw+idsLwOO64eTAdg2y7G4e6F6k=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7158.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(136003)(39860400002)(376002)(366004)(346002)(66476007)(4326008)(8676002)(66556008)(66946007)(2616005)(66446008)(64756008)(91956017)(186003)(83380400001)(33656002)(2906002)(6506007)(36756003)(76116006)(38100700002)(71200400001)(26005)(6512007)(6486002)(54906003)(478600001)(41300700001)(5660300002)(86362001)(53546011)(38070700005)(316002)(122000001)(6916009)(8936002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <3C0447144E1CBF47B27402C5BA3CB58E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6676
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9bb91f00-3301-4984-67eb-08da5e8a3170
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RxqKac5RX32/QChL4z+vehm1GhPUMgGCmX2AP/e/Zv/kpFZc0X8+Ud9ok0ykz677FZxiIPUqJTOZVhEwwIOMBU6lM7IA69yJlt7JWfjKxoAV+4dyoIANf5WYjsNIiH3SZsfL4StUG3apL0+tXmP4DeLF28xbyboVbLH2iSwi5JTvk/qwIBGNWFb92UCDMERZJnMPW81SrxuQDUxbmx4SUNE/bHJyL82Nc2h3gaLPiXKjCNB9LYVlLIkU1VUt+EFIuZcTNY+y+5Rc+JbLIS0WoZ8yyRx3aRu9VRoe29BGfVpQb9o0fDV6y6V+MTZmpxeWF7buZ3bbwE9B3THnblqoIXmR6Hquz5ge7vjM2yYeTbyLOZeqVV2oVtLYK7z1ZPxfqlm8dbw84KzXkQUIBEOCzwIGWG5x0R/bzgP6S+Fb4n8ldFCpwDwo4NuE7TLWIHzvMsEt/AiJkb+JwFUsIFAct1tpvHJ9X4QJ7CGGD+z64fRLKD6Ro74od62r/VPlJiiOe2amP+zH3bLzpF4mXChPx1fth2FQTgaW6JMmmSQV65sJk8yYiCVeODS4eeR6KxNBLgOYaPNDzVPAoXIkj7sYXwrF/yrILp/TBzOPySSk3ZxlyRmiJynVpIE3SMZE40c/ROk77W9AlrSsGDCKixGmgZr3BR6zfyQotxKLNZ196zEJi4q3UEzqHrLNiN55PTA1+mK+ArqRPNSsmLL9XMS7kPh3oFs78p1RZLwEEse6ckwXHGpoc+E0Ex1JN606D6QqBpGm1VHlXqr3oZUKDzcw0qCroRG4rXba0Lc5+y4VoVrUyf7c9BT3ZjfJlZJUxq0V
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(396003)(346002)(136003)(376002)(40470700004)(36840700001)(46966006)(33656002)(40460700003)(36860700001)(86362001)(82740400003)(356005)(82310400005)(8936002)(81166007)(6486002)(41300700001)(2906002)(6862004)(5660300002)(316002)(54906003)(478600001)(70206006)(70586007)(47076005)(336012)(40480700001)(186003)(83380400001)(6506007)(26005)(6512007)(2616005)(36756003)(8676002)(4326008)(53546011);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2022 13:28:19.9498
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fb5bac5-853b-4a57-6e1f-08da5e8a3a1a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR08MB2753

SGkgSnVsaWVuLA0KDQoNCj4gT24gMjggSnVuIDIwMjIsIGF0IDQ6MTggcG0sIEp1bGllbiBHcmFs
bCA8anVsaWVuQHhlbi5vcmc+IHdyb3RlOg0KPiANCj4gDQo+IA0KPiBPbiAyOC8wNi8yMDIyIDE1
OjUyLCBCZXJ0cmFuZCBNYXJxdWlzIHdyb3RlOg0KPj4gSGkgSnVsaWVuLA0KPj4+IE9uIDI4IEp1
biAyMDIyLCBhdCAxNToyNiwgSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4gd3JvdGU6DQo+
Pj4gDQo+Pj4gDQo+Pj4gDQo+Pj4gT24gMjgvMDYvMjAyMiAxNDo1MywgUmFodWwgU2luZ2ggd3Jv
dGU6DQo+Pj4+IEhpIEp1bGllbg0KPj4+IA0KPj4+IEhpIFJhaHVsLA0KPj4+IA0KPj4+Pj4gT24g
MjMgSnVuIDIwMjIsIGF0IDQ6MzAgcG0sIEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+IHdy
b3RlOg0KPj4+Pj4gDQo+Pj4+PiANCj4+Pj4+IA0KPj4+Pj4gT24gMjMvMDYvMjAyMiAxNjoxMCwg
UmFodWwgU2luZ2ggd3JvdGU6DQo+Pj4+Pj4gSGkgSnVsaWVuLA0KPj4+Pj4+PiBPbiAyMiBKdW4g
MjAyMiwgYXQgNDowNSBwbSwgSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4gd3JvdGU6DQo+
Pj4+Pj4+IA0KPj4+Pj4+PiBIaSwNCj4+Pj4+Pj4gDQo+Pj4+Pj4+IE9uIDIyLzA2LzIwMjIgMTU6
MzgsIFJhaHVsIFNpbmdoIHdyb3RlOg0KPj4+Pj4+Pj4gR3Vlc3QgY2FuIHJlcXVlc3QgdGhlIFhl
biB0byBjbG9zZSB0aGUgZXZlbnQgY2hhbm5lbHMuIElnbm9yZSB0aGUNCj4+Pj4+Pj4+IHJlcXVl
c3QgZnJvbSBndWVzdCB0byBjbG9zZSB0aGUgc3RhdGljIGNoYW5uZWxzIGFzIHN0YXRpYyBldmVu
dCBjaGFubmVscw0KPj4+Pj4+Pj4gc2hvdWxkIG5vdCBiZSBjbG9zZWQuDQo+Pj4+Pj4+IA0KPj4+
Pj4+PiBXaHkgZG8geW91IHdhbnQgdG8gcHJldmVudCB0aGUgZ3Vlc3QgdG8gY2xvc2Ugc3RhdGlj
IHBvcnRzPyBUaGUgcHJvYmxlbSBJIGNhbiBzZWUgaXMuLi4NCj4+Pj4+PiBBcyBhIHN0YXRpYyBl
dmVudCBjaGFubmVsIHNob3VsZCBiZSBhdmFpbGFibGUgZHVyaW5nIHRoZSBsaWZldGltZSBvZiB0
aGUgZ3Vlc3Qgd2Ugd2FudCB0byBwcmV2ZW50DQo+Pj4+Pj4gdGhlIGd1ZXN0IHRvIGNsb3NlIHRo
ZSBzdGF0aWMgcG9ydHMuDQo+Pj4+PiBJIGRvbid0IHRoaW5rIGl0IGlzIFhlbiBqb2IgdG8gcHJl
dmVudCBhIGd1ZXN0IHRvIGNsb3NlIGEgc3RhdGljIHBvcnQuIElmIHRoZSBndWVzdCBkZWNpZGUg
dG8gZG8gaXQsIHRoZW4gaXQgd2lsbCBqdXN0IGJyZWFrIGl0c2VsZiBhbmQgbm90IFhlbi4NCj4+
Pj4gSXQgaXMgb2theSBmb3IgdGhlIGd1ZXN0IHRvIGNsb3NlIGEgcG9ydCwgcG9ydCBpcyBub3Qg
YWxsb2NhdGVkIGJ5IHRoZSBndWVzdCBpbiBjYXNlIG9mIGEgc3RhdGljIGV2ZW50IGNoYW5uZWwu
DQo+Pj4gQXMgSSB3cm90ZSBiZWZvcmUsIHRoZSBPUyB3aWxsIG5lZWQgdG8ga25vdyB0aGF0IHRo
ZSBwb3J0IGlzIHN0YXRpY2FsbHkgYWxsb2NhdGVkIHdoZW4gaW5pdGlhbGl6aW5nIHRoZSBwb3J0
ICh3ZSBkb24ndCB3YW50IHRvIGNhbGwgdGhlIGh5cGVyY2FsbCB0byBiaW5kIHRoZSBldmVudCBj
aGFubmVsKS4gQnkgZXh0ZW5kLCB0aGUgT1Mgc2hvdWxkIGJlIGFibGUgdG8ga25vdyB0aGF0IHdo
ZW4gY2xvc2luZyBpdCBhbmQgc2tpcCB0aGUgaHlwZXJjYWxsLg0KPj4+IA0KPj4+PiBYZW4gaGFz
IG5vdGhpbmcgdG8gZG8gZm9yIGNsb3NlIHRoZSBzdGF0aWMgZXZlbnQgY2hhbm5lbCBhbmQganVz
dCByZXR1cm4gMC4NCj4+PiANCj4+PiBYZW4gd291bGQgbm90IG5lZWQgdG8gYmUgbW9kaWZpZWQg
aWYgdGhlIE9TIHdhcyBkb2luZyB0aGUgcmlnaHQgKGkuZS4gbm8gY2FsbGluZyBjbG9zZSkuDQo+
Pj4gDQo+Pj4gU28gaXQgaXMgc3RpbGwgdW5jbGVhciB3aHkgcGFwZXJpbmcgb3ZlciB0aGUgaXNz
dWUgaW4gWGVuIGlzIHRoZSBiZXN0IHNvbHV0aW9uLg0KPj4gSXQgaXMgbm90IHRoYXQgYSBzdGF0
aWMgZXZlbnQgY2hhbm5lbCBjYW5ub3QgYmUgY2xvc2VkLCBpdCBpcyBqdXN0IHRoYXQgZHVyaW5n
IGEgY2xvc2UgdGhlcmUgaXMgbm90aGluZyB0byBkbyBmb3IgWGVuIGFzIHRoZSBldmVudCBjaGFu
bmVsIGlzIHN0YXRpYyBhbmQgaGVuY2UgaXMgbmV2ZXIgcmVtb3ZlZCBzbyBub25lIG9mIHRoZSBv
cGVyYXRpb25zIHRvIGJlIGRvbmUgZm9yIGEgbm9uIHN0YXRpYyBvbmUgYXJlIG5lZWRlZCAobWF5
YmUgc29tZSBkYXkgc29tZSB3aWxsIGJlLCB3aG8ga25vd3MpLg0KPiANCj4gSSBmZWVsIHRoZXJl
IGFyZSBzb21lIGRpc2FncmVlbWVudCBvbiB0aGUgbWVhbmluZyBvZiAiY2xvc2UiIGhlcmUuIElu
IHRoZSBjb250ZXh0IG9mIGV2ZW50IGNoYW5uZWwsICJjbG9zZSIgbWVhbnMgdGhhdCB0aGUgcG9y
dCBpcyBtYXJrZWQgYXMgRUNTX0ZSRUUuDQo+IA0KPiBTbyBJIHRoaW5rIHRoaXMgaXMgd3Jvbmcg
dG8gc2F5IHRoYXQgdGhlcmUgaXMgbm90aGluZyB0byBkbyBmb3IgImNsb3NlIiBiZWNhdXNlIGFm
dGVyIHRoaXMgb3BlcmF0aW9uIHRoZSBwb3J0IHdpbGwgc3RpbGwgYmUgIm9wZW4iICh0aGUgcG9y
dCBzdGF0ZSB3aWxsIGJlIEVDU19JTlRFUkRPTUFJTikuDQo+IA0KPiBJbiBmYWN0LCB0byBtZSwg
YSAic3RhdGljIiBwb3J0IGlzIHRoZSBzYW1lIGFzIGlmIHRoZSBldmVudCBjaGFubmVsIHdhcyBh
bGxvY2F0ZWQgZnJvbSB0aGUgdG9vbHN0YWNrIChmb3IgaW5zdGFuY2UgdGhpcyBpcyB0aGUgY2Fz
ZSBmb3IgWGVuc3RvcmVkKS4gSW4gc3VjaCBjYXNlLCB3ZSBhcmUgc3RpbGwgYWxsb3dpbmcgdGhl
IGd1ZXN0IHRvIGNsb3NlIHRoZSBwb3J0IGFuZCB0aGVuIHJlLW9wZW5pbmcuIFNvIEkgZG9uJ3Qg
cmVhbGx5IHNlZSB3aHkgd2Ugc2hvdWxkIGRpdmVyZ2UgaGVyZS4NCj4gDQo+PiBXaHkgcmVxdWly
aW5nIHRoZSBPUyB0byBoYXZlIHRoZSBrbm93bGVkZ2Ugb2YgdGhlIGZhY3QgdGhhdCBhbiBldmVu
dCBjaGFubmVsIGlzIHN0YXRpYyBvciBub3QgYW5kIGludHJvZHVjZSBzb21lIGNvbXBsZXhpdHkg
b24gZ3Vlc3QgY29kZSBpZiB3ZSBjYW4gcHJldmVudCBpdCA/DQo+IA0KPiBJIGFtIGNvbmZ1c2Vk
LiBZb3VyIE9TIGFscmVhZHkgbmVlZCB0byBrbm93IHRoYXQgdGhpcyBpcyBhIHN0YXRpYyBwb3J0
IChzbyBpdCBkb2Vzbid0IGNhbGwgdGhlIGh5cGVyY2FsbCB0byAib3BlbiIgdGhlIHBvcnQpLiBT
byB3aHkgaXMgaXQgYSBub24taXNzdWUgZm9yICJvcGVuaW5nIiBidXQgb25lIGZvciAiY2xvc2lu
ZyIgPw0KPiANCj4+IERvaW5nIHNvIHdvdWxkIG5lZWQgdG8gaGF2ZSBhIHNwZWNpZmljIGJpbmRp
bmcgaW4gZGV2aWNlIHRyZWUgKG5vdCB0byBtZW50aW9uIHRoZSBpc3N1ZSBvbiBBQ1BJKSwgDQo+
IA0KPiBZb3UgYWxyZWFkeSBuZWVkIHRvIGNyZWF0ZSBhIERldmljZS1UcmVlIGJpbmRpbmcgdG8g
ZXhwb3NlIHRoZSBzdGF0aWMgZXZlbnQtY2hhbm5lbC4gU28gd2h5IGlzIHRoaXMgYSBuZXcgcHJv
YmxlbT8NCj4gDQo+IExpa2V3aXNlIGZvciBBQ1BJLCB5b3UgYWxyZWFkeSBoYXZlIHRoaXMgaXNz
dWUgd2l0aCB5b3VyIGN1cnJlbnQgcHJvcG9zYWwuDQo+IA0KPj4gYSBuZXcgZHJpdmVyIGluIGxp
bnV4IGtlcm5lbCwgZXRjIHdoZXJlIHJpZ2h0IG5vdyB3ZSBqdXN0IG5lZWQgdG8gaW50cm9kdWNl
IGFuIGV4dHJhIElPQ1RMIGluIGxpbnV4IHRvIHN1cHBvcnQgdGhpcyBmZWF0dXJlLg0KPiANCj4g
SSBkb24ndCB1bmRlcnN0YW5kIHdoeSB3b3VsZCBuZWVkIGEgbmV3IGRyaXZlciwgZXRjLiBHaXZl
biB0aGF0IHlvdSBhcmUgaW50cm9kdWNpbmcgYSBuZXcgSU9DVEwgeW91IGNvdWxkIHBhc3MgYSBm
bGFnIHRvIHNheSAiVGhpcyBpcyBhIHN0YXRpYyBldmVudCBjaGFubmVsIHNvIGRvbid0IGNsb3Nl
IGl0Ii4NCg0KSSB0cmllZCB0byBpbXBsZW1lbnQgb3RoZXIgc29sdXRpb25zIHRvIHRoaXMgaXNz
dWUuIFdlIGNhbiBpbnRyb2R1Y2UgYSBuZXcgZXZlbnQgY2hhbm5lbCBzdGF0ZSDigJxFQ1NfU1RB
VElD4oCdIGFuZCBzZXQgdGhlDQpldmVudCBjaGFubmVsIHN0YXRlIHRvIEVDU19TVEFUSUMgd2hl
biBYZW4gYWxsb2NhdGUgYW5kIGNyZWF0ZSB0aGUgc3RhdGljIGV2ZW50IGNoYW5uZWxzLg0KDQpG
cm9tIGd1ZXN0IE9TIHdlIGNhbiBjaGVjayBpZiB0aGUgZXZlbnQgY2hhbm5lbCBpcyBzdGF0aWMg
KHZpYSBFVlRDSE5PUF9zdGF0dXMoKSAgaHlwZXJjYWxsICksIGlmIHRoZSBldmVudCBjaGFubmVs
IGlzDQpzdGF0aWMgZG9u4oCZdCB0cnkgdG8gY2xvc2UgdGhlIGV2ZW50IGNoYW5uZWwuIElmIGd1
ZXN0IE9TIHRyeSB0byBjbG9zZSB0aGUgc3RhdGljIGV2ZW50IGNoYW5uZWwgWGVuIHdpbGwgcmV0
dXJuIGVycm9yIGFzIHN0YXRpYyBldmVudCBjaGFubmVsIGNhbuKAmXQgYmUgY2xvc2VkLg0KDQpk
aWZmIC0tZ2l0IGEvZHJpdmVycy94ZW4vZXZlbnRzL2V2ZW50c19iYXNlLmMgYi9kcml2ZXJzL3hl
bi9ldmVudHMvZXZlbnRzX2Jhc2UuYw0KaW5kZXggNDZkOTI5NWQ5YTZlLi5jNWNhMjliOGVkNzAg
MTAwNjQ0DQotLS0gYS9kcml2ZXJzL3hlbi9ldmVudHMvZXZlbnRzX2Jhc2UuYw0KKysrIGIvZHJp
dmVycy94ZW4vZXZlbnRzL2V2ZW50c19iYXNlLmMNCkBAIC04MTUsOCArODE1LDE3IEBAIHN0YXRp
YyB2b2lkIHhlbl9mcmVlX2lycSh1bnNpZ25lZCBpcnEpDQogDQogc3RhdGljIHZvaWQgeGVuX2V2
dGNobl9jbG9zZShldnRjaG5fcG9ydF90IHBvcnQpDQogew0KKyAgICAgICBzdHJ1Y3QgZXZ0Y2hu
X3N0YXR1cyBzdGF0dXM7DQogICAgICAgIHN0cnVjdCBldnRjaG5fY2xvc2UgY2xvc2U7DQogDQor
ICAgICAgIHN0YXR1cy5kb20gPSBET01JRF9TRUxGOw0KKyAgICAgICBzdGF0dXMucG9ydCA9IHBv
cnQ7DQorICAgICAgIGlmIChIWVBFUlZJU09SX2V2ZW50X2NoYW5uZWxfb3AoRVZUQ0hOT1Bfc3Rh
dHVzLCAmc3RhdHVzKSAhPSAwKQ0KKyAgICAgICAgICAgICAgIEJVRygpOw0KKw0KKyAgICAgICBp
ZiAoc3RhdHVzLnN0YXR1cyA9PSBFVlRDSE5TVEFUX3N0YXRpYykNCisgICAgICAgICAgICAgICBy
ZXR1cm47DQorDQogICAgICAgIGNsb3NlLnBvcnQgPSBwb3J0Ow0KICAgICAgICBpZiAoSFlQRVJW
SVNPUl9ldmVudF9jaGFubmVsX29wKEVWVENITk9QX2Nsb3NlLCAmY2xvc2UpICE9IDApDQogICAg
ICAgICAgICAgICAgQlVHKCk7DQoNCg0KUmVnYXJkcywNClJhaHVsDQo+IA0KPiBDaGVlcnMsDQo+
IA0KPiAtLSANCj4gSnVsaWVuIEdyYWxsDQoNCg==

