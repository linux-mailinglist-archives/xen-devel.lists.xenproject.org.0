Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53BF8732834
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jun 2023 09:00:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.550020.858886 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qA3R3-0003dl-14; Fri, 16 Jun 2023 06:59:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 550020.858886; Fri, 16 Jun 2023 06:59:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qA3R2-0003bi-US; Fri, 16 Jun 2023 06:59:52 +0000
Received: by outflank-mailman (input) for mailman id 550020;
 Fri, 16 Jun 2023 06:59:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aRwf=CE=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1qA3R0-0003ba-SY
 for xen-devel@lists.xenproject.org; Fri, 16 Jun 2023 06:59:50 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2060c.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::60c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 628b24e4-0c13-11ee-b232-6b7b168915f2;
 Fri, 16 Jun 2023 08:59:49 +0200 (CEST)
Received: from DU2PR04CA0232.eurprd04.prod.outlook.com (2603:10a6:10:2b1::27)
 by DB9PR08MB8412.eurprd08.prod.outlook.com (2603:10a6:10:3d4::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.29; Fri, 16 Jun
 2023 06:59:39 +0000
Received: from DBAEUR03FT026.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2b1:cafe::96) by DU2PR04CA0232.outlook.office365.com
 (2603:10a6:10:2b1::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.25 via Frontend
 Transport; Fri, 16 Jun 2023 06:59:39 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT026.mail.protection.outlook.com (100.127.142.242) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6521.12 via Frontend Transport; Fri, 16 Jun 2023 06:59:39 +0000
Received: ("Tessian outbound 945aec65ec65:v136");
 Fri, 16 Jun 2023 06:59:39 +0000
Received: from ba5edfc41ffd.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 75178AE5-2139-4351-8E83-98DAD8553F7C.1; 
 Fri, 16 Jun 2023 06:59:29 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ba5edfc41ffd.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 16 Jun 2023 06:59:29 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by PA4PR08MB6142.eurprd08.prod.outlook.com (2603:10a6:102:ee::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.25; Fri, 16 Jun
 2023 06:59:27 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::ed0b:5730:a1f9:577b]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::ed0b:5730:a1f9:577b%5]) with mapi id 15.20.6500.029; Fri, 16 Jun 2023
 06:59:26 +0000
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
X-Inumbo-ID: 628b24e4-0c13-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=geJ4ck+wDlAjV+Rj2So2JTHgIvF3DbzfN5ItGQdb12s=;
 b=mqGuds1lIH6X3M4wM9kY2x4L99TyS8rFPF23CbEwxqeCxTdcuP+QLZR4s5YTfeOiAuyuza3merG2qL6QiixUtkNKEppeJUX1YC2S7/UKRqR7NfPCuRiTRAeaX9K/ZpcujZtwNX0VO5tN7ZfKDSUQb+JBnZSl7rz3ZXPQaotBSco=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 30126feacc87242a
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ry8YOvNysz6OwX9GpUq6LgCNuUvW58V7PAxAdrZL+qBtaDesQuck2NPQ0/UR6D1ZmOvEeLHZY2kP+VZhth95f2EgMpf4I1/lkZtu1oMVJNBD7+G+S+/2dzhb17g52cG5a8bXI77S2QtxrFuFjs2hdkITp78mQeQk/+V4+xnpoZFJXkzgh64N0w19tlJWDnz8XcUOsHV5TcEzUk7E5PFDzLnTXwS7YVoDepo0WatuWdoCTE0V6J59wg/0tzSGY0OyeZtq1QGwyHcMBZ/CRxg+fbHCbPlX+93buPVu01oB4x4PbCFUE+B4y+YLYMS12TsHUbNPOjHU16N1LrfMgX5/4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=geJ4ck+wDlAjV+Rj2So2JTHgIvF3DbzfN5ItGQdb12s=;
 b=QM2CgY4w8z58KPbzWAx/QqS9pmgeuUg44Hw32TgWimAPkd/gQAOeP26CzyQ3/efsfCjuCNsTurN+bBOWWC6j1x0gEmoEhAtDXoIixwxBIde26KNEVy28hmYa4VZCjY1WdFl6Wu9XzX8e7E1+wM6Asl7TYxSooLc1dDExfk16CQH8107Mcf00eYEkPuLyQNmAf5rwCjenoOGGNFkz0vd4mjmi8jKAkP37QR7FM3UAoaNVbhJ8M4cOcYnAsce7IwE6fY9RTitlPM7kk7uoMeWX5B+AcZMNj7E1zGCiHmrTUBqUoPXigK2/nz6XsqnEoi7BzP6WmhNn34IKgPpcTBrkdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=geJ4ck+wDlAjV+Rj2So2JTHgIvF3DbzfN5ItGQdb12s=;
 b=mqGuds1lIH6X3M4wM9kY2x4L99TyS8rFPF23CbEwxqeCxTdcuP+QLZR4s5YTfeOiAuyuza3merG2qL6QiixUtkNKEppeJUX1YC2S7/UKRqR7NfPCuRiTRAeaX9K/ZpcujZtwNX0VO5tN7ZfKDSUQb+JBnZSl7rz3ZXPQaotBSco=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	"andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
	"roger.pau@citrix.com" <roger.pau@citrix.com>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, "roberto.bagnara@bugseng.com"
	<roberto.bagnara@bugseng.com>, Stefano Stabellini
	<stefano.stabellini@amd.com>
