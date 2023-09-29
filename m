Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE34E7B2E8E
	for <lists+xen-devel@lfdr.de>; Fri, 29 Sep 2023 10:56:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.610419.949798 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qm9I8-0006jJ-0M; Fri, 29 Sep 2023 08:56:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 610419.949798; Fri, 29 Sep 2023 08:56:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qm9I7-0006hd-Tq; Fri, 29 Sep 2023 08:56:07 +0000
Received: by outflank-mailman (input) for mailman id 610419;
 Fri, 29 Sep 2023 08:56:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xPTL=FN=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qm9I6-0006gQ-Bv
 for xen-devel@lists.xenproject.org; Fri, 29 Sep 2023 08:56:06 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20602.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::602])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0539fc33-5ea6-11ee-9b0d-b553b5be7939;
 Fri, 29 Sep 2023 10:56:04 +0200 (CEST)
Received: from AM5PR04CA0017.eurprd04.prod.outlook.com (2603:10a6:206:1::30)
 by GV1PR08MB7802.eurprd08.prod.outlook.com (2603:10a6:150:59::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Fri, 29 Sep
 2023 08:55:53 +0000
Received: from AM7EUR03FT040.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:1:cafe::41) by AM5PR04CA0017.outlook.office365.com
 (2603:10a6:206:1::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.26 via Frontend
 Transport; Fri, 29 Sep 2023 08:55:53 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT040.mail.protection.outlook.com (100.127.140.128) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.22 via Frontend Transport; Fri, 29 Sep 2023 08:55:52 +0000
Received: ("Tessian outbound fdf44c93bd44:v211");
 Fri, 29 Sep 2023 08:55:52 +0000
Received: from 286210650e3f.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 919D08E3-DA8B-4654-855E-5B45C12C371B.1; 
 Fri, 29 Sep 2023 08:55:45 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 286210650e3f.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 29 Sep 2023 08:55:45 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DU0PR08MB8638.eurprd08.prod.outlook.com (2603:10a6:10:402::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.26; Fri, 29 Sep
 2023 08:55:43 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::dfff:49d6:ed04:118b]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::dfff:49d6:ed04:118b%7]) with mapi id 15.20.6838.016; Fri, 29 Sep 2023
 08:55:43 +0000
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
X-Inumbo-ID: 0539fc33-5ea6-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pLgX0KY7zC1SRsSG1ebaSn3YYeLI8ocnEIZMZpMUAW0=;
 b=r/PIV/17OqzeT7d3XUwCuGiag6x43OInsan05SNxGKH5lbxulBhXjRZxLKnRFUCDFGzT0HW9UOjETFX1VzinXm7PuVI//HYLDv6TB4l9TmYubRjdTKqYPIpMvQNsQ94SRj4OoQEM2NVotRuitOjt0TKppMhXrH6yR0uYXzKOw+c=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 45981c5be2741f8e
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iVTrwX00PA+R8HLA9yoctuSxVgiC6K/GEAtpY7CqswdMrCq7JXsZiqVIUUAtalmg5lr/iFvx2keIOY9mk7rAHOcviGFxxbOv9Y+hPaye8flnHpWYOPn6KOtyjqGmTaxH/bYQDgYZOrs2qxDZLi4/6wdENZXEejlbnR34zTYe41I7GP0JsyPze6PLhmuShjy0xQkpBMLL7JpVFIvcbM7SyG3yHK56QeBvN94fJ+uEVwylYesS0UOJhIzBqyWQLU60gK6xV0ydR2bt8RTgd/a9OKuczY/HbqezP7ut86K4o8JEcCarqSY6Dlk3N7v1yGUeZxa/SJb94aQKpLiTzMLYYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pLgX0KY7zC1SRsSG1ebaSn3YYeLI8ocnEIZMZpMUAW0=;
 b=VnAd0NEHSv5Az+XUfrCLjsGxYBx+AaQhb3DvelYNSIn0uE36fA1EhnOF2KHtcGENtVFm5uqlluoS/5hw9McB4IEcJaPE9PYBY7xNYf/z3p8NyelShVTvinJH6YgQ68QTGTHY8AQl6M/NqjynYXApNNf9/r44+mKBRIEKlfLdqvmYf5OrO8t08X2J9vWPb7D7HDn2Updq0Cv9vEKA2BntVHgtaokgTeaDx/+Fnf5ucx+x31sRVUDmThAA1sBEGSrkEbnjVzFCTSVVEG5thKjNyRWWZ5qezTP0o1qA72kMuOLXrMyfoEWXQxO1IoclODsesJhYhejAKJnvgfEYAkp4kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pLgX0KY7zC1SRsSG1ebaSn3YYeLI8ocnEIZMZpMUAW0=;
 b=r/PIV/17OqzeT7d3XUwCuGiag6x43OInsan05SNxGKH5lbxulBhXjRZxLKnRFUCDFGzT0HW9UOjETFX1VzinXm7PuVI//HYLDv6TB4l9TmYubRjdTKqYPIpMvQNsQ94SRj4OoQEM2NVotRuitOjt0TKppMhXrH6yR0uYXzKOw+c=
