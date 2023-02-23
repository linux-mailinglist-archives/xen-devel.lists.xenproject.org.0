Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F06A96A0B6C
	for <lists+xen-devel@lfdr.de>; Thu, 23 Feb 2023 15:01:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.500416.771780 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVC9x-0001ZR-Bt; Thu, 23 Feb 2023 14:01:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 500416.771780; Thu, 23 Feb 2023 14:01:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVC9x-0001X5-8z; Thu, 23 Feb 2023 14:01:21 +0000
Received: by outflank-mailman (input) for mailman id 500416;
 Thu, 23 Feb 2023 14:01:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ERnD=6T=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1pVC9v-0001Wz-TW
 for xen-devel@lists.xenproject.org; Thu, 23 Feb 2023 14:01:20 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2048.outbound.protection.outlook.com [40.107.7.48])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8ab284b3-b382-11ed-a82a-c9ca1d2f71af;
 Thu, 23 Feb 2023 15:01:17 +0100 (CET)
Received: from DB6PR07CA0069.eurprd07.prod.outlook.com (2603:10a6:6:2a::31) by
 GV1PR08MB7875.eurprd08.prod.outlook.com (2603:10a6:150:5e::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6134.21; Thu, 23 Feb 2023 14:00:43 +0000
Received: from DBAEUR03FT057.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:2a:cafe::12) by DB6PR07CA0069.outlook.office365.com
 (2603:10a6:6:2a::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.17 via Frontend
 Transport; Thu, 23 Feb 2023 14:00:43 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT057.mail.protection.outlook.com (100.127.142.182) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6134.21 via Frontend Transport; Thu, 23 Feb 2023 14:00:42 +0000
Received: ("Tessian outbound 333ca28169fa:v132");
 Thu, 23 Feb 2023 14:00:42 +0000
Received: from f0b912922bea.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 04BCEA90-1B69-44EE-A13E-36C6F1C2D82F.1; 
 Thu, 23 Feb 2023 14:00:34 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f0b912922bea.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 23 Feb 2023 14:00:34 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DB9PR08MB9561.eurprd08.prod.outlook.com (2603:10a6:10:452::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.20; Thu, 23 Feb
 2023 14:00:32 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::fca8:db36:98b:b1c4]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::fca8:db36:98b:b1c4%7]) with mapi id 15.20.6134.021; Thu, 23 Feb 2023
 14:00:32 +0000
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
X-Inumbo-ID: 8ab284b3-b382-11ed-a82a-c9ca1d2f71af
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ih90SxRpYqEJT2cocZphRSpKgzAkKO24y4FVwegPtDM=;
 b=GFgpx1rpX1L7ZrR+mTu6bxq0lgYM1QTR6DR8AU3VjwF+Xa/5ASY8BRI76vg30VbeKLjerlX8mz2E0CahgiwDO0Uj8A+kOPcetU9DibqXn9JIfO6ybo8BwBg/U9Ry9BBDrIeyLxWnMkMhdNsTQF+UkPg8dvhQfb2dh8D/U02kecw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8f4f2931117b5da0
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HzTcCtOohF1EcvPjHozEOS7Y2fsTIPCLJakPmfVp6CPNjsm1CqOc5l4b2d7eBj+YObTPY897E+Zl6jgIq0nt8MMFzmagP6iIQl4HU/VeeZ6BxJTcNvW9plWasyOrTmuxqhjbB1zoosMwNCPjPtAVtYPw8iMyGCZsGv9lwxtjsUIFgFYSYFBCBKUfMOgOANtsfuW/GetlMNhLIDLsJ34qqpGgNYL3LGg1XALxjXyHHHJzCy+RDZmuSJW9gTRPaD0aevfKqb3ilnwtAq0yqQtfwKIy9ulU70v4XJKabbIzuIaiJO5EnxtOukBvRNKWgXUUvxeFHNN/TVuxtRADnY8DeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ih90SxRpYqEJT2cocZphRSpKgzAkKO24y4FVwegPtDM=;
 b=YYdSRXdcdkFVZ9A8hwHzMzjy2wzGuLPw4jkXioYtpZQ3RYUvxhQXZVDaN/ZL7e9b4dlsMoxshlTAOLBeU+Ou7rq/MkOMliHsabUYnCLSbbR25pPbkWseRFI3TPWp5s8NOwjChe5AMi5+QbV6D7b4l9PLvU5uLYpA1w0RTdiQlGsBy0+bMDvb/8OBmMScvrbEEYknUJ49YDf9RzJbjZlSCjggtmY2Os7hdII+IIHf6vPxDSNpMwjPWs3n8fcaAwwDysUTt+u/i949IWgrwgZoLT97gWYRS/Xr2z+oOEcr7hIasvTI5CIr+/YhoNR3U0zLQr2icNlLAfXXWPTma2z0NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ih90SxRpYqEJT2cocZphRSpKgzAkKO24y4FVwegPtDM=;
 b=GFgpx1rpX1L7ZrR+mTu6bxq0lgYM1QTR6DR8AU3VjwF+Xa/5ASY8BRI76vg30VbeKLjerlX8mz2E0CahgiwDO0Uj8A+kOPcetU9DibqXn9JIfO6ybo8BwBg/U9Ry9BBDrIeyLxWnMkMhdNsTQF+UkPg8dvhQfb2dh8D/U02kecw=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Luca Fancellu <Luca.Fancellu@arm.com>, Wei Chen <Wei.Chen@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Wei
 Liu <wl@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 07/10] xen/physinfo: add arm SVE arch capability and
 vector length
