Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4EBC7DF779
	for <lists+xen-devel@lfdr.de>; Thu,  2 Nov 2023 17:15:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626934.977669 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyaKe-0003H1-Lp; Thu, 02 Nov 2023 16:14:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626934.977669; Thu, 02 Nov 2023 16:14:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyaKe-0003E8-Ij; Thu, 02 Nov 2023 16:14:08 +0000
Received: by outflank-mailman (input) for mailman id 626934;
 Thu, 02 Nov 2023 16:14:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wS6e=GP=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1qyaKc-0003Bm-VU
 for xen-devel@lists.xenproject.org; Thu, 02 Nov 2023 16:14:07 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0601.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d74f7ec0-799a-11ee-98d6-6d05b1d4d9a1;
 Thu, 02 Nov 2023 17:14:04 +0100 (CET)
Received: from AS9PR06CA0504.eurprd06.prod.outlook.com (2603:10a6:20b:49b::30)
 by GV1PR08MB7873.eurprd08.prod.outlook.com (2603:10a6:150:5c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.21; Thu, 2 Nov
 2023 16:13:56 +0000
Received: from AMS0EPF000001B6.eurprd05.prod.outlook.com
 (2603:10a6:20b:49b:cafe::89) by AS9PR06CA0504.outlook.office365.com
 (2603:10a6:20b:49b::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.19 via Frontend
 Transport; Thu, 2 Nov 2023 16:13:56 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF000001B6.mail.protection.outlook.com (10.167.16.170) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6954.19 via Frontend Transport; Thu, 2 Nov 2023 16:13:55 +0000
Received: ("Tessian outbound 385ad2f98d71:v228");
 Thu, 02 Nov 2023 16:13:55 +0000
Received: from d4100d802f67.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F6323044-8531-4894-832A-3E45232025BC.1; 
 Thu, 02 Nov 2023 16:13:49 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d4100d802f67.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 02 Nov 2023 16:13:49 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by DB9PR08MB6475.eurprd08.prod.outlook.com (2603:10a6:10:253::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.20; Thu, 2 Nov
 2023 16:13:45 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::76e6:a7e1:1592:866]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::76e6:a7e1:1592:866%3]) with mapi id 15.20.6954.021; Thu, 2 Nov 2023
 16:13:45 +0000
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
X-Inumbo-ID: d74f7ec0-799a-11ee-98d6-6d05b1d4d9a1
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=mOzMeMickPDEf94OVCntZN+3lj9LIVasVBtooAI+GPX6OdgLK3aMN77BqHdRm8MkGqn6ErocuAkM+lMVx8wLE7zrJjbBGpwMjNPhPIVTJ5sK19qFMZ86mdues1PWzYvUxmzJduJKhiFLRELnUXXJpKYAXtMt5t72HLo6GV6fOnzE2yA6KduvOrRlNBv6snXstioH+U+RzFtUxgFO1bT8uvlnBB/PdC4lieh9BQw4VqCwIB/agY6cWb1OL6qKPqQQfHb+OGlpqzUlOka4cwOG7TZtOLWwGPb5R+Swpeglx0K2/LAJXYq287BVvpdmsDqcZK2szU25l4ODuiIlyIw8Zg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fHVk9NfprxMDWjhg0e2LFxw/0tPRa/j0xCn7MrkIwgk=;
 b=J/sGJkF3BZA1f53wwa43fA9cDI7yKZoKb3tvncJIZVZ89bXhdTWN/phLydJOXyOyyRZ0xanweZ/s3qHL7EGmYwe4+bRuHDalH2bJsItyGleC2uoW4vs2G2T1GvNHD3agEKgZXYvLxKfJImR1pO3csYJV8GMIcVCVaFFXHAea0z+WNBfxu1tS6aSncGYTqnChRcglTXy2JxcSEHeomy57ZYuyQDI+uFP48zlXTHrp6a+cT7dZF0f+rNPfSajjC1LdU0nHAnFV1JeiG/zCNlkHo53YaFM8KnT3kdCCYV95K+37Lb4jY4xUift20euxU21L38hBPcZ16+ROa3MxoPtOpw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fHVk9NfprxMDWjhg0e2LFxw/0tPRa/j0xCn7MrkIwgk=;
 b=8DaPC9O8KAEnxqg1redbJI7kGR83p09o2k2iiG8XEofG8ow+xIou8UFzvY3DjkbdksZAe1Deb852wZ3FWqIUexKw4EMX5NEUHxD2mgWD2colx35Lt3YjjWQBAepkiSY/X3olxbADyrr89ZEFELZGPMxCHELOgGF6rEBIgg+aWho=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1e4c87d74166d710
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ivXrWWVtiFlRdgVYu2Wfp6/CB1pUnYOpnNm1PQTeheE6IkTEM0+fHK0CE6JPZiEMAIYF8oWqalcuBTVJATTj9o5gC2Y9Vr5AS9G9gOxKK11c0ukenE6EKzN7zELd0LKGalF8BvAowrXgU7R4/1yIegupiFAJ5rCTGNmNBLe+KAevEl/h7yNKZ+ce+mt4+WbcOwh1+wOVs1mS11gNKhYNtdZGUBJ1qWJ0GtW08Th81RyHiUfUCmAQ7WkO3mc0f9zAfCkg18MpeMC/h/BQDnHjw5RDZDdve4yfbcJxJcN1oq1GeiJcZPBDbFEsHTaYVJxgabmszzWnpKJLv1tl3DzrtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fHVk9NfprxMDWjhg0e2LFxw/0tPRa/j0xCn7MrkIwgk=;
 b=ebLqLlptiTPRGWAfg6WsyFATL9TPzkFGjM2o7YmuWRV2Eht/xHsl3PTw5M9G4pK58ln2nZyZb/g05inyXSySxHRaK/A5HBl610+A2fg157T2Pazh88a4iITjcdVksZxpnyn7fCd/V18EgaUdZNjjsfkZVQ5i3xkulS/GbR8EMRzsmY2I6nZ4f33bxMuyTaECD/dutEgIqOFEGyyoqHmDvlkgJLySMw5FLW2l7BD0yiYjL33LBt1GHHMMmVLTsxqhKC+uqHvKeSLYDUyELM8aZLSYY1eEbHSJM26Y3plW8JChIvpmC2P7zxs13SOL9u4KXEBFvhpbqT2bP1OFPUeFKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fHVk9NfprxMDWjhg0e2LFxw/0tPRa/j0xCn7MrkIwgk=;
 b=8DaPC9O8KAEnxqg1redbJI7kGR83p09o2k2iiG8XEofG8ow+xIou8UFzvY3DjkbdksZAe1Deb852wZ3FWqIUexKw4EMX5NEUHxD2mgWD2colx35Lt3YjjWQBAepkiSY/X3olxbADyrr89ZEFELZGPMxCHELOgGF6rEBIgg+aWho=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [RFC PATCH v2 7/8] xen: Add clang-format configuration
