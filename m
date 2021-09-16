Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BB5B40E1B5
	for <lists+xen-devel@lfdr.de>; Thu, 16 Sep 2021 18:52:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.188657.337900 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQuby-00022h-8d; Thu, 16 Sep 2021 16:51:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 188657.337900; Thu, 16 Sep 2021 16:51:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQuby-0001zw-5T; Thu, 16 Sep 2021 16:51:46 +0000
Received: by outflank-mailman (input) for mailman id 188657;
 Thu, 16 Sep 2021 16:51:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Lm3Y=OG=arm.com=Rahul.Singh@srs-us1.protection.inumbo.net>)
 id 1mQubw-0001zq-Nk
 for xen-devel@lists.xenproject.org; Thu, 16 Sep 2021 16:51:44 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.47]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5e1e6330-170e-11ec-b620-12813bfff9fa;
 Thu, 16 Sep 2021 16:51:42 +0000 (UTC)
Received: from AS9PR06CA0117.eurprd06.prod.outlook.com (2603:10a6:20b:465::32)
 by VI1PR0801MB1904.eurprd08.prod.outlook.com (2603:10a6:800:81::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Thu, 16 Sep
 2021 16:51:36 +0000
Received: from VE1EUR03FT015.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:465:cafe::2f) by AS9PR06CA0117.outlook.office365.com
 (2603:10a6:20b:465::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend
 Transport; Thu, 16 Sep 2021 16:51:36 +0000
Received: from 64aa7808-outbound-2.mta.getcheckrecipient.com (63.33.187.114)
 by VE1EUR03FT015.mail.protection.outlook.com (10.152.18.176) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Thu, 16 Sep 2021 16:51:36 +0000
Received: ("Tessian outbound 0e48c0de19a3:v103");
 Thu, 16 Sep 2021 16:51:34 +0000
Received: from 2e85e9f66db2.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 11DD48BF-9CE6-46E9-BE69-AF77150B1842.1; 
 Thu, 16 Sep 2021 16:51:27 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2e85e9f66db2.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 16 Sep 2021 16:51:27 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com (2603:10a6:20b:39e::10)
 by AM6PR08MB4439.eurprd08.prod.outlook.com (2603:10a6:20b:be::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16; Thu, 16 Sep
 2021 16:51:17 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::c8de:afad:1d5a:efd0]) by AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::c8de:afad:1d5a:efd0%6]) with mapi id 15.20.4523.016; Thu, 16 Sep 2021
 16:51:16 +0000
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
X-Inumbo-ID: 5e1e6330-170e-11ec-b620-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KXAwJSeiZbEQxNNV56SDXxraOP0Fs0R+3mN2KqTATQ8=;
 b=u9rphU3zAIKPKf+RQn8RACg1BmLRsASc/JcYjcPW39fo17XicnfgbBEGhO+ik3O0PjYGAkHjYhhUSojAOmAkAu8zm/Na0YxFe+AZg+9AbykDXL63C6OF5F3f76aj535MC2srUpL+jgYCV4h1fWVtk0yp7sqqn6JwOXRlikT49iw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.33.187.114)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.33.187.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.33.187.114; helo=64aa7808-outbound-2.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2b125cd73e4fd786
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i8o9D0EdBec1BKSSpSsyPM0pLz8iMYQ5P26b8JvOcZG7NNvFCycCi+43hVLnJFT+KvXmSYBMBVU/RPezxACMfoVe9CJPZDalYjb2GCyi4cRhZiILOf+YILNAF57FNnK9Bn6nNYlefUT56Mzasp7VtrdeL6njTEYubkqsJvvUlo5G4zPWzD8vpq6ozDwmf98Je1X27SgLEHbk8lTq/ko8CybApoSKvAFRg8o0ZTAa1u/ORq5+JH8kR1M6wuzpI6pYdryLODegjfkBqS4BGTrUJ0auhaaXEE7R2PKwojPYYlR3TnhOEgiiDcyAUrobxHxkZ0nWeqVmd0y3JW9BsIVFpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=KXAwJSeiZbEQxNNV56SDXxraOP0Fs0R+3mN2KqTATQ8=;
 b=KCgdOMKR9kukzMu5IIgp7gKbqj9bzbG/4XSRBYSOMgzHdx+WuiaiBGR1XtnoVfIw0dMNEadhMol1XKVa1dp1WjLvv046sX4DSSI7fUDGJHeBNgYy7/SYXxsKVMYP81gLt8vyU3wYfhsHXRbeB5JasIpExuWI8VQ8OsOw5yaX6dAdTg+IDzAyRYGuxdpyz8oGg7x3eAeFZYEQdrI5uM1JbkcyJehZQU8SXtWMvmRCDOirRixGtwpETS8RTPrtlmm4pcKWSVNSket/w4+06TsYxfhjYWLYQhigZMpMIvph70EUz4ua0y9cHWN2m92vNql4KLd5jNc9BMLomDuQC2+Ofg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KXAwJSeiZbEQxNNV56SDXxraOP0Fs0R+3mN2KqTATQ8=;
 b=u9rphU3zAIKPKf+RQn8RACg1BmLRsASc/JcYjcPW39fo17XicnfgbBEGhO+ik3O0PjYGAkHjYhhUSojAOmAkAu8zm/Na0YxFe+AZg+9AbykDXL63C6OF5F3f76aj535MC2srUpL+jgYCV4h1fWVtk0yp7sqqn6JwOXRlikT49iw=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v1 06/14] xen/arm: Add support for PCI ecam operations
