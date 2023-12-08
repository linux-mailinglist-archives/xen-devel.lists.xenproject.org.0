Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D38680A32F
	for <lists+xen-devel@lfdr.de>; Fri,  8 Dec 2023 13:28:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.650615.1016314 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBZxG-0004tq-It; Fri, 08 Dec 2023 12:27:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 650615.1016314; Fri, 08 Dec 2023 12:27:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBZxG-0004rp-G2; Fri, 08 Dec 2023 12:27:42 +0000
Received: by outflank-mailman (input) for mailman id 650615;
 Fri, 08 Dec 2023 12:27:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1wyI=HT=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1rBZxE-0004rj-Ht
 for xen-devel@lists.xenproject.org; Fri, 08 Dec 2023 12:27:40 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20601.outbound.protection.outlook.com
 [2a01:111:f403:260e::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2c91b494-95c5-11ee-98e8-6d05b1d4d9a1;
 Fri, 08 Dec 2023 13:27:38 +0100 (CET)
Received: from AS9PR05CA0198.eurprd05.prod.outlook.com (2603:10a6:20b:495::27)
 by PR3PR08MB5802.eurprd08.prod.outlook.com (2603:10a6:102:8a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.28; Fri, 8 Dec
 2023 12:27:35 +0000
Received: from AMS0EPF00000192.eurprd05.prod.outlook.com
 (2603:10a6:20b:495:cafe::c7) by AS9PR05CA0198.outlook.office365.com
 (2603:10a6:20b:495::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34 via Frontend
 Transport; Fri, 8 Dec 2023 12:27:35 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF00000192.mail.protection.outlook.com (10.167.16.218) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7068.20 via Frontend Transport; Fri, 8 Dec 2023 12:27:34 +0000
Received: ("Tessian outbound 5d213238733f:v228");
 Fri, 08 Dec 2023 12:27:34 +0000
Received: from 1205b954b2ce.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8901A88E-174F-438E-99F0-028C6E70B8DC.1; 
 Fri, 08 Dec 2023 12:27:22 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1205b954b2ce.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 08 Dec 2023 12:27:22 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS4PR08MB8242.eurprd08.prod.outlook.com (2603:10a6:20b:51e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.28; Fri, 8 Dec
 2023 12:27:20 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::c64b:7a3:ac99:25db]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::c64b:7a3:ac99:25db%2]) with mapi id 15.20.7068.027; Fri, 8 Dec 2023
 12:27:20 +0000
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
X-Inumbo-ID: 2c91b494-95c5-11ee-98e8-6d05b1d4d9a1
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=dMaLZ8+fv7PrTCKmW7hPBqXtpbKaXlbAtta3bA3rOiLIHi0Sn7/wjDy07FThifKjVYgBcQ7P9AR0BC4PcK0lwsRo36ivY5OWwhEmGBl2Lxh4D6wGA+XFRq/1fm3S9AYgs+qcns2ZIkDwD7sj9wBkSDKctw29O2umQJI4uKOmyKbxjGMwgY2fpz0SBPTrBtjv2MGyGBuZX0QIoel5iE3EpCCkTZgqizpqTn8mxBErGZX0I/hP/jazHNmh1b/ar+mx9UvCvbVC82GOnEOvhyjnZfUukEH4edAyUl1LW0uORggoDpX5xhzpQ2aTwyXndGcB5HL/I/jIfj26HfCccYJVvw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8RRSNwxFwIjpdjXh6Vx1T6HIBiH4SEPVJTSS7gCkaj0=;
 b=BL5IsrFO6Wg/9+X7n5gF6R190+SjCcHVrkIvxszGlExCGLctuJFhtwPnq5CdKm/U7xstyPbET2v1IaTDaCp6wsqfbtveq6FV0Ip9wWSWQ7nz/3cbKoB5yuLrBH3b9Rcd3qRIFbGC1rUQG3HFn+aqaOsCLEc/O2iOWfNimWaiURjO+1fxnInra8wDdma5+IDFSdoZxNKPhBvxTXjWBvmYrYEnqVnYtWmneNWgeDdgKI9g0n2g/5H+Suarx9yaEA9MU5d1mIP5nd8njK2Rn/vZHkRzBGluFa8HjVVsHLWdqGnBChVB8vv7GHuy0MogpgFg1zJWsKYhODsjk/E+5bRX/g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8RRSNwxFwIjpdjXh6Vx1T6HIBiH4SEPVJTSS7gCkaj0=;
 b=i17/XVRydtYId9nHDhfxt5I1kqs/9TmG9WVC693AlE5BdFnY3/QzoWsOsUQAym9Ab875IZ2UZgng9oYU7g0QKuj9seHvgGxtRKKYgWEigPdyUT6tHD6JTO08XTE2YZulCYgpjUhe63yPrKa5jjXYodXEMfRjhKa1k0bnJ2Ipeig=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: d477937583d0c918
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hax8M2ysZMcb2a/RcFStzHBrcZYmKEwvn5ivbdGbv6OETySo+BbrAr5SJ9nmZ2Ka4Tx1af7Z66hoRQ4C5UASJ+AH9iyFq1P9TP3vJQLszI9HO5XD+M0lMwPWAO4zq4943sOtgUdloWt0RvqevgQAlVoElal8aFve+4aSz6TL29w0C5tmJz9uPr4rBWiZM1ramdkawDXK7WE6xWcu2OO9LE2GWJ3wiFtNNCUgy/cKoR6VGE36wAiAAvuW5hSeGK5GrsRmAeUlg2Zvn5cXXomrtFTzhj3MicN4p9+Yp9xFi/UO5N0jf1bXdMv6glQrLwOTWuvWtAurZSgnUCPVTMKKVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8RRSNwxFwIjpdjXh6Vx1T6HIBiH4SEPVJTSS7gCkaj0=;
 b=VeYBTwbdDIU1pVgWa9K4fBynjEh8Y5SGGsI1MKMELW4DhmYY/6TOIeX8TjKbxlrRceJCF/Esb17w+/T5Cn1wBOqUg76lQNl7kRz2TepjICbdwUraB6k1krWth7pIFEE4YMU4oCvGOQUldbxaJiWtsqDN3DigUXYnac8kf+QIY8E02CdA3CFJ1ZJtJh9+Cx5aMuOsWeicoXAShfhq1hx7kK/OGRNQm8UkJqVn6zRDsGb620omkCpHNay4iAUKufp5cBTYOQRqz33XDMMgoeZ5YDKgLOVxeoA/hzM7kC0Vx1YcABBw1o3r1ce+Ru/XYSBu5lSp8HqC74x7M9ueUsLvrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8RRSNwxFwIjpdjXh6Vx1T6HIBiH4SEPVJTSS7gCkaj0=;
 b=i17/XVRydtYId9nHDhfxt5I1kqs/9TmG9WVC693AlE5BdFnY3/QzoWsOsUQAym9Ab875IZ2UZgng9oYU7g0QKuj9seHvgGxtRKKYgWEigPdyUT6tHD6JTO08XTE2YZulCYgpjUhe63yPrKa5jjXYodXEMfRjhKa1k0bnJ2Ipeig=
From: Henry Wang <Henry.Wang@arm.com>
To: Wei Chen <Wei.Chen@arm.com>, Michal Orzel <michal.orzel@amd.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Doug Goldstein
	<cardoe@cardoe.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: Re: [PATCH v2 3/5] automation: Add the expect script with test case
 for FVP
Thread-Topic: [PATCH v2 3/5] automation: Add the expect script with test case
 for FVP
Thread-Index:
 AQHaKZoAVIHO2rCYDECWUL8sUR2sfLCfFe6AgAACFwCAAAHkAIAAAsIAgAAIGgCAAAGZgIAAFYMAgAAUooA=
Date: Fri, 8 Dec 2023 12:27:20 +0000
Message-ID: <53A13832-54C2-43C4-B744-3E2D5F8D773D@arm.com>
References: <20231208054637.1973424-1-Henry.Wang@arm.com>
 <20231208054637.1973424-4-Henry.Wang@arm.com>
 <213f2b46-2668-4dae-8c57-269a73eff1bb@amd.com>
 <4609F9AA-44B6-40EA-A1A5-9D677679002D@arm.com>
 <0554806a-35c2-4abb-aa3c-3bab104c6c61@amd.com>
 <B9AFD918-42F6-4190-963B-E5A639D9F60E@arm.com>
 <2f34c0ec-0d94-48e2-bec0-faa96e1702f1@amd.com>
 <9F69A6E2-2D83-46AF-8AB6-C1B409F4ADE0@arm.com>
 <6795d175-6486-44bd-b878-96535730a9bb@arm.com>
In-Reply-To: <6795d175-6486-44bd-b878-96535730a9bb@arm.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AS4PR08MB8242:EE_|AMS0EPF00000192:EE_|PR3PR08MB5802:EE_
X-MS-Office365-Filtering-Correlation-Id: 60054ddc-ab83-4cce-11e5-08dbf7e90ec2
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 F+U7y/vROjA7g+PyF6PiyS+CTeGPaj9ruUYnJSx6iKcgeFoUDgBhPzSNXXVl6DXp8igrjWR1fq70/GmDHbiEOifHCl2edBa9+tUbY4ylluTzw741IProrKn6sCKzQuPEaOrUrHrm4XnzebMQuyRCmn0+5EMkrvVQwbNrYPpFW5luvb50R/UpiNZL65VJ+oZBtfAncX89pbx9p2qOjwOuBcGpmH15+f5ysVjhamJFEetIDPklCmGVVO8JwAUb9a3vs4IIXdlXb3Z80YiZ9RHBCCht+e9hO1rY3aHSdqTGnMzkTBVzjhhjTlWDdastGQTvn+WpjbuoPiRy4ZshcnJR9TqpA2FbW0+fc6jaEgIz4lmoW584D+PP097zoImRUZLQxl3RWj7tqb83KGzBvgvUzV5QcjZFxcBHQiRGHs2YtB77ctZ8ga9NpN2XEBKjcIDxL8RSIV0tb9QQpd2U4z5NpQlP2U8RtHfL2zZ0oEMhzlU09Ai3+wKgHfBJzi6Kj1+nNrni8Z1q8RNT3VK947rnDkL6eTAYTm03OjIwOPNf5sIhI8RHtFYw5x4TmjRP6QrT02ekGeMeFb28iV/8ntPd3kuzg0JWTU2AJ/V79ZsE5VIG7LpjnECw2rslkC86LvCXaMxvu1rcZ5dq5pNTDY8sZQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(346002)(396003)(136003)(376002)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(5660300002)(2906002)(4326008)(8936002)(8676002)(36756003)(86362001)(38070700009)(41300700001)(83380400001)(2616005)(6512007)(26005)(91956017)(66446008)(64756008)(66946007)(76116006)(66476007)(54906003)(66556008)(110136005)(316002)(38100700002)(71200400001)(53546011)(6506007)(33656002)(122000001)(6486002)(478600001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <71D44A3BDBB42A489785074E224D3C90@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB8242
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF00000192.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6e17a13d-9248-4d70-455e-08dbf7e9060b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mFvNSaswZS0KL0QlqCi1aolLutzoRRlEkVozEtjAHRNPIAo9AWoGK4dfw9sfnoBLKJsKkfIHjjJy6YNj1eJj+VQ0/uUoMK9wkA/zKp6N81ZqqWLBA+Q+5tzPYTGlW5DdslWlmI1sW6sGroRsMhgmJPdgHnUjTWjRjY3svU8VYbzKe/qL4orP4VZUV1wWPgg6askjcNxiVUueOOQSuQtY9qrvGRaKNNITYZhMXSq7Fq0SEbyyfERD/8dK66xjxmuFY9H+g3LQwz30yw5m78QdtFenA+mTi0ScWCgwoUHEu+groQsg33faWri8sVpwdiSieGAfK4PVG9IB2QFEvXyY6I1DNgqXTa7xlRgNYjGq+Ig/ZrDqV6BUQlE2Y1qPxDajc8194rnNYfK1bDUw+fKq1EacNFZi33P8neWH/8HSqPYlqrNwLzDDspB5Nm4kiv7jpDKmwp/iE9Ju0gQn6vwc9efwju5e0GmxH0KSOnMgul9YnQB2v/rhTOG0cxxs9GLbcQEhhYUdXj2zf/M+JjCI8tVxsp9gajpE57X1lENEig6NIw81Chfh/B42mqruGZb6KJ08nLmtt38LVWKsfES1+I1SEB21uc1hp5VmcEgz8kDbYCgaSHSbshYMkABb/9SbKKN6bLFmZ3H86lz/F8Jhlbagcl5XM15eU1DT3yzQZB+QQt7fgOl+RiJ98LM0Q3JvWMss8bWtH+5/4w7uTw7uRAACEA2kS1AYbyJg5tgry9XDAE5xaNm6UcMNrXsxcDuq
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(39860400002)(136003)(376002)(396003)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(82310400011)(46966006)(36840700001)(40470700004)(2906002)(36756003)(4326008)(8936002)(8676002)(5660300002)(41300700001)(82740400003)(40480700001)(36860700001)(47076005)(26005)(336012)(2616005)(83380400001)(33656002)(356005)(81166007)(86362001)(478600001)(110136005)(40460700003)(316002)(6506007)(70206006)(70586007)(6486002)(54906003)(6512007)(53546011);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2023 12:27:34.9472
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 60054ddc-ab83-4cce-11e5-08dbf7e90ec2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF00000192.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5802

SGkgV2VpLCBNaWNoYWwsDQoNCj4gT24gRGVjIDgsIDIwMjMsIGF0IDE5OjEzLCBXZWkgQ2hlbiA8
V2VpLkNoZW5AYXJtLmNvbT4gd3JvdGU6DQo+IA0KPiBIaSBIZW5yeSBhbmQgTWljaGFsLA0KPiAN
Cj4+Pj4+Pj4gT24gMDgvMTIvMjAyMyAwNjo0NiwgSGVucnkgV2FuZyB3cm90ZToNCj4+Pj4+Pj4+
IGRpZmYgLS1naXQgYS9hdXRvbWF0aW9uL3NjcmlwdHMvZXhwZWN0L2Z2cC1iYXNlLXNtb2tlLWRv
bTAtYXJtNjQuZXhwIGIvYXV0b21hdGlvbi9zY3JpcHRzL2V4cGVjdC9mdnAtYmFzZS1zbW9rZS1k
b20wLWFybTY0LmV4cA0KPj4+Pj4+Pj4gbmV3IGZpbGUgbW9kZSAxMDA3NTUNCj4+Pj4+Pj4+IGlu
ZGV4IDAwMDAwMDAwMDAuLjI1ZDlhNWY4MWMNCj4+Pj4+Pj4+IC0tLSAvZGV2L251bGwNCj4+Pj4+
Pj4+ICsrKyBiL2F1dG9tYXRpb24vc2NyaXB0cy9leHBlY3QvZnZwLWJhc2Utc21va2UtZG9tMC1h
cm02NC5leHANCj4+Pj4+Pj4+IEBAIC0wLDAgKzEsNzMgQEANCj4+Pj4+Pj4+ICsjIS91c3IvYmlu
L2V4cGVjdA0KPj4+Pj4+Pj4gKw0KPj4+Pj4+Pj4gK3NldCB0aW1lb3V0IDIwMDANCj4+Pj4+Pj4g
RG8gd2UgcmVhbGx5IG5lZWQgc3VjaCBhIGJpZyB0aW1lb3V0ICh+MzAgbWluKT8NCj4+Pj4+Pj4g
TG9va2luZyBhdCB5b3VyIHRlc3Qgam9iLCBpdCB0b29rIDE2IG1pbnMgKHF1aXRlIGEgbG90IGJ1
dCBJIGtub3cgRlZQIGlzIHNsb3cNCj4+Pj4+Pj4gKyBzZW5kX3Nsb3cgc2xvd3MgdGhpbmdzIGRv
d24pDQo+Pj4+Pj4gDQo+Pj4+Pj4gVGhpcyBpcyBhIHJlYWxseSBnb29kIHF1ZXN0aW9uLiBJIGRp
ZCBoYXZlIHRoZSBzYW1lIHF1ZXN0aW9uIHdoaWxlIHdvcmtpbmcgb24NCj4+Pj4+PiB0aGUgbmVn
YXRpdmUgdGVzdCB0b2RheS4gVGhlIHRpbWVvdXQgMjAwMCBpbmRlZWQgd2lsbCBmYWlsIHRoZSBq
b2IgYXQgYWJvdXQgMzBtaW4sDQo+Pj4+Pj4gYW5kIHdhaXRpbmcgZm9yIGl0IGlzIGluZGVlZCBu
b3QgcmVhbGx5IHBsZWFzYW50Lg0KPj4+Pj4+IA0KPj4+Pj4+IEJ1dCBteSBzZWNvbmQgdGhvdWdo
dCB3b3VsZCBiZSAtIGZyb20gbXkgb2JzZXJ2YXRpb24sIHRoZSBvdmVyYWxsIHRpbWUgbm93DQo+
Pj4+Pj4gd291bGQgdmFyeSBiZXR3ZWVuIDE1bWluIH4gMjBtaW4sIGFuZCBoYXZpbmcgYSAxMG1p
biBtYXJnaW4gaXMgbm90IHRoYXQgY3JhenkNCj4+Pj4+PiBnaXZlbiB0aGF0IHdlIHByb2JhYmx5
IHdpbGwgZG8gbW9yZSB0ZXN0aW5nIGZyb20gdGhlIGpvYiBpbiB0aGUgZnV0dXJlLCBhbmQgaWYg
dGhlDQo+Pj4+Pj4gR2l0TGFiIEFybSB3b3JrZXIgaXMgaGlnaCBsb2FkZWQsIEZWUCB3aWxsIHBy
b2JhYmx5IGJlY29tZSBzbG93ZXIuIEFuZCBub3JtYWxseQ0KPj4+Pj4+IHdlIGRvbuKAmXQgZXZl
biB0cmlnZ2VyIHRoZSB0aW1lb3V0IGFzIHRoZSBqb2Igd2lsbCBub3JtYWxseSBwYXNzLiBTbyBJ
IGRlY2lkZWQNCj4+Pj4+PiB0byBrZWVwIHRoaXMuDQo+Pj4+Pj4gDQo+Pj4+Pj4gTWluZCBzaGFy
aW5nIHlvdXIgdGhvdWdodHMgYWJvdXQgdGhlIGJldHRlciB2YWx1ZSBvZiB0aGUgdGltZW91dD8g
UHJvYmFibHkgMjVtaW4/DQo+Pj4+PiBGcm9tIHdoYXQgeW91IHNhaWQgdGhhdCB0aGUgYXZlcmFn
ZSBpcyAxNS0yMCwgSSB0aGluayB3ZSBjYW4gbGVhdmUgaXQgc2V0IHRvIDMwLg0KPj4+Pj4gQnV0
IEkgd29uZGVyIGlmIHdlIGNhbiBkbyBzb21ldGhpbmcgdG8gZGVjcmVhc2UgdGhlIGF2ZXJhZ2Ug
dGltZS4gfjIwIG1pbiBpcyBhIGxvdA0KPj4+Pj4gZXZlbiBmb3IgRlZQIDopIEhhdmUgeW91IHRy
aWVkIHNldHRpbmcgc2VuZF9zbG93IHRvIHNvbWV0aGluZyBsb3dlciB0aGFuIDEwMG1zPw0KPj4+
Pj4gVGhhdCBzYWlkLCB3ZSBkb24ndCBzZW5kIHRvbyBtYW55IGNoYXJzIHRvIEZWUCwgc28gSSBk
b3VidCBpdCB3b3VsZCBwbGF5IGEgbWFqb3Igcm9sZQ0KPj4+Pj4gaW4gdGhlIG92ZXJhbGwgdGlt
ZS4NCj4+Pj4gDQo+Pj4+IEkgYWdyZWUgd2l0aCB0aGUgc2VuZF9zbG93IHBhcnQuIEFjdHVhbGx5
IEkgZG8gaGF2ZSB0aGUgc2FtZSBjb25jZXJuLCBoZXJlIGFyZSBteSBjdXJyZW50DQo+Pj4+IHVu
ZGVyc3RhbmRpbmcgYW5kIEkgdGhpbmsgeW91IHdpbGwgZGVmaW5pdGVseSBoZWxwIHdpdGggeW91
ciBrbm93bGVkZ2U6DQo+Pj4+IElmIHlvdSBjaGVjayB0aGUgZnVsbCBsb2cgb2YgRG9tMCBib290
aW5nLCBmb3IgZXhhbXBsZSBbMV0sIHlvdSB3aWxsIGZpbmQgdGhhdCB3ZSB3YXN0ZWQgc28NCj4+
Pj4gbXVjaCB0aW1lIGluIHN0YXJ0aW5nIHRoZSBzZXJ2aWNlcyBvZiB0aGUgT1MgKG1vZGxvb3As
IHVkZXYtc2V0dGxlLCBldGMpLiBBbGwgb2YgdGhlc2Ugc2VydmljZXMNCj4+Pj4gYXJlIHJldHJp
ZWQgbWFueSB0aW1lcyBidXQgaW4gdGhlIGVuZCB0aGV5IGFyZSBzdGlsbCBub3QgdXAsIGFuZCBm
cm9tIG15IHVuZGVyc3RhbmRpbmcgdGhleQ0KPj4+PiB3b27igJl0IGFmZmVjdCB0aGUgYWN0dWFs
IHRlc3QoPykgSWYgd2UgY2FuIHNvbWVob3cgZ2V0IHJpZCBvZiB0aGVzZSBzZXJ2aWNlcyBmcm9t
IHJvb3RmcywgSSB0aGluaw0KPj4+PiB3ZSBjYW4gc2F2ZSBhIGxvdCBvZiB0aW1lLg0KPj4+PiAN
Cj4+Pj4gQW5kIGhvbmVzdGx5LCBJIG5vdGljZWQgdGhhdCBxZW11LWFscGluZS1hcm02NC1nY2Mg
c3VmZmVycyBmcm9tIHRoZSBzYW1lIHByb2JsZW0gYW5kIGl0IGFsc28NCj4+Pj4gdGFrZXMgYXJv
dW5kIDE1bWluIHRvIGZpbmlzaC4gU28gaWYgd2UgbWFuYWdlZCB0byB0YWlsb3IgdGhlIHNlcnZp
Y2VzIGZyb20gdGhlIGZpbGVzeXN0ZW0sIHdlDQo+Pj4+IGNhbiBzYXZlIGEgbG90IG9mIHRpbWUu
DQo+Pj4gVGhhdCBpcyBub3QgdHJ1ZS4gUWVtdSBydW5zIHRoZSB0ZXN0cyByZWxhdGl2ZWx5IGZh
c3Qgd2l0aGluIGZldyBtaW51dGVzLiBUaGUgcmVhc29uIHlvdSBzZWUgZS5nLiAxMiBtaW5zDQo+
Pj4gZm9yIHNvbWUgUWVtdSBqb2JzIGNvbWVzIGZyb20gdGhlIHRpbWVvdXQgd2Ugc2V0IGluIFFl
bXUgc2NyaXB0cy4gV2UgZG9uJ3QgaGF2ZSB5ZXQgdGhlIHNvbHV0aW9uICh3ZSBjb3VsZA0KPj4+
IGRvIHRoZSBzYW1lIGFzIFF1YmVzIHNjcmlwdCkgdG8gZGV0ZWN0IHRoZSB0ZXN0IHN1Y2Nlc3Mg
ZWFybHkgYW5kIGV4aXQgYmVmb3JlIHRpbWVvdXQuIFRoYXQgaXMgd2h5IGN1cnJlbnRseQ0KPj4+
IHRoZSBvbmx5IHdheSBmb3IgUWVtdSB0ZXN0cyB0byBmaW5pc2ggaXMgYnkgcmVhY2hpbmcgdGhl
IHRpbWVvdXQuDQo+Pj4gDQo+Pj4gU28gdGhlIHByb2JsZW0gaXMgbm90IHdpdGggdGhlIHJvb3Rm
cyBhbmQgc2VydmljZXMgKHRoZSBpbXByb3ZlbWVudCB3b3VsZCBub3QgYmUgc2lnbmlmaWNhbnQp
IGJ1dCB3aXRoDQo+Pj4gdGhlIHNpbXVsYXRpb24gYmVpbmcgc2xvdy4gVGhhdCBzYWlkLCB0aGlz
IGlzIHNvbWV0aGluZyB3ZSBhbGwga25vdyBhbmQgSSBleHBlY3QgRlZQIHRvIG9ubHkgYmUgdXNl
ZCBpbiBzY2VuYXJpb3MNCj4+PiB3aGljaCBjYW5ub3QgYmUgdGVzdGVkIHVzaW5nIFFlbXUgb3Ig
cmVhbCBIVy4NCj4+IE9rLCB5b3UgbWFkZSBhIHBvaW50LiBMZXQgbWUgZG8gc29tZSBleHBlcmlt
ZW50cyB0byBzZWUgaWYgSSBjYW4gaW1wcm92ZS4gT3RoZXJ3aXNlIG1heWJlDQo+PiB3ZSBjYW4g
bGl2ZSB3aXRoIHRoaXMgdW50aWwgYSBiZXR0ZXIgc29sdXRpb24uDQo+PiBLaW5kIHJlZ2FyZHMs
DQo+PiBIZW5yeQ0KPiANCj4gUUVNVSB3b3JrcyBsaWtlIEZWUCBlbmFibGVkIHVzZV9yZWFsX3Rp
bWUgZmxhZy4gSG93IGFib3V0IGVuYWJsZSB1c2VfcmVhbF90aW1lIGZsYWcgaW4gQ0kgZm9yIG1v
c3QgdGVzdCBjYXNlcywgYnV0IGRpc2FibGUgaXQgZm9yDQo+IHNvbWUgdGltZSBzZW5zaXRpdmUg
dGVzdCBjYXNlcz8gTm9ybWFsbHksIGVuYWJsZSB1c2VfcmVhbF90aW1lDQo+IHdpbGwgZ2l2ZSBz
ZXZlcmFsIHRpbWVzIGltcHJvdmVtZW50IG9mIEZWUCBwZXJmb3JtYW5jZS4NCg0KSSBhbSBzZWVp
bmcgYmVsb3cgZnJvbSB0aGUgRlZQIHBhcmFtZXRlciBsaXN0cyBvZiB0aGUgb25lIHdlIGFyZSBj
dXJyZW50bHkgdXNpbmcuIFRoZSAiRGVwcmVjYXRlZCIgd29yZCB3b3JyaWVzDQptZSBhIGJpdCAo
dGhlIG9sZCB2ZXJzaW9uIEZWUCBkb2VzIG5vdCBoYXZlIHRoZSDigJxEZXByZWNhdGVkIiB0aG91
Z2gpLg0KYGBgDQpicC5yZWZjb3VudGVyLnVzZV9yZWFsX3RpbWU9MCAgICAgICAgICAgICAgICAg
ICAgICAgICAjIChib29sICAsIGluaXQtdGltZSkgZGVmYXVsdCA9ICcwJyAgICAgIDogKipEZXBy
ZWNhdGVkLCB0aGlzIHBhcmFtZXRlciB3aWxsIGJlIHJlbW92ZWQgaW4gZnV0dXJlIHZlcnNpb25z
KiogVXBkYXRlIHRoZSBHZW5lcmljIFRpbWVyIGNvdW50ZXIgYXQgYSByZWFsLXRpbWUgYmFzZSBm
cmVxdWVuY3kgaW5zdGVhZCBvZiBzaW11bGF0b3IgdGltZQ0KYGBgDQoNCkFsc28sIGZyb20gbXkg
dGVzdGluZyBpbiB0aGUgR2l0TGFiIHBpcGVsaW5lLCBJIHdhcyBub3QgYWJsZSB0byBzZWUgc2ln
bmlmaWNhbnQgdGltZSBpbXByb3ZlbWVudC4gU28gSSBndWVzcw0KaW5zdGVhZCBJIHdpbGwgdHJ5
IHdoYXQgSnVsaWVuIHN1Z2dlc3RzIHRvIHNlZSBpZiB0aGluZ3MgY2FuIGJlIGJldHRlci4NCg0K
S2luZCByZWdhcmRzLA0KSGVucnkgDQoNCj4gDQo+IENoZWVycywNCj4gV2VpIENoZW4NCj4gDQo+
Pj4gDQo+Pj4gfk1pY2hhbA0KDQo=

