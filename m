Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5657949DD39
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jan 2022 10:03:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261341.452387 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD0gm-0001Jb-Sa; Thu, 27 Jan 2022 09:03:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261341.452387; Thu, 27 Jan 2022 09:03:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD0gm-0001HE-ON; Thu, 27 Jan 2022 09:03:32 +0000
Received: by outflank-mailman (input) for mailman id 261341;
 Thu, 27 Jan 2022 09:03:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xPLH=SL=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1nD0gl-0001H8-Dr
 for xen-devel@lists.xenproject.org; Thu, 27 Jan 2022 09:03:31 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on061b.outbound.protection.outlook.com
 [2a01:111:f400:fe0d::61b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id febfdf34-7f4f-11ec-8eb8-a37418f5ba1a;
 Thu, 27 Jan 2022 10:03:29 +0100 (CET)
Received: from DB6P193CA0024.EURP193.PROD.OUTLOOK.COM (2603:10a6:6:29::34) by
 AM4PR08MB2820.eurprd08.prod.outlook.com (2603:10a6:205:d::26) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4930.15; Thu, 27 Jan 2022 09:03:27 +0000
Received: from DB5EUR03FT029.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:29:cafe::5f) by DB6P193CA0024.outlook.office365.com
 (2603:10a6:6:29::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17 via Frontend
 Transport; Thu, 27 Jan 2022 09:03:27 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT029.mail.protection.outlook.com (10.152.20.131) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4930.15 via Frontend Transport; Thu, 27 Jan 2022 09:03:27 +0000
Received: ("Tessian outbound 18e50a6f0513:v113");
 Thu, 27 Jan 2022 09:03:27 +0000
Received: from 27336e28517c.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4D189A5B-7039-4E22-A903-8AFE01D0C4B0.1; 
 Thu, 27 Jan 2022 09:03:16 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 27336e28517c.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 27 Jan 2022 09:03:16 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by AM6PR08MB3750.eurprd08.prod.outlook.com (2603:10a6:20b:81::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.14; Thu, 27 Jan
 2022 09:03:14 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::4463:2795:6645:5dd0]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::4463:2795:6645:5dd0%7]) with mapi id 15.20.4909.017; Thu, 27 Jan 2022
 09:03:14 +0000
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
X-Inumbo-ID: febfdf34-7f4f-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=juXz+M71dQnfP5HVhsfEK2tSXWFozxA3q5U/+LaYu/0=;
 b=B1RRT80GsHcZ9ikFTVdr5iWu3MpIN2kJEtq/MhbA8i5OhP70c6snKSV0Wmv49KI4glwlhdoc6GfUDTQvYc96hsMnG1e54ZD+E3H/0k/Spbs7US+BmiQpBSiAOnj6O8OgQIXTD4YmcCK+s+SeP8s0CG2jNoBzoUZxaHBZtRFWBho=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hdhvwYZYrHLlKzLXTPQGk9LmWVStsz+7Nbt69QVjeqd7V3swBR89Aj7KowpFQlnp0oHbombk7saeVpM08gnpjOoMDmi4eCPE4yzRDU3qKAdKxxqdKcbCZ5Gdcmoh6mGnCnzfEKakAAMZQJQRXq9xoSZN0E4SInHMhWgyGzvC9/oDP4GWbidABeOQ7cKb1k56CHdVTB6tz14celr4Eo8VaMGVmj4XsPdtYjLVssclEH3UHRjLoRirIl2GQKESFDgWAmdF20AV9eeajdYOxgS3a7V+1+SjNelo1mexu0YoP820dghDMFR/bnfkSc+wDPvqh+qicoknnX0KhMn7ugJ06g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=juXz+M71dQnfP5HVhsfEK2tSXWFozxA3q5U/+LaYu/0=;
 b=bXM2ZPqKKePNFIxjBv5A0hDQu9DEb+5XIhyOX6/k1jAO3GAWM7x7JQS43CbkJ0pppci0Mw7Cb6AOk0DrGFweUkCu2mq8OMZUbh2T971SXcsxOd0WNuOkGUKUUrMcW1WfMSKgRgKcNkSQ1B55qCUyVnW7JF//PvraV3GGGN2fIfjuH7MI1zM0jevixxUxOBTbpHF1hb3qWUAgAEv3C3LL3JX6dBg11LCzsOL1sqpw6HghEzwLazBaDFVL2lbpK0LHqd9VYOt4fqwxvCh2LlvyuTHgSlHYJmk1twy5w+pVfBnUrxASrE94RRrPV+BSZ9QblRef7g/nGM0C5FaLZn9zYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=juXz+M71dQnfP5HVhsfEK2tSXWFozxA3q5U/+LaYu/0=;
 b=B1RRT80GsHcZ9ikFTVdr5iWu3MpIN2kJEtq/MhbA8i5OhP70c6snKSV0Wmv49KI4glwlhdoc6GfUDTQvYc96hsMnG1e54ZD+E3H/0k/Spbs7US+BmiQpBSiAOnj6O8OgQIXTD4YmcCK+s+SeP8s0CG2jNoBzoUZxaHBZtRFWBho=
