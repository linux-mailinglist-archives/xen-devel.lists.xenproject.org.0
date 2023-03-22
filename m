Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF656C441F
	for <lists+xen-devel@lfdr.de>; Wed, 22 Mar 2023 08:32:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513122.793664 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pesxW-0004a8-UF; Wed, 22 Mar 2023 07:32:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513122.793664; Wed, 22 Mar 2023 07:32:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pesxW-0004Wl-RS; Wed, 22 Mar 2023 07:32:34 +0000
Received: by outflank-mailman (input) for mailman id 513122;
 Wed, 22 Mar 2023 07:32:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MxM9=7O=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1pesxV-0004Wf-9i
 for xen-devel@lists.xenproject.org; Wed, 22 Mar 2023 07:32:33 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2062a.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b4c93639-c883-11ed-85db-49a42c6b2330;
 Wed, 22 Mar 2023 08:32:32 +0100 (CET)
Received: from DB8PR09CA0019.eurprd09.prod.outlook.com (2603:10a6:10:a0::32)
 by DBAPR08MB5847.eurprd08.prod.outlook.com (2603:10a6:10:1a0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 07:32:20 +0000
Received: from DBAEUR03FT021.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:a0:cafe::b9) by DB8PR09CA0019.outlook.office365.com
 (2603:10a6:10:a0::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37 via Frontend
 Transport; Wed, 22 Mar 2023 07:32:20 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT021.mail.protection.outlook.com (100.127.142.184) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6222.17 via Frontend Transport; Wed, 22 Mar 2023 07:32:20 +0000
Received: ("Tessian outbound fcd8b5fba459:v135");
 Wed, 22 Mar 2023 07:32:19 +0000
Received: from c10ae3a453b7.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 15665632-D4AA-443C-928D-A44BE506BAEE.1; 
 Wed, 22 Mar 2023 07:32:09 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c10ae3a453b7.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 22 Mar 2023 07:32:09 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by AS8PR08MB6101.eurprd08.prod.outlook.com (2603:10a6:20b:29a::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 07:32:07 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6c10:9ef5:6e6d:56a3]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6c10:9ef5:6e6d:56a3%7]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 07:32:07 +0000
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
X-Inumbo-ID: b4c93639-c883-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BX+PvCazbLN/TI5Yy64YzdGS0oCBehY3gXHK0MtU8wc=;
 b=5XyUKiwBQlFw6bHPRcv8vUgu/3qKiYNGdFV62XIIgI1zGrcrswnL/jwknHGo+ubPbIHZYZagkKoVE8ZhuSOBZUnUivcWqu1CVocLSGv+S9DF5xUOtX6LfTzNP9RIINChId5PAcLjdw5lnbN4B7oTUoXBSoGFWej4DZTI3NhHJ+c=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5a7e61b466797a7c
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IoQG2Vzr+B1XBvDzK3lKgQLY8lrrFt15hr+xlmn+KGrvlsB8KlP6ybwY33leNmB4YzeiistMA/wjiv9Kng88wSYK8mRSJd0odX1vUJ/v9ssNoBrncIXcy33o+ZPetSGpq+qlt22nKeS25mJns5Ed953T90A5rYJr5ZEhImZv5Tg9JMfr2HcqmRrhlK7iqNtJHk0+N7m+o/IYUAsGVrqgkc42/Y9lMzwbZ2+6g1MMfrm0+CBS10l9tzBJayx8uqmH2/XbuL3jlDDC/d/S8vF8dHn617DpcdNDrAt/B++e8bGLfXfuetk9M39dXxPy5LMWHhRbNQ7R0o4Pei7RSKP7dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BX+PvCazbLN/TI5Yy64YzdGS0oCBehY3gXHK0MtU8wc=;
 b=GXnAg5/iVNYk/IYttoAkj9b32Jmbj6uMeeapsTJ31vLQRTxOGsPLMpurujDYFbaNSPIFKE64t1WGQ1YRYurKcAcoKTGckPtx7T+wNqpZM6ae/OITDszKZdhNOoZqHmf5qE2QEv2E++90rhywyH5wu7qvNT69GjoeYzPguNLGqLbnqFxahi2XyAVSqGmN//1tDb+XuGWfVTwY8vohWAMevvoXqXI09FjnObxQm2N0y+udKyaXYnSki0cWHbujTZTOyrx+ljnyJJrOSz5X+OeZ0ov1FPt0116Pjj7fx7lVIjY4HPsNO77xXdoc/JOdzLhPGGgrrSGc87C/Np22MjQjNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BX+PvCazbLN/TI5Yy64YzdGS0oCBehY3gXHK0MtU8wc=;
 b=5XyUKiwBQlFw6bHPRcv8vUgu/3qKiYNGdFV62XIIgI1zGrcrswnL/jwknHGo+ubPbIHZYZagkKoVE8ZhuSOBZUnUivcWqu1CVocLSGv+S9DF5xUOtX6LfTzNP9RIINChId5PAcLjdw5lnbN4B7oTUoXBSoGFWej4DZTI3NhHJ+c=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 06/10] xen/arm: enable Dom0 to use SVE feature
