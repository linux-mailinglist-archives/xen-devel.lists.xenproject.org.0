Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA00578FD0
	for <lists+xen-devel@lfdr.de>; Tue, 19 Jul 2022 03:30:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.370271.601931 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDc2s-0004JP-26; Tue, 19 Jul 2022 01:29:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 370271.601931; Tue, 19 Jul 2022 01:29:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDc2r-0004GY-Ul; Tue, 19 Jul 2022 01:29:05 +0000
Received: by outflank-mailman (input) for mailman id 370271;
 Tue, 19 Jul 2022 01:29:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ikiT=XY=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oDc2p-0004GQ-Gr
 for xen-devel@lists.xenproject.org; Tue, 19 Jul 2022 01:29:03 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150051.outbound.protection.outlook.com [40.107.15.51])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2a2e0f5c-0702-11ed-bd2d-47488cf2e6aa;
 Tue, 19 Jul 2022 03:29:00 +0200 (CEST)
Received: from AS9PR06CA0049.eurprd06.prod.outlook.com (2603:10a6:20b:463::24)
 by AM6PR08MB4849.eurprd08.prod.outlook.com (2603:10a6:20b:c3::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Tue, 19 Jul
 2022 01:28:57 +0000
Received: from VE1EUR03FT064.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:463:cafe::69) by AS9PR06CA0049.outlook.office365.com
 (2603:10a6:20b:463::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.19 via Frontend
 Transport; Tue, 19 Jul 2022 01:28:57 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT064.mail.protection.outlook.com (10.152.19.210) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5438.12 via Frontend Transport; Tue, 19 Jul 2022 01:28:56 +0000
Received: ("Tessian outbound cc6a8ab50b6b:v123");
 Tue, 19 Jul 2022 01:28:56 +0000
Received: from 047afa700790.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 38CA9D0B-21DE-4F5B-85F4-4C3302DE0880.1; 
 Tue, 19 Jul 2022 01:28:50 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 047afa700790.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 19 Jul 2022 01:28:50 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by VI1PR08MB3983.eurprd08.prod.outlook.com (2603:10a6:803:e0::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.19; Tue, 19 Jul
 2022 01:28:47 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::502f:a77a:aba1:f3ee]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::502f:a77a:aba1:f3ee%6]) with mapi id 15.20.5438.023; Tue, 19 Jul 2022
 01:28:47 +0000
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
X-Inumbo-ID: 2a2e0f5c-0702-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=hDaR7wb0xXXzKSmqoz1NHJItPMqVg6FHa5mfuRLXrW4XCmVade7n6uSm7YhzVGaIsXs4g4AK6PYIi5BgEGBER2y1dJhlMiVX59YIaEdJ9utOysgWYXpxqHotURpsfBaId5awD3DlJDTRNyzfzf3xGltLZnY7g9w2xw1DJsmCYP2tWB+/Bpw/4vdEIDOp9W0BLqzdxO0+EphweaIy0XiEq7FSmSqrdFoTEb3h71yzKTAdbiHTQrETE6+nzUTXdWTSnG77cssM9W/15vb4mOxuTgzTxtQUZRtVZi1qmUFq2p+2rItFxAXcNHRZbR7L1cYKBkAzamXnUs/P6R2PnmnxHg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z5tcjebPwgcJX/ifsKTVqAV3Ng3khA/KYOBCcGg8hXA=;
 b=aArtn2jVJUDQ9SuTUnASFYlNf7Wq4XkKXsR0FGe12pBB4Yl1Py6guNcapbpY328/z2iDoFFk1+UgpkvH8Bj5JyWimUoGqSNbTDKbe5fy/4KVal0LmnzeZ+FqdZ5rXsyL8eX/T128CAeB3Iow0Glk3LkgDHgFD9epgkbds/yV9wLvSnBYnVMvr2NoCBNE9UG2O3tQaACbO6NIUJJDMwDS4uHfG4d+R6eQ0sgBwX5CgCNwD/EwMyP1j7N52fn4AqfnmHfQYE88asVGkK/YuMBiWQ7h1AnBvn6+sCvmY8p0HUS6NYcvkAfvRu4EdB4UkL34b+rEfVCFDMvsFvujoCesUw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z5tcjebPwgcJX/ifsKTVqAV3Ng3khA/KYOBCcGg8hXA=;
 b=P5d2mOh8GaLQm7/BhCAADJD2gjBEzV8RBRfchAakT9E3r9GhBBY9eQSeQaft3OquUbhEgD8ffFXsUgiMjUT6wHayLRLNIJ/1TVtWi7pHdU9fWJu8fPcUngkDunLLpbKmyIEyEvmziJkixsHCA5CY4/+KmuN/VyzxRhda/y4oIUY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YWmXGKsCRn6XMZUU0aakAw3vXFUwaVNrv4fWtNRsXDo/sHHdy69Z7w56P8e92GgIz0CmQ0/WpqPjXaybwEotleJ2RPegNUZME6wOyesejo3T47x23BycyG7Pg3q/681vBUAwUuDPLZDjxCOPuTo5s6XqcawG2DOHHg6J5aSgaUPmS9tV+wXa/AdCtHSE+zzonMSYA/174RKjc5581cdeZcmUZZ1KA1NJYy8MKaVajs+OXtrKytz52cE4imHAzkzfU5WyOn1pd8sHV423xjr2UxQJKH4jofzIEhQmWUDBzjFFqN6iter4GhPgHDvVnlrnd/5ZtcdhQt9sdVHxwhEurQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z5tcjebPwgcJX/ifsKTVqAV3Ng3khA/KYOBCcGg8hXA=;
 b=nwJwhx8P/u3IYv/jHvfLVzPh1zSZdXpglEVaYXaMBT43kk+oF7HOh02V7S1OqiLRHgZSxJW1biXyXnfLBvJawlP+KV7RMYhxsy+RJhYy/4ZmmW7ZybjNkS5uNCaW4Qxv+WCY+TQCSIsAMk60P8fH16jFiBpU+a8H3tSi5sAz5KALFVUR/xKnh1eJcDZaMYdWzACB1RwERoOfYQrkgU3HV7wS6xBhKdTFirpWcmuIp8RFjznh04eBR6bgsE8yxLShnWsAqMGyk2YjotKYxMtpD8eIHumHGL1v3w4e+rObOGaHzmkXwwUIuMvorCfkn8gyxp49NrE2y4lg+ipD/rGzNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z5tcjebPwgcJX/ifsKTVqAV3Ng3khA/KYOBCcGg8hXA=;
 b=P5d2mOh8GaLQm7/BhCAADJD2gjBEzV8RBRfchAakT9E3r9GhBBY9eQSeQaft3OquUbhEgD8ffFXsUgiMjUT6wHayLRLNIJ/1TVtWi7pHdU9fWJu8fPcUngkDunLLpbKmyIEyEvmziJkixsHCA5CY4/+KmuN/VyzxRhda/y4oIUY=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>, Juergen
 Gross <jgross@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei
 Liu <wl@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v2 0/4] tools/xenstore: add some new features to the
 documentation
