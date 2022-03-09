Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 735C64D2CCC
	for <lists+xen-devel@lfdr.de>; Wed,  9 Mar 2022 11:09:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.287664.487750 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRtFB-0002jF-M5; Wed, 09 Mar 2022 10:08:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 287664.487750; Wed, 09 Mar 2022 10:08:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRtFB-0002hO-IT; Wed, 09 Mar 2022 10:08:33 +0000
Received: by outflank-mailman (input) for mailman id 287664;
 Wed, 09 Mar 2022 10:08:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=l1b7=TU=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1nRtFA-0002hI-5H
 for xen-devel@lists.xenproject.org; Wed, 09 Mar 2022 10:08:32 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20618.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::618])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id de1fe077-9f90-11ec-8539-5f4723681683;
 Wed, 09 Mar 2022 11:08:29 +0100 (CET)
Received: from DB6P195CA0008.EURP195.PROD.OUTLOOK.COM (2603:10a6:4:cb::18) by
 AS8PR08MB6198.eurprd08.prod.outlook.com (2603:10a6:20b:29f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Wed, 9 Mar
 2022 10:08:27 +0000
Received: from DB5EUR03FT043.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:cb:cafe::23) by DB6P195CA0008.outlook.office365.com
 (2603:10a6:4:cb::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.27 via Frontend
 Transport; Wed, 9 Mar 2022 10:08:27 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT043.mail.protection.outlook.com (10.152.20.236) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5017.22 via Frontend Transport; Wed, 9 Mar 2022 10:08:27 +0000
Received: ("Tessian outbound 741ca6c82739:v113");
 Wed, 09 Mar 2022 10:08:27 +0000
Received: from b7ff1ce5404b.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 EC92B02E-62D2-4054-8D2D-02D7C996756E.1; 
 Wed, 09 Mar 2022 10:08:16 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b7ff1ce5404b.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 09 Mar 2022 10:08:16 +0000
Received: from AM5PR0801MB2020.eurprd08.prod.outlook.com
 (2603:10a6:203:4c::14) by AM0PR08MB4497.eurprd08.prod.outlook.com
 (2603:10a6:208:146::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Wed, 9 Mar
 2022 10:08:12 +0000
Received: from AM5PR0801MB2020.eurprd08.prod.outlook.com
 ([fe80::253a:4d6c:61c9:af60]) by AM5PR0801MB2020.eurprd08.prod.outlook.com
 ([fe80::253a:4d6c:61c9:af60%10]) with mapi id 15.20.5038.027; Wed, 9 Mar 2022
 10:08:12 +0000
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
X-Inumbo-ID: de1fe077-9f90-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1NqrgC1THxgaW5C43pa9FzKLabTMVFbpvPR9iPIaIW8=;
 b=N8678q6FFGjZIqBF6CHc68m7b+jasxU9MEwoUdZ/bFoN27xyq+eKH7t6+2nKbbkkCrD9jXfpgbQRu0oPJuQA8kBNCVhMPudk/5Lc1EkXPYrKlquUJStA+XqFxqcwYMeDH6DmajKFcIB0d7noNSNFlcP9bp1w9Eq79rJ8QmGJNNU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 44af579204173c4e
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lBV540qrPSxiKGWKFm3X7oXplc2djqWjqGZ1WDstXYMR9eeFrOk1fWcvVKa37TN8wHtrtRhl5x+bSNxrgUF1yH31L8tD7LUBYQSrk0dG19d36Ca+LRB1tzhqEqIpYWJOCt3JGlcm4+oU1rGsCogjtsqfqRG3/ott2EBeeme3v6QeCIp4DK0aASzSPPpt6UkKV4WZZJmOeyNRyQtmnSl9lSLVn9J98oJ8+m5yKciE5Qs1ktwUsdaK3pwwm+9ZllVwWEjgGYcY8eBGoKU7m9idQMnbx/7rw0iD4j1ja83lKYE49PIWBVeBYNPwHPBGhq9pysGNZuIsjaKt/QZJ9DOG/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1NqrgC1THxgaW5C43pa9FzKLabTMVFbpvPR9iPIaIW8=;
 b=M029LXHAqoID5CIiw8O3A1I7w1lhYAo9lh5d3sEnUNsLogX44X3Cm19npPNkOoQrWbyVXCVaa5Y3GljtM4lkH1xC6+BrB9BaoVwWycB07D5HWs1QeMfMdOWmXwHEjpydaT8WbvJqF6lNUOWgGS9xVMmEmrChU9dtnoYqqNLfjns1yGt3RWFzBAfuVtPqSQFuyoXEdj9dodfBzts7ndjLS+/oMzY0nBfhVw/1TYG/1WraUrqtuZiIeJYJ4wLNPluaf5KdWlSwMXbfyubcmJA6S738l9lONPkOnU5h/HUsl5ZdLoomG2aDJjMIEENcg/PspvR8CHH51EkAN4taDTSeYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1NqrgC1THxgaW5C43pa9FzKLabTMVFbpvPR9iPIaIW8=;
 b=N8678q6FFGjZIqBF6CHc68m7b+jasxU9MEwoUdZ/bFoN27xyq+eKH7t6+2nKbbkkCrD9jXfpgbQRu0oPJuQA8kBNCVhMPudk/5Lc1EkXPYrKlquUJStA+XqFxqcwYMeDH6DmajKFcIB0d7noNSNFlcP9bp1w9Eq79rJ8QmGJNNU=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v2 1/3] xen/vpci: msix: move x86 specific code to x86 file
Thread-Topic: [PATCH v2 1/3] xen/vpci: msix: move x86 specific code to x86
 file
Thread-Index:
 AQHYIoBoEZVl6/zkE0mK7dGMpvA2Zqyi2K6AgAfEbQCAAAXLAIADUEkAgAD5MYCACAnKAA==
Date: Wed, 9 Mar 2022 10:08:12 +0000
Message-ID: <1205992D-ACE4-4E94-B554-3B14F6D9697E@arm.com>
References: <cover.1644937405.git.rahul.singh@arm.com>
 <4d2a727ba218468e4f347dc12ca051a0534fe205.1644937405.git.rahul.singh@arm.com>
 <6e188f87-7e4c-00ee-dd0c-373d42acec34@suse.com>
 <6BFB9B87-D8A1-442D-B4DC-18760C59D7BF@arm.com>
 <c11278f4-c902-0eb9-ac59-e27c0f2ba912@suse.com>
 <41F03A07-F8D6-423D-9E40-F4B89C611C87@arm.com>
 <175a55cc-70b4-4832-9a78-0db57a9ae4a4@suse.com>
In-Reply-To: <175a55cc-70b4-4832-9a78-0db57a9ae4a4@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 1b7a4801-03ae-442c-10db-08da01b4c12e
x-ms-traffictypediagnostic:
	AM0PR08MB4497:EE_|DB5EUR03FT043:EE_|AS8PR08MB6198:EE_
X-Microsoft-Antispam-PRVS:
	<AS8PR08MB61984122C0D8E252612FFDF9FC0A9@AS8PR08MB6198.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 kPjH2Vh195JRwnkRbHAPrTcjW0eEfYdGZ7IauAe3PZwDhwwCHpah/qnHVWT0sJ2TV8aek7fJMeOdesDcK8gECQbvtBgDbBHJ6MFmYl/PkXndT5UdsqP3BBJXQsUHzAlylQEghSaBZUG1uxl03H8RRYm/eT/eP6P0wW3Qt6yTzdP8LgBczD2XDMhHEYZcc7zI34RGhlwH1MXO6qrM61sfRT22/eGFz0dCI96JdW2rFpasfiZTQ5XmTcN9zUAUdqNxo3npLtlL66p7YrxoKxPmeZk1Sj2mAJyZESSIWYw6neh7KdchuzzvngW/7dDI10+W5+U+9TXSQT9LvqP94GTYQO8UkAbAFGqDtrOAIS2ZHXS65hGvi/6euCSv/xo40RExfcdMrPP/4p+mBexP7HIQT8whiElhava0/AtPvmd2WEFic2eA7Qh/S5DAdSiAlS1Y4ov/ZmGHlBSM6hxj1z3JqwSbTlbLCqC6qTTeS5HFwOhv5wBJnTSvscaaFAzZBFR0s8nd4mkhD7QgJxCQZ4Z//uL4OtcxC43PKSgS7xolLuTOfqwcVeNCjr+XXJn+sWO9TVKIluyHQKRDQOJPnVGxr6aCWC0ErO4yyqrPOjh9IxLKlQ8TlkGWgp9xp2HTuxjqQh2aFsk+Gp/kiMsPaUaxGIWy5AUNjfluqnXHqz9Sqw1574mjc/BbZkOXzSsIMIhNWsI5aWIoRDLCS2dF7Myubxf/zjTIZdCngXzCdkzqTvKkLocNUklumW00rEXHdzu/
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR0801MB2020.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(26005)(186003)(2906002)(66446008)(66946007)(316002)(2616005)(6916009)(54906003)(33656002)(8676002)(38070700005)(36756003)(71200400001)(508600001)(53546011)(6512007)(6506007)(64756008)(66476007)(66556008)(4326008)(122000001)(83380400001)(38100700002)(6486002)(76116006)(91956017)(5660300002)(8936002)(86362001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <20F843390214B24B9C219C8F9C74529A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4497
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c813de09-aee6-4c0b-faa1-08da01b4b886
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	l3NnLdr766/roK4hzLBgAlWSXbVRnp4/AKraSjE9jwIQhRot3wfO1PlsMKMkQbt0MZlwSTH2yLxse1BftdQ3TpVJY7RmZTr6cRBaicMfobiTs/r/PxtfSGMMjm3of7xZh24FzKbeejaWhZiRFeXthGC1WogTKNLDOVzVNekj4zwxGogfcqZni335SdUkcUu4K//XHZDN1ei0dNm8mTu92aYb2oHeMH+DfWoF8ooJdujNiQeIErU3KE2Q8V+7UF1ztCs2vtU2i3BjlP088VG770J/5LgplHgSewsI6gj1SyzCDNHKuu2/TzC0R5PvB3XzD1n0S+lqRB0IHugnCJYOWbQhhObhgCsOagptK+LxuZhY4TYO0e0oFiVCPRnOWSXJLMtEeoTe3u5wt0/8NX0y5h7MX/xb9XiXvFoVTQ8Xbgy3JESPEidg5JOFXIjLM8xBXs3TGW55NMKJ4Cw4YN9vJLVQVkAX2xsYRy8cfoHn/VdMewX98kEJe5PG8a9YFdkUG3mACDx1m/Tml31wje5IPPYAuAC25Y9SixrR5zYJIu8TjT5rKZnSQQMUNTCO1iwrwkHP9QB8hiRGntKTV7FfuENpXA/G+NuCKakgNwWEvUms6yQy1sABLT+J/r+HRbHHxtZnQ5/eNSreKo2Z5QZW2+7Rq/oBurqQdggtYojclBAE2zriWP9eJ357H1D245VB
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(6862004)(8676002)(86362001)(356005)(54906003)(316002)(70206006)(81166007)(70586007)(36756003)(6486002)(36860700001)(508600001)(40460700003)(4326008)(186003)(26005)(5660300002)(2616005)(83380400001)(33656002)(47076005)(8936002)(336012)(53546011)(6506007)(2906002)(82310400004)(6512007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2022 10:08:27.3109
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b7a4801-03ae-442c-10db-08da01b4c12e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6198

SGkgSmFuLA0KDQo+IE9uIDQgTWFyIDIwMjIsIGF0IDc6MjMgYW0sIEphbiBCZXVsaWNoIDxqYmV1
bGljaEBzdXNlLmNvbT4gd3JvdGU6DQo+IA0KPiBPbiAwMy4wMy4yMDIyIDE3OjMxLCBSYWh1bCBT
aW5naCB3cm90ZToNCj4+PiBPbiAxIE1hciAyMDIyLCBhdCAxOjU1IHBtLCBKYW4gQmV1bGljaCA8
amJldWxpY2hAc3VzZS5jb20+IHdyb3RlOg0KPj4+IE9uIDAxLjAzLjIwMjIgMTQ6MzQsIFJhaHVs
IFNpbmdoIHdyb3RlOg0KPj4+Pj4gT24gMjQgRmViIDIwMjIsIGF0IDI6NTcgcG0sIEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4gd3JvdGU6DQo+Pj4+PiBPbiAxNS4wMi4yMDIyIDE2OjI1
LCBSYWh1bCBTaW5naCB3cm90ZToNCj4+Pj4+PiAtLS0gYS94ZW4vYXJjaC94ODYvaHZtL3Ztc2ku
Yw0KPj4+Pj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9odm0vdm1zaS5jDQo+Pj4+Pj4gQEAgLTkyNSw0
ICs5MjUsMTA2IEBAIGludCB2cGNpX21zaXhfYXJjaF9wcmludChjb25zdCBzdHJ1Y3QgdnBjaV9t
c2l4ICptc2l4KQ0KPj4+Pj4+IA0KPj4+Pj4+ICAgcmV0dXJuIDA7DQo+Pj4+Pj4gfQ0KPj4+Pj4+
ICsNCj4+Pj4+PiAraW50IHZwY2lfbWFrZV9tc2l4X2hvbGUoY29uc3Qgc3RydWN0IHBjaV9kZXYg
KnBkZXYpDQo+Pj4+Pj4gK3sNCj4+Pj4+PiArICAgIHN0cnVjdCBkb21haW4gKmQgPSBwZGV2LT5k
b21haW47DQo+Pj4+Pj4gKyAgICB1bnNpZ25lZCBpbnQgaTsNCj4+Pj4+PiArDQo+Pj4+Pj4gKyAg
ICBpZiAoICFwZGV2LT52cGNpLT5tc2l4ICkNCj4+Pj4+PiArICAgICAgICByZXR1cm4gMDsNCj4+
Pj4+PiArDQo+Pj4+Pj4gKyAgICAvKiBNYWtlIHN1cmUgdGhlcmUncyBhIGhvbGUgZm9yIHRoZSBN
U0lYIHRhYmxlL1BCQSBpbiB0aGUgcDJtLiAqLw0KPj4+Pj4+ICsgICAgZm9yICggaSA9IDA7IGkg
PCBBUlJBWV9TSVpFKHBkZXYtPnZwY2ktPm1zaXgtPnRhYmxlcyk7IGkrKyApDQo+Pj4+Pj4gKyAg
ICB7DQo+Pj4+Pj4gKyAgICAgICAgdW5zaWduZWQgbG9uZyBzdGFydCA9IFBGTl9ET1dOKHZtc2l4
X3RhYmxlX2FkZHIocGRldi0+dnBjaSwgaSkpOw0KPj4+Pj4+ICsgICAgICAgIHVuc2lnbmVkIGxv
bmcgZW5kID0gUEZOX0RPV04odm1zaXhfdGFibGVfYWRkcihwZGV2LT52cGNpLCBpKSArDQo+Pj4+
Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB2bXNpeF90YWJsZV9zaXpl
KHBkZXYtPnZwY2ksIGkpIC0gMSk7DQo+Pj4+Pj4gKw0KPj4+Pj4+ICsgICAgICAgIGZvciAoIDsg
c3RhcnQgPD0gZW5kOyBzdGFydCsrICkNCj4+Pj4+PiArICAgICAgICB7DQo+Pj4+Pj4gKyAgICAg
ICAgICAgIHAybV90eXBlX3QgdDsNCj4+Pj4+PiArICAgICAgICAgICAgbWZuX3QgbWZuID0gZ2V0
X2dmbl9xdWVyeShkLCBzdGFydCwgJnQpOw0KPj4+Pj4+ICsNCj4+Pj4+PiArICAgICAgICAgICAg
c3dpdGNoICggdCApDQo+Pj4+Pj4gKyAgICAgICAgICAgIHsNCj4+Pj4+PiArICAgICAgICAgICAg
Y2FzZSBwMm1fbW1pb19kbToNCj4+Pj4+PiArICAgICAgICAgICAgY2FzZSBwMm1faW52YWxpZDoN
Cj4+Pj4+PiArICAgICAgICAgICAgICAgIGJyZWFrOw0KPj4+Pj4+ICsgICAgICAgICAgICBjYXNl
IHAybV9tbWlvX2RpcmVjdDoNCj4+Pj4+PiArICAgICAgICAgICAgICAgIGlmICggbWZuX3gobWZu
KSA9PSBzdGFydCApDQo+Pj4+Pj4gKyAgICAgICAgICAgICAgICB7DQo+Pj4+Pj4gKyAgICAgICAg
ICAgICAgICAgICAgY2xlYXJfaWRlbnRpdHlfcDJtX2VudHJ5KGQsIHN0YXJ0KTsNCj4+Pj4+PiAr
ICAgICAgICAgICAgICAgICAgICBicmVhazsNCj4+Pj4+PiArICAgICAgICAgICAgICAgIH0NCj4+
Pj4+PiArICAgICAgICAgICAgICAgIC8qIGZhbGx0aHJvdWdoLiAqLw0KPj4+Pj4+ICsgICAgICAg
ICAgICBkZWZhdWx0Og0KPj4+Pj4+ICsgICAgICAgICAgICAgICAgcHV0X2dmbihkLCBzdGFydCk7
DQo+Pj4+Pj4gKyAgICAgICAgICAgICAgICBncHJpbnRrKFhFTkxPR19XQVJOSU5HLA0KPj4+Pj4+
ICsgICAgICAgICAgICAgICAgICAgICAgICAiJXBwOiBleGlzdGluZyBtYXBwaW5nIChtZm46ICUi
IFBSSV9tZm4NCj4+Pj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgInR5cGU6ICVkKSBhdCAl
I2x4IGNsb2JiZXJzIE1TSVggTU1JTyBhcmVhXG4iLA0KPj4+Pj4+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAmcGRldi0+c2JkZiwgbWZuX3gobWZuKSwgdCwgc3RhcnQpOw0KPj4+Pj4+ICsgICAg
ICAgICAgICAgICAgcmV0dXJuIC1FRVhJU1Q7DQo+Pj4+Pj4gKyAgICAgICAgICAgIH0NCj4+Pj4+
PiArICAgICAgICAgICAgcHV0X2dmbihkLCBzdGFydCk7DQo+Pj4+Pj4gKyAgICAgICAgfQ0KPj4+
Pj4+ICsgICAgfQ0KPj4+Pj4+ICsNCj4+Pj4+PiArICAgIHJldHVybiAwOw0KPj4+Pj4+ICt9DQo+
Pj4+PiANCj4+Pj4+IC4uLiBub3RoaW5nIGluIHRoaXMgZnVuY3Rpb24gbG9va3MgdG8gYmUgeDg2
LXNwZWNpZmljLCBleGNlcHQgbWF5YmUNCj4+Pj4+IGZ1bmN0aW9ucyBsaWtlIGNsZWFyX2lkZW50
aXR5X3AybV9lbnRyeSgpIG1heSBub3QgY3VycmVudGx5IGJlIGF2YWlsYWJsZQ0KPj4+Pj4gb24g
QXJtLiBCdXQgdGhpcyBkb2Vzbid0IG1ha2UgdGhlIGNvZGUgeDg2LXNwZWNpZmljLg0KPj4+PiAN
Cj4+Pj4gSSB3aWxsIG1heWJlIGJlIHdyb25nIGJ1dCB3aGF0IEkgdW5kZXJzdGFuZCBmcm9tIHRo
ZSBjb2RlIGlzIHRoYXQgZm9yIHg4NiANCj4+Pj4gaWYgdGhlcmUgaXMgbm8gcDJtIGVudHJpZXMg
c2V0dXAgZm9yIHRoZSByZWdpb24sIGFjY2Vzc2VzIHRvIHRoZW0gd2lsbCBiZSB0cmFwcGVkIA0K
Pj4+PiBpbnRvIHRoZSBoeXBlcnZpc29yIGFuZCBjYW4gYmUgaGFuZGxlZCBieSBzcGVjaWZpYyBN
TUlPIGhhbmRsZXIuDQo+Pj4+IA0KPj4+PiBCdXQgZm9yIEFSTSB3aGVuIHdlIGFyZSByZWdpc3Rl
cmluZyB0aGUgTU1JTyBoYW5kbGVyIHdlIGhhdmUgdG8gcHJvdmlkZSANCj4+Pj4gdGhlIEdQQSBh
bHNvIGZvciB0aGUgTU1JTyBoYW5kbGVyLiANCj4+PiANCj4+PiBRdWVzdGlvbiBpczogSXMgdGhp
cyBqdXN0IGFuIGVmZmVjdCByZXN1bHRpbmcgZnJvbSBkaWZmZXJlbnQgaW1wbGVtZW50YXRpb24s
DQo+Pj4gb3IgYW4gaW5oZXJlbnQgcmVxdWlyZW1lbnQ/IEluIHRoZSBmb3JtZXIgY2FzZSwgaGFy
bW9uaXppbmcgdGhpbmdzIG1heSBiZSBhbg0KPj4+IGFsdGVybmF0aXZlIG9wdGlvbi4NCj4+IA0K
Pj4gVGhpcyBpcyBhbiBpbmhlcmVudCByZXF1aXJlbWVudCB0byBwcm92aWRlIGEgR1BBIHdoZW4g
cmVnaXN0ZXJpbmcgdGhlIE1NSU8gaGFuZGxlci4NCj4gDQo+IFNvIHlvdSBmaXJzdCBzYXkgeWVz
IHRvIG15ICJpbmhlcmVudCIgcXVlc3Rpb24sIGJ1dCB0aGVuIC4uLg0KPiANCj4+IEZvciB4ODYg
bXNpeCBtbWlvIGhhbmRsZXJzIGlzIHJlZ2lzdGVyZWQgaW4gaW5pdF9tc2l4KC4uKSBmdW5jdGlv
biBhcyB0aGVyZSBpcyBubyByZXF1aXJlbWVudA0KPj4gb24geDg2IHRvIHByb3ZpZGUgR1BBIHdo
ZW4gcmVnaXN0ZXJpbmcgdGhlIGhhbmRsZXIuIExhdGVyIHBvaW50IG9mIHRpbWUgd2hlbiBCQVJz
IGFyZSBjb25maWd1cmVkDQo+PiBhbmQgbWVtb3J5IGRlY29kaW5nIGJpdCBpcyBlbmFibGVkIHZw
Y2lfbWFrZV9tc2l4X2hvbGUoKSB3aWxsIGNsZWFyIHRoZSBpZGVudGl0eSBtYXBwaW5nIGZvciBt
c2l4DQo+PiBiYXNlIHRhYmxlIGFkZHJlc3Mgc28gdGhhdCBhY2Nlc3MgdG8gbXNpeCB0YWJsZXMg
d2lsbCBiZSB0cmFwcGVkLg0KPj4gDQo+PiBPbiBBUk0gd2UgbmVlZCB0byBwcm92aWRlIEdQQSB0
byByZWdpc3RlciB0aGUgbW1pbyBoYW5kbGVyIGFuZCBNU0lYIHRhYmxlIGJhc2UNCj4+IGFkZHJl
c3MgaXMgbm90IHZhbGlkIHdoZW4gaW5pdF9tc2l4KCkgaXMgY2FsbGVkIGFzIEJBUiB3aWxsIGJl
IGNvbmZpZ3VyZWQgbGF0ZXIgcG9pbnQgaW4gdGltZS4NCj4+IFRoZXJlZm9yZSBvbiBBUk0gbW1p
byBoYW5kbGVyIHdpbGwgYmUgcmVnaXN0ZXJlZCBpbiBmdW5jdGlvbiB2cGNpX21ha2VfbXNpeF9o
b2xlKCkgd2hlbg0KPj4gbWVtb3J5IGRlY29kaW5nIGJpdCBpcyBlbmFibGVkLg0KPiANCj4gLi4u
IHlvdSBleHBsYWluIGl0J3MgYW4gaW1wbGVtZW50YXRpb24gZGV0YWlsLiBJJ20gaW5jbGluZWQg
dG8NCj4gc3VnZ2VzdCB0aGF0IHg4NiBhbHNvIHBhc3MgdGhlIEdQQSB3aGVyZSBwb3NzaWJsZS4g
SGFuZGxlciBsb29rdXANCj4gcmVhbGx5IHdvdWxkIGJlbmVmaXQgZnJvbSBub3QgbmVlZGluZyB0
byBpdGVyYXRlIG92ZXIgYWxsIHJlZ2lzdGVyZWQNCj4gaGFuZGxlcnMsIHVudGlsIG9uZSBjbGFp
bXMgdGhlIGFjY2Vzcy4gVGhlIG9wdGltaXphdGlvbiBwYXJ0IG9mIHRoaXMNCj4gb2YgY291cnNl
IGRvZXNuJ3QgbmVlZCB0byBiZSBkb25lIHJpZ2h0IGhlcmUsIGJ1dCBoYXJtb25pemluZw0KPiBy
ZWdpc3Rlcl9tbWlvX2hhbmRsZXIoKSBiZXR3ZWVuIGJvdGggYXJjaGl0ZWN0dXJlcyB3b3VsZCBz
ZWVtIHRvIGJlDQo+IGEgcmVhc29uYWJsZSBwcmVyZXEgc3RlcC4NCg0KSSBhZ3JlZSB3aXRoIHlv
dSB0aGF0IGlmIHdlIG1vZGlmeSB0aGUgcmVnaXN0ZXJfbW1pb19oYW5kbGVyKCkgZm9yIHg4NiB0
byBwYXNzIEdQQQ0Kd2UgY2FuIGhhdmUgdGhlIGNvbW1vbiBjb2RlIGZvciB4ODYgYW5kIEFSTSBh
bmQgYWxzbyB3ZSBjYW4gb3B0aW1pemUgdGhlIE1NSU8NCnRyYXAgaGFuZGxpbmcgZm9yIHg4Ni4N
Cg0KV2hhdCBJIHVuZGVyc3RhbmQgZnJvbSB0aGUgY29kZSBpcyB0aGF0IG1vZGlmeWluZyB0aGUg
cmVnaXN0ZXJfbW1pb19oYW5kbGVyKCkgZm9yDQp4ODYgdG8gcGFzcyBHUEEgcmVxdWlyZXMgYSBs
b3Qgb2YgZWZmb3J0IGFuZCB0ZXN0aW5nLg0KDQpVbmZvcnR1bmF0ZWx5LCBJIGhhdmUgYW5vdGhl
ciBoaWdoIHByaW9yaXR5IHRhc2sgdGhhdCBJIGhhdmUgdG8gY29tcGxldGUgSSBkb27igJl0IGhh
dmUgdGltZQ0KdG8gb3B0aW1pc2UgdGhlIHJlZ2lzdGVyX21taW9faGFuZGxlcigpIGZvciB4ODYg
YXQgdGhpcyB0aW1lLg0KDQpJZiB5b3UgYXJlIG9rIGlmIHdlIGNhbiBtYWtlIHZwY2lfbWFrZV9t
c2l4X2hvbGUoKSBmdW5jdGlvbiBhcmNoLXNwZWNpZmljIHNvbWV0aGluZyBsaWtlDQp2cGNpX21z
aXhfYXJjaF9jaGVja19tbWlvKCkgYW5kIGdldCB0aGlzIHBhdGNoIG1lcmdlZC4NCg0KUmVnYXJk
cywNClJhaHVsDQo+IA0KPiBJJ20gYWRkaW5nIFBhdWwgdG8gQ2MgaW4gY2FzZSBoZSB3YW50cyB0
byBjb21tZW50LCBhcyB0aGlzIHdvdWxkDQo+IHRvdWNoIGhpcyB0ZXJyaXRvcnkgb24gdGhlIHg4
NiBzaWRlLg0KPiANCj4gSmFuDQo+IA0KDQo=

