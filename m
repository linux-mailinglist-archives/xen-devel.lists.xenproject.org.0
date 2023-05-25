Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A231B7108BE
	for <lists+xen-devel@lfdr.de>; Thu, 25 May 2023 11:22:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539473.840381 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q27Ao-0004wy-Sc; Thu, 25 May 2023 09:22:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539473.840381; Thu, 25 May 2023 09:22:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q27Ao-0004uG-Os; Thu, 25 May 2023 09:22:18 +0000
Received: by outflank-mailman (input) for mailman id 539473;
 Thu, 25 May 2023 09:22:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zmzE=BO=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1q27An-0004uA-HV
 for xen-devel@lists.xenproject.org; Thu, 25 May 2023 09:22:17 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20604.outbound.protection.outlook.com
 [2a01:111:f400:7d00::604])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a2a0617b-fadd-11ed-8611-37d641c3527e;
 Thu, 25 May 2023 11:22:14 +0200 (CEST)
Received: from AM4PR0101CA0070.eurprd01.prod.exchangelabs.com
 (2603:10a6:200:41::38) by DB9PR08MB6457.eurprd08.prod.outlook.com
 (2603:10a6:10:23e::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15; Thu, 25 May
 2023 09:22:12 +0000
Received: from AM7EUR03FT047.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:200:41:cafe::40) by AM4PR0101CA0070.outlook.office365.com
 (2603:10a6:200:41::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.17 via Frontend
 Transport; Thu, 25 May 2023 09:22:11 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT047.mail.protection.outlook.com (100.127.140.69) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6433.15 via Frontend Transport; Thu, 25 May 2023 09:22:11 +0000
Received: ("Tessian outbound 3570909035da:v136");
 Thu, 25 May 2023 09:22:11 +0000
Received: from ee2f245e56bd.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 908875A9-8B14-4813-8600-06692F3F25EA.1; 
 Thu, 25 May 2023 09:22:00 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ee2f245e56bd.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 25 May 2023 09:22:00 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by AM8PR08MB6465.eurprd08.prod.outlook.com (2603:10a6:20b:365::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.16; Thu, 25 May
 2023 09:21:56 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::362c:56c7:5ea4:422e]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::362c:56c7:5ea4:422e%7]) with mapi id 15.20.6433.015; Thu, 25 May 2023
 09:21:55 +0000
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
X-Inumbo-ID: a2a0617b-fadd-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H5VbXe48kVeShUYEX7XgaKDAkwnI9cCDdJgqbOfkCzg=;
 b=THR75J+JHvVoknw3vwlCt0GeO/pCej5aqj7HvzjpAfAoQ5+OZGBg5kr+VuWLndOMwiwcppkuM9GMMttlVQBVD9ZwnWXPse9H90nFXpfZiXcj7Uferl7Z98V2ZJhaEcagq+NVpn/vsUyZiADdrF8YhmVVoZ/cKSRS5xE4YJzd3q0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: cf052c608fce1c62
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CZ4ROIFq5n5sGyCqB9gfEnRrKnIpFtAZkY/p6GlWAg8DeewdiwE+Tu8ME7I4AeOEyv+Vu9xHh9Nd548AK5jziV3Qcfzer5FZR1o2+G9g+HK3tmA4+IAmBJ+i0YcG1d4rdMY7QDxNqqulWC3c7T20OONKlHg8PzKJQfymobjEXJX0jfysEpR2kQSoNV7DKHJUm3ZYR9R799HFukbVGs7qeIucgvuyEKM295bOQS68siJONCtoedDTaaTKVWceK3NZLfyaxG+/XCVctLg1uFhMerm0E7564ndZ9KDEvgb3d8pvFBHChsBZ2f5NDKhjrYJO5JuxW9OavMVbmtT5hZBVjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H5VbXe48kVeShUYEX7XgaKDAkwnI9cCDdJgqbOfkCzg=;
 b=emQRl47qsSC1dHJzaEjd+Ttw1HHHiIxXy9TmGxC65laJZA2USGzOcYjp2CMJOK7PEPSHkkBVIH73B2sZDZztfHSWcgTSYhYUzKnnojukGVNVPFioS7R7s8h0BYPrj5m2vpYm5YIaOJ8r9wZwY3dGej9RvYXy03i8rynV7Gbyee7f1nkkyCwKIfG6s4WSh2PA+PEbIIpQY/Nvq1kqF/Mfa1zbBYUzPREyzSbQIB0FOnXRENuzCc0syI3v7FHwJ7f8xkz7QzSRWY3nekJpK5NGurk9C8sfl4M6Y96qA3dqCpzfTrqTvXOfWOk1mR/j3LFVa53Jgg/+JWvG10q6SFwXjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H5VbXe48kVeShUYEX7XgaKDAkwnI9cCDdJgqbOfkCzg=;
 b=THR75J+JHvVoknw3vwlCt0GeO/pCej5aqj7HvzjpAfAoQ5+OZGBg5kr+VuWLndOMwiwcppkuM9GMMttlVQBVD9ZwnWXPse9H90nFXpfZiXcj7Uferl7Z98V2ZJhaEcagq+NVpn/vsUyZiADdrF8YhmVVoZ/cKSRS5xE4YJzd3q0=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: =?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
	<marmarek@invisiblethingslab.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, George Dunlap
	<george.dunlap@citrix.com>, Nick Rosbrook <rosbrookn@gmail.com>, Wei Liu
	<wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross
	<jgross@suse.com>, Christian Lindig <christian.lindig@citrix.com>, David
 Scott <dave@recoil.org>, Christian Lindig <christian.lindig@cloud.com>
