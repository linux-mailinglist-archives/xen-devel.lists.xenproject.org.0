Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB08F8A837F
	for <lists+xen-devel@lfdr.de>; Wed, 17 Apr 2024 14:53:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.707487.1105447 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rx4mL-0004pv-Na; Wed, 17 Apr 2024 12:52:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 707487.1105447; Wed, 17 Apr 2024 12:52:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rx4mL-0004ny-L1; Wed, 17 Apr 2024 12:52:45 +0000
Received: by outflank-mailman (input) for mailman id 707487;
 Wed, 17 Apr 2024 12:52:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EdzU=LW=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1rx4mK-0004ns-6u
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2024 12:52:44 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2054.outbound.protection.outlook.com [40.107.13.54])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 60ef658e-fcb9-11ee-94a3-07e782e9044d;
 Wed, 17 Apr 2024 14:52:42 +0200 (CEST)
Received: from DB7PR03CA0097.eurprd03.prod.outlook.com (2603:10a6:10:72::38)
 by DBAPR08MB5734.eurprd08.prod.outlook.com (2603:10a6:10:1aa::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Wed, 17 Apr
 2024 12:52:10 +0000
Received: from DB5PEPF00014B92.eurprd02.prod.outlook.com
 (2603:10a6:10:72:cafe::4b) by DB7PR03CA0097.outlook.office365.com
 (2603:10a6:10:72::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.20 via Frontend
 Transport; Wed, 17 Apr 2024 12:52:10 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5PEPF00014B92.mail.protection.outlook.com (10.167.8.230) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7452.22
 via Frontend Transport; Wed, 17 Apr 2024 12:52:10 +0000
Received: ("Tessian outbound 9fd7e4b543e6:v313");
 Wed, 17 Apr 2024 12:52:10 +0000
Received: from e0c914b1996b.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6FA8A63B-CF48-4FB4-8578-E28CBFBFF730.1; 
 Wed, 17 Apr 2024 12:52:03 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e0c914b1996b.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 17 Apr 2024 12:52:03 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by AS8PR08MB8247.eurprd08.prod.outlook.com (2603:10a6:20b:522::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Wed, 17 Apr
 2024 12:52:01 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6204:b901:9cc6:bf2b]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6204:b901:9cc6:bf2b%6]) with mapi id 15.20.7452.049; Wed, 17 Apr 2024
 12:52:01 +0000
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
X-Inumbo-ID: 60ef658e-fcb9-11ee-94a3-07e782e9044d
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=lzsUoYtZu3QkQ8qCQRnfGEZ6+1ZKYdyrzZxg2KTSMsn92fpUZjO7BasbfsJCWhnCk3Fv+qQj+QN+gbgLgvSEv5VhIq7h3ljilevbBY8J6lH9VTUygmxVnDdjf17Go7YIRCjxBku4Cq9NcIuWKuoJQdLnlxxIPrDwAxByDYp6nTnbqpzgP6IS4/wfTxtRhwzqSQUu396wb7Kr8PJpvjdyjDtWYldUMRrnpx7Y10CIXfD1XkZ9Rqk0NnhSDLhJ49z6VTzqe+CCX+Z169p2BbDvQQH5mUHA67AIuRGxfnVzcTax2oGWNd3RUhKQbM2wEJTE7X2sdcPWjvs/jll2KS9iSw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PqqnQW2idipp9wdIcg2k1TrPdfHpgJNzO2tWzS4qzFU=;
 b=JAiQfX7t04bFlyBKFGJst9GTU/5a7rz4vcFfcKm+N3FUY3ZAcgNsQ9j6gOQkHRJdRXhiw3YZvhG1VOTucycKbZ+/+iBuO3/+bgS7ZYOK7KrFjTOxo+H00y2RA3gY6MMNCa3cVS6LMVsN6tsq80JthZhK0JoCN8u7PqSRVCUPGaGBOnsTQAkAVsC3thfjuyWJXAIj5IxnET84oqvtlePKPUDfsTfw36IGOiRUzRIWhaVVLOXPKrYSeJKioM13W2opRjx8gjaD5qiJCw+BYNxi12EAi8hP7ymME8Wd/uTO139DxBuYCwZo6DlHJsbp2H2U05+r8dt128c5Ug7Yglu/zA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PqqnQW2idipp9wdIcg2k1TrPdfHpgJNzO2tWzS4qzFU=;
 b=Q5wi+IKqgX/qz8gPVnIjb2C4xRZUkABdSHHiXGbU4B0x7l8NDjjXyz1EpJuzKbBoy3nsSh6VG+ftBN9Zb3/WVx9iRfcF/dZpoLjYCnL7yIwtCZfXl76jPi+RMx7UajSOgeYrD4WWIcbvdQFNCplOqugFE804lbM37GrLhr4Pfk0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: feafa76dca9093da
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EqdtE46clF6UaY76Uv7e2s7viC5NJQIlWE+OI3OrEltNsLI4Bq4U/MPgqfRfzsiQiqBN7M+qGt+1dHKPIdNeQxXa+vL4k3siYSLtZjCt6hA7uTWlDN94Pk9v2tDGB49ZvOL+gP3g615FuyKOygEMJAKXK3qbSzPJEqO2kx5VYj9aa9wa4+ejSdxVDLEXUBm8JWZLv/Wuufq2LH7gczlUC29HIhaPMcjVahOlRs7kj+WnhEruvXh3lDlk3iJ4QUH1iNJsUbbSrU/nB2+a0C1Su2h5WcnNjBP6Bi3CghA0pR1jnT3wcNOLZhNhU9DBDnEpDMYZargQAD4m5mwIGmQP3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PqqnQW2idipp9wdIcg2k1TrPdfHpgJNzO2tWzS4qzFU=;
 b=NcQS4Jng08zNFblhEgbl7sQUFXkIseOMCXhksioa1fHVnb+hpQBKJNqCarwB0moqINMdfrOtHHoMIGh9mE11LEj7v5PmmuiAbV45HDySi+QhUV+4vZ9QURZ6apyeAQlEpCTXCvkZNJTp0cCoe69AcgO26FQvIJE9YFJEaQRChyAZqc4pKnynHcAmJxA40YTArb3dwtcGU4XFQMreBznlu+UZ0z1YxEtPKwj9QwypqtlKs58Z22UP4rK7mdbsKR9PjAISdlcdC/Yv7uOj1pS+PX4/9/iLpUPkZBBo40x3H99PlJumidMQotOsagU3zO/VEZZj3EQrFxCWv04rvIXOCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PqqnQW2idipp9wdIcg2k1TrPdfHpgJNzO2tWzS4qzFU=;
 b=Q5wi+IKqgX/qz8gPVnIjb2C4xRZUkABdSHHiXGbU4B0x7l8NDjjXyz1EpJuzKbBoy3nsSh6VG+ftBN9Zb3/WVx9iRfcF/dZpoLjYCnL7yIwtCZfXl76jPi+RMx7UajSOgeYrD4WWIcbvdQFNCplOqugFE804lbM37GrLhr4Pfk0=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] public: xen: Define missing guest handle for int32_t
