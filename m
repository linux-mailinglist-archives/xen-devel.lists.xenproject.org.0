Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC52D6F6CEE
	for <lists+xen-devel@lfdr.de>; Thu,  4 May 2023 15:29:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529770.824533 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puZ1j-0002xb-L5; Thu, 04 May 2023 13:29:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529770.824533; Thu, 04 May 2023 13:29:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puZ1j-0002vn-I0; Thu, 04 May 2023 13:29:43 +0000
Received: by outflank-mailman (input) for mailman id 529770;
 Thu, 04 May 2023 13:29:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UZDr=AZ=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1puZ1i-0002vd-3o
 for xen-devel@lists.xenproject.org; Thu, 04 May 2023 13:29:42 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20608.outbound.protection.outlook.com
 [2a01:111:f400:fe16::608])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b87d0ade-ea7f-11ed-8611-37d641c3527e;
 Thu, 04 May 2023 15:29:39 +0200 (CEST)
Received: from DU2PR04CA0224.eurprd04.prod.outlook.com (2603:10a6:10:2b1::19)
 by AS2PR08MB8879.eurprd08.prod.outlook.com (2603:10a6:20b:5f6::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31; Thu, 4 May
 2023 13:29:27 +0000
Received: from DBAEUR03FT027.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2b1:cafe::c9) by DU2PR04CA0224.outlook.office365.com
 (2603:10a6:10:2b1::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.25 via Frontend
 Transport; Thu, 4 May 2023 13:29:27 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT027.mail.protection.outlook.com (100.127.142.237) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6363.22 via Frontend Transport; Thu, 4 May 2023 13:29:27 +0000
Received: ("Tessian outbound 3a01b65b5aad:v136");
 Thu, 04 May 2023 13:29:27 +0000
Received: from a4358d686b9b.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2593CD0A-A6BF-41A1-AAC0-2B0613541D6F.1; 
 Thu, 04 May 2023 13:29:15 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a4358d686b9b.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 04 May 2023 13:29:15 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by DB9PR08MB8409.eurprd08.prod.outlook.com (2603:10a6:10:3d7::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.26; Thu, 4 May
 2023 13:29:12 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::bce1:f206:86af:31be]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::bce1:f206:86af:31be%6]) with mapi id 15.20.6363.021; Thu, 4 May 2023
 13:29:12 +0000
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
X-Inumbo-ID: b87d0ade-ea7f-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3ioYc2i7kK+BhRWyxLCx2x30+Dx/K6ksmcXzJy71rcM=;
 b=KfUgqdLpDH9LqZzqfKkq5wbuDve+oCWVumPMxI9LLvuyzOiRMN3TpeNq9FjHQGbN137ZTYRLa6esXh6im5CczOjMbYtXFwzAdVDJ+DEofNOQB2bPS1f9zXYRjPAh+WeVBUspUXw1gIjPklQXD/HWg03DqBLRgaKVDhqwEzOszvE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1155cd88e01115dd
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B7RgcxXW/soawQ5XTGABrJh8CU985W/sUO8XR21NzCtAvH36uKy07ECEyoI5TLZHkqI8Ey2jMAKGnWYINLuVD05vF9qMN9BEOPOh0+fR4j6otT5QvBDe5Nh/ehOXjmFQTAHysSBMsySQo7FInjqRiWTYwq459gUUWiOZh1ri5RDxjSapu7aQiEG2NskWF18xXtq0G2lafb2qnPsMoGI6HDJokarQBULOdLu9/zff0ko6hxrP41cxGqnUdfzhsdMj4T8vFOEHn2q2WvnNwSMHENjBMctskEQxCaB1ImmWAAoh8Pb0I1kzMus1S1qhYfZsSuk1Xd8DGI8OryH4Gh3mFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3ioYc2i7kK+BhRWyxLCx2x30+Dx/K6ksmcXzJy71rcM=;
 b=HZt6A48AL0Y14l5trIvBleqIK1bP2aYPuYbYpuWrLW2bKmvW3VXBabIY7pEObqdBeC6JqavoHmoiQAhS34pN+7tpOou5fYOfjHFKZMVaZgzKTSW8IWqd0Kccw1WIrw66kyJXPX5HMrB6ixBgn5yLOo/IVDRlWG7GeUm+uOscAKxJeGwM7XS7USeCFw2cspw7YfKGA9boMepWEuEqRQ5rzVBdZidQ0q4olfRG8Zq0XvBjN8lby5BNIQI2nEu5Tc6VuJvasIKhCdJ5qH6sfgrg2RfYOJVlQ0Szcs20N6MpJGXSLCg8Mhgk8DNPH6mEv4Mm591WIapWnu8gg0kjTVdX2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3ioYc2i7kK+BhRWyxLCx2x30+Dx/K6ksmcXzJy71rcM=;
 b=KfUgqdLpDH9LqZzqfKkq5wbuDve+oCWVumPMxI9LLvuyzOiRMN3TpeNq9FjHQGbN137ZTYRLa6esXh6im5CczOjMbYtXFwzAdVDJ+DEofNOQB2bPS1f9zXYRjPAh+WeVBUspUXw1gIjPklQXD/HWg03DqBLRgaKVDhqwEzOszvE=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH 2/3] xen/misra: xen-analysis.py: allow cppcheck version
 above 2.7
