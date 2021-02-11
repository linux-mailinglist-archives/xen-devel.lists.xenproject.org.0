Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB62A318A09
	for <lists+xen-devel@lfdr.de>; Thu, 11 Feb 2021 13:04:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83874.157064 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lAAhD-0005d2-4l; Thu, 11 Feb 2021 12:03:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83874.157064; Thu, 11 Feb 2021 12:03:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lAAhD-0005cd-1H; Thu, 11 Feb 2021 12:03:43 +0000
Received: by outflank-mailman (input) for mailman id 83874;
 Thu, 11 Feb 2021 12:03:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ygeM=HN=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1lAAhB-0005cY-1z
 for xen-devel@lists.xenproject.org; Thu, 11 Feb 2021 12:03:41 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.1.67]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fc45ceb1-f630-4517-a573-e6a3e13503c8;
 Thu, 11 Feb 2021 12:03:37 +0000 (UTC)
Received: from DB6PR07CA0053.eurprd07.prod.outlook.com (2603:10a6:6:2a::15) by
 AM6PR08MB3541.eurprd08.prod.outlook.com (2603:10a6:20b:51::31) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.30; Thu, 11 Feb 2021 12:03:34 +0000
Received: from DB5EUR03FT027.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:2a:cafe::9f) by DB6PR07CA0053.outlook.office365.com
 (2603:10a6:6:2a::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.12 via Frontend
 Transport; Thu, 11 Feb 2021 12:03:34 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT027.mail.protection.outlook.com (10.152.20.121) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3846.25 via Frontend Transport; Thu, 11 Feb 2021 12:03:34 +0000
Received: ("Tessian outbound 587c3d093005:v71");
 Thu, 11 Feb 2021 12:03:34 +0000
Received: from 98a8f2f8d2da.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A4E41A5C-10F7-40E7-AAA1-E797151A9C8D.1; 
 Thu, 11 Feb 2021 12:03:28 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 98a8f2f8d2da.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 11 Feb 2021 12:03:28 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com (2603:10a6:10:49::10)
 by DBBPR08MB4869.eurprd08.prod.outlook.com (2603:10a6:10:de::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.25; Thu, 11 Feb
 2021 12:03:26 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::f5c1:9694:9263:d90d]) by DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::f5c1:9694:9263:d90d%2]) with mapi id 15.20.3825.030; Thu, 11 Feb 2021
 12:03:25 +0000
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
X-Inumbo-ID: fc45ceb1-f630-4517-a573-e6a3e13503c8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9ekqrdfrD9g+E+3V2+qd2USJLZKIPla23yyzJHnaAQE=;
 b=p48LqkvYRMT7PJ7KY1W+15WK3/YhIlM1VQpyaMYXX1GFQvk+UpeIxvuoEZVaXNqakd/4HjJguxpcsqLKJ9VIZ1/vkefDzNi8lkc0GPH/UGtVbtG1MUYGuAcaq+mN2FXtJ7oE2/vSotICk9fLnD6msfIPsUznvWtnDFGUoLVnOHE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 76af0b9c07323150
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A/Z03Ii3/XXDKIB5uvGt5/NlMp0WzKO3yHi+Qh7WLfK/vPs5rDdybgyHQIlRaNRSY36c33ktkomL2LgNgG7FAmFZM6oH28lLAOOb6eF/MqFMdtYynHqANdtVp7g+aHbWTG0LDtGKtikmmIYd5snOyjleKxGvTKNszeWA5tZemVokDYbDh1Tx8Vhjcnd/OzKDK1Afe56tmbbfQ9B8W4nIlBwHvPcg/4JdhZXwuARF6IN1Y9YLpSkxu7Zlf5Gb/fmwGf5yMRjai15QV4ooAItnNSIxlX70ZiRw3/amyK6v7AE6sS3th9Qfg6rv7QsNYciBmHie/SmVc8N+xbgfonLW/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9ekqrdfrD9g+E+3V2+qd2USJLZKIPla23yyzJHnaAQE=;
 b=YfZQXVFnt98aZDoubtINJ9hZMUa6M7+wOl/m8iexhsktO4sXI4bVOPmVgKBSHae3JlfpcXg2exxQEIH+d5cn7sNcidI6abUOqUanzzJv/L6q4joVI/xCp3Zk7wYOjbM/JIN9ZkaJRhmOTpnoyQZ+8wLlszQY4E1tLM6ga/tPqRRzmKeMxSb7zVVXBQ4abUBfFJbjZvNle8f/j51L7NtKmO+mFezi1MwbIB5+Rk+MKnUhzJnouyzAkjynjq/2zqR4XBBG893l4NCN5gj/C+eWPxaijhKtzxK6BmOTQSCltDXXeVrIblZNy30Fef3T2lYscg1HPzVXBmJXU5dWhslQYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9ekqrdfrD9g+E+3V2+qd2USJLZKIPla23yyzJHnaAQE=;
 b=p48LqkvYRMT7PJ7KY1W+15WK3/YhIlM1VQpyaMYXX1GFQvk+UpeIxvuoEZVaXNqakd/4HjJguxpcsqLKJ9VIZ1/vkefDzNi8lkc0GPH/UGtVbtG1MUYGuAcaq+mN2FXtJ7oE2/vSotICk9fLnD6msfIPsUznvWtnDFGUoLVnOHE=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>, "lucmiccio@gmail.com"
	<lucmiccio@gmail.com>, xen-devel <xen-devel@lists.xenproject.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Stefano Stabellini
	<stefano.stabellini@xilinx.com>
