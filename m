Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3FAD68D400
	for <lists+xen-devel@lfdr.de>; Tue,  7 Feb 2023 11:24:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.490981.759904 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPL96-00061q-Cn; Tue, 07 Feb 2023 10:24:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 490981.759904; Tue, 07 Feb 2023 10:24:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPL96-0005yy-8Y; Tue, 07 Feb 2023 10:24:16 +0000
Received: by outflank-mailman (input) for mailman id 490981;
 Tue, 07 Feb 2023 10:24:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IfLv=6D=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1pPL94-0005ys-Kv
 for xen-devel@lists.xenproject.org; Tue, 07 Feb 2023 10:24:14 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on061e.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::61e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8decf71a-a6d1-11ed-93b5-47a8fe42b414;
 Tue, 07 Feb 2023 11:24:08 +0100 (CET)
Received: from DB7PR05CA0021.eurprd05.prod.outlook.com (2603:10a6:10:36::34)
 by AS8PR08MB8246.eurprd08.prod.outlook.com (2603:10a6:20b:522::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.32; Tue, 7 Feb
 2023 10:24:03 +0000
Received: from DBAEUR03FT017.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:36:cafe::9b) by DB7PR05CA0021.outlook.office365.com
 (2603:10a6:10:36::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.35 via Frontend
 Transport; Tue, 7 Feb 2023 10:24:03 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT017.mail.protection.outlook.com (100.127.142.243) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6064.34 via Frontend Transport; Tue, 7 Feb 2023 10:24:02 +0000
Received: ("Tessian outbound 3ad958cd7492:v132");
 Tue, 07 Feb 2023 10:24:02 +0000
Received: from 1ec843b26cfa.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 CD080F3A-05C8-4F5F-A3CD-87A9B0ACFC32.1; 
 Tue, 07 Feb 2023 10:23:55 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1ec843b26cfa.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 07 Feb 2023 10:23:55 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by AS4PR08MB7507.eurprd08.prod.outlook.com (2603:10a6:20b:4f9::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.34; Tue, 7 Feb
 2023 10:23:54 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::b14f:1c13:afa:4eda]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::b14f:1c13:afa:4eda%3]) with mapi id 15.20.6064.034; Tue, 7 Feb 2023
 10:23:54 +0000
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
X-Inumbo-ID: 8decf71a-a6d1-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FqnGrUXDpS3abghYSnDeat7XyrNKciq/92CcdHcngTU=;
 b=0Tk3DBpFXlhnkpGZXIx9PW6j231HN5ueRGSCFx1bzHnIFSKgTmGK7PhDD1GwLQ12ueCj7/AmMD33xImKfpdjosXPzsnDSHZw6gR2NTigjvgkaud1/mWzz2FPWJhwu5pmPsg3lnn0MiWCi7eFHF3QczeSCAYgW/jElFVUKWq2PY0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0d094df87cc121cd
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f+9KV4UTRMg4tVcSz8O3WUAHUKiYVkbg9C5HrIt2kD4j2BLM5eRoBJLf8lp2EC4V1nWFIBQxXo1fuy83ePBxUDZzmWp7TMo7SptVo2dzdRTFQAxpPYZNYG/zG43gzJ3ul8JCtggMWpc2n2aaH+VxUHDTMy1fHvHXeC6kd5Y4ODREq2HmEOraP9Er+I4/Xs/XdDeei95rr6Pd5b4d55/Ev/TsIwKm0x/dOKZrM+G+84Ird60b4CLv3RCbz+ohmOhJ6ipH2QT521dln70tnRihcDMANr/yjc0uySZnx4UWO2rDGcEGreOstolFi1je5rhLrC8mzLeqflpUsKs8t8+zpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FqnGrUXDpS3abghYSnDeat7XyrNKciq/92CcdHcngTU=;
 b=EyCR/v9H6Xm2q2LM21n60XdSIBu2KH710rn/PhzL1HJ+nla8bfh47dFRPugyp+OTdFOAQdO3B8gqUD4irjfi3yANc0vt5gOjbEKkpdAK+pbMmExq4BwptfqdCv9kg8e1/ivLM7XUN8KvwdXL0GilD72W1lRI1z7+ab/oxcCXV/zEtdW0Ex9rP04Z6B4JL1sPU6vcdVZGG21cAl3tQAv/Z7dxpFQxBvl9c7Sak0Zjtpg+2dpt01BTwzaeM3eeulBiongdJnFserFO2McLyN8JVvMBda/hJwU5BbTb0XlZD5bF5Wgz0X2zwYwllalv6GatM0sA+XR6fo0mWd43UUSrcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FqnGrUXDpS3abghYSnDeat7XyrNKciq/92CcdHcngTU=;
 b=0Tk3DBpFXlhnkpGZXIx9PW6j231HN5ueRGSCFx1bzHnIFSKgTmGK7PhDD1GwLQ12ueCj7/AmMD33xImKfpdjosXPzsnDSHZw6gR2NTigjvgkaud1/mWzz2FPWJhwu5pmPsg3lnn0MiWCi7eFHF3QczeSCAYgW/jElFVUKWq2PY0=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Xenia Ragiadakou <burzalodowa@gmail.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Subject: Re: [PATCH v3 1/2] xen/device_tree: fix Eclair findings for MISRA C
 2012 Rule 20.7
