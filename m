Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B81158A7D8E
	for <lists+xen-devel@lfdr.de>; Wed, 17 Apr 2024 09:59:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.707275.1105045 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rx0CB-0007v8-6w; Wed, 17 Apr 2024 07:59:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 707275.1105045; Wed, 17 Apr 2024 07:59:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rx0CB-0007s5-3M; Wed, 17 Apr 2024 07:59:07 +0000
Received: by outflank-mailman (input) for mailman id 707275;
 Wed, 17 Apr 2024 07:59:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EdzU=LW=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1rx0C9-0007rz-KI
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2024 07:59:05 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20600.outbound.protection.outlook.com
 [2a01:111:f403:2606::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5a0fd43d-fc90-11ee-94a3-07e782e9044d;
 Wed, 17 Apr 2024 09:59:01 +0200 (CEST)
Received: from DUZPR01CA0009.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c3::16) by DB9PR08MB8388.eurprd08.prod.outlook.com
 (2603:10a6:10:3d7::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Wed, 17 Apr
 2024 07:58:32 +0000
Received: from DU2PEPF00028D0C.eurprd03.prod.outlook.com
 (2603:10a6:10:3c3:cafe::56) by DUZPR01CA0009.outlook.office365.com
 (2603:10a6:10:3c3::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.34 via Frontend
 Transport; Wed, 17 Apr 2024 07:58:32 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU2PEPF00028D0C.mail.protection.outlook.com (10.167.242.20) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7452.22
 via Frontend Transport; Wed, 17 Apr 2024 07:58:32 +0000
Received: ("Tessian outbound 9fd7e4b543e6:v313");
 Wed, 17 Apr 2024 07:58:31 +0000
Received: from 6f1ff0ebcce9.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7F83D93B-E1A2-47C2-8108-6D3231F04FD7.1; 
 Wed, 17 Apr 2024 07:58:21 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6f1ff0ebcce9.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 17 Apr 2024 07:58:21 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by PAWPR08MB8957.eurprd08.prod.outlook.com (2603:10a6:102:33d::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Wed, 17 Apr
 2024 07:58:19 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6204:b901:9cc6:bf2b]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6204:b901:9cc6:bf2b%6]) with mapi id 15.20.7452.049; Wed, 17 Apr 2024
 07:58:19 +0000
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
X-Inumbo-ID: 5a0fd43d-fc90-11ee-94a3-07e782e9044d
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=aZwX/UG5WZeWr2wna3fRkHBxQQdF3C1AIAYryYR/AFd0LWnnpwGXEKFhVI1i1P5066vWq758jOyHPvuL4vEkEfo+ijgP6Lf7Ll3iiAPbrQRJCtQ2hp6MXltwQZc2MYYy7j/uxeMG0Dq7w9zAdJ3KDEFXR8TJP9J+vMdkDk+vYxIZKGbVlqZv7q4/KbgqMtX/H2F2kG7VWhGENe29o7PJm9j/3OUBdfQ7gi2PfWzseXWZm3lVnI1oE/YZGPbAr26tKgENBPaMjkZpC9r1TNjYP5WE/zsYmnCOPA/KSTKqnGvk95QxKSWgjh5w7gLnw+liAvmaFQ0dC1TsGjJwVY8XMA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LM47rY0ny9PItD6LeIXl3dYrjz9odm4K3JitDuEleLw=;
 b=d1q86OLHde1ysaT4PfPQ7P9FiiFU+fXHge2gChctlp+VvCA0VywyHA4iGjFssNo226nkomsghu8UhYWV7tA+xZgzFoya4T/w936fUGA53WqxgNC7FW2mBh2JPU51vkELMLPPvCUVo2qKxjBRBIigxX3VBnGxw4es8UYIaipvQsTKBxE893NgCuBai7DzBYYWs9drIJhDPk7T+p1aICOStFdM3FZ3MtIYuQddUmiNfv482V4t7gr8Hz0aVsTNDbvz8cxmHddQry5s+FyQd6f0PPqavLqUeHt4GJBonTop2hGKWkGVaf/kSbRHczeeHzF2+0PaZPqMLc4tFCFSOY9CiQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LM47rY0ny9PItD6LeIXl3dYrjz9odm4K3JitDuEleLw=;
 b=xSZJ3E7WWdWaInBZ6u+4237Dd62hELJeNe0VIixGxvGMYCFbP6FE2GrOfWTPaUKJaPDbvnukedUNfDccKtJ/ac3eaUIYw8UKImFj0QXC3H06uRkVmfjhYMzJtfh8LXR5/Pe3JLbwWs3ougEk39toizox2NRezYO5EphPQc4oBiA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: f5c73f088e36de06
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nw7YixRiCiHW5PPWj2CHWjPBGz6xDtr8Z9e8SOqY0uNl7iRUbdbkS6xjgb4kp4Eu/1XT5Pyao4YDNzOnjZfOz47T+obff1gyB4TP+bw1nGjOo4KHbIaD5TKyGH59/pCohmnJe0YmSB7LtwBa4MNP03OfRjxA5/GglimeeC7/dLRigktN7CdhnqrR6Squ22HWo/+4tU6sAH7RzhKeEmwAb4d9zvgGi91Vbt+AlwcGSZKN/jhGrSfg7tD36W8KTJ/k2V2kRtJs4ZyjLGnL2kTY724DzTihARmdwdYSpdc/1nNtond5gcOEIDbbewiBRVBSooRQzu9YTy3jgpHTsLOmTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LM47rY0ny9PItD6LeIXl3dYrjz9odm4K3JitDuEleLw=;
 b=BVylkRvJtfKrsgZhpzbA++iMcUjxHr4Q57xsIpfTg/Ya53JHWL9LjElRs7lfh9zcMmiE0hdB2OJKt+dY1kx/6cs6SpxuaZPS81bdYRKBRtmUKEm+rUsFqmbYodCJQFvezsT55eLdqJT/qR+qftTyu5pIJUSyzN6k25nqdbegV6PogILfUzo6YjXX7tTAIUfLe4b4cBqmA/p6xikD5G/lRCSSRX9k7MxGXtI35bPYKNrfOih6LpyekDttcPZFS3BJl7nfTbQTkQT0rQ0aMx0byJXqtQKSDShKmTIqT545PIJsgTna6j3BShX1KqRGbSWd1Ga922tQb7xNpUg4sHKq6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LM47rY0ny9PItD6LeIXl3dYrjz9odm4K3JitDuEleLw=;
 b=xSZJ3E7WWdWaInBZ6u+4237Dd62hELJeNe0VIixGxvGMYCFbP6FE2GrOfWTPaUKJaPDbvnukedUNfDccKtJ/ac3eaUIYw8UKImFj0QXC3H06uRkVmfjhYMzJtfh8LXR5/Pe3JLbwWs3ougEk39toizox2NRezYO5EphPQc4oBiA=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>
