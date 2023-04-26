Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6176EF68F
	for <lists+xen-devel@lfdr.de>; Wed, 26 Apr 2023 16:37:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.526729.818640 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prgGt-0005PA-Rv; Wed, 26 Apr 2023 14:37:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 526729.818640; Wed, 26 Apr 2023 14:37:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prgGt-0005MB-Or; Wed, 26 Apr 2023 14:37:27 +0000
Received: by outflank-mailman (input) for mailman id 526729;
 Wed, 26 Apr 2023 14:37:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jz9v=AR=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1prgGr-0005M5-Oq
 for xen-devel@lists.xenproject.org; Wed, 26 Apr 2023 14:37:25 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0606.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::606])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id db7b37ca-e43f-11ed-8611-37d641c3527e;
 Wed, 26 Apr 2023 16:37:23 +0200 (CEST)
Received: from AM5PR0201CA0011.eurprd02.prod.outlook.com
 (2603:10a6:203:3d::21) by AM9PR08MB6098.eurprd08.prod.outlook.com
 (2603:10a6:20b:2d9::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.21; Wed, 26 Apr
 2023 14:37:21 +0000
Received: from AM7EUR03FT054.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:3d:cafe::b9) by AM5PR0201CA0011.outlook.office365.com
 (2603:10a6:203:3d::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33 via Frontend
 Transport; Wed, 26 Apr 2023 14:37:21 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT054.mail.protection.outlook.com (100.127.140.133) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6340.21 via Frontend Transport; Wed, 26 Apr 2023 14:37:20 +0000
Received: ("Tessian outbound e13c2446394c:v136");
 Wed, 26 Apr 2023 14:37:20 +0000
Received: from 4e5ff39aef5e.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 267AAA95-554E-4F2C-B88F-352A1EC34806.1; 
 Wed, 26 Apr 2023 14:37:13 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4e5ff39aef5e.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 26 Apr 2023 14:37:13 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by DU0PR08MB9080.eurprd08.prod.outlook.com (2603:10a6:10:474::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Wed, 26 Apr
 2023 14:37:12 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6b4f:579f:6dca:8b91]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6b4f:579f:6dca:8b91%5]) with mapi id 15.20.6340.021; Wed, 26 Apr 2023
 14:37:12 +0000
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
X-Inumbo-ID: db7b37ca-e43f-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VpklSiqmCRDey2bBIC0y66olfvI4v9WoIdqkHYIUQW4=;
 b=+AFlFwgonlwE/ufNb6HoL5gyV7C3aMAOgK2+qbq3sVBO4VnH/DclZ9CcjwmDIWRrdQLk2q/oxhoKuEhYzZG0N73dUgMtWvGBOMc/+Hgra8vCeho3U+uWPsHtcdJTfCLHI10CsgMJM+kHkcuPXoMa+CTA9ahh1GM99ARhwKEQS1c=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: f669797dadd128ce
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bdkVgVykaG9bawPESTtfodSSSEg4ROHhkmm7KTPeol8uTICYJ4/Xm4kD19tXs8F9vsqih0P4EYXV8niaxsU9gHULjvW95vkLy8z+ehAxmhMfPhY8Yg8oLKM7nh0N/Hw/1hjedIXacwy/uRqfPjZ74fwkxUnK+wau4qtjPePZmqqJtNOzCily39aNDsI6bMTHj0CTVNNofeG8TIecRxlrhAF7teptPftMS0I6zG2LglstYkAOuPH+b/Qeays/GDNU8/Zxxvc+ruAC3SBAo4omUccx4Z5xN24PkMKejl056+v6SCHQDf40Z/dZntdj1PcFyhKVbI6UOx5L4/i4vdp5jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VpklSiqmCRDey2bBIC0y66olfvI4v9WoIdqkHYIUQW4=;
 b=KAS1UR3m8ZZCakVf6JmF1oSbnftwEo6jNtFxFqVysVvgH357zIX8TQrH+GORuir9gCuZwgotOufFGU8h7Qc4zUci6Y/6SEmTTi4sYPyjzK3uuJIxseAwLNgNEFwZjwrkjF1puiCUO7foZ7MEj1aUF0Eh1xcpDRxwD1HMzGBPzy8XNQFwq4k21f96dz5aVF/898gdCAy1HLiNDM7Ug8CRQqGrFGggQcOYUg85qeIlkOGvTKYXrTH9qUkSL1rsmId2UWdlsOcbopPM8LohrJxA+0L5onqzBANkVRfqCnjUqgtPw6tNNMilbNcyRSqebZpn0dhYBIltsXsTo8xlQRqOuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VpklSiqmCRDey2bBIC0y66olfvI4v9WoIdqkHYIUQW4=;
 b=+AFlFwgonlwE/ufNb6HoL5gyV7C3aMAOgK2+qbq3sVBO4VnH/DclZ9CcjwmDIWRrdQLk2q/oxhoKuEhYzZG0N73dUgMtWvGBOMc/+Hgra8vCeho3U+uWPsHtcdJTfCLHI10CsgMJM+kHkcuPXoMa+CTA9ahh1GM99ARhwKEQS1c=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH] xen/misra: xen-analysis.py: fix return error on
 PhaseExceptions
