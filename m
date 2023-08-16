Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD0A77D7AC
	for <lists+xen-devel@lfdr.de>; Wed, 16 Aug 2023 03:30:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584161.914619 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qW5LB-0001zC-IM; Wed, 16 Aug 2023 01:28:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584161.914619; Wed, 16 Aug 2023 01:28:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qW5LB-0001wj-FA; Wed, 16 Aug 2023 01:28:53 +0000
Received: by outflank-mailman (input) for mailman id 584161;
 Wed, 16 Aug 2023 01:28:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vkqM=EB=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qW5LA-0001wd-3P
 for xen-devel@lists.xenproject.org; Wed, 16 Aug 2023 01:28:52 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0604.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::604])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 40b8784a-3bd4-11ee-8776-cb3800f73035;
 Wed, 16 Aug 2023 03:28:50 +0200 (CEST)
Received: from AS8P250CA0029.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:330::34)
 by AS8PR08MB8875.eurprd08.prod.outlook.com (2603:10a6:20b:5b7::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Wed, 16 Aug
 2023 01:28:45 +0000
Received: from AM7EUR03FT004.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:330:cafe::e2) by AS8P250CA0029.outlook.office365.com
 (2603:10a6:20b:330::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.33 via Frontend
 Transport; Wed, 16 Aug 2023 01:28:45 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT004.mail.protection.outlook.com (100.127.140.210) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.15 via Frontend Transport; Wed, 16 Aug 2023 01:28:44 +0000
Received: ("Tessian outbound b5a0f4347031:v175");
 Wed, 16 Aug 2023 01:28:43 +0000
Received: from 358d3427b9b7.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C7E71223-501D-43DE-A410-7BFDD63AA9F1.1; 
 Wed, 16 Aug 2023 01:28:01 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 358d3427b9b7.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 16 Aug 2023 01:28:01 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by PAVPR08MB9508.eurprd08.prod.outlook.com (2603:10a6:102:312::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.24; Wed, 16 Aug
 2023 01:27:59 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::7083:22dc:6b5f:5965]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::7083:22dc:6b5f:5965%7]) with mapi id 15.20.6678.025; Wed, 16 Aug 2023
 01:27:59 +0000
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
X-Inumbo-ID: 40b8784a-3bd4-11ee-8776-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7NL2aG1q3F3x9xcOyZD8o/B+s2DhSAUNDUgEjnxCSkQ=;
 b=AHAd71LjoE7mOTFZTL5txFgke8CrUTYQOx+HRt2uqzkZp7LdYavpMKO5uqgEBthxQFVlTRgdvBaJZSS906bQeSKSFNgSK1856Yk/26Xm1IXMoycTLCG2U6a/sR3xh/3uPcN+S6aWUPstuvuswia5FQKEETQRYx0edWd2FD1Sy/M=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2958f7cab5455f16
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ffxuhvZXdAesr6DRSQpEU0NJ8f0VbA3BxvSNlbtGLTVLBejALWNeIyCm8vOBNE+F3l6fD7Lh9s/LyZi8niZ2D3bYUFUG2S2mjtNGJ3EyF44zc9tFvqbI2Z9PRArKvdckN+SAQy90c325RNmTFRyfqPjWcBQSpo7Z5DnGTGNYtC/VklwDXsmgThFF4EtRNLUyxWEZL/xKiHJH6YmLGrLfB8Wdgj1Px+4tqjjVruRTLPB71jv3sd4gQRB3PU9H2kdrNoml8vTB00BYZs8RnVKfSUoTTQ/TDEcbjXrmiskCL+7/JjPBm4KyA+QC1hn7nmNzmNuxzHgGUubz0CZmfJFF7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7NL2aG1q3F3x9xcOyZD8o/B+s2DhSAUNDUgEjnxCSkQ=;
 b=ByPeHPnJOy1Z20c7rDgRNqzVxgpu29ig5i9A/dQ/2B6FNaExF8AsXsvMZlorYKGaH4WaBRAgRtDfhbeMh4x8tkxt/WgzOtx127e91/RHwgsr+SIg3puYveNncOC4m3F2oDVwiseGRG3VOKqmVJ9nGm+NsIOwxghlKwJUp18TMXd0g9QfnwWOzypUB+ri4jZJHo03istCvuTcV3p0vsnk1I1t/3eZ3BgKAOiFXwkzUJFsCoglSJPrbVvoNXUDSpAZpwj57xTU8frA8LHwfklHoDmvJ3q082DirKjLorouRhD3nuqcGbzx4Z6fVpMMA7FUrQAOHI4RhQNEVbnoAua9tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7NL2aG1q3F3x9xcOyZD8o/B+s2DhSAUNDUgEjnxCSkQ=;
 b=AHAd71LjoE7mOTFZTL5txFgke8CrUTYQOx+HRt2uqzkZp7LdYavpMKO5uqgEBthxQFVlTRgdvBaJZSS906bQeSKSFNgSK1856Yk/26Xm1IXMoycTLCG2U6a/sR3xh/3uPcN+S6aWUPstuvuswia5FQKEETQRYx0edWd2FD1Sy/M=
