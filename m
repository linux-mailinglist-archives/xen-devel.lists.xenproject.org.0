Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B2A5746E0F
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jul 2023 11:58:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558221.872117 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGcn7-0006a1-Qj; Tue, 04 Jul 2023 09:57:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558221.872117; Tue, 04 Jul 2023 09:57:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGcn7-0006Ww-N4; Tue, 04 Jul 2023 09:57:49 +0000
Received: by outflank-mailman (input) for mailman id 558221;
 Tue, 04 Jul 2023 09:57:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wjpU=CW=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1qGcn5-0006Ui-Pl
 for xen-devel@lists.xenproject.org; Tue, 04 Jul 2023 09:57:48 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20608.outbound.protection.outlook.com
 [2a01:111:f400:fe16::608])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 398c1112-1a51-11ee-8611-37d641c3527e;
 Tue, 04 Jul 2023 11:57:45 +0200 (CEST)
Received: from DB9PR05CA0022.eurprd05.prod.outlook.com (2603:10a6:10:1da::27)
 by GV2PR08MB10355.eurprd08.prod.outlook.com (2603:10a6:150:de::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Tue, 4 Jul
 2023 09:57:38 +0000
Received: from DBAEUR03FT007.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1da:cafe::ca) by DB9PR05CA0022.outlook.office365.com
 (2603:10a6:10:1da::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.30 via Frontend
 Transport; Tue, 4 Jul 2023 09:57:38 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT007.mail.protection.outlook.com (100.127.142.161) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6565.18 via Frontend Transport; Tue, 4 Jul 2023 09:57:37 +0000
Received: ("Tessian outbound c63645f235c1:v142");
 Tue, 04 Jul 2023 09:57:37 +0000
Received: from 3d7faca57838.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 AB5D6D7C-F7B5-4301-B875-DD30A0CEAEA4.1; 
 Tue, 04 Jul 2023 09:57:27 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3d7faca57838.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 04 Jul 2023 09:57:27 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by AM9PR08MB6114.eurprd08.prod.outlook.com (2603:10a6:20b:287::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Tue, 4 Jul
 2023 09:57:25 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::ed0b:5730:a1f9:577b]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::ed0b:5730:a1f9:577b%5]) with mapi id 15.20.6544.024; Tue, 4 Jul 2023
 09:57:24 +0000
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
X-Inumbo-ID: 398c1112-1a51-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mpShW9uqqSM9P2gZGRUtZ9yTX/59FwNAyOOHoafKpTs=;
 b=W1nV1w8yePTIeiCurvbc1UGIJ8Y5NE/wj5yNHW3A8zrGwnYVh7hXNrOhH2pFJiYXZ+jaf9Hk5J4tNDSuEBr2SM5dS6LPPtp/n4s8t/XxbIuXQeQQPZZkZXoqTqz3jLswTbI47ejXFrGLMsliYzFGKb7Hr1Y8T9xsX/jkxxd5De0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5664a9e3cd9d4085
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VYyHTopk82rBfY/7UoI0bP3o7KiGcUMn1vNiNmrOlVB6N31ksVoGtSxIy6y9Be64ApYfKuFQR9C8uOWZIcGkzn53yaFFR0UqfIW3KdPPhTnxRuPOSQcJvWE+yA1SWKTjyj1pbzzYeiL0CNiecDxoP7pLkBz3eRIOZZYJNYzbd/ie6KKNAhTWDsk28Jbki0Tj1rKzrT3l+WQNi5cdDr8QBlkGyu7wFDmjysZCkawpDE2e2qbSLxgc+p7aPRsjlk6R5sAiflZsXySgMANv4TvbOALsLZRZuXMxXEtT7w3aO3tuBiE69YMb6nF/HrT48Zw2Ye/6sZ6Kl4PLtL8Avm6OqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mpShW9uqqSM9P2gZGRUtZ9yTX/59FwNAyOOHoafKpTs=;
 b=kG9rsHN9pp79uzrdlYylnL320a7vWe2LQFq80Bgm5dTrAl0xekFNBgJmF48MgN3rTR5kgwrjiz7ToVog/mxTUfa4lT2/QiR8s0sNxUDhG5ZBo1yrsyAjF593t9qgfwmrSZrcOq48//AiKmfF1vjopmCKphtj2aG/p6+9yUWsg0bXg1TgNydAZ5z1LC8JJ/ykpjvwn801khsJR1BuH81dot8FyozqfxZO5elbJVwisLLYYdwy0DrzGuPxe8U5FHY52tJYcnaK/AguR7jHAnvKWqCOV6y44tnZ8HrEGHJ1ke6BEVfhu4zlHrhI2yj/s57qMNXYO7HQ4XeaMrRCgGgkwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mpShW9uqqSM9P2gZGRUtZ9yTX/59FwNAyOOHoafKpTs=;
 b=W1nV1w8yePTIeiCurvbc1UGIJ8Y5NE/wj5yNHW3A8zrGwnYVh7hXNrOhH2pFJiYXZ+jaf9Hk5J4tNDSuEBr2SM5dS6LPPtp/n4s8t/XxbIuXQeQQPZZkZXoqTqz3jLswTbI47ejXFrGLMsliYzFGKb7Hr1Y8T9xsX/jkxxd5De0=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: P S <pairspace@gmail.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, Christopher Clark
	<christopher.w.clark@gmail.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>,
	Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>,
	George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>, Henry Wang
	<Henry.Wang@arm.com>, Community Manager <community.manager@xenproject.org>,
	Doug Goldstein <cardoe@cardoe.com>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [RFC PATCH] xen/arm: Rebranding dom0less feature
