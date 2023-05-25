Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC6DD710965
	for <lists+xen-devel@lfdr.de>; Thu, 25 May 2023 12:01:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539501.840440 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q27mq-0003rN-CD; Thu, 25 May 2023 10:01:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539501.840440; Thu, 25 May 2023 10:01:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q27mq-0003oA-8u; Thu, 25 May 2023 10:01:36 +0000
Received: by outflank-mailman (input) for mailman id 539501;
 Thu, 25 May 2023 10:01:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zmzE=BO=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1q27mp-0003o4-9d
 for xen-devel@lists.xenproject.org; Thu, 25 May 2023 10:01:35 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2060a.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::60a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2026e70d-fae3-11ed-8611-37d641c3527e;
 Thu, 25 May 2023 12:01:32 +0200 (CEST)
Received: from AM5PR0602CA0002.eurprd06.prod.outlook.com
 (2603:10a6:203:a3::12) by AS1PR08MB7402.eurprd08.prod.outlook.com
 (2603:10a6:20b:4c6::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15; Thu, 25 May
 2023 10:01:28 +0000
Received: from AM7EUR03FT019.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:a3:cafe::67) by AM5PR0602CA0002.outlook.office365.com
 (2603:10a6:203:a3::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15 via Frontend
 Transport; Thu, 25 May 2023 10:01:28 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT019.mail.protection.outlook.com (100.127.140.245) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6433.17 via Frontend Transport; Thu, 25 May 2023 10:01:27 +0000
Received: ("Tessian outbound 3570909035da:v136");
 Thu, 25 May 2023 10:01:27 +0000
Received: from cb247d40592a.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3D06F41F-86C9-4C6E-B2C7-3448B5380DA3.1; 
 Thu, 25 May 2023 10:01:21 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id cb247d40592a.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 25 May 2023 10:01:21 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by DU0PR08MB9533.eurprd08.prod.outlook.com (2603:10a6:10:44f::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.16; Thu, 25 May
 2023 10:01:16 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::362c:56c7:5ea4:422e]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::362c:56c7:5ea4:422e%7]) with mapi id 15.20.6433.015; Thu, 25 May 2023
 10:01:16 +0000
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
X-Inumbo-ID: 2026e70d-fae3-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h3nwhvaNq+a9tWvRHr72FWk4rDmSs/1wG+E0R3lDKQE=;
 b=84QUq1q5O+pGCmmYW/hiqueFa5uhADNOkC+dfXgWvDezIgc5BibeK5/z8x0f9Ho+ABjPZwQnfbHO/evG9fydi8C49hN5NzQRgKyRaXbqPQdNkXZ4WHuhOQxiceUVeF9edUT/Bx1e+RV6P3vErF0QlAAnkPiBL5X90pzuBmR/yOk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2cdbdb56bc15511c
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fBdlJMZ/i55y+5oos6o69Q8dETLHkGAlc2BO/3sDMgUhGopsUZDlg2hLYGOmQ1ClzIvhN+FaVEUmjrpUy83o1Jh4iO+vPMmfevtaeoo7+xxEkOZQ9XkYmOurHvFQTwDdlnuXdC+eKBHmljt51xmBGd22KmcwimGjANlq/4E5u93DYRRv0UwioZHhJBTmIVzhoCVb7CZeJ4kht6eu7cyN2BQUD/FLlzhXyp7Q8Bp3P5nl93A97jSYwx/up918q0fNJZDJoxU3Pv5fcvEc95fzycSn3XTP4YzHlcjnpDhGp4pOPkWXW1yw4YCOePTnHA55Rhzk5Lg8LrXuHB2UBzjWHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h3nwhvaNq+a9tWvRHr72FWk4rDmSs/1wG+E0R3lDKQE=;
 b=YFgyfrY2g22PnOZYAmCr0nLwh08h+Bxd2LzgJZLuXGYCh6YxDq020sFeatULPD1M+lbbvIMuR0xlU/1ZkAqmWenkkNKFLD4fPHfvOGIHAVvyAUWnBTcLxk+jdLbgDfJVkDlac4oY8nERFwGknIEAj2eD2RX80rt/S7rYoWrVE2dxaD4BJYqLxJm98KXYKY04lLYbnT0ui72JjvEpBrdQU9y/gnLON5HVJtYt5HE8KkRIXnR3DX2rQq8YbjuT7GRZWkS7sGcVZnVGqhWqXDM0bqKV/b5mfoJinEnjNG5TVH4mcilQNy+17KQ8BFuD0frZTQ7J1zt1BG7h5859LZZ9gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h3nwhvaNq+a9tWvRHr72FWk4rDmSs/1wG+E0R3lDKQE=;
 b=84QUq1q5O+pGCmmYW/hiqueFa5uhADNOkC+dfXgWvDezIgc5BibeK5/z8x0f9Ho+ABjPZwQnfbHO/evG9fydi8C49hN5NzQRgKyRaXbqPQdNkXZ4WHuhOQxiceUVeF9edUT/Bx1e+RV6P3vErF0QlAAnkPiBL5X90pzuBmR/yOk=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v7 05/12] arm/sve: save/restore SVE context switch