Thread-Topic: [PATCH 2/3] xen/misra: xen-analysis.py: allow cppcheck version
 above 2.7
Thread-Index: AQHZfooyZwW8K0Ij5Ua0WLJyhged2K9KGRcAgAACm4A=
Date: Thu, 4 May 2023 13:29:12 +0000
Message-ID: <55F767F3-1963-4842-9FBB-9CEF547E9C6B@arm.com>
References: <20230504131245.2985400-1-luca.fancellu@arm.com>
 <20230504131245.2985400-3-luca.fancellu@arm.com>
 <a349cf91-b103-7177-1f1b-743f0894f517@citrix.com>
In-Reply-To: <a349cf91-b103-7177-1f1b-743f0894f517@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|DB9PR08MB8409:EE_|DBAEUR03FT027:EE_|AS2PR08MB8879:EE_
X-MS-Office365-Filtering-Correlation-Id: 208d0b27-8878-4221-c09e-08db4ca39553
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 04f8WVWR8J4TBkAOx/PO+t5b7V8nbKI1Np1l/X4LXewaJXZEdS34L+m34LE7DhFBUPgX5163M9ksHE9cjIJP1tc1mwL9QMfI27/5qv9oocrGz3YG4Azy5Yn5alIxxrwcHEQPkdX6nQtbQ2KuMOlGTx3LYodHgMNgmdFFpM+rqvUxLcLI2sLXpN/JGcnOkBQ4FhoG7Bz41EyV9mlz7n7EhEtojb7BmU4OwL11XVu5APHchfdTCsZu70QaD1CRUu/CZ0nG5ZYavqLO8Z41aLSCBV11a9ywnaCKeWBysaa3J0dADgW//oo3dWP00JLIxpbWGUe+0/wPekzDvQ8AEDzrXAI1rPf8GfROm5HXTlN42cScJyxzefTTSwIPRmxgPhXN9f2oYo3TnOD+zmw6Nri4vIIIFK9+CVrjp3Yp1YJ5N1GXiNMABMFNhEGWhj97w2Yd34kVYSuD2SVmjzpu2h1tGp6iqWxV2C813bfkJYZG7euWg1Q7cY9PB7tvZ4ITLllA8TJweEgiHqkjaZgPcJ7a1Ma/VqUbQrJbXwmMz+S4lL8In3xeo564rYOWI5wThS8SPC8CmA82sOSmI4pHCSctbwva0DrZGdjNs94RodpY5xO9XTcEuVkI6XXbe23pl9uOXUhnSk1QXSFAupxdSq4dMg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(366004)(39860400002)(376002)(346002)(451199021)(83380400001)(5660300002)(54906003)(2906002)(76116006)(66946007)(38100700002)(186003)(316002)(122000001)(8676002)(8936002)(53546011)(6512007)(6506007)(26005)(38070700005)(41300700001)(91956017)(33656002)(2616005)(6486002)(36756003)(64756008)(66556008)(66476007)(66446008)(4326008)(6916009)(71200400001)(478600001)(86362001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <14A7FD90F52B5E408553DD35886720C4@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8409
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0aab4699-f55d-488a-3033-08db4ca38c5d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZoKO/XSerFvWa9lo4oFLhVIwXCCwebcTi6Xky5qV3jLp996Odyenq+dsRhPQyF4QwBWPQRbVIvNn2IdozxrcGg2kbyYUKAsgE0tt0/UDZoio8idTCfORzLtGma58N9XHWDmPpW8xjJe/SH/UXWKCk5rwpR/MOrshBi6gGPp439lxS1qoRtRVF1kyouYlBtCx3+7fOgaDXszaTCvLxEYfWGHpOOYSO+LQFDH4ftDZz4s/SCygd1xCU2aTU5VUlOi8mPUoWPdK4VrMugQzo8QXf/BWjSCK50m4zMhUppntHSQxK0pxnQrxMbFPti8OV6Ez0D6Zow/rm/RAybnhmSGvmoK9NcRC3RnBr4JCcG3A8SFZTMEcUYDMK8KHYvimEKtcB8+n6t9WSclk96WEyhIijjBAaifRLgvOo9dwnKm+/wGxHK/37JAdFE6ejPj/xeBnKolpytCx86aGu5xV19PwJGuvJ85alb/zXPJDmVBz6xzG+OBp+vb9tzXipKS+ddS3UebIe+EWp+UsymRmTcsHUpmlI1wkBYEdXRP4zrAQoZLTEqV0JGsQdHeASnyxhtsKT9Hokk+RygLPSq7KR5N9fjCIAeibEr9jxQ5XW6PN5SIPtDz7NPKrwsxFkzFGKsvC5b6pVWaIwvBJl+Vq91HRLY7U6+rmQaQaukh1rXBKNLCOWvhnPf9eIAiu/7tzNhDAqmicnkyAVPzIDrooc93GQKLNYGJI2TIDwAqFeDqlKxA=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(136003)(346002)(396003)(451199021)(40470700004)(36840700001)(46966006)(40460700003)(336012)(2616005)(2906002)(47076005)(316002)(6506007)(34020700004)(26005)(6512007)(53546011)(70206006)(4326008)(36860700001)(70586007)(54906003)(41300700001)(5660300002)(6486002)(8936002)(8676002)(6862004)(40480700001)(478600001)(83380400001)(186003)(81166007)(356005)(86362001)(33656002)(82310400005)(36756003)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2023 13:29:27.1731
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 208d0b27-8878-4221-c09e-08db4ca39553
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8879

