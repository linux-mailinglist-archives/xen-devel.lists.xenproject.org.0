Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D826A42F1EE
	for <lists+xen-devel@lfdr.de>; Fri, 15 Oct 2021 15:11:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.210584.367509 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbMyy-0002za-W1; Fri, 15 Oct 2021 13:10:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 210584.367509; Fri, 15 Oct 2021 13:10:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbMyy-0002xc-Si; Fri, 15 Oct 2021 13:10:44 +0000
Received: by outflank-mailman (input) for mailman id 210584;
 Fri, 15 Oct 2021 13:10:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fqmt=PD=arm.com=Bertrand.Marquis@srs-us1.protection.inumbo.net>)
 id 1mbMyx-0002xW-Hs
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 13:10:43 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:7e1b::630])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0f2cd3ab-066f-496a-934f-a6a5122f9a01;
 Fri, 15 Oct 2021 13:10:41 +0000 (UTC)
Received: from FR3P281CA0036.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1c::18)
 by AM9PR08MB6689.eurprd08.prod.outlook.com (2603:10a6:20b:30f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Fri, 15 Oct
 2021 13:10:36 +0000
Received: from VE1EUR03FT007.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:1c:cafe::d6) by FR3P281CA0036.outlook.office365.com
 (2603:10a6:d10:1c::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.9 via Frontend
 Transport; Fri, 15 Oct 2021 13:10:36 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT007.mail.protection.outlook.com (10.152.18.114) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.15 via Frontend Transport; Fri, 15 Oct 2021 13:10:36 +0000
Received: ("Tessian outbound d5def7722ff7:v103");
 Fri, 15 Oct 2021 13:10:35 +0000
Received: from 3f3ce42df36f.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 324EFB68-8D25-4282-A125-E78AFB31153B.1; 
 Fri, 15 Oct 2021 13:10:25 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3f3ce42df36f.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 15 Oct 2021 13:10:25 +0000
Received: from DB6PR0801MB2024.eurprd08.prod.outlook.com (2603:10a6:4:74::9)
 by DB8PR08MB4186.eurprd08.prod.outlook.com (2603:10a6:10:b1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.25; Fri, 15 Oct
 2021 13:10:22 +0000
Received: from DB6PR0801MB2024.eurprd08.prod.outlook.com
 ([fe80::45c9:9096:a15b:6955]) by DB6PR0801MB2024.eurprd08.prod.outlook.com
 ([fe80::45c9:9096:a15b:6955%4]) with mapi id 15.20.4587.031; Fri, 15 Oct 2021
 13:10:22 +0000
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
X-Inumbo-ID: 0f2cd3ab-066f-496a-934f-a6a5122f9a01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X9Vxl43kclpZM5scmQvjcv5dbse8cpDHD4HhyKT9iL8=;
 b=yggc/R+3NwnZOJ0qT1X6HrgTjYY8ycKjToTFDFZWb0UlYYIxu0NxPAERqJCG/PPe7l37ibm1QW1RRX9ojvhoWgnSrapinAJcos3wR7IHnnzIfd1jJyUIFn8pHOwlzu7ZvaVgn5CU8oT4wISOTBhiNZRPSI9Y+yylZYEIEao57vk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 206d4b5102850bad
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eOEUdK3/J4cXQHURg592lftCEXTzMgR9dB+DsQUO7RUoMAJMexTXhGJ9xNeML/fFsDuA1qLHVzmK/olh5duiXR/fyogubbVgW3JrzHEYRtFZtbJ8qFGmp/YjLDTafejyEGZaHVCi6IS/n84yghSHRn0Ar3fCNK/+ruq/U5p2153a0T2BpsFJHAM53i/6qmQ68/oe58sCNvQs2TOH04E+7b7xrdl69JnRpkzQPLcdCLnzzrGKdFDDAbEZFsX2ShH+yMaz9Pk/F2Sr7sfBz/pyJZmYvl+LWInEkDox3HyKvxMKFE1bCBtvtWFWn5ahXEfCEUxDDOav76HBwNt8zYvH0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X9Vxl43kclpZM5scmQvjcv5dbse8cpDHD4HhyKT9iL8=;
 b=RvcjiD83Dy54br8or4HOmQSYweyRuj159pCSqsgULDudFWazH9ovTK1oXtZdOHLc7sAqtAPP27YqYPhlgJAdiumgP/I1KRxX1gnLWNTu6RUZUBgqxcYi9CrUePVNBuoeWPFlZBwOXLeEVqPX1Tsiwp2HPNdFxS5/CBslLxl+eQm8p21klObjRmWUEumWD5JPSVZe7/vGky5Gpze4pin6GaYSch+o9PCChl9Zb1tsJ5gxYzyOtavcrQzjTRP66p5PudkhD/LK7i6aLWwSfx9NPXPEBUsNogxuf9NVS18qRx97vTmghSVRpHV+Q9nZmVc9S2y0b+AOuyAPelE23TV4TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X9Vxl43kclpZM5scmQvjcv5dbse8cpDHD4HhyKT9iL8=;
 b=yggc/R+3NwnZOJ0qT1X6HrgTjYY8ycKjToTFDFZWb0UlYYIxu0NxPAERqJCG/PPe7l37ibm1QW1RRX9ojvhoWgnSrapinAJcos3wR7IHnnzIfd1jJyUIFn8pHOwlzu7ZvaVgn5CU8oT4wISOTBhiNZRPSI9Y+yylZYEIEao57vk=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Rahul Singh <Rahul.Singh@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, Paul Durrant
	<paul@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v6 2/3] xen/arm: Enable the existing x86 virtual PCI
 support for ARM.
Thread-Topic: [PATCH v6 2/3] xen/arm: Enable the existing x86 virtual PCI
 support for ARM.
Thread-Index:
 AQHXwQrjS6mPrKT7Q06z3N66FcsDAKvTs1WAgAAj+QCAAAF1gIAAAUmAgAAVT4CAAAqRAIAAAYUAgAAC1QCAAAjTgIAAAtSA
Date: Fri, 15 Oct 2021 13:10:22 +0000
Message-ID: <E5F78DF2-D7CA-40C3-9E98-537155DD9529@arm.com>
References: <cover.1634221830.git.bertrand.marquis@arm.com>
 <396b08e2598cf0338e0c7f4ad3cd5cb66db89224.1634221830.git.bertrand.marquis@arm.com>
 <f41f59f7-69ed-e2fe-dc17-434b456cf693@suse.com>
 <57A39480-34DF-4BF5-9B0E-802D30F94BBD@arm.com>
 <24937.21631.538303.29471@mariner.uk.xensource.com>
 <b8fc68e6-2bba-ef11-4c4a-50c2046ecb04@suse.com>
 <YWlnc3b0sj4akUWa@MacBook-Air-de-Roger.local>
 <A2AAD333-35A2-4250-891C-E8FB885D5660@arm.com>
 <887d99e8-bcc5-f854-ceed-a38701e1ad1d@suse.com>
 <6C183E72-A9E8-4AB0-B6C4-C31E8AAFC4B6@arm.com>
 <08fec860-7e8a-c8c7-df70-3c277de81718@suse.com>
In-Reply-To: <08fec860-7e8a-c8c7-df70-3c277de81718@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: a48e5928-bfec-48b7-3ff8-08d98fdd2d97
x-ms-traffictypediagnostic: DB8PR08MB4186:|AM9PR08MB6689:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM9PR08MB66895A1C5FB97813544874CC9DB99@AM9PR08MB6689.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 qMrq3t0oO5iw1TNjxf6PIK9wq8YsrMddFQeHjbcM1xhhYsRH+40vco9D6xRcH2FGBe2BRwfihJB6Ve7Pdxr8ae0tE1l8Vl9wo/O3Pp1GZa/UlaXhSGNBpYEa8+zrKX1dO76AQXP7S4oPg8prT5dqd9nMvOW3Q6oEBPgA7v8SiAFUHPdGDGKQqLN9aIq6undCgjDLkLL9jeWTRTrd5JhVN+DXR2nZwDHQ2NrCdOTTvHvoQDUgdGMNzPbjGrg1ePQORFy0HrC3pkDw/hxVI1zGwu553Fd/VQRLaIs8likMeIIYqAYJnLZpkLIVIb/KW600rtftLT2ZHucif2o1XG+6ZLTzn3px77S0ecjbN2XF5OKs+gbUCOr7qCm3Gp0Q8XQd/4abhFQJfJfa8/EOIL9Ep57P3mxaMMUTkcXX47reroxv6KHS7NuqmoJxBWT+fE2qX3r7icgJ2I5yTYhdIX12tGUANXMRuyKAY0qDhWdDF3R8eXen+L71DpxPhvwmSw936AWv1Ma3J3KG7T5NgGBEYdwLOAsUZFHuwcbSVHJ1RN0KEsPpLy8gkgNwtQJ96gHCHoiZUNuUEp42LrjyiDID/MTtA374FEsZU4aFx8JTV7Vv/iPh4yHRwOPXEfTmVWt9B1ZyVwvxFxkscVMqh0zLP4nW8BUo8vtnoyfyuIJxSdd1BceaHgm0NHEOnFF3heqoe8QHBaAI5DZsa4H96uEJNs8aIoc6BcLcGwTxCTGUd0oHalupIEHYG7RAYJYuDywK6b4QomMORHC05U8ocJ1K4s+Gzx7A7HcI+Hu4CpKY+8x8k3xEAGvjlQwr1qS8dWx1EFGuBYMgvWfVtFl/0Bzcgw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0801MB2024.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(4326008)(186003)(54906003)(122000001)(316002)(6506007)(8936002)(6486002)(8676002)(86362001)(38070700005)(53546011)(26005)(38100700002)(7416002)(33656002)(76116006)(5660300002)(508600001)(36756003)(2616005)(66556008)(64756008)(66476007)(71200400001)(966005)(91956017)(6916009)(83380400001)(66446008)(2906002)(66946007)(6512007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <053FBC05CFA16043BF39A17879A060BE@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4186
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	950a1784-58fa-4c49-7e53-08d98fdd253e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nhO6zjN6/W0DgLuKm4UrYr2NlEEeIP82Gc0ycKIMSbX46fpTzEE8edAqdYzXR1fkuznWN0xv8YK/Y65UHg+6XPbOWkcc64naafM36jcYnFMvyryIEbGIiyzCuvRh4YuN6G/Y3Y7WJJlVEK25Xi2HDa597rY7xaObGGzefPoA+jGUBGVbFhhJzC5hTLhhJjH20JNkRyUTwWSB+4l2skBJmQ6rI7nbJP+GivCwarU2uQdfW2FIyCc2aaGPCivQ2I+/gQNjy5HD4mzZKXJ5l445b8g1iIPN7I3xnnLo13niQ0IV0wOqQiL7R6w08sTLrpK6280BO/ffa+zVZ76dOysDHm7jAjzBiBXqGwNTFdrePG8tMHV8WRmtjE+T9Ok6WCQepxSSUhuc601n8rDMXwobhb6mgb8EblhEHKKjv65N4Vut5Cryzet9PyJZpf6StDXT87LebYPXiSkEpu6Z+LroCJM8RzqXRO5KLFUoQFiQbn73kXe4W3hX2Fo0z22JVdwmOZe6bwQfFm9y4jD4VuSbr+AGQLMEWqxXa/X/cRdq1PiYEyzy42b9imtUfpPfHMyp/nqNYkHXjIdPVG/zddm+SWpn1ePJuvpgrW75QRfyeOt3BGkEa19wtsRWcSSHpTiDEIDWNwhjNzYkKurDC0E7kAgeK2xdohdZxUyQbGoHs1cHeiC1j9ASLK5kbbfy0VB6BzolGrv0bE9r14DDf+w4GhhIqxkoBlD5TIppdcD1RX3OIFNbOh7K1O/RMeKQIXWnWKAGk/ccLNutZzgsEjVyw82TP/cJ4xrdz50ehvVrEd8=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(966005)(336012)(5660300002)(8676002)(36860700001)(8936002)(6486002)(6506007)(53546011)(83380400001)(316002)(54906003)(26005)(186003)(70206006)(508600001)(70586007)(81166007)(4326008)(6862004)(356005)(2616005)(6512007)(2906002)(33656002)(36756003)(47076005)(86362001)(82310400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2021 13:10:36.3637
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a48e5928-bfec-48b7-3ff8-08d98fdd2d97
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6689

SGkgSmFuLA0KDQo+IE9uIDE1IE9jdCAyMDIxLCBhdCAxNDowMCwgSmFuIEJldWxpY2ggPGpiZXVs
aWNoQHN1c2UuY29tPiB3cm90ZToNCj4gDQo+IE9uIDE1LjEwLjIwMjEgMTQ6MjgsIEJlcnRyYW5k
IE1hcnF1aXMgd3JvdGU6DQo+Pj4gT24gMTUgT2N0IDIwMjEsIGF0IDEzOjE4LCBKYW4gQmV1bGlj
aCA8amJldWxpY2hAc3VzZS5jb20+IHdyb3RlOg0KPj4+IE9uIDE1LjEwLjIwMjEgMTQ6MTMsIEJl
cnRyYW5kIE1hcnF1aXMgd3JvdGU6DQo+Pj4+PiBPbiAxNSBPY3QgMjAyMSwgYXQgMTI6MzUsIFJv
Z2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPiB3cm90ZToNCj4+Pj4+IE9uIEZy
aSwgT2N0IDE1LCAyMDIxIGF0IDEyOjE4OjU5UE0gKzAyMDAsIEphbiBCZXVsaWNoIHdyb3RlOg0K
Pj4+Pj4+IE9uIDE1LjEwLjIwMjEgMTI6MTQsIElhbiBKYWNrc29uIHdyb3RlOg0KPj4+Pj4+PiBC
ZXJ0cmFuZCBNYXJxdWlzIHdyaXRlcyAoIlJlOiBbUEFUQ0ggdjYgMi8zXSB4ZW4vYXJtOiBFbmFi
bGUgdGhlIGV4aXN0aW5nIHg4NiB2aXJ0dWFsIFBDSSBzdXBwb3J0IGZvciBBUk0uIik6DQo+Pj4+
Pj4+Pj4gT24gMTUgT2N0IDIwMjEsIGF0IDA5OjAwLCBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOg0KPj4+Pj4+Pj4+IFRoZSBsYXR0ZXIgaXMgZmluZSB0byBiZSBwdXQgaGVy
ZSAoaS5lLiBGVEFPRCBJJ20gZmluZSB3aXRoIGl0DQo+Pj4+Pj4+Pj4gc3RheWluZyBoZXJlKS4g
Rm9yIHRoZSBmb3JtZXIgSSBldmVuIHF1ZXN0aW9uIGl0cyBvcmlnaW5hbCBwbGFjZW1lbnQNCj4+
Pj4+Pj4+PiBpbiBhc20teDg2L3BjaS5oOiBJdCdzIG5vdCBnZW5lcmFsbHkgY29ycmVjdCBhcyBw
ZXIgdGhlIFBDSSBzcGVjLCBhcw0KPj4+Pj4+Pj4+IHRoZSBidXMgcG9ydGlvbiBvZiB0aGUgYWRk
cmVzcyBjYW4gYmUgYW55d2hlcmUgZnJvbSAxIHRvIDggYml0cy4gQW5kDQo+Pj4+Pj4+Pj4gaW4g
ZmFjdCB0aGVyZSBpcyBhIHJlYXNvbiB3aHkgdGhpcyBtYWNybyB3YXMvaXMgdXNlZCBpbiBvbmx5
IGENCj4+Pj4+Pj4+PiBzaW5nbGUgcGxhY2UsIGJ1dCBub3QgZS5nLiBpbiB4ODYnZXMgaGFuZGxp
bmcgb2YgcGh5c2ljYWwgTUNGRy4gSXQNCj4+Pj4+Pj4+PiBpcyBtZXJlbHkgYW4gaW1wbGVtZW50
YXRpb24gY2hvaWNlIGluIHZQQ0kgdGhhdCB0aGUgZW50aXJlIHNlZ21lbnQgMA0KPj4+Pj4+Pj4+
IGhhcyBhIGxpbmVhciBhZGRyZXNzIHJhbmdlIGNvdmVyaW5nIGFsbCAyNTYgYnVzZXMuIEhlbmNl
IEkgdGhpbmsNCj4+Pj4+Pj4+PiB0aGlzIHdhbnRzIHRvIG1vdmUgdG8geGVuL3ZwY2kuaCBhbmQg
dGhlbiBwZXJoYXBzIGFsc28gYmUgbmFtZWQNCj4+Pj4+Pj4+PiBWUENJX0VDQU1fQkRGKCkuDQo+
Pj4+Pj4+PiANCj4+Pj4+Pj4+IE9uIHByZXZpb3VzIHZlcnNpb24gaXQgd2FzIHJlcXVlc3QgdG8g
cmVuYW1lZCB0aGlzIHRvIEVDQU0gYW5kIGFncmVlZA0KPj4+Pj4+Pj4gdG8gcHV0IGlzIGhlcmUu
IE5vdyB5b3Ugd2FudCBtZSB0byByZW5hbWUgaXQgdG8gVlBDSSBhbmQgbW92ZSBpdCBhZ2Fpbi4N
Cj4+Pj4+Pj4+IEkgd291bGQgbGlrZSB0byBoYXZlIGEgY29uZmlybWF0aW9uIHRoYXQgdGhpcyBp
cyBvayBhbmQgdGhlIGZpbmFsIG1vdmUgaWYgcG9zc2libGUuDQo+Pj4+Pj4+PiANCj4+Pj4+Pj4+
IEBSb2dlciBjYW4geW91IGNvbmZpcm0gdGhpcyBpcyB3aGF0IGlzIHdhbnRlZCA/DQo+Pj4+Pj4+
IA0KPj4+Pj4+PiBJIHRoaW5rIFJvZ2VyIGlzIG5vdCBhdmFpbGFibGUgdG9kYXkgSSdtIGFmcmFp
ZC4NCj4+Pj4+Pj4gDQo+Pj4+Pj4+IEJlcnRyYW5kLCBjYW4geW91IGdpdmUgbWUgYSBsaW5rIHRv
IHRoZSBjb21tZW50IGZyb20gUm9nZXIgPw0KPj4+Pj4+PiBBc3N1bWluZyB0aGF0IGl0IHNheXMg
d2hhdCBJIHRoaW5rIGl0IHdpbGwgc2F5Og0KPj4+Pj4+PiANCj4+Pj4+Pj4gSSB0aGluayB0aGUg
YmVzdCB0aGluZyB0byBkbyB3aWxsIGJlIHRvIGxlYXZlIHRoZSBuYW1lIGFzIGl0IHdhcyBpbg0K
Pj4+Pj4+PiB0aGUgbW9zdCByZWNlbnQgdmVyc2lvbiBvZiB5b3VyIHNlcmllcy4gIEkgZG9uJ3Qg
dGhpbmsgaXQgbWFrZXMgc2Vuc2UNCj4+Pj4+Pj4gdG8gYmxvY2sgdGhpcyBwYXRjaCBvdmVyIGEg
bmFtaW5nIGRpc2FncmVlbWVudC4gIEFuZCBpdCB3b3VsZCBiZSBiZXN0DQo+Pj4+Pj4+IHRvIG1p
bmltaXNlIHVubmVjZXNzYXJ5IGNodXJuLg0KPj4+Pj4+PiANCj4+Pj4+Pj4gSSB3b3VsZCBiZSBo
YXBweSB0byByZWxlYXNlLWFjayBhIG5hbWUgY2hhbmdlIChwZXJoYXBzIHByb3Bvc2VkIGJvIEph
bg0KPj4+Pj4+PiBvciBSb2dlcikgc3VwcG9zaW5nIHRoYXQgdGhhdCBpcyB0aGUgdWx0aW1hdGUg
bWFpbnRhaW5lciBjb25zZW5zdXMuDQo+Pj4+Pj4+IA0KPj4+Pj4+PiBKYW4sIHdvdWxkIHRoYXQg
YXBwcm9hY2ggYmUgT0sgd2l0aCB5b3UgPw0KPj4+Pj4+IA0KPj4+Pj4+IFdlbGwsIHllcywgaWYg
YSBzdWJzZXF1ZW50IG5hbWUgY2hhbmdlIGlzIG9rYXksIHRoZW4gSSBjb3VsZCBsaXZlIHdpdGgN
Cj4+Pj4+PiB0aGF0LiBJJ2Qgc3RpbGwgZmluZCBpdCBvZGQgdG8gcmVuYW1lIGEgZnVuY3Rpb24g
aW1tZWRpYXRlbHkgYWZ0ZXIgaXQNCj4+Pj4+PiBhbHJlYWR5IGdvdCByZW5hbWVkLiBBcyBleHBy
ZXNzZWQgZWxzZXdoZXJlLCBJIHN1c3BlY3QgaW4gaGlzIHJlcXVlc3QNCj4+Pj4+PiBSb2dlciBk
aWQgbm90IHBheSBhdHRlbnRpb24gdG8gYSB1c2Ugb2YgdGhlIGZ1bmN0aW9uIGluIG5vbi1FQ0FN
IGNvZGUuDQo+Pj4+PiANCj4+Pj4+IFVzaW5nIE1NQ0ZHX0JERiB3YXMgb3JpZ2luYWwgcmVxdWVz
dGVkIGJ5IEp1bGllbiwgbm90IG15c2VsZiBJIHRoaW5rOg0KPj4+Pj4gDQo+Pj4+PiBodHRwczov
L2xvcmUua2VybmVsLm9yZy94ZW4tZGV2ZWwvYTg2OGUxZTctODQwMC00NWRmLTZlYWEtNjlmMWUy
Yzk5MzgzQHhlbi5vcmcvDQo+Pj4+PiANCj4+Pj4+IEknbSBzbGlnaHRseSBsb3NzIGluIHNvIG1h
bnkgbWVzc2FnZXMuIE9uIHg4NiB3ZSBzdWJ0cmFjdCB0aGUgTUNGRw0KPj4+Pj4gc3RhcnQgYWRk
cmVzcyBmcm9tIHRoZSBwYXNzZWQgb25lIGJlZm9yZSBnZXR0aW5nIHRoZSBCREYsIGFuZCB0aGVu
IHdlDQo+Pj4+PiBhZGQgdGhlIHN0YXJ0dGluZyBidXMgYWRkcmVzcyBwYXNzZWQgaW4gdGhlIEFD
UEkgdGFibGUuIFRoaXMgaXMgc28gZmFyDQo+Pj4+PiBub3QgbmVlZCBvbiBBcm0gQUZBSUNUIGJl
Y2F1c2Ugb2YgdGhlIGZpeGVkIG5hdHVyZSBvZiB0aGUgc2VsZWN0ZWQNCj4+Pj4+IHZpcnR1YWwg
RUNBTSByZWdpb24uDQo+Pj4+IA0KPj4+PiBBdCB0aGUgZW5kIG15IHBhdGNoIHdpbGwgYWRkIGlu
IHhlbi9wY2kuaDoNCj4+Pj4gI2RlZmluZSBFQ0FNX0JERihhZGRyKSAgICAgICAgICgoKGFkZHIp
ICYgMHgwZmZmZjAwMCkgPj4gMTIpDQo+Pj4gDQo+Pj4gU2luY2UgeW91IHN0aWxsIG1ha2UgdGhp
cyBwcm9wb3NhbCwgb25jZSBhZ2FpbjogSSdtIG5vdCBnb2luZyB0bw0KPj4+IGFjY2VwdCBzdWNo
IGEgbWFjcm8gaW4gdGhpcyBoZWFkZXIsIHdoYXRldmVyIHRoZSBuYW1lLiBJdHMgcHJpb3INCj4+
PiBwbGFjZW1lbnQgd2FzIHdyb25nIGFzIHdlbGwuIE9ubHkgLi4uDQo+Pj4gDQo+Pj4+ICNkZWZp
bmUgRUNBTV9SRUdfT0ZGU0VUKGFkZHIpICAoKGFkZHIpICYgMHgwMDAwMGZmZikNCj4+PiANCj4+
PiAuLi4gdGhpcyBvbmUgaXMgZmluZSB0byBsaXZlIGhlcmUgKGFuZCBwcmVzdW1hYmx5IGl0IGNv
dWxkIGdhaW4gdXNlcw0KPj4+IGVsc2V3aGVyZSkuDQo+PiANCj4+IFNvIHlvdSB3b3VsZCBhZ3Jl
ZSBpZiB0aGV5IGFyZSBib3RoIG1vdmVkIHRvIHZwY2kuaCB3aXRoIGEgVlBDSV8gcHJlZml4ID8N
Cj4gDQo+IEkgd291bGRuJ3Qgb2JqZWN0LCBidXQgYXMgc2FpZCBzZXZlcmFsIHRpbWVzIGJlZm9y
ZSBJIHNlZSBubyByZWFzb24NCj4gdG8gYWxzbyBtb3ZlIGFuZCByZW5hbWUgRUNBTV9SRUdfT0ZG
U0VUKCkuIElmIHlvdSBtb3ZlZCBpdCBhbmQgaWYNCj4gbGF0ZXIgd2UgZmluZCBhIHVzZSBmb3Ig
aXQgb3V0c2lkZSBvZiB2UENJLCB3ZSdkIG5lZWQgdG8gcmVuYW1lIGFuZA0KPiBtb3ZlIGl0IGFn
YWluLg0KDQpJIHdpbGwgbW92ZSBCREYgdG8gdnBjaS5oIGFuZCBoYWQgVlBDSSBwcmVmaXggYW5k
IGtlZXAgUkVHX09GRlNFVCBhcw0KaXQgaXMgYW5kIHdoZXJlIGl0IGlzIHRoZW4uDQoNCkNoZWVy
cw0KQmVydHJhbmQNCg0KPiANCj4gSmFuDQo+IA0KDQo=

