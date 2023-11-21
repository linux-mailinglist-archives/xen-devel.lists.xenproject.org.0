Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40DB97F2341
	for <lists+xen-devel@lfdr.de>; Tue, 21 Nov 2023 02:44:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.637454.993268 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5Fnd-0004Vc-8I; Tue, 21 Nov 2023 01:43:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 637454.993268; Tue, 21 Nov 2023 01:43:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5Fnd-0004Tx-4h; Tue, 21 Nov 2023 01:43:37 +0000
Received: by outflank-mailman (input) for mailman id 637454;
 Tue, 21 Nov 2023 01:43:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JpOm=HC=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1r5Fnc-0004SB-ED
 for xen-devel@lists.xenproject.org; Tue, 21 Nov 2023 01:43:36 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on062c.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 60037e13-880f-11ee-98e0-6d05b1d4d9a1;
 Tue, 21 Nov 2023 02:43:33 +0100 (CET)
Received: from AS4P250CA0015.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:5df::14)
 by DU5PR08MB10657.eurprd08.prod.outlook.com (2603:10a6:10:51f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.28; Tue, 21 Nov
 2023 01:43:27 +0000
Received: from AMS0EPF00000197.eurprd05.prod.outlook.com
 (2603:10a6:20b:5df:cafe::e) by AS4P250CA0015.outlook.office365.com
 (2603:10a6:20b:5df::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.28 via Frontend
 Transport; Tue, 21 Nov 2023 01:43:27 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF00000197.mail.protection.outlook.com (10.167.16.219) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7025.12 via Frontend Transport; Tue, 21 Nov 2023 01:43:27 +0000
Received: ("Tessian outbound 8289ea11ec17:v228");
 Tue, 21 Nov 2023 01:43:27 +0000
Received: from e97995ef3bc1.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 91F68714-5645-40B8-A44C-9E310855F34B.1; 
 Tue, 21 Nov 2023 01:43:20 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e97995ef3bc1.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 21 Nov 2023 01:43:20 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DU5PR08MB10551.eurprd08.prod.outlook.com (2603:10a6:10:525::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.27; Tue, 21 Nov
 2023 01:43:17 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::c64b:7a3:ac99:25db]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::c64b:7a3:ac99:25db%2]) with mapi id 15.20.7002.027; Tue, 21 Nov 2023
 01:43:17 +0000
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
X-Inumbo-ID: 60037e13-880f-11ee-98e0-6d05b1d4d9a1
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=ARi9vDgLDLOQ4OzT+xpJT7ccFl80TcOXvPS1mMQXVYfEDbErNsswX8atXNz/VSQlsuJA1MgLi2ZueOEjBQ3fs9OHveb/ZDYtuUG2+rU/HeKrCtwLovMFyRA5LxzsuoNcuAIw9ubzgrZR9/0TgmR3kovDfuOyvFlIiO+9+23LKDx2DpCe3jHiR62f2IrJUvG2W2zeWdGE0sbSsSC+Tzu0yRCJ7QgtRfaQKkhsGL5dc3SyPqROM+ka0P+tnfCkHChTcFtUY+o6DIp/mtwQQismFhWVUf7oly1iioL6zhhDjtz7BE95IpjTxCkVfhLOKzSAAMFxbWjwlWnuX9boAJUDjQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NFfVtGVTxdrUcJ5qAF402B6mhm0FyihihlsMD+7xjv0=;
 b=M99CuhB4J13EkbT8Q2dCkldd117qtMixc6dz7QIA+yGX+HyhW5EPzT6R4J9yu1n+QMfk/8jJw8Bk+azyiHCkFODGL9kIh44RURBLKhuwJ1b7NMmqf+K9frhMS8nAebR11RACXronqSL64RBGWY6Iv3dZcbb45DeYA7qLIa5DsBuRivVJDk6EodMicyqZoHvh8zKGTJ3+qHVZrI5j+8ZCd1CBXj7VQ90fjGKRBBq411Vd48v4wPJajsiSoxaohaxriKK9tHgaufLjxh0818vVGEZHopKF17RIQqY6XQWwTrt0ATPNtoO5OAiPI3WH94lKzt/BmE2X/st7o8kVFDDQnA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NFfVtGVTxdrUcJ5qAF402B6mhm0FyihihlsMD+7xjv0=;
 b=3NivU5/8fmDPjUbMcZd3UHClut78ySjDc8kPXTcfdlOZP/LxqEzVhYvTE0+mF001L+0aSv2CH2tFMdnWSwOOUGkVKG/Vhq9xNCaSg6UsL+pWxe8TTVfFqwXlQOnZvKo8wRNNna8qIHtyi7JdyApjN5gbIy9bDj7hGGyXVJZvQb4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: eafcf9ad8b44312b
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QREO/5lf/93ePWQONY7NA6LtVP4iVftlQL9CqzpVSYwiX0uZlIUWYsu+APfDQZ3uxn3qKUqtFzURRK7fr2ISYne3OcXeRLznpg7ToA76uuhDEfKWfTTWimtU+SWYR7aJBvyk8KDSJKFqO0p8SKGsgq8AwKDlQ9vun7CEDFWQdiw4OmQCu6TPcmtA6m6eJUOK8RlRqQ3OTfrtolYJPdVOVlho2z7v63JXSWgrvjN7C1wPO/Bk0BOsicJURMFGuPiBvvIpKPQd6cy8E+sEa16DbOgKI42oPU2gsk/66qt6Vwdmml2lbdwDykjZFWkCBZCiQzZWNvz6diVE5hQjrsFGTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NFfVtGVTxdrUcJ5qAF402B6mhm0FyihihlsMD+7xjv0=;
 b=XdjCCDfWAzL+RAghANoaGm+XDjIv2AAu3YjBITjRSNpxYSGgwTCoF6oHW2LxPszQ26O9sfRchxM4+J23pM+WpfPcsuhpc94dZ+piNHG2+dNN1R511z9+ZetrTggn3xe9MaPx1o35JXJALuu+XmaxfvF8ZQppfemhVe+KUO0RCA+QWKEEQa3sIyiOvX69DccwJrhe38IKzdYX7QJ25TWX3f00vEpY30LNlsweYyYrfOIMySL2aM5AuwSRKfVjSD7uuCAe6S8pXQIQG5NCMeBPPHwMy79bp5JBKLZIFCjLXCb4redI1H1z5t4MvrrT869njMkcZjCrDAX6neCdgoiFNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NFfVtGVTxdrUcJ5qAF402B6mhm0FyihihlsMD+7xjv0=;
 b=3NivU5/8fmDPjUbMcZd3UHClut78ySjDc8kPXTcfdlOZP/LxqEzVhYvTE0+mF001L+0aSv2CH2tFMdnWSwOOUGkVKG/Vhq9xNCaSg6UsL+pWxe8TTVfFqwXlQOnZvKo8wRNNna8qIHtyi7JdyApjN5gbIy9bDj7hGGyXVJZvQb4=
