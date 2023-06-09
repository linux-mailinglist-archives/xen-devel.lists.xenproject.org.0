Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69984729578
	for <lists+xen-devel@lfdr.de>; Fri,  9 Jun 2023 11:37:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.545756.852297 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7YZ2-000619-5g; Fri, 09 Jun 2023 09:37:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 545756.852297; Fri, 09 Jun 2023 09:37:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7YZ2-0005yW-2y; Fri, 09 Jun 2023 09:37:48 +0000
Received: by outflank-mailman (input) for mailman id 545756;
 Fri, 09 Jun 2023 09:37:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1HUa=B5=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1q7YZ0-0005NO-6l
 for xen-devel@lists.xenproject.org; Fri, 09 Jun 2023 09:37:46 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20609.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::609])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 48664e18-06a9-11ee-b232-6b7b168915f2;
 Fri, 09 Jun 2023 11:37:43 +0200 (CEST)
Received: from AS9PR06CA0158.eurprd06.prod.outlook.com (2603:10a6:20b:45c::16)
 by AM9PR08MB5908.eurprd08.prod.outlook.com (2603:10a6:20b:283::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Fri, 9 Jun
 2023 09:37:40 +0000
Received: from AM7EUR03FT043.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:45c:cafe::ab) by AS9PR06CA0158.outlook.office365.com
 (2603:10a6:20b:45c::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.26 via Frontend
 Transport; Fri, 9 Jun 2023 09:37:40 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT043.mail.protection.outlook.com (100.127.140.160) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6477.27 via Frontend Transport; Fri, 9 Jun 2023 09:37:39 +0000
Received: ("Tessian outbound 5154e9d36775:v136");
 Fri, 09 Jun 2023 09:37:39 +0000
Received: from 9bd14464ad0e.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0584B5DC-7FAE-4DDA-A809-5E543390C4C9.1; 
 Fri, 09 Jun 2023 09:37:32 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9bd14464ad0e.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 09 Jun 2023 09:37:32 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by AS2PR08MB9740.eurprd08.prod.outlook.com (2603:10a6:20b:604::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.36; Fri, 9 Jun
 2023 09:37:30 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::ed0b:5730:a1f9:577b]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::ed0b:5730:a1f9:577b%4]) with mapi id 15.20.6455.037; Fri, 9 Jun 2023
 09:37:30 +0000
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
X-Inumbo-ID: 48664e18-06a9-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CuU3SgvnK7MDsOwCCGmAlrRRrtahHvYoYwml7YKnp9Q=;
 b=wdKPg03pqiHl07jAGMd7+HPDz3AuKd3vxXOArGRGOPOsg7N1CobYCSp8yN90mzvZQf3KWamLzelG6tlWP3wdFuTC0heI36vP8MaTMDxgp+rKhVzBnpYL8FiL6VcpBARH4bts8bHLRS36tQExUviOM6L5XkxaXTB+ocjWB7jT22o=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3fdb2f82a6b878fb
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X07rhNoe6lHgrQ/THlSE2rlkiCeMy2y4q29k/Obud9Y6rwwkvDD/Rjjv57YzGF1qJFWLrfptzLxFLIAO+MpbBSdVlEQPkro+uPB/Ex8A9k4FYZDdRwob5DV4QpykKM9YleChanHXLt3ssr9xIiJV1U+KYk8irqcGDwTwEsf3LaMPgLwcHxmfnqbjcr4jp8B2VlY1JmIHzL2R9vKX7Tnz+usSDX0ykcNglOAQD7HkEj9ZiBCMkP4TUDdB65OsXrxSUBb72TOniqEcV/og3VDntlGxOLCYrdjSEBBJPh71XUkTmzcbezIGrZOi49NfdNOUmJzSnAkNBCbYvfPgmRarlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CuU3SgvnK7MDsOwCCGmAlrRRrtahHvYoYwml7YKnp9Q=;
 b=a64D9PBt+2a35od7fQla0gzkkTbHmmYFjWSlcpWuD3PbarUhFOiohgyi/V2kLmFMUpWpXN1mUHzRA9zIoPXSGP5Sx90lxLQhqnm+gUnAw0j8HyDptny2+5+RS+byHFejLHzXPo4eFFNeyvoA9poAnDo1R/S9am0txvfy5XyC00UdVgLn+83tc/vjGFxAJrof5RxyBGIBeB3G3707Ml664NMbwOXS3AfI1k0TlAN4L382TBil6uyQzTpOTG6uCVyu4eIHarmVCY5u44QrTIZ8eZnICYudoIitli+XjFdgxvzQr/EQidOc2hESooAYkYxIfS+WDD9Sp+GccSaHYLvgfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CuU3SgvnK7MDsOwCCGmAlrRRrtahHvYoYwml7YKnp9Q=;
 b=wdKPg03pqiHl07jAGMd7+HPDz3AuKd3vxXOArGRGOPOsg7N1CobYCSp8yN90mzvZQf3KWamLzelG6tlWP3wdFuTC0heI36vP8MaTMDxgp+rKhVzBnpYL8FiL6VcpBARH4bts8bHLRS36tQExUviOM6L5XkxaXTB+ocjWB7jT22o=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] tools: Move MASK_INSR to common-macros.h
