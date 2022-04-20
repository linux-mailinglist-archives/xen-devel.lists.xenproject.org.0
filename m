Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 059BC508B58
	for <lists+xen-devel@lfdr.de>; Wed, 20 Apr 2022 16:59:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.309338.525474 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhBmQ-000210-Ga; Wed, 20 Apr 2022 14:58:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 309338.525474; Wed, 20 Apr 2022 14:58:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhBmQ-0001y5-Cv; Wed, 20 Apr 2022 14:58:06 +0000
Received: by outflank-mailman (input) for mailman id 309338;
 Wed, 20 Apr 2022 14:58:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k8Fu=U6=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1nhBmP-0001xz-1h
 for xen-devel@lists.xenproject.org; Wed, 20 Apr 2022 14:58:05 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20630.outbound.protection.outlook.com
 [2a01:111:f400:7d00::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 471318b6-c0ba-11ec-a405-831a346695d4;
 Wed, 20 Apr 2022 16:58:03 +0200 (CEST)
Received: from DB7PR05CA0040.eurprd05.prod.outlook.com (2603:10a6:10:2e::17)
 by AM6PR08MB3269.eurprd08.prod.outlook.com (2603:10a6:209:49::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13; Wed, 20 Apr
 2022 14:58:01 +0000
Received: from DB5EUR03FT051.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2e:cafe::c) by DB7PR05CA0040.outlook.office365.com
 (2603:10a6:10:2e::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13 via Frontend
 Transport; Wed, 20 Apr 2022 14:58:01 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT051.mail.protection.outlook.com (10.152.21.19) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5186.14 via Frontend Transport; Wed, 20 Apr 2022 14:58:01 +0000
Received: ("Tessian outbound ac9bb5dd84f6:v118");
 Wed, 20 Apr 2022 14:58:00 +0000
Received: from 157407c4dda6.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 02295FC8-35B6-4310-9C0C-24550698381E.1; 
 Wed, 20 Apr 2022 14:57:54 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 157407c4dda6.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 20 Apr 2022 14:57:54 +0000
Received: from AM0PR08MB3956.eurprd08.prod.outlook.com (2603:10a6:208:131::12)
 by AM6PR08MB4263.eurprd08.prod.outlook.com (2603:10a6:20b:b7::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Wed, 20 Apr
 2022 14:57:53 +0000
Received: from AM0PR08MB3956.eurprd08.prod.outlook.com
 ([fe80::c9b3:a7d5:f4ee:8c40]) by AM0PR08MB3956.eurprd08.prod.outlook.com
 ([fe80::c9b3:a7d5:f4ee:8c40%5]) with mapi id 15.20.5186.013; Wed, 20 Apr 2022
 14:57:53 +0000
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
X-Inumbo-ID: 471318b6-c0ba-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qcSxRGKWIyXVsTcm+6OyqMKTxR49DC5OvdmGcWW3kc4=;
 b=has0C6gOtTMyopAVBjrgOEniItyfG+sl8Tyekf08Sqkg5neZQEjcNWX9Mspgk9vEyXLds0sX8Px4Q6bZ2SNIMEbJKcP0RT2MG/45LV/XwjjPp0Ly8XaLKpaMJCuIUJ8woCqYtSdjW8q3UrAWvohSULixNLDELAfPl8pxQkEPyvc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: f8c0a3221b450856
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bOa/VGOJWx0PPwZCJJXESkOSnpXn0ytqpCCO8SwyuipQofZKuNvLTikdLIQya/4MzedZAjfkHSIfrK7xxcDbd3vfBzpf6qU0bJnytD1HuVgWKg+4TrmHuO3LXFIrtwCFcD8NeEjjCnsFFpDJ9bL36TNDShJoQyhq0T2SL9QhgwNHelht4dTi5cck6xHQ9+HXTolDyFclXZ7P2GTsqvW/aWpcEx0Ulb4Oz6ImHG8ji2BSKx7pqr3tpTLCW0iif9Bq71MJ332cNVzHyEZ3zZX/PPUfhUSjhLlcQSgsL41eKKEzz2ewMpfiCaenD0ppCAwnpbWsKCoSZJPAfTHgkU+wIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qcSxRGKWIyXVsTcm+6OyqMKTxR49DC5OvdmGcWW3kc4=;
 b=dNKuSQYFEl/9kf2z4QMNZ7GgsR+jiAwQIZWhAj2hJApwCFSKAlXyCxDUS7gHbQBP9U5ULr8qIZx49n98ncyJCKgTkAOtQl7bbsNAa4zkCFVg08fnvTgVHFPaYNbOcxrrDSm0E5xRqXBk/gyklqCqDFXcaqT7Bm0IUDmW5yup/hPSlyfEoxnSPLGIsDengTnykEUuKsL2QchwRkDEtlBOt1n2Fq5FYGeJZ9KfX9y218CM/DTldWPFZol+h7iNgRM4Hf/AXcjtwrGQnazvKwjPZxxhHOkG5+4xWiPx1J2s69khzlwEJ5feSLclTSq+9n8PQZzCTTkWisZhmxRwlVDJmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qcSxRGKWIyXVsTcm+6OyqMKTxR49DC5OvdmGcWW3kc4=;
 b=has0C6gOtTMyopAVBjrgOEniItyfG+sl8Tyekf08Sqkg5neZQEjcNWX9Mspgk9vEyXLds0sX8Px4Q6bZ2SNIMEbJKcP0RT2MG/45LV/XwjjPp0Ly8XaLKpaMJCuIUJ8woCqYtSdjW8q3UrAWvohSULixNLDELAfPl8pxQkEPyvc=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Xen developer discussion <xen-devel@lists.xenproject.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
	Juergen Gross <jgross@suse.com>, Dario Faggioli <dfaggioli@suse.com>, George
 Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH v7 5/7] xen/cpupool: Don't allow removing cpu0 from
 cpupool0
Thread-Topic: [PATCH v7 5/7] xen/cpupool: Don't allow removing cpu0 from
 cpupool0
Thread-Index: AQHYTbfhTkT1+2FTCUa/iQjDpfI7J6z48pQA
Date: Wed, 20 Apr 2022 14:57:52 +0000
Message-ID: <214318DB-3359-4525-870F-0293EDDC32A6@arm.com>
References: <20220411152101.17539-1-luca.fancellu@arm.com>
 <20220411152101.17539-6-luca.fancellu@arm.com>
In-Reply-To: <20220411152101.17539-6-luca.fancellu@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 94c9fcc2-a573-43b6-953d-08da22de2a13
x-ms-traffictypediagnostic:
	AM6PR08MB4263:EE_|DB5EUR03FT051:EE_|AM6PR08MB3269:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB32691D0C4FA5D5C5F5D9CC90E4F59@AM6PR08MB3269.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 U3FS4kt8lna7YcISOHJ3WeJ30mbeuVPBbpQ3OFygfTK2tw5DWTr8AjchphBxTazlDg1Ay+54zra/x3/68abOJzOaVoGj/aRLM8a26QIPj6VDbA5uLwuuYyNp24u3ELFMgtYOQPcQJT15Fm7RKNglVh+65Z62iMp8PvIJcZronMy7mbZuinVK4p5YtwBavPicQy/TFl2/MsxV5ItCLuJveOUlkgydoIpj+4vVw1523rnoE0qo0ma9WessxC0/EnAXJHP+9HbjGi5sH/Pc2j5bqVrich946qZnnmeeuIhyVuVdyHxE2KTYDN23n+Gg2tKE/bG/741pG325W37V/x5jRBHIfgqU8b9jtiKYDc3pxId9l9VzsUSx02PFn6+l3OcTqho6OAvzIt0eg3YgO9D4fBsd5av/R4Y95ayMd+yKNITKMN3tH30lPkp5O6VlfkKuEMrcb5ClwIiqvSNNxk/GJa5gq7VMi6rASwY/PvS+joEHAf7z+RTicSO+zNMIJDaphw8kQvlYRcfpOH7rh/di3gAbRt1B1dMtL+AuA876O/gNcEyBci7MshYSzUjbd/RkIu+rglCQyq4AFVRXEu93cdqRakafFLkYKgRQAwEH1lRLjLbLzXKbUS6C20968w83SpQ5sFyWUoZKaMx/ssU5mvrTkCOB6JLWdondS/lUIUtJK6ThXWGHtSfId0/L+chpUwRjUnK7p+IHvmXXL0PKnPmtO3quRmqKgXG4PYIRXGZIVGo+wbk6zj3eVWJgC4cN
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3956.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8676002)(71200400001)(66556008)(36756003)(26005)(186003)(4326008)(6916009)(8936002)(86362001)(2616005)(5660300002)(66476007)(66946007)(91956017)(76116006)(122000001)(6512007)(6486002)(33656002)(54906003)(83380400001)(316002)(508600001)(6506007)(38100700002)(38070700005)(66446008)(2906002)(64756008)(53546011)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <E6F06DBBFDA8D54D858790974C670B7F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4263
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ff9bfc22-3846-48c4-89f2-08da22de2545
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hySsSHn3zaV669ITTMpWiVsFYK2H+yZ5xEwWntMS0l4INVinwDCtlWhIXSNJT//XlF1xPTZJqSVTJ2sa4vgpBNjNEGq5fjnraLQRnpFjCWTe+BPYQpSuOJBtYAjiEXz9WlWj3OoyCtbn5eTtgsg/vA/7V+cCIEUOhrCBUOxtnUU3m8y7ECU/6RlvJyyrNJo3SxY1VfvEovEXF/Zj572TNTW4pFIJPS7xmyNUuTLzGaugys5/SjmSF5ZnHuJ6wYqDf1Gl206ljoVrTxM5jA2vGs6T8kC4ONDNei4V/ZW5KkxiRI2GTWz8e1g/4cPeutjEwermNwY5A9u2gVZD0i7S6uSjV28O4WTc2g80zGNlPoag1O0wPcHu7oE8vXFxL4zHsaPaolfAa8CdsEF1gmbWf+d6bwV8eQl4Ksc3XaO3oO6EsVaKO4fiB1RY6iSrvtORBQM0+J5RpXxdmyzRXVdjgM7OO9Bcrx06U8Mev2O5us1UdY7OtKTXhy1wd+umDnwH90FttXnltzQheMqILGlNbZlno8F68sZ7WDDWFTsAByn9n2/XWn7b5hEx7FSBNmqCHp+KvzMqhVHxMI4oXHqhKe614J0BKpf2iKB571ZtIexWQY63ChbySbc6DxJ6ll/iNv5YwjWfCALiuhnRL54+mt5jtweJWhu8z7TWjQD4PFdsNqERAn5b3xMLjR+96Cl5
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(6512007)(86362001)(36756003)(186003)(81166007)(40460700003)(316002)(6486002)(107886003)(26005)(36860700001)(6506007)(2906002)(336012)(8676002)(6916009)(4326008)(508600001)(53546011)(8936002)(356005)(5660300002)(33656002)(82310400005)(83380400001)(47076005)(2616005)(54906003)(70206006)(70586007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2022 14:58:01.0357
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 94c9fcc2-a573-43b6-953d-08da22de2a13
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3269

DQoNCj4gT24gMTEgQXByIDIwMjIsIGF0IDE2OjIwLCBMdWNhIEZhbmNlbGx1IDxMdWNhLkZhbmNl
bGx1QGFybS5jb20+IHdyb3RlOg0KPiANCj4gQ3B1MCBtdXN0IHJlbWFpbiBpbiBjcHVwb29sMCwg
b3RoZXJ3aXNlIHNvbWUgb3BlcmF0aW9ucyBsaWtlIG1vdmluZyBjcHVzDQo+IGJldHdlZW4gY3B1
cG9vbHMsIGNwdSBob3RwbHVnLCBkZXN0cm95aW5nIGNwdXBvb2xzLCBzaHV0ZG93biBvZiB0aGUg
aG9zdCwNCj4gbWlnaHQgbm90IHdvcmsgaW4gYSBzYW5lIHdheS4NCj4gDQo+IFNpZ25lZC1vZmYt
Ynk6IEx1Y2EgRmFuY2VsbHUgPGx1Y2EuZmFuY2VsbHVAYXJtLmNvbT4NCj4gLS0tDQo+IENoYW5n
ZXMgaW4gdjc6DQo+IC0gbmV3IHBhdGNoDQo+IC0tLQ0KPiB4ZW4vY29tbW9uL3NjaGVkL2NwdXBv
b2wuYyB8IDggKysrKysrKy0NCj4gMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vc2NoZWQvY3B1cG9vbC5j
IGIveGVuL2NvbW1vbi9zY2hlZC9jcHVwb29sLmMNCj4gaW5kZXggODZhMTc1Zjk5Y2Q1Li4wYTkz
YmNjNjMxYmYgMTAwNjQ0DQo+IC0tLSBhL3hlbi9jb21tb24vc2NoZWQvY3B1cG9vbC5jDQo+ICsr
KyBiL3hlbi9jb21tb24vc2NoZWQvY3B1cG9vbC5jDQo+IEBAIC01NzIsNiArNTcyLDcgQEAgc3Rh
dGljIGxvbmcgY2ZfY2hlY2sgY3B1cG9vbF91bmFzc2lnbl9jcHVfaGVscGVyKHZvaWQgKmluZm8p
DQo+ICAqIHBvc3NpYmxlIGZhaWx1cmVzOg0KPiAgKiAtIGxhc3QgY3B1IGFuZCBzdGlsbCBhY3Rp
dmUgZG9tYWlucyBpbiBjcHVwb29sDQo+ICAqIC0gY3B1IGp1c3QgYmVpbmcgdW5wbHVnZ2VkDQo+
ICsgKiAtIEF0dGVtcHQgdG8gcmVtb3ZlIGJvb3QgY3B1IGZyb20gY3B1cG9vbDANCj4gICovDQo+
IHN0YXRpYyBpbnQgY3B1cG9vbF91bmFzc2lnbl9jcHUoc3RydWN0IGNwdXBvb2wgKmMsIHVuc2ln
bmVkIGludCBjcHUpDQo+IHsNCj4gQEAgLTU4Miw3ICs1ODMsMTIgQEAgc3RhdGljIGludCBjcHVw
b29sX3VuYXNzaWduX2NwdShzdHJ1Y3QgY3B1cG9vbCAqYywgdW5zaWduZWQgaW50IGNwdSkNCj4g
ICAgIGRlYnVndHJhY2VfcHJpbnRrKCJjcHVwb29sX3VuYXNzaWduX2NwdShwb29sPSV1LGNwdT0l
ZClcbiIsDQo+ICAgICAgICAgICAgICAgICAgICAgICBjLT5jcHVwb29sX2lkLCBjcHUpOw0KPiAN
Cj4gLSAgICBpZiAoICFjcHVfb25saW5lKGNwdSkgKQ0KPiArICAgIC8qDQo+ICsgICAgICogQ3B1
MCBtdXN0IHJlbWFpbiBpbiBjcHVwb29sMCwgb3RoZXJ3aXNlIHNvbWUgb3BlcmF0aW9ucyBsaWtl
IG1vdmluZyBjcHVzDQo+ICsgICAgICogYmV0d2VlbiBjcHVwb29scywgY3B1IGhvdHBsdWcsIGRl
c3Ryb3lpbmcgY3B1cG9vbHMsIHNodXRkb3duIG9mIHRoZSBob3N0LA0KPiArICAgICAqIG1pZ2h0
IG5vdCB3b3JrIGluIGEgc2FuZSB3YXkuDQo+ICsgICAgICovDQo+ICsgICAgaWYgKCAoIWMtPmNw
dXBvb2xfaWQgJiYgIWNwdSkgfHwgIWNwdV9vbmxpbmUoY3B1KSApDQo+ICAgICAgICAgcmV0dXJu
IC1FSU5WQUw7DQo+IA0KPiAgICAgbWFzdGVyX2NwdSA9IHNjaGVkX2dldF9yZXNvdXJjZV9jcHUo
Y3B1KTsNCj4gLS0gDQo+IDIuMTcuMQ0KPiANCg0KSGksDQoNCknigJltIGdvaW5nIHRvIGFkZHJl
c3MgdGhlIGNvbW1lbnQgb24gdGhpcyBzZXJpZSBiZWZvcmUgcmUtcHVzaGluZyBpdCwgSSBzZWUg
dGhlcmUNCmFyZSBubyBjb21tZW50cyBvbiB0aGlzIHBhdGNoLCBzbyBJ4oCZbSB3b25kZXJpbmcs
IHdoZW4geW91IGhhdmUgdGltZSwgaWYgeW91DQpjYW4gZ2l2ZSBtZSBzb21lIGZlZWRiYWNrIG9u
IHRoaXMgb25lLg0KDQpDaGVlcnMsDQpMdWNh

