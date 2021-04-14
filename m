Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1BB35F19B
	for <lists+xen-devel@lfdr.de>; Wed, 14 Apr 2021 12:43:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.110478.210875 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWczN-0002LA-A9; Wed, 14 Apr 2021 10:43:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 110478.210875; Wed, 14 Apr 2021 10:43:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWczN-0002Kl-6Y; Wed, 14 Apr 2021 10:43:17 +0000
Received: by outflank-mailman (input) for mailman id 110478;
 Wed, 14 Apr 2021 10:43:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qIqP=JL=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1lWczL-0002Kg-Jj
 for xen-devel@lists.xenproject.org; Wed, 14 Apr 2021 10:43:15 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.5.61]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b8263b61-75ca-43a9-92b2-9a1c2cf7c79d;
 Wed, 14 Apr 2021 10:43:13 +0000 (UTC)
Received: from AM6P191CA0072.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:7f::49)
 by DB7PR08MB3835.eurprd08.prod.outlook.com (2603:10a6:10:75::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.16; Wed, 14 Apr
 2021 10:43:08 +0000
Received: from AM5EUR03FT048.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:7f:cafe::9) by AM6P191CA0072.outlook.office365.com
 (2603:10a6:209:7f::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17 via Frontend
 Transport; Wed, 14 Apr 2021 10:43:08 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT048.mail.protection.outlook.com (10.152.17.177) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.17 via Frontend Transport; Wed, 14 Apr 2021 10:43:07 +0000
Received: ("Tessian outbound 34291f7cb530:v90");
 Wed, 14 Apr 2021 10:43:07 +0000
Received: from 10e18552462c.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 44E8F6D5-F7CC-4815-B0AF-F2353F4C6080.1; 
 Wed, 14 Apr 2021 10:42:47 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 10e18552462c.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 14 Apr 2021 10:42:47 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com (2603:10a6:10:49::10)
 by DB8PR08MB5481.eurprd08.prod.outlook.com (2603:10a6:10:114::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17; Wed, 14 Apr
 2021 10:42:42 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::5959:35df:3647:b78d]) by DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::5959:35df:3647:b78d%7]) with mapi id 15.20.4020.022; Wed, 14 Apr 2021
 10:42:42 +0000
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
X-Inumbo-ID: b8263b61-75ca-43a9-92b2-9a1c2cf7c79d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=97+r0VYzpHG4ENn7zvufoj9jrCt3fG5nukxidD6KqgM=;
 b=VlC2FF1jq4pbYDsKk+7DBKhyMxGwivqavlfpTFCVEBMGsvNwzwQLiQd0Dp2xVUa02cVsmD3puemIsiz94RXrddlE3eqUvJ3v2o264RAY5h+8yzYFr0P8nUe63tKmz4q/9BcVf35NsjzbDHGf5AihCF9ym3rE4B0eknNQKYlrCAg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: b879b3ed0ba67454
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lIlxx/o4HO/yFY28nS/7qZgfM+Z8jK/3ATIVONkNZS48x3sR92gTHlZzJ0WY6Lm8oZJLCEEloZBno1GQdKG3EF58yYivMIkzYX898WU32RDCJrdtetq8xZF/M84c6U1vJkxDMEQyTjz+bKXj0acaX3z+YRAN+sgUhpTU1naR4/vdwLyTETvc0H2xQqH61m++VUiKUdGqe+Nw54rBmd7Z6M4SSJkj2sO4FYqXylwwTXcWsiqYRPk52L4VZWQhQZ8F78u9t1cofmbhxbxdqy3ND7dq2xsZIE9ScTHXpkPDrmIWzN3lFg1JvMoZR19nEpyXzZWb2zeaTKxcD4Q0uOy/kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=97+r0VYzpHG4ENn7zvufoj9jrCt3fG5nukxidD6KqgM=;
 b=kIXBZgrn8AImD21VLvh2Z344nsstzq/oPRKU9g57YiFrau+i2oo5Z9vhwFH38yVZvBCLwq1u5YUiae82JHbxlw150G3K9VQffIXdqfBDUZz5rfrvKJq4/e31fIgsrvEtS41gC0CQaMDcRv8GigJK3tO/lbVzNBQPGV8NcG45ekV15Db4Oh7nEzKB+19Vl+9p5z/t7A2zLXF8ftU1HiLJbAooHQs7i+RNGLsK0PrYgu76kJh+11PG8LZoZGkWtIchz1PoKPeXdp5wkhwtNdat0EF599Jr95rd4wE607sLXSsG2/kfDLrYU+2j5GvCmq31sZHRBXns/3cPgjNDkK5u5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=97+r0VYzpHG4ENn7zvufoj9jrCt3fG5nukxidD6KqgM=;
 b=VlC2FF1jq4pbYDsKk+7DBKhyMxGwivqavlfpTFCVEBMGsvNwzwQLiQd0Dp2xVUa02cVsmD3puemIsiz94RXrddlE3eqUvJ3v2o264RAY5h+8yzYFr0P8nUe63tKmz4q/9BcVf35NsjzbDHGf5AihCF9ym3rE4B0eknNQKYlrCAg=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>, xen-devel <xen-devel@lists.xenproject.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, "brian.woods@xilinx.com"
	<brian.woods@xilinx.com>
