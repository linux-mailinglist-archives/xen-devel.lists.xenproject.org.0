Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B268F6E39BF
	for <lists+xen-devel@lfdr.de>; Sun, 16 Apr 2023 17:19:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.521600.810398 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1po49z-0004vG-2s; Sun, 16 Apr 2023 15:19:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 521600.810398; Sun, 16 Apr 2023 15:19:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1po49y-0004sp-Vs; Sun, 16 Apr 2023 15:19:22 +0000
Received: by outflank-mailman (input) for mailman id 521600;
 Sun, 16 Apr 2023 15:19:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9kJX=AH=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1po49x-0004sj-59
 for xen-devel@lists.xenproject.org; Sun, 16 Apr 2023 15:19:21 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2073.outbound.protection.outlook.com [40.107.20.73])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0e013fae-dc6a-11ed-8611-37d641c3527e;
 Sun, 16 Apr 2023 17:19:18 +0200 (CEST)
Received: from AS9PR05CA0150.eurprd05.prod.outlook.com (2603:10a6:20b:497::32)
 by VE1PR08MB5615.eurprd08.prod.outlook.com (2603:10a6:800:1b3::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Sun, 16 Apr
 2023 15:18:37 +0000
Received: from AM7EUR03FT032.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:497:cafe::be) by AS9PR05CA0150.outlook.office365.com
 (2603:10a6:20b:497::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.44 via Frontend
 Transport; Sun, 16 Apr 2023 15:18:37 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT032.mail.protection.outlook.com (100.127.140.65) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6298.32 via Frontend Transport; Sun, 16 Apr 2023 15:18:37 +0000
Received: ("Tessian outbound 945aec65ec65:v136");
 Sun, 16 Apr 2023 15:18:37 +0000
Received: from f4fda34f82d2.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9DFCA22E-3E6D-4BD1-9D7E-F537EFE1ED5E.1; 
 Sun, 16 Apr 2023 15:18:31 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f4fda34f82d2.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Sun, 16 Apr 2023 15:18:31 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DB5PR08MB10047.eurprd08.prod.outlook.com (2603:10a6:10:4a0::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.49; Sun, 16 Apr
 2023 15:18:22 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6%7]) with mapi id 15.20.6298.030; Sun, 16 Apr 2023
 15:18:22 +0000
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
X-Inumbo-ID: 0e013fae-dc6a-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pWziZRY5p+euNPnr/zI7SOY687bH/aXy+6j954Y+z9U=;
 b=S9Vw3TNcYc9HWL4V2ZgDhAzK6PMl1IVC6znzJyfKJU7YTwekHJ+abpNSI2i5Ku8kd+9CSJh2eXShO+oCyVDDxLyUN1Dik5XaKx4tEgM98ETHNrV0+nLbwhJi3hpnGIC4GMJovFK7fqMmKDFxnbOqPlJ2cGvd4WbSCaOjsIkUPm4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YIj3fWxm+kTJFp4EUqXJHOpOGwO6vdauWaOr4GL5iy2dNUu52q1t0fLDX85zRhBrThHRRkNq20gbYAhRN8zEBm0TfRyIjLqtIN1Z4M1rfhGoa5rARlLvwCNAgosagyIj/vYGn2uzTMKuCJeqH8MvcnUfOpGmIXXXEoCrqUQDfW3InonGyGE1hp3hjvKsJuFY8ze9FamXldYgg3eJEe2Ghf0UNo+pSCkPQzVaSGvb8MVNix4lj3nMzat4MZg8JHmK6NY8K7Nd/+dHuQl94C+RsS3ZRA4+NaL9YSxLAyPIb8JmKQdL3ZPWsKSRDzDGhF4i3gEHLFLi2MHwR81RklRKhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pWziZRY5p+euNPnr/zI7SOY687bH/aXy+6j954Y+z9U=;
 b=Z1zEGNEF9pDKNKjU1QnDm2ad6gSRQTKTwJzMeSRb3GXFI1e8nfQuZ6vZW5sgyVsz2349h6lme+q0+JMLS2zcoZU03PXzQZlsneS3VallG00wTHjmaxyJZNhLxp9iA8WIlM4SbTbpV+yMgLKKAr8PXQIXnWwOgem1vCgageBkHkZgyKsFyf/5rSYfVGtnT6rp6jFwYe0MfZVUHRYiT9iWWgC1LL0K0r1kl3o5oijOqw5XAp5IgUSsrB999uOsHIVFzTTVgxIiF9E9Hm5HNK4u9MZ9WluCYEjn//0mfHX/Q5AJZnS5QUCAPtCOL1h58Gh6TGFpnwvG03UOomciKUMlnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pWziZRY5p+euNPnr/zI7SOY687bH/aXy+6j954Y+z9U=;
 b=S9Vw3TNcYc9HWL4V2ZgDhAzK6PMl1IVC6znzJyfKJU7YTwekHJ+abpNSI2i5Ku8kd+9CSJh2eXShO+oCyVDDxLyUN1Dik5XaKx4tEgM98ETHNrV0+nLbwhJi3hpnGIC4GMJovFK7fqMmKDFxnbOqPlJ2cGvd4WbSCaOjsIkUPm4=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH v3 0/4] P2M improvements for Arm