From: Henry Wang <Henry.Wang@arm.com>
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>
Subject: Re: [PATCH v2 2/2] fdt: make fdt handling reusable across arch
Thread-Topic: [PATCH v2 2/2] fdt: make fdt handling reusable across arch
Thread-Index: AQHZxfe0sdxLBCk0m0eqfbJm59//E6/ZhneQgAdlrQCAC0mnAA==
Date: Wed, 16 Aug 2023 01:27:58 +0000
Message-ID: <966AB2DE-450B-4A7B-95B1-74D68BEC2B84@arm.com>
References: <20230803104438.24720-1-dpsmith@apertussolutions.com>
 <20230803104438.24720-3-dpsmith@apertussolutions.com>
 <AS8PR08MB79912C0FD1E3B1AA5988175B9209A@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <90656f0f-0597-31ed-190e-d697e081d4b5@apertussolutions.com>
In-Reply-To: <90656f0f-0597-31ed-190e-d697e081d4b5@apertussolutions.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|PAVPR08MB9508:EE_|AM7EUR03FT004:EE_|AS8PR08MB8875:EE_
X-MS-Office365-Filtering-Correlation-Id: eb8b2252-b6cc-42ec-4bb1-08db9df8216d
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 t5dJ709JggCmzti4DzhAkIBQWGBYanC/IEy6Dir+dqKrQKfFI90nYEHy34FqqQMLM5413xgPOtRo78y1aljG1Lb0YI4csStqQBErP7eFn2NVfCGxqoKnpda4JkiO3UqIEoTe2tlA5ay5rVeTQkS53wFtzU2LrtKeMMjWrcifcOhQYq7woJe3nAoNrf9J3EkWxTOILoS/ciEz6PzeQFtk49Y5nc3nrEwBK5SKwGSDAQohYMmlE+N7S7INadEi6YabnSAylnaSH/rHX+4AVMTXxhL3KtcnKTjki12uCKQ6nITSllgOgK/bWmayxakhSFxHTSVN+Ivi0vvgw0qf/9vRMlWDH4zU8Acrv2Q69IpGprCHAEJD+XFL1rkPeVsnK8YpQNZ02tC+ALYooZabGpaT3cswNH6rCD9fRYEv1DpUoS9I0vOd6+UMqV/qChivB+dKl886o/Jd64turTgfnQmN5MUFSs6fJ17qw0N9pQv1t+fGtm3j446OS2CmUk7m191R0G4PM8QyZvCLlb7xNdSuLFPGj15ioFus3vM4YDRQh6jotDCv6B1LHpeebztpJZbY6BmQIbY9zp8m9YREOmUNFWASKXWrt6qMDyZMIfn+JwOEnZSdb9GPmNCAlfaZIKY1NmXwMzJuo6wcL+vYuIZ8Mg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(366004)(346002)(39860400002)(376002)(451199024)(186009)(1800799009)(5660300002)(66446008)(71200400001)(66556008)(66476007)(122000001)(6506007)(6512007)(2906002)(53546011)(38100700002)(54906003)(38070700005)(41300700001)(86362001)(478600001)(2616005)(316002)(26005)(8676002)(6486002)(33656002)(83380400001)(66946007)(36756003)(91956017)(76116006)(64756008)(6916009)(8936002)(4326008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <7905D5B131396446BB0CE464C8886589@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9508
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	37a16e75-c3b7-438a-73c2-08db9df8066c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	i4YttZ9TkGAQJHKWSqGJN3zVqGL42o7BTgtvTtuoYgMa9zDkKXCDKOiP4xmzofmLq3Pj2oczyxeQso/g2ClwojpcHw47akL5NTirjTezl5fZ0xJYSSkoYBijz3TH/0K5/c8LH2RL0XQIZWCZebhU5wxxQSi579L1L+frbv0rSjWg4iKZR6dDWpyqwoWJrK9/0oeyWFYMOxQCoKpnUoEjrGu1R4nMQaof5L1mj9y7oHRT9P4bBsPJY/1VcdawKcu1FFpxuDaVbkqYHrxAFCDbOGj2dsP2hA99mhrP1AHhYUFHlVcDAmJwSkhrLuBZJvo1x1zeub86XZtHvb1dM38QaqXUy5GYNyTMOqXUlqASJgSeczWAOcHCZFMl3h1UkCuV4iMtTELhL3Nxgz0TVlSBMOQLdpbv51sdnErBEMR9FMm8bO625up1Kf84FOboVI/tzzEHBxmVSgKjYRCjXpM8XQPDmZkoifPQ53dRRtGSNg7obMrY2EnLq0jtpWYTJwZgWFeFdc2sQi8MTe7I+phNfTPmRxaKHZhHjvRoHn+uH8OIjGcZdmpOatTAkjAxIShOkedEp8AkAkKW9vPsnj2mf1DJjwtOFJgz6NCVqGlevkGkGhoUt7lTaDvmnX5eZT3z5my4xZ/Mhen1+g8h2qtWONTRNFbY2UW20o4TjGXT82bs57LYnVNrWkJ+kQGE+pqdM81uuwLY/xK9Vhi9CXbXb1DMnPh30KZOimFMrzKokeg=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(346002)(39860400002)(136003)(396003)(451199024)(186009)(1800799009)(82310400011)(36840700001)(40470700004)(46966006)(478600001)(86362001)(6486002)(2616005)(36756003)(70586007)(356005)(6506007)(5660300002)(47076005)(70206006)(40460700003)(316002)(41300700001)(53546011)(36860700001)(26005)(81166007)(82740400003)(40480700001)(33656002)(83380400001)(336012)(54906003)(4326008)(6862004)(2906002)(8936002)(8676002)(6512007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2023 01:28:44.0849
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eb8b2252-b6cc-42ec-4bb1-08db9df8216d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8875

SGkgRGFuaWVsLA0KDQo+IE9uIEF1ZyA5LCAyMDIzLCBhdCAwNTowNSwgRGFuaWVsIFAuIFNtaXRo
IDxkcHNtaXRoQGFwZXJ0dXNzb2x1dGlvbnMuY29tPiB3cm90ZToNCj4gDQo+IE9uIDgvNC8yMyAw
MDoxMCwgSGVucnkgV2FuZyB3cm90ZToNCj4+IEhpIERhbmllbCwNCj4gDQo+IEhleSBIZW5yeSEN
Cj4gDQo+Pj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4+PiBTdWJqZWN0OiBbUEFUQ0gg
djIgMi8yXSBmZHQ6IG1ha2UgZmR0IGhhbmRsaW5nIHJldXNhYmxlIGFjcm9zcyBhcmNoDQo+Pj4g
DQo+Pj4gVGhpcyByZWZhY3RvcnMgcmV1c2FibGUgY29kZSBmcm9tIEFybSdzIGJvb3RmZHQuYyBh
bmQgZGV2aWNlLXRyZWUuaCB0aGF0IGlzDQo+Pj4gZ2VuZXJhbCBmZHQgaGFuZGxpbmcgY29kZS4g
IFRoZSBLY29uZmlnIHBhcmFtZXRlciBDT1JFX0RFVklDRV9UUkVFIGlzDQo+Pj4gaW50cm9kdWNl
ZCBmb3Igd2hlbiB0aGUgYWJpbGl0eSBvZiBwYXJzaW5nIERUQiBmaWxlcyBpcyBuZWVkZWQgYnkg
YSBjYXBhYmlsaXR5DQo+Pj4gc3VjaCBhcyBoeXBlcmxhdW5jaC4NCj4+PiANCj4+PiBTaWduZWQt
b2ZmLWJ5OiBEYW5pZWwgUC4gU21pdGggPGRwc21pdGhAYXBlcnR1c3NvbHV0aW9ucy5jb20+DQo+
PiBBcyBzYWlkIHllc3RlcmRheSwgSSB0ZXN0ZWQgdGhpcyBwYXRjaCBhbmQgY2FuIGNvbmZpcm0g
dGhpcyBwYXRjaCB3aWxsIG5vdA0KPj4gYnJlYWsgYW55IG9mIHRoZSBib2FyZHMgd2UgdXNlZCBm
b3Igb3VyIHRlc3RpbmcuIFNvDQo+PiBUZXN0ZWQtYnk6IEhlbnJ5IFdhbmcgPEhlbnJ5LldhbmdA
YXJtLmNvbT4NCj4gDQo+IFRoYW5rIHlvdXIgZm9yIHJ1bm5pbmcgaXQgdGhyb3VnaCB5b3VyIHRl
c3RzLg0KDQpNeSBwbGVhc3VyZS4NCg0KPiANCj4+IChCdXQgSSBzYXcgdGhlcmUgYXJlIHNvbWUg
Y29tbWVudHMgZnJvbSBNaWNoYWwgYW5kIEx1Y2EgYWJvdXQgdGhpcw0KPj4gcGF0Y2ggc28gSSB0
aGluayB0aGVzZSBjb21tZW50cyBuZWVkIHRvIGJlIGFkZHJlc3NlZCkNCj4gDQo+IFNvIGZhciB0
aGUgY2hhbmdlcyBhcmUgc3R5bGUgYW5kIGEgZmV3IG1lY2hhbmljYWwuIFdoaWxlIHVubGlrZWx5
IHRvIGNhdXNlIGEgZnVuY3Rpb25hbCBjaGFuZ2UgdGhhdCBjb3VsZCBicmVhaywgcHJvYmFibHkg
YmVzdCB0byBob2xkIG9mZiBhZGRpbmcgeW91ciBUYiBmb3Igbm93Lg0KDQpTb3JyeSBmb3IgdGhl
IGxhdGUgcmVzcG9uc2UsIHRoaXMgZW1haWwgc29tZWhvdyBmYWxsIHRocm91Z2ggdGhlIGNyYWNr
c+KApg0KSSBhbSBvayB0byByZXRhaW4gbXkgVC1ieSB0YWcgYXMgdGhlIGNvbW1lbnRzIGFyZSBv
bmx5IGFib3V0IHN0eWxlcyBhbmQgbWVjaGFuaWNhbA0KY2hhbmdlcy4NCg0KS2luZCByZWdhcmRz
LA0KSGVucnkNCg0KPiANCj4gdi9yDQo+IGRwcw0KPiANCg0K

