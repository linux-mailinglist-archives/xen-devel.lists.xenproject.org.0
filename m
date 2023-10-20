Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEECC7D1598
	for <lists+xen-devel@lfdr.de>; Fri, 20 Oct 2023 20:20:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619929.965822 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtu6Q-0004VN-Na; Fri, 20 Oct 2023 18:20:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619929.965822; Fri, 20 Oct 2023 18:20:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtu6Q-0004TI-Kx; Fri, 20 Oct 2023 18:20:06 +0000
Received: by outflank-mailman (input) for mailman id 619929;
 Fri, 20 Oct 2023 18:20:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NyWa=GC=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1qtu6P-0004Jd-5w
 for xen-devel@lists.xenproject.org; Fri, 20 Oct 2023 18:20:05 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on062b.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 48313b6b-6f75-11ee-98d5-6d05b1d4d9a1;
 Fri, 20 Oct 2023 20:20:03 +0200 (CEST)
Received: from AM5PR0101CA0022.eurprd01.prod.exchangelabs.com
 (2603:10a6:206:16::35) by AS8PR08MB7768.eurprd08.prod.outlook.com
 (2603:10a6:20b:52d::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.25; Fri, 20 Oct
 2023 18:19:43 +0000
Received: from AMS0EPF000001B6.eurprd05.prod.outlook.com
 (2603:10a6:206:16:cafe::16) by AM5PR0101CA0022.outlook.office365.com
 (2603:10a6:206:16::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.26 via Frontend
 Transport; Fri, 20 Oct 2023 18:19:43 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF000001B6.mail.protection.outlook.com (10.167.16.170) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6907.20 via Frontend Transport; Fri, 20 Oct 2023 18:19:42 +0000
Received: ("Tessian outbound a024c74d4d6d:v215");
 Fri, 20 Oct 2023 18:19:41 +0000
Received: from 561802e7e476.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DA238116-B19A-486C-BA87-00C7E4749620.1; 
 Fri, 20 Oct 2023 18:11:52 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 561802e7e476.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 20 Oct 2023 18:11:52 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by DU0PR08MB9583.eurprd08.prod.outlook.com (2603:10a6:10:449::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36; Fri, 20 Oct
 2023 18:11:46 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::76e6:a7e1:1592:866]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::76e6:a7e1:1592:866%3]) with mapi id 15.20.6907.025; Fri, 20 Oct 2023
 18:11:46 +0000
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
X-Inumbo-ID: 48313b6b-6f75-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N31IcyO83zIU9fo5F7yr3/usHEKEMzkmdlk1OF1LdOc=;
 b=ADGVeBfOwCUzbZBv+AKKlJZK/pKOqV5skxw02AV7FmosgajN736JKcgsJaWVevRrQMJJjfiSs6jUDxoBUHtfnWct8k2Sec2Sxt2yEG0G2Yc58DE6+wqvLOA9SL+Hc4bcVlMfToAqRnQmipVmxwHQRxkw/FAeLpqzik6Ns9wb8vE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2c7ddc77a755f593
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MVqFXrwtFTH2jcF/OJPOLI7zL/YDYFgCqTGFLH56ptyaDUyYe1spNDipOUV0VloyAPyW7ekmXCn+82RHqf5yM3EOalne35g1j4w+83ipAcK1JFsnzQRpWxRefHrcueD8S52CAMAANWRQaE/C9QUHVF89ht3z0NpbR576/XKmgh7LOXwzrGzPt+Yt0z6vCzFFulUbHSnRjTNOqWFSiriQa01f+hQqMXxaRg9dM5iZDH0LSRtD6njCnsPWYmzL62CkANJSmZKuTRC5EXpP9QKtNPP6fAHIaTcKfFWtK0Ama1Z/EspiHWgR/YRwJmXA9lGg+jTfo1WrnR8CEomhlCRt5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N31IcyO83zIU9fo5F7yr3/usHEKEMzkmdlk1OF1LdOc=;
 b=Z1nnj6geTJ9ANc1upg6RW9fy6q0Hk3+HhgfM0I47+rpnZMVUoXT7D6DLfjQTniO0RAo8ep02pbvydU+Q9wHglyDP7vEkpjmTPgWNQe0x1fLSvTG4idzv03SPB4FeUxzd8kr9EFD1fSo0+BJOaXP5SWrhB6p+ttgIdcX1jMVTseWIe6/FieB0FKpUHiy0bM6k8axJo2UFyojSZMUFj1HcAQnxD4xX8PQxKtfaZ0n1gW99MbAkHOTTdJpE+LkOU7+ViQvXd4StVUevQASx6E7LlRqSgCwM3Yl11jaiR9+U0DJy1z8GZufgcnvl/es88f/9N4ROnopHEAKWeGinV8j+VA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N31IcyO83zIU9fo5F7yr3/usHEKEMzkmdlk1OF1LdOc=;
 b=ADGVeBfOwCUzbZBv+AKKlJZK/pKOqV5skxw02AV7FmosgajN736JKcgsJaWVevRrQMJJjfiSs6jUDxoBUHtfnWct8k2Sec2Sxt2yEG0G2Yc58DE6+wqvLOA9SL+Hc4bcVlMfToAqRnQmipVmxwHQRxkw/FAeLpqzik6Ns9wb8vE=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>, Jan Beulich
	<jbeulich@suse.com>, "michal.orzel@amd.com" <michal.orzel@amd.com>,
	"xenia.ragiadakou@amd.com" <xenia.ragiadakou@amd.com>,
	"ayan.kumar.halder@amd.com" <ayan.kumar.halder@amd.com>,
	"consulting@bugseng.com" <consulting@bugseng.com>,
	"andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
	"roger.pau@citrix.com" <roger.pau@citrix.com>, Simone Ballarin
	<simone.ballarin@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>, George
 Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Wei Liu
	<wl@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH][for-next][for-4.19 v2 1/8] xen/include: add macro
 LOWEST_BIT
