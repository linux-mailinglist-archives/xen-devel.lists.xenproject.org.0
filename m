Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 954C96E7439
	for <lists+xen-devel@lfdr.de>; Wed, 19 Apr 2023 09:43:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.523211.813056 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp2Sh-0001NE-3g; Wed, 19 Apr 2023 07:42:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 523211.813056; Wed, 19 Apr 2023 07:42:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp2Sg-0001Kx-Vo; Wed, 19 Apr 2023 07:42:42 +0000
Received: by outflank-mailman (input) for mailman id 523211;
 Wed, 19 Apr 2023 07:42:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/+8i=AK=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1pp2Sf-0001Kr-9m
 for xen-devel@lists.xenproject.org; Wed, 19 Apr 2023 07:42:41 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2045.outbound.protection.outlook.com [40.107.7.45])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c1d1574f-de85-11ed-8611-37d641c3527e;
 Wed, 19 Apr 2023 09:42:38 +0200 (CEST)
Received: from AS9PR06CA0004.eurprd06.prod.outlook.com (2603:10a6:20b:462::20)
 by DB9PR08MB9586.eurprd08.prod.outlook.com (2603:10a6:10:454::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Wed, 19 Apr
 2023 07:42:04 +0000
Received: from AM7EUR03FT061.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:462:cafe::29) by AS9PR06CA0004.outlook.office365.com
 (2603:10a6:20b:462::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22 via Frontend
 Transport; Wed, 19 Apr 2023 07:42:04 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT061.mail.protection.outlook.com (100.127.140.72) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6319.20 via Frontend Transport; Wed, 19 Apr 2023 07:42:03 +0000
Received: ("Tessian outbound 99a3040377ca:v136");
 Wed, 19 Apr 2023 07:42:03 +0000
Received: from 29c7130c41e4.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4B1C7173-A561-4CCA-BF7D-8EB6A300B81A.1; 
 Wed, 19 Apr 2023 07:41:52 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 29c7130c41e4.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 19 Apr 2023 07:41:52 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by AS2PR08MB9317.eurprd08.prod.outlook.com (2603:10a6:20b:59b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.21; Wed, 19 Apr
 2023 07:41:51 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6b4f:579f:6dca:8b91]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6b4f:579f:6dca:8b91%5]) with mapi id 15.20.6319.022; Wed, 19 Apr 2023
 07:41:50 +0000
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
X-Inumbo-ID: c1d1574f-de85-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xSHOW64FiWvIeoQDQYQfnO8qeilHAcWJniHIJc1w5j4=;
 b=VOYeCyTwpH+QMTLxAWQNSh2uXgcu2lcT3Zm+8LHDSrWjMqgVkedgnb9UoVKaj63OsQX2DuBBkxDGW1Arb5gnXZ6KDu5Vz2vDaL0Z7fFLpTpGtFnLbX1oNbaf3y0mGl6tyhiYyg7IOpPX5dycqdI4TCJN8XkY+TQxjVE/oT08gwI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: e74356d34f632442
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=drd2Gg2MOirxK2NHtgFjeCXB/uil5eZ9DeI5YuULKxeMd/1GTD/nyXHs//HGo3pHRr8l1wOiiOa/u35COVHdVfoT/hlKehT4058NF4oTA1Ihw93NZVQU8y3nVLQ6PB+UkUKjGXwU+Jen7yHsmO4/W6YfCsIsaBq06ivvctb8/ScVl73dV1WQFSgjyKZSrb5BKzWmGinIQ8DDpMVVmINMVOSVKHX80l0Xc0/7yISTrWO1bFVoNngfhXrObmaxV/YgS6/f0ARaqCvO49ICnES9LdALikV23e58I5Q53Im3HeY10vwP14wTSB3pFm6OdVl0kO7b/qwHFQjjvY5q9rfeuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xSHOW64FiWvIeoQDQYQfnO8qeilHAcWJniHIJc1w5j4=;
 b=E+zmEwJs2VjMekq2KAUGsxM4HEg/uJ2I4BJXnw6sM/Zw7dllsFDOlfpkkPS/ER4px+CGSXGmja8UnoD7bnJMh26w6KwR1zvweE4gscR9PcJ9V6m9rih5MUSinQa6LwwSiEiEZkos+aQIEBny8zNDp+jpchDFqP2G+lWG/CaazkXPhbl1b7Nco/SkueskRyLkz7YKjcNoO6YQXuoXqXeeIdpH8RkJUC6bPXe8AT2vrGTDwl0JhUYnyNpJWmjRA2SiB0AUDqg81F4zXLhENxkvpuGgBbvmDU7PBOgaSufG2VvFA67E0k3Ug+IEwrJD8lRbNC4p9PlJAL9kfMvc1ItfrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xSHOW64FiWvIeoQDQYQfnO8qeilHAcWJniHIJc1w5j4=;
 b=VOYeCyTwpH+QMTLxAWQNSh2uXgcu2lcT3Zm+8LHDSrWjMqgVkedgnb9UoVKaj63OsQX2DuBBkxDGW1Arb5gnXZ6KDu5Vz2vDaL0Z7fFLpTpGtFnLbX1oNbaf3y0mGl6tyhiYyg7IOpPX5dycqdI4TCJN8XkY+TQxjVE/oT08gwI=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v5 07/12] xen: enable Dom0 to use SVE feature
