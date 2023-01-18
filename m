Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7832D671660
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jan 2023 09:37:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.480215.744484 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pI3vI-0002zl-Q7; Wed, 18 Jan 2023 08:35:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 480215.744484; Wed, 18 Jan 2023 08:35:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pI3vI-0002wq-Mo; Wed, 18 Jan 2023 08:35:56 +0000
Received: by outflank-mailman (input) for mailman id 480215;
 Wed, 18 Jan 2023 08:35:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o08w=5P=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1pI3vH-0002wk-4D
 for xen-devel@lists.xenproject.org; Wed, 18 Jan 2023 08:35:55 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2070.outbound.protection.outlook.com [40.107.13.70])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1ec96477-970b-11ed-91b6-6bf2151ebd3b;
 Wed, 18 Jan 2023 09:35:53 +0100 (CET)
Received: from FR0P281CA0125.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:97::20)
 by DB4PR08MB7935.eurprd08.prod.outlook.com (2603:10a6:10:379::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.12; Wed, 18 Jan
 2023 08:35:50 +0000
Received: from VI1EUR03FT063.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:97:cafe::7e) by FR0P281CA0125.outlook.office365.com
 (2603:10a6:d10:97::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6023.12 via Frontend
 Transport; Wed, 18 Jan 2023 08:35:50 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT063.mail.protection.outlook.com (100.127.144.155) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.13 via Frontend Transport; Wed, 18 Jan 2023 08:35:49 +0000
Received: ("Tessian outbound 333ca28169fa:v132");
 Wed, 18 Jan 2023 08:35:49 +0000
Received: from 6c542e8d9372.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 72C7BBEA-539C-4295-9C23-FF04089ED104.1; 
 Wed, 18 Jan 2023 08:35:37 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6c542e8d9372.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 18 Jan 2023 08:35:37 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by AS4PR08MB7757.eurprd08.prod.outlook.com (2603:10a6:20b:514::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.19; Wed, 18 Jan
 2023 08:35:35 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::b14f:1c13:afa:4eda]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::b14f:1c13:afa:4eda%3]) with mapi id 15.20.6002.024; Wed, 18 Jan 2023
 08:35:35 +0000
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
X-Inumbo-ID: 1ec96477-970b-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tdkX32C572az6v5n2zyIeVkaRxE7Jyba3HiN2ee3VdM=;
 b=VFXDX0nSQ4AKn4Hr863XJmGUOcrTM9YMi94bvZjGUFYBpe/19IQOihncxE6zyq1Ge6b0mnVFWV3yXBkTtyvEMumgCWuVZzRFdGbDw/r3eD4PoUw5CZA1MbgF+HsT38f5J5KWhqyiYIQd5xWvYsjT01d0njSgLx06/Nm4F0RqhpE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7cccb7f00d29e920
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sx1pVrHGUyGpFmUklgF3rk/+3Qp5ByrDwKHzu2m83btUZdzGRnahhfXWAZ6/RsVRG/CO0rMj9WIvgF/Kv3cuKd9+MQ3WYoz44PtDEVxzht07Bo3IT57XZdknuwI4IgwpH5IZisc0j7/crfTKDJMqzsLIhijwy5PDeKO1UAyUDjqMTHJaSlheQgOa/XVYtRqzquOoDhlysgfDWueM5buqD9khJdcogSapUtt1bTi/syl7DgJl+pt5eCC+t7yW1TXOZbmGWdZYOHf5u8u+cEo6JApoFzRBxR1TFnfMS2HbCvdpuoXavPslwAhHocly6v7pSxfdPCCKdG3SMX15X+4z+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tdkX32C572az6v5n2zyIeVkaRxE7Jyba3HiN2ee3VdM=;
 b=RKcbsr1Yi9pz9o303UnHCNVFeMGarGEzDBNGRoDc2SfHgSTnzyEwKSWCd9oEDclfXEa41plK12FZKP9ansv2lqYeV8KIGpb6OZLkcj7d98KMMMO4jfNfb9ig5y/4gHMeLAHqzHJqSht4zO8Y9R0R+j7NIOV56xPPsr1EF1iN3+lqUrEK1suwDXAVlZvk6tKywurArUGCuNVJdiSxOLQJs+OAnctBGXapbqjyN3ovFz/L9HGSraSBLIIUDki4aSCkZsRqUXRcGpP4aXGCMwL+yxm0NIgfPK/UE59wu7HDbrFpleoQBK9gpNoDSAnmO6SljzcVRBioFl2ejTWzp75DxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tdkX32C572az6v5n2zyIeVkaRxE7Jyba3HiN2ee3VdM=;
 b=VFXDX0nSQ4AKn4Hr863XJmGUOcrTM9YMi94bvZjGUFYBpe/19IQOihncxE6zyq1Ge6b0mnVFWV3yXBkTtyvEMumgCWuVZzRFdGbDw/r3eD4PoUw5CZA1MbgF+HsT38f5J5KWhqyiYIQd5xWvYsjT01d0njSgLx06/Nm4F0RqhpE=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Wei Chen <Wei.Chen@arm.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Michal Orzel <Michal.Orzel@amd.com>,
	Xenia Ragiadakou <burzalodowa@gmail.com>
