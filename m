Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9983F318BD5
	for <lists+xen-devel@lfdr.de>; Thu, 11 Feb 2021 14:21:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83904.157130 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lABtd-0004yK-3L; Thu, 11 Feb 2021 13:20:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83904.157130; Thu, 11 Feb 2021 13:20:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lABtd-0004xv-02; Thu, 11 Feb 2021 13:20:37 +0000
Received: by outflank-mailman (input) for mailman id 83904;
 Thu, 11 Feb 2021 13:20:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ygeM=HN=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1lABtb-0004xq-4V
 for xen-devel@lists.xenproject.org; Thu, 11 Feb 2021 13:20:35 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [40.107.20.74]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d920c989-4df0-4cec-8482-d9f9d2f53f2e;
 Thu, 11 Feb 2021 13:20:29 +0000 (UTC)
Received: from AM5PR0502CA0015.eurprd05.prod.outlook.com
 (2603:10a6:203:91::25) by AM6PR08MB3463.eurprd08.prod.outlook.com
 (2603:10a6:20b:42::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.20; Thu, 11 Feb
 2021 13:20:27 +0000
Received: from AM5EUR03FT048.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:91:cafe::48) by AM5PR0502CA0015.outlook.office365.com
 (2603:10a6:203:91::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.25 via Frontend
 Transport; Thu, 11 Feb 2021 13:20:27 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT048.mail.protection.outlook.com (10.152.17.177) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3846.25 via Frontend Transport; Thu, 11 Feb 2021 13:20:27 +0000
Received: ("Tessian outbound af289585f0f4:v71");
 Thu, 11 Feb 2021 13:20:26 +0000
Received: from b22b1639adfb.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 06DC34BE-3D5F-4BE5-BD2A-0AA94CF1B632.1; 
 Thu, 11 Feb 2021 13:20:21 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b22b1639adfb.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 11 Feb 2021 13:20:21 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com (2603:10a6:10:49::10)
 by DBBPR08MB4630.eurprd08.prod.outlook.com (2603:10a6:10:d6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.29; Thu, 11 Feb
 2021 13:20:19 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::f5c1:9694:9263:d90d]) by DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::f5c1:9694:9263:d90d%2]) with mapi id 15.20.3825.030; Thu, 11 Feb 2021
 13:20:18 +0000
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
X-Inumbo-ID: d920c989-4df0-4cec-8482-d9f9d2f53f2e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wppvBNXAkeePmECt9ThaeEuI+ynslVOSJoZD4o1RTgI=;
 b=ERDGP+pRuWqYpwDmk+4i5SxuHs8kMBxlDnQ9jshpPM98xd6vA3F2gpYMUpYEpzSEUkEA5umK+7YmpX8+bm/gARQzK5S5Nx8hYubqYflvNS+RhkIv5P9SYi9QPUmdtGnEkVIHhukNHtstdkOsAdIRGtTQlWj78+sxSMnx+VpueQE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: db884750f87764e4
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V6XTlC26IjbYFw58bCVZwefnEQ6N73Rh/nLaOYWoPgWuTWqnigGJg5Ijsj+gStCRgXPTfbBe8XO3ZdbtiVHfiEoPgN5JJZUTbkL6SG9cESIb8Hl+oLWvVdaxuVpkisrCe9lJihaYaplvta/aQI5MzHnlPIWYvGX6+tbnpmZaIwHuarEaI7ZNowzxSfYSCxBA9miEvrkj7MMNpisyFblQolalc2LcNSngwgX45BcN4GVbET/mkSYVCvhDBf8wnfQ2UmQrIwc/a65R4hiNzF8mLo5h6HzsJxSeKPqv3H2izj3+0xD7wfOV5KPMD4YfCc/LRCARIDQeOD+rXLutOt77mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wppvBNXAkeePmECt9ThaeEuI+ynslVOSJoZD4o1RTgI=;
 b=dt/JPG27jBt6jg/V+q3J+UaMYpZCaHRxI6F/RlGxG0SvhHrUjf29Mz9PvyLAH1FnUIJ/InsFVBr6gWQAbhM3ERnhRJUkYSyPUEVJDSRGRv0Rv2wwy9AlREDXd7Fl6xpDVxee1Cqwb+nHcUAN4eVUKNQMNWxZqCvhnwtNTpaAalgUGcaZHuerKY0FZ3qb3ak6bEvBGEUdSK9jJjrN0qT8ZzLVpmZ3g5sXoxuCGtPawJXgYIvas3+Us96bhoq3Z00dhRa6E3YkjMTFlT+AyEZifwHLzANax8yfKBes71pT9BOOssVywS8qbz4EOr90dGMN+3Qeewwi2EolsAQRTkD56g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wppvBNXAkeePmECt9ThaeEuI+ynslVOSJoZD4o1RTgI=;
 b=ERDGP+pRuWqYpwDmk+4i5SxuHs8kMBxlDnQ9jshpPM98xd6vA3F2gpYMUpYEpzSEUkEA5umK+7YmpX8+bm/gARQzK5S5Nx8hYubqYflvNS+RhkIv5P9SYi9QPUmdtGnEkVIHhukNHtstdkOsAdIRGtTQlWj78+sxSMnx+VpueQE=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Julien Grall <julien@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, "lucmiccio@gmail.com"
	<lucmiccio@gmail.com>, xen-devel <xen-devel@lists.xenproject.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Stefano Stabellini
	<stefano.stabellini@xilinx.com>
