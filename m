Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A1C767CBC
	for <lists+xen-devel@lfdr.de>; Sat, 29 Jul 2023 09:21:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571649.895996 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPeFg-0004Sl-LG; Sat, 29 Jul 2023 07:20:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571649.895996; Sat, 29 Jul 2023 07:20:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPeFg-0004QF-HU; Sat, 29 Jul 2023 07:20:36 +0000
Received: by outflank-mailman (input) for mailman id 571649;
 Sat, 29 Jul 2023 07:20:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iOEa=DP=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1qPeFf-0004Q9-Ej
 for xen-devel@lists.xenproject.org; Sat, 29 Jul 2023 07:20:35 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2060d.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::60d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 65acf673-2de0-11ee-8613-37d641c3527e;
 Sat, 29 Jul 2023 09:20:31 +0200 (CEST)
Received: from AS4P191CA0008.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:5d5::19)
 by DB5PR08MB9997.eurprd08.prod.outlook.com (2603:10a6:10:4a2::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Sat, 29 Jul
 2023 07:20:26 +0000
Received: from AM7EUR03FT053.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:5d5:cafe::38) by AS4P191CA0008.outlook.office365.com
 (2603:10a6:20b:5d5::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29 via Frontend
 Transport; Sat, 29 Jul 2023 07:20:26 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT053.mail.protection.outlook.com (100.127.140.202) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6631.29 via Frontend Transport; Sat, 29 Jul 2023 07:20:25 +0000
Received: ("Tessian outbound f1e964b3a9be:v145");
 Sat, 29 Jul 2023 07:20:25 +0000
Received: from 0692f4d17dec.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4B14785D-0D2F-4C19-806F-1E4E12787D31.1; 
 Sat, 29 Jul 2023 07:19:12 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0692f4d17dec.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Sat, 29 Jul 2023 07:19:12 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by DBBPR08MB5996.eurprd08.prod.outlook.com (2603:10a6:10:201::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Sat, 29 Jul
 2023 07:19:09 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::4c7d:6a1:e742:3b1a]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::4c7d:6a1:e742:3b1a%4]) with mapi id 15.20.6631.026; Sat, 29 Jul 2023
 07:19:09 +0000
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
X-Inumbo-ID: 65acf673-2de0-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AmocA8nxFIKUDHH9u0C1YwEW2P8RPX6bl8AbK62wCI4=;
 b=VgZQL7SNgzUVTclXTdR7ut3QtXsCOWVFLiZODQ0wwKVRbNqEI2S7YAeuljBUx5faoDbszZvsvzETzR//+joFKUCE/VDj2hReyTvF7MniynK4/Z1127tZwIpAoLVEY6kP2C+M4Ml9NguICPFImBmZIx95yYEoaHeRm0L2wQlKCB8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2cf2075a04edad71
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LI9DYK5wTy//a7JIQ/vVfE9TUob8Tj33luBiSRoNc06bzaX2BMaPOt8CnO90qOUEAGfFzNIScP0iqBfax654XQSiR1ax5omUgjItg7lQX9oXk+r7bPAqNsk79/NAzxqPWtHoJi7ucyNFpvIejUNO0tNEsZcu7GCeu/k+1hsbcostYiBnIH+VUptjqllrwFnbu+AzgXoEf+MmJvZFOAOkjro3XG570YVqTANn/PesuE9VczGC4werBB4IWloy4p3KaaX3Y71PwiNBv2tfX4DLrReurxvubdW712dZokoHqrumH0HWnvzQZoryOLft60+HZ/+7e0RhOGu9IjKXxd7x8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AmocA8nxFIKUDHH9u0C1YwEW2P8RPX6bl8AbK62wCI4=;
 b=TEyA49npT1tJAJccVxAyU3KqdEJuQT8qPbXz18gUGo8PQOcoXo2oi/XyzSXYtIN2m6INgmAiJebbYpTtynDzgt4EufVOKsDAF6sWVF9eipAwe3yDOYTMTQRmMaP11yK/8+PVPPZKr4iLHpFTeFrfHKLd9JVv2W0VC7aPAo/E0bqB7RANTNMF5OGRCSopGygfWUS8hhxcdnd7AILIhiVbDbzsjUG7QBsPE9/mVnNgLyoFjbnWc8oeBNrTLaW5RJy7tWjHicjg0cfjb4RI9EvuZPzSRk2AqQnAh5cn8VbOQ4kT3QIZ7LbN7M1mRiB5KaLySoGuilwxTzHldaZBbydOkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AmocA8nxFIKUDHH9u0C1YwEW2P8RPX6bl8AbK62wCI4=;
 b=VgZQL7SNgzUVTclXTdR7ut3QtXsCOWVFLiZODQ0wwKVRbNqEI2S7YAeuljBUx5faoDbszZvsvzETzR//+joFKUCE/VDj2hReyTvF7MniynK4/Z1127tZwIpAoLVEY6kP2C+M4Ml9NguICPFImBmZIx95yYEoaHeRm0L2wQlKCB8=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Wei Liu
	<wl@xen.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Subject: Re: [RFC PATCH 0/5] clang-format for Xen
