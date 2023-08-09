Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5597C7764EA
	for <lists+xen-devel@lfdr.de>; Wed,  9 Aug 2023 18:19:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.581240.909850 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTltZ-0007IF-6K; Wed, 09 Aug 2023 16:18:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 581240.909850; Wed, 09 Aug 2023 16:18:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTltZ-0007F9-3b; Wed, 09 Aug 2023 16:18:49 +0000
Received: by outflank-mailman (input) for mailman id 581240;
 Wed, 09 Aug 2023 16:18:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kmRr=D2=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1qTltX-0007F3-HH
 for xen-devel@lists.xenproject.org; Wed, 09 Aug 2023 16:18:47 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20613.outbound.protection.outlook.com
 [2a01:111:f400:7d00::613])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6a4a774f-36d0-11ee-b281-6b7b168915f2;
 Wed, 09 Aug 2023 18:18:46 +0200 (CEST)
Received: from AS9PR06CA0289.eurprd06.prod.outlook.com (2603:10a6:20b:45a::29)
 by AS1PR08MB7498.eurprd08.prod.outlook.com (2603:10a6:20b:4dd::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.25; Wed, 9 Aug
 2023 16:18:33 +0000
Received: from AM7EUR03FT016.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:45a:cafe::a5) by AS9PR06CA0289.outlook.office365.com
 (2603:10a6:20b:45a::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27 via Frontend
 Transport; Wed, 9 Aug 2023 16:18:33 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT016.mail.protection.outlook.com (100.127.140.106) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6678.18 via Frontend Transport; Wed, 9 Aug 2023 16:18:33 +0000
Received: ("Tessian outbound 997ae1cc9f47:v145");
 Wed, 09 Aug 2023 16:18:33 +0000
Received: from 448e72feccd5.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 17C8ED21-55F3-4C61-98AF-51110E4E3489.1; 
 Wed, 09 Aug 2023 16:18:03 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 448e72feccd5.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 09 Aug 2023 16:18:03 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by AM8PR08MB6323.eurprd08.prod.outlook.com (2603:10a6:20b:354::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.28; Wed, 9 Aug
 2023 16:18:01 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::4c7d:6a1:e742:3b1a]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::4c7d:6a1:e742:3b1a%4]) with mapi id 15.20.6652.028; Wed, 9 Aug 2023
 16:18:01 +0000
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
X-Inumbo-ID: 6a4a774f-36d0-11ee-b281-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zBKXN+jwBubVhY7AIfbvFgtfcMtXef2QqdlWUYThVzc=;
 b=dAe8H4k7TFJRnkbzkeysJ7VjxvCTGOijEjKJ4YNtqd7rWxjqCpofgtoOJsteFiiGMAWO0iqY+rjq70zA4wXWQuhElJNhNNIf4/pnG3D8jQUSP2H7wEpJ7M5qSDp1tuOcprbf7xwrRAh4g6uQA9eYfs8iQitoRmj7dsq6JfmNiCY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9aa6245a2abd8fba
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=brXqi8EaHCOVHlaj0BqHIhaGvlqs1zD25l+ZILj/aQJc7pdWI5Yzx8dHGVArvNZNm69m0Y526lz7XdLp+lBidG+ohDZr/mS5GZYdUqLNThvF0t+Tm4WBh9UFGeav1hk4LvCRZQoUo9aOJwQMrJ9KSgxErJv7OzUNrIOuF7D4bT8DpXc1zY4S+5d3jhgN2cGqf/YHJJwX9aHxu6dxkni9K3mjXSmoyTb64omzKCfs1AzxlP36335M7sKd6J9qsh5zi43bE2xoKYd4HoeIvEy/486ys6ePucpU6ROXNSMGQoJYlzk3Z4Uebo+BB3bT0HB8bK+88gyD/DjvSycT4bKMpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zBKXN+jwBubVhY7AIfbvFgtfcMtXef2QqdlWUYThVzc=;
 b=Um+4Z65No66MTWsK34U4U5s9d+1aXUmv0S885h64bbCyQOA+tLOJd8Q4mW9MOT9T1mgiJvVYVUSXE3HnYtj/+srSX9VO/7gekqTiogND/qPiiAPYGR8M/iKMJFM/xQI6Jha1GjV+wRA36MhV+9sqEuDoGFmTENjwgP1fqtyLev1NzL3O5CPWhkramO+hwMlU4VbbDMQ3ujIpJyIfLSTjvbv9fJWXiwL9Hpg6JJLmeZ5RJf2S0GXSA8OP4Rw86VifFG13cnrM/PYaKQYfEs635LTsj9BlOnV2qrnQVT8n52laO5RCFlgJN5Djh2zDrWhhQM7mGBc4vmJQueLbJZDAKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zBKXN+jwBubVhY7AIfbvFgtfcMtXef2QqdlWUYThVzc=;
 b=dAe8H4k7TFJRnkbzkeysJ7VjxvCTGOijEjKJ4YNtqd7rWxjqCpofgtoOJsteFiiGMAWO0iqY+rjq70zA4wXWQuhElJNhNNIf4/pnG3D8jQUSP2H7wEpJ7M5qSDp1tuOcprbf7xwrRAh4g6uQA9eYfs8iQitoRmj7dsq6JfmNiCY=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [RFC PATCH 5/5] xen: Add clang-format configuration