From: Wei Chen <Wei.Chen@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>, "julien@xen.org"
	<julien@xen.org>
Subject: RE: [PATCH 12/37] xen/x86: decouple nodes_cover_memory from E820 map
Thread-Topic: [PATCH 12/37] xen/x86: decouple nodes_cover_memory from E820 map
Thread-Index: AQHXsHMWLK2Lk+nkCEuQGshEHTFFNqxzJoSAgAQcdmCAAAZJgIAADE6g
Date: Thu, 27 Jan 2022 09:03:13 +0000
Message-ID:
 <PAXPR08MB7420131F1D61587D251C05239E219@PAXPR08MB7420.eurprd08.prod.outlook.com>
References: <20210923120236.3692135-1-wei.chen@arm.com>
 <20210923120236.3692135-13-wei.chen@arm.com>
 <b6c16f31-b233-1493-aebb-716e087f5ca1@suse.com>
 <PAXPR08MB74209CAE2D594D22DFF14DDA9E219@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <d4bb30f9-92a4-47ef-05bd-0ae1dacb3642@suse.com>
In-Reply-To: <d4bb30f9-92a4-47ef-05bd-0ae1dacb3642@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: F908342D8DCD8C40932FF44E80B9E07A.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: e165d96f-c692-46bd-cc55-08d9e173e19e
x-ms-traffictypediagnostic:
	AM6PR08MB3750:EE_|DB5EUR03FT029:EE_|AM4PR08MB2820:EE_