Thread-Topic: [PATCH v1 06/14] xen/arm: Add support for PCI ecam operations
Thread-Index:
 AQHXlPK6hMBa2cV9wU+RB+r01dTauquceRAAgAcQPwCAAMcsAIABJesAgABE9YCAAVDgAA==
Date: Thu, 16 Sep 2021 16:51:16 +0000
Message-ID: <FE13F3A1-C6EF-452F-BB5F-AD80B6FD97C6@arm.com>
References: <cover.1629366665.git.rahul.singh@arm.com>
 <1dc8286db35ced8281587135cfa582ea44b0185f.1629366665.git.rahul.singh@arm.com>
 <alpine.DEB.2.21.2109091607070.10523@sstabellini-ThinkPad-T480s>
 <B0EBC722-A74A-4742-9D93-904398FDDF1B@arm.com>
 <alpine.DEB.2.21.2109141543090.21985@sstabellini-ThinkPad-T480s>
 <8B84E0D6-70A7-4C8F-ACBE-D1773F6C8FAD@arm.com>
 <alpine.DEB.2.21.2109151340390.21985@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2109151340390.21985@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 45183dc7-1abd-42aa-d45c-08d979323f10
x-ms-traffictypediagnostic: AM6PR08MB4439:|VI1PR0801MB1904:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR0801MB1904A4FB8CAD55B466BFD25BFCDC9@VI1PR0801MB1904.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 4O+RzwGX7mN6YK/eD63wwV0s15V6si76G0Wffwr0i+U67MSGSsCe3t7B4EtXmJmjod4ZLUzHAuZKUAunPtrTQYhkJJLNoudxjYpso9TjNgmkLeLNoG6v5Mx5kFNr2w7wPljhnAEn71++RZuTPY7DzYNa7JTLDF/cwHBy/U6qAcWJgwQAJNeAJ8Mh2Ngwnxx11txPw4kTiujG25C8ehxwLHMarfAjzNouyzlR7iyEox8rlnAHN8r0O8btT/uyNawH2NOhYOkWrDcjpHpE4nZzEC96GsArpOR9caXWFpEzFNelseEznPLtWCkau9jbzi/ZXbmQlM2mCSeqilLlr/ovgYPHanThL8sO9xouS7aOvnZcL9Om5bnsAwpQ+wOpCO5G16cIPwM53g9FIeLS60zahPvDJRxtr2kxp0SFrAQLNcnkGNc4Rhc0aNIVwmF3tIGSxT8zORKvI59reGMhhKk5/TdfJPyJjk+VUu+tI5C2uTfB/1R8TOvx8C8DjwBk5M3nvOmcsDsVZl3PE6r9/6pQzHB+QbEuSDV+OtpDQcpUA4DASViY5cgUS43EmHELPq5RPb1xjSjyVyY64hkHgSJZMq6CMjxqkDdUGTougb4Hu0yAfACoTxBXHpGvdHs7XXywtmrSIKDHIx9Y9mwRiHM6qlSGJ6j+5xGZBeYFAF5idMmP1VhIn3ibTAjh0wmZql25dpcc0qBN39kSezpgqpFpf4GzZnZHSbKBXnU+77JmrVRLtjzS9aKKmYV4kTzMNwXgJMpAMgY0SV3NrcN7I1D6RC7x2j4WsflUTbSPLyO0QrPax/QEp9xXHmLFB84/x4VICdLBXAPLhGyPeUDiMKQVPQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB6919.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(366004)(136003)(396003)(39860400002)(122000001)(316002)(2906002)(8676002)(53546011)(86362001)(8936002)(6506007)(478600001)(38100700002)(4326008)(54906003)(36756003)(6486002)(71200400001)(66556008)(64756008)(66446008)(66946007)(66476007)(2616005)(5660300002)(966005)(91956017)(6512007)(33656002)(38070700005)(26005)(6916009)(186003)(83380400001)(76116006)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <E9278EB5E4CF304EB976CC7E5AA9B41C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4439
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	39daf147-c23e-4f7f-08b6-08d97932338e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	D4u7Xw7mb9RyNRLgsYWsR1JoKZcbCHWewmAWXPX2GV3WVbpwBGXKsfO6XY36p8HJmMxxfMrVqlbtFVFf2ynBOHVw5pB9Y/GZBUdonNis8SSFOkoRrhAtLm8OLIdO5CXgt7Lr1KyEETPmnLTW7qf274aPfu8+l6K3oobN+LbbwXuQ+605GdkGjG8hPVUxzdIPu7z7tMrQAnu0xVStDoSyy538a7j3sM0QPLTYsUezqHzhEqbxGifXZUs8/tuStRhTrpJQ/nb25++3zO5jbnKn5PTu/yLJ8/7ZVMWxPeJrlG1OunuW0xpYtFcLg7FWogDNi4awGtfx0NSw5KUR32/Z7MCU6zeXSID7KehlrpiGwO6v7Kl5t0D4+KNCVk9LBVaK4nclFHHa1ik8ydPcj/Fyd6b9VhogjGN1gT9mfbe54BNF2nKlD+kr0aVUr2Bj7ZK5GZQSfXozG2sTeABvYopLngDvbY10c/IEIu8d8jN6cEQ4NFbxB78Zf4bb5FBOXip+QjNeWp2fzPxnkfVatKP+Dw3VNvB3KxbBaUSoRiJOoNapUkDQvnZkaMhMhSjaHq5K/ZviY1Xx7RRs3PTr/vW5ipqwUgRf/PvWJIXkXibDNEbTNCLvGFuj3AjEi6xa+5F60YbJL39wz8o5XpWsAZp6WpjYroE/bpzM2aoLywhASPdD8OtBykCZ1Zx2ovGm+Bn99N7mR7wMgSTtZmmj5j4eQZQbSaceglTWNR/dBhPT70hpveFqLHsg+9yEHoFQFLa0hEauLgYgmZZ/80fNZyJ5sJ23p8HvxrR7mI2EVsXFaJM=
X-Forefront-Antispam-Report:
	CIP:63.33.187.114;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-2.mta.getcheckrecipient.com;PTR:ec2-63-33-187-114.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(396003)(346002)(39860400002)(376002)(36840700001)(46966006)(6506007)(82310400003)(478600001)(6486002)(6512007)(8676002)(47076005)(54906003)(356005)(316002)(36860700001)(107886003)(82740400003)(336012)(81166007)(6862004)(8936002)(36756003)(86362001)(2616005)(83380400001)(4326008)(70586007)(33656002)(26005)(5660300002)(186003)(70206006)(2906002)(53546011)(966005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2021 16:51:36.1929
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 45183dc7-1abd-42aa-d45c-08d979323f10
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.33.187.114];Helo=[64aa7808-outbound-2.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1904

SGkgU3RlZmFubywNCg0KPiBPbiAxNSBTZXAgMjAyMSwgYXQgOTo0NSBwbSwgU3RlZmFubyBTdGFi
ZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPiB3cm90ZToNCj4gDQo+IE9uIFdlZCwgMTUg
U2VwIDIwMjEsIFJhaHVsIFNpbmdoIHdyb3RlOg0KPj4+IE9uIDE1IFNlcCAyMDIxLCBhdCAxMjow
NiBhbSwgU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPiB3cm90ZToN
Cj4+PiBPbiBUdWUsIDE0IFNlcCAyMDIxLCBSYWh1bCBTaW5naCB3cm90ZToNCj4+Pj4+PiArICAg
ICAgICByZXR1cm4gTlVMTDsNCj4+Pj4+PiArDQo+Pj4+Pj4gKyAgICBidXNuIC09IGNmZy0+YnVz
bl9zdGFydDsNCj4+Pj4+PiArICAgIGJhc2UgPSBjZmctPndpbiArIChidXNuIDw8IGNmZy0+b3Bz
LT5idXNfc2hpZnQpOw0KPj4+Pj4+ICsNCj4+Pj4+PiArICAgIHJldHVybiBiYXNlICsgKFBDSV9E
RVZGTihzYmRmX3QuZGV2LCBzYmRmX3QuZm4pIDw8IGRldmZuX3NoaWZ0KSArIHdoZXJlOw0KPj4+
Pj4+ICt9DQo+Pj4+PiANCj4+Pj4+IEkgdW5kZXJzdGFuZCB0aGF0IHRoZSBhcm0zMiBwYXJ0IGlz
IG5vdCBpbXBsZW1lbnRlZCBhbmQgbm90IHBhcnQgb2YgdGhpcw0KPj4+Pj4gc2VyaWVzLCB0aGF0
J3MgZmluZS4gSG93ZXZlciBpZiB0aGUgcGxhbiBpcyB0aGF0IGFybTMyIHdpbGwgZHluYW1pY2Fs
bHkNCj4+Pj4+IG1hcCBlYWNoIGJ1cyBpbmRpdmlkdWFsbHksIHRoZW4gSSBpbWFnaW5lIHRoaXMg
ZnVuY3Rpb24gd2lsbCBoYXZlIGFuDQo+Pj4+PiBpb3JlbWFwIGluIHRoZSBhcm0zMiB2ZXJzaW9u
LiBXaGljaCBtZWFucyB0aGF0IHdlIGFsc28gbmVlZCBhbg0KPj4+Pj4gdW5tYXBfYnVzIGNhbGwg
aW4gc3RydWN0IHBjaV9vcHMuIEkgdW5kZXJzdGFuZCB0aGF0IHBjaV9lY2FtX3VubWFwX2J1cw0K
Pj4+Pj4gd291bGQgYmUgYSBOT1AgdG9kYXkgZm9yIGFybTY0LCBidXQgSSB0aGluayBpdCBtYWtl
cyBzZW5zZSB0byBoYXZlIGl0IGlmDQo+Pj4+PiB3ZSB3YW50IHRoZSBBUEkgdG8gYmUgZ2VuZXJp
Yy4NCj4+Pj4gDQo+Pj4+IEFzIHBlciBteSB1bmRlcnN0YW5kaW5nIHdlIGRvbuKAmXQgbmVlZCBw
Y2lfZWNhbV91bm1hcF9idXMoLi4pIGFzIEkgZG9u4oCZdCBzZWUgYW55IHVzZSBjYXNlIHRvIHVu
bWFwIHRoZSANCj4+Pj4gYnVzIGR5bmFtaWNhbGx5LiBXZSBjYW4gYWRkIHRoZSBzdXBwb3J0IGZv
ciBwZXJfYnVzX21hcHBpbmcgZm9yIEFSTTMyIG9uY2Ugd2UgaW1wbGVtZW50IGFybTMyIHBhcnQu
DQo+Pj4+IExldCBtZSBrbm93IHlvdXIgdmlldyBvbiB0aGlzLg0KPj4+IA0KPj4+IEluIHRoZSBw
YXRjaCB0aXRsZWQgInhlbi9hcm06IFBDSSBob3N0IGJyaWRnZSBkaXNjb3Zlcnkgd2l0aGluIFhF
TiBvbg0KPj4+IEFSTSIgdGhlcmUgaXMgdGhlIGZvbGxvd2luZyBpbi1jb2RlIGNvbW1lbnQ6DQo+
Pj4gDQo+Pj4gKiBPbiA2NC1iaXQgc3lzdGVtcywgd2UgZG8gYSBzaW5nbGUgaW9yZW1hcCBmb3Ig
dGhlIHdob2xlIGNvbmZpZyBzcGFjZQ0KPj4+ICogc2luY2Ugd2UgaGF2ZSBlbm91Z2ggdmlydHVh
bCBhZGRyZXNzIHJhbmdlIGF2YWlsYWJsZS4gIE9uIDMyLWJpdCwgd2UNCj4+PiAqIGlvcmVtYXAg
dGhlIGNvbmZpZyBzcGFjZSBmb3IgZWFjaCBidXMgaW5kaXZpZHVhbGx5Lg0KPj4+ICoNCj4+PiAq
IEFzIG9mIG5vdyBvbmx5IDY0LWJpdCBpcyBzdXBwb3J0ZWQgMzItYml0IGlzIG5vdCBzdXBwb3J0
ZWQuDQo+Pj4gDQo+Pj4gDQo+Pj4gU28gSSB0YWtlIGl0IHRoYXQgb24gYXJtMzIgd2UgZG9uJ3Qg
aGF2ZSBlbm91Z2ggdmlydHVhbCBhZGRyZXNzIHJhbmdlDQo+Pj4gYXZhaWxhYmxlLCB0aGVyZWZv
cmUgd2UgY2Fubm90IGlvcmVtYXAgdGhlIHdob2xlIHJhbmdlLiBJbnN0ZWFkLCB3ZSdsbA0KPj4+
IGhhdmUgdG8gaW9yZW1hcCB0aGUgY29uZmlnIHNwYWNlIG9mIGVhY2ggYnVzIGluZGl2aWR1YWxs
eS4NCj4+IA0KPj4gWWVzIHlvdSBhcmUgcmlnaHQgbXkgdW5kZXJzdGFuZCBpcyBhbHNvIHNhbWUu
DQo+Pj4gDQo+Pj4gSSBhc3N1bWVkIHRoYXQgdGhlIGlkZWEgd2FzIHRvIGNhbGwgaW9yZW1hcCBh
bmQgaW91bm1hcCBkeW5hbWljYWxseSwNCj4+PiBvdGhlcndpc2UgdGhlIHRvdGFsIGFtb3VudCBv
ZiB2aXJ0dWFsIGFkZHJlc3MgcmFuZ2UgcmVxdWlyZWQgd291bGQgc3RpbGwNCj4+PiBiZSB0aGUg
c2FtZS4NCj4+IA0KPj4gQXMgcGVyIG15IHVuZGVyc3RhbmRpbmcgZm9yIDMyLWJpdCB3ZSBuZWVk
IHBlcl9idXMgbWFwcGluZyBhcyB3ZSBkb27igJl0IGhhdmUgZW5vdWdoIHZpcnR1YWwgYWRkcmVz
cyBzcGFjZSBpbiBvbmUgY2h1bmsNCj4+IGJ1dCB3ZSBjYW4gaGF2ZSB2aXJ0dWFsIGFkZHJlc3Mg
c3BhY2UgaW4gZGlmZmVyZW50IGNodW5rLg0KPiANCj4gSW50ZXJlc3RpbmcuIEkgd291bGQgaGF2
ZSBhc3N1bWVkIHRoYXQgdGhlIHN1bSBvZiBhbGwgdGhlIGluZGl2aWR1YWwNCj4gc21hbGxlciBp
b3JlbWFwcyB3b3VsZCBzdGlsbCBiZSBlcXVhbCB0byBvbmUgYmlnIGlvcmVtYXAuIE1heWJlIGZv
cg0KPiBMaW51eCBpcyBkaWZmZXJlbnQsIGJ1dCBJIGRvbid0IHRoaW5rIHRoYXQgbWFueSBzbWFs
bGVyIGlvcmVtYXBzIHdvdWxkDQo+IGJ1eSB1cyB2ZXJ5IG11Y2ggaW4gWGVuIGJlY2F1c2UgaXQg
aXMgdGhlIHRvdGFsIGlvcmVtYXAgdmlydHVhbCBzcGFjZQ0KPiB0aGF0IGlzIHRvbyBzbWFsbC4g
T3IgYW0gSSBtaXNzaW5nIHNvbWV0aGluZz8NCj4gDQo+IA0KPj4gSSBhbSBub3Qgc3VyZSBpZiB3
ZSBuZWVkIHRvIG1hcC91bm1hcCB0aGUgdmlydHVhbCBhZGRyZXNzIHNwYWNlIGZvciBlYWNoIHJl
YWQvd3JpdGUgY2FsbC4gDQo+PiBJIGp1c3QgY2hlY2tlZCB0aGUgTGludXggY29kZVsxXSAgYW5k
IHRoZXJlIGFsc28gbWFwcGluZyBpcyBkb25lIG9uY2Ugbm90IGZvciBlYWNoIHJlYWQvd3JpdGUg
Y2FsbC4NCj4gDQo+IFNvIG15IGd1ZXNzIGlzIHRoYXQgZm9yIGFybTMyIHdlIHdvdWxkIGhhdmUg
dG8gcmVzb3J0IHRvIGR5bmFtaWMNCj4gbWFwL3VubWFwIGZvciBlYWNoIHJlYWQvd3JpdGUgY2Fs
bCwgdW5sZXNzIHRoZXJlIGlzIGEgdHJpY2sgd2l0aCB0aGUNCj4gaW5kaXZpZHVhbCBzbWFsbGVy
IGlvcmVtYXBzIHRoYXQgSSBoYXZlbid0IHNwb3R0ZWQgKGUuZy4gbWF5YmUgc29tZXRoaW5nDQo+
IGRvZXNuJ3QgZ2V0IG1hcHBlZCB0aGF0IHdheT8pDQo+IA0KPiBUaGF0IHNhaWQsIGdpdmVuIHRo
YXQgd2UgYXJlIHVuY2VydGFpbiBhYm91dCB0aGlzIGFuZCB0aGUgYXJtMzINCj4gaW1wbGVtZW50
YXRpb24gaXMgbm93aGVyZSBjbG9zZSwgSSB0aGluayB0aGF0IHdlIGFyZSBPSyB0byBjb250aW51
ZSBsaWtlDQo+IHRoaXMgZm9yIHRoaXMgc2VyaWVzLiBNYXliZSB5b3UgY291bGQgYWRkIGEgY291
cGxlIG9mIHNlbnRlbmNlcyB0byB0aGUNCj4gaW4tY29kZSBjb21tZW50IHNvIHRoYXQgaWYgc29t
ZWJvZHkgd2FudHMgdG8ganVtcCBpbiBhbmQgaW1wbGVtZW50DQo+IGFybTMyIHN1cHBvcnQgdGhl
eSB3b3VsZCBrbm93IHdoZXJlIHRvIHN0YXJ0Lg0KDQpJIGFtIG9rIHdpdGggYm90aCB3YXlzIGFk
ZGluZyBjb21tZW50IGluIGNvZGUgdG8gZXhwbGFpbiBvciBpbXBsZW1lbnQgdGhlIHBjaV9lY2Ft
X2FkZF9idXMoLi4pIGFuZCBwY2lfZWNhbV9yZW1vdmVfYnVzKCkgbGlrZSBMaW51eCBbMV0gYW5k
IA0Kd2UgY2FuIGNhbGwgdGhvc2UgZnVuY3Rpb24gaW4gcGNpX3JlYWQoKS9wY2lfd3JpdGUuDQoN
Cmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRz
L2xpbnV4LmdpdC90cmVlL2RyaXZlcnMvcGNpL2VjYW0uYyNuMTI2DQoNCg0KUmVnYXJkcywNClJh
aHVsDQoNCg==