Thread-Topic: [RFC PATCH 5/5] xen: Add clang-format configuration
Thread-Index: AQHZwStJjnl5s/6RqkyuxqTMVBpDCK/iL4wAgAAIMgA=
Date: Wed, 9 Aug 2023 16:18:01 +0000
Message-ID: <394778DB-2D5E-4C52-9DA1-F23A530534A8@arm.com>
References: <20230728081144.4124309-1-luca.fancellu@arm.com>
 <20230728081144.4124309-6-luca.fancellu@arm.com>
 <3c5ae070-d6c2-070c-e482-e5135e2acef1@suse.com>
In-Reply-To: <3c5ae070-d6c2-070c-e482-e5135e2acef1@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|AM8PR08MB6323:EE_|AM7EUR03FT016:EE_|AS1PR08MB7498:EE_
X-MS-Office365-Filtering-Correlation-Id: ed24b110-62b8-4d47-130f-08db98f44711
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 wwQoxNmZ/wsYv6swXzB2O0YhRX6CEaAaKuO0okfmtYFXKHvZEQBIIjpIDOPN/HZlpnfHSogB3wSjVpYQBTEvpcL/NKY/CPX6ue8hAxuWf0+WQi7C0WfL2j+bp9zIpHihM403eRxr2A186rSzsnAx5ArxlH70b66kcYKwJ5Fqj0YsxFQWCAZRaK9e/xkSjc9ZDec1fX/6B62BWPHcPNJSGB4hz94AYb24BpphIHPh3xg9ZDWNuLQ85ajDT1eIyUspdIT1k2F2j9bIdAza0/5o9og/+rtsorpjPepTZ+CVcH5w8cEwyRH7gRk6CfSKeGXT6Wmzs6wjXKSMJA13FYzVVrRRVYCgDZQeKNhrD9grNeDRUtpEMIqxnXCJAroIttSXTsQDLje4G/pN70BokT7OiaN5xph1dot24zZqHSdhalL19coJPipQdOXASz9325ft6T5n+lTgdWclyjWPbL9hrp4Niill5tOsfW2RukS70GQOix+7mZwnZkZ43WcomLqeU7uHg9JWmt+LF0SfGoD6CZ38KGoTWAkoQdG1ahapW2SWldBv+EzXH3BuPq6l6Fkbdi+uwmoWdI00zeEBlbKlh+Oc1MSF8sOx4IRWB9WWLQr6j8AhYQX8FLe7LanP7OEMVoZpmni265VaFSGCpQO05D8dk1YDW73NLo/ugIMvyvH0Tt99mKMcL9+6GcgVxxtD
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(376002)(346002)(396003)(366004)(186006)(1800799006)(451199021)(83380400001)(122000001)(478600001)(2616005)(966005)(6512007)(26005)(53546011)(6506007)(41300700001)(8936002)(91956017)(76116006)(66446008)(66946007)(66476007)(66556008)(64756008)(316002)(8676002)(4326008)(2906002)(6916009)(6486002)(71200400001)(36756003)(38100700002)(54906003)(33656002)(86362001)(38070700005)(5660300002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <5005D73431EAA045A9E6054B8F29C89B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6323
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8958d084-61c9-4ed7-56dd-08db98f433da
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WFGDDfEMgXdeyn3ajOvrhglJWZVQmrTnsXyDdLL1TVTx4D2UW4SlBuOmVvvr6XMDo3SJl2xx7VfAjQjgIxkp8OBik3CqDT7IGtxaXl719aruX6ThQROdB3Ham/SkofByaNAH2prJw7YL7H0cYqrQJ3NkZjkcILRs9jTEy8ACuI8GMgtP0cUh9B5uUMSsr4vcvFnkYxVlP1LNxj/oKN7ftDb90ra8m5ciRnxfPAaNraAS6wb2o4ht8pj0BfEr/tjA/OVVPk0Ji/vwfF7r+fS47+xsf2b/FBJgvsH1VZCPxEz9Nb23HwN6Yv1EaGsWRM60n4KnXhIPxPOGaZieGj0BuuwM7JjSM1bc4gRmg7f8qUNSe6XC8K0jBFrG3vl0ngYCI09nJPFqmNKbYVa1oNo6JuKQ8g9B3MDt3IaPvNqqDs1y+0XvTzVP3WIQ4CeelNn5fUhSnnRtN86sbm+Zoz7APpDRUwyG/IX9kvOw2kkge28OOfJeoiQz9okdhijtnBlekHPszuMHzv/x/t2Qt878O3zDW3pVZ7xIK9TGa92cTuNP9drnqhGc0Lv63kLORL6mvH5pwJlIm2YxdDXrvd625RZT3qV5AKzFD7XUlWTGld7X+BBuecexbtDdLpRJp5egtOHAd8sx7KYFHIsNR8rrOvFxHJcshT238kgXv2gPdqrRqcfWR3Qt18u1utaZ+1Lzk+5DnENFPRf3jaKqgknGBSrw1MM1OtVU29KXCLWVn9W4f1YD2nwZbhB9T7wgv23+7Lk8QxSHHDdCIzdcl/L20Q==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(136003)(39860400002)(376002)(82310400008)(451199021)(186006)(1800799006)(36840700001)(40470700004)(46966006)(6512007)(966005)(6506007)(53546011)(26005)(40480700001)(40460700003)(36756003)(54906003)(86362001)(5660300002)(8676002)(2906002)(316002)(41300700001)(70586007)(33656002)(70206006)(8936002)(6862004)(4326008)(478600001)(356005)(81166007)(82740400003)(2616005)(47076005)(36860700001)(6486002)(83380400001)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2023 16:18:33.4175
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ed24b110-62b8-4d47-130f-08db98f44711
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR08MB7498

DQoNCj4gT24gOSBBdWcgMjAyMywgYXQgMTY6NDgsIEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT4gd3JvdGU6DQo+IA0KPiBPbiAyOC4wNy4yMDIzIDEwOjExLCBMdWNhIEZhbmNlbGx1IHdy
b3RlOg0KPj4gLS0tIC9kZXYvbnVsbA0KPj4gKysrIGIveGVuLy5jbGFuZy1mb3JtYXQNCj4+IEBA
IC0wLDAgKzEsNjkzIEBADQo+PiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1v
bmx5DQo+PiArIw0KPj4gKyMgY2xhbmctZm9ybWF0IGNvbmZpZ3VyYXRpb24gZmlsZS4gSW50ZW5k
ZWQgZm9yIGNsYW5nLWZvcm1hdCA+PSAxNS4NCj4+ICsjDQo+PiArIyBGb3IgbW9yZSBpbmZvcm1h
dGlvbiwgc2VlOg0KPj4gKyMNCj4+ICsjICAgRG9jdW1lbnRhdGlvbi9wcm9jZXNzL2NsYW5nLWZv
cm1hdC5yc3QNCj4+ICsjICAgaHR0cHM6Ly9jbGFuZy5sbHZtLm9yZy9kb2NzL0NsYW5nRm9ybWF0
Lmh0bWwNCj4+ICsjICAgaHR0cHM6Ly9jbGFuZy5sbHZtLm9yZy9kb2NzL0NsYW5nRm9ybWF0U3R5
bGVPcHRpb25zLmh0bWwNCj4+ICsjDQo+PiArLS0tDQo+PiArDQo+PiArIyBbbm90IHNwZWNpZmll
ZF0NCj4+ICsjIEFsaWduIGZ1bmN0aW9uIHBhcmFtZXRlciB0aGF0IGdvZXMgaW50byBhIG5ldyBs
aW5lLCB1bmRlciB0aGUgb3BlbiBicmFja2V0DQo+PiArIyAoc3VwcG9ydGVkIGluIGNsYW5nLWZv
cm1hdCAzLjgpDQo+PiArQWxpZ25BZnRlck9wZW5CcmFja2V0OiBBbGlnbg0KPiANCj4gSSdtIG5v
dCBjb252aW5jZWQgdGhpcyBydWxlIChhc3N1bWluZyBJJ20gZ2V0dGluZyBpdCByaWdodCkgaXMN
Cj4gc3VpdGFibGUgaW4gYWxsIGNhc2VzLCBlc3BlY2lhbGx5IGZvciBmdW5jdGlvbnMgd2l0aCBs
b25nIG5hbWVzIG9yDQo+IHZlcnkgbWFueSBwYXJhbWV0ZXJzLg0KDQpOb3Qgc3VyZSBJIHVuZGVy
c3RhbmQsIEkgdGhpbmsgdGhpcyBpcyB0aGUgY3VycmVudCBiZWhhdmlvdXIgaW4gdGhlIGNvZGVi
YXNlIG5vdy4NCg0KPiANCj4+ICsjIFtub3Qgc3BlY2lmaWVkXQ0KPj4gKyMgQWxpZ24gYXJyYXkg
b2Ygc3RydWN0J3MgZWxlbWVudHMgYnkgY29sdW1uIGFuZCBqdXN0aWZ5DQo+PiArIyBzdHJ1Y3Qg
dGVzdCBkZW1vW10gPQ0KPj4gKyMgew0KPj4gKyMgICAgIHs1NiwgMjMsICAgICJoZWxsbyJ9LA0K
Pj4gKyMgICAgIHstMSwgOTM0NjMsICJ3b3JsZCJ9LA0KPj4gKyMgICAgIHs3LCAgNSwgICAgICIh
ISIgICB9DQo+PiArIyB9Ow0KPiANCj4gSSdtIHByZXR0eSBzdXJlIHdlIHdhbnQgdG8gaGF2ZSBi
bGFua3MgaW1tZWRpYXRlbHkgaW5zaWRlIHRoZSBicmFjZXMuDQoNCm9rDQoNCj4gDQo+PiArIyAo
c3VwcG9ydGVkIGluIGNsYW5nLWZvcm1hdCAxMykNCj4+ICtBbGlnbkFycmF5T2ZTdHJ1Y3R1cmVz
OiBMZWZ0DQo+PiArDQo+PiArIyBbbm90IHNwZWNpZmllZF0NCj4+ICsjIEFsaWduIGNvbnNlY3V0
aXZlIGFzc2lnbm1lbnRzIChzdXBwb3J0ZWQgaW4gY2xhbmctZm9ybWF0IDMuOCkNCj4+ICtBbGln
bkNvbnNlY3V0aXZlQXNzaWdubWVudHM6DQo+PiArICBFbmFibGVkOiB0cnVlDQo+PiArICBBY3Jv
c3NFbXB0eUxpbmVzOiB0cnVlDQo+PiArICBBY3Jvc3NDb21tZW50czogZmFsc2UNCj4gDQo+IFRo
aXMgaXMgc29tZXRoaW5nIHdlIHdhbnQgdG8gcGVybWl0LCBidXQgbm90IGRlbWFuZCwgSSB0aGlu
ay4gSSdtIGFsc28NCj4gdW5jb252aW5jZWQgd2Ugd2FudCBpdCBhY3Jvc3MgZW1wdHkgbGluZXMu
DQoNClRoaXMgd2FzIHBvaW50ZWQgb3V0IGJ5IEFsZWphbmRybyBhbmQgU3RlZmFubywgd2UgY2Fu
IGRpc2FibGUgdGhpcyBieQ0KcGFzc2luZyAnTm9uZScNCg0KPiANCj4+ICsjIFtub3Qgc3BlY2lm
aWVkXQ0KPj4gKyMgRG8gbm90IGFsaWduIGNvbnNlY3V0aXZlIGJpdCBmaWVsZHMgKHN1cHBvcnRl
ZCBpbiBjbGFuZy1mb3JtYXQgMTEpDQo+PiArQWxpZ25Db25zZWN1dGl2ZUJpdEZpZWxkczogTm9u
ZQ0KPj4gKw0KPj4gKyMgW25vdCBzcGVjaWZpZWRdDQo+PiArIyBEbyBub3QgYWxpZ24gdmFsdWVz
IG9mIGNvbnNlY3V0aXZlIGRlY2xhcmF0aW9ucw0KPj4gKyMgKHN1cHBvcnRlZCBpbiBjbGFuZy1m
b3JtYXQgMy44KQ0KPj4gK0FsaWduQ29uc2VjdXRpdmVEZWNsYXJhdGlvbnM6IE5vbmUNCj4+ICsN
Cj4+ICsjIFtub3Qgc3BlY2lmaWVkXQ0KPj4gKyMgQWxpZ24gdmFsdWVzIG9mIGNvbnNlY3V0aXZl
IG1hY3JvcyAoc3VwcG9ydGVkIGluIGNsYW5nLWZvcm1hdCA5KQ0KPj4gK0FsaWduQ29uc2VjdXRp
dmVNYWNyb3M6DQo+PiArICBFbmFibGVkOiB0cnVlDQo+PiArICBBY3Jvc3NFbXB0eUxpbmVzOiB0
cnVlDQo+PiArICBBY3Jvc3NDb21tZW50czogdHJ1ZQ0KPiANCj4gVGhpcyBhbHNvIGxvb2tzIHRv
IGFnZ3Jlc3NpdmUgdG8gbWUuDQoNCkl0IGNhbiBiZSwgYnV0IGl0IGNhbiBsZWFkIHRvIGEgbmlj
ZSBmb3JtYXQuIEFueXdheSBjYW4gYmUgY3VzdG9taXNlZC4NCg0KPiANCj4gQW5kIEkgZ3Vlc3Mg
SSdsbCBzdG9wIGhlcmUuIFdoYXQgaXMgdGhlIHBsYW4gd3J0IGRpc2N1c3Npbmcgd2hpY2gNCj4g
YXNwZWN0cyB3ZSB3YW50IHRvIHJlcXVpcmUgYW5kIHdoaWNoIHdlIHdhbnQgdG8gcGVybWl0IGJ1
dCBub3QNCj4gcmVxdWlyZT8gT3IgaXMgdGhlcmUgYWx0ZXJuYXRpdmVseSBhIHdheSB0byBsZWF2
ZSB1bmNvbmZpZ3VyZWQNCj4gKGFuZCBoZW5jZSB1bmFsdGVyZWQpIGFueXRoaW5nIHRoYXQncyBu
b3QgYWxyZWFkeSBzcGVsbGVkIG91dCBpbg0KPiAuL0NPRElOR19TVFlMRT8NCg0KSSB0aGluayBJ
IGRpZCBjcmVhdGUgYSBjb25maWd1cmF0aW9uIHNwZWNpZnlpbmcgb25seSB3aGF0IHdhcyBzcGVs
bGVkIG91dA0KaW4gQ09ESU5HX1NUWUxFLCBidXQgaXQgd2FzIG5vdCByZWFsbHkgc3VjY2Vzc2Z1
bCBhbmQgbGVkIHRvIG1hbnkgY2hhbmdlcywNCm1vcmUgdGhhbiBub3cuDQoNCkkgdGhpbmsgd2Ug
bmVlZCB0byBjb2xsZWN0IG1haW50YWluZXJzIHZpZXcgb24gZXZlcnkgW25vdCBzcGVjaWZpZWRd
IGNvbmZpZ3VyYWJsZQ0KYW5kIHNlZSB3aGljaCBvbmUgYXJlIGFncmVlZCBieSB0aGUgbWFqb3Jp
dHksIGFuZCB3aGljaCBvbmUgYXJlIG1vcmUgY29udHJvdmVyc2lhbC4NCg0KSeKAmXZlIHB1c2hl
ZCB0aGlzIHNlcmllIGFsc28gdG8gbWFrZSB0aGUgY29tbXVuaXR5IGFibGUgdG8gc2VlIHRoZSBv
dXRwdXQgYW5kIHJhaXNlDQppc3N1ZXMgb3IgYmVoYXZpb3VyIHRoYXQgYXJlIG5vdCByaWdodCwg
dG8gc2VlIGlmIHdlIGNhbiBkbyBzb21ldGhpbmcgb3IgaWYgdGhlcmUgaXMgbm8NCmFncmVlbWVu
dCBhbmQgdGhlIHRvb2wgd291bGQgYmUgcHV0IG9uIGhvbGQuDQoNCkFueXdheSBJ4oCZbSBhd2Fy
ZSB0aGF0IHdlIGFyZSBnb2luZyBpbnRvIGEgcGVyaW9kIHRoYXQgd2lsbCBiZSBwcmV0dHkgYnVz
eSBiZXR3ZWVuDQphbm51YWwgbGVhdmVzIGFuZCB0aGUgcmVsZWFzZSwgc28gSeKAmW0gb2sgdG8g
cGluZyB0aGlzIGRpc2N1c3Npb24gYWZ0ZXIgdGhlIHJlbGVhc2UuDQoNCkNoZWVycywNCkx1Y2EN
Cg0KPiANCj4gSmFuDQoNCg==