Thread-Topic: [PATCH v2 0/4] tools/xenstore: add some new features to the
 documentation
Thread-Index: AQHYcZr+xugQmCaBT0SxSahY0q90Lq2En0iAgAAEOQCAAJWm8A==
Date: Tue, 19 Jul 2022 01:28:47 +0000
Message-ID:
 <AS8PR08MB79911D9A39C24FB82E327483928F9@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20220527072427.20327-1-jgross@suse.com>
 <6e12a7ee-8526-2214-8beb-f0f3d8ad3e83@suse.com>
 <456d3702-c4b8-9a59-a8f3-307517be86a8@xen.org>
In-Reply-To: <456d3702-c4b8-9a59-a8f3-307517be86a8@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 49BA7CE902C7F34D8BB445F8598DE316.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 8a1dfbbd-57c5-47ce-1640-08da69260c80
x-ms-traffictypediagnostic:
	VI1PR08MB3983:EE_|VE1EUR03FT064:EE_|AM6PR08MB4849:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 B3v1BdGwmR674biz8fvTY+fF/nnVStP13Hh7vXgBugMGdGofW3YtwGgvF3flEOHv0mNfy/G9YbMhYA73YSzmTLypdOuQ/KNnLQFNoSf/CP6+SRuXbqp+9RStvU9qjHNmwUwc02Yj69zBj5QAgCWQIPnZbMnD48PFqMQOOp9QI+IYZa5xtmnIso5ImJh1C5UcbJcDMOJNpIA4EVtx/0s9K5TxxDKfl2yzou+eu4lWXyjGb/6tXluSuOw5RQlFyA8IiTi33MWxXShlGviRSo6nxRd4fLlydUhATo5eTmLCg2XsmOobS6GVAVn1sqyYNK8JGbIjpjBZgo9TqGmh/X10wRfCufaTQHkCgJ5HlAvLnFXX40J/eArT4I3eFcd+8qkftUw4ALD30boqM7QG+be8Ycs8C3qhM1nCpjK4dbn+uV+yxsSiwLnO9WD/1Etv1vqU4eKktRTU2uQO5zgIko7rU9C7YducZgYaIqcu21hLvcXRnhcg9cQeo8P5HWXNeLwgppzOE8V4/c5SDc4JNRZ/yI2P7TtamoKdOqZ6g1S6S4vzj9UNoO328YnzGTr7cHruqyzJUVtwZaowQOxFZ9FX+o6VFDNyVSpU0SgtnizryYqsl53e1Ja6q4tPRjS8g4lQwDKnlXyQqSR9LLPbjxarTvqzkZKXSyhDoS9/tE4M7S/Sby3RJGqobupGYebXQPBFBAU/hS1Sq9ZJgQAXjyI71IdpRPVKD1l5AUCOxxvbScf671tlKKitXT88Dg/rAa5n/oUYpmvgwXyb1hYj+qXwDXV7CvWS8+Z1BH0uvrJloaAVI3cDi55e3dtOGMzaDk4b
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(346002)(396003)(39860400002)(136003)(366004)(8676002)(66476007)(66446008)(64756008)(186003)(83380400001)(478600001)(66556008)(52536014)(26005)(6506007)(4326008)(9686003)(7696005)(8936002)(53546011)(38070700005)(54906003)(5660300002)(71200400001)(122000001)(316002)(2906002)(76116006)(38100700002)(86362001)(110136005)(66946007)(41300700001)(55016003)(33656002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3983
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6a08cbe3-bf6f-4406-72b6-08da69260725
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8KyFALseBuZTSiCCEJP8Q3yb/0gwJlWdqa5y18djZxxtmqx29bqLdDbF+75TkCfxyH16cSt3kIAO2IN3c6G4h5mPcAplKqURoS0BzRpH8+fjTVjYc4qeSVgumObMNl2wMtbS7CDKe/q9OOTQR33Iys7gubDHF28fqdNp6mNBJPmkbpUBSkxYH//k+7Y169ywMG3DrX7Ce10N1SsotQHKKgGmW70LFZkrpjsUpI9ZFov6xMlWETuJyCFyQoZnlH1rdq5JGHGusufJGUpJEbsfNx9TgSaUlL1R31nhJULfqNGRX98Ui9y9FRDCcIv9s3cq1YRu1Uk6y7umev10yONGDw60ekeKPDDTaETIEIhDc9WmO34pYuchi9jGNy6GM8c1DnbVeJlZTseVjFcZAUpQff6LykK+VG4O4quTqaDIayWQEE/VOHr6TwKrdSNvgNGX+M3KjfHqgT7Zh5pS5Vfn2wPvYgeXC1ChPs7ZFLil1kXXv+c4FubnDJSKRI3Yn0l3powDKN/cFMGtGuMH3wljUB/UnEHuUATlE1bqBOW4mi0Vg+1DMIiX+E0rMeiVlLN8QqzD3zTHV54o+U0zmGEWWf9Hskx2hnA37YZp2PjZ2IvHFqNilZLqkb53B0Axwhc5SiZHfl2kjDFJSIEqH41FLtFIasnD1p5L3efRJTC41Q3cBuuTo4xQK9V9VkD0oDKHsKm5feWoN/a4SuitfLt8l6hmXYbcX1qExZuK9GIwtnHSjM3WKRXhaYYUUpvcQY/cOw2BlFmEPjSOU1pFosV6n+FzrTQPQQlLks4jxZToEEjjeoVOE2YMfb9HT6CQsDb6
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(396003)(136003)(39860400002)(376002)(346002)(46966006)(40470700004)(36840700001)(33656002)(47076005)(9686003)(186003)(8936002)(41300700001)(40480700001)(70586007)(81166007)(55016003)(7696005)(4326008)(316002)(6506007)(26005)(478600001)(8676002)(82740400003)(86362001)(356005)(336012)(52536014)(54906003)(40460700003)(53546011)(110136005)(2906002)(83380400001)(82310400005)(36860700001)(70206006)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2022 01:28:56.4647
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a1dfbbd-57c5-47ce-1640-08da69260c80
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4849

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIgMC80XSB0
b29scy94ZW5zdG9yZTogYWRkIHNvbWUgbmV3IGZlYXR1cmVzIHRvIHRoZQ0KPiBkb2N1bWVudGF0
aW9uDQo+IA0KPiBIaSBKYW4sDQo+IA0KPiBPbiAxOC8wNy8yMDIyIDE3OjEyLCBKYW4gQmV1bGlj
aCB3cm90ZToNCj4gPiBPbiAyNy4wNS4yMDIyIDA5OjI0LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0K
PiA+Pg0KPiA+PiBDaGFuZ2VzIGluIFYyOg0KPiA+PiAtIGFkZGVkIG5ldyBwYXRjaCAxDQo+ID4+
IC0gcmVtb3ZlIGZlYXR1cmUgYml0cyBmb3IgZG9tMC1vbmx5IGZlYXR1cmVzDQo+ID4+IC0gZ2V0
LWZlYXR1cmVzIHdpdGhvdXQgZG9taWQgcmV0dXJucyBYZW5zdG9yZSBzdXBwb3J0ZWQgZmVhdHVy
ZXMNCj4gPj4gLSBnZXQvc2V0LXF1b3RhIHdpdGhvdXQgZG9taWQgZm9yIGdsb2JhbCBxdW90YSBh
Y2Nlc3MNCj4gPj4NCj4gPj4gSnVlcmdlbiBHcm9zcyAoNCk6DQo+ID4+ICAgIHRvb2xzL3hlbnN0
b3JlOiBtb2RpZnkgZmVhdHVyZSBiaXQgc3BlY2lmaWNhdGlvbiBpbiB4ZW5zdG9yZS1yaW5nLnR4
dA0KPiA+PiAgICB0b29scy94ZW5zdG9yZTogYWRkIGRvY3VtZW50YXRpb24gZm9yIG5ldyBzZXQv
Z2V0LWZlYXR1cmUgY29tbWFuZHMNCj4gPj4gICAgdG9vbHMveGVuc3RvcmU6IGFkZCBkb2N1bWVu
dGF0aW9uIGZvciBuZXcgc2V0L2dldC1xdW90YSBjb21tYW5kcw0KPiA+PiAgICB0b29scy94ZW5z
dG9yZTogYWRkIGRvY3VtZW50YXRpb24gZm9yIGV4dGVuZGVkIHdhdGNoIGNvbW1hbmQNCj4gPg0K
PiA+IEhtbSwgbG9va3MgbGlrZSBJIGRpZCBjb21taXQgdjEgb2YgdGhpcyBzZXJpZXMsIG5vdCBu
b3RpY2luZyB0aGUgdjIgX2FuZF8NCj4gPiBzZWVpbmcgdGhlcmUgaGFkIGJlZW4gUi1iIHdpdGgg
bm8gb3RoZXIgZm9sbG93LXVwIChsZWF2aW5nIGFzaWRlIHRoZSB2MikNCj4gPiBpbiBhIGxvbmcg
dGltZS4gUGxlYXNlIGFkdmlzZSBpZiBJIHNob3VsZCByZXZlcnQgdGhlIGNvbW1pdHMuIEknbSBz
b3JyeQ0KPiA+IGZvciB0aGUgY29uZnVzaW9uLiAoSSBhbHNvIHdvbmRlciB3aHkgdGhlIFItYiB3
ZXJlbid0IGNhcnJpZWQgb3ZlciB0byB2Mi4pDQo+IA0KPiBwYXRjaCAjMSBpcyBhIG5ldyBwYXRj
aC4gVGhlIHBhdGNoICMyLCAjMywgIzQgaGF2ZSBiZWVuIHJld29yZGVkIGFuZCB0aGUNCj4gb3Zl
cmFsbCBpbnRlcmFjdGlvbiBpcyBkaWZmZXJlbnQuIFNvIEkgZG9uJ3QgdGhpbmsgdGhlIHJldmll
d2VkLWJ5DQo+IHNob3VsZCBoYXZlIGJlZW4gY2FycmllZC4NCj4gDQo+IEkgaGFkIHNvbWUgY29u
Y2VybnMgaW4gdjEgd2hpY2ggd2VyZSBhZGRyZXNzZWQgaW4gdjIuIEkgaGF2ZSByZXZpZXdlZCB2
Mg0KPiBhIHdoaWxlIGFnby4gRnJvbSBteSBwZXJzcGVjdGl2ZSwgcGF0Y2ggIzEsICMzLCAjNCBh
cmUgcmVhZHkgdG8gZ28uDQo+IFBhdGNoICMyIG5lZWRzIGEgcmVzcGluIGFuZCB3ZSBhbHNvIG5l
ZWQgdG8gY2xhcmlmeSB0aGUgaW50ZWdyYXRpb24gd2l0aA0KPiBtaWdyYXRpb24vbGl2ZS11cGRh
dGUuDQo+IA0KPiBBcyB5b3UgY29tbWl0dGVkLCBJIHdvdWxkIGJlIE9LIGlmIHRoaXMgaXMgYWRk
cmVzc2VkIGluIGEgZm9sbG93LXVwDQo+IHNlcmllcy4gQnV0IHRoaXMgKm11c3QqIGJlIGFkZHJl
c3NlZCBieSB0aGUgdGltZSA0LjE3IGlzIHJlbGVhc2VkDQo+IGJlY2F1c2Ugb3RoZXJ3aXNlIHdl
IHdpbGwgY29tbWl0IG91cnNlbGYgdG8gYSBicm9rZW4gaW50ZXJmYWNlLiBASGVucnksDQo+IHBs
ZWFzZSBhZGQgdGhpcyBpbiB0aGUgYmxvY2tlciBsaXN0Lg0KDQpUaGFuayB5b3UgdmVyeSBtdWNo
IGZvciB0aGlzIGluZm9ybWF0aW9uLiBJJ3ZlIGFkZGVkIHRoaXMgaW4gYmxvY2tlciBsaXN0Lg0K
SSB3aWxsIGtlZXAgdGhhdCBpbiBtaW5kIGFuZCBzZW5kIChwcm9wZXIpIHJlbWluZGVycyBkdXJp
bmcgdGhlIHRpbWVsaW5lDQpvZiB0aGUgNC4xNyByZWxlYXNlIHByb2Nlc3MuDQoNCktpbmQgcmVn
YXJkcywNCkhlbnJ5IA0KDQo+IA0KPiBDaGVlcnMsDQo+IA0KPiAtLQ0KPiBKdWxpZW4gR3JhbGwN
Cg==