Thread-Topic: [RFC PATCH] xen/arm: Rebranding dom0less feature
Thread-Index:
 AQHZqzMUKP6yBnvUfEC1egkdxmuozK+ki8cAgAB66ACAAukxgIAAZuEAgAAgQQCAABPDAIAA2qUA
Date: Tue, 4 Jul 2023 09:57:24 +0000
Message-ID: <5C1EE299-1779-4FA4-BE22-392E819A496F@arm.com>
References: <8601CDD7-87F7-4FD0-A6E6-BAEAB12E7956@arm.com>
 <234199F8-DBB1-42B6-9A4C-8800EEF60997@gmail.com>
In-Reply-To: <234199F8-DBB1-42B6-9A4C-8800EEF60997@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|AM9PR08MB6114:EE_|DBAEUR03FT007:EE_|GV2PR08MB10355:EE_
X-MS-Office365-Filtering-Correlation-Id: 97e77884-49a0-45f2-00a4-08db7c751930
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 rEaC5Ztop0saiuGs+yn22a1CFYIorES3L+JRbzN2J4ym1liU+rHNwRTFbvaadrpBMKRD7hNCSGtZkSRwpzkGO+ShkHkPp5MJvKDl5OBRFNn2kRRqSZKFZS0XP9BUkMVSi1SXVwey5QuT21Q4V1hkF/ZXtnbenwRT3dgramR82GnA4GkEXbQLFFiVdNNDexQaQZYLlZqRl7l5ZkaExDwdH1NoUEvXRw+RSd1gH8XwkA+7Ju1d/Hd6C/pTxwYM4galMoj/GNhq7uV2no6TFd2fxaRhqmajMA+toKnIpYi1oat2Ao/pqonS+Hx5WqbqgFC5KS2GM59Z5tckLIKJhXzgB2aN6W/BSMIvQ0l4u0IMT9lupGreAbBXrStyOA5LJkopZGcTcg+7VCQJYYtLZ+unXUevvYTyBAljg6gVX5K6mYWHY7cktWmkp8WKYEwDZMK66KWRxGzfxFSfj7TxjPYUs3CrvXdozFZjDlTe4WTz3vb8J/GTaHyeCJGgiq7hHUVmxzdNiCLkjG4PsWgT8psiUnmDPNDRiUnS9IlniCT6Pu7Euu3eeBfMf3WBEMp1yp50n9ZjolzpTTfSeKI1Ri4bZJSHiEKrVro3foWTgwgGQgpUtuTqH9mu+KwtPFpYfFOrZDkPy0RwqoYVCpmvk1e44O3bSZn4h1iwHXysAdSyito=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(376002)(136003)(346002)(39860400002)(396003)(451199021)(478600001)(83380400001)(6512007)(86362001)(6486002)(6506007)(66946007)(38100700002)(76116006)(316002)(71200400001)(53546011)(186003)(122000001)(26005)(66556008)(66476007)(64756008)(4326008)(66446008)(91956017)(6916009)(54906003)(2616005)(7416002)(5660300002)(8936002)(8676002)(38070700005)(2906002)(41300700001)(33656002)(36756003)(32563001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <1278735821AFD448BAF561E66435101D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6114
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f6fe61f1-9be8-40c1-197f-08db7c75114c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mu/uqxk7pvTVknmVBBJX9MgOCpGKIK+cVl9VIDOMN4zv1VuzirDu35kL9hNS0Oo4vUcjvp7wppIdOFiBmunaOoS3E944y+uXWDOeIluvsz19pxZrZbaR20qMuaGopKxSL4ZS31BjgAId3t6HwfqaSP3REQQhs752VhqhQJT8BSPuB2u1XzFc+J9r7ZBqG058rpHqgY4OtGv98Xl1sX/EcK8ZX3dwRV4GCyNVMk+/erRmtRoJR2SrMcLtrZiYWq+HyixKn364BbGxKsFi9ufW43t/HbC8xisvGaHQjlPHPbTylUitnzXtaZZLQj+HQswtz8+frPeXvJ9R4zLiTaBs2MUZakgHWJLWucDSzIitTuQxaF+3uP45sZHSYA15I7c8i7lqVW2JXhq34BWZoft0MQs6kU5Vi6h7YFrmxvcuWIHJOW3mo+L12jZ6qRlwfLniw9vPAU1gz+UKSvmruVWPUGdfHsNpW56KI50p0mhRYcRV15fdS+NxP9iirN2R+UU8Tsu7NYBfgNDC/yOKNco2WgWHSkiMdkLLZ/CQPbBvSKUoUl5JVfHY6Ff76q6aKb7IYppEK3qt+3mkWKlTCeZEi60NqJHi59Qdc3ImVlktRode2zIkRLlZrG/lmSgnnbprpPlZ7+C0LJj+s668Dni/btZfOhrM+3mCr6hDjcl8lO5iUtW1kzLAXYURlNqazP72Rb///ggyZzsb9kT/BhAml6JiV/vsoYLzBrltwauK4iyN532o5THnKoOPZtBoPawxSranOxmrVJGee1z3edQ8iA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(396003)(346002)(39860400002)(451199021)(36840700001)(46966006)(40470700004)(478600001)(336012)(36860700001)(83380400001)(47076005)(6512007)(6486002)(86362001)(107886003)(356005)(81166007)(70206006)(316002)(26005)(53546011)(186003)(82740400003)(54906003)(6506007)(4326008)(70586007)(2616005)(6862004)(5660300002)(8936002)(2906002)(40460700003)(8676002)(41300700001)(40480700001)(33656002)(82310400005)(36756003)(32563001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2023 09:57:37.8495
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 97e77884-49a0-45f2-00a4-08db7c751930
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB10355

DQoNCj4gT24gMyBKdWwgMjAyMywgYXQgMjE6NTQsIFAgUyA8cGFpcnNwYWNlQGdtYWlsLmNvbT4g
d3JvdGU6DQo+IA0KPiANCj4gDQo+PiBPbiBKdWwgMywgMjAyMywgYXQgMTU6NDUsIEx1Y2EgRmFu
Y2VsbHUgPGx1Y2EuZmFuY2VsbHVAYXJtLmNvbT4gd3JvdGU6DQo+PiANCj4+IO+7vw0KPj4gDQo+
Pj4gT24gMyBKdWwgMjAyMywgYXQgMTg6NDgsIFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxp
bmlAa2VybmVsLm9yZz4gd3JvdGU6DQo+Pj4gDQo+Pj4+IE9uIE1vbiwgMyBKdWwgMjAyMywgRGFu
aWVsIFAuIFNtaXRoIHdyb3RlOg0KPj4+PiBPbiA3LzEvMjMgMTE6MTMsIEx1Y2EgRmFuY2VsbHUg
d3JvdGU6DQo+Pj4+Pj4gT24gMSBKdWwgMjAyMywgYXQgMDg6NTMsIEFuZHJldyBDb29wZXIgPGFu
ZHJldy5jb29wZXIzQGNpdHJpeC5jb20+IHdyb3RlOg0KPj4+Pj4+IA0KPj4+Pj4+IE9uIDMwLzA2
LzIwMjMgMTA6MTIgYW0sIEx1Y2EgRmFuY2VsbHUgd3JvdGU6DQo+Pj4+Pj4+IFRoZSAiZG9tMGxl
c3MiIGZlYXR1cmUgd2FzIGludGVuZGVkIHRvIGJlIHRoZSBmZWF0dXJlIHdoZXJlIGEgZG9tVQ0K
Pj4+Pj4+PiBkb21haW4gY291bGQgYmUgbGF1bmNoZWQgd2l0aG91dCB0aGUgY29udHJvbCBkb21h
aW4gKERvbTApDQo+Pj4+Pj4+IGludGVydmVudGlvbiwgaG93ZXZlciB0aGUgbmFtZSBzZWVtcyB0
byBzdWdnZXN0IHRoYXQgRG9tMCBjYW5ub3QNCj4+Pj4+Pj4gYmUgcGFydCBvZiB0aGUgY29uZmln
dXJhdGlvbiwgd2hpbGUgaW5zdGVhZCBpdCdzIGEgcG9zc2libGUgdXNlIGNhc2UuDQo+Pj4+Pj4+
IA0KPj4+Pj4+PiBUbyBhdm9pZCB0aGF0LCByZW5hbWUgdGhlICJkb20wbGVzcyIgY29uZmlndXJh
dGlvbiB3aXRoIHRoZSBuYW1lDQo+Pj4+Pj4+ICJoeXBlcmxhdW5jaCIsIHRoYXQgaXMgbGVzcyBt
aXNsZWFkaW5nLg0KPj4+Pj4+PiANCj4+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogTHVjYSBGYW5jZWxs
dSA8bHVjYS5mYW5jZWxsdUBhcm0uY29tPg0KPj4+Pj4+PiAtLS0NCj4+Pj4+Pj4gVGhpcyBpcyBh
biBSRkMgdG8gZ2V0IHRoZSBmZWVsaW5nIG9mIHRoZSBjb21tdW5pdHkgYWJvdXQgdGhlIG5hbWUN
Cj4+Pj4+Pj4gY2hhbmdlLCBmb3Igbm93IGl0J3MgZXZlcnl0aGluZyBpbiBvbmUgcGF0Y2gganVz
dCB0byBzZWUgaG93IGl0DQo+Pj4+Pj4+IHdpbGwgbG9vayBsaWtlLCBpZiB0aGVyZSBpcyBpbnRl
cmVzdCBvbiBwcm9jZWVkaW5nIGludG8gaXQsIEkgY2FuDQo+Pj4+Pj4+IHNwbGl0IGluIG1vcmUg
Y29tbWl0Lg0KPj4+Pj4+IA0KPj4+Pj4+IEhhdmUgeW91IGRpc2N1c3NlZCB0aGlzIHdpdGggRGFu
IGFuZCBDaHJpcyBhdCBhbGw/ICBZb3UgaGF2ZW4ndCBldmVuDQo+Pj4+Pj4gQ0MnZCB0aGVtLg0K
Pj4+Pj4gDQo+Pj4+PiBObywgdGhpcyByZW5hbWUgaWRlYSBzdGFydGVkIGZyb20gYSBjaGF0IGR1
cmluZyB0aGUgc3VtbWl0LCBhbnl3YXkgSnVsaWVuDQo+Pj4+PiBwcm9tcHRseSBhZGQgdGhlbSB0
byB0aGUgQ0MsIGJlY2F1c2UgSSBmb3Jnb3QuDQo+Pj4+IA0KPj4+PiBObyB3b3JyaWVzIGFuZCB0
aGFuayB5b3UgZm9yIGNvbnNpZGVyaW5nIGFuZCB0YWtpbmcgdGhlIHRpbWUgdG8gZG8gdGhpcyBS
RkMuDQo+Pj4+IEl0IGlzIGdyZWF0bHkgYXBwcmVjaWF0ZWQgdGhhdCB0aGVyZSBpcyBhIHN0cm9u
ZyB3aWxsaW5nbmVzcyB0byBoYXZlIGRvbTBsZXNzDQo+Pj4+IGFuZCBoeXBlcmxhdW5jaCBtZXJn
ZWQuDQo+Pj4+IA0KPj4+Pj4+IA0KPj4+Pj4+IFdoaWxlIHRoZXJlIGlzIGEgbG90IG9mIGVuZC1n
b2FsIGluIGNvbW1vbiBiZXR3ZWVuIHRoZSBkb20wbGVzcyBhbmQNCj4+Pj4+PiBoeXBlcmxhdW5j
aCwgYW5kIHRoYXQgdGhlIG5hbWUgZG9tMGxlc3MgaXMgZGVlcGx5IG1pc2xlYWRpbmcsDQo+Pj4+
Pj4gaHlwZXJsYXVuY2ggaXMgc3BlY2lmaWNhbGx5IG5vdCB0aGlzLg0KPj4+Pj4gDQo+Pj4+PiBZ
ZXMgSHlwZXJsYXVuY2ggaXMgbW9yZSB0aGFuIHRoaXMsIGhvd2V2ZXIgYXMgSSBzYWlkLCB3aXRo
IHRoaXMgUkZDIEkgd291bGQNCj4+Pj4+IGxpa2UNCj4+Pj4+IHRvIGVhciBvcGluaW9ucywgQERh
bmllbCBAQ2hyaXN0b3BoZXIgY291bGQgaXQgYmUgYSBwcm9wZXIgbmFtZSBmb3IgdGhlDQo+Pj4+
PiBkb20wbGVzcw0KPj4+Pj4gZmVhdHVyZT8NCj4+Pj4gDQo+Pj4+IEFzIEFuZHkgaGFzIGFsbHVk
ZWQsIGh5cGVybGF1bmNoIGlzIG1lYW50IHRvIHByb3ZpZGUgYSBmbGV4aWJsZSBtZWFucyB0bw0K
Pj4+PiBoYW5kbGUgZG9tYWluIGNvbnN0cnVjdGlvbiBhdCBib290IHRvIG1lZXQgYSB3aWRlIHJh
bmdlIG9mIHBvc3NpYmxlIHVzZSBjYXNlcy4NCj4+Pj4gT25lIG9mIHRob3NlIHVzZSBjYXNlcyBp
cyBkb20wbGVzcywgc28geWVzLCB1bHRpbWF0ZWx5IHdoYXQgZG9tMGxlc3MgZG9lcw0KPj4+PiB0
b2RheSB3aWxsIGJlIGFjaGlldmFibGUgdW5kZXIgaHlwZXJsYXVuY2guIE91ciBpbnRlbmRlZCBh
cHByb2FjaCB0byBhbGlnbiB0aGUNCj4+Pj4gdHdvIGltcGxlbWVudGF0aW9ucyBpcyBvbmUgdGhh
dCBpcyBtZWFudCB0byBiZSBtaW5pbWFsbHkgZGlzcnVwdGl2ZSwgc2luY2UNCj4+Pj4gZG9tMGxl
c3MgaXMgY29uc2lkZXJlZCBhIHN1cHBvcnRlZCAoU1VQUE9SVC5tZCkgY2FwYWJpbGl0eS4gQXMg
bWVudGlvbmVkLCB3ZQ0KPj4+PiBhcmUgZ3JlYXRseSBhcHByZWNpYXRpdmUgdG8gdGhlIG9wZW5u
ZXNzIHRvIGFkb3B0IHRoZSBuYW1lLA0KPj4+IA0KPj4+IFRoYW5rcyBEYW5pZWwhDQo+Pj4gDQo+
Pj4gDQo+Pj4+IGJ1dCBhIGJpZyBjb25jZXJuDQo+Pj4+IEkgcGVyc29uYWxseSBoYXZlIGlzIHRo
ZSBjb25mdXNpb24gaXQgY291bGQgY2F1c2UgYSBnZW5lcmFsIHVzZXIuIEEgYmxhbmtldA0KPj4+
PiByZW5hbWUgd291bGQgZW5kIHVwIHdpdGggdHdvIGRvY3VtZW50cyBpbiB0aGUgZG9jcyB0cmVl
IHRoYXQgcHJvdmlkZSB0d28NCj4+Pj4gZGlmZmVyZW50IGV4cGxhbmF0aW9ucyBvZiBoeXBlcmxh
dW5jaCBhbmQgdHdvIGRpZmZlcmVudCBkZXZpY2UgdHJlZQ0KPj4+PiBkZWZpbml0aW9ucy4gU28g
SSB0aGluayBhIG1vcmUgbWVhc3VyZWQgYXBwcm9hY2ggc2hvdWxkIGJlIGNvbnNpZGVyZWQgaGVy
ZS4NCj4+Pj4gDQo+Pj4+PiBJZiB0aGlzIHBhdGNoIG1ha2VzIHRoaW5ncyBtb3JlIGRpZmZpY3Vs
dCBmb3IgdGhlIEh5cGVybHVuY2ggc2VyaWUsIEnigJltIG9rDQo+Pj4+PiB0byBkcm9wIGl0LA0K
Pj4+Pj4gbXkgb25seSBhaW0gd2FzIGp1c3QgdG8gZmluZCBhIGxlc3MgbWlzbGVhZGluZyBuYW1l
IGZvciB0aGUgZmVhdHVyZS4NCj4+Pj4gDQo+Pj4+IFdoYXQgSSB3b3VsZCBsaWtlIHRvIHN1Z2dl
c3QgYXMgYSBnb29kIGZpcnN0IHN0ZXAgd291bGQgYmUgYW4gdXBkYXRlIHRvIHRoZQ0KPj4+PiBk
b20wbGVzcyBkb2N1bWVudC4gUHJvdmlkZSBhIG5vdGUgYXQgdGhlIGJlZ2lubmluZyB0aGF0IHBv
aW50cyB0byB0aGUNCj4+Pj4gaHlwZXJsYXVuY2ggZGVzaWduIGRvYyBhcyBhIG1vcmUgZ2VuZXJh
bCBhcHByb2FjaCB0aGF0IHdpbGwgZXZlbnR1YWxseSBzdWJzdW1lDQo+Pj4+IGRvbTBsZXNzLiBU
aGlzIHdvdWxkIHByb3ZpZGUgYSBnZW50bGVyIHRyYW5zaXRpb24gZm9yIGV4aXN0IHVzZXJzIG9m
IGRvbTBsZXNzLg0KPj4+PiANCj4+Pj4gSWYgaXQgaXMgbm90IHRvbyBtdWNoLCBJIHdvdWxkIGFs
c28gYXNrLCBwbGVhc2UgaGF2ZSBhIGxvb2sgYXQgdGhlIGRlc2lnbiBmb3INCj4+Pj4gYm9vdCBt
b2R1bGVzIGluIHRoZSBzZXJpZXMgQ2hyaXN0b3BoZXIganVzdCBwb3N0ZWQuIFRoZSBkZXNpZ24g
cHVsbHMgZnJvbSB0aGUNCj4+Pj4gd29yayBkb25lIGJ5IGRvbTBsZXNzIGFuZCBleHBhbmRlZCB1
cG9uIGl0LiBJIG1ham9yIHN0ZXAgaW50byBtZXJnaW5nIHRoZSB0d28NCj4+Pj4gY2FwYWJpbGl0
aWVzIHdpbGwgYmUgdG8gaGF2ZSBhIGNvbW1vbiBzZXQgb2Ygc3RydWN0dXJlcy4gT25jZSB0aG9z
ZSBhcmUgaW4NCj4+Pj4gcGxhY2UsIHdlIGNhbiBtb3ZlIHRvIGEgY29tbW9uIGRldmljZSB0cmVl
IHJlcHJlc2VudGF0aW9uLCBhbmQgYXQgdGhhdCBwb2ludA0KPj4+PiB3ZSB3b3VsZCBiZSBmYWly
bHkgY2xvc2UsIGlmIG5vdCBhdCB0aGUgcG9pbnQgb2YgYSBmb3JtYWwgbWVyZ2VyIG9mIGJldHdl
ZW4NCj4+Pj4gdGhlIHR3by4NCj4+PiANCj4+PiBBdCB0aGUgbW9tZW50IHdlIGhhdmUgYSBjb25j
cmV0ZSBwcm9ibGVtIHdpdGggZXhwbGFpbmluZyBkb20wbGVzcyBhbmQNCj4+PiBoeXBlcmxhdW5j
aCB0byBwb3RlbnRpYWwgbmV3IHVzZXJzLiBVc2luZyB0d28gZGlmZmVyZW50IG5hbWVzIGZvciBh
DQo+Pj4gc2ltaWxhciBmZWF0dXJlIG9uIGFybSBhbmQgeDg2IGNhdXNlcyBjb25mdXNpb24uIEl0
IGlzIGh1cnRpbmcgWGVuIGFzIGENCj4+PiBzb2x1dGlvbi4gUGVyc29uYWxseSBJIGFscmVhZHkg
aGFkIHRvIHN3aXRjaCB0byB1c2UgdGhlIHdvcmQNCj4+PiAiaHlwZXJsYXVuY2giIGZvciBldmVy
eXRoaW5nIGluIG15IHVzZXJzLWZhY2luZyBwcmVzZW50YXRpb25zLg0KPj4+IA0KPj4+IEF0IHRo
ZSBzdW1taXQsIHdlIGRpc2N1c3NlZCB0aGF0IGl0IHdvdWxkIGJlIGEgZ29vZCBpZGVhIHRvIHVz
ZSBhIHNpbmdsZQ0KPj4+IG5hbWUgdG8gcmVmZXIgdG8gYm90aCBmZWF0dXJlcyBvbiBhcm0gYW5k
IHg4Ni4gR2l2ZW4gdGhhdCAiZG9tMGxlc3MiDQo+Pj4gY2F1c2VzIGFkZGl0aW9uYWwgaXNzdWVz
IGJlY2F1c2UgaXQgbWFrZXMgcGVvcGxlIHRoaW5rIHRoYXQgdGhlcmUgaXMgbm8NCj4+PiBEb20w
LCB0aGUgc3VnZ2VzdGlvbiB3YXMgdG8gdXNlICJoeXBlcmxhdW5jaCIgdG8gcmVmZXIgdG8gYm90
aCBmZWF0dXJlcy4NCj4+PiANCj4+PiBXZSBkb24ndCBuZWVkIHRvIDEwMCUgYWxpZ24gdGhlIHR3
byBpbXBsZW1lbnRhdGlvbnMgYW5kIGRhdGEgc3RydWN0dXJlcy4NCj4+PiBUaGlzIGlzIG5vdCBm
b3IgZW5naW5lZXJzIHRoYXQgYXJlIGdvaW5nIHRvIGxvb2sgYXQgdGhlIHNwZWNpZmljYXRpb25z
DQo+Pj4gYW5kIGltcHJvdmUgdGhlbS4gVGhpcyBpcyBmb3IgdXNlcnMvY3VzdG9tZXJzIG9mIFhl
biB0aGF0IGFyZSB0cnlpbmcgdG8NCj4+PiB1bmRlcnN0YW5kIHdoYXQgdGhlIGh5cGVydmlzb3Ig
ZW5hYmxlcyB0aGVtIHRvIGRvLiBXZSBuZWVkIHRvIGJlIGFibGUgdG8NCj4+PiBzaG93IHVzZXJz
IGFyY2hpdGVjdHVyZSBzbGlkZXMgd2l0aCB0aGUgc2FtZSBuYW1lIGFuZCBleHBsYW5hdGlvbiBv
bg0KPj4+IGJvdGggQVJNIGFuZCB4ODYuDQo+Pj4gDQo+Pj4gSSBhbSBzdXJlIHRoYXQgRGFuaWVs
IGFuZCBDaHJpc3RvcGhlciByZW1lbWJlciwgYnV0IGZvciB0aGUgb3RoZXJzIG9uDQo+Pj4gdGhp
cyBlbWFpbCB0aHJlYWQsIHRoZSBuYW1lICJoeXBlcmxhdW5jaCIgd2FzIGJvcm4gZXhhY3RseSB0
byBiZSB0aGF0Og0KPj4+IHRoZSBvbmUgbmFtZSB0byBjb3ZlciBib3RoIGZlYXR1cmVzIG9uIEFS
TSBhbmQgeDg2IGV2ZW4gaWYgdGhleSBoYXZlIGENCj4+PiBkaWZmZXJlbnQgaW1wbGVtZW50YXRp
b24uIEFwcGVuZGVkIGFuIG9sZCBlbWFpbCBmb3IgcmVmZXJlbmNlLg0KPj4+IA0KPj4+IEFsc28g
SSBhZ3JlZSB3aXRoIERhbmllbCB0aGF0IHdlIG5lZWQgdG8gYmUgY2FyZWZ1bCBhYm91dCB0aGUg
dHdvIGRvY3MNCj4+PiB1bmRlciBkb2NzLy4gSSB0aGluayBoZSBpcyByaWdodCB3ZSBuZWVkIHRv
IGFkZCBhIHBhcmFncmFwaCBleHBsYWluaW5nDQo+Pj4gdGhlIGhpc3RvcnkgYW5kIGEgcG9pbnRl
ciB0byB0aGUgb3RoZXIgZG9jdW1lbnQuIFNvbWV0aGluZyBsaWtlOg0KPj4+IA0KPj4+ICJEb20w
bGVzcyBpcyB0aGUgbmFtZSB0aGF0IHdhcyB1c2VkIHdoZW4gaW5pdGlhbGx5IGludHJvZHVjaW5n
IHRoZQ0KPj4+IGZlYXR1cmUgb24gQVJNLiBUaGVuLCB0aGUgImRvbTBsZXNzIiBuYW1lIHdhcyBy
ZXRpcmVkIGluIGZhdm9yIG9mDQo+Pj4gImh5cGVybGF1bmNoIiB0byBhdm9pZCBjb25mdXNpb24g
KGEgRG9tMCBtaWdodCBzdGlsbCBiZSBwcmVzZW50KSBhbmQgdG8NCj4+PiBhbGlnbiB3aXRoIHg4
NiAod2hlcmUgYSBzaW1pbGFyIGZlYXR1cmUgd2FzIGNhbGxlZCBoeXBlcmxhdW5jaCBmcm9tIHRo
ZQ0KPj4+IHN0YXJ0KS4iDQo+PiANCj4+IEnigJltIGZ1bGx5IG9rIHRvIGFkZCBhIHNlY3Rpb24g
bGlrZSB0aGlzIHBvaW50aW5nIHRvIHRoZSBIeXBlcmxhdW5jaCBkZXNpZ24uDQo+IA0KPiBfSWZf
IHRoaXMgdGV4dCBpcyBhZGRlZCwgcGxlYXNlIGluY2x1ZGUgbGlua3MvcmVmZXJlbmNlcyB0byB0
aGUgSHlwZXJsYXVuY2ggd2lraSBwYWdlIGFuZCBIeXBlcmxhdW5jaCBkZXNpZ24gZG9jcy4NCj4g
DQo+PiBARGFuaWVsIGFuZCBAQ2hyaXN0b3BoZXIgd291bGQgaXQgYmUgb2sgZm9yIHlvdSBvciB0
aGUgY2hhbmdlcyBpbiB0aGUgc2VyaWUNCj4+IGFyZSBnb2luZyB0byBiZSBwcm9ibGVtYXRpYyBm
b3IgeW91ciBmdXR1cmUgd29yaz8gSW4gdGhlIGVuZCBpdOKAmXMganVzdCBhIG1lY2hhbmljYWwN
Cj4+IHJlbmFtZSwgc28gSSBndWVzcyB3ZSBqdXN0IG5lZWQgdG8gYWdyZWUgb24gbmFtaW5nIGNv
bnZlbnRpb25zLg0KPiANCj4gUGxlYXNlIHNlZSB0aGUgaGlzdG9yeSBvZiB0cmFkZW1hcmsgbGl0
aWdhdGlvbiBhYm91dCB0aGUgdXNlIG9mIHN5bWJvbGljIG5hbWVzIHRvIHJlZmVyZW5jZSBzaW1p
bGFyLWJ1dC1kaWZmZXJlbnQgYXJ0aWZhY3RzLiAgSXQgaXMgbXVjaCBlYXNpZXIgdG8gdXNlIHRo
ZSBzYW1lIG5hbWUgdG8gcmVmZXIgdG8gZW50aXJlbHkgZGlmZmVyZW50IG9iamVjdHMuIEhpc3Rv
cmljYWxseSwgY29uZnVzaW9uIGFyaXNlcyB3aGVuIGEgbmFtZSBpcyB1c2VkIGluIHNpbWlsYXIg
Y29udGV4dHMuDQo+IA0KPiBUaGVyZSBpcyBhbHNvIHZlcnNpb25pbmcuICBDb3VsZCB3ZSByZWZl
ciB0byBkb20wbGVzcyBhcyAiSHlwZXJsYXVuY2ggVmVyc2lvbiAtMSI/IA0KPiANCj4gSG93IGFi
b3V0IHJlbmFtaW5nIGRvbTBsZXNzIHRvICJIeXBlcmxhdW5jaCBMaXRlIj8NCg0KSeKAmW0gb2sg
YXMgbG9uZyBhcyB0aGUgQXJtIG1haW50YWluZXIgYXJlIGhhcHB5IHdpdGggaXQNCg0KPiANCj4g
UmljaA0KPiANCj4+IENoZWVycywNCj4+IEx1Y2ENCj4+IA0KPj4+IA0KPj4+IA0KPj4+IC0tLQ0K
Pj4+IA0KPj4+IFN1YmplY3Q6IFtSRlBdIE92ZXJhcmNoaW5nIG5hbWUgZm9yIGRvbTBsZXNzIGFu
ZCBEb21CDQo+Pj4gDQo+Pj4gR3JlZXRpbmdzLA0KPj4+IA0KPj4+IEF0IHRoZSBEZXZpY2VUcmVl
L0RvbUIgbWVldGluZyBpdCB3YXMgcHJvcG9zZWQgdGhhdCBhIG5ldywgbGFyZ2VyDQo+Pj4gb3Zl
cmFyY2hpbmcgbmFtZSB1bmRlciB3aGljaCBEb21CIGFuZCBkb20wbGVzcyB3b3VsZCBiZSBjb3Zl
cmVkLiBUaGVyZQ0KPj4+IHdhcyBhIGdlbmVyYWwgb3Blbm5lc3MgdG8gdGhlIGlkZWEuIEFzIHN1
Y2gsIHNpbmNlIENocmlzdG9waGVyIGFuZA0KPj4+IG15c2VsZiBhcmUgaW4gdGhlIG1pZHN0IG9m
IGZpbmFsaXppbmcgdGhlIGRlc2lnbiBkb2N1bWVudCBmb3IgRG9tQiB3ZQ0KPj4+IGZlbHQgaXQg
bWlnaHQgYmUgYmV0dGVyIHRvIHNlZSBpZiBhIG5hbWUgY291bGQgYmUgc2VsZWN0ZWQgd2hpY2gg
d2UNCj4+PiBjb3VsZCB1c2UgaW4gdGhlIGRlc2lnbiBkb2MgaW4gbGlldSBvZiBEb21CLiBBcyBh
bHdheXMgbmFtaW5nIHRoaW5ncyBpcw0KPj4+IGhhcmQsIGJ1dCBhZnRlciBzb21lIGJyYWluc3Rv
cm1pbmcgd2UgYmVsaWV2ZSB3ZSBoYXZlIGFycml2ZWQgYXQgYQ0KPj4+IGRlY2VudCBuYW1lLCDO
vExhdW5jaCAobWljcm8tTGF1bmNoIG9yIHVMYXVuY2gpLg0KPj4+IA0KPj4+IC0tLQ0KPj4+IA0K
Pj4+IM68TGF1bmNoIGJlY2FtZSBoeXBlcmxhdW5jaCBmZXcgZGF5cyBhZnRlciwgYW5kIHRoZSBy
ZXN0IHdhcyBoaXN0b3J5IDotKQ0KPj4gDQo+PiANCg0K