Subject: Re: docs/misra: add R21.6 R21.14 R21.15 R21.16
Thread-Topic: docs/misra: add R21.6 R21.14 R21.15 R21.16
Thread-Index: AQHakDQ428r7u0beA0yxVf0iyBBMbbFsGZCA
Date: Wed, 17 Apr 2024 07:58:19 +0000
Message-ID: <94EDC57A-81DE-4A36-BC74-7FF9860B94C3@arm.com>
References:
 <alpine.DEB.2.22.394.2404161227340.2257106@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2404161227340.2257106@ubuntu-linux-20-04-desktop>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.400.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|PAWPR08MB8957:EE_|DU2PEPF00028D0C:EE_|DB9PR08MB8388:EE_
X-MS-Office365-Filtering-Correlation-Id: 375b015a-878c-42f5-a244-08dc5eb42cff
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 +zahwPK1u4Y+/7SPIoo2trmzpHDpUcbpZyhD+zyGjwvw4IDL0nnJ8RsWcLxuqSXmAVKNWvTvNN78f+8IYepc+VwAAUlnCQuDtluzbwvKyWAUMUp6q02lH/ZPLitBuXvgB4Fite10S2tG4SZU/WWiSZnTn5b7jozvMrWgWuqtA2LUKdABrHgy0Ptzimhk6CkZHjQHp/rjgikDx8IBovr4ec24aVCzBviIohzcJ4fqe6njlA2peJPZbEPjN/ILCq7/gV74k/gaSyLiaTJSoUbJ8tcmTNpO7CqWaWFnidlCUpcqroNwS/qMctiXZUscEQQtjHq4t0Mrg+i+31ST8gzl2uwd+2m8hzeLZOlWHFqz043x8sJJPCk+/HYjRScHNaEhhcywYYj0mQE3aXa9YlUZcRCAlkMnOlr7Joc5OOQP/Ya7teS88aglLHpsrzuUKqtZ84AkRwrtjo2d23T6WYjTICF+DSWizEgody1arbW1FLifY2+9O5a+dNyCBs1sSqFjpxfgBBqgEJ5WD+ieZ2ao1oS1eX9fJfqr01rd/+iDX6OcqFhk+ndAPm4Q4MtcBPdr7rbRhCO5aWugMakTjOCtWkq7gXgUaGl2mDhD8CmeY63n31m1lMkC96p776FNW4/x7aEiOJyJDJ5O1p//diEC25r/+u4zTsfuAznakedNBjXaGalH47VzxLlS1YuqwYVMvy+lzo3bu2tXOtpimJSRfY1YnCD+icpqw4LWqgbQ7Ck=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <399496F933F78741800A26926A4697B1@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB8957
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028D0C.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	97e32ff8-13c7-4ad5-35dc-08dc5eb4257a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2uQhKCsT7mbidBCnskteQDf2fVzjGZKb4py9XS5QPZ1uO42NPnPvi2ybfSK0tXi2rUBTAzUtU2muYEAL2TFKOtU+QhNYlSZAkATbsi/6v3DJQo+b2dfQ4wHHhTasPfz8ngbks94/06Evxisir+jwkcvMK3CPlGgSKwQ2DcoZ48mauUGDBk+QDHhK9p5d7u4QRuraiJ5ml8HSKWOcsERsPWZ4CGTuO/cZHGjRv155wmIYsks3u8Ga+UVrBAWSsxu7Ud5Vky/+fTgG2Xj08EGd1AZ/CwLuc1ddFU39U4FVedm0RMivtFHgQsJbbeyJvPQpzOjQ8ciZc4qx0iuBm9n6M5ezpwyfXKM2H4Qu+vlb+Tkv4gvXVH8IqHY0cmckQs6mSdI5lB8jqNkNgmHVPLMa6RokbJFzcJrqrU1SorQGkX2bWbYqd6+9apJO4jJ6wa/PEXdYunptnzNA5IVnjKN4r7Kwr9rxIlLlBk55Sc/RknI8S0PX6yFUuZn4vJjKOG5sU88P9rBAfvQ0HK6vELxzQ4Q3N4MuCmaSaykVpjXjFYbNksRgW+PtdAy//g4FIb1pxPXjsDB987No6NP5Niw+uKUNBVHG4eLacTw00Wj61qJRouB1ZQx7uT6jCIgurk2mMd+eWCoRJrIy8xvErImaI8xtq9IPoeU3fptYP3FLI0hs4xU0qS+E7E/VpygkyeQWNh4WnskCcLB68AVHtb2kAMr8GLQrVLtNWjcuKJ+8fNq9ARjKkkvb7Yfc04x+O9OZDtgujMc0O8eOG5L+c+Jijw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(82310400014)(36860700004)(376005)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2024 07:58:32.1842
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 375b015a-878c-42f5-a244-08dc5eb42cff
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D0C.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8388