From: Henry Wang <Henry.Wang@arm.com>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	"roger.pau@citrix.com" <roger.pau@citrix.com>, "julien@xen.org"
	<julien@xen.org>, "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
	"nicola.vetrini@bugseng.com" <nicola.vetrini@bugseng.com>, Stefano Stabellini
	<stefano.stabellini@amd.com>
Subject: Re: [PATCH v2] docs/misra: add rule 2.1 exceptions
Thread-Topic: [PATCH v2] docs/misra: add rule 2.1 exceptions
Thread-Index: AQHZ1hLNZ0a6rcghx0ulDP6jzcXqzbAwKyuAgAGOFwA=
Date: Fri, 29 Sep 2023 08:55:43 +0000
Message-ID: <A70C1BD5-29B3-40A7-BB82-313EC5569F21@arm.com>
References: <20230823223942.2981782-1-sstabellini@kernel.org>
 <57A3B9BE-BBB2-42D4-B576-C539CDA9A539@arm.com>
In-Reply-To: <57A3B9BE-BBB2-42D4-B576-C539CDA9A539@arm.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DU0PR08MB8638:EE_|AM7EUR03FT040:EE_|GV1PR08MB7802:EE_
X-MS-Office365-Filtering-Correlation-Id: 73ddf5dc-050b-4e74-ead5-08dbc0c9e2d3
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 MUMGGuaH21cv2+M9/YGAlTf1tCd4UvtA4+8TwnT9Silu+g6L6q6UmlmlCQhll/U83Xav1SBpwniWurn+PyDRRV1JY1yYFgs/6rgmXMnYpJ7k3mNne46Ez5OJI39OCEszS5bA6IRxm642q4zlVYzkKHq+WxTT0kPwzowZ9/1zoFtTHU1NkHaAxKIf4xc6zfBHPwX37MlI/XpRapga9Uz9BfFgCk6wHFOxKlpOJmB2a8jCTvftj4wegjs06gK9zfpBjJTKfaFpwsumKuh15MnP9HxS647uYXBn0/Uek1PhDmvFdDAYW1p6pzKgxjSY4GGxphByqjCzTJtQ8XJV538HS5UMqIm3CG5qyaJGIYPH7yiMjclcnHzLNonp5+54BE0/XbBzinROO74BmcqgaWlmbYoG9kLXqrtldSoz6f5HGVcKmLoqG2F+QZ06C9Az4DNQ24pvKuzAyascstUhkqivE5A8bc1vyYkbhycgEkRxPVT/pnFfB41g9ZSSXTdz56HJ+sT7rIXgIk/yhd4h+hqF8hcNvd104NWPDMg+vSFS5bnKjH1X+CzRMd4HCaeZnUwkS2/QE3hhJFmPCG7kLXVYrpeMusar31nNQfv3vy3kqtyY/OpvIyG3Wcw1bdYuWzTd5BE7v2u7fE3BttGIMwC7FYXMIHthnk54RmcoCqCtYZgDnzINqK0HNJ2YAffZG93v
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(366004)(396003)(346002)(376002)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(316002)(110136005)(91956017)(54906003)(64756008)(76116006)(86362001)(66446008)(66556008)(66946007)(66476007)(36756003)(478600001)(38100700002)(38070700005)(71200400001)(2906002)(41300700001)(5660300002)(4326008)(8676002)(8936002)(2616005)(26005)(83380400001)(33656002)(122000001)(6506007)(53546011)(6512007)(6486002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <95F654D7D2B20C408FB090594FC90501@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8638
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b7ad9e6e-0798-49ad-136e-08dbc0c9dd09
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	R8hbVUIHgAwU/UNqaaKne9+7q+JVp6ZvDVK7ORcGdUWYFWS9RvtJbGZOLK6eJ4MD/VY1F09VjqvQuJvzhW9AZz7jA858UmtrRAINtTVjOh3vw/o7L2+SR00ezW2Js6kN64rnS5JuXupP3PcsoL6QABljoHMt+81CTG7i1AHqE7sO6i83/1t3Bo+caE3DAf019WwoRfJtqddJkQJk8sVtBAJx19f9ER2F+0T+0Y4pIezwvYvTQHCUZB62+faKREXCiOuclnPbBhTJgse0BU5MCa3KuIXU41cbM6qG4HEJr4XxAsw/Br1BuynHxeFWd9w5psA1hprHyknfeF6Z2fGLhtDVNng0YT5yB17t9r9470mMhZI5+rAeEmQ4ySGgXk8X8mz/56X5fbMbaW+7OABV/vhTHj0hKrWarFJ+ARr6hdwy9GyeCFdXyUGk1hCjrtCvPhESYqbTfkL7AAEvPg35Q5BzNsyiouSbDpABXNPbajmULRZuNADlhesFFO687rEnd1TaTJKVfNuLYlKWKOlji1HovDnruW1nwn1EnvtuvFJJU6u87uXFpFZBNtMCM7GQN+/WuJARwci7oXvs7O2D95eedmcCeuuGNBxY5NK8TRA4zeTtoE3M4qoeeZIE7/7Y0Ana/Sbl1qxF2+4gJnXoZIwuuXbuzIcGZZwqq1IUklqG6r5XjGd7RqbxjbkAo1JN5ISOrkUDG8dsnSm/HDH72HBydhXZXiuP9E/7E1w/gunasjMg9yqKwJO1d1HtMvkXsviymNINLP0uTFVirYd0qA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(376002)(346002)(39860400002)(136003)(230922051799003)(82310400011)(64100799003)(451199024)(186009)(1800799009)(40470700004)(36840700001)(46966006)(36860700001)(316002)(47076005)(40460700003)(36756003)(40480700001)(83380400001)(70206006)(478600001)(54906003)(8676002)(2906002)(6486002)(110136005)(41300700001)(6512007)(8936002)(81166007)(4326008)(6506007)(356005)(70586007)(82740400003)(53546011)(33656002)(26005)(336012)(2616005)(86362001)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2023 08:55:52.8774
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 73ddf5dc-050b-4e74-ead5-08dbc0c9e2d3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7802

SGkgU3RlZmFubywNCg0KPiBPbiBTZXAgMjgsIDIwMjMsIGF0IDE3OjEwLCBCZXJ0cmFuZCBNYXJx
dWlzIDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+IHdyb3RlOg0KPiANCj4gSGkgU3RlZmFubywN
Cj4gDQo+PiBPbiAyNCBBdWcgMjAyMywgYXQgMDA6MzksIFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0
YWJlbGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6DQo+PiANCj4+IEZyb206IFN0ZWZhbm8gU3RhYmVs
bGluaSA8c3RlZmFuby5zdGFiZWxsaW5pQGFtZC5jb20+DQo+PiANCj4+IER1cmluZyB0aGUgZGlz
Y3Vzc2lvbnMgdGhhdCBsZWQgdG8gdGhlIGFjY2VwdGFuY2Ugb2YgUnVsZSAyLjEsIHdlDQo+PiBk
ZWNpZGVkIG9uIGEgZmV3IGV4Y2VwdGlvbnMgdGhhdCB3ZXJlIG5vdCBwcm9wZXJseSByZWNvcmRl
ZCBpbg0KPj4gcnVsZXMucnN0LiBBZGQgdGhlbSBub3cuDQo+PiANCj4+IFNpZ25lZC1vZmYtYnk6
IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3RlZmFuby5zdGFiZWxsaW5pQGFtZC5jb20+DQo+PiBBY2tl
ZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPj4gLS0tDQo+PiBOb3RlIHRo
YXQgc2FmZS5qc29uIGFuZCB0aGUgY29kZWJhc2UgYXJlIG5vdCB5ZXQgdXBkYXRlZCB3aXRoIGFu
DQo+PiBhcHByb3ByaWF0ZSB0YWcgZm9yIEJVRywgcGFuaWMgYW5kIGZyaWVuZHMuDQo+PiANCj4+
IHYyOg0KPj4gLSBmaXggdHlwbyBpbiBjb21taXQgbWVzc2FnZQ0KPj4gLSB1c2UgIm9ubHkgcmVm
ZXJlbmNlZCBmcm9tIGFzc2VtYmx5Ig0KPj4gLSB1c2UgIkRlbGliZXJhdGUgdW5yZWFjaGFiaWxp
dHkgY2F1c2VkIGJ5Ig0KPj4gLSBhZGQgIlNlZSBzYWZlLmpzb24iDQo+PiAtIGFkZCBhY2tlZC1i
eSAoYWx0aG91Z2ggSSBhbHNvIGFkZGVkICJTZWUgc2FmZS5qc29uIikNCj4+IC0tLQ0KPj4gZG9j
cy9taXNyYS9ydWxlcy5yc3QgfCAxMyArKysrKysrKysrKystDQo+PiAxIGZpbGUgY2hhbmdlZCwg
MTIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPj4gDQo+PiBkaWZmIC0tZ2l0IGEvZG9j
cy9taXNyYS9ydWxlcy5yc3QgYi9kb2NzL21pc3JhL3J1bGVzLnJzdA0KPj4gaW5kZXggOGYwZTRk
M2YyNS4uNGYzM2VkNGJhNiAxMDA2NDQNCj4+IC0tLSBhL2RvY3MvbWlzcmEvcnVsZXMucnN0DQo+
PiArKysgYi9kb2NzL21pc3JhL3J1bGVzLnJzdA0KPj4gQEAgLTEwNiw3ICsxMDYsMTggQEAgbWFp
bnRhaW5lcnMgaWYgeW91IHdhbnQgdG8gc3VnZ2VzdCBhIGNoYW5nZS4NCj4+ICAgKiAtIGBSdWxl
IDIuMSA8aHR0cHM6Ly9naXRsYWIuY29tL01JU1JBL01JU1JBLUMvTUlTUkEtQy0yMDEyL0V4YW1w
bGUtU3VpdGUvLS9ibG9iL21hc3Rlci9SXzAyXzAxXzEuYz5gXw0KPj4gICAgIC0gUmVxdWlyZWQN
Cj4+ICAgICAtIEEgcHJvamVjdCBzaGFsbCBub3QgY29udGFpbiB1bnJlYWNoYWJsZSBjb2RlDQo+
PiAtICAgICAtDQo+PiArICAgICAtIFRoZSBmb2xsb3dpbmcgYXJlIGFsbG93ZWQ6DQo+PiArICAg
ICAgICAgLSBJbnZhcmlhbnRseSBjb25zdGFudCBjb25kaXRpb25zLCBlLmcuIGlmKElTX0VOQUJM
RUQoQ09ORklHX0hWTSkpIHsgUzsgfQ0KPj4gKyAgICAgICAgIC0gU3dpdGNoIHdpdGggYSBjb250
cm9sbGluZyB2YWx1ZSBzdGF0aWNhbGx5IGRldGVybWluZWQgbm90IHRvDQo+PiArICAgICAgICAg
ICBtYXRjaCBvbmUgb3IgbW9yZSBjYXNlIHN0YXRlbWVudHMNCj4+ICsgICAgICAgICAtIEZ1bmN0
aW9ucyB0aGF0IGFyZSBpbnRlbmRlZCB0byBiZSByZWZlcmVuY2VkIG9ubHkgZnJvbQ0KPj4gKyAg
ICAgICAgICAgYXNzZW1ibHkgY29kZSAoZS5nLiAnZG9fdHJhcF9maXEnKQ0KPj4gKyAgICAgICAg
IC0gRGVsaWJlcmF0ZSB1bnJlYWNoYWJpbGl0eSBjYXVzZWQgYnkgY2VydGFpbiBtYWNyb3MvZnVu
Y3Rpb25zLA0KPj4gKyAgICAgICAgICAgZS5nLiBCVUcsIGFzc2VydF9mYWlsZWQsIHBhbmljLCBl
dGMuIFNlZSBzYWZlLmpzb24uDQo+IA0KPiBBcyBKdWxpZW4gcmVxdWVzdGVkLCB5b3Ugc2hvdWxk
IHJlbW92ZSB0aGlzLg0KPiANCj4gV2l0aCB0aGF0IGhhbmRsZWQ6DQo+IA0KPiBBY2tlZC1ieTog
QmVydHJhbmQgTWFycXVpcyA8YmVydHJhbmQubWFycXVpc0Bhcm0uY29tPg0KDQpXaXRoIEJlcnRy
YW5k4oCZcyBjb21tZW50cyBhZGRyZXNzZWQ6DQoNClJlbGVhc2UtYWNrZWQtYnk6IEhlbnJ5IFdh
bmcgPEhlbnJ5LldhbmdAYXJtLmNvbT4NCg0KS2luZCByZWdhcmRzLA0KSGVucnkNCg0KDQo+IA0K
PiBDaGVlcnMNCj4gQmVydHJhbmQNCj4gDQo+PiArICAgICAgICAgLSBhc20tb2Zmc2V0cy5jLCBh
cyB0aGV5IGFyZSBub3QgbGlua2VkIGRlbGliZXJhdGVseSwgYmVjYXVzZQ0KPj4gKyAgICAgICAg
ICAgdGhleSBhcmUgdXNlZCB0byBnZW5lcmF0ZSBkZWZpbml0aW9ucyBmb3IgYXNtIG1vZHVsZXMN
Cj4+ICsgICAgICAgICAtIERlY2xhcmF0aW9ucyB3aXRob3V0IGluaXRpYWxpemVyIGFyZSBzYWZl
LCBhcyB0aGV5IGFyZSBub3QNCj4+ICsgICAgICAgICAgIGV4ZWN1dGVkDQo+PiANCj4+ICAgKiAt
IGBSdWxlIDIuNiA8aHR0cHM6Ly9naXRsYWIuY29tL01JU1JBL01JU1JBLUMvTUlTUkEtQy0yMDEy
L0V4YW1wbGUtU3VpdGUvLS9ibG9iL21hc3Rlci9SXzAyXzA2LmM+YF8NCj4+ICAgICAtIEFkdmlz
b3J5DQo+PiAtLSANCj4+IDIuMjUuMQ0KPj4gDQo+IA0KPiANCg0K

