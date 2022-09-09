Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E9D5B33D5
	for <lists+xen-devel@lfdr.de>; Fri,  9 Sep 2022 11:28:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.404009.646310 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWaJJ-0001wg-0I; Fri, 09 Sep 2022 09:28:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 404009.646310; Fri, 09 Sep 2022 09:28:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWaJI-0001u4-TB; Fri, 09 Sep 2022 09:28:28 +0000
Received: by outflank-mailman (input) for mailman id 404009;
 Fri, 09 Sep 2022 09:28:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xTTi=ZM=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oWaJH-0001ts-Rv
 for xen-devel@lists.xenproject.org; Fri, 09 Sep 2022 09:28:27 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140083.outbound.protection.outlook.com [40.107.14.83])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b8fb0caa-3021-11ed-9760-273f2230c3a0;
 Fri, 09 Sep 2022 11:28:11 +0200 (CEST)
Received: from DU2PR04CA0155.eurprd04.prod.outlook.com (2603:10a6:10:2b0::10)
 by DB4PR08MB8005.eurprd08.prod.outlook.com (2603:10a6:10:38f::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Fri, 9 Sep
 2022 09:28:09 +0000
Received: from DBAEUR03FT037.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2b0:cafe::6c) by DU2PR04CA0155.outlook.office365.com
 (2603:10a6:10:2b0::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.19 via Frontend
 Transport; Fri, 9 Sep 2022 09:28:09 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT037.mail.protection.outlook.com (100.127.142.208) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5612.13 via Frontend Transport; Fri, 9 Sep 2022 09:28:09 +0000
Received: ("Tessian outbound fa99bf31ee7d:v123");
 Fri, 09 Sep 2022 09:28:09 +0000
Received: from 0dfc23488b41.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9F22DE25-0FD1-4207-9B84-0357D602DE02.1; 
 Fri, 09 Sep 2022 09:28:02 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0dfc23488b41.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 09 Sep 2022 09:28:02 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by PAXPR08MB7526.eurprd08.prod.outlook.com (2603:10a6:102:24c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.12; Fri, 9 Sep
 2022 09:28:01 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1415:7141:512f:e787]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1415:7141:512f:e787%3]) with mapi id 15.20.5588.011; Fri, 9 Sep 2022
 09:28:00 +0000
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
X-Inumbo-ID: b8fb0caa-3021-11ed-9760-273f2230c3a0
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=CVfytnJrAEioKb5EnuSIeY2NnLZZErXf7cqMlEFGXVDTzp8hAIja/JOvt2vTgbTGV+jWp6Ousc7pZoviu42427oConD6vQOnTd72tKOpE60JnnFIuLceXi2zz6fkZSY6MVeKgHTWnxI8L464egECTz1UhVJwN39f2NmELMg5kJMQokI3U6vIL0CxveXCqj6qDFv0XgPC7XGqmZCgxDtaFk0C96Oz1v1rSUl3QtKwrZMR0SKch+4Tp0Ll3b8EETBVdZgmvVhcGeV1MRzWEO+gIV0pLnZ+IflHx10ZWzQ4NdQANV1Msm9VAKnXl/DWVQG5OoTMPopHsGGZyxMfnKd8RA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kgJSWlLo9EZdbb+rCibH02vHb+lE9i8BFvajnfVAn/Q=;
 b=cRk11qnxFoM5sV461PAXPFhHzJao4tZwYuoamizV1fPkdz3WLDvhdLoB1n/5z0yIHSiyI2jeRbUO644lQMpOOWwhLrJl5jSLjKMGUhhxYy0UEgOJa6Dmf/EhnUynU5AsgwPx/GLvlAjQ267525Wht2jraUHIIUyj68KO5iMOoh+TS5fRtNCbxxa+OmT+ufgvHBASZJZCdgR6Me6lzVxAm+MqYSs08Si/mPD4uUNanK50qG2yLjW6ThtJrAZRSxEGCHe68LONjgPcd9qBJg38KbeXB4rEA03hDi21EzeX35+JpsaLCiwnUULNy3fAe1wSTDDl7YjXLhj3NcTfFhGOAQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kgJSWlLo9EZdbb+rCibH02vHb+lE9i8BFvajnfVAn/Q=;
 b=Mf76/a/kpsbbguFposPWc1eTRhQ9mLYYQFz6jvDe3LO23RdyQyEcNXPG/FqNkKfjBE8bVdjeWGcPMW4qTvDgfPhPSDHb6NUx/DFk3emBZ5qO26B5AVaMQI/ad2aPXVZvp2IZSjL9KsC3g//zS7tHIzYyLDdt0LRtKhoHPuOQQyg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ba46xi9opBDiaHLG1aDN6Q7TbudErrucuIHmFRDq7n4G16sOsDcKeZywVZJZxHX+NywCleK8TTc2QLe/fHe9IP9tUu+ArhRZL91/EPE6Eau+yPztplXUFzOBsHqCS8mNboiTaST9XNyNOonqB/qVSmYaSLDPBDySQdljj8t4y6QNegOcPSMQKxqzLumK8f1oxGempXIl6wEaMrpsmq4198pFpUbmoflvOaKWln143isI62F7ljXyq+wPb7BblfL/EIvtjTYQ2onIoGJ7ZPNVy4UHIjhPY52nTCbzcXHegn7Xynd32neEl6J6ga12mzpSuYK5aUIyo4vhR4hAwaTUdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kgJSWlLo9EZdbb+rCibH02vHb+lE9i8BFvajnfVAn/Q=;
 b=oD5um1sSyBnTpZKv08UXMxFpImjFRVAo/aSWU9xGSiROnmN3dEb2fH3WD0361EcfHTI/E85+RMfpt+jkMEUmR2iWFGO7tHmOU2b429RkG0tqWIJoCYj05U15BdfZvVMZ0og84ckT3yqJbl3q3oQxkt6EOyqZ79uJCm6HZmMKO8V6DBGioxuzNxE5Ngyuqy1c/iaJee7dudreU/r0js9oXDT0PNxJkKvYxFoHu4pTkLhJlLoePw0EiAIcFVnE1Q56xFlCYHh1jjhqD9R9tzVi+ZF7tQr4v/MYRrmVxTcOR9528V8L1jiO6Grlr/YY8Nnb6iN1AbcvzRPdn/OB1W1xew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kgJSWlLo9EZdbb+rCibH02vHb+lE9i8BFvajnfVAn/Q=;
 b=Mf76/a/kpsbbguFposPWc1eTRhQ9mLYYQFz6jvDe3LO23RdyQyEcNXPG/FqNkKfjBE8bVdjeWGcPMW4qTvDgfPhPSDHb6NUx/DFk3emBZ5qO26B5AVaMQI/ad2aPXVZvp2IZSjL9KsC3g//zS7tHIzYyLDdt0LRtKhoHPuOQQyg=