Thread-Topic: [RFC PATCH 0/5] clang-format for Xen
Thread-Index: AQHZwSsi+9CDC2ydc0GfW83JpXFIW6/P5YuAgABx/QA=
Date: Sat, 29 Jul 2023 07:19:08 +0000
Message-ID: <F35FF142-6F0B-4140-A9A9-52840E9E55A9@arm.com>
References: <20230728081144.4124309-1-luca.fancellu@arm.com>
 <alpine.DEB.2.22.394.2307281716100.3118466@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2307281716100.3118466@ubuntu-linux-20-04-desktop>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|DBBPR08MB5996:EE_|AM7EUR03FT053:EE_|DB5PR08MB9997:EE_
X-MS-Office365-Filtering-Correlation-Id: 856448fd-d9ae-4b81-1aec-08db90044782
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Sf/YVNikqC+ZfVSh4XalASoJwCLax+yhZIUmutDBiihT2uKYa4+2sxLCID+o/6/z9UfpimvI+NJtRYmwZB7gJdbwquQ91C53u24P9XxwWlP1oxCYuwdt6UybiYq+m3icJ1D8RQ9Ah1Amszr51daShYDnHLoQP0t4DLWnWZeL+5Zj5KId5nU4n+o/JmczeIEbSOr+dvj1aokfyRGluObDG/7PhMqce4eRh6KYhZGDKomUVFko998v5P2HsuOa35bxOd4KiVitWFcMDwhdGs4DIFbnzLjxD3LX/JA2jVWFRhgE8B3dbhrZIQgv6YbF437UAHn57eeGD46DKSrbKhQNyVveVCxKyB+mQwXJJ3NpyZb5V5iTIcLSdnkV4uboUsTgPPRj6Q4JB2bbSV3PxMxKebTL6hR1ByfSg8Xt3sBxqQhaIgpLbtx4JIttucov9Enx14wRZuErETlNtW/M3TJFIG8pusU34p3/40G1iDuzYcpbhWOVdi3TVAtAaZU4B85Bpi8D+MDDitQ5wPiXuDgMHUeq7KUtrb7kP30aU2kp5uEcLMr4Q8cn/OKFzr1EV2LOtVJ9VcSkbLGcak0UZu9iC5N2piWXAc2JRwP8EJU9Z1IoDD8BkQIwV2n4xknZ2obzV3eVR4ONfp3HLYInzjZmYg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(376002)(39860400002)(396003)(366004)(451199021)(186003)(54906003)(6486002)(6512007)(478600001)(6916009)(83380400001)(38070700005)(86362001)(33656002)(36756003)(4326008)(66446008)(2906002)(71200400001)(6506007)(66476007)(53546011)(2616005)(26005)(316002)(64756008)(66946007)(38100700002)(66556008)(122000001)(76116006)(91956017)(41300700001)(8936002)(8676002)(5660300002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <5FC7D8EE56C2154FBD9B30EE46D7CC23@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB5996
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6c61c0d1-ac7f-4922-a875-08db900419cd
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zeiF+PxUA3bIhdZ56URRLwwwje4FXt+rS39ZutTvwHKq2kKx3zYeVFJ+PK5vKRkl8CdUCR2YOzZLr4oxHmlftfYn/RF1ddT1+5lV+6bEscRQlayXGN/UL/9zmw3R6rGKO+FgZ2Xu5sOpat3ILXMttMqLcsTL2cs8lmqw5uA6gWM0EcyYyruKP39E78DU0LwlHymGeYAeIlJntqNZLFviB/y1lrEPBLpwxfb83Ur/InNl+t23wW8bAd8ttHYZ8ZDe3vtftgNRyv7V6jZh5+9dYcCuZkR3CbmN+qz6V5xcBJ6GohtjzuDqih06KhP5r9G4Vr7dJvOViwhdJhose+S2HAz6qtXuK6bpBt7DtFUkkbMMGrfLe090EgGmHx4g1iNPxB4KZ21jyebvCm9318zgh/73fwzCYT9GwpKKrjpRm9tuhk1dKPB1LsrcMHCKlfFtwc1RdsXVDZUZSkmeucgysHk1ERniijDdA8j4ve73F6nYufM0krgIDnL0b+z+ZeKEgeCHDzVeAwGSDlJRs+d+r97Wg9pIptgFLvPnOUQu6nBYZ+7QAPDUZgGXu6pMBXsMN940vMALAv+PxWO0JChGtqDhiWUB3mnD7fImhKhgUJH6qMkIR5z1APlP5V6JqfBNzp1FTmuWQHZ+n5Ln5pMsj/jAIX7BojtC1tDfvmvMIYWr3qY39RuSEmP7TTzpZeMA+v999wHrF/4LWmzOaWap/WRwW74vAW13r7QMBCCTswY=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(39850400004)(376002)(346002)(396003)(136003)(82310400008)(451199021)(36840700001)(40470700004)(46966006)(2906002)(41300700001)(316002)(86362001)(40460700003)(8676002)(6862004)(8936002)(33656002)(36756003)(40480700001)(5660300002)(336012)(356005)(81166007)(186003)(2616005)(54906003)(53546011)(82740400003)(478600001)(6486002)(107886003)(6506007)(6512007)(26005)(47076005)(36860700001)(70586007)(70206006)(4326008)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2023 07:20:25.6253
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 856448fd-d9ae-4b81-1aec-08db90044782
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR08MB9997

DQoNCj4gT24gMjkgSnVsIDIwMjMsIGF0IDAxOjMwLCBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFi
ZWxsaW5pQGtlcm5lbC5vcmc+IHdyb3RlOg0KPiANCj4gT24gRnJpLCAyOCBKdWwgMjAyMywgTHVj
YSBGYW5jZWxsdSB3cm90ZToNCj4+ICMjIEludHJvZHVjdGlvbiAjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjDQo+PiANCj4+IElu
IHRoaXMgc2VyaWUsIEkgd291bGQgbGlrZSB0byBnZXQgZmVlZGJhY2tzIG9uIHRoZSBvdXRwdXQg
Z2VuZXJhdGVkIGJ5IHRoZQ0KPj4gY29uZmlndXJhdGlvbiBvZiBjbGFuZy1mb3JtYXQsIHVuZm9y
dHVuYXRlbHkgd2UgY2FuJ3QgdXNlIG9ubHkgY2xhbmctZm9ybWF0LCBidXQNCj4+IHdlIG5lZWQg
dG8gY2FsbCBpdCB1c2luZyBhIHdyYXBwZXIsIGJlY2F1c2Ugd2UgbmVlZCB0aGUgaW5mb3JtYXRp
b24gb2Ygd2hhdA0KPj4gZmlsZXMgbmVlZCB0byBiZSBleGNsdWRlZCBmcm9tIHRoZSB0b29sLg0K
Pj4gDQo+PiBBbm90aGVyIHJlYXNvbiBpcyB0aGF0IGNsYW5nLWZvcm1hdCBoYXMgc29tZSBsaW1p
dGF0aW9uIHdoZW4gZm9ybWF0dGluZyBhc20oKQ0KPj4gaW5zdHJ1Y3Rpb24gYW5kIG1vc3Qgb2Yg
dGhlIHRpbWUgaXQgZm9ybWF0IHRoZW0gaW4gYSB2ZXJ5IHVnbHkgd2F5IG9yIGl0IGJyZWFrcw0K
Pj4gdGhlIGNvZGUgZm9yIGV4YW1wbGUgcmVtb3Zpbmcgc3BhY2VzIHRoYXQgd2VyZSB0aGVyZSBm
b3IgYSByZWFzb24gKEkgZG9uJ3QgdGhpbmsNCj4+IGl0J3MgYSB0b29sIHRvIGZvcm1hdCBhc20p
LCBzbyBpbiB0aGUgd3JhcHBlciBzY3JpcHQgd2UgcHJvdGVjdCBhbGwgYXNtKCkNCj4+IGludm9j
YXRpb24gb3IgbWFjcm9zIHdoZXJlIHRoZXJlIGFyZSBhc20oKSBpbnZvY2F0aW9uIHdpdGggaW4t
Y29kZSBjb21tZW50cyB0aGF0DQo+PiBzdG9wcyBjbGFuZy1mb3JtYXQgdG8gYWN0IG9uIHRoYXQg
c2VjdGlvbjoNCj4+IA0KPj4gLyogY2xhbmctZm9ybWF0IG9mZiAqL3NlY3Rpb24vKiBjbGFuZy1m
b3JtYXQgb24gKi8NCj4+IA0KPj4gSSd2ZSByZWFkIHRoZSBwYXN0IHRocmVhZHMgYWJvdXQgdGhl
IGJyYXZlIHBlb3BsZSB3aG8gZGFyZWQgdG8gdHJ5IHRvIGludHJvZHVjZQ0KPj4gY2xhbmctZm9y
bWF0IGZvciB0aGUgeGVuIGNvZGViYXNlLCBzb21lIG9mIHRoZW0gZnJvbSA1IHllYXJzIGFnbywg
dHdvIHBvaW50cw0KPj4gd2VyZSBjbGVhcjogMSkgZ290byBsYWJlbCBuZWVkcyB0byBiZSBpbmRl
bnRlZCBhbmQgMikgZG8td2hpbGUgbG9vcHMgaGF2ZSB0aGUNCj4+IGJyYWtldCBpbiB0aGUgc2Ft
ZSBsaW5lLg0KPj4gV2hpbGUgcG9pbnQgMSkgd2FzIHF1aXRlIGEgYmxvY2tlciwgaXQgc2VlbWQg
dG8gbWUgdGhhdCBwb2ludCAyKSB3YXMgbGVzcw0KPj4gY29udHJvdmVyc2lhbCB0byBiZSBjaGFu
Z2VkIGluIHRoZSBYZW4gY29kZXN0eWxlLCBzbyB0aGUgY3VycmVudCB3cmFwcGVyIHNjcmlwdA0K
Pj4gaGFuZGxlcyBvbmx5IHRoZSBwb2ludCAxICh3aGljaCBpcyBlYXN5KSwgdGhlIHBvaW50IDIg
Y2FuIGJlIG1vcmUgdHJpY2t5IHRvDQo+PiBoYW5kbGUuDQoNCkhpIFN0ZWZhbm8sDQoNCnRoYW5r
IHlvdSBmb3IgdGFraW5nIHRoZSB0aW1lIHRvIHRyeSB0aGUgY2hhbmdlcy4NCg0KPiANCj4gQXJl
IHRoZXNlIHRoZSBvbmx5IDIgcG9pbnRzIHRvIGRpc2N1c3M/DQoNClByb2JhYmx5IG5vdCwgdGhl
IGlkZWEgd2l0aCB0aGlzIHNlcmllIGlzIHRvIGhhdmUgdGhlIG1haW50YWluZXJzIHRvIGxvb2sg
aW50bw0KdGhlIGNoYW5nZXMgYW5kIHNwb3QgdGhpbmdzIHRoYXQgYXJlIG5vdCBncmVhdCwgc28g
dGhhdCB3ZSBjYW4gbGlzdCB0aGVtIGFuZA0KY2hlY2sgaWYgdGhlIGJlaGF2aW91ciBpcyBmaXhh
YmxlIG9yIG5vdCwgYW5kIGJhc2VkIG9uIHRoYXQgY29tZSB1cCB3aXRoDQphbiBhY3Rpb24gb3Ig
YSBkZWNpc2lvbi4NCg0KPiANCj4gSSB0aGluayBhcyBhIG5leHQgc3RlcCBpdCB3b3VsZCBiZSB3
b3J0aCBsaXN0aW5nIGFsbCB0aGUgY29kZSBzdHlsZQ0KPiBkZWNpc2lvbiBwb2ludHMgd2UgbmVl
ZCB0byBtYWtlIGFzIGEgZ3JvdXAgYW5kIHRoZW4gZ28gb3ZlciB0aGVtIGR1cmluZw0KPiBvbmUg
b2YgdGhlIG5leHQgY2FsbHMuDQoNClllcywgbXkgaWRlYSB3YXMgdG8gaGF2ZSBzb21lIHJvdW5k
cyBvbiB0aGUgbGFzdCBwYXRjaCB3aGVyZSBbbm90IHNwZWNpZmllZF0NCm9wdGlvbnMgYXJlIGxp
c3RlZCwgYmFzaWNhbGx5IGFsbCBvZiB0aGVpciB2YWx1ZSB3ZXJlIGNob3NlbiBieSBtZSBqdXN0
IGd1ZXNzaW5nDQpmcm9tIGEgYnJpZWYgY29kZWJhc2UgaW5zcGVjdGlvbiwgSSBleHBlY3QgdGhl
c2UgdmFsdWVzIHRvIGJlIGFncmVlZCBhbmQgKGhvcGVmdWxseSkNCndlIGNhbiBmb3JtYWxpc2Ug
c29tZSBvZiB0aGVtIHdpdGggYSByZXF1aXJlbWVudCBpbiB0aGUgQ09ESU5HX1NUWUxFLCBzbyB0
aGF0DQp3ZSBjYW4gaGF2ZSBmaW5hbGx5IGEgZG9jdW1lbnQgYW5kIHRoZSBpbXBsZW1lbnRhdGlv
biBvZiB0aGF0IGJ5IGEgdG9vbCwgd2hpY2ggY2FuDQpiZSBjaGFuZ2VkIGluIHRoZSBmdXR1cmUg
aWYgd2UgZmluZCBzb21lIG1vcmUgcG93ZXJmdWwgb3IgcmVsaWFibGUgdG9vbC4NCg0KPiANCj4g
DQo+PiAjIyBUaGUgY2xhbmctZm9ybWF0IGNvbmZpZ3VyYXRpb24gIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIw0KPj4gDQo+PiBJbiBteSBjbGFuZy1mb3JtYXQg
Y29uZmlndXJhdGlvbiBJJ3ZlIHRha2VuIGluc3BpcmF0aW9uIGZyb20gRVBBTSdzIHdvcmssIHRo
ZW4NCj4+IGZyb20gdGhlIGNvbmZpZ3VyYXRpb24gaW4gTGludXggYW5kIGZpbmFsbHkgZnJvbSB0
aGUgY2xhbmctZm9ybWF0IG1hbnVhbCwgdG8gdHJ5DQo+PiB0byBwcm9kdWNlIGEgY29tcHJlaGVu
c2l2ZSBjb25maWd1cmF0aW9uLg0KPj4gDQo+PiBFdmVyeSBjb25maWd1cmF0aW9uIHBhcmFtZXRl
ciBoYXMgb24gdG9wIGEgY29tbWVudCB3aXRoIHRoZSBkZXNjcmlwdGlvbiBhbmQNCj4+IHdoZW4g
aXQgd2FzIHN1cHBvcnRlZCwgZmluYWxseSBJJ3ZlIGFkZGVkIGFsc28gYSBbbm90IHNwZWNpZmll
ZF0gaWYgdGhhdA0KPj4gYmVoYXZpb3IgaXMgbm90IGNsZWFybHkgc3BlY2lmaWVkIGluIHRoZSBY
ZW4gY29kaW5nIHN0eWxlLCBJJ3ZlIGRvbmUgdGhhdCBzbw0KPj4gd2UgY291bGQgZGlzY3VzcyBh
Ym91dCBhZGRpbmcgbW9yZSBzcGVjaWZpY2F0aW9uIGluIG91ciBDT0RJTkdfU1RZTEUuDQo+PiBF
dmVyeSBjb21tZW50IGNhbiBiZSBzdHJpcHBlZCBvdXQgaW4gdGhlIGZpbmFsIHJlbGVhc2Ugb2Yg
dGhlIGZpbGUsIGJ1dCBJIHRoaW5rDQo+PiB0aGF0IG5vdyB0aGV5IGFyZSB1c2VmdWwgZm9yIHRo
ZSBkaXNjdXNzaW9uLg0KPj4gDQo+PiBUaGUgbWluaW11bSBjbGFuZy1mb3JtYXQgdmVyc2lvbiBm
b3IgdGhlIGZpbGUgaXMgMTUsIG15IHVidW50dSAyMi4wNCBjb21lcyB3aXRoDQo+PiBpdCwgd2Ug
Y2FuIHJlYXNvbiBpZiBpdCdzIHRvbyBoaWdoLCBvciBpZiB3ZSBjb3VsZCBhbHNvIHVzZSB0aGUg
bGF0ZXN0IHZlcnNpb24NCj4+IG1heWJlIHNoaXBwZWQgaW5zaWRlIGEgZG9ja2VyIGltYWdlLg0K
Pj4gDQo+PiBGb3IgZXZlcnkgW25vdCBzcGVjaWZpZWRdIGJlaGF2aW9yLCBJJ3ZlIHRyaWVkIHRv
IGd1ZXNzIGl0IGZyb20gdGhlIGNvZGViYXNlLA0KPj4gSSd2ZSBzZWVuIHRoYXQgYWxzbyBpbiB0
aGF0IGNhc2UgaXQncyBub3QgZWFzeSBhcyB0aGVyZSBpcyAoc29tZXRpbWVzKSBsb3cNCj4+IGNv
bnNpc3RlbmN5IGJldHdlZW4gbW9kdWxlcywgc28gd2UgY2FuIGRpc2N1c3Mgb24gZXZlcnkgY29u
ZmlndXJhYmxlLg0KPj4gDQo+PiBXb3J0aCB0byBtZW50aW9uLCB0aGUgcHVibGljIGhlYWRlciBh
cmUgYWxsIGV4Y2x1ZGVkIGZyb20gdGhlIGZvcm1hdCB0b29sLA0KPj4gYmVjYXVzZSBmb3JtYXR0
aW5nIHRoZW0gYnJlYWtzIHRoZSBidWlsZCBvbiBYODYsIGJlY2F1c2UgdGhlcmUgYXJlIHNjcmlw
dHMgZm9yDQo+PiBhdXRvLWdlbmVyYXRpb24gdGhhdCBkb24ndCBoYW5kbGUgdGhlIGZvcm1hdHRl
ZCBoZWFkZXJzLCBJIGRpZG4ndCBpbnZlc3RpZ2F0ZQ0KPj4gb24gaXQsIG1heWJlIGl0IGNhbiBi
ZSBhZGRlZCBhcyB0ZWNobmljYWwgZGVidC4NCj4+IA0KPj4gU28gSSd2ZSB0cmllZCBidWlsZGlu
ZyBhcm0zMiwgYXJtNjQgYW5kIHg4Nl82NCB3aXRoIHRoZSBmb3JtYXR0ZWQgb3V0cHV0IGFuZA0K
Pj4gdGhleSBidWlsZCwgSSd2ZSB1c2VkIFlvY3RvIGZvciB0aGF0Lg0KPj4gDQo+PiAjIyBIb3cg
dG8gdHJ5IGl0PyAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIw0KPj4gDQo+PiBTbyBob3cgdG8gZ2VuZXJhdGUgZXZlcnl0aGluZz8g
SnVzdCBpbnZva2UgdGhlIGNvZGVzdHlsZS5weSBzY3JpcHQgd2l0aG91dA0KPj4gcGFyYW1ldGVy
IGFuZCBpdCB3aWxsIGZvcm1hdCBldmVyeSAuYyBhbmQgLmggZmlsZSBpbiB0aGUgaHlwZXJ2aXNv
ciBjb2RlYmFzZS4NCj4+IA0KPj4gLi94ZW4vc2NyaXB0cy9jb2Rlc3R5bGUucHkNCj4+IA0KPj4g
T3B0aW9uYWxseSB5b3UgY2FuIGFsc28gcGFzcyBvbmUgb3IgbW9yZSByZWxhdGl2ZSBwYXRoIGZy
b20gdGhlIGZvbGRlciB5b3UgYXJlDQo+PiBpbnZva2luZyB0aGUgc2NyaXB0IGFuZCBpdCB3aWxs
IGZvcm1hdCBvbmx5IHRoZW0uDQo+IA0KPiBUaGFua3MgZm9yIHRoZSBhbWF6aW5nIHdvcmsgTHVj
YS4gSSBkaWQgYXMgZGVzY3JpYmVkIGFib3ZlIGFuZCBnZW5lcmF0ZQ0KPiBhIDlNQiBkaWZmIHBh
dGNoIDotKQ0KPiANCj4gSSBzY3JvbGxlZCB0aHJvdWdoIGl0IGFuZCBtb3N0IG9mIGl0IG1ha2Vz
IHNlbnNlIGJ1dCBhIGZldyB0aGluZ3MgbG9vaw0KPiB3ZWlyZC4gQ29weS9wYXN0aW5nIHRoZW0g
aGVyZSBpbmRpdmlkdWFsbHkgbm90IHRvIGFkZCBhIDlNQiBkaWZmIGluDQo+IGF0dGFjaG1lbnQu
DQoNCjopIHRoYXTigJlzIGdyZWF0ISBUaGlzIGlzIGV4YWN0bHkgdGhlIGZlZWRiYWNrIEnigJlt
IGxvb2tpbmcgZm9yIQ0KDQo+IA0KPj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9hY3BpL2Jv
b3QuYyBiL3hlbi9hcmNoL2FybS9hY3BpL2Jvb3QuYw0KPj4gaW5kZXggZGI1MDg1ZTE1ZC4uMzk4
ZGVhOTJlNiAxMDA2NDQNCj4+IC0tLSBhL3hlbi9hcmNoL2FybS9hY3BpL2Jvb3QuYw0KPj4gKysr
IGIveGVuL2FyY2gvYXJtL2FjcGkvYm9vdC5jDQo+PiBAQCAtNTIsNyArNTIsNyBAQCBhY3BpX21h
cF9naWNfY3B1X2ludGVyZmFjZShzdHJ1Y3QgYWNwaV9tYWR0X2dlbmVyaWNfaW50ZXJydXB0ICpw
cm9jZXNzb3IpDQo+PiB7DQo+PiAgICAgaW50IGk7DQo+PiAgICAgaW50IHJjOw0KPj4gLSAgICB1
NjQgbXBpZHIgPSBwcm9jZXNzb3ItPmFybV9tcGlkciAmIE1QSURSX0hXSURfTUFTSzsNCj4+ICsg
ICAgdTY0IG1waWRyICAgID0gcHJvY2Vzc29yLT5hcm1fbXBpZHIgJiBNUElEUl9IV0lEX01BU0s7
DQo+PiAgICAgYm9vbCBlbmFibGVkID0gcHJvY2Vzc29yLT5mbGFncyAmIEFDUElfTUFEVF9FTkFC
TEVEOw0KPj4gDQo+PiAgICAgaWYgKCBtcGlkciA9PSBNUElEUl9JTlZBTElEICkNCj4gDQo+IERv
IHdlIG5lZWQgdGhlID0gYWxpZ25tZW50Pw0KPiANCj4gDQo+IEl0IGlzIGNhdXNpbmcgb3RoZXIg
d2VpcmQgbG9va2luZyBjaGFuZ2VzOg0KPiANCj4+ICAgcnNkcCA9IChzdHJ1Y3QgYWNwaV90YWJs
ZV9yc2RwICopYmFzZV9wdHI7DQo+PiAgICAvKiBSZXBsYWNlIHhzZHRfcGh5c2ljYWxfYWRkcmVz
cyAqLw0KPj4gICAgcnNkcC0+eHNkdF9waHlzaWNhbF9hZGRyZXNzID0gdGJsX2FkZFtUQkxfWFNE
VF0uc3RhcnQ7DQo+PiAtICAgIGNoZWNrc3VtID0gYWNwaV90Yl9jaGVja3N1bShBQ1BJX0NBU1Rf
UFRSKHU4LCByc2RwKSwgdGFibGVfc2l6ZSk7DQo+PiArICAgIGNoZWNrc3VtICAgICAgID0gYWNw
aV90Yl9jaGVja3N1bShBQ1BJX0NBU1RfUFRSKHU4LCByc2RwKSwgdGFibGVfc2l6ZSk7DQo+PiAg
ICByc2RwLT5jaGVja3N1bSA9IHJzZHAtPmNoZWNrc3VtIC0gY2hlY2tzdW07DQo+IA0KPiBbLi4u
XQ0KPiANCj4+ICNpZmRlZiBDT05GSUdfTVVMVElCT09UDQo+PiAtaW50IF9faW5pdCB4c21fbXVs
dGlib290X3BvbGljeV9pbml0KA0KPj4gLSAgICB1bnNpZ25lZCBsb25nICptb2R1bGVfbWFwLCBj
b25zdCBtdWx0aWJvb3RfaW5mb190ICptYmksDQo+PiAtICAgIHZvaWQgKipwb2xpY3lfYnVmZmVy
LCBzaXplX3QgKnBvbGljeV9zaXplKQ0KPj4gK2ludCBfX2luaXQgeHNtX211bHRpYm9vdF9wb2xp
Y3lfaW5pdCh1bnNpZ25lZCBsb25nICptb2R1bGVfbWFwLA0KPj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBjb25zdCBtdWx0aWJvb3RfaW5mb190ICptYmksDQo+PiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHZvaWQgKipwb2xpY3lfYnVmZmVyLCBz
aXplX3QgKnBvbGljeV9zaXplKQ0KPj4gew0KPj4gICAgIGludCBpOw0KPj4gICAgIG1vZHVsZV90
ICptb2QgPSAobW9kdWxlX3QgKilfX3ZhKG1iaS0+bW9kc19hZGRyKTsNCj4+IC0gICAgaW50IHJj
ID0gMDsNCj4+ICsgICAgaW50IHJjICAgICAgICA9IDA7DQo+PiAgICAgdTMyICpfcG9saWN5X3N0
YXJ0Ow0KPj4gICAgIHVuc2lnbmVkIGxvbmcgX3BvbGljeV9sZW47DQo+IA0KPiBDYW4gd2UgdGFr
ZSB0aGUgPSBhbGlnbm1lbnQgb3V0PyBXaXRob3V0IGl0LCBtb3N0IG90aGVyIHRoaW5ncyBsb29r
DQo+IGdvb2QsIGF0IGxlYXN0IGF0IGZpcnN0IGdsYW5jZS4NCg0KQWxlamFuZHJvIHdhcyB0aGUg
Zmlyc3Qgb25lIHRvIHBvaW50IHRoYXQgb3V0LCB3ZSBjYW4gZGlzYWJsZSBpdCBieSB0aGUgb3B0
aW9uDQpBbGlnbkNvbnNlY3V0aXZlQXNzaWdubWVudHMuDQoNCj4gDQo+IEFsc28gdGhpcyBsb29r
cyBhIGJpdCB1bm5lY2Vzc2FyeSwgYnV0IG5vdCBhIGJsb2NrZXIgZm9yIG1lOg0KPiANCj4+IEBA
IC05MDgsOCArODk1LDcgQEAgc3RhdGljIGludCBfX2luaXQgZWZpX2NoZWNrX2R0X2Jvb3QoY29u
c3QgRUZJX0xPQURFRF9JTUFHRSAqbG9hZGVkX2ltYWdlKQ0KPj4gfQ0KPj4gDQo+PiBzdGF0aWMg
dm9pZCBfX2luaXQgZWZpX2FyY2hfY3B1KHZvaWQpDQo+PiAteyAgIA0KPj4gLX0gICAgICAgDQo+
PiAre30NCj4+IA0KDQpBbHNvIHRoaXMgb25lIGNhbiBiZSBjaGFuZ2VkIEkgdGhpbmsgYnkgdHdl
YWtpbmcgQWxsb3dTaG9ydEZ1bmN0aW9uc09uQVNpbmdsZUxpbmUsDQpzbyB0aGF0IHdlIGNhbiBo
YXZlIGp1c3Q6IA0KDQpzdGF0aWMgdm9pZCBfX2luaXQgZWZpX2FyY2hfY3B1KHZvaWQpIHt9DQoN
Cj4gDQo+IEkgdGhpbmsgd2Ugc2hvdWxkOg0KPiAtIGlkZW50aWZ5ICJ3ZWlyZCIgY2hhbmdlcyBs
aWtlIHRoZSBhYm92ZQ0KPiAtIGRpc2N1c3MgdGhlbSBhcyBhIGdyb3VwLCBsaWtlIHdlIGRvIHdp
dGggTUlTUkEsIGFuZCBkZWNpZGUgaG93IHRvDQo+ICBhZGRyZXNzIHRoZW0NCj4gLSBvbmNlIGV2
ZXJ5b25lIGlzIGhhcHB5IHdpdGggdGhlIG5ldyBmb3JtYXQsIGNvbWUgdXAgd2l0aCBhIHBsYW4g
b24gaG93DQo+ICB0byBtZXJnZSBhIDlNQiBwYXRjaA0KDQpZZXMsIGNsZWFybHkgd2Ugd2lsbCBo
YXZlIHRoZSByZWxlYXNlIHNvb24sIHNvIHVudGlsIHRoYXQsIEkgY2FuIGNvbGxlY3QgYWxsIHRo
ZSBmZWVkYmFja3MgYW5kDQpvcmdhbmlzZSB0aGVtIHNvIHRoYXQgYWZ0ZXIgdGhlIHJlbGVhc2Us
IHdoZW4gcGVvcGxlIGhhdmUgbW9yZSB0aW1lLCB3ZSBjYW4gZGlzY3VzcyBldmVyeQ0KcG9pbnQg
YW5kIGlkZW50aWZ5IHByaW9yaXRpZXMgYW5kIG91dHN0YW5kaW5nIGlzc3Vlcy4NCg0KDQpDaGVl
cnMsDQpMdWNhDQoNCg0KDQoNCg==

