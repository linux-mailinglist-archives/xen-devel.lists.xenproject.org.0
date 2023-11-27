Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F7F67FA4E3
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 16:38:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642305.1001666 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7dgX-0001zf-Nb; Mon, 27 Nov 2023 15:38:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642305.1001666; Mon, 27 Nov 2023 15:38:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7dgX-0001wr-K6; Mon, 27 Nov 2023 15:38:09 +0000
Received: by outflank-mailman (input) for mailman id 642305;
 Mon, 27 Nov 2023 15:38:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QuWu=HI=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1r7dgV-0001vX-WA
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 15:38:08 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20627.outbound.protection.outlook.com
 [2a01:111:f400:fe16::627])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f46a25a7-8d3a-11ee-9b0e-b553b5be7939;
 Mon, 27 Nov 2023 16:38:05 +0100 (CET)
Received: from AM0PR10CA0042.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:150::22)
 by DBBPR08MB6266.eurprd08.prod.outlook.com (2603:10a6:10:203::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.27; Mon, 27 Nov
 2023 15:37:58 +0000
Received: from AM3PEPF0000A796.eurprd04.prod.outlook.com
 (2603:10a6:20b:150:cafe::3d) by AM0PR10CA0042.outlook.office365.com
 (2603:10a6:20b:150::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.27 via Frontend
 Transport; Mon, 27 Nov 2023 15:37:58 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM3PEPF0000A796.mail.protection.outlook.com (10.167.16.101) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7046.17 via Frontend Transport; Mon, 27 Nov 2023 15:37:57 +0000
Received: ("Tessian outbound 5d213238733f:v228");
 Mon, 27 Nov 2023 15:37:57 +0000
Received: from 04a1da9d97e5.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6CC1E321-0589-4951-8133-31D8299BCECD.1; 
 Mon, 27 Nov 2023 15:37:46 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 04a1da9d97e5.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 27 Nov 2023 15:37:46 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by AS2PR08MB9786.eurprd08.prod.outlook.com (2603:10a6:20b:605::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.28; Mon, 27 Nov
 2023 15:37:44 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::8da:b5c2:b334:838]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::8da:b5c2:b334:838%7]) with mapi id 15.20.7025.022; Mon, 27 Nov 2023
 15:37:44 +0000
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
X-Inumbo-ID: f46a25a7-8d3a-11ee-9b0e-b553b5be7939
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=m9AWpTWpfYp3CeVjzqdO2EPMH1D2Lhu/wFAqLXOtEKB3cqxMo9MS4/rMucjfXQQT9mqG77kQi0fYapuiSyUlPuKlMgIYH3U27RciX55mnBCHTX5e7ajwxoERc55RUcnuL1JtNH03bPHUgpOVzWTn9ZmkxcekVw1YLvx8gDc9URnBdAlGO02uJm/Z7uirtyclT/C7S94Jvffo1J1Woa+uBohYEbg+KXnmWOp64DlqBcaIolOjLlu0t5PBQxn8fDl2tG0+9Es8IY3zvbecrjRA38E01XKBJi6ol4xXTyb3xOQz4JoDWRoXN9fOIXos+x1Nrx+Xfe4c0U+RpVRr4rEs1w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TvWSAQNKX1G5wd2oakkCR2kHpeUYVezXHZ16eLXaOE0=;
 b=iRed0VC2cPYmKM9oBI34je0+gKZ5rJenlXt5ovNqidHYv1J8RMrPS7S/s8fDFzLcjW1EXwNklFuwozT6EzPgdCPFAS9aBoFyWRvppzvPZA+J9qbRro/gKoKJDmzWyrN6Z45uMzaEZmy89wPnHwR5nTSAC4dh4zKBs2ralQhRmWyYV0onuB26scdYpHG7kyzhd3ISZar/GcUNSnkER4EU+5/iUB0dg5xNDoDTqPvAD9rLTfPMWDEjCddn1GcdIG31+5ubeI+fcbHfMDj2w5dG/iJC5k7qtOeNo0hjz9NxJfoD6RundMhLPfMi25TIx1VPfxF473K/CGhDDXwlD0hq9w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TvWSAQNKX1G5wd2oakkCR2kHpeUYVezXHZ16eLXaOE0=;
 b=badn6k/PnWKT1M9PPLubTg3jkLM9Lfu/dMwNg8GQ3HFBB+AvKYaV5UKY9ALWWWFCn69dw6Vk4Kp//8TTt6DrkaPZMwuuVvTjUQhDKVy8h6nhFskiIPedXpQmjq4S2v90iDB+b3GrpakDJZl09TWSveMnSFYUXW45/qS/Wtxqm0k=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: bd90959dcd3c3ece
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OswIkPJrhOEMgsxqxDIA8DxKHID1wF3llDfytiNHgXGIPC/xstkpUntpjC8F123Kz9XOPTbPLyRZThlg9XrkVcNjZGBJYkWsJk5aOJQ4aq5KORXhDdDKPxRUJHphDWVueJDytw6pQ7Bnv0Rtw1aaKXcihWaS72hysh9eJGvScWaEenCLtZVc41suomqk/QjV4GNcnga2kg44YK4CfJBP+P1mZyHL9W4w/Vkwo6J965uPOhE9Dw5MrahVQmyriBoAcun2vnJzSYZiKiNCkUEzecPGs+dce5VtBrt79fMHtoq7WfClHkaN6uqYAbuBHJLn7h8dM6L5jryh1n1ZCgXZFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TvWSAQNKX1G5wd2oakkCR2kHpeUYVezXHZ16eLXaOE0=;
 b=MPHQAjECyPw/7gtbAepeDLScZitAY8uMfNCbbGz6JQttXYDuzy/X8/sFIZRK1+dqZbJlfLgbudlIsseR1vTiqko1uAr3VvcstkUvu3ReNgsxXFlcr+XtWWkOnUkQzYNYvTkbXlGRQhSMCiWRjH17EIyH2PrDzkCuSP28vRhM3VIruTUn3WKzJiD4Cwrxd913iD88KC5AphsoONIHBLYyzbyBPsn59nQKGqOMePIRelXP6M0wRv2P5Ssf20Aoe8TnRH8TkVh4QSdoYiTKKM2QPHjwX+a/LG6dd+kA8ZlKacbCt3fOtm9y4xaRxzuX9eG6m6kAhHYefBciQ9GIiqBWdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TvWSAQNKX1G5wd2oakkCR2kHpeUYVezXHZ16eLXaOE0=;
 b=badn6k/PnWKT1M9PPLubTg3jkLM9Lfu/dMwNg8GQ3HFBB+AvKYaV5UKY9ALWWWFCn69dw6Vk4Kp//8TTt6DrkaPZMwuuVvTjUQhDKVy8h6nhFskiIPedXpQmjq4S2v90iDB+b3GrpakDJZl09TWSveMnSFYUXW45/qS/Wtxqm0k=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Michal Orzel <Michal.Orzel@amd.com>,
	George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: Clang-format configuration discussion - pt 2