Thread-Topic: [PATCH v7 05/12] arm/sve: save/restore SVE context switch
Thread-Index: AQHZjUpcuuLAh7YurESbASUYh0J8dK9qtqGAgAAObYA=
Date: Thu, 25 May 2023 10:01:16 +0000
Message-ID: <8DF528FE-8F09-469C-B8C4-28B34B20A273@arm.com>
References: <20230523074326.3035745-1-luca.fancellu@arm.com>
 <20230523074326.3035745-6-luca.fancellu@arm.com>
 <5b09d5d9-360f-d0ef-06c4-6efe1b660a90@xen.org>
In-Reply-To: <5b09d5d9-360f-d0ef-06c4-6efe1b660a90@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|DU0PR08MB9533:EE_|AM7EUR03FT019:EE_|AS1PR08MB7402:EE_
X-MS-Office365-Filtering-Correlation-Id: b7ecb8ea-0873-4729-2155-08db5d0701be
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 d6Hrc0lIyTztkZoz3DYYq/D07IPe/P8BCi8zMRDmoiCjMKI3b5j0KrvYRL4734yD6bSitYiFWfMbYsHjOy+UOyi8YNv6Q2cGZ4JX08pw5iTHNWFNL4+mg08snHwmgB1vmfNogYzqpJ2PHgByPWmxzK71TyTJLItqIBXO1zX5ZfxiRFXn1qbmrTxLvMdNvIKTvh1mgxL5DygrHRQQwohFzcJtav6zy7LtCFSJ5EHhyAHZqYX4zEnyw4v4cuH71IAu61RfPYnFEMZtKsiv9kyEXEIlAMTqD3bPtV+2hgJ7TmaZ9NLZxZcwUFSbiQFPXydfRbxVXdo+XH03bqeum6LDgU41qywZcjR3jui+pQawBpOkstdCs+k4xYhImqRu5/ReHHcNfVqG8iWYYLpPqOwlZpxX0OzgXKgLqsYP5eCgqFsf418X4J4NXC/FWA3F0QcH1DeaeeJrgbrznzpUbIOvvfOCkiwvxQ5/obwWBuXUzalRttgt5yCtsANH0WKbHQNltkGydeDlZFMZIhiTZxkJRsSNT7Q8+hqX3hC5jvYgFMh6QXIRudBETYaMd5ZZrzylGAdbAAZQf5hjxCf5GRjMO+OjN0I5UhzS/nzXLEZ9K3H/o8Hz99IOb7NseYVJ4LowkNmwHeoJhnR1uP44BFGK9w==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(396003)(376002)(39860400002)(136003)(346002)(451199021)(38070700005)(33656002)(86362001)(36756003)(6486002)(6916009)(54906003)(4326008)(316002)(91956017)(66556008)(66446008)(64756008)(76116006)(66946007)(66476007)(478600001)(71200400001)(8676002)(8936002)(2906002)(38100700002)(122000001)(41300700001)(2616005)(6506007)(26005)(53546011)(6512007)(186003)(83380400001)(5660300002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <A3D43044F7918A4787B7B8264447E173@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9533
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8e255eb1-49c6-404a-33c3-08db5d06fae4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6WDt5kJtebhr4PiKkG0sVIXE/+EkUGq8yo/FHUFl3sM4ZYxcR5AENugshXWZCcl6sBCZML+o+7A5NXOiFPrbYhIeJuEHmJSojCnt54CsJW71eUBuxz9vCLoj+w9wazKrd58i4ovDovzOJfrBBAnVYyV26YA827oSi1Yoj+npCH0FrfEf+ZuFRPsMxr13brihes0uuGpU1Ik4a5gBBZ7kMgWq0xqxb+Pas1CcpVxI87Ttoq4eQc7DSjO7V2HGSfQuCUuMW87/yTIhkdNgyDfKvP9xp0wI9iFt2T4eHppCA4Smnzme7f+8IFbWWLOF5LOBlCs8rqfUlZCS2B2TYbDz2JN1DX0k25zqd/vKNbm/QkdfZtLRr+pEgCY0uUF2LtBmPJo5jGp8RWF0jit4nqW3YJUbDUR2XzuJwyGHakGwrTxnzItJgmk7KYrDnm/wkzf2T4qLfIS0RVycbfXYatjeVYZV0hspYUQ8xYhr8Et/vepJ9A+I9XPHglFuyU5SbD6fEyCQzmQsYIqc85ZbdYN15Gks7zEYmm8jQ8ooSgLdCj+cwYQaudxxGZPF8ZU47RUpOSOOD1johmeDa8P/dtcQdu2x2yj9HUUJ1/KfFIaGo55F2uQ7MsEWTSVzasi1fJCnlyE7bbrwmwtDMD5FRE6wihGoeujTuw8Otws+L3H46z9i6mAc2xznY+9dxNrWCTGXy0uA1wK/KxyjOGH/3aBrF88BArIieYDEFCvwXIv68bVVl8WcAB48fySzR9IMvMGg
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(346002)(396003)(136003)(451199021)(40470700004)(36840700001)(46966006)(4326008)(6506007)(6512007)(26005)(70206006)(316002)(70586007)(107886003)(54906003)(6486002)(41300700001)(478600001)(40480700001)(40460700003)(5660300002)(8936002)(8676002)(6862004)(2616005)(86362001)(2906002)(36756003)(336012)(356005)(81166007)(82740400003)(82310400005)(186003)(36860700001)(47076005)(33656002)(83380400001)(53546011);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 10:01:27.7667
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b7ecb8ea-0873-4729-2155-08db5d0701be
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR08MB7402

DQoNCj4gT24gMjUgTWF5IDIwMjMsIGF0IDEwOjA5LCBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4u
b3JnPiB3cm90ZToNCj4gDQo+IEhpIEx1Y2EsDQo+IA0KPiBPbiAyMy8wNS8yMDIzIDA4OjQzLCBM
dWNhIEZhbmNlbGx1IHdyb3RlOg0KPj4gK2ludCBzdmVfY29udGV4dF9pbml0KHN0cnVjdCB2Y3B1
ICp2KQ0KPj4gK3sNCj4+ICsgICAgdW5zaWduZWQgaW50IHN2ZV92bF9iaXRzID0gc3ZlX2RlY29k
ZV92bCh2LT5kb21haW4tPmFyY2guc3ZlX3ZsKTsNCj4+ICsgICAgdWludDY0X3QgKmN0eCA9IF94
emFsbG9jKHN2ZV96cmVnX2N0eF9zaXplKHN2ZV92bF9iaXRzKSArDQo+PiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBzdmVfZmZycmVnX2N0eF9zaXplKHN2ZV92bF9iaXRzKSwNCj4+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIEwxX0NBQ0hFX0JZVEVTKTsNCj4+ICsNCj4+ICsg
ICAgaWYgKCAhY3R4ICkNCj4+ICsgICAgICAgIHJldHVybiAtRU5PTUVNOw0KPj4gKw0KPj4gKyAg
ICAvKg0KPj4gKyAgICAgKiBQb2ludCB0byB0aGUgZW5kIG9mIFowLVozMSBtZW1vcnksIGp1c3Qg
YmVmb3JlIEZGUiBtZW1vcnksIHRvIGJlIGtlcHQgaW4NCj4+ICsgICAgICogc3luYyB3aXRoIHN2
ZV9jb250ZXh0X2ZyZWUoKQ0KPiANCj4gTml0OiBNaXNzaW5nIGEgZnVsbCBzdG9wLg0KDQpJ4oCZ
bGwgZml4DQoNCj4gDQo+PiArICAgICAqLw0KPj4gKyAgICB2LT5hcmNoLnZmcC5zdmVfenJlZ19j
dHhfZW5kID0gY3R4ICsNCj4+ICsgICAgICAgIChzdmVfenJlZ19jdHhfc2l6ZShzdmVfdmxfYml0
cykgLyBzaXplb2YodWludDY0X3QpKTsNCj4+ICsNCj4+ICsgICAgdi0+YXJjaC56Y3JfZWwyID0g
dmxfdG9femNyKHN2ZV92bF9iaXRzKTsNCj4+ICsNCj4+ICsgICAgcmV0dXJuIDA7DQo+PiArfQ0K
Pj4gKw0KPj4gK3ZvaWQgc3ZlX2NvbnRleHRfZnJlZShzdHJ1Y3QgdmNwdSAqdikNCj4+ICt7DQo+
PiArICAgIHVuc2lnbmVkIGludCBzdmVfdmxfYml0czsNCj4+ICsNCj4+ICsgICAgaWYgKCB2LT5h
cmNoLnZmcC5zdmVfenJlZ19jdHhfZW5kICkNCj4+ICsgICAgICAgIHJldHVybjsNCj4+ICsNCj4+
ICsgICAgc3ZlX3ZsX2JpdHMgPSBzdmVfZGVjb2RlX3ZsKHYtPmRvbWFpbi0+YXJjaC5zdmVfdmwp
Ow0KPj4gKw0KPj4gKyAgICAvKg0KPj4gKyAgICAqIFBvaW50IHRvIHRoZSBlbmQgb2YgWjAtWjMx
IG1lbW9yeSwganVzdCBiZWZvcmUgRkZSIG1lbW9yeSwgdG8gYmUga2VwdA0KPj4gKyAgICAqIGlu
IHN5bmMgd2l0aCBzdmVfY29udGV4dF9pbml0KCkNCj4+ICsgICAgKi8NCj4gDQo+IFRoZSBzcGFj
aW5nIGxvb2tzIGEgYml0IG9kZCBpbiB0aGlzIGNvbW1lbnQuIERpZCB5b3UgbWlzcyBhbiBleHRy
YSBzcGFjZT8NCj4gDQo+IEFsc28sIEkgbm90aWNlIHRoaXMgY29tbWVudCBpcyB0aGUgZXhhY3Qg
c2FtZSBhcyBvbiB0b3AgYXMgc3ZlX2NvbnRleHRfaW5pdCgpLiBJIHRoaW5rIHRoaXMgaXMgYSBi
aXQgbWlzbGVhZGluZyBiZWNhdXNlIHRoZSBsb2dpYyBpcyBkaWZmZXJlbnQuIEkgd291bGQgc3Vn
Z2VzdCB0aGUgZm9sbG93aW5nOg0KPiANCj4gIkN1cnJlbnRseSBwb2ludHMgdG8gdGhlIGVuZCBv
ZiBaMC1aMzEgbWVtb3J5IHdoaWNoIGlzIG5vdCB0aGUgc3RhcnQgb2YgdGhlIGJ1ZmZlci4gVG8g
YmUga2VwdCBpbiBzeW5jIHdpdGggdGhlIHN2ZV9jb250ZXh0X2luaXQoKS4iDQo+IA0KPiBMYXN0
bHksIG5pdDogTWlzc2luZyBhIGZ1bGwgc3RvcC4NCg0KT2sgSeKAmWxsIGNoYW5nZSBpdA0KDQo+
IA0KPj4gKyAgICB2LT5hcmNoLnZmcC5zdmVfenJlZ19jdHhfZW5kIC09DQo+PiArICAgICAgICAo
c3ZlX3pyZWdfY3R4X3NpemUoc3ZlX3ZsX2JpdHMpIC8gc2l6ZW9mKHVpbnQ2NF90KSk7DQo+PiAr
DQo+PiArICAgIFhGUkVFKHYtPmFyY2gudmZwLnN2ZV96cmVnX2N0eF9lbmQpOw0KPj4gK30NCj4+
ICsNCj4gDQo+IFsuLi5dDQo+IA0KPj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9pbmNsdWRl
L2FzbS9hcm02NC92ZnAuaCBiL3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9hcm02NC92ZnAuaA0K
Pj4gaW5kZXggZTZlOGMzNjNiYzE2Li40YWEzNzFlODVkMjYgMTAwNjQ0DQo+PiAtLS0gYS94ZW4v
YXJjaC9hcm0vaW5jbHVkZS9hc20vYXJtNjQvdmZwLmgNCj4+ICsrKyBiL3hlbi9hcmNoL2FybS9p
bmNsdWRlL2FzbS9hcm02NC92ZnAuaA0KPj4gQEAgLTYsNyArNiwxOSBAQA0KPj4gICAgc3RydWN0
IHZmcF9zdGF0ZQ0KPj4gIHsNCj4+ICsgICAgLyoNCj4+ICsgICAgICogV2hlbiBTVkUgaXMgZW5h
YmxlZCBmb3IgdGhlIGd1ZXN0LCBmcHJlZ3MgbWVtb3J5IHdpbGwgYmUgdXNlZCB0bw0KPj4gKyAg
ICAgKiBzYXZlL3Jlc3RvcmUgUDAtUDE1IHJlZ2lzdGVycywgb3RoZXJ3aXNlIGl0IHdpbGwgYmUg
dXNlZCBmb3IgdGhlIFYwLVYzMQ0KPj4gKyAgICAgKiByZWdpc3RlcnMuDQo+PiArICAgICAqLw0K
Pj4gICAgICB1aW50NjRfdCBmcHJlZ3NbNjRdIF9fdmZwX2FsaWduZWQ7DQo+PiArICAgIC8qDQo+
PiArICAgICAqIFdoZW4gU1ZFIGlzIGVuYWJsZWQgZm9yIHRoZSBndWVzdCwgc3ZlX3pyZWdfY3R4
X2VuZCBwb2ludHMgdG8gbWVtb3J5DQo+PiArICAgICAqIHdoZXJlIFowLVozMSByZWdpc3RlcnMg
YW5kIEZGUiBjYW4gYmUgc2F2ZWQvcmVzdG9yZWQsIGl0IHBvaW50cyBhdCB0aGUNCj4+ICsgICAg
ICogZW5kIG9mIHRoZSBaMC1aMzEgc3BhY2UgYW5kIGF0IHRoZSBiZWdpbm5pbmcgb2YgdGhlIEZG
UiBzcGFjZSwgaXQncyBkb25lDQo+PiArICAgICAqIGxpa2UgdGhhdCB0byBlYXNlIHRoZSBzYXZl
L3Jlc3RvcmUgYXNzZW1ibHkgb3BlcmF0aW9ucy4NCj4+ICsgICAgICovDQo+PiArICAgIHVpbnQ2
NF90ICpzdmVfenJlZ19jdHhfZW5kOw0KPiANCj4gU29ycnkgSSBvbmx5IG5vdGljZWQgbm93LiBC
dXQgc2hvdWxkbid0IHRoaXMgYmUgcHJvdGVjdGVkIHdpdGggI2lmZGVmIENPTkZJR19TVkU/IFNh
bWUuLi4NCj4gDQo+PiAgICAgIHJlZ2lzdGVyX3QgZnBjcjsNCj4+ICAgICAgcmVnaXN0ZXJfdCBm
cGV4YzMyX2VsMjsNCj4+ICAgICAgcmVnaXN0ZXJfdCBmcHNyOw0KPj4gZGlmZiAtLWdpdCBhL3hl
bi9hcmNoL2FybS9pbmNsdWRlL2FzbS9kb21haW4uaCBiL3hlbi9hcmNoL2FybS9pbmNsdWRlL2Fz
bS9kb21haW4uaA0KPj4gaW5kZXggMzMxZGEwZjNiY2MzLi44MTQ2NTJkOTI1NjggMTAwNjQ0DQo+
PiAtLS0gYS94ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vZG9tYWluLmgNCj4+ICsrKyBiL3hlbi9h
cmNoL2FybS9pbmNsdWRlL2FzbS9kb21haW4uaA0KPj4gQEAgLTE5NSw2ICsxOTUsOCBAQCBzdHJ1
Y3QgYXJjaF92Y3B1DQo+PiAgICAgIHJlZ2lzdGVyX3QgdHBpZHJyb19lbDA7DQo+PiAgICAgICAg
LyogSFlQIGNvbmZpZ3VyYXRpb24gKi8NCj4+ICsgICAgcmVnaXN0ZXJfdCB6Y3JfZWwxOw0KPj4g
KyAgICByZWdpc3Rlcl90IHpjcl9lbDI7DQo+IA0KPiAuLi4gaGVyZS4NCg0KU3VyZSBJIGNhbiBw
cm90ZWN0IHRoZW0uIEl0IHdhcyBkb25lIG9uIHB1cnBvc2UgYmVmb3JlIHRvIGF2b2lkIGlmZGVm
cyBidXQgSSB0aGluayBzYXZpbmcgc3BhY2UNCmlzIGJldHRlciBoZXJlIGFuZCBhbHNvIHRoZXJl
IHdvbuKAmXQgYmUgYW55IHVzZSBvZiB0aGVtIHdoZW4gdGhlIGNvbmZpZyBpcyBvZmYuDQoNCg0K
PiANCj4+ICAgICAgcmVnaXN0ZXJfdCBjcHRyX2VsMjsNCj4+ICAgICAgcmVnaXN0ZXJfdCBoY3Jf
ZWwyOw0KPj4gICAgICByZWdpc3Rlcl90IG1kY3JfZWwyOw0KPiANCj4gQ2hlZXJzLA0KPiANCj4g
LS0gDQo+IEp1bGllbiBHcmFsbA0KDQo=

