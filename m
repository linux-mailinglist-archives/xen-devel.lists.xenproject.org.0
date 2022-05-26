Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B065E535270
	for <lists+xen-devel@lfdr.de>; Thu, 26 May 2022 19:11:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.337692.562362 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nuH0j-0002Qp-K2; Thu, 26 May 2022 17:10:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 337692.562362; Thu, 26 May 2022 17:10:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nuH0j-0002OS-HG; Thu, 26 May 2022 17:10:57 +0000
Received: by outflank-mailman (input) for mailman id 337692;
 Thu, 26 May 2022 17:10:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/0Dc=WC=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1nuH0h-0002OM-Ht
 for xen-devel@lists.xenproject.org; Thu, 26 May 2022 17:10:55 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02on0606.outbound.protection.outlook.com
 [2a01:111:f400:fe07::606])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cc3ac233-dd16-11ec-837f-e5687231ffcc;
 Thu, 26 May 2022 19:10:52 +0200 (CEST)
Received: from AM6P192CA0051.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:82::28)
 by PAXPR08MB7381.eurprd08.prod.outlook.com (2603:10a6:102:22b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Thu, 26 May
 2022 17:10:51 +0000
Received: from AM5EUR03FT026.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:82:cafe::38) by AM6P192CA0051.outlook.office365.com
 (2603:10a6:209:82::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13 via Frontend
 Transport; Thu, 26 May 2022 17:10:50 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT026.mail.protection.outlook.com (10.152.16.155) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5293.13 via Frontend Transport; Thu, 26 May 2022 17:10:50 +0000
Received: ("Tessian outbound 07c1c99345b0:v119");
 Thu, 26 May 2022 17:10:50 +0000
Received: from f4fbc7838ef5.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A533AAAA-24D4-48E1-94C7-42343DA66F13.1; 
 Thu, 26 May 2022 17:10:43 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f4fbc7838ef5.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 26 May 2022 17:10:43 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com (2603:10a6:208:103::16)
 by VI1PR08MB3023.eurprd08.prod.outlook.com (2603:10a6:803:4e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.19; Thu, 26 May
 2022 17:10:42 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::1017:8b09:6681:c914]) by AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::1017:8b09:6681:c914%5]) with mapi id 15.20.5293.013; Thu, 26 May 2022
 17:10:41 +0000
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
X-Inumbo-ID: cc3ac233-dd16-11ec-837f-e5687231ffcc
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=QotCX9UJ6L+witQgMtSnwAljFP5agSW/iMsD7ncCIz7QgakIOPh6UH3EBEfcEumHFO009n01ahQPyhyYNMQz8Bt/MwPOq9wPRJ69lQvYRjq772J+H+5pggtgWf3qNa09CnMb2V1UE2jKGo4iy5fvmUe2Arb6BYlrsEMJcnqdbAm/s9m0xjX1Yywdn2Xxxzjw1w+JyWIZFTi1P66szAmwjuERuVwutVp4YTcElfYFmHIqt3hlqrOoECYr8VJzzUD5hg7X5kAF22KrH4n9Rdbw10RDIvnfLnB9By9MfRQtrPOre4lW21R2SCsuWXHfzRfjqIJKvjsqZql5XulFSker4A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jpvzNHiD8VClRALkv4375mtkPFgx7vVjAUEl46ExAYw=;
 b=T6UG6EpCRaio0+dMP0a5Z5dCPGdaQN9vYiU/K2FtYYuS9T8mQSS+f54xIWP4Lrf7d5QwQqI9O6CTWKxqlJJqHPgD0UqJh8QJJX0o5yvY/8pYUUEFyJkBQqvjXos82pomlbFW0rxhVZAIRsQhdHlTvylha/3xnXMzVI0UPJu72Nbad40QEeFtcjhYtbwmF/mS+e+0LU5lD2goHdoAAsNw96jkCMCjAb4lGatRcc6IlCupthriju+InOvLyvKGDCnPzlsVhM/Gc1lWaOmmdQz/62KIy6M4NG89biJAXozcEzGsOQxGRJqaW6iSB2sQT5/EGm3LbYOlJBhUrL3IRGgviw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jpvzNHiD8VClRALkv4375mtkPFgx7vVjAUEl46ExAYw=;
 b=3AsNMhHPjr+TP6kquio6Jsg6QPTWygzTDn/9uHEtL86jQk+mrgf6XIGEm2+x+/nRdBHBKpTYzOjdmgh1V7eha5ZFazEox72nBHa0LBa6DIWUHH3u3WPls6EYgh4zEiamCdDO8fU0/LcR3zTBv6w+hfSFI/oXxNVecdkVJXsWWTI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 11788fa01fdad42e
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GuCwCsAEpYxAitZWds6aQU73i0ULoVxS6TpD8z0mOXyx467NkyVm82n6BT7fHJXZgHYgHwxh0X0NDjow9A/HiE2T1k1wZ1PoSXbmc+F8bIPrMxuCKJH9GOuKoFtROpL8G/15mGTHnVfKWjvzd8KFr2WUu0t0C57uysJDfyghgEg0M1sp8P73P2Jk5hLtDL1tEIP8RuTRJ+/cyBnT4PDXpWcYGdmz84foCZ8FFqy/l8xAFpnxEez9r143yjB7GTYNNlNz6cp4SCSRD2csoKcZN8Mr6pVg3fwfUcbr3FYFgjfWVytJq1f4jW88zmfaUKaTj6FdbXgv7e9rSnQfaYNJxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jpvzNHiD8VClRALkv4375mtkPFgx7vVjAUEl46ExAYw=;
 b=Vs4SmI45QAUqc1Cd6OkERIz6lVxoV4KmwOeAH0PgfZl+usniFfFxdk7HYgvNNKke4oRu2YLvs3tP3Bzo6W703vUI/Ghs7brCFCMjhrA1brUSm0GpSoDNbcTYoRaFLBB27hCkwQQAeNwmSwdVIZY2E/PsqRRJ9eEw+tisdMyoCeZZkELl6vhLnGQ/lsvZtx/C4tu2E093/6uOLyk522aezNmPshVYfFqZPu8b1CbxemDgyQeM0PxC8YCwvUdhUx/DkyQT2MFfEQu9qUexnzh7TTLVxW60Yxxk89ijS57OTDGFnEzlIN5NZlME2KSF3krB8v9x5v0ZfpWtiknpoIrOjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jpvzNHiD8VClRALkv4375mtkPFgx7vVjAUEl46ExAYw=;
 b=3AsNMhHPjr+TP6kquio6Jsg6QPTWygzTDn/9uHEtL86jQk+mrgf6XIGEm2+x+/nRdBHBKpTYzOjdmgh1V7eha5ZFazEox72nBHa0LBa6DIWUHH3u3WPls6EYgh4zEiamCdDO8fU0/LcR3zTBv6w+hfSFI/oXxNVecdkVJXsWWTI=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Julien Grall
	<jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 14/16] xen/arm64: mm: Add memory to the boot allocator
 first