Thread-Topic: [PATCH v3 06/10] xen/arm: enable Dom0 to use SVE feature
Thread-Index: AQHZWNM/SE3smSw/xUO8BxhNV6gL4K8DZsqAgAMIUQA=
Date: Wed, 22 Mar 2023 07:32:06 +0000
Message-ID: <35B6524B-1AB1-4978-B887-91C4EC3D5231@arm.com>
References: <20230317131949.4031014-1-luca.fancellu@arm.com>
 <20230317131949.4031014-7-luca.fancellu@arm.com>
 <bfe68fee-dc22-dcf4-c4fa-d30ddc95718e@suse.com>
In-Reply-To: <bfe68fee-dc22-dcf4-c4fa-d30ddc95718e@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.400.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|AS8PR08MB6101:EE_|DBAEUR03FT021:EE_|DBAPR08MB5847:EE_
X-MS-Office365-Filtering-Correlation-Id: 50cad00f-fe0d-42da-5abd-08db2aa79204
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Rcul+QHZSwzawBZ1889TtK2XHC81isCsoFFKnJ2HrfddRvD6vOmTWfSXCztLt4LDJ/fYAmFxqn+Q4RLq9V9N6GgqDesSlerM1taW6TNTcP6I9QMkOVHRQO7otfnFBJ1yJnkDZlqfOL9iQ1Y1ygL2Na96XP6xT+roV24Te1m6v7xceJtjSWuLULamlQ8z2M5tXugvcVruMhWQeN6vqSMOcLoMnF2suzazFwI+9Ef6h1bdSDSWz+FevbjP00OEhjyq/JujsqLHYgrfFyciYXeMqZV2/yS0VQUMdKJSYwGyOH0urbQmR6i+N9NECO9HJRBzE2rLYMB1pe7XZ6AUYym5tyaWqS4BvozhVg7xqF2gC0lleRW8L9dGt3RjbLLaxz/4JDREFlobldjiuMXqmJzGfjBesAZzMQm19+vy1H3+e/QvEVmesMVJWQx+SoX9C5gqjBhOqjXOivaJFKJ+fbSURwUYJdD2hFrQMvh0ryxg8quSRHm3GCWr2hk2VZcgwaKoh28XnpKzDl6swTrhMTQop/4L2k/yD3ko5HfvV5VPhSnnoh7Uwys4WpIKfyXjXCE5De+JwXmkiZKUqR8cCYCdChEHbQIp9+ro8A6w78pfhj55ZXZv0kng55IPDeL8S3pdnGjHQVtQK87XJAA8LMYYwszeDfVbKxHbLtw6qz9veQBqcbV0FEa4vrI7Q3sjxg0ESMm4rjLZgdlmj9JlpSeFSq6q90uzgtF89uj5rkyBt/c=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(376002)(346002)(366004)(39860400002)(136003)(451199018)(8936002)(5660300002)(41300700001)(38070700005)(33656002)(86362001)(122000001)(38100700002)(2906002)(36756003)(4326008)(6486002)(478600001)(2616005)(83380400001)(71200400001)(6506007)(26005)(6512007)(53546011)(54906003)(316002)(186003)(8676002)(66476007)(66446008)(91956017)(64756008)(66946007)(76116006)(66556008)(6916009)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <AE9815937CF8C7458D24145D93E58D82@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6101
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c4dd4a7c-e741-43a7-2941-08db2aa78a3e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dP4vjORVjDSnqdjrm3dBUxd+BkU+gHhLz55mE2GQf2w6Fg4qpjHjE1i9AaLCuE3wV9i2mjcKlK1/XRNtjdHBP2y7Zhj0y9Y30xRWuup4WIRVaIi6jmyZMpJw5tUz+t+b4f8oyxHfY2fbRuuCwJ6pjaTkzPVLKnvrcL5wUSf8Hu3KJheGXb0PZ56lfaXPlkorQFSMrcs7HW7tNh+Ak+TxG7uE6iiCn64s8fXWDiEqedurAdxn3mURcfQYR5/tI1kvgSXyvEW3c/USY4wSTTY0ILtH/pUdgcCAe3eyraIojPuN09NM/QoePutUtvzRyinJx+lmG8xPRDkWZGHm4Tuy0YFLYO9T2mLbWel8RIsKbE7KIukNszGCII4rF8pUtE45xsDpKPrjGRlcXjk15SPaDjHfCJOsuZHU0IqBqUi7Uh/oIGzxRZsMTxHVJXIv+6e4BfzLqD4EcAzNKLjQjOrylf/U69rqVEG6KNuG1M/Qjypybe7pFVU2z+yYjRA9z0SUhaYab0AUTCWqRCamXqV2QKQ2A1RbSNG536bSmlBQXXORtjElI1cMLsXni16msd2uEFkp9Ityb7UKnZwQKgvr1bSWObrIS+iKlf9ExfKuO9/oPx0veCVGyDxzXrBePksZWw6tNd9feikZQ1Foq+JdT5FaPfgdkjLfy2S23CFmEy4LsN963+cFHXl4nDX+yC+qSOfmT2IBl7iud+TR6FkZNA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(396003)(376002)(346002)(39850400004)(136003)(451199018)(36840700001)(46966006)(40470700004)(6486002)(41300700001)(36860700001)(6862004)(5660300002)(70206006)(70586007)(8676002)(8936002)(4326008)(47076005)(40480700001)(356005)(86362001)(36756003)(82310400005)(82740400003)(33656002)(40460700003)(81166007)(336012)(26005)(6512007)(6506007)(2616005)(53546011)(186003)(2906002)(316002)(478600001)(54906003)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 07:32:20.0721
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 50cad00f-fe0d-42da-5abd-08db2aa79204
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5847

