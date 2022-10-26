Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F34360E1F2
	for <lists+xen-devel@lfdr.de>; Wed, 26 Oct 2022 15:19:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.430569.682402 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ongJo-0003C0-S4; Wed, 26 Oct 2022 13:19:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 430569.682402; Wed, 26 Oct 2022 13:19:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ongJo-0003AE-Oz; Wed, 26 Oct 2022 13:19:40 +0000
Received: by outflank-mailman (input) for mailman id 430569;
 Wed, 26 Oct 2022 13:19:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NsSF=23=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1ongJn-0003A6-4l
 for xen-devel@lists.xenproject.org; Wed, 26 Oct 2022 13:19:39 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2040.outbound.protection.outlook.com [40.107.20.40])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d74e81bd-5530-11ed-91b5-6bf2151ebd3b;
 Wed, 26 Oct 2022 15:19:38 +0200 (CEST)
Received: from AM6P194CA0003.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:90::16)
 by GV2PR08MB8097.eurprd08.prod.outlook.com (2603:10a6:150:75::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Wed, 26 Oct
 2022 13:19:36 +0000
Received: from AM7EUR03FT063.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:90:cafe::43) by AM6P194CA0003.outlook.office365.com
 (2603:10a6:209:90::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28 via Frontend
 Transport; Wed, 26 Oct 2022 13:19:36 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT063.mail.protection.outlook.com (100.127.140.221) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5746.19 via Frontend Transport; Wed, 26 Oct 2022 13:19:35 +0000
Received: ("Tessian outbound 2ff13c8f2c05:v130");
 Wed, 26 Oct 2022 13:19:35 +0000
Received: from 99d6ba52dd76.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C5A269FC-7F99-494E-A486-483F347C88FE.1; 
 Wed, 26 Oct 2022 13:19:30 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 99d6ba52dd76.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 26 Oct 2022 13:19:30 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS8PR08MB9576.eurprd08.prod.outlook.com (2603:10a6:20b:618::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Wed, 26 Oct
 2022 13:19:28 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339%9]) with mapi id 15.20.5746.026; Wed, 26 Oct 2022
 13:19:28 +0000
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
X-Inumbo-ID: d74e81bd-5530-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=KyPDHnG2XTxgm9LmIwgKDd4EZMlzMkcHOKcRPLLzhsgug4cK6dY9JU33M/FQgFcrQmQTEUCwQiowwvQZqsEeDBbi4QbcKxJmAVgnQDDCpwzKvkuWeinoYg4LOIj7Q1lgb9/fUNH2jYJgY0ksvaGO9g4mMpvkDAqg8b3ClvJS/AerdQFUQwo/gZrylw2pk7V+SOG+5nhBqn/HsfmhL0B3VwOPWA5Myrf/iew/uSqNJheWPyCD+br5ySENWCsF2G0Jd+dr2cDs0SIimMvyaj5pvOGcBLCCljeXn2/r8xEvJwlHpOYkUf/zqJGwxhOTgPEHgdcFUZMieaGTeKiqbaoZbw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Bkdz2A3+vNZL4pCvhzmxXAnEZ8XmE6nmD0GMQHtou4=;
 b=Qwq12b7mDNP+uzIInSGiaVpO9oesQb4AKx9FkseSaNmn0UqfB0rueiprEqJhHA9ZcyU4kuhsxkEdZl0bQxqvQG+sEf7SBnC+IGbNfdt0OfMrrlnRBZoiFiHnkXrcSmkt+P3E1s062jN4IsxoDAuJ9oXLaSu0UumOAL1ys95mEzXqYPgen15ZyGMSHQD6BG6AHiaae/RGbTWLUScTvy5T46ySbeQ48Nl2e6Bsd4z0TXLH4UYyOzAuBwruMZ3K/Yg4fJz5vADMM7RYmHw1JLn6c9ZWLj4SKp/fxNHjo4NueraWD/nWBMYQ3A3jVBIsaV/YpaMawY1ZDrs+K1qkhnpwxQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Bkdz2A3+vNZL4pCvhzmxXAnEZ8XmE6nmD0GMQHtou4=;
 b=Vutua8+Bbrfa6XUG1z5fkCG5qtKgWJbiEkpj8f2+UpCG/cydOcfu2L7PUiwev3IWcRlcjnf2/zTO3lXkk8DZ3qU7YSlKKWiHPg7UB7kiKuoE3G6Awm/CWW00fru0yr2pA2HWbw0IBhlKswE60+HdLm0Nsomb2G1HNPiT5/3k3aw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IMz9vg1gN37HLt165V4oJxvvoRkRJ0za8WIUhNW5EwqSWqk0GdkSN9PYQ0kTP+DCRvu3LyU2vJCbc8tsLn7Cb9+OfyYZlsJ8T/uHN0rzIGqaXwMUu5NtU978lr2bElgyV7CWV67Vd+Y6oyxLb6SmS1/Zxq3dqv6Z79ZxHJ/TkgduDKnKGN2Ma7F1X/U+mkcau4PSZZSRqekV5VRXKX0M6BhjZNQ7kMWGhhv53IDIMRIo0MAjj0MOJrlKRs3QyHBWYF2l/AYigy0NK0U2U2/q37sJiDWZGFpsSAgMRzf6NbnfOMAIxjh+G8o4BU281cPSJuWdD0muFlzWGMX3TBJ5Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Bkdz2A3+vNZL4pCvhzmxXAnEZ8XmE6nmD0GMQHtou4=;
 b=OGSD0Db7BVAdz2KwjJsyGxhU+7wGgWL7va6gtaqWqqLPD6es+7QJC+ZL0DSz/LzDfuLdOftEFrf9L746vkEPd4pCgQYEnrnWRPZRSBBYPiSS0POQTaBU6kBrc83T1ioivDtHtyRAXbRNIYCjgDcMSBX8iz0CThbnpyyRhzQlJM8CU84EoIhGCSzFNKSZqT/66d5POlu8R5ZSlnNfxYArEwRQcB8NN2CQpkTEur5m3rxH6bgVqe27MK7C0dOnGgl2/lfRjXRf8HMz+2jEbZHlE+1mC2ZLtJYfTpQwcUxLlXY1EPE43mmWkuDfc3RE4YKgZG0iki1zs9gJB5fNZDCXTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Bkdz2A3+vNZL4pCvhzmxXAnEZ8XmE6nmD0GMQHtou4=;
 b=Vutua8+Bbrfa6XUG1z5fkCG5qtKgWJbiEkpj8f2+UpCG/cydOcfu2L7PUiwev3IWcRlcjnf2/zTO3lXkk8DZ3qU7YSlKKWiHPg7UB7kiKuoE3G6Awm/CWW00fru0yr2pA2HWbw0IBhlKswE60+HdLm0Nsomb2G1HNPiT5/3k3aw=