Subject: Re: [PATCH v2] xen/arm: fix gnttab_need_iommu_mapping
Thread-Topic: [PATCH v2] xen/arm: fix gnttab_need_iommu_mapping
Thread-Index: AQHW/ks46k4kUfhzpk6LTniK0S/PbqpPzhoAgAB7ugCAATYRAIAAZriAgAD4lgA=
Date: Thu, 11 Feb 2021 12:03:24 +0000
Message-ID: <6CB0A348-0470-430A-818A-546730992474@arm.com>
References: <20210208184932.23468-1-sstabellini@kernel.org>
 <B96B5E21-0600-4664-899D-D38A18DE7A8C@arm.com>
 <alpine.DEB.2.21.2102091226560.8948@sstabellini-ThinkPad-T480s>
 <EFFD35EA-378B-4C5C-8485-7EA5265E89E4@arm.com>
 <alpine.DEB.2.21.2102101309230.7114@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2102101309230.7114@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [80.1.41.211]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: be87ff02-c972-4ef9-808d-08d8ce850e79
x-ms-traffictypediagnostic: DBBPR08MB4869:|AM6PR08MB3541:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB3541DE4E6F372BD80966F6C3FC8C9@AM6PR08MB3541.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:5236;OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 4g3tnSrAjlfXMUSPim0Tvb7Od85TMTKPphx/TA1JkeJHCvI2cJktcdU4bsdeudAFvrbDDbWpJpglojMGyZCEd23qUHUkICumU4llHgbijMnr3oKWYoYlFql1Hcy8EjEJvFRUH1K4H1ilB6DcbWkQ3WFIHgQLlTMy1RfrPobTPvaYyGwqBQjD439Yce0qWB5QyxfhXg8Tb7q94IRZBoMPDfD1IPDiYUtbedk7MBPKk/yEsFF6Gj/I7ySFQ/uLEyRzUzQu7SajCNPW9uk+s5xFTa898ljbuZRxAl2T5yMhnkGW6h497GiO1Nj7EDAmSuddb74wKioc/eQcBGFz2nq3Fryg3DQovOPU1xzuAhD8HYubnPFnPMcYykwDRllL2V8yF0VMy9SZyFAF0UT2/6iqaewYEn7hhu4MBs8hluOM3RWAMBdiQHKKU0y0xRCyUFCdv9jyi8N8OxkmmKaystcNkPq21B/g6EnCgmRdfOU4HlTSfkqeyOlgV+0nU73yc8hRjraasRIlRKweMF9RpeFTZBmWnJNbBRmGXynRPZbCyFT8vtPC1dVm9iv5jUVgr2ABI+qw0jx/1dZwm3G6CNZBqsigMlAtqcw9L3MFVR64kfrBBg60wdZN8UfYwjGZsXqc1qFrGXTBBakUxy2qz0Uzngeb7NV+QFH2FZojdIhWkAQ=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3500.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(366004)(396003)(376002)(136003)(346002)(71200400001)(66446008)(66476007)(64756008)(66556008)(6506007)(186003)(66946007)(91956017)(6512007)(26005)(76116006)(2906002)(2616005)(33656002)(53546011)(54906003)(8676002)(83380400001)(8936002)(5660300002)(6916009)(4326008)(36756003)(966005)(316002)(86362001)(6486002)(478600001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?utf-8?B?SG1Ydm1NaE5jeWROUC9UUGNYVXVHSFhMMHJWWDdkUVBCdnZVZGRzY3hkYlg4?=
 =?utf-8?B?Q1p3MGlWdkpqYmVjb2RLdjlPSTVaeXlqb29tSlFRenRiUEFvOFBmWWJubWd0?=
 =?utf-8?B?L05CNjZwOTJ2d21CREliMUFDUmJ5dHVLUi9wd2oyMldDc1YvTUZQSERPK25S?=
 =?utf-8?B?ZHBEWEJBQXFpL0VXTUNCSzc5R0xGR2szb2l0MkJPelhuUlhURjYrbmF4T1dx?=
 =?utf-8?B?R1VBT21tc2hIZlRVZHJYaGtIV1VaS1BReDB6aDRWN3RRMjdPRnM4aFgwU0Fa?=
 =?utf-8?B?QU5kZXJBamdYYnk3NDVPak56cWhZc2ovUlpGaGNVK01Nc3p6Zk43L3FiWHJv?=
 =?utf-8?B?RjlRaUZxT0ZaRXdWVXhuRzhFM1cvWDRyazl5cE9venJaSDhmNU1pQjMwTFE0?=
 =?utf-8?B?ci9FaW9RekpCdXpFenpoNjhrT1JlRzAvSmViK0liK3lJOUpIUXJLZzE1WE12?=
 =?utf-8?B?SzQ2cHZnbG9pSXg5a0g0WXlLRzhoMkNsSWJaZnlQVjBnK2lxMFJDckozQWVw?=
 =?utf-8?B?TklHL1ZHYXFWTFNEelRnZjJFZGJHbWdZYkRadTF0ZHVoOXdpMzc3ekRmZEtw?=
 =?utf-8?B?dWVzQUd4MjNrZ2xlTjI4aGs2bUs3bmlQQkRkZXFsL3h0WXBBUEhVL2hsVnhq?=
 =?utf-8?B?Y0hnbjd6TEFLbWtLYTUyTEl0WFJHT3lGVWZGaGc5ZW5YdmRLeWdWMk5RWUFw?=
 =?utf-8?B?TENCOEE4V2FRYzVZQm9Fd2o1SGluOHNRa3JvUFJxb2pJbTNHTlI3eDhQeUpq?=
 =?utf-8?B?OFBhdXBObDhhNEh2M3NzL1Q5c0Y2NTlSOGVHSEs2Y044NmxIUDRuaXY5d2Qw?=
 =?utf-8?B?YklMZmpkVWN5RzNmYmJRN2hpOEVmQ2NxWWJFMktYaGhKM3kvUXQzYUVBT1pX?=
 =?utf-8?B?eDIzU3J0QUJVbnYyZjVXZEZRUkxZdXJYZHFhNTE3NWtiQ1pEMVZNSkk3R1F2?=
 =?utf-8?B?NzhOK2lmWlRzSFdKRjFTQVh6Vk1DQWJaUW5LQXdlK1BUcVUwYW85VTZRN3Mv?=
 =?utf-8?B?R0xBeHZvUzBUdUFnYlBBYy9raEE1VVlldzUzMGc0UnNIckRzRzV3YnNOZkhX?=
 =?utf-8?B?MytEaHFIWnoreE9FZWg2V1crVkhsOUdWeTBkNzNiYWkvVnJHUHIvNkRHMEtW?=
 =?utf-8?B?ZCtNaXVUMzFhbkZlTUhlODZ1VzBmSWJ2eW9oaUwvM0Nmc1hGTlVsYWtjYVNv?=
 =?utf-8?B?MXRjRCt0T1kvcWhYRGNqNVZZa3JpMDBLelZzc2hiYjZPSDQrb2dQUVFKNndW?=
 =?utf-8?B?M2NtQm5BVGVZaWdjWjJVcjdQelYyeVhMdnc1eWgrNUQyQjY5VlBmMEYvU2NX?=
 =?utf-8?B?YXpodU5BNUZSRzMrT0dBRk1FanZTRDhWQllsMlVETDRQSjV3U3lod2JodFQ0?=
 =?utf-8?B?aEUyQkFLWEVXVnJVTC9EcUZCakhiV1gxaGVOUnAyekMweXNXczF5MUNZaVZa?=
 =?utf-8?B?L1BhVnVNS21UYnhGUy8wWExDTTJWMkt2Ukc4K2EyeWxkazgwdGVyNmQrZWl4?=
 =?utf-8?B?akt3aWlscVFVL3JRRks4d3BNaU9sRTVJUGs3bnNpditJbmdoMHFMbnhRaWNo?=
 =?utf-8?B?ekNoM2twTE1IZEdvME5SQ1FKdEs4Vk9EbXhzWFd2aTI4OVF4Um1MdHVXTGlR?=
 =?utf-8?B?Mis4T3BuTGlDL20rQUx6bTBkenVucktZQzczTFRUOW5EaW5vcFl4VFlWdEhY?=
 =?utf-8?B?blhJNEExT0xtbklYeDg4aUtFS1IxMEVVMGFVcDUrVUpOSXMyay9SOW9MaDRz?=
 =?utf-8?Q?HrPXNy+0Xdl6dfCUYmC6i5kQqnRowR9WRpRgnkg?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EDAFBB5276384E4AA7DFF2443F65E4F2@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4869
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	cd3054b1-2351-4a04-3292-08d8ce85095a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LcQ12K3OXC9+W8xfm/FEhyxg6j1AwKZcSD/qzjyYgUuzAFoIoU60fP3y+jASMibLiXbO3KbZAwWh3+xXmRA+jnRBFb0IZcT3zYMgkPIt/ZOSNJSEcYc1e/r+ToT6lK72WIivaNM+7qsDPIWVrX6ZReoD9+X+AuPCS9fD/aZOoXv0cr9No46ITUAT3ANMLnTeja0nn0/IXsBrJmgr/MKeaqWRZBR5vkrv2HNva28UDgFQtKCqB6HQSdSPhXMmSsenVAKMgm1P/UMCZb51KJKDEJHKiIO6bQddTOFI7mHWH1eOxZUm/tPyZmAeTRejvHkqwVoVckvE5v0WxolhKmcOBa8HVVV2L45uzVp5RFGtH4E02mUtPQelcFsEpEYCunwRdU/Wrpftjrptihwhm3/Pn/cTlXsWsWE6WWSaypXzx30cke3ZBqMvl7FT8p+vdJno5tm9m8ZOEV2QwV8U+cjabmKwkhvMvDrQuxS8zWq7VYkDNMA2WjM6b+wVdqhbCI99pC46cHyd3pw/Y2vn07rm3lQcK02eoULsB2DtcWp5OfXB3IhUEFwQcSnLJuzKbxh3pzskWIKyxH5HDR4PZTeeUnFa6eDwDCbhsj+972q1S5FpsZVkMebXxk3EOEL08cus4ylZ8WL3Lo30ieYA4ELTwo0ZP4k5JKgdclWsV+0P4TAuHPwZDIv4kiu4D2wnlIoZ62np6EjteKd1nQaA5tjlZGWld5GNBNUKfHUd8MtlqDA=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(376002)(39860400002)(136003)(346002)(36840700001)(46966006)(70206006)(36756003)(966005)(2906002)(54906003)(26005)(82740400003)(5660300002)(82310400003)(4326008)(478600001)(36860700001)(70586007)(33656002)(107886003)(186003)(316002)(86362001)(8936002)(83380400001)(356005)(47076005)(336012)(6512007)(81166007)(2616005)(53546011)(8676002)(6506007)(6486002)(6862004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2021 12:03:34.1661
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: be87ff02-c972-4ef9-808d-08d8ce850e79
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3541

SGVsbG8gU3RlZmFubywNCg0KPiBPbiAxMCBGZWIgMjAyMSwgYXQgOToxMyBwbSwgU3RlZmFubyBT
dGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPiB3cm90ZToNCj4gDQo+IE9uIFdlZCwg
MTAgRmViIDIwMjEsIFJhaHVsIFNpbmdoIHdyb3RlOg0KPj4+IE9uIDkgRmViIDIwMjEsIGF0IDg6
MzYgcG0sIFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6
DQo+Pj4gT24gVHVlLCA5IEZlYiAyMDIxLCBSYWh1bCBTaW5naCB3cm90ZToNCj4+Pj4+IE9uIDgg
RmViIDIwMjEsIGF0IDY6NDkgcG0sIFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2Vy
bmVsLm9yZz4gd3JvdGU6DQo+Pj4+PiANCj4+Pj4+IENvbW1pdCA5MWQ0ZWNhN2FkZCBicm9rZSBn
bnR0YWJfbmVlZF9pb21tdV9tYXBwaW5nIG9uIEFSTS4NCj4+Pj4+IFRoZSBvZmZlbmRpbmcgY2h1
bmsgaXM6DQo+Pj4+PiANCj4+Pj4+ICNkZWZpbmUgZ250dGFiX25lZWRfaW9tbXVfbWFwcGluZyhk
KSAgICAgICAgICAgICAgICAgICAgXA0KPj4+Pj4gLSAgICAoaXNfZG9tYWluX2RpcmVjdF9tYXBw
ZWQoZCkgJiYgbmVlZF9pb21tdShkKSkNCj4+Pj4+ICsgICAgKGlzX2RvbWFpbl9kaXJlY3RfbWFw
cGVkKGQpICYmIG5lZWRfaW9tbXVfcHRfc3luYyhkKSkNCj4+Pj4+IA0KPj4+Pj4gT24gQVJNIHdl
IG5lZWQgZ250dGFiX25lZWRfaW9tbXVfbWFwcGluZyB0byBiZSB0cnVlIGZvciBkb20wIHdoZW4g
aXQgaXMNCj4+Pj4+IGRpcmVjdGx5IG1hcHBlZCBhbmQgSU9NTVUgaXMgZW5hYmxlZCBmb3IgdGhl
IGRvbWFpbiwgbGlrZSB0aGUgb2xkIGNoZWNrDQo+Pj4+PiBkaWQsIGJ1dCB0aGUgbmV3IGNoZWNr
IGlzIGFsd2F5cyBmYWxzZS4NCj4+Pj4+IA0KPj4+Pj4gSW4gZmFjdCwgbmVlZF9pb21tdV9wdF9z
eW5jIGlzIGRlZmluZWQgYXMgZG9tX2lvbW11KGQpLT5uZWVkX3N5bmMgYW5kDQo+Pj4+PiBuZWVk
X3N5bmMgaXMgc2V0IGFzOg0KPj4+Pj4gDQo+Pj4+PiAgaWYgKCAhaXNfaGFyZHdhcmVfZG9tYWlu
KGQpIHx8IGlvbW11X2h3ZG9tX3N0cmljdCApDQo+Pj4+PiAgICAgIGhkLT5uZWVkX3N5bmMgPSAh
aW9tbXVfdXNlX2hhcF9wdChkKTsNCj4+Pj4+IA0KPj4+Pj4gaW9tbXVfdXNlX2hhcF9wdChkKSBt
ZWFucyB0aGF0IHRoZSBwYWdlLXRhYmxlIHVzZWQgYnkgdGhlIElPTU1VIGlzIHRoZQ0KPj4+Pj4g
UDJNLiBJdCBpcyB0cnVlIG9uIEFSTS4gbmVlZF9zeW5jIG1lYW5zIHRoYXQgeW91IGhhdmUgYSBz
ZXBhcmF0ZSBJT01NVQ0KPj4+Pj4gcGFnZS10YWJsZSBhbmQgaXQgbmVlZHMgdG8gYmUgdXBkYXRl
ZCBmb3IgZXZlcnkgY2hhbmdlLiBuZWVkX3N5bmMgaXMgc2V0DQo+Pj4+PiB0byBmYWxzZSBvbiBB
Uk0uIEhlbmNlLCBnbnR0YWJfbmVlZF9pb21tdV9tYXBwaW5nKGQpIGlzIGZhbHNlIHRvbywNCj4+
Pj4+IHdoaWNoIGlzIHdyb25nLg0KPj4+Pj4gDQo+Pj4+PiBBcyBhIGNvbnNlcXVlbmNlLCB3aGVu
IHVzaW5nIFBWIG5ldHdvcmsgZnJvbSBhIGRvbVUgb24gYSBzeXN0ZW0gd2hlcmUNCj4+Pj4+IElP
TU1VIGlzIG9uIGZyb20gRG9tMCwgSSBnZXQ6DQo+Pj4+PiANCj4+Pj4+IChYRU4pIHNtbXU6IC9z
bW11QGZkODAwMDAwOiBVbmhhbmRsZWQgY29udGV4dCBmYXVsdDogZnNyPTB4NDAyLCBpb3ZhPTB4
ODQyNGNiMTQ4LCBmc3lucj0weGIwMDAxLCBjYj0wDQo+Pj4+PiBbICAgNjguMjkwMzA3XSBtYWNi
IGZmMGUwMDAwLmV0aGVybmV0IGV0aDA6IERNQSBidXMgZXJyb3I6IEhSRVNQIG5vdCBPSw0KPj4+
Pj4gDQo+Pj4+PiBUaGUgZml4IGlzIHRvIGdvIGJhY2sgdG8gc29tZXRoaW5nIGFsb25nIHRoZSBs
aW5lcyBvZiB0aGUgb2xkDQo+Pj4+PiBpbXBsZW1lbnRhdGlvbiBvZiBnbnR0YWJfbmVlZF9pb21t
dV9tYXBwaW5nLg0KPj4+Pj4gDQo+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBTdGVmYW5vIFN0YWJlbGxp
bmkgPHN0ZWZhbm8uc3RhYmVsbGluaUB4aWxpbnguY29tPg0KPj4+Pj4gRml4ZXM6IDkxZDRlY2E3
YWRkDQo+Pj4+PiBCYWNrcG9ydDogNC4xMisNCj4+Pj4+IA0KPj4+Pj4gLS0tDQo+Pj4+PiANCj4+
Pj4+IEdpdmVuIHRoZSBzZXZlcml0eSBvZiB0aGUgYnVnLCBJIHdvdWxkIGxpa2UgdG8gcmVxdWVz
dCB0aGlzIHBhdGNoIHRvIGJlDQo+Pj4+PiBiYWNrcG9ydGVkIHRvIDQuMTIgdG9vLCBldmVuIGlm
IDQuMTIgaXMgc2VjdXJpdHktZml4ZXMgb25seSBzaW5jZSBPY3QNCj4+Pj4+IDIwMjAuDQo+Pj4+
PiANCj4+Pj4+IEZvciB0aGUgNC4xMiBiYWNrcG9ydCwgd2UgY2FuIHVzZSBpb21tdV9lbmFibGVk
KCkgaW5zdGVhZCBvZg0KPj4+Pj4gaXNfaW9tbXVfZW5hYmxlZCgpIGluIHRoZSBpbXBsZW1lbnRh
dGlvbiBvZiBnbnR0YWJfbmVlZF9pb21tdV9tYXBwaW5nLg0KPj4+Pj4gDQo+Pj4+PiBDaGFuZ2Vz
IGluIHYyOg0KPj4+Pj4gLSBpbXByb3ZlIGNvbW1pdCBtZXNzYWdlDQo+Pj4+PiAtIGFkZCBpc19p
b21tdV9lbmFibGVkKGQpIHRvIHRoZSBjaGVjaw0KPj4+Pj4gLS0tDQo+Pj4+PiB4ZW4vaW5jbHVk
ZS9hc20tYXJtL2dyYW50X3RhYmxlLmggfCAyICstDQo+Pj4+PiAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4+Pj4+IA0KPj4+Pj4gZGlmZiAtLWdpdCBhL3hl
bi9pbmNsdWRlL2FzbS1hcm0vZ3JhbnRfdGFibGUuaCBiL3hlbi9pbmNsdWRlL2FzbS1hcm0vZ3Jh
bnRfdGFibGUuaA0KPj4+Pj4gaW5kZXggNmY1ODViMTUzOC4uMGNlNzdmOWExYyAxMDA2NDQNCj4+
Pj4+IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS1hcm0vZ3JhbnRfdGFibGUuaA0KPj4+Pj4gKysrIGIv
eGVuL2luY2x1ZGUvYXNtLWFybS9ncmFudF90YWJsZS5oDQo+Pj4+PiBAQCAtODksNyArODksNyBA
QCBpbnQgcmVwbGFjZV9ncmFudF9ob3N0X21hcHBpbmcodW5zaWduZWQgbG9uZyBncGFkZHIsIG1m
bl90IG1mbiwNCj4+Pj4+ICAgKCgoaSkgPj0gbnJfc3RhdHVzX2ZyYW1lcyh0KSkgPyBJTlZBTElE
X0dGTiA6ICh0KS0+YXJjaC5zdGF0dXNfZ2ZuW2ldKQ0KPj4+Pj4gDQo+Pj4+PiAjZGVmaW5lIGdu
dHRhYl9uZWVkX2lvbW11X21hcHBpbmcoZCkgICAgICAgICAgICAgICAgICAgIFwNCj4+Pj4+IC0g
ICAgKGlzX2RvbWFpbl9kaXJlY3RfbWFwcGVkKGQpICYmIG5lZWRfaW9tbXVfcHRfc3luYyhkKSkN
Cj4+Pj4+ICsgICAgKGlzX2RvbWFpbl9kaXJlY3RfbWFwcGVkKGQpICYmIGlzX2lvbW11X2VuYWJs
ZWQoZCkpDQo+Pj4+PiANCj4+Pj4+ICNlbmRpZiAvKiBfX0FTTV9HUkFOVF9UQUJMRV9IX18gKi8N
Cj4+Pj4gDQo+Pj4+IEkgdGVzdGVkIHRoZSBwYXRjaCBhbmQgd2hpbGUgY3JlYXRpbmcgdGhlIGd1
ZXN0IEkgb2JzZXJ2ZWQgdGhlIGJlbG93IHdhcm5pbmcgZnJvbSBMaW51eCBmb3IgYmxvY2sgZGV2
aWNlLg0KPj4+PiBodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92NC4zL3NvdXJjZS9k
cml2ZXJzL2Jsb2NrL3hlbi1ibGtiYWNrL3hlbmJ1cy5jI0wyNTgNCj4+PiANCj4+PiBTbyB5b3Ug
YXJlIGNyZWF0aW5nIGEgZ3Vlc3Qgd2l0aCAieGwgY3JlYXRlIiBpbiBkb20wIGFuZCB5b3Ugc2Vl
IHRoZQ0KPj4+IHdhcm5pbmdzIGJlbG93IHByaW50ZWQgYnkgdGhlIERvbTAga2VybmVsPyBJIGlt
YWdpbmUgdGhlIGRvbVUgaGFzIGENCj4+PiB2aXJ0dWFsICJkaXNrIiBvZiBzb21lIHNvcnQuDQo+
PiANCj4+IFllcyB5b3UgYXJlIHJpZ2h0IEkgYW0gdHJ5aW5nIHRvIGNyZWF0ZSB0aGUgZ3Vlc3Qg
d2l0aCAieGwgY3JlYXRl4oCdIGFuZCBiZWZvcmUgdGhhdCwgSSBjcmVhdGVkIHRoZSBsb2dpY2Fs
IHZvbHVtZSBhbmQgdHJ5aW5nIHRvIGF0dGFjaCB0aGUgbG9naWNhbCB2b2x1bWUNCj4+IGJsb2Nr
IHRvIHRoZSBkb21haW4gd2l0aCDigJx4bCBibG9jay1hdHRhY2jigJ0uIEkgb2JzZXJ2ZWQgdGhp
cyBlcnJvciB3aXRoIHRoZSAieGwgYmxvY2stYXR0YWNo4oCdIGNvbW1hbmQuDQo+PiANCj4+IFRo
aXMgaXNzdWUgb2NjdXJzIGFmdGVyIGFwcGx5aW5nIHRoaXMgcGF0Y2ggYXMgd2hhdCBJIG9ic2Vy
dmVkIHRoaXMgcGF0Y2ggaW50cm9kdWNlIHRoZSBjYWxscyB0byBpb21tdV9sZWdhY3lfeywgdW59
bWFwKCkgdG8gbWFwIHRoZSBncmFudCBwYWdlcyBmb3INCj4+IElPTU1VIHRoYXQgdG91Y2hlcyB0
aGUgcGFnZS10YWJsZXMuIEkgYW0gbm90IHN1cmUgYnV0IHdoYXQgSSBvYnNlcnZlZCBpcyB0aGF0
IHNvbWV0aGluZyBpcyB3cml0dGVuIHdyb25nIHdoZW4gaW9tbV91bm1hcCBjYWxscyB1bm1hcCB0
aGUgcGFnZXMNCj4+IGJlY2F1c2Ugb2YgdGhhdCBpc3N1ZSBpcyBvYnNlcnZlZC4NCj4+IA0KPj4g
WW91IGNhbiByZXByb2R1Y2UgdGhlIGlzc3VlIGJ5IGp1c3QgY3JlYXRpbmcgdGhlIGR1bW15IGlt
YWdlIGZpbGUgYW5kIHRyeSB0byBhdHRhY2ggaXQgd2l0aCDigJx4bCBibG9jay1hdHRhY2jigJ0N
Cj4+IA0KPj4gZGQgaWY9L2Rldi96ZXJvIG9mPXRlc3QuaW1nIGJzPTEwMjQgY291bnQ9MCBzZWVr
PTEwMjQNCj4+IHhsIGJsb2NrLWF0dGFjaCAwIHBoeTp0ZXN0LmltZyB4dmRhIHcNCj4+IA0KPj4g
U2VxdWVuY2Ugb2YgY29tbWFuZCB0aGF0IEkgZm9sbG93IGlzIGFzIGZvbGxvd3MgdG8gcmVwcm9k
dWNlIHRoZSBpc3N1ZTogIA0KPj4gDQo+PiBsdnMgdmcteGVuL215Z3Vlc3QNCj4+IGx2Y3JlYXRl
IC15IC1MIDRHIC1uIG15Z3Vlc3QgdmcteGVuDQo+PiBwYXJ0ZWQgLXMgL2Rldi92Zy14ZW4vbXln
dWVzdCBta2xhYmVsIG1zZG9zDQo+PiBwYXJ0ZWQgLXMgL2Rldi92Zy14ZW4vbXlndWVzdCB1bml0
IE1CIG1rcGFydCBwcmltYXJ5IDEgNDA5Ng0KPj4gc3luYw0KPj4geGwgYmxvY2stYXR0YWNoIDAg
cGh5Oi9kZXYvdmcteGVuL215Z3Vlc3QgeHZkYSB3DQo+IA0KPiBBaCEgWW91IGFyZSBibG9jay1h
dHRhY2hpbmcgYSBkZXZpY2UgaW4gZG9tMCB0byBkb20wISBTbyBmcm9udGVuZCBhbmQNCj4gYmFj
a2VuZCBhcmUgYm90aCBpbiB0aGUgc2FtZSBkb21haW4sIGRvbTAuIFllYWggdGhhdCBpcyBub3Qg
c3VwcG9zZWQgdG8NCj4gd29yaywgYW5kIGlmIGl0IGRpZCBiZWZvcmUgaXQgd2FzIGp1c3QgYnkg
Y29pbmNpZGVuY2UgOi0pDQoNCkkgdGhpbmsgdGhpcyBpcyB2ZXJ5IGNvbW1vbiB0byBhdHRhY2gg
YSBibG9jayBkZXZpY2UgdG8gRE9NMCB3aGVyZSBmcm9udGVuZC9iYWNrZW5kIGlzIGluIHNhbWUg
ZG9tYWluLiANCkkgZm91bmQgdHdvIHJlZmVyZW5jZSB0aGF0IHVzZSB0aGUgc2FtZSBjb25jZXB0
DQoNCmh0dHBzOi8vd2lraS54ZW5wcm9qZWN0Lm9yZy93aWtpL0FjY2Vzc19hX0xWTS1iYXNlZF9E
b21VX2Rpc2tfb3V0c2lkZV9vZl90aGVfZG9tVQ0KaHR0cHM6Ly93d3cuc3VzZS5jb20vc3VwcG9y
dC9rYi9kb2MvP2lkPTAwMDAxNjE1NA0KDQpSZWdhcmRzLA0KUmFodWwNCg0KPiANCj4gVGhlcmUg
YXJlIGEgbnVtYmVyIG9mIGNoZWNrcyBpbiBMaW51eCB0aGF0IHdvdWxkbid0IHdvcmsgYXMgaW50
ZW5kZWQgaWYNCj4gdGhlIHBhZ2UgaXMgY29taW5nIGZyb20gaXRzZWxmLiBUaGlzIGlzIG5vdCBh
biBBUk0tb25seSBpc3N1ZSBlaXRoZXIuDQo+IA0KPiBJIHRyaWVkIGl0IHdpdGggZG9tMCwgbGlr
ZSB5b3UgZGlkLCBhbmQgSSBhbSBzZWVpbmcgdGhlIHNhbWUgd2FybmluZy4NCj4gSQ0KPiBkaWQg
dHJ5IHRvIGRvIGJsb2NrLWF0dGFjaCB0byBhIGRvbVUgYW5kIGl0IHdvcmtzIGZpbmUuDQo+IA0K
PiBJIGRvbid0IHRoaW5rIHRoaXMgaXMgYSBjb25jZXJuLg0KDQo=

