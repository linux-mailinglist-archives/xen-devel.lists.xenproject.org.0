Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E436E938F
	for <lists+xen-devel@lfdr.de>; Thu, 20 Apr 2023 14:01:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.524218.814972 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppSyV-0007Xc-6D; Thu, 20 Apr 2023 12:01:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 524218.814972; Thu, 20 Apr 2023 12:01:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppSyV-0007UF-3O; Thu, 20 Apr 2023 12:01:19 +0000
Received: by outflank-mailman (input) for mailman id 524218;
 Thu, 20 Apr 2023 12:01:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8Idg=AL=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1ppSyT-0007U9-HT
 for xen-devel@lists.xenproject.org; Thu, 20 Apr 2023 12:01:17 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20612.outbound.protection.outlook.com
 [2a01:111:f400:7d00::612])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0c664fb4-df73-11ed-8611-37d641c3527e;
 Thu, 20 Apr 2023 14:01:14 +0200 (CEST)
Received: from DU2PR04CA0051.eurprd04.prod.outlook.com (2603:10a6:10:234::26)
 by AM7PR08MB5317.eurprd08.prod.outlook.com (2603:10a6:20b:101::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Thu, 20 Apr
 2023 12:01:11 +0000
Received: from DBAEUR03FT056.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:234:cafe::ac) by DU2PR04CA0051.outlook.office365.com
 (2603:10a6:10:234::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.23 via Frontend
 Transport; Thu, 20 Apr 2023 12:01:11 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT056.mail.protection.outlook.com (100.127.142.88) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6319.25 via Frontend Transport; Thu, 20 Apr 2023 12:01:11 +0000
Received: ("Tessian outbound 3a01b65b5aad:v136");
 Thu, 20 Apr 2023 12:01:11 +0000
Received: from 15006531b184.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 09E57CB8-0153-4205-849A-5066F25DFC7F.1; 
 Thu, 20 Apr 2023 12:01:00 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 15006531b184.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 20 Apr 2023 12:01:00 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AS2PR08MB8381.eurprd08.prod.outlook.com (2603:10a6:20b:558::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.21; Thu, 20 Apr
 2023 12:00:57 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::8e01:7058:6f40:90e1]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::8e01:7058:6f40:90e1%7]) with mapi id 15.20.6319.022; Thu, 20 Apr 2023
 12:00:57 +0000
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
X-Inumbo-ID: 0c664fb4-df73-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gzGnHnbRrqpGWIdkxLYSf6zrAOvAZ4s7dC7fJoJhHfw=;
 b=veRxT9ezyHiAXJE9kV3a0NULlIyrdcMkxVRwqq/sCz5VyT7i99aiIUDL4KhZQszPma4uDCPiwTzJFXSiZ6QQrcTWuwkyMj5lgM6woxMIdMb0EvQJ+h5qoiRNYupTd8N0K/7hOLx9xDdTw3+7/iM2i6878nvBeeaG9MUPZNpndL0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 349c65c05fb1fc8e
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RHbv4dmy21UWDl/0LVMT/r875pOuRMTgkALySlQQkNvh86h42/S9mHp0SD7g9jIloV4hTZFMX0/aL+wYNak2a/nrt/g6ViKUi0mvovYmDwxyS9eYbmr9Ikv/sMVJFoB5IakmFjE8Bnvgh0nwf0JeqbWqvDEQ9tShloHbMc44EOVNx0AijGFkz8eNsarHDj6NqrQ/1vorvwlMcf8hD6z3fyHSV9CBv4zS1B19DjgfJXb4Gfp9wvg7TzzWBm7f0xGFRN5TQ//GaTkaB3TOsMX2GxsaAX4sKYCmFnqg6Cmd51rZsRdkCjgXGeggq1IldlQp9dlp9mOq5wH5AwCkzzdHwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gzGnHnbRrqpGWIdkxLYSf6zrAOvAZ4s7dC7fJoJhHfw=;
 b=Ex85n6YYzkGYCRGL45+HXUUDjp9z88+s1yvIo1NTmc9Ie34OcjOyrl/Tr1eB44uY+OiZotfRSvckDmr39B9kigZycl7sEj3AGq0M+MCO3ccTqzk7dPkSsDq5VSXqiOekbUqR/YeSilXU5MGIDMymGqNu3msaOTAGyybqDpcBymRDqvZAhmdZPXS9nthwMGfScxd4U9iRF8M/stFaax68OpWh/Fh+qO03MnnCJlIUimdorrsZ8X2Je4DJtdOiMa5nqgjN5KB0Amzy1A5ys0y3/OY/0cSm9nUa7dwsPvxPCbq9gb3n022wryGHxaHzuxIH/GtgJHOWX7bU9pPEg7+v3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gzGnHnbRrqpGWIdkxLYSf6zrAOvAZ4s7dC7fJoJhHfw=;
 b=veRxT9ezyHiAXJE9kV3a0NULlIyrdcMkxVRwqq/sCz5VyT7i99aiIUDL4KhZQszPma4uDCPiwTzJFXSiZ6QQrcTWuwkyMj5lgM6woxMIdMb0EvQJ+h5qoiRNYupTd8N0K/7hOLx9xDdTw3+7/iM2i6878nvBeeaG9MUPZNpndL0=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Luca Fancellu <Luca.Fancellu@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v5 07/12] xen: enable Dom0 to use SVE feature
