Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 464CD3FA314
	for <lists+xen-devel@lfdr.de>; Sat, 28 Aug 2021 04:12:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.174132.317679 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJnop-0006rj-R4; Sat, 28 Aug 2021 02:11:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 174132.317679; Sat, 28 Aug 2021 02:11:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJnop-0006oe-ML; Sat, 28 Aug 2021 02:11:39 +0000
Received: by outflank-mailman (input) for mailman id 174132;
 Sat, 28 Aug 2021 02:11:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sP14=NT=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mJnoo-0006oY-8O
 for xen-devel@lists.xenproject.org; Sat, 28 Aug 2021 02:11:38 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.14.75]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 44e634ec-07a5-11ec-ab2e-12813bfff9fa;
 Sat, 28 Aug 2021 02:11:35 +0000 (UTC)
Received: from DB8PR06CA0033.eurprd06.prod.outlook.com (2603:10a6:10:100::46)
 by AM8PR08MB5810.eurprd08.prod.outlook.com (2603:10a6:20b:1d2::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Sat, 28 Aug
 2021 02:11:30 +0000
Received: from DB5EUR03FT053.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:100:cafe::1e) by DB8PR06CA0033.outlook.office365.com
 (2603:10a6:10:100::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.18 via Frontend
 Transport; Sat, 28 Aug 2021 02:11:30 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT053.mail.protection.outlook.com (10.152.21.119) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.17 via Frontend Transport; Sat, 28 Aug 2021 02:11:30 +0000
Received: ("Tessian outbound 19a632698c93:v103");
 Sat, 28 Aug 2021 02:11:30 +0000
Received: from 666d6b2588fd.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D42E4C8E-998C-46C1-88A8-6F254C213407.1; 
 Sat, 28 Aug 2021 02:11:19 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 666d6b2588fd.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Sat, 28 Aug 2021 02:11:19 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com (2603:10a6:10:2a2::7)
 by DBBPR08MB4490.eurprd08.prod.outlook.com (2603:10a6:10:c5::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Sat, 28 Aug
 2021 02:11:17 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::b06a:b1ca:ba5f:f3b7]) by DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::b06a:b1ca:ba5f:f3b7%8]) with mapi id 15.20.4436.024; Sat, 28 Aug 2021
 02:11:17 +0000
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
X-Inumbo-ID: 44e634ec-07a5-11ec-ab2e-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YddDzNFJo0PdVji4yDUv8r6E/XwmA0a5N9vWbUp1hFo=;
 b=ul+MwaCLPPrvASAZNDEwK8MPk8F0KZEVJctbnQOxbUGa6KsArU1UjXW/zVoDDb0NtMDQD17+N4HbTSlxIZF2Yij7WnZluvQyL11QBlaUmNDEtUvtgw/GzvOEShptsYinnpIiiNcYRrW39Nl1uOlF982+fI8+e/fl+e9P8eFR8+M=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fweHNavgjpK3RFGImCE04hthNVBs6YEyAEaov6+eyw9OGuSA0DgdRdmH2yZ0nskJtNC+E+4sO0W/3S2OTArMcSXCa+owgEN/KdxTTbYGGzTgCIfuS/2QTGvPRwJrpENe4mJ8penXqWCmHrgaquF6Md+VxT7g4o8q31AUqCs2j/pVWWiEpyCWqUH2rlacudj5s5BsX+4KOqnvhvLkeSUeXlSiTUYUK5juWTFl6fqcYBCyHLSCMhuSppyAF4utuNuFO9XRFKPLTOiRc4ThT1UMbbK2FBkiODTbpzxLyhPFnfexS5cRR1By0oVM1EOk59p9742ntM/Y4kDoPIRz+9D++A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YddDzNFJo0PdVji4yDUv8r6E/XwmA0a5N9vWbUp1hFo=;
 b=QcTU9AZJ9BqvUVPMn8i5sWkp6E+EAWlbXuH2vZpXSPeodHxAKtkbzQ8KRQItTO/vHZrwUL+phm4j7GiftqMdBnHgReys+UHcmx/lQAfP9qe3SV/kbB5imt/0C78rc8pydRFyWItNa5cLh+9xxZ1pehTvgT+Cke6viliz1UyTw5dbAx2j64X4+4TyOOi90kM4OqZiXGUj40wl+agdMXfrtxvLdJY0KfudEoQy+xRXci7/6VO158TA86YLsEwI9kfIYPzczmyIH0L5I4m1VPZ6EplObtYBvzQaw2ozTpxPpNXptw63ps8xJWhHKcvOlwxt0oxFKaWU9U/slgkDzghRJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YddDzNFJo0PdVji4yDUv8r6E/XwmA0a5N9vWbUp1hFo=;
 b=ul+MwaCLPPrvASAZNDEwK8MPk8F0KZEVJctbnQOxbUGa6KsArU1UjXW/zVoDDb0NtMDQD17+N4HbTSlxIZF2Yij7WnZluvQyL11QBlaUmNDEtUvtgw/GzvOEShptsYinnpIiiNcYRrW39Nl1uOlF982+fI8+e/fl+e9P8eFR8+M=
