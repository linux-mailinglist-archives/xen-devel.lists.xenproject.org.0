Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F84F41A661
	for <lists+xen-devel@lfdr.de>; Tue, 28 Sep 2021 06:17:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.197391.350417 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mV4Xy-0000Ov-CH; Tue, 28 Sep 2021 04:16:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 197391.350417; Tue, 28 Sep 2021 04:16:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mV4Xy-0000MU-9F; Tue, 28 Sep 2021 04:16:50 +0000
Received: by outflank-mailman (input) for mailman id 197391;
 Tue, 28 Sep 2021 04:16:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0YX1=OS=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mV4Xw-0000MO-Mh
 for xen-devel@lists.xenproject.org; Tue, 28 Sep 2021 04:16:48 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.21.52]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 400d8a54-663b-4e4f-84a2-4d28e2405adf;
 Tue, 28 Sep 2021 04:16:44 +0000 (UTC)
Received: from AM6PR05CA0009.eurprd05.prod.outlook.com (2603:10a6:20b:2e::22)
 by VI1PR0801MB1951.eurprd08.prod.outlook.com (2603:10a6:800:8f::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Tue, 28 Sep
 2021 04:16:42 +0000
Received: from AM5EUR03FT014.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:2e:cafe::e8) by AM6PR05CA0009.outlook.office365.com
 (2603:10a6:20b:2e::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15 via Frontend
 Transport; Tue, 28 Sep 2021 04:16:42 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT014.mail.protection.outlook.com (10.152.16.130) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Tue, 28 Sep 2021 04:16:41 +0000
Received: ("Tessian outbound 71ebfb754289:v103");
 Tue, 28 Sep 2021 04:16:40 +0000
Received: from f9d5b6d21a5f.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8DECE90E-85D4-4B05-A80E-47FB332C6C34.1; 
 Tue, 28 Sep 2021 04:16:30 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f9d5b6d21a5f.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 28 Sep 2021 04:16:30 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com (2603:10a6:10:2a2::7)
 by DBBPR08MB5898.eurprd08.prod.outlook.com (2603:10a6:10:20c::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Tue, 28 Sep
 2021 04:16:28 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::2c28:50cf:49fd:da32]) by DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::2c28:50cf:49fd:da32%9]) with mapi id 15.20.4544.022; Tue, 28 Sep 2021
 04:16:28 +0000
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
X-Inumbo-ID: 400d8a54-663b-4e4f-84a2-4d28e2405adf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=htSWZT2gCJUbwc6XxBwv9NpNR3Vu/M5ZCRmtcB9KuFQ=;
 b=S8wze3Y7XGqJ64TbNtv4n1Vz1K4bzC/W182+IRH6v4ToSDRtUl1YDRN3DhAMuDDyxvxErJ1Q1AoOsEZPe77SHV5qPJhPRHT/Op2Nqnsg1S9HSL3dPKR3BtRcu1YIPd25OGwauFJMGH5ZoUmTcdECkZIohYAi5TqjxZNMoj4XoDw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HONvC8NJ4GjvT74QHmGkSxthEXqk4o9cIGBhbp8tVGjaBb+nqEmIe8OPIqsmJVmFBvHAUV4i7fy+xHTVZ/xNU7643FbzgJq8lvPqxfs/df8F7YwpSLJ2gxC5K2QEVBy71wIuLp7vqkZbODgdlLkO4ynYsv5aIjs1mwG4P7LqrDsaz9ZOiLvQJHDI0AgM3O+zy2+8bFdhELhY1CDqrQKb+rKuVKpD028MyYCGf0GxTxsdlBVhF8vYmw07k/e03/BR8O/UgdLmF/3jkLofUG2N+0RfQgwVESCjtIxLKG23G2RCMPjGlNZXMpK2UGg/wdQs0mTCr+X/jbDafvrSzbprxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=htSWZT2gCJUbwc6XxBwv9NpNR3Vu/M5ZCRmtcB9KuFQ=;
 b=KXizyDTjYJ4xJH228zUqcZ1WYt5aCCz5pmyASV6IWGuSt/p8+/kDY9lJXeH5rPObcuD+swR6s64JZPEGoWYGuY+uKEtRnPNVef6AvZzjUk37bNAkrS5ezuJOCRdtGkFNLfLVq3Q9YnnVRAO+e3DKx7YeCDfysG8vL/ybYg1l3U55xUcULRMl+hbA6SXnI10I3R4xjk4xvSoiJyOCnAHtHwEtGsXIDy91BGwv3MmWeXByKEDejqkciUiY4ElAkap3NmrevyIm5M6OGpCKcWVL6OZiyrNSY2zhQmQ5VQBRSHier3VcVf1Kf2yg0LRT+w1I/nHahxqQqUGR7HOrB7f9Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=htSWZT2gCJUbwc6XxBwv9NpNR3Vu/M5ZCRmtcB9KuFQ=;
 b=S8wze3Y7XGqJ64TbNtv4n1Vz1K4bzC/W182+IRH6v4ToSDRtUl1YDRN3DhAMuDDyxvxErJ1Q1AoOsEZPe77SHV5qPJhPRHT/Op2Nqnsg1S9HSL3dPKR3BtRcu1YIPd25OGwauFJMGH5ZoUmTcdECkZIohYAi5TqjxZNMoj4XoDw=