Thread-Topic: [PATCH] tools: Move MASK_INSR to common-macros.h
Thread-Index: AQHZmjBTIpVZOkjuH06O82Z2wJSQ2a+CNhYAgAABfoA=
Date: Fri, 9 Jun 2023 09:37:27 +0000
Message-ID: <53C45F71-F746-44A0-B100-18C1A302CD1F@arm.com>
References: <20230608174014.2500954-1-andrew.cooper3@citrix.com>
 <d9162ee1-a6a7-96ce-652e-54eb30a3db78@suse.com>
In-Reply-To: <d9162ee1-a6a7-96ce-652e-54eb30a3db78@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|AS2PR08MB9740:EE_|AM7EUR03FT043:EE_|AM9PR08MB5908:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a053ed4-4f0c-4e56-187b-08db68cd2ad9
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 /KZVT0vQCzH1IJe+bTaKs5v8UbBL0MFiDDcPrA1dDaBKmZ5FWvcIvFJv9Jnpx7Q9ztOYcB7fKTqq4+ZozH8hjZsxwRDNXO5GVvixn8e0D5b528A9KT96jXbwg8CAujawOnhIa8pjn8VfqJzt/8nfpAcTDLpsm2rcPX1KpmJQcwM8dIsoZFuW29Dk2x7RmFV3Q+cQU0X+2PnelYYqVbMg3yxxXe4o0M5kN+CDt2LWmdavWHa3xfzLwb+7ci6LnLsJD2JGkpgkuSYhqY3Kz+k9IGZlldQd2sWuurE2NGi7FijsDpXiYynWdMXp0ihGY+pCvDJyQvmj7zL9sPuqkVMVuP55SURs2qFAljCw0vBycuSvEyTPuZ5S9jhFuY8756GtrNXOy60wb7dHr2uM8s60sUfee+RRdjgP2KOAyeX+32qMAgTVhEFbJ1dqPzDBbMSJ5g612YpRAwpNbdUlAaIGoSAqqbSmDr9Yl/K8bhZAQixEUtA2T+2j+Pc2gnsD0oFswfdm3iYXvkqoo9TWhKlYcxV5nZquFaVBsgU5bCth/cR6LI1XAuR+8PWCuKu66egBdUo2ZlM6RUQDpaCXL+DHC1Dzp/QWQOlYdNZEXgtbjorZPGF0qoZQ2A7Gp4gIOvBgSH8JVmunG1Ox/gDKrdMSn/u6Jstv1H2MuEBH9GKN0EPcagpP+k0dw+Fw1A2XJBjC02Ldeyc1KCSHmlryObbuZA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(376002)(366004)(396003)(136003)(451199021)(316002)(6486002)(41300700001)(2616005)(83380400001)(86362001)(26005)(6512007)(53546011)(38070700005)(186003)(6506007)(2906002)(33656002)(122000001)(38100700002)(5660300002)(8936002)(36756003)(8676002)(91956017)(66946007)(76116006)(54906003)(478600001)(71200400001)(6916009)(4326008)(6666004)(66556008)(66476007)(64756008)(66446008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <3B160A89762E26438CC4841E092AB605@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9740
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e59b0772-7032-497c-d5f4-08db68cd239d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Tv6gGhVeVl4SFZqsaEiitcttVmfADQtk44gPjtCPhDscyeREEu+S2JroO2Sq501KcAb9hvKup7nhH7ykpNKLRITb5S6SF8Nz3KeeVTzf7/zy+HUSC/QckH5iB8hoGKrEKatmq2QnIhnRpANV6Rw3lnFpzttHxksXhhQKIyEVJTY019m8qjwEJ40k2zhyFrpGHa8kwdaxbvUoUx6z+ob5T34gd1vCEqDtrZqAYGbqh5ey52fNpr2S4hKnHC6BTqSvlrms6A0fjbcQqfpthCjIeRPI0nOoF9ubaJJ4dy0ttjYQ8YmTtwlO9zpWbzW3wbHFgV1ZZDYchfyX1URhGX0W4ogJWoT+CeDJRpx6xw1ftt3zbn6cwfuW7mMfl6H+Ol4dbGc4QRZS6eaGKwsLqmYoe0+HeJesUkaw1fx4qm3BN4jgPHTREgC6yjYWuTR/mKw2AplG1Pu+FortflkF/tPf6ag4vb6Pk/m5iV88/pR+RifF38jnyCvX99CtMOHk/YN3hfORH+EXT+IkZrupex0K5Lp2s0SZfc+/j/3drRzatFWvG4y3DsHt2xPuND7k4NGaI8R2QnXsmVweFjf50W5mdEivTUm6GukIdzR0X62sSV3d6GWwb+7QEKn2/FGUDrcDFK8rftIS4AJ8Z/upYT8W9hFtSrtpZVAmogKjMSa28guWDlvOgeGTOVf2Y4R3edICkVJXHlxAF7H/7hw+sw88mgMRjjOYJow1ADfi65yYrWKJy3tYcSjZ/SO81ON1HbH/
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(136003)(396003)(376002)(451199021)(40470700004)(36840700001)(46966006)(40460700003)(47076005)(83380400001)(336012)(40480700001)(82740400003)(33656002)(8676002)(8936002)(6486002)(6862004)(81166007)(41300700001)(316002)(70206006)(356005)(70586007)(5660300002)(4326008)(86362001)(478600001)(2906002)(6666004)(36756003)(82310400005)(36860700001)(54906003)(6506007)(26005)(6512007)(186003)(2616005)(53546011);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2023 09:37:39.8887
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a053ed4-4f0c-4e56-187b-08db68cd2ad9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB5908

DQoNCj4gT24gOSBKdW4gMjAyMywgYXQgMTA6MzEsIEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT4gd3JvdGU6DQo+IA0KPiBPbiAwOC4wNi4yMDIzIDE5OjQwLCBBbmRyZXcgQ29vcGVyIHdy
b3RlOg0KPj4gTUFTS19FWFRSKCkgYW5kIE1BU0tfSU5TUigpIGFyZSBhIG1hdGNoaW5nIHBhaXIu
ICBLZWVwIHRoZW0gdG9nZXRoZXIuDQo+IA0KPiBSaWdodCwgdGhhdCdzIG9uZSB0aGluZyB3aGlj
aCBzaG91bGQgaGF2ZSBiZWVuIGRvbmUgcmlnaHQgYXdheS4NCj4gVGhlIG90aGVyIGlzIHRoYXQg
Ym90aCBtYWNyb3Mgc2hvdWxkIGhhdmUgYmVlbiBwdXJnZWQgZnJvbQ0KPiB0b29scy90ZXN0cy94
ODZfZW11bGF0b3IveDg2LWVtdWxhdGUuaCAod2hpY2ggaW5jbHVkZXMNCj4geGVuLXRvb2xzL2Nv
bW1vbi1tYWNyb3MuaCkuIEx1Y2E/DQoNCm1tbSByaWdodCBJ4oCZdmUgbWlzc2VkIHRoYXQsIGlm
IEFuZHJldyBjYW4gaGFuZGxlIGl0IGluIHRoaXMgcGF0Y2ggSeKAmW0gb2ssIGlmIHlvdQ0Kd2Fu
dCBtZSB0byBzZW5kIGEgcGF0Y2ggSSBjYW4gZG8gaXQNCg0KPiANCj4gSmFuDQo+IA0KPj4gRml4
ZXM6IDU2YTdhYWExNmJmZSAoInRvb2xzOiBhZGQgcGh5c2luZm8gYXJjaF9jYXBhYmlsaXRpZXMg
aGFuZGxpbmcgZm9yIEFybSIpDQo+PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRy
ZXcuY29vcGVyM0BjaXRyaXguY29tPg0KPj4gLS0tDQo+PiBDQzogQW50aG9ueSBQRVJBUkQgPGFu
dGhvbnkucGVyYXJkQGNpdHJpeC5jb20+DQo+PiBDQzogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1
c2UuY29tPg0KPj4gQ0M6IEx1Y2EgRmFuY2VsbHUgPGx1Y2EuZmFuY2VsbHVAYXJtLmNvbT4NCj4+
IC0tLQ0KPj4gdG9vbHMvaW5jbHVkZS94ZW4tdG9vbHMvY29tbW9uLW1hY3Jvcy5oIHwgMSArDQo+
PiB0b29scy9saWJzL2xpZ2h0L2xpYnhsX2ludGVybmFsLmggICAgICAgfCAyIC0tDQo+PiAyIGZp
bGVzIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygtKQ0KPj4gDQo+PiBkaWZm
IC0tZ2l0IGEvdG9vbHMvaW5jbHVkZS94ZW4tdG9vbHMvY29tbW9uLW1hY3Jvcy5oIGIvdG9vbHMv
aW5jbHVkZS94ZW4tdG9vbHMvY29tbW9uLW1hY3Jvcy5oDQo+PiBpbmRleCBkNTNiODgxODI1NjAu
LjE2ODY5MWJlMGU5MyAxMDA2NDQNCj4+IC0tLSBhL3Rvb2xzL2luY2x1ZGUveGVuLXRvb2xzL2Nv
bW1vbi1tYWNyb3MuaA0KPj4gKysrIGIvdG9vbHMvaW5jbHVkZS94ZW4tdG9vbHMvY29tbW9uLW1h
Y3Jvcy5oDQo+PiBAQCAtNzMsNiArNzMsNyBAQA0KPj4gI2VuZGlmDQo+PiANCj4+ICNkZWZpbmUg
TUFTS19FWFRSKHYsIG0pICgoKHYpICYgKG0pKSAvICgobSkgJiAtKG0pKSkNCj4+ICsjZGVmaW5l
IE1BU0tfSU5TUih2LCBtKSAoKCh2KSAqICgobSkgJiAtKG0pKSkgJiAobSkpDQo+PiANCj4+ICNp
Zm5kZWYgX19tdXN0X2NoZWNrDQo+PiAjZGVmaW5lIF9fbXVzdF9jaGVjayBfX2F0dHJpYnV0ZV9f
KChfX3dhcm5fdW51c2VkX3Jlc3VsdF9fKSkNCj4+IGRpZmYgLS1naXQgYS90b29scy9saWJzL2xp
Z2h0L2xpYnhsX2ludGVybmFsLmggYi90b29scy9saWJzL2xpZ2h0L2xpYnhsX2ludGVybmFsLmgN
Cj4+IGluZGV4IDhhYmEzZTEzODkwOS4uNjFmNGZlMWRlYzU1IDEwMDY0NA0KPj4gLS0tIGEvdG9v
bHMvbGlicy9saWdodC9saWJ4bF9pbnRlcm5hbC5oDQo+PiArKysgYi90b29scy9saWJzL2xpZ2h0
L2xpYnhsX2ludGVybmFsLmgNCj4+IEBAIC0xMzIsOCArMTMyLDYgQEANCj4+IA0KPj4gI2RlZmlu
ZSBESVZfUk9VTkRVUChuLCBkKSAoKChuKSArIChkKSAtIDEpIC8gKGQpKQ0KPj4gDQo+PiAtI2Rl
ZmluZSBNQVNLX0lOU1IodiwgbSkgKCgodikgKiAoKG0pICYgLShtKSkpICYgKG0pKQ0KPj4gLQ0K
Pj4gI2RlZmluZSBMSUJYTF9fTE9HR0lOR19FTkFCTEVEDQo+PiANCj4+ICNpZmRlZiBMSUJYTF9f
TE9HR0lOR19FTkFCTEVEDQo+IA0KDQo=

