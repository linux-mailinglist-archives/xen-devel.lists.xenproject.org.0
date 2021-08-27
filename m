Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A263F9709
	for <lists+xen-devel@lfdr.de>; Fri, 27 Aug 2021 11:32:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.173545.316646 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJYE7-00085Q-LU; Fri, 27 Aug 2021 09:32:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 173545.316646; Fri, 27 Aug 2021 09:32:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJYE7-00082c-HQ; Fri, 27 Aug 2021 09:32:43 +0000
Received: by outflank-mailman (input) for mailman id 173545;
 Fri, 27 Aug 2021 09:32:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zv0+=NS=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mJYE5-00082K-6D
 for xen-devel@lists.xenproject.org; Fri, 27 Aug 2021 09:32:41 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.1.40]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4732210b-d903-4e0e-9296-e60a90217186;
 Fri, 27 Aug 2021 09:32:38 +0000 (UTC)
Received: from AM5PR0602CA0002.eurprd06.prod.outlook.com
 (2603:10a6:203:a3::12) by DB7PR08MB3801.eurprd08.prod.outlook.com
 (2603:10a6:10:79::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.22; Fri, 27 Aug
 2021 09:32:35 +0000
Received: from VE1EUR03FT054.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:a3:cafe::57) by AM5PR0602CA0002.outlook.office365.com
 (2603:10a6:203:a3::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.18 via Frontend
 Transport; Fri, 27 Aug 2021 09:32:35 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT054.mail.protection.outlook.com (10.152.19.64) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.17 via Frontend Transport; Fri, 27 Aug 2021 09:32:35 +0000
Received: ("Tessian outbound f11f34576ce3:v103");
 Fri, 27 Aug 2021 09:32:34 +0000
Received: from 8dc6851e8388.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9A3D8ACB-E67A-4FE8-AEED-1C9225DA3CF5.1; 
 Fri, 27 Aug 2021 09:32:29 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8dc6851e8388.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 27 Aug 2021 09:32:29 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com (2603:10a6:10:2a2::7)
 by DB7PR08MB3531.eurprd08.prod.outlook.com (2603:10a6:10:49::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.21; Fri, 27 Aug
 2021 09:32:27 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::b06a:b1ca:ba5f:f3b7]) by DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::b06a:b1ca:ba5f:f3b7%8]) with mapi id 15.20.4436.024; Fri, 27 Aug 2021
 09:32:27 +0000
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
X-Inumbo-ID: 4732210b-d903-4e0e-9296-e60a90217186
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QhHzuM2N/wB4YDWf2eQFPUVE3bdYEyq3wCGDGBrPG8M=;
 b=4E4KPg6FlgMaNRGwSo4tNsS44ZA0TCZQ/z4JhQ5LHS+wCD3QqcYnduhOhu7njovTSfPF1lNSVvTIRv1aqLsIfPVekxV2ZbvfTzhXiqFcuzx4bKtQjwQgqAiajiAAVE1veSH8NdBoXp78eDYTCyDgNacbZzqDI4lzWYGndkENYuQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cJ4xjOgD59OnR+lDmfaAAmAeDyswbrMZOV8eE/oNr2g4r4vNjsiLfCJmF1CpSzGy+LO+u/Y1GSpmG40BsY57FDHQhJfRqYf02MY28AgUxAa5m/hFlcxNRQPYp7vijlvpb9Yjpy8DssiM+unqWFadbUZPhFUSvlhg/iCxXfiwgCkIK+gKARm+QgYOpCinM5aSN5NUvrY9sNkB4mptgw+C+FBzYiJ3fVmu2A0uEoKTUQHEQSZQrYBjnc69Y8CwTTumC7n/rFNk2019AIiZjYi40mJGWY4ekVrBLcZ8HWN5Y3JnX2ngcG+yuM6doXrKmLFgkwSJ8ufBAAQDi0CEayYzwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QhHzuM2N/wB4YDWf2eQFPUVE3bdYEyq3wCGDGBrPG8M=;
 b=bUw/YAzmYX9AMpuvnCtySatECOpm+kMth2qXiwYDb8U89IJcKqHx9ymFxIr9MxkkB4sf0PhhJCyN0Kv2Ndulg4pW7pkDWM44EcHfHB5fLZYyNQ85v3gWdf44t9YHDNWxefZ3Ul774BXDyuz6sEaWCrKqK15rrYs5tA9/2bcZK2RAC0H2aBZ4mG6+7IZdr7nl1SvLLnsMsveBEMO5Qq9TdekQMy0HiqdyfVX5QEDPUtbLK3y/7oie17+o0tnIl0z5A7gHGfmGaZ1GPin/ORo+8x34ummZxdh/XSvVMrEs8ZDOTFB0PXNaSTOVni/x1jU95n4xxscKsbIoL9Q5cqi4ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QhHzuM2N/wB4YDWf2eQFPUVE3bdYEyq3wCGDGBrPG8M=;
 b=4E4KPg6FlgMaNRGwSo4tNsS44ZA0TCZQ/z4JhQ5LHS+wCD3QqcYnduhOhu7njovTSfPF1lNSVvTIRv1aqLsIfPVekxV2ZbvfTzhXiqFcuzx4bKtQjwQgqAiajiAAVE1veSH8NdBoXp78eDYTCyDgNacbZzqDI4lzWYGndkENYuQ=