From: Wei Chen <Wei.Chen@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "julien@xen.org" <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>
Subject: RE: [PATCH 20/37] xen: introduce CONFIG_EFI to stub API for non-EFI
 architecture
Thread-Topic: [PATCH 20/37] xen: introduce CONFIG_EFI to stub API for non-EFI
 architecture
Thread-Index:
 AQHXsHMtR+l18+MmpE6rl/RjSXTBgquyYmkAgAA2xQCAADnbAIAAKWhQgAAGUwCAAxtPwIABk+MwgAD1aACAACGFAA==
Date: Tue, 28 Sep 2021 04:16:28 +0000
Message-ID:
 <DB9PR08MB6857E57847E38C400F6571EA9EA89@DB9PR08MB6857.eurprd08.prod.outlook.com>
References: <20210923120236.3692135-1-wei.chen@arm.com>
 <20210923120236.3692135-21-wei.chen@arm.com>
 <alpine.DEB.2.21.2109231811420.17979@sstabellini-ThinkPad-T480s>
 <PAXPR08MB68640027443F267495804A529EA49@PAXPR08MB6864.eurprd08.prod.outlook.com>
 <b4433faf-bb70-d083-126c-0224da3d9a82@suse.com>
 <DB9PR08MB685742B691E39FD3161BFE289EA49@DB9PR08MB6857.eurprd08.prod.outlook.com>
 <a295cc34-9cc0-468b-c85a-2e5d1238d9a3@suse.com>
 <DB9PR08MB6857EE6294A1062EE0FAF0289EA69@DB9PR08MB6857.eurprd08.prod.outlook.com>
 <DB9PR08MB6857AB9DBB66A4E02140987B9EA79@DB9PR08MB6857.eurprd08.prod.outlook.com>
 <alpine.DEB.2.21.2109271420560.5022@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2109271420560.5022@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 43DA564848AA594593DFCAD0E1C69A63.0
