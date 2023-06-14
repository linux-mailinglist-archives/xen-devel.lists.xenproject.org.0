Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF5972F6A0
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jun 2023 09:45:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.548547.856520 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9LC4-0002rP-U2; Wed, 14 Jun 2023 07:45:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 548547.856520; Wed, 14 Jun 2023 07:45:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9LC4-0002pS-RN; Wed, 14 Jun 2023 07:45:28 +0000
Received: by outflank-mailman (input) for mailman id 548547;
 Wed, 14 Jun 2023 07:45:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nZKf=CC=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1q9LC2-0002pM-Fo
 for xen-devel@lists.xenproject.org; Wed, 14 Jun 2023 07:45:26 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2061b.outbound.protection.outlook.com
 [2a01:111:f400:fe13::61b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6c57469f-0a87-11ee-b232-6b7b168915f2;
 Wed, 14 Jun 2023 09:45:25 +0200 (CEST)
Received: from AM0PR01CA0147.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:aa::16) by AS8PR08MB5960.eurprd08.prod.outlook.com
 (2603:10a6:20b:29a::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.37; Wed, 14 Jun
 2023 07:45:22 +0000
Received: from AM7EUR03FT012.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:208:aa:cafe::ab) by AM0PR01CA0147.outlook.office365.com
 (2603:10a6:208:aa::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.37 via Frontend
 Transport; Wed, 14 Jun 2023 07:45:22 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT012.mail.protection.outlook.com (100.127.141.26) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6500.23 via Frontend Transport; Wed, 14 Jun 2023 07:45:21 +0000
Received: ("Tessian outbound 3570909035da:v136");
 Wed, 14 Jun 2023 07:45:21 +0000
Received: from 5a6e9d1adc59.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6092FE31-C34B-4099-B570-DF53F7356431.1; 
 Wed, 14 Jun 2023 07:45:10 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 5a6e9d1adc59.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 14 Jun 2023 07:45:10 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by PAWPR08MB10092.eurprd08.prod.outlook.com (2603:10a6:102:369::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.41; Wed, 14 Jun
 2023 07:45:08 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::ed0b:5730:a1f9:577b]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::ed0b:5730:a1f9:577b%5]) with mapi id 15.20.6477.037; Wed, 14 Jun 2023
 07:45:08 +0000
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
X-Inumbo-ID: 6c57469f-0a87-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hreecgmYIF5KZ6SDQpr5Au2G9nGKxUssVX243U+tcFM=;
 b=5TSy8W6lKqUxmiRWrI6vp/7wTlkepb+BHvR1P+4nNNAB9Rv8H/9AQadtfLfASbcqBKXWlq/nl04ESUPp75yBAHZGkwlT3qTKCsUgAtYo09TQetdxNp2I0z+XJ6PTGUL8hyvuLO3N2xb0Kw/KWyrLxwJ1fP05MpY9gWTZ2husvFM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 23a6304dc8f3f1eb
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kjWfjZ3/046x1ooxudyKtkUp3vEptN+8YarB/sVt7lNu+XfqGOawVn5v96wiza3sNtmHmZPeUT1oVyiGTBA1NtMmTdn6zhkrEg+lw2FIP9w4tzbZv3tqYCFJr2CjkIAdJS4UgtCLN1efx6cUxnQwaYNdFhlc7RVmk9NLMPignw7tOjPwzaj2M0AzXOVFgkpkGPHsskuzdVvYqb73Tot9XMj3LnmyQUG9vk6HMjtVrzskf9rEGiPsGOU5hvvu7DfcsQvyWwP3ui7OjfSHY3j6pIBY6fD6PHM5CKwrxmLD/SZNmFyzlMc2Ww7M0DWQNYqy7scec/6yWV1b1Knwaieg3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hreecgmYIF5KZ6SDQpr5Au2G9nGKxUssVX243U+tcFM=;
 b=YAHummkG68X4D10IspqoolBjiZHvraSSxmYnPBN3FHWWz/7tNhx0H6mEK6K45JazWD3V6nSDA9ABD2MgiTHuTHR84pGJ+UZ2odwApaEOpT2ytfpciKWuJ288sPe10giXaOmzCmFetbp+qZd41OppnfmtDcoZiUKsetZE9sm/y6YKUepe6EmViDEfL/NDfaw9ds2UZtSNb78OoMCFwDaxnwx3GTPxi0jQsdUX5BB9Ojs7qtJjNWTdcr26tY9sm+8IsMY3++KjrGGkbsOIillE108mH8ijrz8SnRA8OsRjEZfFozEHTEtCsvPiSBf4tQzHg0fA38ebxyOB54f3qocRfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hreecgmYIF5KZ6SDQpr5Au2G9nGKxUssVX243U+tcFM=;
 b=5TSy8W6lKqUxmiRWrI6vp/7wTlkepb+BHvR1P+4nNNAB9Rv8H/9AQadtfLfASbcqBKXWlq/nl04ESUPp75yBAHZGkwlT3qTKCsUgAtYo09TQetdxNp2I0z+XJ6PTGUL8hyvuLO3N2xb0Kw/KWyrLxwJ1fP05MpY9gWTZ2husvFM=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH] xen: Append a newline character to panic() where missing
