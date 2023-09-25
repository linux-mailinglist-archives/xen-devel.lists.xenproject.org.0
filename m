Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D0E7AD6B2
	for <lists+xen-devel@lfdr.de>; Mon, 25 Sep 2023 13:08:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.607815.946129 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qkjS7-00006W-SH; Mon, 25 Sep 2023 11:08:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 607815.946129; Mon, 25 Sep 2023 11:08:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qkjS7-0008VE-Pb; Mon, 25 Sep 2023 11:08:35 +0000
Received: by outflank-mailman (input) for mailman id 607815;
 Mon, 25 Sep 2023 11:08:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LToL=FJ=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qkjS6-0008Tw-K0
 for xen-devel@lists.xenproject.org; Mon, 25 Sep 2023 11:08:34 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20623.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::623])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dcd3ca91-5b93-11ee-9b0d-b553b5be7939;
 Mon, 25 Sep 2023 13:08:32 +0200 (CEST)
Received: from DUZP191CA0022.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f9::26)
 by VI1PR08MB5437.eurprd08.prod.outlook.com (2603:10a6:803:13d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Mon, 25 Sep
 2023 11:08:24 +0000
Received: from DBAEUR03FT005.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:4f9:cafe::af) by DUZP191CA0022.outlook.office365.com
 (2603:10a6:10:4f9::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.35 via Frontend
 Transport; Mon, 25 Sep 2023 11:08:24 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT005.mail.protection.outlook.com (100.127.142.81) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.18 via Frontend Transport; Mon, 25 Sep 2023 11:08:24 +0000
Received: ("Tessian outbound 169aaa6bf2b7:v175");
 Mon, 25 Sep 2023 11:08:24 +0000
Received: from 29d98781f993.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5AA754E3-DBCD-4AE1-A8B6-21B0672B937E.1; 
 Mon, 25 Sep 2023 11:08:13 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 29d98781f993.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 25 Sep 2023 11:08:13 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by GV2PR08MB9423.eurprd08.prod.outlook.com (2603:10a6:150:df::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Mon, 25 Sep
 2023 11:08:10 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::dfff:49d6:ed04:118b]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::dfff:49d6:ed04:118b%6]) with mapi id 15.20.6813.027; Mon, 25 Sep 2023
 11:08:10 +0000
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
X-Inumbo-ID: dcd3ca91-5b93-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hFATpn4ONnHFcAU/2FHf72ZJR8ubD4ofyg044rqiJoU=;
 b=Wu0ye1vHuPUwTHpGJbpCeexMWI3WhpeQABqdYuWWkqX0H6grXcDMNuQZ5VYFhxVFBPrxgaMAgEE6/VXIhk9xMxn/Nsi08306OO96fRqM/cvc84pYoqQRPCIKdaQ81666q6BRkAoMd/j2h9TTeKJ0rmRSUC5nuRV8H7FL/LahZSk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7aafc71dc7608d75
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YcTS46JF5Eky44UcAv/YYMzLg6AncWCdx4+7RUstTImH9QskPeOWC7jWBUS0IVa4OYo2Ltdw779TFiSiQw7VnJLdGt3s+F3ch2hMOtSLxowdPFAMtW8KEbkyVUeo8T/FxmXXjBW83C/68ffsUN1HuVJaAdYd6ET545fSyu0udePdT274DmugGkwixew4l9rslWvtJKse67uFSHMW0EON4/MXGmrxnipg5r8Ns2R/h42xKgnQrQKWiCvlOVnZyOVwtoex5mgkeux5DDIB+lPzgvMbrq0/EYozydoi5mpYQYaHsLDDSJ+Cand+00odPP9ej/EduSK4mTt+O76J6LmOFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hFATpn4ONnHFcAU/2FHf72ZJR8ubD4ofyg044rqiJoU=;
 b=oFfcPVJMN/TQ/LH7Gk0SUGswF/LJw64Cw7VJ7s/hivMIsLDTs0bmk4sO9UaKgd3WGDpvoodVWvZxXsi8j2uuHt77Wvy4TS5JyFMaoeqskIfVAEmX4sCmxU6op88ofhEfvIwZa2ZcSR7q6MmYBkCuXvcRLjCd9RE/tXY3JPIuEEHiB/2GQyih7rxdbkR1j9fcFEChD+7VvVlLn/wN0lklWSXCzKMAbY9mRqzN6WgeUTGZn8KeHd961Yp/W6ZlwzQL6zSSH8Rp53shv2yMAdiNiD75A7PEi6MkkiwjFEe2BJk3Yk6B2w2Pp/qOWB+CniAnCYDRpBH6fWdjNwZRyqkMjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hFATpn4ONnHFcAU/2FHf72ZJR8ubD4ofyg044rqiJoU=;
 b=Wu0ye1vHuPUwTHpGJbpCeexMWI3WhpeQABqdYuWWkqX0H6grXcDMNuQZ5VYFhxVFBPrxgaMAgEE6/VXIhk9xMxn/Nsi08306OO96fRqM/cvc84pYoqQRPCIKdaQ81666q6BRkAoMd/j2h9TTeKJ0rmRSUC5nuRV8H7FL/LahZSk=