x-checkrecipientchecked: true
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 5eaec923-77d5-4d74-2421-08d98236c64b
x-ms-traffictypediagnostic: DBBPR08MB5898:|VI1PR0801MB1951:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR0801MB19511444B2F7F1700E0253629EA89@VI1PR0801MB1951.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 YTJT0FJ3mLPsvmRH0BArZ4g3ZmsNRUmUj4NjmP3mgMqsSuP+QP3bIQiHKPlg0W+NLXphKSfX6MeQRHmc0KnyHbj4v6oDrHm2cvY3/LuABtsU1KJugIFnUh1b71JefFceYW7rugng9LkG97OYAhqs3MNqvDPjjcdODS3GolJMeQBcAwfEzgYJu+LOx1RTdg3xpBkSPuNwCLEGE4gQGRex5iCX2inEuBOwEeO3naHt0KgzZXWcAeUBED01nM9Y7E6LczpR68qqRHK6Jo4K28uWejSra5tEEacf5Ntp5gd9aGP4Mtbo0LAOX1/NqaERSjSoy6u0CxXsyNvZWh7YMeQ9gXTIZIIeBtkxrIQPHZ1RyWb+hSgpFzuSLkUMF41JRDjVB6pMQl2b8CfUw0G4F/qmDPbuG2/XIGe9rMA44V6RZIno6CFJH2Zofw2PxituEZF7bsNDWpw6CKj27L4owmWnPSjKA0J+aofItd1ByTgzUIdXEHL/MTNw+0Unvd3gIaAbjopTmlIkg8V2xj3CmZHXNF1WxfUEBAHRPQTGYuFNG1c4Qh0XG0ZxBSk5qPJL3rep5vZKV/Of1TdnikKI4/dzjg9xvuWp8U7oCvbDc2azxIUH2u1ud0M2kwuatddWLoTx5sCfhGq8VXTpREHBEKAPa1YKKAANDPNEJOF4yxDB0AgczQKrawVR1Tk7m5BJOXm38pdZvFEEPdXuyHL7NSXnH2PvBfIA7IuVYSSj+nejuNiN4j3j6d+X0Choh2w5RzKVAXA49Ddv6OU5Zu2h19ZeV4Nj8laZCMPseXcLgG2d63w=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6857.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(4326008)(38100700002)(8676002)(86362001)(122000001)(316002)(55016002)(26005)(38070700005)(83380400001)(966005)(186003)(33656002)(66446008)(53546011)(7696005)(66946007)(76116006)(6916009)(52536014)(5660300002)(54906003)(66556008)(64756008)(508600001)(8936002)(9686003)(66476007)(6506007)(71200400001)(2906002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB5898
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ae9ecb16-ff66-4a39-ab9d-08d98236be42
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qdklKgi6iwJhdwWikmy05FVe738PpIe8dyvxYtfpKtAj6MFq71IRYIlexZ/e8un2UjCpzTBku1WQ+2ZS5Dcer5qeVQ5t4fDyqt4RQQ/MNAX9ZfRTkBtdjm8skJAv20g19sHyyMXZQTe9xh1jcD1vreSMBBrYTn8uWL+tbJDM3BLgn5MI2blIEgLmCGva+8n3irmeg+nTBSEY2135Fkxu4SIWqK3hGyKgmplJVDBhdNnMPYWZ1+hvYK///bKTh2sJr+cjqFncv36EsYRz8CBsrPvIIouye+jUBu5fkQZOUtziQqXRU1PBCEc/gqAbrcLuc1+38ZGUbVbgiR7T9Sn0BNavBrq0oc0WDt3/bpvxLQUeXmAdOyUqPSl7QTk70E1AVtcHzp0JNBEzXCwl4UqU4dBzNUGIXb/6OCyBN4/FA917iZVS3H9lG49TnAOqGFVrLM45sZmozPqZJaGGYjeZsbW+DXqaQJ+bGmui0EGygkwDhEAiJcM1swz6PKfO+aIDVW1XSrW1rql7VfPvjNlh8pFl5+jQPDXii+vL2BDLX6dk8snIyDahjwBrWRZhdb1ScSKsnnH+TTVhpMGunf1fOOYi6g+pvhp32PaKf7J7MoD67qY8G17r33WdTNdEUTzh8mjHUx1iZxy/WdjujnFUhlwlEE9ClzT2YfrrWn88FZA342rEMcHjfH5PturHcxpGS4p0KaOsHjphEC7dZ4/3Vr5g+aMLcX6eXHxN45c8w+RWjB33KxlYA668PKD/nNEGXA4uGzgWNeDRM2usbIbnTHGhCoXuRiL4AO0pO+8p15g=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(82310400003)(47076005)(186003)(53546011)(26005)(6506007)(508600001)(966005)(336012)(5660300002)(8936002)(4326008)(33656002)(6862004)(316002)(70206006)(356005)(81166007)(83380400001)(54906003)(8676002)(36860700001)(86362001)(70586007)(9686003)(2906002)(7696005)(52536014)(55016002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2021 04:16:41.5534
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5eaec923-77d5-4d74-2421-08d98236c64b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1951

SGkgU3RlZmFubywNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBTdGVm
YW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IDIwMjHlubQ5
5pyIMjjml6UgOTowMA0KPiBUbzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+DQo+IENjOiBK
YW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmc7DQo+IGp1bGllbkB4ZW4ub3JnOyBCZXJ0cmFuZCBNYXJxdWlzIDxCZXJ0cmFuZC5NYXJx
dWlzQGFybS5jb20+OyBTdGVmYW5vDQo+IFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5v
cmc+DQo+IFN1YmplY3Q6IFJFOiBbUEFUQ0ggMjAvMzddIHhlbjogaW50cm9kdWNlIENPTkZJR19F
RkkgdG8gc3R1YiBBUEkgZm9yIG5vbi0NCj4gRUZJIGFyY2hpdGVjdHVyZQ0KPiANCj4gT24gTW9u
LCAyNyBTZXAgMjAyMSwgV2VpIENoZW4gd3JvdGU6DQo+ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQ0KPiA+ID4gRnJvbTogWGVuLWRldmVsIDx4ZW4tZGV2ZWwtYm91bmNlc0BsaXN0cy54
ZW5wcm9qZWN0Lm9yZz4gT24gQmVoYWxmIE9mDQo+IFdlaQ0KPiA+ID4gQ2hlbg0KPiA+ID4gU2Vu
dDogMjAyMeW5tDnmnIgyNuaXpSAxODoyNQ0KPiA+ID4gVG86IEphbiBCZXVsaWNoIDxqYmV1bGlj
aEBzdXNlLmNvbT4NCj4gPiA+IENjOiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7IGp1
bGllbkB4ZW4ub3JnOyBCZXJ0cmFuZCBNYXJxdWlzDQo+ID4gPiA8QmVydHJhbmQuTWFycXVpc0Bh
cm0uY29tPjsgU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPg0KPiA+
ID4gU3ViamVjdDogUkU6IFtQQVRDSCAyMC8zN10geGVuOiBpbnRyb2R1Y2UgQ09ORklHX0VGSSB0
byBzdHViIEFQSSBmb3INCj4gbm9uLQ0KPiA+ID4gRUZJIGFyY2hpdGVjdHVyZQ0KPiA+ID4NCj4g
PiA+IEhpIEphbiwNCj4gPiA+DQo+ID4gPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+
ID4gPiA+IEZyb206IFhlbi1kZXZlbCA8eGVuLWRldmVsLWJvdW5jZXNAbGlzdHMueGVucHJvamVj
dC5vcmc+IE9uIEJlaGFsZg0KPiBPZg0KPiA+ID4gSmFuDQo+ID4gPiA+IEJldWxpY2gNCj4gPiA+
ID4gU2VudDogMjAyMeW5tDnmnIgyNOaXpSAxODo0OQ0KPiA+ID4gPiBUbzogV2VpIENoZW4gPFdl
aS5DaGVuQGFybS5jb20+DQo+ID4gPiA+IENjOiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmc7IGp1bGllbkB4ZW4ub3JnOyBCZXJ0cmFuZCBNYXJxdWlzDQo+ID4gPiA+IDxCZXJ0cmFuZC5N
YXJxdWlzQGFybS5jb20+OyBTdGVmYW5vIFN0YWJlbGxpbmkNCj4gPHNzdGFiZWxsaW5pQGtlcm5l
bC5vcmc+DQo+ID4gPiA+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMjAvMzddIHhlbjogaW50cm9kdWNl
IENPTkZJR19FRkkgdG8gc3R1YiBBUEkgZm9yDQo+ID4gPiBub24tDQo+ID4gPiA+IEVGSSBhcmNo
aXRlY3R1cmUNCj4gPiA+ID4NCj4gPiA+ID4gT24gMjQuMDkuMjAyMSAxMjozMSwgV2VpIENoZW4g
d3JvdGU6DQo+ID4gPiA+ID4+IEZyb206IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4N
Cj4gPiA+ID4gPj4gU2VudDogMjAyMeW5tDnmnIgyNOaXpSAxNTo1OQ0KPiA+ID4gPiA+Pg0KPiA+
ID4gPiA+PiBPbiAyNC4wOS4yMDIxIDA2OjM0LCBXZWkgQ2hlbiB3cm90ZToNCj4gPiA+ID4gPj4+
PiBGcm9tOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+DQo+ID4g
PiA+ID4+Pj4gU2VudDogMjAyMeW5tDnmnIgyNOaXpSA5OjE1DQo+ID4gPiA+ID4+Pj4NCj4gPiA+
ID4gPj4+PiBPbiBUaHUsIDIzIFNlcCAyMDIxLCBXZWkgQ2hlbiB3cm90ZToNCj4gPiA+ID4gPj4+
Pj4gLS0tIGEveGVuL2NvbW1vbi9LY29uZmlnDQo+ID4gPiA+ID4+Pj4+ICsrKyBiL3hlbi9jb21t
b24vS2NvbmZpZw0KPiA+ID4gPiA+Pj4+PiBAQCAtMTEsNiArMTEsMTYgQEAgY29uZmlnIENPTVBB
VA0KPiA+ID4gPiA+Pj4+PiAgY29uZmlnIENPUkVfUEFSS0lORw0KPiA+ID4gPiA+Pj4+PiAgCWJv
b2wNCj4gPiA+ID4gPj4+Pj4NCj4gPiA+ID4gPj4+Pj4gK2NvbmZpZyBFRkkNCj4gPiA+ID4gPj4+
Pj4gKwlib29sDQo+ID4gPiA+ID4+Pj4NCj4gPiA+ID4gPj4+PiBXaXRob3V0IHRoZSB0aXRsZSB0
aGUgb3B0aW9uIGlzIG5vdCB1c2VyLXNlbGVjdGFibGUgKG9yIGRlLQ0KPiA+ID4gPiBzZWxlY3Rh
YmxlKS4NCj4gPiA+ID4gPj4+PiBTbyB0aGUgaGVscCBtZXNzYWdlIGJlbG93IGNhbiBuZXZlciBi
ZSBzZWVuLg0KPiA+ID4gPiA+Pj4+DQo+ID4gPiA+ID4+Pj4gRWl0aGVyIGFkZCBhIHRpdGxlLCBl
LmcuOg0KPiA+ID4gPiA+Pj4+DQo+ID4gPiA+ID4+Pj4gYm9vbCAiRUZJIHN1cHBvcnQiDQo+ID4g
PiA+ID4+Pj4NCj4gPiA+ID4gPj4+PiBPciBmdWxseSBtYWtlIHRoZSBvcHRpb24gYSBzaWxlbnQg
b3B0aW9uIGJ5IHJlbW92aW5nIHRoZSBoZWxwDQo+IHRleHQuDQo+ID4gPiA+ID4+Pg0KPiA+ID4g
PiA+Pj4gT0ssIGluIGN1cnJlbnQgWGVuIGNvZGUsIEVGSSBpcyB1bmNvbmRpdGlvbmFsbHkgY29t
cGlsZWQuIEJlZm9yZQ0KPiA+ID4gPiA+Pj4gd2UgY2hhbmdlIHJlbGF0ZWQgY29kZSwgSSBwcmVm
ZXIgdG8gcmVtb3ZlIHRoZSBoZWxwIHRleHQuDQo+ID4gPiA+ID4+DQo+ID4gPiA+ID4+IEJ1dCB0
aGF0J3Mgbm90IHRydWU6IEF0IGxlYXN0IG9uIHg4NiBFRkkgZ2V0cyBjb21waWxlZCBkZXBlbmRp
bmcNCj4gb24NCj4gPiA+ID4gPj4gdG9vbCBjaGFpbiBjYXBhYmlsaXRpZXMuIFVsdGltYXRlbHkg
d2UgbWF5IGluZGVlZCB3YW50IGEgdXNlcg0KPiA+ID4gPiA+PiBzZWxlY3RhYmxlIG9wdGlvbiBo
ZXJlLCBidXQgdW50aWwgdGhlbiBJJ20gYWZyYWlkIGhhdmluZyB0aGlzDQo+IG9wdGlvbg0KPiA+
ID4gPiA+PiBhdCBhbGwgbWF5IGJlIG1pc2xlYWRpbmcgb24geDg2Lg0KPiA+ID4gPiA+Pg0KPiA+
ID4gPiA+DQo+ID4gPiA+ID4gSSBjaGVjayB0aGUgYnVpbGQgc2NyaXB0cywgeWVzLCB5b3UncmUg
cmlnaHQuIEZvciB4ODYsIEVGSSBpcyBub3QNCj4gYQ0KPiA+ID4gPiA+IHNlbGVjdGFibGUgb3B0
aW9uIGluIEtjb25maWcuIEkgYWdyZWUgd2l0aCB5b3UsIHdlIGNhbid0IHVzZQ0KPiBLY29uZmln
DQo+ID4gPiA+ID4gc3lzdGVtIHRvIGRlY2lkZSB0byBlbmFibGUgRUZJIGJ1aWxkIGZvciB4ODYg
b3Igbm90Lg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gU28gaG93IGFib3V0IHdlIGp1c3QgdXNlIHRo
aXMgRUZJIG9wdGlvbiBmb3IgQXJtIG9ubHk/IEJlY2F1c2Ugb24NCj4gQXJtLA0KPiA+ID4gPiA+
IHdlIGRvIG5vdCBoYXZlIHN1Y2ggdG9vbGNoYWluIGRlcGVuZGVuY3kuDQo+ID4gPiA+DQo+ID4g
PiA+IFRvIGJlIGhvbmVzdCAtIGRvbid0IGtub3cuIFRoYXQncyBiZWNhdXNlIEkgZG9uJ3Qga25v
dyB3aGF0IHlvdSB3YW50DQo+ID4gPiA+IHRvIHVzZSB0aGUgb3B0aW9uIGZvciBzdWJzZXF1ZW50
bHkuDQo+ID4gPiA+DQo+ID4gPg0KPiA+ID4gSW4gbGFzdCB2ZXJzaW9uLCBJIGhhZCBpbnRyb2R1
Y2VkIGFuIGFyY2gtaGVscGVyIHRvIHN0dWIgRUZJX0JPT1QNCj4gPiA+IGluIEFybSdzIGNvbW1v
biBjb2RlIGZvciBBcm0zMi4gQmVjYXVzZSBBcm0zMiBkb2Vzbid0IHN1cHBvcnQgRUZJLg0KPiA+
ID4gU28gSnVsaWVuIHN1Z2dlc3RlZCBtZSB0byBpbnRyb2R1Y2UgYSBDT05GSUdfRUZJIG9wdGlv
biBmb3Igbm9uLUVGSQ0KPiA+ID4gc3VwcG9ydGVkIGFyY2hpdGVjdHVyZXMgdG8gc3R1YiBpbiBF
RkkgbGF5ZXIuDQo+ID4gPg0KPiA+ID4gWzFdIGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
YXJjaGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAyMS0NCj4gPiA+IDA4L21zZzAwODA4Lmh0bWwNCj4g
PiA+DQo+ID4NCj4gPiBBcyBKYW4nIHJlbWluZGVkLCB4ODYgZG9lc24ndCBkZXBlbmQgb24gS2Nv
bmZpZyB0byBidWlsZCBFRkkgY29kZS4NCj4gPiBTbywgaWYgd2UgQ09ORklHX0VGSSB0byBzdHVi
IEVGSSBBUEkncyBmb3IgeDg2LCB3ZSB3aWxsIGVuY291bnRlcg0KPiA+IHRoYXQgdG9vbGNoYWlu
cyBlbmFibGUgRUZJLCBidXQgS2NvbmZpZyBkaXNhYmxlIEVGSS4gT3IgS2NvbmZpZw0KPiA+IGVu
YWJsZSBFRkkgYnV0IHRvb2xjaGFpbiBkb2Vzbid0IHByb3ZpZGUgRUZJIGJ1aWxkIHN1cHBvcnRz
LiBBbmQNCj4gPiB0aGVuIHg4NiBjb3VsZCBub3Qgd29yayB3ZWxsLg0KPiA+DQo+ID4gSWYgd2Ug
dXNlIENPTkZJR19FRkkgZm9yIEFybSBvbmx5LCB0aGF0IG1lYW5zIENPTkZJR19FRkkgZm9yIHg4
Ng0KPiA+IGlzIG9mZiwgdGhpcyB3aWxsIGFsc28gY2F1c2UgcHJvYmxlbS4NCj4gPg0KPiA+IFNv
LCBjYW4gd2Ugc3RpbGwgdXNlIHByZXZpb3VzIGFyY2hfaGVscGVycyB0byBzdHViIGZvciBBcm0z
Mj8NCj4gPiB1bnRpbCB4ODYgY2FuIHVzZSB0aGlzIHNlbGVjdGFibGUgb3B0aW9uPw0KPiANCj4g
RUZJIGRvZXNuJ3QgaGF2ZSB0byBiZSBuZWNlc3NhcmlseSBhIHVzZXItdmlzaWJsZSBvcHRpb24g
aW4gS2NvbmZpZyBhdA0KPiB0aGlzIHBvaW50LiBJIHRoaW5rIEp1bGllbiB3YXMganVzdCBhc2tp
bmcgdG8gbWFrZSB0aGUgI2lmZGVmIGJhc2VkIG9uDQo+IGEgRUZJLXJlbGF0ZWQgY29uZmlnIHJh
dGhlciB0aGFuIGp1c3QgYmFzZWQgQ09ORklHX0FSTTY0Lg0KPiANCj4gT24geDg2IEVGSSBpcyBk
ZXRlY3RlZCBiYXNlZCBvbiBjb21waWxlciBzdXBwb3J0LCBzZXR0aW5nIFhFTl9CVUlMRF9FRkkN
Cj4gaW4geGVuL2FyY2gveDg2L01ha2VmaWxlLiBMZXQncyBzYXkgdGhhdCB3ZSBrZWVwIHVzaW5n
IHRoZSBzYW1lIG5hbWUNCj4gIlhFTl9CVUlMRF9FRkkiIG9uIEFSTSBhcyB3ZWxsLg0KPiANCj4g
T24gQVJNMzIsIFhFTl9CVUlMRF9FRkkgc2hvdWxkIGJlIGFsd2F5cyB1bnNldC4NCj4gDQo+IE9u
IEFSTTY0IFhFTl9CVUlMRF9FRkkgc2hvdWxkIGJlIGFsd2F5cyBzZXQuDQo+IA0KPiBUaGF0J3Mg
aXQsIHJpZ2h0PyBJJ2QgYXJndWUgdGhhdCBDT05GSUdfRUZJIG9yIEhBU19FRkkgYXJlIGJldHRl
ciBuYW1lcw0KPiB0aGFuIFhFTl9CVUlMRF9FRkksIGJ1dCB0aGF0J3MgT0sgYW55d2F5LiBTbyBm
b3IgaW5zdGFuY2UgeW91IGNhbiBtYWtlDQo+IFhFTl9CVUlMRF9FRkkgYW4gaW52aXNpYmxlIHN5
bWJvbCBpbiB4ZW4vYXJjaC9hcm0vS2NvbmZpZyBhbmQgc2VsZWN0IGl0DQo+IG9ubHkgb24gQVJN
NjQuDQoNClRoYW5rcywgdGhpcyBpcyBhIGdvb2QgYXBwcm9hY2guIEJ1dCBpZiB3ZSBwbGFjZSBY
RU5fQlVJTERfRUZJIGluIEtjb25maWcNCml0IHdpbGwgYmUgdHJhbnNmZXIgdG8gQ09ORklHX1hF
Tl9CVUlMRF9FRkkuIEhvdyBhYm91dCB1c2luZyBhbm90aGVyIG5hbWUNCmluIEtjb25maWcgbGlr
ZSBBUk1fRUZJLCBidXQgdXNlIENPTkZJR19BUk1fRUZJIGluIGNvbmZpZy5oIHRvIGRlZmluZQ0K
WEVOX0JVSUxEX0VGST8NCg0KDQoNCg==

