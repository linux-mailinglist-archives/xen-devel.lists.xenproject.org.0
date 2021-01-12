Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1AD02F3301
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jan 2021 15:34:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.65717.116467 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzKkK-0007W1-Ph; Tue, 12 Jan 2021 14:34:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 65717.116467; Tue, 12 Jan 2021 14:34:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzKkK-0007Vc-MF; Tue, 12 Jan 2021 14:34:08 +0000
Received: by outflank-mailman (input) for mailman id 65717;
 Tue, 12 Jan 2021 14:34:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zMwe=GP=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kzKkI-0007VX-Ii
 for xen-devel@lists.xenproject.org; Tue, 12 Jan 2021 14:34:06 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (unknown
 [40.107.0.78]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 34e150ad-51c9-49bd-b050-e5e77f0cb156;
 Tue, 12 Jan 2021 14:34:04 +0000 (UTC)
Received: from DB6PR0301CA0013.eurprd03.prod.outlook.com (2603:10a6:4:3e::23)
 by AM6PR08MB3878.eurprd08.prod.outlook.com (2603:10a6:20b:8b::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Tue, 12 Jan
 2021 14:34:02 +0000
Received: from DB5EUR03FT035.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:3e:cafe::f5) by DB6PR0301CA0013.outlook.office365.com
 (2603:10a6:4:3e::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend
 Transport; Tue, 12 Jan 2021 14:34:02 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT035.mail.protection.outlook.com (10.152.20.65) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Tue, 12 Jan 2021 14:34:01 +0000
Received: ("Tessian outbound af289585f0f4:v71");
 Tue, 12 Jan 2021 14:34:01 +0000
Received: from c1e6648a7fa3.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A0B8E7D5-F9D7-4EA7-8299-3EA690ED4135.1; 
 Tue, 12 Jan 2021 14:33:56 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c1e6648a7fa3.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 12 Jan 2021 14:33:56 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com (2603:10a6:800:1ae::15)
 by VI1PR08MB2688.eurprd08.prod.outlook.com (2603:10a6:802:19::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Tue, 12 Jan
 2021 14:33:54 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::c8bf:1301:3373:94a6]) by VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::c8bf:1301:3373:94a6%5]) with mapi id 15.20.3742.012; Tue, 12 Jan 2021
 14:33:54 +0000
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
X-Inumbo-ID: 34e150ad-51c9-49bd-b050-e5e77f0cb156
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I9yTnsow83B2fiIvYJM5ORyxFRCPh6uFBVGaSDZ1s2o=;
 b=RATMsD2cwLieSZiqWf9Mu0uL1VTEwWzfISor74arvkv1GvSS8ng/ent6GXy4PN5qbhm/MQw8O8h+H3owLbSk1sONn3/qMZSn7aYM2KFdjetJmF18TqjvTDMpgsQmtkH2FsU/C5YcybL2PilDQ+p1so58GRFJ4mYTKQDXg66vExI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3dcee4f2f747a117
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BnDrVgsJ0pAnqE2F6KfEhZCxxeAG8mCwKUWK5DzO4DuRQjDuomTo9AD02QEKOWYAyTOdun3xC7hqfCtIvPR9YyVcDLWXOHwkGBb9k1raHcWvU9gHKjbodVEeHMWhwOfzFI1zcHYvgeEwP4sVLzmpfagKRJP1k0PeGYHI+bvgDhoiYTIBeAGTi/Y9JSjt14tHePCr1CjK74siYabtL7s4o3l/zrRng2k6SMaaYPxlvTGPeRTTh5wdDbT+0xCzDL6n6XnVUh3e41c6mcGvXh2wweeJJZXBF/ZYLrHaOp0ICCNyr5xcV2qXpCf0A2TrcyY3sTYHo8xJDhYe+1V/lskAOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I9yTnsow83B2fiIvYJM5ORyxFRCPh6uFBVGaSDZ1s2o=;
 b=HRpn6lCSjbzo5yHz5bJTp89SEdq/Cbuvi38WDr9WqJFi1+0QMplyFNp+hU3zmF1zqul6A96KEKkNmf/Il99mVfmS6h0Q/8hImVuEvDYDOVQQ9j1aOJqIBQT61tERci4W4qtuE3+j5IGP5hA6Xm4LNldtfct1fBS9DE5wMdhDSmO81zBJaJ/+z1h6ZhM4MgC0xVky23yaCiaulSwALjyEgV+sd/yc/2nFIDUpnWzxEdk7AXUKnHvg4M6AU7ddevqYULk55vt4uqkrvyjZkGqjKckcPbEma4oaaOZHUl5izRNPymgXjaEwF/QSMXg1L4jAdKiuTKFgXr5kcNhZpaBbwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I9yTnsow83B2fiIvYJM5ORyxFRCPh6uFBVGaSDZ1s2o=;
 b=RATMsD2cwLieSZiqWf9Mu0uL1VTEwWzfISor74arvkv1GvSS8ng/ent6GXy4PN5qbhm/MQw8O8h+H3owLbSk1sONn3/qMZSn7aYM2KFdjetJmF18TqjvTDMpgsQmtkH2FsU/C5YcybL2PilDQ+p1so58GRFJ4mYTKQDXg66vExI=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Rahul Singh <Rahul.Singh@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "Volodymyr_Babchuk@epam.com"
	<Volodymyr_Babchuk@epam.com>, Stefano Stabellini
	<stefano.stabellini@xilinx.com>