SGkgU3RlZmFubywNCg0KPiBPdGhlciBkZXZpYXRpb25zOg0KPiAtLS0tLS0tLS0tLS0tLS0tLQ0K
PiANCj4gZGlmZiAtLWdpdCBhL2RvY3MvbWlzcmEvcnVsZXMucnN0IGIvZG9jcy9taXNyYS9ydWxl
cy5yc3QNCj4gaW5kZXggYjdiNDQ3ZTE1Mi4uMDBkYjAyYWQzNCAxMDA2NDQNCj4gLS0tIGEvZG9j
cy9taXNyYS9ydWxlcy5yc3QNCj4gKysrIGIvZG9jcy9taXNyYS9ydWxlcy5yc3QNCj4gQEAgLTY1
MiwxMiArNjUyLDM4IEBAIG1haW50YWluZXJzIGlmIHlvdSB3YW50IHRvIHN1Z2dlc3QgYSBjaGFu
Z2UuDQo+ICAgICAgICBkZWNsYXJlZA0KPiAgICAgIC0gU2VlIGNvbW1lbnQgZm9yIFJ1bGUgMjEu
MQ0KPiANCj4gKyAgICogLSBgUnVsZSAyMS42IDxodHRwczovL2dpdGxhYi5jb20vTUlTUkEvTUlT
UkEtQy9NSVNSQS1DLTIwMTIvRXhhbXBsZS1TdWl0ZS8tL2Jsb2IvbWFzdGVyL1JfMjFfMDYuYz5g
Xw0KPiArICAgICAtIFJlcXVpcmVkDQo+ICsgICAgIC0gVGhlIFN0YW5kYXJkIExpYnJhcnkgaW5w
dXQvb3V0cHV0IHJvdXRpbmVzIHNoYWxsIG5vdCBiZSB1c2VkDQo+ICsgICAgIC0gU2VlIHRoZSBz
bnByaW50ZigpIGFuZCB2c25wcmludGYoKSBkZXZpYXRpb24gaW4gZGV2aWF0aW9ucy5yc3QNCj4g
Kw0KPiAgICAqIC0gYFJ1bGUgMjEuMTMgPGh0dHBzOi8vZ2l0bGFiLmNvbS9NSVNSQS9NSVNSQS1D
L01JU1JBLUMtMjAxMi9FeGFtcGxlLVN1aXRlLy0vYmxvYi9tYXN0ZXIvUl8yMV8xMy5jPmBfDQo+
ICAgICAgLSBNYW5kYXRvcnkNCj4gICAgICAtIEFueSB2YWx1ZSBwYXNzZWQgdG8gYSBmdW5jdGlv
biBpbiA8Y3R5cGUuaD4gc2hhbGwgYmUgcmVwcmVzZW50YWJsZSBhcyBhbg0KPiAgICAgICAgdW5z
aWduZWQgY2hhciBvciBiZSB0aGUgdmFsdWUgRU9GDQo+ICAgICAgLQ0KPiANCj4gKyAgICogLSBg
UnVsZSAyMS4xNCA8aHR0cHM6Ly9naXRsYWIuY29tL01JU1JBL01JU1JBLUMvTUlTUkEtQy0yMDEy
L0V4YW1wbGUtU3VpdGUvLS9ibG9iL21hc3Rlci9SXzIxXzE0LmM+YF8NCj4gKyAgICAgLSBSZXF1
aXJlZA0KPiArICAgICAtIFRoZSBTdGFuZGFyZCBMaWJyYXJ5IGZ1bmN0aW9uIG1lbWNtcCBzaGFs
bCBub3QgYmUgdXNlZCB0byBjb21wYXJlDQo+ICsgICAgICAgbnVsbCB0ZXJtaW5hdGVkIHN0cmlu
Z3MNCj4gKyAgICAgLQ0KPiArDQo+ICsgICAqIC0gYFJ1bGUgMjEuMTUgPGh0dHBzOi8vZ2l0bGFi
LmNvbS9NSVNSQS9NSVNSQS1DL01JU1JBLUMtMjAxMi9FeGFtcGxlLVN1aXRlLy0vYmxvYi9tYXN0
ZXIvUl8yMV8xNS5jPmBfDQo+ICsgICAgIC0gUmVxdWlyZWQNCj4gKyAgICAgLSBUaGUgcG9pbnRl
ciBhcmd1bWVudHMgdG8gdGhlIFN0YW5kYXJkIExpYnJhcnkgZnVuY3Rpb25zIG1lbWNweSwNCj4g
KyAgICAgICBtZW1tb3ZlIGFuZCBtZW1jbXAgc2hhbGwgYmUgcG9pbnRlcnMgdG8gcXVhbGlmaWVk
IG9yIHVucXVhbGlmaWVkDQo+ICsgICAgICAgdmVyc2lvbnMgb2YgY29tcGF0aWJsZSB0eXBlcyAN
Cg0KVGhlcmUgaXMgYSB0cmFpbGluZyBzcGFjZSBhdCB0aGUgZW5kIG9mIHRoaXMgbGluZQ0KDQo+
ICsgICAgIC0gdm9pZCogYXJndW1lbnRzIGFyZSBhbGxvd2VkLCBzZWUgZGV2aWF0aW9ucy5yc3QN
Cj4gKw0KPiArICAgKiAtIGBSdWxlIDIxLjE2IDxodHRwczovL2dpdGxhYi5jb20vTUlTUkEvTUlT
UkEtQy9NSVNSQS1DLTIwMTIvRXhhbXBsZS1TdWl0ZS8tL2Jsb2IvbWFzdGVyL1JfMjFfMTYuYz5g
Xw0KPiArICAgICAtIFJlcXVpcmVkDQo+ICsgICAgIC0gVGhlIHBvaW50ZXIgYXJndW1lbnRzIHRv
IHRoZSBTdGFuZGFyZCBMaWJyYXJ5IGZ1bmN0aW9uIG1lbWNtcA0KPiArICAgICAgIHNoYWxsIHBv
aW50IHRvIGVpdGhlciBhIHBvaW50ZXIgdHlwZSwgYW4gZXNzZW50aWFsbHkgc2lnbmVkIHR5cGUs
DQo+ICsgICAgICAgYW4gZXNzZW50aWFsbHkgdW5zaWduZWQgdHlwZSwgYW4gZXNzZW50aWFsbHkg
Qm9vbGVhbiB0eXBlIG9yIGFuDQo+ICsgICAgICAgZXNzZW50aWFsbHkgZW51bSB0eXBlDQoNCkFs
c28gaGVyZS4NCg0KPiArICAgICAtDQo+ICsNCj4gICAgKiAtIGBSdWxlIDIxLjE3IDxodHRwczov
L2dpdGxhYi5jb20vTUlTUkEvTUlTUkEtQy9NSVNSQS1DLTIwMTIvRXhhbXBsZS1TdWl0ZS8tL2Js
b2IvbWFzdGVyL1JfMjFfMTcuYz5gXw0KPiAgICAgIC0gTWFuZGF0b3J5DQo+ICAgICAgLSBVc2Ug
b2YgdGhlIHN0cmluZyBoYW5kbGluZyBmdW5jdGlvbnMgZnJvbSA8c3RyaW5nLmg+IHNoYWxsIG5v
dCByZXN1bHQgaW4NCj4gDQoNCkFwYXJ0IGZyb20gdGhlbSwgdGhhdCBJIGd1ZXNzIGNhbiBiZSBh
ZGRyZXNzZWQgb24gY29tbWl0LCBpdCBsb29rcyBnb29kIHRvIG1lLA0KSeKAmXZlIGFsc28gdGVz
dGVkIHRoYXQgdGhlIGNoYW5nZXMgZG9u4oCZdCBicmVhayBjb252ZXJ0X21pc3JhX2RvYy5weSBi
dWlsZC4NCg0KUmV2aWV3ZWQtYnk6IEx1Y2EgRmFuY2VsbHUgPGx1Y2EuZmFuY2VsbHVAYXJtLmNv
bT4NClRlc3RlZC1ieTogTHVjYSBGYW5jZWxsdSA8bHVjYS5mYW5jZWxsdUBhcm0uY29tPg0KDQoN
Cg0KDQo=