Subject: Re: [PATCH v2] xen/misra: add rules 1.4 and 2.1
Thread-Topic: [PATCH v2] xen/misra: add rules 1.4 and 2.1
Thread-Index: AQHZn9A+0YpNQKb1cEue9Yb+wSfzh6+NAIAA
Date: Fri, 16 Jun 2023 06:59:26 +0000
Message-ID: <FB0559AE-E996-40B5-89FF-4F96AF97E534@arm.com>
References: <20230615212716.1330929-1-sstabellini@kernel.org>
In-Reply-To: <20230615212716.1330929-1-sstabellini@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|PA4PR08MB6142:EE_|DBAEUR03FT026:EE_|DB9PR08MB8412:EE_
X-MS-Office365-Filtering-Correlation-Id: 330186ac-fb09-4346-50c6-08db6e37410e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 zY51RAAW9blQM7EnzZ156N9Yu+k7Kta/6NEfx4hPVP24XLGNZaIHoYtWwDWld0lT/m86DzDiFK0et7R1bJUosLZmger23uLgDKzQsdAc5HqgA1ULlfH/18mz40Q4Ww29SYueq/ae2KoA1yE8TtUrnUX4+KazhKBR2UeFj0TWtMDXjOahbA7Kwb9/aGJX1C9Y9wSwpbUsCs50ZrqlCpofg4MDQrJHstOAHcq9BZZvGHb2+OSrbKQ5SLfe+T7NxjXjQvVrfZaGIWJz5g5Fu8PdeDY1RnWYYIyr6zp8fGmCKnPpY0Z1RlmNDi/gjuSKVmIVL4fXxNUob4eO/caIZ3AAc8Qm/FvYUwL5krGtHE7jMQ1ptQGbQoE/7W9SEmxV1IC2MoL1nmI3N7+fKRomws4p5pGJxTxaycIEQE066GQGTiHwk4An8VQGvtYgLe97S3F7SbmJJvCOz2NTiyFAPxyUsy01pTBcc2V511qvtzrhTmsyI86B9CJXzz0Jx+q0wUYJsBZSzKzxK5fdYpG0C9v624MVIb+7exhjFlB6JB0lIkVc0Oo4vP4AtdSIaqFfP9QqLNtLtpbG4Uaml/+9O+BwEcfDJD+0NykrQLebp5n4w/xBRNTzPh798ME53Rsuhtp9yBBs3nxl/9I5mGWYTkIHsVt0JMQ6R2f1XuCQ7Eb4eZo=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(136003)(396003)(346002)(366004)(451199021)(83380400001)(2906002)(2616005)(36756003)(86362001)(38070700005)(33656002)(38100700002)(122000001)(54906003)(8936002)(8676002)(6486002)(316002)(41300700001)(5660300002)(478600001)(66946007)(76116006)(91956017)(66556008)(66476007)(66446008)(4326008)(71200400001)(64756008)(6916009)(6512007)(53546011)(26005)(186003)(6506007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <E641E5B61BF7C1419EA22C432DEE6D49@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6142
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5b8ea8ae-7257-4eb9-2817-08db6e373962
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	z2Vec8nLNT+/PFs+S9ISiyPg4xUNM3tOUce0SX29xx531erEBZANRwg+2Mn9n5AnVOsC55cfoeeguatdPPlS1Fmxvx1hDPQ3c2h12Afn8WTuJ1sGeSJhXx54/jtHEJFCT5eM4WvIFuil09QRVLo9fVNDjjqVkU7l/F2WsDauzmFESkXpg/9caQ09kJK9/EUXSSGRp6dT+PpjDu6eUu+o+YHbZYl7kVyLpWCZyTv7YdJFpg2BwvkXpD+4L9GYJ0ZcFh8MbG1m0xAg79eaBtRsAJv+jAtHPchnUWc9goh9FCrxlnoqnnegqa3ZPuezAJfCHqJ+r41UMkn3yeDr/O0D5qJCQgmT19/Yl9ZhwOOKpMRXDzZGpG7KdKlM10kn1uLZkzFkGE7NlApn/NuolLP2X9qKP5Wd6GcLo0r5mEXl9O6queBZmKL+uBxczX6T8PmcMPg4atjZTEiDXso0cdbKayUTPc8Ehl2hkuD+iGjnonrWl/H3FeVFlvy1TQ1P2ZUQaFHVAv2IgV1UHReBkqtsqBdKgLJHnjncNpQDS9K/PyTCQ5nP6kwboVgRWQpdPrQlKkJnBL2Xei7nnPATrlPGqtGNxoBlFcXGeFe71GSu6SBXqI00ZTTfZ/nuHshAV1KAqAxMDi6/cu2uDDG/n8EMPGW8WT7dw/k++9uKjx2JvZBgdvXHiyWG++d8/8jMRWO0HL8Z6DYAiTnuysBfx9DbQp6yBdVe2+Kfwtf52JIpQuRzwlugFjJde09u7TwqIFJezLvqVr27v9xftmRfyVXvsw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(376002)(346002)(396003)(451199021)(36840700001)(46966006)(40470700004)(53546011)(26005)(6512007)(6506007)(36756003)(186003)(478600001)(6486002)(40460700003)(40480700001)(2906002)(316002)(41300700001)(5660300002)(86362001)(82740400003)(356005)(81166007)(8936002)(8676002)(6862004)(82310400005)(83380400001)(54906003)(47076005)(2616005)(70206006)(70586007)(4326008)(33656002)(336012)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2023 06:59:39.6614
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 330186ac-fb09-4346-50c6-08db6e37410e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8412

DQoNCj4gT24gMTUgSnVuIDIwMjMsIGF0IDIyOjI3LCBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFi
ZWxsaW5pQGtlcm5lbC5vcmc+IHdyb3RlOg0KPiANCj4gRnJvbTogU3RlZmFubyBTdGFiZWxsaW5p
IDxzdGVmYW5vLnN0YWJlbGxpbmlAYW1kLmNvbT4NCj4gDQo+IEFsc28gYWRkIGEgY29tbWVudCBh
dCB0aGUgdG9wIG9mIHRoZSBmaWxlIHRvIHNheSBydWxlcy5yc3QgY291bGQgYmUNCj4gY2hhbmdl
ZC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3RlZmFuby5zdGFi
ZWxsaW5pQGFtZC5jb20+DQoNCkhpIFN0ZWZhbm8sDQoNClJldmlld2VkLWJ5OiBMdWNhIEZhbmNl
bGx1IDxsdWNhLmZhbmNlbGx1QGFybS5jb20+DQoNCg0KV2hpbGUgSSB3YXMgdGVzdGluZyB0aGUg
cGF0Y2ggd2l0aCBvdXIgc2NyaXB0IHRoYXQgdHJhbnNsYXRlcyB0aGUgZG9jcyB0byBjcHBjaGVj
aw0KSW5wdXRzLCBJIG5vdGljZWQgd2UgbWlnaHQgaGF2ZSBhIHNtYWxsIGlzc3VlIHRoZXJlLCBz
ZWVtcyB0aGF0IERpcmVjdGl2ZXMgYW5kIFJ1bGVzDQpjbGFzaGVzLCBhbmQgZnJvbSBhIHF1aWNr
IGxvb2sgdG8gY3BwY2hlY2sgYWRkb24sIHNlZW1zIHRoYXQgb25seSB0aGUgcnVsZXMgYXJlIG5l
ZWRlZC4NCg0KSeKAmWxsIGhhdmUgYSBsb29rIG9uIHRoYXQgc29vbi4NCg0KPiANCj4gLS0tDQo+
IENoYW5nZXMgaW4gdjI6DQo+IC0gYWRkIGxpbmsgZm9yIDEuNA0KPiAtIGV4cGFuZCAxLjQgY29t
bWVudCB0byBzYXkgaXQgY291bGQgYmUgcmV2aXNpdGVkDQo+IC0gYWRkIGNvbW1lbnQgYXQgdGhl
IHRvcA0KPiAtLS0NCj4gZG9jcy9taXNyYS9ydWxlcy5yc3QgfCAxNSArKysrKysrKysrKysrKysN
Cj4gMSBmaWxlIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9k
b2NzL21pc3JhL3J1bGVzLnJzdCBiL2RvY3MvbWlzcmEvcnVsZXMucnN0DQo+IGluZGV4IGE4OGMy
ODRlN2QuLjExYjljNDJiNzAgMTAwNjQ0DQo+IC0tLSBhL2RvY3MvbWlzcmEvcnVsZXMucnN0DQo+
ICsrKyBiL2RvY3MvbWlzcmEvcnVsZXMucnN0DQo+IEBAIC0zMiw2ICszMiw5IEBAIHZpb2xhdGlv
bnMgYXJlIG1lYW50IHRvIGJlIGRvY3VtZW50ZWQgYXMgZGV2aWF0aW9ucywgd2hpbGUgc29tZSBv
dGhlcnMNCj4gc2hvdWxkIGJlIGZpeGVkLiBCb3RoIGNvbXBsaWFuY2UgYW5kIGRvY3VtZW50aW5n
IGRldmlhdGlvbnMgb24gdGhlDQo+IGV4aXN0aW5nIGNvZGViYXNlIGFyZSB3b3JrLWluLXByb2dy
ZXNzLg0KPiANCj4gK1RoZSBsaXN0IGJlbG93IG1pZ2h0IG5lZWQgdG8gYmUgdXBkYXRlZCBvdmVy
IHRpbWUuIFJlYWNoIG91dCB0byBUSEUgUkVTVA0KPiArbWFpbnRhaW5lcnMgaWYgeW91IHdhbnQg
dG8gc3VnZ2VzdCBhIGNoYW5nZS4NCj4gKw0KPiAuLiBsaXN0LXRhYmxlOjoNCj4gICAgOmhlYWRl
ci1yb3dzOiAxDQo+IA0KPiBAQCAtOTAsNiArOTMsMTggQEAgZXhpc3RpbmcgY29kZWJhc2UgYXJl
IHdvcmstaW4tcHJvZ3Jlc3MuDQo+ICAgICAgICBiZWhhdmlvdXINCj4gICAgICAtDQo+IA0KPiAr
ICAgKiAtIGBSdWxlIDEuNCA8aHR0cHM6Ly9naXRsYWIuY29tL01JU1JBL01JU1JBLUMvTUlTUkEt
Qy0yMDEyL0V4YW1wbGUtU3VpdGUvPmBfDQo+ICsgICAgIC0gUmVxdWlyZWQNCj4gKyAgICAgLSBF
bWVyZ2VudCBsYW5ndWFnZSBmZWF0dXJlcyBzaGFsbCBub3QgYmUgdXNlZA0KPiArICAgICAtIEVt
ZXJnZW50IGxhbmd1YWdlIGZlYXR1cmVzLCBzdWNoIGFzIEMxMSBmZWF0dXJlcywgc2hvdWxkIG5v
dCBiZQ0KPiArICAgICAgIGNvbmZ1c2VkIHdpdGggc2ltaWxhciBjb21waWxlciBleHRlbnNpb25z
LCB3aGljaCB3ZSB1c2UuIFdoZW4gdGhlDQo+ICsgICAgICAgdGltZSBjb21lcyB0byBhZG9wdCBD
MTEsIHRoaXMgcnVsZSB3aWxsIGJlIHJldmlzaXRlZC4NCj4gKw0KPiArICAgKiAtIGBSdWxlIDIu
MSA8aHR0cHM6Ly9naXRsYWIuY29tL01JU1JBL01JU1JBLUMvTUlTUkEtQy0yMDEyL0V4YW1wbGUt
U3VpdGUvLS9ibG9iL21hc3Rlci9SXzAyXzAxXzEuYz5gXw0KPiArICAgICAtIFJlcXVpcmVkDQo+
ICsgICAgIC0gQSBwcm9qZWN0IHNoYWxsIG5vdCBjb250YWluIHVucmVhY2hhYmxlIGNvZGUNCj4g
KyAgICAgLQ0KPiArDQo+ICAgICogLSBgUnVsZSAyLjYgPGh0dHBzOi8vZ2l0bGFiLmNvbS9NSVNS
QS9NSVNSQS1DL01JU1JBLUMtMjAxMi9FeGFtcGxlLVN1aXRlLy0vYmxvYi9tYXN0ZXIvUl8wMl8w
Ni5jPmBfDQo+ICAgICAgLSBBZHZpc29yeQ0KPiAgICAgIC0gQSBmdW5jdGlvbiBzaG91bGQgbm90
IGNvbnRhaW4gdW51c2VkIGxhYmVsIGRlY2xhcmF0aW9ucw0KPiAtLSANCj4gMi4yNS4xDQo+IA0K
PiANCg0K

