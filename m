Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B583FA34B
	for <lists+xen-devel@lfdr.de>; Sat, 28 Aug 2021 05:10:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.174162.317738 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJois-00079x-HT; Sat, 28 Aug 2021 03:09:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 174162.317738; Sat, 28 Aug 2021 03:09:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJois-000782-DV; Sat, 28 Aug 2021 03:09:34 +0000
Received: by outflank-mailman (input) for mailman id 174162;
 Sat, 28 Aug 2021 03:09:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sP14=NT=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mJoiq-00077w-A1
 for xen-devel@lists.xenproject.org; Sat, 28 Aug 2021 03:09:32 +0000
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (unknown
 [40.107.12.57]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5c177150-07ad-11ec-ab30-12813bfff9fa;
 Sat, 28 Aug 2021 03:09:30 +0000 (UTC)
Received: from DBBPR09CA0004.eurprd09.prod.outlook.com (2603:10a6:10:c0::16)
 by PR2PR08MB4812.eurprd08.prod.outlook.com (2603:10a6:101:25::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17; Sat, 28 Aug
 2021 03:09:28 +0000
Received: from DB5EUR03FT064.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:c0:cafe::94) by DBBPR09CA0004.outlook.office365.com
 (2603:10a6:10:c0::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17 via Frontend
 Transport; Sat, 28 Aug 2021 03:09:27 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT064.mail.protection.outlook.com (10.152.21.199) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.17 via Frontend Transport; Sat, 28 Aug 2021 03:09:27 +0000
Received: ("Tessian outbound 6ba9ec11d42b:v103");
 Sat, 28 Aug 2021 03:09:27 +0000
Received: from f33988c9cdfb.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7A6CEA5C-7955-40BF-996A-AE57EC1AFB9E.1; 
 Sat, 28 Aug 2021 03:09:21 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f33988c9cdfb.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Sat, 28 Aug 2021 03:09:21 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com (2603:10a6:10:2a2::7)
 by DB9PR08MB6890.eurprd08.prod.outlook.com (2603:10a6:10:2a8::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Sat, 28 Aug
 2021 03:09:20 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::b06a:b1ca:ba5f:f3b7]) by DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::b06a:b1ca:ba5f:f3b7%8]) with mapi id 15.20.4436.024; Sat, 28 Aug 2021
 03:09:20 +0000
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
X-Inumbo-ID: 5c177150-07ad-11ec-ab30-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GxBj5NEtDofLk2BxzJ/Y4p8Tdg16B/3aUZNZZs3kTvI=;
 b=5CVzzSBQ+5SAkgCCCzwnq0XLX1dnCa1FxcUMaqV6nDJpbqTrAsNZz0SGiTPPHXfvMr/f1Rk1sJh+paztjL8VGJFkVT+obJllINCC5TSTGbhsFs9d0IVwToSIUI1QHhc7XA/ndMfpm4wM8+iMIlrPZsyZJQXNS99PNMGepUks1C0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ccP34FgSL6a0zVLRSFAlbt+DdNde/IDeL+Hmyp7heASBvtNJDAwLB4Fy4JC9BreIp9EgPAQ23iyg2RCXsc7DT8/DKQqRpB9iW7D0I0czY4SpJnUhxWypfSPz0OmMSiJ0XpwVJYQDfU7lyi6hJRGLJBzuywLGjZZcRwrMFd13ZORJShOWMsNslEJhOXbyYJ1P2k67+dMwkB8eDRyn8Qv0jCN7sRvveLgzIYA1BXclL+5dHGiUUfrMNJxIZqXX4tqewcRbq+H4Cgq62NEuxL3VolF3jA4EEGp3YG/84IPX4x22tcF6IydQjEdyC8UUTrd52XJrn9nAZ0VfvalYQFOWFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GxBj5NEtDofLk2BxzJ/Y4p8Tdg16B/3aUZNZZs3kTvI=;
 b=I3vey6slbuNl7JVfvKp/U6H/0l4EWv8P5h3LRlkxxtCV2c9yX00jRKY3dM3hCaUIWP8774iwgvnBErt/1tewD/TRWSZ9iXHmGCrDZggAsCbReIOR/ONCX8mddMR24KuOeunuME5PRF2zQJpg6n5iZz1GZych6dtu6RLEGVcROfBK4NsLqpuJg5RF37MHuKQ0ZVjZEalARoUTr0aTJ6oQsGuLEM9bfE8R/nWgs5uR5ZL7IUx/cOT7sVKCjDFGWEe2rwHM8fdGsUP14+csm+tp5Fp/OXFtH/xpnIIzDvv/+CYtO9ZzwSMaA87WcoJagQJeeUp5uPj+wiZ8MpCRgkhPzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GxBj5NEtDofLk2BxzJ/Y4p8Tdg16B/3aUZNZZs3kTvI=;
 b=5CVzzSBQ+5SAkgCCCzwnq0XLX1dnCa1FxcUMaqV6nDJpbqTrAsNZz0SGiTPPHXfvMr/f1Rk1sJh+paztjL8VGJFkVT+obJllINCC5TSTGbhsFs9d0IVwToSIUI1QHhc7XA/ndMfpm4wM8+iMIlrPZsyZJQXNS99PNMGepUks1C0=