Thread-Topic: [PATCH] public: xen: Define missing guest handle for int32_t
Thread-Index: AQHakMDnwJgPHKtLG0OvN5jC+71RJbFsaoaA
Date: Wed, 17 Apr 2024 12:52:01 +0000
Message-ID: <45DB9473-32AE-41F0-ABA5-C5A908451DEB@arm.com>
References: <20240417121442.56178-1-michal.orzel@amd.com>
In-Reply-To: <20240417121442.56178-1-michal.orzel@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.400.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|AS8PR08MB8247:EE_|DB5PEPF00014B92:EE_|DBAPR08MB5734:EE_
X-MS-Office365-Filtering-Correlation-Id: ca4b1171-ea2b-426a-c848-08dc5edd3249
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 zV+u8vhdzXqzjeJ/1TsFOh14EDHsEK7oRdi1rQoK3u7H9onNGpVN02aVKHo4hA2tPxxghHV30CRfQw3SXrsoSQyIN6NsMxRhNPJSOx8c2pjLU9ghkg+Z0ebX/eHZLY+RShFxkaXb0fW2C/6pUhw6cYGOnQlBzgsqiUO9AIFLjMIIYvmI4ZzBNtCqzGiSvmI6T+FAQYJn/0KR3Myy5y2uXY04Yb4xBJGn/b3TP0Vx8LqV/8g1YoKM1yQ+f236iVrV57G4XqPlGj13iXrOqHqPgdrr89rrp5dsDimo8KzW4ENxmSX1CyNdwT9H/zKdHB18qSeug+tGq5KXMhN3C51xo/jwcOfF4cH+SvQwKIKXtJ+JNUXIcMiMofc72W1J1gftlFc8WRv/ew92y5xrjY5PffpmJUtVnzziqm9+ddmqUSrxn4DNsoL88U79OU053uOHNgQHURF5uPghbggWFfd0Urvyo51+WWMm2JY6xnTQ0lrFyT98nWWwMMEc9Qx5Ylzkf4r70X3gk/989iHCwpltoCP/1b2NQCt/KmKfNhxCUc+2zuQknsvLoR/XYkEQFZY1GNZniHzW7hBL6KI3QosCsA00t+kKnDNJ0VcI4tI8T6sHqyIJZt2OZUW1NO/eFm558LBgewv7zSMy73igaBNAuTNHKbhEF8k9ajFa7oSCtDvTbce1NY2YRVMcCBp1hz4dRxo3bHLnxhzYRDsCArFQdbofJLzgTUT1e59Z5EPDzh4=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <C2251052924D4141B4C1631192A13AEC@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8247
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B92.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	71cecb38-9f86-4767-2009-08dc5edd2d29
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1+J+dc5ldOxInlstag8YqmJsHG3TsOrHcMMnEMxvkdNqhIkzyrblXxfjEDzG14wfun7oD6vQ1xEe1TjG+00Mx0wNOzeSjlNI0ymytnv0oDG1nYVXvQp78Eic/xX+gJVEXgUfT0vwK+b9sLT+dM9xeR3yRpOuv5HyzWHNb0X0xs7f5qL4Rb2+KAiWu9CuneLyrkO9a/WTifb693OiWRYL7HTYg/flTcOfuJsVYUv+Ex39INNdmDUpfuYZNXZj5rozjwubTzQ6zMjQpUcHFlTdefojFc6Oql1Vvf1hThNo8TsBIalraZLybv3QFqEXRPzh2zB9a4NXKd8sWRuodV3M3CyGxbS3SEUj+fD8XMXm1NBoXNi3oDOJmMpPe+zRBzuuO1YLG5F1vx6aDpsJrit9CGHi5ovp9nB0cwrisVtQDeNl1tuZv9F1k/3tJTUBk3Owmkw4xVTT1T9iVh/7q2JCHVj59hZRfL5bqLGpx5qblMTZGDr725ot/6qSjkau1LcxY7dzh3cuNZbtx71AF0aeVpkRjmVS6mCIxcsvY2WpWiK3bvNI0cH1r04CBQB+F1bcbnXoal9GxYjC5e4A8Hs0K9EPOeZ22ENcnHse2uDejLdSQ28nWohce5JunFMPw/2p0p1qFQd9xcmNS/8Tr5Fd4tgRzZOF3OiAKClZsZIc64zy/dc8lQJ2sMMare7s4Bmro7Wvv7Zc+Pk9IX0xD/bkPw6KiajzDqWQ28bTRWf6wzNGnS6xhVak+Bpiqn9FV4+k
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(36860700004)(1800799015)(376005)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2024 12:52:10.4091
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ca4b1171-ea2b-426a-c848-08dc5edd3249
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B92.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5734