Thread-Topic: [PATCH v5 07/12] xen: enable Dom0 to use SVE feature
Thread-Index: AQHZbSQ+XccnxtxNG0WbEgpX88e2za8xDZ2AgAE1hQCAAAGYAIAABb6A
Date: Wed, 19 Apr 2023 07:41:50 +0000
Message-ID: <8DA3FECA-DEBD-479E-9E5A-57676B98ADA4@arm.com>
References: <20230412094938.2693890-1-luca.fancellu@arm.com>
 <20230412094938.2693890-8-luca.fancellu@arm.com>
 <2833DC4A-95F0-482A-AD0F-3E942D1DA223@arm.com>
 <F30CEF99-693A-4218-AC80-433A183DE866@arm.com>
 <3DE2B914-FA6E-49EF-8748-BB8DE4B2CC11@arm.com>
In-Reply-To: <3DE2B914-FA6E-49EF-8748-BB8DE4B2CC11@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|AS2PR08MB9317:EE_|AM7EUR03FT061:EE_|DB9PR08MB9586:EE_
X-MS-Office365-Filtering-Correlation-Id: 92ff2ae5-4f00-4351-452e-08db40a991a2
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 8k70fhjAoIoOCxgeHEACv7gwfts0wiP8RkejCmR9CW6TIn4QyaaoznjL5Cagwgr8iXN0n4d6NIxbDa2blMn+EIAb55ujcoK3u6afnvKrebR/59f//KrqSybNG4AVR7MJ4mUg+FY/Kk1v8CCtF5i8SFTor8XsOGwMeoIW8yT1zSsApFUs11W/ZxCgqVJCSKIFXTaV9sfdrxptWqqKBncotKZH59lSPidRTtTL13nmfm3cNzvftVjTgbzv3WQc9tpJC4Piixr6vwDUeVH+Uxw/ihjVJOJv4yUxXIt3HqPtp9L5rGKWPyGKjxRCpvZ7CYFaJs0WdCWAiwZJVcivnV8H8Ba2vsstRryoLR+GdKlPKIcWeiQLtTpXcJPcUtlb+qNheCWPQVLJUuUOxW6MgK/osNYNH62EoPLQNPxRKr8jlqGUGoQEL3960VcXQL9gNFft5oVemLxW1oILu22nCt3vw6K9aXOOWKcy0+Qdzarq9XjRavTR/9FOu0M7axCSgnt35Dy037m3TS3olCxVLsJZoLzQ36Wjv2JXMJbuDvItlkGrn1VO3ZJ/1LBjBEpkOS7OUgHmEtMVJsUVTVP5INKS59DyofRf7ZnMxTWdzI27Wz9LTn+DGlmTf3fcY+u4bEhpGzspk39sxtrk+vJD8L+lBA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(376002)(366004)(396003)(39860400002)(451199021)(26005)(6512007)(186003)(4326008)(53546011)(6506007)(316002)(8676002)(6862004)(8936002)(36756003)(33656002)(86362001)(2906002)(5660300002)(478600001)(91956017)(54906003)(37006003)(6636002)(64756008)(41300700001)(83380400001)(2616005)(38070700005)(122000001)(38100700002)(66446008)(66556008)(66476007)(71200400001)(6486002)(76116006)(66946007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <9BC31B854F245448A63D458F3FDBB061@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9317
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e9e574e5-20ac-4bab-b7f3-08db40a9896c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hjEpEWrYLy3uvYgPcGPs+0XsKK0adNWid/MWQqXgknuURv1F4gYClanqAdNHpZp3PtN4egmWHmKOIabBXErCreSQ+fuQ4Tls63KWzf9VPhJyAAl5nZaTyNecbS7sn9lEObIG2IIQ14xnGY2byrisKIjXVTvUfAtwxI5EHj2Xq1FatxRHdK3wxGAsGyht1QV+2ELMTSvPXOyE35Hc+N5LwBt+8pi7ZSI0YNYwSAB/d2izUC3uT4d3xA0iPw1+icla9HR45nIlf0rIobEGOVqSLsxzUjaHWvu9Uk28P4Z1Bp+H4aiSRhcaVZrTWJ7WyHoGskREHqHXXQyQ6vJ+++sF2/StaYHAjKDNvH53/Omtu31I2HknbCxJZCq4renocAxE58Kcp3YED6l4IhY5SGaroEab+cnpnhSH60Xe9S32SuPRQ32ErvmQ/YuqvLpMUeYAS43V1gyIwhhNN3M2ts9J+6WAnuGozfAB6FDHTrpwH70BTlagNNeasmeHPslN2Tz7GgiSUOCJgI4wTJS0Tk/br1K5GFpYaC4pVTnF7q+ahtVUh6bIlU4TqEkRlYZzGXGJOsr4DLW1cT1zXxU1TIiZD1IPeKUmtvAKkf+h2ctHTd5vcrhcAeGM+1au84We+SEDoUZO1SBOoqPIaS/0mmubr7v0thsO1UwRdKkYO4fBDvlEpW/NvVp6vCsj2Lws0mD3rAfCoUQiCVsUzlqul+BVHw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(136003)(376002)(346002)(451199021)(36840700001)(46966006)(40470700004)(26005)(107886003)(186003)(40460700003)(82310400005)(41300700001)(6506007)(6512007)(6636002)(54906003)(37006003)(53546011)(40480700001)(86362001)(336012)(2616005)(47076005)(83380400001)(4326008)(316002)(70586007)(70206006)(36860700001)(8676002)(8936002)(2906002)(6862004)(6486002)(81166007)(33656002)(356005)(36756003)(82740400003)(5660300002)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 07:42:03.9413
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 92ff2ae5-4f00-4351-452e-08db40a991a2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9586