Subject: Re: [PATCH] xen/arm: don't read aarch32 regs when aarch32 isn't
 available
Thread-Topic: [PATCH] xen/arm: don't read aarch32 regs when aarch32 isn't
 available
Thread-Index: AQHW6HhLZe62+lKsX0KJMppOaCzey6oj03CAgAApR4CAABBpgIAAAdWA
Date: Tue, 12 Jan 2021 14:33:54 +0000
Message-ID: <8604C87A-2C14-4300-B3A8-74AF22E8C490@arm.com>
References: <20210112001623.28421-1-sstabellini@kernel.org>
 <db6949f1-6b19-b1bb-9bec-8b56a2ad83a1@xen.org>
 <265E97F3-1AA1-4DE7-BA26-E208D953302A@arm.com>
 <278d0e56-830c-5730-69ab-abf6db851a8d@xen.org>
In-Reply-To: <278d0e56-830c-5730-69ab-abf6db851a8d@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3608.120.23.2.4)
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [86.26.33.241]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 42c98f47-db25-4147-6f93-08d8b7071b0d
x-ms-traffictypediagnostic: VI1PR08MB2688:|AM6PR08MB3878:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB38788AC7300035A6D206699D9DAA0@AM6PR08MB3878.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 RVXlWQDetkleVeJYkOhuOTnKRSW6+GlUuhIQ3ye6Ytrb4lMFqGvv+ew8wAa1YPQqD65j9VTkhuZBfeTmyuR2DUprf3egrlVDEB9Ec6wdy9bs7vxe1MV6QAsOyCUx0avqT5CA/SawILvAJBsnH7P9FQ9WiD583vDzAj3D4Yxwjz43OcclHp7JWXiWPvnkX6CFNHTDHdwYzXIWzl5KTqf18JQ6aftyPyu26bP7hTGQQmAQlUkr6FlSyqTYMKMoy20wFXTLd8ofXywLKOs2Paq8r2pljzylX2KulRFhlBYnUvgcrzehZg00Zbv9dN36639np1+d5F0AGLvd9A/3cGynIZInI9MP5ciSX/DZ/7IZZfCj99QuPHAzo9wItFEaK6hOU6j7vsYcmXHvc/oy6jz68SJqgcTIEbDWp9KM8z0fpSsPS0EHfxMhOYboQhVqe3LUPr6VqCZyMahgifZRcStuqY1kD68Un7wvyJJ58C97H4domx4sdaHiA1zGRXQBxQBP96Uzi0rkZxcBNlD7kE0iPVb303mUivxUJ2BveoOlEYU=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(376002)(396003)(136003)(346002)(366004)(66946007)(6486002)(66446008)(76116006)(33656002)(66476007)(64756008)(66556008)(91956017)(8676002)(2616005)(8936002)(54906003)(966005)(478600001)(86362001)(6512007)(36756003)(83380400001)(186003)(5660300002)(6916009)(71200400001)(55236004)(4326008)(2906002)(6506007)(26005)(316002)(53546011)(45980500001)(6606295002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?utf-8?B?VTU4RW5nRzZXcUFhR0JWem5yQm44ZUFxRWM2RnAzYjZWbDhqaDd4TlNKd0k1?=
 =?utf-8?B?Tm81K0hjNlp2d0sxNnY1TE9BdHJtZHNOOEtKNkFmOEFSODZ0eEtZYVArUk1D?=
 =?utf-8?B?YWxzdlJPUG01Z1h0MEhDMGhNRUpOZVNoY1JtUVpQWHlPRllYNGdURnY2eDVY?=
 =?utf-8?B?VEtxVUlWZGlnVzZnTjRmZUVITmpZNlc3czhhVEp0VGl0UitKWlFXU3p2cE0r?=
 =?utf-8?B?UkN2Q05ZbXVobGVuR1AwU0QrdTFRc2hlUE9DQTVNZ3YyWktmczR2dmovcnRR?=
 =?utf-8?B?ZUJYWXR0WmxDWThiL3B5WGN4d1NJeWw3Y0JLdFdYaWtGbXJVckxNcDlBWk1w?=
 =?utf-8?B?eENIQWdpS0UwZVp3MkZZS2VwV3NVNnVVMGR5NnVpNWNSUzVrNTJ2NHpLclhu?=
 =?utf-8?B?clBQWG9GTnNielBOMi9FaFVmVGM5bDQrUjJsQ0dwbzBHdGFBM1IrWC9SUHQ5?=
 =?utf-8?B?dUJ4UDNIQTNud2FVZjJUM3U5TFNSZkRXVDJNdjRuZnR2Smxsb2ljdUIxUGlZ?=
 =?utf-8?B?VVhnNDI4d0tGWmswNitaVEM5ak1kUW9LcTE3OFNWV25zak5lcUQwWE1vM0tT?=
 =?utf-8?B?bzZIeUEyNEs3U2JiS0djZXhVbGhwWWRBOFFUTXVXWGlvelUydnp5M0xqVmtE?=
 =?utf-8?B?Rk1qeXJhUG1BalVIS0ZGQ3lUeVZEem9ONGVOQ1BYSS9DUXgvV1hqOU1lMWw2?=
 =?utf-8?B?QTVKMlYzL3p1Uy84OVNLU3U2QTlDcExPQTVaQm1JMnVVN3FkOVhXcnB6SXdx?=
 =?utf-8?B?UURTRmF1dHo1WTFKTURUU09qeXl4UVlQSksvbklWMWh1dDhNNVJPZ2VXeUtX?=
 =?utf-8?B?b0Z3Si9lOG5tRlJzTUlyVFQrbzBsR2N0RnRtY04zQm8xMk53Tms5bklrRzVi?=
 =?utf-8?B?Z1BNOWszU1JsMXRkSyt4VmtXN1RVajNtb2d1WEc1cWc0M2REWk9lano4T29E?=
 =?utf-8?B?bm9qMlRSZUVpUURiVDBsSmxwMmJtbUhvM1JoVDJJYlVWSm00SzExMVdGMGV5?=
 =?utf-8?B?c05KemptSmxpTnEvS243TXE0SzlWdEJVZUxyckRaRXcyVVVjTFA3Zk1TWFQv?=
 =?utf-8?B?K2R5K1dxUFpraEd3OUwzdGc5V1BUWVA0U3hhS3JuL1B4S1FOYjFTOSsreHJz?=
 =?utf-8?B?dDNvazQxWmlRZ1RUcnpZREVlLzNOU2xlNXJhc3RWMkpzNjVmaTN4V1QzL21x?=
 =?utf-8?B?TElnVHYzaFNuZXdGemRsUHpSdEtWblU5OThtT20vaGpCL1VaWnlmQ3FzZlZs?=
 =?utf-8?B?WmlDU1pXK0tzbzdGQW9ycFhLamk2cW5Ya2NZV3NqM3JsMVFZVXVYRHNNcDZQ?=
 =?utf-8?Q?qHrCs79N/KcFm4SvfeqrMomxWDo5apcEFo?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AA847BA6532FB3489C231001D6937087@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2688
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7004d081-5a12-42c6-0406-08d8b70716a7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LVZTOc/DvXBKzWEcUyUQT+tHrEtTbZod8OqngW/05lQzTeI4Rw8qFvrZKn0lOPMvbp1MXaSexg9qnidxq2sw2/Imq10R6viZ390QwjoePf1ITPlh0c1CtPI6yMkdL1/PEecxGoShab7gehvOsqvbvAsnE97vOdEbZ2mhj3VTSYEgkFgdOmRivrbPAn7k/QSIOzDCp/Lihm6pljmp5QRhI19agJqRdVAA33IYiKo2CxkGJX1/FiGMiPRy1CGKnQoXCh47hu+rkifhlIj1wXEewWp15whsS2DoWZVj8tN1guk60psM2+TAA6UpzdU7DQRbGKtHBVJETipLQTF7u2kSITK+N5SjhsbBC36M936nnCFn2r0sRV/KD1xCwK7NGBE3E7UJRDq7uZrZJ/g89pzoIstCpaGqC8oaua2WBenD4huwginLgUZi2bb0mMFfICPHdihX+wJPzMcROJxOwUUjs5KVhUqU72ArZdXAgst4yjxWSw5uh7zftLIhutO8MEc96TM5F3VWTp8XuWzUMt3+mqPtQcokKoPdnJ9BDrsgi6lv4Lhk0Jlx7xhLmffZ9hpd0/sNMa/BdqgbGoxpsj0nkw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(346002)(376002)(39860400002)(396003)(46966006)(82310400003)(34020700004)(83380400001)(47076005)(81166007)(316002)(356005)(5660300002)(966005)(6506007)(4326008)(55236004)(86362001)(82740400003)(107886003)(54906003)(6862004)(8936002)(70206006)(6486002)(33656002)(70586007)(8676002)(2616005)(36756003)(6512007)(336012)(2906002)(53546011)(478600001)(186003)(26005)(6606295002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2021 14:34:01.9354
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 42c98f47-db25-4147-6f93-08d8b7071b0d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3878

SGksDQoNCj4gT24gMTIgSmFuIDIwMjEsIGF0IDE0OjI3LCBKdWxpZW4gR3JhbGwgPGp1bGllbkB4
ZW4ub3JnPiB3cm90ZToNCj4gDQo+IA0KPiANCj4gT24gMTIvMDEvMjAyMSAxMzoyOCwgUmFodWwg
U2luZ2ggd3JvdGU6DQo+PiBIZWxsbyBKdWxpZW4sDQo+IA0KPiBIaSBSYWh1bCwNCj4gDQo+Pj4g
T24gMTIgSmFuIDIwMjEsIGF0IDExOjAwIGFtLCBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3Jn
PiB3cm90ZToNCj4+PiANCj4+PiBIaSBTdGVmYW5vLA0KPj4+IA0KPj4+IE9uIDEyLzAxLzIwMjEg
MDA6MTYsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToNCj4+Pj4gRG9uJ3QgcmVhZCBhYXJjaDMy
IHN5c3RlbSByZWdpc3RlcnMgYXQgYm9vdCB0aW1lIHdoZW4gdGhlIGFhcmNoMzIgc3RhdGUNCj4+
Pj4gaXMgbm90IGF2YWlsYWJsZS4gVGhleSBhcmUgVU5LTk9XTiwgc28gaXQgaXMgbm90IHVzZWZ1
bCB0byByZWFkIHRoZW0uDQo+Pj4+IE1vcmVvdmVyLCBvbiBDYXZpdW0gVGh1bmRlclggcmVhZGlu
ZyBJRF9QRlIyX0VMMSBjYXVzZXMgYSBYZW4gY3Jhc2guDQo+Pj4+IEluc3RlYWQsIG9ubHkgcmVh
ZCB0aGVtIHdoZW4gYWFyY2gzMiBpcyBhdmFpbGFibGUuDQo+Pj4gQUFyY2gzMiBtYXkgYmUgc3Vw
cG9ydGVkIGluIEVMMCBidXQgbm90IGluIEVMMS4gU28gSSB0aGluayB5b3Ugd2FudCB0byBjbGFy
aWZ5IGluIHRoZSBjb21taXQgbWVzc2FnZS90aXRsZSB3aGljaCBFTCB5b3UgYXJlIHJlZmVycmlu
ZyB0by4NCj4+PiANCj4+Pj4gTGVhdmUgdGhlIGNvcnJlc3BvbmRpbmcgZmllbGRzIGluIHN0cnVj
dCBjcHVpbmZvX2FybSBzbyB0aGF0IHRoZXkNCj4+Pj4gYXJlIHJlYWQtYXMtemVybyBmcm9tIGEg
Z3Vlc3QuDQo+Pj4+IFNpbmNlIHdlIGFyZSBlZGl0aW5nIGlkZW50aWZ5X2NwdSwgYWxzbyBmaXgg
dGhlIGluZGVudGF0aW9uOiA0IHNwYWNlcw0KPj4+PiBpbnN0ZWFkIG9mIDguDQo+Pj4gDQo+Pj4g
SSB3YXMgZ29pbmcgdG8gYXNrIHRvIHNwbGl0IHRoYXQgaW4gYSBzZXBhcmF0ZSBwYXRjaC4gQnV0
IHRoZW4sIEkgbm90aWNlZCB0aGF0IGl0IGF2b2lkcyB0byBjaGFuZ2UgdGhlIGluZGVudGF0aW9u
IG9mIHRoZSBpZiBib2R5IHR3aWNlLiBTbyBJIGFtIG9rIHdpdGggdGhhdC4NCj4+PiANCj4+Pj4g
Rml4ZXM6IDljZmRiNDg5YWY4MSAoInhlbi9hcm06IEFkZCBJRCByZWdpc3RlcnMgYW5kIGNvbXBs
ZXRlIGNwdWluZm8iKQ0KPj4+PiBMaW5rOiBodHRwczovL21hcmMuaW5mby8/bD14ZW4tZGV2ZWwm
bT0xNjEwMzU1MDExMTgwODYNCj4+PiANCj4+PiBOSVQ6IEkgd291bGQgc3VnZ2VzdCB0byB1c2Ug
bG9yZS5rZXJuZWwub3JnIGp1c3QgYmVjYXVzZSB0aGUgbGluayBjb250YWlucyB0aGUgbWVzc2Fn
ZS1pZC4gU28gaWYgdGhlIHdlYnNpdGUgZ29lcyBkb3duLCBpdCBpcyBzdGlsbCBwb3NzaWJsZSB0
byB0cmFjayB0aGUgb3JpZ2luYWwgZGlzY3Vzc2lvbi4NCj4+PiANCj4+Pj4gTGluazogaHR0cDov
L2xvZ3MudGVzdC1sYWIueGVucHJvamVjdC5vcmcvb3NzdGVzdC9sb2dzLzE1ODI5My90ZXN0LWFy
bTY0LWFybTY0LXhsLXhzbS9pbmZvLmh0bWwNCj4+PiANCj4+PiBJSVJDIHdlIG9ubHkga2VlcCB0
aGUgbG9ncyBhcm91bmQgZm9yIGEgY291cGxlIG9mIHdlZWtzLiBTbyB0aGlzIGlzIGdvaW5nIHRv
IGJlIGJyZWFrIHF1aWNrbHkuIFRoZXJlZm9yZSwgSSB3b3VsZCBzdWdnZXN0IHRvIHJlbW92ZSB0
aGlzIGxpbmsuDQo+Pj4gDQo+Pj4+IFN1Z2dlc3RlZC1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW5A
eGVuLm9yZz4NCj4+Pj4gU2lnbmVkLW9mZi1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzdGVmYW5v
LnN0YWJlbGxpbmlAeGlsaW54LmNvbT4NCj4+Pj4gLS0tDQo+Pj4+ICB4ZW4vYXJjaC9hcm0vY3B1
ZmVhdHVyZS5jIHwgMzUgKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0NCj4+Pj4g
IDEgZmlsZSBjaGFuZ2VkLCAyMSBpbnNlcnRpb25zKCspLCAxNCBkZWxldGlvbnMoLSkNCj4+Pj4g
ZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9jcHVmZWF0dXJlLmMgYi94ZW4vYXJjaC9hcm0vY3B1
ZmVhdHVyZS5jDQo+Pj4+IGluZGV4IDY5OGJmYTAyMDEuLmIxYzgyYWRlNDkgMTAwNjQ0DQo+Pj4+
IC0tLSBhL3hlbi9hcmNoL2FybS9jcHVmZWF0dXJlLmMNCj4+Pj4gKysrIGIveGVuL2FyY2gvYXJt
L2NwdWZlYXR1cmUuYw0KPj4+PiBAQCAtMTAxLDI5ICsxMDEsMzUgQEAgaW50IGVuYWJsZV9ub25i
b290X2NwdV9jYXBzKGNvbnN0IHN0cnVjdCBhcm1fY3B1X2NhcGFiaWxpdGllcyAqY2FwcykNCj4+
Pj4gICAgdm9pZCBpZGVudGlmeV9jcHUoc3RydWN0IGNwdWluZm9fYXJtICpjKQ0KPj4+PiAgew0K
Pj4+PiAtICAgICAgICBjLT5taWRyLmJpdHMgPSBSRUFEX1NZU1JFRyhNSURSX0VMMSk7DQo+Pj4+
IC0gICAgICAgIGMtPm1waWRyLmJpdHMgPSBSRUFEX1NZU1JFRyhNUElEUl9FTDEpOw0KPj4+PiAr
ICAgIGJvb2wgYWFyY2gzMiA9IHRydWU7DQo+Pj4+ICsNCj4+Pj4gKyAgICBjLT5taWRyLmJpdHMg
PSBSRUFEX1NZU1JFRyhNSURSX0VMMSk7DQo+Pj4+ICsgICAgYy0+bXBpZHIuYml0cyA9IFJFQURf
U1lTUkVHKE1QSURSX0VMMSk7DQo+Pj4+ICAgICNpZmRlZiBDT05GSUdfQVJNXzY0DQo+Pj4+IC0g
ICAgICAgIGMtPnBmcjY0LmJpdHNbMF0gPSBSRUFEX1NZU1JFRyhJRF9BQTY0UEZSMF9FTDEpOw0K
Pj4+PiAtICAgICAgICBjLT5wZnI2NC5iaXRzWzFdID0gUkVBRF9TWVNSRUcoSURfQUE2NFBGUjFf
RUwxKTsNCj4+Pj4gKyAgICBjLT5wZnI2NC5iaXRzWzBdID0gUkVBRF9TWVNSRUcoSURfQUE2NFBG
UjBfRUwxKTsNCj4+Pj4gKyAgICBjLT5wZnI2NC5iaXRzWzFdID0gUkVBRF9TWVNSRUcoSURfQUE2
NFBGUjFfRUwxKTsNCj4+Pj4gKw0KPj4+PiArICAgIGMtPmRiZzY0LmJpdHNbMF0gPSBSRUFEX1NZ
U1JFRyhJRF9BQTY0REZSMF9FTDEpOw0KPj4+PiArICAgIGMtPmRiZzY0LmJpdHNbMV0gPSBSRUFE
X1NZU1JFRyhJRF9BQTY0REZSMV9FTDEpOw0KPj4+PiAgLSAgICAgICAgYy0+ZGJnNjQuYml0c1sw
XSA9IFJFQURfU1lTUkVHKElEX0FBNjRERlIwX0VMMSk7DQo+Pj4+IC0gICAgICAgIGMtPmRiZzY0
LmJpdHNbMV0gPSBSRUFEX1NZU1JFRyhJRF9BQTY0REZSMV9FTDEpOw0KPj4+PiArICAgIGMtPmF1
eDY0LmJpdHNbMF0gPSBSRUFEX1NZU1JFRyhJRF9BQTY0QUZSMF9FTDEpOw0KPj4+PiArICAgIGMt
PmF1eDY0LmJpdHNbMV0gPSBSRUFEX1NZU1JFRyhJRF9BQTY0QUZSMV9FTDEpOw0KPj4+PiAgLSAg
ICAgICAgYy0+YXV4NjQuYml0c1swXSA9IFJFQURfU1lTUkVHKElEX0FBNjRBRlIwX0VMMSk7DQo+
Pj4+IC0gICAgICAgIGMtPmF1eDY0LmJpdHNbMV0gPSBSRUFEX1NZU1JFRyhJRF9BQTY0QUZSMV9F
TDEpOw0KPj4+PiArICAgIGMtPm1tNjQuYml0c1swXSAgPSBSRUFEX1NZU1JFRyhJRF9BQTY0TU1G
UjBfRUwxKTsNCj4+Pj4gKyAgICBjLT5tbTY0LmJpdHNbMV0gID0gUkVBRF9TWVNSRUcoSURfQUE2
NE1NRlIxX0VMMSk7DQo+Pj4+ICsgICAgYy0+bW02NC5iaXRzWzJdICA9IFJFQURfU1lTUkVHKElE
X0FBNjRNTUZSMl9FTDEpOw0KPj4+PiAgLSAgICAgICAgYy0+bW02NC5iaXRzWzBdICA9IFJFQURf
U1lTUkVHKElEX0FBNjRNTUZSMF9FTDEpOw0KPj4+PiAtICAgICAgICBjLT5tbTY0LmJpdHNbMV0g
ID0gUkVBRF9TWVNSRUcoSURfQUE2NE1NRlIxX0VMMSk7DQo+Pj4+IC0gICAgICAgIGMtPm1tNjQu
Yml0c1syXSAgPSBSRUFEX1NZU1JFRyhJRF9BQTY0TU1GUjJfRUwxKTsNCj4+Pj4gKyAgICBjLT5p
c2E2NC5iaXRzWzBdID0gUkVBRF9TWVNSRUcoSURfQUE2NElTQVIwX0VMMSk7DQo+Pj4+ICsgICAg
Yy0+aXNhNjQuYml0c1sxXSA9IFJFQURfU1lTUkVHKElEX0FBNjRJU0FSMV9FTDEpOw0KPj4+PiAg
LSAgICAgICAgYy0+aXNhNjQuYml0c1swXSA9IFJFQURfU1lTUkVHKElEX0FBNjRJU0FSMF9FTDEp
Ow0KPj4+PiAtICAgICAgICBjLT5pc2E2NC5iaXRzWzFdID0gUkVBRF9TWVNSRUcoSURfQUE2NElT
QVIxX0VMMSk7DQo+Pj4+ICsgICAgYy0+emZyNjQuYml0c1swXSA9IFJFQURfU1lTUkVHKElEX0FB
NjRaRlIwX0VMMSk7DQo+Pj4+ICAtICAgICAgICBjLT56ZnI2NC5iaXRzWzBdID0gUkVBRF9TWVNS
RUcoSURfQUE2NFpGUjBfRUwxKTsNCj4+Pj4gKyAgICBhYXJjaDMyID0gYy0+cGZyNjQuZWwxID09
IDI7DQo+Pj4gDQo+Pj4gVGhpcyBpcyBjaGVja2luZyB0aGF0IEFBcmNoMzIgaXMgYXZhaWxhYmxl
IGluIEVMMS4gSG93ZXZlciwgaXQgbWF5IG5vdCBiZSB0aGUgY2FzZSB5ZXQgaXQgd291bGQgYmUg
YXZhaWxhYmxlIGluIEVMMC4NCj4+IEFzIHBlciBteSB1bmRlcnN0YW5kaW5nIHBsZWFzZSBjb3Jy
ZWN0IG1lIGlmIEkgYW0gd3JvbmcsIGlmIEFBcmNoMzIgaXMgYWxsb3dlZCBhdCBhbiBFTCwgaXQg
bXVzdCBiZSBhbGxvd2VkIGFsbCBsb3dlciBFeGNlcHRpb24gbGV2ZWxzLg0KPiANCj4gVGhpcyBz
dGF0ZW1lbnQgaXMgY29ycmVjdC4NCj4gDQo+PiBGb3IgZXhhbXBsZSwgaWYgRUwzIGFsbG93cyBB
QXJjaDMyLCB0aGVuIGl0IG11c3QgYmUgYWxsb3dlZCBhdCBhbGwgbG93ZXIgRXhjZXB0aW9uIGxl
dmVscy5UaGF0IG1lYW5zIGlmIHdlIGFyZSBjaGVja2luZyB0aGUgRUwxIGZvciBBQXJjaDMyIEVM
MCBzaG91bGQgYWxzbyBzdXBwb3J0IEFBcmNoMzIuDQo+PiBJIHRoaW5rICAiYWFyY2gzMiA9IGMt
PnBmcjY0LmVsMSA9PSAy4oCdIGlzIGNvcnJlY3QgdG8gY2hlY2suDQo+IA0KPiBJIGFncmVlIHRo
YXQgaWYgRUwxIHN1cHBvcnRzIEFBcmNoMzIsIHRoZW4gaXQgbWVhbnMgRUwwIHdpbGwgbm90IHN1
cHBvcnQuDQo+IA0KPiBIb3dldmVyLCBpZiBFTDEgZG9lc24ndCBzdXBwb3J0IEFBcmNoMzIsIHRo
ZW4gaXQgZG9lc24ndCBpbXBseSB0aGF0IEVMMCB3aWxsIG5vdCBzdXBwb3J0IEFBcmNoMzIuDQo+
IA0KPiBUaGVyZWZvcmUsIHRoZSBjaGVjayBzdWdnZXN0ZWQgd291bGQgbm90IGJlIGNvcnJlY3Qg
YmVjYXVzZSBpdCB3b3VsZCBwcmV2ZW50IDMyLWJpdCB1c2Vyc3BhY2UgcnVubmluZyBvbiBIVyAo
c3VjaCBhcyBJSVJDIENvcnRleC1BNzYpIHRoYXQgb25seSBzdXBwb3J0IEFBcmNoMzIgaW4gRUww
Lg0KDQpJIGFncmVlIHdpdGggdGhpcywgd2Ugc2hvdWxkIGNoZWNrIGFhcmNoMzIgYXQgRUwwIGFz
IGlmIGl0IGlzIG5vdCBzdXBwb3J0ZWQgdGhlcmUgaXQgaXMgbm90IHN1cHBvcnRlZCBhdCBhbGwg
YW5kIHRoZSB0aGUgcmVnaXN0ZXJzIHNob3VsZCBub3QgYmUgbmVlZGVkLg0KSWYgaXQgaXMgc3Vw
cG9ydGVkIGluIEVMMCwgd2V0aGVyIG9yIG5vdCBpdCBpcyBzdXBwb3J0ZWQgYXQgbG93ZXIgbGV2
ZWwsIHdlIG5lZWQgdG8gcmVhZCB0aG9zZSByZWdpc3RlcnMuDQoNClNvIHdlIHNob3VsZCBjaGVj
ayBwZnI2NC5lbDAgaW5zdGVhZC4NCg0KQ2hlZXJzDQpCZXJ0cmFuZA0KDQo+IA0KPiBDaGVlcnMs
DQo+IA0KPiAtLSANCj4gSnVsaWVuIEdyYWxsDQoNCg==

