Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8A364706B
	for <lists+xen-devel@lfdr.de>; Thu,  8 Dec 2022 14:05:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.457110.714952 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3GZz-0005TJ-CS; Thu, 08 Dec 2022 13:04:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 457110.714952; Thu, 08 Dec 2022 13:04:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3GZz-0005Q6-9h; Thu, 08 Dec 2022 13:04:47 +0000
Received: by outflank-mailman (input) for mailman id 457110;
 Thu, 08 Dec 2022 13:04:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LvCk=4G=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1p3GZx-0005Pz-4b
 for xen-devel@lists.xenproject.org; Thu, 08 Dec 2022 13:04:45 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2071.outbound.protection.outlook.com [40.107.7.71])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dc1845d9-76f8-11ed-8fd2-01056ac49cbb;
 Thu, 08 Dec 2022 14:04:33 +0100 (CET)
Received: from AS9P251CA0023.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:50f::19)
 by AM8PR08MB6532.eurprd08.prod.outlook.com (2603:10a6:20b:316::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Thu, 8 Dec
 2022 13:04:15 +0000
Received: from VI1EUR03FT034.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:50f:cafe::2c) by AS9P251CA0023.outlook.office365.com
 (2603:10a6:20b:50f::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8 via Frontend
 Transport; Thu, 8 Dec 2022 13:04:14 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT034.mail.protection.outlook.com (100.127.144.165) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5901.14 via Frontend Transport; Thu, 8 Dec 2022 13:04:14 +0000
Received: ("Tessian outbound 0800d254cb3b:v130");
 Thu, 08 Dec 2022 13:04:14 +0000
Received: from 235a17340a59.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 00294B10-6E7D-4DB6-BE9B-30928EEC5D4A.1; 
 Thu, 08 Dec 2022 13:04:07 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 235a17340a59.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 08 Dec 2022 13:04:07 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com (2603:10a6:20b:404::24)
 by GV2PR08MB8169.eurprd08.prod.outlook.com (2603:10a6:150:78::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Thu, 8 Dec
 2022 13:04:02 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::b45:fa8a:caad:25c0]) by AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::b45:fa8a:caad:25c0%4]) with mapi id 15.20.5880.014; Thu, 8 Dec 2022
 13:04:02 +0000
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
X-Inumbo-ID: dc1845d9-76f8-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8GvbttyS3pbC5Lw1ZTCP3RpWdU6wZIaPUwK9bocah2k=;
 b=78wkcRAXhEcWYQ7Kaq8rX5MqZYl4ZhSgc7ZQrcznPhKq2nvifH74NjlEbHxSC6uzI+WgLd4BY7ZK8fInuoLdC3OCRSn4uhig95319DZDYqEpmaK9lLe4rTlkdoDv96TvgGLPTNT5+/53OqqscG1CjTRRjQkZKf5NSlh701yfEcc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: bd3efb3fbb81cbcc
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OuSvLLrMNpH0+dEdBwn/bsAOZXjiZ6sNfxAFck/V/xSQ05YBLV47A3YDEYIMjMMkL2Q2C5Yugx+MkOdHRIv3fyiCNXCp6gYxnHgffaTBmNTSEh58NBO4FtOBC+JcTFulsfilFmmhIx4pgZ+HZ6ucakLNXSO+/oYQK/jlL93vUkBdAXGHIMqkLvGjQfuxgThYmDUlUSKMfMLRLfjMAPz/o2h5gadRTHc+9lpen+yiXs+43le1AOcYbllyEQpXcym2CYGb8iYrfRfA4Ni+BtP2o43HFNZD2Iz3p6ezJniS8peqTm6kBWYYzJ2YVc2VqvMnE97MTYxRHadhz2tzKyxxNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8GvbttyS3pbC5Lw1ZTCP3RpWdU6wZIaPUwK9bocah2k=;
 b=lZAGvGf6WobK5Tck3URLsvoomA6oDgTZzIX0TS8ErgakLgBH2+CZB1thDvIZAO39QRTQsK9UkjTRXg21aX2nRWzVuqM/BYrCmXTFyrGOseZJmlfkvPkbAXH0Fu3WKWZViWeuMBXRfEHUN+aKRg1F7V9RzXD7+YdETqesyp5AU7IEzXHtFn6tu+z1V0iJCSoQ2MpqBBdkhT02LC/XDQkTqWHbOg51x7fXk0+SbEqcgSOJgBxyJ42lb3CT40fKUk9h8S67XQ4Ovx9lEIthwSfew/5Pp5Qs5c1pjlIaxoTDF3mywfdeCEa7bVz6URv9jdwzXB6aE6+xxZrqEqxRGLE03A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8GvbttyS3pbC5Lw1ZTCP3RpWdU6wZIaPUwK9bocah2k=;
 b=78wkcRAXhEcWYQ7Kaq8rX5MqZYl4ZhSgc7ZQrcznPhKq2nvifH74NjlEbHxSC6uzI+WgLd4BY7ZK8fInuoLdC3OCRSn4uhig95319DZDYqEpmaK9lLe4rTlkdoDv96TvgGLPTNT5+/53OqqscG1CjTRRjQkZKf5NSlh701yfEcc=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Julien Grall <julien@xen.org>