From: Henry Wang <Henry.Wang@arm.com>
To: Juergen Gross <jgross@suse.com>, Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH] xen/gnttab: fix gnttab_acquire_resource()
Thread-Topic: [PATCH] xen/gnttab: fix gnttab_acquire_resource()
Thread-Index: AQHYxCOLeMow4nnAdEmRQz42iuSBI63W0QoAgAADAYCAAABeMA==
Date: Fri, 9 Sep 2022 09:28:00 +0000
Message-ID:
 <AS8PR08MB7991390DCD341CF688FDB0E892439@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20220909080944.28559-1-jgross@suse.com>
 <52ff1228-3092-c455-479d-315a16cfaaa6@suse.com>
 <77d2c3fa-7cee-6f86-215a-a95ce242a990@suse.com>
In-Reply-To: <77d2c3fa-7cee-6f86-215a-a95ce242a990@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: E4BF98529A7ACA4897C74FAFEF9750FD.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 89323922-c477-4ea9-1612-08da92459bc9
x-ms-traffictypediagnostic:
	PAXPR08MB7526:EE_|DBAEUR03FT037:EE_|DB4PR08MB8005:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 h9+GMzz03EGnn3eibphGt1HiTdnFeW1SuAHobXseN013UqFtkP0hZHOLinCSBZyAfWsKqwUo/zlaARMBmWwtQD4Q6Q4OszkMVxqpNEdN1aN4Ax4CId6SfDK7CQGo/NaINfoMzphwvc3UY6N9rVd7YleR/t+7UYP1IaE6rruxoLJ3IRUijROFno/dA6Z2xdiMtuYGw74PLOjaUDHrADV4xK5iVD1L48GfDG7qmuoyBdEJy5NfDzCnrzXGRDIn5Kaj3H2CrR2GCdday5b/f+woU9pIYa0tfIiKC0NPtGfd2RVGcju5BxREsYp685tShYM2dXGhDMsUk51rCuvxK5xJTdlFoi4vVWVAbHhuLq4sTVd/aW0kiXICEXNDDmUxkoRcR3KJWQsjfTLDvnUWgroRkwU/Mq17XqTfdqbFl5EeRpFc5DKB5GdKel3jG/55nVQL0HmcaB/EK6miBwVwPYQA9SrR5nOaWWdKVeVP5M4HBwK9Winnm7sINabi4F/gMKDscp3i72+KV6r1BAa3uz4tLBskpPh+NvwCOa3P3xw1o2CAghy93fH7ZbwzvTpw8kFVW9UPiJXFzXAWxEcffu8p9QA+P5wWuS0ArwwdmDdG8+vzSNUkGrIs9fTDpN2V/siNedAzMxnbU0SM/Qom8MshPf0YhU6BIV+UfJZQq+EPlIKwkl3IA9eKElb49MuVoB+L0cfxSEIJSlgfjtJFxorect5S0GodtWtSd70vNDABkIB8sPO3hAUomkvNpjLnAp/mIdm4nHSp1Agu4sstDScKlg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(396003)(376002)(366004)(39860400002)(346002)(38070700005)(26005)(41300700001)(66556008)(64756008)(66946007)(122000001)(38100700002)(8676002)(54906003)(4326008)(66446008)(66476007)(316002)(55016003)(2906002)(110136005)(186003)(52536014)(83380400001)(71200400001)(76116006)(53546011)(478600001)(7696005)(8936002)(6506007)(33656002)(9686003)(5660300002)(86362001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7526
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	856551c3-5351-410a-31f9-08da924596d8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FpW30zERNe1dmy58PT//DJD+QEz8EiCX6dLx1l0WCpNNZdXJ0TtpNXzIfjEduRUTIBzFh6Qo2+m/wVam7d357seCruJBIWH+4laAZY1qWyjtRapOg4c8womH+Vc2LZaPSkyFpO3hLdRm5qqb9nKHch8kkwHNSkgleiKb9qP6PVgjCtjJCfklCuuAtd4/WAiSNstLQ1+HlK6WjVItsBtpIwiUbjyWT2DVOrtKav5CLxOiv0VXz9eUkQKwr/SnxOXIdfvpW3BYucS0IKMg7xR5bxN1jEntzOboSxEdmH1PwmBcc3bTDItEma5rg/2gmpoPyObJzmetfSeP1JtgpLGqxjFDJVaIF0CS0qZX/2kVBhuDgD3uXun72nssfya9c24HM1wuHaL/o5qAe69ZfsewQ4b92x/fIo7xktykMCqB5ldlhI1A3JqFtSrUOq7whwCmU4HZuDXen6llxULsrDEEIokzFuXfYwwpuPLxAQIWoSsucod9Je8KAZw/Mua6z43r3npq+JhDzHK0lKK+JdedNY+BbSinY9AOgWb8yS+5JGUcGMuPr3J0qh+FF+xdidhRIDn6SV9o9vprn5Bc3fkcy8Nbofu0ISn9sstRuLBk1FJeUYxs1LqKjSohWPgXfbwOTypqJ251ytK06nrYJhKv/3a4Z63c5RnOYkt5l+R+DrdYYDdTz6zDb6EK1zLrlQOpykEypTzzM/Mz0BCJeNlpFVOGOx5qdQnThBhS37AG9JSc1J/ZhJhJ1Q2kLnyWyPjprbPVSmYITOb6ll9ag4Whaw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(346002)(396003)(376002)(136003)(39860400002)(46966006)(40470700004)(36840700001)(70206006)(54906003)(70586007)(110136005)(83380400001)(53546011)(9686003)(26005)(7696005)(478600001)(316002)(82310400005)(40480700001)(86362001)(33656002)(47076005)(55016003)(8676002)(186003)(336012)(4326008)(6506007)(356005)(5660300002)(2906002)(52536014)(81166007)(8936002)(82740400003)(41300700001)(36860700001)(40460700003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2022 09:28:09.0392
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 89323922-c477-4ea9-1612-08da92459bc9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB8005

DQoNCktpbmQgcmVnYXJkcywNCkhlbnJ5DQoNCg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0t
LS0tDQo+IEZyb206IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4NCj4gU2VudDogRnJp
ZGF5LCBTZXB0ZW1iZXIgOSwgMjAyMiA1OjI2IFBNDQo+IFRvOiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+DQo+IENjOiBIZW5yeSBXYW5nIDxIZW5yeS5XYW5nQGFybS5jb20+OyBBbmRy
ZXcgQ29vcGVyDQo+IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPjsgR2VvcmdlIER1bmxhcCA8
Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPjsNCj4gSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9y
Zz47IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47DQo+IFdlaSBM
aXUgPHdsQHhlbi5vcmc+OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCj4gU3ViamVj
dDogUmU6IFtQQVRDSF0geGVuL2dudHRhYjogZml4IGdudHRhYl9hY3F1aXJlX3Jlc291cmNlKCkN
Cj4gDQo+IE9uIDA5LjA5LjIyIDExOjE1LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gPiBPbiAwOS4w
OS4yMDIyIDEwOjA5LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPiA+PiBDb21taXQgOWRjNDYzODZk
ODlkICgiZ250dGFiOiB3b3JrIGFyb3VuZCAibWF5IGJlIHVzZWQgdW5pbml0aWFsaXplZCINCj4g
Pj4gd2FybmluZyIpIHdhcyB3cm9uZywgYXMgdmFkZHIgY2FuIGxlZ2l0aW1hdGVseSBiZSBOVUxM
IGluIGNhc2UNCj4gPj4gWEVOTUVNX3Jlc291cmNlX2dyYW50X3RhYmxlX2lkX3N0YXR1cyB3YXMg
c3BlY2lmaWVkIGZvciBhIGdyYW50IHRhYmxlDQo+ID4+IHYxLiBUaGlzIHdvdWxkIHJlc3VsdCBp
biBjcmFzaGVzIGluIGRlYnVnIGJ1aWxkcyBkdWUgdG8NCj4gPj4gQVNTRVJUX1VOUkVBQ0hBQkxF
KCkgdHJpZ2dlcmluZy4NCj4gPj4NCj4gPj4gQmFzaWNhbGx5IHJldmVydCBzYWlkIGNvbW1pdCwg
YnV0IGtlZXAgcmV0dXJuaW5nIC1FTk9EQVRBIGluIHRoYXQgY2FzZS4NCj4gPj4NCj4gPj4gRml4
ZXM6IDlkYzQ2Mzg2ZDg5ZCAoImdudHRhYjogd29yayBhcm91bmQgIm1heSBiZSB1c2VkIHVuaW5p
dGlhbGl6ZWQiDQo+IHdhcm5pbmciKQ0KPiA+PiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3Nz
IDxqZ3Jvc3NAc3VzZS5jb20+DQo+ID4+IC0tLQ0KPiA+PiBNaWdodCBiZSBjb25zaWRlcmVkIGZv
ciA0LjE3IGFuZCBmb3IgYmFja3BvcnRpbmcNCj4gPj4gLS0tDQo+ID4+ICAgeGVuL2NvbW1vbi9n
cmFudF90YWJsZS5jIHwgMTQgKysrLS0tLS0tLS0tLS0NCj4gPj4gICAxIGZpbGUgY2hhbmdlZCwg
MyBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSkNCj4gPj4NCj4gPj4gZGlmZiAtLWdpdCBh
L3hlbi9jb21tb24vZ3JhbnRfdGFibGUuYyBiL3hlbi9jb21tb24vZ3JhbnRfdGFibGUuYw0KPiA+
PiBpbmRleCBhZDc3M2E2OTk2Li42OGU3ZjFkZjM4IDEwMDY0NA0KPiA+PiAtLS0gYS94ZW4vY29t
bW9uL2dyYW50X3RhYmxlLmMNCj4gPj4gKysrIGIveGVuL2NvbW1vbi9ncmFudF90YWJsZS5jDQo+
ID4+IEBAIC00MTI1LDcgKzQxMjUsMTAgQEAgaW50IGdudHRhYl9hY3F1aXJlX3Jlc291cmNlKA0K
PiA+Pg0KPiA+PiAgICAgICBjYXNlIFhFTk1FTV9yZXNvdXJjZV9ncmFudF90YWJsZV9pZF9zdGF0
dXM6DQo+ID4+ICAgICAgICAgICBpZiAoIGd0LT5ndF92ZXJzaW9uICE9IDIgKQ0KPiA+PiArICAg
ICAgICB7DQo+ID4+ICsgICAgICAgICAgICByYyA9IC1FTk9EQVRBOw0KPiA+PiAgICAgICAgICAg
ICAgIGJyZWFrOw0KPiA+PiArICAgICAgICB9DQo+ID4NCj4gPiBUaGlzIHBhdGggaXMgc3VwcG9z
ZWQgdG8gcHJvZHVjZSAtRUlOVkFMLg0KPiANCj4gT2theS4NCj4gDQo+ID4NCj4gPj4gQEAgLTQx
MzUsMTcgKzQxMzgsNiBAQCBpbnQgZ250dGFiX2FjcXVpcmVfcmVzb3VyY2UoDQo+ID4+ICAgICAg
ICAgICBicmVhazsNCj4gPj4gICAgICAgfQ0KPiA+Pg0KPiA+PiAtICAgIC8qDQo+ID4+IC0gICAg
ICogU29tZSBvbGRlciB0b29sY2hhaW5zIGNhbid0IHNwb3QgdGhhdCB2YWRkcnMgd29uJ3QgcmVt
YWluDQo+IHVuaW5pdGlhbGl6ZWQNCj4gPj4gLSAgICAgKiBvbiBub24tZXJyb3IgcGF0aHMsIGFu
ZCBoZW5jZSBpdCBuZWVkcyBzZXR0aW5nIHRvIE5VTEwgYXQgdGhlIHRvcCBvZg0KPiB0aGUNCj4g
Pj4gLSAgICAgKiBmdW5jdGlvbi4gIExlYXZlIHNvbWUgcnVudGltZSBzYWZldHkuDQo+ID4+IC0g
ICAgICovDQo+ID4+IC0gICAgaWYgKCAhdmFkZHJzICkNCj4gPg0KPiA+IEkgZ3Vlc3MgdGhpcyB3
YW50cyBhbWVuZGluZyBieSAiJiYgIXJjIj8NCj4gDQo+IEkgY2FuIGRvIHRoYXQsIGlmIHlvdSBs
aWtlIHRoYXQgYmV0dGVyLg0KPiANCj4gDQo+IEp1ZXJnZW4NCg==