Subject: Re: [PATCH v7 09/12] tools: add physinfo arch_capabilities handling
 for Arm
Thread-Topic: [PATCH v7 09/12] tools: add physinfo arch_capabilities handling
 for Arm
Thread-Index: AQHZjUpkSkVWSiVT2k+ILuaW20r/+q9qrj4AgAAKbYCAAAFlAA==
Date: Thu, 25 May 2023 09:21:55 +0000
Message-ID: <1D2A4448-D89C-458B-A2EB-C0368E6534C1@arm.com>
References: <20230523074326.3035745-1-luca.fancellu@arm.com>
 <20230523074326.3035745-10-luca.fancellu@arm.com> <ZG8evxN0mF8NDTPS@mail-itl>
 <2BCDFCFC-30F0-4D61-AE92-65046CDD5696@arm.com>
In-Reply-To: <2BCDFCFC-30F0-4D61-AE92-65046CDD5696@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|AM8PR08MB6465:EE_|AM7EUR03FT047:EE_|DB9PR08MB6457:EE_
X-MS-Office365-Filtering-Correlation-Id: a2b5b7db-cda3-4c87-3582-08db5d01854e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 xZ2YkVkiaxB7T6T+tIbNjeoTad66u9ZHEBqGfZDsjpAgolCnAuP3e9s1CLnmFntFnFZJBev/+hybSnPtuHg0YByXCvaKXLt2yjoR5GzEe/QxC20WZnWSP/kN9/TKDdUMh9IuRhuEUkeg/bo4kuhRlObuLLmQMSHIETLZ/mjdUdLa2r6PTkCA2/qlO2fU5H25mHMisEQIO6V4z9iT9v4jvVW+/tEAfEKbV1lBQ0I+oUYGhISep9Yz2Q+ZyiyND2bmPXB0Tn3r8l+rNmAxTyDteBeol97MoGOUNp83UaFT90LKGtr5Cu80VtiQfPVK0UUDk9Jr7POTTxQOmSn4mmBU2BQniOdkLVgeZi/3unBzX6v5YxMhg6Yr/bd+TaX+/oIuvL+7/yYOzGE9hLznk24DEwovEBsAIi7S+sLro4JV8gBTtR97fw9b3ZHTOyW3BnYzBmLWoI/aNlVhqJ5TpOp2Nv/C4d7EsmahEi23fJEES2R6UhE4RV7TZnYTTr5Xa4CnuYKI3mD2dRa6stzv7YrpCb9iTH0XiFLQkpYnRN+h6T4Q2fI9dp2RAQa6rTUpiA4r7CiVBlYks1fY1OV6D/RpY2rSbPLqf4wB/e1Id4nMLC99hOy41oZcdFEtEIQUOHOuyDvSO7uG+7OaqNRTBktIcg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(366004)(346002)(376002)(136003)(396003)(451199021)(5660300002)(7416002)(54906003)(478600001)(8676002)(41300700001)(6486002)(6512007)(6506007)(26005)(66556008)(66946007)(66446008)(71200400001)(4326008)(66476007)(6916009)(64756008)(316002)(91956017)(76116006)(8936002)(186003)(2616005)(83380400001)(2906002)(66574015)(38100700002)(122000001)(38070700005)(86362001)(33656002)(36756003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <CAB3DD94A2F0E64CA4FCED2116B62BEC@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6465
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT047.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d293be29-6264-45b1-902b-08db5d017bfa
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dQFAX3s4t+B6SzrfXJWiAS6MIPYe4UHnkjJmkV/E2CxNehb0D8PpZOqUbt2fWUJJiXCzxIcV7+GWFJ285cDpvYV9ShmSSfmU0DQxSerHl6fnLPWOsA9vbBOfYoon9L+fhCPVNTDwQjXcXzfH8GuiiREk82L4H/V63LzgSFIo9Fw9aCSzTvRzuFFL8pAIzpvNlqdjCMvNXZl0+eAY/YGeNPRxN9vcYKCqUIOTEgSdalUEVphUK4yO+kwhnAVcxmG2SAXDCwcxtk5zp09y1v3VfRm0/DjTXoLdHizNBnJSm9/T/0w1EXM8/q+HmxyrZF9SJaomcwSsOeJVE7fdBNOS1S/sazb0Y2zVnI+YjuZPzld9DOCwlNfLiDme7hAgH8zyvV892bwtCOc3B6e1KoIT+DxPhVZig8QHvLRWOPSHmQ5IvLlg+VTag0yockxm6MsRVHEj0p6GPCCPv4I/aKCYC6k0MW4YA6hENYhZvyElD4IFvPP+ViJJNoD1/u+wg4LAq/G/xv4W5n/bRjnLmvxIueMpUye6EfBSZrtrQj1hijlv8vbZ5LRxUDMnwe4B2zATP0/kG0jhVtpKp6JwSZW8oR9ankSjZcc/O7qB9AiPicMr6Gb1npHBrc6pk8oZhEG1GQjXnYyFcsZ6LyXjVWTv5009vPm5c8XKSpfz5uoEYjOoQAj7khb9FweydcvTPhh2LrX6fe4kgEZv7uLyOE6TvJUBdiOhRLJ+PtAATXe87m7Ut7vyAWGybr4kSDieEsrn
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(346002)(39860400002)(376002)(451199021)(36840700001)(46966006)(40470700004)(5660300002)(6862004)(8936002)(8676002)(40460700003)(40480700001)(2616005)(186003)(33656002)(47076005)(36860700001)(66574015)(83380400001)(2906002)(86362001)(336012)(36756003)(82310400005)(82740400003)(356005)(81166007)(26005)(6506007)(6512007)(107886003)(316002)(70206006)(70586007)(4326008)(54906003)(6486002)(478600001)(41300700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 09:22:11.4965
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a2b5b7db-cda3-4c87-3582-08db5d01854e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT047.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6457

Pj4gDQo+PiAoLi4uKQ0KPj4gDQo+Pj4gZGlmZiAtLWdpdCBhL3Rvb2xzL3B5dGhvbi94ZW4vbG93
bGV2ZWwveGMveGMuYyBiL3Rvb2xzL3B5dGhvbi94ZW4vbG93bGV2ZWwveGMveGMuYw0KPj4+IGlu
ZGV4IDk3MjhiMzQxODVhYy4uYjM2OTlmZGFjNThlIDEwMDY0NA0KPj4+IC0tLSBhL3Rvb2xzL3B5
dGhvbi94ZW4vbG93bGV2ZWwveGMveGMuYw0KPj4+ICsrKyBiL3Rvb2xzL3B5dGhvbi94ZW4vbG93
bGV2ZWwveGMveGMuYw0KPj4+IEBAIC0yMiw2ICsyMiw3IEBADQo+Pj4gI2luY2x1ZGUgPHhlbi9o
dm0vaHZtX2luZm9fdGFibGUuaD4NCj4+PiAjaW5jbHVkZSA8eGVuL2h2bS9wYXJhbXMuaD4NCj4+
PiANCj4+PiArI2luY2x1ZGUgPHhlbi10b29scy9hcm0tYXJjaC1jYXBhYmlsaXRpZXMuaD4NCj4+
PiAjaW5jbHVkZSA8eGVuLXRvb2xzL2NvbW1vbi1tYWNyb3MuaD4NCj4+PiANCj4+PiAvKiBOZWVk
ZWQgZm9yIFB5dGhvbiB2ZXJzaW9ucyBlYXJsaWVyIHRoYW4gMi4zLiAqLw0KPj4+IEBAIC04OTcs
NyArODk4LDcgQEAgc3RhdGljIFB5T2JqZWN0ICpweXhjX3BoeXNpbmZvKFhjT2JqZWN0ICpzZWxm
KQ0KPj4+ICAgIGlmICggcCAhPSB2aXJ0X2NhcHMgKQ0KPj4+ICAgICAgKihwLTEpID0gJ1wwJzsN
Cj4+PiANCj4+PiAtICAgIHJldHVybiBQeV9CdWlsZFZhbHVlKCJ7czppLHM6aSxzOmksczppLHM6
bCxzOmwsczpsLHM6aSxzOnMsczpzfSIsDQo+Pj4gKyAgICByZXR1cm4gUHlfQnVpbGRWYWx1ZSgi
e3M6aSxzOmksczppLHM6aSxzOmwsczpsLHM6bCxzOmksczpzLHM6cyxzOkl9IiwNCj4+PiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAibnJfbm9kZXMiLCAgICAgICAgIHBpbmZvLm5yX25vZGVz
LA0KPj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICJ0aHJlYWRzX3Blcl9jb3JlIiwgcGlu
Zm8udGhyZWFkc19wZXJfY29yZSwNCj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAiY29y
ZXNfcGVyX3NvY2tldCIsIHBpbmZvLmNvcmVzX3Blcl9zb2NrZXQsDQo+Pj4gQEAgLTkwNyw3ICs5
MDgsMTAgQEAgc3RhdGljIFB5T2JqZWN0ICpweXhjX3BoeXNpbmZvKFhjT2JqZWN0ICpzZWxmKQ0K
Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICJzY3J1Yl9tZW1vcnkiLCAgICAgcGFnZXNf
dG9fa2liKHBpbmZvLnNjcnViX3BhZ2VzKSwNCj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAiY3B1X2toeiIsICAgICAgICAgIHBpbmZvLmNwdV9raHosDQo+Pj4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgImh3X2NhcHMiLCAgICAgICAgICBjcHVfY2FwLA0KPj4+IC0gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgInZpcnRfY2FwcyIsICAgICAgICB2aXJ0X2NhcHMpOw0KPj4+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgInZpcnRfY2FwcyIsICAgICAgICB2aXJ0X2NhcHMs
DQo+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAiYXJtX3N2ZV92bCIsDQo+Pj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGFyY2hfY2FwYWJpbGl0aWVzX2FybV9zdmUocGlu
Zm8uYXJjaF9jYXBhYmlsaXRpZXMpDQo+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICk7DQo+
PiANCj4+IFRoaXMgc2hvdWxkIGJlIGFkZGVkIG9ubHkgd2hlbiBidWlsZGluZyBmb3IgQVJNLCBz
aW1pbGFyIGFzIGZvciBvdGhlcg0KPj4gYmluZGluZ3MuDQo+IA0KPiBIaSBNYXJlaywNCj4gDQo+
IFRoYW5rIHlvdSBmb3IgdGFraW5nIHRoZSB0aW1lIHRvIHJldmlldyB0aGlzLCBhcmUgeW91IG9r
IGlmIEkgbWFrZSB0aGVzZSBjaGFuZ2VzIHRvIHRoZSBjb2RlPw0KPiANCj4gZGlmZiAtLWdpdCBh
L3Rvb2xzL3B5dGhvbi94ZW4vbG93bGV2ZWwveGMveGMuYyBiL3Rvb2xzL3B5dGhvbi94ZW4vbG93
bGV2ZWwveGMveGMuYw0KPiBpbmRleCBiMzY5OWZkYWM1OGUuLmM3ZjY5MDE4OTc3MCAxMDA2NDQN
Cj4gLS0tIGEvdG9vbHMvcHl0aG9uL3hlbi9sb3dsZXZlbC94Yy94Yy5jDQo+ICsrKyBiL3Rvb2xz
L3B5dGhvbi94ZW4vbG93bGV2ZWwveGMveGMuYw0KPiBAQCAtODcyLDYgKzg3Miw4IEBAIHN0YXRp
YyBQeU9iamVjdCAqcHl4Y19waHlzaW5mbyhYY09iamVjdCAqc2VsZikNCj4gICAgIGNvbnN0IGNo
YXIgKnZpcnRjYXBfbmFtZXNbXSA9IHsgImh2bSIsICJwdiIgfTsNCj4gICAgIGNvbnN0IHVuc2ln
bmVkIHZpcnRjYXBzX2JpdHNbXSA9IHsgWEVOX1NZU0NUTF9QSFlTQ0FQX2h2bSwNCj4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgWEVOX1NZU0NUTF9QSFlTQ0FQX3B2IH07
DQo+ICsgICAgUHlPYmplY3QgKm9ianJldDsNCj4gKyAgICBpbnQgcmV0Y29kZTsNCj4gDQo+ICAg
ICBpZiAoIHhjX3BoeXNpbmZvKHNlbGYtPnhjX2hhbmRsZSwgJnBpbmZvKSAhPSAwICkNCj4gICAg
ICAgICByZXR1cm4gcHl4Y19lcnJvcl90b19leGNlcHRpb24oc2VsZi0+eGNfaGFuZGxlKTsNCj4g
QEAgLTg5OCwyMCArOTAwLDMxIEBAIHN0YXRpYyBQeU9iamVjdCAqcHl4Y19waHlzaW5mbyhYY09i
amVjdCAqc2VsZikNCj4gICAgIGlmICggcCAhPSB2aXJ0X2NhcHMgKQ0KPiAgICAgICAqKHAtMSkg
PSAnXDAnOw0KPiANCj4gLSAgICByZXR1cm4gUHlfQnVpbGRWYWx1ZSgie3M6aSxzOmksczppLHM6
aSxzOmwsczpsLHM6bCxzOmksczpzLHM6cyxzOkl9IiwNCj4gLSAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAibnJfbm9kZXMiLCAgICAgICAgIHBpbmZvLm5yX25vZGVzLA0KPiAtICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICJ0aHJlYWRzX3Blcl9jb3JlIiwgcGluZm8udGhyZWFkc19wZXJf
Y29yZSwNCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAiY29yZXNfcGVyX3NvY2tldCIs
IHBpbmZvLmNvcmVzX3Blcl9zb2NrZXQsDQo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAg
Im5yX2NwdXMiLCAgICAgICAgICBwaW5mby5ucl9jcHVzLA0KPiAtICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICJ0b3RhbF9tZW1vcnkiLCAgICAgcGFnZXNfdG9fa2liKHBpbmZvLnRvdGFsX3Bh
Z2VzKSwNCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAiZnJlZV9tZW1vcnkiLCAgICAg
IHBhZ2VzX3RvX2tpYihwaW5mby5mcmVlX3BhZ2VzKSwNCj4gLSAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAic2NydWJfbWVtb3J5IiwgICAgIHBhZ2VzX3RvX2tpYihwaW5mby5zY3J1Yl9wYWdl
cyksDQo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgImNwdV9raHoiLCAgICAgICAgICBw
aW5mby5jcHVfa2h6LA0KPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICJod19jYXBzIiwg
ICAgICAgICAgY3B1X2NhcCwNCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAidmlydF9j
YXBzIiwgICAgICAgIHZpcnRfY2FwcywNCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAi
YXJtX3N2ZV92bCIsDQo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICBhcmNoX2NhcGFi
aWxpdGllc19hcm1fc3ZlKHBpbmZvLmFyY2hfY2FwYWJpbGl0aWVzKQ0KPiArICAgIG9ianJldCA9
IFB5X0J1aWxkVmFsdWUoIntzOmksczppLHM6aSxzOmksczpsLHM6bCxzOmwsczppLHM6cyxzOnN9
IiwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICJucl9ub2RlcyIsICAgICAgICAgcGlu
Zm8ubnJfbm9kZXMsDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAidGhyZWFkc19wZXJf
Y29yZSIsIHBpbmZvLnRocmVhZHNfcGVyX2NvcmUsDQo+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAiY29yZXNfcGVyX3NvY2tldCIsIHBpbmZvLmNvcmVzX3Blcl9zb2NrZXQsDQo+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAibnJfY3B1cyIsICAgICAgICAgIHBpbmZvLm5yX2NwdXMs
DQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAidG90YWxfbWVtb3J5IiwgICAgIHBhZ2Vz
X3RvX2tpYihwaW5mby50b3RhbF9wYWdlcyksDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAiZnJlZV9tZW1vcnkiLCAgICAgIHBhZ2VzX3RvX2tpYihwaW5mby5mcmVlX3BhZ2VzKSwNCj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICJzY3J1Yl9tZW1vcnkiLCAgICAgcGFnZXNfdG9f
a2liKHBpbmZvLnNjcnViX3BhZ2VzKSwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICJj
cHVfa2h6IiwgICAgICAgICAgcGluZm8uY3B1X2toeiwNCj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICJod19jYXBzIiwgICAgICAgICAgY3B1X2NhcCwNCj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICJ2aXJ0X2NhcHMiLCAgICAgICAgdmlydF9jYXBzDQo+ICAgICAgICAgICAgICAg
ICAgICAgICAgICk7DQo+ICsNCj4gKyAgICAjaWYgZGVmaW5lZChfX2FhcmNoNjRfXykNCj4gKyAg
ICAgICAgaWYgKG9ianJldCkgew0KPiArICAgICAgICAgICAgcmV0Y29kZSA9IFB5RGljdF9TZXRJ
dGVtU3RyaW5nKA0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgIG9ianJldCwgImFybV9z
dmVfdmwiLA0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgIGFyY2hfY2FwYWJpbGl0aWVz
X2FybV9zdmUocGluZm8uYXJjaF9jYXBhYmlsaXRpZXMpDQo+ICsgICAgICAgICAgICAgICAgICAg
ICAgICApOw0KPiArICAgICAgICAgICAgaWYgKCByZXRjb2RlIDwgMCApDQo+ICsgICAgICAgICAg
ICAgICAgcmV0dXJuIE5VTEw7DQo+ICsgICAgICAgIH0NCj4gKyAgICAjZW5kaWYNCj4gKw0KPiAr
ICAgIHJldHVybiBvYmpyZXQ7DQo+IH0NCj4gDQo+IHN0YXRpYyBQeU9iamVjdCAqcHl4Y19nZXRj
cHVpbmZvKFhjT2JqZWN0ICpzZWxmLCBQeU9iamVjdCAqYXJncywgUHlPYmplY3QgKmt3ZHMpDQo+
IA0KPiANCj4gUGxlYXNlIG5vdGljZSB0aGF0IG5vdyB3ZSBjYW4gaGF2ZSBhIHBhdGggdGhhdCBj
b3VsZCByZXR1cm4gTlVMTCwgYXJlIHlvdSBvayBmb3INCj4gSXQgb3Igc2hvdWxkIEkganVzdCBp
Z25vcmUgdGhlIHJldHVybiBjb2RlIGZvciBQeURpY3RfU2V0SXRlbVN0cmluZz8NCj4gDQo+IEFs
c28sIGRvIHlvdSB3YW50IG1lIHRvIHByb3RlY3QgdGhlIGluY2x1ZGUgdG8gPHhlbi10b29scy9h
cm0tYXJjaC1jYXBhYmlsaXRpZXMuaD4NCj4gd2l0aCBpZmRlZj8NCj4gDQoNCkVESVQ6IEkgc2F3
IHRoaXMgZG9lc27igJl0IGV2ZW4gY29tcGlsZSwgSSB3aWxsIGFzayBsYXRlciB3aGVuIEkgd2ls
bCBoYXZlIHNvbWV0aGluZyB3b3JraW5nLA0KSSBzYXcgUHlEaWN0X1NldEl0ZW1TdHJpbmcgaXMg
dXNlZCBzb21ld2hlcmUgZWxzZSBzbyBJIHdpbGwgdXNlIHRoYXQgYXBwcm9hY2ggYmVmb3JlDQpQ
cm9wb3NpbmcgeW91IGEgc29sdXRpb24NCg0KDQoNCj4+IA0KPj4+IH0NCj4+PiANCj4+PiBzdGF0
aWMgUHlPYmplY3QgKnB5eGNfZ2V0Y3B1aW5mbyhYY09iamVjdCAqc2VsZiwgUHlPYmplY3QgKmFy
Z3MsIFB5T2JqZWN0ICprd2RzKQ0KPj4gDQo+PiAtLSANCj4+IEJlc3QgUmVnYXJkcywNCj4+IE1h
cmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNraQ0KPj4gSW52aXNpYmxlIFRoaW5ncyBMYWINCg0KDQo=