CC: sisyphean <sisyphean@zlw.email>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [BUG]SMMU-V3 queue need no-cache memory
Thread-Topic: [BUG]SMMU-V3 queue need no-cache memory
Thread-Index: AQHZCfprdLwUdaBZYka2kYynmoAiD65iOCsAgAAelICAAaBWAA==
Date: Thu, 8 Dec 2022 13:04:02 +0000
Message-ID: <A1DD6AE5-7AB0-4843-BB9F-3CA1F8277ADF@arm.com>
References: <e1e0e347-6530-7b68-92f7-ef52defa55ac@zlw.email>
 <75D89B2C-BBE4-419A-80B7-FEE39445ABB2@arm.com>
 <fe0f90fa-84aa-54b2-1e12-98baff7fcaf7@xen.org>
In-Reply-To: <fe0f90fa-84aa-54b2-1e12-98baff7fcaf7@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7158:EE_|GV2PR08MB8169:EE_|VI1EUR03FT034:EE_|AM8PR08MB6532:EE_
X-MS-Office365-Filtering-Correlation-Id: dd4fc915-3101-4f6a-ada3-08dad91cb513
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 fKc+yA/Tbe9F+kmikVhwOjZXw0QSrLDoe57q+hz+8fXMLNRCEQEQbe5e+BTsmSw+HGoEqHmYh8GyRC675VdZvdKZNzdo/k18hzYaVMldJt4tXqTVQZfRxRCliVmskkNSf3hz3QFqSFXHuTYLlJuokUZqBHlKEm6zCEISUa02RH6p2ayOE/m4REu/OrQpR8bBplRzoql0473hDxK5p3eZrQldoLxHYW7YkPszxLRRLu09B0nLZxic/TbNF5vUzWAH4bpyKb6csaGYT9qudsgJvTqyF+2rVLg7cDMLYq+gxK5fmDubjoWs1nldwyxAm4+zplFvso4+tYupQTse+qRjoPnCEOAzZ1LrczwFSq/qFRtzkTxFS55/xLhm2jn4DwrQylIf9ne8AXuGeECZzJcGZvlsqSR7VoVFyjr3UBlXamL8bcEk+nRlyOYowaArl5BivystiONiyAch1zhmDr6yUW0/GX1rToh7hTnFH+Fx3F5Q/p1OIGVb82bA/cFoBUj+4QhRNRriuxpA3uqYOEwmghA7ac+fbwEUSe3wxxiA/scD0mQtiU7kFXGVwS7jddrNgXty4s7B6E+S1gvEqcfdAYaYl82aEyu0XlSmtFZGMPmZN74OzqcKdwq3IwEeh7He5yRtgZc4va7CTZU6BNnnTSHI3IHW5Ag+M/QidFBj/PC5CBPMD6cwXcQXNuPiHu7ZULCyTc1QY2bLPLOYpV5l8MqaVqRUy1c82RWS6L/AiXY=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7158.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(39860400002)(346002)(396003)(366004)(451199015)(36756003)(33656002)(38070700005)(38100700002)(122000001)(5660300002)(8936002)(86362001)(53546011)(71200400001)(6486002)(54906003)(6916009)(76116006)(83380400001)(6506007)(478600001)(6512007)(66946007)(8676002)(91956017)(66476007)(41300700001)(66446008)(66556008)(4326008)(64756008)(2616005)(316002)(26005)(186003)(2906002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <F95A7EF29F595948A2698063A37725EF@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8169
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VI1EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6d3b79f2-0a52-42db-3043-08dad91cae05
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BbX4lUWJ3C2W9OIIjaDHPRUizfQGxw8y32YzGiUNVnosxK2bgKsr2kGv53YGyvtx8Comc3Eyyyvt9Ur3cqKgZa9GPMpYRIsSlwRZWNYLyGrv6VpZvqyStOK6TViu54Ah6elniabIR6WC97SGxGYvlgWTTpQmLNX8UJc3l/cezXbHx48RUSWccY4RJxeAWUsDLiVvgNxTUudgMqmnQniXgL0bFt5Vlc07/jA1D5Lsyt09IfarTdxPnNfj03ufchr2yFiZaiy/3n/BnyxF9nhswd3LagQXMxajYs1WuAPjAzmr/3sdjGjKVICSB2pkH7Ni60gzT7Y0SsnM3v4tkwURypjA7q7ZCEVFUbRH9Tkv4w/wEnyPBSoSzT8PwenNtJuLuxT3HNxBKiMUlqU9hzHFSLMYLodzXm6rLTU/WPxj1HJDlx4hA/ZvDt9BA4jrom27ngGaXic5Vknwt/DUS7Eal0c9H1Dhg3VJyEoDdSJGHdMQClHmbqvXMCJ7GQJ2r5slJsJ+1kjc765LZFCQQX1V+Mh/TbQ6EhkEDBE5FhxyankxORdsuIpxW0xLh5hBNchsHGs2OA2oL1DXYwRrvTBnPL1OXKXPUeQTwP2JeIzIFQfQqxdNTMTO1IwxnOIpaa23aHINaD3M8FMDqLaELTz8Or6vmm9WAzDEjd82vSfkIMdp5AjfgHkixdwxJSncgXiO4jO8G2KTmywWmciM4MRsFw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(376002)(346002)(136003)(451199015)(36840700001)(46966006)(40470700004)(6512007)(81166007)(53546011)(356005)(6506007)(26005)(36756003)(2906002)(86362001)(6486002)(478600001)(33656002)(40460700003)(83380400001)(82310400005)(36860700001)(82740400003)(47076005)(107886003)(336012)(186003)(2616005)(8676002)(70206006)(8936002)(70586007)(4326008)(41300700001)(40480700001)(6862004)(5660300002)(54906003)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2022 13:04:14.5530
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dd4fc915-3101-4f6a-ada3-08dad91cb513
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VI1EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6532

SGkgSnVsaWVuLA0KDQo+IE9uIDcgRGVjIDIwMjIsIGF0IDEyOjEzIHBtLCBKdWxpZW4gR3JhbGwg
PGp1bGllbkB4ZW4ub3JnPiB3cm90ZToNCj4gDQo+IEhpLA0KPiANCj4gSSBvbmx5IG5vdGljZWQg
dGhpcyBlLW1haWwgYmVjYXVzZSBJIHdhcyBza2ltbWluZyB4ZW4tZGV2ZWwuIElmIHlvdSB3YW50
IHRvIGdldCBvdXIgYXR0ZW50aW9uLCB0aGVuIEkgd291bGQgc3VnZ2VzdCB0byBDQyBib3RoIG9m
IHVzIGJlY2F1c2UgSSAoYW5kIEkgZ3Vlc3MgU3RlZmFubykgaGF2ZSBmaWx0ZXIgcnVsZXMgc28g
dGhvc2UgZS1tYWlscyBsYW5kIGRpcmVjdGx5IGluIG15IGluYm94Lg0KPiANCj4gT24gMDcvMTIv
MjAyMiAxMDoyNCwgUmFodWwgU2luZ2ggd3JvdGU6DQo+Pj4gT24gNyBEZWMgMjAyMiwgYXQgMjow
NCBhbSwgc2lzeXBoZWFuIDxzaXN5cGhlYW5Aemx3LmVtYWlsPiB3cm90ZToNCj4+PiANCj4+PiBI
aSwNCj4+PiANCj4+PiAgICAgSSB0cnkgdG8gcnVuIFhFTiBvbiBteSBBUk0gYm9hcmQoU29ycnks
IGZvciBzb21lIGNvbW1lcmNpYWwgcmVhc29ucywgSSBjYW4ndCB0ZWxsIHlvdQ0KPj4+ICAgICBv
biB3aGljaCBwbGF0Zm9ybSBJIHJ1biBYRU4pICBhbmQgZW5hYmxlIFNNTVUtVjMsIGJ1dCBhbGwg
Y21kcyBpbiBjbWRxIGZhaWxlZCB3aGVuIFhFTiBzdGFydGVkLg0KPj4+IA0KPj4+ICAgICBBZnRl
ciB1c2luZyB0aGUgZGVidWdnZXIgdG8gdHJhY2sgZGVidWdnaW5nLCB0aGUgcmVhc29uIGZvciB0
aGlzIHByb2JsZW0gaXMgdGhhdA0KPj4+ICAgICB0aGUgcXVldWUgaW4gdGhlIHNtbXUtdjMgZHJp
dmVyIGlzIG5vdCBuby1jYWNoZSwgc28gYWZ0ZXIgdGhlIGZ1bmN0aW9uIGFybV9zbW11X2NtZHFf
YnVpbGRfY21kDQo+Pj4gICAgIGlzIGV4ZWN1dGVkLCB0aGUgY21kIGlzIHN0aWxsIGluIGNhY2hl
LlRoZXJlZm9yZSwgdGhlIFNNTVUtVjMgaGFyZHdhcmUgY2Fubm90IG9idGFpbiB0aGUgY29ycmVj
dCBjbWQNCj4+PiAgICAgZnJvbSB0aGUgbWVtb3J5IGZvciBleGVjdXRpb24uDQo+PiBZZXMgeW91
IGFyZSByaWdodCBhcyBvZiBub3cgd2UgYXJlIGFsbG9jYXRpbmcgdGhlIG1lbW9yeSBmb3IgY21k
cXVldWUgdmlhIF94emFsbG9jKCkgd2hpY2ggaXMgY2FjaGVkDQo+PiBtZW1vcnkgYmVjYXVzZSBv
ZiB0aGF0IHlvdSBhcmUgb2JzZXJ2aW5nIHRoZSBpc3N1ZS4gV2UgaGF2ZSB0ZXN0ZWQgdGhlIFhl
biBTTU1VdjMgZHJpdmVyIG9uIFNPQw0KPj4gd2hlcmUgU01NVXYzIEhXIGlzIGluIHRoZSBjb2hl
cmVuY3kgZG9tYWluLCBhbmQgYmVjYXVzZSBvZiB0aGF0IHdlIGhhdmUgbm90IGVuY291bnRlcmVk
IHRoaXMgaXNzdWUuDQo+PiBJIHRoaW5rIEluIHlvdXIgY2FzZSBTTU1VdjMgSFcgaXMgbm90IGlu
IHRoZSBjb2hlcmVuY3kgZG9tYWluLiBQbGVhc2UgY29uZmlybSBmcm9tIHlvdXIgc2lkZSBpZiB0
aGUNCj4+ICJkbWEtY29oZXJlbnTigJ0gcHJvcGVydHkgaXMgbm90IHNldCBpbiBEVC4NCj4+IEkg
dGhpbmsgdGhlcmUgaXMgbm8gZnVuY3Rpb24gYXZhaWxhYmxlIGFzIG9mIG5vdyB0byByZXF1ZXN0
IFhlbiB0byBhbGxvY2F0ZSBtZW1vcnkgdGhhdCBpcyBub3QgY2FjaGVkLg0KPiANCj4gWW91IGFy
ZSBjb3JyZWN0Lg0KPiANCj4+IEBKdWxpZW4gYW5kIEBTdGVmYW5vIGRvIHlvdSBoYXZlIGFueSBz
dWdnZXN0aW9uIG9uIGhvdyB3ZSBjYW4gcmVxdWVzdCBtZW1vcnkgZnJvbSBYZW4gdGhhdCBpcyBu
b3QNCj4+IGNhY2hlZCBzb21ldGhpbmcgbGlrZSBkbWFfYWxsb2NfY29oZXJlbnQoKSBpbiBMaW51
eC4NCj4gDQo+IEF0IHRoZSBtb21lbnQgYWxsIHRoZSBSQU0gaXMgbWFwcGVkIGNhY2hlYWJsZSBp
biBYZW4uIFNvIGl0IHdpbGwgcmVxdWlyZSBzb21lIHdvcmsgdG8gaGF2ZSBzb21lIG1lbW9yeSB1
bmNhY2hlYWJsZS4NCj4gDQo+IFRoZXJlIGFyZSB0d28gb3B0aW9uczoNCj4gMSkgQWxsb2NhdGUg
YSBwb29sIG9mIG1lbW9yeSBhdCBib290IHRpbWUgdGhhdCB3aWxsIGJlIG1hcHBlZCB3aXRoIGRp
ZmZlcmVudCBtZW1vcnkgYXR0cmlidXRlLiBUaGlzIG1lYW5zIHdlIHdvdWxkIG5lZWQgYSBzZXBh
cmF0ZSBwb29sIGFuZCB0aGUgdXNlciB3aWxsIGhhdmUgdG8gc2l6ZSBpdC4NCj4gMikgTW9kaWZ5
IGFmdGVyIHRoZSBhbGxvY2F0aW9uIHRoZSBjYWNoaW5nIGF0dHJpYnV0ZSBpbiB0aGUgbWVtb3J5
IGFuZCB0aGVuIHJldmVydCBiYWNrIGFmdGVyIGZyZWVpbmcuIFRoZSBjb25zIGlzIHdlIHdvdWxk
IGVuZCB1cCB0byBzaGF0dGVyIHN1cGVycGFnZS4gV2UgYWxzbyBjYW4ndCByZS1jcmVhdGUgc3Vw
ZXJwYWdlICh5ZXQpLCBidXQgdGhhdCBtaWdodCBiZSBmaW5lIGlmIHRoZSBtZW1vcnkgaXMgbmV2
ZXIgZnJlZWQuDQo+IA0KPiBPcHRpb24gdHdvIHdvdWxkIHByb2JhYmx5IHRoZSBiZXN0LiBCdXQg
YmVmb3JlIGdvaW5nIHRoYXQgcm91dGUgSSBoYXZlIG9uZSBxdWVzdGlvbi4uLg0KPiANCj4gPiBU
aGUgdGVtcG9yYXJ5IHNvbHV0aW9uIEkgdXNlIGlzIHRvIGV4ZWN1dGUgZnVuY3Rpb24gY2xlYW5f
ZGNhY2hlIGV2ZXJ5DQo+ID4gdGltZSBjbWQgaXMgY29waWVkIHRvIGNtZHEgaW4gZnVuY3Rpb24g
cXVldWVfd3JpdGUuIEJ1dCBpdCBpcyBvYnZpb3VzDQo+ID4gdGhhdCB0aGlzIHdpbGwgc2VyaW91
c2x5IGFmZmVjdCB0aGUgZWZmaWNpZW5jeS4NCj4gDQo+IEkgYWdyZWUgeW91IHdpbGwgc2VlIHNv
bWUgcGVyZm9ybWFuY2UgaW1wYWN0IGluIG1pY3JvLWJlbmNobWFyay4gQnV0IEkgYW0gbm90IHN1
cmUgYWJvdXQgbm9ybWFsIHVzZS1jYXNlcy4gSG93IG9mdGVuIGRvIHlvdSBleHBlY3QgdGhlIGNv
bW1hbmQgcXVldWUgdG8gYmUgdXNlZD8NCg0KVG8gYmUgcHJlY2lzZSBjb21tYW5kIHF1ZXVlIHdp
bGwgYmUgdXNlZCB3aGVuDQogLSBTZXQgdXAgdGhlIHN0YWdlLTIgdHJhbnNsYXRpb24gd2hlbiB3
ZSBhc3NpZ25lZCB0aGUgZGV2aWNlcyB0byBndWVzdHMuIFRoaXMgaGFwcGVucyB0eXBpY2FsbHkg
ZG9tMCBib290IGFuZCBkb21VIGNyZWF0aW9uLiANCiAtIFdoZW4gdGhlcmUgaXMgYSBjYWxsIHRv
IGlvbW11X2lvdGxiX2ZsdXNoKCkgdGhhdCB3aWxsIGNhbGwgSU9NTVUgc3BlY2lmaWMgaW90bGJf
Zmx1c2guIFNNTXV2MyBkcml2ZXIgd2lsbCBzZW5kIHRoZSBjb21tYW5kIHRvDQogICBTTU1VdjMg
SFcgdG8gaW52YWxpZGF0ZSB0aGUgZW50cmllcy4NCiAgDQpSZWdhcmRzLA0KUmFodWwNCj4gDQo+
IEFsc28sIEkgYW0gYSBiaXQgc3VycHJpc2VkIHlvdSBhcmUgc2VpbmcgaXNzdWUgd2l0aCB0aGUg
Y29tbWFuZCBxdWV1ZSBidXQgbm90IHdpdGggdGhlIHN0YWdlLTIgcGFnZS10YWJsZXMuIERvZXMg
eW91ciBTTU1VIHN1cHBvcnQgY29oZXJlbnQgd2FsayBidXQgY2Fubm90IHNub29wIGZvciB0aGUg
Y29tbWFuZCBxdWV1ZT8NCj4gDQo+IENoZWVycywNCj4gDQo+IC0tIA0KPiBKdWxpZW4gR3JhbGwN
Cj4gDQoNCg==

