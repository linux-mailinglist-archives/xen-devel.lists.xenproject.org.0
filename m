Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19088753D7D
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jul 2023 16:32:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.563670.881038 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qKJqM-0006Pj-Op; Fri, 14 Jul 2023 14:32:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 563670.881038; Fri, 14 Jul 2023 14:32:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qKJqM-0006Mq-MA; Fri, 14 Jul 2023 14:32:26 +0000
Received: by outflank-mailman (input) for mailman id 563670;
 Fri, 14 Jul 2023 14:32:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3usO=DA=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1qKJqK-0006Mk-AI
 for xen-devel@lists.xenproject.org; Fri, 14 Jul 2023 14:32:24 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on061f.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::61f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3e0430e7-2253-11ee-b239-6b7b168915f2;
 Fri, 14 Jul 2023 16:32:22 +0200 (CEST)
Received: from DUZPR01CA0309.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4ba::9) by DB5PR08MB10115.eurprd08.prod.outlook.com
 (2603:10a6:10:4a2::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.27; Fri, 14 Jul
 2023 14:32:16 +0000
Received: from DBAEUR03FT047.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:4ba:cafe::88) by DUZPR01CA0309.outlook.office365.com
 (2603:10a6:10:4ba::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.27 via Frontend
 Transport; Fri, 14 Jul 2023 14:32:16 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT047.mail.protection.outlook.com (100.127.143.25) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6588.27 via Frontend Transport; Fri, 14 Jul 2023 14:32:16 +0000
Received: ("Tessian outbound f9124736ff4f:v145");
 Fri, 14 Jul 2023 14:32:16 +0000
Received: from 47b0ccf6ae24.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 CCBAA5E4-ED5F-4ABD-84C3-29D1B329248F.1; 
 Fri, 14 Jul 2023 14:32:05 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 47b0ccf6ae24.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 14 Jul 2023 14:32:05 +0000
Received: from AM0PR08MB3745.eurprd08.prod.outlook.com (2603:10a6:208:ff::27)
 by PAWPR08MB10091.eurprd08.prod.outlook.com (2603:10a6:102:366::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.36; Fri, 14 Jul
 2023 14:32:03 +0000
Received: from AM0PR08MB3745.eurprd08.prod.outlook.com
 ([fe80::d85f:f23f:ef0a:d163]) by AM0PR08MB3745.eurprd08.prod.outlook.com
 ([fe80::d85f:f23f:ef0a:d163%4]) with mapi id 15.20.6588.027; Fri, 14 Jul 2023
 14:32:02 +0000
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
X-Inumbo-ID: 3e0430e7-2253-11ee-b239-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JbRcR3buSSujg0UvOOkM3XuwpAEdnAQmh0QexJ7WeVQ=;
 b=O2celH1cU4LZt9soeB9fuDHIvBugYOYTNRNCq2UkLB7MMC050o0RecTFNme1ju0en1Sm3NFWwGRI530RNWdwaQmh5EL21y1MgXlIFISu9X8gx+n3g5cium6bPOWBnQQ1Ml8H/drVRO9TqXZHVHx94DK2olbei8FCR577QwtfqR4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: bddfd79087217051
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dmUsmpI9U/PO0PrYNr1a5a4eg2rhshvLM7nIYKHPumcdNQ5t2RaMmPk22AJIpmNmR59EIyT4w5CPLmT22rwElT//RfOiH7/FnWPgVbtUNUWmZIrenP+4A+nGeTFwaVHH7otS1m6ZNSiPDWs+h3aEDw++p4834qmxO1zBHJ9auQwufMNKgIJ/kZC4w6pjrIRcgYRS3rsnxJZiobi1IcGEAlJqvHtJ5xyM3FL4aqDTjHOp23TM1dlSul8eGVHaLQxUy8e6wxMOki6U9EaI0IzVy/9c/1R9T9i6nvIc7Y8zsWhdtC08aFB6t0ZsDZ+Fs6Z1tGcnxTVscCD4YkPeQE+Mgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JbRcR3buSSujg0UvOOkM3XuwpAEdnAQmh0QexJ7WeVQ=;
 b=oAw68lgAaX622eWANvvubyxvRYXt6O+gkVlUc0gOGFHSrKBd6bJ49m7A3xElQrjPxnEngXI21fLBwXoZlY66LQDcyaZHlkPJW7hYAddOgDhKt1yVrg9ltuWpnsTxVnvjTtlFEzCX2dPYoN4X4WhmwMIDEqleOgwBwMhGiKrVW/7OC9nByN5HCiADqFtJEx3v5zx3VY8isPrMR382Ic7af4efcnO+okknLIo4lf/8RUQjHUOOQBQXQZIPN4mKT5D0S41ROrlUKKdJnnjZMHrG3noiRGp5BHDq1r7ivDMfV+w4C/7s5qqdIRE1fEYJ5IzuR7eOsrOa/Gq0NlLZGx/HNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JbRcR3buSSujg0UvOOkM3XuwpAEdnAQmh0QexJ7WeVQ=;
 b=O2celH1cU4LZt9soeB9fuDHIvBugYOYTNRNCq2UkLB7MMC050o0RecTFNme1ju0en1Sm3NFWwGRI530RNWdwaQmh5EL21y1MgXlIFISu9X8gx+n3g5cium6bPOWBnQQ1Ml8H/drVRO9TqXZHVHx94DK2olbei8FCR577QwtfqR4=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, "michal.orzel@amd.com" <michal.orzel@amd.com>,
	"xenia.ragiadakou@amd.com" <xenia.ragiadakou@amd.com>,
	"ayan.kumar.halder@amd.com" <ayan.kumar.halder@amd.com>,
	"consulting@bugseng.com" <consulting@bugseng.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Wei Liu
	<wl@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [RFC PATCH 2/4] xen/arm64: bitops: justify uninitialized variable
 inside a macro
Thread-Topic: [RFC PATCH 2/4] xen/arm64: bitops: justify uninitialized
 variable inside a macro
Thread-Index: AQHZtkllBkKUd/6mO0+M9pyVgMwza6+5T/sAgAADTgA=
Date: Fri, 14 Jul 2023 14:32:02 +0000
Message-ID: <3305C79F-38AA-4BA3-A9AA-4A626C7CC478@arm.com>
References: <cover.1689329728.git.nicola.vetrini@bugseng.com>
 <d06a312944bee7457fa2ac75e0cfef20f0ec430f.1689329728.git.nicola.vetrini@bugseng.com>
 <CB1B8DB0-7708-454D-9E73-171CA894E304@arm.com>
In-Reply-To: <CB1B8DB0-7708-454D-9E73-171CA894E304@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM0PR08MB3745:EE_|PAWPR08MB10091:EE_|DBAEUR03FT047:EE_|DB5PR08MB10115:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e981d87-e4c3-4481-2396-08db84771f5f
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 SxEme2cr2qsgQDns2AKQ4heHNWQM2pKDFYNI5qCZ4UUuv4eihAxvm/XtfhBzNw3FYQVMf6Y7ycTvWeV2zz42DAQbKQxsPBd2uZeIMpFO75uU3QErWedtE34iz5Qyi5duzFkMxxtxqKrmNpv7ahKfuKPYbETUsYNmmxbbTkIwF2MO8xPPh9zxyaT+sav3qcsu5nghucgk07gcIvm6+qnqQB+BAKlLKhzkRuhe3cZUUnqwIwMc27eeFLyjx8MDv2anzMCQ0OBkYQVZuIEQzccFoPk1sQZ4DxD2KsaxMMc+cVKVsjUzBysVMa0ILF5oDHv0vnQv94VPBWU941qvdCgjON1FjimpppcddjWs0M9FOELta8CLruZp83rU3731O3khJITHVyj6P6uL/bgjSKbtJ2bceX3mSkRACis+VYIi2WOJ9SqXU3zFUFeB7SHMLTYlckQsjWFb0c8NyVW8151dkEwWD7PYSid5x8m5NMK7+QDx7Mljb/n6lrljOQ1CMJwLpHm8SrNg0Wb/lXMhJ7aGtziPMxgblQojN95kFHXiJDYz17kiwuo32Ip+cH6wpMO+3HCKxc5ScgftSWcEAP8FHhD5dbrHO1PVFOOkaB/RNzEgwOP+PnB11A8TE5Yb1k6LaS5SuxRAgTKcaNYa7YmKzw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3745.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(376002)(39860400002)(136003)(346002)(396003)(451199021)(8936002)(8676002)(33656002)(36756003)(2616005)(38100700002)(38070700005)(122000001)(2906002)(6506007)(86362001)(53546011)(7416002)(26005)(5660300002)(186003)(4326008)(6916009)(6486002)(54906003)(66446008)(66946007)(71200400001)(91956017)(66556008)(6512007)(66476007)(64756008)(41300700001)(76116006)(478600001)(316002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <A1B760AA930C144C98FFE7BB5FC3E554@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB10091
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT047.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	54c2a27b-f2e5-416e-9f8b-08db84771748
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lVoOQk9YLIo7YGnVhAttZiyLh4oc39X+oJK38wR3Av9x81VnAyu9B+pzzUGLdP9EbYMpiRXEnZ20/wBsfOv4ReAtySGxLbhCnmBdhzz25wAH+la3dTcnYYOFCsEZcUUXDU6cq5/e3GT5/fXeaSQ8R7LeRx4UQZXxW024lB8gChF0gyeQMk5+2rA5H7zz03Q23mDI4J3c6KQBRKfQi1rSDFHdAyr96NVzFRpdqmnxC02jLn+FKEpIcSdwrVIctpfz92Y6nGKEIAn1CoCkFSvkjLMauWSQQtC/KuZ+MrC6jtfFlKNDSF1C+eX4Iw1n2akj02Hj5VXFgU9mr0r8P0aKj17guL1RGksOKTW5j5wDCOu1jAb/Dq/DQRlyvmxRG1gMMFmefvA6LhFjZXZMNbY4SeweUsCtp4lYFgu+zACRC6iX8opCVdfg2EeEgJwf9v/pxY6lML6nxfNkXCAKuPzJ/DRubGTpKeQrSbh84pudVQARW2b4IJbmWFi43u9zAz2tccYMAa6Z1deGHsj0ovreO9cPg/QUK2meWZPHelaZzMi4TwA3IKgQiIlHU66MnvvBS93B6VhDcg8xiOEaQXpdVHpPsogb+56RQU4KOjjkaP4fHQUAoWDvmlyKHZLIaXFwx5WkGwaZWDR6ReP97rTzG6LXX1SjmySxTn6pijpz7k0ccLZoktvt7gnFn8skQZ+ZZ97sI7DfPBrh2HsZUjuh9WyMN1ObIo05/DRoRp4Loq4v52519dPjWsSpgmYEeXFK
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(39860400002)(376002)(346002)(451199021)(46966006)(36840700001)(40470700004)(316002)(41300700001)(5660300002)(82740400003)(356005)(81166007)(6862004)(8676002)(8936002)(40460700003)(86362001)(82310400005)(33656002)(36756003)(40480700001)(2906002)(6486002)(107886003)(6512007)(478600001)(47076005)(2616005)(186003)(336012)(36860700001)(26005)(6506007)(53546011)(4326008)(70586007)(70206006)(54906003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2023 14:32:16.5204
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e981d87-e4c3-4481-2396-08db84771f5f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT047.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR08MB10115

DQoNCj4gT24gMTQgSnVsIDIwMjMsIGF0IDE1OjIwLCBMdWNhIEZhbmNlbGx1IDxMdWNhLkZhbmNl
bGx1QGFybS5jb20+IHdyb3RlOg0KPiANCj4gDQo+IA0KPj4gT24gMTQgSnVsIDIwMjMsIGF0IDEy
OjQ5LCBOaWNvbGEgVmV0cmluaSA8bmljb2xhLnZldHJpbmlAYnVnc2VuZy5jb20+IHdyb3RlOg0K
Pj4gDQo+PiBUaGUgbWFjcm8gJ3Rlc3RvcCcgZXhwYW5kcyB0byBhIGZ1bmN0aW9uIHRoYXQgZGVj
bGFyZXMgdGhlIGxvY2FsDQo+PiB2YXJpYWJsZSAnb2xkYml0Jywgd2hpY2ggaXMgd3JpdHRlbiBi
ZWZvcmUgYmVpbmcgc2V0LCBidXQgaXMgc3VjaCBhDQo+PiB3YXkgdGhhdCBpcyBub3QgYW1lbmFi
bGUgdG8gYXV0b21hdGljIGNoZWNraW5nLg0KPj4gDQo+PiBUaGVyZWZvcmUsIGEgZGV2aWF0aW9u
IGNvbW1lbnQsIGlzIGludHJvZHVjZWQgdG8gZG9jdW1lbnQgdGhpcyBzaXR1YXRpb24uDQo+PiAN
Cj4+IEEgc2ltaWxhciByZWFzb25pbmcgYXBwbGllcyB0byBtYWNybyAnZ3Vlc3RfdGVzdG9wJy4N
Cj4+IA0KPj4gU2lnbmVkLW9mZi1ieTogTmljb2xhIFZldHJpbmkgPG5pY29sYS52ZXRyaW5pQGJ1
Z3NlbmcuY29tPg0KPj4gLS0tDQo+PiBkb2NzL21pc3JhL3NhZmUuanNvbiAgICAgICAgICAgICAg
ICAgICAgIHwgMTYgKysrKysrKysrKysrKysrKw0KPj4geGVuL2FyY2gvYXJtL2FybTY0L2xpYi9i
aXRvcHMuYyAgICAgICAgICB8ICAzICsrKw0KPj4geGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL2d1
ZXN0X2F0b21pY3MuaCB8ICAzICsrKw0KPj4gMyBmaWxlcyBjaGFuZ2VkLCAyMiBpbnNlcnRpb25z
KCspDQo+PiANCj4+IGRpZmYgLS1naXQgYS9kb2NzL21pc3JhL3NhZmUuanNvbiBiL2RvY3MvbWlz
cmEvc2FmZS5qc29uDQo+PiBpbmRleCAyNDQwMDFmNWJlLi40Y2Y3Y2JmNTdiIDEwMDY0NA0KPj4g
LS0tIGEvZG9jcy9taXNyYS9zYWZlLmpzb24NCj4+ICsrKyBiL2RvY3MvbWlzcmEvc2FmZS5qc29u
DQo+PiBAQCAtMjAsNiArMjAsMjIgQEANCj4+ICAgICAgICB9LA0KPj4gICAgICAgIHsNCj4+ICAg
ICAgICAgICAgImlkIjogIlNBRi0yLXNhZmUiLA0KPj4gKyAgICAgICAgICAgICJhbmFseXNlciI6
IHsNCj4+ICsgICAgICAgICAgICAgICAgImVjbGFpciI6ICJNQzNSMS5SOS4xIg0KPj4gKyAgICAg
ICAgICAgIH0sDQo+PiArICAgICAgICAgICAgIm5hbWUiOiAiUnVsZSA5LjE6IGluaXRpYWxpemVy
IG5vdCBuZWVkZWQiLA0KPj4gKyAgICAgICAgICAgICJ0ZXh0IjogIlRoZSBmb2xsb3dpbmcgbG9j
YWwgdmFyaWFibGVzIGFyZSBwb3NzaWJseSBzdWJqZWN0IHRvIGJlaW5nIHJlYWQgYmVmb3JlIGJl
aW5nIHdyaXR0ZW4sIGJ1dCBjb2RlIGluc3BlY3Rpb24gZW5zdXJlZCB0aGF0IHRoZSBjb250cm9s
IGZsb3cgaW4gdGhlIGNvbnN0cnVjdCB3aGVyZSB0aGV5IGFwcGVhciBlbnN1cmVzIHRoYXQgbm8g
c3VjaCBldmVudCBtYXkgaGFwcGVuLiINCj4+ICsgICAgICAgIH0sDQo+PiArICAgICAgICB7DQo+
PiArICAgICAgICAgICAgImlkIjogIlNBRi0zLXNhZmUiLA0KPj4gKyAgICAgICAgICAgICJhbmFs
eXNlciI6IHsNCj4+ICsgICAgICAgICAgICAgICAgImVjbGFpciI6ICJNQzNSMS5SOS4xIg0KPj4g
KyAgICAgICAgICAgIH0sDQo+PiArICAgICAgICAgICAgIm5hbWUiOiAiUnVsZSA5LjE6IGluaXRp
YWxpemVyIG5vdCBuZWVkZWQiLA0KPj4gKyAgICAgICAgICAgICJ0ZXh0IjogIlRoZSBmb2xsb3dp
bmcgbG9jYWwgdmFyaWFibGVzIGFyZSBwb3NzaWJseSBzdWJqZWN0IHRvIGJlaW5nIHJlYWQgYmVm
b3JlIGJlaW5nIHdyaXR0ZW4sIGJ1dCBjb2RlIGluc3BlY3Rpb24gZW5zdXJlZCB0aGF0IHRoZSBj
b250cm9sIGZsb3cgaW4gdGhlIGNvbnN0cnVjdCB3aGVyZSB0aGV5IGFwcGVhciBlbnN1cmVzIHRo
YXQgbm8gc3VjaCBldmVudCBtYXkgaGFwcGVuLiINCj4+ICsgICAgICAgIH0sDQo+IA0KPiBTaW5j
ZSB0aGUgcnVsZSBhbmQgdGhlIGp1c3RpZmljYXRpb24gYXJlIHRoZSBzYW1lLCB5b3UgY2FuIGRl
Y2xhcmUgb25seSBvbmNlIGFuZCB1c2UgdGhlIHNhbWUgdGFnIG9uIHRvcCBvZiB0aGUgb2ZmZW5k
aW5nIGxpbmVzLCBzbyAvKiBTQUYtMi1zYWZlIE1DM1IxLlI5LjEgKi8sDQo+IGFsc28sIEkgcmVt
ZW1iZXIgc29tZSBtYWludGFpbmVycyBub3QgaGFwcHkgYWJvdXQgdGhlIG1pc3JhIHJ1bGUgYmVp
bmcgcHV0IGFmdGVyIHRoZSB0YWcsIG5vdyBJIGRvbuKAmXQgcmVjYWxsIHdobw0KDQpTb3JyeSwg
SSBzZWUgdGhlcmUgd2FzIGluIGEgcGF0Y2ggYmVmb3JlIGEgU0FGLTEtc2FmZSB3aXRoIHRoZSBz
YW1lIGp1c3RpZmljYXRpb24sIHNvIEkgc3VnZ2VzdCB5b3UgdXNlIFNBRi0zLXNhZmUgYXMgdGFn
IGFuZCBkcm9wIHRoZSBuZXcganVzdGlmaWNhdGlvbnMgaW50cm9kdWNlZCBoZXJlDQoNCj4gDQo+
PiArICAgICAgICB7DQo+PiArICAgICAgICAgICAgImlkIjogIlNBRi00LXNhZmUiLA0KPj4gICAg
ICAgICAgICAiYW5hbHlzZXIiOiB7fSwNCj4+ICAgICAgICAgICAgIm5hbWUiOiAiU2VudGluZWwi
LA0KPj4gICAgICAgICAgICAidGV4dCI6ICJOZXh0IElEIHRvIGJlIHVzZWQiDQo+PiBkaWZmIC0t
Z2l0IGEveGVuL2FyY2gvYXJtL2FybTY0L2xpYi9iaXRvcHMuYyBiL3hlbi9hcmNoL2FybS9hcm02
NC9saWIvYml0b3BzLmMNCj4+IGluZGV4IDIwZTNmM2Q2Y2UuLmUwNzI4YmIyOWQgMTAwNjQ0DQo+
PiAtLS0gYS94ZW4vYXJjaC9hcm0vYXJtNjQvbGliL2JpdG9wcy5jDQo+PiArKysgYi94ZW4vYXJj
aC9hcm0vYXJtNjQvbGliL2JpdG9wcy5jDQo+PiBAQCAtMTE0LDggKzExNCwxMSBAQCBiaXRvcChj
aGFuZ2VfYml0LCBlb3IpDQo+PiBiaXRvcChjbGVhcl9iaXQsIGJpYykNCj4+IGJpdG9wKHNldF9i
aXQsIG9ycikNCj4+IA0KPj4gKy8qIFNBRi0yLXNhZmUgTUMzUjEuUjkuMSAqLw0KPj4gdGVzdG9w
KHRlc3RfYW5kX2NoYW5nZV9iaXQsIGVvcikNCj4+ICsvKiBTQUYtMi1zYWZlIE1DM1IxLlI5LjEg
Ki8NCj4+IHRlc3RvcCh0ZXN0X2FuZF9jbGVhcl9iaXQsIGJpYykNCj4+ICsvKiBTQUYtMi1zYWZl
IE1DM1IxLlI5LjEgKi8NCj4+IHRlc3RvcCh0ZXN0X2FuZF9zZXRfYml0LCBvcnIpDQo+PiANCj4+
IHN0YXRpYyBhbHdheXNfaW5saW5lIGJvb2wgaW50X2NsZWFyX21hc2sxNih1aW50MTZfdCBtYXNr
LCB2b2xhdGlsZSB1aW50MTZfdCAqcCwNCj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vaW5j
bHVkZS9hc20vZ3Vlc3RfYXRvbWljcy5oIGIveGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL2d1ZXN0
X2F0b21pY3MuaA0KPj4gaW5kZXggYTE3NDVmODYxMy4uOWQ4ZjhlYzNhMyAxMDA2NDQNCj4+IC0t
LSBhL3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9ndWVzdF9hdG9taWNzLmgNCj4+ICsrKyBiL3hl
bi9hcmNoL2FybS9pbmNsdWRlL2FzbS9ndWVzdF9hdG9taWNzLmgNCj4+IEBAIC02Nyw4ICs2Nywx
MSBAQCBndWVzdF9iaXRvcChjaGFuZ2VfYml0KQ0KPj4gLyogdGVzdF9iaXQgZG9lcyBub3QgdXNl
IGxvYWQtc3RvcmUgYXRvbWljIG9wZXJhdGlvbnMgKi8NCj4+ICNkZWZpbmUgZ3Vlc3RfdGVzdF9i
aXQoZCwgbnIsIHApICgodm9pZCkoZCksIHRlc3RfYml0KG5yLCBwKSkNCj4+IA0KPj4gKy8qIFNB
Ri0zLXNhZmUgTUMzUjEuUjkuMSAqLw0KPj4gZ3Vlc3RfdGVzdG9wKHRlc3RfYW5kX3NldF9iaXQp
DQo+PiArLyogU0FGLTMtc2FmZSBNQzNSMS5SOS4xICovDQo+PiBndWVzdF90ZXN0b3AodGVzdF9h
bmRfY2xlYXJfYml0KQ0KPj4gKy8qIFNBRi0zLXNhZmUgTUMzUjEuUjkuMSAqLw0KPj4gZ3Vlc3Rf
dGVzdG9wKHRlc3RfYW5kX2NoYW5nZV9iaXQpDQo+PiANCj4+ICN1bmRlZiBndWVzdF90ZXN0b3AN
Cj4+IC0tIA0KPj4gMi4zNC4xDQo+PiANCj4+IA0KPiANCg0K