From: Henry Wang <Henry.Wang@arm.com>
To: George Dunlap <george.dunlap@cloud.com>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>,
	"committers@xenproject.org" <committers@xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	"jgross@suse.com" <jgross@suse.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Anthony PERARD <anthony.perard@citrix.com>,
	"community.manager@xenproject.org" <community.manager@xenproject.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: Xen 4.18 release: Reminder about code freeze
Thread-Topic: Xen 4.18 release: Reminder about code freeze
Thread-Index: AQHZ705Dwyrpd4I60kahQfZlaJ2JtLArFXGAgAACIQCAADDfgIAACQ8AgAAQ+YA=
Date: Mon, 25 Sep 2023 11:08:10 +0000
Message-ID: <24C421FD-4AC0-4CC6-94CB-A3394A41949B@arm.com>
References:
 <AS8PR08MB7991D1099E32CC9F03B0E0F692FCA@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <6399a816-ac1a-b741-ed52-b5d03b498ee6@suse.com>
 <2AB20BED-9ED9-4713-A39A-59891E09E02C@arm.com>
 <1a056bd6-a918-4c76-82b0-0eded46b23a8@xen.org>
 <CA+zSX=YqQrcLcdsYeJS1qya_0zf1AHZFcA5g8i3DZvJ+R9PHLQ@mail.gmail.com>
In-Reply-To:
 <CA+zSX=YqQrcLcdsYeJS1qya_0zf1AHZFcA5g8i3DZvJ+R9PHLQ@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|GV2PR08MB9423:EE_|DBAEUR03FT005:EE_|VI1PR08MB5437:EE_