Thread-Topic: [PATCH] xen: Append a newline character to panic() where missing
Thread-Index: AQHZnpI1vn3isrIJAkq87r2/T5dHaa+J6xaA
Date: Wed, 14 Jun 2023 07:45:08 +0000
Message-ID: <6D17A0C9-1B69-42F8-88E9-E2E026C57CA3@arm.com>
References: <20230614073018.21303-1-michal.orzel@amd.com>
In-Reply-To: <20230614073018.21303-1-michal.orzel@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|PAWPR08MB10092:EE_|AM7EUR03FT012:EE_|AS8PR08MB5960:EE_
X-MS-Office365-Filtering-Correlation-Id: e58e25eb-3773-42db-e175-08db6cab4e80
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 J4gyXGbj7KVh21t5NWqj/rWq1UptEMLrDB+kRCKNo2RXRuh7K7KTjLfHq2UBz21I5xti9eCpokOO0TSvcG2SYK/99dX9e3j7kZY0FheWWGLEKwvepV94i1etPUW97jSne0zHsAFmRd1MafmOSlDdDOl8ZAutelYojowaOpCTcENmYV3WjStPu98PuiwPNnqnaPplQMCL8g7IDJg0rbo/yDFcb3LltgrjnoqLacfMzQArX6LFYCWN2+ijqaNwCHHqkYJEf8AegU71k0t/ekBcgaLeNqKUHnXludz4BFg3Q3Amtmyc9+6mJIFuCC6mgCrR218De4u4VF7Z1Q16Ppmv9Y/3pN0YG/3H7knyCss4CsrMSd3sRzzZfAqdjVrrCOjfvnI/+bYgi6vNZsJY3NphxdEfgyDSydljfkmSShdX8DwISKgDG/UAtBDmmbfZrEwAaHSD6lbXOxxfaEMnS+ebMDnra4ahtgQX0lpuGN855JrArcALggZFgrgk7kHXvjVcI+FavJ0LLbWf2F9VwlAQ3dwKlO6slJogA40H1L5VxlpQwV5gTdWlGyRRBjxFhXfjWD40X/duKC5pKC/SfI5k56ChsN+mXcllQZtap2UNqDFWMzDCU2Fq7ySTYyrZCDOj64pHIK2PK6xDwKNN4dtBag==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(366004)(39860400002)(376002)(346002)(451199021)(36756003)(38070700005)(5660300002)(86362001)(2906002)(33656002)(2616005)(316002)(26005)(71200400001)(186003)(83380400001)(6486002)(122000001)(6506007)(6512007)(53546011)(91956017)(478600001)(54906003)(66946007)(4326008)(66556008)(66476007)(38100700002)(41300700001)(76116006)(6916009)(8676002)(66446008)(64756008)(8936002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <AE98A82205F64049920AC47C17ECC3BB@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB10092
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2b97ecdb-0eef-4351-6973-08db6cab46a0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+1rqdKuySLx0CXxkGgcnvJFNE1NRqAGA+dpKOrstn6f1q5KrhK2dKvn+Qm04tCYBKCc3uhCTNnvGqtdMQrCdySHa2WksgbJ5sM0c4/X3wvCZ/pb7rCmXGuwkpbqUCuc4SVn/Bt2XMQelM38B7vTnHN3cku2LY/5RGAU5BKRZbdkCrlNm4wPNnba8XoQvxb6idYPlNb7cl7CjjW+K//FoprjSxBbaa80b6QxN0TdJEngWIHReMkgW8xplaOErE3YgZMMxXyhE4a1FybRSnrE7Ivguu43LpnCYANS8dgRPEpeWLO/yLInTYyLGUUlgZYNT3a2Y3IljNJytgtwFBn/ATtL2SHDdJhmqp9GkMamn3d1UIkNJ8P3rnudLJkkBNDyFVasrlk7sXvIHXB70hRiOu7fhnoRxHW/axTRSElWViMG7T7ncNLDdzJnY6EnxgkeaK0FXRp67aBCKL2CUt5LM5y705LugL3ItuuVvM92nOsWyjdyk75OgUCUrvsKgy0VGfgi/BnkFKUC7TuLNeid1kBC3biISRD2VhSMWZp3CCd8WEPRn3IM41JhFMpJsdgNB7QZbqo1eGEAa+3Vmlt7mTF9WipQ2EhhhLz1wioVmllEtPkginRxoqtrU1Ep9Q9CVUEuoPBm0u/O+MjH88k3ybkWF9EKYMZR92I7TuXBRDUTC1UiRqMiaucozwDZ21oVYYUZsu9niUIbCOAeoAZ7Z232iASR7lhC1QVJU+POv+zCKmQj96U/j2hiwkfW8GPB7
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(136003)(39860400002)(396003)(451199021)(36840700001)(46966006)(40470700004)(478600001)(40480700001)(82310400005)(86362001)(6486002)(40460700003)(36860700001)(70206006)(70586007)(4326008)(316002)(336012)(47076005)(83380400001)(2906002)(6862004)(8676002)(8936002)(41300700001)(5660300002)(53546011)(356005)(54906003)(81166007)(26005)(6512007)(6506007)(33656002)(36756003)(2616005)(82740400003)(186003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2023 07:45:21.4865
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e58e25eb-3773-42db-e175-08db6cab4e80
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5960

DQoNCj4gT24gMTQgSnVuIDIwMjMsIGF0IDA4OjMwLCBNaWNoYWwgT3J6ZWwgPG1pY2hhbC5vcnpl
bEBhbWQuY29tPiB3cm90ZToNCj4gDQo+IE1pc3NpbmcgbmV3bGluZSBpcyBpbmNvbnNpc3RlbnQg
d2l0aCB0aGUgcmVzdCBvZiB0aGUgY2FsbGVycywgc2luY2UNCj4gcGFuaWMoKSBleHBlY3RzIGl0
Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogTWljaGFsIE9yemVsIDxtaWNoYWwub3J6ZWxAYW1kLmNv
bT4NCg0KUmV2aWV3ZWQtYnk6IEx1Y2EgRmFuY2VsbHUgPGx1Y2EuZmFuY2VsbHVAYXJtLmNvbT4N
Cg0KDQo+IC0tLQ0KPiB4ZW4vYXJjaC9hcm0vYm9vdGZkdC5jICAgICAgICAgICAgfCAyICstDQo+
IHhlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYyAgICAgICB8IDYgKysrLS0tDQo+IHhlbi9hcmNo
L3g4Ni9jcHUvbWljcm9jb2RlL2NvcmUuYyB8IDIgKy0NCj4gMyBmaWxlcyBjaGFuZ2VkLCA1IGlu
c2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gv
YXJtL2Jvb3RmZHQuYyBiL3hlbi9hcmNoL2FybS9ib290ZmR0LmMNCj4gaW5kZXggYjZmOTJhMTc0
ZjVmLi4yNjczYWQxN2ExZTEgMTAwNjQ0DQo+IC0tLSBhL3hlbi9hcmNoL2FybS9ib290ZmR0LmMN
Cj4gKysrIGIveGVuL2FyY2gvYXJtL2Jvb3RmZHQuYw0KPiBAQCAtMjI1LDcgKzIyNSw3IEBAIHN0
YXRpYyBpbnQgX19pbml0IHByb2Nlc3NfcmVzZXJ2ZWRfbWVtb3J5X25vZGUoY29uc3Qgdm9pZCAq
ZmR0LCBpbnQgbm9kZSwNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc2l6ZV9j
ZWxscywgZGF0YSk7DQo+IA0KPiAgICAgaWYgKCByYyA9PSAtRU5PU1BDICkNCj4gLSAgICAgICAg
cGFuaWMoIk1heCBudW1iZXIgb2Ygc3VwcG9ydGVkIHJlc2VydmVkLW1lbW9yeSByZWdpb25zIHJl
YWNoZWQuIik7DQo+ICsgICAgICAgIHBhbmljKCJNYXggbnVtYmVyIG9mIHN1cHBvcnRlZCByZXNl
cnZlZC1tZW1vcnkgcmVnaW9ucyByZWFjaGVkLlxuIik7DQo+ICAgICBlbHNlIGlmICggcmMgIT0g
LUVOT0VOVCApDQo+ICAgICAgICAgcmV0dXJuIHJjOw0KPiAgICAgcmV0dXJuIDA7DQo+IGRpZmYg
LS1naXQgYS94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMgYi94ZW4vYXJjaC9hcm0vZG9tYWlu
X2J1aWxkLmMNCj4gaW5kZXggNTc5YmM4MTk0ZmVkLi5kMGQ2YmU5MjJkYjEgMTAwNjQ0DQo+IC0t
LSBhL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYw0KPiArKysgYi94ZW4vYXJjaC9hcm0vZG9t
YWluX2J1aWxkLmMNCj4gQEAgLTc0LDcgKzc0LDcgQEAgaW50IF9faW5pdCBwYXJzZV9hcmNoX2Rv
bTBfcGFyYW0oY29uc3QgY2hhciAqcywgY29uc3QgY2hhciAqZSkNCj4gDQo+ICAgICAgICAgcmV0
dXJuIDA7DQo+ICNlbHNlDQo+IC0gICAgICAgIHBhbmljKCInc3ZlJyBwcm9wZXJ0eSBmb3VuZCwg
YnV0IENPTkZJR19BUk02NF9TVkUgbm90IHNlbGVjdGVkIik7DQo+ICsgICAgICAgIHBhbmljKCIn
c3ZlJyBwcm9wZXJ0eSBmb3VuZCwgYnV0IENPTkZJR19BUk02NF9TVkUgbm90IHNlbGVjdGVkXG4i
KTsNCg0KU29ycnkgYWJvdXQgdGhhdCEgSeKAmXZlIG1pc3NlZCBpdA0KDQo+ICNlbmRpZg0KPiAg
ICAgfQ0KPiANCj4gQEAgLTY5Nyw3ICs2OTcsNyBAQCBzdGF0aWMgdm9pZCBfX2luaXQgYWxsb2Nh
dGVfc3RhdGljX21lbW9yeShzdHJ1Y3QgZG9tYWluICpkLA0KPiAgICAgcmV0dXJuOw0KPiANCj4g
IGZhaWw6DQo+IC0gICAgcGFuaWMoIkZhaWxlZCB0byBhbGxvY2F0ZSByZXF1ZXN0ZWQgc3RhdGlj
IG1lbW9yeSBmb3IgZG9tYWluICVwZC4iLCBkKTsNCj4gKyAgICBwYW5pYygiRmFpbGVkIHRvIGFs
bG9jYXRlIHJlcXVlc3RlZCBzdGF0aWMgbWVtb3J5IGZvciBkb21haW4gJXBkLlxuIiwgZCk7DQo+
IH0NCj4gDQo+IC8qDQo+IEBAIC03NjksNyArNzY5LDcgQEAgc3RhdGljIHZvaWQgX19pbml0IGFz
c2lnbl9zdGF0aWNfbWVtb3J5XzExKHN0cnVjdCBkb21haW4gKmQsDQo+ICAgICByZXR1cm47DQo+
IA0KPiAgZmFpbDoNCj4gLSAgICBwYW5pYygiRmFpbGVkIHRvIGFzc2lnbiByZXF1ZXN0ZWQgc3Rh
dGljIG1lbW9yeSBmb3IgZGlyZWN0LW1hcCBkb21haW4gJXBkLiIsDQo+ICsgICAgcGFuaWMoIkZh
aWxlZCB0byBhc3NpZ24gcmVxdWVzdGVkIHN0YXRpYyBtZW1vcnkgZm9yIGRpcmVjdC1tYXAgZG9t
YWluICVwZC5cbiIsDQo+ICAgICAgICAgICBkKTsNCj4gfQ0KPiANCj4gZGlmZiAtLWdpdCBhL3hl
bi9hcmNoL3g4Ni9jcHUvbWljcm9jb2RlL2NvcmUuYyBiL3hlbi9hcmNoL3g4Ni9jcHUvbWljcm9j
b2RlL2NvcmUuYw0KPiBpbmRleCBlNjVhZjRiODJlYTMuLmMzZmVlNjI5MDYzZSAxMDA2NDQNCj4g
LS0tIGEveGVuL2FyY2gveDg2L2NwdS9taWNyb2NvZGUvY29yZS5jDQo+ICsrKyBiL3hlbi9hcmNo
L3g4Ni9jcHUvbWljcm9jb2RlL2NvcmUuYw0KPiBAQCAtNTI0LDcgKzUyNCw3IEBAIHN0YXRpYyBp
bnQgY29udHJvbF90aHJlYWRfZm4oY29uc3Qgc3RydWN0IG1pY3JvY29kZV9wYXRjaCAqcGF0Y2gp
DQo+ICAgICAgICAgICovDQo+ICAgICAgICAgaWYgKCB3YWl0X2Zvcl9jb25kaXRpb24od2FpdF9j
cHVfY2FsbG91dCwgKGRvbmUgKyAxKSwNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBNSUNST0NPREVfVVBEQVRFX1RJTUVPVVRfVVMpICkNCj4gLSAgICAgICAgICAgIHBhbmljKCJU
aW1lb3V0IHdoZW4gZmluaXNoZWQgdXBkYXRpbmcgbWljcm9jb2RlIChmaW5pc2hlZCAldS8ldSki
LA0KPiArICAgICAgICAgICAgcGFuaWMoIlRpbWVvdXQgd2hlbiBmaW5pc2hlZCB1cGRhdGluZyBt
aWNyb2NvZGUgKGZpbmlzaGVkICV1LyV1KVxuIiwNCj4gICAgICAgICAgICAgICAgICAgZG9uZSwg
bnJfY29yZXMpOw0KPiANCj4gICAgICAgICAvKiBQcmludCB3YXJuaW5nIG1lc3NhZ2Ugb25jZSBp
ZiBsb25nIHRpbWUgaXMgc3BlbnQgaGVyZSAqLw0KPiANCj4gYmFzZS1jb21taXQ6IDJmNjllZjk2
ODAxZjBkMmI5NjQ2YWJmNjM5NmU2MGY5OWM1NmUzYTANCj4gLS0gDQo+IDIuMjUuMQ0KPiANCj4g
DQoNCg==