DQoNCj4gT24gNCBNYXkgMjAyMywgYXQgMTQ6MTksIEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29w
ZXIzQGNpdHJpeC5jb20+IHdyb3RlOg0KPiANCj4gT24gMDQvMDUvMjAyMyAyOjEyIHBtLCBMdWNh
IEZhbmNlbGx1IHdyb3RlOg0KPj4gQWxsb3cgdGhlIHVzZSBvZiBDcHBjaGVjayB2ZXJzaW9uIGFi
b3ZlIDIuNywgZXhjZXB0aW9uIGZvciAyLjggd2hpY2gNCj4+IGlzIGtub3duIGFuZCBkb2N1bWVu
dGVkIGRvIGJlIGJyb2tlbi4NCj4+IA0KPj4gU2lnbmVkLW9mZi1ieTogTHVjYSBGYW5jZWxsdSA8
bHVjYS5mYW5jZWxsdUBhcm0uY29tPg0KPj4gLS0tDQo+PiB4ZW4vc2NyaXB0cy94ZW5fYW5hbHlz
aXMvY3BwY2hlY2tfYW5hbHlzaXMucHkgfCAyMCArKysrKysrKysrKysrKystLS0tDQo+PiAxIGZp
bGUgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkNCj4+IA0KPj4gZGlm
ZiAtLWdpdCBhL3hlbi9zY3JpcHRzL3hlbl9hbmFseXNpcy9jcHBjaGVja19hbmFseXNpcy5weSBi
L3hlbi9zY3JpcHRzL3hlbl9hbmFseXNpcy9jcHBjaGVja19hbmFseXNpcy5weQ0KPj4gaW5kZXgg
NjU4Nzk1YmI5ZjViLi5jMzc4M2U4ZGYzNDMgMTAwNjQ0DQo+PiAtLS0gYS94ZW4vc2NyaXB0cy94
ZW5fYW5hbHlzaXMvY3BwY2hlY2tfYW5hbHlzaXMucHkNCj4+ICsrKyBiL3hlbi9zY3JpcHRzL3hl
bl9hbmFseXNpcy9jcHBjaGVja19hbmFseXNpcy5weQ0KPj4gQEAgLTE1NywxMyArMTU3LDI1IEBA
IGRlZiBnZW5lcmF0ZV9jcHBjaGVja19kZXBzKCk6DQo+PiAgICAgICAgICAgICAiRXJyb3Igb2Nj
dXJlZCByZXRyaWV2aW5nIGNwcGNoZWNrIHZlcnNpb246XG57fVxuXG57fSINCj4+ICAgICAgICAg
KQ0KPj4gDQo+PiAtICAgIHZlcnNpb25fcmVnZXggPSByZS5zZWFyY2goJ15DcHBjaGVjayAoLiop
JCcsIGludm9rZV9jcHBjaGVjaywgZmxhZ3M9cmUuTSkNCj4+ICsgICAgdmVyc2lvbl9yZWdleCA9
IHJlLnNlYXJjaCgnXkNwcGNoZWNrIChcZCspLihcZCspKD86LlxkKyk/JCcsDQo+PiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgaW52b2tlX2NwcGNoZWNrLCBmbGFncz1yZS5NKQ0KPj4g
ICAgICMgQ3VycmVudGx5LCBvbmx5IGNwcGNoZWNrIHZlcnNpb24gPj0gMi43IGlzIHN1cHBvcnRl
ZCwgYnV0IHZlcnNpb24gMi44IGlzDQo+PiAgICAgIyBrbm93biB0byBiZSBicm9rZW4sIHBsZWFz
ZSByZWZlciB0byBkb2NzL21pc3JhL2NwcGNoZWNrLnR4dA0KPj4gLSAgICBpZiAobm90IHZlcnNp
b25fcmVnZXgpIG9yIChub3QgdmVyc2lvbl9yZWdleC5ncm91cCgxKS5zdGFydHN3aXRoKCIyLjci
KSk6DQo+PiArICAgIGlmIChub3QgdmVyc2lvbl9yZWdleCkgb3IgbGVuKHZlcnNpb25fcmVnZXgu
Z3JvdXBzKCkpIDwgMjoNCj4+ICAgICAgICAgcmFpc2UgQ3BwY2hlY2tEZXBzUGhhc2VFcnJvcigN
Cj4+IC0gICAgICAgICAgICAgICAgIkNhbid0IGZpbmQgY3BwY2hlY2sgdmVyc2lvbiBvciB2ZXJz
aW9uIGlzIG5vdCAyLjciDQo+PiAtICAgICAgICAgICAgICApDQo+PiArICAgICAgICAgICAgIkNh
bid0IGZpbmQgY3BwY2hlY2sgdmVyc2lvbiBvciB2ZXJzaW9uIG5vdCBpZGVudGlmaWVkOiAiDQo+
PiArICAgICAgICAgICAgInt9Ii5mb3JtYXQoaW52b2tlX2NwcGNoZWNrKQ0KPj4gKyAgICAgICAg
KQ0KPj4gKyAgICBtYWpvciA9IGludCh2ZXJzaW9uX3JlZ2V4Lmdyb3VwKDEpKQ0KPj4gKyAgICBt
aW5vciA9IGludCh2ZXJzaW9uX3JlZ2V4Lmdyb3VwKDIpKQ0KPj4gKyAgICBpZiBtYWpvciA8IDIg
b3IgKG1ham9yID09IDIgYW5kIG1pbm9yIDwgNyk6DQo+PiArICAgICAgICByYWlzZSBDcHBjaGVj
a0RlcHNQaGFzZUVycm9yKA0KPj4gKyAgICAgICAgICAgICJDcHBjaGVjayB2ZXJzaW9uIDwgMi43
IGlzIG5vdCBzdXBwb3J0ZWQiDQo+PiArICAgICAgICApDQo+PiArICAgIGlmIG1ham9yID09IDIg
YW5kIG1pbm9yID09IDg6DQo+PiArICAgICAgICByYWlzZSBDcHBjaGVja0RlcHNQaGFzZUVycm9y
KA0KPj4gKyAgICAgICAgICAgICJDcHBjaGVjayB2ZXJzaW9uIDIuOCBpcyBrbm93biB0byBiZSBi
cm9rZW4sIHNlZSB0aGUgZG9jdW1lbnRhdGlvbiINCj4+ICsgICAgICAgICkNCj4gDQo+IFB5dGhv
biBzb3J0cyB0dXBsZXMgdGhlIGhlbHBmdWwgd2F5IGFyb3VuZCwgc28gZm9yIGV4YW1wbGUNCj4g
DQo+IHYgPSAoMiwgOSkNCj4gDQo+IGlmIHYgPCAoMiwgNykgb3IgdiA9PSAoMiwgOCk6DQo+ICAg
ICAjIGhhbmRsZSBlcnJvcg0KPiANCj4gZG9lcyB3aGF0IHlvdSB3YW50LCBhbmQgZmFyIG1vcmUg
Y29uY2lzZWx5Lg0KDQpIaSBBbmRyZXcsDQoNClRoYW5rIHlvdSwgdGhpcyBpcyB2ZXJ5IGhlbHBm
dWwsIGl04oCZcyBjbGVhciB0aGF0IEnigJltIGF0IG15IGZpcnN0IGV4cGVyaWVuY2VzIHdpdGgg
UHl0aG9uLA0KSSB3aWxsIGNoYW5nZSB0aGUgY29kZSB0byB1c2UgdGhpcyBtb3JlIGNvaW5jaXNl
IGZvcm0uDQoNCkNoZWVycywNCkx1Y2ENCg0KPiANCj4gfkFuZHJldw0KDQoNCg==