Subject: Re: [PATCH v2] xen/arm: fix gnttab_need_iommu_mapping
Thread-Topic: [PATCH v2] xen/arm: fix gnttab_need_iommu_mapping
Thread-Index:
 AQHW/ks46k4kUfhzpk6LTniK0S/PbqpPzhoAgAB7ugCAATYRAIAAKYkAgAAJgACAABz0AIABJMKA
Date: Thu, 11 Feb 2021 13:20:18 +0000
Message-ID: <BFC5858A-3631-48E1-AB87-40EECF95FA66@arm.com>
References: <20210208184932.23468-1-sstabellini@kernel.org>
 <B96B5E21-0600-4664-899D-D38A18DE7A8C@arm.com>
 <alpine.DEB.2.21.2102091226560.8948@sstabellini-ThinkPad-T480s>
 <EFFD35EA-378B-4C5C-8485-7EA5265E89E4@arm.com>
 <4e4f7d25-6f5f-1016-b1c9-7aa902d637b8@xen.org>
 <ECC82E19-3504-4E0E-B3EA-D0E46DD842C6@arm.com>
 <c573b3a0-186d-626e-6670-f8fc28285e3d@xen.org>
In-Reply-To: <c573b3a0-186d-626e-6670-f8fc28285e3d@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [80.1.41.211]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 46f3dc8e-abcd-4637-0c4e-08d8ce8fcc07
x-ms-traffictypediagnostic: DBBPR08MB4630:|AM6PR08MB3463:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB3463DCFCA49B26FB99700873FC8C9@AM6PR08MB3463.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 mOsZOaTnjkEr9tsUF6nHjPTlxZNHEeEVemeilCajG7EUGc3Dr2ZueVD+yQw8B0AdZVVx+JSIIz/H84kgwWTWQoxReduzmHVkPMntFp0iuF9x4GYeYb3nDn3diRHDFPdztqe8ZwrvgUeydEO5sALzHWCMkTqDZxln+PYJdBmBSdcsOuwUHCsyxoyyheNiUQNyCblvsuGCL/qNfYdH/kZYeBhmpHdyhBnfKc+lsNvAfc1QRbL53q1EaRLDd+lvushRiNuUBBt5BVZAIV5vQW9UhVj6i7cX7jbf5xP3KcotJ4TLVH+uOAA9FTIonL6TBOnbigKcsRg8zICdPlPDHUwGRz8lxUpjIUAKGyY+CZkvhOOO56OrmeO1bQTpsMaqn7x7zeRZ+KIFl2Zh0fU+twKwc87+giLI0aTeMty+3hdspXWOPKvSTmHKdouxO7F83jnN3KKMYFuU7wBMFKs1r0DSzmGiG6KPD8RmCQzpsAcJAMSPVX4MDxhrZsndUQ8fyeQQYcroammgAFX5CBAbyaWCFywUgTsyRtYaQnpoti+pSh1yZ8nZrFUt0EIf+3NRS0hC5tANOn9RngFu1RQkkVE0M9oJu1IMosp7MtnEhSm4ZcDBRoZ3s7psGcwxhGaVIyzfSVJnQnxbqNyIu13gFE8dJkfvHm4Tf18MQelt+YzZXyw=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3500.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(366004)(376002)(136003)(346002)(71200400001)(26005)(8936002)(6486002)(36756003)(5660300002)(83380400001)(53546011)(6506007)(86362001)(33656002)(4326008)(2616005)(66946007)(186003)(2906002)(316002)(66556008)(66476007)(66446008)(478600001)(64756008)(91956017)(6916009)(76116006)(6512007)(54906003)(966005)(8676002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?utf-8?B?a2pTU210SFBoZ3NwVDlUT2RqYy8zYWNIZTNLM0ljRDRKYWdLdTZEamhyV3VO?=
 =?utf-8?B?MytiTytNOStQaTRldUxSbER0MDFKWldSWHhJMVRCb2FyL2FkL21wRzZYdk5S?=
 =?utf-8?B?L0doY3FsZStxQ3piQnl1NjRyM0JoeGE2ZHBsWmFPK0lodFhyT1krMjFwTHpK?=
 =?utf-8?B?MDVJYmpyMnQwVGJWQ21oK01hUElaRVhNdkM4c1l6NWJON1d4U2FCSkdObEt5?=
 =?utf-8?B?T1F3c1VsQXhiOG0vQTZXQzI5RGlsKzNiUHVOVU1uUmhlOEVTQUh3ZUxjcHRp?=
 =?utf-8?B?dGhmckIvQjdPOGwwcHBlRGRjM3ZjVm0zdStOOGhXSlh6V1JnQk9JZXRpYXJB?=
 =?utf-8?B?MENrVExhMzViSC9senFWWWpDRGUzVWtJY0RPcHU0bjBHcFRDcWVhQ2hEaElq?=
 =?utf-8?B?MzFpUUJSL0RuS1U1Z3h5OFFtMnlGUzBPZi9OVFZqTk1wYWI2ODhZMkhXczVy?=
 =?utf-8?B?YlhRR1NlRDZJVUlDcDQxZHVkeUc3L1JYUU9LbytVRWxiSTdmS2c3Q1VKaVhL?=
 =?utf-8?B?djhtcllWUGwxUlpXaXJXMU5jN0ErOGdRRFdZUnFnb1pzd2ViOUYzY2pGZXll?=
 =?utf-8?B?Zjg3Q1RkTVFqVDgwYi9RRUlwTUc1Z3ZESFFJM2JhUC9Ja0MvQ0JtYWhwMkE1?=
 =?utf-8?B?WUZsNzB2S1h1ZlVzSGtmb09ZRmU0T2JMMXp1NmFhdzdvRzN1bVJYamMwT0dw?=
 =?utf-8?B?R1RSeUtPK0ZOaG5URklaa0NvS1lwQmhHeWZZUlVCVFhVaTlVOW5GRTBVZUpK?=
 =?utf-8?B?b0d1QnpPaVN2T2Nrd29mc1ZjZmMySTFoQldXaW1CczdzNlRUNkZMbVlldkV4?=
 =?utf-8?B?VnRUMTlTVDJJUExCWVBXM0JSaC9YaFExT1VEbUlmbElIenBhcktDMFFHQXlO?=
 =?utf-8?B?UDZMMTEyNTBsSGtNTGxER0tzNW9hak1NVDhBNmRpdElSUXd3WkJ5TzM4WEVV?=
 =?utf-8?B?TUpWNVoxY0FvUFRuakx4c3BkNHdtQTh3MThIeXZPdFA3RC8wenExUkowRVA4?=
 =?utf-8?B?Zk1iMFJBVjh2Q21wNVEyekRoOVFET3YwU1N6dXArRlhzL285Tm5HdFpLNm01?=
 =?utf-8?B?S254UkFoZW5QOVl5TTdSWDhncDFpbk83RFhiSU1pN0tpQWJLQmg4Ync3MDBG?=
 =?utf-8?B?VURsQkxya3hsL013Y3ZKL3JlMks2a3lXRldaYnhybEE0MitSZFRDaEhjSGND?=
 =?utf-8?B?YncrZjMzaDlrcVdQYzdLWGxRNFRyR1pkRlFiS2M4ODNuZk9NUjVBKzBIUGI1?=
 =?utf-8?B?d1h1dzYrZVlQTTdDdk81T25UeVVNWHBEVUZ1RjFqVCs1QXNLZDJkMWhkQXVn?=
 =?utf-8?B?TG4wdXJrSU4ySFdRbnREVVZ3K2xrQzBZWm55cEZ6MkRlTDJJblBQb0xsaVB2?=
 =?utf-8?B?WkUzemdCNjVpOVVmVmJXS25ob3NRWXBaN1R5aTZtNVUwMkhDaW95V0FlS1Y3?=
 =?utf-8?B?dVlWbDg0eDkxdU1DQUVzeEFPSmlrTzJjUkszdGNlMUtEQWVCVGtUc05wQ1lP?=
 =?utf-8?B?aXV4dUVkeHNUSTJTK3BaOVdmVVNpYlYvK1psOVVDMjB4dUM5U2JwczRvcmZv?=
 =?utf-8?B?eEVQVnZMZHhCMFg2WHdYMFNYOHc0S09PRmQzSFhoN2NyZ1orMmw4V3JHcXV6?=
 =?utf-8?B?OUNaRlU5QTljbmhUdjRHKzNGemc0QWlCYUQyampkVytBUHdYbHNCWmRvV1Mv?=
 =?utf-8?B?WjIzZEU4VnRlYmlXdDVNelhqYllpeWNqdktEb25wZjBWYmZaNVFSVFFmVVB0?=
 =?utf-8?Q?q3UMih/ef9qOBjAk6z3G+4s00jEIAc704l7vLIg?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <735D240996529D4E845AB207BC1169E8@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4630
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d891f881-1d72-4f51-5531-08d8ce8fc6ea
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ckd2QJJ4SOtXAHy536n53nDQ1GDotv53xYOwsl83uhE2zhhmCDJL351EJCwpoTeir8zLJU97wyR7Ic5/elS1I7n35myNWr+95fboCFWuDBMZgYK0xgLxI4eLrJy0fAtZ0ZFjq7pt5g+IAQ//rZPE1eqlvSLyVrVM5EPF4VwyP8kKk4Y3lCdqpfx0HG4WLwxK5Z19JqYtbk34XV95ZF/GY+XcBKwgxKO/cf+5Hib55Bq5/S1G3VPlN8n4CpmcuO1fXN5lRfW/pMVXH/1WzjurIYYYLpIFjScDdB0sQmFuv5NRrDhAyvZ/97AB50sARv7+pQ5D9KUKP5vXwn5v2PQAP0Owgkektwxcy+M/57SuGk/93wWWxab3SzbWhXo1OqbOzRJDBXKP8688EHZVNWzYt60K8wApMHlj5jWEYCSjPcly4VkraeTtVe2G4tT8RzzvY1lNSu4X7mVVz5XIG+UsjHGrhjJdZTJYmidHgHtCkJTbXLHc8Rftg4QHGG+xHbrweMNcZ2+r97QJakO0ypz4MaFaYoQTwQNT6ilHbGM5zCwZ5S3hYpii13Fy8RBLUEUOMMs3iBDWqMgm4zqJHu6eIiEytPvd+6v9nsY6Ev1YMGRjIR3CGM6wIUiLVl1Z3PtT7e3Xb/2FAVTXkItkZ1C0gsm0D6KPcjQqg3ZG6GU02rwwGcM7PP7AGJFwbyxmqx5AlPhMaq3u6OJ9BJw7f67Te0k7OYRDZ1Or2Bmh0M5+HGg=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(346002)(376002)(396003)(39860400002)(46966006)(36840700001)(316002)(54906003)(478600001)(186003)(70206006)(86362001)(36756003)(81166007)(26005)(33656002)(336012)(8676002)(47076005)(82310400003)(356005)(5660300002)(4326008)(82740400003)(2906002)(6512007)(8936002)(83380400001)(6862004)(53546011)(107886003)(36860700001)(70586007)(6486002)(6506007)(966005)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2021 13:20:27.0820
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 46f3dc8e-abcd-4637-0c4e-08d8ce8fcc07
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3463

SGVsbG8gSnVsaWVuLA0KDQo+IE9uIDEwIEZlYiAyMDIxLCBhdCA3OjUyIHBtLCBKdWxpZW4gR3Jh
bGwgPGp1bGllbkB4ZW4ub3JnPiB3cm90ZToNCj4gDQo+IA0KPiANCj4gT24gMTAvMDIvMjAyMSAx
ODowOCwgUmFodWwgU2luZ2ggd3JvdGU6DQo+PiBIZWxsbyBKdWxpZW4sDQo+Pj4gT24gMTAgRmVi
IDIwMjEsIGF0IDU6MzQgcG0sIEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+IHdyb3RlOg0K
Pj4+IA0KPj4+IEhpLA0KPj4+IA0KPj4+IE9uIDEwLzAyLzIwMjEgMTU6MDYsIFJhaHVsIFNpbmdo
IHdyb3RlOg0KPj4+Pj4gT24gOSBGZWIgMjAyMSwgYXQgODozNiBwbSwgU3RlZmFubyBTdGFiZWxs
aW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPiB3cm90ZToNCj4+Pj4+IA0KPj4+Pj4gT24gVHVl
LCA5IEZlYiAyMDIxLCBSYWh1bCBTaW5naCB3cm90ZToNCj4+Pj4+Pj4gT24gOCBGZWIgMjAyMSwg
YXQgNjo0OSBwbSwgU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPiB3
cm90ZToNCj4+Pj4+Pj4gDQo+Pj4+Pj4+IENvbW1pdCA5MWQ0ZWNhN2FkZCBicm9rZSBnbnR0YWJf
bmVlZF9pb21tdV9tYXBwaW5nIG9uIEFSTS4NCj4+Pj4+Pj4gVGhlIG9mZmVuZGluZyBjaHVuayBp
czoNCj4+Pj4+Pj4gDQo+Pj4+Pj4+ICNkZWZpbmUgZ250dGFiX25lZWRfaW9tbXVfbWFwcGluZyhk
KSAgICAgICAgICAgICAgICAgICAgXA0KPj4+Pj4+PiAtICAgIChpc19kb21haW5fZGlyZWN0X21h
cHBlZChkKSAmJiBuZWVkX2lvbW11KGQpKQ0KPj4+Pj4+PiArICAgIChpc19kb21haW5fZGlyZWN0
X21hcHBlZChkKSAmJiBuZWVkX2lvbW11X3B0X3N5bmMoZCkpDQo+Pj4+Pj4+IA0KPj4+Pj4+PiBP
biBBUk0gd2UgbmVlZCBnbnR0YWJfbmVlZF9pb21tdV9tYXBwaW5nIHRvIGJlIHRydWUgZm9yIGRv
bTAgd2hlbiBpdCBpcw0KPj4+Pj4+PiBkaXJlY3RseSBtYXBwZWQgYW5kIElPTU1VIGlzIGVuYWJs
ZWQgZm9yIHRoZSBkb21haW4sIGxpa2UgdGhlIG9sZCBjaGVjaw0KPj4+Pj4+PiBkaWQsIGJ1dCB0
aGUgbmV3IGNoZWNrIGlzIGFsd2F5cyBmYWxzZS4NCj4+Pj4+Pj4gDQo+Pj4+Pj4+IEluIGZhY3Qs
IG5lZWRfaW9tbXVfcHRfc3luYyBpcyBkZWZpbmVkIGFzIGRvbV9pb21tdShkKS0+bmVlZF9zeW5j
IGFuZA0KPj4+Pj4+PiBuZWVkX3N5bmMgaXMgc2V0IGFzOg0KPj4+Pj4+PiANCj4+Pj4+Pj4gICBp
ZiAoICFpc19oYXJkd2FyZV9kb21haW4oZCkgfHwgaW9tbXVfaHdkb21fc3RyaWN0ICkNCj4+Pj4+
Pj4gICAgICAgaGQtPm5lZWRfc3luYyA9ICFpb21tdV91c2VfaGFwX3B0KGQpOw0KPj4+Pj4+PiAN
Cj4+Pj4+Pj4gaW9tbXVfdXNlX2hhcF9wdChkKSBtZWFucyB0aGF0IHRoZSBwYWdlLXRhYmxlIHVz
ZWQgYnkgdGhlIElPTU1VIGlzIHRoZQ0KPj4+Pj4+PiBQMk0uIEl0IGlzIHRydWUgb24gQVJNLiBu
ZWVkX3N5bmMgbWVhbnMgdGhhdCB5b3UgaGF2ZSBhIHNlcGFyYXRlIElPTU1VDQo+Pj4+Pj4+IHBh
Z2UtdGFibGUgYW5kIGl0IG5lZWRzIHRvIGJlIHVwZGF0ZWQgZm9yIGV2ZXJ5IGNoYW5nZS4gbmVl
ZF9zeW5jIGlzIHNldA0KPj4+Pj4+PiB0byBmYWxzZSBvbiBBUk0uIEhlbmNlLCBnbnR0YWJfbmVl
ZF9pb21tdV9tYXBwaW5nKGQpIGlzIGZhbHNlIHRvbywNCj4+Pj4+Pj4gd2hpY2ggaXMgd3Jvbmcu
DQo+Pj4+Pj4+IA0KPj4+Pj4+PiBBcyBhIGNvbnNlcXVlbmNlLCB3aGVuIHVzaW5nIFBWIG5ldHdv
cmsgZnJvbSBhIGRvbVUgb24gYSBzeXN0ZW0gd2hlcmUNCj4+Pj4+Pj4gSU9NTVUgaXMgb24gZnJv
bSBEb20wLCBJIGdldDoNCj4+Pj4+Pj4gDQo+Pj4+Pj4+IChYRU4pIHNtbXU6IC9zbW11QGZkODAw
MDAwOiBVbmhhbmRsZWQgY29udGV4dCBmYXVsdDogZnNyPTB4NDAyLCBpb3ZhPTB4ODQyNGNiMTQ4
LCBmc3lucj0weGIwMDAxLCBjYj0wDQo+Pj4+Pj4+IFsgICA2OC4yOTAzMDddIG1hY2IgZmYwZTAw
MDAuZXRoZXJuZXQgZXRoMDogRE1BIGJ1cyBlcnJvcjogSFJFU1Agbm90IE9LDQo+Pj4+Pj4+IA0K
Pj4+Pj4+PiBUaGUgZml4IGlzIHRvIGdvIGJhY2sgdG8gc29tZXRoaW5nIGFsb25nIHRoZSBsaW5l
cyBvZiB0aGUgb2xkDQo+Pj4+Pj4+IGltcGxlbWVudGF0aW9uIG9mIGdudHRhYl9uZWVkX2lvbW11
X21hcHBpbmcuDQo+Pj4+Pj4+IA0KPj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBTdGVmYW5vIFN0YWJl
bGxpbmkgPHN0ZWZhbm8uc3RhYmVsbGluaUB4aWxpbnguY29tPg0KPj4+Pj4+PiBGaXhlczogOTFk
NGVjYTdhZGQNCj4+Pj4+Pj4gQmFja3BvcnQ6IDQuMTIrDQo+Pj4+Pj4+IA0KPj4+Pj4+PiAtLS0N
Cj4+Pj4+Pj4gDQo+Pj4+Pj4+IEdpdmVuIHRoZSBzZXZlcml0eSBvZiB0aGUgYnVnLCBJIHdvdWxk
IGxpa2UgdG8gcmVxdWVzdCB0aGlzIHBhdGNoIHRvIGJlDQo+Pj4+Pj4+IGJhY2twb3J0ZWQgdG8g
NC4xMiB0b28sIGV2ZW4gaWYgNC4xMiBpcyBzZWN1cml0eS1maXhlcyBvbmx5IHNpbmNlIE9jdA0K
Pj4+Pj4+PiAyMDIwLg0KPj4+Pj4+PiANCj4+Pj4+Pj4gRm9yIHRoZSA0LjEyIGJhY2twb3J0LCB3
ZSBjYW4gdXNlIGlvbW11X2VuYWJsZWQoKSBpbnN0ZWFkIG9mDQo+Pj4+Pj4+IGlzX2lvbW11X2Vu
YWJsZWQoKSBpbiB0aGUgaW1wbGVtZW50YXRpb24gb2YgZ250dGFiX25lZWRfaW9tbXVfbWFwcGlu
Zy4NCj4+Pj4+Pj4gDQo+Pj4+Pj4+IENoYW5nZXMgaW4gdjI6DQo+Pj4+Pj4+IC0gaW1wcm92ZSBj
b21taXQgbWVzc2FnZQ0KPj4+Pj4+PiAtIGFkZCBpc19pb21tdV9lbmFibGVkKGQpIHRvIHRoZSBj
aGVjaw0KPj4+Pj4+PiAtLS0NCj4+Pj4+Pj4geGVuL2luY2x1ZGUvYXNtLWFybS9ncmFudF90YWJs
ZS5oIHwgMiArLQ0KPj4+Pj4+PiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVs
ZXRpb24oLSkNCj4+Pj4+Pj4gDQo+Pj4+Pj4+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20t
YXJtL2dyYW50X3RhYmxlLmggYi94ZW4vaW5jbHVkZS9hc20tYXJtL2dyYW50X3RhYmxlLmgNCj4+
Pj4+Pj4gaW5kZXggNmY1ODViMTUzOC4uMGNlNzdmOWExYyAxMDA2NDQNCj4+Pj4+Pj4gLS0tIGEv
eGVuL2luY2x1ZGUvYXNtLWFybS9ncmFudF90YWJsZS5oDQo+Pj4+Pj4+ICsrKyBiL3hlbi9pbmNs
dWRlL2FzbS1hcm0vZ3JhbnRfdGFibGUuaA0KPj4+Pj4+PiBAQCAtODksNyArODksNyBAQCBpbnQg
cmVwbGFjZV9ncmFudF9ob3N0X21hcHBpbmcodW5zaWduZWQgbG9uZyBncGFkZHIsIG1mbl90IG1m
biwNCj4+Pj4+Pj4gICAgKCgoaSkgPj0gbnJfc3RhdHVzX2ZyYW1lcyh0KSkgPyBJTlZBTElEX0dG
TiA6ICh0KS0+YXJjaC5zdGF0dXNfZ2ZuW2ldKQ0KPj4+Pj4+PiANCj4+Pj4+Pj4gI2RlZmluZSBn
bnR0YWJfbmVlZF9pb21tdV9tYXBwaW5nKGQpICAgICAgICAgICAgICAgICAgICBcDQo+Pj4+Pj4+
IC0gICAgKGlzX2RvbWFpbl9kaXJlY3RfbWFwcGVkKGQpICYmIG5lZWRfaW9tbXVfcHRfc3luYyhk
KSkNCj4+Pj4+Pj4gKyAgICAoaXNfZG9tYWluX2RpcmVjdF9tYXBwZWQoZCkgJiYgaXNfaW9tbXVf
ZW5hYmxlZChkKSkNCj4+Pj4+Pj4gDQo+Pj4+Pj4+ICNlbmRpZiAvKiBfX0FTTV9HUkFOVF9UQUJM
RV9IX18gKi8NCj4+Pj4+PiANCj4+Pj4+PiBJIHRlc3RlZCB0aGUgcGF0Y2ggYW5kIHdoaWxlIGNy
ZWF0aW5nIHRoZSBndWVzdCBJIG9ic2VydmVkIHRoZSBiZWxvdyB3YXJuaW5nIGZyb20gTGludXgg
Zm9yIGJsb2NrIGRldmljZS4NCj4+Pj4+PiBodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51
eC92NC4zL3NvdXJjZS9kcml2ZXJzL2Jsb2NrL3hlbi1ibGtiYWNrL3hlbmJ1cy5jI0wyNTgNCj4+
Pj4+IA0KPj4+Pj4gU28geW91IGFyZSBjcmVhdGluZyBhIGd1ZXN0IHdpdGggInhsIGNyZWF0ZSIg
aW4gZG9tMCBhbmQgeW91IHNlZSB0aGUNCj4+Pj4+IHdhcm5pbmdzIGJlbG93IHByaW50ZWQgYnkg
dGhlIERvbTAga2VybmVsPyBJIGltYWdpbmUgdGhlIGRvbVUgaGFzIGENCj4+Pj4+IHZpcnR1YWwg
ImRpc2siIG9mIHNvbWUgc29ydC4NCj4+Pj4gWWVzIHlvdSBhcmUgcmlnaHQgSSBhbSB0cnlpbmcg
dG8gY3JlYXRlIHRoZSBndWVzdCB3aXRoICJ4bCBjcmVhdGXigJ0gYW5kIGJlZm9yZSB0aGF0LCBJ
IGNyZWF0ZWQgdGhlIGxvZ2ljYWwgdm9sdW1lIGFuZCB0cnlpbmcgdG8gYXR0YWNoIHRoZSBsb2dp
Y2FsIHZvbHVtZQ0KPj4+PiBibG9jayB0byB0aGUgZG9tYWluIHdpdGgg4oCceGwgYmxvY2stYXR0
YWNo4oCdLiBJIG9ic2VydmVkIHRoaXMgZXJyb3Igd2l0aCB0aGUgInhsIGJsb2NrLWF0dGFjaOKA
nSBjb21tYW5kLg0KPj4+PiBUaGlzIGlzc3VlIG9jY3VycyBhZnRlciBhcHBseWluZyB0aGlzIHBh
dGNoIGFzIHdoYXQgSSBvYnNlcnZlZCB0aGlzIHBhdGNoIGludHJvZHVjZSB0aGUgY2FsbHMgdG8g
aW9tbXVfbGVnYWN5X3ssIHVufW1hcCgpIHRvIG1hcCB0aGUgZ3JhbnQgcGFnZXMgZm9yDQo+Pj4+
IElPTU1VIHRoYXQgdG91Y2hlcyB0aGUgcGFnZS10YWJsZXMuIEkgYW0gbm90IHN1cmUgYnV0IHdo
YXQgSSBvYnNlcnZlZCBpcyB0aGF0IHNvbWV0aGluZyBpcyB3cml0dGVuIHdyb25nIHdoZW4gaW9t
bV91bm1hcCBjYWxscyB1bm1hcCB0aGUgcGFnZXMNCj4+Pj4gYmVjYXVzZSBvZiB0aGF0IGlzc3Vl
IGlzIG9ic2VydmVkLg0KPj4+IA0KPj4+IENhbiB5b3UgY2xhcmlmeSB3aGF0IHlvdSBtZWFuIGJ5
ICJ3cml0dGVuIHdyb25nIj8gV2hhdCBzb3J0IG9mIGVycm9yIGRvIHlvdSBzZWUgaW4gdGhlIGlv
bW11X3VubWFwKCk/DQo+PiBJIG1pZ2h0IGJlIHdyb25nIGFzIHBlciBteSB1bmRlcnN0YW5kaW5n
IGZvciBBUk0gd2UgYXJlIHNoYXJpbmcgdGhlIFAyTSBiZXR3ZWVuIENQVSBhbmQgSU9NTVUgYWx3
YXlzIGFuZCB0aGUgbWFwX2dyYW50X3JlZigpIGZ1bmN0aW9uIGlzIHdyaXR0ZW4gaW4gc3VjaCBh
IHdheSB0aGF0IHdlIGhhdmUgdG8gY2FsbCBpb21tdV9sZWdhY3lfeywgdW59bWFwKCkgb25seSBp
ZiBQMk0gaXMgbm90IHNoYXJlZC4NCj4gDQo+IG1hcF9ncmFudF9yZWYoKSB3aWxsIGNhbGwgdGhl
IElPTU1VIGlmIGdudHRhYl9uZWVkX2lvbW11X21hcHBpbmcoKSByZXR1cm5zIHRydWUuIEkgZG9u
J3QgcmVhbGx5IHNlZSB3aGVyZSB0aGlzIGlzIGFzc3VtaW5nIHRoZSBQMk0gaXMgbm90IHNoYXJl
ZC4NCj4gDQo+IEluIGZhY3QsIG9uIHg4NiwgdGhpcyB3aWxsIGFsd2F5cyBiZSBmYWxzZSBmb3Ig
SFZNIGRvbWFpbiAodGhleSBzdXBwb3J0IGJvdGggc2hhcmVkIGFuZCBzZXBhcmF0ZSBwYWdlLXRh
YmxlcykuDQo+IA0KPj4gQXMgd2UgYXJlIHNoYXJpbmcgdGhlIFAyTSB3aGVuIHdlIGNhbGwgdGhl
IGlvbW11X21hcCgpIGZ1bmN0aW9uIGl0IHdpbGwgb3ZlcndyaXRlIHRoZSBleGlzdGluZyBHRk4g
LT4gTUZOICggRm9yIERPTTAgR0ZOIGlzIHNhbWUgYXMgTUZOKSBlbnRyeSBhbmQgd2hlbiB3ZSBj
YWxsIGlvbW11X3VubWFwKCkgaXQgd2lsbCB1bm1hcCB0aGUgIChHRk4gLT4gTUZOICkgZW50cnkg
ZnJvbSB0aGUgcGFnZS10YWJsZS4NCj4gQUZBSUssIHRoZXJlIHNob3VsZCBiZSBub3RoaW5nIG1h
cHBlZCBhdCB0aGF0IEdGTiBiZWNhdXNlIHRoZSBwYWdlIGJlbG9uZ3MgdG8gdGhlIGd1ZXN0LiBB
dCB3b3JzZSwgd2Ugd291bGQgb3ZlcndyaXRlIGEgbWFwcGluZyB0aGF0IGlzIHRoZSBzYW1lLg0K
DQpTb3JyeSBJIHNob3VsZCBoYXZlIG1lbnRpb24gYmVmb3JlIGJhY2tlbmQvZnJvbnRlbmQgaXMg
ZG9tMCBpbiB0aGlzIGNhc2UgYW5kIEdGTiBpcyBtYXBwZWQuIEkgYW0gdHJ5aW5nIHRvIGF0dGFj
aCB0aGUgYmxvY2sgZGV2aWNlIHRvIERPTTANCg0KZGQgaWY9L2Rldi96ZXJvIG9mPXRlc3QuaW1n
IGJzPTEwMjQgY291bnQ9MCBzZWVrPTEwMjQNCnhsIGJsb2NrLWF0dGFjaCAwIHBoeTp0ZXN0Lmlt
ZyB4dmRhIHcNCg0KPiANCj4gQWx0aG91Z2gsIEkgYWdyZWUgdGhhdCB3ZSBtYXkgZW5kIHVwIHRv
IHJlbW92ZSB0aGUgZW50cnkgZWFybHkgYW5kIHRoZXJlZm9yZSB3ZSBjb3VsZCBnZXQgYW4gSU9N
TVUgZmF1bHQgKHRoaXMgaXMgbm90IHlvdXIgY2FzZSBoZXJlKS4gQnV0IHRoYXQncyBub3QgYW4g
QXJtLW9ubHkgcHJvYmxlbS4NCj4gDQo+PiBOZXh0IHRpbWUgd2hlbiBtYXBfZ3JhbnRfcmVmKCkg
dHJpZXMgdG8gbWFwIHRoZSBzYW1lIGZyYW1lIGl0IHdpbGwgdHJ5IHRvIGdldCB0aGUgY29ycmVz
cG9uZGluZyBHRk4gYnV0IHRoZXJlIHdpbGwgbm8gZW50cnkgaW4gUDJNIGFzIGlvbW11X3VubWFw
KCkgYWxyZWFkeSB1bm1hcHBlZCB0aGUgR0ZOIGJlY2F1c2Ugb2YgdGhhdCB0aGlzIGVycm9yIG1p
Z2h0IGJlIG9ic2VydmVkLg0KPiBJIGFtIGFmcmFpZCwgSSBkb24ndCB1bmRlcnN0YW5kIHdoYXQg
eW91IG1lYW4gYnkgInRyeSB0byBnZXQgdGhlIGNvcnJlc3BvbmRpbmcgR0ZOIi4gIENhbiB5b3Ug
Z2l2ZSBhIHBvaW50ZXIgdG8gdGhlIGNvZGU/DQoNCkkgbWVhbiB0byBzYXkgdG8gZ2V0IHRoZSBH
Rk4gZnJvbSBmcmFtZSAic3RydWN0IGdyYW50X2VudHJ5X3YxIHsg4oCmLiAuZnJhbWUgfSANCmh0
dHA6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9wPXhlbi5naXQ7YT1ibG9iO2Y9eGVuL2NvbW1v
bi9ncmFudF90YWJsZS5jO2g9MjgwYjc5NjliNmQ1ODIxMDEwNjc1MTgyZWFmMGVhMjlmYzMzMmRk
NDtoYj1IRUFEI2wxMTI0DQoNCj4gDQo+PiBTZXF1ZW5jZSBvZiBldmVudHMgdGhhdCByZXN1bHRz
IHRoZSBpc3N1ZSA6DQo+PiBnbnR0YWJfbWFwX2dyYW50X3JlZiAoR0ZOPWE5OWZiIE1GTj1hOTlm
YikNCj4gDQo+IENhbiB5b3UgY2xhcmlmeSB3aGV0aGVyIHRoZSBHRk4gaXMgZnJvbSB0aGUgbG9j
YWwgZG9tYWluIChlLmcuIGRvbTAvYmFja2VuZCkgb3IgdGhlIHJlbW90ZSBkb21haW4gKGUuZy4g
dGhlIGZyb250ZW5kKT8NCg0KQm90aCBiYWNrZW5kL2Zyb250ZW5kIGluIHRoZSBzYW1lIGRvbWFp
biBkb20wIC4NCj4gDQo+PiBhcm1faW9tbXVfbWFwX3BhZ2UoKSBET01JRDowIGRmbiA9IGE5OWZi
IG1mbiA9IGE5OWZiDQo+PiBnbnR0YWJfbWFwX2dyYW50X3JlZiAoIEdGTj1kOTkxMyBNRk49ZDk5
MTMpDQo+PiBhcm1faW9tbXVfbWFwX3BhZ2UoKSBET01JRDowIGRmbiA9IGQ5OTEzIG1mbiA9IGQ5
OTEzDQo+PiBnbnR0YWJfbWFwX2dyYW50X3JlZiAoIEdGTj1kOTg0NiBNRk49ZDk4NDYpDQo+PiBh
cm1faW9tbXVfbWFwX3BhZ2UoKSBET01JRDowIGRmbiA9IGQ5ODQ2IG1mbiA9IGQ5ODQ2DQo+PiBn
bnR0YWJfbWFwX2dyYW50X3JlZiAoR0ZOPWE4NDc0IE1GTj1hODQ3NCkNCj4+IGFybV9pb21tdV9t
YXBfcGFnZSgpIERPTUlEOjAgZGZuID0gYTg0NzQgbWZuID0gYTg0NzQNCj4+IGFybV9pb21tdV91
bm1hcF9wYWdlKCkgRE9NSUQ6MCBkZm4gPSBhOTlmYg0KPj4gYXJtX2lvbW11X3VubWFwX3BhZ2Uo
KSBET01JRDowIGRmbiA9IGQ5OTEzDQo+PiBhcm1faW9tbXVfdW5tYXBfcGFnZSgpIERPTUlEOjAg
ZGZuID0gZDk4NDYNCj4+IGFybV9pb21tdV91bm1hcF9wYWdlKCkgRE9NSUQ6MCBkZm4gPSBhODQ3
NA0KPj4gVHJ5IHRvIG1hcCB0aGUgc2FtZSBmcmFtZSB0aGF0IGlzIHVubWFwcGVkIGVhcmxpZXIg
YnkgaW9tbXVfdW5tYXAgY2FsbCgpDQo+PiBnbnR0YWJfbWFwX2dyYW50X3JlZiAoR0ZOPWE5OWZi
IE1GTj0weGZmZmZmZmZmKS4tPiBOb3QgYWJsZSB0byBmaW5kIHRoZSBHRk4gaW4gcDJtIGVycm9y
IGlzIG9ic2VydmVkIGFmdGVyIHRoYXQuDQo+IA0KPiBUaGUgaW9tbXVfbWFwKCkvaW9tbXVfdW5t
YXAoKSBzaG91bGQgb25seSBtb2RpZnkgdGhlIGRvbTAgUDJNLiBJdCBzaG91bGQgbm90IG1vZGlm
eSB0aGUgZ3Vlc3QgUDJNLg0KDQpZZXMgYXMgaW4gdGhpcyBjYXNlIGJhY2tlbmQvZnJvbnRlbmQg
aW4gc2FtZSBkb20wIHRoYXQgd2h5IFAyTSBpcyBtb2RpZmllZC4NCj4gDQo+IFdoZW4gRG9tMCBp
c3N1ZSBhIHJlcXVlc3QgdG8gbWFwIGEgZ3JhbnQgd2Ugd2lsbDoNCj4gIDEpIExvb2stdXAgdGhl
IGd1ZXN0IFAyTSB0byBmaW5kIHRoZSBjb3JyZXNwb25kaW5nIE1GTg0KPiAgMikgRG8gYWxsIHRo
ZSBzYW5pdHkgY2hlY2sNCj4gIDMpIE1hcCB0aGUgcGFnZSBpbiBkb20wJ3MgUDJNIGF0IHRoZSBh
ZGRyZXNzIHJlcXVlc3RlZCAoaG9zdF9hZGRyKQ0KPiAgNCkgSXNzdWUgaW9tbXVfbWFwKCkgdG8g
Z2V0IGEgMToxIG1hcHBpbmcgaW4gdGhlIFAyTQ0KPiANCj4gU28gYXJlIHlvdSBzYXlpbmcgdGhh
dCB0aGUgZ3Vlc3QgUDJNIHdhbGsgaGFzIGZhaWxlZD8NCg0KTm8uIEkgbWVhbiB0byBzYXkgR0ZO
IGlzIHVubWFwcGVkIGJ5IGlvbW11X3VubWFwKCkgIGVhcmxpZXIgYW5kIGxhdGVyIHBvaW50IG9m
IHRpbWUgd2hlbiB3ZSBnZXQgdGhlIHJlcXVlc3QgdG8gbWFwIHRoZSBzYW1lIGZyYW1lIHRoYXQg
aXMgZmFpbGVkIGFzIHdlIHdpbGwgbm90IGJlIGFibGUgdG8gZ2V0IEdGTiBmcm9tIGZyYW1lIGdl
dF9wYWdlZF9mcmFtZSgpIGluIGZ1bmN0aW9uIG1hcF9ncmFudF9yZWYoKS4NCg0KUmVnYXJkcywN
ClJhaHVsDQo+IENoZWVycywNCj4gDQo+IC0tIA0KPiBKdWxpZW4gR3JhbGwNCg0K