From: Wei Chen <Wei.Chen@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: RE: [XEN RFC PATCH 37/40] xen: introduce an arch helper to do NUMA
 init failed fallback
Thread-Topic: [XEN RFC PATCH 37/40] xen: introduce an arch helper to do NUMA
 init failed fallback
Thread-Index: AQHXjptRsfRkXW8NoUWuJvdR0xpL2KuHguqAgADGK1A=
Date: Sat, 28 Aug 2021 03:09:20 +0000
Message-ID:
 <DB9PR08MB685769E192E0603F3C723FA09EC99@DB9PR08MB6857.eurprd08.prod.outlook.com>
References: <20210811102423.28908-1-wei.chen@arm.com>
 <20210811102423.28908-38-wei.chen@arm.com>
 <48a54187-3b6b-f98c-3681-906ee3df1694@xen.org>
In-Reply-To: <48a54187-3b6b-f98c-3681-906ee3df1694@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: jbeulich@suse.com
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: C55EE5742FB0874F95A4069E14332274.0
x-checkrecipientchecked: true
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: b92a82a3-1119-4a60-ea4a-08d969d13f1c
x-ms-traffictypediagnostic: DB9PR08MB6890:|PR2PR08MB4812:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<PR2PR08MB4812C02FF9A8B4555D6830469EC99@PR2PR08MB4812.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:323;OLM:323;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 bw0gxR47FLkCLndo0S88EW7R6F/es1J/r6kCLl3Wk9GOZT9OrrCWhSKWKyPVK24493q73NYQJeOAziAfzr2u2mM+DPGXddzyCAJoCbyOLqsjjM+1yhusW8SldNK/D96TDLtaLhTzXt2FRtSG+KFMgotUCT0U2e1e5kMAJIEJwghtYyq1wrjzy9HZDPx6wymXQFtXxPM0n717xSUFL0xsvI/KDizRb6l4kULwgvBRJQI2j4yFalA2zKR6toePYC2zQJo6ZaTvcdGjnE+6jONXYf3X3CEY+WlHxcnz3nvg/gMMqCC5qva1U85NA7LZPh+416J2ASS9fANWxr49slF6kZJHGEvLWHV7aT5cwRcTjTjCipVsIIYKYEi3vp0j6j3DGJjgwhzxYxrrgeMs94N6n+1XI7gxc+hX4hChbcvAHsi2DZIvvXOeEDnBQapPe6eaTFn3GttzbM7D7BCjCRkVLvfJUfBJhsKCtDlj2uWjFgRTyW5hcUK42Jko/LhmI2aX3TATx+EfyFvqmpOk49OIExBkmKPjsYKjB+r3l8F4/9RGH9uMZeUF+wEmMQEaba/aQ3y8vjYA1vGH+PnGzTZT9V46/FywwFDlgurUcZTfGQJQpSNlbiEifyXHrYdWX7N2vTHAueAUlYTBClisXX6/spMXesbv1BTPEa0GI5pKuq5MzwqZRuupw8y2aIj8CpI9gvlUR8BJJyCdt65Rsn1Brg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6857.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39850400004)(366004)(376002)(346002)(136003)(4326008)(38070700005)(83380400001)(478600001)(5660300002)(86362001)(26005)(71200400001)(2906002)(9686003)(38100700002)(186003)(33656002)(52536014)(66946007)(66556008)(66446008)(64756008)(66476007)(110136005)(8676002)(316002)(7696005)(8936002)(6506007)(53546011)(55016002)(122000001)(76116006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aHlmbWhacEVweDNkMVdZOGRxcFdXS3FzS1MxcGlJSkMrRndxVk13QzI1WW9M?=
 =?utf-8?B?ck9kdHdMYXdoUEVoQjJmamZuNTkrbHRKRGpodXNqbDU2OTNobXg3bG1kVGRJ?=
 =?utf-8?B?Qm1qMWZDOER5RmJUbURaWVU3TksyNWk2RDBEOHNnZ2VWaC8wdCtwbVBtbkJF?=
 =?utf-8?B?YUxrVGw3WkRXNkJGR0hWeWhHMGpUaGEzQk9xSXNvT0VPa2c3NENZbDdyVm5o?=
 =?utf-8?B?OXV0ZVNDV1I5QWhLZm5makJpZ3hnay9IWXRPdlFERU44Rzk2OEZwQ2ZTM3E1?=
 =?utf-8?B?MENIL29QaUNkZVMvTlNBQmRrdGJFV1BqdzdTdlNmMzdNYTJOWHFqWHRRWHZh?=
 =?utf-8?B?Y3pRcUVZU3V0NWRXYkppdWtUZU5IOU1MaW03ZTBUK3ZnU3Zrb3NMWHMwREI1?=
 =?utf-8?B?eHdvbStuaVBkaXBRVWh2ZGpza0x1M2lRV0FnODlhOGFIUi9aMzMvZW42ckxj?=
 =?utf-8?B?NEh3WEo4Z3RzZDQzUzlTSVlGVWZKU0hJZHZHUWVkSWlkSkNib0cxL2hBN1BR?=
 =?utf-8?B?M3RlM3k5NCtCTmswTWw5TDdXNEtKcUdHNWJsckp4VjdiRzB2OHBvVEZSVEw5?=
 =?utf-8?B?VFp1eU54c3NMa1VHL2VIdnRwMWM4TEphR21zREdiWW9TdnB3eUdMS0NmZDhj?=
 =?utf-8?B?ZnhqZjRLL0JSMUorYmVFdzBjaTdWNm04OUJaTnloVVEvaVkrSVpJcUtRWk1p?=
 =?utf-8?B?SjdzcVJISnN0YXRjaFZ2MGR1VmFwUytIeTQ2elJXN3ZjaUg0aGJsbVQyTjV2?=
 =?utf-8?B?ek02d2czZEZwbVZnTmlXNGdvWjBRMXNrZDE5ek80QzhHTXlIeGtSY3RCRytz?=
 =?utf-8?B?blBYSyt3NklMWjJCVDhQWk9YY3BLYVMwMmx4YzkvbWc3b0FxWWVjd1lzR2RB?=
 =?utf-8?B?SGQzbFpXZW9sSUkrSGtLNmdmNU4xSjRyVXRpSy9xWW1Ta0cyK0FwOXZtOUE2?=
 =?utf-8?B?b3RYSnd2R3hKdE5UL2NHQzNQYzB4cUhzV3JzejNlblUrSEgzRHVuZ3dBNjlB?=
 =?utf-8?B?Y2MrSkVWMnRzM096QXVSL0t6UXZDN1lEK3F4K0wzSStDNnA0M1BuUjhqTVdt?=
 =?utf-8?B?VVplaXcxUlZTSThiMW41UnB4bVdDMksvOGRvMTNxMEo5TlducXFSdnkwVzly?=
 =?utf-8?B?MURGT3Q0b20wdXpXQXdOcFd6cXR2eUY0c0hNRGEvOHpEdk9aKzB4RGJhNXRJ?=
 =?utf-8?B?ZWt3QURpRk1BaGZ5MURhazZqUHRqZ05KQWwrVHdqTjU0ejhhd015WUZMWHFU?=
 =?utf-8?B?U3RZZUVlOHJsbTlQN0ZkQU12SEQ2UUxkKzI5Q1MrcnZEY1NyY093UGZYYTNk?=
 =?utf-8?B?Z3dERlp2bGFxK0NRM0RCeFpnYkxrWnowZFp6TXVNWXl1Rzg0bllHQmVhYWZN?=
 =?utf-8?B?NTE1QUhwcVRlQ1JwdkNqRGpjbDZTMlJWZmdvRWtKRkNqR2RzTHJtSVNaaFBu?=
 =?utf-8?B?T2hXZWUrV2xPNS9RS1V2dW0xT1dhYWQvTExQUW9yTW55bHRseHFtNVlrQll5?=
 =?utf-8?B?MmFkOFlVTlJQWFd0SzBjSTNhM3M4RjV2eHBGZ0tsVlBOdlRISWw5Y256Q1NN?=
 =?utf-8?B?cDlVR2dWZ2REZkcyMmpaWnlIVlJzcGxzQ3M3azhseDlWak5ldWdmd0x5bzk2?=
 =?utf-8?B?cElJWWFnZ3AySHMyWnNsdXRwUmlWY2hwUmdBdm41K2tNSm5IVml6UzZkMXZi?=
 =?utf-8?B?b1JqYnJTdjZLOEFVTlhLVE4wc3lGMGRRbHVDRmxWMEhoOHZjWHFsUjI0THE2?=
 =?utf-8?Q?8/2SGmjWojVE9Be9hoRsLrXj6AYuMkvH9bJFvW0?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6890
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3a9f87a1-789b-4fd2-fa7b-08d969d13aef
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4PUAKWX61dAr2BnUlDSwgdYqz6hanBAK0715gxk3qFZ6S5sPYgbVJew/ApePcKATw6XNR/DwSooYKdfKyVa0C5o9FZ5ziJSguD6ZGwKtu5q5R7qOzTj5jP2wlDqDur6SukruqOf3eOvAaga58dMiwmRMLAbWqoTHpEh4LKk6qLoBV8TCtLDGbPgGJUThqUVOrYmUMTuEjQHgS9YqRLQvJppjvM57pQCwCtzloGa9BuyzhLe+w/WSwxQaIIwTAjqpAn2EF7Zosl1qXhr7VOpA819rDCNlV5xXWTuiHRTi//8q3hnwQiaXq4iQ7FK0Un1/omhtBq+6VA6Fw8UHWrHtwMxH/l2k87j1u3RXT1MAtp9jUXOa12eKlaF8cm7wX8sOrBm8mpbRNGSqB1sMJIJmYPhnF31mXUAcXeM2o8bOJ4JAP1SHigfA54TbVlknFUAl+OxcOG/EnPwypN/RurWZCxihbBxBWKPmHWvHz3HfhKkcz4KDvBxGkg0QD1jAIcVgepNW26BRYkdunfjsUCVAuwzNr6TCufeuf0wEC6pLcGTilBeUSKDOsMk4+9a65zam8aVSK7+O3WrwNGpg+NCWgZ8Ak5riBVDKyY6cmAYc02tNLwK+2v3U6Y9cenJUUUSbIqO5tqoOmFY2Z0ruaWc19OjEVcOfgFpzBgmieNLF37gYAJ3XFdzxdYl6yDzv8BHlxc05vhcpf/9kWdlYL8yxkQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(33656002)(36860700001)(70586007)(8936002)(83380400001)(186003)(336012)(86362001)(4326008)(316002)(81166007)(8676002)(356005)(2906002)(70206006)(53546011)(6506007)(47076005)(5660300002)(55016002)(26005)(9686003)(110136005)(7696005)(508600001)(82310400003)(52536014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2021 03:09:27.7516
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b92a82a3-1119-4a60-ea4a-08d969d13f1c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR08MB4812

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IFNlbnQ6IDIwMjHlubQ45pyIMjfml6UgMjI6MzAN
Cj4gVG86IFdlaSBDaGVuIDxXZWkuQ2hlbkBhcm0uY29tPjsgeGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnOw0KPiBzc3RhYmVsbGluaUBrZXJuZWwub3JnOyBqYmV1bGljaEBzdXNlLmNvbQ0K
PiBDYzogQmVydHJhbmQgTWFycXVpcyA8QmVydHJhbmQuTWFycXVpc0Bhcm0uY29tPg0KPiBTdWJq
ZWN0OiBSZTogW1hFTiBSRkMgUEFUQ0ggMzcvNDBdIHhlbjogaW50cm9kdWNlIGFuIGFyY2ggaGVs
cGVyIHRvIGRvDQo+IE5VTUEgaW5pdCBmYWlsZWQgZmFsbGJhY2sNCj4gDQo+IEhpLA0KPiANCj4g
T24gMTEvMDgvMjAyMSAxMToyNCwgV2VpIENoZW4gd3JvdGU6DQo+ID4gV2hlbiBYZW4gaW5pdGlh
bGl6ZSBOVU1BIGZhaWxlZCwgc29tZSBhcmNoaXRlY3R1cmVzIG1heSBuZWVkIHRvDQo+ID4gZG8g
ZmFsbGJhY2sgYWN0aW9ucy4gRm9yIGV4YW1wbGUsIGluIGRldmljZSB0cmVlIGJhc2VkIE5VTUEs
IEFybQ0KPiA+IG5lZWQgdG8gcmVzZXQgdGhlIGRpc3RhbmNlIGJldHdlZW4gYW55IHR3byBub2Rl
cy4NCj4gDQo+ICBGcm9tIHRoZSBkZXNjcmlwdGlvbiBoZXJlLCBJIGRvbid0IHVuZGVyc3RhbmQg
d2h5IHdlIG5lZWQgdG8gcmVzZXQgdGhlDQo+IGRpc3RhbmNlIGZvciBBcm0gYnV0IG5vdCB4ODYu
IEluIGZhY3QuLi4NCj4gDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBXZWkgQ2hlbiA8d2VpLmNo
ZW5AYXJtLmNvbT4NCj4gPiAtLS0NCj4gPiAgIHhlbi9hcmNoL2FybS9udW1hLmMgICAgICAgIHwg
MTMgKysrKysrKysrKysrKw0KPiA+ICAgeGVuL2NvbW1vbi9udW1hLmMgICAgICAgICAgfCAgMyAr
KysNCj4gPiAgIHhlbi9pbmNsdWRlL2FzbS1hcm0vbnVtYS5oIHwgIDEgKw0KPiA+ICAgeGVuL2lu
Y2x1ZGUvYXNtLXg4Ni9udW1hLmggfCAgNiArKysrKysNCj4gPiAgIDQgZmlsZXMgY2hhbmdlZCwg
MjMgaW5zZXJ0aW9ucygrKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9udW1h
LmMgYi94ZW4vYXJjaC9hcm0vbnVtYS5jDQo+ID4gaW5kZXggNmVlYmY4ZThiYy4uMmExOGM5NzQ3
MCAxMDA2NDQNCj4gPiAtLS0gYS94ZW4vYXJjaC9hcm0vbnVtYS5jDQo+ID4gKysrIGIveGVuL2Fy
Y2gvYXJtL251bWEuYw0KPiA+IEBAIC0xNDAsMyArMTQwLDE2IEBAIGludCBfX2luaXQgYXJjaF9t
ZW1pbmZvX2dldF9yYW1fYmFua19yYW5nZShpbnQgYmFuaywNCj4gPg0KPiA+ICAgCXJldHVybiAw
Ow0KPiA+ICAgfQ0KPiA+ICsNCj4gPiArdm9pZCBfX2luaXQgYXJjaF9udW1hX2luaXRfZmFpbGVk
X2ZhbGxiYWNrKHZvaWQpDQo+ID4gK3sNCj4gPiArICAgIGludCBpLCBqOw0KPiA+ICsNCj4gPiAr
ICAgIC8qIFJlc2V0IGFsbCBub2RlIGRpc3RhbmNlIHRvIHJlbW90ZV9kaXN0YW5jZSAqLw0KPiA+
ICsgICAgZm9yICggaSA9IDA7IGkgPCBNQVhfTlVNTk9ERVM7IGkrKyApIHsNCj4gPiArICAgICAg
ICBmb3IgKCBqID0gMDsgaiA8IE1BWF9OVU1OT0RFUzsgaisrICkgew0KPiA+ICsgICAgICAgICAg
ICBudW1hX3NldF9kaXN0YW5jZShpLCBqLA0KPiA+ICsgICAgICAgICAgICAgICAgKGkgPT0gaikg
PyBOVU1BX0xPQ0FMX0RJU1RBTkNFIDogTlVNQV9SRU1PVEVfRElTVEFOQ0UpOw0KPiA+ICsgICAg
ICAgIH0NCj4gPiArICAgIH0NCj4gPiArfQ0KPiANCj4gLi4uIHRoaXMgaW1wbGVtZW50YXRpb24g
bG9va3MgZmFpcmx5IGdlbmVyaWMuIFNvIGNhbiB5b3UgZXhwbGFpbiB3aHkgd2UNCj4gbmVlZCBp
dCBvbiBBcm0gYnV0IG5vdCB4ODY/DQo+IA0KDQpUaGlzIGltcGxlbWVudGF0aW9uIGlzIERUIG9u
bHksIGZvciB4ODYsIGl0J3MgdXNpbmcgYWNwaV9zbGl0Lg0KRm9yIG5vdywgSSBhbSBub3QgcXVp
dCBzdXJlIEFDUEkgbmVlZCB0byBkbyBmYWxsYmFjayBvciBub3QuDQpPciBzYXkgaW4gYW5vdGhl
ciB3YXksIEkgZG9uJ3Qga25vdyBob3cgdG8gaW1wbGVtZW50IHRoZSBmYWxsYmFjaw0KZm9yIEFD
UEkuIEkgcGxhbm5lZCB0byBzb2x2ZSBpdCBpbiBBcm0gQUNQSSB2ZXJzaW9uIE5VTUEsIHNvIEkg
bGVmdA0KYW4gZW1wdHkgaGVscGVyIGZvciB4ODYuDQoNCkBKYW4gQmV1bGljaCBDb3VsZCB5b3Ug
Z2l2ZSBtZSBzb21lIHN1Z2dlc3Rpb24gYWJvdXQgeDg2IGZhbGxiYWNrPw0KDQoNCj4gPiBkaWZm
IC0tZ2l0IGEveGVuL2NvbW1vbi9udW1hLmMgYi94ZW4vY29tbW9uL251bWEuYw0KPiA+IGluZGV4
IGQxNWMyZmMzMTEuLjg4ZjE1OTQxMjcgMTAwNjQ0DQo+ID4gLS0tIGEveGVuL2NvbW1vbi9udW1h
LmMNCj4gPiArKysgYi94ZW4vY29tbW9uL251bWEuYw0KPiA+IEBAIC00MDUsNCArNDA1LDcgQEAg
dm9pZCBfX2luaXQgbnVtYV9pbml0bWVtX2luaXQodW5zaWduZWQgbG9uZw0KPiBzdGFydF9wZm4s
IHVuc2lnbmVkIGxvbmcgZW5kX3BmbikNCj4gPiAgICAgICBjcHVtYXNrX2NvcHkoJm5vZGVfdG9f
Y3B1bWFza1swXSwgY3B1bWFza19vZigwKSk7DQo+ID4gICAgICAgc2V0dXBfbm9kZV9ib290bWVt
KDAsICh1NjQpc3RhcnRfcGZuIDw8IFBBR0VfU0hJRlQsDQo+ID4gICAgICAgICAgICAgICAgICAg
ICAgICh1NjQpZW5kX3BmbiA8PCBQQUdFX1NISUZUKTsNCj4gPiArDQo+ID4gKyAgICAvKiBhcmNo
aXRlY3R1cmUgc3BlY2lmaWVkIGZhbGxiYWNrIG9wZXJhdGlvbnMgKi8NCj4gPiArICAgIGFyY2hf
bnVtYV9pbml0X2ZhaWxlZF9mYWxsYmFjaygpOw0KPiA+ICAgfQ0KPiA+IGRpZmYgLS1naXQgYS94
ZW4vaW5jbHVkZS9hc20tYXJtL251bWEuaCBiL3hlbi9pbmNsdWRlL2FzbS1hcm0vbnVtYS5oDQo+
ID4gaW5kZXggZGQzMTMyNGIwYi4uYTM5ODJhOTRiNiAxMDA2NDQNCj4gPiAtLS0gYS94ZW4vaW5j
bHVkZS9hc20tYXJtL251bWEuaA0KPiA+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS1hcm0vbnVtYS5o
DQo+ID4gQEAgLTI4LDYgKzI4LDcgQEAgZXh0ZXJuIHM4IGRldmljZV90cmVlX251bWE7DQo+ID4g
ICBleHRlcm4gdm9pZCBudW1hX2luaXQoYm9vbCBhY3BpX29mZik7DQo+ID4gICBleHRlcm4gaW50
IG51bWFfZGV2aWNlX3RyZWVfaW5pdChjb25zdCB2b2lkICpmZHQpOw0KPiA+ICAgZXh0ZXJuIHZv
aWQgbnVtYV9zZXRfZGlzdGFuY2Uobm9kZWlkX3QgZnJvbSwgbm9kZWlkX3QgdG8sIHVpbnQzMl90
DQo+IGRpc3RhbmNlKTsNCj4gPiArZXh0ZXJuIHZvaWQgYXJjaF9udW1hX2luaXRfZmFpbGVkX2Zh
bGxiYWNrKHZvaWQpOw0KPiA+DQo+ID4gICAvKg0KPiA+ICAgICogVGVtcG9yYXJ5IGZvciBmYWtl
IE5VTUEgbm9kZSwgd2hlbiBDUFUsIG1lbW9yeSBhbmQgZGlzdGFuY2UNCj4gPiBkaWZmIC0tZ2l0
IGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9udW1hLmggYi94ZW4vaW5jbHVkZS9hc20teDg2L251bWEu
aA0KPiA+IGluZGV4IGU2Mzg2OTEzNWMuLjI2MjgwYjBmM2EgMTAwNjQ0DQo+ID4gLS0tIGEveGVu
L2luY2x1ZGUvYXNtLXg4Ni9udW1hLmgNCj4gPiArKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L251
bWEuaA0KPiA+IEBAIC0yMiw0ICsyMiwxMCBAQCBleHRlcm4gdm9pZCBpbml0X2NwdV90b19ub2Rl
KHZvaWQpOw0KPiA+ICAgdm9pZCBzcmF0X3BhcnNlX3JlZ2lvbnModTY0IGFkZHIpOw0KPiA+ICAg
dW5zaWduZWQgaW50IGFyY2hfZ2V0X2RtYV9iaXRzaXplKHZvaWQpOw0KPiA+DQo+ID4gKy8qIER1
bW15IGZ1bmN0aW9uIGZvciBudW1hIGluaXQgZmFpbGVkIGluIG51bWFfaW5pdG1lbV9pbml0ICov
DQo+ID4gK3N0YXRpYyBpbmxpbmUgdm9pZCBhcmNoX251bWFfaW5pdF9mYWlsZWRfZmFsbGJhY2so
dm9pZCkNCj4gPiArew0KPiA+ICsgICAgcmV0dXJuOw0KPiANCj4gTklUOiBUaGUgcmV0dXJuIGlz
IHBvaW50bGVzcy4NCj4gDQoNCk9LDQoNCj4gPiArfQ0KPiA+ICsNCj4gPiAgICNlbmRpZg0KPiA+
DQo+IA0KPiBDaGVlcnMsDQo+IA0KPiAtLQ0KPiBKdWxpZW4gR3JhbGwNCg==