Thread-Topic: [PATCH v3 1/2] xen/device_tree: fix Eclair findings for MISRA C
 2012 Rule 20.7
Thread-Index: AQHZOAMhFrHFBGWgpEqoPT1xaNlgs67DTHuA
Date: Tue, 7 Feb 2023 10:23:54 +0000
Message-ID: <F9BF9B83-7889-4D51-B0B3-09950071AB75@arm.com>
References: <20230203190908.211541-1-burzalodowa@gmail.com>
 <20230203190908.211541-2-burzalodowa@gmail.com>
In-Reply-To: <20230203190908.211541-2-burzalodowa@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.400.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|AS4PR08MB7507:EE_|DBAEUR03FT017:EE_|AS8PR08MB8246:EE_
X-MS-Office365-Filtering-Correlation-Id: 80a33c4b-f0d2-4106-3d37-08db08f56ef9
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 apiCLDPGZWOsQJrUisBcOAYZkQtD1/KK7dMcBCoBULEYWJOht16BetvA+I3pbhvrJRLUFbM1gKA3m+j+iezCz98Vgb0x4Y9TkW91vI1mhtQ4VS5v2xd24Rt1ZNq7byo2YNFsNBzFBw6edkAO4uHtfj/XnHyjvKQz54cBFKC/Ow9H4R46KFZRhRWBgU41aFVzu3oBPiviJBPS7NK7vBgZDGCBg10Nm74ae8BQjQ3in5yOXxaOXDLZaVmzt92Kzy0NA0rU/6i7M5t94plL17qaaaA15PYGSOejXxqVWTOjFi7mmgK1O+zxuZ6FdCWSCiUQcOQbMOq4H3lYpTc8SkjXg9+h8tgpKESKeIvhvGVwQAdOHGXxIk5dNwYP8laK8cPac5ibpwaGLioWGFVY3THcS2G1Z3TH/pK20iGh4u24Iz4gb2Bvzg2ceYqB8ZzYnH56/IJpKl55W9cSZvEiOm6zifnVQg3D7hTHqhsXb5yD3xmpXvMpSSJRZEBGEj1YuGqsAsWU3Y2EZiNOhVRJDXV/oDkR7LYiu8sv0RCyMXeJgRimszBM/a+OC3C57ALQ8lGzSsz8V0X8S63q5kwrtvDF6Cga/T6XU4tYOYqg4mP0gkv2dkqp7Xw+LduSjNfQaEb0r2We3R9HDICPuBEKa4Yg1F80JmvQvBdjyfWSqxsHqdy4J5/7ARmW7iShPIvb5nWQYD5CR3SSnPWK2E6hQtfM30+kcDFWAQ+wk9aDyg40Hok=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(376002)(346002)(396003)(366004)(39860400002)(451199018)(36756003)(33656002)(38100700002)(86362001)(38070700005)(6916009)(66446008)(66556008)(54906003)(8936002)(66946007)(4326008)(41300700001)(8676002)(91956017)(5660300002)(316002)(66476007)(122000001)(76116006)(64756008)(2906002)(2616005)(83380400001)(478600001)(6512007)(26005)(186003)(53546011)(6506007)(6486002)(71200400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <D9EC99551D49E642AF97BE86ECDCCA1C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7507
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	68eaa278-778b-4071-6a0a-08db08f56a02
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8CJbgmrUEVTU2KCbwGnec04p27lc1TCORsT2NObHcuLLDJhcELk0WwWGy6J0Tc780+7z2uRUgqGxjUWm+5G+bq5qnvYNvofipI4xTuhyeoq+9H5Sr/wpvh970ynGsg84vYLuIvlDpLhIBw0xtWDkNV6QppIjSnsFHAAOI6MtUeag9OCoWkEv/QIQiNVQ7/Ij4qAkHbt6NYahfbAN6dmlt8zvw4A0Ht2DkchVxgD2O2X4l3/eiIWcoBTDBv/8R2HSSkloc9ct/4+X0ZkFBoDvBpBbcb/h9eZuoSKrVmvGwGYU3aj9IzGGN07KeW9h5Kg7YlSZAaC5u/2QyANrTC99lNUCKXhBbLTO/c78mz8YzhBxHtJcXzjSfWesh+IUwVeBX+txcplO5T14CCrX/wtIor685FLsKTwnJMuWYTChsR33H4+EitFpS//DbNKfgZLylAxjBti9z01PTg2rsLE0drjrrj3+dyIUDTmwh0K9NklsecamDos1pHTh/1CPYCYdr+PPLyPY+UAQKYh56xepNM+03Q31k5F9gFxlBD0e1Mm3kaNFt6P6OmuEw8ANj1toSOFZtNug8gEi0OJhul2C+F89pAqzoZZbGIMYkG9XDw0Z3+jFcUP+lHLjiM0gGmGrjNsmvliO9+Ukl2MwbksWtI6+zFA+wX5iPSSRLv8hslL6Uq+u2i5FWH3c1OeqBfbIEVBUx15tf9iYbPA702XhAA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(396003)(136003)(376002)(346002)(39860400002)(451199018)(46966006)(40470700004)(36840700001)(36860700001)(86362001)(33656002)(36756003)(81166007)(82740400003)(70586007)(5660300002)(356005)(6862004)(4326008)(8936002)(316002)(8676002)(70206006)(41300700001)(82310400005)(54906003)(40480700001)(2906002)(6486002)(47076005)(40460700003)(478600001)(83380400001)(336012)(2616005)(26005)(6512007)(53546011)(186003)(6506007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2023 10:24:02.4894
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 80a33c4b-f0d2-4106-3d37-08db08f56ef9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8246

DQoNCj4gT24gMyBGZWIgMjAyMywgYXQgMTk6MDksIFhlbmlhIFJhZ2lhZGFrb3UgPGJ1cnphbG9k
b3dhQGdtYWlsLmNvbT4gd3JvdGU6DQo+IA0KDQpJ4oCZbSBub3QgcmVhbGx5IGEgc3VwcG9ydGVy
IG9mIGVtcHR5IGNvbW1pdCBtZXNzYWdlLCBidXQgaXTigJlzIHVwIHRvIHRoZSBtYWludGFpbmVy
IDopDQoNCkZvciBtZSB0aGUgY2hhbmdlcyBsb29rcyBnb29kDQoNClJldmlld2VkLWJ5OiBMdWNh
IEZhbmNlbGx1IDxsdWNhLmZhbmNlbGx1QGFybS5jb20+DQoNCg0KPiBTaWduZWQtb2ZmLWJ5OiBY
ZW5pYSBSYWdpYWRha291IDxidXJ6YWxvZG93YUBnbWFpbC5jb20+DQo+IC0tLQ0KPiANCj4gQ2hh
bmdlcyBpbiB2MzoNCj4gIC0gdGhlIGZpeGVzIGFyZSBiYXNlZCBzb2xlbHkgdG8gRWNsYWlyIGZp
bmRpbmdzICh0aGUgdG9vbCBoYXMgYmVlbg0KPiAgICBhZGp1c3RlZCB0byByZXBvcnQgb25seSB0
aG9zZSB2aW9sYXRpb25zIHRoYXQgY2FuIHJlc3VsdCB0byBhIGJ1ZykNCj4gIC0gcmVmbGVjdCB0
aGlzIGluIHRoZSBjb21taXQgdGl0bGUNCj4gDQo+IHhlbi9pbmNsdWRlL3hlbi9kZXZpY2VfdHJl
ZS5oIHwgMTQgKysrKysrKy0tLS0tLS0NCj4gMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygr
KSwgNyBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS94ZW4vZGV2
aWNlX3RyZWUuaCBiL3hlbi9pbmNsdWRlL3hlbi9kZXZpY2VfdHJlZS5oDQo+IGluZGV4IGEyODkz
N2QxMmFlOC4uNzgzOWExOTllMzExIDEwMDY0NA0KPiAtLS0gYS94ZW4vaW5jbHVkZS94ZW4vZGV2
aWNlX3RyZWUuaA0KPiArKysgYi94ZW4vaW5jbHVkZS94ZW4vZGV2aWNlX3RyZWUuaA0KPiBAQCAt
MzcsMTEgKzM3LDExIEBAIHN0cnVjdCBkdF9kZXZpY2VfbWF0Y2ggew0KPiAgICAgY29uc3Qgdm9p
ZCAqZGF0YTsNCj4gfTsNCj4gDQo+IC0jZGVmaW5lIF9fRFRfTUFUQ0hfUEFUSChwKSAgICAgICAg
ICAgICAgLnBhdGggPSBwDQo+IC0jZGVmaW5lIF9fRFRfTUFUQ0hfVFlQRSh0eXApICAgICAgICAg
ICAgLnR5cGUgPSB0eXANCj4gLSNkZWZpbmUgX19EVF9NQVRDSF9DT01QQVRJQkxFKGNvbXBhdCkg
ICAuY29tcGF0aWJsZSA9IGNvbXBhdA0KPiArI2RlZmluZSBfX0RUX01BVENIX1BBVEgocCkgICAg
ICAgICAgICAgIC5wYXRoID0gKHApDQo+ICsjZGVmaW5lIF9fRFRfTUFUQ0hfVFlQRSh0eXApICAg
ICAgICAgICAgLnR5cGUgPSAodHlwKQ0KPiArI2RlZmluZSBfX0RUX01BVENIX0NPTVBBVElCTEUo
Y29tcGF0KSAgIC5jb21wYXRpYmxlID0gKGNvbXBhdCkNCj4gI2RlZmluZSBfX0RUX01BVENIX05P
VF9BVkFJTEFCTEUoKSAgICAgIC5ub3RfYXZhaWxhYmxlID0gMQ0KPiAtI2RlZmluZSBfX0RUX01B
VENIX1BST1AocCkgICAgICAgICAgICAgIC5wcm9wID0gcA0KPiArI2RlZmluZSBfX0RUX01BVENI
X1BST1AocCkgICAgICAgICAgICAgIC5wcm9wID0gKHApDQo+IA0KPiAjZGVmaW5lIERUX01BVENI
X1BBVEgocCkgICAgICAgICAgICAgICAgeyBfX0RUX01BVENIX1BBVEgocCkgfQ0KPiAjZGVmaW5l
IERUX01BVENIX1RZUEUodHlwKSAgICAgICAgICAgICAgeyBfX0RUX01BVENIX1RZUEUodHlwKSB9
DQo+IEBAIC0yMjYsMTMgKzIyNiwxMyBAQCBkdF9maW5kX2ludGVycnVwdF9jb250cm9sbGVyKGNv
bnN0IHN0cnVjdCBkdF9kZXZpY2VfbWF0Y2ggKm1hdGNoZXMpOw0KPiAjZGVmaW5lIERUX1JPT1Rf
Tk9ERV9TSVpFX0NFTExTX0RFRkFVTFQgMQ0KPiANCj4gI2RlZmluZSBkdF9mb3JfZWFjaF9wcm9w
ZXJ0eV9ub2RlKGRuLCBwcCkgICAgICAgICAgICAgICAgICAgXA0KPiAtICAgIGZvciAoIHBwID0g
ZG4tPnByb3BlcnRpZXM7IHBwICE9IE5VTEw7IHBwID0gcHAtPm5leHQgKQ0KPiArICAgIGZvciAo
IHBwID0gKGRuKS0+cHJvcGVydGllczsgKHBwKSAhPSBOVUxMOyBwcCA9IChwcCktPm5leHQgKQ0K
PiANCj4gI2RlZmluZSBkdF9mb3JfZWFjaF9kZXZpY2Vfbm9kZShkdCwgZG4pICAgICAgICAgICAg
ICAgICAgICAgXA0KPiAtICAgIGZvciAoIGRuID0gZHQ7IGRuICE9IE5VTEw7IGRuID0gZG4tPmFs
bG5leHQgKQ0KPiArICAgIGZvciAoIGRuID0gZHQ7IChkbikgIT0gTlVMTDsgZG4gPSAoZG4pLT5h
bGxuZXh0ICkNCj4gDQo+ICNkZWZpbmUgZHRfZm9yX2VhY2hfY2hpbGRfbm9kZShkdCwgZG4pICAg
ICAgICAgICAgICAgICAgICAgIFwNCj4gLSAgICBmb3IgKCBkbiA9IGR0LT5jaGlsZDsgZG4gIT0g
TlVMTDsgZG4gPSBkbi0+c2libGluZyApDQo+ICsgICAgZm9yICggZG4gPSAoZHQpLT5jaGlsZDsg
KGRuKSAhPSBOVUxMOyBkbiA9IChkbiktPnNpYmxpbmcgKQ0KPiANCj4gLyogSGVscGVyIHRvIHJl
YWQgYSBiaWcgbnVtYmVyOyBzaXplIGlzIGluIGNlbGxzIChub3QgYnl0ZXMpICovDQo+IHN0YXRp
YyBpbmxpbmUgdTY0IGR0X3JlYWRfbnVtYmVyKGNvbnN0IF9fYmUzMiAqY2VsbCwgaW50IHNpemUp
DQo+IC0tIA0KPiAyLjM3LjINCj4gDQo+IA0KDQo=