From: Henry Wang <Henry.Wang@arm.com>
To: Kelly Choi <kelly.choi@cloud.com>, Julien Grall <julien@xen.org>
CC: George Dunlap <george.dunlap@cloud.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "xen-users@lists.xenproject.org"
	<xen-users@lists.xenproject.org>, "xen-announce@lists.xenproject.org"
	<xen-announce@lists.xenproject.org>, "advisory-board@lists.xenproject.org"
	<advisory-board@lists.xenproject.org>
Subject: Re: Xen Project Releases Version 4.18
Thread-Topic: Xen Project Releases Version 4.18
Thread-Index: AQHaG722i8HK+lVrOk+jDsSodIvIfrCEAKiA
Date: Tue, 21 Nov 2023 01:43:17 +0000
Message-ID: <56F8B2A2-87DF-4AE5-986C-16E9A8D0D68F@arm.com>
References:
 <CAO-mL=x0wpaERs7jTK2GmfEhq-EJ4X4wyHERVyoQpfQXQYjUcA@mail.gmail.com>
In-Reply-To:
 <CAO-mL=x0wpaERs7jTK2GmfEhq-EJ4X4wyHERVyoQpfQXQYjUcA@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DU5PR08MB10551:EE_|AMS0EPF00000197:EE_|DU5PR08MB10657:EE_