Thread-Topic: [RFC PATCH v2 7/8] xen: Add clang-format configuration
Thread-Index: AQHaC/2DXZmPSKf8g0iXRwPyHo/7ZrBmwPcAgAAqKoCAAAMlAIAASM0A
Date: Thu, 2 Nov 2023 16:13:45 +0000
Message-ID: <0D9B5B7B-FB49-492F-AA58-183A999C8D2E@arm.com>
References: <20231031132304.2573924-1-luca.fancellu@arm.com>
 <20231031132304.2573924-8-luca.fancellu@arm.com>
 <b0c05564-eadb-5135-b465-e15dec71aa22@suse.com>
 <1B8E95BC-1633-4452-BFC3-D7F5C417E7C0@arm.com>
 <504743a2-ae84-5ebc-a753-bdd15c3a7b43@suse.com>
In-Reply-To: <504743a2-ae84-5ebc-a753-bdd15c3a7b43@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|DB9PR08MB6475:EE_|AMS0EPF000001B6:EE_|GV1PR08MB7873:EE_
X-MS-Office365-Filtering-Correlation-Id: f4173bc3-625b-4e06-acd2-08dbdbbeb6ab
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 xbr0BvaucLG1zIX3wV1xMiifcXnWbBWOyskY44+/6oNy1koHhGCyj6Y78gC1QTi/3XlwjSZbbImqGHPGoPTveNfuS8Qely4hFix+W78MDQTjp3UCVfKgu6IR31aQXCDQ19TuZM9vf2WM0Vpbx9suKYLilTLsvO58vMGUdaTy0VgqE6BsiTTEN9tKZc9GuJyU8nmypCv4MXtjzKdf6lvW0vmyqdPAuNxzZBnq63W8qbr7MdD/hfRvtHYrmlkOXzsi8G4u26SwJla2eNZGnSJfRddQvZDITmQClsHxDykCsFxJNue5UXB+gDywdcxqOPSfnMIdGyu8lzdE3O3QfRRsusiH7WeO5uafiofZ8DRMaj/bvZX7Np5sdydLC1mRGhDfK+hSZRx/AEhxifdOGduHFDAOd9PemW9BvEU8c5WdORlt38HFjL/It+sENtFcM5RB9EF772Cuw9inRhUTYNx3Ei2QOai1v4pVKfPJH8WBg3Ca7o63iw+5ov0NM/yVIoEiGopjEGSnNVspFLB8uwnTkFoFptWahZzA+if/O7E81BDzNjtdZGRDqvSr0NAYs6xTAGpyKXTCCVEDJ7mgbLG1d62LKpvTGqhDAIJJc2P1/AZ1bwaY71tmZBmvu1kl8TeSI0trQ5dG3hlFm+cmkT8xYQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(346002)(396003)(39860400002)(376002)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(91956017)(66476007)(54906003)(66556008)(64756008)(66946007)(76116006)(66446008)(6916009)(8936002)(8676002)(316002)(4326008)(5660300002)(2906002)(122000001)(83380400001)(478600001)(6486002)(6506007)(53546011)(2616005)(86362001)(71200400001)(41300700001)(33656002)(36756003)(6512007)(38100700002)(26005)(38070700009)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <9F25F1A7029B1C49BF693DB651CF672D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6475
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001B6.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c546009d-996e-4e46-249b-08dbdbbeb078
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	u9gDBEKc2I5UlStT9ONerGEKd619T7BGTUDAY20t1rlDzbft9fqr8kGDwkjazX0G8aiCcDVE06v095z5R0RUkLagaCBfwbgXuO7lcS6zUFdYbeXal8q/DYN3jlWGK8P1N8T6iO/y+jiS/4C/2a/Ol7ecznlufR6M8wWbvrqMb2C5up8LeOQ1M56sfGewcuf6mMTAs8d3OhGrKdXj/k2C+kgHIipZOe4kboDyYKR6FNP2iwj3B3abQO0oBZyJg3qjXuyp3LYS46LdVyCQCtkcOh3KV2CLiDAEeieNfhLXX2rjn+kL7bF67ZLdd5th6HnrjyzgDp7CDAVHaWtLlqvtzHuTfjpCJdrnyUFJKlL80brIB0KZwXCz35tcmDrknWcPdb48933Hz9G5N+ejR3cIq0HRykQZekOhHrf2CHRXqURHQ5u8KX9BroenwRPnY3Y/lczzyC0PTqwiPLHSzKSXdRSR9JqzSXGjfUAX2EEqa905tkW+tLNprYSe2eyE6EJdqnMpq99P8+q4Bb7jnFbU/qd38TyUBZGiRnRHRI7PGw07cK/eZ14G1uXaU+XmRob6VN5G2sTRrm2Pc+O+NHAOX0mSAfAEk+ZqhzYCA/c6+ypkFZqMNW70r47w+3s58GiuF2jxfKMYsJ+AtuCHOTX2X0tQ72mqVk4MT7FAF8dVB12hmKKeMqDldmWeEOze450q6/A47/0CW0k0hr4OAzWgXqq3hPT1k4HEE8j9Wj2C/nQBKTppc4hjnvOJDOSXURmN
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(376002)(396003)(39860400002)(346002)(230922051799003)(82310400011)(451199024)(1800799009)(64100799003)(186009)(40470700004)(36840700001)(46966006)(70586007)(70206006)(40460700003)(54906003)(6512007)(86362001)(82740400003)(81166007)(356005)(6506007)(53546011)(2906002)(6486002)(33656002)(478600001)(36756003)(47076005)(36860700001)(83380400001)(336012)(41300700001)(26005)(2616005)(5660300002)(8936002)(316002)(40480700001)(8676002)(6862004)(4326008);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2023 16:13:55.7405
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f4173bc3-625b-4e06-acd2-08dbdbbeb6ab
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001B6.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7873