Thread-Topic: [PATCH v3 0/4] P2M improvements for Arm
Thread-Index: AQHZYUTg6MW26c27J0WSUxzcC1g70a8uKIyAgAABGqA=
Date: Sun, 16 Apr 2023 15:18:21 +0000
Message-ID:
 <AS8PR08MB7991E697DBC2E12129FAA97C929F9@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230328071334.2098429-1-Henry.Wang@arm.com>
 <7595ba77-899f-6aa2-a65c-64a0b34553ac@xen.org>
In-Reply-To: <7595ba77-899f-6aa2-a65c-64a0b34553ac@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 48E74DBE5D959B42900B25A3AA2AA4A3.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DB5PR08MB10047:EE_|AM7EUR03FT032:EE_|VE1PR08MB5615:EE_
X-MS-Office365-Filtering-Correlation-Id: 376ffb82-502e-4611-c7f1-08db3e8dda12
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 wqWTLhs0e8kjHxiB+FWA7RV3oHiHAck1mDwZI3iefHSfOH1JXDNyjblIOlvYgeRyKSWSwuxRIEq5L16L1pIvkFxkCwhg89Ypfjb60rciJyWZrG8yQakXA6N7pKiA7DeUYb5RJTGS43cQP73WimMPEsC7Di18vxo5+vs11POyX/R0y2j/pDt2Dy0hCvmWY+kKRE7qOj0pN1HH6gxQX1xQOfj98gAMiKNW4r8TfQ/BxV8x5Xjx2ylr2cyFCp2/LUfKBcUL/IV/Cd4up8ARoM0dTpMnjMR2yGG2bFaB+QUx2ysvTNd4+/rmeOo3deA3t6YAfRAcK4OmDXbveAvZtq36PxsS4/yDQrLlSjRQZ7oApJUN2BS2NFbJ4wtl88eSNaLa/3h+unV94Y947qKtKmBc0M+/4P6ZOlhKiSR7BqKxLrdzmHjUXEwXu/v/DDVtyb+yZsifKt/epgOyJfhFsKNi2DBFQqw6+22+/7ZMktE5e6Kv08h7kjNskxBWznm9WCq2cyBBtmclmai0UhsZwVNTFd8/6koh4fegFBr7tQLcnK8ZrPScm+dV6rkBH5Ns2QpSWPAADg3oZqF/XDnc183U1Z1S+1ITSoyKzKiV4/vHMI0=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(39850400004)(366004)(396003)(346002)(136003)(451199021)(41300700001)(38100700002)(122000001)(8676002)(4326008)(66446008)(64756008)(66556008)(5660300002)(86362001)(33656002)(55016003)(8936002)(52536014)(66946007)(66476007)(38070700005)(76116006)(4744005)(186003)(110136005)(7696005)(83380400001)(316002)(966005)(478600001)(2906002)(54906003)(6506007)(26005)(9686003)(71200400001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR08MB10047
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	987187f9-a26a-4e63-1bc9-08db3e8dd09f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JGUgkmXmhJ3KzRKz0H1kNOjgcHIgcTlSsM3s8KdIHjnLxwdasR07Q4ITrIkKh7khrQKhcXlb6X2NDaIVwcSh+IRMXfBOsUaLrwBlrPFIkeT8DrE6rlvJScwRuTDqcX2AxozBgQhEUnJYR7htsCxmGwW7es0E5E1eLGVP8KHGHGXYUAj/tLxpaiJnpND/RDA0+RMwwctgjybaMtSpFC7nY7Cu3yNX81rJ5R8zm8RE3fI0OMy0QANDciLqng1qS2ydLl7VYmPUQG9cIy9/gd+H54IqDvE8ykSW3N0tWwHePPva/Ip+4rQa+t5wBoCuOKWZLwtKBL1bFW8IJOCST9neJ3MTqhas5EeaWkukzi6q5QLYdFBnNpbSPolVcMlDQueGnVZ89GFt3QyB1CIL55NiSKH1499ySy4eCYQvLwHbHnPGM0HIYaUqedNApCdtLWYlAi9icapWBATxJBrkiqT8fZHmUVib/z0V2fM4++4X5EI4zq012zhRzXgLF3nX3N3YVzNJgPuq+/LlXmdhvhUuLc6usYrdhzLWC9xYrS8oBzGRtYKcCFnz6Zb5m3mxNheMYAF0eqVLZi43K8ByIkWyrDyIKxUdhTphSxr2VhdrrxpEtxqxrFFzkfdbhKihI08+1ZjFLBMHEAr5jV7m6LxlF/EFW0GLv8RRDJA92NZ6IO0=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(39850400004)(396003)(136003)(346002)(376002)(451199021)(46966006)(36840700001)(966005)(7696005)(478600001)(86362001)(110136005)(55016003)(36860700001)(47076005)(336012)(83380400001)(33656002)(26005)(107886003)(40480700001)(186003)(6506007)(9686003)(82740400003)(82310400005)(81166007)(356005)(316002)(4326008)(70206006)(70586007)(4744005)(2906002)(8676002)(8936002)(5660300002)(52536014)(41300700001)(54906003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2023 15:18:37.2406
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 376ffb82-502e-4611-c7f1-08db3e8dda12
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5615

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjMgMC80XSBQ
Mk0gaW1wcm92ZW1lbnRzIGZvciBBcm0NCj4gDQo+IEhpIEhlbnJ5LA0KPiANCj4gPiBIZW5yeSBX
YW5nICg0KToNCj4gPiAgICB4ZW4vYXJtOiBSZWR1Y2UgcmVkdW5kYW50IGNsZWFyIHJvb3QgcGFn
ZXMgd2hlbiB0ZWFyZG93biBwMm0NCj4gPiAgICB4ZW4vYXJtOiBSZW5hbWUgdmdpY19jcHVfYmFz
ZSBhbmQgdmdpY19kaXN0X2Jhc2UgZm9yIG5ldyB2R0lDDQo+ID4gICAgeGVuL2FybTogRGVmZXIg
R0lDdjIgQ1BVIGludGVyZmFjZSBtYXBwaW5nIHVudGlsIHRoZSBmaXJzdCBhY2Nlc3MNCj4gPiAg
ICB4ZW4vYXJtOiBDbGVhbi11cCBpbiBwMm1faW5pdCgpIGFuZCBwMm1fZmluYWxfdGVhcmRvd24o
KQ0KPiANCj4gSSBoYXZlIGNvbW1pdHRlZCB0aGUgc2VyaWVzLg0KDQpNYW55IHRoYW5rcyBmb3Ig
dGhhdCEgQWxzbyB0aGFua3MgZm9yIHlvdXIgcmV2aWV3IGZvciB0aGUgc2VyaWVzLg0KDQpXaGls
ZSB5b3UgYXJlIGF0IHRoaXMsIEkgYW0gd29uZGVyaW5nIHdvdWxkIHlvdSBtaW5kIGFsc28gdGFr
aW5nIGEgbG9vaw0KYXQgWzFdIHNpbmNlIEkgYmVsaWV2ZSBJIGhhdmUgZml4ZWQgeW91ciBjb21t
ZW50cyB3aGljaCBjb3JyZWN0bHkgcG9pbnRlZA0Kb3V0IGFib3V0IHRoZSBmb3JtYXQgb2YgInBy
aW50ayBpbmZvIiBpbiB2MyBvZiB0aGF0IHNlcmllcy4NCg0KSWYgeW91IGhhdmUgbW9yZSBjb21t
ZW50cywgcGxlYXNlIGRvbid0IGhlc2l0YXRlIHRvIHJhaXNlIHRoZW0gYW5kIEkNCndpbGwgdGFr
ZSBjYXJlIG9mIHRoZW0gdG9tb3Jyb3cgOikpDQoNClRoYW5rcyENCg0KWzFdIGh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL3hlbi1kZXZlbC8yMDIzMDIwMTAyMTUxMy4zMzY4MzctMS1IZW5yeS5XYW5n
QGFybS5jb20vDQoNCktpbmQgcmVnYXJkcywNCkhlbnJ5DQoNCj4gDQo+IENoZWVycywNCj4gDQo+
IC0tDQo+IEp1bGllbiBHcmFsbA0K

