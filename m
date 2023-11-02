Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52BF37DE94E
	for <lists+xen-devel@lfdr.de>; Thu,  2 Nov 2023 01:27:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626701.977191 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyLXl-0001vj-8O; Thu, 02 Nov 2023 00:26:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626701.977191; Thu, 02 Nov 2023 00:26:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyLXl-0001sW-5T; Thu, 02 Nov 2023 00:26:41 +0000
Received: by outflank-mailman (input) for mailman id 626701;
 Thu, 02 Nov 2023 00:26:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y1wU=GP=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qyLXj-0001sN-HZ
 for xen-devel@lists.xenproject.org; Thu, 02 Nov 2023 00:26:39 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20627.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::627])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7b98b500-7916-11ee-98d6-6d05b1d4d9a1;
 Thu, 02 Nov 2023 01:26:37 +0100 (CET)
Received: from AM0PR08CA0032.eurprd08.prod.outlook.com (2603:10a6:208:d2::45)
 by AS8PR08MB6200.eurprd08.prod.outlook.com (2603:10a6:20b:292::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.29; Thu, 2 Nov
 2023 00:26:34 +0000
Received: from AM3PEPF0000A797.eurprd04.prod.outlook.com
 (2603:10a6:208:d2:cafe::49) by AM0PR08CA0032.outlook.office365.com
 (2603:10a6:208:d2::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.19 via Frontend
 Transport; Thu, 2 Nov 2023 00:26:34 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM3PEPF0000A797.mail.protection.outlook.com (10.167.16.102) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6954.19 via Frontend Transport; Thu, 2 Nov 2023 00:26:33 +0000
Received: ("Tessian outbound 20615a7e7970:v228");
 Thu, 02 Nov 2023 00:26:33 +0000
Received: from 93f59d61cafb.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 BBE28683-B3D6-4E22-B76A-95054C3FFD28.1; 
 Thu, 02 Nov 2023 00:26:27 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 93f59d61cafb.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 02 Nov 2023 00:26:27 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DU5PR08MB10634.eurprd08.prod.outlook.com (2603:10a6:10:51c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.29; Thu, 2 Nov
 2023 00:26:24 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::ae6e:f96c:f2f3:efc9]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::ae6e:f96c:f2f3:efc9%4]) with mapi id 15.20.6954.019; Thu, 2 Nov 2023
 00:26:23 +0000
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
X-Inumbo-ID: 7b98b500-7916-11ee-98d6-6d05b1d4d9a1
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=e0W8Yp8LjE1x77fkHek3bP77BaQVl4PjgelCWifRxWniSHEhkfzA56hdlHaj0y0C/6Zg95UiB51JNEwjYwCu2352X+xq8CBCuufhuzPjUP9yLc2MhQSAy1SbBcWWCjPTPangVNA1B+Uwdk7WtgFUqowmGRdjh3rEAK/K9ZhI1RWt6cW6237WUYQOXqyFELuqPw6yJoBAvYrHw9TB4oqeCbgHF6UZtT/kkumBHbIXhwdIE/X28Xc6lOgyDg2v9MVM59xosspnuo59OQkAQz3nwa/1JhngMBaxoD/7Jw/vBNxknTw0KC8d/kdThVwRIa+8y8t8bMGdoLJwUzBJXMyjAg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l+xx6dDF8TT3KbcbkiNHfoWYhRPgmYTT5dC2i1/z2E4=;
 b=aK8iHgk+BMKkCuGN1HxCmnpnvqZL7EEgnKyZrDyKHLCJgDDHS+7P0mHb9/b+wnA1oZjokVHUeavQVi2mIMHtU1IGipWhC9JMPBtUb13CWZzylk+FjlLJn+BSsEoMCV+eA1Mkj5n81yb260Ug5QxCbFJ8C19qAjHc2fibloKRQyt00ctulrUDjDvtNzTaYcBlF3WRDbwAG3LFJaG6JZnHbuZfo94NnjqoCLO20WiYfIfY0PPlCvCj12N7597R13YDNAMVfOV2J9YD2Su7i94B8cVrv/27rjIS1fNxZSNlK6yn44xUgzGpxa9r1rXHVlpdrvw6/8TYUMol0Qfnykip3A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l+xx6dDF8TT3KbcbkiNHfoWYhRPgmYTT5dC2i1/z2E4=;
 b=HHK5GYVmFVWdaw0zJu+lsbdBVuDhWjo8oeKyZw7miZNSg+3S0dhyq/tiDZN57ltPfAshiLvetzVbKehtgwwpZz/pYQ0TwsHBx64FTubPc48DDuKFhwJ8oO5OBcMhhClIjfV/7lKMxA+PUlFyTvkyP0oSp0NHi0XXAnJ4btzEqlk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: a56ca0576b01a7cb
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MkaXXqwWZBeDCDKk0UcLluy7Khh5ITk4eWPIaEtx44G8717JAXJhC+QHKVnHMjyuJWp18naN1x1/Y2UxCdCA88mRhvCdhTfZK1DFvOJUqzACE7SqLQTJ93BiOYH4iR0Q76rWwLb0w0w8Q0Afr/aUabry9tTTiXQEv2iDW0ZtHTkrHKgy2hHA5zEnkYEsHY4g7bq+4oWIavQG208asPLeRNWf3h7l5GG+nyAcQBd74SfmghXrgu9bQ/1kfmNGF115DQeb1FUVXICKEAWTfdrhbQ5EXbOe8aUyH24yrPJgCN6exvghJCAH6uuH02DAjVQ9JmkBSTcFjeptVjfPYghOqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l+xx6dDF8TT3KbcbkiNHfoWYhRPgmYTT5dC2i1/z2E4=;
 b=V5KmQJa57Zk4T2hTDUDaVTA7hVvvqtIShA5lk9EwUYtwO5/ymeOxHjmWkOCTJgGc/AemQVZLIjvBHewYa7Nw5AAIvfzC1mcsYYWwwoJbTXgk+mAsb7qSWrl3Xrh8xLRrdWFwDlU34zBPF5diypGfig5bHoMRx+LcIkAkinmUT7Tt08fRgI99nBiJ3Qgh0YHofFJI+oqtcatqYTgbYe3rcPIsy24MMoYykFi3oj+2q1+Zx/IfLCOGDxlURPi3OJvOgQ6XzyNFq3EYtxiC0dmm8ifPNsuefpCF7Hr50XAkkEirbtb1fzjjJ9sCn6tGlxUCm7CWV0UEcoK8KCxOMltL8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l+xx6dDF8TT3KbcbkiNHfoWYhRPgmYTT5dC2i1/z2E4=;
 b=HHK5GYVmFVWdaw0zJu+lsbdBVuDhWjo8oeKyZw7miZNSg+3S0dhyq/tiDZN57ltPfAshiLvetzVbKehtgwwpZz/pYQ0TwsHBx64FTubPc48DDuKFhwJ8oO5OBcMhhClIjfV/7lKMxA+PUlFyTvkyP0oSp0NHi0XXAnJ4btzEqlk=