X-MS-Office365-Filtering-Correlation-Id: e6f9a948-805b-48da-826b-08dbea3341f3
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 ArDDsGroe1+TuyFZxCngz54+kUgyvzDJJNmhQ3QdCNaz0wzrYHniRwKk+nPFKKGBmS40Pci3JerNyqoCm822FI/tMmqKHheMeTtZkTAxvQddoiIuv6IRf37Z6ymATRKsHA6+LLgcWN0dV7DIx+gfSM5fnkJSHBfL49+7DpbBrI7VMVPv7EOZKUGaRl01tGUxtixRxB8ty1S+HQ015q2HAQEa2u2dNu8uIJGnB9LeEDF1CU0h84PEBAx/sNThL9DMh5zhPhkrjsHTBlE9/thD4Rr9l/438oM5wpw5s7p9qTHARGNngs54yaiFHD+E98GYL74ez7hnZbNK4tlzwpCDCrJ7aDsQQA2fyQCQ0muht5T16TgeYYNoI3llvQFKW8eTpo/AUbas1YzHJ3Kf6REoA4FQ1CaaSLdwI1GUoUdt5zGK4AWgFm0UMW80zrj/+3DRKKfayx6h2aejeo5+1B2ZKx/20w+lZO0DuriYvrmExJ56RWBiE4GyLnR9NJHeqolSvIM1axsI/GqMgxGf6UqBuaIyiFMaPFmrcBrZ37cOjDrX29OChbBA1aFT+yHMOY8yx5cMFRT1qA3D9CXddFX3r7ygr3tNR47Fk60L8cqQicbe/nu1rgH30YfAyNDlxs+beA6CbaWeYPmg+jpKXCaH1/pefZFPQsVEGY3eXDgL8wk=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(136003)(346002)(366004)(39860400002)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(5660300002)(86362001)(2906002)(316002)(54906003)(76116006)(64756008)(66946007)(66556008)(66476007)(66446008)(91956017)(110136005)(8676002)(4326008)(8936002)(36756003)(38070700009)(33656002)(41300700001)(71200400001)(26005)(2616005)(83380400001)(53546011)(6506007)(122000001)(6512007)(6486002)(38100700002)(478600001)(966005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <83AFD487842EDB4B85ED313383773E0A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR08MB10551
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF00000197.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	06bb3a8a-710f-4bd6-d330-08dbea333c0e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qvz6RBVhmG5KjTrCmZ3KbyUPRSJM57pROIEPY1WiQeIznd1I/mHbT4JevmzZrnbFmsZE3S4iluPr7XgtndjQbsoncNMvWXZm8UfWp9fXDKgzJBJzxHzPo6hnHLqSrA2IyZiHIrXwubEneQ9wMCURv2ukAlI/G5eEZQ7MCaOdoTSsxtytyCZ4sqUpHu4MtxXzyvPRLDYFyWMaXaEa0rmJKku9Ofn9DCvNlx+6URA8DsrwOWCQ2CK1NpXEzR0P3mD+gj1/uL8AbgHWnujBMgIEh0sg79gjYYqouARB47HAF9J5CdTp+2BTuTg/iNt9ey/sW38adA+ydi+uLnqmw4QgTVlDKcze/ypObQ5/sFZWnzPNs04PkJKWIAsmBOsfeSSl0StNOxZqrAsjZEhETPBGy62oUduGAapiWMJrBioq+luc9PQGJR5xP1HB4rP9sicABTVx3dzjQMggN7ZHUh5ssEbj0IZdSaLTq4OgjIpCG1gj1txpsrT5tBhiQTAp4j6rgU3lkSyX/S7V6fqiVkrMoUhZcNrTfEwGNNBDUsTK+FnQRrFKNrygaDN2vRaooYU+qifRGZa0sGWdwvzOXr52HZqJ/ltiBNqfUmkMYLt9NB7QPwXn6Tpf9kMp4HsJDW106Zjt1FAssQSftaES37BTy4cp6a5fScIqxzhoNJ3mTOoN8jWdJ7zl9+LxS6rLZVc/jxENN7rMVFJPvOUQOJopl3GxV5SafV3en/VUzBz8Wz0P5z/1Tu7QZ6VPspd7NEVD0wng6ktBMnWeNoX45y8f7g==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(39860400002)(376002)(346002)(396003)(230922051799003)(1800799012)(82310400011)(186009)(451199024)(64100799003)(36840700001)(46966006)(40470700004)(5660300002)(2906002)(8936002)(4326008)(8676002)(316002)(41300700001)(450100002)(54906003)(70586007)(70206006)(110136005)(40480700001)(966005)(6486002)(6506007)(478600001)(53546011)(26005)(2616005)(6512007)(83380400001)(336012)(40460700003)(36860700001)(81166007)(356005)(47076005)(82740400003)(33656002)(36756003)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2023 01:43:27.2829
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e6f9a948-805b-48da-826b-08dbea3341f3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF00000197.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR08MB10657

SGksDQoNCj4gT24gTm92IDIwLCAyMDIzLCBhdCAyMjoyNiwgS2VsbHkgQ2hvaSA8a2VsbHkuY2hv
aUBjbG91ZC5jb20+IHdyb3RlOg0KPiANCj4gSGkgZXZlcnlvbmUsDQo+IA0KPiBJdCdzIHdpdGgg
Z3JlYXQgcGxlYXN1cmUgdGhhdCBJIGFubm91bmNlIG91ciA0LjE4IFBSIHJlbGVhc2UhIA0KPiAN
Cj4gUGxlYXNlIGZpbmQgdGhlIFBSIGFydGljbGUgYXR0YWNoZWQgaGVyZSwgYW5kIGluZm9ybWF0
aW9uIG9uIG91ciBibG9nIGhlcmUuDQoNCkFkZGluZyBhIGJpdCBtb3JlIGluZm9ybWF0aW9uIGhl
cmUsDQoNClBsZWFzZSBmaW5kIHRoZSB0YXJiYWxsIGFuZCBpdHMgc2lnbmF0dXJlIGF0Og0KDQpo
dHRwczovL3hlbnByb2plY3Qub3JnL2Rvd25sb2Fkcy94ZW4tcHJvamVjdC1hcmNoaXZlcy94ZW4t
cHJvamVjdC00LTE4LXNlcmllcy94ZW4tcHJvamVjdC00LTE4LTAvDQoNCllvdSBjYW4gYWxzbyBj
aGVjayBvdXQgdGhlIHRhZyBpbiB4ZW4uZ2l0Og0KDQpnaXQ6Ly94ZW5iaXRzLnhlbi5vcmcveGVu
LmdpdCBSRUxFQVNFLTQuMTguMA0KDQpHaXQgY2hlY2tvdXQgYW5kIGJ1aWxkIGluc3RydWN0aW9u
cyBjYW4gYmUgZm91bmQgYXQ6DQoNCmh0dHBzOi8vd2lraS54ZW5wcm9qZWN0Lm9yZy93aWtpL1hl
bl9Qcm9qZWN0XzQuMThfUmVsZWFzZV9Ob3RlcyNCdWlsZF9SZXF1aXJlbWVudHMNCg0KUmVsZWFz
ZSBub3RlcyBjYW4gYmUgZm91bmQgYXQ6DQoNCmh0dHBzOi8vd2lraS54ZW5wcm9qZWN0Lm9yZy93
aWtpL1hlbl9Qcm9qZWN0XzQuMThfUmVsZWFzZV9Ob3Rlcw0KDQpBIHN1bW1hcnkgZm9yIDQuMTgg
cmVsZWFzZSBkb2N1bWVudHMgY2FuIGJlIGZvdW5kIGF0Og0KDQpodHRwczovL3dpa2kueGVucHJv
amVjdC5vcmcvd2lraS9DYXRlZ29yeTpYZW5fNC4xOA0KDQo+IEkgd2FudCB0byB0aGFuayB0aGUg
d2hvbGUgY29tbXVuaXR5IGZvciB0aGVpciBlZmZvcnRzIGluIGdldHRpbmcgdGhpcyByZWxlYXNl
IHB1Ymxpc2hlZC4NCj4gDQo+IEluIHBhcnRpY3VsYXIsIEknZCBsaWtlIHRvIGV4cHJlc3MgZ3Jh
dGl0dWRlIHRvIEBIZW5yeSBXYW5nIGZvciBoaXMgaGVscCBhcyB0aGUgcmVsZWFzZSBtYW5hZ2Vy
LCBAR2VvcmdlIER1bmxhcCBmb3IgY29sbGF0aW5nIHRoZSBkb3dubG9hZHMsIGFuZCB0aGUgQWR2
aXNvcnkgQm9hcmQgZm9yIHRoZWlyIGNvbnRpbnVlZCBzdXBwb3J0IGFuZCBxdW90ZXMgaW4gdGhl
IGFydGljbGUuIA0KDQpBcyB3ZSBhcmUgbGlzdGluZyB0aGUgbmFtZXMsIEkgd291bGQgbGlrZSB0
byBzcGVjaWZpY2FsbHkgdGhhbmsgSnVsaWVuIGZvciB0aGUgZ3JlYXQgd29yayBhcyB0aGUNCnJl
bGVhc2UgdGVjaG5pY2lhbi4gVGhlIHJlbGVhc2Ugd291bGRuJ3QgaGF2ZSBiZWVuIHBvc3NpYmxl
IHdpdGhvdXQgSnVsaWVu4oCZcyBlZmZvcnQgYW5kIHN1cHBvcnQgOikNCg0KS2luZCByZWdhcmRz
LA0KSGVucnkNCg0K