From: Wei Chen <Wei.Chen@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: RE: [XEN RFC PATCH 32/40] xen/x86: make acpi_scan_nodes to be neutral
Thread-Topic: [XEN RFC PATCH 32/40] xen/x86: make acpi_scan_nodes to be
 neutral
Thread-Index: AQHXjptLHChzC8DaK0WpJXATzNxti6uHfOoAgADIL5A=
Date: Sat, 28 Aug 2021 02:11:17 +0000
Message-ID:
 <DB9PR08MB685704904D89A16F9603D32B9EC99@DB9PR08MB6857.eurprd08.prod.outlook.com>
References: <20210811102423.28908-1-wei.chen@arm.com>
 <20210811102423.28908-33-wei.chen@arm.com>
 <f830422a-79e3-b9d7-138c-3db468f8376b@xen.org>
In-Reply-To: <f830422a-79e3-b9d7-138c-3db468f8376b@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: CD763C63A0057B4F877EC155A54F7514.0
x-checkrecipientchecked: true
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 1f5c9367-becd-4a5d-49f1-08d969c92663
x-ms-traffictypediagnostic: DBBPR08MB4490:|AM8PR08MB5810:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM8PR08MB5810D0995BF5E76854C593849EC99@AM8PR08MB5810.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 yvsYfVVPtzXxwXE2SH1ITFkwYNHImbJ7ZYUORTPBUUoTtmHz0TmcH3lz8xzmvneBKBLZxdpVk+T2d5rPInhA8mXWGBZm98fcyScX7ZkAe4XPY2e7h6rkPN1OzEczofQFZiOo4/GG/FUTbjOyRmKzuhTj1CmsXr/SgX6D23oOmA1BoltkHSsiTFBeuAFKGwGpfAm2xvreKFx+TZJhJ0liJCbQak7T14+8Sp1Mxc9f9FcFWeox2KPSmXqIxeQEjbWWoGLvxQkP31g5Pmm6Gp/RQaFAYOGvaM0jNtHeEj9uFfyJcbfEJ/9l4o0wM455TbuMPNG6/VqPB02l+P0+FwBJkHhP10gLZ/vmppSC0Nq+7WAXA9QI5ySdPGN1n/PofTaYBHBjJZS4Orw8Tbo2I3IBHcj5CZcDZDkdT/NG4kPj7BBJQHkakaTQrRwjQqi+aBP4DQjDpkL51jgJsBwoT9r5lDTeBklxgnSSJXZeAmo/kafTTwhoEhtVz8mb1ED+5y5AmmN3X6eHYAvYSrjUZt9tXSo9yY76T1pHOEABJ45ldTUfwX1xHzDEJYC4E8BNCNywQihkyuPpokwzhOMZdZ++DEPy/5bOZrNMecturjh7w/27QypzazfVlEt9hBr/kfxrSAj580MSvEjSXSyAhyGrnv1eJGO6KCC7SFQks3BU6xS8pMJBmBvquyc17b2VND2Y3l5Ln6nCV3v3JSobTZupWg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6857.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(122000001)(26005)(38100700002)(53546011)(66946007)(186003)(8676002)(66476007)(71200400001)(83380400001)(5660300002)(76116006)(66556008)(66446008)(64756008)(9686003)(52536014)(4326008)(6506007)(508600001)(316002)(38070700005)(33656002)(55016002)(7696005)(8936002)(2906002)(110136005)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?T3Y3S2tYRGxrUmVicmRrdVRiRkRKY0xYM0s2eGEyRXE5WmlZZllmb3k3LzZw?=
 =?utf-8?B?UnhLVTFES3ZGdTk2Rm9oUTRVNnh3TEtYWGdlOWFDdDFZVVloc1dINzZUN1Ar?=
 =?utf-8?B?RitWZVEyQUtyNTZ0TnFiMjQyeko5V2dCNWVWbDlrWDNTVWJETE1Xalg4RjhB?=
 =?utf-8?B?dkl1ckdNcHVycjBtWFlyL1Q0M25lS3lDTG5mQWlFMUkvOFA3WXZ0MW5yYXZS?=
 =?utf-8?B?T1lQSXBRMWF0OS9ENk5TL3hTSEZSakY1ZXBYUFpHUVFUSEltRGN2cUdaeXFO?=
 =?utf-8?B?WUh1ZnduRmZkbHcxa21xZS9ibWRLeDdrZUFUOG05RWFUaUlCVWR0ZFpJVnZs?=
 =?utf-8?B?UUNxL1FLWTZXZjBwclpQR2s3bmg4aUIxRFRWUUxKRUFhWHlvbWFMQWV6M1gz?=
 =?utf-8?B?L1FodWZCQzFFTlMxazZTbDRwQk9BSDJEQ2pCTnVvK1RHRzlqSnNCNmxkcmwv?=
 =?utf-8?B?UTJmMkIzbmNuejRVLzFmUldIWTgvVHBNTE5NVnZnRHMzQmJtSXEzQUg4S0VH?=
 =?utf-8?B?ME9iNmhoNy9jcmRZU1JaelFCVkRlbFo2djlvQ2FaaVJ3M3d0YmdiRjI2ZUJO?=
 =?utf-8?B?MXlGYVFxTDJuUnp0d2tTSm5zSmJncjEzS1l2SUMzKzNPQy9DNHlLQ0RiWEZJ?=
 =?utf-8?B?TDNCZi8xT0xHRlV6bEZQUUFtU3lsSWJtZFlxVXh6L1o5N0haaElpZGxVM3Jz?=
 =?utf-8?B?QkFSeW10RVo4bEg3aHNqMnMzTzVvbVVLdkp6cXdsWjJHN01qT04yV1MzN3F2?=
 =?utf-8?B?dUFzWXo4UDlhYnVlak5VSHV5MXlqWFVkRURPbm5wNzhGTnFyQmNQN1k4N2Nk?=
 =?utf-8?B?VDNpM1pKeHNNZGFWUHhDYklvZ2c0MEZuR0dMRE5hTUFOOUxCRCtlT2RNc21t?=
 =?utf-8?B?TEduM05pWGFSZ2RlZUFqTFQwZTdwNlR5bnZpd2RaRk1vdUU3VXY2MTZHT25X?=
 =?utf-8?B?RUtoUy9sR0xIc3paeGNvL013UlVLeUxGZnpsM2FweXhhTmtscU1WRjkremsx?=
 =?utf-8?B?Mi9ITzliWHpzS3lobkVpcnhNbnY4b1FaWlE2SktQVXdQaFhiTSt6S3JaNlJL?=
 =?utf-8?B?WW1GUFg3NXV6OVBrMFhQeS9FcDhHcjlSUE84Vzh6d0VxN1ZrOGhwb0Qyb3dX?=
 =?utf-8?B?UlAzeGRXWGFmdE5vNllLdk9OVVArVE5BNUtEZk9aeEhHT2twL2I3eFJsaFB2?=
 =?utf-8?B?bHhBZGJTTDlIT1dKZVNOU0Z2Mms2WW1VRTJlNDhpbGYzWXNSZDF2L2hzZy94?=
 =?utf-8?B?NGRsN1VxSTRwdlJGY1kzRHlmZ2JnVmNiT0RoVmt2dTNUY1RZaW5rOEZ3VmFK?=
 =?utf-8?B?TVhZNCs4VlhjWnVyaVRad1lBN2M3a2hvZ3hrMjZqZXhSeUUwc00vL0pEQ0oz?=
 =?utf-8?B?VE9jR2RDWnpqVWY4bkN0cXJlTnFBb3JUUjlUdDlzRVByK0lsUmx4a2hPNEty?=
 =?utf-8?B?c3Z4SW5sNUI3L0w2NkY4amV4L2dhK0dMRy9mQlBVVGxLMk1qUGhvN1NqMWli?=
 =?utf-8?B?VEFQUzFNZEZEMkZiVmZ4V01ua2RxTXczM21vYUFTMDJ0R2FlbnJna3k2ZmtR?=
 =?utf-8?B?V1VOeHF1RXRpNVV5d3VvL0pTWVdvMlYzeFdudmVvbUp0RmlmUml1c1lKMnRP?=
 =?utf-8?B?SEhhWTJJTWFkOGlBTXpzWjd6UWU3WTJleHpxWm9ncE15QktwN01iNmNITjdB?=
 =?utf-8?B?SmM5K2sxNUx6Z2huS09vTmJVc2Q0ODQ5TFkwK3lsamhjUXNnWUFzSjVHaWF2?=
 =?utf-8?Q?2lYSdqVyZBeVqppra/qkDSHISFRG3yC29lt3+xi?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4490
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	31116ebe-f417-443c-063f-08d969c91ed4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4HG/PqMO3LvvmGMYm/VwfynBqdYt3TtAuKFW3cUVFLL5hPm+P4/5EH6XJd3auA9W3HdGRZac3iE14NMP8xyz/s2z8X/czS0GyYJYWNudhgO//hyiHkCZk88XgY+9fw6LGF2R3fcSrxNoqQW9EN1lJp/dGm6MWTkSleV2IW6KKp4okrGtpHeyrKEjjPjevi/PA7AxNt2XJ/6PteO8CWDyeLuRjbClzPHsmaVIP19J/UtBd22cNsABb1At1X7LERvocLGKax3E8Qtm+tFFydvoAwDydaRXf1F04SqnluJggLb6BBfYDDkqxgP1VXoD6uj0GmGviXF/qBBm4LcpeC2PNVRPNjHZSdtC+bAwGCaxwIb5jNaDfTQOz2wTIjSVUc76tCf3vA9KEIwYvi0gT1ltpBhiUn/1W488/RZhoogKCXG6Q0UE6g9WHvCzBgGwgjHmkqBXE5CCvlLKyf07uCBXtPui+0ec+1LeK7JLgDX4ld05WSfRgUmYMxUit7+GjD/CupFV3JB07uSuQJPNvr+QB1GbLtoez5Gfw4NtvhkiLse2tPRFx5/gNaCpv74Zat/DKFjSNWe7lt5oScCy5gBzfSOfED7LKvNaBpJUjdN+2LqgbnoDAPkuUZlanYV0qA0JPyrxS1JlfMGS6LowsZTZjnd1pJCxp+F037KlQhHq/PmTmsvG6dW8mjUUDdmkyA7LTd6t1RnmCpZig0Bg8F5PCA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(39850400004)(396003)(136003)(346002)(46966006)(36840700001)(53546011)(82740400003)(110136005)(7696005)(478600001)(8936002)(4326008)(316002)(26005)(356005)(47076005)(82310400003)(8676002)(36860700001)(52536014)(2906002)(86362001)(83380400001)(336012)(33656002)(6506007)(81166007)(55016002)(9686003)(5660300002)(70206006)(70586007)(186003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2021 02:11:30.2950
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f5c9367-becd-4a5d-49f1-08d969c92663
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5810

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IFNlbnQ6IDIwMjHlubQ45pyIMjfml6UgMjI6MDkN
Cj4gVG86IFdlaSBDaGVuIDxXZWkuQ2hlbkBhcm0uY29tPjsgeGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnOw0KPiBzc3RhYmVsbGluaUBrZXJuZWwub3JnOyBqYmV1bGljaEBzdXNlLmNvbQ0K
PiBDYzogQmVydHJhbmQgTWFycXVpcyA8QmVydHJhbmQuTWFycXVpc0Bhcm0uY29tPg0KPiBTdWJq
ZWN0OiBSZTogW1hFTiBSRkMgUEFUQ0ggMzIvNDBdIHhlbi94ODY6IG1ha2UgYWNwaV9zY2FuX25v
ZGVzIHRvIGJlDQo+IG5ldXRyYWwNCj4gDQo+IEhpIFdlaSwNCj4gDQo+IE9uIDExLzA4LzIwMjEg
MTE6MjQsIFdlaSBDaGVuIHdyb3RlOg0KPiA+IFRoZSBjb2RlIGluIGFjcGlfc2Nhbl9ub2RlcyBj
YW4gYmUgcmV1c2VkIGZvciBkZXZpY2UgdHJlZSBiYXNlZA0KPiA+IE5VTUEuIFNvIHdlIHJlbmFt
ZSBhY3BpX3NjYW5fbm9kZXMgdG8gbnVtYV9zY2FuX25vZGVzIGZvciBhIG5ldXRyYWwNCj4gPiBm
dW5jdGlvbiBuYW1lLiBBcyBhY3BpX251bWEgdmFyaWFibGUgaXMgYXZhaWxhYmxlIGluIEFDUFUg
YmFzZWQgTlVNQQ0KPiA+IHN5c3RlbSBvbmx5LCB3ZSB1c2UgQ09ORklHX0FDUElfTlVNQSB0byBw
cm90ZWN0IGl0Lg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogV2VpIENoZW4gPHdlaS5jaGVuQGFy
bS5jb20+DQo+ID4gLS0tDQo+ID4gICB4ZW4vYXJjaC94ODYvc3JhdC5jICAgICAgICB8IDQgKysr
LQ0KPiA+ICAgeGVuL2NvbW1vbi9udW1hLmMgICAgICAgICAgfCAyICstDQo+ID4gICB4ZW4vaW5j
bHVkZS9hc20teDg2L2FjcGkuaCB8IDIgKy0NCj4gPiAgIDMgZmlsZXMgY2hhbmdlZCwgNSBpbnNl
cnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL3hlbi9hcmNo
L3g4Ni9zcmF0LmMgYi94ZW4vYXJjaC94ODYvc3JhdC5jDQo+ID4gaW5kZXggZGNlYmM3YWRlYy4u
M2Q0ZDkwYTYyMiAxMDA2NDQNCj4gPiAtLS0gYS94ZW4vYXJjaC94ODYvc3JhdC5jDQo+ID4gKysr
IGIveGVuL2FyY2gveDg2L3NyYXQuYw0KPiA+IEBAIC0zNjIsNyArMzYyLDcgQEAgdm9pZCBfX2lu
aXQgc3JhdF9wYXJzZV9yZWdpb25zKHU2NCBhZGRyKQ0KPiA+ICAgfQ0KPiA+DQo+ID4gICAvKiBV
c2UgdGhlIGluZm9ybWF0aW9uIGRpc2NvdmVyZWQgYWJvdmUgdG8gYWN0dWFsbHkgc2V0IHVwIHRo
ZSBub2Rlcy4NCj4gKi8NCj4gPiAtaW50IF9faW5pdCBhY3BpX3NjYW5fbm9kZXModTY0IHN0YXJ0
LCB1NjQgZW5kKQ0KPiA+ICtpbnQgX19pbml0IG51bWFfc2Nhbl9ub2Rlcyh1NjQgc3RhcnQsIHU2
NCBlbmQpDQo+ID4gICB7DQo+ID4gICAJaW50IGk7DQo+ID4gICAJbm9kZW1hc2tfdCBhbGxfbm9k
ZXNfcGFyc2VkOw0KPiA+IEBAIC0zNzEsOCArMzcxLDEwIEBAIGludCBfX2luaXQgYWNwaV9zY2Fu
X25vZGVzKHU2NCBzdGFydCwgdTY0IGVuZCkNCj4gPiAgIAlmb3IgKGkgPSAwOyBpIDwgTUFYX05V
TU5PREVTOyBpKyspDQo+ID4gICAJCWN1dG9mZl9ub2RlKGksIHN0YXJ0LCBlbmQpOw0KPiA+DQo+
ID4gKyNpZmRlZiBDT05GSUdfQUNQSV9OVU1BDQo+ID4gICAJaWYgKGFjcGlfbnVtYSA8PSAwKQ0K
PiA+ICAgCQlyZXR1cm4gLTE7DQo+ID4gKyNlbmRpZg0KPiANCj4gTG9va2luZyBhdCB0aGUgZm9s
bG93LXVwIHBhdGNoZXMsIEkgZmluZCBhIGJpdCBvZGQgdGhhdCB0aGVyZSBpcyBhIGNoZWNrDQo+
IGZvciBBQ1BJIGJ1dCB0aGVyZSBpcyBub25lIGFkZGVkIGZvciBEVC4gQ2FuIHlvdSBleHBsYWlu
IHdoeT8NCj4gDQoNCk9oLCBJIGZvcmdvdCBEVCBjaGVjay4gQW5kIHNpbXBseSB0byBhZGQgRFQg
Y2hlY2sgaGVyZSBzZWVtcyBub3QgYQ0KZ29vZCBpZGVhLiBCZWNhdXNlIG9uY2UsIHdoZW4gQXJt
IHN1cHBvcnQgQUNQSSBOVU1BLg0KQ09ORklHX0FDUElfTlVNQSBhbmQgQ09ORklHX0RFVklDRV9U
UkVFX05VTUEgY2FuIGJlIHNlbGVjdGVkIGF0DQp0aGUgc2FtZSB0aW1lLiBCdXQgb25seSBhY3Bp
X251bWEgb3IgZHRiX251bWEgY2FuIGJlID4gMC4NCg0KPiBIb3dldmVyLCBJIHRoaW5rIHRoaXMg
Y2hlY2sgaXMgZ29pbmcgdG8gaW1wYWlyIHRoZSB3b3JrIHRvIHN1cHBvcnQgYm90aA0KPiBBQ1BJ
IGFuZCBEVCBvbiBBcm0gYmVjYXVzZSBhY3BpX251bWEgd291bGQgZW5kIHVwIHRvIGJlIDAgc28g
eW91IHdvdWxkDQo+IGJhaWwgb3V0IGhlcmUuDQo+IA0KPiBXaXRoIHRoYXQgaW4gbWluZCwgSSB0
aGluayB0aGlzIGNoZWNrIG5lZWRzIHRvIGVpdGhlciBnbyBhd2F5IG9yIHJlcGxhY2UNCj4gYnkg
c29tZXRoaW5nIHRoZXJlIGlzIGZpcm13YXJlIGFnbm9zdGljLg0KDQpZZXMsIHdlIGhhdmUgZGlz
Y3Vzc2VkIGFib3V0IHNvbWV0aGluZyBsaWtlIGZ3X251bWEgYmVmb3JlLg0KPiANCj4gQ2hlZXJz
LA0KPiANCj4gLS0NCj4gSnVsaWVuIEdyYWxsDQo=