Thread-Topic: [PATCH] xen/misra: xen-analysis.py: fix return error on
 PhaseExceptions
Thread-Index: AQHZeCxqGE3P3XkfFUu99Ot710R/Aa89oOqAgAAH2wA=
Date: Wed, 26 Apr 2023 14:37:12 +0000
Message-ID: <367DCC52-C860-4BBF-A9C2-33CD002819D0@arm.com>
References: <20230426104605.3447049-1-luca.fancellu@arm.com>
 <357e94d0-0f49-7854-7562-9f6550d0fdd8@citrix.com>
In-Reply-To: <357e94d0-0f49-7854-7562-9f6550d0fdd8@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|DU0PR08MB9080:EE_|AM7EUR03FT054:EE_|AM9PR08MB6098:EE_
X-MS-Office365-Filtering-Correlation-Id: d912cfea-df70-4efd-53b2-08db4663be03
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 p8v6+hRIZk//5iZ01YwnhGrGP2pBfDjhkJY4AybIROOJ4dKgMD6Ww6b9y89Pq+cuvBFMD/MMS9TBDsWDc1X1T9Du3oWakdtW3ELAcUaa3NcA1TdyBJzd3Wb5BN6ePVR+wkIYYn+o+iLp4HudioIPvGvgDnE+2Rq+AkNzvJeopyMniWxc9WlVWdQrB4cMHncwPNSEptf7Cwd6baJJYBf7K5vVQWWr9wczsbVM/T+UlMVWfsGVdDW+tPLxlvkRILhENEJGfeeK7YN4fxm96SSUrzEFHK6SDnvCpu1FhDmBdR6cguy3xGluu0AgOooP+2ESOQ+IAG2s1zcd2UaaufPNNNu/Sr3OzyQLTcXnZfWg6mrvDWdpIefdYh4x5U6+FMHqkXIcadj9Bn2Oe8tpQ160uPxLDz7zBnlg4Mf1EfSbSbVu+1I64rxrnZ/ABHusJzm3aeOsOibs/riYznwLvZjvAxJ38XB61HWIcvIriHm11s3E253fd1mg1Ao08AVWt4NzKjdIKx8YtU4xq+JaAyfY4E+UeBGNt+knwqiWzlKFL5ceCqt11vhDlkq3MWL0FHtfcCevUCx3FweEkbp2Uwz3ANwyRAhUkU13ivr4qG4dLtS47l7FAlcgizRCDQBSzq7qgKML0WCqhGNxqVU4FHpaHA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(396003)(39860400002)(366004)(376002)(451199021)(6506007)(33656002)(26005)(6512007)(53546011)(86362001)(186003)(2616005)(5660300002)(83380400001)(6486002)(71200400001)(36756003)(8936002)(38070700005)(8676002)(54906003)(41300700001)(316002)(38100700002)(2906002)(66446008)(66476007)(76116006)(66946007)(4326008)(6916009)(478600001)(122000001)(64756008)(91956017)(66556008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <D0AED5687D9CA2458EB49B4AF1F93BDD@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9080
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b6f9c645-5c71-4100-32ea-08db4663b8f1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	idoP69EUXsKjoM4TcE9PHv5XSbR7lqhwBrT4i2K0M8BdzrJi5Y3nZ46Ivmc/8SwgAjoUMPcy2pqZryY6QWvwGSGfkqXCedxtN5u+nDIJx9AjvqXJHUJmg9UbfVFlC9ndAC/12bKsRYRVooFO/Pjhzc/59sfr8P8OBFNtLu+gcXKErnl9YzP1yVjB+YpIXRjVWO99AVGzjfQVm6cY8FAgHW5Oy1qIoGTc5Eh6ut9yjilEyJSIkfZzk97ugKjUFBqQYGKbcBSilV0Yip6ezFKoV28HLmdyD3kUJwknxH3GfxT48i8rylvit4qATbx9fKGYDK4xHwT52AUXDRXdyQQ0ccM2Do96Wm6UB8LC1OIdHckrCqxWSVlflsgyPm52gFxQ+Ba+wI/aiBfpInGRD5G8koyezOhJf0Oz5ySq989VM+cPJshmJH5yPNSOXwnqdmTvYU61LjQ+6V7cBIwarQ6y6NIUotn8NzrDy5dk+08JjAJAFLOVEDS7zsj8Yc7I/9S1DDSohdhIYvCI0JsuZAh213XyNcWKjH8OH76zfPIiwsCyZOqN8OnocZSeMQ6Abam8bB0qhDFyrTrV7SkZ2WHHMFltRdpkFliEGfbWiz5vuXJ45ESRXOOoIvgW5o3rves/Z0EtxY9QgMWV45kMpoL+YSb3mBWfTXLe6u06oIQIsPOcZTRAySKNqDaeHkkIHzM3DDKBIU3jfcUuaqv3hHlZHOrPJk49suniZxgOM2KnN6I=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(346002)(376002)(39860400002)(451199021)(46966006)(36840700001)(40470700004)(83380400001)(82310400005)(40480700001)(336012)(2906002)(82740400003)(47076005)(478600001)(356005)(54906003)(41300700001)(5660300002)(33656002)(316002)(8936002)(8676002)(70586007)(70206006)(6862004)(34020700004)(4326008)(86362001)(6486002)(36860700001)(36756003)(40460700003)(186003)(6506007)(6512007)(81166007)(26005)(53546011)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2023 14:37:20.6027
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d912cfea-df70-4efd-53b2-08db4663be03
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6098