From: Henry Wang <Henry.Wang@arm.com>
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
CC: George Dunlap <George.Dunlap@eu.citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
	<julien@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH] CI: Drop more TravisCI remnants
Thread-Topic: [PATCH] CI: Drop more TravisCI remnants
Thread-Index: AQHY6TgHyoZDlKglYE6vttngtkx/xK4goB+AgAAIgcA=
Date: Wed, 26 Oct 2022 13:19:28 +0000
Message-ID:
 <AS8PR08MB7991C8776EA4459F8CFF6E5092309@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20221026123906.10421-1-andrew.cooper3@citrix.com>
 <141dd739-153c-6d72-d1cd-3dce579b7e7b@suse.com>
In-Reply-To: <141dd739-153c-6d72-d1cd-3dce579b7e7b@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 656DE45D66A2574EA1F8A5E7ABD22776.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AS8PR08MB9576:EE_|AM7EUR03FT063:EE_|GV2PR08MB8097:EE_
X-MS-Office365-Filtering-Correlation-Id: a913db23-652e-463c-81bb-08dab754ba60
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 7CdHlpdgo+5VinmHOXnQIJQ3DSgWMG6vMv7EHHxfPxVa1KblszAcBu/DhzgNcq+Wek7CZm/9DzUudxuTuvrJYoS9UIyEIrDIDvy4TuhHugrJC0gfka5zs8GNfz9Fu/Bs5Di94rXZmLkf9TRqGolJaah/fc4KsxEqc9r9sQaUznQs8UZEcD8lN2S7+S0KFEpB86IigQhes3o1c5S0DJXjlopLooY6QLilwCE/NJziBgGw22VkYRMVsbafeUbQfpAYzyGnE4+nR4Rj+yMnuIxJphXSfawX+4IjZrmwZm28aT+K9ms86qRdaq7J0l4rYGk/7T9GJoIDV8fbykB8XWxqYqRPhO/6/iORX9RWRuzFDDY7EQy0gFIyJ2ZAwHtOUEeTJlJ4bfA0Tukf1X6sfIIq81m+SygCzbKKqjMdKbeLBBIjLLIDASKzhOl98XiYC40g/+frFeRlnQX/xenJpltSDjKILNFwiy6lW80PA8+6MVVVK8i2zQRqgEoJeN1XPPMqtEpvGx7E1gNtnrrz/iWZgJMpy8jZVJ8fqX3iePB+ElBozSOOP+qFSpNm4saueT3FzGD6FDvcfSDis35K/95Hi1XmD1vsVckW2BCQxEXadplu7zE9Icd7T+sp0b05TJYQODsV2SUSfJvFsPCjYs2R0ksNqQjZb/qwaDZI3Fxn2FeMcUBIlwV++vsua8jVw38Ht5VabEzPca0Op47jKmkMSTXwCZVle5BOn6HFVJQ+LYtrUY9fblvCd5TOwBQ6ykusrmGu2hBCnlzPqHs4F+2/LA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(39860400002)(376002)(136003)(366004)(396003)(451199015)(66556008)(55016003)(66446008)(66946007)(110136005)(38070700005)(2906002)(8936002)(52536014)(478600001)(33656002)(64756008)(4326008)(8676002)(41300700001)(54906003)(71200400001)(5660300002)(66476007)(76116006)(186003)(9686003)(86362001)(4744005)(316002)(38100700002)(6506007)(122000001)(53546011)(7696005)(26005);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9576
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	db980041-1756-424e-05b0-08dab754b5ec
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WMB9q5BP4x34vHnRpIcBpD/7+pv6QIw5iOdBL/uXqq+Iv2z3JaR2ncUHJrWl8X/rJI7K0qInjTL8X9UIiBoZB2XVVc8mUx3/cnxXtsz3dlz8vKSu8PzYuFFhH24vKBFVKFX7knOoH2Qzvut8X4IyYurAkMP22zDjA69kCuIZLudIR3NyN9/Qe428S38pO4nYzVisQeRb+vRvft+0sijGC1biyOr8n+C3bhrFjSOsYpJ+KxhYZk+NyzRuDCl2ir5OlSAaxXk89yUqBD8GpgO1Ro3w40xuJtGU65oWwOhE7XhejUyPPLiVxhMLZsLGe/gtrjalYOS7GxYiw0Oq0Ghk0wFOzu3EUipHRc7c8CLKaURfVEUN3bYK4wDvC+nYTxw98TFJ3L9REiWvM3mLonkh0+2jkGFXubL58wZKpLiDZXSvrrF3FYA2OwqaoXUwwBqPB+rVUTcwHt5gyulPOI/X4htYw+xnqcYBD5fODV+rplrfWsM8ZzKaZtuBekoPRlHXHTjrRO6ebOo0c+0QjZOvoq2IkR6yUj4/C49YL14hJZ8MRaxqNmhf3IR5rQ0KXLMDcr9OTk+l6tOFSBF0YkunXaOoPaoLJsQ5c8sycSGbub6pVyN2lXsDZFfybpoaEpa4aWqdMfW5M3CPQCvp+uXHTwD6+RLApp0BQlG0IIwB5bRcRGmV9c6Pn1F8zT+3wrXV1m9QtCnGKo03+cB8JWLOG8BFQpkmbry0wzh5XnE4PhbWg/uI6I1Z6jq0mNiEvvOeepzNZPbST5hcrEMU/l6myw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(396003)(39860400002)(136003)(451199015)(40470700004)(46966006)(36840700001)(478600001)(86362001)(40460700003)(47076005)(40480700001)(55016003)(9686003)(36860700001)(82740400003)(7696005)(33656002)(186003)(336012)(356005)(81166007)(4326008)(8676002)(53546011)(70206006)(82310400005)(316002)(2906002)(6506007)(52536014)(41300700001)(26005)(4744005)(70586007)(54906003)(5660300002)(8936002)(110136005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2022 13:19:35.7900
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a913db23-652e-463c-81bb-08dab754ba60
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8097

SGkNCg0KPiBTdWJqZWN0OiBSZTogW1BBVENIXSBDSTogRHJvcCBtb3JlIFRyYXZpc0NJIHJlbW5h
bnRzDQo+IA0KPiBPbiAyNi4xMC4yMDIyIDE0OjM5LCBBbmRyZXcgQ29vcGVyIHdyb3RlOg0KPiA+
IFRoaXMgd2FzIG1pc3NlZCBmcm9tIHByZXZpb3VzIGF0dGVtcHRzIHRvIHJlbW92ZSBUcmF2aXMu
DQo+ID4NCj4gPiBGaXhlczogZTBkYzliMDk1ZTdjICgiQ0k6IERyb3AgVHJhdmlzQ0kiKQ0KPiA+
IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+
DQo+IA0KPiBBY2tlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KDQpSZWxl
YXNlLWFja2VkLWJ5OiBIZW5yeSBXYW5nIDxIZW5yeS5XYW5nQGFybS5jb20+DQoNCktpbmQgcmVn
YXJkcywNCkhlbnJ5DQoNCg==