Thread-Topic: [XEN PATCH][for-next][for-4.19 v2 1/8] xen/include: add macro
 LOWEST_BIT
Thread-Index: AQHaAsacg3neJ95wsUGZXLbST/LDOrBSqNIAgABSL4CAAAEqgA==
Date: Fri, 20 Oct 2023 18:11:46 +0000
Message-ID: <51E4585C-FD3D-4DF3-861F-A530138642AA@arm.com>
References: <cover.1697123806.git.nicola.vetrini@bugseng.com>
 <bb0ba44f8a3944c22a1c7cf19196c7060e8adb4b.1697123806.git.nicola.vetrini@bugseng.com>
 <93408661-721b-c4b3-d504-e65142bbdaea@suse.com>
 <42ee4de54f6d9bd80fb50db3545cbaf4@bugseng.com>
 <08286993-6a83-b928-6398-e129397927a0@suse.com>
 <9002a10f872fccc5217faab2f20ad5ba@bugseng.com>
 <alpine.DEB.2.22.394.2310191253440.2099202@ubuntu-linux-20-04-desktop>
 <93F0B739-367C-4DFA-9F53-0C2C58FCD756@arm.com>
 <alpine.DEB.2.22.394.2310201107140.2356865@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2310201107140.2356865@ubuntu-linux-20-04-desktop>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.100.2.1.4)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|DU0PR08MB9583:EE_|AMS0EPF000001B6:EE_|AS8PR08MB7768:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fa1265d-1f06-40e6-6c90-08dbd1992177
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 FR8N1ZR/DGwAPKzowuLR0UzE+Z/Z0Jkc1GOglSIH3zTeWUloZlpnLjbU9wBkPGDuBxAcH9d2l+jQoKp6hQx9EL6IeYZCpKkSfNxHEjE9f/HgCYx5YnuBNlEXrsI7IR8CK7lY9OKc0lmcDQ7v78wKgm0xzDHSe7qVNMueN+pTK9C7LtnOoHalZo0YuoIE31iOdveKYesJDoGqfrpUq4lUgkB4zX/AD8lqDr1EJOKvSU4WTfRrlM6TvJZbA0P7uGBVke7l/zyCpaI+4bB+PS7aZfasIhVwybJ4Bcs4mDd76PlYvS1AI/T0jj6Sw8AkNWHnMA1y8V8HI1wBT4KgQyzWTqkT4OPbWA4LikwbMT6OWNrNN4g/weOL5iUyV8la8FkN92AAqQgMubIJJTrUG628x8LRf9lFww/h23eZ8Qwj9//Ued8ozLiHbmijeNFtGYJZ7fHkpRTufqdAbtCec5jsWxwv0jbBw75baBF0kiHSj7rxDk0b4htBrHTIDLZ/7QCzoAQBSBOM3IfeedYwgV4/KRn+cYwc9KjO8CPEhBj6prYWQZoxOve06+DUBM5O6Bou0S4oEBVA3W3h1Kbscm1qEeSAx6RJxi8l2Amo56c2wyc/mUyPNDqfeT7O8lCkBdjHI4w7asgDgBWtiDgtDi93KQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(366004)(346002)(376002)(396003)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(66946007)(26005)(2616005)(6506007)(8936002)(91956017)(41300700001)(53546011)(5660300002)(8676002)(4326008)(2906002)(7416002)(6486002)(478600001)(54906003)(6916009)(66556008)(66476007)(122000001)(76116006)(316002)(64756008)(38100700002)(66446008)(71200400001)(86362001)(36756003)(33656002)(38070700009)(6512007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <97FBD7F2B8BE1B45A5FEAFBDB22AE171@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9583
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001B6.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	994a74c4-86aa-4d83-79b1-08dbd19805e1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	x05c68FIV5VgUsgT8wVl6fxq/fg8tCe3KiWGI4JnhpgR5IGB7qKEbBkm3bCx86JrzUogROvu7JiIzLssh8AiiMYSLGdgH2V/q130c8g+2bzwZSyTFeLRbJZ/g6TB2glBTyb3VO4PF9FU+IARbC9aIp+ZDBPU6ZXjv0HfO75X2oCq3PO+qcHqgJvBshIyfM0tByKQCa/soXjQ+TichGy4KrFwKRJvBf1C8cxOmERuVTvMGbNTenXV7ecp8OVGWS2i2o63efREDgU4MMdzwK1hfgk1D8CiL/DFUDa10EDbjwQauDUXXJRKykgGlXIHWQRluzPKM3t5o4tBgFb1HKw7nInR9bcQY00pLL6as9XD9ZXNhW1MZ9qdj+oL1vN2DxmAKkyjTQIhry7/c25y3MgEt+EjA19awaYusMGjQTOcEwdHTDCZ8ax+SckKWo4QhMqdfUItEvKLMULKu0jb/wo/wQuULFZO6zNV/uX2Ok7UTxBYWfeeJ8mSS4nz/SnKcfILIPDP/0Mmn791u345xDTr8gDk5aOWYm89gkL3SAy4/OYALuXtQ0uhxPRijfR0uVzWWVZ6U6DryBGAihEXefDBaNoli4fC32kplPs/fwS2aVddJmCoV+KgoMKjCCpVdRPwDrtdCa7NXQrQJ/EYl21BEE4mg0aPRKbLJ5EZw2ycaqjzlf2IO69H9iXM4652sL6lYieKPJlf1USXbsMtcKuC3Atm0YuRB2Tz1EUyd2XKWPllORDw+kV6PpaWy1ZjXrn/
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(346002)(376002)(136003)(396003)(230922051799003)(451199024)(82310400011)(186009)(1800799009)(64100799003)(40470700004)(36840700001)(46966006)(2906002)(40460700003)(40480700001)(70586007)(70206006)(8676002)(54906003)(316002)(8936002)(33656002)(478600001)(6486002)(4326008)(5660300002)(41300700001)(6862004)(86362001)(6506007)(36756003)(47076005)(36860700001)(356005)(336012)(2616005)(53546011)(6512007)(82740400003)(26005)(81166007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2023 18:19:42.3952
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fa1265d-1f06-40e6-6c90-08dbd1992177
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001B6.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7768

DQoNCj4gT24gMjAgT2N0IDIwMjMsIGF0IDE5OjA3LCBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFi
ZWxsaW5pQGtlcm5lbC5vcmc+IHdyb3RlOg0KPiANCj4gT24gRnJpLCAyMCBPY3QgMjAyMywgTHVj
YSBGYW5jZWxsdSB3cm90ZToNCj4+PiBPbiAxOSBPY3QgMjAyMywgYXQgMjA6NTgsIFN0ZWZhbm8g
U3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6DQo+Pj4gK0x1Y2ENCj4+
PiANCj4+Pj4+Pj4+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9tYWNyb3MuaA0KPj4+Pj4+Pj4gKysr
IGIveGVuL2luY2x1ZGUveGVuL21hY3Jvcy5oDQo+Pj4+Pj4+PiBAQCAtOCw4ICs4LDEwIEBADQo+
Pj4+Pj4+PiAjZGVmaW5lIERJVl9ST1VORChuLCBkKSAoKChuKSArIChkKSAvIDIpIC8gKGQpKQ0K
Pj4+Pj4+Pj4gI2RlZmluZSBESVZfUk9VTkRfVVAobiwgZCkgKCgobikgKyAoZCkgLSAxKSAvIChk
KSkNCj4+Pj4+Pj4+IA0KPj4+Pj4+Pj4gLSNkZWZpbmUgTUFTS19FWFRSKHYsIG0pICgoKHYpICYg
KG0pKSAvICgobSkgJiAtKG0pKSkNCj4+Pj4+Pj4+IC0jZGVmaW5lIE1BU0tfSU5TUih2LCBtKSAo
KCh2KSAqICgobSkgJiAtKG0pKSkgJiAobSkpDQo+Pj4+Pj4+IA0KPj4+Pj4+PiBhIFNBRi08bj4t
c2FmZSBjb21tZW50IGhlcmU/DQo+Pj4+Pj4+IA0KPj4+Pj4+IA0KPj4+Pj4+IE9uZSByZWFzb24g
aXMgdGhhdCBub3cgdGhhdCB2aW9sYXRpb25zIG9ubHkgYmVsb25naW5nIHRvIHRvb2wNCj4+Pj4+
PiBjb25maWd1cmF0aW9ucw0KPj4+Pj4+IGFuZCBzaW1pbGFyIGFyZSBkb2N1bWVudGVkIGluIGRv
Y3MvbWlzcmEvZGV2aWF0aW9ucy5yc3QgKGNvbW1pdHRlZCBpbg0KPj4+Pj4+IFN0ZWZhbm8ncw0K
Pj4+Pj4+IGJyYW5jaCBmb3ItNC4xOSBbMV0pLg0KPj4+Pj4gDQo+Pj4+PiBCdXQgdG9vbCBjb25m
aWd1cmF0aW9uIG1lYW5zIGV2ZXJ5IGFuYWx5c2lzIHRvb2wgbmVlZHMgY29uZmlndXJpbmcNCj4+
Pj4+IHNlcGFyYXRlbHkuIFRoYXQncyB3aHkgdGhlIGNvbW1lbnQgdGFnZ2luZyBzY2hlbWUgd2Fz
IGRlY2lkZWQgdG8gYmUNCj4+Pj4+IHByZWZlcnJlZCwgaWlyYy4NCj4+Pj4+IA0KPj4+Pj4+IEFs
c28sIHRoZXJlIHdlcmUgZGlzYWdyZWVtZW50cyBvbiB0aGUgU0FGIG5hbWluZw0KPj4+Pj4+IHNj
aGVtZSwgYW5kDQo+Pj4+Pj4gcGF0Y2hlcyBsaWtlIHRob3NlIHdvdWxkIG5vdCBiZSBhY2NlcHRl
ZCBhdCB0aGUgbW9tZW50Lg0KPj4+Pj4gDQo+Pj4+PiBXZWxsLCB0aGF0IG5lZWRzIHJlc29sdmlu
Zy4gVGhlIG5hbWluZyB0aGVyZSBzaG91bGRuJ3QgbGVhZCB0byBwYXRjaGVzDQo+Pj4+PiBiZWlu
ZyBhY2NlcHRlZCB0aGF0IGxhdGVyIG1heSBuZWVkIHJlZG9pbmcuDQo+Pj4+PiANCj4+Pj4+IEph
bg0KPj4+PiANCj4+Pj4gV2hpbGUgdGhpcyBpcyB0cnVlLCBpbiB0aGlzIGNhc2UgSSdtIG5vdCB3
aWxsaW5nIHRvIGRldmlhdGUgd2l0aCBhIFNBRiwgZ2l2ZW4NCj4+Pj4gdGhhdA0KPj4+PiBzb21l
IEVDTEFJUi1zcGVjaWZpYyBjb25maWd1cmF0aW9uIHdvdWxkIGJlIG5lZWRlZCBhbnl3YXlzLCBn
aXZlbiB0aGF0IEknbQ0KPj4+PiBkZXZpYXRpbmcgYSBtYWNybyBkZWZpbml0aW9uLCByYXRoZXIg
dGhhbiB0aGUgbGluZSB3aGVyZSBpdCdzIGFjdHVhbGx5IHVzZWQNCj4+Pj4gKGFuZCBtYXliZSBv
dGhlciB0b29scyB3b3VsZCBuZWVkDQo+Pj4+IHRoYXQgYXMgd2VsbCkuDQo+Pj4gDQo+Pj4gRGlk
IEkgZ2V0IGl0IHJpZ2h0IHRoYXQgdGhlIHByb2JsZW0gd2l0aCB1c2luZyBTQUYgaW4gdGhpcyBj
YXNlIGlzIHRoYXQNCj4+PiBpdCB3b3VsZG4ndCBiZSBzdWZmaWNpZW50IHRvIGFkZCBhIFNBRiBj
b21tZW50IG9uIHRvcCBvZiB0aGUgTUFDUk8NCj4+PiBkZWZpbml0aW9uLCBidXQgd2Ugd291bGQg
bmVlZCBhIFNBRiBjb21tZW50IG9uIHRvcCBvZiBldmVyeSBNQUNSTw0KPj4+IGludm9jYXRpb24/
DQo+Pj4gDQo+Pj4gSWYgc28sIHRoZW4gbm90IGp1c3QgZm9yIHRoaXMgTUFDUk8gYnV0IGluIGdl
bmVyYWwgYmFzaWNhbGx5IHdlIGhhdmUgdG8NCj4+PiB1c2UgZGV2aWF0aW9ucy5yc3QuDQo+Pj4g
DQo+Pj4gTHVjYSwgZG8geW91IGtub3cgd2hhdCB3b3VsZCBiZSB0aGUgYmVoYXZpb3IgZm9yIGNw
cGNoZWNrIGFuZC9vcg0KPj4+IENvdmVyaXR5PyBJIGltYWdpbmUgaXQgd2lsbCBiZSB0aGUgc2Ft
ZSBhbmQgdGhleSB3b3VsZCBhbHNvIG5lZWQgYQ0KPj4+IGRldmlhdGlvbiBhdCBldmVyeSBNQUNS
TyBpbnZvY2F0aW9uLCBub3QganVzdCB0aGUgZGVmaW5pdGlvbj8NCj4+IA0KPj4gU2VlbXMgdGhh
dCBjcHBjaGVjayByZXBvcnRzIGF0IHRoZSBtYWNybyBkZWZpbml0aW9uLCBpbnN0ZWFkIENvdmVy
aXR5IHJlcG9ydHMNCj4+IGF0IHRoZSBtYWNybyBpbnZvY2F0aW9uLg0KPiANCj4gRG9lcyB0aGF0
IG1lYW4gdGhhdCBhIC8qIFNBRi14eC1zYWZlICovIGNvbW1lbnQgd291bGQgd29yayBhdCB0aGUg
TUFDUk8NCj4gZGVmaW5pdGlvbiBmb3IgY3BwY2hlY2sgYnV0IG5vdCBmb3IgQ292ZXJpdHk/DQo+
IA0KPiBJZiBzbywgdGhlbiBJIHdvbmRlciBpZiBjcHBjaGVjaydzIGJlaGF2aW9yIGlzIHdoYXQg
d2Ugd291bGQgbGlrZSB0bw0KPiBoYXZlLCBidXQgZnJvbSBhIGNvZGUgY29tcGxpYW5jZSBwb2lu
dCBvZiB2aWV3IGl0IGlzIHRoZSBsZWFzdCByZWxpYWJsZSwNCj4gc28gdGhhdCdzIHRoZSByZWFz
b24gd2h5IGJvdGggQ292ZXJpdHkgYW5kIEVDTEFJUiBkb24ndCBpbXBsZW1lbnQgaXQuIEluDQo+
IHRlcm1zIG9mIGNvcnJlY3RuZXNzIG9mIHRoZSBpbXBsZW1lbnRhdGlvbiB3ZSBrbm93IGNwcGNo
ZWNrIGlzIGxhZ2dpbmcgYQ0KPiBiaXQgYmVoaW5kLi4uDQoNClllcywgSeKAmW0gc3RhcnRpbmcg
dG8gdGhpbmsgdGhhdCBpZiB3ZSB3YW50IHRvIGRldmlhdGUgYSBsYXJnZSBudW1iZXIgb2YgbWFj
cm8gdXNhZ2UsDQpXZSBzaG91bGQgY29tZSB1cCB3aXRoIHNvbWV0aGluZyBsaWtlIGRlY2xhcmlu
ZyB0aGUgbWFjcm8gc29tZXdoZXJlIGFuZCBhZGRpbmcNCnRoZSBpbi1jb2RlIGNvbW1lbnQgYXV0
b21hdGljYWxseSBieSB0aGUgc2NyaXB0IGJlZm9yZSB0aGUgYW5hbHlzaXMuLi4NCkJ1dCB3ZSBu
ZWVkIHRvIHNlZSBob3cgZmVhc2libGUgaXQgaXMuDQoNCg0K