DQoNCj4gT24gMjYgQXByIDIwMjMsIGF0IDE1OjA4LCBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29v
cGVyM0BjaXRyaXguY29tPiB3cm90ZToNCj4gDQo+IE9uIDI2LzA0LzIwMjMgMTE6NDYgYW0sIEx1
Y2EgRmFuY2VsbHUgd3JvdGU6DQo+PiBDdXJyZW50bHkgdGhlIHNjcmlwdCByZXR1cm4gY29kZSBp
cyAwIGV2ZW4gaWYgYW4gZXhjZXB0aW9uIGlzDQo+PiBmb3VuZCwgYmVjYXVzZSB0aGUgcmV0dXJu
IGNvZGUgaXMgd3JpdHRlbiBvbmx5IGlmIHRoZSBleGNlcHRpb24NCj4+IG9iamVjdCBoYXMgdGhl
IGVycm9yY29kZSBtZW1iZXIuDQo+PiANCj4+IEZpeCB0aGUgaXNzdWUgcmV0dXJuaW5nIHRoZSBl
cnJvcmNvZGUgbWVtYmVyIGluIGNhc2UgaXQgZXhpc3RzLA0KPj4gb3RoZXJ3aXNlIHVzZSBhIGdl
bmVyaWMgdmFsdWUgZGlmZmVyZW50IGZyb20gMC4NCj4+IA0KPj4gRml4ZXM6IDAyYjI2YzAyYzdj
NCAoInhlbi9zY3JpcHRzOiBhZGQgY3BwY2hlY2sgdG9vbCB0byB0aGUgeGVuLWFuYWx5c2lzLnB5
IHNjcmlwdCIpDQo+PiBTaWduZWQtb2ZmLWJ5OiBMdWNhIEZhbmNlbGx1IDxsdWNhLmZhbmNlbGx1
QGFybS5jb20+DQo+PiAtLS0NCj4+IHhlbi9zY3JpcHRzL3hlbi1hbmFseXNpcy5weSB8IDMgKy0t
DQo+PiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIgZGVsZXRpb25zKC0pDQo+PiAN
Cj4+IGRpZmYgLS1naXQgYS94ZW4vc2NyaXB0cy94ZW4tYW5hbHlzaXMucHkgYi94ZW4vc2NyaXB0
cy94ZW4tYW5hbHlzaXMucHkNCj4+IGluZGV4IDhlNTBjMjdjZDg5OC4uNzE4NWM1YTA2ZDJjIDEw
MDc1NQ0KPj4gLS0tIGEveGVuL3NjcmlwdHMveGVuLWFuYWx5c2lzLnB5DQo+PiArKysgYi94ZW4v
c2NyaXB0cy94ZW4tYW5hbHlzaXMucHkNCj4+IEBAIC0yNiw4ICsyNiw3IEBAIGRlZiBtYWluKGFy
Z3YpOg0KPj4gICAgICAgICAgICAgY3BwY2hlY2tfYW5hbHlzaXMuZ2VuZXJhdGVfY3BwY2hlY2tf
cmVwb3J0KCkNCj4+ICAgICBleGNlcHQgUGhhc2VFeGNlcHRpb25zIGFzIGU6DQo+PiAgICAgICAg
IHByaW50KCJFUlJPUjoge30iLmZvcm1hdChlKSkNCj4+IC0gICAgICAgIGlmIGhhc2F0dHIoZSwg
ImVycm9yY29kZSIpOg0KPj4gLSAgICAgICAgICAgIHJldF9jb2RlID0gZS5lcnJvcmNvZGUNCj4+
ICsgICAgICAgIHJldF9jb2RlID0gZS5lcnJvcmNvZGUgaWYgaGFzYXR0cihlLCAiZXJyb3Jjb2Rl
IikgZWxzZSAxDQo+IA0KPiByZXRfY29kZSA9IGdldGF0dHIoZSwgImVycm9yY29kZSIsIDEpDQo+
IA0KPiBpcyByYXRoZXIgbW9yZSBzdWNjaW5jdCwgYW5kIHB5dGhvbmljLg0KDQpZZXMgaXQgbG9v
a3MgYmV0dGVyLCBJ4oCZbGwgdXBkYXRlIHRoZSBwYXRjaA0KDQo+IA0KPiB+QW5kcmV3DQoNCg0K

