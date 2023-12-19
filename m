Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70705818612
	for <lists+xen-devel@lfdr.de>; Tue, 19 Dec 2023 12:10:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.656696.1025084 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFXzR-0000Sg-KC; Tue, 19 Dec 2023 11:10:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 656696.1025084; Tue, 19 Dec 2023 11:10:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFXzR-0000QC-Gp; Tue, 19 Dec 2023 11:10:21 +0000
Received: by outflank-mailman (input) for mailman id 656696;
 Tue, 19 Dec 2023 11:10:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1vMc=H6=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1rFXzP-0000Q6-Qc
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2023 11:10:19 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20600.outbound.protection.outlook.com
 [2a01:111:f403:2612::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 30d2239a-9e5f-11ee-98eb-6d05b1d4d9a1;
 Tue, 19 Dec 2023 12:10:17 +0100 (CET)
Received: from DU2P251CA0026.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:230::28)
 by DBBPR08MB6169.eurprd08.prod.outlook.com (2603:10a6:10:205::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.38; Tue, 19 Dec
 2023 11:10:08 +0000
Received: from DU6PEPF0000A7E3.eurprd02.prod.outlook.com
 (2603:10a6:10:230:cafe::5c) by DU2P251CA0026.outlook.office365.com
 (2603:10a6:10:230::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.38 via Frontend
 Transport; Tue, 19 Dec 2023 11:10:08 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU6PEPF0000A7E3.mail.protection.outlook.com (10.167.8.41) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7113.14 via Frontend Transport; Tue, 19 Dec 2023 11:10:07 +0000
Received: ("Tessian outbound 385ad2f98d71:v228");
 Tue, 19 Dec 2023 11:10:07 +0000
Received: from 6efb34b4c112.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C54F7031-8D3E-4716-9A19-B5870E9C936C.1; 
 Tue, 19 Dec 2023 11:10:02 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6efb34b4c112.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 19 Dec 2023 11:10:01 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by DB3PR08MB9060.eurprd08.prod.outlook.com (2603:10a6:10:433::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.37; Tue, 19 Dec
 2023 11:09:56 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::8da:b5c2:b334:838]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::8da:b5c2:b334:838%7]) with mapi id 15.20.7091.034; Tue, 19 Dec 2023
 11:09:56 +0000
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
X-Inumbo-ID: 30d2239a-9e5f-11ee-98eb-6d05b1d4d9a1
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=lVNsqCxUgnENJgzA9fYR/xZMVDWpY41FvQPtO/UqEA0/ysIvuYZQ2Tfa2Idq2T+vSfAOB8Xm+cjtOnwBYwDhLxM/A5Luju5Z5riu9MU9NrZSuKgMubNulp+XY+wNURO5GtUtTeYpIA9ziQGbTp98QkD40P4hX45lf/ulk3oeXSPixczat5hqzZsYMSuaVUdsPLNmtyJ+QB6NpCeC3CClVG07bS1+XEZhYexOOTFQCcgWKmaf3If81hJ41kXPmuGKi98HZDub2ISiL082NZV9cMwAuMvHYQpX6fa8d8zj0ygts3lAi3BBLrJw6guJkk8pY9OXSVgCmOangUJ12QkdgQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tlrBFriPsXkB3qHDYp25yU4rCzS8l4pf0tcegfHsrJw=;
 b=QYIq0Q7I7y0AvL2GjQalA7tCn3bhBsQqezJJXNrzH2YNo0wuUz06pIUHQcK8uC0AxhJZNH5pkSBXzpDymiRgA7ssRj07hcEhXbBXwR8dOxp2h56tdA/dm9QLi3HROmJKvsf82Kf0++t4u1j/nXcZW6HwARa1yvr8Bcz/PRf4/EKXRENcfh4Q5M2XeOn2P+2G9qouncbm1J7ngqj5xV4Kc84Vx4fVxPVK1leNdDuR8/e3Fl6CyfqjlM5uQftZGyJ+dQhYFIcW2hqdOMC0YL/DwzMTAzodNkNzBmM34cbbBu60O4loeI0N/G43PmiPYJDPWztUPr6tlT5J3T8ovQsajg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tlrBFriPsXkB3qHDYp25yU4rCzS8l4pf0tcegfHsrJw=;
 b=iW6yPqhEMvQYLM7l3hiEQBACrYQzxwcMfKc75rwDgqLo7yu22uoCjesS/VXLVueAbtyqA7rpRnNq1UuSBz4/QT5X27Q281B4t54fqUtyXA5s75OMuYq2LqY28n/zmthFnh5Em6lzxq/wAtV5pLZ6JMJVtdSQavz6tx6rT3GPWko=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: bd87a25f8bb1bc0e
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TtOVbTWEjRVcVGz9XDEgj5NYVy4dDMPWnIpeEIjIGvoYjZ4BUQXrLXvkxbJDRamIQYJ6TjAQ5SnGsjM8KOVhBhbW3pY6wV79f7xdfBXNNDbWn09E3UUiEyDkFKV3PrjLasSn977ZD2kvzWE0rATsVLQ49jliODtZFyfZiraxA9aIlTbBj/q4N5SL746JFxm0ZmkuHUhSGtVsuc0zm/tR0+puKPRJelQ7KNtNE1PbO454pKZDL7rm1wVBcFwb218XqfpC0oxnTtBFgDGm4wrk6Duxyy02BrpoOQK+uSmScAipOJAHXyHKdsuXv0e75jBl+/GApRWZQE6Mo2Hw2qjWtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tlrBFriPsXkB3qHDYp25yU4rCzS8l4pf0tcegfHsrJw=;
 b=gU0KIDN6tojn4Iz9aBJfrqgEPbJc/81k8vf6whtog5YX0WCw9gulfqT6vGTQ8RLCzs19GqQP6RKdPv89DvAy5ZvkA1OWJuw1Cy+Po1tpPdxjz/8YbKobrDa8wsiV0GIlUTfJ56nNLjc4viGF3bggVZNUeesCVLrmblBljxsyIHnNhdhhC1YqoVxiz/ZWYH9BQOH5Oy2XZl+mcVbDQr5thpMsIYggKxqCu99Lb366nHzc28HWCY0k4VhBK8DRznSSzmjjCJIbViH66bJ76jLTVdlplQMP7/S51Jik4kjcg7dteOgdXW5/9EG3+EO1CQ4eg1I0MrFwYqUPEf4sWg0tSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tlrBFriPsXkB3qHDYp25yU4rCzS8l4pf0tcegfHsrJw=;
 b=iW6yPqhEMvQYLM7l3hiEQBACrYQzxwcMfKc75rwDgqLo7yu22uoCjesS/VXLVueAbtyqA7rpRnNq1UuSBz4/QT5X27Q281B4t54fqUtyXA5s75OMuYq2LqY28n/zmthFnh5Em6lzxq/wAtV5pLZ6JMJVtdSQavz6tx6rT3GPWko=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