Subject: Re: [PATCH 2/2] xen/cppcheck: add parameter to skip given MISRA rules
Thread-Topic: [PATCH 2/2] xen/cppcheck: add parameter to skip given MISRA
 rules
Thread-Index: AQHZIbuCEhHxPW648U6oapqp0s8gTq6j7CYA
Date: Wed, 18 Jan 2023 08:35:35 +0000
Message-ID: <4818F679-FE61-46D5-B5E1-4BCA37C92B3B@arm.com>
References: <20230106104108.14740-1-luca.fancellu@arm.com>
 <20230106104108.14740-3-luca.fancellu@arm.com>
In-Reply-To: <20230106104108.14740-3-luca.fancellu@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.300.101.1.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|AS4PR08MB7757:EE_|VI1EUR03FT063:EE_|DB4PR08MB7935:EE_
X-MS-Office365-Filtering-Correlation-Id: 82475635-8605-497c-2875-08daf92f00ac
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 vEGuxpztR4lx/UHxXxBbxjCYThGPmM8cuVzzBH6O52FjDuJ6BaC3xBZTJV5gB0UcTp21Kbt3nQlnZEM+25NJRd9kUF3G1L84y9f0l7DanMpF22lY1Mwpr/4j3Mfm1EMHkp7ctdSBGhiAWnPu7am4I/J6PVb2Gt4ig33dwnvcvDY0QIVhdqqGALnS/Rn9kXS/6wc3zkuXwVIHeu3iKXc07ilRpi3jfkogtNRjbaDkb1veTTR3+uRdKZz6pOKF+B3lltrE/J0TtOJMeYzJu/ggR3ZoAq8SxbgZZ2XcoTOSP2dWgQihXF3eyqUb8N/xVyK0Kvhoo1T0MLrN2adZgcO3f8Q4GSg+AJ9OtbtovNEei7zVxI3rWQBqxpz8kRfXr6R3QMhmokV/jU3OwSxwC4bKwWeHsNLo5xhEn247Rfxr1pQCtjBkWyePqW0Pofwd+sPxHbOv1ZUGJuctakdGYs4Q0oguaJ7xfJoHzfvCk1efjDjb1MbWxEGKNxx8LjG2tiHgKpUUcU93Wrx5s7hV63+EZn8fC3MOejb00IrISJ9COMLG5QMIpYJsW5yu8+8aKdRUt036o/QgC8G0E4J46O4lyBPvDUxvGKk0DwV9sMVYu9Zyulfy8NzS8tMoxs55z0LAXpnG6D5hN4F/IgkTc8I9e8PXTG4ZX7w9mqq+xMk3ts9fP7ZYKTS1Owad1HLbzH1zf0qNi/ZvDwJm0DtBj0/mVOyUl/ShwfhhMyD2eLyVfUQ=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(376002)(396003)(366004)(346002)(451199015)(316002)(6916009)(4744005)(33656002)(36756003)(122000001)(54906003)(66946007)(478600001)(66476007)(6486002)(66556008)(76116006)(91956017)(86362001)(38100700002)(2906002)(41300700001)(6512007)(71200400001)(8676002)(2616005)(38070700005)(5660300002)(4326008)(186003)(66446008)(64756008)(6506007)(26005)(8936002)(53546011)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <54DD31D93BFB0F40A6586E9C22A9539F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7757
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VI1EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	50ba31ba-122c-4ccf-bdb2-08daf92ef80f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lsl50vj6eBaoLIHRitO8Ps2pCqmVd6o8XJXWGLcxOQ+T4uKIJCL0zFwFk79SAYcd8OEkcgLDidBqre1w9eXiVHiT0Kixxf+En0l3z1DkXvz6uLoSdK7XjgxsjWPmbSoRbHy5jS6VDqT9e/Nx1W0gEwpDZuiqRtOS6t7kNSayq1kWOM1rnzm5pym3d65Q8Wkq6TuCfpOM+5uTUFhPJRX7s2Y0VjyCTThV/1t+PzP99rMle5WP4NtRsevUlR7cbKlQ0AXZ2E17yI6dQrX2Z4LPT57+5BjsTbdw+MlAm18F3yCNPXqyV52TDaeKGFz3cDkKghJYumvruxko7dVhTxZHjlk7Fx61rFzeCGmnIOgw+pz5a6jRmqoWcqzWWHy/Aimtr/5E+aY1vWIqiFqQRVj0NVtbzBxnQ1uxssB+Umm8+NvtDltkUlVL6m+0j/tApSctcB2pwNZseEa9vp/eRHmjK8krTdhw/X63NY5LSsbO1Cn1rkI/4eH+PK0FVee16wicU2WIBar4nMAZn2XFI8/wUKh+fNiPByQK9bia9lAXLxInSkpjl9lYqpVA/DunyCoV6q7/KjDszE0Vu2UZj2Zspmfwb1MPovM8ZFOF43vVkW5Iai/AsjxFx5vXV4ODBz+cgDelwGTP71ZPPOJ9mgKWMl8krOD9HZrWajlb5kCmveyzR5budvY9Z3UirMjyksNzW0HRw6WE4zfIWeanW4ILqw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(39860400002)(136003)(346002)(451199015)(46966006)(36840700001)(40470700004)(26005)(54906003)(36756003)(47076005)(6512007)(2616005)(4744005)(6916009)(356005)(336012)(70206006)(33656002)(8936002)(36860700001)(81166007)(82310400005)(40460700003)(82740400003)(4326008)(2906002)(5660300002)(316002)(107886003)(8676002)(53546011)(6506007)(86362001)(41300700001)(70586007)(478600001)(186003)(40480700001)(6486002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2023 08:35:49.5314
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 82475635-8605-497c-2875-08daf92f00ac
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VI1EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB7935

DQoNCj4gT24gNiBKYW4gMjAyMywgYXQgMTA6NDEsIEx1Y2EgRmFuY2VsbHUgPEx1Y2EuRmFuY2Vs
bHVAYXJtLmNvbT4gd3JvdGU6DQo+IA0KPiBBZGQgcGFyYW1ldGVyIHRvIHNraXAgdGhlIHBhc3Nl
ZCBNSVNSQSBydWxlcyBkdXJpbmcgdGhlIGNwcGNoZWNrDQo+IGFuYWx5c2lzLCB0aGUgcnVsZXMg
YXJlIHNwZWNpZmllZCBhcyBhIGxpc3Qgb2YgY29tbWEgc2VwYXJhdGVkDQo+IHJ1bGVzIHdpdGgg
dGhlIE1JU1JBIG51bWJlciBub3RhdGlvbiAoZS5nLiAxLjEsMS4zLC4uLikuDQo+IA0KPiBNb2Rp
ZnkgY29udmVydF9taXNyYV9kb2MucHkgc2NyaXB0IHRvIHRha2UgYW4gZXh0cmEgcGFyYW1ldGVy
DQo+IGdpdmluZyBhIGxpc3Qgb2YgTUlTUkEgcnVsZSB0byBiZSBza2lwcGVkLCBjb21tYSBzZXBh
cmF0ZWQuDQo+IFdoaWxlIHRoZXJlLCBmaXggc29tZSB0eXBvcyBpbiB0aGUgaGVscCBhbmQgcHJp
bnQgZnVuY3Rpb25zLg0KPiANCj4gTW9kaWZ5IHNldHRpbmdzLnB5IGFuZCBjcHBjaGVja19hbmFs
eXNpcy5weSB0byBoYXZlIGEgbmV3DQo+IHBhcmFtZXRlciAoLS1jcHBjaGVjay1za2lwLXJ1bGVz
KSB1c2VkIHRvIHNwZWNpZnkgYSBsaXN0IG9mDQo+IE1JU1JBIHJ1bGUgdG8gYmUgc2tpcHBlZCBk
dXJpbmcgdGhlIGNwcGNoZWNrIGFuYWx5c2lzLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogTHVjYSBG
YW5jZWxsdSA8bHVjYS5mYW5jZWxsdUBhcm0uY29tPg0KPiAtLS0NCg0KR2VudGxlIHBpbmcgb24g
dGhpcyBvbmUsIEnigJl2ZSBkb25lIHRoZSBtb2RpZmljYXRpb25zIGZvciB0aGUgc3VnZ2VzdGlv
bnMgcmVjZWl2ZWQgb24gdGhlIGZpcnN0IHBhdGNoLA0KSeKAmW0gZ29pbmcgdG8gcmVzcGluIHRo
ZSBzZXJpZSBzbyBJIHdvdWxkIGxpa2UgdG8gc2VlIGlmIEkgbmVlZCB0byBjaGFuZ2Ugc29tZXRo
aW5nIGFsc28gb24gdGhpcyBvbmUuDQoNCg0K