SGkgTWljaGFsLA0KDQo+IE9uIDE3IEFwciAyMDI0LCBhdCAxMzoxNCwgTWljaGFsIE9yemVsIDxt
aWNoYWwub3J6ZWxAYW1kLmNvbT4gd3JvdGU6DQo+IA0KPiBDb21taXQgYWZhYjI5ZDA4ODJmICgi
cHVibGljOiBzL2ludC9pbnQzMl90IikgcmVwbGFjZWQgaW50IHdpdGggaW50MzJfdA0KPiBpbiBY
RU5fR1VFU1RfSEFORExFKCkgaW4gbWVtb3J5LmggYnV0IHRoZXJlIGlzIG5vIGd1ZXN0IGhhbmRs
ZSBkZWZpbmVkDQo+IGZvciBpdC4gVGhpcyByZXN1bHRzIGluIGEgYnVpbGQgZmFpbHVyZS4gRXhh
bXBsZSBvbiBBcm06DQo+IA0KPiAuL2luY2x1ZGUvcHVibGljL2FyY2gtYXJtLmg6MjA1OjQxOiBl
cnJvcjogdW5rbm93biB0eXBlIG5hbWUg4oCYX19ndWVzdF9oYW5kbGVfNjRfaW50MzJfdOKAmQ0K
PiAgMjA1IHwgI2RlZmluZSBfX1hFTl9HVUVTVF9IQU5ETEUobmFtZSkgICAgICAgIF9fZ3Vlc3Rf
aGFuZGxlXzY0XyAjIyBuYW1lDQo+ICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+DQo+IC4vaW5jbHVkZS9wdWJsaWMvYXJjaC1h
cm0uaDoyMDY6NDE6IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBtYWNybyDigJhfX1hFTl9HVUVTVF9I
QU5ETEXigJkNCj4gIDIwNiB8ICNkZWZpbmUgWEVOX0dVRVNUX0hBTkRMRShuYW1lKSAgICAgICAg
ICBfX1hFTl9HVUVTVF9IQU5ETEUobmFtZSkNCj4gICAgICB8ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn4NCj4gLi9pbmNsdWRlL3B1Ymxp
Yy9tZW1vcnkuaDoyNzc6NTogbm90ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3JvIOKAmFhFTl9HVUVT
VF9IQU5ETEXigJkNCj4gIDI3NyB8ICAgICBYRU5fR1VFU1RfSEFORExFKGludDMyX3QpIGVycnM7
DQo+IA0KPiBGaXggaXQuIEFsc28sIGRyb3AgZ3Vlc3QgaGFuZGxlIGRlZmluaXRpb24gZm9yIGlu
dCBnaXZlbiBubyBmdXJ0aGVyIHVzZS4NCj4gDQo+IEZpeGVzOiBhZmFiMjlkMDg4MmYgKCJwdWJs
aWM6IHMvaW50L2ludDMyX3QiKQ0KPiBTaWduZWQtb2ZmLWJ5OiBNaWNoYWwgT3J6ZWwgPG1pY2hh
bC5vcnplbEBhbWQuY29tPg0KPiAtLS0NCg0KSeKAmXZlIGJ1aWxkIGl0IGZvciBhcm02NCwgYXJt
MzIgYW5kIHg4Ng0KDQpSZXZpZXdlZC1ieTogTHVjYSBGYW5jZWxsdSA8bHVjYS5mYW5jZWxsdUBh
cm0uY29tPg0KVGVzdGVkLWJ5OiBMdWNhIEZhbmNlbGx1IDxsdWNhLmZhbmNlbGx1QGFybS5jb20+
DQoNCg0K