X-Microsoft-Antispam-PRVS:
	<AM4PR08MB282070A0B1354957E14E878B9E219@AM4PR08MB2820.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:1775;OLM:1775;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 tQ7gIrOHOlWMy+DDEafIZvGHUVY/7kSKLIo8g1lEm3Ps5qjVqv8KgpdRvdgfUUm2H1Mu7kMty3vL3mQtFbMY418UZDDS7iHxZcX7KEFEWe8PrHipRWpGnZB9Kpb5uG9oM0DV7RDZsFPnCWjRU5J4mP1angkaL0dG0szMxAMyfc1kJ/bBakbCHrN880Y9nNgb2Jb+MXy0g31hnZEZnw76LS/8kZ+cEPOpnwu7O5MuKLB8L3gYGqQpSKj5NCiqnU3rcVWGfbaUgv8GwioXxy0XGNr35yRvQTGzCulJRc7nFMv+bCSrJo0RCmaaYkMierbJqMej1xT2utBCd9ETXfKucmfT82JIfw95zjwCIB9I2/cQSeJH+ZsbaUt04zLYCzLUA2Y3dDVkCN+nhVqMmfmg76IhVYLJ6rhe67RFAFw01qT6B84D+S2QNd0VPjFXMimXfofLGWjyGoysILh8DcPA2ww2Pex2CXwttwISUmKbtNdi+yTInODqnwdQo59S8jCyFhKFR1uDVyDhkOBAX1yO/1a710FLUpcO4FqzLzkrBqy4xBsjsofdINppOlYa/FE4Krv0d/62hmg8Jjhco6Q/1OBTBciKdNrU62G7eTwKl07b/Pwn6aM4ypd28eLcFN517opvX6vR8q5loJ4pTakjaFLrN5cgd1c7ygnIZZFo9Nt1bAKrBv2MbS5zGfDSm6Vbv5vAGuhdu/V/drT/V7lsaw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(508600001)(6916009)(55016003)(4326008)(26005)(33656002)(86362001)(122000001)(53546011)(52536014)(5660300002)(2906002)(8676002)(76116006)(7696005)(186003)(38070700005)(8936002)(66446008)(66556008)(66476007)(54906003)(6506007)(38100700002)(9686003)(64756008)(66946007)(83380400001)(316002)(71200400001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3750
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b92e5da8-e0fe-4f80-fb00-08d9e173d9dc
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2lVI/pqzQr4wNcXb1Xgq72LsiBWS5UtABPE8kr9/YANPuTy7wzbu6pZZlCIKmjjzKNWarFYMt9I9JzJVilVudFTKf+bdybRpdUry8AJO72qGU2F8j7DJovRJ4hXc5zV1GvIm25UJojEengOg9xfRQfsrmsDfQ1PbfownWra8PGXGdkvY/Nr2m3wO2DjbP2xzgvExSzz/TN8CKdvRiCYCg59+U3lF8mqZZvRbvQ7hoNT0wEnRJ+MZHYfjVm4FPGR7/hO1ybfp4MVwB81yQsRkLGK58pHhzqgnMW4LQxLmwlNLM1l2B/r8iDXoHPT0vvUhIBd11G3HF1/UDgmiMPhquTERH7qqU8Ev7jsETpQN6RZ5kTK2TmlIIB07n1ghkRnDDl9G7+KYDfG4XQJt6Wh/FeWE/Atqz8/9JEYcAMPDREHJXG9g59xwUTjnsLe96d94WerTbNq501iDYFss40CzpGE22cGcW8fVjHN2ZITMyXFGW1j5KXC08FqnA+0Ch/y+UYqPX1aKkavmNhkFIx4ZgVEw+flJpht02crQpzGWA6SryEWtVQ0+J3sHbhSkfoUCmgbiqbfXW7NY6WkOs9iZ1F5S6j/J9O1pQXWDioxcnZkDSvsG+Zn9oQtyvdCt6W282wE56xEBR9eSu9O5W2NH4sTo2/tN0dZlOcaSYYLHosoaYKAxDC8wCDzeGsHY945u
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(70586007)(82310400004)(70206006)(8676002)(6862004)(4326008)(33656002)(8936002)(5660300002)(336012)(52536014)(81166007)(55016003)(356005)(83380400001)(53546011)(7696005)(2906002)(6506007)(26005)(40460700003)(9686003)(54906003)(86362001)(186003)(508600001)(36860700001)(47076005)(316002)(20210929001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 09:03:27.2330
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e165d96f-c692-46bd-cc55-08d9e173e19e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR08MB2820

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU2VudDogMjAyMuW5tDHmnIgyN+aXpSAxNjowOQ0K
PiBUbzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+DQo+IENjOiBCZXJ0cmFuZCBNYXJxdWlz
IDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+OyB4ZW4tDQo+IGRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnOyBzc3RhYmVsbGluaUBrZXJuZWwub3JnOyBqdWxpZW5AeGVuLm9yZw0KPiBTdWJqZWN0
OiBSZTogW1BBVENIIDEyLzM3XSB4ZW4veDg2OiBkZWNvdXBsZSBub2Rlc19jb3Zlcl9tZW1vcnkg
ZnJvbSBFODIwDQo+IG1hcA0KPiANCj4gT24gMjcuMDEuMjAyMiAwOTowMywgV2VpIENoZW4gd3Jv
dGU6DQo+ID4+IEZyb206IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gPj4gU2Vu
dDogMjAyMuW5tDHmnIgyNeaXpSAwOjU5DQo+ID4+DQo+ID4+IE9uIDIzLjA5LjIwMjEgMTQ6MDIs
IFdlaSBDaGVuIHdyb3RlOg0KPiA+Pj4gV2Ugd2lsbCByZXVzZSBub2Rlc19jb3Zlcl9tZW1vcnkg
Zm9yIEFybSB0byBjaGVjayBpdHMgYm9vdG1lbQ0KPiA+Pj4gaW5mby4gU28gd2UgaW50cm9kdWNl
IHR3byBhcmNoIGhlbHBlcnMgdG8gZ2V0IG1lbW9yeSBtYXAncw0KPiA+Pj4gZW50cnkgbnVtYmVy
IGFuZCBzcGVjaWZpZWQgZW50cnkncyByYW5nZToNCj4gPj4+ICAgICBhcmNoX2dldF9tZW1vcnlf
YmFua19udW1iZXINCj4gPj4+ICAgICBhcmNoX2dldF9tZW1vcnlfYmFua19yYW5nZQ0KPiA+Pg0K
PiA+PiBJJ20gc29ycnksIGJ1dCBwZXJzb25hbGx5IEkgc2VlIG5vIHdheSBmb3IgeW91IHRvIGlu
dHJvZHVjZSB0aGUgdGVybQ0KPiA+PiAibWVtb3J5IGJhbmsiIGludG8geDg2IGNvZGUuDQo+ID4N
Cj4gPiBJbiBteSBsYXRlc3QgY2hhbmdlcywgSSBoYXZlIHVwZGF0ZWQgdGhlc2UgdHdvIGhlbHBl
cnMgdG86DQo+ID4gdWludDMyX3QgX19pbml0IGFyY2hfbWVtaW5mb19nZXRfbnJfYmFuayh2b2lk
KQ0KPiA+IF9faW5pdCBhcmNoX21lbWluZm9fZ2V0X3JhbV9iYW5rX3JhbmdlKC4uLikNCj4gPiBJ
IGFtIHNvcnJ5LCBJIGZvcmdvdCB0byBjaGFuZ2UgdGhlIGNvbW1pdCBsb2cgYWNjb3JkaW5nbHku
DQo+ID4gSSB3aWxsIHVwZGF0ZSBpdCBpbiBuZXh0IHZlcnNpb24uDQo+IA0KPiBJJ20gc29ycnkg
Zm9yIHRoZSBhbWJpZ3VpdHkgb2YgbXkgZWFybGllciByZXBseSwgYnV0IG15IG9iamVjdGlvbiB3
YXMNCj4gYWdhaW5zdCAiYmFuayIsIG5vdCAibWVtb3J5Ii4gQXMgYW4gYXNpZGUsIHlvdSBhbHNv
IGRvbid0IHdhbnQgdGhlDQoNCkhvdyBhYm91dCBhcmNoX21lbWluZm9fZ2V0X25yX21hcC8gYXJj
aF9tZW1pbmZvX2dldF9tYXBfcmFuZ2U/DQpJIGFtIHNvcnJ5LCBJIGFtIG5vdCB2ZXJ5IGZhbWls
aWFyIHdpdGggZTgyMCBtYXAsIGNvdWxkIHlvdQ0KZ2l2ZSBtZSBzb21lIHN1Z2dlc3Rpb25zPw0K
DQo+IGZ1bmN0aW9uIHJldHVybiAidWludDMyX3QiIC0gc2VlIC4vQ09ESU5HX1NUWUxFLg0KDQpP
Sy4NCg0KPiANCj4gSmFuDQoNCg==