Thread-Topic: [PATCH 07/10] xen/physinfo: add arm SVE arch capability and
 vector length
Thread-Index: AQHZNva6HNRte9MsfUOJ5KHGqG04E667j3YAgAzSe4CABDzJgIAQEa8A
Date: Thu, 23 Feb 2023 14:00:32 +0000
Message-ID: <83BA2CB8-3CF5-4E4D-993C-026D0A19D277@arm.com>
References: <20230202110816.1252419-1-luca.fancellu@arm.com>
 <20230202110816.1252419-8-luca.fancellu@arm.com>
 <f1673cb6-6f4f-be53-ef82-2ea2045533fa@suse.com>
 <781EDC8B-B24C-431F-AB08-F2ACF64E4D4E@arm.com>
 <083e8a1f-8db6-350a-9138-58751c3fb44b@suse.com>
In-Reply-To: <083e8a1f-8db6-350a-9138-58751c3fb44b@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.400.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|DB9PR08MB9561:EE_|DBAEUR03FT057:EE_|GV1PR08MB7875:EE_
X-MS-Office365-Filtering-Correlation-Id: 67c9bbd6-a618-4eee-99dd-08db15a65a67
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 RBrJ+n4k7WNr/HnyOUcDEQZQ/pXePJaH/AHGAypN3qa5KnpSjOkWbpygIz/QxYg1Iywj1hvSdpBF9wJrxxjzGTGbPRAl0OT0bP+CTBVXFJHB1QEDvMjLt8ndG5SYFjKm33XV8Kzkj5Y27n2vphRh5r8whG2CJqGaK/Ql7SdNBP05uRmvxqu8D1twhwOu5H71nSl5kiy+/acg7ygqTcg5SAI2RkZwtCCcB20o1h2WyPwFJYpppzld3Z/CWD/wII69nLrGDIOZ4jUFtNTJePHtqOYm6r6lut+ZVGFgn5QxVPdWMavawL+wL0m2KaIE78AHnvEylupDuqOfhqWOr6z4zMn22HQvWEReBfWT0fxGBqRWg08Slf+1szhA1fe5ZE9y++hB2FngU9HmG2DQxgYRCwNoOFDM1SnqvihrjlWB/GbKEK3z/LzeiKj9jgZXRXe88zWEqAp26HclXE/4dY+fQJpNp+mQ/xgW6jBMLZe4nO2C7OutVtUkFFJHiMjtTX4l47ipF2qqW6Db3FGaWBmYtA/C3KSJmEEYoQ7s/2DX3ttQ2omxQIf2I4s4C/5YS7UYSvPu615JIaQap5P9+xSvizzc0617tPF+QvmVIAEl5d5c1Qcyxcf3aTOnh60zYMImN+ZwSKtFjvlmRCItSf8Zz6xX0RbffSoFwJKbw6Vz+dQGVdnCgQzJJ9D7eGIALBdgMpgr6yn/m85MvE4aui/gjF6QgW0rKd2Maac5dCCrJiE=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(136003)(376002)(396003)(346002)(366004)(451199018)(86362001)(36756003)(38100700002)(38070700005)(122000001)(33656002)(478600001)(71200400001)(316002)(54906003)(6486002)(8936002)(41300700001)(26005)(5660300002)(2906002)(91956017)(66946007)(66446008)(4326008)(66476007)(64756008)(76116006)(6916009)(8676002)(66556008)(83380400001)(186003)(6512007)(6506007)(2616005)(53546011)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <A5A1CD38CD39AC43820F3EBB4C038FA4@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9561
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	31ff8271-0527-46c6-66c6-08db15a6545b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	J1CZhCt0pj/Sh/x1CnHD2jAdC2fiB892roZzqQNmqI53A5yiSgJAgO/DmLhS26V5UI5iM0KojoqqaLnR+cxsFE1VjX0AbgB44p2toDc0vWhYZrM7a/bBNATIvcPUXkpvXsuOtEyoKx5H7Bxr8bAdV1tbC5pogr45eQIiTdDR7zah6fZOxQsAGw7/Uf5C4Nw2mFc3MXqT9LY0Ji/JhU54N0e/SDgGNb0hnZN40NKbdFB+XE1p7c98CK7coT26bZI1vdn/zplknWI7D6Ee9tqfDzfov5tjnqaLB40+1RDhW/Bn6bvIG9yDOERjHlpREWcU7s8lqEqMji+B/NSwI7zyRycLOGuaDIiJLvyujgz0+ugK8+hxJbOlkYu5qpSEePenwPBzOgPSpnntZSDrV/Y3DCsrpX7opeTTLzkbf38iv/kZhkzNC9OJcZNvZYveVLEuKRK6HlwIeakFeihZDPCi/fr0+DjtqBhSao3IZm0czbURjn9fi5frMjPq5ahB02znOXDp+bjWnvUEll4pC0erroJKY7pukHi9leSgqLquxRKjkwxu2plta7qV+ZuQ36d2BNaEVBELSsFOW8UOoSsnKI/5Kadg0lCmlPm/NCopcKX9x+HyIBiQtsZTvYQllnHRFT403MhE6La998if19CJDP+GSLUzVneqLogG2x/9ZXbXU1lw0KFslsJKrjj1DXby3FZAFdHI7WQbOs36M07w2A==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(396003)(39860400002)(346002)(136003)(376002)(451199018)(36840700001)(46966006)(40470700004)(2906002)(6486002)(36756003)(82740400003)(316002)(33656002)(336012)(81166007)(36860700001)(41300700001)(2616005)(53546011)(47076005)(70586007)(6512007)(6506007)(40480700001)(70206006)(40460700003)(82310400005)(5660300002)(478600001)(83380400001)(54906003)(8676002)(356005)(4326008)(26005)(186003)(8936002)(86362001)(6862004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2023 14:00:42.8550
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 67c9bbd6-a618-4eee-99dd-08db15a65a67
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7875

SGkgSmFuLA0KDQo+IE9uIDEzIEZlYiAyMDIzLCBhdCAwOTozNiwgSmFuIEJldWxpY2ggPGpiZXVs
aWNoQHN1c2UuY29tPiB3cm90ZToNCj4gDQo+IE9uIDEwLjAyLjIwMjMgMTY6NTQsIEx1Y2EgRmFu
Y2VsbHUgd3JvdGU6DQo+Pj4gT24gMiBGZWIgMjAyMywgYXQgMTI6MDUsIEphbiBCZXVsaWNoIDxq
YmV1bGljaEBzdXNlLmNvbT4gd3JvdGU6DQo+Pj4gT24gMDIuMDIuMjAyMyAxMjowOCwgTHVjYSBG
YW5jZWxsdSB3cm90ZToNCj4+Pj4gKGlzIGh3X2NhcCBvbmx5IGZvciB4ODY/KQ0KPj4+IA0KPj4+
IEkgc3VwcG9zZSBpdCBpcywgYnV0IEkgYWxzbyBleHBlY3QgaXQgd291bGQgYmV0dGVyIGdvIGF3
YXkgdGhhbiBiZSBtb3ZlZC4NCj4+PiBJdCBkb2Vzbid0IGhvbGQgYSBjb21wbGV0ZSBzZXQgb2Yg
aW5mb3JtYXRpb24sIGFuZCBpdCBoYXMgYmVlbiBzdXBlcnNlZGVkLg0KPj4+IA0KPj4+IFF1ZXN0
aW9uIGlzIChhbmQgSSB0aGluayBJIGRpZCByYWlzZSB0aGlzIGJlZm9yZSwgcGVyaGFwcyBpbiBk
aWZmZXJlbnQNCj4+PiBjb250ZXh0KSB3aGV0aGVyIEFybSB3b3VsZG4ndCB3YW50IHRvIGZvbGxv
dyB4ODYgaW4gaG93IGhhcmR3YXJlIGFzIHdlbGwNCj4+PiBhcyBoeXBlcnZpc29yIGRlcml2ZWQg
LyB1c2VkIG9uZXMgYXJlIGV4cG9zZWQgdG8gdGhlIHRvb2wgc3RhY2sNCj4+PiAoWEVOX1NZU0NU
TF9nZXRfY3B1X2ZlYXR1cmVzZXQpLiBJIGd1ZXNzIHRoZXJlJ3Mgbm90aGluZyByZWFsbHkgcHJl
Y2x1ZGluZw0KPj4+IHRoYXQgZGF0YSB0byBjb25zaXN0IG9mIG1vcmUgdGhhbiBqdXN0IGJvb2xl
YW4gZmllbGRzLg0KPj4gDQo+PiBZZXMgSSBndWVzcyB0aGF0IGluZnJhc3RydWN0dXJlIGNvdWxk
IHdvcmssIGhvd2V2ZXIgSSBkb27igJl0IGhhdmUgdGhlIGJhbmR3aWR0aCB0bw0KPj4gcHV0IGl0
IGluIHBsYWNlIGF0IHRoZSBtb21lbnQsIHNvIEkgd291bGQgbGlrZSB0aGUgQXJtIG1haW50YWlu
ZXJzIHRvIGdpdmUgbWUgYQ0KPj4gc3VnZ2VzdGlvbiBvbiBob3cgSSBjYW4gZXhwb3NlIHRoZSB2
ZWN0b3IgbGVuZ3RoIHRvIFhMIGlmIHB1dHRpbmcgaXRzIHZhbHVlIGhlcmUNCj4+IG5lZWRzIHRv
IGJlIGF2b2lkZWQNCj4gDQo+IFNpbmNlIHlvdSd2ZSBnb3QgYSByZXBseSBmcm9tIEFuZHJldyBi
b2lsaW5nIGRvd24gdG8gdGhlIHNhbWUgc3VnZ2VzdGlvbg0KPiAob3Igc2hvdWxkIEkgZXZlbiBz
YXkgcmVxdWVzdCksIEkgZ3Vlc3MgaXQgd2FudHMgc2VyaW91c2x5IGNvbnNpZGVyaW5nDQo+IHRv
IGludHJvZHVjZSBhYnN0cmFjdCBiYXNlIGluZnJhc3RydWN0dXJlIGZpcnN0LiBBcyBBbmRyZXcg
c2F5cywgdGltZSBub3QNCj4gaW52ZXN0ZWQgbm93IHdpbGwgdmVyeSBsaWtlbHkgbWVhbiB5ZXQg
bW9yZSB0aW1lIHRvIGJlIGludmVzdGVkIGxhdGVyLg0KPiANCj4+Pj4gLS0tIGEveGVuL2luY2x1
ZGUvcHVibGljL3N5c2N0bC5oDQo+Pj4+ICsrKyBiL3hlbi9pbmNsdWRlL3B1YmxpYy9zeXNjdGwu
aA0KPj4+PiBAQCAtMTgsNyArMTgsNyBAQA0KPj4+PiAjaW5jbHVkZSAiZG9tY3RsLmgiDQo+Pj4+
ICNpbmNsdWRlICJwaHlzZGV2LmgiDQo+Pj4+IA0KPj4+PiAtI2RlZmluZSBYRU5fU1lTQ1RMX0lO
VEVSRkFDRV9WRVJTSU9OIDB4MDAwMDAwMTUNCj4+Pj4gKyNkZWZpbmUgWEVOX1NZU0NUTF9JTlRF
UkZBQ0VfVkVSU0lPTiAweDAwMDAwMDE2DQo+Pj4gDQo+Pj4gV2h5PyBZb3UgLi4uDQo+Pj4gDQo+
Pj4+IEBAIC0xMDQsNyArMTEwLDggQEAgc3RydWN0IHhlbl9zeXNjdGxfcGh5c2luZm8gew0KPj4+
PiAgICB1aW50MzJfdCBjcHVfa2h6Ow0KPj4+PiAgICB1aW50MzJfdCBjYXBhYmlsaXRpZXM7Lyog
WEVOX1NZU0NUTF9QSFlTQ0FQXz8/PyAqLw0KPj4+PiAgICB1aW50MzJfdCBhcmNoX2NhcGFiaWxp
dGllczsvKiBYRU5fU1lTQ1RMX1BIWVNDQVBfe1g4NixBUk0sLi4ufV8/Pz8gKi8NCj4+Pj4gLSAg
ICB1aW50MzJfdCBwYWQ7DQo+Pj4+ICsgICAgdWludDE2X3QgYXJtX3N2ZV92bF9iaXRzOw0KPj4+
PiArICAgIHVpbnQxNl90IHBhZDsNCj4+Pj4gICAgdWludDY0X2FsaWduZWRfdCB0b3RhbF9wYWdl
czsNCj4+Pj4gICAgdWludDY0X2FsaWduZWRfdCBmcmVlX3BhZ2VzOw0KPj4+PiAgICB1aW50NjRf
YWxpZ25lZF90IHNjcnViX3BhZ2VzOw0KPj4+IA0KPj4+IC4uLiBhZGQgbm8gbmV3IGZpZWxkcywg
YW5kIHRoZSBvbmx5IHByb2R1Y2VyIG9mIHRoZSBkYXRhIHplcm8tZmlsbHMgdGhlDQo+Pj4gc3Ry
dWN0IGZpcnN0IHRoaW5nLg0KPj4gDQo+PiBZZXMgdGhhdCBpcyByaWdodCwgSSB3aWxsIHdhaXQg
dG8gdW5kZXJzdGFuZCBob3cgSSBjYW4gcHJvY2VlZCBoZXJlOg0KPj4gDQo+PiAxKSByZW5hbWUg
YXJjaF9jYXBhYmlsaXRpZXMgdG8gYXJtX3N2ZV92bF9iaXRzIGFuZCBwdXQgdmVjdG9yIGxlbmd0
aCB0aGVyZS4NCj4+IDIpIGxlYXZlIGFyY2hfY2FwYWJpbGl0aWVzIHVudG91Y2hlZCwgbm8gZmxh
ZyBjcmVhdGlvbi9zZXR0aW5nLCBjcmVhdGUgdWludDMyX3QgYXJtX3N2ZV92bF9iaXRzIGZpZWxk
IHJlbW92aW5nIOKAnHBhZOKAnSwNCj4+ICAgIFVzZSBpdHMgdmFsdWUgdG8gZGV0ZXJtaW5lIGlm
IFNWRSBpcyBwcmVzZW50IG9yIG5vdC4NCj4+IDMpID8/DQo+IA0KPiAzKSBJbnRyb2R1Y2Ugc3Vp
dGFibGUgI2RlZmluZShzKSB0byB1c2UgcGFydCBvZiBhcmNoX2NhcGFiaWxpdGllcyBmb3IgeW91
cg0KPiBwdXJwb3NlLCB3aXRob3V0IHJlbmFtaW5nIHRoZSBmaWVsZC4gKEJ1dCB0aGF0J3Mgb2Yg
Y291cnNlIG9ubHkgaWYgQXJtDQo+IG1haW50YWluZXJzIGFncmVlIHdpdGggeW91IG9uIF9ub3Rf
IGdvaW5nIHRoZSBwcm9wZXIgZmVhdHVyZSBoYW5kbGluZyByb3V0ZQ0KPiByaWdodCBhd2F5LikN
Cg0KQXMgTHVjYSBzYWlkLCBoZSBkb2VzIG5vdCBoYXZlIHRoZSByZXF1aXJlZCBiYW5kd2lkdGgg
dG8gZG8gdGhpcyBzbyBJIHRoaW5rIGl0IGlzIG9rIGZvciBoaW0gdG8gZ28gd2l0aCB5b3VyIHNv
bHV0aW9uIDMuDQoNCkBKdWxpZW4vU3RlZmFubzogYW55IHRob3VnaHRzIGhlcmUgPw0KDQpCZXJ0
cmFuZA0KDQo+IA0KPiBKYW4NCg0K