From: Wei Chen <Wei.Chen@arm.com>
To: Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
	<sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"julien@xen.org" <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>
Subject: RE: [XEN RFC PATCH 16/40] xen/arm: Create a fake NUMA node to use
 common code
Thread-Topic: [XEN RFC PATCH 16/40] xen/arm: Create a fake NUMA node to use
 common code
Thread-Index: AQHXjps2iDGXvfLaHUqc/mpIlhQB9auGgcmAgAB3swCAADX9oA==
Date: Fri, 27 Aug 2021 09:32:27 +0000
Message-ID:
 <DB9PR08MB685743AC3D625D06ECA95B449EC89@DB9PR08MB6857.eurprd08.prod.outlook.com>
References: <20210811102423.28908-1-wei.chen@arm.com>
 <20210811102423.28908-17-wei.chen@arm.com>
 <alpine.DEB.2.21.2108261605470.24433@sstabellini-ThinkPad-T480s>
 <0ada9a6f-ca9e-cc2e-f06c-7f754e2a4833@suse.com>
In-Reply-To: <0ada9a6f-ca9e-cc2e-f06c-7f754e2a4833@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 02673E5D98404F4F9D0E95FD474FCE69.0
x-checkrecipientchecked: true
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 2b6d8d3a-0152-4eae-9aa8-08d9693d9a6d
x-ms-traffictypediagnostic: DB7PR08MB3531:|DB7PR08MB3801:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<DB7PR08MB380117E9DCDC946A42DB60319EC89@DB7PR08MB3801.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 4WKiNoDNgxbwEZpG8ZckyQTgcyYqJ32Mcr0gv+uBj4GSVGKFLtlA6qpkogCbfPmPXvS2di/acZFRD1BH4I3TauBBKJ2fg9lrP4j3FHAPJcaMxBhrZ/s6sLlwf3S0n0aLlQKAvaUDrK8feFpymLm9NpIAolUVFCbSRBvmM+8egj5RTtAl6GvqTxxKKFenfVOg7MDv/GFp3vToo7t70eqLKtX5aFH5tScl5b2K46DniU5M0ub5QTJwCIZ2ZYYtYtjio0+IwBwcDWqS6DrmLrEY4WmSZYxyLQZPaeY2xVnCCHB6Pv7Csb8LeXnPkcDwWPtnPX3x9x7s2LGK35G/SkYUfVBvxPabzCa9WNvvBwm2clCmqQFJu7bv72ROH3RmeK2qUVB0m0y1otKO/BlL+FTkQ7MlH+GW+LXoEHRrumNOi6Yjtw5dDkOffi0jhxhXg352lTRWTNlJxtjh2A06NfuocRo2uZ52Mbrt8FP+QHp3f5cPAhw/MoCYWvkh+mYVV2OIvIbg2s/khl+ESCaKTRJ6nqq/XcbnxzrWrlDHjMmbLkdnvyikRYaWNUmO8cDeJVAjlDdiPVXk8MLtpDW9wNPJfCHxp3thdgkIR5U6eybGe1XPoNPmcSGmfTX+m4GW0EhDxtNg5NDeEFAInJ44qqsR8RwiO32q4WYlOJLk3qesVuHBKPBx9s85oKerjXGdTRd9uUZojSDac6EHTlZvCT2OFw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6857.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(376002)(346002)(366004)(136003)(396003)(71200400001)(26005)(38100700002)(8936002)(52536014)(6506007)(5660300002)(53546011)(7696005)(8676002)(186003)(9686003)(54906003)(66446008)(38070700005)(66556008)(110136005)(2906002)(122000001)(64756008)(76116006)(4326008)(86362001)(478600001)(316002)(66946007)(66476007)(33656002)(83380400001)(55016002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QWZOR2Nhc3NROTBRd2ZNZHBRMnlkQkh1bDloelZjNVg5SGc4UXQxczBZWWFE?=
 =?utf-8?B?czJBaEI0c0crQ0NoS2VhUk9vOUdSdzU5VjM1cjB5TjVWVzE0WjdvVno1OVpR?=
 =?utf-8?B?SmJydXN2S1lHb3FqaTVjNHFuOENuUDZYYzE4UDFQL3d6aEtLY2JZZldWanVo?=
 =?utf-8?B?RGZubzU5L1ZqamZFRE4wL3dXQ1Z1cGV0cUVKTFExR1RRSCtHMlhCeC8zMG5v?=
 =?utf-8?B?TG51L1dUVk9SM21BOUlqVzVOK2xUWmQvT2NoSXVGdWNPaUp2dE8zS3g5WHdx?=
 =?utf-8?B?cWltTExDZ1FWRTl3bmltNGVkM2I1YnpHeUdjd3JVUDJPemlyYTRHbEswZmlB?=
 =?utf-8?B?OStUWmY4Q3czQWRLdzlsVEJ4cXl4b09Hdnhzajg4T2dQcFpBZ2R6Ylg1amts?=
 =?utf-8?B?OHNVUWFkZm9PckIxSGh4b0ZmNkRNU3JRYTF0Z2FzTWVEbVdsNkRVdG5qc0ti?=
 =?utf-8?B?SElMSnE2N240VnhoSk5HT3NLdWhnUFhOZzZ2eG9QNWZGaEd2WThMbTRtQktX?=
 =?utf-8?B?ZDAwMzF5Qkh3RTNlUFJHbHpiU1M5Nit6VHZsMkVabndRbW9VSEF1UHZnRG9l?=
 =?utf-8?B?a2JMVjVTS3ZQWWlUTEdPS0krd0V2cEcwYlZkK0lLZGJhbjV4cmdGL3ppVFZ3?=
 =?utf-8?B?SkgwSHZNYUprU0VFeHUyUVRHRFpOUnEwU2VvTDJiaHhKcUV3dDNXNnFldUo4?=
 =?utf-8?B?WkovRXFybUl4MVZobER1ZEM5WElNQ1F1NTJYck5xeVpuWFQ4REx0TWNjZDB0?=
 =?utf-8?B?aTFSRml5WkRBbHROdCtvZHlKZWR3N1FPN3cwY3JDZmtHT05uZ3lRSmFYOGIx?=
 =?utf-8?B?LzBGaENObHo2QXpNTmorUy9qQW1sSG9wanhqNHNocXh2VjhGZit2NGdEcUY0?=
 =?utf-8?B?dzVURTF4NVpVVDlESXJZNlZpdzFBRGdQN1F0Rkxab2h0S2ZHUDVwdGVjL01u?=
 =?utf-8?B?bzlORVM5YlpsVkhqNGZnV01QN1JMdkVsa29rQW53eG56a2Rac3kzOGVVZTV0?=
 =?utf-8?B?bGtLd0J2amtCdG0rZUEwbjg2U3VNZjhXYXZVQms0cFZ3S2t3amdodXdPYmR2?=
 =?utf-8?B?RkxnRTVIQUE3R0xmZDRPZ1lWeS9JUUFaVGRMbXpwMHhrcDlaa3lTdUpqbFlM?=
 =?utf-8?B?SHdsdXpqTVNDT283QStFTlZtQ2RpYVdFMjA1RlpiTDJOeVh3Q2U2QTBuU0E5?=
 =?utf-8?B?cExQWVMvU25JdTBUVjdGTHI5YVFUS0F5OWR2MkdDMmcrcXYrS0JUbC9wcThl?=
 =?utf-8?B?UUh6UWl5L0xnb3VOWlJodWgxZjZjV2p0Y0UvenRXaUMwK3U5UzZOY0lnTDdl?=
 =?utf-8?B?RGE1dytGUXlaV0g4cTdkcFljL1JVcTVYWmhWV2JURWd1SVM1T0ZhS053YW9M?=
 =?utf-8?B?SDNrUm1LTDVtWFJuaGpVNFdNVEVHS1RkU1hZZTBjYTlTNitWcVMzSm1DOVht?=
 =?utf-8?B?azFZNitKS1Bqd2JNcnBORHVlYmo4Z0VyaklmM2dSNjQzVXNoUCt0R1ZXWlNO?=
 =?utf-8?B?VlI0eUFLQzY3d09Na2pyQ0wzTG1YUWJYQ3VJVlU2cmRiN2M3WEl2QzdzMStw?=
 =?utf-8?B?SEJ3MzFONk1WZjVjZGo3bHBhTDNEak1JZ05WZXRzN1RDZXdjd3ZJMnprTnM4?=
 =?utf-8?B?VTNYa01iTDJDZ0V5WGhpcURiR3Q2ekgyUGFub2RidUlRMW1JTm9ndTViekhL?=
 =?utf-8?B?ckJ6dGlneUFuWlE0YmdsWUpRZnlScW5CQ2NBYjgrRHMxWlVkSTVxQi9WeURB?=
 =?utf-8?Q?vtu0IUN2RYvrlu+fICaCdvtb5fv0KgWn8rlbbKZ?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3531
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	99921e84-8457-4b70-1223-08d9693d95df
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	z2fvryawZKuR+hfGyos/CQ+qCSxqjYgMZNX6SMyjhUphaSSogqDWvxgdIxQ1WS9t/Zttg566D9n98AOCVlKCWuWoG5z3HixqoADBBPlzFv0ksau8aeIyJUR1+TurbMDFE6LULsU/srxpWoCwUjpS3CnGwUB5WxlVTuaC5/iWTzRCShKyRVZdF0VtKTqSU7REpcMDUWL8tG2D4YRsfKPX/6sZ8/FpMRx+6QCoY7XYm8RvdZIvZScSrA1n9mkdZgz3PxFqMrR8y1+CQPrXC5itv3sE60YeokwuEARRlG0ncT55iAELvTc7B3YMqibYhUYNDcQdhLXLFbzcuNvJReIwgVVrvT1w39aGHzwdrzIkcCc3WHI+5W97lhb5GyeKrZ3ptlRsBt1haG4bJWWdkZgnZS7ufSJX1ThgIsOWoIDKeSd1PdVdmYo8QpOQeot+zCAKVuaMzchiCDANn2Gou6dRx6ELEi5xFhBOIpgbcpO1jVWPlz7UgCh2aAXGPm3g0iQt/eK6k64wYBQ7fFhOw46yjzeCeUMI6SPHVseHlPwqyQm4vipyYmihor5Ip9Zdl+rtaNwBq06+DhmKJWVCajQQkBvtBjJeDcZHlXJHDzN2IzLUAlEUMeAMjKGHKHwKJ1rEJKb4aZL7gtonqHi50RKV6/hF/CJcd5f9Jw+F9UEWP/rsuU857IxGgMI9IPe17NaE7nvDxdJv4JQxs6QJgTBynA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(346002)(136003)(396003)(39860400002)(46966006)(36840700001)(110136005)(52536014)(82310400003)(316002)(81166007)(33656002)(6506007)(47076005)(2906002)(36860700001)(86362001)(83380400001)(8676002)(53546011)(7696005)(82740400003)(336012)(186003)(356005)(70586007)(478600001)(26005)(9686003)(5660300002)(70206006)(54906003)(8936002)(55016002)(4326008);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2021 09:32:35.3362
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b6d8d3a-0152-4eae-9aa8-08d9693d9a6d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3801

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU2VudDogMjAyMeW5tDjmnIgyN+aXpSAxNDoxOA0K
PiBUbzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsgV2VpIENo
ZW4NCj4gPFdlaS5DaGVuQGFybS5jb20+DQo+IENjOiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmc7IGp1bGllbkB4ZW4ub3JnOyBCZXJ0cmFuZCBNYXJxdWlzDQo+IDxCZXJ0cmFuZC5NYXJx
dWlzQGFybS5jb20+DQo+IFN1YmplY3Q6IFJlOiBbWEVOIFJGQyBQQVRDSCAxNi80MF0geGVuL2Fy
bTogQ3JlYXRlIGEgZmFrZSBOVU1BIG5vZGUgdG8gdXNlDQo+IGNvbW1vbiBjb2RlDQo+IA0KPiBP
biAyNy4wOC4yMDIxIDAxOjEwLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6DQo+ID4gT24gV2Vk
LCAxMSBBdWcgMjAyMSwgV2VpIENoZW4gd3JvdGU6DQo+ID4+IEBAIC0yOSwzICszMSw1NCBAQCB2
b2lkIG51bWFfc2V0X25vZGUoaW50IGNwdSwgbm9kZWlkX3QgbmlkKQ0KPiA+Pg0KPiA+PiAgICAg
IGNwdV90b19ub2RlW2NwdV0gPSBuaWQ7DQo+ID4+ICB9DQo+ID4+ICsNCj4gPj4gK3ZvaWQgX19p
bml0IG51bWFfaW5pdChib29sIGFjcGlfb2ZmKQ0KPiA+PiArew0KPiA+PiArICAgIHVpbnQzMl90
IGlkeDsNCj4gPj4gKyAgICBwYWRkcl90IHJhbV9zdGFydCA9IH4wOw0KPiA+PiArICAgIHBhZGRy
X3QgcmFtX3NpemUgPSAwOw0KPiA+PiArICAgIHBhZGRyX3QgcmFtX2VuZCA9IDA7DQo+ID4+ICsN
Cj4gPj4gKyAgICBwcmludGsoWEVOTE9HX1dBUk5JTkcNCj4gPj4gKyAgICAgICAgIk5VTUEgaGFz
IG5vdCBiZWVuIHN1cHBvcnRlZCB5ZXQsIE5VTUEgb2ZmIVxuIik7DQo+ID4NCj4gPiBOSVQ6IHBs
ZWFzZSBhbGlnbg0KPiA+DQo+ID4NCj4gPj4gKyAgICAvKiBBcm0gTlVNQSBoYXMgbm90IGJlZW4g
aW1wbGVtZW50ZWQgdW50aWwgdGhpcyBwYXRjaCAqLw0KPiA+DQo+ID4gIkFybSBOVU1BIGlzIG5v
dCBpbXBsZW1lbnRlZCB5ZXQiDQo+ID4NCj4gPg0KPiA+PiArICAgIG51bWFfb2ZmID0gdHJ1ZTsN
Cj4gPj4gKw0KPiA+PiArICAgIC8qDQo+ID4+ICsgICAgICogU2V0IGFsbCBjcHVfdG9fbm9kZSBt
YXBwaW5nIHRvIDAsIHRoaXMgd2lsbCBtYWtlIGNwdV90b19ub2RlDQo+ID4+ICsgICAgICogZnVu
Y3Rpb24gcmV0dXJuIDAgYXMgcHJldmlvdXMgZmFrZSBjcHVfdG9fbm9kZSBBUEkuDQo+ID4+ICsg
ICAgICovDQo+ID4+ICsgICAgZm9yICggaWR4ID0gMDsgaWR4IDwgTlJfQ1BVUzsgaWR4KysgKQ0K
PiA+PiArICAgICAgICBjcHVfdG9fbm9kZVtpZHhdID0gMDsNCj4gPj4gKw0KPiA+PiArICAgIC8q
DQo+ID4+ICsgICAgICogTWFrZSBub2RlX3RvX2NwdW1hc2ssIG5vZGVfc3Bhbm5lZF9wYWdlcyBh
bmQgbm9kZV9zdGFydF9wZm4NCj4gPj4gKyAgICAgKiByZXR1cm4gYXMgcHJldmlvdXMgZmFrZSBB
UElzLg0KPiA+PiArICAgICAqLw0KPiA+PiArICAgIGZvciAoIGlkeCA9IDA7IGlkeCA8IE1BWF9O
VU1OT0RFUzsgaWR4KysgKSB7DQo+ID4+ICsgICAgICAgIG5vZGVfdG9fY3B1bWFza1tpZHhdID0g
Y3B1X29ubGluZV9tYXA7DQo+ID4+ICsgICAgICAgIG5vZGVfc3Bhbm5lZF9wYWdlcyhpZHgpID0g
KG1heF9wYWdlIC0gbWZuX3goZmlyc3RfdmFsaWRfbWZuKSk7DQo+ID4+ICsgICAgICAgIG5vZGVf
c3RhcnRfcGZuKGlkeCkgPSAobWZuX3goZmlyc3RfdmFsaWRfbWZuKSk7DQo+ID4+ICsgICAgfQ0K
PiA+DQo+ID4gSSBqdXN0IHdhbnQgdG8gbm90ZSB0aGF0IHRoaXMgd29ya3MgYmVjYXVzZSBNQVhf
TlVNTk9ERVMgaXMgMS4gSWYNCj4gPiBNQVhfTlVNTk9ERVMgd2FzID4gMSB0aGVuIGl0IHdvdWxk
IGJlIHdyb25nIHRvIHNldCBub2RlX3RvX2NwdW1hc2ssDQo+ID4gbm9kZV9zcGFubmVkX3BhZ2Vz
IGFuZCBub2RlX3N0YXJ0X3BmbiBmb3IgYWxsIG5vZGVzIHRvIHRoZSBzYW1lIHZhbHVlcy4NCj4g
Pg0KPiA+IEl0IG1pZ2h0IGJlIHdvcnRoIHdyaXRpbmcgc29tZXRoaW5nIGFib3V0IGl0IGluIHRo
ZSBpbi1jb2RlIGNvbW1lbnQuDQo+IA0KPiBQbHVzIHBlcmhhcHMgQlVJTERfQlVHX09OKE1BWF9O
VU1OT0RFUyAhPSAxKSwgc28gdGhlIGlzc3VlIGlzIGFjdHVhbGx5DQo+IG5vdGljZWQgYXQgYnVp
bGQgdGltZSBvbmNlIHRoZSBjb25zdGFudCBnZXRzIGNoYW5nZWQ/DQo+IA0KDQpJdCB3b3VsZCBi
ZSBiZXR0ZXIuIEkgd2lsbCB1c2UgaXQgaW4gbmV4dCB2ZXJzaW9uLg0KDQo+IEphbg0KDQo=