Thread-Topic: Clang-format configuration discussion - pt 2
Thread-Index:
 AQHaHhwDfni7SbjBtk6S7YLD/w4HebCJbICAgAAi9QCABIyNgIAAK/0AgAAEPICAAAbTgA==
Date: Mon, 27 Nov 2023 15:37:43 +0000
Message-ID: <8DE85ED0-2949-4FF1-832B-ABEDC86BF13B@arm.com>
References: <1B83FF45-E93B-47D7-AD21-615CFCFD0816@arm.com>
 <1e770335-9606-4e9a-9f96-d04834675426@suse.com>
 <3E69667A-BB66-427D-A907-FA1537CFA1CC@arm.com>
 <838395c3-41ba-4004-abf1-948b655a5ef2@suse.com>
 <B5AF6A9F-3986-4F3C-90F7-122D63A2B31A@arm.com>
 <a99681e4-e201-4abe-bf6a-fda61674074e@suse.com>
In-Reply-To: <a99681e4-e201-4abe-bf6a-fda61674074e@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|AS2PR08MB9786:EE_|AM3PEPF0000A796:EE_|DBBPR08MB6266:EE_
X-MS-Office365-Filtering-Correlation-Id: 3598a330-5a69-4e1a-8906-08dbef5ed4b6
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 PyS9cUjttySj+EVBDXIeJCwphM77Oh1nDC9vR2Wpbe9EfJIl2o1+5wQS4ZEYkQ/Umrk08pHJaIvoXPdNs+bCAMKEPXC369YmCjQdL4RGQ591JmZDcGwq1iDWfjkAPPA/sghxBOCZVXikjRxiE73BDwX7SOijFMlKbKp9+siQITrdA8nScitYoJziWPBJmLnEH8/IR3a62PklQlYpBmZSBU3bAukyM1BtJQKqLgq6AHHiMcC5Orq0mvHZw6voeeG+FP/VuIAExcUKwk7SRbquYR9bPmyciBho70uwrbILJjbrekW1snoHsCzbIi/6M4GcpWUKHTWrsXOPiB4mjxpeM+aiqF3l65gteICzesqfDN2hMoIGvwb7OV1jHsnCI0q/IHFkij4uYiI0G5Na9y9lFjogX2L5zzQ+kj5+qt4MUUHwAc0V0Ddcx0APvzc9VBT9Oa6J8UcuaGhCsneOpxNQ7T+uM1/ynQBxj3KpTn412V+nH/R0MezMzQ8+X2FaLHR/tkcbOsWjT5SiRK60UrYoLYeyGUvtEs4Bnaw1FXdgec46bRH5LTfaXW7cI1WD3jyWD6ZSn3qXU7y1Nzd0AhFBt8sJ3eqzyikSSM9lhLZ7J6KqFhpZqR5FMXVvbVYGMQElRgHrI17tgJg0WeXjR/4eGcKg6s16q2+gkYpmfiuFeK5th1r9AAlxNcYG2aRBMCMA
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(366004)(136003)(396003)(376002)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(71200400001)(8936002)(8676002)(4326008)(6512007)(6506007)(53546011)(64756008)(316002)(91956017)(66556008)(66946007)(6916009)(54906003)(76116006)(966005)(6486002)(478600001)(122000001)(36756003)(38100700002)(41300700001)(38070700009)(33656002)(86362001)(26005)(2906002)(66476007)(2616005)(83380400001)(5660300002)(66446008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <DB03494A459FA642AC188B39D9B83D7B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9786
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF0000A796.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e0042cc7-0d7c-45cb-6c3e-08dbef5ecc7c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lp8vP6haPsikc+72DF7Dfqm2IIX3UDrkV6fwkRMyYqaGBqN5Y74ZFzvXRPCyXTWIHXqzCQjyVL9QDKFAekGnerMyJzf0hWxyywYWUrLPukLSug6Ehxg6flkjoOVG03J89EAzJlxFEthLj4LJi+TYRXznrtAzyRvlGfuM+l2OE3K+NudNGxW5+ZY46lTHr3Oj+rIA3u0SYk6bEAMk1zJFoBmsaWWcpVKfX1SBBwhZEQrdmMa1E6c924XPtxXAw4j7nTJlkhZcyyPOa2mZGhdJaOJSZk0YUT9/ppt+4lC+IY2ADld5zMOY6+E9BM/+QN6V+aAa81GcUdLIpDuH6EjrnJcGmCm1JHMSn3E+DFyDBAEzusjjG/xkSuMDEHA5OrHInhYZBqUZXHtUWEKneXck9mRVCkACgqisYvc4rqGQQOzy0qzGsS2/HwmjBuYLLvEwiLn/Ay+XaHBZ3EDToPHP+k+DsSa7O3ldBpDiLwxR9NxSveosV9BDevja2eLZENhSzpb7TwhXjRptzw0xSeTqCpYgav6c5NYmisbyvgUJtVp/eNrAivuIVPRlFlF7zdkhz06ZbkstPicjzMauoLUHko1dAo8qGyEK73F3KPTBY42QZw8zfuPat1lRc/jLWUmkf61sNMu6T0gM4a8nAicaQnIHfM6ZG86H13fTwuGcOjlpKUkFJFNEHjFTcGBfjoiwW+Heid3/y0c/AaaZiSVjhC9S2eCiVeffoCvx3dCTVc0eecJ74J5rSQPi/7AdQ/4+Tzh0bNPq5O35EMojTe+/VA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(376002)(136003)(396003)(346002)(230922051799003)(82310400011)(1800799012)(451199024)(186009)(64100799003)(46966006)(40470700004)(36840700001)(83380400001)(81166007)(356005)(47076005)(336012)(82740400003)(8936002)(6512007)(6506007)(6862004)(8676002)(316002)(966005)(70206006)(70586007)(36860700001)(53546011)(54906003)(86362001)(4326008)(6486002)(478600001)(5660300002)(33656002)(40480700001)(41300700001)(2906002)(36756003)(26005)(2616005)(40460700003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2023 15:37:57.7128
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3598a330-5a69-4e1a-8906-08dbef5ed4b6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A796.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6266

DQoNCj4gT24gMjcgTm92IDIwMjMsIGF0IDE1OjEzLCBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOg0KPiANCj4gT24gMjcuMTEuMjAyMyAxNTo1OCwgTHVjYSBGYW5jZWxsdSB3
cm90ZToNCj4+PiBPbiAyNyBOb3YgMjAyMywgYXQgMTI6MjAsIEphbiBCZXVsaWNoIDxqYmV1bGlj
aEBzdXNlLmNvbT4gd3JvdGU6DQo+Pj4gT24gMjQuMTEuMjAyMyAxNTo1MiwgTHVjYSBGYW5jZWxs
dSB3cm90ZToNCj4+Pj4+IE9uIDI0IE5vdiAyMDIzLCBhdCAxMjo0NywgSmFuIEJldWxpY2ggPGpi
ZXVsaWNoQHN1c2UuY29tPiB3cm90ZToNCj4+Pj4+IE9uIDIzLjExLjIwMjMgMTU6NDcsIEx1Y2Eg
RmFuY2VsbHUgd3JvdGU6DQo+Pj4+Pj4gTGV04oCZcyBjb250aW51ZSB0aGUgZGlzY3Vzc2lvbiBh
Ym91dCBjbGFuZy1mb3JtYXQgY29uZmlndXJhdGlvbiwgdGhpcyBpcyBwYXJ0IDIsIHByZXZpb3Vz
IGRpc2N1c3Npb25zIGFyZToNCj4+Pj4+PiANCj4+Pj4+PiAtIGh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvYXJjaGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAyMy0xMS9tc2cwMDQ5OC5odG1sDQo+
Pj4+Pj4gDQo+Pj4+Pj4gWW91IGNhbiBmaW5kIHRoZSBzZXJpZSBpbnRyb2R1Y2luZyBjbGFuZy1m
b3JtYXQgaGVyZToNCj4+Pj4+PiBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3Qv
eGVuLWRldmVsL2NvdmVyLzIwMjMxMDMxMTMyMzA0LjI1NzM5MjQtMS1sdWNhLmZhbmNlbGx1QGFy
bS5jb20vDQo+Pj4+Pj4gYW5kIHRoZXJlIGlzIGFsc28gYSBwYXRjaCBsaW5rZWQgdG8gbXkgZ2l0
bGFiIGFjY291bnQgd2hlcmUgeW91IGNhbiBmaW5kIHRoZSBvdXRwdXQgZm9yIHRoZSBoeXBlcnZp
c29yIGNvZGUuDQo+Pj4+Pj4gDQo+Pj4+Pj4gRm9yIGEgZnVsbCBsaXN0IG9mIGNvbmZpZ3VyYWJs
ZXMgYW5kIHRvIGZpbmQgdGhlIHBvc3NpYmxlIHZhbHVlcyBmb3IgdGhlbSwgcGxlYXNlIHJlZmVy
IHRvIHRoaXMgcGFnZToNCj4+Pj4+PiBodHRwczovL2NsYW5nLmxsdm0ub3JnL2RvY3MvQ2xhbmdG
b3JtYXRTdHlsZU9wdGlvbnMuaHRtbA0KPj4+Pj4+IA0KPj4+Pj4+IC0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tDQo+Pj4+Pj4gDQo+Pj4+Pj4gT3VyIGNvZGluZyBzdHlsZSBkb2VzbuKA
mXQgbWVudGlvbiBhbnl0aGluZyBhYm91dCBhbGlnbm1lbnQsIHNoYWxsIHdlIGFkZCBhIG5ldyBz
ZWN0aW9uPw0KPj4+Pj4+IEkgY2FuIHNlbmQgcGF0Y2hlcyB3aGVuIHdlIHJlYWNoIGFncmVlbWVu
dCBvbiBlYWNoIG9mIHRoZXNlIHJ1bGVzLg0KPj4+Pj4+IA0KPj4+Pj4+IA0KPj4+Pj4+IFF1YWxp
ZmllckFsaWdubWVudDogQ3VzdG9tDQo+Pj4+Pj4gUXVhbGlmaWVyT3JkZXI6IFsnc3RhdGljJywg
J2lubGluZScsICdjb25zdCcsICd2b2xhdGlsZScsICd0eXBlJ10NCj4+Pj4+PiANCj4+Pj4+PiAt
LS0NCj4+Pj4+PiBGb3Ig4oCcUXVhbGlmaWVyQWxpZ25tZW504oCdIEkgY2hvc2UgQ3VzdG9tIGlu
IG9yZGVyIHRvIGFwcGx5IGluIOKAnFF1YWxpZmllck9yZGVy4oCdIGFuIG9yZGVyIGZvciB0aGUN
Cj4+Pj4+PiBxdWFsaWZpZXJzIHRoYXQgbWF0Y2ggdGhlIGN1cnJlbnQgY29kZWJhc2UsIHdlIGNv
dWxkIHNwZWNpZnkgYWxzbyDigJxMZWF2ZeKAnSBpbiBvcmRlciB0byBrZWVwDQo+Pj4+Pj4gdGhl
bSBhcyB0aGV5IGFyZS4NCj4+Pj4+IA0KPj4+Pj4gV2hlcmUgZG8gYXR0cmlidXRlcyBnbyBpbiB0
aGlzIHNlcXVlbmNlPw0KPj4+PiANCj4+Pj4gSSB0aGluayBmdW5jdGlvbiBkZWNsYXJhdGlvbi9k
ZWZpbml0aW9uIGFuZCB2YXJpYWJsZXMuDQo+Pj4gDQo+Pj4gSG93IGRvZXMgdGhpcyByZWxhdGUg
dG8gbXkgcXVlc3Rpb24/IEkgYXNrZWQgYWJvdXQgdGhlIHNlcXVlbmNlIG9mIGVsZW1lbnRzDQo+
Pj4gbGlzdGVkIGZvciBRdWFsaWZpZXJPcmRlcjosIHdoZXJlIGF0dHJpYnV0ZXMgZG9uJ3QgYXBw
ZWFyIGF0IGFsbCByaWdodCBub3cuDQo+PiANCj4+IFNvcnJ5LCBJIG1pc3JlYWQgeW91ciBxdWVz
dGlvbiwgYXR0cmlidXRlcyBhcmUgbGlrZSBpbnZpc2libGUgZm9yIHRoZSB0b29sLCB0aGV5IGNh
biBiZSBwbGFjZWQgd2hlcmV2ZXIgYmV0d2Vlbg0KPj4gZWFjaCBvZiB0aGUgUXVhbGlmaWVyT3Jk
ZXIgaXRlbXMuDQo+IA0KPiBIb2hvLCBvbmUgdGhpbmcgd2hlcmUgdmFyaW91cyBvcHRpb25zIGFy
ZSB0b2xlcmF0ZWQuDQo+IA0KPj4+Pj4+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
DQo+Pj4+Pj4gDQo+Pj4+Pj4gQWxpZ25BZnRlck9wZW5CcmFja2V0OiBBbGlnbg0KPj4+Pj4+IA0K
Pj4+Pj4+IC0tLQ0KPj4+Pj4+IFRoaXMgb25lIGlzIHRvIGFsaWduIGZ1bmN0aW9uIHBhcmFtZXRl
cnMgdGhhdCBvdmVyZmxvd3MgdGhlIGxpbmUgbGVuZ3RoLCBJIGNob3NlIHRvIGFsaWduIHRoZW0N
Cj4+Pj4+PiB0byB0aGUgb3BlbiBicmFja2V0IHRvIG1hdGNoIHRoZSBjdXJyZW50IGNvZGViYXNl
IChob3BlZnVsbHkpDQo+Pj4+Pj4gDQo+Pj4+Pj4gZS5nLjoNCj4+Pj4+PiBzb21lTG9uZ0Z1bmN0
aW9uKGFyZ3VtZW50MSwNCj4+Pj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGFyZ3Vt
ZW50Mik7DQo+Pj4+PiANCj4+Pj4+IFRoZSBhYm92ZSBtYXRjaGVzIG5laXRoZXIgb2YgdGhlIHR3
byBnZW5lcmFsbHkgcGVybWl0dGVkIHN0eWxlczoNCj4+Pj4+IA0KPj4+Pj4gIHNvbWVMb25nRnVu
Y3Rpb24oYXJndW1lbnQxLA0KPj4+Pj4gICAgICAgICAgICAgICAgICAgYXJndW1lbnQyKTsNCj4+
Pj4+IA0KPj4+Pj4gIHNvbWVMb25nRnVuY3Rpb24oDQo+Pj4+PiAgICAgIGFyZ3VtZW50MSwNCj4+
Pj4+ICAgICAgYXJndW1lbnQyKTsNCj4+Pj4+IA0KPj4+Pj4gVGhlbiBhZ2FpbiBmcm9tIGl0cyBu
YW1lIEkgd291bGQgaW5mZXIgdGhpcyBpc24ndCBqdXN0IGFib3V0IGZ1bmN0aW9uDQo+Pj4+PiBh
cmd1bWVudHM/DQo+Pj4+IA0KPj4+PiBJIHRoaW5rIGl0IGFwcGxpZXMgdG8gcGFyYW1ldGVycyBh
bmQgYXJndW1lbnRzIG9mIGZ1bmN0aW9ucyBhbmQgbWFjcm8sIGdpdmVuIHRoZSBkZXNjcmlwdGlv
biBpbiB0aGUgZG9jcy4NCj4+Pj4gDQo+Pj4+IEkgc2VlIHlvdXIgdHdvIHNuaXBwZXRzIGFib3Zl
IGJ1dCBJ4oCZdmUgYWx3YXlzIGZvdW5kIGF0IGxlYXN0IG9uIGFybSBhIHByZWRvbWluYW5jZSBv
Zg0KPj4+PiB0aGUgc3R5bGUgYWJvdmUgZm9yIGZ1bmN0aW9ucywgc28gYXJndW1lbnRzIGFsaWdu
ZWQgYWZ0ZXIgdGhlIG9wZW5pbmcgYnJhY2tldCwgZm9yIG1hY3Jvcw0KPj4+PiB0aGVyZSBpcyBh
IG1peC4NCj4+PiANCj4+PiBUaGUgbGF0dGVyICJhYm92ZSIgcmVmZXJzIHRvIHdoaWNoIGZvcm0g
ZXhhY3RseT8gVGhlIG9uZSB5b3Ugb3JpZ2luYWxseQ0KPj4+IHNwZWxsZWQgb3V0LCBvciB0aGUg
Zm9ybWVyIG9mIHdoYXQgbXkgcmVwbHkgaGFkPw0KPj4gDQo+PiBJbiBteSByZXBseSBJIHdhcyBy
ZWZlcnJpbmcgdG8gdGhlIG9uZSBJIG9yaWdpbmFsbHkgc3BlbGxlZCBvdXQuDQo+IA0KPiBCdXQg
dGhhdCdzIHByb3Blcmx5IG1hbGZvcm1lZCwgZm9yIG5vdCBhbGlnbmluZyBhcmd1bWVudDIgd2l0
aCBhcmd1bWVudDEuDQo+IFdoZXJlIGFyZSBzdWNoIGNvbnN0cnVjdHMgY29tbW9ubHkgdXNlZD8g
SSBqdXN0IHRvb2sgb25lIGV4YW1wbGUgKGNwdWVycmF0YS5jKQ0KPiBhbmQgb25seSBmb3VuZCBt
eSBmaXJzdCBmb3JtIG9mIHdyYXBwaW5nLg0KDQpJIGhhZCB0byBnbyBiYWNrIHRvIHRoZSB0aHJl
YWQgdG8gcmVhbGlzZSB0aGVyZSB3YXMgc29tZSBzdHlsZSBpc3N1ZSwgdGhlIHNuaXBwZXQgSSB0
aG91Z2h0DQpJIHNlbnQgYWxyZWFkeSBoYWQgYXJndW1lbnQyIGFsaWduZWQgdW5kZXIgYXJndW1l
bnQxLCBsaWtlIHRoaXM6DQoNCmUuZy46DQpzb21lTG9uZ0Z1bmN0aW9uKGFyZ3VtZW50MSwNCiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYXJndW1lbnQyKTsNCg0KRXZlbiBteSB3b3Jk
aW5nIHdhcyBub3QgcmVhbGx5IGFjY3VyYXRlLCBhcyBJIG1lYW50Og0K4oCcVGhpcyBvbmUgaXMg
dG8gYWxpZ24gZnVuY3Rpb24gcGFyYW1ldGVycyB0aGF0IG92ZXJmbG93cyB0aGUgbGluZSBsZW5n
dGgsIEkgY2hvc2UgdG8gYWxpZ24gdGhlbQ0KKmFmdGVyKiB0aGUgb3BlbiBicmFja2V0IHRvIG1h
dGNoIHRoZSBjdXJyZW50IGNvZGViYXNlIChob3BlZnVsbHkp4oCdDQoNClNvIHRvIHN1bW1hcml6
ZSwgdGhpcyB2YWx1ZSBmb3JtYXRzIHRoZSBjb2RlIHRvIGhhdmUgb3ZlcmZsb3dpbmcgYXJncy9w
YXJhbSBhbGlnbmVkIGFmdGVyDQp0aGUgb3BlbiBicmFrZXQuDQoNCkJ1dCBJIHVuZGVyc3RhbmQg
dGhhdCBoYXZpbmcgb25seSBvbmUgZm9ybWF0IGlzIG5vdCBkZXNpcmFibGUuDQoNCj4gDQo+IEph
bg0KPiANCg0K