From: Henry Wang <Henry.Wang@arm.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH for-4.18] x86/time: Fix UBSAN failure in
 __update_vcpu_system_time()
Thread-Topic: [PATCH for-4.18] x86/time: Fix UBSAN failure in
 __update_vcpu_system_time()
Thread-Index: AQHaDQNMdo+Q+JMNb0ag5u1DRain9LBmLFYA
Date: Thu, 2 Nov 2023 00:26:22 +0000
Message-ID: <90D9EFC1-E865-496F-A57D-4A6C2C84D756@arm.com>
References: <20231101203737.3441425-1-andrew.cooper3@citrix.com>
In-Reply-To: <20231101203737.3441425-1-andrew.cooper3@citrix.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DU5PR08MB10634:EE_|AM3PEPF0000A797:EE_|AS8PR08MB6200:EE_
X-MS-Office365-Filtering-Correlation-Id: eb807b22-91b3-4514-a692-08dbdb3a5e51
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 69jV6ySwaHvivJcA32njM+++6eaPNz4E9t7807Z7pDEhgBtji2qTClsonJ1Yv4sAjcBdRuTTEHLGRQS6W4AS8zKNlOD1aEmFGRIoUQiuVr3LR/Juu3v62WCM5bZP5KGaPWiYQS1jLwW5U4esucMILIxO+kUj8g2NcRb5CeASo6SsDiHSADCBq4FBrAidZkAePt9wfabkK9WWBRLkNCbfDnJ06UqsDVKstxCJ5m9JJaS5ehveUIhGNRnT30JFLMdpQiLN8zQYdjKm+W+EOvL+7r00H1BHATyiNakVhKieJAV3hULO4CoGMSsDEn23IYki5Zdvp7G+sHFYS4lf6i6T76PXkTrPle/9UvSVG9y3DkNUi2mU5BNc4vZ6yBAuiEBwjX5wh3t18aXzTf1B/09O9DMyyhzT3HDdxoM8b4poboRpe3/lNAMI/MDLa5RK2wD+7UZmkLgDss/kCXsW1DGfzk19tbOJiwtMOMiJO+mhILDphpR5kALuQINdB5/fqddUy5tpIcL4LqL7cVURFzkeeDY7UwmMRiVedj2rTUXTcKbNl2GBCE6uN3HKAnHKs4Xk6Q8NYPVn2GgI5QT2CscZmrFdyFAxNc+5FK3GzSpc26tbBTEbIuAxYDRJyhMedInE1e+NRgliINx9BpkTw67SfQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(366004)(396003)(39860400002)(346002)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(33656002)(36756003)(86362001)(26005)(53546011)(2616005)(71200400001)(122000001)(38070700009)(38100700002)(6506007)(83380400001)(6512007)(6486002)(478600001)(2906002)(54906003)(91956017)(66946007)(41300700001)(66446008)(316002)(66476007)(76116006)(6916009)(8936002)(66556008)(4326008)(8676002)(5660300002)(64756008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <0C518F11C1DB464B99A4A5F926F1E059@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR08MB10634
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF0000A797.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c5136df9-7588-42ef-a492-08dbdb3a57ae
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZNdNG1UveGfGSxPmZ82aWpK94ShVel+Mm4bgLfy/8ahIFamvWfZMfhkOFC3lW2xm4vUGVjYxti/dSPlGdHAaggWaNr3zRMuKZwiXXwcCSohAH0MlvxxWTZhISsStkmD2lWOJfBpOn/92fr/pKnTfwFdCfUMMlmv8LGsKIBCWFETa9CJu4a+pj+l3Lx9Wh03dBsvWbPow40bwEgODBRGHRw7iLDZ0wLQsi4imzHFAqvh9ge+zNh/4Cp57lBpoJOp+aE5W4AX3Lf88PqHgAXq6uFBbdNDFCvnbniCLYBqPL0Xj3BSLeRGiBTXEkVYHLlSkb1622eDhzqPplSJeABLh14hOEbNaNiwxEIeSG/nPY8F3bsImAgFp/mtS9Zp65vF0hs5UZJ3hK4o8vnvOO2SgCBSAwkp0a/LvmETXdkoucx6rbGpZHxEG5ZyosZOXlHLNkRCi/ppnE17dnclrAN1DP/DtzTDo/XXlxn/687tjSrEEUfA4wCp/4Enk/q/AkqUYzM1V9ExBn0WybdrneZ8JlNS8VbBezISkmbPLbKNwin469UU8qCVjnukjZftVHwWJ45GgtWBzall/ds0HicQgt1xASvHRiJNV7LRuYirNzQ/AC3LrKdOK6NwnUFA7OAP7tN6jBANcW4HwmAvwz3Now3IKo+eJjYZYhVmsRfxqbCVN1mHKFvYGhQik9dx8dQCAd5vhNDh7/309qkfPiWq15hRZ0y6IcV2HuyFo7mB2nrU=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(136003)(346002)(396003)(376002)(230922051799003)(82310400011)(64100799003)(186009)(1800799009)(451199024)(46966006)(36840700001)(40470700004)(6512007)(26005)(40460700003)(40480700001)(33656002)(82740400003)(36756003)(86362001)(81166007)(356005)(36860700001)(6506007)(83380400001)(2906002)(2616005)(478600001)(53546011)(47076005)(316002)(8936002)(8676002)(54906003)(6862004)(6486002)(336012)(4326008)(41300700001)(5660300002)(70586007)(70206006);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2023 00:26:33.9583
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eb807b22-91b3-4514-a692-08dbdb3a5e51
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A797.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6200

SGkgQW5kcmV3LA0KDQo+IE9uIE5vdiAyLCAyMDIzLCBhdCAwNDozNywgQW5kcmV3IENvb3BlciA8
YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6DQo+IA0KPiBBcyByZXBvcnRlZDoNCj4g
DQo+ICAoWEVOKSA9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0KPiAgKFhFTikgVUJTQU46IFVuZGVm
aW5lZCBiZWhhdmlvdXIgaW4gYXJjaC94ODYvdGltZS5jOjE1NDI6MzINCj4gIChYRU4pIG1lbWJl
ciBhY2Nlc3Mgd2l0aGluIG51bGwgcG9pbnRlciBvZiB0eXBlICd1bmlvbiB2Y3B1X2luZm9fdCcN
Cj4gIChYRU4pIC0tLS1bIFhlbi00LjE5LXVuc3RhYmxlICB4ODZfNjQgIGRlYnVnPXkgdWJzYW49
eSAgTm90IHRhaW50ZWQgXS0tLS0NCj4gIC4uLg0KPiAgKFhFTikgWGVuIGNhbGwgdHJhY2U6DQo+
ICAoWEVOKSAgICBbPGZmZmY4MmQwNDAzNDUwMzY+XSBSIGNvbW1vbi91YnNhbi91YnNhbi5jI3Vi
c2FuX2VwaWxvZ3VlKzB4YS8weGQyDQo+ICAoWEVOKSAgICBbPGZmZmY4MmQwNDAzNDU2ZTg+XSBG
IF9fdWJzYW5faGFuZGxlX3R5cGVfbWlzbWF0Y2grMHgxMzMvMHg0OWINCj4gIChYRU4pICAgIFs8
ZmZmZjgyZDA0MDM0NWI0YT5dIEYgX191YnNhbl9oYW5kbGVfdHlwZV9taXNtYXRjaF92MSsweGZh
LzB4ZmMNCj4gIChYRU4pICAgIFs8ZmZmZjgyZDA0MDYyMzM1Nj5dIEYgYXJjaC94ODYvdGltZS5j
I19fdXBkYXRlX3ZjcHVfc3lzdGVtX3RpbWUrMHgyMTIvMHgzMGYNCj4gIChYRU4pICAgIFs8ZmZm
ZjgyZDA0MDYyMzQ2MT5dIEYgdXBkYXRlX3ZjcHVfc3lzdGVtX3RpbWUrMHhlLzB4MTANCj4gIChY
RU4pICAgIFs8ZmZmZjgyZDA0MDYyMzg5ZD5dIEYgYXJjaC94ODYvdGltZS5jI2xvY2FsX3RpbWVf
Y2FsaWJyYXRpb24rMHgxZjcvMHg1MjMNCj4gIChYRU4pICAgIFs8ZmZmZjgyZDA0MDJhNjRiNT5d
IEYgY29tbW9uL3NvZnRpcnEuYyNfX2RvX3NvZnRpcnErMHgxZjQvMHgzMWENCj4gIChYRU4pICAg
IFs8ZmZmZjgyZDA0MDJhNjdhZD5dIEYgZG9fc29mdGlycSsweDEzLzB4MTUNCj4gIChYRU4pICAg
IFs8ZmZmZjgyZDA0MDVhOTVkYz5dIEYgYXJjaC94ODYvZG9tYWluLmMjaWRsZV9sb29wKzB4MmUw
LzB4MzY3DQo+ICAoWEVOKQ0KPiAgKFhFTikgPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0NCj4gDQo+
IEl0IGlzIG5vdCB2YWxpZCB0byBkZXJpdmUgYSBwb2ludGVyIGZyb20gdmNwdV9pbmZvKCkgcHJp
b3IgdG8gY2hlY2tpbmcgdGhhdA0KPiB0aGUgdW5kZXJseWluZyBtYXAgcG9pbnRlciBpcyBnb29k
Lg0KPiANCj4gUmVvcmRlciBhY3Rpb25zIHNvIHRoZSBOVUxMIHBvaW50ZXIgY2hlY2sgaXMgZmly
c3QuDQo+IA0KPiBGaXhlczogMjAyNzlhZmQ3MzIzICgieDg2OiBzcGxpdCBwb3B1bGF0aW5nIG9m
IHN0cnVjdCB2Y3B1X3RpbWVfaW5mbyBpbnRvIGEgc2VwYXJhdGUgZnVuY3Rpb24iKQ0KPiBTaWdu
ZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0KPiAt
LS0NCj4gQ0M6IEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4NCj4gQ0M6IFJvZ2VyIFBh
dSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KPiBDQzogV2VpIExpdSA8d2xAeGVuLm9y
Zz4NCj4gQ0M6IEhlbnJ5IFdhbmcgPEhlbnJ5LldhbmdAYXJtLmNvbT4NCj4gDQo+IDQuMTggYmxv
Y2tlciwgb3Igd2UnbGwgbmVlZCB0byBpc3N1ZSBhbiBYU0EvQ1ZFLg0KDQpSZWxlYXNlLWFja2Vk
LWJ5OiBIZW5yeSBXYW5nIDxIZW5yeS5XYW5nQGFybS5jb20+DQoNCktpbmQgcmVnYXJkcywNCkhl
bnJ5DQoNCg==