Thread-Topic: [PATCH 14/16] xen/arm64: mm: Add memory to the boot allocator
 first
Thread-Index: AQHYbENEz/LzQKbbT0SYYuE1BYAePK0xboeA
Date: Thu, 26 May 2022 17:10:41 +0000
Message-ID: <B43B0DE4-2D37-4A45-A68D-8172E98D2BB2@arm.com>
References: <20220520120937.28925-1-julien@xen.org>
 <20220520120937.28925-15-julien@xen.org>
In-Reply-To: <20220520120937.28925-15-julien@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 7a2539aa-2ad8-40b6-3dfa-08da3f3aaf0d
x-ms-traffictypediagnostic:
	VI1PR08MB3023:EE_|AM5EUR03FT026:EE_|PAXPR08MB7381:EE_
X-Microsoft-Antispam-PRVS:
	<PAXPR08MB7381FA1C202694A831FAEFBBE4D99@PAXPR08MB7381.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 7vKtined+Edi214nLq6HjOkhuH2KoQOIr1129TQy1MqIMd50ckDoXIMVtAYBg3lTMxHgo2ysx1NCo0Du1X+ll5y4Mhe8LGqJg8AmL6TM+AxlD7sFMsZkzWY2aL/xYZEbPQOeNZLN9iYuC9ZJKIpaUTOtdkyXmpO39sr52UpAZiZvbmzzUI9fXSEnR+Xt8gnAVX8zgdShaRb8QvbxJ1Q+dZV+TqSCpxACbR4zMArKXBnV3uT294MLmASclIjnj0AmykXi+ffBOJrRxNdmigOE3aII5lxC4WFEY/QoBUOvktdQBgx/2RrxTDICfyiOfi/E/2dkgYLdmQ2uV6edOMbIRxZ4BOVU41vZeNsvnItp5PxRmv9ZbsdHZ6ll427R0vtKytmUKNWlo3olUrixKlOn3oCyEPU+CoJrxNiCd5cLnoEkhpCSiSc8xSWqXuFvn1GNaJI6VCC01fLvk3FXulXGRkyRlCCoX1s1ZllQ/g5nX26yLiqFnEo1KG30u65kwcCZPlCKo1SfPE1dBv/kjrQmDx0gbe9pP0ENl1BgbDNFCi7wrV6IA+hTpyuxwcOO5Dgg7sT/sNH1WvVeuJhrHZvue42aYqOkXnU4v+2EE5Hs08mfMGsL0A4P6dhWgv4xrAB/wXvztAOkqdyBiDBBaX8ublYTKfC8jAZ5qfAA2bcmwJeIzr+faTu91iUp3DaGkWfbDJoUqN3Ov16SFKitXDP8IOc2g3CcHtrzDFobAH4cAOW1H3d05DdoerAMrgIVzpoR
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3809.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6486002)(33656002)(86362001)(66446008)(66556008)(508600001)(6916009)(54906003)(91956017)(71200400001)(8676002)(4326008)(66946007)(76116006)(122000001)(66476007)(8936002)(36756003)(5660300002)(316002)(64756008)(26005)(6512007)(6506007)(53546011)(2906002)(38100700002)(38070700005)(2616005)(186003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <893A45DEF6D75448BA134B1FE5FC77EA@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3023
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5339612b-20bb-4830-66e4-08da3f3aaa00
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Kcr8/Z4HEw1tNRgz97qDUTEP80PFNxl9XkS8jwQKWwslguSaJiuWoclMoRJqqNrHvFDF+gRJ0Yacd4P2RM357L0J1eILJUj3PruBIcMVaN1MzhoXMBh/QVxNgJ01PWiWcOoJWttAvkc6vDD2GWkCvGFXuqA+M2H7vILlN7gjARaQhC32YisRKASNyC3Er8swk8/Fq0Gtab0kShgQd7YWb8SdTcLt9vPULE6sHbDiWFe4rTWtiL2YICnvkbgFN5VIHpd3kA/DhnAGhxd89HNDNayq1UYXEp2q/CiB/d0TE2Kb9+qVa/kn9KsKluXKkNVPH4fzSkoZ/UepRcuG373kuZkVUY0xOeZayphcPBH2CGgW8DkSN6XR6NQpb+pX2oridCrvr7ip3paRDk2r+OHOdbVTFp8YYgjnQ7KrtTHSpsUFBgMdU1OuMfmYN/SZmp6tIuwUWpoPcdDh95An673sdzs20C4tUmy5x1Js9hFLikKUR7/BXZ0Z+PWB717iH8SvZMZDeC2Eh6PVUL7syndgAgcmwFVo7EYSU23jENLzws6JvCQpLjz3JRkdyZOvhEOPV7/wpmmPVkuByQu5ugGT7l3TSdrixKS+e0vzCevYeicWLkQXHcJ+ludlC3xmEg39EN3KvJi74CBKeGTQgXJ/feyBzYrZfEBFO4Dv/2yhTdlq1ankJaC4kyWU2kjFlLOA
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(86362001)(54906003)(36756003)(82310400005)(2906002)(186003)(2616005)(336012)(107886003)(53546011)(26005)(8936002)(70586007)(40460700003)(4326008)(5660300002)(47076005)(70206006)(6512007)(6862004)(8676002)(6506007)(81166007)(316002)(36860700001)(356005)(6486002)(33656002)(508600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2022 17:10:50.3255
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a2539aa-2ad8-40b6-3dfa-08da3f3aaf0d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7381

DQoNCj4gT24gMjAgTWF5IDIwMjIsIGF0IDEzOjA5LCBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4u
b3JnPiB3cm90ZToNCj4gDQo+IEZyb206IEp1bGllbiBHcmFsbCA8amdyYWxsQGFtYXpvbi5jb20+
DQo+IA0KPiBDdXJyZW50bHksIG1lbW9yeSBpcyBhZGRlZCB0byB0aGUgYm9vdCBhbGxvY2F0b3Ig
YWZ0ZXIgdGhlIHhlbmhlYXANCj4gbWFwcGluZ3MgYXJlIGRvbmUuIFRoaXMgd2lsbCBicmVhayBp
ZiB0aGUgZmlyc3QgbWFwcGluZyBpcyBtb3JlIHRoYW4NCj4gNTEyR0Igb2YgUkFNLg0KPiANCj4g
SW4gYWRkaXRpb24gdG8gdGhhdCwgYSBmb2xsb3ctdXAgcGF0Y2ggd2lsbCByZXdvcmsgc2V0dXBf
eGVuaGVhcF9tYXBwaW5ncygpDQo+IHRvIHVzZSBzbWFsbGVyIG1hcHBpbmdzIChlLmcuIDJNQiwg
NEtCKS4gU28gaXQgd2lsbCBiZSBuZWNlc3NhcnkgdG8gaGF2ZQ0KPiBtZW1vcnkgaW4gdGhlIGJv
b3QgYWxsb2NhdG9yIGVhcmxpZXIuDQo+IA0KPiBPbmx5IGZyZWUgbWVtb3J5IChlLmcuIG5vdCBy
ZXNlcnZlZCBvciBtb2R1bGVzKSBjYW4gYmUgYWRkZWQgdG8gdGhlIGJvb3QNCj4gYWxsb2NhdG9y
LiBJdCBtaWdodCBiZSBwb3NzaWJsZSB0aGF0IHNvbWUgcmVnaW9ucyAoaW5jbHVkaW5nIHRoZSBm
aXJzdA0KPiBvbmUpIHdpbGwgaGF2ZSBubyBmcmVlIG1lbW9yeS4NCj4gDQo+IFNvIHdlIG5lZWQg
dG8gYWRkIGFsbCB0aGUgZnJlZSBtZW1vcnkgdG8gdGhlIGJvb3QgYWxsb2NhdG9yIGZpcnN0DQo+
IGFuZCB0aGVuIGFkZCBkbyB0aGUgbWFwcGluZ3MuDQo+IA0KPiBQb3B1bGF0aW5nIHRoZSBib290
IGFsbG9jYXRvciBpcyBuZWFybHkgdGhlIHNhbWUgYmV0d2VlbiBhcm0zMiBhbmQNCj4gYXJtNjQu
IFRoZSBvbmx5IGRpZmZlcmVuY2UgaXMgb24gdGhlIGZvcm1lciB3ZSBuZWVkIHRvIGV4Y2x1ZGUg
dGhlDQo+IHhlbmhlYXAgZm9yIHRoZSBib290IGFsbG9jYXRvci4gR2F0ZSB0aGUgZGlmZmVyZW5j
ZSB3aXRoIENPTkZJR19BUk1fMzINCj4gc28gdGhlIGNvZGUgYmUgcmUtdXNlZCBvbiBhcm02NC4N
Cj4gDQo+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8amdyYWxsQGFtYXpvbi5jb20+DQo+
IA0KDQpIaSBKdWxpZW4sDQoNClNlZW1zIG9rIHRvIG1lIQ0KDQpSZXZpZXdlZC1ieTogTHVjYSBG
YW5jZWxsdSA8bHVjYS5mYW5jZWxsdUBhcm0uY29tPg0KDQpJ4oCZdmUgYWxzbyB0ZXN0ZWQgb24g
YXJtNjQgcGF0Y2hlcyB1bnRpbCB0aGlzIG9uZSBhbmQgbm8gcHJvYmxlbS4NCg0KVGVzdGVkLWJ5
OiBMdWNhIEZhbmNlbGx1IDxsdWNhLmZhbmNlbGx1QGFybS5jb20+DQoNCg0K