DQoNCj4gT24gMTkgQXByIDIwMjMsIGF0IDA4OjIxLCBCZXJ0cmFuZCBNYXJxdWlzIDxCZXJ0cmFu
ZC5NYXJxdWlzQGFybS5jb20+IHdyb3RlOg0KPiANCj4gSGkgTHVjYSwNCj4gDQo+PiBPbiAxOSBB
cHIgMjAyMywgYXQgMDk6MTUsIEx1Y2EgRmFuY2VsbHUgPEx1Y2EuRmFuY2VsbHVAYXJtLmNvbT4g
d3JvdGU6DQo+PiANCj4+IEhpIEJlcnRyYW5kLA0KPj4gDQo+Pj4+IA0KPj4+PiBkaWZmIC0tZ2l0
IGEveGVuL2FyY2gvYXJtL2FybTY0L3N2ZS5jIGIveGVuL2FyY2gvYXJtL2FybTY0L3N2ZS5jDQo+
Pj4+IGluZGV4IDU0ODU2NDg4NTBhMC4uYWQ1ZGI2MmUxODA1IDEwMDY0NA0KPj4+PiAtLS0gYS94
ZW4vYXJjaC9hcm0vYXJtNjQvc3ZlLmMNCj4+Pj4gKysrIGIveGVuL2FyY2gvYXJtL2FybTY0L3N2
ZS5jDQo+Pj4+IEBAIC05LDYgKzksOSBAQA0KPj4+PiAjaW5jbHVkZSA8eGVuL3NpemVzLmg+DQo+
Pj4+ICNpbmNsdWRlIDxhc20vYXJtNjQvc3ZlLmg+DQo+Pj4+IA0KPj4+PiArLyogb3B0X2RvbTBf
c3ZlOiBhbGxvdyBEb20wIHRvIHVzZSBTVkUgYW5kIHNldCBtYXhpbXVtIHZlY3RvciBsZW5ndGgu
ICovDQo+Pj4+ICtpbnQgX19pbml0ZGF0YSBvcHRfZG9tMF9zdmU7DQo+Pj4+ICsNCj4+Pj4gZXh0
ZXJuIHVuc2lnbmVkIGludCBzdmVfZ2V0X2h3X3ZsKHZvaWQpOw0KPj4+PiBleHRlcm4gdm9pZCBz
dmVfc2F2ZV9jdHgodWludDY0X3QgKnN2ZV9jdHgsIHVpbnQ2NF90ICpwcmVncywgaW50IHNhdmVf
ZmZyKTsNCj4+Pj4gZXh0ZXJuIHZvaWQgc3ZlX2xvYWRfY3R4KHVpbnQ2NF90IGNvbnN0ICpzdmVf
Y3R4LCB1aW50NjRfdCBjb25zdCAqcHJlZ3MsDQo+Pj4+IEBAIC0xMTgsMyArMTIxLDIxIEBAIHZv
aWQgc3ZlX3Jlc3RvcmVfc3RhdGUoc3RydWN0IHZjcHUgKnYpDQo+Pj4+IA0KPj4+PiAgc3ZlX2xv
YWRfY3R4KHN2ZV9jdHhfenJlZ19lbmQsIHYtPmFyY2gudmZwLmZwcmVncywgMSk7DQo+Pj4+IH0N
Cj4+Pj4gKw0KPj4+PiAraW50IF9faW5pdCBzdmVfc2FuaXRpemVfdmxfcGFyYW0oaW50IHZhbCwg
dW5zaWduZWQgaW50ICpvdXQpDQo+Pj4+ICt7DQo+Pj4+ICsgICAgLyoNCj4+Pj4gKyAgICAgKiBO
ZWdhdGl2ZSBTVkUgcGFyYW1ldGVyIHZhbHVlIG1lYW5zIHRvIHVzZSB0aGUgbWF4aW11bSBzdXBw
b3J0ZWQNCj4+Pj4gKyAgICAgKiB2ZWN0b3IgbGVuZ3RoLCBvdGhlcndpc2UgaWYgYSBwb3NpdGl2
ZSB2YWx1ZSBpcyBwcm92aWRlZCwgY2hlY2sgaWYgdGhlDQo+Pj4+ICsgICAgICogdmVjdG9yIGxl
bmd0aCBpcyBhIG11bHRpcGxlIG9mIDEyOCBhbmQgbm90IGJpZ2dlciB0aGFuIHRoZSBtYXhpbXVt
IHZhbHVlDQo+Pj4+ICsgICAgICogMjA0OA0KPj4+PiArICAgICAqLw0KPj4+PiArICAgIGlmICgg
dmFsIDwgMCApDQo+Pj4+ICsgICAgICAgICpvdXQgPSBnZXRfc3lzX3ZsX2xlbigpOw0KPj4+PiAr
ICAgIGVsc2UgaWYgKCAoKHZhbCAlIFNWRV9WTF9NVUxUSVBMRV9WQUwpID09IDApICYmICh2YWwg
PD0gU1ZFX1ZMX01BWF9CSVRTKSApDQo+Pj4+ICsgICAgICAgICpvdXQgPSB2YWw7DQo+Pj4gDQo+
Pj4gU2hvdWxkbid0IHlvdSBhbHNvIGNoZWNrIGlmIGl0IGlzIG5vdCBncmVhdGVyIHRoYW4gdGhl
IG1heGltdW0gdmVjdG9yIGxlbmd0aCA/DQo+PiANCj4+IEkgZG9u4oCZdCB1bmRlcnN0YW5kLCBJ
IGFtIGNoZWNraW5nIHRoYXQgdGhlIHZhbHVlIGlzIGJlbG93IG9yIGVxdWFsIHRvIFNWRV9WTF9N
QVhfQklUUywNCj4+IElmIHlvdSBtZWFuIGlmIGl0IHNob3VsZCBiZSBjaGVja2VkIGFsc28gYWdh
aW5zdCB0aGUgbWF4aW11bSBzdXBwb3J0ZWQgbGVuZ3RoIGJ5IHRoZSBwbGF0Zm9ybSwNCj4+IEkg
dGhpbmsgdGhpcyBpcyBub3QgdGhlIHJpZ2h0IHBsYWNlLCB0aGUgY2hlY2sgaXMgYWxyZWFkeSBp
biBhcmNoX3Nhbml0aXNlX2RvbWFpbl9jb25maWcoKSwgaW50cm9kdWNlZA0KPj4gaW4gcGF0Y2gg
IzINCj4gDQo+IElmIHRoaXMgaXMgbm90IHRoZSByaWdodCBwbGFjZSB0byBjaGVjayBpdCB0aGVu
IHdoeSBjaGVja2luZyB0aGUgcmVzdCBoZXJlID8NCj4gDQo+IEZyb20gYSB1c2VyIG9yIGEgZGV2
ZWxvcGVyIHBvaW50IG9mIHZpZXcgSSB3b3VsZCBleHBlY3QgdGhlIHZhbGlkaXR5IG9mIHRoZSBp
bnB1dCB0byBiZSBjaGVja2VkIG9ubHkNCj4gaW4gb25lIHBsYWNlLg0KPiBJZiBoZXJlIGlzIG5v
dCB0aGUgcGxhY2UgZm9yIHRoYXQgaXQgaXMgb2sgYnV0IHRoZW4gaSB3b3VsZCBjaGVjayBldmVy
eXRoaW5nIGluIGFyY2hfc2FuaXRpc2VfZG9tYWluX2NvbmZpZw0KPiAobXVsdGlwbGUsIG1pbiBh
bmQgc3VwcG9ydGVkKSBpbnN0ZWFkIG9mIGRvaW5nIGl0IHBhcnRseSBpbiAyIHBsYWNlcy4NCg0K
T2ssIGdpdmVuIHRoZSB3YXkgd2UgZW5jb2RlZCB0aGUgdmFsdWUgaW4geGVuX2RvbWN0bF9jcmVh
dGVkb21haW4gc3RydWN0dXJlLCB3ZSBoYXZlIHRoYXQgdGhlIHZhbHVlIHRha2VzDQp2ZXJ5IGxp
dHRsZSBzcGFjZSwgYnV0IGEgc21hbGwgaXNzdWUgaXMgdGhhdCB3aGVuIHdlIGVuY29kZSBpdCwg
d2UgYXJlIGRpdmlkaW5nIGl0IGJ5IDEyOCwgd2hpY2ggaXMgZmluZSBmb3IgdXNlciBwYXJhbXMN
CnRoYXQgYXJlIG11bHRpcGxlIG9mIDEyOCwgYnV0IGl04oCZcyBsZXNzIGZpbmUgaWYgdGhlIHVz
ZXIgcGFzc2VzIOKAnDEyOeKAnS4NCg0KVG8gb3ZlcmNvbWUgdGhpcyBpc3N1ZSB3ZSBhcmUgY2hl
Y2tpbmcgdGhlIHZhbHVlIHdoZW4gaXQgaXMgbm90IGFscmVhZHkgZW5jb2RlZC4gTm93LCB0aGlu
a2luZyBhYm91dCBpdCwgdGhlIGNoZWNrIA0KIiYmICh2YWwgPD0gU1ZFX1ZMX01BWF9CSVRTKeKA
nSBpcyBub3QgcmVhbGx5IG5lZWRlZCwgYmVjYXVzZSBldmVuIGlmIHRoZSB2YWx1ZSBpcyBhYm92
ZSwgdGhlbiBpbiBhcmNoX3Nhbml0aXNlX2RvbWFpbl9jb25maWcNCndlIHdpbGwgaGl0IHRoZSB0
b3AgbGltaXQgb2YgdGhlIHBsYXRmb3JtIG1heGltdW0gVkwuDQoNCmludCBhcmNoX3Nhbml0aXNl
X2RvbWFpbl9jb25maWcoc3RydWN0IHhlbl9kb21jdGxfY3JlYXRlZG9tYWluICpjb25maWcpDQp7
DQogICAgdW5zaWduZWQgaW50IG1heF92Y3B1czsNCiAgICB1bnNpZ25lZCBpbnQgZmxhZ3NfcmVx
dWlyZWQgPSAoWEVOX0RPTUNUTF9DREZfaHZtIHwgWEVOX0RPTUNUTF9DREZfaGFwKTsNCiAgICB1
bnNpZ25lZCBpbnQgZmxhZ3Nfb3B0aW9uYWwgPSAoWEVOX0RPTUNUTF9DREZfaW9tbXUgfCBYRU5f
RE9NQ1RMX0NERl92cG11KTsNCiAgICB1bnNpZ25lZCBpbnQgc3ZlX3ZsX2JpdHMgPSBzdmVfZGVj
b2RlX3ZsKGNvbmZpZy0+YXJjaC5zdmVfdmwpOw0KDQogICAgaWYgKCAoY29uZmlnLT5mbGFncyAm
IH5mbGFnc19vcHRpb25hbCkgIT0gZmxhZ3NfcmVxdWlyZWQgKQ0KICAgIHsNCiAgICAgICAgZHBy
aW50ayhYRU5MT0dfSU5GTywgIlVuc3VwcG9ydGVkIGNvbmZpZ3VyYXRpb24gJSN4XG4iLA0KICAg
ICAgICAgICAgICAgIGNvbmZpZy0+ZmxhZ3MpOw0KICAgICAgICByZXR1cm4gLUVJTlZBTDsNCiAg
ICB9DQoNCiAgICAvKiBDaGVjayBmZWF0dXJlIGZsYWdzICovDQogICAgaWYgKCBzdmVfdmxfYml0
cyA+IDAgKQ0KICAgIHsNCiAgICAgICAgdW5zaWduZWQgaW50IHpjcl9tYXhfYml0cyA9IGdldF9z
eXNfdmxfbGVuKCk7DQoNCiAgICAgICAgaWYgKCAhemNyX21heF9iaXRzICkNCiAgICAgICAgew0K
ICAgICAgICAgICAgZHByaW50ayhYRU5MT0dfSU5GTywgIlNWRSBpcyB1bnN1cHBvcnRlZCBvbiB0
aGlzIG1hY2hpbmUuXG4iKTsNCiAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOw0KICAgICAgICB9
DQoNCiAgICAgICAgaWYgKCBzdmVfdmxfYml0cyA+IHpjcl9tYXhfYml0cyApDQogICAgICAgIHsN
CiAgICAgICAgICAgIGRwcmludGsoWEVOTE9HX0lORk8sDQogICAgICAgICAgICAgICAgICAgICJS
ZXF1ZXN0ZWQgU1ZFIHZlY3RvciBsZW5ndGggKCV1KSA+IHN1cHBvcnRlZCBsZW5ndGggKCV1KVxu
IiwNCiAgICAgICAgICAgICAgICAgICAgc3ZlX3ZsX2JpdHMsIHpjcl9tYXhfYml0cyk7DQogICAg
ICAgICAgICByZXR1cm4gLUVJTlZBTDsNCiAgICAgICAgfQ0KICAgIH0NCiAgIFsuLi5dDQoNCk5v
dywgSSB1bmRlcnN0YW5kIHlvdXIgcG9pbnQsIHdlIGNvdWxkIGNoZWNrIGV2ZXJ5dGhpbmcgaW4g
c3ZlX3Nhbml0aXplX3ZsX3BhcmFtKCksIGJ1dCBpdCB3b3VsZCBsZWF2ZSBhIHByb2JsZW0NCmZv
ciBkb21haW5zIGNyZWF0ZWQgYnkgaHlwZXJjYWxscyBpZiBJIGFtIG5vdCB3cm9uZy4NCg0KV2hh
dCBkbyB5b3UgdGhpbms/DQoNCg0K