DQoNCj4gT24gMiBOb3YgMjAyMywgYXQgMTE6NTMsIEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT4gd3JvdGU6DQo+IA0KPiBPbiAwMi4xMS4yMDIzIDEyOjQxLCBMdWNhIEZhbmNlbGx1IHdy
b3RlOg0KPj4+IE9uIDIgTm92IDIwMjMsIGF0IDA5OjEwLCBKYW4gQmV1bGljaCA8amJldWxpY2hA
c3VzZS5jb20+IHdyb3RlOg0KPj4+IE9uIDMxLjEwLjIwMjMgMTQ6MjMsIEx1Y2EgRmFuY2VsbHUg
d3JvdGU6DQo+Pj4+IEFkZCBhIGNsYW5nIGZvcm1hdCBjb25maWd1cmF0aW9uIGZvciB0aGUgWGVu
IEh5cGVydmlzb3IuDQo+Pj4+IA0KPj4+PiBTaWduZWQtb2ZmLWJ5OiBMdWNhIEZhbmNlbGx1IDxs
dWNhLmZhbmNlbGx1QGFybS5jb20+DQo+Pj4+IC0tLQ0KPj4+PiB4ZW4vLmNsYW5nLWZvcm1hdCB8
IDY5MyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+Pj4+
IDEgZmlsZSBjaGFuZ2VkLCA2OTMgaW5zZXJ0aW9ucygrKQ0KPj4+PiBjcmVhdGUgbW9kZSAxMDA2
NDQgeGVuLy5jbGFuZy1mb3JtYXQNCj4+PiANCj4+PiBJIHRoaW5rIHRoaXMgbmVlZHMgc3BsaXR0
aW5nIGFuZCBldmVyeSBzZXR0aW5nIHRoZW4gaW5kaXZpZHVhbGx5IGNvcnJlbGF0aW5nDQo+Pj4g
d2l0aCB3aGF0IHdlIGhhdmUgaW4gLi9DT0RJTkdfU1RZTEUuIFRoYXQgd291bGQgZW50YWlsIGV4
dGVuZGluZyAuL0NPRElOR19TVFlMRQ0KPj4+IGJ5IGFueXRoaW5nIG5vdCBwcmVzZW50bHkgd3Jp
dHRlbiBkb3duLCBidXQgaW50ZW5kZWQgdG8gYmUgY2hlY2tlZCBmb3IuDQo+PiANCj4+IERvIHlv
dSBtZWFuIGludHJvZHVjaW5nIG9uZSBwYXJhbWV0ZXIgZm9yIGVhY2ggcGF0Y2ggd2l0aCB0aGUg
Y29ycmVzcG9uZGluZyBlbnRyeSBpbg0KPj4gQ09ESU5HX1NUWUxFPw0KPj4gDQo+PiBJdCB3b3Vs
ZCBtYWtlIHNlbnNlLCBob3dldmVyIHRoZXJlIGFyZSAxMTYgcGFyYW1ldGVycywgZnJvbSB0aG9z
ZSBJIHRoaW5rIGF0IGxlYXN0IDU2IG5lZWRzDQo+PiB0byBoYXZlIGEgY29ycmVzcG9uZGluZyBl
bnRyeSBpbiBDT0RJTkdfU1RZTEUgKG1heWJlIGluIHRoZSBlbmQgdGhleSB3aWxsIGJlIGxlc3Ms
IGJ1dCBJIGRvbuKAmXQgZXhwZWN0DQo+PiB0aGVtIHRvIGJlIGxlc3MgdGhhbiA0MCksIHNvIGdp
dmVuIHRoZSBhbW91bnQgb2YgcGF0Y2hlcywgSeKAmW0gYWZyYWlkIHRvIGZsb29kIHRoZSBtYWls
aW5nIGxpc3QuDQo+IA0KPiBTb21lIGdyb3VwaW5nIG1heSBjZXJ0YWlubHkgbWFrZSBzZW5zZSwg
Zm9yIHJlbGF0ZWQgc2V0dGluZ3MuIFdoYXQgSSdtDQo+IGNvbXBsZXRlbHkgbG9zdCB3aXRoIHRo
ZSBwcmVzZW50IHN1Ym1pc3Npb24gaXMgd2hpY2ggb2YgdGhlIHNldHRpbmdzDQo+IG1lcmVseSBl
bmZvcmNlIGV4aXN0aW5nIGNvbnRlbnQgb2YgLi9DT0RJTkdfU1RZTEUsIGFuZCB3aGljaCBvbmVz
DQo+IChzaWxlbnRseSkgaW1wb3NlIG5ldyBydWxlcyB3aGljaCBldmVyeW9uZSBtYXkgYWdyZWUg
d2l0aCwgYnV0IGFsc28gbWF5DQo+IG5vdC4NCg0KSSB3aWxsIHN0YXJ0IGEgc2VwYXJhdGUgdGhy
ZWFkLCByZWZlcnJpbmcgdG8gdGhpcyBzZXJpZSwgd2l0aCBhbGwgdGhlIG1haW50YWluZXJzIGFu
ZCBJIHdpbGwNCnB1c2ggYSBudW1iZXIgb2YgcGFyYW1ldGVycyBhdCB0aGUgdGltZSwgc3RhcnRp
bmcgZnJvbSB0aGUgb25lIHRoYXQgYWxyZWFkeSBlbmZvcmNlcyB0aGUNCmNvbnRlbnQgb2YgdGhl
IGNvZGluZyBzdHlsZSwgd2l0aCBleHBsYW5hdGlvbiBmb3IgdGhlbS4NCg0KPiANCj4+IEkgd2Fz
IHRoaW5raW5nIHdlIGNvdWxkIGRpc2N1c3MgdGhlbSBpbiBjaHVua3MgYW5kIHVwZGF0ZSB0aGUg
c2VyaWUgZHVyaW5nIHRpbWUsIHdlIGNvdWxkIHB1dCBpbiB0aGlzDQo+PiBwYXRjaCBhbHNvIHRo
ZSB1cGRhdGUgdG8gdGhlIENPRElOR19TVFlMRSBmaWxlLiBTb21ldGhpbmcgbGlrZSB0aGUgTUlT
UkEgcnVsZSBhY2NlcHRhbmNlLCB3aGF0DQo+PiBkbyB5b3UgdGhpbms/IFNoYWxsIHdlIGRvIHRo
ZSBkaXNjdXNzaW9uIGJ5IE1MIG9yIGJ5IG1lZXRpbmdzPyBFdmVyeSB0aW1lIEkgY291bGQgYnJp
bmcgdXAgYSBudW1iZXINCj4+IG9mIHBhcmFtZXRlcnMgYW5kIHVwZGF0ZSB0aGUgc2VyaWUgd2hl
biB0aGUgZGlzY3Vzc2lvbiBvbiB0aGVtIGlzIGZpbmlzaGVkLg0KPiANCj4gQWZhaWMgLSBlbWFp
bCBpZiBhdCBhbGwgcG9zc2libGUuIFRoZSBtb3JlIHRoYXQsIGNvbnNpZGVyaW5nIHBhc3QNCj4g
YXR0ZW1wdHMgdG8gZXh0ZW5kIC4vQ09ESU5HX1NUWUxFLCBmb3Igc29tZSBpdGVtcyBpdCBtYXkg
YmUgY2xvc2UgdG8NCj4gaW1wb3NzaWJsZSB0byByZWFjaCBhZ3JlZW1lbnQuDQo+IA0KPj4gVGhp
cyBpcyBteSBicmVha2Rvd246DQo+PiANCj4+IDExNiB0b3RhbCBjb25maWd1cmFibGVzDQo+PiAN
Cj4+ID09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09DQo+PiAxMyBzdHJhaWdodGZvcndhcmQNCj4gDQo+
IFdoYXQgZXhhY3RseSBkbyB5b3UgcXVhbGlmeSBhcyBzdWNoPw0KPiANCj4+IEF0dHJpYnV0ZU1h
Y3JvczoNCj4+ICAtWy4uLl0NCj4+IA0KPj4gQ29sdW1uTGltaXQ6IDgwDQo+PiANCj4+IEluZGVu
dFdpZHRoOiA0DQo+PiANCj4+IExhbmd1YWdlOiBDcHANCj4+IA0KPj4gTWFjcm9CbG9ja0JlZ2lu
OiAnXlBMQVRGT1JNX1NUQVJUfF5EVF9ERVZJQ0VfU1RBUlR8XkFDUElfREVWSUNFX1NUQVJUJw0K
Pj4gDQo+PiBNYWNyb0Jsb2NrRW5kOiAnXlBMQVRGT1JNX0VORHxeRFRfREVWSUNFX0VORHxeQUNQ
SV9ERVZJQ0VfRU5EJw0KPiANCj4gV2l0aG91dCBleHBsYW5hdGlvbiBpdCBpcywgZm9yIGV4YW1w
bGUsIG5vdCBjbGVhciB0byBtZSB3aGF0IHRoZXNlIHR3bw0KPiBzZXR0aW5ncyBhcmUgYWJvdXQu
IFdoaWNoIGluY2x1ZGVzIG1lIG5vdCB1bmRlcnN0YW5kaW5nIHdoeSB0aGVzZQ0KPiBpZGVudGlm
aWVycyBhcmUgKGFwcGFyZW50bHkpIHNwZWNpYWwgaW4gc29tZSBzcGVjaWZpYyB3YXkuDQo+IA0K
Pj4gU3RhbmRhcmQ6IEMrKzAzDQo+IA0KPiBJIGRvbid0IGNvbnNpZGVyIHRoaXMgInN0cmFpZ2h0
Zm9yd2FyZCIgYXQgYWxsLiBPbmx5IEM5OSBjb3VsZCBiZSBkZWVtZWQNCj4gc3RyYWlnaHRmb3J3
YXJkIGhlcmUsIGltby4NCg0KU3VyZSwgSSB3aWxsIHN0YXJ0IGZyb20gdGhlIOKAnHN0cmFpZ2h0
Zm9yd2FyZOKAnSB3aGljaCBJIG1lYW4gdGhlIG9uZSB0aGF0IEkgdGhpbmsgYXJlIGxlc3MgY29u
dHJvdmVyc2lhbCwNCmZvciBleGFtcGxlIGhlcmUgSSBrbm93IHdlbGwgdGhhdCB3ZSB1c2UgQzk5
LCBidXQgY2xhbmctZm9ybWF0IHdhcyBub3QgcmVhbGx5IG1lYW50IGZvciBDLCBpdOKAmXMgbW9y
ZQ0KQ3BwIG9yaWVudGVkLCBob3dldmVyIEMrKzAzIGlzIHRoZSB2YWx1ZSB1c2VkIGJ5IExpbnV4
IHNvIEkgZ3Vlc3MgaXQgY2FuIGJlIGZpbmUgYWxzbyBmb3IgdXMuDQoNCkFueXdheSBhcyBJIHNh
aWQsIEkgY2FuIHN0YXJ0IGFub3RoZXIgdGhyZWFkIHdpdGggYSBmZXcgcGFyYW1ldGVycyB0aGF0
IHdlIGNhbiBhbmFseXplIGVhY2ggdGltZS4NCg0KPiANCj4+ID09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09DQo+PiAxMCBkb24ndCByZWFsbHkgbmVlZCBhIGRpc2N1c3Npb24NCj4+IA0KPj4gUGVuYWx0
eUJyZWFrQXNzaWdubWVudDogMzANCj4+IA0KPj4gUGVuYWx0eUJyZWFrQmVmb3JlRmlyc3RDYWxs
UGFyYW1ldGVyOiAzMA0KPj4gDQo+PiBQZW5hbHR5QnJlYWtDb21tZW50OiAxMA0KPj4gDQo+PiBQ
ZW5hbHR5QnJlYWtGaXJzdExlc3NMZXNzOiAwDQo+PiANCj4+IFBlbmFsdHlCcmVha09wZW5QYXJl
bnRoZXNpczogMTAwDQo+PiANCj4+IFBlbmFsdHlCcmVha1N0cmluZzogMTANCj4+IA0KPj4gUGVu
YWx0eUV4Y2Vzc0NoYXJhY3RlcjogMTAwDQo+PiANCj4+IFBlbmFsdHlJbmRlbnRlZFdoaXRlc3Bh
Y2U6IDANCj4+IA0KPj4gUGVuYWx0eVJldHVyblR5cGVPbkl0c093bkxpbmU6IDYwDQo+PiANCj4+
IENvbW1lbnRQcmFnbWFzOiAnXiBJV1lVIHByYWdtYTonDQo+IA0KPiBMaWtlIHdpdGggdGhlICJz
dHJhaWdodGZvcndhcmQiIG9uZXMgYWJvdmUsIHdpdGhvdXQga25vd2luZyB3aGF0IHRoZXNlDQo+
IGFmZmVjdCAob3Igd2hldGhlciBzb21lIHNpbXBseSBkb24ndCBhZmZlY3QgdXMgYXQgYWxsLCBh
bmQgaGVuY2UgY291bGQNCj4gYmUgc2V0IHRvIGFueSB2YWx1ZSkgSSBjYW4ndCBmb2xsb3cgdGhl
ICJkb24ndCByZWFsbHkgbmVlZCBhIGRpc2N1c3Npb24iDQo+IHF1YWxpZmljYXRpb24uDQoNClNv
IGhlcmUgSSBtZWFudCB0aGF0IHRoZXNlIHBhcmFtZXRlcnMgYXJlIG9ubHkgdHVuaW5nIHRoZSBh
bGdvcml0aG0sIHNvIHRoZWlyIHZhbHVlDQppcyBub3Qgc29tZXRoaW5nIGVuZm9yY2luZyBhIHJ1
bGUsIHNvIHRoZXkgYXJlIGluIHNvbWUgd2F5IOKAnGJlbmRpbmfigJ0gc29tZSBvZiB0aGVtDQpi
dXQgdGhlaXIgZWZmZWN0IGlzIHZpc2libGUgbW9zdGx5IGluIGNvbmp1bmN0aW9uIHdpdGggdGhl
IG92ZXJhbGwgY29tcHV0YXRpb24gb2YgZXZlcnkgcnVsZS4NCg0KQnV0IG9mIGNvdXJzZSB3ZSBh
cmUgZ29pbmcgdG8gZGlzY3VzcyBhbHNvIHRoZW0sIGl04oCZcyBqdXN0IHRoYXQgSSBkb27igJl0
IGZlZWwgdGhlcmUgbWlnaHQgYmUNCmRpc2FncmVlbWVudHMgb24gdGhlbS4NCg0KPiANCj4gSmFu
DQoNCg==