X-MS-Office365-Filtering-Correlation-Id: 7031add8-fdb8-4bad-ad7e-08dbbdb7bc9c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 RG5jYDEpXn6mpJH9fLh8Jw/5b91FnlI7LGlgXHO5//2vBVRHv+VrNmw7E/Ayij3fEPCmJn3RoOX6RZCghd9r0FBQFX9cJjz+KhZbuD08H80I42qqmlt0axrqLLAGPYzmbDhbYdHoyiMvqEZ0CnPWXDhhLGPseF0c7om0DMjokWydz0qcqAinz3PQALsYPs08Q58qCzpgwya0/52TYvAABcW7sxYO6hI0LKBzvwjLZkUr9RlwqNIZJTkjqmp/NXgohoCCusHeCNYYrTEOtlvVFCMSVAOPWztgQZkrXydK3a/tCFEO26jcaMPM/1TYdVWCB6hNcLoj9gILuFCV8q0Pqy7jmDDnLg/t7+r6udIsX7WCs5AGMJj4+akWnpu8YmKEc7xirfTrJ6/ENtTnwJ7QSI01cGjtmWkql96h9jRownMxeHRVBLRocM77KUTIjXWwbgIGc81snQAc3NTHufPgIVAf0aPDNGBi0j8HvKLlZZIHlSK0DXhbXhNNakc5FSMG5aPO7s9yRDQTrMe8ScwgDB+RcadL0u6cIftdmgN6XnNx73cIC4OCEzdcVR6Nsx81OEX61oLBpQVF4M0o6jsvRURiH7TrxzhZKUSBHsKLQDlkHLU532du95sr3oELoo4V351SiKJqElEladIjvYrS5A==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(396003)(39860400002)(346002)(376002)(230922051799003)(186009)(1800799009)(451199024)(66899024)(2906002)(38070700005)(83380400001)(7416002)(122000001)(38100700002)(53546011)(6512007)(66946007)(66556008)(66476007)(66446008)(64756008)(54906003)(91956017)(110136005)(76116006)(71200400001)(6506007)(6486002)(26005)(5660300002)(41300700001)(316002)(478600001)(8936002)(8676002)(4326008)(2616005)(86362001)(36756003)(33656002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <ACDF1E5A235C754D92336714E2B1E7EC@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB9423
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	884c5d2e-b02d-48fb-c73b-08dbbdb7b43c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	otFjFjwP6WmUUnPQFJvjHN+lUIDXOuR/W76zyNqDyhSpjtzMGx5+RqFffMySsnAgVACWR82F1ItMtO/lISnSUtY6C3k6nRZFXOnkXrz7xjIVr9jDs/lC2AZkksvMHWMj1Hdl9And1/2ak6LL++bbWxEnGVfHvkxlXESUQTxG6OMAE5mlgBS9z4uR+kDiXbhgEJueEc7uaYhp95GnMI2Ebo2JVOqDfLIRtHeXtoSUm+jvwatFn5GleXYI8J+Wh8XUHX+omr+/bfcU2VHcco0UNiP9GyDSy3D/ALIq23COKM4w9zZkYBE+dzm3SBnzBLPyaGz7SaZa1Gpyi1rtRKkp3yzgEJ4VqrYo/C0vRpmhOdF66O7Q80nBl6hDGi0hF0SZouTjIpDTv54CVlyCXpyFleKMhCmX4uG4DM0gQbQzj9B8Fgvcb2JSo+pJyuZLlxYt9oY2HNrdCMO0lP9ua86X/l1y/zuekkl3yxST4BctizdaYpvVC0mah9pwTHejUs+8/i/lrOVw4+UzBOnrN/btZtiQsFl7B+ELRK3AvQsqCms8kjaGBdECiCR2TklbKJqiXT3kCUcaPCViFBmQ7lrHEP8TBeTZNVmcQxmadBC2POl/vn/GsAZjEkEbTCFqzs3R6X7RZuI31e2GS68MnMu6QDG9e6D3qvqtRXjPUKulgmkr3Pf0NRKkpIb5G1Gfuri03NHTDgV5mym/5h83kMwqMg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(346002)(396003)(39850400004)(376002)(230922051799003)(82310400011)(1800799009)(186009)(451199024)(46966006)(36840700001)(6512007)(6506007)(2616005)(53546011)(6486002)(478600001)(8936002)(47076005)(83380400001)(26005)(336012)(2906002)(8676002)(70206006)(70586007)(110136005)(316002)(54906003)(4326008)(5660300002)(41300700001)(36860700001)(36756003)(86362001)(81166007)(33656002)(82740400003)(40480700001)(356005)(66899024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2023 11:08:24.3950
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7031add8-fdb8-4bad-ad7e-08dbbdb7bc9c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5437

SGkgR2VvcmdlLA0KDQo+IE9uIFNlcCAyNSwgMjAyMywgYXQgMTg6MDcsIEdlb3JnZSBEdW5sYXAg
PGdlb3JnZS5kdW5sYXBAY2xvdWQuY29tPiB3cm90ZToNCj4gDQo+IE9uIE1vbiwgU2VwIDI1LCAy
MDIzIGF0IDEwOjM14oCvQU0gSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4gd3JvdGU6DQo+
PiANCj4+IEhpIEhlbnJ5LA0KPj4gDQo+PiBPbiAyNS8wOS8yMDIzIDA3OjQwLCBIZW5yeSBXYW5n
IHdyb3RlOg0KPj4+PiBPbiBTZXAgMjUsIDIwMjMsIGF0IDE0OjMyLCBKYW4gQmV1bGljaCA8amJl
dWxpY2hAc3VzZS5jb20+IHdyb3RlOg0KPj4+PiBUaGlzLCBmb3IgZXhhbXBsZSwgd291bGQgdGhl
biBsaWtlbHkgbWVhbg0KPj4+PiB0aGF0IGFsbCBNaXNyYSB3b3JrIG5vdyBuZWVkcyBxdWV1aW5n
IGZvciBhZnRlciB0aGUgdHJlZSByZS1vcGVucyAuLi4NCj4+PiANCj4+PiDigKZJIGFsc28gdGhv
dWdodCBhYm91dCB0aGlzLCB0byBiZSBob25lc3QgSSBhbSB0ZW1wdGVkIHRvIGxvb3NlIHRoZSBj
b250cm9sDQo+Pj4gb3IgYXQgbGVhc3Qgb2ZmZXIgc29tZSBmbGV4aWJpbGl0eSBvbiB0aGlzIHNw
ZWNpZmljIHBhcnQsIGFzIG5vcm1hbGx5IE1JU1JBDQo+Pj4gcmVsYXRlZCBjaGFuZ2VzIGFyZSBo
YXJtbGVzcyBhbmQgYWN0dWFsbHkgaGFyZGVuIHRoZSBjb2RlLiBJIGFtIHdvbmRlcmluZw0KPj4+
IGlmIHRoZXJlIGFyZSBhbnkgb2JqZWN0aW9ucyBmcm9tIG90aGVyc+KApg0KPj4+IA0KPj4+IENv
bW1pdHRlcnMsIHdvdWxkIHlvdSBtaW5kIHNoYXJpbmcgeW91ciBvcGluaW9uIG9uIHRoaXMgb25l
PyBUaGFua3MhDQo+PiANCj4+IEkgYW0gc3BsaXQuIE9uIG9uZSBoYW5kLCBJIGFncmVlIHRoZXkg
bG93IHJpc2sgYW5kIHdvdWxkIGJlIGdvb2QgdG8gaGF2ZQ0KPj4gdGhlbS4gQnV0IG9uIHRoZSBv
dGhlciBoYW5kLCB0aGV5IHRlbmQgdG8gYmUgaW52YXNpdmUgYW5kIG1heSBpbnRlcmZlcmUNCj4+
IHdpdGggYW55IGJ1ZyB3ZSBuZWVkIHRvIGZpeCBkdXJpbmcgdGhlIGhhcmRlbmluZyBwZXJpb2Qu
DQo+IA0KPiAqVGhlb3JldGljYWxseSogTUlTUkEgcGF0Y2hlcyBzaG91bGQgaGF2ZSBubyBiZWhh
dmlvcmFsIHNpZGUgZWZmZWN0czsNCj4gYnV0IGl0J3MgcXVpdGUgcG9zc2libGUgdGhhdCB0aGV5
IHdpbGwuIEknZCBiZSBpbiBmYXZvciBvZiBhIG1vcmUNCj4gc3RyaWN0IHZpZXcsIHRoYXQgdGhl
eSBzaG91bGQgYWxsIGdvIG9uIGEgc2VwYXJhdGUgYnJhbmNoIChvciBzaW1wbHkNCj4gYmUgcmV2
aWV3ZWQgaW4tcHJpbmNpcGxlIGFuZCByZS1zdWJtaXR0ZWQgYWZ0ZXIgd2UgYnJhbmNoKSBub3cg
dGhhdA0KPiB0aGUgZmVhdHVyZSBmcmVlemUgaXMgZG9uZS4NCg0KVGhhbmtzIGZvciBzaGFyaW5n
IHlvdXIgb3Bpbmlvbi4gSSBkZWZpbml0ZWx5IHVuZGVyc3RhbmQgeW91ciBjb25jZXJuLiBJIHRo
aW5rIGluDQpYZW4gU3VtbWl0IHdlIGFncmVlZCB0aGF0IHRoZSByZWxlYXNlIHByb2Nlc3Mgc2hv
dWxkIG5vdCBhZmZlY3QgdGhlIG5vcm1hbA0KY29kZSByZXZpZXcsIHNvIE1JU1JBIHBhdGNoZXMg
Y2FuIHN0aWxsIGJlIHBvc3RlZCB0byB0aGUgbGlzdCBhbmQgYmUgcmV2aWV3ZWQuDQpXaGVuIHRo
ZSBzdGFnaW5nIHJlb3BlbnMsIHRoZXNlIHN0YWdlZCBNSVNSQSBwYXRjaGVzIGNhbiBiZSBjb21t
aXR0ZWQgcmlnaHQNCmF3YXkuDQoNCj4gVGhhdCdzIG15IHJlY29tbWVuZGF0aW9uLCBidXQgdWx0
aW1hdGVseSBJJ2QgbGVhdmUgdGhlIGRlY2lzaW9uIHRvIEhlbnJ5Lg0KDQpTaW5jZSB0aGlzIGlz
IGFib3V0IE1JU1JBLCBJIHdvdWxkIGxpa2UgdG8gd2FpdCBvbmUgbW9yZSBkYXkgdG8gc2VlIGlm
IHRoZXJlIGlzDQphbnkgaW5wdXQgZnJvbSBTdGVmYW5vLCBvdGhlcndpc2UgSSB0aGluayBKdWxp
ZW7igJlzIHN1Z2dlc3Rpb24gaXMgdmVyeSBnb29kIHNvDQp3ZSBjYW4ganVzdCBmb2xsb3cgdGhh
dCBwcm9wb3NlZCB0aW1lbGluZS4NCg0KS2luZCByZWdhcmRzLA0KSGVucnkgDQoNCj4gDQo+IC1H
ZW9yZ2UNCg0K