CC: Jan Beulich <jbeulich@suse.com>, "consulting@bugseng.com"
	<consulting@bugseng.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George
 Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH] xen: add acmacros.h to exclude-list.json
Thread-Topic: [XEN PATCH] xen: add acmacros.h to exclude-list.json
Thread-Index: AQHaMmldSNcDtDpNs0m0RNrxIeAVZrCwcdKAgAABGYA=
Date: Tue, 19 Dec 2023 11:09:56 +0000
Message-ID: <2F345562-4049-4A50-9793-D0002B239C43@arm.com>
References:
 <664ddc412905546d44d3e311a743ba5217a6243b.1702976486.git.nicola.vetrini@bugseng.com>
 <055b6cf3-4f29-4f1d-b650-26c6d9be8832@suse.com>
 <2fd03776043811a8ceae9ae41de5f0fa@bugseng.com>
 <2c64af71dcb3984f1753ef115868cb7b@bugseng.com>
In-Reply-To: <2c64af71dcb3984f1753ef115868cb7b@bugseng.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|DB3PR08MB9060:EE_|DU6PEPF0000A7E3:EE_|DBBPR08MB6169:EE_
X-MS-Office365-Filtering-Correlation-Id: b194fb0b-bebe-4390-d36a-08dc00830f43
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 GsSA4UYlvC3w93iNvlFlfMjeyO+hBz7befidqkypHfSS+c+836UBt/YwWiq7vGgYh+pQxomIEN16t1nmZE79TEvhp4r2ICiqyYI2Y7ZNNVEkP3K9MElWnesvpsgEkzm0LOWpXxqh/JdPU86pJv0U944FoMsBAK/aAXwtg+MeeQJcZsilHETE5tDZ7M0iXu16BU1Zy+v+o1DbCoozfnBXn90DqzMJO7QZgm2mFwKEgF56jlbSV+43OljeFHmuOGEJ7pTU/YUkNu3jQ4KZFiKJTvOoymSwaIkQOC539LWVhFb+S1sQocQqcZV+NzoYVA7kcWUC5NzIKxg55GwLcw1eYSKcLa12/ZGurQ9GaCkh61FqAy2tTRW/2MwbmvJdGfw+oXAPG3PZOy8l5Xvzejg0FJKGHTk/RweJkbGenVVvM4JTFaev/kU8gkkxaiQGLlFMPbseoN9gc2r/pWCdIxEGo7uOOlp0u6okeHFbg/40QjhRlpgEmK99Yd9+s8cRvNe50LZyFLJDSqG1mXYDCFSUn9Bc2hjvYYsQNxAmZdLnIVm9Qs3KnaoEDiJdxChkq8g4UPjfVcqMFBwN717kxhia0+N5vnxOhK9cXtenUtVQcRrs+I4F3UNJDOLjVBY6wMcX536taCxR0O65jgrFLohcRQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(136003)(376002)(39850400004)(396003)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(38070700009)(76116006)(36756003)(86362001)(33656002)(91956017)(38100700002)(122000001)(66946007)(83380400001)(26005)(2616005)(53546011)(71200400001)(2906002)(478600001)(6916009)(66556008)(54906003)(64756008)(6486002)(316002)(66476007)(4001150100001)(66446008)(6512007)(6506007)(8676002)(8936002)(41300700001)(4326008)(5660300002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <12E40BE0EAE8334F82A6FA5744464AD9@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB9060
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF0000A7E3.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	1588c6bb-5bf1-4277-594c-08dc00830884
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	U+i5+cL35jabtPqBdj6G6v99Gynl/RVltWuAfYH5p3CLU1rZTJClmbBQY/D5gn+9dbpn/pSlAyujWPnsaE9aSBAIrM5WFXTBKz8fN1YB/pw4J0Uaf986stQcqtCbQnHiIwkcPI784ZAlC9mphfcfbcMOGEzRyffYtL2q149uI9QmMhEZoxptJlSC6m7wE7FAV54W4/wbp9KJt8ffQr9dLmt0HYaRwaKwA5iQWTKx0Z9Asb0/956WG3gSD/BxtRZYU+xi8El9bzhbIGJtkhEc0pQ9CqGERTsW9jKtkQePr2jn5h3CtL2b3mby/xuAPbZKK3X3S65qhkqIVMqFNh1YyUj50lF9NK/i7p3kCYgGV6wxMEBK/uRPZcByPsQx+pPc2Ig6CKZpUiKZUcQMt1rnLP7ATbM2N7ZYugMc4Nnjswfzj4tvkVKw27AJBgenrVxbMCaYxY9bg47LEOiw93cFFu3b4bRT1rTMWyClPuqldz2Pj/dJ6VJQOjCfT8hhRmLRf1GztSajm83pB291FXyx4LixpQf9ho1VDcY3qSCjhA3ZnJ8FZvEq9Sgr0a0BioW0TGav4Mn1YFA7a7TRfZOoqSyu8B39uqsGS8zUcKhiHyyEdrMMN7uo+12tVMNSE+h1H/i7mMjPzVI7rUpnJXIjp6j6fDL76Hw+CukdR8lrvi3zqoTJnnH1I8VXmwIINtKr2Vrjf3PsQI4M+fAM/OtM114+TuQwEny5v4RYPvD649Q=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(136003)(346002)(396003)(376002)(230922051799003)(451199024)(82310400011)(1800799012)(186009)(64100799003)(36840700001)(40470700004)(46966006)(26005)(2616005)(336012)(53546011)(6506007)(6512007)(36860700001)(5660300002)(47076005)(83380400001)(478600001)(2906002)(8676002)(6862004)(4326008)(4001150100001)(8936002)(41300700001)(70586007)(70206006)(54906003)(6486002)(316002)(356005)(81166007)(82740400003)(33656002)(36756003)(86362001)(40460700003)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2023 11:10:07.6586
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b194fb0b-bebe-4390-d36a-08dc00830f43
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000A7E3.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6169

SGkhDQoNCj4gT24gMTkgRGVjIDIwMjMsIGF0IDExOjA1LCBOaWNvbGEgVmV0cmluaSA8bmljb2xh
LnZldHJpbmlAYnVnc2VuZy5jb20+IHdyb3RlOg0KPiANCj4gT24gMjAyMy0xMi0xOSAxMTo1MSwg
Tmljb2xhIFZldHJpbmkgd3JvdGU6DQo+PiBPbiAyMDIzLTEyLTE5IDExOjM3LCBKYW4gQmV1bGlj
aCB3cm90ZToNCj4+PiBPbiAxOS4xMi4yMDIzIDEwOjAyLCBOaWNvbGEgVmV0cmluaSB3cm90ZToN
Cj4+Pj4gLS0tIGEvZG9jcy9taXNyYS9leGNsdWRlLWxpc3QuanNvbg0KPj4+PiArKysgYi9kb2Nz
L21pc3JhL2V4Y2x1ZGUtbGlzdC5qc29uDQo+Pj4+IEBAIC0yMDksNiArMjA5LDEwIEBADQo+Pj4+
ICAgICAgICAgICAicmVsX3BhdGgiOiAiaW5jbHVkZS9hY3BpL2FjZ2xvYmFsLmgiLA0KPj4+PiAg
ICAgICAgICAgImNvbW1lbnQiOiAiSW1wb3J0ZWQgZnJvbSBMaW51eCwgaWdub3JlIGZvciBub3ci
DQo+Pj4+ICAgICAgICAgfSwNCj4+Pj4gKyAgICAgICAgew0KPj4+PiArICAgICAgICAgICJyZWxf
cGF0aCI6ICJpbmNsdWRlL2FjcGkvYWNtYWNyb3MuaCIsDQo+Pj4+ICsgICAgICAgICAgImNvbW1l
bnQiOiAiSW1wb3J0ZWQgZnJvbSBMaW51eCwgaWdub3JlIGZvciBub3ciDQo+Pj4+ICsgICAgICAg
IH0sDQo+Pj4gVG9nZXRoZXIgd2l0aCB3aGF0J3MgYWxyZWFkeSB0aGVyZSAoaW4gY29udGV4dCks
IHdvdWxkbid0IGl0IGJldHRlciBiZQ0KPj4+IHRoZSBlbnRpcmUgZGlyZWN0b3J5IHRoZW4gd2hp
Y2ggaXMgZXhjbHVkZWQsIG9yIGF0IGxlYXN0IGFsbA0KPj4+IGluY2x1ZGUvYWNwaS9hYyouaCBj
b2xsZWN0aXZlbHkgKGFuZCBwZXJoYXBzIGFsc28NCj4+PiBpbmNsdWRlL2FjcGkvcGxhdGZvcm0v
YWMqLmgpPw0KPj4+IEphbg0KPj4gK0NjIEx1Y2EgRmFuY2VsbHUNCj4+IFN1cmUuIEkgd2Fzbid0
IGNlcnRhaW4gd2hpY2ggZmlsZXMgYXJlIGltcG9ydGVkIGZyb20gQUNQSSBDQSBhbmQgd2hpY2gg
YXJlbid0Lg0KPj4gSSdtIGFsc28gbm90IHN1cmUgd2hldGhlciAiaW5jbHVkZS9hY3BpL2FjKi5o
IiB3b3VsZCBiZSBwcm9wZXJseSByZWNvZ25pemVkIGJ5IG90aGVyIHRvb2xpbmcgdGhhdCB1c2Vz
IGV4Y2x1ZGUtbGlzdC5qc29uIChvbmx5IGNwcGNoZWNrIEkgdGhpbmspLiBJIENjLWVkIEx1Y2Eg
RmFuY2VsbHUgb24gdGhpcy4NCj4gDQo+IEl0IG9jY3VycmVkIHRvIG1lIHRoYXQgaXQncyBzdXJl
bHkgb2sgdG8gdXNlICJpbmNsdWRlL2FjcGkvYWMqIiBhbmQgImluY2x1ZGUvYWNwaS9wbGF0Zm9y
bS9hYyoiLg0KDQpZZXMgSSB0aGluayBpdOKAmXMgZmluZSwgaXQganVzdCBjb21lIHRvIG15IG1p
bmQgbm93IHRoYXQgdGhpcyBjb3VsZCBoYXZlIHRoZSByaXNrIHRoYXQgaWYNCmFub3RoZXIgZmls
ZSBpcyBhZGRlZCB3aXRoIOKAmGFjJyBwcmVmaXgsIGV2ZW4gaWYgaXQgY291bGQgYmUgc3ViamVj
dCB0byBNSVNSQSBjb21wbGlhbmNlLA0KaXQgd2lsbCBiZSBleGNsdWRlZC4NCg0KSWYgdGhhdCBy
aXNrIGlzIG5lZ2xpZ2libGUgZm9yIHRoZSBtYWludGFpbmVyIG9mIHRoYXQgcGFydCwgdGhlbiBp
dOKAmXMgZmluZS4NCg0KDQo+IA0KPiAtLSANCj4gTmljb2xhIFZldHJpbmksIEJTYw0KPiBTb2Z0
d2FyZSBFbmdpbmVlciwgQlVHU0VORyBzcmwgKGh0dHBzOi8vYnVnc2VuZy5jb20pDQoNCg==

