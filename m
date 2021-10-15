Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B40942EE5A
	for <lists+xen-devel@lfdr.de>; Fri, 15 Oct 2021 12:04:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.210103.366832 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbK46-0001x0-CO; Fri, 15 Oct 2021 10:03:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 210103.366832; Fri, 15 Oct 2021 10:03:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbK46-0001uH-8U; Fri, 15 Oct 2021 10:03:50 +0000
Received: by outflank-mailman (input) for mailman id 210103;
 Fri, 15 Oct 2021 10:03:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lHOs=PD=arm.com=Penny.Zheng@srs-us1.protection.inumbo.net>)
 id 1mbK45-0001u9-IZ
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 10:03:49 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [40.107.20.82]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a9e32ab5-8e6f-477d-bf9c-4f54d8b8a6b7;
 Fri, 15 Oct 2021 10:03:47 +0000 (UTC)
Received: from AM6P191CA0077.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8a::18)
 by DB8PR08MB5194.eurprd08.prod.outlook.com (2603:10a6:10:e8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.25; Fri, 15 Oct
 2021 10:03:45 +0000
Received: from VE1EUR03FT044.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8a:cafe::b7) by AM6P191CA0077.outlook.office365.com
 (2603:10a6:209:8a::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15 via Frontend
 Transport; Fri, 15 Oct 2021 10:03:45 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT044.mail.protection.outlook.com (10.152.19.106) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.15 via Frontend Transport; Fri, 15 Oct 2021 10:03:44 +0000
Received: ("Tessian outbound f1898412aff1:v103");
 Fri, 15 Oct 2021 10:03:44 +0000
Received: from 4eaa3b155f11.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 78CBAFA1-169C-4478-BAE4-24F780E68C3F.1; 
 Fri, 15 Oct 2021 10:03:34 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4eaa3b155f11.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 15 Oct 2021 10:03:34 +0000
Received: from VE1PR08MB5215.eurprd08.prod.outlook.com (2603:10a6:803:10a::33)
 by VI1PR08MB2864.eurprd08.prod.outlook.com (2603:10a6:802:21::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.14; Fri, 15 Oct
 2021 10:03:30 +0000
Received: from VE1PR08MB5215.eurprd08.prod.outlook.com
 ([fe80::41d6:b115:3b22:2cd]) by VE1PR08MB5215.eurprd08.prod.outlook.com
 ([fe80::41d6:b115:3b22:2cd%2]) with mapi id 15.20.4587.026; Fri, 15 Oct 2021
 10:03:30 +0000
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
X-Inumbo-ID: a9e32ab5-8e6f-477d-bf9c-4f54d8b8a6b7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2KybSIbBQR0pu/fexgEmJ6uNwS+q/R4RdSw5aKV1/Hw=;
 b=HSX92AVsqWLCl2daHoEkRe9sjGDmsY6Uo6SiJJKi0P5SljOI7PC1QUM40Ob68Li8Bq7UuqnC5M+yhDHQqhsUAJlMEQdnyLtv+tC3zR3+ptcgrtJuTefzd8MPhUtG/1QyF4nq4z+8etUnqkIG+mJocQGbss06WmVGARx7ebz8JAk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ipbGbsplaVFMwWw5/pe5AFN4EByzFf56o3pCKWAR7683lg7/bFpgvYANQyeJ3rMyARRJRmSJ61Ofm0ujPOzo3Rd24T4ENJGS7iBc36BTO5a26RCN8/26w/CybUS9NDT/C/1IbeIANghlmRBTwHH8adg4KHsPeSU1Q0KnRe0Y/SNnf9jo07tT0dbjJsLhENdI8OCSA970wNYTLKohla2ky2+3NTRkOinOFd2TF/8c/ZoKoDfs+xzTv35AqHmIkacXNtywL9p8DdAzOQ+9G1IqscB5leh+uNQ8Sv/Xsk2iI7YZzZutIamwNjkQ7OkTuL+cdmvU1/HhUMld2I9MqwCt4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2KybSIbBQR0pu/fexgEmJ6uNwS+q/R4RdSw5aKV1/Hw=;
 b=fcJCf0aDddtB3mY9zr4a33ykppZlrtRQ2NzFTDM5eznu8FlaqXWi2x6rj8IZWFiThDKBRu5PUpUUiilynCJ2S1+nmwimAxy0HUjDdNdojrz950IJLrPiCWg0x6WOUJW4tYVc4Nxj1Y9cVYRMd+vzzUpL8uoJVBHL3/8yT4rO9U/Wpm+3NhhQEo1dkcy/8KSxcxcHmwyBr08BJoHusYffbUg5DVu6o8cEsVKLi7ajtGjLIMTNhUUdl20BFqSLFr0IKOj/4fbEorjbHt2o7rmc/si8DRN1qtKgsCps/vgsPycjKgiRLLF7cbh3GFZrP63qXNrRjCnW0v3hV8GpnDKJLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2KybSIbBQR0pu/fexgEmJ6uNwS+q/R4RdSw5aKV1/Hw=;
 b=HSX92AVsqWLCl2daHoEkRe9sjGDmsY6Uo6SiJJKi0P5SljOI7PC1QUM40Ob68Li8Bq7UuqnC5M+yhDHQqhsUAJlMEQdnyLtv+tC3zR3+ptcgrtJuTefzd8MPhUtG/1QyF4nq4z+8etUnqkIG+mJocQGbss06WmVGARx7ebz8JAk=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>
CC: Wei Chen <Wei.Chen@arm.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: RE: [PATCH v2 1/6] xen: introduce XEN_DOMCTL_CDF_directmap
Thread-Topic: [PATCH v2 1/6] xen: introduce XEN_DOMCTL_CDF_directmap
Thread-Index: AQHXwaKc9sR/Jlon9kSpv6953h7AKKvT01dA
Date: Fri, 15 Oct 2021 10:03:30 +0000
Message-ID:
 <VE1PR08MB52154092FD59B77B76EF81BBF7B99@VE1PR08MB5215.eurprd08.prod.outlook.com>
References: <20211015030945.2082898-1-penny.zheng@arm.com>
 <20211015030945.2082898-2-penny.zheng@arm.com>
 <0eba23e2-54f4-0fe4-d811-c2fb8a0602b0@xen.org>
In-Reply-To: <0eba23e2-54f4-0fe4-d811-c2fb8a0602b0@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: F035C602837AB840A6DA271DC89BB84B.0
x-checkrecipientchecked: true
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 089fcfc0-f936-4370-22f7-08d98fc31310
x-ms-traffictypediagnostic: VI1PR08MB2864:|DB8PR08MB5194:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<DB8PR08MB5194CF19A0488DB7B85473B1F7B99@DB8PR08MB5194.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 hV+45GuQ6p8jOgGWItVjV3S/nSOG3eGET9G2EhNLLl52sOKtB2eQQnSo0aJCRX1mkk+mmJdfZSqs/hLG6UjnhqD+ZVDINJpqBn1uFhkLzTPSg24+p7tWW9ALW/qS5JuiX9yROdfMhj14TbgmUlH+XUdtgbpbhGVR2x6Hj8JRrh5tVcqGDUecDXO+OSFkAhI30d8xsPGUM+zE8GyV5akrka1iWXiwP2aSHoYxK7QrH1D6mhnBZrKN1MXfeDnCWa4ykbweNRbH8OTjZnCrgR0HttdfEiX8mQS/ZDx5F1gJFoLjr0lUTLzJD2yYt7/jDJdCEM+P2DstjrQPVnoqIeM/Ve5H3b7Z9KQh+ZOIieWKHulw5kRjD62e6gHSBu1ynSVNFukseyMJXOWldNvBl1JTKYer0Rg/KwmWI4kAFV4T4tW6bbBf42bILT9mV2QftK25YxLbdfIntdhBaKVBjpVU/rE3jcMi2fQMqWwe8qvbjVpUnfTxNJFldTTUBPEG9XlwUOEeGzWpS1kkvpWOK5T9ofz2qPORmtfaG13WCzMbiwjCAseEx7zfUhmjEawS4NQxNJrtuPHlc0HjBSh7WBLTOHxYoTkhhVHGR39jz3g56plOH2yL1UjPXF2goKgakf3FUEI+AAlBrT+HKKSmtrX5c++Rta7Qj2mEsOGven98wQODogDBABlWQvLxBbE4JogYFyLX/BQ9qlODX8My6I+92A==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5215.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(54906003)(8676002)(66556008)(52536014)(8936002)(66446008)(2906002)(110136005)(508600001)(7696005)(5660300002)(66946007)(4326008)(55016002)(53546011)(83380400001)(33656002)(9686003)(86362001)(26005)(64756008)(6506007)(38070700005)(76116006)(316002)(71200400001)(38100700002)(122000001)(186003)(66476007);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2864
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4113968f-62cd-4c66-2695-08d98fc30a99
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tLiHUKPRKm1tHzLBb8P7AT4cTXDV0sb4sRXs5jmg5xy2w1LTqJSpUufzwEri0g43f4UOS78pF2ACrwgW/lV2xUbJhGEm6SyrDTvgTv56fIMfEa4YaSFuoxGZa3NSSV1tTZVRjkI6d2/NsrLnFwFz1yrjQhX/yY3WVKi7reX2pQnpFI1QtvoDWVTavOUqnRAKRO7bkNOieI+RYbSpCBvi1Y2jj/DwVipHYSMaFuWqVtXAaXtClQ4CCTbl1osMZgxm52WHPbGpGkFHcQepBM2HicC9FRqITHderavvuGKZm18kmwGuSCBEGCFSzSOLwiMNVKuQfyC81RwEeqlnZXbF+gYN/cMZwqzmuaD6lAsRa67ZS9/+NQTFZzxKnwH7DeVVa/uYtZI1AlpEBV35SYdrx7oP2etS0l1iA5B26cMEAn6MztOqMAIV6+yRoqpe1kcOnfVidtBf9uClSk+FvsoCF2uTUc6opu7BWXwAj+sPmNZF7l1EgVTR+OEH2MSSjDIV8FxLZaPD0VLmErq9KmU/j5EpuWqwt3eJ1KrSFIrFjFYe0bgpwcvHlW+lgY+2OueH1g7aoQNa4/H0XsdvObClE8dgM/Me7zH2Z9S1pzCiebh63NfjnlcEA5WQy+VJx5kB1T95OtyzNEcavkRnmf0FUluOZi5hrAOeax9Pm6IKmxjTx4xqQz9PmErBEGSi/O33Vdk28hu4wj5d+1KhEWt64w==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(82310400003)(4326008)(36860700001)(6506007)(86362001)(55016002)(508600001)(7696005)(53546011)(83380400001)(110136005)(70586007)(356005)(8676002)(54906003)(26005)(70206006)(2906002)(47076005)(5660300002)(81166007)(8936002)(336012)(52536014)(316002)(9686003)(186003)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2021 10:03:44.9727
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 089fcfc0-f936-4370-22f7-08d98fc31310
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5194

SGkganVsaWVuIA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IFNlbnQ6IEZyaWRheSwgT2N0b2JlciAxNSwgMjAy
MSA0OjU3IFBNDQo+IFRvOiBQZW5ueSBaaGVuZyA8UGVubnkuWmhlbmdAYXJtLmNvbT47IHhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZzsNCj4gc3N0YWJlbGxpbmlAa2VybmVsLm9yZw0KPiBD
YzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+OyBCZXJ0cmFuZCBNYXJxdWlzDQo+IDxCZXJ0
cmFuZC5NYXJxdWlzQGFybS5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIgMS82XSB4ZW46
IGludHJvZHVjZSBYRU5fRE9NQ1RMX0NERl9kaXJlY3RtYXANCj4gDQo+IEhpIFBlbm55LA0KPiAN
Cj4gT24gMTUvMTAvMjAyMSAwNDowOSwgUGVubnkgWmhlbmcgd3JvdGU6DQo+ID4gZGlmZiAtLWdp
dCBhL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYyBiL3hlbi9hcmNoL2FybS9kb21haW5fYnVp
bGQuYw0KPiA+IGluZGV4IDAxNjc3MzFhYjAuLjM3ZTJkNjJkNDcgMTAwNjQ0DQo+ID4gLS0tIGEv
eGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jDQo+ID4gKysrIGIveGVuL2FyY2gvYXJtL2RvbWFp
bl9idWlsZC5jDQo+ID4gQEAgLTMwNjksOCArMzA2OSwxMCBAQCBzdGF0aWMgaW50IF9faW5pdCBj
b25zdHJ1Y3RfZG9tMChzdHJ1Y3QgZG9tYWluICpkKQ0KPiA+ICAgdm9pZCBfX2luaXQgY3JlYXRl
X2RvbTAodm9pZCkNCj4gPiAgIHsNCj4gPiAgICAgICBzdHJ1Y3QgZG9tYWluICpkb20wOw0KPiA+
ICsgICAgLyogRE9NMCBoYXMgYWx3YXlzIGl0cyBtZW1vcnkgZGlyZWN0bHkgbWFwcGVkLiAqLw0K
PiA+ICAgICAgIHN0cnVjdCB4ZW5fZG9tY3RsX2NyZWF0ZWRvbWFpbiBkb20wX2NmZyA9IHsNCj4g
PiAtICAgICAgICAuZmxhZ3MgPSBYRU5fRE9NQ1RMX0NERl9odm0gfCBYRU5fRE9NQ1RMX0NERl9o
YXAsDQo+ID4gKyAgICAgICAgLmZsYWdzID0gWEVOX0RPTUNUTF9DREZfaHZtIHwgWEVOX0RPTUNU
TF9DREZfaGFwIHwNCj4gPiArICAgICAgICAgICAgICAgICBYRU5fRE9NQ1RMX0NERl9kaXJlY3Rt
YXAsDQo+ID4gICAgICAgICAgIC5tYXhfZXZ0Y2huX3BvcnQgPSAtMSwNCj4gPiAgICAgICAgICAg
Lm1heF9ncmFudF9mcmFtZXMgPSBnbnR0YWJfZG9tMF9mcmFtZXMoKSwNCj4gPiAgICAgICAgICAg
Lm1heF9tYXB0cmFja19mcmFtZXMgPSAtMSwNCj4gPiBkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9k
b21haW4uYyBiL3hlbi9jb21tb24vZG9tYWluLmMgaW5kZXgNCj4gPiA4YjUzYzQ5ZDFlLi43YTYx
MzFkYjc0IDEwMDY0NA0KPiA+IC0tLSBhL3hlbi9jb21tb24vZG9tYWluLmMNCj4gPiArKysgYi94
ZW4vY29tbW9uL2RvbWFpbi5jDQo+ID4gQEAgLTQ4Niw3ICs0ODYsOCBAQCBzdGF0aWMgaW50IHNh
bml0aXNlX2RvbWFpbl9jb25maWcoc3RydWN0DQo+IHhlbl9kb21jdGxfY3JlYXRlZG9tYWluICpj
b25maWcpDQo+ID4gICAgICAgICAgICB+KFhFTl9ET01DVExfQ0RGX2h2bSB8IFhFTl9ET01DVExf
Q0RGX2hhcCB8DQo+ID4gICAgICAgICAgICAgIFhFTl9ET01DVExfQ0RGX3MzX2ludGVncml0eSB8
IFhFTl9ET01DVExfQ0RGX29vc19vZmYgfA0KPiA+ICAgICAgICAgICAgICBYRU5fRE9NQ1RMX0NE
Rl94c19kb21haW4gfCBYRU5fRE9NQ1RMX0NERl9pb21tdSB8DQo+ID4gLSAgICAgICAgICAgWEVO
X0RPTUNUTF9DREZfbmVzdGVkX3ZpcnQgfCBYRU5fRE9NQ1RMX0NERl92cG11KSApDQo+ID4gKyAg
ICAgICAgICAgWEVOX0RPTUNUTF9DREZfbmVzdGVkX3ZpcnQgfCBYRU5fRE9NQ1RMX0NERl92cG11
IHwNCj4gPiArICAgICAgICAgICBYRU5fRE9NQ1RMX0NERl9kaXJlY3RtYXApICkNCj4gPiAgICAg
ICB7DQo+ID4gICAgICAgICAgIGRwcmludGsoWEVOTE9HX0lORk8sICJVbmtub3duIENERiBmbGFn
cyAlI3hcbiIsIGNvbmZpZy0+ZmxhZ3MpOw0KPiA+ICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsN
Cj4gPiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLWFybS9kb21haW4uaA0KPiA+IGIveGVu
L2luY2x1ZGUvYXNtLWFybS9kb21haW4uaCBpbmRleCAxNGU1NzUyODhmLi5mYzQyYzZhMzEwIDEw
MDY0NA0KPiA+IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS1hcm0vZG9tYWluLmgNCj4gPiArKysgYi94
ZW4vaW5jbHVkZS9hc20tYXJtL2RvbWFpbi5oDQo+ID4gQEAgLTI5LDggKzI5LDggQEAgZW51bSBk
b21haW5fdHlwZSB7DQo+ID4gICAjZGVmaW5lIGlzXzY0Yml0X2RvbWFpbihkKSAoMCkNCj4gPiAg
ICNlbmRpZg0KPiA+DQo+ID4gLS8qIFRoZSBoYXJkd2FyZSBkb21haW4gaGFzIGFsd2F5cyBpdHMg
bWVtb3J5IGRpcmVjdCBtYXBwZWQuICovDQo+ID4gLSNkZWZpbmUgaXNfZG9tYWluX2RpcmVjdF9t
YXBwZWQoZCkgaXNfaGFyZHdhcmVfZG9tYWluKGQpDQo+ID4gKy8qIENoZWNrIGlmIGRvbWFpbiBp
cyBkaXJlY3QtbWFwIG1lbW9yeSBtYXAuICovICNkZWZpbmUNCj4gPiAraXNfZG9tYWluX2RpcmVj
dF9tYXBwZWQoZCkgKGQtPm9wdGlvbnMgJiBYRU5fRE9NQ1RMX0NERl9kaXJlY3RtYXApDQo+ID4N
Cj4gPiAgIHN0cnVjdCB2dGltZXIgew0KPiA+ICAgICAgIHN0cnVjdCB2Y3B1ICp2Ow0KPiA+IGRp
ZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9wdWJsaWMvZG9tY3RsLmggYi94ZW4vaW5jbHVkZS9wdWJs
aWMvZG9tY3RsLmgNCj4gPiBpbmRleCAyMzgzODRiNWFlLi5iNTA1YTBkYjUxIDEwMDY0NA0KPiA+
IC0tLSBhL3hlbi9pbmNsdWRlL3B1YmxpYy9kb21jdGwuaA0KPiA+ICsrKyBiL3hlbi9pbmNsdWRl
L3B1YmxpYy9kb21jdGwuaA0KPiA+IEBAIC03Miw5ICs3MiwxMSBAQCBzdHJ1Y3QgeGVuX2RvbWN0
bF9jcmVhdGVkb21haW4gew0KPiA+ICAgI2RlZmluZSBYRU5fRE9NQ1RMX0NERl9uZXN0ZWRfdmly
dCAgICAoMVUgPDwNCj4gX1hFTl9ET01DVExfQ0RGX25lc3RlZF92aXJ0KQ0KPiA+ICAgLyogU2hv
dWxkIHdlIGV4cG9zZSB0aGUgdlBNVSB0byB0aGUgZ3Vlc3Q/ICovDQo+ID4gICAjZGVmaW5lIFhF
Tl9ET01DVExfQ0RGX3ZwbXUgICAgICAgICAgICgxVSA8PCA3KQ0KPiA+ICsvKiBJZiB0aGlzIGRv
bWFpbiBoYXMgaXRzIG1lbW9yeSBkaXJlY3RseSBtYXBwZWQ/IChBUk0gb25seSkgKi8NCj4gPiAr
I2RlZmluZSBYRU5fRE9NQ1RMX0NERl9kaXJlY3RtYXAgICAgICAoMVUgPDwgOCkNCj4gPg0KPiA+
ICAgLyogTWF4IFhFTl9ET01DVExfQ0RGXyogY29uc3RhbnQuICBVc2VkIGZvciBBQkkgY2hlY2tp
bmcuICovDQo+ID4gLSNkZWZpbmUgWEVOX0RPTUNUTF9DREZfTUFYIFhFTl9ET01DVExfQ0RGX3Zw
bXUNCj4gPiArI2RlZmluZSBYRU5fRE9NQ1RMX0NERl9NQVggWEVOX0RPTUNUTF9DREZfZGlyZWN0
bWFwDQo+IA0KPiBJbiB0aGUgcHJldmlvdXMgdmVyc2lvbiwgdGhpcyBmbGFnIHdhcyBvbmx5IHNl
dHRhYmxlIGZvciBkb21haW4gY3JlYXRlZCBieSBYZW4uDQo+IE5vdyB0aGlzIGlzIGFsc28gc2V0
dGFibGUgYnkgdGhlIHRvb2xzdGFjay4gSSBkb24ndCB0aGluayB0aGUgdG9vbHN0YWNrIGNhbg0K
PiBzZW5zaWJseSB1c2UgdGhpcyBmbGFnIChhdCBsZWFzdCBpbiB0aGUgY3VycmVudCBzdGF0ZSku
DQo+IA0KPiBTbyBjYW4geW91IGV4cGxhaW4gd2h5IHRoaXMgZmxhZyBpcyBleHBvc2VkIHRvIHRo
ZSB0b29sc3RhY2s/DQoNCk9oLCAgSSBtaXN1bmRlcnN0b29kIHRoZSBwcmV2aW91cyBkaXNjdXNz
aW9uIG9uIGludGVybmFsIHVzYWdlIGEgYml0LCBzb3JyeS4NCg0KQW5kIEkgd2lsbCBtYWtlIGl0
IGJhY2sgdG8geGVuL2luY2x1ZGUveGVuL2RvbWFpbi5oIA0KDQo+IA0KPiBDaGVlcnMsDQo+IA0K
PiAtLQ0KPiBKdWxpZW4gR3JhbGwNCg==