Subject: Re: [PATCH v3 0/3] Generic SMMU Bindings
Thread-Topic: [PATCH v3 0/3] Generic SMMU Bindings
Thread-Index:
 AQHW9DbnaDtcsjSAAUiKSXHzYBU+iaqmdrkAgAIitwCABL7WAIADyieAgADsxACAAj4sAA==
Date: Wed, 14 Apr 2021 10:42:42 +0000
Message-ID: <08200F6C-F266-4055-B7D9-8D927C4BCFF2@arm.com>
References: <alpine.DEB.2.21.2101261435550.2568@sstabellini-ThinkPad-T480s>
 <80de3eb5-b338-af4e-42eb-d358f51d0bd7@xen.org>
 <alpine.DEB.2.21.2104061606080.31460@sstabellini-ThinkPad-T480s>
 <alpine.DEB.2.21.2104091714270.4885@sstabellini-ThinkPad-T480s>
 <A64881AF-DAD6-4A14-A545-354A75FE1B4F@arm.com>
 <alpine.DEB.2.21.2104121724090.4885@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2104121724090.4885@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [80.1.41.211]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: c2f7742e-d2ca-4e84-d290-08d8ff321766
x-ms-traffictypediagnostic: DB8PR08MB5481:|DB7PR08MB3835:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<DB7PR08MB383545501599261D8768C4C5FC4E9@DB7PR08MB3835.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 sd7+wi9iU9SG1C4Sn1O7AmRNjFh3dAszLLgk20G/LyhDgXz37tfmIM6ouG0EbGmlDHnqOUSBfq/5fvqT+2daw0DUmiGonQGgWBGFNl9Ml7cVzV9tlmwEMsSRgSTynmy/Cr2dV5VFAPNntIdm7/4lWQHt4p5OdXdOuqO003X/u6BZ5MTPIeScpEOU/o7Gt19gt1cky5JYJI+NBcbRX3ZuoAWehU7L7RsoNrVMjKwQc32h6TlD1i+6/6cJigs1afMQphsnvfdA1Qf12qVnKdjmBD0iAP4y4xWWJiFJQJQCWTq8d0w6lV0V1gdeG5/U8FySTCd9ZSXAf5mhSTZdRGvOB3IQ3lakn3X98LSuRijvggPfwDsiqx+cZETNbjHS8ittwMiI8tb2mDgVdofw1I/TZsMi7qi24eMzcXQyd4rZoljWbAsyO1Nf9clWdaDfoO6v49XdUGi+ZYJPV0s/GcM2YvSoYqf4rnDVCG/ZUixuIUdh9NOVZ2RnYMMIEJrCSwQprREn7ScuANxnJ6u+gsaF7nLROoYtMJ/NJVxdxPejCNRti2cYT4Em6St12caBjSVufXo/6Ocb0y/q5Mb4EZWBCrEz2QbYZdQZjIj4Gwzd+jHvWhXQeGKBZJhdPDNOQcDDSFxhCey9U7rq5kLnxpbZEu4/MWzJ6PIXWHFlBte2+GLxiD6Q0WPKJ9RsuzfdcaNSTFkdPKBsIr/CzE8g17rZOnouscPl4+VxlDLuPxEbQ9zq4PkhaG1fK0LtABnQDPTPPjyj8LALPyExyhqW+uTIQKiK4bjny+5/k5aKDDk+JQQ=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3500.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(136003)(39860400002)(346002)(366004)(71200400001)(83380400001)(6916009)(76116006)(86362001)(54906003)(8936002)(91956017)(38100700002)(6512007)(53546011)(478600001)(6486002)(5660300002)(66946007)(316002)(66556008)(186003)(26005)(66446008)(8676002)(122000001)(36756003)(2906002)(966005)(33656002)(66476007)(64756008)(2616005)(6506007)(4326008)(41533002)(45980500001)(6606295002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?utf-8?B?SHl5YXVFZ0hYdEJMcE1qNUFvblFyWHFISGhjU0srM2puRks0NEZETVMycXpY?=
 =?utf-8?B?WVlhcktEdFF4bXU0eitBS1J0ZVVzdVVVTkZVNnIyeWMvK3JodnVGcWtLRnUz?=
 =?utf-8?B?SmFWN1VWVG5QQVVObWZqQ2xzY3Iza3BHenlGc2lOUHZIRnlRK3hJMWxzMk9K?=
 =?utf-8?B?YjRHT1dHdjF0VGxVYnd1NlJKU0Npb3hrYzh4WEFBWEhoMXhGQkZtWXFzUkR0?=
 =?utf-8?B?MlJIQkRvOUoxM2JoOG1aRXVhVGxMdU9EbDNocjNDaDViaHlXdXZPOHhFTnQ5?=
 =?utf-8?B?VnBUQ3hKd3oyNWZ4OGxQUGFwcTIrOFBleWIycTZ1Q3RvZTdkdVkvL21Db053?=
 =?utf-8?B?UW9jSUFoWDF1MHNTRjVmV1pJVklMK1dIaFNmSWlZdHVVbklGY3ZFQzN0S3Rl?=
 =?utf-8?B?UXNka1gzVHE4TTZHbFZaLzBJRkNlYWJISDhjc2dnWFY1SjByWjRVK2QyeFI3?=
 =?utf-8?B?U2U2MmdLRC9SZGVoQ2Z1VEpVTXJTQ3Ura1JtY1ZWbDk2bWlRQll1RSt1K1JI?=
 =?utf-8?B?aWcrSm9qdWdoYlJTbmdHK29SUC8rTm50Q01yWGRmZ0FKOHFwR3VnSWpKN1ls?=
 =?utf-8?B?a1lzU0xjVDZzZWpsTGRnZk1GbkIxaGhFaDZEY1ZlYXMvejkzbUMydnpWbUdn?=
 =?utf-8?B?TjF0WnRPaFpMbWMwRkhEZzVNcU5KUExHRGhPTnY0Tk5kMEJLRzRWazBONWJZ?=
 =?utf-8?B?VXZyRVlnVGNzNm1JTXpHMVBoVHkyd2pDOXlQbEpkUlBsMkJKT0xYUnd4RHlu?=
 =?utf-8?B?eE9tUitsVFgwWDBjVi85OFNaR3lDTEZXdE4zV2xicFk3S1R2eHphSm9zb3FX?=
 =?utf-8?B?UitUVjRjZFhGWnk3NUdJNTUvakVJcHkwSXdPOHNURXFXQ29rU3hZSE4zcDU0?=
 =?utf-8?B?a1E0MThtQ1E3VWY4QVo1SUNWcDh3UzZOdU40MFNwdk5XbC9sUEhmaWNlQ2hh?=
 =?utf-8?B?RDNJTEdudmkxS3d4V24wUzVPdlN0L3Z2ZytaanZvLyt0ZlFGQUFNKzNKZml6?=
 =?utf-8?B?aURJWXc4NzNCeVBiekgrWTZnN1hYUll6ZzB2Y0UrNFVOMDRvRWRWbzBweUtw?=
 =?utf-8?B?YmhQTGY1ZnloN2Eyc2JNa3hUTmpFRkMrZi9UUTY2TlJOOEJQOEcvbnBtMGNQ?=
 =?utf-8?B?SDAxN25oenZ5Y2hyVVhLdjZsMlc2RW54dU5wSmthSG5MSFdaMXBTT2l2RzF0?=
 =?utf-8?B?TmFGeDQ5TjRpYVNwQWN5WUxpcjZwRHlDVmd2SEF4dnMxZ2hwZDdtRW01RVVC?=
 =?utf-8?B?cXdCdFhMbmFVNjdsakQvZUpEcW1hR0FzMnlCZkdzMHllY3Z4QlZLaDNkQldL?=
 =?utf-8?B?djZSZnh3Tnh0ZkZrekZsc2VUb2JMeGdyQjVyOWdvSFJCUksrdGNyTmNrSGhJ?=
 =?utf-8?B?ZlV2TGlnazQ1ajJIdW11RzYyRzVOU2ZmSUNNYW9DSEFHQ0JldjN4WkwwbWxj?=
 =?utf-8?B?Snp4aEM3azAzLzVzWGhGTHljcmxFK0lzUHYwSm1jUTBmNElRZjV4U24rZGN3?=
 =?utf-8?B?ZTRKQmN0akdHNGRTb3JmWFRMcEJRclFHaVJjbjdhUEZVOUJNRnZOVjR0UThI?=
 =?utf-8?B?YkVuR1NSaVoxVTNpM0dRbWp0ODFZb0xjRTFid0FTWDhxUXdOM2F5UC80Sy9J?=
 =?utf-8?B?TWxKb3JadHFyNHJFZnJVd3VDTWlhaGxPdDBNVGhvQzBTdzhRaDNPWVhpOXpE?=
 =?utf-8?B?dTZhaEx5Wi9YNCsxVG15cEgxNkN3Mkh6eGZxbUNvV2ZyRGZqZXdTVG9HWDJM?=
 =?utf-8?Q?YreFfagwEHW6fVodE8NRuiT52JEsBlGkRFQQKJu?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7A6B1B9E8D0B49408C588D83AAD0C3E3@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5481
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3743657d-08fe-44d6-51fb-08d8ff320853
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5ATZIFuBMyXV2z137MOTAhB8uhhuN0w8tqpa8nQ6ryr/80Xb993vD+d70MXZ7pEd+RzpAzGEaqlAMssWp59VSNFYFf6il7yJ/ljGVhE7FAUUdfYh09eKL0dUY9Qi6Auhzb/K7h/zsFQYfm2b4FTHunkjEFYYKO/UVq0TGoMk264YqcxmsPmhX9mlFgIdwXCDoVeavCoTJdN8P68bcDRDeU0KIEWsgBjbjNsZBGSsYHh7GTN8vLnoEo96FOPDIETWNdfmkieQTkX/0ZaeEJD0cJm3elxnqfdixWwG0kL6lXlmE0hf2znMlMQAdLqlFP5iSux7gnMIR+/avHJfslcVp4JuyXvpSZ39M8+MKkc1SyTi9D/eI8pPeCxCZhaTt89xzWdkiwPMKW2p9vu3W2WB/mrT5rbxWTJde2z/kQLiTtHW/pdgratxyQDn4qm4pKr9Uu6+OGwnLmXC0TPJM1M9rnzHPoGmNLVTYQzxKKUzq5FZ14ExRFj/yRF/gogYNczVuEs/5DntH2xpEUpkY2TAgns6FFY9HvPfuo5sur27hMajsNws1RMnMNm19Jcn1A0z7UmAZ4seEMBy27HQDfo8/MAxlgRX7WQAtJMpvMCwDmrvWdsmkkjmWxM9dSTK3T3YgPd9pq4t1T1sAXVxI8hlwwyB7op75Irc69JuA+XpfK292v19xK74Y0D6Y3lmU35X5ZhAXaw9QGmjHQmvNE2/fWe9GB1aqeZg92BOWX9MpAwl9x5VloxG5GI92njSTiuCD5cHalWOh96duj5xaG0fSs1MuTmOJIpHk0KxblwZ1tw=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(396003)(376002)(346002)(136003)(46966006)(36840700001)(6512007)(26005)(82740400003)(478600001)(6506007)(36860700001)(70206006)(53546011)(316002)(966005)(86362001)(6862004)(70586007)(81166007)(8676002)(54906003)(47076005)(83380400001)(2616005)(5660300002)(4326008)(2906002)(186003)(336012)(6486002)(356005)(107886003)(33656002)(8936002)(36756003)(82310400003)(41533002)(6606295002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2021 10:43:07.8337
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c2f7742e-d2ca-4e84-d290-08d8ff321766
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3835

SEkgU3RlZmFubywNCg0KPiBPbiAxMyBBcHIgMjAyMSwgYXQgMToyNyBhbSwgU3RlZmFubyBTdGFi
ZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPiB3cm90ZToNCj4gDQo+IE9uIE1vbiwgMTIg
QXByIDIwMjEsIFJhaHVsIFNpbmdoIHdyb3RlOg0KPj4gSGkgU3RlZmFubywNCj4+IA0KPj4+IE9u
IDEwIEFwciAyMDIxLCBhdCAxOjI3IGFtLCBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5p
QGtlcm5lbC5vcmc+IHdyb3RlOg0KPj4+IA0KPj4+IE9uIFR1ZSwgNiBBcHIgMjAyMSwgU3RlZmFu
byBTdGFiZWxsaW5pIHdyb3RlOg0KPj4+PiBPbiBNb24sIDUgQXByIDIwMjEsIEp1bGllbiBHcmFs
bCB3cm90ZToNCj4+Pj4+IE9uIDI2LzAxLzIwMjEgMjI6NTgsIFN0ZWZhbm8gU3RhYmVsbGluaSB3
cm90ZToNCj4+Pj4+PiBIaSBhbGwsDQo+Pj4+PiANCj4+Pj4+IEhpIFN0ZWZhbm8sDQo+Pj4+PiAN
Cj4+Pj4+PiBUaGlzIHNlcmllcyBpbnRyb2R1Y2VzIHN1cHBvcnQgZm9yIHRoZSBnZW5lcmljIFNN
TVUgYmluZGluZ3MgdG8NCj4+Pj4+PiB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vc21tdS5j
Lg0KPj4+Pj4+IA0KPj4+Pj4+IFRoZSBsYXN0IHZlcnNpb24gb2YgdGhlIHNlcmllcyB3YXMNCj4+
Pj4+PiBodHRwczovL21hcmMuaW5mby8/bD14ZW4tZGV2ZWwmbT0xNTk1MzkwNTM0MDY2NDMNCj4+
Pj4+IFNvbWUgY2hhbmdlcyBpbiB0aGUgU01NVSBkcml2ZXJzIHdlbnQgaW4gcmVjZW50bHkuIEkg
YmVsaWV2ZSB0aGlzIHRvdWNoZWQNCj4+Pj4+IHNpbWlsYXIgYXJlYSB0byB0aGlzIHNlcmllcy4g
V291bGQgeW91IGJlIGFibGUgdG8gY2hlY2sgdGhhdCB0aGlzIHNlcmllcyBzdGlsbA0KPj4+Pj4g
d29yayBhcyBpbnRlbnRlZD8NCj4+Pj4gDQo+Pj4+IFRoYW5rcyBmb3IgdGhlIGhlYWRzIHVwLCBu
bywgdW5mb3J0dW5hdGVseSB0aGV5IGRvbid0IHdvcmsgOi0oDQo+Pj4+IA0KPj4+PiBUaGV5IGJh
ZGx5IGNsYXNoLiBJIGRpZCB0aGUgZm9yd2FyZCBwb3J0IG9mIHRoZSB0aHJlZSBwYXRjaGVzIGJ1
dCB0aGV5DQo+Pj4+IGZhaWwgYXQgcnVudGltZSBpbiBteSB0ZXN0cy4gSSByYW4gb3V0IG9mIHRp
bWUgdG8gZmlndXJlIG91dCB3aGF0IGlzIHRoZQ0KPj4+PiBwcm9ibGVtLCBhbmQgSSdsbCBoYXZl
IHRvIHBpY2sgaXQgdXAgYXQgc29tZSBwb2ludCBpbiB0aGUgZnV0dXJlIChpdA0KPj4+PiBtaWdo
dCBub3QgYmUgYW55IHRpbWUgc29vbiB1bmZvcnR1bmF0ZWx5KS4NCj4+Pj4gDQo+Pj4+IFJhaHVs
LCBpZiB5b3UgaGF2ZSBhbnkgaWRlYXMgYWJvdXQgd2hhdCB0aGUgcHJvYmxlbSBpcyBwbGVhc2Ug
bGV0IG1lDQo+Pj4+IGtub3cuIFRoaXMgaXMgdGhlIGJyYW5jaCB3aXRoIHRoZSBmb3J3YXJkIHBv
cnQ6DQo+Pj4+IA0KPj4+PiBodHRwOi8veGVuYml0cy54ZW5wcm9qZWN0Lm9yZy9naXQtaHR0cC9w
ZW9wbGUvc3N0YWJlbGxpbmkveGVuLXVuc3RhYmxlLmdpdCBzbW11LWdlbmVyaWMNCj4+PiANCj4+
PiBJIGRpZCBzb21lIG1vcmUgaW52ZXN0aWdhdGlvbiBhbmQgc3BvdHRlZCBhIG1pbm9yIGVycm9y
IGluIG15IGZvcndhcmQNCj4+PiBwb3J0LiBUaGlzIGFuIHVwZGF0ZWQgYnJhbmNoIGJhc2VkIG9u
IHN0YWdpbmc6DQo+Pj4gDQo+Pj4gaHR0cDovL3hlbmJpdHMueGVucHJvamVjdC5vcmcvZ2l0LWh0
dHAvcGVvcGxlL3NzdGFiZWxsaW5pL3hlbi11bnN0YWJsZS5naXQgc21tdS1nZW5lcmljLTINCj4+
PiANCj4+PiBIb3dldmVyLCB0aGUgcmVhbCBpc3N1ZSBpcyB0aGF0IFJhaHVsJ3MgcGF0Y2hlcyBi
cmVhayBTTU1VIHN1cHBvcnQgb24NCj4+PiBaeW5xTVAgZXZlbiB3aXRob3V0IG15IGNoYW5nZXMu
IEkgcmFuIGEgYmlzZWN0aW9uIGFuZCBmb3VuZCBvdXQgdGhhdA0KPj4+IHBhdGNoICMyIGlzIHRo
ZSBjdWxwcml0Og0KPj4+IA0KPj4+IDVlZTNmYTBiMjFlYSB4ZW4vYXJtOiBzbW11djE6IENvbnNv
bGlkYXRlIHN0cmVhbSBtYXAgZW50cnkgc3RhdGUNCj4+PiANCj4+PiBJdCBjYXVzZXMgdGhlIGFi
b3J0IGFwcGVuZGVkIGJlbG93LiBUaGUgcHJvYmxlbSBkb2Vzbid0IHNlZW0NCj4+PiBwYXJ0aWN1
bGFybHkgWnlucU1QIHNwZWNpZmljLiBSYWh1bCwgY2FuIHlvdSByZXByb2R1Y2UgaXQgb24geW91
ciBzaWRlPw0KPj4gDQo+PiBZZXMuIEkgY2FuIHJlcHJvZHVjZSB0aGUgaXNzdWUgb24gWGlsaW54
IFFFTVUgYXMgd2UgZG9u4oCZdCBoYXZlIGFjY2VzcyB0byBwaHlzaWNhbCBaeW5xTVAgYW5kIGZv
dW5kIG91dCB0aGF0DQo+PiBhc3NvY2lhdGluZyBhbiBpb21tdSBncm91cCBwb2ludGVyIHdpdGgg
dGhlIFMyQ1IgY2F1c2luZyB0aGUgaXNzdWUuDQo+PiANCj4+IEFzc29jaWF0aW5nIHRoZSBncm91
cCBwb2ludGVyIHdpdGggUzJDUiBpcyBwYXJ0IG9mIHRoZSBwYXRjaCAieGVuL2FybTogc21tdXYx
OiBJbnRlbGxpZ2VudCBTTVIgYWxsb2NhdGlvbuKAnS4NCj4+IA0KPj4gSSBqdXN0IHJldmVydCB0
aGF0IHBhcnQgb2YgdGhlIGNvZGUgZnJvbSB0aGUgcGF0Y2ggYW5kIGl0IHdvcmtzIGZpbmUgZm9y
IG1lLiBQbGVhc2UgZmluZCB0aGUgYXR0YWNoZWQgcGF0Y2ggZm9yIHRoZSBzYW1lLg0KPj4gDQo+
PiBBcyBwZXIgeW91ciBhbmFseXNpcyAiNWVlM2ZhMGIyMWVhIHhlbi9hcm06IHNtbXV2MTogQ29u
c29saWRhdGUgc3RyZWFtIG1hcCBlbnRyeSBzdGF0ZeKAnSBpcyBjYXVzaW5nIHRoZSBpc3N1ZSBi
dXQgd2hhdCBJIGZvdW5kIG91dCB0aGF0DQo+PiAieGVuL2FybTogc21tdXYxOiBJbnRlbGxpZ2Vu
dCBTTVIgYWxsb2NhdGlvbuKAnSBpcyBjYXVzaW5nIHRoZSBpc3N1ZS4NCj4+IENhbiB5b3UgcGxl
YXNlIHRlc3QgaXQgb24gdGhlIHBoeXNpY2FsIGRldmljZSBhbmQgbGV0IG1lIGtub3cgaWYgaXQg
d29ya3MgZm9yIHlvdSBhbHNvIHRvIG1ha2Ugc3VyZSB3ZSBib3RoIG9ic2VydmluZyB0aGUgc2Ft
ZSBpc3N1ZS4NCj4gDQo+IEdyZWF0ISBZZXMsIEkgY2FuIGNvbmZpcm0gdGhhdCB5b3VyIHBhdGNo
IGZpeGVkIHRoZSBpc3N1ZSwgbm93IEkgY2FuDQo+IGJvb3Qgc3RhZ2luZyBvbiBaeW5xTVAgd2l0
aG91dCBlcnJvcnMgYW5kIEkgY2FuIGRvIGRldmljZSBhc3NpZ25tZW50DQo+IHRvby4gVGhhbmsg
eW91IHNvIG11Y2ghDQo+IA0KPiBUaGUgb3RoZXIgZ29vZCBuZXdzIGlzIHRoYXQgdGhlIHRocmVl
ICJHZW5lcmljIFNNTVUgQmluZGluZ3MiIHBhdGNoZXMNCj4gd29yayB0b28gb24gdG9wIG9mIHlv
dXJzIHdpdGggdGhlIGZpeCENCj4gDQo+IElzIHRoZSBwYXRjaCB5b3Ugc3VibWl0dGVkIHRoZSB2
YWxpZCBmaXggZm9yIHRoZSBwcm9ibGVtPyBJbiBvdGhlciB3b3JkcywNCj4gc2hvdWxkIHdlIGdv
IGFoZWFkLCByZXZpZXcsIGFuZCBjb21taXQgdGhlIHBhdGNoIHlvdSBhdHRhY2hlZCBvciBkbyB5
b3UNCj4gd2FudCB0byBzZW5kIGEgZGlmZmVyZW50IHZlcnNpb24gb2YgdGhlIHBhdGNoIGZvciBp
bmNsdXNpb24gaW4gWGVuDQo+IHN0YWdpbmc/DQoNClRoYW5rIHlvdSBmb3IgdGVzdGluZyB0aGUg
cGF0Y2guIFBhdGNoIGFzIGl0IGlzIG9rIGZvciByZXZpZXcuIEkgd2lsbCBzZW5kIHRoZSBwYXRj
aCBmb3IgcmV2aWV3Lg0KDQpSZWdhcmRzLA0KUmFodWwNCg0K