Thread-Topic: [PATCH v5 07/12] xen: enable Dom0 to use SVE feature
Thread-Index:
 AQHZbSQxHdlbNP/OhU+SnBXlOek6la8xDZGAgAE1nQCAAAF/gIAABdgAgAGkXACAADZRAA==
Date: Thu, 20 Apr 2023 12:00:56 +0000
Message-ID: <24B35030-092A-493F-AC78-52732746FA63@arm.com>
References: <20230412094938.2693890-1-luca.fancellu@arm.com>
 <20230412094938.2693890-8-luca.fancellu@arm.com>
 <2833DC4A-95F0-482A-AD0F-3E942D1DA223@arm.com>
 <F30CEF99-693A-4218-AC80-433A183DE866@arm.com>
 <3DE2B914-FA6E-49EF-8748-BB8DE4B2CC11@arm.com>
 <8DA3FECA-DEBD-479E-9E5A-57676B98ADA4@arm.com>
 <DE00F3DB-C6D9-4D90-97A8-FD964FD03099@arm.com>
In-Reply-To: <DE00F3DB-C6D9-4D90-97A8-FD964FD03099@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|AS2PR08MB8381:EE_|DBAEUR03FT056:EE_|AM7PR08MB5317:EE_
X-MS-Office365-Filtering-Correlation-Id: fce1ee73-fa2f-4cc6-df9e-08db4196eef4
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 ISSNA85t0pfbPCN/ETvnNZoC7d4LgVF2o04L+qUGKmaVKH89p3T9yOuSetIfg0VnUcGZWtVhAsD34PzRYlab+x7S2OZiYnM0MJh+O5OW6iZwclInlJVj0dX83ujIQoPsJnTgtlaK+HyyHyUwRPJPXGy8V/zVmlsRyv4ud5PPDcOeL3FOldDZg5WTnwbAzlCfFk8t1/y2f9TMGa/1nXu4UMAuCf3+1i4hSNlTkLxHY+Kdr7cCvMwDgKzN1WHxBCNKBdxBYro4+F/EOpXC5/grVloOPa64MeQYSXmcKDolwm6Te5GJLFzVcGtgy82TP7W1HjYrJPjtCM5o8eGrbAKWjxDcb2sEN7+luu0YbqrE2TdvyBNxsWZcsmTuv6rWTR+Ou8LFM/OVRjcDGA6doFcFyYu1GKMdcwb/vnELAk9pQa5aXfbwfq7s6L1Q2siHf+BsJrDtVHcH3M6gLKTN16IX5cz0ayZWvPCfrZJsrXX4dnR1Cha0cR/GC6+CnnGGcpJGvKIl0OeSo46Bj75XMgAHlHHeMabdz/OJnAItZuIra+LWrvbLC0nHCMbEL4onvomMK4avCam/4bUPfERQjc8tI7oAyrkQHGcfBsX6Gyidc2eUo7t392PCjJW/X38Kj8SiLbNUNgYO+metm86uv1Geg/cTZ2QEywp+scS8j6JturU=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(396003)(39850400004)(376002)(136003)(346002)(451199021)(83380400001)(6512007)(53546011)(6506007)(41300700001)(122000001)(6486002)(71200400001)(2616005)(186003)(91956017)(478600001)(33656002)(4326008)(66476007)(6636002)(76116006)(66556008)(316002)(64756008)(66946007)(66446008)(5660300002)(37006003)(54906003)(38070700005)(36756003)(86362001)(2906002)(8936002)(6862004)(8676002)(38100700002)(21314003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <9EA39343E09B144097F1BEAA562FDBAD@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8381
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b7ecf22b-e438-428b-8034-08db4196e625
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WzZoKAPfWhdwICrkWtBTzfVbA8d7Vp2ZE6tRTK2RIZBbzHW/qnis8UdAwcuzYUn5QWViHXWEH9SgRfI1FuD84oa2GtgnH7gRUR/Lohiyuiw3orXtUib67yYRu+/66+LmE2IO+yX+oHnr3xguyzUWDiXhgD2XeIPP76gYYLDawCEexXamIrLqHk/jqumj8FzTCXlr2MPHx41St1N6RjOl/UI+1WtBULFJ2+M+SJU3VE9leQ+9YnYQJYiJVNjTR129lNrVlG1DYGu7uBQoYwn5Gg/cBkV9ObCW43lttY5Iif4vS3X1VJrjsA30A8Rp1gQqmNWf8/fTLLX7/SsTFoN05gbvbwyiDW5fsPl2DNJd9GBxBY04GEnJfudPKAPmpPVgS5o6opuRumEIuZrwV0iWe8Kvo51/POrYCr2j3BC7o72gnfDBz0Pacuc4lZv5SjtTtfxFk4w4sX129onbAbIDX97cgeM01czyTSDNhq/NQ9HTPYFww+XUop21YLRUUYNVVN5BOJAAiGttPjL855YlXGY959Ps5QMkCQcLCY5W5tuNFilQkSBRQWBrQxj/Auk6T975Q+ufQE/nC5XkqDJ4hajMqjgx+szH53FFlmPMMkLVGWtUOXpu+2/ELmS10Xw/0+PdJ7QS3AJEmVlFcSTmPalmHSJUVFyWCoS3AX4UkX1fm0JO2Qf38SI9oKuvy3zpgL1OZQ0kPJGBeS0C3E0ZZZCXL30Pva/7+X3QRf8qiv0=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(346002)(39850400004)(136003)(376002)(396003)(451199021)(36840700001)(40470700004)(46966006)(186003)(6506007)(6512007)(53546011)(26005)(6486002)(107886003)(40480700001)(5660300002)(316002)(47076005)(2616005)(336012)(4326008)(41300700001)(70206006)(6636002)(70586007)(8936002)(8676002)(82740400003)(37006003)(6862004)(54906003)(82310400005)(478600001)(2906002)(86362001)(40460700003)(36756003)(33656002)(81166007)(83380400001)(36860700001)(356005)(21314003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2023 12:01:11.2826
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fce1ee73-fa2f-4cc6-df9e-08db4196eef4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5317

SGkgTHVjYSwNCg0KPiBPbiAyMCBBcHIgMjAyMywgYXQgMTA6NDYsIEx1Y2EgRmFuY2VsbHUgPEx1
Y2EuRmFuY2VsbHVAYXJtLmNvbT4gd3JvdGU6DQo+IA0KPj4+Pj4+IA0KPj4+Pj4+ICtpbnQgX19p
bml0IHN2ZV9zYW5pdGl6ZV92bF9wYXJhbShpbnQgdmFsLCB1bnNpZ25lZCBpbnQgKm91dCkNCj4+
Pj4+PiArew0KPj4+Pj4+ICsgICAgLyoNCj4+Pj4+PiArICAgICAqIE5lZ2F0aXZlIFNWRSBwYXJh
bWV0ZXIgdmFsdWUgbWVhbnMgdG8gdXNlIHRoZSBtYXhpbXVtIHN1cHBvcnRlZA0KPj4+Pj4+ICsg
ICAgICogdmVjdG9yIGxlbmd0aCwgb3RoZXJ3aXNlIGlmIGEgcG9zaXRpdmUgdmFsdWUgaXMgcHJv
dmlkZWQsIGNoZWNrIGlmIHRoZQ0KPj4+Pj4+ICsgICAgICogdmVjdG9yIGxlbmd0aCBpcyBhIG11
bHRpcGxlIG9mIDEyOCBhbmQgbm90IGJpZ2dlciB0aGFuIHRoZSBtYXhpbXVtIHZhbHVlDQo+Pj4+
Pj4gKyAgICAgKiAyMDQ4DQo+Pj4+Pj4gKyAgICAgKi8NCj4+Pj4+PiArICAgIGlmICggdmFsIDwg
MCApDQo+Pj4+Pj4gKyAgICAgICAgKm91dCA9IGdldF9zeXNfdmxfbGVuKCk7DQo+Pj4+Pj4gKyAg
ICBlbHNlIGlmICggKCh2YWwgJSBTVkVfVkxfTVVMVElQTEVfVkFMKSA9PSAwKSAmJiAodmFsIDw9
IFNWRV9WTF9NQVhfQklUUykgKQ0KPj4+Pj4+ICsgICAgICAgICpvdXQgPSB2YWw7DQo+Pj4+PiAN
Cj4+Pj4+IFNob3VsZG4ndCB5b3UgYWxzbyBjaGVjayBpZiBpdCBpcyBub3QgZ3JlYXRlciB0aGFu
IHRoZSBtYXhpbXVtIHZlY3RvciBsZW5ndGggPw0KPj4+PiANCj4+Pj4gSSBkb27igJl0IHVuZGVy
c3RhbmQsIEkgYW0gY2hlY2tpbmcgdGhhdCB0aGUgdmFsdWUgaXMgYmVsb3cgb3IgZXF1YWwgdG8g
U1ZFX1ZMX01BWF9CSVRTLA0KPj4+PiBJZiB5b3UgbWVhbiBpZiBpdCBzaG91bGQgYmUgY2hlY2tl
ZCBhbHNvIGFnYWluc3QgdGhlIG1heGltdW0gc3VwcG9ydGVkIGxlbmd0aCBieSB0aGUgcGxhdGZv
cm0sDQo+Pj4+IEkgdGhpbmsgdGhpcyBpcyBub3QgdGhlIHJpZ2h0IHBsYWNlLCB0aGUgY2hlY2sg
aXMgYWxyZWFkeSBpbiBhcmNoX3Nhbml0aXNlX2RvbWFpbl9jb25maWcoKSwgaW50cm9kdWNlZA0K
Pj4+PiBpbiBwYXRjaCAjMg0KPj4+IA0KPj4+IElmIHRoaXMgaXMgbm90IHRoZSByaWdodCBwbGFj
ZSB0byBjaGVjayBpdCB0aGVuIHdoeSBjaGVja2luZyB0aGUgcmVzdCBoZXJlID8NCj4+PiANCj4+
PiBGcm9tIGEgdXNlciBvciBhIGRldmVsb3BlciBwb2ludCBvZiB2aWV3IEkgd291bGQgZXhwZWN0
IHRoZSB2YWxpZGl0eSBvZiB0aGUgaW5wdXQgdG8gYmUgY2hlY2tlZCBvbmx5DQo+Pj4gaW4gb25l
IHBsYWNlLg0KPj4+IElmIGhlcmUgaXMgbm90IHRoZSBwbGFjZSBmb3IgdGhhdCBpdCBpcyBvayBi
dXQgdGhlbiBpIHdvdWxkIGNoZWNrIGV2ZXJ5dGhpbmcgaW4gYXJjaF9zYW5pdGlzZV9kb21haW5f
Y29uZmlnDQo+Pj4gKG11bHRpcGxlLCBtaW4gYW5kIHN1cHBvcnRlZCkgaW5zdGVhZCBvZiBkb2lu
ZyBpdCBwYXJ0bHkgaW4gMiBwbGFjZXMuDQo+PiANCj4+IE9rLCBnaXZlbiB0aGUgd2F5IHdlIGVu
Y29kZWQgdGhlIHZhbHVlIGluIHhlbl9kb21jdGxfY3JlYXRlZG9tYWluIHN0cnVjdHVyZSwgd2Ug
aGF2ZSB0aGF0IHRoZSB2YWx1ZSB0YWtlcw0KPj4gdmVyeSBsaXR0bGUgc3BhY2UsIGJ1dCBhIHNt
YWxsIGlzc3VlIGlzIHRoYXQgd2hlbiB3ZSBlbmNvZGUgaXQsIHdlIGFyZSBkaXZpZGluZyBpdCBi
eSAxMjgsIHdoaWNoIGlzIGZpbmUgZm9yIHVzZXIgcGFyYW1zDQo+PiB0aGF0IGFyZSBtdWx0aXBs
ZSBvZiAxMjgsIGJ1dCBpdOKAmXMgbGVzcyBmaW5lIGlmIHRoZSB1c2VyIHBhc3NlcyDigJwxMjni
gJ0uDQo+PiANCj4+IFRvIG92ZXJjb21lIHRoaXMgaXNzdWUgd2UgYXJlIGNoZWNraW5nIHRoZSB2
YWx1ZSB3aGVuIGl0IGlzIG5vdCBhbHJlYWR5IGVuY29kZWQuIE5vdywgdGhpbmtpbmcgYWJvdXQg
aXQsIHRoZSBjaGVjaw0KPj4gIiYmICh2YWwgPD0gU1ZFX1ZMX01BWF9CSVRTKeKAnSBpcyBub3Qg
cmVhbGx5IG5lZWRlZCwgYmVjYXVzZSBldmVuIGlmIHRoZSB2YWx1ZSBpcyBhYm92ZSwgdGhlbiBp
biBhcmNoX3Nhbml0aXNlX2RvbWFpbl9jb25maWcNCj4+IHdlIHdpbGwgaGl0IHRoZSB0b3AgbGlt
aXQgb2YgdGhlIHBsYXRmb3JtIG1heGltdW0gVkwuDQo+PiANCj4+IGludCBhcmNoX3Nhbml0aXNl
X2RvbWFpbl9jb25maWcoc3RydWN0IHhlbl9kb21jdGxfY3JlYXRlZG9tYWluICpjb25maWcpDQo+
PiB7DQo+PiAgIHVuc2lnbmVkIGludCBtYXhfdmNwdXM7DQo+PiAgIHVuc2lnbmVkIGludCBmbGFn
c19yZXF1aXJlZCA9IChYRU5fRE9NQ1RMX0NERl9odm0gfCBYRU5fRE9NQ1RMX0NERl9oYXApOw0K
Pj4gICB1bnNpZ25lZCBpbnQgZmxhZ3Nfb3B0aW9uYWwgPSAoWEVOX0RPTUNUTF9DREZfaW9tbXUg
fCBYRU5fRE9NQ1RMX0NERl92cG11KTsNCj4+ICAgdW5zaWduZWQgaW50IHN2ZV92bF9iaXRzID0g
c3ZlX2RlY29kZV92bChjb25maWctPmFyY2guc3ZlX3ZsKTsNCj4+IA0KPj4gICBpZiAoIChjb25m
aWctPmZsYWdzICYgfmZsYWdzX29wdGlvbmFsKSAhPSBmbGFnc19yZXF1aXJlZCApDQo+PiAgIHsN
Cj4+ICAgICAgIGRwcmludGsoWEVOTE9HX0lORk8sICJVbnN1cHBvcnRlZCBjb25maWd1cmF0aW9u
ICUjeFxuIiwNCj4+ICAgICAgICAgICAgICAgY29uZmlnLT5mbGFncyk7DQo+PiAgICAgICByZXR1
cm4gLUVJTlZBTDsNCj4+ICAgfQ0KPj4gDQo+PiAgIC8qIENoZWNrIGZlYXR1cmUgZmxhZ3MgKi8N
Cj4+ICAgaWYgKCBzdmVfdmxfYml0cyA+IDAgKQ0KPj4gICB7DQo+PiAgICAgICB1bnNpZ25lZCBp
bnQgemNyX21heF9iaXRzID0gZ2V0X3N5c192bF9sZW4oKTsNCj4+IA0KPj4gICAgICAgaWYgKCAh
emNyX21heF9iaXRzICkNCj4+ICAgICAgIHsNCj4+ICAgICAgICAgICBkcHJpbnRrKFhFTkxPR19J
TkZPLCAiU1ZFIGlzIHVuc3VwcG9ydGVkIG9uIHRoaXMgbWFjaGluZS5cbiIpOw0KPj4gICAgICAg
ICAgIHJldHVybiAtRUlOVkFMOw0KPj4gICAgICAgfQ0KPj4gDQo+PiAgICAgICBpZiAoIHN2ZV92
bF9iaXRzID4gemNyX21heF9iaXRzICkNCj4+ICAgICAgIHsNCj4+ICAgICAgICAgICBkcHJpbnRr
KFhFTkxPR19JTkZPLA0KPj4gICAgICAgICAgICAgICAgICAgIlJlcXVlc3RlZCBTVkUgdmVjdG9y
IGxlbmd0aCAoJXUpID4gc3VwcG9ydGVkIGxlbmd0aCAoJXUpXG4iLA0KPj4gICAgICAgICAgICAg
ICAgICAgc3ZlX3ZsX2JpdHMsIHpjcl9tYXhfYml0cyk7DQo+PiAgICAgICAgICAgcmV0dXJuIC1F
SU5WQUw7DQo+PiAgICAgICB9DQo+PiAgIH0NCj4+ICBbLi4uXQ0KPj4gDQo+PiBOb3csIEkgdW5k
ZXJzdGFuZCB5b3VyIHBvaW50LCB3ZSBjb3VsZCBjaGVjayBldmVyeXRoaW5nIGluIHN2ZV9zYW5p
dGl6ZV92bF9wYXJhbSgpLCBidXQgaXQgd291bGQgbGVhdmUgYSBwcm9ibGVtDQo+PiBmb3IgZG9t
YWlucyBjcmVhdGVkIGJ5IGh5cGVyY2FsbHMgaWYgSSBhbSBub3Qgd3JvbmcuDQo+PiANCj4+IFdo
YXQgZG8geW91IHRoaW5rPw0KDQpTb3JyeSBpIG1pc3NlZCB0aGF0IGFuc3dlci4NCg0KWWVzIGkg
YWdyZWUsIG1heWJlIHdlIGNvdWxkIGZhY3Rvcml6ZSB0aGUgY2hlY2tzIGluIG9uZSBmdW5jdGlv
biBhbmQgdXNlIGl0IGluIHNldmVyYWwgcGxhY2VzID8NCg0KDQo+IA0KPiBJIHRob3VnaHQgYWJv
dXQgdGhhdCBhbmQgYW5vdGhlciBwb3NzaWJpbGl0eSBpcyB0byBzdG9yZSDigJxzdmVfdmzigJ0g
YXMgdWludDE2X3QgaW5zaWRlIHN0cnVjdCB4ZW5fYXJjaF9kb21haW5jb25maWcsIGFuZA0KPiBj
aGVjayBpdCBpbnNpZGUgYXJjaF9zYW5pdGlzZV9kb21haW5fY29uZmlnKCkgZm9yIGl0IHRvIGJl
IG1vZCAxMjggYW5kIGxlc3MgdGhhbiB0aGUgbWF4IHN1cHBvcnRlZCBWTCwgdGhpcyB3aWxsDQo+
IGFsbG93IHRvIGhhdmUgYWxsIHRoZSBjaGVja3MgaW4gb25lIHBsYWNlLCB0YWtpbmcgYSBiaXQg
bW9yZSBzcGFjZSwgYW55d2F5IHdlIHdvdWxkIHRha2UgdGhlIHNwYWNlIGZyb20gdGhlIGltcGxp
Y2l0DQo+IHBhZGRpbmcgYXMgdGhpcyBpcyB0aGUgY3VycmVudCBzdGF0dXM6DQo+IA0KPiBzdHJ1
Y3QgYXJjaF9kb21haW4gew0KPiBlbnVtIGRvbWFpbl90eXBlICAgICAgICAgICB0eXBlOyAgICAg
ICAgICAgICAgICAgLyogICAgIDAgICAgIDQgKi8NCj4gdWludDhfdCAgICAgICAgICAgICAgICAg
ICAgc3ZlX3ZsOyAgICAgICAgICAgICAgIC8qICAgICA0ICAgICAxICovDQo+IA0KPiAvKiBYWFgg
MyBieXRlcyBob2xlLCB0cnkgdG8gcGFjayAqLw0KPiANCj4gc3RydWN0IHAybV9kb21haW4gICAg
ICAgICAgcDJtOyAgICAgICAgICAgICAgICAgIC8qICAgICA4ICAgMzI4ICovDQo+IC8qIC0tLSBj
YWNoZWxpbmUgNSBib3VuZGFyeSAoMzIwIGJ5dGVzKSB3YXMgMTYgYnl0ZXMgYWdvIC0tLSAqLw0K
PiBzdHJ1Y3QgaHZtX2RvbWFpbiAgICAgICAgICBodm07ICAgICAgICAgICAgICAgICAgLyogICAz
MzYgICAzMTIgKi8NCj4gLyogLS0tIGNhY2hlbGluZSAxMCBib3VuZGFyeSAoNjQwIGJ5dGVzKSB3
YXMgOCBieXRlcyBhZ28gLS0tICovDQo+IHN0cnVjdCBwYWdpbmdfZG9tYWluICAgICAgIHBhZ2lu
ZzsgICAgICAgICAgICAgICAvKiAgIDY0OCAgICAzMiAqLw0KPiBzdHJ1Y3Qgdm1taW8gICAgICAg
ICAgICAgICB2bW1pbzsgICAgICAgICAgICAgICAgLyogICA2ODAgICAgMzIgKi8NCj4gLyogLS0t
IGNhY2hlbGluZSAxMSBib3VuZGFyeSAoNzA0IGJ5dGVzKSB3YXMgOCBieXRlcyBhZ28gLS0tICov
DQo+IHVuc2lnbmVkIGludCAgICAgICAgICAgICAgIHJlbF9wcml2OyAgICAgICAgICAgICAvKiAg
IDcxMiAgICAgNCAqLw0KPiANCj4gLyogWFhYIDQgYnl0ZXMgaG9sZSwgdHJ5IHRvIHBhY2sgKi8N
Cj4gDQo+IHN0cnVjdCB7DQo+IHVpbnQ2NF90ICAgICAgICAgICBvZmZzZXQ7ICAgICAgICAgICAg
ICAgLyogICA3MjAgICAgIDggKi8NCj4gc190aW1lX3QgICAgICAgICAgIG5hbm9zZWNvbmRzOyAg
ICAgICAgICAvKiAgIDcyOCAgICAgOCAqLw0KPiB9IHZpcnRfdGltZXJfYmFzZTsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgLyogICA3MjAgICAgMTYgKi8NCj4gc3RydWN0IHZnaWNfZGlz
dCAgICAgICAgICAgdmdpYzsgICAgICAgICAgICAgICAgIC8qICAgNzM2ICAgMjAwICovDQo+IA0K
PiAvKiBYWFggbGFzdCBzdHJ1Y3QgaGFzIDIgYnl0ZXMgb2YgcGFkZGluZyAqLw0KPiANCj4gLyog
LS0tIGNhY2hlbGluZSAxNCBib3VuZGFyeSAoODk2IGJ5dGVzKSB3YXMgNDAgYnl0ZXMgYWdvIC0t
LSAqLw0KPiBzdHJ1Y3QgdnVhcnQgICAgICAgICAgICAgICB2dWFydDsgICAgICAgICAgICAgICAg
LyogICA5MzYgICAgMzIgKi8NCj4gLyogLS0tIGNhY2hlbGluZSAxNSBib3VuZGFyeSAoOTYwIGJ5
dGVzKSB3YXMgOCBieXRlcyBhZ28gLS0tICovDQo+IHVuc2lnbmVkIGludCAgICAgICAgICAgICAg
IGV2dGNobl9pcnE7ICAgICAgICAgICAvKiAgIDk2OCAgICAgNCAqLw0KPiBzdHJ1Y3Qgew0KPiB1
aW50OF90ICAgICAgICAgICAgcHJpdmlsZWdlZF9jYWxsX2VuYWJsZWQ6MTsgLyogICA5NzI6IDAg
IDEgKi8NCj4gfSBtb25pdG9yOyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IC8qICAgOTcyICAgICAxICovDQo+IA0KPiAvKiBYWFggMyBieXRlcyBob2xlLCB0cnkgdG8gcGFj
ayAqLw0KPiANCj4gc3RydWN0IHZwbDAxMSAgICAgICAgICAgICAgdnBsMDExOyAgICAgICAgICAg
ICAgIC8qICAgOTc2ICAgIDcyICovDQo+IA0KPiAvKiBzaXplOiAxMTUyLCBjYWNoZWxpbmVzOiAx
OCwgbWVtYmVyczogMTMgKi8NCj4gLyogc3VtIG1lbWJlcnM6IDEwMzgsIGhvbGVzOiAzLCBzdW0g
aG9sZXM6IDEwICovDQo+IC8qIHBhZGRpbmc6IDEwNCAqLw0KPiAvKiBwYWRkaW5nczogMSwgc3Vt
IHBhZGRpbmdzOiAyICovDQo+IH0gX19hdHRyaWJ1dGVfXygoX19hbGlnbmVkX18oMTI4KSkpOw0K
DQpUaGF0IHdvdWxkIHdvcmsgYnV0IGl0IGlzIGEgYml0IG9kZCB0byBzYXZlIGEgMTZiaXQgdmFs
dWUganVzdCBzbw0KeW91IGNvdWxkIHNhdmUgaW52YWxpZCB2YWx1ZXMgYW5kIGdpdmUgYW4gZXJy
b3IuDQoNCkNoZWVycw0KQmVydHJhbmQNCg0KDQo=