DQoNCj4gT24gMjAgTWFyIDIwMjMsIGF0IDA5OjEzLCBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOg0KPiANCj4gT24gMTcuMDMuMjAyMyAxNDoxOSwgTHVjYSBGYW5jZWxsdSB3
cm90ZToNCj4+IC0tLSBhL2RvY3MvbWlzYy94ZW4tY29tbWFuZC1saW5lLnBhbmRvYw0KPj4gKysr
IGIvZG9jcy9taXNjL3hlbi1jb21tYW5kLWxpbmUucGFuZG9jDQo+PiBAQCAtMTAwNSw2ICsxMDA1
LDE5IEBAIHJlc3RyaWN0aW9ucyBzZXQgdXAgaGVyZS4gTm90ZSB0aGF0IHRoZSB2YWx1ZXMgdG8g
YmUgc3BlY2lmaWVkIGhlcmUgYXJlDQo+PiBBQ1BJIFBYTSBvbmVzLCBub3QgWGVuIGludGVybmFs
IG5vZGUgbnVtYmVycy4gYHJlbGF4ZWRgIHNldHMgdXAgdkNQVQ0KPj4gYWZmaW5pdGllcyB0byBw
cmVmZXIgYnV0IGJlIG5vdCBsaW1pdGVkIHRvIHRoZSBzcGVjaWZpZWQgbm9kZShzKS4NCj4+IA0K
Pj4gKyMjIyBkb20wX3N2ZSAoYXJtKQ0KPj4gKz4gYD0gPGludGVnZXI+YA0KPj4gKw0KPj4gKz4g
RGVmYXVsdDogYDBgDQo+PiArDQo+PiArRW5hYmxlIGFybSBTVkUgdXNhZ2UgZm9yIERvbTAgZG9t
YWluIGFuZCBzZXRzIHRoZSBtYXhpbXVtIFNWRSB2ZWN0b3IgbGVuZ3RoLg0KPj4gK1ZhbHVlcyBh
Ym92ZSAwIG1lYW5zIGZlYXR1cmUgaXMgZW5hYmxlZCBmb3IgRG9tMCwgb3RoZXJ3aXNlIGZlYXR1
cmUgaXMgZGlzYWJsZWQuDQo+PiArUG9zc2libGUgdmFsdWVzIGFyZSBmcm9tIDAgdG8gbWF4aW11
bSAyMDQ4LCBiZWluZyBtdWx0aXBsZSBvZiAxMjgsIHRoYXQgd2lsbCBiZQ0KPj4gK3RoZSBtYXhp
bXVtIHZlY3RvciBsZW5ndGguDQo+PiArUGxlYXNlIG5vdGUgdGhhdCB0aGUgcGxhdGZvcm0gY2Fu
IHN1cHBvcnRzIGEgbG93ZXIgdmFsdWUsIGlmIHRoZSByZXF1ZXN0ZWQgdmFsdWUNCj4+ICtpcyBh
Ym92ZSB0aGUgc3VwcG9ydGVkIG9uZSwgdGhlIGRvbWFpbiBjcmVhdGlvbiB3aWxsIGZhaWwgYW5k
IHRoZSBzeXN0ZW0gd2lsbA0KPj4gK3N0b3AuDQo+PiArDQo+PiAjIyMgZG9tMF92Y3B1c19waW4N
Cj4+PiBgPSA8Ym9vbGVhbj5gDQo+IA0KPiBJJ2QgbGlrZSB0byByYWlzZSB0aGUgcXVlc3Rpb24g
b2YgcHJvbGlmZXJhdGlvbiBvZiB0b3AtbGV2ZWwgY29tbWFuZA0KPiBsaW5lIG9wdGlvbnMgY29u
dHJvbGxpbmcgRG9tMC4gSW4geDg2IHdlJ3ZlIHNwZWNpZmljYWxseSBzdGFydGVkIHRvIHVzZQ0K
PiAiZG9tMD0iIGFzIHRoZSBvbmUgdG9wLWxldmVsIG9wdGlvbiB3aGVyZSBhbG1vc3QgYWxsIG5l
dyBjb250cm9scyBzaG91bGQNCj4gYmUgYWRkZWQgYXMgc3ViLW9wdGlvbnMuDQo+IA0KPiBfSWZf
IGEgdG9wLWxldmVsIG9wdGlvbiBpcyBpbmRlZWQgcHJlZmVycmVkLCB0aGVuIHBsZWFzZSBhdm9p
ZCB0aGUgdXNlDQo+IG9mIGFuIHVuZGVyc2NvcmUgaW4gaXRzIG5hbWUsIHdoZW4gYSBkYXNoIGRv
ZXMgZmluZS4NCg0KWWVzLCBtYXliZSBzb21ldGhpbmcgbGlrZSBkb20wPXN2ZT08Vkw+LFsuLi5d
IGlzIG5pY2UgZm9yIG5ldyBwb3NzaWJsZSBpbmNvbWluZyBmZWF0dXJlcywNCldoaWxlIEkgd2Fz
IGJyb3dzaW5nIHRoZSBjb2RlLCBJIHNwb3R0ZWQgYSBwb3NzaWJsZSBidWcgaW4geDg2L2RvbTBf
YnVpbGQuYywgaW4NCnBhcnNlX2RvbTBfcGFyYW0oLi4uKSBpZiBhbiBvcHRpb24gaXMgbm90IHJl
Y29nbmlzZWQgd2Ugc2V0IHJjID0gLUVJTlZBTCwgYnV0IHdlIGRvbuKAmXQNCnN0b3AgdGhlIGxv
b3AgYW5kIHdlIGNvbnRpbnVlIHRvIHBhcnNlLg0KSXMgaXQgdGhlIGludGVuZGVkIGJlaGF2aW91
cj8NCg0KPiANCj4gSmFuDQoNCg==

